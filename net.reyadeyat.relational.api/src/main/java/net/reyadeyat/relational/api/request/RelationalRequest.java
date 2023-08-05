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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;

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
    
    private ArrayList<String> transaction_type;
    private String valid_transaction_type;
    
    public RelationalRequest() {
        
    }
    
    public Boolean isSecurityFlagSwitched(int SECURITY_FLAG) {
        return (security_flag & SECURITY_FLAG) != 0;
    }
    
    protected void defineTransactions(String... operations) {
        transaction_type = new ArrayList<String>(Arrays.<String>asList(operations));
        valid_transaction_type = String.join(",", transaction_type);
    }
    
    protected JsonElement serviceContent(InputStream json_request_stream, OutputStream response_output_stream) throws Exception {
        Gson gson = JsonUtil.gson();
        
        JsonElement json_request = null;
        try (JsonReader json_reader = new JsonReader(new InputStreamReader(json_request_stream, StandardCharsets.UTF_8))) {
            json_request = gson.fromJson(json_reader, JsonElement.class);
        } catch (Exception exception) {
            JsonUtil.reclaimGson(gson);
            throw exception;
        }
        JsonUtil.reclaimGson(gson);
        return json_request;
    }

    public void serviceTransaction(Integer security_flag, InputStream json_request_stream, OutputStream response_output_stream, Connection jdbc_connection, JsonArray log_list, JsonArray error_list) throws Exception {
        JsonElement json_request = serviceContent(json_request_stream, response_output_stream);
        serviceTransaction(security_flag, json_request, response_output_stream, jdbc_connection, log_list, error_list);
    }
    
    public void serviceTransaction(Integer security_flag, JsonElement json_request, OutputStream response_output_stream, Connection jdbc_connection, JsonArray log_list, JsonArray error_list) throws Exception {
        this.security_flag = security_flag;
        if (json_request == null) {
            error_list.add("Bad Request, Non JSON received => " + json_request.toString());
            return;
        }
        JsonObject jsonObject = json_request.getAsJsonObject();
        String transactionType = (jsonObject.get("transaction") == null ? null : jsonObject.get("transaction").getAsString());
        if (transactionType == null || valid_transaction_type.contains(transactionType) == false) {
            error_list.add("Bad Request, invalid transaction [" + transactionType + "] - valid transactions are [" + valid_transaction_type + "]");
            return;
        }
        if (table == null) {
            error_list.add("Internal System Error, Contact Adminstrator, uninitialized 'transaction_type' is null");
            return;
        }        
        JsonObject database_request = json_request.getAsJsonObject();
        log_list.add("Start-Process");
        RecordProcessor record_processor = new RecordProcessor(database_request, response_output_stream);
        //table.process(record_processor, this);
        log_list.add("End-Process");
    }
    
    protected void defineService(String servlet_name, String default_datasource_name, String database_name, String table_tree_string) throws Exception {
        JsonObject table_tree = JsonUtil.jsonStringToJsonElelement(table_tree_string).getAsJsonObject();
        defineService(servlet_name, default_datasource_name, database_name, table_tree);
    }
 
    protected void defineService(String servlet_name, String default_datasource_name, String database_name, JsonObject table_tree) throws Exception {
        try {
            if (default_datasource_name == null || default_datasource_name.length() == 0) {
                throw new Exception("Default Source Name can not be null");
            }
            //this.database_name = database_name;
            String model_data_source_name = JsonUtil.getJsonString(table_tree, "model_data_source_name", false);
            String model_data_database_name = JsonUtil.getJsonString(table_tree, "model_data_database_name", false);
            Integer model_id = JsonUtil.getJsonInteger(table_tree, "model_id", false);
            DataSource model_data_source = getDataSource(model_data_source_name);
            JsonArray error_list = new JsonArray();
            //Table.loadModel(model_data_source, model_data_database_name, model_id, error_list);
            if (error_list.size() > 0) {
                //error;
            }
            table = new Table(model_id, null, database_name, table_tree);
        } catch (Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "Error: defineServlet '"+servlet_name+"'", ex);
            throw ex;
        }
        
    }
      

}
