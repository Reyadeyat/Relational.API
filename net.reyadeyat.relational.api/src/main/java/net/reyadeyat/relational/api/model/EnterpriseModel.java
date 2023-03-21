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

    public String modelVersion;
    public String modelName;
    public String modelDescription;

    private EnterpriseModel() {
    }

    public EnterpriseModel(Model enterprise, String modelVersion, String modelName, String modelDescription) {
        this.enterprise = enterprise;
        this.modelVersion = modelVersion;
        this.modelName = modelName;
        this.modelDescription = modelDescription;
    }

    @Override
    public String getVersion() {
        return this.modelVersion;
    }
    
    @Override
    public String getName() {
        return this.modelName;
    }

    @Override
    public Model getInstance() {
        return this.enterprise;
    }

    @Override
    public String getDescription() {
        return this.modelDescription;
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
                table.caseSensitiveSql = database.case_sensitive_sql;
                for (Field field : table.fields) {
                    field.table = table;
                    field.caseSensitiveSql = table.caseSensitiveSql;
                }
                for (PrimaryKey primaryKey : table.primaryKeys) {
                    primaryKey.table = table;
                    primaryKey.caseSensitiveSql = table.caseSensitiveSql;
                    for (PrimaryKeyField primaryKeyField : primaryKey.primaryKeyFields) {
                        primaryKeyField.parentPrimaryKey = primaryKey;
                        primaryKeyField.caseSensitiveSql = primaryKey.caseSensitiveSql;
                    }
                }
                for (ForeignKey foreignKey : table.foreignKeys) {
                    foreignKey.table = table;
                    foreignKey.caseSensitiveSql = table.caseSensitiveSql;
                    for (ForeignKeyField foreignKeyField : foreignKey.foreignKeyFields) {
                        foreignKeyField.foreignKey = foreignKey;
                        foreignKeyField.caseSensitiveSql = foreignKey.caseSensitiveSql;
                    }
                    for (ReferencedKeyField referencedKeyField : foreignKey.referencedKeyFields) {
                        referencedKeyField.foreignKey = foreignKey;
                        referencedKeyField.caseSensitiveSql = foreignKey.caseSensitiveSql;
                    }
                }
                for (ChildTable childTable : table.childTables) {
                    childTable.parentTable = table;
                    childTable.caseSensitiveSql = table.caseSensitiveSql;
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
