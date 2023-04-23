-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `AppointmentID` int NOT NULL,
  `ReasonOfVisit` varchar(255) NOT NULL,
  `Date` varchar(255) NOT NULL,
  `Time` varchar(255) NOT NULL,
  `PatientID` int NOT NULL,
  `DoctorID` int NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `appointment_doctorid_foreign` (`DoctorID`),
  KEY `appointment_patientid_foreign` (`PatientID`),
  CONSTRAINT `appointment_doctorid_foreign` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`),
  CONSTRAINT `appointment_patientid_foreign` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'Check-Up','3/28/2021','14:13',1,9),(2,'Therapy','11/20/2022','12:47',2,19),(3,'Therapy','10/21/2019','10:11',3,3),(4,'Surgery','12/29/2020','16:52',4,14),(5,'Therapy','5/30/2020','14:08',5,13),(6,'Illness','3/15/2020','8:58',6,6),(7,'Check-Up','6/1/2021','10:08',7,13),(8,'Check-Up','3/15/2021','11:25',8,15),(9,'Therapy','12/25/2022','9:39',9,28),(10,'Illness','3/17/2021','15:15',10,16),(11,'Therapy','12/28/2019','15:54',11,8),(12,'Check-Up','9/2/2022','8:25',12,10),(13,'Surgery','2/25/2023','12:57',13,6),(14,'Therapy','11/6/2021','15:57',14,18),(15,'Surgery','1/18/2020','14:25',15,15),(16,'Check-Up','1/29/2022','16:06',16,27),(17,'Check-Up','1/31/2020','15:23',17,6),(18,'Illness','2/13/2022','13:18',18,2),(19,'Surgery','7/30/2021','13:25',19,17),(20,'Illness','5/5/2021','8:41',20,3),(21,'Surgery','3/28/2019','9:13',21,12),(22,'Check-Up','7/23/2019','9:52',22,8),(23,'Check-Up','2/29/2020','12:59',23,5),(24,'Illness','6/20/2020','8:25',24,10),(25,'Check-Up','3/3/2023','14:15',25,26),(26,'Therapy','8/15/2021','15:34',26,11),(27,'Illness','6/7/2022','12:02',27,15),(28,'Check-Up','12/21/2019','15:11',28,30),(29,'Therapy','7/1/2020','15:45',29,28),(30,'Check-Up','10/9/2020','16:29',30,16),(31,'Surgery','4/10/2022','16:44',8,15),(32,'Therapy','4/16/2021','16:29',9,28),(33,'Surgery','2/14/2021','14:59',10,16),(34,'Check-Up','9/23/2022','15:43',11,8),(35,'Check-Up','1/4/2023','12:26',12,10),(36,'Illness','3/11/2023','14:34',13,6),(37,'Surgery','12/14/2022','15:03',14,18),(38,'Illness','6/23/2019','14:23',15,15),(39,'Surgery','6/10/2022','8:16',16,27),(40,'Check-Up','4/28/2022','11:39',17,6),(41,'Check-Up','9/10/2022','10:22',18,2),(42,'Illness','2/9/2023','10:50',19,17),(43,'Check-Up','3/28/2021','15:17',20,3),(44,'Therapy','5/20/2021','16:31',21,12),(45,'Illness','1/26/2020','8:47',22,8);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `BillNumber` int NOT NULL,
  `InsuranceInfo` varchar(255) NOT NULL,
  `Payment` varchar(255) NOT NULL,
  `TotalCharge` int NOT NULL,
  `PatientID` int NOT NULL,
  PRIMARY KEY (`BillNumber`),
  CONSTRAINT `billing_billnumber_foreign` FOREIGN KEY (`BillNumber`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (1,'United Health','Paypal',37097,30),(2,'CVS Health','Discover',21358,24),(3,'Anthem','VISA',8069,18),(4,'Blue Cross','Discover',37477,9),(5,'Blue Cross','Mastercard',56122,20),(6,'Anthem','Paypal',22522,23),(7,'CVS Health','Paypal',52141,15),(8,'Anthem','VISA',53651,8),(9,'Humana','Mastercard',15476,14),(10,'United Health','VISA',61724,11),(11,'Humana','Discover',24294,10),(12,'Blue Cross','VISA',26797,19),(13,'CVS Health','Discover',26820,3),(14,'Blue Cross','VISA',61517,5),(15,'Humana','VISA',18645,2),(16,'Humana','Paypal',11576,27),(17,'Blue Cross','VISA',13363,4),(18,'Humana','Mastercard',46357,17),(19,'CVS Health','VISA',58241,21),(20,'CVS Health','Discover',37360,1),(21,'Anthem','Paypal',35244,26),(22,'Humana','Discover',22885,25),(23,'Anthem','Discover',14646,12),(24,'United Health','Discover',31802,28),(25,'Anthem','Paypal',54779,6),(26,'CVS Health','Mastercard',50991,29),(27,'CVS Health','Discover',44559,22),(28,'United Health','Discover',19946,13),(29,'CVS Health','VISA',63279,7),(30,'Anthem','VISA',34989,16);
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `DoctorID` int NOT NULL,
  `Specialty` varchar(255) NOT NULL,
  `StaffID` int NOT NULL,
  PRIMARY KEY (`DoctorID`),
  KEY `doctor_staffid_foreign` (`StaffID`),
  CONSTRAINT `doctor_staffid_foreign` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Pediatrics',10),(2,'Diagnostic radiology',30),(3,'Anesthesiology',27),(4,'Surgery',19),(5,'Surgery',9),(6,'Neurology',4),(7,'Pediatrics',25),(8,'Family medicine',7),(9,'Family medicine',20),(10,'Dermatology',6),(11,'Pediatrics',18),(12,'Anesthesiology',26),(13,'Dermatology',24),(14,'Surgery',2),(15,'Surgery',15),(16,'Anesthesiology',16),(17,'Diagnostic radiology',1),(18,'Neurology',11),(19,'Anesthesiology',12),(20,'Pediatrics',5),(21,'Surgery',8),(22,'Pediatrics',21),(23,'Diagnostic radiology',17),(24,'Surgery',29),(25,'Pediatrics',22),(26,'Family medicine',23),(27,'Surgery',3),(28,'Anesthesiology',13),(29,'Pediatrics',28),(30,'Neurology',14);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalequipment`
--

DROP TABLE IF EXISTS `medicalequipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalequipment` (
  `EquipmentID` int NOT NULL,
  `Type` varchar(255) NOT NULL,
  `StaffID` int NOT NULL,
  PRIMARY KEY (`EquipmentID`),
  KEY `medical_equipment_staffid_foreign` (`StaffID`),
  CONSTRAINT `medical_equipment_staffid_foreign` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalequipment`
--

LOCK TABLES `medicalequipment` WRITE;
/*!40000 ALTER TABLE `medicalequipment` DISABLE KEYS */;
INSERT INTO `medicalequipment` VALUES (1,'Oxygen Mask',32),(2,'Stethoscope',58),(3,'Blood Pressure Monitor',47),(4,'Blood Pressure Monitor',35),(5,'Ventilator',6),(6,'Blood Pressure Monitor',12),(7,'Reflex Hammer',55),(8,'Blood Pressure Monitor',5),(9,'Ventilator',4),(10,'Stethoscope',59),(11,'Reflex Hammer',7),(12,'Stethoscope',3),(13,'Blood Pressure Monitor',46),(14,'Ventilator',19),(15,'Oxygen Mask',48),(16,'Stethoscope',56),(17,'Oxygen Mask',25),(18,'Blood Pressure Monitor',22),(19,'Oxygen Mask',23),(20,'Oxygen Mask',10),(21,'Oxygen Mask',15),(22,'Ventilator',51),(23,'Stethoscope',40),(24,'Ventilator',60),(25,'Stethoscope',11),(26,'Oxygen Mask',39),(27,'Reflex Hammer',34),(28,'Reflex Hammer',31),(29,'Reflex Hammer',21),(30,'Blood Pressure Monitor',37);
/*!40000 ALTER TABLE `medicalequipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalrecords`
--

DROP TABLE IF EXISTS `medicalrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalrecords` (
  `RecordID` int NOT NULL,
  `Date` varchar(255) NOT NULL,
  `Diagnosis` varchar(255) NOT NULL,
  `Treatment` varchar(255) NOT NULL,
  `PatientID` int NOT NULL,
  `DoctorID` int NOT NULL,
  PRIMARY KEY (`RecordID`),
  KEY `medicalrecords_patientid_foreign` (`PatientID`),
  KEY `medicalrecords_doctorid_foreign` (`DoctorID`),
  CONSTRAINT `medicalrecords_doctorid_foreign` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`),
  CONSTRAINT `medicalrecords_patientid_foreign` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalrecords`
--

LOCK TABLES `medicalrecords` WRITE;
/*!40000 ALTER TABLE `medicalrecords` DISABLE KEYS */;
INSERT INTO `medicalrecords` VALUES (1,'2/25/2023','Diabetes','Insulin',1,9),(2,'4/5/2020','Diabetes','Insulin',2,19),(3,'11/18/2020','Pneumonia','Antibiotics',3,3),(4,'4/29/2022','Acute bronchitis','Fluids',4,14),(5,'3/25/2021','Pneumonia','Antibiotics',5,13),(6,'3/14/2022','Diabetes','Insulin',6,6),(7,'6/8/2019','Arrhythmia','Bypass',7,13),(8,'3/11/2023','Chronic kidney disease','Dialysis',8,15),(9,'6/28/2021','Acute bronchitis','Fluids',9,28),(10,'3/29/2022','Acute bronchitis','Fluids',10,16),(11,'5/9/2022','Acute bronchitis','Fluids',11,8),(12,'8/24/2022','Diabetes','Insulin',12,10),(13,'3/28/2020','Arthritis','Acupuncture',13,6),(14,'8/6/2019','Pneumonia','Antibiotics',14,18),(15,'7/28/2019','Arrhythmia','Bypass',15,15),(16,'10/14/2021','Diabetes','Insulin',16,27),(17,'8/17/2020','Arthritis','Acupuncture',17,6),(18,'7/24/2020','Esophageal reflux','Nexium',18,2),(19,'6/23/2019','Arthritis','Acupuncture',19,17),(20,'8/29/2020','Diabetes','Insulin',20,3),(21,'1/15/2022','Pneumonia','Antibiotics',21,12),(22,'3/16/2022','Chronic kidney disease','Dialysis',22,8),(23,'10/10/2021','Acute bronchitis','Fluids',23,5),(24,'7/20/2019','Pneumonia','Antibiotics',24,10),(25,'12/13/2019','Chronic kidney disease','Dialysis',25,26),(26,'1/19/2022','Pneumonia','Antibiotics',26,11),(27,'11/1/2020','Pneumonia','Antibiotics',27,15),(28,'9/23/2022','Pneumonia','Antibiotics',28,30),(29,'7/24/2021','Diabetes','Insulin',29,28),(30,'3/12/2023','Arthritis','Acupuncture',30,16),(31,'8/7/2019','Diabetes','GLP',1,9),(32,'3/27/2019','Diabetes','GLP',2,19),(33,'7/15/2021','Pneumonia','IV',3,3),(34,'3/1/2022','Acute bronchitis','Pain-Relievers',4,14),(35,'5/27/2022','Pneumonia','IV',5,13),(36,'12/31/2022','Diabetes','GLP',6,6),(37,'8/19/2020','Arrhythmia','ICD',7,13),(38,'6/18/2021','Chronic kidney disease','Protein-Diet',8,15),(39,'11/21/2020','Acute bronchitis','Pain-Relievers',9,28),(40,'12/2/2020','Acute bronchitis','Pain-Relievers',10,16),(41,'2/21/2020','Acute bronchitis','Pain-Relievers',11,8),(42,'11/11/2019','Diabetes','GLP',12,10),(43,'8/19/2022','Arthritis','TENS',13,6),(44,'8/25/2022','Pneumonia','IV',14,18),(45,'11/19/2022','Arrhythmia','ICD',15,15);
/*!40000 ALTER TABLE `medicalrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `NurseID` int NOT NULL,
  `Registered` varchar(255) NOT NULL,
  `StaffID` int NOT NULL,
  PRIMARY KEY (`NurseID`),
  KEY `nurse_staffid_foreign` (`StaffID`),
  CONSTRAINT `nurse_staffid_foreign` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (1,'Yes',47),(2,'Yes',48),(3,'Yes',49),(4,'Yes',54),(5,'Yes',41),(6,'Yes',40),(7,'Yes',55),(8,'Yes',46),(9,'Yes',37),(10,'Yes',34),(11,'Yes',31),(12,'Yes',36),(13,'Yes',59),(14,'Yes',44),(15,'Yes',51),(16,'Yes',57),(17,'Yes',52),(18,'Yes',58),(19,'Yes',45),(20,'Yes',32),(21,'Yes',33),(22,'Yes',43),(23,'Yes',35),(24,'Yes',38),(25,'Yes',42),(26,'Yes',60),(27,'Yes',56),(28,'Yes',50),(29,'Yes',39),(30,'Yes',53);
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `PatientID` int NOT NULL,
  `PatientName` varchar(255) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `PhoneNumber` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Diagnosis` varchar(255) NOT NULL,
  `DoctorID` int NOT NULL,
  `NurseID` int NOT NULL,
  `RoomNumber` int NOT NULL,
  PRIMARY KEY (`PatientID`),
  KEY `patient_roomnumber_foreign` (`RoomNumber`),
  KEY `patient_nurseid_foreign` (`NurseID`),
  KEY `patient_doctorid_foreign` (`DoctorID`),
  CONSTRAINT `patient_doctorid_foreign` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`),
  CONSTRAINT `patient_nurseid_foreign` FOREIGN KEY (`NurseID`) REFERENCES `nurse` (`NurseID`),
  CONSTRAINT `patient_roomnumber_foreign` FOREIGN KEY (`RoomNumber`) REFERENCES `room` (`RoomNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Aurelio Eads','F','505-720-4553','58007 Larson Trail','Diabetes',9,25,120),(2,'Demari Bone','M','505-686-8665','60779 Kreiger Center','Diabetes',19,26,109),(3,'Jordyn Saylor','F','505-663-8749','967 Vena Creek','Pneumonia',3,25,107),(4,'Ron Ousley','M','505-412-2488','44493 Jayde Lights','Acute bronchitis',14,4,108),(5,'Dario Thayer','M','505-646-8893','084 Kuphal Hills','Pneumonia',13,29,103),(6,'Angela Logan','F','231-863-6997','04554 Emilio Centers','Diabetes',6,4,128),(7,'Ray Sheridan','M','505-397-9758','217 Hayes Shores','Arrhythmia',13,5,105),(8,'Brylynn Cipriano','M','412-918-9943','634 Ward Dale','Chronic kidney disease',15,25,122),(9,'Tydus Beggs','M','208-819-3051','778 Miller Cove','Acute bronchitis',28,22,127),(10,'Kato Benfield','F','304-201-3591','80641 Rath Key','Acute bronchitis',16,12,113),(11,'Ila Rowell','F','505-646-6429','5665 Schoen Land','Acute bronchitis',8,27,124),(12,'Jael Dewey','F','319-449-3082','697 Mustafa Street','Diabetes',10,7,128),(13,'Jaylie Hafner','F','425-472-1813','217 Judah Burg','Arthritis',6,17,127),(14,'Eiden Roney','M','505-676-7356','3936 Ledner Well','Pneumonia',18,14,119),(15,'Lincoln Barnes','F','505-544-1357','3404 Dibbert Station','Arrhythmia',15,9,118),(16,'Hiram Apodaca','M','424-687-6998','3356 Ledner Field','Diabetes',27,19,107),(17,'Jamia Donley','F','225-814-5977','828 Tremblay Ford','Arthritis',6,25,120),(18,'Eugenio Tung','F','505-646-2994','53948 Pearl Island','Esophageal reflux',2,23,127),(19,'Lilith Oneil','F','213-732-8732','2290 Smitham Brooks','Arthritis',17,10,107),(20,'Karli Roark','M','505-280-1413','9101 Kristin Walks','Diabetes',3,13,101),(21,'Vianey Whited','F','315-524-2737','35439 Balistreri Curve','Pneumonia',12,5,113),(22,'Kierstyn Mach','M','505-646-4645','6342 Eudora Forges','Chronic kidney disease',8,8,103),(23,'Rylee Braswell','M','217-707-6182','77152 Elwyn Island','Acute bronchitis',5,12,104),(24,'Dalylah Dulin','F','505-415-1004','95346 Nicholaus Lights','Pneumonia',10,22,101),(25,'Sundus Blakey','F','505-646-4830','04767 Hilbert Valley','Chronic kidney disease',26,9,112),(26,'Rosa Pike','M','312-821-2602','9926 Julianne Well','Pneumonia',11,30,104),(27,'Shelly Noah','F','505-380-5648','749 Briana Harbors','Pneumonia',15,24,104),(28,'Selvin Tomas','F','404-969-8719','2395 Dickens Forks','Pneumonia',30,4,102),(29,'Leevi Rigney','M','505-644-3913','42684 Silas Divide','Diabetes',28,26,112),(30,'Rommel Stoops','M','216-240-7091','8060 Braxton Knoll','Arthritis',16,15,125);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `RoomNumber` int NOT NULL,
  `RoomType` varchar(255) NOT NULL,
  `HospitalSection` varchar(255) NOT NULL,
  PRIMARY KEY (`RoomNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (101,'Medical-Surgical','Burn Unit'),(102,'Behavioral/Mental Health','Urgent Care'),(103,'Intensive Care Unit','Urgent Care'),(104,'Maternity Care','Urgent Care'),(105,'Maternity Care','Urgent Care'),(106,'Intensive Care Unit','Intensive Care Unit'),(107,'Behavioral/Mental Health','Urgent Care'),(108,'Maternity Care','Neurology'),(109,'Medical-Surgical','Intensive Care Unit'),(110,'Behavioral/Mental Health','Neurology'),(111,'Behavioral/Mental Health','Burn Unit'),(112,'Medical-Surgical','Trauma Center'),(113,'Medical-Surgical','Neurology'),(114,'Maternity Care','Burn Unit'),(115,'Behavioral/Mental Health','Trauma Center'),(116,'Medical-Surgical','Urgent Care'),(117,'Behavioral/Mental Health','Burn Unit'),(118,'Intensive Care Unit','Urgent Care'),(119,'Intensive Care Unit','Trauma Center'),(120,'Intensive Care Unit','Trauma Center'),(121,'Behavioral/Mental Health','Intensive Care Unit'),(122,'Intensive Care Unit','Burn Unit'),(123,'Medical-Surgical','Neurology'),(124,'Intensive Care Unit','Burn Unit'),(125,'Behavioral/Mental Health','Urgent Care'),(126,'Behavioral/Mental Health','Neurology'),(127,'Maternity Care','Neurology'),(128,'Medical-Surgical','Intensive Care Unit'),(129,'Intensive Care Unit','Urgent Care'),(130,'Medical-Surgical','Urgent Care');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL,
  `StaffName` varchar(255) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `PhoneNumber` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Yosef Bui','M','609-722-3878','596 Bernie Summit'),(2,'Zola Menard','M','228-510-2614','0764 Willms Cape'),(3,'Beatriz Majors','M','505-987-1887','625 Jacklyn Overpass'),(4,'Avalyn Caudill','F','412-482-6026','367 Ullrich Square'),(5,'Rocio Noyes','F','320-802-5754','70823 Adonis Plaza'),(6,'Jamarion Hauser','F','303-773-6187','5462 Murazik Village'),(7,'Camrynn Latour','F','505-870-1988','1236 Bill Bridge'),(8,'Orianna Monteiro','F','505-724-8765','420 Mueller Causeway'),(9,'Dariyah Nieman','M','505-644-2660','6443 Dickens Village'),(10,'Quran Cortese','M','505-644-3104','16953 Don Row'),(11,'Jaretzy Chee','M','505-631-8414','3112 Huels Track'),(12,'Raina Samuel','M','208-557-2507','481 Elvie Glens'),(13,'Ranya Pickle','F','323-734-0438','523 Waelchi Village'),(14,'Drea Steelman','M','313-414-4008','55802 Vandervort Parkways'),(15,'Rosalie Roberson','M','206-761-6785','578 Brekke Valley'),(16,'Tailyn Brodeur','F','505-646-1262','89734 Della Loop'),(17,'Hershel Flournoy','M','505-311-9879','4124 Stewart Station'),(18,'Amara Maddox','F','505-677-0741','515 Adelbert Junctions'),(19,'Kalleigh Sandstrom','F','216-387-9050','06348 Dandre Plaza'),(20,'Veda Layton','M','505-256-8880','5401 Farrell Mountain'),(21,'James Futch','F','307-796-3658','28882 Rosella Alley'),(22,'Jaymee Tatro','F','219-948-1714','87285 Austin Plain'),(23,'Geoffrey Treadway','F','505-507-4843','374 Rodrigo Burg'),(24,'Charlea Peguero','M','505-805-4426','49920 Parisian Spur'),(25,'Muhammed Scully','M','206-540-9728','447 Elisabeth Junctions'),(26,'Dana Aragon','F','332-238-3899','28058 Murl Station'),(27,'Caley Polak','M','215-788-2513','10743 Lesly Flat'),(28,'Adonias Kleinman','F','508-542-2439','115 Dashawn Rue'),(29,'Lleyton Arms','M','334-998-1363','3363 Mills Terrace'),(30,'Nadya Hailey','M','505-218-4535','89853 Major Club'),(31,'Maybree Ginsburg','F','406-380-6988','0104 Muller Meadows'),(32,'Aurora Spencer','M','313-762-5271','66631 Lia Squares'),(33,'Medina Tart','M','505-359-7944','655 Brayan Harbor'),(34,'Mykenzie Wines','F','332-266-2264','43280 Beau Parkways'),(35,'Kacee Blas','F','314-681-3937','290 Stracke Center'),(36,'Zayn Thomson','M','302-586-1246','165 Heaven Forge'),(37,'Kyleigh Mccall','M','505-818-5799','4999 Ruby Cliffs'),(38,'Cailynn Mitchel','F','213-642-8404','453 Howell Court'),(39,'Caine Santacruz','F','505-425-7757','892 Predovic Prairie'),(40,'Zenobia Deaver','M','380-934-3691','259 Kling Branch'),(41,'Audri Blood','F','215-908-3454','9767 Trystan Harbor'),(42,'Elise Moss','F','239-658-9433','3050 Eryn Orchard'),(43,'Rexton Sherwin','M','229-433-6580','7196 Manuela Terrace'),(44,'Reena Glidewell','M','213-240-0317','6009 Brooklyn Center'),(45,'Banyan Utterback','M','505-668-1502','64488 Mayer Plaza'),(46,'Mairead Dry','M','505-586-3108','48182 Gerald Valley'),(47,'Sheldon Mcadams','M','248-517-8661','3139 Elinore Falls'),(48,'Remi Ewing','F','505-877-5491','305 Nyasia Stream'),(49,'Ellison Roland','M','640-279-1169','026 John Islands'),(50,'Tien Misner','F','307-257-6034','95468 Caroline Place'),(51,'Owen Torres','M','505-646-5408','623 Antwon Courts'),(52,'Matthias Hilton','F','505-644-3847','4882 Orn Inlet'),(53,'Greer Moise','F','904-324-7992','2630 Cole Corner'),(54,'Linken Melgoza','M','505-646-0050','949 Kub Highway'),(55,'Jamire Mauricio','F','505-644-2828','426 Herman Square'),(56,'Cosmo Wiggs','F','505-644-8631','5395 Schiller Junctions'),(57,'Gianluca Jeffery','F','206-282-0983','07677 Rowland Port'),(58,'Shrey Frederickson','M','505-644-5839','922 Tomas Island'),(59,'Meredith Belcher','F','216-231-5874','9674 Pfannerstill Mountains'),(60,'Roan Saxton','F','505-723-3596','271 Kessler Port');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitors` (
  `VisitorID` int NOT NULL,
  `Date` varchar(255) NOT NULL,
  `RelationshipToPatient` varchar(255) NOT NULL,
  `PatientID` int NOT NULL,
  PRIMARY KEY (`VisitorID`),
  KEY `visitors_patientid_foreign` (`PatientID`),
  CONSTRAINT `visitors_patientid_foreign` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (1,'12-25-2019','Son',29),(2,'8-14-2019','Father',4),(3,'2-26-2021','Cousin',8),(4,'4-7-2019','Son',26),(5,'4-27-2023','Father',9),(6,'5-18-2021','Friend',15),(7,'4-26-2019','Son',17),(8,'4-28-2022','Cousin',11),(9,'11-15-2022','Friend',27),(10,'9-25-2019','Grandfather',23),(11,'10-6-2023','Grandmother',30),(12,'7-30-2023','Son',24),(13,'1-9-2019','Grandfather',10),(14,'1-21-2023','Son',1),(15,'2-28-2021','Daughter',21),(16,'5-17-2020','Daughter',13),(17,'8-18-2022','Daughter',28),(18,'11-4-2019','Father',18),(19,'12-30-2020','Friend',25),(20,'8-29-2019','Mother',20),(21,'2-4-2020','Cousin',7),(22,'7-20-2021','Mother',12),(23,'11-26-2019','Friend',16),(24,'4-15-2020','Grandfather',5),(25,'1-22-2021','Grandfather',2),(26,'9-5-2019','Mother',14),(27,'1-24-2019','Father',3),(28,'2-30-2023','Friend',19),(29,'7-28-2021','Friend',6),(30,'1-15-2019','Daughter',22);
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-22 12:57:09
