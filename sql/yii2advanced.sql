-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2018 at 10:12 AM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2advanced`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `code` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `population` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`code`, `country`, `population`) VALUES
('AU', 'Australia', 18886000),
('BR', 'Brazil', 170115000),
('CA', 'Canada', 1147000),
('CN', 'China', 1277558000),
('DE', 'Germany', 82164700),
('FR', 'France', 59225700),
('GB', 'United Kingdom', 59623400),
('IN', 'India', 1013662000),
('RU', 'Russia', 146934000),
('US', 'United States', 278357000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `nama`, `email`, `user_id`) VALUES
(1, 'qwertt', 'qwe@qweqwe.qwe', 5),
(2, 'jono sujono', 'jono@gmail.com', 10);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `photo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `price`, `id_category`, `photo`) VALUES
(1, 'item 1', 10000, 1, NULL),
(2, 'item 2', 20000, 1, NULL),
(8, 'Item 5', 50000, 1, NULL),
(11, 'Item 5', 500000, 1, '1517967024.png'),
(12, 'item 77', 777000, 1, '1517966189.png');

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`id`, `name`, `parent_category`) VALUES
(1, 'Categori 1', 1),
(2, 'categori 2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1515845617),
('m130524_201442_init', 1515845620),
('m150812_015333_create_country_table', 1516396681),
('m150812_020403_populate_country', 1516396681);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `date`, `customer_id`) VALUES
(1, '2018-02-07 07:23:55', 2),
(2, '2018-02-07 07:23:55', 1),
(3, '2018-02-07 09:37:11', 2),
(4, '2018-02-07 09:37:29', 2),
(5, '2018-02-07 09:37:31', 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`id`, `order_id`, `item_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 12),
(4, 4, 12),
(5, 5, 11);

-- --------------------------------------------------------

--
-- Table structure for table `statistic`
--

CREATE TABLE `statistic` (
  `id` int(11) NOT NULL,
  `access_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_ip` varchar(20) DEFAULT NULL,
  `user_host` varchar(50) DEFAULT NULL,
  `path_info` varchar(50) DEFAULT NULL,
  `query_string` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statistic`
--

INSERT INTO `statistic` (`id`, `access_time`, `user_ip`, `user_host`, `path_info`, `query_string`) VALUES
(1, '2018-02-07 06:39:51', '::1', NULL, '', ''),
(2, '2018-02-07 06:39:56', '::1', NULL, '', ''),
(3, '2018-02-07 06:40:55', '::1', NULL, '', ''),
(4, '2018-02-07 06:41:00', '::1', NULL, 'item/view', 'id=1'),
(5, '2018-02-07 06:53:26', '::1', NULL, '', ''),
(6, '2018-02-07 06:54:33', '::1', NULL, 'item/view', 'id=1'),
(7, '2018-02-07 06:55:14', '::1', NULL, '', ''),
(8, '2018-02-07 07:07:47', '::1', NULL, '', ''),
(9, '2018-02-07 07:07:49', '::1', NULL, '', ''),
(10, '2018-02-07 07:16:27', '::1', NULL, '', ''),
(11, '2018-02-07 07:17:47', '::1', NULL, '', ''),
(12, '2018-02-07 07:18:08', '::1', NULL, '', ''),
(13, '2018-02-07 07:19:06', '::1', NULL, '', ''),
(14, '2018-02-07 07:20:55', '::1', NULL, '', ''),
(15, '2018-02-07 07:24:19', '::1', NULL, '', ''),
(16, '2018-02-07 08:32:24', '::1', NULL, '', ''),
(17, '2018-02-07 08:37:46', '::1', NULL, '', ''),
(18, '2018-02-07 08:39:38', '::1', NULL, '', ''),
(19, '2018-02-07 08:42:09', '::1', NULL, '', ''),
(20, '2018-02-07 08:42:49', '::1', NULL, '', ''),
(21, '2018-02-07 08:47:30', '::1', NULL, '', ''),
(22, '2018-02-07 08:47:42', '::1', NULL, '', ''),
(23, '2018-02-07 08:48:06', '::1', NULL, '', ''),
(24, '2018-02-07 08:48:27', '::1', NULL, '', ''),
(25, '2018-02-07 08:50:08', '::1', NULL, '', ''),
(26, '2018-02-07 08:50:41', '::1', NULL, '', ''),
(27, '2018-02-07 08:52:47', '::1', NULL, '', ''),
(28, '2018-02-07 08:53:15', '::1', NULL, '', ''),
(29, '2018-02-07 08:54:55', '::1', NULL, '', ''),
(30, '2018-02-07 08:56:32', '::1', NULL, '', ''),
(31, '2018-02-07 08:56:51', '::1', NULL, '', ''),
(32, '2018-02-07 08:56:58', '::1', NULL, '', ''),
(33, '2018-02-07 08:57:20', '::1', NULL, '', ''),
(34, '2018-02-07 08:59:46', '::1', NULL, '', ''),
(35, '2018-02-07 09:00:11', '::1', NULL, '', ''),
(36, '2018-02-07 09:00:34', '::1', NULL, '', ''),
(37, '2018-02-07 09:06:52', '::1', NULL, '', ''),
(38, '2018-02-07 09:06:58', '::1', NULL, 'item/index', 'page=2&per-page=3'),
(39, '2018-02-07 09:07:01', '::1', NULL, 'item/index', 'page=1&per-page=3'),
(40, '2018-02-07 09:07:03', '::1', NULL, 'item/index', 'page=2&per-page=3'),
(41, '2018-02-07 09:07:36', '::1', NULL, 'item/index', 'page=2&per-page=3'),
(42, '2018-02-07 09:07:38', '::1', NULL, 'item/index', 'page=1&per-page=3'),
(43, '2018-02-07 09:07:40', '::1', NULL, 'item/index', 'page=2&per-page=3'),
(44, '2018-02-07 09:08:14', '::1', NULL, 'item/index', 'page=1&per-page=3'),
(45, '2018-02-07 09:13:26', '::1', NULL, 'item/index', 'page=1&per-page=3'),
(46, '2018-02-07 09:13:29', '::1', NULL, 'item/index', 'categ=2'),
(47, '2018-02-07 09:13:31', '::1', NULL, 'item/index', 'categ=1'),
(48, '2018-02-07 09:13:34', '::1', NULL, 'item/index', 'categ=2'),
(49, '2018-02-07 09:13:34', '::1', NULL, 'item/index', 'categ=1'),
(50, '2018-02-07 09:13:46', '::1', NULL, 'item/index', 'categ=1'),
(51, '2018-02-07 09:13:48', '::1', NULL, 'item/index', 'categ=2'),
(52, '2018-02-07 09:13:49', '::1', NULL, 'item/index', 'categ=1'),
(53, '2018-02-07 09:13:50', '::1', NULL, 'item/index', 'categ=2'),
(54, '2018-02-07 09:13:51', '::1', NULL, 'item/index', 'categ=1'),
(55, '2018-02-07 09:13:53', '::1', NULL, 'item/index', 'categ=1&page=2&per-page=3'),
(56, '2018-02-07 09:13:55', '::1', NULL, 'item/index', 'categ=1&page=1&per-page=3'),
(57, '2018-02-07 09:19:23', '::1', NULL, 'item/index', 'categ=1&page=1&per-page=3'),
(58, '2018-02-07 09:22:22', '::1', NULL, 'item/index', 'categ=1&page=1&per-page=3'),
(59, '2018-02-07 09:22:50', '::1', NULL, '', ''),
(60, '2018-02-07 09:22:55', '::1', NULL, '', ''),
(61, '2018-02-07 09:23:04', '::1', NULL, '', ''),
(62, '2018-02-07 09:23:31', '::1', NULL, '', ''),
(63, '2018-02-07 09:23:35', '::1', NULL, '', ''),
(64, '2018-02-07 09:24:22', '::1', NULL, '', ''),
(65, '2018-02-07 09:24:25', '::1', NULL, '', ''),
(66, '2018-02-07 09:24:26', '::1', NULL, '', ''),
(67, '2018-02-07 09:24:27', '::1', NULL, '', ''),
(68, '2018-02-07 09:24:30', '::1', NULL, '', ''),
(69, '2018-02-07 09:24:55', '::1', NULL, '', ''),
(70, '2018-02-07 09:24:59', '::1', NULL, '', ''),
(71, '2018-02-07 09:25:32', '::1', NULL, '', ''),
(72, '2018-02-07 09:25:36', '::1', NULL, '', ''),
(73, '2018-02-07 09:26:25', '::1', NULL, '', ''),
(74, '2018-02-07 09:26:28', '::1', NULL, '', ''),
(75, '2018-02-07 09:28:09', '::1', NULL, '', ''),
(76, '2018-02-07 09:29:11', '::1', NULL, '', ''),
(77, '2018-02-07 09:29:15', '::1', NULL, '', ''),
(78, '2018-02-07 09:30:07', '::1', NULL, '', ''),
(79, '2018-02-07 09:30:39', '::1', NULL, '', ''),
(80, '2018-02-07 09:30:42', '::1', NULL, '', ''),
(81, '2018-02-07 09:32:48', '::1', NULL, '', ''),
(82, '2018-02-07 09:36:02', '::1', NULL, '', ''),
(83, '2018-02-07 09:36:05', '::1', NULL, '', ''),
(84, '2018-02-07 09:36:20', '::1', NULL, '', ''),
(85, '2018-02-07 09:37:13', '::1', NULL, 'item/index', ''),
(86, '2018-02-07 09:37:27', '::1', NULL, '', ''),
(87, '2018-02-07 09:37:30', '::1', NULL, 'item/index', ''),
(88, '2018-02-07 09:37:32', '::1', NULL, 'item/index', ''),
(89, '2018-02-07 09:38:10', '::1', NULL, 'item/index', ''),
(90, '2018-02-07 09:38:49', '::1', NULL, 'item/index', 'categ=2'),
(91, '2018-02-07 09:38:50', '::1', NULL, 'item/index', 'categ=1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'rahmat', 'CkAawHQoNkRA4_rO2AqZpxgtcgS3z4ir', '$2y$13$v1b10B/79l/MgaFwqRcyMew/eNaJ3wqDhWA3GkICU67vTujx1PebC', NULL, 'me@rahmatzulfikri.xyz', 10, 1516407229, 1516407229),
(2, 'rahmat95', '-Y6dWRaxhPdd2scjmKqA7QqaDF6OUkmx', '$2y$13$HvB6MigzNzBE8lR4niPTruoYB73mHwSM4R0rXvmw.gpTxkDX6roKG', NULL, 'rahmatzulfikri795@gmail.com', 10, 1517765526, 1517765526),
(3, 'rahmat123', 'SVhL0Z0863NzEYXX8Q-0NMI_ue6pa_HO', '$2y$13$L.kMxNS3nFBVglKYv0tF1unF3EWozE0TDBwW3.h3AUMdg3Dt2TuCy', NULL, 'a@rahmat.com', 10, 1517765586, 1517765586),
(4, 'rahmat11', '5vqw-MfRz1lTA8_StDFfxnet12uLPBQ6', '$2y$13$I/IPsxhp4KYUswY5EJEwaueYoomMBzhzOIwRkUgoAYhNg5.lXqDRi', NULL, 'rahmat@asd.com', 10, 1517765997, 1517765997),
(5, 'qwer', 'WR2Ig3Uh_bnH6UV4xpyEuTimukjmex8B', '$2y$13$kWMGW7vTMg8Te/pMgEtap.evK0IlvcUjZpW7YKco8255RydXcX0hi', NULL, 'qwe@qweqwe.qwe', 10, 1517766038, 1517766038),
(6, 'joni', '6E3mln73du0FJYIsEUSfpRNR4HQ-LjXC', '$2y$13$B688DX2V1Cu0AIe36QpZMe1ggPvUbRUhzJfzcrulsP54KFnrSndmm', NULL, 'joni@gmail.com', 10, 1517962435, 1517962435),
(7, 'budi', 'n9FYQtAuYixxL-0f4SIfLRWffSbAP0yl', '$2y$13$lEoQ4nH5tfxs4DI8rtKr4ecwmM.vQgAlLqUB1OwlhOMSanp80PAaW', NULL, 'budi@gmail.com', 10, 1517962604, 1517962604),
(8, 'asep', 'dfY83kgxHEEy_l-fndpd08a5MY2e1OaY', '$2y$13$bIjY8ZWSxGH/Fep3UZ7Pn.W8QHR/ZpJnBI9wWGYjL22Onlall.zdy', NULL, 'asep@gmail.com', 10, 1517962688, 1517962688),
(9, 'doni', 'aGAANCAhuvAmzyAK9t7obEfje1wMcdGp', '$2y$13$JocWhVxKST/CzRXynupLT.XnWU0eN.DhGAuoNutZ3UpDGeY8rmHQ6', NULL, 'doni@gmail.com', 10, 1517962760, 1517962760),
(10, 'jono', 'f8_C4PnKhQBiB09mYDB9YHhPMoc-LzeF', '$2y$13$y7mfnImZyDgmFQwDfxAvbuAMccz6xDrxdXxygdbgEZjphb8Ne1h9y', NULL, 'jono@gmail.com', 10, 1517962855, 1517962855);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama` (`nama`),
  ADD KEY `rel_costumer_user` (`user_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rel_item_category` (`id_category`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`id`,`parent_category`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rel_order-customer` (`customer_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`) USING BTREE,
  ADD KEY `order_id_ibfk1` (`item_id`);

--
-- Indexes for table `statistic`
--
ALTER TABLE `statistic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `statistic`
--
ALTER TABLE `statistic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `rel_costumer_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `rel_item_category` FOREIGN KEY (`id_category`) REFERENCES `item_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `rel_order-customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_id_ibfk1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
