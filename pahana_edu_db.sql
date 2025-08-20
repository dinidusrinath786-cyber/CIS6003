-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 20, 2025 at 04:29 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pahana_edu_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCustomer` (IN `p_account_number` VARCHAR(20), IN `p_name` VARCHAR(150), IN `p_address` VARCHAR(255), IN `p_telephone` VARCHAR(20))   BEGIN
    INSERT INTO `customers` (`account_number`, `name`, `address`, `telephone`)
    VALUES (p_account_number, p_name, p_address, p_telephone);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `bill_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `bill_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `units_consumed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bill_id`, `customer_id`, `bill_date`, `total_amount`, `units_consumed`) VALUES
(1, 1, '2025-08-20 11:21:00', 0.00, 1),
(2, 1, '2025-08-20 12:24:26', 0.00, 10),
(3, 1, '2025-08-20 12:24:54', 0.00, 10),
(4, 1, '2025-08-20 12:27:40', 0.00, 9),
(5, 2, '2025-08-20 12:28:37', 0.00, 1),
(6, 2, '2025-08-20 12:28:41', 0.00, 1),
(7, 1, '2025-08-20 12:41:42', 0.00, 1),
(8, 1, '2025-08-20 12:42:22', 0.00, 1),
(9, 1, '2025-08-20 12:43:16', 0.00, 1),
(10, 2, '2025-08-20 13:32:08', 0.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bill_items`
--

CREATE TABLE `bill_items` (
  `bill_item_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_purchase` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bill_items`
--

INSERT INTO `bill_items` (`bill_item_id`, `bill_id`, `item_id`, `quantity`, `price_at_purchase`) VALUES
(1, 1, 1, 1, 50000.00),
(2, 2, 1, 10, 50000.00),
(3, 3, 1, 10, 50000.00),
(4, 4, 1, 9, 50000.00),
(5, 5, 1, 1, 50000.00),
(6, 6, 1, 1, 50000.00),
(7, 7, 1, 1, 50000.00),
(8, 8, 1, 1, 50000.00),
(9, 9, 1, 1, 50000.00),
(10, 10, 1, 1, 50000.00);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `registered_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `account_number`, `name`, `address`, `telephone`, `registered_date`) VALUES
(1, '5341515', 'Malith Randika', 'Colombo', '0717071107', '2025-08-20 10:26:34'),
(2, '898989', 'akila danuddaraa', 'colombo', '0787878876', '2025-08-20 11:49:49');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_code`, `description`, `unit_price`, `stock_quantity`) VALUES
(1, '0001', 'First Test Itemm', 50000.00, 100);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `full_name`, `created_at`) VALUES
(1, 'admin', '$2a$10$N9qo8uLOickgx2ZMRZoMye2J1CzZPgQOTx5CjXYgCwGnLqfVU6WZi', 'Administrator', '2025-08-19 09:50:57'),
(5, 'user1', '$2a$10$J9uT.jUetTmkazrpCoWU7eoEHj.aUwWPLamk5s8MboPENVRzNaWHK', 'test user', '2025-08-19 10:19:08'),
(6, 'user2', '$2a$10$GO8tYdgSmvLUcjTMInmOQuXz/7aRxrbshtYs6onicDm8EXkh/wWaa', 'akila deshan', '2025-08-20 11:00:36'),
(7, 'user3', '$2a$10$O9yemSo9oXW5iNkPpoEpSuGuI7fRJx4LjARPfBa6Y0N26/lCi.qZi', 'Dinidu Srinath', '2025-08-20 13:28:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `fk_bills_customers` (`customer_id`);

--
-- Indexes for table `bill_items`
--
ALTER TABLE `bill_items`
  ADD PRIMARY KEY (`bill_item_id`),
  ADD KEY `fk_bill_items_bills` (`bill_id`),
  ADD KEY `fk_bill_items_items` (`item_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `account_number` (`account_number`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `item_code` (`item_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bill_items`
--
ALTER TABLE `bill_items`
  MODIFY `bill_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `fk_bills_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `bill_items`
--
ALTER TABLE `bill_items`
  ADD CONSTRAINT `fk_bill_items_bills` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bill_items_items` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
