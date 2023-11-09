-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: crypto_sliv_bot
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add course',7,'add_course'),(26,'Can change course',7,'change_course'),(27,'Can delete course',7,'delete_course'),(28,'Can view course',7,'view_course'),(29,'Can add plan',8,'add_plan'),(30,'Can change plan',8,'change_plan'),(31,'Can delete plan',8,'delete_plan'),(32,'Can view plan',8,'view_plan'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add channel id',10,'add_channelid'),(38,'Can change channel id',10,'change_channelid'),(39,'Can delete channel id',10,'delete_channelid'),(40,'Can view channel id',10,'view_channelid'),(41,'Can add users to approve',11,'add_userstoapprove'),(42,'Can change users to approve',11,'change_userstoapprove'),(43,'Can delete users to approve',11,'delete_userstoapprove'),(44,'Can view users to approve',11,'view_userstoapprove'),(45,'Can add admin data',12,'add_admindata'),(46,'Can change admin data',12,'change_admindata'),(47,'Can delete admin data',12,'delete_admindata'),(48,'Can view admin data',12,'view_admindata');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$Pj9hLDLX8JAZ7eLtmCgvLF$58OHEtSGNfbfu2UzO+3Y+HN1b8COd00HBEcsvL9Lbek=','2023-10-31 22:26:23.650783',1,'lolka0d','','','',1,1,'2023-08-15 20:15:10.191621');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-08-15 20:32:09.151016','1','Основний - 2023-08-15 20:32:09.150217+00:00',1,'[{\"added\": {}}]',8,1),(2,'2023-08-15 20:33:01.149307','1','Основний - 2023-08-15 20:33:01.148714+00:00',1,'[{\"added\": {}}]',7,1),(3,'2023-08-16 09:24:26.176307','2','M. Petrushkevych - None',2,'[{\"changed\": {\"fields\": [\"Is admin\"]}}]',9,1),(4,'2023-08-16 10:27:53.065208','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Is admin\"]}}]',9,1),(5,'2023-08-16 10:53:01.559960','1','Основний - 2023-08-15 20:32:09.150217+00:00',2,'[]',8,1),(6,'2023-08-16 10:53:08.295761','1','Основний - 2023-08-15 20:32:09.150217+00:00',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(7,'2023-08-16 10:53:33.618582','1','Основний - 2023-08-15 20:32:09.150217+00:00',2,'[]',8,1),(8,'2023-08-16 10:53:46.540363','1','Основний - 2023-08-15 20:33:01.148714+00:00',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),(9,'2023-08-16 12:45:52.633128','1','Основний - 2023-08-15 20:32:09.150217+00:00',2,'[{\"changed\": {\"fields\": [\"Channels\"]}}]',8,1),(10,'2023-08-16 20:14:10.597503','1','Основний - 2023-08-15 20:32:09.150217+00:00',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(11,'2023-08-16 20:16:06.680360','1','Основний - 2023-08-15 20:32:09.150217+00:00',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(12,'2023-08-16 20:16:20.444072','1','Основний - 2023-08-15 20:33:01.148714+00:00',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),(13,'2023-08-17 09:41:15.508506','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(14,'2023-08-17 09:42:08.794611','2','M. Petrushkevych - None',2,'[]',9,1),(15,'2023-08-17 12:30:47.923475','1','Основний - 2023-08-15 20:33:01.148714+00:00',2,'[{\"changed\": {\"fields\": [\"Courses\"]}}]',7,1),(16,'2023-08-17 12:41:16.419210','1','Основний - 2023-08-15 20:33:01.148714+00:00',2,'[{\"changed\": {\"fields\": [\"Courses\"]}}]',7,1),(17,'2023-08-17 12:41:19.934941','1','Основний - 2023-08-15 20:33:01.148714+00:00',2,'[]',7,1),(18,'2023-08-18 21:36:25.969440','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(19,'2023-08-20 09:38:13.134531','2','1970247612 - 2023-08-19 21:58:21.783627+00:00',3,'',8,1),(20,'2023-08-20 14:41:21.141426','4','Max - None',2,'[{\"changed\": {\"fields\": [\"Plan\", \"Course\"]}}]',9,1),(21,'2023-08-20 14:41:27.739869','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Plan\", \"Course\"]}}]',9,1),(22,'2023-08-20 14:41:31.346498','2','M. Petrushkevych - None',2,'[]',9,1),(23,'2023-08-20 14:41:33.895714','1','Marakya - None',2,'[]',9,1),(24,'2023-08-20 14:41:46.932151','3','1970247612 - 2023-08-20 09:35:43.707319+00:00',3,'',8,1),(25,'2023-08-20 14:41:54.125046','3','Сергій - None',2,'[]',9,1),(26,'2023-08-20 14:42:02.542520','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(27,'2023-08-20 14:42:05.252710','1','Marakya - None',2,'[]',9,1),(28,'2023-08-20 14:44:14.169443','1','Marakya - None',2,'[]',9,1),(29,'2023-08-20 14:44:16.080359','2','M. Petrushkevych - None',2,'[]',9,1),(30,'2023-08-20 14:44:22.416482','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(31,'2023-08-20 14:44:36.807842','4','Max - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(32,'2023-08-20 14:44:42.014047','5','amir - None',2,'[]',9,1),(33,'2023-08-20 14:44:48.117652','6','Tumobog - None',2,'[]',9,1),(34,'2023-08-20 14:44:51.650631','6','Tumobog - None',2,'[]',9,1),(35,'2023-08-20 14:44:58.469284','7','Аркадий - None',2,'[]',9,1),(36,'2023-08-20 14:45:06.437084','8','Artur Lebedev - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(37,'2023-08-20 14:45:20.267107','4','Max - None',2,'[]',9,1),(38,'2023-08-20 14:45:26.442736','4','Max - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(39,'2023-08-20 14:50:02.572171','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Plan\", \"Course\"]}}]',9,1),(40,'2023-08-20 14:50:20.618102','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(41,'2023-08-20 14:50:45.383099','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(42,'2023-08-20 14:51:32.951579','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(43,'2023-08-20 14:52:03.069618','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(44,'2023-08-20 14:52:54.776351','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(45,'2023-08-20 14:53:57.083391','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(46,'2023-08-20 14:56:27.277398','3','Сергій - None',2,'[]',9,1),(47,'2023-08-20 14:58:56.841277','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(48,'2023-08-20 14:59:12.586012','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(49,'2023-08-20 14:59:32.659606','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(50,'2023-08-20 15:00:03.868532','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(51,'2023-08-20 15:00:32.180323','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(52,'2023-08-20 15:03:48.680504','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Plan\", \"Course\"]}}]',9,1),(53,'2023-08-20 18:28:52.152576','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Plan\", \"Course\"]}}]',9,1),(54,'2023-08-20 18:28:58.669050','1','Основний - 2023-08-15 20:32:09.150217+00:00',2,'[]',8,1),(55,'2023-08-20 18:29:17.573555','5','1970247612 - 2023-08-20 18:29:17.572790+00:00',1,'[{\"added\": {}}]',8,1),(56,'2023-08-20 18:30:20.321016','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(57,'2023-08-20 18:34:42.716446','3','Сергій - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(58,'2023-08-20 18:38:20.549704','3','Сергій - None',2,'[]',9,1),(59,'2023-08-20 18:51:42.402775','3','Сергій - 18',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(60,'2023-08-20 18:52:34.017143','3','Сергій - 6',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(61,'2023-08-21 08:45:39.883717','3','Сергій - 13',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(62,'2023-08-21 09:02:02.299085','1','Marakya - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(63,'2023-08-21 09:02:10.848601','1','Marakya - None',2,'[]',9,1),(64,'2023-08-21 09:10:19.405483','1','Marakya - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(65,'2023-08-21 09:11:03.669044','1','Marakya - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(66,'2023-08-21 09:11:13.025538','1','Marakya - None',2,'[]',9,1),(67,'2023-08-21 19:24:57.070668','1','AR PREMIUM (Алексей Руденко) - -1001972083375',1,'[{\"added\": {}}]',11,1),(68,'2023-08-21 19:25:28.184757','1','AR PREMIUM (Алексей Руденко) - -1001972083375',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(69,'2023-08-21 19:29:15.435631','1','AR PREMIUM (Алексей Руденко) - -1001972083375',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(70,'2023-08-21 19:31:01.381192','1','AR PREMIUM (Алексей Руденко) - -1001972083375',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(71,'2023-08-21 19:41:00.169792','1','AR PREMIUM (Алексей Руденко) - -1001972083375',3,'',11,1),(72,'2023-08-21 20:33:19.721376','1','Основний - 2023-08-15 20:32:09.150217+00:00',2,'[{\"changed\": {\"fields\": [\"Channels\"]}}]',8,1),(73,'2023-08-21 20:33:28.607136','1','Основний - 2023-08-15 20:32:09.150217+00:00',2,'[]',8,1),(74,'2023-08-21 20:35:09.051870','7','1970247612 - 2023-08-21 08:47:22.103847+00:00',2,'[{\"changed\": {\"fields\": [\"Channels\"]}}]',8,1),(75,'2023-08-21 20:44:40.246651','7','1970247612 - 2023-08-21 08:47:22.103847+00:00',3,'',8,1),(76,'2023-08-21 20:44:57.495047','3','Сергій - 18',2,'[{\"changed\": {\"fields\": [\"Plan\", \"Course\", \"Active to\"]}}]',9,1),(77,'2023-08-21 20:47:57.168681','9','6110011271 - 2023-08-21 20:45:32.232688+00:00',3,'',8,1),(78,'2023-08-21 20:53:14.759767','18','6110011271 - 2023-08-21 20:51:00.737479+00:00',3,'',8,1),(79,'2023-08-21 20:53:14.761104','17','False - 2023-08-21 20:50:15.464327+00:00',3,'',8,1),(80,'2023-08-21 20:53:14.762284','16','False - 2023-08-21 20:49:10.926065+00:00',3,'',8,1),(81,'2023-08-21 20:53:14.763521','15','False - 2023-08-21 20:48:38.444353+00:00',3,'',8,1),(82,'2023-08-21 20:53:14.764645','14','False - 2023-08-21 20:48:22.113835+00:00',3,'',8,1),(83,'2023-08-21 20:53:14.765721','13','False - 2023-08-21 20:48:13.655322+00:00',3,'',8,1),(84,'2023-08-21 20:53:14.766492','12','False - 2023-08-21 20:48:09.018855+00:00',3,'',8,1),(85,'2023-08-21 20:53:14.767987','11','False - 2023-08-21 20:48:06.550867+00:00',3,'',8,1),(86,'2023-08-21 20:53:14.769903','10','False - 2023-08-21 20:48:06.272068+00:00',3,'',8,1),(87,'2023-08-21 20:53:26.020271','21','GENESIS PRIVATE - -1001981159396',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(88,'2023-08-21 21:00:02.971738','22','Ковчег - -1001969474431',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(89,'2023-08-21 21:00:08.004168','21','GENESIS PRIVATE - -1001981159396',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(90,'2023-08-21 21:00:11.531218','20','Биржевой монарх - -1001950668867',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(91,'2023-08-21 21:00:14.956509','19','Алиев Азиз | Альткоины - -1001830810630',2,'[]',11,1),(92,'2023-08-21 21:00:23.300931','19','6110011271 - 2023-08-21 20:57:48.803299+00:00',3,'',8,1),(93,'2023-08-21 21:00:44.404005','1','Marakya - None',2,'[{\"changed\": {\"fields\": [\"Plan\", \"Course\", \"Active to\"]}}]',9,1),(94,'2023-08-21 21:02:44.327287','22','Ковчег - -1001969474431',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(95,'2023-08-21 21:03:01.004878','1','Marakya - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(96,'2023-08-21 21:03:11.727546','20','6110011271 - 2023-08-21 21:01:44.816744+00:00',3,'',8,1),(97,'2023-08-21 21:09:58.462230','22','Ковчег - -1001969474431',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(98,'2023-08-21 21:10:25.576221','21','6110011271 - 2023-08-21 21:06:21.639064+00:00',3,'',8,1),(99,'2023-08-21 21:10:35.503127','3','Сергій - 9',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(100,'2023-08-21 21:10:50.802566','1','Marakya - None',2,'[{\"changed\": {\"fields\": [\"Plan\", \"Course\", \"Active to\"]}}]',9,1),(101,'2023-08-21 21:10:58.189295','1','Marakya - None',2,'[]',9,1),(102,'2023-08-21 21:13:58.355465','22','Ковчег - -1001969474431',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(103,'2023-08-21 21:14:15.100676','1','Marakya - None',2,'[{\"changed\": {\"fields\": [\"Plan\", \"Course\", \"Active to\"]}}]',9,1),(104,'2023-08-21 21:14:23.350282','22','6110011271 - 2023-08-21 21:11:22.765057+00:00',3,'',8,1),(105,'2023-08-21 21:18:07.095191','1','Marakya - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(106,'2023-08-21 21:25:23.392082','1','Marakya - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(107,'2023-08-21 21:37:43.430014','1','Marakya - None',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(108,'2023-08-22 17:19:03.897458','3','Сергій - 2',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(109,'2023-08-31 18:24:34.545466','1','main',1,'[{\"added\": {}}]',12,1),(110,'2023-09-07 18:21:55.654150','22','Ковчег - -1001969474431',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(111,'2023-09-07 18:22:31.194572','21','GENESIS PRIVATE - -1001981159396',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(112,'2023-09-07 19:19:14.369928','26','107933705 - 2023-09-01 14:17:17.843630+00:00',3,'',8,1),(113,'2023-09-07 19:20:29.870825','9','107933705',2,'[{\"changed\": {\"fields\": [\"Plan\", \"Course\", \"Active to\"]}}]',9,1),(114,'2023-09-07 19:22:32.131800','9','107933705',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(115,'2023-09-07 19:22:44.952661','9','107933705',2,'[{\"changed\": {\"fields\": [\"Active to\"]}}]',9,1),(116,'2023-09-08 20:55:09.933978','53','5284027175 - 2023-09-08 20:49:28.477803+00:00',3,'',8,1),(117,'2023-09-08 20:55:09.949188','52','5284027175 - 2023-09-08 20:42:43.183573+00:00',3,'',8,1),(118,'2023-09-24 14:36:43.454694','116','Основний - 2023-09-24 14:36:43.452299+00:00',1,'[{\"added\": {}}]',8,1),(119,'2023-10-14 17:50:32.575287','146','1600252414 - 2023-10-08 08:52:44.749619+00:00',3,'',8,1),(120,'2023-10-14 17:50:32.593517','145','1600252414 - 2023-10-08 08:52:36.621993+00:00',3,'',8,1),(121,'2023-10-14 17:50:32.652383','144','1600252414 - 2023-10-08 08:52:32.480135+00:00',3,'',8,1),(122,'2023-10-14 17:50:32.698873','143','1600252414 - 2023-10-08 08:52:30.329720+00:00',3,'',8,1),(123,'2023-10-14 17:50:32.708585','142','1600252414 - 2023-10-08 08:52:28.317890+00:00',3,'',8,1),(124,'2023-10-14 17:50:32.711225','141','1600252414 - 2023-10-08 08:52:28.192807+00:00',3,'',8,1),(125,'2023-10-14 17:50:32.713762','140','1600252414 - 2023-10-08 08:51:24.074669+00:00',3,'',8,1),(126,'2023-10-14 17:50:32.716410','139','1600252414 - 2023-10-08 08:50:51.927192+00:00',3,'',8,1),(127,'2023-10-14 17:50:32.719292','138','1600252414 - 2023-10-08 08:50:35.785057+00:00',3,'',8,1),(128,'2023-10-14 17:50:32.724345','137','1600252414 - 2023-10-08 08:50:27.640981+00:00',3,'',8,1),(129,'2023-10-14 17:50:32.738424','136','1600252414 - 2023-10-08 08:50:23.491965+00:00',3,'',8,1),(130,'2023-10-14 17:50:32.772275','135','1600252414 - 2023-10-08 08:50:21.377203+00:00',3,'',8,1),(131,'2023-10-14 17:50:32.778886','134','1600252414 - 2023-10-08 08:50:21.207705+00:00',3,'',8,1),(132,'2023-10-14 17:52:39.952502','149','Основний - 2023-10-14 17:52:39.936696+00:00',1,'[{\"added\": {}}]',8,1),(133,'2023-10-16 10:02:27.721343','148','1970247612 - 2023-10-13 11:31:54.480119+00:00',3,'',8,1),(134,'2023-10-16 10:03:10.661592','3','1970247612',2,'[{\"changed\": {\"fields\": [\"Plan\", \"Course\", \"Active to\"]}}]',9,1),(135,'2023-10-16 10:03:33.373854','22','Ковчег - -1001969474431',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(136,'2023-10-18 16:46:18.631135','22','Ковчег - -1001969474431',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(137,'2023-10-18 17:12:10.270048','19','Алиев Азиз | Альткоины - -1001830810630',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(138,'2023-10-18 17:16:58.447143','20','Биржевой монарх - -1001950668867',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(139,'2023-10-18 17:18:28.891131','17','Ladesov Crypto Priority - -1001961163087',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(140,'2023-10-18 17:20:30.087387','13','Слезы Сатоши - -1001684329284',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(141,'2023-10-18 17:21:07.649755','9','Crypto Student Club - -1001897518541',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(142,'2023-10-18 17:24:47.758215','1','main',2,'[{\"changed\": {\"fields\": [\"Data\"]}}]',12,1),(143,'2023-10-18 17:39:00.714015','1','main',2,'[{\"changed\": {\"fields\": [\"Data\"]}}]',12,1),(144,'2023-10-18 19:52:01.187844','1','6110011271',2,'[{\"changed\": {\"fields\": [\"Plan\", \"Course\"]}}]',9,1),(145,'2023-10-18 20:54:29.725244','54','6348211100 - 2023-09-08 21:01:48.876235+00:00',3,'',8,1),(146,'2023-10-18 20:55:58.143006','51','107933705 - 2023-09-07 19:21:54.034807+00:00',3,'',8,1),(147,'2023-10-18 21:03:59.423769','174','False - 2023-10-16 15:58:39.770642+00:00',3,'',8,1),(148,'2023-10-18 21:05:23.282925','166','376488524 - 2023-10-16 12:28:42.903504+00:00',3,'',8,1),(149,'2023-10-18 21:05:23.287082','165','376488524 - 2023-10-16 12:28:40.663390+00:00',3,'',8,1),(150,'2023-10-18 21:05:23.289783','164','376488524 - 2023-10-16 12:28:38.629450+00:00',3,'',8,1),(151,'2023-10-18 21:05:23.292384','163','376488524 - 2023-10-16 12:28:38.419425+00:00',3,'',8,1),(152,'2023-10-18 21:05:23.295383','162','376488524 - 2023-10-16 12:28:22.291825+00:00',3,'',8,1),(153,'2023-10-18 21:05:23.311862','161','376488524 - 2023-10-16 12:28:14.161878+00:00',3,'',8,1),(154,'2023-10-18 21:05:23.314630','160','376488524 - 2023-10-16 12:28:10.009924+00:00',3,'',8,1),(155,'2023-10-18 21:05:23.317880','159','376488524 - 2023-10-16 12:28:07.910614+00:00',3,'',8,1),(156,'2023-10-18 21:05:23.320305','158','376488524 - 2023-10-16 12:28:05.937222+00:00',3,'',8,1),(157,'2023-10-18 21:05:23.323251','157','376488524 - 2023-10-16 12:28:05.752046+00:00',3,'',8,1),(158,'2023-10-18 21:05:23.325872','156','376488524 - 2023-10-16 12:27:03.620881+00:00',3,'',8,1),(159,'2023-10-18 21:05:23.328363','155','376488524 - 2023-10-16 12:26:31.422719+00:00',3,'',8,1),(160,'2023-10-18 21:05:23.334425','154','376488524 - 2023-10-16 12:26:15.208098+00:00',3,'',8,1),(161,'2023-10-18 21:05:23.337241','153','376488524 - 2023-10-16 12:26:07.000172+00:00',3,'',8,1),(162,'2023-10-18 21:05:23.349422','152','376488524 - 2023-10-16 12:26:02.838667+00:00',3,'',8,1),(163,'2023-10-18 21:05:23.352877','151','376488524 - 2023-10-16 12:26:00.644724+00:00',3,'',8,1),(164,'2023-10-18 21:05:23.356801','150','376488524 - 2023-10-16 12:26:00.449046+00:00',3,'',8,1),(165,'2023-10-31 22:28:14.397262','220','6691399218 - 2023-10-27 09:03:22.297190+00:00',3,'',8,1),(166,'2023-10-31 22:28:14.400077','219','6691399218 - 2023-10-27 09:02:50.153529+00:00',3,'',8,1),(167,'2023-10-31 22:28:14.404385','218','6691399218 - 2023-10-27 09:02:34.010211+00:00',3,'',8,1),(168,'2023-10-31 22:28:14.406508','217','6691399218 - 2023-10-27 09:02:25.891630+00:00',3,'',8,1),(169,'2023-10-31 22:28:14.408406','216','6691399218 - 2023-10-27 09:02:21.766842+00:00',3,'',8,1),(170,'2023-10-31 22:28:14.410606','215','6691399218 - 2023-10-27 09:02:19.636405+00:00',3,'',8,1),(171,'2023-10-31 22:28:14.414344','214','6691399218 - 2023-10-27 09:02:19.480484+00:00',3,'',8,1),(172,'2023-10-31 22:28:14.416109','213','6691399218 - 2023-10-27 09:02:19.299185+00:00',3,'',8,1),(173,'2023-10-31 22:28:14.418275','212','6691399218 - 2023-10-27 09:02:16.878507+00:00',3,'',8,1),(174,'2023-10-31 22:28:14.420295','211','6691399218 - 2023-10-27 09:02:14.867768+00:00',3,'',8,1),(175,'2023-10-31 22:28:14.422148','210','6691399218 - 2023-10-27 09:01:58.685774+00:00',3,'',8,1),(176,'2023-10-31 22:28:14.424779','209','6691399218 - 2023-10-27 09:01:26.555101+00:00',3,'',8,1),(177,'2023-10-31 22:28:14.426418','208','6691399218 - 2023-10-27 09:01:10.433343+00:00',3,'',8,1),(178,'2023-10-31 22:28:14.428063','207','6691399218 - 2023-10-27 09:01:02.269248+00:00',3,'',8,1),(179,'2023-10-31 22:28:14.437865','206','6691399218 - 2023-10-27 09:00:57.686621+00:00',3,'',8,1),(180,'2023-10-31 22:28:14.440570','205','6691399218 - 2023-10-27 09:00:55.493547+00:00',3,'',8,1),(181,'2023-10-31 22:28:14.443195','204','6691399218 - 2023-10-27 09:00:53.470118+00:00',3,'',8,1),(182,'2023-10-31 22:28:14.446042','203','6691399218 - 2023-10-27 09:00:53.279548+00:00',3,'',8,1),(183,'2023-10-31 22:28:14.448666','202','6691399218 - 2023-10-27 09:00:37.128918+00:00',3,'',8,1),(184,'2023-10-31 22:28:14.452311','201','6691399218 - 2023-10-27 09:00:28.838877+00:00',3,'',8,1),(185,'2023-10-31 22:28:14.455368','200','6691399218 - 2023-10-27 09:00:24.660066+00:00',3,'',8,1),(186,'2023-10-31 22:28:14.457973','199','6691399218 - 2023-10-27 09:00:22.360173+00:00',3,'',8,1),(187,'2023-10-31 22:28:14.459873','198','6691399218 - 2023-10-27 09:00:20.353713+00:00',3,'',8,1),(188,'2023-10-31 22:28:14.462448','197','6691399218 - 2023-10-27 09:00:20.209418+00:00',3,'',8,1),(189,'2023-10-31 22:28:14.464399','196','6691399218 - 2023-10-27 08:59:48.080030+00:00',3,'',8,1),(190,'2023-10-31 22:28:14.467232','195','6691399218 - 2023-10-27 08:59:31.966726+00:00',3,'',8,1),(191,'2023-10-31 22:28:14.473180','194','6691399218 - 2023-10-27 08:59:23.841077+00:00',3,'',8,1),(192,'2023-10-31 22:28:14.476554','193','6691399218 - 2023-10-27 08:59:19.718085+00:00',3,'',8,1),(193,'2023-10-31 22:28:14.481057','192','6691399218 - 2023-10-27 08:59:17.617015+00:00',3,'',8,1),(194,'2023-10-31 22:28:14.482843','191','6691399218 - 2023-10-27 08:59:17.466522+00:00',3,'',8,1),(195,'2023-10-31 22:28:14.486752','190','6691399218 - 2023-10-27 08:59:17.373812+00:00',3,'',8,1),(196,'2023-10-31 22:28:14.488641','189','6691399218 - 2023-10-27 08:59:01.199538+00:00',3,'',8,1),(197,'2023-10-31 22:28:14.492201','188','6691399218 - 2023-10-27 08:58:52.942476+00:00',3,'',8,1),(198,'2023-10-31 22:28:14.494202','187','6691399218 - 2023-10-27 08:58:48.819563+00:00',3,'',8,1),(199,'2023-10-31 22:28:14.495665','186','6691399218 - 2023-10-27 08:58:46.415058+00:00',3,'',8,1),(200,'2023-10-31 22:28:14.497650','185','6691399218 - 2023-10-27 08:58:44.404035+00:00',3,'',8,1),(201,'2023-10-31 22:28:14.499770','184','6691399218 - 2023-10-27 08:58:44.258216+00:00',3,'',8,1),(202,'2023-10-31 22:28:14.501554','183','6691399218 - 2023-10-27 08:57:40.153296+00:00',3,'',8,1),(203,'2023-10-31 22:28:14.503432','182','6691399218 - 2023-10-27 08:57:07.999470+00:00',3,'',8,1),(204,'2023-10-31 22:28:14.505529','181','6691399218 - 2023-10-27 08:56:51.857064+00:00',3,'',8,1),(205,'2023-10-31 22:28:14.507007','180','6691399218 - 2023-10-27 08:56:43.723400+00:00',3,'',8,1),(206,'2023-10-31 22:28:14.509121','179','6691399218 - 2023-10-27 08:56:39.608366+00:00',3,'',8,1),(207,'2023-10-31 22:28:14.510805','178','6691399218 - 2023-10-27 08:56:37.487727+00:00',3,'',8,1),(208,'2023-10-31 22:38:27.913410','22','Ковчег - -1001969474431',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(209,'2023-10-31 22:48:06.097979','17','Ladesov Crypto Priority - -1001961163087',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(210,'2023-10-31 22:49:39.483078','13','Слезы Сатоши - -1001684329284',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(211,'2023-10-31 22:49:52.206084','12','Алиев Азиз | Биткоин - -1001506110672',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(212,'2023-10-31 22:50:30.376332','9','Crypto Student Club - -1001897518541',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(213,'2023-10-31 22:50:39.736089','9','Crypto Student Club - -1001897518541',2,'[]',11,1),(214,'2023-10-31 22:53:35.187993','3','Mozart - -1001887199326',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(215,'2023-10-31 22:53:43.471113','2','Pentagon 2.0 - -1001844384264',2,'[]',11,1),(216,'2023-10-31 22:57:58.219421','17','Ladesov Crypto Priority - -1001961163087',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(217,'2023-10-31 22:58:10.137923','17','Ladesov Crypto Priority - -1001961163087',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(218,'2023-11-05 22:49:23.954955','17','Ladesov Crypto Priority - -1001961163087',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1),(219,'2023-11-05 22:50:09.758775','22','Ковчег - -1001969474431',2,'[{\"changed\": {\"fields\": [\"Users ids\"]}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'main','admindata'),(10,'main','channelid'),(7,'main','course'),(8,'main','plan'),(9,'main','user'),(11,'main','userstoapprove'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-08-15 20:14:24.886619'),(2,'auth','0001_initial','2023-08-15 20:14:25.197207'),(3,'admin','0001_initial','2023-08-15 20:14:25.278904'),(4,'admin','0002_logentry_remove_auto_add','2023-08-15 20:14:25.291850'),(5,'admin','0003_logentry_add_action_flag_choices','2023-08-15 20:14:25.304668'),(6,'contenttypes','0002_remove_content_type_name','2023-08-15 20:14:25.359327'),(7,'auth','0002_alter_permission_name_max_length','2023-08-15 20:14:25.386621'),(8,'auth','0003_alter_user_email_max_length','2023-08-15 20:14:25.406047'),(9,'auth','0004_alter_user_username_opts','2023-08-15 20:14:25.419587'),(10,'auth','0005_alter_user_last_login_null','2023-08-15 20:14:25.454849'),(11,'auth','0006_require_contenttypes_0002','2023-08-15 20:14:25.457767'),(12,'auth','0007_alter_validators_add_error_messages','2023-08-15 20:14:25.473845'),(13,'auth','0008_alter_user_username_max_length','2023-08-15 20:14:25.492802'),(14,'auth','0009_alter_user_last_name_max_length','2023-08-15 20:14:25.512366'),(15,'auth','0010_alter_group_name_max_length','2023-08-15 20:14:25.539109'),(16,'auth','0011_update_proxy_permissions','2023-08-15 20:14:25.553480'),(17,'auth','0012_alter_user_first_name_max_length','2023-08-15 20:14:25.579522'),(18,'main','0001_initial','2023-08-15 20:14:25.606205'),(19,'main','0002_alter_user_name_alter_user_user_id','2023-08-15 20:14:25.649032'),(20,'main','0003_alter_user_name_alter_user_user_id','2023-08-15 20:14:25.658383'),(21,'main','0004_alter_user_name','2023-08-15 20:14:25.664596'),(22,'main','0005_alter_user_name_alter_user_user_id','2023-08-15 20:14:25.673918'),(23,'main','0006_remove_plan_duration','2023-08-15 20:14:25.691933'),(24,'main','0007_channelid_alter_user_hash','2023-08-15 20:14:25.728476'),(25,'sessions','0001_initial','2023-08-15 20:14:25.753263'),(26,'main','0008_userstoapprove_delete_channelid','2023-08-21 19:22:16.423325'),(27,'main','0009_admindata','2023-08-31 18:22:47.333272'),(28,'main','0010_remove_user_name','2023-09-02 10:29:14.043087');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7tp6o7eoxmbfkr9qrmape0xzmg8qfm0j','.eJxVjEEOwiAQRe_C2hCmDgy4dO8ZCDAgVUOT0q6Md7dNutDtf-_9t_BhXapfe579yOIiQJx-txjSM7cd8CO0-yTT1JZ5jHJX5EG7vE2cX9fD_TuoodetVqowGE1ksnZ4BtZkrCJggBRsiS5iGhAN0JAc6M3UhMjkOBZrHYvPF678NqM:1qbmKq:Iek5C_IAJJsrNarC7Hq9uyD9YJxN4-Q3AbfUtSjDo0M','2023-09-14 18:24:04.480162'),('d3kdtqx2djoslbmjf3ogyzkpklsmakvp','.eJxVjMEOwiAQBf-FsyFAgaUevfcbCLCLVA0kpT0Z_9026UGvb2bem_mwrcVvnRY_I7syyS6_WwzpSfUA-Aj13nhqdV3myA-Fn7TzqSG9bqf7d1BCL3ttUekEUg0OZEzRWMRMpJ1Ga4Ci1cGYJAeKGSjp3XZiFEHlAe0IUgD7fAHq6Tfb:1qtA4G:-1YZlUBzngh_3trMRtIqEHcVN_ABnfDmTx3d-5t_PXA','2023-11-01 17:10:48.433567'),('fuwbq2xaxgieintpxgzj180tb9idvhm8','.eJxVjMEOwiAQBf-FsyFAgaUevfcbCLCLVA0kpT0Z_9026UGvb2bem_mwrcVvnRY_I7syyS6_WwzpSfUA-Aj13nhqdV3myA-Fn7TzqSG9bqf7d1BCL3ttUekEUg0OZEzRWMRMpJ1Ga4Ci1cGYJAeKGSjp3XZiFEHlAe0IUgD7fAHq6Tfb:1qkQ8o:P-BmaIIzo_OmH2_7g8j3vediRbYp-4Lt7A_i_l9oGok','2023-10-08 14:31:22.841885'),('i74hg77t67llvsv37hoan16sxbjearxa','.eJxVjEEOwiAQRe_C2hCmDgy4dO8ZCDAgVUOT0q6Md7dNutDtf-_9t_BhXapfe579yOIiQJx-txjSM7cd8CO0-yTT1JZ5jHJX5EG7vE2cX9fD_TuoodetVqowGE1ksnZ4BtZkrCJggBRsiS5iGhAN0JAc6M3UhMjkOBZrHYvPF678NqM:1qW0Rj:nXhvV-r9Eo7oL7N5tyz6ATJEA0ocFWqos64v-dj0DAc','2023-08-29 20:15:19.809041'),('mn5pbifpoa3timjc6rbiu6coixrtwbjq','.eJxVjDsOwjAQBe_iGlk42Y1lSnrOYO0vJIBsKZ8q4u4QKQW0b2be5jKty5DX2aY8qru44E6_G5M8rexAH1Tu1UstyzSy3xV_0Nnfqtrrerh_BwPNw7fuSaMm66KaJmg7QGiN4dwIRAxIEoStsQaBY4cIYkrC3Cfl1lJg9_4A_jw48g:1qxxBn:YsB8FehFckne9lutRMYxSGnOcT2ofNkm9YMAY-GTtGU','2023-11-14 22:26:23.654033'),('tyfsciwc6gf7bfaunsjvhs4frgazkqxe','.eJxVjEEOwiAQRe_C2hCmDgy4dO8ZCDAgVUOT0q6Md7dNutDtf-_9t_BhXapfe579yOIiQJx-txjSM7cd8CO0-yTT1JZ5jHJX5EG7vE2cX9fD_TuoodetVqowGE1ksnZ4BtZkrCJggBRsiS5iGhAN0JAc6M3UhMjkOBZrHYvPF678NqM:1qbQb2:IY-LEfcLcbZPBMPE8rAOB4o-46zCZRc7hVcKyvbekF0','2023-09-13 19:11:20.047835'),('v4g8dsoefvn2ex2ssv44moclgdo8htoj','.eJxVjEEOwiAQRe_C2hCmDgy4dO8ZCDAgVUOT0q6Md7dNutDtf-_9t_BhXapfe579yOIiQJx-txjSM7cd8CO0-yTT1JZ5jHJX5EG7vE2cX9fD_TuoodetVqowGE1ksnZ4BtZkrCJggBRsiS5iGhAN0JAc6M3UhMjkOBZrHYvPF678NqM:1qeJTP:Sozg623r8KwhlK1qwja6U0gHJXxpj_v01978bi_6t1M','2023-09-21 18:11:23.606244'),('zoyajftk85kzbu1rna0s9bs7z293ee09','.eJxVjMEOwiAQBf-FsyFAgaUevfcbCLCLVA0kpT0Z_9026UGvb2bem_mwrcVvnRY_I7syyS6_WwzpSfUA-Aj13nhqdV3myA-Fn7TzqSG9bqf7d1BCL3ttUekEUg0OZEzRWMRMpJ1Ga4Ci1cGYJAeKGSjp3XZiFEHlAe0IUgD7fAHq6Tfb:1qrilR:SYAxxnPolhRwi81hfEfkFQs5Tey93Mmg4ssJSkRpYNo','2023-10-28 17:49:25.658762');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_admindata`
--

DROP TABLE IF EXISTS `main_admindata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_admindata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_admindata`
--

LOCK TABLES `main_admindata` WRITE;
/*!40000 ALTER TABLE `main_admindata` DISABLE KEYS */;
INSERT INTO `main_admindata` VALUES (1,'main','{\'banned\': [1944272793, 342098734, 419975782, 514602061, 876665384, 856678193, 186497078, 587567012, 5898311560, 656735875, 535278741, 1970247612, 677547148, 394594496, 296811792, 5689378434, 297145702, 237892543, 6110011271, 6691399218, 1539310221, 5604204510, 325522944, 5661785524, 405179149, 5017627659, 476800214, 264378228], \'7_days\': [6393390489], \'3_days\': [6393390489], \'2_days\': [6393390489]}');
/*!40000 ALTER TABLE `main_admindata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_course`
--

DROP TABLE IF EXISTS `main_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `courses` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_course`
--

LOCK TABLES `main_course` WRITE;
/*!40000 ALTER TABLE `main_course` DISABLE KEYS */;
INSERT INTO `main_course` VALUES (1,'Основний','▪️ Александр Герчик Трейдинг от А до Я \r\n\r\n▪️ Обучение от «Maloletoff»  Crypto-Angel \r\n\r\n▪️ Александр Соколовский \"Маркетмейкеры\"\r\n\r\n▪️ SANCHO DT. \r\n\r\n▪️ Mr. Mozart \r\n\r\n▪️ Instarding\r\n\r\n▪️ DOUBLE TOP\r\n\r\n▪️ Азиз Алиев\r\n\r\n▪️ CRYPTOLOGY 9.0\r\n\r\n▪️ 001k Trading\r\n\r\n▪️ MMarketMaker\r\n\r\n▪️ Pifagor Trade','2023-08-15 20:33:01.148714','[]');
/*!40000 ALTER TABLE `main_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_plan`
--

DROP TABLE IF EXISTS `main_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `channels` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_plan`
--

LOCK TABLES `main_plan` WRITE;
/*!40000 ALTER TABLE `main_plan` DISABLE KEYS */;
INSERT INTO `main_plan` VALUES (149,'Основний','▪️ MMarketMaker\r\n\r\n▪️ Crypto Angel (Maloletoff)\r\n\r\n▪️ Falcon Club (Sokolovskiy)\r\n\r\n▪️ Слезы Сатоши VIP (Рафаэль)\r\n\r\n▪️ Booba Сигналы\r\n\r\n▪️ VIP Booba\r\n\r\n▪️ Сытый хомяк\r\n\r\n▪️ Одиссей\r\n\r\n▪️ RMNVpool Premium\r\n\r\n▪️ Wall Street Crypto (Marsel)\r\n\r\n▪️ Pentagon VIP\r\n\r\n▪️  Crypto VIP Paid signal\r\n\r\n▪️  Trade AnaLytics VIP (Orlov)\r\n\r\n▪️ Crypto Coins Coach VIP\r\n\r\n▪️ CryptoAngel™ VIP Futures\r\n\r\n▪️ Bazylev Trader Premium\r\n\r\n▪️Алиев Азиз\r\n\r\n▪️ Dw_trade VIP\r\n\r\n▪️ Margin_Whales\r\n\r\n▪️ Crypto Cove\r\n\r\n▪️ SignalExpress premium\r\n\r\n▪️ Сrypto Student VIP\r\n\r\n▪️ Rose Premium Signal 2022\r\n\r\n▪️ Özel clup 1.0 private\r\n\r\n▪️ CryptoAngel VIP\r\n\r\n▪️ The Bull Exclusive\r\n\r\n▪️ Raticoins Premium Signals\r\n\r\n▪️ Coin Coach Vip\r\n\r\n▪️ Whales Crypto Guide\r\n\r\n▪️ Сrypto Student Investment\r\n\r\n▪️ Криптоклан\r\n\r\n▪️ Mozart\r\n\r\n▪️ Premium Universal Crypto Signals\r\n\r\n▪️ Герман на блокчейне\r\n\r\n▪️ Andrei Sobolev\r\n\r\n▪️ American whales VIP\r\n\r\n▪️ Finwhale VIP\r\n\r\n▪️ Crypto Crown VIP\r\n\r\n▪️ Ladesov\r\n\r\n▪️ Predictūm Indicator\r\n\r\n▪️ Gerchik Pro','2023-10-14 17:52:39.936696','[[\"https://t.me/+6tzqzO_mR0ExNWRi\", -1001844384264, \"Pentagon 2.0\"], [\"https://t.me/+pyz7AaewyS4yOTMy\", -1001887199326, \"Mozart\"], [\"https://t.me/+LAAO9QzHKjM5NDdi\", -1001694840331, \"Polunin Trade Club\"], [\"https://t.me/+Nf7AYjLjhusyYTAy\", -1001874832502, \"Gerchik Pro\"], [\"https://t.me/+FZoZbRuopqM2OTMy\", -1001846556077, \"UpTrade (\\u0410\\u043b\\u0435\\u043a\\u0441\\u0430\\u043d\\u0434\\u0440 \\u042f\\u043d\\u043a\\u043e\\u0432\\u0441\\u043a\\u0438\\u0439)\"], [\"https://t.me/+UGtBQELd_o1jZWUy\", -1001972083375, \"AR PREMIUM (\\u0410\\u043b\\u0435\\u043a\\u0441\\u0435\\u0439 \\u0420\\u0443\\u0434\\u0435\\u043d\\u043a\\u043e)\"], [\"https://t.me/+4jL3A7_D_uEzZDY6\", -1001815053791, \"RMNVpool private\"], [\"https://t.me/+OD5_VsG6CjA2MDgy\", -1001897518541, \"Crypto Student Club\"], [\"https://t.me/+WjssJYXDqW05MWZi\", -1001813657097, \"Rose Premium Sigmal\"], [\"https://t.me/+QA6V1RM5WtExZWMy\", -1001538337947, \"Vip Booba\"], [\"https://t.me/+hzM1ZMufhcw4ZDM6\", -1001506110672, \"\\u0410\\u043b\\u0438\\u0435\\u0432 \\u0410\\u0437\\u0438\\u0437 | \\u0411\\u0438\\u0442\\u043a\\u043e\\u0438\\u043d\"], [\"https://t.me/+NwXv9_GjU0o2YWU6\", -1001684329284, \"\\u0421\\u043b\\u0435\\u0437\\u044b \\u0421\\u0430\\u0442\\u043e\\u0448\\u0438\"], [\"https://t.me/+yeFoc4UrM6gxYTAy\", -1001824932076, \"Booba \\u0421\\u0438\\u0433\\u043d\\u0430\\u043b\\u044b\"], [\"https://t.me/+zLGdtCEo0cJkNGFi\", -1001792858560, \"Trader 80/20 premium\"], [\"https://t.me/+1ZKkJ5UoSBI0NDUy\", -1001879175580, \"Wall Stret Crypto (Marsel)\"], [\"https://t.me/+dLXwtWkOK0g1MTNi\", -1001961163087, \"Ladesov Crypto Priority\"], [\"https://t.me/+feApbi_tPtk1MWQy\", -1001643771951, \"\\u0421\\u044b\\u0442\\u044b\\u0439 \\u0445\\u043e\\u043c\\u044f\\u043a\"], [\"https://t.me/+aMrz8RTNKftmNmM6\", -1001830810630, \"\\u0410\\u043b\\u0438\\u0435\\u0432 \\u0410\\u0437\\u0438\\u0437 | \\u0410\\u043b\\u044c\\u0442\\u043a\\u043e\\u0438\\u043d\\u044b\"], [\"https://t.me/+iLA9YLGPJxs2ODZi\", -1001950668867, \"\\u0411\\u0438\\u0440\\u0436\\u0435\\u0432\\u043e\\u0439 \\u043c\\u043e\\u043d\\u0430\\u0440\\u0445\"], [\"https://t.me/+zU6PKZ8z_Ps0MDky\", -1001981159396, \"GENESIS PRIVATE\"], [\"https://t.me/+RZx8BJFep7FlYzYy\", -1001969474431, \"\\u041a\\u043e\\u0432\\u0447\\u0435\\u0433\"], [\"https://t.me/+psEWpMks-_VlZmMy\", -1001850033655, \"Crypto Angel (Maloletoff)\"], [\"https://t.me/+scM3TrkApEU1NTRi\", -1001961163087, \"Ladesov Crypto Priority\"]]'),(167,'376488524','Личный план id: 376488524','2023-10-16 12:28:47.042080','[[\"https://t.me/+iLA9YLGPJxs2ODZi\", -1001950668867, \"\\u0411\\u0438\\u0440\\u0436\\u0435\\u0432\\u043e\\u0439 \\u043c\\u043e\\u043d\\u0430\\u0440\\u0445\"], [\"https://t.me/+NwXv9_GjU0o2YWU6\", -1001684329284, \"\\u0421\\u043b\\u0435\\u0437\\u044b \\u0421\\u0430\\u0442\\u043e\\u0448\\u0438\"], [\"https://t.me/+OD5_VsG6CjA2MDgy\", -1001897518541, \"Crypto Student Club\"]]'),(221,'False','Личный план id: False','2023-10-31 22:59:32.447396','[]'),(222,'False','Личный план id: False','2023-10-31 23:00:36.774313','[]'),(224,'True','Личный план id: True','2023-11-01 23:13:07.767640','[]'),(225,'True','Личный план id: True','2023-11-01 23:13:07.903941','[]'),(226,'True','Личный план id: True','2023-11-01 23:13:09.978594','[]'),(227,'True','Личный план id: True','2023-11-01 23:13:14.082296','[]'),(228,'6393390489','Личный план id: 6393390489','2023-11-01 23:13:22.167530','[]'),(229,'False','Личный план id: False','2023-11-01 23:13:29.868976','[[\'https://t.me/+6tzqzO_mR0ExNWRi\', -1001844384264, \'Pentagon 2.0\'], [\'https://t.me/+pyz7AaewyS4yOTMy\', -1001887199326, \'Mozart\'], [\'https://t.me/+LAAO9QzHKjM5NDdi\', -1001694840331, \'Polunin Trade Club\'], [\'https://t.me/+Nf7AYjLjhusyYTAy\', -1001874832502, \'Gerchik Pro\'], [\'https://t.me/+FZoZbRuopqM2OTMy\', -1001846556077, \'UpTrade (Александр Янковский)\'], [\'https://t.me/+UGtBQELd_o1jZWUy\', -1001972083375, \'AR PREMIUM (Алексей Руденко)\'], [\'https://t.me/+4jL3A7_D_uEzZDY6\', -1001815053791, \'RMNVpool private\'], [\'https://t.me/+OD5_VsG6CjA2MDgy\', -1001897518541, \'Crypto Student Club\'], [\'https://t.me/+WjssJYXDqW05MWZi\', -1001813657097, \'Rose Premium Sigmal\'], [\'https://t.me/+QA6V1RM5WtExZWMy\', -1001538337947, \'Vip Booba\'], [\'https://t.me/+hzM1ZMufhcw4ZDM6\', -1001506110672, \'Алиев Азиз | Биткоин\'], [\'https://t.me/+NwXv9_GjU0o2YWU6\', -1001684329284, \'Слезы Сатоши\'], [\'https://t.me/+yeFoc4UrM6gxYTAy\', -1001824932076, \'Booba Сигналы\'], [\'https://t.me/+zLGdtCEo0cJkNGFi\', -1001792858560, \'Trader 80/20 premium\'], [\'https://t.me/+1ZKkJ5UoSBI0NDUy\', -1001879175580, \'Wall Stret Crypto (Marsel)\'], [\'https://t.me/+dLXwtWkOK0g1MTNi\', -1001961163087, \'Ladesov Crypto Priority\'], [\'https://t.me/+feApbi_tPtk1MWQy\', -1001643771951, \'Сытый хомяк\'], [\'https://t.me/+aMrz8RTNKftmNmM6\', -1001830810630, \'Алиев Азиз | Альткоины\'], [\'https://t.me/+iLA9YLGPJxs2ODZi\', -1001950668867, \'Биржевой монарх\'], [\'https://t.me/+zU6PKZ8z_Ps0MDky\', -1001981159396, \'GENESIS PRIVATE\'], [\'https://t.me/+RZx8BJFep7FlYzYy\', -1001969474431, \'Ковчег\'], [\'https://t.me/+psEWpMks-_VlZmMy\', -1001850033655, \'Crypto Angel (Maloletoff)\'], [\'https://t.me/+scM3TrkApEU1NTRi\', -1001961163087, \'Ladesov Crypto Priority\']]'),(230,'False','Личный план id: False','2023-11-01 23:13:33.761649','[[\'https://t.me/+6tzqzO_mR0ExNWRi\', -1001844384264, \'Pentagon 2.0\'], [\'https://t.me/+pyz7AaewyS4yOTMy\', -1001887199326, \'Mozart\'], [\'https://t.me/+LAAO9QzHKjM5NDdi\', -1001694840331, \'Polunin Trade Club\'], [\'https://t.me/+Nf7AYjLjhusyYTAy\', -1001874832502, \'Gerchik Pro\'], [\'https://t.me/+FZoZbRuopqM2OTMy\', -1001846556077, \'UpTrade (Александр Янковский)\'], [\'https://t.me/+UGtBQELd_o1jZWUy\', -1001972083375, \'AR PREMIUM (Алексей Руденко)\'], [\'https://t.me/+4jL3A7_D_uEzZDY6\', -1001815053791, \'RMNVpool private\'], [\'https://t.me/+OD5_VsG6CjA2MDgy\', -1001897518541, \'Crypto Student Club\'], [\'https://t.me/+WjssJYXDqW05MWZi\', -1001813657097, \'Rose Premium Sigmal\'], [\'https://t.me/+QA6V1RM5WtExZWMy\', -1001538337947, \'Vip Booba\'], [\'https://t.me/+hzM1ZMufhcw4ZDM6\', -1001506110672, \'Алиев Азиз | Биткоин\'], [\'https://t.me/+NwXv9_GjU0o2YWU6\', -1001684329284, \'Слезы Сатоши\'], [\'https://t.me/+yeFoc4UrM6gxYTAy\', -1001824932076, \'Booba Сигналы\'], [\'https://t.me/+zLGdtCEo0cJkNGFi\', -1001792858560, \'Trader 80/20 premium\'], [\'https://t.me/+1ZKkJ5UoSBI0NDUy\', -1001879175580, \'Wall Stret Crypto (Marsel)\'], [\'https://t.me/+dLXwtWkOK0g1MTNi\', -1001961163087, \'Ladesov Crypto Priority\'], [\'https://t.me/+feApbi_tPtk1MWQy\', -1001643771951, \'Сытый хомяк\'], [\'https://t.me/+aMrz8RTNKftmNmM6\', -1001830810630, \'Алиев Азиз | Альткоины\'], [\'https://t.me/+iLA9YLGPJxs2ODZi\', -1001950668867, \'Биржевой монарх\'], [\'https://t.me/+zU6PKZ8z_Ps0MDky\', -1001981159396, \'GENESIS PRIVATE\'], [\'https://t.me/+RZx8BJFep7FlYzYy\', -1001969474431, \'Ковчег\'], [\'https://t.me/+psEWpMks-_VlZmMy\', -1001850033655, \'Crypto Angel (Maloletoff)\'], [\'https://t.me/+scM3TrkApEU1NTRi\', -1001961163087, \'Ladesov Crypto Priority\']]'),(231,'False','Личный план id: False','2023-11-01 23:13:39.676515','[[\'https://t.me/+6tzqzO_mR0ExNWRi\', -1001844384264, \'Pentagon 2.0\'], [\'https://t.me/+pyz7AaewyS4yOTMy\', -1001887199326, \'Mozart\'], [\'https://t.me/+LAAO9QzHKjM5NDdi\', -1001694840331, \'Polunin Trade Club\'], [\'https://t.me/+Nf7AYjLjhusyYTAy\', -1001874832502, \'Gerchik Pro\'], [\'https://t.me/+FZoZbRuopqM2OTMy\', -1001846556077, \'UpTrade (Александр Янковский)\'], [\'https://t.me/+UGtBQELd_o1jZWUy\', -1001972083375, \'AR PREMIUM (Алексей Руденко)\'], [\'https://t.me/+4jL3A7_D_uEzZDY6\', -1001815053791, \'RMNVpool private\'], [\'https://t.me/+OD5_VsG6CjA2MDgy\', -1001897518541, \'Crypto Student Club\'], [\'https://t.me/+WjssJYXDqW05MWZi\', -1001813657097, \'Rose Premium Sigmal\'], [\'https://t.me/+QA6V1RM5WtExZWMy\', -1001538337947, \'Vip Booba\'], [\'https://t.me/+hzM1ZMufhcw4ZDM6\', -1001506110672, \'Алиев Азиз | Биткоин\'], [\'https://t.me/+NwXv9_GjU0o2YWU6\', -1001684329284, \'Слезы Сатоши\'], [\'https://t.me/+yeFoc4UrM6gxYTAy\', -1001824932076, \'Booba Сигналы\'], [\'https://t.me/+zLGdtCEo0cJkNGFi\', -1001792858560, \'Trader 80/20 premium\'], [\'https://t.me/+1ZKkJ5UoSBI0NDUy\', -1001879175580, \'Wall Stret Crypto (Marsel)\'], [\'https://t.me/+dLXwtWkOK0g1MTNi\', -1001961163087, \'Ladesov Crypto Priority\'], [\'https://t.me/+feApbi_tPtk1MWQy\', -1001643771951, \'Сытый хомяк\'], [\'https://t.me/+aMrz8RTNKftmNmM6\', -1001830810630, \'Алиев Азиз | Альткоины\'], [\'https://t.me/+iLA9YLGPJxs2ODZi\', -1001950668867, \'Биржевой монарх\'], [\'https://t.me/+zU6PKZ8z_Ps0MDky\', -1001981159396, \'GENESIS PRIVATE\'], [\'https://t.me/+RZx8BJFep7FlYzYy\', -1001969474431, \'Ковчег\'], [\'https://t.me/+psEWpMks-_VlZmMy\', -1001850033655, \'Crypto Angel (Maloletoff)\'], [\'https://t.me/+scM3TrkApEU1NTRi\', -1001961163087, \'Ladesov Crypto Priority\']]'),(232,'False','Личный план id: False','2023-11-01 23:13:47.290311','[[\'https://t.me/+6tzqzO_mR0ExNWRi\', -1001844384264, \'Pentagon 2.0\'], [\'https://t.me/+pyz7AaewyS4yOTMy\', -1001887199326, \'Mozart\'], [\'https://t.me/+LAAO9QzHKjM5NDdi\', -1001694840331, \'Polunin Trade Club\'], [\'https://t.me/+Nf7AYjLjhusyYTAy\', -1001874832502, \'Gerchik Pro\'], [\'https://t.me/+FZoZbRuopqM2OTMy\', -1001846556077, \'UpTrade (Александр Янковский)\'], [\'https://t.me/+UGtBQELd_o1jZWUy\', -1001972083375, \'AR PREMIUM (Алексей Руденко)\'], [\'https://t.me/+4jL3A7_D_uEzZDY6\', -1001815053791, \'RMNVpool private\'], [\'https://t.me/+OD5_VsG6CjA2MDgy\', -1001897518541, \'Crypto Student Club\'], [\'https://t.me/+WjssJYXDqW05MWZi\', -1001813657097, \'Rose Premium Sigmal\'], [\'https://t.me/+QA6V1RM5WtExZWMy\', -1001538337947, \'Vip Booba\'], [\'https://t.me/+hzM1ZMufhcw4ZDM6\', -1001506110672, \'Алиев Азиз | Биткоин\'], [\'https://t.me/+NwXv9_GjU0o2YWU6\', -1001684329284, \'Слезы Сатоши\'], [\'https://t.me/+yeFoc4UrM6gxYTAy\', -1001824932076, \'Booba Сигналы\'], [\'https://t.me/+zLGdtCEo0cJkNGFi\', -1001792858560, \'Trader 80/20 premium\'], [\'https://t.me/+1ZKkJ5UoSBI0NDUy\', -1001879175580, \'Wall Stret Crypto (Marsel)\'], [\'https://t.me/+dLXwtWkOK0g1MTNi\', -1001961163087, \'Ladesov Crypto Priority\'], [\'https://t.me/+feApbi_tPtk1MWQy\', -1001643771951, \'Сытый хомяк\'], [\'https://t.me/+aMrz8RTNKftmNmM6\', -1001830810630, \'Алиев Азиз | Альткоины\'], [\'https://t.me/+iLA9YLGPJxs2ODZi\', -1001950668867, \'Биржевой монарх\'], [\'https://t.me/+zU6PKZ8z_Ps0MDky\', -1001981159396, \'GENESIS PRIVATE\'], [\'https://t.me/+RZx8BJFep7FlYzYy\', -1001969474431, \'Ковчег\'], [\'https://t.me/+psEWpMks-_VlZmMy\', -1001850033655, \'Crypto Angel (Maloletoff)\'], [\'https://t.me/+scM3TrkApEU1NTRi\', -1001961163087, \'Ladesov Crypto Priority\']]'),(233,'False','Личный план id: False','2023-11-01 23:13:59.409124','[[\'https://t.me/+6tzqzO_mR0ExNWRi\', -1001844384264, \'Pentagon 2.0\'], [\'https://t.me/+pyz7AaewyS4yOTMy\', -1001887199326, \'Mozart\'], [\'https://t.me/+LAAO9QzHKjM5NDdi\', -1001694840331, \'Polunin Trade Club\'], [\'https://t.me/+Nf7AYjLjhusyYTAy\', -1001874832502, \'Gerchik Pro\'], [\'https://t.me/+FZoZbRuopqM2OTMy\', -1001846556077, \'UpTrade (Александр Янковский)\'], [\'https://t.me/+UGtBQELd_o1jZWUy\', -1001972083375, \'AR PREMIUM (Алексей Руденко)\'], [\'https://t.me/+4jL3A7_D_uEzZDY6\', -1001815053791, \'RMNVpool private\'], [\'https://t.me/+OD5_VsG6CjA2MDgy\', -1001897518541, \'Crypto Student Club\'], [\'https://t.me/+WjssJYXDqW05MWZi\', -1001813657097, \'Rose Premium Sigmal\'], [\'https://t.me/+QA6V1RM5WtExZWMy\', -1001538337947, \'Vip Booba\'], [\'https://t.me/+hzM1ZMufhcw4ZDM6\', -1001506110672, \'Алиев Азиз | Биткоин\'], [\'https://t.me/+NwXv9_GjU0o2YWU6\', -1001684329284, \'Слезы Сатоши\'], [\'https://t.me/+yeFoc4UrM6gxYTAy\', -1001824932076, \'Booba Сигналы\'], [\'https://t.me/+zLGdtCEo0cJkNGFi\', -1001792858560, \'Trader 80/20 premium\'], [\'https://t.me/+1ZKkJ5UoSBI0NDUy\', -1001879175580, \'Wall Stret Crypto (Marsel)\'], [\'https://t.me/+dLXwtWkOK0g1MTNi\', -1001961163087, \'Ladesov Crypto Priority\'], [\'https://t.me/+feApbi_tPtk1MWQy\', -1001643771951, \'Сытый хомяк\'], [\'https://t.me/+aMrz8RTNKftmNmM6\', -1001830810630, \'Алиев Азиз | Альткоины\'], [\'https://t.me/+iLA9YLGPJxs2ODZi\', -1001950668867, \'Биржевой монарх\'], [\'https://t.me/+zU6PKZ8z_Ps0MDky\', -1001981159396, \'GENESIS PRIVATE\'], [\'https://t.me/+RZx8BJFep7FlYzYy\', -1001969474431, \'Ковчег\'], [\'https://t.me/+psEWpMks-_VlZmMy\', -1001850033655, \'Crypto Angel (Maloletoff)\'], [\'https://t.me/+scM3TrkApEU1NTRi\', -1001961163087, \'Ladesov Crypto Priority\']]'),(234,'False','Личный план id: False','2023-11-01 23:14:19.391007','[[\'https://t.me/+6tzqzO_mR0ExNWRi\', -1001844384264, \'Pentagon 2.0\'], [\'https://t.me/+pyz7AaewyS4yOTMy\', -1001887199326, \'Mozart\'], [\'https://t.me/+LAAO9QzHKjM5NDdi\', -1001694840331, \'Polunin Trade Club\'], [\'https://t.me/+Nf7AYjLjhusyYTAy\', -1001874832502, \'Gerchik Pro\'], [\'https://t.me/+FZoZbRuopqM2OTMy\', -1001846556077, \'UpTrade (Александр Янковский)\'], [\'https://t.me/+UGtBQELd_o1jZWUy\', -1001972083375, \'AR PREMIUM (Алексей Руденко)\'], [\'https://t.me/+4jL3A7_D_uEzZDY6\', -1001815053791, \'RMNVpool private\'], [\'https://t.me/+OD5_VsG6CjA2MDgy\', -1001897518541, \'Crypto Student Club\'], [\'https://t.me/+WjssJYXDqW05MWZi\', -1001813657097, \'Rose Premium Sigmal\'], [\'https://t.me/+QA6V1RM5WtExZWMy\', -1001538337947, \'Vip Booba\'], [\'https://t.me/+hzM1ZMufhcw4ZDM6\', -1001506110672, \'Алиев Азиз | Биткоин\'], [\'https://t.me/+NwXv9_GjU0o2YWU6\', -1001684329284, \'Слезы Сатоши\'], [\'https://t.me/+yeFoc4UrM6gxYTAy\', -1001824932076, \'Booba Сигналы\'], [\'https://t.me/+zLGdtCEo0cJkNGFi\', -1001792858560, \'Trader 80/20 premium\'], [\'https://t.me/+1ZKkJ5UoSBI0NDUy\', -1001879175580, \'Wall Stret Crypto (Marsel)\'], [\'https://t.me/+dLXwtWkOK0g1MTNi\', -1001961163087, \'Ladesov Crypto Priority\'], [\'https://t.me/+feApbi_tPtk1MWQy\', -1001643771951, \'Сытый хомяк\'], [\'https://t.me/+aMrz8RTNKftmNmM6\', -1001830810630, \'Алиев Азиз | Альткоины\'], [\'https://t.me/+iLA9YLGPJxs2ODZi\', -1001950668867, \'Биржевой монарх\'], [\'https://t.me/+zU6PKZ8z_Ps0MDky\', -1001981159396, \'GENESIS PRIVATE\'], [\'https://t.me/+RZx8BJFep7FlYzYy\', -1001969474431, \'Ковчег\'], [\'https://t.me/+psEWpMks-_VlZmMy\', -1001850033655, \'Crypto Angel (Maloletoff)\'], [\'https://t.me/+scM3TrkApEU1NTRi\', -1001961163087, \'Ladesov Crypto Priority\']]'),(235,'False','Личный план id: False','2023-11-01 23:14:55.113783','[[\'https://t.me/+6tzqzO_mR0ExNWRi\', -1001844384264, \'Pentagon 2.0\'], [\'https://t.me/+pyz7AaewyS4yOTMy\', -1001887199326, \'Mozart\'], [\'https://t.me/+LAAO9QzHKjM5NDdi\', -1001694840331, \'Polunin Trade Club\'], [\'https://t.me/+Nf7AYjLjhusyYTAy\', -1001874832502, \'Gerchik Pro\'], [\'https://t.me/+FZoZbRuopqM2OTMy\', -1001846556077, \'UpTrade (Александр Янковский)\'], [\'https://t.me/+UGtBQELd_o1jZWUy\', -1001972083375, \'AR PREMIUM (Алексей Руденко)\'], [\'https://t.me/+4jL3A7_D_uEzZDY6\', -1001815053791, \'RMNVpool private\'], [\'https://t.me/+OD5_VsG6CjA2MDgy\', -1001897518541, \'Crypto Student Club\'], [\'https://t.me/+WjssJYXDqW05MWZi\', -1001813657097, \'Rose Premium Sigmal\'], [\'https://t.me/+QA6V1RM5WtExZWMy\', -1001538337947, \'Vip Booba\'], [\'https://t.me/+hzM1ZMufhcw4ZDM6\', -1001506110672, \'Алиев Азиз | Биткоин\'], [\'https://t.me/+NwXv9_GjU0o2YWU6\', -1001684329284, \'Слезы Сатоши\'], [\'https://t.me/+yeFoc4UrM6gxYTAy\', -1001824932076, \'Booba Сигналы\'], [\'https://t.me/+zLGdtCEo0cJkNGFi\', -1001792858560, \'Trader 80/20 premium\'], [\'https://t.me/+1ZKkJ5UoSBI0NDUy\', -1001879175580, \'Wall Stret Crypto (Marsel)\'], [\'https://t.me/+dLXwtWkOK0g1MTNi\', -1001961163087, \'Ladesov Crypto Priority\'], [\'https://t.me/+feApbi_tPtk1MWQy\', -1001643771951, \'Сытый хомяк\'], [\'https://t.me/+aMrz8RTNKftmNmM6\', -1001830810630, \'Алиев Азиз | Альткоины\'], [\'https://t.me/+iLA9YLGPJxs2ODZi\', -1001950668867, \'Биржевой монарх\'], [\'https://t.me/+zU6PKZ8z_Ps0MDky\', -1001981159396, \'GENESIS PRIVATE\'], [\'https://t.me/+RZx8BJFep7FlYzYy\', -1001969474431, \'Ковчег\'], [\'https://t.me/+psEWpMks-_VlZmMy\', -1001850033655, \'Crypto Angel (Maloletoff)\'], [\'https://t.me/+scM3TrkApEU1NTRi\', -1001961163087, \'Ladesov Crypto Priority\']]'),(236,'5661785524','Личный план id: 5661785524','2023-11-04 11:55:37.145946','[]'),(237,'5661785524','Личный план id: 5661785524','2023-11-04 11:55:39.156494','[]'),(238,'5661785524','Личный план id: 5661785524','2023-11-04 11:55:41.300004','[]'),(239,'5661785524','Личный план id: 5661785524','2023-11-04 11:55:43.146903','[]'),(240,'5661785524','Личный план id: 5661785524','2023-11-04 11:55:45.163784','[]'),(241,'5661785524','Личный план id: 5661785524','2023-11-04 11:55:47.269924','[]'),(242,'5661785524','Личный план id: 5661785524','2023-11-04 11:55:51.377962','[]');
/*!40000 ALTER TABLE `main_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_user`
--

DROP TABLE IF EXISTS `main_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `plan` varchar(100) NOT NULL,
  `course` varchar(100) NOT NULL,
  `active_to` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_user`
--

LOCK TABLES `main_user` WRITE;
/*!40000 ALTER TABLE `main_user` DISABLE KEYS */;
INSERT INTO `main_user` VALUES (1,6110011271,NULL,1,0,'Бесплатный','Бесплатный','2023-11-01 23:16:33.266760','2023-08-16 09:06:36.391776'),(2,376488524,NULL,1,1,'376488524','Основний','2023-10-24 12:25:48.891211','2023-08-16 09:11:32.041147'),(3,1970247612,'5',1,1,'Бесплатный','Бесплатный','2023-10-26 16:02:12.372446','2023-08-16 09:11:33.305554'),(4,5985377542,NULL,1,0,'Бесплатный','Бесплатный','2023-11-07 12:33:02.597950','2023-08-16 15:14:13.701880'),(5,1319498352,NULL,1,0,'Бесплатный','Бесплатный','2023-08-18 08:56:55.000000','2023-08-17 08:56:55.012702'),(6,6131623964,NULL,1,0,'Бесплатный','Бесплатный','2023-08-19 08:36:51.000000','2023-08-18 08:36:51.658123'),(7,604762499,NULL,1,0,'Бесплатный','Бесплатный','2023-08-19 22:40:49.000000','2023-08-18 22:40:49.339727'),(8,6348211100,NULL,1,0,'Бесплатный','Бесплатный','2023-09-18 21:01:36.221414','2023-08-20 14:07:47.304202'),(9,107933705,NULL,1,0,'Бесплатный','Бесплатный','2023-10-02 17:53:25.000000','2023-09-01 14:15:07.398398'),(10,1708526056,NULL,1,0,'Бесплатный','Бесплатный','2023-09-02 15:00:51.361382','2023-09-01 15:00:51.364641'),(11,5794582318,NULL,1,0,'Бесплатный','Бесплатный','2023-09-03 02:52:52.424252','2023-09-02 02:52:52.427586'),(12,5284027175,NULL,1,0,'Бесплатный','Бесплатный','2023-10-16 10:13:52.114338','2023-09-02 10:30:26.987456'),(13,955752424,NULL,1,0,'Бесплатный','Бесплатный','2023-09-03 13:02:25.277328','2023-09-02 13:02:25.281470'),(14,6130163604,NULL,1,0,'Бесплатный','Бесплатный','2023-09-05 21:19:08.088508','2023-09-04 21:19:08.090109'),(15,742865720,NULL,1,0,'Бесплатный','Бесплатный','2023-09-07 13:11:29.632026','2023-09-06 13:11:29.634926'),(16,6050090011,NULL,1,0,'Бесплатный','Бесплатный','2023-09-08 10:58:06.014540','2023-09-07 10:58:06.016131'),(17,487773888,NULL,1,0,'Бесплатный','Бесплатный','2023-12-11 12:31:36.550063','2023-09-09 11:12:45.933765'),(18,1600252414,NULL,1,0,'Бесплатный','Бесплатный','2023-10-17 08:50:05.398786','2023-09-09 12:30:06.252391'),(19,377472146,NULL,1,0,'Бесплатный','Бесплатный','2023-09-10 17:50:23.635169','2023-09-09 17:50:23.639272'),(20,1695449370,NULL,1,0,'Бесплатный','Бесплатный','2023-09-11 19:16:04.375234','2023-09-09 21:22:36.908548'),(21,5739776379,NULL,1,0,'Бесплатный','Бесплатный','2023-09-12 19:55:24.196240','2023-09-11 19:55:24.196813'),(22,1050429168,NULL,1,0,'Бесплатный','Бесплатный','2023-09-12 20:39:12.166666','2023-09-11 20:39:12.166975'),(23,6156041532,NULL,1,0,'Бесплатный','Бесплатный','2023-09-16 12:58:51.476475','2023-09-15 12:58:51.477837'),(24,614040180,NULL,1,0,'Бесплатный','Бесплатный','2023-09-27 10:19:02.141706','2023-09-26 10:19:02.142898'),(25,6253185075,NULL,1,0,'Бесплатный','Бесплатный','2023-09-28 15:05:48.231372','2023-09-27 15:05:48.233757'),(26,6547699345,NULL,1,0,'Бесплатный','Бесплатный','2023-11-27 10:47:58.960702','2023-10-05 04:40:50.807078'),(27,405179149,NULL,1,0,'Бесплатный','Бесплатный','2023-11-06 10:08:44.085958','2023-10-06 10:03:59.415417'),(28,5999545059,NULL,1,0,'Бесплатный','Бесплатный','2023-10-07 10:27:22.101302','2023-10-06 10:27:22.102028'),(29,5817644660,NULL,1,0,'Бесплатный','Бесплатный','2023-10-07 21:22:41.545054','2023-10-06 21:22:41.545852'),(30,5052914337,NULL,1,0,'Бесплатный','Бесплатный','2023-10-08 09:51:36.069109','2023-10-07 09:51:36.070065'),(31,5850941526,NULL,1,0,'Бесплатный','Бесплатный','2023-10-08 21:05:37.786038','2023-10-07 21:05:37.786628'),(32,395083311,NULL,1,0,'Бесплатный','Бесплатный','2023-10-10 06:49:20.198631','2023-10-09 06:49:20.200511'),(33,227600159,NULL,1,0,'Бесплатный','Бесплатный','2023-10-10 08:06:04.922615','2023-10-09 08:06:04.923403'),(34,680724433,NULL,1,0,'Бесплатный','Бесплатный','2023-10-10 10:52:58.911062','2023-10-09 10:52:58.911697'),(35,56813875,NULL,1,0,'Бесплатный','Бесплатный','2023-10-10 12:17:28.993928','2023-10-09 12:17:28.994406'),(36,116774635,NULL,1,0,'Бесплатный','Бесплатный','2023-10-10 14:46:05.065276','2023-10-09 14:46:05.065835'),(37,5938970468,NULL,1,0,'Бесплатный','Бесплатный','2023-10-11 13:16:33.403638','2023-10-10 13:16:33.405604'),(38,1421036385,NULL,1,0,'Бесплатный','Бесплатный','2023-10-11 18:27:46.951764','2023-10-10 18:27:46.953172'),(39,2032898305,NULL,1,0,'Бесплатный','Бесплатный','2023-10-13 09:33:31.792245','2023-10-12 09:33:31.793279'),(40,398969214,NULL,1,0,'Бесплатный','Бесплатный','2023-10-14 17:24:44.993273','2023-10-13 17:24:44.995251'),(41,1900988648,NULL,1,0,'Бесплатный','Бесплатный','2023-10-14 21:55:58.001162','2023-10-13 21:55:58.002002'),(42,434851368,NULL,1,0,'Бесплатный','Бесплатный','2023-10-15 05:59:09.615788','2023-10-14 05:59:09.616880'),(43,5374604558,NULL,1,0,'Бесплатный','Бесплатный','2023-10-15 07:27:26.849546','2023-10-14 07:27:26.850352'),(44,5692290212,NULL,1,0,'Бесплатный','Бесплатный','2023-10-15 07:43:34.920816','2023-10-14 07:43:34.921714'),(45,379101523,NULL,1,0,'Бесплатный','Бесплатный','2023-10-15 17:47:01.340495','2023-10-14 17:47:01.340955'),(46,606273952,NULL,1,0,'Бесплатный','Бесплатный','2023-10-15 17:47:38.093931','2023-10-14 17:47:38.094509'),(47,5932783197,NULL,1,0,'Бесплатный','Бесплатный','2023-10-15 18:32:01.101338','2023-10-14 18:32:01.102379'),(48,1944272793,NULL,1,0,'Бесплатный','Бесплатный','2023-10-18 21:35:55.396617','2023-10-17 21:35:55.397458'),(49,342098734,NULL,1,0,'Бесплатный','Бесплатный','2023-10-19 11:13:06.081410','2023-10-18 11:13:06.083930'),(50,419975782,NULL,1,0,'Бесплатный','Бесплатный','2023-10-19 17:55:41.561524','2023-10-18 17:55:41.562334'),(51,514602061,NULL,1,0,'Бесплатный','Бесплатный','2023-10-19 22:06:00.155180','2023-10-18 22:06:00.156022'),(52,876665384,NULL,1,0,'Бесплатный','Бесплатный','2023-10-19 23:43:20.431855','2023-10-18 23:43:20.433380'),(53,856678193,NULL,1,0,'Бесплатный','Бесплатный','2023-10-20 11:18:41.873977','2023-10-19 11:18:41.874350'),(54,186497078,NULL,1,0,'Бесплатный','Бесплатный','2023-10-20 21:25:28.087463','2023-10-19 21:25:28.088722'),(55,587567012,NULL,1,0,'Бесплатный','Бесплатный','2023-10-20 21:55:32.667164','2023-10-19 21:55:32.667862'),(56,5898311560,NULL,1,0,'Бесплатный','Бесплатный','2023-10-23 04:35:51.631487','2023-10-22 04:35:51.632342'),(57,656735875,NULL,1,0,'Бесплатный','Бесплатный','2023-10-24 16:33:37.215350','2023-10-23 16:33:37.216076'),(58,535278741,NULL,1,0,'Бесплатный','Бесплатный','2023-10-25 10:22:51.628675','2023-10-24 10:22:51.629407'),(59,677547148,NULL,1,0,'Бесплатный','Бесплатный','2023-10-26 04:22:19.460392','2023-10-25 04:22:19.461286'),(60,394594496,NULL,1,0,'Бесплатный','Бесплатный','2023-10-27 19:03:01.690284','2023-10-26 19:03:01.691166'),(61,296811792,NULL,1,0,'Бесплатный','Бесплатный','2023-10-27 19:03:02.624708','2023-10-26 19:03:02.625233'),(62,5689378434,NULL,1,0,'Бесплатный','Бесплатный','2023-10-27 19:45:08.986555','2023-10-26 19:45:08.987114'),(63,297145702,NULL,1,0,'Бесплатный','Бесплатный','2023-10-28 04:08:38.079195','2023-10-27 04:08:38.080021'),(64,6691399218,NULL,1,0,'Бесплатный','Бесплатный','2023-11-02 13:07:35.984453','2023-10-27 08:55:33.310882'),(65,237892543,NULL,1,0,'Бесплатный','Бесплатный','2023-10-29 10:47:09.870771','2023-10-28 10:47:09.872756'),(66,1539310221,NULL,1,0,'Бесплатный','Бесплатный','2023-11-02 11:50:24.143347','2023-11-01 11:50:24.144343'),(67,6393390489,NULL,1,0,'6393390489','Основний','2023-11-09 23:13:20.676809','2023-11-01 23:08:41.458604'),(68,5604204510,NULL,1,0,'Бесплатный','Бесплатный','2023-11-04 13:42:48.914306','2023-11-03 13:42:48.915456'),(69,325522944,NULL,1,0,'Бесплатный','Бесплатный','2023-11-04 15:34:12.472972','2023-11-03 15:34:12.474486'),(70,5661785524,NULL,1,0,'5661785524','Основний','2023-12-04 11:53:06.716142','2023-11-03 19:08:26.492404'),(71,5017627659,NULL,1,0,'Бесплатный','Бесплатный','2023-11-06 12:15:37.958037','2023-11-05 12:15:37.958670'),(72,476800214,NULL,1,0,'Бесплатный','Бесплатный','2023-11-07 18:55:32.679678','2023-11-06 18:55:32.680496'),(73,264378228,NULL,1,0,'Бесплатный','Бесплатный','2023-11-08 18:31:45.166740','2023-11-07 18:31:45.168163');
/*!40000 ALTER TABLE `main_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_userstoapprove`
--

DROP TABLE IF EXISTS `main_userstoapprove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_userstoapprove` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `channel_id` bigint(20) NOT NULL,
  `users_ids` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_userstoapprove`
--

LOCK TABLES `main_userstoapprove` WRITE;
/*!40000 ALTER TABLE `main_userstoapprove` DISABLE KEYS */;
INSERT INTO `main_userstoapprove` VALUES (2,'Pentagon 2.0',-1001844384264,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(3,'Mozart',-1001887199326,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(4,'Polunin Trade Club',-1001694840331,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(5,'Gerchik Pro',-1001874832502,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(6,'UpTrade (Александр Янковский)',-1001846556077,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(7,'AR PREMIUM (Алексей Руденко)',-1001972083375,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(8,'RMNVpool private',-1001815053791,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(9,'Crypto Student Club',-1001897518541,'[376488524, False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(10,'Rose Premium Sigmal',-1001813657097,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(11,'Vip Booba',-1001538337947,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(12,'Алиев Азиз | Биткоин',-1001506110672,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(13,'Слезы Сатоши',-1001684329284,'[376488524, False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(14,'Booba Сигналы',-1001824932076,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(15,'Trader 80/20 premium',-1001792858560,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(16,'Wall Stret Crypto (Marsel)',-1001879175580,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(17,'Ladesov Crypto Priority',-1001961163087,'[6110011271, 6393390489]','2023-08-21 22:44:03.000000'),(18,'Сытый хомяк',-1001643771951,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(19,'Алиев Азиз | Альткоины',-1001830810630,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(20,'Биржевой монарх',-1001950668867,'[376488524, False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(21,'GENESIS PRIVATE',-1001981159396,'[False, False, False, False, False, False, False]','2023-08-21 22:44:03.000000'),(22,'Ковчег',-1001969474431,'[]','2023-08-21 22:44:03.000000');
/*!40000 ALTER TABLE `main_userstoapprove` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-08  0:19:14
