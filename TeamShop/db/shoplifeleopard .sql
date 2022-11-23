-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2022 at 04:36 AM
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
-- Table structure for table `table_about`
--

CREATE TABLE `table_about` (
                               `about_id` tinyint(4) NOT NULL,
                               `about_title` text COLLATE utf8_unicode_ci NOT NULL,
                               `about_sub` text COLLATE utf8_unicode_ci NOT NULL,
                               `about_topic` text COLLATE utf8_unicode_ci NOT NULL,
                               `about_img` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
                               `name` text COLLATE utf8_unicode_ci NOT NULL,
                               `status` tinyint(4) NOT NULL,
                               `Created` timestamp NOT NULL DEFAULT current_timestamp(),
                               `Updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_about`
--

INSERT INTO `table_about` (`about_id`, `about_title`, `about_sub`, `about_topic`, `about_img`, `name`, `status`, `Created`, `Updated`) VALUES
    (1, 'Our Mission', 'Mauris non lacinia magna. Sed nec lobortis dolor. Vestibulum rhoncus dignissim risus, sed consectetur erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam maximus mauris sit amet odio convallis, in pharetra magna gravida. Praesent sed nunc fermentum mi molestie tempor. Morbi vitae viverra odio. Pellentesque ac velit egestas, luctus arcu non, laoreet mauris. Sed in ipsum tempor, consequat odio in, porttitor ante. Ut mauris ligula, volutpat in sodales in, porta non odio. Pellentesque tempor urna vitae mi vestibulum, nec venenatis nulla lobortis. Proin at gravida ante. Mauris auctor purus at lacus maximus euismod. Pellentesque vulputate massa ut nisl hendrerit, eget elementum libero iaculis.', 'Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they didn\'t really do it, they just saw something. It seemed obvious to them after a while.', '/images/about-02.jpg', 'Steve Job’s', 1, '2022-11-22 10:16:37', '2022-11-22 17:19:17'),
(2, 'Our Mission 2', 'Mauris non lacinia magna. Sed nec lobortis dolor. Vestibulum rhoncus dignissim risus, sed consectetur erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam maximus mauris sit amet odio convallis, in pharetra magna gravida. Praesent sed nunc fermentum mi molestie tempor. Morbi vitae viverra odio. Pellentesque ac velit egestas, luctus arcu non, laoreet mauris. Sed in ipsum tempor, consequat odio in, porttitor ante. Ut mauris ligula, volutpat in sodales in, porta non odio. Pellentesque tempor urna vitae mi vestibulum, nec venenatis nulla lobortis. Proin at gravida ante. Mauris auctor purus at lacus maximus euismod. Pellentesque vulputate massa ut nisl hendrerit, eget elementum libero iaculis.', 'Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they didn\'t really do it, they just saw something. It seemed obvious to them after a while.', '/images/about-02.jpg', 'Steve Job’s', 1, '2022-11-22 10:16:37', '2022-11-22 18:30:10');

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
                                                                                                                                                           (1, 'admin_npt', '$2a$10$7ugsFRhLD3RUJ3pMpdtG.OZFnFz4a83R6XAVgdbEUwxyWEyNDM4QK', 2, 1, '', NULL, '2022-11-05 15:25:38', '2022-11-16 21:21:55'),
                                                                                                                                                           (2, 'user_npt', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, '', NULL, '2022-11-05 15:25:38', '2022-11-07 11:27:58'),
                                                                                                                                                           (3, 'user_nhttm', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, '', NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:02'),
                                                                                                                                                           (4, 'user_nntt', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, '', NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:04'),
                                                                                                                                                           (5, 'user_lvhn', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, '', NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:06'),
                                                                                                                                                           (6, 'admin', '$2a$10$J0aLh3BEWKFdBhZaGhxQVOkHYoq8F8LY5VI3YcWZGcQmBNvs8/OKW', 2, 1, '', NULL, '2022-11-05 15:25:38', '2022-11-05 15:18:02'),
                                                                                                                                                           (7, 'test', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, '', NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:09'),
                                                                                                                                                           (14, 'testmail', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, NULL, NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:11'),
                                                                                                                                                           (15, 'adad', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, NULL, NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:12'),
                                                                                                                                                           (17, 'thinhken106', '$2a$10$GixiwoIjaryBJJhTzKy64eOYZvTha3PxXSNeXMmfjVIfPfFcNx/rC', 1, 1, NULL, NULL, '2022-11-05 15:25:38', '2022-11-07 11:28:16');

-- --------------------------------------------------------

--
-- Table structure for table `table_category`
--

CREATE TABLE `table_category` (
                                  `Category_id` int(11) NOT NULL,
                                  `Category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                  `category_img` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
                                  `status` tinyint(4) NOT NULL,
                                  `Created` datetime NOT NULL DEFAULT current_timestamp(),
                                  `Updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_category`
--

INSERT INTO `table_category` (`Category_id`, `Category_name`, `category_img`, `status`, `Created`, `Updated`) VALUES
                                                                                                                  (1, 'Bag', '', 0, '2022-11-22 17:54:40', '2022-11-22 10:54:40'),
                                                                                                                  (2, 'Shoes', '', 0, '2022-11-22 17:54:40', '2022-11-22 10:54:40'),
                                                                                                                  (3, 'Watches', '', 0, '2022-11-22 17:54:40', '2022-11-22 10:54:40'),
                                                                                                                  (4, 'Men\'s Shirt', '', 0, '2022-11-22 17:54:40', '2022-11-22 10:54:40'),
(5, 'T-Shirt', '', 0, '2022-11-22 17:54:40', '2022-11-22 10:54:40'),
(6, 'Skirts', '', 0, '2022-11-22 17:54:40', '2022-11-22 10:54:40'),
(7, 'Pants', '', 0, '2022-11-22 17:54:40', '2022-11-22 10:54:40'),
(8, 'Women\'s Shirt', '', 0, '2022-11-22 17:54:40', '2022-11-22 10:54:40'),
                                                                                                                  (9, 'Men\'s Pants', '', 0, '2022-11-22 17:54:40', '2022-11-22 10:54:40'),
(10, 'Women\'s Pants', '', 0, '2022-11-22 17:54:40', '2022-11-22 10:54:40'),
                                                                                                                  (11, 'Men\'s Clothes', '', 0, '2022-11-22 17:54:40', '2022-11-22 10:54:40'),
(12, 'Women\'s Clothes', '', 0, '2022-11-22 17:54:40', '2022-11-22 10:54:40');

-- --------------------------------------------------------

--
-- Table structure for table `table_contact`
--

CREATE TABLE `table_contact` (
                                 `contact_id` int(11) NOT NULL,
                                 `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                 `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
                                 `email_sup` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                                 `status` tinyint(11) NOT NULL,
                                 `Created` timestamp NOT NULL DEFAULT current_timestamp(),
                                 `Updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_contact`
--

INSERT INTO `table_contact` (`contact_id`, `address`, `phone_number`, `email_sup`, `status`, `Created`, `Updated`) VALUES
    (1, '280, An Duong Vuong, Ward 4, District 5, Ho Chi Minh City', '+84 99 111 1114', 'lifeleopard.contact@gmail.com', 1, '2022-11-22 09:52:25', '2022-11-22 10:04:58');

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
                                                                                                                                                                (1, 2, 'Nguyễn Phước', 'Thịnh', '2002-06-10', 'thinhit1.nguyen@gmail.com', '09056*****', 'Việt Nam', '2022-11-05 15:18:33', '2022-11-22 19:23:14'),
                                                                                                                                                                (2, 3, 'Nguyễn Huỳnh Thị Tuyết', 'My', NULL, 'myit.nguyen@gmail.com', '1234567890', 'Việt Nam', '2022-11-05 15:18:33', '2022-11-05 15:18:33'),
                                                                                                                                                                (3, 4, 'Ngô Nguyễn Thanh', 'Tâm', NULL, 'tamit.nguyen@gmail.com', '1234567890', 'Việt Nam', '2022-11-05 15:18:33', '2022-11-05 15:18:33'),
                                                                                                                                                                (4, 5, 'Lê Võ Huỳnh', 'Nga', '2002-01-01', 'nga.it@gmail.com', '01232312312', 'Việt Nam', '2022-11-05 15:18:33', '2022-11-05 15:18:33'),
                                                                                                                                                                (5, 7, 'Nguyễn Phước', 'Thịnh', '2022-11-02', 'thinhit2.nguyen@gmail.com', '0123456789', 'aa', '2022-11-05 15:18:33', '2022-11-05 15:18:33'),
                                                                                                                                                                (6, 14, 'Nguyen', 'Thinh', '2022-11-08', 'thinhit3.nguyen@gmail.com', '12345678', 'adadad', '2022-11-05 15:18:33', '2022-11-05 15:18:33'),
                                                                                                                                                                (7, 15, 'th', 'dsa', '2022-11-08', 'thinhit4.nguyen@gmail.com', '123123', '213213', '2022-11-05 15:18:33', '2022-11-05 15:18:33'),
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
-- Table structure for table `table_event`
--

CREATE TABLE `table_event` (
                               `event_id` tinyint(4) NOT NULL,
                               `event_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                               `event_topic` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
                               `event_img` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
                               `list_product_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                               `status` int(11) NOT NULL,
                               `Created` datetime NOT NULL DEFAULT current_timestamp(),
                               `Updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_event`
--

INSERT INTO `table_event` (`event_id`, `event_name`, `event_topic`, `event_img`, `list_product_id`, `status`, `Created`, `Updated`) VALUES
                                                                                                                                        (1, 'Women', 'Spring 2018', '/images/banner-01.jpg', '1,2,3,4', 1, '2022-11-22 23:34:27', '2022-11-23 00:53:54'),
                                                                                                                                        (2, 'Men', 'Spring 2018', '/images/banner-02.jpg', '5,6,7,8', 1, '2022-11-22 23:34:27', '2022-11-22 23:45:58'),
                                                                                                                                        (3, 'Accessories', 'New Trend', '/images/banner-03.jpg', '9,11,12,13', 1, '2022-11-22 23:34:27', '2022-11-22 23:46:12'),
                                                                                                                                        (4, 'Accessories 2 ', 'New Trend 2', '/images/banner-03.jpg', '13,14,15,16', 1, '2022-11-22 23:34:27', '2022-11-22 23:45:38');

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

--
-- Dumping data for table `table_order`
--

INSERT INTO `table_order` (`Order_id`, `Customer_id`, `First_name`, `Last_name`, `Phone_numer`, `Address`, `Total`, `Payment`, `Payment_status`, `Status`, `Created`, `Updated`) VALUES
                                                                                                                                                                                     (1, 2, 'Nguyễn', 'My', '0123455612', 'Lạc Long Quân', 165000, '', 1, 0, '2022-11-09 16:36:08', '2022-11-09 16:36:08'),
                                                                                                                                                                                     (2, 4, 'Không', 'Biết', '0123455612', 'không biết luôn', 75000, '', 1, 1, '2022-11-09 16:37:55', '2022-11-09 16:37:55');

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
                                  `pirce_preview` double NOT NULL,
                                  `Weight` double DEFAULT NULL,
                                  `Dimensions` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
                                  `Materials` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
                                  `Created` timestamp NOT NULL DEFAULT current_timestamp(),
                                  `Updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_products`
--

INSERT INTO `table_products` (`Product_id`, `Category_id`, `Product_type`, `Product_name`, `Product_images_preview`, `Short_description`, `description`, `Quantity`, `Status`, `pirce_preview`, `Weight`, `Dimensions`, `Materials`, `Created`, `Updated`) VALUES
                                                                                                                                                                                                                                                               (1, 1, NULL, 'Esprit Ruffle Shirt', '/images/product/1/mjKaBosfIm20221122144746.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 11, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:47:46', '2022-11-22 19:01:13'),
                                                                                                                                                                                                                                                               (2, 8, NULL, 'Herschel supply', '/images/product/2/Zbq5TMGBVC20221122144924.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.', 11, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:49:24', '2022-11-22 19:01:13'),
                                                                                                                                                                                                                                                               (3, 8, NULL, 'Classic Trench Coat', '/images/product/3/1T2WV7XN8G20221122144957.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.', 11, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:49:57', '2022-11-22 19:01:13'),
                                                                                                                                                                                                                                                               (4, 1, NULL, 'Front Pocket Jumper', '/images/product/4/649Y4zN5fE20221122145018.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.', 11, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:50:18', '2022-11-22 19:01:13'),
                                                                                                                                                                                                                                                               (5, 8, NULL, 'Shirt in Stretch Cotton', '/images/product/5/TeI9Q5Rwoi20221122145043.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.', 111, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:50:43', '2022-11-22 19:01:13'),
                                                                                                                                                                                                                                                               (6, 8, NULL, 'Pieces Metallic Printed', '/images/product/6/2xlWshQPuH20221122145114.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.', 10, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:51:14', '2022-11-22 19:01:13'),
                                                                                                                                                                                                                                                               (7, 8, NULL, 'Femme T-Shirt In Stripe', '/images/product/7/fNuOzk5zYc20221122145138.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.', 11, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:51:38', '2022-11-22 19:01:13'),
                                                                                                                                                                                                                                                               (8, 1, NULL, 'T-Shirt with Sleeve', '/images/product/8/nyotICI7IV20221122145159.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.', 111, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:51:59', '2022-11-22 19:01:13'),
                                                                                                                                                                                                                                                               (9, 1, NULL, 'Pretty Little Thing', '/images/product/9/mNX3qGS3wF20221122145215.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.', 111, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:52:15', '2022-11-22 19:01:13'),
                                                                                                                                                                                                                                                               (10, 1, NULL, 'Square Neck Back', '/images/product/10/zmJxrBV6KD20221122145245.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.', 11, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:52:45', '2022-11-22 19:01:13'),
                                                                                                                                                                                                                                                               (11, 1, NULL, 'Only Check Trouser', '/images/product/11/FRw9GBf1ba20221122145319.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.', 11, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:53:19', '2022-11-22 19:01:13'),
                                                                                                                                                                                                                                                               (12, 1, NULL, 'Herschel supply', '/images/product/12/JIlCprLGXQ20221122145345.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.', 11, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:53:45', '2022-11-22 19:01:13'),
                                                                                                                                                                                                                                                               (13, 2, NULL, 'Converse All Star Hi Plimsolls', '/images/product/13/9d571X4mF120221122145638.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.', 11, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:54:13', '2022-11-22 19:01:39'),
                                                                                                                                                                                                                                                               (14, 3, NULL, 'Vintage Inspired Classic', '/images/product/14/EKcrmpw1H720221122145446.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.', 11, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:54:46', '2022-11-22 19:01:39'),
                                                                                                                                                                                                                                                               (15, 1, NULL, 'Mini Silver Mesh Watch', '/images/product/15/OgPIGZzdZ320221122174918.jpg', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.', 111, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 07:55:16', '2022-11-22 19:01:39'),
                                                                                                                                                                                                                                                               (16, 11, NULL, 'Unisex Teelab Signature Windbreaker', '/images/product/16/P7PnbjzVJq20221122185458.PNG', 'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 'Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.\r\n', 1111, 1, 100000, 79, '110 x 33 x 100 cm', '60% cotton', '2022-11-22 11:54:58', '2022-11-22 19:01:39');

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

--
-- Dumping data for table `table_product_images`
--

INSERT INTO `table_product_images` (`Product_images_id`, `Product_id`, `Product_imgaes_url`, `Created`, `Updated`) VALUES
                                                                                                                       (1, 1, '/images/product/1/mjKaBosfIm20221122144746.jpg', '2022-11-22 07:47:46', '2022-11-22 07:47:46'),
                                                                                                                       (2, 2, '/images/product/2/Zbq5TMGBVC20221122144924.jpg', '2022-11-22 07:49:24', '2022-11-22 07:49:24'),
                                                                                                                       (3, 3, '/images/product/3/1T2WV7XN8G20221122144957.jpg', '2022-11-22 07:49:57', '2022-11-22 07:49:57'),
                                                                                                                       (4, 4, '/images/product/4/649Y4zN5fE20221122145018.jpg', '2022-11-22 07:50:18', '2022-11-22 07:50:18'),
                                                                                                                       (5, 5, '/images/product/5/TeI9Q5Rwoi20221122145043.jpg', '2022-11-22 07:50:43', '2022-11-22 07:50:43'),
                                                                                                                       (6, 6, '/images/product/6/2xlWshQPuH20221122145114.jpg', '2022-11-22 07:51:14', '2022-11-22 07:51:14'),
                                                                                                                       (7, 7, '/images/product/7/fNuOzk5zYc20221122145138.jpg', '2022-11-22 07:51:38', '2022-11-22 07:51:38'),
                                                                                                                       (8, 8, '/images/product/8/nyotICI7IV20221122145159.jpg', '2022-11-22 07:51:59', '2022-11-22 07:51:59'),
                                                                                                                       (9, 9, '/images/product/9/mNX3qGS3wF20221122145215.jpg', '2022-11-22 07:52:15', '2022-11-22 07:52:15'),
                                                                                                                       (10, 10, '/images/product/10/zmJxrBV6KD20221122145245.jpg', '2022-11-22 07:52:45', '2022-11-22 07:52:45'),
                                                                                                                       (11, 11, '/images/product/11/FRw9GBf1ba20221122145319.jpg', '2022-11-22 07:53:19', '2022-11-22 07:53:19'),
                                                                                                                       (12, 12, '/images/product/12/JIlCprLGXQ20221122145345.jpg', '2022-11-22 07:53:45', '2022-11-22 07:53:45'),
                                                                                                                       (13, 13, '/images/product/13/9d571X4mF120221122145638.jpg', '2022-11-22 07:54:13', '2022-11-22 07:56:38'),
                                                                                                                       (14, 14, '/images/product/14/EKcrmpw1H720221122145446.jpg', '2022-11-22 07:54:46', '2022-11-22 07:54:46'),
                                                                                                                       (15, 15, '/images/product/15/OgPIGZzdZ320221122174918.jpg', '2022-11-22 07:55:16', '2022-11-22 10:49:18'),
                                                                                                                       (16, 16, '/images/product/16/P7PnbjzVJq20221122185458.PNG', '2022-11-22 11:54:58', '2022-11-22 11:54:58');

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

--
-- Dumping data for table `table_product_order`
--

INSERT INTO `table_product_order` (`Product_Order_id`, `Order_id`, `Product_id`, `Quantity`, `Price`, `Created`, `Updated`) VALUES
                                                                                                                                (1, 1, 2, 1, 190000, '2022-11-09 17:40:56', '2022-11-09 17:43:27'),
                                                                                                                                (2, 2, 4, 1, 190000, '2022-11-09 17:44:38', '2022-11-09 17:44:38');

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

--
-- Dumping data for table `table_product_size`
--

INSERT INTO `table_product_size` (`Product_Size_id`, `Product_id`, `Size_id`, `Quantity`, `Price`, `Status`) VALUES
                                                                                                                 (1, 1, 1, 11, 122000, 1),
                                                                                                                 (2, 1, 2, 11, 122000, 1),
                                                                                                                 (3, 1, 3, 0, 0, 0),
                                                                                                                 (4, 1, 4, 11, 122000, 1),
                                                                                                                 (5, 1, 5, 0, 0, 0),
                                                                                                                 (6, 1, 6, 0, 0, 0),
                                                                                                                 (7, 1, 7, 0, 0, 0),
                                                                                                                 (8, 2, 1, 11, 1222, 1),
                                                                                                                 (9, 2, 2, 11, 1222, 1),
                                                                                                                 (10, 2, 3, 11, 0, 1),
                                                                                                                 (11, 2, 4, 11, 1222, 1),
                                                                                                                 (12, 2, 5, 0, 0, 0),
                                                                                                                 (13, 2, 6, 0, 0, 0),
                                                                                                                 (14, 2, 7, 0, 0, 0),
                                                                                                                 (15, 3, 1, 0, 0, 0),
                                                                                                                 (16, 3, 2, 0, 0, 0),
                                                                                                                 (17, 3, 3, 0, 0, 0),
                                                                                                                 (18, 3, 4, 0, 0, 0),
                                                                                                                 (19, 3, 5, 0, 0, 0),
                                                                                                                 (20, 3, 6, 0, 0, 0),
                                                                                                                 (21, 3, 7, 0, 0, 0),
                                                                                                                 (22, 4, 1, 0, 0, 0),
                                                                                                                 (23, 4, 2, 0, 0, 0),
                                                                                                                 (24, 4, 3, 0, 0, 0),
                                                                                                                 (25, 4, 4, 0, 0, 0),
                                                                                                                 (26, 4, 5, 0, 0, 0),
                                                                                                                 (27, 4, 6, 0, 0, 0),
                                                                                                                 (28, 4, 7, 0, 0, 0),
                                                                                                                 (29, 5, 1, 0, 0, 0),
                                                                                                                 (30, 5, 2, 0, 0, 0),
                                                                                                                 (31, 5, 3, 0, 0, 0),
                                                                                                                 (32, 5, 4, 0, 0, 0),
                                                                                                                 (33, 5, 5, 0, 0, 0),
                                                                                                                 (34, 5, 6, 0, 0, 0),
                                                                                                                 (35, 5, 7, 0, 0, 0),
                                                                                                                 (36, 6, 1, 0, 0, 0),
                                                                                                                 (37, 6, 2, 0, 0, 0),
                                                                                                                 (38, 6, 3, 0, 0, 0),
                                                                                                                 (39, 6, 4, 0, 0, 0),
                                                                                                                 (40, 6, 5, 0, 0, 0),
                                                                                                                 (41, 6, 6, 0, 0, 0),
                                                                                                                 (42, 6, 7, 0, 0, 0),
                                                                                                                 (43, 7, 1, 0, 0, 0),
                                                                                                                 (44, 7, 2, 0, 0, 0),
                                                                                                                 (45, 7, 3, 0, 0, 0),
                                                                                                                 (46, 7, 4, 0, 0, 0),
                                                                                                                 (47, 7, 5, 0, 0, 0),
                                                                                                                 (48, 7, 6, 0, 0, 0),
                                                                                                                 (49, 7, 7, 0, 0, 0),
                                                                                                                 (50, 8, 1, 0, 0, 0),
                                                                                                                 (51, 8, 2, 0, 0, 0),
                                                                                                                 (52, 8, 3, 0, 0, 0),
                                                                                                                 (53, 8, 4, 0, 0, 0),
                                                                                                                 (54, 8, 5, 0, 0, 0),
                                                                                                                 (55, 8, 6, 0, 0, 0),
                                                                                                                 (56, 8, 7, 0, 0, 0),
                                                                                                                 (57, 9, 1, 0, 0, 0),
                                                                                                                 (58, 9, 2, 0, 0, 0),
                                                                                                                 (59, 9, 3, 0, 0, 0),
                                                                                                                 (60, 9, 4, 0, 0, 0),
                                                                                                                 (61, 9, 5, 0, 0, 0),
                                                                                                                 (62, 9, 6, 0, 0, 0),
                                                                                                                 (63, 9, 7, 0, 0, 0),
                                                                                                                 (64, 10, 1, 0, 0, 0),
                                                                                                                 (65, 10, 2, 0, 0, 0),
                                                                                                                 (66, 10, 3, 0, 0, 0),
                                                                                                                 (67, 10, 4, 0, 0, 0),
                                                                                                                 (68, 10, 5, 0, 0, 0),
                                                                                                                 (69, 10, 6, 0, 0, 0),
                                                                                                                 (70, 10, 7, 0, 0, 0),
                                                                                                                 (71, 11, 1, 0, 0, 0),
                                                                                                                 (72, 11, 2, 0, 0, 0),
                                                                                                                 (73, 11, 3, 0, 0, 0),
                                                                                                                 (74, 11, 4, 0, 0, 0),
                                                                                                                 (75, 11, 5, 0, 0, 0),
                                                                                                                 (76, 11, 6, 0, 0, 0),
                                                                                                                 (77, 11, 7, 0, 0, 0),
                                                                                                                 (78, 12, 1, 0, 0, 0),
                                                                                                                 (79, 12, 2, 0, 0, 0),
                                                                                                                 (80, 12, 3, 0, 0, 0),
                                                                                                                 (81, 12, 4, 0, 0, 0),
                                                                                                                 (82, 12, 5, 0, 0, 0),
                                                                                                                 (83, 12, 6, 0, 0, 0),
                                                                                                                 (84, 12, 7, 0, 0, 0),
                                                                                                                 (85, 13, 1, 0, 0, 0),
                                                                                                                 (86, 13, 2, 0, 0, 0),
                                                                                                                 (87, 13, 3, 0, 0, 0),
                                                                                                                 (88, 13, 4, 0, 0, 0),
                                                                                                                 (89, 13, 5, 0, 0, 0),
                                                                                                                 (90, 13, 6, 0, 0, 0),
                                                                                                                 (91, 13, 7, 0, 0, 0),
                                                                                                                 (92, 14, 1, 0, 0, 0),
                                                                                                                 (93, 14, 2, 0, 0, 0),
                                                                                                                 (94, 14, 3, 0, 0, 0),
                                                                                                                 (95, 14, 4, 0, 0, 0),
                                                                                                                 (96, 14, 5, 0, 0, 0),
                                                                                                                 (97, 14, 6, 0, 0, 0),
                                                                                                                 (98, 14, 7, 0, 0, 0),
                                                                                                                 (99, 15, 1, 0, 0, 0),
                                                                                                                 (100, 15, 2, 0, 0, 0),
                                                                                                                 (101, 15, 3, 0, 0, 0),
                                                                                                                 (102, 15, 4, 0, 0, 0),
                                                                                                                 (103, 15, 5, 0, 0, 0),
                                                                                                                 (104, 15, 6, 0, 0, 0),
                                                                                                                 (105, 15, 7, 0, 0, 0),
                                                                                                                 (106, 16, 1, 111, 111111, 1),
                                                                                                                 (107, 16, 2, 0, 0, 0),
                                                                                                                 (108, 16, 3, 0, 0, 0),
                                                                                                                 (109, 16, 4, 111, 22222, 1),
                                                                                                                 (110, 16, 5, 0, 0, 0),
                                                                                                                 (111, 16, 6, 0, 0, 0),
                                                                                                                 (112, 16, 7, 0, 0, 0);

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
                                                                            (4, 'Size XL', '2022-11-06 05:44:00', '2022-11-06 08:17:22'),
                                                                            (5, 'Oversize', '2022-11-09 15:22:31', '2022-11-09 15:22:31'),
                                                                            (6, 'XS', '2022-11-09 15:28:01', '2022-11-09 15:28:01'),
                                                                            (7, '2XL', '2022-11-09 15:28:12', '2022-11-09 15:28:12');

-- --------------------------------------------------------

--
-- Table structure for table `table_slide_home`
--

CREATE TABLE `table_slide_home` (
                                    `slide_id` tinyint(11) NOT NULL,
                                    `slide_img` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
                                    `slide_sub` text COLLATE utf8_unicode_ci NOT NULL,
                                    `slide_title` text COLLATE utf8_unicode_ci NOT NULL,
                                    `status` tinyint(4) NOT NULL,
                                    `Created` timestamp NOT NULL DEFAULT current_timestamp(),
                                    `Updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_slide_home`
--

INSERT INTO `table_slide_home` (`slide_id`, `slide_img`, `slide_sub`, `slide_title`, `status`, `Created`, `Updated`) VALUES
                                                                                                                         (1, '/images/slide-01.jpg', 'Women Collection 2018', 'NEW SEASON', 1, '2022-11-22 11:03:24', '2022-11-22 11:03:24'),
                                                                                                                         (2, '/images/slide-02.jpg', 'Men New-Season', 'Jackets & Coats', 1, '2022-11-22 11:03:24', '2022-11-22 11:03:24'),
                                                                                                                         (3, '/images/slide-03.jpg', 'Men Collection 2018', 'New arrivals', 1, '2022-11-22 11:03:24', '2022-11-22 11:03:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `table_about`
--
ALTER TABLE `table_about`
    ADD PRIMARY KEY (`about_id`);

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
-- Indexes for table `table_contact`
--
ALTER TABLE `table_contact`
    ADD PRIMARY KEY (`contact_id`);

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
-- Indexes for table `table_event`
--
ALTER TABLE `table_event`
    ADD PRIMARY KEY (`event_id`);

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
-- Indexes for table `table_slide_home`
--
ALTER TABLE `table_slide_home`
    ADD PRIMARY KEY (`slide_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `table_about`
--
ALTER TABLE `table_about`
    MODIFY `about_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_accounts`
--
ALTER TABLE `table_accounts`
    MODIFY `Account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `table_category`
--
ALTER TABLE `table_category`
    MODIFY `Category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `table_contact`
--
ALTER TABLE `table_contact`
    MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT for table `table_event`
--
ALTER TABLE `table_event`
    MODIFY `event_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `table_order`
--
ALTER TABLE `table_order`
    MODIFY `Order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_position`
--
ALTER TABLE `table_position`
    MODIFY `Position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_products`
--
ALTER TABLE `table_products`
    MODIFY `Product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `table_product_images`
--
ALTER TABLE `table_product_images`
    MODIFY `Product_images_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `table_product_order`
--
ALTER TABLE `table_product_order`
    MODIFY `Product_Order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_product_size`
--
ALTER TABLE `table_product_size`
    MODIFY `Product_Size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

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
    MODIFY `Size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `table_slide_home`
--
ALTER TABLE `table_slide_home`
    MODIFY `slide_id` tinyint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
