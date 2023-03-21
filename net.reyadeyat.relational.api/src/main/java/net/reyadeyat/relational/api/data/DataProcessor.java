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
import net.reyadeyat.relational.api.json.ZonedDateTimeAdapter;
import net.reyadeyat.relational.api.jdbc.JDBCSource;
import java.io.PrintWriter;
import java.io.Writer;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 
 * Description
 * 
 *
 * @author Mohammad Nabil Mostafa
 * <a href="mailto:code@reyadeyat.net">code@reyadeyat.net</a>
 * @param <Model>
 * 
 * @since 2023.01.01
 */
public class DataProcessor<Model> {
    Class data_model_class;
    Class model_class;
    DataModel<Model> data_model;
    String data_model_database_name;
    String model_database;
    String data_lookup_category;
    String model_version;
    String model_name;
    String model_description;
    DataLookup data_lookup;
    DataClass data_class;
    HashMap<DataModel<Model>, DataInstance> dataModelDataInstanceMap;
    
    final static public ZonedDateTimeAdapter zonedDateTimeAdapter = new ZonedDateTimeAdapter();
    
    public DataProcessor(Class data_model_class, Class model_class, String data_model_database_name, String model_database, String model_version, String model_name, String model_description, String data_lookup_category, DataLookup data_lookup) throws Exception {
        this.data_model_class = data_model_class;
        this.model_class = model_class;
        this.data_model_database_name = data_model_database_name;
        this.model_database = model_database;
        this.model_version = model_version;
        this.model_name = model_name;
        this.model_description = model_description;
        this.data_lookup_category = data_lookup_category;
        this.data_lookup = data_lookup;

        Boolean foundDataModelInterface = false;
        for (Class intrface : this.data_model_class.getInterfaces()) {
            if (intrface.getCanonicalName().equalsIgnoreCase(DataModel.class.getCanonicalName())) {
                foundDataModelInterface = true;
            }
        }
        if (foundDataModelInterface == false) {
            throw new Exception("data_model_class class must implement DataModel class");
        }
        this.data_model = (DataModel<Model>) this.data_model_class.getConstructor(model_class, java.lang.String.class, java.lang.String.class, java.lang.String.class).newInstance(null, model_version, model_name, model_description);
        Method methodGetDeclaredField = this.data_model_class.getDeclaredMethod("getDeclaredField");
        Field modelDeclaredField = (Field) methodGetDeclaredField.invoke(this.data_model);
        if (model_class.getCanonicalName().equals(modelDeclaredField.getType().getCanonicalName()) == false) {
            throw new Exception("data_model_class '" + data_model_class.getCanonicalName() + "' declared model field '" + modelDeclaredField.getName() + "' is of type class '" + modelDeclaredField.getType().getCanonicalName() + "' that is not same as model_class '" + model_class.getCanonicalName() + "'");
        }
        this.data_class = new DataClass(null, modelDeclaredField, data_lookup);
        
        dataModelDataInstanceMap = new HashMap<DataModel<Model>, DataInstance>();
    }
    
    @Override
    public String toString() {
        StringBuilder appendable = new StringBuilder();
        try {
            toString(appendable);
            return appendable.toString();
        } catch (Exception exception) {
            appendable.delete(0, appendable.length());
            appendable.append("toString '").append(data_model.getName()).append("-").append(data_model.getDescription()).append("' error").append(exception.getMessage());
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "toString error", exception);
        }
        return appendable.toString();
    }
    
    public void toString(Appendable appendable) throws Exception {
        appendable.append("Model: ").append(this.data_model.getDescription()).append("\n");
        try {
            Iterator<DataModel<Model>> iterator = dataModelDataInstanceMap.keySet().iterator();
            while (iterator.hasNext()) {
                DataModel<Model> tempDataModel = iterator.next();
                DataInstance dataInstance = dataModelDataInstanceMap.get(tempDataModel);
                appendable.append(dataInstance.toString());
            }
        } catch (Exception exception) {
            throw new RuntimeException(exception);
        }
    }
    
    public void toString(Appendable appendable, DataModel<Model> data_model) throws Exception {
        if (this.data_class.clas.getCanonicalName().equalsIgnoreCase(data_model.getInstance().getClass().getCanonicalName()) == false) {
            throw new Exception("Required model of type '" + this.data_class.clas.getCanonicalName() + "' while found model of type '" + data_model.getInstance().getClass().getCanonicalName() + "'");
        }
        appendable.append("Model: ");
        appendable.append(this.data_model.getDescription());
        appendable.append("\n");

        //DataInstance dataInstance = dataModelDataInstanceMap.get(data_model);
        SequenceNumber<Integer> sequenceNumber = new SequenceNumber<Integer>(0, 1, false);
        DataInstance dataInstance = new DataInstance(DataInstance.State.NEW, this.data_model_database_name, this.data_class, null, null, data_model.getInstance(), sequenceNumber, true);
        dataInstance.toString(appendable);
    }
    
    public Integer selectModelIdFromDatabase(JDBCSource data_source) throws Exception {
        Integer modelId = -1;
        String select_model_sql = "SELECT `id` FROM `data`.`data_model` WHERE `data_model`.`version`=? AND `data_model`.`database_name`=? AND `data_model`.`name`=? AND `data_model`.`root_class_path`=?";
        try ( Connection data_connection = data_source.getConnection(false)) {
            try (PreparedStatement data_stmt = data_connection.prepareStatement(select_model_sql)) {
                data_stmt.setString(1, model_version);
                data_stmt.setString(2, model_database);
                data_stmt.setString(3, model_name);
                data_stmt.setString(4, this.data_class.clas.getCanonicalName());
                try (ResultSet modelResultset = data_stmt.executeQuery()) {
                    if (modelResultset.next()) {
                        modelId = modelResultset.getInt("id");
                    }
                    data_stmt.close();
                } catch (Exception sqlx) {
                    throw sqlx;
                }
            } catch (Exception sqlx) {
                throw sqlx;
            }
        } catch (Exception sqlx) {
            throw sqlx;
        }
        return modelId;
    }
    
    public ArrayList<Integer> selectModelInstanceIDsFromDatabase(JDBCSource data_source) throws Exception {
        return selectModelInstanceIDsFromDatabase(data_source, null, null);
    }
    
    public ArrayList<Integer> selectModelInstanceIDsFromDatabase(JDBCSource data_source, Integer fromId, Integer toId) throws Exception {
        ArrayList<Integer> modelInstanceIds = new ArrayList<Integer>();
        String select_model_sql = "SELECT `instance_id`, `extra_info` FROM `data`.`data_model` INNER JOIN `data`.`data_model_instance` ON `data`.`data_model`.`id`=`data`.`data_model_instance`.`data_model_id` WHERE `data_model`.`version`=? AND `data_model`.`database_name`=? AND `data_model`.`name`=? AND `data_model`.`root_class_path`=? " + (fromId == null || toId == null ? "" : " AND `data_model_instance`.`instance_id` BETWEEN ? AND ?");
        try (Connection data_connection = data_source.getConnection(false)) {
            try (PreparedStatement data_stmt = data_connection.prepareStatement(select_model_sql)) {
                data_stmt.setString(1, model_version);
                data_stmt.setString(2, model_database);
                data_stmt.setString(3, model_name);
                data_stmt.setString(4, this.data_class.clas.getCanonicalName());
                if (fromId != null && toId != null) {
                    data_stmt.setInt(5, fromId);
                    data_stmt.setInt(6, toId);
                }
                try (ResultSet modelResultset = data_stmt.executeQuery()) {
                    while (modelResultset.next()) {
                        modelInstanceIds.add(modelResultset.getInt("instance_id"));
                    }
                    data_stmt.close();
                } catch (Exception sqlx) {
                    throw sqlx;
                }
            } catch (Exception sqlx) {
                throw sqlx;
            }
        } catch (Exception sqlx) {
            throw sqlx;
        }
        return modelInstanceIds;
    }
    
    public Integer createDatabase(JDBCSource data_model_source, Integer model_id, String source_url, String source_url_user_name, String source_url_user_password, String model_url, Integer instance_sequence_type_id, String instance_sequence_last_value, String model_database_schem, String model_database_field_open_quote, String model_database_field_close_quote, String secret_key) throws Exception {
        //String model_name = this.data_model.getName();
        
        ArrayList<String> creates = new ArrayList<String>();
        ArrayList<String> dataClasses = new ArrayList<String>();
        try (Connection data_model_connection = data_model_source.getConnection(false)) {
            data_class.createDatabaseSchema(data_model_connection, data_model_database_name, data_class, dataClasses, creates);
            //try (Connection data_model_connection = data_model_source.getConnection(false)) {
                String insert_model_sql = "INSERT INTO `data`.`data_model`(`id`, `version`,`name`,`description`,`database_name`,`data_lookup_category`,`source_url`,`source_url_user_name`,`source_url_user_password`,`model_url`,`instance_sequence_type_id`, `instance_sequence_last_value`,`root_class_path`, `model_database_schem`, `model_database_field_open_quote`, `model_database_field_close_quote`) VALUES (?,?,?,?,?,?,?,?,TO_BASE64(AES_ENCRYPT(?, '"+secret_key+"')),?,?,?,?,?,?,?)";
                try (PreparedStatement data_stmt = data_model_connection.prepareStatement(insert_model_sql, Statement.RETURN_GENERATED_KEYS)) {
                    data_stmt.setObject(1, model_id == -1 || model_id == null ? null : model_id);
                    data_stmt.setObject(2, model_version);
                    data_stmt.setObject(3, model_name);
                    data_stmt.setObject(4, model_description);
                    data_stmt.setObject(5, model_database);
                    data_stmt.setObject(6, data_lookup_category);
                    data_stmt.setObject(7, source_url);
                    data_stmt.setObject(8, source_url_user_name);
                    data_stmt.setObject(9, source_url_user_password);
                    data_stmt.setObject(10, model_url);
                    data_stmt.setObject(11, instance_sequence_type_id);
                    data_stmt.setObject(12, instance_sequence_last_value);
                    data_stmt.setObject(13, this.data_class.clas.getCanonicalName());
                    data_stmt.setObject(14, model_database_schem);
                    data_stmt.setObject(15, model_database_field_open_quote);
                    data_stmt.setObject(16, model_database_field_close_quote);
                    data_stmt.executeUpdate();
                    /*try (ResultSet generatedKeys = data_stmt.getGeneratedKeys()) {
                        generatedKeys.next();
                        model_id = Integer.valueOf(generatedKeys.getString(1));
                        generatedKeys.close();
                    } catch (Exception sqlx) {
                        throw sqlx;
                    }*/
                    StringBuilder b = new StringBuilder();
                    try (Statement modelStatement = data_model_connection.createStatement()) {
                        for (int i = 0; i < creates.size(); i++) {
                            modelStatement.addBatch(creates.get(i));
                            b.append(creates.get(i)).append("\n");
                        }
                        int[] rows = modelStatement.executeBatch();
                        if (rows != null && rows.length > 0) {
                            ////System.out.println("Success: tables created = " + rows.length + "\n" + b.toString());
                        }
                        if (data_model_connection.getAutoCommit() == false) {
                            data_model_connection.commit();
                        }
                        modelStatement.close();
                    } catch (Exception sqlx) {
                        b.insert(0, "create database sql statements carshed :\n");
                        System.out.println(b.toString());
                        if (data_model_connection.getAutoCommit() == false) {
                            data_model_connection.rollback();
                        }
                        throw sqlx;
                    }
                    if (data_model_connection.isClosed() == false && data_model_connection.getAutoCommit() == false) {
                        data_model_connection.commit();
                    }
                    if (data_stmt.isClosed() == false) {
                        data_stmt.close();
                    }
                } catch (Exception sqlx) {
                    if (data_model_connection.isClosed() == false && data_model_connection.getAutoCommit() == false) {
                        data_model_connection.rollback();
                    }
                    throw sqlx;
                }
            //} catch (Exception sqlx) {
            //    throw sqlx;
            //}
        } catch (Exception sqlx) {
                throw sqlx;
        }
        return model_id;
    }
    
    /**Save sequence last value in memory, if server crashed you have to update latest model sequence when server starts up again*/
    synchronized public DataModel<Model> saveNewDataModelToDatabase(Appendable appendable, JDBCSource data_model_source, DataModel<Model> data_model, String database_field_open_quote, String database_field_close_quote) throws Exception {
        Integer instanceID = null;
        Exception exception = null;
        appendable = appendable == null ? new PrintWriter(Writer.nullWriter()) : appendable;
        try ( Connection locked_data_model_connection = data_model_source.getConnection(false)) {
            String lockTables = "LOCK TABLE data_model WRITE, sequence_type WRITE, data_model_sequence WRITE, data_model_instance WRITE";
            try (Statement lockStatement = locked_data_model_connection.createStatement()) {
                lockStatement.execute(lockTables);
            } catch (Exception sqlx) {
                throw sqlx;
            }
            String select_model_sql = "SELECT `data_model`.`id` AS `data_model_id`, `instance_sequence_type_id`, `instance_sequence_last_value`, `sequence_type`.`sequence_name`, `sequence_type`.`sequence_type`, `sequence_type`.`sequence_ordered_chars`, `sequence_type`.`sequence_chars_width`, `sequence_type`.`sequence_padding_char`, `sequence_type`.`sequence_rewind`, `sequence_type`.`sequence_initial_value`, `sequence_type`.`sequence_increment_value` FROM `data`.`data_model` INNER JOIN `data`.`sequence_type` ON `data_model`.`instance_sequence_type_id`=`sequence_type`.`id` WHERE `data_model`.`version`=? AND `data_model`.`database_name`=? AND `data_model`.`name`=? AND `data_model`.`root_class_path`=?";
            try (PreparedStatement data_stmt = locked_data_model_connection.prepareStatement(select_model_sql)) {
                data_stmt.setString(1, model_version);
                data_stmt.setString(2, model_database);
                data_stmt.setString(3, model_name);
                data_stmt.setString(4, this.data_class.clas.getCanonicalName());
                try (ResultSet data_model_resultset = data_stmt.executeQuery()) {
                    if (data_model_resultset.next() == false) {
                        throw new Exception("DataModel '" + data_model_class.getCanonicalName() + "' is not defined in Data.DataModel Table");
                    }
                    Integer dataModelId = data_model_resultset.getInt("data_model_id");
                    String sequence_type = data_model_resultset.getString("sequence_type");
                    Integer instance_last_value = data_model_resultset.getInt("instance_sequence_last_value");
                    Integer sequence_initial_value = data_model_resultset.getInt("sequence_initial_value");
                    Integer sequence_increment_value = data_model_resultset.getInt("sequence_increment_value");

                    if (sequence_type.equalsIgnoreCase("Integer") == false) {
                        throw new Exception("Sequence Type must be 'Integer' type");
                    }

                    Model instanceObject = data_model.getInstance();
                    //Set InstanceID to Root Object in model sequence
                    SequenceNumber<Integer> sequenceNumber = new SequenceNumber<Integer>(sequence_initial_value, sequence_increment_value, false);
                    sequenceNumber.initSequence(this.data_class.clas, instance_last_value);

                    //Prpeare DataInstance
                    DataInstance dataInstance = new DataInstance(DataInstance.State.NEW, this.data_model_database_name, this.data_class, null, null, instanceObject, sequenceNumber, true);
                    instanceID = sequenceNumber.getSequenceState(this.data_class.clas);

                    String update_model_sql = "UPDATE `data`.`data_model` SET `instance_sequence_last_value` = ? WHERE `id` = ?";
                    try (PreparedStatement modelUpdateStatement = locked_data_model_connection.prepareStatement(update_model_sql)) {

                        modelUpdateStatement.setInt(1, instanceID);
                        modelUpdateStatement.setInt(2, dataModelId);
                        int rows = modelUpdateStatement.executeUpdate();
                        if (rows == 0) {
                            throw new Exception("Can not update data model record with last instance id value");
                        }
                    } catch (Exception sqlx) {
                        throw sqlx;
                    }

                    //Register Model new instanceID
                    String instance_id_sql = "INSERT INTO `data`.`data_model_instance` (`instance_id`, `data_model_id`, `extra_info`) VALUES (?,?,?)";
                    try (PreparedStatement instanceIdStatement = locked_data_model_connection.prepareStatement(instance_id_sql)) {
                        instanceIdStatement.setInt(1, instanceID);
                        instanceIdStatement.setInt(2, dataModelId);
                        instanceIdStatement.setString(3, "extra_info");
                        int modelInstanceIdRows = instanceIdStatement.executeUpdate();
                        if (modelInstanceIdRows > 0) {
                            //Save Model Sequence State
                            ArrayList<String> sequenceInserts = new ArrayList<String>();
                            HashMap<Class, Integer> sequenceNumberState = sequenceNumber.getSequenceState();
                            Iterator<Class> iterator = sequenceNumberState.keySet().iterator();
                            StringBuilder inserts = new StringBuilder();
                            while (iterator.hasNext()) {
                                Class key = iterator.next();
                                Integer sequenceStateValue = sequenceNumberState.get(key);
                                inserts.setLength(0);
                                inserts.append("INSERT INTO `data`.`data_model_sequence`(`data_model_id`, `instance_id`,`class_path`,`instance_sequence_last_value`)VALUES(")
                                        .append(dataModelId).append(",")
                                        .append(instanceID).append(",")
                                        .append("'").append(key.getCanonicalName()).append("',")
                                        .append(sequenceStateValue).append(") ON DUPLICATE KEY UPDATE `instance_sequence_last_value`=").append(sequenceStateValue);
                                sequenceInserts.add(inserts.toString());
                            }
                            try (Statement sequenceStatement = locked_data_model_connection.createStatement()) {
                                //////StringBuilder bb = new StringBuilder();
                                appendable.append("Add Inert Batch").append("\n");
                                for (int i = 0; i < sequenceInserts.size(); i++) {
                                    String batch = sequenceInserts.get(i);
                                    appendable.append(batch).append("\n");
                                    sequenceStatement.addBatch(batch);
                                    //////bb.append(inserts.get(i)).append(";\n");
                                    ////System.out.println(sequenceInserts.get(i) + ";");
                                }
                                int[] sequenceRows = sequenceStatement.executeBatch();
                                if (sequenceRows != null && sequenceRows.length > 0) {
                                    //Save ModelInstance
                                    ArrayList<String> modelInserts = new ArrayList<String>();
                                    dataInstance.saveToDatabase(dataModelId, this.data_lookup, instanceID, dataInstance, modelInserts, database_field_open_quote, database_field_close_quote);
                                    //StringBuilder bbb = new StringBuilder();
                                    int modelRows = 0;
                                    try (Connection unlocked_data_model_connection = data_model_source.getConnection(false)) {
                                        try (Statement modelStatement = unlocked_data_model_connection.createStatement()) {
                                            for (int i = 0; i < modelInserts.size(); i++) {
                                                //bbb.append(modelInserts.get(i)).append(";\n");
                                                appendable.append(modelInserts.get(i)).append("\n");
                                                modelStatement.addBatch(modelInserts.get(i));
                                                ////System.out.println(modelInserts.get(i) + ";");
                                                /*int rows = modelStatement.executeUpdate(modelInserts.get(i));
                                                if (rows == 0) {
                                                    System.out.println("Error === " + modelInserts.get(i) + ";");
                                                }*/
                                                //debug never delete
                                                /*try {
                                                    modelRows++;
                                                    modelStatement.executeUpdate(modelInserts.get(i));
                                                } catch (Exception ex) {
                                                    throw new Exception("Crashed on Insert Statement \n" + modelInserts.get(i), ex);
                                                }*/
                                                if (i % 100 == 0) {
                                                    modelRows += modelStatement.executeBatch().length;
                                                }
                                            }
                                            if (modelRows != modelInserts.size()) {
                                                modelRows += modelStatement.executeBatch().length;
                                            }
                                            if (modelRows != modelInserts.size()) {
                                                throw new Exception("Inserted Rows = "+modelRows+" while Total Rows = " + modelInserts.size());
                                                ////System.out.println("Success: records inserted = " + modelRows.length);// + "\n" + b.toString());
                                            }
                                            
                                            if (unlocked_data_model_connection.isClosed() == false && unlocked_data_model_connection.getAutoCommit() == false) {
                                                unlocked_data_model_connection.commit();
                                            }
                                            modelStatement.close();
                                        } catch (Exception sqlx) {
                                            //bbb.insert(0, "insert instance data sql statments crashed:\n");
                                            appendable.append("----------- insert instance data sql statments crashed -----------").append("\n");
                                            //System.out.println(bbb.toString());
                                            if (unlocked_data_model_connection.isClosed() == false && unlocked_data_model_connection.getAutoCommit() == false) {
                                                unlocked_data_model_connection.rollback();
                                            }
                                            throw sqlx;
                                        }
                                    } catch (Exception sqlx) {
                                        throw sqlx;
                                    }
                                }
                                sequenceStatement.close();
                            } catch (Exception sqlx) {
                                if (locked_data_model_connection.isClosed() == false && locked_data_model_connection.getAutoCommit() == false) {
                                    locked_data_model_connection.rollback();
                                }
                                throw sqlx;
                            }
                            data_model_resultset.close();
                            data_stmt.close();
                            //Cache
                            dataInstance.changeState(DataInstance.State.LOADED, true);
                            dataModelDataInstanceMap.put(data_model, dataInstance);
                        }
                        if (locked_data_model_connection.isClosed() == false && locked_data_model_connection.getAutoCommit() == false) {
                            locked_data_model_connection.commit();
                        }
                        instanceIdStatement.close();
                    } catch (Exception sqlx) {
                        if (locked_data_model_connection.isClosed() == false && locked_data_model_connection.getAutoCommit() == false) {
                            locked_data_model_connection.rollback();
                        }
                        throw sqlx;
                    }
                } catch (Exception sqlx) {
                    throw sqlx;
                }
            } catch (Exception sqlx) {
                //throw exception = sqlx;
                exception = sqlx;
            }
            try (Statement lockStatement = locked_data_model_connection.createStatement()) {
                String unlockTables = "UNLOCK TABLES";
                Boolean execute_result = lockStatement.execute(unlockTables);
            } catch (Exception sqlx) {
                exception = sqlx;
            }
            if (exception != null) {
                throw exception;
            }
        } catch (Exception sqlx) {
            throw sqlx;
        }
        
        return data_model;
    }
    
    public DataModel<Model> loadDataModelFromDatabase(JDBCSource data_model_source, String instanceID, DataClass.LoadMethod loadMethod) throws Exception {
        throw new Exception("Method not implemented yet!");
    }
    
    public DataModel<Model> loadDataModelFromDatabase(JDBCSource data_model_source, Integer instanceID, DataClass.LoadMethod loadMethod) throws Exception {
        String select_model_sql = "SELECT `data_model`.`id` AS `model_id`, `instance_sequence_type_id`, `instance_sequence_last_value`, `sequence_type`.`sequence_name`, `sequence_type`.`sequence_type`, `sequence_type`.`sequence_ordered_chars`, `sequence_type`.`sequence_chars_width`, `sequence_type`.`sequence_padding_char`, `sequence_type`.`sequence_rewind`, `sequence_type`.`sequence_initial_value`, `sequence_type`.`sequence_increment_value` FROM `data`.`data_model` INNER JOIN `data`.`sequence_type` ON `data_model`.`instance_sequence_type_id`=`sequence_type`.`id` WHERE `data_model`.`version`=? AND `data_model`.`database_name`=? AND `data_model`.`name`=? AND `data_model`.`root_class_path`=?";
        Integer modelID = -1;
        SequenceNumber<Integer> sequenceNumber = null;
        try (Connection data_model_connection = data_model_source.getConnection(false)) {
            try (PreparedStatement data_stmt = data_model_connection.prepareStatement(select_model_sql)) {
                data_stmt.setString(1, model_version);
                data_stmt.setString(2, model_database);
                data_stmt.setString(3, model_name);
                data_stmt.setString(4, this.data_class.clas.getCanonicalName());
                try (ResultSet data_model_resultset = data_stmt.executeQuery()) {
                    if (data_model_resultset.next() == false) {
                        throw new Exception("DataModel '" + data_model_class.getCanonicalName() + "' is not defined in Data.DataModel Table");
                    }
                    modelID = data_model_resultset.getInt("model_id");
                    String sequence_type = data_model_resultset.getString("sequence_type");
                    Integer sequence_initial_value = data_model_resultset.getInt("sequence_initial_value");
                    Integer sequence_increment_value = data_model_resultset.getInt("sequence_increment_value");

                    if (sequence_type.equalsIgnoreCase("Integer") == false) {
                        throw new Exception("Sequence Type must be 'Integer' type");
                    }

                    sequenceNumber = new SequenceNumber<Integer>(sequence_initial_value, sequence_increment_value, false);

                    //Initialize Model Sequence state
                    String select_model_sequences_sql = "SELECT `class_path`, `instance_sequence_last_value` FROM `data`.`data_model_sequence` WHERE `data_model_id`=? AND `instance_id`=?";
                    try (PreparedStatement modelSequenceStatement = data_model_connection.prepareStatement(select_model_sequences_sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE)) {
                        modelSequenceStatement.setInt(1, modelID);
                        modelSequenceStatement.setInt(2, instanceID);
                        try (ResultSet sequenceResultset = modelSequenceStatement.executeQuery()) {
                            while (sequenceResultset.next() == true) {
                                String classPath = sequenceResultset.getString("class_path");
                                Integer value = Integer.parseInt(sequenceResultset.getString("instance_sequence_last_value"));
                                sequenceNumber.initSequence(Class.forName(classPath), value);
                            }
                        } catch (Exception sqlx) {
                            throw sqlx;
                        }
                        modelSequenceStatement.close();
                    } catch (Exception sqlx) {
                        throw sqlx;
                    }
                } catch (Exception sqlx) {
                    throw sqlx;
                }
                ArrayList<String> selects = new ArrayList<String>();
                if (sequenceNumber == null) {
                    throw new Exception("Sequence is not initialized!");
                }
                
                //try (Connection data_model_connection = data_model_source.getConnection(false)) {
                    Object instanceObject = this.data_class.loadFromDatabase(data_model_connection, modelID, this.data_model_database_name, this.data_lookup, instanceID, loadMethod, sequenceNumber, selects);

                    DataModel<Model> data_model = (DataModel<Model>) this.data_model_class.getConstructor(model_class, java.lang.String.class, java.lang.String.class, java.lang.String.class).newInstance(null, model_version, model_name, model_description);
                    Method methodGetDeclaredField = this.data_model_class.getDeclaredMethod("getDeclaredField");
                    Field modelDeclaredField = (Field) methodGetDeclaredField.invoke(this.data_model);
                    modelDeclaredField.setAccessible(true);
                    modelDeclaredField.set(data_model, instanceObject);
                    data_model.prepareInstance();
                    //Class runtimeModelClass = modelDeclaredField.getType();

                    return data_model;
                //} catch (Exception sqlx) {
                //    throw sqlx;
                //}
            } catch (Exception sqlx) {
                throw sqlx;
            }
        } catch (Exception sqlx) {
            throw sqlx;
        }
    }
    
    public Boolean isDataModelInstanceRegistered(DataModel<Model> data_model) throws Exception {
        if (data_model == null) {
            throw new Exception("DataModel is null");
        }
        if (data_model.getInstance() == null) {
            throw new Exception("DataModel is null");
        }
        if (data_model.getInstance().getClass().getCanonicalName().equals(this.data_class.clas.getCanonicalName())) {
            throw new Exception("DataProcessor handles DataModel of type '" + data_class.clas.getCanonicalName() + "' while passed DataModel is of type '" + data_model.getInstance().getClass().getCanonicalName() + "'");
        }
        return dataModelDataInstanceMap.containsValue(data_model);
    }
    
    /**Update DataInstance with new/deleted InstanceObjects */
    public DataModel<Model> updateDataModelInstance(DataModel<Model> data_model) throws Exception {
        
        if (data_model == null) {
            throw new Exception("DataModel is null");
        }
        if (isDataModelInstanceRegistered(data_model)== false) {
            throw new Exception("DataModel '" + this.data_class.packageName + "' is not registered yer , first call either registerDataModelInstance or loadDataModelFromDatabase ");
        }
        /*DataInstance dataInstance = dataModelDataInstanceMap.get(data_model);
        ArrayList<String> selects = new ArrayList<String>();
        Object instanceObject = dataInstance.update(this.dataLookup, instanceID, loadMethod, selects);
        
        DataModel<Model> data_model = (DataModel<Model>) this.data_model_class.getConstructor().newInstance();
        Method methodGetDeclaredField = this.data_model_class.getDeclaredMethod("getDeclaredField");
        Field modelDeclaredField = (Field) methodGetDeclaredField.invoke(this.data_model);
        modelDeclaredField.setAccessible(true);
        modelDeclaredField.set(data_model, instanceObject);*/
        
        throw new Exception("Method not completed yet");
    }
}
