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
  `KEY` varchar(32) DEFAULT NULL,
  `UPLOADED` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
INSERT INTO `uploads` VALUES (1,'c4ca4238a0b923820dcc509a6f75849b',0),(2,'c81e728d9d4c2f636f067f89cc14862c',0),(3,'eccbc87e4b5ce2fe28308fd9f2a7baf3',0),(4,'a87ff679a2f3e71d9181a67b7542122c',0),(5,'e4da3b7fbbce2345d7772b0674a318d5',0),(6,'1679091c5a880faf6fb5e6087eb1b2dc',0),(7,'8f14e45fceea167a5a36dedd4bea2543',0),(8,'c9f0f895fb98ab9159f51fd0297e236d',0),(9,'45c48cce2e2d7fbdea1afc51c7c6ad26',0),(10,'d3d9446802a44259755d38e6d163e820',0),(11,'6512bd43d9caa6e02c990b0a82652dca',0);
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
	INSERT INTO `ni18061_5sql1`.`uploads` (`UPLOADED`) VALUES (0);
	UPDATE `ni18061_5sql1`.`uploads` SET `KEY` = md5(`ID`) WHERE `ID` = last_insert_id();
    SELECT * FROM `ni18061_5sql1`.`uploads` WHERE  `ID` = last_insert_id();
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

-- Dump completed on 2017-03-31 20:23:06
