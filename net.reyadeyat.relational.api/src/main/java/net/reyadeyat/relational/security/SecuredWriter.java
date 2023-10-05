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
package net.reyadeyat.relational.security;

import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mohammad Nabil Mostafa
 * <a href="mailto:code@mnabil.net">code@mnabil.net</a>
 */
public class SecuredWriter extends Writer {
    
    private Writer writer;
    private Reader piped_reader;
    private Security secutiry;
    
    /**Writer only*/
    public SecuredWriter(Writer writer, Security secutiry) {
        this(writer, null, secutiry);
    }
    
    /**Pipe Writer to Reader*/
    public SecuredWriter(Reader piped_reader, Security secutiry) {
        this(null, piped_reader, secutiry);
    }
    
    /**Writer and Piped Writer to Reader*/
    public SecuredWriter(Writer writer, Reader piped_reader, Security secutiry) {
        this.writer = writer;
        this.piped_reader = piped_reader;
        this.secutiry = secutiry;
    }

    @Override
    public void write(char[] plain_buffer, int offset, int length) throws IOException {
        try {
            char[] encrypted_buffer = (this.secutiry.encrypt_text(new String(plain_buffer, offset, length))+"~").toCharArray();
            if (this.piped_reader != null) {
                this.piped_reader.read(encrypted_buffer, 0, encrypted_buffer.length);
            }
            if (writer != null) {
                writer.write(encrypted_buffer, 0, encrypted_buffer.length);
            }
        } catch (Exception ex) {
            throw new IOException(ex);
        }
    }

    @Override
    public void flush() throws IOException {
        if (writer != null) {
            writer.flush();
        }
    }

    @Override
    public void close() throws IOException {
        if (writer != null) {
            writer.close();
        }
    }
    
    
}
