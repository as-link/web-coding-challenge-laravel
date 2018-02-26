-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 26 fév. 2018 à 13:12
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `shops`
--

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `opinions`
--

DROP TABLE IF EXISTS `opinions`;
CREATE TABLE IF NOT EXISTS `opinions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `opinion` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IDX_AB02B027A76ED395` (`user_id`),
  KEY `IDX_AB02B0274D16C4DD` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `shops`
--

DROP TABLE IF EXISTS `shops`;
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(5) DEFAULT NULL,
  `email` varchar(23) DEFAULT NULL,
  `name` varchar(9) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `shops`
--

INSERT INTO `shops` (`id`, `city`, `email`, `name`, `picture`, `lat`, `lng`, `created_at`, `modified_at`) VALUES
(1, 'Rabat', 'leilaware@silodyne.com', 'Silodyne', 'http://lorempixel.com/200/250/city/', -6.75175, 33.96853, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(2, 'Rabat', 'leilaware@canopoly.com', 'Canopoly', 'http://lorempixel.com/200/250/city/', -6.77404, 33.80354, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(3, 'Rabat', 'leilaware@sonique.com', 'Sonique', 'http://lorempixel.com/200/250/city/', -6.74938, 33.83436, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(4, 'Rabat', 'leilaware@quiltigen.com', 'Quiltigen', 'http://lorempixel.com/200/250/city/', -6.84286, 33.96579, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(5, 'Rabat', 'leilaware@infotrips.com', 'Infotrips', 'http://lorempixel.com/200/250/city/', -6.80604, 33.94889, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(6, 'Rabat', 'leilaware@biflex.com', 'Biflex', 'http://lorempixel.com/200/250/city/', -6.8123, 33.86261, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(7, 'Rabat', 'leilaware@permadyne.com', 'Permadyne', 'http://lorempixel.com/200/250/city/', -6.75058, 33.81395, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(8, 'Rabat', 'leilaware@bunga.com', 'Bunga', 'http://lorempixel.com/200/250/city/', -6.77428, 33.94109, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(9, 'Rabat', 'leilaware@vendblend.com', 'Vendblend', 'http://lorempixel.com/200/250/city/', -6.78522, 33.89471, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(10, 'Rabat', 'leilaware@strezzo.com', 'Strezzo', 'http://lorempixel.com/200/250/city/', -6.78271, 33.8021, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(11, 'Rabat', 'leilaware@multiflex.com', 'Multiflex', 'http://lorempixel.com/200/250/city/', -6.84318, 33.91423, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(12, 'Rabat', 'leilaware@amtas.com', 'Amtas', 'http://lorempixel.com/200/250/city/', -6.76681, 33.92546, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(13, 'Rabat', 'leilaware@medmex.com', 'Medmex', 'http://lorempixel.com/200/250/city/', -6.75185, 33.89586, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(14, 'Rabat', 'leilaware@limozen.com', 'Limozen', 'http://lorempixel.com/200/250/city/', -6.84619, 33.94625, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(15, 'Rabat', 'leilaware@securia.com', 'Securia', 'http://lorempixel.com/200/250/city/', -6.82966, 33.94125, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(16, 'Rabat', 'leilaware@enerforce.com', 'Enerforce', 'http://lorempixel.com/200/250/city/', -6.79465, 33.97383, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(17, 'Rabat', 'leilaware@earwax.com', 'Earwax', 'http://lorempixel.com/200/250/city/', -6.81943, 33.87998, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(18, 'Rabat', 'leilaware@cablam.com', 'Cablam', 'http://lorempixel.com/200/250/city/', -6.75778, 33.97468, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(19, 'Rabat', 'leilaware@emoltra.com', 'Emoltra', 'http://lorempixel.com/200/250/city/', -6.78269, 33.91448, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(20, 'Rabat', 'leilaware@tubalum.com', 'Tubalum', 'http://lorempixel.com/200/250/city/', -6.79337, 33.80098, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(21, 'Rabat', 'leilaware@toyletry.com', 'Toyletry', 'http://lorempixel.com/200/250/city/', -6.75454, 33.82381, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(22, 'Rabat', 'leilaware@comveyor.com', 'Comveyor', 'http://lorempixel.com/200/250/city/', -6.75603, 33.85214, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(23, 'Rabat', 'leilaware@techmania.com', 'Techmania', 'http://lorempixel.com/200/250/city/', -6.80777, 33.98156, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(24, 'Rabat', 'leilaware@peticular.com', 'Peticular', 'http://lorempixel.com/200/250/city/', -6.78231, 33.83055, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(25, 'Rabat', 'leilaware@teraprene.com', 'Teraprene', 'http://lorempixel.com/200/250/city/', -6.84167, 33.81279, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(26, 'Rabat', 'leilaware@quarex.com', 'Quarex', 'http://lorempixel.com/200/250/city/', -6.78929, 33.82861, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(27, 'Rabat', 'leilaware@kiggle.com', 'Kiggle', 'http://lorempixel.com/200/250/city/', -6.8244, 33.80087, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(28, 'Rabat', 'leilaware@amtap.com', 'Amtap', 'http://lorempixel.com/200/250/city/', -6.77772, 33.94732, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(29, 'Rabat', 'leilaware@maxemia.com', 'Maxemia', 'http://lorempixel.com/200/250/city/', -6.79656, 33.82961, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(30, 'Rabat', 'leilaware@datagene.com', 'Datagene', 'http://lorempixel.com/200/250/city/', -6.83746, 33.91183, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(31, 'Rabat', 'leilaware@splinx.com', 'Splinx', 'http://lorempixel.com/200/250/city/', -6.76639, 33.96536, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(32, 'Rabat', 'leilaware@plexia.com', 'Plexia', 'http://lorempixel.com/200/250/city/', -6.77151, 33.97996, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(33, 'Rabat', 'leilaware@zytrax.com', 'Zytrax', 'http://lorempixel.com/200/250/city/', -6.75629, 33.81514, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(34, 'Rabat', 'leilaware@nebulean.com', 'Nebulean', 'http://lorempixel.com/200/250/city/', -6.80549, 33.84752, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(35, 'Rabat', 'leilaware@chillium.com', 'Chillium', 'http://lorempixel.com/200/250/city/', -6.80111, 33.83202, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(36, 'Rabat', 'leilaware@bitendrex.com', 'Bitendrex', 'http://lorempixel.com/200/250/city/', -6.80479, 33.83069, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(37, 'Rabat', 'leilaware@assitia.com', 'Assitia', 'http://lorempixel.com/200/250/city/', -6.75229, 33.94719, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(38, 'Rabat', 'leilaware@apexia.com', 'Apexia', 'http://lorempixel.com/200/250/city/', -6.81765, 33.91963, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(39, 'Rabat', 'leilaware@hopeli.com', 'Hopeli', 'http://lorempixel.com/200/250/city/', -6.75449, 33.85677, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(40, 'Rabat', 'leilaware@tingles.com', 'Tingles', 'http://lorempixel.com/200/250/city/', -6.8379, 33.93353, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(41, 'Rabat', 'leilaware@frosnex.com', 'Frosnex', 'http://lorempixel.com/200/250/city/', -6.76316, 33.86427, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(42, 'Rabat', 'leilaware@polarax.com', 'Polarax', 'http://lorempixel.com/200/250/city/', -6.77299, 33.95444, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(43, 'Rabat', 'leilaware@cujo.com', 'Cujo', 'http://lorempixel.com/200/250/city/', -6.83668, 33.90277, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(44, 'Rabat', 'leilaware@homelux.com', 'Homelux', 'http://lorempixel.com/200/250/city/', -6.82306, 33.90954, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(45, 'Rabat', 'leilaware@corecom.com', 'Corecom', 'http://lorempixel.com/200/250/city/', -6.80748, 33.82309, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(46, 'Rabat', 'leilaware@aquazure.com', 'Aquazure', 'http://lorempixel.com/200/250/city/', -6.82145, 33.8112, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(47, 'Rabat', 'leilaware@bovis.com', 'Bovis', 'http://lorempixel.com/200/250/city/', -6.84044, 33.812, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(48, 'Rabat', 'leilaware@nixelt.com', 'Nixelt', 'http://lorempixel.com/200/250/city/', -6.7784, 33.80491, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(49, 'Rabat', 'leilaware@combot.com', 'Combot', 'http://lorempixel.com/200/250/city/', -6.78045, 33.8831, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(50, 'Rabat', 'leilaware@radiantix.com', 'Radiantix', 'http://lorempixel.com/200/250/city/', -6.75229, 33.95034, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(51, 'Rabat', 'leilaware@musaphics.com', 'Musaphics', 'http://lorempixel.com/200/250/city/', -6.76087, 33.92329, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(52, 'Rabat', 'leilaware@zentury.com', 'Zentury', 'http://lorempixel.com/200/250/city/', -6.75854, 33.87839, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(53, 'Rabat', 'leilaware@genmom.com', 'Genmom', 'http://lorempixel.com/200/250/city/', -6.79387, 33.83957, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(54, 'Rabat', 'leilaware@dymi.com', 'Dymi', 'http://lorempixel.com/200/250/city/', -6.84418, 33.85318, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(55, 'Rabat', 'leilaware@exoswitch.com', 'Exoswitch', 'http://lorempixel.com/200/250/city/', -6.74934, 33.82365, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(56, 'Rabat', 'leilaware@verbus.com', 'Verbus', 'http://lorempixel.com/200/250/city/', -6.83603, 33.89594, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(57, 'Rabat', 'leilaware@inquala.com', 'Inquala', 'http://lorempixel.com/200/250/city/', -6.8438, 33.8434, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(58, 'Rabat', 'leilaware@fangold.com', 'Fangold', 'http://lorempixel.com/200/250/city/', -6.83297, 33.96749, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(59, 'Rabat', 'leilaware@lotron.com', 'Lotron', 'http://lorempixel.com/200/250/city/', -6.81209, 33.87673, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(60, 'Rabat', 'leilaware@gronk.com', 'Gronk', 'http://lorempixel.com/200/250/city/', -6.83079, 33.9722, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(61, 'Rabat', 'leilaware@snorus.com', 'Snorus', 'http://lorempixel.com/200/250/city/', -6.84665, 33.8618, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(62, 'Rabat', 'leilaware@musaphics.com', 'Musaphics', 'http://lorempixel.com/200/250/city/', -6.78246, 33.91788, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(63, 'Rabat', 'leilaware@zolavo.com', 'Zolavo', 'http://lorempixel.com/200/250/city/', -6.8301, 33.82438, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(64, 'Rabat', 'leilaware@orbean.com', 'Orbean', 'http://lorempixel.com/200/250/city/', -6.83871, 33.80629, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(65, 'Rabat', 'leilaware@scentric.com', 'Scentric', 'http://lorempixel.com/200/250/city/', -6.83326, 33.96551, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(66, 'Rabat', 'leilaware@zorromop.com', 'Zorromop', 'http://lorempixel.com/200/250/city/', -6.83456, 33.93267, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(67, 'Rabat', 'leilaware@empirica.com', 'Empirica', 'http://lorempixel.com/200/250/city/', -6.79357, 33.9909, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(68, 'Rabat', 'leilaware@terragen.com', 'Terragen', 'http://lorempixel.com/200/250/city/', -6.79704, 33.81158, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(69, 'Rabat', 'leilaware@zaggles.com', 'Zaggles', 'http://lorempixel.com/200/250/city/', -6.79283, 33.80759, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(70, 'Rabat', 'leilaware@furnafix.com', 'Furnafix', 'http://lorempixel.com/200/250/city/', -6.82956, 33.91959, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(71, 'Rabat', 'leilaware@quilch.com', 'Quilch', 'http://lorempixel.com/200/250/city/', -6.80042, 33.87388, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(72, 'Rabat', 'leilaware@zentime.com', 'Zentime', 'http://lorempixel.com/200/250/city/', -6.81954, 33.8559, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(73, 'Rabat', 'leilaware@irack.com', 'Irack', 'http://lorempixel.com/200/250/city/', -6.79309, 33.98909, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(74, 'Rabat', 'leilaware@multron.com', 'Multron', 'http://lorempixel.com/200/250/city/', -6.80932, 33.97945, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(75, 'Rabat', 'leilaware@soprano.com', 'Soprano', 'http://lorempixel.com/200/250/city/', -6.75435, 33.83201, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(76, 'Rabat', 'leilaware@kneedles.com', 'Kneedles', 'http://lorempixel.com/200/250/city/', -6.78704, 33.90884, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(77, 'Rabat', 'leilaware@inear.com', 'Inear', 'http://lorempixel.com/200/250/city/', -6.79758, 33.81992, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(78, 'Rabat', 'leilaware@zenco.com', 'Zenco', 'http://lorempixel.com/200/250/city/', -6.82355, 33.93512, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(79, 'Rabat', 'leilaware@extragene.com', 'Extragene', 'http://lorempixel.com/200/250/city/', -6.83153, 33.8133, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(80, 'Rabat', 'leilaware@megall.com', 'Megall', 'http://lorempixel.com/200/250/city/', -6.83357, 33.93788, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(81, 'Rabat', 'leilaware@klugger.com', 'Klugger', 'http://lorempixel.com/200/250/city/', -6.79661, 33.90053, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(82, 'Rabat', 'leilaware@zipak.com', 'Zipak', 'http://lorempixel.com/200/250/city/', -6.74736, 33.81514, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(83, 'Rabat', 'leilaware@quotezart.com', 'Quotezart', 'http://lorempixel.com/200/250/city/', -6.78849, 33.99337, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(84, 'Rabat', 'leilaware@imaginart.com', 'Imaginart', 'http://lorempixel.com/200/250/city/', -6.81157, 33.99564, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(85, 'Rabat', 'leilaware@zenolux.com', 'Zenolux', 'http://lorempixel.com/200/250/city/', -6.76269, 33.83833, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(86, 'Rabat', 'leilaware@newcube.com', 'Newcube', 'http://lorempixel.com/200/250/city/', -6.83287, 33.96337, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(87, 'Rabat', 'leilaware@isodrive.com', 'Isodrive', 'http://lorempixel.com/200/250/city/', -6.84503, 33.91952, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(88, 'Rabat', 'leilaware@geekosis.com', 'Geekosis', 'http://lorempixel.com/200/250/city/', -6.81826, 33.84792, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(89, 'Rabat', 'leilaware@diginetic.com', 'Diginetic', 'http://lorempixel.com/200/250/city/', -6.84502, 33.92325, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(90, 'Rabat', 'leilaware@ultrimax.com', 'Ultrimax', 'http://lorempixel.com/200/250/city/', -6.75473, 33.84333, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(91, 'Rabat', 'leilaware@valreda.com', 'Valreda', 'http://lorempixel.com/200/250/city/', -6.83789, 33.86515, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(92, 'Rabat', 'leilaware@recritube.com', 'Recritube', 'http://lorempixel.com/200/250/city/', -6.78916, 33.87576, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(93, 'Rabat', 'leilaware@datagen.com', 'Datagen', 'http://lorempixel.com/200/250/city/', -6.83263, 33.91399, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(94, 'Rabat', 'leilaware@animalia.com', 'Animalia', 'http://lorempixel.com/200/250/city/', -6.7483, 33.86793, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(95, 'Rabat', 'leilaware@limage.com', 'Limage', 'http://lorempixel.com/200/250/city/', -6.84039, 33.97518, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(96, 'Rabat', 'leilaware@zanilla.com', 'Zanilla', 'http://lorempixel.com/200/250/city/', -6.79739, 33.80084, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(97, 'Rabat', 'leilaware@proflex.com', 'Proflex', 'http://lorempixel.com/200/250/city/', -6.82649, 33.80586, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(98, 'Rabat', 'leilaware@firewax.com', 'Firewax', 'http://lorempixel.com/200/250/city/', -6.76472, 33.96184, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(99, 'Rabat', 'leilaware@multiflex.com', 'Multiflex', 'http://lorempixel.com/200/250/city/', -6.78845, 33.96487, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(100, 'Rabat', 'leilaware@colaire.com', 'Colaire', 'http://lorempixel.com/200/250/city/', -6.84288, 33.91697, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(101, 'Rabat', 'leilaware@cinesanct.com', 'Cinesanct', 'http://lorempixel.com/200/250/city/', -6.82376, 33.90647, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(102, 'Rabat', 'leilaware@illumity.com', 'Illumity', 'http://lorempixel.com/200/250/city/', -6.77704, 33.84155, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(103, 'Rabat', 'leilaware@futuris.com', 'Futuris', 'http://lorempixel.com/200/250/city/', -6.74868, 33.84807, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(104, 'Rabat', 'leilaware@mediot.com', 'Mediot', 'http://lorempixel.com/200/250/city/', -6.80163, 33.87195, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(105, 'Rabat', 'leilaware@corporana.com', 'Corporana', 'http://lorempixel.com/200/250/city/', -6.77783, 33.84444, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(106, 'Rabat', 'leilaware@intergeek.com', 'Intergeek', 'http://lorempixel.com/200/250/city/', -6.83708, 33.94228, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(107, 'Rabat', 'leilaware@quordate.com', 'Quordate', 'http://lorempixel.com/200/250/city/', -6.79025, 33.88059, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(108, 'Rabat', 'leilaware@anarco.com', 'Anarco', 'http://lorempixel.com/200/250/city/', -6.76527, 33.94852, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(109, 'Rabat', 'leilaware@medalert.com', 'Medalert', 'http://lorempixel.com/200/250/city/', -6.83038, 33.81058, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(110, 'Rabat', 'leilaware@gonkle.com', 'Gonkle', 'http://lorempixel.com/200/250/city/', -6.76673, 33.84282, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(111, 'Rabat', 'leilaware@callflex.com', 'Callflex', 'http://lorempixel.com/200/250/city/', -6.84022, 33.96167, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(112, 'Rabat', 'leilaware@terascape.com', 'Terascape', 'http://lorempixel.com/200/250/city/', -6.82571, 33.86166, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(113, 'Rabat', 'leilaware@zilencio.com', 'Zilencio', 'http://lorempixel.com/200/250/city/', -6.77078, 33.92877, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(114, 'Rabat', 'leilaware@digiprint.com', 'Digiprint', 'http://lorempixel.com/200/250/city/', -6.82542, 33.85383, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(115, 'Rabat', 'leilaware@navir.com', 'Navir', 'http://lorempixel.com/200/250/city/', -6.83166, 33.93683, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(116, 'Rabat', 'leilaware@capscreen.com', 'Capscreen', 'http://lorempixel.com/200/250/city/', -6.76421, 33.89753, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(117, 'Rabat', 'leilaware@bezal.com', 'Bezal', 'http://lorempixel.com/200/250/city/', -6.79756, 33.92858, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(118, 'Rabat', 'leilaware@insurety.com', 'Insurety', 'http://lorempixel.com/200/250/city/', -6.84015, 33.97918, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(119, 'Rabat', 'leilaware@deminimum.com', 'Deminimum', 'http://lorempixel.com/200/250/city/', -6.81579, 33.80807, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(120, 'Rabat', 'leilaware@insectus.com', 'Insectus', 'http://lorempixel.com/200/250/city/', -6.77309, 33.90475, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(121, 'Rabat', 'leilaware@slambda.com', 'Slambda', 'http://lorempixel.com/200/250/city/', -6.82149, 33.92087, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(122, 'Rabat', 'leilaware@bisba.com', 'Bisba', 'http://lorempixel.com/200/250/city/', -6.79137, 33.84051, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(123, 'Rabat', 'leilaware@zoarere.com', 'Zoarere', 'http://lorempixel.com/200/250/city/', -6.76169, 33.96976, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(124, 'Rabat', 'leilaware@rubadub.com', 'Rubadub', 'http://lorempixel.com/200/250/city/', -6.75018, 33.92082, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(125, 'Rabat', 'leilaware@fitcore.com', 'Fitcore', 'http://lorempixel.com/200/250/city/', -6.81239, 33.8375, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(126, 'Rabat', 'leilaware@mixers.com', 'Mixers', 'http://lorempixel.com/200/250/city/', -6.84393, 33.99179, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(127, 'Rabat', 'leilaware@exozent.com', 'Exozent', 'http://lorempixel.com/200/250/city/', -6.79665, 33.90796, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(128, 'Rabat', 'leilaware@koffee.com', 'Koffee', 'http://lorempixel.com/200/250/city/', -6.80304, 33.93513, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(129, 'Rabat', 'leilaware@repetwire.com', 'Repetwire', 'http://lorempixel.com/200/250/city/', -6.7795, 33.93867, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(130, 'Rabat', 'leilaware@grupoli.com', 'Grupoli', 'http://lorempixel.com/200/250/city/', -6.82952, 33.86433, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(131, 'Rabat', 'leilaware@comtrail.com', 'Comtrail', 'http://lorempixel.com/200/250/city/', -6.83662, 33.92165, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(132, 'Rabat', 'leilaware@pasturia.com', 'Pasturia', 'http://lorempixel.com/200/250/city/', -6.7777, 33.97911, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(133, 'Rabat', 'leilaware@mangelica.com', 'Mangelica', 'http://lorempixel.com/200/250/city/', -6.83451, 33.85529, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(134, 'Rabat', 'leilaware@delphide.com', 'Delphide', 'http://lorempixel.com/200/250/city/', -6.78017, 33.9075, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(135, 'Rabat', 'leilaware@franscene.com', 'Franscene', 'http://lorempixel.com/200/250/city/', -6.757, 33.85657, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(136, 'Rabat', 'leilaware@comtest.com', 'Comtest', 'http://lorempixel.com/200/250/city/', -6.77214, 33.98496, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(137, 'Rabat', 'leilaware@krag.com', 'Krag', 'http://lorempixel.com/200/250/city/', -6.79633, 33.83348, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(138, 'Rabat', 'leilaware@isotronic.com', 'Isotronic', 'http://lorempixel.com/200/250/city/', -6.79018, 33.86291, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(139, 'Rabat', 'leilaware@sultrax.com', 'Sultrax', 'http://lorempixel.com/200/250/city/', -6.79318, 33.92908, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(140, 'Rabat', 'leilaware@veraq.com', 'Veraq', 'http://lorempixel.com/200/250/city/', -6.76394, 33.88376, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(141, 'Rabat', 'leilaware@plasmos.com', 'Plasmos', 'http://lorempixel.com/200/250/city/', -6.79591, 33.83437, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(142, 'Rabat', 'leilaware@comstruct.com', 'Comstruct', 'http://lorempixel.com/200/250/city/', -6.81188, 33.83033, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(143, 'Rabat', 'leilaware@isosphere.com', 'Isosphere', 'http://lorempixel.com/200/250/city/', -6.82254, 33.80692, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(144, 'Rabat', 'leilaware@diginetic.com', 'Diginetic', 'http://lorempixel.com/200/250/city/', -6.77412, 33.94772, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(145, 'Rabat', 'leilaware@digiprint.com', 'Digiprint', 'http://lorempixel.com/200/250/city/', -6.82925, 33.91411, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(146, 'Rabat', 'leilaware@zaj.com', 'Zaj', 'http://lorempixel.com/200/250/city/', -6.80406, 33.9023, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(147, 'Rabat', 'leilaware@bluplanet.com', 'Bluplanet', 'http://lorempixel.com/200/250/city/', -6.78665, 33.97746, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(148, 'Rabat', 'leilaware@zizzle.com', 'Zizzle', 'http://lorempixel.com/200/250/city/', -6.84065, 33.96044, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(149, 'Rabat', 'leilaware@viasia.com', 'Viasia', 'http://lorempixel.com/200/250/city/', -6.78266, 33.8526, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(150, 'Rabat', 'leilaware@skyplex.com', 'Skyplex', 'http://lorempixel.com/200/250/city/', -6.83191, 33.95952, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(151, 'Rabat', 'leilaware@capscreen.com', 'Capscreen', 'http://lorempixel.com/200/250/city/', -6.83952, 33.90985, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(152, 'Rabat', 'leilaware@zaya.com', 'Zaya', 'http://lorempixel.com/200/250/city/', -6.81268, 33.91896, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(153, 'Rabat', 'leilaware@elpro.com', 'Elpro', 'http://lorempixel.com/200/250/city/', -6.75786, 33.86421, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(154, 'Rabat', 'leilaware@ovium.com', 'Ovium', 'http://lorempixel.com/200/250/city/', -6.83239, 33.97846, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(155, 'Rabat', 'leilaware@sportan.com', 'Sportan', 'http://lorempixel.com/200/250/city/', -6.78146, 33.80955, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(156, 'Rabat', 'leilaware@imaginart.com', 'Imaginart', 'http://lorempixel.com/200/250/city/', -6.83928, 33.80205, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(157, 'Rabat', 'leilaware@otherway.com', 'Otherway', 'http://lorempixel.com/200/250/city/', -6.8173, 33.89579, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(158, 'Rabat', 'leilaware@nitracyr.com', 'Nitracyr', 'http://lorempixel.com/200/250/city/', -6.75817, 33.90178, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(159, 'Rabat', 'leilaware@flyboyz.com', 'Flyboyz', 'http://lorempixel.com/200/250/city/', -6.84326, 33.84391, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(160, 'Rabat', 'leilaware@ultrasure.com', 'Ultrasure', 'http://lorempixel.com/200/250/city/', -6.77748, 33.84626, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(161, 'Rabat', 'leilaware@geekular.com', 'Geekular', 'http://lorempixel.com/200/250/city/', -6.7484, 33.84443, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(162, 'Rabat', 'leilaware@bedlam.com', 'Bedlam', 'http://lorempixel.com/200/250/city/', -6.7963, 33.81976, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(163, 'Rabat', 'leilaware@speedbolt.com', 'Speedbolt', 'http://lorempixel.com/200/250/city/', -6.77091, 33.86472, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(164, 'Rabat', 'leilaware@zaggles.com', 'Zaggles', 'http://lorempixel.com/200/250/city/', -6.77643, 33.90772, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(165, 'Rabat', 'leilaware@anixang.com', 'Anixang', 'http://lorempixel.com/200/250/city/', -6.81077, 33.89655, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(166, 'Rabat', 'leilaware@gonkle.com', 'Gonkle', 'http://lorempixel.com/200/250/city/', -6.79612, 33.84739, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(167, 'Rabat', 'leilaware@besto.com', 'Besto', 'http://lorempixel.com/200/250/city/', -6.83368, 33.95549, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(168, 'Rabat', 'leilaware@nipaz.com', 'Nipaz', 'http://lorempixel.com/200/250/city/', -6.77913, 33.98259, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(169, 'Rabat', 'leilaware@tropoli.com', 'Tropoli', 'http://lorempixel.com/200/250/city/', -6.75627, 33.87953, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(170, 'Rabat', 'leilaware@quilch.com', 'Quilch', 'http://lorempixel.com/200/250/city/', -6.81153, 33.96788, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(171, 'Rabat', 'leilaware@waretel.com', 'Waretel', 'http://lorempixel.com/200/250/city/', -6.78895, 33.97824, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(172, 'Rabat', 'leilaware@senmao.com', 'Senmao', 'http://lorempixel.com/200/250/city/', -6.79473, 33.8573, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(173, 'Rabat', 'leilaware@datacator.com', 'Datacator', 'http://lorempixel.com/200/250/city/', -6.7827, 33.95476, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(174, 'Rabat', 'leilaware@zensure.com', 'Zensure', 'http://lorempixel.com/200/250/city/', -6.80316, 33.94916, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(175, 'Rabat', 'leilaware@zillidium.com', 'Zillidium', 'http://lorempixel.com/200/250/city/', -6.80883, 33.96045, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(176, 'Rabat', 'leilaware@apextri.com', 'Apextri', 'http://lorempixel.com/200/250/city/', -6.79806, 33.90886, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(177, 'Rabat', 'leilaware@bittor.com', 'Bittor', 'http://lorempixel.com/200/250/city/', -6.82572, 33.86219, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(178, 'Rabat', 'leilaware@elemantra.com', 'Elemantra', 'http://lorempixel.com/200/250/city/', -6.80786, 33.87471, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(179, 'Rabat', 'leilaware@panzent.com', 'Panzent', 'http://lorempixel.com/200/250/city/', -6.82365, 33.84756, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(180, 'Rabat', 'leilaware@inear.com', 'Inear', 'http://lorempixel.com/200/250/city/', -6.75358, 33.91787, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(181, 'Rabat', 'leilaware@rockabye.com', 'Rockabye', 'http://lorempixel.com/200/250/city/', -6.74976, 33.91279, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(182, 'Rabat', 'leilaware@dadabase.com', 'Dadabase', 'http://lorempixel.com/200/250/city/', -6.80423, 33.86394, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(183, 'Rabat', 'leilaware@everest.com', 'Everest', 'http://lorempixel.com/200/250/city/', -6.7752, 33.85257, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(184, 'Rabat', 'leilaware@colaire.com', 'Colaire', 'http://lorempixel.com/200/250/city/', -6.84071, 33.92175, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(185, 'Rabat', 'leilaware@comcur.com', 'Comcur', 'http://lorempixel.com/200/250/city/', -6.80501, 33.96619, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(186, 'Rabat', 'leilaware@pholio.com', 'Pholio', 'http://lorempixel.com/200/250/city/', -6.83499, 33.94669, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(187, 'Rabat', 'leilaware@datagen.com', 'Datagen', 'http://lorempixel.com/200/250/city/', -6.76886, 33.97208, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(188, 'Rabat', 'leilaware@progenex.com', 'Progenex', 'http://lorempixel.com/200/250/city/', -6.78666, 33.86607, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(189, 'Rabat', 'leilaware@nixelt.com', 'Nixelt', 'http://lorempixel.com/200/250/city/', -6.78839, 33.82126, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(190, 'Rabat', 'leilaware@kozgene.com', 'Kozgene', 'http://lorempixel.com/200/250/city/', -6.75328, 33.84881, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(191, 'Rabat', 'leilaware@buzzness.com', 'Buzzness', 'http://lorempixel.com/200/250/city/', -6.84414, 33.93806, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(192, 'Rabat', 'leilaware@mondicil.com', 'Mondicil', 'http://lorempixel.com/200/250/city/', -6.74722, 33.85523, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(193, 'Rabat', 'leilaware@filodyne.com', 'Filodyne', 'http://lorempixel.com/200/250/city/', -6.747, 33.98196, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(194, 'Rabat', 'leilaware@sultrax.com', 'Sultrax', 'http://lorempixel.com/200/250/city/', -6.77017, 33.84833, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(195, 'Rabat', 'leilaware@orbixtar.com', 'Orbixtar', 'http://lorempixel.com/200/250/city/', -6.75851, 33.90786, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(196, 'Rabat', 'leilaware@injoy.com', 'Injoy', 'http://lorempixel.com/200/250/city/', -6.76261, 33.83654, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(197, 'Rabat', 'leilaware@corporana.com', 'Corporana', 'http://lorempixel.com/200/250/city/', -6.78686, 33.97273, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(198, 'Rabat', 'leilaware@trollery.com', 'Trollery', 'http://lorempixel.com/200/250/city/', -6.84009, 33.94218, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(199, 'Rabat', 'leilaware@suretech.com', 'Suretech', 'http://lorempixel.com/200/250/city/', -6.75684, 33.92775, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(200, 'Rabat', 'leilaware@medicroix.com', 'Medicroix', 'http://lorempixel.com/200/250/city/', -6.81207, 33.96851, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(201, 'Rabat', 'leilaware@zilidium.com', 'Zilidium', 'http://lorempixel.com/200/250/city/', -6.80404, 33.88483, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(202, 'Rabat', 'leilaware@evidends.com', 'Evidends', 'http://lorempixel.com/200/250/city/', -6.78372, 33.93306, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(203, 'Rabat', 'leilaware@obones.com', 'Obones', 'http://lorempixel.com/200/250/city/', -6.75019, 33.89847, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(204, 'Rabat', 'leilaware@bovis.com', 'Bovis', 'http://lorempixel.com/200/250/city/', -6.81018, 33.98705, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(205, 'Rabat', 'leilaware@vitricomp.com', 'Vitricomp', 'http://lorempixel.com/200/250/city/', -6.77941, 33.89834, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(206, 'Rabat', 'leilaware@apextri.com', 'Apextri', 'http://lorempixel.com/200/250/city/', -6.75586, 33.94091, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(207, 'Rabat', 'leilaware@tropoli.com', 'Tropoli', 'http://lorempixel.com/200/250/city/', -6.83355, 33.98069, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(208, 'Rabat', 'leilaware@comvoy.com', 'Comvoy', 'http://lorempixel.com/200/250/city/', -6.79748, 33.83104, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(209, 'Rabat', 'leilaware@eyeris.com', 'Eyeris', 'http://lorempixel.com/200/250/city/', -6.79578, 33.98654, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(210, 'Rabat', 'leilaware@genesynk.com', 'Genesynk', 'http://lorempixel.com/200/250/city/', -6.78956, 33.93169, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(211, 'Rabat', 'leilaware@hydrocom.com', 'Hydrocom', 'http://lorempixel.com/200/250/city/', -6.80956, 33.82815, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(212, 'Rabat', 'leilaware@mondicil.com', 'Mondicil', 'http://lorempixel.com/200/250/city/', -6.74722, 33.85523, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(213, 'Rabat', 'leilaware@filodyne.com', 'Filodyne', 'http://lorempixel.com/200/250/city/', -6.747, 33.98196, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(214, 'Rabat', 'leilaware@sultrax.com', 'Sultrax', 'http://lorempixel.com/200/250/city/', -6.77017, 33.84833, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(215, 'Rabat', 'leilaware@orbixtar.com', 'Orbixtar', 'http://lorempixel.com/200/250/city/', -6.75851, 33.90786, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(216, 'Rabat', 'leilaware@injoy.com', 'Injoy', 'http://lorempixel.com/200/250/city/', -6.76261, 33.83654, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(217, 'Rabat', 'leilaware@corporana.com', 'Corporana', 'http://lorempixel.com/200/250/city/', -6.78686, 33.97273, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(218, 'Rabat', 'leilaware@trollery.com', 'Trollery', 'http://lorempixel.com/200/250/city/', -6.84009, 33.94218, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(219, 'Rabat', 'leilaware@suretech.com', 'Suretech', 'http://lorempixel.com/200/250/city/', -6.75684, 33.92775, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(220, 'Rabat', 'leilaware@medicroix.com', 'Medicroix', 'http://lorempixel.com/200/250/city/', -6.81207, 33.96851, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(221, 'Rabat', 'leilaware@zilidium.com', 'Zilidium', 'http://lorempixel.com/200/250/city/', -6.80404, 33.88483, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(222, 'Rabat', 'leilaware@evidends.com', 'Evidends', 'http://lorempixel.com/200/250/city/', -6.78372, 33.93306, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(223, 'Rabat', 'leilaware@obones.com', 'Obones', 'http://lorempixel.com/200/250/city/', -6.75019, 33.89847, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(224, 'Rabat', 'leilaware@bovis.com', 'Bovis', 'http://lorempixel.com/200/250/city/', -6.81018, 33.98705, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(225, 'Rabat', 'leilaware@vitricomp.com', 'Vitricomp', 'http://lorempixel.com/200/250/city/', -6.77941, 33.89834, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(226, 'Rabat', 'leilaware@apextri.com', 'Apextri', 'http://lorempixel.com/200/250/city/', -6.75586, 33.94091, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(227, 'Rabat', 'leilaware@tropoli.com', 'Tropoli', 'http://lorempixel.com/200/250/city/', -6.83355, 33.98069, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(228, 'Rabat', 'leilaware@comvoy.com', 'Comvoy', 'http://lorempixel.com/200/250/city/', -6.79748, 33.83104, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(229, 'Rabat', 'leilaware@eyeris.com', 'Eyeris', 'http://lorempixel.com/200/250/city/', -6.79578, 33.98654, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(230, 'Rabat', 'leilaware@genesynk.com', 'Genesynk', 'http://lorempixel.com/200/250/city/', -6.78956, 33.93169, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(231, 'Rabat', 'leilaware@hydrocom.com', 'Hydrocom', 'http://lorempixel.com/200/250/city/', -6.80956, 33.82815, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(232, 'Rabat', 'leilaware@kage.com', 'Kage', 'http://lorempixel.com/200/250/city/', -6.81832, 33.95645, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(233, 'Rabat', 'leilaware@zedalis.com', 'Zedalis', 'http://lorempixel.com/200/250/city/', -6.80287, 33.9575, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(234, 'Rabat', 'leilaware@zillan.com', 'Zillan', 'http://lorempixel.com/200/250/city/', -6.77143, 33.93771, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(235, 'Rabat', 'leilaware@vurbo.com', 'Vurbo', 'http://lorempixel.com/200/250/city/', -6.80835, 33.85408, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(236, 'Rabat', 'leilaware@magnemo.com', 'Magnemo', 'http://lorempixel.com/200/250/city/', -6.75796, 33.90401, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(237, 'Rabat', 'leilaware@providco.com', 'Providco', 'http://lorempixel.com/200/250/city/', -6.82018, 33.96232, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(238, 'Rabat', 'leilaware@tubalum.com', 'Tubalum', 'http://lorempixel.com/200/250/city/', -6.77033, 33.88405, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(239, 'Rabat', 'leilaware@gynko.com', 'Gynko', 'http://lorempixel.com/200/250/city/', -6.7661, 33.86215, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(240, 'Rabat', 'leilaware@genekom.com', 'Genekom', 'http://lorempixel.com/200/250/city/', -6.74695, 33.81594, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(241, 'Rabat', 'leilaware@acium.com', 'Acium', 'http://lorempixel.com/200/250/city/', -6.81221, 33.94613, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(242, 'Rabat', 'leilaware@talkalot.com', 'Talkalot', 'http://lorempixel.com/200/250/city/', -6.83579, 33.94983, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(243, 'Rabat', 'leilaware@illumity.com', 'Illumity', 'http://lorempixel.com/200/250/city/', -6.79319, 33.83036, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(244, 'Rabat', 'leilaware@acrodance.com', 'Acrodance', 'http://lorempixel.com/200/250/city/', -6.75917, 33.93589, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(245, 'Rabat', 'leilaware@powernet.com', 'Powernet', 'http://lorempixel.com/200/250/city/', -6.84276, 33.80035, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(246, 'Rabat', 'leilaware@pyramia.com', 'Pyramia', 'http://lorempixel.com/200/250/city/', -6.75301, 33.83085, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(247, 'Rabat', 'leilaware@corporana.com', 'Corporana', 'http://lorempixel.com/200/250/city/', -6.82863, 33.87765, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(248, 'Rabat', 'leilaware@isotronic.com', 'Isotronic', 'http://lorempixel.com/200/250/city/', -6.81091, 33.82032, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(249, 'Rabat', 'leilaware@menbrain.com', 'Menbrain', 'http://lorempixel.com/200/250/city/', -6.79439, 33.86054, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(250, 'Rabat', 'leilaware@aquacine.com', 'Aquacine', 'http://lorempixel.com/200/250/city/', -6.7901, 33.92195, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(251, 'Rabat', 'leilaware@geekko.com', 'Geekko', 'http://lorempixel.com/200/250/city/', -6.77585, 33.80125, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(252, 'Rabat', 'leilaware@netility.com', 'Netility', 'http://lorempixel.com/200/250/city/', -6.82861, 33.99216, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(253, 'Rabat', 'leilaware@reversus.com', 'Reversus', 'http://lorempixel.com/200/250/city/', -6.74911, 33.91049, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(254, 'Rabat', 'leilaware@sureplex.com', 'Sureplex', 'http://lorempixel.com/200/250/city/', -6.75559, 33.95303, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(255, 'Rabat', 'leilaware@norali.com', 'Norali', 'http://lorempixel.com/200/250/city/', -6.7507, 33.92841, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(256, 'Rabat', 'leilaware@softmicro.com', 'Softmicro', 'http://lorempixel.com/200/250/city/', -6.83987, 33.90291, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(257, 'Rabat', 'leilaware@comcur.com', 'Comcur', 'http://lorempixel.com/200/250/city/', -6.79065, 33.81963, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(258, 'Rabat', 'leilaware@pyrami.com', 'Pyrami', 'http://lorempixel.com/200/250/city/', -6.76894, 33.83578, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(259, 'Rabat', 'leilaware@schoolio.com', 'Schoolio', 'http://lorempixel.com/200/250/city/', -6.768, 33.81741, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(260, 'Rabat', 'leilaware@scenty.com', 'Scenty', 'http://lorempixel.com/200/250/city/', -6.78666, 33.91547, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(261, 'Rabat', 'leilaware@malathion.com', 'Malathion', 'http://lorempixel.com/200/250/city/', -6.75076, 33.86233, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(262, 'Rabat', 'leilaware@zboo.com', 'Zboo', 'http://lorempixel.com/200/250/city/', -6.78859, 33.98156, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(263, 'Rabat', 'leilaware@handshake.com', 'Handshake', 'http://lorempixel.com/200/250/city/', -6.84079, 33.95982, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(264, 'Rabat', 'leilaware@edecine.com', 'Edecine', 'http://lorempixel.com/200/250/city/', -6.7764, 33.86472, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(265, 'Rabat', 'leilaware@terragen.com', 'Terragen', 'http://lorempixel.com/200/250/city/', -6.77284, 33.93765, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(266, 'Rabat', 'leilaware@prowaste.com', 'Prowaste', 'http://lorempixel.com/200/250/city/', -6.79311, 33.99213, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(267, 'Rabat', 'leilaware@blurrybus.com', 'Blurrybus', 'http://lorempixel.com/200/250/city/', -6.83983, 33.92688, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(268, 'Rabat', 'leilaware@avit.com', 'Avit', 'http://lorempixel.com/200/250/city/', -6.8143, 33.84092, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(269, 'Rabat', 'leilaware@zentia.com', 'Zentia', 'http://lorempixel.com/200/250/city/', -6.84568, 33.94117, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(270, 'Rabat', 'leilaware@xerex.com', 'Xerex', 'http://lorempixel.com/200/250/city/', -6.79398, 33.96065, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(271, 'Rabat', 'leilaware@architax.com', 'Architax', 'http://lorempixel.com/200/250/city/', -6.81079, 33.9514, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(272, 'Rabat', 'leilaware@wazzu.com', 'Wazzu', 'http://lorempixel.com/200/250/city/', -6.81948, 33.88568, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(273, 'Rabat', 'leilaware@parleynet.com', 'Parleynet', 'http://lorempixel.com/200/250/city/', -6.79371, 33.80105, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(274, 'Rabat', 'leilaware@talkola.com', 'Talkola', 'http://lorempixel.com/200/250/city/', -6.80291, 33.86063, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(275, 'Rabat', 'leilaware@housedown.com', 'Housedown', 'http://lorempixel.com/200/250/city/', -6.79566, 33.94903, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(276, 'Rabat', 'leilaware@ovium.com', 'Ovium', 'http://lorempixel.com/200/250/city/', -6.8066, 33.92018, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(277, 'Rabat', 'leilaware@reversus.com', 'Reversus', 'http://lorempixel.com/200/250/city/', -6.81053, 33.99545, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(278, 'Rabat', 'leilaware@kiosk.com', 'Kiosk', 'http://lorempixel.com/200/250/city/', -6.76816, 33.97174, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(279, 'Rabat', 'leilaware@unia.com', 'Unia', 'http://lorempixel.com/200/250/city/', -6.84483, 33.93537, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(280, 'Rabat', 'leilaware@aquasseur.com', 'Aquasseur', 'http://lorempixel.com/200/250/city/', -6.76921, 33.8083, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(281, 'Rabat', 'leilaware@duflex.com', 'Duflex', 'http://lorempixel.com/200/250/city/', -6.79208, 33.87378, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(282, 'Rabat', 'leilaware@zenolux.com', 'Zenolux', 'http://lorempixel.com/200/250/city/', -6.77611, 33.89991, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(283, 'Rabat', 'leilaware@voratak.com', 'Voratak', 'http://lorempixel.com/200/250/city/', -6.77635, 33.81809, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(284, 'Rabat', 'leilaware@canopoly.com', 'Canopoly', 'http://lorempixel.com/200/250/city/', -6.78195, 33.8258, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(285, 'Rabat', 'leilaware@farmex.com', 'Farmex', 'http://lorempixel.com/200/250/city/', -6.77484, 33.9227, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(286, 'Rabat', 'leilaware@digiprint.com', 'Digiprint', 'http://lorempixel.com/200/250/city/', -6.80967, 33.94565, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(287, 'Rabat', 'leilaware@dentrex.com', 'Dentrex', 'http://lorempixel.com/200/250/city/', -6.82459, 33.95482, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(288, 'Rabat', 'leilaware@securia.com', 'Securia', 'http://lorempixel.com/200/250/city/', -6.80041, 33.90952, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(289, 'Rabat', 'leilaware@ezent.com', 'Ezent', 'http://lorempixel.com/200/250/city/', -6.79328, 33.86559, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(290, 'Rabat', 'leilaware@microluxe.com', 'Microluxe', 'http://lorempixel.com/200/250/city/', -6.80882, 33.8099, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(291, 'Rabat', 'leilaware@rooforia.com', 'Rooforia', 'http://lorempixel.com/200/250/city/', -6.75874, 33.85044, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(292, 'Rabat', 'leilaware@rugstars.com', 'Rugstars', 'http://lorempixel.com/200/250/city/', -6.82555, 33.90534, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(293, 'Rabat', 'leilaware@futuris.com', 'Futuris', 'http://lorempixel.com/200/250/city/', -6.77191, 33.92781, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(294, 'Rabat', 'leilaware@knowlysis.com', 'Knowlysis', 'http://lorempixel.com/200/250/city/', -6.78646, 33.86774, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(295, 'Rabat', 'leilaware@sportan.com', 'Sportan', 'http://lorempixel.com/200/250/city/', -6.76351, 33.92313, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(296, 'Rabat', 'leilaware@vendblend.com', 'Vendblend', 'http://lorempixel.com/200/250/city/', -6.76239, 33.8156, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(297, 'Rabat', 'leilaware@gynko.com', 'Gynko', 'http://lorempixel.com/200/250/city/', -6.79011, 33.98307, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(298, 'Rabat', 'leilaware@anivet.com', 'Anivet', 'http://lorempixel.com/200/250/city/', -6.75608, 33.965, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(299, 'Rabat', 'leilaware@emoltra.com', 'Emoltra', 'http://lorempixel.com/200/250/city/', -6.82551, 33.97388, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(300, 'Rabat', 'leilaware@illumity.com', 'Illumity', 'http://lorempixel.com/200/250/city/', -6.78832, 33.96918, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(301, 'Rabat', 'leilaware@austech.com', 'Austech', 'http://lorempixel.com/200/250/city/', -6.84007, 33.92927, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(302, 'Rabat', 'leilaware@boink.com', 'Boink', 'http://lorempixel.com/200/250/city/', -6.83766, 33.85683, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(303, 'Rabat', 'leilaware@recritube.com', 'Recritube', 'http://lorempixel.com/200/250/city/', -6.77595, 33.86772, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(304, 'Rabat', 'leilaware@comtrak.com', 'Comtrak', 'http://lorempixel.com/200/250/city/', -6.75099, 33.97885, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(305, 'Rabat', 'leilaware@vicon.com', 'Vicon', 'http://lorempixel.com/200/250/city/', -6.79196, 33.95231, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(306, 'Rabat', 'leilaware@strezzo.com', 'Strezzo', 'http://lorempixel.com/200/250/city/', -6.76705, 33.94284, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(307, 'Rabat', 'leilaware@qimonk.com', 'Qimonk', 'http://lorempixel.com/200/250/city/', -6.79774, 33.83119, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(308, 'Rabat', 'leilaware@isonus.com', 'Isonus', 'http://lorempixel.com/200/250/city/', -6.76168, 33.80846, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(309, 'Rabat', 'leilaware@utarian.com', 'Utarian', 'http://lorempixel.com/200/250/city/', -6.78927, 33.96421, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(310, 'Rabat', 'leilaware@harmoney.com', 'Harmoney', 'http://lorempixel.com/200/250/city/', -6.81684, 33.9218, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(311, 'Rabat', 'leilaware@isotrack.com', 'Isotrack', 'http://lorempixel.com/200/250/city/', -6.75823, 33.96455, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(312, 'Rabat', 'leilaware@syntac.com', 'Syntac', 'http://lorempixel.com/200/250/city/', -6.84369, 33.996, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(313, 'Rabat', 'leilaware@marvane.com', 'Marvane', 'http://lorempixel.com/200/250/city/', -6.78614, 33.93422, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(314, 'Rabat', 'leilaware@biotica.com', 'Biotica', 'http://lorempixel.com/200/250/city/', -6.8324, 33.80065, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(315, 'Rabat', 'leilaware@apex.com', 'Apex', 'http://lorempixel.com/200/250/city/', -6.8374, 33.84035, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(316, 'Rabat', 'leilaware@sustenza.com', 'Sustenza', 'http://lorempixel.com/200/250/city/', -6.81866, 33.80756, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(317, 'Rabat', 'leilaware@dreamia.com', 'Dreamia', 'http://lorempixel.com/200/250/city/', -6.79713, 33.93098, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(318, 'Rabat', 'leilaware@concility.com', 'Concility', 'http://lorempixel.com/200/250/city/', -6.78478, 33.96255, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(319, 'Rabat', 'leilaware@cogentry.com', 'Cogentry', 'http://lorempixel.com/200/250/city/', -6.83578, 33.87532, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(320, 'Rabat', 'leilaware@zounds.com', 'Zounds', 'http://lorempixel.com/200/250/city/', -6.84032, 33.96739, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(321, 'Rabat', 'leilaware@unq.com', 'Unq', 'http://lorempixel.com/200/250/city/', -6.76689, 33.99387, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(322, 'Rabat', 'leilaware@accusage.com', 'Accusage', 'http://lorempixel.com/200/250/city/', -6.75127, 33.85952, '2018-01-21 17:50:31', '2018-01-21 17:50:31');
INSERT INTO `shops` (`id`, `city`, `email`, `name`, `picture`, `lat`, `lng`, `created_at`, `modified_at`) VALUES
(323, 'Rabat', 'leilaware@corecom.com', 'Corecom', 'http://lorempixel.com/200/250/city/', -6.76395, 33.9013, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(324, 'Rabat', 'leilaware@incubus.com', 'Incubus', 'http://lorempixel.com/200/250/city/', -6.8362, 33.92331, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(325, 'Rabat', 'leilaware@venoflex.com', 'Venoflex', 'http://lorempixel.com/200/250/city/', -6.79674, 33.88383, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(326, 'Rabat', 'leilaware@slambda.com', 'Slambda', 'http://lorempixel.com/200/250/city/', -6.84344, 33.98877, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(327, 'Rabat', 'leilaware@ecraze.com', 'Ecraze', 'http://lorempixel.com/200/250/city/', -6.77147, 33.8815, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(328, 'Rabat', 'leilaware@bullzone.com', 'Bullzone', 'http://lorempixel.com/200/250/city/', -6.81043, 33.8252, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(329, 'Rabat', 'leilaware@enomen.com', 'Enomen', 'http://lorempixel.com/200/250/city/', -6.84344, 33.95215, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(330, 'Rabat', 'leilaware@isoswitch.com', 'Isoswitch', 'http://lorempixel.com/200/250/city/', -6.759, 33.86044, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(331, 'Rabat', 'leilaware@extragene.com', 'Extragene', 'http://lorempixel.com/200/250/city/', -6.81924, 33.9895, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(332, 'Rabat', 'leilaware@eyeris.com', 'Eyeris', 'http://lorempixel.com/200/250/city/', -6.75822, 33.93273, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(333, 'Rabat', 'leilaware@verton.com', 'Verton', 'http://lorempixel.com/200/250/city/', -6.79216, 33.81497, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(334, 'Rabat', 'leilaware@conjurica.com', 'Conjurica', 'http://lorempixel.com/200/250/city/', -6.75162, 33.91917, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(335, 'Rabat', 'leilaware@sulfax.com', 'Sulfax', 'http://lorempixel.com/200/250/city/', -6.80167, 33.9546, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(336, 'Rabat', 'leilaware@bleendot.com', 'Bleendot', 'http://lorempixel.com/200/250/city/', -6.83393, 33.92647, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(337, 'Rabat', 'leilaware@kineticut.com', 'Kineticut', 'http://lorempixel.com/200/250/city/', -6.83193, 33.98657, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(338, 'Rabat', 'leilaware@petigems.com', 'Petigems', 'http://lorempixel.com/200/250/city/', -6.76126, 33.87188, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(339, 'Rabat', 'leilaware@adornica.com', 'Adornica', 'http://lorempixel.com/200/250/city/', -6.77999, 33.84045, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(340, 'Rabat', 'leilaware@injoy.com', 'Injoy', 'http://lorempixel.com/200/250/city/', -6.76078, 33.86574, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(341, 'Rabat', 'leilaware@flexigen.com', 'Flexigen', 'http://lorempixel.com/200/250/city/', -6.74693, 33.83824, '2018-01-21 17:50:31', '2018-01-21 17:50:31'),
(342, 'Rabat', 'leilaware@gushkool.com', 'Gushkool', 'http://lorempixel.com/200/250/city/', -6.81134, 33.95564, '2018-01-21 17:50:31', '2018-01-21 17:50:31');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
