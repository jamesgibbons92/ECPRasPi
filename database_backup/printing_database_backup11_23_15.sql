-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (armv7l)
--
-- Host: localhost    Database: printing
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
-- Table structure for table `BoxTemp`
--

DROP TABLE IF EXISTS `BoxTemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BoxTemp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BoxTemp`
--

LOCK TABLES `BoxTemp` WRITE;
/*!40000 ALTER TABLE `BoxTemp` DISABLE KEYS */;
INSERT INTO `BoxTemp` VALUES (1,'Classroom Box standard');
/*!40000 ALTER TABLE `BoxTemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Boxes`
--

DROP TABLE IF EXISTS `Boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Boxes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HasShipped` tinyint(1) NOT NULL DEFAULT '0',
  `NameOfSchool` varchar(30) DEFAULT NULL,
  `BoxTempID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `BoxTempID` (`BoxTempID`),
  CONSTRAINT `Boxes_ibfk_1` FOREIGN KEY (`BoxTempID`) REFERENCES `BoxTemp` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boxes`
--

LOCK TABLES `Boxes` WRITE;
/*!40000 ALTER TABLE `Boxes` DISABLE KEYS */;
INSERT INTO `Boxes` VALUES (1,1,'Mile Oak Primary',1);
/*!40000 ALTER TABLE `Boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BoxesModels`
--

DROP TABLE IF EXISTS `BoxesModels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BoxesModels` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ModelsID` int(11) NOT NULL,
  `SpoolsID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `BoxID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `BoxID` (`BoxID`),
  KEY `SpoolsID` (`SpoolsID`),
  KEY `ModelsID` (`ModelsID`),
  CONSTRAINT `BoxesModels_ibfk_1` FOREIGN KEY (`ModelsID`) REFERENCES `Models` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BoxesModels_ibfk_2` FOREIGN KEY (`SpoolsID`) REFERENCES `Spools` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BoxesModels_ibfk_3` FOREIGN KEY (`BoxID`) REFERENCES `Boxes` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BoxesModels`
--

LOCK TABLES `BoxesModels` WRITE;
/*!40000 ALTER TABLE `BoxesModels` DISABLE KEYS */;
INSERT INTO `BoxesModels` VALUES (1,1,3,30,1),(2,1,2,20,1),(3,8,3,15,1),(4,8,2,20,1);
/*!40000 ALTER TABLE `BoxesModels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Makers`
--

DROP TABLE IF EXISTS `Makers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Makers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Makers`
--

LOCK TABLES `Makers` WRITE;
/*!40000 ALTER TABLE `Makers` DISABLE KEYS */;
INSERT INTO `Makers` VALUES (1,'James Gibb'),(2,'Adam Marti');
/*!40000 ALTER TABLE `Makers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModelVersions`
--

DROP TABLE IF EXISTS `ModelVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ModelVersions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionCode` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModelVersions`
--

LOCK TABLES `ModelVersions` WRITE;
/*!40000 ALTER TABLE `ModelVersions` DISABLE KEYS */;
INSERT INTO `ModelVersions` VALUES (1,'a6.8'),(2,'a6.7'),(3,'a3.61');
/*!40000 ALTER TABLE `ModelVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Models`
--

DROP TABLE IF EXISTS `Models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Models` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL,
  `SlicerID` int(11) NOT NULL,
  `Shortname` varchar(5) NOT NULL,
  `PercentSize` decimal(9,6) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `VersionID` (`VersionID`),
  KEY `SlicerID` (`SlicerID`),
  CONSTRAINT `Models_ibfk_3` FOREIGN KEY (`VersionID`) REFERENCES `ModelVersions` (`ID`),
  CONSTRAINT `Models_ibfk_4` FOREIGN KEY (`SlicerID`) REFERENCES `Slicers` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Models`
--

LOCK TABLES `Models` WRITE;
/*!40000 ALTER TABLE `Models` DISABLE KEYS */;
INSERT INTO `Models` VALUES (1,1,1,'H',79.000000),(2,3,1,'Y-Arm',79.000000),(3,1,2,'Tch H',100.000000),(4,1,2,'Tch Y',100.000000),(5,1,1,'Tch D',100.000000),(6,1,1,'Tch Y',100.000000),(7,1,1,'Tch .',100.000000),(8,2,1,'Y',79.000000),(9,1,1,'Dot',79.000000);
/*!40000 ALTER TABLE `Models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrintRuns`
--

DROP TABLE IF EXISTS `PrintRuns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PrintRuns` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TraysID` int(11) NOT NULL,
  `PrintersID` int(11) NOT NULL,
  `SpoolsID` int(11) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `FilamentMass` decimal(5,4) NOT NULL DEFAULT '0.0000',
  `NumAccepted` int(11) NOT NULL,
  `NumBorderline` int(11) NOT NULL,
  `NumRejected` int(11) NOT NULL,
  `MakersID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TraysID` (`TraysID`),
  KEY `MakersID` (`MakersID`),
  KEY `PrintersID` (`PrintersID`),
  KEY `SpoolsID` (`SpoolsID`),
  CONSTRAINT `PrintRuns_ibfk_1` FOREIGN KEY (`TraysID`) REFERENCES `Trays` (`ID`),
  CONSTRAINT `PrintRuns_ibfk_2` FOREIGN KEY (`PrintersID`) REFERENCES `printers` (`ID`),
  CONSTRAINT `PrintRuns_ibfk_3` FOREIGN KEY (`MakersID`) REFERENCES `Makers` (`ID`),
  CONSTRAINT `PrintRuns_ibfk_4` FOREIGN KEY (`SpoolsID`) REFERENCES `Spools` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrintRuns`
--

LOCK TABLES `PrintRuns` WRITE;
/*!40000 ALTER TABLE `PrintRuns` DISABLE KEYS */;
INSERT INTO `PrintRuns` VALUES (1,2,1,3,'2015-06-20 14:37:00','2015-06-20 21:37:00',0.0000,8,2,0,1),(2,3,2,4,'2015-06-16 16:33:00','2015-06-17 00:25:00',0.0000,0,2,3,1),(3,2,1,3,'2015-06-19 10:25:00','2015-06-19 13:31:00',0.0000,19,0,0,1),(4,5,2,4,'2015-06-16 16:43:00','2015-06-16 23:43:00',0.0000,0,2,8,1),(5,6,2,4,'2015-06-17 16:47:00','2015-06-18 02:47:00',0.5000,1,3,5,1),(6,7,1,2,'2015-06-23 13:27:00','2015-06-23 16:00:00',0.0000,1,0,0,1),(7,8,1,3,'2015-06-25 10:20:00','2015-06-25 16:15:00',0.0000,4,0,0,1),(8,9,1,3,'2015-06-24 07:30:00','2015-06-24 17:30:00',0.0000,0,0,5,1),(9,10,1,3,'2015-06-24 07:30:00','2015-06-24 17:30:00',0.0000,0,0,1,1),(10,11,1,3,'2015-06-24 07:30:00','2015-06-24 17:30:00',0.0000,0,0,3,1),(12,9,1,3,'2015-06-25 17:00:00','2015-06-26 05:12:00',0.0000,5,0,0,1),(13,10,1,3,'2015-06-25 17:00:00','2015-06-26 05:12:00',0.0000,1,0,0,1),(14,11,1,3,'2015-06-25 17:00:00','2015-06-26 05:12:00',0.0000,3,0,0,1),(15,8,1,3,'2015-06-26 10:45:00','2015-06-26 17:49:00',0.2300,4,0,0,1),(16,12,1,3,'2015-06-26 18:00:00','2015-06-27 06:21:00',0.0000,7,0,0,1),(18,13,1,2,'2015-07-12 19:00:00','2015-07-12 08:07:00',0.1590,10,0,0,2),(19,13,1,2,'2015-07-06 00:00:00','2015-07-06 13:00:00',0.1590,10,0,0,2),(20,13,1,2,'2015-07-07 00:00:00','2015-07-07 13:00:00',0.1590,10,0,0,2),(21,13,1,2,'2015-07-08 00:00:00','2015-07-08 13:00:00',0.1590,10,0,0,2),(22,16,2,7,'2015-07-04 00:00:00','2015-07-04 10:00:00',0.1490,13,0,0,2),(23,16,2,7,'2015-07-06 00:00:00','2015-07-06 10:00:00',0.1630,13,0,0,2),(24,16,2,7,'2015-07-07 00:00:00','2015-07-07 10:00:00',0.1660,13,0,0,2),(25,13,2,7,'2015-07-09 16:00:00','2015-07-10 02:00:00',0.1490,10,0,0,1),(26,13,2,5,'2015-07-13 15:00:00','2015-07-14 01:00:00',0.1380,10,0,0,1),(27,17,1,2,'2015-07-10 17:00:00','2015-07-11 12:45:00',0.0990,6,0,0,1),(28,17,1,6,'2015-07-13 17:00:00','2015-07-14 00:45:00',0.1000,6,0,0,1),(29,18,2,7,'2015-07-01 00:00:00','2015-07-01 10:00:00',0.2010,8,0,0,2),(30,18,2,7,'2015-07-02 01:00:00','2015-07-02 10:00:00',0.2010,8,0,0,2),(31,13,1,2,'2015-07-02 00:00:00','2015-07-02 15:00:00',0.1590,10,0,0,2),(32,17,1,6,'2015-07-14 17:45:00','2015-07-15 01:30:00',0.1000,5,0,1,1),(33,13,2,5,'2015-07-14 17:00:00','2015-07-15 03:00:00',0.1190,0,0,10,1),(34,17,1,6,'2015-07-14 09:44:00','2015-07-14 17:54:00',0.1010,6,0,0,1),(35,23,1,6,'2015-07-16 17:00:00','2015-07-17 03:00:00',0.1410,8,0,0,1),(36,23,1,6,'2015-07-19 00:00:00','2015-07-19 10:00:00',0.1410,8,0,0,1),(37,24,1,6,'2015-07-20 13:00:00','2015-07-20 17:34:00',0.0260,19,0,0,1),(38,17,1,6,'2015-07-16 09:00:00','2015-07-16 17:11:00',0.1000,6,0,0,1),(43,30,1,6,'2015-07-21 14:00:00','2015-07-21 16:00:00',0.0270,0,0,2,1),(44,31,2,5,'2015-07-18 00:00:00','2015-07-19 00:00:00',0.0750,0,0,0,1),(45,33,2,5,'2015-07-22 16:00:00','2015-07-23 03:30:00',0.1500,9,0,1,1),(46,17,2,5,'2015-07-18 00:00:00','2015-07-18 14:00:00',0.0690,0,0,6,1),(47,32,1,8,'2015-07-22 14:00:00','2015-07-23 01:45:00',0.1520,7,0,2,1),(48,30,2,5,'2015-07-23 12:00:00','2015-07-23 12:47:00',0.0160,0,0,2,1),(49,37,1,8,'2015-07-31 00:00:00','2015-07-31 00:00:00',0.1310,0,0,0,1),(50,32,1,8,'2015-07-31 00:00:00','2015-07-31 11:00:00',0.1600,9,0,0,1),(51,33,2,5,'2015-07-30 00:00:00','2015-09-30 08:00:00',0.1600,12,0,0,1),(52,39,2,5,'2015-07-30 12:00:00','2015-07-30 21:00:00',0.1600,12,0,0,1),(53,39,2,5,'2015-07-31 00:00:00','2015-07-31 09:00:00',0.1600,12,0,0,1),(54,36,1,9,'2015-07-31 00:00:00','2015-07-31 04:00:00',0.0190,0,0,0,1),(55,35,2,10,'2015-08-04 10:00:00','2015-07-31 17:00:00',0.3000,0,0,0,1),(56,30,2,10,'2015-08-03 14:30:00','2015-08-03 16:00:00',0.0260,2,0,0,1),(57,17,2,10,'2015-08-03 16:00:00','2015-08-03 23:00:00',0.0860,6,0,0,1),(58,37,1,8,'2015-08-03 11:00:00','2015-08-03 12:00:00',0.1510,0,0,0,1),(59,37,1,9,'2015-08-03 12:00:00','2015-08-03 13:00:00',0.0400,0,0,0,1),(60,31,1,9,'2015-08-05 00:00:00','2015-08-05 00:00:00',0.0350,0,0,0,1),(61,23,2,11,'2015-08-04 18:00:00','2015-08-05 00:00:00',0.0960,0,3,4,1),(62,31,2,11,'2015-08-05 10:00:00','2015-08-05 12:28:00',0.0410,0,0,0,1),(63,33,1,9,'2015-08-06 14:00:00','2015-08-07 01:20:00',0.1640,10,0,0,1),(64,41,1,9,'2015-08-07 10:00:00','2015-08-07 19:00:00',0.1080,7,0,0,1),(65,42,2,11,'2015-07-30 00:00:00','2015-07-30 10:00:00',0.1010,6,0,0,1),(66,42,2,11,'2015-08-01 00:00:00','2015-08-01 10:00:00',0.1240,5,0,1,1),(67,40,1,9,'2015-08-10 15:00:00','2015-08-11 02:00:00',0.1180,7,0,0,1),(68,40,2,11,'2015-08-10 14:00:00','2015-08-11 01:00:00',0.1140,7,0,0,1),(69,40,1,9,'2015-08-13 15:00:00','2015-08-13 23:45:00',0.1180,7,0,0,1),(70,35,2,11,'2015-08-14 10:00:00','2015-08-14 13:00:00',0.0200,0,0,0,1),(71,40,2,11,'2015-08-17 00:00:00','2015-08-17 10:00:00',0.1150,7,0,0,1),(72,40,1,12,'2015-08-18 00:00:00','2015-08-18 10:00:00',0.1160,0,0,7,1),(73,40,2,13,'2015-08-17 00:00:00','2015-08-17 08:00:00',0.1260,7,0,0,1),(74,40,2,13,'2015-08-18 00:00:00','2015-08-18 08:00:00',0.1250,7,0,0,1),(75,40,2,13,'2015-08-19 00:00:00','2015-08-19 08:00:00',0.1280,7,0,0,1),(76,36,1,12,'2015-08-19 00:00:00','2015-08-21 15:00:00',0.0600,0,0,0,1),(77,40,2,11,'2015-08-28 15:00:00','2015-08-28 22:00:00',0.1240,7,0,0,1),(79,36,1,14,'2015-09-09 14:00:00','2015-09-09 22:15:00',0.1390,0,0,0,1),(80,45,1,14,'2015-09-08 00:00:00','2015-09-08 08:00:00',0.0600,16,0,0,1),(81,43,1,14,'2015-09-10 05:00:00','2015-09-10 16:00:00',0.0800,4,0,1,1),(82,46,2,16,'2015-10-08 00:00:00','2015-10-08 12:00:00',0.1840,12,0,1,1),(83,23,2,16,'2015-10-09 00:00:00','2015-10-05 00:00:00',0.1260,8,0,0,1);
/*!40000 ALTER TABLE `PrintRuns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Slicers`
--

DROP TABLE IF EXISTS `Slicers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Slicers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SoftwareName` varchar(15) NOT NULL,
  `SoftwareVersion` varchar(5) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Slicers`
--

LOCK TABLES `Slicers` WRITE;
/*!40000 ALTER TABLE `Slicers` DISABLE KEYS */;
INSERT INTO `Slicers` VALUES (1,'Makerware','3.5'),(2,'Simplify3D','2.2.2');
/*!40000 ALTER TABLE `Slicers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Spools`
--

DROP TABLE IF EXISTS `Spools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Spools` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VendorSerial` varchar(20) NOT NULL,
  `VendorDiameter` decimal(3,2) NOT NULL,
  `VendorColour` varchar(40) NOT NULL,
  `VendorKilos` decimal(4,3) NOT NULL,
  `MeasuredDiameter` decimal(3,2) DEFAULT NULL,
  `onPrinter` tinyint(1) NOT NULL DEFAULT '0',
  `MiscellaneousNotes` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Spools`
--

LOCK TABLES `Spools` WRITE;
/*!40000 ALTER TABLE `Spools` DISABLE KEYS */;
INSERT INTO `Spools` VALUES (1,'P3D-00000048',1.75,'White',1.000,0.00,0,''),(2,'N1301118P1TP50',1.75,'Transparent Purple',1.000,0.00,0,'na'),(3,'P3D-00000056',1.75,'Green',1.000,1.72,0,'na'),(4,'P3d-00000048',2.85,'Nuke Green',1.000,2.88,0,'na'),(5,'P3D-00000077',2.85,'Sky Blue',1.000,1.83,0,''),(6,'P3D-00000051',1.75,'Pink',1.000,1.71,0,''),(7,'P3D-00000082',2.85,'Trans Orange',1.000,1.92,0,''),(8,'P3D-00000051',1.75,'Pink',1.000,1.67,0,''),(9,'P3D-00000048',1.75,'White',1.000,1.65,0,'Temp : 200'),(10,'P3D-00000077',2.85,'Sky Blue',1.000,2.80,0,''),(11,'P3D-00000077',2.85,'Sky Blue',1.000,2.83,0,'Temp 225'),(12,'P3D-00000048',1.75,'White',1.000,1.68,0,'Temp: 225'),(13,'',2.85,'Clear',1.000,2.81,0,''),(14,'',1.72,'White',1.000,1.72,0,'220 Deg'),(15,'',1.75,'Black',1.000,1.70,0,''),(16,'',2.85,'Green',1.000,2.89,1,'temp: 225 with lube'),(17,'',1.75,'Clear',1.000,1.70,1,'Temp: 215'),(18,'',2.85,'Green',1.000,NULL,0,''),(19,'',2.85,'Translucent Purple',1.000,NULL,0,''),(20,'',1.75,'Clear',1.000,NULL,0,''),(21,'',1.75,'Black',1.000,NULL,0,''),(22,'',2.85,'Clear',1.000,NULL,0,''),(23,'',1.75,'Black',1.000,NULL,0,'');
/*!40000 ALTER TABLE `Spools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stock`
--

DROP TABLE IF EXISTS `Stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Piece` varchar(30) NOT NULL,
  `Colour` varchar(30) NOT NULL,
  `Total` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stock`
--

LOCK TABLES `Stock` WRITE;
/*!40000 ALTER TABLE `Stock` DISABLE KEYS */;
INSERT INTO `Stock` VALUES (2,'Y 79pc','Orange',20),(3,'Dot 79pc','Green',0),(4,'H 100pc','Orange',8),(5,'H 79pc','Purple',23),(6,'Dot 79pc','Purple',0),(7,'Y 79pc','Purple',10),(8,'H 79pc','Blue',72),(9,'Y 79pc','Blue',38),(12,'H 79pc','Pink',39),(13,'Y 79pc','Pink',14),(14,'H 79pc','White',25),(15,'Y 79pc','White',15),(16,'H 79pc','Green',23),(17,'Y 79pc','Green',13),(18,'H 79pc','Clear',18),(19,'Y 79pc','Clear',11),(20,'H 79pc','Orange',39);
/*!40000 ALTER TABLE `Stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrayModels`
--

DROP TABLE IF EXISTS `TrayModels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TrayModels` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TraysID` int(11) NOT NULL,
  `ModelsID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TraysID` (`TraysID`),
  KEY `ModelsID` (`ModelsID`),
  CONSTRAINT `TrayModels_ibfk_1` FOREIGN KEY (`TraysID`) REFERENCES `Trays` (`ID`),
  CONSTRAINT `TrayModels_ibfk_2` FOREIGN KEY (`ModelsID`) REFERENCES `Models` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrayModels`
--

LOCK TABLES `TrayModels` WRITE;
/*!40000 ALTER TABLE `TrayModels` DISABLE KEYS */;
INSERT INTO `TrayModels` VALUES (1,2,2,19),(2,3,4,5),(3,1,1,10),(4,5,3,10),(5,6,5,9),(6,7,6,1),(7,8,3,4),(8,23,1,5),(9,9,5,5),(10,10,3,1),(11,11,4,3),(12,12,3,7),(13,13,1,6),(14,13,8,4),(15,14,1,6),(16,15,8,4),(17,16,1,7),(18,16,8,4),(19,16,2,2),(20,17,1,4),(21,17,8,2),(22,18,3,8),(23,23,8,3),(24,24,2,19),(25,30,1,2),(26,32,1,5),(27,32,8,4),(28,33,1,6),(29,33,8,4),(30,34,1,4),(31,34,8,2),(32,39,1,12),(33,40,1,4),(34,40,8,3),(35,42,1,2),(36,42,8,4),(37,43,8,2),(38,43,1,3),(39,44,8,6),(40,45,9,16),(41,46,1,9),(42,46,8,4);
/*!40000 ALTER TABLE `TrayModels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trays`
--

DROP TABLE IF EXISTS `Trays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Trays` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trays`
--

LOCK TABLES `Trays` WRITE;
/*!40000 ALTER TABLE `Trays` DISABLE KEYS */;
INSERT INTO `Trays` VALUES (1,'10x6.8 H  Rep2 Green'),(2,'Tray of arms 79%'),(3,'5 Teacher Y Um2 Nuke Green '),(4,'3 Tch Y 9 Tch Dot'),(5,'10 H Teacher UM2 Nuke Green'),(6,'9 Tch Dot'),(7,'1 Tch Y Rep2 Green'),(8,'Rep 2 Day tch H'),(9,'1/3 Teacher Tray Dots'),(10,'2/3 Teacher Tray H'),(11,'3/3 Teacher Tray Y'),(12,'7 Teacher H Rep2'),(13,'4Y 6H 79pc'),(14,'1/2 Std Tray'),(15,'2/2 Std Tray'),(16,'7H 4Y 2Arm'),(17,'4H 2Y 79pc'),(18,'8 Teacher H'),(22,'test'),(23,'3y_5h_79pc'),(24,'19y_Arms'),(30,'2H_test'),(31,'Random Prints'),(32,'5h_4y_79pc'),(33,'6h_4y_79pc'),(34,'4h2y79pc UM2'),(35,'3D Hubs Print UM2'),(36,'3D Hubs Print Rep2'),(37,'R&D Prints'),(38,'Printer Maintenance'),(39,'12H 79pc'),(40,'3Y_4H_79pc'),(41,'4h_8dot_79pc'),(42,'4 Y 2H 79pC'),(43,'3H-2Y_79pc'),(44,'6y_79PC'),(45,'16_Dot'),(46,'4y9h');
/*!40000 ALTER TABLE `Trays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `history_extended`
--

DROP TABLE IF EXISTS `history_extended`;
/*!50001 DROP VIEW IF EXISTS `history_extended`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `history_extended` (
  `ID` tinyint NOT NULL,
  `Piece` tinyint NOT NULL,
  `Colour` tinyint NOT NULL,
  `Total` tinyint NOT NULL,
  `Green` tinyint NOT NULL,
  `Orange` tinyint NOT NULL,
  `Purple` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `history_itemvalue_pivot`
--

DROP TABLE IF EXISTS `history_itemvalue_pivot`;
/*!50001 DROP VIEW IF EXISTS `history_itemvalue_pivot`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `history_itemvalue_pivot` (
  `Piece` tinyint NOT NULL,
  `Green` tinyint NOT NULL,
  `Orange` tinyint NOT NULL,
  `Purple` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Model` varchar(20) NOT NULL DEFAULT '"Unnamed"',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printers`
--

LOCK TABLES `printers` WRITE;
/*!40000 ALTER TABLE `printers` DISABLE KEYS */;
INSERT INTO `printers` VALUES (1,'Replicator 2_1'),(2,'Ultimaker 2');
/*!40000 ALTER TABLE `printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `history_extended`
--

/*!50001 DROP TABLE IF EXISTS `history_extended`*/;
/*!50001 DROP VIEW IF EXISTS `history_extended`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `history_extended` AS (select `Stock`.`ID` AS `ID`,`Stock`.`Piece` AS `Piece`,`Stock`.`Colour` AS `Colour`,`Stock`.`Total` AS `Total`,(case when (`Stock`.`Colour` = 'Green') then `Stock`.`Total` end) AS `Green`,(case when (`Stock`.`Colour` = 'Orange') then `Stock`.`Total` end) AS `Orange`,(case when (`Stock`.`Colour` = 'Purple') then `Stock`.`Total` end) AS `Purple` from `Stock`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `history_itemvalue_pivot`
--

/*!50001 DROP TABLE IF EXISTS `history_itemvalue_pivot`*/;
/*!50001 DROP VIEW IF EXISTS `history_itemvalue_pivot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `history_itemvalue_pivot` AS (select `history_extended`.`Piece` AS `Piece`,sum(`history_extended`.`Green`) AS `Green`,sum(`history_extended`.`Orange`) AS `Orange`,sum(`history_extended`.`Purple`) AS `Purple` from `history_extended` group by `history_extended`.`Piece`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-23  0:01:04
