CREATE DATABASE  IF NOT EXISTS `crownfield_eye_hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `crownfield_eye_hospital`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: crownfield_eye_hospital
-- ------------------------------------------------------
-- Server version	8.0.46

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
  `AppointmentID` int NOT NULL AUTO_INCREMENT,
  `PatientID` varchar(10) NOT NULL,
  `ClinicianID` int NOT NULL,
  `ClinicID` int NOT NULL,
  `AppointmentDate` date NOT NULL,
  `AppointmentTime` time NOT NULL,
  `Notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`),
  UNIQUE KEY `uq_clinician_slot` (`ClinicianID`,`AppointmentDate`,`AppointmentTime`),
  KEY `fk_appointment_patient` (`PatientID`),
  KEY `fk_appointment_clinic` (`ClinicID`),
  CONSTRAINT `fk_appointment_clinic` FOREIGN KEY (`ClinicID`) REFERENCES `clinic` (`ClinicID`),
  CONSTRAINT `fk_appointment_clinician` FOREIGN KEY (`ClinicianID`) REFERENCES `clinician` (`ClinicianID`),
  CONSTRAINT `fk_appointment_patient` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`),
  CONSTRAINT `chk_appointment_date` CHECK ((`AppointmentDate` >= _utf8mb4'2020-01-01'))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'OP001',1,1,'2026-10-05','09:00:00','Review intraocular pressure'),(2,'OP002',2,1,'2026-10-05','09:30:00','OCT before review'),(3,'OP003',1,1,'2026-10-06','11:00:00','Monitor glaucoma suspect'),(4,'OP004',3,3,'2026-10-07','14:00:00','Corneal topography'),(5,'OP005',4,2,'2026-10-08','10:00:00','Cataract assessment'),(6,'OP006',5,10,'2026-10-09','13:30:00','Paediatric eye assessment'),(7,'OP007',6,4,'2026-10-12','09:15:00','Eyelid review'),(8,'OP008',7,7,'2026-10-13','15:00:00','Visual symptoms review'),(9,'OP009',8,6,'2026-10-14','10:45:00','Inflammation follow-up'),(10,'OP010',9,5,'2026-10-15','11:30:00','Retinal review');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentdiagnosis`
--

DROP TABLE IF EXISTS `appointmentdiagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointmentdiagnosis` (
  `AppointmentID` int NOT NULL,
  `DiagnosisID` int NOT NULL,
  PRIMARY KEY (`AppointmentID`,`DiagnosisID`),
  KEY `fk_appdiag_diagnosis` (`DiagnosisID`),
  CONSTRAINT `fk_appdiag_appointment` FOREIGN KEY (`AppointmentID`) REFERENCES `appointment` (`AppointmentID`),
  CONSTRAINT `fk_appdiag_diagnosis` FOREIGN KEY (`DiagnosisID`) REFERENCES `diagnosis` (`DiagnosisID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentdiagnosis`
--

LOCK TABLES `appointmentdiagnosis` WRITE;
/*!40000 ALTER TABLE `appointmentdiagnosis` DISABLE KEYS */;
INSERT INTO `appointmentdiagnosis` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `appointmentdiagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic`
--

DROP TABLE IF EXISTS `clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic` (
  `ClinicID` int NOT NULL AUTO_INCREMENT,
  `ClinicName` varchar(100) NOT NULL,
  PRIMARY KEY (`ClinicID`),
  UNIQUE KEY `ClinicName` (`ClinicName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic`
--

LOCK TABLES `clinic` WRITE;
/*!40000 ALTER TABLE `clinic` DISABLE KEYS */;
INSERT INTO `clinic` VALUES (2,'Bedford'),(7,'Central Eye Unit'),(10,'Children\'s Eye Clinic'),(1,'City Road'),(3,'Croydon'),(9,'East Wing Clinic'),(4,'North Eye Clinic'),(6,'Riverside Clinic'),(5,'South Eye Clinic'),(8,'West Wing Clinic');
/*!40000 ALTER TABLE `clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinician`
--

DROP TABLE IF EXISTS `clinician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinician` (
  `ClinicianID` int NOT NULL AUTO_INCREMENT,
  `ClinicianName` varchar(100) NOT NULL,
  `SpecialtyID` int NOT NULL,
  PRIMARY KEY (`ClinicianID`),
  KEY `fk_clinician_specialty` (`SpecialtyID`),
  CONSTRAINT `fk_clinician_specialty` FOREIGN KEY (`SpecialtyID`) REFERENCES `specialty` (`SpecialtyID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinician`
--

LOCK TABLES `clinician` WRITE;
/*!40000 ALTER TABLE `clinician` DISABLE KEYS */;
INSERT INTO `clinician` VALUES (1,'Dr Maya Shah',1),(2,'Dr Leo Grant',2),(3,'Dr Priya Nair',3),(4,'Dr Adam Lewis',4),(5,'Dr Sara Ahmed',5),(6,'Dr James Cole',6),(7,'Dr Hannah Price',7),(8,'Dr Ravi Perera',8),(9,'Dr Emily Foster',9),(10,'Dr Daniel Brooks',10);
/*!40000 ALTER TABLE `clinician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `DiagnosisID` int NOT NULL AUTO_INCREMENT,
  `DiagnosisName` varchar(100) NOT NULL,
  PRIMARY KEY (`DiagnosisID`),
  UNIQUE KEY `DiagnosisName` (`DiagnosisName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (5,'Cataract'),(2,'Diabetic macular oedema'),(3,'Glaucoma suspect'),(4,'Keratoconus'),(1,'Ocular hypertension'),(8,'Optic neuritis'),(7,'Ptosis'),(6,'Refractive error'),(10,'Retinal disorder'),(9,'Uveitis');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followupplan`
--

DROP TABLE IF EXISTS `followupplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followupplan` (
  `FollowUpID` int NOT NULL AUTO_INCREMENT,
  `AppointmentID` int NOT NULL,
  `DueDate` date NOT NULL,
  `Priority` varchar(10) NOT NULL DEFAULT 'Routine',
  `Status` varchar(15) NOT NULL DEFAULT 'Planned',
  `Notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`FollowUpID`),
  UNIQUE KEY `AppointmentID` (`AppointmentID`),
  CONSTRAINT `fk_followup_appointment` FOREIGN KEY (`AppointmentID`) REFERENCES `appointment` (`AppointmentID`),
  CONSTRAINT `chk_followup_priority` CHECK ((`Priority` in (_utf8mb4'Routine',_utf8mb4'High',_utf8mb4'Urgent'))),
  CONSTRAINT `chk_followup_status` CHECK ((`Status` in (_utf8mb4'Planned',_utf8mb4'Booked',_utf8mb4'Completed',_utf8mb4'Cancelled')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followupplan`
--

LOCK TABLES `followupplan` WRITE;
/*!40000 ALTER TABLE `followupplan` DISABLE KEYS */;
INSERT INTO `followupplan` VALUES (1,1,'2026-11-16','High','Planned','Review intraocular pressure'),(2,2,'2026-11-02','Urgent','Booked','OCT before review'),(3,3,'2027-04-06','Routine','Planned','Visual field monitoring'),(4,4,'2026-12-02','Routine','Planned','Corneal topography review'),(5,5,'2026-11-08','Routine','Planned','Cataract assessment review'),(6,6,'2026-11-09','Routine','Planned','Review visual assessment'),(7,7,'2026-11-12','High','Booked','Review eyelid symptoms'),(8,8,'2026-11-13','Urgent','Planned','Review visual symptoms'),(9,9,'2026-11-14','Routine','Planned','Review inflammation'),(10,10,'2026-11-15','Routine','Planned','Retinal review');
/*!40000 ALTER TABLE `followupplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `MedicineID` int NOT NULL AUTO_INCREMENT,
  `MedicineName` varchar(100) NOT NULL,
  PRIMARY KEY (`MedicineID`),
  UNIQUE KEY `MedicineName` (`MedicineName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (3,'Aflibercept'),(8,'Artificial tears'),(10,'Brimonidine'),(6,'Cyclopentolate'),(9,'Dorzolamide'),(1,'Latanoprost'),(5,'Lubricating eye drops'),(7,'Prednisolone eye drops'),(4,'Sodium chloride drops'),(2,'Timolol');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `PatientID` varchar(10) NOT NULL,
  `FirstName` varchar(60) NOT NULL,
  `LastName` varchar(60) NOT NULL,
  `Postcode` varchar(10) NOT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('OP001','Amina','Yusuf','NE1 4AB'),('OP002','Daniel','Reed','N16 7QP'),('OP003','Sofia','Bennett','E8 2LD'),('OP004','Michael','Okoro','SE6 3RT'),('OP005','Grace','Morgan','LS1 2AB'),('OP006','Ethan','Clarke','M1 4DX'),('OP007','Priya','Fernando','B1 1AA'),('OP008','Noah','Williams','BS1 5TY'),('OP009','Maya','Patel','L1 8JQ'),('OP010','Oliver','James','CF10 1EP');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `PrescriptionID` int NOT NULL AUTO_INCREMENT,
  `AppointmentID` int NOT NULL,
  `PrescriptionDate` date NOT NULL,
  PRIMARY KEY (`PrescriptionID`),
  KEY `fk_prescription_appointment` (`AppointmentID`),
  CONSTRAINT `fk_prescription_appointment` FOREIGN KEY (`AppointmentID`) REFERENCES `appointment` (`AppointmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,1,'2026-10-05'),(2,2,'2026-10-05'),(3,3,'2026-10-06'),(4,4,'2026-10-07'),(5,5,'2026-10-08'),(6,6,'2026-10-09'),(7,7,'2026-10-12'),(8,8,'2026-10-13'),(9,9,'2026-10-14'),(10,10,'2026-10-15');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptionitem`
--

DROP TABLE IF EXISTS `prescriptionitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptionitem` (
  `PrescriptionItemID` int NOT NULL AUTO_INCREMENT,
  `PrescriptionID` int NOT NULL,
  `MedicineID` int NOT NULL,
  `Dose` varchar(100) NOT NULL,
  `Route` varchar(50) NOT NULL,
  `Frequency` varchar(100) NOT NULL,
  `Duration` varchar(100) NOT NULL,
  PRIMARY KEY (`PrescriptionItemID`),
  UNIQUE KEY `uq_prescription_medicine` (`PrescriptionID`,`MedicineID`),
  KEY `fk_item_medicine` (`MedicineID`),
  CONSTRAINT `fk_item_medicine` FOREIGN KEY (`MedicineID`) REFERENCES `medicine` (`MedicineID`),
  CONSTRAINT `fk_item_prescription` FOREIGN KEY (`PrescriptionID`) REFERENCES `prescription` (`PrescriptionID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptionitem`
--

LOCK TABLES `prescriptionitem` WRITE;
/*!40000 ALTER TABLE `prescriptionitem` DISABLE KEYS */;
INSERT INTO `prescriptionitem` VALUES (1,1,1,'1 drop','Ophthalmic','Once daily','As directed'),(2,1,2,'1 drop','Ophthalmic','Twice daily','As directed'),(3,2,3,'As prescribed','Intravitreal','As scheduled','Specialist-directed'),(4,3,9,'1 drop','Ophthalmic','Twice daily','As directed'),(5,4,4,'1 drop','Ophthalmic','As needed','As directed'),(6,5,5,'1 drop','Ophthalmic','As needed','As directed'),(7,6,6,'As prescribed','Ophthalmic','As directed','Short course'),(8,7,8,'1 drop','Ophthalmic','As needed','As directed'),(9,8,10,'1 drop','Ophthalmic','Twice daily','As directed'),(10,9,7,'As prescribed','Ophthalmic','As directed','Specialist-directed');
/*!40000 ALTER TABLE `prescriptionitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialty`
--

DROP TABLE IF EXISTS `specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialty` (
  `SpecialtyID` int NOT NULL AUTO_INCREMENT,
  `SpecialtyName` varchar(60) NOT NULL,
  PRIMARY KEY (`SpecialtyID`),
  UNIQUE KEY `SpecialtyName` (`SpecialtyName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty`
--

LOCK TABLES `specialty` WRITE;
/*!40000 ALTER TABLE `specialty` DISABLE KEYS */;
INSERT INTO `specialty` VALUES (4,'Cataract'),(3,'Cornea'),(10,'General Ophthalmology'),(1,'Glaucoma'),(9,'Medical Retina'),(7,'Neuro-ophthalmology'),(6,'Oculoplastics'),(5,'Paediatric Ophthalmology'),(2,'Retina'),(8,'Uveitis');
/*!40000 ALTER TABLE `specialty` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-07  2:16:04
