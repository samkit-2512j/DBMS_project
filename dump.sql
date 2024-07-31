-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: INTERCOURSES
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user1_id` int DEFAULT NULL,
  `user2_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user1_id` (`user1_id`),
  KEY `user2_id` (`user2_id`),
  CONSTRAINT `conversation_ibfk_1` FOREIGN KEY (`user1_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conversation_ibfk_2` FOREIGN KEY (`user2_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation`
--

LOCK TABLES `conversation` WRITE;
/*!40000 ALTER TABLE `conversation` DISABLE KEYS */;
INSERT INTO `conversation` VALUES (1,1,3),(2,1,5),(3,2,3),(4,2,5),(5,4,5),(6,3,5);
/*!40000 ALTER TABLE `conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation2`
--

DROP TABLE IF EXISTS `conversation2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation2` (
  `user1_id` int NOT NULL,
  `user2_id` int NOT NULL,
  `start_ts` timestamp NULL DEFAULT NULL,
  `most_recent_ts` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user1_id`,`user2_id`),
  KEY `user2_id` (`user2_id`),
  CONSTRAINT `conversation2_ibfk_1` FOREIGN KEY (`user1_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conversation2_ibfk_2` FOREIGN KEY (`user2_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation2`
--

LOCK TABLES `conversation2` WRITE;
/*!40000 ALTER TABLE `conversation2` DISABLE KEYS */;
INSERT INTO `conversation2` VALUES (1,3,'2023-12-02 23:35:40','2023-12-02 23:41:17'),(1,5,'2023-12-02 23:35:40','2023-12-02 23:35:40'),(2,3,'2023-12-02 23:35:40','2023-12-02 23:35:40'),(2,5,'2023-12-02 23:35:40','2023-12-02 23:35:40'),(3,5,'2023-12-02 23:40:05','2023-12-02 23:40:05'),(4,5,'2023-12-02 23:35:40','2023-12-02 23:35:40');
/*!40000 ALTER TABLE `conversation2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_location`
--

DROP TABLE IF EXISTS `date_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `date_location` (
  `location_id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `visit_count` int DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  CONSTRAINT `date_location_chk_1` CHECK ((`rating` between 0 and 100)),
  CONSTRAINT `date_location_chk_2` CHECK ((`visit_count` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_location`
--

LOCK TABLES `date_location` WRITE;
/*!40000 ALTER TABLE `date_location` DISABLE KEYS */;
INSERT INTO `date_location` VALUES (1,'Botanical gardens',41,11),(2,'Cafe',84,32),(3,'Mall',75,61),(4,'Movie',60,26),(5,'Bar',88,14);
/*!40000 ALTER TABLE `date_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_caption`
--

DROP TABLE IF EXISTS `link_caption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `link_caption` (
  `link` varchar(40) NOT NULL,
  `caption` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_caption`
--

LOCK TABLES `link_caption` WRITE;
/*!40000 ALTER TABLE `link_caption` DISABLE KEYS */;
INSERT INTO `link_caption` VALUES ('https://goo.gl/39047591','Blow me and I\'ll blow you away'),('https://goo.gl/64422410','Unconditional love is the outer expression of inner peace'),('https://goo.gl/75705602','I\'m not single, I\'m just romantically challenged'),('https://goo.gl/93004443','I\'m either the one you admire or the one who appears in your nightmare'),('https://goo.gl/95879789','An eye with dust and a heart with trust always cries');
/*!40000 ALTER TABLE `link_caption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `sender_id` int NOT NULL,
  `timestamp` timestamp NOT NULL,
  `conv_id` int DEFAULT NULL,
  `content` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`sender_id`,`timestamp`),
  KEY `conv_id` (`conv_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`conv_id`) REFERENCES `conversation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'2023-12-02 23:35:40',1,'Hey!'),(1,'2023-12-02 23:41:17',1,' Whats up'),(2,'2023-12-02 23:35:40',3,'Hey! how you doing?'),(3,'2023-12-02 23:35:40',1,'Hi');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameters`
--

DROP TABLE IF EXISTS `parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `isTarget` int DEFAULT NULL,
  `value1` int DEFAULT NULL,
  `value2` int DEFAULT NULL,
  `value3` int DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `parameters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `parameters_chk_1` CHECK (((`isTarget` = 0) or (`isTarget` = 1))),
  CONSTRAINT `parameters_chk_2` CHECK ((`value1` between 0 and 100)),
  CONSTRAINT `parameters_chk_3` CHECK ((`value2` between 0 and 100)),
  CONSTRAINT `parameters_chk_4` CHECK ((`value3` between 0 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameters`
--

LOCK TABLES `parameters` WRITE;
/*!40000 ALTER TABLE `parameters` DISABLE KEYS */;
INSERT INTO `parameters` VALUES (1,1,0,23,85,67,'2023-12-02 23:35:39'),(2,1,1,14,76,58,'2023-12-02 23:35:39'),(3,2,0,21,89,70,'2023-12-02 23:35:39'),(4,2,1,12,25,54,'2023-12-02 23:35:39'),(5,3,0,11,59,38,'2023-12-02 23:35:39'),(6,3,1,64,15,43,'2023-12-02 23:35:39'),(7,4,0,42,29,36,'2023-12-02 23:35:39'),(8,4,1,87,43,53,'2023-12-02 23:35:39'),(9,5,0,69,9,70,'2023-12-02 23:35:39'),(10,5,1,21,30,6,'2023-12-02 23:35:39');
/*!40000 ALTER TABLE `parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `user1_id` int DEFAULT NULL,
  `user2_id` int DEFAULT NULL,
  `change1` int DEFAULT NULL,
  `change2` int DEFAULT NULL,
  `change3` int DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `user1_id` (`user1_id`),
  KEY `user2_id` (`user2_id`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`user1_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`user2_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rating_chk_1` CHECK ((`change1` between 0 and 100)),
  CONSTRAINT `rating_chk_2` CHECK ((`change2` between 0 and 100)),
  CONSTRAINT `rating_chk_3` CHECK ((`change3` between 0 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,3,1,45,65,85,'2023-12-02 23:35:39'),(2,1,5,79,13,71,'2023-12-02 23:35:39'),(3,2,3,21,59,77,'2023-12-02 23:35:39'),(4,5,2,58,39,17,'2023-12-02 23:35:39'),(5,4,5,52,37,30,'2023-12-02 23:35:39');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `preffered_gender` varchar(20) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `phone_num` varchar(10) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_chk_1` CHECK ((`age` >= 17)),
  CONSTRAINT `user_chk_2` CHECK ((length(`phone_num`) = 10))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Alex','Male','Female',19,'2395273190','Hindi','Telangana'),(2,'Bob','Male','Female',21,'9046972570','Telugu','Andhra Pradesh'),(3,'Claire','Female','Male',20,'7355591498','Hindi','Delhi'),(4,'David','Male','Female',22,'4151065728','Bengali','West Bengal'),(5,'Emily','Female','Male',21,'5101874747','Hindi','Maharashtra');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_location_rated`
--

DROP TABLE IF EXISTS `user_location_rated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_location_rated` (
  `user_id` int NOT NULL,
  `location_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`user_id`,`location_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `user_location_rated_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_location_rated_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `date_location` (`location_id`) ON DELETE CASCADE,
  CONSTRAINT `user_location_rated_chk_1` CHECK ((`rating` between 0 and 100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_location_rated`
--

LOCK TABLES `user_location_rated` WRITE;
/*!40000 ALTER TABLE `user_location_rated` DISABLE KEYS */;
INSERT INTO `user_location_rated` VALUES (1,2,90),(1,3,50),(2,2,85),(3,5,50),(4,4,30);
/*!40000 ALTER TABLE `user_location_rated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_matched`
--

DROP TABLE IF EXISTS `user_matched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_matched` (
  `user1_id` int NOT NULL,
  `user2_id` int NOT NULL,
  PRIMARY KEY (`user1_id`,`user2_id`),
  KEY `user2_id` (`user2_id`),
  CONSTRAINT `user_matched_ibfk_1` FOREIGN KEY (`user1_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_matched_ibfk_2` FOREIGN KEY (`user2_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_matched`
--

LOCK TABLES `user_matched` WRITE;
/*!40000 ALTER TABLE `user_matched` DISABLE KEYS */;
INSERT INTO `user_matched` VALUES (1,3),(2,3),(1,5),(2,5),(4,5);
/*!40000 ALTER TABLE `user_matched` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_photo`
--

DROP TABLE IF EXISTS `user_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_photo` (
  `user_id` int NOT NULL,
  `timestamp` timestamp NOT NULL,
  `link` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`timestamp`),
  KEY `link` (`link`),
  CONSTRAINT `user_photo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_photo_ibfk_2` FOREIGN KEY (`link`) REFERENCES `link_caption` (`link`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_photo`
--

LOCK TABLES `user_photo` WRITE;
/*!40000 ALTER TABLE `user_photo` DISABLE KEYS */;
INSERT INTO `user_photo` VALUES (1,'2023-12-02 23:36:05','https://goo.gl/64422410'),(3,'2023-12-02 23:36:05','https://goo.gl/75705602'),(2,'2023-12-02 23:36:05','https://goo.gl/93004443'),(4,'2023-12-02 23:36:05','https://goo.gl/95879789');
/*!40000 ALTER TABLE `user_photo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-03  5:24:28
