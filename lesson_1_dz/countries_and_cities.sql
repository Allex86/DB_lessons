-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 02 2018 г., 17:01
-- Версия сервера: 10.1.29-MariaDB
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `countries and cities`
--

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `city_key` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `type_key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `city_key`, `city`, `type_key`) VALUES
(1, 1, 'city_1', 1),
(2, 1, 'city_2', 2),
(3, 1, 'city_3', 3),
(4, 2, 'city_4', 1),
(5, 2, 'city_5', 2),
(6, 2, 'city_6', 3),
(7, 3, 'city_7', 1),
(8, 3, 'city_8', 2),
(9, 3, 'city_9', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `region_key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`id`, `country`, `region_key`) VALUES
(1, 'country_1', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `district_key` int(11) NOT NULL,
  `district` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `districts`
--

INSERT INTO `districts` (`id`, `district_key`, `district`) VALUES
(1, 1, 'district_1'),
(2, 2, 'district_2'),
(3, 3, 'district_3');

-- --------------------------------------------------------

--
-- Структура таблицы `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `region_key` int(11) NOT NULL,
  `region` varchar(255) NOT NULL,
  `district_key` int(11) NOT NULL,
  `city_key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `region`
--

INSERT INTO `region` (`id`, `region_key`, `region`, `district_key`, `city_key`) VALUES
(1, 1, 'region_1', 3, 1),
(2, 1, 'region_2', 2, 2),
(3, 1, 'region_3', 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `type of settlement`
--

CREATE TABLE `type of settlement` (
  `id` int(11) NOT NULL,
  `type_key` int(11) NOT NULL,
  `type of settlement` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `type of settlement`
--

INSERT INTO `type of settlement` (`id`, `type_key`, `type of settlement`) VALUES
(1, 1, 'city'),
(2, 2, 'urban-type settlement'),
(3, 3, 'village');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_key` (`city_key`),
  ADD KEY `city_key_2` (`city_key`),
  ADD KEY `type_key` (`type_key`);

--
-- Индексы таблицы `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_ibfk_1` (`region_key`);

--
-- Индексы таблицы `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_key` (`district_key`);

--
-- Индексы таблицы `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_key` (`region_key`),
  ADD KEY `region_ibfk_1` (`city_key`),
  ADD KEY `district_key` (`district_key`);

--
-- Индексы таблицы `type of settlement`
--
ALTER TABLE `type of settlement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_key` (`type_key`),
  ADD KEY `type_key_2` (`type_key`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `type of settlement`
--
ALTER TABLE `type of settlement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`type_key`) REFERENCES `type of settlement` (`type_key`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `country`
--
ALTER TABLE `country`
  ADD CONSTRAINT `country_ibfk_1` FOREIGN KEY (`region_key`) REFERENCES `region` (`region_key`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `region_ibfk_1` FOREIGN KEY (`city_key`) REFERENCES `city` (`city_key`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `region_ibfk_2` FOREIGN KEY (`district_key`) REFERENCES `districts` (`district_key`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
