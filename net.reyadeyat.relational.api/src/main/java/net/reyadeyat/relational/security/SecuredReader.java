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
import java.nio.charset.StandardCharsets;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mohammad Nabil Mostafa
 * <a href="mailto:code@mnabil.net">code@mnabil.net</a>
 */
public class SecuredReader extends Reader {
    
    private Reader reader;
    private Writer piped_writer;
    private Security secutiry;
    
    /**Reader only*/
    public SecuredReader(Reader reader, Security secutiry) {
        this(reader, null, secutiry);
    }
    
    /**Piped Reader to Writer*/
    public SecuredReader(Writer writer, Security secutiry) {
        this(null, writer, secutiry);
    }
    
    /**reader and Piped Reader to Writer*/
    public SecuredReader(Reader reader, Writer piped_writer, Security secutiry) {
        this.reader = reader;
        this.piped_writer = piped_writer;
        this.secutiry = secutiry;
    }

    @Override
    public int read(char[] encypted_buffer, int offset, int length) throws IOException {
        try {
            String encrypted_text = new String(encypted_buffer, offset, encypted_buffer[length-1] == '~' ? length - 1 : length);
            char[] plain_buffer = this.secutiry.decrypt_text(encrypted_text).toCharArray();
            if (this.piped_writer != null) {
                this.piped_writer.write(plain_buffer, 0, plain_buffer.length);
            }
            if (reader != null) {
                return reader.read(plain_buffer, 0, plain_buffer.length);
            }
            return plain_buffer.length;
        } catch (Exception ex) {
            throw new IOException(ex);
        }
    }

    @Override
    public void close() throws IOException {
        if (reader != null) {
            reader.close();
        }
    }
    
    public void flush() throws IOException {
        if (this.piped_writer != null) {
            this.piped_writer.flush();
        }
    }
}
