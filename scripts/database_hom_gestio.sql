GRANT ALL PRIVILEGES ON *.* TO 'testes'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

CREATE DATABASE  IF NOT EXISTS `askyu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `askyu`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: askyu
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime NOT NULL,
  `localizacao` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `etapa_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `endereco_id` int DEFAULT NULL,
  `telefone_id` int DEFAULT NULL,
  PRIMARY KEY (`id`,`etapa_id`,`usuario_id`),
  KEY `fk_etapa_agendamento` (`etapa_id`),
  KEY `fk_usuario_agendamento` (`usuario_id`),
  KEY `fk_cliente_agendamento` (`cliente_id`),
  KEY `fk_agendamento_endereco` (`endereco_id`),
  KEY `fk_telefone_agendamento` (`telefone_id`),
  CONSTRAINT `fk_agendamento_endereco` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`),
  CONSTRAINT `fk_cliente_agendamento` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_etapa_agendamento` FOREIGN KEY (`etapa_id`) REFERENCES `etapa` (`id`),
  CONSTRAINT `fk_telefone_agendamento` FOREIGN KEY (`telefone_id`) REFERENCES `telefone` (`id`),
  CONSTRAINT `fk_usuario_agendamento` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento`
--

INSERT INTO `agendamento` VALUES (17,'Ajuste de Terno','2024-05-09 09:00:00','2024-05-19 10:30:00','Rua A, 123','Ajuste nas mangas e barra do terno.',2,1,1,1,NULL,NULL),(18,'Conserto de Calça','2024-05-09 09:00:00','2024-05-19 12:00:00','Avenida B, 456','Reparação no bolso e ajuste na cintura.',3,1,2,1,NULL,NULL),(19,'Confecção de Vestido','2024-05-09 09:00:00','2024-05-19 16:00:00','Rua C, 789','Medida e confecção de vestido sob medida.',2,1,3,1,NULL,NULL),(20,'Ajuste de Camisa','2024-05-09 09:00:00','2024-05-19 10:45:00','Avenida D, 101','Ajuste na costura e troca de botões.',2,1,4,1,NULL,NULL),(21,'Confecção de Calça','2024-05-09 09:00:00','2024-05-19 12:00:00','Rua E, 202','Confecção de calça sob medida.',3,1,5,1,NULL,NULL),(22,'Conserto de Jaqueta','2024-05-09 09:00:00','2024-05-19 14:30:00','Avenida F, 303','Reparação no zíper e ajuste nos punhos.',2,1,6,1,NULL,NULL),(23,'Ajuste de Saia','2024-05-09 09:00:00','2024-05-19 16:00:00','Rua G, 404','Ajuste no cós e comprimento.',3,1,7,1,NULL,NULL),(24,'Confecção de Blazer','2024-05-09 09:00:00','2024-05-19 11:00:00','Avenida H, 505','Medida e confecção de blazer.',4,1,8,1,NULL,NULL),(25,'Conserto de Macacão','2024-05-09 09:00:00','2024-05-19 11:30:00','Rua I, 606','Reparação na alça e ajuste na cintura.',3,1,9,1,NULL,NULL),(26,'Ajuste de Casaco','2024-05-09 09:00:00','2024-05-19 12:30:00','Avenida J, 707','Ajuste nas mangas e troca de botões.',2,1,10,1,NULL,NULL),(27,'Confecção de Saia','2024-05-09 09:00:00','2024-05-19 15:30:00','Rua K, 808','Medida e confecção de saia.',3,1,11,1,NULL,NULL),(28,'Conserto de Camisa','2024-05-09 09:00:00','2024-05-19 10:30:00','Avenida L, 909','Reparação na costura e ajuste no colarinho.',2,1,12,1,NULL,NULL),(29,'Ajuste de Calça','2024-05-09 09:00:00','2024-05-19 11:15:00','Rua M, 1010','Ajuste na cintura e comprimento.',3,1,13,1,NULL,NULL),(30,'Confecção de Camisa','2024-05-09 09:00:00','2024-05-19 12:30:00','Avenida N, 1111','Medida e confecção de camisa sob medida.',2,1,14,1,NULL,NULL),(31,'Conserto de Blazer','2024-05-09 09:00:00','2024-05-19 15:30:00','Rua O, 1212','Reparação na costura e ajuste nos ombros.',3,1,15,1,NULL,NULL),(32,'Ajuste de Terno','2024-05-09 09:00:00','2024-05-19 10:30:00','Avenida P, 1313','Ajuste nas mangas e barra do terno.',2,1,16,1,NULL,NULL),(33,'Reparo de Vestido','2024-05-09 09:00:00','2024-05-20 11:00:00','Rua Q, 1414','Reparação na bainha e ajuste no busto.',2,1,1,1,NULL,NULL),(34,'Ajuste de Camiseta','2024-05-09 09:00:00','2024-05-20 13:00:00','Avenida R, 1515','Ajuste nas mangas e cintura.',3,1,2,1,NULL,NULL),(35,'Confecção de Casaco','2024-05-09 09:00:00','2024-05-20 16:00:00','Rua S, 1616','Medida e confecção de casaco.',2,1,3,1,NULL,NULL),(36,'Reparo de Calça Jeans','2024-05-09 09:00:00','2024-05-20 10:45:00','Avenida T, 1717','Reparação no zíper e ajuste na perna.',2,1,4,1,NULL,NULL),(37,'Ajuste de Bermuda','2024-05-09 09:00:00','2024-05-20 12:00:00','Rua U, 1818','Ajuste na cintura e comprimento.',3,1,5,1,NULL,NULL),(38,'Confecção de Camiseta','2024-05-09 09:00:00','2024-05-20 14:30:00','Avenida V, 1919','Medida e confecção de camiseta.',2,1,6,1,NULL,NULL),(39,'Reparo de Blusa','2024-05-09 09:00:00','2024-05-20 16:00:00','Rua W, 2020','Reparação na costura e ajuste nos ombros.',3,1,7,1,NULL,NULL),(40,'Ajuste de Paletó','2024-05-09 09:00:00','2024-05-20 11:00:00','Avenida X, 2121','Ajuste nas mangas e no comprimento.',2,1,8,1,NULL,NULL),(41,'Confecção de Colete','2024-05-09 09:00:00','2024-05-20 11:30:00','Rua Y, 2222','Medida e confecção de colete.',3,1,9,1,NULL,NULL),(42,'Reparo de Macacão','2024-05-09 09:00:00','2024-05-20 12:30:00','Avenida Z, 2323','Reparação na costura e ajuste na cintura.',2,1,10,1,NULL,NULL),(43,'Ajuste de Casaco','2024-05-09 09:00:00','2024-05-20 15:30:00','Rua AA, 2424','Ajuste nas mangas e troca de botões.',3,1,11,1,NULL,NULL),(44,'Confecção de Terno','2024-05-09 09:00:00','2024-05-20 10:30:00','Avenida BB, 2525','Medida e confecção de terno.',2,1,12,1,NULL,NULL),(45,'Reparo de Saia','2024-05-09 09:00:00','2024-05-20 11:15:00','Rua CC, 2626','Reparação na bainha e ajuste na cintura.',3,1,13,1,NULL,NULL),(46,'Ajuste de Camisa Polo','2024-05-09 09:00:00','2024-05-20 12:30:00','Avenida DD, 2727','Ajuste nas mangas e colarinho.',2,1,14,1,NULL,NULL),(47,'Confecção de Macacão','2024-05-09 09:00:00','2024-05-20 15:30:00','Rua EE, 2828','Medida e confecção de macacão.',3,1,15,1,NULL,NULL),(48,'Reparo de Camisa Social','2024-05-09 09:00:00','2024-05-20 10:30:00','Avenida FF, 2929','Reparação na costura e ajuste no colarinho.',2,1,16,1,NULL,NULL),(49,'Ajuste de Terno','2024-06-09 09:00:00','2024-06-09 10:30:00','Rua A, 123','Ajuste nas mangas e barra do terno.',2,1,1,1,NULL,NULL),(50,'Conserto de Calça','2024-06-09 11:00:00','2024-06-09 12:00:00','Avenida B, 456','Reparação no bolso e ajuste na cintura.',3,1,2,1,NULL,NULL),(51,'Confecção de Vestido','2024-06-09 14:00:00','2024-06-09 16:00:00','Rua C, 789','Medida e confecção de vestido sob medida.',2,1,3,1,NULL,NULL),(52,'Ajuste de Camisa','2024-06-09 09:30:00','2024-06-09 10:45:00','Avenida D, 101','Ajuste na costura e troca de botões.',2,1,4,1,NULL,NULL),(53,'Confecção de Calça','2024-06-09 10:00:00','2024-06-09 12:00:00','Rua E, 202','Confecção de calça sob medida.',3,1,5,1,NULL,NULL),(54,'Conserto de Jaqueta','2024-06-09 13:00:00','2024-06-09 14:30:00','Avenida F, 303','Reparação no zíper e ajuste nos punhos.',2,1,6,1,NULL,NULL),(55,'Ajuste de Saia','2024-06-09 15:00:00','2024-06-09 16:00:00','Rua G, 404','Ajuste no cós e comprimento.',3,1,7,1,NULL,NULL),(56,'Confecção de Blazer','2024-06-09 09:00:00','2024-06-09 11:00:00','Avenida H, 505','Medida e confecção de blazer.',2,1,8,1,NULL,NULL),(57,'Conserto de Macacão','2024-06-09 10:00:00','2024-06-09 11:30:00','Rua I, 606','Reparação na alça e ajuste na cintura.',3,1,9,1,NULL,NULL),(58,'Ajuste de Casaco','2024-06-09 11:00:00','2024-06-09 12:30:00','Avenida J, 707','Ajuste nas mangas e troca de botões.',2,1,10,1,NULL,NULL),(59,'Confecção de Saia','2024-06-09 14:00:00','2024-06-09 15:30:00','Rua K, 808','Medida e confecção de saia.',3,1,11,1,NULL,NULL),(60,'Conserto de Camisa','2024-06-09 09:30:00','2024-06-09 10:30:00','Avenida L, 909','Reparação na costura e ajuste no colarinho.',2,1,12,1,NULL,NULL),(61,'Ajuste de Calça','2024-06-09 10:00:00','2024-06-09 11:15:00','Rua M, 1010','Ajuste na cintura e comprimento.',3,1,13,1,NULL,NULL),(62,'Confecção de Camisa','2024-06-09 11:00:00','2024-06-09 12:30:00','Avenida N, 1111','Medida e confecção de camisa sob medida.',2,1,14,1,NULL,NULL),(63,'Conserto de Blazer','2024-06-09 14:00:00','2024-06-09 15:30:00','Rua O, 1212','Reparação na costura e ajuste nos ombros.',3,1,15,1,NULL,NULL),(64,'Ajuste de Terno','2024-06-09 09:00:00','2024-06-09 10:30:00','Avenida P, 1313','Ajuste nas mangas e barra do terno.',2,1,16,1,NULL,NULL),(65,'Reparo de Vestido','2024-06-09 10:00:00','2024-06-09 11:00:00','Rua Q, 1414','Reparação na bainha e ajuste no busto.',2,1,1,1,NULL,NULL),(66,'Ajuste de Camiseta','2024-06-09 12:00:00','2024-06-09 13:00:00','Avenida R, 1515','Ajuste nas mangas e cintura.',3,1,2,1,NULL,NULL),(67,'Confecção de Casaco','2024-06-09 14:00:00','2024-06-09 16:00:00','Rua S, 1616','Medida e confecção de casaco.',2,1,3,1,NULL,NULL),(68,'Reparo de Calça Jeans','2024-06-09 09:30:00','2024-06-09 10:45:00','Avenida T, 1717','Reparação no zíper e ajuste na perna.',2,1,4,1,NULL,NULL),(69,'Ajuste de Bermuda','2024-06-09 11:00:00','2024-06-09 12:00:00','Rua U, 1818','Ajuste na cintura e comprimento.',3,1,5,1,NULL,NULL),(70,'Confecção de Camiseta','2024-06-09 13:00:00','2024-06-09 14:30:00','Avenida V, 1919','Medida e confecção de camiseta.',2,1,6,1,NULL,NULL),(71,'Reparo de Blusa','2024-06-09 15:00:00','2024-06-09 16:00:00','Rua W, 2020','Reparação na costura e ajuste nos ombros.',3,1,7,1,NULL,NULL),(72,'Ajuste de Paletó','2024-06-09 09:00:00','2024-06-09 11:00:00','Avenida X, 2121','Ajuste nas mangas e no comprimento.',2,1,8,1,NULL,NULL),(73,'Confecção de Colete','2024-06-09 10:00:00','2024-06-09 11:30:00','Rua Y, 2222','Medida e confecção de colete.',3,1,9,1,NULL,NULL),(74,'Reparo de Macacão','2024-06-09 11:00:00','2024-06-09 12:30:00','Avenida Z, 2323','Reparação na costura e ajuste na cintura.',2,1,10,1,NULL,NULL),(75,'Ajuste de Casaco','2024-06-09 14:00:00','2024-06-09 15:30:00','Rua AA, 2424','Ajuste nas mangas e troca de botões.',3,1,11,1,NULL,NULL),(76,'Confecção de Terno','2024-06-09 09:30:00','2024-06-09 10:30:00','Avenida BB, 2525','Medida e confecção de terno.',2,1,12,1,NULL,NULL),(77,'Reparo de Saia','2024-06-09 10:00:00','2024-06-09 11:15:00','Rua CC, 2626','Reparação na bainha e ajuste na cintura.',3,1,13,1,NULL,NULL),(78,'Ajuste de Camisa Polo','2024-06-09 11:00:00','2024-06-09 12:30:00','Avenida DD, 2727','Ajuste nas mangas e colarinho.',2,1,14,1,NULL,NULL),(79,'Confecção de Macacão','2024-06-09 14:00:00','2024-06-09 15:30:00','Rua EE, 2828','Medida e confecção de macacão.',3,1,15,1,NULL,NULL),(80,'Reparo de Camisa Social','2024-06-09 09:00:00','2024-06-09 10:30:00','Avenida FF, 2929','Reparação na costura e ajuste no colarinho.',2,1,16,1,NULL,NULL),(81,'Ajuste de Terno','2024-06-09 09:00:00','2024-06-09 10:30:00','Rua A, 123','Ajuste nas mangas e barra do terno.',2,1,1,1,NULL,NULL),(82,'Conserto de Calça','2024-06-09 11:00:00','2024-06-09 12:00:00','Avenida B, 456','Reparação no bolso e ajuste na cintura.',3,1,2,1,NULL,NULL),(83,'Confecção de Vestido','2024-06-09 14:00:00','2024-06-09 16:00:00','Rua C, 789','Medida e confecção de vestido sob medida.',2,1,3,1,NULL,NULL),(84,'Ajuste de Camisa','2024-06-09 09:30:00','2024-06-09 10:45:00','Avenida D, 101','Ajuste na costura e troca de botões.',2,1,4,1,NULL,NULL),(85,'Confecção de Calça','2024-06-09 10:00:00','2024-06-09 12:00:00','Rua E, 202','Confecção de calça sob medida.',3,1,5,1,NULL,NULL),(86,'Conserto de Jaqueta','2024-06-09 13:00:00','2024-06-09 14:30:00','Avenida F, 303','Reparação no zíper e ajuste nos punhos.',2,1,6,1,NULL,NULL),(87,'Ajuste de Saia','2024-06-09 15:00:00','2024-06-09 16:00:00','Rua G, 404','Ajuste no cós e comprimento.',3,1,7,1,NULL,NULL),(88,'Confecção de Blazer','2024-06-09 09:00:00','2024-06-09 11:00:00','Avenida H, 505','Medida e confecção de blazer.',2,1,8,1,NULL,NULL),(89,'Conserto de Macacão','2024-06-09 10:00:00','2024-06-09 11:30:00','Rua I, 606','Reparação na alça e ajuste na cintura.',3,1,9,1,NULL,NULL),(90,'Ajuste de Casaco','2024-06-09 11:00:00','2024-06-09 12:30:00','Avenida J, 707','Ajuste nas mangas e troca de botões.',2,1,10,1,NULL,NULL),(91,'Confecção de Saia','2024-06-09 14:00:00','2024-06-09 15:30:00','Rua K, 808','Medida e confecção de saia.',3,1,11,1,NULL,NULL),(92,'Conserto de Camisa','2024-06-09 09:30:00','2024-06-09 10:30:00','Avenida L, 909','Reparação na costura e ajuste no colarinho.',2,1,12,1,NULL,NULL),(93,'Ajuste de Calça','2024-06-09 10:00:00','2024-06-09 11:15:00','Rua M, 1010','Ajuste na cintura e comprimento.',3,1,13,1,NULL,NULL),(94,'Confecção de Camisa','2024-06-09 11:00:00','2024-06-09 12:30:00','Avenida N, 1111','Medida e confecção de camisa sob medida.',2,1,14,1,NULL,NULL),(95,'Conserto de Blazer','2024-06-09 14:00:00','2024-06-09 15:30:00','Rua O, 1212','Reparação na costura e ajuste nos ombros.',3,1,15,1,NULL,NULL),(96,'Ajuste de Terno','2024-06-09 09:00:00','2024-06-09 10:30:00','Avenida P, 1313','Ajuste nas mangas e barra do terno.',2,1,16,1,NULL,NULL),(97,'Reparo de Vestido','2024-06-09 10:00:00','2024-06-09 11:00:00','Rua Q, 1414','Reparação na bainha e ajuste no busto.',2,1,1,1,NULL,NULL),(98,'Ajuste de Camiseta','2024-06-09 12:00:00','2024-06-09 13:00:00','Avenida R, 1515','Ajuste nas mangas e cintura.',3,1,2,1,NULL,NULL),(99,'Confecção de Casaco','2024-06-09 14:00:00','2024-06-09 16:00:00','Rua S, 1616','Medida e confecção de casaco.',2,1,3,1,NULL,NULL),(100,'Reparo de Calça Jeans','2024-06-09 09:30:00','2024-06-09 10:45:00','Avenida T, 1717','Reparação no zíper e ajuste na perna.',2,1,4,0,NULL,NULL),(101,'Ajuste de Bermuda','2024-06-09 11:00:00','2024-06-09 12:00:00','Rua U, 1818','Ajuste na cintura e comprimento.',3,1,5,1,NULL,NULL),(102,'Confecção de Camiseta','2024-06-09 13:00:00','2024-06-09 14:30:00','Avenida V, 1919','Medida e confecção de camiseta.',2,1,6,1,NULL,NULL),(103,'Reparo de Blusa','2024-06-09 15:00:00','2024-06-09 16:00:00','Rua W, 2020','Reparação na costura e ajuste nos ombros.',3,1,7,1,NULL,NULL),(104,'Ajuste de Paletó','2024-06-09 09:00:00','2024-06-09 11:00:00','Avenida X, 2121','Ajuste nas mangas e no comprimento.',2,1,8,1,NULL,NULL),(105,'Confecção de Colete','2024-06-09 10:00:00','2024-06-09 11:30:00','Rua Y, 2222','Medida e confecção de colete.',3,1,9,1,NULL,NULL),(106,'Reparo de Macacão','2024-06-09 11:00:00','2024-06-09 12:30:00','Avenida Z, 2323','Reparação na costura e ajuste na cintura.',2,1,10,1,NULL,NULL),(107,'Ajuste de Casaco','2024-06-09 14:00:00','2024-06-09 15:30:00','Rua AA, 2424','Ajuste nas mangas e troca de botões.',3,1,11,1,NULL,NULL),(108,'Confecção de Terno','2024-06-09 09:30:00','2024-06-09 10:30:00','Avenida BB, 2525','Medida e confecção de terno.',2,1,12,1,NULL,NULL),(109,'Reparo de Saia','2024-06-09 10:00:00','2024-06-09 11:15:00','Rua CC, 2626','Reparação na bainha e ajuste na cintura.',3,1,13,1,NULL,NULL),(110,'Ajuste de Camisa Polo','2024-06-09 11:00:00','2024-06-09 12:30:00','Avenida DD, 2727','Ajuste nas mangas e colarinho.',2,1,14,1,NULL,NULL),(111,'Confecção de Macacão','2024-06-09 14:00:00','2024-06-09 15:30:00','Rua EE, 2828','Medida e confecção de macacão.',3,1,15,1,NULL,NULL),(112,'Reparo de Terno','2024-06-09 09:00:00','2024-06-09 10:30:00','Avenida FF, 2929','Reparação na costura e ajuste no colarinho.',2,1,16,1,NULL,NULL),(113,'Ajuste de Terno','2024-05-09 09:00:00','2024-05-19 10:30:00',NULL,'Ajuste nas mangas e barra do terno.',2,1,3,0,NULL,NULL),(114,'Agendamento','2024-08-09 10:55:00','2024-08-09 10:55:00',NULL,NULL,1,1,1,1,NULL,NULL),(115,'Agendamento','2024-08-08 11:22:00','2024-08-08 11:22:00',NULL,NULL,1,1,1,1,1,NULL),(116,'Agendamento','2024-08-16 10:55:00','2024-08-16 10:55:00',NULL,NULL,1,1,1,1,NULL,NULL),(117,'Agendamento','2024-08-16 10:55:00','2024-08-16 10:55:00',NULL,NULL,1,1,1,1,NULL,NULL),(118,'Agendamento','2024-08-22 10:55:00','2024-08-22 10:55:00',NULL,NULL,1,1,1,1,NULL,NULL),(119,'Agendamento','2024-08-30 10:55:00','2024-08-30 10:55:00',NULL,NULL,1,1,1,1,NULL,NULL),(120,'Agendamento','2024-08-24 10:55:00','2024-08-30 10:55:00',NULL,NULL,1,1,1,1,NULL,NULL),(121,'Agendamento','2024-08-24 10:55:00','2024-08-24 10:55:00',NULL,NULL,1,1,1,1,NULL,NULL),(122,'Agendamento','2024-09-01 10:55:00','2024-08-22 10:55:00',NULL,NULL,4,1,1,1,2,2),(123,'Agendamento','2024-08-07 16:00:00','2024-08-07 16:00:00',NULL,NULL,2,1,1,1,1,NULL),(124,'Agendamento','2024-08-13 16:13:00','2024-08-13 16:13:00',NULL,NULL,4,1,1,1,1,NULL),(125,'Agendamento','2024-08-14 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(126,'Agendamento','2024-08-20 16:00:00','2024-08-20 16:00:00',NULL,NULL,1,1,1,1,NULL,NULL),(127,'Agendamento','2024-08-06 16:13:00','2024-08-13 16:13:00',NULL,NULL,4,1,1,1,NULL,NULL),(128,'Agendamento','2024-08-06 16:13:00','2024-08-06 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(129,'Agendamento','2024-08-13 16:13:00','2024-07-31 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(130,'Agendamento','2024-08-13 16:13:00','2024-07-31 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(131,'Agendamento','2024-08-13 16:13:00','2024-07-31 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(132,'Agendamento','2024-07-31 16:13:00','2024-08-13 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(133,'Agendamento','2024-07-31 16:13:00','2024-08-13 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(134,'Agendamento','2024-08-03 16:00:00','2024-08-07 16:00:00',NULL,NULL,1,1,1,1,NULL,NULL),(135,'Agendamento','2024-08-09 16:00:00','2024-08-07 16:00:00',NULL,NULL,1,1,1,1,NULL,NULL),(136,'Agendamento','2024-08-16 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(137,'Agendamento','2024-08-14 16:13:00','2024-08-31 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(138,'Agendamento','2024-08-15 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(139,'Agendamento','2024-08-08 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(140,'Agendamento','2024-08-08 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(141,'Agendamento','2024-08-08 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(142,'Agendamento','2024-08-13 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(143,'Agendamento','2024-08-13 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(144,'Agendamento','2024-08-06 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(145,'Agendamento','2024-08-06 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(146,'Agendamento','2024-08-15 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(147,'Agendamento','2024-08-16 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(148,'Agendamento','2024-08-13 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(149,'Agendamento','2024-08-06 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(150,'Agendamento','2024-08-09 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(151,'Agendamento','2024-08-09 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(152,'Agendamento','2024-08-21 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(153,'Agendamento','2024-08-21 16:13:00','2024-08-21 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(154,'Agendamento','2024-08-21 16:13:00','2024-08-21 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(155,'Agendamento','2024-08-21 16:13:00','2024-08-21 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(156,'Agendamento','2024-08-01 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(157,'Agendamento','2024-08-01 16:13:00','2024-08-14 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(158,'Agendamento','2024-08-21 16:13:00','2024-08-08 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(159,'Agendamento','2024-08-09 16:00:00','2024-08-07 16:00:00',NULL,NULL,1,1,1,1,NULL,NULL),(160,'Agendamento','2024-08-10 10:25:00','2024-08-10 10:25:00',NULL,NULL,1,1,1,1,NULL,NULL),(161,'Agendamento','2024-08-13 09:30:00','2024-08-13 09:30:00',NULL,NULL,1,1,1,1,NULL,NULL),(162,'Agendamento','2024-08-03 09:55:00','2024-08-03 09:55:00',NULL,NULL,1,1,1,1,NULL,NULL),(163,'Agendamento','2024-08-14 10:06:00','2024-08-14 10:06:00',NULL,NULL,1,1,1,1,NULL,NULL),(164,'Agendamento','2024-08-09 10:19:00','2024-08-09 10:19:00',NULL,NULL,1,1,1,1,NULL,NULL),(165,'Agendamento','2024-08-14 10:26:00','2024-08-14 10:26:00',NULL,NULL,1,1,1,1,NULL,NULL),(166,'Agendamento','2024-08-14 10:30:00','2024-08-14 10:30:00',NULL,NULL,1,1,1,1,NULL,NULL),(167,'Agendamento','2024-08-19 13:35:00','2024-08-19 13:35:00',NULL,NULL,1,1,1,1,NULL,NULL),(168,'Agendamento','2024-08-14 10:43:00','2024-08-14 10:43:00',NULL,NULL,1,1,1,1,NULL,NULL),(169,'Agendamento','2024-08-21 10:53:00','2024-08-21 10:53:00',NULL,NULL,1,1,1,1,NULL,NULL),(170,'Agendamento','2024-08-14 10:59:00','2024-08-09 10:59:00',NULL,NULL,2,1,1,1,NULL,NULL),(171,'Agendamento','2024-08-14 10:59:00','2024-08-14 10:59:00',NULL,NULL,2,1,1,1,NULL,NULL),(172,'Agendamento','2024-08-14 10:59:00','2024-08-14 10:59:00',NULL,NULL,2,1,1,1,NULL,NULL),(173,'Agendamento','2024-08-14 10:59:00','2024-08-14 10:59:00',NULL,NULL,2,1,1,1,NULL,NULL),(174,'Agendamento','2024-08-14 10:59:00','2024-08-14 10:59:00',NULL,NULL,2,1,1,1,NULL,NULL),(175,'Agendamento','2024-08-14 10:59:00','2024-08-15 10:59:00',NULL,NULL,2,1,1,1,NULL,NULL),(176,'Agendamento','2024-08-07 10:59:00','2024-08-07 10:59:00',NULL,NULL,2,1,1,1,NULL,NULL),(177,'Agendamento','2024-08-07 10:59:00','2024-08-09 10:59:00',NULL,NULL,2,1,1,1,NULL,NULL),(178,'Agendamento','2024-08-14 10:59:00','2024-08-22 10:59:00',NULL,NULL,1,1,1,1,NULL,NULL),(179,'Agendamento','2024-08-14 10:59:00','2024-08-14 10:59:00',NULL,NULL,2,1,1,1,NULL,NULL),(180,'Agendamento','2024-08-14 10:59:00','2024-08-14 10:59:00',NULL,NULL,2,1,1,1,NULL,NULL),(181,'Agendamento','2024-08-14 10:59:00','2024-08-15 10:59:00',NULL,NULL,1,1,1,1,NULL,NULL),(182,'Agendamento','2024-08-09 13:13:00','2024-08-09 13:13:00',NULL,NULL,2,1,1,1,NULL,NULL),(183,'Agendamento','2024-08-21 13:24:00','2024-08-21 13:24:00',NULL,NULL,1,1,1,1,NULL,NULL),(184,'Agendamento','2024-08-24 13:25:00','2024-08-24 13:25:00',NULL,NULL,2,1,1,1,NULL,NULL),(185,'Agendamento','2024-07-31 20:23:00','2024-07-31 20:23:00',NULL,NULL,2,1,1,1,NULL,NULL),(186,'Agendamento','2024-08-06 16:13:00','2024-08-13 16:13:00',NULL,NULL,3,1,1,1,NULL,NULL),(187,'Agendamento','2024-08-06 16:13:00','2024-08-13 16:13:00',NULL,NULL,4,1,1,1,NULL,NULL),(188,'Agendamento','2024-08-06 16:13:00','2024-08-13 16:13:00',NULL,NULL,1,1,1,1,NULL,NULL),(189,'Agendamento','2024-09-24 23:21:00','2024-09-24 23:21:00',NULL,NULL,3,1,1,1,1,2),(190,'Agendamento','2024-09-18 00:38:00','2024-09-18 00:38:00',NULL,NULL,2,1,1,1,1,3),(191,'Agendamento','2024-09-17 08:32:00','2024-09-17 08:32:00',NULL,NULL,1,1,1,1,1,3),(192,'Agendamento','2024-09-18 09:23:00','2024-09-18 09:23:00',NULL,NULL,2,1,1,1,1,2),(193,'Agendamento','2024-09-05 18:30:00','2024-09-05 18:30:00',NULL,NULL,2,1,1,1,1,3),(194,'Agendamento','2024-09-18 16:24:00','2024-09-18 16:24:00',NULL,NULL,2,1,1,1,1,2),(195,'Agendamento','2024-09-10 16:52:00','2024-09-10 16:52:00',NULL,NULL,2,1,1,1,2,3),(196,'Agendamento','2024-10-10 11:10:00','2024-10-10 11:10:00',NULL,NULL,1,1,1,1,1,2),(197,'Agendamento','2024-10-17 11:21:00','2024-10-17 11:21:00',NULL,NULL,1,1,1,1,1,2),(198,'Agendamento','2024-10-25 11:33:00','2024-10-25 11:33:00',NULL,NULL,1,1,1,1,1,2),(199,'Agendamento','2024-10-23 11:37:00','2024-10-23 11:37:00',NULL,NULL,1,1,1,1,1,2),(200,'Agendamento','2024-10-03 11:40:00','2024-10-03 11:40:00',NULL,NULL,2,1,1,1,18,13),(201,'Agendamento','2024-10-25 13:31:00','2024-10-25 13:31:00',NULL,NULL,1,1,1,1,1,2),(202,'Agendamento','2024-10-25 13:43:00','2024-10-25 13:43:00',NULL,NULL,2,1,1,1,1,2),(203,'Agendamento','2024-10-22 19:07:00','2024-10-22 19:07:00',NULL,NULL,1,1,1,1,1,2),(204,'Agendamento','2024-10-17 17:10:00','2024-10-17 17:10:00',NULL,NULL,1,1,1,1,1,2),(205,'Agendamento','2024-10-02 16:33:00','2024-10-02 16:33:00',NULL,NULL,1,1,1,1,1,2),(206,'Agendamento','2024-10-09 19:50:00','2024-10-09 19:50:00',NULL,NULL,1,1,1,1,18,13),(207,'Agendamento','2024-10-10 18:00:00','2024-10-10 18:00:00',NULL,NULL,2,1,1,1,1,2),(208,'Agendamento','2024-10-03 19:14:00','2024-10-03 19:14:00',NULL,NULL,2,1,1,1,1,2),(209,'Agendamento','2024-11-20 11:01:00','2024-11-20 11:01:00',NULL,NULL,1,1,1,0,1,2),(210,'Agendamento','2024-11-13 17:00:00','2024-11-13 17:00:00',NULL,NULL,1,1,4,0,33,27),(211,'Agendamento','2024-11-14 17:04:00','2024-11-14 17:04:00',NULL,NULL,2,1,1,0,18,29),(212,'Agendamento','2024-11-13 19:35:00','2024-11-13 19:35:00',NULL,NULL,1,1,1,0,1,2),(213,'Agendamento','2024-11-14 17:03:00','2024-11-14 17:03:00',NULL,NULL,2,1,1,1,1,32),(214,'Agendamento','2024-11-21 17:07:00','2024-11-21 17:07:00',NULL,NULL,1,1,1,1,1,3),(215,'Agendamento','2024-12-05 17:10:00','2024-12-05 17:10:00',NULL,NULL,1,1,1,1,1,3),(216,'Agendamento','2024-11-29 17:14:00','2024-11-29 17:14:00',NULL,NULL,1,1,1,1,1,2),(217,'Agendamento','2024-12-04 17:17:00','2024-12-04 17:17:00',NULL,NULL,1,1,1,1,1,2),(218,'Agendamento','2024-11-16 17:26:00','2024-11-16 17:26:00',NULL,NULL,1,1,1,1,1,2),(219,'Agendamento','2024-12-06 18:45:00','2024-12-06 18:45:00',NULL,NULL,1,1,1,1,1,2),(220,'Agendamento','2024-11-12 10:32:00','2024-11-12 10:32:00',NULL,NULL,1,1,3,0,36,31),(221,'Agendamento','2024-11-14 10:36:00','2024-11-14 10:36:00',NULL,NULL,2,1,1,1,1,2),(222,'Agendamento','2024-11-28 10:39:00','2024-11-28 10:39:00',NULL,NULL,1,1,3,1,1,2),(223,'Agendamento','2024-11-29 12:18:00','2024-11-29 12:18:00',NULL,NULL,1,1,1,1,18,2),(224,'Agendamento','2024-11-06 12:19:00','2024-11-06 12:19:00',NULL,NULL,1,1,1,0,18,2),(225,'Agendamento','2024-11-08 12:21:00','2024-11-08 12:21:00',NULL,NULL,1,1,1,0,1,2),(226,'Agendamento','2024-11-28 14:45:00','2024-11-28 14:45:00',NULL,NULL,1,1,1,1,1,2),(227,'Agendamento','2024-11-01 11:09:00','2024-11-01 11:09:00',NULL,NULL,2,1,1,0,1,3),(228,'Agendamento','2024-11-14 14:04:00','2024-11-14 14:04:00',NULL,NULL,1,1,1,1,1,2),(229,'Agendamento','2024-11-14 14:32:00','2024-11-14 14:32:00',NULL,NULL,1,1,1,1,2,32),(230,'Agendamento','2024-11-21 18:55:00','2024-11-21 18:55:00',NULL,NULL,1,1,19,1,35,29),(231,'Agendamento','2024-11-12 09:56:00','2024-11-12 09:56:00',NULL,NULL,1,1,4,1,33,27),(232,'Agendamento','2024-11-13 10:00:00','2024-11-13 10:00:00',NULL,NULL,2,1,4,1,33,27),(233,'Agendamento','2024-11-13 10:03:00','2024-11-13 10:03:00',NULL,NULL,2,1,4,1,33,27),(234,'Agendamento','2024-11-05 10:11:00','2024-11-05 10:11:00',NULL,NULL,1,1,4,1,33,27),(235,'Agendamento','2024-11-13 12:19:00','2024-11-13 12:19:00',NULL,NULL,1,1,5,1,38,33),(236,'Agendamento','2024-11-05 14:05:00','2024-11-05 14:05:00',NULL,NULL,1,1,4,1,33,27),(237,'Agendamento','2024-11-13 14:06:00','2024-11-13 14:06:00',NULL,NULL,1,1,95,1,40,35),(238,'Agendamento','2024-11-20 14:08:00','2024-11-20 14:08:00',NULL,NULL,1,1,6,1,41,36),(239,'Agendamento','2024-11-08 16:18:00','2024-11-08 16:18:00',NULL,NULL,2,1,4,1,33,27),(240,'Agendamento','2024-11-15 16:49:00','2024-11-15 16:49:00',NULL,NULL,1,1,6,1,41,36),(241,'Agendamento','2024-11-15 20:18:00','2024-11-15 20:18:00',NULL,NULL,1,1,4,1,33,27),(242,'Agendamento','2024-11-26 11:16:00','2024-11-26 11:16:00',NULL,NULL,1,1,5,1,38,33),(243,'Agendamento','2024-11-19 13:57:00','2024-11-19 13:57:00',NULL,NULL,1,1,4,1,33,27),(244,'Agendamento','2024-11-27 14:01:00','2024-11-27 14:01:00',NULL,NULL,1,1,4,1,33,27),(245,'Agendamento','2024-11-21 14:08:00','2024-11-21 14:08:00',NULL,NULL,1,1,4,1,33,27),(246,'Agendamento','2024-11-21 14:57:00','2024-11-21 14:57:00',NULL,NULL,1,1,4,1,33,27),(247,'Agendamento','2024-11-21 17:29:00','2024-11-21 17:29:00',NULL,NULL,1,1,4,1,33,27),(248,'Agendamento','2024-11-21 18:22:00','2024-11-21 18:22:00',NULL,NULL,1,1,4,1,33,27),(249,'Agendamento','2024-12-11 16:49:00','2024-12-11 16:49:00',NULL,NULL,1,1,4,1,33,27),(250,'Agendamento','2024-12-24 16:52:00','2024-12-24 16:52:00',NULL,NULL,1,1,4,1,33,27),(251,'Agendamento','2024-12-18 16:55:00','2024-12-18 16:55:00',NULL,NULL,1,1,6,1,41,36),(252,'Agendamento','2024-12-12 16:59:00','2024-12-12 16:59:00',NULL,NULL,1,1,6,1,41,36),(253,'Agendamento','2024-12-19 17:00:00','2024-12-19 17:00:00',NULL,NULL,1,1,6,1,41,36),(254,'Agendamento','2024-12-12 17:04:00','2024-12-12 17:04:00',NULL,NULL,1,1,10,1,45,40),(255,'Agendamento','2024-12-11 17:14:00','2024-12-11 17:14:00',NULL,NULL,1,1,5,1,38,33),(256,'Agendamento','2024-12-17 17:31:00','2024-12-17 17:31:00',NULL,NULL,1,1,4,1,33,27),(257,'Agendamento','2024-12-11 21:39:00','2024-12-11 21:39:00',NULL,NULL,1,1,5,1,38,33),(258,'Agendamento','2024-12-19 17:45:00','2024-12-19 17:45:00',NULL,NULL,1,1,5,1,38,33),(259,'Agendamento','2024-12-13 19:24:00','2024-12-13 19:24:00',NULL,NULL,1,1,5,1,38,33),(260,'Agendamento','2024-12-13 19:59:00','2024-12-13 19:59:00',NULL,NULL,1,1,5,1,38,33),(261,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(262,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(263,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(264,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(265,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(266,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(267,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(268,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(269,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(270,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(271,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(272,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(273,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(274,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(275,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(276,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(277,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(278,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(279,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(280,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(281,'Agendamento','2024-12-13 21:55:00','2024-12-13 21:55:00',NULL,NULL,1,1,5,1,38,33),(282,'Agendamento','2024-12-14 21:57:00','2024-12-14 21:57:00',NULL,NULL,1,1,5,1,38,33),(283,'Agendamento','2024-12-14 21:57:00','2024-12-14 21:57:00',NULL,NULL,1,1,5,1,38,33),(284,'Agendamento','2024-12-14 21:57:00','2024-12-14 21:57:00',NULL,NULL,1,1,5,1,38,33),(285,'Agendamento','2024-12-14 21:57:00','2024-12-14 21:57:00',NULL,NULL,1,1,5,1,38,33),(286,'Agendamento','2024-12-20 10:16:00','2024-12-20 10:16:00',NULL,NULL,1,1,5,1,38,33),(287,'Agendamento','2024-12-12 10:17:00','2024-12-12 10:17:00',NULL,NULL,1,1,5,1,38,33),(288,'Agendamento','2024-12-13 17:31:00','2024-12-13 17:31:00',NULL,NULL,1,1,5,1,38,33),(289,'Agendamento','2024-12-14 18:31:00','2024-12-14 18:31:00',NULL,NULL,1,1,5,1,38,33),(290,'Agendamento','2024-12-13 19:25:00','2024-12-13 19:25:00',NULL,NULL,1,1,5,1,38,33);
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`askyu`@`%`*/ /*!50003 TRIGGER `tg_agendamento_update` AFTER UPDATE ON `agendamento` FOR EACH ROW BEGIN

IF OLD.etapa_id <> NEW.etapa_id THEN
    INSERT INTO log_agendamento VALUES 
    (default, OLD.id, OLD.data_inicio, OLD.data_fim, OLD.localizacao, OLD.descricao, OLD.etapa_id, OLD.usuario_id, OLD.cliente_id);
END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `dt_nasc` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `responsavel_id` int DEFAULT NULL,
  `usuario_id` int NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `responsavel` int DEFAULT NULL,
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`usuario_id`),
  KEY `fk_responsavel` (`responsavel_id`),
  KEY `fk_cliente_usuario` (`usuario_id`),
  CONSTRAINT `fk_cliente_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_responsavel` FOREIGN KEY (`responsavel_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` VALUES (1,'Carlos','Joarez',NULL,'carlos.joarez@gmail.com',NULL,1,0,NULL,'2024-06-09 19:54:35'),(2,'Lucas','Silva','1990-01-15','lucas.silva@example.com',1,1,0,NULL,'2024-06-09 19:54:35'),(3,'Mariana','Santos','1985-03-22','mariana.santos@example.com',1,1,0,NULL,'2024-06-09 19:54:35'),(4,'Lucas','Albertini','1992-07-30','mariana.santos@example.com',1,1,1,1,'2024-06-09 19:54:35'),(5,'Fernanda','Costa','1988-12-05','fernanda.costa@example.com',1,1,1,NULL,'2024-06-09 19:54:35'),(6,'Roberto','Souza','1979-08-14','roberto.souza@example.com',1,1,1,NULL,'2024-06-09 19:54:35'),(7,'Patricia','Almeida','1995-04-10','patricia.almeida@example.com',NULL,1,0,NULL,'2024-06-09 19:54:35'),(8,'João','Ferreira','1982-09-21','joao.ferreira@example.com',NULL,1,1,NULL,'2024-06-09 19:54:35'),(9,'Camila','Ribeiro','1990-11-11','camila.ribeiro@example.com',NULL,1,1,NULL,'2024-06-09 19:54:35'),(10,'Ricardo','Lima','1983-06-25','ricardo.lima@example.com',NULL,1,1,NULL,'2024-06-09 19:54:35'),(11,'Ana','Martins','1998-02-28','ana.martins@example.com',NULL,1,0,NULL,'2024-06-09 19:54:35'),(12,'Gustavo','Rocha','1991-05-17','gustavo.rocha@example.com',NULL,1,1,NULL,'2024-06-09 19:54:35'),(13,'Leticia','Carvalho','1987-10-09','leticia.carvalho@example.com',NULL,1,0,NULL,'2024-06-09 19:54:35'),(14,'Pedro','Moraez','1993-03-15','pedro.moraes@example.com',NULL,1,1,NULL,'2024-06-09 19:54:35'),(15,'Tatiana','Barbosa','1986-01-30','tatiana.barbosa@example.com',NULL,1,1,NULL,'2024-06-09 19:54:35'),(16,'Rafael','Mendes','1994-07-19','rafael.mendes@example.com',NULL,1,1,NULL,'2024-06-09 19:54:35'),(17,'Ana','Silva','1985-06-15','ana.silva@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(18,'Bruno','Souza','1990-04-22','bruno.souza@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(19,'Carlos','Pereira','1978-11-08','carlos.pereira@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(20,'Daniela','Oliveira','1982-03-17','daniela.oliveira@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(21,'Eduardo','Almeida','1995-09-30','eduardo.almeida@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(22,'Fernanda','Gomes','1988-07-25','fernanda.gomes@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(23,'Gustavo','Ribeiro','1979-12-05','gustavo.ribeiro@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(24,'Helena','Fernandes','1992-02-14','helena.fernandes@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(25,'Igor','Castro','1987-08-19','igor.castro@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(26,'Juliana','Mendes','1994-01-12','juliana.mendes@example.com',NULL,1,0,NULL,'2024-06-09 00:00:00'),(27,'Lucas','Araujo','1983-05-03','lucas.araujo@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(28,'José ','Santos ',NULL,'jose.almeida@gmail.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(29,'Nicolas','Martins','1986-06-29','nicolas.martins@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(30,'Patricia','Rocha','1993-11-15','patricia.rocha@example.com',NULL,1,0,NULL,'2024-06-09 00:00:00'),(31,'Rafael','Silveira','1980-04-10','rafael.silveira@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(32,'Tatiana','Cardoso','1984-09-07','tatiana.cardoso@example.com',NULL,1,0,NULL,'2024-06-09 00:00:00'),(33,'Pedro','Lima','1987-03-15','pedro.lima@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(34,'Lara','Santos','1992-08-27','lara.santos@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(35,'Diego','Costa','1985-05-19','diego.costa@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(36,'Alice','Nascimento','1990-12-10','alice.nascimento@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(37,'Fernando','Moraes','1979-09-05','fernando.moraes@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(38,'Renata','Carvalho','1993-11-11','renata.carvalho@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(39,'André','Gonçalves','1984-07-07','andre.goncalves@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(40,'Sara','Vieira','1986-04-03','sara.vieira@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(41,'Rodrigo','Neves','1982-01-17','rodrigo.neves@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(42,'Marcela','Teixeira','1988-11-22','marcela.teixeira@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(43,'Vitor','Freitas','1977-06-01','vitor.freitas@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(44,'Carla','Macedo','1991-10-14','carla.macedo@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(45,'Leandro','Campos','1983-08-09','leandro.campos@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(46,'Bárbara','Ramos','1980-02-20','barbara.ramos@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(47,'Thiago','Moreira','1995-12-25','thiago.moreira@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(48,'Vanessa','Alves','1978-05-06','vanessa.alves@example.com',NULL,1,1,NULL,'2024-06-09 00:00:00'),(49,'Ana','Silva','1985-06-15','ana.silva@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(50,'Bruno','Souza','1990-04-22','bruno.souza@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(51,'Carlos','Pereira','1978-11-08','carlos.pereira@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(52,'Daniela','Oliveira','1982-03-17','daniela.oliveira@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(53,'Eduardo','Almeida','1995-09-30','eduardo.almeida@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(54,'Fernanda','Gomes','1988-07-25','fernanda.gomes@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(55,'Gustavo','Ribeiro','1979-12-05','gustavo.ribeiro@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(56,'Helena','Fernandes','1992-02-14','helena.fernandes@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(57,'Igor','Castro','1987-08-19','igor.castro@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(58,'Juliana','Mendes','1994-01-12','juliana.mendes@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(59,'Lucas','Araujo','1983-05-03','lucas.araujo@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(60,'Mariana','Barbosa','1991-10-21','mariana.barbosa@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(61,'Nicolas','Martins','1986-06-29','nicolas.martins@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(62,'Patricia','Rocha','1993-11-15','patricia.rocha@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(63,'Rafael','Silveira','1980-04-10','rafael.silveira@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(64,'Tatiana','Cardoso','1984-09-07','tatiana.cardoso@example.com',NULL,1,1,NULL,'2024-05-09 00:00:00'),(65,'dsadaasd','sadasd',NULL,'sadas',NULL,1,0,NULL,'2024-10-09 14:17:59'),(66,'Cesar','Bruno',NULL,'bruno@gmail.com',NULL,1,1,NULL,'2024-10-09 14:25:42'),(67,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-15 15:36:30'),(68,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-15 15:38:32'),(69,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-15 15:39:32'),(70,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-15 15:40:21'),(71,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-15 15:41:18'),(72,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-15 15:42:36'),(73,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-15 15:43:56'),(74,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-15 15:45:09'),(75,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,0,NULL,'2024-10-15 15:46:41'),(76,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-15 16:05:23'),(77,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-15 16:06:25'),(78,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-15 16:20:55'),(79,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-15 16:26:42'),(80,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-15 16:27:12'),(81,'Mariana','Santos',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-15 16:29:11'),(82,'Victor','Albertini',NULL,'carlos.joarez@gmail.com',NULL,1,1,NULL,'2024-10-15 16:31:12'),(83,'Carlos','Oliveira',NULL,'carlos.oliveira@example.com',NULL,1,1,NULL,'2024-10-15 18:29:12'),(84,'Victor','Albertini',NULL,'carlos.joarez@gmail.com',NULL,1,1,NULL,'2024-10-15 19:44:57'),(85,'Mariana','Santos ',NULL,'mariana.santos@example.com',NULL,1,1,NULL,'2024-10-16 08:55:53'),(86,'Victor','Albertini',NULL,'carlos.joarez@gmail.com',NULL,1,1,NULL,'2024-10-16 12:28:42'),(87,'Nomura','Joko',NULL,'nomura.joko@gmail.com',NULL,1,1,NULL,'2024-10-24 19:56:34'),(88,'Bruno','Almeida',NULL,'bruno.almeida@gmail.com',1,1,1,NULL,'2024-10-24 20:02:49'),(89,'Hamilton','Monte Negro',NULL,'hamilton.monte.negro@gmail.com',1,1,1,NULL,'2024-10-24 20:49:23'),(90,'José ','Almeida',NULL,'jose.almeida@gmail.com',1,1,1,NULL,'2024-10-24 20:55:53'),(91,'Mariana','Oliveira',NULL,'mariana.oliveira@example.com',51,1,1,NULL,'2024-10-24 20:58:25'),(92,'Carlos','Pereira',NULL,'carlos.pereira@example.com',1,1,1,NULL,'2024-10-25 00:43:21'),(93,'Carlos','Pereira',NULL,'carlos.pereira@example.com',1,1,1,NULL,'2024-10-25 00:49:37'),(94,'Carlos','Pereira',NULL,'carlos.pereira@example.com',1,1,1,NULL,'2024-10-25 00:50:54'),(95,'Carlos','Pereira',NULL,'carlos.pereira@example.com',1,1,1,NULL,'2024-10-25 00:52:57'),(96,'Luis','Alberke',NULL,'luis.alberke@example.com',1,1,1,NULL,'2024-10-25 00:53:24'),(97,'Nomura','Joko',NULL,'nomura.joko@gmail.com',NULL,1,0,NULL,'2024-10-25 22:27:42'),(98,'Carlos','Moreira',NULL,'carlos.alberke@example.com',1,1,1,NULL,'2024-10-29 13:53:28'),(99,'Mariana','Santos Silva',NULL,'mariana.santos@example.com',1,1,0,NULL,'2024-11-02 20:41:01'),(100,'Lucas','Alberke',NULL,'luis.alberke@example.com',1,1,0,NULL,'2024-11-02 21:07:06'),(101,'Victor','Albertini',NULL,'lucas.silva@example.com',1,1,1,NULL,'2024-11-02 21:29:55'),(102,'Kevin','Silva',NULL,'kevin.silva@gmail.com',1,1,0,NULL,'2024-11-14 09:33:53'),(103,'Victor','Albertini',NULL,'carlos.joarez@gmail.com',NULL,1,0,NULL,'2024-11-20 18:02:38'),(104,'Lucas','Joarez',NULL,'jose.almeida@gmail.com',4,1,1,NULL,'2024-11-20 18:07:00'),(105,'Carlos','Silva',NULL,'carlos.joarez@gmail.com',8,1,1,NULL,'2024-11-20 18:08:47'),(106,'Carlos','Santos',NULL,'carlos.joarez@gmail.com',8,1,1,NULL,'2024-11-20 18:13:01');

--
-- Table structure for table `colecao_tecido`
--

DROP TABLE IF EXISTS `colecao_tecido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colecao_tecido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tecido_id` int NOT NULL,
  `item_pedido_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `peca_id` int NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`tecido_id`,`item_pedido_id`,`cliente_id`,`usuario_id`,`peca_id`),
  KEY `fk_tecido_colecao_tecido` (`tecido_id`),
  KEY `fk_item_pedido_colecao_tecido` (`item_pedido_id`),
  KEY `fk_cliente_colecao_tecido` (`cliente_id`),
  KEY `fk_usuario_colecao_tecido` (`usuario_id`),
  KEY `fk_peca_colecao_tecido` (`peca_id`),
  CONSTRAINT `fk_cliente_colecao_tecido` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_item_pedido_colecao_tecido` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedido` (`id`),
  CONSTRAINT `fk_peca_colecao_tecido` FOREIGN KEY (`peca_id`) REFERENCES `peca` (`id`),
  CONSTRAINT `fk_tecido_colecao_tecido` FOREIGN KEY (`tecido_id`) REFERENCES `tecido` (`id`),
  CONSTRAINT `fk_usuario_colecao_tecido` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colecao_tecido`
--

INSERT INTO `colecao_tecido` VALUES (60,20001,102,4,1,100,1),(61,20001,103,8,1,200,1),(62,20001,104,4,1,200,1),(63,20000,105,4,1,100,1),(64,20001,106,8,1,100,1),(65,20001,107,10,1,100,1),(66,20002,107,10,1,100,1),(67,20000,107,10,1,100,1),(68,20006,108,5,1,200,1),(69,20002,108,5,1,200,1),(70,20002,109,5,1,300,1),(71,20001,109,5,1,300,1),(72,20000,110,12,1,200,1),(73,20006,110,12,1,200,1),(74,20000,111,5,1,200,1),(75,20006,111,5,1,200,1);

--
-- Table structure for table `complemento`
--

DROP TABLE IF EXISTS `complemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complemento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `endereco_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKep1rwok3mm2xerhy95an8sgrt` (`endereco_id`),
  CONSTRAINT `FKep1rwok3mm2xerhy95an8sgrt` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complemento`
--


--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cep` varchar(255) DEFAULT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `localidade` varchar(255) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `usuario_id` int NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `cliente_id` int DEFAULT NULL,
  `cidade` varchar(150) DEFAULT NULL,
  `numero` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`,`usuario_id`),
  KEY `fk_endereco_usuario` (`usuario_id`),
  KEY `fk_endereco_cliente` (`cliente_id`),
  CONSTRAINT `fk_endereco_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_endereco_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

INSERT INTO `endereco` VALUES (1,'12345674','Rua Exemplo','Barramas',NULL,'SP',1,0,1,'Cidade Exemplo','123'),(2,'12345678','Rua Exemplo - Exemplo','Paulista',NULL,'SP',1,1,1,'Cidade Exemplo','123'),(3,'12345-678','Rua Exemplo','Centro','Cidade Exemplo','SP',1,0,1,'Cidade Exemplo','123'),(4,'03239193','Alameda Santos','DJASJDASDAS',NULL,'SP',1,0,1,'Anão','11'),(5,'032395013','Rua Almeida de Alimense','Nocumé',NULL,'AM',1,0,1,'Acachá','11'),(6,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'SP',1,0,1,'Acachá','11'),(7,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'AM',1,0,1,'Acachá','11'),(8,'03239193','Alameda Santos','Nocumé',NULL,'SP',1,1,1,'Acachá','11'),(9,'03239193','Alameda Santos','Nocumé',NULL,'SP',1,1,1,'Anão','11'),(10,'03239193','Alameda Santos','Nocumé',NULL,'AM',1,1,1,'Acachá','11'),(11,'03239193','Alameda Santos','Nocumé',NULL,'SP',1,1,1,'Acachá','11'),(12,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'AM',1,1,1,'Acachá','11'),(13,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'SP',1,1,1,'Acachá','11'),(14,'03239193','Alameda Santos','Nocumé',NULL,'AM',1,1,1,'Acachá','11'),(15,'03239193','Alameda Santos','Nocumé',NULL,'AM',1,1,1,'Acachá','11'),(16,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'AM',1,1,1,'Acachá','11'),(17,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'SP',1,1,1,'Acachá','11'),(18,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'SP',1,1,1,'Acachá','11'),(19,'03239193','Alameda Santos','Nocumé',NULL,'AM',1,1,1,'Acachá','11'),(20,'03239193','Rua Nocumé 2024','Nocumé',NULL,'SP',1,1,82,'Acachá','11'),(21,'03239193','Alameda Santos','Jardim de Rosas',NULL,'SP',1,1,82,'São Paulo','11'),(22,'03239193','Rua Almeida de Alimense','Jardim de Rosas',NULL,'AM',1,1,83,'São Paulo','11'),(23,'03239193','Rua Nocumé 2024','Nocumé',NULL,'AM',1,1,83,'Acachá','11'),(24,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'AM',1,1,84,'Acachá','11'),(25,'03239193','Rua Almeida de Alimense','Jardim de Rosas',NULL,'AM',1,1,85,'Acachá','11'),(26,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'SP',1,1,86,'Acachá','11'),(27,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'SP',1,1,28,'São Paulo','11'),(28,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'SP',1,1,28,'São Paulo','11'),(29,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'SP',1,1,91,'Acachá','11'),(30,'03239193','Alameda Santos','Nocumé',NULL,'AM',1,0,96,'Acachá','11'),(31,'03239193','Alameda Santos','DJASJDASDAS',NULL,'AM',1,1,98,'Acachá','11'),(32,'03239193','Alameda Santos','Nocumé',NULL,'SP',1,1,2,'Anão','11'),(33,'03239193','Alameda Santos','Nocumé',NULL,'AM',1,1,4,'Acachá','11'),(34,'03239194','Alameda Santos','DJASJDASDAS',NULL,'AM',1,1,1,'Acachá','11'),(35,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'SP',1,1,19,'Anão','11'),(36,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'SP',1,1,3,'Acachá','11'),(37,'03239194','Rua Almeida de Alimense','Nocumé',NULL,'11',1,1,1,'São Paulo','11'),(38,'03239193','Alameda Santos','Nocumé',NULL,'AM',1,1,5,'Acachá','11'),(39,'03239193','KEWKFSDOFF','Nocumé',NULL,'AM',1,1,96,'Acachá','11'),(40,'03239193','Alameda Santos','DJASJDASDAS',NULL,'SP',1,1,95,'Acachá','11'),(41,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'AM',1,1,6,'Anão','11'),(42,'03239193','Rua Almeida de Alimense','Nocumé',NULL,'AM',1,1,8,'Anão','11'),(43,'03213213','Alameda Santos','Nocumé',NULL,'11',1,1,14,'Acachá','11'),(44,'03239193','Alameda Santos','Nocumé',NULL,'11',1,1,9,'Acachá','11'),(45,'03239193','Alameda Santos','Nocumé',NULL,'SP',1,1,10,'Acachá','11');

--
-- Table structure for table `etapa`
--

DROP TABLE IF EXISTS `etapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `ultima_etapa` tinyint(1) DEFAULT NULL,
  `usuario_id` int NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`usuario_id`),
  KEY `fk_etapa_usuario` (`usuario_id`),
  CONSTRAINT `fk_etapa_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapa`
--

INSERT INTO `etapa` VALUES (1,'Entrevista','Etapa inicial de negociação',0,1,1),(2,'Primeira Prova','Primeiro mínimo produto víavel da roupa',0,1,1),(3,'Segunda Prova','Prova para verificação do caimento da peça',0,1,1),(4,'Concluído','Peça foi entregue com sucesso ao cliente',1,1,1),(5,'Cancelado','Houve dessistência por parte do cliente',0,1,0);

--
-- Table structure for table `foto`
--

DROP TABLE IF EXISTS `foto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dado_arquivo` mediumblob,
  `nome_arquivo` varchar(255) DEFAULT NULL,
  `item_pedido_id` int DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgxytm1f33jig82gfwhbmw0b1s` (`item_pedido_id`),
  KEY `FKkeyss3i39o47lj7jctjqpwai2` (`usuario_id`),
  CONSTRAINT `FKgxytm1f33jig82gfwhbmw0b1s` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedido` (`id`),
  CONSTRAINT `FKkeyss3i39o47lj7jctjqpwai2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foto`
--


--
-- Table structure for table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `observacao` varchar(255) DEFAULT NULL,
  `cliente_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `peca_id` int NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`cliente_id`,`usuario_id`,`peca_id`),
  KEY `fk_cliente_item_pedido` (`cliente_id`),
  KEY `fk_usuario_item_pedido` (`usuario_id`),
  KEY `fK_peca_item_pedido` (`peca_id`),
  CONSTRAINT `fk_cliente_item_pedido` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fK_peca_item_pedido` FOREIGN KEY (`peca_id`) REFERENCES `peca` (`id`),
  CONSTRAINT `fk_usuario_item_pedido` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido`
--

INSERT INTO `item_pedido` VALUES (102,'Deu tudo certo!',4,1,100,0),(103,'Calça com a barra ajustada conforme medida: 3cm',8,1,200,0),(104,'',4,1,200,0),(105,'',4,1,100,0),(106,'',8,1,100,1),(107,'',10,1,100,1),(108,'',5,1,200,1),(109,'',5,1,300,1),(110,'',12,1,200,1),(111,'',5,1,200,1);

--
-- Table structure for table `log_agendamento`
--

DROP TABLE IF EXISTS `log_agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_agendamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `agendamento_id` int DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `localizacao` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `etapa_id` int DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_agendamento_log` (`agendamento_id`),
  KEY `fk_etapa_agendamento_log` (`etapa_id`),
  KEY `fk_usuario_agendamento_log` (`usuario_id`),
  KEY `fk_cliente_agendamento_log` (`cliente_id`),
  CONSTRAINT `fk_agendamento_log` FOREIGN KEY (`agendamento_id`) REFERENCES `agendamento` (`id`),
  CONSTRAINT `fk_cliente_agendamento_log` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_etapa_agendamento_log` FOREIGN KEY (`etapa_id`) REFERENCES `etapa` (`id`),
  CONSTRAINT `fk_usuario_agendamento_log` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_agendamento`
--

INSERT INTO `log_agendamento` VALUES (1,127,'2024-08-06 16:13:00','2024-08-13 16:13:00',NULL,NULL,2,1,1),(2,127,'2024-08-06 16:13:00','2024-08-13 16:13:00',NULL,NULL,3,1,1),(3,127,'2024-08-06 16:13:00','2024-08-13 16:13:00',NULL,NULL,2,1,1),(4,127,'2024-08-06 16:13:00','2024-08-13 16:13:00',NULL,NULL,1,1,1),(5,127,'2024-08-06 16:13:00','2024-08-13 16:13:00',NULL,NULL,2,1,1),(6,127,'2024-08-06 16:13:00','2024-08-13 16:13:00',NULL,NULL,3,1,1),(7,123,'2024-08-07 16:00:00','2024-08-07 16:00:00',NULL,NULL,1,1,1),(8,124,'2024-08-13 16:13:00','2024-08-13 16:13:00',NULL,NULL,1,1,1),(9,124,'2024-08-13 16:13:00','2024-08-13 16:13:00',NULL,NULL,2,1,1),(10,124,'2024-08-13 16:13:00','2024-08-13 16:13:00',NULL,NULL,3,1,1),(11,122,'2024-09-01 10:55:00','2024-08-30 10:55:00',NULL,NULL,1,1,1),(12,122,'2024-09-01 10:55:00','2024-08-30 10:55:00',NULL,NULL,2,1,1),(13,122,'2024-09-01 10:55:00','2024-08-30 10:55:00',NULL,NULL,3,1,1),(14,189,'2024-09-24 23:21:00','2024-09-24 23:21:00',NULL,NULL,1,1,1),(15,189,'2024-09-24 23:21:00','2024-09-24 23:21:00',NULL,NULL,2,1,1),(16,192,'2024-09-18 09:23:00','2024-09-18 09:23:00',NULL,NULL,1,1,1),(17,193,'2024-09-05 18:30:00','2024-09-05 18:30:00',NULL,NULL,1,1,1),(18,194,'2024-09-18 16:24:00','2024-09-18 16:24:00',NULL,NULL,1,1,1),(19,195,'2024-09-10 16:52:00','2024-09-10 16:52:00',NULL,NULL,1,1,1),(20,190,'2024-09-18 00:38:00','2024-09-18 00:38:00',NULL,NULL,1,1,1),(21,202,'2024-10-25 13:43:00','2024-10-25 13:43:00',NULL,NULL,1,1,1),(22,200,'2024-10-03 11:40:00','2024-10-03 11:40:00',NULL,NULL,1,1,1),(23,207,'2024-10-10 18:00:00','2024-10-10 18:00:00',NULL,NULL,1,1,1),(24,208,'2024-10-03 19:14:00','2024-10-03 19:14:00',NULL,NULL,1,1,1),(25,211,'2024-11-14 17:04:00','2024-11-14 17:04:00',NULL,NULL,1,1,1),(26,221,'2024-11-14 10:36:00','2024-11-14 10:36:00',NULL,NULL,1,1,1),(27,227,'2024-11-01 11:09:00','2024-11-01 11:09:00',NULL,NULL,1,1,1),(28,213,'2024-11-14 17:03:00','2024-11-14 17:03:00',NULL,NULL,1,1,1),(29,232,'2024-11-13 10:00:00','2024-11-13 10:00:00',NULL,NULL,1,1,4),(30,233,'2024-11-13 10:03:00','2024-11-13 10:03:00',NULL,NULL,1,1,4),(31,239,'2024-11-08 16:18:00','2024-11-08 16:18:00',NULL,NULL,1,1,4);

--
-- Table structure for table `moradia`
--

DROP TABLE IF EXISTS `moradia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moradia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `endereco_id` int NOT NULL,
  `numero` varchar(8) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`cliente_id`,`endereco_id`),
  KEY `fk_cliente_moradia` (`cliente_id`),
  KEY `fk_endereco_moradia` (`endereco_id`),
  CONSTRAINT `fk_cliente_moradia` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_endereco_moradia` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moradia`
--

INSERT INTO `moradia` VALUES (1,1,1,'50','Casa verde',1);

--
-- Table structure for table `nome_medida`
--

DROP TABLE IF EXISTS `nome_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nome_medida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `peca_id` int NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`peca_id`),
  KEY `fk_peca_nome_medida` (`peca_id`),
  KEY `fk_usuario_id` (`usuario_id`),
  CONSTRAINT `fk_peca_nome_medida` FOREIGN KEY (`peca_id`) REFERENCES `peca` (`id`),
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nome_medida`
--

INSERT INTO `nome_medida` VALUES (7,'A. Cinta',100,1,1),(8,'A. Quadris',100,1,1),(9,'Comprimento',100,1,1),(10,'Torax',100,1,1),(11,'Cinta',100,1,1),(12,'Quadris',100,1,1),(13,'Ombro',100,1,1),(14,'C. Manga',100,1,1),(15,'Costas',100,1,1),(16,'L. Coz',300,1,1),(17,'A. Joelho',300,1,1),(18,'Comp. Lateral',300,1,1),(19,'Altura',300,1,1),(20,'C.E.P',300,1,1),(21,'Cinta',300,1,1),(22,'Quadris',300,1,1),(23,'Boca',300,1,1),(24,'A.Cinta',200,1,1),(25,'Comprimento',200,1,1),(26,'Torax',200,1,1),(27,'Cinta',200,1,1),(28,'Quadris',200,1,1),(29,'Degolo',200,1,1),(30,'C.Dianteiro',200,1,1),(31,'L. do Ombro',100,1,0),(32,'L. do Ombro',100,1,0),(33,'L. do Ombro',303,1,1),(34,'L. do Ombro',305,1,1);

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `corpo` text,
  `cor` varchar(15) DEFAULT NULL,
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`usuario_id`),
  KEY `fk_usuario_nota` (`usuario_id`),
  KEY `fk_cliente_nota` (`cliente_id`),
  CONSTRAINT `fk_cliente_nota` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_usuario_nota` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

INSERT INTO `nota` VALUES (1,'Será que vale a pena?','Será que vale a pena? será que vale apena, será que vale apena..','#008000',NULL,NULL,1,2,0),(2,'Viver ou não viver, eis a questão.','Invariavelmente, nos confins da vida, essa questão me assombra, seria o universo uma força terrível que assola a humanidade ou na absurdidade da nossa insignificância que percebemos nossa própria vontade nesse mundo e tempo finito.','#008000',NULL,NULL,1,1,1),(3,'Viver ou não viver, eis a questão.','Invariavelmente, nos confins da vida, essa questão me assombra, seria o universo uma força terrível que assola a humanidade ou na absurdidade da nossa insignificância que percebemos nossa própria vontade nesse mundo e tempo finito.','#008000',NULL,NULL,1,1,1),(4,'Viver ou não viver, eis a questão.','Invariavelmente, nos confins da vida, essa questão me assombra, seria o universo uma força terrível que assola a humanidade ou na absurdidade da nossa insignificância que percebemos nossa própria vontade nesse mundo e tempo finito.','#008000',NULL,NULL,1,1,1),(5,'Viver ou não viver, eis a questão.','Invariavelmente, nos confins da vida, essa questão me assombra, seria o universo uma força terrível que assola a humanidade ou na absurdidade da nossa insignificância que percebemos nossa própria vontade nesse mundo e tempo finito.','#008000',NULL,NULL,1,2,1),(6,'Viver ou não viver, eis a questão.','Invariavelmente, nos confins da vida, essa questão me assombra, seria o universo uma força terrível que assola a humanidade ou na absurdidade da nossa insignificância que percebemos nossa própria vontade nesse mundo e tempo finito.','#008000',NULL,NULL,2,2,1);

--
-- Table structure for table `peca`
--

DROP TABLE IF EXISTS `peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peca` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `usuario_id` int NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`usuario_id`),
  KEY `fk_peca_usuario` (`usuario_id`),
  CONSTRAINT `fk_peca_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peca`
--

INSERT INTO `peca` VALUES (100,'Paletó','Um paletó com base nas medidas padrões',1,1),(200,'Calça','Uma calça com base nas medidas padrões',1,1),(300,'Colete','Um colete com base nas medidas padrões',1,1),(301,'Casaco','Um casaco',1,0),(302,'Casaco','Um casaco',1,0),(303,'Casaco','Um casaco',1,0),(304,'Casaco','Um casaco',1,0),(305,'Casaco','Um casaco',1,1),(306,'Casaco','Um casaco',1,0),(307,'Casaco','Um casaco',1,0),(308,'Casaco','Um casaco',1,0),(309,'Chapéu','Um chapéu',1,0),(310,'Casaco','Um casaco',1,0);

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_pedido_id` int DEFAULT NULL,
  `agendamento_id` int NOT NULL,
  `etapa_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`agendamento_id`,`etapa_id`,`usuario_id`,`cliente_id`),
  KEY `fk_agendamento_pedido` (`agendamento_id`),
  KEY `fk_etapa_pedido` (`etapa_id`),
  KEY `fk_cliente_pedido` (`cliente_id`),
  KEY `fk_usuario_pedido` (`usuario_id`),
  KEY `fk_item_pedido_id` (`item_pedido_id`),
  CONSTRAINT `fk_agendamento_pedido` FOREIGN KEY (`agendamento_id`) REFERENCES `agendamento` (`id`),
  CONSTRAINT `fk_cliente_pedido` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_etapa_pedido` FOREIGN KEY (`etapa_id`) REFERENCES `etapa` (`id`),
  CONSTRAINT `fk_item_pedido_id` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedido` (`id`),
  CONSTRAINT `fk_usuario_pedido` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

INSERT INTO `pedido` VALUES (173,102,213,2,1,1,1),(174,103,213,2,1,1,1),(175,105,216,1,1,1,1),(176,105,243,1,1,4,1),(177,106,244,1,1,4,1),(178,106,245,1,1,4,1),(179,102,239,2,1,4,1),(180,106,246,1,1,4,1),(181,107,246,1,1,4,1),(182,106,247,1,1,4,1),(183,107,248,1,1,4,1),(184,102,252,1,1,6,1),(185,106,256,1,1,4,1),(186,106,258,1,1,5,1),(187,107,259,1,1,5,1),(188,105,260,1,1,5,1),(189,106,287,1,1,5,1),(190,107,214,1,1,1,1),(191,106,214,1,1,1,1),(192,103,214,1,1,1,1),(193,102,214,1,1,1,1),(194,106,214,1,1,1,1),(195,108,214,1,1,1,0),(196,109,214,1,1,1,0),(197,108,259,1,1,5,1),(198,111,288,1,1,5,1),(199,111,289,1,1,5,1),(200,111,290,1,1,5,1);

--
-- Table structure for table `pedido_grafico_view`
--

DROP TABLE IF EXISTS `pedido_grafico_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_grafico_view` (
  `id` binary(16) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `qtd_pedidos` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_grafico_view`
--


--
-- Table structure for table `relatorio_cliente_response`
--

DROP TABLE IF EXISTS `relatorio_cliente_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relatorio_cliente_response` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantidade_cliente_mes_atual` int DEFAULT NULL,
  `quantidade_cliente_mes_passado` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio_cliente_response`
--


--
-- Table structure for table `tecido`
--

DROP TABLE IF EXISTS `tecido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecido` (
  `id` int NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `usuario_id` int NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`usuario_id`),
  KEY `fk_tecido_usuario` (`usuario_id`),
  CONSTRAINT `fk_tecido_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecido`
--

INSERT INTO `tecido` VALUES (20000,'Algodão',1,1),(20001,'Lã',1,1),(20002,'Seda',1,1),(20003,'Linho',1,0),(20004,'Poliéster',1,0),(20005,'Viscose',1,0),(20006,'Novelo',1,1),(20007,'Algodão italiano',1,0),(20008,'Avelã',1,0),(20009,'Tweed',1,0);

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_telefone_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`,`tipo_telefone_id`,`cliente_id`),
  KEY `fk_tipo_telefone` (`tipo_telefone_id`),
  KEY `fk_dono_telefone` (`cliente_id`),
  KEY `FK92q33nmw94rylnpis5mgcy3v` (`usuario_id`),
  CONSTRAINT `FK92q33nmw94rylnpis5mgcy3v` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_dono_telefone` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_tipo_telefone` FOREIGN KEY (`tipo_telefone_id`) REFERENCES `tipo_telefone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

INSERT INTO `telefone` VALUES (2,1,1,'11938591934',1,1),(3,1,1,'33491839183',1,1),(4,1,65,'asdad',1,1),(5,1,65,'dasddasd',1,1),(6,1,66,'12321312',1,1),(7,1,66,'123213123312',1,1),(8,1,1,'11932918329',1,1),(9,1,1,'77938193813',0,1),(10,1,1,'22312341',1,1),(11,1,1,'11938591931',1,1),(12,1,1,'11938591931',1,1),(13,1,1,'22938193813',0,1),(14,1,82,'11938591931',1,1),(15,1,82,'22938193813',1,1),(16,1,83,'11938591931',1,1),(17,1,83,'55938194912',1,1),(18,1,83,'30295918491',1,1),(19,1,84,'55938194912',1,1),(20,1,85,'55938194912',1,1),(21,1,86,'11938591931',1,1),(22,1,28,'55938194912',1,1),(23,1,28,'22938193814',1,1),(24,1,91,'11938591931',1,1),(25,1,98,'11938591931',1,1),(26,1,98,'11938591931',1,1),(27,1,4,'11934859181',1,1),(28,1,1,'11938591931',1,1),(29,1,19,'11938591931',1,1),(30,1,99,'11938591931',1,1),(31,1,3,'11938591934',1,1),(32,1,1,'11938591931',1,1),(33,1,5,'22938193814',1,1),(34,1,96,'11935869282',1,1),(35,1,95,'11938591931',1,1),(36,1,6,'11938591931',1,1),(37,1,8,'11938591931',1,1),(38,1,14,'11938591931',1,1),(39,1,9,'11938591931',1,1),(40,1,10,'55938194912',1,1);

--
-- Table structure for table `tipo_telefone`
--

DROP TABLE IF EXISTS `tipo_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_telefone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `digitos` int NOT NULL,
  `usuario_id` int NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`usuario_id`),
  KEY `fk_tipo_telefone_usuario` (`usuario_id`),
  CONSTRAINT `fk_tipo_telefone_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_telefone`
--

INSERT INTO `tipo_telefone` VALUES (1,'Telefone do japão',15,1,1);

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `autenticado` tinyint(1) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` VALUES (1,'askyu','1234',1,1),(2,'alice','passAlice123',1,1),(3,'bob','secureBob456',0,1),(5,'dave','DavePassword0',0,1),(6,'eve','Eve_SafePass',0,1),(7,'frank','Frank@2023',0,1),(8,'grace','Grace&Pass',0,1),(9,'heidi','Heidi1234',0,1),(10,'ivan','IvanSecure!',0,1),(11,'judy','JudyPwd#789',0,1);

--
-- Table structure for table `valor_medida`
--

DROP TABLE IF EXISTS `valor_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valor_medida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor` float DEFAULT NULL,
  `item_pedido_id` int NOT NULL,
  `nome_medida_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `peca_id` int NOT NULL,
  PRIMARY KEY (`id`,`nome_medida_id`,`peca_id`,`cliente_id`,`item_pedido_id`,`usuario_id`),
  KEY `fk_item_pedido_valor_medida` (`item_pedido_id`),
  KEY `fk_nome_medida_valor_medida` (`nome_medida_id`),
  KEY `fk_cliente_valor_medida` (`cliente_id`),
  KEY `fk_usuario_valor_medida` (`usuario_id`),
  KEY `fk_peca_id_valor_medida` (`peca_id`),
  CONSTRAINT `fk_cliente_valor_medida` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_item_pedido_valor_medida` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedido` (`id`),
  CONSTRAINT `fk_nome_medida_valor_medida` FOREIGN KEY (`nome_medida_id`) REFERENCES `nome_medida` (`id`),
  CONSTRAINT `fk_peca_id_valor_medida` FOREIGN KEY (`peca_id`) REFERENCES `peca` (`id`),
  CONSTRAINT `fk_usuario_valor_medida` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valor_medida`
--

INSERT INTO `valor_medida` VALUES (274,24,102,7,4,1,100),(275,25,102,8,4,1,100),(276,25,102,9,4,1,100),(277,25,102,10,4,1,100),(278,25,102,11,4,1,100),(279,25,102,12,4,1,100),(280,25,102,13,4,1,100),(281,25,102,14,4,1,100),(282,25,102,15,4,1,100),(283,400,103,24,8,1,200),(284,30,103,25,8,1,200),(285,30,103,26,8,1,200),(286,30,103,27,8,1,200),(287,30,103,28,8,1,200),(288,30,103,29,8,1,200),(289,30,103,30,8,1,200),(290,24,104,24,4,1,200),(291,25,104,25,4,1,200),(292,25,104,26,4,1,200),(293,25,104,27,4,1,200),(294,25,104,28,4,1,200),(295,25,104,29,4,1,200),(296,25,104,30,4,1,200),(297,25,105,7,4,1,100),(298,24,105,8,4,1,100),(299,23,105,9,4,1,100),(300,24,105,10,4,1,100),(301,25,105,11,4,1,100),(302,12,105,12,4,1,100),(303,24,105,13,4,1,100),(304,25,105,14,4,1,100),(305,12,105,15,4,1,100),(306,24,106,7,8,1,100),(307,24,106,8,8,1,100),(308,24,106,9,8,1,100),(309,24,106,10,8,1,100),(310,24,106,11,8,1,100),(311,24,106,12,8,1,100),(312,24,106,13,8,1,100),(313,24,106,14,8,1,100),(314,25,106,15,8,1,100),(315,50,107,7,10,1,100),(316,50,107,8,10,1,100),(317,50,107,9,10,1,100),(318,50,107,10,10,1,100),(319,50,107,11,10,1,100),(320,50,107,12,10,1,100),(321,50,107,13,10,1,100),(322,50,107,14,10,1,100),(323,50,107,15,10,1,100),(324,43,108,24,5,1,200),(325,42,108,25,5,1,200),(326,42,108,26,5,1,200),(327,42,108,27,5,1,200),(328,42,108,28,5,1,200),(329,42,108,29,5,1,200),(330,42,108,30,5,1,200),(331,54,109,16,5,1,300),(332,54,109,17,5,1,300),(333,54,109,18,5,1,300),(334,54,109,19,5,1,300),(335,54,109,20,5,1,300),(336,54,109,21,5,1,300),(337,54,109,22,5,1,300),(338,54,109,23,5,1,300),(339,42,110,24,12,1,200),(340,43,110,25,12,1,200),(341,43,110,26,12,1,200),(342,4,110,27,12,1,200),(343,3,110,28,12,1,200),(344,4,110,29,12,1,200),(345,3,110,30,12,1,200),(346,35,111,24,5,1,200),(347,25,111,25,5,1,200),(348,52,111,26,5,1,200),(349,42,111,27,5,1,200),(350,52,111,28,5,1,200),(351,24,111,29,5,1,200),(352,21,111,30,5,1,200);

--
-- Temporary view structure for view `vw_agendamento_cliente_dependente`
--

DROP TABLE IF EXISTS `vw_agendamento_cliente_dependente`;
/*!50001 DROP VIEW IF EXISTS `vw_agendamento_cliente_dependente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_agendamento_cliente_dependente` AS SELECT 
 1 AS `id`,
 1 AS `data_inicio`,
 1 AS `data_fim`,
 1 AS `localizacao`,
 1 AS `descricao`,
 1 AS `usuario_id`,
 1 AS `etapa_id`,
 1 AS `endereco_id`,
 1 AS `telefone_id`,
 1 AS `ativo`,
 1 AS `nome`,
 1 AS `sobrenome`,
 1 AS `email`,
 1 AS `responsavel_id`,
 1 AS `clienteativo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_card_etapa`
--

DROP TABLE IF EXISTS `vw_card_etapa`;
/*!50001 DROP VIEW IF EXISTS `vw_card_etapa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_card_etapa` AS SELECT 
 1 AS `id`,
 1 AS `data_inicio`,
 1 AS `data_fim`,
 1 AS `nome`,
 1 AS `sobrenome`,
 1 AS `etapa_id`,
 1 AS `usuario_id`,
 1 AS `ativo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_cliente`
--

DROP TABLE IF EXISTS `vw_cliente`;
/*!50001 DROP VIEW IF EXISTS `vw_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cliente` AS SELECT 
 1 AS `usuario_id`,
 1 AS `id`,
 1 AS `nome`,
 1 AS `sobrenome`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_pedido_agendamento_peca`
--

DROP TABLE IF EXISTS `vw_pedido_agendamento_peca`;
/*!50001 DROP VIEW IF EXISTS `vw_pedido_agendamento_peca`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pedido_agendamento_peca` AS SELECT 
 1 AS `id`,
 1 AS `data_inicio`,
 1 AS `data_fim`,
 1 AS `usuario_id`,
 1 AS `ativo`,
 1 AS `nome`,
 1 AS `sobrenome`,
 1 AS `pecanome`,
 1 AS `tecidonome`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_rank_cliente`
--

DROP TABLE IF EXISTS `vw_rank_cliente`;
/*!50001 DROP VIEW IF EXISTS `vw_rank_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_rank_cliente` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `sobrenome`,
 1 AS `qtd_pedidos`,
 1 AS `usuario_id`,
 1 AS `data_inicio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_rank_tecido`
--

DROP TABLE IF EXISTS `vw_rank_tecido`;
/*!50001 DROP VIEW IF EXISTS `vw_rank_tecido`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_rank_tecido` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `qtd_tecidos`,
 1 AS `usuario_id`,
 1 AS `data_inicio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_total_etapa`
--

DROP TABLE IF EXISTS `vw_total_etapa`;
/*!50001 DROP VIEW IF EXISTS `vw_total_etapa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_total_etapa` AS SELECT 
 1 AS `qtd_agendamento`,
 1 AS `etapa_id`,
 1 AS `usuario_id`,
 1 AS `ativo`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'askyu'
--

--
-- Dumping routines for database 'askyu'
--
/*!50003 DROP PROCEDURE IF EXISTS `contar_pecas_vendidas_por_usuario_ano` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`askyu`@`%` PROCEDURE `contar_pecas_vendidas_por_usuario_ano`(
    IN usuario_id_input INT,
    IN ano_input INT
)
BEGIN
    -- Consulta para contar quantas peças foram vendidas neste ano, incluindo peças com 0 vendas
    SELECT p.nome AS nomePeca, 
           COALESCE(COUNT(CASE WHEN YEAR(a.data_inicio) = ano_input THEN ip.id END), 0) AS qtdVendida
    FROM peca p  -- Todas as peças
    LEFT JOIN item_pedido ip ON p.id = ip.peca_id  -- Join opcional com item_pedido
    LEFT JOIN pedido ped ON ip.id = ped.item_pedido_id  -- Join opcional com pedido
    LEFT JOIN agendamento a ON ped.agendamento_id = a.id  -- Join opcional com agendamento
    LEFT JOIN usuario u ON u.id = a.usuario_id  -- Join opcional com usuário
    WHERE (u.id = usuario_id_input OR u.id IS NULL)  -- Filtrar por usuário ou incluir nulos
    GROUP BY p.nome  -- Agrupar por nome da peça
    ORDER BY qtdVendida DESC;  -- Ordenar pela quantidade vendida, em ordem decrescente
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getComparacaoClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`askyu`@`%` PROCEDURE `getComparacaoClientes`(
IN usuario_id_input INT,
IN ano_escolhido INT,
IN mes_escolhido INT,
IN periodo INT,
OUT quantidade_cliente_passado INT,
OUT quantidade_cliente_atual INT
)
BEGIN

IF periodo = 1 THEN
    SET periodo = 2;
ELSE 
    SET periodo = periodo - 1;
END IF;

IF mes_escolhido = MONTH(now()) THEN
    SET @data_mes_escolhido = now(); 
    SET @data_mes_passado = DATE_SUB(now(), INTERVAL ano_escolhido YEAR);
    SET @data_periodo_atual = DATE_SUB(@data_mes_escolhido, INTERVAL periodo MONTH);
	SET @data_periodo_passado = DATE_SUB(@data_mes_passado, INTERVAL periodo MONTH);
ELSE
    SET @data_mes_escolhido = LAST_DAY(DATE(CONCAT(year(now()), '-', mes_escolhido, '-1')));
    SET @data_mes_passado = DATE_SUB(@data_mes_escolhido, INTERVAL ano_escolhido YEAR);
    SET @data_periodo_atual = DATE_SUB(LAST_DAY(@data_mes_escolhido), INTERVAL periodo MONTH);
	SET @data_periodo_passado = DATE_SUB(LAST_DAY(@data_mes_passado), INTERVAL periodo MONTH);
END IF;

SET quantidade_cliente_atual := (SELECT COUNT(*) 
                                 FROM cliente
                                 WHERE data_criacao >= @data_periodo_atual
                                 AND data_criacao <= TIMESTAMP(@data_mes_escolhido, '23:59:59') 
                                 AND usuario_id = usuario_id_input);


SET quantidade_cliente_passado := (SELECT COUNT(*) 
                                   FROM cliente
                                   WHERE data_criacao >= @data_periodo_passado
                                   AND data_criacao <= TIMESTAMP(@data_mes_passado, '23:59:59') 
                                   AND usuario_id = usuario_id_input);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getComparacaoPedidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`askyu`@`%` PROCEDURE `getComparacaoPedidos`(
IN usuario_id_input INT,
IN ano_escolhido INT,
IN mes_escolhido INT,
IN periodo INT,
OUT quantidade_pedido_passado INT,
OUT quantidade_pedido_atual INT
)
BEGIN

IF periodo = 1 THEN
    SET periodo = 2;
ELSE 
    SET periodo = periodo - 1;
END IF;

IF mes_escolhido = MONTH(now()) THEN
    SET @data_mes_escolhido = now(); 
    SET @data_mes_passado = DATE_SUB(now(), INTERVAL ano_escolhido YEAR);
    SET @data_periodo_atual = DATE_SUB(@data_mes_escolhido, INTERVAL periodo MONTH);
	SET @data_periodo_passado = DATE_SUB(@data_mes_passado, INTERVAL periodo MONTH);
ELSE
    SET @data_mes_escolhido = LAST_DAY(DATE(CONCAT(year(now()), '-', mes_escolhido, '-1')));
    SET @data_mes_passado = DATE_SUB(@data_mes_escolhido, INTERVAL ano_escolhido YEAR);
    SET @data_periodo_atual = DATE_SUB(LAST_DAY(@data_mes_escolhido), INTERVAL periodo MONTH);
	SET @data_periodo_passado = DATE_SUB(LAST_DAY(@data_mes_passado), INTERVAL periodo MONTH);
END IF;

SET quantidade_pedido_atual:= (select count(*) from pedido
								   join agendamento on pedido.agendamento_id = agendamento.id
								   where data_inicio >= @data_periodo_atual
                                   AND data_inicio <= TIMESTAMP(@data_mes_escolhido, '23:59:59')
								   AND pedido.usuario_id = usuario_id_input);


SET quantidade_pedido_passado:= (select count(*) from pedido
									 join agendamento on pedido.agendamento_id = agendamento.id
									 where data_inicio >= @data_periodo_passado 
                                     AND data_inicio <= TIMESTAMP(@data_mes_passado, '23:59:59')
                                     AND pedido.usuario_id = usuario_id_input);
                                                                    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_pedidos_ultimos_12_meses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`askyu`@`%` PROCEDURE `listar_pedidos_ultimos_12_meses`(IN usuario_id_input INT, IN ano_input INT)
BEGIN
    -- CTE para gerar os últimos 12 meses
    WITH ultimos_meses AS (
        SELECT DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL n MONTH), '%M') AS mes_extenso, 
               MONTH(DATE_SUB(CURDATE(), INTERVAL n MONTH)) AS mes_num,
               YEAR(DATE_SUB(CURDATE(), INTERVAL n MONTH)) AS ano
        FROM (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL 
                     SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL 
                     SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL 
                     SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11) AS nums
    )
    -- Seleciona todos os meses, incluindo aqueles sem pedidos
    SELECT um.mes_extenso AS mes, 
           COALESCE(COUNT(p.id), 0) AS qtdPedido
    FROM ultimos_meses um
    LEFT JOIN agendamento a ON MONTH(a.data_inicio) = um.mes_num AND YEAR(a.data_inicio) = um.ano
    LEFT JOIN pedido p ON a.id = p.agendamento_id AND p.usuario_id = usuario_id_input AND YEAR(a.data_inicio) = ano_input
    GROUP BY um.mes_extenso, um.mes_num, um.ano  
    ORDER BY um.ano, um.mes_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_teste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`askyu`@`%` PROCEDURE `sp_teste`(
IN usuario_id_input INT,
IN mes_escolhido INT,
IN periodo INT,
OUT quantidade_cliente_passado INT,
OUT quantidade_cliente_atual INT
)
BEGIN

	IF periodo = 1 THEN
	   SET periodo = 2;
	ELSE 
	   SET periodo = periodo - 1;
	END IF;

	IF mes_escolhido = MONTH(now()) THEN
		SET @data_mes_escolhido =  now(); 
        SET @data_mes_passado = DATE_SUB(DATE_SUB(now(), INTERVAL periodo MONTH), INTERVAL 1 YEAR);
	ELSE
		SET @data_mes_escolhido = LAST_DAY(DATE(CONCAT(year(now()), '-', mes_escolhido, '-1', '00:00:00')));
        SET @data_mes_passado = DATE_SUB(LAST_DAY(DATE_SUB(now(), INTERVAL periodo - 1 MONTH)), INTERVAL 1 YEAR);
	END IF;
    
 SET quantidade_cliente_atual:= (select count(*) from cliente
 where data_criacao >= @data_mes_escolhido AND data_criacao <= addtime(now(), '23:59:59')
 AND usuario_id = usuario_id_input);

 SET quantidade_cliente_passado:= (select count(*) from cliente
 where data_criacao >= @data_mes_passado AND 
 data_criacao <= addtime(@data_mes_passado, '23:59:59')
 AND usuario_id = usuario_id_input);
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_teste2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`askyu`@`%` PROCEDURE `sp_teste2`(
IN usuario_id_input INT,
IN mes_escolhido INT,
IN periodo INT,
OUT quantidade_cliente_passado INT,
OUT quantidade_cliente_atual INT
)
BEGIN

	-- Ajuste do período
IF periodo = 1 THEN
    SET periodo = 2;
ELSE 
    SET periodo = periodo - 1;
END IF;

-- Verifica se o mês escolhido é o mês atual
IF mes_escolhido = MONTH(now()) THEN
    -- Se for o mês atual, usa a data atual
    SET @data_mes_escolhido = now(); 
    SET @data_mes_passado = DATE_SUB(DATE_SUB(now(), INTERVAL periodo MONTH), INTERVAL 1 YEAR);
ELSE
    -- Se não for o mês atual, calcula a data do último dia do mês escolhido
    -- Corrigido o uso de '00:00:00', agora não é mais necessário concatenar
    SET @data_mes_escolhido = LAST_DAY(DATE(CONCAT(year(now()), '-', mes_escolhido, '-1')));
    SET @data_mes_passado = DATE_SUB(LAST_DAY(DATE_SUB(now(), INTERVAL periodo - 1 MONTH)), INTERVAL 1 YEAR);
END IF;

-- Quantidade de clientes no período atual
SET quantidade_cliente_atual := (SELECT COUNT(*) 
                                 FROM cliente
                                 WHERE data_criacao >= @data_mes_escolhido 
                                 AND data_criacao <= TIMESTAMP(now(), '23:59:59')  -- Usa TIMESTAMP para ajustar o horário final do dia
                                 AND usuario_id = usuario_id_input);

-- Quantidade de clientes no período passado
SET quantidade_cliente_passado := (SELECT COUNT(*) 
                                   FROM cliente
                                   WHERE data_criacao >= @data_mes_passado 
                                   AND data_criacao <= TIMESTAMP(@data_mes_passado, '23:59:59')  -- Mesmo ajuste para o período passado
                                   AND usuario_id = usuario_id_input);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_agendamento_cliente_dependente`
--

/*!50001 DROP VIEW IF EXISTS `vw_agendamento_cliente_dependente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`askyu`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_agendamento_cliente_dependente` AS select `agendamento`.`id` AS `id`,`agendamento`.`data_inicio` AS `data_inicio`,`agendamento`.`data_fim` AS `data_fim`,`agendamento`.`localizacao` AS `localizacao`,`agendamento`.`descricao` AS `descricao`,`agendamento`.`usuario_id` AS `usuario_id`,`agendamento`.`etapa_id` AS `etapa_id`,`agendamento`.`endereco_id` AS `endereco_id`,`agendamento`.`telefone_id` AS `telefone_id`,`agendamento`.`ativo` AS `ativo`,`cliente`.`nome` AS `nome`,`cliente`.`sobrenome` AS `sobrenome`,`cliente`.`email` AS `email`,`cliente`.`responsavel_id` AS `responsavel_id`,`cliente`.`ativo` AS `clienteativo` from ((`agendamento` join `cliente` on((`cliente`.`id` = `agendamento`.`cliente_id`))) join `cliente` `responsavel` on((`responsavel`.`id` = `cliente`.`responsavel_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_card_etapa`
--

/*!50001 DROP VIEW IF EXISTS `vw_card_etapa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`askyu`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_card_etapa` AS select `agendamento`.`id` AS `id`,`agendamento`.`data_inicio` AS `data_inicio`,`agendamento`.`data_fim` AS `data_fim`,`cliente`.`nome` AS `nome`,`cliente`.`sobrenome` AS `sobrenome`,`agendamento`.`etapa_id` AS `etapa_id`,`agendamento`.`usuario_id` AS `usuario_id`,`agendamento`.`ativo` AS `ativo` from ((`agendamento` join `etapa` on((`agendamento`.`etapa_id` = `etapa`.`id`))) join `cliente` on((`agendamento`.`cliente_id` = `cliente`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cliente`
--

/*!50001 DROP VIEW IF EXISTS `vw_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`askyu`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cliente` AS select `cliente`.`usuario_id` AS `usuario_id`,`cliente`.`id` AS `id`,`cliente`.`nome` AS `nome`,`cliente`.`sobrenome` AS `sobrenome`,`cliente`.`email` AS `email` from `cliente` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pedido_agendamento_peca`
--

/*!50001 DROP VIEW IF EXISTS `vw_pedido_agendamento_peca`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`askyu`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pedido_agendamento_peca` AS select distinct `agendamento`.`id` AS `id`,`agendamento`.`data_inicio` AS `data_inicio`,`agendamento`.`data_fim` AS `data_fim`,`agendamento`.`usuario_id` AS `usuario_id`,`agendamento`.`ativo` AS `ativo`,`cliente`.`nome` AS `nome`,`cliente`.`sobrenome` AS `sobrenome`,`peca`.`nome` AS `pecanome`,`tecido`.`nome` AS `tecidonome` from ((((((`pedido` join `item_pedido` on((`item_pedido`.`id` = `pedido`.`item_pedido_id`))) join `peca` on((`peca`.`id` = `item_pedido`.`peca_id`))) join `agendamento` on((`agendamento`.`id` = `pedido`.`agendamento_id`))) join `cliente` on((`cliente`.`id` = `agendamento`.`cliente_id`))) join `colecao_tecido` on((`colecao_tecido`.`item_pedido_id` = `item_pedido`.`id`))) join `tecido` on((`tecido`.`id` = `colecao_tecido`.`tecido_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rank_cliente`
--

/*!50001 DROP VIEW IF EXISTS `vw_rank_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`askyu`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rank_cliente` AS select uuid() AS `id`,`cliente`.`nome` AS `nome`,`cliente`.`sobrenome` AS `sobrenome`,count(0) AS `qtd_pedidos`,`pedido`.`usuario_id` AS `usuario_id`,`agendamento`.`data_inicio` AS `data_inicio` from ((`pedido` join `cliente` on((`cliente`.`id` = `pedido`.`cliente_id`))) join `agendamento` on((`agendamento`.`id` = `pedido`.`agendamento_id`))) group by `cliente`.`nome`,`cliente`.`sobrenome`,`pedido`.`usuario_id`,`agendamento`.`data_inicio` order by `qtd_pedidos` desc,`pedido`.`usuario_id` limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rank_tecido`
--

/*!50001 DROP VIEW IF EXISTS `vw_rank_tecido`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`askyu`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rank_tecido` AS select uuid() AS `id`,`tecido`.`nome` AS `nome`,count(0) AS `qtd_tecidos`,`pedido`.`usuario_id` AS `usuario_id`,`agendamento`.`data_inicio` AS `data_inicio` from (((`pedido` join `colecao_tecido` on((`colecao_tecido`.`item_pedido_id` = `pedido`.`item_pedido_id`))) join `tecido` on((`tecido`.`id` = `colecao_tecido`.`tecido_id`))) join `agendamento` on((`agendamento`.`id` = `pedido`.`agendamento_id`))) group by `colecao_tecido`.`tecido_id`,`tecido`.`nome`,`pedido`.`usuario_id`,`agendamento`.`data_inicio` order by `qtd_tecidos` desc,`tecido`.`nome`,`pedido`.`usuario_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_total_etapa`
--

/*!50001 DROP VIEW IF EXISTS `vw_total_etapa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`askyu`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_total_etapa` AS select count(0) AS `qtd_agendamento`,`etapa`.`id` AS `etapa_id`,`etapa`.`usuario_id` AS `usuario_id`,`etapa`.`ativo` AS `ativo` from (`agendamento` join `etapa` on((`agendamento`.`etapa_id` = `etapa`.`id`))) group by `etapa`.`id`,`etapa`.`nome`,`etapa`.`usuario_id` */;
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

-- Dump completed on 2025-03-10 23:38:17
