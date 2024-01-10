-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Янв 10 2024 г., 12:34
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `stalkcat`
--
CREATE DATABASE IF NOT EXISTS `stalkcat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `stalkcat`;

-- --------------------------------------------------------

--
-- Структура таблицы `anomalies`
--

CREATE TABLE `anomalies` (
  `idAnomaly` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `anomalies_characteristics`
--

CREATE TABLE `anomalies_characteristics` (
  `idCharacteristics` int NOT NULL,
  `subject` enum('health','infection','hunger','thrist','energy','strength','endurance','hunting','healing','reputation') NOT NULL,
  `influence_value` int NOT NULL,
  `Anomalies_idAnomaly` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `blog`
--

CREATE TABLE `blog` (
  `idBlog` int NOT NULL,
  `author` int NOT NULL,
  `theme` varchar(100) NOT NULL,
  `text` varchar(10000) NOT NULL,
  `tags` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `blog`
--

INSERT INTO `blog` (`idBlog`, `author`, `theme`, `text`, `tags`) VALUES
(1, 8, 'фываыва', 'длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость ', 'лень, хочу спать'),
(2, 8, 'фываыва', 'длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость ', 'лень, хочу спать'),
(3, 8, 'фываыва', 'длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость ', 'лень, хочу спать'),
(4, 8, 'тестирование', 'цуавуцацацу\nцаауц\nуу\nу\nу\nу\nу\nу', 'агшукщоущко'),
(5, 8, 'контрольный без новой строки', '.\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣴⣾⣿⣿⣿⣶⣄\n⠄⠄⠄⠄⠄⠄⠄⠄⢀⣿⠟⠁⠄⠄⠈⠙⢿⣷⡀\n⠄⠄⠄⠄⠄⠄⠄⠄⠘⡏⠄⠄⢠⡀⠄⠄⠄⠹⣿⡀\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠡⠄⠄⠘⣿⣶⣄⠄⠄⢹⣇\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢻⣿⣿⣧⡀⠄⣿⠄⠄⠄⢀⡴\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⣿⣿⣿⣷⡀⣿⠄⢀⣴⣿⡇\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⢿⣿⣿⡇⣿⢠⣾⣿⣿⠃\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠉⠉⠁⡇⣾⣿⣿⡟\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣤⣤⡀⣴⣶⣾⡄⢻⠿⠋\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣿⣿⣿⣇⣿⣿⣿⢇⣤⣄\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣴⣶⣮⡻⣿⣿⣿⣿⣻⣿⣿⣿⡇\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠸⣿⣿⣿⣿⡞⠁⠈⢹⣿⡿⢿⡟⠁\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢉⣭⣭⣿⣧⡀⠄⣰⣿⣿⣿⣿⣷\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣿⣿⣿⡿⣻⣿⡿⣿⣿⣝⢿⣿⠟\n⠄⠄⠄⠄⠄⠄⢀⣤⣄⠄⢘⡛⠛⣽⣿⣿⣇⣿⣿⣿⡇\n⠄⠄⠄⠄⢀⣀⢺⣿⣿⢳⣿⣿⡆⠻⣿⣿⠇⠙⠿⠟⠃\n⠄⠄⠄⠄⣿⣿⣷⣻⣿⣿⡿⣟⣥⣄\n⠄⠄⠄⠄⣼⣯⣿⠁⠹⣿⣾⣿⣿⣿⠂\n⠄⠄⠄⠄⠿⢿⣿⣦⣼⣿⣷⣿⣭⠁⠄⠄⠄⠄⢀⣀⡀\n⠄⠄⠄⠄⠄⣿⣿⣏⣿⣿⡿⣿⡿⠃⠄⢀⣴⡾⠟⠛⠻⢿⣶⣄\n⠄⠄⠄⢰⣶⣬⣍⡈⠿⡿⠃⠄⠄⠄⢀⡾⠃⠄⠄⠄⠄⠄⠙⢿⣧⠄\n⠄⠄⠄⢰⣾⣿⣿⣧⠄⡇⠄⠄⠄⠄⢸⡇⠄⢀⣀⠄⠄⠄⠄⠈⣿⡇\n⠄⠄⠄⠈⠉⣾⣿⣿⡇⣇⠄⠄⠄⠄⠄⢷⡀⣿⣿⡇⠄⠄⠄⠄⣿⣷\n⠄⠄⠄⠄⠄⠈⢀⣤⣄⢸⡄⠄⠄⠄⠄⠄⠉⠛⠉⠄⠄⠄⠄⠄⣿⡇\n⠄⠄⠄⠄⠄⠄⣿⣿⣿⡆⢻⣄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣼⡿⠁\n⠄⠄⠄⠄⠄⠄⠙⠛⠋⠄⠄⠹⣶⣄⠄⠄⠄⠄⠄⠄⢀⣠⣾⡟⠁\n⠄⠄⠄⠄⠄⠄⠄⠄⢰⣿⣿⡆⠈⠙⠿⢷⣶⣶⣶⣾⠿⠛⠁\n⠄⠄⠄⠄⠄⠄⠄⠄⠈⠻⠟⠃⠄⣴⣦⡀⠄⢀⣤⡄⠄⣾⣿\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢿⣿⠇⠄⠸⣿⠇⠄⠈⠁', 'тестирование'),
(6, 8, 'с новой строкой', '.<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣴⣾⣿⣿⣿⣶⣄<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⢀⣿⠟⠁⠄⠄⠈⠙⢿⣷⡀<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠘⡏⠄⠄⢠⡀⠄⠄⠄⠹⣿⡀<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠡⠄⠄⠘⣿⣶⣄⠄⠄⢹⣇<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢻⣿⣿⣧⡀⠄⣿⠄⠄⠄⢀⡴<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⣿⣿⣿⣷⡀⣿⠄⢀⣴⣿⡇<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⢿⣿⣿⡇⣿⢠⣾⣿⣿⠃<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠉⠉⠁⡇⣾⣿⣿⡟<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣤⣤⡀⣴⣶⣾⡄⢻⠿⠋<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣿⣿⣿⣇⣿⣿⣿⢇⣤⣄<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣴⣶⣮⡻⣿⣿⣿⣿⣻⣿⣿⣿⡇<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠸⣿⣿⣿⣿⡞⠁⠈⢹⣿⡿⢿⡟⠁<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢉⣭⣭⣿⣧⡀⠄⣰⣿⣿⣿⣿⣷<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣿⣿⣿⡿⣻⣿⡿⣿⣿⣝⢿⣿⠟<br />\n⠄⠄⠄⠄⠄⠄⢀⣤⣄⠄⢘⡛⠛⣽⣿⣿⣇⣿⣿⣿⡇<br />\n⠄⠄⠄⠄⢀⣀⢺⣿⣿⢳⣿⣿⡆⠻⣿⣿⠇⠙⠿⠟⠃<br />\n⠄⠄⠄⠄⣿⣿⣷⣻⣿⣿⡿⣟⣥⣄<br />\n⠄⠄⠄⠄⣼⣯⣿⠁⠹⣿⣾⣿⣿⣿⠂<br />\n⠄⠄⠄⠄⠿⢿⣿⣦⣼⣿⣷⣿⣭⠁⠄⠄⠄⠄⢀⣀⡀<br />\n⠄⠄⠄⠄⠄⣿⣿⣏⣿⣿⡿⣿⡿⠃⠄⢀⣴⡾⠟⠛⠻⢿⣶⣄<br />\n⠄⠄⠄⢰⣶⣬⣍⡈⠿⡿⠃⠄⠄⠄⢀⡾⠃⠄⠄⠄⠄⠄⠙⢿⣧⠄<br />\n⠄⠄⠄⢰⣾⣿⣿⣧⠄⡇⠄⠄⠄⠄⢸⡇⠄⢀⣀⠄⠄⠄⠄⠈⣿⡇<br />\n⠄⠄⠄⠈⠉⣾⣿⣿⡇⣇⠄⠄⠄⠄⠄⢷⡀⣿⣿⡇⠄⠄⠄⠄⣿⣷<br />\n⠄⠄⠄⠄⠄⠈⢀⣤⣄⢸⡄⠄⠄⠄⠄⠄⠉⠛⠉⠄⠄⠄⠄⠄⣿⡇<br />\n⠄⠄⠄⠄⠄⠄⣿⣿⣿⡆⢻⣄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣼⡿⠁<br />\n⠄⠄⠄⠄⠄⠄⠙⠛⠋⠄⠄⠹⣶⣄⠄⠄⠄⠄⠄⠄⢀⣠⣾⡟⠁<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⢰⣿⣿⡆⠈⠙⠿⢷⣶⣶⣶⣾⠿⠛⠁<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠈⠻⠟⠃⠄⣴⣦⡀⠄⢀⣤⡄⠄⣾⣿<br />\n⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢿⣿⠇⠄⠸⣿⠇⠄⠈⠁', 'тестирование'),
(7, 8, 'наглая попытка в инъекцию', '&quot;DROP TABLE `blog`;', 'тестирование');

-- --------------------------------------------------------

--
-- Структура таблицы `characters`
--

CREATE TABLE `characters` (
  `idCharacters` int NOT NULL,
  `user` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `location` int NOT NULL DEFAULT '1',
  `positionX` float NOT NULL DEFAULT '-1',
  `positionY` float NOT NULL DEFAULT '-1',
  `health` int NOT NULL DEFAULT '100',
  `infection` int NOT NULL DEFAULT '0',
  `hunger` int NOT NULL DEFAULT '100',
  `thirst` int NOT NULL DEFAULT '100',
  `energy` int NOT NULL DEFAULT '100',
  `strength` int NOT NULL DEFAULT '10',
  `endurance` int NOT NULL DEFAULT '10',
  `hunting` int NOT NULL DEFAULT '10',
  `healing` int NOT NULL DEFAULT '10',
  `reputation` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `characters`
--

INSERT INTO `characters` (`idCharacters`, `user`, `name`, `location`, `positionX`, `positionY`, `health`, `infection`, `hunger`, `thirst`, `energy`, `strength`, `endurance`, `hunting`, `healing`, `reputation`) VALUES
(3, 1, 'nurce from hell', 1, 3, 2, 100, 0, 100, 100, 100, 10, 10, 10, 10, 0),
(4, 2, 'тучеморд', 2, 1, 1, 100, 0, 100, 100, 100, 10, 10, 10, 10, 0),
(5, 2, 'зарево осеннего заката', 2, 7, 4, 100, 0, 100, 100, 100, 10, 10, 10, 10, 0),
(6, 2, 'eyepatch', 1, 3, 8, 100, 0, 100, 100, 100, 10, 10, 10, 10, 0),
(7, 2, 'кофе с молоком', 1, 10, 2, 100, 0, 100, 100, 100, 10, 10, 10, 10, 0),
(8, 3, 'testing bunny', 1, 7, 10, 100, 0, 100, 100, 100, 10, 10, 10, 10, 0),
(9, 5, 'Невидимка', 1, 0, 0, 100, 0, 100, 100, 100, 10, 10, 10, 10, 0),
(10, 4, 'Белка', 10, 3, 1, 100, 0, 100, 100, 100, 10, 10, 10, 10, 0),
(11, 7, 'theValeria', 1, 7, 3, 100, 0, 100, 100, 100, 10, 10, 10, 10, 0),
(12, 8, 'StalkCat', 2, 5, 7, 70, 0, 90, 100, 40, 80, 50, 90, 30, 100),
(13, 9, 'Девятый', 4, -1, -1, 76, 0, 90, 100, 90, 10, 10, 20, 10, 0),
(14, 11, 'Пушок', 1, -1, -1, 100, 0, 100, 100, 100, 10, 10, 10, 10, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `character_inventories`
--

CREATE TABLE `character_inventories` (
  `idInventory` int NOT NULL,
  `character2` int NOT NULL,
  `item` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `character_inventories`
--

INSERT INTO `character_inventories` (`idInventory`, `character2`, `item`) VALUES
(1, 13, 1),
(2, 13, 4),
(3, 12, 8),
(4, 13, 4),
(5, 13, 12),
(6, 13, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `chatmsgs`
--

CREATE TABLE `chatmsgs` (
  `idChatMsgs` int NOT NULL,
  `fromuser` int NOT NULL,
  `time` time NOT NULL,
  `text` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `chat` enum('local','global') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `chatmsgs`
--

INSERT INTO `chatmsgs` (`idChatMsgs`, `fromuser`, `time`, `text`, `chat`) VALUES
(1, 1, '01:18:24', 'самое время тестировать чат', 'global'),
(2, 1, '01:23:01', '250 символов - не слишком ли много?', 'global'),
(3, 1, '01:28:30', 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff', 'global'),
(4, 1, '01:35:05', '200 символов', 'global'),
(5, 1, '01:35:36', 'nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn', 'global'),
(6, 1, '01:36:13', 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff', 'global'),
(7, 1, '02:06:56', 'битва с таблицей окончена победой, но какой ценой', 'global'),
(8, 1, '02:09:03', 'вставляем пропущенные нолики', 'global'),
(9, 1, '02:09:34', 'нолики!', 'global'),
(10, 1, '02:11:02', 'н о л и к и', 'global'),
(11, 4, '09:30:23', '9е4р7пупер7цн89нп9цр', 'global'),
(12, 1, '01:00:52', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'global'),
(13, 1, '01:22:49', 'я особенно активничаю именно в час ночи, да?', 'global'),
(14, 8, '01:35:16', 'совы вперёд!', 'global'),
(15, 8, '01:35:54', 'я тоже сова', 'global'),
(16, 8, '01:37:18', 'абырвалгы', 'global'),
(17, 8, '01:39:51', 'scroll test', 'global'),
(18, 8, '01:41:06', 'fehifowjiewf', 'global'),
(19, 8, '01:41:21', 'ого оно пролистывается', 'global'),
(20, 8, '01:41:31', 'зщйащайоац', 'global'),
(21, 8, '01:41:51', 'красивое', 'global'),
(22, 8, '14:01:33', 'awsedrtfghjk', 'global'),
(23, 11, '12:01:05', 'всем привет', 'global'),
(24, 11, '18:07:14', 'как-то в полночь, в час угрюмый, утомившись от раздумий, задремал я над страницей фолианта одного. и очнулся вдруг от звука, словно кто-то вдруг застукал, словно глухо так застукал в двери дома моего.', 'global'),
(25, 11, '18:07:36', '&quot;чекаем кавычки на всякий случай&quot;', 'global'),
(26, 11, '18:15:30', 'теперь прокручивается\r\n!&quot;№;:?*()_+!@#$%^&amp;-={}[]|/', 'global'),
(27, 11, '23:02:54', '', 'global'),
(28, 11, '23:02:55', '', 'global'),
(29, 11, '23:02:58', '', 'global'),
(30, 9, '02:03:49', 'asd', 'global');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `idComments` int NOT NULL,
  `blog` int NOT NULL,
  `text` varchar(1000) NOT NULL,
  `fromUser` int NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`idComments`, `blog`, `text`, `fromUser`, `date`) VALUES
(1, 1, 'вот это да', 8, '2024-01-05'),
(2, 1, 'больше комментов', 8, '2024-01-05'),
(3, 1, 'больше комментов', 8, '2024-01-05'),
(4, 6, 'короткий коммент', 8, '2024-01-05'),
(5, 6, 'очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент очень длинный коммент ', 8, '2024-01-05'),
(6, 1, 'фывапролд', 9, '2024-01-10');

-- --------------------------------------------------------

--
-- Структура таблицы `gameroom`
--

CREATE TABLE `gameroom` (
  `idGaming` int NOT NULL,
  `light` int NOT NULL,
  `localtime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `idGroups` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `emblem` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`idGroups`, `name`, `emblem`) VALUES
(1, 'q', 'w'),
(2, 'e', 'r');

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE `items` (
  `idItems` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `type` enum('equipable','edible','artifact','medicine','weapon','supplies','misc','tool') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `items`
--

INSERT INTO `items` (`idItems`, `name`, `image`, `description`, `type`) VALUES
(1, 'Птичьи ножки', 'poultryMedium.png', 'Птичьи ножки - отличная возможность перекусить', 'edible'),
(2, 'Птичьи грудки', 'poultryBig.png', 'Суховато, но поможет ненадолго заглушить голод', 'edible'),
(3, 'Мясо (мал)', 'meatSmall.png', 'Небольшой кусок мяса для кратковременного удовлетворения аппетита', 'edible'),
(4, 'Мясо (сред)', 'meatMedium.png', 'Хороший кусок мяса, которого хватит на полноценный обед', 'edible'),
(5, 'Мясо (бол)', 'meatBig.png', 'Крупный кусок мяса - хватит надолго!', 'edible'),
(6, 'Съедобный гриб', 'edibleMushroom.png', 'Один из немногих безопасных даров леса', 'edible'),
(7, 'Космический гриб', 'spaceMushroom.png', 'Откуда в космосе грибы?..', 'artifact'),
(8, 'Космическое перо', 'spaceFeather.png', 'Перо космического ворона, добытое в тяжёлом бою', 'artifact'),
(9, 'Лечебная трава', 'herb.png', 'Она прямо излучает лечебную энергию', 'medicine'),
(10, 'Крылья бабочки', 'butterflyWings.png', 'Из крыльев бабочек можно изготавливать лекарства', 'medicine'),
(11, 'Эликсир здоровья', 'potionRed.png', 'Восстанавливает здоровье', 'medicine'),
(12, 'Настой из крыльев бабочек', 'potionYellow.png', 'Уменьшает заражение', 'medicine'),
(13, 'Травяной раствор', 'potionGreen.png', 'Восстанавливает здоровье в зависимости от заражения', 'medicine'),
(14, 'Космическое зелье', 'potionBlue.png', 'Увеличивает все параметры на 10', 'medicine'),
(15, 'Пустой флакон', 'potionBottleOpen.png', 'Можно в него что-нибудь налить', 'misc');

-- --------------------------------------------------------

--
-- Структура таблицы `items_characteristics`
--

CREATE TABLE `items_characteristics` (
  `idCharacteristics` int NOT NULL,
  `subject` enum('health','infection','hunger','thrist','energy','strength','endurance','hunting','healing','reputation') NOT NULL,
  `influence_value` int NOT NULL,
  `Items_idItems` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `items_characteristics`
--

INSERT INTO `items_characteristics` (`idCharacteristics`, `subject`, `influence_value`, `Items_idItems`) VALUES
(1, 'hunger', 1, 1),
(2, 'hunger', 2, 2),
(3, 'hunger', 2, 3),
(4, 'hunger', 3, 4),
(5, 'hunger', 4, 5),
(6, 'thrist', 1, 4),
(7, 'thrist', 2, 5),
(8, 'reputation', 1, 8),
(9, 'thrist', -1, 2),
(10, 'infection', 1, 9),
(11, 'health', 3, 9),
(12, 'infection', -1, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `known_location`
--

CREATE TABLE `known_location` (
  `idKnown_Location` int NOT NULL,
  `character3` int NOT NULL,
  `location0` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `locations`
--

CREATE TABLE `locations` (
  `idLocation` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `background` varchar(50) NOT NULL,
  `sound` varchar(50) NOT NULL,
  `type` enum('indoor','outdoor') NOT NULL,
  `hunting` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `locations`
--

INSERT INTO `locations` (`idLocation`, `name`, `background`, `sound`, `type`, `hunting`) VALUES
(1, 'lake', 'lake.jpg', 'none', 'outdoor', 0),
(2, 'forest', 'forest.jpg', 'none', 'outdoor', 1),
(3, 'field', 'field.jpg', 'none', 'outdoor', 1),
(4, 'mountain foot', 'mountainfoot.jpg', 'none', 'outdoor', 1),
(5, 'mountain', 'mountain.jpg', 'none', 'outdoor', 1),
(6, 'sky', 'sky.jpg', 'none', 'outdoor', 0),
(7, 'space', 'space.jpg', 'none', 'outdoor', 1),
(8, 'taiga', 'taiga.jpg', 'none', 'outdoor', 1),
(9, 'jungle', 'jungle.jpg', 'none', 'outdoor', 1),
(10, 'city', 'city.jpg', 'none', 'outdoor', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `locations_anomalies`
--

CREATE TABLE `locations_anomalies` (
  `idLocation_Anomaliles` int NOT NULL,
  `anomaly` int NOT NULL,
  `positionX` float NOT NULL,
  `positionY` float NOT NULL,
  `Locations_idLocation` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `locations_transitions`
--

CREATE TABLE `locations_transitions` (
  `id` int NOT NULL,
  `location_from` int NOT NULL,
  `location_to` int NOT NULL,
  `transitionPosX` int NOT NULL,
  `transitionPosY` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `locations_transitions`
--

INSERT INTO `locations_transitions` (`id`, `location_from`, `location_to`, `transitionPosX`, `transitionPosY`) VALUES
(1, 1, 2, 10, 5),
(2, 2, 1, 0, 5),
(3, 2, 9, 0, 10),
(4, 2, 3, 9, 5),
(5, 3, 4, 7, 3),
(6, 3, 2, 0, 5),
(7, 1, 10, 0, 5),
(8, 9, 2, 10, 5),
(9, 4, 7, 5, 0),
(10, 4, 5, 4, 7),
(11, 5, 6, 2, 1),
(12, 6, 1, 8, 5),
(13, 5, 8, 10, 5),
(14, 8, 5, 6, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `members`
--

CREATE TABLE `members` (
  `idMembers` int NOT NULL,
  `group` int NOT NULL,
  `member` int NOT NULL,
  `joined_at` date NOT NULL,
  `is_lider` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `idMessages` int NOT NULL,
  `from_user` int NOT NULL,
  `to_user` int NOT NULL,
  `time` time NOT NULL,
  `text` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`idMessages`, `from_user`, `to_user`, `time`, `text`) VALUES
(1, 9, 8, '03:01:08', 'приветик, stalk'),
(2, 9, 8, '03:01:43', 'как оно?'),
(3, 9, 8, '03:02:14', 'длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное со'),
(4, 9, 8, '03:03:35', '░░░░░░████████░░░░<br />\n░░░░░█░░░░░░░░█░░░<br />\n░░░░█░░░░░░░░░░█░░<br />\n░░███░░░░████████░<br />\n░█░░█░░░█▒░░░░░░░█<br />\n█▒░░█░░░█▒▒░░░░░▒█<br />\n█▒▒░█░░░█▒▒▒▒▒▒▒▒█<br />\n█▒▒▒█░░░░████████░<br />\n█▒▒▒█▒░░░░░░░░░░█░<br />\n█▒▒▒█▒▒░░░░░░░░░█░<br />\n█▒▒▒█▒▒▒░░░░░░░▒█░<br />\n█▒▒▒█▒▒▒▒▒░░░░▒▒█░<br />\n█▒▒▒█▒▒▒▒▒▒▒▒▒▒▒█░<br />\n░████▒▒▒▒▒▒▒▒▒▒▒█░<br />\n░░░░█▒▒▒▒█████▒▒█░<br />\n░░░░█▒▒▒▒█░░█▒▒▒█░<br />\n░░░░█▒▒▒▒█░░█▒▒▒█░<br />\n░░░░░████░░░░███░░'),
(5, 8, 9, '03:44:31', 'привет! да вот потихоньку'),
(6, 8, 9, '03:45:11', 'я тоже так могу :D'),
(7, 8, 9, '03:45:21', 'длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное сообщение длинное со'),
(8, 8, 9, '03:46:07', '░░░░░░░░░░░░░░░░▄▄░░░░░░░░░░░░░░░░<br />\n░░░░░░░░░░▄█████▀▀▀░░░░░░░░░░░░░░░<br />\n░░░░░░░░░░██▀▀░░▄▄▄░░░░░░░░░░░░░░░<br />\n░░░░░░░░░▄▄▄████████░░█▄▄░░░░░░░░░<br />\n░░░░░░░▀█████████████░▀███▄░░░░░░░<br />\n░░░░░░░░▀████████████░░█████▄░░░░░<br />\n░░░░░░░░░█████████████░▀█████▄░░░░<br />\n░░░░░░░░░░████████████░░██████▄░░░<br />\n░░░░░░░░░░████████████░░███████▄░░<br />\n░░░░░░░░░░████████████░░░░░░░░░░░░<br />\n█████████▄▀▀▀░░░░░░░░░░██████████░<br />\n██████████▄▄▄▄▄▄▄▄▄▄▄▄██████████▀░<br />\n░▀▀▀███████████████████████████▀░░<br />\n░░░░░█████████████████████████▀░░░<br />\n░░░░░░▀▀░▀▀███▀▀░░▀▀███▀▀░▀▀▀░░░░░<br />\n█▄▄▄▄▄▄▄██▄▄▄▄▄▄██▄▄▄▄▄▄██▄▄▄▄▄▄▄█<br />\n▀███████▀███████▀▀███████▀███████▀<br />\n░░░▀▀▀░░░░░▀▀▀░░░░░░▀▀▀░░░░░▀▀▀░░░'),
(9, 9, 8, '05:15:06', 'алло'),
(10, 9, 8, '11:40:30', 'ФЫВАПРОЛ');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `idNews` int NOT NULL,
  `newsDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `newsText` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`idNews`, `newsDate`, `newsText`) VALUES
(1, '2024-01-05 15:31:00', 'хочу рисовать, а не вот это вот всё'),
(2, '2024-01-05 15:31:46', 'длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость длинная новость ');

-- --------------------------------------------------------

--
-- Структура таблицы `notes`
--

CREATE TABLE `notes` (
  `idNotes` int NOT NULL,
  `character1` int NOT NULL,
  `type` enum('note','journal') NOT NULL,
  `content` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `prey`
--

CREATE TABLE `prey` (
  `idPrey` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `minHuntingLevel` int NOT NULL DEFAULT '10',
  `fleeRate` float NOT NULL DEFAULT '0.1' COMMENT 'Шанс того, что добыча сбежит при встрече (по умолчанию 10%)',
  `health` int NOT NULL DEFAULT '50',
  `attack` int NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `prey`
--

INSERT INTO `prey` (`idPrey`, `name`, `image`, `description`, `minHuntingLevel`, `fleeRate`, `health`, `attack`) VALUES
(1, 'Мышь', 'mouse.png', 'Маленькая мышка, выбравшаяся из норки в поисках еды', 10, 0.5, 10, 0),
(2, 'Кролик', 'rabbit.png', 'Небольшой пушистый зверёк с чутким обонянием. Осторожно: кусается!', 20, 0.4, 30, 1),
(3, 'Чёрный дрозд', 'blackbird.png', 'Чёрная быстрая птичка. Не успеешь оглянуться, как её уже нет...', 10, 0.7, 20, 0),
(6, 'Джекалоп', 'jackalope.png', 'Рогатый заяц, кролень или зайцелоп. Берегись острых рогов и мощных лап!', 40, 0.6, 40, 5),
(7, 'Космический ворон', 'spaceRaven.png', 'Рождённый из звёздной пыли, он путешествует по миру, оставляя свои перья на память земным жителям', 70, 0.8, 100, 5),
(8, 'Бабочка', 'butterfly.png', 'Радиация однозначно пошла бабочке на пользу', 10, 0.2, 1, 0),
(9, 'Сизый голубь', 'pigeon.png', 'Этой проворной птице даже ястребы нипочём. А коты?', 10, 0.5, 30, 1),
(10, 'Вендиго(?)', 'wendigo.png', 'Чудовищное порождение катастрофы, вобравшее в себя худшее из окружающего мира', 10, 0.1, 500, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `prey_spawn_items`
--

CREATE TABLE `prey_spawn_items` (
  `idPreySpawnItem` int NOT NULL,
  `prey` int NOT NULL,
  `item` int NOT NULL,
  `spawnRate` int NOT NULL DEFAULT '50' COMMENT 'Шанс, что из добычи выпадет этот предмет (по умолчанию 50%)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `prey_spawn_items`
--

INSERT INTO `prey_spawn_items` (`idPreySpawnItem`, `prey`, `item`, `spawnRate`) VALUES
(1, 1, 3, 100),
(2, 2, 4, 100),
(3, 3, 1, 80),
(4, 3, 2, 20),
(5, 6, 4, 80),
(6, 6, 5, 20),
(7, 7, 8, 30),
(8, 9, 1, 50),
(9, 9, 2, 50),
(10, 10, 5, 80),
(11, 8, 10, 50);

-- --------------------------------------------------------

--
-- Структура таблицы `prey_spawn_locations`
--

CREATE TABLE `prey_spawn_locations` (
  `idPreySpawnLoc` int NOT NULL,
  `prey` int NOT NULL,
  `location` int NOT NULL,
  `spawnRate` int NOT NULL DEFAULT '50' COMMENT 'Шанс появления добычи на локации (по умолчанию 50%)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `prey_spawn_locations`
--

INSERT INTO `prey_spawn_locations` (`idPreySpawnLoc`, `prey`, `location`, `spawnRate`) VALUES
(1, 1, 2, 30),
(2, 1, 3, 30),
(3, 1, 8, 70),
(4, 2, 2, 20),
(5, 2, 3, 20),
(6, 2, 4, 10),
(7, 2, 8, 60),
(8, 3, 2, 40),
(9, 6, 3, 10),
(10, 6, 8, 40),
(11, 7, 7, 30),
(12, 8, 2, 10),
(13, 8, 3, 40),
(14, 9, 10, 100),
(15, 9, 6, 50),
(16, 3, 6, 50),
(17, 10, 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `idUsers` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `isadmin` tinyint DEFAULT NULL,
  `regdate` timestamp NOT NULL,
  `lastdate` timestamp NULL DEFAULT NULL,
  `about` varchar(5000) DEFAULT NULL,
  `status` enum('online','offline','in game') NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `settings_voice` tinyint DEFAULT NULL,
  `settings_voicevolume` int NOT NULL,
  `settings_effects` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`idUsers`, `email`, `password`, `isadmin`, `regdate`, `lastdate`, `about`, `status`, `token`, `settings_voice`, `settings_voicevolume`, `settings_effects`) VALUES
(1, 'cdcttwc@gmail.com', '$2y$10$sMh/gPhDVsvVVNQDwPsCt.A41DjkkeUkoHZtBCZHew07WUCOjS4Ky', 0, '2023-05-19 21:00:00', '2023-12-29 12:17:36', NULL, 'offline', NULL, 1, 100, 1),
(2, 'example@mail.com', '$2y$10$uAFOYmtwdIxBDYUTgKDrQe9BW4ZnkjdD1kKROFKxLuqCYPiM00DWm', 1, '2023-05-20 21:00:00', '2023-05-24 21:00:00', 'Хозяин NPC', 'offline', NULL, 1, 100, 1),
(3, 'testtest@test.test', '$2y$10$hQ7EpS6OXzby0trwuo2XB.wOyKsdGnSbBorII1Ka5RK2ugH3sBTmC', 0, '2023-05-26 21:00:00', '2023-05-30 13:17:12', 'run rabbit run rabbit run run run', 'offline', NULL, 1, 100, 1),
(4, 'four@user.cool', '$2y$10$HSTO8ZY7tsDcOeCxAfGNjuzTQzofbwp/It0cM05vAf6uC7NKnpCpK', 0, '2023-05-27 13:08:26', '2023-05-30 13:15:57', 'eawtdrgiuoijjoio', 'offline', NULL, 1, 100, 1),
(5, 'how@many.mails', '$2y$10$GdFyPhcX5s08.xhHLyHf6uejjjXW0lJ4c5cyftEu2Mb.ixTNZ/Cpe', 0, '2023-05-27 19:37:56', '2023-05-27 20:06:14', 'меня нет', 'offline', NULL, 1, 100, 1),
(7, 'cat@mail.ru', '$2y$10$iFoD2z7L1YnXeBIJTJh5L..Ic30DoNj/6UWwA0b5DP8sVJVV6IecO', 0, '2023-09-22 08:41:41', '2023-09-22 08:49:47', NULL, 'offline', NULL, 1, 100, 1),
(8, 'stalk@cat.com', '$2y$10$uKQJTJWsNLQLjEXUCgSvIeWER/nLWZbHu6ZTnIZhFVnyZSswh70UW', 1, '2023-10-26 22:23:57', '2024-01-08 00:43:52', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer efficitur leo est, mollis suscipit elit vulputate sit amet. Phasellus laoreet augue ipsum, cursus pretium lectus efficitur non. Vivamus egestas tempus ipsum, a pretium ex semper id. Quisque ut lorem viverra, condimentum erat semper, ultrices odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla vel purus dui. Donec porta sem at ornare fringilla. Pellentesque sodales non arcu quis fermentum.\r\n\r\nSed nec rhoncus velit, sit amet tristique nulla. Sed semper tortor lacus. Praesent ac fringilla lorem. In purus ipsum, eleifend ac ligula quis, vulputate ornare velit. Curabitur tempor risus nec massa sagittis, non placerat metus tincidunt. Duis vitae ex et arcu sagittis interdum. Maecenas fringilla accumsan risus. Praesent bibendum, sem ac ultricies varius, nunc risus interdum felis, vel imperdiet ex justo at tellus. Vestibulum convallis odio magna, eu vulputate tortor accumsan vel. Quisque et massa feugiat, sollicitudin justo at, maximus orci.\r\n\r\nVestibulum consectetur leo et lacus laoreet tempor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec et leo fermentum, aliquet est ut, auctor metus. Donec eleifend accumsan condimentum. Mauris viverra vestibulum massa semper aliquet. Proin ut fermentum mi, ac porttitor eros. Quisque rhoncus leo id feugiat pellentesque. Duis aliquet porttitor massa, eget venenatis orci dapibus elementum. Praesent malesuada malesuada varius.\r\n\r\nCras vestibulum, nunc vel dictum lacinia, nibh lorem finibus massa, a malesuada ligula leo id massa. Nunc vel metus eu mauris aliquet faucibus. Integer vulputate odio quis quam semper finibus. Fusce condimentum posuere velit at dapibus. Cras sed purus vitae sapien suscipit malesuada. Nulla dignissim scelerisque nunc quis tempus. Integer finibus ac mauris vitae pharetra. Maecenas pulvinar et velit et sollicitudin. Donec non iaculis ipsum. Nam sagittis porta rhoncus. Vivamus mollis enim eu sapien pulvinar posuere. Ut lobortis massa id neque dapibus, eu auctor elit molestie. Duis et porttitor turpis. Duis vel semper ante, ut posuere tellus.\r\n\r\nDonec ullamcorper, massa at convallis luctus, ligula lacus ultrices nulla, placerat pharetra diam tellus vel mauris. Nulla dui metus, malesuada a mattis ut, vehicula eu felis. Aliquam blandit sodales dolor, ultrices porttitor justo posuere vitae. Vestibulum sodales tristique quam, id vehicula massa. Ut non dignissim eros, quis luctus elit. Donec consequat lacinia placerat. Etiam sapien velit, convallis ullamcorper finibus ac, iaculis et lacus. Etiam vehicula turpis sem. Nulla eleifend diam est, eget vehicula ligula volutpat vel. Maecenas a est ipsum. Integer tellus mauris, molestie nec vehicula viverra, pretium in metus. Aenean odio nulla, elementum a sapien vel, viverra volutpat nisl. Donec dapibus nibh at mi pretium egestas.\r\n\r\nCras scelerisque mauris a condimentum scelerisque. Phasellus fringilla molestie nisl non ullamcorper. Nullam in varius metus. Aenean est lacus, scelerisque in fringilla a, mollis sit amet orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at turpis diam. Phasellus efficitur viverra tortor, ut cursus metus aliquet vitae. Fusce dapibus at arcu sit amet elementum. Curabitur commodo mauris eu risus sollicitudin, non euismod turpis consectetur. Praesent congue iaculis massa, eu pharetra lorem maximus ullamcorper. Maecenas vel magna malesuada, pulvinar metus vitae, lobortis purus. Mauris malesuada risus libero, sit amet fringilla tortor rhoncus sit amet. Integer scelerisque odio sit amet vulputate porta. Donec eu tortor vel tellus dictum lacinia non quis enim. Aenean auctor hendrerit aliquam. Praesent eu nibh at diam tristique viverra.\r\n\r\nSed pellentesque luctus elit eu venenatis. Fusce quis arcu quis orci ullamcorper dignissim. Ut quis nisl sollicitudin, auctor ante et, pretium neque. Nunc diam massa, facilisis vitae imperdiet eu, congue vitae est. Mauris ullamcorper eros dui, non pretium tortor iaculis nec. Morbi eget ullamcorper nunc. Morbi pellentesque lobortis egestas. Proin sem enim, dapibus faucibus malesuada ac, faucibus eu eros. Cras consectetur congue tortor et pretium. In at molestie metus.\r\n\r\nProin et erat sagittis, fringilla purus eget, elementum urna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut ut ligula id nulla consectetur placerat id quis dui. Nunc enim libero, pretium sed eros eu, cursus sodales enim. Integer risus augue, blandit id imperdiet sed, egestas in enim. Curabitur aliquam malesuada diam, at sodales dui lobortis ac. Nunc lobortis dictum euismod. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'online', '10u9ug2r4b75gs0nnc7fdih9h5d1rsjj', 1, 100, 1),
(9, 'tim@burton.nine', '$2y$10$/SedczF77vtMexVbKJwaF.vpDv3qzdYYj2LAZmQrTLquOuNun/NKa', 0, '2023-10-26 22:51:13', '2024-01-06 17:04:16', 'Наш огромный мир в их маленьких руках', 'online', 'iehdtmubvc62doi9a6r8p857o8nh0klt', 1, 100, 1),
(10, 'kosh@ka.com', '$2y$10$V3LoKmGY9PIp1nmvw5AoUudFmG8MLq2Fr8/Ip1U85r/eEbDO3K5we', 0, '2023-11-02 06:38:13', '2023-12-29 12:23:23', NULL, 'offline', NULL, 1, 100, 1),
(11, 'asd@jkl.com', '$2y$10$5/8NAcz7BtSkfxfthgsImO6tKWAVyrtO5mX2/3p.zt5mS.XE9qwrm', 0, '2023-12-13 08:55:24', '2023-12-29 12:24:59', 'я новенький', 'offline', NULL, 1, 100, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `weather`
--

CREATE TABLE `weather` (
  `idWeather` int NOT NULL,
  `clear` tinyint NOT NULL,
  `cloudy` tinyint NOT NULL,
  `rain` tinyint NOT NULL,
  `thunderstorm` tinyint NOT NULL,
  `hail` tinyint NOT NULL,
  `release` tinyint NOT NULL,
  `snow` tinyint NOT NULL,
  `temperature` int NOT NULL,
  `location2` int NOT NULL,
  `time_start` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `anomalies`
--
ALTER TABLE `anomalies`
  ADD PRIMARY KEY (`idAnomaly`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD UNIQUE KEY `idAnomaly_UNIQUE` (`idAnomaly`);

--
-- Индексы таблицы `anomalies_characteristics`
--
ALTER TABLE `anomalies_characteristics`
  ADD PRIMARY KEY (`idCharacteristics`),
  ADD UNIQUE KEY `idCharacteristics_UNIQUE` (`idCharacteristics`),
  ADD KEY `fk_Anomalies_Characteristics_Anomalies1_idx` (`Anomalies_idAnomaly`);

--
-- Индексы таблицы `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`idBlog`),
  ADD UNIQUE KEY `idBlog_UNIQUE` (`idBlog`),
  ADD KEY `author_idx` (`author`);

--
-- Индексы таблицы `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`idCharacters`),
  ADD UNIQUE KEY `idCharacters_UNIQUE` (`idCharacters`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `user_idx` (`user`),
  ADD KEY `location` (`location`);

--
-- Индексы таблицы `character_inventories`
--
ALTER TABLE `character_inventories`
  ADD PRIMARY KEY (`idInventory`),
  ADD UNIQUE KEY `idInventory_UNIQUE` (`idInventory`),
  ADD KEY `item_idx` (`item`),
  ADD KEY `character_idx` (`character2`);

--
-- Индексы таблицы `chatmsgs`
--
ALTER TABLE `chatmsgs`
  ADD PRIMARY KEY (`idChatMsgs`),
  ADD UNIQUE KEY `idChatMsgs_UNIQUE` (`idChatMsgs`),
  ADD KEY `user_idx` (`fromuser`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`idComments`),
  ADD KEY `blog` (`blog`),
  ADD KEY `userComment` (`fromUser`);

--
-- Индексы таблицы `gameroom`
--
ALTER TABLE `gameroom`
  ADD PRIMARY KEY (`idGaming`),
  ADD UNIQUE KEY `idGaming_UNIQUE` (`idGaming`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`idGroups`),
  ADD UNIQUE KEY `idGroups_UNIQUE` (`idGroups`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Индексы таблицы `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`idItems`),
  ADD UNIQUE KEY `idItems_UNIQUE` (`idItems`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Индексы таблицы `items_characteristics`
--
ALTER TABLE `items_characteristics`
  ADD PRIMARY KEY (`idCharacteristics`),
  ADD UNIQUE KEY `idCharacteristics_UNIQUE` (`idCharacteristics`),
  ADD KEY `fk_Items_Characteristics_Items1_idx` (`Items_idItems`);

--
-- Индексы таблицы `known_location`
--
ALTER TABLE `known_location`
  ADD PRIMARY KEY (`idKnown_Location`),
  ADD UNIQUE KEY `idKnown_Location_UNIQUE` (`idKnown_Location`),
  ADD KEY `location_idx` (`location0`),
  ADD KEY `character_idx` (`character3`);

--
-- Индексы таблицы `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`idLocation`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD UNIQUE KEY `idLocation_UNIQUE` (`idLocation`);

--
-- Индексы таблицы `locations_anomalies`
--
ALTER TABLE `locations_anomalies`
  ADD PRIMARY KEY (`idLocation_Anomaliles`),
  ADD UNIQUE KEY `idLocation_Anomaliles_UNIQUE` (`idLocation_Anomaliles`),
  ADD KEY `anomaly_idx` (`anomaly`),
  ADD KEY `fk_Locations_Anomalies_Locations1_idx` (`Locations_idLocation`);

--
-- Индексы таблицы `locations_transitions`
--
ALTER TABLE `locations_transitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_from` (`location_from`),
  ADD KEY `location_to` (`location_to`);

--
-- Индексы таблицы `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`idMembers`),
  ADD UNIQUE KEY `idMembers_UNIQUE` (`idMembers`),
  ADD KEY `group_idx` (`group`),
  ADD KEY `member_idx` (`member`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`idMessages`),
  ADD UNIQUE KEY `idMessages_UNIQUE` (`idMessages`),
  ADD KEY `fromuser_idx` (`from_user`),
  ADD KEY `touser_idx` (`to_user`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`idNews`);

--
-- Индексы таблицы `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`idNotes`),
  ADD UNIQUE KEY `idNotes_UNIQUE` (`idNotes`),
  ADD KEY `character_idx` (`character1`);

--
-- Индексы таблицы `prey`
--
ALTER TABLE `prey`
  ADD PRIMARY KEY (`idPrey`);

--
-- Индексы таблицы `prey_spawn_items`
--
ALTER TABLE `prey_spawn_items`
  ADD PRIMARY KEY (`idPreySpawnItem`),
  ADD KEY `prey` (`prey`),
  ADD KEY `spawnItem` (`item`);

--
-- Индексы таблицы `prey_spawn_locations`
--
ALTER TABLE `prey_spawn_locations`
  ADD PRIMARY KEY (`idPreySpawnLoc`),
  ADD KEY `spawnPrey` (`prey`),
  ADD KEY `locSpawn` (`location`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUsers`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `idUsers_UNIQUE` (`idUsers`);

--
-- Индексы таблицы `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`idWeather`),
  ADD UNIQUE KEY `idWeather_UNIQUE` (`idWeather`),
  ADD KEY `location_idx` (`location2`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `anomalies`
--
ALTER TABLE `anomalies`
  MODIFY `idAnomaly` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `anomalies_characteristics`
--
ALTER TABLE `anomalies_characteristics`
  MODIFY `idCharacteristics` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `blog`
--
ALTER TABLE `blog`
  MODIFY `idBlog` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `characters`
--
ALTER TABLE `characters`
  MODIFY `idCharacters` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `character_inventories`
--
ALTER TABLE `character_inventories`
  MODIFY `idInventory` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `chatmsgs`
--
ALTER TABLE `chatmsgs`
  MODIFY `idChatMsgs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `idComments` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `gameroom`
--
ALTER TABLE `gameroom`
  MODIFY `idGaming` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `idGroups` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `items`
--
ALTER TABLE `items`
  MODIFY `idItems` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `items_characteristics`
--
ALTER TABLE `items_characteristics`
  MODIFY `idCharacteristics` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `known_location`
--
ALTER TABLE `known_location`
  MODIFY `idKnown_Location` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `locations`
--
ALTER TABLE `locations`
  MODIFY `idLocation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `locations_anomalies`
--
ALTER TABLE `locations_anomalies`
  MODIFY `idLocation_Anomaliles` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `locations_transitions`
--
ALTER TABLE `locations_transitions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `members`
--
ALTER TABLE `members`
  MODIFY `idMembers` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `idMessages` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `idNews` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `notes`
--
ALTER TABLE `notes`
  MODIFY `idNotes` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `prey`
--
ALTER TABLE `prey`
  MODIFY `idPrey` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `prey_spawn_items`
--
ALTER TABLE `prey_spawn_items`
  MODIFY `idPreySpawnItem` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `prey_spawn_locations`
--
ALTER TABLE `prey_spawn_locations`
  MODIFY `idPreySpawnLoc` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `idUsers` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `weather`
--
ALTER TABLE `weather`
  MODIFY `idWeather` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `anomalies_characteristics`
--
ALTER TABLE `anomalies_characteristics`
  ADD CONSTRAINT `fk_Anomalies_Characteristics_Anomalies1` FOREIGN KEY (`Anomalies_idAnomaly`) REFERENCES `anomalies` (`idAnomaly`);

--
-- Ограничения внешнего ключа таблицы `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `author` FOREIGN KEY (`author`) REFERENCES `users` (`idUsers`);

--
-- Ограничения внешнего ключа таблицы `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `location` FOREIGN KEY (`location`) REFERENCES `locations` (`idLocation`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`user`) REFERENCES `users` (`idUsers`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `character_inventories`
--
ALTER TABLE `character_inventories`
  ADD CONSTRAINT `character2` FOREIGN KEY (`character2`) REFERENCES `characters` (`idCharacters`),
  ADD CONSTRAINT `item` FOREIGN KEY (`item`) REFERENCES `items` (`idItems`);

--
-- Ограничения внешнего ключа таблицы `chatmsgs`
--
ALTER TABLE `chatmsgs`
  ADD CONSTRAINT `fromuser` FOREIGN KEY (`fromuser`) REFERENCES `users` (`idUsers`);

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `blog` FOREIGN KEY (`blog`) REFERENCES `blog` (`idBlog`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userComment` FOREIGN KEY (`fromUser`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `items_characteristics`
--
ALTER TABLE `items_characteristics`
  ADD CONSTRAINT `fk_Items_Characteristics_Items1` FOREIGN KEY (`Items_idItems`) REFERENCES `items` (`idItems`);

--
-- Ограничения внешнего ключа таблицы `known_location`
--
ALTER TABLE `known_location`
  ADD CONSTRAINT `character3` FOREIGN KEY (`character3`) REFERENCES `characters` (`idCharacters`),
  ADD CONSTRAINT `location0` FOREIGN KEY (`location0`) REFERENCES `locations` (`idLocation`);

--
-- Ограничения внешнего ключа таблицы `locations_anomalies`
--
ALTER TABLE `locations_anomalies`
  ADD CONSTRAINT `anomaly` FOREIGN KEY (`anomaly`) REFERENCES `anomalies` (`idAnomaly`),
  ADD CONSTRAINT `fk_Locations_Anomalies_Locations1` FOREIGN KEY (`Locations_idLocation`) REFERENCES `locations` (`idLocation`);

--
-- Ограничения внешнего ключа таблицы `locations_transitions`
--
ALTER TABLE `locations_transitions`
  ADD CONSTRAINT `location_from` FOREIGN KEY (`location_from`) REFERENCES `locations` (`idLocation`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `location_to` FOREIGN KEY (`location_to`) REFERENCES `locations` (`idLocation`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `group` FOREIGN KEY (`group`) REFERENCES `groups` (`idGroups`),
  ADD CONSTRAINT `member` FOREIGN KEY (`member`) REFERENCES `characters` (`idCharacters`);

--
-- Ограничения внешнего ключа таблицы `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `from_user` FOREIGN KEY (`from_user`) REFERENCES `users` (`idUsers`),
  ADD CONSTRAINT `to_user` FOREIGN KEY (`to_user`) REFERENCES `users` (`idUsers`);

--
-- Ограничения внешнего ключа таблицы `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `character1` FOREIGN KEY (`character1`) REFERENCES `characters` (`idCharacters`);

--
-- Ограничения внешнего ключа таблицы `prey_spawn_items`
--
ALTER TABLE `prey_spawn_items`
  ADD CONSTRAINT `prey` FOREIGN KEY (`prey`) REFERENCES `prey` (`idPrey`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `spawnItem` FOREIGN KEY (`item`) REFERENCES `items` (`idItems`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `prey_spawn_locations`
--
ALTER TABLE `prey_spawn_locations`
  ADD CONSTRAINT `locSpawn` FOREIGN KEY (`location`) REFERENCES `locations` (`idLocation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `spawnPrey` FOREIGN KEY (`prey`) REFERENCES `prey` (`idPrey`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `weather`
--
ALTER TABLE `weather`
  ADD CONSTRAINT `location2` FOREIGN KEY (`location2`) REFERENCES `locations` (`idLocation`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
