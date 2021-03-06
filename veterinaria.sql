-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: veterinaria
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `cargo_empleado`
--

DROP TABLE IF EXISTS `cargo_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo_empleado` (
  `cod_cargo` int NOT NULL AUTO_INCREMENT,
  `Cargo_Empleado` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_empleado`
--

LOCK TABLES `cargo_empleado` WRITE;
/*!40000 ALTER TABLE `cargo_empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `cod_citas` int NOT NULL AUTO_INCREMENT,
  `cod_empleados` int NOT NULL,
  `cod_clientes` int NOT NULL,
  `Fecha_Hora` datetime NOT NULL,
  PRIMARY KEY (`cod_citas`),
  KEY `fk_clientescitas_idx` (`cod_clientes`),
  KEY `fk_empleadoscitas_idx` (`cod_empleados`),
  CONSTRAINT `fk_clientescitas` FOREIGN KEY (`cod_clientes`) REFERENCES `clientes` (`cod_clientes`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_empleadoscitas` FOREIGN KEY (`cod_empleados`) REFERENCES `empleados` (`cod_empleados`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cod_clientes` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Apellido` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Telefono` int NOT NULL,
  `Direccion` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cod_clientes`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2,'MARIO','ESCOBAR',731818127,'EWDFWEFWEFWEFWEFWE'),(4,'Willian','Guzman',7367123,'Las palmas'),(5,'Daniel','Deras',78213781,'Zona rosa'),(6,'David','Nova',76264513,'jkdhjas');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallefactura`
--

DROP TABLE IF EXISTS `detallefactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallefactura` (
  `cod_detalle` int NOT NULL AUTO_INCREMENT,
  `cod_factura` int NOT NULL,
  `cod_formapago` int NOT NULL,
  `precio` float NOT NULL,
  `fechapago` datetime NOT NULL,
  `detalle` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_detalle`),
  KEY `fk_codfacturaDetalle_idx` (`cod_factura`),
  KEY `fk_codformapagoDetalle_idx` (`cod_formapago`),
  CONSTRAINT `fk_codfacturaDetalle` FOREIGN KEY (`cod_factura`) REFERENCES `factura` (`cod_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_codformapagoDetalle` FOREIGN KEY (`cod_formapago`) REFERENCES `formapago` (`cod_formapago`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallefactura`
--

LOCK TABLES `detallefactura` WRITE;
/*!40000 ALTER TABLE `detallefactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallefactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `cod_empleados` int NOT NULL AUTO_INCREMENT,
  `cod_turno` int DEFAULT NULL,
  `cod_cargo` int DEFAULT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Telefono` varchar(8) NOT NULL,
  `Dui` varchar(15) NOT NULL,
  `Cargo` varchar(15) NOT NULL,
  PRIMARY KEY (`cod_empleados`),
  KEY `fk_turno_idx` (`cod_turno`),
  KEY `fk_cargo_idx` (`cod_cargo`),
  CONSTRAINT `fk_cargo` FOREIGN KEY (`cod_cargo`) REFERENCES `cargo_empleado` (`cod_cargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_turno` FOREIGN KEY (`cod_turno`) REFERENCES `turno` (`cod_turno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,NULL,NULL,'Juan','Escobar','7432423','39434343','Programador'),(2,NULL,NULL,'Claudia','Escobar','2342342','2342343','Contador');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `cod_factura` int NOT NULL AUTO_INCREMENT,
  `cod_clientes` int NOT NULL,
  `cod_sucursal` int DEFAULT NULL,
  `numFactura` int NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`cod_factura`),
  KEY `fk_codclientesFactura_idx` (`cod_clientes`),
  KEY `fk_sucursal_idx` (`cod_sucursal`),
  CONSTRAINT `fk_codclientesFactura` FOREIGN KEY (`cod_clientes`) REFERENCES `clientes` (`cod_clientes`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sucursal` FOREIGN KEY (`cod_sucursal`) REFERENCES `sucursal` (`cod_sucursal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapago`
--

DROP TABLE IF EXISTS `formapago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formapago` (
  `cod_formapago` int NOT NULL AUTO_INCREMENT,
  `Tipo_Pago` varchar(1) NOT NULL,
  PRIMARY KEY (`cod_formapago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapago`
--

LOCK TABLES `formapago` WRITE;
/*!40000 ALTER TABLE `formapago` DISABLE KEYS */;
/*!40000 ALTER TABLE `formapago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialmedico`
--

DROP TABLE IF EXISTS `historialmedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historialmedico` (
  `cod_historial` int NOT NULL AUTO_INCREMENT,
  `cod_mascotas` int NOT NULL,
  `cod_medicamento` int NOT NULL,
  `cod_empleados` int NOT NULL,
  `Fecha` varchar(45) NOT NULL,
  `Motivo` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_historial`),
  KEY `fk_mascotashis_idx` (`cod_mascotas`),
  KEY `fk_empleadoshis_idx` (`cod_empleados`),
  KEY `fk_medicamentohis_idx` (`cod_medicamento`),
  CONSTRAINT `fk_empleadoshis` FOREIGN KEY (`cod_empleados`) REFERENCES `empleados` (`cod_empleados`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mascotashis` FOREIGN KEY (`cod_mascotas`) REFERENCES `mascotas` (`cod_mascotas`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_medicamentohis` FOREIGN KEY (`cod_medicamento`) REFERENCES `medicamento` (`cod_medicamento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialmedico`
--

LOCK TABLES `historialmedico` WRITE;
/*!40000 ALTER TABLE `historialmedico` DISABLE KEYS */;
/*!40000 ALTER TABLE `historialmedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `cod_mascotas` int NOT NULL AUTO_INCREMENT,
  `cod_clientes` int NOT NULL,
  `Nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Edad` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Raza` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Genero` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Peso` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Estado_Vacuna` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cod_mascotas`),
  KEY `fk_codclientesMascotas_idx` (`cod_clientes`),
  CONSTRAINT `fk_codclientesMascotas` FOREIGN KEY (`cod_clientes`) REFERENCES `clientes` (`cod_clientes`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotas`
--

LOCK TABLES `mascotas` WRITE;
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamento` (
  `cod_medicamento` int NOT NULL AUTO_INCREMENT,
  `Nom_Comercial` varchar(50) NOT NULL,
  `Nom_Generico` varchar(50) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Reacciones_Adversas` varchar(50) NOT NULL,
  `Dosis` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_medicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `cod_rol` int NOT NULL AUTO_INCREMENT,
  `Nombre_Rol` varchar(1) NOT NULL,
  PRIMARY KEY (`cod_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `cod_sucursal` int NOT NULL AUTO_INCREMENT,
  `Nom_Sucursal` varchar(50) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Telefono` varchar(8) NOT NULL,
  `Departamento` varchar(50) NOT NULL,
  `Municipio` varchar(50) NOT NULL,
  `Encargado` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turno` (
  `cod_turno` int NOT NULL,
  `Horario` varchar(1) NOT NULL,
  `Horario_Entrada` datetime NOT NULL,
  `Horario_Salida` datetime NOT NULL,
  PRIMARY KEY (`cod_turno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `cod_usuarios` int NOT NULL AUTO_INCREMENT,
  `cod_rol` int DEFAULT NULL,
  `usuario` varchar(45) NOT NULL,
  `contrase??a` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_usuarios`),
  KEY `fk_rol_idx` (`cod_rol`),
  CONSTRAINT `fk_rol` FOREIGN KEY (`cod_rol`) REFERENCES `rol` (`cod_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,NULL,'mario','123'),(2,NULL,'daniel','daniel'),(3,NULL,'will','will'),(4,NULL,'nova','nova');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-21 14:01:58
