-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: ni18061_5.vweb10.nitrado.net    Database: ni18061_5sql1
-- ------------------------------------------------------
-- Server version	5.5.54-0+deb7u2

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
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploads` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KEY` varchar(32) NOT NULL,
  `UPLOADED` int(1) NOT NULL DEFAULT '0',
  `REQUEST` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `KEY_UNIQUE` (`KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
INSERT INTO `uploads` VALUES (53,'d82c8d1619ad8176d665453cfb2e55f0',0,'2017-03-31 18:49:11'),(54,'a684eceee76fc522773286a895bc8436',0,'2017-03-31 18:49:23'),(55,'b53b3a3d6ab90ce0268229151c9bde11',0,'2017-03-31 18:52:17'),(56,'9f61408e3afb633e50cdf1b20de6f466',0,'2017-03-31 18:56:48'),(57,'72b32a1f754ba1c09b3695e0cb6cde7f',0,'2017-03-31 19:21:58'),(58,'66f041e16a60928b05a7e228a89c3799',0,'2017-03-31 19:22:19'),(59,'093f65e080a295f8076b1c5722a46aa2',0,'2017-03-31 19:23:03'),(60,'072b030ba126b2f4b2374f342be9ed44',0,'2017-03-31 19:28:53'),(61,'7f39f8317fbdb1988ef4c628eba02591',0,'2017-03-31 19:30:19');
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ni18061_5sql1'
--
/*!50003 DROP PROCEDURE IF EXISTS `getFileID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`ni18061_5sql1`@`%` PROCEDURE `getFileID`()
BEGIN
	DELETE FROM `ni18061_5sql1`.`uploads` WHERE ABS(TIMESTAMPDIFF(MINUTE, `REQUEST`, CURRENT_TIMESTAMP)) > 90;
	INSERT INTO `ni18061_5sql1`.`uploads` (`UPLOADED`) VALUES (0);
	UPDATE `ni18061_5sql1`.`uploads` SET `KEY` = md5(`ID`) WHERE `ID` = last_insert_id();
    SELECT * FROM `ni18061_5sql1`.`uploads` WHERE  `ID` = last_insert_id();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUploadStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`ni18061_5sql1`@`%` PROCEDURE `getUploadStatus`(IN file_key VARCHAR (32))
BEGIN
	SELECT `UPLOADED` AS RESULT FROM `ni18061_5sql1`.`uploads` WHERE `KEY` = file_key;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-31 21:31:27
