/*
SQLyog Ultimate v9.02 
MySQL - 5.0.24-community-nt : Database - proj4
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`proj4` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `proj4`;

/*Table structure for table `st_college` */

DROP TABLE IF EXISTS `st_college`;

CREATE TABLE `st_college` (
  `Id` bigint(20) NOT NULL,
  `NAME` varchar(100) default NULL,
  `ADDRESS` varchar(255) default NULL,
  `STATE` varchar(20) default NULL,
  `CITY` varchar(50) default NULL,
  `PHONE_NO` varchar(15) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `Modified_By` varchar(50) default NULL,
  `CREATED_DATETIME` datetime default NULL,
  `Modified_DATETIME` datetime default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_college` */

insert  into `st_college`(`Id`,`NAME`,`ADDRESS`,`STATE`,`CITY`,`PHONE_NO`,`CREATED_BY`,`Modified_By`,`CREATED_DATETIME`,`Modified_DATETIME`) values (1,'Medicaps','Indore','Madya pradesh','Indore','9876543457','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-08 17:28:45','2021-10-13 13:38:58'),(3,'Sage','Mahu','Madya pradesh','indore','7400901629','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:47:35','2021-11-28 23:47:35'),(4,'IIT kharagpur','Kharagpur','West Bengal','Kharagpur','9617073519','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:50:22','2021-11-28 23:50:22'),(5,'Jawaharlal Nehru University','New Delhi','New Delhi','Delhi','7678565454','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:51:50','2021-11-28 23:51:50'),(6,'Govt.Holkar Science','Ab road Bhawarkua Square','Madya pradesh','indore','7678565454','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:53:58','2021-11-28 23:53:58'),(7,'Dr.A.P.J. Abdul Kalam University','Indore Bypass rd.','Madya pradesh','indore','7400901629','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:55:19','2021-11-28 23:55:19'),(8,'sri Aurobindo institute of Medical seciences','Sanwer Road','Madya pradesh','indore','9876543457','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:56:24','2021-11-28 23:56:24'),(9,'Malwa institute of Technology','bypass road pragati vihar','Madya pradesh','indore','9876543457','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:57:38','2021-11-28 23:57:38'),(10,'Astral college','kailod kartal indore bypass road','Madya pradesh','indore','7400901629','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:58:36','2021-11-28 23:58:36'),(11,'DY Patil  University','Nerul','Maharashtra','new Mumbai','7400901629','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:00:59','2021-11-29 00:02:27'),(12,'Bherulal Patidar Govt College','MHOW','Madya pradesh','MHOW','9731232345','rupalichauhan222@gmail.com','rupalichauhan222@gmail.com','2021-12-18 23:56:54','2021-12-18 23:57:13'),(13,'Davv','MHOW','Madya pradesh','Bhopal','9898989898','bulbul21@gmail.com','bulbul21@gmail.com','2021-12-25 15:59:33','2021-12-25 15:59:33'),(14,'mimtss','MHOW','Madya pradesh','bhopal','9898989998','bulbul21@gmail.com','bulbul21@gmail.com','2021-12-25 16:00:16','2021-12-25 16:00:27'),(15,'NSPC','Indore','Madya pradesh','Indore','9856321470','Admin','Admin','2022-02-20 20:58:42','2022-02-20 20:58:42');

/*Table structure for table `st_course` */

DROP TABLE IF EXISTS `st_course`;

CREATE TABLE `st_course` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(50) default NULL,
  `DESCRIPTION` varchar(250) default NULL,
  `DURATION` varchar(250) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `MODIfIED_BY` varchar(50) default NULL,
  `CREATED_DATETIME` datetime default NULL,
  `MODIFIED_DATETIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_course` */

insert  into `st_course`(`ID`,`NAME`,`DESCRIPTION`,`DURATION`,`CREATED_BY`,`MODIfIED_BY`,`CREATED_DATETIME`,`MODIFIED_DATETIME`) values (1,'Btech','btech','4 Year','admin@gmail.com','admin@gmail.com','2021-09-01 11:04:48','2022-07-07 14:20:25'),(3,'corporate Java','Java','2 Year','kapil@gmail.com','ankit@gmail.com','2021-08-22 01:12:59','2021-08-22 01:12:59'),(4,'Btech','btech','3 Year','monti@gmail.com','sahu74824@gmail.com','2021-09-01 11:04:48','2021-09-01 11:04:48'),(5,'MBA','Mba','2 Year','yash@gmail.com','sahu74824@gmail.com','2021-11-29 00:07:37','2021-11-29 00:07:37'),(6,'Maths','maths','1 Year','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:07:59','2021-11-29 00:07:59'),(7,'Computers Commarce','commerce','3 Year','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:08:37','2021-11-29 00:08:37'),(8,'B.arch','Bechelor of Architectur','3 Year','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:09:53','2021-11-29 00:09:53'),(9,'B.sc','Nursing','2 Year','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:09:53','2021-11-29 00:09:53'),(10,'Bds','Bachelor of Dental Surgery','3 Year','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:11:28','2021-11-29 00:11:28'),(11,'BPharma','Bachelor of Pharmacy','2 Year','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:12:59','2021-11-29 00:12:59'),(12,'FFHFF','B BB','4 Year','bulbul21@gmail.com','bulbul21@gmail.com','2021-12-25 16:31:07','2021-12-25 16:31:07'),(13,'FFHFF','B BB','4 Year','bulbul21@gmail.com','bulbul21@gmail.com','2021-12-25 16:31:40','2021-12-25 16:31:40'),(14,'FFHFFKK','B BBSAAAS','4 Year','bulbul21@gmail.com','bulbul21@gmail.com','2021-12-25 16:31:40','2021-12-25 16:31:40'),(15,'B.com','commerce','4 Year','admin','admin','2022-02-23 12:44:37','2022-02-23 12:44:37'),(16,'B.Sc','cmputer science','3 Year','admin','admin','2022-02-23 12:47:02','2022-02-23 12:47:02');

/*Table structure for table `st_faculty` */

DROP TABLE IF EXISTS `st_faculty`;

CREATE TABLE `st_faculty` (
  `ID` bigint(20) NOT NULL,
  `FIRST_NAME` varchar(50) default NULL,
  `LAST_NAME` varchar(50) default NULL,
  `GENDER` varchar(10) default NULL,
  `EMAIL_ID` varchar(50) default NULL,
  `MOBILE_NO` varchar(20) default NULL,
  `COLLEGE_ID` bigint(20) default NULL,
  `COLLEGE_NAME` varchar(50) default NULL,
  `COURSE_ID` bigint(20) default NULL,
  `COURSE_NAME` varchar(50) default NULL,
  `DOB` varchar(50) default NULL,
  `SUBJECT_ID` bigint(20) default NULL,
  `SUBJECT_NAME` varchar(50) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `CREATED_DATETIME` datetime default NULL,
  `MODIFIED_DATETIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_faculty` */

insert  into `st_faculty`(`ID`,`FIRST_NAME`,`LAST_NAME`,`GENDER`,`EMAIL_ID`,`MOBILE_NO`,`COLLEGE_ID`,`COLLEGE_NAME`,`COURSE_ID`,`COURSE_NAME`,`DOB`,`SUBJECT_ID`,`SUBJECT_NAME`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATETIME`,`MODIFIED_DATETIME`) values (2,'Yash','Sharma','Male','Ankit@gmail.com','6232795643',1,'Davv',4,'Btech','2021-09-22',2,'css','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-06 01:05:46','2021-09-06 01:05:46'),(3,'Dheeraj','Vishwakarma','Male','Ankklkjt@gmail.com','6232795643',1,NULL,4,NULL,'2021-09-22',2,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-10-13 13:38:23','2021-10-13 13:38:23'),(4,'Vishu','Lumba','Male','Aklkjt@gmail.com','6232795643',13,'Medicaps',10,'Bds','2021-09-22',5,NULL,'admin@gmail.com','admin@gmail.com','2022-07-11 13:22:22','2022-07-11 13:22:22'),(5,'Sheetal','Gurjar','Male','Aklk@gmail.com','6232795643',1,'Davv',4,'Btech','2021-09-22',2,'css','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-06 01:05:59','2021-09-06 01:05:59'),(6,'Vineet','Goyal','Male','Aklghjgk@gmail.com','6232795643',1,'Davv',4,'Maths','2021-09-22',2,'css','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-06 01:06:02','2021-09-06 01:06:02'),(7,'Chetan','Rathore','Male','Akl@gmail.com','6232795643',1,'Davv',4,'Btech','2021-09-22',2,'css','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-06 01:06:10','2021-09-06 01:06:10'),(8,'Kapil','Malviya','Male','Akjkhl@gmail.com','6232795643',1,'Davv',4,'Btech','2021-09-22',2,'css','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-06 01:06:14','2021-09-06 01:06:14'),(9,'Rahul','Patel','Male','Akjkhhl@gmail.com','6232795643',1,'Davv',4,'Btech','2021-09-22',2,'css','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-06 01:06:18','2021-09-06 01:06:18'),(10,'Ronit','Roy','Male','Akjkkhhl@gmail.com','6232795643',1,'Davv',4,'Btech','2021-09-22',2,'css','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-06 01:06:19','2021-09-06 01:06:19'),(11,'Fahim','Ansari','Male','Akjkhkhhl@gmail.com','6232795643',1,'Davv',4,'Btech','2021-09-22',2,'css','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-06 01:06:22','2021-09-06 01:06:22'),(12,'Abhay','Mt','Male','abhay@gmail.com','6232795643',2,'SHM Degree College',4,'Btech','1999-05-25',2,'css','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-23 12:31:13','2021-09-23 12:31:13'),(13,'Prateek','Sharma','Male','raju@gmail.com','9273847619',3,'Sage',2,'B.com','1998-08-25',6,'Acount','sahu74824@gmail.com','sahu74824@gmail.com','2021-12-03 10:11:03','2021-12-03 10:11:03'),(14,'Reena','Verma','Female','Reena32@gmail.com','7415781289',12,'Bherulal Patidar Govt College',9,'B.sc','2021-12-07',7,'science','rupalichauhan222@gmail.com','rupalichauhan222@gmail.com','2021-12-19 00:00:26','2021-12-19 00:00:26');

/*Table structure for table `st_marksheet` */

DROP TABLE IF EXISTS `st_marksheet`;

CREATE TABLE `st_marksheet` (
  `ID` bigint(20) NOT NULL,
  `ROLL_NO` varchar(15) default NULL,
  `STUDENT_ID` bigint(20) default NULL,
  `NAME` varchar(50) default NULL,
  `PHYSICS` int(11) default NULL,
  `CHEMISTRY` int(11) default NULL,
  `MATHS` int(11) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `CREATED_DATETIME` datetime default NULL,
  `MODIFIED_DATETIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_marksheet` */

insert  into `st_marksheet`(`ID`,`ROLL_NO`,`STUDENT_ID`,`NAME`,`PHYSICS`,`CHEMISTRY`,`MATHS`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATETIME`,`MODIFIED_DATETIME`) values (1,'Dx101',1,'Yash Kanoongo',56,67,98,'ankit@gmail.com','yashkanoongo493@gmail.com','2021-08-19 17:54:27','2022-04-12 13:49:49'),(3,'DX331',2,'Tarun Mandloi',20,100,50,'yashkanoongo493@gmail.com','yashkanoongo493@gmail.com','2022-02-21 00:57:11','2022-02-21 00:57:11'),(4,'Dx104',12,'Monti Gupta',23,70,87,'sahu74824@gmail.com','bulbul21@gmail.com','2021-11-29 00:49:08','2021-12-24 15:28:45'),(9,'Dx109',11,'Kapil Malviya',33,43,35,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:51:18','2021-11-29 00:51:18'),(10,'Dx110',3,'Vishu Lumba',60,75,90,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:51:37','2021-11-29 00:51:37'),(11,'Dx111',8,'VInnet Goyal',90,80,70,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:51:52','2021-11-29 00:51:52'),(12,'Dx112',7,'Dheeraj Vishwakarma ',99,98,78,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:52:11','2021-11-29 00:52:14'),(13,'Dx113',1,'Radhika patel ',52,41,25,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:52:44','2021-11-29 00:52:44'),(14,'Dx114',5,'Nidhi Patel',10,3,5,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:53:04','2021-11-29 00:53:04'),(15,'Dx123',15,'Ankit Rathod',90,59,78,'sahu74824@gmail.com','sahu74824@gmail.com','2021-12-13 15:57:25','2021-12-13 15:57:25'),(19,'Dx301',17,'Pranjal Jaiswal',43,45,56,'bulbul21@gmail.com','bulbul21@gmail.com','2022-01-29 17:44:42','2022-01-29 17:44:42'),(20,'Dx302',1,'Roshni Solanki',33,45,56,'bulbul21@gmail.com','bulbul21@gmail.com','2022-01-29 17:45:02','2022-01-29 17:45:02'),(21,'Dx303',11,'Nilesh Gurjar',39,87,65,'bulbul21@gmail.com','bulbul21@gmail.com','2022-01-29 17:45:21','2022-01-29 17:45:21'),(22,'Dx305',19,'Manish Sharma',43,65,65,'bulbul21@gmail.com','bulbul21@gmail.com','2022-01-29 17:46:23','2022-01-29 17:46:23'),(23,'Dx307',18,'Meera Rajput',43,54,65,'bulbul21@gmail.com','bulbul21@gmail.com','2022-01-29 17:46:41','2022-01-29 17:46:41'),(24,'Dx308',5,'Lavish Goyal',76,76,56,'bulbul21@gmail.com','bulbul21@gmail.com','2022-01-29 17:47:10','2022-01-29 17:47:10'),(25,'Dx310',3,'Saloni Gurjar',65,66,76,'bulbul21@gmail.com','bulbul21@gmail.com','2022-01-29 17:47:45','2022-01-29 17:47:58'),(26,'Dx311',14,'Vivek Rathod',65,65,76,'bulbul21@gmail.com','bulbul21@gmail.com','2022-01-29 17:48:11','2022-01-29 17:48:18'),(27,'Dx312',12,'Deepak karoda',54,65,65,'bulbul21@gmail.com','bulbul21@gmail.com','2022-01-29 17:48:49','2022-01-29 17:48:49'),(28,'Dx316',9,'Shiv Malviya',43,54,65,'bulbul21@gmail.com','bulbul21@gmail.com','2022-01-29 17:49:34','2022-01-29 17:49:34'),(29,'Dx313',6,'Sachin Biral',56,87,87,'bulbul21@gmail.com','bulbul21@gmail.com','2022-02-01 16:01:56','2022-02-01 16:01:56'),(30,'Dx315',18,'Abhishek Patidar',78,89,98,'bulbul21@gmail.com','bulbul21@gmail.com','2022-02-01 16:02:13','2022-02-01 16:02:13');

/*Table structure for table `st_role` */

DROP TABLE IF EXISTS `st_role`;

CREATE TABLE `st_role` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(50) default NULL,
  `DESCRIPTION` varchar(50) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `CREATED_DATETIME` datetime default NULL,
  `MODIFIED_DATETIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_role` */

insert  into `st_role`(`ID`,`NAME`,`DESCRIPTION`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATETIME`,`MODIFIED_DATETIME`) values (1,'Admin','Admin','Yashkanoongo493@gmail.com','Yashkanoongo493@gmail.com','2022-02-23 14:02:45','2022-02-23 14:02:45'),(2,'Student','student','ankit@gmail.com','ankit@gmail.com','2021-08-25 14:41:36','2021-08-25 14:41:36'),(3,'Student','student','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-03 12:40:14','2021-09-03 12:40:14'),(4,'College','college','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-23 16:57:33','2021-11-23 16:57:33'),(5,'Kiosk','Kiosk','Yashkanoongo493@gmail.com','Yashkanoongo493@gmail.com','2022-02-23 14:02:45','2022-02-23 14:02:45');

/*Table structure for table `st_student` */

DROP TABLE IF EXISTS `st_student`;

CREATE TABLE `st_student` (
  `ID` bigint(20) NOT NULL,
  `COLLEGE_ID` bigint(20) default NULL,
  `COLLEGE_NAME` varchar(100) default NULL,
  `FIRST_NAME` varchar(50) default NULL,
  `LAST_NAME` varchar(50) default NULL,
  `DATE_OF_BIRTH` date default NULL,
  `MOBILE_NO` varchar(15) default NULL,
  `EMAIL_ID` varchar(50) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `CREATED_DATETIME` datetime default NULL,
  `MODIFIED_DATETIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_student` */

insert  into `st_student`(`ID`,`COLLEGE_ID`,`COLLEGE_NAME`,`FIRST_NAME`,`LAST_NAME`,`DATE_OF_BIRTH`,`MOBILE_NO`,`EMAIL_ID`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATETIME`,`MODIFIED_DATETIME`) values (1,1,'Davv','Yash','Kanoongo','1998-08-22','9001020896','ankit@gmail.com','admin','admin','2021-07-25 14:57:45','2021-07-25 14:57:45'),(2,1,'Medicaps','Tarun','Mandloi','1999-09-22','9001020896','ankit@gmail.com','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-27 17:11:45','2021-11-27 17:11:45'),(3,1,'Davv','Hardik','Goyal','1999-09-22','9001020896','ajay@gmail.com','admin','admin','2021-07-28 05:57:23','2021-07-28 05:57:23'),(4,4,'rpl','Tanu','Kankane','1999-01-11','8796546790','umesh@gmail.com','ankit@gmail.com','ankit@gmail.com','2021-08-19 17:01:46','2021-08-19 17:01:46'),(5,5,'Jawaharlal Nehru University','Vineet','goyal','1999-09-08','8796546790','sawan@gmail.com','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:43:02','2021-11-29 00:43:02'),(6,4,'IIT kharagpur','Kartikh','Aryan','2002-01-11','8796546790','roshan@gmail.com','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:42:23','2021-11-29 00:42:23'),(7,11,'DY Patil  University','Preeti','Sharma','2001-01-11','8796546790','poonam@gmail.com','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:43:43','2021-11-29 00:43:43'),(8,4,'IIT kharagpur','Bharti','Billore','1999-01-15','8796546790','anjali@gmail.com','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:44:13','2021-11-29 00:44:13'),(9,1,'RML Maheshwari','Kapil','malviya','1999-09-22','9001020896','arun@gmail.com','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:44:42','2021-11-29 00:44:42'),(10,2,'SHM Degree College','Gunjan','Saxena','2000-01-13','8796546790','nitu65@gmail.com','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:45:21','2021-11-29 00:45:21'),(11,6,'Govt.Holkar Science','Sachin','Tendulkar','1999-01-22','8796546790','yash34@gmail.com','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:45:56','2021-11-29 00:45:56'),(12,7,'Dr.A.P.J. Abdul Kalam University','Deepak','Karoda','1999-01-22','8796546790','banti@gmail.com','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:46:35','2021-11-29 00:46:35'),(13,4,'IIT kharagpur','Ritik','Malviya','1999-01-22','8796546790','vikash@gmail.com','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:47:05','2021-11-29 00:47:05'),(14,9,'Malwa institute of Technology','Hritik','Rathore','1985-09-10','8796546790','Sagar@gmail.com','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:47:42','2021-11-29 00:47:42'),(15,10,'Astral college','Sheetal','Gurjar','1998-04-09','8796546790','bhupendra@gmail.com','sahu74824@gmail.com','sahu74824@gmail.com','2021-12-13 15:56:56','2021-12-13 15:56:56'),(16,12,'Bherulal Patidar Govt College','Rinku','Chauhan','1983-12-20','9898989898','rinkusharma@gmal.com','bulbul21@gmail.com','bulbul21@gmail.com','2021-12-19 23:53:43','2021-12-19 23:53:43'),(17,9,'Malwa institute of Technology','Pranjal','Jaisawal','1997-01-21','9879879998','pranjal12@gmail.com','bulbul21@gmail.com','bulbul21@gmail.com','2022-01-16 19:16:35','2022-01-16 19:16:35'),(18,9,'Malwa institute of Technology','Payal','Solanki','1997-01-21','9879879999','purvi12@gmail.com','bulbul21@gmail.com','bulbul21@gmail.com','2022-01-16 19:17:24','2022-01-16 19:17:24'),(19,1,'RML Maheshwari','Rinki','sharma','1994-01-06','9898989898','rinki@gmail.com','bulbul21@gmail.com','bulbul21@gmail.com','2022-01-16 19:18:43','2022-01-16 19:18:43');

/*Table structure for table `st_subject` */

DROP TABLE IF EXISTS `st_subject`;

CREATE TABLE `st_subject` (
  `ID` bigint(20) NOT NULL,
  `SUBJECT_NAME` varchar(50) default NULL,
  `DESCRIPTION` varchar(100) default NULL,
  `COURSE_ID` bigint(20) default NULL,
  `COURSE_NAME` varchar(50) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `CREATED_DATETIME` datetime default NULL,
  `MODIFIED_DATETIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_subject` */

insert  into `st_subject`(`ID`,`SUBJECT_NAME`,`DESCRIPTION`,`COURSE_ID`,`COURSE_NAME`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATETIME`,`MODIFIED_DATETIME`) values (2,'Css','ProgramingLanguage',3,'ccssn','admin','admin','2021-08-04 11:10:30','2021-08-04 11:10:30'),(3,'Maths','Algebra',4,'Btech','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-01 11:11:17','2021-09-01 11:11:17'),(4,'Java','Java',3,'corporate Java','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-01 13:13:52','2021-09-01 13:13:52'),(5,'Maths','maths',8,'B.arch','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:14:00','2021-11-29 00:14:00'),(6,'Acount','Acount',2,'B.com','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:14:30','2021-11-29 00:14:30'),(7,'Science','Science',11,'BPharma','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:15:16','2021-11-29 00:15:16'),(9,'core Java','java',3,'corporate Java','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:16:25','2021-11-29 00:16:25'),(10,'Information Technology','It',7,'Computers Commarce','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:16:56','2021-11-29 00:16:56'),(11,'chemistry','chemistry',9,'B.sc','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:35:25','2021-11-29 00:35:25'),(12,'Managerial Economics','comarce',5,'MBA','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:36:32','2021-11-29 00:36:32'),(13,'Statistics','State.',4,'Btech','bulbul21@gmail.com','bulbul21@gmail.com','2021-12-21 16:33:57','2021-12-21 16:33:57'),(14,'Journalism','Press',10,'Mass Communication','bulbul21@gmail.com','bulbul21@gmail.com','2021-12-25 16:32:03','2021-12-25 16:32:03'),(15,'Java','Core',10,'Core','bulbul21@gmail.com','bulbul21@gmail.com','2021-12-25 16:32:47','2021-12-25 16:32:47'),(16,'Spring','Boot',10,'Boot Spring','bulbul21@gmail.com','bulbul21@gmail.com','2021-12-25 16:32:53','2021-12-25 16:32:53'),(17,'Css','programingLang.',3,'Corporate Java','admin','admin','2022-02-23 13:40:17','2022-02-23 13:40:17'),(18,'B.com','Taxation',15,'B.com','rupalichauhan222@gmail.com','rupalichauhan222@gmail.com','2022-03-14 22:36:28','2022-03-14 22:36:28');

/*Table structure for table `st_timetable` */

DROP TABLE IF EXISTS `st_timetable`;

CREATE TABLE `st_timetable` (
  `ID` bigint(20) NOT NULL,
  `COURSE_ID` bigint(20) default NULL,
  `COURSE_NAME` varchar(50) default NULL,
  `SUBJECT_ID` bigint(20) default NULL,
  `SUBJECT_NAME` varchar(50) default NULL,
  `SEMESTER` varchar(50) default NULL,
  `EXAM_DATE` datetime default NULL,
  `EXAM_TIME` varchar(50) default NULL,
  `CREATED_BY` varchar(100) default NULL,
  `MODIFIED_BY` varchar(100) default NULL,
  `CREATED_DATETIME` datetime default NULL,
  `MODIFIED_DATETIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_timetable` */

insert  into `st_timetable`(`ID`,`COURSE_ID`,`COURSE_NAME`,`SUBJECT_ID`,`SUBJECT_NAME`,`SEMESTER`,`EXAM_DATE`,`EXAM_TIME`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATETIME`,`MODIFIED_DATETIME`) values (6,2,'B.com',4,'Java','8th','2021-01-15 00:00:00','08:00 AM to 11:00 AM','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-02 16:22:54','2021-09-02 16:22:54'),(7,2,'B.com',4,'Java','2nd','2021-09-13 00:00:00','12:00 PM to 03:00 PM','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-02 18:14:41','2021-09-02 18:14:41'),(8,3,'corporate Java',2,'css','4th','2021-12-18 00:00:00','12:00 PM to 03:00 PM','sahu74824@gmail.com','sahu74824@gmail.com','2021-09-02 18:45:19','2021-09-02 18:45:19'),(9,4,'Btech',4,'Java','4th','2018-01-01 00:00:00','08:00 AM to 11:00 AM','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 00:12:21','2021-11-28 00:12:21'),(10,2,'B.com',4,'Java','2nd','2022-01-05 00:00:00','04:00 PM to 07:00 PM','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 00:13:44','2021-11-28 00:13:44'),(11,8,'B.arch',2,'css','3rd','2021-12-15 00:00:00','04:00 PM to 07:00 PM','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:37:41','2021-11-29 00:37:41'),(12,5,'MBA',8,'finance','5th','2021-12-31 00:00:00','12:00 PM to 03:00 PM','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:38:06','2021-11-29 00:38:06'),(13,2,'B.com',5,'Maths','1st','2021-12-31 00:00:00','08:00 AM to 11:00 AM','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:38:35','2021-11-29 00:38:35'),(14,11,'BPharma',11,'chemistry','6th','2021-12-31 00:00:00','08:00 AM to 11:00 AM','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:39:00','2021-11-29 00:39:00'),(15,10,'Bds',12,'Managerial Economics','4th','2021-12-31 00:00:00','12:00 PM to 03:00 PM','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:39:33','2021-11-29 00:39:33'),(16,3,'corporate Java',4,'Java','3rd','2021-12-22 00:00:00','12:00 PM to 03:00 PM','sahu74824@gmail.com','sahu74824@gmail.com','2021-11-29 00:40:06','2021-11-29 00:40:06'),(17,3,'corporate Java',4,'Java','4th','2021-12-08 00:00:00','12:00 PM to 03:00 PM','bulbul21@gmail.com','bulbul21@gmail.com','2021-12-19 23:57:20','2021-12-19 23:57:20'),(18,11,'BPharma',13,'CCC','1st','2021-12-20 00:00:00','04:00 PM to 07:00 PM','bulbul21@gmail.com','bulbul21@gmail.com','2021-12-25 16:36:51','2021-12-25 16:36:51'),(19,11,'BPharma',13,'CCC','1st','2021-12-20 00:00:00','04:00 PM to 07:00 PM','bulbul21@gmail.com','bulbul21@gmail.com','2021-12-25 16:37:00','2021-12-25 16:37:00'),(20,11,'BPharma',13,'CCC','1st','2021-12-20 00:00:00','04:00 PM to 07:00 PM','bulbul21@gmail.com','bulbul21@gmail.com','2021-12-25 16:37:56','2021-12-25 16:37:56'),(21,9,'B.sc',10,'Information Technology','4th','2022-01-09 00:00:00','08:00 AM to 11:00 AM','bulbul21@gmail.com','bulbul21@gmail.com','2022-01-16 19:28:42','2022-01-16 19:28:42'),(22,5,'MBA',3,'maths','5','2021-09-22 00:00:00','10 am to 1 pm','admin','admin','2022-02-23 14:15:07','2022-02-23 14:15:07'),(23,5,'MBA',3,'maths','5','2021-09-22 00:00:00','10 am to 1 pm','admin','admin','2022-03-03 00:29:10','2022-03-03 00:29:10');

/*Table structure for table `st_user` */

DROP TABLE IF EXISTS `st_user`;

CREATE TABLE `st_user` (
  `ID` bigint(20) NOT NULL,
  `FIRST_NAME` varchar(50) default NULL,
  `LAST_NAME` varchar(50) default NULL,
  `LOGIN` varchar(50) default NULL,
  `PASSWORD` varchar(20) default NULL,
  `DOB` date default NULL,
  `MOBILE_NO` varchar(20) default NULL,
  `ROLE_ID` bigint(20) default NULL,
  `UNSUCCESSEFUL_LOGIN` int(11) default NULL,
  `GENDER` varchar(10) default NULL,
  `LAST_LOGIN` datetime default NULL,
  `USER_LOCK` varchar(10) default NULL,
  `REGISTERED_IP` varchar(20) default NULL,
  `LAST_LOGIN_IP` varchar(20) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `CREATED_DATETIME` datetime default NULL,
  `MODIFIED_DATETIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_user` */

insert  into `st_user`(`ID`,`FIRST_NAME`,`LAST_NAME`,`LOGIN`,`PASSWORD`,`DOB`,`MOBILE_NO`,`ROLE_ID`,`UNSUCCESSEFUL_LOGIN`,`GENDER`,`LAST_LOGIN`,`USER_LOCK`,`REGISTERED_IP`,`LAST_LOGIN_IP`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATETIME`,`MODIFIED_DATETIME`) values (1,'Admin','Admin','admin@gmail.com','Admin@123','1997-01-31','9826991328',1,5,'Male','2021-08-19 13:52:33','yes',NULL,NULL,'Admin','Admin','2021-08-06 10:41:01','2021-08-06 10:41:01'),(2,'Rupesh','Yadav','rupesh@gmail.com','Rups@1234','1999-10-08','9876542456',1,0,'Male',NULL,'inactive',NULL,NULL,'Admin','sahu74824@gmail.com','2021-12-14 17:40:48','2021-12-14 17:40:48'),(3,'Meghshyam','Pandit','megha@gmail.com','Megha@123','1997-01-07','9111860826',1,0,'Male',NULL,'inactive',NULL,NULL,'ankit@gmail.com','bulbul21@gmail.com','2022-01-11 16:08:08','2022-01-11 16:08:08'),(4,'Roshani','Solanki','roshani@gmail.com','Roshani@123','1997-09-05','9669887176',1,0,'Male',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-10-13 13:39:22','2021-10-13 13:39:22'),(5,'Hardik','Goyal','Hardik@gmail.com','Asdf@123','2021-09-27','9669887176',2,0,'Male',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','bulbul21@gmail.com','2022-01-11 22:33:36','2022-01-11 22:33:36'),(6,'Rahul','Patel','rahul@gmail.com','Asdf@123','2021-09-29','7654098723',3,0,'Male',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-09-06 00:51:58','2021-09-06 00:52:24'),(7,'Aarti','Sharma','aarti@gmail.com','Aarti@321','1991-09-04','7654098723',2,0,'Male',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-09-06 12:10:10','2021-09-06 12:10:20'),(8,'Banti ','Bathoriya','banti@gmail.com','Asdf@123','1996-09-11','9807654324',1,0,'Male',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-09-06 12:14:44','2021-09-06 12:14:44'),(9,'yash','Rathod','yash123@gmail.com','Asdf@123','1996-09-11','9669887176',3,0,'Female',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-09-06 12:16:36','2021-09-06 12:16:36'),(10,'piyush','Chauhan','sahuj74824@gmail.com','Fdsa@123','1998-09-17','9111860826',2,0,'Male',NULL,'inactive',NULL,NULL,'root','root','2021-09-06 12:30:08','2021-09-06 12:30:18'),(11,'Yash','Sahu','Yash@gmail.com','Yash@54321','2021-11-03','9669887176',3,0,'Male',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-08 14:25:20','2021-11-08 14:25:20'),(12,'Priyansh','Patel','priyansh@gmail.com','Priyansh@321','1996-11-14','7654098723',4,0,'Male',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-23 17:00:04','2021-11-23 17:00:04'),(13,'Vikash','Sharma','vikash56@gmail.com','Vikash@123','1997-05-07','8832974059',2,0,'Male',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:30:16','2021-11-28 23:30:16'),(14,'Suraj','Raj','suraj@gmail.com','Suraj@098','1986-07-24','9669887176',4,0,'Male',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:31:26','2021-11-28 23:31:26'),(15,'Niraj','Bhanot','niraj@gmail.com','Niraj@321','1997-08-26','9756894192',3,0,'Male',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:31:47','2021-11-28 23:32:38'),(16,'Pooja','Vyas','pooja@gmail.com','Pooja@321','1995-08-21','9617073519',3,0,'Female',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:34:55','2021-11-28 23:34:55'),(17,'Kamlesh','Dhakad','kamlesh@gmail.com','Kamlesh@321','1994-04-12','9013467298',2,0,'Male',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:40:28','2021-11-28 23:40:28'),(18,'Shivani','Gupta','shivani@gmail.com','Shivani@123','1998-08-19','9111860826',3,0,'Female',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:41:56','2021-11-28 23:41:56'),(19,'Sawan','Solanki','sawan@gmail.com','Sawan@321','1998-08-09','9111860826',2,0,'Male',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:43:32','2021-11-28 23:43:32'),(20,'Sagar','Verma','sagar@gmail.com','Sagar@321','1995-07-25','8832974059',4,0,'Male',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:44:19','2021-11-28 23:44:19'),(21,'Sanjana','Pirag','sanjana@gmail.com','Sanjana@321','2001-04-11','9669887176',3,0,'Female',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:45:43','2021-11-28 23:45:43'),(22,'Anjali','VijayVargiya','anjali@gmail.com','Anjali@321','2000-09-26','9013467298',2,0,'Female',NULL,'inactive',NULL,NULL,'sahu74824@gmail.com','sahu74824@gmail.com','2021-11-28 23:46:34','2021-11-28 23:46:34'),(23,'Rinku','Rajiya','rinku@gmail.com','Rinku@123','1990-06-20','8787878787',1,0,'Male',NULL,'inactive',NULL,NULL,'bulbul21@gmail.com','bulbul21@gmail.com','2021-12-19 23:50:45','2021-12-19 23:51:35'),(24,'Ritik','Malviya','gvhg@gvhg.cg','Rupali@97','1997-07-02','9000000023',2,0,'Male',NULL,'inactive',NULL,NULL,'root','root','2021-12-21 17:44:51','2021-12-21 17:45:02'),(25,'Narendra','Patel','ridam21@gmail.com','Ridam@321','2001-12-26','8765678789',2,0,'Female',NULL,'inactive',NULL,NULL,'root','root','2021-12-26 23:52:23','2021-12-26 23:52:46'),(26,'Shivam','Patel','Dimple21@gmail.com','Dimple@123','1997-01-09','7676767676',2,0,'Female',NULL,'inactive',NULL,NULL,'root','root','2022-01-12 01:18:10','2022-01-12 01:19:54'),(27,'Shikha','Kanoongo','sikha@gmail.com','Sikha@123','1985-02-13','9876767735',1,0,'Female',NULL,'inactive',NULL,NULL,'bulbul21@gmail.com','bulbul21@gmail.com','2022-02-01 15:55:49','2022-02-01 15:56:28'),(28,'Ankit','Gurjar','ankit@gmail.com','Ankit@123','1999-10-08','(Null)',1,5,'male','2022-03-04 23:21:42','yes',NULL,NULL,NULL,NULL,NULL,NULL),(29,'Mayank','Rajpoot','Mayank@gmail.com','Mayank@123','1992-03-03','9856320147',2,0,'Male',NULL,'inactive',NULL,NULL,'root','root','2022-03-04 23:25:27','2022-03-04 23:25:27'),(30,'Tarun','Kanoongo','Tarun@gmail.com','Tarun@123','1992-03-03','9856320147',2,0,'Male',NULL,'inactive',NULL,NULL,'root','root','2022-03-04 23:27:06','2022-03-04 23:27:06'),(31,'Ankit','Loomba','ankit1255553@gmail.com','Ankit@123','1999-10-08','(Null)',1,5,'male','2022-03-05 00:25:28','yes',NULL,NULL,NULL,NULL,NULL,NULL),(32,'Vishu','Lumba','Vishu@gmail.com','Vishu@1234','1992-03-04','9856321470',2,0,'Male',NULL,'inactive',NULL,NULL,'tanu@gmail.com','tanu@gmail.com','2022-03-05 00:51:37','2022-03-05 00:51:37'),(33,'yash','Kanoongo','yashkanoongo493@gmail.com','Yash@1234','1998-03-13','9338848848',1,0,'Male',NULL,'inactive',NULL,NULL,'root','root','2022-03-06 19:52:31','2022-03-06 19:52:31'),(34,'Khushi','Malviya','Kmalviya@gmail.com','Kapil@1234','1998-03-10','9856321740',2,0,'Male',NULL,'inactive',NULL,NULL,'root','root','2022-03-07 17:30:08','2022-03-07 17:30:08'),(35,'Fahim','Ansari','Fahim@gmail.com','Fahim@123','1998-03-13','8759641230',2,0,'Male',NULL,'inactive',NULL,NULL,'root','root','2022-03-07 17:39:40','2022-03-07 17:39:49'),(36,'Nilesh','Gurjar','Nillgurjar@gmail.com','Nilesh@123','1998-03-02','7898656524',2,0,'Male',NULL,'inactive',NULL,NULL,'root','root','2022-03-17 18:17:21','2022-03-17 18:36:17'),(37,'Nilesh','Gayake','Nillgurjar@777gmail.com','Nilesh@123','1990-03-13','6544445455',2,0,'Female',NULL,'inactive',NULL,NULL,'root','root','2022-03-17 18:39:54','2022-03-17 18:42:40'),(38,'Jayant','Meena','Jayant@gmail.com','Jayant@123','1991-03-19','8965230147',2,0,'Male',NULL,'inactive',NULL,NULL,'root','root','2022-03-19 01:37:51','2022-03-19 01:38:42'),(39,'Vishnu','Prasad','Vishulumba@gmail.com','Vishu@1234','1993-03-18','7485963201',2,0,'Male',NULL,'inactive',NULL,NULL,'root','root','2022-03-25 14:24:29','2022-03-25 14:26:09'),(40,'Aaditya','Panndit','Aaditya@gmail.com','AAditya@123','1987-04-09','7896524130',2,0,'Male',NULL,'inactive',NULL,NULL,'root','root','2022-04-05 00:12:22','2022-04-05 00:12:22'),(41,'yash','Kanoongo','Yash1@gmail.com','Yash@123','1988-04-06','9856320147',2,0,'Male',NULL,'inactive',NULL,NULL,'root','root','2022-04-11 23:49:33','2022-04-11 23:49:47'),(42,'Arpit','Sharma','shubh181293@gmail.com','Arpit@123','1987-06-09','9876543210',2,0,'Male',NULL,'inactive',NULL,NULL,'root','root','2022-06-27 06:05:50','2022-06-27 06:06:17'),(43,'Vaibhav','gehlot','vaibhavgehlot2015@gmail.com','K@1968gehlot','2000-08-23','8889375733',2,0,'Male',NULL,'inactive',NULL,NULL,'root','root','2022-06-29 15:24:03','2022-06-29 15:24:03');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
