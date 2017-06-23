-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: stu
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
-- Temporary table structure for view `courseinfo`
--

DROP TABLE IF EXISTS `courseinfo`;
/*!50001 DROP VIEW IF EXISTS `courseinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `courseinfo` AS SELECT 
 1 AS `课程号`,
 1 AS `课程名称`,
 1 AS `先修课`,
 1 AS `学分`,
 1 AS `课余量`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stuinfo`
--

DROP TABLE IF EXISTS `stuinfo`;
/*!50001 DROP VIEW IF EXISTS `stuinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `stuinfo` AS SELECT 
 1 AS `学号`,
 1 AS `姓名`,
 1 AS `性别`,
 1 AS `出生日期`,
 1 AS `联系方式`,
 1 AS `籍贯`,
 1 AS `专业`,
 1 AS `院系`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SC`
--

DROP TABLE IF EXISTS `SC`;
/*!50001 DROP VIEW IF EXISTS `SC`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SC` AS SELECT 
 1 AS `学号`,
 1 AS `姓名`,
 1 AS `课程号`,
 1 AS `课程名称`,
 1 AS `成绩`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `courseinfo`
--

/*!50001 DROP VIEW IF EXISTS `courseinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `courseinfo` AS select `x`.`cno` AS `课程号`,`x`.`cname` AS `课程名称`,`y`.`cname` AS `先修课`,`x`.`ceredit` AS `学分`,`x`.`num` AS `课余量` from (`course` `x` join `course` `y`) where (((`x`.`state` = 1) and (`x`.`cpan` = `y`.`cno`)) or (`x`.`cpan` = NULL)) order by `x`.`cno` */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stuinfo`
--

/*!50001 DROP VIEW IF EXISTS `stuinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stuinfo` AS select `information`.`sno` AS `学号`,`information`.`sname` AS `姓名`,`information`.`sex` AS `性别`,`information`.`birth` AS `出生日期`,`information`.`tel` AS `联系方式`,`information`.`adress` AS `籍贯`,`school`.`pname` AS `专业`,`school`.`dname` AS `院系` from (`information` join `school`) where ((`information`.`pno` = `school`.`pno`) and (`information`.`state` = 1)) order by `information`.`sno` */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SC`
--

/*!50001 DROP VIEW IF EXISTS `SC`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SC` AS select `information`.`sno` AS `学号`,`information`.`sname` AS `姓名`,`course`.`cno` AS `课程号`,`course`.`cname` AS `课程名称`,`score`.`grade` AS `成绩` from ((`course` join `information`) join `score`) where ((`course`.`cno` = `score`.`cno`) and (`information`.`sno` = `score`.`sno`) and (`score`.`state` = '1')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-23 16:52:16
