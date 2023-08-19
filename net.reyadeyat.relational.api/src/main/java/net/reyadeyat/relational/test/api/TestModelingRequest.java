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
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import net.reyadeyat.relational.api.jdbc.JDBCSource;
import net.reyadeyat.relational.api.json.JsonUtil;
import net.reyadeyat.relational.api.modeler.ModelingRequest;
import net.reyadeyat.relational.api.request.Response;

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
public class TestModelingRequest extends ModelingRequest {
    
    public TestModelingRequest() throws Exception {
        super();
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            Connection jdbc_connection = data_jdbc_source.getConnection(true);
            Integer security_flag = SECURITY_FLAG_ASSERT_VALID_FIELD_NAMES | SECURITY_FLAG_RETURN_DESCRIPTIVE_RESPONSE_MESSAGE | SECURITY_FLAG_RETURN_GENERATED_ID;
            Gson gson = JsonUtil.gson();
            //JsonObject model_transaction_request = gson.fromJson(model_transaction_request_json_text, JsonObject.class);
            JsonArray log_list = new JsonArray();
            
            //ByteArrayOutputStream response_output_stream = new ByteArrayOutputStream();
            FileOutputStream response_output_stream = new FileOutputStream(new File("/linux/reyadeyat/projects/open-source/Relational.API/modeling.sql"));
            
            JsonArray error_list = new JsonArray();
            TestModelingRequest modeling_request = new TestModelingRequest();
            
            //Delete Model Request
            JsonObject model_service_delete_json = gson.fromJson(model_service_delete_request_json_text, JsonObject.class);
            Response delete_response = modeling_request.serviceTransaction(security_flag, model_service_delete_json, response_output_stream, jdbc_connection, log_list, error_list);
            
            //Build Model Request
            JsonObject model_service_build_json = gson.fromJson(model_service_build_request_json_text, JsonObject.class);
            Response build_response = modeling_request.serviceTransaction(security_flag, model_service_build_json, response_output_stream, jdbc_connection, log_list, error_list);
            
            //Print Model Request
            JsonObject model_service_print_json = gson.fromJson(model_service_print_request_json_text, JsonObject.class);
            Response print_response = modeling_request.serviceTransaction(security_flag, model_service_print_json, response_output_stream, jdbc_connection, log_list, error_list);
            
            //String reposnse_string = new String(response_output_stream.toByteArray(), StandardCharsets.UTF_8);
            //Logger.getLogger(TestModelingRequest.class.getName()).log(Level.INFO, reposnse_string);
        } catch (Exception ex) {
            Logger.getLogger(TestModelingRequest.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
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
    
    /*private static String model_transaction_request_json_text = """
            {
                "service_name": "parental_service",
                "default_datasource_name": "parental",
                "database_name": "parental",
                "model_id": "500",
                "model_datasource_name": "model",
                "data_datasource_name": "parental",
                "secret_key": "1234567890"
            }
            """;*/
    
    private static String model_service_build_request_json_text = """
    {
        "transaction": "build",
        "service_name": "parental_service",
        "default_datasource_name": "parental",
        "database_name": "parental",
        "model_id": "500",
        "model_datasource_name": "model",
        "data_datasource_name": "parental",
        "secret_key": "1234567890",
                                                                  
        "model_id": 500,
        "model_instance_sequence_type_id": 1,
        "model_name": "parental",
        "model_version": 0.0.000001",
        "model_class_path": "net.reyadeyat.relational.api.model.Enterprise",
        "model_data_lookup_category": "MySQL Data Type",
        "modeled_database_url": "jdbc:mysql://localhost:33060/parental",
        "modeled_database_url_user_name": "remote",
        "modeled_database_url_user_password": "123456",
        "modeled_database_schem": "",
        "modeled_database_name": "parental",
        "modeled_database_field_open_quote": "`",
        "modeled_database_field_close_quote": "`",
                                                                  
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
    
    private static String model_service_print_request_json_text = """
    {
        "transaction": "print",
        "print_style": 1,
        "service_name": "parental_service",
        "default_datasource_name": "parental",
        "database_name": "parental",
        "model_id": "500",
        "model_datasource_name": "model",
        "data_datasource_name": "parental",
        "secret_key": "1234567890",
                                                                  
        "model_id": 500,
        "model_instance_sequence_type_id": 1,
        "model_name": "parental",
        "model_version": 0.0.000001",
        "model_class_path": "net.reyadeyat.relational.api.model.Enterprise",
        "model_data_lookup_category": "MySQL Data Type",
        "modeled_database_url": "jdbc:mysql://localhost:33060/parental",
        "modeled_database_url_user_name": "remote",
        "modeled_database_url_user_password": "123456",
        "modeled_database_schem": "",
        "modeled_database_name": "parental",
        "modeled_database_field_open_quote": "`",
        "modeled_database_field_close_quote": "`",
                                                                  
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

    private static String model_service_delete_request_json_text = """
    {
        "transaction": "delete",
        "service_name": "parental_service",
        "default_datasource_name": "parental",
        "database_name": "parental",
        "model_id": "500",
        "model_datasource_name": "model",
        "data_datasource_name": "parental",
        "secret_key": "1234567890"
    }
    """;
    
    private static String model_version = "0.0.0.0001";

    private static JDBCSource data_jdbc_source = new JDBCSource() {
        private static final String data_database_server = "localhost:33060";
        private static final String data_database_user_name = "remote";
        private static final String data_database_password = "123456";
        private static final String data_database_schema = "parental";
        private static final String database_schema = "";
        private static final String mysql_database_field_open_quote = "`";
        private static final String mysql_database_field_close_quote = "`";

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
    
    private static JDBCSource model_jdbc_source = new JDBCSource() {
        private static String model_database_server = "localhost:33060";
        private static String model_database_user_name = "remote";
        private static String model_database_password = "123456";
        private static String model_database_schema = "model";
        private static final String database_schema = "";
        private static final String mysql_database_field_open_quote = "`";
        private static final String mysql_database_field_close_quote = "`";

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
