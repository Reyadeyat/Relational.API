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

import com.google.gson.annotations.SerializedName;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class RequestTable {
    public String table_alias;
    public String table_name;
    @SerializedName("transaction_type")
    public List<String> transaction_type_list;
    @SerializedName("fields")
    public List<RequestField> request_field_list;
    public Map<String, RequestField> request_field_map;
    @SerializedName("children")
    public List<RequestTable> child_request_table_list;
    public Map<String, RequestTable> child_request_table_map;
    
    public void init() {
        if (request_field_list != null && request_field_map == null) {
            request_field_map = new HashMap<>();
            for(RequestField request_field : request_field_list) {
                request_field_map.put(request_field.field_alias, request_field);
            }
        }
        if (child_request_table_list != null && child_request_table_map == null) {
            child_request_table_map = new HashMap<>();
            for (RequestTable child : child_request_table_list) {
                child_request_table_map.put(child.table_alias, child);
                child.init();
            }
        }
    }
}