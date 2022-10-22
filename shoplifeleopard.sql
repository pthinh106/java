-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2022 at 03:27 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoplifeleopard`
--

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(37);

-- --------------------------------------------------------

--
-- Table structure for table `table_accounts`
--

CREATE TABLE `table_accounts` (
  `Account_id` int(11) NOT NULL,
  `Username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Role_id` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date_create` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_accounts`
--

INSERT INTO `table_accounts` (`Account_id`, `Username`, `Password`, `Role_id`, `Status`, `Date_create`) VALUES
(1, 'admin_npt', '$2a$10$/m9GEuyxU966OmMa1YWUju.b2s3XUx0ZGu38S7CNrpxxfeR/QlPmC', 2, 1, NULL),
(2, 'user_npt', '$2a$10$/m9GEuyxU966OmMa1YWUju.b2s3XUx0ZGu38S7CNrpxxfeR/QlPmC', 1, 1, NULL),
(3, 'user_nhttm', '$2a$10$YhK4DI43pUQMuj0QGnzncOwgViMBACZKBSFa/s03cpZfrEf9jjREe', 1, 1, NULL),
(4, 'user_nntt', '$2a$10$/JgAMzqu7z4tEaNWtVQVVu8sv35W/pwLjrDkjpj.hrgXJoweomrsi', 1, 1, NULL),
(5, 'user_lvhn', '$2a$10$owcBO0Ie6Lf6m/dZknRIfOREz7vhE4Py/lnrFvItWDPmTGuVJHE1S', 1, 1, NULL),
(6, 'admin', '$2a$10$J0aLh3BEWKFdBhZaGhxQVOkHYoq8F8LY5VI3YcWZGcQmBNvs8/OKW', 2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `table_customer`
--

CREATE TABLE `table_customer` (
  `Customer_id` int(11) NOT NULL,
  `Account_id` int(11) NOT NULL,
  `First_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Birthday` date DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone_number` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_customer`
--

INSERT INTO `table_customer` (`Customer_id`, `Account_id`, `First_name`, `Last_name`, `Birthday`, `Email`, `Phone_number`, `Address`, `username`) VALUES
(1, 2, 'Nguyễn Phước', 'Thịnh', NULL, 'thinhit.nguyen@gmail.com', '09056*****', 'Việt Nam', NULL),
(2, 3, 'Nguyễn Huỳnh Thị Tuyết', 'My', NULL, 'myit.nguyen@gmail.com', '1234567890', 'Việt Nam', NULL),
(3, 4, 'Ngô Nguyễn Thanh', 'Tâm', NULL, 'tamit.nguyen@gmail.com', '1234567890', 'Việt Nam', NULL),
(4, 5, 'Lê Võ Huỳnh', 'Nga', '2002-01-01', 'nga.it@gmail.com', '01232312312', 'Việt Nam', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `table_departments`
--

CREATE TABLE `table_departments` (
  `Department_id` int(11) NOT NULL,
  `Department_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_departments`
--

INSERT INTO `table_departments` (`Department_id`, `Department_name`) VALUES
(1, '280 An Dương Vương');

-- --------------------------------------------------------

--
-- Table structure for table `table_employee`
--

CREATE TABLE `table_employee` (
  `Employee_id` int(11) NOT NULL,
  `Account_id` int(11) NOT NULL,
  `First_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Birthday` date DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone_number` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Department_id` int(11) NOT NULL,
  `Position_id` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date_create` date DEFAULT NULL,
  `Date_delete` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_employee`
--

INSERT INTO `table_employee` (`Employee_id`, `Account_id`, `First_name`, `Last_name`, `Birthday`, `Email`, `Phone_number`, `Address`, `Department_id`, `Position_id`, `Status`, `Date_create`, `Date_delete`) VALUES
(1, 1, 'Nguyễn Phước', 'Thịnh', NULL, 'thinhadmin@gmail.com', '0905633***', 'Điên Dương - Điện Bàn - Quảng Nam', 1, 2, 1, NULL, NULL),
(2, 6, 'admin', 'web', NULL, 'admin@gmail.com', '123456789', 'Viet Nam', 1, 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `table_position`
--

CREATE TABLE `table_position` (
  `Position_id` int(11) NOT NULL,
  `Position_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_position`
--

INSERT INTO `table_position` (`Position_id`, `Position_name`) VALUES
(1, 'Bảo Vệ'),
(2, 'Bán Hàng');

-- --------------------------------------------------------

--
-- Table structure for table `table_roles`
--

CREATE TABLE `table_roles` (
  `Role_id` int(11) NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_roles`
--

INSERT INTO `table_roles` (`Role_id`, `role_name`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_ADMIN');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `table_accounts`
--
ALTER TABLE `table_accounts`
  ADD PRIMARY KEY (`Account_id`),
  ADD UNIQUE KEY `User_name` (`Username`),
  ADD KEY `Role_id` (`Role_id`);

--
-- Indexes for table `table_customer`
--
ALTER TABLE `table_customer`
  ADD PRIMARY KEY (`Customer_id`),
  ADD UNIQUE KEY `Username` (`Account_id`);

--
-- Indexes for table `table_departments`
--
ALTER TABLE `table_departments`
  ADD PRIMARY KEY (`Department_id`);

--
-- Indexes for table `table_employee`
--
ALTER TABLE `table_employee`
  ADD PRIMARY KEY (`Employee_id`),
  ADD KEY `Department_id` (`Department_id`),
  ADD KEY `Position_id` (`Position_id`),
  ADD KEY `Account_id` (`Account_id`);

--
-- Indexes for table `table_position`
--
ALTER TABLE `table_position`
  ADD PRIMARY KEY (`Position_id`);

--
-- Indexes for table `table_roles`
--
ALTER TABLE `table_roles`
  ADD PRIMARY KEY (`Role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `table_accounts`
--
ALTER TABLE `table_accounts`
  MODIFY `Account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `table_customer`
--
ALTER TABLE `table_customer`
  MODIFY `Customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `table_departments`
--
ALTER TABLE `table_departments`
  MODIFY `Department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `table_employee`
--
ALTER TABLE `table_employee`
  MODIFY `Employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_position`
--
ALTER TABLE `table_position`
  MODIFY `Position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_roles`
--
ALTER TABLE `table_roles`
  MODIFY `Role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `table_accounts`
--
ALTER TABLE `table_accounts`
  ADD CONSTRAINT `table_accounts_ibfk_1` FOREIGN KEY (`Role_id`) REFERENCES `table_roles` (`Role_id`);

--
-- Constraints for table `table_customer`
--
ALTER TABLE `table_customer`
  ADD CONSTRAINT `table_customer_ibfk_1` FOREIGN KEY (`Account_id`) REFERENCES `table_accounts` (`Account_id`);

--
-- Constraints for table `table_employee`
--
ALTER TABLE `table_employee`
  ADD CONSTRAINT `table_employee_ibfk_1` FOREIGN KEY (`Department_id`) REFERENCES `table_departments` (`Department_id`),
  ADD CONSTRAINT `table_employee_ibfk_2` FOREIGN KEY (`Position_id`) REFERENCES `table_position` (`Position_id`),
  ADD CONSTRAINT `table_employee_ibfk_3` FOREIGN KEY (`Account_id`) REFERENCES `table_accounts` (`Account_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
