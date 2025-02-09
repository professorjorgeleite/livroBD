-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           11.3.0-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para cinemas
CREATE DATABASE IF NOT EXISTS `cinemas` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;
USE `cinemas`;

-- Copiando estrutura para tabela cinemas.atores
CREATE TABLE IF NOT EXISTS `atores` (
  `idatores` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `segurosocial` varchar(45) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `nacionalidade` varchar(45) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`idatores`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela cinemas.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `idcategorias` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela cinemas.elenco
CREATE TABLE IF NOT EXISTS `elenco` (
  `idfilmes` int(11) NOT NULL,
  `idatores` int(11) NOT NULL,
  `cache` float DEFAULT NULL,
  `papel` varchar(45) DEFAULT NULL,
  `tipofisico` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idfilmes`,`idatores`),
  KEY `fk_filmes_has_atores_atores1_idx` (`idatores`),
  KEY `fk_filmes_has_atores_filmes1_idx` (`idfilmes`),
  CONSTRAINT `fk_filmes_has_atores_atores1` FOREIGN KEY (`idatores`) REFERENCES `atores` (`idatores`),
  CONSTRAINT `fk_filmes_has_atores_filmes1` FOREIGN KEY (`idfilmes`) REFERENCES `filmes` (`idfilmes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela cinemas.estudios
CREATE TABLE IF NOT EXISTS `estudios` (
  `idestudios` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `dono` varchar(100) NOT NULL,
  `datafundacao` date DEFAULT NULL,
  PRIMARY KEY (`idestudios`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela cinemas.faturamentos
CREATE TABLE IF NOT EXISTS `faturamentos` (
  `idfaturamentos` int(11) NOT NULL AUTO_INCREMENT,
  `ano` int(10) unsigned DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `idestudios` int(11) NOT NULL,
  PRIMARY KEY (`idfaturamentos`,`idestudios`),
  KEY `fk_faturamentos_estudios1_idx` (`idestudios`),
  CONSTRAINT `fk_faturamentos_estudios1` FOREIGN KEY (`idestudios`) REFERENCES `estudios` (`idestudios`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela cinemas.filmes
CREATE TABLE IF NOT EXISTS `filmes` (
  `idfilmes` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `tempoproducao` int(10) unsigned DEFAULT NULL,
  `ano` int(10) unsigned DEFAULT NULL,
  `copyrigth` varchar(45) DEFAULT NULL,
  `custo` float DEFAULT NULL,
  `idestudios` int(11) DEFAULT 1,
  `idcategorias` int(11) DEFAULT 1,
  PRIMARY KEY (`idfilmes`),
  KEY `FK_filmes_categorias` (`idcategorias`),
  KEY `FK_filmes_estudios` (`idestudios`),
  CONSTRAINT `FK_filmes_categorias` FOREIGN KEY (`idcategorias`) REFERENCES `categorias` (`idcategorias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_filmes_estudios` FOREIGN KEY (`idestudios`) REFERENCES `estudios` (`idestudios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela cinemas.telefones
CREATE TABLE IF NOT EXISTS `telefones` (
  `idtelefones` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) DEFAULT NULL,
  `idestudios` int(11) NOT NULL,
  PRIMARY KEY (`idtelefones`,`idestudios`),
  KEY `fk_telefones_estudios_idx` (`idestudios`),
  CONSTRAINT `fk_telefones_estudios` FOREIGN KEY (`idestudios`) REFERENCES `estudios` (`idestudios`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela cinemas.tipos_papeis
CREATE TABLE IF NOT EXISTS `tipos_papeis` (
  `idtipos_papeis` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `idatores` int(11) NOT NULL,
  PRIMARY KEY (`idtipos_papeis`,`idatores`),
  KEY `fk_tipos_papeis_atores1_idx` (`idatores`),
  CONSTRAINT `fk_tipos_papeis_atores1` FOREIGN KEY (`idatores`) REFERENCES `atores` (`idatores`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
