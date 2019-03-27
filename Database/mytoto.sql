-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 05 feb 2019 om 09:37
-- Serverversie: 10.1.30-MariaDB
-- PHP-versie: 7.2.1

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
(2, 'AEK Athene', 'Athene'),
(3, 'Heracles Almelo', 'Almelo'),
(4, 'De Graafschap', 'Doetinchem'),
(5, 'AZ', 'Alkmaar'),
(6, 'FC Groningen', 'Groningen'),
(7, 'FK Krasnodar', 'Krasnodar'),
(8, 'Sevilla', 'Sevilla'),
(9, 'FC Volendam', 'Volendam'),
(10, 'Almere City', 'Almere'),
(11, 'Sparta Rotterdam', 'Rotterdam'),
(12, 'Cambuur Leeuwarden', 'Cambuur'),
(13, 'Benfica', 'Lissabon'),
(14, 'Everton', 'Liverpool'),
(15, 'Brighton and Hove Albion', 'Brighton'),
(16, 'NEC', 'Nijmegen'),
(17, 'FC Oss', 'Oss'),
(18, 'Roda JC', 'Kerkrade'),
(19, 'PEC Zwolle', 'Zwolle'),
(20, 'Dinamo Zagreb', 'Zagreb'),
(21, 'Fenerbahçe', 'Istanboel'),
(22, 'PAOK', 'Thessaloniki'),
(23, 'Chelsea', 'London'),
(24, 'MVV', 'Maastricht'),
(25, 'FC Dordrecht', 'Dordrecht'),
(26, 'NAC Breda', 'Breda'),
(27, 'PSV', 'Eindhoven'),
(28, 'FC Emmen', 'Emmen'),
(29, 'FC Porto', 'Porto'),
(30, 'Galatasaray', 'Istanboel'),
(31, 'Vitesse', 'Arnhem'),
(32, 'Jong PSV', 'Eindhoven'),
(33, 'TSG Hoffenheim', 'Hoffenheim'),
(34, 'Olympique Lyon', 'Lyon'),
(35, 'FC Twente', 'Enschede'),
(36, 'Vv Noordwijk', 'Noordwijk'),
(37, 'Feyenoord', 'Rotterdam'),
(38, 'VVV-Venlo', 'Venlo'),
(39, 'Fortuna Sittard', 'Sittard'),
(40, 'ADO Den Haag', 'Den Haag'),
(41, 'Excelsior', 'Rotterdam'),
(42, 'Vorskla Poltava', 'Poltava'),
(43, 'Arsenal', 'London'),
(44, 'SC Heerenveen', 'Heerenveen'),
(45, 'Manchester City', 'Manchester'),
(46, 'Huddersfield Town', 'Huddersfield'),
(47, 'Willem II', 'Tilburg'),
(48, 'Go Ahead Eagles', 'Deventer'),
(49, 'FC Den Bosch', 'Den Bosch'),
(50, 'Borussia Mönchengladbach', 'Mönchengladback'),
(51, 'FC N?rnberg', 'Neurenberg'),
(52, 'Fortuna D?sseldorf', 'Düsseldorf'),
(53, 'Borussia Dortmund', 'Dortmund'),
(54, 'Watford', 'Londen'),
(55, 'Bournemouth', 'Bournemouth'),
(56, '', ''),
(57, 'RB Leipzig', 'Leipzig'),
(58, 'Tottenham Hotspur', 'London'),
(59, 'Fulham', 'London'),
(60, 'Hertha BSC', 'Berlin'),
(61, 'Schalke 04', 'Gelsenkirchen'),
(62, 'Wolverhampton Wanderers', 'Wolverhampton'),
(63, 'Manchester United', 'Manchester'),
(64, 'Leicester City', 'Leicester');

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
(1, 'UEFA Champions League'),
(2, 'Eredivisie'),
(3, 'UEFA Europa League'),
(4, 'Keuken Kampioen Divisie'),
(5, 'Premier League'),
(6, 'TOTO KNVB Beker'),
(7, 'Bundesliga');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_matches`
--

CREATE TABLE `tbl_matches` (
  `match_id` int(11) NOT NULL,
  `match_double_id` int(11) NOT NULL,
  `match_confirmation` bigint(11) NOT NULL,
  `match_home_id` int(11) NOT NULL,
  `match_away_id` int(11) NOT NULL,
  `match_date` date NOT NULL,
  `match_home_goals` int(11) NOT NULL,
  `match_away_goals` int(11) NOT NULL,
  `match_competition` int(11) NOT NULL,
  `match_prediction` int(11) NOT NULL,
  `match_type` int(11) NOT NULL,
  `match_status` int(11) NOT NULL,
  `match_quotation` decimal(10,2) NOT NULL,
  `match_effort` decimal(10,2) NOT NULL,
  `match_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `tbl_matches`
--

INSERT INTO `tbl_matches` (`match_id`, `match_double_id`, `match_confirmation`, `match_home_id`, `match_away_id`, `match_date`, `match_home_goals`, `match_away_goals`, `match_competition`, `match_prediction`, `match_type`, `match_status`, `match_quotation`, `match_effort`, `match_user`) VALUES
(1, 0, 183767490000125, 1, 2, '2018-09-19', 3, 0, 1, 1, 1, 1, '1.43', '1.00', 1),
(2, 0, 183791250000227, 3, 4, '2018-09-21', 4, 0, 2, 1, 1, 1, '1.58', '1.00', 1),
(3, 0, 183823380001328, 6, 5, '2018-09-23', 1, 3, 2, 2, 1, 1, '1.98', '1.00', 1),
(4, 0, 183979470001127, 7, 8, '2018-10-04', 2, 1, 3, 2, 1, 2, '2.10', '1.00', 1),
(5, 0, 184100330001024, 9, 10, '2018-10-12', 2, 2, 4, 2, 1, 2, '2.34', '1.00', 1),
(6, 0, 184125850000128, 11, 12, '2018-10-14', 3, 0, 4, 1, 1, 1, '1.53', '1.00', 1),
(7, 0, 184225170000527, 3, 6, '2018-10-21', 4, 1, 2, 1, 1, 1, '1.95', '1.00', 1),
(8, 0, 184241720000427, 1, 13, '2018-10-23', 1, 0, 1, 1, 1, 1, '1.97', '1.00', 1),
(9, 0, 184414170001324, 14, 15, '2018-11-03', 3, 1, 5, 1, 1, 1, '1.56', '1.00', 1),
(10, 0, 184631220000525, 16, 11, '2018-11-18', 1, 1, 4, 2, 1, 2, '2.49', '1.00', 1),
(15, 0, 184799960001324, 17, 18, '2018-11-30', 0, 5, 4, 1, 1, 2, '2.14', '1.00', 1),
(16, 0, 184810100000224, 4, 19, '2018-12-01', 0, 2, 2, 2, 1, 1, '1.88', '1.00', 1),
(34, 1, 184888600000228, 23, 45, '2018-12-08', 2, 0, 5, 2, 2, 2, '1.86', '1.00', 1),
(35, 1, 184888600000228, 43, 46, '2018-12-08', 1, 0, 5, 1, 2, 2, '1.26', '0.00', 1),
(36, 1, 185001610000524, 47, 40, '2018-12-14', 0, 3, 2, 5, 2, 2, '1.44', '1.88', 1),
(37, 1, 185001610000524, 48, 49, '2018-12-14', 0, 0, 4, 6, 2, 2, '1.60', '0.00', 1),
(38, 1, 185060670000324, 50, 51, '2018-12-18', 2, 0, 7, 1, 2, 2, '1.38', '2.00', 1),
(39, 1, 185060670000324, 52, 53, '2018-12-18', 2, 1, 7, 2, 2, 2, '1.48', '0.00', 1),
(40, 0, 185079430000827, 39, 12, '2018-12-19', 2, 1, 6, 6, 1, 1, '1.70', '2.00', 1),
(41, 0, 185176860002424, 54, 23, '2018-12-26', 1, 2, 5, 6, 1, 1, '1.70', '1.40', 1),
(42, 0, 190024910000624, 55, 54, '2019-01-02', 3, 3, 5, 6, 1, 1, '1.57', '1.38', 1),
(43, 0, 190180110000228, 14, 55, '2019-01-13', 2, 0, 5, 6, 1, 2, '1.65', '1.17', 1),
(44, 0, 190254220010024, 57, 53, '2019-01-19', 0, 1, 7, 6, 1, 2, '1.55', '1.50', 1),
(45, 0, 190280200000428, 59, 58, '2019-01-20', 1, 3, 5, 2, 1, 1, '1.71', '1.50', 1),
(46, 0, 190351140000223, 60, 61, '2019-01-25', 2, 2, 7, 6, 1, 1, '1.80', '1.26', 1),
(47, 0, 190468230000424, 14, 62, '2019-02-02', 1, 2, 5, 6, 1, 1, '1.75', '1.57', 1),
(48, 0, 190482650001526, 64, 63, '2019-02-03', 0, 1, 5, 6, 1, 3, '1.65', '1.50', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_menus`
--

CREATE TABLE `tbl_menus` (
  `mn_id` int(3) NOT NULL,
  `mn_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `mn_link` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `tbl_menus`
--

INSERT INTO `tbl_menus` (`mn_id`, `mn_name`, `mn_link`) VALUES
(1, 'My TOTO', 'selectUser.php'),
(2, 'Insert TOTO', 'insertToto.php'),
(3, 'Statistics', 'statistics.php');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_predictions`
--

CREATE TABLE `tbl_predictions` (
  `prediction_id` int(11) NOT NULL,
  `prediction` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `tbl_predictions`
--

INSERT INTO `tbl_predictions` (`prediction_id`, `prediction`) VALUES
(1, '1'),
(2, '2'),
(3, 'X'),
(4, '0-5'),
(5, 'Under 3.5'),
(6, 'BTTS');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_statuses`
--

CREATE TABLE `tbl_statuses` (
  `status_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `tbl_statuses`
--

INSERT INTO `tbl_statuses` (`status_id`, `status`) VALUES
(1, 'won'),
(2, 'lost'),
(3, 'open');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_types`
--

CREATE TABLE `tbl_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `tbl_types`
--

INSERT INTO `tbl_types` (`type_id`, `type_name`) VALUES
(1, 'single'),
(2, 'double'),
(3, 'treble'),
(4, 'fourfold');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_firstname`, `user_lastname`, `user_age`) VALUES
(1, 'Gerben', 'Logghe', 18),
(2, 'Sander', 'van Dam', 18),
(3, 'Thomas', 'van Sasse', 18);

--
-- Indexen voor geëxporteerde tabellen
--

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
-- Indexen voor tabel `tbl_matches`
--
ALTER TABLE `tbl_matches`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `match_user` (`match_user`),
  ADD KEY `match_type` (`match_type`),
  ADD KEY `match_prediction` (`match_prediction`),
  ADD KEY `match_home_id` (`match_home_id`),
  ADD KEY `match_away_id` (`match_away_id`),
  ADD KEY `match_quotation` (`match_quotation`),
  ADD KEY `match_competition` (`match_competition`),
  ADD KEY `match_status` (`match_status`);

--
-- Indexen voor tabel `tbl_menus`
--
ALTER TABLE `tbl_menus`
  ADD PRIMARY KEY (`mn_id`);

--
-- Indexen voor tabel `tbl_predictions`
--
ALTER TABLE `tbl_predictions`
  ADD PRIMARY KEY (`prediction_id`);

--
-- Indexen voor tabel `tbl_statuses`
--
ALTER TABLE `tbl_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexen voor tabel `tbl_types`
--
ALTER TABLE `tbl_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexen voor tabel `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `tbl_clubs`
--
ALTER TABLE `tbl_clubs`
  MODIFY `club_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT voor een tabel `tbl_competitions`
--
ALTER TABLE `tbl_competitions`
  MODIFY `competition_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `tbl_matches`
--
ALTER TABLE `tbl_matches`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT voor een tabel `tbl_menus`
--
ALTER TABLE `tbl_menus`
  MODIFY `mn_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `tbl_predictions`
--
ALTER TABLE `tbl_predictions`
  MODIFY `prediction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `tbl_statuses`
--
ALTER TABLE `tbl_statuses`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `tbl_types`
--
ALTER TABLE `tbl_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `tbl_matches`
--
ALTER TABLE `tbl_matches`
  ADD CONSTRAINT `tbl_matches_ibfk_1` FOREIGN KEY (`match_user`) REFERENCES `tbl_users` (`user_id`),
  ADD CONSTRAINT `tbl_matches_ibfk_2` FOREIGN KEY (`match_type`) REFERENCES `tbl_types` (`type_id`),
  ADD CONSTRAINT `tbl_matches_ibfk_4` FOREIGN KEY (`match_prediction`) REFERENCES `tbl_predictions` (`prediction_id`),
  ADD CONSTRAINT `tbl_matches_ibfk_5` FOREIGN KEY (`match_home_id`) REFERENCES `tbl_clubs` (`club_id`),
  ADD CONSTRAINT `tbl_matches_ibfk_6` FOREIGN KEY (`match_away_id`) REFERENCES `tbl_clubs` (`club_id`),
  ADD CONSTRAINT `tbl_matches_ibfk_8` FOREIGN KEY (`match_competition`) REFERENCES `tbl_competitions` (`competition_id`),
  ADD CONSTRAINT `tbl_matches_ibfk_9` FOREIGN KEY (`match_status`) REFERENCES `tbl_statuses` (`status_id`);

--
-- Beperkingen voor tabel `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD CONSTRAINT `tbl_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_matches` (`match_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
