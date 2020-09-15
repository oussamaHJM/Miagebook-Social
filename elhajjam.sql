-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u6
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 24 Avril 2020 à 11:13
-- Version du serveur :  5.5.62-0+deb8u1
-- Version de PHP :  5.6.40-0+deb8u7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `elhajjam`
--

-- --------------------------------------------------------

--
-- Structure de la table `COMMENTS`
--

CREATE TABLE IF NOT EXISTS `COMMENTS` (
`idComment` int(11) NOT NULL,
  `publishDate` datetime DEFAULT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE_STATUS` int(11) DEFAULT NULL,
  `CODE_WRITER` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `COMMENTS`
--

INSERT INTO `COMMENTS` (`idComment`, `publishDate`, `text`, `CODE_STATUS`, `CODE_WRITER`) VALUES
(1, '2020-04-23 23:37:21', 'hada awal commentaire', 1, 1),
(2, '2020-04-23 23:37:39', 'nta ya akhi wili bba', 1, 1),
(3, '2020-04-24 02:25:52', 'wlad l3abd ana jiit', 1, 4),
(4, '2020-04-24 02:26:16', 'sdvfsdvf', 1, 4),
(5, '2020-04-24 02:26:18', 'sdcsd', 1, 4),
(6, '2020-04-24 02:26:21', 'sdfcvsdvsdv', 1, 4),
(7, '2020-04-24 02:26:24', 'fhjk,fghj', 1, 4),
(8, '2020-04-24 03:13:36', 'ercervcefrv', 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `STATUS`
--

CREATE TABLE IF NOT EXISTS `STATUS` (
`ID_STATUS` int(11) NOT NULL,
  `publishDate` datetime DEFAULT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE_PUBLISHER` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `STATUS`
--

INSERT INTO `STATUS` (`ID_STATUS`, `publishDate`, `text`, `title`, `CODE_PUBLISHER`) VALUES
(1, '2020-04-23 23:37:01', 'ya wrahi m9awda ya bn 3ami', 'Ma premiere status', 1),
(2, '2020-04-24 03:01:54', 'iaediejda', 'ana howa hadak', 5),
(3, '2020-04-24 03:01:58', 'zedzedzed', 'zedze', 5),
(4, '2020-04-24 03:02:01', 'zdezedzed', 'zedzed', 5);

-- --------------------------------------------------------

--
-- Structure de la table `tbl_friends`
--

CREATE TABLE IF NOT EXISTS `tbl_friends` (
  `userId` int(11) NOT NULL,
  `friendId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `tbl_friends`
--

INSERT INTO `tbl_friends` (`userId`, `friendId`) VALUES
(1, 3),
(5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `USERS`
--

CREATE TABLE IF NOT EXISTS `USERS` (
`idUser` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isConnected` bit(1) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pseudo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `USERS`
--

INSERT INTO `USERS` (`idUser`, `email`, `isConnected`, `nom`, `password`, `prenom`, `pseudo`) VALUES
(1, 'oussama@gmail.com', b'0', 'EL-HAJJAM', '123', 'Oussama', 'oussama12'),
(2, 'o@gmail.com', b'0', 'EL-HAJJAM', '123', 'Omar', 'omar12'),
(3, 'b@gmail.com', b'0', 'EL-HAJJAM', '123', 'Bachir', 'bachir12'),
(4, 'b@gmail.com', b'1', 'EL-HAJJAM', '74wqSqsdDdSlmEGVPvPUrw==', 'Bachir', 'youssef11'),
(5, 'zpoiejd.azd@ezd.az', b'0', 'Elj', 'cZCpxzmEdiPK9GVSepbUiQ==', 'oka', 'oula'),
(6, 'oussama@ldazd', b'0', 'EL-HAJJAM', '74wqSqsdDdSlmEGVPvPUrw==', 'Oussama', 'oussama15');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `COMMENTS`
--
ALTER TABLE `COMMENTS`
 ADD PRIMARY KEY (`idComment`), ADD KEY `FKi1vu3n624vtreuxfe5wjtfdkd` (`CODE_STATUS`), ADD KEY `FKs65lwqgbrimqfrpalx4ooqqoe` (`CODE_WRITER`);

--
-- Index pour la table `STATUS`
--
ALTER TABLE `STATUS`
 ADD PRIMARY KEY (`ID_STATUS`), ADD KEY `FKrrjxfc9j6k9vrgsf1x1lncj13` (`CODE_PUBLISHER`);

--
-- Index pour la table `tbl_friends`
--
ALTER TABLE `tbl_friends`
 ADD KEY `FKbpjehadfhv7bavw47euar262l` (`friendId`), ADD KEY `FKpnu999n8o6axhjysyhhjpip9x` (`userId`);

--
-- Index pour la table `USERS`
--
ALTER TABLE `USERS`
 ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `COMMENTS`
--
ALTER TABLE `COMMENTS`
MODIFY `idComment` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `STATUS`
--
ALTER TABLE `STATUS`
MODIFY `ID_STATUS` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `USERS`
--
ALTER TABLE `USERS`
MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
