-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: localhost    Database: mysite_db
-- ------------------------------------------------------
-- Server version	5.7.23

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
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add captcha store',6,'add_captchastore'),(22,'Can change captcha store',6,'change_captchastore'),(23,'Can delete captcha store',6,'delete_captchastore'),(24,'Can view captcha store',6,'view_captchastore'),(25,'Can add 博客',7,'add_blog'),(26,'Can change 博客',7,'change_blog'),(27,'Can delete 博客',7,'delete_blog'),(28,'Can view 博客',7,'view_blog'),(29,'Can add 分类',8,'add_category'),(30,'Can change 分类',8,'change_category'),(31,'Can delete 分类',8,'delete_category'),(32,'Can view 分类',8,'view_category'),(33,'Can add 博客配图',9,'add_randimg'),(34,'Can change 博客配图',9,'change_randimg'),(35,'Can delete 博客配图',9,'delete_randimg'),(36,'Can view 博客配图',9,'view_randimg'),(37,'Can add 用户',10,'add_userprofile'),(38,'Can change 用户',10,'change_userprofile'),(39,'Can delete 用户',10,'delete_userprofile'),(40,'Can view 用户',10,'view_userprofile'),(41,'Can add 轮播图',11,'add_banner'),(42,'Can change 轮播图',11,'change_banner'),(43,'Can delete 轮播图',11,'delete_banner'),(44,'Can view 轮播图',11,'view_banner'),(45,'Can add 邮箱验证码',12,'add_emailverifyreord'),(46,'Can change 邮箱验证码',12,'change_emailverifyreord'),(47,'Can delete 邮箱验证码',12,'delete_emailverifyreord'),(48,'Can view 邮箱验证码',12,'view_emailverifyreord'),(49,'Can add 用户评论',13,'add_usercomment'),(50,'Can change 用户评论',13,'change_usercomment'),(51,'Can delete 用户评论',13,'delete_usercomment'),(52,'Can view 用户评论',13,'view_usercomment'),(53,'Can add 用户收藏',14,'add_userfavor'),(54,'Can change 用户收藏',14,'change_userfavor'),(55,'Can delete 用户收藏',14,'delete_userfavor'),(56,'Can view 用户收藏',14,'view_userfavor'),(57,'Can add 用户消息',15,'add_usermessage'),(58,'Can change 用户消息',15,'change_usermessage'),(59,'Can delete 用户消息',15,'delete_usermessage'),(60,'Can view 用户消息',15,'view_usermessage'),(61,'Can add 用户访问',16,'add_uservisit'),(62,'Can change 用户访问',16,'change_uservisit'),(63,'Can delete 用户访问',16,'delete_uservisit'),(64,'Can view 用户访问',16,'view_uservisit');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs_blog`
--

DROP TABLE IF EXISTS `blogs_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_nums` int(11) NOT NULL,
  `favor_nums` int(11) NOT NULL,
  `read_nums` int(11) NOT NULL,
  `like_nums` int(11) NOT NULL,
  `posted_time` datetime(6) NOT NULL,
  `last_modified_time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_blog_author_id_fb67c004_fk_users_userprofile_id` (`author_id`),
  KEY `blogs_blog_category_id_3cfdf215_fk_blogs_category_id` (`category_id`),
  CONSTRAINT `blogs_blog_author_id_fb67c004_fk_users_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `blogs_blog_category_id_3cfdf215_fk_blogs_category_id` FOREIGN KEY (`category_id`) REFERENCES `blogs_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs_blog`
--

LOCK TABLES `blogs_blog` WRITE;
/*!40000 ALTER TABLE `blogs_blog` DISABLE KEYS */;
INSERT INTO `blogs_blog` VALUES (1,'JS变量','<p>ME</p>',0,0,2,1,'2018-12-09 20:56:37.538017','2018-12-10 10:29:41.564487',1,1);
/*!40000 ALTER TABLE `blogs_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs_category`
--

DROP TABLE IF EXISTS `blogs_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs_category`
--

LOCK TABLES `blogs_category` WRITE;
/*!40000 ALTER TABLE `blogs_category` DISABLE KEYS */;
INSERT INTO `blogs_category` VALUES (1,'JS');
/*!40000 ALTER TABLE `blogs_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs_randimg`
--

DROP TABLE IF EXISTS `blogs_randimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs_randimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rand_img` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posted_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs_randimg`
--

LOCK TABLES `blogs_randimg` WRITE;
/*!40000 ALTER TABLE `blogs_randimg` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs_randimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashkey` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (1,'USRR','usrr','4de6d6eac8ceb38e5f7221cd19346be4082a1604','2018-12-10 10:35:17.992437'),(2,'LDER','lder','27dc26b6a6d7d53d1d396e45f01e747aba77ed8b','2018-12-10 10:35:25.743104');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-12-09 20:56:34.691030','1','JS',1,'[{\"added\": {}}]',8,1),(2,'2018-12-09 20:56:37.539013','1','JS变量',1,'[{\"added\": {}}]',7,1),(3,'2018-12-09 22:37:31.912848','37','<p>五朵唯</p>\r\n',3,'',13,1),(4,'2018-12-09 22:37:32.006611','36','<p>当时年少</p>\r\n',3,'',13,1),(5,'2018-12-09 22:37:32.050602','35','<p>看不清</p>\r\n',3,'',13,1),(6,'2018-12-09 22:37:32.184793','34','<p>昨夜星辰昨夜风</p>\r\n',3,'',13,1),(7,'2018-12-09 22:37:32.228868','33','<p>展翅高飞</p>\r\n',3,'',13,1),(8,'2018-12-09 22:37:32.273227','32','<p>啊</p>\r\n',3,'',13,1),(9,'2018-12-09 22:37:32.317577','31','<p>zuo</p>\r\n',3,'',13,1),(10,'2018-12-09 22:37:32.362133','30','<p>关于年</p>\r\n',3,'',13,1),(11,'2018-12-09 22:37:32.406679','29','<p>之短情长啊</p>\r\n',3,'',13,1),(12,'2018-12-09 22:37:32.451451','28','<p>四点五十&middot;</p>\r\n',3,'',13,1),(13,'2018-12-09 22:37:32.495613','27','<p>关于你</p>\r\n',3,'',13,1),(14,'2018-12-09 22:37:32.540486','26','<p>111</p>\r\n',3,'',13,1),(15,'2018-12-09 22:37:32.618455','25','<p>111</p>\r\n',3,'',13,1),(16,'2018-12-09 22:37:32.684975','24','<p>111</p>\r\n',3,'',13,1),(17,'2018-12-09 22:37:32.751966','23','<p>111</p>\r\n',3,'',13,1),(18,'2018-12-09 22:37:32.807244','22','<p>111</p>\r\n',3,'',13,1),(19,'2018-12-09 22:37:32.888078','21','<p>111</p>\r\n',3,'',13,1),(20,'2018-12-09 22:37:32.951949','20','<p>999</p>\r\n',3,'',13,1),(21,'2018-12-09 22:37:33.027903','19','<p>999</p>\r\n',3,'',13,1),(22,'2018-12-09 22:37:33.083870','18','<p>999</p>\r\n',3,'',13,1),(23,'2018-12-09 22:37:33.166824','17','<p>111</p>\r\n',3,'',13,1),(24,'2018-12-09 22:37:33.205801','16','<p>999</p>\r\n',3,'',13,1),(25,'2018-12-09 22:37:33.249910','15','<p>999</p>\r\n',3,'',13,1),(26,'2018-12-09 22:37:33.296051','14','<p>888</p>\r\n',3,'',13,1),(27,'2018-12-09 22:37:33.339887','13','<p>999</p>\r\n',3,'',13,1),(28,'2018-12-09 22:37:33.385746','12','<p>888</p>\r\n',3,'',13,1),(29,'2018-12-09 22:37:33.428887','11','<p>777</p>\r\n',3,'',13,1),(30,'2018-12-09 22:37:33.474045','10','<p>111</p>\r\n',3,'',13,1),(31,'2018-12-09 22:37:33.517998','9','<p>222</p>\r\n',3,'',13,1),(32,'2018-12-09 22:37:33.562202','8','<p>333</p>\r\n',3,'',13,1),(33,'2018-12-09 22:37:33.606431','7','<p>444</p>\r\n',3,'',13,1),(34,'2018-12-09 22:37:33.651521','6','<p>666</p>\r\n',3,'',13,1),(35,'2018-12-09 22:37:33.694864','5','<p>666</p>\r\n',3,'',13,1),(36,'2018-12-09 22:37:33.739915','4','<p>666</p>\r\n',3,'',13,1),(37,'2018-12-09 22:37:33.784256','3','<p>Hello</p>\r\n',3,'',13,1),(38,'2018-12-09 22:37:33.828868','2','<p>阿斯旺</p>\r\n',3,'',13,1),(39,'2018-12-09 22:37:33.885885','1','<p>阿斯旺</p>\r\n',3,'',13,1),(40,'2018-12-09 22:37:56.877995','37','<p>五朵唯</p>\r\n',3,'',13,1),(41,'2018-12-09 22:37:56.923747','36','<p>当时年少</p>\r\n',3,'',13,1);
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
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(7,'blogs','blog'),(8,'blogs','category'),(9,'blogs','randimg'),(6,'captcha','captchastore'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(13,'user_operations','usercomment'),(14,'user_operations','userfavor'),(15,'user_operations','usermessage'),(16,'user_operations','uservisit'),(11,'users','banner'),(12,'users','emailverifyreord'),(10,'users','userprofile');
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
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-12-09 20:53:36.507763'),(2,'contenttypes','0002_remove_content_type_name','2018-12-09 20:53:37.742082'),(3,'auth','0001_initial','2018-12-09 20:53:41.922786'),(4,'auth','0002_alter_permission_name_max_length','2018-12-09 20:53:42.750857'),(5,'auth','0003_alter_user_email_max_length','2018-12-09 20:53:42.797748'),(6,'auth','0004_alter_user_username_opts','2018-12-09 20:53:42.860256'),(7,'auth','0005_alter_user_last_login_null','2018-12-09 20:53:42.922752'),(8,'auth','0006_require_contenttypes_0002','2018-12-09 20:53:42.954003'),(9,'auth','0007_alter_validators_add_error_messages','2018-12-09 20:53:43.016470'),(10,'auth','0008_alter_user_username_max_length','2018-12-09 20:53:43.078965'),(11,'auth','0009_alter_user_last_name_max_length','2018-12-09 20:53:43.157093'),(12,'users','0001_initial','2018-12-09 20:53:49.827426'),(13,'admin','0001_initial','2018-12-09 20:53:52.131874'),(14,'admin','0002_logentry_remove_auto_add','2018-12-09 20:53:52.194373'),(15,'admin','0003_logentry_add_action_flag_choices','2018-12-09 20:53:52.279079'),(16,'blogs','0001_initial','2018-12-09 20:53:53.383188'),(17,'blogs','0002_auto_20181209_2043','2018-12-09 20:53:56.559181'),(18,'captcha','0001_initial','2018-12-09 20:53:56.984274'),(19,'sessions','0001_initial','2018-12-09 20:53:57.785487'),(20,'user_operations','0001_initial','2018-12-09 20:53:59.413586'),(21,'user_operations','0002_auto_20181209_2043','2018-12-09 20:54:17.151777'),(22,'users','0002_auto_20181209_2055','2018-12-09 20:55:14.126999');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('97wc2h5vjfpfm56qdj4ng5tou759jvee','Mjk2Nzk1ZjNhYWZkYTJjZDIxMjQ2MzY1YzljYWRkYjhjYmYyNjI3NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM2YTY4NWFmYzdiNzM4N2NkZjk5Nzc0OTZmN2U2ZjkxODQ2NDY3YWIifQ==','2018-12-23 21:27:32.920859');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operations_usercomment`
--

DROP TABLE IF EXISTS `user_operations_usercomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operations_usercomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_time` datetime(6) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `reply_whom_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operations_usercomment_blog_id_a277484c_fk_blogs_blog_id` (`blog_id`),
  KEY `user_operations_user_parent_id_58589d9d_fk_user_oper` (`parent_id`),
  KEY `user_operations_user_reply_whom_id_c5bcc8cb_fk_user_oper` (`reply_whom_id`),
  KEY `user_operations_user_root_id_2c61b2af_fk_user_oper` (`root_id`),
  KEY `user_operations_user_user_id_86b03451_fk_users_use` (`user_id`),
  CONSTRAINT `user_operations_user_parent_id_58589d9d_fk_user_oper` FOREIGN KEY (`parent_id`) REFERENCES `user_operations_usercomment` (`id`),
  CONSTRAINT `user_operations_user_reply_whom_id_c5bcc8cb_fk_user_oper` FOREIGN KEY (`reply_whom_id`) REFERENCES `user_operations_usercomment` (`id`),
  CONSTRAINT `user_operations_user_root_id_2c61b2af_fk_user_oper` FOREIGN KEY (`root_id`) REFERENCES `user_operations_usercomment` (`id`),
  CONSTRAINT `user_operations_user_user_id_86b03451_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `user_operations_usercomment_blog_id_a277484c_fk_blogs_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blogs_blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operations_usercomment`
--

LOCK TABLES `user_operations_usercomment` WRITE;
/*!40000 ALTER TABLE `user_operations_usercomment` DISABLE KEYS */;
INSERT INTO `user_operations_usercomment` VALUES (1,'<p>阿斯旺</p>\r\n','2018-12-09 21:28:40.523651',1,NULL,NULL,NULL,1),(2,'<p>阿斯旺</p>\r\n','2018-12-09 21:29:57.814212',1,NULL,NULL,NULL,1),(3,'<p>Hello</p>\r\n','2018-12-09 21:30:29.870283',1,1,NULL,NULL,1),(4,'<p>666</p>\r\n','2018-12-09 21:31:36.377061',1,NULL,NULL,NULL,1),(5,'<p>666</p>\r\n','2018-12-09 21:31:41.094875',1,NULL,NULL,NULL,1),(6,'<p>666</p>\r\n','2018-12-09 21:31:50.736821',1,NULL,NULL,NULL,1),(7,'<p>444</p>\r\n','2018-12-09 21:38:03.947252',1,NULL,NULL,NULL,1),(8,'<p>333</p>\r\n','2018-12-09 21:39:04.664376',1,NULL,NULL,NULL,1),(9,'<p>222</p>\r\n','2018-12-09 21:40:28.773905',1,NULL,NULL,NULL,1),(10,'<p>111</p>\r\n','2018-12-09 21:41:29.670509',1,NULL,NULL,NULL,1),(11,'<p>777</p>\r\n','2018-12-09 21:44:52.704316',1,NULL,NULL,NULL,1),(12,'<p>888</p>\r\n','2018-12-09 21:45:23.447580',1,NULL,NULL,NULL,1),(13,'<p>999</p>\r\n','2018-12-09 21:46:04.341512',1,NULL,NULL,NULL,1),(14,'<p>888</p>\r\n','2018-12-09 21:46:38.166525',1,NULL,NULL,NULL,1),(15,'<p>999</p>\r\n','2018-12-09 21:48:21.235761',1,5,NULL,NULL,1),(16,'<p>999</p>\r\n','2018-12-09 21:48:21.235761',1,5,NULL,NULL,1),(17,'<p>111</p>\r\n','2018-12-09 21:48:21.251383',1,NULL,NULL,NULL,1),(18,'<p>999</p>\r\n','2018-12-09 21:48:21.251383',1,5,NULL,NULL,1),(19,'<p>999</p>\r\n','2018-12-09 21:48:21.267008',1,5,NULL,NULL,1),(20,'<p>999</p>\r\n','2018-12-09 21:48:21.267008',1,5,NULL,NULL,1),(21,'<p>111</p>\r\n','2018-12-09 21:48:21.532660',1,NULL,NULL,NULL,1),(22,'<p>111</p>\r\n','2018-12-09 21:48:32.944633',1,NULL,NULL,NULL,1),(23,'<p>111</p>\r\n','2018-12-09 21:48:36.989577',1,NULL,NULL,NULL,1),(24,'<p>111</p>\r\n','2018-12-09 21:48:37.989670',1,NULL,NULL,NULL,1),(25,'<p>111</p>\r\n','2018-12-09 21:49:03.564813',1,NULL,NULL,NULL,1),(26,'<p>111</p>\r\n','2018-12-09 21:50:38.295481',1,NULL,NULL,NULL,1),(27,'<p>关于你</p>\r\n','2018-12-09 21:52:19.619733',1,NULL,NULL,NULL,1),(28,'<p>四点五十&middot;</p>\r\n','2018-12-09 21:53:09.679722',1,NULL,NULL,NULL,1),(29,'<p>之短情长啊</p>\r\n','2018-12-09 21:53:37.123416',1,NULL,NULL,NULL,1),(30,'<p>关于年</p>\r\n','2018-12-09 21:53:50.960025',1,23,NULL,NULL,1),(31,'<p>zuo</p>\r\n','2018-12-09 22:29:28.993462',1,4,NULL,NULL,1),(32,'<p>啊</p>\r\n','2018-12-09 22:29:38.881908',1,27,NULL,NULL,1),(33,'<p>展翅高飞</p>\r\n','2018-12-09 22:29:58.824876',1,27,NULL,NULL,1),(34,'<p>昨夜星辰昨夜风</p>\r\n','2018-12-09 22:32:20.553513',1,27,NULL,NULL,1),(35,'<p>看不清</p>\r\n','2018-12-09 22:35:34.943202',1,29,NULL,29,1),(38,'<p>回头望一眼</p>\r\n','2018-12-09 22:38:17.567293',1,NULL,NULL,NULL,1),(39,'<p>回头望一眼</p>\r\n','2018-12-09 22:38:19.703798',1,NULL,NULL,NULL,1),(40,'<p>的时间</p>\r\n','2018-12-09 22:38:48.884529',1,39,NULL,39,1),(41,'<p>啊哈哈</p>\r\n','2018-12-09 22:40:02.973698',1,39,NULL,39,1),(42,'<p>动画</p>\r\n','2018-12-09 22:40:19.256993',1,39,NULL,39,1),(43,'<p>东爱护</p>\r\n','2018-12-09 22:40:34.272003',1,NULL,NULL,NULL,1),(44,'<p>我从崖边跌落&middot;</p>\r\n\r\n<p>&nbsp;</p>\r\n','2018-12-09 22:42:52.916577',1,NULL,NULL,NULL,1),(45,'<p>黄沙海洋</p>\r\n','2018-12-09 22:43:40.219674',1,28,NULL,28,1),(46,'<p>1234</p>\r\n','2018-12-09 22:43:45.386687',1,28,NULL,28,1),(47,'<p>1234</p>\r\n','2018-12-09 22:43:56.142436',1,NULL,NULL,NULL,1),(48,'<p><img alt=\"yes\" height=\"23\" src=\"http://localhost:8000/static/ckeditor/ckeditor/plugins/smiley/images/thumbs_up.png\" title=\"yes\" width=\"23\" /></p>\r\n','2018-12-09 22:44:11.373268',1,44,NULL,44,1),(49,'<p>撒</p>\r\n','2018-12-09 22:44:17.672353',1,NULL,NULL,NULL,1),(50,'<p><img alt=\"wink\" height=\"23\" src=\"http://localhost:8000/static/ckeditor/ckeditor/plugins/smiley/images/wink_smile.png\" title=\"wink\" width=\"23\" /></p>\r\n','2018-12-09 22:44:24.277197',1,48,NULL,44,1),(51,'<p><img alt=\"wink\" height=\"23\" src=\"http://localhost:8000/static/ckeditor/ckeditor/plugins/smiley/images/wink_smile.png\" title=\"wink\" width=\"23\" /></p>\r\n','2018-12-09 22:44:29.611595',1,48,NULL,44,1),(52,'<p><img alt=\"smiley\" height=\"23\" src=\"http://localhost:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" title=\"smiley\" width=\"23\" /></p>\r\n','2018-12-09 22:44:36.377388',1,48,NULL,44,1),(53,'<p>haliluya</p>\r\n','2018-12-09 22:46:31.088271',1,49,NULL,49,1),(54,'<p>as1</p>\r\n','2018-12-09 22:46:37.796837',1,49,NULL,49,1),(55,'<p>sasx1</p>\r\n','2018-12-09 22:47:35.327490',1,NULL,NULL,NULL,1),(56,'<p>sdxc2q</p>\r\n','2018-12-09 22:47:40.425700',1,49,NULL,49,1),(57,'<p>zhanchi</p>\r\n','2018-12-09 22:47:51.414926',1,NULL,NULL,NULL,1),(58,'<p>katu1</p>\r\n','2018-12-09 22:48:02.681847',1,53,NULL,49,1),(59,'<p>zahnchi1</p>\r\n','2018-12-09 22:49:56.174384',1,NULL,NULL,NULL,1),(60,'<p>sas1</p>\r\n','2018-12-09 22:50:05.065802',1,53,NULL,49,1),(61,'<p>xsaxa</p>\r\n','2018-12-09 22:50:13.477863',1,60,NULL,49,1),(62,'<p>qasasx1</p>\r\n','2018-12-09 22:50:24.235921',1,NULL,NULL,NULL,1),(63,'<p>xaxzx</p>\r\n','2018-12-09 22:50:31.096460',1,NULL,NULL,NULL,1),(64,'<p>axzx</p>\r\n','2018-12-09 22:50:48.003199',1,55,NULL,55,1),(65,'<p>xzxzas</p>\r\n','2018-12-09 22:50:52.881912',1,NULL,NULL,NULL,1),(66,'<p>xzzc x cs</p>\r\n','2018-12-09 22:50:56.573650',1,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `user_operations_usercomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operations_userfavor`
--

DROP TABLE IF EXISTS `user_operations_userfavor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operations_userfavor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_thumb_up` tinyint(1) NOT NULL,
  `favor_created_time` datetime(6) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operations_userfavor_blog_id_08a65206_fk_blogs_blog_id` (`blog_id`),
  KEY `user_operations_user_user_id_bc6020c6_fk_users_use` (`user_id`),
  CONSTRAINT `user_operations_user_user_id_bc6020c6_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `user_operations_userfavor_blog_id_08a65206_fk_blogs_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blogs_blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operations_userfavor`
--

LOCK TABLES `user_operations_userfavor` WRITE;
/*!40000 ALTER TABLE `user_operations_userfavor` DISABLE KEYS */;
INSERT INTO `user_operations_userfavor` VALUES (1,1,'2018-12-09 20:56:59.568513',1,1);
/*!40000 ALTER TABLE `user_operations_userfavor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operations_usermessage`
--

DROP TABLE IF EXISTS `user_operations_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operations_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_send_time` datetime(6) NOT NULL,
  `message_nums` int(11) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operations_user_user_id_e0d85c3f_fk_users_use` (`user_id`),
  CONSTRAINT `user_operations_user_user_id_e0d85c3f_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operations_usermessage`
--

LOCK TABLES `user_operations_usermessage` WRITE;
/*!40000 ALTER TABLE `user_operations_usermessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_operations_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operations_uservisit`
--

DROP TABLE IF EXISTS `user_operations_uservisit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operations_uservisit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `click_nums` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operations_user_user_id_a4109de0_fk_users_use` (`user_id`),
  CONSTRAINT `user_operations_user_user_id_a4109de0_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operations_uservisit`
--

LOCK TABLES `user_operations_uservisit` WRITE;
/*!40000 ALTER TABLE `user_operations_uservisit` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_operations_uservisit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyreord`
--

DROP TABLE IF EXISTS `users_emailverifyreord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyreord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyreord`
--

LOCK TABLES `users_emailverifyreord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyreord` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_emailverifyreord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `portrait` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$120000$Kd7nHieGWSqI$OFFpMcpweMj32QcxsGePtzA6IZm1BkvmYCpIRACiYo0=','2018-12-09 21:27:32.865891',1,'ME','','','1412830255@qq.com',1,'2018-12-09 20:55:53.332122',NULL,NULL,'女','image/default.png',1);
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-11  8:48:23
