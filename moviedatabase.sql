/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - moviedatabase
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`moviedatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `moviedatabase`;

/*Table structure for table `cast` */

DROP TABLE IF EXISTS `cast`;

CREATE TABLE `cast` (
  `castid` int(11) NOT NULL AUTO_INCREMENT,
  `movieid` int(11) NOT NULL,
  `starid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `roledescription` varchar(1000) NOT NULL,
  `castname` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  PRIMARY KEY (`castid`),
  KEY `deletedby` (`deletedby`),
  KEY `starid` (`starid`),
  KEY `movieid` (`movieid`),
  KEY `roleid` (`roleid`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `cast_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `cast_ibfk_2` FOREIGN KEY (`starid`) REFERENCES `star` (`starid`),
  CONSTRAINT `cast_ibfk_3` FOREIGN KEY (`movieid`) REFERENCES `movie` (`movieid`),
  CONSTRAINT `cast_ibfk_4` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`),
  CONSTRAINT `cast_ibfk_5` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cast` */

/*Table structure for table `directors` */

DROP TABLE IF EXISTS `directors`;

CREATE TABLE `directors` (
  `directorid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `dateofbirth` date NOT NULL,
  `passportphoto` varchar(1000) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `addedby` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  PRIMARY KEY (`directorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `directors` */

/*Table structure for table `genres` */

DROP TABLE IF EXISTS `genres`;

CREATE TABLE `genres` (
  `genreid` int(11) NOT NULL AUTO_INCREMENT,
  `genrename` varchar(100) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  PRIMARY KEY (`genreid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `genres` */

/*Table structure for table `languages` */

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `languageid` int(11) NOT NULL AUTO_INCREMENT,
  `languagename` varchar(20) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `addedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`languageid`),
  KEY `deletedby` (`deletedby`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `languages_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `languages` */

/*Table structure for table `media` */

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `mediaid` int(11) NOT NULL AUTO_INCREMENT,
  `medianame` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `addedby` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`mediaid`),
  KEY `deletedby` (`deletedby`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `media` */

/*Table structure for table `movie` */

DROP TABLE IF EXISTS `movie`;

CREATE TABLE `movie` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `releasedate` datetime NOT NULL,
  `runningtime` time NOT NULL,
  `sysnopsis` varchar(1000) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deletedby` int(11) NOT NULL,
  PRIMARY KEY (`movieid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `movie_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movie` */

/*Table structure for table `moviegenres` */

DROP TABLE IF EXISTS `moviegenres`;

CREATE TABLE `moviegenres` (
  `movieid` int(11) NOT NULL,
  `genreid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  KEY `Index` (`genreid`),
  KEY `movieid` (`movieid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `moviegenres_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movie` (`movieid`),
  CONSTRAINT `moviegenres_ibfk_2` FOREIGN KEY (`genreid`) REFERENCES `genres` (`genreid`),
  CONSTRAINT `moviegenres_ibfk_3` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `moviegenres_ibfk_4` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `moviegenres` */

/*Table structure for table `movielanguages` */

DROP TABLE IF EXISTS `movielanguages`;

CREATE TABLE `movielanguages` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `languageid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  PRIMARY KEY (`movieid`),
  KEY `languageid` (`languageid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `movielanguages_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movie` (`movieid`),
  CONSTRAINT `movielanguages_ibfk_2` FOREIGN KEY (`languageid`) REFERENCES `languages` (`languageid`),
  CONSTRAINT `movielanguages_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movielanguages` */

/*Table structure for table `moviemedia` */

DROP TABLE IF EXISTS `moviemedia`;

CREATE TABLE `moviemedia` (
  `movieid` int(11) NOT NULL,
  `mediaid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  `addedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`movieid`),
  KEY `mediaid` (`mediaid`),
  KEY `deletedby` (`deletedby`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `moviemedia_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movie` (`movieid`),
  CONSTRAINT `moviemedia_ibfk_2` FOREIGN KEY (`mediaid`) REFERENCES `media` (`mediaid`),
  CONSTRAINT `moviemedia_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `moviemedia_ibfk_4` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `moviemedia` */

/*Table structure for table `movieproductioncompanies` */

DROP TABLE IF EXISTS `movieproductioncompanies`;

CREATE TABLE `movieproductioncompanies` (
  `movieid` int(11) NOT NULL,
  `companyid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  `addedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`companyid`),
  KEY `movieid` (`movieid`),
  KEY `deletedby` (`deletedby`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `movieproductioncompanies_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movie` (`movieid`),
  CONSTRAINT `movieproductioncompanies_ibfk_2` FOREIGN KEY (`companyid`) REFERENCES `productioncompanies` (`companyid`),
  CONSTRAINT `movieproductioncompanies_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `movieproductioncompanies_ibfk_4` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movieproductioncompanies` */

/*Table structure for table `movierating` */

DROP TABLE IF EXISTS `movierating`;

CREATE TABLE `movierating` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `ratingid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `addedby` int(11) DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`movieid`),
  KEY `ratingid` (`ratingid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `movierating_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movie` (`movieid`),
  CONSTRAINT `movierating_ibfk_2` FOREIGN KEY (`ratingid`) REFERENCES `rating` (`ratingid`),
  CONSTRAINT `movierating_ibfk_3` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `movierating_ibfk_4` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movierating` */

/*Table structure for table `movieresolution` */

DROP TABLE IF EXISTS `movieresolution`;

CREATE TABLE `movieresolution` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `resolutionid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `addedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`movieid`),
  KEY `resolutionid` (`resolutionid`),
  KEY `deletedby` (`deletedby`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `movieresolution_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movie` (`movieid`),
  CONSTRAINT `movieresolution_ibfk_2` FOREIGN KEY (`resolutionid`) REFERENCES `resolution` (`resolutionid`),
  CONSTRAINT `movieresolution_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `movieresolution_ibfk_4` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movieresolution` */

/*Table structure for table `movieroles` */

DROP TABLE IF EXISTS `movieroles`;

CREATE TABLE `movieroles` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `roledescription` varchar(1000) NOT NULL,
  PRIMARY KEY (`roleid`),
  CONSTRAINT `movieroles_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movieroles` */

/*Table structure for table `moviestar` */

DROP TABLE IF EXISTS `moviestar`;

CREATE TABLE `moviestar` (
  `starid` int(11) DEFAULT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `middlename` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `moviestar` */

/*Table structure for table `movietitle` */

DROP TABLE IF EXISTS `movietitle`;

CREATE TABLE `movietitle` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `movietitle` varchar(100) NOT NULL,
  `director` varchar(50) DEFAULT NULL,
  `moviestatus` varchar(20) DEFAULT NULL,
  `sysnopsis` varchar(500) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `releaseyear` datetime DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`movieid`),
  KEY `deletedby` (`sysnopsis`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`moviestatus` in ('upcoming','released','cancelled'))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movietitle` */

insert  into `movietitle`(`movieid`,`movietitle`,`director`,`moviestatus`,`sysnopsis`,`datedeleted`,`dateadded`,`releaseyear`,`addedby`) values 
(3,'Click click bang','Abel Mutua','Cancelled','click click bang',NULL,NULL,'2022-07-12 10:05:59',NULL),
(4,'spider man','Abel Mutua','Cancelled','The best fcitious movie in this year',NULL,'2024-07-10 11:21:39','2024-07-10 11:21:39',NULL),
(5,'Kenyan Gen Z Revt','Kasmuel McOure','Upcoming','The revolutionary movement hit headlines and spark global attention',NULL,NULL,'2024-07-10 13:12:13',NULL),
(6,'Kenyan Gen Z Revt','Kasmuel McOure','Upcoming','The revolutionary movement hit headlines and spark global attention',NULL,NULL,'2024-07-10 13:13:29',NULL),
(7,'spider man','Kelvin Ekisa','released','Movies released by kelvin Ekisa and Ruth Mukiri',NULL,'2024-08-07 20:21:30','2024-08-07 20:21:30',1),
(8,'All the bright places','Joy Kasusya','upcoming','a love story of young love birds creating a symphony of purpose and destiny',NULL,'2024-08-07 20:30:37','2024-08-07 20:30:37',1);

/*Table structure for table `nationalities` */

DROP TABLE IF EXISTS `nationalities`;

CREATE TABLE `nationalities` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(50) DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`countryid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `nationalities_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `nationalities_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `nationalities_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `nationalities` */

/*Table structure for table `objects` */

DROP TABLE IF EXISTS `objects`;

CREATE TABLE `objects` (
  `objectid` int(11) NOT NULL AUTO_INCREMENT,
  `objectname` varchar(1000) NOT NULL,
  PRIMARY KEY (`objectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `objects` */

/*Table structure for table `privileges` */

DROP TABLE IF EXISTS `privileges`;

CREATE TABLE `privileges` (
  `userid` int(11) NOT NULL,
  `objectid` int(11) NOT NULL AUTO_INCREMENT,
  `valid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  PRIMARY KEY (`objectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `privileges` */

/*Table structure for table `productioncompanies` */

DROP TABLE IF EXISTS `productioncompanies`;

CREATE TABLE `productioncompanies` (
  `companyid` int(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(200) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  `addedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`companyid`),
  KEY `deletedby` (`deletedby`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `productioncompanies_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `productioncompanies_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productioncompanies` */

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `ratingid` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `dateadded` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0,
  `addedby` int(11) DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`ratingid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `rating` */

/*Table structure for table `resolution` */

DROP TABLE IF EXISTS `resolution`;

CREATE TABLE `resolution` (
  `resolutionid` int(11) NOT NULL AUTO_INCREMENT,
  `resolutionname` varchar(100) NOT NULL,
  `resolutionmatrix` varchar(20) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `addedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`resolutionid`),
  KEY `deletedby` (`deletedby`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `resolution_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `resolution_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `resolution` */
