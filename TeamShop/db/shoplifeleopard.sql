-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2022 at 01:29 PM
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
    (12);

-- --------------------------------------------------------

--
-- Table structure for table `table_accounts`
--

CREATE TABLE `table_accounts` (
                                  `Account_id` int(11) NOT NULL,
                                  `Username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                  `Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                  `Role_id` int(11) NOT NULL,
                                  `Status` tinyint(4) NOT NULL,
                                  `Verification_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                                  `reset_pass_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                                  `Created` timestamp NOT NULL DEFAULT current_timestamp(),
                                  `Updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_accounts`
--

INSERT INTO `table_accounts` (`Account_id`, `Username`, `Password`, `Role_id`, `Status`, `Verification_code`, `reset_pass_code`, `Created`, `Updated`) VALUES
                                                                                                                                                           (1, 'admin_npt', '$2a$10$/m9GEuyxU966OmMa1YWUju.b2s3XUx0ZGu38S7CNrpxxfeR/QlPmC', 2, 1, '', NULL, '2022-11-05 15:25:38', '2022-11-05 15:18:02'),
                                                                                                                                                           (2, 'user_npt', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, '', NULL, '2022-11-05 15:25:38', '2022-11-07 11:27:58'),
                                                                                                                                                           (3, 'user_nhttm', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, '', NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:02'),
                                                                                                                                                           (4, 'user_nntt', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, '', NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:04'),
                                                                                                                                                           (5, 'user_lvhn', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, '', NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:06'),
                                                                                                                                                           (6, 'admin', '$2a$10$J0aLh3BEWKFdBhZaGhxQVOkHYoq8F8LY5VI3YcWZGcQmBNvs8/OKW', 2, 1, '', NULL, '2022-11-05 15:25:38', '2022-11-05 15:18:02'),
                                                                                                                                                           (7, 'test', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, '', NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:09'),
                                                                                                                                                           (14, 'testmail', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, NULL, NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:11'),
                                                                                                                                                           (15, 'adad', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, NULL, NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:12'),
                                                                                                                                                           (16, 'pthinhtest', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, NULL, NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:14'),
                                                                                                                                                           (17, 'thinhken106', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, NULL, NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:16');

-- --------------------------------------------------------

--
-- Table structure for table `table_category`
--

CREATE TABLE `table_category` (
                                  `Category_id` int(11) NOT NULL,
                                  `Category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_category`
--

INSERT INTO `table_category` (`Category_id`, `Category_name`) VALUES
                                                                  (1, 'Women'),
                                                                  (2, 'Men'),
                                                                  (3, 'Bag'),
                                                                  (4, 'Shoes'),
                                                                  (5, 'Watches');

-- --------------------------------------------------------

--
-- Table structure for table `table_customer`
--

CREATE TABLE `table_customer` (
                                  `Customer_id` int(11) NOT NULL,
                                  `Account_id` int(11) NOT NULL,
                                  `First_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                  `Last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                  `Birthday` date DEFAULT NULL,
                                  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                  `Phone_number` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
                                  `Address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                  `Created` timestamp NOT NULL DEFAULT current_timestamp(),
                                  `Updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_customer`
--

INSERT INTO `table_customer` (`Customer_id`, `Account_id`, `First_name`, `Last_name`, `Birthday`, `Email`, `Phone_number`, `Address`, `Created`, `Updated`) VALUES
                                                                                                                                                                (1, 2, 'Nguyễn Phước', 'Thịnh', NULL, 'thinhit1.nguyen@gmail.com', '09056*****', 'Việt Nam', '2022-11-05 15:18:33', '2022-11-05 15:18:33'),
                                                                                                                                                                (2, 3, 'Nguyễn Huỳnh Thị Tuyết', 'My', NULL, 'myit.nguyen@gmail.com', '1234567890', 'Việt Nam', '2022-11-05 15:18:33', '2022-11-05 15:18:33'),
                                                                                                                                                                (3, 4, 'Ngô Nguyễn Thanh', 'Tâm', NULL, 'tamit.nguyen@gmail.com', '1234567890', 'Việt Nam', '2022-11-05 15:18:33', '2022-11-05 15:18:33'),
                                                                                                                                                                (4, 5, 'Lê Võ Huỳnh', 'Nga', '2002-01-01', 'nga.it@gmail.com', '01232312312', 'Việt Nam', '2022-11-05 15:18:33', '2022-11-05 15:18:33'),
                                                                                                                                                                (5, 7, 'Nguyễn Phước', 'Thịnh', '2022-11-02', 'thinhit2.nguyen@gmail.com', '0123456789', 'aa', '2022-11-05 15:18:33', '2022-11-05 15:18:33'),
                                                                                                                                                                (6, 14, 'Nguyen', 'Thinh', '2022-11-08', 'thinhit3.nguyen@gmail.com', '12345678', 'adadad', '2022-11-05 15:18:33', '2022-11-05 15:18:33'),
                                                                                                                                                                (7, 15, 'th', 'dsa', '2022-11-08', 'thinhit4.nguyen@gmail.com', '123123', '213213', '2022-11-05 15:18:33', '2022-11-05 15:18:33'),
                                                                                                                                                                (8, 16, 'Nguyen Phuoc ', 'Thinh', '2022-11-03', 'thinhit.nguyen@gmail.com', '1234567890', 'Quang Nam', '2022-11-05 15:18:33', '2022-11-05 15:18:33'),
                                                                                                                                                                (9, 17, 'Nguyen', 'Thinh', '2022-11-14', 'thinhken106@gmail.com', '1234567890', 'Quang Nam', '2022-11-05 15:18:33', '2022-11-05 15:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `table_departments`
--

CREATE TABLE `table_departments` (
                                     `Department_id` int(11) NOT NULL,
                                     `Department_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                     `Created` timestamp NOT NULL DEFAULT current_timestamp(),
                                     `Updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_departments`
--

INSERT INTO `table_departments` (`Department_id`, `Department_name`, `Created`, `Updated`) VALUES
    (1, '280 An Dương Vương', '2022-11-05 15:19:08', '2022-11-05 15:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `table_employee`
--

CREATE TABLE `table_employee` (
                                  `Employee_id` int(11) NOT NULL,
                                  `Account_id` int(11) NOT NULL,
                                  `First_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                  `Last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                  `Birthday` date DEFAULT NULL,
                                  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                  `Phone_number` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
                                  `Address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                  `Department_id` int(11) NOT NULL,
                                  `Position_id` int(11) NOT NULL,
                                  `Status` int(11) NOT NULL,
                                  `Created` timestamp NOT NULL DEFAULT current_timestamp(),
                                  `Updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_employee`
--

INSERT INTO `table_employee` (`Employee_id`, `Account_id`, `First_name`, `Last_name`, `Birthday`, `Email`, `Phone_number`, `Address`, `Department_id`, `Position_id`, `Status`, `Created`, `Updated`) VALUES
                                                                                                                                                                                                          (1, 1, 'Nguyễn Phước', 'Thịnh', NULL, 'thinhadmin@gmail.com', '0905633***', 'Điên Dương - Điện Bàn - Quảng Nam', 1, 2, 1, '2022-11-05 15:26:00', '2022-11-05 15:26:00'),
                                                                                                                                                                                                          (2, 6, 'admin', 'web', NULL, 'admin@gmail.com', '123456789', 'Viet Nam', 1, 2, 1, '2022-11-05 15:26:00', '2022-11-05 15:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `table_order`
--

CREATE TABLE `table_order` (
                               `Order_id` int(11) NOT NULL,
                               `Customer_id` int(11) NOT NULL,
                               `First_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                               `Last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                               `Phone_numer` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
                               `Address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                               `Total` double NOT NULL,
                               `Payment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                               `Payment_status` tinyint(4) NOT NULL DEFAULT 0,
                               `Status` int(11) NOT NULL,
                               `Created` timestamp NOT NULL DEFAULT current_timestamp(),
                               `Updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_position`
--

CREATE TABLE `table_position` (
                                  `Position_id` int(11) NOT NULL,
                                  `Position_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_position`
--

INSERT INTO `table_position` (`Position_id`, `Position_name`) VALUES
                                                                  (1, 'Bảo Vệ'),
                                                                  (2, 'Bán Hàng');

-- --------------------------------------------------------

--
-- Table structure for table `table_products`
--

CREATE TABLE `table_products` (
                                  `Product_id` int(11) NOT NULL,
                                  `Category_id` int(11) NOT NULL,
                                  `Product_type` int(11) DEFAULT NULL,
                                  `Product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                  `Product_images_preview` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
                                  `Short_description` text COLLATE utf8_unicode_ci NOT NULL,
                                  `description` text COLLATE utf8_unicode_ci NOT NULL,
                                  `Quantity` int(11) NOT NULL,
                                  `Status` tinyint(4) NOT NULL,
                                  `Created` timestamp NOT NULL DEFAULT current_timestamp(),
                                  `Updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_images`
--

CREATE TABLE `table_product_images` (
                                        `Product_images_id` int(11) NOT NULL,
                                        `Product_id` int(11) NOT NULL,
                                        `Product_imgaes_url` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
                                        `Created` timestamp NOT NULL DEFAULT current_timestamp(),
                                        `Updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_order`
--

CREATE TABLE `table_product_order` (
                                       `Product_Order_id` int(11) NOT NULL,
                                       `Order_id` int(11) NOT NULL,
                                       `Product_id` int(11) NOT NULL,
                                       `Quantity` int(11) NOT NULL,
                                       `Price` int(11) NOT NULL,
                                       `Created` timestamp NOT NULL DEFAULT current_timestamp(),
                                       `Updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_size`
--

CREATE TABLE `table_product_size` (
                                      `Product_Size_id` int(11) NOT NULL,
                                      `Product_id` int(11) NOT NULL,
                                      `Size_id` int(11) NOT NULL,
                                      `Quantity` int(11) NOT NULL,
                                      `Price` int(11) NOT NULL,
                                      `Status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_type`
--

CREATE TABLE `table_product_type` (
                                      `Type_id` int(11) NOT NULL,
                                      `Type_name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_roles`
--

CREATE TABLE `table_roles` (
                               `Role_id` int(11) NOT NULL,
                               `role_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_roles`
--

INSERT INTO `table_roles` (`Role_id`, `role_name`) VALUES
                                                       (1, 'ROLE_USER'),
                                                       (2, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `table_size`
--

CREATE TABLE `table_size` (
                              `Size_id` int(11) NOT NULL,
                              `Size_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                              `Created` timestamp NOT NULL DEFAULT current_timestamp(),
                              `Updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_size`
--

INSERT INTO `table_size` (`Size_id`, `Size_name`, `Created`, `Updated`) VALUES
                                                                            (1, 'Size S', '2022-11-06 05:44:00', '2022-11-06 08:17:11'),
                                                                            (2, 'Size M', '2022-11-06 05:44:00', '2022-11-06 08:17:14'),
                                                                            (3, 'Size L', '2022-11-06 05:44:00', '2022-11-06 08:17:18'),
                                                                            (4, 'Size XL', '2022-11-06 05:44:00', '2022-11-06 08:17:22');

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
-- Indexes for table `table_category`
--
ALTER TABLE `table_category`
    ADD PRIMARY KEY (`Category_id`);

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
-- Indexes for table `table_order`
--
ALTER TABLE `table_order`
    ADD PRIMARY KEY (`Order_id`);

--
-- Indexes for table `table_position`
--
ALTER TABLE `table_position`
    ADD PRIMARY KEY (`Position_id`);

--
-- Indexes for table `table_products`
--
ALTER TABLE `table_products`
    ADD PRIMARY KEY (`Product_id`),
  ADD KEY `FKqurjuqo4fo8qbk0x7ygtmxvby` (`Category_id`);

--
-- Indexes for table `table_product_images`
--
ALTER TABLE `table_product_images`
    ADD PRIMARY KEY (`Product_images_id`),
  ADD KEY `FKner637g99t8cybonraf640soc` (`Product_id`);

--
-- Indexes for table `table_product_order`
--
ALTER TABLE `table_product_order`
    ADD PRIMARY KEY (`Product_Order_id`);

--
-- Indexes for table `table_product_size`
--
ALTER TABLE `table_product_size`
    ADD PRIMARY KEY (`Product_Size_id`),
  ADD KEY `Size_id` (`Size_id`),
  ADD KEY `Product_id` (`Product_id`);

--
-- Indexes for table `table_product_type`
--
ALTER TABLE `table_product_type`
    ADD PRIMARY KEY (`Type_id`);

--
-- Indexes for table `table_roles`
--
ALTER TABLE `table_roles`
    ADD PRIMARY KEY (`Role_id`);

--
-- Indexes for table `table_size`
--
ALTER TABLE `table_size`
    ADD PRIMARY KEY (`Size_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `table_accounts`
--
ALTER TABLE `table_accounts`
    MODIFY `Account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `table_category`
--
ALTER TABLE `table_category`
    MODIFY `Category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `table_customer`
--
ALTER TABLE `table_customer`
    MODIFY `Customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- AUTO_INCREMENT for table `table_order`
--
ALTER TABLE `table_order`
    MODIFY `Order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_position`
--
ALTER TABLE `table_position`
    MODIFY `Position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_products`
--
ALTER TABLE `table_products`
    MODIFY `Product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_product_images`
--
ALTER TABLE `table_product_images`
    MODIFY `Product_images_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_product_order`
--
ALTER TABLE `table_product_order`
    MODIFY `Product_Order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_product_size`
--
ALTER TABLE `table_product_size`
    MODIFY `Product_Size_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_product_type`
--
ALTER TABLE `table_product_type`
    MODIFY `Type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_roles`
--
ALTER TABLE `table_roles`
    MODIFY `Role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_size`
--
ALTER TABLE `table_size`
    MODIFY `Size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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

--
-- Constraints for table `table_products`
--
ALTER TABLE `table_products`
    ADD CONSTRAINT `FKqurjuqo4fo8qbk0x7ygtmxvby` FOREIGN KEY (`Category_id`) REFERENCES `table_category` (`Category_id`);

--
-- Constraints for table `table_product_images`
--
ALTER TABLE `table_product_images`
    ADD CONSTRAINT `FKner637g99t8cybonraf640soc` FOREIGN KEY (`Product_id`) REFERENCES `table_products` (`Product_id`);

--
-- Constraints for table `table_product_size`
--
ALTER TABLE `table_product_size`
    ADD CONSTRAINT `table_product_size_ibfk_2` FOREIGN KEY (`Size_id`) REFERENCES `table_size` (`Size_id`),
  ADD CONSTRAINT `table_product_size_ibfk_3` FOREIGN KEY (`Product_id`) REFERENCES `table_products` (`Product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
