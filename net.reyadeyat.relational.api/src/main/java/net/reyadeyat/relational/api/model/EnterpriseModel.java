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

package net.reyadeyat.relational.api.model;

import net.reyadeyat.relational.api.data.ModelDefinition;
import net.reyadeyat.relational.api.data.DataModel;

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
public class EnterpriseModel<Model extends Enterprise> implements DataModel<Model> {

    private Model enterprise;

    public ModelDefinition model_definition;

    private EnterpriseModel() {
    }

    public EnterpriseModel(Model enterprise, ModelDefinition model_definition) {
        this.enterprise = enterprise;
        this.model_definition = model_definition;
    }

    @Override
    public Model getInstance() {
        return this.enterprise;
    }

    @Override
    public ModelDefinition getModelDefinition() {
        return this.model_definition;
    }

    @Override
    public java.lang.reflect.Field getDeclaredField() throws NoSuchFieldException {
        return EnterpriseModel.class.getDeclaredField("enterprise");
    }

    @Override
    public void prepareInstance() throws Exception {
        for (Database database : enterprise.databases) {
            database.enterprise = enterprise;
            database.case_sensitive_sql = enterprise.case_sensitive_sql;
            for (Table table : database.tables) {
                table.database = database;
                table.case_sensitive_sql = database.case_sensitive_sql;
                for (Field field : table.fields) {
                    field.table = table;
                    field.case_sensitive_sql = table.case_sensitive_sql;
                }
                for (PrimaryKey primaryKey : table.primaryKeys) {
                    primaryKey.table = table;
                    primaryKey.case_sensitive_sql = table.case_sensitive_sql;
                    for (PrimaryKeyField primaryKeyField : primaryKey.primary_key_field_list) {
                        primaryKeyField.parentPrimaryKey = primaryKey;
                        primaryKeyField.case_sensitive_sql = primaryKey.case_sensitive_sql;
                    }
                }
                for (ForeignKey foreign_key : table.foreignKeys) {
                    foreign_key.table = table;
                    foreign_key.case_sensitive_sql = table.case_sensitive_sql;
                    for (ForeignKeyField foreignKeyField : foreign_key.foreignKeyFields) {
                        foreignKeyField.foreignKey = foreign_key;
                        foreignKeyField.case_sensitive_sql = foreign_key.case_sensitive_sql;
                    }
                    for (ReferencedKeyField referencedKeyField : foreign_key.referencedKeyFields) {
                        referencedKeyField.foreign_key = foreign_key;
                        referencedKeyField.case_sensitive_sql = foreign_key.case_sensitive_sql;
                    }
                }
                for (ChildTable childTable : table.childTables) {
                    childTable.parentTable = table;
                    childTable.case_sensitive_sql = table.case_sensitive_sql;
                    String tableName = new String(childTable.tableName);
                    childTable.table = database.tables.stream().filter(o -> o.name.equals(tableName)).findAny().orElse(null);
                    String foreigKeyName = new String(childTable.foreigKeyName);
                    childTable.foreignKey = childTable./*parentTable*/table.foreignKeys.stream().filter(o -> o.name.equals(foreigKeyName)).findAny().orElse(null);
                    /*if (childTable.table.name.equalsIgnoreCase("ap_payment")) {
                        childTable = childTable;
                    }*/
                }
            }
            
            database.extractTableLogic(false);
        }
    }
}
