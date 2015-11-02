-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (armv7l)
--
-- Host: localhost    Database: printing_vfront
-- ------------------------------------------------------
-- Server version	5.5.43-0+deb7u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `allegato`
--

DROP TABLE IF EXISTS `allegato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allegato` (
  `codiceallegato` int(11) NOT NULL AUTO_INCREMENT COMMENT 'chiave primaria identificativa del record',
  `tipoentita` varchar(100) DEFAULT NULL COMMENT 'identifica l''entitÃ  del database alla quale l''utente vuole collegare il file allegato. L''entitÃ  verrÃ  riconosciuta dall''applicazione in base alle operazioni svolte in quella fase dall''utente.',
  `codiceentita` varchar(255) DEFAULT NULL COMMENT 'identifica la particolare occorrenza (record) dell''entitÃ  del database alla quale l''utente vuole collegare il file allegato',
  `descroggall` varchar(250) DEFAULT NULL COMMENT 'descrizione dell''oggetto del file',
  `autoreall` varchar(250) DEFAULT NULL COMMENT 'autore del file da allegare',
  `versioneall` varchar(250) DEFAULT NULL COMMENT 'eventuale numero di versione del file ',
  `lastdata` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'campo automaticamente valorizzato dal DBMS al primo inserimento o quando il record viene modificato',
  `nomefileall` varchar(250) NOT NULL,
  PRIMARY KEY (`codiceallegato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='descrive i file in upload e li collega all''entitÃ ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allegato`
--

LOCK TABLES `allegato` WRITE;
/*!40000 ALTER TABLE `allegato` DISABLE KEYS */;
/*!40000 ALTER TABLE `allegato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_console`
--

DROP TABLE IF EXISTS `api_console`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_console` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(20) NOT NULL DEFAULT '',
  `rw` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=read only, 1=read and write',
  `api_key` varchar(100) NOT NULL DEFAULT '',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_key` (`api_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_console`
--

LOCK TABLES `api_console` WRITE;
/*!40000 ALTER TABLE `api_console` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_console` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `button`
--

DROP TABLE IF EXISTS `button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `button` (
  `id_button` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_table` int(10) NOT NULL,
  `definition` text COLLATE utf8_unicode_ci NOT NULL,
  `button_type` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `background` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `button_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_utente` int(11) unsigned NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_button`),
  KEY `id_table` (`id_table`),
  KEY `id_utente` (`id_utente`),
  CONSTRAINT `button_ibfk_1` FOREIGN KEY (`id_table`) REFERENCES `registro_tab` (`id_table`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `button`
--

LOCK TABLES `button` WRITE;
/*!40000 ALTER TABLE `button` DISABLE KEYS */;
/*!40000 ALTER TABLE `button` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_reg`
--

DROP TABLE IF EXISTS `cache_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_reg` (
  `id` int(11) unsigned NOT NULL,
  `obj` blob,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_reg`
--

LOCK TABLES `cache_reg` WRITE;
/*!40000 ALTER TABLE `cache_reg` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gruppo`
--

DROP TABLE IF EXISTS `gruppo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gruppo` (
  `gid` int(11) NOT NULL COMMENT 'ID del gruppo',
  `nome_gruppo` varchar(50) NOT NULL COMMENT 'Nome del gruppo',
  `descrizione_gruppo` text,
  `data_gruppo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gid`),
  UNIQUE KEY `gid` (`gid`),
  UNIQUE KEY `nome_gruppo` (`nome_gruppo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gruppo`
--

LOCK TABLES `gruppo` WRITE;
/*!40000 ALTER TABLE `gruppo` DISABLE KEYS */;
INSERT INTO `gruppo` VALUES (0,'default','gruppo di default','2015-06-12 15:36:41'),(1,'ecp','This crap appliation reqires us to make a new group. WTF?','2015-06-12 15:41:41');
/*!40000 ALTER TABLE `gruppo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `codicelink` int(11) NOT NULL AUTO_INCREMENT COMMENT 'chiave primaria identificativa del record',
  `tipoentita` varchar(100) DEFAULT NULL COMMENT 'identifica l''entitÃ  del database alla quale l''utente vuole abbinare il link ipertestuale. L''entitÃ  verrÃ  riconosciuta dall''applicazione in base alle operazioni svolte in quella fase dall''utente.',
  `codiceentita` varchar(255) DEFAULT NULL COMMENT 'identifica la particolare occorrenza (record) dell''entitÃ  del database alla quale l''utente vuole abbinare il collegamento',
  `link` varchar(250) DEFAULT NULL COMMENT 'URL del link a cui si rimanda',
  `descrizione` varchar(250) DEFAULT NULL,
  `lastdata` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'campo automaticamente valorizzato dal DBMS al primo inserimento o quando il record viene modificato',
  PRIMARY KEY (`codicelink`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lega le entitÃ  agli eventuali link ipertestuali';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id_log` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `op` enum('insert','update','delete','select','sconosciuta','ripristino','duplicazione','import') DEFAULT NULL,
  `uid` int(11) unsigned NOT NULL,
  `gid` int(11) unsigned NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tabella` varchar(100) NOT NULL,
  `id_record` varchar(100) DEFAULT NULL,
  `storico_pre` text,
  `storico_post` text,
  `id_istituto` int(11) DEFAULT NULL,
  `fonte` enum('m','s') NOT NULL DEFAULT 'm',
  `info_browser` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_log`),
  KEY `op` (`op`,`uid`,`data`,`tabella`,`id_record`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='Tabella di log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'insert',1,0,'2015-06-12 15:43:49','Spools','2',NULL,'INSERT INTO Spools (VendorSerial,VendorDiameter,VendorColour,VendorKilos,MeasuredDiameter,MiscellaneousNotes,ID) VALUES (\'N1301118P1TP50\',\'1.75\',\'Transparent Purple\',\'1\',\'0\',\'na\',\'2\')',NULL,'m','webkit 537.36 1 mac'),(2,'update',1,0,'2015-06-12 16:35:02','Models','1','a:5:{s:2:\"ID\";s:1:\"1\";s:9:\"VersionID\";s:1:\"1\";s:8:\"SlicerID\";s:1:\"1\";s:9:\"Shortname\";s:1:\"H\";s:11:\"PercentSize\";s:8:\"0.790000\";}','UPDATE Models SET \n PercentSize=\'79\'\n WHERE ID=\'1\' \n  LIMIT 1',NULL,'m','webkit 537.36 1 mac'),(3,'insert',1,0,'2015-06-12 17:22:37','Spools','3',NULL,'INSERT INTO Spools (VendorSerial,VendorDiameter,VendorColour,VendorKilos,MeasuredDiameter,MiscellaneousNotes) VALUES (\'P3D-00000056\',\'1.75\',\'Green\',\'1\',\'0\',\'na\')',NULL,'m','webkit 537.36 1 mac'),(4,'update',2,0,'2015-06-19 08:52:17','Spools','3','a:7:{s:2:\"ID\";s:1:\"3\";s:12:\"VendorSerial\";s:12:\"P3D-00000056\";s:14:\"VendorDiameter\";s:4:\"1.75\";s:12:\"VendorColour\";s:5:\"Green\";s:11:\"VendorKilos\";s:5:\"1.000\";s:16:\"MeasuredDiameter\";s:4:\"0.00\";s:18:\"MiscellaneousNotes\";s:2:\"na\";}','UPDATE Spools SET \n MeasuredDiameter=\'1.72\'\n WHERE ID=\'3\' \n  LIMIT 1',NULL,'m','webkit 537.36 1 nt'),(5,'insert',2,0,'2015-06-19 08:59:35','ModelVersions','2',NULL,'INSERT INTO ModelVersions (VersionCode,ID) VALUES (\'a6.7\',\'2\')',NULL,'m','webkit 537.36 1 nt'),(6,'insert',2,0,'2015-06-19 09:04:08','Trays','2',NULL,'INSERT INTO Trays (ID,Description) VALUES (\'2\',\'Tray of arms 79%\')',NULL,'m','webkit 537.36 1 nt'),(7,'insert',2,0,'2015-06-19 09:05:48','ModelVersions','3',NULL,'INSERT INTO ModelVersions (VersionCode,ID) VALUES (\'a3.61\',\'3\')',NULL,'m','webkit 537.36 1 nt'),(8,'insert',2,0,'2015-06-19 09:06:14','Models','2',NULL,'INSERT INTO Models (Shortname,PercentSize,SlicerID,VersionID) VALUES (\'Y-Arm\',\'79\',\'1\',\'3\')',NULL,'m','webkit 537.36 1 nt'),(9,'insert',2,0,'2015-06-19 09:06:33','TrayModels','1',NULL,'INSERT INTO TrayModels (ID,TraysID,ModelsID,Amount) VALUES (\'1\',\'2\',\'2\',\'19\')',NULL,'m','webkit 537.36 1 nt'),(10,'delete',2,0,'2015-06-19 11:51:30','PrintRuns','0','a:11:{s:2:\"ID\";s:1:\"0\";s:7:\"TraysID\";s:1:\"1\";s:10:\"PrintersID\";s:1:\"1\";s:8:\"SpoolsID\";s:1:\"1\";s:9:\"StartTime\";s:19:\"2015-06-12 13:40:45\";s:7:\"EndTime\";s:19:\"2015-06-12 23:32:33\";s:12:\"FilamentMass\";s:6:\"0.0000\";s:11:\"NumAccepted\";s:2:\"10\";s:13:\"NumBorderline\";s:1:\"0\";s:11:\"NumRejected\";s:1:\"0\";s:8:\"MakersID\";s:1:\"1\";}',NULL,NULL,'m','webkit 537.36 1 nt'),(11,'insert',2,0,'2015-06-19 11:52:07','PrintRuns','',NULL,'INSERT INTO PrintRuns (TraysID,PrintersID,SpoolsID,StartTime,EndTime,FilamentMass,NumAccepted,NumBorderline,NumRejected,MakersID) VALUES (\'2\',\'1\',\'3\',\'2015-06-19 10:25\',\'2015-06-19 13:31\',\'20\',\'19\',\'0\',\'0\',\'1\')',NULL,'m','webkit 537.36 1 nt'),(12,'insert',2,0,'2015-06-19 13:38:09','PrintRuns','1',NULL,'INSERT INTO PrintRuns (ID,TraysID,PrintersID,SpoolsID,StartTime,EndTime,FilamentMass,NumAccepted,NumBorderline,NumRejected,MakersID) VALUES (\'1\',\'2\',\'1\',\'3\',\'2015-06-20 14:37\',\'2015-06-20 21:37\',\'140\',\'8\',\'2\',\'0\',\'1\')',NULL,'m','webkit 537.36 1 nt'),(13,'insert',2,0,'2015-06-19 15:22:47','Slicers','2',NULL,'INSERT INTO Slicers (ID,SoftwareName,SoftwareVersion) VALUES (\'2\',\'Simplify3D\',\'2.2.2\')',NULL,'m','webkit 537.36 1 nt'),(14,'insert',2,0,'2015-06-19 15:23:18','Models','3',NULL,'INSERT INTO Models (VersionID,SlicerID,Shortname,PercentSize) VALUES (\'1\',\'2\',\'Tch H\',\'100\')',NULL,'m','webkit 537.36 1 nt'),(15,'insert',2,0,'2015-06-19 15:23:31','Models','4',NULL,'INSERT INTO Models (VersionID,SlicerID,Shortname,PercentSize) VALUES (\'1\',\'2\',\'Tch Y\',\'100\')',NULL,'m','webkit 537.36 1 nt'),(16,'insert',2,0,'2015-06-19 15:24:00','Models','5',NULL,'INSERT INTO Models (VersionID,SlicerID,Shortname,PercentSize) VALUES (\'1\',\'1\',\'Tch Dot\',\'100\')',NULL,'m','webkit 537.36 1 nt'),(17,'insert',2,0,'2015-06-19 15:24:40','Models','6',NULL,'INSERT INTO Models (VersionID,SlicerID,Shortname,PercentSize) VALUES (\'1\',\'1\',\'Tch Y\',\'100\')',NULL,'m','webkit 537.36 1 nt'),(18,'insert',2,0,'2015-06-19 15:28:15','Trays','3',NULL,'INSERT INTO Trays (ID,Description) VALUES (\'3\',\'5 Teacher Y Um2 Nuke Green \')',NULL,'m','webkit 537.36 1 nt'),(19,'insert',2,0,'2015-06-19 15:31:35','TrayModels','2',NULL,'INSERT INTO TrayModels (ID,TraysID,ModelsID,Amount) VALUES (\'2\',\'3\',\'4\',\'5\')',NULL,'m','webkit 537.36 1 nt'),(20,'insert',2,0,'2015-06-19 15:33:29','Spools','4',NULL,'INSERT INTO Spools (VendorSerial,VendorDiameter,VendorColour,VendorKilos,MeasuredDiameter,MiscellaneousNotes) VALUES (\'P3d-00000048\',\'2.85\',\'Nuke Green\',\'1\',\'2.88\',\'na\')',NULL,'m','webkit 537.36 1 nt'),(21,'insert',2,0,'2015-06-19 15:35:19','PrintRuns','2',NULL,'INSERT INTO PrintRuns (ID,TraysID,PrintersID,SpoolsID,StartTime,EndTime,FilamentMass,NumAccepted,NumBorderline,NumRejected,MakersID) VALUES (\'2\',\'3\',\'2\',\'4\',\'2015-06-16 16:33\',\'2015-06-17 00:25\',\'120\',\'0\',\'2\',\'3\',\'1\')',NULL,'m','webkit 537.36 1 nt'),(22,'insert',2,0,'2015-06-19 15:37:41','Models','7',NULL,'INSERT INTO Models (VersionID,SlicerID,Shortname,PercentSize) VALUES (\'1\',\'1\',\'Tch .\',\'100\')',NULL,'m','webkit 537.36 1 nt'),(23,'insert',2,0,'2015-06-19 15:39:16','Trays','4',NULL,'INSERT INTO Trays (ID,Description) VALUES (\'4\',\'3 Tch Y 9 Tch Dot\')',NULL,'m','webkit 537.36 1 nt'),(24,'insert',2,0,'2015-06-19 15:42:24','Trays','5',NULL,'INSERT INTO Trays (ID,Description) VALUES (\'5\',\'10 H Teacher UM2 Nuke Green\')',NULL,'m','webkit 537.36 1 nt'),(25,'insert',2,0,'2015-06-19 15:42:46','TrayModels','4',NULL,'INSERT INTO TrayModels (ID,TraysID,ModelsID,Amount) VALUES (\'4\',\'5\',\'3\',\'10\')',NULL,'m','webkit 537.36 1 nt'),(26,'insert',2,0,'2015-06-19 15:44:55','PrintRuns','4',NULL,'INSERT INTO PrintRuns (ID,TraysID,PrintersID,SpoolsID,StartTime,EndTime,FilamentMass,NumAccepted,NumBorderline,NumRejected,MakersID) VALUES (\'4\',\'5\',\'2\',\'4\',\'2015-06-16 16:43\',\'2015-06-16 23:43\',\'170\',\'0\',\'2\',\'8\',\'1\')',NULL,'m','webkit 537.36 1 nt'),(27,'insert',2,0,'2015-06-19 15:46:35','Trays','6',NULL,'INSERT INTO Trays (ID,Description) VALUES (\'6\',\'9 Tch Dot\')',NULL,'m','webkit 537.36 1 nt'),(28,'insert',2,0,'2015-06-19 15:47:20','TrayModels','5',NULL,'INSERT INTO TrayModels (ID,TraysID,ModelsID,Amount) VALUES (\'5\',\'6\',\'5\',\'9\')',NULL,'m','webkit 537.36 1 nt'),(29,'insert',2,0,'2015-06-19 15:49:14','PrintRuns','5',NULL,'INSERT INTO PrintRuns (ID,TraysID,PrintersID,SpoolsID,StartTime,EndTime,FilamentMass,NumAccepted,NumBorderline,NumRejected,MakersID) VALUES (\'5\',\'6\',\'2\',\'4\',\'2015-06-17 16:47\',\'2015-06-18 02:47\',\'49\',\'1\',\'3\',\'5\',\'1\')',NULL,'m','webkit 537.36 1 nt'),(30,'insert',2,0,'2015-06-24 12:26:07','Trays','7',NULL,'INSERT INTO Trays (ID,Description) VALUES (\'7\',\'1 Tch Y Rep2 Green\')',NULL,'m','webkit 537.36 1 nt'),(31,'insert',2,0,'2015-06-24 12:26:49','TrayModels','6',NULL,'INSERT INTO TrayModels (ID,TraysID,ModelsID,Amount) VALUES (\'6\',\'7\',\'6\',\'1\')',NULL,'m','webkit 537.36 1 nt'),(32,'insert',2,0,'2015-06-24 12:28:10','PrintRuns','6',NULL,'INSERT INTO PrintRuns (ID,TraysID,PrintersID,SpoolsID,StartTime,EndTime,FilamentMass,NumAccepted,NumBorderline,NumRejected,MakersID) VALUES (\'6\',\'7\',\'1\',\'2\',\'2015-06-23 13:27\',\'2015-06-23 16:00\',\'32\',\'1\',\'0\',\'0\',\'1\')',NULL,'m','webkit 537.36 1 nt'),(33,'insert',2,0,'2015-06-25 14:35:21','Trays','8',NULL,'INSERT INTO Trays (ID,Description) VALUES (\'8\',\'Rep 2 Day tch H\')',NULL,'m','webkit 537.36 1 nt'),(34,'insert',2,0,'2015-06-25 14:35:46','TrayModels','7',NULL,'INSERT INTO TrayModels (ID,TraysID,ModelsID,Amount) VALUES (\'7\',\'8\',\'3\',\'4\')',NULL,'m','webkit 537.36 1 nt'),(35,'insert',2,0,'2015-06-25 14:41:50','PrintRuns','7',NULL,'INSERT INTO PrintRuns (ID,TraysID,PrintersID,SpoolsID,StartTime,EndTime,FilamentMass,NumAccepted,NumBorderline,NumRejected,MakersID) VALUES (\'7\',\'8\',\'1\',\'3\',\'2015-06-25 10:20\',\'2015-06-25 16:15\',\'88\',\'4\',\'0\',\'0\',\'1\')',NULL,'m','webkit 537.36 1 nt');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordlock`
--

DROP TABLE IF EXISTS `recordlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordlock` (
  `tabella` varchar(50) NOT NULL,
  `colonna` varchar(50) NOT NULL,
  `id` varchar(50) NOT NULL,
  `tempo` int(11) NOT NULL,
  PRIMARY KEY (`tabella`,`colonna`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordlock`
--

LOCK TABLES `recordlock` WRITE;
/*!40000 ALTER TABLE `recordlock` DISABLE KEYS */;
/*!40000 ALTER TABLE `recordlock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_col`
--

DROP TABLE IF EXISTS `registro_col`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_col` (
  `id_reg` int(10) NOT NULL AUTO_INCREMENT,
  `id_table` int(11) DEFAULT NULL,
  `gid` int(10) DEFAULT NULL,
  `column_name` varchar(255) DEFAULT NULL,
  `ordinal_position` int(3) DEFAULT NULL,
  `column_default` varchar(255) DEFAULT NULL,
  `is_nullable` char(3) DEFAULT NULL,
  `column_type` varchar(255) DEFAULT NULL,
  `character_maximum_length` int(10) DEFAULT NULL,
  `data_type` varchar(255) DEFAULT NULL,
  `extra` varchar(200) DEFAULT NULL,
  `in_tipo` text,
  `in_default` text,
  `in_visibile` tinyint(1) DEFAULT '1',
  `in_richiesto` tinyint(1) DEFAULT '0',
  `in_suggest` tinyint(1) DEFAULT '0',
  `in_table` tinyint(1) DEFAULT '1',
  `in_line` tinyint(1) DEFAULT NULL,
  `in_ordine` int(3) DEFAULT '0',
  `jstest` mediumtext,
  `commento` varchar(255) DEFAULT NULL,
  `alias_frontend` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_reg`),
  KEY `i_registro_col_gid` (`gid`),
  KEY `id_table` (`id_table`),
  CONSTRAINT `FK_registro_col_1` FOREIGN KEY (`id_table`) REFERENCES `registro_tab` (`id_table`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='Registro documentazione dei campi delle tabelle dello schema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_col`
--

LOCK TABLES `registro_col` WRITE;
/*!40000 ALTER TABLE `registro_col` DISABLE KEYS */;
INSERT INTO `registro_col` VALUES (1,1,0,'ID',1,'','NO','int(11)',11,'int','auto_increment','','',1,0,0,1,0,0,'','',''),(2,1,0,'Name',2,'','NO','varchar(10)',10,'varchar','','','',1,0,0,1,0,0,'','',''),(3,2,0,'ID',1,'','NO','int(11)',11,'int','auto_increment','','',1,0,0,1,0,0,'','',''),(4,2,0,'VersionCode',2,'','NO','varchar(10)',10,'varchar','','','',1,0,0,1,0,0,'','',''),(5,3,0,'ID',1,'','NO','int(11)',11,'int','auto_increment','','',0,0,0,1,0,0,'','',''),(6,3,0,'VersionID',2,'','NO','int(11)',11,'int','','select_from','SELECT ID,VersionCode FROM ModelVersions',1,0,0,1,0,0,'','',''),(7,3,0,'SlicerID',3,'','NO','int(11)',11,'int','','select_from','SELECT ID,CONCAT(SoftwareName,\' v\',SoftwareVersion) FROM Slicers',1,0,0,1,0,0,'','',''),(8,3,0,'Shortname',4,'','NO','varchar(5)',5,'varchar','','char','',1,0,0,1,0,0,'','',''),(9,3,0,'PercentSize',5,'','NO','decimal(9,6)',0,'decimal','','float','',1,0,0,1,0,0,'','',''),(10,4,0,'ID',1,'','NO','int(11)',11,'int','','int','',1,0,1,1,0,0,'','',''),(11,4,0,'TraysID',2,'','NO','int(11)',11,'int','','select_from','SELECT ID,Description FROM Trays',1,0,0,1,0,0,'','',''),(12,4,0,'PrintersID',3,'','NO','int(11)',11,'int','','select_from','SELECT ID,Model FROM printers',1,0,0,1,0,0,'','',''),(13,4,0,'SpoolsID',4,'','NO','int(11)',11,'int','','select_from','SELECT ID, concat(VendorSerial,\' \',VendorColour) FROM Spools',1,0,0,1,0,0,'','',''),(14,4,0,'StartTime',5,'','NO','datetime',0,'datetime','','datetime','',1,0,0,1,0,0,'','',''),(15,4,0,'EndTime',6,'','NO','datetime',0,'datetime','','datetime','',1,0,0,1,0,0,'','',''),(16,4,0,'FilamentMass',7,'0.0000','NO','decimal(5,4)',0,'decimal','','float','',1,0,0,1,0,0,'','',''),(17,4,0,'NumAccepted',8,'','NO','int(11)',11,'int','','int','',1,0,0,1,0,0,'','',''),(18,4,0,'NumBorderline',9,'','NO','int(11)',11,'int','','int','',1,0,0,1,0,0,'','',''),(19,4,0,'NumRejected',10,'','NO','int(11)',11,'int','','int','',1,0,0,1,0,0,'','',''),(20,4,0,'MakersID',11,'','NO','int(11)',11,'int','','select_from','SELECT ID,Name FROM Makers',1,0,0,1,0,0,'','',''),(21,5,0,'ID',1,'','NO','int(11)',11,'int','auto_increment','','',1,0,0,1,0,0,'','',''),(22,5,0,'SoftwareName',2,'','NO','varchar(15)',15,'varchar','','','',1,0,0,1,0,0,'','',''),(23,5,0,'SoftwareVersion',3,'','NO','varchar(5)',5,'varchar','','','',1,0,0,1,0,0,'','',''),(24,6,0,'ID',1,'','NO','int(11)',11,'int','auto_increment','','',0,0,1,1,0,0,'','',''),(25,6,0,'VendorSerial',2,'','NO','varchar(20)',20,'varchar','','char','',1,0,0,1,0,0,'','',''),(26,6,0,'VendorDiameter',3,'','NO','decimal(3,2)',0,'decimal','','float','',1,0,0,1,0,0,'','',''),(27,6,0,'VendorColour',4,'','NO','varchar(40)',40,'varchar','','char','',1,0,0,1,0,0,'','',''),(28,6,0,'VendorKilos',5,'','NO','decimal(4,3)',0,'decimal','','float','',1,0,0,1,0,0,'','',''),(29,6,0,'MeasuredDiameter',6,'','NO','decimal(3,2)',0,'decimal','','float','',1,0,0,1,0,0,'','',''),(30,6,0,'MiscellaneousNotes',7,'','NO','varchar(30)',30,'varchar','','char','',1,0,0,1,0,0,'','',''),(31,7,0,'ID',1,'','NO','int(11)',11,'int','','int','',1,0,0,1,0,0,'','',''),(32,7,0,'TraysID',2,'','NO','int(11)',11,'int','','select_from','SELECT ID,Description FROM Trays',1,0,0,1,0,0,'','',''),(33,7,0,'ModelsID',3,'','NO','int(11)',11,'int','','select_from','SELECT ID,CONCAT(Shortname,\' (\', CAST(PercentSize AS DECIMAL(5,1)),\'%)\') FROM Models',1,0,0,1,0,0,'','',''),(34,7,0,'Amount',4,'','NO','int(11)',11,'int','','int','',1,0,0,1,0,0,'','',''),(35,8,0,'ID',1,'','NO','int(11)',11,'int','auto_increment','','',1,0,0,1,0,0,'','',''),(36,8,0,'Description',2,'','NO','varchar(30)',30,'varchar','','','',1,0,0,1,0,0,'','',''),(37,9,0,'ID',1,'','NO','int(11)',11,'int','auto_increment','','',1,0,0,1,0,0,'','',''),(38,9,0,'Model',2,'\"Unnamed\"','NO','varchar(20)',20,'varchar','','','',1,0,0,1,0,0,'','',''),(39,10,1,'ID',1,'','NO','int(11)',11,'int','auto_increment','','',1,0,0,1,0,0,'','',''),(40,10,1,'Name',2,'','NO','varchar(10)',10,'varchar','','','',1,0,0,1,0,0,'','',''),(41,11,1,'ID',1,'','NO','int(11)',11,'int','auto_increment','','',1,0,0,1,0,0,'','',''),(42,11,1,'VersionCode',2,'','NO','varchar(10)',10,'varchar','','','',1,0,0,1,0,0,'','',''),(43,12,1,'ID',1,'','NO','int(11)',11,'int','auto_increment','','',1,0,0,1,0,0,'','',''),(44,12,1,'VersionID',2,'','NO','int(11)',11,'int','','','',1,0,0,1,0,0,'','',''),(45,12,1,'SlicerID',3,'','NO','int(11)',11,'int','','','',1,0,0,1,0,0,'','',''),(46,12,1,'Shortname',4,'','NO','varchar(5)',5,'varchar','','','',1,0,0,1,0,0,'','',''),(47,12,1,'PercentSize',5,'','NO','decimal(9,6)',0,'decimal','','','',1,0,0,1,0,0,'','',''),(48,13,1,'ID',1,'','NO','int(11)',11,'int','','','',1,0,0,1,0,0,'','',''),(49,13,1,'TraysID',2,'','NO','int(11)',11,'int','','','',1,0,0,1,0,0,'','',''),(50,13,1,'PrintersID',3,'','NO','int(11)',11,'int','','','',1,0,0,1,0,0,'','',''),(51,13,1,'SpoolsID',4,'','NO','int(11)',11,'int','','','',1,0,0,1,0,0,'','',''),(52,13,1,'StartTime',5,'','NO','datetime',0,'datetime','','','',1,0,0,1,0,0,'','',''),(53,13,1,'EndTime',6,'','NO','datetime',0,'datetime','','','',1,0,0,1,0,0,'','',''),(54,13,1,'FilamentMass',7,'0.0000','NO','decimal(5,4)',0,'decimal','','','',1,0,0,1,0,0,'','',''),(55,13,1,'NumAccepted',8,'','NO','int(11)',11,'int','','','',1,0,0,1,0,0,'','',''),(56,13,1,'NumBorderline',9,'','NO','int(11)',11,'int','','','',1,0,0,1,0,0,'','',''),(57,13,1,'NumRejected',10,'','NO','int(11)',11,'int','','','',1,0,0,1,0,0,'','',''),(58,13,1,'MakersID',11,'','NO','int(11)',11,'int','','','',1,0,0,1,0,0,'','',''),(59,14,1,'ID',1,'','NO','int(11)',11,'int','auto_increment','','',1,0,0,1,0,0,'','',''),(60,14,1,'SoftwareName',2,'','NO','varchar(15)',15,'varchar','','','',1,0,0,1,0,0,'','',''),(61,14,1,'SoftwareVersion',3,'','NO','varchar(5)',5,'varchar','','','',1,0,0,1,0,0,'','',''),(62,15,1,'ID',1,'','NO','int(11)',11,'int','auto_increment','','',1,0,0,1,0,0,'','',''),(63,15,1,'VendorSerial',2,'','NO','varchar(20)',20,'varchar','','','',1,0,0,1,0,0,'','',''),(64,15,1,'VendorDiameter',3,'','NO','decimal(3,2)',0,'decimal','','','',1,0,0,1,0,0,'','',''),(65,15,1,'VendorColour',4,'','NO','varchar(40)',40,'varchar','','','',1,0,0,1,0,0,'','',''),(66,15,1,'VendorKilos',5,'','NO','decimal(4,3)',0,'decimal','','','',1,0,0,1,0,0,'','',''),(67,15,1,'MeasuredDiameter',6,'','NO','decimal(3,2)',0,'decimal','','','',1,0,0,1,0,0,'','',''),(68,15,1,'MiscellaneousNotes',7,'','NO','varchar(30)',30,'varchar','','','',1,0,0,1,0,0,'','',''),(69,16,1,'ID',1,'','NO','int(11)',11,'int','','','',1,0,0,1,0,0,'','',''),(70,16,1,'TraysID',2,'','NO','int(11)',11,'int','','','',1,0,0,1,0,0,'','',''),(71,16,1,'ModelsID',3,'','NO','int(11)',11,'int','','','',1,0,0,1,0,0,'','',''),(72,16,1,'Amount',4,'','NO','int(11)',11,'int','','','',1,0,0,1,0,0,'','',''),(73,17,1,'ID',1,'','NO','int(11)',11,'int','auto_increment','','',1,0,0,1,0,0,'','',''),(74,17,1,'Description',2,'','NO','varchar(30)',30,'varchar','','','',1,0,0,1,0,0,'','',''),(75,18,1,'ID',1,'','NO','int(11)',11,'int','auto_increment','','',1,0,0,1,0,0,'','',''),(76,18,1,'Model',2,'\"Unnamed\"','NO','varchar(20)',20,'varchar','','','',1,0,0,1,0,0,'','','');
/*!40000 ALTER TABLE `registro_col` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_submask`
--

DROP TABLE IF EXISTS `registro_submask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_submask` (
  `id_submask` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_table` int(11) NOT NULL COMMENT 'Tabella parent per la sottomaschera',
  `sub_select` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sub_insert` tinyint(1) DEFAULT '0',
  `sub_update` tinyint(1) DEFAULT '0',
  `sub_delete` tinyint(1) DEFAULT '0',
  `nome_tabella` varchar(255) DEFAULT NULL COMMENT 'Tabella fonte per la sottomaschera',
  `nome_frontend` varchar(250) DEFAULT NULL COMMENT 'Nome per la sottomaschera che apparirÃ  nella maschera utente',
  `campo_pk_parent` varchar(80) DEFAULT NULL COMMENT 'Campo che rappresenta la chiave primaria nella tabella parent',
  `campo_fk_sub` varchar(80) DEFAULT NULL COMMENT 'Campo che rappresenta la chiave esterna rispetto alla tabella parent',
  `orderby_sub` varchar(80) DEFAULT NULL COMMENT 'Campo orderby della sottomaschera',
  `orderby_sub_sort` enum('ASC','DESC') DEFAULT 'ASC',
  `data_modifica` int(11) unsigned DEFAULT NULL,
  `max_records` int(3) DEFAULT '10',
  `tipo_vista` enum('tabella','scheda','embed','schedash') NOT NULL DEFAULT 'scheda',
  PRIMARY KEY (`id_submask`),
  KEY `registro_submask_fk` (`id_table`),
  CONSTRAINT `registro_submask_fk` FOREIGN KEY (`id_table`) REFERENCES `registro_tab` (`id_table`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_submask`
--

LOCK TABLES `registro_submask` WRITE;
/*!40000 ALTER TABLE `registro_submask` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_submask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_submask_col`
--

DROP TABLE IF EXISTS `registro_submask_col`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_submask_col` (
  `id_reg_sub` int(10) NOT NULL AUTO_INCREMENT,
  `id_submask` int(11) unsigned NOT NULL,
  `column_name` varchar(255) DEFAULT NULL,
  `ordinal_position` int(3) DEFAULT NULL,
  `column_default` varchar(255) DEFAULT NULL,
  `is_nullable` char(3) DEFAULT NULL,
  `column_type` varchar(255) DEFAULT NULL,
  `character_maximum_length` int(10) DEFAULT NULL,
  `data_type` varchar(255) DEFAULT NULL,
  `extra` varchar(200) DEFAULT NULL,
  `in_tipo` text,
  `in_default` text,
  `in_visibile` tinyint(1) DEFAULT '1',
  `in_richiesto` tinyint(1) DEFAULT '0',
  `commento` varchar(255) DEFAULT NULL,
  `alias_frontend` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_reg_sub`),
  KEY `i_id_submask` (`id_submask`),
  CONSTRAINT `registro_submask_col_fk` FOREIGN KEY (`id_submask`) REFERENCES `registro_submask` (`id_submask`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro documentazione dei campi delle colonne delle sottom';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_submask_col`
--

LOCK TABLES `registro_submask_col` WRITE;
/*!40000 ALTER TABLE `registro_submask_col` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_submask_col` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_tab`
--

DROP TABLE IF EXISTS `registro_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_tab` (
  `id_table` int(10) NOT NULL AUTO_INCREMENT,
  `gid` int(10) DEFAULT NULL,
  `visibile` tinyint(1) DEFAULT '0',
  `in_insert` int(1) unsigned NOT NULL DEFAULT '0',
  `in_duplica` int(1) unsigned NOT NULL DEFAULT '0',
  `in_update` int(1) unsigned NOT NULL DEFAULT '0',
  `in_delete` int(1) unsigned NOT NULL DEFAULT '0',
  `in_export` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `in_import` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `data_modifica` int(10) DEFAULT '0',
  `orderby` varchar(255) DEFAULT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `table_type` varchar(20) DEFAULT 'BASE TABLE',
  `commento` varchar(255) DEFAULT NULL,
  `orderby_sort` varchar(255) DEFAULT 'ASC',
  `permetti_allegati` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `permetti_allegati_ins` tinyint(1) unsigned DEFAULT '0',
  `permetti_allegati_del` tinyint(1) unsigned DEFAULT '0',
  `permetti_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `permetti_link_ins` tinyint(1) unsigned DEFAULT '0',
  `permetti_link_del` tinyint(1) unsigned DEFAULT '0',
  `view_pk` varchar(60) DEFAULT NULL,
  `fonte_al` varchar(100) DEFAULT NULL,
  `table_alias` varchar(100) DEFAULT NULL,
  `allow_filters` tinyint(1) DEFAULT '0',
  `default_view` varchar(5) DEFAULT 'form',
  `default_filters` text,
  PRIMARY KEY (`id_table`),
  KEY `i_gid_tab` (`gid`),
  KEY `table_name` (`table_name`),
  KEY `id_table` (`id_table`),
  CONSTRAINT `registro_tab_fk` FOREIGN KEY (`gid`) REFERENCES `gruppo` (`gid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_tab`
--

LOCK TABLES `registro_tab` WRITE;
/*!40000 ALTER TABLE `registro_tab` DISABLE KEYS */;
INSERT INTO `registro_tab` VALUES (1,0,1,1,0,1,1,0,0,0,'','Makers','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(2,0,1,1,0,1,1,0,0,0,'','ModelVersions','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(3,0,1,1,0,1,1,0,0,0,'','Models','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(4,0,1,1,0,1,1,0,0,0,'','PrintRuns','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(5,0,1,1,0,1,1,0,0,0,'','Slicers','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(6,0,1,1,0,1,1,0,0,0,'','Spools','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(7,0,1,1,0,1,1,0,0,0,'','TrayModels','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(8,0,1,1,0,1,1,0,0,0,'','Trays','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(9,0,1,1,0,1,1,0,0,0,'','printers','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(10,1,1,0,0,0,0,0,0,0,'','Makers','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(11,1,1,0,0,0,0,0,0,0,'','ModelVersions','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(12,1,1,0,0,0,0,0,0,0,'','Models','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(13,1,1,0,0,0,0,0,0,0,'','PrintRuns','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(14,1,1,0,0,0,0,0,0,0,'','Slicers','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(15,1,1,0,0,0,0,0,0,0,'','Spools','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(16,1,1,0,0,0,0,0,0,0,'','TrayModels','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(17,1,1,0,0,0,0,0,0,0,'','Trays','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form',''),(18,1,1,0,0,0,0,0,0,0,'','printers','BASE TABLE','','ASC',0,0,0,0,0,0,'','','',0,'form','');
/*!40000 ALTER TABLE `registro_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat`
--

DROP TABLE IF EXISTS `stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat` (
  `id_stat` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome_stat` varchar(250) NOT NULL COMMENT 'Nome nella statistica',
  `desc_stat` text COMMENT 'Descrizione della statistica',
  `def_stat` text COMMENT 'Definizione della query SQL per la statistica',
  `auth_stat` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Tipo autorizzazione per statistica: 1=pubblica, 2=del gruppo, 3=personale',
  `tipo_graph` enum('barre','torta') DEFAULT 'barre',
  `data_stat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `autore` int(11) NOT NULL,
  `settings` text COMMENT 'Impostazioni avanzate del grafico',
  `published` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'published on home page',
  PRIMARY KEY (`id_stat`),
  UNIQUE KEY `id_stat` (`id_stat`),
  KEY `autore` (`autore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Statistiche descrittive registrate dagli utenti';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat`
--

LOCK TABLES `stat` WRITE;
/*!40000 ALTER TABLE `stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utente` (
  `id_utente` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nick` varchar(80) DEFAULT NULL,
  `passwd` char(32) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `info` text,
  `data_ins` date DEFAULT NULL,
  `gid` int(11) NOT NULL DEFAULT '0',
  `livello` int(1) NOT NULL DEFAULT '1',
  `recover_passwd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_utente`),
  UNIQUE KEY `id_utente` (`id_utente`),
  KEY `gid` (`gid`),
  CONSTRAINT `utente_fk` FOREIGN KEY (`gid`) REFERENCES `gruppo` (`gid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'adam@everyonecanprogram.com','e10adc3949ba59abbe56e057f20f883e','adam','adam','adam@everyonecanprogram.com',NULL,'2015-06-12',0,3,NULL),(2,'james','e10adc3949ba59abbe56e057f20f883e','james','james','james',NULL,'2015-06-12',0,3,NULL);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variabili`
--

DROP TABLE IF EXISTS `variabili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variabili` (
  `variabile` char(32) NOT NULL,
  `gid` int(11) NOT NULL DEFAULT '0',
  `valore` varchar(255) DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `tipo_var` varchar(20) DEFAULT NULL,
  `pubvar` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`variabile`,`gid`),
  KEY `variabile` (`variabile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variabili`
--

LOCK TABLES `variabili` WRITE;
/*!40000 ALTER TABLE `variabili` DISABLE KEYS */;
INSERT INTO `variabili` VALUES ('alert_config',0,'1','Mostra all\'admin l\'avviso in home page se Ã¨ presente qualche errore nella configurazione','bool',1),('alert_login_default',0,'1','Mostra agli utenti l\'avviso se sono presenti nel gruppo di default','bool',1),('altezza_iframe_tabella',0,'360','Altezza in numero di pixel del rettangolo per visualizzare i dati in tabella','int',1),('crea_nuovo_valore_ref',0,'0','permette in caso di tabella parent scrivibilie l\'inserimento di nuovi valori nella medesima','bool',1),('cron_days_min',0,'15','Numero di giorni minimi di anzianitÃ  dei file temporanei per essere eliminati','int',1),('default_group_ext',0,'0','The default group for external auth','int',1),('enable_adminer',0,'0','Enable Adminer schema administrator','bool',1),('force_isodate_on_mask',0,'0','Forza il formato delle date in maschere e sottomaschere a ISO (ISO 8601) anche se specificato altro formato di date','bool',1),('formati_attach',0,'doc,xls,pdf,rtf,odt,sxw,ppt,odp,ods,gif,jpg,png,jpeg,zip,txt,csv,DOC,XLS,PDF,RTF,ODT,SXW,PPT,ODP,ODS,GIF,JPG,PNG,JPEG,ZIP,TXT,CSV','Formati permessi per i file allegati, separati da virgola','string',1),('home_redirect',0,'','After login redirect to custom page/table','string',1),('js_test',0,'1','Abilita i controlli javascript sui contenuti dei campi','bool',1),('lang',0,'','Overwrite the group language','string',1),('layout',0,'default','Color theme','string',1),('max_char_tabella',0,'200','Numero massimo di caratteri da visualizzare nelle viste a tabella. (0 = tutti)','int',1),('max_tempo_edit',0,'300','Tempo di disponibilitÃ  del record','int',1),('n_record_tabella',0,'20','Numero di record da visualizzare per le tabelle dei dati','int',1),('passo_avanzamento_veloce',0,'20','Numero di record impostati per il movimento veloce tra i record nelle tabelle','int',1),('recupero_password',0,'1','Se abilitato mostra nel login l\'opzione di modificare la password (non funziona in caso di login esterno)','bool',1),('search_limit_results',0,'1000','Numero massimo di risultati per la ricerca','int',1),('server_xslt',0,'1','Indica se utilizzare la trasformazione XSLT lato server - da disabilitare in caso di mancato supporto PHP(0=no, 1=si)','bool',1),('shortcut_tastiera_attivi',0,'1','Abilita le scorciatoie da tastiera nelle maschere delle tabelle e delle viste','bool',1),('shortcut_tastiera_popup',0,'1','Mostra una linguetta per leggere i comandi da tastiera nelle maschere','bool',1),('show_comment_in_table',0,'1','Mostra il commento della tabella nella maschera di inserimento dati','bool',1),('show_updates',0,'1','Cerca update di VFront','bool',1),('textarea_cols',0,'50','Colonne per il box di testo','int',1),('textarea_rows',0,'8','Righe per il box di testo','int',1),('usa_calendari',0,'1','Indica se devono essere utilizzati o meno i calendari per facilitare l\'inserimento nei campi data (0=no, 1=si)','bool',1),('usa_history',0,'1','Imposta se si deve utilizzare la history del browser','bool',1);
/*!40000 ALTER TABLE `variabili` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `id_widget` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_table` int(10) NOT NULL,
  `widget_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `form_position` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `widget_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `settings` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_widget`),
  KEY `i_widget_id_table` (`id_table`),
  CONSTRAINT `fk_widget_id_table` FOREIGN KEY (`id_table`) REFERENCES `registro_tab` (`id_table`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Widget table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xml_rules`
--

DROP TABLE IF EXISTS `xml_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xml_rules` (
  `id_xml_rules` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tabella` varchar(50) NOT NULL,
  `accesso` varchar(20) NOT NULL DEFAULT 'RESTRICT' COMMENT 'RESTRICT,PUBLIC,FRONTEND,GROUP',
  `accesso_gruppo` varchar(100) DEFAULT NULL,
  `autore` int(11) DEFAULT NULL,
  `lastData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `xsl` varchar(80) DEFAULT NULL,
  `xslfo` varchar(80) DEFAULT NULL,
  `tipo_report` char(1) DEFAULT NULL,
  `def_query` text,
  `nome_report` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_xml_rules`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Regole per la definizione dei report XML based';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xml_rules`
--

LOCK TABLES `xml_rules` WRITE;
/*!40000 ALTER TABLE `xml_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `xml_rules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-02  0:01:04
