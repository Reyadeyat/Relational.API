/*
 * Copyright (C) 2023 Reyadeyat
 *
 * Reyadeyat/RELATIONAL.API is licensed under the
 * BSD 3-Clause "New" or "Revised" License
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * https://reyadeyat.net/RELATIONAL.API.LICENSE
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package net.reyadeyat.relational.api.sequence;

import java.util.HashMap;

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
public interface Sequence<Type> {
    public void createSequence(Class clas) throws Exception;
    public void initSequence(Class clas, Type value) throws Exception;
    public Boolean hasSequence(Class clas) throws Exception;
    public /*<Type>*/ Type nextSequence(Class clas) throws Exception;
    public /*<Type>*/ Type getSequenceState(Class clas) throws Exception;
    public /*<Type>*/ HashMap<Class, Type> getSequenceState() throws Exception;
}
