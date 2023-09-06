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
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import net.reyadeyat.relational.api.request.Response;
import net.reyadeyat.relational.api.util.Returns;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.TreeMap;
import net.reyadeyat.relational.api.json.JsonUtil;
import net.reyadeyat.relational.api.request.Request;

/**
 * 
 * Description Record request processor
 * 
 *
 * @author Mohammad Nabil Mostafa
 * <a href="mailto:code@reyadeyat.net">code@reyadeyat.net</a>
 * 
 * @since 2023.01.01
 */
public class RecordProcessor {
    public Request request;
    public String command;
    public OutputStream response_output_stream;
    public JsonArray error_list;
    public int affected_rows;
    public Boolean is_empty_view;
    public JsonElement view;
    public Response response;
    public Returns returns;
    public TreeMap<String, RecordProcessor> child_tree;
    public ArrayList<RecordProcessor> child_list;
    
    public RecordProcessor(Request request, OutputStream response_output_stream) throws Exception {
        this.request = request;
        this.command = is_select() ? "Select" : is_insert() ? "insert" : is_update() ? "Update" : is_delete() ? "Delete" : null;
        if (this.command == null) {
             throw new Exception("Request has invalid command type");
        }
        this.response_output_stream = response_output_stream;
        this.error_list = new JsonArray();
        this.is_empty_view = true;
        this.affected_rows = 0;
        this.returns = new Returns();
        child_tree = new TreeMap<String, RecordProcessor>();
        for (Request child_request : request.child_list) {
            RecordProcessor child_record_processor = new RecordProcessor(child_request, response_output_stream);
            child_list.add(child_record_processor);
            child_tree.put(child_record_processor.request.table_alias, child_record_processor);
        }
    }
    
    public String getResponseView() {
        return request.response;
    }
    
    public Request getTableRequest() {
        return request;
    }
    
    public RecordProcessor getChildTableRecordProcessor(String table_alias) {
        return child_tree.get(table_alias);
    }
    
    public void addChildRecordProcessor(RecordProcessor child_record_processor) throws Exception {
        if (this.child_tree.containsKey(child_record_processor.request.table_alias) == true) {
            throw new Exception("RecordProcessor Key '"+child_record_processor.request.table_alias+"' already exists!!");
        }
        this.child_tree.put(child_record_processor.request.table_alias, child_record_processor);
    }
    
    public void deleteChildRecordProcessor(RecordProcessor child_record_processor) {
        child_tree.remove(child_record_processor.request.table_alias);
    }
    
    public OutputStream getResponseOutputStream() {
        return response_output_stream;
    }
    
    public JsonArray addError(String error) {
        error_list.add(error);
        return error_list;
    }
    
    public JsonArray getErrors() {
        return error_list;
    }
    
    public void setDatabaseView(JsonObject view) {
        this.view = view;
    }
    
    public JsonElement getDatabaseView() {
        return view;
    }
    
    public Boolean isEmptyView() throws Exception {
        if (view.isJsonArray()) {
            return view.getAsJsonArray().size() > 0;
        } else if (view.isJsonObject() == true) {
            return view.getAsJsonObject().size() > 0;
        }
        throw new Exception("Response View is not JsonArray nor JsonObject.");
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
    
    public Boolean is_select() {
        return request.select_list != null;
    }
    
    public Boolean is_update() {
        return request.update_field_map != null;
    }
    
    public Boolean is_insert() {
        return request.insert_field_map != null;
    }
    
    public Boolean is_delete() {
        return request.delete_field_map != null;
    }
    
    public String getCommand() throws Exception {
        return command;
    }
    
    public Boolean hasErrors() {
        return error_list.size() > 0;
    }
    
    public Boolean hasGroupBy() {
        return request.group_by_list != null && request.group_by_list.size() > 0;
    }
}
