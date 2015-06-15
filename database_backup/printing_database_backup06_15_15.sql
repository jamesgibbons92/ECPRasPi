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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModelVersions`
--

LOCK TABLES `ModelVersions` WRITE;
/*!40000 ALTER TABLE `ModelVersions` DISABLE KEYS */;
INSERT INTO `ModelVersions` VALUES (1,'a6.8');
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
  CONSTRAINT `Models_ibfk_4` FOREIGN KEY (`SlicerID`) REFERENCES `Slicers` (`ID`),
  CONSTRAINT `Models_ibfk_3` FOREIGN KEY (`VersionID`) REFERENCES `ModelVersions` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Models`
--

LOCK TABLES `Models` WRITE;
/*!40000 ALTER TABLE `Models` DISABLE KEYS */;
INSERT INTO `Models` VALUES (1,1,1,'H',79.000000);
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
  CONSTRAINT `PrintRuns_ibfk_4` FOREIGN KEY (`SpoolsID`) REFERENCES `Spools` (`ID`),
  CONSTRAINT `PrintRuns_ibfk_1` FOREIGN KEY (`TraysID`) REFERENCES `Trays` (`ID`),
  CONSTRAINT `PrintRuns_ibfk_2` FOREIGN KEY (`PrintersID`) REFERENCES `printers` (`ID`),
  CONSTRAINT `PrintRuns_ibfk_3` FOREIGN KEY (`MakersID`) REFERENCES `Makers` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrintRuns`
--

LOCK TABLES `PrintRuns` WRITE;
/*!40000 ALTER TABLE `PrintRuns` DISABLE KEYS */;
INSERT INTO `PrintRuns` VALUES (0,1,1,1,'2015-06-12 13:40:45','2015-06-12 23:32:33',0.0000,10,0,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Slicers`
--

LOCK TABLES `Slicers` WRITE;
/*!40000 ALTER TABLE `Slicers` DISABLE KEYS */;
INSERT INTO `Slicers` VALUES (1,'Makerware','3.5');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Spools`
--

LOCK TABLES `Spools` WRITE;
/*!40000 ALTER TABLE `Spools` DISABLE KEYS */;
INSERT INTO `Spools` VALUES (1,'P3D-00000048',1.75,'White',1.000,0.00,''),(2,'N1301118P1TP50',1.75,'Transparent Purple',1.000,0.00,'na'),(3,'P3D-00000056',1.75,'Green',1.000,0.00,'na');
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
  CONSTRAINT `TrayModels_ibfk_2` FOREIGN KEY (`ModelsID`) REFERENCES `Models` (`ID`),
  CONSTRAINT `TrayModels_ibfk_1` FOREIGN KEY (`TraysID`) REFERENCES `Trays` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrayModels`
--

LOCK TABLES `TrayModels` WRITE;
/*!40000 ALTER TABLE `TrayModels` DISABLE KEYS */;
INSERT INTO `TrayModels` VALUES (0,1,1,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trays`
--

LOCK TABLES `Trays` WRITE;
/*!40000 ALTER TABLE `Trays` DISABLE KEYS */;
INSERT INTO `Trays` VALUES (1,'10x6.8 H  Rep2 Green');
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

-- Dump completed on 2015-06-15 15:09:41
