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
import java.sql.Connection;
import java.sql.ResultSet;
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
public interface ModelHandler {
    public String getDefaultDatasourceName();
    public DataSource getDataSource(String datasource_name) throws Exception;
    public JDBCSource getJDBCSource(String datasource_name) throws Exception;
    public Connection getDataSourceConnection(String datasource_name) throws Exception;
    public Connection getJDBCSourceConnection(String datasource_name) throws Exception;
    public Connection getDatabaseConnection(String datasurce_name) throws Exception;
}
