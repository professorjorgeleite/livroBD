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


-- Copiando estrutura do banco de dados para cinemas
DROP DATABASE IF EXISTS `cinemas`;
CREATE DATABASE IF NOT EXISTS `cinemas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cinemas`;

-- Copiando estrutura para tabela cinemas.atores
DROP TABLE IF EXISTS `atores`;
CREATE TABLE IF NOT EXISTS `atores` (
  `idatores` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `segurosocial` varchar(45) NOT NULL,
  `idade` int(11) DEFAULT NULL,
  `nacionalidade` varchar(45) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`idatores`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cinemas.atores: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `atores` DISABLE KEYS */;
REPLACE INTO `atores` (`idatores`, `nome`, `segurosocial`, `idade`, `nacionalidade`, `sexo`) VALUES
	(1, 'Brad Pitt', '1223', 40, 'americano', 'm'),
	(2, 'Angelina Jolie', '1224', 51, 'americano', 'f'),
	(3, 'Vera Fischer', '1224', 61, 'brasileiro', 'f'),
	(4, 'Leonardo DiCaprio', '2444', 41, 'americano', 'm'),
	(5, 'Paola Oliveira', '0012', 29, 'brasileiro', 'f'),
	(6, 'Cris Pratt', '8888', 33, 'americano', 'm');
/*!40000 ALTER TABLE `atores` ENABLE KEYS */;

-- Copiando estrutura para tabela cinemas.categorias
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `idcategorias` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cinemas.categorias: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
REPLACE INTO `categorias` (`idcategorias`, `nome`) VALUES
	(1, 'humor'),
	(2, 'terror'),
	(3, 'romance'),
	(4, 'ação'),
	(5, 'suspense');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Copiando estrutura para tabela cinemas.elenco
DROP TABLE IF EXISTS `elenco`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cinemas.elenco: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `elenco` DISABLE KEYS */;
REPLACE INTO `elenco` (`idfilmes`, `idatores`, `cache`, `papel`, `tipofisico`) VALUES
	(1, 1, NULL, NULL, NULL),
	(1, 2, NULL, NULL, NULL),
	(2, 2, NULL, NULL, NULL),
	(2, 3, NULL, NULL, NULL),
	(2, 5, NULL, NULL, NULL),
	(3, 1, NULL, NULL, NULL),
	(3, 3, NULL, NULL, NULL),
	(4, 5, NULL, NULL, NULL),
	(4, 6, NULL, NULL, NULL),
	(5, 1, NULL, NULL, NULL),
	(5, 2, NULL, NULL, NULL),
	(5, 5, NULL, NULL, NULL),
	(6, 1, NULL, NULL, NULL);
/*!40000 ALTER TABLE `elenco` ENABLE KEYS */;

-- Copiando estrutura para tabela cinemas.estudios
DROP TABLE IF EXISTS `estudios`;
CREATE TABLE IF NOT EXISTS `estudios` (
  `idestudios` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `dono` varchar(45) NOT NULL,
  `datafundacao` date DEFAULT NULL,
  PRIMARY KEY (`idestudios`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cinemas.estudios: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `estudios` DISABLE KEYS */;
REPLACE INTO `estudios` (`idestudios`, `nome`, `dono`, `datafundacao`) VALUES
	(1, 'MGM', 'Poppe', '1900-01-12'),
	(2, 'FOX', 'Paul', '1920-04-12'),
	(3, 'WARNER', 'David', '1910-01-12'),
	(4, 'DISNEY', 'Waltz', '1908-01-31');
/*!40000 ALTER TABLE `estudios` ENABLE KEYS */;

-- Copiando estrutura para tabela cinemas.faturamentos
DROP TABLE IF EXISTS `faturamentos`;
CREATE TABLE IF NOT EXISTS `faturamentos` (
  `idfaturamentos` int(11) NOT NULL AUTO_INCREMENT,
  `ano` int(10) unsigned DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `idestudios` int(11) NOT NULL,
  PRIMARY KEY (`idfaturamentos`,`idestudios`),
  KEY `fk_faturamentos_estudios1_idx` (`idestudios`),
  CONSTRAINT `fk_faturamentos_estudios1` FOREIGN KEY (`idestudios`) REFERENCES `estudios` (`idestudios`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cinemas.faturamentos: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `faturamentos` DISABLE KEYS */;
REPLACE INTO `faturamentos` (`idfaturamentos`, `ano`, `valor`, `idestudios`) VALUES
	(1, 2000, 100000, 1),
	(2, 2001, 200000, 1),
	(3, 2002, 300000, 1),
	(4, 2003, 400000, 1),
	(5, 2000, 100000, 2),
	(6, 2001, 200000, 2),
	(7, 2002, 500000, 2),
	(8, 2003, 800000, 2),
	(9, 2000, 900000, 3),
	(10, 2001, 100000, 3),
	(11, 2002, 700000, 3),
	(12, 2003, 200000, 3);
/*!40000 ALTER TABLE `faturamentos` ENABLE KEYS */;

-- Copiando estrutura para tabela cinemas.filmes
DROP TABLE IF EXISTS `filmes`;
CREATE TABLE IF NOT EXISTS `filmes` (
  `idfilmes` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `tempoproducao` int(10) unsigned DEFAULT NULL,
  `ano` int(10) unsigned DEFAULT NULL,
  `copyrigth` varchar(45) DEFAULT NULL,
  `custo` float DEFAULT NULL,
  `idestudios` int(11) NOT NULL,
  `idcategorias` int(11) NOT NULL,
  PRIMARY KEY (`idfilmes`,`idestudios`,`idcategorias`),
  UNIQUE KEY `nome_UNIQUE` (`nome`),
  UNIQUE KEY `ano_UNIQUE` (`ano`),
  KEY `fk_filmes_estudios1_idx` (`idestudios`),
  KEY `fk_filmes_categorias1_idx` (`idcategorias`),
  CONSTRAINT `fk_filmes_categorias1` FOREIGN KEY (`idcategorias`) REFERENCES `categorias` (`idcategorias`),
  CONSTRAINT `fk_filmes_estudios1` FOREIGN KEY (`idestudios`) REFERENCES `estudios` (`idestudios`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cinemas.filmes: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `filmes` DISABLE KEYS */;
REPLACE INTO `filmes` (`idfilmes`, `nome`, `tempoproducao`, `ano`, `copyrigth`, `custo`, `idestudios`, `idcategorias`) VALUES
	(1, 'E o vento Levou', 2, 1910, '1222', 30000, 1, 3),
	(2, 'Era uma vez em Hollywood', 2, 2019, '122222', 50000, 1, 2),
	(3, 'A Coisa', 1, 2018, '100011', 100000, 2, 2),
	(4, 'Footlose', 2, 1981, '32323', 143000, 3, 3),
	(5, 'Superman', 2, 1978, '202121', 100000, 3, 4),
	(6, 'Homem Aranha', 2, 2003, '121545454', 600000, 4, 4),
	(7, 'A rua', 3, 2010, '12323232', 6000000, 1, 1);
/*!40000 ALTER TABLE `filmes` ENABLE KEYS */;

-- Copiando estrutura para tabela cinemas.telefones
DROP TABLE IF EXISTS `telefones`;
CREATE TABLE IF NOT EXISTS `telefones` (
  `idtelefones` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) DEFAULT NULL,
  `idestudios` int(11) NOT NULL,
  PRIMARY KEY (`idtelefones`,`idestudios`),
  KEY `fk_telefones_estudios_idx` (`idestudios`),
  CONSTRAINT `fk_telefones_estudios` FOREIGN KEY (`idestudios`) REFERENCES `estudios` (`idestudios`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cinemas.telefones: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `telefones` DISABLE KEYS */;
REPLACE INTO `telefones` (`idtelefones`, `numero`, `idestudios`) VALUES
	(1, '9999', 1),
	(2, '88888', 1),
	(3, '9999888', 1),
	(4, '11119999', 1),
	(5, '22229999', 2),
	(6, '9999', 2),
	(7, '666', 3),
	(8, '777', 4);
/*!40000 ALTER TABLE `telefones` ENABLE KEYS */;

-- Copiando estrutura para tabela cinemas.tipos_papeis
DROP TABLE IF EXISTS `tipos_papeis`;
CREATE TABLE IF NOT EXISTS `tipos_papeis` (
  `idtipos_papeis` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `idatores` int(11) NOT NULL,
  PRIMARY KEY (`idtipos_papeis`,`idatores`),
  KEY `fk_tipos_papeis_atores1_idx` (`idatores`),
  CONSTRAINT `fk_tipos_papeis_atores1` FOREIGN KEY (`idatores`) REFERENCES `atores` (`idatores`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cinemas.tipos_papeis: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tipos_papeis` DISABLE KEYS */;
REPLACE INTO `tipos_papeis` (`idtipos_papeis`, `descricao`, `idatores`) VALUES
	(1, 'policial', 5),
	(2, 'modelo', 5),
	(3, 'donzela', 5),
	(4, 'musa', 5);
/*!40000 ALTER TABLE `tipos_papeis` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
