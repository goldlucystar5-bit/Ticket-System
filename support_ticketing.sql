-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Oct 30, 2026 at 06:41 AM
-- Server version: 8.1.0
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `support_ticketing`
--

-- --------------------------------------------------------

--
-- Table structure for table `support_agents`
--

CREATE TABLE `support_agents` (
  `agent_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `support_level` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `support_agents`
--

INSERT INTO `support_agents` (`agent_id`, `username`, `password`, `full_name`, `support_level`) VALUES
(1, 'agent1', '$2y$10$jGa6wmXB7df6C2mmVzhCmeMNc2ptHM0fSWSmEapYXQag6QK/YXeGm', 'Support Agent One', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int NOT NULL,
  `user_id` int NOT NULL,
  `subject` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `status` enum('Open','Resolved','Closed') NOT NULL DEFAULT 'Open',
  `date_submitted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resolution_details` text,
  `resolved_by` int DEFAULT NULL,
  `support_level` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `user_id`, `subject`, `description`, `status`, `date_submitted`, `resolution_details`, `resolved_by`, `support_level`) VALUES
(1, 1, 'Unable to access email', 'I am unable to access my college email account and need assistance.', 'Closed', '2026-10-05 13:36:57', 'Email account access issue was investigated and the user\'s college email access was restored.', 1, 1),
(2, 1, 'Unable to connect to college Wi-Fi', 'I am unable to connect my laptop to the college Wi-Fi network and need assistance.', 'Closed', '2026-10-07 01:16:34', 'The college Wi-Fi connection issue was investigated and the user\'s connection was restored.', 1, 2),
(3, 1, 'Printer not working', 'The printer in the office is not responding when I try to print.', 'Closed', '2026-10-08 11:54:22', 'The printer connection was checked and the printer was restored successfully.', 1, 4),
(4, 1, 'Unable to access email', 'I can\'t access my email', 'Closed', '2026-10-12 08:56:00', 'The email access issue was resolved by resetting the user\'s password and verifying that they could successfully log in to their email account', 1, 4),
(5, 1, 'Unable to access email', 'I can\'t access my email', 'Open', '2026-10-12 08:56:30', NULL, NULL, 2),
(6, 1, 'Unable to connect to college Wi-Fi', 'I am unable to connect my laptop to the college Wi-Fi network. I have tried reconnecting several times but the connection keeps failing. Please assist me in resolving this issue', 'Open', '2026-10-21 01:33:35', NULL, NULL, 1),
(7, 1, 'Unable to connect to college Wi-Fi', 'Unable to connect to college Wi-Fi', 'Resolved', '2026-10-22 00:11:13', 'The Wi-Fi connection issue was resolved by verifying the network settings, reconnecting the device to the college Wi-Fi, and confirming that internet access was restored.', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `email`) VALUES
(1, 'lucy_test', '$2y$10$/lKR4TROqiNNQkeISOiq8eA7BCpgp77kefDBq5JJrB46n77y4yDum', 'Lucy Test', 'lucytest@example.com'),
(2, 'ebun_lomo', '$2y$10$byQi1IiiQSehBRxVlqCcZ.EHMeYPhh8BjhTPaY9DDXZBqCYLTTv3u', 'Ebun Test', 'ebun@gmail.com'),
(3, 'Star', '$2y$10$LzDnn9oirnxVgUKxF9S3pOayLV6czyv117rzpDJPO0VN/pxEGcbRi', 'Star Ayo', 'star@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `support_agents`
--
ALTER TABLE `support_agents`
  ADD PRIMARY KEY (`agent_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `resolved_by` (`resolved_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `support_agents`
--
ALTER TABLE `support_agents`
  MODIFY `agent_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`resolved_by`) REFERENCES `support_agents` (`agent_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
