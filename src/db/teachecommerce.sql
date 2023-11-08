CREATE DATABASE  IF NOT EXISTS `teachecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `teachecommerce`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: teachecommerce
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `id_administrador` int NOT NULL AUTO_INCREMENT,
  `vnombre` varchar(60) NOT NULL,
  `vapellido` varchar(60) NOT NULL,
  `vemail` varchar(255) NOT NULL,
  `vpassword` varchar(100) NOT NULL,
  `bhabilitado` tinyint DEFAULT '1',
  PRIMARY KEY (`id_administrador`),
  UNIQUE KEY `pk_id_administrador` (`id_administrador`),
  UNIQUE KEY `vemail_UNIQUE` (`vemail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'Mariano','Mayo','mariano@gmail.com','12345678',1);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `vmarca` varchar(45) DEFAULT NULL,
  `bhabilitado` tinyint NOT NULL DEFAULT '1',
  `vdescripcion` mediumtext,
  `vpath` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_marca`),
  UNIQUE KEY `pk_id_marca` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Apple',1,'Apple, Inc. es una empresa tecnológica multinacional estadounidense con sede en Cupertino, California. Apple es la empresa de tecnología más grande del mundo por ingresos, con US$394,3 mil millones de dólares en ingresos en 2022.','/assets/marcas/apple.jpg'),(2,'Msi',1,'Como marca de juegos líder mundial, MSI es el nombre más confiable en juegos y deportes electrónicos. Han dedicado innumerables horas y numerosos recursos a la comunidad de deportes electrónicos para apoyar a los jugadores más aspirantes del mundo y aprovechar su experiencia en juegos para optimizar el diseño de nuestros productos.','/assets/marcas/msi.png'),(3,'Logitech',1,'Una empresa suiza centrada en la innovación y la calidad, Logitech diseña productos y experiencias que tienen un lugar cotidiano en la vida de las personas. Durante más de 40 años, han expandido tanto su experiencia en diseño de productos como su alcance global.','/assets/marcas/gigabyte.png'),(4,'Dell',1,'Son un equipo diverso con perspectivas únicas.Impulsado por la ambición y el poder de la tecnología para fomentar el progreso humano. Inquebrantable en el compromiso con la igualdad, la confianza y el apoyo mutuos.','/assets/marcas/dell.png');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `vnombre` varchar(150) NOT NULL,
  `tdescripcion` mediumtext NOT NULL,
  `fprecio` float NOT NULL DEFAULT '0',
  `tscreado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nusuariocreador` int NOT NULL,
  `id_marca` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `id_producto_UNIQUE` (`id_producto`),
  KEY `fk_producto_administrador_idx` (`nusuariocreador`),
  KEY `fk_producto_marca_idx` (`id_marca`),
  CONSTRAINT `fk_producto_administrador` FOREIGN KEY (`nusuariocreador`) REFERENCES `administrador` (`id_administrador`),
  CONSTRAINT `fk_producto_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'prueba actualizacion','celular descripcion actualiza',555.51,'2023-10-28 22:36:47',1,3),(2,'Notebook Numero 2 enviada desde postman','descripcion numero 2  enviada desde postman mediante post',4532.25,'2023-10-28 22:38:52',1,2),(3,'Notebook Numero 3 enviada desde postman','Actualizo la descripcion de la notebook numero 3 desde postman, actualizo precio',36520,'2023-10-28 22:39:48',1,3),(4,'celular','celular descripcion',69585.5,'2023-11-02 20:02:26',1,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_producto`
--

DROP TABLE IF EXISTS `view_producto`;
/*!50001 DROP VIEW IF EXISTS `view_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_producto` AS SELECT 
 1 AS `id_producto`,
 1 AS `vnombre`,
 1 AS `tdescripcion`,
 1 AS `fprecio`,
 1 AS `tscreado`,
 1 AS `dfechacreacion`,
 1 AS `nusuariocreador`,
 1 AS `vadministrador`,
 1 AS `id_marca`,
 1 AS `vmarca`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'teachecommerce'
--

--
-- Dumping routines for database 'teachecommerce'
--
/*!50003 DROP FUNCTION IF EXISTS `formatear_apellido_nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `formatear_apellido_nombre`(vapellido VARCHAR(255), vnombre VARCHAR(255)) RETURNS varchar(512) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN CONCAT(vnombre, ', ', vapellido);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `formatear_timestamp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `formatear_timestamp`(ts TIMESTAMP) RETURNS varchar(16) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE formatted_date VARCHAR(16);

    SET formatted_date = DATE_FORMAT(ts, '%d/%m/%Y %H:%i');

    RETURN formatted_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_producto`
--

/*!50001 DROP VIEW IF EXISTS `view_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_producto` AS select `p`.`id_producto` AS `id_producto`,`p`.`vnombre` AS `vnombre`,`p`.`tdescripcion` AS `tdescripcion`,`p`.`fprecio` AS `fprecio`,`p`.`tscreado` AS `tscreado`,`formatear_timestamp`(`p`.`tscreado`) AS `dfechacreacion`,`p`.`nusuariocreador` AS `nusuariocreador`,`formatear_apellido_nombre`(`a`.`vapellido`,`a`.`vnombre`) AS `vadministrador`,`p`.`id_marca` AS `id_marca`,`m`.`vmarca` AS `vmarca` from ((`producto` `p` join `marca` `m` on((`p`.`id_marca` = `m`.`id_marca`))) join `administrador` `a` on((`p`.`nusuariocreador` = `a`.`id_administrador`))) */;
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

-- Dump completed on 2023-11-08 19:22:35
