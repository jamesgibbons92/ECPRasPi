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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BoxTemp`
--

LOCK TABLES `BoxTemp` WRITE;
/*!40000 ALTER TABLE `BoxTemp` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boxes`
--

LOCK TABLES `Boxes` WRITE;
/*!40000 ALTER TABLE `Boxes` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BoxesModels`
--

LOCK TABLES `BoxesModels` WRITE;
/*!40000 ALTER TABLE `BoxesModels` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Models`
--

LOCK TABLES `Models` WRITE;
/*!40000 ALTER TABLE `Models` DISABLE KEYS */;
INSERT INTO `Models` VALUES (1,1,1,'H',79.000000),(2,3,1,'Y-Arm',79.000000),(3,1,2,'Tch H',100.000000),(4,1,2,'Tch Y',100.000000),(5,1,1,'Tch D',100.000000),(6,1,1,'Tch Y',100.000000),(7,1,1,'Tch .',100.000000),(8,2,1,'Y',79.000000);
/*!40000 ALTER TABLE `Models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrintRuns`
--

DROP TABLE IF EXISTS `PrintRuns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PrintRuns` (
  `ID` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrintRuns`
--

LOCK TABLES `PrintRuns` WRITE;
/*!40000 ALTER TABLE `PrintRuns` DISABLE KEYS */;
INSERT INTO `PrintRuns` VALUES (0,2,1,3,'2015-06-19 10:25:00','2015-06-19 13:31:00',0.0000,19,0,0,1),(1,2,1,3,'2015-06-20 14:37:00','2015-06-20 21:37:00',0.0000,8,2,0,1),(2,3,2,4,'2015-06-16 16:33:00','2015-06-17 00:25:00',0.0000,0,2,3,1),(4,5,2,4,'2015-06-16 16:43:00','2015-06-16 23:43:00',0.0000,0,2,8,1),(5,6,2,4,'2015-06-17 16:47:00','2015-06-18 02:47:00',0.5000,1,3,5,1),(6,7,1,2,'2015-06-23 13:27:00','2015-06-23 16:00:00',0.0000,1,0,0,1),(7,8,1,3,'2015-06-25 10:20:00','2015-06-25 16:15:00',0.0000,4,0,0,1),(8,9,1,3,'2015-06-24 07:30:00','2015-06-24 17:30:00',0.0000,0,0,5,1),(9,10,1,3,'2015-06-24 07:30:00','2015-06-24 17:30:00',0.0000,0,0,1,1),(10,11,1,3,'2015-06-24 07:30:00','2015-06-24 17:30:00',0.0000,0,0,3,1),(12,9,1,3,'2015-06-25 17:00:00','2015-06-26 05:12:00',0.0000,5,0,0,1),(13,10,1,3,'2015-06-25 17:00:00','2015-06-26 05:12:00',0.0000,1,0,0,1),(14,11,1,3,'2015-06-25 17:00:00','2015-06-26 05:12:00',0.0000,3,0,0,1),(15,8,1,3,'2015-06-26 10:45:00','2015-06-26 17:49:00',0.2300,4,0,0,1),(16,12,1,3,'2015-06-26 18:00:00','2015-06-27 06:21:00',0.0000,7,0,0,1),(18,13,1,2,'2015-07-12 19:00:00','2015-07-12 08:07:00',0.1590,10,0,0,2),(19,13,1,2,'2015-07-06 00:00:00','2015-07-06 13:00:00',0.1590,10,0,0,2),(20,13,1,2,'2015-07-07 00:00:00','2015-07-07 13:00:00',0.1590,10,0,0,2),(21,13,1,2,'2015-07-08 00:00:00','2015-07-08 13:00:00',0.1590,10,0,0,2),(22,16,2,7,'2015-07-04 00:00:00','2015-07-04 10:00:00',0.1490,13,0,0,2),(23,16,2,7,'2015-07-06 00:00:00','2015-07-06 10:00:00',0.1630,13,0,0,2),(24,16,2,7,'2015-07-07 00:00:00','2015-07-07 10:00:00',0.1660,13,0,0,2),(25,13,2,7,'2015-07-09 16:00:00','2015-07-10 02:00:00',0.1490,10,0,0,1),(26,13,2,5,'2015-07-13 15:00:00','2015-07-14 01:00:00',0.1380,10,0,0,1),(27,17,1,2,'2015-07-10 17:00:00','2015-07-11 12:45:00',0.0990,6,0,0,1),(28,17,1,6,'2015-07-13 17:00:00','2015-07-14 00:45:00',0.1000,6,0,0,1);
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
  `MeasuredDiameter` decimal(3,2) NOT NULL,
  `MiscellaneousNotes` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Spools`
--

LOCK TABLES `Spools` WRITE;
/*!40000 ALTER TABLE `Spools` DISABLE KEYS */;
INSERT INTO `Spools` VALUES (1,'P3D-00000048',1.75,'White',1.000,0.00,''),(2,'N1301118P1TP50',1.75,'Transparent Purple',1.000,0.00,'na'),(3,'P3D-00000056',1.75,'Green',1.000,1.72,'na'),(4,'P3d-00000048',2.85,'Nuke Green',1.000,2.88,'na'),(5,'P3D-00000077',2.85,'Sky Blue',1.000,1.83,''),(6,'P3D-00000051',1.75,'Pink',1.000,1.71,''),(7,'P3D-00000082',2.85,'Trans Orange',1.000,1.92,'');
/*!40000 ALTER TABLE `Spools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrayModels`
--

DROP TABLE IF EXISTS `TrayModels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TrayModels` (
  `ID` int(11) NOT NULL,
  `TraysID` int(11) NOT NULL,
  `ModelsID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TraysID` (`TraysID`),
  KEY `ModelsID` (`ModelsID`),
  CONSTRAINT `TrayModels_ibfk_1` FOREIGN KEY (`TraysID`) REFERENCES `Trays` (`ID`),
  CONSTRAINT `TrayModels_ibfk_2` FOREIGN KEY (`ModelsID`) REFERENCES `Models` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrayModels`
--

LOCK TABLES `TrayModels` WRITE;
/*!40000 ALTER TABLE `TrayModels` DISABLE KEYS */;
INSERT INTO `TrayModels` VALUES (0,1,1,10),(1,2,2,19),(2,3,4,5),(4,5,3,10),(5,6,5,9),(6,7,6,1),(7,8,3,4),(9,9,5,5),(10,10,3,1),(11,11,4,3),(12,12,3,7),(13,13,1,6),(14,13,8,4),(15,14,1,6),(16,15,8,4),(17,16,1,7),(18,16,8,4),(19,16,2,2),(20,17,1,4),(21,17,8,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trays`
--

LOCK TABLES `Trays` WRITE;
/*!40000 ALTER TABLE `Trays` DISABLE KEYS */;
INSERT INTO `Trays` VALUES (1,'10x6.8 H  Rep2 Green'),(2,'Tray of arms 79%'),(3,'5 Teacher Y Um2 Nuke Green '),(4,'3 Tch Y 9 Tch Dot'),(5,'10 H Teacher UM2 Nuke Green'),(6,'9 Tch Dot'),(7,'1 Tch Y Rep2 Green'),(8,'Rep 2 Day tch H'),(9,'1/3 Teacher Tray Dots'),(10,'2/3 Teacher Tray H'),(11,'3/3 Teacher Tray Y'),(12,'7 Teacher H Rep2'),(13,'4Y 6H 79pc'),(14,'1/2 Std Tray'),(15,'2/2 Std Tray'),(16,'7H 4Y 2Arm'),(17,'4H 2Y 79pc');
/*!40000 ALTER TABLE `Trays` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-14 11:52:17
