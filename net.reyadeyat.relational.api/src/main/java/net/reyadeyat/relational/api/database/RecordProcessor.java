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

package net.reyadeyat.relational.api.database;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import net.reyadeyat.relational.api.request.Response;
import net.reyadeyat.relational.api.util.Returns;
import java.io.OutputStream;

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
public class RecordProcessor {
    public OutputStream response_output_stream;
    public JsonObject database_request;
    public JsonArray errors;
    public int affected_rows;
    public Boolean is_empty_view;
    public JsonObject view;
    public Response response;
    public Returns returns;
    
    public RecordProcessor(JsonObject database_request, OutputStream response_output_stream) {
        this.response_output_stream = response_output_stream;
        this.database_request = database_request;
        this.errors = new JsonArray();
        this.is_empty_view = true;
        this.affected_rows = 0;
        this.returns = new Returns();        
    }
    
    public RecordProcessor getRecordProcessor(String table_name) {
        JsonObject table_database_request = database_request.get(table_name).getAsJsonObject();
        return new RecordProcessor(table_database_request, response_output_stream);
    }
    
    public OutputStream getResponseOutputStream() {
        return response_output_stream;
    }
    
    public JsonObject getDatabaseRequest() {
        return database_request;
    }
    
    public JsonArray addError(String error) {
        errors.add(error);
        return errors;
    }
    
    public JsonArray getErrors() {
        return errors;
    }
    
    /*public void setDatabaseResponse(Response response) {
        this.response = response;
    }
    
    public Response getDatabaseResponse() {
        return response;
    }*/
    
    public void setDatabaseView(JsonObject view) {
        this.view = view;
    }
    
    public JsonObject getDatabaseView() {
        return view;
    }
    
    public Boolean isEmptyView() {
        return view.size() == 0;
    }
    
    public void setAffectedRows(int affected_rows) {
        this.affected_rows = affected_rows;
    }
    
    public Integer getAffectedRows() {
        return affected_rows;
    }
    
    public <T> void addReturns(String key, T value) {
        returns.Returns(key, value);
    }
    
    public Returns getReturns() {
        return returns;
    }
}
