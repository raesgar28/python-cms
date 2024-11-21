-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bucketlist
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_likes`
--

DROP TABLE IF EXISTS `tbl_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_likes` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `wish_id` int NOT NULL,
  `user_id` int NOT NULL,
  `wish_like` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`like_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_likes`
--

LOCK TABLES `tbl_likes` WRITE;
/*!40000 ALTER TABLE `tbl_likes` DISABLE KEYS */;
INSERT INTO `tbl_likes` VALUES (30,3,10,1),(31,5,10,2),(32,6,10,3),(33,24,10,0),(34,7,10,1),(35,8,10,1);
/*!40000 ALTER TABLE `tbl_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `user_username` varchar(100) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'pepe','pepe','*****'),(2,'44r','r4r4','4r4r'),(3,'r','r','scrypt:32768:8:1$5JVAe5fzYbpbfqKs$88d0fd71fab6f977cbca88f4f3dde161a9d29d4220d6a93f50e1724aa03b2d1a3ffa901ff156fbbb014e96cfd8f32b81c3a76c97c859aa6bcafe3e6f7e0cd469'),(4,'fr','fr','scrypt:32768:8:1$SeK1vi5HpAiOMg8U$f88641da775d8f5351bc849d8df5d196e52a08a0873c0be4e0ace9ddff9d01b398fc40a28741cefd1f2caff9cf287b5026fdc0137463ad0a7818361849e62952'),(5,'4e','4e3','scrypt:32768:8:1$PZ3l1gxgkDlVek8U$8e88cc374fd1ec33d95d0faefd7016761bfdfc86b5d6fbe835f8c35b26e59494fdf61f709e6dc81cbadcaa7c1d70b761abd7dadcd252de993b5a9462f55a914d'),(10,'a','a@a.com','scrypt:32768:8:1$AjN6SWNbZWOehvJ7$88a095cf0796d62f196d79d0359cafa08dd8ccefcefac6dd62c45dcb9eaa3fd50ae957e49000918a0c7d7820328f8c833a6f3d85a2a9c08a24863b7841763d98'),(11,'b','b@b.com','scrypt:32768:8:1$Rvna78TifWJ2x6zZ$4ca42a3543e451621bfec7a86554a378b5660581abbad015dc9c2c03a85952ee50c086e2e7740bd872adb8a555f8c3c293718cecff9342b6fc2c01d88a10aa4d'),(16,'dd','g@g.comk','scrypt:32768:8:1$FvCd2vj3WeU8eiHp$b4ba14d1456a74319965c1992a4e3610fdb91c21e11691d203abd4c3b020fb89079c52c6da564531ab1153543ac590c40ff5aed653ae38ffc1029f49e177fbff'),(23,'ed','ed','scrypt:32768:8:1$KsSEJnvBw4naeEgY$1784e1417370dd71c51dbede32fa0fcc6c506e581b3f1adbf7c71d525510edcdeb0921efd8dcb8dff5fe64a7881c12eb637a96425b2bf6ab832dbf70f85f7dcc'),(31,'ded','de','scrypt:32768:8:1$7vK3iyQkQ5JC5jKr$b3c018989f48c0caae33a08770438a6b17e4eb2c16cfc4dae8421863f6f8a90b31ccb1a00ed94fd6c1721590704c2380cb2280c4a3d088bcd06db9f99e7b047c'),(32,'wre4','rte','scrypt:32768:8:1$udnm4v6nTWxy04KU$306a11afdae49ef88367ece4efff39f5a817b0a3fb87104c39c42bc8ab9baf8beddafe1a42b99d6987bd4b93d3904f3351cc3c334410e456a3c2464f1265d836');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wish`
--

DROP TABLE IF EXISTS `tbl_wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_wish` (
  `wish_id` int NOT NULL AUTO_INCREMENT,
  `wish_title` varchar(45) DEFAULT NULL,
  `wish_description` varchar(5000) DEFAULT NULL,
  `wish_user_id` int DEFAULT NULL,
  `wish_date` datetime DEFAULT NULL,
  `wish_file_path` varchar(200) DEFAULT NULL,
  `wish_accomplished` int DEFAULT '0',
  `wish_private` int DEFAULT '0',
  PRIMARY KEY (`wish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wish`
--

LOCK TABLES `tbl_wish` WRITE;
/*!40000 ALTER TABLE `tbl_wish` DISABLE KEYS */;
INSERT INTO `tbl_wish` VALUES (3,'Hola2','Hola post2',10,'2024-11-05 10:24:06','static/Uploads/67d7bdb3-fb84-4c2c-a903-28bd53ce834d.jpg',0,0),(5,'4','4',10,'2024-11-06 09:57:26','static/Uploads/67d7bdb3-fb84-4c2c-a903-28bd53ce834d.jpg',0,0),(6,'fff','fff',10,'2024-11-06 09:57:26','static/Uploads/67d7bdb3-fb84-4c2c-a903-28bd53ce834d.jpg',0,0),(7,'EL cuatro','Cuiatro',10,'2024-11-08 07:21:20','static/Uploads/67d7bdb3-fb84-4c2c-a903-28bd53ce834d.jpg',0,0),(8,'ededed','deed',10,'2024-11-08 09:04:39','static/Uploads/67d7bdb3-fb84-4c2c-a903-28bd53ce834d.jpg',0,0),(9,'rtvvrr','crc',10,'2024-11-08 09:04:42','static/Uploads/67d7bdb3-fb84-4c2c-a903-28bd53ce834d.jpg',0,0),(10,'rcrfcrc','xcrcrc',10,'2024-11-08 09:04:47','static/Uploads/67d7bdb3-fb84-4c2c-a903-28bd53ce834d.jpg',0,0),(11,'cr4r4r4','ddfcrrf',10,'2024-11-08 09:04:51','static/Uploads/67d7bdb3-fb84-4c2c-a903-28bd53ce834d.jpg',0,0),(12,'rrcrr4cedde','eceeed',10,'2024-11-08 09:04:58','static/Uploads/67d7bdb3-fb84-4c2c-a903-28bd53ce834d.jpg',0,0),(13,'redcr','rcrcrc',10,'2024-11-08 09:05:25','static/Uploads/67d7bdb3-fb84-4c2c-a903-28bd53ce834d.jpg',0,0),(14,'44e4ddrededde','edded',10,'2024-11-08 09:05:34','static/Uploads/67d7bdb3-fb84-4c2c-a903-28bd53ce834d.jpg',0,0),(15,'erdderd','ededed',10,'2024-11-08 09:05:43','static/Uploads/67d7bdb3-fb84-4c2c-a903-28bd53ce834d.jpg',0,0),(16,'dedeed','eeded',10,'2024-11-08 09:06:14',NULL,0,0),(17,'444d','rxrdr',10,'2024-11-08 09:06:20',NULL,0,0),(18,'eeeee','eeeee',10,'2024-11-08 13:32:53',NULL,0,0),(19,'Ultima previuo a upload','Pos eso',10,'2024-11-08 13:33:16',NULL,0,0),(20,'Con imagen23355','Dale23355',10,'2024-11-11 09:49:42','static/Uploads/67d7bdb3-fb84-4c2c-a903-28bd53ce834d.jpg',1,1),(23,'222','22',10,'2024-11-11 11:15:25','static/Uploads/d753f9b6-a144-4263-a3d7-3671db0f848e.jpg',0,0),(24,'t','tgt',10,'2024-11-13 12:26:46','',0,0);
/*!40000 ALTER TABLE `tbl_wish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bucketlist'
--

--
-- Dumping routines for database 'bucketlist'
--
/*!50003 DROP FUNCTION IF EXISTS `getSum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getSum`(

    p_wish_id int(11)

) RETURNS int
BEGIN

	select sum(wish_like) into @sm from tbl_likes where wish_id = p_wish_id;

RETURN @sm;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `hasLiked` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `hasLiked`(

    p_wish int,

	p_user int

) RETURNS int
BEGIN

	

	select wish_like into @myval from tbl_likes where wish_id =  p_wish and user_id = p_user;

RETURN @myval;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AddUpdateLikes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AddUpdateLikes`(

    p_wish_id int,

	p_user_id int,

	p_like int

)
BEGIN

	

	if (select exists (select 1 from tbl_likes where wish_id = p_wish_id and user_id = p_user_id)) then

		

		select wish_like into @currentVal from tbl_likes where wish_id = p_wish_id and user_id = p_user_id;

		

		if @currentVal = 0 then

			update tbl_likes set wish_like = 1 where wish_id = p_wish_id and user_id = p_user_id;

		else

			update tbl_likes set wish_like = 0 where wish_id = p_wish_id and user_id = p_user_id;

		end if;

		

	else

		

		insert into tbl_likes(

			wish_id,

			user_id,

			wish_like

		)

		values(

			p_wish_id,

			p_user_id,

			p_like

		);

	end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_addWish` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addWish`(
	IN p_title varchar(45),

	IN p_description varchar(1000),

	IN p_user_id bigint,

	IN p_file_path varchar(200),

	IN p_is_private int,

	IN p_is_done int

)
BEGIN

	insert into tbl_wish(

		wish_title,

		wish_description,

		wish_user_id,

		wish_date,

		wish_file_path,

		wish_private,

		wish_accomplished

	)

	values

	(
		p_title,

		p_description,

		p_user_id,

		NOW(),

		p_file_path,

		p_is_private,

		p_is_done

	);
    
	SET @last_id = LAST_INSERT_ID();

	insert into tbl_likes(

		wish_id,

		user_id,

		wish_like

	)

	values(

		@last_id,

		p_user_id,

		0

	);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_createUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createUser`(

    IN p_name VARCHAR(100),

  IN p_username VARCHAR(100),

	IN p_password VARCHAR(255)

)
BEGIN

	if ( select exists (select 1 from tbl_user where user_username = p_username) ) THEN

	

		select 'Username Exists !!';

	

	ELSE

	

		insert into tbl_user

		(

			user_name,

			user_username,

			user_password

		)

		values

		(

			p_name,

			p_username,

			p_password

		);

	

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteWish` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteWish`(

IN p_wish_id bigint,

IN p_user_id bigint

)
BEGIN

delete from tbl_wish where wish_id = p_wish_id and wish_user_id = p_user_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetAllWishes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAllWishes`(

    p_user int

)
BEGIN

	select wish_id,wish_title,wish_description,wish_file_path,getSum(wish_id),hasLiked(wish_id,p_user)

	from tbl_wish where wish_private = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getLikeStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getLikeStatus`(

    IN p_wish_id int,

	IN p_user_id int

)
BEGIN

	select getSum(p_wish_id),hasLiked(p_wish_id,p_user_id);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetWishById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetWishById`(

IN p_wish_id bigint,

In p_user_id bigint

)
BEGIN

select wish_id,wish_title,wish_description,wish_file_path,wish_private,wish_accomplished from tbl_wish where wish_id = p_wish_id and wish_user_id = p_user_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetWishByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetWishByUser`(

IN p_user_id bigint,
IN p_limit int,
IN p_offset int,
out p_total bigint



)
BEGIN

   
    
    	select count(*) into p_total from tbl_wish where wish_user_id = p_user_id;

	SET @t1 = CONCAT( 'select * from tbl_wish where wish_user_id = ', p_user_id, ' order by wish_date desc limit ',p_limit,' offset ',p_offset);

	PREPARE stmt FROM @t1;

	EXECUTE stmt;

	DEALLOCATE PREPARE stmt;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateWish` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateWish`(

IN p_title varchar(45),

IN p_description varchar(1000),

IN p_wish_id bigint,

In p_user_id bigint,

IN p_file_path varchar(200),

IN p_is_private int,

IN p_is_done int

)
BEGIN

update tbl_wish set 

    wish_title = p_title,

	wish_description = p_description,

	wish_file_path = p_file_path,

	wish_private = p_is_private,

	wish_accomplished = p_is_done

	where wish_id = p_wish_id and wish_user_id = p_user_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_validateLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validateLogin`(

IN p_username VARCHAR(100)

)
BEGIN

    select * from tbl_user where user_username = p_username;

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

-- Dump completed on 2024-11-20 10:06:39
