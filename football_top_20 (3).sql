-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 03. úno 2025, 21:01
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `football_top 20`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `cities`
--

INSERT INTO `cities` (`city_id`, `name`) VALUES
(1, 'Manchester'),
(2, 'London'),
(3, 'Barcelona'),
(4, 'Madrid'),
(5, 'Munich'),
(6, 'Dortmund'),
(7, 'Leipzig'),
(8, 'Leverkusen'),
(9, 'Paris'),
(10, 'Milan'),
(11, 'Naples'),
(12, 'Turin'),
(13, 'Lisbon');

-- --------------------------------------------------------

--
-- Struktura tabulky `clubs`
--

CREATE TABLE `clubs` (
  `club_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `league_id` int(11) NOT NULL,
  `stadium_id` int(11) NOT NULL,
  `foundation_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `clubs`
--

INSERT INTO `clubs` (`club_id`, `name`, `league_id`, `stadium_id`, `foundation_date`) VALUES
(1, 'Manchester City', 1, 1, '1880-04-16'),
(2, 'Manchester United', 1, 2, '1878-03-05'),
(3, 'West Ham United', 1, 3, '1895-06-29'),
(4, 'Liverpool', 1, 4, '1892-06-03'),
(5, 'Arsenal', 1, 5, '1886-12-01'),
(6, 'Chelsea', 1, 6, '1905-03-10'),
(7, 'Barcelona', 2, 7, '1899-11-29'),
(8, 'Real Madrid', 2, 8, '1902-03-06'),
(9, 'Tottenham Hotspur', 1, 9, '1882-09-05'),
(10, 'Bayern Munich', 3, 10, '1900-02-27'),
(11, 'Borussia Dortmund', 3, 11, '1909-12-19'),
(12, 'RB Leipzig', 3, 12, '2009-05-19'),
(13, 'Bayer Leverkusen', 3, 13, '1904-07-01'),
(14, 'Paris Saint-Germain', 4, 14, '1970-08-12'),
(15, 'AC Milan', 5, 15, '1899-12-16'),
(16, 'Inter Milan', 5, 15, '1908-03-09'),
(17, 'Napoli', 5, 16, '1926-08-01'),
(18, 'Juventus', 5, 17, '1897-11-01'),
(19, 'Atletico Madrid', 2, 8, '1903-04-26'),
(20, 'Benfica', 6, 18, '1904-02-28');

-- --------------------------------------------------------

--
-- Struktura tabulky `leagues`
--

CREATE TABLE `leagues` (
  `league_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `foundation_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `leagues`
--

INSERT INTO `leagues` (`league_id`, `name`, `country`, `foundation_date`) VALUES
(1, 'Premier League', 'England', '1992-02-20'),
(2, 'La Liga', 'Spain', '1929-02-10'),
(3, 'Bundesliga', 'Germany', '1963-07-24'),
(4, 'Ligue 1', 'France', '1932-09-11'),
(5, 'Serie A', 'Italy', '1898-03-08'),
(6, 'Primeira Liga', 'Portugal', NULL);

-- --------------------------------------------------------

--
-- Zástupná struktura pro pohled `mancity`
-- (Vlastní pohled viz níže)
--
CREATE TABLE `mancity` (
`first_name` varchar(100)
,`last_name` varchar(100)
,`club_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Struktura tabulky `nations`
--

CREATE TABLE `nations` (
  `nation_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `nations`
--

INSERT INTO `nations` (`nation_id`, `name`) VALUES
(1, 'Brazil'),
(2, 'England'),
(3, 'Portugal'),
(4, 'Switzerland'),
(5, 'Croatia'),
(6, 'Spain'),
(7, 'Belgium'),
(8, 'Argentina'),
(9, 'Netherlands'),
(10, 'France'),
(11, 'Germany'),
(12, 'Italy'),
(13, 'Uruguay'),
(14, 'Cameroon'),
(15, 'Japan'),
(16, 'Ghana'),
(17, 'Jamaica'),
(18, 'Colombia'),
(19, 'Norway'),
(20, 'Scotland'),
(21, 'Wales'),
(22, 'USA'),
(23, 'Slovenia'),
(24, 'Hungary'),
(25, 'Mali'),
(26, 'Ecuador'),
(27, 'Turkey'),
(28, 'Morocco'),
(29, 'Denmark'),
(30, 'Austria'),
(31, 'South Korea'),
(32, 'Poland'),
(33, 'Serbia'),
(34, 'Czech Republic'),
(35, 'Finland'),
(36, 'Romania'),
(37, 'Kosovo'),
(38, 'Slovakia'),
(39, 'Sweden'),
(40, 'Georgia');

-- --------------------------------------------------------

--
-- Struktura tabulky `players`
--

CREATE TABLE `players` (
  `player_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `position_id` int(11) NOT NULL,
  `nation_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  `shirt_number` int(11) DEFAULT NULL,
  `right_footed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `players`
--

INSERT INTO `players` (`player_id`, `first_name`, `last_name`, `birth_date`, `position_id`, `nation_id`, `club_id`, `shirt_number`, `right_footed`) VALUES
(1, 'Ederson', 'Santana de Moraes', '1993-08-17', 1, 1, 1, 31, 0),
(2, 'Kyle', 'Walker', '1990-05-28', 2, 2, 1, 2, 1),
(3, 'Rúben', 'Dias', '1997-05-14', 2, 3, 1, 3, 1),
(4, 'Manuel', 'Akanji', '1995-07-19', 2, 4, 1, 25, 1),
(5, 'Joško', 'Gvardiol', '2002-01-23', 2, 5, 1, 24, 0),
(6, 'Rodrigo', 'Hernández', '1996-06-22', 3, 6, 1, 16, 1),
(7, 'Kevin', 'De Bruyne', '1991-06-28', 3, 7, 1, 17, 1),
(8, 'Bernardo', 'Silva', '1994-08-10', 3, 3, 1, 20, 0),
(9, 'Phil', 'Foden', '2000-05-28', 3, 2, 1, 47, 0),
(10, 'Jack', 'Grealish', '1995-09-10', 3, 2, 1, 10, 1),
(11, 'Erling', 'Haaland', '2000-07-21', 4, 10, 1, 9, 0),
(12, 'Andre', 'Onana', '1996-04-02', 1, 13, 2, 24, 1),
(13, 'Aaron', 'Wan-Bissaka', '1997-11-26', 2, 2, 2, 29, 1),
(14, 'Raphaël', 'Varane', '1993-04-25', 2, 9, 2, 19, 1),
(15, 'Lisandro', 'Martínez', '1998-01-18', 2, 7, 2, 6, 0),
(16, 'Diogo', 'Dalot', '1999-03-18', 2, 3, 2, 20, 1),
(17, 'Kobbie', 'Mainoo', '2005-04-19', 3, 2, 2, 37, 1),
(18, 'Sofyan', 'Amrabat', '1996-08-21', 3, 27, 2, 4, 1),
(19, 'Alejandro', 'Garnacho', '2004-07-01', 4, 7, 2, 17, 1),
(20, 'Marcus', 'Rashford', '1997-10-31', 4, 2, 2, 10, 1),
(21, 'Bruno', 'Fernandes', '1994-09-08', 3, 3, 2, 8, 1),
(22, 'Scott', 'McTominay', '1996-12-08', 3, 19, 2, 39, 1),
(23, 'Alphonse', 'Areola', '1993-02-27', 1, 9, 3, 23, 1),
(24, 'Kurt', 'Zouma', '1994-10-27', 2, 9, 3, 4, 1),
(25, 'Konstantinos', 'Mavropanos', '1997-12-11', 2, 13, 3, 15, 1),
(26, 'Aaron', 'Cresswell', '1989-12-15', 2, 2, 3, 3, 0),
(27, 'Vladimír', 'Coufal', '1992-08-22', 2, 33, 3, 5, 1),
(28, 'Tomáš', 'Souček', '1995-02-27', 3, 33, 3, 28, 1),
(29, 'James', 'Ward-Prowse', '1994-11-01', 3, 2, 3, 7, 1),
(30, 'Emerson', 'Palmieri', '1994-08-03', 2, 6, 3, 33, 0),
(31, 'Mohammed', 'Kudus', '2000-08-02', 3, 16, 3, 14, 0),
(32, 'Michail', 'Antonio', '1990-03-28', 4, 17, 3, 9, 1),
(33, 'Lucas', 'Paquetá', '1997-08-27', 3, 1, 3, 10, 0),
(34, 'Alisson', 'Becker', '1992-10-02', 1, 1, 4, 1, 1),
(35, 'Trent', 'Alexander-Arnold', '1998-10-07', 2, 2, 4, 66, 1),
(36, 'Jarell', 'Quansah', '2003-01-29', 2, 2, 4, 78, 1),
(37, 'Virgil', 'van Dijk', '1991-07-08', 2, 9, 4, 4, 1),
(38, 'Andrew', 'Robertson', '1994-03-11', 2, 19, 4, 26, 0),
(39, 'Alexis', 'Mac Allister', '1998-12-24', 3, 7, 4, 10, 1),
(40, 'Wataru', 'Endo', '1993-02-09', 3, 15, 4, 3, 1),
(41, 'Ryan', 'Gravenberch', '2002-05-16', 3, 9, 4, 38, 1),
(42, 'Harvey', 'Elliott', '2003-04-04', 3, 2, 4, 19, 0),
(43, 'Cody', 'Gakpo', '1999-05-07', 4, 9, 4, 18, 1),
(44, 'Luis', 'Díaz', '1997-01-13', 4, 17, 4, 7, 1),
(45, 'Ben', 'White', '1997-10-08', 2, 2, 5, 4, 1),
(46, 'William', 'Saliba', '2001-03-24', 2, 9, 5, 2, 1),
(47, 'Gabriel', 'Magalhães', '1997-12-19', 2, 1, 5, 6, 0),
(48, 'Takehiro', 'Tomiyasu', '1998-11-05', 2, 15, 5, 18, 1),
(49, 'Martin', 'Ødegaard', '1998-12-17', 3, 18, 5, 8, 0),
(50, 'Thomas', 'Partey', '1993-06-13', 3, 16, 5, 5, 1),
(51, 'Declan', 'Rice', '1999-01-14', 3, 2, 5, 41, 1),
(52, 'Bukayo', 'Saka', '2001-09-05', 4, 2, 5, 7, 0),
(53, 'Kai', 'Havertz', '1999-06-11', 4, 9, 5, 29, 0),
(54, 'Leandro', 'Trossard', '1994-12-04', 4, 7, 5, 19, 1),
(55, 'David', 'Raya', '1995-09-15', 1, 6, 5, 22, 1),
(56, 'Djorde', 'Petrović', '1999-10-08', 1, 33, 5, 28, 1),
(57, 'Alfie', 'Gilchrist', '2003-05-27', 2, 2, 6, 42, 1),
(58, 'Axel', 'Disasi', '1998-03-11', 2, 9, 6, 2, 1),
(59, 'Benoît', 'Badiashile', '2001-03-26', 2, 9, 6, 5, 0),
(60, 'Marc', 'Cucurella', '1998-07-22', 2, 6, 6, 3, 0),
(61, 'Enzo', 'Fernández', '2001-01-17', 3, 7, 6, 8, 1),
(62, 'Moisés', 'Caicedo', '2001-11-02', 3, 26, 6, 25, 1),
(63, 'Noni', 'Madueke', '2002-03-10', 4, 2, 6, 11, 0),
(64, 'Conor', 'Gallagher', '2000-02-06', 3, 2, 6, 23, 1),
(65, 'Mykhailo', 'Mudryk', '2001-01-05', 4, 27, 6, 10, 0),
(66, 'Nicolas', 'Jackson', '2001-06-20', 4, 26, 6, 15, 1),
(67, 'Marc-André', 'ter Stegen', '1992-04-30', 1, 9, 7, 1, 1),
(68, 'Jules', 'Koundé', '1998-11-12', 2, 9, 7, 23, 1),
(69, 'Ronald', 'Araújo', '1999-03-07', 2, 7, 7, 4, 1),
(70, 'Pau', 'Cubarsí', '2005-05-12', 2, 7, 7, 33, 1),
(71, 'João', 'Cancelo', '1994-05-27', 2, 9, 7, 2, 1),
(72, 'Sergi', 'Roberto', '1992-02-07', 3, 7, 7, 20, 1),
(73, 'Andreas', 'Christensen', '1996-04-10', 2, 15, 7, 15, 1),
(74, 'İlkay', 'Gündoğan', '1990-10-24', 3, 9, 7, 22, 1),
(75, 'Lamine', 'Yamal', '2007-07-13', 4, 7, 7, 27, 0),
(76, 'Robert', 'Lewandowski', '1988-08-21', 4, 18, 7, 9, 1),
(77, 'Andriy', 'Lunin', '1999-02-11', 1, 27, 8, 13, 1),
(78, 'Lucas', 'Vázquez', '1991-07-01', 2, 7, 8, 17, 1),
(79, 'Aurélien', 'Tchouaméni', '2000-01-27', 3, 9, 8, 18, 1),
(80, 'Antonio', 'Rüdiger', '1993-03-03', 2, 9, 8, 22, 1),
(81, 'Eduardo', 'Camavinga', '2002-11-10', 3, 9, 8, 12, 0),
(82, 'Federico', 'Valverde', '1998-07-22', 3, 13, 8, 15, 1),
(83, 'Toni', 'Kroos', '1990-01-04', 3, 9, 8, 8, 1),
(84, 'Luka', 'Modrić', '1985-09-09', 3, 7, 8, 10, 1),
(85, 'Jude', 'Bellingham', '2003-06-29', 3, 2, 8, 5, 1),
(86, 'Rodrygo', 'Goes', '2001-01-09', 4, 1, 8, 11, 1),
(87, 'Vinícius', 'Júnior', '2000-07-12', 4, 1, 8, 7, 1),
(88, 'Guglielmo', 'Vicario', '1996-10-07', 1, 7, 9, 13, 1),
(89, 'Pedro', 'Porro', '1999-09-13', 2, 7, 9, 23, 1),
(90, 'Cristian', 'Romero', '1998-04-27', 2, 7, 9, 17, 1),
(91, 'Radu', 'Drăgușin', '2002-02-03', 2, 35, 9, 6, 1),
(92, 'Micky', 'van de Ven', '2001-04-19', 2, 9, 9, 37, 0),
(93, 'Rodrigo', 'Bentancur', '1997-06-25', 3, 13, 9, 30, 1),
(94, 'Pierre-Emile', 'Højbjerg', '1995-08-05', 3, 25, 9, 5, 1),
(95, 'Pape', 'Matar Sarr', '2002-09-14', 3, 15, 9, 29, 1),
(96, 'Brennan', 'Johnson', '2001-05-23', 4, 19, 9, 22, 1),
(97, 'Son', 'Heung-Min', '1992-07-08', 4, 31, 9, 7, 0),
(98, 'James', 'Maddison', '1996-11-23', 3, 2, 9, 10, 1),
(99, 'Manuel', 'Neuer', '1986-03-27', 1, 9, 10, 1, 1),
(100, 'Joshua', 'Kimmich', '1995-02-08', 3, 9, 10, 6, 1),
(101, 'Eric', 'Dier', '1994-01-15', 2, 2, 10, 15, 1),
(102, 'Kim', 'Min-Jae', '1996-11-15', 2, 15, 10, 3, 1),
(103, 'Noussair', 'Mazraoui', '1997-11-14', 2, 27, 10, 40, 1),
(104, 'Konrad', 'Laimer', '1997-05-27', 3, 14, 10, 27, 1),
(105, 'Leon', 'Goretzka', '1995-02-06', 3, 9, 10, 8, 1),
(106, 'Leroy', 'Sané', '1996-01-11', 4, 9, 10, 10, 0),
(107, 'Thomas', 'Müller', '1989-09-13', 4, 9, 10, 25, 1),
(108, 'Jamal', 'Musiala', '2003-02-26', 3, 14, 10, 42, 1),
(109, 'Harry', 'Kane', '1993-07-28', 4, 2, 10, 9, 1),
(110, 'Gregor', 'Kobel', '1997-12-06', 1, 14, 11, 1, 1),
(111, 'Julian', 'Ryerson', '1997-11-17', 2, 14, 11, 26, 1),
(112, 'Mats', 'Hummels', '1988-12-16', 2, 9, 11, 15, 1),
(113, 'Nico', 'Schlotterbeck', '1999-12-01', 2, 9, 11, 4, 0),
(114, 'Ian', 'Maatsen', '2002-03-10', 2, 9, 11, 22, 0),
(115, 'Emre', 'Can', '1994-01-12', 3, 9, 11, 23, 1),
(116, 'Marcel', 'Sabitzer', '1994-03-17', 3, 14, 11, 20, 1),
(117, 'Jadon', 'Sancho', '2000-03-25', 4, 2, 11, 10, 1),
(118, 'Julian', 'Brandt', '1996-05-02', 3, 9, 11, 19, 1),
(119, 'Karim', 'Adeyemi', '2002-01-18', 4, 14, 11, 27, 0),
(120, 'Niclas', 'Füllkrug', '1993-02-09', 4, 2, 11, 14, 1),
(121, 'Peter', 'Gulácsi', '1990-05-06', 1, 25, 12, 1, 1),
(122, 'Mohamed', 'Simakan', '2000-05-03', 2, 9, 12, 2, 1),
(123, 'Willi', 'Orban', '1992-11-03', 2, 25, 12, 4, 1),
(124, 'Castello', 'Lukeba', '2002-12-17', 2, 9, 12, 23, 0),
(125, 'David', 'Raum', '1998-04-22', 2, 9, 12, 22, 0),
(126, 'Dani', 'Olmo', '1998-05-07', 3, 9, 12, 7, 1),
(127, 'Amadou', 'Haidara', '1998-01-31', 3, 24, 12, 8, 1),
(128, 'Xaver', 'Schlager', '1997-09-28', 3, 14, 12, 24, 0),
(129, 'Xavi', 'Simons', '2003-04-21', 3, 9, 12, 20, 1),
(130, 'Loïs', 'Openda', '2000-02-16', 4, 26, 12, 17, 1),
(131, 'Benjamin', 'Šeško', '2003-05-31', 4, 35, 12, 30, 0),
(132, 'Lukáš', 'Hrádecký', '1989-11-24', 1, 31, 13, 1, 1),
(133, 'Edmond', 'Tapsoba', '1999-02-02', 2, 15, 13, 12, 1),
(134, 'Jonathan', 'Tah', '1996-02-11', 2, 9, 13, 4, 1),
(135, 'Piero', 'Hincapié', '2002-01-09', 2, 26, 13, 3, 0),
(136, 'Josip', 'Stanišić', '2000-04-02', 2, 25, 13, 2, 1),
(137, 'Granit', 'Xhaka', '1992-09-27', 3, 31, 13, 34, 0),
(138, 'Robert', 'Andrich', '1994-09-22', 3, 9, 13, 8, 1),
(139, 'Alejandro', 'Grimaldo', '1995-09-20', 2, 7, 13, 20, 0),
(140, 'Jeremie', 'Frimpong', '2000-12-10', 2, 9, 13, 30, 1),
(141, 'Patrik', 'Schick', '1996-01-24', 4, 33, 13, 14, 0),
(142, 'Florian', 'Wirtz', '2003-05-03', 3, 9, 13, 10, 1),
(143, 'Gianluigi', 'Donnarumma', '1999-02-25', 1, 7, 14, 99, 1),
(144, 'Achraf', 'Hakimi', '1998-11-04', 2, 27, 14, 2, 1),
(145, 'Marquinhos', 'Corrêa', '1994-05-14', 2, 1, 14, 5, 1),
(146, 'Lucas', 'Beraldo', '2002-06-24', 2, 1, 14, 35, 0),
(147, 'Nuno', 'Mendes', '2002-06-19', 2, 6, 14, 25, 0),
(148, 'Warren', 'Zaire-Emery', '2006-03-08', 3, 7, 14, 33, 1),
(149, 'Vitinha', 'Ferreira', '2000-02-13', 3, 6, 14, 17, 1),
(150, 'Fabian', 'Ruiz', '1996-04-03', 3, 7, 14, 8, 0),
(151, 'Ousmane', 'Dembélé', '1997-05-15', 4, 9, 14, 10, 0),
(152, 'Gonçalo', 'Ramos', '2001-06-20', 4, 6, 14, 9, 1),
(153, 'Kylian', 'Mbappé', '1998-12-20', 4, 9, 14, 7, 1),
(154, 'Mike', 'Maignan', '1995-07-03', 1, 9, 15, 16, 1),
(155, 'Davide', 'Calabria', '1996-12-06', 2, 7, 15, 2, 1),
(156, 'Fikayo', 'Tomori', '1997-12-19', 2, 2, 15, 23, 1),
(157, 'Matteo', 'Gabbia', '1999-10-21', 2, 7, 15, 46, 1),
(158, 'Theo', 'Hernández', '1997-10-06', 2, 9, 15, 19, 0),
(159, 'Yacine', 'Adli', '2000-07-29', 3, 9, 15, 7, 1),
(160, 'Tijjani', 'Reijnders', '1998-07-29', 3, 14, 15, 14, 1),
(161, 'Yunus', 'Musah', '2002-11-29', 3, 22, 15, 80, 1),
(162, 'Ruben', 'Loftus-Cheek', '1996-01-23', 3, 2, 15, 8, 1),
(163, 'Christian', 'Pulisic', '1998-09-18', 4, 22, 15, 11, 1),
(164, 'Rafael', 'Leão', '1999-06-10', 4, 6, 15, 10, 1),
(165, 'Yann', 'Sommer', '1988-12-17', 1, 25, 16, 1, 1),
(166, 'Benjamin', 'Pavard', '1996-03-28', 2, 9, 16, 28, 1),
(167, 'Francesco', 'Acerbi', '1988-02-10', 2, 9, 16, 15, 0),
(168, 'Alessandro', 'Bastoni', '1999-04-13', 2, 9, 16, 95, 0),
(169, 'Matteo', 'Darmian', '1989-12-02', 2, 9, 16, 36, 1),
(170, 'Nicolò', 'Barella', '1997-02-07', 3, 9, 16, 23, 1),
(171, 'Hakan', 'Çalhanoğlu', '1994-02-08', 3, 26, 16, 20, 1),
(172, 'Henrikh', 'Mkhitaryan', '1989-01-21', 3, 24, 16, 22, 1),
(173, 'Federico', 'Dimarco', '1997-11-10', 2, 9, 16, 32, 0),
(174, 'Marcus', 'Thuram', '1997-08-06', 4, 9, 16, 9, 1),
(175, 'Lautaro', 'Martínez', '1997-08-22', 4, 7, 16, 10, 1),
(176, 'Alex', 'Meret', '1997-03-22', 1, 9, 17, 1, 1),
(177, 'Giovanni', 'Di Lorenzo', '1993-08-04', 2, 9, 17, 22, 1),
(178, 'Amir', 'Rrahmani', '1994-02-24', 2, 33, 17, 13, 1),
(179, 'Juan', 'Jesus', '1991-06-10', 2, 1, 17, 5, 0),
(180, 'Mathías', 'Olivera', '1997-10-31', 2, 33, 17, 17, 0),
(181, 'André-Frank', 'Zambo Anguissa', '1995-11-16', 3, 13, 17, 99, 1),
(182, 'Stanislav', 'Lobotka', '1994-11-25', 3, 27, 17, 68, 1),
(183, 'Jens', 'Cajuste', '1999-08-10', 3, 2, 17, 8, 1),
(184, 'Matteo', 'Politano', '1993-08-03', 4, 9, 17, 21, 0),
(185, 'Giacomo', 'Raspadori', '2000-02-18', 4, 9, 17, 81, 1),
(186, 'Khvicha', 'Kvaratskhelia', '2001-02-12', 4, 37, 17, 77, 1),
(187, 'Wojciech', 'Szczesny', '1990-04-18', 1, 33, 18, 1, 1),
(188, 'Federico', 'Gatti', '1998-06-24', 2, 9, 18, 4, 1),
(189, 'Gleison', 'Bremer', '1997-03-18', 2, 1, 18, 3, 1),
(190, 'Danilo', 'Luiz da Silva', '1991-07-15', 2, 1, 18, 6, 1),
(191, 'Timothy', 'Weah', '2000-02-22', 4, 36, 18, 22, 1),
(192, 'Andrea', 'Cambiaso', '2000-02-20', 2, 33, 18, 27, 1),
(193, 'Manuel', 'Locatelli', '1998-01-08', 3, 9, 18, 5, 1),
(194, 'Adrien', 'Rabiot', '1995-04-03', 3, 9, 18, 25, 0),
(195, 'Filip', 'Kostić', '1992-11-01', 3, 27, 18, 11, 0),
(196, 'Dušan', 'Vlahović', '2000-01-28', 4, 27, 18, 9, 0),
(197, 'Kenan', 'Yıldız', '2005-05-04', 4, 36, 18, 15, 0),
(198, 'Jan', 'Oblak', '1993-01-07', 1, 24, 19, 13, 1),
(199, 'Nahuel', 'Molina', '1998-04-06', 2, 7, 19, 16, 1),
(200, 'Axel', 'Witsel', '1989-01-12', 3, 9, 19, 20, 1),
(201, 'José María', 'Giménez', '1995-01-20', 2, 13, 19, 2, 1),
(202, 'Mario', 'Hermoso', '1995-06-18', 2, 7, 19, 22, 0),
(203, 'César', 'Azpilicueta', '1989-08-28', 2, 7, 19, 3, 1),
(204, 'Marcos', 'Llorente', '1995-01-30', 3, 7, 19, 14, 1),
(205, 'Koke', 'Resurrección', '1992-01-08', 3, 7, 19, 6, 1),
(206, 'Rodrigo', 'de Paul', '1994-05-24', 3, 7, 19, 5, 1),
(207, 'Álvaro', 'Morata', '1992-10-23', 4, 7, 19, 19, 1),
(208, 'Antoine', 'Griezmann', '1991-03-21', 4, 9, 19, 7, 0),
(209, 'Anatoliy', 'Trubin', '2001-08-01', 1, 36, 20, 1, 1),
(210, 'Alexander', 'Bah', '1997-12-09', 2, 14, 20, 6, 1),
(211, 'Nicolás', 'Otamendi', '1988-02-12', 2, 7, 20, 30, 1),
(212, 'Antonio', 'Silva', '2003-10-31', 2, 26, 20, 4, 1),
(213, 'Fredrik', 'Aursnes', '1995-12-10', 3, 35, 20, 8, 1),
(214, 'Florentino', 'Luís', '1999-08-19', 3, 9, 20, 61, 1),
(215, 'João', 'Neves', '2004-09-27', 3, 9, 20, 87, 1),
(216, 'Rafa', 'Silva', '1993-05-17', 4, 9, 20, 27, 1),
(217, 'Ángel', 'Di María', '1988-02-14', 4, 7, 20, 11, 0),
(218, 'Casper', 'Tengstedt', '2000-06-01', 4, 14, 20, 19, 1),
(219, 'David', 'Neres', '1997-03-03', 4, 1, 20, 7, 0);

-- --------------------------------------------------------

--
-- Zástupná struktura pro pohled `player_details`
-- (Vlastní pohled viz níže)
--
CREATE TABLE `player_details` (
`first_name` varchar(100)
,`last_name` varchar(100)
,`birth_date` date
,`position_name` varchar(50)
,`club_name` varchar(100)
,`nation_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Struktura tabulky `positions`
--

CREATE TABLE `positions` (
  `position_id` int(11) NOT NULL,
  `position_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `positions`
--

INSERT INTO `positions` (`position_id`, `position_name`) VALUES
(1, 'Goalkeeper'),
(2, 'Defender'),
(3, 'Midfielder'),
(4, 'Forward');

-- --------------------------------------------------------

--
-- Struktura tabulky `stadiums`
--

CREATE TABLE `stadiums` (
  `stadium_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `city_id` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `built_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `stadiums`
--

INSERT INTO `stadiums` (`stadium_id`, `name`, `city_id`, `capacity`, `built_date`) VALUES
(1, 'Etihad Stadium', 1, 55097, '2003-08-10'),
(2, 'Old Trafford', 1, 74879, '1910-02-19'),
(3, 'London Stadium', 2, 66000, '2012-05-05'),
(4, 'Anfield', 2, 53394, '1884-09-28'),
(5, 'Emirates Stadium', 2, 60260, '2006-07-22'),
(6, 'Stamford Bridge', 2, 41837, '1877-04-28'),
(7, 'Camp Nou', 3, 99354, '1957-09-24'),
(8, 'Santiago Bernabeu', 4, 81044, '1947-12-14'),
(9, 'Tottenham Hotspur Stadium', 2, 62850, '2019-04-03'),
(10, 'Allianz Arena', 5, 75000, '2005-05-30'),
(11, 'Signal Iduna Park', 6, 81365, '1974-04-02'),
(12, 'Red Bull Arena', 7, 42000, '2010-07-24'),
(13, 'BayArena', 8, 30210, '1958-08-02'),
(14, 'Parc des Princes', 9, 47929, '1972-06-04'),
(15, 'San Siro', 10, 80018, '1926-09-19'),
(16, 'Stadio Diego Armando Maradona', 11, 54726, '1959-12-06'),
(17, 'Allianz Stadium', 12, 41507, '2011-09-08'),
(18, 'Estadio da Luz', 13, 64642, '2003-10-25');

-- --------------------------------------------------------

--
-- Struktura pro pohled `mancity`
--
DROP TABLE IF EXISTS `mancity`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mancity`  AS SELECT `players`.`first_name` AS `first_name`, `players`.`last_name` AS `last_name`, `clubs`.`name` AS `club_name` FROM (`players` join `clubs` on(`players`.`club_id` = `clubs`.`club_id`)) WHERE `clubs`.`name` = 'Manchester City' ;

-- --------------------------------------------------------

--
-- Struktura pro pohled `player_details`
--
DROP TABLE IF EXISTS `player_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `player_details`  AS SELECT `players`.`first_name` AS `first_name`, `players`.`last_name` AS `last_name`, `players`.`birth_date` AS `birth_date`, `positions`.`position_name` AS `position_name`, `clubs`.`name` AS `club_name`, `nations`.`name` AS `nation_name` FROM (((`players` join `positions` on(`players`.`position_id` = `positions`.`position_id`)) join `clubs` on(`players`.`club_id` = `clubs`.`club_id`)) join `nations` on(`players`.`nation_id` = `nations`.`nation_id`)) ;

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexy pro tabulku `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`club_id`),
  ADD KEY `league_id` (`league_id`),
  ADD KEY `stadium_id` (`stadium_id`);

--
-- Indexy pro tabulku `leagues`
--
ALTER TABLE `leagues`
  ADD PRIMARY KEY (`league_id`);

--
-- Indexy pro tabulku `nations`
--
ALTER TABLE `nations`
  ADD PRIMARY KEY (`nation_id`);

--
-- Indexy pro tabulku `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `club_id` (`club_id`),
  ADD KEY `nation_id` (`nation_id`),
  ADD KEY `position_id` (`position_id`);

--
-- Indexy pro tabulku `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexy pro tabulku `stadiums`
--
ALTER TABLE `stadiums`
  ADD PRIMARY KEY (`stadium_id`),
  ADD KEY `city_id` (`city_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pro tabulku `clubs`
--
ALTER TABLE `clubs`
  MODIFY `club_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pro tabulku `leagues`
--
ALTER TABLE `leagues`
  MODIFY `league_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `nations`
--
ALTER TABLE `nations`
  MODIFY `nation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pro tabulku `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=658;

--
-- AUTO_INCREMENT pro tabulku `positions`
--
ALTER TABLE `positions`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `stadiums`
--
ALTER TABLE `stadiums`
  MODIFY `stadium_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `clubs`
--
ALTER TABLE `clubs`
  ADD CONSTRAINT `clubs_ibfk_1` FOREIGN KEY (`stadium_id`) REFERENCES `stadiums` (`stadium_id`),
  ADD CONSTRAINT `clubs_ibfk_2` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`league_id`);

--
-- Omezení pro tabulku `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`),
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`nation_id`) REFERENCES `nations` (`nation_id`),
  ADD CONSTRAINT `players_ibfk_3` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`);

--
-- Omezení pro tabulku `stadiums`
--
ALTER TABLE `stadiums`
  ADD CONSTRAINT `stadiums_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
