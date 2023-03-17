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

import net.reyadeyat.relational.api.data.DataLookup;
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
public class Field {
    public String name;
    @MetadataAnnotation (lookup=true)
    public String dataTypeName;
    //public String typeCode;
    public Boolean primary_key;
    public Boolean nullable;
    public Boolean autoIncrment;
    public Boolean foreign_reference;
    @MetadataAnnotation (field=true, nullable=true)
    public String defaultValue;
    public Integer list_order;
    public Integer size;
    public Integer decimalDigits;
    
    transient public Boolean caseSensitiveSql;
    transient public Table table;
    
    /**no-arg default constructor for jaxb marshalling*/
    public Field() {}

    public Field(Table table, String name,
            String dataTypeName,
            String dataTypeCode,
            Boolean nullable,
            Boolean autoIncrment,
            String defaultValue,
            Integer list_order,
            Integer size,
            Integer decimalDigits, Boolean caseSensitiveSql,
            DataLookup dataLookup) throws Exception {
        this.table = table;
        this.name = name;
        this.dataTypeName = dataTypeName.trim();
        /*if (this.table.name.equalsIgnoreCase("XYZ") == true) {
            this.dataTypeName = this.dataTypeName;
        }*/
        if (dataLookup.lookupID(this.dataTypeName) == null) {
            throw new Exception("Data Type '" + this.dataTypeName + "' is not defined in Lookup Category '" + dataLookup.getDataLookupCategory() + "'");
        }
        //this.typeCode = dataTypeCode;
        this.primary_key = false;
        this.nullable = nullable;
        this.autoIncrment = autoIncrment;
        this.foreign_reference = false;
        this.defaultValue = defaultValue;
        this.list_order = list_order;
        this.size = size;
        this.decimalDigits = decimalDigits;
        this.caseSensitiveSql = caseSensitiveSql;
    }
    
    public void init() {
    }
    
    public void setPrimaryKey() {
        primary_key = true;
    }
    
    public void setForeignReference() {
        foreign_reference = true;
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
        /*.append(dataTypeCode)*/
        b.append("Field: ").append("[").append(list_order).append("] `").append(name).append("` ")
                .append(dataTypeName).append("(").append(size).append(decimalDigits > 0 ? ","+decimalDigits : "").append(")")
                .append(nullable == true ? " NULL" : "")
                .append(autoIncrment == true ? " AUTOINCREMENT" : "")
                .append(defaultValue == null ? "" : " DEFAULT '" + defaultValue + "'");
        return b.toString();
    }

    @Override
    public String toString() {
        return new StringBuilder().append("Field: ").append("[").append(list_order).append("] `").append(name).append("` ")
                .append(dataTypeName).append("(").append(size).append(decimalDigits > 0 ? ","+decimalDigits : "").append(")")
                .append(nullable == true ? " NULL" : "")
                .append(autoIncrment == true ? " AUTOINCREMENT" : "")
                .append(defaultValue == null ? "" : " '" + defaultValue + "'").toString();
    }
    
    public String getTypeJavaClassPath() throws Exception {
        if ((dataTypeName.equalsIgnoreCase("TINYINT") || dataTypeName.equalsIgnoreCase("TINYINT UNSIGNED") && size == 1 /*mysql*/)
                || dataTypeName.equalsIgnoreCase("BOOLEAN"/*informix*/)) {
            return Boolean.class.getCanonicalName();
        } else if (dataTypeName.equalsIgnoreCase("TINYINT") || dataTypeName.equalsIgnoreCase("TINYINT UNSIGNED")) {
            return Byte.class.getCanonicalName();
        } else if (dataTypeName.equalsIgnoreCase("SMALLINT") || dataTypeName.equalsIgnoreCase("SMALLINT UNSIGNED")) {
            return Short.class.getCanonicalName();
        } else if (dataTypeName.equalsIgnoreCase("MEDIUMINT") || dataTypeName.equalsIgnoreCase("INT") || dataTypeName.equalsIgnoreCase("INTEGER")
                || dataTypeName.equalsIgnoreCase("MEDIUMINT UNSIGNED") || dataTypeName.equalsIgnoreCase("INT UNSIGNED") || dataTypeName.equalsIgnoreCase("INTEGER UNSIGNED")
                || dataTypeName.equalsIgnoreCase("BIT") || dataTypeName.equalsIgnoreCase("BIT UNSIGNED")
                || dataTypeName.equalsIgnoreCase("INT IDENTITY"/*sqlserver*/)
                || dataTypeName.equalsIgnoreCase("SERIAL"/*informix*/)) {
            return Integer.class.getCanonicalName();
        } else if (dataTypeName.equalsIgnoreCase("BIGINT")
                || dataTypeName.equalsIgnoreCase("BIGINT UNSIGNED")
                || dataTypeName.equalsIgnoreCase("BIGINT IDENTITY"/*sqlserver*/)
                || dataTypeName.equalsIgnoreCase("SERIAL8"/*informix*/)
                || dataTypeName.equalsIgnoreCase("INT8"/*informix*/)
                || dataTypeName.equalsIgnoreCase("BIGSERIAL"/*informix*/)) {
            return Long.class.getCanonicalName();
        } else if (dataTypeName.equalsIgnoreCase("FLOAT") || dataTypeName.equalsIgnoreCase("FLOAT UNSIGNED")) {
            return Float.class.getCanonicalName();
        } else if (dataTypeName.equalsIgnoreCase("DOUBLE") || dataTypeName.equalsIgnoreCase("DOUBLE UNSIGNED")) {
            return Double.class.getCanonicalName();
        } else if (dataTypeName.equalsIgnoreCase("NUMERIC") || dataTypeName.equalsIgnoreCase("DECIMAL")
            || dataTypeName.equalsIgnoreCase("NUMERIC UNSIGNED") || dataTypeName.equalsIgnoreCase("DECIMAL UNSIGNED")
            || dataTypeName.equalsIgnoreCase("UNIQUEIDENTIFIER")/*sqlserver*/
            || dataTypeName.equalsIgnoreCase("MONEY")/*sqlserver*/
            || dataTypeName.equalsIgnoreCase("numeric() identity")/*sqlserver*/) {
            if (decimalDigits == 0) {
                return Long.class.getCanonicalName();
            } else {
                return Double.class.getCanonicalName();
            }
        } else if (dataTypeName.equalsIgnoreCase("YEAR")
            || dataTypeName.equalsIgnoreCase("DATE")) {
            return java.sql.Date.class.getCanonicalName();
        } else if (dataTypeName.equalsIgnoreCase("TIME")) {
            return java.sql.Time.class.getCanonicalName();
        } else if (dataTypeName.equalsIgnoreCase("DATETIME")
            || dataTypeName.equalsIgnoreCase("TIMESTAMP")
            || dataTypeName.equalsIgnoreCase("SMALLDATETIME")
            || dataTypeName.toLowerCase().startsWith("datetime"/*informix*/)) {
            return java.sql.Timestamp.class.getCanonicalName();
        } else if (dataTypeName.equalsIgnoreCase("CHAR")
            || dataTypeName.equalsIgnoreCase("ENUM")
            || dataTypeName.equalsIgnoreCase("SET")
            || dataTypeName.equalsIgnoreCase("VARCHAR")
            || dataTypeName.equalsIgnoreCase("TINYTEXT")
            || dataTypeName.equalsIgnoreCase("TEXT")
            || dataTypeName.equalsIgnoreCase("MEDIUMTEXT")
            || dataTypeName.equalsIgnoreCase("LONGTEXT")
            || dataTypeName.equalsIgnoreCase("NVARCHAR"/*sqlserver*/)
            || dataTypeName.equalsIgnoreCase("NTEXT"/*sqlserver*/)
            || dataTypeName.equalsIgnoreCase("NCHAR"/*sqlserver*/)
            || dataTypeName.equalsIgnoreCase("SYSNAME"/*sqlserver*/)
            || dataTypeName.equalsIgnoreCase("GEOGRAPHY"/*sqlserver*/)
            || dataTypeName.equalsIgnoreCase("LVARCHAR"/*informix*/)) {
            return java.lang.String.class.getCanonicalName();
        } else if (dataTypeName.equalsIgnoreCase("BINARY")
            || dataTypeName.equalsIgnoreCase("VARBINARY")
            || dataTypeName.equalsIgnoreCase("TINYBLOB")
            || dataTypeName.equalsIgnoreCase("BLOB")
            || dataTypeName.equalsIgnoreCase("CLOB")
            || dataTypeName.equalsIgnoreCase("MEDIUMBLOB")
            || dataTypeName.equalsIgnoreCase("LONGBLOB")
            || dataTypeName.equalsIgnoreCase("IMAGE"/*sqlserver*/)) {
            return java.lang.Object.class.getCanonicalName();
        } else if (dataTypeName.equalsIgnoreCase("JSON")) {
            return com.google.gson.JsonElement.class.getCanonicalName();
        }
        throw new Exception("Field data type '" + dataTypeName + "' is not implemented yet");
    }
    
    public Class getTypeJavaClass() throws Exception {
        if ((dataTypeName.equalsIgnoreCase("TINYINT") || dataTypeName.equalsIgnoreCase("TINYINT UNSIGNED") && size == 1 /*mysql*/)
                || dataTypeName.equalsIgnoreCase("BOOLEAN"/*informix*/)) {
            return Boolean.class;
        } else if (dataTypeName.equalsIgnoreCase("TINYINT") || dataTypeName.equalsIgnoreCase("TINYINT UNSIGNED")) {
            return Byte.class;
        } else if (dataTypeName.equalsIgnoreCase("SMALLINT") || dataTypeName.equalsIgnoreCase("SMALLINT UNSIGNED")) {
            return Short.class;
        } else if (dataTypeName.equalsIgnoreCase("MEDIUMINT") || dataTypeName.equalsIgnoreCase("INT") || dataTypeName.equalsIgnoreCase("INTEGER")
                || dataTypeName.equalsIgnoreCase("MEDIUMINT UNSIGNED") || dataTypeName.equalsIgnoreCase("INT UNSIGNED") || dataTypeName.equalsIgnoreCase("INTEGER UNSIGNED")
                || dataTypeName.equalsIgnoreCase("BIT") || dataTypeName.equalsIgnoreCase("BIT UNSIGNED")
                || dataTypeName.equalsIgnoreCase("INT IDENTITY"/*sqlserver*/)
                || dataTypeName.equalsIgnoreCase("SERIAL"/*informix*/)) {
            return Integer.class;
        } else if (dataTypeName.equalsIgnoreCase("BIGINT")
                || dataTypeName.equalsIgnoreCase("BIGINT UNSIGNED")
                || dataTypeName.equalsIgnoreCase("BIGINT IDENTITY"/*sqlserver*/)
                || dataTypeName.equalsIgnoreCase("SERIAL8"/*informix*/)
                || dataTypeName.equalsIgnoreCase("INT8"/*informix*/)
                || dataTypeName.equalsIgnoreCase("BIGSERIAL"/*informix*/)) {
            return Long.class;
        } else if (dataTypeName.equalsIgnoreCase("FLOAT") || dataTypeName.equalsIgnoreCase("FLOAT UNSIGNED")) {
            return Float.class;
        } else if (dataTypeName.equalsIgnoreCase("DOUBLE") || dataTypeName.equalsIgnoreCase("DOUBLE UNSIGNED")) {
            return Double.class;
        } else if (dataTypeName.equalsIgnoreCase("NUMERIC") || dataTypeName.equalsIgnoreCase("DECIMAL")
            || dataTypeName.equalsIgnoreCase("NUMERIC UNSIGNED") || dataTypeName.equalsIgnoreCase("DECIMAL UNSIGNED")
            || dataTypeName.equalsIgnoreCase("UNIQUEIDENTIFIER")/*sqlserver*/
            || dataTypeName.equalsIgnoreCase("MONEY")/*sqlserver*/
            || dataTypeName.equalsIgnoreCase("numeric() identity")/*sqlserver*/) {
            if (decimalDigits == 0) {
                return Long.class;
            } else {
                return Double.class;
            }
        } else if (dataTypeName.equalsIgnoreCase("YEAR")
            || dataTypeName.equalsIgnoreCase("DATE")) {
            return java.sql.Date.class;
        } else if (dataTypeName.equalsIgnoreCase("TIME")) {
            return java.sql.Time.class;
        } else if (dataTypeName.equalsIgnoreCase("DATETIME")
            || dataTypeName.equalsIgnoreCase("TIMESTAMP")
            || dataTypeName.equalsIgnoreCase("SMALLDATETIME")
            || dataTypeName.toLowerCase().startsWith("datetime"/*informix*/)) {
            return java.sql.Timestamp.class;
        } else if (dataTypeName.equalsIgnoreCase("CHAR")
            || dataTypeName.equalsIgnoreCase("ENUM")
            || dataTypeName.equalsIgnoreCase("SET")
            || dataTypeName.equalsIgnoreCase("VARCHAR")
            || dataTypeName.equalsIgnoreCase("TINYTEXT")
            || dataTypeName.equalsIgnoreCase("TEXT")
            || dataTypeName.equalsIgnoreCase("MEDIUMTEXT")
            || dataTypeName.equalsIgnoreCase("LONGTEXT")
            || dataTypeName.equalsIgnoreCase("NVARCHAR"/*sqlserver*/)
            || dataTypeName.equalsIgnoreCase("NTEXT"/*sqlserver*/)
            || dataTypeName.equalsIgnoreCase("NCHAR"/*sqlserver*/)
            || dataTypeName.equalsIgnoreCase("SYSNAME"/*sqlserver*/)
            || dataTypeName.equalsIgnoreCase("GEOGRAPHY"/*sqlserver*/)
            || dataTypeName.equalsIgnoreCase("LVARCHAR"/*informix*/)) {
            return java.lang.String.class;
        } else if (dataTypeName.equalsIgnoreCase("BINARY")
            || dataTypeName.equalsIgnoreCase("VARBINARY")
            || dataTypeName.equalsIgnoreCase("TINYBLOB")
            || dataTypeName.equalsIgnoreCase("BLOB")
            || dataTypeName.equalsIgnoreCase("CLOB")
            || dataTypeName.equalsIgnoreCase("MEDIUMBLOB")
            || dataTypeName.equalsIgnoreCase("LONGBLOB")
            || dataTypeName.equalsIgnoreCase("IMAGE"/*sqlserver*/)) {
            return java.lang.Object.class;
        } else if (dataTypeName.equalsIgnoreCase("JSON")) {
            return com.google.gson.JsonElement.class;
        }
        throw new Exception("Field data type '" + dataTypeName + "' is not implemented yet");
    }
}
