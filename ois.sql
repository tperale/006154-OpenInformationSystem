-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ois
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add publisher',1,'add_publisher'),(2,'Can change publisher',1,'change_publisher'),(3,'Can delete publisher',1,'delete_publisher'),(4,'Can add ebook',2,'add_ebook'),(5,'Can change ebook',2,'change_ebook'),(6,'Can delete ebook',2,'delete_ebook'),(7,'Can add category',3,'add_category'),(8,'Can change category',3,'change_category'),(9,'Can delete category',3,'delete_category'),(10,'Can add book category',4,'add_bookcategory'),(11,'Can change book category',4,'change_bookcategory'),(12,'Can delete book category',4,'delete_bookcategory'),(13,'Can add rating',5,'add_rating'),(14,'Can change rating',5,'change_rating'),(15,'Can delete rating',5,'delete_rating'),(16,'Can add author',6,'add_author'),(17,'Can change author',6,'change_author'),(18,'Can delete author',6,'delete_author'),(19,'Can add purchase',7,'add_purchase'),(20,'Can change purchase',7,'change_purchase'),(21,'Can delete purchase',7,'delete_purchase'),(22,'Can add user book purchase',8,'add_userbookpurchase'),(23,'Can change user book purchase',8,'change_userbookpurchase'),(24,'Can delete user book purchase',8,'delete_userbookpurchase'),(25,'Can add log entry',9,'add_logentry'),(26,'Can change log entry',9,'change_logentry'),(27,'Can delete log entry',9,'delete_logentry'),(28,'Can add permission',10,'add_permission'),(29,'Can change permission',10,'change_permission'),(30,'Can delete permission',10,'delete_permission'),(31,'Can add group',11,'add_group'),(32,'Can change group',11,'change_group'),(33,'Can delete group',11,'delete_group'),(34,'Can add user',12,'add_user'),(35,'Can change user',12,'change_user'),(36,'Can delete user',12,'delete_user'),(37,'Can add content type',13,'add_contenttype'),(38,'Can change content type',13,'change_contenttype'),(39,'Can delete content type',13,'delete_contenttype'),(40,'Can add session',14,'add_session'),(41,'Can change session',14,'change_session'),(42,'Can delete session',14,'delete_session');
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$tct1vuxwYo5g$YTn/pzRAnm5A53zbWGPtG1h10KCx5tX/goO0wqmCNU0=',NULL,0,'mromain','Maximilien','Romain','maxromai@ulb.ac.be',0,1,'2017-12-17 13:43:20.726059'),(2,'pbkdf2_sha256$100000$bngObxedMSR5$du7dNUI5DP9hOU0qCrbb4GNoKR85j04wFb1hvxYoAgY=',NULL,0,'tperale','','','tperale@ulb.ac.be',0,1,'2017-12-17 13:43:21.289227'),(3,'pbkdf2_sha256$100000$HCRgmu20k16U$PVEoucNWvG158Z9bs35RapPo1u4hfU2BFUkpgsZdhIQ=',NULL,0,'frojas','','','frojas@vub.ac.be',0,1,'2017-12-17 13:43:21.847209'),(4,'pbkdf2_sha256$100000$jtZWnjP3C0z1$BGtnzxclmUWEtvipSFzHQ+ljRXTMqrVgpKV7OcdiTC4=',NULL,0,'slehal','','','slehal@vub.ac.be',0,1,'2017-12-17 13:43:22.385525');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'admin','logentry'),(11,'auth','group'),(10,'auth','permission'),(12,'auth','user'),(13,'contenttypes','contenttype'),(4,'ebook','bookcategory'),(3,'ebook','category'),(2,'ebook','ebook'),(1,'ebook','publisher'),(5,'ebook','rating'),(14,'sessions','session'),(6,'user','author'),(7,'user','purchase'),(8,'user','userbookpurchase');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-12-17 13:30:04.324947'),(2,'auth','0001_initial','2017-12-17 13:30:39.916414'),(3,'admin','0001_initial','2017-12-17 13:30:51.176945'),(4,'contenttypes','0002_remove_content_type_name','2017-12-17 13:30:52.696757'),(5,'auth','0002_alter_permission_name_max_length','2017-12-17 13:30:52.871458'),(6,'auth','0003_alter_user_email_max_length','2017-12-17 13:30:52.964222'),(7,'auth','0004_alter_user_username_opts','2017-12-17 13:30:53.040845'),(8,'auth','0005_alter_user_last_login_null','2017-12-17 13:30:54.165421'),(9,'auth','0006_require_contenttypes_0002','2017-12-17 13:30:54.181038'),(10,'ebook','0001_initial','2017-12-17 13:30:55.310782'),(11,'user','0001_initial','2017-12-17 13:30:57.365840'),(12,'ebook','0002_auto_20171213_1445','2017-12-17 13:31:40.809183'),(13,'ebook','0003_auto_20171215_1141','2017-12-17 13:31:58.947206'),(14,'ebook','0004_auto_20171215_1756','2017-12-17 13:32:14.846685'),(15,'sessions','0001_initial','2017-12-17 13:32:26.312287');
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebook_bookcategory`
--

DROP TABLE IF EXISTS `ebook_bookcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebook_bookcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `ebook_id` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ebook_bookcategory_b583a629` (`category_id`),
  KEY `ebook_bookcategory_7814025a` (`ebook_id`),
  CONSTRAINT `ebook_bookcategory_category_id_31ae3b9e_fk_ebook_category_id` FOREIGN KEY (`category_id`) REFERENCES `ebook_category` (`id`),
  CONSTRAINT `ebook_bookcategory_ebook_id_3dfbcf9d_fk_ebook_ebook_isbn` FOREIGN KEY (`ebook_id`) REFERENCES `ebook_ebook` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebook_bookcategory`
--

LOCK TABLES `ebook_bookcategory` WRITE;
/*!40000 ALTER TABLE `ebook_bookcategory` DISABLE KEYS */;
INSERT INTO `ebook_bookcategory` VALUES (1,7,'9781491957615'),(2,2,'9780007322596'),(3,4,'9780007322596'),(4,5,'9780007322596'),(5,8,'9781405519229'),(6,1,'9781473543348'),(7,2,'9781473543348'),(8,1,'9781409147565'),(9,6,'9781491903100'),(10,2,'9780356509587'),(11,6,'9781316027356');
/*!40000 ALTER TABLE `ebook_bookcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebook_category`
--

DROP TABLE IF EXISTS `ebook_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebook_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `subCatOf_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ebook_category_952a12f3` (`subCatOf_id`),
  CONSTRAINT `ebook_category_subCatOf_id_126747c0_fk_ebook_category_id` FOREIGN KEY (`subCatOf_id`) REFERENCES `ebook_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebook_category`
--

LOCK TABLES `ebook_category` WRITE;
/*!40000 ALTER TABLE `ebook_category` DISABLE KEYS */;
INSERT INTO `ebook_category` VALUES (1,'Action',NULL),(2,'Fantastic',1),(3,'Magic',1),(4,'War',1),(5,'Mediaval',2),(6,'Learning',NULL),(7,'Programming',6),(8,'Roman',NULL);
/*!40000 ALTER TABLE `ebook_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebook_ebook`
--

DROP TABLE IF EXISTS `ebook_ebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebook_ebook` (
  `isbn` varchar(13) NOT NULL,
  `title` longtext NOT NULL,
  `version` int(11) NOT NULL,
  `release` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  PRIMARY KEY (`isbn`),
  KEY `ebook_ebook_4f331e2f` (`author_id`),
  KEY `ebook_ebook_2604cbea` (`publisher_id`),
  CONSTRAINT `ebook_ebook_author_id_3aab3737_fk_user_author_id` FOREIGN KEY (`author_id`) REFERENCES `user_author` (`id`),
  CONSTRAINT `ebook_ebook_publisher_id_45879e3d_fk_ebook_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `ebook_publisher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebook_ebook`
--

LOCK TABLES `ebook_ebook` WRITE;
/*!40000 ALTER TABLE `ebook_ebook` DISABLE KEYS */;
INSERT INTO `ebook_ebook` VALUES ('9780007322596','The Lord of the Rings: The Fellowship of the Ring, The Two Towers, The Return of the King',1,'2009-05-01 00:00:00.000000',1,3),('9780356509587','A Plague of Giants',1,'2017-10-01 00:00:00.000000',8,7),('9781316027356','Physics for the IB Diploma',1,'2017-10-01 00:00:00.000000',9,8),('9781405519229','THE CASUAL VACANCY',1,'2012-09-01 00:00:00.000000',2,2),('9781409147565','Two Kinds of Truth',1,'2017-10-01 00:00:00.000000',6,6),('9781473543348','Origin',1,'2017-10-01 00:00:00.000000',5,5),('9781491903100','Designing Data-Intensive Applications',1,'2017-10-01 00:00:00.000000',7,1),('9781491957615','Python for Data Analysis',1,'2017-09-01 00:00:00.000000',3,1);
/*!40000 ALTER TABLE `ebook_ebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebook_publisher`
--

DROP TABLE IF EXISTS `ebook_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebook_publisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebook_publisher`
--

LOCK TABLES `ebook_publisher` WRITE;
/*!40000 ALTER TABLE `ebook_publisher` DISABLE KEYS */;
INSERT INTO `ebook_publisher` VALUES (1,'OReilly Media'),(2,'Bloomsbury Publishing'),(3,'George Allen & Unwin (Publishers), Ltd'),(4,'Random House'),(5,'Transworld'),(6,'Orion'),(7,'Little, Brown Book Group'),(8,'Cambridge University Press');
/*!40000 ALTER TABLE `ebook_publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebook_rating`
--

DROP TABLE IF EXISTS `ebook_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebook_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rate` int(11) NOT NULL,
  `by_id` int(11) NOT NULL,
  `ebook_id` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ebook_rating_by_id_197da29_fk_auth_user_id` (`by_id`),
  KEY `ebook_rating_ebook_id_3a108d0f_fk_ebook_ebook_isbn` (`ebook_id`),
  CONSTRAINT `ebook_rating_by_id_197da29_fk_auth_user_id` FOREIGN KEY (`by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `ebook_rating_ebook_id_3a108d0f_fk_ebook_ebook_isbn` FOREIGN KEY (`ebook_id`) REFERENCES `ebook_ebook` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebook_rating`
--

LOCK TABLES `ebook_rating` WRITE;
/*!40000 ALTER TABLE `ebook_rating` DISABLE KEYS */;
INSERT INTO `ebook_rating` VALUES (1,5,1,'9780007322596'),(2,5,2,'9780007322596'),(3,1,3,'9780007322596'),(4,3,2,'9781491957615'),(5,3,2,'9781491957615'),(6,5,2,'9781473543348'),(7,5,3,'9781409147565'),(8,5,4,'9781491903100'),(9,4,1,'9780356509587'),(10,5,3,'9781316027356');
/*!40000 ALTER TABLE `ebook_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_author`
--

DROP TABLE IF EXISTS `user_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` longtext NOT NULL,
  `last_name` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_author`
--

LOCK TABLES `user_author` WRITE;
/*!40000 ALTER TABLE `user_author` DISABLE KEYS */;
INSERT INTO `user_author` VALUES (1,'J. R. R.','Tolkien'),(2,'J. K.','Rowling'),(3,'Wes','McKinney'),(4,'Yuval Noah','Harari'),(5,'Dan','Brown'),(6,'Michael','Connelly'),(7,'Martin','Kleppmann'),(8,'Kevin','Hearne'),(9,'K.A.','Tsokos');
/*!40000 ALTER TABLE `user_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_purchase`
--

DROP TABLE IF EXISTS `user_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `done` datetime(6) NOT NULL,
  `by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_purchase_by_id_7393f8e9_fk_auth_user_id` (`by_id`),
  CONSTRAINT `user_purchase_by_id_7393f8e9_fk_auth_user_id` FOREIGN KEY (`by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_purchase`
--

LOCK TABLES `user_purchase` WRITE;
/*!40000 ALTER TABLE `user_purchase` DISABLE KEYS */;
INSERT INTO `user_purchase` VALUES (1,'2017-12-17 13:43:22.977432',1),(2,'2017-12-17 13:43:22.985692',1),(3,'2017-12-17 13:43:23.002738',1),(4,'2017-12-17 13:43:23.039770',2),(5,'2017-12-17 13:43:23.048208',2),(6,'2017-12-17 13:43:23.069033',3),(7,'2017-12-17 13:43:23.069033',2),(8,'2017-12-17 13:43:23.069033',3),(9,'2017-12-17 13:43:23.069033',4),(10,'2017-12-17 13:43:23.069033',1),(11,'2017-12-17 13:43:23.069033',3);
/*!40000 ALTER TABLE `user_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userbookpurchase`
--

DROP TABLE IF EXISTS `user_userbookpurchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userbookpurchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ebook_id` varchar(13) NOT NULL,
  `from_purchase_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_userbookpurchase_ebook_id_69704771_fk_ebook_ebook_isbn` (`ebook_id`),
  KEY `user_userbookpurch_from_purchase_id_1ee5d419_fk_user_purchase_id` (`from_purchase_id`),
  CONSTRAINT `user_userbookpurch_from_purchase_id_1ee5d419_fk_user_purchase_id` FOREIGN KEY (`from_purchase_id`) REFERENCES `user_purchase` (`id`),
  CONSTRAINT `user_userbookpurchase_ebook_id_69704771_fk_ebook_ebook_isbn` FOREIGN KEY (`ebook_id`) REFERENCES `ebook_ebook` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userbookpurchase`
--

LOCK TABLES `user_userbookpurchase` WRITE;
/*!40000 ALTER TABLE `user_userbookpurchase` DISABLE KEYS */;
INSERT INTO `user_userbookpurchase` VALUES (1,'9781491957615',1),(2,'9781405519229',2),(3,'9780007322596',3),(4,'9781405519229',4),(5,'9780007322596',5),(6,'9781491957615',6),(7,'9781473543348',7),(8,'9781409147565',8),(9,'9781491903100',9),(10,'9780356509587',10),(11,'9781316027356',11);
/*!40000 ALTER TABLE `user_userbookpurchase` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-17 22:05:30
