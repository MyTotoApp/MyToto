-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 26 okt 2018 om 10:27
-- Serverversie: 10.1.35-MariaDB
-- PHP-versie: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mytoto`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_bet`
--

CREATE TABLE `tbl_bet` (
  `bet_id` int(11) NOT NULL,
  `bet_effort` double(10,2) NOT NULL,
  `bet_quotation` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_clubs`
--

CREATE TABLE `tbl_clubs` (
  `club_id` int(11) NOT NULL,
  `club_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `club_city` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `tbl_clubs`
--

INSERT INTO `tbl_clubs` (`club_id`, `club_name`, `club_city`) VALUES
(1, 'Ajax', 'Amsterdam'),
(2, 'PSV', 'Eindhoven'),
(3, 'Feyenoord', 'Rotterdam'),
(4, 'Vitesse', 'Arnhem'),
(5, 'FC Barcelona', 'Barcelona'),
(6, 'Real Madrid', 'Madrid');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_competitions`
--

CREATE TABLE `tbl_competitions` (
  `competition_id` int(11) NOT NULL,
  `competition_name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `tbl_competitions`
--

INSERT INTO `tbl_competitions` (`competition_id`, `competition_name`) VALUES
(1, 'Eredivisie'),
(2, 'Champions League'),
(3, 'La Liga');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_match`
--

CREATE TABLE `tbl_match` (
  `match_id` int(11) NOT NULL,
  `match_home_id` int(11) NOT NULL,
  `match_away_id` int(11) NOT NULL,
  `match_date` date NOT NULL,
  `match_home_goals` int(11) NOT NULL,
  `match_away_goals` int(11) NOT NULL,
  `match_competition` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `tbl_match`
--

INSERT INTO `tbl_match` (`match_id`, `match_home_id`, `match_away_id`, `match_date`, `match_home_goals`, `match_away_goals`, `match_competition`) VALUES
(1, 1, 2, '2018-10-07', 3, 0, '1'),
(2, 3, 2, '2018-10-06', 2, 1, '1'),
(3, 4, 1, '2018-10-07', 2, 2, '1'),
(4, 5, 6, '2018-10-13', 4, 1, '3');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `mn_id` int(3) NOT NULL,
  `mn_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `mn_link` varchar(100) CHARACTER SET utf8 NOT NULL,
  `mn_week` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `tbl_menu`
--

INSERT INTO `tbl_menu` (`mn_id`, `mn_name`, `mn_link`, `mn_week`) VALUES
(1, 'Begin', 'myToto.php', 0),
(3, 'Invoer', 'myToto.php', 0);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `tbl_bet`
--
ALTER TABLE `tbl_bet`
  ADD PRIMARY KEY (`bet_id`);

--
-- Indexen voor tabel `tbl_clubs`
--
ALTER TABLE `tbl_clubs`
  ADD PRIMARY KEY (`club_id`);

--
-- Indexen voor tabel `tbl_competitions`
--
ALTER TABLE `tbl_competitions`
  ADD PRIMARY KEY (`competition_id`);

--
-- Indexen voor tabel `tbl_match`
--
ALTER TABLE `tbl_match`
  ADD PRIMARY KEY (`match_id`);

--
-- Indexen voor tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`mn_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `tbl_bet`
--
ALTER TABLE `tbl_bet`
  MODIFY `bet_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `tbl_clubs`
--
ALTER TABLE `tbl_clubs`
  MODIFY `club_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `tbl_competitions`
--
ALTER TABLE `tbl_competitions`
  MODIFY `competition_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `tbl_match`
--
ALTER TABLE `tbl_match`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `mn_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
