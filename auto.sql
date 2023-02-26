-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 26 2023 г., 20:12
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
-- База данных: `auto`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Car brands`
--

CREATE TABLE `Car brands` (
  `id` int NOT NULL,
  `car_brand` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Car brands`
--

INSERT INTO `Car brands` (`id`, `car_brand`) VALUES
(1, 'Audi'),
(2, 'Renault'),
(3, 'BMW');

-- --------------------------------------------------------

--
-- Структура таблицы `Models`
--

CREATE TABLE `Models` (
  `id` int NOT NULL,
  `model` varchar(100) NOT NULL,
  `car_brand_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Models`
--

INSERT INTO `Models` (`id`, `model`, `car_brand_id`) VALUES
(1, 'A4', 1),
(2, 'A6', 1),
(3, 'A7', 1),
(4, 'Q3', 1),
(5, 'Q5', 1),
(6, 'TT', 1),
(7, 'Scenic', 2),
(8, 'Duster', 2),
(9, 'Fluence', 2),
(10, 'Megane', 2),
(11, 'Sandero', 2),
(12, 'Logan', 2),
(13, '1', 3),
(14, '3', 3),
(15, '5', 3),
(16, '7', 3),
(17, 'X1', 3),
(18, 'X3', 3),
(19, 'X5', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `Orders`
--

CREATE TABLE `Orders` (
  `order_number` int NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `model_id` int NOT NULL,
  `spare_part_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Orders`
--

INSERT INTO `Orders` (`order_number`, `client_name`, `phone`, `model_id`, `spare_part_id`) VALUES
(5, 'Катя', '+375(25) 455-55-55', 11, 5),
(6, 'witch', '+375(22) 223-39-99', 9, 4),
(8, 'ddd', '+375(22) 223-34-44', 11, 4),
(10, 'Юля', '+375(25) 654-12-34', 5, 3),
(11, 'Витя', '+375(44) 444-66-66', 4, 4),
(12, '1erds', '+375(22) 223-30-00', 10, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `Spare parts`
--

CREATE TABLE `Spare parts` (
  `id` int NOT NULL,
  `spare_part` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Spare parts`
--

INSERT INTO `Spare parts` (`id`, `spare_part`) VALUES
(1, 'Бампер передний'),
(2, 'Бампер задний'),
(3, 'Крышка капота'),
(4, 'Дверь водительская'),
(5, 'Дверь пассажирская'),
(6, 'Дверь задняя левая'),
(7, 'Крыло правое'),
(8, 'Фара противотуманная');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Car brands`
--
ALTER TABLE `Car brands`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Models`
--
ALTER TABLE `Models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_brand_id` (`car_brand_id`);

--
-- Индексы таблицы `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`order_number`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `spare_part_id` (`spare_part_id`);

--
-- Индексы таблицы `Spare parts`
--
ALTER TABLE `Spare parts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Car brands`
--
ALTER TABLE `Car brands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Models`
--
ALTER TABLE `Models`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `Orders`
--
ALTER TABLE `Orders`
  MODIFY `order_number` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `Spare parts`
--
ALTER TABLE `Spare parts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Models`
--
ALTER TABLE `Models`
  ADD CONSTRAINT `models_ibfk_1` FOREIGN KEY (`car_brand_id`) REFERENCES `Car brands` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `Models` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`spare_part_id`) REFERENCES `Spare parts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
