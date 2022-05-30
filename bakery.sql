-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 30 Maj 2022, 18:42
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `bakery`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id_orders` int(11) NOT NULL,
  `date_orders` datetime DEFAULT NULL,
  `person_id_person` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `orders`
--

INSERT INTO `orders` (`id_orders`, `date_orders`, `person_id_person`) VALUES
(1, '0000-00-00 00:00:00', 12),
(2, '0000-00-00 00:00:00', 11),
(3, '0000-00-00 00:00:00', 14),
(4, '2022-05-30 00:00:00', 13),
(5, '2022-05-30 00:00:00', 12),
(6, '2022-05-30 00:00:00', 15),
(7, '2022-05-30 00:00:00', 12),
(8, '2022-05-30 16:13:29', 12),
(9, '2022-05-30 16:53:24', 12),
(10, '2022-05-30 16:56:13', 12),
(11, '2022-05-30 16:57:39', 12),
(12, '2022-05-30 16:59:01', 12),
(13, '2022-05-30 17:00:16', 12),
(14, '2022-05-30 18:24:55', 11),
(15, '2022-05-30 18:27:42', 14);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders_products`
--

CREATE TABLE `orders_products` (
  `orders_id_orders` int(11) NOT NULL,
  `products_id_products` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `orders_products`
--

INSERT INTO `orders_products` (`orders_id_orders`, `products_id_products`, `quantity`) VALUES
(11, 2, 1),
(12, 2, 1),
(12, 4, 1),
(12, 3, 1),
(13, 2, 1),
(14, 2, 1),
(15, 2, 1),
(15, 4, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `person`
--

CREATE TABLE `person` (
  `id_person` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `number_login` int(15) NOT NULL,
  `role_id_role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `person`
--

INSERT INTO `person` (`id_person`, `name`, `surname`, `password`, `number_login`, `role_id_role`) VALUES
(11, 'Grzegorz', 'Knapik', 't', 728950772, 1),
(12, 'Ola', 'Biedroń', 'q', 111, 2),
(13, 'Bonifacy', 'Taki', 'e', 222, 2),
(14, 'Maurycy', 'Niczym', 'rr', 2001, 2),
(15, 'Magda', 'Knot', 'q', 55, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `id_products` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` float NOT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`id_products`, `name`, `price`, `img`) VALUES
(2, 'chleb', 3, NULL),
(3, 'chałka', 4, NULL),
(4, 'bagietka', 3, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `type_role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `role`
--

INSERT INTO `role` (`id_role`, `type_role`) VALUES
(1, 'admin'),
(2, 'klient');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_orders`),
  ADD KEY `orders_person_fk` (`person_id_person`);

--
-- Indeksy dla tabeli `orders_products`
--
ALTER TABLE `orders_products`
  ADD KEY `orders_products_products_fk` (`products_id_products`),
  ADD KEY `orders_products_orders_fk` (`orders_id_orders`);

--
-- Indeksy dla tabeli `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id_person`),
  ADD KEY `person_role_fk` (`role_id_role`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_products`);

--
-- Indeksy dla tabeli `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `orders`
--
ALTER TABLE `orders`
  MODIFY `id_orders` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `person`
--
ALTER TABLE `person`
  MODIFY `id_person` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `id_products` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_person_fk` FOREIGN KEY (`person_id_person`) REFERENCES `person` (`id_person`);

--
-- Ograniczenia dla tabeli `orders_products`
--
ALTER TABLE `orders_products`
  ADD CONSTRAINT `orders_products_orders_fk` FOREIGN KEY (`orders_id_orders`) REFERENCES `orders` (`id_orders`),
  ADD CONSTRAINT `orders_products_products_fk` FOREIGN KEY (`products_id_products`) REFERENCES `products` (`id_products`);

--
-- Ograniczenia dla tabeli `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_role_fk` FOREIGN KEY (`role_id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
