-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2024 at 09:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jwt`
--

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `name`, `description`, `createdAt`, `updatedAt`) VALUES
(1, 'Dev', 'Developer', '2024-02-05 20:05:13', '2024-02-05 20:05:13'),
(2, 'Leader', 'Leader bla bla', '2024-02-17 08:30:37', '2024-02-17 08:30:37'),
(3, 'Customer', 'Our customer', '2024-02-17 08:30:37', '2024-02-17 08:30:37'),
(4, 'guest', 'view only ', '2024-02-19 09:10:24', '2024-02-19 09:10:24');

-- --------------------------------------------------------

--
-- Table structure for table `group_role`
--

CREATE TABLE `group_role` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_role`
--

INSERT INTO `group_role` (`id`, `groupId`, `roleId`, `createdAt`, `updatedAt`) VALUES
(43, 4, 25, '2024-03-01 08:58:08', '2024-03-01 08:58:08'),
(44, 4, 22, '2024-03-01 08:58:08', '2024-03-01 08:58:08'),
(45, 4, 21, '2024-03-01 08:58:08', '2024-03-01 08:58:08'),
(46, 4, 17, '2024-03-01 08:58:08', '2024-03-01 08:58:08'),
(47, 4, 16, '2024-03-01 08:58:08', '2024-03-01 08:58:08'),
(48, 4, 6, '2024-03-01 08:58:08', '2024-03-01 08:58:08'),
(49, 4, 5, '2024-03-01 08:58:08', '2024-03-01 08:58:08'),
(50, 4, 3, '2024-03-01 08:58:08', '2024-03-01 08:58:08'),
(51, 4, 2, '2024-03-01 08:58:08', '2024-03-01 08:58:08'),
(52, 4, 1, '2024-03-01 08:58:08', '2024-03-01 08:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `startDate` varchar(255) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_user`
--

CREATE TABLE `project_user` (
  `id` int(11) NOT NULL,
  `projectId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `url`, `description`, `createdAt`, `updatedAt`) VALUES
(1, '/user/read', 'show all user', '2024-02-05 20:06:34', '2024-02-05 20:06:34'),
(2, '/user/create', 'Edit user', '2024-02-05 20:06:55', '2024-02-05 20:06:55'),
(3, '/user/update', 'Update user', '2024-02-05 20:07:21', '2024-02-05 20:07:21'),
(5, '/group/read', NULL, '2024-02-20 11:05:52', '2024-02-20 11:05:52'),
(6, '/role/create', 'create roles', '2024-02-25 15:24:41', '2024-02-25 15:24:41'),
(16, '/role/read', 'read rolee', '2024-02-26 03:22:15', '2024-02-26 03:22:15'),
(17, '/role/delete', 'Delete role', '2024-02-26 03:40:22', '2024-02-26 03:40:22'),
(21, '/role/by-group', '', '2024-02-26 17:59:45', '2024-02-26 17:59:45'),
(22, '/role/assign-to-group', '', '2024-02-26 19:31:28', '2024-02-26 19:31:28'),
(25, '/user/delete', 'Delete user', '2024-03-01 08:58:04', '2024-03-01 08:58:04');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20240201182427-create-user.js'),
('migrate-group-Role.js'),
('migrate-group.js'),
('migrate-project-user.js'),
('migrate-project.js'),
('migrate-role.js');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `username`, `address`, `sex`, `phone`, `groupId`, `createdAt`, `updatedAt`) VALUES
(1, 'admin@gmail.com', '$2a$10$Lh3IVNTClYSNyfkk4LZE9uB3oaOSJLUCs.CmjGK/pQ7snXT0LUPIm', 'Nguyen Viet Phuong', NULL, NULL, '123', 1, '2024-02-05 19:03:46', '2024-02-05 19:03:46'),
(8, 'nvp.1312.2001@gmail.com', '$2a$10$.WxlfgFSzDA.p5KlK2zU.u9mwqPIDlNkeP253eGuKRnkts0VRWWIm', 'Nguyen Viet Phuong', NULL, NULL, '0394704664', NULL, '2024-02-13 03:55:41', '2024-02-13 03:55:41'),
(15, 'testcreate@gmail.com', '123456', 'testcreate', 'QN', '', '039939291', NULL, '2024-02-17 16:32:03', '2024-02-17 16:32:03'),
(16, 'testcreate2@gmail.com', '123456', 'testcreate2', 'HN', 'Male', '91240214', 3, '2024-02-17 17:08:33', '2024-02-17 17:08:33'),
(17, 'something@gmail.com', '123456', 'Something', 'HN', 'Male', '099999999', 3, '2024-02-17 17:30:15', '2024-02-17 17:30:15'),
(18, 'Something2@gmail.com', '123456', 'Something2', 'HN', 'Other', '099999999', 1, '2024-02-17 17:35:20', '2024-02-17 17:35:20'),
(19, 'bug@gmail.com', '123456', 'bug', 'HN', '', '09999999', 1, '2024-02-17 17:55:57', '2024-02-17 17:55:57'),
(20, 'testbug@gmail.com', '123456', 'testbug', 'HN', '', '099999999', 3, '2024-02-17 18:13:56', '2024-02-17 18:13:56'),
(21, 'testbug3@gmail.com', '123456', 'testbug3', '', '', '09321412', 3, '2024-02-17 18:14:26', '2024-02-17 18:14:26'),
(22, 'b@gmail.com', '$2a$10$HFAPtKoRzAC/LqP9eZNLJeNJYbvtA30PM981JjnNUlWPEzoAd6/WO', 'b', 'QN', 'Male', '039399339', 2, '2024-02-18 17:11:42', '2024-02-18 17:11:42'),
(24, 'c@gmail.com', '$2a$10$nh34pN9pDYdqPdhYo4e1HupHOOCxPXdDz5rlYhLCQ4s/bFiCAEpGW', 'c', '', '', '1231241245', 3, '2024-02-18 18:14:06', '2024-02-18 18:14:06'),
(25, 'd@gmail.com', '$2a$10$nh34pN9pDYdqPdhYo4e1HupHOOCxPXdDz5rlYhLCQ4s/bFiCAEpGW', 'test axios', 'VN', '', '214215134', 2, '2024-02-18 18:22:09', '2024-02-18 20:06:25'),
(26, 'e@gmail.com', '$2a$10$jBkhrQM5WM.dc4aOAqa7zeeAcXq1.Mu8HtxuaySmxNrMltQOBNCD.', 'e', NULL, NULL, '0123213124', 4, '2024-02-19 08:37:20', '2024-02-19 08:37:20'),
(27, 'f@gmail.com', '$2a$10$jBkhrQM5WM.dc4aOAqa7zeeAcXq1.Mu8HtxuaySmxNrMltQOBNCD.', 'e', NULL, NULL, '0124124124', 4, '2024-02-19 08:39:55', '2024-02-19 08:39:55'),
(28, 'g@gmail.com', '$2a$10$Pg4I3fDmE6m8xahxdOYEDui0HgZa4MJ75uflkqJTth5PGgIevtLPu', 'g', NULL, NULL, '12321431', 4, '2024-02-21 06:21:27', '2024-02-21 06:21:27'),
(29, 'm@gmail.com', '$2a$10$Bw4a3udXVWZvWagUQVusBe1sLzptNSuUHpQE9OkzZhyE0YRH6.XB6', 'M', NULL, NULL, '012049849102', 4, '2024-03-01 08:33:17', '2024-03-01 08:33:17'),
(37, 'u@gmail.com', '$2a$10$Bw4a3udXVWZvWagUQVusBe1sLzptNSuUHpQE9OkzZhyE0YRH6.XB6', 'U', 'VN', 'Female', '0319321931', 1, '2024-03-01 08:58:42', '2024-03-01 08:58:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_role`
--
ALTER TABLE `group_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_user`
--
ALTER TABLE `project_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `group_role`
--
ALTER TABLE `group_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_user`
--
ALTER TABLE `project_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
