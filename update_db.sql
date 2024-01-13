-- Myles Crouther, David Willoughby, Jonathan Stuppin
-- University of Arizona Global Campus
-- INT 499 - Capstone for Information Technology (INP2350A)
-- Professor: Joseph Issa

-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: int499
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Customer_FamilyMembers`
--

DROP TABLE IF EXISTS `Customer_FamilyMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_FamilyMembers` (
  `idCustomer_FamilyMembers` int NOT NULL,
  `FamilyMember1` varchar(45) NOT NULL,
  `FamilyMember2` varchar(45) DEFAULT NULL,
  `FamilyMember3` varchar(45) DEFAULT NULL,
  `FamilyMember4` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCustomer_FamilyMembers`),
  CONSTRAINT `cus_ID` FOREIGN KEY (`idCustomer_FamilyMembers`) REFERENCES `Customers` (`cus_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_FamilyMembers`
--

LOCK TABLES `Customer_FamilyMembers` WRITE;
/*!40000 ALTER TABLE `Customer_FamilyMembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer_FamilyMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `cus_ID` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `plan_id` int NOT NULL,
  `created` datetime NOT NULL,
  `active` int NOT NULL,
  `canceled` datetime DEFAULT NULL,
  `dvdscurrentlyrented` int DEFAULT NULL,
  `currentstreams` int DEFAULT NULL,
  `Full Name` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cus_ID`),
  KEY `plan_id_idx` (`plan_id`),
  CONSTRAINT `plan_id` FOREIGN KEY (`plan_id`) REFERENCES `Plans` (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DVD_Movies`
--

DROP TABLE IF EXISTS `DVD_Movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DVD_Movies` (
  `DVD_Movies_ID` int NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `runtime` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `body` varchar(45) DEFAULT NULL,
  `Copies_available` int DEFAULT NULL,
  `Copies_rented` int DEFAULT NULL,
  PRIMARY KEY (`DVD_Movies_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DVD_Movies`
--

LOCK TABLES `DVD_Movies` WRITE;
/*!40000 ALTER TABLE `DVD_Movies` DISABLE KEYS */;
/*!40000 ALTER TABLE `DVD_Movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DVD_Rentals`
--

DROP TABLE IF EXISTS `DVD_Rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DVD_Rentals` (
  `DVDR_ID` int NOT NULL,
  `DVDR_CID` int NOT NULL,
  PRIMARY KEY (`DVDR_ID`,`DVDR_CID`),
  KEY `cus_ID_idx` (`DVDR_CID`),
  CONSTRAINT `DVD_Movies_ID` FOREIGN KEY (`DVDR_ID`) REFERENCES `DVD_Movies` (`DVD_Movies_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DVD_Rentals`
--

LOCK TABLES `DVD_Rentals` WRITE;
/*!40000 ALTER TABLE `DVD_Rentals` DISABLE KEYS */;
/*!40000 ALTER TABLE `DVD_Rentals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plans`
--

DROP TABLE IF EXISTS `Plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plans` (
  `plan_id` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plans`
--

LOCK TABLES `Plans` WRITE;
/*!40000 ALTER TABLE `Plans` DISABLE KEYS */;
INSERT INTO `Plans` VALUES (1,'Individual Streaming',NULL),(2,'Friendly Streaming',NULL),(3,'Family Streaming',NULL);
/*!40000 ALTER TABLE `Plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Streamable_Movies`
--

DROP TABLE IF EXISTS `Streamable_Movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Streamable_Movies` (
  `SMovie_ID` int NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Runtime` int DEFAULT NULL,
  `Body` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SMovie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Streamable_Movies`
--

LOCK TABLES `Streamable_Movies` WRITE;
/*!40000 ALTER TABLE `Streamable_Movies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Streamable_Movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-13 12:40:47
