-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deposit` int(11) NOT NULL,
  `withdraw` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
INSERT INTO `deposits` VALUES (1,'test@email.com',100,0,'2019-11-27 05:49:56','2019-11-27 05:49:56'),(2,'test@email.com',100,0,'2019-11-27 05:50:29','2019-11-27 05:50:29'),(3,'keroro@mail',200,0,'2019-11-27 07:02:03','2019-11-27 07:02:03'),(4,'keroro@mail',200,0,'2019-11-27 07:05:14','2019-11-27 07:05:14'),(5,'keroro@mail',200,0,'2019-11-27 07:08:22','2019-11-27 07:08:22'),(6,'keroro@mail',200,0,'2019-11-27 07:08:50','2019-11-27 07:08:50'),(7,'keroro@mail',200,0,'2019-11-27 07:09:32','2019-11-27 07:09:32'),(8,'keroro@mail',200,0,'2019-11-27 07:11:00','2019-11-27 07:11:00'),(9,'keroro@mail',200,0,'2019-11-27 07:12:00','2019-11-27 07:12:00'),(10,'keroro@mail',200,0,'2019-11-27 07:12:08','2019-11-27 07:12:08'),(11,'keroro@mail',3000,0,'2019-11-27 07:14:36','2019-11-27 07:14:36'),(12,'keroro@mail',1000,0,'2019-11-27 07:16:39','2019-11-27 07:16:39'),(13,'001@gmail.com',100,0,'2019-11-27 07:16:47','2019-11-27 07:16:47'),(14,'keroro@mail',1000,0,'2019-11-27 07:17:19','2019-11-27 07:17:19'),(15,'keroro@mail',2000,0,'2019-11-27 07:17:35','2019-11-27 07:17:35'),(16,'keroro@mail',6000,0,'2019-11-27 07:17:56','2019-11-27 07:17:56'),(17,'keroro@mail',1000,0,'2019-11-27 07:18:19','2019-11-27 07:18:19'),(18,'keroro@mail',1000,0,'2019-11-27 07:18:52','2019-11-27 07:18:52'),(19,'keroro@mail',2000,0,'2019-11-27 07:19:15','2019-11-27 07:19:15'),(20,'keroro@mail',2000,0,'2019-11-27 07:19:27','2019-11-27 07:19:27'),(21,'keroro@mail',200,0,'2019-11-27 07:21:39','2019-11-27 07:21:39'),(22,'keroro@mail',200,0,'2019-11-27 07:23:51','2019-11-27 07:23:51'),(23,'keroro@mail',3000,0,'2019-11-27 07:24:20','2019-11-27 07:24:20'),(24,'keroro@mail',3000,0,'2019-11-27 07:28:28','2019-11-27 07:28:28'),(25,'keroro@mail',3000,0,'2019-11-27 07:29:27','2019-11-27 07:29:27'),(26,'keroro@mail',3000,0,'2019-11-27 07:36:14','2019-11-27 07:36:14'),(27,'keroro@mail',3000,0,'2019-11-27 07:36:24','2019-11-27 07:36:24'),(28,'keroro@mail',3000,0,'2019-11-27 07:41:10','2019-11-27 07:41:10'),(29,'keroro@mail',3000,0,'2019-11-27 07:42:23','2019-11-27 07:42:23'),(30,'keroro@mail',3000,0,'2019-11-27 07:43:06','2019-11-27 07:43:06'),(31,'keroro@mail',3000,0,'2019-11-27 07:43:10','2019-11-27 07:43:10'),(32,'keroro@mail',3000,0,'2019-11-27 07:45:44','2019-11-27 07:45:44'),(33,'keroro@mail',3000,0,'2019-11-27 07:45:48','2019-11-27 07:45:48'),(34,'keroro@mail',30000,0,'2019-11-27 07:46:18','2019-11-27 07:46:18'),(35,'keroro@mail',2000,0,'2019-11-27 07:46:41','2019-11-27 07:46:41'),(36,'keroro@mail',2000,0,'2019-11-27 07:46:43','2019-11-27 07:46:43'),(37,'keroro@mail',2000,0,'2019-11-27 07:47:06','2019-11-27 07:47:06'),(38,'keroro@mail',2000,0,'2019-11-27 07:48:37','2019-11-27 07:48:37'),(39,'keroro@mail',2000,0,'2019-11-27 08:09:55','2019-11-27 08:09:55'),(40,'keroro@mail',2000,0,'2019-11-27 08:14:12','2019-11-27 08:14:12'),(41,'keroro@mail',2000,0,'2019-11-27 08:16:00','2019-11-27 08:16:00'),(42,'keroro@mail',2000,0,'2019-11-27 08:16:21','2019-11-27 08:16:21'),(43,'keroro@mail',2000,0,'2019-11-27 08:17:39','2019-11-27 08:17:39'),(44,'keroro@mail',2000,0,'2019-11-27 08:19:30','2019-11-27 08:19:30'),(45,'keroro@mail',2000,0,'2019-11-27 08:29:58','2019-11-27 08:29:58'),(46,'test@email.com',100,0,'2019-11-27 16:33:41','2019-11-27 16:33:41'),(47,'test@email.com',0,100,'2019-11-27 16:43:28','2019-11-27 16:43:28');
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (26,'2019_10_30_131023_create_records_table',1),(27,'2019_11_25_031438_create_user_wallets_table',1),(28,'2019_11_25_031459_create_shop_wallets_table',1),(29,'2019_11_25_075821_create_sessions_table',1),(30,'2019_11_27_093452_create_deposits_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `remittance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `charging` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (1,'admin@camp.com','arcadia@camp.com',10,3,'2019-11-27 11:59:01','2019-11-27 11:59:01'),(2,'admin@camp.com','test@email.com',10,3,'2019-11-27 11:59:21','2019-11-27 11:59:21'),(3,'test@email.com','arcadia@camp.com',10000,-1,'2019-11-27 12:00:14','2019-11-27 12:00:14'),(4,'test@email.com','test2@email.com',10,3,'2019-11-27 12:01:43','2019-11-27 12:01:43'),(5,'athens@camp.com','test@email.com',10,3,'2019-11-27 12:08:16','2019-11-27 12:08:16'),(6,'athens@camp.com','athens@camp.com',10,3,'2019-11-27 12:08:31','2019-11-27 12:08:31'),(7,'athens@camp.com','sparta@camp.com',10,3,'2019-11-27 12:08:51','2019-11-27 12:08:51'),(8,'wzoewwww@gmail.com','sparta@camp.com',30,9,'2019-11-27 13:28:27','2019-11-27 13:28:27'),(9,'sheepseven@gmail','arcadia@camp.com',10,3,'2019-11-27 13:31:49','2019-11-27 13:31:49'),(10,'sheepseven@gmail','arcadia@camp.com',300,90,'2019-11-27 13:33:06','2019-11-27 13:33:06'),(11,'sheepseven@gmail','arcadia@camp.com',10,3,'2019-11-27 13:33:15','2019-11-27 13:33:15'),(12,'wzoewwww@gmail.com','sparta@camp.com',30,9,'2019-11-27 13:33:17','2019-11-27 13:33:17'),(13,'sheepseven@gmail','arcadia@camp.com',10,3,'2019-11-27 13:33:36','2019-11-27 13:33:36'),(14,'sheepseven@gmail','arcadia@camp.com',10,3,'2019-11-27 13:33:58','2019-11-27 13:33:58'),(15,'wzoewwww@gmail.com','sparta@camp.com',100,30,'2019-11-27 13:40:37','2019-11-27 13:40:37'),(16,'sparta@camp.com','arcadia@camp.com',100,30,'2019-11-27 13:40:38','2019-11-27 13:40:38'),(17,'sheepseven@gmail','arcadia@camp.com',300,90,'2019-11-27 13:44:14','2019-11-27 13:44:14'),(18,'zen@gmail.com','wzoewwww@gmail.com',30,9,'2019-11-27 13:45:46','2019-11-27 13:45:46'),(19,'sheepseven@gmail','arcadia@camp.com',300,90,'2019-11-27 13:57:35','2019-11-27 13:57:35'),(20,'sheepseven@gmail','arcadia@camp.com',300,90,'2019-11-27 13:59:34','2019-11-27 13:59:34'),(21,'sheepseven@gmail','arcadia@camp.com',300,90,'2019-11-27 14:01:25','2019-11-27 14:01:25'),(22,'sheepseven@gmail','arcadia@camp.com',300,90,'2019-11-27 14:02:02','2019-11-27 14:02:02'),(23,'sheepseven@gmail','arcadia@camp.com',300,90,'2019-11-27 14:04:32','2019-11-27 14:04:32'),(24,'zen@gmail.com','sparta@camp.com',100,30,'2019-11-27 14:24:06','2019-11-27 14:24:06'),(25,'wzoewwww@gmail.com','sparta@camp.com',100,30,'2019-11-27 14:41:48','2019-11-27 14:41:48'),(26,'sparta@camp.com','wzoewwww@gmail.com',40,12,'2019-11-27 14:42:29','2019-11-27 14:42:29'),(27,'sparta@camp.com','wzoewwww@gmail.com',40,12,'2019-11-27 14:46:28','2019-11-27 14:46:28'),(28,'sparta@camp.com','wzoewwww@gmail.com',40,12,'2019-11-27 14:47:27','2019-11-27 14:47:27'),(29,'wzoewwww@gmail.com','wzoe@gmail.com',480,144,'2019-11-27 16:09:52','2019-11-27 16:09:52'),(30,'sparta@camp.com','wzoewwww@gmail.com',0,0,'2019-11-28 01:03:56','2019-11-28 01:03:56'),(31,'sparta@camp.com','wzoewwww@gmail.com',0,0,'2019-11-28 01:07:20','2019-11-28 01:07:20'),(32,'sparta@camp.com','wzoewwww@gmail.com',0,0,'2019-11-28 01:10:20','2019-11-28 01:10:20'),(33,'sparta@camp.com','wzoewwww@gmail.com',-500,-100,'2019-11-28 01:11:10','2019-11-28 01:11:10'),(34,'sparta@camp.com','wzoewwww@gmail.com',0,0,'2019-11-28 01:15:49','2019-11-28 01:15:49'),(35,'wzoewwww@gmail.com','sparta@camp.com',150,45,'2019-11-28 01:52:00','2019-11-28 01:52:00'),(36,'wzoewwww@gmail.com','sparta@camp.com',100,30,'2019-11-28 01:53:48','2019-11-28 01:53:48'),(37,'wzoewwww@gmail.com','sparta@camp.com',100,30,'2019-11-28 01:56:09','2019-11-28 01:56:09');
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_wallets`
--

DROP TABLE IF EXISTS `shop_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_wallets`
--

LOCK TABLES `shop_wallets` WRITE;
/*!40000 ALTER TABLE `shop_wallets` DISABLE KEYS */;
INSERT INTO `shop_wallets` VALUES (1,'Sparta','sparta@camp.com','$2y$10$cphgG3Fu3vI.rgVrPtL6ye9nArEwrLkCJmnnERKDcxFZjsbc1Hm26','116805404','1hpuA88d9Z',11034,2,'2019-11-27 11:55:22','2019-11-28 01:56:09'),(2,'Athens','athens@camp.com','$2y$10$PvPcs59S6bKaUnuMQbkNUu6F/pJE4fBaodMIlO8NzmyNDDR1OEuay','1789113124','gqYbC5ge2Q',9971,1,'2019-11-27 11:55:40','2019-11-27 06:28:31'),(3,'Arcadia','arcadia@camp.com','$2y$10$TJhPMU.ZFyiaa4v.bMOkIeFJkd8ubEayr..4ejckGqDr9sxOhKLAy','956275912','e1iTCvH39K',22250,1,'2019-11-27 11:55:55','2019-11-27 16:55:45'),(4,'Bank','admin@camp.com','$2y$10$2LrxNreLgUgK0y.QQzmRL.s4whFZz9ddggz.awrSNlFW9JLOgOv..','1109323643','rJMiX364kF',10996,2,'2019-11-27 11:56:10','2019-11-28 01:56:09');
/*!40000 ALTER TABLE `shop_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_wallets`
--

DROP TABLE IF EXISTS `user_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_wallets`
--

LOCK TABLES `user_wallets` WRITE;
/*!40000 ALTER TABLE `user_wallets` DISABLE KEYS */;
INSERT INTO `user_wallets` VALUES (1,'test','test@email.com','$2y$10$T2LwAnEn58vherikGWPOiu/SAA1M9t6RyMxCtMdgX54QZ/ggHDzwC','MBwdN76NZi','747318000',10477,1,'2019-11-27 11:53:55','2019-11-27 16:43:27'),(2,'test2','test2@email.com','$2y$10$5t2lGj8FY0rqpHCRsrFCwebtsMueEy4RVZZr3u4g089mBd.Crk1K.','9wTkQqTZIP','1179075735',10010,1,'2019-11-27 12:00:56','2019-11-27 12:01:43'),(3,'zen','001@gmail.com','$2y$10$sC31gAn7LHV.RNJApun3Zed4Sul6xuXRElvn3kXLzHnR0jy9S6rTy','UbwSTbi8ny','90699053',10100,1,'2019-11-27 12:11:49','2019-11-27 07:16:47'),(4,'sparta','wzoewwww@gmail.com','$2y$10$nuL8Flqas2.qdV53TE2cJuMJmd1sKrttpdwwJjiJ31TFzj2OGrp0G','FeyzBoKv60','35369242',8233,1,'2019-11-27 13:28:10','2019-11-28 01:56:09'),(5,'sheepseven','sheepseven@gmail','$2y$10$vesS83FotfME4iZSjcseZO2PFLmhT2DRYOanmHjEOWM17UHCCYKbC','9a1m2xqwaF','285934898',7218,1,'2019-11-27 13:31:02','2019-11-27 14:04:32'),(6,'zen','zen@gmail.com','$2y$10$CGk8CFJmentdleOaeZmj7OhjueJWNZ8WXlljp8fJYf9jjCBcIEFwC','fvezvxWHpq','1028577105',9831,1,'2019-11-27 13:39:37','2019-11-27 14:24:06'),(7,'super polly','ablacktaco@gmail.com','$2y$10$BA7Zl7OO7V1G52l//dQtvu6zap54CNCA9Y1O9dOCDnrah/no38YXi','b2zmuWdOmd','152424505',10000,1,'2019-11-27 14:27:35','2019-11-27 14:27:35'),(8,'keroro','keroro@mail','$2y$10$l9HxRnRyfASIzkPGtgcr3uRH7rhU9pnqwKblE77JhVetj/w.L9rPi','sosae8Fcxq','967360386',116000,1,'2019-11-27 14:37:28','2019-11-27 08:29:58'),(9,'sparta','wzoe@gmail.com','$2y$10$uuhUuFjPDWXOFsmJta6gMeyoOwnxm1E8CUu1.4F2F3qZAyeJ2SXUa','ciqxvP3594','362006794',10480,1,'2019-11-27 15:55:06','2019-11-27 16:09:52'),(10,'86888','86888@gmail.com','$2y$10$jQClFBlDDxGG4KhSsdpZmuLSAJehZiQDVjrg8kXL1zYFsMPt8HNTu','Tzhch1WnqL','1989603847',10000,1,'2019-11-28 01:23:14','2019-11-28 01:23:14');
/*!40000 ALTER TABLE `user_wallets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-28  9:56:14
