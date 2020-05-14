-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 29 mai 2019 à 19:02
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `forum`
--

-- --------------------------------------------------------

--
-- Structure de la table `answer`
--

CREATE TABLE `answer` (
  `id` int(5) NOT NULL,
  `id_post` int(5) NOT NULL,
  `id_user` int(5) NOT NULL,
  `description` longtext NOT NULL,
  `date_answ` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `answer`
--

INSERT INTO `answer` (`id`, `id_post`, `id_user`, `description`, `date_answ`) VALUES
(129, 1, 1, 'wtf\r\n', '2019-05-29 06:00:03'),
(130, 2, 1, 'wtf', '2019-05-29 06:00:03'),
(131, 2, 1, 'wtf', '2019-05-29 06:01:07'),
(132, 1, 1, 'zzzzzzzzzzzzzzzzz', '2019-05-29 06:01:07'),
(133, 1, 1, 'zzzzzzzzzzzzzzzzz', '2019-05-29 06:05:52'),
(134, 2, 6, 'tef', '2019-05-29 06:07:04'),
(135, 2, 6, 'tef', '2019-05-29 06:18:13'),
(136, 2, 6, 'tef', '2019-05-29 06:21:09'),
(137, 2, 6, 'tef', '2019-05-29 06:21:29'),
(138, 1, 6, 'ed', '2019-05-29 06:21:29'),
(139, 1, 6, 'ed', '2019-05-29 06:21:59'),
(140, 2, 6, 'edf', '2019-05-29 06:21:59'),
(141, 1, 6, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod', '2019-05-29 06:23:32'),
(142, 1, 6, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod', '2019-05-29 06:30:39'),
(143, 1, 6, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod', '2019-05-29 06:31:01'),
(144, 4, 4, 'Lorem ipsum dolor sit amet', '2019-05-29 06:42:19'),
(145, 4, 5, 'Ut enim ad minim veniam', '2019-05-29 06:43:12'),
(146, 5, 6, 'ipsum dolor sit amet, consectetur adipisicing elit', '2019-05-29 06:46:28'),
(147, 5, 6, 'ipsum dolor sit amet, consectetur adipisicing elit', '2019-05-29 06:48:59'),
(148, 3, 6, 'commodo', '2019-05-29 06:48:59'),
(149, 3, 6, 'commodo', '2019-05-29 06:53:34'),
(150, 3, 6, 'commodo', '2019-05-29 06:54:05');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int(5) NOT NULL,
  `id_user` int(5) NOT NULL,
  `title` text NOT NULL,
  `tag` text NOT NULL,
  `description` longtext,
  `image` text NOT NULL,
  `date_post` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `id_user`, `title`, `tag`, `description`, `image`, `date_post`) VALUES
(1, 1, 'speed of light', 'speed', 'what is the speed of light?', '', '2019-05-28 11:24:32'),
(2, 1, 'jQuery', 'jquery', 'what is the definition of jQuery?', '', '2019-05-28 21:06:28'),
(3, 1, 'zzzzzzzzzzz', 'a', 'aaaaaaaaaaaaaaaaaaaaaa', '', '2019-05-28 21:41:13'),
(4, 6, 'test', 'lorem ipsum', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo', '', '2019-05-29 06:23:08'),
(5, 5, 'test', 'veniam', 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo?', '', '2019-05-29 06:45:02');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `matricule` text NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `matricule`, `name`, `email`, `password`) VALUES
(1, 'ce18', 'yonga edouard', 'ededwardyonga@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(2, 'ce34', 'awa', 'eddyonga@gmail.com', 'f4542db9ba30f7958ae42c113dd87ad21fb2eddb'),
(3, 'asd23', 'debain', 'eddyonga@gmail.com', 'f4542db9ba30f7958ae42c113dd87ad21fb2eddb'),
(4, 'sdhjlask', 'sara', 'sara@gmail.com', '601f1889667efaebb33b8c12572835da3f027f78'),
(5, 'dbz23', 'brice', 'brice@gmail.com', '601f1889667efaebb33b8c12572835da3f027f78'),
(6, 'ce90', 'liam', 'liam@gmail.com', '601f1889667efaebb33b8c12572835da3f027f78');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
