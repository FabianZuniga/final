CREATE DATABASE  IF NOT EXISTS `futbol` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `futbol`;
-- MySQL dump 10.13  Distrib 5.6.16, for Win64 (x86_64)
--
-- Host: localhost    Database: futbol
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `arbritro`
--

DROP TABLE IF EXISTS `arbritro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arbritro` (
  `idarbritro` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`idarbritro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbritro`
--

LOCK TABLES `arbritro` WRITE;
/*!40000 ALTER TABLE `arbritro` DISABLE KEYS */;
/*!40000 ALTER TABLE `arbritro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campeonato`
--

DROP TABLE IF EXISTS `campeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campeonato` (
  `idcampeonato` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `tipo_campeonato` int(11) NOT NULL,
  PRIMARY KEY (`idcampeonato`),
  KEY `fk_campeonato_tipo_campeonato_idx` (`tipo_campeonato`),
  CONSTRAINT `fk_campeonato_tipo_campeonato` FOREIGN KEY (`tipo_campeonato`) REFERENCES `tipo_campeonato` (`idtipo_campeonato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campeonato`
--

LOCK TABLES `campeonato` WRITE;
/*!40000 ALTER TABLE `campeonato` DISABLE KEYS */;
/*!40000 ALTER TABLE `campeonato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancha`
--

DROP TABLE IF EXISTS `cancha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancha` (
  `idcancha` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`idcancha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancha`
--

LOCK TABLES `cancha` WRITE;
/*!40000 ALTER TABLE `cancha` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `idequipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `idgrupo` int(11) NOT NULL,
  PRIMARY KEY (`idequipo`),
  KEY `fk_equipos_grupos1_idx` (`idgrupo`),
  CONSTRAINT `fk_equipos_grupos1` FOREIGN KEY (`idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo_jugador`
--

DROP TABLE IF EXISTS `equipo_jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo_jugador` (
  `id_equipo_jugador` int(11) NOT NULL AUTO_INCREMENT,
  `idequipo` int(11) NOT NULL,
  `idjugador` int(11) NOT NULL,
  PRIMARY KEY (`id_equipo_jugador`),
  KEY `fk_camp_equip_juga_equipos1_idx` (`idequipo`),
  KEY `fk_camp_equip_juga_jugadores1_idx` (`idjugador`),
  CONSTRAINT `fk_camp_equip_juga_equipos1` FOREIGN KEY (`idequipo`) REFERENCES `equipo` (`idequipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_camp_equip_juga_jugadores1` FOREIGN KEY (`idjugador`) REFERENCES `jugador` (`idjugador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo_jugador`
--

LOCK TABLES `equipo_jugador` WRITE;
/*!40000 ALTER TABLE `equipo_jugador` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipo_jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gol`
--

DROP TABLE IF EXISTS `gol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gol` (
  `idgol` int(11) NOT NULL AUTO_INCREMENT,
  `equipo_jugador` int(11) NOT NULL,
  `idpartido` int(11) NOT NULL,
  PRIMARY KEY (`idgol`),
  KEY `fk_goles_camp_equip_juga1_idx` (`equipo_jugador`),
  KEY `fk_goles_partido1_idx` (`idpartido`),
  CONSTRAINT `fk_goles_camp_equip_juga1` FOREIGN KEY (`equipo_jugador`) REFERENCES `equipo_jugador` (`id_equipo_jugador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_goles_partido1` FOREIGN KEY (`idpartido`) REFERENCES `partido` (`idpartido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gol`
--

LOCK TABLES `gol` WRITE;
/*!40000 ALTER TABLE `gol` DISABLE KEYS */;
/*!40000 ALTER TABLE `gol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `idcampeonato` int(11) NOT NULL,
  PRIMARY KEY (`idgrupo`),
  KEY `fk_grupos_campeonato1_idx` (`idcampeonato`),
  CONSTRAINT `fk_grupos_campeonato1` FOREIGN KEY (`idcampeonato`) REFERENCES `campeonato` (`idcampeonato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jugador` (
  `idjugador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`idjugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partido` (
  `idpartido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL,
  `idcancha` int(11) NOT NULL,
  `arbritro_central` int(11) NOT NULL,
  `idarbritro1` int(11) NOT NULL,
  `idarbritro2` int(11) NOT NULL,
  `idarbritro3` int(11) NOT NULL,
  `equipo_visitante` int(11) NOT NULL,
  `equipo_local` int(11) NOT NULL,
  PRIMARY KEY (`idpartido`),
  KEY `fk_partido_canchas1_idx` (`idcancha`),
  KEY `fk_partido_arbritro1_idx` (`arbritro_central`),
  KEY `fk_partido_arbritro2_idx` (`idarbritro1`),
  KEY `fk_partido_arbritro3_idx` (`idarbritro2`),
  KEY `fk_partido_arbritro4_idx` (`idarbritro3`),
  KEY `fk_partido_equipo1_idx` (`equipo_visitante`),
  KEY `fk_partido_equipo2_idx` (`equipo_local`),
  CONSTRAINT `fk_partido_canchas1` FOREIGN KEY (`idcancha`) REFERENCES `cancha` (`idcancha`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_arbritro1` FOREIGN KEY (`arbritro_central`) REFERENCES `arbritro` (`idarbritro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_arbritro2` FOREIGN KEY (`idarbritro1`) REFERENCES `arbritro` (`idarbritro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_arbritro3` FOREIGN KEY (`idarbritro2`) REFERENCES `arbritro` (`idarbritro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_arbritro4` FOREIGN KEY (`idarbritro3`) REFERENCES `arbritro` (`idarbritro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_equipo1` FOREIGN KEY (`equipo_visitante`) REFERENCES `equipo` (`idequipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_equipo2` FOREIGN KEY (`equipo_local`) REFERENCES `equipo` (`idequipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sancion`
--

DROP TABLE IF EXISTS `sancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sancion` (
  `idsancion` int(4) NOT NULL AUTO_INCREMENT,
  `tipo_sancion` int(11) NOT NULL,
  `idpartido` int(11) NOT NULL,
  `id_equipo_jugado` int(11) NOT NULL,
  PRIMARY KEY (`idsancion`),
  KEY `fk_sanciones_tipo_sancion1_idx` (`tipo_sancion`),
  KEY `fk_sanciones_partido1_idx` (`idpartido`),
  KEY `fk_sanciones_equipo_jugador1_idx` (`id_equipo_jugado`),
  CONSTRAINT `fk_sanciones_tipo_sancion1` FOREIGN KEY (`tipo_sancion`) REFERENCES `tipo_sancion` (`idtipo_sancion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sanciones_partido1` FOREIGN KEY (`idpartido`) REFERENCES `partido` (`idpartido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sanciones_equipo_jugador1` FOREIGN KEY (`id_equipo_jugado`) REFERENCES `equipo_jugador` (`id_equipo_jugador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sancion`
--

LOCK TABLES `sancion` WRITE;
/*!40000 ALTER TABLE `sancion` DISABLE KEYS */;
/*!40000 ALTER TABLE `sancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_campeonato`
--

DROP TABLE IF EXISTS `tipo_campeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_campeonato` (
  `idtipo_campeonato` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idtipo_campeonato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_campeonato`
--

LOCK TABLES `tipo_campeonato` WRITE;
/*!40000 ALTER TABLE `tipo_campeonato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_campeonato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_sancion`
--

DROP TABLE IF EXISTS `tipo_sancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_sancion` (
  `idtipo_sancion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo_sancion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_sancion`
--

LOCK TABLES `tipo_sancion` WRITE;
/*!40000 ALTER TABLE `tipo_sancion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_sancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'futbol'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-09  8:09:27
