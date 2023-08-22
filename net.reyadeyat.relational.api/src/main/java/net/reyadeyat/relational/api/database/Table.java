/*
 * Copyright (C) 2023 Reyadeyat
 *
 * Reyadeyat/RELATIONAL.API is licensed under the
 * BSD 3-Clause "New" or "Revised" License
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * https://reyadeyat.net/LICENSE/RELATIONAL.API.LICENSE
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package net.reyadeyat.relational.api.database;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import java.io.OutputStream;
import net.reyadeyat.relational.api.data.ModelDefinition;
import net.reyadeyat.relational.api.data.DataClass;
import net.reyadeyat.relational.api.data.DataLookup;
import net.reyadeyat.relational.api.data.DataProcessor;
import net.reyadeyat.relational.api.json.JsonResultset;
import net.reyadeyat.relational.api.json.JsonUtil;
import net.reyadeyat.relational.api.util.Returns;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Set;
import net.reyadeyat.relational.api.jdbc.JDBCSource;
import net.reyadeyat.relational.api.model.Enterprise;
import net.reyadeyat.relational.api.model.EnterpriseModel;

/**
 * 
 * Description
 * 
 *
 * @author Mohammad Nabil Mostafa
 * <a href="mailto:code@reyadeyat.net">code@reyadeyat.net</a>
 * 
 * @since 2023.01.01
 */
public class Table {
    private String database_name;
    private JsonObject table_tree;
    private String table_name;
    private HashMap<String, Field> fieldMap;
    private ArrayList<Field> field_list;
    private String selectWhereCondition;
    private ArrayList<Field> selectWhereConditionFields;
    private String updateWhereCondition;
    private ArrayList<Field> updateWhereConditionFields;
    private HashMap<String, ForeignKey> foreignKeys;//Foreign Table, Keys
    private HashMap<String, DependentKey> dependentKeys;//Dependent Table, Keys
    private HashMap<String, JoinKey> joinKeys;//Join Table, Keys
    private ArrayList<String> join_sql_list;
    
    private Boolean hasPrimaryKeyAI;
    private Boolean hasPrimaryKeyMI;
    
    private Integer countPrimaryKeyAI;
    private Integer countPrimaryKeyMI;
        
    private ArrayList<String> errors;

    private ArrayList<ForeignKey> foreign_keys_list;
    private ArrayList<DependentKey> dependent_keys_list;
    private String inner_join_statement;
    
    //PrimaryKeys
    protected ArrayList<Field> primary_keys;
    protected ArrayList<Field> primary_keys_manual_increment_fields;
    protected ArrayList<Field> primary_keys_auto_increment_fields;
    protected ArrayList<Field> uniqueness_fields_all;
    protected ArrayList<Field> uniqueness_fields_any;
    //protected HashMap<String, Table> foreign_tables;
    //Insert
    protected Boolean hasVariable;
    protected ArrayList<Field> insert_fields;
    protected String valid_insert_fields;
    protected String uniqueness_insert_statement;
    protected String insert_statement;
    protected String insert_set_statement;
    protected ArrayList<String> insert_set_statement_fields_name;
    protected ArrayList<String> insert_set_statement_fields_alias;
    protected String insert_statement_select;
    //Select
    protected ArrayList<Field> select_fields;
    protected String valid_select_fields;
    protected String select_statement;
    protected String select_statement_from;
    protected ArrayList<Field> select_statement_groupby;
    protected ArrayList<Field> select_statement_orderby;
    //Update
    protected Boolean safe_update;
    protected ArrayList<Field> update_fields;
    protected String valid_update_fields;
    protected String uniqueness_update_statement;
    protected String update_statement;
    //Delete
    protected String delete_statement;
    
    private transient Table parent_table;
    private ArrayList<Table> child_table_list;
    
    private static HashMap<Integer, EnterpriseModel<Enterprise>> data_model_map = new HashMap<Integer, EnterpriseModel<Enterprise>>();
    
    private ArrayList<String> valid_transaction_type_list;
    private String transaction_type_list;
    
    public Table(String database_name, String table_name, JsonArray error_list) throws Exception {
        this(database_name, JsonUtil.jsonStringToJsonElelement("\"table_name\":\""+table_name+"\"}").getAsJsonObject(), error_list);
    }
    
    public Table(String database_name, JsonObject table_tree, JsonArray error_list) throws Exception {
        this(null, null, database_name, table_tree, error_list);
    }
    
    public Table(Integer model_id, Table parent_table, String database_name, JsonObject table_tree, JsonArray error_list) throws Exception {
        this.parent_table = parent_table;
        this.database_name = database_name;
        this.table_tree = table_tree;
        this.fieldMap = new HashMap<String, Field>();
        hasPrimaryKeyAI = null;
        hasPrimaryKeyMI = null;
        field_list = new ArrayList<Field>();
        errors = new ArrayList<String>();
        join_sql_list = new ArrayList<String>();
        joinKeys = new HashMap<String, JoinKey>();
        
        
        transaction_type_list = JsonUtil.getJsonString(table_tree, "transaction_type_list", false);
        valid_transaction_type_list = new ArrayList<String>(Arrays.<String>asList(transaction_type_list.trim().split("\\s*,\\s*")));
        
        safe_update = true;
        
        init(error_list);
        
        if (error_list.size() > 0) {
            return;
        }
        
        this.table_name = this.table_tree.get("table_name").getAsString();
        initializeTable(model_id);
        child_table_list = new ArrayList<Table>();
        JsonArray table_children_list = this.table_tree.get("children") == null ? null : this.table_tree.get("children").getAsJsonArray();
        if (table_children_list != null && table_children_list.size() > 0) {
            for (int i = 0; i < table_children_list.size(); i++) {
                JsonObject child_table_json = table_children_list.get(i).getAsJsonObject();
                Table child_table = new Table(model_id, this, database_name, child_table_json, error_list);
                child_table_list.add(child_table);
            }
        }
    }
    
    public Boolean init(JsonArray error_list) throws Exception {
        StringBuilder sb = new StringBuilder();
        if (database_name == null) {
            error_list.add("Database name is not defined");
        }

        if (table_name == null) {
            error_list.add("Table name is not defined");
        }

        postInit();

        if (hasErrors() == true) {
            ArrayList<String> tableErrors = getErrors();
            for (String error : tableErrors) {
                error_list.add(error);
            }
        }

        primary_keys = new ArrayList<>();
        primary_keys_manual_increment_fields = new ArrayList<>();
        primary_keys_auto_increment_fields = new ArrayList<>();
        uniqueness_fields_all = new ArrayList<>();
        uniqueness_fields_any = new ArrayList<>();

        insert_fields = new ArrayList<>();
        select_fields = new ArrayList<>();
        update_fields = new ArrayList<>();
        select_statement_groupby = new ArrayList<>();

        ArrayList<Field> tabel_fields = getFields();
        HashMap<Integer, Field> ttorder = new HashMap<Integer, Field>();
        for (Field f : tabel_fields) {
            if (f.isPrimaryKey() == true) {
                primary_keys.add(f);
            }
            if (f.isPrimaryKeyMI() == true) {
                primary_keys_manual_increment_fields.add(f);
            }
            if (f.isPrimaryKeyAI() == true) {
                primary_keys_auto_increment_fields.add(f);
            }
            if (f.isOrderBy() == true) {
                ttorder.put(f.getOrderByOrder(), f);
            }
            if (f.isAllowedTo(Field.INSERT) == true) {
                insert_fields.add(f);
            }
            if (f.isAllowedTo(Field.SELECT) == true) {
                select_fields.add(f);
            }
            if (f.isAllowedTo(Field.UPDATE) == true) {
                update_fields.add(f);
            }
            if (f.isGroup() == true) {
                select_statement_groupby.add(f);
            }
        }

        valid_insert_fields = (insert_fields.size() == 0 ? null : fieldAliasToCsv(insert_fields));
        valid_select_fields = (select_fields.size() == 0 ? null : fieldAliasToCsv(select_fields));
        valid_update_fields = (update_fields.size() == 0 ? null : fieldAliasToCsv(update_fields));

        if (ttorder != null && ttorder.size() > 0) {
            select_statement_orderby = new ArrayList<Field>(ttorder.size());
            Set<Integer> keys = ttorder.keySet();
            ArrayList<Integer> tkeys = new ArrayList<Integer>(keys);
            Collections.sort(tkeys);
            for (Integer i : tkeys) {
                select_statement_orderby.add(ttorder.get(i));
            }
        }

        if (primary_keys == null) {
            error_list.add("Primary Keys are not defined field_list tableFields");
        }

        if (transaction_type_list.contains("insert") == true) {
            for (Field f : insert_fields) {
                if (f.isUniqueAll()) {
                    uniqueness_fields_all.add(f);
                }
                if (f.isUniqueAny()) {
                    uniqueness_fields_any.add(f);
                }
                if (f.isVariable()) {
                    hasVariable = true;
                }
            }
            sb.setLength(0);
            if (transaction_type_list.contains("insert") == true && insert_fields.size() == 0) {
                error_list.add("no valid insert field_list defined");
            } else if (/*insert_fields != null && */transaction_type_list.contains("insert") == false) {
                //ignore
            } else {
                sb.setLength(0);
                sb.append("INSERT INTO `").append(database_name).append("`.`").append(table_name).append("` (");
                for (int i = 0; i < insert_fields.size(); i++) {
                    Field field = insert_fields.get(i);
                    if (field.isPrimaryKeyAI() == false) {
                        sb.append(field.getSQLInsertName()).append(",");
                    }
                }
                sb.delete(sb.length() - 1, sb.length());
                if (hasPrimaryKeyMI() == false) {
                    sb.append(") VALUES (");
                } else {
                    sb.append(") SELECT ");
                }
                for (int i = 0; i < insert_fields.size(); i++) {
                    Field field = insert_fields.get(i);
                    if (field.isPrimaryKeyMI() == true) {
                        sb.append("IFNULL(MAX(" + field.getSQLName() + "), 0) + 1,");
                    } else if (field.isInsertFormulaDefined() == true) {
                        sb.append(field.getInsertFormulaDefined()).append(",");
                    } else {
                        sb.append("?,");
                    }
                }
                sb.delete(sb.length() - 1, sb.length());
                if (hasPrimaryKeyMI() == false) {
                    sb.append(")");
                }
                if (hasPrimaryKeyMI() == true) {
                    sb.append(" FROM `").append(database_name).append("`.`").append(table_name).append("`");
                    Integer counter = primary_keys.size() - countPrimaryKeyMI();
                    if (counter > 0) {
                        sb.append(" WHERE");
                    }
                    for (int i = 0; i < primary_keys.size(); i++) {
                        Field field = primary_keys.get(i);
                        if (field.isPrimaryKeyMI() == false) {
                            sb.append(" ").append(field.getSQLName()).append("=?").append(" AND");
                        }
                    }
                    if (counter > 0) {
                        sb.delete(sb.length() - " AND".length(), sb.length());
                    }
                    sb.append(" FOR UPDATE");
                }
                insert_statement = sb.toString();
                if (insert_set_statement != null) {
                    sb.setLength(0);
                    sb.append("INSERT INTO `").append(database_name).append("`.`").append(table_name).append("` (");
                    for (int i = 0; i < insert_fields.size(); i++) {
                        Field f = insert_fields.get(i);
                        if (f.isPrimaryKeyAI() == false) {
                            sb.append(f.getSQLName()).append(",");
                        }
                    }
                    sb.delete(sb.length() - 1, sb.length());
                    sb.append(") ");
                    sb.append(insert_set_statement);
                    insert_set_statement = sb.toString();
                }
                sb.setLength(0);
                if (primary_keys.size() > 0 && insert_fields.size() > 0) {
                    if (hasVariable == true) {
                        //Generate at runtime
                        insert_statement_select = null;
                    } else {
                        sb.append("SELECT ");
                        for (int i = 0; i < tabel_fields.size(); i++) {
                            Field f = tabel_fields.get(i);
                            if (f.getTable().equalsIgnoreCase(table_name) == true) {
                                sb.append(" ").append(f.getSelect(null)).append(",");
                            }
                        }
                        sb.replace(sb.length() - 1, sb.length(), " ");
                        sb.append("FROM `").append(database_name).append("`.`").append(table_name).append("` WHERE");
                        for (int i = 0; i < insert_fields.size(); i++) {
                            Field f = insert_fields.get(i);
                            if (f.isPrimaryKeyAI() == false && f.isPrimaryKeyMI() == false) {
                                sb.append(" ").append(f.getSQLName()).append(" ").append(f.isNullable() ? "<=>?" : "=?").append(i + 1 == insert_fields.size() ? "" : " AND");
                            }
                        }
                        insert_statement_select = sb.toString();
                    }
                }
                if (primary_keys.size() > 0 || uniqueness_fields_all.size() > 0 || uniqueness_fields_any.size() > 0) {
                    if (hasVariable == true) {
                        error_list.add("Uniqueness Statement can't contain variable field");
                    }
                    Boolean hasUniqueness = false;
                    sb.setLength(0);
                    sb.append("SELECT ").append(getFieldsFor(Field.INSERT, true));
                    sb.append(" FROM `").append(database_name).append("`.`").append(table_name).append("` WHERE ");
                    Integer primaryKeyIncrement = 0;
                    if (primary_keys.size() > 0) {
                        for (int i = 0; i < primary_keys.size(); i++) {
                            Field field = primary_keys.get(i);
                            if (field.isPrimaryKeyAI() == true || field.isPrimaryKeyMI() == true) {
                                primaryKeyIncrement++;
                            } else {
                                hasUniqueness = true;
                                sb.append(" ").append(primary_keys.get(i).getSQLName()).append("=?").append(i + 1 == primary_keys.size() ? "" : " AND");
                            }
                        }
                    }
                    if (uniqueness_fields_all.size() > 0) {
                        hasUniqueness = true;
                        if ((primary_keys.size() - primaryKeyIncrement) > 0) {
                            sb.append(" AND ");
                        }
                        for (int i = 0; i < uniqueness_fields_all.size(); i++) {
                            //sb.append(" ").append(uniqueness_fields_all.get(i).getSQLName()).append("<=>?").append(i + 1 == uniqueness_fields_all.size() ? "" : " AND");
                            sb.append(" ").append(uniqueness_fields_all.get(i).getSQLName()).append("=?").append(i + 1 == uniqueness_fields_all.size() ? "" : " AND");
                        }
                    }
                    if (uniqueness_fields_any.size() > 0) {
                        hasUniqueness = true;
                        if ((primary_keys.size() - primaryKeyIncrement) > 0 || uniqueness_fields_all.size() > 0) {
                            sb.append(" AND ");
                        }
                        sb.append("(");
                        for (int i = 0; i < uniqueness_fields_any.size(); i++) {
                            //sb.append(" ").append(uniqueness_fields_any.get(i).getSQLName()).append("<=>?").append(i + 1 == uniqueness_fields_any.size() ? "" : " OR");
                            sb.append(" ").append(uniqueness_fields_any.get(i).getSQLName()).append("=?").append(i + 1 == uniqueness_fields_any.size() ? "" : " OR");
                        }
                        sb.append(")");
                    }
                    uniqueness_insert_statement = hasUniqueness == false ? null : sb.toString();//(sb.length() == 0 ? null : sb.toString());
                }
            }
        }
        if (transaction_type_list.contains("select") == true) {
            sb.setLength(0);
            if (transaction_type_list.contains("select") == true && select_fields.size() == 0) {
                error_list.add("no valid select field_list defined");
            } else if (/*select_fields != null && */transaction_type_list.contains("select") == false) {
                //ignore
            } else {
                sb.setLength(0);
                if (select_statement_from == null) {
                    sb.append("`").append(database_name).append("`.`").append(table_name).append("`");
                    sb.append(getInnerJoin());
                    select_statement_from = sb.length() == 0 ? null : sb.toString();
                }
                sb.setLength(0);
                if (select_statement_from != null) {
                    sb.append("$SELECT$ FROM ").append(select_statement_from).append(" $WHERE$ $GROUPBY$ $HAVING$ $ORDERBY$");
                } else {
                    sb.append("$SELECT$ FROM `").append(database_name).append("`.`").append(table_name).append("` $WHERE$ $GROUPBY$ $HAVING$ $ORDERBY$");
                }
                select_statement = sb.toString();
            }
        }
        if (transaction_type_list.contains("update") == true) {
            sb.setLength(0);
            if (update_fields == null && transaction_type_list.contains("update") == true) {
                error_list.add("no valid update field_list defined");
            } else if (/*update_fields != null && */transaction_type_list.contains("update") == false) {
                //ignore
            } else {
                /*valid_update_fields = String.join(",", update_fields);
                for (String fieldName : update_fields) {
                    if (tableFields.get(fieldName) == null) {
                        initerror = true;
                        error_list.add("Update Field '" + fieldName + "' is not defined in field_list tableFields");
                    }
                }*/
                //StringBuilder sb = new StringBuilder();
                sb.setLength(0);
                sb.append("UPDATE `").append(database_name).append("`.`").append(table_name).append("` SET $UPDATE$ $WHERE$");
                update_statement = sb.toString();
                if (uniqueness_fields_all.size() > 0 || uniqueness_fields_any.size() > 0) {
                    Boolean hasUniqueness = false;
                    sb.setLength(0);
                    sb.append("SELECT ").append(getFieldsFor(Field.UPDATE, true));
                    /*Make Select shows count as a flag of uniquness
                            Group by field_list to get these uniqueness*/
                    sb.append(" FROM `").append(database_name).append("`.`").append(table_name).append("` WHERE ");
                    if (primary_keys != null) {
                        hasUniqueness = true;
                        for (int i = 0; i < primary_keys.size(); i++) {
                            Field f = primary_keys.get(i);
                            sb.append(" ");
                            if (f.isPrimaryKeyAI() || f.isPrimaryKeyMI()) {
                                sb.append(f.getSQLName()).append("<>?");
                            } else {
                                sb.append(f.getSQLName()).append("=?");
                            }
                            sb.append(i + 1 == primary_keys.size() ? "" : " AND");
                        }
                    }
                    if (uniqueness_fields_all.size() > 0) {
                        hasUniqueness = true;
                        if (primary_keys.size() > 0) {
                            sb.append(" AND ");
                        }
                        for (int i = 0; i < uniqueness_fields_all.size(); i++) {
                            //sb.append(" ").append(uniqueness_fields_all.get(i).getSQLName()).append("<=>?").append(i + 1 == uniqueness_fields_all.size() ? "" : " AND");
                            sb.append(" ").append(uniqueness_fields_all.get(i).getSQLName()).append("=?").append(i + 1 == uniqueness_fields_all.size() ? "" : " AND");
                        }
                    }
                    if (uniqueness_fields_any.size() > 0) {
                        hasUniqueness = true;
                        if (primary_keys.size() > 0 || uniqueness_fields_all.size() > 0) {
                            sb.append(" AND ");
                        }
                        sb.append("(");
                        for (int i = 0; i < uniqueness_fields_any.size(); i++) {
                            //sb.append(" ").append(uniqueness_fields_any.get(i).getSQLName()).append("<=>?").append(i + 1 == uniqueness_fields_any.size() ? "" : " OR");
                            sb.append(" ").append(uniqueness_fields_any.get(i).getSQLName()).append("=?").append(i + 1 == uniqueness_fields_any.size() ? "" : " OR");
                        }
                        sb.append(")");
                    }
                    uniqueness_update_statement = hasUniqueness == false ? null : sb.toString();//(sb.length() == 0 ? null : sb.toString());
                }
            }
        }
        if (transaction_type_list.contains("delete") == true) {
            sb.setLength(0);
            sb.append("DELETE FROM `").append(database_name).append("`.`").append(table_name).append("` $WHERE$");
            delete_statement = sb.toString();
        }
        ArrayList<Field> field_list = getFields();
        for (Field field : field_list) {
            if (field.hasErrors()) {
                ArrayList<String> errors = field.getErrors();
                for (String error : errors) {
                    error_list.add(error);
                }
            }
        }
        
        return error_list.size() > 0;//errors
    }
    
    public void postInit() {
        this.field_list = new ArrayList<Field>(fieldMap.values());
        Collections.sort(this.field_list);
        if (joinKeys != null) {
            Set<String> joinKeysSet = joinKeys.keySet();
            for (String key : joinKeysSet) {
                JoinKey joinKey = joinKeys.get(key);
                joinKey.prepareJoinStatement();
            }
        }
        if (foreignKeys != null) {
            Set<String> foreignKeysSet = foreignKeys.keySet();
            for (String key : foreignKeysSet) {
                ForeignKey foreignKey = foreignKeys.get(key);
                foreignKey.prepareForeinessValidationStatement();
            }
        }
        if (dependentKeys != null) {
            Set<String> dependentKeysSet = dependentKeys.keySet();
            for (String key : dependentKeysSet) {
                DependentKey dependentKey = dependentKeys.get(key);
                dependentKey.prepareDependencyValidationStatement();
            }
        }
    }
    
    public String getTableName() {
        return table_name;
    }
    
    public Table getTableTree() {
        return this;
    }
    
    public Field getField(String alias) {
        return fieldMap.get(alias);
    }
    
    public ArrayList<Field> getFields() {
        return field_list;
    }
    
    public HashMap<String, Field> getFieldMap() {
        return fieldMap;
    }
    
    public Boolean hasErrors() {
        return errors.size() > 0;
    }
    
    public ArrayList<String> getErrors() {
        return errors;
    }
    
    private void checkDuplicity(Field field) {
        for (Field f : field_list) {
            if (table_name.equalsIgnoreCase(f.getTable()) == true
                    && f.isVariable() == false && f.hasFormulaDefined() == false && f.getName().equalsIgnoreCase(field.getName())) {
                errors.add("Field name '" + f.getTable() + "'.'" + f.getName() + "' is duplicated");
            }
            if (table_name.equalsIgnoreCase(f.getTable()) == true
                    && f.isVariable() == false && f.hasFormulaDefined() == false && f.getAlias().equalsIgnoreCase(field.getAlias())) {
                errors.add("Field alias '" + f.getTable() + "'.'" + f.getAlias() + "' is duplicated");
            }
        }
    }
    
    public Field addField(Boolean nullable, Boolean group, FieldType fieldType, String name, String alias) {
        return addField(nullable, group, fieldType, table_name, null, name, alias);
    }
    
    public Field addField(Boolean nullable, Boolean group, FieldType fieldType, String joinTable, String name, String alias) {
        return addField(nullable, group, fieldType, joinTable, null, name, alias);
    }
    
    public Field addField(Boolean nullable, Boolean group, FieldType fieldType, String joinTable, String joinTableAlias, String name, String alias) {
        Field field = new Field(field_list.size(), nullable, group, fieldType, joinTable, joinTableAlias, name, alias);
        /*if (name.length() == 0) {
            field.disallow(Field.INSERT);
            field.disallow(Field.UPDATE);
        }*/
        checkDuplicity(field);
        field_list.add(field);
        fieldMap.put(alias, field);
        return field;
    }
    
    public Boolean hasSelectWhereCondition() {
        return this.selectWhereCondition != null;
    }
    
    public void addSelectWhereCondition(String[] fieldList, String selectWhereCondition) {
        this.selectWhereCondition = selectWhereCondition;
        this.selectWhereConditionFields = new ArrayList<Field>();
        for (String fieldName : fieldList) {
            Field field = fieldMap.get(fieldName);
            this.selectWhereConditionFields.add(field);
        }
    }
    
    public String getSelectWhereCondition() {
        return this.selectWhereCondition;
    }
    
    public ArrayList<Field> getSelectWhereConditionFields() {
        return this.selectWhereConditionFields;
    }
    
    public Boolean hasUpdateWhereCondition() {
        return this.updateWhereCondition != null;
    }
    
    public void addUpdateWhereCondition(String[] fieldList, String updateWhereCondition) {
        this.updateWhereCondition = updateWhereCondition;
        this.updateWhereConditionFields = new ArrayList<Field>();
        for (String fieldName : fieldList) {
            Field field = fieldMap.get(fieldName);
            this.updateWhereConditionFields.add(field);
        }
    }
    
    public String getUpdateWhereCondition() {
        return this.updateWhereCondition;
    }
    
    public ArrayList<Field> getUpdateWhereConditionFields() {
        return this.updateWhereConditionFields;
    }
    
    private void addForeignKey(String key, String foreign_table) {
        foreignKeys = (foreignKeys != null ? foreignKeys : new HashMap<String, ForeignKey>());
        if (foreignKeys.get(key) == null) {
            foreignKeys.put(key, new ForeignKey(key, database_name, foreign_table));
        }
    }
    
    public void addForeignField(String key, String foreign_table, String field_alias, String foreign_field_alias) {
        if (fieldMap.get(field_alias) == null) {
            errors.add("Field alias '" + field_alias + "' is not exist in table '" + table_name + "'");
            return;
        }
        Field field = fieldMap.get(field_alias);
        addForeignKey(key, foreign_table);
        ForeignKey foreignKey = foreignKeys.get(key);
        foreignKey.addForeignField(field, foreign_field_alias);
    }
    
    private void addDependentKey(String key, String dependent_table) {
        dependentKeys = (dependentKeys != null ? dependentKeys : new HashMap<String, DependentKey>());
        if (dependentKeys.get(key) == null) {
            dependentKeys.put(key, new DependentKey(key, database_name, dependent_table));
        }
    }
    
    public void addDependentField(String key, String dependent_table, String field_alias, String dependent_Field_alias) {
        if (fieldMap.get(field_alias) == null) {
            errors.add("Field alias '" + field_alias + "' is not exist in table '" + table_name + "'");
            return;
        }
        Field field = fieldMap.get(field_alias);
        addDependentKey(key, dependent_table);
        DependentKey dependentKey = dependentKeys.get(key);
        dependentKey.addDependentField(field, dependent_Field_alias);
    }
    
    public void addJoinSQL(String join_sql) {
        join_sql_list.add(join_sql);
    }
    
    private void addJoinKey(String key, String join_table, JoinKey.JoinType join_type) {
        if (joinKeys.get(key) == null) {
            joinKeys.put(key, new JoinKey(key, database_name, table_name, join_table, join_type));
        }
    }
    
    public void addJoinField(String key, String join_table, String field_alias, String join_field_alias) {
        addJoinField(key, join_table, field_alias, join_field_alias, JoinKey.JoinType.INNER_JOIN);
    }
    
    public void addJoinField(String key, String join_table, String field_alias, String join_field_alias, JoinKey.JoinType join_type) {
        if (fieldMap.get(field_alias) == null) {
            errors.add("Field alias '" + field_alias + "' is not exist in table '" + table_name + "'");
            return;
        }
        Field field = fieldMap.get(field_alias);
        addJoinKey(key, join_table, join_type);
        JoinKey joinKey = joinKeys.get(key);
        joinKey.addJoinField(field, join_field_alias);
    }
    
    private void prepareJoin() {
        if (joinKeys == null) {
            inner_join_statement = "";
            return;
        }
        StringBuilder fks = new StringBuilder();
        ArrayList<String> joinKeySet = new ArrayList<String>(joinKeys.keySet());
        for (int i = 0; i < joinKeySet.size(); i++) {
            String joinField = joinKeySet.get(i);
            JoinKey joinKey = joinKeys.get(joinField);
            fks.append(joinKey.getJoinStatement());
        }
        for (String free_join_sql : join_sql_list) {
            fks.append(" ").append(free_join_sql);
        }
        inner_join_statement = fks.toString();
    }
    
    public String getInnerJoin() {
        if (inner_join_statement == null) {
            prepareJoin();
        }
        return inner_join_statement;
    }
    
    public ArrayList<ForeignKey> getForeignKeys() {
        if (foreign_keys_list == null) {
            foreign_keys_list = foreignKeys == null ? new ArrayList<ForeignKey>() : new ArrayList<ForeignKey>(foreignKeys.values());
        }
        return foreign_keys_list;
    }
    
    public ArrayList<DependentKey> getDepenencyKeys() {
        if (dependent_keys_list == null) {
            dependent_keys_list = dependentKeys == null ? new ArrayList<DependentKey>() : new ArrayList<DependentKey>(dependentKeys.values());
        }
        return dependent_keys_list;
    }
    
    public Boolean hasPrimaryKeyAI() {
        if (hasPrimaryKeyAI == null) {
            hasPrimaryKeyAI = false;
            for (Field field : field_list) {
                if (field.isPrimaryKeyAI() == true) {
                    hasPrimaryKeyAI = true;
                    break;
                }
            }
        }
        return hasPrimaryKeyAI;
    }
    
    public Integer countPrimaryKeyAI() {
        if (countPrimaryKeyAI == null) {
            countPrimaryKeyAI = 0;
            for (Field field : field_list) {
                if (field.isPrimaryKeyMI() == true) {
                    countPrimaryKeyAI++;
                }
            }
        }
        return countPrimaryKeyAI;
    }
    
    public Boolean hasPrimaryKeyMI() {
        if (hasPrimaryKeyMI == null) {
            hasPrimaryKeyMI = false;
            for (Field field : field_list) {
                if (field.isPrimaryKeyMI() == true) {
                    hasPrimaryKeyMI = true;
                    break;
                }
            }
        }
        return hasPrimaryKeyMI;
    }
    
    public Integer countPrimaryKeyMI() {
        if (countPrimaryKeyMI == null) {
            countPrimaryKeyMI = 0;
            for (Field field : field_list) {
                if (field.isPrimaryKeyMI() == true) {
                    countPrimaryKeyMI++;
                }
            }
        }
        return countPrimaryKeyMI;
    }
    
    private String createRuntimeInsertStatementSelect(JsonObject variable) throws Exception {
        StringBuilder sb = new StringBuilder();
        ArrayList<Field> tabel_fields = getFields();
        sb.append("SELECT ");
        for (int i = 0; i < tabel_fields.size(); i++) {
            Field f = tabel_fields.get(i);
            if (f.getTable().equalsIgnoreCase(table_name) == true) {
                if (f.isVariable() == false) {
                    sb.append(" ").append(f.getSelect()).append(",");
                } else {
                    sb.append(" ").append(f.getSelect(variable)).append(",");
                }
            }
        }
        sb.replace(sb.length() - 1, sb.length(), " ");
        sb.append("FROM `").append(database_name).append("`.`").append(table_name).append("` WHERE");
        for (int i = 0; i < insert_fields.size(); i++) {
            Field f = insert_fields.get(i);
            if (f.isPrimaryKeyAI() == false && f.isPrimaryKeyMI() == false) {
                sb.append(" ").append(f.getSQLName()).append(" ").append(f.isNullable() ? "<=>?" : "=?").append(i + 1 == insert_fields.size() ? "" : " AND");
            }
        }
        //insert_statement_select = sb.toString();
        insert_statement_select = null;
        return sb.toString();
    }
    
    public void validateInserFields(JsonArray errors) {
        if (insert_fields == null) {
            errors.add("Internal System Error, Contact Adminstrator, uninitialized 'insert_fields' is null");
        } else if (valid_insert_fields == null) {
            errors.add("Internal System Error, Contact Adminstrator, uninitialized 'valid_insert_fields' is null");
        } else if (insert_statement == null) {
            errors.add("Internal System Error, Contact Adminstrator, uninitialized 'insert_statement' is null");
        }
    }
    
    public void validateSelectFields(JsonArray errors) {
        if (select_fields == null) {
            errors.add("Internal System Error, Contact Adminstrator, uninitialized 'select_fields' is null");
        } else if (valid_select_fields == null) {
            errors.add("Internal System Error, Contact Adminstrator, uninitialized 'valid_select_fields' is null");
        } else if (select_statement == null) {
            errors.add("Internal System Error, Contact Adminstrator, uninitialized 'select_statement' is null");
        }
    }
    
    public void validateUpdateFields(JsonArray errors) {
        if (update_fields == null) {
            errors.add("Internal System Error, Contact Adminstrator, uninitialized 'update_fields' is null");
        } else if (valid_update_fields == null) {
            errors.add("Internal System Error, Contact Adminstrator, uninitialized 'valid_update_fields' is null");
        } else if (update_statement == null) {
            errors.add("Internal System Error, Contact Adminstrator, uninitialized 'update_statement' is null");
        }
    }
    
    public void validateDeleteFields(JsonArray errors) {
        if (delete_statement == null) {
            errors.add("Internal System Error, Contact Adminstrator, uninitialized 'delete_statement' is null");
        }
    }
    
    protected void defineInsertSet(String insert_set_statement) {
        this.insert_set_statement = insert_set_statement;
        insert_set_statement_fields_name = new ArrayList<String>();
        insert_set_statement_fields_alias = new ArrayList<String>();

        String b = insert_set_statement.substring(7, insert_set_statement.indexOf("FROM"));
        String[] ff = b.split(",");
        for (int i = 0; i < ff.length; i++) {
            String[] fff = ff[i].split("AS");
            insert_set_statement_fields_name.add(fff[0].trim());
            insert_set_statement_fields_alias.add(fff[1].replace("`", "").replace(",", "").trim());
        }
    }
    
    protected void defineSafeUpdate(Boolean safe_update) {
        this.safe_update = safe_update;
    }
    
    public Boolean mustSafeUpdate() {
        return this.safe_update;
    }
    
    protected Field addField(String alias, FieldType fieldType, Boolean nullable, Boolean group, String joinTable, String name) {
        return addField(nullable, group, fieldType, joinTable, name, alias);
    }

    protected Field addField(String alias, FieldType fieldType, Boolean nullable, Boolean group, String name) {
        return addField(nullable, group, fieldType, name, alias);
    }

    protected void addJoinKey(String key, String fieldAlias, String joinTable, String joinField) {
        addJoinField(key, joinTable, fieldAlias, joinField);
    }
    
    protected void addJoinKey(String key, String fieldAlias, String joinTable, String joinField, JoinKey.JoinType join_type) {
        addJoinField(key, joinTable, fieldAlias, joinField, join_type);
    }

    protected void addForeignKey(String key, String fieldAlias, String foreignTable, String foreignField) {
        addForeignField(key, foreignTable, fieldAlias, foreignField);
    }

    protected void addDependentKey(String key, String fieldAlias, String dependendTable, String dependendField) {
        addDependentField(key, dependendTable, fieldAlias, dependendField);
    }

    protected Table getTable() {
        return this;
    }

    protected Object getFieldObject(String alias, String string) throws Exception {
        return getField(alias).getFieldObject(string);
    }

    public Boolean validateInsertUniqueness(Connection con, JsonObject json, JsonArray errors) throws Exception {
        if (uniqueness_insert_statement != null) {
            JsonArray values = json.get("values").getAsJsonArray();
            for (int oo = 0; oo < values.size(); oo++) {
                JsonObject o = values.get(oo).getAsJsonObject();
                try (PreparedStatement preparedInsertedSelectStmt = con.prepareStatement(uniqueness_insert_statement)) {
                    int idx = 0;
                    if (primary_keys.size() > 0) {
                        for (int i = 0; i < primary_keys.size(); i++) {
                            Field f = primary_keys.get(i);
                            if (f.isPrimaryKeyAI() == false && f.isPrimaryKeyMI() == false) {
                                JsonElement fje = o.get(primary_keys.get(i).getAlias());
                                String fieldValue = (/*fje == null || */fje.isJsonNull() ? null : fje.getAsString());
                                preparedInsertedSelectStmt.setObject(++idx, f.getFieldObject(fieldValue));
                            }
                        }
                    }
                    if (uniqueness_fields_all.size() > 0) {
                        for (int i = 0; i < uniqueness_fields_all.size(); i++) {
                            Field f = uniqueness_fields_all.get(i);
                            JsonElement fje = o.get(uniqueness_fields_all.get(i).getAlias());
                            String fieldValue = (fje == null || fje.isJsonNull() ? null : fje.getAsString());
                            preparedInsertedSelectStmt.setObject(++idx, f.getFieldObject(fieldValue));
                        }
                    }
                    if (uniqueness_fields_any.size() > 0) {
                        for (int i = 0; i < uniqueness_fields_any.size(); i++) {
                            Field f = uniqueness_fields_any.get(i);
                            JsonElement fje = o.get(uniqueness_fields_any.get(i).getAlias());
                            String fieldValue = (fje == null || fje.isJsonNull() ? null : fje.getAsString());
                            preparedInsertedSelectStmt.setObject(++idx, f.getFieldObject(fieldValue));
                        }
                    }

                    try (ResultSet rs = preparedInsertedSelectStmt.executeQuery()) {
                        while (rs.next()) {
                            StringBuilder sb = new StringBuilder();
                            StringBuilder ssb = new StringBuilder();
                            //primary_keys
                            for (int i = 0; i < primary_keys.size(); i++) {
                                Field f = primary_keys.get(i);
                                ssb.append("'").append(primary_keys.get(i).getAlias()).append("'=").append(f.isText() || f.isDateTime() ? "'" : "")
                                        .append(rs.getString(primary_keys.get(i).getAlias())).append(f.isText() || f.isDateTime() ? "'" : "").append(",");
                            }
                            if (ssb.length() > 0) {
                                ssb.delete(ssb.length() - 1, ssb.length());
                                errors.add("Record with [Primary Keys] unique values {" + ssb.toString() + "," + sb.toString() + "} already exists");
                            }
                            ssb.setLength(0);
                            //uniqueness_fields_all
                            sb.setLength(0);
                            for (int i = 0; i < uniqueness_fields_all.size(); i++) {
                                Field f = uniqueness_fields_all.get(i);
                                sb.append("'").append(uniqueness_fields_all.get(i).getAlias()).append("'=").append(f.isText() || f.isDateTime() ? "'" : "")
                                        .append(rs.getString(uniqueness_fields_all.get(i).getAlias())).append(f.isText() || f.isDateTime() ? "'" : "").append(",");
                            }
                            if (sb.length() > 0) {
                                sb.delete(sb.length() - 1, sb.length());
                                errors.add("Record with [all] unique values {" + sb.toString() + "} already exists");
                            }
                            //uniqueness_fields_any
                            sb.setLength(0);
                            for (int i = 0; i < uniqueness_fields_any.size(); i++) {
                                Field f = uniqueness_fields_any.get(i);
                                sb.append("'").append(uniqueness_fields_any.get(i).getAlias()).append("'=").append(f.isText() || f.isDateTime() ? "'" : "")
                                        .append(rs.getString(uniqueness_fields_any.get(i).getAlias())).append(f.isText() || f.isDateTime() ? "'" : "").append(",");
                            }
                            if (sb.length() > 0) {
                                sb.delete(sb.length() - 1, sb.length());
                                errors.add("Record with [any] unique values {" + sb.toString() + "} already exists");
                            }
                        }
                        rs.close();
                    } catch (Exception sqlx) {
                        throw sqlx;
                    }
                    preparedInsertedSelectStmt.close();
                } catch (Exception sqlx) {
                    throw sqlx;
                }
            }
        }
        return errors.size() == 0;
    }

    public Boolean validateUpdateUniqueness(Connection con, JsonObject json, JsonArray errors) throws Exception {
        if (uniqueness_update_statement != null) {
            JsonArray values = json.get("values").getAsJsonArray();
            for (int oo = 0; oo < values.size(); oo++) {
                JsonObject o = values.get(oo).getAsJsonObject();
                StringBuilder mpk = null; 
                //Get the where clause must include the primary key in where clause else it is not safe
                //Validate Primary key field in Where Field array list
                JsonObject where = JsonUtil.getJsonObject(json, "where", false);
                JsonArray where_value_list = JsonUtil.getJsonArray(where, "values", true);
                JsonArray where_field_list = JsonUtil.getJsonArray(where, "field_list", true);
                if (where_field_list != null) {
                    for (int i = 0; i < primary_keys.size(); i++) {
                        Field field = primary_keys.get(i);
                        if (o.get(field.getAlias()) == null) {
                            if (mpk == null) {
                                mpk = new StringBuilder();
                                mpk.append("Safe Update can't continue, missing Primary Key {");
                            }
                            mpk.append(field.getAlias()).append(",");
                        }
                    }
                }
                if (mpk != null) {
                    mpk.delete(mpk.length() - 1, mpk.length());
                    mpk.append("}, check in group index[").append(oo + 1).append("]");
                    errors.add(mpk.toString());
                    return false;
                }
                try (PreparedStatement preparedInsertedSelectStmt = con.prepareStatement(uniqueness_update_statement)) {
                    int idx = 0;
                    if (primary_keys.size() > 0) {
                        for (int i = 0; i < primary_keys.size(); i++) {
                            Field f = primary_keys.get(i);
                            JsonElement fje = o.get(primary_keys.get(i).getAlias());
                            String fieldValue = (/*fje == null || */fje.isJsonNull() ? null : fje.getAsString());
                            preparedInsertedSelectStmt.setObject(++idx, f.getFieldObject(fieldValue));
                        }
                    }
                    if (uniqueness_fields_all.size() > 0) {
                        for (int i = 0; i < uniqueness_fields_all.size(); i++) {
                            Field f = uniqueness_fields_all.get(i);
                            JsonElement fje = o.get(uniqueness_fields_all.get(i).getAlias());
                            String fieldValue = (fje == null || fje.isJsonNull() ? null : fje.getAsString());
                            preparedInsertedSelectStmt.setObject(++idx, f.getFieldObject(fieldValue));
                        }
                    }
                    if (uniqueness_fields_any.size() > 0) {
                        for (int i = 0; i < uniqueness_fields_any.size(); i++) {
                            Field f = uniqueness_fields_any.get(i);
                            JsonElement fje = o.get(uniqueness_fields_any.get(i).getAlias());
                            String fieldValue = (fje == null || fje.isJsonNull() ? null : fje.getAsString());
                            preparedInsertedSelectStmt.setObject(++idx, f.getFieldObject(fieldValue));
                        }
                    }

                    try (ResultSet rs = preparedInsertedSelectStmt.executeQuery()) {
                        while (rs.next()) {
                            StringBuilder sb = new StringBuilder();
                            StringBuilder ssb = new StringBuilder();
                            //primary_keys
                            for (int i = 0; i < primary_keys.size(); i++) {
                                Field f = primary_keys.get(i);
                                ssb.append("'").append(primary_keys.get(i).getAlias()).append("'=").append(f.isText() || f.isDateTime() ? "'" : "")
                                        .append(rs.getString(primary_keys.get(i).getAlias())).append(f.isText() || f.isDateTime() ? "'" : "").append(",");
                            }
                            ssb = (ssb.length() > 1 ? ssb.delete(ssb.length() - 1, ssb.length()) : ssb);
                            if (ssb.length() > 0) {
                                ssb.delete(ssb.length() - 1, ssb.length());
                                errors.add("Record with [Primary Keys] unique values {" + ssb.toString() + "," + sb.toString() + "} already exists");
                            }
                            ssb.setLength(0);
                            //uniqueness_fields_all
                            sb.setLength(0);
                            for (int i = 0; i < uniqueness_fields_all.size(); i++) {
                                Field f = uniqueness_fields_all.get(i);
                                sb.append("'").append(uniqueness_fields_all.get(i).getAlias()).append("'=").append(f.isText() || f.isDateTime() ? "'" : "")
                                        .append(rs.getString(uniqueness_fields_all.get(i).getAlias())).append(f.isText() || f.isDateTime() ? "'" : "").append(",");
                            }
                            if (sb.length() > 0) {
                                sb.delete(sb.length() - 1, sb.length());
                                errors.add("Record with [all] unique values {" + sb.toString() + "} already exists");
                            }
                            //uniqueness_fields_any
                            sb.setLength(0);
                            for (int i = 0; i < uniqueness_fields_any.size(); i++) {
                                Field f = uniqueness_fields_any.get(i);
                                sb.append("'").append(uniqueness_fields_any.get(i).getAlias()).append("'=").append(f.isText() || f.isDateTime() ? "'" : "")
                                        .append(rs.getString(uniqueness_fields_any.get(i).getAlias())).append(f.isText() || f.isDateTime() ? "'" : "").append(",");
                            }
                            if (sb.length() > 0) {
                                sb.delete(sb.length() - 1, sb.length());
                                errors.add("Record with [any] unique values {" + sb.toString() + "} already exists");
                            }
                        }
                        rs.close();
                    } catch (Exception sqlx) {
                        throw sqlx;
                    }
                    preparedInsertedSelectStmt.close();
                } catch (Exception sqlx) {
                    throw sqlx;
                }
            }
        }
        return errors.size() == 0;
    }

    public Boolean validateInsertForeignness(Connection con, JsonObject json, JsonArray errors) throws Exception {
        ArrayList<ForeignKey> foreignKeys = getForeignKeys();
        if (foreignKeys.size() == 0) {//no need to check
            return true;
        }
        JsonArray values = json.get("values").getAsJsonArray();
        for (ForeignKey foreignKey : foreignKeys) {
            ArrayList<Field> field_list = foreignKey.getFields();
            ArrayList<Integer> nullableRecords = new ArrayList<Integer>();
            //validate nullability
            for (int oo = 0; oo < values.size(); oo++) {
                JsonObject o = values.get(oo).getAsJsonObject();
                Integer nullables = 0;
                for (int i = 0; i < field_list.size(); i++) {
                    Field f = field_list.get(i);
                    JsonElement fje = o.get(f.getAlias());
                    String fieldValue = (fje == null || fje.isJsonNull() ? null : fje.getAsString());
                    if (f.isNullable() == true && fieldValue == null) {
                        nullables++;
                    }
                }
                nullableRecords.add(nullables);
                if (nullables > 0 && nullables != field_list.size()) {
                    errors.add("Foreign Key '" + foreignKey.getKey() + "' for Table '" + foreignKey.getForeignTable() + "' has mixed keys {null} values check index [" + oo + "], either or null or all non-null}");
                }
            }
            for (int oo = 0; errors.size() == 0 && oo < values.size(); oo++) {//errors.size() == 0 to validate all records
                if (nullableRecords.get(oo) > 0) {//If foreign key is null no need to check;
                    continue;
                }
                //continue with valid nullability
                JsonObject o = values.get(oo).getAsJsonObject();
                String foreignness_statement = foreignKey.getForeinessValidationStatement();
                try (PreparedStatement preparedInsertedSelectStmt = con.prepareStatement(foreignness_statement)) {
                    int idx = 0;
                    StringBuilder sb = new StringBuilder();
                    for (int i = 0; i < field_list.size(); i++) {
                        Field f = field_list.get(i);
                        JsonElement fje = o.get(f.getAlias());
                        String fieldValue = (fje == null || fje.isJsonNull() ? null : fje.getAsString());
                        preparedInsertedSelectStmt.setObject(++idx, f.getFieldObject(fieldValue));
                        sb.append("`").append(foreignKey.getForeignTable()).append("`.`").append(foreignKey.getForeignField(f)).append("`=").append(fieldValue).append(",");
                    }
                    sb.delete(sb.length() - 1, sb.length());
                    String s = sb.toString();
                    try (ResultSet rs = preparedInsertedSelectStmt.executeQuery()) {
                        if (rs.next() == false) {
                            errors.add("Table '" + foreignKey.getForeignTable() + "' doesn't have record with {" + s + "}");
                        }
                        rs.close();
                    } catch (Exception sqlx) {
                        throw sqlx;
                    }
                    preparedInsertedSelectStmt.close();
                } catch (Exception sqlx) {
                    throw sqlx;
                }
            }
        }
        return errors.size() == 0;
    }

    public Boolean validateUpdateForeignness(Connection con, JsonObject json, JsonArray errors) throws Exception {
        ArrayList<ForeignKey> foreignKeys = getForeignKeys();
        if (foreignKeys.size() > 0) {
            JsonArray values = json.get("values").getAsJsonArray();
            for (ForeignKey foreignKey : foreignKeys) {
                ArrayList<Field> field_list = foreignKey.getFields();
                Integer checkForeignKeyUpdate = field_list.size();
                StringBuilder sb = new StringBuilder();
                String foreignness_statement = foreignKey.getForeinessValidationStatement();
                Boolean skipForeignKeyCheck = false;
                for (int oo = 0; oo < 1 /*values.size()*/; oo++) {
                    JsonObject o = values.get(oo).getAsJsonObject();
                    for (int i = 0; i < field_list.size(); i++) {
                        Field f = field_list.get(i);
                        JsonElement je = o.get(f.getAlias());
                        if (je == null) {
                            sb.append(f.getAlias()).append(",");
                        }
                        checkForeignKeyUpdate += (je == null ? 0 : -1);
                    }
                    sb = (sb.length() == 0 ? sb : sb.delete(sb.length() - 1, sb.length()));
                    if (checkForeignKeyUpdate == field_list.size()) {
                        skipForeignKeyCheck = true;
                    } else if (checkForeignKeyUpdate != 0) {//some field_list exists but some others doesn't
                        errors.add("Table '" + foreignKey.getForeignTable() + "' missing '" + (field_list.size() - checkForeignKeyUpdate) + "' foreign keys '" + foreignKey.getKey() + "' keys {" + sb.toString() + "}");
                        return false;
                    }
                }
                if (skipForeignKeyCheck == true) {
                    continue;
                }
                for (int oo = 0; oo < values.size(); oo++) {
                    JsonObject o = values.get(oo).getAsJsonObject();
                    try (PreparedStatement preparedInsertedSelectStmt = con.prepareStatement(foreignness_statement)) {
                        int idx = 0;
                        sb.setLength(0);
                        for (int i = 0; i < field_list.size(); i++) {
                            Field f = field_list.get(i);
                            JsonElement fje = o.get(f.getAlias());
                            String fieldValue = (fje == null || fje.isJsonNull() ? null : fje.getAsString());
                            preparedInsertedSelectStmt.setObject(++idx, f.getFieldObject(fieldValue));
                            sb.append("`").append(foreignKey.getForeignTable()).append("`.`").append(foreignKey.getForeignField(f)).append("`=").append(fieldValue).append(",");
                        }
                        sb.delete(sb.length() - 1, sb.length());
                        String s = sb.toString();
                        try (ResultSet rs = preparedInsertedSelectStmt.executeQuery()) {
                            if (rs.next() == false) {
                                errors.add("Table '" + foreignKey.getForeignTable() + "' doesn't have record with {" + s + "}");
                            }
                            rs.close();
                        } catch (Exception sqlx) {
                            throw sqlx;
                        }
                        preparedInsertedSelectStmt.close();
                    } catch (Exception sqlx) {
                        throw sqlx;
                    }
                }
            }
        }
        return errors.size() == 0;
    }
    
    protected Boolean getBoolean(ResultSet rs, String field) throws Exception {
        return rs.getObject(field) == null ? null : rs.getBoolean(field);
    }

    protected Integer getInt(ResultSet rs, String field) throws Exception {
        return rs.getObject(field) == null ? null : rs.getInt(field);
    }

    protected Long getLong(ResultSet rs, String field) throws Exception {
        return rs.getObject(field) == null ? null : rs.getLong(field);
    }

    protected Double getDouble(ResultSet rs, String field) throws Exception {
        return rs.getObject(field) == null ? null : rs.getDouble(field);
    }

    protected Date getDate(ResultSet rs, String field) throws Exception {
        return rs.getObject(field) == null ? null : rs.getDate(field);
    }

    protected Time getTime(ResultSet rs, String field) throws Exception {
        return rs.getObject(field) == null ? null : rs.getTime(field);
    }

    protected Timestamp getTimestamp(ResultSet rs, String field) throws Exception {
        return rs.getObject(field) == null ? null : rs.getTimestamp(field);
    }

    protected String getString(ResultSet rs, String field) throws Exception {
        return rs.getObject(field) == null ? null : rs.getString(field);
    }

    protected boolean isValid(JsonObject json, String[] parameters, JsonObject errorObject) throws Exception {
        JsonArray errorList = null;
        for (String parameterName : parameters) {
            JsonElement fje = json.get(parameterName);
            String parameter = (fje.isJsonNull() ? null : fje.getAsString());
            if (parameter == null || parameter.isBlank()) {
                if (errorList == null) {
                    errorList = new JsonArray();
                }
                errorList.add("Parameter '" + parameterName + "' is " + (parameter == null ? "null" : "\"empty\""));
            }
        }
        if (errorList != null) {
            errorObject.addProperty("major_error", "Invalid Field Name");
            errorObject.add("error_messages", errorList);
        }
        return errorObject.size() == 0;
    }

    private ServiceField isValidServiceField(String serviceField, HashMap<String, Field> record, JsonArray errorList) {
        int pos1 = serviceField.indexOf(" AS ");
        if (pos1 == -1) {
            return null;
        }
        int pos2 = serviceField.indexOf(" ", pos1 + 5);
        if (pos2 == -1) {
            return null;
        }
        String formula = serviceField.substring(0, pos1);
        String type = serviceField.substring(pos1 + 4, pos2);
        String alias = serviceField.substring(pos2 + 1);
        if (record.containsKey(alias) == true) {
            errorList.add("Service Field '" + serviceField + "' has alias '" + alias + "' that is already defined as Table Field");
            return null;
        }
        return new ServiceField(formula, type, alias, errorList);
    }

    protected boolean areValidSelectFields(ArrayList<String> field, ArrayList<ServiceField> serviceFields, HashMap<String, Field> record, ArrayList<Field> field_list, JsonArray errorList) {
        for (int i = 0; i < field.size(); i++) {
            Field f = record.get(field.get(i));
            if (f != null && f.isAllowedTo(Field.SELECT) == false) {
                errorList.add("Field '" + field.get(i) + "' is not allowed in select operation");
            } else if (f == null || field_list.contains(f) == false) {
                ServiceField sf = isValidServiceField(field.get(i), record, errorList);
                if (sf != null) {
                    serviceFields.add(sf);
                    field.remove(i--);
                } else {
                    errorList.add("Field '" + field.get(i) + "' is not a valid field name");
                }
            }
        }
        //Check Mandatory Fields
        for (int i = 0; i < select_fields.size(); i++) {
            Field f = select_fields.get(i);
            if (f.isMandatoryFor(Field.SELECT) == true) {
                Boolean found = false;
                for (int x = 0; x < field.size(); x++) {
                    if (f.getAlias().equalsIgnoreCase(field.get(x))) {
                        found = true;
                        break;
                    }
                }
                if (found == false) {
                    if (f.hasDefaultValueFor(Field.SELECT) == false) {
                        errorList.add("Field '" + f.getAlias() + "' is mandatory to be exist in select list");
                    } else if (f.hasDefaultValueFor(Field.SELECT) == true) {
                        //ignore, put default value into where 
                        //this field is requested ie. where statement
                    }
                }
            }
        }
        return errorList.size() == 0;
    }

    protected boolean areValidUpdateFieldsValues(HashMap<String, Field> field_map, JsonArray jsonRecordset, ArrayList<String> conditionalFields, ArrayList<Field> field_list, JsonArray errorList) throws Exception {
        StringBuilder error = new StringBuilder();
        for (int i = 0; i < jsonRecordset.size(); i++) {
            JsonObject record = jsonRecordset.get(i).getAsJsonObject();
            for (String fieldName : record.keySet()) {
                Field f = field_map.get(fieldName);
                if (f != null && f.isPrimaryKey() == false && f.isAllowedTo(Field.UPDATE) == false) {
                    errorList.add("Field '" + fieldName + "' is not allowed in update operation");
                } else if (f == null && conditionalFields != null && conditionalFields.contains(fieldName) == false) {
                    errorList.add("Field '" + fieldName + "' is not a valid condition field name, check record[" + (i + 1) + "]");
                } else if (conditionalFields == null && f == null) {
                    errorList.add("Field '" + fieldName + "' is not a valid field name, check record[" + (i + 1) + "]");
                } else if (conditionalFields == null && field_list.contains(f) == false) {
                    errorList.add("Field '" + fieldName + "' is not allowed field to be updated, check record[" + (i + 1) + "]");
                } else if (conditionalFields == null && record.get(fieldName) != null && f != null && f.isNullable() == false && record.get(fieldName).isJsonNull() == true) {
                    errorList.add("Field '" + fieldName + "' doesn't accept null values, check record[" + (i + 1) + "]");
                } else if (conditionalFields == null && f.isValid(Field.UPDATE, (record.get(fieldName) == null || record.get(fieldName).isJsonNull() ? null : record.get(fieldName).getAsString()), error) == false) {
                    errorList.add(error.toString() + ", check record[" + (i + 1) + "]");
                }
            }
            for (Field f : field_map.values()) {
                String field_alias = f.getAlias();
                if (record.has(field_alias) == true) {
                    continue;
                }
                if (f.hasDefaultValueFor(Field.UPDATE) == true) {
                    //defaultValue for Update
                    JsonElement fje = record.get(f.getAlias());
                    if (fje == null || fje.isJsonNull() == true) {
                        record.addProperty(f.getAlias(), f.getDefaultSQLValueFor(Field.UPDATE));
                    }
                }
            }
            for (int x = 0; conditionalFields != null && x < conditionalFields.size(); x++) {
                String fieldName = conditionalFields.get(x);
                if (record.get(fieldName) == null) {
                    errorList.add("Field '" + fieldName + "', in {where.field_list} doesn't exist in values record, check record[" + (i + 1) + "]");
                }
            }
        }
        return errorList.size() == 0;
    }

    final static public Boolean isValidClause(Integer operation, String ii, HashMap<String, Field> r, /*ArrayList<String> vf,*/ ArrayList<Field> wf, ArrayList<String> vv, StringBuilder wc, StringBuilder hc, ArrayList<Argument> wa, ArrayList<Argument> ha, JsonArray errorList) throws Exception {
        ArrayList<String> keyword = new ArrayList<>(Arrays.asList(new String[]{"asc", "desc", "between", "in", "like", "and", "or", "is", "null"}));
        //String symbol = "<=>(?,)";
        String symbol = "/*-+(?)'[]|<=>,;:\\\r\n\t ";
        String ignore = "\r\n\t ";
        Character sc = '\'';
        Character esc = '\'';//\"';
        Character escr = null;
        StringBuilder b = new StringBuilder(), e = new StringBuilder();
        ArrayList<String> mm = new ArrayList<String>();
        boolean s = false, p = false, h = false;
        char c, pc, nc;
        c = pc = nc = '\0';
        int l = ii.length();
        for (int x = 0; x < l; x++) {
            c = ii.charAt(x);
            nc = x == l - 1 ? '\0' : ii.charAt(x + 1);
            if (s == false && (symbol.indexOf(c) > -1)) {
                if (b.length() > 0) {
                    mm.add(b.toString());
                    b.delete(0, b.length());
                }
                if (ignore.indexOf(c) > -1) {
                    b.setLength(0);
                    continue;
                }
                if (symbol.indexOf(c) > -1) {
                    if (b.length() > 0) {
                        mm.add(b.toString());
                        b.setLength(0);
                    }
                    mm.add(String.valueOf(c));
                }
                if (s == false && c == sc) {
                    s = true;
                }
            } else if (s == true && c == esc && nc == sc) {
                if (escr == null) {
                    b.append(esc).append(sc);
                } else {
                    b.append(escr);
                }
                x++;
            } else if (s == true
                    && c == sc) {
                if (b.length() > 0) {
                    mm.add(b.toString());
                    b.setLength(0);
                }
                mm.add(String.valueOf(c));
                s = false;
            } else {
                b.append(c);
            }
            pc = c;
        }
        if (b.length() > 0) {
            mm.add(b.toString());
            b.delete(0, b.length());
        }
        b.setLength(0);

        int ml = mm.size(), vi = -1;
        String sm = "";
        for (int i = 0; i < ml; i++) {
            sm = mm.get(i);
            if (r.get(sm) != null) {
                /*if (vf.contains(sm) == false) {
                    errorList.add("Field '" + sm + "' is not allowed to be in where clause");
                    return false;
                }*/
                Field f = r.get(sm);
                wf.add(f);
                h = f.isGroup();
                (h ? ha : wa).add(new Argument(f));
                (h ? hc : wc).append(h ? f.getHaving() : f.getSQLName()).append(" ");
                sm = mm.get(++i);
                if (sm == null) {
                    errorList.add("Clause statement is incomplete");
                    return false;
                }
                if (sm.length() == 1 && "<=>".indexOf(sm) > -1) {
                    if (mm.get(i - 1).equals("?") == false && r.get(mm.get(i - 1)) == null) {
                        errorList.add("Invalid Mathematical operator");
                        return false;
                    } else if (sm.equals("<") && "?=>".indexOf(mm.get(i + 1)) > -1) {
                        (h ? hc : wc).append(sm);
                        if (mm.get(i + 1).equals("?")) {
                            ++vi;
                            if (vv != null && vi >= vv.size()) {
                                errorList.add("Caluse Paramerter value index is [" + (vi + 1) + "] while value list is only [" + vv.size() + "] items");
                            } else if (vv != null && f.isValid(operation, vv.get(vi), e) == false) {
                                errorList.add(e.toString());
                                return false;
                            }
                            if (vv != null) {//////Needs refactoring
                                (h ? ha : wa).get((h ? ha : wa).size() - 1).addValue(vv.get(vi));
                            }
                            sm = mm.get(++i);
                            (h ? hc : wc).append(sm).append(i + 1 == ml ? "" : "'(.".indexOf(sm) > -1 || "'.,()".indexOf(mm.get(i + 1)) > -1 ? "" : "<>".indexOf(sm) > -1 && ">=".indexOf(mm.get(i + 1)) > -1 ? "" : " ");
                        } else if ("=>".indexOf(mm.get(i + 1)) > -1) {
                            ++i;
                            if (mm.get(i + 1).equals("?") == true) {
                                ++i;
                                ++vi;
                                if (vv != null && vi >= vv.size()) {
                                    errorList.add("Caluse Paramerter value index is [" + (vi + 1) + "] while value list is only [" + vv.size() + "] items");
                                } else if (vv != null && f.isValid(operation, vv.get(vi), e) == false) {
                                    errorList.add(e.toString());
                                    return false;
                                }
                                if (vv != null) {//////Needs refactoring
                                    (h ? ha : wa).get((h ? ha : wa).size() - 1).addValue(vv.get(vi));
                                }
                                //(h ? hc : wc).append("= ? ");
                                (h ? hc : wc).append(mm.get(i-1)).append(" ? ");
                            } else if (r.get(mm.get(i + 1)) != null) {
                                /*if (vf.contains(mm.get(i+1)) == false) {
                                    errorList.add("Field '" + mm.get(i+1) + "' is not allowed to be in where clause");
                                    return false;
                                }*/
                                Field fl = r.get(mm.get(i + 1));
                                wf.add(fl);
                                h = fl.isGroup();
                                //(h ? hc : wc).append(sm).append("=").append(h ? fl.getHaving() : fl.getSQLName()).append(" ");
                                (h ? hc : wc).append(sm).append(mm.get(i)).append(h ? fl.getHaving() : fl.getSQLName()).append(" ");
                                ++i;
                            } else {
                                errorList.add("Invalid Mathematical operator");
                                return false;
                            }
                        }
                    } else if (sm.equals(">") && "?=".indexOf(mm.get(i + 1)) > -1) {
                        (h ? hc : wc).append(sm);
                        if (mm.get(i + 1).equals("?")) {
                            ++vi;
                            if (vv != null && vi >= vv.size()) {
                                errorList.add("Caluse Paramerter value index is [" + (vi + 1) + "] while value list is only [" + vv.size() + "] items");
                            } else if (vv != null && f.isValid(operation, vv.get(vi), e) == false) {
                                errorList.add(e.toString());
                                return false;
                            }
                            if (vv != null) {//////Needs refactoring
                                (h ? ha : wa).get((h ? ha : wa).size() - 1).addValue(vv.get(vi));
                            }
                            ++i;
                            //(h?hc:wc).append("?");
                            (h ? hc : wc).append(f.hasOverwriteWhereCondition() == true ? f.getOverwriteWhereCondition() : "?");
                        } else if ("=".indexOf(mm.get(i + 1)) > -1) {
                            ++i;
                            if (mm.get(i + 1).equals("?") == true) {
                                ++i;
                                ++vi;
                                if (vv != null && vi >= vv.size()) {
                                    errorList.add("Caluse Paramerter value index is [" + (vi + 1) + "] while value list is only [" + vv.size() + "] items");
                                } else if (vv != null && f.isValid(operation, vv.get(vi), e) == false) {
                                    errorList.add(e.toString());
                                    return false;
                                }
                                if (vv != null) {//////Needs refactoring
                                    (h ? ha : wa).get((h ? ha : wa).size() - 1).addValue(vv.get(vi));
                                }
                                (h ? hc : wc).append("= ? ");
                            } else if (r.get(mm.get(i + 1)) != null) {
                                /*if (vf.contains(mm.get(i+1)) == false) {
                                    errorList.add("Field '" + mm.get(i+1) + "' is not allowed to be in where clause");
                                    return false;
                                }*/
                                Field fl = r.get(mm.get(i + 1));
                                wf.add(fl);
                                h = fl.isGroup();
                                ++i;
                                (h ? hc : wc).append(sm).append("=").append(h ? fl.getHaving() : fl.getSQLName()).append(" ");
                                ++i;
                            } else {
                                errorList.add("Invalid Mathematical operator");
                                return false;
                            }
                        }
                    } else if (sm.equals("=") && "?".indexOf(mm.get(i + 1)) > -1) {
                        ++i;
                        ++vi;
                        if (vv != null && vi >= vv.size()) {
                            errorList.add("Caluse Paramerter value index is [" + (vi + 1) + "] while value list is only [" + vv.size() + "] items");
                        } else if (vv != null && f.isValid(operation, vv.get(vi), e) == false) {
                            errorList.add(e.toString());
                            return false;
                        }
                        if (vv != null) {//////Needs refactoring
                            (h ? ha : wa).get((h ? ha : wa).size() - 1).addValue(vv.get(vi));
                        }
                        //IFNULLABLE<=>IFNULL(DATE, -1)=IFNULL(?, -1)
                        //(h?hc:wc).append("<=>").append("? ");
                        (h ? hc : wc).append("<=>").append(f.hasOverwriteWhereCondition() == true ? f.getOverwriteWhereCondition() : "?").append(" ");
                    }
                } else if (sm.equalsIgnoreCase("in")) {
                    (h ? hc : wc).append(sm).append(i + 1 == ml ? "" : "'(.".indexOf(sm) > -1 || "'.,()".indexOf(mm.get(i + 1)) > -1 ? "" : "<>".indexOf(sm) > -1 && ">=".indexOf(mm.get(i + 1)) > -1 ? "" : " ");
                    if (mm.get(i - 1).equalsIgnoreCase("not") == false && r.get(mm.get(i - 1)) == null
                            && mm.get(i + 1).equals("(") == false) {
                        errorList.add("Invalid IN operator");
                        return false;
                    }
                    sm = mm.get(++i);
                    (h ? hc : wc).append(sm).append(i + 1 == ml ? "" : "'(.".indexOf(sm) > -1 || "'.,()".indexOf(mm.get(i + 1)) > -1 ? "" : "<>".indexOf(sm) > -1 && ">=".indexOf(mm.get(i + 1)) > -1 ? "" : " ");
                    while ((sm = mm.get(++i)).equals(")") == false) {
                        String token = "?";
                        if (mm.get(i).equalsIgnoreCase(token) == false) {
                            errorList.add("Invalid IN operator");
                            return false;
                        }
                        if (mm.get(i+1).equals(")") == false) {
                            token = token+",";
                        }
                            
                                ++vi;
                                if (vv != null && vi >= vv.size()) {
                                    errorList.add("Caluse Paramerter value index is [" + (vi + 1) + "] while value list is only [" + vv.size() + "] items");
                                } else if (vv != null && f.isValid(operation, vv.get(vi), e) == false) {
                                    errorList.add(e.toString());
                                    return false;
                                }
                                if (vv != null) {//////Needs refactoring
                                    (h ? ha : wa).get((h ? ha : wa).size() - 1).addValue(vv.get(vi));
                                }
                                //sm = mm.get(++i);
                                //(h ? hc : wc).append(sm).append(i + 1 == ml ? "" : "'(.".indexOf(sm) > -1 || "'.,()".indexOf(mm.get(i + 1)) > -1 ? "" : "<>".indexOf(sm) > -1 && ">=".indexOf(mm.get(i + 1)) > -1 ? "" : " ");
                            
                        
                        //Special Append
                        (h ? hc : wc).append(token).append(i + 1 == ml ? "" : "'(.".indexOf(sm) > -1 || "'.,()".indexOf(mm.get(i + 1)) > -1 ? "" : "<>".indexOf(sm) > -1 && ">=".indexOf(mm.get(i + 1)) > -1 ? "" : " ");
                        if (mm.get(i+1).equals(")") == false) {
                            i++;
                        }
                    }
                    (h ? hc : wc).append(sm).append(i + 1 == ml ? "" : "'(.".indexOf(sm) > -1 || "'.,()".indexOf(mm.get(i + 1)) > -1 ? "" : "<>".indexOf(sm) > -1 && ">=".indexOf(mm.get(i + 1)) > -1 ? "" : " ");
                } else if (sm.equalsIgnoreCase("like")) {
                    (h ? hc : wc).append(sm).append(" ");
                    if (mm.get(i + 1).equals("?") == true) {
                        ++i;
                        ++vi;
                        if (vv != null && vi >= vv.size()) {
                            errorList.add("Caluse Paramerter value index is [" + (vi + 1) + "] while value list is only [" + vv.size() + "] items");
                        }/* else if (vi > v.length || f.isValid(v[vi]) == false) {
                            errorList.add("Field '" + f.getAlias() + "' value '" + v[vi] + "' is not valid " + f.ft.toString() + " data type");
                            return false;
                        }*/
                        if (vv != null) {//////Needs refactoring
                            (h ? ha : wa).get((h ? ha : wa).size() - 1).addValue(vv.get(vi));
                        }
                        (h ? hc : wc).append(" ? ");
                    } else {
                        errorList.add("Invalid Mathematical operator");
                        return false;
                    }
                } else if (sm.equalsIgnoreCase("between")) {
                    (h ? hc : wc).append(sm).append(" ");
                    if (mm.get(i + 1).equals("?") == true) {
                        //(h?hc:wc).append("? ");
                        (h ? hc : wc).append(f.hasOverwriteWhereCondition() == true ? f.getOverwriteWhereCondition() : "?").append(" ");
                        ++i;
                        ++vi;
                        if (vv != null && vi >= vv.size()) {
                            errorList.add("Caluse Paramerter value index is [" + (vi + 1) + "] while value list is only [" + vv.size() + "] items");
                        } else if (vv != null && f.isValid(operation, vv.get(vi), e) == false) {
                            errorList.add(e.toString());
                            return false;
                        }
                        if (mm.get(i + 1).equalsIgnoreCase("and") == false || mm.get(i + 2).equals("?") == false) {
                            errorList.add("Invalid Between operator");
                            return false;
                        }
                        if (vv != null) {//////Needs refactoring
                            (h ? ha : wa).get((h ? ha : wa).size() - 1).addValue(vv.get(vi));
                        }
                        ++i;
                        ++vi;
                        if (vv != null && vi >= vv.size()) {
                            errorList.add("Caluse Paramerter value index is [" + (vi + 1) + "] while value list is only [" + vv.size() + "] items");
                        } else if (vv != null && f.isValid(operation, vv.get(vi), e) == false) {
                            errorList.add(e.toString());
                            return false;
                        }
                        if (vv != null) {//////Needs refactoring
                            (h ? ha : wa).get((h ? ha : wa).size() - 1).addValue(vv.get(vi));
                        }
                        ++i;
                        (h ? hc : wc).append("AND ? ");
                    } else {
                        errorList.add("Invalid Between operator");
                        return false;
                    }
                } else if (sm.equalsIgnoreCase("is")) {
                    if (mm.get(i + 1).equalsIgnoreCase("null")) {
                        ++i;
                        (h ? hc : wc).append("IS NULL");
                    } else if (mm.get(i + 1).equalsIgnoreCase("not")
                            && mm.get(i + 2).equalsIgnoreCase("null")) {
                        i++;
                        ++i;
                        (h ? hc : wc).append("IS NOT NULL");
                    } else {
                        errorList.add("Invalid IS Operator");
                        return false;
                    }
                } else {
                    errorList.add("Invalid Where clause");
                    return false;
                }
            } else if (sm.equalsIgnoreCase("and") || sm.equalsIgnoreCase("or") || sm.equals("(") || sm.equals(")") || sm.equalsIgnoreCase("not")) {
                (h ? hc : wc).append(" ").append(sm).append(" ");
            } else if (r.get(sm) == null) {
                errorList.add("Field '" + sm + "' is not a valid field name");
            } else {
                errorList.add("Invalid Where clause '" + sm + "'");
                return false;
            }
        }

        return errorList.size() == 0;
    }

    public boolean areValidInsertValueFields(HashMap<String, Field> record, JsonArray values, ArrayList<Field> field_list, JsonArray errorList) throws Exception {
        StringBuilder error = new StringBuilder();
        for (int i = 0; i < values.size(); i++) {
            JsonObject o = values.get(i).getAsJsonObject();
            for (String fieldName : o.keySet()) {
                if (fieldName.equalsIgnoreCase("tuid") == true) {
                    continue;
                }
                JsonElement fje = o.get(fieldName);
                String fieldValue = (fje.isJsonNull() ? null : fje.getAsString());
                Field f = record.get(fieldName);
                if (f != null && f.isAllowedTo(Field.INSERT) == false) {
                    errorList.add("Field '" + fieldName + "' is not allowed in insert operation");
                } else if (f == null || field_list.contains(f) == false) {
                    errorList.add("Field '" + fieldName + "' is not a valid field name for insert operation");
                } else if (f.isAllowedTo(Field.INSERT) == false) {
                    errorList.add("Field '" + fieldName + "' is not allowed to insert opertation");
                } else if (f.isValid(Field.INSERT, fieldValue, error) == false) {
                    errorList.add(error.toString());
                }
            }
        }
        if (errorList.size() > 0) {
            return false;
        }
        for (int i = 0; i < values.size(); i++) {
            JsonObject o = values.get(i).getAsJsonObject();
            for (int x = 0; x < field_list.size(); x++) {
                Field f = field_list.get(x);
                JsonElement fje = o.get(field_list.get(x).getAlias());
                String fieldValue = (fje == null || fje.isJsonNull() ? null : fje.getAsString());
                if (f.isPrimaryKeyAI() == false && f.isPrimaryKeyMI() == false
                        && f.isAllowedTo(Field.INSERT) == true && f.isValid(Field.INSERT, fieldValue, error) == false
                        && f.hasDefaultValueFor(Field.INSERT) == false) {
                    errorList.add(error.toString());
                } else if (fieldValue == null && f.hasDefaultValueFor(Field.INSERT) == true) {
                    o.addProperty(f.getAlias(), f.getDefaultSQLValueFor(Field.INSERT));
                }
            }
        }
        return errorList.size() == 0;
    }

    protected boolean isValid(String[] parameters, JsonObject rcvd) throws Exception {

        for (String parameter : parameters) {
            JsonElement el = rcvd.get(parameter);
            if (el == null || el.isJsonNull()) {
                return false;
            }
        }
        return true;
    }

    protected String getFieldsFor(Integer operation, Boolean include_primary_keys) throws Exception {
        StringBuilder csv = new StringBuilder();
        ArrayList<Field> field_list = getFields();
        for (int i = 0; i < field_list.size(); i++) {
            Field f = field_list.get(i);
            if (f.isAllowedTo(operation)
                    || (include_primary_keys == true && f.isPrimaryKey())) {
                csv.append(f.getSelect()).append(",");
            }
        }
        if (csv.length() == 0) {
            return "";
        }
        csv.delete(csv.length() - 1, csv.length());
        return csv.toString();
    }

    protected String getFieldsSelect(JsonObject variable) throws Exception {
        StringBuilder csv = new StringBuilder();
        for (int i = 0; i < select_fields.size(); i++) {
            Field f = select_fields.get(i);
            if (f.isVariable() == false) {
                csv.append(f.getSelect()).append(",");
            } else {
                csv.append(f.getSelect(variable)).append(",");
            }
        }
        if (csv.length() == 0) {
            return "";
        }
        csv.delete(csv.length() - 1, csv.length());
        return csv.toString();
    }

    protected String getFieldsSelect(Boolean hasGroupBy, JsonObject variable, ArrayList<String> field, ArrayList<ServiceField> serviceField, JsonArray errorList) throws Exception {
        StringBuilder csv = new StringBuilder();
        if (hasGroupBy == false || field == null || field.size() == 0) {
            for (int i = 0; i < select_fields.size(); i++) {
                Field f = select_fields.get(i);
                if (f == null) {
                    errorList.add("Field '" + field.get(i) + "' is not a valid field name");
                } else if (f.isVariable() == true) {
                    csv.append(f.getSelect(variable)).append(",");
                } else {
                    csv.append(f.getSelect()).append(",");
                }
            }
        } else {
            for (int i = 0; field != null && i < field.size(); i++) {
                Field f = getField(field.get(i));
                if (f == null) {
                    errorList.add("Field '" + field.get(i) + "' is not a valid field name");
                } else if (f.isVariable() == true) {
                    csv.append(f.getSelect(variable)).append(",");
                } else {
                    csv.append(f.getSelect()).append(",");
                }
            }
        }
        for (int i = 0; serviceField != null && i < serviceField.size(); i++) {
            csv.append(serviceField.get(i).getSelectStatement()).append(",");
        }
        if (csv.length() == 0) {
            return "";
        }
        csv.delete(csv.length() - 1, csv.length());
        return csv.toString();
    }

    protected String fieldAliasToCsv(ArrayList<Field> field_list) {
        if (field_list.size() == 0) {
            return "";
        }
        StringBuilder csv = new StringBuilder();
        for (Field f : field_list) {
            csv.append(f.getAlias()).append(",");
        }
        csv.delete(csv.length() - 1, csv.length());
        return csv.toString();
    }

    protected String getFieldsOrderBy(String v, String[] field, JsonArray errorList) {
        StringBuilder csv = new StringBuilder();
        if (field == null || field.length == 0) {
            for (int i = 0; select_statement_orderby != null && i < select_statement_orderby.size() && v.equalsIgnoreCase("process"); i++) {
                Field f = select_statement_orderby.get(i);
                csv.append(f.getOrderBy()).append(",");
            }
        } else {
            for (int i = 0; i < field.length; i++) {
                String orderByFieldName = field[i];
                char order = orderByFieldName.charAt(0);
                if (order == '+' || order == '-') {
                    orderByFieldName = orderByFieldName.substring(1);
                    //errorList.add("Field Orderby must start with '+' for ascending order or '-' for descending order");
                    //continue;
                } else {
                    order = '+';
                }
                Field f = getField(orderByFieldName);
                if (f == null) {
                    errorList.add("Field '" + field[i] + "' is not a valid field name");
                } else {
                    csv.append(f.getOrderBy()).append(order == '+' ? " ASC," : " DESC,");
                }
            }
        }
        if (csv.length() == 0) {
            return "";
        }
        csv.delete(csv.length() - 1, csv.length());
        return csv.toString();
    }

    protected String getFieldsGroupBy(String[] field, JsonArray errorList) {
        StringBuilder csv = new StringBuilder();
        for (int i = 0; i < field.length; i++) {
            Field f = getField(field[i]);
            if (f == null) {
                errorList.add("Field '" + field[i] + "' is not a valid field name");
            } else if (select_statement_groupby.contains(f) == false) {
                errorList.add("Field '" + field[i] + "' is not a valid 'Group By' field name");
            } else {
                csv.append(f.getGroupBy()).append(",");
            }
        }
        if (csv.length() == 0) {
            return "";
        }
        csv.delete(csv.length() - 1, csv.length());
        if (errorList.size() > 0) {
            errorList.add("Fields valid for 'Group By' are [" + csv.toString() + "] is not a valid GROUP BY field name");
        }
        return csv.toString();
    }

    protected String getJsonCSV(JsonArray jsonArray) {
        StringBuilder csv = new StringBuilder();
        for (int i = 0; i < jsonArray.size(); i++) {
            csv.append(jsonArray.get(i).getAsString()).append(",");
        }
        if (csv.length() == 0) {
            return "";
        }
        csv.delete(csv.length() - 1, csv.length());
        return csv.toString();
    }

    protected String getJsonCSV(JsonObject variable, JsonArray jsonArray, HashMap<String, Field> record) throws Exception {
        StringBuilder csv = new StringBuilder();
        for (int i = 0; i < jsonArray.size(); i++) {
            Field f = record.get(jsonArray.get(i).getAsString());
            if (f.isVariable() == false) {
                csv.append(f.getSelect()).append(",");
            } else {
                csv.append(f.getSelect(variable)).append(",");
            }
        }
        if (csv.length() == 0) {
            return "";
        }
        csv.delete(csv.length() - 1, csv.length());
        return csv.toString();
    }
    
    /**************************************************************************/
    /************ SELECT PROCESSOR ********************************************/
    /**************************************************************************/
    
    public String validateSelectStatement(JsonObject json, ArrayList<Field> wf, String vt, ArrayList<String> s, ArrayList<ServiceField> ss, ArrayList<String> wv, ArrayList<Argument> ah, ArrayList<Argument> av, JsonObject w, JsonArray errors) throws Exception {
        //Validate Mandatory Paramters
        String c = w.get("clause").getAsString();
        String[] g = json.get("groupby") == null || json.get("groupby").isJsonNull() ? null : JsonUtil.javaStringArray(json.get("groupby").getAsJsonArray());
        String[] o = json.get("orderby") == null || json.get("orderby").isJsonNull() ? null : JsonUtil.javaStringArray(json.get("orderby").getAsJsonArray());
        JsonObject variable = json.getAsJsonObject("variable");
        StringBuilder ww = new StringBuilder();
        StringBuilder hh = new StringBuilder();

        StringBuilder query = new StringBuilder(select_statement);

        if (areValidSelectFields(s, ss, getFieldMap(), select_fields, errors) == false) {
            errors.add("ERROR: validateSelectStatement.areValidSelectFields");
            return null;
        }

        if (c.replaceAll("[^?]", "").length() != wv.size()) {
            errors.add("ERROR: validateSelectStatement.escapement");
            return null;
        }

        if (isValidClause(Field.SELECT, c, getFieldMap(), /*select_fields,*/ wf, wv, ww, hh, ah, av, errors) == false) {
            errors.add("ERROR: validateSelectStatement.isValidClause");
            return null;
        }

        String oo = null;
        if (o != null) {
            oo = getFieldsOrderBy(vt, o, errors);
            if (errors.size() > 0) {
                errors.add("ERROR: validateSelectStatement.ORDER_BY_VALIDATION");
                return null;
            }
        }

        String gg = null;
        if (g != null) {
            gg = getFieldsGroupBy(g, errors);
            if (errors.size() > 0) {
                errors.add("ERROR: validateSelectStatement.GROUP_BY_VALIDATION");
                return null;
            }
        }
        //

        int idx = query.indexOf("$SELECT$");
        query.replace(idx, idx + 8, "");
        query.insert(idx, "SELECT ");
        query.insert(idx + 7, getFieldsSelect(gg != null && gg.length() > 0, variable, s, ss, errors));
        if (errors.size() > 0) {
            errors.add("ERROR: validateSelectStatement.SELECT");
            return null;
        }

        idx = query.indexOf("$WHERE$");
        query.replace(idx, idx + 7, "");
        if (ww != null && ww.length() > 0) {
            if (ww.lastIndexOf(" AND ") == ww.length() - 5) {
                ww = ww.delete(ww.lastIndexOf(" AND "), ww.length());
            }
            if (ww.lastIndexOf(" OR ") == ww.length() - 4) {
                ww = hh.delete(ww.lastIndexOf(" OR "), ww.length());
            }
        }        
        if (ww != null && ww.length() > 0) {
            query.insert(idx, " WHERE ");
            if (hasSelectWhereCondition() == true) {
                ww.insert(0, getSelectWhereCondition() + " AND ");
            }
            query.insert(idx + 7, ww);
        } else if (hasSelectWhereCondition() == true) {
            query.insert(idx, " WHERE ");
            ww.setLength(0);
            ww.append(getSelectWhereCondition());
            query.insert(idx + 7, ww);
        }
        if (errors.size() > 0) {
            errors.add("ERROR: validateSelectStatement.WHERE");
            return null;
        }

        idx = query.indexOf("$GROUPBY$");
        query.replace(idx, idx + 9, "");
        if (gg != null && gg.length() > 0) {
            query.insert(idx, "GROUP BY ");
            query.insert(idx + 9, gg);
        }
        if (errors.size() > 0) {
            errors.add("ERROR: validateSelectStatement.GROUP_BY");
            return null;
        }

        idx = query.indexOf("$HAVING$");
        query.replace(idx, idx + 8, "");
        if (hh != null && hh.length() > 0) {
            if (hh.lastIndexOf(" AND ") == hh.length() - 5) {
                hh.delete(hh.lastIndexOf(" AND "), hh.length());
            }
            if (hh.lastIndexOf(" OR ") == hh.length() - 4) {
                hh.delete(hh.lastIndexOf(" OR "), hh.length());
            }
        }
        if (hh != null && hh.length() > 0) {
            query.insert(idx, " HAVING ");
            query.insert(idx + 8, hh);
        }
        if (errors.size() > 0) {
            errors.add("ERROR: validateSelectStatement.HAVING");
            return null;
        }

        idx = query.indexOf("$ORDERBY$");
        query.replace(idx, idx + 9, "");
        if (oo != null && oo.length() > 0) {
            query.insert(idx, "ORDER BY ");
            query.insert(idx + 9, oo);
        }
        if (errors.size() > 0) {
            errors.add("ERROR: validateSelectStatement.ORDER_BY");
            return null;
        }

        return query.toString();
    }
    
    public void processSelectedRecord(ResultSet rs, JsonObject json, JsonObject record_object, ArrayList<String> s, JsonArray errors) throws Exception {
        for (int i = 0; i < s.size(); i++) {
            String alias = s.get(i);
            Field f = getField(alias);
            if (f.isIgnoredFor(Field.SELECT)) {
                continue;
            }
            //jrecord.addProperty(s[i], f.getFieldString(rs.getObject(f.getAlias())));
            Object fieldObject = rs.getObject(f.getAlias());
            if (fieldObject == null) {
                record_object.add(alias, JsonNull.INSTANCE);
            } else if (f.isNumeric() == true) {
                record_object.addProperty(alias, (Number) fieldObject);
            } else if (f.isBoolean() == true) {
                record_object.addProperty(alias, f.parseBoolean(fieldObject));
            } else {
                record_object.addProperty(alias, f.getFieldString(rs.getObject(f.getAlias())));
            }
        }
    }
    
    public void processSelectedObjectRecord(ResultSet rs, JsonObject json, JsonObject record_object, ArrayList<String> s, ArrayList<ServiceField> ss, JsonArray errors) throws Exception {
        for (int i = 0; i < s.size(); i++) {
            String alias = s.get(i);
            Field f = getField(alias);
            if (f.isIgnoredFor(Field.SELECT)) {
                continue;
            }
            //Object fieldObject = rs.getObject(f.getAlias());
            Object fieldObject = f.getPostProcessedValue(Field.SELECT, rs.getObject(f.getAlias()), errors);
            if (fieldObject == null) {
                record_object.add(alias, JsonNull.INSTANCE);
            } else if (f.isNumeric() == true) {
                record_object.addProperty(alias, (Number) fieldObject);
            } else if (f.isBoolean() == true) {
                record_object.addProperty(alias, f.parseBoolean(fieldObject));
            } else {
                //jrecord.addProperty(alias, f.getFieldString(rs.getObject(f.getAlias())));
                record_object.addProperty(alias, f.getFieldString(fieldObject));
            }
        }
        for (int i = 0; i < ss.size(); i++) {
            ServiceField sf = ss.get(i);
            Object fieldObject = rs.getObject(sf.getAlias());
            if (fieldObject == null) {
                record_object.add(sf.getAlias(), JsonNull.INSTANCE);
            } else if (sf.isNumeric() == true) {
                record_object.addProperty(sf.getAlias(), (Number) fieldObject);
            } else if (sf.isBoolean() == true) {
                record_object.addProperty(sf.getAlias(), sf.parseBoolean(fieldObject));
            } else {
                record_object.addProperty(sf.getAlias(), sf.getFieldString(rs.getObject(sf.getAlias())));
            }
        }
    }
    
    public void processSelectedArrayRecord(ResultSet rs, JsonObject json, JsonArray record_list, ArrayList<String> s, ArrayList<ServiceField> ss, JsonArray errors) throws Exception {
        for (int i = 0; i < s.size(); i++) {
            String alias = s.get(i);
            Field f = getField(alias);
            if (f.isIgnoredFor(Field.SELECT)) {
                continue;
            }
            //Object fieldObject = rs.getObject(f.getAlias());
            Object fieldObject = f.getPostProcessedValue(Field.SELECT, rs.getObject(f.getAlias()), errors);
            if (fieldObject == null) {
                record_list.add(JsonNull.INSTANCE);
            } else if (f.isNumeric() == true) {
                record_list.add((Number) fieldObject);
            } else if (f.isBoolean() == true) {
                record_list.add(f.parseBoolean(fieldObject));
            } else {
                //jrecord.add(f.getFieldString(rs.getObject(f.getAlias())));
                record_list.add(f.getFieldString(fieldObject));
            }
        }
        for (int i = 0; i < ss.size(); i++) {
            ServiceField sf = ss.get(i);
            Object fieldObject = rs.getObject(sf.getAlias());
            if (fieldObject == null) {
                record_list.add(JsonNull.INSTANCE);
            } else if (sf.isNumeric() == true) {
                record_list.add((Number) fieldObject);
            } else if (sf.isBoolean() == true) {
                record_list.add(sf.parseBoolean(fieldObject));
            } else {
                record_list.add(sf.getFieldString(rs.getObject(sf.getAlias())));
            }
        }
    }
    
    public void select(RecordProcessor record_processor, RecordHandler record_handler) throws Exception {
        
        validateSelectCommand(record_processor, record_handler);
        if (record_processor.getErrors().size() > 0) {
            return;
        }
        JsonObject database_request = record_processor.getTableRequest();
        
        if (record_handler.selectInject(record_processor) == false) {
            /*JsonObject response = createJsonResponseObject(false, 400, "Invalid Update PreLogic");
            response.add("errors", errors);
            sendResponse(req, resp, 400, response);*/
            return;
        }
        
        selectGson(record_processor, record_handler);
    }
    
    public void selectGson(RecordProcessor record_processor, RecordHandler record_handler) throws Exception {
        long t1, t2, t3, t4;
        t1 = System.nanoTime();
        JsonObject json = record_processor.getTableRequest();
        JsonArray errors = record_processor.getErrors();
        ArrayList<Field> wf = new ArrayList<Field>();
        ArrayList<ServiceField> ss = new ArrayList<ServiceField>();
        ArrayList<String> s = JsonUtil.javaStringArrayList(JsonUtil.getJsonArray(json, "select", false));
        String vt = json.get("view").getAsString();
        JsonObject w = json.get("where").getAsJsonObject();
        ArrayList<String> v = w.get("values") == null || w.get("values").isJsonNull() ? null : new ArrayList<String>(Arrays.asList(JsonUtil.javaStringArray(w.get("values").getAsJsonArray())));
        ArrayList<Argument> ah = new ArrayList<Argument>();
        ArrayList<Argument> av = new ArrayList<Argument>();
        JsonElement jt = json.get("datasource");
        String default_datasource_name = jt == null ? record_handler.getDefaultDatasourceName() : jt.getAsString();

        String sql = validateSelectStatement(json, wf, vt, s, ss, v, ah, av, w, errors);

        if (errors.size() > 0) {
            errors.add("ERROR: validateSelectStatement.selectGson.validateSelectStatement");
            return;
        }

        t2 = System.nanoTime();
        try (Connection con = record_handler.getDatabaseConnection(default_datasource_name)) {
            if (record_handler.selectPreLogic(record_processor, con) == false) {
                /*JsonObject response = createJsonResponseObject(false, 400, "Invalid Select Pre Logic");
                response.add("errors", errors);
                sendResponse(req, resp, 400, response);*/
                return;
            }
            
            /*
            Debug connection is SSL ciphered
            try (PreparedStatement preparedStmt = con.prepareStatement("SHOW STATUS LIKE 'Ssl_cipher'")) {
                try (ResultSet rs = preparedStmt.executeQuery()) {
                    while (rs.next() == true) {
                        String sss = rs.getString(2);
                        sss = sss;
                    }
                } catch(Exception ex) {
                    ex = ex;
                }
            } catch(Exception ex) {
                ex = ex;
            }*/

            try (PreparedStatement preparedStmt = con.prepareStatement(sql.toString())) {
                int idx = 0;
                for (Argument a : ah) {
                    for (String sv : a.getValues()) {
                        preparedStmt.setObject(++idx, sv);
                    }
                }
                for (Argument a : av) {
                    for (String sv : a.getValues()) {
                        preparedStmt.setObject(++idx, sv);
                    }
                }
                /*for (int i = 0; i < v.size(); i++) {
                    preparedStmt.setObject(++idx, v.get(i));
                }
                if (table.hasSelectWhereCondition() == true) {
                    //JsonArray selectFields = json.get("select").getAsJsonArray();
                    ArrayList<Field> field_list = table.getSelectWhereConditionFields();
                    for (int i = 0; i < field_list.size(); i++) {
                        for (int x = 0; x < wf.size(); x++) {
                            if (field_list.get(i).getAlias().equalsIgnoreCase(wf.get(x).getAlias())) {
                                preparedStmt.setObject(++idx, v.get(i));
                            }
                        }
                    }
                }*/
                //rs.beforeFirst();
                JsonObject table_view = new JsonObject();
                JsonArray view = null;
                Boolean ne = false;
                try (ResultSet rs = preparedStmt.executeQuery()) {
                    ne = rs.isBeforeFirst();
                    t3 = System.nanoTime();
                    view = new JsonArray();
                    if (vt.equalsIgnoreCase("process")) {
                        while (rs.next() == true) {
                            JsonObject record_object = new JsonObject();
                            processSelectedRecord(rs, json, record_object, s, errors);
                            if (record_handler.selectPerRecordLogic(record_processor, rs, record_object) == false) {
                                //do something!!
                            }
                            view.getAsJsonArray().add(record_object);
                        }
                    } else if (vt.equalsIgnoreCase("object")) {
                        while (rs.next() == true) {
                            JsonObject record_object = new JsonObject();
                            processSelectedObjectRecord(rs, json, record_object, s, ss, errors);
                            if (record_handler.selectPerRecordLogic(record_processor, rs, record_object) == false) {
                                //do something!!
                            }
                            view.getAsJsonArray().add(record_object);
                        }
                    } else if (vt.equalsIgnoreCase("array")) {
                        while (rs.next() == true) {
                            JsonArray record_list = new JsonArray();
                            processSelectedArrayRecord(rs, json, record_list, s, ss, errors);
                            if (record_handler.selectPerRecordLogic(record_processor, rs, record_list) == false) {
                                //do something!!
                            }
                            view.getAsJsonArray().add(record_list);
                        }
                    }
                    
                    table_view.add(table_name, view);
                    JsonArray child_view_list = new JsonArray();
                    table_view.add("children", child_view_list);
                    for (int i = 0; i < child_table_list.size(); i++) {
                        Table child_table = child_table_list.get(i);
                        child_table.selectGson(record_processor.getChildTableRecordProcessor(child_table.table_name), record_handler);
                        JsonObject child_view = record_processor.getDatabaseView();
                        child_view_list.add(child_view);
                    }
                    
                } catch (Exception sqlx) {
                    throw sqlx;
                }
                if (record_handler.selectPostLogic(record_processor, con, json, view) == false || record_handler.selectEject(record_processor) == false) {
                    //errors.add("Select completed but with post logic errors encountered");
                    return;
                }
                t4 = System.nanoTime();
                if (errors.size() > 0) {
                    throw new Exception("SELECT PROGRAM INTERNAL SEQUENCE ERROR");
                }
                
                record_processor.setDatabaseView(table_view);
                
            } catch (Exception sqlx) {
                throw sqlx;
            }
        } catch (Exception sqlx) {
            throw sqlx;
        }
    }

    /**************************************************************************/
    /************ INSERT PROCESSOR ********************************************/
    /**************************************************************************/
    
    public String validateInsertSetStatement(JsonObject json, JsonArray errorList) throws Exception {
        StringBuilder sql = new StringBuilder(insert_set_statement);
        JsonObject set = json.get("set").getAsJsonObject();
        Set<String> keys = set.keySet();
        for (String field : keys) {
            Field f = getField(field);
            String value = set.get(field).getAsString();
            Integer index = sql.indexOf("?" + field);
            sql.delete(index, index + field.length() + 1);
            sql.insert(index, f.getQuotable(value));
        }
        return sql.toString();
        /*//insert_set_statement_fields_name
        //insert_set_statement_fields_alias
        //Validate Mandatory Paramters
        String c = w.get("clause").getAsString();
        String[] o = javaStringArray(json.get("orderby").getAsJsonArray());
        StringBuilder ww = new StringBuilder();
        StringBuilder hh = new StringBuilder();
        
        StringBuilder query = new StringBuilder(select_statement);
        
        JsonArray errors = new JsonArray();
        if (areValidSelectFields(s, tableFields, select_fields, errors) == false) {
            sendError(req, resp, "INVALID_DATABASE_REQUEST_FIELDS_VALUES", "ERROR", "validateInsertSetStatement", 400, 1400, errors);
            return null;
        }
        
        if (c.replaceAll("[^?]", "").length() != wv.length) {
            sendError(req, resp, "INVALID_DATABASE_REQUEST_FIELDS_VALUES", "ERROR", "validateInsertSetStatement", 400, 1400, errors);
            return null;
        }
        
        if (isValidClause(c, tableFields, wf, wv, ww, hh, errors) == false) {
            sendError(req, resp, "INVALID_DATABASE_REQUEST_FIELDS_VALUES", "ERROR", "validateInsertSetStatement", 400, 1400, errors);
            return null;
        }
        
        String oo = getFieldsOrderBy(vt, o, errors);
        if (errors.size() > 0) {
            sendError(req, resp, "INVALID_DATABASE_REQUEST_FIELDS_VALUES", "ERROR", "validateInsertSetStatement", 400, 1400, errors);
            return null;
        }
        //
        
        int idx = query.indexOf("$SELECT$");
        query.replace(idx, idx+8, "");
        query.insert(idx, "SELECT ");
        query.insert(idx+7, getFieldsSelect(s));
        
        idx = query.indexOf("$WHERE$");
        query.replace(idx, idx+7, "");
        if (ww != null && ww.length() > 0) {
            query.insert(idx, " WHERE ");
            query.insert(idx+7, ww);
        }
        
        idx = query.indexOf("$HAVING$");
        query.replace(idx, idx+8, "");
        if (hh != null && hh.length() > 0) {
            query.insert(idx, " HAVING ");
            query.insert(idx+8, hh);
        }
        
        idx = query.indexOf("$ORDERBY$");
        query.replace(idx, idx+9, "");
        if (oo != null && oo.length() > 0) {
            query.insert(idx, " ORDER BY ");
            query.insert(idx+10, oo);
        }
        
        return query.toString();*/
    }
    
    public int insertValues(Connection con, PreparedStatement prepared_statement, JsonArray values, JsonObject variable, Returns returns) throws Exception {
        int affected_rows = 0;
        for (int oo = 0; oo < values.size(); oo++) {
            JsonObject o = values.get(oo).getAsJsonObject();
            int idx = 0;
            for (int i = 0; i < insert_fields.size(); i++) {
                Field field = insert_fields.get(i);
                if (field.isPrimaryKeyAI() == false && field.isPrimaryKeyMI() == false) {
                    JsonElement fje = o.get(insert_fields.get(i).getAlias());
                    String fieldValue = (fje == null || fje.isJsonNull() ? null : fje.getAsString());
                    prepared_statement.setObject(++idx, field.getFieldObject(fieldValue));
                }
            }
            if (hasPrimaryKeyMI() == true) {
                for (int i = 0; i < primary_keys.size(); i++) {
                    Field field = primary_keys.get(i);
                    if (/*field.isPrimaryKeyAI() == false && */field.isPrimaryKeyMI() == false) {
                        JsonElement fje = o.get(field.getAlias());
                        String fieldValue = (fje.isJsonNull() ? null : fje.getAsString());
                        prepared_statement.setObject(++idx, field.getFieldObject(fieldValue));
                    }
                }
            }
            prepared_statement.addBatch();
        }

        int[] affectRows = prepared_statement.executeBatch();
        for (int i = 0; i < affectRows.length; i++) {
            affected_rows += affectRows[i];
        }
        returns.Returns("t3", System.nanoTime());
        //Boolean return_insert_generated_id = getTransactionSecurityFlag(SECURITY_FLAG_RETURN_INSERT_GENERATED_ID);
        //if (return_insert_generated_id == true) {
        if (affected_rows > 0 && hasPrimaryKeyMI() == true) {
            for (int oo = 0; oo < values.size(); oo++) {
                JsonObject o = values.get(oo).getAsJsonObject();
                if (insert_statement_select == null) {
                    if (variable == null) {
                        throw new Exception("Variable is Null");
                    }
                    createRuntimeInsertStatementSelect(variable);
                }
                try (PreparedStatement preparedInsertedSelectStmt = con.prepareStatement(insert_statement_select)) {
                    int idx = 0;
                    for (int i = 0; i < insert_fields.size(); i++) {
                        Field f = insert_fields.get(i);
                        if (f.isPrimaryKeyMI() == false) {
                            JsonElement fje = o.get(insert_fields.get(i).getAlias());
                            String fieldValue = (fje == null || fje.isJsonNull() ? null : fje.getAsString());
                            preparedInsertedSelectStmt.setObject(++idx, f.getFieldObject(fieldValue));
                        }
                    }

                    try (ResultSet rs = preparedInsertedSelectStmt.executeQuery()) {
                        while (rs.next() == true) {
                            for (int i = 0; i < primary_keys_manual_increment_fields.size(); i++) {
                                Field f = primary_keys_manual_increment_fields.get(i);
                                o.addProperty(f.getAlias(), rs.getBigDecimal(f.getAlias()));
                            }
                        }
                        rs.close();
                    } catch (Exception sqlx) {
                        throw sqlx;
                    }
                    preparedInsertedSelectStmt.close();
                } catch (Exception sqlx) {
                    throw sqlx;
                }
            }
        } else if (affected_rows > 0 && hasPrimaryKeyAI() == true) {
            try (ResultSet generatedKeys = prepared_statement.getGeneratedKeys()) {
                int x = 0;
                while (generatedKeys.next()) {
                    JsonObject o = values.get(x++).getAsJsonObject();
                    int count = generatedKeys.getMetaData().getColumnCount();
                    for (int i = 0; i < count; i++) {
                        /*generatedKeys.getMetaData().getColumnLabel(i+1)*/
                        o.addProperty(primary_keys.get(i).getAlias(), generatedKeys.getInt(i + 1));
                    }
                }
                generatedKeys.close();
            } catch (Exception sqlx) {
                throw sqlx;
            }
        }
        return affected_rows;
    }
    
    public String getInsertStatement() {
        return insert_statement;
    }
    
    public ArrayList<Field> getInsertFields() {
        return insert_fields;
    }
    
    private String getInsertSetStatement() {
        return insert_set_statement;
    }
    
    /**************************************************************************/
    /************ UPDATE PROCESSOR ********************************************/
    /**************************************************************************/
    
    public String validateUpdateWhereStatement(String c, JsonArray v, JsonArray wff, JsonArray wvv, ArrayList<Field> uf, ArrayList<ArrayList<Object>> ufv, ArrayList<Argument> wa, ArrayList<Argument> ha, JsonArray errors) throws Exception {
        //Validate Mandatory Paramters
        ArrayList<String> vv = wvv == null ? null : new ArrayList<String>(Arrays.asList(JsonUtil.javaStringArray(wvv.getAsJsonArray())));
        ArrayList<String> ff = wff == null ? null : new ArrayList<String>(Arrays.asList(JsonUtil.javaStringArray(wff.getAsJsonArray())));
        ArrayList<Field> wf = new ArrayList<>();
        StringBuilder uu = new StringBuilder();
        StringBuilder ww = new StringBuilder();
        StringBuilder hh = new StringBuilder();

        StringBuilder query = new StringBuilder(update_statement);

        if (areValidUpdateFieldsValues(getFieldMap(), v, ff, update_fields, errors) == false) {
            errors.add("ERROR: validateUpdateWhereStatement.areValidUpdateFieldsValues");
            return null;
        }

        if (c == null || c.length() == 0 || (ff == null && vv == null) || isValidClause(Field.UPDATE, c, getFieldMap(), wf, vv, ww, hh, wa, ha, errors) == false) {
            errors.add("ERROR: validateUpdateWhereStatement.isValidClause");
            return null;
        }
        //

        JsonObject job = null;
        for (int i = 0; i < v.size(); i++) {
            ArrayList<Object> r = new ArrayList<>();
            JsonObject jsonObject = v.get(i).getAsJsonObject();
            if (jsonObject == null) {
                errors.add("Null Json Object on group [" + i + "]");
            } else if (jsonObject.size() == 0) {
                errors.add("Empty Json Object on group [" + i + "]");
            } else if (job != null && jsonObject.size() != job.size()) {
                errors.add("Json Object has different elements count on group [" + i + "]");
            }
            job = jsonObject;
            if (errors.size() > 0) {
                errors.add("ERROR: validateUpdateWhereStatement.Fields");
                return null;
            }
            if (uf.size() == 0) {
                Boolean nonPrimaryKeysExists = false;
                for (String fn : jsonObject.keySet()) {
                    Field f = getField(fn);
                    if (primary_keys != null && primary_keys.contains(fn) == true) {
                        //ignore
                        //errors.add("Field '" + fn + "' is a primary key and is not allowed for update");
                    } else if (f == null && ff != null && ff.contains(fn) == false) {
                        errors.add("Field '" + fn + "' is unknowen to where field_list");
                    } else if (f == null && ff != null && ff.contains(fn) == true) {
                        /*uf.add(f);
                        uu.append(f.getSQLName()).append("=?, ");*/
                    } else if (f == null) {
                        errors.add("Field '" + fn + "' is not a valid field name");
                    } else if (f.isPrimaryKey() == false) {
                        nonPrimaryKeysExists = true;
                        uf.add(f);
                        if (f.isUpdateFormulaDefined() == true) {
                            uu.append(f.getSQLName()).append("=").append(f.getUpdateFormulaDefined()).append(",");
                        } else {
                            uu.append(f.getSQLName()).append("=?, ");
                        }
                    }
                }
                if (nonPrimaryKeysExists == false) {
                    errors.add("Update abortred, no update can be performed over primary keys only record");
                } else {
                    uu.delete(uu.length() - 2, uu.length());
                }
                if (errors.size() > 0) {
                    errors.add("ERROR: validateUpdateWhereStatement.UPDATE_ABORTED");
                    return null;
                }
            }
            StringBuilder er = new StringBuilder();
            for (int x = 0; x < uf.size(); x++) {
                Field f = uf.get(x);
                String ue = JsonUtil.getJsonString(jsonObject, f.getAlias(), false);
                if (f.isValid(Field.UPDATE, ue, er) == false) {
                    errors.add(er.toString() + ", check in group index[" + (i + 1) + "]");
                } else {
                    String preProcessedValue = f.getPreProcessedValue(Field.UPDATE, ue, errors);
                    if (errors.size() > 0) {
                        errors.add("ERROR: validateUpdateWhereStatement.PRE_PROCESS");
                        return null;
                    }
                    r.add(f.getFieldObject(preProcessedValue));
                }
            }
            if (errors.size() > 0) {
                continue;
            }
            for (int x = jsonObject.size(); x < wf.size() + jsonObject.size(); x++) {
                Field f = wf.get(x - jsonObject.size());
                String ue = null;
                if (ff == null) {
                    ue = JsonUtil.getJsonString(wvv, x - jsonObject.size(), false);
                } else {
                    ue = JsonUtil.getJsonString(jsonObject, wff.get(x - jsonObject.size()).getAsString(), false);
                }
                if (f.isValid(Field.UPDATE, ue, er) == false) {
                    errors.add(er.toString());
                } else {
                    r.add(f.getFieldObject(ue));
                }
            }
            ufv.add(r);
        }

        if (errors.size() > 0) {
            errors.add("ERROR: validateUpdateWhereStatement.FIELD_VALIDATION");
            return null;
        }

        int idx = query.indexOf("$UPDATE$");
        query.replace(idx, idx + 8, "");
        if (uu != null && uu.length() > 0) {
            query.insert(idx, uu);
        }

        idx = query.indexOf("$WHERE$");
        query.replace(idx, idx + 7, "");
        if (ww != null && ww.length() > 0) {
            query.insert(idx, ww.length() == 0 ? "" : " WHERE ");
            query.insert(idx + 7, ww);
        }

        //put having in where for updates
        if (hh != null && hh.length() > 0) {
            query.insert(idx, hh.length() == 0 ? "" : " WHERE ");
            query.insert(idx + 7, hh);
        }

        return query.toString();
    }
    
    /**************************************************************************/
    /************ DELETE PROCESSOR ********************************************/
    /**************************************************************************/
    
    public String validateDeleteWhereStatement(String c, JsonArray v, JsonArray wff, JsonArray wvv, ArrayList<Field> uf, ArrayList<ArrayList<Object>> ufv, ArrayList<Argument> wa, ArrayList<Argument> ha, JsonArray errors) throws Exception {
        //Validate Mandatory Paramters
        ArrayList<String> vv = wvv == null ? null : new ArrayList<String>(Arrays.asList(JsonUtil.javaStringArray(wvv.getAsJsonArray())));
        ArrayList<String> ff = wff == null ? null : new ArrayList<String>(Arrays.asList(JsonUtil.javaStringArray(wff.getAsJsonArray())));
        ArrayList<Field> wf = new ArrayList<Field>();
        StringBuilder uu = new StringBuilder();
        StringBuilder ww = new StringBuilder();
        StringBuilder hh = new StringBuilder();

        StringBuilder query = new StringBuilder(delete_statement);

        if (c == null || c.length() == 0 || (ff == null && vv == null) || isValidClause(Field.INSERT, c, getFieldMap(), wf, vv, ww, hh, wa, ha, errors) == false) {
            errors.add("ERROR: validateUpdateWhereStatement.validateDeleteWhereStatement.isValidClause");
            return null;
        }

        JsonObject job = null;
        for (int i = 0; i < v.size(); i++) {
            ArrayList<Object> r = new ArrayList<>();
            JsonObject jsonObject = v.get(i).getAsJsonObject();
            if (jsonObject == null) {
                errors.add("Null Json Object on group [" + i + "]");
            } else if (jsonObject.size() == 0) {
                errors.add("Empty Json Object on group [" + i + "]");
            } else if (job != null && jsonObject.size() != job.size()) {
                errors.add("Json Object has different elements count on group [" + i + "]");
            }
            job = jsonObject;
            if (errors.size() > 0) {
                errors.add("ERROR: validateUpdateWhereStatement.validateDeleteWhereStatement.Fields");
                return null;
            }
            if (uf.size() == 0) {
                for (String alias : jsonObject.keySet()) {
                    Field f = getField(alias);
                    /*if (primary_keys != null && primary_keys.contains(fn) == true) {
                        errors.add("Field '" + fn + "' is a primary key and is not allowed for delete");
                    } else */
                    if (f == null && ff != null && ff.contains(alias) == false) {
                        errors.add("Field '" + alias + "' is unknowen to where field_list");
                    } else if (f == null && ff != null && ff.contains(alias) == true) {
                        /*uf.add(f);
                        uu.append(f.getSQLName()).append("=?, ");*/
                    } else if (f == null) {
                        errors.add("Field '" + alias + "' is not a valid field name");
                    } else {
                        uf.add(f);
                        //uu.append(f.getSQLName()).append("=?, ");
                    }
                }
                //uu.delete(uu.length() - 2, uu.length());
                if (errors.size() > 0) {
                    errors.add("ERROR: validateUpdateWhereStatement.validateDeleteWhereStatement.PRE_PROCESS");
                    return null;
                }
            }
            StringBuilder er = new StringBuilder();
            //// this section seems to be redundant from update method
            /*for (int x = 0; x < uf.size(); x++) {
                Field f = uf.get(x);
                String ue = getJsonString(jsonObject, f.getAlias());
                if (f.isValid(Field.DELETE, ue, er) == false) {
                    errors.add(er.toString() + "in group index[" + i + "]");
                } else {
                    r.add(f.getFieldObject(ue));
                }
            }
            if (errors.size() > 0) {
                continue;
            }*/
            for (int x = jsonObject.size(); x < wf.size() + jsonObject.size(); x++) {
                Field f = wf.get(x - jsonObject.size());
                String ue = null;
                if (ff == null) {
                    ue = JsonUtil.getJsonString(wvv, x - jsonObject.size(), false);
                } else {
                    ue = JsonUtil.getJsonString(jsonObject, wff.get(x - jsonObject.size()).getAsString(), false);
                }
                if (f.isValid(Field.DELETE, ue, er) == false) {
                    errors.add(er.toString());
                } else {
                    r.add(f.getFieldObject(ue));
                }
            }
            ufv.add(r);
        }

        if (errors.size() > 0) {
            errors.add("ERROR: validateUpdateWhereStatement.validateDeleteWhereStatement.FIELD_VALIDATION");
            return null;
        }

        int idx = -1;
        /*int idx = query.indexOf("$UPDATE$");
        query.replace(idx, idx+8, "");
        if (uu != null) {
            query.insert(idx, uu);
        }*/

        idx = query.indexOf("$WHERE$");
        query.replace(idx, idx + 7, "");
        StringBuilder w = ww != null && ww.length() > 0 ? ww : hh;
        if (w != null) {
            query.insert(idx, w.length() == 0 ? "" : " WHERE ");
            query.insert(idx + 7, w);
        }

        return query.toString();
    }
    
    /**
     * @param model_jdbc_source
     * @param model_id
     * @param errors
     * @throws java.lang.Exception
     */
    
    public static void loadDataModel(String secret_key, JDBCSource model_jdbc_source, JDBCSource data_jdbc_source, Integer model_id, HashMap<String, Class> interface_implementation, JsonArray errors) throws Exception {
        Integer model_instance_id = 1;
        DataClass.LoadMethod loadMethod = DataClass.LoadMethod.REFLECTION;
        DataLookup data_lookup = null;
        ModelDefinition data_model_definition = null;
        try (Connection data_connection = model_jdbc_source.getConnection(false)) {
            String select_model = "SELECT `model_id`, `model_instance_sequence_type_id`, `model_instance_sequence_last_value`, `model_name`, `model_version`, `model_class_path`, `model_data_lookup_category`, `modeled_database_url`, `modeled_database_url_user_name`, CAST(AES_DECRYPT(FROM_BASE64(`modeled_database_url_user_password`), ?) AS CHAR) AS `modeled_database_url_user_password`, `modeled_database_schem`, `modeled_database_name`, `modeled_database_field_open_quote`, `modeled_database_field_close_quote` FROM `"+model_jdbc_source.getDatabaseName()+"`.`model` WHERE `model_id`=?";
            try (PreparedStatement stmt = data_connection.prepareStatement(select_model)) {
                stmt.setString(1, secret_key);
                stmt.setInt(2, model_id);
                try (ResultSet rs = stmt.executeQuery()) {
                    ArrayList<ModelDefinition> data_model_definition_list = JsonResultset.resultset(rs, ModelDefinition.class);
                    if (data_model_definition_list == null || data_model_definition_list.size() == 0) {
                        errors.add("Data Model ID '"+model_id+"' is not exist");
                    } else {
                        data_model_definition = data_model_definition_list.get(0);
                    }
                    rs.close();
                } catch (Exception ex) {
                    throw ex;
                }
                stmt.close();
            } catch (Exception ex) {
                throw ex;
            }

            if (data_model_definition != null) {
                String sql = "SELECT `enum_name`, `enum_element_id`, `enum_element_code`, `enum_element_java_datatype`, `enum_element_typescript_datatype` FROM `"+model_jdbc_source.getDatabaseName()+"`.`lookup_enum` INNER JOIN `"+model_jdbc_source.getDatabaseName()+"`.`lookup_enum_element` ON `lookup_enum`.`enum_id` = `lookup_enum_element`.`enum_id` WHERE `lookup_enum`.`enum_name`=? ORDER BY `enum_name`, `enum_element_code`";
                try (PreparedStatement stmt = data_connection.prepareStatement(sql)) {
                    stmt.setString(1, data_model_definition.model_data_lookup_category);
                    try (ResultSet rs = stmt.executeQuery()) {
                        data_lookup = new DataLookup(rs, data_model_definition.model_data_lookup_category, "enum_name", "enum_element_id", "enum_element_code", "enum_element_java_datatype", "enum_element_typescript_datatype");
                        rs.close();
                    } catch (Exception ex) {
                        throw ex;
                    }
                } catch (Exception ex) {
                    throw ex;
                }
            }
        } catch (Exception exception) {
            throw exception;
        }
        if (data_model_definition != null) {
            DataProcessor<Enterprise> dataProcessor = new DataProcessor<Enterprise>(EnterpriseModel.class, Enterprise.class, model_jdbc_source, data_model_definition, data_lookup, interface_implementation);
            EnterpriseModel<Enterprise> enterprise_model = (EnterpriseModel<Enterprise>) dataProcessor.loadModelFromDatabase(model_id, model_instance_id, loadMethod);
            enterprise_model.getInstance().init();
            data_model_map.put(model_id, enterprise_model);
        }
    }
    
    private void initializeTable(Integer model_id) throws Exception {
        EnterpriseModel<Enterprise> enterprise_model = data_model_map.get(model_id);
        net.reyadeyat.relational.api.model.Table database_table = enterprise_model.getInstance().getDatabase(database_name).getTable(table_name);
        for(net.reyadeyat.relational.api.model.Field table_field: database_table.field_list) {
            String field_alias = table_field.name;
            FieldType field_type = FieldType.getClassFieldType(table_field.getTypeJavaClass());
            Boolean nullable = table_field.nullable;
            Boolean group = false;
            String field_name = table_field.name;
            Field field = addField(field_alias, field_type, nullable, group, field_name);
            if (table_field.getTypeJavaClass().equals(String.class) == true) {
                field.setTexLengthRange(0, table_field.size);
            } else if (table_field.getTypeJavaClass().equals(Number.class) == true) {
                field.setNumberRange(0, table_field.size);
            }
        }
        
        database_table = database_table;
        
        //scan table
        //add field_list
        /*
        addField("customer_id", FieldType.Integer, false, false, "customer_id").allow(Field.SELECT).disallow(Field.INSERT | Field.UPDATE);
        addField("erp_customer_id", FieldType.String, true, false, "erp_customer_id").allow(Field.SELECT).disallow(Field.INSERT | Field.UPDATE);
        addField("encrypted_customer_id", FieldType.String, false, false, "encrypted_customer_id").allow(Field.SELECT).disallow(Field.INSERT | Field.UPDATE);
        addField("customer_lang", FieldType.String, true, false, "customer_lang").setTexLengthRange(1, 255);
        addField("executive_user_name", FieldType.String, true, false, "executive_user_name").setTexLengthRange(1, 255);
        addField("executive_name_ar", FieldType.String, true, false, "executive_name_ar").setTexLengthRange(1, 255);
        addField("executive_name_en", FieldType.String, true, false, "executive_name_en").setTexLengthRange(1, 255);
        addField("executive_national_id", FieldType.String, true, false, "executive_national_id").setTexLengthRange(1, 255);
        addField("executive_phone", FieldType.String, true, false, "executive_phone").setTexLengthRange(1, 255);
        addField("executive_mobile", FieldType.String, true, false, "executive_mobile").setTexLengthRange(1, 255);
        addField("executive_fax", FieldType.String, true, false, "executive_fax").setTexLengthRange(1, 255);
        addField("executive_email", FieldType.String, true, false, "executive_email").setTexLengthRange(1, 255);
        addField("executive_address", FieldType.String, true, false, "executive_address").setTexLengthRange(1, 255);
        addField("company_data_name_ar", FieldType.String, true, false, "company_data_name_ar").setTexLengthRange(1, 255);
        addField("company_data_name_en", FieldType.String, true, false, "company_data_name_en").setTexLengthRange(1, 255);
        addField("company_data_country_id", FieldType.Integer, true, false, "company_data_country_id").setTexLengthRange(1, 255);
        addField("company_data_city_id", FieldType.Integer, true, false, "company_data_city_id").setTexLengthRange(1, 255);
        addField("company_data_area_id", FieldType.Integer, true, false, "company_data_area_id").setTexLengthRange(1, 255);
        addField("company_data_building", FieldType.String, true, false, "company_data_building").setTexLengthRange(1, 255);
        addField("company_data_district", FieldType.String, true, false, "company_data_district").setTexLengthRange(1, 255);
        addField("company_data_town", FieldType.String, true, false, "company_data_town").setTexLengthRange(1, 255);
        addField("company_data_street", FieldType.String, true, false, "company_data_street").setTexLengthRange(1, 255);
        addField("company_data_postal_code", FieldType.String, true, false, "company_data_postal_code").setTexLengthRange(1, 255);
        addField("company_data_another_id", FieldType.String, true, false, "company_data_another_id").setTexLengthRange(1, 255);
        addField("company_data_address_1", FieldType.String, true, false, "company_data_address_1").setTexLengthRange(1, 255);
        //addField("company_data_address_2", FieldType.String, true, false, "company_data_address_2").setTexLengthRange(1, 255);
        addField("company_activity_branch_id", FieldType.String, true, false, "company_activity_branch_id");
        addField("company_activity_category_id", FieldType.Integer, true, false, "company_activity_category_id");
        addField("company_activity_activity_id", FieldType.Integer, true, false, "company_activity_activity_id");
        addField("company_activity_distributor_id", FieldType.Integer, true, false, "company_activity_distributor_id");
        addField("company_activity_agreement", FieldType.Boolean, true, false, "company_activity_agreement");
        addField("approved", FieldType.Boolean, true, false, "approved");
        addField("authentified", FieldType.Boolean, true, false, "authentified");
        //addField("customer_verified_by_email", FieldType.Boolean, true, false, "customer_verified_by_email");
        //addField("customer_verified_by_email_code_sent", FieldType.Boolean, true, false, "customer_verified_by_email_code_sent");
        //addField("customer_verified_by_mobile", FieldType.Boolean, true, false, "customer_verified_by_mobile");
        //addField("customer_verified_by_mobile_code_sent", FieldType.Boolean, true, false, "customer_verified_by_mobile_code_sent");
        */
    }
    
    private void validateSelectCommand(RecordProcessor record_processor, RecordHandler record_handler) throws Exception {
        JsonObject database_request = record_processor.getTableRequest();
        if (database_request.get("engine") == null || database_request.get("engine").isJsonNull()) {
            record_processor.addError("Select command misses 'engin' property");
        } else if (database_request.get("view") == null || database_request.get("view").isJsonNull()) {
            record_processor.addError("Select command misses 'view' property");
        } else if (database_request.get("select") == null || database_request.get("select").isJsonNull()) {
            record_processor.addError("Select command misses 'select' array");
        } else if (database_request.get("select").isJsonArray() == false) {
            record_processor.addError("Select command has 'select' object while 'select' must be array");
        } else if (database_request.get("where") == null || database_request.get("where").isJsonNull()) {
            record_processor.addError("Select command misses 'where' compound object");
        } else if (database_request.get("where").getAsJsonObject().get("clause") == null || database_request.get("where").getAsJsonObject().get("clause").isJsonNull()) {
            record_processor.addError("Select command misses 'where.clause' property");
        } else if (database_request.get("where").getAsJsonObject().get("values") == null || database_request.get("where").getAsJsonObject().get("values").isJsonNull()) {
            record_processor.addError("Select command misses 'where.values' array");
        } else if (database_request.get("orderby") == null || database_request.get("orderby").isJsonNull()) {
            record_processor.addError("Select command misses 'orderby' array");
        }

        JsonElement jt;
        jt = database_request.get("engine");
        String engine = jt == null ? null : jt.getAsString();
        jt = database_request.get("view");
        String view = jt == null ? null : jt.getAsString();

        jt = database_request.get("datasource");
        String datasource_name = jt == null ? null : jt.getAsString();
        if (datasource_name == null) {
            datasource_name = record_handler.getDefaultDatasourceName();
            database_request.addProperty("datasource", datasource_name);
        }
        //Check data source is loaded
        if (record_handler.getDataSource(datasource_name) == null) {
            record_processor.addError("Datasource '" + datasource_name + "' not pooled on this container!");
        }

        if (engine.equalsIgnoreCase("memory") == false && engine.equalsIgnoreCase("stream") == false) {
            record_processor.addError("Undefined engine type '" + engine + "' define ['memory', 'stream']");
        }
        if (view.equalsIgnoreCase("object") == false && view.equalsIgnoreCase("array") == false && view.equalsIgnoreCase("process") == false) {
            record_processor.addError("Undefined view type '" + view + "' define ['object', 'array', 'process']");
        }
        if (engine.equalsIgnoreCase("memory") == false && view.equalsIgnoreCase("process") == true) {
            record_processor.addError("engine 'memory' is required for 'process' view");
        }
    }

    private void validateDeleteCommand(RecordProcessor record_processor) throws Exception {
        JsonObject database_request = record_processor.getTableRequest();
        if (database_request.get("values") == null || database_request.get("values").isJsonNull()) {
            record_processor.addError("Delete command misses 'values' array");
        } else if (database_request.get("values").isJsonArray() == false) {
            record_processor.addError("Delete command has 'values' object while 'values' must be array");
        } else if (database_request.get("values").getAsJsonArray().size() == 0) {
            record_processor.addError("Delete command has an empyt 'values' array");
        } else if (database_request.get("where") == null || database_request.get("where").isJsonNull()) {
            record_processor.addError("Delete command misses 'where' compound object");
        } else if (database_request.get("where").getAsJsonObject().get("clause") == null || database_request.get("where").getAsJsonObject().get("clause").isJsonNull()) {
            record_processor.addError("Delete command misses 'where.clause' object");
        } else if ((database_request.get("where").getAsJsonObject().get("values") == null || database_request.get("where").getAsJsonObject().get("values").isJsonNull())
                && (database_request.get("where").getAsJsonObject().get("field_list") == null || database_request.get("where").getAsJsonObject().get("field_list").isJsonNull())) {
            record_processor.addError("Delete command misses but shall have either 'where.values' or 'where.field_list' compound object");
        }
    }
    
    public void process(String table_name, JsonObject table_request, OutputStream response_output_stream, RecordHandler record_handler) throws Exception {
        RecordProcessor record_processor = new RecordProcessor(table_name, table_request, response_output_stream);
        String transactionType = (table_request.get("transaction") == null ? null : table_request.get("transaction").getAsString());
        if (transactionType == null || transaction_type_list.contains(transactionType) == false) {
            record_processor.addError("Bad Request, invalid transaction [" + transactionType + "] - valid transactions are [" + transaction_type_list + "]");
            return;
        }
        validateDeleteCommand(record_processor);
    }
}
