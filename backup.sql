-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: bmpstudio_db
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.20.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add image',7,'add_image'),(26,'Can change image',7,'change_image'),(27,'Can delete image',7,'delete_image'),(28,'Can view image',7,'view_image'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add photographer',9,'add_photographer'),(34,'Can change photographer',9,'change_photographer'),(35,'Can delete photographer',9,'delete_photographer'),(36,'Can view photographer',9,'view_photographer'),(37,'Can add video',10,'add_video'),(38,'Can change video',10,'change_video'),(39,'Can delete video',10,'delete_video'),(40,'Can view video',10,'view_video'),(41,'Can add Token',11,'add_token'),(42,'Can change Token',11,'change_token'),(43,'Can delete Token',11,'delete_token'),(44,'Can view Token',11,'view_token'),(45,'Can add Token',12,'add_tokenproxy'),(46,'Can change Token',12,'change_tokenproxy'),(47,'Can delete Token',12,'delete_tokenproxy'),(48,'Can view Token',12,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$EbLOopdE1u9PLhK6oR4N7g$33+vXAxSdcCFUK9SltocQEZ0GD/39pHyWwD7mUMC5fQ=','2024-09-30 13:58:07.527062',1,'Azara','Yushahu','Yussif','yyushahu02@gmail.com',1,1,'2024-09-11 01:20:46.000000'),(2,'pbkdf2_sha256$600000$WCAPWuRb1ZqAxN9DEEsqnC$xfR1LfGDVXuB2yL7ii/yam/s3NKPj5gIwyESGPG1Vsg=','2024-09-20 00:11:42.525353',0,'iddibobo','Iddris','Mohammed','iddibobo@gmail.com',1,1,'2024-09-11 01:25:12.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-09-11 01:25:13.171786','2','iddibobo',1,'[{\"added\": {}}]',4,1),(2,'2024-09-11 01:26:44.264935','2','iddibobo',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(3,'2024-09-11 01:27:14.676942','1','Azara',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(4,'2024-09-11 01:40:57.966627','1','Yushahu Yussif',1,'[{\"added\": {}}]',9,1),(5,'2024-09-11 01:41:31.370844','1','Portraits',1,'[{\"added\": {}}]',8,1),(6,'2024-09-11 01:41:47.304715','2','Weddings',1,'[{\"added\": {}}]',8,1),(7,'2024-09-11 01:41:50.065451','1','Fati White - Arewa Portrait',1,'[{\"added\": {}}]',7,1),(8,'2024-09-11 01:44:31.342569','2','Iddris Mohammed',1,'[{\"added\": {}}]',9,1),(9,'2024-09-11 13:54:17.434777','3','Products',1,'[{\"added\": {}}]',8,1),(10,'2024-09-11 13:54:44.024823','4','Food',1,'[{\"added\": {}}]',8,1),(11,'2024-09-11 13:56:14.085925','2','Iddris Mohammed',2,'[{\"changed\": {\"fields\": [\"Phone\"]}}]',9,1),(12,'2024-09-11 13:56:28.682566','2','Iddris Mohammed',2,'[]',9,1),(13,'2024-09-11 14:08:49.110732','1','IMG_1151',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(14,'2024-09-11 14:10:09.155910','2','IMG_1150 - Fati White',1,'[{\"added\": {}}]',7,1),(15,'2024-09-11 14:10:19.739111','1','IMG_1151 - Fati White',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(16,'2024-09-11 14:13:35.173064','2','IMG_1150 - Fati White',2,'[]',7,1),(17,'2024-09-11 14:14:51.335053','3','IMG_1153 - Fati White',1,'[{\"added\": {}}]',7,1),(18,'2024-09-11 14:15:57.324121','4','IMG_1112 - Fati White',1,'[{\"added\": {}}]',7,1),(19,'2024-09-11 14:16:48.476320','5','IMG_1025 - Fati White',1,'[{\"added\": {}}]',7,1),(20,'2024-09-11 16:04:26.654568','6','IMG_1642 - Five Star Waakye',1,'[{\"added\": {}}]',7,1),(21,'2024-09-11 16:06:28.355359','4','Food',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(22,'2024-09-11 16:07:01.957050','3','Products',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(23,'2024-09-11 16:07:27.695827','2','Weddings',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(24,'2024-09-11 16:08:04.067324','1','Portraits',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(25,'2024-09-11 16:49:10.068609','1','IMG_1151 - Fati White',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',7,1),(26,'2024-09-11 16:50:49.276622','1','IMG_1151 - Fati White',2,'[]',7,1),(27,'2024-09-11 16:50:54.730316','2','IMG_1150 - Fati White',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',7,1),(28,'2024-09-11 16:51:26.817168','3','IMG_1153 - Fati White',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',7,1),(29,'2024-09-11 16:52:07.065117','4','IMG_1112 - Fati White',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',7,1),(30,'2024-09-11 16:52:39.016546','5','IMG_1025 - Fati White',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',7,1),(31,'2024-09-11 16:53:07.444830','6','IMG_1642 - Five Star Waakye',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',7,1),(32,'2024-09-11 17:22:35.469354','7','Head Shot Demo',1,'[{\"added\": {}}]',7,1),(33,'2024-09-11 18:01:52.674793','8','Bucket Hat Demo',1,'[{\"added\": {}}]',7,1),(34,'2024-09-11 18:02:19.515591','9','Model Demo',1,'[{\"added\": {}}]',7,1),(35,'2024-09-11 18:03:01.103156','10','Group Demo',1,'[{\"added\": {}}]',7,1),(36,'2024-09-11 18:03:30.757125','11','Product Demo 1',1,'[{\"added\": {}}]',7,1),(37,'2024-09-11 18:04:07.341495','12','Product Demo 2',1,'[{\"added\": {}}]',7,1),(38,'2024-09-11 18:04:40.408461','13','Product Demo 3',1,'[{\"added\": {}}]',7,1),(39,'2024-09-11 18:55:10.672447','6','IMG_1642 - Five Star Waakye',3,'',7,1),(40,'2024-09-11 18:55:15.156721','5','IMG_1025 - Fati White',3,'',7,1),(41,'2024-09-11 18:55:29.210480','4','IMG_1112 - Fati White',3,'',7,1),(42,'2024-09-11 18:55:32.556087','3','IMG_1153 - Fati White',3,'',7,1),(43,'2024-09-11 18:55:35.890351','2','IMG_1150 - Fati White',3,'',7,1),(44,'2024-09-11 18:55:39.343247','1','IMG_1151 - Fati White',3,'',7,1),(45,'2024-09-11 19:11:14.358930','14','Man in tears demo',1,'[{\"added\": {}}]',7,1),(46,'2024-09-11 19:11:54.220968','14','Man in tears demo',3,'',7,1),(47,'2024-09-11 19:19:41.427657','15','Black Wedding Demo',1,'[{\"added\": {}}]',7,1),(48,'2024-09-11 19:21:40.721295','16','Snowboard demo',1,'[{\"added\": {}}]',7,1),(49,'2024-09-11 22:37:23.833563','15','Black Wedding Demo',3,'',7,1),(50,'2024-09-11 22:43:42.831077','17','Plant product demo',1,'[{\"added\": {}}]',7,1),(51,'2024-09-11 22:45:14.545000','18','Puppy demo',1,'[{\"added\": {}}]',7,1),(52,'2024-09-11 23:05:14.907543','19','Mountains demo',1,'[{\"added\": {}}]',7,1),(53,'2024-09-11 23:05:45.216498','20','Canyon demo',1,'[{\"added\": {}}]',7,1),(54,'2024-09-12 09:50:11.769278','20','Canyon demo',3,'',7,1),(55,'2024-09-12 09:50:16.765375','19','Mountains demo',3,'',7,1),(56,'2024-09-12 09:50:20.517524','18','Puppy demo',3,'',7,1),(57,'2024-09-12 09:50:24.048932','17','Plant product demo',3,'',7,1),(58,'2024-09-12 09:50:27.464539','16','Snowboard demo',3,'',7,1),(59,'2024-09-12 09:50:31.101555','13','Product Demo 3',3,'',7,1),(60,'2024-09-12 09:50:34.575870','12','Product Demo 2',3,'',7,1),(61,'2024-09-12 09:50:38.150998','11','Product Demo 1',3,'',7,1),(62,'2024-09-12 09:50:41.588470','10','Group Demo',3,'',7,1),(63,'2024-09-12 09:50:45.158031','9','Model Demo',3,'',7,1),(64,'2024-09-12 09:50:48.562426','8','Bucket Hat Demo',3,'',7,1),(65,'2024-09-12 09:50:51.884807','7','Head Shot Demo',3,'',7,1),(66,'2024-09-12 09:54:15.997551','21','Portrait Headshot - Hon Rash',1,'[{\"added\": {}}]',7,1),(67,'2024-09-12 09:55:26.278655','22','Medium Shot - Hon Rash',1,'[{\"added\": {}}]',7,1),(68,'2024-09-12 09:56:19.678807','23','Mediumshot in white cloack - Hon Rash',1,'[{\"added\": {}}]',7,1),(69,'2024-09-12 09:57:18.248799','24','Mediumshot - Hon Rash in Yellow african wear',1,'[{\"added\": {}}]',7,1),(70,'2024-09-12 09:59:52.299432','25','Portrait of Aisha - Frankies, Nima',1,'[{\"added\": {}}]',7,1),(71,'2024-09-12 10:01:23.647957','26','Aisha portrait - Frankies, Nima II',1,'[{\"added\": {}}]',7,1),(72,'2024-09-12 10:01:33.259726','25','Portrait of Aisha - Frankies, Nima',2,'[]',7,1),(73,'2024-09-12 10:02:17.040045','24','Mediumshot - Hon Rash in Yellow african wear',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(74,'2024-09-12 10:02:36.570055','23','Mediumshot in white cloack - Hon Rash',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(75,'2024-09-12 10:02:56.259719','22','Medium Shot - Hon Rash',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(76,'2024-09-12 10:03:19.208809','21','Portrait Headshot - Hon Rash',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(77,'2024-09-12 10:04:16.168793','22','Medium Shot - Hon Rash',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(78,'2024-09-12 10:11:20.713379','27','Nura at World Hausa Day 2023',1,'[{\"added\": {}}]',7,1),(79,'2024-09-12 10:12:56.259052','28','Mallam Suwailam at World Hausa Day, 2023',1,'[{\"added\": {}}]',7,1),(80,'2024-09-12 10:14:41.628515','29','Mallam Suwailam - WHD 2023 II',1,'[{\"added\": {}}]',7,1),(81,'2024-09-12 10:15:56.424486','30','Mallam Suwailam - WHD 2023 III',1,'[{\"added\": {}}]',7,1),(82,'2024-09-12 10:26:36.102719','31','Faiza Chenti - Arewa Ceremony',1,'[{\"added\": {}}]',7,1),(83,'2024-09-12 10:28:05.209754','32','Bridesmaid at Arewa Ceremony of Ummu',1,'[{\"added\": {}}]',7,1),(84,'2024-09-12 10:28:59.798412','33','Bridesmaid at Ummu\'s Arewa',1,'[{\"added\": {}}]',7,1),(85,'2024-09-12 10:29:54.628904','34','Bridesmaid at Ummu\'s Arewa III',1,'[{\"added\": {}}]',7,1),(86,'2024-09-12 10:30:50.839442','35','Fati bridesmaid at Ummu\'s Arewa',1,'[{\"added\": {}}]',7,1),(87,'2024-09-12 10:31:49.962465','36','Portrait of Bridesmaid at Ummu\'s Arewa I',1,'[{\"added\": {}}]',7,1),(88,'2024-09-12 10:32:39.169853','37','Portrait of Bridesmaid at Ummu\'s Arewa II',1,'[{\"added\": {}}]',7,1),(89,'2024-09-12 10:33:17.238814','38','Portrait of Bridesmaid at Ummu\'s Arewa III',1,'[{\"added\": {}}]',7,1),(90,'2024-09-12 10:35:27.190161','39','Yasmin Portrait I',1,'[{\"added\": {}}]',7,1),(91,'2024-09-12 10:36:15.679686','40','Yasmin Portrait II',1,'[{\"added\": {}}]',7,1),(92,'2024-09-12 10:38:21.678920','41','Yasmin and Naa Ninche I',1,'[{\"added\": {}}]',7,1),(93,'2024-09-12 10:39:24.489587','42','Yasmin and Naa Ninche Portrait II',1,'[{\"added\": {}}]',7,1),(94,'2024-09-12 10:40:40.299411','43','Yasmin and Naa Ninche Portrait III',1,'[{\"added\": {}}]',7,1),(95,'2024-09-12 10:40:52.228933','30','Mallam Suwailam - WHD 2023 III',2,'[]',7,1),(96,'2024-09-12 10:40:59.568977','29','Mallam Suwailam - WHD 2023 II',2,'[]',7,1),(97,'2024-09-12 10:41:04.609112','30','Mallam Suwailam - WHD 2023 III',2,'[]',7,1),(98,'2024-09-12 10:41:22.909354','29','Mallam Suwailam - WHD 2023 II',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(99,'2024-09-12 10:41:28.809347','30','Mallam Suwailam - WHD 2023 III',2,'[]',7,1),(100,'2024-09-12 18:37:26.949888','44','Nasihat I',1,'[{\"added\": {}}]',7,1),(101,'2024-09-12 18:38:43.160269','45','Nasihat pre-wedding',1,'[{\"added\": {}}]',7,1),(102,'2024-09-12 18:44:28.475788','46','Nasihat Pre-wedding III',1,'[{\"added\": {}}]',7,1),(103,'2024-09-12 18:45:04.358974','47','Nasihat pre-wedding IV',1,'[{\"added\": {}}]',7,1),(104,'2024-09-12 18:45:53.979367','48','Nasihat pre-wedding V',1,'[{\"added\": {}}]',7,1),(105,'2024-09-12 18:48:14.689248','49','Nasihat pre-wedding VI',1,'[{\"added\": {}}]',7,1),(106,'2024-09-12 18:53:28.879417','50','Nasihat pre-wedding VII',1,'[{\"added\": {}}]',7,1),(107,'2024-09-12 18:54:16.409077','51','Nasihat pre-wedding VIII',1,'[{\"added\": {}}]',7,1),(108,'2024-09-12 18:56:35.418921','52','World Hausa Day - Guests I',1,'[{\"added\": {}}]',7,1),(109,'2024-09-12 18:57:17.218560','51','Nasihat pre-wedding VIII',3,'',7,1),(110,'2024-09-12 21:45:58.674113','53','Rwaid Concept World Hausa Day Shoot I',1,'[{\"added\": {}}]',7,1),(111,'2024-09-12 21:46:48.940431','54','Rwaid Concept World Hausa Day II',1,'[{\"added\": {}}]',7,1),(112,'2024-09-12 21:47:32.839492','55','Naana Khadija',1,'[{\"added\": {}}]',7,1),(113,'2024-09-12 21:48:35.259870','56','Group culture image',1,'[{\"added\": {}}]',7,1),(114,'2024-09-12 21:49:45.589692','57','Portrait - Aisha World Hausa Day',1,'[{\"added\": {}}]',7,1),(115,'2024-09-12 21:50:55.038897','58','Portrait - Fati White - World Hausa Day',1,'[{\"added\": {}}]',7,1),(116,'2024-09-12 21:51:48.840593','59','Model Pose - World Hausa Day',1,'[{\"added\": {}}]',7,1),(117,'2024-09-12 21:52:26.269871','60','Model Pose - World Hausa Day II',1,'[{\"added\": {}}]',7,1),(118,'2024-09-12 21:53:12.580755','61','Model Pose - World hausa Day',1,'[{\"added\": {}}]',7,1),(119,'2024-09-12 21:54:43.740631','62','Amarya Ummu - Arewa Celebrations',1,'[{\"added\": {}}]',7,1),(120,'2024-09-12 21:55:56.371326','63','Amarya Ummu - For the Glam I',1,'[{\"added\": {}}]',7,1),(121,'2024-09-12 21:56:27.970455','64','Amarya Ummu - For the Glam I',1,'[{\"added\": {}}]',7,1),(122,'2024-09-12 21:57:08.851178','65','Amarya Ummu - For the Glam II',1,'[{\"added\": {}}]',7,1),(123,'2024-09-12 21:57:16.030452','65','Amarya Ummu - For the Glam III',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(124,'2024-09-12 21:57:22.270306','64','Amarya Ummu - For the Glam II',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(125,'2024-09-12 21:57:25.100729','65','Amarya Ummu - For the Glam III',2,'[]',7,1),(126,'2024-09-12 21:58:31.171022','66','Amarya Ummu - For the Glam IV',1,'[{\"added\": {}}]',7,1),(127,'2024-09-12 21:58:49.280996','66','Amarya Ummu - For the Glam IV',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),(128,'2024-09-12 21:59:05.029713','5','Aerial',1,'[{\"added\": {}}]',8,1),(129,'2024-09-12 22:00:16.719706','67','Aerial shot of the Sogokope lake and bridge',1,'[{\"added\": {}}]',7,1),(130,'2024-09-12 22:02:04.879967','68','Yasmin and Naa',1,'[{\"added\": {}}]',7,1),(131,'2024-09-12 22:03:36.750600','55','Naana Khadija',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(132,'2024-09-12 22:05:49.571155','60','Model Pose - World Hausa Day II',2,'[{\"changed\": {\"fields\": [\"Categories\"]}}]',7,1),(133,'2024-09-12 22:05:56.212004','61','Model Pose - World hausa Day III',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(134,'2024-09-12 22:13:20.461301','69','Yasmin - Bride',1,'[{\"added\": {}}]',7,1),(135,'2024-09-12 22:14:56.630142','70','Nasihat\'s Groom II',1,'[{\"added\": {}}]',7,1),(136,'2024-09-12 22:15:56.769963','71','Nasihat\'s Groom - Solo II',1,'[{\"added\": {}}]',7,1),(137,'2024-09-12 22:17:04.870512','72','Nasihat and Groom - Wedding Day I',1,'[{\"added\": {}}]',7,1),(138,'2024-09-12 22:17:46.580050','73','Nasihat and Groom - Wedding Day II',1,'[{\"added\": {}}]',7,1),(139,'2024-09-12 22:18:37.219583','74','Nasihat Solo - Focus on ring',1,'[{\"added\": {}}]',7,1),(140,'2024-09-12 22:19:31.789733','75','Nasihat Solo II',1,'[{\"added\": {}}]',7,1),(141,'2024-09-12 22:20:09.098806','76','Nasihat Solo III',1,'[{\"added\": {}}]',7,1),(142,'2024-09-12 22:20:48.468914','77','Nasihat Solo IV',1,'[{\"added\": {}}]',7,1),(143,'2024-09-12 22:23:42.779082','78','Graduation image of Rukaya I',1,'[{\"added\": {}}]',7,1),(144,'2024-09-12 22:24:42.635242','79','Graduation image of Rukaya II',1,'[{\"added\": {}}]',7,1),(145,'2024-09-12 22:25:26.860454','80','Graduation image of Rukaya II',1,'[{\"added\": {}}]',7,1),(146,'2024-09-12 22:26:13.028994','81','Graduation image of Rukaya III',1,'[{\"added\": {}}]',7,1),(147,'2024-09-12 22:26:44.158982','82','Graduation image of Rukaya IV',1,'[{\"added\": {}}]',7,1),(148,'2024-09-12 22:29:35.305315','72','Nasihat and Groom - Wedding Day I',3,'',7,1),(149,'2024-09-12 22:29:57.979160','70','Nasihat\'s Groom II',3,'',7,1),(150,'2024-09-12 22:30:11.410041','77','Nasihat Solo IV',3,'',7,1),(151,'2024-09-12 22:31:12.386341','47','Nasihat pre-wedding IV',3,'',7,1),(152,'2024-09-12 22:40:44.699552','83','Naziyat\'s Mama II',1,'[{\"added\": {}}]',7,1),(153,'2024-09-12 22:41:43.689775','84','Baby naziyat\'s mama II',1,'[{\"added\": {}}]',7,1),(154,'2024-09-13 00:52:36.742972','1','Yushahu Yussif Azara',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(155,'2024-09-14 00:56:56.510715','83','Naziyat\'s Mama II',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(156,'2024-09-14 00:58:16.990284','60','Model Pose - World Hausa Day II',2,'[{\"changed\": {\"fields\": [\"Categories\"]}}]',7,1),(157,'2024-09-15 12:13:30.383995','3','AzaraMuqit',3,'',4,1),(158,'2024-09-15 12:13:59.325451','2','iddibobo',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(159,'2024-09-15 12:41:51.298315','2','iddibobo',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(160,'2024-09-16 16:56:29.467029','4','Kabiru',3,'',4,1),(161,'2024-09-16 22:22:18.010980','84','Baby naziyat\'s mama II',2,'[{\"changed\": {\"fields\": [\"Client\"]}}]',7,1),(162,'2024-09-17 19:51:00.624786','1','Fati White\'s Wedding Trailer',1,'[{\"added\": {}}]',10,1),(163,'2024-09-17 20:25:45.842623','1','Fati White\'s Wedding Trailer',2,'[{\"changed\": {\"fields\": [\"Video\"]}}]',10,1),(164,'2024-09-17 20:38:37.438685','1','Fati White\'s Wedding Trailer',2,'[{\"changed\": {\"fields\": [\"Video\"]}}]',10,1),(165,'2024-09-17 20:38:51.516228','1','Fati White\'s Wedding Trailer',2,'[{\"changed\": {\"fields\": [\"Video\"]}}]',10,1),(166,'2024-09-17 20:39:23.844900','1','Fati White\'s Wedding Trailer',2,'[{\"changed\": {\"fields\": [\"Video\"]}}]',10,1),(167,'2024-09-17 21:03:12.494212','1','Fati White\'s Wedding Trailer',2,'[]',10,1),(168,'2024-09-17 21:04:26.876712','1','Fati White\'s Wedding Trailer',2,'[]',10,1),(169,'2024-09-17 21:05:59.461401','2','Signal Cable Ad',1,'[{\"added\": {}}]',10,1),(170,'2024-09-17 21:12:49.634301','2','Signal Cable Ad',2,'[]',10,1),(171,'2024-09-17 21:14:41.779724','3','Volta River - Lower Volta Bridge, Sogakope',1,'[{\"added\": {}}]',10,1),(172,'2024-09-17 21:26:06.931413','3','Volta River - Lower Volta Bridge, Sogakope',2,'[]',10,1),(173,'2024-09-17 21:26:11.086378','3','Volta River - Lower Volta Bridge, Sogakope',2,'[]',10,1),(174,'2024-09-17 21:32:52.090947','3','Volta River - Lower Volta Bridge, Sogakope',2,'[]',10,1),(175,'2024-09-17 21:33:21.526383','2','Signal Cable Ad',2,'[]',10,1),(176,'2024-09-17 21:33:51.174734','1','Fati White\'s Wedding Trailer',2,'[]',10,1),(177,'2024-09-17 21:34:38.305986','3','Volta River - Lower Volta Bridge, Sogakope',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',10,1),(178,'2024-09-17 21:34:43.683491','3','Volta River - Lower Volta Bridge, Sogakope',2,'[]',10,1),(179,'2024-09-17 21:34:56.620941','3','Volta River - Lower Volta Bridge, Sogakope',2,'[]',10,1),(180,'2024-09-17 21:36:04.967899','3','Volta River - Lower Volta Bridge, Sogakope',2,'[]',10,1),(181,'2024-09-17 21:40:04.224261','3','Volta River - Lower Volta Bridge, Sogakope',2,'[]',10,1),(182,'2024-09-17 21:40:42.463631','1','Fati White\'s Wedding Trailer',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',10,1),(183,'2024-09-17 21:41:07.106771','2','Signal Cable Ad',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',10,1),(184,'2024-09-17 22:52:41.842925','2','Signal Cable Ad',2,'[]',10,1),(185,'2024-09-17 22:54:01.807260','4','Aflao Beach - Volta Region, Ghana',1,'[{\"added\": {}}]',10,1),(186,'2024-09-17 22:55:11.631378','5','A & H\'s Trailer',1,'[{\"added\": {}}]',10,1),(187,'2024-09-17 22:57:27.410670','6','World Hause Day Documentary - Trailer',1,'[{\"added\": {}}]',10,1),(188,'2024-09-17 22:59:21.549907','7','World Hausa Day - Full Documentary',1,'[{\"added\": {}}]',10,1),(189,'2024-09-17 23:00:41.429902','8','Sabon Zango - Drone View',1,'[{\"added\": {}}]',10,1),(190,'2024-09-17 23:04:00.882936','8','Sabon Zango - Drone View',3,'',10,1),(191,'2024-09-17 23:19:56.559192','85','Drone shot of Sabon Zango',1,'[{\"added\": {}}]',7,1),(192,'2024-09-17 23:22:28.279135','86','Baby Naziyat\'s Mama III',1,'[{\"added\": {}}]',7,1),(193,'2024-09-17 23:23:00.189296','87','Baby Naziyat\'s Mama IV',1,'[{\"added\": {}}]',7,1),(194,'2024-09-17 23:23:49.380566','82','Graduation image of Rukaya IV',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(195,'2024-09-17 23:23:54.769837','81','Graduation image of Rukaya III',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(196,'2024-09-17 23:24:00.300475','80','Graduation image of Rukaya II',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(197,'2024-09-17 23:24:07.009296','79','Graduation image of Rukaya II',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(198,'2024-09-17 23:24:12.740028','78','Graduation image of Rukaya I',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(199,'2024-09-17 23:26:57.109885','88','Airtad\'s Visit to Kwame Nkrumah Museum I - 2024',1,'[{\"added\": {}}]',7,1),(200,'2024-09-17 23:27:51.910513','89','Airtad\'s Visit to Kwame Nkrumah Museum II - 2024',1,'[{\"added\": {}}]',7,1),(201,'2024-09-17 23:28:38.689557','90','Airtad\'s Visit to Kwame Nkrumah Museum III - 2024',1,'[{\"added\": {}}]',7,1),(202,'2024-09-17 23:29:20.049403','91','Airtad\'s Visit to Kwame Nkrumah Museum IV - 2024',1,'[{\"added\": {}}]',7,1),(203,'2024-09-17 23:32:00.676315','92','Five Star Waakey - Food Photography I',1,'[{\"added\": {}}]',7,1),(204,'2024-09-17 23:32:46.010301','93','Five Star Waakey - Food Photography II',1,'[{\"added\": {}}]',7,1),(205,'2024-09-17 23:33:00.440808','93','Five Star Waakey - Food Photography II',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,1),(206,'2024-09-17 23:34:02.353245','94','Portrait Image of Five Star Waakey Owner - Male',1,'[{\"added\": {}}]',7,1),(207,'2024-09-17 23:34:36.979970','95','Portrait Image of Five Star Waakey Owner - Female',1,'[{\"added\": {}}]',7,1),(208,'2024-09-17 23:35:12.579267','96','Portrait Image of Five Star Waakey Owners',1,'[{\"added\": {}}]',7,1),(209,'2024-09-17 23:38:03.062656','97','Fati White\'s Arewa I',1,'[{\"added\": {}}]',7,1),(210,'2024-09-17 23:38:50.039858','98','Fati White\'s Arewa II',1,'[{\"added\": {}}]',7,1),(211,'2024-09-17 23:39:27.389462','99','Fati White\'s Arewa III',1,'[{\"added\": {}}]',7,1),(212,'2024-09-17 23:40:09.989351','100','Fati White\'s Arewa IV',1,'[{\"added\": {}}]',7,1),(213,'2024-09-17 23:40:47.089660','101','Fati White\'s Arewa V',1,'[{\"added\": {}}]',7,1),(214,'2024-09-17 23:41:35.339267','102','Fati White\'s Arewa V',1,'[{\"added\": {}}]',7,1),(215,'2024-09-17 23:41:39.689162','101','Fati White\'s Arewa V',2,'[]',7,1),(216,'2024-09-17 23:41:44.116983','102','Fati White\'s Arewa VI',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(217,'2024-09-17 23:45:02.420165','103','Fati and Osman I',1,'[{\"added\": {}}]',7,1),(218,'2024-09-17 23:45:30.208938','104','Fati and Osman II',1,'[{\"added\": {}}]',7,1),(219,'2024-09-17 23:46:37.792783','105','Fati White - Sunday I',1,'[{\"added\": {}}]',7,1),(220,'2024-09-17 23:47:16.409387','106','Fati White - Sunday II',1,'[{\"added\": {}}]',7,1),(221,'2024-09-17 23:47:53.889008','107','Fati White - Sunday III',1,'[{\"added\": {}}]',7,1),(222,'2024-09-17 23:50:17.131897','108','Sistas - I',1,'[{\"added\": {}}]',7,1),(223,'2024-09-17 23:50:50.580018','109','Sistas - II',1,'[{\"added\": {}}]',7,1),(224,'2024-09-17 23:51:11.209392','109','Sistas - II',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,1),(225,'2024-09-18 00:02:49.254824','7','World Hausa Day - Full Documentary',3,'',10,1),(226,'2024-09-18 00:03:07.802545','6','World Hause Day Documentary - Trailer',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',10,1),(227,'2024-09-18 00:03:14.813389','5','A & H\'s Trailer',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',10,1),(228,'2024-09-18 00:03:19.736815','4','Aflao Beach - Volta Region, Ghana',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',10,1),(229,'2024-09-18 00:03:25.200347','3','Volta River - Lower Volta Bridge, Sogakope',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',10,1),(230,'2024-09-18 00:03:34.306357','2','Signal Cable Ad',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',10,1),(231,'2024-09-18 00:03:40.211203','1','Fati White\'s Wedding Trailer',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',10,1),(232,'2024-09-18 00:05:03.845924','6','World Hause Day Documentary - Trailer',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',10,1),(233,'2024-09-18 00:06:15.507999','5','A & H\'s Trailer',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',10,1),(234,'2024-09-18 00:06:23.067162','4','Aflao Beach - Volta Region, Ghana',2,'[]',10,1),(235,'2024-09-18 00:06:29.287453','4','Aflao Beach - Volta Region, Ghana',2,'[]',10,1),(236,'2024-09-18 00:07:25.168168','3','Volta River - Lower Volta Bridge, Sogakope',2,'[]',10,1),(237,'2024-09-18 00:07:31.534514','2','Signal Cable Ad',2,'[]',10,1),(238,'2024-09-18 00:07:38.603402','1','Fati White\'s Wedding Trailer',2,'[]',10,1),(239,'2024-09-18 00:28:59.651528','110','Photographer - Azara',1,'[{\"added\": {}}]',7,1),(240,'2024-09-18 00:38:15.089326','111','HovKid I',1,'[{\"added\": {}}]',7,1),(241,'2024-09-18 00:39:03.968637','112','HovKid II',1,'[{\"added\": {}}]',7,1),(242,'2024-09-18 00:39:59.158631','113','HovKid III',1,'[{\"added\": {}}]',7,1),(243,'2024-09-18 00:40:30.539409','114','HovKid IV',1,'[{\"added\": {}}]',7,1),(244,'2024-09-18 00:44:56.419258','3','Gabriel Asampana',1,'[{\"added\": {}}]',9,1),(245,'2024-09-18 00:45:28.979160','115','CEO and DIRECTOR',1,'[{\"added\": {}}]',7,1),(246,'2024-09-18 00:46:38.608628','116','Young girl at the beach',1,'[{\"added\": {}}]',7,1),(247,'2024-09-18 00:51:12.250070','117','Admins of Muna\'s Foundation I',1,'[{\"added\": {}}]',7,1),(248,'2024-09-18 00:51:51.410237','118','Admins of Muna\'s Foundation II',1,'[{\"added\": {}}]',7,1),(249,'2024-09-18 13:54:20.977348','116','Young girl at the beach',2,'[{\"changed\": {\"fields\": [\"Client\"]}}]',7,1),(250,'2024-09-18 13:54:27.355083','115','CEO and DIRECTOR',2,'[{\"changed\": {\"fields\": [\"Client\"]}}]',7,1),(251,'2024-09-18 13:54:56.705169','110','Photographer - Azara',2,'[{\"changed\": {\"fields\": [\"Client\"]}}]',7,1),(252,'2024-09-18 13:57:36.795883','91','Airtad\'s Visit to Kwame Nkrumah Museum IV - 2024',2,'[{\"changed\": {\"fields\": [\"Client\"]}}]',7,1),(253,'2024-09-18 14:33:44.555787','84','Baby naziyat\'s mama II',2,'[{\"changed\": {\"fields\": [\"Client\"]}}]',7,1),(254,'2024-09-18 14:39:33.075846','67','Aerial shot of the Sogokope lake and bridge',2,'[{\"changed\": {\"fields\": [\"Client\"]}}]',7,1),(255,'2024-09-18 14:39:47.906634','85','Drone shot of Sabon Zango',2,'[{\"changed\": {\"fields\": [\"Client\"]}}]',7,1),(256,'2024-09-20 00:03:15.625243','5','Kabiru',3,'',4,1),(257,'2024-09-20 00:06:31.490581','6','Kabiru',3,'',4,1),(258,'2024-09-20 00:12:42.839190','7','Kabiru',3,'',4,1),(259,'2024-09-20 00:26:18.042395','8','Kabiru',3,'',4,1),(260,'2024-09-20 00:38:50.914071','10','JohnD',3,'',4,1),(261,'2024-09-20 00:38:55.383485','9','Kabiru',3,'',4,1),(262,'2024-09-20 01:07:31.836258','9','Nasihat Trailer',1,'[{\"added\": {}}]',10,1),(263,'2024-09-20 01:10:28.520813','9','Nasihat Trailer',2,'[{\"changed\": {\"fields\": [\"Video\"]}}]',10,1),(264,'2024-09-28 09:33:33.868541','118','Admins of Muna\'s Foundation II',3,'',7,1),(265,'2024-09-28 09:33:33.888963','117','Admins of Muna\'s Foundation I',3,'',7,1),(266,'2024-09-28 09:33:33.913175','116','Young girl at the beach',3,'',7,1),(267,'2024-09-28 09:33:33.938500','115','CEO and DIRECTOR',3,'',7,1),(268,'2024-09-28 09:33:33.963226','114','HovKid IV',3,'',7,1),(269,'2024-09-28 09:33:33.987866','113','HovKid III',3,'',7,1),(270,'2024-09-28 09:33:34.011309','112','HovKid II',3,'',7,1),(271,'2024-09-28 09:33:34.037862','111','HovKid I',3,'',7,1),(272,'2024-09-28 09:33:34.057454','110','Photographer - Azara',3,'',7,1),(273,'2024-09-28 09:33:34.081603','109','Sistas - II',3,'',7,1),(274,'2024-09-28 09:33:34.105465','108','Sistas - I',3,'',7,1),(275,'2024-09-28 09:33:34.142603','107','Fati White - Sunday III',3,'',7,1),(276,'2024-09-28 09:33:34.162568','106','Fati White - Sunday II',3,'',7,1),(277,'2024-09-28 09:33:34.182554','105','Fati White - Sunday I',3,'',7,1),(278,'2024-09-28 09:33:34.202082','104','Fati and Osman II',3,'',7,1),(279,'2024-09-28 09:33:34.221392','103','Fati and Osman I',3,'',7,1),(280,'2024-09-28 09:33:34.281404','102','Fati White\'s Arewa VI',3,'',7,1),(281,'2024-09-28 09:33:34.317060','101','Fati White\'s Arewa V',3,'',7,1),(282,'2024-09-28 09:33:34.348429','100','Fati White\'s Arewa IV',3,'',7,1),(283,'2024-09-28 09:33:34.367747','99','Fati White\'s Arewa III',3,'',7,1),(284,'2024-09-28 09:33:34.387605','98','Fati White\'s Arewa II',3,'',7,1),(285,'2024-09-28 09:33:34.406828','97','Fati White\'s Arewa I',3,'',7,1),(286,'2024-09-28 09:33:34.434053','96','Portrait Image of Five Star Waakey Owners',3,'',7,1),(287,'2024-09-28 09:33:34.453112','95','Portrait Image of Five Star Waakey Owner - Female',3,'',7,1),(288,'2024-09-28 09:33:34.473039','94','Portrait Image of Five Star Waakey Owner - Male',3,'',7,1),(289,'2024-09-28 09:33:34.495289','93','Five Star Waakey - Food Photography II',3,'',7,1),(290,'2024-09-28 09:33:34.518850','92','Five Star Waakey - Food Photography I',3,'',7,1),(291,'2024-09-28 09:33:34.542356','91','Airtad\'s Visit to Kwame Nkrumah Museum IV - 2024',3,'',7,1),(292,'2024-09-28 09:33:34.562361','90','Airtad\'s Visit to Kwame Nkrumah Museum III - 2024',3,'',7,1),(293,'2024-09-28 09:33:34.584721','89','Airtad\'s Visit to Kwame Nkrumah Museum II - 2024',3,'',7,1),(294,'2024-09-28 09:33:34.611290','88','Airtad\'s Visit to Kwame Nkrumah Museum I - 2024',3,'',7,1),(295,'2024-09-28 09:33:34.638911','87','Baby Naziyat\'s Mama IV',3,'',7,1),(296,'2024-09-28 09:33:34.659157','86','Baby Naziyat\'s Mama III',3,'',7,1),(297,'2024-09-28 09:33:34.683276','85','Drone shot of Sabon Zango',3,'',7,1),(298,'2024-09-28 09:33:34.703115','84','Baby naziyat\'s mama II',3,'',7,1),(299,'2024-09-28 09:33:34.722170','83','Naziyat\'s Mama II',3,'',7,1),(300,'2024-09-28 09:33:34.742023','82','Graduation image of Rukaya IV',3,'',7,1),(301,'2024-09-28 09:33:34.761446','81','Graduation image of Rukaya III',3,'',7,1),(302,'2024-09-28 09:33:34.778724','80','Graduation image of Rukaya II',3,'',7,1),(303,'2024-09-28 09:33:34.797139','79','Graduation image of Rukaya II',3,'',7,1),(304,'2024-09-28 09:33:34.818334','78','Graduation image of Rukaya I',3,'',7,1),(305,'2024-09-28 09:33:34.837291','76','Nasihat Solo III',3,'',7,1),(306,'2024-09-28 09:33:34.855870','75','Nasihat Solo II',3,'',7,1),(307,'2024-09-28 09:33:34.874266','74','Nasihat Solo - Focus on ring',3,'',7,1),(308,'2024-09-28 09:33:34.893997','73','Nasihat and Groom - Wedding Day II',3,'',7,1),(309,'2024-09-28 09:33:34.912286','71','Nasihat\'s Groom - Solo II',3,'',7,1),(310,'2024-09-28 09:33:34.932158','69','Yasmin - Bride',3,'',7,1),(311,'2024-09-28 09:33:34.951969','68','Yasmin and Naa',3,'',7,1),(312,'2024-09-28 09:33:34.971769','67','Aerial shot of the Sogokope lake and bridge',3,'',7,1),(313,'2024-09-28 09:33:34.989396','66','Amarya Ummu - For the Glam IV',3,'',7,1),(314,'2024-09-28 09:33:35.008428','65','Amarya Ummu - For the Glam III',3,'',7,1),(315,'2024-09-28 09:33:35.031467','64','Amarya Ummu - For the Glam II',3,'',7,1),(316,'2024-09-28 09:33:35.048726','63','Amarya Ummu - For the Glam I',3,'',7,1),(317,'2024-09-28 09:33:35.068535','62','Amarya Ummu - Arewa Celebrations',3,'',7,1),(318,'2024-09-28 09:33:35.088514','61','Model Pose - World hausa Day III',3,'',7,1),(319,'2024-09-28 09:33:35.108029','60','Model Pose - World Hausa Day II',3,'',7,1),(320,'2024-09-28 09:33:35.135664','59','Model Pose - World Hausa Day',3,'',7,1),(321,'2024-09-28 09:33:35.154654','58','Portrait - Fati White - World Hausa Day',3,'',7,1),(322,'2024-09-28 09:33:35.182379','57','Portrait - Aisha World Hausa Day',3,'',7,1),(323,'2024-09-28 09:33:35.201590','56','Group culture image',3,'',7,1),(324,'2024-09-28 09:33:35.224692','55','Naana Khadija',3,'',7,1),(325,'2024-09-28 09:33:35.244569','54','Rwaid Concept World Hausa Day II',3,'',7,1),(326,'2024-09-28 09:33:35.263438','53','Rwaid Concept World Hausa Day Shoot I',3,'',7,1),(327,'2024-09-28 09:33:35.282260','52','World Hausa Day - Guests I',3,'',7,1),(328,'2024-09-28 09:33:35.301062','50','Nasihat pre-wedding VII',3,'',7,1),(329,'2024-09-28 09:33:35.324031','49','Nasihat pre-wedding VI',3,'',7,1),(330,'2024-09-28 09:33:35.343074','48','Nasihat pre-wedding V',3,'',7,1),(331,'2024-09-28 09:33:35.362945','46','Nasihat Pre-wedding III',3,'',7,1),(332,'2024-09-28 09:33:35.382593','45','Nasihat pre-wedding',3,'',7,1),(333,'2024-09-28 09:33:35.401942','44','Nasihat I',3,'',7,1),(334,'2024-09-28 09:33:35.425508','43','Yasmin and Naa Ninche Portrait III',3,'',7,1),(335,'2024-09-28 09:33:35.445045','42','Yasmin and Naa Ninche Portrait II',3,'',7,1),(336,'2024-09-28 09:33:35.463462','41','Yasmin and Naa Ninche I',3,'',7,1),(337,'2024-09-28 09:33:35.482599','40','Yasmin Portrait II',3,'',7,1),(338,'2024-09-28 09:33:35.501846','39','Yasmin Portrait I',3,'',7,1),(339,'2024-09-28 09:33:35.525994','38','Portrait of Bridesmaid at Ummu\'s Arewa III',3,'',7,1),(340,'2024-09-28 09:33:35.547398','37','Portrait of Bridesmaid at Ummu\'s Arewa II',3,'',7,1),(341,'2024-09-28 09:33:35.567194','36','Portrait of Bridesmaid at Ummu\'s Arewa I',3,'',7,1),(342,'2024-09-28 09:33:35.587035','35','Fati bridesmaid at Ummu\'s Arewa',3,'',7,1),(343,'2024-09-28 09:33:35.606702','34','Bridesmaid at Ummu\'s Arewa III',3,'',7,1),(344,'2024-09-28 09:33:35.634752','33','Bridesmaid at Ummu\'s Arewa',3,'',7,1),(345,'2024-09-28 09:33:35.656363','32','Bridesmaid at Arewa Ceremony of Ummu',3,'',7,1),(346,'2024-09-28 09:33:35.674700','31','Faiza Chenti - Arewa Ceremony',3,'',7,1),(347,'2024-09-28 09:33:35.693738','30','Mallam Suwailam - WHD 2023 III',3,'',7,1),(348,'2024-09-28 09:33:35.712305','29','Mallam Suwailam - WHD 2023 II',3,'',7,1),(349,'2024-09-28 09:33:35.733163','28','Mallam Suwailam at World Hausa Day, 2023',3,'',7,1),(350,'2024-09-28 09:33:35.752749','27','Nura at World Hausa Day 2023',3,'',7,1),(351,'2024-09-28 09:33:35.772566','26','Aisha portrait - Frankies, Nima II',3,'',7,1),(352,'2024-09-28 09:33:35.791770','25','Portrait of Aisha - Frankies, Nima',3,'',7,1),(353,'2024-09-28 09:33:35.811967','24','Mediumshot - Hon Rash in Yellow african wear',3,'',7,1),(354,'2024-09-28 09:33:35.840131','23','Mediumshot in white cloack - Hon Rash',3,'',7,1),(355,'2024-09-28 09:33:35.861456','22','Medium Shot - Hon Rash',3,'',7,1),(356,'2024-09-28 09:33:35.879880','21','Portrait Headshot - Hon Rash',3,'',7,1),(357,'2024-09-28 09:33:48.440810','9','Nasihat Trailer',3,'',10,1),(358,'2024-09-28 09:33:48.460432','6','World Hause Day Documentary - Trailer',3,'',10,1),(359,'2024-09-28 09:33:48.480480','5','A & H\'s Trailer',3,'',10,1),(360,'2024-09-28 09:33:48.499995','4','Aflao Beach - Volta Region, Ghana',3,'',10,1),(361,'2024-09-28 09:33:48.519991','3','Volta River - Lower Volta Bridge, Sogakope',3,'',10,1),(362,'2024-09-28 09:33:48.537982','2','Signal Cable Ad',3,'',10,1),(363,'2024-09-28 09:33:48.556161','1','Fati White\'s Wedding Trailer',3,'',10,1),(364,'2024-09-28 10:01:11.159305','121','Zee\'s reception at Madina I',1,'[{\"added\": {}}]',7,1),(365,'2024-09-28 10:06:06.276107','122','Zee\'s Headshot at her reception I',1,'[{\"added\": {}}]',7,1),(366,'2024-09-28 10:11:44.623278','123','Zee\'s Portrait Full Body I',1,'[{\"added\": {}}]',7,1),(367,'2024-09-28 10:17:31.740669','124','Zee\'s Captivating Smile of Joy',1,'[{\"added\": {}}]',7,1),(368,'2024-09-28 10:20:58.191772','125','Zee\'s Glamouring Native Outfit I',1,'[{\"added\": {}}]',7,1),(369,'2024-09-28 10:23:11.905815','126','Zee\'s Glamouring Native Outfit I',1,'[{\"added\": {}}]',7,1),(370,'2024-09-28 10:26:01.856995','127','Zee\'s Contagious Smile to the Camera',1,'[{\"added\": {}}]',7,1),(371,'2024-09-28 11:29:31.259731','128','Zee at her in-laws',1,'[{\"added\": {}}]',7,1),(372,'2024-09-28 11:37:21.739132','129','Zee at her Sunday Reception',1,'[{\"added\": {}}]',7,1),(373,'2024-09-28 11:39:02.687122','128','Zee at her in-laws',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(374,'2024-09-28 11:39:16.417662','129','Zee at her Sunday Reception',2,'[]',7,1),(375,'2024-09-28 11:43:58.587618','130','Zee\'s Reception at her Family\'s I',1,'[{\"added\": {}}]',7,1),(376,'2024-09-28 13:02:33.292908','131','Headshot of Zee\'s at Family\'s',1,'[{\"added\": {}}]',7,1),(377,'2024-09-28 13:23:00.382205','132','Full bodyshot of Zee at Family\'s',1,'[{\"added\": {}}]',7,1),(378,'2024-09-28 13:25:57.852561','133','Heashot of Zee at Family\'s Reception I',1,'[{\"added\": {}}]',7,1),(379,'2024-09-28 13:27:41.954258','134','Heashot of Zee at Family\'s Reception II',1,'[{\"added\": {}}]',7,1),(380,'2024-09-28 16:02:03.468328','135','Heashot of Zee at Family\'s Reception III',1,'[{\"added\": {}}]',7,1),(381,'2024-09-28 16:08:55.519685','136','Product Shoot of a Wrist Watch I',1,'[{\"added\": {}}]',7,1),(382,'2024-09-28 16:09:59.161055','137','Product Shoot of a Wrist Watch II',1,'[{\"added\": {}}]',7,1),(383,'2024-09-28 16:10:41.746961','138','Product Shoot of a Wrist Watch III',1,'[{\"added\": {}}]',7,1),(384,'2024-09-28 16:15:25.916826','139','Backshot of our CEO',1,'[{\"added\": {}}]',7,1),(385,'2024-09-28 16:16:07.307841','134','Heashot of Zee at Family\'s Reception II',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(386,'2024-09-28 16:53:59.321234','140','Nafisa and Hussein\'s Reception I',1,'[{\"added\": {}}]',7,1),(387,'2024-09-28 17:04:13.332134','141','Nafisa and Hussein\'s Reception II',1,'[{\"added\": {}}]',7,1),(388,'2024-09-28 17:07:32.000947','142','Nafisa and Hussein\'s Reception III',1,'[{\"added\": {}}]',7,1),(389,'2024-09-28 17:10:11.377997','143','Nafisa and Hussein\'s Reception IV',1,'[{\"added\": {}}]',7,1),(390,'2024-09-28 18:00:49.293703','144','Hon Rash Political Image I',1,'[{\"added\": {}}]',7,1),(391,'2024-09-30 13:56:08.707271','145','Groom Hussein Sunday I',1,'[{\"added\": {}}]',7,1),(392,'2024-09-30 13:58:19.772687','144','Hon Rash Political Image I',2,'[]',7,1),(393,'2024-09-30 13:59:35.365255','146','Political Portrait of Hon Rash II',1,'[{\"added\": {}}]',7,1),(394,'2024-09-30 14:01:01.768931','147','Political Portrait of Hon Rash III',1,'[{\"added\": {}}]',7,1),(395,'2024-09-30 14:03:19.627037','148','Rwaid Concepts World Hausa Day Shoot',1,'[{\"added\": {}}]',7,1),(396,'2024-09-30 14:07:54.451695','149','Hausa Man - World Hausa Day Shoot',1,'[{\"added\": {}}]',7,1),(397,'2024-09-30 14:09:12.780339','150','Drama Group - World Hausa Day Shoot',1,'[{\"added\": {}}]',7,1),(398,'2024-09-30 14:10:47.301586','151','Aishah - World Hausa Day Shoot',1,'[{\"added\": {}}]',7,1),(399,'2024-09-30 16:06:08.311018','152','Fati White - World Hausa Day Shoot 2023',1,'[{\"added\": {}}]',7,1),(400,'2024-09-30 16:12:45.837638','153','Model  I World Hausa Day Shoot 2023',1,'[{\"added\": {}}]',7,1),(401,'2024-09-30 16:13:18.892521','153','Model I - World Hausa Day Shoot 2023',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(402,'2024-09-30 16:15:11.358803','154','Model II - World Hausa Day Shoot 2023',1,'[{\"added\": {}}]',7,1),(403,'2024-09-30 16:17:03.038963','155','Model III - World Hausa Day Shoot 2023',1,'[{\"added\": {}}]',7,1),(404,'2024-09-30 16:19:16.388026','156','Model IV - World Hausa Day Shoot 2023',1,'[{\"added\": {}}]',7,1),(405,'2024-09-30 16:23:01.194356','157','Ummu Umar - Arewa',1,'[{\"added\": {}}]',7,1),(406,'2024-09-30 16:24:48.962762','158','Bridesmaid I - Ummu Umar - Arewa',1,'[{\"added\": {}}]',7,1),(407,'2024-09-30 16:26:59.630229','159','Bridesmaid II - Ummu Umar - Arewa',1,'[{\"added\": {}}]',7,1),(408,'2024-09-30 16:28:10.478859','160','Bridesmaid III - Ummu Umar - Arewa',1,'[{\"added\": {}}]',7,1),(409,'2024-09-30 16:30:34.237408','161','Bridesmaid IV - Ummu Umar - Arewa',1,'[{\"added\": {}}]',7,1),(410,'2024-09-30 16:30:49.221994','159','Bridesmaid II - Ummu Umar - Arewa',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(411,'2024-09-30 16:30:57.761351','160','Bridesmaid III - Ummu Umar - Arewa',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(412,'2024-09-30 16:31:02.782085','161','Bridesmaid IV - Ummu Umar - Arewa',2,'[]',7,1),(413,'2024-09-30 16:32:07.827476','162','Bridesmaid V - Ummu Umar - Arewa',1,'[{\"added\": {}}]',7,1),(414,'2024-09-30 16:33:22.332634','163','Bridesmaid VI- Ummu Umar - Arewa',1,'[{\"added\": {}}]',7,1),(415,'2024-09-30 16:34:29.977053','164','Bridesmaid VII- Ummu Umar - Arewa',1,'[{\"added\": {}}]',7,1),(416,'2024-09-30 16:35:40.573452','165','Bridesmaid VIII - Ummu Umar - Arewa',1,'[{\"added\": {}}]',7,1),(417,'2024-09-30 16:35:50.122550','163','Bridesmaid V I- Ummu Umar - Arewa',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(418,'2024-09-30 16:35:54.602282','164','Bridesmaid VII - Ummu Umar - Arewa',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(419,'2024-09-30 16:42:38.262583','166','Ummu Umar - Weeding Image I',1,'[{\"added\": {}}]',7,1),(420,'2024-09-30 16:43:09.982046','166','Ummu Umar - Wedding Image I',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(421,'2024-09-30 16:47:10.965983','167','Ummu Umar - Wedding Image II',1,'[{\"added\": {}}]',7,1),(422,'2024-09-30 17:05:43.907483','169','Ummu Umar - Wedding Image III',1,'[{\"added\": {}}]',7,1),(423,'2024-09-30 17:06:14.217608','168','Ummu Umar - Wedding Image III',1,'[{\"added\": {}}]',7,1),(424,'2024-09-30 17:12:18.653032','168','Ummu Umar - Wedding Image III',3,'',7,1),(425,'2024-09-30 17:18:53.611099','170','CEO and Director in a Frame',1,'[{\"added\": {}}]',7,1),(426,'2024-09-30 18:00:09.092000','170','CEO and Director in a Frame',2,'[]',7,1),(427,'2024-09-30 18:33:56.488292','171','Ghanaian child at the beach',1,'[{\"added\": {}}]',7,1),(428,'2024-09-30 19:30:47.221935','172','Lower Volta Bridge - Sogakope',1,'[{\"added\": {}}]',7,1),(429,'2024-09-30 19:35:30.863511','173','Bride Yasmin - Pre I',1,'[{\"added\": {}}]',7,1),(430,'2024-09-30 19:44:43.031563','174','Bride Yasmin - Pre II',1,'[{\"added\": {}}]',7,1),(431,'2024-09-30 19:52:02.160109','175','Bride Yasmin - Groom Abdul-Lahie',1,'[{\"added\": {}}]',7,1),(432,'2024-09-30 19:54:18.880355','176','Bride Yasmin - Groom Abdul-Lahie II',1,'[{\"added\": {}}]',7,1),(433,'2024-09-30 19:55:27.941080','175','Bride Yasmin - Groom Abdul-Lahie I',2,'[{\"changed\": {\"fields\": [\"Title\", \"Created at\"]}}]',7,1),(434,'2024-09-30 20:09:25.871201','177','Nasihat - Pre I',1,'[{\"added\": {}}]',7,1),(435,'2024-09-30 20:18:21.740826','178','Nasihat - Pre II',1,'[{\"added\": {}}]',7,1),(436,'2024-09-30 20:34:10.182520','179','Nasihat - Pre III',1,'[{\"added\": {}}]',7,1),(437,'2024-09-30 20:42:35.405339','180','Nasihat - Pre IV',1,'[{\"added\": {}}]',7,1),(438,'2024-09-30 21:04:47.532317','181','Nasihat - Pre V',1,'[{\"added\": {}}]',7,1),(439,'2024-09-30 23:56:32.208588','182','Nasihat - Pre VI',1,'[{\"added\": {}}]',7,1),(440,'2024-10-01 00:16:27.677405','183','Nasihat\'s Husband - Midshot',1,'[{\"added\": {}}]',7,1),(441,'2024-10-01 00:36:50.580140','184','Nasihat and Husband',1,'[{\"added\": {}}]',7,1),(442,'2024-10-02 13:26:05.865476','185','Nasihat Headshot Single',1,'[{\"added\": {}}]',7,1),(443,'2024-10-02 13:33:29.907573','185','Nasihat Headshot Single',2,'[]',7,1),(444,'2024-10-02 13:34:58.924367','186','Nasihat\'s Ring',1,'[{\"added\": {}}]',7,1),(445,'2024-10-02 13:36:44.569701','187','Nasihat Mid Shot',1,'[{\"added\": {}}]',7,1),(446,'2024-10-02 13:46:17.051472','188','Rukayya\'s Graduation Headshot',1,'[{\"added\": {}}]',7,1),(447,'2024-10-02 13:54:48.599503','189','Rukayya\'s Graduation Holding up Certificate',1,'[{\"added\": {}}]',7,1),(448,'2024-10-02 14:04:24.196285','190','Rukayya and Husband',1,'[{\"added\": {}}]',7,1),(449,'2024-10-02 14:04:48.854033','188','Rukayya\'s Graduation Headshot',2,'[{\"changed\": {\"fields\": [\"Categories\"]}}]',7,1),(450,'2024-10-02 14:05:02.688691','189','Rukayya\'s Graduation Holding up Certificate',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(451,'2024-10-02 14:05:08.257566','190','Rukayya and Husband',2,'[]',7,1),(452,'2024-10-02 14:22:00.970793','191','HovKid Photoshoot I',1,'[{\"added\": {}}]',7,1),(453,'2024-10-02 14:24:44.246248','192','HovKid Photoshoot II',1,'[{\"added\": {}}]',7,1),(454,'2024-10-02 14:27:55.673605','193','HovKid Photoshoot III',1,'[{\"added\": {}}]',7,1),(455,'2024-10-02 14:37:21.397561','194','Five Star Waakye - Food I',1,'[{\"added\": {}}]',7,1),(456,'2024-10-02 14:44:40.519300','195','Five Star Waakye - Food II',1,'[{\"added\": {}}]',7,1),(457,'2024-10-02 14:45:20.215868','196','Five Star Waakye - Food II',1,'[{\"added\": {}}]',7,1),(458,'2024-10-02 14:48:53.335906','197','Five Star Waaakye - Director',1,'[{\"added\": {}}]',7,1),(459,'2024-10-02 14:51:07.418204','196','Five Star Waakye - Food II',3,'',7,1),(460,'2024-10-02 14:51:18.186905','197','Five Star Waaakye - CEO',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(461,'2024-10-02 14:53:38.950772','198','Five Star Waakye - Director',1,'[{\"added\": {}}]',7,1),(462,'2024-10-02 14:59:37.763979','199','Five Star Waakye - CEO and Director',1,'[{\"added\": {}}]',7,1),(463,'2024-10-02 15:01:07.947230','197','Five Star Waaakye - CEO',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(464,'2024-10-02 15:01:19.157374','198','Five Star Waakye - Director',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(465,'2024-10-02 15:01:26.627455','199','Five Star Waakye - CEO and Director',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(466,'2024-10-02 15:38:40.714293','200','Fati White - Arewa I',1,'[{\"added\": {}}]',7,1),(467,'2024-10-02 15:41:07.484040','201','Fati White - Arewa II',1,'[{\"added\": {}}]',7,1),(468,'2024-10-02 15:42:53.232573','202','Fati White - Arewa III',1,'[{\"added\": {}}]',7,1),(469,'2024-10-02 15:44:54.705485','203','Fati White - Arewa IV',1,'[{\"added\": {}}]',7,1),(470,'2024-10-02 15:47:51.761274','204','Fati White - Arewa V',1,'[{\"added\": {}}]',7,1),(471,'2024-10-02 15:50:43.562384','205','Fati White - Arewa VI',1,'[{\"added\": {}}]',7,1),(472,'2024-10-02 15:52:35.091895','206','Osman and Fati I',1,'[{\"added\": {}}]',7,1),(473,'2024-10-02 15:55:01.043509','207','Osman and Fati II',1,'[{\"added\": {}}]',7,1),(474,'2024-10-02 15:58:49.043430','208','Fati White - Sunday Reception I',1,'[{\"added\": {}}]',7,1),(475,'2024-10-02 16:04:27.860324','209','Fati White - Sunday Reception II',1,'[{\"added\": {}}]',7,1),(476,'2024-10-02 16:07:39.986650','210','Fati White - Sunday Reception III',1,'[{\"added\": {}}]',7,1),(477,'2024-10-02 16:18:00.359045','211','Five Star Waakye - Food I',1,'[{\"added\": {}}]',7,1),(478,'2024-10-02 16:18:59.114299','212','Five Star Waakye - Food II',1,'[{\"added\": {}}]',7,1),(479,'2024-10-02 16:19:12.578608','211','Five Star Waakye - Food I',2,'[{\"changed\": {\"fields\": [\"Created at\"]}}]',7,1),(480,'2024-10-02 16:20:00.082435','213','Five Star Waakye - Food III',1,'[{\"added\": {}}]',7,1),(481,'2024-10-02 16:21:02.472183','214','Five Star Waakye - Food IV',1,'[{\"added\": {}}]',7,1),(482,'2024-10-02 16:21:49.617664','215','Five Star Waakye - Food V',1,'[{\"added\": {}}]',7,1),(483,'2024-10-02 16:22:44.535766','216','Five Star Waakye - Food VI',1,'[{\"added\": {}}]',7,1),(484,'2024-10-02 16:26:04.083510','217','Baby Naziyat - Photoshoot I',1,'[{\"added\": {}}]',7,1),(485,'2024-10-02 16:28:35.302267','218','Baby Naziyat - Photoshoot II',1,'[{\"added\": {}}]',7,1),(486,'2024-10-02 16:30:54.808735','219','Baby Naziyat - Photoshoot III',1,'[{\"added\": {}}]',7,1),(487,'2024-10-02 16:32:20.301391','220','Baby Naziyat - Photoshoot IV',1,'[{\"added\": {}}]',7,1),(488,'2024-10-02 16:34:35.163220','205','Fati White - Arewa VI',2,'[{\"changed\": {\"fields\": [\"Categories\"]}}]',7,1),(489,'2024-10-02 16:36:47.427588','221','Aerial of Sabon Zango',1,'[{\"added\": {}}]',7,1),(490,'2024-10-02 16:49:54.848115','222','Airtad\'s Trip to Kwame Nkrumah Museum I',1,'[{\"added\": {}}]',7,1),(491,'2024-10-02 16:50:51.970313','223','Airtad\'s Trip to Kwame Nkrumah Museum II',1,'[{\"added\": {}}]',7,1),(492,'2024-10-02 16:51:39.616009','224','Airtad\'s Trip to Kwame Nkrumah Museum III',1,'[{\"added\": {}}]',7,1),(493,'2024-10-02 16:55:57.941194','225','Hajia Halima I',1,'[{\"added\": {}}]',7,1),(494,'2024-10-02 17:08:56.276999','226','Hajia Halima II',1,'[{\"added\": {}}]',7,1),(495,'2024-10-02 17:11:05.187300','227','Hajia Halima III',1,'[{\"added\": {}}]',7,1),(496,'2024-10-02 17:14:28.866997','228','Hajiya Halima IV',1,'[{\"added\": {}}]',7,1),(497,'2024-10-02 17:17:33.588689','229','Nasihat Pre',1,'[{\"added\": {}}]',7,1),(498,'2024-10-02 17:22:58.145717','230','Nasihat and Husband II',1,'[{\"added\": {}}]',7,1),(499,'2024-10-02 17:26:47.376308','231','Rukayya\'s Graduation Full Shot',1,'[{\"added\": {}}]',7,1),(500,'2024-10-02 17:35:01.538178','232','Sista\'s Naming Ceremony I',1,'[{\"added\": {}}]',7,1),(501,'2024-10-02 17:38:06.494456','233','Sista\'s Naming Ceremony II',1,'[{\"added\": {}}]',7,1),(502,'2024-10-02 17:44:10.859597','234','Yisha Corolla et Bebe I',1,'[{\"added\": {}}]',7,1),(503,'2024-10-02 17:45:41.202824','235','Yisha Corolla et Bebe II',1,'[{\"added\": {}}]',7,1),(504,'2024-10-02 17:47:38.398044','236','Yisha Corolla et Bebe III',1,'[{\"added\": {}}]',7,1),(505,'2024-10-02 17:56:49.537386','237','Yisha Corolla et Bebe IV',1,'[{\"added\": {}}]',7,1),(506,'2024-10-02 18:25:20.172868','238','BelMa I',1,'[{\"added\": {}}]',7,1),(507,'2024-10-02 18:26:11.342736','239','BelMa II',1,'[{\"added\": {}}]',7,1),(508,'2024-10-02 18:28:09.854445','240','BelMa III',1,'[{\"added\": {}}]',7,1),(509,'2024-10-02 18:29:06.873060','241','BelMa IV',1,'[{\"added\": {}}]',7,1),(510,'2024-10-02 18:29:57.808133','242','BelMa V',1,'[{\"added\": {}}]',7,1),(511,'2024-10-03 18:23:36.023296','165','Bridesmaid VIII - Ummu Umar - Arewa',2,'[]',7,1),(512,'2024-10-03 18:26:01.110206','243','Ummu Umar - Arewa',1,'[{\"added\": {}}]',7,1),(513,'2024-10-03 19:46:19.618076','244','Ummu Umar - Arewa II',1,'[{\"added\": {}}]',7,1),(514,'2024-10-03 19:47:33.760844','245','Ummu Umar - Wedding',1,'[{\"added\": {}}]',7,1),(515,'2024-10-03 19:48:30.006811','244','Ummu Umar - Arewa II',2,'[{\"changed\": {\"fields\": [\"Categories\"]}}]',7,1),(516,'2024-10-03 19:48:33.476335','245','Ummu Umar - Wedding',2,'[]',7,1),(517,'2024-10-03 19:48:37.507040','243','Ummu Umar - Arewa',2,'[{\"changed\": {\"fields\": [\"Categories\"]}}]',7,1),(518,'2024-10-03 19:53:54.223299','246','Food Photography I',1,'[{\"added\": {}}]',7,1),(519,'2024-10-03 19:54:29.815874','247','Food Photography II',1,'[{\"added\": {}}]',7,1),(520,'2024-10-03 19:54:59.513308','248','Food Photography III',1,'[{\"added\": {}}]',7,1),(521,'2024-10-03 19:55:30.239058','249','Food Photography IV',1,'[{\"added\": {}}]',7,1),(522,'2024-10-03 19:59:09.811084','250','Bala Faila\'s Friend I',1,'[{\"added\": {}}]',7,1),(523,'2024-10-03 19:59:39.961144','251','Bala Faila\'s Friend II',1,'[{\"added\": {}}]',7,1),(524,'2024-10-03 20:00:10.315263','252','Bala Faila\'s I',1,'[{\"added\": {}}]',7,1),(525,'2024-10-03 20:00:39.348475','253','Bala Faila\'s II',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'authtoken','token'),(12,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(8,'portfolio','category'),(7,'portfolio','image'),(9,'portfolio','photographer'),(10,'portfolio','video'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-09-11 01:14:29.653476'),(2,'auth','0001_initial','2024-09-11 01:14:32.176740'),(3,'admin','0001_initial','2024-09-11 01:14:32.404207'),(4,'admin','0002_logentry_remove_auto_add','2024-09-11 01:14:32.413520'),(5,'admin','0003_logentry_add_action_flag_choices','2024-09-11 01:14:32.421775'),(6,'contenttypes','0002_remove_content_type_name','2024-09-11 01:14:32.530379'),(7,'auth','0002_alter_permission_name_max_length','2024-09-11 01:14:32.626976'),(8,'auth','0003_alter_user_email_max_length','2024-09-11 01:14:32.651839'),(9,'auth','0004_alter_user_username_opts','2024-09-11 01:14:32.660069'),(10,'auth','0005_alter_user_last_login_null','2024-09-11 01:14:32.739480'),(11,'auth','0006_require_contenttypes_0002','2024-09-11 01:14:32.744143'),(12,'auth','0007_alter_validators_add_error_messages','2024-09-11 01:14:32.753391'),(13,'auth','0008_alter_user_username_max_length','2024-09-11 01:14:32.851371'),(14,'auth','0009_alter_user_last_name_max_length','2024-09-11 01:14:32.949290'),(15,'auth','0010_alter_group_name_max_length','2024-09-11 01:14:32.972984'),(16,'auth','0011_update_proxy_permissions','2024-09-11 01:14:32.981276'),(17,'auth','0012_alter_user_first_name_max_length','2024-09-11 01:14:33.081522'),(18,'sessions','0001_initial','2024-09-11 01:14:33.143582'),(19,'portfolio','0001_initial','2024-09-11 01:36:31.070443'),(20,'portfolio','0002_image_created_at','2024-09-11 19:00:12.460336'),(21,'portfolio','0003_image_image','2024-09-12 09:48:43.933448'),(22,'portfolio','0004_image_height_image_width','2024-09-14 13:00:57.165235'),(23,'portfolio','0005_image_client','2024-09-16 22:21:56.197190'),(24,'portfolio','0006_video','2024-09-17 19:31:40.757620'),(25,'portfolio','0007_video_video','2024-09-17 19:42:46.018990'),(26,'portfolio','0008_video_duration_video_height_video_width','2024-09-17 21:03:02.600382'),(27,'portfolio','0009_remove_image_url','2024-09-28 09:54:17.299835'),(28,'authtoken','0001_initial','2024-09-30 13:27:49.565206'),(29,'authtoken','0002_auto_20160226_1747','2024-09-30 13:27:49.607201'),(30,'authtoken','0003_tokenproxy','2024-09-30 13:27:49.627660'),(31,'authtoken','0004_alter_tokenproxy_options','2024-09-30 13:27:49.653618');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('da0o7qiib9xiplg7jqns5pyyrssy2ijc','.eJxVjDsOwjAQBe_iGlm246yzlPScIfJ-QgLIlvKpEHeHSCmgfTPzXqbP2zr226JzP4k5G29OvxtlfmjZgdxzuVXLtazzRHZX7EEXe62iz8vh_h2MeRm_tcaBiV3umhQCdCiD91F8Cyk13AI4J9RGTqCBoneEgSBHYFTUJIjm_QHXmTeA:1svGud:49sj3KLXIDrr6PfHij8mkV9d1wdDYCTFtj2MAVFQa8I','2024-10-14 13:58:07.535245');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_category`
--

DROP TABLE IF EXISTS `portfolio_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_category`
--

LOCK TABLES `portfolio_category` WRITE;
/*!40000 ALTER TABLE `portfolio_category` DISABLE KEYS */;
INSERT INTO `portfolio_category` VALUES (1,'Portraits','Portrait Photoshoots'),(2,'Weddings','The Happily Ever-Afters'),(3,'Products','Product Photoshoots'),(4,'Food','Food Photography'),(5,'Aerial','Features Drone Shots');
/*!40000 ALTER TABLE `portfolio_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_image`
--

DROP TABLE IF EXISTS `portfolio_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext,
  `photographer_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `height` int unsigned DEFAULT NULL,
  `width` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_image_photographer_id_d298018c_fk_portfolio` (`photographer_id`),
  CONSTRAINT `portfolio_image_photographer_id_d298018c_fk_portfolio` FOREIGN KEY (`photographer_id`) REFERENCES `portfolio_photographer` (`id`),
  CONSTRAINT `portfolio_image_chk_1` CHECK ((`height` >= 0)),
  CONSTRAINT `portfolio_image_chk_2` CHECK ((`width` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_image`
--

LOCK TABLES `portfolio_image` WRITE;
/*!40000 ALTER TABLE `portfolio_image` DISABLE KEYS */;
INSERT INTO `portfolio_image` VALUES (121,'Zee\'s reception at Madina I','Bride Zainab\'s entrance to her reception.',1,'2023-02-25 19:00:00.000000','images/IMG_2849_bmp.jpg',5472,3648),(122,'Zee\'s Headshot at her reception I','Bride Zainab\'s portrait headshot at her reception.',1,'2023-02-25 19:10:00.000000','images/IMG_2888_bmp.jpg',5472,3648),(123,'Zee\'s Portrait Full Body I','Bride Zainab\'s full body protrait picture.',1,'2023-02-25 19:15:00.000000','images/IMG_2902_bmp.jpg',5472,3648),(124,'Zee\'s Captivating Smile of Joy','Bride Zainab\'s captivation smile of joy.',1,'2023-02-25 19:18:00.000000','images/IMG_2994_bmp.jpg',5472,3648),(125,'Zee\'s Glamouring Native Outfit I','Bride Zainab in her stunning native wedding dress.',1,'2023-02-25 19:47:00.000000','images/IMG_3389_bmp.jpg',5472,3648),(126,'Zee\'s Glamouring Native Outfit I','Bride Zainab in her stunning native wedding dress II.',1,'2023-02-25 19:50:00.000000','images/IMG_3671_bmp.jpg',5472,3648),(127,'Zee\'s Contagious Smile to the Camera','Bride Zainab\'s smile to the camera.',1,'2023-02-26 10:00:00.000000','images/IMG_4400_bmp.jpg',5472,3648),(128,'Zee at her in-laws','Bride Zainab at the residence of her in-laws.',1,'2023-02-26 12:00:00.000000','images/IMG_4405_bmp.jpg',5472,3648),(129,'Zee at her Sunday Reception','Bride Zainab at her Sunday Reception, smiling to a familiar face.',1,'2023-02-26 16:00:00.000000','images/IMG_4620_bmp.jpg',5472,3648),(130,'Zee\'s Reception at her Family\'s I','Bride Zainab\'s reception at her family home.',1,'2023-02-26 18:00:00.000000','images/IMG_4686_bmp.jpg',5472,3648),(131,'Headshot of Zee\'s at Family\'s','Bride Zainab\'s headshot at family\'s residence - reception.',1,'2023-02-26 19:05:00.000000','images/IMG_4750_bmp.jpg',5472,3648),(132,'Full bodyshot of Zee at Family\'s','Bride Zainab\'s full bodyshot at family\'s residence - reception II',1,'2023-02-26 19:10:00.000000','images/IMG_4763_bmp.jpg',5472,3648),(133,'Heashot of Zee at Family\'s Reception I','',1,'2023-02-26 19:40:00.000000','images/IMG_4919_bmp.jpg',5472,3648),(134,'Heashot of Zee at Family\'s Reception II','',1,'2023-02-26 19:43:00.000000','images/IMG_4936_bmp.jpg',5472,3648),(135,'Heashot of Zee at Family\'s Reception III','',1,'2023-02-26 20:00:00.000000','images/IMG_4941_bmp.jpg',5472,3648),(136,'Product Shoot of a Wrist Watch I','',1,'2023-02-01 16:07:49.000000','images/IMG_1784_1.jpg',3539,5309),(137,'Product Shoot of a Wrist Watch II','',1,'2023-02-01 16:08:55.000000','images/IMG_1807_1.jpg',5022,3348),(138,'Product Shoot of a Wrist Watch III','',1,'2023-02-01 16:09:59.000000','images/IMG_1810_1.jpg',4896,3264),(139,'Backshot of our CEO','Displaying our brand!',1,'2024-01-21 13:50:00.000000','images/IMG_1208.jpg',5472,3648),(140,'Nafisa and Hussein\'s Reception I','',1,'2023-03-11 17:10:00.000000','images/IMG_5717_bmp.jpg',3413,5120),(141,'Nafisa and Hussein\'s Reception II','',1,'2023-03-11 17:12:05.000000','images/IMG_5423_bmp.jpg',5466,3644),(142,'Nafisa and Hussein\'s Reception III','',1,'2023-03-11 17:14:13.000000','images/IMG_5708_bmp.jpg',5466,3644),(143,'Nafisa and Hussein\'s Reception IV','',1,'2023-03-11 17:27:32.000000','images/IMG_5662_bmp.jpg',5466,3644),(144,'Hon Rash Political Image I','',1,'2023-07-09 14:25:34.000000','images/IMG_0251.jpg',5472,3648),(145,'Groom Hussein Sunday I','',1,'2023-03-12 11:15:18.000000','images/IMG_6534.jpg',5468,3645),(146,'Political Portrait of Hon Rash II','',1,'2023-07-09 15:03:19.000000','images/IMG_0283.jpg',5472,3648),(147,'Political Portrait of Hon Rash III','',1,'2023-07-09 15:39:35.000000','images/IMG_0357.jpg',5209,3473),(148,'Rwaid Concepts World Hausa Day Shoot','',1,'2023-08-27 14:01:01.000000','images/IMG_5689-1.jpg',5472,3648),(149,'Hausa Man - World Hausa Day Shoot','',1,'2023-08-27 14:03:19.000000','images/IMG_6030-1.jpg',5183,3455),(150,'Drama Group - World Hausa Day Shoot','',2,'2023-08-27 14:07:54.000000','images/IMG_6059-1.jpg',3648,5472),(151,'Aishah - World Hausa Day Shoot','',1,'2023-08-27 14:09:38.000000','images/IMG_6080-1.jpg',5472,3648),(152,'Fati White - World Hausa Day Shoot 2023','',2,'2023-08-27 16:04:45.000000','images/IMG_6096-1.jpg',5472,3648),(153,'Model I - World Hausa Day Shoot 2023','',2,'2023-08-27 16:06:08.000000','images/IMG_6102-1.jpg',5472,3648),(154,'Model II - World Hausa Day Shoot 2023','',2,'2023-08-27 16:13:18.000000','images/IMG_6108-3.jpg',3533,5300),(155,'Model III - World Hausa Day Shoot 2023','',2,'2023-08-27 16:15:11.000000','images/IMG_6106-3.jpg',5054,3369),(156,'Model IV - World Hausa Day Shoot 2023','',2,'2023-08-27 16:17:03.000000','images/IMG_6116-3.jpg',5472,3648),(157,'Ummu Umar - Arewa','',1,'2023-12-16 19:19:16.000000','images/IMG_0381.jpg',5266,3511),(158,'Bridesmaid I - Ummu Umar - Arewa','',1,'2023-12-16 19:23:01.000000','images/IMG_0026.jpg',5472,3648),(159,'Bridesmaid II - Ummu Umar - Arewa','',1,'2023-12-16 19:24:48.000000','images/IMG_0032.jpg',5210,3473),(160,'Bridesmaid III - Ummu Umar - Arewa','',1,'2023-12-16 19:26:59.000000','images/IMG_0035.jpg',5327,3551),(161,'Bridesmaid IV - Ummu Umar - Arewa','',1,'2023-12-16 19:28:10.000000','images/IMG_0049.jpg',5183,3455),(162,'Bridesmaid V - Ummu Umar - Arewa','',1,'2023-12-16 19:31:02.000000','images/IMG_0063.jpg',5112,3408),(163,'Bridesmaid V I- Ummu Umar - Arewa','',1,'2023-12-16 19:32:07.000000','images/IMG_0075.jpg',5262,3508),(164,'Bridesmaid VII - Ummu Umar - Arewa','',1,'2023-12-16 19:33:29.000000','images/IMG_0083.jpg',5190,3460),(165,'Bridesmaid VIII - Ummu Umar - Arewa','',1,'2023-12-16 19:34:30.000000','images/IMG_0087_2.jpg',5196,3464),(166,'Ummu Umar - Wedding Image I','',1,'2023-12-17 10:35:56.000000','images/IMG_0425.jpg',5338,3559),(167,'Ummu Umar - Wedding Image II','',1,'2023-12-17 10:37:11.000000','images/IMG_0426.jpg',5308,3539),(169,'Ummu Umar - Wedding Image III','',1,'2023-12-17 10:55:11.000000','images/IMG_0461.jpg',5305,3537),(170,'CEO and Director in a Frame','',3,'2023-12-09 10:13:13.000000','images/IMG_9840.jpg',3648,5472),(171,'Ghanaian child at the beach','',1,'2023-12-09 11:00:10.000000','images/IMG_9971.jpg',3648,5472),(172,'Lower Volta Bridge - Sogakope','',1,'2023-12-17 14:33:56.000000','images/Soga_Still.bmp',1080,1920),(173,'Bride Yasmin - Pre I','',1,'2024-01-06 11:00:47.000000','images/IMG_0028-Edit.jpg',5429,3619),(174,'Bride Yasmin - Pre II','',1,'2024-01-06 11:35:30.000000','images/IMG_0155-Edit.jpg',5472,3648),(175,'Bride Yasmin - Groom Abdul-Lahie I','',2,'2024-01-07 11:00:43.000000','images/IMG_0378-1.jpg',5472,3648),(176,'Bride Yasmin - Groom Abdul-Lahie II','',2,'2024-01-07 15:02:02.000000','images/IMG_0428.jpg',5472,3648),(177,'Nasihat - Pre I','',1,'2024-01-28 14:04:40.000000','images/IMG_1570-1.jpg',5944,3962),(178,'Nasihat - Pre II','',1,'2024-01-28 14:09:25.000000','images/IMG_1588.jpg',5472,3648),(179,'Nasihat - Pre III','',1,'2024-01-28 14:18:21.000000','images/IMG_1640.jpg',6111,4074),(180,'Nasihat - Pre IV','',1,'2024-01-28 15:34:10.000000','images/IMG_1680.jpg',5472,3648),(181,'Nasihat - Pre V','',1,'2024-01-28 16:42:35.000000','images/IMG_1828.jpg',5472,3648),(182,'Nasihat - Pre VI','',1,'2024-01-28 16:34:47.000000','images/IMG_1865.jpg',6328,4220),(183,'Nasihat\'s Husband - Midshot','',1,'2024-02-04 10:09:40.000000','images/IMG_1980-Edit.jpg',5472,3648),(184,'Nasihat and Husband','',1,'2024-02-04 10:16:27.000000','images/IMG_2000-Edit.jpg',5390,3593),(185,'Nasihat Headshot Single','',1,'2024-02-04 10:36:50.000000','images/IMG_2029-Edit.jpg',5314,3543),(186,'Nasihat\'s Ring','',1,'2024-02-04 10:39:29.000000','images/IMG_2039-Edit.jpg',5472,3648),(187,'Nasihat Mid Shot','',1,'2024-02-04 10:44:58.000000','images/IMG_2049-Edit.jpg',5126,3417),(188,'Rukayya\'s Graduation Headshot','',1,'2024-02-11 11:36:44.000000','images/IMG_2527-Edit.jpg',5472,3648),(189,'Rukayya\'s Graduation Holding up Certificate','',1,'2024-02-11 11:39:17.000000','images/IMG_2529-Edit.jpg',5472,3648),(190,'Rukayya and Husband','',1,'2024-02-11 11:44:48.000000','images/IMG_2544-Edit.jpg',5472,3648),(191,'HovKid Photoshoot I','',1,'2024-03-30 14:05:10.000000','images/HOVKID_2510.jpg',5472,3648),(192,'HovKid Photoshoot II','',1,'2024-03-30 14:22:01.000000','images/HOVKID_2559.jpg',5472,3648),(193,'HovKid Photoshoot III','',1,'2024-03-30 14:24:44.000000','images/HOVKID_2588.jpg',5379,3586),(194,'Five Star Waakye - Food I','',1,'2024-06-23 16:27:55.000000','images/IMG_2747-1.jpg',3648,5472),(195,'Five Star Waakye - Food II','',1,'2024-06-23 16:37:21.000000','images/IMG_2755-1.jpg',3405,5107),(197,'Five Star Waaakye - CEO','',1,'2024-06-23 18:45:20.000000','images/IMG_2789-1.jpg',5472,3648),(198,'Five Star Waakye - Director','',1,'2024-06-23 18:51:20.000000','images/IMG_2805-1.jpg',5472,3648),(199,'Five Star Waakye - CEO and Director','',1,'2024-06-23 18:53:38.000000','images/IMG_2810-1.jpg',5293,3529),(200,'Fati White - Arewa I','',1,'2024-07-27 16:01:54.000000','images/IMG_0946.jpg',4762,3105),(201,'Fati White - Arewa II','',2,'2024-07-27 17:02:40.000000','images/IMG_1025.jpg',5472,3648),(202,'Fati White - Arewa III','',1,'2024-07-27 17:05:07.000000','images/IMG_1038.jpg',5306,3537),(203,'Fati White - Arewa IV','',1,'2024-07-27 17:42:53.000000','images/IMG_1118.jpg',5472,3648),(204,'Fati White - Arewa V','',1,'2024-07-27 18:04:54.000000','images/IMG_1151.jpg',5472,3648),(205,'Fati White - Arewa VI','',1,'2024-07-27 18:17:51.000000','images/IMG_1157.jpg',5264,3510),(206,'Osman and Fati I','',1,'2024-07-28 12:50:43.000000','images/IMG_1289.jpg',5434,3623),(207,'Osman and Fati II','',1,'2024-07-28 12:52:35.000000','images/IMG_1297.jpg',5472,3648),(208,'Fati White - Sunday Reception I','',1,'2024-07-28 16:55:01.000000','images/IMG_1492.jpg',5472,3648),(209,'Fati White - Sunday Reception II','',1,'2024-07-28 17:25:49.000000','images/IMG_1497.jpg',5472,3648),(210,'Fati White - Sunday Reception III','',1,'2024-07-28 18:04:27.000000','images/IMG_1680_2.jpg',5140,3427),(211,'Five Star Waakye - Food I','',1,'2023-08-13 16:07:40.000000','images/Copy_of_IMG_1561-1.jpg',4920,3280),(212,'Five Star Waakye - Food II','',1,'2023-08-13 16:18:00.000000','images/Copy_of_IMG_1642.jpg',3648,5472),(213,'Five Star Waakye - Food III','',1,'2023-08-13 16:19:14.000000','images/Copy_of_IMG_1650-1.jpg',3648,5472),(214,'Five Star Waakye - Food IV','',1,'2023-08-13 16:20:00.000000','images/Copy_of_IMG_1669-1.jpg',3648,5472),(215,'Five Star Waakye - Food V','',1,'2023-08-13 16:40:02.000000','images/Copy_of_IMG_1682-1.jpg',5241,3494),(216,'Five Star Waakye - Food VI','',1,'2023-08-13 17:10:49.000000','images/Copy_of_IMG_1713-1.jpg',3648,5472),(217,'Baby Naziyat - Photoshoot I','',1,'2024-02-18 10:22:44.000000','images/IMG_0048-Edit.jpg',5472,3648),(218,'Baby Naziyat - Photoshoot II','',1,'2024-02-18 10:30:04.000000','images/IMG_0090-Edit.jpg',5472,3648),(219,'Baby Naziyat - Photoshoot III','',1,'2024-02-18 11:12:35.000000','images/IMG_0152-Edit.jpg',5472,3648),(220,'Baby Naziyat - Photoshoot IV','',1,'2024-02-18 12:30:54.000000','images/IMG_0387.jpg',5472,3648),(221,'Aerial of Sabon Zango','',1,'2024-02-25 17:54:49.000000','images/DJI_0591-Edit.jpg',2974,3965),(222,'Airtad\'s Trip to Kwame Nkrumah Museum I','',1,'2024-02-29 14:28:47.000000','images/DSC09607.jpg',4000,6000),(223,'Airtad\'s Trip to Kwame Nkrumah Museum II','',1,'2024-02-29 14:34:54.000000','images/DSC09646.jpg',3919,5879),(224,'Airtad\'s Trip to Kwame Nkrumah Museum III','',1,'2024-02-29 14:50:52.000000','images/DSC09702.jpg',4000,6000),(225,'Hajia Halima I','',1,'2023-11-05 12:00:00.000000','images/IMG_9663-1.jpg',5256,3504),(226,'Hajia Halima II','',1,'2023-11-05 12:10:00.000000','images/IMG_9620-1_2.jpg',5472,3648),(227,'Hajia Halima III','',1,'2023-11-05 12:20:00.000000','images/IMG_9704-1.jpg',5449,3633),(228,'Hajiya Halima IV','',1,'2023-11-05 12:30:00.000000','images/IMG_9719-1.jpg',5460,3640),(229,'Nasihat Pre','',2,'2024-01-28 17:15:26.000000','images/IMG_1852.jpg',5472,3648),(230,'Nasihat and Husband II','',1,'2024-02-04 10:17:33.000000','images/IMG_2004-Edit.jpg',5409,3606),(231,'Rukayya\'s Graduation Full Shot','',1,'2024-02-11 12:42:58.000000','images/IMG_2590-Edit.jpg',5472,3648),(232,'Sista\'s Naming Ceremony I','',1,'2024-08-10 11:26:47.000000','images/IMG_2000-Edit_2.jpg',5472,3648),(233,'Sista\'s Naming Ceremony II','',1,'2024-08-10 11:45:01.000000','images/IMG_1994-Edit.jpg',5472,3648),(234,'Yisha Corolla et Bebe I','',1,'2023-02-19 10:00:00.000000','images/IMG_2166.jpg',5472,3648),(235,'Yisha Corolla et Bebe II','',1,'2023-02-19 11:00:00.000000','images/IMG_2327.jpg',5472,3648),(236,'Yisha Corolla et Bebe III','',1,'2023-02-19 12:55:41.000000','images/Copy_of_IMG_2125.jpg',5472,3648),(237,'Yisha Corolla et Bebe IV','',1,'2023-02-19 13:17:38.000000','images/IMG_2390.jpg',5472,3648),(238,'BelMa I','',1,'2022-06-12 11:56:49.000000','images/BelMa22-261.jpg',4016,6016),(239,'BelMa II','',1,'2022-06-12 12:25:20.000000','images/BelMa22-278.jpg',4016,6016),(240,'BelMa III','',1,'2022-06-11 18:26:11.000000','images/BelMa22-143.jpg',4016,6016),(241,'BelMa IV','',1,'2022-06-11 19:28:09.000000','images/BelMa22-157.jpg',3835,5855),(242,'BelMa V','',1,'2022-06-11 20:29:06.000000','images/BelMa22-171.jpg',6016,4016),(243,'Ummu Umar - Arewa','',1,'2023-12-16 19:43:50.000000','images/IMG_0249.jpg',5363,3575),(244,'Ummu Umar - Arewa II','',1,'2023-12-16 19:46:01.000000','images/IMG_0300.jpg',5301,3534),(245,'Ummu Umar - Wedding','',1,'2023-12-17 11:59:19.000000','images/IMG_0467_New.jpg',5397,3598),(246,'Food Photography I','',2,'2019-11-17 14:02:31.000000','images/IMG_7738.JPG',3501,5251),(247,'Food Photography II','',2,'2019-11-17 14:03:54.000000','images/IMG_7740.JPG',3589,5383),(248,'Food Photography III','',2,'2019-11-17 14:04:29.000000','images/IMG_7742.JPG',3569,5353),(249,'Food Photography IV','',2,'2019-11-17 14:05:59.000000','images/IMG_7744.JPG',3648,5472),(250,'Bala Faila\'s Friend I','',2,'2019-11-17 15:58:01.000000','images/IMG_7830.JPG',5472,3648),(251,'Bala Faila\'s Friend II','',2,'2019-11-17 15:59:09.000000','images/IMG_7836.JPG',5151,3434),(252,'Bala Faila\'s I','',2,'2019-11-17 15:59:39.000000','images/IMG_7962.JPG',3648,5472),(253,'Bala Faila\'s II','',2,'2019-11-17 16:00:10.000000','images/IMG_7970.JPG',3561,5341);
/*!40000 ALTER TABLE `portfolio_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_image_categories`
--

DROP TABLE IF EXISTS `portfolio_image_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_image_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portfolio_image_categories_image_id_category_id_b0623d12_uniq` (`image_id`,`category_id`),
  KEY `portfolio_image_cate_category_id_56b7d681_fk_portfolio` (`category_id`),
  CONSTRAINT `portfolio_image_cate_category_id_56b7d681_fk_portfolio` FOREIGN KEY (`category_id`) REFERENCES `portfolio_category` (`id`),
  CONSTRAINT `portfolio_image_cate_image_id_174b4092_fk_portfolio` FOREIGN KEY (`image_id`) REFERENCES `portfolio_image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_image_categories`
--

LOCK TABLES `portfolio_image_categories` WRITE;
/*!40000 ALTER TABLE `portfolio_image_categories` DISABLE KEYS */;
INSERT INTO `portfolio_image_categories` VALUES (167,121,1),(168,121,2),(169,122,1),(170,122,2),(171,123,1),(172,123,2),(173,124,1),(174,124,2),(175,125,1),(176,125,2),(177,126,1),(178,126,2),(179,127,1),(180,127,2),(181,128,1),(182,128,2),(183,129,1),(184,129,2),(185,130,1),(186,130,2),(187,131,1),(188,131,2),(189,132,1),(190,132,2),(191,133,1),(192,133,2),(193,134,1),(194,134,2),(195,135,1),(196,135,2),(197,136,3),(198,137,3),(199,138,3),(200,139,1),(201,140,1),(202,140,2),(203,141,1),(204,141,2),(205,142,1),(206,142,2),(207,143,1),(208,143,2),(209,144,1),(210,145,1),(211,145,2),(212,146,1),(213,147,1),(214,148,1),(215,149,1),(216,150,1),(217,151,1),(218,152,1),(219,153,1),(220,154,1),(221,155,1),(222,156,1),(223,157,1),(224,157,2),(225,158,1),(226,159,1),(227,160,1),(228,161,1),(229,162,1),(230,163,1),(231,164,1),(232,165,1),(233,166,1),(234,166,2),(235,167,1),(236,167,2),(237,169,1),(238,169,2),(241,170,1),(242,171,1),(243,172,5),(244,173,1),(245,173,2),(246,174,1),(247,174,2),(248,175,1),(249,175,2),(250,176,1),(251,176,2),(252,177,1),(253,178,1),(254,179,1),(255,180,1),(256,181,1),(257,182,1),(258,183,1),(259,183,2),(260,184,1),(261,184,2),(262,185,1),(263,185,2),(264,186,1),(265,186,2),(266,187,1),(267,187,2),(268,188,1),(270,189,1),(271,190,1),(272,191,1),(273,192,1),(274,193,1),(275,194,4),(276,195,4),(278,197,1),(279,198,1),(280,199,1),(281,200,1),(282,200,2),(283,201,1),(284,201,2),(285,202,1),(286,202,2),(287,203,1),(288,203,2),(289,204,1),(290,204,2),(291,205,1),(292,205,2),(295,206,1),(296,206,2),(297,207,1),(298,207,2),(299,208,1),(300,208,2),(301,209,1),(302,209,2),(303,210,1),(304,210,2),(305,211,4),(306,212,4),(307,213,4),(308,214,4),(309,215,4),(310,216,4),(311,217,1),(312,218,1),(313,219,1),(314,220,1),(315,221,5),(316,222,1),(317,223,1),(318,224,1),(319,225,1),(320,226,1),(321,227,1),(322,228,1),(323,229,1),(324,230,1),(325,230,2),(326,231,1),(327,232,1),(328,233,1),(329,234,1),(330,234,2),(331,235,1),(332,235,2),(333,236,1),(334,236,2),(335,237,1),(336,237,2),(337,238,1),(338,238,2),(339,239,1),(340,239,2),(341,240,1),(342,240,2),(343,241,1),(344,241,2),(345,242,1),(346,242,2),(347,243,1),(352,243,2),(348,244,1),(351,244,2),(349,245,1),(350,245,2),(353,246,4),(354,247,4),(355,248,4),(356,249,4),(357,250,1),(358,251,1),(359,252,1),(360,253,1);
/*!40000 ALTER TABLE `portfolio_image_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_image_client`
--

DROP TABLE IF EXISTS `portfolio_image_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_image_client` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portfolio_image_client_image_id_user_id_01cac2bc_uniq` (`image_id`,`user_id`),
  KEY `portfolio_image_client_user_id_04490f99_fk_auth_user_id` (`user_id`),
  CONSTRAINT `portfolio_image_client_image_id_f9aad43b_fk_portfolio_image_id` FOREIGN KEY (`image_id`) REFERENCES `portfolio_image` (`id`),
  CONSTRAINT `portfolio_image_client_user_id_04490f99_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_image_client`
--

LOCK TABLES `portfolio_image_client` WRITE;
/*!40000 ALTER TABLE `portfolio_image_client` DISABLE KEYS */;
INSERT INTO `portfolio_image_client` VALUES (8,139,2);
/*!40000 ALTER TABLE `portfolio_image_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_photographer`
--

DROP TABLE IF EXISTS `portfolio_photographer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_photographer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `bio` longtext,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_photographer`
--

LOCK TABLES `portfolio_photographer` WRITE;
/*!40000 ALTER TABLE `portfolio_photographer` DISABLE KEYS */;
INSERT INTO `portfolio_photographer` VALUES (1,'Yushahu Yussif Azara','Yushahu Yussif is a seasoned professional photographer, who has worked with diverse clients through BMP Studio, the firm he is a director of.','yyushahu02@gmail.com','+233 59 481 0608'),(2,'Iddris Mohammed','Iddris Mohammed, CEO of BMP Studio is a seasoned professional photographer with years of experience under his belt. His brings to table diverse and creative ways to execute sessions, which leaves a lasting impact on clients.','iddibobo@gmail.com','+233 24 201 4759'),(3,'Gabriel Asampana','','gabrielasampana@gmail.com',NULL);
/*!40000 ALTER TABLE `portfolio_photographer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_video`
--

DROP TABLE IF EXISTS `portfolio_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_video` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext,
  `url` varchar(1000) NOT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `photographer_id` bigint NOT NULL,
  `video` varchar(100) DEFAULT NULL,
  `duration` double DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `width` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_video_photographer_id_ecd273e9_fk_portfolio` (`photographer_id`),
  CONSTRAINT `portfolio_video_photographer_id_ecd273e9_fk_portfolio` FOREIGN KEY (`photographer_id`) REFERENCES `portfolio_photographer` (`id`),
  CONSTRAINT `portfolio_video_chk_1` CHECK ((`height` >= 0)),
  CONSTRAINT `portfolio_video_chk_2` CHECK ((`width` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_video`
--

LOCK TABLES `portfolio_video` WRITE;
/*!40000 ALTER TABLE `portfolio_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-04  0:39:40
