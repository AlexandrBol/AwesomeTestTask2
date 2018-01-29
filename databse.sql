-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 29, 2018 at 04:14 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `Invoices`
--

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` mediumint(8) UNSIGNED NOT NULL,
  `payed` tinyint(1) DEFAULT NULL,
  `item` mediumint(8) UNSIGNED NOT NULL,
  `user` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `payed`, `item`, `user`) VALUES
(1, 1, 2, 19),
(2, 1, 3, 19),
(3, 0, 4, 14),
(4, 1, 5, 14),
(5, 0, 6, 15),
(6, 0, 7, 19),
(7, 1, 8, 15),
(8, 1, 9, 12),
(9, 1, 10, 15),
(10, 0, 1, 15),
(11, 1, 9, 11),
(12, 1, 2, 15),
(13, 0, 2, 20),
(14, 0, 2, 14),
(15, 1, 2, 11),
(16, 0, 2, 13),
(17, 1, 2, 12),
(18, 0, 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `LineItem`
--

CREATE TABLE `LineItem` (
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_price` mediumint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LineItem`
--

INSERT INTO `LineItem` (`item_id`, `item_name`, `item_price`) VALUES
(1, 'PenA', 20),
(2, 'PenB', 200),
(3, 'CarA', 500),
(4, 'CarB', 2000),
(5, 'ToyA', 10),
(6, 'ToyB', 20),
(7, 'KnifeA', 15),
(8, 'KnifeB', 200),
(9, 'PowerBankA', 20),
(10, 'PowerBankB', 20);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `DOB` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `DOB`, `Email`, `Phone`) VALUES
(11, 'Miranda Walton', '07.05.03', 'velit.justo.nec@nullamagna.edu', '056 6140 3393'),
(12, 'Simone Hicks', '27.07.89', 'porttitor.interdum@Cum.edu', '0500 663675'),
(13, 'Casey Ruiz', '02.12.89', 'arcu.iaculis.enim@euismod.net', '070 2733 0290'),
(14, 'Britanni Beach', '30.07.89', 'iaculis.lacus.pede@cubiliaCurae.edu', '07624 098875'),
(15, 'Barry Reed', '23.11.94', 'lobortis@etrisusQuisque.com', '056 5542 4551'),
(16, 'Britanney Clay', '15.08.92', 'diam.vel@augueac.co.uk', '(0171) 075 4145'),
(17, 'Griffin Preston', '09.11.97', 'adipiscing@semper.com', '055 6902 1316'),
(18, 'India Delgado', '22.08.92', 'malesuada@eratvitae.ca', '070 2191 7329'),
(19, 'Sean Butler', '21.01.96', 'Sed@dictumaugue.com', '056 7665 9540'),
(20, 'Justine Porter', '13.09.93', 'gravida.sagittis@Nullamsuscipit.ca', '0800 1111');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `user` (`user`),
  ADD KEY `item` (`item`);

--
-- Indexes for table `LineItem`
--
ALTER TABLE `LineItem`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `LineItem`
--
ALTER TABLE `LineItem`
  MODIFY `item_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`user_id`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`item`) REFERENCES `LineItem` (`item_id`);
