-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Май 29 2023 г., 10:36
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
  `date` date NOT NULL,
  `theme` varchar(100) NOT NULL,
  `text` varchar(10000) NOT NULL,
  `tags` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `strength` int NOT NULL DEFAULT '1',
  `endurance` int NOT NULL DEFAULT '1',
  `hunting` int NOT NULL DEFAULT '1',
  `healing` int NOT NULL DEFAULT '1',
  `reputation` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `characters`
--

INSERT INTO `characters` (`idCharacters`, `user`, `name`, `location`, `positionX`, `positionY`, `health`, `infection`, `hunger`, `thirst`, `energy`, `strength`, `endurance`, `hunting`, `healing`, `reputation`) VALUES
(3, 1, 'nurce from hell', 1, 3, 1, 100, 0, 100, 100, 100, 1, 1, 1, 1, 0),
(4, 2, 'тучеморд', 2, 1, 1, 100, 0, 100, 100, 100, 1, 1, 1, 1, 0),
(5, 2, 'зарево осеннего заката', 2, 7, 4, 100, 0, 100, 100, 100, 1, 1, 1, 1, 0),
(6, 2, 'eyepatch', 1, 3, 8, 100, 0, 100, 100, 100, 1, 1, 1, 1, 0),
(7, 2, 'кофе с молоком', 1, 10, 2, 100, 0, 100, 100, 100, 1, 1, 1, 1, 0),
(8, 3, 'testing bunny', 1, 6, 2, 100, 0, 100, 100, 100, 1, 1, 1, 1, 0),
(9, 5, 'Невидимка', 1, 0, 0, 100, 0, 100, 100, 100, 1, 1, 1, 1, 0),
(10, 4, 'Белка', 10, 5, 2, 100, 0, 100, 100, 100, 1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `character_inventories`
--

CREATE TABLE `character_inventories` (
  `idInventory` int NOT NULL,
  `character2` int NOT NULL,
  `item` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
(11, 4, '09:30:23', '9е4р7пупер7цн89нп9цр', 'global');

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
(1, 'lake', 'lake.jpg', 'none', 'outdoor', 1),
(2, 'forest', 'forest.jpg', 'none', 'outdoor', 1),
(3, 'field', 'field.jpg', 'none', 'outdoor', 1),
(4, 'mountain foot', 'mountainfoot.jpg', 'none', 'outdoor', 1),
(5, 'mountain', 'mountain.jpg', 'none', 'outdoor', 1),
(6, 'sky', 'sky.jpg', 'none', 'outdoor', 0),
(7, 'space', 'space.jpg', 'none', 'outdoor', 0),
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
(12, 6, 1, 8, 5);

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
(1, 'cdcttwc@gmail.com', '$2y$10$sMh/gPhDVsvVVNQDwPsCt.A41DjkkeUkoHZtBCZHew07WUCOjS4Ky', 0, '2023-05-19 21:00:00', '2023-05-28 22:12:02', NULL, 'offline', NULL, 1, 100, 1),
(2, 'example@mail.com', '$2y$10$uAFOYmtwdIxBDYUTgKDrQe9BW4ZnkjdD1kKROFKxLuqCYPiM00DWm', 0, '2023-05-20 21:00:00', '2023-05-24 21:00:00', NULL, 'offline', NULL, 1, 100, 1),
(3, 'testtest@test.test', '$2y$10$hQ7EpS6OXzby0trwuo2XB.wOyKsdGnSbBorII1Ka5RK2ugH3sBTmC', 0, '2023-05-26 21:00:00', '2023-05-27 19:09:37', 'run rabbit run rabbit run run run', 'offline', NULL, 1, 100, 1),
(4, 'four@user.cool', '$2y$10$HSTO8ZY7tsDcOeCxAfGNjuzTQzofbwp/It0cM05vAf6uC7NKnpCpK', 0, '2023-05-27 13:08:26', '2023-05-29 06:27:01', 'реекрреу', 'online', 'ds7i4fuvmvnt7tk0nigm48ck66mqsrun', 1, 100, 1),
(5, 'how@many.mails', '$2y$10$GdFyPhcX5s08.xhHLyHf6uejjjXW0lJ4c5cyftEu2Mb.ixTNZ/Cpe', 0, '2023-05-27 19:37:56', '2023-05-27 20:06:14', 'меня нет', 'offline', NULL, 1, 100, 1);

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
-- Индексы таблицы `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`idNotes`),
  ADD UNIQUE KEY `idNotes_UNIQUE` (`idNotes`),
  ADD KEY `character_idx` (`character1`);

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
  MODIFY `idBlog` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `characters`
--
ALTER TABLE `characters`
  MODIFY `idCharacters` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `character_inventories`
--
ALTER TABLE `character_inventories`
  MODIFY `idInventory` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `chatmsgs`
--
ALTER TABLE `chatmsgs`
  MODIFY `idChatMsgs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `idItems` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `items_characteristics`
--
ALTER TABLE `items_characteristics`
  MODIFY `idCharacteristics` int NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `members`
--
ALTER TABLE `members`
  MODIFY `idMembers` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `idMessages` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `notes`
--
ALTER TABLE `notes`
  MODIFY `idNotes` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `idUsers` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Ограничения внешнего ключа таблицы `weather`
--
ALTER TABLE `weather`
  ADD CONSTRAINT `location2` FOREIGN KEY (`location2`) REFERENCES `locations` (`idLocation`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
