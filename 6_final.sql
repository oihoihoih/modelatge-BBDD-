CREATE DATABASE  IF NOT EXISTS `CuldAmpolla` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `CuldAmpolla`;
-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: CuldAmpolla
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `mail` varchar(60) DEFAULT NULL,
  `fechaReg` datetime DEFAULT NULL,
  `recomendadoPor` varchar(45) DEFAULT NULL,
  `Dirección_id_Dirección` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `id_cliente_UNIQUE` (`id_cliente`),
  KEY `fk_Cliente_Dirección1_idx` (`Dirección_id_Dirección`),
  CONSTRAINT `fk_Cliente_Dirección1` FOREIGN KEY (`Dirección_id_Dirección`) REFERENCES `Dirección` (`id_Dirección`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (1,'pepito','palillos perez','pepito@gmail.com','2020-05-12 00:00:00','juanito',1);
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dirección`
--

DROP TABLE IF EXISTS `Dirección`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dirección` (
  `id_Dirección` int(11) NOT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `núm` int(11) DEFAULT NULL,
  `piso` int(11) DEFAULT NULL,
  `puerta` varchar(3) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `país` varchar(45) DEFAULT NULL,
  `tfn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Dirección`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dirección`
--

LOCK TABLES `Dirección` WRITE;
/*!40000 ALTER TABLE `Dirección` DISABLE KEYS */;
INSERT INTO `Dirección` VALUES (1,'clot',248,3,'A','barcelona',8002,'españa',583940534),(2,'mayor',34,NULL,NULL,'barcelona',8334,'españa',834299475);
/*!40000 ALTER TABLE `Dirección` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleado`
--

DROP TABLE IF EXISTS `Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleado` (
  `id_Empleado` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleado`
--

LOCK TABLES `Empleado` WRITE;
/*!40000 ALTER TABLE `Empleado` DISABLE KEYS */;
INSERT INTO `Empleado` VALUES (1,'juan','marcilla');
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gafas`
--

DROP TABLE IF EXISTS `Gafas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gafas` (
  `id_Gafas` int(11) NOT NULL,
  `gradV1` decimal(3,2) DEFAULT NULL,
  `gradV2` decimal(3,2) DEFAULT NULL,
  `tipoMontura` set('flotant','pasta','metálica') DEFAULT NULL,
  `color montura` varchar(45) DEFAULT NULL,
  `colorV1` varchar(45) DEFAULT NULL,
  `colorV2` varchar(45) DEFAULT NULL,
  `preu` decimal(5,2) NOT NULL,
  `Proveedor_id_Proveedor` int(11) NOT NULL,
  `Marca_id_Marca` int(11) NOT NULL,
  `Venta_id_Venta` int(11) NOT NULL,
  PRIMARY KEY (`id_Gafas`),
  KEY `fk_Gafas_Proveedor_idx` (`Proveedor_id_Proveedor`),
  KEY `fk_Gafas_Marca1_idx` (`Marca_id_Marca`),
  KEY `fk_Gafas_Venta1_idx` (`Venta_id_Venta`),
  CONSTRAINT `fk_Gafas_Marca1` FOREIGN KEY (`Marca_id_Marca`) REFERENCES `Marca` (`id_Marca`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Gafas_Proveedor` FOREIGN KEY (`Proveedor_id_Proveedor`) REFERENCES `Proveedor` (`id_Proveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Gafas_Venta1` FOREIGN KEY (`Venta_id_Venta`) REFERENCES `Venta` (`id_Venta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gafas`
--

LOCK TABLES `Gafas` WRITE;
/*!40000 ALTER TABLE `Gafas` DISABLE KEYS */;
INSERT INTO `Gafas` VALUES (1,2.00,2.50,'pasta','rojo','verde','verde',38.45,1,1,1);
/*!40000 ALTER TABLE `Gafas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marca`
--

DROP TABLE IF EXISTS `Marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Marca` (
  `id_Marca` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `Proveedor_id_Proveedor` int(11) NOT NULL,
  PRIMARY KEY (`id_Marca`),
  KEY `fk_Marca_Proveedor1_idx` (`Proveedor_id_Proveedor`),
  CONSTRAINT `fk_Marca_Proveedor1` FOREIGN KEY (`Proveedor_id_Proveedor`) REFERENCES `Proveedor` (`id_Proveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marca`
--

LOCK TABLES `Marca` WRITE;
/*!40000 ALTER TABLE `Marca` DISABLE KEYS */;
INSERT INTO `Marca` VALUES (1,'rayban',1);
/*!40000 ALTER TABLE `Marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedor`
--

DROP TABLE IF EXISTS `Proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedor` (
  `id_Proveedor` int(11) NOT NULL,
  `nif` varchar(9) DEFAULT NULL,
  `fax` int(11) DEFAULT NULL,
  `Dirección_id_Dirección` int(11) NOT NULL,
  PRIMARY KEY (`id_Proveedor`),
  KEY `fk_Proveedor_Dirección1_idx` (`Dirección_id_Dirección`),
  CONSTRAINT `fk_Proveedor_Dirección1` FOREIGN KEY (`Dirección_id_Dirección`) REFERENCES `Dirección` (`id_Dirección`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedor`
--

LOCK TABLES `Proveedor` WRITE;
/*!40000 ALTER TABLE `Proveedor` DISABLE KEYS */;
INSERT INTO `Proveedor` VALUES (1,'72947204c',943827459,2);
/*!40000 ALTER TABLE `Proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Venta`
--

DROP TABLE IF EXISTS `Venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Venta` (
  `id_Venta` int(11) NOT NULL,
  `Cliente_id_cliente` int(11) NOT NULL,
  `Empleado_id_Empleado` int(11) NOT NULL,
  PRIMARY KEY (`id_Venta`),
  KEY `fk_Venta_Cliente1_idx` (`Cliente_id_cliente`),
  KEY `fk_Venta_Empleado1_idx` (`Empleado_id_Empleado`),
  CONSTRAINT `fk_Venta_Cliente1` FOREIGN KEY (`Cliente_id_cliente`) REFERENCES `Cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Venta_Empleado1` FOREIGN KEY (`Empleado_id_Empleado`) REFERENCES `Empleado` (`id_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Venta`
--

LOCK TABLES `Venta` WRITE;
/*!40000 ALTER TABLE `Venta` DISABLE KEYS */;
INSERT INTO `Venta` VALUES (1,1,1);
/*!40000 ALTER TABLE `Venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-12 10:09:38
