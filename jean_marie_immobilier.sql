-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: immobilier
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `agence`
--

DROP TABLE IF EXISTS `agence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agence` (
  `idagence` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idagence`),
  UNIQUE KEY `adresse` (`adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agence`
--

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
INSERT INTO `agence` VALUES (000001,'logic-immo','www.logic-immo.com'),(000002,'century21','rue century'),(000003,'laforet','rue laforet'),(000004,'fnaim','rue fnaim'),(000005,'orpi','rue orpi'),(000006,'foncia','rue foncia'),(000007,'guy-hoquet','rue guy-hoquet'),(000008,'seloger','www.seloger.com'),(000009,'bouygues immobilier','www.bouygues-immobilier.net');
/*!40000 ALTER TABLE `agence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demande`
--

DROP TABLE IF EXISTS `demande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demande` (
  `idDemande` int NOT NULL AUTO_INCREMENT,
  `idpersonne_d` int NOT NULL,
  `types` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `budget` int DEFAULT NULL,
  `superficie` int DEFAULT NULL,
  `catégorie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idDemande`),
  KEY `fk_idpersonne_d` (`idpersonne_d`),
  CONSTRAINT `fk_idpersonne_d` FOREIGN KEY (`idpersonne_d`) REFERENCES `personne` (`idpersonne`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demande`
--

LOCK TABLES `demande` WRITE;
/*!40000 ALTER TABLE `demande` DISABLE KEYS */;
INSERT INTO `demande` VALUES (43,1,'appartement','paris',530000,120,'vente'),(44,3,'appartement','bordeaux',120000,18,'vente'),(45,4,'appartement','bordeaux',145000,21,'vente'),(46,5,'appartement','bordeaux',152000,26,'vente'),(47,6,'appartement','lyon',200000,55,'vente'),(48,9,'appartement','paris',171000,40,'vente'),(49,13,'appartement','paris',163000,25,'vente'),(50,16,'appartement','paris',132000,15,'vente'),(51,19,'appartement','paris',350000,80,'vente'),(52,22,'appartement','lyon',600,20,'location'),(53,25,'appartement','lyon',188000,65,'vente'),(54,27,'appartement','paris',400,15,'location'),(55,28,'appartement','paris',330500,100,'vente'),(56,31,'appartement','paris',90000,15,'vente'),(57,32,'appartement','lyon',123800,21,'vente'),(58,35,'appartement','lyon',1200,70,'vente'),(59,37,'appartement','lyon',1500,100,'vente'),(60,43,'appartement','paris',600,20,'location'),(61,44,'appartement','paris',750,30,'location'),(62,45,'appartement','bordeaux',680,30,'location'),(63,46,'appartement','bordeaux',213000,40,'vente');
/*!40000 ALTER TABLE `demande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logement`
--

DROP TABLE IF EXISTS `logement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logement` (
  `idlogement` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `prix` int DEFAULT NULL,
  `superficie` int DEFAULT NULL,
  `catégorie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idlogement`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logement`
--

LOCK TABLES `logement` WRITE;
/*!40000 ALTER TABLE `logement` DISABLE KEYS */;
INSERT INTO `logement` VALUES (000001,'appartement','paris',185000,61,'vente'),(000002,'appartement','paris',115000,15,'vente'),(000003,'maison','paris',510000,130,'vente'),(000004,'appartement','bordeaux',550,17,'location'),(000005,'appartement','lyon',420,14,'location'),(000006,'appartement','paris',16000,40,'vente'),(000007,'appartement','paris',670,35,'location'),(000008,'appartement','lyon',110000,16,'vente'),(000009,'appartement','bordeaux',161500,33,'vente'),(000010,'appartement','paris',202000,90,'vente');
/*!40000 ALTER TABLE `logement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logement_agence`
--

DROP TABLE IF EXISTS `logement_agence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logement_agence` (
  `idlogementAgence` int NOT NULL AUTO_INCREMENT,
  `idAgence` int(6) unsigned zerofill NOT NULL,
  `idlogement` int(6) unsigned zerofill NOT NULL,
  `frais` int DEFAULT NULL,
  PRIMARY KEY (`idlogementAgence`),
  KEY `fk_idagence` (`idAgence`),
  KEY `fk_idlogement` (`idlogement`),
  CONSTRAINT `fk_idagence` FOREIGN KEY (`idAgence`) REFERENCES `agence` (`idagence`),
  CONSTRAINT `fk_idlogement` FOREIGN KEY (`idlogement`) REFERENCES `logement` (`idlogement`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logement_agence`
--

LOCK TABLES `logement_agence` WRITE;
/*!40000 ALTER TABLE `logement_agence` DISABLE KEYS */;
INSERT INTO `logement_agence` VALUES (1,000001,000002,15000),(2,000005,000003,730),(3,000008,000004,900),(4,000008,000005,1200);
/*!40000 ALTER TABLE `logement_agence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logement_personne`
--

DROP TABLE IF EXISTS `logement_personne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logement_personne` (
  `idLogementPersonne` int NOT NULL AUTO_INCREMENT,
  `idpersonne` int NOT NULL,
  `idlogement_p` int(6) unsigned zerofill NOT NULL,
  PRIMARY KEY (`idLogementPersonne`),
  KEY `fk_idpersonne` (`idpersonne`),
  KEY `fk_idlogement_p` (`idlogement_p`),
  CONSTRAINT `fk_idlogement_p` FOREIGN KEY (`idlogement_p`) REFERENCES `logement` (`idlogement`),
  CONSTRAINT `fk_idpersonne` FOREIGN KEY (`idpersonne`) REFERENCES `personne` (`idpersonne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logement_personne`
--

LOCK TABLES `logement_personne` WRITE;
/*!40000 ALTER TABLE `logement_personne` DISABLE KEYS */;
/*!40000 ALTER TABLE `logement_personne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personne`
--

DROP TABLE IF EXISTS `personne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personne` (
  `idpersonne` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idpersonne`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personne`
--

LOCK TABLES `personne` WRITE;
/*!40000 ALTER TABLE `personne` DISABLE KEYS */;
INSERT INTO `personne` VALUES (1,'Naomi Knox','Dieter Silva','dolor.elit.pellentesque@yahoo.com'),(3,'Cailin Smith','Chadwick Gentry','neque.pellentesque@google.org'),(4,'Velma Patton','Nathan Jackson','ipsum.ac.mi@aol.net'),(5,'Gray Stein','hugo','mattis.integer@google.edu'),(6,'Steel Wright','MacKenzie Sawyer','scelerisque.neque.sed@hotmail.org'),(9,'Octavius Holt','Cairo Summers','orci.lobortis@hotmail.ca'),(13,'James George','Sara Price','lectus.ante.dictum@aol.net'),(16,'Peter Rollins','Yoshi Bryant','quis@yahoo.couk'),(19,'Jolene Beck','Haley Rogers','sit@protonmail.edu'),(22,'Farrah Santana','Josephine Larson','dignissim.magna@icloud.couk'),(25,'Giacomo Mullen','Abraham Carney','amet.dapibus.id@aol.com'),(27,'Larissa Hahn','Chandler Buckley','pharetra@aol.couk'),(28,'Sophia Bonner','Miriam Hood','diam.sed.diam@yahoo.org'),(31,'Kalia Schultz','Giacomo Harrison','est@yahoo.org'),(32,'Adara Gonzalez','Chancellor Collins','auctor.mauris@aol.edu'),(35,'Meredith Short','Aphrodite Burns','vel.venenatis.vel@outlook.couk'),(37,'Wylie Combs','Hammett Miles','ac@icloud.edu'),(43,'Elaine Barnett','Kirsten Wiggins','nec.luctus@google.edu'),(44,'Briar Wells','Herrod Harvey','sit.amet.risus@icloud.net'),(45,'Colby Nieves','Amity Owen','faucibus.orci@hotmail.com'),(46,'Driscoll Whitehead','Cora Bridges','aenean@google.net');
/*!40000 ALTER TABLE `personne` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-16 16:46:02
