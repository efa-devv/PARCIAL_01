-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: servicios_digitales
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `servicios_digitales`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `servicios_digitales` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `servicios_digitales`;

--
-- Table structure for table `auditoria_accesos`
--

DROP TABLE IF EXISTS `auditoria_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_accesos` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `codigo_evento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_usuario` int NOT NULL,
  `accion` enum('login','logout','login_fallido','cambio_password','bloqueo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `exitoso` tinyint(1) NOT NULL,
  `ip_origen` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_evento` datetime NOT NULL,
  PRIMARY KEY (`id_evento`),
  UNIQUE KEY `codigo_evento` (`codigo_evento`),
  KEY `fk_audit_usuario` (`id_usuario`),
  CONSTRAINT `fk_audit_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_accesos`
--

LOCK TABLES `auditoria_accesos` WRITE;
/*!40000 ALTER TABLE `auditoria_accesos` DISABLE KEYS */;
INSERT INTO `auditoria_accesos` VALUES (1,'EV-1000',5,'login',1,'190.36.0.151','2026-10-01 07:00:00'),(2,'EV-1001',9,'logout',1,'190.102.183.254','2026-10-02 08:07:00'),(3,'EV-1002',5,'login_fallido',0,'190.59.17.245','2026-10-03 09:14:00'),(4,'EV-1003',3,'login',1,'190.228.101.1','2026-10-04 10:21:00'),(5,'EV-1004',4,'cambio_password',1,'190.94.135.47','2026-10-05 11:28:00'),(6,'EV-1005',4,'login',1,'190.83.169.75','2026-10-06 12:35:00'),(7,'EV-1006',14,'login_fallido',0,'190.214.188.9','2026-10-07 13:42:00'),(8,'EV-1007',9,'logout',1,'190.182.81.131','2026-10-08 14:49:00'),(9,'EV-1008',11,'login',1,'190.245.101.94','2026-10-09 15:56:00'),(10,'EV-1009',14,'bloqueo',0,'190.155.196.63','2026-10-10 16:03:00'),(11,'EV-1010',7,'login',1,'190.169.160.125','2026-10-11 17:10:00'),(12,'EV-1011',15,'login',1,'190.186.16.64','2026-10-12 18:17:00'),(13,'EV-1012',11,'logout',1,'190.139.240.199','2026-10-13 07:24:00'),(14,'EV-1013',14,'login_fallido',0,'190.116.45.68','2026-10-14 08:31:00'),(15,'EV-1014',13,'login',1,'190.56.66.52','2026-10-15 09:38:00');
/*!40000 ALTER TABLE `auditoria_accesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratos` (
  `id_contrato` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_servicio` int NOT NULL,
  `plan` enum('mensual','trimestral','anual') COLLATE utf8mb4_unicode_ci NOT NULL,
  `renovacion_auto` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_inicio` date NOT NULL,
  `estado` enum('activo','suspendido','cancelado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id_contrato`),
  UNIQUE KEY `uq_usuario_servicio` (`id_usuario`,`id_servicio`),
  KEY `fk_contrato_servicio` (`id_servicio`),
  CONSTRAINT `fk_contrato_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  CONSTRAINT `fk_contrato_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos`
--

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
INSERT INTO `contratos` VALUES (1,3,3,'anual',0,'2026-01-01','activo'),(2,9,2,'anual',1,'2026-02-02','activo'),(3,11,10,'mensual',1,'2026-03-03','activo'),(4,9,8,'anual',1,'2026-04-04','activo'),(5,5,9,'trimestral',0,'2026-05-05','activo'),(6,10,5,'trimestral',1,'2026-06-06','activo'),(7,10,7,'trimestral',1,'2026-07-07','activo'),(8,12,14,'mensual',1,'2026-08-08','cancelado'),(9,7,8,'trimestral',0,'2026-09-09','activo'),(10,6,8,'anual',1,'2026-01-10','activo'),(11,10,2,'anual',1,'2026-02-11','activo'),(12,5,8,'anual',1,'2026-03-12','suspendido'),(13,7,10,'trimestral',0,'2026-04-13','activo'),(14,3,14,'anual',1,'2026-05-14','activo'),(15,9,7,'mensual',1,'2026-06-15','activo');
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credenciales`
--

DROP TABLE IF EXISTS `credenciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credenciales` (
  `id_credencial` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metodo_2fa` enum('ninguno','sms','app') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ninguno',
  `bloqueada` tinyint(1) NOT NULL DEFAULT '0',
  `intentos_fallidos` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_credencial`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `fk_cred_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `chk_intentos` CHECK ((`intentos_fallidos` between 0 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credenciales`
--

LOCK TABLES `credenciales` WRITE;
/*!40000 ALTER TABLE `credenciales` DISABLE KEYS */;
INSERT INTO `credenciales` VALUES (1,1,'cgonzalez','07de0a79c0a51f63c7ebdb2d3b65683887d6c2b22702ae44223f5cd42d81f0cd','app',0,0),(2,2,'mrodriguez','704c4fc63a6f738b4bec977bd2496709435dfe90265027d2ad381c60bd2e6744','ninguno',0,2),(3,3,'jperez','4229bb5243aac89b404887795a0d94ea6d9dd2bd51aad7fe168182d1275271a5','sms',0,0),(4,4,'acastillo','92f14677d33eec2f84e22f6bc43080637badd0133f27e346ce4c0ba73f956587','ninguno',0,1),(5,5,'lbatista','b58a6a6e3dd8496f196dfc710b5ce20db571599447f5d3140d98e1a975faba32','ninguno',0,1),(6,6,'sherrera','f9e2bc11baaee9bbd6aa52b7e655eb2584967d232d65a92d14f419aab25e5def','sms',0,2),(7,7,'msamaniego','f6daa8bf26b3231a087e4bb0ca21c959f645c94dd5a90c3de170aa7759c34cf1','sms',0,2),(8,8,'vmoreno','872938fcb520c6d879d9d7ba235a2b080c608fbb935ab164fccc8d02d0bbf450','ninguno',0,2),(9,9,'jvasquez','57239bb41848726ea196fabb261ad39786b79ba0cf7a2d2e5ceebca57cb6f4b7','app',0,0),(10,10,'djaen','9a8c718e3402484a65cb40ce24a914ea79011b797e81ef4618bf423ee782445f','app',0,2),(11,11,'rcedeno','2e8e306d7b72b2701581e2247bf65957abacbc9ce3f9bbf5350c1f14a90ef98b','app',0,2),(12,12,'gortega','a0938f16188cbe506dfa05a6fb88a65dbcc803c495f51139c6ee63634543aabd','sms',0,0),(13,13,'aquintero','fc2919789092870e4665a7374829f4037e338adda2d3fae3c9ec3d222c36b157','ninguno',0,2),(14,14,'pbarria','7993a35959dd042faf0daab23c0762aaf62c11a1a7283d172340e2f68bb230ac','sms',1,5),(15,15,'fsanchez','a90698e674b5df054f96bfe8706f65ff5694cbe79e8bb45895c82f53977dca99','app',0,2);
/*!40000 ALTER TABLE `credenciales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_contrato` int NOT NULL,
  `referencia` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monto` decimal(8,2) NOT NULL,
  `metodo` enum('tarjeta','transferencia','yappy','paypal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `aprobado` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_pago` datetime NOT NULL,
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `referencia` (`referencia`),
  KEY `fk_pago_contrato` (`id_contrato`),
  CONSTRAINT `fk_pago_contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contratos` (`id_contrato`),
  CONSTRAINT `chk_monto` CHECK ((`monto` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,'PAG-2026-0001',108.00,'yappy',1,'2026-01-01 09:30:00'),(2,2,'PAG-2026-0002',150.00,'yappy',1,'2026-02-02 10:30:00'),(3,3,'PAG-2026-0003',7.00,'paypal',1,'2026-03-03 11:30:00'),(4,4,'PAG-2026-0004',540.00,'yappy',1,'2026-04-04 12:30:00'),(5,5,'PAG-2026-0005',45.00,'yappy',0,'2026-05-05 13:30:00'),(6,6,'PAG-2026-0006',8.97,'yappy',1,'2026-06-06 14:30:00'),(7,7,'PAG-2026-0007',16.50,'transferencia',1,'2026-07-07 15:30:00'),(8,8,'PAG-2026-0008',25.00,'tarjeta',1,'2026-08-08 16:30:00'),(9,9,'PAG-2026-0009',135.00,'paypal',1,'2026-09-09 09:30:00'),(10,10,'PAG-2026-0010',540.00,'yappy',1,'2026-01-10 10:30:00'),(11,11,'PAG-2026-0011',150.00,'tarjeta',1,'2026-02-11 11:30:00'),(12,12,'PAG-2026-0012',540.00,'paypal',0,'2026-03-12 12:30:00'),(13,13,'PAG-2026-0013',21.00,'tarjeta',1,'2026-04-13 13:30:00'),(14,14,'PAG-2026-0014',300.00,'tarjeta',1,'2026-05-14 14:30:00'),(15,15,'PAG-2026-0015',5.50,'transferencia',1,'2026-06-15 15:30:00');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` enum('hosting','correo','almacenamiento','vpn','backup','seguridad') COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio_mensual` decimal(8,2) NOT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT '1',
  `id_responsable` int NOT NULL,
  PRIMARY KEY (`id_servicio`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `fk_servicio_resp` (`id_responsable`),
  CONSTRAINT `fk_servicio_resp` FOREIGN KEY (`id_responsable`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `chk_precio` CHECK ((`precio_mensual` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'HOST-B','Hosting Básico','hosting',4.99,1,1),(2,'HOST-P','Hosting Pro','hosting',12.50,1,2),(3,'MAIL-5','Correo Corporativo 5 cuentas','correo',9.00,1,1),(4,'MAIL-20','Correo Corporativo 20 cuentas','correo',29.00,1,2),(5,'CLD-100','Almacenamiento 100 GB','almacenamiento',2.99,1,1),(6,'CLD-1T','Almacenamiento 1 TB','almacenamiento',9.99,1,2),(7,'VPN-IND','VPN Individual','vpn',5.50,1,1),(8,'VPN-EMP','VPN Empresarial','vpn',45.00,1,2),(9,'BKP-D','Backup Diario','backup',15.00,1,1),(10,'BKP-S','Backup Semanal','backup',7.00,0,2),(11,'SEC-WAF','Firewall de Aplicaciones Web','seguridad',35.00,1,1),(12,'SEC-AV','Antivirus Corporativo','seguridad',18.00,1,2),(13,'SEC-SSL','Certificado SSL','seguridad',6.00,1,1),(14,'HOST-V','Servidor VPS','hosting',25.00,1,2),(15,'CLD-5T','Almacenamiento 5 TB','almacenamiento',39.99,0,1);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesiones` (
  `id_sesion` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `token` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispositivo` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plataforma` enum('web','android','ios') COLLATE utf8mb4_unicode_ci NOT NULL,
  `activa` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_inicio` datetime NOT NULL,
  `fecha_expira` datetime NOT NULL,
  PRIMARY KEY (`id_sesion`),
  UNIQUE KEY `token` (`token`),
  KEY `fk_sesion_usuario` (`id_usuario`),
  CONSTRAINT `fk_sesion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `chk_expira` CHECK ((`fecha_expira` > `fecha_inicio`))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
INSERT INTO `sesiones` VALUES (1,1,'cfcd208495d565ef66e7dff9f98764da','Xiaomi Redmi Note 12','android',0,'2026-09-01 08:15:00','2026-09-02 08:15:00'),(2,2,'c4ca4238a0b923820dcc509a6f75849b','iPhone 15 Pro','ios',1,'2026-09-02 09:15:00','2026-09-03 09:15:00'),(3,3,'c81e728d9d4c2f636f067f89cc14862c','Motorola G84','android',1,'2026-09-03 10:15:00','2026-09-04 10:15:00'),(4,4,'eccbc87e4b5ce2fe28308fd9f2a7baf3','iPad 10','ios',0,'2026-09-04 11:15:00','2026-09-05 11:15:00'),(5,5,'a87ff679a2f3e71d9181a67b7542122c','Xiaomi Redmi Note 12','android',1,'2026-09-05 12:15:00','2026-09-06 12:15:00'),(6,6,'e4da3b7fbbce2345d7772b0674a318d5','Motorola G84','android',1,'2026-09-06 13:15:00','2026-09-07 13:15:00'),(7,7,'1679091c5a880faf6fb5e6087eb1b2dc','iPhone 15 Pro','ios',0,'2026-09-07 14:15:00','2026-09-08 14:15:00'),(8,8,'8f14e45fceea167a5a36dedd4bea2543','PC Escritorio Lenovo','web',1,'2026-09-08 15:15:00','2026-09-09 15:15:00'),(9,9,'c9f0f895fb98ab9159f51fd0297e236d','iPhone 15 Pro','ios',1,'2026-09-09 16:15:00','2026-09-10 16:15:00'),(10,10,'45c48cce2e2d7fbdea1afc51c7c6ad26','iPhone 13','ios',0,'2026-09-10 17:15:00','2026-09-11 17:15:00'),(11,11,'d3d9446802a44259755d38e6d163e820','iPhone 13','ios',1,'2026-09-11 08:15:00','2026-09-12 08:15:00'),(12,12,'6512bd43d9caa6e02c990b0a82652dca','iPhone 13','ios',1,'2026-09-12 09:15:00','2026-09-13 09:15:00'),(13,13,'c20ad4d76fe97759aa27a0c99bff6710','iPhone 15 Pro','ios',0,'2026-09-13 10:15:00','2026-09-14 10:15:00'),(14,14,'c51ce410c124a10e0db5e4b97fc2af39','iPhone 15 Pro','ios',1,'2026-09-14 11:15:00','2026-09-15 11:15:00'),(15,15,'aab3238922bcc25a6f606eb525ffdc56','iPhone 13','ios',1,'2026-09-15 12:15:00','2026-09-16 12:15:00');
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` enum('cliente','administrador','soporte') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cliente',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_registro` date NOT NULL,
  `referido_por` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `fk_usuario_referido` (`referido_por`),
  CONSTRAINT `fk_usuario_referido` FOREIGN KEY (`referido_por`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `chk_correo` CHECK ((`correo` like _utf8mb4'%@%.%'))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Carlos','González','carlos.gonzalez@correo.com','62792285','administrador',1,'2025-01-01',NULL),(2,'María','Rodríguez','maria.rodriguez@correo.com','69843470','soporte',1,'2025-02-03',NULL),(3,'José','Pérez','jose.perez@correo.com','65142886','cliente',1,'2025-03-05',NULL),(4,'Ana','Castillo','ana.castillo@correo.com','65291201','cliente',1,'2025-04-07',2),(5,'Luis','Batista','luis.batista@correo.com','62218459','cliente',1,'2025-05-09',3),(6,'Sofía','Herrera','sofia.herrera@correo.com','66083294','cliente',1,'2025-06-11',4),(7,'Miguel','Samaniego','miguel.samaniego@correo.com','67655079','cliente',1,'2025-07-13',4),(8,'Valeria','Moreno','valeria.moreno@correo.com','62986415','cliente',1,'2025-08-15',4),(9,'Jorge','Vásquez','jorge.vasquez@correo.com','64745783','cliente',1,'2025-09-17',5),(10,'Daniela','Jaén','daniela.jaen@correo.com','67006791','cliente',0,'2025-10-19',6),(11,'Ricardo','Cedeño','ricardo.cedeno@correo.com','67051040','cliente',1,'2025-11-21',5),(12,'Gabriela','Ortega','gabriela.ortega@correo.com','69661551','cliente',1,'2025-12-23',11),(13,'Andrés','Quintero','andres.quintero@correo.com','63701978','cliente',1,'2025-01-25',3),(14,'Paola','Barría','paola.barria@correo.com','65619271','cliente',0,'2025-02-27',9),(15,'Fernando','Sánchez','fernando.sanchez@correo.com','61177927','cliente',1,'2025-03-02',3),(16,'Alexis','Luo','alexis.luo@correo.com','67778888','cliente',0,'2026-10-23',3);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_auditoria_accesos`
--

DROP TABLE IF EXISTS `vw_auditoria_accesos`;
/*!50001 DROP VIEW IF EXISTS `vw_auditoria_accesos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_auditoria_accesos` AS SELECT 
 1 AS `codigo_evento`,
 1 AS `fecha_evento`,
 1 AS `username`,
 1 AS `accion`,
 1 AS `exitoso`,
 1 AS `ip_origen`,
 1 AS `usuario_activo`,
 1 AS `bloqueada`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_negocio_ingresos`
--

DROP TABLE IF EXISTS `vw_negocio_ingresos`;
/*!50001 DROP VIEW IF EXISTS `vw_negocio_ingresos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_negocio_ingresos` AS SELECT 
 1 AS `id_usuario`,
 1 AS `cliente`,
 1 AS `servicio`,
 1 AS `plan`,
 1 AS `estado_contrato`,
 1 AS `referencia`,
 1 AS `monto`,
 1 AS `metodo`,
 1 AS `aprobado`,
 1 AS `fecha_pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_seguridad_usuarios`
--

DROP TABLE IF EXISTS `vw_seguridad_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_seguridad_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_seguridad_usuarios` AS SELECT 
 1 AS `id_usuario`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `correo`,
 1 AS `rol`,
 1 AS `activo`,
 1 AS `username`,
 1 AS `metodo_2fa`,
 1 AS `bloqueada`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `pixel_security_360`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `pixel_security_360` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pixel_security_360`;

--
-- Table structure for table `autenticacion`
--

DROP TABLE IF EXISTS `autenticacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autenticacion` (
  `id_autenticacion` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `nombre_usuario` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasena` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agente_usuario` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_acceso` datetime NOT NULL,
  PRIMARY KEY (`id_autenticacion`),
  UNIQUE KEY `token` (`token`),
  KEY `fk_auth_usuario` (`id_usuario`),
  CONSTRAINT `fk_auth_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autenticacion`
--

LOCK TABLES `autenticacion` WRITE;
/*!40000 ALTER TABLE `autenticacion` DISABLE KEYS */;
INSERT INTO `autenticacion` VALUES (1,1,'cgonzalez10','ebf16b88a9153cac951b4d416a6057ca4141cd1a3daf0a8c7b3e30abe4d12f0c','Laptop HP EliteBook - Windows 11','7bbb59770ba3cf6e020790ba5b77e75a','2026-10-01 07:00:00'),(2,4,'aespinosa13','6d29ccc88bfbd91386862df4713e6ff8ba9d4d107c9bd9059ba93dffaf93e7f2','Laptop HP EliteBook - Windows 11','7f7dbd029be97ddf14209cddfb03e6cd','2026-10-02 08:11:00'),(3,7,'mpinzon16','9e30f5d0b0145fda7d057468fc6e5e228e49403462e53ff4dea1ad44d351efa2','Samsung Galaxy S23 - Android 14','097bda4c3323d7ec6f435c90e1148721','2026-10-03 09:22:00'),(4,10,'dbarria19','cb8d68ea98e8dabfdd0353e6361d760ab0add0673bf284c8858de09849591398','MacBook Pro - macOS Sonoma','ad3ca799e83d175d0aa7d5485a710b0e','2026-10-04 10:33:00'),(5,13,'ajaen22','fef5bf93d1a1446c9b0f49f82c7646a23b8d17dba3130951613311137b6f1eb6','iPhone 14 - iOS 17','d69d7f3e228bb8861947116f66bdc342','2026-10-05 11:44:00'),(6,16,'iherrera25','9731dcb91b9d2218f236293addd05452e9088822d0a08d0d59e6e097d490d07f','Laptop HP EliteBook - Windows 11','e483ecf25ffa60b6e18c92c208173f09','2026-10-06 12:55:00'),(7,19,'rrodriguez28','a5b6e71b124778f9f4702c752200ddb1ed1e3e3c0560bfa8696e2a4028bdfee6','MacBook Pro - macOS Sonoma','5db0391fc518f56000ab8f9e60feffeb','2026-10-07 13:06:00'),(8,22,'mnavarro31','8e449b49804c05d6819891715cc74aff60b14eda2db682f0ee5e22cb7bc37233','Xiaomi 13T - Android 14','3f7d4ab6fb8dcf236dab688b9f0798ca','2026-10-08 14:17:00'),(9,25,'itorres34','a3d3e2905bfa7ed1520023973ea5bda44ab0455a77b1f24f84729fd713f2d695','iPad Air - iPadOS 17','247542a98253f35202e874df1c2d2986','2026-10-09 15:28:00'),(10,3,'jsanchez12','0814bef4c87f6347934ce1e01bec14cbcb464b601fd27d36ef1eb83503c4fce4','Laptop Dell Latitude - Ubuntu 22.04','d8ae64671077b7e1d274494fb93d1302','2026-10-10 16:39:00'),(11,6,'scedeno15','be0986708e9b36dd0144a474949efba161cbc815016db8ec7a72517be09a69e0','PC Lenovo ThinkCentre - Windows 10','933004a33a4e023c77cc5da47e35d1f0','2026-10-11 17:50:00'),(12,9,'jsamaniego18','70e79e6829523c3843cc000899a90e9745a7b3e69fc3d13985af0c81c9eb81d0','Laptop HP EliteBook - Windows 11','d8e7389a4c3f7d881cccc8dea2cddd73','2026-10-12 18:01:00'),(13,12,'gperez21','f3c21f7847cf1849c594ba3384b862fe270bbc09c90dbcff16a50fe4390880c4','PC Lenovo ThinkCentre - Windows 10','626bee78f667c03f038a8304a18730e1','2026-10-13 19:12:00'),(14,15,'fvega24','d47770f380900e89d677715293759cea5d633e41b56f93a432fd71aaaef363d7','MacBook Pro - macOS Sonoma','5df96d2cc742b8c0b1915bf2c1fc472d','2026-10-14 07:23:00'),(15,18,'crios27','090c432b094390e23fb11f8b5dc2a03f333cf1170ed49ecfb672e9af09eeb2f7','PC Lenovo ThinkCentre - Windows 10','b3de25835a708d90b825bd837bca7f80','2026-10-15 08:34:00'),(16,21,'aarauz30','c5886c0ac499be2d45464ab5c28a493ed5f3dcfa9ed895b266874b5e865649ce','PC Lenovo ThinkCentre - Windows 10','0c6484a478e6e181ad5b6de5304a895f','2026-10-16 09:45:00'),(17,24,'nortega33','b24eeb2fb5be3a78a429eebcef2ae1e489f4c7c4a62b473174dcbd4ec76d3fdc','iPad Air - iPadOS 17','d4a5414dd7166af93ba8803343f5b8ac','2026-10-17 10:56:00'),(18,2,'mmoreno11','4ccb5874538c661ed0c0fd6b28377983f9a27e612eee844cc3cdf37cc874d341','iPhone 14 - iOS 17','f460c268a503bcf86442381d34461900','2026-10-18 11:07:00'),(19,5,'lcastillo14','ae5b2179a1e7eab1e0416de741ebad0d0b792c7160499faff2d7a91bf4a1f7ee','Samsung Galaxy S23 - Android 14','af637c2eb51933ed8a29cbf4d00cc753','2026-10-19 12:18:00'),(20,8,'vcorrea17','1dc2726e582bddaae62e230ecdc112cc6f0486e7cadc318423b1f6d2014c41f3','Samsung Galaxy S23 - Android 14','937ed254610bd38a7c22728f8793024f','2026-10-20 13:29:00'),(21,11,'rmunoz20','e1b2b177e5bfc4922825a8ef0280d98aaa57796a94b9be5862860de57b99f0ac','Xiaomi 13T - Android 14','076fa2da9acc8a6a2fcfda86273d3bdf','2026-10-21 14:40:00'),(22,14,'pdelgado23','9100e847d3f32a03ba29fec59613ef461b6797f84d07320766fe832f97cbd44e','Xiaomi 13T - Android 14','72c2172066be5b136b20d2a649e284ea','2026-10-22 15:51:00'),(23,17,'dquintero26','2ff246689c7080a55f34b9f2696e1bf2c8ac89e4d4af5651da5b4b238b516a23','Laptop HP EliteBook - Windows 11','fe3a00d1daa1681438a0b5acc1df8409','2026-10-01 16:02:00'),(24,20,'lvasquez29','a47f16390871589389c88cec28df603f5395ffb5c9c399a0ee03b4564a9929f8','Xiaomi 13T - Android 14','863a0835c0a3e21bb2a79c9852140a84','2026-10-02 17:13:00'),(25,23,'hbatista32','aa62cac8e41b3b3bd14446ec7a815782984596ae9a2ee9329dcd727fec540e41','MacBook Pro - macOS Sonoma','b6a3bc529892a115737015524028fb83','2026-10-03 18:24:00');
/*!40000 ALTER TABLE `autenticacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `marca_tarjeta` enum('VISA','MasterCard','American Express','Discover','Diners Club') COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_tarjeta` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_titular` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cvc` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiracion` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarjeta_por_defecto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `uq_tarjeta` (`numero_tarjeta`),
  KEY `fk_pago_usuario` (`id_usuario`),
  CONSTRAINT `fk_pago_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `chk_expiracion` CHECK (regexp_like(`expiracion`,_utf8mb4'^(0[1-9]|1[0-2])/[0-9]{4}$'))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,10,'VISA','4318364971617914','DANIELA BARRÍA','821','09/2028',1),(2,11,'MasterCard','5109838896381250','RICARDO MUÑOZ','983','11/2030',1),(3,12,'American Express','371118933127871','GABRIELA PÉREZ','6193','07/2031',1),(4,13,'Discover','6011151854277154','ANDRÉS JAÉN','140','09/2030',1),(5,14,'Diners Club','36500863381585','PAOLA DELGADO','819','03/2029',1),(6,15,'VISA','4602165738628861','FERNANDO VEGA','408','12/2028',1),(7,16,'MasterCard','5143214380323646','ISABEL HERRERA','215','04/2028',1),(8,17,'American Express','370340483352300','DIEGO QUINTERO','5515','03/2027',1),(9,18,'Discover','6011868477307270','CAMILA RÍOS','315','12/2029',1),(10,19,'Diners Club','36389417607855','ROBERTO RODRÍGUEZ','534','06/2029',1),(11,20,'VISA','4858105132374770','LUCÍA VÁSQUEZ','827','07/2030',1),(12,21,'MasterCard','5106931418993877','ALEJANDRO ARAÚZ','922','07/2030',1),(13,22,'American Express','375569746452029','MARIELA NAVARRO','5748','02/2030',1),(14,23,'Discover','6011703700262937','HÉCTOR BATISTA','989','12/2028',1),(15,24,'Diners Club','36603420551839','NATALIA ORTEGA','992','01/2027',1),(16,25,'VISA','4180386205599696','IVÁN TORRES','524','10/2027',1),(17,6,'MasterCard','5187000163990215','SOFÍA CEDEÑO','408','06/2027',1),(18,7,'American Express','370837523447636','MIGUEL PINZÓN','8965','11/2028',1),(19,3,'Discover','6011829734720168','JOSÉ SÁNCHEZ','442','08/2028',1),(20,4,'Diners Club','36298654685005','ANA ESPINOSA','465','01/2031',1),(21,5,'VISA','4830800518259768','LUIS CASTILLO','852','07/2031',1),(22,8,'MasterCard','5125631286634150','VALERIA CORREA','742','02/2031',1),(23,9,'American Express','374848473097160','JORGE SAMANIEGO','2908','07/2030',1),(24,1,'Discover','6011515143431576','CARLOS GONZÁLEZ','821','08/2027',1),(25,2,'Diners Club','36484848258442','MARÍA MORENO','789','08/2027',1);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `id_reporte` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_cliente` int NOT NULL,
  `id_prueba` int NOT NULL,
  `titulo` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hallazgos` int NOT NULL DEFAULT '0',
  `severidad` enum('Baja','Media','Alta','Critica') COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` enum('En progreso','Entregado','Cerrado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_reporte` date NOT NULL,
  PRIMARY KEY (`id_reporte`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `fk_reporte_cliente` (`id_cliente`),
  KEY `fk_reporte_prueba` (`id_prueba`),
  CONSTRAINT `fk_reporte_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_reporte_prueba` FOREIGN KEY (`id_prueba`) REFERENCES `tipos_pruebas` (`id_prueba`),
  CONSTRAINT `chk_hallazgos` CHECK ((`hallazgos` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES (1,'RPT-2026-001',10,1,'Reconocimiento - Banco Istmeño',14,'Baja','Cerrado','2026-03-02'),(2,'RPT-2026-002',11,2,'Análisis de Vulnerabilidades - Clínica San Fernando',0,'Alta','Entregado','2026-04-03'),(3,'RPT-2026-003',12,3,'Explotación - Ministerio de Comercio',8,'Critica','Entregado','2026-05-04'),(4,'RPT-2026-004',13,4,'Escalar Privilegios o Post-Explotación - Autoridad del Canal',4,'Media','En progreso','2026-06-05'),(5,'RPT-2026-005',14,5,'Pentest de Aplicación Web - Super Xtra',16,'Alta','Entregado','2026-07-06'),(6,'RPT-2026-006',15,6,'Pentest de API REST - Copa Logistics',15,'Media','Entregado','2026-08-07'),(7,'RPT-2026-007',16,7,'Pentest de Aplicación Móvil - Caja de Ahorros',8,'Critica','Cerrado','2026-09-08'),(8,'RPT-2026-008',17,8,'Pentest de Red Externa - Cable Onda',10,'Critica','En progreso','2026-03-09'),(9,'RPT-2026-009',18,9,'Pentest de Red Interna - Universidad Local',17,'Baja','Cerrado','2026-04-10'),(10,'RPT-2026-010',19,10,'Pentest de Redes Inalámbricas - Aseguradora Ancón',3,'Alta','Entregado','2026-05-11'),(11,'RPT-2026-011',20,11,'Ingeniería Social - Farmacias Arrocha',5,'Critica','Cerrado','2026-06-12'),(12,'RPT-2026-012',21,12,'Revisión de Código Fuente - Tienda Felix',0,'Critica','Entregado','2026-07-13'),(13,'RPT-2026-013',22,13,'Pruebas de Active Directory - Alcaldía de Panamá',9,'Alta','Cerrado','2026-08-14'),(14,'RPT-2026-014',23,14,'Pentest de Nube - Banco Istmeño',12,'Critica','Entregado','2026-09-15'),(15,'RPT-2026-015',24,15,'Pruebas de Denegación de Servicio - Clínica San Fernando',14,'Alta','Cerrado','2026-03-16'),(16,'RPT-2026-016',25,17,'Red Team - Ministerio de Comercio',9,'Media','Entregado','2026-04-17'),(17,'RPT-2026-017',10,17,'Red Team - Autoridad del Canal',13,'Critica','Cerrado','2026-05-18'),(18,'RPT-2026-018',11,19,'Revisión de Configuración de Firewall - Super Xtra',8,'Critica','Entregado','2026-06-19'),(19,'RPT-2026-019',12,19,'Revisión de Configuración de Firewall - Copa Logistics',15,'Baja','Entregado','2026-07-20'),(20,'RPT-2026-020',13,20,'Pruebas de Autenticación - Caja de Ahorros',3,'Media','Entregado','2026-08-21'),(21,'RPT-2026-021',14,21,'Pentest de Bases de Datos - Cable Onda',0,'Baja','Entregado','2026-09-22'),(22,'RPT-2026-022',15,22,'Escaneo de Vulnerabilidades Automatizado - Universidad Local',18,'Baja','Entregado','2026-03-23'),(23,'RPT-2026-023',16,1,'Reconocimiento - Aseguradora Ancón',17,'Baja','Entregado','2026-04-24'),(24,'RPT-2026-024',17,2,'Análisis de Vulnerabilidades - Farmacias Arrocha',6,'Critica','Entregado','2026-05-25'),(25,'RPT-2026-025',18,3,'Explotación - Tienda Felix',1,'Media','Cerrado','2026-06-26');
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_pruebas`
--

DROP TABLE IF EXISTS `tipos_pruebas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_pruebas` (
  `id_prueba` int NOT NULL AUTO_INCREMENT,
  `referencia` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `estado` enum('Activo','Desactivado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id_prueba`),
  UNIQUE KEY `referencia` (`referencia`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_pruebas`
--

LOCK TABLES `tipos_pruebas` WRITE;
/*!40000 ALTER TABLE `tipos_pruebas` DISABLE KEYS */;
INSERT INTO `tipos_pruebas` VALUES (1,'PT-001','Reconocimiento','Recolección de información pública del objetivo: dominios, subdominios, puertos y tecnologías.','2026-01-05','Activo'),(2,'PT-002','Análisis de Vulnerabilidades','Identificación y clasificación de vulnerabilidades en los activos encontrados.','2026-01-05','Activo'),(3,'PT-003','Explotación','Aprovechamiento controlado de vulnerabilidades para comprobar su impacto real.','2026-01-05','Activo'),(4,'PT-004','Escalar Privilegios o Post-Explotación','Obtención de mayores privilegios y evaluación del alcance después del acceso inicial.','2026-01-05','Activo'),(5,'PT-005','Pentest de Aplicación Web','Pruebas sobre aplicaciones web basadas en OWASP Top 10.','2026-06-05','Activo'),(6,'PT-006','Pentest de API REST','Pruebas de autenticación, autorización y validación de datos en APIs.','2026-07-06','Activo'),(7,'PT-007','Pentest de Aplicación Móvil','Análisis de aplicaciones Android e iOS según OWASP MASVS.','2026-08-07','Activo'),(8,'PT-008','Pentest de Red Externa','Evaluación de servicios expuestos a Internet.','2026-09-08','Activo'),(9,'PT-009','Pentest de Red Interna','Evaluación de la red corporativa desde un equipo interno.','2026-02-09','Activo'),(10,'PT-010','Pentest de Redes Inalámbricas','Pruebas de seguridad sobre redes Wi-Fi corporativas.','2026-03-10','Activo'),(11,'PT-011','Ingeniería Social','Campañas de phishing controladas para medir la concienciación del personal.','2026-04-11','Activo'),(12,'PT-012','Revisión de Código Fuente','Análisis estático del código en busca de fallas de seguridad.','2026-05-12','Activo'),(13,'PT-013','Pruebas de Active Directory','Evaluación de configuración y rutas de ataque en el dominio.','2026-06-13','Activo'),(14,'PT-014','Pentest de Nube','Revisión de configuraciones inseguras en AWS, Azure o GCP.','2026-07-14','Activo'),(15,'PT-015','Pruebas de Denegación de Servicio','Evaluación controlada de la resistencia del servicio ante carga.','2026-08-15','Activo'),(16,'PT-016','Evaluación de Seguridad Física','Pruebas de acceso físico a instalaciones del cliente.','2026-09-16','Desactivado'),(17,'PT-017','Red Team','Simulación de adversario completa con objetivos definidos.','2026-02-17','Activo'),(18,'PT-018','Pentest de Infraestructura IoT','Pruebas sobre dispositivos conectados y sus protocolos.','2026-03-18','Desactivado'),(19,'PT-019','Revisión de Configuración de Firewall','Análisis de reglas y segmentación de red.','2026-04-19','Activo'),(20,'PT-020','Pruebas de Autenticación','Evaluación de login, MFA, recuperación de contraseña y sesiones.','2026-05-20','Activo'),(21,'PT-021','Pentest de Bases de Datos','Evaluación de permisos, inyecciones y configuración del motor.','2026-06-21','Activo'),(22,'PT-022','Escaneo de Vulnerabilidades Automatizado','Escaneo periódico con herramientas automatizadas.','2026-07-22','Activo'),(23,'PT-023','Retest de Hallazgos','Verificación de que las vulnerabilidades reportadas fueron corregidas.','2026-08-23','Activo'),(24,'PT-024','Pentest de Correo Electrónico','Revisión de SPF, DKIM, DMARC y suplantación de correo.','2026-09-24','Activo'),(25,'PT-025','Evaluación de Ransomware','Simulación de escenarios de ransomware y capacidad de respuesta.','2026-02-25','Desactivado');
/*!40000 ALTER TABLE `tipos_pruebas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_usuario` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasena` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` enum('Masculino','Femenino') COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_civil` enum('Soltero','Casado','Divorciado','Viudo','Unido') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_empresa` enum('Publica','Privada') COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_usuario` enum('Cliente','Administrador','Vendedor','Ejecutivo','Otros') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Carlos','González','cgonzalez10','d30addad326b564602ae475da6541e8d','ebf16b88a9153cac951b4d416a6057ca4141cd1a3daf0a8c7b3e30abe4d12f0c','Panamá','Masculino','Casado','Publica','Calle Uruguay, Edif. 32, Apto 15B','Administrador'),(2,'María','Moreno','mmoreno11','aa2fd6ea9500563c7ac5b2c0b6ec4629','4ccb5874538c661ed0c0fd6b28377983f9a27e612eee844cc3cdf37cc874d341','Penonomé','Femenino','Viudo','Publica','Vía España, Edif. 17, Apto 12D','Administrador'),(3,'José','Sánchez','jsanchez12','52ac105a897798d6d12abc200e841237','0814bef4c87f6347934ce1e01bec14cbcb464b601fd27d36ef1eb83503c4fce4','Las Tablas','Masculino','Casado','Privada','Vía Argentina, Edif. 6, Apto 5B','Vendedor'),(4,'Ana','Espinosa','aespinosa13','5d4a8ce8a13513bd847d682b35839211','6d29ccc88bfbd91386862df4713e6ff8ba9d4d107c9bd9059ba93dffaf93e7f2','Colón','Femenino','Soltero','Privada','Vía Argentina, Edif. 42, Apto 12A','Vendedor'),(5,'Luis','Castillo','lcastillo14','8621bc0fffd0664023621037662a3d82','ae5b2179a1e7eab1e0416de741ebad0d0b792c7160499faff2d7a91bf4a1f7ee','Aguadulce','Masculino','Viudo','Privada','Calle Uruguay, Edif. 31, Apto 11A','Vendedor'),(6,'Sofía','Cedeño','scedeno15','0c8132bd736854112a748a5b686c230d','be0986708e9b36dd0144a474949efba161cbc815016db8ec7a72517be09a69e0','Chitré','Femenino','Soltero','Privada','Costa del Este, Edif. 60, Apto 18A','Ejecutivo'),(7,'Miguel','Pinzón','mpinzon16','d9a586b8dfd5124b46741422aaaacb06','9e30f5d0b0145fda7d057468fc6e5e228e49403462e53ff4dea1ad44d351efa2','San Miguelito','Masculino','Viudo','Publica','Calle 50, Edif. 54, Apto 6A','Ejecutivo'),(8,'Valeria','Correa','vcorrea17','845b0b80062a708cf91a81a3711abc7a','1dc2726e582bddaae62e230ecdc112cc6f0486e7cadc318423b1f6d2014c41f3','Panamá','Femenino','Divorciado','Publica','Av. Balboa, Edif. 25, Apto 19B','Otros'),(9,'Jorge','Samaniego','jsamaniego18','71f57a483ab27c3fa0b902b6a50be361','70e79e6829523c3843cc000899a90e9745a7b3e69fc3d13985af0c81c9eb81d0','Panamá','Masculino','Viudo','Privada','Calle 74 San Francisco, Edif. 46, Apto 17A','Otros'),(10,'Daniela','Barría','dbarria19','bab6d2eb8716f3da1c29d16c8d869b4e','cb8d68ea98e8dabfdd0353e6361d760ab0add0673bf284c8858de09849591398','Santiago','Femenino','Soltero','Privada','Vía Argentina, Edif. 19, Apto 19A','Cliente'),(11,'Ricardo','Muñoz','rmunoz20','2ca1bafb2d395b4b2bbf38e6270182de','e1b2b177e5bfc4922825a8ef0280d98aaa57796a94b9be5862860de57b99f0ac','Penonomé','Masculino','Casado','Privada','Calle 50, Edif. 60, Apto 12A','Cliente'),(12,'Gabriela','Pérez','gperez21','db3b5a9c728f905fd509de6343f9c25b','f3c21f7847cf1849c594ba3384b862fe270bbc09c90dbcff16a50fe4390880c4','San Miguelito','Femenino','Viudo','Privada','Calle 74 San Francisco, Edif. 19, Apto 12C','Cliente'),(13,'Andrés','Jaén','ajaen22','8cc716e74783e06188884adcd56e8b67','fef5bf93d1a1446c9b0f49f82c7646a23b8d17dba3130951613311137b6f1eb6','Panamá','Masculino','Divorciado','Publica','Calle Uruguay, Edif. 37, Apto 10B','Cliente'),(14,'Paola','Delgado','pdelgado23','d439f4faac5dd362cfc8e6439594347f','9100e847d3f32a03ba29fec59613ef461b6797f84d07320766fe832f97cbd44e','Penonomé','Femenino','Unido','Privada','Calle 50, Edif. 58, Apto 3D','Cliente'),(15,'Fernando','Vega','fvega24','c366d90f2cc3c7becc96ed97eb02b5a1','d47770f380900e89d677715293759cea5d633e41b56f93a432fd71aaaef363d7','Chitré','Masculino','Unido','Privada','Vía Brasil, Edif. 28, Apto 9D','Cliente'),(16,'Isabel','Herrera','iherrera25','47744766c91fccf87f61a848b926f4fa','9731dcb91b9d2218f236293addd05452e9088822d0a08d0d59e6e097d490d07f','David','Femenino','Soltero','Privada','El Dorado, Edif. 31, Apto 8D','Cliente'),(17,'Diego','Quintero','dquintero26','953141bed962b645d58661afaf3822f9','2ff246689c7080a55f34b9f2696e1bf2c8ac89e4d4af5651da5b4b238b516a23','Penonomé','Masculino','Soltero','Publica','Vía Argentina, Edif. 13, Apto 9A','Cliente'),(18,'Camila','Ríos','crios27','1aae43675a202a31cdce9aa5eb36341f','090c432b094390e23fb11f8b5dc2a03f333cf1170ed49ecfb672e9af09eeb2f7','David','Femenino','Soltero','Privada','Costa del Este, Edif. 36, Apto 2A','Cliente'),(19,'Roberto','Rodríguez','rrodriguez28','b29f2099c13b48589ff297fdce100022','a5b6e71b124778f9f4702c752200ddb1ed1e3e3c0560bfa8696e2a4028bdfee6','David','Masculino','Unido','Privada','Calle Uruguay, Edif. 50, Apto 14D','Cliente'),(20,'Lucía','Vásquez','lvasquez29','136e9d292113eb94687a23e2473850ff','a47f16390871589389c88cec28df603f5395ffb5c9c399a0ee03b4564a9929f8','David','Femenino','Soltero','Privada','Vía España, Edif. 46, Apto 6C','Cliente'),(21,'Alejandro','Araúz','aarauz30','5812e0eb9f1da2f74107f072197cf3d0','c5886c0ac499be2d45464ab5c28a493ed5f3dcfa9ed895b266874b5e865649ce','La Chorrera','Masculino','Casado','Privada','Vía España, Edif. 39, Apto 12D','Cliente'),(22,'Mariela','Navarro','mnavarro31','93f1143eff25f847ef8090ea2e5c98ef','8e449b49804c05d6819891715cc74aff60b14eda2db682f0ee5e22cb7bc37233','David','Femenino','Divorciado','Privada','Calle 74 San Francisco, Edif. 35, Apto 10A','Cliente'),(23,'Héctor','Batista','hbatista32','14440c659855c0797e96b08069c1afae','aa62cac8e41b3b3bd14446ec7a815782984596ae9a2ee9329dcd727fec540e41','Colón','Masculino','Unido','Privada','Calle 74 San Francisco, Edif. 9, Apto 9D','Cliente'),(24,'Natalia','Ortega','nortega33','3910cecc59be4051c07a8d5b76ef8725','b24eeb2fb5be3a78a429eebcef2ae1e489f4c7c4a62b473174dcbd4ec76d3fdc','Santiago','Femenino','Unido','Publica','Av. Balboa, Edif. 4, Apto 17A','Cliente'),(25,'Iván','Torres','itorres34','2cd26b4c8e00974f3fab14bbccf00914','a3d3e2905bfa7ed1520023973ea5bda44ab0455a77b1f24f84729fd713f2d695','Arraiján','Masculino','Divorciado','Privada','Av. Ricardo J. Alfaro, Edif. 41, Apto 10C','Cliente');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `servicios_digitales`
--

USE `servicios_digitales`;

--
-- Final view structure for view `vw_auditoria_accesos`
--

/*!50001 DROP VIEW IF EXISTS `vw_auditoria_accesos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba_eduardo`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_auditoria_accesos` AS select `a`.`codigo_evento` AS `codigo_evento`,`a`.`fecha_evento` AS `fecha_evento`,`cr`.`username` AS `username`,`a`.`accion` AS `accion`,`a`.`exitoso` AS `exitoso`,`a`.`ip_origen` AS `ip_origen`,`u`.`activo` AS `usuario_activo`,`cr`.`bloqueada` AS `bloqueada` from ((`auditoria_accesos` `a` join `usuarios` `u` on((`u`.`id_usuario` = `a`.`id_usuario`))) left join `credenciales` `cr` on((`cr`.`id_usuario` = `a`.`id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_negocio_ingresos`
--

/*!50001 DROP VIEW IF EXISTS `vw_negocio_ingresos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba_eduardo`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_negocio_ingresos` AS select `u`.`id_usuario` AS `id_usuario`,concat(`u`.`nombre`,' ',`u`.`apellido`) AS `cliente`,`s`.`nombre` AS `servicio`,`c`.`plan` AS `plan`,`c`.`estado` AS `estado_contrato`,`p`.`referencia` AS `referencia`,`p`.`monto` AS `monto`,`p`.`metodo` AS `metodo`,`p`.`aprobado` AS `aprobado`,`p`.`fecha_pago` AS `fecha_pago` from (((`usuarios` `u` join `contratos` `c` on((`c`.`id_usuario` = `u`.`id_usuario`))) join `servicios` `s` on((`s`.`id_servicio` = `c`.`id_servicio`))) join `pagos` `p` on((`p`.`id_contrato` = `c`.`id_contrato`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_seguridad_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_seguridad_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba_eduardo`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_seguridad_usuarios` AS select `u`.`id_usuario` AS `id_usuario`,`u`.`nombre` AS `nombre`,`u`.`apellido` AS `apellido`,`u`.`correo` AS `correo`,`u`.`rol` AS `rol`,`u`.`activo` AS `activo`,`cr`.`username` AS `username`,`cr`.`metodo_2fa` AS `metodo_2fa`,`cr`.`bloqueada` AS `bloqueada` from (`usuarios` `u` join `credenciales` `cr` on((`cr`.`id_usuario` = `u`.`id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `pixel_security_360`
--

USE `pixel_security_360`;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-23 19:11:22
