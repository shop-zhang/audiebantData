 -- MySQL dump 10.13  Distrib 5.7.16, for osx10.11 (x86_64)
--
-- Host: localhost    Database: ywauto
-- ------------------------------------------------------
-- Server version	5.7.16

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
-- Table structure for table `db_server_info`
--

DROP TABLE IF EXISTS `db_server_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_server_info` (
  `db_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `db_name` varchar(50) DEFAULT NULL COMMENT 'db名称',
  `server_id` int(11) NOT NULL DEFAULT '0' COMMENT '服务器id',
  `db_server_type` int(11) NOT NULL DEFAULT '1' COMMENT '集群角色 1 master 2 slave',
  `db_type` int(11) NOT NULL DEFAULT '1' COMMENT 'db类型 1 mysql 2 redis 3 mongodb 4 elasticsearch',
  `db_port` varchar(30) NOT NULL DEFAULT '22' COMMENT '数据库端口',
  `db_user` varchar(50) DEFAULT NULL COMMENT '数据库账号',
  `db_passport` varchar(50) DEFAULT NULL COMMENT '数据库密码',
  `default_dbname` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`db_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Db信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_server_info`
--

LOCK TABLES `db_server_info` WRITE;
/*!40000 ALTER TABLE `db_server_info` DISABLE KEYS */;
INSERT INTO `db_server_info` VALUES (1,'p2p-test-db-249',3,1,1,'3306','root','root','Biz','2017-09-25 09:25:22','2017-10-11 03:56:07'),(2,'p2p-test-redis-249',3,1,2,'6379','','',NULL,'2017-09-25 10:16:10','2017-09-25 10:16:10');
/*!40000 ALTER TABLE `db_server_info` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-08-17 09:35:05.783413'),(2,'auth','0001_initial','2017-08-17 09:35:06.122730'),(3,'admin','0001_initial','2017-08-17 09:35:06.196530'),(4,'admin','0002_logentry_remove_auto_add','2017-08-17 09:35:06.235887'),(5,'contenttypes','0002_remove_content_type_name','2017-08-17 09:35:06.311087'),(6,'auth','0002_alter_permission_name_max_length','2017-08-17 09:35:06.344057'),(7,'auth','0003_alter_user_email_max_length','2017-08-17 09:35:06.377861'),(8,'auth','0004_alter_user_username_opts','2017-08-17 09:35:06.396680'),(9,'auth','0005_alter_user_last_login_null','2017-08-17 09:35:06.441380'),(10,'auth','0006_require_contenttypes_0002','2017-08-17 09:35:06.444108'),(11,'auth','0007_alter_validators_add_error_messages','2017-08-17 09:35:06.458077');
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('03z688gq55cbk7ecktv69hpems0cf049','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-08-08 03:05:08'),('094gfxnckyhpm9i0kv6oozf48mri6rdy','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-27 10:10:17'),('17vpu87yprafs9ewzwdrt0f69sms2cpa','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-07 01:20:04'),('1ovxv6neoneoa5u8nwj2wpzq7o25087g','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-20 02:55:42'),('23vb65jf6epen90gbssa5kqdvgq97sce','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-28 10:03:31'),('2xyv31mv72kcotg5mg8egd0rey3e0rw4','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-04 09:11:19'),('3tqig88eoz88bq77gh3zp5z7f0y55rjr','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-28 07:09:44'),('47e4e2h5c2kw193l0tdx7ez6szu6bo4l','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-08-22 02:27:55'),('4amjkrf36nri3arx7lmyegdwwoficd6x','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-20 07:48:01'),('4nc990s91pnj1v8ruob5dwqumaub5w0a','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-08-21 06:44:56'),('4on6wxqpyq1xfhy5c6vdu9r9exgns6u3','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-16 09:00:11'),('54dn1pocmi2mjdyvu6f255k6mhtgs44q','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-28 09:09:41'),('5eshwwjh3xvdfro13y5m15sic81d3g7o','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-09-07 04:00:55'),('5mbd970tgm90z8egwx6qr8zqxq7zpsx2','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-27 14:02:22'),('5momyve2f7nw4up2eb5i3627ocnp0pv3','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-08 09:32:35'),('5n673uunm7s10agie6rmzjauu7n0xess','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-23 02:42:20'),('5s6lk3txc6lwtq8ylrml2ytdsrzhew6a','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-20 07:12:10'),('6634979gs6f9mxwu13set4x74pj6f0y1','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-08-16 09:29:11'),('666uce5s5hhbby88zx35wdm66yvaozyb','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-08-01 11:04:47'),('6bmtnz5f09cld116248dylkhh4fli9qg','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-08-21 10:40:25'),('6e8ucga2mcyla5dvft8bau13d66p42wc','YzgyYjIzNzZmMzM3MjA3NjgwOTIzYzcyNzVmOGNlYWQ4ZjE4OWM1Yjp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-11-08 03:14:46'),('6zbo29uqb5mdanp3efe8hmz0od4fa2o4','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 10:26:48'),('71vqkeick03orvn03svtv05xmyzhs28j','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-28 02:40:59'),('71w1nh3sw8vlvimnd9aquwe2pq9smi4z','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-26 04:21:55'),('75t9nr08oegqfkl5pq0bgy978dwu34uu','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 09:56:36'),('7zuivrmxye5dby3792jvuzfj38bjava7','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-19 08:56:19'),('815djydfq7yui49ht2dx30t4oont5dhq','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 03:23:50'),('81qmcz5u979qw1x561f3gox1mapw8mpy','Y2UwNThiOGIxOGIyYjZmZTYxMzAwNjA0M2Q5ZGEyOTBiMTQzNjQ0ZDp7InNlc3NfdXNlcmlkIjo1LCJzZXNzX3VzZXJuYW1lIjoicGFuc2VuIiwic2Vzc191c2Vycm9sZSI6Mn0=','2017-08-23 11:06:13'),('87n435nyqjxzw7asqm4fi72z7yt9xe0k','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-25 09:15:00'),('8hrillsvsvuwcd543tth7ru1rp6s78dg','YzgyYjIzNzZmMzM3MjA3NjgwOTIzYzcyNzVmOGNlYWQ4ZjE4OWM1Yjp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-08-21 11:01:55'),('8l96eowctl2qu2yorr7festr8ogo5jn0','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-28 08:11:01'),('8oqs5okda3ggu62nbnlqv51j6k9qkxsb','YzgyYjIzNzZmMzM3MjA3NjgwOTIzYzcyNzVmOGNlYWQ4ZjE4OWM1Yjp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-08-09 11:45:37'),('8txpa5i2zan9hdnporliou9ot7no5nig','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 10:57:05'),('9mwkf44n7am9ab43iabtn2l2o2xtuq5p','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-25 03:59:06'),('9z54mhbedd90yik63rgfr6c2jte5y8ou','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-14 13:05:10'),('a6gtgtc85z4o0dwlf8l9guth0ybzhr6b','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 08:27:19'),('aoc3jpyg3pr3j42xrb4pa96lyb3nasvi','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-20 04:19:18'),('aqjabtyers43db7swrrceghe3rknjmzc','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-11 02:19:05'),('aqofvabt6ksyxxusuj0df7la3io89f8k','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-04 09:41:23'),('ar4a1g43lbh69vwahqes24zn1d4mjvtw','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2017-07-21 02:17:55'),('au06conkrbxzugekkz3u8izujh57r6ne','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-18 09:08:05'),('azug3yrcbv1nmlkvmu6ftra0ptbnjm7q','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2017-01-06 08:38:28'),('b398rsxnjz06m3lgukm2ibgc8lnwupd5','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-08 09:04:59'),('b6dgrqj7fwsjnmlsr6du8jbv4qt6dvjx','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-28 02:44:04'),('btlzveqjw82mingfr02hwukbj67odqdo','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-08-22 10:32:24'),('bw56k9bp8odzfw6683vegb6ogpn56h3b','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-26 07:00:08'),('cize3itqj7cp1i5moidx79sstic6a3up','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-18 09:43:28'),('coxj9l7ntcs8jsepipcrq3plhv2kxmny','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-25 02:08:37'),('cqo16sjjdn1mh4hxcf6ozn0auhxv1am7','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-08-22 07:11:23'),('csi57v297hy6jf5yz8fml1sg20fj8t62','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-26 02:11:37'),('cyp6dluhgdeh7llwja3tbld6do5c6ssy','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-21 05:27:22'),('cz5f6cjb9uwkliamndhgmpno0xb4j6bt','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-11 01:45:28'),('d1oifzkrhl33ethykl3kzihjahodnqt3','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-25 06:39:00'),('d244iuehfmgedxgsa1jdiy4zrid8g3xz','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-08-03 03:01:32'),('d26bogrlqp2zasmxrsqjoclbmr4pigab','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 01:36:08'),('dfussz5nyjs51dtdy0igxnc4xfa8zzny','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-11 08:21:02'),('dktrnyli8nvab06u35kye445j6r3tobn','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-08-25 11:09:34'),('dpxo5pgxkn5z9f8pp90z0puwytl89qht','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2017-01-06 10:13:40'),('dzv7t0hebp8p4v2adpriy9fayrjl5thb','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-05 10:29:13'),('e0u9ddlwiqv6opk2gcay0d4jfpmq8m8g','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-08-17 03:21:34'),('eq56eh6vbznot80cknoifm9yc5l31ful','MDU1ZWI3NDQ0YjVhNTY4NjIzNzhmNTM2NGY1NjhjMzQ5OTc1ZWM0ODp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxLCJzZXNzX3VzZXJ0eXBlIjoiIn0=','2016-07-05 09:30:06'),('g673iu6hvs0gsmg5vly4pz2gl4ntn1hb','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-11 04:10:40'),('gjo6g6agxb0b3rx9839et1tc94u6569e','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-26 08:46:32'),('gopigu9x8zu5hccp5vzp72ipfiz7uo1q','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-12 07:55:57'),('gqzmi9ese87w0ays8xbwwyghbklk49mt','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-11 01:46:51'),('grnlaw26tdvqb6sd02d7rb7rd7n4asqq','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-11 03:39:15'),('gwkq0rmu9169n200elp2dp2hqggbmccr','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-27 10:39:52'),('h8oai4runc0ai5vfuh7e07hxg6pgbcni','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-26 08:08:23'),('hcq031dxkr61etq4ecf2v5ygpiaxie9t','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-20 03:35:38'),('hfjw27u9gopn625wfsq5besebc76g5r5','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-18 11:28:27'),('i80bvz9z1bnwhbyeds6ri3i1yqw7wnk0','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-25 10:48:32'),('ibwbauim0nl1hfxcn1h3oa7t124vzl47','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-20 09:32:49'),('iop4hv5j0eml49r3n8ijuoa85t3tnn7h','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-26 03:39:14'),('j1tlr4vf4b4rrrz00ghhk4nor9inadax','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-21 04:03:32'),('k4kjwttyz0ttz1ob1rkt1yuzvmdjagkh','ZDg0YjIwY2MzMDVhNTgxOGQwNWZhZDkwMjU0OTYyNjhlMDIwYmUyMjp7InNlc3NfYWRtaW4iOiJhZG1pbiIsInNlc3NfdXNlcnJvbGUiOjEsInNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJ0eXBlIjoiIiwic2Vzc191c2VybmFtZSI6ImFkbWluIiwic2Vzc190eXBlIjoxfQ==','2016-07-06 01:22:43'),('k6lypno3qiv3tmtphvdp77d1uerzozh2','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-23 03:12:26'),('kfabezqvhcvv3m9p2jv2cnp12ctoka1p','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-25 07:58:33'),('kqx0naztjn5jo3two9tqaopc78jwzrjr','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-20 10:06:40'),('l2ugnj3egc4j9kt96esxoffc0ghkg6kc','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-28 07:40:11'),('l6frgrwxypplp9s68q9jhp5j9o61z24n','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-18 08:16:49'),('lxhn8p997cfu0u3h3amu47yc1h026aue','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 07:54:52'),('mcp2ck48eed421qj6xuiqs7sjvu2kiyw','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 06:04:44'),('me65njwjvm3s3rh20oeyjvl67srmqb7k','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-08-21 11:17:12'),('mihxrqrzwn8mvnozn33kwhsb10rydtqx','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 09:01:48'),('mphn9357eclh4qsp67vr8e3ovmipp5p5','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-23 09:20:49'),('mppvavw8cnyxforkpb0tpj8jnqf2r6kc','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-13 02:25:41'),('n1pfbtkkxspydiz5opd9gfp6fseme7w7','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-08-03 01:00:24'),('n2rzxoe8ton7xlbhtr6u0o5unelnjp88','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-20 02:24:55'),('ncxxfzsf42q89fjj6ddumxupmyrcafac','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-20 01:22:23'),('nsk7t6t00ll9c1lnjm65fyewgirqwsj0','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-11 09:59:16'),('o1oqrfgolgv4ekutka6gccmhyx86va0g','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 02:21:40'),('o1qwz4yobggnw5dvsfwl96buk3lkj7z8','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-11 14:14:08'),('o8uwkhjhrt28dat6pdf7qv1wlxntpb0q','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-08-21 10:09:38'),('ocbve7cimt1dsc29wq7wbeqbthguywbn','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 04:30:06'),('ohjgtsypamubl7ngkt0qchipj4szsqgk','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 02:52:28'),('olknirtpt8xpe2uqpo8qwjjf2ew419kz','YzgyYjIzNzZmMzM3MjA3NjgwOTIzYzcyNzVmOGNlYWQ4ZjE4OWM1Yjp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-08-09 09:28:57'),('oq9xed8zldzqxpz30zbzo8vdnkmo9apo','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-23 04:20:43'),('oxisaj2vmuew7t7dmik0qt86x5nqjhts','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-27 10:43:19'),('p0p1tsbbg8w3vhrt3ds7vdge8dbyua0r','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-19 02:20:16'),('p7lfaisxhc6dvg2smhcjb4tyrn0mrsyz','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-28 03:18:06'),('p82f7sihkznc0o6wkhs3otd7acszix9i','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-08-21 09:39:01'),('pfd8vs5dnefz3of8ny2rfr30clppe3g2','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-20 06:41:48'),('pmwbxogduajuv5ls63bashymskn8qfxz','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-11 02:57:49'),('pynzdur1vg2fbkl8wwtbz0ipbj42qfbn','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-11 07:49:22'),('pys7c76e426m6eluhv0lvg4xx5zcut94','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-25 04:41:07'),('qnifdipbhdu2cv3ks7o9h9lcmek144iv','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-08-05 03:28:05'),('qp7jijib981w4dgykspfdvfkd6ofe5cn','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 06:38:14'),('qtlbw04922clolobhf11nzxr8z3a655j','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-08-02 00:45:54'),('r1lm523jwgplz4qcgeyq2zdo54b9pzs7','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-28 11:48:45'),('r8c33lqczni2x68ylu3oskahr1qzow4u','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-09-05 06:14:49'),('ricane8qgoif3nnwgb81zxirhwj825q1','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-08-21 05:54:52'),('rijk1garqxonqiet5ge9sbn7w6adaby8','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-21 07:20:58'),('rmn2j4fqjgkdsvgff8kf7sfq1l964vbg','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-28 01:54:58'),('rskj7ktb9cs10bfyz62rgyxzw2fp0pxw','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-20 04:12:36'),('s4huzl7mxmol9se8m0c1jzhh6o6vwvwq','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-12-15 01:51:54'),('sfdpnh2k7d7rouv2yqwhb610ka2a8jni','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-09-07 04:01:00'),('t2do0uzg4skx7so48axyo65soof1ew5g','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-29 03:37:58'),('t9xwf1tqz0whjagngwbhdnldgid2fk1c','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-25 07:15:17'),('tsb1ojmav891lsv3nlo2gv39oke1cmf4','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-15 09:32:45'),('tsx9ta8azh0l018c5dftkgoaj5d4cava','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-28 10:35:59'),('ttcxz83xml77rpjouahbhjbdlb038hqm','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-28 03:50:12'),('tuv3gzse94po5htbvr46ltj3l1qe59az','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-23 01:46:26'),('u4myf054a7ns0ewimqtc08fceaj2l69z','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-25 08:31:01'),('ulmcxf6m7j83lhs0qty8gah28zwmi3sn','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-12-14 01:05:01'),('uokdzdwtcqhdybrjx6cihzq3ma53vuoe','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-19 03:36:00'),('v5gmpi4zc4fudsxx9ym4bdd86cxplhqc','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 07:23:07'),('v7bufgd5rdbp01jbmds2o1bjo0u7s4gk','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-20 07:51:23'),('vd8vileqcdqjaik524upqlf9a7udqgl1','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-11 09:28:43'),('vdhvu62m21zt0we89lpzlj508gut7fs4','NjhjYWIyZWE5ZmRjMmUwOGM4MmNjOTEwMWNjMDRkMTIxZWE2NDZkNjp7InNlc3NfdXNlcmlkIjoyLCJzZXNzX3VzZXJuYW1lIjoiemhhbmdqaWFuIiwic2Vzc191c2Vycm9sZSI6Mn0=','2016-12-13 07:33:32'),('vna0fgl4bph64x4kvu3zc2ipxsy7nhfe','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-25 10:17:08'),('vuhyix9zd09h93rcm8tyi4o9ahpfsk5r','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-21 03:17:38'),('vy2m36ooerrktyeim1fugum2hf6h8c3b','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-07 05:36:41'),('w26k6krw7w058w9skh9yvms87dcdgho7','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 05:00:37'),('w4ljgcs4cdqd2cj39alw5hqti2nketz6','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-11 06:28:50'),('w9wmson57v92ic4ev7asleh0z1a6vbrb','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 11:46:13'),('whiit7ebaiec8b1xunhu8vk48lu69tpx','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-05 01:20:24'),('wp3j8vwm6eu3ex7ys0r2732r81e63fp6','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-12 06:27:07'),('ws9rcfbqz3solzskeifn8b6rq2pk3g5w','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-26 07:32:28'),('wu6ir9nkiq2ajxu8qx5rpfgjuznw7j9v','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-11 10:29:46'),('wvzwibe0b8py3g1hdoyc39yr3gida04k','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-27 08:26:53'),('wyaqidzrjbucoijnle72pb10pcbxnu1r','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-07 03:51:21'),('x2lazvf9wjkjbyol0dh80pil6fcnav3z','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-11 07:17:10'),('x5nvyh8c7wl610cxj10vu6itlelnstco','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-25 11:21:20'),('xe37chwq62p2f42t84ib3186zj5ddy6g','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-21 04:39:47'),('xpu5nz36xs6jn2e3sfntfvrzylmm4ser','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-20 09:10:15'),('xswnr8rz9cjpy60p3h76u783vdpv5vxj','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-08-09 06:51:51'),('xznf6d4r2santnzguzfsq6h067y0pb2e','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-27 07:31:17'),('y3efhcsk13a2mjqoy6rssch35b0owd94','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-12 03:59:11'),('y6mgty74x5n8c57jfvi98fm3cv9lz4q3','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-08-25 07:49:58'),('yak7zdr9kayv1n72cm0iid3gapcuy9tm','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-27 09:24:48'),('yml4wfmbx0f1qltke4brqw7oqlt5pmqb','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-25 09:45:44'),('ytmpg42v9ufkzkbjm5m5ojlout7aag53','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-08-21 08:44:18'),('z3qm13z1o2npd09qfkyd6tf38swnm8jx','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-13 03:25:07'),('z5zdynt32nrueqs3or6desft2fybcsfh','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2016-07-06 09:39:02'),('z8sali8ptmg6f3q1odiaqgsf1jmryueq','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-10-20 04:46:37'),('zk567zmgdj1lg7a9oldgz6av2zuagfh4','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2017-04-27 01:44:38'),('zrp40sdrk13lyx2ddsvzqcwr1cu51y69','OTk4MjdiOWVmYmUwZmRmMDdmMjBkNDIzNmVjNTZlMTk5ZDRjOWJhMDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoicm9vdCIsInNlc3NfdXNlcnJvbGUiOjF9','2017-09-20 07:15:51'),('zy35ojga4a5wvjzadj9z0oqvgsmiae64','MjVlNDkzNmEyYzY0YmQwNDhiM2VjZmUzOWM3YWM4ZjJiZGVhMDBjNDp7InNlc3NfdXNlcmlkIjoxLCJzZXNzX3VzZXJuYW1lIjoiYWRtaW4iLCJzZXNzX3VzZXJyb2xlIjoxfQ==','2017-07-20 02:57:22');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_info`
--

DROP TABLE IF EXISTS `menu_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_info` (
  `menuid` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(5) DEFAULT NULL COMMENT '父级菜单ID，如果是一级菜单就是0',
  `menuname` varchar(20) DEFAULT '' COMMENT '菜单名称',
  `action` varchar(255) DEFAULT '' COMMENT '动作',
  `sort` int(3) DEFAULT '255' COMMENT '排序',
  `style_type` varchar(50) DEFAULT '' COMMENT '图标样式',
  `status` int(1) DEFAULT '1' COMMENT '状态：1为生效，0为删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='左侧导航栏菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_info`
--

LOCK TABLES `menu_info` WRITE;
/*!40000 ALTER TABLE `menu_info` DISABLE KEYS */;
INSERT INTO `menu_info` VALUES (1,0,'仪表盘','/dashboard/',1,'lnr lnr-home',1,'2017-07-26 04:28:40','2017-07-26 11:46:27'),(2,0,'配置管理','',2,'lnr lnr-cog',1,'2017-07-26 04:30:01','2017-07-26 04:30:05'),(3,2,'导航栏配置','/menu/menulist/',2,'',1,'2017-07-26 04:31:41','2017-07-27 05:08:44'),(4,2,'用户配置','/user/userlist/',3,'',1,'2017-07-26 04:32:53','2017-07-26 04:32:59'),(22,2,'权限配置','/right/rightlist/',7,'',1,'2017-07-28 07:31:04','2017-07-28 07:31:04'),(23,0,'服务器管理','',23,'fa fa-server',1,'2017-08-17 01:13:56','2017-08-17 01:43:17'),(24,23,'服务器配置','/server/serverlist/',24,'',1,'2017-08-17 01:25:48','2017-08-17 01:43:19'),(25,23,'数据库配置','/dbserver/dbserverlist/',25,'',1,'2017-08-17 01:27:03','2017-08-17 01:43:22'),(26,0,'图标示例','/icon/',100000,'lnr lnr-linearicons',1,'2017-08-17 04:04:09','2017-08-17 04:04:45'),(27,0,'数据库监控','',26,'fa fa-database',1,'2017-09-26 03:13:24','2017-10-04 08:42:52'),(28,27,'redis监控','/monitorredis/redislist/',27,'',1,'2017-09-26 03:15:27','2017-10-13 02:16:44'),(29,0,'MySQL更新审核','',28,'fa fa-hourglass-end',1,'2017-09-28 09:38:32','2017-09-28 09:38:32'),(30,29,'SQL更新操作','/mysqlsql/mysqllist/',29,'',1,'2017-09-28 09:40:07','2017-10-13 02:24:05'),(31,29,'SQL索引优化','/mysqlindex/sqlauditinglist/',30,'',1,'2017-10-12 09:55:25','2017-10-13 02:24:22'),(32,27,'mysql监控','/monitormysql/mysqlmonitorlist/',31,'',1,'2017-10-13 01:35:59','2017-10-13 02:17:42');
/*!40000 ALTER TABLE `menu_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_rights`
--

DROP TABLE IF EXISTS `menu_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_rights` (
  `rightsid` int(11) NOT NULL AUTO_INCREMENT,
  `menuid` int(5) NOT NULL COMMENT '权限所属的子级菜单ID',
  `parentid` int(5) NOT NULL COMMENT '权限所属的父级菜单ID',
  `rightsname` varchar(20) DEFAULT NULL COMMENT '权限名称',
  `action` text COMMENT '权限动作',
  `status` int(1) DEFAULT '1' COMMENT '权限状态',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`rightsid`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='菜单权限列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_rights`
--

LOCK TABLES `menu_rights` WRITE;
/*!40000 ALTER TABLE `menu_rights` DISABLE KEYS */;
INSERT INTO `menu_rights` VALUES (1,1,0,'仪表盘','/dashboard/',1,'2017-08-07 04:36:12','2017-08-07 04:36:15'),(2,2,0,'管理配置',' ',1,'2017-07-27 05:20:29','2017-08-07 01:57:38'),(3,3,2,'导航栏列表','/menu/menulist/',1,'2017-07-27 05:21:48','2017-08-02 02:13:26'),(5,3,2,'添加导航栏','/menu/menuadd/',1,'2017-08-02 02:14:01','2017-08-09 11:02:38'),(6,3,2,'更新导航栏','/menu/menuupdate',1,'2017-08-02 02:14:42','2017-08-09 11:05:21'),(7,3,2,'导航栏删除','/menu/menudelete',1,'2017-08-02 02:18:18','2017-08-09 11:05:27'),(8,4,2,'用户配置','',1,'2017-08-02 09:49:45','2017-08-04 05:56:59'),(9,4,2,'添加用户','/user/useradd/',1,'2017-08-02 08:08:13','2017-08-09 11:00:47'),(10,4,2,'用户列表','/user/userlist/',1,'2017-08-04 05:47:57','2017-08-04 05:47:57'),(11,4,2,'更新用户','/user/userupdate',1,'2017-08-04 05:48:45','2017-08-09 11:05:34'),(12,4,2,'删除用户','/user/userdelete',1,'2017-08-04 05:49:30','2017-08-04 05:49:30'),(13,22,2,'权限配置','',1,'2017-08-04 05:50:29','2017-08-04 05:50:29'),(14,22,2,'权限列表','/right/rightlist/',1,'2017-08-04 05:51:00','2017-08-04 05:51:00'),(15,22,2,'新增权限','/right/rightadd/',1,'2017-08-04 05:51:29','2017-08-09 11:00:28'),(16,22,2,'修改权限','/right/rightupdate',1,'2017-08-04 05:52:14','2017-08-09 11:05:42'),(17,22,2,'删除权限','/right/rightudelete',1,'2017-08-04 05:52:44','2017-08-09 11:05:53'),(18,3,2,'导航栏配置',' ',1,'2017-08-07 01:56:34','2017-08-07 01:57:39'),(19,22,2,'用户授权','/right/adduserright/',1,'2017-08-07 06:16:51','2017-08-09 11:03:01'),(20,24,23,'服务器列表','/server/serverlist/',1,'2017-08-17 01:44:33','2017-08-17 01:44:33'),(21,23,0,'服务器管理','',1,'2017-08-17 01:44:59','2017-08-17 01:44:59'),(22,25,23,'数据库列表','/dbserver/dbserverlist/',1,'2017-08-17 01:45:26','2017-09-26 03:26:25'),(23,24,23,'服务器用途标签列表','/server/serveruselist/',1,'2017-08-17 09:54:14','2017-08-17 09:55:17'),(24,24,23,'服务器业务标签列表','/server/servergrouplist/',1,'2017-08-17 09:54:57','2017-08-17 09:55:31'),(25,28,27,'Redis监控列表','/monitorredis/redislist/',1,'2017-09-26 03:14:39','2017-10-13 02:18:54'),(26,28,27,'reids图形状态显示','/monitorredis/redisgraphinfo',1,'2017-09-27 08:13:26','2017-10-13 02:19:00'),(27,30,29,'SQL列表','/mysql/mysqllist/',1,'2017-09-28 09:41:23','2017-10-12 04:17:04'),(28,30,29,'sql内容','/mysql/sqlcontentinfo',1,'2017-10-12 04:07:53','2017-10-12 04:07:53'),(29,30,29,'提交sql任务','/mysql/mysqlsqltask/',1,'2017-10-12 04:09:26','2017-10-12 04:09:26'),(30,29,0,'MySQL更新审核','',1,'2017-10-12 04:10:28','2017-10-12 04:10:28'),(31,27,0,'数据库监控','',1,'2017-10-12 04:13:12','2017-10-12 04:13:12'),(32,24,23,'服务器配置','',1,'2017-10-12 04:23:02','2017-10-12 04:23:02'),(33,24,23,'数据库配置','',1,'2017-10-12 04:23:25','2017-10-12 04:23:25'),(34,30,29,'SQL操作','',1,'2017-10-12 04:25:12','2017-10-12 04:25:12'),(35,28,27,'redis监控','',1,'2017-10-12 04:25:27','2017-10-12 04:25:27'),(36,30,29,'已执行sql任务','/mysqlsql/mysqlfinishtask/',1,'2017-10-12 04:27:40','2017-10-13 02:19:46'),(37,30,29,'未执行sql任务','/mysqlsql/tobeexecutemysqltask/',1,'2017-10-12 04:28:13','2017-10-13 02:19:51'),(38,30,29,'sql检查结果','/mysqlsql/sqlcheckresult',1,'2017-10-12 04:30:01','2017-10-13 02:19:54'),(39,30,29,'sql执行结果','/mysqlsql/sqlexecresult',1,'2017-10-12 04:31:10','2017-10-13 02:19:57'),(40,30,29,'sql内容更新','/mysqlsql/sqlcontentupdate',1,'2017-10-12 04:31:44','2017-10-13 02:20:01'),(41,30,29,'sql直接执行','/mysqlsql/sqlexecnoince',1,'2017-10-12 04:32:12','2017-10-13 02:20:06'),(42,30,29,'sql打回删除','/mysqlsql/sqlcontentdelete',1,'2017-10-12 04:32:48','2017-10-13 02:20:10'),(43,30,29,'sql使用inception执行','/mysqlsql/sqlexecbyinception',1,'2017-10-12 04:33:23','2017-10-13 02:20:14'),(44,31,29,'sql索引优化列表','/mysqlindex/sqlauditinglist/',1,'2017-10-23 02:36:48','2017-10-23 02:37:35'),(45,31,29,'sql索引优化','',1,'2017-10-23 02:38:52','2017-10-23 02:39:28'),(46,31,29,'优化索引sql添加','/mysqlindex/sqlauditingadd/',1,'2017-10-23 02:40:41','2017-10-23 02:40:41'),(47,31,29,'sql索引优化详情','/mysqlindex/sqladvisorinfo',1,'2017-10-23 02:41:46','2017-10-23 02:41:46'),(48,32,27,'mysql监控','',1,'2017-10-23 02:42:48','2017-10-23 02:42:48'),(49,32,27,'mysql监控列表','monitormysql/mysqlmonitorlist/',1,'2017-10-23 02:46:57','2017-10-23 02:46:57');
/*!40000 ALTER TABLE `menu_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_stat_postion`
--

DROP TABLE IF EXISTS `product_stat_postion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_stat_postion` (
  `user_postion` int(11) DEFAULT '3' COMMENT '程序所部署位置   1 阿里云 2 ucloud云 3 自建服务器'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stat_postion`
--

LOCK TABLES `product_stat_postion` WRITE;
/*!40000 ALTER TABLE `product_stat_postion` DISABLE KEYS */;
INSERT INTO `product_stat_postion` VALUES (3);
/*!40000 ALTER TABLE `product_stat_postion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redis_status`
--

DROP TABLE IF EXISTS `redis_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redis_status` (
  `db_id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT 'redis状态   0 down 1 up ',
  `redis_role` varchar(255) DEFAULT NULL,
  `redis_version` varchar(255) DEFAULT NULL,
  `aof_enabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'aof是否开启   0未开   1 开启',
  `uptime_in_seconds` varchar(255) DEFAULT NULL,
  `connected_clients` varchar(255) DEFAULT NULL,
  `used_memory` varchar(255) DEFAULT NULL,
  `used_memory_rss` varchar(255) DEFAULT NULL,
  `total_connections_received` varchar(255) DEFAULT NULL,
  `total_commands_processed` varchar(255) DEFAULT NULL,
  `instantaneous_ops_per_sec` varchar(255) DEFAULT NULL,
  `redis_keys` varchar(255) DEFAULT NULL,
  `used_cpu` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`db_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redis_status`
--

LOCK TABLES `redis_status` WRITE;
/*!40000 ALTER TABLE `redis_status` DISABLE KEYS */;
INSERT INTO `redis_status` VALUES (2,1,'master','2.8.4',0,'6381137','2','58440016','12763136','80','78','1','11803','5336.43','2017-09-28 08:50:30','2017-09-28 08:50:30');
/*!40000 ALTER TABLE `redis_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redis_status_history`
--

DROP TABLE IF EXISTS `redis_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redis_status_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `db_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT 'redis状态   0 down 1 up ',
  `redis_role` varchar(255) DEFAULT NULL,
  `redis_version` varchar(255) DEFAULT NULL,
  `aof_enabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'aof是否开启   0未开   1 开启',
  `uptime_in_seconds` varchar(255) DEFAULT NULL,
  `connected_clients` varchar(255) DEFAULT NULL,
  `used_memory` varchar(255) DEFAULT NULL,
  `used_memory_rss` varchar(255) DEFAULT NULL,
  `total_connections_received` varchar(255) DEFAULT NULL,
  `total_commands_processed` varchar(255) DEFAULT NULL,
  `instantaneous_ops_per_sec` varchar(255) DEFAULT NULL,
  `redis_keys` varchar(255) DEFAULT NULL,
  `used_cpu` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_dbid` (`db_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redis_status_history`
--

LOCK TABLES `redis_status_history` WRITE;
/*!40000 ALTER TABLE `redis_status_history` DISABLE KEYS */;
INSERT INTO `redis_status_history` VALUES (1,2,1,'master','2.8.4',0,'6287939','1','58420000','11395072','39','36','0',NULL,'5256.82','2017-09-27 06:57:12','2017-09-27 06:57:12'),(2,2,1,'master','2.8.4',0,'6287955','1','58420000','11395072','41','38','0',NULL,'5256.83','2017-09-27 06:57:28','2017-09-27 06:57:28'),(3,2,1,'master','2.8.4',0,'6288008','1','58420000','11395072','43','40','0',NULL,'5256.88','2017-09-27 06:58:22','2017-09-27 06:58:22'),(4,2,1,'master','2.8.4',0,'6288010','1','58420000','11395072','45','42','0',NULL,'5256.89','2017-09-27 06:58:24','2017-09-27 06:58:24'),(5,2,1,'master','2.8.4',0,'6288011','1','58420000','11395072','47','44','1',NULL,'5256.89','2017-09-27 06:58:25','2017-09-27 06:58:25'),(6,2,1,'master','2.8.4',0,'6288013','1','58420000','11395072','49','46','1',NULL,'5256.89','2017-09-27 06:58:26','2017-09-27 06:58:26'),(7,2,1,'master','2.8.4',0,'6288014','1','58420000','11395072','51','48','1',NULL,'5256.9','2017-09-27 06:58:27','2017-09-27 06:58:27'),(8,2,1,'master','2.8.4',0,'6294601','1','58420000','11395072','57','54','0','11803','5262.53','2017-09-27 08:48:14','2017-09-27 08:48:14'),(9,2,1,'master','2.8.4',0,'6294603','1','58420000','11395072','59','56','1','11803','5262.54','2017-09-27 08:48:16','2017-09-27 08:48:16'),(10,2,1,'master','2.8.4',0,'6294604','1','58420000','11395072','61','58','1','11803','5262.54','2017-09-27 08:48:17','2017-09-27 08:48:17'),(11,2,1,'master','2.8.4',0,'6294605','1','58420000','11395072','63','60','1','11803','5262.54','2017-09-27 08:48:18','2017-09-27 08:48:18'),(12,2,1,'master','2.8.4',0,'6381098','2','58440016','12763136','66','64','0','11803','5336.39','2017-09-28 08:49:50','2017-09-28 08:49:50'),(13,2,1,'master','2.8.4',0,'6381102','2','58440016','12763136','68','66','0','11803','5336.39','2017-09-28 08:49:54','2017-09-28 08:49:54'),(14,2,1,'master','2.8.4',0,'6381104','2','58440016','12763136','70','68','0','11803','5336.4','2017-09-28 08:49:57','2017-09-28 08:49:57'),(15,2,1,'master','2.8.4',0,'6381105','2','58440016','12763136','72','70','1','11803','5336.4','2017-09-28 08:49:58','2017-09-28 08:49:58'),(16,2,1,'master','2.8.4',0,'6381132','2','58440016','12763136','74','72','0','11803','5336.42','2017-09-28 08:50:25','2017-09-28 08:50:25'),(17,2,1,'master','2.8.4',0,'6381134','2','58440016','12763136','76','74','0','11803','5336.43','2017-09-28 08:50:27','2017-09-28 08:50:27'),(18,2,1,'master','2.8.4',0,'6381136','2','58440016','12763136','78','76','0','11803','5336.43','2017-09-28 08:50:29','2017-09-28 08:50:29'),(19,2,1,'master','2.8.4',0,'6381137','2','58440016','12763136','80','78','1','11803','5336.43','2017-09-28 08:50:30','2017-09-28 08:50:30');
/*!40000 ALTER TABLE `redis_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_group_info`
--

DROP TABLE IF EXISTS `server_group_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_group_info` (
  `server_group_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '服务器项目分类ID',
  `server_group_name` varchar(50) NOT NULL COMMENT '服务器项目分类名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`server_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='服务器业务标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_group_info`
--

LOCK TABLES `server_group_info` WRITE;
/*!40000 ALTER TABLE `server_group_info` DISABLE KEYS */;
INSERT INTO `server_group_info` VALUES (5,'p2p','2017-08-18 02:21:17','2017-08-18 02:21:17'),(6,'车凡','2017-08-18 02:21:31','2017-08-18 02:21:31'),(7,'牛角','2017-08-18 02:21:37','2017-08-18 02:21:37'),(8,'带你装','2017-08-18 02:21:52','2017-08-18 02:21:52');
/*!40000 ALTER TABLE `server_group_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_info`
--

DROP TABLE IF EXISTS `server_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_info` (
  `server_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `server_name` varchar(50) NOT NULL DEFAULT '' COMMENT '服务名称',
  `server_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '服务器类型1云机 2物理机器 3 自建虚拟机',
  `server_source_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 阿里云 2 ucloud云 3 自建服务器',
  `func_name` varchar(50) DEFAULT '' COMMENT 'func 名字',
  `server_group_id` tinyint(4) DEFAULT '0' COMMENT '所属业务分组id',
  `server_use_id` tinyint(4) DEFAULT '0' COMMENT '服务器类型分组id',
  `outer_net` varchar(16) DEFAULT '' COMMENT '外网ip',
  `inner_net` varchar(16) DEFAULT '' COMMENT '内网ip',
  `use_outer_inner` int(11) DEFAULT '2' COMMENT '1 使用内网ip 2 使用外网ip 3 均可使用',
  `server_login_user` varchar(50) NOT NULL DEFAULT '' COMMENT '登录账户',
  `server_login_pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '登录密码',
  `ssh_port` int(11) NOT NULL DEFAULT '0' COMMENT 'ssh端口',
  `content` varchar(1000) DEFAULT '' COMMENT '机器服务器描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`server_id`),
  UNIQUE KEY `server_name` (`server_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='服务器信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_info`
--

LOCK TABLES `server_info` WRITE;
/*!40000 ALTER TABLE `server_info` DISABLE KEYS */;
INSERT INTO `server_info` VALUES (1,'p2p-test1',3,3,'',5,3,'','192.168.0.244',1,'vagrant','vagrant',22,'','2017-08-18 03:18:10','2017-09-25 08:01:10'),(3,'p2p-test-db1',3,3,'',5,3,'','192.168.0.249',1,'vagrant','vagrant',22,'','2017-09-25 08:51:04','2017-09-25 09:05:18');
/*!40000 ALTER TABLE `server_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_info_ext`
--

DROP TABLE IF EXISTS `server_info_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_info_ext` (
  `server_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` varchar(100) NOT NULL DEFAULT '' COMMENT '服务属性原型d',
  `service_value` varchar(100) NOT NULL DEFAULT '0' COMMENT '服务器属性值',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`server_id`,`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='服务器属性信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_info_ext`
--

LOCK TABLES `server_info_ext` WRITE;
/*!40000 ALTER TABLE `server_info_ext` DISABLE KEYS */;
INSERT INTO `server_info_ext` VALUES (1,'1','2\n','2017-09-20 07:23:55','2017-09-20 07:23:55'),(1,'2','4048308kB\n','2017-09-20 07:23:55','2017-09-20 07:23:55'),(1,'3','p2p01.0.244.tst.lan.itiancai.com\n','2017-09-20 07:23:55','2017-09-20 07:23:55'),(3,'1','2\n','2017-09-25 08:51:08','2017-09-25 08:51:08'),(3,'2','4048308kB\n','2017-09-25 08:51:09','2017-09-25 08:51:09'),(3,'3','sql01.0.249.tst.lan.itiancai.com\n','2017-09-25 08:51:09','2017-09-25 08:51:09');
/*!40000 ALTER TABLE `server_info_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_service_prototype`
--

DROP TABLE IF EXISTS `server_service_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_service_prototype` (
  `service_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'task_id',
  `service_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '监控类型 1 mysql 2 redis  3 os 4 java server 5 基础os',
  `service_target_name` varchar(50) NOT NULL DEFAULT '' COMMENT '监控目标名字,规则:服务器_类型_值类型(num/string)_监控targetname',
  `service_target_value` varchar(50) NOT NULL DEFAULT '' COMMENT '监控目标值',
  `service_shell` varchar(1000) NOT NULL DEFAULT '' COMMENT '监控shell',
  `is_service` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 监控 0 不监控',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `uniq_server_monitor_name` (`service_type`,`service_target_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='监控原型列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_service_prototype`
--

LOCK TABLES `server_service_prototype` WRITE;
/*!40000 ALTER TABLE `server_service_prototype` DISABLE KEYS */;
INSERT INTO `server_service_prototype` VALUES (1,5,'cpu_num','','cat /proc/cpuinfo |grep \'cores\'|awk -F \':\' \'{print $2}\'|uniq|sed s/[[:space:]]//g',1,'2017-08-21 10:03:20','2017-08-22 08:23:40'),(2,5,'memory_num','','cat /proc/meminfo |grep \'MemTotal\'|awk -F \':\' \'{print $2}\'|uniq|sed s/[[:space:]]//g',1,'2017-08-21 10:03:43','2017-08-22 08:32:39'),(3,5,'hostname','','hostname',1,'2017-08-22 10:07:58','2017-08-22 10:08:02');
/*!40000 ALTER TABLE `server_service_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_use_info`
--

DROP TABLE IF EXISTS `server_use_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_use_info` (
  `server_use_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `server_use_name` varchar(50) NOT NULL COMMENT '服务器用途标签名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`server_use_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='服务器用途标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_use_info`
--

LOCK TABLES `server_use_info` WRITE;
/*!40000 ALTER TABLE `server_use_info` DISABLE KEYS */;
INSERT INTO `server_use_info` VALUES (2,'uat-验收','2017-08-18 10:17:11','2017-08-18 10:17:11'),(3,'test-功能测试','2017-08-18 10:20:19','2017-08-18 10:20:19'),(4,'online-线上生产','2017-08-18 10:20:33','2017-08-18 10:20:33'),(5,'stree-压测','2017-08-18 10:20:54','2017-08-18 10:20:54');
/*!40000 ALTER TABLE `server_use_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_advice_info`
--

DROP TABLE IF EXISTS `sql_advice_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_advice_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_id` int(11) DEFAULT NULL,
  `sql_content` text,
  `result_content` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_advice_info`
--

LOCK TABLES `sql_advice_info` WRITE;
/*!40000 ALTER TABLE `sql_advice_info` DISABLE KEYS */;
INSERT INTO `sql_advice_info` VALUES (1,1,'asfadsfasdf','sh: sqladvisor: command not found','2017-10-23 01:16:36','2017-10-23 01:16:36');
/*!40000 ALTER TABLE `sql_advice_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_check_task_info`
--

DROP TABLE IF EXISTS `sql_check_task_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_check_task_info` (
  `task_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'task_id',
  `check_id` varchar(50) NOT NULL DEFAULT '0' COMMENT '检查id',
  `check_stage` varchar(50) NOT NULL DEFAULT '' COMMENT '这个列显示当前语句已经进行到哪一步了',
  `err_level` varchar(50) NOT NULL DEFAULT '0' COMMENT '0 正常,1表示警告，不影响执行，2表示严重错误，必须修改',
  `stage_status` varchar(50) NOT NULL DEFAULT '' COMMENT '审核成功，则返回 Audit completed,审核失败 返回Execute failed',
  `error_messge` varchar(5000) NOT NULL DEFAULT '' COMMENT '错误内容',
  `check_sql` varchar(1000) NOT NULL DEFAULT '' COMMENT '检查的sql',
  `affected_row` varchar(50) NOT NULL DEFAULT '0' COMMENT '影响的行数',
  `backup_dbname` varchar(50) NOT NULL DEFAULT '' COMMENT '执行结果卸乳数据库',
  `execute_times` varchar(50) NOT NULL DEFAULT '0' COMMENT '执行时间',
  `submit_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `execute_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '执行时间',
  PRIMARY KEY (`task_id`,`check_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='sqlupdate任务check信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_check_task_info`
--

LOCK TABLES `sql_check_task_info` WRITE;
/*!40000 ALTER TABLE `sql_check_task_info` DISABLE KEYS */;
INSERT INTO `sql_check_task_info` VALUES (1,'1','CHECKED','0','Audit completed','None','use zhangsp','0','','0','2016-06-23 06:20:30','2016-06-23 06:20:30'),(1,'2','CHECKED','1','Audit completed','set the where condition for select statement.\nSelect only star is not allowed.','select * from test_binlog','0','','0','2016-06-23 06:20:30','2016-06-23 06:20:30'),(32,'1','CHECKED','1','Audit completed','Identifier \'user\' is keyword in MySQL.\nset the where condition for select statement.\nSelect only star is not allowed.','select * from mysql.user','0','','0','2016-06-23 07:01:53','2016-06-23 07:01:53'),(74,'1','CHECKED','2','Audit completed','No database selected.','select * from mysql;\r\nuse test_db;\r\ncreate table a (id int, content varchar(500));\n','0','','0','2016-06-23 10:14:54','2016-06-23 10:14:54'),(86,'1','CHECKED','0','Audit completed','None','use mysql','0','','0','2016-06-23 11:27:02','2016-06-23 11:27:02'),(86,'2','CHECKED','1','Audit completed','Identifier \'user\' is keyword in MySQL.\nset the where condition for select statement.\nSelect only star is not allowed.','select * from mysql.user','0','','0','2016-06-23 11:27:02','2016-06-23 11:27:02'),(91,'1','CHECKED','0','Audit completed','None','use test_db','0','','0','2016-06-23 11:35:44','2016-06-23 11:35:44'),(91,'2','CHECKED','1','Audit completed','Set engine to innodb for table \'test_a\'.\nSet charset to one of \'utf8,utf8mb4\' for table \'test_a\'.\nSet comments for table \'test_a\'.\nColumn \'id\' in table \'test_a\' have no comments.\nColumn \'id\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'id\' in table \'test_a\'\nColumn \'content\' in table \'test_a\' have no comments.\nColumn \'content\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'content\' in table \'test_a\'\nSet a primary key for table \'test_a\'.','create table test_a( id int,content varchar(100))','0','','0','2016-06-23 11:35:44','2016-06-23 11:35:44'),(92,'1','CHECKED','0','Audit completed','None','use test_db','0','','0','2016-06-23 11:37:43','2016-06-23 11:37:43'),(92,'2','CHECKED','1','Audit completed','Set engine to innodb for table \'test_a\'.\nSet charset to one of \'utf8,utf8mb4\' for table \'test_a\'.\nSet comments for table \'test_a\'.\nColumn \'id\' in table \'test_a\' have no comments.\nColumn \'id\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'id\' in table \'test_a\'\nColumn \'content\' in table \'test_a\' have no comments.\nColumn \'content\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'content\' in table \'test_a\'\nSet a primary key for table \'test_a\'.','create table test_a( id int,content varchar(100))','0','','0','2016-06-23 11:37:43','2016-06-23 11:37:43'),(93,'1','CHECKED','0','Audit completed','None','use test_db','0','','0','2016-06-23 11:39:12','2016-06-23 11:39:12'),(93,'2','CHECKED','1','Audit completed','Set engine to innodb for table \'test_a\'.\nSet charset to one of \'utf8,utf8mb4\' for table \'test_a\'.\nSet comments for table \'test_a\'.\nColumn \'id\' in table \'test_a\' have no comments.\nColumn \'id\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'id\' in table \'test_a\'\nColumn \'content\' in table \'test_a\' have no comments.\nColumn \'content\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'content\' in table \'test_a\'\nSet a primary key for table \'test_a\'.','create table test_a( id int,content varchar(100))','0','','0','2016-06-23 11:39:12','2016-06-23 11:39:12'),(94,'1','CHECKED','0','Audit completed','None','use test_db','0','','0','2016-06-23 11:41:00','2016-06-23 11:41:00'),(94,'2','CHECKED','1','Audit completed','Set engine to innodb for table \'test_a\'.\nSet charset to one of \'utf8,utf8mb4\' for table \'test_a\'.\nSet comments for table \'test_a\'.\nColumn \'id\' in table \'test_a\' have no comments.\nColumn \'id\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'id\' in table \'test_a\'\nColumn \'content\' in table \'test_a\' have no comments.\nColumn \'content\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'content\' in table \'test_a\'\nSet a primary key for table \'test_a\'.','create table test_a( id int,content varchar(100))','0','','0','2016-06-23 11:41:00','2016-06-23 11:41:00'),(94,'3','CHECKED','2','Audit completed','You have an error in your SQL syntax,  near \'1,\'说的法定身份的撒发多少\');\n\' at line 2','#阿双方打法定身份\r\ninsert into test_a(1,\'说的法定身份的撒发多少\');\n','0','','0','2016-06-23 11:41:00','2016-06-23 11:41:00'),(95,'1','CHECKED','0','Audit completed','None','use test_db','0','','0','2016-06-23 11:52:01','2016-06-23 11:52:01'),(95,'2','CHECKED','1','Audit completed','Set engine to innodb for table \'test_a\'.\nSet charset to one of \'utf8,utf8mb4\' for table \'test_a\'.\nSet comments for table \'test_a\'.\nColumn \'id\' in table \'test_a\' have no comments.\nColumn \'id\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'id\' in table \'test_a\'\nColumn \'content\' in table \'test_a\' have no comments.\nColumn \'content\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'content\' in table \'test_a\'\nSet a primary key for table \'test_a\'.','create table test_a( id int,content varchar(100))','0','','0','2016-06-23 11:52:01','2016-06-23 11:52:01'),(96,'1','CHECKED','0','Audit completed','None','use test_db','0','','0','2016-06-23 11:54:22','2016-06-23 11:54:22'),(96,'2','CHECKED','1','Audit completed','Set engine to innodb for table \'test_a\'.\nSet charset to one of \'utf8,utf8mb4\' for table \'test_a\'.\nSet comments for table \'test_a\'.\nColumn \'id\' in table \'test_a\' have no comments.\nColumn \'id\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'id\' in table \'test_a\'\nColumn \'content\' in table \'test_a\' have no comments.\nColumn \'content\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'content\' in table \'test_a\'\nSet a primary key for table \'test_a\'.','create table test_a( id int,content varchar(100))','0','','0','2016-06-23 11:54:22','2016-06-23 11:54:22'),(96,'3','CHECKED','2','Audit completed','You have an error in your SQL syntax,  near \'1,\"说的法定身份的撒发多少\");\n\' at line 2','#阿双方打法定身份\r\ninsert into test_a(1,\"说的法定身份的撒发多少\");\n','0','','0','2016-06-23 11:54:22','2016-06-23 11:54:22'),(97,'1','CHECKED','0','Audit completed','None','use test_db','0','','0','2016-06-23 11:54:42','2016-06-23 11:54:42'),(97,'2','CHECKED','1','Audit completed','Set engine to innodb for table \'test_a\'.\nSet charset to one of \'utf8,utf8mb4\' for table \'test_a\'.\nSet comments for table \'test_a\'.\nColumn \'id\' in table \'test_a\' have no comments.\nColumn \'id\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'id\' in table \'test_a\'\nColumn \'content\' in table \'test_a\' have no comments.\nColumn \'content\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'content\' in table \'test_a\'\nSet a primary key for table \'test_a\'.','create table test_a( id int,content varchar(100))','0','','0','2016-06-23 11:54:42','2016-06-23 11:54:42'),(97,'3','CHECKED','2','Audit completed','You have an error in your SQL syntax,  near \'1,\'说的法定身份的撒发多少\');\n\' at line 2','#阿双方打法定身份\r\ninsert into test_a(1,\'说的法定身份的撒发多少\');\n','0','','0','2016-06-23 11:54:42','2016-06-23 11:54:42'),(98,'1','CHECKED','2','Audit completed','No database selected.','#dsfadsfadsfadsf的身份是短发\r\nselect * from mysqluser;\r\n#dsfasdf dsfadsfadsdasf啊是发的首发多少\n','0','','0','2016-06-24 08:58:10','2016-06-24 08:58:10'),(99,'1','CHECKED','1','Audit completed','Identifier \'user\' is keyword in MySQL.\nset the where condition for select statement.\nSelect only star is not allowed.','select * from mysql.user','0','','0','2016-06-24 09:29:50','2016-06-24 09:29:50'),(100,'1','CHECKED','2','Audit completed','Add \';\' after the last sql statement.','select * from tb_users\n','0','','0','2016-06-27 03:40:33','2016-06-27 03:40:33'),(116,'1','CHECKED','0','Audit completed','None','use Biz','0','','0','2016-07-01 09:49:24','2016-07-01 09:49:24'),(116,'2','CHECKED','1','Audit completed','set the where condition for select statement.\nSelect only star is not allowed.','select * from tb_user','0','','0','2016-07-01 09:49:24','2016-07-01 09:49:24'),(117,'1','CHECKED','0','Audit completed','None','#但双方哈多少分\r\nuse test','0','','0','2016-07-06 09:00:15','2016-07-06 09:00:15'),(117,'2','CHECKED','2','Audit completed','Add \';\' after the last sql statement.','update tb_testtable set content=\'dfd的大声疾呼咖啡店\'  where id=1\n','0','','0','2016-07-06 09:00:15','2016-07-06 09:00:15'),(118,'1','CHECKED','0','Audit completed','None','#但双方哈多少分\r\nuse test','0','','0','2016-07-06 09:04:22','2016-07-06 09:04:22'),(118,'2','CHECKED','2','Audit completed','Add \';\' after the last sql statement.','update tb_testtable set content=\'dfd的大声疾呼咖啡店\'  where id=1\n','0','','0','2016-07-06 09:04:22','2016-07-06 09:04:22'),(119,'1','CHECKED','0','Audit completed','None','use Biz','0','','0','2016-08-05 03:18:42','2016-08-05 03:18:42'),(119,'2','CHECKED','0','Audit completed','None','update TB_UMP_AGREEMENT set debit=1 where userid=\'BD93D8F8-2903-4D48-A838-6DA0DBD982FD\'','0','','0','2016-08-05 03:18:42','2016-08-05 03:18:42'),(120,'1','CHECKED','1','Audit completed','Column \'a\' in table \'test\' have no comments.\nSet Default value for column \'a\' in table \'test\'','alter table test.test modify `a` bigint(11) NOT NULL','0','','0','2016-08-10 07:35:48','2016-08-10 07:35:48'),(121,'1','CHECKED','1','Audit completed','Column \'a\' in table \'test\' have no comments.','alter table test.test modify `a` bigint(11) NOT NULL default \'1\'','0','','0','2016-08-11 02:37:28','2016-08-11 02:37:28'),(122,'1','CHECKED','0','Audit completed','None','use test','0','','0','2016-08-11 02:38:29','2016-08-11 02:38:29'),(122,'2','CHECKED','1','Audit completed','Column \'a\' in table \'test\' have no comments.\nSet Default value for column \'a\' in table \'test\'','alter table test modify a bigint(11) NOT NULL','0','','0','2016-08-11 02:38:29','2016-08-11 02:38:29'),(123,'1','CHECKED','0','Audit completed','None','use testdb','0','','0','2016-08-11 02:41:41','2016-08-11 02:41:41'),(123,'2','CHECKED','1','Audit completed','Column \'http_method\' in table \'test_data\' have no comments.','alter table test_data modify `http_method` varchar(5000) NOT NULL default \'\'','4','','0','2016-08-11 02:41:41','2016-08-11 02:41:41'),(124,'1','CHECKED','0','Audit completed','None','use testdb','0','','0','2016-08-11 02:43:34','2016-08-11 02:43:34'),(124,'2','CHECKED','0','Audit completed','None','alter table test_data modify `http_method` varchar(5000) NOT NULL default \'\' COMMENT \'ds阿斯顿发生大事\'','4','','0','2016-08-11 02:43:34','2016-08-11 02:43:34'),(125,'1','CHECKED','0','Audit completed','None','use passport','0','','0','2016-08-11 02:56:35','2016-08-11 02:56:35'),(125,'2','CHECKED','0','Audit completed','None','alter table user_login_record modify `credential` varchar(127) NOT NULL default \'\'  COMMENT \'登陆凭证\'','17341','','0','2016-08-11 02:56:35','2016-08-11 02:56:35'),(126,'1','CHECKED','0','Audit completed','None','use Biz','0','','0','2016-08-11 02:58:04','2016-08-11 02:58:04'),(126,'2','CHECKED','2','Audit completed','Column \'opid_time\' not existed.','alter table cps_user modify `opid_time` varchar(51)  NOT NULL default \'\'  COMMENT \'随便测试\'','80','','0','2016-08-11 02:58:04','2016-08-11 02:58:04'),(127,'1','CHECKED','0','Audit completed','None','use Biz','0','','0','2016-08-11 02:59:14','2016-08-11 02:59:14'),(127,'2','CHECKED','0','Audit completed','None','alter table cps_user modify `cps_key` varchar(41) NOT NULL DEFAULT \'\' COMMENT \'cps用户ID\'','80','','0','2016-08-11 02:59:14','2016-08-11 02:59:14'),(128,'1','CHECKED','2','Audit completed','You have an error in your SQL syntax,  near \'123\n\' at line 1','123\n','0','','0','2016-08-11 11:09:44','2016-08-11 11:09:44'),(129,'1','CHECKED','2','Audit completed','You have an error in your SQL syntax,  near \'selet * from mysql.user;\n\' at line 1','selet * from mysql.user;\n','0','','0','2016-11-29 07:28:29','2016-11-29 07:28:29'),(130,'1','CHECKED','2','Audit completed','Selected Database \'test_db\' not existed.','use test_db','0','','0','2016-11-29 07:29:45','2016-11-29 07:29:45'),(130,'2','CHECKED','2','Audit completed','No database selected.','insert into test_a(id,content) values (100,\'dfdsfdsf啊多少发多少分\');\n','0','','0','2016-11-29 07:29:45','2016-11-29 07:29:45'),(131,'1','CHECKED','0','Audit completed','None','#但双方哈多少分\r\nuse test','0','','0','2016-11-29 07:44:34','2016-11-29 07:44:34'),(131,'2','CHECKED','2','Audit completed','Table \'test.tb_testtable\' doesn\'t exist','update tb_testtable set content=\'dfd的大声疾呼咖啡店\' where id=1','0','','0','2016-11-29 07:44:34','2016-11-29 07:44:34'),(132,'1','CHECKED','0','Audit completed','None','use test','0','','0','2016-11-29 10:54:36','2016-11-29 10:54:36'),(132,'2','CHECKED','0','Audit completed','None','insert into test (aid) values (\'dsfd多少发多少发多少\')','1','','0','2016-11-29 10:54:36','2016-11-29 10:54:36'),(133,'1','CHECKED','0','Audit completed','None','#但双方哈多少分\r\nuse test','0','','0','2016-11-29 10:55:33','2016-11-29 10:55:33'),(133,'2','CHECKED','2','Audit completed','Table \'test.tb_testtable\' doesn\'t exist','update tb_testtable set content=\'dfd的大声疾呼咖啡店\' where id=1','0','','0','2016-11-29 10:55:33','2016-11-29 10:55:33');
/*!40000 ALTER TABLE `sql_check_task_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_update_task_info`
--

DROP TABLE IF EXISTS `sql_update_task_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_update_task_info` (
  `task_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'task_id',
  `user_id` varchar(50) NOT NULL DEFAULT '' COMMENT '用户id',
  `task_style` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 mysql更新 1 redis更新',
  `db_id` char(15) NOT NULL DEFAULT '' COMMENT 'db目标id',
  `update_type` char(15) NOT NULL DEFAULT '' COMMENT '更新类型 1 sql 2 文件',
  `is_inception_use` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 sql 直接更新 2 inception更新',
  `sql_data` varchar(5000) NOT NULL DEFAULT '' COMMENT 'sql内容',
  `sql_url` varchar(500) NOT NULL DEFAULT '' COMMENT 'sql文件存储地址',
  `task_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 待执行 1 执行',
  `execute_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `submit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'sql文件提交时间',
  `execute_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '执行时间',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='sqlupdate任务表信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_update_task_info`
--

LOCK TABLES `sql_update_task_info` WRITE;
/*!40000 ALTER TABLE `sql_update_task_info` DISABLE KEYS */;
INSERT INTO `sql_update_task_info` VALUES (6,'1',0,'1','1',1,'select host,user from mysql.user;','',1,1,'2016-06-21 06:24:47','2016-06-22 04:54:36'),(7,'1',0,'1','1',1,'use test_db;\r\ninsert into test_table_info values (1,\'fsddsafadsfads额外获得首发多少分\');\r\n#双方还就啊都是废话\r\nupdate test_table_info set content=\'都是发的首发多少\' where id=1;','',1,1,'2016-06-21 06:29:49','2016-06-22 04:50:17'),(8,'1',0,'1','1',1,'use test_db;\r\ninsert into test_table_info values (1,\'fsddsafadsfads额外获得首发多少分\');\r\n#双方还就啊\r\nupdate test_table_info set content=\'都是发的首发多少\' where id=1;','',1,1,'2016-06-21 06:31:23','2016-06-22 09:45:00'),(11,'1',0,'1','1',1,'select * from mysql.user;','',1,1,'2016-06-22 06:03:23','2016-06-22 13:20:12'),(92,'1',0,'1','1',1,'use test_db;\r\ncreate table test_a( id int,content varchar(100));\r\n#阿双方打法定身份\r\ninsert into test_a(1,\'说的法定身份的撒发多少\');','',1,1,'2016-06-23 11:37:43','2016-06-23 11:56:43'),(93,'1',0,'1','1',1,'use test_db;\r\ncreate table test_a( id int,content varchar(100));\r\n#阿双方打法定身份\r\ninsert into test_a(1,\'说的法定身份的撒发多少\');','',1,1,'2016-06-23 11:39:12','2016-06-24 08:46:27'),(94,'1',0,'1','1',1,'use test_db;\r\ncreate table test_a( id int,content varchar(100));\r\n#阿双方打法定身份\r\ninsert into test_a(1,\'说的法定身份的撒发多少\');','',1,1,'2016-06-23 11:41:00','2016-06-24 08:45:33'),(95,'1',0,'1','1',1,'use test_db;\r\ncreate table test_a( id int,content varchar(100));\r\n#阿双方打法定身份\r\ninsert into test_a(1,\"说的法定身份的撒发多少\");','',1,1,'2016-06-23 11:52:01','2016-06-24 05:26:29'),(96,'1',0,'1','1',1,'use test_db;\r\ncreate table test_a( id int,content varchar(100));\r\n#阿双方打法定身份\r\ninsert into test_a values (1,\"说的法定身份的撒发多少\");','',1,1,'2016-06-23 11:54:22','2016-06-24 00:41:13'),(97,'1',0,'1','1',1,'use test_db;\r\ncreate table test_a( id int,content varchar(100));\r\n#阿双方打法定身份\r\ninsert into test_a values (1,\'说的法定身份的撒发多少\');','',1,1,'2016-06-23 11:54:42','2016-06-24 00:18:16'),(99,'1',0,'1','1',1,'select * from mysql.user;\r\n#你好','',1,1,'2016-06-24 09:29:50','2016-06-24 09:31:03'),(100,'1',0,'2','1',1,'select * from tb_users','',1,1,'2016-06-27 03:40:33','2016-06-27 03:56:41'),(101,'1',0,'1','1',1,'','',1,1,'2016-06-27 05:45:35','2016-06-27 05:45:55'),(103,'1',0,'2','1',2,'select * from mysql.user;','',1,1,'2016-06-27 05:54:28','2016-07-12 03:12:06'),(116,'1',0,'5','1',1,'use Biz;\r\nselect * from tb_user;','',1,1,'2016-07-01 09:49:24','2016-07-01 09:49:47'),(117,'2',0,'1','1',1,'#但双方哈多少分\r\nuse test;\r\nupdate tb_testtable set content=\'dfd的大声疾呼咖啡店\'  where id=1;','',1,1,'2016-07-06 09:00:15','2016-07-06 09:14:51'),(118,'2',0,'2','1',2,'#但双方哈多少分\r\nuse test;\r\nupdate tb_testtable set content=\'dfd的大声疾呼咖啡店\'  where id=1;','',1,1,'2016-07-06 09:04:22','2016-07-06 09:07:44'),(120,'1',0,'3','1',2,'alter table test.test modify `a` bigint(11) NOT NULL;','',1,1,'2016-08-10 07:35:48','2016-08-10 07:36:08'),(121,'1',0,'3','1',2,'alter table test.test modify `a` bigint(11) NOT NULL default \'1\';','',1,1,'2016-08-11 02:37:28','2016-08-11 02:37:40'),(122,'1',0,'3','1',2,'use test;\r\nalter table test modify a bigint(11) NOT NULL;','',1,1,'2016-08-11 02:38:29','2016-08-11 02:38:34'),(123,'1',0,'3','1',2,'use testdb;\r\nalter table test_data modify `http_method` varchar(5000) NOT NULL default \'\';','',1,1,'2016-08-11 02:41:41','2016-08-11 02:41:45'),(124,'1',0,'3','1',2,'use testdb;\r\nalter table test_data modify `http_method` varchar(5000) NOT NULL default \'\' COMMENT \'ds阿斯顿发生大事\';','',1,1,'2016-08-11 02:43:34','2016-08-11 02:43:50'),(125,'1',0,'3','1',2,'use passport;\r\nalter table user_login_record modify `credential` varchar(127) NOT NULL default \'\'  COMMENT \'登陆凭证\';','',1,1,'2016-08-11 02:56:35','2016-08-11 02:56:42'),(126,'1',0,'3','1',2,'use Biz;\r\nalter table cps_user modify `opid_time` varchar(51)  NOT NULL default \'\'  COMMENT \'随便测试\';','',1,1,'2016-08-11 02:58:04','2016-08-11 02:58:07'),(127,'1',0,'3','1',2,'use Biz;\r\nalter table cps_user modify `cps_key` varchar(41) NOT NULL DEFAULT \'\' COMMENT \'cps用户ID\';','',1,1,'2016-08-11 02:59:14','2016-08-11 02:59:17'),(130,'1',0,'3','1',2,'use test_db;\r\ninsert into test_a(id,content) values (100,\'dfdsfdsf啊多少发多少分\');','',1,1,'2016-11-29 07:29:45','2016-11-29 07:29:52'),(131,'2',0,'3','1',2,'#但双方哈多少分\r\nuse test;\r\nupdate tb_testtable set content=\'dfd的大声疾呼咖啡店\' where id=1;','',1,1,'2016-11-29 07:44:34','2016-11-29 07:46:28'),(132,'2',0,'3','1',2,'use test;\r\ninsert into test (aid) values (\'dsfd多少发多少发多少\');','',1,1,'2016-11-29 10:54:36','2016-11-29 11:10:25'),(133,'2',0,'1','1',1,'#但双方哈多少分\r\nuse test;\r\nupdate tb_testtable set content=\'dfd的大声疾呼咖啡店\' where id=1;','',1,1,'2016-11-29 10:55:33','2017-10-13 02:53:50'),(134,'1',0,'1','1',0,'select * from Biz.TB_INVEST where userid=\'F9980F83-BE1D-41FF-959A-CC134F92E44D\'','',0,0,'2017-10-18 09:29:27','2017-10-18 09:29:27');
/*!40000 ALTER TABLE `sql_update_task_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_update_task_result`
--

DROP TABLE IF EXISTS `sql_update_task_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_update_task_result` (
  `task_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'task_id',
  `execute_id` varchar(50) NOT NULL DEFAULT '0' COMMENT '结果id',
  `execute_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '执行类型 1 sql直接提交  2 inception执行',
  `check_stage` varchar(50) NOT NULL DEFAULT '' COMMENT '这个列显示当前语句已经进行到哪一步了',
  `err_level` varchar(50) NOT NULL DEFAULT '0' COMMENT '0 正常,1表示警告，不影响执行，2表示严重错误，必须修改',
  `stage_status` varchar(50) NOT NULL DEFAULT '' COMMENT '审核成功，则返回 Audit completed,审核失败 返回Execute failed',
  `error_messge` varchar(5000) NOT NULL DEFAULT '' COMMENT '错误内容',
  `check_sql` varchar(1000) NOT NULL DEFAULT '' COMMENT '检查的sql',
  `affected_row` varchar(50) NOT NULL DEFAULT '0' COMMENT '影响的行数',
  `backup_dbname` varchar(50) NOT NULL DEFAULT '' COMMENT '执行结果卸乳数据库',
  `sql_execute_info` varchar(500) NOT NULL DEFAULT '' COMMENT 'sql直接执行的结果',
  `execute_times` varchar(50) NOT NULL DEFAULT '0' COMMENT '执行时间',
  `submit_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `execute_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '执行时间',
  PRIMARY KEY (`task_id`,`execute_id`,`execute_type`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='sqlupdate任务execute结果信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_update_task_result`
--

LOCK TABLES `sql_update_task_result` WRITE;
/*!40000 ALTER TABLE `sql_update_task_result` DISABLE KEYS */;
INSERT INTO `sql_update_task_result` VALUES (93,'1',2,'CHECKED','0','Audit completed','None','use test_db','0','','','0','2016-06-24 08:46:27','2016-06-24 08:46:27'),(93,'2',2,'CHECKED','2','Audit completed','Table \'test_a\' already exists.\nSet engine to innodb for table \'test_a\'.\nSet charset to one of \'utf8,utf8mb4\' for table \'test_a\'.\nSet comments for table \'test_a\'.\nColumn \'id\' in table \'test_a\' have no comments.\nColumn \'id\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'id\' in table \'test_a\'\nColumn \'content\' in table \'test_a\' have no comments.\nColumn \'content\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'content\' in table \'test_a\'\nSet a primary key for table \'test_a\'.','create table test_a( id int,content varchar(100))','0','','','0','2016-06-24 08:46:27','2016-06-24 08:46:27'),(93,'3',2,'CHECKED','2','Audit completed','You have an error in your SQL syntax,  near \'1,\'说的法定身份的撒发多少\');\n\' at line 2','#阿双方打法定身份\r\ninsert into test_a(1,\'说的法定身份的撒发多少\');\n','0','','','0','2016-06-24 08:46:27','2016-06-24 08:46:27'),(94,'1',2,'CHECKED','0','Audit completed','None','use test_db','0','','','0','2016-06-24 08:45:33','2016-06-24 08:45:33'),(94,'2',2,'CHECKED','2','Audit completed','Table \'test_a\' already exists.\nSet engine to innodb for table \'test_a\'.\nSet charset to one of \'utf8,utf8mb4\' for table \'test_a\'.\nSet comments for table \'test_a\'.\nColumn \'id\' in table \'test_a\' have no comments.\nColumn \'id\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'id\' in table \'test_a\'\nColumn \'content\' in table \'test_a\' have no comments.\nColumn \'content\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'content\' in table \'test_a\'\nSet a primary key for table \'test_a\'.','create table test_a( id int,content varchar(100))','0','','','0','2016-06-24 08:45:33','2016-06-24 08:45:33'),(94,'3',2,'CHECKED','2','Audit completed','You have an error in your SQL syntax,  near \'1,\'说的法定身份的撒发多少\');\n\' at line 2','#阿双方打法定身份\r\ninsert into test_a(1,\'说的法定身份的撒发多少\');\n','0','','','0','2016-06-24 08:45:33','2016-06-24 08:45:33'),(95,'1',1,'CHECKED','0','Audit completed','None','use test_db','0','','','0','2016-06-24 05:26:29','2016-06-24 05:26:29'),(95,'2',1,'CHECKED','2','Audit completed','Table \'test_a\' already exists.\nSet engine to innodb for table \'test_a\'.\nSet charset to one of \'utf8,utf8mb4\' for table \'test_a\'.\nSet comments for table \'test_a\'.\nColumn \'id\' in table \'test_a\' have no comments.\nColumn \'id\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'id\' in table \'test_a\'\nColumn \'content\' in table \'test_a\' have no comments.\nColumn \'content\' in table \'test_a\' is not allowed to been nullable.\nSet Default value for column \'content\' in table \'test_a\'\nSet a primary key for table \'test_a\'.','create table test_a( id int,content varchar(100))','0','','','0','2016-06-24 05:26:29','2016-06-24 05:26:29'),(95,'3',1,'CHECKED','2','Audit completed','You have an error in your SQL syntax,  near \'1,\"说的法定身份的撒发多少\");\n\' at line 2','#阿双方打法定身份\r\ninsert into test_a(1,\"说的法定身份的撒发多少\");\n','0','','','0','2016-06-24 05:26:29','2016-06-24 05:26:29'),(99,'1',2,'CHECKED','1','Audit completed','Identifier \'user\' is keyword in MySQL.\nset the where condition for select statement.\nSelect only star is not allowed.','select * from mysql.user','0','','','0','2016-06-24 09:31:03','2016-06-24 09:31:03'),(103,'1',2,'CHECKED','1','Audit completed','set the where condition for select statement.\nSelect only star is not allowed.','select * from mysql.user','0','','','0','2016-07-12 03:12:06','2016-07-12 03:12:06'),(117,'1',1,'','0','','','#但双方哈多少分\r\nuse test;\r\nupdate tb_testtable set content=\'dfd的大声疾呼咖啡店\'  where id=1;','0','','1','0','2016-07-06 09:14:51','2016-07-06 09:14:51'),(118,'1',2,'CHECKED','0','Audit completed','None','#但双方哈多少分\r\nuse test','0','','','0','2016-07-06 09:07:44','2016-07-06 09:07:44'),(118,'2',2,'CHECKED','0','Audit completed','None','update tb_testtable set content=\'dfd的大声疾呼咖啡店\'  where id=1','1','','','0','2016-07-06 09:07:44','2016-07-06 09:07:44'),(120,'1',2,'CHECKED','1','Audit completed','Column \'a\' in table \'test\' have no comments.\nSet Default value for column \'a\' in table \'test\'','alter table test.test modify `a` bigint(11) NOT NULL','0','','','0','2016-08-10 07:36:08','2016-08-10 07:36:08'),(121,'1',2,'CHECKED','1','Audit completed','Column \'a\' in table \'test\' have no comments.','alter table test.test modify `a` bigint(11) NOT NULL default \'1\'','0','','','0','2016-08-11 02:37:40','2016-08-11 02:37:40'),(122,'1',2,'CHECKED','0','Audit completed','None','use test','0','','','0','2016-08-11 02:38:34','2016-08-11 02:38:34'),(122,'2',2,'CHECKED','1','Audit completed','Column \'a\' in table \'test\' have no comments.\nSet Default value for column \'a\' in table \'test\'','alter table test modify a bigint(11) NOT NULL','0','','','0','2016-08-11 02:38:34','2016-08-11 02:38:34'),(123,'1',2,'CHECKED','0','Audit completed','None','use testdb','0','','','0','2016-08-11 02:41:45','2016-08-11 02:41:45'),(123,'2',2,'CHECKED','1','Audit completed','Column \'http_method\' in table \'test_data\' have no comments.','alter table test_data modify `http_method` varchar(5000) NOT NULL default \'\'','4','','','0','2016-08-11 02:41:45','2016-08-11 02:41:45'),(124,'1',2,'RERUN','0','Execute Successfully','None','use testdb','0','','','0','2016-08-11 02:43:50','2016-08-11 02:43:50'),(124,'2',2,'EXECUTED','2','Execute Successfully\nBackup failed','Backup: Access denied for user \'123456\'@\'127.0.0.1\' (using password: YES)\nBackup: Access denied for user \'123456\'@\'127.0.0.1\' (using password: YES)','alter table test_data modify `http_method` varchar(5000) NOT NULL default \'\' COMMENT \'ds阿斯顿发生大事\'','1','','','0','2016-08-11 02:43:50','2016-08-11 02:43:50'),(125,'1',2,'RERUN','0','Execute Successfully','None','use passport','0','','','0','2016-08-11 02:56:42','2016-08-11 02:56:42'),(125,'2',2,'EXECUTED','2','Execute Successfully\nBackup failed','Backup: Access denied for user \'123456\'@\'127.0.0.1\' (using password: YES)\nBackup: Access denied for user \'123456\'@\'127.0.0.1\' (using password: YES)','alter table user_login_record modify `credential` varchar(127) NOT NULL default \'\'  COMMENT \'登陆凭证\'','1','','','0','2016-08-11 02:56:42','2016-08-11 02:56:42'),(126,'1',2,'CHECKED','0','Audit completed','None','use Biz','0','','','0','2016-08-11 02:58:07','2016-08-11 02:58:07'),(126,'2',2,'CHECKED','2','Audit completed','Column \'opid_time\' not existed.','alter table cps_user modify `opid_time` varchar(51)  NOT NULL default \'\'  COMMENT \'随便测试\'','80','','','0','2016-08-11 02:58:07','2016-08-11 02:58:07'),(127,'1',2,'RERUN','0','Execute Successfully','None','use Biz','0','','','0','2016-08-11 02:59:17','2016-08-11 02:59:17'),(127,'2',2,'EXECUTED','2','Execute Successfully\nBackup failed','Backup: Access denied for user \'123456\'@\'127.0.0.1\' (using password: YES)\nBackup: Access denied for user \'123456\'@\'127.0.0.1\' (using password: YES)','alter table cps_user modify `cps_key` varchar(41) NOT NULL DEFAULT \'\' COMMENT \'cps用户ID\'','1','','','0','2016-08-11 02:59:17','2016-08-11 02:59:17'),(130,'1',2,'CHECKED','2','Audit completed','Selected Database \'test_db\' not existed.','use test_db','0','','','0','2016-11-29 07:29:52','2016-11-29 07:29:52'),(130,'2',2,'CHECKED','2','Audit completed','No database selected.','insert into test_a(id,content) values (100,\'dfdsfdsf啊多少发多少分\');\n','0','','','0','2016-11-29 07:29:52','2016-11-29 07:29:52'),(131,'1',2,'CHECKED','0','Audit completed','None','#但双方哈多少分\r\nuse test','0','','','0','2016-11-29 07:46:28','2016-11-29 07:46:28'),(131,'2',2,'CHECKED','2','Audit completed','Table \'test.tb_testtable\' doesn\'t exist','update tb_testtable set content=\'dfd的大声疾呼咖啡店\' where id=1','0','','','0','2016-11-29 07:46:28','2016-11-29 07:46:28'),(132,'1',2,'RERUN','0','Execute Successfully','None','use test','0','','','0','2016-11-29 11:10:25','2016-11-29 11:10:25'),(132,'2',2,'EXECUTED','2','Execute Successfully\nBackup failed','#1 Execute(Warning, Code 1366):Incorrect string value: \'\\xE5\\xA4\\x9A\\xE5\\xB0\\x91...\' for column \'aid\' at row 1\nBackup: Access denied for user \'123456\'@\'127.0.0.1\' (using password: YES)\nBackup: Access denied for user \'123456\'@\'127.0.0.1\' (using password: YES)','insert into test (aid) values (\'dsfd多少发多少发多少\')','1','','','0','2016-11-29 11:10:25','2016-11-29 11:10:25'),(133,'1',1,'','0','','','#但双方哈多少分\r\nuse test;\r\nupdate tb_testtable set content=\'dfd的大声疾呼咖啡店\' where id=1;','0','','Mysql Error 1146: Table \'test.tb_testtable\' doesn\'t exist','0','2017-10-13 02:53:50','2017-10-13 02:53:50');
/*!40000 ALTER TABLE `sql_update_task_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_db_relation`
--

DROP TABLE IF EXISTS `user_db_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_db_relation` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `db_id` varchar(50) NOT NULL DEFAULT '' COMMENT '数据库id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`,`db_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户数据库关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_db_relation`
--

LOCK TABLES `user_db_relation` WRITE;
/*!40000 ALTER TABLE `user_db_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_db_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) NOT NULL DEFAULT '' COMMENT '登录账号名称',
  `login_pwd` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `user_email` varchar(50) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `user_mobile` char(11) NOT NULL DEFAULT '0' COMMENT '用户手机号码',
  `user_role` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 超级管理员 2 管理员 3 开发  4 测试...',
  `user_department` varchar(20) NOT NULL DEFAULT '' COMMENT '用户部门',
  `is_forbid` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否禁止登录0 禁止 1 正常',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'root','63a9f0ea7bb98050796b649e85481845','shop','sdsss@qq.com','sddsfsd',1,'运维',1,'2017-07-25 07:48:18','2017-11-28 08:09:59'),(5,'test1','96e79218965eb72c92a549dd5a330112','test1','dssfds@qq.com','dsfdsfds',2,'运维',1,'2017-08-07 07:51:24','2017-11-28 08:10:02');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_right_relation`
--

DROP TABLE IF EXISTS `user_right_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_right_relation` (
  `userid` int(11) NOT NULL COMMENT '用户id',
  `rightid` int(11) NOT NULL COMMENT '权限id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`userid`,`rightid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户页面权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_right_relation`
--

LOCK TABLES `user_right_relation` WRITE;
/*!40000 ALTER TABLE `user_right_relation` DISABLE KEYS */;
INSERT INTO `user_right_relation` VALUES (2,1,NULL,NULL),(2,2,NULL,NULL),(2,3,NULL,NULL),(2,8,NULL,NULL),(2,10,NULL,NULL),(2,13,NULL,NULL),(2,14,NULL,NULL),(2,18,NULL,NULL),(4,1,NULL,NULL),(4,2,NULL,NULL),(4,3,NULL,NULL),(4,5,NULL,NULL),(4,8,NULL,NULL),(4,9,NULL,NULL),(4,10,NULL,NULL),(4,13,NULL,NULL),(4,14,NULL,NULL),(4,15,NULL,NULL),(4,18,NULL,NULL),(5,1,NULL,NULL),(5,2,NULL,NULL),(5,3,NULL,NULL),(5,5,NULL,NULL),(5,6,NULL,NULL),(5,7,NULL,NULL),(5,13,NULL,NULL),(5,14,NULL,NULL),(5,15,NULL,NULL),(5,16,NULL,NULL),(5,17,NULL,NULL),(5,18,NULL,NULL),(5,19,NULL,NULL);
/*!40000 ALTER TABLE `user_right_relation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-28 16:11:13