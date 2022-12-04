/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.9 : Database - project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`project` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `project`;

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_description` varchar(100) DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  `comment_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comments` */

/*Table structure for table `keywords` */

DROP TABLE IF EXISTS `keywords`;

CREATE TABLE `keywords` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) DEFAULT NULL,
  `ranking` varchar(100) DEFAULT NULL,
  `no_of_hits` int(100) DEFAULT NULL,
  PRIMARY KEY (`keyword_id`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=latin1;

/*Data for the table `keywords` */

insert  into `keywords`(`keyword_id`,`keyword`,`ranking`,`no_of_hits`) values (1,'Raatein','10',0),(2,'Raatein','11',0),(3,'Raatein','12',0),(4,'dengi','7',1),(5,'bata\n			Neendo','13',0),(6,'teri','14',0),(7,'hi','15',0),(8,'baat','16',0),(9,'hain\n			Bhoolun','17',0),(10,'kaise','18',0),(11,'tujhe\n			Tu','19',0),(12,'toh','20',0),(13,'khayalo','21',0),(14,'saath','22',0),(15,'hai\n\n			Bekhayali','23',0),(16,'mein','24',0),(17,'bhi','25',0),(18,'tera','26',0),(19,'hi','27',0),(20,'khayaal','28',0),(21,'aaye\n			Kyun','29',0),(22,'bichhadna','30',0),(23,'hai','31',0),(24,'zaroori','32',0),(25,'ye','33',0),(26,'sawaal','34',0),(27,'aaye\n			Teri','35',0),(28,'nazdeekiyon','36',0),(29,'ki','2',20),(30,'khushi','37',0),(31,'behisaab','1',22),(32,'thi','38',0),(33,'','4',3),(34,'','39',0),(35,'Hisse','40',0),(36,'mein','41',0),(37,'faasle','42',0),(38,'bhi','43',0),(39,'tere','44',0),(40,'bemisaal','45',0),(41,'aaye','46',0),(42,'Raatein','47',0),(43,'dengi','48',0),(44,'bata\n			Neendo','49',0),(45,'teri','50',0),(46,'hi','51',0),(47,'baat','52',0),(48,'hain\n			Bhoolun','53',0),(49,'kaise','54',0),(50,'tujhe\n			Tu','55',0),(51,'toh','56',0),(52,'khayalo','57',0),(53,'saath','58',0),(54,'hai\n\n			Bekhayali','59',0),(55,'mein','60',0),(56,'bhi','61',0),(57,'tera','62',0),(58,'hi','63',0),(59,'khayaal','64',0),(60,'aaye\n			Kyun','65',0),(61,'bichhadna','66',0),(62,'hai','67',0),(63,'zaroori','68',0),(64,'ye','69',0),(65,'sawaal','70',0),(66,'aaye\n			Teri','71',0),(67,'nazdeekiyon','72',0),(68,'ki','73',0),(69,'khushi','74',0),(70,'behisaab','75',0),(71,'thi','76',0),(72,'','77',0),(73,'','78',0),(74,'Hisse','79',0),(75,'mein','80',0),(76,'faasle','81',0),(77,'bhi','82',0),(78,'tere','83',0),(79,'bemisaal','84',0),(80,'aaye','85',0),(81,'','86',0),(82,'An','87',0),(83,'Efficient','88',0),(84,'And','89',0),(85,'Privacy-Preserving','90',0),(86,'Semantic','91',0),(87,'Multi-Keyword','92',0),(88,'Ranked','93',0),(89,'Search','94',0),(90,'Over','95',0),(91,'Encrypted','96',0),(92,'Cloud','3',5),(93,'Data','97',0),(94,'H\nii','98',0),(95,'all,india','99',0),(96,'second','100',0),(97,'largest','101',0),(98,'country','102',0),(99,'terms','103',0),(100,'','104',0),(101,'population','5',2),(102,'','105',0),(103,'','106',0),(104,'','107',0),(105,'','108',0),(106,'','109',0),(107,'','110',0),(108,'','111',0),(109,'Advanced','6',2),(110,'Automation','112',0),(111,'Airport','113',0),(112,'Management','114',0),(113,'','115',0),(114,'','116',0),(115,'','117',0),(116,'This','118',0),(117,'project','119',0),(118,'aim','120',0),(119,'develop','121',0),(120,'online','122',0),(121,'application','123',0),(122,'gaming','124',0),(123,'centre','125',0),(124,'facilitate','126',0),(125,'day','127',0),(126,'day','128',0),(127,'work.','129',0),(128,'Currently','130',0),(129,'none','131',0),(130,'gaming','132',0),(131,'centre','133',0),(132,'management','134',0),(133,'website,','135',0),(134,'usual','136',0),(135,'website','137',0),(136,'facilities','138',0),(137,'contact','139',0),(138,'details.','140',0),(139,'Here','141',0),(140,'propose','142',0),(141,'project','143',0),(142,'three','144',0),(143,'kind','145',0),(144,'users','146',0),(145,'access','147',0),(146,'it.','148',0),(147,'The','149',0),(148,'main','150',0),(149,'user','151',0),(150,'administrator,','152',0),(151,'owner','153',0),(152,'centre.','154',0),(153,'He','155',0),(154,'feature','156',0),(155,'like','157',0),(156,'managing','158',0),(157,'(add/edit/delete)','159',0),(158,'facilities','160',0),(159,'available,','161',0),(160,'games','162',0),(161,'currently','163',0),(162,'playing,','164',0),(163,'available','165',0),(164,'playstation','166',0),(165,'book','167',0),(166,'view','168',0),(167,'registered','169',0),(168,'customers','170',0),(169,'upcoming','171',0),(170,'booking,','172',0),(171,'also','173',0),(172,'track','174',0),(173,'payments','175',0),(174,'made','176',0),(175,'list','177',0),(176,'pending','178',0),(177,'payments.','179',0),(178,'The','180',0),(179,'admin','181',0),(180,'register','182',0),(181,'employee','183',0),(182,'manage','184',0),(183,'day','185',0),(184,'day','186',0),(185,'activities','187',0),(186,'gaming','188',0),(187,'centre.','189',0),(188,'Employee','190',0),(189,'view','191',0),(190,'reservations','192',0),(191,'enquiry','193',0),(192,'made','194',0),(193,'customers','195',0),(194,'send','196',0),(195,'reply.','197',0),(196,'The','198',0),(197,'main','199',0),(198,'functionality','200',0),(199,'register','201',0),(200,'offline','202',0),(201,'customers','203',0),(202,'manage','204',0),(203,'timing','205',0),(204,'booking,','206',0),(205,'also','207',0),(206,'collect','208',0),(207,'money','209',0),(208,'them.','210',0),(209,'Admin','211',0),(210,'also','212',0),(211,'functionalities','213',0),(212,'incase','214',0),(213,'absence','215',0),(214,'employee','216',0),(215,'need','217',0),(216,'manage','218',0),(217,'these.','219',0),(218,'Another','220',0),(219,'module','221',0),(220,'customer','222',0),(221,'register','223',0),(222,'online','224',0),(223,'vie','225',0),(224,'facilities,','226',0),(225,'games','227',0),(226,'available,','228',0),(227,'Playstations','229',0),(228,'available.','230',0),(229,'Then','231',0),(230,'proceed','232',0),(231,'prior','233',0),(232,'booking','234',0),(233,'reserve','235',0),(234,'playstation','236',0),(235,'time','237',0),(236,'date.','238',0),(237,'He','239',0),(238,'also','240',0),(239,'make','241',0),(240,'payment','242',0),(241,'online','243',0),(242,'view','244',0),(243,'overall','245',0),(244,'booking','246',0),(245,'made','247',0),(246,'well','248',0),(247,'pending','249',0),(248,'payment','250',0),(249,'him.','251',0),(250,'Overall','252',0),(251,'project','253',0),(252,'bring','254',0),(253,'gaming','255',0),(254,'centre','256',0),(255,'new','257',0),(256,'level.','8',1),(257,'','258',0),(258,'','259',0),(259,'','260',0),(260,'Teachers','9',1),(261,'Helper','261',0),(262,'Cloud-assisted','0',0),(263,'mobile-access','0',0),(264,'health','0',0),(265,'data','0',0),(266,'–','0',0),(267,'Online','0',0),(268,'Consultation','0',0),(269,'And','0',0),(270,'Medical','0',0),(271,'Subscription','0',0),(272,'TABLE','0',0),(273,'OF','0',0),(274,'CONTENTS','0',0);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `usertype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values (40,'admin','admin','admin'),(41,'kil','kil','tutor'),(42,'kkjj','kkjj','user');

/*Table structure for table `material_keyword` */

DROP TABLE IF EXISTS `material_keyword`;

CREATE TABLE `material_keyword` (
  `material_keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(50) DEFAULT NULL,
  `material_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`material_keyword_id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=latin1;

/*Data for the table `material_keyword` */

insert  into `material_keyword`(`material_keyword_id`,`keyword_id`,`material_id`) values (1,3,4),(2,4,4),(3,5,4),(4,6,4),(5,7,4),(6,8,4),(7,9,4),(8,10,4),(9,11,4),(10,12,4),(11,13,4),(12,14,4),(13,15,4),(14,16,4),(15,17,4),(16,18,4),(17,19,4),(18,20,4),(19,21,4),(20,22,4),(21,23,4),(22,24,4),(23,25,4),(24,26,4),(25,27,4),(26,28,4),(27,29,4),(28,30,4),(29,31,4),(30,32,4),(31,33,4),(32,34,4),(33,35,4),(34,36,4),(35,37,4),(36,38,4),(37,39,4),(38,40,4),(39,41,4),(40,42,5),(41,43,5),(42,44,5),(43,45,5),(44,46,5),(45,47,5),(46,48,5),(47,49,5),(48,50,5),(49,51,5),(50,52,5),(51,53,5),(52,54,5),(53,55,5),(54,56,5),(55,57,5),(56,58,5),(57,59,5),(58,60,5),(59,61,5),(60,62,5),(61,63,5),(62,64,5),(63,65,5),(64,66,5),(65,67,5),(66,68,5),(67,69,5),(68,70,5),(69,71,5),(70,72,5),(71,73,5),(72,74,5),(73,75,5),(74,76,5),(75,77,5),(76,78,5),(77,79,5),(78,80,5),(79,81,6),(80,82,9),(81,83,9),(82,84,9),(83,85,9),(84,86,9),(85,87,9),(86,88,9),(87,89,9),(88,90,9),(89,91,9),(90,92,9),(91,93,9),(92,94,10),(93,95,10),(94,96,10),(95,97,10),(96,98,10),(97,99,10),(98,100,10),(99,101,10),(100,102,10),(101,103,12),(102,104,14),(103,105,16),(104,106,17),(105,109,22),(106,110,22),(107,111,22),(108,112,22),(109,113,23),(110,114,23),(111,115,23),(112,116,23),(113,117,23),(114,118,23),(115,119,23),(116,120,23),(117,121,23),(118,122,23),(119,123,23),(120,124,23),(121,125,23),(122,126,23),(123,127,23),(124,128,23),(125,129,23),(126,130,23),(127,131,23),(128,132,23),(129,133,23),(130,134,23),(131,135,23),(132,136,23),(133,137,23),(134,138,23),(135,139,23),(136,140,23),(137,141,23),(138,142,23),(139,143,23),(140,144,23),(141,145,23),(142,146,23),(143,147,23),(144,148,23),(145,149,23),(146,150,23),(147,151,23),(148,152,23),(149,153,23),(150,154,23),(151,155,23),(152,156,23),(153,157,23),(154,158,23),(155,159,23),(156,160,23),(157,161,23),(158,162,23),(159,163,23),(160,164,23),(161,165,23),(162,166,23),(163,167,23),(164,168,23),(165,169,23),(166,170,23),(167,171,23),(168,172,23),(169,173,23),(170,174,23),(171,175,23),(172,176,23),(173,177,23),(174,178,23),(175,179,23),(176,180,23),(177,181,23),(178,182,23),(179,183,23),(180,184,23),(181,185,23),(182,186,23),(183,187,23),(184,188,23),(185,189,23),(186,190,23),(187,191,23),(188,192,23),(189,193,23),(190,194,23),(191,195,23),(192,196,23),(193,197,23),(194,198,23),(195,199,23),(196,200,23),(197,201,23),(198,202,23),(199,203,23),(200,204,23),(201,205,23),(202,206,23),(203,207,23),(204,208,23),(205,209,23),(206,210,23),(207,211,23),(208,212,23),(209,213,23),(210,214,23),(211,215,23),(212,216,23),(213,217,23),(214,218,23),(215,219,23),(216,220,23),(217,221,23),(218,222,23),(219,223,23),(220,224,23),(221,225,23),(222,226,23),(223,227,23),(224,228,23),(225,229,23),(226,230,23),(227,231,23),(228,232,23),(229,233,23),(230,234,23),(231,235,23),(232,236,23),(233,237,23),(234,238,23),(235,239,23),(236,240,23),(237,241,23),(238,242,23),(239,243,23),(240,244,23),(241,245,23),(242,246,23),(243,247,23),(244,248,23),(245,249,23),(246,250,23),(247,251,23),(248,252,23),(249,253,23),(250,254,23),(251,255,23),(252,256,23),(253,259,25),(254,260,27),(255,261,27),(256,262,28),(257,263,28),(258,264,28),(259,265,28),(260,266,28),(261,267,28),(262,268,28),(263,269,28),(264,270,28),(265,271,28),(266,272,29),(267,273,29),(268,274,29);

/*Table structure for table `materials` */

DROP TABLE IF EXISTS `materials`;

CREATE TABLE `materials` (
  `material_id` int(11) NOT NULL AUTO_INCREMENT,
  `tutor_id` int(50) DEFAULT NULL,
  `subject_id` int(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `file_path` varchar(1000) DEFAULT NULL,
  `uploaded_date` varchar(100) DEFAULT NULL,
  `no_of_downloads` varchar(100) DEFAULT NULL,
  `key` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `materials` */

insert  into `materials`(`material_id`,`tutor_id`,`subject_id`,`title`,`file_path`,`uploaded_date`,`no_of_downloads`,`key`) values (1,4,1,'3+ year experienced android developer','static/images/11f17961-f918-45fd-a9da-19eb3fae21ef20200121_082056.jpg','2020-02-11','none',NULL),(2,4,6,'q','static/images/ea5b83cc-b7d8-4bdd-ad9b-23c8207006e1dekhayaali.txt','2020-02-12','none',NULL),(3,4,10,'aaa','static/images/8ccb7851-5205-45a0-a44e-aaac3c2711f1dekhayaali.txt','2020-02-12','none',NULL),(4,4,6,'aaa','static/images/f1c805ff-b3b0-4d09-8008-53a1b4403cb2dekhayaali.txt','2020-02-12','1',NULL),(5,4,6,'q','static/images/aa3a5e8b-6a1b-479b-9e53-7bc46f82fe71dekhayaali.txt','2020-02-12','none',NULL),(6,4,6,'qwq','static/images/adae3b3d-e463-4de4-a0b3-94c686c35fedResume.pdf','2020-02-12','none',NULL),(7,4,6,'q','static/images/0a550846-c603-4d11-9e73-a0ee5acca541An Efficient And Privacy-Preserving Semantic Multi','2020-02-12','none',NULL),(8,4,6,'q','static/images/caf96585-236e-4fea-975a-67026f63a3aeAn Efficient And Privacy-Preserving Semantic Multi','2020-02-12','none',NULL),(9,4,6,'q','static/images/44e007a4-7d6e-4165-a84c-0498e79010fcAn Efficient And Privacy-Preserving Semantic Multi','2020-02-12','none',NULL),(10,4,10,'q','static/images/0f8bd76d-cc41-4aee-8f74-271198b48656hi.pdf','2020-02-12','none',NULL),(11,4,6,'ddddd','static/images/0e86d979-9e2d-45de-9b93-3c712ea15da720200121_082425.jpg','2020-02-19','none',NULL),(12,4,6,'ddddd','static/images/3e929378-d895-4a1d-9c09-53fba9b51373commoncopy.pdf','2020-02-19','none',NULL),(13,15,6,'q','static/images/4c032387-0024-46cd-9816-06189634b0cdkavitha.pdf','2020-02-25','none',NULL),(14,15,6,'q','static/images/007f913d-4764-4994-8b94-41cd743ac809commoncopy.pdf','2020-02-25','none',NULL),(15,7,1,'wefwe','L63dIMdnX7B5dF+jm/U+Y4ki3ZcNjkhH9rchez5aTcB+1dcl738RahATmkOy5jNwYx38jgJECBPZzc6nyZlnyGf5kp0WkbtylAc1','2020-02-27','none',NULL),(16,7,10,'dsf','va5Av3eWle7/Vs/VNQ0QhhMkzGfLMHV6EUm9TBLemOJBrcKNlRlmo9SOvZqveUVnQ0ow8X2EuMs2ixFOBN1GwrcgINHKPX/7f0QR','2020-02-27','none',NULL),(17,9,6,'sdfg','static/uploads/96809d01-5fb2-4783-9c5b-40e2bd2fd09f.jpg','2020-03-08','none',NULL),(18,9,1,'kj','static/uploads/1c9ba78e-00d2-44dd-8a66-dfe15b24296f.PNG','2020-03-08','none','3PW2G8KN48KQIU0I'),(19,9,1,'ui','static/uploads/bda06bd4-24dd-42a2-b8b3-8d30ccbe92d8.PNG','2020-03-08','none','ACFBIO7FDPRSTPR8'),(20,9,1,'kj','static/uploads/88bdcb7d-23aa-4394-ab19-f3349a765958.docx','2020-03-08','none','F1Q17CC5718AOENB'),(21,9,6,'lxkjvhc','static/uploads/4d5a6741-70c1-468d-98bf-ad4b3b699118.docx','2020-03-08','none','JUOVCCM4GX30YCGG'),(22,9,1,'sdfg','static/uploads/d32d2be5-8637-4d0c-bc04-ca9b2e19549b.docx','2020-03-08','none','OT6QJOE79S8VCME5'),(23,6,6,'rrtyfgu','static/uploads/e16375ae-f16f-4910-9915-0a7945173e45.docx','2020-03-21','none','VSX7CDFLWLE672SM'),(24,16,6,'kedf','static/uploads/569a4bd6-85e5-41ed-ba48-ec28d333ff9c.PNG','2020-05-11','none','ML4ED8VAHOM7ILC4'),(25,16,10,'hi','static/images/733e9be9-b2c7-4112-b571-2999f004c33fasw.jpg','2020-05-11','none','SU7V04CX90IEPDUE'),(26,16,10,'nk','static/images/116c010f-c9df-4ee4-9a27-36e9c54de3c0Generating Lecture note.docx','2020-05-11','none','8PONYEJX20B18J99'),(27,16,6,'kjh','static/images/d78d9d79-f375-413b-a137-17efe0999a6aTeachers Helper - Modules and Tables.docx','2020-05-11','none','UCSKF9QUQ3VLBB1R'),(28,16,10,'uysdg','static/images/5503bbcb-5e8c-4965-87af-c7a7c5a2fdbfCloud-assisted mobile-access of health data – Online Consultation And Medical Subscription - Modules and Tables.docx','2020-06-08','none','IWFWV3I6QZJGX8MR'),(29,16,6,'kj','static/images/af1209f9-dc70-4229-8a48-c8f0d7173f1dPROJECT-TABLE OF CONTENTS.docx','2020-06-08','none','GEXUZ0BVV1CDEAAA');

/*Table structure for table `reviews` */

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) DEFAULT NULL,
  `review_description` varchar(100) DEFAULT NULL,
  `review_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `reviews` */

insert  into `reviews`(`review_id`,`user_id`,`review_description`,`review_date`) values (1,4,'a','2020-02-12'),(2,8,'good','2020-02-19'),(3,9,'Nice','2020-02-19');

/*Table structure for table `searchhistory` */

DROP TABLE IF EXISTS `searchhistory`;

CREATE TABLE `searchhistory` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `search_word` varchar(100) DEFAULT NULL,
  `search_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `searchhistory` */

/*Table structure for table `subjects` */

DROP TABLE IF EXISTS `subjects`;

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_title` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `subjects` */

insert  into `subjects`(`subject_id`,`subject_title`,`description`) values (1,'english','Official language'),(6,'Malayalam','Mother tongue'),(10,'Hindi','Rashtra baasha'),(16,'STORY','nnn mmm hhhh  hhh  yyy  tttt');

/*Table structure for table `tutors` */

DROP TABLE IF EXISTS `tutors`;

CREATE TABLE `tutors` (
  `tutor_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tutor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `tutors` */

insert  into `tutors`(`tutor_id`,`login_id`,`first_name`,`last_name`,`qualification`,`phone`,`email`) values (1,6,'safreena','shakeer','Degree','9388334442','safreenashakeer123@gmail.com'),(4,9,'sarun ','joy','BCA','9876543217','sarunjoy555@gmail.com'),(6,11,'manju','varma','P G','8976542321','manjuvarma@gmail.com'),(7,12,'Alan','Robert','PhD','8654321674','AlenRobert@gmail.com'),(9,14,'stark','s v','PhD','876543217','starksv@gmail.com'),(10,18,'Sreekanth','N H','Graduate','8976543219','sreekanth123@gmail.com'),(12,21,'wed','w','wq','345678912','safreenashakeer123@gmail.com'),(13,22,'abc','s','sdf','123456789','safreenashakeer@gmail.com'),(14,23,'wewsf','wdse','wde1','1234567812','sruthi@gmail.com'),(15,25,'Stephen','W.H','Msc','9876576548','stephen987@gmail.com'),(16,41,'fdg','hgdf','uyghf','8778765678','jhbv@dfe.v');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`login_id`,`first_name`,`last_name`,`gender`,`phone`,`email`) values (1,1,'meera','varghese','female','98765432107','meera@gmail.com'),(2,3,'safreena','shakeer','female','98765432198','safreenashakeer@gmail.com'),(4,5,'sruthy ','P S','female','9744988228','sruthyswathi@gmail.com'),(5,15,'shellu','Antony','female','8765432198','shellu123@gmail.com'),(6,16,'shellu','Antony','female','8765432198','shellu123@gmail.com'),(7,17,'shellu','Antony','female','8765432198','shellu123@gmail.com'),(8,19,'vishnu','vinod','male','9876546598','vishnuvinod@gmail.com'),(9,24,'Arun','Thomas','male','87658453672','ArunThomas@gmail.com'),(10,26,'John','james2','male','7654897546','johnjames@gmail.com'),(12,30,'s','s','female','567864','d@j.v'),(13,36,'h4','h','female','9999999999','ggh@gmail.com'),(14,37,'h4','h','female','9999999999','ggh@gmail.com'),(15,38,'t6','h','male','0987654325','kavitha@gmail.com'),(21,39,'Amal','Antony','male','9876574536','AmalAnonty@gmail.com'),(22,42,'jh','hj','female','8765677655','bjhv@efg.dgf');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
