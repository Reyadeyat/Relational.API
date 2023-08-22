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
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import net.reyadeyat.relational.api.database.RecordProcessor;
import net.reyadeyat.relational.api.jdbc.JDBCSource;
import net.reyadeyat.relational.api.json.JsonUtil;
import net.reyadeyat.relational.api.request.RelationalRequest;

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
    
    public TestRelationalRequest(JsonObject request_service_definition_json, HashMap<String, Class> interface_implementation) throws Exception {
        super(request_service_definition_json, interface_implementation);
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {

            Connection jdbc_connection = data_jdbc_source.getConnection(true);

            Integer security_flag = SECURITY_FLAG_ASSERT_VALID_FIELD_NAMES | SECURITY_FLAG_RETURN_DESCRIPTIVE_RESPONSE_MESSAGE | SECURITY_FLAG_RETURN_GENERATED_ID;
            Gson gson = JsonUtil.gson();
            JsonObject json_request = gson.fromJson(json_request_text, JsonObject.class);
            ByteArrayOutputStream response_output_stream = new ByteArrayOutputStream();
            JsonArray log_list = new JsonArray();
            JsonArray error_list = new JsonArray();
            JsonObject request_service_definition_json = gson.fromJson(request_service_definition_json_text, JsonObject.class);
            
            HashMap<String, Class> interface_implementation = new HashMap<String, Class>();
            interface_implementation.put("net.reyadeyat.relational.api.model.TableDataStructures", UserDefinedTableDataStructures.class);
            
            TestRelationalRequest relational_request = new TestRelationalRequest(request_service_definition_json, interface_implementation);
            relational_request.serviceTransaction(security_flag, json_request, response_output_stream, jdbc_connection, log_list, error_list);
            String reposnse_string = new String(response_output_stream.toByteArray(), StandardCharsets.UTF_8);
            Logger.getLogger(TestRelationalRequest.class.getName()).log(Level.INFO, reposnse_string);
        } catch (Exception ex) {
            Logger.getLogger(TestRelationalRequest.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

    @Override
    public String getDefaultDatasourceName() {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public DataSource getDataSource(String datasource_name) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }
    
    @Override
    public JDBCSource getJDBCSource(String datasource_name) throws Exception {
        if (datasource_name.equalsIgnoreCase("model") == true) {
            return model_jdbc_source;
        } else if (datasource_name.equalsIgnoreCase("parental") == true) {
            return data_jdbc_source;
        }
        throw new Exception("JDBC Source '"+datasource_name+"' is not defined in this service container!!");
    }
    
    @Override
    public Connection getDataSourceConnection(String datasource_name) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Connection getJDBCSourceConnection(String datasource_name) throws Exception {
        if (datasource_name.equalsIgnoreCase("model") == true) {
            return model_jdbc_source.getConnection(false);
        } else if (datasource_name.equalsIgnoreCase("data") == true) {
            return data_jdbc_source.getConnection(false);
        }
        throw new Exception("JDBC Source '"+datasource_name+"' is not defined in this service container!!");
    }

    @Override
    public Connection getDatabaseConnection(String datasurce_name) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean insertPreLogic(RecordProcessor record_processor, Connection con) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean insertPostLogic(RecordProcessor record_processor, Connection con) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean selectPreLogic(RecordProcessor record_processor, Connection con) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean selectPerRecordLogic(RecordProcessor record_processor, ResultSet rs, JsonObject record_object) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean selectPerRecordLogic(RecordProcessor record_processor, ResultSet rs, JsonArray record_list) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean selectPostLogic(RecordProcessor record_processor, Connection con, JsonObject request_database_request, JsonArray resultset_json) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean updatePreLogic(RecordProcessor record_processor, Connection con) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean updatePostLogic(RecordProcessor record_processor, Connection con) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean deletePreLogic(RecordProcessor record_processor, Connection con) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean deletePostLogic(RecordProcessor record_processor, Connection con) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean insertInject(RecordProcessor record_processor) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean updateInject(RecordProcessor record_processor) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean selectInject(RecordProcessor record_processor) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean deleteInject(RecordProcessor record_processor) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean insertEject(RecordProcessor record_processor) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean updateEject(RecordProcessor record_processor) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean selectEject(RecordProcessor record_processor) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    @Override
    public Boolean deleteEject(RecordProcessor record_processor) throws Exception {
        throw new UnsupportedOperationException("Not implemented yet.");
    }

    private static String json_request_text = """
            {
              "table_a": {
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
                "orderby": [
                  "id"
                ],
                "table_a_a": {
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
                  "orderby": [
                    "id"
                  ]
                },
                "table_a_b": {
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
                  "orderby": [
                    "id"
                  ],
                  "table_a_b_a": {
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
                    "orderby": [
                      "id"
                    ]
                  }
                },
                "table_a_c": {
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
                  "orderby": [
                    "id"
                  ]
                }
              }
            }
            """;

    private static String model_service = """
            {
              "service_name": "parental_service",
              "default_datasource_name": "parental",
              "database_name": "parental",
              "model_id": "500",
              "model_datasource_name": "model",
              "data_datasource_name": "parental",
              "secret_key": "1234567890",
              "table_tree": [
                {
                  "table_name": "table_a",
                  "children": [
                    {
                      "table_name": "table_a_a",
                      "children": []
                    },
                    {
                      "table_name": "table_a_b",
                      "children": [
                        {
                          "table_name": "table_a_b_a",
                          "children": []
                        }
                      ]
                    },
                    {
                      "table_name": "table_a_c",
                      "children": []
                    }
                  ]
                }
              ]
            }
            """;
    
    private static String request_service_definition_json_text = """
        {
            "service_name": "parental_service",
            "default_datasource_name": "parental",
            "database_name": "parental",
            "model_id": "500",
            "model_datasource_name": "model",
            "data_datasource_name": "parental",
            "secret_key": "1234567890",
            "table_tree": "table_a",
            "table_a": {
                "table_name": "table_a",
                "transaction_type_list": "insert,select,update,delete",
                "children": [
                    {
                        "table_name": "table_a_a",
                        "transaction_type_list": "insert,select,update,delete",
                        "children": []
                    },
                    {
                        "table_name": "table_a_b",
                        "transaction_type_list": "insert,select,update,delete",
                        "children": [
                            {
                                "table_name": "table_a_b_a",
                                "transaction_type_list": "insert,select,update,delete",
                                "children": []
                            }
                        ]
                    },
                    {
                        "table_name": "table_a_c",
                        "transaction_type_list": "insert,select,update,delete",
                        "children": []
                    }
                ]
            }
        }
            """;
    private static String model_version = "0.0.0.0001";

    private static String data_database_server = "localhost:33060";
    private static String data_database_user_name = "remote";
    private static String data_database_password = "123456";
    private static String data_database_schema = "parental";

    private static String model_database_server = "localhost:33060";
    private static String model_database_user_name = "remote";
    private static String model_database_password = "123456";
    private static String model_database_schema = "model";

    //private static String database_schema = "";
    private static String mysql_database_field_open_quote = "`";
    private static String mysql_database_field_close_quote = "`";

    private static JDBCSource data_jdbc_source = new JDBCSource() {
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
    
    private static JDBCSource model_jdbc_source = new JDBCSource() {
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

}
