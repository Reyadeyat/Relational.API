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

package net.reyadeyat.relational.api.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

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
public class ForeignKey {
    public String name;
    public String referencedKeyname;
    public String foreignKeyTableName;
    public String referencedKeyTableName;
    transient public HashMap<ForeignKeyField, ReferencedKeyField> foreign_key_referenced_key_map;
    public ArrayList<ForeignKeyField> foreignKeyFields;
    public ArrayList<ReferencedKeyField> referencedKeyFields;
    public Integer key_sequence;
    public String update_rule;
    public String delete_rule;
    public String deferrability;
    
    transient public Boolean caseSensitiveSql;
    transient public Table table;
    transient public PrimaryKey primaryKey;
    
    /**no-arg default constructor for jaxb marshalling*/
    public ForeignKey() {
        this.foreignKeyFields = new ArrayList<ForeignKeyField>();
        this.referencedKeyFields = new ArrayList<ReferencedKeyField>();
        this.foreign_key_referenced_key_map = new HashMap<ForeignKeyField, ReferencedKeyField>();
    }
    
    public ForeignKey(Table table, String name,
    String referencedKeyname,
    String referencedKeyTableName,
    String foreignKeyTableName,
    Integer key_sequence,
    String update_rule,
    String delete_rule,
    String deferrability, Boolean caseSensitiveSql) throws Exception {
        this();
        this.table = table;
        this.name = name;
        this.referencedKeyname = referencedKeyname;
        this.foreignKeyTableName = foreignKeyTableName;
        this.referencedKeyTableName = referencedKeyTableName;
        this.key_sequence = key_sequence;
        this.update_rule = update_rule;
        this.delete_rule = delete_rule;
        this.deferrability = deferrability;
        this.caseSensitiveSql = caseSensitiveSql;
        
        switch(Integer.parseInt(this.update_rule)) {
            case 0: 
            case 1: 
            case 2: 
            case 3: break;
            default: throw new Exception("Unhandled Delete Rule ['" + update_rule + "']");
        }
        
        switch(Integer.parseInt(this.delete_rule)) {
            case 0: 
            case 1: 
            case 2: 
            case 3: break;
            default: throw new Exception("Unhandled Delete Rule ['" + update_rule + "']");
        }
    }
    
    public void addForeignFieldReferencedField(ForeignKeyField foreignKeyField, ReferencedKeyField referencedKeyField) {
        this.foreign_key_referenced_key_map.put(foreignKeyField, referencedKeyField);
        this.addReferencedField(referencedKeyField);
        this.addForeignField(foreignKeyField);
        
                
        for (Field field : table.fields) {
            if (field.name.equalsIgnoreCase(foreignKeyField.name) == true) {
                field.setForeignReference();
            }
        }
    }
    
    public void addReferencedField(ReferencedKeyField referencedKeyField) {
        referencedKeyFields.add(referencedKeyField);
    }
    
    public void addForeignField(ForeignKeyField foreignKeyField) {
        foreignKeyFields.add(foreignKeyField);
    }
    
    @Override
    public String toString() {
        StringBuilder appendable = new StringBuilder();
        try {
            toString(appendable, 0, 4);
            return appendable.toString();
        } catch (Exception exception) {
            appendable.delete(0, appendable.length());
            appendable.append("toString '").append(name).append("' error").append(exception.getMessage());
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "toString error", exception);
        }
        return appendable.toString();
    }
    
    public void toString(Appendable appendable, Integer level, Integer shift) throws Exception {
        appendable.append("\n");
        for (int i = 0; i < level * shift; i++) {
            /*if (i%4 == 0) {
                appendable.append("|");
            } else {
                appendable.append("_");
            }*/
            appendable.append(" ");
        }
        appendable.append("|");
        for (int i = 0; i < shift - 1; i++) {
            appendable.append(".");
        }
        appendable.append("Foreign Key CONSTRAINT `");
        appendable.append(name);
        appendable.append("` FOREIGN KEY ");
        appendable.append("(");
        int i = 1;
        for (ForeignKeyField foreignKeyFieldName : foreignKeyFields) {
            appendable.append("`");
            appendable.append(foreignKeyFieldName.name);
            i++;
            if (i < foreignKeyFields.size()) {
                appendable.append("`,");
            }
        }
        appendable.append(") REFERENCES");
        appendable.append(" `");
        appendable.append(referencedKeyTableName);
        appendable.append("` (");
        i = 1;
        for (ReferencedKeyField referencedKeyFieldName : referencedKeyFields) {
            appendable.append("`");
            appendable.append(referencedKeyFieldName.name);
            i++;
            if (i < foreignKeyFields.size()) {
                appendable.append("`,");
            }
        }
        appendable.append(") ");
        appendable.append(getUpdateRule());
        appendable.append(" ");
        appendable.append(getDeleteRule());
    }

    public void toString(Appendable appendable) throws Exception {
        appendable.append("Foreign Key CONSTRAINT `");
        appendable.append(name);
        appendable.append("` FOREIGN KEY ");
        appendable.append("(");
        int i = 1;
        for (ForeignKeyField foreignKeyFieldName : foreignKeyFields) {
            appendable.append("`");
            appendable.append(foreignKeyFieldName.name);
            i++;
            if (i < foreignKeyFields.size()) {
                appendable.append("`,");
            }
        }
        appendable.append(") REFERENCES");
        appendable.append(" `");
        appendable.append(referencedKeyTableName);
        appendable.append("` (");
        i = 1;
        for (ReferencedKeyField referencedKeyFieldName : referencedKeyFields) {
            appendable.append("`");
            appendable.append(referencedKeyFieldName.name);
            i++;
            if (i < foreignKeyFields.size()) {
                appendable.append("`,");
            }
        }
        appendable.append(") ");
        appendable.append(getUpdateRule());
        appendable.append(" ");
        appendable.append(getDeleteRule());
    }
    
    private String getDeleteRule() {
        switch(Integer.parseInt(delete_rule)) {
            case 1: return "ON DELETE RESTRICT";
            case 2: return "ON DELETE SET NULL";
            case 3: return "ON DELETE NO ACTION";
            default: return "ON DELETE CASCADE";
        }
    }
    
    private String getUpdateRule() {
        switch(Integer.parseInt(update_rule)) {
            case 1: return "ON UPDATE RESTRICT";
            case 2: return "ON UPDATE SET NULL";
            case 3: return "ON UPDATE NO ACTION";
            default: return "ON UPDATE CASCADE";
        }
    }
}
