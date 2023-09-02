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
package net.reyadeyat.relational.api.request;

import com.google.gson.Gson;
import net.reyadeyat.relational.api.database.Table;
import net.reyadeyat.relational.api.json.JsonUtil;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonArray;
import com.google.gson.stream.JsonReader;
import net.reyadeyat.relational.api.database.RecordHandler;
import net.reyadeyat.relational.api.database.RecordProcessor;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.io.OutputStream;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import net.reyadeyat.relational.api.jdbc.JDBCSource;

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
public abstract class RelationalRequest implements RecordHandler {
    
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
    
    private JsonObject request_service_definition_json;
    
    public RelationalRequest(JsonObject request_service_definition_json, HashMap<String, Class> interface_implementation) throws Exception {
        this.request_service_definition_json = request_service_definition_json;
        String service_name = JsonUtil.getJsonString(request_service_definition_json, "service_name", false);
        try {
            String database_name = JsonUtil.getJsonString(request_service_definition_json, "database_name", false);
            String default_datasource_name = JsonUtil.getJsonString(request_service_definition_json, "default_datasource_name", false);
            if (default_datasource_name == null || default_datasource_name.length() == 0) {
                throw new Exception("Default Source Name can not be null");
            }
            
            //this.database_name = database_name;
            String model_datasource_name = JsonUtil.getJsonString(request_service_definition_json, "model_datasource_name", false);
            String data_datasource_name = JsonUtil.getJsonString(request_service_definition_json, "data_datasource_name", false);
            Integer model_id = JsonUtil.getJsonInteger(request_service_definition_json, "model_id", false);
            String secret_key = JsonUtil.getJsonString(request_service_definition_json, "secret_key", false);
            JDBCSource model_jdbc_source = getJDBCSource(model_datasource_name);
            JDBCSource data_jdbc_source = getJDBCSource(data_datasource_name);
            JsonArray error_list = new JsonArray();
            Table.loadDataModel(secret_key, model_jdbc_source, data_jdbc_source, model_id, interface_implementation, error_list);
            JsonUtil.throwJsonExceptionOnError("Table service definition has errors:", error_list);
            JsonObject table_tree = JsonUtil.getJsonObject(request_service_definition_json, "table_tree", false);
            table = new Table(model_id, null, database_name, table_tree, error_list);
            JsonUtil.throwJsonExceptionOnError("Table service definition has errors:", error_list);
        } catch (Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Error: defineServlet '"+service_name+"'", ex);
            throw ex;
        }
    }
    
    public Boolean isSecurityFlagSwitched(int SECURITY_FLAG) {
        return (security_flag & SECURITY_FLAG) != 0;
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
    
    public void serviceTransaction(Integer security_flag, JsonObject service_transaction_request, OutputStream response_output_stream, Connection jdbc_connection, JsonArray log_list, JsonArray error_list) throws Exception {
        this.security_flag = security_flag;
        if (service_transaction_request == null) {
            error_list.add("Bad Request, Non JSON received => null !");
            return;
        }
        JsonObject database_request = service_transaction_request.getAsJsonObject();
        log_list.add("Start-Process");
        Set<Map.Entry<String, JsonElement>> table_set = database_request.entrySet();
        for (Map.Entry<String, JsonElement> table_entry : table_set) {
            String table_name = table_entry.getKey();
            JsonObject table_request = table_entry.getValue().getAsJsonObject();
            RecordHandler record_handler= this;
            table.process(table_name, table_request, response_output_stream, record_handler);
        }
        log_list.add("End-Process");
    }
      

}
