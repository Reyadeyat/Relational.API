/*
 * Copyright (C) 2023 Reyadeyat
 *
 * Reyadeyat/RELATIONAL.API is licensed under the
 * BSD 3-Clause "New" or "Revised" License
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * https://reyadeyat.net/RELATIONAL.API.LICENSE
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package net.reyadeyat.relational.api.data;

import net.reyadeyat.relational.api.annotation.DontJsonAnnotation;
import net.reyadeyat.relational.api.sequence.SequenceNumber;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.List;
import net.reyadeyat.relational.api.annotation.MetadataAnnotationDefault;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.reyadeyat.relational.api.annotation.MetadataAnnotation;

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
public class DataClass {

    public enum LoadMethod {
        JSON, REFLECTION
    };
    DataClass parentDataClass;
    String packageName;
    /*Integer minCardinality;
    Integer maxCardinality;
    Boolean isIndexed;*/
    /**
     * Table if true, Field if false
     */
    Boolean isTable;
    String name;
    String nameLower;
    String declaredName;
    String canonicalPath;
    Field field;
    Class clas;
    Class<?> type;
    MetadataAnnotation metadataAnnotation;

    List<DataClass> membersList;//members inside this class
    List<DataClass> tablesList;//table members inside this class
    List<DataClass> fieldsList;//field members inside this class// Inserted in parent table

    Map<String, DataClass> membersMap;//members inside this instace
    Map<String, DataClass> tablesMap;//table members inside this instace
    Map<String, DataClass> fieldsMap;//field members inside this instace // Inserted in parent table
    
    DataLookup data_lookup;
    
    
    public DataClass(DataClass parentDataClass, Field field, DataLookup data_lookup) throws Exception {
        /*if (dataClass == null) {
            throw new Exception("DataClass cannot be null");
        }
        if (parentDataClass != null && field == null) {
            throw new Exception("Field cannot be null for ParentDataClass " + parentDataClass.clas.getSimpleName());
        }*/
        this.field = field;
        this.data_lookup = data_lookup;
        this.declaredName = field.getName();
        /*if (declaredName.equalsIgnoreCase("childTables")) {
            declaredName = declaredName;
        }*/
        this.parentDataClass = parentDataClass;
        this.type = this.field.getType();
        //if (this.field != null) {
        this.field.setAccessible(true);
        List<Class> classes = getGenericClasses(this.field);
        if (classes.size() > 1) {
            throw new Exception("Multi Generic Type is not implemented yet");
        }
        this.clas = classes.get(0);
        //}

        if (parentDataClass == null) {
            this.packageName = this.clas.getPackage().getName();
        } else {
            this.packageName = parentDataClass.packageName;
        }
        this.metadataAnnotation = this.field.getAnnotation(MetadataAnnotation.class);
        this.metadataAnnotation = this.metadataAnnotation != null ? this.metadataAnnotation : new MetadataAnnotationDefault(this.name, getCompatibleType(this.clas), this.clas.getTypeName(), "");
        if (this.clas.getPackage().getName().startsWith(this.packageName) == true
                || this.metadataAnnotation.table() == true) {//Table
            this.isTable = true;
            if (this.metadataAnnotation.table() == true && this.metadataAnnotation.title().isEmpty() == false) {
                this.name = this.metadataAnnotation.title();
            } else {
                this.name = this.clas.getSimpleName();
            }
        } else if (isAllowedType()) {//Field
            this.isTable = false;
            this.name = this.field.getName();
        } else {
            throw new Exception("Data Package is '" + packageName + "'; can not traverse class " + clas.getSimpleName());
        }
        this.nameLower = this.name.toLowerCase();
        this.canonicalPath = this.parentDataClass == null ? this.name : this.parentDataClass.canonicalPath + "." + this.name;
        this.membersList = new ArrayList<>();
        this.tablesList = new ArrayList<>();
        this.fieldsList = new ArrayList<>();

        this.membersMap = new HashMap<>();
        this.tablesMap = new HashMap<>();
        this.fieldsMap = new HashMap<>();

        //Dig only inside own package
        if (this.clas.getPackage().getName().startsWith(this.packageName) == true) {
            List<Field> fields = new ArrayList<>();
            getFields(this.clas, fields);
            for (Field newDatafield : fields) {
                //////field.setAccessible(true); // grant access to (protected) field
                //DataClass newDataClass = dataClassWalker(this, nfield);
                DataClass newDataClass = new DataClass(this, newDatafield, this.data_lookup);
                this.membersList.add(newDataClass);
                this.membersMap.put(newDataClass.name, newDataClass);
                if (newDataClass.isTable) {//Table
                    this.tablesList.add(newDataClass);
                    this.tablesMap.put(newDataClass.name, newDataClass);
                } else {//Field
                    this.fieldsList.add(newDataClass);
                    this.fieldsMap.put(newDataClass.name, newDataClass);
                }
            }
        }
    }

    private void getFields(Class clas, List<Field> fields) {
        if (clas.getSuperclass().getName().equalsIgnoreCase("java.lang.Object") == false) {
            getFields(clas.getSuperclass(), fields);
        }
        Field[] declaredfields = clas.getDeclaredFields();
        for (Field field : declaredfields) {
            
            if ((field.isAnnotationPresent(DontJsonAnnotation.class)
                    && field.getAnnotation(DontJsonAnnotation.class).dontJson() == false
                    && Modifier.isTransient(field.getModifiers()) == true)
                ||
                    (field.isAnnotationPresent(DontJsonAnnotation.class) == false
                    && Modifier.isTransient(field.getModifiers()) == true)) {
                continue;
            }
            fields.add(field);
        }
    }

    /**
     * prevent empty initialization
     */
    private DataClass() {
    }

    @Override
    public String toString() {
        StringBuilder appendable = new StringBuilder();
        try {
            toString(appendable, 0, this);
            return appendable.toString();
        } catch (Exception exception) {
            appendable.delete(0, appendable.length());
            appendable.append("toString '").append(name).append("' error").append(exception.getMessage());
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "toString error", exception);
        }
        return appendable.toString();
    }

    public void toString(Appendable appendable) {
        try {
            appendable.append("DataClass [").append(name).append("]");
            toString(appendable, 0, this);
        } catch (Exception exception) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "toString error", exception);
        }
    }

    private void toString(Appendable appendable, Integer indentation, DataClass dataClass) throws Exception {
        for (int i = 0; i < indentation; i++) {
            appendable.append(" ");
        }
        if (dataClass.isTable == true) {
            appendable.append("~T-[").append(dataClass.name).append("]\n");
        } else if (dataClass.isTable == false) {
            appendable.append("~F-[").append(dataClass.name).append("]\n");
        }
        for (int i = 0; i < fieldsList.size(); i++) {
            toString(appendable, indentation + 6, fieldsList.get(i));
        }
        for (int i = 0; i < tablesList.size(); i++) {
            toString(appendable, indentation + 6, tablesList.get(i));
        }
    }

    public boolean isNotNull() {
        return (metadataAnnotation != null && metadataAnnotation.nullable() == false);
    }

    public Boolean hasParent() {
        return parentDataClass != null;
    }

    public String getParentName() {
        return parentDataClass.name;
    }

    public String getFieldType() throws Exception {
        /*if (metadataAnnotation.lookupCategory().isEmpty() == false) {
            //Convert String field to a Lookup ID field
            return "INT";
        } else if (metadataAnnotation.type().isEmpty() == false) {
            return metadataAnnotation.type();
        }*/
        return getCompatibleType(clas);
    }

    private Boolean isList(Field field) throws Exception {
        return Arrays.asList(field.getType().getInterfaces()).contains(List.class);
    }

    private Boolean isArray(Field field) throws Exception {
        return field.getType().isArray();
    }

    private Boolean isAllowedType() {
        if (clas.getTypeName().equalsIgnoreCase("java.lang.String")
                || clas.getTypeName().equalsIgnoreCase("java.lang.Boolean")
                || clas.getTypeName().equalsIgnoreCase("java.lang.Byte")
                || clas.getTypeName().equalsIgnoreCase("java.lang.Short")
                || clas.getTypeName().equalsIgnoreCase("java.lang.Integer")
                || clas.getTypeName().equalsIgnoreCase("java.lang.Long")
                || clas.getTypeName().equalsIgnoreCase("java.lang.Float")
                || clas.getTypeName().equalsIgnoreCase("java.lang.Double")
                || clas.getTypeName().equalsIgnoreCase("java.util.Date")
                || clas.getTypeName().equalsIgnoreCase("java.sql.String")
                || clas.getTypeName().equalsIgnoreCase("java.sql.Date")
                || clas.getTypeName().equalsIgnoreCase("java.sql.Time")
                || clas.getTypeName().equalsIgnoreCase("java.lang.Timestamp")
                || clas.getTypeName().equalsIgnoreCase("java.time.ZonedDateTime")) {
            return true;
        }
        return false;
    }

    static public List<Class> getGenericClasses(Field field) {

        ArrayList classes = new ArrayList<>();
        /*if (field.getGenericType() instanceof Class) {//Class
            if (field.getType().isArray()) {
                classes.add((Class) field.getType().getComponentType());
            } else {
                classes.add((Class) field.getType());
            }
        } else */
        if (field.getGenericType() instanceof ParameterizedType) {//Generic
            ParameterizedType genericType = (ParameterizedType) field.getGenericType();
            Type[] types = genericType.getActualTypeArguments();
            for (Type type : types) {
                classes.add((Class) type);
            }
        } else {
            if (field.getType().isArray()) {
                classes.add((Class) field.getType().getComponentType());
            } else {
                classes.add((Class) field.getType());
            }
        }

        return classes;
    }

    static public String getCompatibleType(Class clas) {
        if (clas.getTypeName().equalsIgnoreCase("java.lang.String") == true) {
            return "VARCHAR(256)";
        } else if (clas.getTypeName().equalsIgnoreCase("java.lang.Boolean") == true) {
            return "TINYINT";
        } else if (clas.getTypeName().equalsIgnoreCase("java.lang.Byte") == true) {
            return "TINYINT";
        } else if (clas.getTypeName().equalsIgnoreCase("java.lang.Short") == true) {
            return "SMALLINT";
        } else if (clas.getTypeName().equalsIgnoreCase("java.lang.Integer") == true) {
            return "INTEGER";
        } else if (clas.getTypeName().equalsIgnoreCase("java.lang.Long") == true) {
            return "BIGINT";
        } else if (clas.getTypeName().equalsIgnoreCase("java.lang.Float") == true) {
            return "FLOAT";
        } else if (clas.getTypeName().equalsIgnoreCase("java.lang.Double") == true) {
            return "DOUBLE";
        } else if (clas.getTypeName().equalsIgnoreCase("java.util.Date") == true) {
            return "DATE";
        } else if (clas.getTypeName().equalsIgnoreCase("java.sql.Date") == true) {
            return "DATE";
        } else if (clas.getTypeName().equalsIgnoreCase("java.sql.Time") == true) {
            return "TIME";
        } else if (clas.getTypeName().equalsIgnoreCase("java.sql.Timestamp") == true) {
            return "TIMESTAMP";
        } else if (clas.getTypeName().equalsIgnoreCase("java.time.ZonedDateTime") == true) {
            return "TIMESTAMP";
        }

        return "VARCHAR(256)";
    }

    private DataInstance createDataInstance(Object instanceObject, String databaseName) throws Exception {
        if (clas.equals(instanceObject.getClass())) {
            throw new Exception("object class does not equals to data class");
        }
        SequenceNumber<Integer> sequenceNumber = new SequenceNumber<Integer>(1, 1, false);
        DataInstance dataInstance = new DataInstance(DataInstance.State.NEW, databaseName, this, null, null, instanceObject, sequenceNumber, true);
        return dataInstance;
    }

    public void createDatabaseSchema(Connection connection, String databaseName, DataClass dataClass, ArrayList<String> dataClasses, ArrayList<String> creates) throws Exception {
        if (dataClasses.contains(dataClass.clas.getCanonicalName())) {
            throw new Exception("Error: Polymorphic Associations Detected with class '" + dataClass.clas.getCanonicalName() + "', use one to one class composition relation; refactor this class '" + dataClass.clas.getCanonicalName() + "' name into 2 distinct names");
        }
        if (dataClass.isTable == false) {
            throw new Exception("createDatabaseSchema takes table element only");
        }
        dataClasses.add(dataClass.clas.getCanonicalName());
        StringBuilder sql = new StringBuilder();
        //Create dataClass table with member fields 
        sql.append("CREATE TABLE IF NOT EXISTS `").append(databaseName).append("`.`").append(dataClass.nameLower).append("` (\n");
        sql.append(" ").append("`data_model_id` SMALLINT UNSIGNED NOT NULL,\n");
        sql.append(" ").append("`instance_id` BIGINT UNSIGNED NOT NULL,\n");
        sql.append(" ").append("`child_id` SMALLINT UNSIGNED NOT NULL,\n");
        sql.append(" ").append("`parent_id` SMALLINT UNSIGNED").append(dataClass.hasParent() ? " NOT" : "").append(" NULL,\n");
        sql.append(" ").append("`declared_field_name` VARCHAR(256) NOT NULL,\n");
        sql.append(" ").append("`class_name` VARCHAR(256) NOT NULL,\n");
        sql.append(" ").append("`json_object` LONGTEXT NOT NULL,\n");
        StringBuilder indexes = new StringBuilder();
        for (DataClass dbField : dataClass.fieldsList) {
            sql.append(" `").append(dbField.nameLower).append("` ").append(dbField.getFieldType());
            if (dbField.isNotNull() == true) {
                sql.append(" NOT NULL");
                if (dbField.metadataAnnotation.indexed() == true) {
                    if (dbField.metadataAnnotation.indexed_expresion().isEmpty() == false) {
                        indexes.append("  INDEX `").append(dbField.nameLower).append("` " + dbField.metadataAnnotation.indexed_expresion() + ",\n");
                    } else {
                        indexes.append("  INDEX(`").append(dbField.nameLower).append("`),\n");
                    }
                }
            }
            sql.append(",\n");
        }
        //indexes = indexes.length() > 2 ? indexes.delete(indexes.length()-2, indexes.length()): indexes;
        sql.append(indexes);
        /** no need to make parent a primary since child is unique, but parent key is primary to be reference in foreign keys*/
        sql.append("  PRIMARY KEY (`data_model_id`,`instance_id`,`child_id`").append(dataClass.hasParent() ? ",`parent_id`" : "").append(")");
        sql.append(dataClass.hasParent() ? "," : "").append("\n");
        if (dataClass.hasParent() == true) {
            sql.append("  FOREIGN KEY `fk_").append(dataClass.parentDataClass.nameLower).append("` (`data_model_id`,`instance_id`,`parent_id`)\n");
            sql.append("    REFERENCES `").append(dataClass.parentDataClass.nameLower).append("` (`data_model_id`,`instance_id`,`child_id`)\n");
            sql.append("    ON UPDATE CASCADE\n");
            sql.append("    ON DELETE RESTRICT\n");
        }
        sql.append(") ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;");
        creates.add(sql.toString());

        //Create dataClass child tables with member fields
        for (DataClass dbTable : dataClass.tablesList) {
            createDatabaseSchema(connection, databaseName, dbTable, dataClasses, creates);
        }
    }
    
    public Object loadFromDatabase(Connection modelConnection, Integer modelID, String databaseName, DataLookup dataLookup, Object instanceID, LoadMethod loadMethod, SequenceNumber<Integer> sequence, ArrayList<String> selects) throws Exception {
        Object instanceObject = null;//this.clas.getConstructor().newInstance();
        DataInstance dataInstance = null;//new DataInstance(this, null, null, instanceObject, false);
        //Handle Saved Sequences
        dataInstance = loadFromDatabase(modelConnection, modelID, databaseName, dataLookup, instanceID, loadMethod, selects, dataInstance, instanceObject, 1, sequence);
        return dataInstance.instances.get(0);
    }

    private DataInstance loadFromDatabase(Connection connection, Integer modelID, String databaseName, DataLookup dataLookup, Object instanceID, LoadMethod loadMethod, ArrayList<String> selects, DataInstance parentDataInstance, Object parentInstanceObject, Integer parentID, SequenceNumber<Integer> sequence) throws Exception {
        if (loadMethod != LoadMethod.JSON && loadMethod != LoadMethod.REFLECTION) {
            throw new Exception("Load Method '" + loadMethod + "' is not implemented");
        }
        if (isTable == false) {
            throw new Exception("Can't Load DataClass Field '~F-[" + name + "]', load only DataClass Table");
        }
        String sql = loadFromDatabase(modelID, databaseName, dataLookup, instanceID, loadMethod, parentID);
        selects.add(sql);
        ////System.out.println(sql);
        /*for (int i = 0; i < tablesList.size(); i++) {
            tablesList.get(i).loadFromDatabase(lookup, instanceID, databaseName, loadMethod, selects);
        }*/
        ArrayList<HashMap<String, Object>> dataset = new ArrayList<HashMap<String, Object>>();
        //Model modelInstance = null;
        try (Statement st = connection.createStatement()) {
            try (ResultSet rs = st.executeQuery(sql)) {
                while (rs.next()) {
                    HashMap<String, Object> record = new HashMap<String, Object>();
                    if (loadMethod == LoadMethod.JSON) {
                        record.put("instance_id", rs.getLong("instance_id"));
                        record.put("child_id", rs.getInt("child_id"));
                        record.put("parent_id", rs.getInt("parent_id"));
                        record.put("json_object", rs.getString("json_object").replaceAll("\"\"", "\""));
                    } else if (loadMethod == LoadMethod.REFLECTION) {
                        record.put("instance_id", rs.getLong("instance_id"));
                        record.put("child_id", rs.getInt("child_id"));
                        record.put("parent_id", rs.getInt("parent_id"));
                        record.put("declared_field_name", rs.getString("declared_field_name"));
                        record.put("class_name", rs.getString("class_name"));
                        for (int i = 0; i < fieldsList.size(); i++) {
                            DataClass sc = fieldsList.get(i);
                            if (sc.clas.getCanonicalName().equalsIgnoreCase("java.lang.Boolean")) {
                                record.put(sc.nameLower, rs.getBoolean(sc.nameLower));
                            } else {
                                record.put(sc.nameLower, rs.getObject(sc.nameLower));
                            }
                        }
                    }
                    dataset.add(record);
                }
            } catch (Exception ex) {
                throw ex;
            }
        } catch (Exception ex) {
            throw ex;
        }
        DataInstance newDataInstance = null;
        
        if (loadMethod == LoadMethod.JSON) {
            for (int i = 0; i < dataset.size(); i++) {
                HashMap<String, Object> record = dataset.get(i);
                Long instance_id = (Long) record.get("instance_id");
                Integer child_id = (Integer) record.get("child_id");
                Integer parent_id = (Integer) record.get("parent_id");
                String json_object = (String) record.get("json_object");
                Gson gson = new GsonBuilder().excludeFieldsWithModifiers(Modifier.TRANSIENT).create();
                Object instanceObject = gson.fromJson(json_object, this.clas);
                /*modelInstance = gsonN.fromJson(json_object, modelClass);
                model.setInstance(modelInstance);
                model.prepareInstance();*/
                newDataInstance = new DataInstance(DataInstance.State.LOADED, databaseName, this, parentDataInstance, parentInstanceObject, instanceObject, sequence, true);
            }
        } else if (loadMethod == LoadMethod.REFLECTION) {
            Object arrayInstanceObject = this.type.getConstructor().newInstance();
            if (parentInstanceObject != null) {
                this.field.set(parentInstanceObject, arrayInstanceObject);
            }
            if (clas.getSimpleName().equalsIgnoreCase("Database")) {
                clas = clas;
            }
            DataInstance recordDataInstance = null;
            if (parentInstanceObject == null) {//parent
                recordDataInstance = new DataInstance(DataInstance.State.LOADED, databaseName, this, parentDataInstance, parentInstanceObject, this.clas.getConstructor().newInstance(), sequence, false);
            } else {
                recordDataInstance = new DataInstance(DataInstance.State.LOADED, databaseName, this, parentDataInstance, parentInstanceObject, arrayInstanceObject, sequence, false);
            }
            recordDataInstance.parentID = parentID;
            //Load Instances into list
            for (int i = 0; i < dataset.size(); i++) {
                HashMap<String, Object> record = dataset.get(i);
                Long instance_id = (Long) record.get("instance_id");
                Integer child_id = (Integer) record.get("child_id");
                Integer parent_id = (Integer) record.get("parent_id");
                String declared_field_name = (String) record.get("declared_field_name");
                String class_name = (String) record.get("class_name");
                
                Object recordInstanceObject = null;
                if (parentInstanceObject == null) {//parent
                    recordInstanceObject = recordDataInstance.getInstanceObject();
                } else {
                    recordInstanceObject = this.clas.getConstructor().newInstance();
                    Method add = ArrayList.class.getDeclaredMethod("add", Object.class);
                    add.invoke(arrayInstanceObject, recordInstanceObject);
                }
                recordDataInstance.addInstanceObject(recordInstanceObject, child_id);
                for (int y = 0; y < fieldsList.size(); y++) {
                    DataClass fieldDataClass = fieldsList.get(y);
                    Object fieldInstanceObject = null;
                    if (fieldDataClass.metadataAnnotation.lookup() == true) {
                        fieldInstanceObject = data_lookup.lookupCode((Integer) record.get(fieldDataClass.nameLower));
                        fieldDataClass.field.set(recordInstanceObject, fieldInstanceObject);
                    } else if (fieldDataClass.clas.getCanonicalName().equalsIgnoreCase("java.lang.Boolean")) {
                        fieldInstanceObject = (Boolean) record.get(fieldDataClass.nameLower);
                        fieldDataClass.field.set(recordInstanceObject, fieldInstanceObject);
                    } else {
                        fieldInstanceObject = record.get(fieldDataClass.nameLower);
                        fieldDataClass.field.set(recordInstanceObject, fieldInstanceObject);
                    }
                    recordDataInstance.addChildInstanceObject(DataInstance.State.LOADED, fieldDataClass, recordInstanceObject, fieldInstanceObject, sequence, false);
                }
                for (int x = 0; x < tablesList.size(); x++) {
                    DataClass subRecordDataClass = tablesList.get(x);
                    subRecordDataClass.loadFromDatabase(connection, modelID, databaseName, dataLookup, instanceID, loadMethod, selects, recordDataInstance, recordInstanceObject, child_id, sequence);
                }
            }
            newDataInstance = recordDataInstance;
        }
        
        /*if (modelInstance == null) {
            throw new Exception("Can't Load DataClass, Instance Records not exist in Database");
        }
        return modelInstance;*/
        return newDataInstance;
    }

    private String loadFromDatabase(Integer modelID, String databaseName, DataLookup dataLookup, Object instanceID, LoadMethod loadMethod, Integer parentID) throws Exception {

        if (isTable == false) {
            throw new Exception("toSQL takes table element only");
        }
        
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT");
        if (loadMethod == LoadMethod.JSON) {
            sql.append(" `").append(nameLower).append("`.`instance_id`,`").append(nameLower).append("`.`child_id`,`").append(nameLower).append("`.`parent_id`,`").append(nameLower).append("`.`declared_field_name`,`").append(nameLower).append("`.`class_name`,`").append(nameLower).append("`.`json_object`");
        } else if (loadMethod == LoadMethod.REFLECTION) {
            sql.append(" `").append(nameLower).append("`.`instance_id`,`").append(nameLower).append("`.`child_id`,`").append(nameLower).append("`.`parent_id`,`").append(nameLower).append("`.`declared_field_name`,`").append(nameLower).append("`.`class_name`,");//,`json_object`");
            for (int i = 0; i < fieldsList.size(); i++) {
                DataClass fieldDataClass = fieldsList.get(i);
                sql.append("`").append(nameLower).append("`.`").append(fieldDataClass.nameLower).append("`,");
            }
            sql.delete(sql.length() - 1, sql.length());
        }
        sql.append(" FROM `").append(databaseName).append("`.`").append(nameLower).append("`");
        if (parentDataClass != null) {
            sql.append(" INNER JOIN `").append(databaseName).append("`.`").append(parentDataClass.nameLower).append("`");
            sql.append(" ON `").append(nameLower).append("`.`data_model_id`=`").append(parentDataClass.nameLower).append("`.`data_model_id`");
            sql.append(" AND `").append(nameLower).append("`.`instance_id`=`").append(parentDataClass.nameLower).append("`.`instance_id`");
            sql.append(" AND `").append(nameLower).append("`.`parent_id`=`").append(parentDataClass.nameLower).append("`.`child_id`");
        }
        sql.append(" WHERE `").append(nameLower).append("`.`data_model_id`=").append(modelID);
        sql.append(" AND `").append(nameLower).append("`.`instance_id`=");
        if (instanceID instanceof Number) {
            sql.append(instanceID);
        } else if (instanceID instanceof String) {
            sql.append("'").append(instanceID).append("'");
        }
        if (parentDataClass != null) {
            sql.append(" AND `").append(nameLower).append("`.`parent_id`=").append(parentID);
        }

        return sql.toString();
    }
}
