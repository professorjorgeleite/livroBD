-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.5.9-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6317
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para bancoprojetos
DROP DATABASE IF EXISTS `bancoprojetos`;
CREATE DATABASE IF NOT EXISTS `bancoprojetos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bancoprojetos`;

-- Copiando estrutura para tabela bancoprojetos.areas
DROP TABLE IF EXISTS `areas`;
CREATE TABLE IF NOT EXISTS `areas` (
  `idareas` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `relevancia` float NOT NULL,
  PRIMARY KEY (`idareas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bancoprojetos.areas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;

-- Copiando estrutura para tabela bancoprojetos.ares_asssesores
DROP TABLE IF EXISTS `ares_asssesores`;
CREATE TABLE IF NOT EXISTS `ares_asssesores` (
  `idassesores` int(11) NOT NULL,
  `idareas` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idassesores`,`idareas`),
  KEY `fk_assesores_has_areas_areas1_idx` (`idareas`),
  KEY `fk_assesores_has_areas_assesores1_idx` (`idassesores`),
  CONSTRAINT `fk_assesores_has_areas_areas1` FOREIGN KEY (`idareas`) REFERENCES `areas` (`idareas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_assesores_has_areas_assesores1` FOREIGN KEY (`idassesores`) REFERENCES `assesores` (`idassesores`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bancoprojetos.ares_asssesores: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ares_asssesores` DISABLE KEYS */;
/*!40000 ALTER TABLE `ares_asssesores` ENABLE KEYS */;

-- Copiando estrutura para tabela bancoprojetos.assesores
DROP TABLE IF EXISTS `assesores`;
CREATE TABLE IF NOT EXISTS `assesores` (
  `idassesores` int(11) NOT NULL AUTO_INCREMENT,
  `instituicao_trabalha` varchar(45) DEFAULT NULL,
  `idpessoas` int(11) NOT NULL,
  PRIMARY KEY (`idassesores`,`idpessoas`),
  KEY `fk_assesores_pessoas1_idx` (`idpessoas`),
  CONSTRAINT `fk_assesores_pessoas1` FOREIGN KEY (`idpessoas`) REFERENCES `pessoas` (`idpessoas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bancoprojetos.assesores: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `assesores` DISABLE KEYS */;
/*!40000 ALTER TABLE `assesores` ENABLE KEYS */;

-- Copiando estrutura para tabela bancoprojetos.avaliacoes
DROP TABLE IF EXISTS `avaliacoes`;
CREATE TABLE IF NOT EXISTS `avaliacoes` (
  `idavaliacoes` int(11) NOT NULL AUTO_INCREMENT,
  `datarecebimento` date NOT NULL,
  `dataparecer` date DEFAULT NULL,
  `parecer` text DEFAULT NULL,
  `aprovacao` enum('sim','nao') DEFAULT NULL,
  `idprojetos` int(10) unsigned NOT NULL,
  `idassesores` int(11) NOT NULL,
  PRIMARY KEY (`idavaliacoes`,`idprojetos`,`idassesores`),
  KEY `fk_avaliacoes_projetos1_idx` (`idprojetos`),
  KEY `fk_avaliacoes_assesores1_idx` (`idassesores`),
  CONSTRAINT `fk_avaliacoes_assesores1` FOREIGN KEY (`idassesores`) REFERENCES `assesores` (`idassesores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_avaliacoes_projetos1` FOREIGN KEY (`idprojetos`) REFERENCES `projetos` (`idprojetos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bancoprojetos.avaliacoes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `avaliacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacoes` ENABLE KEYS */;

-- Copiando estrutura para tabela bancoprojetos.pesquisadores
DROP TABLE IF EXISTS `pesquisadores`;
CREATE TABLE IF NOT EXISTS `pesquisadores` (
  `idpesquisadores` int(11) NOT NULL AUTO_INCREMENT,
  `instituicao_titulo` varchar(45) DEFAULT NULL,
  `idpessoas` int(11) NOT NULL,
  PRIMARY KEY (`idpesquisadores`,`idpessoas`),
  KEY `fk_pesquisadores_pessoas1_idx` (`idpessoas`),
  CONSTRAINT `fk_pesquisadores_pessoas1` FOREIGN KEY (`idpessoas`) REFERENCES `pessoas` (`idpessoas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bancoprojetos.pesquisadores: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pesquisadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesquisadores` ENABLE KEYS */;

-- Copiando estrutura para tabela bancoprojetos.pessoas
DROP TABLE IF EXISTS `pessoas`;
CREATE TABLE IF NOT EXISTS `pessoas` (
  `idpessoas` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `RG` varchar(45) DEFAULT NULL,
  `CPF` varchar(45) NOT NULL,
  `sexo` enum('f','m','nd') DEFAULT NULL,
  `datanascimento` date DEFAULT NULL,
  `graucientifico` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpessoas`),
  UNIQUE KEY `CPF_UNIQUE` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bancoprojetos.pessoas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;

-- Copiando estrutura para tabela bancoprojetos.projetos
DROP TABLE IF EXISTS `projetos`;
CREATE TABLE IF NOT EXISTS `projetos` (
  `idprojetos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(300) NOT NULL,
  `duracao` int(10) unsigned DEFAULT NULL COMMENT 'duracao em meses do projeto',
  `instituicao` varchar(45) DEFAULT NULL,
  `idareas` int(10) unsigned NOT NULL,
  `idpesquisadores` int(11) NOT NULL,
  PRIMARY KEY (`idprojetos`,`idareas`,`idpesquisadores`),
  KEY `fk_projetos_areas_idx` (`idareas`),
  KEY `fk_projetos_pesquisadores1_idx` (`idpesquisadores`),
  CONSTRAINT `fk_projetos_areas` FOREIGN KEY (`idareas`) REFERENCES `areas` (`idareas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_projetos_pesquisadores1` FOREIGN KEY (`idpesquisadores`) REFERENCES `pesquisadores` (`idpesquisadores`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bancoprojetos.projetos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `projetos` DISABLE KEYS */;
/*!40000 ALTER TABLE `projetos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
