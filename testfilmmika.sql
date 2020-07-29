-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour testfilmmika
CREATE DATABASE IF NOT EXISTS `testfilmmika` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `testfilmmika`;

-- Listage de la structure de la table testfilmmika. doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table testfilmmika.doctrine_migration_versions : ~1 rows (environ)
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20200729123056', '2020-07-29 12:31:11', 114),
	('DoctrineMigrations\\Version20200729123631', '2020-07-29 12:36:41', 199);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;

-- Listage de la structure de la table testfilmmika. film
CREATE TABLE IF NOT EXISTS `film` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duree` int(11) NOT NULL,
  `synopsis` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table testfilmmika.film : ~0 rows (environ)
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` (`id`, `titre`, `duree`, `synopsis`) VALUES
	(1, 'Iron Man', 126, 'Tony Stark, inventeur de génie, vendeur d\'armes et playboy milliardaire, est kidnappé en Aghanistan. Forcé par ses ravisseurs à fabriquer une arme redoutable, il construit en secret une armure high-tech révolutionnaire qu\'il utilise pour s\'échapper. Comprenant la puissance de cette armure, il décide de l\'améliorer et de l\'utiliser pour faire régner la justice et protéger les innocents.'),
	(2, 'Avengers', 144, 'Nick Fury, le directeur du S.H.I.E.L.D., l\'organisation qui préserve la paix dans le monde, veut former une équipe d\'irréductibles pour empêcher la destruction du monde. Iron Man, Hulk, Thor, Captain America, Hawkeye et Black Widow répondent présents. La nouvelle équipe, baptisée Avengers, a beau sembler soudée, il reste encore à ses illustres membres à apprendre à travailler ensemble.'),
	(3, 'Ant-Man', 117, 'Après les événements survenus dans Captain America : Civil War, Scott Lang a bien du mal à concilier sa vie de super-héros et ses responsabilités de père. Mais ses réflexions sur les conséquences de ses choix tournent court lorsque Hope van Dyne et le Dr Hank Pym lui confient une nouvelle mission urgente… Scott va devoir renfiler son costume et apprendre à se battre aux côtés de La Guêpe afin de faire la lumière sur des secrets enfouis de longue date…');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;

-- Listage de la structure de la table testfilmmika. salle
CREATE TABLE IF NOT EXISTS `salle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_salle` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacite` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table testfilmmika.salle : ~0 rows (environ)
/*!40000 ALTER TABLE `salle` DISABLE KEYS */;
INSERT INTO `salle` (`id`, `nom_salle`, `capacite`) VALUES
	(1, 'Bleu', 400),
	(2, 'Rouge', 600),
	(3, 'Jaune', 200);
/*!40000 ALTER TABLE `salle` ENABLE KEYS */;

-- Listage de la structure de la table testfilmmika. seance
CREATE TABLE IF NOT EXISTS `seance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_heure` datetime NOT NULL,
  `film_id` int(11) NOT NULL,
  `salle_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DF7DFD0E567F5183` (`film_id`),
  KEY `IDX_DF7DFD0EDC304035` (`salle_id`),
  CONSTRAINT `FK_DF7DFD0E567F5183` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  CONSTRAINT `FK_DF7DFD0EDC304035` FOREIGN KEY (`salle_id`) REFERENCES `salle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table testfilmmika.seance : ~0 rows (environ)
/*!40000 ALTER TABLE `seance` DISABLE KEYS */;
INSERT INTO `seance` (`id`, `date_heure`, `film_id`, `salle_id`) VALUES
	(1, '2020-07-29 14:49:59', 3, 1),
	(2, '2020-07-30 14:50:14', 2, 3),
	(3, '2020-07-31 15:50:40', 1, 2),
	(4, '2020-07-30 18:51:07', 2, 1);
/*!40000 ALTER TABLE `seance` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
