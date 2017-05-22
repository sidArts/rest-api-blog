CREATE DATABASE  IF NOT EXISTS `blog_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `blog_db`;
-- MySQL dump 10.13  Distrib 5.7.13, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: blog_db
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` varchar(45) DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT '1',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'1','2','awesome post!','2017-05-13 00:00:00','2017-05-13 10:01:00',1),(2,'1','3','one of the greatest mind ever!','2017-05-13 00:00:00','2017-05-13 10:04:00',1),(3,'1','4','beautiful description','2017-05-13 00:00:00','2017-05-13 10:10:00',1),(4,'1','5','nice one!','2017-05-13 00:00:00','2017-05-13 10:40:00',1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwt`
--

DROP TABLE IF EXISTS `jwt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jwt` (
  `token_id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(2000) DEFAULT NULL,
  `last_accessed` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt`
--

LOCK TABLES `jwt` WRITE;
/*!40000 ALTER TABLE `jwt` DISABLE KEYS */;
INSERT INTO `jwt` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJmaXJzdG5hbWUiOiJTaWRkaGFydGhhIiwibGFzdG5hbWUiOiJNdXJhcmkiLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5NC0wOS0xMFQxODozMDowMC4wMDBaIiwiZW1haWwiOiJzaWRAbWFpbC5jb20iLCJwYXNzd29yZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAxNy0wNC0wOVQxODozMDowMC4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMTctMDQtMTBUMTg6MzA6MDAuMDAwWiIsImlzX2FjdGl2ZSI6MSwiaWF0IjoxNDk0NzUwOTI5LCJleHAiOjE0OTQ3NTQ1Mjl9.qqkM0koMe_2eRNo9zwgHs2MF00PD47NMZt2AmzIRf6s',1494750929632),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJmaXJzdG5hbWUiOiJTaWRkaGFydGhhIiwibGFzdG5hbWUiOiJNdXJhcmkiLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5NC0wOS0xMFQxODozMDowMC4wMDBaIiwiZW1haWwiOiJzaWRAbWFpbC5jb20iLCJwYXNzd29yZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAxNy0wNC0wOVQxODozMDowMC4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMTctMDQtMTBUMTg6MzA6MDAuMDAwWiIsImlzX2FjdGl2ZSI6MSwiaWF0IjoxNDk0NzUxMTM2LCJleHAiOjE0OTQ3NTQ3MzZ9.FZhLQcBANppwWreL6vnf81IN9He_oWzL9_9I7zW5JgY',1494751136479),(3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJmaXJzdG5hbWUiOiJTaWRkaGFydGhhIiwibGFzdG5hbWUiOiJNdXJhcmkiLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5NC0wOS0xMFQxODozMDowMC4wMDBaIiwiZW1haWwiOiJzaWRAbWFpbC5jb20iLCJwYXNzd29yZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAxNy0wNC0wOVQxODozMDowMC4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMTctMDQtMTBUMTg6MzA6MDAuMDAwWiIsImlzX2FjdGl2ZSI6MSwiaWF0IjoxNDk0NzUxMjYzLCJleHAiOjE0OTQ3NTQ4NjN9.mtVaNJnQvlDXIF8-MqGqy9FLVE6tTPKouM4UMy2RK9o',1494751263659),(4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJmaXJzdG5hbWUiOiJTaWRkaGFydGhhIiwibGFzdG5hbWUiOiJNdXJhcmkiLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5NC0wOS0xMFQxODozMDowMC4wMDBaIiwiZW1haWwiOiJzaWRAbWFpbC5jb20iLCJwYXNzd29yZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAxNy0wNC0wOVQxODozMDowMC4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMTctMDQtMTBUMTg6MzA6MDAuMDAwWiIsImlzX2FjdGl2ZSI6MSwiaWF0IjoxNDk0NzUxOTUwLCJleHAiOjE0OTQ3NTU1NTB9.5y_XEq23L6OdQO_vUtx-tZSb8SOCPm1LMN0Tj-QJ_ec',1494751950162),(5,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJmaXJzdG5hbWUiOiJTaWRkaGFydGhhIiwibGFzdG5hbWUiOiJNdXJhcmkiLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5NC0wOS0xMFQxODozMDowMC4wMDBaIiwiZW1haWwiOiJzaWRAbWFpbC5jb20iLCJwYXNzd29yZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAxNy0wNC0wOVQxODozMDowMC4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMTctMDQtMTBUMTg6MzA6MDAuMDAwWiIsImlzX2FjdGl2ZSI6MSwiaWF0IjoxNDk0NzUxOTc2LCJleHAiOjE0OTQ3NTU1NzZ9.Q1JzPdVfWtGybNt_3TLW6uDj8lhNyJ6exjxIE95wKyw',1494751976045),(6,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJmaXJzdG5hbWUiOiJTaWRkaGFydGhhIiwibGFzdG5hbWUiOiJNdXJhcmkiLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5NC0wOS0xMFQxODozMDowMC4wMDBaIiwiZW1haWwiOiJzaWRAbWFpbC5jb20iLCJwYXNzd29yZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAxNy0wNC0wOVQxODozMDowMC4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMTctMDQtMTBUMTg6MzA6MDAuMDAwWiIsImlzX2FjdGl2ZSI6MSwiaWF0IjoxNDk0NzUyMDcyLCJleHAiOjE0OTQ3NTU2NzJ9.eK8WMNhKxaJh8N_EgVzB6m87RzBg1ZqMyLEGeQqIEnI',1494752072428),(7,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJmaXJzdG5hbWUiOiJTaWRkaGFydGhhIiwibGFzdG5hbWUiOiJNdXJhcmkiLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5NC0wOS0xMFQxODozMDowMC4wMDBaIiwiZW1haWwiOiJzaWRAbWFpbC5jb20iLCJwYXNzd29yZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAxNy0wNC0wOVQxODozMDowMC4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMTctMDQtMTBUMTg6MzA6MDAuMDAwWiIsImlzX2FjdGl2ZSI6MSwiaWF0IjoxNDk0NzUyNTkwLCJleHAiOjE0OTQ3NTYxOTB9.foTXuE1UcRIJN2QCI8jbkEgzfnhxFgf9b1XG-57xSE8',1494752590445),(8,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJmaXJzdG5hbWUiOiJTaWRkaGFydGhhIiwibGFzdG5hbWUiOiJNdXJhcmkiLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5NC0wOS0xMFQxODozMDowMC4wMDBaIiwiZW1haWwiOiJzaWRAbWFpbC5jb20iLCJwYXNzd29yZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAxNy0wNC0wOVQxODozMDowMC4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMTctMDQtMTBUMTg6MzA6MDAuMDAwWiIsImlzX2FjdGl2ZSI6MSwiaWF0IjoxNDk0NzU0NjU3LCJleHAiOjE0OTQ3NTgyNTd9.L2OsCom-Ar3te2-PZia4xKP320r3OlcNntAewR-cUUw',1494754657939),(9,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJmaXJzdG5hbWUiOiJTaWRkaGFydGhhIiwibGFzdG5hbWUiOiJNdXJhcmkiLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5NC0wOS0xMFQxODozMDowMC4wMDBaIiwiZW1haWwiOiJzaWRAbWFpbC5jb20iLCJwYXNzd29yZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAxNy0wNC0wOVQxODozMDowMC4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMTctMDQtMTBUMTg6MzA6MDAuMDAwWiIsImlzX2FjdGl2ZSI6MSwiaWF0IjoxNDk0NzU0NzkzLCJleHAiOjE0OTQ3NTgzOTN9.5ZM5V_rNuzSbBsoiloVmnKktkzCDq0MMMTMj0S5kYZ4',1494754793616),(10,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJmaXJzdG5hbWUiOiJTaWRkaGFydGhhIiwibGFzdG5hbWUiOiJNdXJhcmkiLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5NC0wOS0xMFQxODozMDowMC4wMDBaIiwiZW1haWwiOiJzaWRAbWFpbC5jb20iLCJwYXNzd29yZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAxNy0wNC0wOVQxODozMDowMC4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMTctMDQtMTBUMTg6MzA6MDAuMDAwWiIsImlzX2FjdGl2ZSI6MSwiaWF0IjoxNDk0NzU0ODkzLCJleHAiOjE0OTQ3NTg0OTN9.s1pOzy1NEtOFyoblpBR0_SF40u3dKok7RB4kQevRGAA',1494754893314),(11,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJmaXJzdG5hbWUiOiJTaWRkaGFydGhhIiwibGFzdG5hbWUiOiJNdXJhcmkiLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5NC0wOS0xMFQxODozMDowMC4wMDBaIiwiZW1haWwiOiJzaWRAbWFpbC5jb20iLCJwYXNzd29yZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAxNy0wNC0wOVQxODozMDowMC4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMTctMDQtMTBUMTg6MzA6MDAuMDAwWiIsImlzX2FjdGl2ZSI6MSwiaWF0IjoxNDk0NzU0OTg1LCJleHAiOjE0OTQ3NTg1ODV9.4VwmgRvgncURKCN9Ge7EW9n_uZcN_9c4jHyIB8KWk-8',1494754985644),(12,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJmaXJzdG5hbWUiOiJTaWRkaGFydGhhIiwibGFzdG5hbWUiOiJNdXJhcmkiLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5NC0wOS0xMFQxODozMDowMC4wMDBaIiwiZW1haWwiOiJzaWRAbWFpbC5jb20iLCJwYXNzd29yZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAxNy0wNC0wOVQxODozMDowMC4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMTctMDQtMTBUMTg6MzA6MDAuMDAwWiIsImlzX2FjdGl2ZSI6MSwiaWF0IjoxNDk0NzU1NDQ5LCJleHAiOjE0OTQ3NTkwNDl9.TURKEWoQpPu2n3w3139p9r-nFlpnCG86sk8cjKdy97o',1494755449255),(13,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJmaXJzdG5hbWUiOiJTaWRkaGFydGhhIiwibGFzdG5hbWUiOiJNdXJhcmkiLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5NC0wOS0xMFQxODozMDowMC4wMDBaIiwiZW1haWwiOiJzaWRAbWFpbC5jb20iLCJwYXNzd29yZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAxNy0wNC0wOVQxODozMDowMC4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMTctMDQtMTBUMTg6MzA6MDAuMDAwWiIsImlzX2FjdGl2ZSI6MSwiaWF0IjoxNDk0NzU2MTU5LCJleHAiOjE0OTQ3NTk3NTl9.iJcsvADAFOlR01oSeVbFebKQk5uUbqZjupH_kgwFXmQ',1494756160246),(14,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJmaXJzdG5hbWUiOiJTaWRkaGFydGhhIiwibGFzdG5hbWUiOiJNdXJhcmkiLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5NC0wOS0xMFQxODozMDowMC4wMDBaIiwiZW1haWwiOiJzaWRAbWFpbC5jb20iLCJwYXNzd29yZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAxNy0wNC0wOVQxODozMDowMC4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMTctMDQtMTBUMTg6MzA6MDAuMDAwWiIsImlzX2FjdGl2ZSI6MSwiaWF0IjoxNDk0NzU2OTM5LCJleHAiOjE0OTQ3NjA1Mzl9.E4QGO3vfoH-_7MvPGP962ATrKc9PcyNquUr8Ztht0CE',1494756944111);
/*!40000 ALTER TABLE `jwt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_likes` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`like_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_likes`
--

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;
INSERT INTO `post_likes` VALUES (1,2,1),(2,3,1),(3,4,1);
/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` text,
  `description` longtext,
  `subtitle` text,
  `viewCount` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'Albert Einstein on Knowledge','This is some description','Knowledge is limited. Imagination encircles the world',1,'2017-05-13 00:00:00','2017-05-13 00:00:00',1),(2,3,'Testing new post','This is a new post','post subtitle',3,'2017-05-13 09:08:00','2017-05-13 09:08:00',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Siddhartha','Murari','Male','1994-09-11 00:00:00','sid@mail.com','1','2017-04-10 00:00:00','2017-04-11 00:00:00',1),(2,'Anjali','Sinha','Female','1989-08-21 00:00:00','anjali@mail.com','91','2017-04-11 00:00:00','2017-04-11 00:00:00',1),(3,'Rupam','Ghosh','Male','1985-02-05 00:00:00','rupam@mail.com','13','2017-04-11 00:00:00','2017-04-11 00:00:00',1),(4,'Priyanka','Chatterjee','Female','1991-08-03 00:00:00','priyanka@mail.com','12','2017-04-11 00:00:00','2017-04-11 00:00:00',1),(5,'Arko','Sen','Male','1990-12-17 00:00:00','arko@mail.com','17','2017-04-11 00:00:00','2017-04-11 00:00:00',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-22 20:37:27