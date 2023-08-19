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
package net.reyadeyat.relational.api.modeler;

import com.google.gson.Gson;
import net.reyadeyat.relational.api.database.Table;
import net.reyadeyat.relational.api.json.JsonUtil;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonArray;
import com.google.gson.stream.JsonReader;
import net.reyadeyat.relational.api.database.RecordHandler;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.reyadeyat.relational.api.data.DataClass;
import net.reyadeyat.relational.api.data.DataLookup;
import net.reyadeyat.relational.api.data.DataProcessor;
import net.reyadeyat.relational.api.data.ModelDefinition;
import net.reyadeyat.relational.api.database.ModelHandler;
import net.reyadeyat.relational.api.jdbc.JDBCSource;
import net.reyadeyat.relational.api.json.JsonResultset;
import net.reyadeyat.relational.api.model.Enterprise;
import net.reyadeyat.relational.api.model.EnterpriseModel;
import net.reyadeyat.relational.api.model.MetadataMiner;
import net.reyadeyat.relational.api.request.Response;

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
public abstract class ModelingRequest implements ModelHandler {
    
    private Table table;
    
    //Security
    private Integer security_flag;
    static final public Integer SECURITY_FLAG_ASSERT_VALID_FIELD_NAMES = 1;
    static final public Integer SECURITY_FLAG_DONT_RETURN_RESPONSE_MESSAGE = 2;
    static final public Integer SECURITY_FLAG_RETURN_TECHNICAL_RESPONSE_MESSAGE = 4;
    static final public Integer SECURITY_FLAG_RETURN_DESCRIPTIVE_RESPONSE_MESSAGE = 8;
    static final public Integer SECURITY_FLAG_DONT_RETURN_GENERATED_ID = 16;
    static final public Integer SECURITY_FLAG_RETURN_GENERATED_ID = 32;
    static final public Integer SECURITY_FLAG_RETURN_GENERATED_ID_ENCRYPTED = 64;
    static final public Integer SECURITY_FLAG_RETURN_RESPONSE_ENCRYPTED = 128;
    
    private ArrayList<String> transaction_type;
    private String valid_transaction_type;
    
    public ModelingRequest() throws Exception {
    }
    
    public Boolean isSecurityFlagSwitched(int SECURITY_FLAG) {
        return (security_flag & SECURITY_FLAG) != 0;
    }
    
    public void defineTransactions(String... operations) {
        transaction_type = new ArrayList<String>(Arrays.<String>asList(operations));
        valid_transaction_type = String.join(",", transaction_type);
    }
    
    protected JsonObject serviceContent(InputStream json_request_stream, OutputStream response_output_stream) throws Exception {
        Gson gson = JsonUtil.gson();
        
        JsonElement json_request = null;
        try (JsonReader json_reader = new JsonReader(new InputStreamReader(json_request_stream, StandardCharsets.UTF_8))) {
            json_request = gson.fromJson(json_reader, JsonElement.class);
        } catch (Exception exception) {
            JsonUtil.reclaimGson(gson);
            throw exception;
        }
        JsonUtil.reclaimGson(gson);
        if (json_request.isJsonObject() == false) {
            throw new Exception("Bad Request, Non JSON Object received => " + json_request.getClass().getName());
        }
        return json_request.getAsJsonObject();
    }

    public void serviceTransaction(Integer security_flag, InputStream json_request_stream, OutputStream response_output_stream, Connection jdbc_connection, JsonArray log_list, JsonArray error_list) throws Exception {
        JsonObject service_transaction_request = serviceContent(json_request_stream, response_output_stream);
        serviceTransaction(security_flag, service_transaction_request, response_output_stream, jdbc_connection, log_list, error_list);
    }
    
    public Response serviceTransaction(Integer security_flag, JsonObject service_transaction_request, OutputStream response_output_stream, Connection jdbc_connection, JsonArray log_list, JsonArray error_list) throws Exception {
        this.security_flag = security_flag;
        if (service_transaction_request == null) {
            error_list.add("Bad Request, Non JSON received => null !");
            return null;
        }
        
        log_list.add("Start-Process");
        
        String data_database = "parental";
        String data_model_database = "model";
        String java_package_name = "net.reyadeyat.relational.api.model";
        String transaction = JsonUtil.getJsonString(service_transaction_request, "transaction", false);
        Integer model_id = JsonUtil.getJsonInteger(service_transaction_request, "model_id", false);
        String secret_key = JsonUtil.getJsonString(service_transaction_request, "secret_key", false);
        String model_datasource_name = JsonUtil.getJsonString(service_transaction_request, "model_datasource_name", false);
        String data_datasource_name = JsonUtil.getJsonString(service_transaction_request, "data_datasource_name", false);
        
        JDBCSource model_jdbc_source = getJDBCSource(model_datasource_name);
        JDBCSource data_jdbc_source = getJDBCSource(data_datasource_name);
        
        JsonArray generating_time_elements = new JsonArray();
        long t1 = System.nanoTime();
        if (transaction.equalsIgnoreCase("delete")) {
            MetadataMiner.deleteDataModel(model_jdbc_source, model_id, 0);
        } else if (transaction.equalsIgnoreCase("build")) {
            Gson gson = JsonUtil.gson();
            ModelDefinition model_definition;
            try {
                model_definition = gson.fromJson(service_transaction_request, ModelDefinition.class);
            } catch (Exception exception) {
                JsonUtil.reclaimGson(gson);
                throw exception;
            }
            JsonUtil.reclaimGson(gson);
            MetadataMiner.deleteDataModel(model_jdbc_source, model_id, 0);
            ArrayList<String> table_list = new ArrayList<>();
            //data_database, data_model_database, model_database, data_lookup_category, model_version, model_database_schem, model_database_field_open_quote, model_database_field_close_quote;
            MetadataMiner databaseMetadata = new MetadataMiner(model_id, java_package_name, model_jdbc_source, data_jdbc_source, table_list, model_definition, secret_key);
            generating_time_elements = new JsonArray();
            //PrintWriter writer = new PrintWriter(Writer.nullWriter());
            PrintWriter writer = new PrintWriter(response_output_stream);
            model_id = databaseMetadata.generateModel(writer, generating_time_elements);
        } else if (transaction.equalsIgnoreCase("print")) {
            Integer print_style = JsonUtil.getJsonInteger(service_transaction_request, "print_style", false);
            Integer model_instance_id = 1;
            DataClass.LoadMethod loadMethod = DataClass.LoadMethod.REFLECTION;
            DataLookup data_lookup = null;
            ModelDefinition model_definition = null;
            try (Connection model_database_connection = model_jdbc_source.getConnection(false)) {
                String select_model = "SELECT `model_id`, `model_instance_sequence_type_id`, `model_instance_sequence_last_value`, `model_name`, `model_version`, `model_class_path`, `model_data_lookup_category`, `modeled_database_url`, `modeled_database_url_user_name`, CAST(AES_DECRYPT(FROM_BASE64(`modeled_database_url_user_password`), ?) AS CHAR) AS `modeled_database_url_user_password`, `modeled_database_schem`, `modeled_database_name`, `modeled_database_field_open_quote`, `modeled_database_field_close_quote` FROM `"+model_jdbc_source.getDatabaseName()+"`.`model` WHERE `model_id`=?";
                try (PreparedStatement stmt = model_database_connection.prepareStatement(select_model)) {
                    stmt.setString(1, secret_key);
                    stmt.setInt(2, model_id);
                    try (ResultSet rs = stmt.executeQuery()) {
                        ArrayList<ModelDefinition> data_model_definition_list = JsonResultset.resultset(rs, ModelDefinition.class);
                        if (data_model_definition_list == null || data_model_definition_list.size() == 0) {
                            error_list.add("Data Model ID '"+model_id+"' is not exist");
                        } else {
                            model_definition = data_model_definition_list.get(0);
                        }
                        rs.close();
                    } catch (Exception ex) {
                        throw ex;
                    }
                    stmt.close();
                } catch (Exception ex) {
                    throw ex;
                }
                
                if (model_definition != null) {
                    String sql = "SELECT `enum_name`, `enum_element_id`, `enum_element_code`, `enum_element_java_datatype`, `enum_element_typescript_datatype` FROM `"+model_jdbc_source.getDatabaseName()+"`.`lookup_enum` INNER JOIN `"+model_jdbc_source.getDatabaseName()+"`.`lookup_enum_element` ON `lookup_enum`.`enum_id` = `lookup_enum_element`.`enum_id` WHERE `lookup_enum`.`enum_name`=? ORDER BY `enum_name`, `enum_element_code`";
                    try (PreparedStatement stmt = model_database_connection.prepareStatement(sql)) {
                        stmt.setString(1, model_definition.model_data_lookup_category);
                        try (ResultSet rs = stmt.executeQuery()) {
                            data_lookup = new DataLookup(rs, model_definition.model_data_lookup_category, "enum_name", "enum_element_id", "enum_element_code", "enum_element_java_datatype", "enum_element_typescript_datatype");
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
            if (model_definition != null) {
                DataProcessor<Enterprise> dataProcessor = new DataProcessor<Enterprise>(EnterpriseModel.class, Enterprise.class, model_jdbc_source, model_definition, data_lookup);
                EnterpriseModel<Enterprise> enterprise_model = (EnterpriseModel<Enterprise>) dataProcessor.loadModelFromDatabase(model_id, model_instance_id, loadMethod);
                PrintWriter writer = new PrintWriter(response_output_stream);
                writer.println("----------- START Database Model ------------");
                dataProcessor.toString(writer, enterprise_model);
                writer.println("-----------  END Database Model   ------------");
                writer.println("----------- START Database Data Structures ------------");
                MetadataMiner.printModelDataStructures(model_jdbc_source, model_id, 1, writer, print_style);
                writer.println("-----------  END Database Data Structures  ------------");
            }
        }
        
        long t2 = System.nanoTime();
        
        Response response = null;
        if (error_list.size() == 0) {
            response = new Response(true, transaction, 200, 200, "Database Modeler Completed Successfully", null);
            response.add("generating_time_elements", generating_time_elements);
            response.addProperty("exec_time", TimeUnit.MILLISECONDS.convert(t2 - t1, TimeUnit.NANOSECONDS) + " ms");
        } else {
            response = new Response(true, transaction, 200, 200, "Database Modeler Encountered Errors", null);
            response.add("errors", error_list);
            response.addProperty("exec_time", TimeUnit.MILLISECONDS.convert(t2 - t1, TimeUnit.NANOSECONDS) + " ms");
            
        }
        log_list.add("End-Process");
        return response;
    }
}
