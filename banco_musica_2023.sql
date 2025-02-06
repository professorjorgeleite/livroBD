-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.9.2-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para banco_musica
DROP DATABASE IF EXISTS `banco_musica`;
CREATE DATABASE IF NOT EXISTS `banco_musica` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `banco_musica`;

-- Copiando estrutura para tabela banco_musica.albuns
DROP TABLE IF EXISTS `albuns`;
CREATE TABLE IF NOT EXISTS `albuns` (
  `idalbum` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `idgravadora` int(11) NOT NULL,
  `idartista` int(11) NOT NULL,
  `ano_lancamento` year(4) DEFAULT NULL,
  PRIMARY KEY (`idalbum`) USING BTREE,
  KEY `gravadora_id` (`idgravadora`),
  KEY `artista_id` (`idartista`),
  CONSTRAINT `albuns_ibfk_1` FOREIGN KEY (`idgravadora`) REFERENCES `gravadoras` (`idgravadora`),
  CONSTRAINT `albuns_ibfk_2` FOREIGN KEY (`idartista`) REFERENCES `artistas` (`idartista`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela banco_musica.albuns: ~12 rows (aproximadamente)
DELETE FROM `albuns`;
INSERT INTO `albuns` (`idalbum`, `titulo`, `idgravadora`, `idartista`, `ano_lancamento`) VALUES
	(1, 'Blonde on Blonde', 1, 1, '1966'),
	(2, 'Electric Ladyland', 2, 2, '1968'),
	(3, 'Hunky Dory', 3, 3, '1971'),
	(4, 'Purple Rain', 4, 4, '1984'),
	(5, 'Like a Prayer', 5, 5, '1989'),
	(6, 'OK Computer', 6, 6, '1997'),
	(7, 'Post', 7, 7, '1995'),
	(8, 'Discovery', 8, 8, '2001'),
	(9, 'Revolver', 9, 9, '1966'),
	(10, 'Led Zeppelin IV', 10, 10, '1971'),
	(11, 'Dark Side of the Moon', 11, 11, '1973'),
	(12, 'Highway to Hell', 12, 12, '1980');

-- Copiando estrutura para tabela banco_musica.artistas
DROP TABLE IF EXISTS `artistas`;
CREATE TABLE IF NOT EXISTS `artistas` (
  `idartista` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `nacionalidade` varchar(50) NOT NULL,
  PRIMARY KEY (`idartista`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela banco_musica.artistas: ~38 rows (aproximadamente)
DELETE FROM `artistas`;
INSERT INTO `artistas` (`idartista`, `nome`, `nacionalidade`) VALUES
	(1, 'Bob Dylan', 'Estados Unidos'),
	(2, 'Jimi Hendrix', 'Estados Unidos'),
	(3, 'David Bowie', 'Reino Unido'),
	(4, 'Prince', 'Estados Unidos'),
	(5, 'Madonna', 'Estados Unidos'),
	(6, 'Radiohead', 'Reino Unido'),
	(7, 'Björk', 'Islândia'),
	(8, 'Daft Punk', 'França'),
	(9, 'The Beatles', 'Reino Unido'),
	(10, 'Led Zeppelin', 'Reino Unido'),
	(11, 'Pink Floyd', 'Reino Unido'),
	(12, 'AC/DC', 'Austrália'),
	(13, 'Metallica', 'Estados Unidos'),
	(14, 'Nirvana', 'Estados Unidos'),
	(15, 'Pearl Jam', 'Estados Unidos'),
	(16, 'R.E.M.', 'Estados Unidos'),
	(17, 'Smashing Pumpkins', 'Estados Unidos'),
	(18, 'The Rolling Stones', 'Reino Unido'),
	(19, 'Queen', 'Reino Unido'),
	(20, 'Bob Dylan', 'Estados Unidos'),
	(21, 'Jimi Hendrix', 'Estados Unidos'),
	(22, 'David Bowie', 'Reino Unido'),
	(23, 'Prince', 'Estados Unidos'),
	(24, 'Madonna', 'Estados Unidos'),
	(25, 'Radiohead', 'Reino Unido'),
	(26, 'Björk', 'Islândia'),
	(27, 'Daft Punk', 'França'),
	(28, 'The Beatles', 'Reino Unido'),
	(29, 'Led Zeppelin', 'Reino Unido'),
	(30, 'Pink Floyd', 'Reino Unido'),
	(31, 'AC/DC', 'Austrália'),
	(32, 'Metallica', 'Estados Unidos'),
	(33, 'Nirvana', 'Estados Unidos'),
	(34, 'Pearl Jam', 'Estados Unidos'),
	(35, 'R.E.M.', 'Estados Unidos'),
	(36, 'Smashing Pumpkins', 'Estados Unidos'),
	(37, 'The Rolling Stones', 'Reino Unido'),
	(38, 'Queen', 'Reino Unido');

-- Copiando estrutura para tabela banco_musica.gravadoras
DROP TABLE IF EXISTS `gravadoras`;
CREATE TABLE IF NOT EXISTS `gravadoras` (
  `idgravadora` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `pais` varchar(50) NOT NULL,
  PRIMARY KEY (`idgravadora`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela banco_musica.gravadoras: ~12 rows (aproximadamente)
DELETE FROM `gravadoras`;
INSERT INTO `gravadoras` (`idgravadora`, `nome`, `pais`) VALUES
	(1, 'Columbia Records', 'Estados Unidos'),
	(2, 'Experience Hendrix', 'Estados Unidos'),
	(3, 'RCA Records', 'Estados Unidos'),
	(4, 'Warner Bros. Records', 'Estados Unidos'),
	(5, 'Sire Records', 'Estados Unidos'),
	(6, 'XL Recordings', 'Reino Unido'),
	(7, 'One Little Indian Records', 'Reino Unido'),
	(8, 'Virgin Records', 'Reino Unido'),
	(9, 'Apple Records', 'Reino Unido'),
	(10, 'Atlantic Records', 'Estados Unidos'),
	(11, 'Harvest Records', 'Reino Unido'),
	(12, 'Epic Records', 'Estados Unidos');

-- Copiando estrutura para tabela banco_musica.musicas
DROP TABLE IF EXISTS `musicas`;
CREATE TABLE IF NOT EXISTS `musicas` (
  `idmusica` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `idalbum` int(11) NOT NULL,
  `duracao` time NOT NULL,
  PRIMARY KEY (`idmusica`) USING BTREE,
  KEY `album_id` (`idalbum`) USING BTREE,
  CONSTRAINT `musicas_ibfk_1` FOREIGN KEY (`idalbum`) REFERENCES `albuns` (`idalbum`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela banco_musica.musicas: ~159 rows (aproximadamente)
DELETE FROM `musicas`;
INSERT INTO `musicas` (`idmusica`, `titulo`, `idalbum`, `duracao`) VALUES
	(1, 'Rainy Day Women #12 & 35', 1, '00:04:36'),
	(2, 'Visions of Johanna', 1, '00:07:33'),
	(3, 'Little Wing', 2, '00:03:22'),
	(4, 'All Along the Watchtower', 2, '00:04:01'),
	(5, 'Space Oddity', 3, '00:05:15'),
	(6, 'Life on Mars?', 3, '00:03:54'),
	(7, 'When Doves Cry', 4, '00:05:52'),
	(8, 'Purple Rain', 4, '00:08:41'),
	(9, 'Like a Prayer', 5, '00:05:41'),
	(10, 'Express Yourself', 5, '00:04:39'),
	(11, 'Paranoid Android', 6, '00:06:23'),
	(12, 'Karma Police', 6, '00:04:21'),
	(13, 'Army of Me', 7, '00:03:54'),
	(14, 'Hyperballad', 7, '00:05:23'),
	(15, 'One More Time', 8, '00:05:20'),
	(16, 'Digital Love', 8, '00:05:01'),
	(17, 'Eleanor Rigby', 9, '00:02:06'),
	(18, 'Stairway to Heaven', 10, '00:08:03'),
	(19, 'Money', 11, '00:06:23'),
	(20, 'Rainy Day Women #12 & 35', 1, '00:04:36'),
	(21, 'Visions of Johanna', 1, '00:07:33'),
	(22, 'Pledging My Time', 1, '00:03:50'),
	(23, 'One of Us Must Know (Sooner or Later)', 1, '00:04:54'),
	(24, 'I Want You', 1, '00:03:07'),
	(25, 'Stuck Inside of Mobile with the Memphis Blues Again', 1, '00:07:05'),
	(26, 'Leopard-Skin Pill-Box Hat', 1, '00:03:59'),
	(27, 'Just Like a Woman', 1, '00:04:52'),
	(28, 'Most Likely You Go Your Way and I\'ll Go Mine', 1, '00:03:30'),
	(29, 'Temporary Like Achilles', 1, '00:05:03'),
	(30, 'Absolutely Sweet Marie', 1, '00:04:57'),
	(31, '4th Time Around', 1, '00:04:37'),
	(32, 'Obviously 5 Believers', 1, '00:03:35'),
	(33, 'Sad Eyed Lady of the Lowlands', 1, '00:11:23'),
	(34, 'And the Gods Made Love', 2, '00:01:21'),
	(35, 'Have You Ever Been (To Electric Ladyland)', 2, '00:02:11'),
	(36, 'Crosstown Traffic', 2, '00:02:26'),
	(37, 'Voodoo Chile', 2, '00:15:00'),
	(38, 'Little Miss Strange', 2, '00:02:52'),
	(39, 'Long Hot Summer Night', 2, '00:03:27'),
	(40, 'Come On (Let the Good Times Roll)', 2, '00:04:09'),
	(41, 'Gypsy Eyes', 2, '00:03:43'),
	(42, 'Burning of the Midnight Lamp', 2, '00:03:39'),
	(43, 'Rainy Day, Dream Away', 2, '00:03:42'),
	(44, '1983... (A Merman I Should Turn to Be)', 2, '00:13:40'),
	(45, 'Moon, Turn the Tides...Gently Gently Away', 2, '00:01:02'),
	(46, 'Still Raining, Still Dreaming', 2, '00:04:25'),
	(47, 'House Burning Down', 2, '00:04:33'),
	(48, 'All Along the Watchtower', 2, '00:04:01'),
	(49, 'Voodoo Child (Slight Return)', 2, '00:05:14'),
	(50, 'Changes', 3, '00:03:37'),
	(51, 'Oh! You Pretty Things', 3, '00:03:14'),
	(52, 'Eight Line Poem', 3, '00:02:55'),
	(53, 'Life on Mars?', 3, '00:03:54'),
	(54, 'Kooks', 3, '00:02:53'),
	(55, 'Quicksand', 3, '00:05:09'),
	(56, 'Fill Your Heart', 3, '00:03:07'),
	(57, 'Andy Warhol', 3, '00:03:57'),
	(58, 'Song for Bob Dylan', 3, '00:04:12'),
	(59, 'Queen Bitch', 3, '00:03:19'),
	(60, 'The Bewlay Brothers', 3, '00:05:21'),
	(61, 'Let\'s Go Crazy', 4, '00:04:39'),
	(62, 'Take Me With U', 4, '00:03:54'),
	(63, 'The Beautiful Ones', 4, '00:05:13'),
	(64, 'Computer Blue', 4, '00:03:59'),
	(65, 'Darling Nikki', 4, '00:04:15'),
	(66, 'When Doves Cry', 4, '00:05:54'),
	(67, 'I Would Die 4 U', 4, '00:02:49'),
	(68, 'Baby I\'m a Star', 4, '00:04:24'),
	(69, 'Purple Rain', 4, '00:08:41'),
	(70, 'Like a Prayer', 5, '00:05:41'),
	(71, 'Express Yourself', 5, '00:04:39'),
	(72, 'Love Song', 5, '00:04:52'),
	(73, 'Till Death Do Us Part', 5, '00:05:16'),
	(74, 'Promise to Try', 5, '00:03:38'),
	(75, 'Cherish', 5, '00:05:03'),
	(76, 'Dear Jessie', 5, '00:04:21'),
	(77, 'Oh Father', 5, '00:04:57'),
	(78, 'Keep It Together', 5, '00:05:03'),
	(79, 'Pray for Spanish Eyes', 5, '00:05:17'),
	(80, 'Act of Contrition', 5, '00:02:19'),
	(81, 'Airbag', 6, '00:04:44'),
	(82, 'Paranoid Android', 6, '00:06:23'),
	(83, 'Subterranean Homesick Alien', 6, '00:04:27'),
	(84, 'Exit Music (For a Film)', 6, '00:04:24'),
	(85, 'Let Down', 6, '00:04:59'),
	(86, 'Karma Police', 6, '00:04:22'),
	(87, 'Fitter Happier', 6, '00:01:57'),
	(88, 'Electioneering', 6, '00:03:50'),
	(89, 'Climbing Up the Walls', 6, '00:04:45'),
	(90, 'No Surprises', 6, '00:03:48'),
	(91, 'Lucky', 6, '00:04:19'),
	(92, 'The Tourist', 6, '00:05:24'),
	(93, 'Army of Me', 7, '00:04:39'),
	(94, 'Hyperballad', 7, '00:05:21'),
	(95, 'The Modern Things', 7, '00:04:10'),
	(96, 'It\'s Oh So Quiet', 7, '00:03:38'),
	(97, 'Enjoy', 7, '00:03:57'),
	(98, 'You\'ve Been Flirting Again', 7, '00:02:28'),
	(99, 'Isobel', 7, '00:05:47'),
	(100, 'Possibly Maybe', 7, '00:05:06'),
	(101, 'I Miss You', 7, '00:04:03'),
	(102, 'Cover Me', 7, '00:02:06'),
	(103, 'Headphones', 7, '00:05:43'),
	(104, 'One More Time', 8, '00:05:20'),
	(105, 'Aerodynamic', 8, '00:03:27'),
	(106, 'Digital Love', 8, '00:04:58'),
	(107, 'Harder, Better, Faster, Stronger', 8, '00:03:45'),
	(108, 'Crescendolls', 8, '00:03:31'),
	(109, 'Nightvision', 8, '00:01:44'),
	(110, 'Superheroes', 8, '00:03:57'),
	(111, 'High Life', 8, '00:03:21'),
	(112, 'Something About Us', 8, '00:03:50'),
	(113, 'Voyager', 8, '00:03:47'),
	(114, 'Veridis Quo', 8, '00:05:44'),
	(115, 'Short Circuit', 8, '00:03:26'),
	(116, 'Face to Face', 8, '00:04:00'),
	(117, 'Too Long', 8, '00:10:00'),
	(118, 'Taxman', 9, '00:02:39'),
	(119, 'Eleanor Rigby', 9, '00:02:07'),
	(120, 'I\'m Only Sleeping', 9, '00:03:00'),
	(121, 'Love You To', 9, '00:03:01'),
	(122, 'Here, There and Everywhere', 9, '00:02:25'),
	(123, 'Yellow Submarine', 9, '00:02:38'),
	(124, 'She Said She Said', 9, '00:02:37'),
	(125, 'Good Day Sunshine', 9, '00:02:10'),
	(126, 'And Your Bird Can Sing', 9, '00:02:01'),
	(127, 'For No One', 9, '00:02:02'),
	(128, 'Doctor Robert', 9, '00:02:14'),
	(129, 'I Want to Tell You', 9, '00:02:30'),
	(130, 'Got to Get You into My Life', 9, '00:02:31'),
	(131, 'Tomorrow Never Knows', 9, '00:02:57'),
	(132, 'Black Dog', 10, '00:04:54'),
	(133, 'Rock and Roll', 10, '00:03:40'),
	(134, 'The Battle of Evermore', 10, '00:05:51'),
	(135, 'Stairway to Heaven', 10, '00:08:02'),
	(136, 'Misty Mountain Hop', 10, '00:04:38'),
	(137, 'Four Sticks', 10, '00:04:44'),
	(138, 'Going to California', 10, '00:03:32'),
	(139, 'When the Levee Breaks', 10, '00:07:08'),
	(140, 'Speak to Me', 11, '00:01:07'),
	(141, 'Breathe', 11, '00:02:44'),
	(142, 'On the Run', 11, '00:03:35'),
	(143, 'Time', 11, '00:06:53'),
	(144, 'The Great Gig in the Sky', 11, '00:04:47'),
	(145, 'Money', 11, '00:06:23'),
	(146, 'Us and Them', 11, '00:07:49'),
	(147, 'Any Colour You Like', 11, '00:03:24'),
	(148, 'Brain Damage', 11, '00:03:50'),
	(149, 'Eclipse', 11, '00:02:04'),
	(150, 'Highway to Hell', 12, '00:03:29'),
	(151, 'Girls Got Rhythm', 12, '00:03:23'),
	(152, 'Walk All Over You', 12, '00:05:10'),
	(153, 'Touch Too Much', 12, '00:04:26'),
	(154, 'Beating Around the Bush', 12, '00:03:56'),
	(155, 'Shot Down in Flames', 12, '00:03:23'),
	(156, 'Get It Hot', 12, '00:02:34'),
	(157, 'If You Want Blood (You\'ve Got It)', 12, '00:04:38'),
	(158, 'Love Hungry Man', 12, '00:04:17'),
	(159, 'Night Prowler', 12, '00:06:13');

-- Copiando estrutura para tabela banco_musica.premios
DROP TABLE IF EXISTS `premios`;
CREATE TABLE IF NOT EXISTS `premios` (
  `idpremio` int(11) NOT NULL AUTO_INCREMENT,
  `idartista` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `data_premiacao` date NOT NULL,
  PRIMARY KEY (`idpremio`) USING BTREE,
  KEY `artista_id` (`idartista`) USING BTREE,
  CONSTRAINT `premios_ibfk_1` FOREIGN KEY (`idartista`) REFERENCES `artistas` (`idartista`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela banco_musica.premios: ~21 rows (aproximadamente)
DELETE FROM `premios`;
INSERT INTO `premios` (`idpremio`, `idartista`, `descricao`, `data_premiacao`) VALUES
	(1, 1, 'Grammy Award for Album of the Year - "Time Out of Mind"', '1991-02-20'),
	(2, 1, 'Grammy Award for Best Contemporary Folk Album - "Love and Theft"', '2001-02-21'),
	(3, 1, 'Grammy Award for Best Contemporary Folk/Americana Album - "Modern Times"', '2007-02-11'),
	(4, 2, 'Grammy Lifetime Achievement Award', '1992-01-22'),
	(5, 2, 'Grammy Hall of Fame Award for "Are You Experienced?"', '1999-01-06'),
	(6, 2, 'Grammy Hall of Fame Award for "Purple Haze"', '2006-02-08'),
	(7, 2, 'Grammy Lifetime Achievement Award', '1992-01-22'),
	(8, 2, 'Grammy Hall of Fame Award for "Are You Experienced?"', '1999-01-06'),
	(9, 2, 'Grammy Hall of Fame Award for "Purple Haze"', '2006-02-08'),
	(10, 3, 'Grammy Award for Best Short Form Music Video - Jazzin for Blue Jean', '1985-02-27'),
	(11, 3, 'MTV Video Music Award for Best Overall Performance in a Video - "Blue Jean', '1985-11-23'),
	(12, 3, 'Grammy Lifetime Achievement Award', '2017-02-12'),
	(13, 4, 'Academy Award for Best Original Song Score for "Purple Rain"', '1985-02-27'),
	(14, 4, 'Grammy Award for Best Album of Original Score Written for a Motion Picture or a Television Special for "Purple Rain"', '1985-02-27'),
	(15, 4, 'Grammy Award for Best Rock Performance by a Duo or Group with Vocal for "Purple Rain"', '1985-02-27'),
	(16, 5, 'Grammy Award for Best Long Form Music Video - "Blond Ambition World Tour Live"', '1991-02-20'),
	(17, 5, 'MTV Video Music Award for Best Video from a Film - "Beautiful Stranger"', '1999-09-09'),
	(18, 5, 'Grammy Award for Best Electronic/Dance Album - "Confessions on a Dance Floor"', '2006-02-08'),
	(19, 6, 'NME Award for Best Album - "Kid A"', '2001-02-21'),
	(20, 6, 'Grammy Award for Best Alternative Music Album - "In Rainbows"', '2009-02-08'),
	(21, 6, 'Glastonbury Festival Headliner', '2018-07-06');

-- Copiando estrutura para tabela banco_musica.vendas
DROP TABLE IF EXISTS `vendas`;
CREATE TABLE IF NOT EXISTS `vendas` (
  `idvenda` int(11) NOT NULL AUTO_INCREMENT,
  `idalbum` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `copias` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idvenda`) USING BTREE,
  KEY `album_id` (`idalbum`) USING BTREE,
  CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`idalbum`) REFERENCES `albums` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela banco_musica.vendas: ~21 rows (aproximadamente)
DELETE FROM `vendas`;
INSERT INTO `vendas` (`idvenda`, `idalbum`, `ano`, `copias`) VALUES
	(1, 1, 1966, 1500000.00),
	(2, 1, 1967, 1000000.00),
	(3, 2, 1968, 500000.00),
	(4, 2, 1969, 1500000.00),
	(5, 3, 1971, 500000.00),
	(6, 4, 1984, 8000000.00),
	(7, 4, 1985, 12000000.00),
	(8, 4, 1986, 2000000.00),
	(9, 5, 1989, 7000000.00),
	(10, 6, 1997, 2000000.00),
	(11, 7, 1995, 3000000.00),
	(12, 7, 1996, 6000000.00),
	(13, 7, 1997, 2000000.00),
	(14, 8, 2001, 3000000.00),
	(15, 9, 1966, 1700000.00),
	(16, 10, 1971, 3000000.00),
	(17, 11, 1973, 8000000.00),
	(18, 11, 1974, 10000000.00),
	(19, 11, 1975, 4000000.00),
	(20, 11, 1976, 1000000.00),
	(21, 12, 1979, 7000000.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
