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
import java.util.ArrayList;
import java.util.TreeMap;

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
    public String table_name;
    public JsonObject table_request;
    public OutputStream response_output_stream;
    public JsonArray errors;
    public int affected_rows;
    public Boolean is_empty_view;
    public JsonObject view;
    public Response response;
    public Returns returns;
    public TreeMap<String, RecordProcessor> children;
    
    public RecordProcessor(String key, JsonObject table_request, OutputStream response_output_stream) {
        this.table_name = table_name;
        this.table_request = table_request;
        this.response_output_stream = response_output_stream;
        this.errors = new JsonArray();
        this.is_empty_view = true;
        this.affected_rows = 0;
        this.returns = new Returns();
        children = new TreeMap<String, RecordProcessor>();
    }
    
    public JsonObject getTableRequest() {
        return table_request;
    }
    
    public RecordProcessor getChildTableRecordProcessor(String table_name) {
        return children.get(table_name);
    }
    
    public void addChildRecordProcessor(RecordProcessor child_record_processor) throws Exception {
        if (this.children.containsKey(table_name) == true) {
            throw new Exception("RecordProcessor Key '"+child_record_processor.table_name+"' already exists!!");
        }
        this.children.put(child_record_processor.table_name, child_record_processor);
    }
    
    public void deleteChildRecordProcessor(RecordProcessor child_record_processor) {
        children.remove(child_record_processor.table_name);
    }
    
    public OutputStream getResponseOutputStream() {
        return response_output_stream;
    }
    
    public JsonArray addError(String error) {
        errors.add(error);
        return errors;
    }
    
    public JsonArray getErrors() {
        return errors;
    }
    
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
