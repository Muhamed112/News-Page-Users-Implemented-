-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbnovosti_31_37
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin'),(5,'admin2','admin2');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komentari`
--

DROP TABLE IF EXISTS `komentari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `komentari` (
  `komentar_id` int NOT NULL AUTO_INCREMENT,
  `novost_id` int NOT NULL,
  `user_id` int NOT NULL,
  `komentar` varchar(1000) NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`komentar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komentari`
--

LOCK TABLES `komentari` WRITE;
/*!40000 ALTER TABLE `komentari` DISABLE KEYS */;
INSERT INTO `komentari` VALUES (104,30,32,'Ovo je moj prvi komentar!','jahija505'),(105,30,32,'A ovo je moj drugi komentar','jahija505'),(106,31,32,'Volim rizat vene noktaricom','jahija505'),(107,30,33,'Evo i moj komentar','MuhaG'),(109,31,33,'?','MuhaG'),(110,30,34,'Glasajte za mene','nezke'),(111,30,34,'Bolji sam od fude','nezke'),(112,31,34,'glasaj za mene i neces imat taj problem','nezke'),(116,31,32,'necu','jahija505'),(117,35,34,'obrisi i mene','nezke'),(118,35,34,'a obrisi i novost','nezke');
/*!40000 ALTER TABLE `komentari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `novosti`
--

DROP TABLE IF EXISTS `novosti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `novosti` (
  `novosti_id` int NOT NULL AUTO_INCREMENT,
  `naslov` varchar(255) NOT NULL,
  `novost_sazetak` varchar(1000) NOT NULL,
  `novosti_opis` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `datum` varchar(45) NOT NULL,
  `urednik_id` int NOT NULL,
  PRIMARY KEY (`novosti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `novosti`
--

LOCK TABLES `novosti` WRITE;
/*!40000 ALTER TABLE `novosti` DISABLE KEYS */;
INSERT INTO `novosti` VALUES (30,'Lorem Ipsum lacinia sit amet','Duis felis felis, lacinia sit amet laoreet nec, faucibus vitae ex. Cras euismod interdum orci, a faucibus magna semper sed. Ut non erat sed nibh rutrum suscipit non vitae eros. Sed pulvinar velit lorem, non bibendum enim eleifend a. Mauris suscipit egestas varius. Vivamus id enim nec nisl semper finibus. Pellentesque mollis nunc non magna accumsan, non imperdiet ex sagittis.','Duis felis felis, lacinia sit amet laoreet nec, faucibus vitae ex. Cras euismod interdum orci, a faucibus magna semper sed. Ut non erat sed nibh rutrum suscipit non vitae eros. Sed pulvinar velit lorem, non bibendum enim eleifend a. Mauris suscipit egestas varius. Vivamus id enim nec nisl semper finibus. Pellentesque mollis nunc non magna accumsan, non imperdiet ex sagittis. Vestibulum non porta magna. Cras porta purus a magna blandit, cursus consectetur diam feugiat. Etiam congue enim nec augue aliquet vestibulum. Nullam at luctus metus, at pharetra velit. Vivamus vel dolor vitae sapien volutpat aliquam. Aliquam erat volutpat. Etiam hendrerit, massa ut suscipit tincidunt, quam ante dignissim est, quis consequat libero lectus quis justo. Proin eget scelerisque nibh. Pellentesque vel elit nibh. Phasellus aliquam odio nibh, eu mollis metus lacinia in. Proin felis ex, tincidunt vestibulum bibendum vel, congue ut nibh. Duis sed tortor et massa sollicitudin sodales. Vestibulum enim mi, hendrerit sit amet tempor malesuada, aliquet quis mauris. Nam quis odio at sem elementum consectetur. Aenean dolor eros, varius quis iaculis sed, interdum at lorem. Pellentesque volutpat risus nisl, non accumsan metus sagittis vitae. Ut consectetur aliquam egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus.',NULL,'2020-12-14',13),(31,'Lorem Ipsum','Duis felis felis, lacinia sit amet laoreet nec, faucibus vitae ex. Cras euismod interdum orci, a faucibus magna semper sed. Ut non erat sed nibh rutrum suscipit non vitae eros. Sed pulvinar velit lorem, non bibendum enim eleifend a. Mauris suscipit egestas varius. Vivamus id enim nec nisl semper finibus. Pellentesque mollis nunc non magna accumsan, non imperdiet ex sagittis.','Duis felis felis, lacinia sit amet laoreet nec, faucibus vitae ex. Cras euismod interdum orci, a faucibus magna semper sed. Ut non erat sed nibh rutrum suscipit non vitae eros. Sed pulvinar velit lorem, non bibendum enim eleifend a. Mauris suscipit egestas varius. Vivamus id enim nec nisl semper finibus. Pellentesque mollis nunc non magna accumsan, non imperdiet ex sagittis. Vestibulum non porta magna. Cras porta purus a magna blandit, cursus consectetur diam feugiat. Etiam congue enim nec augue aliquet vestibulum. Nullam at luctus metus, at pharetra velit. Vivamus vel dolor vitae sapien volutpat aliquam. Aliquam erat volutpat. Etiam hendrerit, massa ut suscipit tincidunt, quam ante dignissim est, quis consequat libero lectus quis justo. Proin eget scelerisque nibh. Pellentesque vel elit nibh. Phasellus aliquam odio nibh, eu mollis metus lacinia in. Proin felis ex, tincidunt vestibulum bibendum vel, congue ut nibh. Duis sed tortor et massa sollicitudin sodales. Vestibulum enim mi, hendrerit sit amet tempor malesuada, aliquet quis mauris. Nam quis odio at sem elementum consectetur. Aenean dolor eros, varius quis iaculis sed, interdum at lorem. Pellentesque volutpat risus nisl, non accumsan metus sagittis vitae. Ut consectetur aliquam egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus.',NULL,'2020-12-14',13),(32,'Ipsum Lorem ?','Duis felis felis, lacinia sit amet laoreet nec, faucibus vitae ex. Cras euismod interdum orci, a faucibus magna semper sed. Ut non erat sed nibh rutrum suscipit non vitae eros. Sed pulvinar velit lorem, non bibendum enim eleifend a. Mauris suscipit egestas varius. Vivamus id enim nec nisl semper finibus. Pellentesque mollis nunc non magna accumsan, non imperdiet ex sagittis. ','Duis felis felis, lacinia sit amet laoreet nec, faucibus vitae ex. Cras euismod interdum orci, a faucibus magna semper sed. Ut non erat sed nibh rutrum suscipit non vitae eros. Sed pulvinar velit lorem, non bibendum enim eleifend a. Mauris suscipit egestas varius. Vivamus id enim nec nisl semper finibus. Pellentesque mollis nunc non magna accumsan, non imperdiet ex sagittis. Vestibulum non porta magna. Cras porta purus a magna blandit, cursus consectetur diam feugiat. Etiam congue enim nec augue aliquet vestibulum. Nullam at luctus metus, at pharetra velit. Vivamus vel dolor vitae sapien volutpat aliquam. Aliquam erat volutpat. Etiam hendrerit, massa ut suscipit tincidunt, quam ante dignissim est, quis consequat libero lectus quis justo. Proin eget scelerisque nibh. Pellentesque vel elit nibh. Phasellus aliquam odio nibh, eu mollis metus lacinia in. Proin felis ex, tincidunt vestibulum bibendum vel, congue ut nibh. Duis sed tortor et massa sollicitudin sodales. Vestibulum enim mi, hendrerit sit amet tempor malesuada, aliquet quis mauris. Nam quis odio at sem elementum consectetur. Aenean dolor eros, varius quis iaculis sed, interdum at lorem. Pellentesque volutpat risus nisl, non accumsan metus sagittis vitae. Ut consectetur aliquam egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus.',NULL,'2020-12-14',12),(35,'Obrisi me!','Duis felis felis, lacinia sit amet laoreet nec, faucibus vitae ex. Cras euismod interdum orci, a faucibus magna semper sed. Ut non erat sed nibh rutrum suscipit non vitae eros. Sed pulvinar velit lorem, non bibendum enim eleifend a. Mauris suscipit egestas varius. Vivamus id enim nec nisl semper finibus. Pellentesque mollis nunc non magna accumsan, non imperdiet ex sagittis. ','Duis felis felis, lacinia sit amet laoreet nec, faucibus vitae ex. Cras euismod interdum orci, a faucibus magna semper sed. Ut non erat sed nibh rutrum suscipit non vitae eros. Sed pulvinar velit lorem, non bibendum enim eleifend a. Mauris suscipit egestas varius. Vivamus id enim nec nisl semper finibus. Pellentesque mollis nunc non magna accumsan, non imperdiet ex sagittis. Duis felis felis, lacinia sit amet laoreet nec, faucibus vitae ex. Cras euismod interdum orci, a faucibus magna semper sed. Ut non erat sed nibh rutrum suscipit non vitae eros. Sed pulvinar velit lorem, non bibendum enim eleifend a. Mauris suscipit egestas varius. Vivamus id enim nec nisl semper finibus. Pellentesque mollis nunc non magna accumsan, non imperdiet ex sagittis. Duis felis felis, lacinia sit amet laoreet nec, faucibus vitae ex. Cras euismod interdum orci, a faucibus magna semper sed. Ut non erat sed nibh rutrum suscipit non vitae eros. Sed pulvinar velit lorem, non bibendum enim eleifend a. Mauris suscipit egestas varius. Vivamus id enim nec nisl semper finibus. Pellentesque mollis nunc non magna accumsan, non imperdiet ex sagittis. Duis felis felis, lacinia sit amet laoreet nec, faucibus vitae ex. Cras euismod interdum orci, a faucibus magna semper sed. Ut non erat sed nibh rutrum suscipit non vitae eros. Sed pulvinar velit lorem, non bibendum enim eleifend a. Mauris suscipit egestas varius. Vivamus id enim nec nisl semper finibus. Pellentesque mollis nunc non magna accumsan, non imperdiet ex sagittis. ',NULL,'2020-12-14',12);
/*!40000 ALTER TABLE `novosti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urednik`
--

DROP TABLE IF EXISTS `urednik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `urednik` (
  `urednik_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`urednik_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urednik`
--

LOCK TABLES `urednik` WRITE;
/*!40000 ALTER TABLE `urednik` DISABLE KEYS */;
INSERT INTO `urednik` VALUES (11,'urednik01','urednik01','Jusuf','Oh','jusufoh@gg.com',1),(12,'enis','enis','Enis','Beslagic','enis@enis.com',1),(13,'munibsolo','munibsolo','Munib','Solo','munibsolo@solo.com',1);
/*!40000 ALTER TABLE `urednik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefon` varchar(45) NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (32,'jahija505','jahija505','Jahija','Okan','jahijao@gmail.com','0622339239',1),(33,'MuhaG','muhag','Muhamed','Mehmedovic','muhag@gg.com','225-883',1),(34,'nezke','himze','Nezir','Pivic','nezi@pivic.sda','99',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbnovosti_31_37'
--

--
-- Dumping routines for database 'dbnovosti_31_37'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-14  1:21:10
