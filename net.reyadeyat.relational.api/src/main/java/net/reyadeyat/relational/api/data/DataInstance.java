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

package net.reyadeyat.relational.api.data;

import net.reyadeyat.relational.api.sequence.SequenceNumber;
import static net.reyadeyat.relational.api.data.DataProcessor.zonedDateTimeAdapter;
import net.reyadeyat.relational.api.json.ZonedDateTimeAdapter;
import net.reyadeyat.relational.api.model.ForeignKeyField;
import net.reyadeyat.relational.api.model.ReferencedKeyField;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.List;
import java.util.HashMap;
import java.util.TreeMap;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Arrays;
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
public class DataInstance {
    public enum State{NEW,LOADED,UPDATED,DELETED};
    private State state;
    DataClass dataClass;
    DataInstance parentDataInstance;
    SequenceNumber<Integer> sequenceNumber;
    Boolean isNull;
    Integer parentID;
    Object instanceObject;
    HashMap<Object, Integer> instancesIDMap;
    ArrayList<Object> instances;
    String runtimePath;
    
    String databaseName;
    
    //used to get field array of an instance
    Map<Object, ArrayList<DataInstance>> membersMapList;//members inside this instace
    Map<Object, ArrayList<DataInstance>> tablesMapList;//table members inside this instace
    Map<Object, ArrayList<DataInstance>> fieldsMapList;//field members inside this instace // Inserted in parent table
    
    //used to get field by its name from inside an instance
    Map<Object, HashMap<String, DataInstance>> membersMapMap;//members inside this instace
    Map<Object, HashMap<String, DataInstance>> tablesMapMap;//table members inside this instace
    Map<Object, HashMap<String, DataInstance>> fieldsMapMap;//field members inside this instace // Inserted in parent table
    
    TreeMap<String, HashMap<String, Integer>> listCodeMap;
    
    static final public Gson gson = new GsonBuilder()/*.setPrettyPrinting()*/.registerTypeAdapter(ZonedDateTime.class, new ZonedDateTimeAdapter()).create();
    static final public ArrayList<String> ignore_field_list = new ArrayList<String>(
            Arrays.asList(new String[]{
                "java_package_name",
                "java_data_structure_class",
                "typescript_data_structure_class",
                "typescript_request_send_response",
                "typescript_form_component_ts",
                "typescript_form_component_ts",
                "typescript_form_component_html",
                "typescript_table_component_ts",
                "typescript_table_component_html",
                "database_servlet_class",
                "database_servlet_uri",
                "http_requests"
            }));
    
    public DataInstance(State state, String databaseName, DataClass dataClass, DataInstance parentDataInstance, Object parentInstanceObject, Object instanceObject, SequenceNumber<Integer> sequenceNumber, Boolean traverse) throws Exception {
        this.state = state;
        this.databaseName = databaseName;
        this.dataClass = dataClass;
        if (this.dataClass == null) {
            throw new Exception("DataClass is null !!!");
        }
        if (dataClass.declaredName.equalsIgnoreCase("childTables")) {
            dataClass.declaredName = dataClass.declaredName;
        }
        this.parentDataInstance = parentDataInstance;
        this.sequenceNumber = sequenceNumber;
        this.parentID = /*sequenceNumber == null ? 0 : */parentDataInstance == null ? 0 : parentDataInstance.instancesIDMap.get(parentInstanceObject);
        //this.nextChildTableID = travers == false ? 0 : parentDataInstance == null ? 0 : parentDataInstance.nextChildTableID;
        //this.parentInstanceObject = parentInstanceObject;
        this.instanceObject = instanceObject;
        if (this.instanceObject == null && this.dataClass.isNotNull() == true) {
            if (this.dataClass.declaredName.equalsIgnoreCase("referenced_key_name") == true) {
                if (dataClass.field.getName().equalsIgnoreCase("referenced_key_name")) {
                    if (parentInstanceObject instanceof net.reyadeyat.relational.api.model.ForeignKey foreign_key) {
                        StringBuilder foreign_key_field_list_strb = new StringBuilder();
                        Boolean is_primary_key = true;
                        for (ForeignKeyField foreign_key_field : foreign_key.foreign_key_field_list) {
                            foreign_key_field_list_strb.append("`").append(foreign_key_field.name).append("`,");
                        }
                        if (foreign_key.foreign_key_field_list.size() > 0) {
                            foreign_key_field_list_strb.delete(foreign_key_field_list_strb.length()-1, foreign_key_field_list_strb.length());
                        }
                        StringBuilder referenced_key_field_list_strb = new StringBuilder();
                        for (ReferencedKeyField referenced_key_field : foreign_key.referenced_key_field_list) {
                            referenced_key_field_list_strb.append("`").append(referenced_key_field.name).append("`,");
                            is_primary_key = is_primary_key && referenced_key_field.is_primary_key_field;
                        }
                        if (foreign_key.referenced_key_field_list.size() > 0) {
                            referenced_key_field_list_strb.delete(referenced_key_field_list_strb.length()-1, referenced_key_field_list_strb.length());
                        }
                        if (is_primary_key == false) {
                            throw new Exception("Database Foreign Key Constraint sufferes integgrity check failure Table.[Field List] `"+foreign_key.foreign_key_table_name+"`.["+foreign_key_field_list_strb.toString()+"] has Foreing Key '"+foreign_key.name+"' linked to a none Primary Key Table.[Field List] `"+foreign_key.referenced_key_table_name+"`.["+referenced_key_field_list_strb.toString()+"], please fix this issue first !!!");
                        }
                    }
                }
            }
            //throw new Exception("Instance Object is null in '" + this.dataClass.name + "'");
        }
        if (parentDataInstance == null && this.dataClass.clas.isInstance(this.instanceObject) == false) {
            throw new ClassCastException("DataInstance '" + this.dataClass.clas.getCanonicalName() + "' required class but got instance object of class '" + this.instanceObject.getClass().getCanonicalName() + "'");
        }
        this.instancesIDMap = new HashMap<Object, Integer>();
        
        this.isNull = instanceObject == null;
        
        this.membersMapList = new HashMap<>();
        this.tablesMapList = new HashMap<>();
        this.fieldsMapList = new HashMap<>();

        this.membersMapMap = new HashMap<>();
        this.tablesMapMap = new HashMap<>();
        this.fieldsMapMap = new HashMap<>();
        
        if (traverse == false) {
            this.instances = new ArrayList<>();
            return;
        }
        
        if (isList(dataClass.field)) {
            this.instances = (ArrayList<Object>) this.instanceObject;
        } else if (isArray(dataClass.field)) {
            this.instances = new ArrayList<Object>(Arrays.asList((Object[]) this.instanceObject));
        } else {
            this.instances = new ArrayList<Object>(Arrays.asList(new Object[]{this.instanceObject}));
        }
        
        //If class is not in the package use it field name
        //Dig only inside own package
        if (this.dataClass.clas.getPackage().getName().startsWith(this.dataClass.packageName) == false
                /*&& this.dataClass.metadataAnnotation.table() == false*/) {
            return;
        }
        
        this.sequenceNumber.createSequence(this.dataClass.clas);
        for (Object instance : this.instances) {
            this.instancesIDMap.put(instance, this.sequenceNumber.nextSequence(this.dataClass.clas));
            ArrayList<DataInstance> membersList = new ArrayList<>();
            ArrayList<DataInstance> tablesList = new ArrayList<>();
            ArrayList<DataInstance> fieldsList = new ArrayList<>();

            HashMap<String, DataInstance> membersMap = new HashMap<>();
            HashMap<String, DataInstance> tablesMap = new HashMap<>();
            HashMap<String, DataInstance> fieldsMap = new HashMap<>();
            
            for (DataClass newDataClass : this.dataClass.membersList) {
                Object newInstanceObject = newDataClass.field.get(instance);
                DataInstance newDataInstance = new DataInstance(this.state, this.databaseName, newDataClass, this, instance, newInstanceObject, this.sequenceNumber, true);
                membersList.add(newDataInstance);
                membersMap.put(newDataInstance.dataClass.name, newDataInstance);
                if (newDataInstance.dataClass.isTable) {//Table
                    tablesList.add(newDataInstance);
                    tablesMap.put(newDataInstance.dataClass.name, newDataInstance);
                } else {//Field
                    fieldsList.add(newDataInstance);
                    fieldsMap.put(newDataInstance.dataClass.name, newDataInstance);
                }
            }
            this.addMemeber(instance, membersList, tablesList, fieldsList, membersMap, tablesMap, fieldsMap);
        }
    }
    
    public void changeState(State state, Boolean propagateToChildren) throws Exception {
        changeState(this, state, propagateToChildren);
    }
    
    private void changeState(DataInstance dataInstance, State state, Boolean propagateToChildren) throws Exception {
        this.state = state;
        if (dataInstance.isNull == true) {
            return;
        }
        for (Object object : dataInstance.instances) {
            if (dataInstance.membersMapList.size() > 0) {
                for (DataInstance memberDataInstance : dataInstance.membersMapList.get(object)) {
                    changeState(memberDataInstance, state, propagateToChildren);
                }
            }
        }
    }
    
    public Object getInstanceObject() {
        return this.instanceObject;
    }
    
    public void addInstanceObject(Object instance, Integer childID) throws Exception {
        this.instances.add(instance);
        this.instancesIDMap.put(instance, /*sequenceNumber.nextSequence()*/childID);
        ArrayList<DataInstance> membersList = new ArrayList<>();
        ArrayList<DataInstance> tablesList = new ArrayList<>();
        ArrayList<DataInstance> fieldsList = new ArrayList<>();

        HashMap<String, DataInstance> membersMap = new HashMap<>();
        HashMap<String, DataInstance> tablesMap = new HashMap<>();
        HashMap<String, DataInstance> fieldsMap = new HashMap<>();
        /*for (DataClass newDataClass : this.dataClass.membersList) {
            Object newInstanceObject = newDataClass.field.get(instance);
            DataInstance newDataInstance = new DataInstance(newDataClass, this, instance, newInstanceObject/*, sequenceNumber*//*, false);
            membersList.add(newDataInstance);
            membersMap.put(newDataInstance.dataClass.name, newDataInstance);
            if (newDataInstance.dataClass.isTable) {//Table
                tablesList.add(newDataInstance);
                tablesMap.put(newDataInstance.dataClass.name, newDataInstance);
            } else {//Field
                fieldsList.add(newDataInstance);
                fieldsMap.put(newDataInstance.dataClass.name, newDataInstance);
            }
        }*/
        this.addMemeber(instance, membersList, tablesList, fieldsList, membersMap, tablesMap, fieldsMap);
    }
    
    public void addChildInstanceObject(State childState, DataClass newDataClass, Object parentInstanceObject, Object newInstanceObject, SequenceNumber<Integer> sequenceNumber, Boolean traverse) throws Exception {
        ArrayList<DataInstance> membersList = this.membersMapList.get(parentInstanceObject);
        ArrayList<DataInstance> tablesList = this.tablesMapList.get(parentInstanceObject);
        ArrayList<DataInstance> fieldsList = this.fieldsMapList.get(parentInstanceObject);
        
        HashMap<String, DataInstance> membersMap = this.membersMapMap.get(parentInstanceObject);
        HashMap<String, DataInstance> tablesMap = this.tablesMapMap.get(parentInstanceObject);
        HashMap<String, DataInstance> fieldsMap = this.fieldsMapMap.get(parentInstanceObject);
        
        DataInstance newDataInstance = new DataInstance(childState, this.databaseName, newDataClass, this, parentInstanceObject, newInstanceObject, sequenceNumber, traverse);
        membersList.add(newDataInstance);
        membersMap.put(newDataInstance.dataClass.name, newDataInstance);
        if (newDataInstance.dataClass.isTable) {//Table
            tablesList.add(newDataInstance);
            tablesMap.put(newDataInstance.dataClass.name, newDataInstance);
        } else {//Field
            fieldsList.add(newDataInstance);
            fieldsMap.put(newDataInstance.dataClass.name, newDataInstance);
        }
    }
    
    public void addMemeber(Object instance, 
            ArrayList<DataInstance> membersList,
            ArrayList<DataInstance> tablesList,
            ArrayList<DataInstance> fieldsList,
            HashMap<String, DataInstance> membersMap,
            HashMap<String, DataInstance> tablesMap,
            HashMap<String, DataInstance> fieldsMap) {
        this.membersMapList.put(instance, membersList);
        this.tablesMapList.put(instance, tablesList);
        this.fieldsMapList.put(instance, fieldsList);
        
        this.membersMapMap.put(instance, membersMap);
        this.tablesMapMap.put(instance, tablesMap);
        this.fieldsMapMap.put(instance, fieldsMap);
    }
    
    public void setCodeMap(TreeMap<String, HashMap<String, Integer>> listCodeMap) {
        this.listCodeMap = listCodeMap;
    }
    
    public Integer getCodeID(String categoryName, String code) {
        return listCodeMap.get(categoryName).get(code);
    }
    
    public Boolean hasParent() {
        return parentDataInstance != null;
    }
    
    public String getParentName() {
        return parentDataInstance.dataClass.name;
    }
    
    private Boolean isList(Field field) throws Exception {
        return Arrays.asList(field.getType().getInterfaces()).contains(List.class);
    }
    
    private Boolean isArray(Field field) throws Exception {
        return field.getType().isArray();
    }
    
    private Boolean isArrayType(Class clas, Field field) throws Exception {
        List<Class> list = Arrays.asList(field.getType().getInterfaces());
        if (field.getType().isArray()
                //|| list.contains(List.class)
                || field.getType().equals(List.class)
                || field.getType().equals(ArrayList.class)) {
            //isArray = true;
            return true;
        } else if (field.getType().getCanonicalName().endsWith("boolean")
                || field.getType().getCanonicalName().endsWith("byte")
                || field.getType().getCanonicalName().endsWith("char")
                || field.getType().getCanonicalName().endsWith("short")
                || field.getType().getCanonicalName().endsWith("int")
                || field.getType().getCanonicalName().endsWith("long")
                || field.getType().getCanonicalName().endsWith("float")
                || field.getType().getCanonicalName().endsWith("double")
                ) {
        } else if (field.getType().getPackage().getName().startsWith("java.util")) {
            throw new Exception("Only {Array, List, ArrayList} containers are implemented");
        }
        
        //isArray = false;
        return false;
    }
    
    public String getFieldInstanceDatabaseString(DataLookup dataLookup) throws Exception {
        Object theObject = null;
        //Check Annotation for lookup
        if (dataClass.metadataAnnotation.lookup() == true) {
            //Lookup ID with String
            Object string = instances.get(0);
            if (string instanceof String) {
                theObject = dataLookup.lookupID((String) instances.get(0));
            } else {
                throw new Exception("Only String field_list can be used with metadataAnnotation");
            }
        } else {
            theObject = instances.get(0);
        }
        if (theObject instanceof String) {
            StringBuilder string = new StringBuilder(theObject.toString());
            int pos = 0;
            while ((pos = string.indexOf("\"", pos)) > -1) {
                string.insert(pos, "\\");
                pos += 2;
            }
            string.insert(0, "\"");
            string.append("\"");
            return string.toString();
        } else if (theObject instanceof Boolean) {
            return String.valueOf((Boolean) theObject);
        } else if (theObject instanceof Number) {
            return String.valueOf((Number) theObject);
        } else if (theObject instanceof ZonedDateTime) {
            //return "\"" + zonedDateTimeAdapter.marshal((ZonedDateTime) fieldObject) + "\"" ;
            return "\"" + zonedDateTimeAdapter.toJDBCDateTime((ZonedDateTime) theObject) + "\"" ;
        } else if (theObject == null) {
            throw new Exception("Null value passed for DB field => " + dataClass.name + " => " + runtimePath);
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "Null value passed for DB field => " + dataClass.name);
            //return "null";
        }
        throw new Exception("Unsupported Database data type => " + instanceObject.getClass().getName());
    }
    
    @Override
    public String toString() {
        StringBuilder appendable = new StringBuilder();
        try {
            toString(appendable);
            return appendable.toString();
        } catch (Exception exception) {
            appendable.delete(0, appendable.length());
            appendable.append("toString error").append(exception.getMessage());
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "toString error", exception);
        }
        return appendable.toString();
    }
    
    public void toString(Appendable appendable) {
        try {
            toString(appendable, 0, this);
        } catch (Exception exception) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "toString error" , exception);
        }
    }
    
    private void toString(Appendable appendable, Integer indentation, DataInstance dataInstance) throws Exception {
        if (dataClass.declaredName.equalsIgnoreCase("childTables")) {
            dataClass.declaredName = dataClass.declaredName;
        }
        if (dataInstance.isNull == true) {
            for (int i = 0; i < indentation; i++) {
                appendable.append(" ");
            }
            if (dataInstance.dataClass.isTable) {
                appendable.append("T-[").append(dataInstance.dataClass.name).append(" #-0-] (no records)\"\n");
            } else {
                appendable.append("F-[").append(dataInstance.dataClass.name).append("] (null)\"\n");
            }
            return;
        }
        for (Object object : dataInstance.instances) {
            for (int i = 0; i < indentation; i++) {
                appendable.append(" ");
            }
            if (dataInstance.dataClass.isTable == true) {
                appendable.append("T-[").append(dataInstance.dataClass.name).append(" #").append(dataInstance.instancesIDMap.get(object).toString()).append("]\n");
            } else if (dataInstance.dataClass.isTable == false) {
                appendable.append("F-[").append(dataInstance.dataClass.name).append("]-\"").append(ignore_field_list.contains(dataInstance.dataClass.name) == true ? "..." : object.toString()).append("\"\n");
            }
            if (object.getClass().getName().startsWith(dataInstance.dataClass.packageName) == true) {
                if (dataInstance.fieldsMapList.size() > 0) {
                    for (DataInstance fieldDataInstance : dataInstance.fieldsMapList.get(object)) {
                        toString(appendable, indentation + 6, fieldDataInstance);
                    }
                } else {
                    for (DataClass fieldDataClass : dataInstance.dataClass.fieldsList) {
                        appendable.append("F-[").append(fieldDataClass.name).append("] (null)\n");
                    }
                }
                if (dataInstance.tablesMapList.size() > 0) {
                    for (DataInstance tableDataInstance : dataInstance.tablesMapList.get(object)) {
                        toString(appendable, indentation + 6, tableDataInstance);
                    }
                } else {
                    for (DataClass tableDataClass : dataInstance.dataClass.tablesList) {
                        appendable.append("T-[").append(tableDataClass.name).append(" #-0-] (no records)\"\n");
                    }
                }
            }
        }
    }
    
    public void saveToDatabase(Integer dataModelId, DataLookup dataLookup, Object instanceID, DataInstance dataInstance, ArrayList<String> inserts, String databaseFieldOpenQuote, String databaseFieldCloseQuote) throws Exception {
        if (dataInstance.isNull == true) {
            return;
        }

        StringBuilder insert = new StringBuilder();
        for (Object instanceObject : dataInstance.instances) {
            insert.setLength(0);
            if (dataInstance.dataClass.isTable == true) {
                insert.append(saveToDatabase(dataModelId, dataLookup, instanceID, dataInstance, instanceObject, databaseFieldOpenQuote, databaseFieldCloseQuote));
                inserts.add(insert.toString());
            }
            for (DataInstance tableDataInstance : dataInstance.tablesMapList.get(instanceObject)) {
                saveToDatabase(dataModelId, dataLookup, instanceID, tableDataInstance, inserts, databaseFieldOpenQuote, databaseFieldCloseQuote);
            }
        }
    }

    private String saveToDatabase(Integer dataModelId, DataLookup dataLookup, Object instanceID, DataInstance dataInstance, Object instanceObject, String databaseFieldOpenQuote, String databaseFieldCloseQuote) throws Exception {

        if (dataInstance.dataClass.isTable == false) {
            throw new Exception("toSQL takes table element only");
        }

        StringBuilder sql = new StringBuilder();
        String instanceObjectJSON = gson.toJson(instanceObject).replaceAll("\"", "\"\"");
        sql.append("INSERT INTO `").append(databaseName).append("`.`").append(dataInstance.dataClass.declaredName).append("`");
        sql.append("(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,");
        for (DataInstance fieldDataInstance : dataInstance.fieldsMapList.get(instanceObject)) {
            sql.append(databaseFieldOpenQuote).append(fieldDataInstance.dataClass.declaredName).append(databaseFieldCloseQuote).append(",");
        }
        sql.deleteCharAt(sql.length() - 1);
        sql.append(") VALUES (");
        sql.append(dataModelId).append(",");
        if (instanceID instanceof Number) {
            sql.append(instanceID).append(",");
        } else if (instanceID instanceof String) {
            sql.append("'").append(instanceID).append("',");
        }
        sql.append(dataInstance.instancesIDMap.get(instanceObject)).append(",").append(dataInstance.hasParent() == null ? "null" : dataInstance.parentID).append(",'").append(dataInstance.dataClass.declaredName).append("','").append(dataInstance.dataClass.name).append("','").append(instanceObjectJSON).append("',");
        for (DataInstance fieldDataInstance : dataInstance.fieldsMapList.get(instanceObject)) {
            if (fieldDataInstance.isNull == true) {
                sql.append("null,");
            } else if (fieldDataInstance.instances.size() == 1) {
                sql.append(fieldDataInstance.getFieldInstanceDatabaseString(dataLookup)).append(",");
            } else {
                throw new Exception("Field must have one instance only per record");
            }
        }
        sql.deleteCharAt(sql.length() - 1);
        sql.append(")");
        return sql.toString();
    }
}
