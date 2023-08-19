
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
{"sql":"SELECT `compound_key_1001`.`auto_id` AS `auto_id_101`,`compound_key_1001`.`string_key` AS `string_key_102`,`compound_key_1001`.`some_data` AS `some_data_103` FROM `parental`.`compound_key` AS `compound_key_1001`","tablesPath":"compound_key","tables":[{"name":"compound_key","alias":"compound_key_1001","fields":[{"name":"auto_id","alias":"auto_id_101","classPath":"java.lang.Integer"},{"name":"string_key","alias":"string_key_102","classPath":"java.lang.String"},{"name":"some_data","alias":"some_data_103","classPath":"java.lang.String"}]}],"recordSet":[]}

compound_key
compound_key
{"sql":"SELECT `compound_key_1001`.`auto_id` AS `auto_id_101`,`compound_key_1001`.`string_key` AS `string_key_102`,`compound_key_1001`.`some_data` AS `some_data_103` FROM `parental`.`compound_key` AS `compound_key_1001`","tablesPath":"compound_key","tables":[{"name":"compound_key","alias":"compound_key_1001","fields":[{"name":"auto_id","alias":"auto_id_101","classPath":"java.lang.Integer"},{"name":"string_key","alias":"string_key_102","classPath":"java.lang.String"},{"name":"some_data","alias":"some_data_103","classPath":"java.lang.String"}]}],"recordSet":[]}

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
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102` FROM `parental`.`fact_master` AS `fact_master_1001`","tablesPath":"fact_master","tables":[{"name":"fact_master","alias":"fact_master_1001","fields":[{"name":"fact_master_id","alias":"fact_master_id_101","classPath":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","classPath":"java.lang.String"}]}],"recordSet":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","tablesPath":"fact_master.fact_transaction","tables":[{"name":"fact_master","alias":"fact_master_1001","fields":[{"name":"fact_master_id","alias":"fact_master_id_101","classPath":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","classPath":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","fields":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","classPath":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","classPath":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","classPath":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","classPath":"java.lang.Double"}]}],"recordSet":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","tablesPath":"fact_master.fact_transaction","tables":[{"name":"fact_master","alias":"fact_master_1001","fields":[{"name":"fact_master_id","alias":"fact_master_id_101","classPath":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","classPath":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","fields":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","classPath":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","classPath":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","classPath":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","classPath":"java.lang.Double"}]}],"recordSet":[]}

fact_master
fact_master
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102` FROM `parental`.`fact_master` AS `fact_master_1001`","tablesPath":"fact_master","tables":[{"name":"fact_master","alias":"fact_master_1001","fields":[{"name":"fact_master_id","alias":"fact_master_id_101","classPath":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","classPath":"java.lang.String"}]}],"recordSet":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","tablesPath":"fact_master.fact_transaction","tables":[{"name":"fact_master","alias":"fact_master_1001","fields":[{"name":"fact_master_id","alias":"fact_master_id_101","classPath":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","classPath":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","fields":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","classPath":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","classPath":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","classPath":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","classPath":"java.lang.Double"}]}],"recordSet":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","tablesPath":"fact_master.fact_transaction","tables":[{"name":"fact_master","alias":"fact_master_1001","fields":[{"name":"fact_master_id","alias":"fact_master_id_101","classPath":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","classPath":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","fields":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","classPath":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","classPath":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","classPath":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","classPath":"java.lang.Double"}]}],"recordSet":[]}

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
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","tablesPath":"fact_master.fact_transaction","tables":[{"name":"fact_master","alias":"fact_master_1001","fields":[{"name":"fact_master_id","alias":"fact_master_id_101","classPath":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","classPath":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","fields":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","classPath":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","classPath":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","classPath":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","classPath":"java.lang.Double"}]}],"recordSet":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","tablesPath":"fact_master.fact_transaction","tables":[{"name":"fact_master","alias":"fact_master_1001","fields":[{"name":"fact_master_id","alias":"fact_master_id_101","classPath":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","classPath":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","fields":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","classPath":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","classPath":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","classPath":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","classPath":"java.lang.Double"}]}],"recordSet":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","tablesPath":"fact_master.fact_transaction","tables":[{"name":"fact_master","alias":"fact_master_1001","fields":[{"name":"fact_master_id","alias":"fact_master_id_101","classPath":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","classPath":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","fields":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","classPath":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","classPath":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","classPath":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","classPath":"java.lang.Double"}]}],"recordSet":[]}

fact_transaction
fact_transaction
{"sql":"SELECT `fact_transaction_1001`.`fact_transaction_id` AS `fact_transaction_id_101`,`fact_transaction_1001`.`fact_master_a_id` AS `fact_master_a_id_102`,`fact_transaction_1001`.`fact_master_b_id` AS `fact_master_b_id_103`,`fact_transaction_1001`.`fact_transaction_data` AS `fact_transaction_data_104` FROM `parental`.`fact_transaction` AS `fact_transaction_1001`","tablesPath":"fact_transaction","tables":[{"name":"fact_transaction","alias":"fact_transaction_1001","fields":[{"name":"fact_transaction_id","alias":"fact_transaction_id_101","classPath":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_102","classPath":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_103","classPath":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_104","classPath":"java.lang.Double"}]}],"recordSet":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","tablesPath":"fact_master.fact_transaction","tables":[{"name":"fact_master","alias":"fact_master_1001","fields":[{"name":"fact_master_id","alias":"fact_master_id_101","classPath":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","classPath":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","fields":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","classPath":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","classPath":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","classPath":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","classPath":"java.lang.Double"}]}],"recordSet":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","tablesPath":"fact_master.fact_transaction","tables":[{"name":"fact_master","alias":"fact_master_1001","fields":[{"name":"fact_master_id","alias":"fact_master_id_101","classPath":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","classPath":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","fields":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","classPath":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","classPath":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","classPath":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","classPath":"java.lang.Double"}]}],"recordSet":[]}

fact_master.fact_transaction
fact_master.fact_transaction
{"sql":"SELECT `fact_master_1001`.`fact_master_id` AS `fact_master_id_101`,`fact_master_1001`.`fact_master_data` AS `fact_master_data_102`,`fact_transaction_1002`.`fact_transaction_id` AS `fact_transaction_id_103`,`fact_transaction_1002`.`fact_master_a_id` AS `fact_master_a_id_104`,`fact_transaction_1002`.`fact_master_b_id` AS `fact_master_b_id_105`,`fact_transaction_1002`.`fact_transaction_data` AS `fact_transaction_data_106` FROM `parental`.`fact_master` AS `fact_master_1001` INNER JOIN `parental`.`fact_transaction` AS `fact_transaction_1002` ON `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_a_id` AND `fact_master_1001`.`fact_master_id`=`fact_transaction_1002`.`fact_master_b_id`","tablesPath":"fact_master.fact_transaction","tables":[{"name":"fact_master","alias":"fact_master_1001","fields":[{"name":"fact_master_id","alias":"fact_master_id_101","classPath":"java.lang.Integer"},{"name":"fact_master_data","alias":"fact_master_data_102","classPath":"java.lang.String"}]},{"name":"fact_transaction","alias":"fact_transaction_1002","fields":[{"name":"fact_transaction_id","alias":"fact_transaction_id_103","classPath":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_104","classPath":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_105","classPath":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_106","classPath":"java.lang.Double"}]}],"recordSet":[]}

fact_transaction
fact_transaction
{"sql":"SELECT `fact_transaction_1001`.`fact_transaction_id` AS `fact_transaction_id_101`,`fact_transaction_1001`.`fact_master_a_id` AS `fact_master_a_id_102`,`fact_transaction_1001`.`fact_master_b_id` AS `fact_master_b_id_103`,`fact_transaction_1001`.`fact_transaction_data` AS `fact_transaction_data_104` FROM `parental`.`fact_transaction` AS `fact_transaction_1001`","tablesPath":"fact_transaction","tables":[{"name":"fact_transaction","alias":"fact_transaction_1001","fields":[{"name":"fact_transaction_id","alias":"fact_transaction_id_101","classPath":"java.lang.Integer"},{"name":"fact_master_a_id","alias":"fact_master_a_id_102","classPath":"java.lang.Integer"},{"name":"fact_master_b_id","alias":"fact_master_b_id_103","classPath":"java.lang.Integer"},{"name":"fact_transaction_data","alias":"fact_transaction_data_104","classPath":"java.lang.Double"}]}],"recordSet":[]}

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
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107` FROM `parental`.`table_a` AS `table_a_1001`","tablesPath":"table_a","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a.table_a_a
table_a.table_a_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_a_1002`.`id` AS `id_108`,`table_a_a_1002`.`a_id` AS `a_id_109`,`table_a_a_1002`.`name_ar` AS `name_ar_110`,`table_a_a_1002`.`name_en` AS `name_en_111`,`table_a_a_1002`.`date` AS `date_112`,`table_a_a_1002`.`time` AS `time_113`,`table_a_a_1002`.`timestamp` AS `timestamp_114`,`table_a_a_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_a` AS `table_a_a_1002` ON `table_a_1001`.`id`=`table_a_a_1002`.`a_id`","tablesPath":"table_a.table_a_a","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_a","alias":"table_a_a_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a.table_a_b
table_a.table_a_b
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id`","tablesPath":"table_a.table_a_b","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a.table_a_b.table_a_b_a
table_a.table_a_b.table_a_b_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115`,`table_a_b_a_1003`.`id` AS `id_116`,`table_a_b_a_1003`.`a_b_id` AS `a_b_id_117`,`table_a_b_a_1003`.`name_ar` AS `name_ar_118`,`table_a_b_a_1003`.`name_en` AS `name_en_119`,`table_a_b_a_1003`.`date` AS `date_120`,`table_a_b_a_1003`.`time` AS `time_121`,`table_a_b_a_1003`.`timestamp` AS `timestamp_122`,`table_a_b_a_1003`.`boolean` AS `boolean_123` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1003` ON `table_a_b_1002`.`id`=`table_a_b_a_1003`.`a_b_id`","tablesPath":"table_a.table_a_b.table_a_b_a","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1003","fields":[{"name":"id","alias":"id_116","classPath":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_117","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_118","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_119","classPath":"java.lang.String"},{"name":"date","alias":"date_120","classPath":"java.sql.Date"},{"name":"time","alias":"time_121","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_122","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_123","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a.table_a_c
table_a.table_a_c
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_c_1002`.`id` AS `id_108`,`table_a_c_1002`.`a_id` AS `a_id_109`,`table_a_c_1002`.`name_ar` AS `name_ar_110`,`table_a_c_1002`.`name_en` AS `name_en_111`,`table_a_c_1002`.`date` AS `date_112`,`table_a_c_1002`.`time` AS `time_113`,`table_a_c_1002`.`timestamp` AS `timestamp_114`,`table_a_c_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_c` AS `table_a_c_1002` ON `table_a_1001`.`id`=`table_a_c_1002`.`a_id`","tablesPath":"table_a.table_a_c","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_c","alias":"table_a_c_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a
table_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107` FROM `parental`.`table_a` AS `table_a_1001`","tablesPath":"table_a","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a.table_a_a
table_a.table_a_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_a_1002`.`id` AS `id_108`,`table_a_a_1002`.`a_id` AS `a_id_109`,`table_a_a_1002`.`name_ar` AS `name_ar_110`,`table_a_a_1002`.`name_en` AS `name_en_111`,`table_a_a_1002`.`date` AS `date_112`,`table_a_a_1002`.`time` AS `time_113`,`table_a_a_1002`.`timestamp` AS `timestamp_114`,`table_a_a_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_a` AS `table_a_a_1002` ON `table_a_1001`.`id`=`table_a_a_1002`.`a_id`","tablesPath":"table_a.table_a_a","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_a","alias":"table_a_a_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a.table_a_b
table_a.table_a_b
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id`","tablesPath":"table_a.table_a_b","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a.table_a_b.table_a_b_a
table_a.table_a_b.table_a_b_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115`,`table_a_b_a_1003`.`id` AS `id_116`,`table_a_b_a_1003`.`a_b_id` AS `a_b_id_117`,`table_a_b_a_1003`.`name_ar` AS `name_ar_118`,`table_a_b_a_1003`.`name_en` AS `name_en_119`,`table_a_b_a_1003`.`date` AS `date_120`,`table_a_b_a_1003`.`time` AS `time_121`,`table_a_b_a_1003`.`timestamp` AS `timestamp_122`,`table_a_b_a_1003`.`boolean` AS `boolean_123` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1003` ON `table_a_b_1002`.`id`=`table_a_b_a_1003`.`a_b_id`","tablesPath":"table_a.table_a_b.table_a_b_a","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1003","fields":[{"name":"id","alias":"id_116","classPath":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_117","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_118","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_119","classPath":"java.lang.String"},{"name":"date","alias":"date_120","classPath":"java.sql.Date"},{"name":"time","alias":"time_121","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_122","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_123","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a.table_a_c
table_a.table_a_c
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_c_1002`.`id` AS `id_108`,`table_a_c_1002`.`a_id` AS `a_id_109`,`table_a_c_1002`.`name_ar` AS `name_ar_110`,`table_a_c_1002`.`name_en` AS `name_en_111`,`table_a_c_1002`.`date` AS `date_112`,`table_a_c_1002`.`time` AS `time_113`,`table_a_c_1002`.`timestamp` AS `timestamp_114`,`table_a_c_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_c` AS `table_a_c_1002` ON `table_a_1001`.`id`=`table_a_c_1002`.`a_id`","tablesPath":"table_a.table_a_c","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_c","alias":"table_a_c_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]}],"recordSet":[]}

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
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_a_1002`.`id` AS `id_108`,`table_a_a_1002`.`a_id` AS `a_id_109`,`table_a_a_1002`.`name_ar` AS `name_ar_110`,`table_a_a_1002`.`name_en` AS `name_en_111`,`table_a_a_1002`.`date` AS `date_112`,`table_a_a_1002`.`time` AS `time_113`,`table_a_a_1002`.`timestamp` AS `timestamp_114`,`table_a_a_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_a` AS `table_a_a_1002` ON `table_a_1001`.`id`=`table_a_a_1002`.`a_id`","tablesPath":"table_a.table_a_a","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_a","alias":"table_a_a_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a_a
table_a_a
{"sql":"SELECT `table_a_a_1001`.`id` AS `id_101`,`table_a_a_1001`.`a_id` AS `a_id_102`,`table_a_a_1001`.`name_ar` AS `name_ar_103`,`table_a_a_1001`.`name_en` AS `name_en_104`,`table_a_a_1001`.`date` AS `date_105`,`table_a_a_1001`.`time` AS `time_106`,`table_a_a_1001`.`timestamp` AS `timestamp_107`,`table_a_a_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_a` AS `table_a_a_1001`","tablesPath":"table_a_a","tables":[{"name":"table_a_a","alias":"table_a_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_104","classPath":"java.lang.String"},{"name":"date","alias":"date_105","classPath":"java.sql.Date"},{"name":"time","alias":"time_106","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a.table_a_a
table_a.table_a_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_a_1002`.`id` AS `id_108`,`table_a_a_1002`.`a_id` AS `a_id_109`,`table_a_a_1002`.`name_ar` AS `name_ar_110`,`table_a_a_1002`.`name_en` AS `name_en_111`,`table_a_a_1002`.`date` AS `date_112`,`table_a_a_1002`.`time` AS `time_113`,`table_a_a_1002`.`timestamp` AS `timestamp_114`,`table_a_a_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_a` AS `table_a_a_1002` ON `table_a_1001`.`id`=`table_a_a_1002`.`a_id`","tablesPath":"table_a.table_a_a","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_a","alias":"table_a_a_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a_a
table_a_a
{"sql":"SELECT `table_a_a_1001`.`id` AS `id_101`,`table_a_a_1001`.`a_id` AS `a_id_102`,`table_a_a_1001`.`name_ar` AS `name_ar_103`,`table_a_a_1001`.`name_en` AS `name_en_104`,`table_a_a_1001`.`date` AS `date_105`,`table_a_a_1001`.`time` AS `time_106`,`table_a_a_1001`.`timestamp` AS `timestamp_107`,`table_a_a_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_a` AS `table_a_a_1001`","tablesPath":"table_a_a","tables":[{"name":"table_a_a","alias":"table_a_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_104","classPath":"java.lang.String"},{"name":"date","alias":"date_105","classPath":"java.sql.Date"},{"name":"time","alias":"time_106","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","classPath":"java.lang.Integer"}]}],"recordSet":[]}

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
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id`","tablesPath":"table_a.table_a_b","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a.table_a_b.table_a_b_a
table_a.table_a_b.table_a_b_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115`,`table_a_b_a_1003`.`id` AS `id_116`,`table_a_b_a_1003`.`a_b_id` AS `a_b_id_117`,`table_a_b_a_1003`.`name_ar` AS `name_ar_118`,`table_a_b_a_1003`.`name_en` AS `name_en_119`,`table_a_b_a_1003`.`date` AS `date_120`,`table_a_b_a_1003`.`time` AS `time_121`,`table_a_b_a_1003`.`timestamp` AS `timestamp_122`,`table_a_b_a_1003`.`boolean` AS `boolean_123` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1003` ON `table_a_b_1002`.`id`=`table_a_b_a_1003`.`a_b_id`","tablesPath":"table_a.table_a_b.table_a_b_a","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1003","fields":[{"name":"id","alias":"id_116","classPath":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_117","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_118","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_119","classPath":"java.lang.String"},{"name":"date","alias":"date_120","classPath":"java.sql.Date"},{"name":"time","alias":"time_121","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_122","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_123","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a_b
table_a_b
{"sql":"SELECT `table_a_b_1001`.`id` AS `id_101`,`table_a_b_1001`.`a_id` AS `a_id_102`,`table_a_b_1001`.`name_ar` AS `name_ar_103`,`table_a_b_1001`.`name_en` AS `name_en_104`,`table_a_b_1001`.`date` AS `date_105`,`table_a_b_1001`.`time` AS `time_106`,`table_a_b_1001`.`timestamp` AS `timestamp_107`,`table_a_b_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_b` AS `table_a_b_1001`","tablesPath":"table_a_b","tables":[{"name":"table_a_b","alias":"table_a_b_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_104","classPath":"java.lang.String"},{"name":"date","alias":"date_105","classPath":"java.sql.Date"},{"name":"time","alias":"time_106","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a_b.table_a_b_a
table_a_b.table_a_b_a
{"sql":"SELECT `table_a_b_1001`.`id` AS `id_101`,`table_a_b_1001`.`a_id` AS `a_id_102`,`table_a_b_1001`.`name_ar` AS `name_ar_103`,`table_a_b_1001`.`name_en` AS `name_en_104`,`table_a_b_1001`.`date` AS `date_105`,`table_a_b_1001`.`time` AS `time_106`,`table_a_b_1001`.`timestamp` AS `timestamp_107`,`table_a_b_1001`.`boolean` AS `boolean_108`,`table_a_b_a_1002`.`id` AS `id_109`,`table_a_b_a_1002`.`a_b_id` AS `a_b_id_110`,`table_a_b_a_1002`.`name_ar` AS `name_ar_111`,`table_a_b_a_1002`.`name_en` AS `name_en_112`,`table_a_b_a_1002`.`date` AS `date_113`,`table_a_b_a_1002`.`time` AS `time_114`,`table_a_b_a_1002`.`timestamp` AS `timestamp_115`,`table_a_b_a_1002`.`boolean` AS `boolean_116` FROM `parental`.`table_a_b` AS `table_a_b_1001` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1002` ON `table_a_b_1001`.`id`=`table_a_b_a_1002`.`a_b_id`","tablesPath":"table_a_b.table_a_b_a","tables":[{"name":"table_a_b","alias":"table_a_b_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_104","classPath":"java.lang.String"},{"name":"date","alias":"date_105","classPath":"java.sql.Date"},{"name":"time","alias":"time_106","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","classPath":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1002","fields":[{"name":"id","alias":"id_109","classPath":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_110","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_111","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_112","classPath":"java.lang.String"},{"name":"date","alias":"date_113","classPath":"java.sql.Date"},{"name":"time","alias":"time_114","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_115","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_116","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a.table_a_b
table_a.table_a_b
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id`","tablesPath":"table_a.table_a_b","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a.table_a_b.table_a_b_a
table_a.table_a_b.table_a_b_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115`,`table_a_b_a_1003`.`id` AS `id_116`,`table_a_b_a_1003`.`a_b_id` AS `a_b_id_117`,`table_a_b_a_1003`.`name_ar` AS `name_ar_118`,`table_a_b_a_1003`.`name_en` AS `name_en_119`,`table_a_b_a_1003`.`date` AS `date_120`,`table_a_b_a_1003`.`time` AS `time_121`,`table_a_b_a_1003`.`timestamp` AS `timestamp_122`,`table_a_b_a_1003`.`boolean` AS `boolean_123` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1003` ON `table_a_b_1002`.`id`=`table_a_b_a_1003`.`a_b_id`","tablesPath":"table_a.table_a_b.table_a_b_a","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1003","fields":[{"name":"id","alias":"id_116","classPath":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_117","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_118","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_119","classPath":"java.lang.String"},{"name":"date","alias":"date_120","classPath":"java.sql.Date"},{"name":"time","alias":"time_121","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_122","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_123","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a_b
table_a_b
{"sql":"SELECT `table_a_b_1001`.`id` AS `id_101`,`table_a_b_1001`.`a_id` AS `a_id_102`,`table_a_b_1001`.`name_ar` AS `name_ar_103`,`table_a_b_1001`.`name_en` AS `name_en_104`,`table_a_b_1001`.`date` AS `date_105`,`table_a_b_1001`.`time` AS `time_106`,`table_a_b_1001`.`timestamp` AS `timestamp_107`,`table_a_b_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_b` AS `table_a_b_1001`","tablesPath":"table_a_b","tables":[{"name":"table_a_b","alias":"table_a_b_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_104","classPath":"java.lang.String"},{"name":"date","alias":"date_105","classPath":"java.sql.Date"},{"name":"time","alias":"time_106","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a_b.table_a_b_a
table_a_b.table_a_b_a
{"sql":"SELECT `table_a_b_1001`.`id` AS `id_101`,`table_a_b_1001`.`a_id` AS `a_id_102`,`table_a_b_1001`.`name_ar` AS `name_ar_103`,`table_a_b_1001`.`name_en` AS `name_en_104`,`table_a_b_1001`.`date` AS `date_105`,`table_a_b_1001`.`time` AS `time_106`,`table_a_b_1001`.`timestamp` AS `timestamp_107`,`table_a_b_1001`.`boolean` AS `boolean_108`,`table_a_b_a_1002`.`id` AS `id_109`,`table_a_b_a_1002`.`a_b_id` AS `a_b_id_110`,`table_a_b_a_1002`.`name_ar` AS `name_ar_111`,`table_a_b_a_1002`.`name_en` AS `name_en_112`,`table_a_b_a_1002`.`date` AS `date_113`,`table_a_b_a_1002`.`time` AS `time_114`,`table_a_b_a_1002`.`timestamp` AS `timestamp_115`,`table_a_b_a_1002`.`boolean` AS `boolean_116` FROM `parental`.`table_a_b` AS `table_a_b_1001` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1002` ON `table_a_b_1001`.`id`=`table_a_b_a_1002`.`a_b_id`","tablesPath":"table_a_b.table_a_b_a","tables":[{"name":"table_a_b","alias":"table_a_b_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_104","classPath":"java.lang.String"},{"name":"date","alias":"date_105","classPath":"java.sql.Date"},{"name":"time","alias":"time_106","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","classPath":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1002","fields":[{"name":"id","alias":"id_109","classPath":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_110","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_111","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_112","classPath":"java.lang.String"},{"name":"date","alias":"date_113","classPath":"java.sql.Date"},{"name":"time","alias":"time_114","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_115","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_116","classPath":"java.lang.Integer"}]}],"recordSet":[]}

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
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115`,`table_a_b_a_1003`.`id` AS `id_116`,`table_a_b_a_1003`.`a_b_id` AS `a_b_id_117`,`table_a_b_a_1003`.`name_ar` AS `name_ar_118`,`table_a_b_a_1003`.`name_en` AS `name_en_119`,`table_a_b_a_1003`.`date` AS `date_120`,`table_a_b_a_1003`.`time` AS `time_121`,`table_a_b_a_1003`.`timestamp` AS `timestamp_122`,`table_a_b_a_1003`.`boolean` AS `boolean_123` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1003` ON `table_a_b_1002`.`id`=`table_a_b_a_1003`.`a_b_id`","tablesPath":"table_a.table_a_b.table_a_b_a","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1003","fields":[{"name":"id","alias":"id_116","classPath":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_117","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_118","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_119","classPath":"java.lang.String"},{"name":"date","alias":"date_120","classPath":"java.sql.Date"},{"name":"time","alias":"time_121","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_122","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_123","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a_b.table_a_b_a
table_a_b.table_a_b_a
{"sql":"SELECT `table_a_b_1001`.`id` AS `id_101`,`table_a_b_1001`.`a_id` AS `a_id_102`,`table_a_b_1001`.`name_ar` AS `name_ar_103`,`table_a_b_1001`.`name_en` AS `name_en_104`,`table_a_b_1001`.`date` AS `date_105`,`table_a_b_1001`.`time` AS `time_106`,`table_a_b_1001`.`timestamp` AS `timestamp_107`,`table_a_b_1001`.`boolean` AS `boolean_108`,`table_a_b_a_1002`.`id` AS `id_109`,`table_a_b_a_1002`.`a_b_id` AS `a_b_id_110`,`table_a_b_a_1002`.`name_ar` AS `name_ar_111`,`table_a_b_a_1002`.`name_en` AS `name_en_112`,`table_a_b_a_1002`.`date` AS `date_113`,`table_a_b_a_1002`.`time` AS `time_114`,`table_a_b_a_1002`.`timestamp` AS `timestamp_115`,`table_a_b_a_1002`.`boolean` AS `boolean_116` FROM `parental`.`table_a_b` AS `table_a_b_1001` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1002` ON `table_a_b_1001`.`id`=`table_a_b_a_1002`.`a_b_id`","tablesPath":"table_a_b.table_a_b_a","tables":[{"name":"table_a_b","alias":"table_a_b_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_104","classPath":"java.lang.String"},{"name":"date","alias":"date_105","classPath":"java.sql.Date"},{"name":"time","alias":"time_106","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","classPath":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1002","fields":[{"name":"id","alias":"id_109","classPath":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_110","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_111","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_112","classPath":"java.lang.String"},{"name":"date","alias":"date_113","classPath":"java.sql.Date"},{"name":"time","alias":"time_114","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_115","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_116","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a_b_a
table_a_b_a
{"sql":"SELECT `table_a_b_a_1001`.`id` AS `id_101`,`table_a_b_a_1001`.`a_b_id` AS `a_b_id_102`,`table_a_b_a_1001`.`name_ar` AS `name_ar_103`,`table_a_b_a_1001`.`name_en` AS `name_en_104`,`table_a_b_a_1001`.`date` AS `date_105`,`table_a_b_a_1001`.`time` AS `time_106`,`table_a_b_a_1001`.`timestamp` AS `timestamp_107`,`table_a_b_a_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_b_a` AS `table_a_b_a_1001`","tablesPath":"table_a_b_a","tables":[{"name":"table_a_b_a","alias":"table_a_b_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_102","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_104","classPath":"java.lang.String"},{"name":"date","alias":"date_105","classPath":"java.sql.Date"},{"name":"time","alias":"time_106","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a.table_a_b.table_a_b_a
table_a.table_a_b.table_a_b_a
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_b_1002`.`id` AS `id_108`,`table_a_b_1002`.`a_id` AS `a_id_109`,`table_a_b_1002`.`name_ar` AS `name_ar_110`,`table_a_b_1002`.`name_en` AS `name_en_111`,`table_a_b_1002`.`date` AS `date_112`,`table_a_b_1002`.`time` AS `time_113`,`table_a_b_1002`.`timestamp` AS `timestamp_114`,`table_a_b_1002`.`boolean` AS `boolean_115`,`table_a_b_a_1003`.`id` AS `id_116`,`table_a_b_a_1003`.`a_b_id` AS `a_b_id_117`,`table_a_b_a_1003`.`name_ar` AS `name_ar_118`,`table_a_b_a_1003`.`name_en` AS `name_en_119`,`table_a_b_a_1003`.`date` AS `date_120`,`table_a_b_a_1003`.`time` AS `time_121`,`table_a_b_a_1003`.`timestamp` AS `timestamp_122`,`table_a_b_a_1003`.`boolean` AS `boolean_123` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_b` AS `table_a_b_1002` ON `table_a_1001`.`id`=`table_a_b_1002`.`a_id` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1003` ON `table_a_b_1002`.`id`=`table_a_b_a_1003`.`a_b_id`","tablesPath":"table_a.table_a_b.table_a_b_a","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_b","alias":"table_a_b_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1003","fields":[{"name":"id","alias":"id_116","classPath":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_117","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_118","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_119","classPath":"java.lang.String"},{"name":"date","alias":"date_120","classPath":"java.sql.Date"},{"name":"time","alias":"time_121","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_122","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_123","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a_b.table_a_b_a
table_a_b.table_a_b_a
{"sql":"SELECT `table_a_b_1001`.`id` AS `id_101`,`table_a_b_1001`.`a_id` AS `a_id_102`,`table_a_b_1001`.`name_ar` AS `name_ar_103`,`table_a_b_1001`.`name_en` AS `name_en_104`,`table_a_b_1001`.`date` AS `date_105`,`table_a_b_1001`.`time` AS `time_106`,`table_a_b_1001`.`timestamp` AS `timestamp_107`,`table_a_b_1001`.`boolean` AS `boolean_108`,`table_a_b_a_1002`.`id` AS `id_109`,`table_a_b_a_1002`.`a_b_id` AS `a_b_id_110`,`table_a_b_a_1002`.`name_ar` AS `name_ar_111`,`table_a_b_a_1002`.`name_en` AS `name_en_112`,`table_a_b_a_1002`.`date` AS `date_113`,`table_a_b_a_1002`.`time` AS `time_114`,`table_a_b_a_1002`.`timestamp` AS `timestamp_115`,`table_a_b_a_1002`.`boolean` AS `boolean_116` FROM `parental`.`table_a_b` AS `table_a_b_1001` INNER JOIN `parental`.`table_a_b_a` AS `table_a_b_a_1002` ON `table_a_b_1001`.`id`=`table_a_b_a_1002`.`a_b_id`","tablesPath":"table_a_b.table_a_b_a","tables":[{"name":"table_a_b","alias":"table_a_b_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_104","classPath":"java.lang.String"},{"name":"date","alias":"date_105","classPath":"java.sql.Date"},{"name":"time","alias":"time_106","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","classPath":"java.lang.Integer"}]},{"name":"table_a_b_a","alias":"table_a_b_a_1002","fields":[{"name":"id","alias":"id_109","classPath":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_110","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_111","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_112","classPath":"java.lang.String"},{"name":"date","alias":"date_113","classPath":"java.sql.Date"},{"name":"time","alias":"time_114","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_115","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_116","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a_b_a
table_a_b_a
{"sql":"SELECT `table_a_b_a_1001`.`id` AS `id_101`,`table_a_b_a_1001`.`a_b_id` AS `a_b_id_102`,`table_a_b_a_1001`.`name_ar` AS `name_ar_103`,`table_a_b_a_1001`.`name_en` AS `name_en_104`,`table_a_b_a_1001`.`date` AS `date_105`,`table_a_b_a_1001`.`time` AS `time_106`,`table_a_b_a_1001`.`timestamp` AS `timestamp_107`,`table_a_b_a_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_b_a` AS `table_a_b_a_1001`","tablesPath":"table_a_b_a","tables":[{"name":"table_a_b_a","alias":"table_a_b_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"a_b_id","alias":"a_b_id_102","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_104","classPath":"java.lang.String"},{"name":"date","alias":"date_105","classPath":"java.sql.Date"},{"name":"time","alias":"time_106","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","classPath":"java.lang.Integer"}]}],"recordSet":[]}

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
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_c_1002`.`id` AS `id_108`,`table_a_c_1002`.`a_id` AS `a_id_109`,`table_a_c_1002`.`name_ar` AS `name_ar_110`,`table_a_c_1002`.`name_en` AS `name_en_111`,`table_a_c_1002`.`date` AS `date_112`,`table_a_c_1002`.`time` AS `time_113`,`table_a_c_1002`.`timestamp` AS `timestamp_114`,`table_a_c_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_c` AS `table_a_c_1002` ON `table_a_1001`.`id`=`table_a_c_1002`.`a_id`","tablesPath":"table_a.table_a_c","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_c","alias":"table_a_c_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a_c
table_a_c
{"sql":"SELECT `table_a_c_1001`.`id` AS `id_101`,`table_a_c_1001`.`a_id` AS `a_id_102`,`table_a_c_1001`.`name_ar` AS `name_ar_103`,`table_a_c_1001`.`name_en` AS `name_en_104`,`table_a_c_1001`.`date` AS `date_105`,`table_a_c_1001`.`time` AS `time_106`,`table_a_c_1001`.`timestamp` AS `timestamp_107`,`table_a_c_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_c` AS `table_a_c_1001`","tablesPath":"table_a_c","tables":[{"name":"table_a_c","alias":"table_a_c_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_104","classPath":"java.lang.String"},{"name":"date","alias":"date_105","classPath":"java.sql.Date"},{"name":"time","alias":"time_106","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a.table_a_c
table_a.table_a_c
{"sql":"SELECT `table_a_1001`.`id` AS `id_101`,`table_a_1001`.`name_ar` AS `name_ar_102`,`table_a_1001`.`name_en` AS `name_en_103`,`table_a_1001`.`date` AS `date_104`,`table_a_1001`.`time` AS `time_105`,`table_a_1001`.`timestamp` AS `timestamp_106`,`table_a_1001`.`boolean` AS `boolean_107`,`table_a_c_1002`.`id` AS `id_108`,`table_a_c_1002`.`a_id` AS `a_id_109`,`table_a_c_1002`.`name_ar` AS `name_ar_110`,`table_a_c_1002`.`name_en` AS `name_en_111`,`table_a_c_1002`.`date` AS `date_112`,`table_a_c_1002`.`time` AS `time_113`,`table_a_c_1002`.`timestamp` AS `timestamp_114`,`table_a_c_1002`.`boolean` AS `boolean_115` FROM `parental`.`table_a` AS `table_a_1001` INNER JOIN `parental`.`table_a_c` AS `table_a_c_1002` ON `table_a_1001`.`id`=`table_a_c_1002`.`a_id`","tablesPath":"table_a.table_a_c","tables":[{"name":"table_a","alias":"table_a_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_102","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_103","classPath":"java.lang.String"},{"name":"date","alias":"date_104","classPath":"java.sql.Date"},{"name":"time","alias":"time_105","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_106","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_107","classPath":"java.lang.Integer"}]},{"name":"table_a_c","alias":"table_a_c_1002","fields":[{"name":"id","alias":"id_108","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_109","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_110","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_111","classPath":"java.lang.String"},{"name":"date","alias":"date_112","classPath":"java.sql.Date"},{"name":"time","alias":"time_113","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_114","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_115","classPath":"java.lang.Integer"}]}],"recordSet":[]}

table_a_c
table_a_c
{"sql":"SELECT `table_a_c_1001`.`id` AS `id_101`,`table_a_c_1001`.`a_id` AS `a_id_102`,`table_a_c_1001`.`name_ar` AS `name_ar_103`,`table_a_c_1001`.`name_en` AS `name_en_104`,`table_a_c_1001`.`date` AS `date_105`,`table_a_c_1001`.`time` AS `time_106`,`table_a_c_1001`.`timestamp` AS `timestamp_107`,`table_a_c_1001`.`boolean` AS `boolean_108` FROM `parental`.`table_a_c` AS `table_a_c_1001`","tablesPath":"table_a_c","tables":[{"name":"table_a_c","alias":"table_a_c_1001","fields":[{"name":"id","alias":"id_101","classPath":"java.lang.Integer"},{"name":"a_id","alias":"a_id_102","classPath":"java.lang.Integer"},{"name":"name_ar","alias":"name_ar_103","classPath":"java.lang.String"},{"name":"name_en","alias":"name_en_104","classPath":"java.lang.String"},{"name":"date","alias":"date_105","classPath":"java.sql.Date"},{"name":"time","alias":"time_106","classPath":"java.sql.Time"},{"name":"timestamp","alias":"timestamp_107","classPath":"java.sql.Timestamp"},{"name":"boolean","alias":"boolean_108","classPath":"java.lang.Integer"}]}],"recordSet":[]}

Table [tree_model][Parent Paths]
Table [tree_model][All Paths]
|...tree_model.
|...tree_model.
Table [tree_model][All Paths Inner Joined]
tree_model
tree_model
{"sql":"SELECT `tree_model_1001`.`node_id` AS `node_id_101` FROM `parental`.`tree_model` AS `tree_model_1001`","tablesPath":"tree_model","tables":[{"name":"tree_model","alias":"tree_model_1001","fields":[{"name":"node_id","alias":"node_id_101","classPath":"java.lang.Integer"}]}],"recordSet":[]}

tree_model
tree_model
{"sql":"SELECT `tree_model_1001`.`node_id` AS `node_id_101` FROM `parental`.`tree_model` AS `tree_model_1001`","tablesPath":"tree_model","tables":[{"name":"tree_model","alias":"tree_model_1001","fields":[{"name":"node_id","alias":"node_id_101","classPath":"java.lang.Integer"}]}],"recordSet":[]}

{"name":"parental","database_engine":"mysql","database_url":"jdbc:mysql://localhost:33060/parental","case_sensitive_sql":true,"databases":[{"name":"parental","engine":"mysql","tables":[{"name":"compound_key","rows":0,"fields":[{"name":"auto_id","dataTypeName":"INT UNSIGNED","primary_key":true,"nullable":false,"autoIncrment":true,"foreign_reference":false,"list_order":1,"size":10,"decimalDigits":0},{"name":"string_key","dataTypeName":"VARCHAR","primary_key":false,"nullable":false,"autoIncrment":false,"foreign_reference":false,"list_order":2,"size":128,"decimalDigits":0},{"name":"some_data","dataTypeName":"VARCHAR","primary_key":false,"nullable":false,"autoIncrment":false,"foreign_reference":false,"list_order":3,"size":256,"decimalDigits":0}],"primaryKeys":[{"name":"PRIMARY","primary_key_field_list":[{"name":"auto_id"}]}],"foreignKeys":[],"childTables":[]},{"name":"fact_master","rows":0,"fields":[{"name":"fact_master_id","dataTypeName":"INT UNSIGNED","primary_key":true,"nullable":false,"autoIncrment":true,"foreign_reference":false,"list_order":1,"size":10,"decimalDigits":0},{"name":"fact_master_data","dataTypeName":"VARCHAR","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":2,"size":45,"decimalDigits":0}],"primaryKeys":[{"name":"PRIMARY","primary_key_field_list":[{"name":"fact_master_id"}]}],"foreignKeys":[],"childTables":[{"tableName":"fact_transaction","parentTableName":"fact_master","foreigKeyName":"fk_fact_transaction_01"},{"tableName":"fact_transaction","parentTableName":"fact_master","foreigKeyName":"fk_fact_transaction_02"}]},{"name":"fact_transaction","rows":0,"fields":[{"name":"fact_transaction_id","dataTypeName":"INT UNSIGNED","primary_key":true,"nullable":false,"autoIncrment":true,"foreign_reference":false,"list_order":1,"size":10,"decimalDigits":0},{"name":"fact_master_a_id","dataTypeName":"INT UNSIGNED","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":2,"size":10,"decimalDigits":0},{"name":"fact_master_b_id","dataTypeName":"INT UNSIGNED","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":3,"size":10,"decimalDigits":0},{"name":"fact_transaction_data","dataTypeName":"DECIMAL","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":4,"size":18,"decimalDigits":6}],"primaryKeys":[{"name":"PRIMARY","primary_key_field_list":[{"name":"fact_transaction_id"}]}],"foreignKeys":[{"name":"fk_fact_transaction_01","referencedKeyname":"PRIMARY","foreignKeyTableName":"fact_transaction","referencedKeyTableName":"fact_master","foreignKeyFields":[{"name":"fact_master_id"}],"referencedKeyFields":[{"name":"fact_master_a_id"}],"key_sequence":1,"update_rule":"1","delete_rule":"1","deferrability":"7"},{"name":"fk_fact_transaction_02","referencedKeyname":"PRIMARY","foreignKeyTableName":"fact_transaction","referencedKeyTableName":"fact_master","foreignKeyFields":[{"name":"fact_master_id"}],"referencedKeyFields":[{"name":"fact_master_b_id"}],"key_sequence":1,"update_rule":"1","delete_rule":"1","deferrability":"7"}],"childTables":[]},{"name":"table_a","rows":0,"fields":[{"name":"id","dataTypeName":"INT UNSIGNED","primary_key":true,"nullable":false,"autoIncrment":true,"foreign_reference":false,"list_order":1,"size":10,"decimalDigits":0},{"name":"name_ar","dataTypeName":"VARCHAR","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":2,"size":45,"decimalDigits":0},{"name":"name_en","dataTypeName":"VARCHAR","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":3,"size":45,"decimalDigits":0},{"name":"date","dataTypeName":"DATE","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":4,"size":10,"decimalDigits":0},{"name":"time","dataTypeName":"TIME","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":5,"size":8,"decimalDigits":0},{"name":"timestamp","dataTypeName":"TIMESTAMP","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":6,"size":19,"decimalDigits":0},{"name":"boolean","dataTypeName":"BIT","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":7,"size":1,"decimalDigits":0}],"primaryKeys":[{"name":"PRIMARY","primary_key_field_list":[{"name":"id"}]}],"foreignKeys":[],"childTables":[{"tableName":"table_a_a","parentTableName":"table_a","foreigKeyName":"fk_table_a_a_1"},{"tableName":"table_a_b","parentTableName":"table_a","foreigKeyName":"fk_table_a_b_1"},{"tableName":"table_a_c","parentTableName":"table_a","foreigKeyName":"fk_table_a_c_1"}]},{"name":"table_a_a","rows":0,"fields":[{"name":"id","dataTypeName":"INT UNSIGNED","primary_key":true,"nullable":false,"autoIncrment":true,"foreign_reference":true,"list_order":1,"size":10,"decimalDigits":0},{"name":"a_id","dataTypeName":"INT UNSIGNED","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":2,"size":10,"decimalDigits":0},{"name":"name_ar","dataTypeName":"VARCHAR","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":3,"size":45,"decimalDigits":0},{"name":"name_en","dataTypeName":"VARCHAR","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":4,"size":45,"decimalDigits":0},{"name":"date","dataTypeName":"DATE","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":5,"size":10,"decimalDigits":0},{"name":"time","dataTypeName":"TIME","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":6,"size":8,"decimalDigits":0},{"name":"timestamp","dataTypeName":"TIMESTAMP","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":7,"size":19,"decimalDigits":0},{"name":"boolean","dataTypeName":"BIT","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":8,"size":1,"decimalDigits":0}],"primaryKeys":[{"name":"PRIMARY","primary_key_field_list":[{"name":"id"}]}],"foreignKeys":[{"name":"fk_table_a_a_1","referencedKeyname":"PRIMARY","foreignKeyTableName":"table_a_a","referencedKeyTableName":"table_a","foreignKeyFields":[{"name":"id"}],"referencedKeyFields":[{"name":"a_id"}],"key_sequence":1,"update_rule":"1","delete_rule":"1","deferrability":"7"}],"childTables":[]},{"name":"table_a_b","rows":0,"fields":[{"name":"id","dataTypeName":"INT UNSIGNED","primary_key":true,"nullable":false,"autoIncrment":true,"foreign_reference":true,"list_order":1,"size":10,"decimalDigits":0},{"name":"a_id","dataTypeName":"INT UNSIGNED","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":2,"size":10,"decimalDigits":0},{"name":"name_ar","dataTypeName":"VARCHAR","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":3,"size":45,"decimalDigits":0},{"name":"name_en","dataTypeName":"VARCHAR","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":4,"size":45,"decimalDigits":0},{"name":"date","dataTypeName":"DATE","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":5,"size":10,"decimalDigits":0},{"name":"time","dataTypeName":"TIME","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":6,"size":8,"decimalDigits":0},{"name":"timestamp","dataTypeName":"TIMESTAMP","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":7,"size":19,"decimalDigits":0},{"name":"boolean","dataTypeName":"BIT","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":8,"size":1,"decimalDigits":0}],"primaryKeys":[{"name":"PRIMARY","primary_key_field_list":[{"name":"id"}]}],"foreignKeys":[{"name":"fk_table_a_b_1","referencedKeyname":"PRIMARY","foreignKeyTableName":"table_a_b","referencedKeyTableName":"table_a","foreignKeyFields":[{"name":"id"}],"referencedKeyFields":[{"name":"a_id"}],"key_sequence":1,"update_rule":"1","delete_rule":"1","deferrability":"7"}],"childTables":[{"tableName":"table_a_b_a","parentTableName":"table_a_b","foreigKeyName":"fk_table_a_b_a_1"}]},{"name":"table_a_b_a","rows":0,"fields":[{"name":"id","dataTypeName":"INT UNSIGNED","primary_key":true,"nullable":false,"autoIncrment":true,"foreign_reference":true,"list_order":1,"size":10,"decimalDigits":0},{"name":"a_b_id","dataTypeName":"INT UNSIGNED","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":2,"size":10,"decimalDigits":0},{"name":"name_ar","dataTypeName":"VARCHAR","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":3,"size":45,"decimalDigits":0},{"name":"name_en","dataTypeName":"VARCHAR","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":4,"size":45,"decimalDigits":0},{"name":"date","dataTypeName":"DATE","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":5,"size":10,"decimalDigits":0},{"name":"time","dataTypeName":"TIME","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":6,"size":8,"decimalDigits":0},{"name":"timestamp","dataTypeName":"TIMESTAMP","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":7,"size":19,"decimalDigits":0},{"name":"boolean","dataTypeName":"BIT","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":8,"size":1,"decimalDigits":0}],"primaryKeys":[{"name":"PRIMARY","primary_key_field_list":[{"name":"id"}]}],"foreignKeys":[{"name":"fk_table_a_b_a_1","referencedKeyname":"PRIMARY","foreignKeyTableName":"table_a_b_a","referencedKeyTableName":"table_a_b","foreignKeyFields":[{"name":"id"}],"referencedKeyFields":[{"name":"a_b_id"}],"key_sequence":1,"update_rule":"1","delete_rule":"1","deferrability":"7"}],"childTables":[]},{"name":"table_a_c","rows":0,"fields":[{"name":"id","dataTypeName":"INT UNSIGNED","primary_key":true,"nullable":false,"autoIncrment":true,"foreign_reference":true,"list_order":1,"size":10,"decimalDigits":0},{"name":"a_id","dataTypeName":"INT UNSIGNED","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":2,"size":10,"decimalDigits":0},{"name":"name_ar","dataTypeName":"VARCHAR","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":3,"size":45,"decimalDigits":0},{"name":"name_en","dataTypeName":"VARCHAR","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":4,"size":45,"decimalDigits":0},{"name":"date","dataTypeName":"DATE","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":5,"size":10,"decimalDigits":0},{"name":"time","dataTypeName":"TIME","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":6,"size":8,"decimalDigits":0},{"name":"timestamp","dataTypeName":"TIMESTAMP","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":7,"size":19,"decimalDigits":0},{"name":"boolean","dataTypeName":"BIT","primary_key":false,"nullable":true,"autoIncrment":false,"foreign_reference":false,"list_order":8,"size":1,"decimalDigits":0}],"primaryKeys":[{"name":"PRIMARY","primary_key_field_list":[{"name":"id"}]}],"foreignKeys":[{"name":"fk_table_a_c_1","referencedKeyname":"PRIMARY","foreignKeyTableName":"table_a_c","referencedKeyTableName":"table_a","foreignKeyFields":[{"name":"id"}],"referencedKeyFields":[{"name":"a_id"}],"key_sequence":1,"update_rule":"1","delete_rule":"1","deferrability":"7"}],"childTables":[]},{"name":"tree_model","rows":0,"fields":[{"name":"node_id","dataTypeName":"INT UNSIGNED","primary_key":true,"nullable":false,"autoIncrment":true,"foreign_reference":false,"list_order":1,"size":10,"decimalDigits":0}],"primaryKeys":[{"name":"PRIMARY","primary_key_field_list":[{"name":"node_id"}]}],"foreignKeys":[],"childTables":[]}],"java_package_name":"net.reyadeyat.relational.api.model"}]}Model: parental
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
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #1]
                        F-[name]-"auto_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #2]
                        F-[name]-"string_key"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"128"
                        F-[decimalDigits]-"0"
                  T-[Field #3]
                        F-[name]-"some_data"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"3"
                        F-[size]-"256"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #1]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #1]
                              F-[name]-"auto_id"
            T-[Table #2]
                  F-[name]-"fact_master"
                  F-[rows]-"0"
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #4]
                        F-[name]-"fact_master_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #5]
                        F-[name]-"fact_master_data"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #2]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #2]
                              F-[name]-"fact_master_id"
                  T-[ChildTable #1]
                        F-[tableName]-"fact_transaction"
                        F-[parentTableName]-"fact_master"
                        F-[foreigKeyName]-"fk_fact_transaction_01"
                  T-[ChildTable #2]
                        F-[tableName]-"fact_transaction"
                        F-[parentTableName]-"fact_master"
                        F-[foreigKeyName]-"fk_fact_transaction_02"
            T-[Table #3]
                  F-[name]-"fact_transaction"
                  F-[rows]-"0"
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #6]
                        F-[name]-"fact_transaction_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #7]
                        F-[name]-"fact_master_a_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #8]
                        F-[name]-"fact_master_b_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"3"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #9]
                        F-[name]-"fact_transaction_data"
                        F-[dataTypeName]-"DECIMAL"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"4"
                        F-[size]-"18"
                        F-[decimalDigits]-"6"
                  T-[PrimaryKey #3]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #3]
                              F-[name]-"fact_transaction_id"
                  T-[ForeignKey #1]
                        F-[name]-"fk_fact_transaction_01"
                        F-[referencedKeyname]-"PRIMARY"
                        F-[foreignKeyTableName]-"fact_transaction"
                        F-[referencedKeyTableName]-"fact_master"
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
                        F-[referencedKeyname]-"PRIMARY"
                        F-[foreignKeyTableName]-"fact_transaction"
                        F-[referencedKeyTableName]-"fact_master"
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
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #10]
                        F-[name]-"id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #11]
                        F-[name]-"name_ar"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #12]
                        F-[name]-"name_en"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #13]
                        F-[name]-"date"
                        F-[dataTypeName]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"4"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #14]
                        F-[name]-"time"
                        F-[dataTypeName]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"5"
                        F-[size]-"8"
                        F-[decimalDigits]-"0"
                  T-[Field #15]
                        F-[name]-"timestamp"
                        F-[dataTypeName]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"6"
                        F-[size]-"19"
                        F-[decimalDigits]-"0"
                  T-[Field #16]
                        F-[name]-"boolean"
                        F-[dataTypeName]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"7"
                        F-[size]-"1"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #4]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #4]
                              F-[name]-"id"
                  T-[ChildTable #3]
                        F-[tableName]-"table_a_a"
                        F-[parentTableName]-"table_a"
                        F-[foreigKeyName]-"fk_table_a_a_1"
                  T-[ChildTable #4]
                        F-[tableName]-"table_a_b"
                        F-[parentTableName]-"table_a"
                        F-[foreigKeyName]-"fk_table_a_b_1"
                  T-[ChildTable #5]
                        F-[tableName]-"table_a_c"
                        F-[parentTableName]-"table_a"
                        F-[foreigKeyName]-"fk_table_a_c_1"
            T-[Table #5]
                  F-[name]-"table_a_a"
                  F-[rows]-"0"
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #17]
                        F-[name]-"id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"true"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #18]
                        F-[name]-"a_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #19]
                        F-[name]-"name_ar"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #20]
                        F-[name]-"name_en"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #21]
                        F-[name]-"date"
                        F-[dataTypeName]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #22]
                        F-[name]-"time"
                        F-[dataTypeName]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimalDigits]-"0"
                  T-[Field #23]
                        F-[name]-"timestamp"
                        F-[dataTypeName]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimalDigits]-"0"
                  T-[Field #24]
                        F-[name]-"boolean"
                        F-[dataTypeName]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #5]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #5]
                              F-[name]-"id"
                  T-[ForeignKey #3]
                        F-[name]-"fk_table_a_a_1"
                        F-[referencedKeyname]-"PRIMARY"
                        F-[foreignKeyTableName]-"table_a_a"
                        F-[referencedKeyTableName]-"table_a"
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
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #25]
                        F-[name]-"id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"true"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #26]
                        F-[name]-"a_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #27]
                        F-[name]-"name_ar"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #28]
                        F-[name]-"name_en"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #29]
                        F-[name]-"date"
                        F-[dataTypeName]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #30]
                        F-[name]-"time"
                        F-[dataTypeName]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimalDigits]-"0"
                  T-[Field #31]
                        F-[name]-"timestamp"
                        F-[dataTypeName]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimalDigits]-"0"
                  T-[Field #32]
                        F-[name]-"boolean"
                        F-[dataTypeName]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #6]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #6]
                              F-[name]-"id"
                  T-[ForeignKey #4]
                        F-[name]-"fk_table_a_b_1"
                        F-[referencedKeyname]-"PRIMARY"
                        F-[foreignKeyTableName]-"table_a_b"
                        F-[referencedKeyTableName]-"table_a"
                        F-[key_sequence]-"1"
                        F-[update_rule]-"1"
                        F-[delete_rule]-"1"
                        F-[deferrability]-"7"
                        T-[ForeignKeyField #4]
                              F-[name]-"id"
                        T-[ReferencedKeyField #4]
                              F-[name]-"a_id"
                  T-[ChildTable #6]
                        F-[tableName]-"table_a_b_a"
                        F-[parentTableName]-"table_a_b"
                        F-[foreigKeyName]-"fk_table_a_b_a_1"
            T-[Table #7]
                  F-[name]-"table_a_b_a"
                  F-[rows]-"0"
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #33]
                        F-[name]-"id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"true"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #34]
                        F-[name]-"a_b_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #35]
                        F-[name]-"name_ar"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #36]
                        F-[name]-"name_en"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #37]
                        F-[name]-"date"
                        F-[dataTypeName]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #38]
                        F-[name]-"time"
                        F-[dataTypeName]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimalDigits]-"0"
                  T-[Field #39]
                        F-[name]-"timestamp"
                        F-[dataTypeName]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimalDigits]-"0"
                  T-[Field #40]
                        F-[name]-"boolean"
                        F-[dataTypeName]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #7]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #7]
                              F-[name]-"id"
                  T-[ForeignKey #5]
                        F-[name]-"fk_table_a_b_a_1"
                        F-[referencedKeyname]-"PRIMARY"
                        F-[foreignKeyTableName]-"table_a_b_a"
                        F-[referencedKeyTableName]-"table_a_b"
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
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #41]
                        F-[name]-"id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"true"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #42]
                        F-[name]-"a_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #43]
                        F-[name]-"name_ar"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #44]
                        F-[name]-"name_en"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #45]
                        F-[name]-"date"
                        F-[dataTypeName]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #46]
                        F-[name]-"time"
                        F-[dataTypeName]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimalDigits]-"0"
                  T-[Field #47]
                        F-[name]-"timestamp"
                        F-[dataTypeName]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimalDigits]-"0"
                  T-[Field #48]
                        F-[name]-"boolean"
                        F-[dataTypeName]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #8]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #8]
                              F-[name]-"id"
                  T-[ForeignKey #6]
                        F-[name]-"fk_table_a_c_1"
                        F-[referencedKeyname]-"PRIMARY"
                        F-[foreignKeyTableName]-"table_a_c"
                        F-[referencedKeyTableName]-"table_a"
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
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #49]
                        F-[name]-"node_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #9]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #9]
                              F-[name]-"node_id"
Add Inert Batch
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.Field',49) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=49
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.ForeignKeyField',6) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=6
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.ChildTable',6) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=6
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.PrimaryKey',9) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=9
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.PrimaryKeyField',9) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=9
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.Table',9) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=9
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.Database',1) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=1
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.Enterprise',1) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=1
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.ForeignKey',6) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=6
INSERT INTO `model`.`model_sequence`(`model_id`, `model_instance_id`,`model_class_path`,`model_instance_sequence_last_value`)VALUES(500,1,'net.reyadeyat.relational.api.model.ReferencedKeyField',6) ON DUPLICATE KEY UPDATE `model_instance_sequence_last_value`=6

*sql*
INSERT INTO `model`.`enterprise`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`database_engine`,`database_url`,`case_sensitive_sql`) VALUES (500,1,1,0,'enterprise','Enterprise','{""name"":""parental"",""database_engine"":""mysql"",""database_url"":""jdbc:mysql://localhost:33060/parental"",""case_sensitive_sql"":true,""databases"":[{""name"":""parental"",""engine"":""mysql"",""tables"":[{""name"":""compound_key"",""rows"":0,""fields"":[{""name"":""auto_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""string_key"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":false,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":128,""decimalDigits"":0},{""name"":""some_data"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":false,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":256,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""auto_id""}]}],""foreignKeys"":[],""childTables"":[]},{""name"":""fact_master"",""rows"":0,""fields"":[{""name"":""fact_master_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""fact_master_data"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_master_id""}]}],""foreignKeys"":[],""childTables"":[{""tableName"":""fact_transaction"",""parentTableName"":""fact_master"",""foreigKeyName"":""fk_fact_transaction_01""},{""tableName"":""fact_transaction"",""parentTableName"":""fact_master"",""foreigKeyName"":""fk_fact_transaction_02""}]},{""name"":""fact_transaction"",""rows"":0,""fields"":[{""name"":""fact_transaction_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""fact_master_a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""fact_master_b_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":10,""decimalDigits"":0},{""name"":""fact_transaction_data"",""dataTypeName"":""DECIMAL"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":18,""decimalDigits"":6}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_transaction_id""}]}],""foreignKeys"":[{""name"":""fk_fact_transaction_01"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""fact_transaction"",""referencedKeyTableName"":""fact_master"",""foreignKeyFields"":[{""name"":""fact_master_id""}],""referencedKeyFields"":[{""name"":""fact_master_a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""},{""name"":""fk_fact_transaction_02"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""fact_transaction"",""referencedKeyTableName"":""fact_master"",""foreignKeyFields"":[{""name"":""fact_master_id""}],""referencedKeyFields"":[{""name"":""fact_master_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[]},{""name"":""table_a"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[],""childTables"":[{""tableName"":""table_a_a"",""parentTableName"":""table_a"",""foreigKeyName"":""fk_table_a_a_1""},{""tableName"":""table_a_b"",""parentTableName"":""table_a"",""foreigKeyName"":""fk_table_a_b_1""},{""tableName"":""table_a_c"",""parentTableName"":""table_a"",""foreigKeyName"":""fk_table_a_c_1""}]},{""name"":""table_a_a"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[{""name"":""fk_table_a_a_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_a"",""referencedKeyTableName"":""table_a"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[]},{""name"":""table_a_b"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[{""name"":""fk_table_a_b_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_b"",""referencedKeyTableName"":""table_a"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[{""tableName"":""table_a_b_a"",""parentTableName"":""table_a_b"",""foreigKeyName"":""fk_table_a_b_a_1""}]},{""name"":""table_a_b_a"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""a_b_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[{""name"":""fk_table_a_b_a_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_b_a"",""referencedKeyTableName"":""table_a_b"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[]},{""name"":""table_a_c"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[{""name"":""fk_table_a_c_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_c"",""referencedKeyTableName"":""table_a"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[]},{""name"":""tree_model"",""rows"":0,""fields"":[{""name"":""node_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""node_id""}]}],""foreignKeys"":[],""childTables"":[]}],""java_package_name"":""net.reyadeyat.relational.api.model""}]}',"parental","mysql","jdbc:mysql://localhost:33060/parental",true)

*sql*
INSERT INTO `model`.`database`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`engine`,`java_package_name`) VALUES (500,1,1,1,'databases','Database','{""name"":""parental"",""engine"":""mysql"",""tables"":[{""name"":""compound_key"",""rows"":0,""fields"":[{""name"":""auto_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""string_key"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":false,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":128,""decimalDigits"":0},{""name"":""some_data"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":false,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":256,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""auto_id""}]}],""foreignKeys"":[],""childTables"":[]},{""name"":""fact_master"",""rows"":0,""fields"":[{""name"":""fact_master_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""fact_master_data"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_master_id""}]}],""foreignKeys"":[],""childTables"":[{""tableName"":""fact_transaction"",""parentTableName"":""fact_master"",""foreigKeyName"":""fk_fact_transaction_01""},{""tableName"":""fact_transaction"",""parentTableName"":""fact_master"",""foreigKeyName"":""fk_fact_transaction_02""}]},{""name"":""fact_transaction"",""rows"":0,""fields"":[{""name"":""fact_transaction_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""fact_master_a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""fact_master_b_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":10,""decimalDigits"":0},{""name"":""fact_transaction_data"",""dataTypeName"":""DECIMAL"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":18,""decimalDigits"":6}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_transaction_id""}]}],""foreignKeys"":[{""name"":""fk_fact_transaction_01"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""fact_transaction"",""referencedKeyTableName"":""fact_master"",""foreignKeyFields"":[{""name"":""fact_master_id""}],""referencedKeyFields"":[{""name"":""fact_master_a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""},{""name"":""fk_fact_transaction_02"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""fact_transaction"",""referencedKeyTableName"":""fact_master"",""foreignKeyFields"":[{""name"":""fact_master_id""}],""referencedKeyFields"":[{""name"":""fact_master_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[]},{""name"":""table_a"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[],""childTables"":[{""tableName"":""table_a_a"",""parentTableName"":""table_a"",""foreigKeyName"":""fk_table_a_a_1""},{""tableName"":""table_a_b"",""parentTableName"":""table_a"",""foreigKeyName"":""fk_table_a_b_1""},{""tableName"":""table_a_c"",""parentTableName"":""table_a"",""foreigKeyName"":""fk_table_a_c_1""}]},{""name"":""table_a_a"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[{""name"":""fk_table_a_a_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_a"",""referencedKeyTableName"":""table_a"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[]},{""name"":""table_a_b"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[{""name"":""fk_table_a_b_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_b"",""referencedKeyTableName"":""table_a"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[{""tableName"":""table_a_b_a"",""parentTableName"":""table_a_b"",""foreigKeyName"":""fk_table_a_b_a_1""}]},{""name"":""table_a_b_a"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""a_b_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[{""name"":""fk_table_a_b_a_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_b_a"",""referencedKeyTableName"":""table_a_b"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[]},{""name"":""table_a_c"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[{""name"":""fk_table_a_c_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_c"",""referencedKeyTableName"":""table_a"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[]},{""name"":""tree_model"",""rows"":0,""fields"":[{""name"":""node_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""node_id""}]}],""foreignKeys"":[],""childTables"":[]}],""java_package_name"":""net.reyadeyat.relational.api.model""}',"parental","mysql","net.reyadeyat.relational.api.model")

*sql*
INSERT INTO `model`.`table`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,1,1,'tables','Table','{""name"":""compound_key"",""rows"":0,""fields"":[{""name"":""auto_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""string_key"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":false,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":128,""decimalDigits"":0},{""name"":""some_data"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":false,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":256,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""auto_id""}]}],""foreignKeys"":[],""childTables"":[]}',"compound_key",0,"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class CompoundKey {
    public Integer auto_id;
    public String string_key;
    public String some_data;

    public CompoundKey(
        Integer auto_id,
        String string_key,
        String some_data
    ) {
        this.auto_id = auto_id;
        this.string_key = string_key;
        this.some_data = some_data;
    }
}
","export class CompoundKey extends RecordControl {
    auto_id?: number;
    string_key?: string;
    some_data?: string;

    constructor(
        auto_id?: number,
        string_key?: string,
        some_data?: string
    ) {
		super();
        this.auto_id = auto_id;
        this.string_key = string_key;
        this.some_data = some_data;
    
    }
    
    equals(compound_key: CompoundKey) {
        return compound_key != null
        && this.auto_id == compound_key.auto_id;
    }
    
    static fromJSON(json: any) : CompoundKey {
        return new CompoundKey(
            json.auto_id,
            json.string_key,
            json.some_data
        );
    }
    
    static fromJSONObjectList(json: any) : CompoundKey {
        return new CompoundKey(
            json.auto_id,
            json.string_key,
            json.some_data
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            auto_id: this.auto_id,
            string_key: this.string_key,
            some_data: this.some_data
        };
    }
    
}
","	insertCompoundKey(compound_key: CompoundKey[]) {
		this.insert_compound_key_record_list.push(compound_key);
		let servlet_url: string = Constants.tariff_url + \"/compound_key\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					auto_id: compound_key.auto_id,
					string_key: compound_key.string_key,
					some_data: compound_key.some_data

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_compound_key\", servlet_url, request, http_headers, http_parameters);
	}

	selectCompoundKey(compound_key: CompoundKey[]) {
		let servlet_url: string = Constants.tariff_url + \"/compound_key\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"auto_id\",
				\"string_key\",
				\"some_data\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_compound_key\", servlet_url, request, http_headers, http_parameters);
	}

	updateCompoundKey(compound_key: CompoundKey[]) {
		let servlet_url: string = Constants.tariff_url + \"/compound_key\";
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
					auto_id: compound_key.auto_id,
					string_key: compound_key.string_key,
					some_data: compound_key.some_data

				}
			],
			where: {
				clause: \"\",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_compound_key\", servlet_url, request, http_headers, http_parameters);
	}

	deleteCompoundKey(compound_key: CompoundKey[]) {
		let servlet_url: string = Constants.tariff_url + \"/compound_key\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					auto_id: compound_key.auto_id,
					string_key: compound_key.string_key,
					some_data: compound_key.some_data

				}
			],
			where: {
			  clause: \"\",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_compound_key\", servlet_url, request, http_headers, http_parameters);
	}

	compound_key_list: CompoundKey[] = [];
	selected_compound_key_option: CompoundKey;
	selected_compound_key_record: CompoundKey;

	insert_compound_key_record_list: CompoundKey[] = [];
	update_compound_key_record_list: CompoundKey[] = [];
	delete_compound_key_record_list: CompoundKey[] = [];

	//selected_compound_key_list_icon: any = blank_icon;
	
	} else if (key === \"insert_compound_key\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_compound_key_record_list.length; i++) {
			this.compound_key_list.push(this.insert_compound_key_record_list[i]);
		}
		this.insert_compound_key_record_list = [];
		this.compound_key_table_data_source.data = this.compound_key_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_compound_key\") {
		let resultset: any[] = response.resultset;
		this.compound_key_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.compound_key_list.push(CompoundKey.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.compound_key_list[i].compound_key_icon);
		}

		this.compound_key_table_data_source.data = this.compound_key_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_compound_key\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_compound_key\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- compound_key Form Controls ---------------------

	compound_key_form: FormGroup;
	auto_id_control: FormControl;
	string_key_control: FormControl;
	some_data_control: FormControl;






	constructor() {

	this.auto_id_control = new FormControl([]);
	this.string_key_control = new FormControl([]);
	this.some_data_control = new FormControl([]);







	this.compound_key_form = form_builder.group({
		compound_key_group: form_builder.group({
			auto_id: this.auto_id_control,
			string_key: this.string_key_control,
			some_data: this.some_data_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedCompoundKeyRecord(selected_compound_key_record: CompoundKey) {
		this.selected_compound_key_record = selected_compound_key_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.compound_key.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"compound_key_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"compound_key_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box auto_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"auto_id\" matInput type=\"number\"
					placeholder=\"{{i18.compound_key.auto_id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('compound_key_group.auto_id') === false }\" />
				<div *ngIf=\"isModified('compound_key_group.auto_id') && isValid('compound_key_group.auto_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('compound_key_group.auto_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box string_key -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"string_key\" matInput type=\"string\"
					placeholder=\"{{i18.compound_key.string_key}}\"
					required=\"true\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('compound_key_group.string_key') === false }\" />
				<div *ngIf=\"isModified('compound_key_group.string_key') && isValid('compound_key_group.string_key') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('compound_key_group.string_key')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box some_data -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"some_data\" matInput type=\"string\"
					placeholder=\"{{i18.compound_key.some_data}}\"
					required=\"true\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('compound_key_group.some_data') === false }\" />
				<div *ngIf=\"isModified('compound_key_group.some_data') && isValid('compound_key_group.some_data') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('compound_key_group.some_data')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.CompoundKey.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.CompoundKey.title}}-->
	<img *ngIf=\"selected_compound_key_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_compound_key_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_compound_key_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_compound_key_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_compound_key_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
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
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.compound_key_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.compound_key_list.length-1\" (click)=\"lastRecord()\">
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



------------------ compound_key Form HTML Controls ---------------

","

----------- compound_key MAT Table Controls ---------------------

	compound_key_table_data_source: MatTableDataSource<CompoundKey>;
	compound_key_table_columns: string[] = [
		\"auto_id\",
		\"string_key\",
		\"some_data\"


		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.compound_key_list = [];
		this.compound_key_table_data_source = new MatTableDataSource(this.compound_key_list);
		this.compound_key_table_data_source.data = this.compound_key_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"compound_key_table_data_source\" [dir]=\"direction\">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let compound_key_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(compound_key_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let compound_key_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(compound_key_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"compound_key_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let compound_key_record; columns: compound_key_table_columns\"></mat-row>
</mat-table>
------------------ compound_key MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"auto_id\": \"INT UNSIGNED\",
      \"string_key\": \"VARCHAR\",
      \"some_data\": \"VARCHAR\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"auto_id\",
    \"string_key\",
    \"some_data\"
  ],
  \"where\": {
    \"clause\": \"auto_id>?\",
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
      \"auto_id\": \"INT UNSIGNED\",
      \"string_key\": \"VARCHAR\",
      \"some_data\": \"VARCHAR\"
    }
  ],
  \"where\": {
    \"clause\": \"auto_id=?\",
    \"fields\": [
      \"auto_id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"auto_id\": \"INT UNSIGNED\",
      \"string_key\": \"VARCHAR\",
      \"some_data\": \"VARCHAR\"
    }
  ],
  \"where\": {
    \"clause\": \"auto_id=?\",
    \"fields\": [
      \"auto_id\"
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
@WebServlet(\"/compound_key\")
public class CompoundKey extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Compound Key\", \"parental\", \"parental\", \"compound_key\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"auto_id\", FieldType.Integer, false, false, \"auto_id\").setPrimaryKeyAI();
        addField(\"string_key\", FieldType.String, false, false, \"string_key\").setTexLengthRange(4, 128);
        addField(\"some_data\", FieldType.String, false, false, \"some_data\").setTexLengthRange(4, 256);
        
        
    }
}","/compound_key")

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,1,1,'fields','Field','{""name"":""auto_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0}',"auto_id",33,true,false,true,false,null,1,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,2,1,'fields','Field','{""name"":""string_key"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":false,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":128,""decimalDigits"":0}',"string_key",18,false,false,false,false,null,2,128,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,3,1,'fields','Field','{""name"":""some_data"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":false,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":256,""decimalDigits"":0}',"some_data",18,false,false,false,false,null,3,256,0)

*sql*
INSERT INTO `model`.`primarykey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,1,1,'primaryKeys','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""auto_id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primarykeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,1,1,'primary_key_field_list','PrimaryKeyField','{""name"":""auto_id""}',"auto_id")

*sql*
INSERT INTO `model`.`table`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,2,1,'tables','Table','{""name"":""fact_master"",""rows"":0,""fields"":[{""name"":""fact_master_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""fact_master_data"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_master_id""}]}],""foreignKeys"":[],""childTables"":[{""tableName"":""fact_transaction"",""parentTableName"":""fact_master"",""foreigKeyName"":""fk_fact_transaction_01""},{""tableName"":""fact_transaction"",""parentTableName"":""fact_master"",""foreigKeyName"":""fk_fact_transaction_02""}]}',"fact_master",0,"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class FactMaster {
    public Integer fact_master_id;
    public String fact_master_data;

    public FactMaster(
        Integer fact_master_id,
        String fact_master_data
    ) {
        this.fact_master_id = fact_master_id;
        this.fact_master_data = fact_master_data;
    }
}
","export class FactMaster extends RecordControl {
    fact_master_id?: number;
    fact_master_data?: string;

    constructor(
        fact_master_id?: number,
        fact_master_data?: string
    ) {
		super();
        this.fact_master_id = fact_master_id;
        this.fact_master_data = fact_master_data;
    
    }
    
    equals(fact_master: FactMaster) {
        return fact_master != null
        && this.fact_master_id == fact_master.fact_master_id;
    }
    
    static fromJSON(json: any) : FactMaster {
        return new FactMaster(
            json.fact_master_id,
            json.fact_master_data
        );
    }
    
    static fromJSONObjectList(json: any) : FactMaster {
        return new FactMaster(
            json.fact_master_id,
            json.fact_master_data
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            fact_master_id: this.fact_master_id,
            fact_master_data: this.fact_master_data
        };
    }
    
}
","	insertFactMaster(fact_master: FactMaster[]) {
		this.insert_fact_master_record_list.push(fact_master);
		let servlet_url: string = Constants.tariff_url + \"/fact_master\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					fact_master_id: fact_master.fact_master_id,
					fact_master_data: fact_master.fact_master_data

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_fact_master\", servlet_url, request, http_headers, http_parameters);
	}

	selectFactMaster(fact_master: FactMaster[]) {
		let servlet_url: string = Constants.tariff_url + \"/fact_master\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"fact_master_id\",
				\"fact_master_data\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_fact_master\", servlet_url, request, http_headers, http_parameters);
	}

	updateFactMaster(fact_master: FactMaster[]) {
		let servlet_url: string = Constants.tariff_url + \"/fact_master\";
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
					fact_master_id: fact_master.fact_master_id,
					fact_master_data: fact_master.fact_master_data

				}
			],
			where: {
				clause: \"\",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_fact_master\", servlet_url, request, http_headers, http_parameters);
	}

	deleteFactMaster(fact_master: FactMaster[]) {
		let servlet_url: string = Constants.tariff_url + \"/fact_master\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					fact_master_id: fact_master.fact_master_id,
					fact_master_data: fact_master.fact_master_data

				}
			],
			where: {
			  clause: \"\",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_fact_master\", servlet_url, request, http_headers, http_parameters);
	}

	fact_master_list: FactMaster[] = [];
	selected_fact_master_option: FactMaster;
	selected_fact_master_record: FactMaster;

	insert_fact_master_record_list: FactMaster[] = [];
	update_fact_master_record_list: FactMaster[] = [];
	delete_fact_master_record_list: FactMaster[] = [];

	//selected_fact_master_list_icon: any = blank_icon;
	
	} else if (key === \"insert_fact_master\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_fact_master_record_list.length; i++) {
			this.fact_master_list.push(this.insert_fact_master_record_list[i]);
		}
		this.insert_fact_master_record_list = [];
		this.fact_master_table_data_source.data = this.fact_master_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_fact_master\") {
		let resultset: any[] = response.resultset;
		this.fact_master_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.fact_master_list.push(FactMaster.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.fact_master_list[i].fact_master_icon);
		}

		this.fact_master_table_data_source.data = this.fact_master_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_fact_master\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_fact_master\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- fact_master Form Controls ---------------------

	fact_master_form: FormGroup;
	fact_master_id_control: FormControl;
	fact_master_data_control: FormControl;






	constructor() {

	this.fact_master_id_control = new FormControl([]);
	this.fact_master_data_control = new FormControl([]);







	this.fact_master_form = form_builder.group({
		fact_master_group: form_builder.group({
			fact_master_id: this.fact_master_id_control,
			fact_master_data: this.fact_master_data_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedFactMasterRecord(selected_fact_master_record: FactMaster) {
		this.selected_fact_master_record = selected_fact_master_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.fact_master.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"fact_master_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"fact_master_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box fact_master_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"fact_master_id\" matInput type=\"number\"
					placeholder=\"{{i18.fact_master.fact_master_id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('fact_master_group.fact_master_id') === false }\" />
				<div *ngIf=\"isModified('fact_master_group.fact_master_id') && isValid('fact_master_group.fact_master_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('fact_master_group.fact_master_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box fact_master_data -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"fact_master_data\" matInput type=\"string\"
					placeholder=\"{{i18.fact_master.fact_master_data}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('fact_master_group.fact_master_data') === false }\" />
				<div *ngIf=\"isModified('fact_master_group.fact_master_data') && isValid('fact_master_group.fact_master_data') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('fact_master_group.fact_master_data')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.FactMaster.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.FactMaster.title}}-->
	<img *ngIf=\"selected_fact_master_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_fact_master_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_fact_master_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_fact_master_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_fact_master_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
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
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.fact_master_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.fact_master_list.length-1\" (click)=\"lastRecord()\">
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



------------------ fact_master Form HTML Controls ---------------

","

----------- fact_master MAT Table Controls ---------------------

	fact_master_table_data_source: MatTableDataSource<FactMaster>;
	fact_master_table_columns: string[] = [
		\"fact_master_id\",
		\"fact_master_data\"


		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.fact_master_list = [];
		this.fact_master_table_data_source = new MatTableDataSource(this.fact_master_list);
		this.fact_master_table_data_source.data = this.fact_master_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"fact_master_table_data_source\" [dir]=\"direction\">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let fact_master_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(fact_master_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let fact_master_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(fact_master_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"fact_master_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let fact_master_record; columns: fact_master_table_columns\"></mat-row>
</mat-table>
------------------ fact_master MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"fact_master_id\": \"INT UNSIGNED\",
      \"fact_master_data\": \"VARCHAR\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"fact_master_id\",
    \"fact_master_data\"
  ],
  \"where\": {
    \"clause\": \"fact_master_id>?\",
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
      \"fact_master_id\": \"INT UNSIGNED\",
      \"fact_master_data\": \"VARCHAR\"
    }
  ],
  \"where\": {
    \"clause\": \"fact_master_id=?\",
    \"fields\": [
      \"fact_master_id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"fact_master_id\": \"INT UNSIGNED\",
      \"fact_master_data\": \"VARCHAR\"
    }
  ],
  \"where\": {
    \"clause\": \"fact_master_id=?\",
    \"fields\": [
      \"fact_master_id\"
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
@WebServlet(\"/fact_master\")
public class FactMaster extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Fact Master\", \"parental\", \"parental\", \"fact_master\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"fact_master_id\", FieldType.Integer, false, false, \"fact_master_id\").setPrimaryKeyAI();
        addField(\"fact_master_data\", FieldType.String, true, false, \"fact_master_data\").setTexLengthRange(4, 45);
        
        
    }
}","/fact_master")

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,4,2,'fields','Field','{""name"":""fact_master_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0}',"fact_master_id",33,true,false,true,false,null,1,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,5,2,'fields','Field','{""name"":""fact_master_data"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimalDigits"":0}',"fact_master_data",18,false,true,false,false,null,2,45,0)

*sql*
INSERT INTO `model`.`primarykey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,2,2,'primaryKeys','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_master_id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primarykeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,2,2,'primary_key_field_list','PrimaryKeyField','{""name"":""fact_master_id""}',"fact_master_id")

*sql*
INSERT INTO `model`.`childtable`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`tablename`,`parenttablename`,`foreigkeyname`) VALUES (500,1,1,2,'childTables','ChildTable','{""tableName"":""fact_transaction"",""parentTableName"":""fact_master"",""foreigKeyName"":""fk_fact_transaction_01""}',"fact_transaction","fact_master","fk_fact_transaction_01")

*sql*
INSERT INTO `model`.`childtable`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`tablename`,`parenttablename`,`foreigkeyname`) VALUES (500,1,2,2,'childTables','ChildTable','{""tableName"":""fact_transaction"",""parentTableName"":""fact_master"",""foreigKeyName"":""fk_fact_transaction_02""}',"fact_transaction","fact_master","fk_fact_transaction_02")

*sql*
INSERT INTO `model`.`table`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,3,1,'tables','Table','{""name"":""fact_transaction"",""rows"":0,""fields"":[{""name"":""fact_transaction_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""fact_master_a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""fact_master_b_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":10,""decimalDigits"":0},{""name"":""fact_transaction_data"",""dataTypeName"":""DECIMAL"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":18,""decimalDigits"":6}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_transaction_id""}]}],""foreignKeys"":[{""name"":""fk_fact_transaction_01"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""fact_transaction"",""referencedKeyTableName"":""fact_master"",""foreignKeyFields"":[{""name"":""fact_master_id""}],""referencedKeyFields"":[{""name"":""fact_master_a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""},{""name"":""fk_fact_transaction_02"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""fact_transaction"",""referencedKeyTableName"":""fact_master"",""foreignKeyFields"":[{""name"":""fact_master_id""}],""referencedKeyFields"":[{""name"":""fact_master_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[]}',"fact_transaction",0,"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class FactTransaction {
    public Integer fact_transaction_id;
    public Integer fact_master_a_id;
    public Integer fact_master_b_id;
    public BigDecimal fact_transaction_data;
    public FactMaster fact_master;
    public FactMaster fact_master;

    public FactTransaction(
        Integer fact_transaction_id,
        Integer fact_master_a_id,
        Integer fact_master_b_id,
        BigDecimal fact_transaction_data,
        FactMaster fact_master,
        FactMaster fact_master
    ) {
        this.fact_transaction_id = fact_transaction_id;
        this.fact_master_a_id = fact_master_a_id;
        this.fact_master_b_id = fact_master_b_id;
        this.fact_transaction_data = fact_transaction_data;
        this.fact_master = fact_master;
        this.fact_master = fact_master;
    }
}
","export class FactTransaction extends RecordControl {
    fact_transaction_id?: number;
    fact_master_a_id?: number;
    fact_master_b_id?: number;
    fact_transaction_data?: number;
    fact_master_a?: FactMaster | null;
    fact_master_b?: FactMaster | null;

    constructor(
        fact_transaction_id?: number,
        fact_master_a_id?: number,
        fact_master_b_id?: number,
        fact_transaction_data?: number,
        fact_master_a?: FactMaster | null,
        fact_master_b?: FactMaster | null
    ) {
		super();
        this.fact_transaction_id = fact_transaction_id;
        this.fact_master_a_id = fact_master_a_id;
        this.fact_master_b_id = fact_master_b_id;
        this.fact_transaction_data = fact_transaction_data;
        this.fact_master_a = fact_master_a;
        this.fact_master_b = fact_master_b;
    
    }
    
    equals(fact_transaction: FactTransaction) {
        return fact_transaction != null
        && this.fact_transaction_id == fact_transaction.fact_transaction_id;
    }
    
    static fromJSON(json: any) : FactTransaction {
        return new FactTransaction(
            json.fact_transaction_id,
            json.fact_master_a_id,
            json.fact_master_b_id,
            json.fact_transaction_data,
            null,
            null
        );
    }
    
    static fromJSONObjectList(json: any, fact_master_a: FactMaster | null, fact_master_b: FactMaster | null) : FactTransaction {
        return new FactTransaction(
            json.fact_transaction_id,
            json.fact_master_a_id,
            json.fact_master_b_id,
            json.fact_transaction_data,
            fact_master_a,
            fact_master_b
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            fact_transaction_id: this.fact_transaction_id,
            fact_master_a_id: this.fact_master_a_id,
            fact_master_b_id: this.fact_master_b_id,
            fact_transaction_data: this.fact_transaction_data
        };
    }
    
}
","	insertFactTransaction(fact_transaction: FactTransaction[]) {
		this.insert_fact_transaction_record_list.push(fact_transaction);
		let servlet_url: string = Constants.tariff_url + \"/fact_transaction\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					fact_transaction_id: fact_transaction.fact_transaction_id,
					fact_master_a_id: fact_transaction.fact_master_a_id,
					fact_master_b_id: fact_transaction.fact_master_b_id,
					fact_transaction_data: fact_transaction.fact_transaction_data

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_fact_transaction\", servlet_url, request, http_headers, http_parameters);
	}

	selectFactTransaction(fact_transaction: FactTransaction[]) {
		let servlet_url: string = Constants.tariff_url + \"/fact_transaction\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"fact_transaction_id\",
				\"fact_master_a_id\",
				\"fact_master_b_id\",
				\"fact_transaction_data\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_fact_transaction\", servlet_url, request, http_headers, http_parameters);
	}

	updateFactTransaction(fact_transaction: FactTransaction[]) {
		let servlet_url: string = Constants.tariff_url + \"/fact_transaction\";
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
					fact_transaction_id: fact_transaction.fact_transaction_id,
					fact_master_a_id: fact_transaction.fact_master_a_id,
					fact_master_b_id: fact_transaction.fact_master_b_id,
					fact_transaction_data: fact_transaction.fact_transaction_data

				}
			],
			where: {
				clause: \"\",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_fact_transaction\", servlet_url, request, http_headers, http_parameters);
	}

	deleteFactTransaction(fact_transaction: FactTransaction[]) {
		let servlet_url: string = Constants.tariff_url + \"/fact_transaction\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					fact_transaction_id: fact_transaction.fact_transaction_id,
					fact_master_a_id: fact_transaction.fact_master_a_id,
					fact_master_b_id: fact_transaction.fact_master_b_id,
					fact_transaction_data: fact_transaction.fact_transaction_data

				}
			],
			where: {
			  clause: \"\",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_fact_transaction\", servlet_url, request, http_headers, http_parameters);
	}

	fact_transaction_list: FactTransaction[] = [];
	selected_fact_transaction_option: FactTransaction;
	selected_fact_transaction_record: FactTransaction;

	insert_fact_transaction_record_list: FactTransaction[] = [];
	update_fact_transaction_record_list: FactTransaction[] = [];
	delete_fact_transaction_record_list: FactTransaction[] = [];

	//selected_fact_transaction_list_icon: any = blank_icon;
	
	} else if (key === \"insert_fact_transaction\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_fact_transaction_record_list.length; i++) {
			this.fact_transaction_list.push(this.insert_fact_transaction_record_list[i]);
		}
		this.insert_fact_transaction_record_list = [];
		this.fact_transaction_table_data_source.data = this.fact_transaction_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_fact_transaction\") {
		let resultset: any[] = response.resultset;
		this.fact_transaction_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.fact_transaction_list.push(FactTransaction.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.fact_transaction_list[i].fact_transaction_icon);
		}

		this.fact_transaction_table_data_source.data = this.fact_transaction_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_fact_transaction\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_fact_transaction\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- fact_transaction Form Controls ---------------------

	fact_transaction_form: FormGroup;
	fact_transaction_id_control: FormControl;
	fact_master_a_id_control: FormControl;
	fact_master_b_id_control: FormControl;
	fact_transaction_data_control: FormControl;


	fact_master_a_list_control: FormControl;
	fact_master_b_list_control: FormControl;


	fact_master_a_array_control: FormArray;
	fact_master_b_array_control: FormArray;


	constructor() {

	this.fact_transaction_id_control = new FormControl([]);
	this.fact_master_a_id_control = new FormControl([]);
	this.fact_master_b_id_control = new FormControl([]);
	this.fact_transaction_data_control = new FormControl([]);

	this.fact_master_a_list_control = new FormControl([]);
	this.fact_master_b_list_control = new FormControl([]);

	this.fact_master_a_list_control = new FormControl([]);
	this.fact_master_b_list_control = new FormControl([]);


	this.fact_master_a_array_control = new FormArray([]);
	this.fact_master_b_array_control = new FormArray([]);



	this.fact_transaction_form = form_builder.group({
		fact_transaction_group: form_builder.group({
			fact_transaction_id: this.fact_transaction_id_control,
			fact_master_a_id: this.fact_master_a_id_control,
			fact_master_b_id: this.fact_master_b_id_control,
			fact_transaction_data: this.fact_transaction_data_control,

	fact_master_a_check_list: this.fact_master_a_array_control,
	fact_master_b_check_list: this.fact_master_b_array_control,

		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedFactTransactionRecord(selected_fact_transaction_record: FactTransaction) {
		this.selected_fact_transaction_record = selected_fact_transaction_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	
		this.fact_master_list.forEach( (fact_master: FactMaster) => {
			fact_master.is_checked = false;
			let fact_master_control: FormControl = new FormControl(fact_master);
			fact_master_control.['option_value'] = fact_master;
			fact_master_control.setValue(fact_master_control['option_value']);
			this.fact_master_array_control.push(fact_master_control);
		});
		this.fact_master_list.forEach( (fact_master: FactMaster) => {
			fact_master.is_checked = false;
			let fact_master_control: FormControl = new FormControl(fact_master);
			fact_master_control.['option_value'] = fact_master;
			fact_master_control.setValue(fact_master_control['option_value']);
			this.fact_master_array_control.push(fact_master_control);
		});

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.fact_transaction.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"fact_transaction_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"fact_transaction_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box fact_transaction_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"fact_transaction_id\" matInput type=\"number\"
					placeholder=\"{{i18.fact_transaction.fact_transaction_id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('fact_transaction_group.fact_transaction_id') === false }\" />
				<div *ngIf=\"isModified('fact_transaction_group.fact_transaction_id') && isValid('fact_transaction_group.fact_transaction_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('fact_transaction_group.fact_transaction_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box fact_master_a_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"fact_master_a_id\" matInput type=\"number\"
					placeholder=\"{{i18.fact_transaction.fact_master_a_id}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('fact_transaction_group.fact_master_a_id') === false }\" />
				<div *ngIf=\"isModified('fact_transaction_group.fact_master_a_id') && isValid('fact_transaction_group.fact_master_a_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('fact_transaction_group.fact_master_a_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box fact_master_b_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"fact_master_b_id\" matInput type=\"number\"
					placeholder=\"{{i18.fact_transaction.fact_master_b_id}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('fact_transaction_group.fact_master_b_id') === false }\" />
				<div *ngIf=\"isModified('fact_transaction_group.fact_master_b_id') && isValid('fact_transaction_group.fact_master_b_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('fact_transaction_group.fact_master_b_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box fact_transaction_data -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"fact_transaction_data\" matInput type=\"number\"
					placeholder=\"{{i18.fact_transaction.fact_transaction_data}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('fact_transaction_group.fact_transaction_data') === false }\" />
				<div *ngIf=\"isModified('fact_transaction_group.fact_transaction_data') && isValid('fact_transaction_group.fact_transaction_data') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('fact_transaction_group.fact_transaction_data')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		
			<!-- fact_master_a_list -->
			<ng-container formArrayName=\"fact_master_a_list\">
			  <div>
				<span>
				  <mat-checkbox [checked]=\"isAllListChecked(fact_master_a_check_list)\" [color]=\"primary\"
					[indeterminate]=\"isIndeterminate(fact_master_a_list)\"
					(change)=\"selectAllList($event, fact_master_a_list)\">
					<img src=\"{{fact_master_a_icon}}\" class=\"icon\" />
					{{ i18.fact_master_a }}
				  </mat-checkbox>
				</span>
			  </div>
			  <div *ngFor=\"let fact_master_a_control of fact_master_a_array_control.controls; let i=index\">
				<span>
				  <mat-checkbox class=\"margin\" [formControl]=\"fact_master_a_control\"
					[color]=\"primary\" [(ngModel)]=\"fact_master_a_list[i].is_checked\">
					<img class=\"icon\" src=\"{{fact_master_a_list[i].advertising_method_icon}}\" (error)=\"onImageError($event)\">
					{{fact_master_a_list[i].advertising_method_name_i18[lang]}}
				  </mat-checkbox>
				</span>
			  </div>
			</ng-container>

			<!-- fact_master_b_list -->
			<ng-container formArrayName=\"fact_master_b_list\">
			  <div>
				<span>
				  <mat-checkbox [checked]=\"isAllListChecked(fact_master_b_check_list)\" [color]=\"primary\"
					[indeterminate]=\"isIndeterminate(fact_master_b_list)\"
					(change)=\"selectAllList($event, fact_master_b_list)\">
					<img src=\"{{fact_master_b_icon}}\" class=\"icon\" />
					{{ i18.fact_master_b }}
				  </mat-checkbox>
				</span>
			  </div>
			  <div *ngFor=\"let fact_master_b_control of fact_master_b_array_control.controls; let i=index\">
				<span>
				  <mat-checkbox class=\"margin\" [formControl]=\"fact_master_b_control\"
					[color]=\"primary\" [(ngModel)]=\"fact_master_b_list[i].is_checked\">
					<img class=\"icon\" src=\"{{fact_master_b_list[i].advertising_method_icon}}\" (error)=\"onImageError($event)\">
					{{fact_master_b_list[i].advertising_method_name_i18[lang]}}
				  </mat-checkbox>
				</span>
			  </div>
			</ng-container>


			
			<!-- fact_master_a List Box -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<mat-label>{{ i18.fact_master_a }}</mat-label>
					<span matPrefix [style.display]=\"'flex'\">
					<img src=\"{{selected_fact_master_list_icon}}\" class=\"icon\" />
				</span>
				<mat-select formControlName=\"fact_master_a_list_option\" (selectionChange)=\"onChange$FOREIGN_TABLE_CLASS($event)\">
					<mat-option *ngFor=\"let option of fact_master_list\" [value]=\"option\">
					<span><img class=\"icon\" src=\"{{option.fact_master_icon}}\"
					(error)=\"onImageError($event)\">{{option.fact_master_name_i18[lang]}}</span>
					</mat-option>
				</mat-select>
			</mat-form-field>

			<!-- fact_master_b List Box -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<mat-label>{{ i18.fact_master_b }}</mat-label>
					<span matPrefix [style.display]=\"'flex'\">
					<img src=\"{{selected_fact_master_list_icon}}\" class=\"icon\" />
				</span>
				<mat-select formControlName=\"fact_master_b_list_option\" (selectionChange)=\"onChange$FOREIGN_TABLE_CLASS($event)\">
					<mat-option *ngFor=\"let option of fact_master_list\" [value]=\"option\">
					<span><img class=\"icon\" src=\"{{option.fact_master_icon}}\"
					(error)=\"onImageError($event)\">{{option.fact_master_name_i18[lang]}}</span>
					</mat-option>
				</mat-select>
			</mat-form-field>


			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.FactTransaction.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.FactTransaction.title}}-->
	<img *ngIf=\"selected_fact_transaction_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_fact_transaction_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_fact_transaction_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_fact_transaction_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_fact_transaction_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
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
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.fact_transaction_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.fact_transaction_list.length-1\" (click)=\"lastRecord()\">
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



------------------ fact_transaction Form HTML Controls ---------------

","

----------- fact_transaction MAT Table Controls ---------------------

	fact_transaction_table_data_source: MatTableDataSource<FactTransaction>;
	fact_transaction_table_columns: string[] = [
		\"fact_transaction_id\",
		\"fact_master_a_id\",
		\"fact_master_b_id\",
		\"fact_transaction_data\",
		\"fact_master_a\",
		\"fact_master_b\"

		\"fact_master_a\",
		\"fact_master_b\"

		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.fact_transaction_list = [];
		this.fact_transaction_table_data_source = new MatTableDataSource(this.fact_transaction_list);
		this.fact_transaction_table_data_source.data = this.fact_transaction_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"fact_transaction_table_data_source\" [dir]=\"direction\">


	


	<!-- Table ~Field fact_master_a with _name_LANG -->
	<ng-container matColumnDef=\"fact_master_a\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.FactMaster.fact_master_a}}</mat-header-cell>
		<mat-cell *matCellDef=\"let fact_transaction_record;\">
			<img src=\"{{fact_transaction_record.fact_master.fact_master_icon}}\" class=\"icon\" />
			{{fact_transaction_record.fact_master.fact_master_name_i18[lang]}}
		</mat-cell>
	</ng-container>

	<!-- Table ~Field fact_master_b with _name_LANG -->
	<ng-container matColumnDef=\"fact_master_b\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.FactMaster.fact_master_b}}</mat-header-cell>
		<mat-cell *matCellDef=\"let fact_transaction_record;\">
			<img src=\"{{fact_transaction_record.fact_master.fact_master_icon}}\" class=\"icon\" />
			{{fact_transaction_record.fact_master.fact_master_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let fact_transaction_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(fact_transaction_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let fact_transaction_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(fact_transaction_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"fact_transaction_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let fact_transaction_record; columns: fact_transaction_table_columns\"></mat-row>
</mat-table>
------------------ fact_transaction MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"fact_transaction_id\": \"INT UNSIGNED\",
      \"fact_master_a_id\": \"INT UNSIGNED\",
      \"fact_master_b_id\": \"INT UNSIGNED\",
      \"fact_transaction_data\": \"DECIMAL\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"fact_transaction_id\",
    \"fact_master_a_id\",
    \"fact_master_b_id\",
    \"fact_transaction_data\"
  ],
  \"where\": {
    \"clause\": \"fact_transaction_id>?\",
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
      \"fact_transaction_id\": \"INT UNSIGNED\",
      \"fact_master_a_id\": \"INT UNSIGNED\",
      \"fact_master_b_id\": \"INT UNSIGNED\",
      \"fact_transaction_data\": \"DECIMAL\"
    }
  ],
  \"where\": {
    \"clause\": \"fact_transaction_id=?\",
    \"fields\": [
      \"fact_transaction_id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"fact_transaction_id\": \"INT UNSIGNED\",
      \"fact_master_a_id\": \"INT UNSIGNED\",
      \"fact_master_b_id\": \"INT UNSIGNED\",
      \"fact_transaction_data\": \"DECIMAL\"
    }
  ],
  \"where\": {
    \"clause\": \"fact_transaction_id=?\",
    \"fields\": [
      \"fact_transaction_id\"
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
@WebServlet(\"/fact_transaction\")
public class FactTransaction extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Fact Transaction\", \"parental\", \"parental\", \"fact_transaction\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"fact_transaction_id\", FieldType.Integer, false, false, \"fact_transaction_id\").setPrimaryKeyAI();
        addField(\"fact_master_a_id\", FieldType.Integer, true, false, \"fact_master_a_id\");
        addField(\"fact_master_b_id\", FieldType.Integer, true, false, \"fact_master_b_id\");
        addField(\"fact_transaction_data\", FieldType.BigDecimal, true, false, \"fact_transaction_data\");
        
        addForeignKey(\"fk_fact_transaction_01\", \"fact_master_a_id\", \"fact_master\", \"fact_master_id\");
        addForeignKey(\"fk_fact_transaction_02\", \"fact_master_b_id\", \"fact_master\", \"fact_master_id\");
        
    }
}","/fact_transaction")

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,6,3,'fields','Field','{""name"":""fact_transaction_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0}',"fact_transaction_id",33,true,false,true,false,null,1,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,7,3,'fields','Field','{""name"":""fact_master_a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0}',"fact_master_a_id",33,false,true,false,false,null,2,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,8,3,'fields','Field','{""name"":""fact_master_b_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":10,""decimalDigits"":0}',"fact_master_b_id",33,false,true,false,false,null,3,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,9,3,'fields','Field','{""name"":""fact_transaction_data"",""dataTypeName"":""DECIMAL"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":18,""decimalDigits"":6}',"fact_transaction_data",9,false,true,false,false,null,4,18,6)

*sql*
INSERT INTO `model`.`primarykey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,3,3,'primaryKeys','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""fact_transaction_id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primarykeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,3,3,'primary_key_field_list','PrimaryKeyField','{""name"":""fact_transaction_id""}',"fact_transaction_id")

*sql*
INSERT INTO `model`.`foreignkey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`referencedkeyname`,`foreignkeytablename`,`referencedkeytablename`,`key_sequence`,`update_rule`,`delete_rule`,`deferrability`) VALUES (500,1,1,3,'foreignKeys','ForeignKey','{""name"":""fk_fact_transaction_01"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""fact_transaction"",""referencedKeyTableName"":""fact_master"",""foreignKeyFields"":[{""name"":""fact_master_id""}],""referencedKeyFields"":[{""name"":""fact_master_a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}',"fk_fact_transaction_01","PRIMARY","fact_transaction","fact_master",1,"1","1","7")

*sql*
INSERT INTO `model`.`foreignkeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,1,1,'foreignKeyFields','ForeignKeyField','{""name"":""fact_master_id""}',"fact_master_id")

*sql*
INSERT INTO `model`.`referencedkeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,1,1,'referencedKeyFields','ReferencedKeyField','{""name"":""fact_master_a_id""}',"fact_master_a_id")

*sql*
INSERT INTO `model`.`foreignkey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`referencedkeyname`,`foreignkeytablename`,`referencedkeytablename`,`key_sequence`,`update_rule`,`delete_rule`,`deferrability`) VALUES (500,1,2,3,'foreignKeys','ForeignKey','{""name"":""fk_fact_transaction_02"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""fact_transaction"",""referencedKeyTableName"":""fact_master"",""foreignKeyFields"":[{""name"":""fact_master_id""}],""referencedKeyFields"":[{""name"":""fact_master_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}',"fk_fact_transaction_02","PRIMARY","fact_transaction","fact_master",1,"1","1","7")

*sql*
INSERT INTO `model`.`foreignkeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,2,2,'foreignKeyFields','ForeignKeyField','{""name"":""fact_master_id""}',"fact_master_id")

*sql*
INSERT INTO `model`.`referencedkeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,2,2,'referencedKeyFields','ReferencedKeyField','{""name"":""fact_master_b_id""}',"fact_master_b_id")

*sql*
INSERT INTO `model`.`table`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,4,1,'tables','Table','{""name"":""table_a"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[],""childTables"":[{""tableName"":""table_a_a"",""parentTableName"":""table_a"",""foreigKeyName"":""fk_table_a_a_1""},{""tableName"":""table_a_b"",""parentTableName"":""table_a"",""foreigKeyName"":""fk_table_a_b_1""},{""tableName"":""table_a_c"",""parentTableName"":""table_a"",""foreigKeyName"":""fk_table_a_c_1""}]}',"table_a",0,"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class TableA {
    public Integer id;
    public String name_ar;
    public String name_en;
    public Date date;
    public Time time;
    public Timestamp timestamp;
    public Boolean boolean;

    public TableA(
        Integer id,
        String name_ar,
        String name_en,
        Date date,
        Time time,
        Timestamp timestamp,
        Boolean boolean
    ) {
        this.id = id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
    }
}
","export class TableA extends RecordControl {
    id?: number;
    name_ar?: string;
    name_en?: string;
    date?: Date;
    time?: Date;
    timestamp?: Date;
    boolean?: boolean;
    name_i18?: StringI18;

    constructor(
        id?: number,
        name_ar?: string,
        name_en?: string,
        date?: Date,
        time?: Date,
        timestamp?: Date,
        boolean?: boolean
    ) {
		super();
        this.id = id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.name_i18 = new StringI18(name_ar, name_en);
    
    }
    
    equals(table_a: TableA) {
        return table_a != null
        && this.id == table_a.id;
    }
    
    static fromJSON(json: any) : TableA {
        return new TableA(
            json.id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean
        );
    }
    
    static fromJSONObjectList(json: any) : TableA {
        return new TableA(
            json.id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            id: this.id,
            name_ar: this.name_ar,
            name_en: this.name_en,
            date: this.date.toISOString(),
            time: this.time.toISOString(),
            timestamp: this.timestamp.toISOString(),
            boolean: this.boolean
        };
    }
    
}
","	insertTableA(table_a: TableA[]) {
		this.insert_table_a_record_list.push(table_a);
		let servlet_url: string = Constants.tariff_url + \"/table_a\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					id: table_a.id,
					name_ar: table_a.name_ar,
					name_en: table_a.name_en,
					date: table_a.date,
					time: table_a.time,
					timestamp: table_a.timestamp,
					boolean: table_a.boolean

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_table_a\", servlet_url, request, http_headers, http_parameters);
	}

	selectTableA(table_a: TableA[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"id\",
				\"name_ar\",
				\"name_en\",
				\"date\",
				\"time\",
				\"timestamp\",
				\"boolean\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_table_a\", servlet_url, request, http_headers, http_parameters);
	}

	updateTableA(table_a: TableA[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a\";
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
					id: table_a.id,
					name_ar: table_a.name_ar,
					name_en: table_a.name_en,
					date: table_a.date,
					time: table_a.time,
					timestamp: table_a.timestamp,
					boolean: table_a.boolean

				}
			],
			where: {
				clause: \"\",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_table_a\", servlet_url, request, http_headers, http_parameters);
	}

	deleteTableA(table_a: TableA[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					id: table_a.id,
					name_ar: table_a.name_ar,
					name_en: table_a.name_en,
					date: table_a.date,
					time: table_a.time,
					timestamp: table_a.timestamp,
					boolean: table_a.boolean

				}
			],
			where: {
			  clause: \"\",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_table_a\", servlet_url, request, http_headers, http_parameters);
	}

	table_a_list: TableA[] = [];
	selected_table_a_option: TableA;
	selected_table_a_record: TableA;

	insert_table_a_record_list: TableA[] = [];
	update_table_a_record_list: TableA[] = [];
	delete_table_a_record_list: TableA[] = [];

	//selected_table_a_list_icon: any = blank_icon;
	
	} else if (key === \"insert_table_a\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_table_a_record_list.length; i++) {
			this.table_a_list.push(this.insert_table_a_record_list[i]);
		}
		this.insert_table_a_record_list = [];
		this.table_a_table_data_source.data = this.table_a_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_table_a\") {
		let resultset: any[] = response.resultset;
		this.table_a_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.table_a_list.push(TableA.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.table_a_list[i].table_a_icon);
		}

		this.table_a_table_data_source.data = this.table_a_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_table_a\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_table_a\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- table_a Form Controls ---------------------

	table_a_form: FormGroup;
	id_control: FormControl;
	name_ar_control: FormControl;
	name_en_control: FormControl;
	date_control: FormControl;
	time_control: FormControl;
	timestamp_control: FormControl;
	boolean_control: FormControl;






	constructor() {

	this.id_control = new FormControl([]);
	this.name_ar_control = new FormControl([]);
	this.name_en_control = new FormControl([]);
	this.date_control = new FormControl([]);
	this.time_control = new FormControl([]);
	this.timestamp_control = new FormControl([]);
	this.boolean_control = new FormControl([]);







	this.table_a_form = form_builder.group({
		table_a_group: form_builder.group({
			id: this.id_control,
			name_ar: this.name_ar_control,
			name_en: this.name_en_control,
			date: this.date_control,
			time: this.time_control,
			timestamp: this.timestamp_control,
			boolean: this.boolean_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTableARecord(selected_table_a_record: TableA) {
		this.selected_table_a_record = selected_table_a_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.table_a.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"table_a_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"table_a_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"id\" matInput type=\"number\"
					placeholder=\"{{i18.table_a.id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_group.id') === false }\" />
				<div *ngIf=\"isModified('table_a_group.id') && isValid('table_a_group.id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_group.id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_ar -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"name_ar\" matInput type=\"string\"
					placeholder=\"{{i18.table_a.name_ar}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_group.name_ar') === false }\" />
				<div *ngIf=\"isModified('table_a_group.name_ar') && isValid('table_a_group.name_ar') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_group.name_ar')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_en -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"name_en\" matInput type=\"string\"
					placeholder=\"{{i18.table_a.name_en}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_group.name_en') === false }\" />
				<div *ngIf=\"isModified('table_a_group.name_en') && isValid('table_a_group.name_en') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_group.name_en')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box time -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"time\" matInput type=\"Date\"
					placeholder=\"{{i18.table_a.time}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_group.time') === false }\" />
				<div *ngIf=\"isModified('table_a_group.time') && isValid('table_a_group.time') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_group.time')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box timestamp -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"timestamp\" matInput type=\"Date\"
					placeholder=\"{{i18.table_a.timestamp}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_group.timestamp') === false }\" />
				<div *ngIf=\"isModified('table_a_group.timestamp') && isValid('table_a_group.timestamp') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_group.timestamp')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box boolean -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"boolean\" matInput type=\"checkbox\"
					placeholder=\"{{i18.table_a.boolean}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_group.boolean') === false }\" />
				<div *ngIf=\"isModified('table_a_group.boolean') && isValid('table_a_group.boolean') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_group.boolean')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			
			<!-- Date Box date -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<mat-label>{{i18.table_a.date}}</mat-label>
				<input formControlName=\"date\" matInput [matDatepicker]=\"datepicker\" placeholder=\"{{ i18.table_a.date }}\">
				<mat-datepicker-toggle matPrefix [for]=\"datepicker\"></mat-datepicker-toggle>
				<mat-datepicker #datepicker></mat-datepicker>
			</mat-form-field>


		

			

			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.TableA.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.TableA.title}}-->
	<img *ngIf=\"selected_table_a_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
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
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.table_a_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.table_a_list.length-1\" (click)=\"lastRecord()\">
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



------------------ table_a Form HTML Controls ---------------

","

----------- table_a MAT Table Controls ---------------------

	table_a_table_data_source: MatTableDataSource<TableA>;
	table_a_table_columns: string[] = [
		\"id\",
		\"name_ar\",
		\"name_en\",
		\"date\",
		\"time\",
		\"timestamp\",
		\"boolean\",
		\"name_i18\"


		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.table_a_list = [];
		this.table_a_table_data_source = new MatTableDataSource(this.table_a_list);
		this.table_a_table_data_source.data = this.table_a_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"table_a_table_data_source\" [dir]=\"direction\">


	
	<!-- Table -Field name_i18 -->
	<ng-container matColumnDef=\"table_a_name_i18\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.TableA.table_a_name_i18}}</mat-header-cell>
		<mat-cell *matCellDef=\"let table_a_record;\">
			{{table_a_record.table_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>




	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let table_a_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(table_a_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let table_a_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(table_a_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"table_a_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let table_a_record; columns: table_a_table_columns\"></mat-row>
</mat-table>
------------------ table_a MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"id\",
    \"name_ar\",
    \"name_en\",
    \"date\",
    \"time\",
    \"timestamp\",
    \"boolean\"
  ],
  \"where\": {
    \"clause\": \"id>?\",
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
      \"id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"where\": {
    \"clause\": \"id=?\",
    \"fields\": [
      \"id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"where\": {
    \"clause\": \"id=?\",
    \"fields\": [
      \"id\"
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
@WebServlet(\"/table_a\")
public class TableA extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Table A\", \"parental\", \"parental\", \"table_a\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"id\", FieldType.Integer, false, false, \"id\").setPrimaryKeyAI();
        addField(\"name_ar\", FieldType.String, true, false, \"name_ar\").setTexLengthRange(4, 45);
        addField(\"name_en\", FieldType.String, true, false, \"name_en\").setTexLengthRange(4, 45);
        addField(\"date\", FieldType.Date, true, false, \"date\");
        addField(\"time\", FieldType.Time, true, false, \"time\");
        addField(\"timestamp\", FieldType.Timestamp, true, false, \"timestamp\");
        addField(\"boolean\", FieldType.Boolean, true, false, \"boolean\");
        
        
    }
}","/table_a")

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,10,4,'fields','Field','{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0}',"id",33,true,false,true,false,null,1,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,11,4,'fields','Field','{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":45,""decimalDigits"":0}',"name_ar",18,false,true,false,false,null,2,45,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,12,4,'fields','Field','{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0}',"name_en",18,false,true,false,false,null,3,45,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,13,4,'fields','Field','{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":10,""decimalDigits"":0}',"date",12,false,true,false,false,null,4,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,14,4,'fields','Field','{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":8,""decimalDigits"":0}',"time",13,false,true,false,false,null,5,8,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,15,4,'fields','Field','{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":19,""decimalDigits"":0}',"timestamp",15,false,true,false,false,null,6,19,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,16,4,'fields','Field','{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":1,""decimalDigits"":0}',"boolean",10,false,true,false,false,null,7,1,0)

*sql*
INSERT INTO `model`.`primarykey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,4,4,'primaryKeys','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primarykeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,4,4,'primary_key_field_list','PrimaryKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`childtable`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`tablename`,`parenttablename`,`foreigkeyname`) VALUES (500,1,3,4,'childTables','ChildTable','{""tableName"":""table_a_a"",""parentTableName"":""table_a"",""foreigKeyName"":""fk_table_a_a_1""}',"table_a_a","table_a","fk_table_a_a_1")

*sql*
INSERT INTO `model`.`childtable`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`tablename`,`parenttablename`,`foreigkeyname`) VALUES (500,1,4,4,'childTables','ChildTable','{""tableName"":""table_a_b"",""parentTableName"":""table_a"",""foreigKeyName"":""fk_table_a_b_1""}',"table_a_b","table_a","fk_table_a_b_1")

*sql*
INSERT INTO `model`.`childtable`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`tablename`,`parenttablename`,`foreigkeyname`) VALUES (500,1,5,4,'childTables','ChildTable','{""tableName"":""table_a_c"",""parentTableName"":""table_a"",""foreigKeyName"":""fk_table_a_c_1""}',"table_a_c","table_a","fk_table_a_c_1")

*sql*
INSERT INTO `model`.`table`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,5,1,'tables','Table','{""name"":""table_a_a"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[{""name"":""fk_table_a_a_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_a"",""referencedKeyTableName"":""table_a"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[]}',"table_a_a",0,"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class TableAA {
    public Integer id;
    public Integer a_id;
    public String name_ar;
    public String name_en;
    public Date date;
    public Time time;
    public Timestamp timestamp;
    public Boolean boolean;
    public TableA table_a;

    public TableAA(
        Integer id,
        Integer a_id,
        String name_ar,
        String name_en,
        Date date,
        Time time,
        Timestamp timestamp,
        Boolean boolean,
        TableA table_a
    ) {
        this.id = id;
        this.a_id = a_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.table_a = table_a;
    }
}
","export class TableAA extends RecordControl {
    id?: number;
    a_id?: number;
    name_ar?: string;
    name_en?: string;
    date?: Date;
    time?: Date;
    timestamp?: Date;
    boolean?: boolean;
    name_i18?: StringI18;
    a?: TableA | null;

    constructor(
        id?: number,
        a_id?: number,
        name_ar?: string,
        name_en?: string,
        date?: Date,
        time?: Date,
        timestamp?: Date,
        boolean?: boolean,
        a?: TableA | null
    ) {
		super();
        this.id = id;
        this.a_id = a_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.name_i18 = new StringI18(name_ar, name_en);
        this.a = a;
    
    }
    
    equals(table_a_a: TableAA) {
        return table_a_a != null
        && this.id == table_a_a.id;
    }
    
    static fromJSON(json: any) : TableAA {
        return new TableAA(
            json.id,
            json.a_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            null
        );
    }
    
    static fromJSONObjectList(json: any, a: TableA | null) : TableAA {
        return new TableAA(
            json.id,
            json.a_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            a
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            id: this.id,
            a_id: this.a_id,
            name_ar: this.name_ar,
            name_en: this.name_en,
            date: this.date.toISOString(),
            time: this.time.toISOString(),
            timestamp: this.timestamp.toISOString(),
            boolean: this.boolean
        };
    }
    
}
","	insertTableAA(table_a_a: TableAA[]) {
		this.insert_table_a_a_record_list.push(table_a_a);
		let servlet_url: string = Constants.tariff_url + \"/table_a_a\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					id: table_a_a.id,
					a_id: table_a_a.a_id,
					name_ar: table_a_a.name_ar,
					name_en: table_a_a.name_en,
					date: table_a_a.date,
					time: table_a_a.time,
					timestamp: table_a_a.timestamp,
					boolean: table_a_a.boolean

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_table_a_a\", servlet_url, request, http_headers, http_parameters);
	}

	selectTableAA(table_a_a: TableAA[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a_a\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"id\",
				\"a_id\",
				\"name_ar\",
				\"name_en\",
				\"date\",
				\"time\",
				\"timestamp\",
				\"boolean\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_table_a_a\", servlet_url, request, http_headers, http_parameters);
	}

	updateTableAA(table_a_a: TableAA[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a_a\";
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
					id: table_a_a.id,
					a_id: table_a_a.a_id,
					name_ar: table_a_a.name_ar,
					name_en: table_a_a.name_en,
					date: table_a_a.date,
					time: table_a_a.time,
					timestamp: table_a_a.timestamp,
					boolean: table_a_a.boolean

				}
			],
			where: {
				clause: \"\",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_table_a_a\", servlet_url, request, http_headers, http_parameters);
	}

	deleteTableAA(table_a_a: TableAA[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a_a\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					id: table_a_a.id,
					a_id: table_a_a.a_id,
					name_ar: table_a_a.name_ar,
					name_en: table_a_a.name_en,
					date: table_a_a.date,
					time: table_a_a.time,
					timestamp: table_a_a.timestamp,
					boolean: table_a_a.boolean

				}
			],
			where: {
			  clause: \"\",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_table_a_a\", servlet_url, request, http_headers, http_parameters);
	}

	table_a_a_list: TableAA[] = [];
	selected_table_a_a_option: TableAA;
	selected_table_a_a_record: TableAA;

	insert_table_a_a_record_list: TableAA[] = [];
	update_table_a_a_record_list: TableAA[] = [];
	delete_table_a_a_record_list: TableAA[] = [];

	//selected_table_a_a_list_icon: any = blank_icon;
	
	} else if (key === \"insert_table_a_a\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_table_a_a_record_list.length; i++) {
			this.table_a_a_list.push(this.insert_table_a_a_record_list[i]);
		}
		this.insert_table_a_a_record_list = [];
		this.table_a_a_table_data_source.data = this.table_a_a_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_table_a_a\") {
		let resultset: any[] = response.resultset;
		this.table_a_a_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.table_a_a_list.push(TableAA.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.table_a_a_list[i].table_a_a_icon);
		}

		this.table_a_a_table_data_source.data = this.table_a_a_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_table_a_a\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_table_a_a\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- table_a_a Form Controls ---------------------

	table_a_a_form: FormGroup;
	id_control: FormControl;
	a_id_control: FormControl;
	name_ar_control: FormControl;
	name_en_control: FormControl;
	date_control: FormControl;
	time_control: FormControl;
	timestamp_control: FormControl;
	boolean_control: FormControl;


	a_list_control: FormControl;


	a_array_control: FormArray;


	constructor() {

	this.id_control = new FormControl([]);
	this.a_id_control = new FormControl([]);
	this.name_ar_control = new FormControl([]);
	this.name_en_control = new FormControl([]);
	this.date_control = new FormControl([]);
	this.time_control = new FormControl([]);
	this.timestamp_control = new FormControl([]);
	this.boolean_control = new FormControl([]);

	this.a_list_control = new FormControl([]);

	this.a_list_control = new FormControl([]);


	this.a_array_control = new FormArray([]);



	this.table_a_a_form = form_builder.group({
		table_a_a_group: form_builder.group({
			id: this.id_control,
			a_id: this.a_id_control,
			name_ar: this.name_ar_control,
			name_en: this.name_en_control,
			date: this.date_control,
			time: this.time_control,
			timestamp: this.timestamp_control,
			boolean: this.boolean_control,

	a_check_list: this.a_array_control,

		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTableAARecord(selected_table_a_a_record: TableAA) {
		this.selected_table_a_a_record = selected_table_a_a_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	
		this.table_a_list.forEach( (table_a: TableA) => {
			table_a.is_checked = false;
			let table_a_control: FormControl = new FormControl(table_a);
			table_a_control.['option_value'] = table_a;
			table_a_control.setValue(table_a_control['option_value']);
			this.table_a_array_control.push(table_a_control);
		});

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.table_a_a.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"table_a_a_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"table_a_a_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"id\" matInput type=\"number\"
					placeholder=\"{{i18.table_a_a.id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_a_group.id') === false }\" />
				<div *ngIf=\"isModified('table_a_a_group.id') && isValid('table_a_a_group.id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_a_group.id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box a_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"a_id\" matInput type=\"number\"
					placeholder=\"{{i18.table_a_a.a_id}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_a_group.a_id') === false }\" />
				<div *ngIf=\"isModified('table_a_a_group.a_id') && isValid('table_a_a_group.a_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_a_group.a_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_ar -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"name_ar\" matInput type=\"string\"
					placeholder=\"{{i18.table_a_a.name_ar}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_a_group.name_ar') === false }\" />
				<div *ngIf=\"isModified('table_a_a_group.name_ar') && isValid('table_a_a_group.name_ar') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_a_group.name_ar')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_en -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"name_en\" matInput type=\"string\"
					placeholder=\"{{i18.table_a_a.name_en}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_a_group.name_en') === false }\" />
				<div *ngIf=\"isModified('table_a_a_group.name_en') && isValid('table_a_a_group.name_en') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_a_group.name_en')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box time -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"time\" matInput type=\"Date\"
					placeholder=\"{{i18.table_a_a.time}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_a_group.time') === false }\" />
				<div *ngIf=\"isModified('table_a_a_group.time') && isValid('table_a_a_group.time') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_a_group.time')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box timestamp -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"timestamp\" matInput type=\"Date\"
					placeholder=\"{{i18.table_a_a.timestamp}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_a_group.timestamp') === false }\" />
				<div *ngIf=\"isModified('table_a_a_group.timestamp') && isValid('table_a_a_group.timestamp') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_a_group.timestamp')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box boolean -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"boolean\" matInput type=\"checkbox\"
					placeholder=\"{{i18.table_a_a.boolean}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_a_group.boolean') === false }\" />
				<div *ngIf=\"isModified('table_a_a_group.boolean') && isValid('table_a_a_group.boolean') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_a_group.boolean')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			
			<!-- Date Box date -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<mat-label>{{i18.table_a_a.date}}</mat-label>
				<input formControlName=\"date\" matInput [matDatepicker]=\"datepicker\" placeholder=\"{{ i18.table_a_a.date }}\">
				<mat-datepicker-toggle matPrefix [for]=\"datepicker\"></mat-datepicker-toggle>
				<mat-datepicker #datepicker></mat-datepicker>
			</mat-form-field>


		
			<!-- a_list -->
			<ng-container formArrayName=\"a_list\">
			  <div>
				<span>
				  <mat-checkbox [checked]=\"isAllListChecked(a_check_list)\" [color]=\"primary\"
					[indeterminate]=\"isIndeterminate(a_list)\"
					(change)=\"selectAllList($event, a_list)\">
					<img src=\"{{a_icon}}\" class=\"icon\" />
					{{ i18.a }}
				  </mat-checkbox>
				</span>
			  </div>
			  <div *ngFor=\"let a_control of a_array_control.controls; let i=index\">
				<span>
				  <mat-checkbox class=\"margin\" [formControl]=\"a_control\"
					[color]=\"primary\" [(ngModel)]=\"a_list[i].is_checked\">
					<img class=\"icon\" src=\"{{a_list[i].advertising_method_icon}}\" (error)=\"onImageError($event)\">
					{{a_list[i].advertising_method_name_i18[lang]}}
				  </mat-checkbox>
				</span>
			  </div>
			</ng-container>


			
			<!-- a List Box -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<mat-label>{{ i18.a }}</mat-label>
					<span matPrefix [style.display]=\"'flex'\">
					<img src=\"{{selected_table_a_list_icon}}\" class=\"icon\" />
				</span>
				<mat-select formControlName=\"a_list_option\" (selectionChange)=\"onChange$FOREIGN_TABLE_CLASS($event)\">
					<mat-option *ngFor=\"let option of table_a_list\" [value]=\"option\">
					<span><img class=\"icon\" src=\"{{option.table_a_icon}}\"
					(error)=\"onImageError($event)\">{{option.table_a_name_i18[lang]}}</span>
					</mat-option>
				</mat-select>
			</mat-form-field>


			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.TableAA.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.TableAA.title}}-->
	<img *ngIf=\"selected_table_a_a_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_a_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_a_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_a_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_a_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
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
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.table_a_a_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.table_a_a_list.length-1\" (click)=\"lastRecord()\">
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



------------------ table_a_a Form HTML Controls ---------------

","

----------- table_a_a MAT Table Controls ---------------------

	table_a_a_table_data_source: MatTableDataSource<TableAA>;
	table_a_a_table_columns: string[] = [
		\"id\",
		\"a_id\",
		\"name_ar\",
		\"name_en\",
		\"date\",
		\"time\",
		\"timestamp\",
		\"boolean\",
		\"name_i18\",
		\"a\"

		\"a\"

		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.table_a_a_list = [];
		this.table_a_a_table_data_source = new MatTableDataSource(this.table_a_a_list);
		this.table_a_a_table_data_source.data = this.table_a_a_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"table_a_a_table_data_source\" [dir]=\"direction\">

	<!-- Table Field id with _name_LANG -->
	<ng-container matColumnDef=\"id\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.TableAA.id}}</mat-header-cell>
		<mat-cell *matCellDef=\"let table_a_a_record;\">
			<img src=\"{{table_a_a_record.table_a_a_icon}}\" class=\"icon\" />
			{{table_a_a_record.table_a_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- Table -Field name_i18 -->
	<ng-container matColumnDef=\"table_a_a_name_i18\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.TableAA.table_a_a_name_i18}}</mat-header-cell>
		<mat-cell *matCellDef=\"let table_a_a_record;\">
			{{table_a_a_record.table_a_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>



	<!-- Table ~Field a with _name_LANG -->
	<ng-container matColumnDef=\"a\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.TableA.a}}</mat-header-cell>
		<mat-cell *matCellDef=\"let table_a_a_record;\">
			<img src=\"{{table_a_a_record.table_a.table_a_icon}}\" class=\"icon\" />
			{{table_a_a_record.table_a.table_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let table_a_a_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(table_a_a_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let table_a_a_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(table_a_a_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"table_a_a_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let table_a_a_record; columns: table_a_a_table_columns\"></mat-row>
</mat-table>
------------------ table_a_a MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"id\": \"INT UNSIGNED\",
      \"a_id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"id\",
    \"a_id\",
    \"name_ar\",
    \"name_en\",
    \"date\",
    \"time\",
    \"timestamp\",
    \"boolean\"
  ],
  \"where\": {
    \"clause\": \"id>?\",
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
      \"id\": \"INT UNSIGNED\",
      \"a_id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"where\": {
    \"clause\": \"id=?\",
    \"fields\": [
      \"id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"id\": \"INT UNSIGNED\",
      \"a_id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"where\": {
    \"clause\": \"id=?\",
    \"fields\": [
      \"id\"
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
@WebServlet(\"/table_a_a\")
public class TableAA extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Table A A\", \"parental\", \"parental\", \"table_a_a\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"id\", FieldType.Integer, false, false, \"id\").setPrimaryKeyAI();
        addField(\"a_id\", FieldType.Integer, true, false, \"a_id\");
        addField(\"name_ar\", FieldType.String, true, false, \"name_ar\").setTexLengthRange(4, 45);
        addField(\"name_en\", FieldType.String, true, false, \"name_en\").setTexLengthRange(4, 45);
        addField(\"date\", FieldType.Date, true, false, \"date\");
        addField(\"time\", FieldType.Time, true, false, \"time\");
        addField(\"timestamp\", FieldType.Timestamp, true, false, \"timestamp\");
        addField(\"boolean\", FieldType.Boolean, true, false, \"boolean\");
        
        addForeignKey(\"fk_table_a_a_1\", \"a_id\", \"table_a\", \"id\");
        
    }
}","/table_a_a")

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,17,5,'fields','Field','{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0}',"id",33,true,false,true,true,null,1,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,18,5,'fields','Field','{""name"":""a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0}',"a_id",33,false,true,false,false,null,2,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,19,5,'fields','Field','{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0}',"name_ar",18,false,true,false,false,null,3,45,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,20,5,'fields','Field','{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0}',"name_en",18,false,true,false,false,null,4,45,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,21,5,'fields','Field','{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0}',"date",12,false,true,false,false,null,5,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,22,5,'fields','Field','{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0}',"time",13,false,true,false,false,null,6,8,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,23,5,'fields','Field','{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0}',"timestamp",15,false,true,false,false,null,7,19,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,24,5,'fields','Field','{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}',"boolean",10,false,true,false,false,null,8,1,0)

*sql*
INSERT INTO `model`.`primarykey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,5,5,'primaryKeys','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primarykeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,5,5,'primary_key_field_list','PrimaryKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`foreignkey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`referencedkeyname`,`foreignkeytablename`,`referencedkeytablename`,`key_sequence`,`update_rule`,`delete_rule`,`deferrability`) VALUES (500,1,3,5,'foreignKeys','ForeignKey','{""name"":""fk_table_a_a_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_a"",""referencedKeyTableName"":""table_a"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}',"fk_table_a_a_1","PRIMARY","table_a_a","table_a",1,"1","1","7")

*sql*
INSERT INTO `model`.`foreignkeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,3,3,'foreignKeyFields','ForeignKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`referencedkeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,3,3,'referencedKeyFields','ReferencedKeyField','{""name"":""a_id""}',"a_id")

*sql*
INSERT INTO `model`.`table`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,6,1,'tables','Table','{""name"":""table_a_b"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[{""name"":""fk_table_a_b_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_b"",""referencedKeyTableName"":""table_a"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[{""tableName"":""table_a_b_a"",""parentTableName"":""table_a_b"",""foreigKeyName"":""fk_table_a_b_a_1""}]}',"table_a_b",0,"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class TableAB {
    public Integer id;
    public Integer a_id;
    public String name_ar;
    public String name_en;
    public Date date;
    public Time time;
    public Timestamp timestamp;
    public Boolean boolean;
    public TableA table_a;

    public TableAB(
        Integer id,
        Integer a_id,
        String name_ar,
        String name_en,
        Date date,
        Time time,
        Timestamp timestamp,
        Boolean boolean,
        TableA table_a
    ) {
        this.id = id;
        this.a_id = a_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.table_a = table_a;
    }
}
","export class TableAB extends RecordControl {
    id?: number;
    a_id?: number;
    name_ar?: string;
    name_en?: string;
    date?: Date;
    time?: Date;
    timestamp?: Date;
    boolean?: boolean;
    name_i18?: StringI18;
    a?: TableA | null;

    constructor(
        id?: number,
        a_id?: number,
        name_ar?: string,
        name_en?: string,
        date?: Date,
        time?: Date,
        timestamp?: Date,
        boolean?: boolean,
        a?: TableA | null
    ) {
		super();
        this.id = id;
        this.a_id = a_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.name_i18 = new StringI18(name_ar, name_en);
        this.a = a;
    
    }
    
    equals(table_a_b: TableAB) {
        return table_a_b != null
        && this.id == table_a_b.id;
    }
    
    static fromJSON(json: any) : TableAB {
        return new TableAB(
            json.id,
            json.a_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            null
        );
    }
    
    static fromJSONObjectList(json: any, a: TableA | null) : TableAB {
        return new TableAB(
            json.id,
            json.a_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            a
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            id: this.id,
            a_id: this.a_id,
            name_ar: this.name_ar,
            name_en: this.name_en,
            date: this.date.toISOString(),
            time: this.time.toISOString(),
            timestamp: this.timestamp.toISOString(),
            boolean: this.boolean
        };
    }
    
}
","	insertTableAB(table_a_b: TableAB[]) {
		this.insert_table_a_b_record_list.push(table_a_b);
		let servlet_url: string = Constants.tariff_url + \"/table_a_b\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					id: table_a_b.id,
					a_id: table_a_b.a_id,
					name_ar: table_a_b.name_ar,
					name_en: table_a_b.name_en,
					date: table_a_b.date,
					time: table_a_b.time,
					timestamp: table_a_b.timestamp,
					boolean: table_a_b.boolean

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_table_a_b\", servlet_url, request, http_headers, http_parameters);
	}

	selectTableAB(table_a_b: TableAB[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a_b\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"id\",
				\"a_id\",
				\"name_ar\",
				\"name_en\",
				\"date\",
				\"time\",
				\"timestamp\",
				\"boolean\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_table_a_b\", servlet_url, request, http_headers, http_parameters);
	}

	updateTableAB(table_a_b: TableAB[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a_b\";
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
					id: table_a_b.id,
					a_id: table_a_b.a_id,
					name_ar: table_a_b.name_ar,
					name_en: table_a_b.name_en,
					date: table_a_b.date,
					time: table_a_b.time,
					timestamp: table_a_b.timestamp,
					boolean: table_a_b.boolean

				}
			],
			where: {
				clause: \"\",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_table_a_b\", servlet_url, request, http_headers, http_parameters);
	}

	deleteTableAB(table_a_b: TableAB[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a_b\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					id: table_a_b.id,
					a_id: table_a_b.a_id,
					name_ar: table_a_b.name_ar,
					name_en: table_a_b.name_en,
					date: table_a_b.date,
					time: table_a_b.time,
					timestamp: table_a_b.timestamp,
					boolean: table_a_b.boolean

				}
			],
			where: {
			  clause: \"\",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_table_a_b\", servlet_url, request, http_headers, http_parameters);
	}

	table_a_b_list: TableAB[] = [];
	selected_table_a_b_option: TableAB;
	selected_table_a_b_record: TableAB;

	insert_table_a_b_record_list: TableAB[] = [];
	update_table_a_b_record_list: TableAB[] = [];
	delete_table_a_b_record_list: TableAB[] = [];

	//selected_table_a_b_list_icon: any = blank_icon;
	
	} else if (key === \"insert_table_a_b\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_table_a_b_record_list.length; i++) {
			this.table_a_b_list.push(this.insert_table_a_b_record_list[i]);
		}
		this.insert_table_a_b_record_list = [];
		this.table_a_b_table_data_source.data = this.table_a_b_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_table_a_b\") {
		let resultset: any[] = response.resultset;
		this.table_a_b_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.table_a_b_list.push(TableAB.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.table_a_b_list[i].table_a_b_icon);
		}

		this.table_a_b_table_data_source.data = this.table_a_b_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_table_a_b\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_table_a_b\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- table_a_b Form Controls ---------------------

	table_a_b_form: FormGroup;
	id_control: FormControl;
	a_id_control: FormControl;
	name_ar_control: FormControl;
	name_en_control: FormControl;
	date_control: FormControl;
	time_control: FormControl;
	timestamp_control: FormControl;
	boolean_control: FormControl;


	a_list_control: FormControl;


	a_array_control: FormArray;


	constructor() {

	this.id_control = new FormControl([]);
	this.a_id_control = new FormControl([]);
	this.name_ar_control = new FormControl([]);
	this.name_en_control = new FormControl([]);
	this.date_control = new FormControl([]);
	this.time_control = new FormControl([]);
	this.timestamp_control = new FormControl([]);
	this.boolean_control = new FormControl([]);

	this.a_list_control = new FormControl([]);

	this.a_list_control = new FormControl([]);


	this.a_array_control = new FormArray([]);



	this.table_a_b_form = form_builder.group({
		table_a_b_group: form_builder.group({
			id: this.id_control,
			a_id: this.a_id_control,
			name_ar: this.name_ar_control,
			name_en: this.name_en_control,
			date: this.date_control,
			time: this.time_control,
			timestamp: this.timestamp_control,
			boolean: this.boolean_control,

	a_check_list: this.a_array_control,

		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTableABRecord(selected_table_a_b_record: TableAB) {
		this.selected_table_a_b_record = selected_table_a_b_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	
		this.table_a_list.forEach( (table_a: TableA) => {
			table_a.is_checked = false;
			let table_a_control: FormControl = new FormControl(table_a);
			table_a_control.['option_value'] = table_a;
			table_a_control.setValue(table_a_control['option_value']);
			this.table_a_array_control.push(table_a_control);
		});

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.table_a_b.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"table_a_b_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"table_a_b_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"id\" matInput type=\"number\"
					placeholder=\"{{i18.table_a_b.id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_b_group.id') === false }\" />
				<div *ngIf=\"isModified('table_a_b_group.id') && isValid('table_a_b_group.id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_b_group.id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box a_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"a_id\" matInput type=\"number\"
					placeholder=\"{{i18.table_a_b.a_id}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_b_group.a_id') === false }\" />
				<div *ngIf=\"isModified('table_a_b_group.a_id') && isValid('table_a_b_group.a_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_b_group.a_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_ar -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"name_ar\" matInput type=\"string\"
					placeholder=\"{{i18.table_a_b.name_ar}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_b_group.name_ar') === false }\" />
				<div *ngIf=\"isModified('table_a_b_group.name_ar') && isValid('table_a_b_group.name_ar') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_b_group.name_ar')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_en -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"name_en\" matInput type=\"string\"
					placeholder=\"{{i18.table_a_b.name_en}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_b_group.name_en') === false }\" />
				<div *ngIf=\"isModified('table_a_b_group.name_en') && isValid('table_a_b_group.name_en') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_b_group.name_en')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box time -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"time\" matInput type=\"Date\"
					placeholder=\"{{i18.table_a_b.time}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_b_group.time') === false }\" />
				<div *ngIf=\"isModified('table_a_b_group.time') && isValid('table_a_b_group.time') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_b_group.time')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box timestamp -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"timestamp\" matInput type=\"Date\"
					placeholder=\"{{i18.table_a_b.timestamp}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_b_group.timestamp') === false }\" />
				<div *ngIf=\"isModified('table_a_b_group.timestamp') && isValid('table_a_b_group.timestamp') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_b_group.timestamp')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box boolean -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"boolean\" matInput type=\"checkbox\"
					placeholder=\"{{i18.table_a_b.boolean}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_b_group.boolean') === false }\" />
				<div *ngIf=\"isModified('table_a_b_group.boolean') && isValid('table_a_b_group.boolean') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_b_group.boolean')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			
			<!-- Date Box date -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<mat-label>{{i18.table_a_b.date}}</mat-label>
				<input formControlName=\"date\" matInput [matDatepicker]=\"datepicker\" placeholder=\"{{ i18.table_a_b.date }}\">
				<mat-datepicker-toggle matPrefix [for]=\"datepicker\"></mat-datepicker-toggle>
				<mat-datepicker #datepicker></mat-datepicker>
			</mat-form-field>


		
			<!-- a_list -->
			<ng-container formArrayName=\"a_list\">
			  <div>
				<span>
				  <mat-checkbox [checked]=\"isAllListChecked(a_check_list)\" [color]=\"primary\"
					[indeterminate]=\"isIndeterminate(a_list)\"
					(change)=\"selectAllList($event, a_list)\">
					<img src=\"{{a_icon}}\" class=\"icon\" />
					{{ i18.a }}
				  </mat-checkbox>
				</span>
			  </div>
			  <div *ngFor=\"let a_control of a_array_control.controls; let i=index\">
				<span>
				  <mat-checkbox class=\"margin\" [formControl]=\"a_control\"
					[color]=\"primary\" [(ngModel)]=\"a_list[i].is_checked\">
					<img class=\"icon\" src=\"{{a_list[i].advertising_method_icon}}\" (error)=\"onImageError($event)\">
					{{a_list[i].advertising_method_name_i18[lang]}}
				  </mat-checkbox>
				</span>
			  </div>
			</ng-container>


			
			<!-- a List Box -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<mat-label>{{ i18.a }}</mat-label>
					<span matPrefix [style.display]=\"'flex'\">
					<img src=\"{{selected_table_a_list_icon}}\" class=\"icon\" />
				</span>
				<mat-select formControlName=\"a_list_option\" (selectionChange)=\"onChange$FOREIGN_TABLE_CLASS($event)\">
					<mat-option *ngFor=\"let option of table_a_list\" [value]=\"option\">
					<span><img class=\"icon\" src=\"{{option.table_a_icon}}\"
					(error)=\"onImageError($event)\">{{option.table_a_name_i18[lang]}}</span>
					</mat-option>
				</mat-select>
			</mat-form-field>


			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.TableAB.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.TableAB.title}}-->
	<img *ngIf=\"selected_table_a_b_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_b_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_b_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_b_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_b_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
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
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.table_a_b_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.table_a_b_list.length-1\" (click)=\"lastRecord()\">
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



------------------ table_a_b Form HTML Controls ---------------

","

----------- table_a_b MAT Table Controls ---------------------

	table_a_b_table_data_source: MatTableDataSource<TableAB>;
	table_a_b_table_columns: string[] = [
		\"id\",
		\"a_id\",
		\"name_ar\",
		\"name_en\",
		\"date\",
		\"time\",
		\"timestamp\",
		\"boolean\",
		\"name_i18\",
		\"a\"

		\"a\"

		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.table_a_b_list = [];
		this.table_a_b_table_data_source = new MatTableDataSource(this.table_a_b_list);
		this.table_a_b_table_data_source.data = this.table_a_b_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"table_a_b_table_data_source\" [dir]=\"direction\">

	<!-- Table Field id with _name_LANG -->
	<ng-container matColumnDef=\"id\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.TableAB.id}}</mat-header-cell>
		<mat-cell *matCellDef=\"let table_a_b_record;\">
			<img src=\"{{table_a_b_record.table_a_b_icon}}\" class=\"icon\" />
			{{table_a_b_record.table_a_b_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- Table -Field name_i18 -->
	<ng-container matColumnDef=\"table_a_b_name_i18\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.TableAB.table_a_b_name_i18}}</mat-header-cell>
		<mat-cell *matCellDef=\"let table_a_b_record;\">
			{{table_a_b_record.table_a_b_name_i18[lang]}}
		</mat-cell>
	</ng-container>



	<!-- Table ~Field a with _name_LANG -->
	<ng-container matColumnDef=\"a\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.TableA.a}}</mat-header-cell>
		<mat-cell *matCellDef=\"let table_a_b_record;\">
			<img src=\"{{table_a_b_record.table_a.table_a_icon}}\" class=\"icon\" />
			{{table_a_b_record.table_a.table_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let table_a_b_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(table_a_b_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let table_a_b_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(table_a_b_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"table_a_b_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let table_a_b_record; columns: table_a_b_table_columns\"></mat-row>
</mat-table>
------------------ table_a_b MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"id\": \"INT UNSIGNED\",
      \"a_id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"id\",
    \"a_id\",
    \"name_ar\",
    \"name_en\",
    \"date\",
    \"time\",
    \"timestamp\",
    \"boolean\"
  ],
  \"where\": {
    \"clause\": \"id>?\",
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
      \"id\": \"INT UNSIGNED\",
      \"a_id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"where\": {
    \"clause\": \"id=?\",
    \"fields\": [
      \"id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"id\": \"INT UNSIGNED\",
      \"a_id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"where\": {
    \"clause\": \"id=?\",
    \"fields\": [
      \"id\"
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
@WebServlet(\"/table_a_b\")
public class TableAB extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Table A B\", \"parental\", \"parental\", \"table_a_b\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"id\", FieldType.Integer, false, false, \"id\").setPrimaryKeyAI();
        addField(\"a_id\", FieldType.Integer, true, false, \"a_id\");
        addField(\"name_ar\", FieldType.String, true, false, \"name_ar\").setTexLengthRange(4, 45);
        addField(\"name_en\", FieldType.String, true, false, \"name_en\").setTexLengthRange(4, 45);
        addField(\"date\", FieldType.Date, true, false, \"date\");
        addField(\"time\", FieldType.Time, true, false, \"time\");
        addField(\"timestamp\", FieldType.Timestamp, true, false, \"timestamp\");
        addField(\"boolean\", FieldType.Boolean, true, false, \"boolean\");
        
        addForeignKey(\"fk_table_a_b_1\", \"a_id\", \"table_a\", \"id\");
        
    }
}","/table_a_b")

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,25,6,'fields','Field','{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0}',"id",33,true,false,true,true,null,1,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,26,6,'fields','Field','{""name"":""a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0}',"a_id",33,false,true,false,false,null,2,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,27,6,'fields','Field','{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0}',"name_ar",18,false,true,false,false,null,3,45,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,28,6,'fields','Field','{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0}',"name_en",18,false,true,false,false,null,4,45,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,29,6,'fields','Field','{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0}',"date",12,false,true,false,false,null,5,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,30,6,'fields','Field','{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0}',"time",13,false,true,false,false,null,6,8,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,31,6,'fields','Field','{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0}',"timestamp",15,false,true,false,false,null,7,19,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,32,6,'fields','Field','{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}',"boolean",10,false,true,false,false,null,8,1,0)

*sql*
INSERT INTO `model`.`primarykey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,6,6,'primaryKeys','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primarykeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,6,6,'primary_key_field_list','PrimaryKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`foreignkey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`referencedkeyname`,`foreignkeytablename`,`referencedkeytablename`,`key_sequence`,`update_rule`,`delete_rule`,`deferrability`) VALUES (500,1,4,6,'foreignKeys','ForeignKey','{""name"":""fk_table_a_b_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_b"",""referencedKeyTableName"":""table_a"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}',"fk_table_a_b_1","PRIMARY","table_a_b","table_a",1,"1","1","7")

*sql*
INSERT INTO `model`.`foreignkeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,4,4,'foreignKeyFields','ForeignKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`referencedkeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,4,4,'referencedKeyFields','ReferencedKeyField','{""name"":""a_id""}',"a_id")

*sql*
INSERT INTO `model`.`childtable`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`tablename`,`parenttablename`,`foreigkeyname`) VALUES (500,1,6,6,'childTables','ChildTable','{""tableName"":""table_a_b_a"",""parentTableName"":""table_a_b"",""foreigKeyName"":""fk_table_a_b_a_1""}',"table_a_b_a","table_a_b","fk_table_a_b_a_1")

*sql*
INSERT INTO `model`.`table`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,7,1,'tables','Table','{""name"":""table_a_b_a"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""a_b_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[{""name"":""fk_table_a_b_a_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_b_a"",""referencedKeyTableName"":""table_a_b"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[]}',"table_a_b_a",0,"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class TableABA {
    public Integer id;
    public Integer a_b_id;
    public String name_ar;
    public String name_en;
    public Date date;
    public Time time;
    public Timestamp timestamp;
    public Boolean boolean;
    public TableAB table_ab;

    public TableABA(
        Integer id,
        Integer a_b_id,
        String name_ar,
        String name_en,
        Date date,
        Time time,
        Timestamp timestamp,
        Boolean boolean,
        TableAB table_ab
    ) {
        this.id = id;
        this.a_b_id = a_b_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.table_ab = table_ab;
    }
}
","export class TableABA extends RecordControl {
    id?: number;
    a_b_id?: number;
    name_ar?: string;
    name_en?: string;
    date?: Date;
    time?: Date;
    timestamp?: Date;
    boolean?: boolean;
    name_i18?: StringI18;
    a_b?: TableAB | null;

    constructor(
        id?: number,
        a_b_id?: number,
        name_ar?: string,
        name_en?: string,
        date?: Date,
        time?: Date,
        timestamp?: Date,
        boolean?: boolean,
        a_b?: TableAB | null
    ) {
		super();
        this.id = id;
        this.a_b_id = a_b_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.name_i18 = new StringI18(name_ar, name_en);
        this.a_b = a_b;
    
    }
    
    equals(table_a_b_a: TableABA) {
        return table_a_b_a != null
        && this.id == table_a_b_a.id;
    }
    
    static fromJSON(json: any) : TableABA {
        return new TableABA(
            json.id,
            json.a_b_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            null
        );
    }
    
    static fromJSONObjectList(json: any, a_b: TableAB | null) : TableABA {
        return new TableABA(
            json.id,
            json.a_b_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            a_b
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            id: this.id,
            a_b_id: this.a_b_id,
            name_ar: this.name_ar,
            name_en: this.name_en,
            date: this.date.toISOString(),
            time: this.time.toISOString(),
            timestamp: this.timestamp.toISOString(),
            boolean: this.boolean
        };
    }
    
}
","	insertTableABA(table_a_b_a: TableABA[]) {
		this.insert_table_a_b_a_record_list.push(table_a_b_a);
		let servlet_url: string = Constants.tariff_url + \"/table_a_b_a\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					id: table_a_b_a.id,
					a_b_id: table_a_b_a.a_b_id,
					name_ar: table_a_b_a.name_ar,
					name_en: table_a_b_a.name_en,
					date: table_a_b_a.date,
					time: table_a_b_a.time,
					timestamp: table_a_b_a.timestamp,
					boolean: table_a_b_a.boolean

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_table_a_b_a\", servlet_url, request, http_headers, http_parameters);
	}

	selectTableABA(table_a_b_a: TableABA[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a_b_a\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"id\",
				\"a_b_id\",
				\"name_ar\",
				\"name_en\",
				\"date\",
				\"time\",
				\"timestamp\",
				\"boolean\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_table_a_b_a\", servlet_url, request, http_headers, http_parameters);
	}

	updateTableABA(table_a_b_a: TableABA[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a_b_a\";
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
					id: table_a_b_a.id,
					a_b_id: table_a_b_a.a_b_id,
					name_ar: table_a_b_a.name_ar,
					name_en: table_a_b_a.name_en,
					date: table_a_b_a.date,
					time: table_a_b_a.time,
					timestamp: table_a_b_a.timestamp,
					boolean: table_a_b_a.boolean

				}
			],
			where: {
				clause: \"\",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_table_a_b_a\", servlet_url, request, http_headers, http_parameters);
	}

	deleteTableABA(table_a_b_a: TableABA[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a_b_a\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					id: table_a_b_a.id,
					a_b_id: table_a_b_a.a_b_id,
					name_ar: table_a_b_a.name_ar,
					name_en: table_a_b_a.name_en,
					date: table_a_b_a.date,
					time: table_a_b_a.time,
					timestamp: table_a_b_a.timestamp,
					boolean: table_a_b_a.boolean

				}
			],
			where: {
			  clause: \"\",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_table_a_b_a\", servlet_url, request, http_headers, http_parameters);
	}

	table_a_b_a_list: TableABA[] = [];
	selected_table_a_b_a_option: TableABA;
	selected_table_a_b_a_record: TableABA;

	insert_table_a_b_a_record_list: TableABA[] = [];
	update_table_a_b_a_record_list: TableABA[] = [];
	delete_table_a_b_a_record_list: TableABA[] = [];

	//selected_table_a_b_a_list_icon: any = blank_icon;
	
	} else if (key === \"insert_table_a_b_a\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_table_a_b_a_record_list.length; i++) {
			this.table_a_b_a_list.push(this.insert_table_a_b_a_record_list[i]);
		}
		this.insert_table_a_b_a_record_list = [];
		this.table_a_b_a_table_data_source.data = this.table_a_b_a_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_table_a_b_a\") {
		let resultset: any[] = response.resultset;
		this.table_a_b_a_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.table_a_b_a_list.push(TableABA.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.table_a_b_a_list[i].table_a_b_a_icon);
		}

		this.table_a_b_a_table_data_source.data = this.table_a_b_a_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_table_a_b_a\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_table_a_b_a\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- table_a_b_a Form Controls ---------------------

	table_a_b_a_form: FormGroup;
	id_control: FormControl;
	a_b_id_control: FormControl;
	name_ar_control: FormControl;
	name_en_control: FormControl;
	date_control: FormControl;
	time_control: FormControl;
	timestamp_control: FormControl;
	boolean_control: FormControl;


	a_b_list_control: FormControl;


	a_b_array_control: FormArray;


	constructor() {

	this.id_control = new FormControl([]);
	this.a_b_id_control = new FormControl([]);
	this.name_ar_control = new FormControl([]);
	this.name_en_control = new FormControl([]);
	this.date_control = new FormControl([]);
	this.time_control = new FormControl([]);
	this.timestamp_control = new FormControl([]);
	this.boolean_control = new FormControl([]);

	this.a_b_list_control = new FormControl([]);

	this.a_b_list_control = new FormControl([]);


	this.a_b_array_control = new FormArray([]);



	this.table_a_b_a_form = form_builder.group({
		table_a_b_a_group: form_builder.group({
			id: this.id_control,
			a_b_id: this.a_b_id_control,
			name_ar: this.name_ar_control,
			name_en: this.name_en_control,
			date: this.date_control,
			time: this.time_control,
			timestamp: this.timestamp_control,
			boolean: this.boolean_control,

	a_b_check_list: this.a_b_array_control,

		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTableABARecord(selected_table_a_b_a_record: TableABA) {
		this.selected_table_a_b_a_record = selected_table_a_b_a_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	
		this.table_a_b_list.forEach( (table_a_b: TableAB) => {
			table_a_b.is_checked = false;
			let table_a_b_control: FormControl = new FormControl(table_a_b);
			table_a_b_control.['option_value'] = table_a_b;
			table_a_b_control.setValue(table_a_b_control['option_value']);
			this.table_a_b_array_control.push(table_a_b_control);
		});

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.table_a_b_a.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"table_a_b_a_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"table_a_b_a_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"id\" matInput type=\"number\"
					placeholder=\"{{i18.table_a_b_a.id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_b_a_group.id') === false }\" />
				<div *ngIf=\"isModified('table_a_b_a_group.id') && isValid('table_a_b_a_group.id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_b_a_group.id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box a_b_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"a_b_id\" matInput type=\"number\"
					placeholder=\"{{i18.table_a_b_a.a_b_id}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_b_a_group.a_b_id') === false }\" />
				<div *ngIf=\"isModified('table_a_b_a_group.a_b_id') && isValid('table_a_b_a_group.a_b_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_b_a_group.a_b_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_ar -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"name_ar\" matInput type=\"string\"
					placeholder=\"{{i18.table_a_b_a.name_ar}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_b_a_group.name_ar') === false }\" />
				<div *ngIf=\"isModified('table_a_b_a_group.name_ar') && isValid('table_a_b_a_group.name_ar') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_b_a_group.name_ar')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_en -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"name_en\" matInput type=\"string\"
					placeholder=\"{{i18.table_a_b_a.name_en}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_b_a_group.name_en') === false }\" />
				<div *ngIf=\"isModified('table_a_b_a_group.name_en') && isValid('table_a_b_a_group.name_en') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_b_a_group.name_en')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box time -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"time\" matInput type=\"Date\"
					placeholder=\"{{i18.table_a_b_a.time}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_b_a_group.time') === false }\" />
				<div *ngIf=\"isModified('table_a_b_a_group.time') && isValid('table_a_b_a_group.time') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_b_a_group.time')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box timestamp -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"timestamp\" matInput type=\"Date\"
					placeholder=\"{{i18.table_a_b_a.timestamp}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_b_a_group.timestamp') === false }\" />
				<div *ngIf=\"isModified('table_a_b_a_group.timestamp') && isValid('table_a_b_a_group.timestamp') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_b_a_group.timestamp')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box boolean -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"boolean\" matInput type=\"checkbox\"
					placeholder=\"{{i18.table_a_b_a.boolean}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_b_a_group.boolean') === false }\" />
				<div *ngIf=\"isModified('table_a_b_a_group.boolean') && isValid('table_a_b_a_group.boolean') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_b_a_group.boolean')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			
			<!-- Date Box date -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<mat-label>{{i18.table_a_b_a.date}}</mat-label>
				<input formControlName=\"date\" matInput [matDatepicker]=\"datepicker\" placeholder=\"{{ i18.table_a_b_a.date }}\">
				<mat-datepicker-toggle matPrefix [for]=\"datepicker\"></mat-datepicker-toggle>
				<mat-datepicker #datepicker></mat-datepicker>
			</mat-form-field>


		
			<!-- a_b_list -->
			<ng-container formArrayName=\"a_b_list\">
			  <div>
				<span>
				  <mat-checkbox [checked]=\"isAllListChecked(a_b_check_list)\" [color]=\"primary\"
					[indeterminate]=\"isIndeterminate(a_b_list)\"
					(change)=\"selectAllList($event, a_b_list)\">
					<img src=\"{{a_b_icon}}\" class=\"icon\" />
					{{ i18.a_b }}
				  </mat-checkbox>
				</span>
			  </div>
			  <div *ngFor=\"let a_b_control of a_b_array_control.controls; let i=index\">
				<span>
				  <mat-checkbox class=\"margin\" [formControl]=\"a_b_control\"
					[color]=\"primary\" [(ngModel)]=\"a_b_list[i].is_checked\">
					<img class=\"icon\" src=\"{{a_b_list[i].advertising_method_icon}}\" (error)=\"onImageError($event)\">
					{{a_b_list[i].advertising_method_name_i18[lang]}}
				  </mat-checkbox>
				</span>
			  </div>
			</ng-container>


			
			<!-- a_b List Box -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<mat-label>{{ i18.a_b }}</mat-label>
					<span matPrefix [style.display]=\"'flex'\">
					<img src=\"{{selected_table_a_b_list_icon}}\" class=\"icon\" />
				</span>
				<mat-select formControlName=\"a_b_list_option\" (selectionChange)=\"onChange$FOREIGN_TABLE_CLASS($event)\">
					<mat-option *ngFor=\"let option of table_a_b_list\" [value]=\"option\">
					<span><img class=\"icon\" src=\"{{option.table_a_b_icon}}\"
					(error)=\"onImageError($event)\">{{option.table_a_b_name_i18[lang]}}</span>
					</mat-option>
				</mat-select>
			</mat-form-field>


			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.TableABA.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.TableABA.title}}-->
	<img *ngIf=\"selected_table_a_b_a_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_b_a_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_b_a_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_b_a_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_b_a_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
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
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.table_a_b_a_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.table_a_b_a_list.length-1\" (click)=\"lastRecord()\">
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



------------------ table_a_b_a Form HTML Controls ---------------

","

----------- table_a_b_a MAT Table Controls ---------------------

	table_a_b_a_table_data_source: MatTableDataSource<TableABA>;
	table_a_b_a_table_columns: string[] = [
		\"id\",
		\"a_b_id\",
		\"name_ar\",
		\"name_en\",
		\"date\",
		\"time\",
		\"timestamp\",
		\"boolean\",
		\"name_i18\",
		\"a_b\"

		\"a_b\"

		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.table_a_b_a_list = [];
		this.table_a_b_a_table_data_source = new MatTableDataSource(this.table_a_b_a_list);
		this.table_a_b_a_table_data_source.data = this.table_a_b_a_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"table_a_b_a_table_data_source\" [dir]=\"direction\">

	<!-- Table Field id with _name_LANG -->
	<ng-container matColumnDef=\"id\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.TableABA.id}}</mat-header-cell>
		<mat-cell *matCellDef=\"let table_a_b_a_record;\">
			<img src=\"{{table_a_b_a_record.table_a_b_a_icon}}\" class=\"icon\" />
			{{table_a_b_a_record.table_a_b_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- Table -Field name_i18 -->
	<ng-container matColumnDef=\"table_a_b_a_name_i18\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.TableABA.table_a_b_a_name_i18}}</mat-header-cell>
		<mat-cell *matCellDef=\"let table_a_b_a_record;\">
			{{table_a_b_a_record.table_a_b_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>



	<!-- Table ~Field a_b with _name_LANG -->
	<ng-container matColumnDef=\"a_b\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.TableAB.a_b}}</mat-header-cell>
		<mat-cell *matCellDef=\"let table_a_b_a_record;\">
			<img src=\"{{table_a_b_a_record.table_a_b.table_a_b_icon}}\" class=\"icon\" />
			{{table_a_b_a_record.table_a_b.table_a_b_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let table_a_b_a_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(table_a_b_a_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let table_a_b_a_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(table_a_b_a_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"table_a_b_a_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let table_a_b_a_record; columns: table_a_b_a_table_columns\"></mat-row>
</mat-table>
------------------ table_a_b_a MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"id\": \"INT UNSIGNED\",
      \"a_b_id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"id\",
    \"a_b_id\",
    \"name_ar\",
    \"name_en\",
    \"date\",
    \"time\",
    \"timestamp\",
    \"boolean\"
  ],
  \"where\": {
    \"clause\": \"id>?\",
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
      \"id\": \"INT UNSIGNED\",
      \"a_b_id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"where\": {
    \"clause\": \"id=?\",
    \"fields\": [
      \"id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"id\": \"INT UNSIGNED\",
      \"a_b_id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"where\": {
    \"clause\": \"id=?\",
    \"fields\": [
      \"id\"
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
@WebServlet(\"/table_a_b_a\")
public class TableABA extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Table A B A\", \"parental\", \"parental\", \"table_a_b_a\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"id\", FieldType.Integer, false, false, \"id\").setPrimaryKeyAI();
        addField(\"a_b_id\", FieldType.Integer, true, false, \"a_b_id\");
        addField(\"name_ar\", FieldType.String, true, false, \"name_ar\").setTexLengthRange(4, 45);
        addField(\"name_en\", FieldType.String, true, false, \"name_en\").setTexLengthRange(4, 45);
        addField(\"date\", FieldType.Date, true, false, \"date\");
        addField(\"time\", FieldType.Time, true, false, \"time\");
        addField(\"timestamp\", FieldType.Timestamp, true, false, \"timestamp\");
        addField(\"boolean\", FieldType.Boolean, true, false, \"boolean\");
        
        addForeignKey(\"fk_table_a_b_a_1\", \"a_b_id\", \"table_a_b\", \"id\");
        
    }
}","/table_a_b_a")

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,33,7,'fields','Field','{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0}',"id",33,true,false,true,true,null,1,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,34,7,'fields','Field','{""name"":""a_b_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0}',"a_b_id",33,false,true,false,false,null,2,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,35,7,'fields','Field','{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0}',"name_ar",18,false,true,false,false,null,3,45,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,36,7,'fields','Field','{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0}',"name_en",18,false,true,false,false,null,4,45,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,37,7,'fields','Field','{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0}',"date",12,false,true,false,false,null,5,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,38,7,'fields','Field','{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0}',"time",13,false,true,false,false,null,6,8,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,39,7,'fields','Field','{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0}',"timestamp",15,false,true,false,false,null,7,19,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,40,7,'fields','Field','{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}',"boolean",10,false,true,false,false,null,8,1,0)

*sql*
INSERT INTO `model`.`primarykey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,7,7,'primaryKeys','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primarykeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,7,7,'primary_key_field_list','PrimaryKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`foreignkey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`referencedkeyname`,`foreignkeytablename`,`referencedkeytablename`,`key_sequence`,`update_rule`,`delete_rule`,`deferrability`) VALUES (500,1,5,7,'foreignKeys','ForeignKey','{""name"":""fk_table_a_b_a_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_b_a"",""referencedKeyTableName"":""table_a_b"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_b_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}',"fk_table_a_b_a_1","PRIMARY","table_a_b_a","table_a_b",1,"1","1","7")

*sql*
INSERT INTO `model`.`foreignkeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,5,5,'foreignKeyFields','ForeignKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`referencedkeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,5,5,'referencedKeyFields','ReferencedKeyField','{""name"":""a_b_id""}',"a_b_id")

*sql*
INSERT INTO `model`.`table`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,8,1,'tables','Table','{""name"":""table_a_c"",""rows"":0,""fields"":[{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0},{""name"":""a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0},{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0},{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0},{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0},{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0},{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0},{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}],""foreignKeys"":[{""name"":""fk_table_a_c_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_c"",""referencedKeyTableName"":""table_a"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}],""childTables"":[]}',"table_a_c",0,"package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href=\"AUTHOR_EMAIL\">AUTHOR_EMAIL</a>
 */
public class TableAC {
    public Integer id;
    public Integer a_id;
    public String name_ar;
    public String name_en;
    public Date date;
    public Time time;
    public Timestamp timestamp;
    public Boolean boolean;
    public TableA table_a;

    public TableAC(
        Integer id,
        Integer a_id,
        String name_ar,
        String name_en,
        Date date,
        Time time,
        Timestamp timestamp,
        Boolean boolean,
        TableA table_a
    ) {
        this.id = id;
        this.a_id = a_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.table_a = table_a;
    }
}
","export class TableAC extends RecordControl {
    id?: number;
    a_id?: number;
    name_ar?: string;
    name_en?: string;
    date?: Date;
    time?: Date;
    timestamp?: Date;
    boolean?: boolean;
    name_i18?: StringI18;
    a?: TableA | null;

    constructor(
        id?: number,
        a_id?: number,
        name_ar?: string,
        name_en?: string,
        date?: Date,
        time?: Date,
        timestamp?: Date,
        boolean?: boolean,
        a?: TableA | null
    ) {
		super();
        this.id = id;
        this.a_id = a_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.name_i18 = new StringI18(name_ar, name_en);
        this.a = a;
    
    }
    
    equals(table_a_c: TableAC) {
        return table_a_c != null
        && this.id == table_a_c.id;
    }
    
    static fromJSON(json: any) : TableAC {
        return new TableAC(
            json.id,
            json.a_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            null
        );
    }
    
    static fromJSONObjectList(json: any, a: TableA | null) : TableAC {
        return new TableAC(
            json.id,
            json.a_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            a
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            id: this.id,
            a_id: this.a_id,
            name_ar: this.name_ar,
            name_en: this.name_en,
            date: this.date.toISOString(),
            time: this.time.toISOString(),
            timestamp: this.timestamp.toISOString(),
            boolean: this.boolean
        };
    }
    
}
","	insertTableAC(table_a_c: TableAC[]) {
		this.insert_table_a_c_record_list.push(table_a_c);
		let servlet_url: string = Constants.tariff_url + \"/table_a_c\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: \"insert\",
			values: [
				{
					id: table_a_c.id,
					a_id: table_a_c.a_id,
					name_ar: table_a_c.name_ar,
					name_en: table_a_c.name_en,
					date: table_a_c.date,
					time: table_a_c.time,
					timestamp: table_a_c.timestamp,
					boolean: table_a_c.boolean

				}
			],
			parameters: []
		}
		this.sendPost(this, \"insert_table_a_c\", servlet_url, request, http_headers, http_parameters);
	}

	selectTableAC(table_a_c: TableAC[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a_c\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBSelect = {
			transaction: \"select\",
			engine: \"memory\",
			view: \"object\",
			select: [
				\"id\",
				\"a_id\",
				\"name_ar\",
				\"name_en\",
				\"date\",
				\"time\",
				\"timestamp\",
				\"boolean\"

			],
			where: {
				clause: \"\",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, \"select_table_a_c\", servlet_url, request, http_headers, http_parameters);
	}

	updateTableAC(table_a_c: TableAC[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a_c\";
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
					id: table_a_c.id,
					a_id: table_a_c.a_id,
					name_ar: table_a_c.name_ar,
					name_en: table_a_c.name_en,
					date: table_a_c.date,
					time: table_a_c.time,
					timestamp: table_a_c.timestamp,
					boolean: table_a_c.boolean

				}
			],
			where: {
				clause: \"\",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, \"update_table_a_c\", servlet_url, request, http_headers, http_parameters);
	}

	deleteTableAC(table_a_c: TableAC[]) {
		let servlet_url: string = Constants.tariff_url + \"/table_a_c\";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set(\"Content-Type\", \"application/json; charset=UTF-8\");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set(\"\", \"\");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: \"delete\",
			values: [
				{
					id: table_a_c.id,
					a_id: table_a_c.a_id,
					name_ar: table_a_c.name_ar,
					name_en: table_a_c.name_en,
					date: table_a_c.date,
					time: table_a_c.time,
					timestamp: table_a_c.timestamp,
					boolean: table_a_c.boolean

				}
			],
			where: {
			  clause: \"\",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, \"delete_table_a_c\", servlet_url, request, http_headers, http_parameters);
	}

	table_a_c_list: TableAC[] = [];
	selected_table_a_c_option: TableAC;
	selected_table_a_c_record: TableAC;

	insert_table_a_c_record_list: TableAC[] = [];
	update_table_a_c_record_list: TableAC[] = [];
	delete_table_a_c_record_list: TableAC[] = [];

	//selected_table_a_c_list_icon: any = blank_icon;
	
	} else if (key === \"insert_table_a_c\") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_table_a_c_record_list.length; i++) {
			this.table_a_c_list.push(this.insert_table_a_c_record_list[i]);
		}
		this.insert_table_a_c_record_list = [];
		this.table_a_c_table_data_source.data = this.table_a_c_list;
		//this.snackbar.open(this.i18.insert_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"select_table_a_c\") {
		let resultset: any[] = response.resultset;
		this.table_a_c_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.table_a_c_list.push(TableAC.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.table_a_c_list[i].table_a_c_icon);
		}

		this.table_a_c_table_data_source.data = this.table_a_c_list;
		//this.snackbar.open(this.i18.select_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"update_table_a_c\") {
		//this.snackbar.open(this.i18.update_success, \"x\", {duration: 5 * 1000});
	} else if (key === \"delete_table_a_c\") {
		//this.snackbar.open(this.i18.delete_success, \"x\", {duration: 5 * 1000});
	}

","

----------- table_a_c Form Controls ---------------------

	table_a_c_form: FormGroup;
	id_control: FormControl;
	a_id_control: FormControl;
	name_ar_control: FormControl;
	name_en_control: FormControl;
	date_control: FormControl;
	time_control: FormControl;
	timestamp_control: FormControl;
	boolean_control: FormControl;


	a_list_control: FormControl;


	a_array_control: FormArray;


	constructor() {

	this.id_control = new FormControl([]);
	this.a_id_control = new FormControl([]);
	this.name_ar_control = new FormControl([]);
	this.name_en_control = new FormControl([]);
	this.date_control = new FormControl([]);
	this.time_control = new FormControl([]);
	this.timestamp_control = new FormControl([]);
	this.boolean_control = new FormControl([]);

	this.a_list_control = new FormControl([]);

	this.a_list_control = new FormControl([]);


	this.a_array_control = new FormArray([]);



	this.table_a_c_form = form_builder.group({
		table_a_c_group: form_builder.group({
			id: this.id_control,
			a_id: this.a_id_control,
			name_ar: this.name_ar_control,
			name_en: this.name_en_control,
			date: this.date_control,
			time: this.time_control,
			timestamp: this.timestamp_control,
			boolean: this.boolean_control,

	a_check_list: this.a_array_control,

		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTableACRecord(selected_table_a_c_record: TableAC) {
		this.selected_table_a_c_record = selected_table_a_c_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	
		this.table_a_list.forEach( (table_a: TableA) => {
			table_a.is_checked = false;
			let table_a_control: FormControl = new FormControl(table_a);
			table_a_control.['option_value'] = table_a;
			table_a_control.setValue(table_a_control['option_value']);
			this.table_a_array_control.push(table_a_control);
		});

	
	}","<div class=\"container\">
    <p class=\"card\">{{i18.table_a_c.title')}}</p>
<ng-container *ngIf=\"show_confirmation==false\">
<form class=\"form yes-mouse\" [formGroup]=\"table_a_c_form\" [dir]=\"direction\">
	<div role=\"group\" formGroupName=\"table_a_c_group\" [hidden]=\"false\" [dir]=\"direction\">
		<div class=\"form-group\" [dir]=\"direction\">
		
			<!-- Text Box id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"id\" matInput type=\"number\"
					placeholder=\"{{i18.table_a_c.id}}\"
					required=\"false\" [readonly]=\"true\" [disabled]=\"true\" 
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_c_group.id') === false }\" />
				<div *ngIf=\"isModified('table_a_c_group.id') && isValid('table_a_c_group.id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_c_group.id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box a_id -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"a_id\" matInput type=\"number\"
					placeholder=\"{{i18.table_a_c.a_id}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_c_group.a_id') === false }\" />
				<div *ngIf=\"isModified('table_a_c_group.a_id') && isValid('table_a_c_group.a_id') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_c_group.a_id')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_ar -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"name_ar\" matInput type=\"string\"
					placeholder=\"{{i18.table_a_c.name_ar}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_c_group.name_ar') === false }\" />
				<div *ngIf=\"isModified('table_a_c_group.name_ar') && isValid('table_a_c_group.name_ar') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_c_group.name_ar')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_en -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"name_en\" matInput type=\"string\"
					placeholder=\"{{i18.table_a_c.name_en}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_c_group.name_en') === false }\" />
				<div *ngIf=\"isModified('table_a_c_group.name_en') && isValid('table_a_c_group.name_en') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_c_group.name_en')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box time -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"time\" matInput type=\"Date\"
					placeholder=\"{{i18.table_a_c.time}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_c_group.time') === false }\" />
				<div *ngIf=\"isModified('table_a_c_group.time') && isValid('table_a_c_group.time') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_c_group.time')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box timestamp -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"timestamp\" matInput type=\"Date\"
					placeholder=\"{{i18.table_a_c.timestamp}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_c_group.timestamp') === false }\" />
				<div *ngIf=\"isModified('table_a_c_group.timestamp') && isValid('table_a_c_group.timestamp') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_c_group.timestamp')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box boolean -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<input formControlName=\"boolean\" matInput type=\"checkbox\"
					placeholder=\"{{i18.table_a_c.boolean}}\"
					required=\"false\"  
					[ngClass]=\"{ 'is-invalid': isValidFieldValue('table_a_c_group.boolean') === false }\" />
				<div *ngIf=\"isModified('table_a_c_group.boolean') && isValid('table_a_c_group.boolean') === false\" class=\"alert alert-danger\">
					<ng-container *ngFor=\"let field_error of getFieldErrors('table_a_c_group.boolean')\">
						<div class=\"warning\">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			
			<!-- Date Box date -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<mat-label>{{i18.table_a_c.date}}</mat-label>
				<input formControlName=\"date\" matInput [matDatepicker]=\"datepicker\" placeholder=\"{{ i18.table_a_c.date }}\">
				<mat-datepicker-toggle matPrefix [for]=\"datepicker\"></mat-datepicker-toggle>
				<mat-datepicker #datepicker></mat-datepicker>
			</mat-form-field>


		
			<!-- a_list -->
			<ng-container formArrayName=\"a_list\">
			  <div>
				<span>
				  <mat-checkbox [checked]=\"isAllListChecked(a_check_list)\" [color]=\"primary\"
					[indeterminate]=\"isIndeterminate(a_list)\"
					(change)=\"selectAllList($event, a_list)\">
					<img src=\"{{a_icon}}\" class=\"icon\" />
					{{ i18.a }}
				  </mat-checkbox>
				</span>
			  </div>
			  <div *ngFor=\"let a_control of a_array_control.controls; let i=index\">
				<span>
				  <mat-checkbox class=\"margin\" [formControl]=\"a_control\"
					[color]=\"primary\" [(ngModel)]=\"a_list[i].is_checked\">
					<img class=\"icon\" src=\"{{a_list[i].advertising_method_icon}}\" (error)=\"onImageError($event)\">
					{{a_list[i].advertising_method_name_i18[lang]}}
				  </mat-checkbox>
				</span>
			  </div>
			</ng-container>


			
			<!-- a List Box -->
			<mat-form-field [appearance]=\"outline\" [dir]=\"direction\">
				<mat-label>{{ i18.a }}</mat-label>
					<span matPrefix [style.display]=\"'flex'\">
					<img src=\"{{selected_table_a_list_icon}}\" class=\"icon\" />
				</span>
				<mat-select formControlName=\"a_list_option\" (selectionChange)=\"onChange$FOREIGN_TABLE_CLASS($event)\">
					<mat-option *ngFor=\"let option of table_a_list\" [value]=\"option\">
					<span><img class=\"icon\" src=\"{{option.table_a_icon}}\"
					(error)=\"onImageError($event)\">{{option.table_a_name_i18[lang]}}</span>
					</mat-option>
				</mat-select>
			</mat-form-field>


			
        </div>
	</div>
</form>
<div class=\"tool-box\" [dir]=\"direction\">{{'Controls - ' + i18.TableAC.title}}</div>
<div class=\"form-group yes-mouse\" [dir]=\"direction\">
<div class=\"tool-box yes-mouse\" [dir]=\"direction\">
	<!--{{'Controls - ' + i18.TableAC.title}}-->
	<img *ngIf=\"selected_table_a_c_record.record_state == null\" src=\"{{ICON.blank_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_c_record.record_state == INSERT\" src=\"{{ICON.insert_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_c_record.record_state == SELECT\" src=\"{{ICON.true_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_c_record.record_state == UPDATE\" src=\"{{ICON.update_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
	<img *ngIf=\"selected_table_a_c_record.record_state == DELETE\" src=\"{{ICON.delete_record_icon}}\" (error)=\"ICON.blank_icon\" class=\"icon\" />
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
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.next_record}}\" [disabled]=\"cursor == this.table_a_c_list.length-1\" (click)=\"nextRecord()\">
		<span class=\"tool-box-button-front\" [dir]=\"direction\">
			{{ i18.next }}
		</span>
	</button>
	<button class=\"tool-box-button-pushable yes-mouse\" matTooltip=\"{{i18.last_record}}\" [disabled]=\"cursor == this.table_a_c_list.length-1\" (click)=\"lastRecord()\">
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



------------------ table_a_c Form HTML Controls ---------------

","

----------- table_a_c MAT Table Controls ---------------------

	table_a_c_table_data_source: MatTableDataSource<TableAC>;
	table_a_c_table_columns: string[] = [
		\"id\",
		\"a_id\",
		\"name_ar\",
		\"name_en\",
		\"date\",
		\"time\",
		\"timestamp\",
		\"boolean\",
		\"name_i18\",
		\"a\"

		\"a\"

		\"select_record\",
		\"delete_record\"	];
	
	
	constructor() {
		this.table_a_c_list = [];
		this.table_a_c_table_data_source = new MatTableDataSource(this.table_a_c_list);
		this.table_a_c_table_data_source.data = this.table_a_c_list;
	}
	
	
","<mat-table class=\"just-table mat-elevation-z8\" [dataSource]=\"table_a_c_table_data_source\" [dir]=\"direction\">

	<!-- Table Field id with _name_LANG -->
	<ng-container matColumnDef=\"id\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.TableAC.id}}</mat-header-cell>
		<mat-cell *matCellDef=\"let table_a_c_record;\">
			<img src=\"{{table_a_c_record.table_a_c_icon}}\" class=\"icon\" />
			{{table_a_c_record.table_a_c_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- Table -Field name_i18 -->
	<ng-container matColumnDef=\"table_a_c_name_i18\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.TableAC.table_a_c_name_i18}}</mat-header-cell>
		<mat-cell *matCellDef=\"let table_a_c_record;\">
			{{table_a_c_record.table_a_c_name_i18[lang]}}
		</mat-cell>
	</ng-container>



	<!-- Table ~Field a with _name_LANG -->
	<ng-container matColumnDef=\"a\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.TableA.a}}</mat-header-cell>
		<mat-cell *matCellDef=\"let table_a_c_record;\">
			<img src=\"{{table_a_c_record.table_a.table_a_icon}}\" class=\"icon\" />
			{{table_a_c_record.table_a.table_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- extra controls -->
	<ng-container matColumnDef=\"select_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let table_a_c_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"selectRecord(table_a_c_record)\">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef=\"delete_record\">
		<mat-header-cell *matHeaderCellDef class=\"table-nice-back-blue\">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef=\"let table_a_c_record;\">
				<button mat-raised-button color=\"nice-green\" class=\"yes-mouse\" (click)=\"deleteRecord(table_a_c_record)\">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef=\"table_a_c_table_columns\">
	</mat-header-row>
	<mat-row *matRowDef=\"let table_a_c_record; columns: table_a_c_table_columns\"></mat-row>
</mat-table>
------------------ table_a_c MAT Table HTML Controls ---------------

","{
  \"transaction\": \"insert\",
  \"values\": [
    {
      \"id\": \"INT UNSIGNED\",
      \"a_id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"parameters\": []
}

{
  \"transaction\": \"select\",
  \"engine\": \"memory\",
  \"view\": \"object\",
  \"select\": [
    \"id\",
    \"a_id\",
    \"name_ar\",
    \"name_en\",
    \"date\",
    \"time\",
    \"timestamp\",
    \"boolean\"
  ],
  \"where\": {
    \"clause\": \"id>?\",
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
      \"id\": \"INT UNSIGNED\",
      \"a_id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"where\": {
    \"clause\": \"id=?\",
    \"fields\": [
      \"id\"
    ]
  },
  \"parameters\": []
}

{
  \"transaction\": \"delete\",
  \"values\": [
    {
      \"id\": \"INT UNSIGNED\",
      \"a_id\": \"INT UNSIGNED\",
      \"name_ar\": \"VARCHAR\",
      \"name_en\": \"VARCHAR\",
      \"date\": \"DATE\",
      \"time\": \"TIME\",
      \"timestamp\": \"TIMESTAMP\",
      \"boolean\": \"BIT\"
    }
  ],
  \"where\": {
    \"clause\": \"id=?\",
    \"fields\": [
      \"id\"
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
@WebServlet(\"/table_a_c\")
public class TableAC extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet(\"Table A C\", \"parental\", \"parental\", \"table_a_c\");//, true, false);
        defineTransactions(\"insert\", \"select\", \"update\", \"delete\");
        addField(\"id\", FieldType.Integer, false, false, \"id\").setPrimaryKeyAI();
        addField(\"a_id\", FieldType.Integer, true, false, \"a_id\");
        addField(\"name_ar\", FieldType.String, true, false, \"name_ar\").setTexLengthRange(4, 45);
        addField(\"name_en\", FieldType.String, true, false, \"name_en\").setTexLengthRange(4, 45);
        addField(\"date\", FieldType.Date, true, false, \"date\");
        addField(\"time\", FieldType.Time, true, false, \"time\");
        addField(\"timestamp\", FieldType.Timestamp, true, false, \"timestamp\");
        addField(\"boolean\", FieldType.Boolean, true, false, \"boolean\");
        
        addForeignKey(\"fk_table_a_c_1\", \"a_id\", \"table_a\", \"id\");
        
    }
}","/table_a_c")

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,41,8,'fields','Field','{""name"":""id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":true,""list_order"":1,""size"":10,""decimalDigits"":0}',"id",33,true,false,true,true,null,1,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,42,8,'fields','Field','{""name"":""a_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":2,""size"":10,""decimalDigits"":0}',"a_id",33,false,true,false,false,null,2,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,43,8,'fields','Field','{""name"":""name_ar"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":3,""size"":45,""decimalDigits"":0}',"name_ar",18,false,true,false,false,null,3,45,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,44,8,'fields','Field','{""name"":""name_en"",""dataTypeName"":""VARCHAR"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":4,""size"":45,""decimalDigits"":0}',"name_en",18,false,true,false,false,null,4,45,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,45,8,'fields','Field','{""name"":""date"",""dataTypeName"":""DATE"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":5,""size"":10,""decimalDigits"":0}',"date",12,false,true,false,false,null,5,10,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,46,8,'fields','Field','{""name"":""time"",""dataTypeName"":""TIME"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":6,""size"":8,""decimalDigits"":0}',"time",13,false,true,false,false,null,6,8,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,47,8,'fields','Field','{""name"":""timestamp"",""dataTypeName"":""TIMESTAMP"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":7,""size"":19,""decimalDigits"":0}',"timestamp",15,false,true,false,false,null,7,19,0)

*sql*
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,48,8,'fields','Field','{""name"":""boolean"",""dataTypeName"":""BIT"",""primary_key"":false,""nullable"":true,""autoIncrment"":false,""foreign_reference"":false,""list_order"":8,""size"":1,""decimalDigits"":0}',"boolean",10,false,true,false,false,null,8,1,0)

*sql*
INSERT INTO `model`.`primarykey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,8,8,'primaryKeys','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primarykeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,8,8,'primary_key_field_list','PrimaryKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`foreignkey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`referencedkeyname`,`foreignkeytablename`,`referencedkeytablename`,`key_sequence`,`update_rule`,`delete_rule`,`deferrability`) VALUES (500,1,6,8,'foreignKeys','ForeignKey','{""name"":""fk_table_a_c_1"",""referencedKeyname"":""PRIMARY"",""foreignKeyTableName"":""table_a_c"",""referencedKeyTableName"":""table_a"",""foreignKeyFields"":[{""name"":""id""}],""referencedKeyFields"":[{""name"":""a_id""}],""key_sequence"":1,""update_rule"":""1"",""delete_rule"":""1"",""deferrability"":""7""}',"fk_table_a_c_1","PRIMARY","table_a_c","table_a",1,"1","1","7")

*sql*
INSERT INTO `model`.`foreignkeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,6,6,'foreignKeyFields','ForeignKeyField','{""name"":""id""}',"id")

*sql*
INSERT INTO `model`.`referencedkeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,6,6,'referencedKeyFields','ReferencedKeyField','{""name"":""a_id""}',"a_id")

*sql*
INSERT INTO `model`.`table`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`rows`,`java_data_structure_class`,`typescript_data_structure_class`,`typescript_request_send_response`,`typescript_form_component_ts`,`typescript_form_component_html`,`typescript_table_component_ts`,`typescript_table_component_html`,`http_requests`,`database_servlet_class`,`database_servlet_uri`) VALUES (500,1,9,1,'tables','Table','{""name"":""tree_model"",""rows"":0,""fields"":[{""name"":""node_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0}],""primaryKeys"":[{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""node_id""}]}],""foreignKeys"":[],""childTables"":[]}',"tree_model",0,"package net.reyadeyat.relational.api.model;

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
				fields: [
					
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
			  fields: [
				
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
    \"fields\": [
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
    \"fields\": [
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
INSERT INTO `model`.`field`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`,`datatypename`,`primary_key`,`nullable`,`autoincrment`,`foreign_reference`,`defaultvalue`,`list_order`,`size`,`decimaldigits`) VALUES (500,1,49,9,'fields','Field','{""name"":""node_id"",""dataTypeName"":""INT UNSIGNED"",""primary_key"":true,""nullable"":false,""autoIncrment"":true,""foreign_reference"":false,""list_order"":1,""size"":10,""decimalDigits"":0}',"node_id",33,true,false,true,false,null,1,10,0)

*sql*
INSERT INTO `model`.`primarykey`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,9,9,'primaryKeys','PrimaryKey','{""name"":""PRIMARY"",""primary_key_field_list"":[{""name"":""node_id""}]}',"PRIMARY")

*sql*
INSERT INTO `model`.`primarykeyfield`(`model_id`,`model_instance_id`,`child_id`,`parent_id`,`declared_field_name`,`class_name`,`json_object`,`name`) VALUES (500,1,9,9,'primary_key_field_list','PrimaryKeyField','{""name"":""node_id""}',"node_id")
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
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #1]
                        F-[name]-"auto_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #2]
                        F-[name]-"string_key"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"128"
                        F-[decimalDigits]-"0"
                  T-[Field #3]
                        F-[name]-"some_data"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"3"
                        F-[size]-"256"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #1]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #1]
                              F-[name]-"auto_id"
            T-[Table #2]
                  F-[name]-"fact_master"
                  F-[rows]-"0"
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #4]
                        F-[name]-"fact_master_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #5]
                        F-[name]-"fact_master_data"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #2]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #2]
                              F-[name]-"fact_master_id"
                  T-[ChildTable #1]
                        F-[tableName]-"fact_transaction"
                        F-[parentTableName]-"fact_master"
                        F-[foreigKeyName]-"fk_fact_transaction_01"
                  T-[ChildTable #2]
                        F-[tableName]-"fact_transaction"
                        F-[parentTableName]-"fact_master"
                        F-[foreigKeyName]-"fk_fact_transaction_02"
            T-[Table #3]
                  F-[name]-"fact_transaction"
                  F-[rows]-"0"
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #6]
                        F-[name]-"fact_transaction_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #7]
                        F-[name]-"fact_master_a_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #8]
                        F-[name]-"fact_master_b_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"3"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #9]
                        F-[name]-"fact_transaction_data"
                        F-[dataTypeName]-"DECIMAL"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"4"
                        F-[size]-"18"
                        F-[decimalDigits]-"6"
                  T-[PrimaryKey #3]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #3]
                              F-[name]-"fact_transaction_id"
                  T-[ForeignKey #1]
                        F-[name]-"fk_fact_transaction_01"
                        F-[referencedKeyname]-"PRIMARY"
                        F-[foreignKeyTableName]-"fact_transaction"
                        F-[referencedKeyTableName]-"fact_master"
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
                        F-[referencedKeyname]-"PRIMARY"
                        F-[foreignKeyTableName]-"fact_transaction"
                        F-[referencedKeyTableName]-"fact_master"
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
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #10]
                        F-[name]-"id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #11]
                        F-[name]-"name_ar"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #12]
                        F-[name]-"name_en"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #13]
                        F-[name]-"date"
                        F-[dataTypeName]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"4"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #14]
                        F-[name]-"time"
                        F-[dataTypeName]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"5"
                        F-[size]-"8"
                        F-[decimalDigits]-"0"
                  T-[Field #15]
                        F-[name]-"timestamp"
                        F-[dataTypeName]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"6"
                        F-[size]-"19"
                        F-[decimalDigits]-"0"
                  T-[Field #16]
                        F-[name]-"boolean"
                        F-[dataTypeName]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"7"
                        F-[size]-"1"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #4]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #4]
                              F-[name]-"id"
                  T-[ChildTable #3]
                        F-[tableName]-"table_a_a"
                        F-[parentTableName]-"table_a"
                        F-[foreigKeyName]-"fk_table_a_a_1"
                  T-[ChildTable #4]
                        F-[tableName]-"table_a_b"
                        F-[parentTableName]-"table_a"
                        F-[foreigKeyName]-"fk_table_a_b_1"
                  T-[ChildTable #5]
                        F-[tableName]-"table_a_c"
                        F-[parentTableName]-"table_a"
                        F-[foreigKeyName]-"fk_table_a_c_1"
            T-[Table #5]
                  F-[name]-"table_a_a"
                  F-[rows]-"0"
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #17]
                        F-[name]-"id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"true"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #18]
                        F-[name]-"a_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #19]
                        F-[name]-"name_ar"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #20]
                        F-[name]-"name_en"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #21]
                        F-[name]-"date"
                        F-[dataTypeName]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #22]
                        F-[name]-"time"
                        F-[dataTypeName]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimalDigits]-"0"
                  T-[Field #23]
                        F-[name]-"timestamp"
                        F-[dataTypeName]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimalDigits]-"0"
                  T-[Field #24]
                        F-[name]-"boolean"
                        F-[dataTypeName]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #5]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #5]
                              F-[name]-"id"
                  T-[ForeignKey #3]
                        F-[name]-"fk_table_a_a_1"
                        F-[referencedKeyname]-"PRIMARY"
                        F-[foreignKeyTableName]-"table_a_a"
                        F-[referencedKeyTableName]-"table_a"
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
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #25]
                        F-[name]-"id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"true"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #26]
                        F-[name]-"a_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #27]
                        F-[name]-"name_ar"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #28]
                        F-[name]-"name_en"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #29]
                        F-[name]-"date"
                        F-[dataTypeName]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #30]
                        F-[name]-"time"
                        F-[dataTypeName]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimalDigits]-"0"
                  T-[Field #31]
                        F-[name]-"timestamp"
                        F-[dataTypeName]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimalDigits]-"0"
                  T-[Field #32]
                        F-[name]-"boolean"
                        F-[dataTypeName]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #6]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #6]
                              F-[name]-"id"
                  T-[ForeignKey #4]
                        F-[name]-"fk_table_a_b_1"
                        F-[referencedKeyname]-"PRIMARY"
                        F-[foreignKeyTableName]-"table_a_b"
                        F-[referencedKeyTableName]-"table_a"
                        F-[key_sequence]-"1"
                        F-[update_rule]-"1"
                        F-[delete_rule]-"1"
                        F-[deferrability]-"7"
                        T-[ForeignKeyField #4]
                              F-[name]-"id"
                        T-[ReferencedKeyField #4]
                              F-[name]-"a_id"
                  T-[ChildTable #6]
                        F-[tableName]-"table_a_b_a"
                        F-[parentTableName]-"table_a_b"
                        F-[foreigKeyName]-"fk_table_a_b_a_1"
            T-[Table #7]
                  F-[name]-"table_a_b_a"
                  F-[rows]-"0"
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #33]
                        F-[name]-"id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"true"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #34]
                        F-[name]-"a_b_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #35]
                        F-[name]-"name_ar"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #36]
                        F-[name]-"name_en"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #37]
                        F-[name]-"date"
                        F-[dataTypeName]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #38]
                        F-[name]-"time"
                        F-[dataTypeName]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimalDigits]-"0"
                  T-[Field #39]
                        F-[name]-"timestamp"
                        F-[dataTypeName]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimalDigits]-"0"
                  T-[Field #40]
                        F-[name]-"boolean"
                        F-[dataTypeName]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #7]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #7]
                              F-[name]-"id"
                  T-[ForeignKey #5]
                        F-[name]-"fk_table_a_b_a_1"
                        F-[referencedKeyname]-"PRIMARY"
                        F-[foreignKeyTableName]-"table_a_b_a"
                        F-[referencedKeyTableName]-"table_a_b"
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
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #41]
                        F-[name]-"id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"true"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #42]
                        F-[name]-"a_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"2"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #43]
                        F-[name]-"name_ar"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"3"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #44]
                        F-[name]-"name_en"
                        F-[dataTypeName]-"VARCHAR"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"4"
                        F-[size]-"45"
                        F-[decimalDigits]-"0"
                  T-[Field #45]
                        F-[name]-"date"
                        F-[dataTypeName]-"DATE"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"5"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
                  T-[Field #46]
                        F-[name]-"time"
                        F-[dataTypeName]-"TIME"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"6"
                        F-[size]-"8"
                        F-[decimalDigits]-"0"
                  T-[Field #47]
                        F-[name]-"timestamp"
                        F-[dataTypeName]-"TIMESTAMP"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"7"
                        F-[size]-"19"
                        F-[decimalDigits]-"0"
                  T-[Field #48]
                        F-[name]-"boolean"
                        F-[dataTypeName]-"BIT"
                        F-[primary_key]-"false"
                        F-[nullable]-"true"
                        F-[autoIncrment]-"false"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"8"
                        F-[size]-"1"
                        F-[decimalDigits]-"0"
                  T-[PrimaryKey #8]
                        F-[name]-"PRIMARY"
                        T-[PrimaryKeyField #8]
                              F-[name]-"id"
                  T-[ForeignKey #6]
                        F-[name]-"fk_table_a_c_1"
                        F-[referencedKeyname]-"PRIMARY"
                        F-[foreignKeyTableName]-"table_a_c"
                        F-[referencedKeyTableName]-"table_a"
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
                  F-[java_data_structure_class]-"..."
                  F-[typescript_data_structure_class]-"..."
                  F-[typescript_request_send_response]-"..."
                  F-[typescript_form_component_ts]-"..."
                  F-[typescript_form_component_html]-"..."
                  F-[typescript_table_component_ts]-"..."
                  F-[typescript_table_component_html]-"..."
                  F-[http_requests]-"..."
                  F-[database_servlet_class]-"..."
                  F-[database_servlet_uri]-"..."
                  T-[Field #49]
                        F-[name]-"node_id"
                        F-[dataTypeName]-"INT UNSIGNED"
                        F-[primary_key]-"true"
                        F-[nullable]-"false"
                        F-[autoIncrment]-"true"
                        F-[foreign_reference]-"false"
                        F-[defaultValue] (null)"
                        F-[list_order]-"1"
                        F-[size]-"10"
                        F-[decimalDigits]-"0"
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
public class CompoundKey {
    public Integer auto_id;
    public String string_key;
    public String some_data;

    public CompoundKey(
        Integer auto_id,
        String string_key,
        String some_data
    ) {
        this.auto_id = auto_id;
        this.string_key = string_key;
        this.some_data = some_data;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class FactMaster {
    public Integer fact_master_id;
    public String fact_master_data;

    public FactMaster(
        Integer fact_master_id,
        String fact_master_data
    ) {
        this.fact_master_id = fact_master_id;
        this.fact_master_data = fact_master_data;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class FactTransaction {
    public Integer fact_transaction_id;
    public Integer fact_master_a_id;
    public Integer fact_master_b_id;
    public BigDecimal fact_transaction_data;
    public FactMaster fact_master;
    public FactMaster fact_master;

    public FactTransaction(
        Integer fact_transaction_id,
        Integer fact_master_a_id,
        Integer fact_master_b_id,
        BigDecimal fact_transaction_data,
        FactMaster fact_master,
        FactMaster fact_master
    ) {
        this.fact_transaction_id = fact_transaction_id;
        this.fact_master_a_id = fact_master_a_id;
        this.fact_master_b_id = fact_master_b_id;
        this.fact_transaction_data = fact_transaction_data;
        this.fact_master = fact_master;
        this.fact_master = fact_master;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class TableA {
    public Integer id;
    public String name_ar;
    public String name_en;
    public Date date;
    public Time time;
    public Timestamp timestamp;
    public Boolean boolean;

    public TableA(
        Integer id,
        String name_ar,
        String name_en,
        Date date,
        Time time,
        Timestamp timestamp,
        Boolean boolean
    ) {
        this.id = id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class TableAA {
    public Integer id;
    public Integer a_id;
    public String name_ar;
    public String name_en;
    public Date date;
    public Time time;
    public Timestamp timestamp;
    public Boolean boolean;
    public TableA table_a;

    public TableAA(
        Integer id,
        Integer a_id,
        String name_ar,
        String name_en,
        Date date,
        Time time,
        Timestamp timestamp,
        Boolean boolean,
        TableA table_a
    ) {
        this.id = id;
        this.a_id = a_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.table_a = table_a;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class TableAB {
    public Integer id;
    public Integer a_id;
    public String name_ar;
    public String name_en;
    public Date date;
    public Time time;
    public Timestamp timestamp;
    public Boolean boolean;
    public TableA table_a;

    public TableAB(
        Integer id,
        Integer a_id,
        String name_ar,
        String name_en,
        Date date,
        Time time,
        Timestamp timestamp,
        Boolean boolean,
        TableA table_a
    ) {
        this.id = id;
        this.a_id = a_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.table_a = table_a;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class TableABA {
    public Integer id;
    public Integer a_b_id;
    public String name_ar;
    public String name_en;
    public Date date;
    public Time time;
    public Timestamp timestamp;
    public Boolean boolean;
    public TableAB table_ab;

    public TableABA(
        Integer id,
        Integer a_b_id,
        String name_ar,
        String name_en,
        Date date,
        Time time,
        Timestamp timestamp,
        Boolean boolean,
        TableAB table_ab
    ) {
        this.id = id;
        this.a_b_id = a_b_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.table_ab = table_ab;
    }
}


package net.reyadeyat.relational.api.model;

/**
 *
 * @author AUTHOR_NAME
 * <a href="AUTHOR_EMAIL">AUTHOR_EMAIL</a>
 */
public class TableAC {
    public Integer id;
    public Integer a_id;
    public String name_ar;
    public String name_en;
    public Date date;
    public Time time;
    public Timestamp timestamp;
    public Boolean boolean;
    public TableA table_a;

    public TableAC(
        Integer id,
        Integer a_id,
        String name_ar,
        String name_en,
        Date date,
        Time time,
        Timestamp timestamp,
        Boolean boolean,
        TableA table_a
    ) {
        this.id = id;
        this.a_id = a_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.table_a = table_a;
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
@WebServlet("/compound_key")
public class CompoundKey extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Compound Key", "parental", "parental", "compound_key");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("auto_id", FieldType.Integer, false, false, "auto_id").setPrimaryKeyAI();
        addField("string_key", FieldType.String, false, false, "string_key").setTexLengthRange(4, 128);
        addField("some_data", FieldType.String, false, false, "some_data").setTexLengthRange(4, 256);
        
        
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
@WebServlet("/fact_master")
public class FactMaster extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Fact Master", "parental", "parental", "fact_master");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("fact_master_id", FieldType.Integer, false, false, "fact_master_id").setPrimaryKeyAI();
        addField("fact_master_data", FieldType.String, true, false, "fact_master_data").setTexLengthRange(4, 45);
        
        
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
@WebServlet("/fact_transaction")
public class FactTransaction extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Fact Transaction", "parental", "parental", "fact_transaction");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("fact_transaction_id", FieldType.Integer, false, false, "fact_transaction_id").setPrimaryKeyAI();
        addField("fact_master_a_id", FieldType.Integer, true, false, "fact_master_a_id");
        addField("fact_master_b_id", FieldType.Integer, true, false, "fact_master_b_id");
        addField("fact_transaction_data", FieldType.BigDecimal, true, false, "fact_transaction_data");
        
        addForeignKey("fk_fact_transaction_01", "fact_master_a_id", "fact_master", "fact_master_id");
        addForeignKey("fk_fact_transaction_02", "fact_master_b_id", "fact_master", "fact_master_id");
        
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
@WebServlet("/table_a")
public class TableA extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Table A", "parental", "parental", "table_a");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("id", FieldType.Integer, false, false, "id").setPrimaryKeyAI();
        addField("name_ar", FieldType.String, true, false, "name_ar").setTexLengthRange(4, 45);
        addField("name_en", FieldType.String, true, false, "name_en").setTexLengthRange(4, 45);
        addField("date", FieldType.Date, true, false, "date");
        addField("time", FieldType.Time, true, false, "time");
        addField("timestamp", FieldType.Timestamp, true, false, "timestamp");
        addField("boolean", FieldType.Boolean, true, false, "boolean");
        
        
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
@WebServlet("/table_a_a")
public class TableAA extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Table A A", "parental", "parental", "table_a_a");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("id", FieldType.Integer, false, false, "id").setPrimaryKeyAI();
        addField("a_id", FieldType.Integer, true, false, "a_id");
        addField("name_ar", FieldType.String, true, false, "name_ar").setTexLengthRange(4, 45);
        addField("name_en", FieldType.String, true, false, "name_en").setTexLengthRange(4, 45);
        addField("date", FieldType.Date, true, false, "date");
        addField("time", FieldType.Time, true, false, "time");
        addField("timestamp", FieldType.Timestamp, true, false, "timestamp");
        addField("boolean", FieldType.Boolean, true, false, "boolean");
        
        addForeignKey("fk_table_a_a_1", "a_id", "table_a", "id");
        
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
@WebServlet("/table_a_b")
public class TableAB extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Table A B", "parental", "parental", "table_a_b");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("id", FieldType.Integer, false, false, "id").setPrimaryKeyAI();
        addField("a_id", FieldType.Integer, true, false, "a_id");
        addField("name_ar", FieldType.String, true, false, "name_ar").setTexLengthRange(4, 45);
        addField("name_en", FieldType.String, true, false, "name_en").setTexLengthRange(4, 45);
        addField("date", FieldType.Date, true, false, "date");
        addField("time", FieldType.Time, true, false, "time");
        addField("timestamp", FieldType.Timestamp, true, false, "timestamp");
        addField("boolean", FieldType.Boolean, true, false, "boolean");
        
        addForeignKey("fk_table_a_b_1", "a_id", "table_a", "id");
        
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
@WebServlet("/table_a_b_a")
public class TableABA extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Table A B A", "parental", "parental", "table_a_b_a");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("id", FieldType.Integer, false, false, "id").setPrimaryKeyAI();
        addField("a_b_id", FieldType.Integer, true, false, "a_b_id");
        addField("name_ar", FieldType.String, true, false, "name_ar").setTexLengthRange(4, 45);
        addField("name_en", FieldType.String, true, false, "name_en").setTexLengthRange(4, 45);
        addField("date", FieldType.Date, true, false, "date");
        addField("time", FieldType.Time, true, false, "time");
        addField("timestamp", FieldType.Timestamp, true, false, "timestamp");
        addField("boolean", FieldType.Boolean, true, false, "boolean");
        
        addForeignKey("fk_table_a_b_a_1", "a_b_id", "table_a_b", "id");
        
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
@WebServlet("/table_a_c")
public class TableAC extends DatabaseServlet {
    
    @Override
    protected void doInit() throws Exception {
        defineServlet("Table A C", "parental", "parental", "table_a_c");//, true, false);
        defineTransactions("insert", "select", "update", "delete");
        addField("id", FieldType.Integer, false, false, "id").setPrimaryKeyAI();
        addField("a_id", FieldType.Integer, true, false, "a_id");
        addField("name_ar", FieldType.String, true, false, "name_ar").setTexLengthRange(4, 45);
        addField("name_en", FieldType.String, true, false, "name_en").setTexLengthRange(4, 45);
        addField("date", FieldType.Date, true, false, "date");
        addField("time", FieldType.Time, true, false, "time");
        addField("timestamp", FieldType.Timestamp, true, false, "timestamp");
        addField("boolean", FieldType.Boolean, true, false, "boolean");
        
        addForeignKey("fk_table_a_c_1", "a_id", "table_a", "id");
        
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


export class CompoundKey extends RecordControl {
    auto_id?: number;
    string_key?: string;
    some_data?: string;

    constructor(
        auto_id?: number,
        string_key?: string,
        some_data?: string
    ) {
		super();
        this.auto_id = auto_id;
        this.string_key = string_key;
        this.some_data = some_data;
    
    }
    
    equals(compound_key: CompoundKey) {
        return compound_key != null
        && this.auto_id == compound_key.auto_id;
    }
    
    static fromJSON(json: any) : CompoundKey {
        return new CompoundKey(
            json.auto_id,
            json.string_key,
            json.some_data
        );
    }
    
    static fromJSONObjectList(json: any) : CompoundKey {
        return new CompoundKey(
            json.auto_id,
            json.string_key,
            json.some_data
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            auto_id: this.auto_id,
            string_key: this.string_key,
            some_data: this.some_data
        };
    }
    
}


export class FactMaster extends RecordControl {
    fact_master_id?: number;
    fact_master_data?: string;

    constructor(
        fact_master_id?: number,
        fact_master_data?: string
    ) {
		super();
        this.fact_master_id = fact_master_id;
        this.fact_master_data = fact_master_data;
    
    }
    
    equals(fact_master: FactMaster) {
        return fact_master != null
        && this.fact_master_id == fact_master.fact_master_id;
    }
    
    static fromJSON(json: any) : FactMaster {
        return new FactMaster(
            json.fact_master_id,
            json.fact_master_data
        );
    }
    
    static fromJSONObjectList(json: any) : FactMaster {
        return new FactMaster(
            json.fact_master_id,
            json.fact_master_data
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            fact_master_id: this.fact_master_id,
            fact_master_data: this.fact_master_data
        };
    }
    
}


export class FactTransaction extends RecordControl {
    fact_transaction_id?: number;
    fact_master_a_id?: number;
    fact_master_b_id?: number;
    fact_transaction_data?: number;
    fact_master_a?: FactMaster | null;
    fact_master_b?: FactMaster | null;

    constructor(
        fact_transaction_id?: number,
        fact_master_a_id?: number,
        fact_master_b_id?: number,
        fact_transaction_data?: number,
        fact_master_a?: FactMaster | null,
        fact_master_b?: FactMaster | null
    ) {
		super();
        this.fact_transaction_id = fact_transaction_id;
        this.fact_master_a_id = fact_master_a_id;
        this.fact_master_b_id = fact_master_b_id;
        this.fact_transaction_data = fact_transaction_data;
        this.fact_master_a = fact_master_a;
        this.fact_master_b = fact_master_b;
    
    }
    
    equals(fact_transaction: FactTransaction) {
        return fact_transaction != null
        && this.fact_transaction_id == fact_transaction.fact_transaction_id;
    }
    
    static fromJSON(json: any) : FactTransaction {
        return new FactTransaction(
            json.fact_transaction_id,
            json.fact_master_a_id,
            json.fact_master_b_id,
            json.fact_transaction_data,
            null,
            null
        );
    }
    
    static fromJSONObjectList(json: any, fact_master_a: FactMaster | null, fact_master_b: FactMaster | null) : FactTransaction {
        return new FactTransaction(
            json.fact_transaction_id,
            json.fact_master_a_id,
            json.fact_master_b_id,
            json.fact_transaction_data,
            fact_master_a,
            fact_master_b
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            fact_transaction_id: this.fact_transaction_id,
            fact_master_a_id: this.fact_master_a_id,
            fact_master_b_id: this.fact_master_b_id,
            fact_transaction_data: this.fact_transaction_data
        };
    }
    
}


export class TableA extends RecordControl {
    id?: number;
    name_ar?: string;
    name_en?: string;
    date?: Date;
    time?: Date;
    timestamp?: Date;
    boolean?: boolean;
    name_i18?: StringI18;

    constructor(
        id?: number,
        name_ar?: string,
        name_en?: string,
        date?: Date,
        time?: Date,
        timestamp?: Date,
        boolean?: boolean
    ) {
		super();
        this.id = id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.name_i18 = new StringI18(name_ar, name_en);
    
    }
    
    equals(table_a: TableA) {
        return table_a != null
        && this.id == table_a.id;
    }
    
    static fromJSON(json: any) : TableA {
        return new TableA(
            json.id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean
        );
    }
    
    static fromJSONObjectList(json: any) : TableA {
        return new TableA(
            json.id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            id: this.id,
            name_ar: this.name_ar,
            name_en: this.name_en,
            date: this.date.toISOString(),
            time: this.time.toISOString(),
            timestamp: this.timestamp.toISOString(),
            boolean: this.boolean
        };
    }
    
}


export class TableAA extends RecordControl {
    id?: number;
    a_id?: number;
    name_ar?: string;
    name_en?: string;
    date?: Date;
    time?: Date;
    timestamp?: Date;
    boolean?: boolean;
    name_i18?: StringI18;
    a?: TableA | null;

    constructor(
        id?: number,
        a_id?: number,
        name_ar?: string,
        name_en?: string,
        date?: Date,
        time?: Date,
        timestamp?: Date,
        boolean?: boolean,
        a?: TableA | null
    ) {
		super();
        this.id = id;
        this.a_id = a_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.name_i18 = new StringI18(name_ar, name_en);
        this.a = a;
    
    }
    
    equals(table_a_a: TableAA) {
        return table_a_a != null
        && this.id == table_a_a.id;
    }
    
    static fromJSON(json: any) : TableAA {
        return new TableAA(
            json.id,
            json.a_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            null
        );
    }
    
    static fromJSONObjectList(json: any, a: TableA | null) : TableAA {
        return new TableAA(
            json.id,
            json.a_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            a
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            id: this.id,
            a_id: this.a_id,
            name_ar: this.name_ar,
            name_en: this.name_en,
            date: this.date.toISOString(),
            time: this.time.toISOString(),
            timestamp: this.timestamp.toISOString(),
            boolean: this.boolean
        };
    }
    
}


export class TableAB extends RecordControl {
    id?: number;
    a_id?: number;
    name_ar?: string;
    name_en?: string;
    date?: Date;
    time?: Date;
    timestamp?: Date;
    boolean?: boolean;
    name_i18?: StringI18;
    a?: TableA | null;

    constructor(
        id?: number,
        a_id?: number,
        name_ar?: string,
        name_en?: string,
        date?: Date,
        time?: Date,
        timestamp?: Date,
        boolean?: boolean,
        a?: TableA | null
    ) {
		super();
        this.id = id;
        this.a_id = a_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.name_i18 = new StringI18(name_ar, name_en);
        this.a = a;
    
    }
    
    equals(table_a_b: TableAB) {
        return table_a_b != null
        && this.id == table_a_b.id;
    }
    
    static fromJSON(json: any) : TableAB {
        return new TableAB(
            json.id,
            json.a_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            null
        );
    }
    
    static fromJSONObjectList(json: any, a: TableA | null) : TableAB {
        return new TableAB(
            json.id,
            json.a_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            a
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            id: this.id,
            a_id: this.a_id,
            name_ar: this.name_ar,
            name_en: this.name_en,
            date: this.date.toISOString(),
            time: this.time.toISOString(),
            timestamp: this.timestamp.toISOString(),
            boolean: this.boolean
        };
    }
    
}


export class TableABA extends RecordControl {
    id?: number;
    a_b_id?: number;
    name_ar?: string;
    name_en?: string;
    date?: Date;
    time?: Date;
    timestamp?: Date;
    boolean?: boolean;
    name_i18?: StringI18;
    a_b?: TableAB | null;

    constructor(
        id?: number,
        a_b_id?: number,
        name_ar?: string,
        name_en?: string,
        date?: Date,
        time?: Date,
        timestamp?: Date,
        boolean?: boolean,
        a_b?: TableAB | null
    ) {
		super();
        this.id = id;
        this.a_b_id = a_b_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.name_i18 = new StringI18(name_ar, name_en);
        this.a_b = a_b;
    
    }
    
    equals(table_a_b_a: TableABA) {
        return table_a_b_a != null
        && this.id == table_a_b_a.id;
    }
    
    static fromJSON(json: any) : TableABA {
        return new TableABA(
            json.id,
            json.a_b_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            null
        );
    }
    
    static fromJSONObjectList(json: any, a_b: TableAB | null) : TableABA {
        return new TableABA(
            json.id,
            json.a_b_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            a_b
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            id: this.id,
            a_b_id: this.a_b_id,
            name_ar: this.name_ar,
            name_en: this.name_en,
            date: this.date.toISOString(),
            time: this.time.toISOString(),
            timestamp: this.timestamp.toISOString(),
            boolean: this.boolean
        };
    }
    
}


export class TableAC extends RecordControl {
    id?: number;
    a_id?: number;
    name_ar?: string;
    name_en?: string;
    date?: Date;
    time?: Date;
    timestamp?: Date;
    boolean?: boolean;
    name_i18?: StringI18;
    a?: TableA | null;

    constructor(
        id?: number,
        a_id?: number,
        name_ar?: string,
        name_en?: string,
        date?: Date,
        time?: Date,
        timestamp?: Date,
        boolean?: boolean,
        a?: TableA | null
    ) {
		super();
        this.id = id;
        this.a_id = a_id;
        this.name_ar = name_ar;
        this.name_en = name_en;
        this.date = date;
        this.time = time;
        this.timestamp = timestamp;
        this.boolean = boolean;
        this.name_i18 = new StringI18(name_ar, name_en);
        this.a = a;
    
    }
    
    equals(table_a_c: TableAC) {
        return table_a_c != null
        && this.id == table_a_c.id;
    }
    
    static fromJSON(json: any) : TableAC {
        return new TableAC(
            json.id,
            json.a_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            null
        );
    }
    
    static fromJSONObjectList(json: any, a: TableA | null) : TableAC {
        return new TableAC(
            json.id,
            json.a_id,
            json.name_ar,
            json.name_en,
            new Date(json.date),
            new Date(new Date().toISOString().substring(0,10)+' '+json.time),
            new Date(json.timestamp),
            json.boolean,
            a
        );
    }
    
    toJSON() : any {
        //return JSON.stringify(this);
        return {
			is_checked: this.is_checked,
			free_text: this.free_text,
            id: this.id,
            a_id: this.a_id,
            name_ar: this.name_ar,
            name_en: this.name_en,
            date: this.date.toISOString(),
            time: this.time.toISOString(),
            timestamp: this.timestamp.toISOString(),
            boolean: this.boolean
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


	insertCompoundKey(compound_key: CompoundKey[]) {
		this.insert_compound_key_record_list.push(compound_key);
		let servlet_url: string = Constants.tariff_url + "/compound_key";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					auto_id: compound_key.auto_id,
					string_key: compound_key.string_key,
					some_data: compound_key.some_data

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_compound_key", servlet_url, request, http_headers, http_parameters);
	}

	selectCompoundKey(compound_key: CompoundKey[]) {
		let servlet_url: string = Constants.tariff_url + "/compound_key";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"auto_id",
				"string_key",
				"some_data"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_compound_key", servlet_url, request, http_headers, http_parameters);
	}

	updateCompoundKey(compound_key: CompoundKey[]) {
		let servlet_url: string = Constants.tariff_url + "/compound_key";
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
					auto_id: compound_key.auto_id,
					string_key: compound_key.string_key,
					some_data: compound_key.some_data

				}
			],
			where: {
				clause: "",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_compound_key", servlet_url, request, http_headers, http_parameters);
	}

	deleteCompoundKey(compound_key: CompoundKey[]) {
		let servlet_url: string = Constants.tariff_url + "/compound_key";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					auto_id: compound_key.auto_id,
					string_key: compound_key.string_key,
					some_data: compound_key.some_data

				}
			],
			where: {
			  clause: "",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_compound_key", servlet_url, request, http_headers, http_parameters);
	}

	compound_key_list: CompoundKey[] = [];
	selected_compound_key_option: CompoundKey;
	selected_compound_key_record: CompoundKey;

	insert_compound_key_record_list: CompoundKey[] = [];
	update_compound_key_record_list: CompoundKey[] = [];
	delete_compound_key_record_list: CompoundKey[] = [];

	//selected_compound_key_list_icon: any = blank_icon;
	
	} else if (key === "insert_compound_key") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_compound_key_record_list.length; i++) {
			this.compound_key_list.push(this.insert_compound_key_record_list[i]);
		}
		this.insert_compound_key_record_list = [];
		this.compound_key_table_data_source.data = this.compound_key_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_compound_key") {
		let resultset: any[] = response.resultset;
		this.compound_key_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.compound_key_list.push(CompoundKey.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.compound_key_list[i].compound_key_icon);
		}

		this.compound_key_table_data_source.data = this.compound_key_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_compound_key") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_compound_key") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertFactMaster(fact_master: FactMaster[]) {
		this.insert_fact_master_record_list.push(fact_master);
		let servlet_url: string = Constants.tariff_url + "/fact_master";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					fact_master_id: fact_master.fact_master_id,
					fact_master_data: fact_master.fact_master_data

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_fact_master", servlet_url, request, http_headers, http_parameters);
	}

	selectFactMaster(fact_master: FactMaster[]) {
		let servlet_url: string = Constants.tariff_url + "/fact_master";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"fact_master_id",
				"fact_master_data"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_fact_master", servlet_url, request, http_headers, http_parameters);
	}

	updateFactMaster(fact_master: FactMaster[]) {
		let servlet_url: string = Constants.tariff_url + "/fact_master";
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
					fact_master_id: fact_master.fact_master_id,
					fact_master_data: fact_master.fact_master_data

				}
			],
			where: {
				clause: "",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_fact_master", servlet_url, request, http_headers, http_parameters);
	}

	deleteFactMaster(fact_master: FactMaster[]) {
		let servlet_url: string = Constants.tariff_url + "/fact_master";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					fact_master_id: fact_master.fact_master_id,
					fact_master_data: fact_master.fact_master_data

				}
			],
			where: {
			  clause: "",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_fact_master", servlet_url, request, http_headers, http_parameters);
	}

	fact_master_list: FactMaster[] = [];
	selected_fact_master_option: FactMaster;
	selected_fact_master_record: FactMaster;

	insert_fact_master_record_list: FactMaster[] = [];
	update_fact_master_record_list: FactMaster[] = [];
	delete_fact_master_record_list: FactMaster[] = [];

	//selected_fact_master_list_icon: any = blank_icon;
	
	} else if (key === "insert_fact_master") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_fact_master_record_list.length; i++) {
			this.fact_master_list.push(this.insert_fact_master_record_list[i]);
		}
		this.insert_fact_master_record_list = [];
		this.fact_master_table_data_source.data = this.fact_master_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_fact_master") {
		let resultset: any[] = response.resultset;
		this.fact_master_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.fact_master_list.push(FactMaster.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.fact_master_list[i].fact_master_icon);
		}

		this.fact_master_table_data_source.data = this.fact_master_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_fact_master") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_fact_master") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertFactTransaction(fact_transaction: FactTransaction[]) {
		this.insert_fact_transaction_record_list.push(fact_transaction);
		let servlet_url: string = Constants.tariff_url + "/fact_transaction";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					fact_transaction_id: fact_transaction.fact_transaction_id,
					fact_master_a_id: fact_transaction.fact_master_a_id,
					fact_master_b_id: fact_transaction.fact_master_b_id,
					fact_transaction_data: fact_transaction.fact_transaction_data

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_fact_transaction", servlet_url, request, http_headers, http_parameters);
	}

	selectFactTransaction(fact_transaction: FactTransaction[]) {
		let servlet_url: string = Constants.tariff_url + "/fact_transaction";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"fact_transaction_id",
				"fact_master_a_id",
				"fact_master_b_id",
				"fact_transaction_data"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_fact_transaction", servlet_url, request, http_headers, http_parameters);
	}

	updateFactTransaction(fact_transaction: FactTransaction[]) {
		let servlet_url: string = Constants.tariff_url + "/fact_transaction";
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
					fact_transaction_id: fact_transaction.fact_transaction_id,
					fact_master_a_id: fact_transaction.fact_master_a_id,
					fact_master_b_id: fact_transaction.fact_master_b_id,
					fact_transaction_data: fact_transaction.fact_transaction_data

				}
			],
			where: {
				clause: "",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_fact_transaction", servlet_url, request, http_headers, http_parameters);
	}

	deleteFactTransaction(fact_transaction: FactTransaction[]) {
		let servlet_url: string = Constants.tariff_url + "/fact_transaction";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					fact_transaction_id: fact_transaction.fact_transaction_id,
					fact_master_a_id: fact_transaction.fact_master_a_id,
					fact_master_b_id: fact_transaction.fact_master_b_id,
					fact_transaction_data: fact_transaction.fact_transaction_data

				}
			],
			where: {
			  clause: "",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_fact_transaction", servlet_url, request, http_headers, http_parameters);
	}

	fact_transaction_list: FactTransaction[] = [];
	selected_fact_transaction_option: FactTransaction;
	selected_fact_transaction_record: FactTransaction;

	insert_fact_transaction_record_list: FactTransaction[] = [];
	update_fact_transaction_record_list: FactTransaction[] = [];
	delete_fact_transaction_record_list: FactTransaction[] = [];

	//selected_fact_transaction_list_icon: any = blank_icon;
	
	} else if (key === "insert_fact_transaction") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_fact_transaction_record_list.length; i++) {
			this.fact_transaction_list.push(this.insert_fact_transaction_record_list[i]);
		}
		this.insert_fact_transaction_record_list = [];
		this.fact_transaction_table_data_source.data = this.fact_transaction_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_fact_transaction") {
		let resultset: any[] = response.resultset;
		this.fact_transaction_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.fact_transaction_list.push(FactTransaction.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.fact_transaction_list[i].fact_transaction_icon);
		}

		this.fact_transaction_table_data_source.data = this.fact_transaction_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_fact_transaction") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_fact_transaction") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertTableA(table_a: TableA[]) {
		this.insert_table_a_record_list.push(table_a);
		let servlet_url: string = Constants.tariff_url + "/table_a";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					id: table_a.id,
					name_ar: table_a.name_ar,
					name_en: table_a.name_en,
					date: table_a.date,
					time: table_a.time,
					timestamp: table_a.timestamp,
					boolean: table_a.boolean

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_table_a", servlet_url, request, http_headers, http_parameters);
	}

	selectTableA(table_a: TableA[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"id",
				"name_ar",
				"name_en",
				"date",
				"time",
				"timestamp",
				"boolean"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_table_a", servlet_url, request, http_headers, http_parameters);
	}

	updateTableA(table_a: TableA[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a";
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
					id: table_a.id,
					name_ar: table_a.name_ar,
					name_en: table_a.name_en,
					date: table_a.date,
					time: table_a.time,
					timestamp: table_a.timestamp,
					boolean: table_a.boolean

				}
			],
			where: {
				clause: "",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_table_a", servlet_url, request, http_headers, http_parameters);
	}

	deleteTableA(table_a: TableA[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					id: table_a.id,
					name_ar: table_a.name_ar,
					name_en: table_a.name_en,
					date: table_a.date,
					time: table_a.time,
					timestamp: table_a.timestamp,
					boolean: table_a.boolean

				}
			],
			where: {
			  clause: "",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_table_a", servlet_url, request, http_headers, http_parameters);
	}

	table_a_list: TableA[] = [];
	selected_table_a_option: TableA;
	selected_table_a_record: TableA;

	insert_table_a_record_list: TableA[] = [];
	update_table_a_record_list: TableA[] = [];
	delete_table_a_record_list: TableA[] = [];

	//selected_table_a_list_icon: any = blank_icon;
	
	} else if (key === "insert_table_a") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_table_a_record_list.length; i++) {
			this.table_a_list.push(this.insert_table_a_record_list[i]);
		}
		this.insert_table_a_record_list = [];
		this.table_a_table_data_source.data = this.table_a_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_table_a") {
		let resultset: any[] = response.resultset;
		this.table_a_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.table_a_list.push(TableA.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.table_a_list[i].table_a_icon);
		}

		this.table_a_table_data_source.data = this.table_a_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_table_a") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_table_a") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertTableAA(table_a_a: TableAA[]) {
		this.insert_table_a_a_record_list.push(table_a_a);
		let servlet_url: string = Constants.tariff_url + "/table_a_a";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					id: table_a_a.id,
					a_id: table_a_a.a_id,
					name_ar: table_a_a.name_ar,
					name_en: table_a_a.name_en,
					date: table_a_a.date,
					time: table_a_a.time,
					timestamp: table_a_a.timestamp,
					boolean: table_a_a.boolean

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_table_a_a", servlet_url, request, http_headers, http_parameters);
	}

	selectTableAA(table_a_a: TableAA[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a_a";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"id",
				"a_id",
				"name_ar",
				"name_en",
				"date",
				"time",
				"timestamp",
				"boolean"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_table_a_a", servlet_url, request, http_headers, http_parameters);
	}

	updateTableAA(table_a_a: TableAA[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a_a";
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
					id: table_a_a.id,
					a_id: table_a_a.a_id,
					name_ar: table_a_a.name_ar,
					name_en: table_a_a.name_en,
					date: table_a_a.date,
					time: table_a_a.time,
					timestamp: table_a_a.timestamp,
					boolean: table_a_a.boolean

				}
			],
			where: {
				clause: "",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_table_a_a", servlet_url, request, http_headers, http_parameters);
	}

	deleteTableAA(table_a_a: TableAA[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a_a";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					id: table_a_a.id,
					a_id: table_a_a.a_id,
					name_ar: table_a_a.name_ar,
					name_en: table_a_a.name_en,
					date: table_a_a.date,
					time: table_a_a.time,
					timestamp: table_a_a.timestamp,
					boolean: table_a_a.boolean

				}
			],
			where: {
			  clause: "",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_table_a_a", servlet_url, request, http_headers, http_parameters);
	}

	table_a_a_list: TableAA[] = [];
	selected_table_a_a_option: TableAA;
	selected_table_a_a_record: TableAA;

	insert_table_a_a_record_list: TableAA[] = [];
	update_table_a_a_record_list: TableAA[] = [];
	delete_table_a_a_record_list: TableAA[] = [];

	//selected_table_a_a_list_icon: any = blank_icon;
	
	} else if (key === "insert_table_a_a") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_table_a_a_record_list.length; i++) {
			this.table_a_a_list.push(this.insert_table_a_a_record_list[i]);
		}
		this.insert_table_a_a_record_list = [];
		this.table_a_a_table_data_source.data = this.table_a_a_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_table_a_a") {
		let resultset: any[] = response.resultset;
		this.table_a_a_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.table_a_a_list.push(TableAA.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.table_a_a_list[i].table_a_a_icon);
		}

		this.table_a_a_table_data_source.data = this.table_a_a_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_table_a_a") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_table_a_a") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertTableAB(table_a_b: TableAB[]) {
		this.insert_table_a_b_record_list.push(table_a_b);
		let servlet_url: string = Constants.tariff_url + "/table_a_b";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					id: table_a_b.id,
					a_id: table_a_b.a_id,
					name_ar: table_a_b.name_ar,
					name_en: table_a_b.name_en,
					date: table_a_b.date,
					time: table_a_b.time,
					timestamp: table_a_b.timestamp,
					boolean: table_a_b.boolean

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_table_a_b", servlet_url, request, http_headers, http_parameters);
	}

	selectTableAB(table_a_b: TableAB[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a_b";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"id",
				"a_id",
				"name_ar",
				"name_en",
				"date",
				"time",
				"timestamp",
				"boolean"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_table_a_b", servlet_url, request, http_headers, http_parameters);
	}

	updateTableAB(table_a_b: TableAB[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a_b";
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
					id: table_a_b.id,
					a_id: table_a_b.a_id,
					name_ar: table_a_b.name_ar,
					name_en: table_a_b.name_en,
					date: table_a_b.date,
					time: table_a_b.time,
					timestamp: table_a_b.timestamp,
					boolean: table_a_b.boolean

				}
			],
			where: {
				clause: "",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_table_a_b", servlet_url, request, http_headers, http_parameters);
	}

	deleteTableAB(table_a_b: TableAB[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a_b";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					id: table_a_b.id,
					a_id: table_a_b.a_id,
					name_ar: table_a_b.name_ar,
					name_en: table_a_b.name_en,
					date: table_a_b.date,
					time: table_a_b.time,
					timestamp: table_a_b.timestamp,
					boolean: table_a_b.boolean

				}
			],
			where: {
			  clause: "",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_table_a_b", servlet_url, request, http_headers, http_parameters);
	}

	table_a_b_list: TableAB[] = [];
	selected_table_a_b_option: TableAB;
	selected_table_a_b_record: TableAB;

	insert_table_a_b_record_list: TableAB[] = [];
	update_table_a_b_record_list: TableAB[] = [];
	delete_table_a_b_record_list: TableAB[] = [];

	//selected_table_a_b_list_icon: any = blank_icon;
	
	} else if (key === "insert_table_a_b") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_table_a_b_record_list.length; i++) {
			this.table_a_b_list.push(this.insert_table_a_b_record_list[i]);
		}
		this.insert_table_a_b_record_list = [];
		this.table_a_b_table_data_source.data = this.table_a_b_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_table_a_b") {
		let resultset: any[] = response.resultset;
		this.table_a_b_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.table_a_b_list.push(TableAB.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.table_a_b_list[i].table_a_b_icon);
		}

		this.table_a_b_table_data_source.data = this.table_a_b_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_table_a_b") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_table_a_b") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertTableABA(table_a_b_a: TableABA[]) {
		this.insert_table_a_b_a_record_list.push(table_a_b_a);
		let servlet_url: string = Constants.tariff_url + "/table_a_b_a";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					id: table_a_b_a.id,
					a_b_id: table_a_b_a.a_b_id,
					name_ar: table_a_b_a.name_ar,
					name_en: table_a_b_a.name_en,
					date: table_a_b_a.date,
					time: table_a_b_a.time,
					timestamp: table_a_b_a.timestamp,
					boolean: table_a_b_a.boolean

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_table_a_b_a", servlet_url, request, http_headers, http_parameters);
	}

	selectTableABA(table_a_b_a: TableABA[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a_b_a";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"id",
				"a_b_id",
				"name_ar",
				"name_en",
				"date",
				"time",
				"timestamp",
				"boolean"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_table_a_b_a", servlet_url, request, http_headers, http_parameters);
	}

	updateTableABA(table_a_b_a: TableABA[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a_b_a";
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
					id: table_a_b_a.id,
					a_b_id: table_a_b_a.a_b_id,
					name_ar: table_a_b_a.name_ar,
					name_en: table_a_b_a.name_en,
					date: table_a_b_a.date,
					time: table_a_b_a.time,
					timestamp: table_a_b_a.timestamp,
					boolean: table_a_b_a.boolean

				}
			],
			where: {
				clause: "",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_table_a_b_a", servlet_url, request, http_headers, http_parameters);
	}

	deleteTableABA(table_a_b_a: TableABA[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a_b_a";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					id: table_a_b_a.id,
					a_b_id: table_a_b_a.a_b_id,
					name_ar: table_a_b_a.name_ar,
					name_en: table_a_b_a.name_en,
					date: table_a_b_a.date,
					time: table_a_b_a.time,
					timestamp: table_a_b_a.timestamp,
					boolean: table_a_b_a.boolean

				}
			],
			where: {
			  clause: "",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_table_a_b_a", servlet_url, request, http_headers, http_parameters);
	}

	table_a_b_a_list: TableABA[] = [];
	selected_table_a_b_a_option: TableABA;
	selected_table_a_b_a_record: TableABA;

	insert_table_a_b_a_record_list: TableABA[] = [];
	update_table_a_b_a_record_list: TableABA[] = [];
	delete_table_a_b_a_record_list: TableABA[] = [];

	//selected_table_a_b_a_list_icon: any = blank_icon;
	
	} else if (key === "insert_table_a_b_a") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_table_a_b_a_record_list.length; i++) {
			this.table_a_b_a_list.push(this.insert_table_a_b_a_record_list[i]);
		}
		this.insert_table_a_b_a_record_list = [];
		this.table_a_b_a_table_data_source.data = this.table_a_b_a_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_table_a_b_a") {
		let resultset: any[] = response.resultset;
		this.table_a_b_a_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.table_a_b_a_list.push(TableABA.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.table_a_b_a_list[i].table_a_b_a_icon);
		}

		this.table_a_b_a_table_data_source.data = this.table_a_b_a_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_table_a_b_a") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_table_a_b_a") {
		//this.snackbar.open(this.i18.delete_success, "x", {duration: 5 * 1000});
	}



	insertTableAC(table_a_c: TableAC[]) {
		this.insert_table_a_c_record_list.push(table_a_c);
		let servlet_url: string = Constants.tariff_url + "/table_a_c";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBInsert = <DBInsert><unknown>{
			transaction: "insert",
			values: [
				{
					id: table_a_c.id,
					a_id: table_a_c.a_id,
					name_ar: table_a_c.name_ar,
					name_en: table_a_c.name_en,
					date: table_a_c.date,
					time: table_a_c.time,
					timestamp: table_a_c.timestamp,
					boolean: table_a_c.boolean

				}
			],
			parameters: []
		}
		this.sendPost(this, "insert_table_a_c", servlet_url, request, http_headers, http_parameters);
	}

	selectTableAC(table_a_c: TableAC[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a_c";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBSelect = {
			transaction: "select",
			engine: "memory",
			view: "object",
			select: [
				"id",
				"a_id",
				"name_ar",
				"name_en",
				"date",
				"time",
				"timestamp",
				"boolean"

			],
			where: {
				clause: "",
				values: []
			},
			orderby: []
		}
		this.sendPost(this, "select_table_a_c", servlet_url, request, http_headers, http_parameters);
	}

	updateTableAC(table_a_c: TableAC[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a_c";
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
					id: table_a_c.id,
					a_id: table_a_c.a_id,
					name_ar: table_a_c.name_ar,
					name_en: table_a_c.name_en,
					date: table_a_c.date,
					time: table_a_c.time,
					timestamp: table_a_c.timestamp,
					boolean: table_a_c.boolean

				}
			],
			where: {
				clause: "",
				fields: [
					
				]
			},
			parameters: {}
		}
		this.sendPost(this, "update_table_a_c", servlet_url, request, http_headers, http_parameters);
	}

	deleteTableAC(table_a_c: TableAC[]) {
		let servlet_url: string = Constants.tariff_url + "/table_a_c";
		let http_headers: HttpHeaders = new HttpHeaders();
		http_headers.set("Content-Type", "application/json; charset=UTF-8");
		let http_parameters: HttpParams = new HttpParams();
		//http_parameters.set("", "");
		const request: DBUpdate = <DBUpdate><unknown>{
			transaction: "delete",
			values: [
				{
					id: table_a_c.id,
					a_id: table_a_c.a_id,
					name_ar: table_a_c.name_ar,
					name_en: table_a_c.name_en,
					date: table_a_c.date,
					time: table_a_c.time,
					timestamp: table_a_c.timestamp,
					boolean: table_a_c.boolean

				}
			],
			where: {
			  clause: "",
			  fields: [
				
			  ]
			}
		}
		this.sendPost(this, "delete_table_a_c", servlet_url, request, http_headers, http_parameters);
	}

	table_a_c_list: TableAC[] = [];
	selected_table_a_c_option: TableAC;
	selected_table_a_c_record: TableAC;

	insert_table_a_c_record_list: TableAC[] = [];
	update_table_a_c_record_list: TableAC[] = [];
	delete_table_a_c_record_list: TableAC[] = [];

	//selected_table_a_c_list_icon: any = blank_icon;
	
	} else if (key === "insert_table_a_c") {
		//let resultset: any[] = response.resultset;
		//let resultset: any = response.resultset;
		//let generated_id: any = response.generated_id;
		this.resetForm();
		for (let i: number = 0; i < this.insert_table_a_c_record_list.length; i++) {
			this.table_a_c_list.push(this.insert_table_a_c_record_list[i]);
		}
		this.insert_table_a_c_record_list = [];
		this.table_a_c_table_data_source.data = this.table_a_c_list;
		//this.snackbar.open(this.i18.insert_success, "x", {duration: 5 * 1000});
	} else if (key === "select_table_a_c") {
		let resultset: any[] = response.resultset;
		this.table_a_c_list = [];
		for (let i: number = 0; resultset != null && i < resultset.length; i++) {
			this.table_a_c_list.push(TableAC.fromJSON(resultset[i]));
			//Manipulate.loadImage(this.table_a_c_list[i].table_a_c_icon);
		}

		this.table_a_c_table_data_source.data = this.table_a_c_list;
		//this.snackbar.open(this.i18.select_success, "x", {duration: 5 * 1000});
	} else if (key === "update_table_a_c") {
		//this.snackbar.open(this.i18.update_success, "x", {duration: 5 * 1000});
	} else if (key === "delete_table_a_c") {
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
				fields: [
					
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
			  fields: [
				
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




----------- compound_key Form Controls ---------------------

	compound_key_form: FormGroup;
	auto_id_control: FormControl;
	string_key_control: FormControl;
	some_data_control: FormControl;






	constructor() {

	this.auto_id_control = new FormControl([]);
	this.string_key_control = new FormControl([]);
	this.some_data_control = new FormControl([]);







	this.compound_key_form = form_builder.group({
		compound_key_group: form_builder.group({
			auto_id: this.auto_id_control,
			string_key: this.string_key_control,
			some_data: this.some_data_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedCompoundKeyRecord(selected_compound_key_record: CompoundKey) {
		this.selected_compound_key_record = selected_compound_key_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}



----------- fact_master Form Controls ---------------------

	fact_master_form: FormGroup;
	fact_master_id_control: FormControl;
	fact_master_data_control: FormControl;






	constructor() {

	this.fact_master_id_control = new FormControl([]);
	this.fact_master_data_control = new FormControl([]);







	this.fact_master_form = form_builder.group({
		fact_master_group: form_builder.group({
			fact_master_id: this.fact_master_id_control,
			fact_master_data: this.fact_master_data_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedFactMasterRecord(selected_fact_master_record: FactMaster) {
		this.selected_fact_master_record = selected_fact_master_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}



----------- fact_transaction Form Controls ---------------------

	fact_transaction_form: FormGroup;
	fact_transaction_id_control: FormControl;
	fact_master_a_id_control: FormControl;
	fact_master_b_id_control: FormControl;
	fact_transaction_data_control: FormControl;


	fact_master_a_list_control: FormControl;
	fact_master_b_list_control: FormControl;


	fact_master_a_array_control: FormArray;
	fact_master_b_array_control: FormArray;


	constructor() {

	this.fact_transaction_id_control = new FormControl([]);
	this.fact_master_a_id_control = new FormControl([]);
	this.fact_master_b_id_control = new FormControl([]);
	this.fact_transaction_data_control = new FormControl([]);

	this.fact_master_a_list_control = new FormControl([]);
	this.fact_master_b_list_control = new FormControl([]);

	this.fact_master_a_list_control = new FormControl([]);
	this.fact_master_b_list_control = new FormControl([]);


	this.fact_master_a_array_control = new FormArray([]);
	this.fact_master_b_array_control = new FormArray([]);



	this.fact_transaction_form = form_builder.group({
		fact_transaction_group: form_builder.group({
			fact_transaction_id: this.fact_transaction_id_control,
			fact_master_a_id: this.fact_master_a_id_control,
			fact_master_b_id: this.fact_master_b_id_control,
			fact_transaction_data: this.fact_transaction_data_control,

	fact_master_a_check_list: this.fact_master_a_array_control,
	fact_master_b_check_list: this.fact_master_b_array_control,

		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedFactTransactionRecord(selected_fact_transaction_record: FactTransaction) {
		this.selected_fact_transaction_record = selected_fact_transaction_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	
		this.fact_master_list.forEach( (fact_master: FactMaster) => {
			fact_master.is_checked = false;
			let fact_master_control: FormControl = new FormControl(fact_master);
			fact_master_control.['option_value'] = fact_master;
			fact_master_control.setValue(fact_master_control['option_value']);
			this.fact_master_array_control.push(fact_master_control);
		});
		this.fact_master_list.forEach( (fact_master: FactMaster) => {
			fact_master.is_checked = false;
			let fact_master_control: FormControl = new FormControl(fact_master);
			fact_master_control.['option_value'] = fact_master;
			fact_master_control.setValue(fact_master_control['option_value']);
			this.fact_master_array_control.push(fact_master_control);
		});

	
	}



----------- table_a Form Controls ---------------------

	table_a_form: FormGroup;
	id_control: FormControl;
	name_ar_control: FormControl;
	name_en_control: FormControl;
	date_control: FormControl;
	time_control: FormControl;
	timestamp_control: FormControl;
	boolean_control: FormControl;






	constructor() {

	this.id_control = new FormControl([]);
	this.name_ar_control = new FormControl([]);
	this.name_en_control = new FormControl([]);
	this.date_control = new FormControl([]);
	this.time_control = new FormControl([]);
	this.timestamp_control = new FormControl([]);
	this.boolean_control = new FormControl([]);







	this.table_a_form = form_builder.group({
		table_a_group: form_builder.group({
			id: this.id_control,
			name_ar: this.name_ar_control,
			name_en: this.name_en_control,
			date: this.date_control,
			time: this.time_control,
			timestamp: this.timestamp_control,
			boolean: this.boolean_control,


		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTableARecord(selected_table_a_record: TableA) {
		this.selected_table_a_record = selected_table_a_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	

	
	}



----------- table_a_a Form Controls ---------------------

	table_a_a_form: FormGroup;
	id_control: FormControl;
	a_id_control: FormControl;
	name_ar_control: FormControl;
	name_en_control: FormControl;
	date_control: FormControl;
	time_control: FormControl;
	timestamp_control: FormControl;
	boolean_control: FormControl;


	a_list_control: FormControl;


	a_array_control: FormArray;


	constructor() {

	this.id_control = new FormControl([]);
	this.a_id_control = new FormControl([]);
	this.name_ar_control = new FormControl([]);
	this.name_en_control = new FormControl([]);
	this.date_control = new FormControl([]);
	this.time_control = new FormControl([]);
	this.timestamp_control = new FormControl([]);
	this.boolean_control = new FormControl([]);

	this.a_list_control = new FormControl([]);

	this.a_list_control = new FormControl([]);


	this.a_array_control = new FormArray([]);



	this.table_a_a_form = form_builder.group({
		table_a_a_group: form_builder.group({
			id: this.id_control,
			a_id: this.a_id_control,
			name_ar: this.name_ar_control,
			name_en: this.name_en_control,
			date: this.date_control,
			time: this.time_control,
			timestamp: this.timestamp_control,
			boolean: this.boolean_control,

	a_check_list: this.a_array_control,

		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTableAARecord(selected_table_a_a_record: TableAA) {
		this.selected_table_a_a_record = selected_table_a_a_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	
		this.table_a_list.forEach( (table_a: TableA) => {
			table_a.is_checked = false;
			let table_a_control: FormControl = new FormControl(table_a);
			table_a_control.['option_value'] = table_a;
			table_a_control.setValue(table_a_control['option_value']);
			this.table_a_array_control.push(table_a_control);
		});

	
	}



----------- table_a_b Form Controls ---------------------

	table_a_b_form: FormGroup;
	id_control: FormControl;
	a_id_control: FormControl;
	name_ar_control: FormControl;
	name_en_control: FormControl;
	date_control: FormControl;
	time_control: FormControl;
	timestamp_control: FormControl;
	boolean_control: FormControl;


	a_list_control: FormControl;


	a_array_control: FormArray;


	constructor() {

	this.id_control = new FormControl([]);
	this.a_id_control = new FormControl([]);
	this.name_ar_control = new FormControl([]);
	this.name_en_control = new FormControl([]);
	this.date_control = new FormControl([]);
	this.time_control = new FormControl([]);
	this.timestamp_control = new FormControl([]);
	this.boolean_control = new FormControl([]);

	this.a_list_control = new FormControl([]);

	this.a_list_control = new FormControl([]);


	this.a_array_control = new FormArray([]);



	this.table_a_b_form = form_builder.group({
		table_a_b_group: form_builder.group({
			id: this.id_control,
			a_id: this.a_id_control,
			name_ar: this.name_ar_control,
			name_en: this.name_en_control,
			date: this.date_control,
			time: this.time_control,
			timestamp: this.timestamp_control,
			boolean: this.boolean_control,

	a_check_list: this.a_array_control,

		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTableABRecord(selected_table_a_b_record: TableAB) {
		this.selected_table_a_b_record = selected_table_a_b_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	
		this.table_a_list.forEach( (table_a: TableA) => {
			table_a.is_checked = false;
			let table_a_control: FormControl = new FormControl(table_a);
			table_a_control.['option_value'] = table_a;
			table_a_control.setValue(table_a_control['option_value']);
			this.table_a_array_control.push(table_a_control);
		});

	
	}



----------- table_a_b_a Form Controls ---------------------

	table_a_b_a_form: FormGroup;
	id_control: FormControl;
	a_b_id_control: FormControl;
	name_ar_control: FormControl;
	name_en_control: FormControl;
	date_control: FormControl;
	time_control: FormControl;
	timestamp_control: FormControl;
	boolean_control: FormControl;


	a_b_list_control: FormControl;


	a_b_array_control: FormArray;


	constructor() {

	this.id_control = new FormControl([]);
	this.a_b_id_control = new FormControl([]);
	this.name_ar_control = new FormControl([]);
	this.name_en_control = new FormControl([]);
	this.date_control = new FormControl([]);
	this.time_control = new FormControl([]);
	this.timestamp_control = new FormControl([]);
	this.boolean_control = new FormControl([]);

	this.a_b_list_control = new FormControl([]);

	this.a_b_list_control = new FormControl([]);


	this.a_b_array_control = new FormArray([]);



	this.table_a_b_a_form = form_builder.group({
		table_a_b_a_group: form_builder.group({
			id: this.id_control,
			a_b_id: this.a_b_id_control,
			name_ar: this.name_ar_control,
			name_en: this.name_en_control,
			date: this.date_control,
			time: this.time_control,
			timestamp: this.timestamp_control,
			boolean: this.boolean_control,

	a_b_check_list: this.a_b_array_control,

		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTableABARecord(selected_table_a_b_a_record: TableABA) {
		this.selected_table_a_b_a_record = selected_table_a_b_a_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	
		this.table_a_b_list.forEach( (table_a_b: TableAB) => {
			table_a_b.is_checked = false;
			let table_a_b_control: FormControl = new FormControl(table_a_b);
			table_a_b_control.['option_value'] = table_a_b;
			table_a_b_control.setValue(table_a_b_control['option_value']);
			this.table_a_b_array_control.push(table_a_b_control);
		});

	
	}



----------- table_a_c Form Controls ---------------------

	table_a_c_form: FormGroup;
	id_control: FormControl;
	a_id_control: FormControl;
	name_ar_control: FormControl;
	name_en_control: FormControl;
	date_control: FormControl;
	time_control: FormControl;
	timestamp_control: FormControl;
	boolean_control: FormControl;


	a_list_control: FormControl;


	a_array_control: FormArray;


	constructor() {

	this.id_control = new FormControl([]);
	this.a_id_control = new FormControl([]);
	this.name_ar_control = new FormControl([]);
	this.name_en_control = new FormControl([]);
	this.date_control = new FormControl([]);
	this.time_control = new FormControl([]);
	this.timestamp_control = new FormControl([]);
	this.boolean_control = new FormControl([]);

	this.a_list_control = new FormControl([]);

	this.a_list_control = new FormControl([]);


	this.a_array_control = new FormArray([]);



	this.table_a_c_form = form_builder.group({
		table_a_c_group: form_builder.group({
			id: this.id_control,
			a_id: this.a_id_control,
			name_ar: this.name_ar_control,
			name_en: this.name_en_control,
			date: this.date_control,
			time: this.time_control,
			timestamp: this.timestamp_control,
			boolean: this.boolean_control,

	a_check_list: this.a_array_control,

		}),
	},
	//{ validators: passwordMatchValidator, asyncValidators: otherValidator }
	);
	}

	setSelectedTableACRecord(selected_table_a_c_record: TableAC) {
		this.selected_table_a_c_record = selected_table_a_c_record;
	}
	
	ngOnChanges(changes: SimpleChanges): void {
	
		this.table_a_list.forEach( (table_a: TableA) => {
			table_a.is_checked = false;
			let table_a_control: FormControl = new FormControl(table_a);
			table_a_control.['option_value'] = table_a;
			table_a_control.setValue(table_a_control['option_value']);
			this.table_a_array_control.push(table_a_control);
		});

	
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
    <p class="card">{{i18.compound_key.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="compound_key_form" [dir]="direction">
	<div role="group" formGroupName="compound_key_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box auto_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="auto_id" matInput type="number"
					placeholder="{{i18.compound_key.auto_id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('compound_key_group.auto_id') === false }" />
				<div *ngIf="isModified('compound_key_group.auto_id') && isValid('compound_key_group.auto_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('compound_key_group.auto_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box string_key -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="string_key" matInput type="string"
					placeholder="{{i18.compound_key.string_key}}"
					required="true"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('compound_key_group.string_key') === false }" />
				<div *ngIf="isModified('compound_key_group.string_key') && isValid('compound_key_group.string_key') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('compound_key_group.string_key')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box some_data -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="some_data" matInput type="string"
					placeholder="{{i18.compound_key.some_data}}"
					required="true"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('compound_key_group.some_data') === false }" />
				<div *ngIf="isModified('compound_key_group.some_data') && isValid('compound_key_group.some_data') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('compound_key_group.some_data')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.CompoundKey.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.CompoundKey.title}}-->
	<img *ngIf="selected_compound_key_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_compound_key_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_compound_key_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_compound_key_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_compound_key_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
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
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.compound_key_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.compound_key_list.length-1" (click)="lastRecord()">
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



------------------ compound_key Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.fact_master.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="fact_master_form" [dir]="direction">
	<div role="group" formGroupName="fact_master_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box fact_master_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="fact_master_id" matInput type="number"
					placeholder="{{i18.fact_master.fact_master_id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('fact_master_group.fact_master_id') === false }" />
				<div *ngIf="isModified('fact_master_group.fact_master_id') && isValid('fact_master_group.fact_master_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('fact_master_group.fact_master_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box fact_master_data -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="fact_master_data" matInput type="string"
					placeholder="{{i18.fact_master.fact_master_data}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('fact_master_group.fact_master_data') === false }" />
				<div *ngIf="isModified('fact_master_group.fact_master_data') && isValid('fact_master_group.fact_master_data') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('fact_master_group.fact_master_data')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		

			

			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.FactMaster.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.FactMaster.title}}-->
	<img *ngIf="selected_fact_master_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_fact_master_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_fact_master_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_fact_master_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_fact_master_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
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
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.fact_master_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.fact_master_list.length-1" (click)="lastRecord()">
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



------------------ fact_master Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.fact_transaction.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="fact_transaction_form" [dir]="direction">
	<div role="group" formGroupName="fact_transaction_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box fact_transaction_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="fact_transaction_id" matInput type="number"
					placeholder="{{i18.fact_transaction.fact_transaction_id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('fact_transaction_group.fact_transaction_id') === false }" />
				<div *ngIf="isModified('fact_transaction_group.fact_transaction_id') && isValid('fact_transaction_group.fact_transaction_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('fact_transaction_group.fact_transaction_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box fact_master_a_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="fact_master_a_id" matInput type="number"
					placeholder="{{i18.fact_transaction.fact_master_a_id}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('fact_transaction_group.fact_master_a_id') === false }" />
				<div *ngIf="isModified('fact_transaction_group.fact_master_a_id') && isValid('fact_transaction_group.fact_master_a_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('fact_transaction_group.fact_master_a_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box fact_master_b_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="fact_master_b_id" matInput type="number"
					placeholder="{{i18.fact_transaction.fact_master_b_id}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('fact_transaction_group.fact_master_b_id') === false }" />
				<div *ngIf="isModified('fact_transaction_group.fact_master_b_id') && isValid('fact_transaction_group.fact_master_b_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('fact_transaction_group.fact_master_b_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box fact_transaction_data -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="fact_transaction_data" matInput type="number"
					placeholder="{{i18.fact_transaction.fact_transaction_data}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('fact_transaction_group.fact_transaction_data') === false }" />
				<div *ngIf="isModified('fact_transaction_group.fact_transaction_data') && isValid('fact_transaction_group.fact_transaction_data') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('fact_transaction_group.fact_transaction_data')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			

		
			<!-- fact_master_a_list -->
			<ng-container formArrayName="fact_master_a_list">
			  <div>
				<span>
				  <mat-checkbox [checked]="isAllListChecked(fact_master_a_check_list)" [color]="primary"
					[indeterminate]="isIndeterminate(fact_master_a_list)"
					(change)="selectAllList($event, fact_master_a_list)">
					<img src="{{fact_master_a_icon}}" class="icon" />
					{{ i18.fact_master_a }}
				  </mat-checkbox>
				</span>
			  </div>
			  <div *ngFor="let fact_master_a_control of fact_master_a_array_control.controls; let i=index">
				<span>
				  <mat-checkbox class="margin" [formControl]="fact_master_a_control"
					[color]="primary" [(ngModel)]="fact_master_a_list[i].is_checked">
					<img class="icon" src="{{fact_master_a_list[i].advertising_method_icon}}" (error)="onImageError($event)">
					{{fact_master_a_list[i].advertising_method_name_i18[lang]}}
				  </mat-checkbox>
				</span>
			  </div>
			</ng-container>

			<!-- fact_master_b_list -->
			<ng-container formArrayName="fact_master_b_list">
			  <div>
				<span>
				  <mat-checkbox [checked]="isAllListChecked(fact_master_b_check_list)" [color]="primary"
					[indeterminate]="isIndeterminate(fact_master_b_list)"
					(change)="selectAllList($event, fact_master_b_list)">
					<img src="{{fact_master_b_icon}}" class="icon" />
					{{ i18.fact_master_b }}
				  </mat-checkbox>
				</span>
			  </div>
			  <div *ngFor="let fact_master_b_control of fact_master_b_array_control.controls; let i=index">
				<span>
				  <mat-checkbox class="margin" [formControl]="fact_master_b_control"
					[color]="primary" [(ngModel)]="fact_master_b_list[i].is_checked">
					<img class="icon" src="{{fact_master_b_list[i].advertising_method_icon}}" (error)="onImageError($event)">
					{{fact_master_b_list[i].advertising_method_name_i18[lang]}}
				  </mat-checkbox>
				</span>
			  </div>
			</ng-container>


			
			<!-- fact_master_a List Box -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<mat-label>{{ i18.fact_master_a }}</mat-label>
					<span matPrefix [style.display]="'flex'">
					<img src="{{selected_fact_master_list_icon}}" class="icon" />
				</span>
				<mat-select formControlName="fact_master_a_list_option" (selectionChange)="onChange$FOREIGN_TABLE_CLASS($event)">
					<mat-option *ngFor="let option of fact_master_list" [value]="option">
					<span><img class="icon" src="{{option.fact_master_icon}}"
					(error)="onImageError($event)">{{option.fact_master_name_i18[lang]}}</span>
					</mat-option>
				</mat-select>
			</mat-form-field>

			<!-- fact_master_b List Box -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<mat-label>{{ i18.fact_master_b }}</mat-label>
					<span matPrefix [style.display]="'flex'">
					<img src="{{selected_fact_master_list_icon}}" class="icon" />
				</span>
				<mat-select formControlName="fact_master_b_list_option" (selectionChange)="onChange$FOREIGN_TABLE_CLASS($event)">
					<mat-option *ngFor="let option of fact_master_list" [value]="option">
					<span><img class="icon" src="{{option.fact_master_icon}}"
					(error)="onImageError($event)">{{option.fact_master_name_i18[lang]}}</span>
					</mat-option>
				</mat-select>
			</mat-form-field>


			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.FactTransaction.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.FactTransaction.title}}-->
	<img *ngIf="selected_fact_transaction_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_fact_transaction_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_fact_transaction_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_fact_transaction_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_fact_transaction_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
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
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.fact_transaction_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.fact_transaction_list.length-1" (click)="lastRecord()">
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



------------------ fact_transaction Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.table_a.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="table_a_form" [dir]="direction">
	<div role="group" formGroupName="table_a_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="id" matInput type="number"
					placeholder="{{i18.table_a.id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_group.id') === false }" />
				<div *ngIf="isModified('table_a_group.id') && isValid('table_a_group.id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_group.id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_ar -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="name_ar" matInput type="string"
					placeholder="{{i18.table_a.name_ar}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_group.name_ar') === false }" />
				<div *ngIf="isModified('table_a_group.name_ar') && isValid('table_a_group.name_ar') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_group.name_ar')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_en -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="name_en" matInput type="string"
					placeholder="{{i18.table_a.name_en}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_group.name_en') === false }" />
				<div *ngIf="isModified('table_a_group.name_en') && isValid('table_a_group.name_en') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_group.name_en')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box time -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="time" matInput type="Date"
					placeholder="{{i18.table_a.time}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_group.time') === false }" />
				<div *ngIf="isModified('table_a_group.time') && isValid('table_a_group.time') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_group.time')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box timestamp -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="timestamp" matInput type="Date"
					placeholder="{{i18.table_a.timestamp}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_group.timestamp') === false }" />
				<div *ngIf="isModified('table_a_group.timestamp') && isValid('table_a_group.timestamp') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_group.timestamp')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box boolean -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="boolean" matInput type="checkbox"
					placeholder="{{i18.table_a.boolean}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_group.boolean') === false }" />
				<div *ngIf="isModified('table_a_group.boolean') && isValid('table_a_group.boolean') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_group.boolean')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			
			<!-- Date Box date -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<mat-label>{{i18.table_a.date}}</mat-label>
				<input formControlName="date" matInput [matDatepicker]="datepicker" placeholder="{{ i18.table_a.date }}">
				<mat-datepicker-toggle matPrefix [for]="datepicker"></mat-datepicker-toggle>
				<mat-datepicker #datepicker></mat-datepicker>
			</mat-form-field>


		

			

			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.TableA.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.TableA.title}}-->
	<img *ngIf="selected_table_a_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
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
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.table_a_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.table_a_list.length-1" (click)="lastRecord()">
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



------------------ table_a Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.table_a_a.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="table_a_a_form" [dir]="direction">
	<div role="group" formGroupName="table_a_a_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="id" matInput type="number"
					placeholder="{{i18.table_a_a.id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_a_group.id') === false }" />
				<div *ngIf="isModified('table_a_a_group.id') && isValid('table_a_a_group.id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_a_group.id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box a_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="a_id" matInput type="number"
					placeholder="{{i18.table_a_a.a_id}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_a_group.a_id') === false }" />
				<div *ngIf="isModified('table_a_a_group.a_id') && isValid('table_a_a_group.a_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_a_group.a_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_ar -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="name_ar" matInput type="string"
					placeholder="{{i18.table_a_a.name_ar}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_a_group.name_ar') === false }" />
				<div *ngIf="isModified('table_a_a_group.name_ar') && isValid('table_a_a_group.name_ar') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_a_group.name_ar')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_en -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="name_en" matInput type="string"
					placeholder="{{i18.table_a_a.name_en}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_a_group.name_en') === false }" />
				<div *ngIf="isModified('table_a_a_group.name_en') && isValid('table_a_a_group.name_en') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_a_group.name_en')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box time -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="time" matInput type="Date"
					placeholder="{{i18.table_a_a.time}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_a_group.time') === false }" />
				<div *ngIf="isModified('table_a_a_group.time') && isValid('table_a_a_group.time') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_a_group.time')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box timestamp -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="timestamp" matInput type="Date"
					placeholder="{{i18.table_a_a.timestamp}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_a_group.timestamp') === false }" />
				<div *ngIf="isModified('table_a_a_group.timestamp') && isValid('table_a_a_group.timestamp') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_a_group.timestamp')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box boolean -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="boolean" matInput type="checkbox"
					placeholder="{{i18.table_a_a.boolean}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_a_group.boolean') === false }" />
				<div *ngIf="isModified('table_a_a_group.boolean') && isValid('table_a_a_group.boolean') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_a_group.boolean')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			
			<!-- Date Box date -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<mat-label>{{i18.table_a_a.date}}</mat-label>
				<input formControlName="date" matInput [matDatepicker]="datepicker" placeholder="{{ i18.table_a_a.date }}">
				<mat-datepicker-toggle matPrefix [for]="datepicker"></mat-datepicker-toggle>
				<mat-datepicker #datepicker></mat-datepicker>
			</mat-form-field>


		
			<!-- a_list -->
			<ng-container formArrayName="a_list">
			  <div>
				<span>
				  <mat-checkbox [checked]="isAllListChecked(a_check_list)" [color]="primary"
					[indeterminate]="isIndeterminate(a_list)"
					(change)="selectAllList($event, a_list)">
					<img src="{{a_icon}}" class="icon" />
					{{ i18.a }}
				  </mat-checkbox>
				</span>
			  </div>
			  <div *ngFor="let a_control of a_array_control.controls; let i=index">
				<span>
				  <mat-checkbox class="margin" [formControl]="a_control"
					[color]="primary" [(ngModel)]="a_list[i].is_checked">
					<img class="icon" src="{{a_list[i].advertising_method_icon}}" (error)="onImageError($event)">
					{{a_list[i].advertising_method_name_i18[lang]}}
				  </mat-checkbox>
				</span>
			  </div>
			</ng-container>


			
			<!-- a List Box -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<mat-label>{{ i18.a }}</mat-label>
					<span matPrefix [style.display]="'flex'">
					<img src="{{selected_table_a_list_icon}}" class="icon" />
				</span>
				<mat-select formControlName="a_list_option" (selectionChange)="onChange$FOREIGN_TABLE_CLASS($event)">
					<mat-option *ngFor="let option of table_a_list" [value]="option">
					<span><img class="icon" src="{{option.table_a_icon}}"
					(error)="onImageError($event)">{{option.table_a_name_i18[lang]}}</span>
					</mat-option>
				</mat-select>
			</mat-form-field>


			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.TableAA.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.TableAA.title}}-->
	<img *ngIf="selected_table_a_a_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_a_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_a_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_a_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_a_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
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
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.table_a_a_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.table_a_a_list.length-1" (click)="lastRecord()">
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



------------------ table_a_a Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.table_a_b.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="table_a_b_form" [dir]="direction">
	<div role="group" formGroupName="table_a_b_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="id" matInput type="number"
					placeholder="{{i18.table_a_b.id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_b_group.id') === false }" />
				<div *ngIf="isModified('table_a_b_group.id') && isValid('table_a_b_group.id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_b_group.id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box a_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="a_id" matInput type="number"
					placeholder="{{i18.table_a_b.a_id}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_b_group.a_id') === false }" />
				<div *ngIf="isModified('table_a_b_group.a_id') && isValid('table_a_b_group.a_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_b_group.a_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_ar -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="name_ar" matInput type="string"
					placeholder="{{i18.table_a_b.name_ar}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_b_group.name_ar') === false }" />
				<div *ngIf="isModified('table_a_b_group.name_ar') && isValid('table_a_b_group.name_ar') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_b_group.name_ar')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_en -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="name_en" matInput type="string"
					placeholder="{{i18.table_a_b.name_en}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_b_group.name_en') === false }" />
				<div *ngIf="isModified('table_a_b_group.name_en') && isValid('table_a_b_group.name_en') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_b_group.name_en')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box time -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="time" matInput type="Date"
					placeholder="{{i18.table_a_b.time}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_b_group.time') === false }" />
				<div *ngIf="isModified('table_a_b_group.time') && isValid('table_a_b_group.time') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_b_group.time')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box timestamp -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="timestamp" matInput type="Date"
					placeholder="{{i18.table_a_b.timestamp}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_b_group.timestamp') === false }" />
				<div *ngIf="isModified('table_a_b_group.timestamp') && isValid('table_a_b_group.timestamp') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_b_group.timestamp')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box boolean -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="boolean" matInput type="checkbox"
					placeholder="{{i18.table_a_b.boolean}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_b_group.boolean') === false }" />
				<div *ngIf="isModified('table_a_b_group.boolean') && isValid('table_a_b_group.boolean') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_b_group.boolean')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			
			<!-- Date Box date -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<mat-label>{{i18.table_a_b.date}}</mat-label>
				<input formControlName="date" matInput [matDatepicker]="datepicker" placeholder="{{ i18.table_a_b.date }}">
				<mat-datepicker-toggle matPrefix [for]="datepicker"></mat-datepicker-toggle>
				<mat-datepicker #datepicker></mat-datepicker>
			</mat-form-field>


		
			<!-- a_list -->
			<ng-container formArrayName="a_list">
			  <div>
				<span>
				  <mat-checkbox [checked]="isAllListChecked(a_check_list)" [color]="primary"
					[indeterminate]="isIndeterminate(a_list)"
					(change)="selectAllList($event, a_list)">
					<img src="{{a_icon}}" class="icon" />
					{{ i18.a }}
				  </mat-checkbox>
				</span>
			  </div>
			  <div *ngFor="let a_control of a_array_control.controls; let i=index">
				<span>
				  <mat-checkbox class="margin" [formControl]="a_control"
					[color]="primary" [(ngModel)]="a_list[i].is_checked">
					<img class="icon" src="{{a_list[i].advertising_method_icon}}" (error)="onImageError($event)">
					{{a_list[i].advertising_method_name_i18[lang]}}
				  </mat-checkbox>
				</span>
			  </div>
			</ng-container>


			
			<!-- a List Box -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<mat-label>{{ i18.a }}</mat-label>
					<span matPrefix [style.display]="'flex'">
					<img src="{{selected_table_a_list_icon}}" class="icon" />
				</span>
				<mat-select formControlName="a_list_option" (selectionChange)="onChange$FOREIGN_TABLE_CLASS($event)">
					<mat-option *ngFor="let option of table_a_list" [value]="option">
					<span><img class="icon" src="{{option.table_a_icon}}"
					(error)="onImageError($event)">{{option.table_a_name_i18[lang]}}</span>
					</mat-option>
				</mat-select>
			</mat-form-field>


			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.TableAB.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.TableAB.title}}-->
	<img *ngIf="selected_table_a_b_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_b_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_b_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_b_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_b_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
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
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.table_a_b_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.table_a_b_list.length-1" (click)="lastRecord()">
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



------------------ table_a_b Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.table_a_b_a.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="table_a_b_a_form" [dir]="direction">
	<div role="group" formGroupName="table_a_b_a_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="id" matInput type="number"
					placeholder="{{i18.table_a_b_a.id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_b_a_group.id') === false }" />
				<div *ngIf="isModified('table_a_b_a_group.id') && isValid('table_a_b_a_group.id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_b_a_group.id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box a_b_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="a_b_id" matInput type="number"
					placeholder="{{i18.table_a_b_a.a_b_id}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_b_a_group.a_b_id') === false }" />
				<div *ngIf="isModified('table_a_b_a_group.a_b_id') && isValid('table_a_b_a_group.a_b_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_b_a_group.a_b_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_ar -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="name_ar" matInput type="string"
					placeholder="{{i18.table_a_b_a.name_ar}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_b_a_group.name_ar') === false }" />
				<div *ngIf="isModified('table_a_b_a_group.name_ar') && isValid('table_a_b_a_group.name_ar') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_b_a_group.name_ar')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_en -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="name_en" matInput type="string"
					placeholder="{{i18.table_a_b_a.name_en}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_b_a_group.name_en') === false }" />
				<div *ngIf="isModified('table_a_b_a_group.name_en') && isValid('table_a_b_a_group.name_en') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_b_a_group.name_en')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box time -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="time" matInput type="Date"
					placeholder="{{i18.table_a_b_a.time}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_b_a_group.time') === false }" />
				<div *ngIf="isModified('table_a_b_a_group.time') && isValid('table_a_b_a_group.time') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_b_a_group.time')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box timestamp -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="timestamp" matInput type="Date"
					placeholder="{{i18.table_a_b_a.timestamp}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_b_a_group.timestamp') === false }" />
				<div *ngIf="isModified('table_a_b_a_group.timestamp') && isValid('table_a_b_a_group.timestamp') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_b_a_group.timestamp')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box boolean -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="boolean" matInput type="checkbox"
					placeholder="{{i18.table_a_b_a.boolean}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_b_a_group.boolean') === false }" />
				<div *ngIf="isModified('table_a_b_a_group.boolean') && isValid('table_a_b_a_group.boolean') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_b_a_group.boolean')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			
			<!-- Date Box date -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<mat-label>{{i18.table_a_b_a.date}}</mat-label>
				<input formControlName="date" matInput [matDatepicker]="datepicker" placeholder="{{ i18.table_a_b_a.date }}">
				<mat-datepicker-toggle matPrefix [for]="datepicker"></mat-datepicker-toggle>
				<mat-datepicker #datepicker></mat-datepicker>
			</mat-form-field>


		
			<!-- a_b_list -->
			<ng-container formArrayName="a_b_list">
			  <div>
				<span>
				  <mat-checkbox [checked]="isAllListChecked(a_b_check_list)" [color]="primary"
					[indeterminate]="isIndeterminate(a_b_list)"
					(change)="selectAllList($event, a_b_list)">
					<img src="{{a_b_icon}}" class="icon" />
					{{ i18.a_b }}
				  </mat-checkbox>
				</span>
			  </div>
			  <div *ngFor="let a_b_control of a_b_array_control.controls; let i=index">
				<span>
				  <mat-checkbox class="margin" [formControl]="a_b_control"
					[color]="primary" [(ngModel)]="a_b_list[i].is_checked">
					<img class="icon" src="{{a_b_list[i].advertising_method_icon}}" (error)="onImageError($event)">
					{{a_b_list[i].advertising_method_name_i18[lang]}}
				  </mat-checkbox>
				</span>
			  </div>
			</ng-container>


			
			<!-- a_b List Box -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<mat-label>{{ i18.a_b }}</mat-label>
					<span matPrefix [style.display]="'flex'">
					<img src="{{selected_table_a_b_list_icon}}" class="icon" />
				</span>
				<mat-select formControlName="a_b_list_option" (selectionChange)="onChange$FOREIGN_TABLE_CLASS($event)">
					<mat-option *ngFor="let option of table_a_b_list" [value]="option">
					<span><img class="icon" src="{{option.table_a_b_icon}}"
					(error)="onImageError($event)">{{option.table_a_b_name_i18[lang]}}</span>
					</mat-option>
				</mat-select>
			</mat-form-field>


			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.TableABA.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.TableABA.title}}-->
	<img *ngIf="selected_table_a_b_a_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_b_a_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_b_a_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_b_a_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_b_a_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
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
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.table_a_b_a_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.table_a_b_a_list.length-1" (click)="lastRecord()">
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



------------------ table_a_b_a Form HTML Controls ---------------



<div class="container">
    <p class="card">{{i18.table_a_c.title')}}</p>
<ng-container *ngIf="show_confirmation==false">
<form class="form yes-mouse" [formGroup]="table_a_c_form" [dir]="direction">
	<div role="group" formGroupName="table_a_c_group" [hidden]="false" [dir]="direction">
		<div class="form-group" [dir]="direction">
		
			<!-- Text Box id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="id" matInput type="number"
					placeholder="{{i18.table_a_c.id}}"
					required="false" [readonly]="true" [disabled]="true" 
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_c_group.id') === false }" />
				<div *ngIf="isModified('table_a_c_group.id') && isValid('table_a_c_group.id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_c_group.id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box a_id -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="a_id" matInput type="number"
					placeholder="{{i18.table_a_c.a_id}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_c_group.a_id') === false }" />
				<div *ngIf="isModified('table_a_c_group.a_id') && isValid('table_a_c_group.a_id') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_c_group.a_id')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_ar -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="name_ar" matInput type="string"
					placeholder="{{i18.table_a_c.name_ar}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_c_group.name_ar') === false }" />
				<div *ngIf="isModified('table_a_c_group.name_ar') && isValid('table_a_c_group.name_ar') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_c_group.name_ar')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box name_en -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="name_en" matInput type="string"
					placeholder="{{i18.table_a_c.name_en}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_c_group.name_en') === false }" />
				<div *ngIf="isModified('table_a_c_group.name_en') && isValid('table_a_c_group.name_en') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_c_group.name_en')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box time -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="time" matInput type="Date"
					placeholder="{{i18.table_a_c.time}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_c_group.time') === false }" />
				<div *ngIf="isModified('table_a_c_group.time') && isValid('table_a_c_group.time') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_c_group.time')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box timestamp -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="timestamp" matInput type="Date"
					placeholder="{{i18.table_a_c.timestamp}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_c_group.timestamp') === false }" />
				<div *ngIf="isModified('table_a_c_group.timestamp') && isValid('table_a_c_group.timestamp') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_c_group.timestamp')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>

			<!-- Text Box boolean -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<input formControlName="boolean" matInput type="checkbox"
					placeholder="{{i18.table_a_c.boolean}}"
					required="false"  
					[ngClass]="{ 'is-invalid': isValidFieldValue('table_a_c_group.boolean') === false }" />
				<div *ngIf="isModified('table_a_c_group.boolean') && isValid('table_a_c_group.boolean') === false" class="alert alert-danger">
					<ng-container *ngFor="let field_error of getFieldErrors('table_a_c_group.boolean')">
						<div class="warning">{{field_error.error_message[lang]}}></div>
					<ng-container>
				</div>
			</mat-form-field>


			
			<!-- Date Box date -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<mat-label>{{i18.table_a_c.date}}</mat-label>
				<input formControlName="date" matInput [matDatepicker]="datepicker" placeholder="{{ i18.table_a_c.date }}">
				<mat-datepicker-toggle matPrefix [for]="datepicker"></mat-datepicker-toggle>
				<mat-datepicker #datepicker></mat-datepicker>
			</mat-form-field>


		
			<!-- a_list -->
			<ng-container formArrayName="a_list">
			  <div>
				<span>
				  <mat-checkbox [checked]="isAllListChecked(a_check_list)" [color]="primary"
					[indeterminate]="isIndeterminate(a_list)"
					(change)="selectAllList($event, a_list)">
					<img src="{{a_icon}}" class="icon" />
					{{ i18.a }}
				  </mat-checkbox>
				</span>
			  </div>
			  <div *ngFor="let a_control of a_array_control.controls; let i=index">
				<span>
				  <mat-checkbox class="margin" [formControl]="a_control"
					[color]="primary" [(ngModel)]="a_list[i].is_checked">
					<img class="icon" src="{{a_list[i].advertising_method_icon}}" (error)="onImageError($event)">
					{{a_list[i].advertising_method_name_i18[lang]}}
				  </mat-checkbox>
				</span>
			  </div>
			</ng-container>


			
			<!-- a List Box -->
			<mat-form-field [appearance]="outline" [dir]="direction">
				<mat-label>{{ i18.a }}</mat-label>
					<span matPrefix [style.display]="'flex'">
					<img src="{{selected_table_a_list_icon}}" class="icon" />
				</span>
				<mat-select formControlName="a_list_option" (selectionChange)="onChange$FOREIGN_TABLE_CLASS($event)">
					<mat-option *ngFor="let option of table_a_list" [value]="option">
					<span><img class="icon" src="{{option.table_a_icon}}"
					(error)="onImageError($event)">{{option.table_a_name_i18[lang]}}</span>
					</mat-option>
				</mat-select>
			</mat-form-field>


			
        </div>
	</div>
</form>
<div class="tool-box" [dir]="direction">{{'Controls - ' + i18.TableAC.title}}</div>
<div class="form-group yes-mouse" [dir]="direction">
<div class="tool-box yes-mouse" [dir]="direction">
	<!--{{'Controls - ' + i18.TableAC.title}}-->
	<img *ngIf="selected_table_a_c_record.record_state == null" src="{{ICON.blank_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_c_record.record_state == INSERT" src="{{ICON.insert_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_c_record.record_state == SELECT" src="{{ICON.true_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_c_record.record_state == UPDATE" src="{{ICON.update_record_icon}}" (error)="ICON.blank_icon" class="icon" />
	<img *ngIf="selected_table_a_c_record.record_state == DELETE" src="{{ICON.delete_record_icon}}" (error)="ICON.blank_icon" class="icon" />
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
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.next_record}}" [disabled]="cursor == this.table_a_c_list.length-1" (click)="nextRecord()">
		<span class="tool-box-button-front" [dir]="direction">
			{{ i18.next }}
		</span>
	</button>
	<button class="tool-box-button-pushable yes-mouse" matTooltip="{{i18.last_record}}" [disabled]="cursor == this.table_a_c_list.length-1" (click)="lastRecord()">
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



------------------ table_a_c Form HTML Controls ---------------



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




----------- compound_key MAT Table Controls ---------------------

	compound_key_table_data_source: MatTableDataSource<CompoundKey>;
	compound_key_table_columns: string[] = [
		"auto_id",
		"string_key",
		"some_data"


		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.compound_key_list = [];
		this.compound_key_table_data_source = new MatTableDataSource(this.compound_key_list);
		this.compound_key_table_data_source.data = this.compound_key_list;
	}
	
	




----------- fact_master MAT Table Controls ---------------------

	fact_master_table_data_source: MatTableDataSource<FactMaster>;
	fact_master_table_columns: string[] = [
		"fact_master_id",
		"fact_master_data"


		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.fact_master_list = [];
		this.fact_master_table_data_source = new MatTableDataSource(this.fact_master_list);
		this.fact_master_table_data_source.data = this.fact_master_list;
	}
	
	




----------- fact_transaction MAT Table Controls ---------------------

	fact_transaction_table_data_source: MatTableDataSource<FactTransaction>;
	fact_transaction_table_columns: string[] = [
		"fact_transaction_id",
		"fact_master_a_id",
		"fact_master_b_id",
		"fact_transaction_data",
		"fact_master_a",
		"fact_master_b"

		"fact_master_a",
		"fact_master_b"

		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.fact_transaction_list = [];
		this.fact_transaction_table_data_source = new MatTableDataSource(this.fact_transaction_list);
		this.fact_transaction_table_data_source.data = this.fact_transaction_list;
	}
	
	




----------- table_a MAT Table Controls ---------------------

	table_a_table_data_source: MatTableDataSource<TableA>;
	table_a_table_columns: string[] = [
		"id",
		"name_ar",
		"name_en",
		"date",
		"time",
		"timestamp",
		"boolean",
		"name_i18"


		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.table_a_list = [];
		this.table_a_table_data_source = new MatTableDataSource(this.table_a_list);
		this.table_a_table_data_source.data = this.table_a_list;
	}
	
	




----------- table_a_a MAT Table Controls ---------------------

	table_a_a_table_data_source: MatTableDataSource<TableAA>;
	table_a_a_table_columns: string[] = [
		"id",
		"a_id",
		"name_ar",
		"name_en",
		"date",
		"time",
		"timestamp",
		"boolean",
		"name_i18",
		"a"

		"a"

		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.table_a_a_list = [];
		this.table_a_a_table_data_source = new MatTableDataSource(this.table_a_a_list);
		this.table_a_a_table_data_source.data = this.table_a_a_list;
	}
	
	




----------- table_a_b MAT Table Controls ---------------------

	table_a_b_table_data_source: MatTableDataSource<TableAB>;
	table_a_b_table_columns: string[] = [
		"id",
		"a_id",
		"name_ar",
		"name_en",
		"date",
		"time",
		"timestamp",
		"boolean",
		"name_i18",
		"a"

		"a"

		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.table_a_b_list = [];
		this.table_a_b_table_data_source = new MatTableDataSource(this.table_a_b_list);
		this.table_a_b_table_data_source.data = this.table_a_b_list;
	}
	
	




----------- table_a_b_a MAT Table Controls ---------------------

	table_a_b_a_table_data_source: MatTableDataSource<TableABA>;
	table_a_b_a_table_columns: string[] = [
		"id",
		"a_b_id",
		"name_ar",
		"name_en",
		"date",
		"time",
		"timestamp",
		"boolean",
		"name_i18",
		"a_b"

		"a_b"

		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.table_a_b_a_list = [];
		this.table_a_b_a_table_data_source = new MatTableDataSource(this.table_a_b_a_list);
		this.table_a_b_a_table_data_source.data = this.table_a_b_a_list;
	}
	
	




----------- table_a_c MAT Table Controls ---------------------

	table_a_c_table_data_source: MatTableDataSource<TableAC>;
	table_a_c_table_columns: string[] = [
		"id",
		"a_id",
		"name_ar",
		"name_en",
		"date",
		"time",
		"timestamp",
		"boolean",
		"name_i18",
		"a"

		"a"

		"select_record",
		"delete_record"	];
	
	
	constructor() {
		this.table_a_c_list = [];
		this.table_a_c_table_data_source = new MatTableDataSource(this.table_a_c_list);
		this.table_a_c_table_data_source.data = this.table_a_c_list;
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


<mat-table class="just-table mat-elevation-z8" [dataSource]="compound_key_table_data_source" [dir]="direction">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef="select_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef="let compound_key_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="selectRecord(compound_key_record)">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef="delete_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef="let compound_key_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="deleteRecord(compound_key_record)">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef="compound_key_table_columns">
	</mat-header-row>
	<mat-row *matRowDef="let compound_key_record; columns: compound_key_table_columns"></mat-row>
</mat-table>
------------------ compound_key MAT Table HTML Controls ---------------



<mat-table class="just-table mat-elevation-z8" [dataSource]="fact_master_table_data_source" [dir]="direction">


	



	
	<!-- extra controls -->
	<ng-container matColumnDef="select_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef="let fact_master_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="selectRecord(fact_master_record)">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef="delete_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef="let fact_master_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="deleteRecord(fact_master_record)">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef="fact_master_table_columns">
	</mat-header-row>
	<mat-row *matRowDef="let fact_master_record; columns: fact_master_table_columns"></mat-row>
</mat-table>
------------------ fact_master MAT Table HTML Controls ---------------



<mat-table class="just-table mat-elevation-z8" [dataSource]="fact_transaction_table_data_source" [dir]="direction">


	


	<!-- Table ~Field fact_master_a with _name_LANG -->
	<ng-container matColumnDef="fact_master_a">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.FactMaster.fact_master_a}}</mat-header-cell>
		<mat-cell *matCellDef="let fact_transaction_record;">
			<img src="{{fact_transaction_record.fact_master.fact_master_icon}}" class="icon" />
			{{fact_transaction_record.fact_master.fact_master_name_i18[lang]}}
		</mat-cell>
	</ng-container>

	<!-- Table ~Field fact_master_b with _name_LANG -->
	<ng-container matColumnDef="fact_master_b">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.FactMaster.fact_master_b}}</mat-header-cell>
		<mat-cell *matCellDef="let fact_transaction_record;">
			<img src="{{fact_transaction_record.fact_master.fact_master_icon}}" class="icon" />
			{{fact_transaction_record.fact_master.fact_master_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- extra controls -->
	<ng-container matColumnDef="select_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef="let fact_transaction_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="selectRecord(fact_transaction_record)">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef="delete_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef="let fact_transaction_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="deleteRecord(fact_transaction_record)">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef="fact_transaction_table_columns">
	</mat-header-row>
	<mat-row *matRowDef="let fact_transaction_record; columns: fact_transaction_table_columns"></mat-row>
</mat-table>
------------------ fact_transaction MAT Table HTML Controls ---------------



<mat-table class="just-table mat-elevation-z8" [dataSource]="table_a_table_data_source" [dir]="direction">


	
	<!-- Table -Field name_i18 -->
	<ng-container matColumnDef="table_a_name_i18">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.TableA.table_a_name_i18}}</mat-header-cell>
		<mat-cell *matCellDef="let table_a_record;">
			{{table_a_record.table_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>




	
	<!-- extra controls -->
	<ng-container matColumnDef="select_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef="let table_a_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="selectRecord(table_a_record)">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef="delete_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef="let table_a_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="deleteRecord(table_a_record)">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef="table_a_table_columns">
	</mat-header-row>
	<mat-row *matRowDef="let table_a_record; columns: table_a_table_columns"></mat-row>
</mat-table>
------------------ table_a MAT Table HTML Controls ---------------



<mat-table class="just-table mat-elevation-z8" [dataSource]="table_a_a_table_data_source" [dir]="direction">

	<!-- Table Field id with _name_LANG -->
	<ng-container matColumnDef="id">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.TableAA.id}}</mat-header-cell>
		<mat-cell *matCellDef="let table_a_a_record;">
			<img src="{{table_a_a_record.table_a_a_icon}}" class="icon" />
			{{table_a_a_record.table_a_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- Table -Field name_i18 -->
	<ng-container matColumnDef="table_a_a_name_i18">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.TableAA.table_a_a_name_i18}}</mat-header-cell>
		<mat-cell *matCellDef="let table_a_a_record;">
			{{table_a_a_record.table_a_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>



	<!-- Table ~Field a with _name_LANG -->
	<ng-container matColumnDef="a">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.TableA.a}}</mat-header-cell>
		<mat-cell *matCellDef="let table_a_a_record;">
			<img src="{{table_a_a_record.table_a.table_a_icon}}" class="icon" />
			{{table_a_a_record.table_a.table_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- extra controls -->
	<ng-container matColumnDef="select_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef="let table_a_a_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="selectRecord(table_a_a_record)">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef="delete_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef="let table_a_a_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="deleteRecord(table_a_a_record)">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef="table_a_a_table_columns">
	</mat-header-row>
	<mat-row *matRowDef="let table_a_a_record; columns: table_a_a_table_columns"></mat-row>
</mat-table>
------------------ table_a_a MAT Table HTML Controls ---------------



<mat-table class="just-table mat-elevation-z8" [dataSource]="table_a_b_table_data_source" [dir]="direction">

	<!-- Table Field id with _name_LANG -->
	<ng-container matColumnDef="id">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.TableAB.id}}</mat-header-cell>
		<mat-cell *matCellDef="let table_a_b_record;">
			<img src="{{table_a_b_record.table_a_b_icon}}" class="icon" />
			{{table_a_b_record.table_a_b_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- Table -Field name_i18 -->
	<ng-container matColumnDef="table_a_b_name_i18">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.TableAB.table_a_b_name_i18}}</mat-header-cell>
		<mat-cell *matCellDef="let table_a_b_record;">
			{{table_a_b_record.table_a_b_name_i18[lang]}}
		</mat-cell>
	</ng-container>



	<!-- Table ~Field a with _name_LANG -->
	<ng-container matColumnDef="a">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.TableA.a}}</mat-header-cell>
		<mat-cell *matCellDef="let table_a_b_record;">
			<img src="{{table_a_b_record.table_a.table_a_icon}}" class="icon" />
			{{table_a_b_record.table_a.table_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- extra controls -->
	<ng-container matColumnDef="select_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef="let table_a_b_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="selectRecord(table_a_b_record)">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef="delete_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef="let table_a_b_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="deleteRecord(table_a_b_record)">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef="table_a_b_table_columns">
	</mat-header-row>
	<mat-row *matRowDef="let table_a_b_record; columns: table_a_b_table_columns"></mat-row>
</mat-table>
------------------ table_a_b MAT Table HTML Controls ---------------



<mat-table class="just-table mat-elevation-z8" [dataSource]="table_a_b_a_table_data_source" [dir]="direction">

	<!-- Table Field id with _name_LANG -->
	<ng-container matColumnDef="id">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.TableABA.id}}</mat-header-cell>
		<mat-cell *matCellDef="let table_a_b_a_record;">
			<img src="{{table_a_b_a_record.table_a_b_a_icon}}" class="icon" />
			{{table_a_b_a_record.table_a_b_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- Table -Field name_i18 -->
	<ng-container matColumnDef="table_a_b_a_name_i18">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.TableABA.table_a_b_a_name_i18}}</mat-header-cell>
		<mat-cell *matCellDef="let table_a_b_a_record;">
			{{table_a_b_a_record.table_a_b_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>



	<!-- Table ~Field a_b with _name_LANG -->
	<ng-container matColumnDef="a_b">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.TableAB.a_b}}</mat-header-cell>
		<mat-cell *matCellDef="let table_a_b_a_record;">
			<img src="{{table_a_b_a_record.table_a_b.table_a_b_icon}}" class="icon" />
			{{table_a_b_a_record.table_a_b.table_a_b_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- extra controls -->
	<ng-container matColumnDef="select_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef="let table_a_b_a_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="selectRecord(table_a_b_a_record)">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef="delete_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef="let table_a_b_a_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="deleteRecord(table_a_b_a_record)">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef="table_a_b_a_table_columns">
	</mat-header-row>
	<mat-row *matRowDef="let table_a_b_a_record; columns: table_a_b_a_table_columns"></mat-row>
</mat-table>
------------------ table_a_b_a MAT Table HTML Controls ---------------



<mat-table class="just-table mat-elevation-z8" [dataSource]="table_a_c_table_data_source" [dir]="direction">

	<!-- Table Field id with _name_LANG -->
	<ng-container matColumnDef="id">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.TableAC.id}}</mat-header-cell>
		<mat-cell *matCellDef="let table_a_c_record;">
			<img src="{{table_a_c_record.table_a_c_icon}}" class="icon" />
			{{table_a_c_record.table_a_c_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- Table -Field name_i18 -->
	<ng-container matColumnDef="table_a_c_name_i18">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.TableAC.table_a_c_name_i18}}</mat-header-cell>
		<mat-cell *matCellDef="let table_a_c_record;">
			{{table_a_c_record.table_a_c_name_i18[lang]}}
		</mat-cell>
	</ng-container>



	<!-- Table ~Field a with _name_LANG -->
	<ng-container matColumnDef="a">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.TableA.a}}</mat-header-cell>
		<mat-cell *matCellDef="let table_a_c_record;">
			<img src="{{table_a_c_record.table_a.table_a_icon}}" class="icon" />
			{{table_a_c_record.table_a.table_a_name_i18[lang]}}
		</mat-cell>
	</ng-container>


	
	<!-- extra controls -->
	<ng-container matColumnDef="select_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.select_record}}</mat-header-cell>
			<mat-cell *matCellDef="let table_a_c_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="selectRecord(table_a_c_record)">
					<mat-icon>content_copy</mat-icon>
				</button>
		</mat-cell>
	</ng-container>
	<ng-container matColumnDef="delete_record">
		<mat-header-cell *matHeaderCellDef class="table-nice-back-blue">{{i18.delete_record}}</mat-header-cell>
			<mat-cell *matCellDef="let table_a_c_record;">
				<button mat-raised-button color="nice-green" class="yes-mouse" (click)="deleteRecord(table_a_c_record)">
					<mat-icon>delete</mat-icon>
				</button>
		</mat-cell>
	</ng-container>

	<mat-header-row *matHeaderRowDef="table_a_c_table_columns">
	</mat-header-row>
	<mat-row *matRowDef="let table_a_c_record; columns: table_a_c_table_columns"></mat-row>
</mat-table>
------------------ table_a_c MAT Table HTML Controls ---------------



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




 ***** Http Request ******


  ------------------------- 