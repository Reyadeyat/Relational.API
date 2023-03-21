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
public class ChildTable {
    public String tableName;
    public String parentTableName;
    public String foreigKeyName;
    
    transient public Boolean caseSensitiveSql;
    transient public Table parentTable;
    transient public Table table;
    transient public ForeignKey foreignKey;
    
    /**no-arg default constructor for jaxb marshalling*/
    public ChildTable() {}

    public ChildTable(Table parentTable, Table table, ForeignKey foreignKey, String parentTableName, String tableName, String foreigKeyName, Boolean caseSensitiveSql) {
        this.parentTable = parentTable;
        this.table = table;
        this.foreignKey = foreignKey;
        this.parentTableName = parentTableName;
        this.tableName = tableName;
        this.foreigKeyName = foreigKeyName;
        this.caseSensitiveSql = caseSensitiveSql;
    }
    
    public String toString(Integer level, Integer shift) {
        StringBuilder b = new StringBuilder();

        b.append("\n");
        for (int i = 0; i < level * shift; i++) {
            /*if (i%4 == 0) {
                b.append("|");
            } else {
                b.append("_");
            }*/
            b.append(" ");
        }
        b.append("|");
        for (int i = 0; i < shift - 1; i++) {
            b.append(".");
        }
        b.append("Child Table: ").append("[").append(tableName).append(" -> ").append(parentTableName).append("] [");
        for (int i = 0; i < foreignKey.foreignKeyFields.size(); i++) {
            ForeignKeyField foreignKeyFieldName = foreignKey.foreignKeyFields.get(i);
            ReferencedKeyField referencedKeyFieldName = foreignKey.referencedKeyFields.get(i);
            b.append("`").append(tableName).append("`.`").append(foreignKeyFieldName.name).append("` -> `").append(parentTableName).append("`.`").append(referencedKeyFieldName.name).append("`,");
        }
        if (foreignKey.foreignKeyFields.size() > 0) {
            b.delete(b.length()-1, b.length());
        }
        b.append("]");
        return b.toString();
    }

    @Override
    public String toString() {
        return new StringBuilder().append("ChildTable: ").append("[").append(tableName).append("] -> Parent Table: [").append(parentTableName).append("] ForeignKey: [").append(foreigKeyName).append("] On").toString();
    }
}
