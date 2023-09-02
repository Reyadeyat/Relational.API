
|...Enterprise: parental Databases [1]
    |...Database: parental Tables [9]
        |...Table: compound_key Rows [0] Fields [3] Primary Keys [1] Foerign Keys [0]] Child Tables [0]
            |...Field: [1] `auto_id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `string_key` VARCHAR(128)
            |...Field: [3] `some_data` VARCHAR(256)
            |...Primary Key: PRIMARY {`auto_id`}
        |...Table: fact_master Rows [0] Fields [2] Primary Keys [1] Foerign Keys [0]] Child Tables [2]
            |...Field: [1] `fact_master_id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `fact_master_data` VARCHAR(45) NULL
            |...Primary Key: PRIMARY {`fact_master_id`}
            |...Child Table: [fact_transaction -> fact_master] [`fact_transaction`.`fact_master_id` -> `fact_master`.`fact_master_a_id`]
            |...Child Table: [fact_transaction -> fact_master] [`fact_transaction`.`fact_master_id` -> `fact_master`.`fact_master_b_id`]
        |...Table: fact_transaction Rows [0] Fields [4] Primary Keys [1] Foerign Keys [2]] Child Tables [0]
            |...Field: [1] `fact_transaction_id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `fact_master_a_id` INT UNSIGNED(10) NULL
            |...Field: [3] `fact_master_b_id` INT UNSIGNED(10) NULL
            |...Field: [4] `fact_transaction_data` DECIMAL(18,6) NULL
            |...Primary Key: PRIMARY {`fact_transaction_id`}
            |...Foreign Key CONSTRAINT `fk_fact_transaction_01` FOREIGN KEY (`fact_master_id) REFERENCES `fact_master` (`fact_master_a_id) ON UPDATE RESTRICT ON DELETE RESTRICT
            |...Foreign Key CONSTRAINT `fk_fact_transaction_02` FOREIGN KEY (`fact_master_id) REFERENCES `fact_master` (`fact_master_b_id) ON UPDATE RESTRICT ON DELETE RESTRICT
        |...Table: table_a Rows [0] Fields [7] Primary Keys [1] Foerign Keys [0]] Child Tables [3]
            |...Field: [1] `id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `name_ar` VARCHAR(45) NULL
            |...Field: [3] `name_en` VARCHAR(45) NULL
            |...Field: [4] `date` DATE(10) NULL
            |...Field: [5] `time` TIME(8) NULL
            |...Field: [6] `timestamp` TIMESTAMP(19) NULL
            |...Field: [7] `boolean` BIT(1) NULL
            |...Primary Key: PRIMARY {`id`}
            |...Child Table: [table_a_a -> table_a] [`table_a_a`.`id` -> `table_a`.`a_id`]
            |...Child Table: [table_a_b -> table_a] [`table_a_b`.`id` -> `table_a`.`a_id`]
            |...Child Table: [table_a_c -> table_a] [`table_a_c`.`id` -> `table_a`.`a_id`]
        |...Table: table_a_a Rows [0] Fields [8] Primary Keys [1] Foerign Keys [1]] Child Tables [0]
            |...Field: [1] `id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `a_id` INT UNSIGNED(10) NULL
            |...Field: [3] `name_ar` VARCHAR(45) NULL
            |...Field: [4] `name_en` VARCHAR(45) NULL
            |...Field: [5] `date` DATE(10) NULL
            |...Field: [6] `time` TIME(8) NULL
            |...Field: [7] `timestamp` TIMESTAMP(19) NULL
            |...Field: [8] `boolean` BIT(1) NULL
            |...Primary Key: PRIMARY {`id`}
            |...Foreign Key CONSTRAINT `fk_table_a_a_1` FOREIGN KEY (`id) REFERENCES `table_a` (`a_id) ON UPDATE RESTRICT ON DELETE RESTRICT
        |...Table: table_a_b Rows [0] Fields [8] Primary Keys [1] Foerign Keys [1]] Child Tables [1]
            |...Field: [1] `id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `a_id` INT UNSIGNED(10) NULL
            |...Field: [3] `name_ar` VARCHAR(45) NULL
            |...Field: [4] `name_en` VARCHAR(45) NULL
            |...Field: [5] `date` DATE(10) NULL
            |...Field: [6] `time` TIME(8) NULL
            |...Field: [7] `timestamp` TIMESTAMP(19) NULL
            |...Field: [8] `boolean` BIT(1) NULL
            |...Primary Key: PRIMARY {`id`}
            |...Foreign Key CONSTRAINT `fk_table_a_b_1` FOREIGN KEY (`id) REFERENCES `table_a` (`a_id) ON UPDATE RESTRICT ON DELETE RESTRICT
            |...Child Table: [table_a_b_a -> table_a_b] [`table_a_b_a`.`id` -> `table_a_b`.`a_b_id`]
        |...Table: table_a_b_a Rows [0] Fields [8] Primary Keys [1] Foerign Keys [1]] Child Tables [0]
            |...Field: [1] `id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `a_b_id` INT UNSIGNED(10) NULL
            |...Field: [3] `name_ar` VARCHAR(45) NULL
            |...Field: [4] `name_en` VARCHAR(45) NULL
            |...Field: [5] `date` DATE(10) NULL
            |...Field: [6] `time` TIME(8) NULL
            |...Field: [7] `timestamp` TIMESTAMP(19) NULL
            |...Field: [8] `boolean` BIT(1) NULL
            |...Primary Key: PRIMARY {`id`}
            |...Foreign Key CONSTRAINT `fk_table_a_b_a_1` FOREIGN KEY (`id) REFERENCES `table_a_b` (`a_b_id) ON UPDATE RESTRICT ON DELETE RESTRICT
        |...Table: table_a_c Rows [0] Fields [8] Primary Keys [1] Foerign Keys [1]] Child Tables [0]
            |...Field: [1] `id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `a_id` INT UNSIGNED(10) NULL
            |...Field: [3] `name_ar` VARCHAR(45) NULL
            |...Field: [4] `name_en` VARCHAR(45) NULL
            |...Field: [5] `date` DATE(10) NULL
            |...Field: [6] `time` TIME(8) NULL
            |...Field: [7] `timestamp` TIMESTAMP(19) NULL
            |...Field: [8] `boolean` BIT(1) NULL
            |...Primary Key: PRIMARY {`id`}
            |...Foreign Key CONSTRAINT `fk_table_a_c_1` FOREIGN KEY (`id) REFERENCES `table_a` (`a_id) ON UPDATE RESTRICT ON DELETE RESTRICT
        |...Table: tree_model Rows [0] Fields [1] Primary Keys [1] Foerign Keys [0]] Child Tables [0]
            |...Field: [1] `node_id` INT UNSIGNED(10) AUTOINCREMENT
            |...Primary Key: PRIMARY {`node_id`}
=====================================================================================================

    |...Table Logic Tree: Database[parental] Tables Count [9]
        |...[1]:[compound_key.]:[0]
        |...[1]:[fact_master.]:[2]
            |...[2]:[fact_master.fact_transaction.]:[0]
            |...[2]:[fact_master.fact_transaction.]:[0]
        |...[1]:[fact_transaction.]:[0]
        |...[1]:[table_a.]:[3]
            |...[2]:[table_a.table_a_a.]:[0]
            |...[2]:[table_a.table_a_b.]:[1]
                |...[3]:[table_a.table_a_b.table_a_b_a.]:[0]
            |...[2]:[table_a.table_a_c.]:[0]
        |...[1]:[table_a_a.]:[0]
        |...[1]:[table_a_b.]:[1]
            |...[2]:[table_a_b.table_a_b_a.]:[0]
        |...[1]:[table_a_b_a.]:[0]
        |...[1]:[table_a_c.]:[0]
        |...[1]:[tree_model.]:[0]
Table [compound_key][Parent Paths]
Table [compound_key][All Paths]
|...compound_key.
|...compound_key.
Table [compound_key][All Paths Inner Joined]
compound_key
compound_key
{"sql":"SELECT `compound_key_1001`.`auto_id` AS `auto_id_101`,`compound_key_1001`.`string_key` AS `string_key_102`,`compound_key_1001`.`some_data` AS `some_data_103` FROM `parental`.`compound_key` AS `compound_key_1001`","table_list_path":"compound_key","table_list":[{"name":"compound_key","alias":"compound_key_1001","field_list":[{"name":"auto_id","alias":"auto_id_101","class_path":"java.lang.Integer"},{"name":"string_key","alias":"string_key_102","class_path":"java.lang.String"},{"name":"some_data","alias":"some_data_103","class_path":"java.lang.String"}]}],"recordset":[]}

compound_key
compound_key
{"sql":"SELECT `compound_key_1001`.`auto_id` AS `auto_id_101`,`compound_key_1001`.`string_key` AS `string_key_102`,`compound_key_1001`.`some_data` AS `some_data_103` FROM `parental`.`compound_key` AS `compound_key_1001`","table_list_path":"compound_key","table_list":[{"name":"compound_key","alias":"compound_key_1001","field_list":[{"name":"auto_id","alias":"auto_id_101","class_path":"java.lang.Integer"},{"name":"string_key","alias":"string_key_102","class_path":"java.lang.String"},{"name":"some_data","alias":"some_data_103","class_path":"java.lang.String"}]}],"recordset":[]}

Table [fact_master][Parent Paths]
Table [fact_master][All Paths]
|...fact_master.
|...fact_master.fact_transaction.
|...fact_master.fact_transaction.
|...fact_master.
|...fact_master.fact_transaction.
|...fact_master.fact_transaction.
Table [fact_master][All Paths Inner Joined]
fact_master
fact_master
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102` FROM `parental`.`fact_master` AS `fact_master_1001`","table_list_path":"fact_master","table_list":[{"name":"fact_master","alias":"fact_master_1001","field_list":[{"name":"fact_master_id","alias":"fact_master_id_101","class_path":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","class_path":"java.lang.String"}]}],"recordset":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","table_list_path":"fact_master.fact_transaction","table_list":[{"name":"fact_master","alias":"fact_master_1001","field_list":[{"name":"fact_master_id","alias":"fact_master_id_101","class_path":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","class_path":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","field_list":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","class_path":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","class_path":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","class_path":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","class_path":"java.lang.Double"}]}],"recordset":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","table_list_path":"fact_master.fact_transaction","table_list":[{"name":"fact_master","alias":"fact_master_1001","field_list":[{"name":"fact_master_id","alias":"fact_master_id_101","class_path":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","class_path":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","field_list":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","class_path":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","class_path":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","class_path":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","class_path":"java.lang.Double"}]}],"recordset":[]}

fact_master
fact_master
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102` FROM `parental`.`fact_master` AS `fact_master_1001`","table_list_path":"fact_master","table_list":[{"name":"fact_master","alias":"fact_master_1001","field_list":[{"name":"fact_master_id","alias":"fact_master_id_101","class_path":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","class_path":"java.lang.String"}]}],"recordset":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","table_list_path":"fact_master.fact_transaction","table_list":[{"name":"fact_master","alias":"fact_master_1001","field_list":[{"name":"fact_master_id","alias":"fact_master_id_101","class_path":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","class_path":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","field_list":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","class_path":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","class_path":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","class_path":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","class_path":"java.lang.Double"}]}],"recordset":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","table_list_path":"fact_master.fact_transaction","table_list":[{"name":"fact_master","alias":"fact_master_1001","field_list":[{"name":"fact_master_id","alias":"fact_master_id_101","class_path":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","class_path":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","field_list":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","class_path":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","class_path":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","class_path":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","class_path":"java.lang.Double"}]}],"recordset":[]}

Table [fact_transaction][Parent Paths]
|...fact_master.
|...fact_master.
|...fact_master.
|...fact_master.
Table [fact_transaction][All Paths]
|...fact_master.fact_transaction.
|...fact_master.fact_transaction.
|...fact_master.fact_transaction.
|...fact_transaction.
|...fact_master.fact_transaction.
|...fact_master.fact_transaction.
|...fact_master.fact_transaction.
|...fact_transaction.
Table [fact_transaction][All Paths Inner Joined]
fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","table_list_path":"fact_master.fact_transaction","table_list":[{"name":"fact_master","alias":"fact_master_1001","field_list":[{"name":"fact_master_id","alias":"fact_master_id_101","class_path":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","class_path":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","field_list":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","class_path":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","class_path":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","class_path":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","class_path":"java.lang.Double"}]}],"recordset":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","table_list_path":"fact_master.fact_transaction","table_list":[{"name":"fact_master","alias":"fact_master_1001","field_list":[{"name":"fact_master_id","alias":"fact_master_id_101","class_path":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","class_path":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","field_list":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","class_path":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","class_path":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","class_path":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","class_path":"java.lang.Double"}]}],"recordset":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","table_list_path":"fact_master.fact_transaction","table_list":[{"name":"fact_master","alias":"fact_master_1001","field_list":[{"name":"fact_master_id","alias":"fact_master_id_101","class_path":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","class_path":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","field_list":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","class_path":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","class_path":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","class_path":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","class_path":"java.lang.Double"}]}],"recordset":[]}

fact_transaction
fact_transaction
{"sql":"SELECT `fact_transaction_1001`.`fact_transaction_id` AS `fact_transaction_id_101`,`fact_transaction_1001`.`fact_master_a_id` AS `fact_master_a_id_102`,`fact_transaction_1001`.`fact_master_b_id` AS `fact_master_b_id_103`,`fact_transaction_1001`.`fact_transaction_data` AS `fact_transaction_data_104` FROM `parental`.`fact_transaction` AS `fact_transaction_1001`","table_list_path":"fact_transaction","table_list":[{"name":"fact_transaction","alias":"fact_transaction_1001","field_list":[{"name":"fact_transaction_id","alias":"fact_transaction_id_101","class_path":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_102","class_path":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_103","class_path":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_104","class_path":"java.lang.Double"}]}],"recordset":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","table_list_path":"fact_master.fact_transaction","table_list":[{"name":"fact_master","alias":"fact_master_1001","field_list":[{"name":"fact_master_id","alias":"fact_master_id_101","class_path":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","class_path":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","field_list":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","class_path":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","class_path":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","class_path":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","class_path":"java.lang.Double"}]}],"recordset":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","table_list_path":"fact_master.fact_transaction","table_list":[{"name":"fact_master","alias":"fact_master_1001","field_list":[{"name":"fact_master_id","alias":"fact_master_id_101","class_path":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","class_path":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","field_list":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","class_path":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","class_path":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","class_path":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","class_path":"java.lang.Double"}]}],"recordset":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","table_list_path":"fact_master.fact_transaction","table_list":[{"name":"fact_master","alias":"fact_master_1001","field_list":[{"name":"fact_master_id","alias":"fact_master_id_101","class_path":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","class_path":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","field_list":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","class_path":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","class_path":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","class_path":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","class_path":"java.lang.Double"}]}],"recordset":[]}

fact_transaction
fact_transaction
{"sql":"SELECT `fact_transaction_1001`.`fact_transaction_id` AS `fact_transaction_id_101`,`fact_transaction_1001`.`fact_master_a_id` AS `fact_master_a_id_102`,`fact_transaction_1001`.`fact_master_b_id` AS `fact_master_b_id_103`,`fact_transaction_1001`.`fact_transaction_data` AS `fact_transaction_data_104` FROM `parental`.`fact_transaction` AS `fact_transaction_1001`","table_list_path":"fact_transaction","table_list":[{"name":"fact_transaction","alias":"fact_transaction_1001","field_list":[{"name":"fact_transaction_id","alias":"fact_transaction_id_101","class_path":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_102","class_path":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_103","class_path":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_104","class_path":"java.lang.Double"}]}],"recordset":[]}

Table [table_a][Parent Paths]
Table [table_a][All Paths]
|...table_a.
|...table_a.table_a_a.
|...table_a.table_a_b.
|...table_a.table_a_b.table_a_b_a.
|...table_a.table_a_c.
|...table_a.
|...table_a.table_a_a.
|...table_a.table_a_b.
|...table_a.table_a_b.table_a_b_a.
|...table_a.table_a_c.
Table [table_a][All Paths Inner Joined]
table_a
table_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107` FROM `parental`.`table_a` AS `table_a_1001`","table_list_path":"table_a","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a.table_a_a
table_a.table_a_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_a_1002`.`id` AS `id_108`,`table_a_a_1002`.`a_id` AS `a_id_109`,`table_a_a_1002`.`name_ar` AS `name_ar_110`,`table_a_a_1002`.`name_en` AS `name_en_111`,`table_a_a_1002`.`date` AS `date_112`,`table_a_a_1002`.`time` AS `time_113`,`table_a_a_1002`.`timestamp` AS `timestamp_114`,`table_a_a_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_a` AS `table_a_a_1002` ON `table_a_1001`.`id`=`table_a_a_1002`.`a_id`","table_list_path":"table_a.table_a_a","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_a","alias":"table_a_a_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a.table_a_b
table_a.table_a_b
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id`","table_list_path":"table_a.table_a_b","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a.table_a_b.table_a_b_a
table_a.table_a_b.table_a_b_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115`,`table_a_b_a_1003`.`id` AS `id_116`,`table_a_b_a_1003`.`a_b_id` AS `a_b_id_117`,`table_a_b_a_1003`.`name_ar` AS `name_ar_118`,`table_a_b_a_1003`.`name_en` AS `name_en_119`,`table_a_b_a_1003`.`date` AS `date_120`,`table_a_b_a_1003`.`time` AS `time_121`,`table_a_b_a_1003`.`timestamp` AS `timestamp_122`,`table_a_b_a_1003`.`boolean` AS `boolean_123` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1003` ON `table_a_b_1002`.`id`=`table_a_b_a_1003`.`a_b_id`","table_list_path":"table_a.table_a_b.table_a_b_a","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1003","field_list":[{"name":"id","alias":"id_116","class_path":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_117","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_118","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_119","class_path":"java.lang.String"},{"name":"date","alias":"date_120","class_path":"java.sql.Date"},{"name":"time","alias":"time_121","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_122","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_123","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a.table_a_c
table_a.table_a_c
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_c_1002`.`id` AS `id_108`,`table_a_c_1002`.`a_id` AS `a_id_109`,`table_a_c_1002`.`name_ar` AS `name_ar_110`,`table_a_c_1002`.`name_en` AS `name_en_111`,`table_a_c_1002`.`date` AS `date_112`,`table_a_c_1002`.`time` AS `time_113`,`table_a_c_1002`.`timestamp` AS `timestamp_114`,`table_a_c_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_c` AS `table_a_c_1002` ON `table_a_1001`.`id`=`table_a_c_1002`.`a_id`","table_list_path":"table_a.table_a_c","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_c","alias":"table_a_c_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a
table_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107` FROM `parental`.`table_a` AS `table_a_1001`","table_list_path":"table_a","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a.table_a_a
table_a.table_a_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_a_1002`.`id` AS `id_108`,`table_a_a_1002`.`a_id` AS `a_id_109`,`table_a_a_1002`.`name_ar` AS `name_ar_110`,`table_a_a_1002`.`name_en` AS `name_en_111`,`table_a_a_1002`.`date` AS `date_112`,`table_a_a_1002`.`time` AS `time_113`,`table_a_a_1002`.`timestamp` AS `timestamp_114`,`table_a_a_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_a` AS `table_a_a_1002` ON `table_a_1001`.`id`=`table_a_a_1002`.`a_id`","table_list_path":"table_a.table_a_a","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_a","alias":"table_a_a_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a.table_a_b
table_a.table_a_b
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id`","table_list_path":"table_a.table_a_b","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a.table_a_b.table_a_b_a
table_a.table_a_b.table_a_b_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115`,`table_a_b_a_1003`.`id` AS `id_116`,`table_a_b_a_1003`.`a_b_id` AS `a_b_id_117`,`table_a_b_a_1003`.`name_ar` AS `name_ar_118`,`table_a_b_a_1003`.`name_en` AS `name_en_119`,`table_a_b_a_1003`.`date` AS `date_120`,`table_a_b_a_1003`.`time` AS `time_121`,`table_a_b_a_1003`.`timestamp` AS `timestamp_122`,`table_a_b_a_1003`.`boolean` AS `boolean_123` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1003` ON `table_a_b_1002`.`id`=`table_a_b_a_1003`.`a_b_id`","table_list_path":"table_a.table_a_b.table_a_b_a","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1003","field_list":[{"name":"id","alias":"id_116","class_path":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_117","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_118","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_119","class_path":"java.lang.String"},{"name":"date","alias":"date_120","class_path":"java.sql.Date"},{"name":"time","alias":"time_121","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_122","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_123","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a.table_a_c
table_a.table_a_c
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_c_1002`.`id` AS `id_108`,`table_a_c_1002`.`a_id` AS `a_id_109`,`table_a_c_1002`.`name_ar` AS `name_ar_110`,`table_a_c_1002`.`name_en` AS `name_en_111`,`table_a_c_1002`.`date` AS `date_112`,`table_a_c_1002`.`time` AS `time_113`,`table_a_c_1002`.`timestamp` AS `timestamp_114`,`table_a_c_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_c` AS `table_a_c_1002` ON `table_a_1001`.`id`=`table_a_c_1002`.`a_id`","table_list_path":"table_a.table_a_c","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_c","alias":"table_a_c_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]}],"recordset":[]}

Table [table_a_a][Parent Paths]
|...table_a.
|...table_a.
Table [table_a_a][All Paths]
|...table_a.table_a_a.
|...table_a_a.
|...table_a.table_a_a.
|...table_a_a.
Table [table_a_a][All Paths Inner Joined]
table_a.table_a_a
table_a.table_a_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_a_1002`.`id` AS `id_108`,`table_a_a_1002`.`a_id` AS `a_id_109`,`table_a_a_1002`.`name_ar` AS `name_ar_110`,`table_a_a_1002`.`name_en` AS `name_en_111`,`table_a_a_1002`.`date` AS `date_112`,`table_a_a_1002`.`time` AS `time_113`,`table_a_a_1002`.`timestamp` AS `timestamp_114`,`table_a_a_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_a` AS `table_a_a_1002` ON `table_a_1001`.`id`=`table_a_a_1002`.`a_id`","table_list_path":"table_a.table_a_a","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_a","alias":"table_a_a_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a_a
table_a_a
{"sql":"SELECT `table_a_a_1001`.`id` AS `id_101`,`table_a_a_1001`.`a_id` AS `a_id_102`,`table_a_a_1001`.`name_ar` AS `name_ar_103`,`table_a_a_1001`.`name_en` AS `name_en_104`,`table_a_a_1001`.`date` AS `date_105`,`table_a_a_1001`.`time` AS `time_106`,`table_a_a_1001`.`timestamp` AS `timestamp_107`,`table_a_a_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_a` AS `table_a_a_1001`","table_list_path":"table_a_a","table_list":[{"name":"table_a_a","alias":"table_a_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_104","class_path":"java.lang.String"},{"name":"date","alias":"date_105","class_path":"java.sql.Date"},{"name":"time","alias":"time_106","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a.table_a_a
table_a.table_a_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_a_1002`.`id` AS `id_108`,`table_a_a_1002`.`a_id` AS `a_id_109`,`table_a_a_1002`.`name_ar` AS `name_ar_110`,`table_a_a_1002`.`name_en` AS `name_en_111`,`table_a_a_1002`.`date` AS `date_112`,`table_a_a_1002`.`time` AS `time_113`,`table_a_a_1002`.`timestamp` AS `timestamp_114`,`table_a_a_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_a` AS `table_a_a_1002` ON `table_a_1001`.`id`=`table_a_a_1002`.`a_id`","table_list_path":"table_a.table_a_a","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_a","alias":"table_a_a_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a_a
table_a_a
{"sql":"SELECT `table_a_a_1001`.`id` AS `id_101`,`table_a_a_1001`.`a_id` AS `a_id_102`,`table_a_a_1001`.`name_ar` AS `name_ar_103`,`table_a_a_1001`.`name_en` AS `name_en_104`,`table_a_a_1001`.`date` AS `date_105`,`table_a_a_1001`.`time` AS `time_106`,`table_a_a_1001`.`timestamp` AS `timestamp_107`,`table_a_a_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_a` AS `table_a_a_1001`","table_list_path":"table_a_a","table_list":[{"name":"table_a_a","alias":"table_a_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_104","class_path":"java.lang.String"},{"name":"date","alias":"date_105","class_path":"java.sql.Date"},{"name":"time","alias":"time_106","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","class_path":"java.lang.Integer"}]}],"recordset":[]}

Table [table_a_b][Parent Paths]
|...table_a.
|...table_a.
Table [table_a_b][All Paths]
|...table_a.table_a_b.
|...table_a.table_a_b.table_a_b_a.
|...table_a_b.
|...table_a_b.table_a_b_a.
|...table_a.table_a_b.
|...table_a.table_a_b.table_a_b_a.
|...table_a_b.
|...table_a_b.table_a_b_a.
Table [table_a_b][All Paths Inner Joined]
table_a.table_a_b
table_a.table_a_b
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id`","table_list_path":"table_a.table_a_b","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a.table_a_b.table_a_b_a
table_a.table_a_b.table_a_b_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115`,`table_a_b_a_1003`.`id` AS `id_116`,`table_a_b_a_1003`.`a_b_id` AS `a_b_id_117`,`table_a_b_a_1003`.`name_ar` AS `name_ar_118`,`table_a_b_a_1003`.`name_en` AS `name_en_119`,`table_a_b_a_1003`.`date` AS `date_120`,`table_a_b_a_1003`.`time` AS `time_121`,`table_a_b_a_1003`.`timestamp` AS `timestamp_122`,`table_a_b_a_1003`.`boolean` AS `boolean_123` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1003` ON `table_a_b_1002`.`id`=`table_a_b_a_1003`.`a_b_id`","table_list_path":"table_a.table_a_b.table_a_b_a","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1003","field_list":[{"name":"id","alias":"id_116","class_path":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_117","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_118","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_119","class_path":"java.lang.String"},{"name":"date","alias":"date_120","class_path":"java.sql.Date"},{"name":"time","alias":"time_121","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_122","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_123","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a_b
table_a_b
{"sql":"SELECT `table_a_b_1001`.`id` AS `id_101`,`table_a_b_1001`.`a_id` AS `a_id_102`,`table_a_b_1001`.`name_ar` AS `name_ar_103`,`table_a_b_1001`.`name_en` AS `name_en_104`,`table_a_b_1001`.`date` AS `date_105`,`table_a_b_1001`.`time` AS `time_106`,`table_a_b_1001`.`timestamp` AS `timestamp_107`,`table_a_b_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_b` AS `table_a_b_1001`","table_list_path":"table_a_b","table_list":[{"name":"table_a_b","alias":"table_a_b_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_104","class_path":"java.lang.String"},{"name":"date","alias":"date_105","class_path":"java.sql.Date"},{"name":"time","alias":"time_106","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a_b.table_a_b_a
table_a_b.table_a_b_a
{"sql":"SELECT `table_a_b_1001`.`id` AS `id_101`,`table_a_b_1001`.`a_id` AS `a_id_102`,`table_a_b_1001`.`name_ar` AS `name_ar_103`,`table_a_b_1001`.`name_en` AS `name_en_104`,`table_a_b_1001`.`date` AS `date_105`,`table_a_b_1001`.`time` AS `time_106`,`table_a_b_1001`.`timestamp` AS `timestamp_107`,`table_a_b_1001`.`boolean` AS `boolean_108`,`table_a_b_a_1002`.`id` AS `id_109`,`table_a_b_a_1002`.`a_b_id` AS `a_b_id_110`,`table_a_b_a_1002`.`name_ar` AS `name_ar_111`,`table_a_b_a_1002`.`name_en` AS `name_en_112`,`table_a_b_a_1002`.`date` AS `date_113`,`table_a_b_a_1002`.`time` AS `time_114`,`table_a_b_a_1002`.`timestamp` AS `timestamp_115`,`table_a_b_a_1002`.`boolean` AS `boolean_116` FROM `parental`.`table_a_b` AS `table_a_b_1001` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1002` ON `table_a_b_1001`.`id`=`table_a_b_a_1002`.`a_b_id`","table_list_path":"table_a_b.table_a_b_a","table_list":[{"name":"table_a_b","alias":"table_a_b_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_104","class_path":"java.lang.String"},{"name":"date","alias":"date_105","class_path":"java.sql.Date"},{"name":"time","alias":"time_106","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","class_path":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1002","field_list":[{"name":"id","alias":"id_109","class_path":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_110","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_111","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_112","class_path":"java.lang.String"},{"name":"date","alias":"date_113","class_path":"java.sql.Date"},{"name":"time","alias":"time_114","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_115","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_116","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a.table_a_b
table_a.table_a_b
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id`","table_list_path":"table_a.table_a_b","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a.table_a_b.table_a_b_a
table_a.table_a_b.table_a_b_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115`,`table_a_b_a_1003`.`id` AS `id_116`,`table_a_b_a_1003`.`a_b_id` AS `a_b_id_117`,`table_a_b_a_1003`.`name_ar` AS `name_ar_118`,`table_a_b_a_1003`.`name_en` AS `name_en_119`,`table_a_b_a_1003`.`date` AS `date_120`,`table_a_b_a_1003`.`time` AS `time_121`,`table_a_b_a_1003`.`timestamp` AS `timestamp_122`,`table_a_b_a_1003`.`boolean` AS `boolean_123` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1003` ON `table_a_b_1002`.`id`=`table_a_b_a_1003`.`a_b_id`","table_list_path":"table_a.table_a_b.table_a_b_a","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1003","field_list":[{"name":"id","alias":"id_116","class_path":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_117","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_118","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_119","class_path":"java.lang.String"},{"name":"date","alias":"date_120","class_path":"java.sql.Date"},{"name":"time","alias":"time_121","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_122","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_123","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a_b
table_a_b
{"sql":"SELECT `table_a_b_1001`.`id` AS `id_101`,`table_a_b_1001`.`a_id` AS `a_id_102`,`table_a_b_1001`.`name_ar` AS `name_ar_103`,`table_a_b_1001`.`name_en` AS `name_en_104`,`table_a_b_1001`.`date` AS `date_105`,`table_a_b_1001`.`time` AS `time_106`,`table_a_b_1001`.`timestamp` AS `timestamp_107`,`table_a_b_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_b` AS `table_a_b_1001`","table_list_path":"table_a_b","table_list":[{"name":"table_a_b","alias":"table_a_b_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_104","class_path":"java.lang.String"},{"name":"date","alias":"date_105","class_path":"java.sql.Date"},{"name":"time","alias":"time_106","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a_b.table_a_b_a
table_a_b.table_a_b_a
{"sql":"SELECT `table_a_b_1001`.`id` AS `id_101`,`table_a_b_1001`.`a_id` AS `a_id_102`,`table_a_b_1001`.`name_ar` AS `name_ar_103`,`table_a_b_1001`.`name_en` AS `name_en_104`,`table_a_b_1001`.`date` AS `date_105`,`table_a_b_1001`.`time` AS `time_106`,`table_a_b_1001`.`timestamp` AS `timestamp_107`,`table_a_b_1001`.`boolean` AS `boolean_108`,`table_a_b_a_1002`.`id` AS `id_109`,`table_a_b_a_1002`.`a_b_id` AS `a_b_id_110`,`table_a_b_a_1002`.`name_ar` AS `name_ar_111`,`table_a_b_a_1002`.`name_en` AS `name_en_112`,`table_a_b_a_1002`.`date` AS `date_113`,`table_a_b_a_1002`.`time` AS `time_114`,`table_a_b_a_1002`.`timestamp` AS `timestamp_115`,`table_a_b_a_1002`.`boolean` AS `boolean_116` FROM `parental`.`table_a_b` AS `table_a_b_1001` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1002` ON `table_a_b_1001`.`id`=`table_a_b_a_1002`.`a_b_id`","table_list_path":"table_a_b.table_a_b_a","table_list":[{"name":"table_a_b","alias":"table_a_b_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_104","class_path":"java.lang.String"},{"name":"date","alias":"date_105","class_path":"java.sql.Date"},{"name":"time","alias":"time_106","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","class_path":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1002","field_list":[{"name":"id","alias":"id_109","class_path":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_110","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_111","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_112","class_path":"java.lang.String"},{"name":"date","alias":"date_113","class_path":"java.sql.Date"},{"name":"time","alias":"time_114","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_115","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_116","class_path":"java.lang.Integer"}]}],"recordset":[]}

Table [table_a_b_a][Parent Paths]
|...table_a.table_a_b.
|...table_a_b.
|...table_a.table_a_b.
|...table_a_b.
Table [table_a_b_a][All Paths]
|...table_a.table_a_b.table_a_b_a.
|...table_a_b.table_a_b_a.
|...table_a_b_a.
|...table_a.table_a_b.table_a_b_a.
|...table_a_b.table_a_b_a.
|...table_a_b_a.
Table [table_a_b_a][All Paths Inner Joined]
table_a.table_a_b.table_a_b_a
table_a.table_a_b.table_a_b_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115`,`table_a_b_a_1003`.`id` AS `id_116`,`table_a_b_a_1003`.`a_b_id` AS `a_b_id_117`,`table_a_b_a_1003`.`name_ar` AS `name_ar_118`,`table_a_b_a_1003`.`name_en` AS `name_en_119`,`table_a_b_a_1003`.`date` AS `date_120`,`table_a_b_a_1003`.`time` AS `time_121`,`table_a_b_a_1003`.`timestamp` AS `timestamp_122`,`table_a_b_a_1003`.`boolean` AS `boolean_123` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1003` ON `table_a_b_1002`.`id`=`table_a_b_a_1003`.`a_b_id`","table_list_path":"table_a.table_a_b.table_a_b_a","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1003","field_list":[{"name":"id","alias":"id_116","class_path":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_117","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_118","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_119","class_path":"java.lang.String"},{"name":"date","alias":"date_120","class_path":"java.sql.Date"},{"name":"time","alias":"time_121","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_122","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_123","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a_b.table_a_b_a
table_a_b.table_a_b_a
{"sql":"SELECT `table_a_b_1001`.`id` AS `id_101`,`table_a_b_1001`.`a_id` AS `a_id_102`,`table_a_b_1001`.`name_ar` AS `name_ar_103`,`table_a_b_1001`.`name_en` AS `name_en_104`,`table_a_b_1001`.`date` AS `date_105`,`table_a_b_1001`.`time` AS `time_106`,`table_a_b_1001`.`timestamp` AS `timestamp_107`,`table_a_b_1001`.`boolean` AS `boolean_108`,`table_a_b_a_1002`.`id` AS `id_109`,`table_a_b_a_1002`.`a_b_id` AS `a_b_id_110`,`table_a_b_a_1002`.`name_ar` AS `name_ar_111`,`table_a_b_a_1002`.`name_en` AS `name_en_112`,`table_a_b_a_1002`.`date` AS `date_113`,`table_a_b_a_1002`.`time` AS `time_114`,`table_a_b_a_1002`.`timestamp` AS `timestamp_115`,`table_a_b_a_1002`.`boolean` AS `boolean_116` FROM `parental`.`table_a_b` AS `table_a_b_1001` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1002` ON `table_a_b_1001`.`id`=`table_a_b_a_1002`.`a_b_id`","table_list_path":"table_a_b.table_a_b_a","table_list":[{"name":"table_a_b","alias":"table_a_b_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_104","class_path":"java.lang.String"},{"name":"date","alias":"date_105","class_path":"java.sql.Date"},{"name":"time","alias":"time_106","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","class_path":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1002","field_list":[{"name":"id","alias":"id_109","class_path":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_110","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_111","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_112","class_path":"java.lang.String"},{"name":"date","alias":"date_113","class_path":"java.sql.Date"},{"name":"time","alias":"time_114","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_115","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_116","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a_b_a
table_a_b_a
{"sql":"SELECT `table_a_b_a_1001`.`id` AS `id_101`,`table_a_b_a_1001`.`a_b_id` AS `a_b_id_102`,`table_a_b_a_1001`.`name_ar` AS `name_ar_103`,`table_a_b_a_1001`.`name_en` AS `name_en_104`,`table_a_b_a_1001`.`date` AS `date_105`,`table_a_b_a_1001`.`time` AS `time_106`,`table_a_b_a_1001`.`timestamp` AS `timestamp_107`,`table_a_b_a_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_b_a` AS `table_a_b_a_1001`","table_list_path":"table_a_b_a","table_list":[{"name":"table_a_b_a","alias":"table_a_b_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_102","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_104","class_path":"java.lang.String"},{"name":"date","alias":"date_105","class_path":"java.sql.Date"},{"name":"time","alias":"time_106","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a.table_a_b.table_a_b_a
table_a.table_a_b.table_a_b_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115`,`table_a_b_a_1003`.`id` AS `id_116`,`table_a_b_a_1003`.`a_b_id` AS `a_b_id_117`,`table_a_b_a_1003`.`name_ar` AS `name_ar_118`,`table_a_b_a_1003`.`name_en` AS `name_en_119`,`table_a_b_a_1003`.`date` AS `date_120`,`table_a_b_a_1003`.`time` AS `time_121`,`table_a_b_a_1003`.`timestamp` AS `timestamp_122`,`table_a_b_a_1003`.`boolean` AS `boolean_123` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1003` ON `table_a_b_1002`.`id`=`table_a_b_a_1003`.`a_b_id`","table_list_path":"table_a.table_a_b.table_a_b_a","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1003","field_list":[{"name":"id","alias":"id_116","class_path":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_117","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_118","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_119","class_path":"java.lang.String"},{"name":"date","alias":"date_120","class_path":"java.sql.Date"},{"name":"time","alias":"time_121","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_122","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_123","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a_b.table_a_b_a
table_a_b.table_a_b_a
{"sql":"SELECT `table_a_b_1001`.`id` AS `id_101`,`table_a_b_1001`.`a_id` AS `a_id_102`,`table_a_b_1001`.`name_ar` AS `name_ar_103`,`table_a_b_1001`.`name_en` AS `name_en_104`,`table_a_b_1001`.`date` AS `date_105`,`table_a_b_1001`.`time` AS `time_106`,`table_a_b_1001`.`timestamp` AS `timestamp_107`,`table_a_b_1001`.`boolean` AS `boolean_108`,`table_a_b_a_1002`.`id` AS `id_109`,`table_a_b_a_1002`.`a_b_id` AS `a_b_id_110`,`table_a_b_a_1002`.`name_ar` AS `name_ar_111`,`table_a_b_a_1002`.`name_en` AS `name_en_112`,`table_a_b_a_1002`.`date` AS `date_113`,`table_a_b_a_1002`.`time` AS `time_114`,`table_a_b_a_1002`.`timestamp` AS `timestamp_115`,`table_a_b_a_1002`.`boolean` AS `boolean_116` FROM `parental`.`table_a_b` AS `table_a_b_1001` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1002` ON `table_a_b_1001`.`id`=`table_a_b_a_1002`.`a_b_id`","table_list_path":"table_a_b.table_a_b_a","table_list":[{"name":"table_a_b","alias":"table_a_b_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_104","class_path":"java.lang.String"},{"name":"date","alias":"date_105","class_path":"java.sql.Date"},{"name":"time","alias":"time_106","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","class_path":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1002","field_list":[{"name":"id","alias":"id_109","class_path":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_110","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_111","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_112","class_path":"java.lang.String"},{"name":"date","alias":"date_113","class_path":"java.sql.Date"},{"name":"time","alias":"time_114","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_115","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_116","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a_b_a
table_a_b_a
{"sql":"SELECT `table_a_b_a_1001`.`id` AS `id_101`,`table_a_b_a_1001`.`a_b_id` AS `a_b_id_102`,`table_a_b_a_1001`.`name_ar` AS `name_ar_103`,`table_a_b_a_1001`.`name_en` AS `name_en_104`,`table_a_b_a_1001`.`date` AS `date_105`,`table_a_b_a_1001`.`time` AS `time_106`,`table_a_b_a_1001`.`timestamp` AS `timestamp_107`,`table_a_b_a_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_b_a` AS `table_a_b_a_1001`","table_list_path":"table_a_b_a","table_list":[{"name":"table_a_b_a","alias":"table_a_b_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_102","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_104","class_path":"java.lang.String"},{"name":"date","alias":"date_105","class_path":"java.sql.Date"},{"name":"time","alias":"time_106","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","class_path":"java.lang.Integer"}]}],"recordset":[]}

Table [table_a_c][Parent Paths]
|...table_a.
|...table_a.
Table [table_a_c][All Paths]
|...table_a.table_a_c.
|...table_a_c.
|...table_a.table_a_c.
|...table_a_c.
Table [table_a_c][All Paths Inner Joined]
table_a.table_a_c
table_a.table_a_c
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_c_1002`.`id` AS `id_108`,`table_a_c_1002`.`a_id` AS `a_id_109`,`table_a_c_1002`.`name_ar` AS `name_ar_110`,`table_a_c_1002`.`name_en` AS `name_en_111`,`table_a_c_1002`.`date` AS `date_112`,`table_a_c_1002`.`time` AS `time_113`,`table_a_c_1002`.`timestamp` AS `timestamp_114`,`table_a_c_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_c` AS `table_a_c_1002` ON `table_a_1001`.`id`=`table_a_c_1002`.`a_id`","table_list_path":"table_a.table_a_c","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_c","alias":"table_a_c_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a_c
table_a_c
{"sql":"SELECT `table_a_c_1001`.`id` AS `id_101`,`table_a_c_1001`.`a_id` AS `a_id_102`,`table_a_c_1001`.`name_ar` AS `name_ar_103`,`table_a_c_1001`.`name_en` AS `name_en_104`,`table_a_c_1001`.`date` AS `date_105`,`table_a_c_1001`.`time` AS `time_106`,`table_a_c_1001`.`timestamp` AS `timestamp_107`,`table_a_c_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_c` AS `table_a_c_1001`","table_list_path":"table_a_c","table_list":[{"name":"table_a_c","alias":"table_a_c_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_104","class_path":"java.lang.String"},{"name":"date","alias":"date_105","class_path":"java.sql.Date"},{"name":"time","alias":"time_106","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a.table_a_c
table_a.table_a_c
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_c_1002`.`id` AS `id_108`,`table_a_c_1002`.`a_id` AS `a_id_109`,`table_a_c_1002`.`name_ar` AS `name_ar_110`,`table_a_c_1002`.`name_en` AS `name_en_111`,`table_a_c_1002`.`date` AS `date_112`,`table_a_c_1002`.`time` AS `time_113`,`table_a_c_1002`.`timestamp` AS `timestamp_114`,`table_a_c_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_c` AS `table_a_c_1002` ON `table_a_1001`.`id`=`table_a_c_1002`.`a_id`","table_list_path":"table_a.table_a_c","table_list":[{"name":"table_a","alias":"table_a_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_103","class_path":"java.lang.String"},{"name":"date","alias":"date_104","class_path":"java.sql.Date"},{"name":"time","alias":"time_105","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","class_path":"java.lang.Integer"}]},{"name":"table_a_c","alias":"table_a_c_1002","field_list":[{"name":"id","alias":"id_108","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_111","class_path":"java.lang.String"},{"name":"date","alias":"date_112","class_path":"java.sql.Date"},{"name":"time","alias":"time_113","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","class_path":"java.lang.Integer"}]}],"recordset":[]}

table_a_c
table_a_c
{"sql":"SELECT `table_a_c_1001`.`id` AS `id_101`,`table_a_c_1001`.`a_id` AS `a_id_102`,`table_a_c_1001`.`name_ar` AS `name_ar_103`,`table_a_c_1001`.`name_en` AS `name_en_104`,`table_a_c_1001`.`date` AS `date_105`,`table_a_c_1001`.`time` AS `time_106`,`table_a_c_1001`.`timestamp` AS `timestamp_107`,`table_a_c_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_c` AS `table_a_c_1001`","table_list_path":"table_a_c","table_list":[{"name":"table_a_c","alias":"table_a_c_1001","field_list":[{"name":"id","alias":"id_101","class_path":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","class_path":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","class_path":"java.lang.String"},{"name":"name_en","alias":"name_en_104","class_path":"java.lang.String"},{"name":"date","alias":"date_105","class_path":"java.sql.Date"},{"name":"time","alias":"time_106","class_path":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","class_path":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","class_path":"java.lang.Integer"}]}],"recordset":[]}

Table [tree_model][Parent Paths]
Table [tree_model][All Paths]
|...tree_model.
|...tree_model.
Table [tree_model][All Paths Inner Joined]
tree_model
tree_model
{"sql":"SELECT `tree_model_1001`.`node_id` AS `node_id_101` FROM `parental`.`tree_model` AS `tree_model_1001`","table_list_path":"tree_model","table_list":[{"name":"tree_model","alias":"tree_model_1001","field_list":[{"name":"node_id","alias":"node_id_101","class_path":"java.lang.Integer"}]}],"recordset":[]}

tree_model
tree_model
{"sql":"SELECT `tree_model_1001`.`node_id` AS `node_id_101` FROM `parental`.`tree_model` AS `tree_model_1001`","table_list_path":"tree_model","table_list":[{"name":"tree_model","alias":"tree_model_1001","field_list":[{"name":"node_id","alias":"node_id_101","class_path":"java.lang.Integer"}]}],"recordset":[]}

{"name":"parental","database_engine":"mysql","database_url":"jdbc:mysql://localhost:33060/parental","case_sensitive_sql":true,"database_list":[{"name":"parental","engine":"mysql","table_list":[{"name":"compound_key","rows":0,"field_list":[{"name":"auto_id","data_type_name":"INT UNSIGNED","primary_key":true,"nullable":false,"auto_increment":true,"foreign_reference":false,"list_order":1,"size":10,"decimal_digits":0},{"name":"string_key","data_type_name":"VARCHAR","primary_key":false,"nullable":false,"auto_increment":false,"foreign_reference":false,"list_order":2,"size":128,"decimal_digits":0},{"name":"some_data","data_type_name":"VARCHAR","primary_key":false,"nullable":false,"auto_increment":false,"foreign_reference":false,"list_order":3,"size":256,"decimal_digits":0}],"primary_key_list":[{"name":"PRIMARY","primary_key_field_list":[{"name":"auto_id"}]}],"foreign_key_list":[],"child_table_list":[]},{"name":"fact_master","rows":0,"field_list":[{"name":"fact_master_id","data_type_name":"INT UNSIGNED","primary_key":true,"nullable":false,"auto_increment":true,"foreign_reference":false,"list_order":1,"size":10,"decimal_digits":0},{"name":"fact_master_data","data_type_name":"VARCHAR","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":2,"size":45,"decimal_digits":0}],"primary_key_list":[{"name":"PRIMARY","primary_key_field_list":[{"name":"fact_master_id"}]}],"foreign_key_list":[],"child_table_list":[{"table_name":"fact_transaction","parent_table_name":"fact_master","foreig_key_name":"fk_fact_transaction_01"},{"table_name":"fact_transaction","parent_table_name":"fact_master","foreig_key_name":"fk_fact_transaction_02"}]},{"name":"fact_transaction","rows":0,"field_list":[{"name":"fact_transaction_id","data_type_name":"INT UNSIGNED","primary_key":true,"nullable":false,"auto_increment":true,"foreign_reference":false,"list_order":1,"size":10,"decimal_digits":0},{"name":"fact_master_a_id","data_type_name":"INT UNSIGNED","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":2,"size":10,"decimal_digits":0},{"name":"fact_master_b_id","data_type_name":"INT UNSIGNED","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":3,"size":10,"decimal_digits":0},{"name":"fact_transaction_data","data_type_name":"DECIMAL","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":4,"size":18,"decimal_digits":6}],"primary_key_list":[{"name":"PRIMARY","primary_key_field_list":[{"name":"fact_transaction_id"}]}],"foreign_key_list":[{"name":"fk_fact_transaction_01","referenced_key_name":"PRIMARY","foreign_key_table_name":"fact_transaction","referenced_key_table_name":"fact_master","foreign_key_field_list":[{"name":"fact_master_id"}],"referenced_key_field_list":[{"name":"fact_master_a_id"}],"key_sequence":1,"update_rule":"1","delete_rule":"1","deferrability":"7"},{"name":"fk_fact_transaction_02","referenced_key_name":"PRIMARY","foreign_key_table_name":"fact_transaction","referenced_key_table_name":"fact_master","foreign_key_field_list":[{"name":"fact_master_id"}],"referenced_key_field_list":[{"name":"fact_master_b_id"}],"key_sequence":1,"update_rule":"1","delete_rule":"1","deferrability":"7"}],"child_table_list":[]},{"name":"table_a","rows":0,"field_list":[{"name":"id","data_type_name":"INT UNSIGNED","primary_key":true,"nullable":false,"auto_increment":true,"foreign_reference":false,"list_order":1,"size":10,"decimal_digits":0},{"name":"name_ar","data_type_name":"VARCHAR","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":2,"size":45,"decimal_digits":0},{"name":"name_en","data_type_name":"VARCHAR","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":3,"size":45,"decimal_digits":0},{"name":"date","data_type_name":"DATE","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":4,"size":10,"decimal_digits":0},{"name":"time","data_type_name":"TIME","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":5,"size":8,"decimal_digits":0},{"name":"timestamp","data_type_name":"TIMESTAMP","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":6,"size":19,"decimal_digits":0},{"name":"boolean","data_type_name":"BIT","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":7,"size":1,"decimal_digits":0}],"primary_key_list":[{"name":"PRIMARY","primary_key_field_list":[{"name":"id"}]}],"foreign_key_list":[],"child_table_list":[{"table_name":"table_a_a","parent_table_name":"table_a","foreig_key_name":"fk_table_a_a_1"},{"table_name":"table_a_b","parent_table_name":"table_a","foreig_key_name":"fk_table_a_b_1"},{"table_name":"table_a_c","parent_table_name":"table_a","foreig_key_name":"fk_table_a_c_1"}]},{"name":"table_a_a","rows":0,"field_list":[{"name":"id","data_type_name":"INT UNSIGNED","primary_key":true,"nullable":false,"auto_increment":true,"foreign_reference":true,"list_order":1,"size":10,"decimal_digits":0},{"name":"a_id","data_type_name":"INT UNSIGNED","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":2,"size":10,"decimal_digits":0},{"name":"name_ar","data_type_name":"VARCHAR","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":3,"size":45,"decimal_digits":0},{"name":"name_en","data_type_name":"VARCHAR","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":4,"size":45,"decimal_digits":0},{"name":"date","data_type_name":"DATE","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":5,"size":10,"decimal_digits":0},{"name":"time","data_type_name":"TIME","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":6,"size":8,"decimal_digits":0},{"name":"timestamp","data_type_name":"TIMESTAMP","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":7,"size":19,"decimal_digits":0},{"name":"boolean","data_type_name":"BIT","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":8,"size":1,"decimal_digits":0}],"primary_key_list":[{"name":"PRIMARY","primary_key_field_list":[{"name":"id"}]}],"foreign_key_list":[{"name":"fk_table_a_a_1","referenced_key_name":"PRIMARY","foreign_key_table_name":"table_a_a","referenced_key_table_name":"table_a","foreign_key_field_list":[{"name":"id"}],"referenced_key_field_list":[{"name":"a_id"}],"key_sequence":1,"update_rule":"1","delete_rule":"1","deferrability":"7"}],"child_table_list":[]},{"name":"table_a_b","rows":0,"field_list":[{"name":"id","data_type_name":"INT UNSIGNED","primary_key":true,"nullable":false,"auto_increment":true,"foreign_reference":true,"list_order":1,"size":10,"decimal_digits":0},{"name":"a_id","data_type_name":"INT UNSIGNED","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":2,"size":10,"decimal_digits":0},{"name":"name_ar","data_type_name":"VARCHAR","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":3,"size":45,"decimal_digits":0},{"name":"name_en","data_type_name":"VARCHAR","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":4,"size":45,"decimal_digits":0},{"name":"date","data_type_name":"DATE","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":5,"size":10,"decimal_digits":0},{"name":"time","data_type_name":"TIME","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":6,"size":8,"decimal_digits":0},{"name":"timestamp","data_type_name":"TIMESTAMP","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":7,"size":19,"decimal_digits":0},{"name":"boolean","data_type_name":"BIT","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":8,"size":1,"decimal_digits":0}],"primary_key_list":[{"name":"PRIMARY","primary_key_field_list":[{"name":"id"}]}],"foreign_key_list":[{"name":"fk_table_a_b_1","referenced_key_name":"PRIMARY","foreign_key_table_name":"table_a_b","referenced_key_table_name":"table_a","foreign_key_field_list":[{"name":"id"}],"referenced_key_field_list":[{"name":"a_id"}],"key_sequence":1,"update_rule":"1","delete_rule":"1","deferrability":"7"}],"child_table_list":[{"table_name":"table_a_b_a","parent_table_name":"table_a_b","foreig_key_name":"fk_table_a_b_a_1"}]},{"name":"table_a_b_a","rows":0,"field_list":[{"name":"id","data_type_name":"INT UNSIGNED","primary_key":true,"nullable":false,"auto_increment":true,"foreign_reference":true,"list_order":1,"size":10,"decimal_digits":0},{"name":"a_b_id","data_type_name":"INT UNSIGNED","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":2,"size":10,"decimal_digits":0},{"name":"name_ar","data_type_name":"VARCHAR","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":3,"size":45,"decimal_digits":0},{"name":"name_en","data_type_name":"VARCHAR","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":4,"size":45,"decimal_digits":0},{"name":"date","data_type_name":"DATE","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":5,"size":10,"decimal_digits":0},{"name":"time","data_type_name":"TIME","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":6,"size":8,"decimal_digits":0},{"name":"timestamp","data_type_name":"TIMESTAMP","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":7,"size":19,"decimal_digits":0},{"name":"boolean","data_type_name":"BIT","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":8,"size":1,"decimal_digits":0}],"primary_key_list":[{"name":"PRIMARY","primary_key_field_list":[{"name":"id"}]}],"foreign_key_list":[{"name":"fk_table_a_b_a_1","referenced_key_name":"PRIMARY","foreign_key_table_name":"table_a_b_a","referenced_key_table_name":"table_a_b","foreign_key_field_list":[{"name":"id"}],"referenced_key_field_list":[{"name":"a_b_id"}],"key_sequence":1,"update_rule":"1","delete_rule":"1","deferrability":"7"}],"child_table_list":[]},{"name":"table_a_c","rows":0,"field_list":[{"name":"id","data_type_name":"INT UNSIGNED","primary_key":true,"nullable":false,"auto_increment":true,"foreign_reference":true,"list_order":1,"size":10,"decimal_digits":0},{"name":"a_id","data_type_name":"INT UNSIGNED","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":2,"size":10,"decimal_digits":0},{"name":"name_ar","data_type_name":"VARCHAR","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":3,"size":45,"decimal_digits":0},{"name":"name_en","data_type_name":"VARCHAR","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":4,"size":45,"decimal_digits":0},{"name":"date","data_type_name":"DATE","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":5,"size":10,"decimal_digits":0},{"name":"time","data_type_name":"TIME","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":6,"size":8,"decimal_digits":0},{"name":"timestamp","data_type_name":"TIMESTAMP","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":7,"size":19,"decimal_digits":0},{"name":"boolean","data_type_name":"BIT","primary_key":false,"nullable":true,"auto_increment":false,"foreign_reference":false,"list_order":8,"size":1,"decimal_digits":0}],"primary_key_list":[{"name":"PRIMARY","primary_key_field_list":[{"name":"id"}]}],"foreign_key_list":[{"name":"fk_table_a_c_1","referenced_key_name":"PRIMARY","foreign_key_table_name":"table_a_c","referenced_key_table_name":"table_a","foreign_key_field_list":[{"name":"id"}],"referenced_key_field_list":[{"name":"a_id"}],"key_sequence":1,"update_rule":"1","delete_rule":"1","deferrability":"7"}],"child_table_list":[]},{"name":"tree_model","rows":0,"field_list":[{"name":"node_id","data_type_name":"INT UNSIGNED","primary_key":true,"nullable":false,"auto_increment":true,"foreign_reference":false,"list_order":1,"size":10,"decimal_digits":0}],"primary_key_list":[{"name":"PRIMARY","primary_key_field_list":[{"name":"node_id"}]}],"foreign_key_list":[],"child_table_list":[]}],"java_package_name":"net.reyadeyat.relational.api.model"}]}Model: parental
T-[Enterprise #1]
      F-[name]-"parental"
      F-[database_engine]-"mysql"
      F-[database_url]-"jdbc:mysql://localhost:33060/parental"
      F-[case_sensitive_sql]-"true"
      T-[Database #1]
            F-[name]-"parental"
            F-[engine]-"mysql"
            F-[java_package_name]-"..."
            T-[Table #1]
                  F-[name]-"compound_key"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #1]
                  T-[Field #1]
                        F-[name]-"auto_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #2]
                        F-[name]-"string_key"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"false"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"128"
                        F-[decimal_digits]-"0"
                  T-[Field #3]
                        F-[name]-"some_data"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"false"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"3"
                        F-[size]-"256"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #1]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #1]
                              F-[name]-"auto_id"
            T-[Table #2]
                  F-[name]-"fact_master"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #2]
                  T-[Field #4]
                        F-[name]-"fact_master_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #5]
                        F-[name]-"fact_master_data"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #2]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #2]
                              F-[name]-"fact_master_id"
                  T-[ChildTable #1]
                        F-[table_name]-"fact_transaction"
                        F-[parent_table_name]-"fact_master"
                        F-[foreig_key_name]-"fk_fact_transaction_01"
                  T-[ChildTable #2]
                        F-[table_name]-"fact_transaction"
                        F-[parent_table_name]-"fact_master"
                        F-[foreig_key_name]-"fk_fact_transaction_02"
            T-[Table #3]
                  F-[name]-"fact_transaction"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #3]
                  T-[Field #6]
                        F-[name]-"fact_transaction_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #7]
                        F-[name]-"fact_master_a_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #8]
                        F-[name]-"fact_master_b_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"3"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #9]
                        F-[name]-"fact_transaction_data"
                        F-[data_type_name]-"DECIMAL"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"4"
                        F-[size]-"18"
                        F-[decimal_digits]-"6"
                  T-[PrimaryKey #3]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #3]
                              F-[name]-"fact_transaction_id"
                  T-[ForeignKey #1]
                        F-[name]-"fk_fact_transaction_01"
                        F-[referenced_key_name]-"PRIMARY"
                        F-[foreign_key_table_name]-"fact_transaction"
                        F-[referenced_key_table_name]-"fact_master"
                        F-[key_sequence]-"1"
                        F-[update_rule]-"1"
                        F-[delete_rule]-"1"
                        F-[deferrability]-"7"
                        T-[ForeignKeyField #1]
                              F-[name]-"fact_master_id"
                        T-[ReferencedKeyField #1]
                              F-[name]-"fact_master_a_id"
                  T-[ForeignKey #2]
                        F-[name]-"fk_fact_transaction_02"
                        F-[referenced_key_name]-"PRIMARY"
                        F-[foreign_key_table_name]-"fact_transaction"
                        F-[referenced_key_table_name]-"fact_master"
                        F-[key_sequence]-"1"
                        F-[update_rule]-"1"
                        F-[delete_rule]-"1"
                        F-[deferrability]-"7"
                        T-[ForeignKeyField #2]
                              F-[name]-"fact_master_id"
                        T-[ReferencedKeyField #2]
                              F-[name]-"fact_master_b_id"
            T-[Table #4]
                  F-[name]-"table_a"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #4]
                  T-[Field #10]
                        F-[name]-"id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #11]
                        F-[name]-"name_ar"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #12]
                        F-[name]-"name_en"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #13]
                        F-[name]-"date"
                        F-[data_type_name]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"4"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #14]
                        F-[name]-"time"
                        F-[data_type_name]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"5"
                        F-[size]-"8"
                        F-[decimal_digits]-"0"
                  T-[Field #15]
                        F-[name]-"timestamp"
                        F-[data_type_name]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"6"
                        F-[size]-"19"
                        F-[decimal_digits]-"0"
                  T-[Field #16]
                        F-[name]-"boolean"
                        F-[data_type_name]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"7"
                        F-[size]-"1"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #4]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #4]
                              F-[name]-"id"
                  T-[ChildTable #3]
                        F-[table_name]-"table_a_a"
                        F-[parent_table_name]-"table_a"
                        F-[foreig_key_name]-"fk_table_a_a_1"
                  T-[ChildTable #4]
                        F-[table_name]-"table_a_b"
                        F-[parent_table_name]-"table_a"
                        F-[foreig_key_name]-"fk_table_a_b_1"
                  T-[ChildTable #5]
                        F-[table_name]-"table_a_c"
                        F-[parent_table_name]-"table_a"
                        F-[foreig_key_name]-"fk_table_a_c_1"
            T-[Table #5]
                  F-[name]-"table_a_a"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #5]
                  T-[Field #17]
                        F-[name]-"id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"true"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #18]
                        F-[name]-"a_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #19]
                        F-[name]-"name_ar"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #20]
                        F-[name]-"name_en"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #21]
                        F-[name]-"date"
                        F-[data_type_name]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #22]
                        F-[name]-"time"
                        F-[data_type_name]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimal_digits]-"0"
                  T-[Field #23]
                        F-[name]-"timestamp"
                        F-[data_type_name]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimal_digits]-"0"
                  T-[Field #24]
                        F-[name]-"boolean"
                        F-[data_type_name]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #5]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #5]
                              F-[name]-"id"
                  T-[ForeignKey #3]
                        F-[name]-"fk_table_a_a_1"
                        F-[referenced_key_name]-"PRIMARY"
                        F-[foreign_key_table_name]-"table_a_a"
                        F-[referenced_key_table_name]-"table_a"
                        F-[key_sequence]-"1"
                        F-[update_rule]-"1"
                        F-[delete_rule]-"1"
                        F-[deferrability]-"7"
                        T-[ForeignKeyField #3]
                              F-[name]-"id"
                        T-[ReferencedKeyField #3]
                              F-[name]-"a_id"
            T-[Table #6]
                  F-[name]-"table_a_b"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #6]
                  T-[Field #25]
                        F-[name]-"id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"true"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #26]
                        F-[name]-"a_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #27]
                        F-[name]-"name_ar"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #28]
                        F-[name]-"name_en"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #29]
                        F-[name]-"date"
                        F-[data_type_name]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #30]
                        F-[name]-"time"
                        F-[data_type_name]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimal_digits]-"0"
                  T-[Field #31]
                        F-[name]-"timestamp"
                        F-[data_type_name]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimal_digits]-"0"
                  T-[Field #32]
                        F-[name]-"boolean"
                        F-[data_type_name]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #6]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #6]
                              F-[name]-"id"
                  T-[ForeignKey #4]
                        F-[name]-"fk_table_a_b_1"
                        F-[referenced_key_name]-"PRIMARY"
                        F-[foreign_key_table_name]-"table_a_b"
                        F-[referenced_key_table_name]-"table_a"
                        F-[key_sequence]-"1"
                        F-[update_rule]-"1"
                        F-[delete_rule]-"1"
                        F-[deferrability]-"7"
                        T-[ForeignKeyField #4]
                              F-[name]-"id"
                        T-[ReferencedKeyField #4]
                              F-[name]-"a_id"
                  T-[ChildTable #6]
                        F-[table_name]-"table_a_b_a"
                        F-[parent_table_name]-"table_a_b"
                        F-[foreig_key_name]-"fk_table_a_b_a_1"
            T-[Table #7]
                  F-[name]-"table_a_b_a"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #7]
                  T-[Field #33]
                        F-[name]-"id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"true"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #34]
                        F-[name]-"a_b_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #35]
                        F-[name]-"name_ar"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #36]
                        F-[name]-"name_en"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #37]
                        F-[name]-"date"
                        F-[data_type_name]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #38]
                        F-[name]-"time"
                        F-[data_type_name]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimal_digits]-"0"
                  T-[Field #39]
                        F-[name]-"timestamp"
                        F-[data_type_name]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimal_digits]-"0"
                  T-[Field #40]
                        F-[name]-"boolean"
                        F-[data_type_name]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #7]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #7]
                              F-[name]-"id"
                  T-[ForeignKey #5]
                        F-[name]-"fk_table_a_b_a_1"
                        F-[referenced_key_name]-"PRIMARY"
                        F-[foreign_key_table_name]-"table_a_b_a"
                        F-[referenced_key_table_name]-"table_a_b"
                        F-[key_sequence]-"1"
                        F-[update_rule]-"1"
                        F-[delete_rule]-"1"
                        F-[deferrability]-"7"
                        T-[ForeignKeyField #5]
                              F-[name]-"id"
                        T-[ReferencedKeyField #5]
                              F-[name]-"a_b_id"
            T-[Table #8]
                  F-[name]-"table_a_c"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #8]
                  T-[Field #41]
                        F-[name]-"id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"true"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #42]
                        F-[name]-"a_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #43]
                        F-[name]-"name_ar"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #44]
                        F-[name]-"name_en"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #45]
                        F-[name]-"date"
                        F-[data_type_name]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #46]
                        F-[name]-"time"
                        F-[data_type_name]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimal_digits]-"0"
                  T-[Field #47]
                        F-[name]-"timestamp"
                        F-[data_type_name]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimal_digits]-"0"
                  T-[Field #48]
                        F-[name]-"boolean"
                        F-[data_type_name]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #8]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #8]
                              F-[name]-"id"
                  T-[ForeignKey #6]
                        F-[name]-"fk_table_a_c_1"
                        F-[referenced_key_name]-"PRIMARY"
                        F-[foreign_key_table_name]-"table_a_c"
                        F-[referenced_key_table_name]-"table_a"
                        F-[key_sequence]-"1"
                        F-[update_rule]-"1"
                        F-[delete_rule]-"1"
                        F-[deferrability]-"7"
                        T-[ForeignKeyField #6]
                              F-[name]-"id"
                        T-[ReferencedKeyField #6]
                              F-[name]-"a_id"
            T-[Table #9]
                  F-[name]-"tree_model"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #9]
                  T-[Field #49]
                        F-[name]-"node_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #9]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #9]
                              F-[name]-"node_id"
Add Inert Batch
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.Enterprise',1) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=1
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.ForeignKeyField',6) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=6
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.PrimaryKeyField',9) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=9
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.ForeignKey',6) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=6
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.PrimaryKey',9) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=9
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.Database',1) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=1
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.ChildTable',6) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=6
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.ReferencedKeyField',6) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=6
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.Field',49) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=49
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.Table',9) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=9
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.test.api.UserDefinedTableDataStructures',9) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=9

*sql*
INSERT INTO `model`.`enterprise`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`database_engine`,`database_url`,`case_sensitive_sql`) VALUES (500,1,1,0,'enterprise','Enterprise','{""name"":""parental"",""database_engine"":""mysql"",""database_url"":""jdbc:mysql://localhost:33060/parental"",""case_sensitive_sql"":true,""database_list"":[{""name"":""parental"",""engine"":""mysql"",""table_list"":[{""name"":""compound_key"",""rows"":0,""field_list"":[{""name"":""auto_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""string_key"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":false,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":128,""decimal_digits"":0},{""name"":""some_data"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":false,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":256,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""auto_id""}]}],""foreign_key_list"":[],""child_table_list"":[]},{""name"":""fact_master"",""rows"":0,""field_list"":[{""name"":""fact_master_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""fact_master_data"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_master_id""}]}],""foreign_key_list"":[],""child_table_list"":[{""table_name"":""fact_transaction"",""parent_table_name"":""fact_master"",""foreig_key_name"":""fk_fact_transaction_01""},{""table_name"":""fact_transaction"",""parent_table_name"":""fact_master"",""foreig_key_name"":""fk_fact_transaction_02""}]},{""name"":""fact_transaction"",""rows"":0,""field_list"":[{""name"":""fact_transaction_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""fact_master_a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""fact_master_b_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":10,""decimal_digits"":0},{""name"":""fact_transaction_data"",""data_type_name"":""DECIMAL"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":18,""decimal_digits"":6}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_transaction_id""}]}],""foreign_key_list"":[{""name"":""fk_fact_transaction_01"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""fact_transaction"",""referenced_key_table_name"":""fact_master"",""foreign_key_field_list"":[{""name"":""fact_master_id""}],""referenced_key_field_list"":[{""name"":""fact_master_a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""},{""name"":""fk_fact_transaction_02"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""fact_transaction"",""referenced_key_table_name"":""fact_master"",""foreign_key_field_list"":[{""name"":""fact_master_id""}],""referenced_key_field_list"":[{""name"":""fact_master_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[]},{""name"":""table_a"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[],""child_table_list"":[{""table_name"":""table_a_a"",""parent_table_name"":""table_a"",""foreig_key_name"":""fk_table_a_a_1""},{""table_name"":""table_a_b"",""parent_table_name"":""table_a"",""foreig_key_name"":""fk_table_a_b_1""},{""table_name"":""table_a_c"",""parent_table_name"":""table_a"",""foreig_key_name"":""fk_table_a_c_1""}]},{""name"":""table_a_a"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[{""name"":""fk_table_a_a_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_a"",""referenced_key_table_name"":""table_a"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[]},{""name"":""table_a_b"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[{""name"":""fk_table_a_b_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_b"",""referenced_key_table_name"":""table_a"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[{""table_name"":""table_a_b_a"",""parent_table_name"":""table_a_b"",""foreig_key_name"":""fk_table_a_b_a_1""}]},{""name"":""table_a_b_a"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""a_b_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[{""name"":""fk_table_a_b_a_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_b_a"",""referenced_key_table_name"":""table_a_b"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[]},{""name"":""table_a_c"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[{""name"":""fk_table_a_c_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_c"",""referenced_key_table_name"":""table_a"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[]},{""name"":""tree_model"",""rows"":0,""field_list"":[{""name"":""node_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""node_id""}]}],""foreign_key_list"":[],""child_table_list"":[]}],""java_package_name"":""net.reyadeyat.relational.api.model""}]}',"parental","mysql","jdbc:mysql://localhost:33060/parental",true)

*sql*
INSERT INTO `model`.`database_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`engine`,`java_package_name`) VALUES (500,1,1,1,'database_list','Database','{""name"":""parental"",""engine"":""mysql"",""table_list"":[{""name"":""compound_key"",""rows"":0,""field_list"":[{""name"":""auto_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""string_key"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":false,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":128,""decimal_digits"":0},{""name"":""some_data"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":false,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":256,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""auto_id""}]}],""foreign_key_list"":[],""child_table_list"":[]},{""name"":""fact_master"",""rows"":0,""field_list"":[{""name"":""fact_master_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""fact_master_data"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_master_id""}]}],""foreign_key_list"":[],""child_table_list"":[{""table_name"":""fact_transaction"",""parent_table_name"":""fact_master"",""foreig_key_name"":""fk_fact_transaction_01""},{""table_name"":""fact_transaction"",""parent_table_name"":""fact_master"",""foreig_key_name"":""fk_fact_transaction_02""}]},{""name"":""fact_transaction"",""rows"":0,""field_list"":[{""name"":""fact_transaction_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""fact_master_a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""fact_master_b_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":10,""decimal_digits"":0},{""name"":""fact_transaction_data"",""data_type_name"":""DECIMAL"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":18,""decimal_digits"":6}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_transaction_id""}]}],""foreign_key_list"":[{""name"":""fk_fact_transaction_01"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""fact_transaction"",""referenced_key_table_name"":""fact_master"",""foreign_key_field_list"":[{""name"":""fact_master_id""}],""referenced_key_field_list"":[{""name"":""fact_master_a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""},{""name"":""fk_fact_transaction_02"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""fact_transaction"",""referenced_key_table_name"":""fact_master"",""foreign_key_field_list"":[{""name"":""fact_master_id""}],""referenced_key_field_list"":[{""name"":""fact_master_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[]},{""name"":""table_a"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[],""child_table_list"":[{""table_name"":""table_a_a"",""parent_table_name"":""table_a"",""foreig_key_name"":""fk_table_a_a_1""},{""table_name"":""table_a_b"",""parent_table_name"":""table_a"",""foreig_key_name"":""fk_table_a_b_1""},{""table_name"":""table_a_c"",""parent_table_name"":""table_a"",""foreig_key_name"":""fk_table_a_c_1""}]},{""name"":""table_a_a"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[{""name"":""fk_table_a_a_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_a"",""referenced_key_table_name"":""table_a"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[]},{""name"":""table_a_b"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[{""name"":""fk_table_a_b_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_b"",""referenced_key_table_name"":""table_a"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[{""table_name"":""table_a_b_a"",""parent_table_name"":""table_a_b"",""foreig_key_name"":""fk_table_a_b_a_1""}]},{""name"":""table_a_b_a"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""a_b_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[{""name"":""fk_table_a_b_a_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_b_a"",""referenced_key_table_name"":""table_a_b"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[]},{""name"":""table_a_c"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[{""name"":""fk_table_a_c_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_c"",""referenced_key_table_name"":""table_a"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[]},{""name"":""tree_model"",""rows"":0,""field_list"":[{""name"":""node_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""node_id""}]}],""foreign_key_list"":[],""child_table_list"":[]}],""java_package_name"":""net.reyadeyat.relational.api.model""}',"parental","mysql","net.reyadeyat.relational.api.model")

*sql*
INSERT INTO `model`.`table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`) VALUES (500,1,1,1,'table_list','Table','{""name"":""compound_key"",""rows"":0,""field_list"":[{""name"":""auto_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""string_key"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":false,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":128,""decimal_digits"":0},{""name"":""some_data"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":false,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":256,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""auto_id""}]}],""foreign_key_list"":[],""child_table_list"":[]}',"compound_key",0)

*sql*
INSERT INTO `model`.`table_data_structures`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,1,1,'table_data_structures','UserDefinedTableDataStructures','{}',"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}
","export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}
","	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"node_id\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"update\",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: \"\",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: \"\",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === \"insert_tree_model\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_tree_model\") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_tree_model\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_tree_model\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.tree_model.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"tree_model_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"tree_model_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"node_id\" matInput type=\"number\"
					placeholder=\"{{i18.tree_model.node_id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }\" />
				<div *ngIf=\"isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('tree_model_group.node_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf=\"selected_tree_model_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.first_record}}\" [disabled]=\"cursor == 0\" (click)=\"firstRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.first }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.previous_record}}\" [disabled]=\"cursor == 0\" (click)=\"previousRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.previous }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"lastRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
	<button class=\"pushable-blue\" (click)=\"submitForm()\">
		<span class=\"front-blue\" [dir]=\"direction\">
			{{ i18.submit }}
		</span>
	</button>
	<button class=\"pushable-red\" (click)=\"resetForm()\">
		<span class=\"front-red\" [dir]=\"direction\">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf=\"show_confirmation==true\" (onConfirmationAcknowledged)=\"confirmationAcknowledged($event)\"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------

","

----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		\"node_id\"


		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"tree_model_table_data_source\" [dir]=\"direction\">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(tree_model_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(tree_model_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"tree_model_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let tree_model_record; columns: tree_model_table_columns\"></mat-row>
</mat-table>
------------------ tree_model MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"node_id\"
  ],
  \"where\": {
    \"clause\": \"node_id>?\",
    \"values\": [
      \"INT UNSIGNED\"
    ]
  },
  \"orderby\": []
}

{
  \"transaction\": \"update\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  }
}

","package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"mailto:AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
@WebServlet(\"/tree_model\")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Tree Model\", \"parental\", \"parental\", \"tree_model\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"node_id\", FieldType.Integer, false, false, \"node_id\").setPrimaryKeyAI();
        
        
    }
}","/tree_model")

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,1,1,'field_list','Field','{""name"":""auto_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0}',"auto_id",33,true,false,true,false,null,1,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,2,1,'field_list','Field','{""name"":""string_key"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":false,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":128,""decimal_digits"":0}',"string_key",18,false,false,false,false,null,2,128,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,3,1,'field_list','Field','{""name"":""some_data"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":false,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":256,""decimal_digits"":0}',"some_data",18,false,false,false,false,null,3,256,0)

*sql*
INSERT INTO `model`.`primary_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,1,1,'primary_key_list','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""auto_id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primary_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,1,1,'primary_key_field_list','PrimaryKeyField','{""name"":""auto_id""}',"auto_id")

*sql*
INSERT INTO `model`.`table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`) VALUES (500,1,2,1,'table_list','Table','{""name"":""fact_master"",""rows"":0,""field_list"":[{""name"":""fact_master_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""fact_master_data"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_master_id""}]}],""foreign_key_list"":[],""child_table_list"":[{""table_name"":""fact_transaction"",""parent_table_name"":""fact_master"",""foreig_key_name"":""fk_fact_transaction_01""},{""table_name"":""fact_transaction"",""parent_table_name"":""fact_master"",""foreig_key_name"":""fk_fact_transaction_02""}]}',"fact_master",0)

*sql*
INSERT INTO `model`.`table_data_structures`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,2,2,'table_data_structures','UserDefinedTableDataStructures','{}',"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}
","export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}
","	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"node_id\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"update\",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: \"\",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: \"\",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === \"insert_tree_model\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_tree_model\") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_tree_model\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_tree_model\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.tree_model.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"tree_model_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"tree_model_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"node_id\" matInput type=\"number\"
					placeholder=\"{{i18.tree_model.node_id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }\" />
				<div *ngIf=\"isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('tree_model_group.node_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf=\"selected_tree_model_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.first_record}}\" [disabled]=\"cursor == 0\" (click)=\"firstRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.first }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.previous_record}}\" [disabled]=\"cursor == 0\" (click)=\"previousRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.previous }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"lastRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
	<button class=\"pushable-blue\" (click)=\"submitForm()\">
		<span class=\"front-blue\" [dir]=\"direction\">
			{{ i18.submit }}
		</span>
	</button>
	<button class=\"pushable-red\" (click)=\"resetForm()\">
		<span class=\"front-red\" [dir]=\"direction\">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf=\"show_confirmation==true\" (onConfirmationAcknowledged)=\"confirmationAcknowledged($event)\"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------

","

----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		\"node_id\"


		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"tree_model_table_data_source\" [dir]=\"direction\">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(tree_model_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(tree_model_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"tree_model_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let tree_model_record; columns: tree_model_table_columns\"></mat-row>
</mat-table>
------------------ tree_model MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"node_id\"
  ],
  \"where\": {
    \"clause\": \"node_id>?\",
    \"values\": [
      \"INT UNSIGNED\"
    ]
  },
  \"orderby\": []
}

{
  \"transaction\": \"update\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  }
}

","package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"mailto:AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
@WebServlet(\"/tree_model\")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Tree Model\", \"parental\", \"parental\", \"tree_model\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"node_id\", FieldType.Integer, false, false, \"node_id\").setPrimaryKeyAI();
        
        
    }
}","/tree_model")

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,4,2,'field_list','Field','{""name"":""fact_master_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0}',"fact_master_id",33,true,false,true,false,null,1,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,5,2,'field_list','Field','{""name"":""fact_master_data"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimal_digits"":0}',"fact_master_data",18,false,true,false,false,null,2,45,0)

*sql*
INSERT INTO `model`.`primary_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,2,2,'primary_key_list','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_master_id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primary_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,2,2,'primary_key_field_list','PrimaryKeyField','{""name"":""fact_master_id""}',"fact_master_id")

*sql*
INSERT INTO `model`.`child_table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`table_name`,`parent_table_name`,`foreig_key_name`) VALUES (500,1,1,2,'child_table_list','ChildTable','{""table_name"":""fact_transaction"",""parent_table_name"":""fact_master"",""foreig_key_name"":""fk_fact_transaction_01""}',"fact_transaction","fact_master","fk_fact_transaction_01")

*sql*
INSERT INTO `model`.`child_table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`table_name`,`parent_table_name`,`foreig_key_name`) VALUES (500,1,2,2,'child_table_list','ChildTable','{""table_name"":""fact_transaction"",""parent_table_name"":""fact_master"",""foreig_key_name"":""fk_fact_transaction_02""}',"fact_transaction","fact_master","fk_fact_transaction_02")

*sql*
INSERT INTO `model`.`table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`) VALUES (500,1,3,1,'table_list','Table','{""name"":""fact_transaction"",""rows"":0,""field_list"":[{""name"":""fact_transaction_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""fact_master_a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""fact_master_b_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":10,""decimal_digits"":0},{""name"":""fact_transaction_data"",""data_type_name"":""DECIMAL"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":18,""decimal_digits"":6}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_transaction_id""}]}],""foreign_key_list"":[{""name"":""fk_fact_transaction_01"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""fact_transaction"",""referenced_key_table_name"":""fact_master"",""foreign_key_field_list"":[{""name"":""fact_master_id""}],""referenced_key_field_list"":[{""name"":""fact_master_a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""},{""name"":""fk_fact_transaction_02"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""fact_transaction"",""referenced_key_table_name"":""fact_master"",""foreign_key_field_list"":[{""name"":""fact_master_id""}],""referenced_key_field_list"":[{""name"":""fact_master_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[]}',"fact_transaction",0)

*sql*
INSERT INTO `model`.`table_data_structures`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,3,3,'table_data_structures','UserDefinedTableDataStructures','{}',"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}
","export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}
","	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"node_id\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"update\",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: \"\",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: \"\",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === \"insert_tree_model\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_tree_model\") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_tree_model\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_tree_model\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.tree_model.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"tree_model_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"tree_model_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"node_id\" matInput type=\"number\"
					placeholder=\"{{i18.tree_model.node_id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }\" />
				<div *ngIf=\"isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('tree_model_group.node_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf=\"selected_tree_model_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.first_record}}\" [disabled]=\"cursor == 0\" (click)=\"firstRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.first }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.previous_record}}\" [disabled]=\"cursor == 0\" (click)=\"previousRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.previous }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"lastRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
	<button class=\"pushable-blue\" (click)=\"submitForm()\">
		<span class=\"front-blue\" [dir]=\"direction\">
			{{ i18.submit }}
		</span>
	</button>
	<button class=\"pushable-red\" (click)=\"resetForm()\">
		<span class=\"front-red\" [dir]=\"direction\">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf=\"show_confirmation==true\" (onConfirmationAcknowledged)=\"confirmationAcknowledged($event)\"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------

","

----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		\"node_id\"


		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"tree_model_table_data_source\" [dir]=\"direction\">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(tree_model_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(tree_model_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"tree_model_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let tree_model_record; columns: tree_model_table_columns\"></mat-row>
</mat-table>
------------------ tree_model MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"node_id\"
  ],
  \"where\": {
    \"clause\": \"node_id>?\",
    \"values\": [
      \"INT UNSIGNED\"
    ]
  },
  \"orderby\": []
}

{
  \"transaction\": \"update\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  }
}

","package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"mailto:AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
@WebServlet(\"/tree_model\")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Tree Model\", \"parental\", \"parental\", \"tree_model\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"node_id\", FieldType.Integer, false, false, \"node_id\").setPrimaryKeyAI();
        
        
    }
}","/tree_model")

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,6,3,'field_list','Field','{""name"":""fact_transaction_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0}',"fact_transaction_id",33,true,false,true,false,null,1,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,7,3,'field_list','Field','{""name"":""fact_master_a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0}',"fact_master_a_id",33,false,true,false,false,null,2,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,8,3,'field_list','Field','{""name"":""fact_master_b_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":10,""decimal_digits"":0}',"fact_master_b_id",33,false,true,false,false,null,3,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,9,3,'field_list','Field','{""name"":""fact_transaction_data"",""data_type_name"":""DECIMAL"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":18,""decimal_digits"":6}',"fact_transaction_data",9,false,true,false,false,null,4,18,6)

*sql*
INSERT INTO `model`.`primary_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,3,3,'primary_key_list','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_transaction_id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primary_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,3,3,'primary_key_field_list','PrimaryKeyField','{""name"":""fact_transaction_id""}',"fact_transaction_id")

*sql*
INSERT INTO `model`.`foreign_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`referenced_key_name`,`foreign_key_table_name`,`referenced_key_table_name`,`key_sequence`,`update_rule`,`delete_rule`,`deferrability`) VALUES (500,1,1,3,'foreign_key_list','ForeignKey','{""name"":""fk_fact_transaction_01"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""fact_transaction"",""referenced_key_table_name"":""fact_master"",""foreign_key_field_list"":[{""name"":""fact_master_id""}],""referenced_key_field_list"":[{""name"":""fact_master_a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}',"fk_fact_transaction_01","PRIMARY","fact_transaction","fact_master",1,"1","1","7")

*sql*
INSERT INTO `model`.`foreign_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,1,1,'foreign_key_field_list','ForeignKeyField','{""name"":""fact_master_id""}',"fact_master_id")

*sql*
INSERT INTO `model`.`referenced_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,1,1,'referenced_key_field_list','ReferencedKeyField','{""name"":""fact_master_a_id""}',"fact_master_a_id")

*sql*
INSERT INTO `model`.`foreign_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`referenced_key_name`,`foreign_key_table_name`,`referenced_key_table_name`,`key_sequence`,`update_rule`,`delete_rule`,`deferrability`) VALUES (500,1,2,3,'foreign_key_list','ForeignKey','{""name"":""fk_fact_transaction_02"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""fact_transaction"",""referenced_key_table_name"":""fact_master"",""foreign_key_field_list"":[{""name"":""fact_master_id""}],""referenced_key_field_list"":[{""name"":""fact_master_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}',"fk_fact_transaction_02","PRIMARY","fact_transaction","fact_master",1,"1","1","7")

*sql*
INSERT INTO `model`.`foreign_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,2,2,'foreign_key_field_list','ForeignKeyField','{""name"":""fact_master_id""}',"fact_master_id")

*sql*
INSERT INTO `model`.`referenced_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,2,2,'referenced_key_field_list','ReferencedKeyField','{""name"":""fact_master_b_id""}',"fact_master_b_id")

*sql*
INSERT INTO `model`.`table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`) VALUES (500,1,4,1,'table_list','Table','{""name"":""table_a"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[],""child_table_list"":[{""table_name"":""table_a_a"",""parent_table_name"":""table_a"",""foreig_key_name"":""fk_table_a_a_1""},{""table_name"":""table_a_b"",""parent_table_name"":""table_a"",""foreig_key_name"":""fk_table_a_b_1""},{""table_name"":""table_a_c"",""parent_table_name"":""table_a"",""foreig_key_name"":""fk_table_a_c_1""}]}',"table_a",0)

*sql*
INSERT INTO `model`.`table_data_structures`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,4,4,'table_data_structures','UserDefinedTableDataStructures','{}',"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}
","export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}
","	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"node_id\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"update\",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: \"\",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: \"\",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === \"insert_tree_model\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_tree_model\") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_tree_model\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_tree_model\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.tree_model.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"tree_model_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"tree_model_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"node_id\" matInput type=\"number\"
					placeholder=\"{{i18.tree_model.node_id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }\" />
				<div *ngIf=\"isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('tree_model_group.node_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf=\"selected_tree_model_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.first_record}}\" [disabled]=\"cursor == 0\" (click)=\"firstRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.first }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.previous_record}}\" [disabled]=\"cursor == 0\" (click)=\"previousRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.previous }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"lastRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
	<button class=\"pushable-blue\" (click)=\"submitForm()\">
		<span class=\"front-blue\" [dir]=\"direction\">
			{{ i18.submit }}
		</span>
	</button>
	<button class=\"pushable-red\" (click)=\"resetForm()\">
		<span class=\"front-red\" [dir]=\"direction\">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf=\"show_confirmation==true\" (onConfirmationAcknowledged)=\"confirmationAcknowledged($event)\"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------

","

----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		\"node_id\"


		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"tree_model_table_data_source\" [dir]=\"direction\">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(tree_model_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(tree_model_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"tree_model_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let tree_model_record; columns: tree_model_table_columns\"></mat-row>
</mat-table>
------------------ tree_model MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"node_id\"
  ],
  \"where\": {
    \"clause\": \"node_id>?\",
    \"values\": [
      \"INT UNSIGNED\"
    ]
  },
  \"orderby\": []
}

{
  \"transaction\": \"update\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  }
}

","package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"mailto:AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
@WebServlet(\"/tree_model\")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Tree Model\", \"parental\", \"parental\", \"tree_model\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"node_id\", FieldType.Integer, false, false, \"node_id\").setPrimaryKeyAI();
        
        
    }
}","/tree_model")

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,10,4,'field_list','Field','{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0}',"id",33,true,false,true,false,null,1,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,11,4,'field_list','Field','{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimal_digits"":0}',"name_ar",18,false,true,false,false,null,2,45,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,12,4,'field_list','Field','{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0}',"name_en",18,false,true,false,false,null,3,45,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,13,4,'field_list','Field','{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":10,""decimal_digits"":0}',"date",12,false,true,false,false,null,4,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,14,4,'field_list','Field','{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":8,""decimal_digits"":0}',"time",13,false,true,false,false,null,5,8,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,15,4,'field_list','Field','{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":19,""decimal_digits"":0}',"timestamp",15,false,true,false,false,null,6,19,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,16,4,'field_list','Field','{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":1,""decimal_digits"":0}',"boolean",10,false,true,false,false,null,7,1,0)

*sql*
INSERT INTO `model`.`primary_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,4,4,'primary_key_list','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primary_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,4,4,'primary_key_field_list','PrimaryKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`child_table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`table_name`,`parent_table_name`,`foreig_key_name`) VALUES (500,1,3,4,'child_table_list','ChildTable','{""table_name"":""table_a_a"",""parent_table_name"":""table_a"",""foreig_key_name"":""fk_table_a_a_1""}',"table_a_a","table_a","fk_table_a_a_1")

*sql*
INSERT INTO `model`.`child_table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`table_name`,`parent_table_name`,`foreig_key_name`) VALUES (500,1,4,4,'child_table_list','ChildTable','{""table_name"":""table_a_b"",""parent_table_name"":""table_a"",""foreig_key_name"":""fk_table_a_b_1""}',"table_a_b","table_a","fk_table_a_b_1")

*sql*
INSERT INTO `model`.`child_table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`table_name`,`parent_table_name`,`foreig_key_name`) VALUES (500,1,5,4,'child_table_list','ChildTable','{""table_name"":""table_a_c"",""parent_table_name"":""table_a"",""foreig_key_name"":""fk_table_a_c_1""}',"table_a_c","table_a","fk_table_a_c_1")

*sql*
INSERT INTO `model`.`table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`) VALUES (500,1,5,1,'table_list','Table','{""name"":""table_a_a"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[{""name"":""fk_table_a_a_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_a"",""referenced_key_table_name"":""table_a"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[]}',"table_a_a",0)

*sql*
INSERT INTO `model`.`table_data_structures`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,5,5,'table_data_structures','UserDefinedTableDataStructures','{}',"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}
","export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}
","	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"node_id\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"update\",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: \"\",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: \"\",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === \"insert_tree_model\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_tree_model\") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_tree_model\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_tree_model\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.tree_model.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"tree_model_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"tree_model_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"node_id\" matInput type=\"number\"
					placeholder=\"{{i18.tree_model.node_id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }\" />
				<div *ngIf=\"isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('tree_model_group.node_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf=\"selected_tree_model_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.first_record}}\" [disabled]=\"cursor == 0\" (click)=\"firstRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.first }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.previous_record}}\" [disabled]=\"cursor == 0\" (click)=\"previousRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.previous }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"lastRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
	<button class=\"pushable-blue\" (click)=\"submitForm()\">
		<span class=\"front-blue\" [dir]=\"direction\">
			{{ i18.submit }}
		</span>
	</button>
	<button class=\"pushable-red\" (click)=\"resetForm()\">
		<span class=\"front-red\" [dir]=\"direction\">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf=\"show_confirmation==true\" (onConfirmationAcknowledged)=\"confirmationAcknowledged($event)\"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------

","

----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		\"node_id\"


		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"tree_model_table_data_source\" [dir]=\"direction\">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(tree_model_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(tree_model_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"tree_model_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let tree_model_record; columns: tree_model_table_columns\"></mat-row>
</mat-table>
------------------ tree_model MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"node_id\"
  ],
  \"where\": {
    \"clause\": \"node_id>?\",
    \"values\": [
      \"INT UNSIGNED\"
    ]
  },
  \"orderby\": []
}

{
  \"transaction\": \"update\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  }
}

","package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"mailto:AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
@WebServlet(\"/tree_model\")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Tree Model\", \"parental\", \"parental\", \"tree_model\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"node_id\", FieldType.Integer, false, false, \"node_id\").setPrimaryKeyAI();
        
        
    }
}","/tree_model")

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,17,5,'field_list','Field','{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0}',"id",33,true,false,true,true,null,1,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,18,5,'field_list','Field','{""name"":""a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0}',"a_id",33,false,true,false,false,null,2,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,19,5,'field_list','Field','{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0}',"name_ar",18,false,true,false,false,null,3,45,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,20,5,'field_list','Field','{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0}',"name_en",18,false,true,false,false,null,4,45,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,21,5,'field_list','Field','{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0}',"date",12,false,true,false,false,null,5,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,22,5,'field_list','Field','{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0}',"time",13,false,true,false,false,null,6,8,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,23,5,'field_list','Field','{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0}',"timestamp",15,false,true,false,false,null,7,19,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,24,5,'field_list','Field','{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}',"boolean",10,false,true,false,false,null,8,1,0)

*sql*
INSERT INTO `model`.`primary_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,5,5,'primary_key_list','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primary_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,5,5,'primary_key_field_list','PrimaryKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`foreign_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`referenced_key_name`,`foreign_key_table_name`,`referenced_key_table_name`,`key_sequence`,`update_rule`,`delete_rule`,`deferrability`) VALUES (500,1,3,5,'foreign_key_list','ForeignKey','{""name"":""fk_table_a_a_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_a"",""referenced_key_table_name"":""table_a"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}',"fk_table_a_a_1","PRIMARY","table_a_a","table_a",1,"1","1","7")

*sql*
INSERT INTO `model`.`foreign_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,3,3,'foreign_key_field_list','ForeignKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`referenced_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,3,3,'referenced_key_field_list','ReferencedKeyField','{""name"":""a_id""}',"a_id")

*sql*
INSERT INTO `model`.`table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`) VALUES (500,1,6,1,'table_list','Table','{""name"":""table_a_b"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[{""name"":""fk_table_a_b_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_b"",""referenced_key_table_name"":""table_a"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[{""table_name"":""table_a_b_a"",""parent_table_name"":""table_a_b"",""foreig_key_name"":""fk_table_a_b_a_1""}]}',"table_a_b",0)

*sql*
INSERT INTO `model`.`table_data_structures`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,6,6,'table_data_structures','UserDefinedTableDataStructures','{}',"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}
","export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}
","	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"node_id\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"update\",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: \"\",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: \"\",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === \"insert_tree_model\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_tree_model\") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_tree_model\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_tree_model\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.tree_model.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"tree_model_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"tree_model_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"node_id\" matInput type=\"number\"
					placeholder=\"{{i18.tree_model.node_id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }\" />
				<div *ngIf=\"isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('tree_model_group.node_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf=\"selected_tree_model_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.first_record}}\" [disabled]=\"cursor == 0\" (click)=\"firstRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.first }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.previous_record}}\" [disabled]=\"cursor == 0\" (click)=\"previousRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.previous }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"lastRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
	<button class=\"pushable-blue\" (click)=\"submitForm()\">
		<span class=\"front-blue\" [dir]=\"direction\">
			{{ i18.submit }}
		</span>
	</button>
	<button class=\"pushable-red\" (click)=\"resetForm()\">
		<span class=\"front-red\" [dir]=\"direction\">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf=\"show_confirmation==true\" (onConfirmationAcknowledged)=\"confirmationAcknowledged($event)\"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------

","

----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		\"node_id\"


		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"tree_model_table_data_source\" [dir]=\"direction\">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(tree_model_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(tree_model_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"tree_model_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let tree_model_record; columns: tree_model_table_columns\"></mat-row>
</mat-table>
------------------ tree_model MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"node_id\"
  ],
  \"where\": {
    \"clause\": \"node_id>?\",
    \"values\": [
      \"INT UNSIGNED\"
    ]
  },
  \"orderby\": []
}

{
  \"transaction\": \"update\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  }
}

","package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"mailto:AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
@WebServlet(\"/tree_model\")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Tree Model\", \"parental\", \"parental\", \"tree_model\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"node_id\", FieldType.Integer, false, false, \"node_id\").setPrimaryKeyAI();
        
        
    }
}","/tree_model")

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,25,6,'field_list','Field','{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0}',"id",33,true,false,true,true,null,1,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,26,6,'field_list','Field','{""name"":""a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0}',"a_id",33,false,true,false,false,null,2,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,27,6,'field_list','Field','{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0}',"name_ar",18,false,true,false,false,null,3,45,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,28,6,'field_list','Field','{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0}',"name_en",18,false,true,false,false,null,4,45,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,29,6,'field_list','Field','{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0}',"date",12,false,true,false,false,null,5,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,30,6,'field_list','Field','{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0}',"time",13,false,true,false,false,null,6,8,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,31,6,'field_list','Field','{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0}',"timestamp",15,false,true,false,false,null,7,19,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,32,6,'field_list','Field','{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}',"boolean",10,false,true,false,false,null,8,1,0)

*sql*
INSERT INTO `model`.`primary_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,6,6,'primary_key_list','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primary_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,6,6,'primary_key_field_list','PrimaryKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`foreign_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`referenced_key_name`,`foreign_key_table_name`,`referenced_key_table_name`,`key_sequence`,`update_rule`,`delete_rule`,`deferrability`) VALUES (500,1,4,6,'foreign_key_list','ForeignKey','{""name"":""fk_table_a_b_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_b"",""referenced_key_table_name"":""table_a"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}',"fk_table_a_b_1","PRIMARY","table_a_b","table_a",1,"1","1","7")

*sql*
INSERT INTO `model`.`foreign_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,4,4,'foreign_key_field_list','ForeignKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`referenced_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,4,4,'referenced_key_field_list','ReferencedKeyField','{""name"":""a_id""}',"a_id")

*sql*
INSERT INTO `model`.`child_table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`table_name`,`parent_table_name`,`foreig_key_name`) VALUES (500,1,6,6,'child_table_list','ChildTable','{""table_name"":""table_a_b_a"",""parent_table_name"":""table_a_b"",""foreig_key_name"":""fk_table_a_b_a_1""}',"table_a_b_a","table_a_b","fk_table_a_b_a_1")

*sql*
INSERT INTO `model`.`table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`) VALUES (500,1,7,1,'table_list','Table','{""name"":""table_a_b_a"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""a_b_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[{""name"":""fk_table_a_b_a_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_b_a"",""referenced_key_table_name"":""table_a_b"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[]}',"table_a_b_a",0)

*sql*
INSERT INTO `model`.`table_data_structures`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,7,7,'table_data_structures','UserDefinedTableDataStructures','{}',"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}
","export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}
","	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"node_id\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"update\",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: \"\",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: \"\",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === \"insert_tree_model\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_tree_model\") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_tree_model\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_tree_model\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.tree_model.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"tree_model_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"tree_model_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"node_id\" matInput type=\"number\"
					placeholder=\"{{i18.tree_model.node_id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }\" />
				<div *ngIf=\"isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('tree_model_group.node_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf=\"selected_tree_model_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.first_record}}\" [disabled]=\"cursor == 0\" (click)=\"firstRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.first }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.previous_record}}\" [disabled]=\"cursor == 0\" (click)=\"previousRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.previous }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"lastRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
	<button class=\"pushable-blue\" (click)=\"submitForm()\">
		<span class=\"front-blue\" [dir]=\"direction\">
			{{ i18.submit }}
		</span>
	</button>
	<button class=\"pushable-red\" (click)=\"resetForm()\">
		<span class=\"front-red\" [dir]=\"direction\">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf=\"show_confirmation==true\" (onConfirmationAcknowledged)=\"confirmationAcknowledged($event)\"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------

","

----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		\"node_id\"


		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"tree_model_table_data_source\" [dir]=\"direction\">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(tree_model_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(tree_model_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"tree_model_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let tree_model_record; columns: tree_model_table_columns\"></mat-row>
</mat-table>
------------------ tree_model MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"node_id\"
  ],
  \"where\": {
    \"clause\": \"node_id>?\",
    \"values\": [
      \"INT UNSIGNED\"
    ]
  },
  \"orderby\": []
}

{
  \"transaction\": \"update\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  }
}

","package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"mailto:AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
@WebServlet(\"/tree_model\")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Tree Model\", \"parental\", \"parental\", \"tree_model\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"node_id\", FieldType.Integer, false, false, \"node_id\").setPrimaryKeyAI();
        
        
    }
}","/tree_model")

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,33,7,'field_list','Field','{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0}',"id",33,true,false,true,true,null,1,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,34,7,'field_list','Field','{""name"":""a_b_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0}',"a_b_id",33,false,true,false,false,null,2,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,35,7,'field_list','Field','{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0}',"name_ar",18,false,true,false,false,null,3,45,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,36,7,'field_list','Field','{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0}',"name_en",18,false,true,false,false,null,4,45,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,37,7,'field_list','Field','{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0}',"date",12,false,true,false,false,null,5,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,38,7,'field_list','Field','{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0}',"time",13,false,true,false,false,null,6,8,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,39,7,'field_list','Field','{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0}',"timestamp",15,false,true,false,false,null,7,19,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,40,7,'field_list','Field','{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}',"boolean",10,false,true,false,false,null,8,1,0)

*sql*
INSERT INTO `model`.`primary_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,7,7,'primary_key_list','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primary_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,7,7,'primary_key_field_list','PrimaryKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`foreign_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`referenced_key_name`,`foreign_key_table_name`,`referenced_key_table_name`,`key_sequence`,`update_rule`,`delete_rule`,`deferrability`) VALUES (500,1,5,7,'foreign_key_list','ForeignKey','{""name"":""fk_table_a_b_a_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_b_a"",""referenced_key_table_name"":""table_a_b"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}',"fk_table_a_b_a_1","PRIMARY","table_a_b_a","table_a_b",1,"1","1","7")

*sql*
INSERT INTO `model`.`foreign_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,5,5,'foreign_key_field_list','ForeignKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`referenced_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,5,5,'referenced_key_field_list','ReferencedKeyField','{""name"":""a_b_id""}',"a_b_id")

*sql*
INSERT INTO `model`.`table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`) VALUES (500,1,8,1,'table_list','Table','{""name"":""table_a_c"",""rows"":0,""field_list"":[{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0},{""name"":""a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0},{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0},{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0},{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0},{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0},{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0},{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreign_key_list"":[{""name"":""fk_table_a_c_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_c"",""referenced_key_table_name"":""table_a"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""child_table_list"":[]}',"table_a_c",0)

*sql*
INSERT INTO `model`.`table_data_structures`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,8,8,'table_data_structures','UserDefinedTableDataStructures','{}',"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}
","export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}
","	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"node_id\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"update\",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: \"\",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: \"\",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === \"insert_tree_model\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_tree_model\") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_tree_model\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_tree_model\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.tree_model.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"tree_model_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"tree_model_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"node_id\" matInput type=\"number\"
					placeholder=\"{{i18.tree_model.node_id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }\" />
				<div *ngIf=\"isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('tree_model_group.node_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf=\"selected_tree_model_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.first_record}}\" [disabled]=\"cursor == 0\" (click)=\"firstRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.first }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.previous_record}}\" [disabled]=\"cursor == 0\" (click)=\"previousRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.previous }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"lastRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
	<button class=\"pushable-blue\" (click)=\"submitForm()\">
		<span class=\"front-blue\" [dir]=\"direction\">
			{{ i18.submit }}
		</span>
	</button>
	<button class=\"pushable-red\" (click)=\"resetForm()\">
		<span class=\"front-red\" [dir]=\"direction\">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf=\"show_confirmation==true\" (onConfirmationAcknowledged)=\"confirmationAcknowledged($event)\"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------

","

----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		\"node_id\"


		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"tree_model_table_data_source\" [dir]=\"direction\">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(tree_model_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(tree_model_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"tree_model_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let tree_model_record; columns: tree_model_table_columns\"></mat-row>
</mat-table>
------------------ tree_model MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"node_id\"
  ],
  \"where\": {
    \"clause\": \"node_id>?\",
    \"values\": [
      \"INT UNSIGNED\"
    ]
  },
  \"orderby\": []
}

{
  \"transaction\": \"update\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  }
}

","package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"mailto:AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
@WebServlet(\"/tree_model\")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Tree Model\", \"parental\", \"parental\", \"tree_model\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"node_id\", FieldType.Integer, false, false, \"node_id\").setPrimaryKeyAI();
        
        
    }
}","/tree_model")

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,41,8,'field_list','Field','{""name"":""id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimal_digits"":0}',"id",33,true,false,true,true,null,1,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,42,8,'field_list','Field','{""name"":""a_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimal_digits"":0}',"a_id",33,false,true,false,false,null,2,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,43,8,'field_list','Field','{""name"":""name_ar"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimal_digits"":0}',"name_ar",18,false,true,false,false,null,3,45,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,44,8,'field_list','Field','{""name"":""name_en"",""data_type_name"":""VARCHAR"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimal_digits"":0}',"name_en",18,false,true,false,false,null,4,45,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,45,8,'field_list','Field','{""name"":""date"",""data_type_name"":""DATE"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimal_digits"":0}',"date",12,false,true,false,false,null,5,10,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,46,8,'field_list','Field','{""name"":""time"",""data_type_name"":""TIME"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimal_digits"":0}',"time",13,false,true,false,false,null,6,8,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,47,8,'field_list','Field','{""name"":""timestamp"",""data_type_name"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimal_digits"":0}',"timestamp",15,false,true,false,false,null,7,19,0)

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,48,8,'field_list','Field','{""name"":""boolean"",""data_type_name"":""BIT"",""primary_key"":false,""nullable"":true,""auto_increment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimal_digits"":0}',"boolean",10,false,true,false,false,null,8,1,0)

*sql*
INSERT INTO `model`.`primary_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,8,8,'primary_key_list','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primary_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,8,8,'primary_key_field_list','PrimaryKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`foreign_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`referenced_key_name`,`foreign_key_table_name`,`referenced_key_table_name`,`key_sequence`,`update_rule`,`delete_rule`,`deferrability`) VALUES (500,1,6,8,'foreign_key_list','ForeignKey','{""name"":""fk_table_a_c_1"",""referenced_key_name"":""PRIMARY"",""foreign_key_table_name"":""table_a_c"",""referenced_key_table_name"":""table_a"",""foreign_key_field_list"":[{""name"":""id""}],""referenced_key_field_list"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}',"fk_table_a_c_1","PRIMARY","table_a_c","table_a",1,"1","1","7")

*sql*
INSERT INTO `model`.`foreign_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,6,6,'foreign_key_field_list','ForeignKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`referenced_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,6,6,'referenced_key_field_list','ReferencedKeyField','{""name"":""a_id""}',"a_id")

*sql*
INSERT INTO `model`.`table_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`) VALUES (500,1,9,1,'table_list','Table','{""name"":""tree_model"",""rows"":0,""field_list"":[{""name"":""node_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0}],""primary_key_list"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""node_id""}]}],""foreign_key_list"":[],""child_table_list"":[]}',"tree_model",0)

*sql*
INSERT INTO `model`.`table_data_structures`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,9,9,'table_data_structures','UserDefinedTableDataStructures','{}',"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}
","export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}
","	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"node_id\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"update\",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: \"\",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + \"/tree_model\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: \"\",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_tree_model\", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === \"insert_tree_model\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_tree_model\") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_tree_model\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_tree_model\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.tree_model.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"tree_model_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"tree_model_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"node_id\" matInput type=\"number\"
					placeholder=\"{{i18.tree_model.node_id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }\" />
				<div *ngIf=\"isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('tree_model_group.node_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf=\"selected_tree_model_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_tree_model_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.first_record}}\" [disabled]=\"cursor == 0\" (click)=\"firstRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.first }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.previous_record}}\" [disabled]=\"cursor == 0\" (click)=\"previousRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.previous }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.tree_model_list.length-1\" (click)=\"lastRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
	<button class=\"pushable-blue\" (click)=\"submitForm()\">
		<span class=\"front-blue\" [dir]=\"direction\">
			{{ i18.submit }}
		</span>
	</button>
	<button class=\"pushable-red\" (click)=\"resetForm()\">
		<span class=\"front-red\" [dir]=\"direction\">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf=\"show_confirmation==true\" (onConfirmationAcknowledged)=\"confirmationAcknowledged($event)\"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------

","

----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		\"node_id\"


		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"tree_model_table_data_source\" [dir]=\"direction\">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(tree_model_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let tree_model_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(tree_model_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"tree_model_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let tree_model_record; columns: tree_model_table_columns\"></mat-row>
</mat-table>
------------------ tree_model MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"node_id\"
  ],
  \"where\": {
    \"clause\": \"node_id>?\",
    \"values\": [
      \"INT UNSIGNED\"
    ]
  },
  \"orderby\": []
}

{
  \"transaction\": \"update\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"node_id\": \"INT UNSIGNED\"
    }
  ],
  \"where\": {
    \"clause\": \"node_id=?\",
    \"field_list\": [
      \"node_id\"
    ]
  }
}

","package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"mailto:AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
@WebServlet(\"/tree_model\")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Tree Model\", \"parental\", \"parental\", \"tree_model\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"node_id\", FieldType.Integer, false, false, \"node_id\").setPrimaryKeyAI();
        
        
    }
}","/tree_model")

*sql*
INSERT INTO `model`.`field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`data_type_name`,`primary_key`,`nullable`,`auto_increment`,`foreign_reference`,`default_value`,`list_order`,`size`,`decimal_digits`) VALUES (500,1,49,9,'field_list','Field','{""name"":""node_id"",""data_type_name"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""auto_increment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimal_digits"":0}',"node_id",33,true,false,true,false,null,1,10,0)

*sql*
INSERT INTO `model`.`primary_key_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,9,9,'primary_key_list','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""node_id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primary_key_field_list`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,9,9,'primary_key_field_list','PrimaryKeyField','{""name"":""node_id""}',"node_id")
Saved Model

|...Enterprise: parental Databases [1]
    |...Database: parental Tables [9]
        |...Table: compound_key Rows [0] Fields [3] Primary Keys [1] Foerign Keys [0]] Child Tables [0]
            |...Field: [1] `auto_id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `string_key` VARCHAR(128)
            |...Field: [3] `some_data` VARCHAR(256)
            |...Primary Key: PRIMARY {`auto_id`}
        |...Table: fact_master Rows [0] Fields [2] Primary Keys [1] Foerign Keys [0]] Child Tables [2]
            |...Field: [1] `fact_master_id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `fact_master_data` VARCHAR(45) NULL
            |...Primary Key: PRIMARY {`fact_master_id`}
            |...Child Table: [fact_transaction -> fact_master] [`fact_transaction`.`fact_master_id` -> `fact_master`.`fact_master_a_id`]
            |...Child Table: [fact_transaction -> fact_master] [`fact_transaction`.`fact_master_id` -> `fact_master`.`fact_master_b_id`]
        |...Table: fact_transaction Rows [0] Fields [4] Primary Keys [1] Foerign Keys [2]] Child Tables [0]
            |...Field: [1] `fact_transaction_id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `fact_master_a_id` INT UNSIGNED(10) NULL
            |...Field: [3] `fact_master_b_id` INT UNSIGNED(10) NULL
            |...Field: [4] `fact_transaction_data` DECIMAL(18,6) NULL
            |...Primary Key: PRIMARY {`fact_transaction_id`}
            |...Foreign Key CONSTRAINT `fk_fact_transaction_01` FOREIGN KEY (`fact_master_id) REFERENCES `fact_master` (`fact_master_a_id) ON UPDATE RESTRICT ON DELETE RESTRICT
            |...Foreign Key CONSTRAINT `fk_fact_transaction_02` FOREIGN KEY (`fact_master_id) REFERENCES `fact_master` (`fact_master_b_id) ON UPDATE RESTRICT ON DELETE RESTRICT
        |...Table: table_a Rows [0] Fields [7] Primary Keys [1] Foerign Keys [0]] Child Tables [3]
            |...Field: [1] `id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `name_ar` VARCHAR(45) NULL
            |...Field: [3] `name_en` VARCHAR(45) NULL
            |...Field: [4] `date` DATE(10) NULL
            |...Field: [5] `time` TIME(8) NULL
            |...Field: [6] `timestamp` TIMESTAMP(19) NULL
            |...Field: [7] `boolean` BIT(1) NULL
            |...Primary Key: PRIMARY {`id`}
            |...Child Table: [table_a_a -> table_a] [`table_a_a`.`id` -> `table_a`.`a_id`]
            |...Child Table: [table_a_b -> table_a] [`table_a_b`.`id` -> `table_a`.`a_id`]
            |...Child Table: [table_a_c -> table_a] [`table_a_c`.`id` -> `table_a`.`a_id`]
        |...Table: table_a_a Rows [0] Fields [8] Primary Keys [1] Foerign Keys [1]] Child Tables [0]
            |...Field: [1] `id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `a_id` INT UNSIGNED(10) NULL
            |...Field: [3] `name_ar` VARCHAR(45) NULL
            |...Field: [4] `name_en` VARCHAR(45) NULL
            |...Field: [5] `date` DATE(10) NULL
            |...Field: [6] `time` TIME(8) NULL
            |...Field: [7] `timestamp` TIMESTAMP(19) NULL
            |...Field: [8] `boolean` BIT(1) NULL
            |...Primary Key: PRIMARY {`id`}
            |...Foreign Key CONSTRAINT `fk_table_a_a_1` FOREIGN KEY (`id) REFERENCES `table_a` (`a_id) ON UPDATE RESTRICT ON DELETE RESTRICT
        |...Table: table_a_b Rows [0] Fields [8] Primary Keys [1] Foerign Keys [1]] Child Tables [1]
            |...Field: [1] `id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `a_id` INT UNSIGNED(10) NULL
            |...Field: [3] `name_ar` VARCHAR(45) NULL
            |...Field: [4] `name_en` VARCHAR(45) NULL
            |...Field: [5] `date` DATE(10) NULL
            |...Field: [6] `time` TIME(8) NULL
            |...Field: [7] `timestamp` TIMESTAMP(19) NULL
            |...Field: [8] `boolean` BIT(1) NULL
            |...Primary Key: PRIMARY {`id`}
            |...Foreign Key CONSTRAINT `fk_table_a_b_1` FOREIGN KEY (`id) REFERENCES `table_a` (`a_id) ON UPDATE RESTRICT ON DELETE RESTRICT
            |...Child Table: [table_a_b_a -> table_a_b] [`table_a_b_a`.`id` -> `table_a_b`.`a_b_id`]
        |...Table: table_a_b_a Rows [0] Fields [8] Primary Keys [1] Foerign Keys [1]] Child Tables [0]
            |...Field: [1] `id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `a_b_id` INT UNSIGNED(10) NULL
            |...Field: [3] `name_ar` VARCHAR(45) NULL
            |...Field: [4] `name_en` VARCHAR(45) NULL
            |...Field: [5] `date` DATE(10) NULL
            |...Field: [6] `time` TIME(8) NULL
            |...Field: [7] `timestamp` TIMESTAMP(19) NULL
            |...Field: [8] `boolean` BIT(1) NULL
            |...Primary Key: PRIMARY {`id`}
            |...Foreign Key CONSTRAINT `fk_table_a_b_a_1` FOREIGN KEY (`id) REFERENCES `table_a_b` (`a_b_id) ON UPDATE RESTRICT ON DELETE RESTRICT
        |...Table: table_a_c Rows [0] Fields [8] Primary Keys [1] Foerign Keys [1]] Child Tables [0]
            |...Field: [1] `id` INT UNSIGNED(10) AUTOINCREMENT
            |...Field: [2] `a_id` INT UNSIGNED(10) NULL
            |...Field: [3] `name_ar` VARCHAR(45) NULL
            |...Field: [4] `name_en` VARCHAR(45) NULL
            |...Field: [5] `date` DATE(10) NULL
            |...Field: [6] `time` TIME(8) NULL
            |...Field: [7] `timestamp` TIMESTAMP(19) NULL
            |...Field: [8] `boolean` BIT(1) NULL
            |...Primary Key: PRIMARY {`id`}
            |...Foreign Key CONSTRAINT `fk_table_a_c_1` FOREIGN KEY (`id) REFERENCES `table_a` (`a_id) ON UPDATE RESTRICT ON DELETE RESTRICT
        |...Table: tree_model Rows [0] Fields [1] Primary Keys [1] Foerign Keys [0]] Child Tables [0]
            |...Field: [1] `node_id` INT UNSIGNED(10) AUTOINCREMENT
            |...Primary Key: PRIMARY {`node_id`}
=====================================================================================================

    |...Table Logic Tree: Database[parental] Tables Count [9]
        |...[1]:[compound_key.]:[0]
        |...[1]:[fact_master.]:[2]
            |...[2]:[fact_master.fact_transaction.]:[0]
            |...[2]:[fact_master.fact_transaction.]:[0]
        |...[1]:[fact_transaction.]:[0]
        |...[1]:[table_a.]:[3]
            |...[2]:[table_a.table_a_a.]:[0]
            |...[2]:[table_a.table_a_b.]:[1]
                |...[3]:[table_a.table_a_b.table_a_b_a.]:[0]
            |...[2]:[table_a.table_a_c.]:[0]
        |...[1]:[table_a_a.]:[0]
        |...[1]:[table_a_b.]:[1]
            |...[2]:[table_a_b.table_a_b_a.]:[0]
        |...[1]:[table_a_b_a.]:[0]
        |...[1]:[table_a_c.]:[0]
        |...[1]:[tree_model.]:[0]----------- START Database Model ------------
Model: parental
T-[Enterprise #1]
      F-[name]-"parental"
      F-[database_engine]-"mysql"
      F-[database_url]-"jdbc:mysql://localhost:33060/parental"
      F-[case_sensitive_sql]-"true"
      T-[Database #1]
            F-[name]-"parental"
            F-[engine]-"mysql"
            F-[java_package_name]-"..."
            T-[Table #1]
                  F-[name]-"compound_key"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #1]
                  T-[Field #1]
                        F-[name]-"auto_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #2]
                        F-[name]-"string_key"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"false"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"128"
                        F-[decimal_digits]-"0"
                  T-[Field #3]
                        F-[name]-"some_data"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"false"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"3"
                        F-[size]-"256"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #1]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #1]
                              F-[name]-"auto_id"
            T-[Table #2]
                  F-[name]-"fact_master"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #2]
                  T-[Field #4]
                        F-[name]-"fact_master_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #5]
                        F-[name]-"fact_master_data"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #2]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #2]
                              F-[name]-"fact_master_id"
                  T-[ChildTable #1]
                        F-[table_name]-"fact_transaction"
                        F-[parent_table_name]-"fact_master"
                        F-[foreig_key_name]-"fk_fact_transaction_01"
                  T-[ChildTable #2]
                        F-[table_name]-"fact_transaction"
                        F-[parent_table_name]-"fact_master"
                        F-[foreig_key_name]-"fk_fact_transaction_02"
            T-[Table #3]
                  F-[name]-"fact_transaction"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #3]
                  T-[Field #6]
                        F-[name]-"fact_transaction_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #7]
                        F-[name]-"fact_master_a_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #8]
                        F-[name]-"fact_master_b_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"3"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #9]
                        F-[name]-"fact_transaction_data"
                        F-[data_type_name]-"DECIMAL"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"4"
                        F-[size]-"18"
                        F-[decimal_digits]-"6"
                  T-[PrimaryKey #3]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #3]
                              F-[name]-"fact_transaction_id"
                  T-[ForeignKey #1]
                        F-[name]-"fk_fact_transaction_01"
                        F-[referenced_key_name]-"PRIMARY"
                        F-[foreign_key_table_name]-"fact_transaction"
                        F-[referenced_key_table_name]-"fact_master"
                        F-[key_sequence]-"1"
                        F-[update_rule]-"1"
                        F-[delete_rule]-"1"
                        F-[deferrability]-"7"
                        T-[ForeignKeyField #1]
                              F-[name]-"fact_master_id"
                        T-[ReferencedKeyField #1]
                              F-[name]-"fact_master_a_id"
                  T-[ForeignKey #2]
                        F-[name]-"fk_fact_transaction_02"
                        F-[referenced_key_name]-"PRIMARY"
                        F-[foreign_key_table_name]-"fact_transaction"
                        F-[referenced_key_table_name]-"fact_master"
                        F-[key_sequence]-"1"
                        F-[update_rule]-"1"
                        F-[delete_rule]-"1"
                        F-[deferrability]-"7"
                        T-[ForeignKeyField #2]
                              F-[name]-"fact_master_id"
                        T-[ReferencedKeyField #2]
                              F-[name]-"fact_master_b_id"
            T-[Table #4]
                  F-[name]-"table_a"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #4]
                  T-[Field #10]
                        F-[name]-"id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #11]
                        F-[name]-"name_ar"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #12]
                        F-[name]-"name_en"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #13]
                        F-[name]-"date"
                        F-[data_type_name]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"4"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #14]
                        F-[name]-"time"
                        F-[data_type_name]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"5"
                        F-[size]-"8"
                        F-[decimal_digits]-"0"
                  T-[Field #15]
                        F-[name]-"timestamp"
                        F-[data_type_name]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"6"
                        F-[size]-"19"
                        F-[decimal_digits]-"0"
                  T-[Field #16]
                        F-[name]-"boolean"
                        F-[data_type_name]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"7"
                        F-[size]-"1"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #4]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #4]
                              F-[name]-"id"
                  T-[ChildTable #3]
                        F-[table_name]-"table_a_a"
                        F-[parent_table_name]-"table_a"
                        F-[foreig_key_name]-"fk_table_a_a_1"
                  T-[ChildTable #4]
                        F-[table_name]-"table_a_b"
                        F-[parent_table_name]-"table_a"
                        F-[foreig_key_name]-"fk_table_a_b_1"
                  T-[ChildTable #5]
                        F-[table_name]-"table_a_c"
                        F-[parent_table_name]-"table_a"
                        F-[foreig_key_name]-"fk_table_a_c_1"
            T-[Table #5]
                  F-[name]-"table_a_a"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #5]
                  T-[Field #17]
                        F-[name]-"id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"true"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #18]
                        F-[name]-"a_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #19]
                        F-[name]-"name_ar"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #20]
                        F-[name]-"name_en"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #21]
                        F-[name]-"date"
                        F-[data_type_name]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #22]
                        F-[name]-"time"
                        F-[data_type_name]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimal_digits]-"0"
                  T-[Field #23]
                        F-[name]-"timestamp"
                        F-[data_type_name]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimal_digits]-"0"
                  T-[Field #24]
                        F-[name]-"boolean"
                        F-[data_type_name]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #5]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #5]
                              F-[name]-"id"
                  T-[ForeignKey #3]
                        F-[name]-"fk_table_a_a_1"
                        F-[referenced_key_name]-"PRIMARY"
                        F-[foreign_key_table_name]-"table_a_a"
                        F-[referenced_key_table_name]-"table_a"
                        F-[key_sequence]-"1"
                        F-[update_rule]-"1"
                        F-[delete_rule]-"1"
                        F-[deferrability]-"7"
                        T-[ForeignKeyField #3]
                              F-[name]-"id"
                        T-[ReferencedKeyField #3]
                              F-[name]-"a_id"
            T-[Table #6]
                  F-[name]-"table_a_b"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #6]
                  T-[Field #25]
                        F-[name]-"id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"true"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #26]
                        F-[name]-"a_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #27]
                        F-[name]-"name_ar"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #28]
                        F-[name]-"name_en"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #29]
                        F-[name]-"date"
                        F-[data_type_name]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #30]
                        F-[name]-"time"
                        F-[data_type_name]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimal_digits]-"0"
                  T-[Field #31]
                        F-[name]-"timestamp"
                        F-[data_type_name]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimal_digits]-"0"
                  T-[Field #32]
                        F-[name]-"boolean"
                        F-[data_type_name]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #6]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #6]
                              F-[name]-"id"
                  T-[ForeignKey #4]
                        F-[name]-"fk_table_a_b_1"
                        F-[referenced_key_name]-"PRIMARY"
                        F-[foreign_key_table_name]-"table_a_b"
                        F-[referenced_key_table_name]-"table_a"
                        F-[key_sequence]-"1"
                        F-[update_rule]-"1"
                        F-[delete_rule]-"1"
                        F-[deferrability]-"7"
                        T-[ForeignKeyField #4]
                              F-[name]-"id"
                        T-[ReferencedKeyField #4]
                              F-[name]-"a_id"
                  T-[ChildTable #6]
                        F-[table_name]-"table_a_b_a"
                        F-[parent_table_name]-"table_a_b"
                        F-[foreig_key_name]-"fk_table_a_b_a_1"
            T-[Table #7]
                  F-[name]-"table_a_b_a"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #7]
                  T-[Field #33]
                        F-[name]-"id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"true"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #34]
                        F-[name]-"a_b_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #35]
                        F-[name]-"name_ar"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #36]
                        F-[name]-"name_en"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #37]
                        F-[name]-"date"
                        F-[data_type_name]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #38]
                        F-[name]-"time"
                        F-[data_type_name]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimal_digits]-"0"
                  T-[Field #39]
                        F-[name]-"timestamp"
                        F-[data_type_name]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimal_digits]-"0"
                  T-[Field #40]
                        F-[name]-"boolean"
                        F-[data_type_name]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #7]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #7]
                              F-[name]-"id"
                  T-[ForeignKey #5]
                        F-[name]-"fk_table_a_b_a_1"
                        F-[referenced_key_name]-"PRIMARY"
                        F-[foreign_key_table_name]-"table_a_b_a"
                        F-[referenced_key_table_name]-"table_a_b"
                        F-[key_sequence]-"1"
                        F-[update_rule]-"1"
                        F-[delete_rule]-"1"
                        F-[deferrability]-"7"
                        T-[ForeignKeyField #5]
                              F-[name]-"id"
                        T-[ReferencedKeyField #5]
                              F-[name]-"a_b_id"
            T-[Table #8]
                  F-[name]-"table_a_c"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #8]
                  T-[Field #41]
                        F-[name]-"id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"true"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #42]
                        F-[name]-"a_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #43]
                        F-[name]-"name_ar"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #44]
                        F-[name]-"name_en"
                        F-[data_type_name]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimal_digits]-"0"
                  T-[Field #45]
                        F-[name]-"date"
                        F-[data_type_name]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[Field #46]
                        F-[name]-"time"
                        F-[data_type_name]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimal_digits]-"0"
                  T-[Field #47]
                        F-[name]-"timestamp"
                        F-[data_type_name]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimal_digits]-"0"
                  T-[Field #48]
                        F-[name]-"boolean"
                        F-[data_type_name]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[auto_increment]-"false"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #8]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #8]
                              F-[name]-"id"
                  T-[ForeignKey #6]
                        F-[name]-"fk_table_a_c_1"
                        F-[referenced_key_name]-"PRIMARY"
                        F-[foreign_key_table_name]-"table_a_c"
                        F-[referenced_key_table_name]-"table_a"
                        F-[key_sequence]-"1"
                        F-[update_rule]-"1"
                        F-[delete_rule]-"1"
                        F-[deferrability]-"7"
                        T-[ForeignKeyField #6]
                              F-[name]-"id"
                        T-[ReferencedKeyField #6]
                              F-[name]-"a_id"
            T-[Table #9]
                  F-[name]-"tree_model"
                  F-[rows]-"0"
                  T-[UserDefinedTableDataStructures #9]
                  T-[Field #49]
                        F-[name]-"node_id"
                        F-[data_type_name]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[auto_increment]-"true"
                        F-[foreign_reference]-"false"
                        F-[default_value] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimal_digits]-"0"
                  T-[PrimaryKey #9]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #9]
                              F-[name]-"node_id"
-----------  END Database Model   ------------
----------- START Database Data Structures ------------


 ***** Java Data Structure Class ******


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class TreeModel {
    public Integer node_id;

    public TreeModel(
        Integer node_id
    ) {
        this.node_id = node_id;
    }
}



 ***** Database Servlet Class ******


package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href="mailto:AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
@WebServlet("/tree_model")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Tree Model", "parental", "parental", "tree_model");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("node_id", FieldType.Integer, false, false, "node_id").setPrimaryKeyAI();
        
        
    }
}

package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href="mailto:AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
@WebServlet("/tree_model")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Tree Model", "parental", "parental", "tree_model");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("node_id", FieldType.Integer, false, false, "node_id").setPrimaryKeyAI();
        
        
    }
}

package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href="mailto:AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
@WebServlet("/tree_model")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Tree Model", "parental", "parental", "tree_model");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("node_id", FieldType.Integer, false, false, "node_id").setPrimaryKeyAI();
        
        
    }
}

package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href="mailto:AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
@WebServlet("/tree_model")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Tree Model", "parental", "parental", "tree_model");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("node_id", FieldType.Integer, false, false, "node_id").setPrimaryKeyAI();
        
        
    }
}

package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href="mailto:AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
@WebServlet("/tree_model")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Tree Model", "parental", "parental", "tree_model");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("node_id", FieldType.Integer, false, false, "node_id").setPrimaryKeyAI();
        
        
    }
}

package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href="mailto:AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
@WebServlet("/tree_model")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Tree Model", "parental", "parental", "tree_model");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("node_id", FieldType.Integer, false, false, "node_id").setPrimaryKeyAI();
        
        
    }
}

package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href="mailto:AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
@WebServlet("/tree_model")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Tree Model", "parental", "parental", "tree_model");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("node_id", FieldType.Integer, false, false, "node_id").setPrimaryKeyAI();
        
        
    }
}

package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href="mailto:AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
@WebServlet("/tree_model")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Tree Model", "parental", "parental", "tree_model");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("node_id", FieldType.Integer, false, false, "node_id").setPrimaryKeyAI();
        
        
    }
}

package net.reyadeyat.relational.api.model;

import AUTHOR_PACKAGE.database.FieldType;
import AUTHOR_PACKAGE.servlet.DatabaseServlet;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author AUTHOR_NAME
 * <a href="mailto:AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
@WebServlet("/tree_model")
public class TreeModel extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Tree Model", "parental", "parental", "tree_model");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("node_id", FieldType.Integer, false, false, "node_id").setPrimaryKeyAI();
        
        
    }
}


 ***** Typescript Data Structure Class ******


export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}


export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}


export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}


export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}


export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}


export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}


export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}


export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}


export class TreeModel extends RecordControl {
    node_id?: number;

    constructor(
        node_id?: number
    ) {
		super();
        this.node_id = node_id;
    
    }
    
    equals(tree_model: TreeModel) {
        return tree_model != null
        && this.node_id == tree_model.node_id;
    }
    
    static fromJSON(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    static fromJSONObjectList(json: any) : TreeModel {
        return new TreeModel(
            json.node_id
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            node_id: this.node_id
        };
    }
    
}



 ***** Typescript Request Send Respnonse ******


	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"node_id"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "update",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: "",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: "",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === "insert_tree_model") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_tree_model") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_tree_model") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_tree_model") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"node_id"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "update",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: "",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: "",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === "insert_tree_model") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_tree_model") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_tree_model") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_tree_model") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"node_id"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "update",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: "",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: "",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === "insert_tree_model") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_tree_model") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_tree_model") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_tree_model") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"node_id"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "update",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: "",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: "",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === "insert_tree_model") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_tree_model") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_tree_model") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_tree_model") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"node_id"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "update",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: "",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: "",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === "insert_tree_model") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_tree_model") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_tree_model") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_tree_model") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"node_id"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "update",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: "",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: "",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === "insert_tree_model") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_tree_model") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_tree_model") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_tree_model") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"node_id"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "update",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: "",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: "",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === "insert_tree_model") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_tree_model") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_tree_model") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_tree_model") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"node_id"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "update",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: "",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: "",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === "insert_tree_model") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_tree_model") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_tree_model") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_tree_model") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertTreeModel(tree_model: TreeModel[]) {
		this.insert_tree_model_record_list.push(tree_model);
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	selectTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"node_id"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	updateTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "update",
			returns: 'id',
			//variable?: {};
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
				clause: "",
				field_list: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	deleteTreeModel(tree_model: TreeModel[]) {
		let servlet_url: string = Constants.tariff_url + "/tree_model";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					node_id: tree_model.node_id

				}
			],
			where: {
			  clause: "",
			  field_list: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_tree_model", servlet_url, request, http_headers, http_parameters);
	}

	tree_model_list: TreeModel[] = [];
	selected_tree_model_option: TreeModel;
	selected_tree_model_record: TreeModel;

	insert_tree_model_record_list: TreeModel[] = [];
	update_tree_model_record_list: TreeModel[] = [];
	delete_tree_model_record_list: TreeModel[] = [];

	//selected_tree_model_list_icon: any = blank_icon;
	
	} else if (key === "insert_tree_model") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_tree_model_record_list.length; i++) {
			this.tree_model_list.push(this.insert_tree_model_record_list[i]);
		}
		this.insert_tree_model_record_list = [];
		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_tree_model") {
		let resultset: any[] = response.resultset;
		this.tree_model_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.tree_model_list.push(TreeModel.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.tree_model_list[i].tree_model_icon);
		}

		this.tree_model_table_data_source.data = this.tree_model_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_tree_model") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_tree_model") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}




 ***** Typescript Form Component .ts ******




----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}



----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}



----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}



----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}



----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}



----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}



----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}



----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}



----------- tree_model Form Controls ---------------------

	tree_model_form: FormGroup;
	node_id_control: FormControl;






	constructor() {

	this.node_id_control = new FormControl([]);







	this.tree_model_form = form_builder.group({
		tree_model_group: form_builder.group({
			node_id: this.node_id_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTreeModelRecord(selected_tree_model_record: TreeModel) {
		this.selected_tree_model_record = selected_tree_model_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}


 ***** Typescript Form Component .html ******


<div class="container">
    <p class="card">{{i18.tree_model.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="tree_model_form" [dir]="direction">
	<div role="group" formGroupName="tree_model_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="node_id" matInput type="number"
					placeholder="{{i18.tree_model.node_id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }" />
				<div *ngIf="isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('tree_model_group.node_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf="selected_tree_model_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.first_record}}" [disabled]="cursor == 0" (click)="firstRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.first }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.previous_record}}" [disabled]="cursor == 0" (click)="previousRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.previous }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="lastRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class="form-group yes-mouse" [dir]="direction">
	<button class="pushable-blue" (click)="submitForm()">
		<span class="front-blue" [dir]="direction">
			{{ i18.submit }}
		</span>
	</button>
	<button class="pushable-red" (click)="resetForm()">
		<span class="front-red" [dir]="direction">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf="show_confirmation==true" (onConfirmationAcknowledged)="confirmationAcknowledged($event)"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.tree_model.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="tree_model_form" [dir]="direction">
	<div role="group" formGroupName="tree_model_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="node_id" matInput type="number"
					placeholder="{{i18.tree_model.node_id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }" />
				<div *ngIf="isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('tree_model_group.node_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf="selected_tree_model_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.first_record}}" [disabled]="cursor == 0" (click)="firstRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.first }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.previous_record}}" [disabled]="cursor == 0" (click)="previousRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.previous }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="lastRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class="form-group yes-mouse" [dir]="direction">
	<button class="pushable-blue" (click)="submitForm()">
		<span class="front-blue" [dir]="direction">
			{{ i18.submit }}
		</span>
	</button>
	<button class="pushable-red" (click)="resetForm()">
		<span class="front-red" [dir]="direction">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf="show_confirmation==true" (onConfirmationAcknowledged)="confirmationAcknowledged($event)"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.tree_model.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="tree_model_form" [dir]="direction">
	<div role="group" formGroupName="tree_model_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="node_id" matInput type="number"
					placeholder="{{i18.tree_model.node_id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }" />
				<div *ngIf="isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('tree_model_group.node_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf="selected_tree_model_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.first_record}}" [disabled]="cursor == 0" (click)="firstRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.first }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.previous_record}}" [disabled]="cursor == 0" (click)="previousRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.previous }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="lastRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class="form-group yes-mouse" [dir]="direction">
	<button class="pushable-blue" (click)="submitForm()">
		<span class="front-blue" [dir]="direction">
			{{ i18.submit }}
		</span>
	</button>
	<button class="pushable-red" (click)="resetForm()">
		<span class="front-red" [dir]="direction">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf="show_confirmation==true" (onConfirmationAcknowledged)="confirmationAcknowledged($event)"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.tree_model.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="tree_model_form" [dir]="direction">
	<div role="group" formGroupName="tree_model_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="node_id" matInput type="number"
					placeholder="{{i18.tree_model.node_id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }" />
				<div *ngIf="isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('tree_model_group.node_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf="selected_tree_model_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.first_record}}" [disabled]="cursor == 0" (click)="firstRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.first }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.previous_record}}" [disabled]="cursor == 0" (click)="previousRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.previous }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="lastRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class="form-group yes-mouse" [dir]="direction">
	<button class="pushable-blue" (click)="submitForm()">
		<span class="front-blue" [dir]="direction">
			{{ i18.submit }}
		</span>
	</button>
	<button class="pushable-red" (click)="resetForm()">
		<span class="front-red" [dir]="direction">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf="show_confirmation==true" (onConfirmationAcknowledged)="confirmationAcknowledged($event)"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.tree_model.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="tree_model_form" [dir]="direction">
	<div role="group" formGroupName="tree_model_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="node_id" matInput type="number"
					placeholder="{{i18.tree_model.node_id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }" />
				<div *ngIf="isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('tree_model_group.node_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf="selected_tree_model_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.first_record}}" [disabled]="cursor == 0" (click)="firstRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.first }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.previous_record}}" [disabled]="cursor == 0" (click)="previousRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.previous }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="lastRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class="form-group yes-mouse" [dir]="direction">
	<button class="pushable-blue" (click)="submitForm()">
		<span class="front-blue" [dir]="direction">
			{{ i18.submit }}
		</span>
	</button>
	<button class="pushable-red" (click)="resetForm()">
		<span class="front-red" [dir]="direction">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf="show_confirmation==true" (onConfirmationAcknowledged)="confirmationAcknowledged($event)"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.tree_model.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="tree_model_form" [dir]="direction">
	<div role="group" formGroupName="tree_model_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="node_id" matInput type="number"
					placeholder="{{i18.tree_model.node_id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }" />
				<div *ngIf="isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('tree_model_group.node_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf="selected_tree_model_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.first_record}}" [disabled]="cursor == 0" (click)="firstRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.first }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.previous_record}}" [disabled]="cursor == 0" (click)="previousRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.previous }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="lastRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class="form-group yes-mouse" [dir]="direction">
	<button class="pushable-blue" (click)="submitForm()">
		<span class="front-blue" [dir]="direction">
			{{ i18.submit }}
		</span>
	</button>
	<button class="pushable-red" (click)="resetForm()">
		<span class="front-red" [dir]="direction">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf="show_confirmation==true" (onConfirmationAcknowledged)="confirmationAcknowledged($event)"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.tree_model.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="tree_model_form" [dir]="direction">
	<div role="group" formGroupName="tree_model_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="node_id" matInput type="number"
					placeholder="{{i18.tree_model.node_id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }" />
				<div *ngIf="isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('tree_model_group.node_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf="selected_tree_model_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.first_record}}" [disabled]="cursor == 0" (click)="firstRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.first }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.previous_record}}" [disabled]="cursor == 0" (click)="previousRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.previous }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="lastRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class="form-group yes-mouse" [dir]="direction">
	<button class="pushable-blue" (click)="submitForm()">
		<span class="front-blue" [dir]="direction">
			{{ i18.submit }}
		</span>
	</button>
	<button class="pushable-red" (click)="resetForm()">
		<span class="front-red" [dir]="direction">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf="show_confirmation==true" (onConfirmationAcknowledged)="confirmationAcknowledged($event)"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.tree_model.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="tree_model_form" [dir]="direction">
	<div role="group" formGroupName="tree_model_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="node_id" matInput type="number"
					placeholder="{{i18.tree_model.node_id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }" />
				<div *ngIf="isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('tree_model_group.node_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf="selected_tree_model_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.first_record}}" [disabled]="cursor == 0" (click)="firstRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.first }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.previous_record}}" [disabled]="cursor == 0" (click)="previousRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.previous }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="lastRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class="form-group yes-mouse" [dir]="direction">
	<button class="pushable-blue" (click)="submitForm()">
		<span class="front-blue" [dir]="direction">
			{{ i18.submit }}
		</span>
	</button>
	<button class="pushable-red" (click)="resetForm()">
		<span class="front-red" [dir]="direction">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf="show_confirmation==true" (onConfirmationAcknowledged)="confirmationAcknowledged($event)"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.tree_model.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="tree_model_form" [dir]="direction">
	<div role="group" formGroupName="tree_model_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box node_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="node_id" matInput type="number"
					placeholder="{{i18.tree_model.node_id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('tree_model_group.node_id') === false }" />
				<div *ngIf="isModified('tree_model_group.node_id') && isValid('tree_model_group.node_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('tree_model_group.node_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.TreeModel.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.TreeModel.title}}-->
	<img *ngIf="selected_tree_model_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_tree_model_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.first_record}}" [disabled]="cursor == 0" (click)="firstRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.first }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.previous_record}}" [disabled]="cursor == 0" (click)="previousRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.previous }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.tree_model_list.length-1" (click)="lastRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.last }}
		</span>
	</button>
</div>
<div class="form-group yes-mouse" [dir]="direction">
	<button class="pushable-blue" (click)="submitForm()">
		<span class="front-blue" [dir]="direction">
			{{ i18.submit }}
		</span>
	</button>
	<button class="pushable-red" (click)="resetForm()">
		<span class="front-red" [dir]="direction">
			{{ i18.reset }}
		</span>
	</button>
</div></ng-container>
    <confirmation-component *ngIf="show_confirmation==true" (onConfirmationAcknowledged)="confirmationAcknowledged($event)"></confirmation-component>
</div>



------------------ tree_model Form HTML Controls ---------------




 ***** Typescript MAT Table Component .ts ******




----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		"node_id"


		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	




----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		"node_id"


		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	




----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		"node_id"


		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	




----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		"node_id"


		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	




----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		"node_id"


		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	




----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		"node_id"


		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	




----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		"node_id"


		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	




----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		"node_id"


		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	




----------- tree_model MAT Table Controls ---------------------

	tree_model_table_data_source: MatTableDataSource<TreeModel>;
	tree_model_table_columns: string[] = [
		"node_id"


		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.tree_model_list = [];
		this.tree_model_table_data_source = new MatTableDataSource(this.tree_model_list);
		this.tree_model_table_data_source.data = this.tree_model_list;
	}
	
	



 ***** Typescript MAT Table Component .html ******


<mat-table class="just-table mat-elevation-z8" [dataSource]="tree_model_table_data_source" [dir]="direction">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef="select_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef="let tree_model_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="selectRecord(tree_model_record)">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef="delete_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef="let tree_model_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="deleteRecord(tree_model_record)">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef="tree_model_table_columns">
	</mat-header-row>
	<mat-row *matRowDef="let tree_model_record; columns: tree_model_table_columns"></mat-row>
</mat-table>
------------------ tree_model MAT Table HTML Controls ---------------



<mat-table class="just-table mat-elevation-z8" [dataSource]="tree_model_table_data_source" [dir]="direction">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef="select_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef="let tree_model_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="selectRecord(tree_model_record)">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef="delete_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef="let tree_model_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="deleteRecord(tree_model_record)">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef="tree_model_table_columns">
	</mat-header-row>
	<mat-row *matRowDef="let tree_model_record; columns: tree_model_table_columns"></mat-row>
</mat-table>
------------------ tree_model MAT Table HTML Controls ---------------



<mat-table class="just-table mat-elevation-z8" [dataSource]="tree_model_table_data_source" [dir]="direction">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef="select_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef="let tree_model_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="selectRecord(tree_model_record)">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef="delete_record">
		<mat-header-cell *matHeaderCellDef cl