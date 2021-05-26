-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: s-vm.northeurope.cloudapp.azure.com    Database: iap-test
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cars`
--


-- COMPATIBLE WITH MYSQL 8
CREATE DATABASE `iap-test`;
USE `iap-test`;

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `worker_id` int NOT NULL COMMENT 'worker id, if assign all cars to admin ID if no driver yet',
  `plate_number` varchar(255) NOT NULL COMMENT 'plate number',
  `license_number` varchar(255) NOT NULL COMMENT 'registered license number',
  `model` varchar(255) NOT NULL COMMENT 'car model',
  `type` varchar(255) NOT NULL COMMENT 'van, minivan, pickup, sedan, combi, etc',
  `vin_number` varchar(255) NOT NULL COMMENT 'VIN model',
  `assigned` bit(1) DEFAULT NULL,
  PRIMARY KEY (`plate_number`),
  KEY `worker_id` (`worker_id`),
  CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (12,'PL47619','1020J','sayona4556','q2RT','vn2021',NULL),(12,'PL4761920','10200J','toyota','van','vn2022',NULL),(12,'PL4761921','101200J','hunday','van','vn2022',NULL),(12,'PL4761991','1012000J','verosa','cargo','vn2022',_binary ''),(12,'PL57619','10020J','verosa','vin','vn2021',_binary ''),(12,'PL57620','10040J','verosa','vin','vn2021',_binary ''),(12,'PL576201','10040J','benz','minbus','vn2021',_binary ''),(12,'PL576211','10040J','benz','minbus','vn2021',_binary ''),(12,'PL5762112','10040J','benz','minbus','vn2021',_binary ''),(12,'PL5763112','10040J','benz','minbus','vn2021',_binary ''),(12,'PL5763442','10040J','benz','minbus','vn2021',_binary ''),(12,'PL5763442890','10040J','benz','minbus','vn2021',_binary ''),(12,'PL57634429','10040J','benz','minbus','vn2021',_binary ''),(12,'PL5763442990','10040J','benz','minbus','vn2021',_binary ''),(12,'PL5773442590','10040J','benz','minbus','vn2021',_binary ''),(10,'PL5773442890','10040J','benz','minbus','vn2021',_binary '');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (50);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offices`
--

DROP TABLE IF EXISTS `offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offices` (
  `id` int NOT NULL,
  `city` varchar(255) NOT NULL COMMENT 'city of operation',
  `type` varchar(255) NOT NULL COMMENT 'BO or HQ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offices`
--

LOCK TABLES `offices` WRITE;
/*!40000 ALTER TABLE `offices` DISABLE KEYS */;
INSERT INTO `offices` VALUES (13,'WARSAW','HQ'),(15,'BUDAPEST','HQ'),(18,'LUBLIN','HQ'),(40,'HUNG','HQ');
/*!40000 ALTER TABLE `offices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `requestor_id` int NOT NULL COMMENT 'who requested',
  `branch_id` varchar(255) NOT NULL COMMENT 'from which branch',
  `car_model` varchar(255) NOT NULL COMMENT 'model of the car',
  `vehicle_preffered` varchar(255) NOT NULL COMMENT 'select car',
  `request_date` date NOT NULL COMMENT 'when was the car requested',
  `request_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'inprocess,approved,rejected',
  `approved_by` varchar(255) DEFAULT NULL COMMENT 'who approved/rejected the request',
  `approved_date` date DEFAULT NULL COMMENT 'when was the request rejected/approved',
  `branch_request_id` bigint NOT NULL,
  PRIMARY KEY (`request_id`),
  KEY `requestor_id` (`requestor_id`),
  CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`requestor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (46,12,'15','benz','minbus','2021-05-24','approved',NULL,'2021-05-24',69),(48,12,'15','benz','minbus','2021-05-24','rejected',NULL,'2021-05-24',72),(49,12,'15','benz','minbus','2021-05-24','approved',NULL,'2021-05-24',75);
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL,
  `title` text NOT NULL COMMENT 'what is your role',
  `description` text NOT NULL COMMENT 'role descriptions',
  `previleges` varchar(255) NOT NULL COMMENT 'admin,super user,client',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Branch Manager','branch supervisor','client'),(3,'office assistant manager ert','deals with office matters managing','manager'),(9,'office assistant manager ert','deals with office matters managing','manager');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `first_name` varchar(255) NOT NULL COMMENT 'to include first name',
  `middle_name` varchar(255) DEFAULT NULL COMMENT 'optional middle name',
  `surname` varchar(255) NOT NULL COMMENT 'to include surname',
  `pesel` varchar(255) DEFAULT NULL COMMENT 'to include pesel number if any',
  `gender` char(1) NOT NULL COMMENT 'to include gender',
  `birth_date` date NOT NULL COMMENT 'to include birthdate',
  `role_id` int DEFAULT NULL COMMENT 'administrator or client',
  `office_id` int DEFAULT NULL COMMENT 'where he work',
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pesel` (`pesel`),
  KEY `office_id` (`office_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10,'Jan','G','Kowalski','10201041426','M','2019-01-02',3,15,NULL),(12,'Pawel','G','Nowak','10201041526','M','2019-01-02',3,15,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'iap-test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-24 23:32:03
