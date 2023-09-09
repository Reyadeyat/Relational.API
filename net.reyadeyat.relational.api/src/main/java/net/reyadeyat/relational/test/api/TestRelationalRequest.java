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
package net.reyadeyat.relational.test.api;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import net.reyadeyat.relational.api.database.RecordProcessor;
import net.reyadeyat.relational.api.jdbc.JDBCSource;
import net.reyadeyat.relational.api.json.JsonUtil;
import net.reyadeyat.relational.api.request.RelationalRequest;
import net.reyadeyat.relational.api.request.Request;
import net.reyadeyat.relational.api.request.RequestDefinition;

/**
 *
 * Description
 *
 *
 * @author Mohammad Nabil Mostafa
 * <a href="mailto:code@reyadeyat.net">code@reyadeyat.net</a>
 *
 * @since 2023.07.01
 */
public class TestRelationalRequest extends RelationalRequest {
    
    public TestRelationalRequest(RequestDefinition request_definition, HashMap<String, Class> interface_implementation) throws Exception {
        super(request_definition, interface_implementation);
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            registered_jdbcsource_map.put(model_jdbc_source.getDatabaseName(), model_jdbc_source);
            registered_jdbcsource_map.put(data_jdbc_source.getDatabaseName(), data_jdbc_source);
        } catch (Exception ex) {
            Logger.getLogger(TestRelationalRequest.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }
        
        try (Connection jdbc_connection = data_jdbc_source.getConnection(true)) {
            //.registered_datasource_map.put(name, datasource);
            Gson gson = JsonUtil.gson();
            Integer security_flag = SECURITY_FLAG_ASSERT_VALID_FIELD_NAMES | SECURITY_FLAG_RETURN_DESCRIPTIVE_RESPONSE_MESSAGE | SECURITY_FLAG_RETURN_GENERATED_ID;
            JsonArray log_list = new JsonArray();
            JsonArray error_list = new JsonArray();
            RequestDefinition request_definition = gson.fromJson(request_definition_json_text, RequestDefinition.class);
            request_definition.init();
            
            List<Request> request_list = gson.fromJson(json_request_text, new TypeToken<List<Request>>(){}.getType());
            ByteArrayOutputStream response_output_stream = new ByteArrayOutputStream();
            //FileOutputStream response_output_stream = new FileOutputStream(new File("/linux/reyadeyat/projects/open-source/Relational.API/response.txt"));
            
            HashMap<String, Class> interface_implementation = new HashMap<>();
            interface_implementation.put("net.reyadeyat.relational.api.model.TableDataStructures", UserDefinedTableDataStructures.class);
            
            TestRelationalRequest relational_request = new TestRelationalRequest(request_definition, interface_implementation);
            relational_request.serviceTransaction(security_flag, request_list, response_output_stream, jdbc_connection, log_list, error_list);
            String reposnse_string = new String(response_output_stream.toByteArray(), StandardCharsets.UTF_8);
            Logger.getLogger(TestRelationalRequest.class.getName()).log(Level.INFO, reposnse_string);
        } catch (Exception ex) {
            Logger.getLogger(TestRelationalRequest.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    @Override
    public DataSource getDataSource(String datasource_name) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }
    
    @Override
    public JDBCSource getJDBCSource(String datasource_name) throws Exception {
        return registered_jdbcsource_map.get(datasource_name);
    }

    @Override
    public Connection getDatabaseConnection(String datasource_name) throws Exception {
        return registered_jdbcsource_map.get(datasource_name).getConnection(false);
    }

    @Override
    public Boolean insertPreLogic(RecordProcessor record_processor, Connection connection) throws Exception {
        return true;
    }

    @Override
    public Boolean insertPostLogic(RecordProcessor record_processor, Connection connection) throws Exception {
        return true;
    }

    @Override
    public Boolean selectPreLogic(RecordProcessor record_processor, Connection connection) throws Exception {
        return true;
    }

    @Override
    public Boolean selectPerRecordLogic(RecordProcessor record_processor, ResultSet rs, JsonObject record_object) throws Exception {
        return true;
    }

    @Override
    public Boolean selectPerRecordLogic(RecordProcessor record_processor, ResultSet rs, JsonArray record_list) throws Exception {
        return true;
    }

    @Override
    public Boolean selectPostLogic(RecordProcessor record_processor, Connection connection, JsonArray resultset_json) throws Exception {
        return true;
    }

    @Override
    public Boolean updatePreLogic(RecordProcessor record_processor, Connection connection) throws Exception {
        return true;
    }

    @Override
    public Boolean updatePostLogic(RecordProcessor record_processor, Connection connection) throws Exception {
        return true;
    }

    @Override
    public Boolean deletePreLogic(RecordProcessor record_processor, Connection connection) throws Exception {
        return true;
    }

    @Override
    public Boolean deletePostLogic(RecordProcessor record_processor, Connection connection) throws Exception {
        return true;
    }

    @Override
    public Boolean insertInject(RecordProcessor record_processor) throws Exception {
        //Inject data critical fields before backend operations inside preInsertfunction
        return true;
    }

    @Override
    public Boolean updateInject(RecordProcessor record_processor) throws Exception {
        //Inject data critical fields before backend operations inside preUpdate function
        return true;
    }

    @Override
    public Boolean selectInject(RecordProcessor record_processor) throws Exception {
        //Inject data critical fields before backend operations inside preInsert function
        return true;
    }

    @Override
    public Boolean deleteInject(RecordProcessor record_processor) throws Exception {
        //Inject data critical fields before backend operations inside preDelete function
        return true;
    }

    @Override
    public Boolean insertEject(RecordProcessor record_processor) throws Exception {
        //Eject data critical fields after backend operations inside postInsert function
        return true;
    }

    @Override
    public Boolean updateEject(RecordProcessor record_processor) throws Exception {
        //Eject data critical fields after backend operations inside postUpdate function
        return true;
    }

    @Override
    public Boolean selectEject(RecordProcessor record_processor) throws Exception {
        //Eject data critical fields after backend operations inside postSelect function
        return true;
    }

    @Override
    public Boolean deleteEject(RecordProcessor record_processor) throws Exception {
        //Eject data critical fields after backend operations inside postDelete function
        return true;
    }
    
    private static String data_database = "parental";

    private static String json_request_text = 
        """
        [
            {
                "table": "table_a_x",
                "response": "tree",
                "select": [
                  "id",
                  "name_ar",
                  "name_en",
                  "date",
                  "time",
                  "timestamp",
                  "boolean"
                ],
                "where": {
                  "clause": "id>?",
                  "values": [
                    0
                  ]
                },
                "order_by": [
                  "id"
                ],
                "children": [
                    {
                        "table": "table_a_a_x",
                        "response": "tabular",
                        "select": [
                            "id",
                            "name_ar",
                            "name_en",
                            "date",
                            "time",
                            "timestamp",
                            "boolean"
                        ],
                        "where": {
                            "clause": "id=?",
                            "values": [
                                "parent.id"
                            ]
                        },
                        "order_by": [
                            "id"
                        ]
                    },
                    {
                        "table": "table_a_b_x",
                        "response": "tree",
                        "select": [
                            "id",
                            "name_ar",
                            "name_en",
                            "date",
                            "time",
                            "timestamp",
                            "boolean"
                        ],
                        "where": {
                            "clause": "id=?",
                            "values": [
                                "parent.id"
                            ]
                        },
                        "order_by": [
                            "id"
                        ],
                        "children": [
                            {
                                "table": "table_a_b_a_x",
                                "response": "tabular",
                                "select": [
                                    "id",
                                    "name_ar",
                                    "name_en",
                                    "date",
                                    "time",
                                    "timestamp",
                                    "boolean"
                                ],
                                "where": {
                                    "clause": "id=?",
                                    "values": [
                                        "parent.id"
                                    ]
                                },
                                "order_by": [
                                    "id"
                                ]
                            }
                        ]
                    },
                    {
                        "table": "table_a_c_x",
                        "response": "tabular",
                        "select": [
                            "id",
                            "name_ar",
                            "name_en",
                            "date",
                            "time",
                            "timestamp",
                            "boolean"
                        ],
                        "where": {
                            "clause": "id=?",
                            "values": [
                                "parent.id"
                            ]
                        },
                        "order_by": [
                            "id"
                        ]
                    }
                ]
            }
        ]
        """;
    
    private static String request_definition_json_text = """
        {
            "service_name": "parental_service",
            "model_id": "500",
            "model_datasource_name": "model",
            "data_datasource_name": "%s",
            "data_database_name": "%s",
            "secret_key": "1234567890",
            "transaction_type": ["insert","select","update","delete"],
            "request_table": {
                "table_name": "table_a",
                "table_alias": "table_a_x",
                "fields": [
                    {"name": "id", "alias": "id", "group_by": false},
                    {"name": "name_ar", "alias": "name_ar", "group_by": false},
                    {"name": "name_en", "alias": "name_en", "group_by": false},
                    {"name": "date", "alias": "date", "group_by": false},
                    {"name": "time", "alias": "time", "group_by": false},
                    {"name": "timestamp", "alias": "timestamp", "group_by": false},
                    {"name": "boolean", "alias": "boolean", "group_by": false}
                ],
                "children": [
                    {
                        "table_name": "table_a_a",
                        "table_alias": "table_a_a_x",
                        "fields": [
                            {"name": "id", "alias": "id", "group_by": false},
                            {"name": "name_ar", "alias": "name_ar", "group_by": false},
                            {"name": "name_en", "alias": "name_en", "group_by": false},
                            {"name": "date", "alias": "date", "group_by": false},
                            {"name": "time", "alias": "time", "group_by": false},
                            {"name": "timestamp", "alias": "timestamp", "group_by": false},
                            {"name": "boolean", "alias": "boolean", "group_by": false}
                        ],
                        "children": []
                    },
                    {
                        "table_name": "table_a_b",
                        "table_alias": "table_a_b_x",
                        "fields": [
                            {"name": "id", "alias": "id", "group_by": false},
                            {"name": "name_ar", "alias": "name_ar", "group_by": false},
                            {"name": "name_en", "alias": "name_en", "group_by": false},
                            {"name": "date", "alias": "date", "group_by": false},
                            {"name": "time", "alias": "time", "group_by": false},
                            {"name": "timestamp", "alias": "timestamp", "group_by": false},
                            {"name": "boolean", "alias": "boolean", "group_by": false}
                        ],
                        "children": [
                            {
                                "table_name": "table_a_b_a",
                                "table_alias": "table_a_b_a_x",
                                "fields": [
                                    {"name": "id", "alias": "id", "group_by": false},
                                    {"name": "name_ar", "alias": "name_ar", "group_by": false},
                                    {"name": "name_en", "alias": "name_en", "group_by": false},
                                    {"name": "date", "alias": "date", "group_by": false},
                                    {"name": "time", "alias": "time", "group_by": false},
                                    {"name": "timestamp", "alias": "timestamp", "group_by": false},
                                    {"name": "boolean", "alias": "boolean", "group_by": false}
                                ],
                                "children": []
                            }
                        ]
                    },
                    {
                        "table_name": "table_a_c",
                        "table_alias": "table_a_c_x",
                        "fields": [
                            {"name": "id", "alias": "id", "group_by": false},
                            {"name": "name_ar", "alias": "name_ar", "group_by": false},
                            {"name": "name_en", "alias": "name_en", "group_by": false},
                            {"name": "date", "alias": "date", "group_by": false},
                            {"name": "time", "alias": "time", "group_by": false},
                            {"name": "timestamp", "alias": "timestamp", "group_by": false},
                            {"name": "boolean", "alias": "boolean", "group_by": false}
                        ],
                        "children": []
                    }
                ]
            }
        }
        """.formatted(data_database, data_database);
    
    private static HashMap<String, DataSource> registered_datasource_map = new HashMap<>();
    private static HashMap<String, JDBCSource> registered_jdbcsource_map = new HashMap<>();
    
    private static String model_version = "0.0.0.0001";

    private static JDBCSource model_jdbc_source = new JDBCSource() {
        private static String model_database_server = "localhost:33060";
        private static String model_database_user_name = "remote";
        private static String model_database_password = "123456";
        private static String model_database_schema = "model";
        private static final String database_schema = "";
        private static final String mysql_database_field_open_quote = "`";
        private static final String mysql_database_field_close_quote = "`";

        @Override
        public String getDataSourceName() throws Exception {
            return getDatabaseName();
        }
        
        @Override
        public Connection getConnection(Boolean auto_commit) throws Exception {
            //CREATE DATABASE `data` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
            Connection database_connection = DriverManager.getConnection("jdbc:mysql://" + model_database_server + "/" + model_database_schema, model_database_user_name, model_database_password);
            database_connection.setAutoCommit(auto_commit);
            return database_connection;
        }

        @Override
        public String getUserName() throws Exception {
            return model_database_user_name;
        }

        @Override
        public String getUserPassword() throws Exception {
            return model_database_password;
        }

        @Override
        public String getDatabaseEngine() throws Exception {
            return "mysql";
        }

        @Override
        public String getURL() throws Exception {
            return "jdbc:mysql://" + model_database_server + "/" + model_database_schema;
        }

        @Override
        public String getDatabaseName() throws Exception {
            return model_database_schema;
        }

        @Override
        public String getDatabaseServer() throws Exception {
            return model_database_server;
        }

        @Override
        public String getDatabaseSchema() throws Exception {
            return "";
        }

        @Override
        public String getDatabaseOpenQuote() throws Exception {
            return mysql_database_field_open_quote;
        }

        @Override
        public String getDatabaseCloseQuote() throws Exception {
            return mysql_database_field_close_quote;
        }
    };
    
    private static JDBCSource data_jdbc_source = new JDBCSource() {
        private static final String data_database_server = "localhost:33060";
        private static final String data_database_user_name = "remote";
        private static final String data_database_password = "123456";
        private static final String data_database_schema = data_database;
        private static final String database_schema = "";
        private static final String mysql_database_field_open_quote = "`";
        private static final String mysql_database_field_close_quote = "`";
        
        @Override
        public String getDataSourceName() throws Exception {
            return getDatabaseName();
        }

        @Override
        public Connection getConnection(Boolean auto_commit) throws Exception {
            //CREATE DATABASE `data` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
            Connection database_connection = DriverManager.getConnection("jdbc:mysql://" + data_database_server + "/" + data_database_schema, data_database_user_name, data_database_password);
            database_connection.setAutoCommit(auto_commit);
            return database_connection;
        }

        @Override
        public String getUserName() throws Exception {
            return data_database_user_name;
        }

        @Override
        public String getUserPassword() throws Exception {
            return data_database_password;
        }

        @Override
        public String getDatabaseEngine() throws Exception {
            return "mysql";
        }

        @Override
        public String getURL() throws Exception {
            return "jdbc:mysql://" + data_database_server + "/" + data_database_schema;
        }

        @Override
        public String getDatabaseName() throws Exception {
            return data_database_schema;
        }

        @Override
        public String getDatabaseServer() throws Exception {
            return data_database_server;
        }

        @Override
        public String getDatabaseSchema() throws Exception {
            return "";
        }

        @Override
        public String getDatabaseOpenQuote() throws Exception {
            return mysql_database_field_open_quote;
        }

        @Override
        public String getDatabaseCloseQuote() throws Exception {
            return mysql_database_field_close_quote;
        }
    };

}
