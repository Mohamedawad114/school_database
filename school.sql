-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `attudence`
--

DROP TABLE IF EXISTS `attudence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attudence` (
  `ATT_ID` int NOT NULL AUTO_INCREMENT,
  `STUDENT_ID` int DEFAULT NULL,
  `TEACHER_ID` int DEFAULT NULL,
  `STATUS` enum('ABSENT','EXIST') DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  PRIMARY KEY (`ATT_ID`),
  KEY `TEACHER_ID` (`TEACHER_ID`),
  KEY `STUDENT_ID` (`STUDENT_ID`),
  CONSTRAINT `attudence_ibfk_1` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teacher` (`TEACHER_ID`),
  CONSTRAINT `attudence_ibfk_2` FOREIGN KEY (`STUDENT_ID`) REFERENCES `students` (`STUDENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attudence`
--

LOCK TABLES `attudence` WRITE;
/*!40000 ALTER TABLE `attudence` DISABLE KEYS */;
/*!40000 ALTER TABLE `attudence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `CLASS_ID` int NOT NULL AUTO_INCREMENT,
  `LEVEL` int DEFAULT NULL,
  PRIMARY KEY (`CLASS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DEP_ID` int NOT NULL AUTO_INCREMENT,
  `DEP_NAME` char(1) NOT NULL,
  PRIMARY KEY (`DEP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor` (
  `DONOR_ID` int NOT NULL,
  `DONOR_NAME` char(1) DEFAULT NULL,
  `PHONE` char(1) DEFAULT NULL,
  PRIMARY KEY (`DONOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor_deal`
--

DROP TABLE IF EXISTS `donor_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor_deal` (
  `SERIAL_DEAL` bigint NOT NULL AUTO_INCREMENT,
  `DATE` date DEFAULT NULL,
  `PAY_WAY` enum('CASH','VISA') NOT NULL,
  `AMOUNT` decimal(10,0) DEFAULT NULL,
  `DONOR_ID` int DEFAULT NULL,
  `DEP_ID` int DEFAULT NULL,
  PRIMARY KEY (`SERIAL_DEAL`),
  KEY `DONOR_ID` (`DONOR_ID`),
  KEY `DEP_ID` (`DEP_ID`),
  CONSTRAINT `donor_deal_ibfk_1` FOREIGN KEY (`DONOR_ID`) REFERENCES `donor` (`DONOR_ID`),
  CONSTRAINT `donor_deal_ibfk_2` FOREIGN KEY (`DEP_ID`) REFERENCES `department` (`DEP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor_deal`
--

LOCK TABLES `donor_deal` WRITE;
/*!40000 ALTER TABLE `donor_deal` DISABLE KEYS */;
/*!40000 ALTER TABLE `donor_deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EMP_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` char(1) NOT NULL,
  `PHONE` char(1) DEFAULT NULL,
  `ADDRESS` char(255) DEFAULT NULL,
  `BIRTH_DATE` date DEFAULT NULL,
  `DEP_ID` int DEFAULT NULL,
  PRIMARY KEY (`EMP_ID`),
  KEY `fk_dep` (`DEP_ID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DEP_ID`) REFERENCES `department` (`DEP_ID`),
  CONSTRAINT `fk_dep` FOREIGN KEY (`DEP_ID`) REFERENCES `department` (`DEP_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `GRADE_ID` int NOT NULL,
  `SUBJECT_ID` int DEFAULT NULL,
  `TERM` enum('ONE','TWO') DEFAULT NULL,
  `GRADE` int DEFAULT NULL,
  `GRADE_DATE` date DEFAULT NULL,
  `STUDENT_ID` int DEFAULT NULL,
  PRIMARY KEY (`GRADE_ID`),
  KEY `STUDENT_ID` (`STUDENT_ID`),
  KEY `SUBJECT_ID` (`SUBJECT_ID`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`STUDENT_ID`) REFERENCES `students` (`STUDENT_ID`) ON UPDATE CASCADE,
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subjects` (`SUBJECT_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parents` (
  `PARENT_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` char(50) NOT NULL,
  `JOB` char(75) DEFAULT NULL,
  `ADDRESS` char(150) DEFAULT NULL,
  `PHONE` char(11) DEFAULT NULL,
  PRIMARY KEY (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents`
--

LOCK TABLES `parents` WRITE;
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `STUDENT_ID` int NOT NULL AUTO_INCREMENT,
  `LEVEL` int NOT NULL,
  `NAME` char(50) NOT NULL,
  `ADDRESS` char(200) DEFAULT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `CLASS_ID` int DEFAULT NULL,
  PRIMARY KEY (`STUDENT_ID`),
  KEY `PARENT_ID` (`PARENT_ID`),
  KEY `CLASS_ID` (`CLASS_ID`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`PARENT_ID`) REFERENCES `parents` (`PARENT_ID`) ON DELETE RESTRICT,
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`CLASS_ID`) REFERENCES `class` (`CLASS_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `SUBJECT_ID` int NOT NULL AUTO_INCREMENT,
  `SUB_NAME` char(1) NOT NULL,
  PRIMARY KEY (`SUBJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `TEACHER_ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dep_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`TEACHER_ID`),
  KEY `dep_id` (`dep_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `department` (`DEP_ID`),
  CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`SUBJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_calss`
--

DROP TABLE IF EXISTS `teacher_calss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_calss` (
  `TEACHER_ID` int NOT NULL,
  `CLASS_ID` int NOT NULL,
  `TEACHING_HOURS` int DEFAULT NULL,
  PRIMARY KEY (`TEACHER_ID`,`CLASS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_calss`
--

LOCK TABLES `teacher_calss` WRITE;
/*!40000 ALTER TABLE `teacher_calss` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_calss` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-28 16:53:26
