-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 01, 2024 at 07:29 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `used_car_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `Makes`
--

CREATE TABLE `Makes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Makes`
--

INSERT INTO `Makes` (`id`, `name`) VALUES
(1, 'Acura'),
(3, 'Alfa Romeo'),
(5, 'Audi'),
(7, 'BMW'),
(9, 'Cadillac'),
(11, 'Chrysler'),
(13, 'Daihatsu'),
(15, 'Eagle'),
(17, 'FIAT'),
(19, 'Ford'),
(21, 'Genesis'),
(23, 'GMC'),
(25, 'HUMMER'),
(27, 'INEOS'),
(29, 'Isuzu'),
(31, 'Jeep'),
(33, 'Lamborghini'),
(35, 'Lexus'),
(36, 'Lincoln'),
(37, 'Lotus'),
(40, 'Maserati'),
(39, 'MAZDA'),
(43, 'Mercedes-Benz'),
(45, 'MINI'),
(47, 'Nissan'),
(50, 'Polestar'),
(60, 'SRT'),
(64, 'Toyota');

-- --------------------------------------------------------

--
-- Table structure for table `Models`
--

CREATE TABLE `Models` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `make_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Models`
--

INSERT INTO `Models` (`id`, `name`, `make_id`) VALUES
(1, 'Stelvio 2023', 3),
(2, 'TLX', 1),
(3, 'RS 5', 5),
(4, 'i5', 7),
(5, 'Escalade', 9),
(6, '300', 11),
(7, 'Rocky', 13),
(8, 'Vision', 15),
(9, '500X', 17),
(10, 'Mustang', 19),
(11, 'Yukon', 23),
(12, 'G90', 21),
(13, 'H1', 25),
(14, 'Grenadier', 27),
(15, 'Ascender', 29),
(16, 'Wagoneer L', 31),
(17, 'Aventador', 33),
(18, 'ES', 35),
(19, 'Evora GT', 37),
(20, 'Granturismo', 40),
(21, 'GLE', 43),
(22, 'CX-30', 39),
(23, 'Sentra', 47),
(24, 'Countryman', 45),
(25, 'Polestar 1', 50),
(26, 'Hellcat Redeye', 60),
(27, 'Supra', 64),
(28, 'Navigator', 36);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'Auto increment Primary key.',
  `user_name` varchar(50) NOT NULL COMMENT 'Ensures each username is unique.',
  `last_name` varchar(50) NOT NULL COMMENT 'Standard index for faster search.',
  `first_name` varchar(50) NOT NULL COMMENT 'Standard index for faster search.',
  `email` varchar(150) NOT NULL COMMENT 'Ensures each email is unique.',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'user = 0 (no admin priv)\r\nadmin = 1 (admin priv).',
  `password` varchar(255) DEFAULT NULL,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `user_name`, `last_name`, `first_name`, `email`, `is_admin`, `password`, `registration_date`) VALUES
(1, 'admin', 'Salgado', 'Juan', 'admin@gmail.com', 1, 'admin', '2024-05-11 02:02:51'),
(2, 'John.Doe', 'Doe', 'John', 'johndoe@gmail.com', 0, 'johndoe', '2024-05-16 03:00:25'),
(18, 'person', '1', 'person', 'person1@gmail.com', 0, '$2y$10$Vuz06mjxlLKmd.k5VDR9Ge0oHc0KHvC3EbPwRAgGixZlbn93Qqz8i', '2024-05-18 18:18:59');

-- --------------------------------------------------------

--
-- Table structure for table `Vehicles`
--

CREATE TABLE `Vehicles` (
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `year` int(10) NOT NULL,
  `vehicle_type_id` int(10) UNSIGNED NOT NULL,
  `vehicle_power_type_id` int(10) UNSIGNED NOT NULL,
  `vin` varchar(20) NOT NULL,
  `dealer_purchased_date` datetime DEFAULT NULL,
  `dealer_purchased_price` double DEFAULT NULL,
  `sold_date` datetime DEFAULT NULL,
  `sold_price` double DEFAULT NULL,
  `additional_cost` double DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Vehicles`
--

INSERT INTO `Vehicles` (`vehicle_id`, `model_id`, `year`, `vehicle_type_id`, `vehicle_power_type_id`, `vin`, `dealer_purchased_date`, `dealer_purchased_price`, `sold_date`, `sold_price`, `additional_cost`, `color`) VALUES
(1, 1, 2023, 2, 3, 'VINExample1', '2023-01-01 00:00:00', 37098, NULL, NULL, NULL, 'Blue'),
(2, 2, 2023, 3, 3, 'VINExample2', '2023-01-01 00:00:00', 34764, NULL, NULL, NULL, 'Black'),
(3, 3, 2024, 8, 3, 'VINExample3', '2024-01-01 00:00:00', 80695, NULL, NULL, NULL, 'Blue'),
(4, 4, 2024, 3, 2, 'VINExample4', '2024-01-01 00:00:00', 67795, NULL, NULL, NULL, 'White'),
(5, 5, 2015, 2, 3, 'VINExample5', '2015-01-01 00:00:00', 20938, NULL, NULL, NULL, 'Silver'),
(6, 6, 2015, 3, 3, 'VINExample6', '2015-01-01 00:00:00', 12339, NULL, NULL, NULL, NULL),
(7, 7, 1992, 2, 3, 'VINExample7', '1992-01-01 00:00:00', 2908, NULL, NULL, NULL, 'Gray'),
(8, 8, 1995, 3, 3, 'VINExample8', '1995-01-01 00:00:00', 2051, NULL, NULL, NULL, 'Black'),
(9, 9, 2017, 2, 3, 'VINExample9', '2017-01-01 00:00:00', 9647, NULL, NULL, NULL, 'Red'),
(10, 10, 2024, 8, 3, 'VINExample10', '2024-01-01 00:00:00', 32515, NULL, NULL, NULL, 'Red'),
(11, 11, 2021, 2, 3, 'VINExample11', '2021-01-01 00:00:00', 45935, NULL, NULL, NULL, 'Red'),
(12, 12, 2024, 3, 3, 'VINExample12', '2024-01-01 00:00:00', 90450, NULL, NULL, NULL, 'Black'),
(13, 13, 2006, 2, 3, 'VINExample13', '2006-01-01 00:00:00', 155986, NULL, NULL, NULL, 'Red'),
(14, 14, 2024, 2, 3, 'VINExample14', '2024-01-01 00:00:00', 73100, NULL, NULL, NULL, 'Silver'),
(15, 15, 2003, 2, 3, 'VINExample15', '2003-01-01 00:00:00', 3984, NULL, NULL, NULL, 'Gold'),
(16, 16, 2024, 2, 3, 'VINExample16', '2024-01-01 00:00:00', 67945, NULL, NULL, NULL, 'Silver'),
(17, 17, 2021, 8, 3, 'VINExample19', '2023-01-01 00:00:00', 855662, NULL, NULL, NULL, 'Green'),
(18, 18, 2022, 3, 3, 'VINExample20', '2023-01-01 00:00:00', 34308, NULL, NULL, NULL, 'Blue'),
(19, 19, 2021, 8, 3, 'VINExample21', '2021-01-01 00:00:00', 91528, NULL, NULL, NULL, 'Orange'),
(20, 20, 2017, 8, 3, 'VINExample22', '2017-01-01 00:00:00', 47500, NULL, NULL, NULL, 'Black'),
(21, 21, 2024, 2, 3, 'VINExample23', '2024-01-01 00:00:00', 88050, NULL, NULL, NULL, 'Black'),
(22, 22, 2024, 2, 3, 'VINExample24', '2024-01-01 00:00:00', 26415, NULL, NULL, NULL, 'Black'),
(23, 23, 2024, 3, 3, 'VINExample27', '2024-01-01 00:00:00', 22030, NULL, NULL, NULL, 'Blue'),
(24, 24, 2025, 2, 3, 'VINExample28', '2025-01-01 00:00:00', 39895, NULL, NULL, NULL, 'Gray'),
(25, 25, 2021, 8, 2, 'VINExample29', '2021-01-01 00:00:00', 103900, NULL, NULL, NULL, 'Gray');

-- --------------------------------------------------------

--
-- Table structure for table `Vehicle_power_types`
--

CREATE TABLE `Vehicle_power_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Vehicle_power_types`
--

INSERT INTO `Vehicle_power_types` (`id`, `name`) VALUES
(1, 'Diesel'),
(2, 'Electric Vehicle'),
(3, 'Gasoline'),
(4, 'Hybrid');

-- --------------------------------------------------------

--
-- Table structure for table `Vehicle_types`
--

CREATE TABLE `Vehicle_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Vehicle_types`
--

INSERT INTO `Vehicle_types` (`id`, `name`) VALUES
(1, 'ATV'),
(8, 'Coupe'),
(4, 'Crossover'),
(3, 'Sedan'),
(2, 'SUV'),
(5, 'Truck'),
(6, 'Van'),
(7, 'Wagon');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Makes`
--
ALTER TABLE `Makes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_UNIQUE_MAKE_NAME` (`name`);

--
-- Indexes for table `Models`
--
ALTER TABLE `Models`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_UNIQUE_MODEL_NAME` (`name`),
  ADD KEY `IDX_MODEL_MAKE_ID` (`make_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `IDX_UNIQUE_USER_NAME` (`user_name`),
  ADD UNIQUE KEY `IDX_USER_EMAIL` (`email`),
  ADD KEY `IDX_USER_LAST_NAME` (`last_name`),
  ADD KEY `IDX_USER_FIRST_NAME` (`first_name`);

--
-- Indexes for table `Vehicles`
--
ALTER TABLE `Vehicles`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD KEY `IDX_VEHICLE_MODEL_ID` (`model_id`),
  ADD KEY `IDX_VEHICLE_TYPE_ID` (`vehicle_type_id`),
  ADD KEY `IDX_VEHICLE_POWER_TYPE_ID` (`vehicle_power_type_id`);

--
-- Indexes for table `Vehicle_power_types`
--
ALTER TABLE `Vehicle_power_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_UNIQUE_VEHICLE_POWER_TYPE_NAME` (`name`);

--
-- Indexes for table `Vehicle_types`
--
ALTER TABLE `Vehicle_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_UNIQUE_VEHICLE_TYPE_NAME` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Makes`
--
ALTER TABLE `Makes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `Models`
--
ALTER TABLE `Models`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Auto increment Primary key.', AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `Vehicles`
--
ALTER TABLE `Vehicles`
  MODIFY `vehicle_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `Vehicle_power_types`
--
ALTER TABLE `Vehicle_power_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Vehicle_types`
--
ALTER TABLE `Vehicle_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Models`
--
ALTER TABLE `Models`
  ADD CONSTRAINT `FK_MAKE_ID` FOREIGN KEY (`make_id`) REFERENCES `Makes` (`id`);

--
-- Constraints for table `Vehicles`
--
ALTER TABLE `Vehicles`
  ADD CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `Models` (`id`),
  ADD CONSTRAINT `vehicles_ibfk_2` FOREIGN KEY (`vehicle_type_id`) REFERENCES `Vehicle_types` (`id`),
  ADD CONSTRAINT `vehicles_ibfk_3` FOREIGN KEY (`vehicle_power_type_id`) REFERENCES `Vehicle_power_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
