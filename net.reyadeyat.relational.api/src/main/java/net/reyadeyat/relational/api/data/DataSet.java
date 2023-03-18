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

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

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
public class DataSet {
    class Table {
        class Field {
            String name;
            String alias;
            String classPath;
            public Field(String name, String alias, String classPath) {
                this.name = name;
                this.alias = alias;
                this.classPath = classPath;
            }
        }
        String name;
        String alias;
        ArrayList<Field> fields;
        public Table(String name, String alias) {
            this.name = name;
            this.alias = alias;
            this.fields = new ArrayList<Field>();
        }
        public void addField(String fieldAlias, String fieldName, String classPath) {
            fields.add(new Field(fieldAlias, fieldName, classPath));
        }
    }
    String sql;
    String tablesPath;
    ArrayList<Table> tables;
    ArrayList<HashMap<String, Object>> recordSet;
    
    public DataSet(String tablesPath) {
        this.tablesPath = tablesPath;
        tables = new ArrayList<Table>();
        recordSet = new ArrayList<HashMap<String, Object>>();
    }
    
    public void addTable(String tableAlias, String tableName) {
        tables.add(new Table(tableName, tableAlias));
    }
    
    public void addField(String tableAlias, String fieldAlias, String fieldName, String classPath) throws Exception {
        for (Table table : tables) {
            if (table.alias.equals(tableAlias)) {
                table.addField(fieldName, fieldAlias, classPath);
            }
        }
    }
    
    public void setSQL(String sql) throws Exception {
        if (sql == null) {
            throw new Exception("SQL statement is null!");
        }
        this.sql = sql;
    }
    
    public void addRecords(Connection connection, String whereClause) throws Exception {
        String sqlStatement = sql + (whereClause == null ? "" : whereClause);
        try (PreparedStatement preparedStatement = connection.prepareStatement(sqlStatement)) {
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    HashMap<String, Object> record = new HashMap<String, Object>();
                    for (int i = 0; i < tables.size(); i++) {
                        Table table = tables.get(i);
                        for (int x = 0; x < table.fields.size(); x++) {
                            Table.Field field = table.fields.get(x);
                            record.put(field.alias, rs.getObject(field.alias));
                        }
                    }
                    recordSet.add(record);
                }
                rs.close();
            }
            preparedStatement.close();
        } catch (Exception sqlx) {
            throw sqlx;
        }
    }
}
