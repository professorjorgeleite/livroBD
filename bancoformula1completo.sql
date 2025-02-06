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


-- Copiando estrutura do banco de dados para campeonatof1
CREATE DATABASE IF NOT EXISTS `campeonatof1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `campeonatof1`;

-- Copiando estrutura para tabela campeonatof1.campeonatos
CREATE TABLE IF NOT EXISTS `campeonatos` (
  `idcampeonatos` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `ano` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idcampeonatos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela campeonatof1.campeonatos: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `campeonatos` DISABLE KEYS */;
REPLACE INTO `campeonatos` (`idcampeonatos`, `nome`, `ano`) VALUES
	(1, 'Campeonato Mundial F1', 2020);
/*!40000 ALTER TABLE `campeonatos` ENABLE KEYS */;

-- Copiando estrutura para tabela campeonatof1.corridas
CREATE TABLE IF NOT EXISTS `corridas` (
  `idcorridas` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `circuito` varchar(255) DEFAULT NULL,
  `datacorrida` date DEFAULT NULL,
  `idcampeonatos` int(11) NOT NULL,
  `idpais` int(11) NOT NULL,
  PRIMARY KEY (`idcorridas`,`idcampeonatos`,`idpais`),
  KEY `fk_corridas_campeonatos1_idx` (`idcampeonatos`),
  KEY `fk_corridas_pais1_idx` (`idpais`),
  CONSTRAINT `fk_corridas_campeonatos1` FOREIGN KEY (`idcampeonatos`) REFERENCES `campeonatos` (`idcampeonatos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_corridas_pais1` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela campeonatof1.corridas: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `corridas` DISABLE KEYS */;
REPLACE INTO `corridas` (`idcorridas`, `nome`, `circuito`, `datacorrida`, `idcampeonatos`, `idpais`) VALUES
	(1, 'Grande Prêmio da Áustria', 'Red Bull Ring, Spielberg', '2020-07-05', 1, 40),
	(2, 'Grande Prêmio da Estíria', ' Red Bull Ring, Spielberg', '2020-07-12', 1, 43),
	(3, 'Grande Prêmio da Hungria', ' Hungaroring, Mogyoród', '2020-07-19', 1, 60),
	(4, 'Grande Prêmio da Grã-Bretanha', ' Circuito de Silverstone, Silverstone', '2020-08-02', 1, 61),
	(5, 'Grande Prêmio do 70.º Aniversário', ' Circuito de Silverstone, Silverstone', '2020-08-09', 1, 61),
	(6, 'Grande Prêmio da Espanha', ' Circuito de Barcelona-Catalunha, Montmeló', '2020-08-16', 1, 54),
	(7, 'Grande Prêmio da Bélgica', ' Circuito de Spa-Francorchamps, Stavelot', '2020-08-30', 1, 45),
	(8, 'Grande Prêmio da Itália', ' Autódromo Nacional de Monza, Monza', '2020-09-06', 1, 64),
	(9, 'Grande Prêmio da Toscana', ' Circuito de Mugello, Toscana', '2020-09-13', 1, 64),
	(10, 'Grande Prêmio da Rússia', ' Autódromo de Sóchi, Sóchi', '2020-09-27', 1, 171),
	(11, 'Grande Prêmio de Eifel', ' Nürburgring, Nürburg', '2020-10-11', 1, 40),
	(12, 'Grande Prêmio de Portugal', ' Autódromo Internacional do Algarve, Portimão', '2020-10-25', 1, 76),
	(13, 'Grande Prêmio da Emília-Romanha', ' Autódromo Enzo e Dino Ferrari, Ímola', '2020-11-01', 1, 64),
	(14, 'Grande Prêmio da Turquia', ' Istanbul Park, Istambul', '2020-11-15', 1, 178),
	(15, 'Grande Prêmio do Barém', ' Circuito Internacional do Barém, Sakhir', '2020-11-22', 1, 139),
	(16, 'Grande Prêmio de Sakhir', ' Circuito Internacional do Barém, Sakhir', '2020-12-06', 1, 139),
	(17, 'Grande Prêmio de Abu Dhabi', ' Circuito de Yas Marina, Abu Dhabi', '2020-12-13', 1, 150);
/*!40000 ALTER TABLE `corridas` ENABLE KEYS */;

-- Copiando estrutura para tabela campeonatof1.equipes
CREATE TABLE IF NOT EXISTS `equipes` (
  `idequipes` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `idpais` int(11) NOT NULL,
  PRIMARY KEY (`idequipes`,`idpais`),
  KEY `fk_equipes_pais1_idx` (`idpais`),
  CONSTRAINT `fk_equipes_pais1` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela campeonatof1.equipes: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `equipes` DISABLE KEYS */;
REPLACE INTO `equipes` (`idequipes`, `nome`, `idpais`) VALUES
	(1, 'Mercedes', 40),
	(2, 'Red Bull/Honda', 61),
	(3, 'McLaren/Renault', 61),
	(4, 'Racing Point/Mercedes', 61),
	(5, 'Renault', 57),
	(6, 'Ferrari', 64),
	(7, 'AlphaTauri/Honda', 61),
	(8, 'Alfa Romeo/Ferrari', 40),
	(9, 'Haas/Ferrari', 15),
	(10, 'Williams/Mercedes', 61);
/*!40000 ALTER TABLE `equipes` ENABLE KEYS */;

-- Copiando estrutura para tabela campeonatof1.membros
CREATE TABLE IF NOT EXISTS `membros` (
  `idmembros` int(11) NOT NULL AUTO_INCREMENT,
  `idcampeonatos` int(11) NOT NULL,
  `idpilotos` int(11) NOT NULL,
  `idequipes` int(11) NOT NULL,
  `numerocarro` int(11) NOT NULL,
  PRIMARY KEY (`idmembros`) USING BTREE,
  KEY `fk_equipes_campeonatos_campeonatos1_idx` (`idcampeonatos`) USING BTREE,
  KEY `fk_equipes_campeonatos_pilotos1_idx` (`idpilotos`) USING BTREE,
  KEY `fk_equipes_campeonatos_equipes1_idx` (`idequipes`) USING BTREE,
  CONSTRAINT `fk_equipes_campeonatos_campeonatos1` FOREIGN KEY (`idcampeonatos`) REFERENCES `campeonatos` (`idcampeonatos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipes_campeonatos_equipes1` FOREIGN KEY (`idequipes`) REFERENCES `equipes` (`idequipes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipes_campeonatos_pilotos1` FOREIGN KEY (`idpilotos`) REFERENCES `pilotos` (`idpilotos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela campeonatof1.membros: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `membros` DISABLE KEYS */;
REPLACE INTO `membros` (`idmembros`, `idcampeonatos`, `idpilotos`, `idequipes`, `numerocarro`) VALUES
	(1, 1, 1, 8, 7),
	(2, 1, 2, 8, 99),
	(3, 1, 3, 7, 10),
	(4, 1, 4, 7, 26),
	(5, 1, 5, 6, 5),
	(6, 1, 6, 6, 16),
	(7, 1, 7, 9, 8),
	(8, 1, 8, 9, 20),
	(9, 1, 9, 9, 51),
	(10, 1, 10, 3, 4),
	(11, 1, 11, 3, 55),
	(12, 1, 12, 1, 44),
	(13, 1, 23, 1, 63),
	(14, 1, 14, 1, 77),
	(15, 1, 15, 4, 11),
	(16, 1, 16, 4, 18),
	(17, 1, 17, 4, 27),
	(18, 1, 18, 2, 23),
	(19, 1, 19, 2, 33),
	(20, 1, 20, 5, 3),
	(21, 1, 21, 5, 31),
	(22, 1, 22, 10, 6),
	(23, 1, 23, 10, 63),
	(24, 1, 24, 10, 89);
/*!40000 ALTER TABLE `membros` ENABLE KEYS */;

-- Copiando estrutura para tabela campeonatof1.pais
CREATE TABLE IF NOT EXISTS `pais` (
  `idpais` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `capital` varchar(100) DEFAULT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  `continente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpais`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela campeonatof1.pais: ~194 rows (aproximadamente)
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
REPLACE INTO `pais` (`idpais`, `nome`, `capital`, `sigla`, `continente`) VALUES
	(2, 'Bolívia', 'La Paz', 'BO / BOL', 'América do Sul'),
	(3, 'Brasil', 'Brasília', 'BR / BRA', 'América do Sul'),
	(4, 'Chile', 'Santiago', 'CL / CHL', 'América do Sul'),
	(5, 'Colômbia', 'Bogotá', 'CO / COL', 'América do Sul'),
	(6, 'Equador', 'Quito', 'EC / ECU', 'América do Sul'),
	(7, 'Guiana', 'Georgetown', 'GY / GUY', 'América do Sul'),
	(8, 'Guiana Francesa', 'Caiena', 'GF / GUF', 'América do Sul'),
	(9, 'Paraguai', 'Assunção', 'PY / PRY', 'América do Sul'),
	(10, 'Peru', 'Lima', 'PE / PER', 'América do Sul'),
	(11, 'Suriname', 'Paramaribo', 'SR / SUR', 'América do Sul'),
	(12, 'Uruguai', 'Montevidéu', 'UY / URY', 'América do Sul'),
	(13, 'Venezuela', 'Caracas', 'VE / VEN', 'América do Sul'),
	(14, 'Canadá', 'Otawa', 'CA / CAN', 'América do Norte'),
	(15, 'Estados Unidos', 'Washington', 'US / USA', 'América do Norte'),
	(16, 'México', 'Cidade do México', 'MX / MEX', 'América do Norte'),
	(17, 'Antígua e Barbuda', 'St. John\'s', 'AG / ATG', 'América Central'),
	(18, 'Bahamas', 'Nassau', 'BS / BHS', 'América Central'),
	(19, 'Barbados', 'Bridgetown', 'BB / BRB', 'América Central'),
	(20, 'Belize', 'Belmopan', 'BZ / BLZ', 'América Central'),
	(21, 'Bermudas', 'Hamilton', 'BM / BMU', 'América Central'),
	(22, 'Costa Rica', 'San José', 'CR / CRC', 'América Central'),
	(23, 'Cuba', 'Havana', 'CU / CUB', 'América Central'),
	(24, 'Dominica', 'Roseau', 'DM / DMA', 'América Central'),
	(25, 'El Salvador', 'San Salvador', 'SV / SLV', 'América Central'),
	(26, 'Granada', 'St. George\'s', 'GD / GRD', 'América Central'),
	(27, 'Guatemala', 'Cidade da Guatemala', 'GT / GTM', 'América Central'),
	(28, 'Haiti', 'Porto Príncipe', 'HT / HTI', 'América Central'),
	(29, 'Honduras', 'Tegucigalpa', 'HN / HND', 'América Central'),
	(30, 'Jamaica', 'Kingston', 'JM / JAM', 'América Central'),
	(31, 'Nicarágua', 'Manágua', 'NI / NIC', 'América Central'),
	(32, 'Panamá', 'Cidade do Panamá', 'PA / PAN', 'América Central'),
	(33, 'Porto Rico', 'San Juan', 'PR / PRI', 'América Central'),
	(34, 'República Dominicana', 'Santo Domingo', 'DO / DOM', 'América Central'),
	(35, 'Santa Lúcia', 'Castries', 'LC / LCA', 'América Central'),
	(36, 'São Cristóvão e Nevis', 'Basseterre', 'KN / KNA', 'América Central'),
	(37, 'São Vicente e Granadinas', 'Kingstown', 'VC / VCT', 'América Central'),
	(38, 'Trinidad e Tobago', 'Port of Spain', 'TT / TTO', 'América Central'),
	(39, 'Albânia', 'Tirana', 'AL / ALB', 'Europa'),
	(40, 'Alemanha', 'Berlim', 'DE / DEU', 'Europa'),
	(41, 'Andorra', 'Andorra la Vella', 'AD / AND', 'Europa'),
	(42, 'Armênia', 'Yerevan', 'AM / ARM', 'Europa'),
	(43, 'Áustria', 'Viena', 'AT / AUT', 'Europa'),
	(44, 'Azerbaijão', 'Baku', 'AZ / AZE', 'Europa'),
	(45, 'Bélgica', 'Bruxelas', 'BE / BEL', 'Europa'),
	(46, 'Bielorrússia', 'Minsk', 'BY / BLR', 'Europa'),
	(47, 'Bósnia e Herzegovina', 'Sarajevo', 'BA / BIH', 'Europa'),
	(48, 'Bulgária', 'Sófia', 'BG / BGR', 'Europa'),
	(49, 'Chipre', 'Nicósia', 'CY / CYP', 'Europa'),
	(50, 'Croácia', 'Zagreb', 'HR / HRV', 'Europa'),
	(51, 'Dinamarca', 'Copenhague', 'DK / DNK', 'Europa'),
	(52, 'Eslováquia', 'Bratislava', 'SK / SVK', 'Europa'),
	(53, 'Eslovênia', 'Liubliana', 'SI / SVN', 'Europa'),
	(54, 'Espanha', 'Madri', 'ES / ESP', 'Europa'),
	(55, 'Estônia', 'Tallinn', 'EE / EST', 'Europa'),
	(56, 'Finlândia', 'Helsinque', 'FI / FIN', 'Europa'),
	(57, 'França', 'Paris', 'FR / FRA', 'Europa'),
	(58, 'Geórgia', 'Tbilisi', 'GE / GEO', 'Europa'),
	(59, 'Grécia', 'Atenas', 'GR / GRC', 'Europa'),
	(60, 'Hungria', 'Budapeste', 'HU / HUN', 'Europa'),
	(61, 'Inglaterra', 'Londres', 'GB / GBR', 'Europa'),
	(62, 'Irlanda', 'Dublin', 'IE / IRL', 'Europa'),
	(63, 'Islândia', 'Reykjavik', 'IS / IS', 'Europa'),
	(64, 'Itália', 'Roma', 'IT / ITA', 'Europa'),
	(65, 'Letônia', 'Riga', 'LV / LVA', 'Europa'),
	(66, 'Liechtenstein', 'Vaduz', 'LI / LIE', 'Europa'),
	(67, 'Lituânia', 'Vilnius', 'LT / LTU', 'Europa'),
	(68, 'Luxemburgo', 'Luxemburgo', 'LU / LUX', 'Europa'),
	(69, 'Macedônia', 'Skopje', 'MK / MKD', 'Europa'),
	(70, 'Malta', 'Valletta', 'MT / MLT', 'Europa'),
	(71, 'Moldávia', 'Chisinau', 'MD / MDA', 'Europa'),
	(72, 'Mônaco', 'Mônaco-Ville', 'MC / MCO', 'Europa'),
	(73, 'Noruega', 'Oslo', 'NO / NOR', 'Europa'),
	(74, 'Países Baixos', 'Amsterdã', 'NL / NLD', 'Europa'),
	(75, 'Polônia', 'Varsóvia', 'PL / POL', 'Europa'),
	(76, 'Portugal', 'Lisboa', 'PT / PRT', 'Europa'),
	(77, 'República Checa', 'Praga', 'CZ / CZE', 'Europa'),
	(78, 'Romênia', 'Bucareste', 'RO / ROU', 'Europa'),
	(79, 'San Marino', 'San Marino', 'SM / SMR', 'Europa'),
	(80, 'Suécia', 'Estocolmo', 'SE / SWE', 'Europa'),
	(81, 'Suíça', 'Berna', 'CH / CHE', 'Europa'),
	(82, 'Ucrânia', 'Kiev', 'UA / UKR', 'Europa'),
	(83, 'Vaticano', 'Cidade do Vaticano', 'VA / VAT', 'Europa'),
	(84, 'África do Sul', 'Pretória', 'ZA / ZAF', 'África'),
	(85, 'Angola', 'Luanda', 'AO / AGO', 'África'),
	(86, 'Argélia', 'Argel', 'DZ / DZA', 'África'),
	(87, 'Benin', 'Porto Novo', 'BJ / BEN', 'África'),
	(88, 'Botsuana', 'Gaborone', 'BW / BWA', 'África'),
	(89, 'Burkina Faso', 'Uagadugu', 'BF / BFA', 'África'),
	(90, 'Burundi', 'Bujumbura', 'BI / BDI', 'África'),
	(91, 'Cabo Verde', 'Praia', 'CV / CPV', 'África'),
	(92, 'Camarões', 'Iaundé', 'CM / CMR', 'África'),
	(93, 'Chade', 'Ndjamena', 'TD / TCD', 'África'),
	(94, 'Comores', 'Moroni', 'KM / COM', 'África'),
	(95, 'Costa do Marfim', 'Abidjan', 'CI / CIV', 'África'),
	(96, 'Djibouti', 'Djibuti', 'DJ / DJI', 'África'),
	(97, 'Egito', 'Cairo', 'EG / EGY', 'África'),
	(98, 'Eritreia', 'Asmara', 'ER / ERI', 'África'),
	(99, 'Etiópia', 'Adis Abeba', 'ET / ETH', 'África'),
	(100, 'Gabão', 'Libreville', 'GA / GAB', 'África'),
	(101, 'Gâmbia', 'Banjul', 'GM / GMB', 'África'),
	(102, 'Gana', 'Acra', 'GH / GHA', 'África'),
	(103, 'Guiné', 'Conacri', 'GN / GIN', 'África'),
	(104, 'Guiné Equatorial', 'Malabo', 'GQ / GNQ', 'África'),
	(105, 'Guiné-Bissau', 'Bissau', 'GW / GNB', 'África'),
	(106, 'Lesoto', 'Maseru', 'LS / LSO', 'África'),
	(107, 'Libéria', 'Monróvia', 'LR / LBR', 'África'),
	(108, 'Líbia', 'Trípoli', 'LY / LBY', 'África'),
	(109, 'Madagáscar', 'Antananarivo', 'MG / MDG', 'África'),
	(110, 'Malawi', 'Lilongue', 'MW / MWI', 'África'),
	(111, 'Mali', 'Bamaco', 'ML / MLI', 'África'),
	(112, 'Marrocos', 'Rabat', 'MA / MAR', 'África'),
	(113, 'Maurícia', 'Port Louis', 'MU / MUS', 'África'),
	(114, 'Mauritânia', 'Nuakchott', 'MR / MRT', 'África'),
	(115, 'Moçambique', 'Maputo', 'MZ / MOZ', 'África'),
	(116, 'Namíbia', 'Windhoek', 'NA / NAM', 'África'),
	(117, 'Niger', 'Niamei', 'NE / NER', 'África'),
	(118, 'Nigéria', 'Abuja', 'NG / NGA', 'África'),
	(119, 'Quênia', 'Nairobi', 'KE / KEN', 'África'),
	(120, 'República Centro-Africana', 'Bangui', 'CF / CAF', 'África'),
	(121, 'República Democrática do Congo', 'Kinshasa', 'CD / COD', 'África'),
	(122, 'República do Congo', 'Brazzaville', 'CG / COG', 'África'),
	(123, 'Ruanda', 'Kigali', 'RW / RWA', 'África'),
	(124, 'São Tomé e Príncipe', 'São Tomé', 'ST / STP', 'África'),
	(125, 'Senegal', 'Dacar', 'SN / SEN', 'África'),
	(126, 'Serra Leoa', 'Freetown', 'SL / SLE', 'África'),
	(127, 'Seychelles', 'Vitória', 'SC / SYC', 'África'),
	(128, 'Somália', 'Mogadíscio', 'SO / SOM', 'África'),
	(129, 'Suazilândia', 'Mbabane', 'SZ / SWZ', 'África'),
	(130, 'Sudão', 'Cartum', 'SD / SDN', 'África'),
	(131, 'Tanzânia', 'Dodoma', 'TZ / TZA', 'África'),
	(132, 'Togo', 'Lomé', 'TG / TGO', 'África'),
	(133, 'Tunísia', 'Túnis', 'TN / TUN', 'África'),
	(134, 'Uganda', 'Campala', 'UG / UGA', 'África'),
	(135, 'Zâmbia', 'Lusaka', 'ZM / ZMB', 'África'),
	(136, 'Zimbabwe', 'Harare', 'ZW / ZWE', 'África'),
	(137, 'Afeganistão', 'Cabul', 'AF / AFG', 'Ásia'),
	(138, 'Arábia Saudita', 'Riad', 'SA / SAU', 'Ásia'),
	(139, 'Bahrein', 'Manama', 'BH / BHR', 'Ásia'),
	(140, 'Bangladesh', 'Daca', 'BD / BGD', 'Ásia'),
	(141, 'Brunei', 'Bandar Seri Begawan', 'BN / BRN', 'Ásia'),
	(142, 'Butão', 'Timfú', 'BT / BTN', 'Ásia'),
	(143, 'Camboja', 'Phnom Penh', 'KH / KHM', 'Ásia'),
	(144, 'Catar', 'Doha', 'QA / QAT', 'Ásia'),
	(145, 'Cazaquistão', 'Astana', 'KZ / KAZ', 'Ásia'),
	(146, 'China', 'Pequim', 'CN / CHN', 'Ásia'),
	(147, 'Cingapura', 'Cingapura', 'SG / SGP', 'Ásia'),
	(148, 'Coreia do Norte', 'Pyongyang', 'KP / PRK', 'Ásia'),
	(149, 'Coreia do Sul', 'Seul', 'KR / KOR', 'Ásia'),
	(150, 'Emirados Árabes Unidos', 'Abu Dhabi', 'AE / ARE', 'Ásia'),
	(151, 'Filipinas', 'Manila', 'PH / PHL', 'Ásia'),
	(152, 'Iêmen', 'Sanaa', 'YE / YEM', 'Ásia'),
	(153, 'Índia', 'Nova Délhi', 'IN / IND', 'Ásia'),
	(154, 'Indonésia', 'Jacarta', 'ID / IDN', 'Ásia'),
	(155, 'Irã', 'Teerã', 'IR / IRN', 'Ásia'),
	(156, 'Iraque', 'Bagdá', 'IQ / IRQ', 'Ásia'),
	(157, 'Israel', 'Telaviv', 'IL / ISR', 'Ásia'),
	(158, 'Japão', 'Tóquio', 'JP / JPN', 'Ásia'),
	(159, 'Jordânia', 'Amã', 'JO / JOR', 'Ásia'),
	(160, 'Kuwait', 'Cidade do Kuwait', 'KW / KWT', 'Ásia'),
	(161, 'Laos', 'Vientiane', 'LA / LAO', 'Ásia'),
	(162, 'Líbano', 'Beirute', 'LB / LBN', 'Ásia'),
	(163, 'Malásia', 'Kuala Lumpur', 'MY / MYS', 'Ásia'),
	(164, 'Maldivas', 'Male', 'MV / MDV', 'Ásia'),
	(165, 'Mongólia', 'Ulan Bator', 'MN / MNG', 'Ásia'),
	(166, 'Myanmar', 'Naypyidaw', 'MM / MMR', 'Ásia'),
	(167, 'Nepal', 'Katmandú', 'NP / NPL', 'Ásia'),
	(168, 'Omã', 'Mascate', 'OM / OMN', 'Ásia'),
	(169, 'Paquistão', 'Islamabad', 'PK / PAK', 'Ásia'),
	(170, 'Quirguistão', 'Bishkek', 'KG / KGZ', 'Ásia'),
	(171, 'Rússia', 'Moscou', 'RU / RUS', 'Ásia'),
	(172, 'Síria', 'Damasco', 'SY / SYR', 'Ásia'),
	(173, 'Sri Lanka', 'Colombo', 'LK / LKA', 'Ásia'),
	(174, 'Tailândia', 'Bangcoc', 'TH / THA', 'Ásia'),
	(175, 'Taiwan', 'Taipé', 'TW / TWN', 'Ásia'),
	(176, 'Tajiquistão', 'Dushanbe', 'TJ / TJK', 'Ásia'),
	(177, 'Turquemenistão', 'Ashkhabad', 'TM / TKM', 'Ásia'),
	(178, 'Turquia', 'Ancara', 'TR / TUR', 'Ásia'),
	(179, 'Uzbequistão', 'Tashkent', 'UZ / UZB', 'Ásia'),
	(180, 'Vietname', 'Hanói', 'VN / VNM', 'Ásia'),
	(181, 'Austrália', 'Canberra', 'AU / AUS', 'Oceânia'),
	(182, 'Fiji', 'Suva', 'FJ / FJI', 'Oceânia'),
	(183, 'Ilhas Marshall', 'Majuro', 'MH / MHL', 'Oceânia'),
	(184, 'Ilhas Salomão', 'Honiara', 'SB / SLB', 'Oceânia'),
	(185, 'Kiribati', 'Bairiki', 'KI / KIR', 'Oceânia'),
	(186, 'Micronésia', 'Palikir', 'FM / FSM', 'Oceânia'),
	(187, 'Nauru', 'Yaren', 'NR / NRU', 'Oceânia'),
	(188, 'Nova Zelândia', 'Wellington', 'NZ / NZL', 'Oceânia'),
	(189, 'Palau', 'Koror', 'PW / PLW', 'Oceânia'),
	(190, 'Papua-Nova Guiné', 'Port Moresby', 'PG / PNG', 'Oceânia'),
	(191, 'Samoa', 'Ápia', 'WS / WSM', 'Oceânia'),
	(192, 'Tonga', 'Nukualofa', 'TO / TON', 'Oceânia'),
	(193, 'Tuvalu', 'Fongafale', 'TV / TUV', 'Oceânia'),
	(194, 'Vanuatu', 'Porto Vila', 'VU / VUT', 'Oceânia'),
	(195, 'Argentina', 'Buenos Aires', 'AR / ARG', 'América do Sul');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;

-- Copiando estrutura para tabela campeonatof1.pilotos
CREATE TABLE IF NOT EXISTS `pilotos` (
  `idpilotos` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `sigla` varchar(5) NOT NULL,
  `idpais` int(11) NOT NULL,
  `salario` float DEFAULT NULL,
  PRIMARY KEY (`idpilotos`,`idpais`),
  UNIQUE KEY `numero_UNIQUE` (`sigla`),
  KEY `fk_pilotos_pais1_idx` (`idpais`),
  CONSTRAINT `fk_pilotos_pais1` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela campeonatof1.pilotos: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `pilotos` DISABLE KEYS */;
REPLACE INTO `pilotos` (`idpilotos`, `nome`, `sigla`, `idpais`, `salario`) VALUES
	(1, 'Kimi Räikkönen', 'RAI', 56, 685937),
	(2, ' Antonio Giovinazzi', 'GIO', 64, 696051),
	(3, ' Pierre Gasly', 'GAS', 57, 470419),
	(4, ' Daniil Kvyat', 'KVY', 171, 409432),
	(5, ' Sebastian Vettel', 'VET', 40, 235687),
	(6, ' Charles Leclerc', 'LEC', 72, 654502),
	(7, ' Romain Grosjean', 'GRO', 57, 749314),
	(8, ' Kevin Magnussen', 'MAG', 51, 716712),
	(9, ' Pietro Fittipaldi', 'FIT', 3, 587957),
	(10, ' Lando Norris', 'NOR', 61, 601218),
	(11, ' Carlos Sainz Jr.', 'SAI', 54, 217844),
	(12, ' Lewis Hamilton', 'HAM', 61, 546970),
	(14, ' Valtteri Bottas', 'BOT', 56, 487459),
	(15, ' Sergio Pérez', 'PER', 16, 491146),
	(16, ' Lance Stroll', 'STR', 14, 358645),
	(17, ' Nico Hülkenberg', 'HUL', 56, 528944),
	(18, ' Alexander Albon', 'ALB', 174, 315926),
	(19, ' Max Verstappen', 'VER', 74, 631601),
	(20, ' Daniel Ricciardo', 'RIC', 181, 639651),
	(21, ' Esteban Ocon', 'OCO', 57, 600588),
	(22, ' Nicholas Latifi', 'LAT', 14, 784056),
	(23, ' George Russell', 'RUS', 61, 205134),
	(24, ' Jack Aitken', 'AIT', 61, 330836);
/*!40000 ALTER TABLE `pilotos` ENABLE KEYS */;

-- Copiando estrutura para tabela campeonatof1.resultados
CREATE TABLE IF NOT EXISTS `resultados` (
  `idmembros` int(11) NOT NULL,
  `largada` int(11) NOT NULL,
  `tempototal` varchar(100) DEFAULT NULL,
  `motivo_retirada` varchar(100) DEFAULT '0' COMMENT '0 - nao\n1 - sim',
  `posicao` int(11) DEFAULT NULL,
  `pontos` int(11) NOT NULL,
  `idcorridas` int(11) NOT NULL,
  PRIMARY KEY (`idmembros`,`idcorridas`),
  KEY `fk_corridas_has_pilotos_corridas1_idx` (`idcorridas`),
  KEY `fk_resultados_membros1_idx` (`idmembros`),
  CONSTRAINT `fk_corridas_has_pilotos_corridas1` FOREIGN KEY (`idcorridas`) REFERENCES `corridas` (`idcorridas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resultados_membros1` FOREIGN KEY (`idmembros`) REFERENCES `membros` (`idmembros`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela campeonatof1.resultados: ~357 rows (aproximadamente)
/*!40000 ALTER TABLE `resultados` DISABLE KEYS */;
REPLACE INTO `resultados` (`idmembros`, `largada`, `tempototal`, `motivo_retirada`, `posicao`, `pontos`, `idcorridas`) VALUES
	(1, 19, '', 'Pneus', 0, 0, 1),
	(1, 16, '+1 Volta', '', 11, 0, 2),
	(1, 20, '+1 volta', '', 15, 0, 3),
	(1, 16, '+1 volta', '', 17, 0, 4),
	(1, 20, '+1 volta', '', 15, 0, 5),
	(1, 14, '+1 Volta', '', 14, 0, 6),
	(1, 16, '+1:11.504', '', 12, 0, 7),
	(1, 14, '36312', '', 13, 0, 8),
	(1, 13, '+29.770s', '', 9, 2, 9),
	(1, 19, '+ 1 volta', '', 14, 0, 10),
	(1, 19, '41476', '', 12, 0, 11),
	(1, 16, '+1 volta', '', 11, 0, 12),
	(1, 18, '22224', '', 9, 2, 13),
	(1, 8, '+1 volta', '', 15, 0, 14),
	(1, 17, '+1 volta', '', 15, 0, 15),
	(1, 19, '+26.153s', '', 14, 0, 16),
	(1, 15, '+1 volta', '', 12, 0, 17),
	(2, 18, '+21.146s', '', 9, 2, 1),
	(2, 19, '+1 Volta', '', 14, 0, 2),
	(2, 19, '+1 volta', '', 17, 0, 3),
	(2, 15, '542053', '', 14, 0, 4),
	(2, 19, '+1 volta', '', 17, 0, 5),
	(2, 20, '+1 Volta', '', 16, 0, 6),
	(2, 18, '', 'Acidente', 0, 0, 7),
	(2, 18, '55199', '', 16, 0, 8),
	(2, 17, '', 'Colisão', 0, 0, 9),
	(2, 17, '+ 1 volta', '', 11, 0, 10),
	(2, 14, '40035', '', 10, 1, 11),
	(2, 17, '+1 volta', '', 15, 0, 12),
	(2, 20, '26398', '', 10, 1, 13),
	(2, 10, '', 'Caixa de câmbio', 0, 0, 14),
	(2, 16, '+1 volta', '', 16, 0, 15),
	(2, 14, '+24.111s', '', 13, 0, 16),
	(2, 14, '+1 volta', '', 16, 0, 17),
	(3, 12, '+16.682s', '', 7, 6, 1),
	(3, 7, '+1 Volta', '', 15, 0, 2),
	(3, 10, '', 'Motor', 0, 0, 3),
	(3, 11, '31188', '', 7, 6, 4),
	(3, 7, '+70.642s', '', 11, 0, 5),
	(3, 10, '+1 Volta', '', 9, 2, 6),
	(3, 12, '47371', '', 8, 4, 7),
	(3, 10, '1:47:06.056', '', 1, 25, 8),
	(3, 16, '', 'Colisão', 0, 0, 9),
	(3, 9, '+1:29.766s', '', 9, 2, 10),
	(3, 12, '22766', '', 6, 8, 11),
	(3, 9, '+1 volta', '', 5, 10, 12),
	(3, 4, '', 'Vazamento de refrigerador', 0, 0, 13),
	(3, 19, '+1 volta', '', 13, 0, 14),
	(3, 8, '11942', '', 6, 8, 15),
	(3, 9, '+20.527s', '', 11, 0, 16),
	(3, 9, '+89.718s', '', 8, 4, 17),
	(4, 13, '', 'Pneus', 0, 0, 1),
	(4, 13, '+1 Volta', '', 10, 1, 2),
	(4, 17, '+1 volta', '', 12, 0, 3),
	(4, 19, '', 'Acidente', 0, 0, 4),
	(4, 16, '+69.669s', '', 10, 1, 5),
	(4, 12, '+1 Volta', '', 12, 0, 6),
	(4, 11, '+1:10.200', '', 11, 0, 7),
	(4, 11, '22208', '', 9, 2, 8),
	(4, 12, '+21.756s', '', 7, 6, 9),
	(4, 11, '+1:08.740s', '', 8, 4, 10),
	(4, 13, '55588', '', 15, 0, 11),
	(4, 13, '+2 voltas', '', 19, 0, 12),
	(4, 8, '15141', '', 4, 12, 13),
	(4, 16, '+1 volta', '', 12, 0, 14),
	(4, 10, '+1 volta', '', 11, 0, 15),
	(4, 6, '+14.534s', '', 7, 6, 16),
	(4, 7, '+1 volta', '', 11, 0, 17),
	(5, 11, '+24.545s', '', 10, 1, 1),
	(5, 10, 'Colisão', '', 0, 0, 2),
	(5, 5, '+1 volta', '', 6, 8, 3),
	(5, 10, '41857', '', 10, 1, 4),
	(5, 11, '+73.370s', '', 12, 0, 5),
	(5, 11, '+1 Volta', '', 7, 6, 6),
	(5, 14, '+1:12.894', '', 13, 0, 7),
	(5, 17, '', 'Freios', 0, 0, 8),
	(5, 14, '+29.983s', '', 10, 1, 9),
	(5, 14, '+ 1 volta', '', 13, 0, 10),
	(5, 11, '40810', '', 11, 0, 11),
	(5, 15, '+1 volta', '', 10, 1, 12),
	(5, 14, '28453', '', 12, 0, 13),
	(5, 11, '31960', '', 3, 15, 14),
	(5, 11, '+1 volta', '', 13, 0, 15),
	(5, 13, '+22.611s', '', 12, 0, 16),
	(5, 13, '+1 volta', '', 14, 0, 17),
	(6, 7, '+2.700s', '', 2, 18, 1),
	(6, 14, 'Colisão', '', 0, 0, 2),
	(6, 6, '+1 volta', '', 11, 0, 3),
	(6, 4, '18474', '', 3, 15, 4),
	(6, 8, '+29.289s', '', 4, 12, 5),
	(6, 9, '', 'Unid. de potência', 0, 0, 6),
	(6, 13, '+1:14.920', '', 14, 0, 7),
	(6, 13, '', 'Acidente', 0, 0, 8),
	(6, 5, '+28.345s', '', 8, 4, 9),
	(6, 10, '+1:02.186s', '', 6, 8, 10),
	(6, 4, '30814', '', 7, 6, 11),
	(6, 4, '+1:05.312', '', 4, 12, 12),
	(6, 7, '19111', '', 5, 10, 13),
	(6, 12, '33858', '', 4, 12, 14),
	(6, 12, '+1 volta', '', 10, 1, 15),
	(6, 4, '', 'Colisão', 0, 0, 16),
	(6, 12, '+1 volta', '', 13, 0, 17),
	(7, 15, '', 'Motor', 0, 0, 1),
	(7, 20, '+1 Volta', '', 13, 0, 2),
	(7, 18, '+1 volta[a]', '', 16, 0, 3),
	(7, 17, '55050', '', 16, 0, 4),
	(7, 13, '+1 volta', '', 16, 0, 5),
	(7, 17, '+2 Voltas', '', 19, 0, 6),
	(7, 17, '+1:16.793', '', 15, 0, 7),
	(7, 16, '35164', '', 12, 0, 8),
	(7, 15, '+42.036s', '', 12, 0, 9),
	(7, 16, '+ 1 volta', '', 17, 0, 10),
	(7, 16, '39081', '', 9, 2, 11),
	(7, 18, '+1 volta', '', 17, 0, 12),
	(7, 16, '329351', '', 14, 0, 13),
	(7, 17, '', 'Colisão', 0, 0, 14),
	(7, 19, '', 'Colisão', 0, 0, 15),
	(8, 16, '', 'Colisão', 0, 0, 1),
	(8, 15, '+1 Volta', '', 12, 0, 2),
	(8, 12, '+1 volta[a]', '', 10, 1, 3),
	(8, 14, '', 'Colisão', 0, 0, 4),
	(8, 17, '+1 volta', '', 20, 0, 5),
	(8, 16, '+1 Volta', '', 15, 0, 6),
	(8, 20, '+1:25.540', '', 17, 0, 7),
	(8, 15, '', 'Unidade de energia', 0, 0, 8),
	(8, 20, '', 'Colisão', 0, 0, 9),
	(8, 18, '+ 1 volta', '', 12, 0, 10),
	(8, 15, '49585', '', 13, 0, 11),
	(8, 19, '+1 volta', '', 16, 0, 12),
	(8, 17, '', 'Abandono', 0, 0, 13),
	(8, 13, '', 'Abandono', 0, 0, 14),
	(8, 18, '+1 volta', '', 17, 0, 15),
	(8, 16, '+32.370s', '', 15, 0, 16),
	(8, 20, '+1 volta', '', 18, 0, 17),
	(9, 20, '+36.858s', '', 17, 0, 16),
	(9, 17, '+2 voltas', '', 19, 0, 17),
	(10, 3, '+5.491s', '', 3, 16, 1),
	(10, 9, '+1:01.470', '', 5, 10, 2),
	(10, 8, '+1 volta', '', 14, 0, 3),
	(10, 5, '22277', '', 5, 10, 4),
	(10, 10, '+65.544s', '', 9, 2, 5),
	(10, 8, '+1 Volta', '', 10, 1, 6),
	(10, 10, '43774', '', 7, 6, 7),
	(10, 6, '6000', '', 4, 12, 8),
	(10, 11, '+18.883s', '', 6, 8, 9),
	(10, 8, '+ 1 volta', '', 15, 0, 10),
	(10, 8, '', 'Motor', 0, 0, 11),
	(10, 8, '+1 volta', '', 13, 0, 12),
	(10, 9, '21131', '', 8, 4, 13),
	(10, 14, '+1:01.259', '', 8, 6, 14),
	(10, 9, '11337', '', 4, 12, 15),
	(10, 15, '+19.541s', '', 10, 1, 16),
	(10, 4, '+60.729s', '', 5, 10, 17),
	(11, 8, '+8.903s', '', 5, 10, 1),
	(11, 3, '+1 Volta', '', 9, 3, 2),
	(11, 9, '+1 volta', '', 9, 2, 3),
	(11, 7, '53370', '', 13, 0, 4),
	(11, 12, '+74.070s', '', 13, 0, 5),
	(11, 7, '+1 Volta', '', 6, 8, 6),
	(11, -2, '', 'Problema no escapamento', 0, 0, 7),
	(11, 3, '+0.415', '', 2, 18, 8),
	(11, 9, '', 'Colisão', 0, 0, 9),
	(11, 6, '', 'Colisão', 0, 0, 10),
	(11, 10, '21905', '', 5, 10, 11),
	(11, 7, '+1 volta', '', 6, 8, 12),
	(11, 10, '20230', '', 7, 6, 13),
	(11, 15, '34363', '', 5, 10, 14),
	(11, 15, '11787', '', 5, 10, 15),
	(11, 8, '+12.580s', '', 4, 12, 16),
	(11, 6, '+65.662s', '', 6, 8, 17),
	(12, 5, '5689', '', 4, 12, 1),
	(12, 1, '1:30:55.739', '', 1, 25, 2),
	(12, 1, '1:36:12.473', '', 1, 26, 3),
	(12, 1, '1:28:01.283', '', 1, 25, 4),
	(12, 2, '+11.326s', '', 2, 20, 5),
	(12, 1, '1:31:45.279', '', 1, 25, 6),
	(12, 1, '1:24:08.761', '', 1, 25, 7),
	(12, 1, '17245', '', 7, 8, 8),
	(12, 1, '2:19:35.060', '', 1, 26, 9),
	(12, 1, '+22.729s', '', 3, 15, 10),
	(12, 2, '1:35:49.641', '', 1, 25, 11),
	(12, 1, '1:29:56.828', '', 1, 26, 12),
	(12, 2, '1:28:32.430', '', 1, 26, 13),
	(12, 6, '1:42:19.313', '', 1, 25, 14),
	(12, 1, '2:59:47.515', '', 1, 25, 15),
	(12, 3, '+18.415s', '', 3, 15, 17),
	(13, 17, '', 'Motor', 0, 0, 1),
	(13, 11, '+2 Voltas', '', 16, 0, 2),
	(13, 12, '+1 volta', '', 18, 0, 3),
	(13, 20, '52004', '', 12, 0, 4),
	(13, 15, '+1 volta', '', 18, 0, 5),
	(13, 18, '+1 Volta', '', 17, 0, 6),
	(13, 15, '', 'Colisão com detritos', 0, 0, 7),
	(13, 19, '36593', '', 14, 0, 8),
	(13, 18, '+32.404s', '', 11, 0, 9),
	(13, 13, '+ 1 volta', '', 18, 0, 10),
	(13, 17, '', 'Pneu', 0, 0, 11),
	(13, 14, '+1 volta', '', 14, 0, 12),
	(13, 13, '', 'Acidente', 0, 0, 13),
	(13, -1, '+1 volta', '', 16, 0, 14),
	(13, 14, '+1 volta', '', 12, 0, 15),
	(13, 2, '+18.556s', '', 9, 4, 16),
	(13, 16, '+1 volta', '', 15, 0, 17),
	(14, 1, '1:30:55.739', '', 1, 25, 1),
	(14, 4, '13719', '', 2, 18, 2),
	(14, 2, '9452', '', 3, 15, 3),
	(14, 2, '42167', '', 11, 0, 4),
	(14, 1, '+19.231s', '', 3, 15, 5),
	(14, 2, '44752', '', 3, 16, 6),
	(14, 2, '8448', '', 2, 18, 7),
	(14, 2, '7108', '', 5, 10, 8),
	(14, 2, '+4.880s', '', 2, 18, 9),
	(14, 3, '1:34:00.364', '', 1, 26, 10),
	(14, 1, '', 'Motor', 0, 0, 11),
	(14, 2, '25592', '', 2, 18, 12),
	(14, 1, '5783', '', 2, 18, 13),
	(14, 9, '+1 volta', '', 14, 0, 14),
	(14, 2, '19680', '', 8, 4, 15),
	(14, 1, '+15.389s', '', 8, 4, 16),
	(14, 2, '+15.976s', '', 2, 18, 17),
	(15, 6, '+9.903s', '', 6, 8, 1),
	(15, 17, '+1:02.387', '', 6, 8, 2),
	(15, 4, '+1 volta', '', 7, 6, 3),
	(15, 4, '+1 Volta', '', 5, 10, 6),
	(15, 8, '53179', '', 10, 1, 7),
	(15, 4, '23224', '', 10, 1, 8),
	(15, 7, '+15.650s', '', 5, 10, 9),
	(15, 4, '+30.558s', '', 4, 12, 10),
	(15, 9, '16070', '', 4, 12, 11),
	(15, 5, '+1 volta', '', 7, 6, 12),
	(15, 11, '19652', '', 6, 8, 13),
	(15, 3, '31633', '', 2, 18, 14),
	(15, 5, '', 'Motor', 0, 0, 15),
	(15, 5, '1:31:15.114', '', 1, 25, 16),
	(15, 19, '', 'Motor', 0, 0, 17),
	(16, 9, '', 'Abandono', 0, 0, 1),
	(16, 12, '+1:02.453', '', 7, 6, 2),
	(16, 3, '57579', '', 4, 12, 3),
	(16, 6, '37311', '', 92, 2, 4),
	(16, 6, '+42.538s', '', 6, 8, 5),
	(16, 5, '+1 Volta', '', 4, 12, 6),
	(16, 9, '52603', '', 9, 2, 7),
	(16, 8, '3358', '', 3, 15, 8),
	(16, 6, '', 'Suspensão', 0, 0, 9),
	(16, 12, '', 'Colisão', 0, 0, 10),
	(16, 12, '', 'Abandono', 0, 0, 12),
	(16, 15, '29163', '', 13, 0, 13),
	(16, 1, '+1:12.353', '', 9, 2, 14),
	(16, 13, '', 'Colisão', 0, 0, 15),
	(16, 10, '+11.869s', '', 3, 15, 16),
	(16, 8, '+102.738s', '', 10, 1, 17),
	(17, -4, '', 'Unid. de potência', 0, 0, 4),
	(17, 3, '+55.951s', '', 7, 6, 5),
	(17, 20, '32596', '', 8, 4, 11),
	(18, 4, '', 'Elétrica', 0, 0, 1),
	(18, 6, '44440', '', 4, 12, 2),
	(18, 13, '+1:18.316', '', 5, 10, 3),
	(18, 12, '32670', '', 8, 4, 4),
	(18, 9, '+39.146s', '', 5, 10, 5),
	(18, 6, '+1 Volta', '', 8, 4, 6),
	(18, 5, '42712', '', 6, 8, 7),
	(18, 9, '37533', '', 15, 0, 8),
	(18, 4, '+8.064s', '', 3, 15, 9),
	(18, 15, '+1:37.860s', '', 10, 1, 10),
	(18, 5, '', 'Motor', 0, 0, 11),
	(18, 6, '+1 volta', '', 12, 0, 12),
	(18, 6, '57284', '', 15, 0, 13),
	(18, 4, '46484', '', 7, 6, 14),
	(18, 4, '8005', '', 3, 15, 15),
	(18, 12, '+13.842s', '', 6, 8, 16),
	(18, 5, '+19.987s', '', 4, 12, 17),
	(19, 2, '', 'Elétrica', 0, 0, 1),
	(19, 2, '33698', '', 3, 15, 2),
	(19, 7, '8702', '', 2, 18, 3),
	(19, 3, '5856', '', 2, 20, 4),
	(19, 4, '1:19:41.993', '', 1, 25, 5),
	(19, 3, '24177', '', 2, 18, 6),
	(19, 3, '15455', '', 3, 15, 7),
	(19, 5, '', 'Unidade de energia', 0, 0, 8),
	(19, 3, '', 'Colisão', 0, 0, 9),
	(19, 2, '+7.729s', '', 2, 18, 10),
	(19, 3, '4470', '', 2, 20, 11),
	(19, 3, '34508', '', 3, 15, 12),
	(19, 3, '', 'Punção / centrifugação', 0, 0, 13),
	(19, 2, '44873', '', 6, 8, 14),
	(19, 3, '1254', '', 2, 20, 15),
	(19, 3, '', 'Acidente', 0, 0, 16),
	(19, 1, '1:36:28.645', '', 1, 25, 17),
	(20, 10, '', 'Motor', 0, 0, 1),
	(20, 8, '+1:02.591', '', 8, 4, 2),
	(20, 11, '+1 volta', '', 8, 4, 3),
	(20, 8, '19650', '', 4, 12, 4),
	(20, 5, '+1 volta', '', 14, 0, 5),
	(20, 13, '+1 Volta', '', 11, 0, 6),
	(20, 4, '18877', '', 4, 14, 7),
	(20, 7, '8391', '', 6, 8, 8),
	(20, 8, '+10.417s', '', 4, 12, 9),
	(20, 5, '+52.065s', '', 5, 10, 10),
	(20, 6, '14613', '', 3, 15, 11),
	(20, 10, '+1 volta', '', 9, 2, 12),
	(20, 5, '14320', '', 3, 15, 13),
	(20, 5, '+1:35.460', '', 10, 1, 14),
	(20, 6, '19368', '', 7, 6, 15),
	(20, 7, '+13.330s', '', 5, 10, 16),
	(20, 11, '+73.748s', '', 7, 7, 17),
	(21, 14, '+17.456s', '', 8, 4, 1),
	(21, 5, 'Retirou-se', '', 0, 0, 2),
	(21, 14, '+1 volta', '', 13, 0, 3),
	(21, 9, '26937', '', 6, 8, 4),
	(21, 14, '+64.773s', '', 8, 4, 5),
	(21, 15, '+1 Volta', '', 13, 0, 6),
	(21, 6, '40650', '', 5, 10, 7),
	(21, 12, '18691', '', 8, 4, 8),
	(21, 10, '', 'Freios', 0, 0, 9),
	(21, 7, '+1:08.006s', '', 7, 6, 10),
	(21, 7, '', 'Hidráulica', 0, 0, 11),
	(21, 11, '+1 volta', '', 8, 4, 12),
	(21, 12, '', 'Caixa de velocidade', 0, 0, 13),
	(21, 7, '+1 volta', '', 11, 0, 14),
	(21, 7, '22803', '', 9, 2, 15),
	(21, 11, '+10.518s', '', 2, 18, 16),
	(21, 10, '+101.069s', '', 9, 2, 17),
	(22, 20, '+31.650s', '', 11, 0, 1),
	(22, 18, '+2 Volstas', '', 17, 0, 2),
	(22, 15, '+5 voltas', '', 19, 0, 3),
	(22, 18, '54549', '', 15, 0, 4),
	(22, 18, '+1 volta', '', 19, 0, 5),
	(22, 19, '+2 Voltas', '', 18, 0, 6),
	(22, 19, '+1:17.795', '', 16, 0, 7),
	(22, 20, '32876', '', 11, 0, 8),
	(22, 19, '', 'Colisão', 0, 0, 9),
	(22, 20, '+ 1 volta', '', 16, 0, 10),
	(22, 18, '54449', '', 14, 0, 11),
	(22, 20, '+2 voltas', '', 18, 0, 12),
	(22, 19, '27135', '', 11, 0, 13),
	(22, -2, '', 'Colisão', 0, 0, 14),
	(22, 20, '+1 volta', '', 14, 0, 15),
	(22, 17, '', 'Vazamento de óleo', 0, 0, 16),
	(22, 18, '+1 volta', '', 17, 0, 17),
	(23, 17, '', 'Motor', 0, 0, 1),
	(23, 11, '+2 Voltas', '', 16, 0, 2),
	(23, 12, '+1 volta', '', 18, 0, 3),
	(23, 20, '52004', '', 12, 0, 4),
	(23, 15, '+1 volta', '', 18, 0, 5),
	(23, 18, '+1 Volta', '', 17, 0, 6),
	(23, 15, '', 'Colisão com detritos', 0, 0, 7),
	(23, 19, '36593', '', 14, 0, 8),
	(23, 18, '+32.404s', '', 11, 0, 9),
	(23, 13, '+ 1 volta', '', 18, 0, 10),
	(23, 17, '', 'Pneu', 0, 0, 11),
	(23, 14, '+1 volta', '', 14, 0, 12),
	(23, 13, '', 'Acidente', 0, 0, 13),
	(23, -1, '+1 volta', '', 16, 0, 14),
	(23, 14, '+1 volta', '', 12, 0, 15),
	(23, 2, '+18.556s', '', 9, 4, 16),
	(23, 16, '+1 volta', '', 15, 0, 17),
	(24, 18, '+33.674s', '', 16, 0, 16);
/*!40000 ALTER TABLE `resultados` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
