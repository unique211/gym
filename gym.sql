-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 16, 2019 at 02:57 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym`
--
CREATE DATABASE IF NOT EXISTS `gym` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gym`;

-- --------------------------------------------------------

--
-- Table structure for table `booking_table`
--

CREATE TABLE `booking_table` (
  `booking_id` int(11) NOT NULL,
  `link_id` int(11) NOT NULL,
  `points` decimal(10,2) NOT NULL,
  `date_time` datetime NOT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'data is 0=True and 1=false',
  `cancell_date_time` datetime NOT NULL,
  `class_schedule_id` int(11) NOT NULL,
  `rating_points` float NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking_table`
--

INSERT INTO `booking_table` (`booking_id`, `link_id`, `points`, `date_time`, `is_cancelled`, `cancell_date_time`, `class_schedule_id`, `rating_points`) VALUES
(1, 1, '2.50', '2019-12-09 00:00:00', 0, '0000-00-00 00:00:00', 8, -1),
(2, 2, '4.50', '2019-12-09 00:00:00', 1, '2019-12-10 00:00:00', 8, -1),
(3, 2, '2.00', '2019-12-09 00:00:00', 1, '0000-00-00 00:00:00', 8, -1),
(4, 2, '2.00', '2019-12-19 00:00:00', 0, '0000-00-00 00:00:00', 8, 4.6),
(5, 2, '2.00', '2019-12-19 00:00:00', 1, '0000-00-00 00:00:00', 6, -1);

-- --------------------------------------------------------

--
-- Table structure for table `classcategory_master`
--

CREATE TABLE `classcategory_master` (
  `classcategory_id` int(11) NOT NULL,
  `classcategory_name` varchar(100) NOT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classcategory_master`
--

INSERT INTO `classcategory_master` (`classcategory_id`, `classcategory_name`, `category_description`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'asdads', 'sdfs', 0, '2019-12-04 03:57:44', '2019-12-03 22:27:44', 1),
(2, 'cate122312', 'sdffsadsd', 1, '2019-11-30 10:08:28', '2019-11-30 04:08:09', 1),
(5, 'asdads12', 'asdssd', 0, '2019-12-04 05:02:27', '2019-11-30 04:39:04', 1),
(6, 'testclassc', NULL, 0, '2019-12-03 03:46:58', '2019-12-03 03:46:58', 1),
(7, 'cate1223', 'sdfsf', 1, '2019-12-03 06:14:17', '2019-12-03 06:14:17', 1),
(8, 'asas', NULL, 0, '2019-12-03 06:15:14', '2019-12-03 06:15:14', 1),
(9, 'sagara', NULL, 1, '2019-12-03 06:15:26', '2019-12-03 06:15:26', 1),
(10, 'asdadsq', 'asdfs', 1, '2019-12-03 22:17:26', '2019-12-03 22:17:26', 1),
(11, 'cate1223125', 'sds', 1, '2019-12-03 22:23:06', '2019-12-03 22:23:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `class_master`
--

CREATE TABLE `class_master` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(100) NOT NULL,
  `class_category` int(11) NOT NULL,
  `class_description` varchar(255) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_master`
--

INSERT INTO `class_master` (`class_id`, `class_name`, `class_category`, `class_description`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'abcddd12345221', 2, 'asdaddsadas', 1, 1, '2019-12-04 04:51:59', '2019-12-03 23:21:56'),
(4, 'abcddd12345', 2, 'sdfd', 1, 1, '2019-12-04 04:52:08', '2019-12-03 23:22:08'),
(5, 'abcdd1', 2, NULL, 0, 1, '2019-12-03 03:57:11', '2019-12-03 03:57:11'),
(6, 'abcddd1234', 2, NULL, 0, 1, '2019-12-03 09:28:50', '2019-12-03 03:58:50'),
(7, 'testclass', 2, 'sdfs', 1, 1, '2019-12-04 09:04:53', '2019-12-04 03:34:53'),
(8, 'sd21', 5, 'sdfsfd', 0, 1, '2019-12-04 05:02:06', '2019-12-03 23:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `class_sechedule_master`
--

CREATE TABLE `class_sechedule_master` (
  `classsechedule_id` int(11) NOT NULL,
  `classsechedule_name` int(11) NOT NULL,
  `class_schedule` datetime NOT NULL,
  `instructor` int(11) NOT NULL,
  `max_vacancy` int(11) NOT NULL,
  `class_duration` decimal(10,0) NOT NULL,
  `room_id` int(11) NOT NULL,
  `min_cancelation` datetime NOT NULL,
  `min_booking` datetime NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `endtime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_sechedule_master`
--

INSERT INTO `class_sechedule_master` (`classsechedule_id`, `classsechedule_name`, `class_schedule`, `instructor`, `max_vacancy`, `class_duration`, `room_id`, `min_cancelation`, `min_booking`, `status`, `created_at`, `updated_at`, `user_id`, `endtime`) VALUES
(1, 2, '2019-11-13 06:15:06', 1, 12, '12', 5, '2019-12-04 06:20:11', '2019-10-29 06:13:46', 1, '2019-12-11 06:48:29', '2019-12-01 22:44:26', 1, NULL),
(3, 2, '2019-12-02 09:48:17', 1, 12, '12', 5, '2019-12-03 09:48:24', '2019-10-29 06:13:46', 0, '2019-12-01 22:48:32', '2019-12-01 22:48:32', 1, NULL),
(4, 2, '2019-12-20 06:15:06', 3, 10, '112', 5, '2019-12-11 07:12:02', '2019-05-10 08:12:41', 0, '2019-12-11 06:48:43', '2019-12-02 22:31:30', 1, NULL),
(5, 2, '2019-10-19 06:15:06', 3, 10, '112', 5, '2019-12-11 07:12:02', '2019-05-10 08:12:41', 0, '2019-12-11 06:53:39', '2019-12-02 22:33:05', 1, NULL),
(6, 7, '2019-12-26 03:26:02', 1, -5, '50', 4, '2019-12-03 03:26:02', '2019-12-03 03:26:02', 1, '2019-12-11 06:47:50', '2019-12-03 04:29:44', 1, NULL),
(7, 4, '2019-12-24 01:12:47', 1, 1, '10', 5, '2019-12-04 01:16:47', '2019-12-04 01:16:47', 1, '2019-12-11 06:53:15', '2019-12-04 02:06:28', 1, NULL),
(8, 2, '2019-12-19 01:21:00', 1, 120, '10', 5, '2019-12-05 01:22:00', '2019-12-05 01:22:00', 1, '2019-12-11 06:53:31', '2019-12-04 02:17:25', 1, NULL),
(9, 2, '2019-12-04 03:06:32', 1, 10, '10', 7, '2019-12-04 03:08:32', '2019-12-04 03:10:32', 1, '2019-12-04 04:02:04', '2019-12-04 04:02:04', 1, NULL),
(10, 4, '2019-12-18 15:29:29', 1, 10, '10', 5, '2019-12-04 16:27:42', '2019-12-04 17:27:50', 1, '2019-12-11 06:53:20', '2019-12-04 04:27:57', 1, NULL),
(11, 4, '2019-12-11 17:54:39', 2, 10, '120', 5, '2019-12-05 18:02:39', '2019-12-05 18:49:39', 1, '2019-12-11 06:54:46', '2019-12-04 06:50:12', 1, '0000-00-00 00:00:00'),
(12, 2, '2019-12-19 17:57:57', 1, 30, '20', 7, '2019-12-05 18:52:57', '2019-12-05 18:52:57', 1, '2019-12-11 06:53:27', '2019-12-04 06:53:24', 1, '2019-12-04 18:17:57'),
(13, 4, '2019-12-19 18:04:56', 1, 5, '100', 5, '2019-12-05 18:59:56', '2019-12-05 19:59:56', 1, '2019-12-11 06:49:38', '2019-12-04 07:00:37', 1, '2019-12-05 19:44:56'),
(14, 2, '2019-12-11 09:23:58', 1, 10, '1', 7, '2019-12-10 09:18:58', '2019-12-08 11:12:58', 1, '2019-12-11 06:54:58', '2019-12-06 22:20:17', 1, '2019-12-08 09:24:58'),
(15, 4, '2019-12-26 16:13:14', 3, 10, '50', 7, '2019-12-08 16:08:14', '2019-12-08 16:08:14', 1, '2019-12-11 06:48:15', '2019-12-07 05:08:35', 1, '2019-12-07 17:03:14'),
(16, 4, '2019-12-26 16:26:35', 7, 5, '10', 7, '2019-12-07 17:08:35', '2019-12-07 17:09:35', 1, '2019-12-11 06:47:58', '2019-12-07 05:09:15', 1, '2019-12-07 16:36:35');

-- --------------------------------------------------------

--
-- Table structure for table `deal_master`
--

CREATE TABLE `deal_master` (
  `deal_id` int(11) NOT NULL,
  `deal_title` varchar(255) NOT NULL,
  `upload_img` varchar(255) NOT NULL,
  `is_video` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deal_master`
--

INSERT INTO `deal_master` (`deal_id`, `deal_title`, `upload_img`, `is_video`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'title2', '5de5f95a486b7_1575352666.png', 0, '2019-12-03 00:00:00', '2019-12-03 00:00:00', 1, '2019-12-03 09:31:54', '2019-12-03 04:01:54', 1),
(3, 'title3', '5', 0, '2019-12-03 00:00:00', '2019-12-03 00:00:00', 1, '2019-12-02 23:54:11', '2019-12-02 23:54:11', 1),
(5, 'title1', 'abc.png', 0, '2019-07-30 00:00:00', '2019-07-20 00:00:00', 1, '2019-12-03 09:25:42', '2019-12-03 03:55:42', 1),
(6, 'title123', '5de63427cb6ab_1575367719.png', 0, '2019-12-03 00:00:00', '2019-12-03 00:00:00', 1, '2019-12-03 04:38:44', '2019-12-03 04:38:44', 1),
(7, 'title112', '5de752879f962_1575441031.png', 0, '2019-12-04 00:00:00', '2019-12-12 00:00:00', 1, '2019-12-11 11:06:28', '2019-12-04 01:00:39', 1),
(8, 'title122', '5de7536bb04ea_1575441259.png', 0, '2019-12-04 00:00:00', '2019-12-04 00:00:00', 1, '2019-12-04 06:34:42', '2019-12-04 01:04:42', 1),
(9, 'title5', '5de7566b9a666_1575442027.png', 0, '2019-12-10 12:16:58', '2019-12-18 12:16:58', 1, '2019-12-11 11:07:27', '2019-12-04 01:17:23', 1),
(10, 'title6', '5de7568845336_1575442056.png', 0, '2019-12-05 12:16:58', '2019-12-11 12:16:58', 1, '2019-12-04 01:17:45', '2019-12-04 01:17:45', 1),
(11, 'title12', '5de756c81aada_1575442120.png', 0, '2019-12-04 12:18:20', '2019-12-04 12:18:20', 1, '2019-12-04 01:18:45', '2019-12-04 01:18:45', 1),
(12, '1title1', '5de790d3af55d_1575456979.png', 0, '2019-12-04 16:31:13', '2019-12-04 16:26:13', 1, '2019-12-04 05:26:24', '2019-12-04 05:26:24', 1),
(13, 'title3wq', '5de794bb5d0dc_1575457979.png', 0, '2019-12-04 16:47:52', '2019-12-04 16:50:52', 1, '2019-12-04 05:43:21', '2019-12-04 05:43:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gallary_master`
--

CREATE TABLE `gallary_master` (
  `gallary_id` int(11) NOT NULL,
  `uploadimg` varchar(255) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `is_video` tinyint(1) NOT NULL DEFAULT '0',
  `nooflike` int(11) NOT NULL,
  `allowshare` int(1) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gallary_master`
--

INSERT INTO `gallary_master` (`gallary_id`, `uploadimg`, `description`, `is_video`, `nooflike`, `allowshare`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(2, '5de6380075ce7_1575368704.png', NULL, 0, 5, 0, 1, '2019-12-03 11:07:05', '2019-12-03 04:55:07', 1),
(3, '5de64391380a1_1575371665.png', NULL, 0, 5, 0, 1, '2019-12-03 11:16:43', '2019-12-03 05:46:43', 1),
(4, '5de637e8b959a_1575368680.png', NULL, 0, 5, 0, 1, '2019-12-03 11:15:18', '2019-12-03 05:44:34', 1),
(6, '5de645d96a33a_1575372249.png', NULL, 0, 21, 0, 1, '2019-12-03 05:54:12', '2019-12-03 05:54:12', 1),
(7, '5de6479e2a65b_1575372702.png', NULL, 0, 1212, 0, 1, '2019-12-03 06:01:44', '2019-12-03 06:01:44', 1),
(8, '5de648024c3cc_1575372802.png', NULL, 0, 12, 0, 1, '2019-12-03 06:03:25', '2019-12-03 06:03:25', 1),
(9, '5de649601c4c1_1575373152.png', NULL, 0, 12, 0, 1, '2019-12-03 06:09:19', '2019-12-03 06:09:19', 1),
(10, 'abc.png', 'this is test2', 0, 15, 1, 1, '2019-12-12 11:10:28', '2019-12-12 05:40:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `instructor_right`
--

CREATE TABLE `instructor_right` (
  `instucuteright_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  `submenuid` int(11) NOT NULL,
  `userright` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instructor_right`
--

INSERT INTO `instructor_right` (`instucuteright_id`, `instructor_id`, `menuid`, `submenuid`, `userright`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 0, 0, '2019-12-16 10:51:07', '0000-00-00 00:00:00'),
(2, 1, 3, 0, 0, '2019-12-16 10:51:07', '0000-00-00 00:00:00'),
(3, 1, 4, 0, 0, '2019-12-16 10:51:07', '0000-00-00 00:00:00'),
(4, 1, 6, 0, 0, '2019-12-16 10:51:08', '0000-00-00 00:00:00'),
(5, 1, 7, 0, 0, '2019-12-16 10:51:08', '0000-00-00 00:00:00'),
(6, 1, 8, 0, 0, '2019-12-16 10:51:08', '0000-00-00 00:00:00'),
(7, 1, 10, 0, 0, '2019-12-16 10:51:08', '0000-00-00 00:00:00'),
(8, 1, 11, 0, 0, '2019-12-16 10:51:08', '0000-00-00 00:00:00'),
(9, 1, 12, 0, 1, '2019-12-16 10:51:08', '0000-00-00 00:00:00'),
(10, 1, 12, 1, 0, '2019-12-16 10:51:08', '0000-00-00 00:00:00'),
(11, 1, 12, 2, 0, '2019-12-16 10:51:08', '0000-00-00 00:00:00'),
(12, 1, 12, 3, 0, '2019-12-16 10:51:08', '0000-00-00 00:00:00'),
(13, 1, 12, 4, 0, '2019-12-16 10:51:08', '0000-00-00 00:00:00'),
(14, 1, 12, 5, 0, '2019-12-16 10:51:08', '0000-00-00 00:00:00'),
(15, 2, 2, 0, 0, '2019-12-16 11:20:10', '0000-00-00 00:00:00'),
(16, 2, 3, 0, 0, '2019-12-16 11:20:10', '0000-00-00 00:00:00'),
(17, 2, 4, 0, 0, '2019-12-16 11:20:10', '0000-00-00 00:00:00'),
(18, 2, 6, 0, 0, '2019-12-16 11:20:10', '0000-00-00 00:00:00'),
(19, 2, 7, 0, 0, '2019-12-16 11:20:10', '0000-00-00 00:00:00'),
(20, 2, 8, 0, 0, '2019-12-16 11:20:10', '0000-00-00 00:00:00'),
(21, 2, 10, 0, 0, '2019-12-16 11:20:10', '0000-00-00 00:00:00'),
(22, 2, 11, 0, 0, '2019-12-16 11:20:10', '0000-00-00 00:00:00'),
(23, 2, 12, 0, 1, '2019-12-16 11:20:10', '0000-00-00 00:00:00'),
(24, 2, 12, 1, 0, '2019-12-16 11:20:10', '0000-00-00 00:00:00'),
(25, 2, 12, 2, 0, '2019-12-16 11:20:10', '0000-00-00 00:00:00'),
(26, 2, 12, 3, 0, '2019-12-16 11:20:10', '0000-00-00 00:00:00'),
(27, 2, 12, 4, 0, '2019-12-16 11:20:10', '0000-00-00 00:00:00'),
(28, 2, 12, 5, 0, '2019-12-16 11:20:10', '0000-00-00 00:00:00'),
(29, 3, 2, 0, 0, '2019-12-16 11:22:17', '0000-00-00 00:00:00'),
(30, 3, 3, 0, 0, '2019-12-16 11:22:17', '0000-00-00 00:00:00'),
(31, 3, 4, 0, 0, '2019-12-16 11:22:17', '0000-00-00 00:00:00'),
(32, 3, 6, 0, 0, '2019-12-16 11:22:17', '0000-00-00 00:00:00'),
(33, 3, 7, 0, 0, '2019-12-16 11:22:17', '0000-00-00 00:00:00'),
(34, 3, 8, 0, 0, '2019-12-16 11:22:17', '0000-00-00 00:00:00'),
(35, 3, 10, 0, 0, '2019-12-16 11:22:17', '0000-00-00 00:00:00'),
(36, 3, 11, 0, 0, '2019-12-16 11:22:17', '0000-00-00 00:00:00'),
(37, 3, 12, 0, 1, '2019-12-16 11:22:17', '0000-00-00 00:00:00'),
(38, 3, 12, 1, 0, '2019-12-16 11:22:17', '0000-00-00 00:00:00'),
(39, 3, 12, 2, 0, '2019-12-16 11:22:17', '0000-00-00 00:00:00'),
(40, 3, 12, 3, 0, '2019-12-16 11:22:17', '0000-00-00 00:00:00'),
(41, 3, 12, 4, 0, '2019-12-16 11:22:17', '0000-00-00 00:00:00'),
(42, 3, 12, 5, 0, '2019-12-16 11:22:18', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `instuctor_master`
--

CREATE TABLE `instuctor_master` (
  `instructorid` int(11) NOT NULL,
  `instructor_id` varchar(50) NOT NULL,
  `instructor_name` varchar(100) NOT NULL,
  `instructor_telno` decimal(10,0) NOT NULL,
  `instructor_img` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instuctor_master`
--

INSERT INTO `instuctor_master` (`instructorid`, `instructor_id`, `instructor_name`, `instructor_telno`, `instructor_img`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'z', 'zx', '222', '5df769386541a_1576495416.png', 1, '2019-12-16 05:54:11', '2019-12-16 05:54:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `link_relation_ship`
--

CREATE TABLE `link_relation_ship` (
  `linkrelid` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `userid` decimal(10,0) NOT NULL,
  `relation` varchar(30) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `link_relation_ship`
--

INSERT INTO `link_relation_ship` (`linkrelid`, `member_id`, `name`, `userid`, `relation`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'rakesh dfgdg', '9874656321', 'Main Member', '1234567', 1, '2019-12-10 09:02:40', '0000-00-00 00:00:00'),
(2, 2, 'rakesh dfgdg', '0', 'asds', '12', 1, '2019-12-07 06:31:33', '0000-00-00 00:00:00'),
(10, 9, 'asds', '9632587410', 'Main Member', 'null', 1, '2019-12-12 12:35:58', '0000-00-00 00:00:00'),
(11, 9, 'qwqw', '7574865414', 'friend', 'c6350f241e315a51', 1, '2019-12-12 12:35:58', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `login_master`
--

CREATE TABLE `login_master` (
  `login_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL COMMENT 'profile_id from profile_master',
  `status` int(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_master`
--

INSERT INTO `login_master` (`login_id`, `ref_id`, `user_id`, `password`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin@admin.com', 'MjEyMzJmMjk3YTU3YTVhNzQzODk0YTBlNGE4MDFmYzM=', '1', 1, '2019-12-16 11:07:59', '2019-12-16 04:32:02'),
(3, 2, 'ajaz@gmail.com', 'MjAyY2I5NjJhYzU5MDc1Yjk2NGIwNzE1MmQyMzRiNzA=', '4', 1, '2019-12-16 04:31:09', '2019-12-16 04:31:09'),
(6, 1, 'dzxc', 'YjJjYTY3OGI0YzkzNmY5MDVmYjgyZjI3MzNmNTI5N2Y=', '3', 1, '2019-12-16 05:54:11', '2019-12-16 05:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `log_master`
--

CREATE TABLE `log_master` (
  `log_id` int(11) NOT NULL,
  `dateandtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `module_name` varchar(100) NOT NULL,
  `operation_name` varchar(100) NOT NULL,
  `reference_id` int(11) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log_master`
--

INSERT INTO `log_master` (`log_id`, `dateandtime`, `module_name`, `operation_name`, `reference_id`, `table_name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2019-11-29 12:30:36', 'Package Module', 'Insert', 14, 'package_master', 1, '2019-11-29 07:00:36', '2019-11-29 07:00:36'),
(2, '2019-11-29 12:30:55', 'Package Module', 'Edit', 2, 'package_master', 1, '2019-11-29 07:00:55', '2019-11-29 07:00:55'),
(3, '2019-11-29 12:49:54', 'Package Module', 'Delete', 1, 'package_master', 1, '2019-11-29 07:19:54', '2019-11-29 07:19:54'),
(4, '2019-11-29 12:50:20', 'Package Module', 'Delete', 11, 'package_master', 1, '2019-11-29 07:20:20', '2019-11-29 07:20:20'),
(5, '2019-11-29 12:50:26', 'Package Module', 'Delete', 12, 'package_master', 1, '2019-11-29 07:20:26', '2019-11-29 07:20:26'),
(6, '2019-11-29 13:06:14', 'Package Module', 'Edit', 2, 'package_master', 1, '2019-11-29 07:36:14', '2019-11-29 07:36:14'),
(7, '2019-11-29 13:06:22', 'Package Module', 'Edit', 4, 'package_master', 1, '2019-11-29 07:36:22', '2019-11-29 07:36:22'),
(8, '2019-11-29 13:17:51', 'Package Module', 'Change Status', 3, 'package_master', 1, '2019-11-29 07:47:51', '2019-11-29 07:47:51'),
(9, '2019-11-29 13:18:14', 'Package Module', 'Change Status', 3, 'package_master', 1, '2019-11-29 07:48:14', '2019-11-29 07:48:14'),
(10, '2019-11-29 13:18:27', 'Package Module', 'Change Status', 5, 'package_master', 1, '2019-11-29 07:48:27', '2019-11-29 07:48:27'),
(11, '2019-11-29 13:19:13', 'Package Module', 'Change Status', 5, 'package_master', 1, '2019-11-29 07:49:13', '2019-11-29 07:49:13'),
(12, '2019-11-29 13:19:19', 'Package Module', 'Change Status', 4, 'package_master', 1, '2019-11-29 07:49:19', '2019-11-29 07:49:19'),
(13, '2019-11-29 13:19:26', 'Package Module', 'Change Status', 4, 'package_master', 1, '2019-11-29 07:49:26', '2019-11-29 07:49:26'),
(14, '2019-11-29 13:19:44', 'Package Module', 'Change Status', 6, 'package_master', 1, '2019-11-29 07:49:44', '2019-11-29 07:49:44'),
(15, '2019-11-29 13:19:49', 'Package Module', 'Change Status', 7, 'package_master', 1, '2019-11-29 07:49:49', '2019-11-29 07:49:49'),
(16, '2019-11-29 13:19:53', 'Package Module', 'Change Status', 6, 'package_master', 1, '2019-11-29 07:49:53', '2019-11-29 07:49:53'),
(17, '2019-11-29 13:20:01', 'Package Module', 'Change Status', 6, 'package_master', 1, '2019-11-29 07:50:01', '2019-11-29 07:50:01'),
(18, '2019-11-29 13:20:07', 'Package Module', 'Change Status', 8, 'package_master', 1, '2019-11-29 07:50:07', '2019-11-29 07:50:07'),
(19, '2019-11-29 13:20:17', 'Package Module', 'Change Status', 8, 'package_master', 1, '2019-11-29 07:50:17', '2019-11-29 07:50:17'),
(20, '2019-11-29 13:22:51', 'Package Module', 'Change Status', 2, 'package_master', 1, '2019-11-29 07:52:51', '2019-11-29 07:52:51'),
(21, '2019-11-29 13:22:56', 'Package Module', 'Change Status', 3, 'package_master', 1, '2019-11-29 07:52:56', '2019-11-29 07:52:56'),
(22, '2019-11-29 13:23:01', 'Package Module', 'Change Status', 4, 'package_master', 1, '2019-11-29 07:53:01', '2019-11-29 07:53:01'),
(23, '2019-11-29 13:25:02', 'Package Module', 'Edit', 5, 'package_master', 1, '2019-11-29 07:55:02', '2019-11-29 07:55:02'),
(24, '2019-11-29 13:25:13', 'Package Module', 'Edit', 6, 'package_master', 1, '2019-11-29 07:55:13', '2019-11-29 07:55:13'),
(25, '2019-11-30 05:56:50', 'Package Module', 'Insert', 15, 'package_master', 1, '2019-11-30 00:26:50', '2019-11-30 00:26:50'),
(26, '2019-11-30 05:57:21', 'Package Module', 'Insert', 16, 'package_master', 1, '2019-11-30 00:27:21', '2019-11-30 00:27:21'),
(27, '2019-11-30 06:15:13', 'Package Module', 'Edit', 3, 'package_master', 1, '2019-11-30 00:45:13', '2019-11-30 00:45:13'),
(28, '2019-11-30 06:16:00', 'Package Module', 'Insert', 17, 'package_master', 1, '2019-11-30 00:46:00', '2019-11-30 00:46:00'),
(29, '2019-11-30 06:16:08', 'Package Module', 'Insert', 18, 'package_master', 1, '2019-11-30 00:46:08', '2019-11-30 00:46:08'),
(30, '2019-11-30 06:18:16', 'Package Module', 'Insert', 19, 'package_master', 1, '2019-11-30 00:48:16', '2019-11-30 00:48:16'),
(31, '2019-11-30 06:21:36', 'Package Module', 'Insert', 20, 'package_master', 1, '2019-11-30 00:51:36', '2019-11-30 00:51:36'),
(32, '2019-11-30 06:38:39', 'Package Module', 'Insert', 21, 'package_master', 1, '2019-11-30 01:08:39', '2019-11-30 01:08:39'),
(33, '2019-11-30 06:50:02', 'Package Module', 'Delete', 5, 'package_master', 1, '2019-11-30 01:20:02', '2019-11-30 01:20:02'),
(34, '2019-11-30 06:51:12', 'Package Module', 'Delete', 9, 'package_master', 1, '2019-11-30 01:21:12', '2019-11-30 01:21:12'),
(35, '2019-11-30 06:59:29', 'Package Module', 'Insert', 22, 'package_master', 1, '2019-11-30 01:29:29', '2019-11-30 01:29:29'),
(36, '2019-11-30 07:00:54', 'Package Module', 'Insert', 23, 'package_master', 1, '2019-11-30 01:30:54', '2019-11-30 01:30:54'),
(37, '2019-11-30 07:02:48', 'Package Module', 'Edit', 10, 'package_master', 1, '2019-11-30 01:32:48', '2019-11-30 01:32:48'),
(38, '2019-11-30 07:21:55', 'Package Module', 'Insert', 24, 'package_master', 1, '2019-11-30 01:51:55', '2019-11-30 01:51:55'),
(39, '2019-11-30 09:06:55', 'Class Category Module', 'Insert', 2, 'classcategory_master', 1, '2019-11-30 03:36:55', '2019-11-30 03:36:55'),
(40, '2019-11-30 09:10:08', 'Class Category Module', 'Insert', 3, 'classcategory_master', 1, '2019-11-30 03:40:08', '2019-11-30 03:40:08'),
(41, '2019-11-30 09:10:23', 'Class Category Module', 'Insert', 4, 'classcategory_master', 1, '2019-11-30 03:40:23', '2019-11-30 03:40:23'),
(42, '2019-11-30 09:27:27', 'Class Category Module', 'Edit', 2, 'classcategory_master', 1, '2019-11-30 03:57:27', '2019-11-30 03:57:27'),
(43, '2019-11-30 09:28:46', 'Class Category Module', 'Edit', 2, 'classcategory_master', 1, '2019-11-30 03:58:46', '2019-11-30 03:58:46'),
(44, '2019-11-30 09:37:54', 'Class Category Module', 'Edit', 1, 'classcategory_master', 1, '2019-11-30 04:07:54', '2019-11-30 04:07:54'),
(45, '2019-11-30 09:38:09', 'Class Category Module', 'Edit', 2, 'classcategory_master', 1, '2019-11-30 04:08:09', '2019-11-30 04:08:09'),
(46, '2019-11-30 09:43:29', 'Class Category Module', 'Delete', 3, 'classcategory_master', 1, '2019-11-30 04:13:29', '2019-11-30 04:13:29'),
(47, '2019-11-30 09:43:34', 'Class Category Module', 'Delete', 3, 'classcategory_master', 1, '2019-11-30 04:13:34', '2019-11-30 04:13:34'),
(48, '2019-11-30 09:44:00', 'Class Category Module', 'Delete', 3, 'classcategory_master', 1, '2019-11-30 04:14:00', '2019-11-30 04:14:00'),
(49, '2019-11-30 09:51:50', 'Class Category Module', 'Delete', 4, 'classcategory_master', 1, '2019-11-30 04:21:50', '2019-11-30 04:21:50'),
(50, '2019-11-30 09:52:18', 'Class Category Module', 'Delete', 10, 'classcategory_master', 1, '2019-11-30 04:22:18', '2019-11-30 04:22:18'),
(51, '2019-11-30 09:52:42', 'Class Category Module', 'Delete', 15, 'classcategory_master', 1, '2019-11-30 04:22:42', '2019-11-30 04:22:42'),
(52, '2019-11-30 09:52:59', 'Class Category Module', 'Delete', 15, 'classcategory_master', 1, '2019-11-30 04:22:59', '2019-11-30 04:22:59'),
(53, '2019-11-30 09:57:13', 'Class Category Module', 'Edit', 1, 'classcategory_master', 1, '2019-11-30 04:27:13', '2019-11-30 04:27:13'),
(54, '2019-11-30 10:00:20', 'Class Category Module', 'Edit', 1, 'classcategory_master', 1, '2019-11-30 04:30:20', '2019-11-30 04:30:20'),
(55, '2019-11-30 10:08:21', 'Class Category Module', 'Change Status', 1, 'classcategory_master', 1, '2019-11-30 04:38:21', '2019-11-30 04:38:21'),
(56, '2019-11-30 10:08:28', 'Class Category Module', 'Change Status', 2, 'classcategory_master', 1, '2019-11-30 04:38:28', '2019-11-30 04:38:28'),
(57, '2019-11-30 10:08:31', 'Class Category Module', 'Change Status', 1, 'classcategory_master', 1, '2019-11-30 04:38:31', '2019-11-30 04:38:31'),
(58, '2019-11-30 10:09:04', 'Class Category Module', 'Insert', 5, 'classcategory_master', 1, '2019-11-30 04:39:04', '2019-11-30 04:39:04'),
(59, '2019-11-30 10:22:49', 'Room master Module', 'Insert', 2, 'room_master', 1, '2019-11-30 04:52:49', '2019-11-30 04:52:49'),
(60, '2019-11-30 10:29:11', 'Room master Module', 'Insert', 3, 'room_master', 1, '2019-11-30 04:59:11', '2019-11-30 04:59:11'),
(61, '2019-11-30 10:35:11', 'Room master Module', 'Edit', 1, 'room_master', 1, '2019-11-30 05:05:11', '2019-11-30 05:05:11'),
(62, '2019-11-30 10:35:19', 'Room master Module', 'Delete', 3, 'room_master', 1, '2019-11-30 05:05:19', '2019-11-30 05:05:19'),
(63, '2019-11-30 10:35:38', 'Room master Module', 'Delete', 3, 'room_master', 1, '2019-11-30 05:05:38', '2019-11-30 05:05:38'),
(64, '2019-11-30 10:36:05', 'Room master Module', 'Delete', 3, 'room_master', 1, '2019-11-30 05:06:05', '2019-11-30 05:06:05'),
(65, '2019-11-30 10:43:08', 'Room master Module', 'Edit', 2, 'room_master', 1, '2019-11-30 05:13:08', '2019-11-30 05:13:08'),
(66, '2019-11-30 10:43:47', 'Room Module', 'Delete', 1, 'room_master', 1, '2019-11-30 05:13:47', '2019-11-30 05:13:47'),
(67, '2019-11-30 10:43:54', 'Room Module', 'Delete', 2, 'room_master', 1, '2019-11-30 05:13:54', '2019-11-30 05:13:54'),
(68, '2019-11-30 10:44:42', 'Room Module', 'Delete', 2, 'room_master', 1, '2019-11-30 05:14:42', '2019-11-30 05:14:42'),
(69, '2019-11-30 10:47:17', 'Room master Module', 'Change Status', 1, 'room_master', 1, '2019-11-30 05:17:17', '2019-11-30 05:17:17'),
(70, '2019-11-30 10:47:45', 'Room master Module', 'Insert', 4, 'room_master', 1, '2019-11-30 05:17:45', '2019-11-30 05:17:45'),
(71, '2019-11-30 10:48:43', 'Room master Module', 'Edit', 1, 'room_master', 1, '2019-11-30 05:18:43', '2019-11-30 05:18:43'),
(72, '2019-11-30 10:48:51', 'Room master Module', 'Insert', 5, 'room_master', 1, '2019-11-30 05:18:51', '2019-11-30 05:18:51'),
(73, '2019-11-30 11:22:42', 'Class master Module', 'Insert', 1, 'class_master', 1, '2019-11-30 05:52:42', '2019-11-30 05:52:42'),
(74, '2019-11-30 11:39:21', 'Class master Module', 'Insert', 2, 'class_master', 1, '2019-11-30 06:09:21', '2019-11-30 06:09:21'),
(75, '2019-11-30 11:45:07', 'Class master Module', 'Edit', 1, 'class_master', 1, '2019-11-30 06:15:07', '2019-11-30 06:15:07'),
(76, '2019-11-30 11:45:12', 'Class master Module', 'Edit', 1, 'class_master', 1, '2019-11-30 06:15:12', '2019-11-30 06:15:12'),
(77, '2019-11-30 11:47:26', 'Class master Module', 'Delete', 1, 'classcategory_master', 1, '2019-11-30 06:17:26', '2019-11-30 06:17:26'),
(78, '2019-11-30 11:49:14', 'Class master Module', 'Change Status', 2, 'classcategory_master', 1, '2019-11-30 06:19:14', '2019-11-30 06:19:14'),
(79, '2019-11-30 11:49:20', 'Class master Module', 'Change Status', 2, 'classcategory_master', 1, '2019-11-30 06:19:20', '2019-11-30 06:19:20'),
(80, '2019-11-30 11:49:55', 'Class master Module', 'Change Status', 2, 'class_master', 1, '2019-11-30 06:19:55', '2019-11-30 06:19:55'),
(81, '2019-11-30 11:50:03', 'Class master Module', 'Change Status', 2, 'class_master', 1, '2019-11-30 06:20:03', '2019-11-30 06:20:03'),
(82, '2019-11-30 11:50:10', 'Class master Module', 'Insert', 3, 'class_master', 1, '2019-11-30 06:20:10', '2019-11-30 06:20:10'),
(83, '2019-11-30 11:50:13', 'Class master Module', 'Change Status', 2, 'class_master', 1, '2019-11-30 06:20:13', '2019-11-30 06:20:13'),
(84, '2019-11-30 11:50:22', 'Class master Module', 'Change Status', 2, 'class_master', 1, '2019-11-30 06:20:22', '2019-11-30 06:20:22'),
(85, '2019-11-30 11:54:39', 'Class master Module', 'Insert', 4, 'class_master', 1, '2019-11-30 06:24:39', '2019-11-30 06:24:39'),
(86, '2019-11-30 12:02:38', 'Class master Module', 'Edit', 2, 'class_master', 1, '2019-11-30 06:32:38', '2019-11-30 06:32:38'),
(87, '2019-11-30 12:04:46', 'Class Master Module', 'Delete', 3, 'class_master', 1, '2019-11-30 06:34:46', '2019-11-30 06:34:46'),
(88, '2019-12-02 04:09:28', 'Class Schedule Module', 'Edit', 1, 'class_sechedule_master', 1, '2019-12-01 22:39:28', '2019-12-01 22:39:28'),
(89, '2019-12-02 04:14:26', 'Class Schedule Module', 'Edit', 1, 'class_sechedule_master', 1, '2019-12-01 22:44:26', '2019-12-01 22:44:26'),
(90, '2019-12-02 04:14:34', 'Class Schedule Module', 'Insert', 2, 'class_sechedule_master', 1, '2019-12-01 22:44:34', '2019-12-01 22:44:34'),
(91, '2019-12-02 04:14:43', 'Class Schedule Module', 'Delete', 2, 'class_sechedule_master', 1, '2019-12-01 22:44:43', '2019-12-01 22:44:43'),
(92, '2019-12-02 04:18:32', 'Class Schedule Module', 'Insert', 3, 'class_sechedule_master', 1, '2019-12-01 22:48:32', '2019-12-01 22:48:32'),
(93, '2019-12-02 04:19:49', 'Class Schedule Module', 'Edit', 3, 'class_sechedule_master', 1, '2019-12-01 22:49:49', '2019-12-01 22:49:49'),
(94, '2019-12-02 04:28:49', 'Class Schedule Module', 'Insert', 4, 'class_sechedule_master', 1, '2019-12-01 22:58:49', '2019-12-01 22:58:49'),
(95, '2019-12-02 04:29:43', 'Class Schedule Module', 'Edit', 4, 'class_sechedule_master', 1, '2019-12-01 22:59:43', '2019-12-01 22:59:43'),
(96, '2019-12-02 04:34:43', 'Class Schedule Module', 'Insert', 5, 'class_sechedule_master', 1, '2019-12-01 23:04:43', '2019-12-01 23:04:43'),
(97, '2019-12-02 04:37:14', 'Class Schedule  Module', 'Delete', 5, 'class_sechedule_master', 1, '2019-12-01 23:07:14', '2019-12-01 23:07:14'),
(98, '2019-12-03 04:01:30', 'Class Schedule Module', 'Edit', 4, 'class_sechedule_master', 1, '2019-12-02 22:31:30', '2019-12-02 22:31:30'),
(99, '2019-12-03 04:03:05', 'Class Schedule Module', 'Insert', 5, 'class_sechedule_master', 1, '2019-12-02 22:33:05', '2019-12-02 22:33:05'),
(100, '2019-12-03 04:41:14', 'Class master Module', 'Edit', 4, 'class_master', 1, '2019-12-02 23:11:14', '2019-12-02 23:11:14'),
(101, '2019-12-03 04:44:46', 'Class master Module', 'Edit', 4, 'class_master', 1, '2019-12-02 23:14:46', '2019-12-02 23:14:46'),
(102, '2019-12-03 05:17:30', 'Deal Master Module', 'Insert', 1, 'deal_master', 1, '2019-12-02 23:47:30', '2019-12-02 23:47:30'),
(103, '2019-12-03 05:20:02', 'Deal Master Module', 'Insert', 2, 'deal_master', 1, '2019-12-02 23:50:02', '2019-12-02 23:50:02'),
(104, '2019-12-03 05:24:11', 'Deal Master Module', 'Insert', 3, 'deal_master', 1, '2019-12-02 23:54:11', '2019-12-02 23:54:11'),
(105, '2019-12-03 05:57:47', 'Deal Master Module', 'Edit', 1, 'deal_master', 1, '2019-12-03 00:27:47', '2019-12-03 00:27:47'),
(106, '2019-12-03 06:05:31', 'Deal Master Module', 'Delete', 2, 'deal_master', 1, '2019-12-03 00:35:31', '2019-12-03 00:35:31'),
(107, '2019-12-03 06:15:05', 'Deal Master Module', 'Insert', 4, 'deal_master', 1, '2019-12-03 00:45:05', '2019-12-03 00:45:05'),
(108, '2019-12-03 06:15:42', 'Deal Master Module', 'Delete', 4, 'deal_master', 1, '2019-12-03 00:45:42', '2019-12-03 00:45:42'),
(109, '2019-12-03 06:17:51', 'Deal Master Module', 'Insert', 5, 'deal_master', 1, '2019-12-03 00:47:51', '2019-12-03 00:47:51'),
(110, '2019-12-03 06:20:30', 'Deal Master Module', 'Edit', 5, 'deal_master', 1, '2019-12-03 00:50:30', '2019-12-03 00:50:30'),
(111, '2019-12-03 07:18:49', 'Package Module', 'Edit', 2, 'package_master', 1, '2019-12-03 01:48:49', '2019-12-03 01:48:49'),
(112, '2019-12-03 07:21:14', 'Package Module', 'Edit', 2, 'package_master', 1, '2019-12-03 01:51:14', '2019-12-03 01:51:14'),
(113, '2019-12-03 07:21:33', 'Package Module', 'Edit', 2, 'package_master', 1, '2019-12-03 01:51:33', '2019-12-03 01:51:33'),
(114, '2019-12-03 07:24:19', 'Package Module', 'Edit', 2, 'package_master', 1, '2019-12-03 01:54:19', '2019-12-03 01:54:19'),
(115, '2019-12-03 07:26:11', 'Package Module', 'Edit', 2, 'package_master', 1, '2019-12-03 01:56:11', '2019-12-03 01:56:11'),
(116, '2019-12-03 09:04:40', 'Package Module', 'Insert', 25, 'package_master', 1, '2019-12-03 03:34:40', '2019-12-03 03:34:40'),
(117, '2019-12-03 09:07:33', 'Package Module', 'Edit', 7, 'package_master', 1, '2019-12-03 03:37:33', '2019-12-03 03:37:33'),
(118, '2019-12-03 09:08:18', 'Package Module', 'Edit', 3, 'package_master', 1, '2019-12-03 03:38:18', '2019-12-03 03:38:18'),
(119, '2019-12-03 09:14:51', 'Class Category Module', 'Edit', 1, 'classcategory_master', 1, '2019-12-03 03:44:51', '2019-12-03 03:44:51'),
(120, '2019-12-03 09:15:02', 'Class Category Module', 'Edit', 1, 'classcategory_master', 1, '2019-12-03 03:45:02', '2019-12-03 03:45:02'),
(121, '2019-12-03 09:16:58', 'Class Category Module', 'Insert', 6, 'classcategory_master', 1, '2019-12-03 03:46:58', '2019-12-03 03:46:58'),
(122, '2019-12-03 09:24:50', 'Room master Module', 'Delete', 1, 'room_master', 1, '2019-12-03 03:54:50', '2019-12-03 03:54:50'),
(123, '2019-12-03 09:25:19', 'Room master Module', 'Change Status', 5, 'room_master', 1, '2019-12-03 03:55:19', '2019-12-03 03:55:19'),
(124, '2019-12-03 09:25:37', 'Room master Module', 'Edit', 5, 'room_master', 1, '2019-12-03 03:55:37', '2019-12-03 03:55:37'),
(125, '2019-12-03 09:25:42', 'Deal Master Module', 'Edit', 5, 'deal_master', 1, '2019-12-03 03:55:42', '2019-12-03 03:55:42'),
(126, '2019-12-03 09:25:44', 'Room master Module', 'Insert', 6, 'room_master', 1, '2019-12-03 03:55:44', '2019-12-03 03:55:44'),
(127, '2019-12-03 09:26:18', 'Deal Master Module', 'Edit', 1, 'deal_master', 1, '2019-12-03 03:56:18', '2019-12-03 03:56:18'),
(128, '2019-12-03 09:27:11', 'Class master Module', 'Insert', 5, 'class_master', 1, '2019-12-03 03:57:11', '2019-12-03 03:57:11'),
(129, '2019-12-03 09:27:27', 'Class master Module', 'Insert', 6, 'class_master', 1, '2019-12-03 03:57:27', '2019-12-03 03:57:27'),
(130, '2019-12-03 09:27:32', 'Deal Master Module', 'Edit', 5, 'deal_master', 1, '2019-12-03 03:57:32', '2019-12-03 03:57:32'),
(131, '2019-12-03 09:27:40', 'Deal Master Module', 'Edit', 5, 'deal_master', 1, '2019-12-03 03:57:40', '2019-12-03 03:57:40'),
(132, '2019-12-03 09:28:34', 'Class master Module', 'Edit', 6, 'class_master', 1, '2019-12-03 03:58:34', '2019-12-03 03:58:34'),
(133, '2019-12-03 09:28:44', 'Class master Module', 'Edit', 6, 'class_master', 1, '2019-12-03 03:58:44', '2019-12-03 03:58:44'),
(134, '2019-12-03 09:28:46', 'Deal Master Module', 'Edit', 1, 'deal_master', 1, '2019-12-03 03:58:46', '2019-12-03 03:58:46'),
(135, '2019-12-03 09:28:50', 'Class master Module', 'Edit', 6, 'class_master', 1, '2019-12-03 03:58:50', '2019-12-03 03:58:50'),
(136, '2019-12-03 09:30:03', 'Deal Master Module', 'Edit', 1, 'deal_master', 1, '2019-12-03 04:00:03', '2019-12-03 04:00:03'),
(137, '2019-12-03 09:31:54', 'Deal Master Module', 'Edit', 1, 'deal_master', 1, '2019-12-03 04:01:54', '2019-12-03 04:01:54'),
(138, '2019-12-03 09:32:07', 'Deal Master Module', 'Edit', 1, 'deal_master', 1, '2019-12-03 04:02:07', '2019-12-03 04:02:07'),
(139, '2019-12-03 09:32:57', 'Deal Master Module', 'Edit', 5, 'deal_master', 1, '2019-12-03 04:02:57', '2019-12-03 04:02:57'),
(140, '2019-12-03 09:33:30', 'Deal Master Module', 'Edit', 1, 'deal_master', 1, '2019-12-03 04:03:30', '2019-12-03 04:03:30'),
(141, '2019-12-03 09:35:27', 'Class master Module', 'Edit', 4, 'class_master', 1, '2019-12-03 04:05:27', '2019-12-03 04:05:27'),
(142, '2019-12-03 09:35:36', 'Class master Module', 'Edit', 4, 'class_master', 1, '2019-12-03 04:05:36', '2019-12-03 04:05:36'),
(143, '2019-12-03 09:37:23', 'Class master Module', 'Insert', 7, 'class_master', 1, '2019-12-03 04:07:23', '2019-12-03 04:07:23'),
(144, '2019-12-03 09:39:26', 'Class master Module', 'Edit', 4, 'class_master', 1, '2019-12-03 04:09:26', '2019-12-03 04:09:26'),
(145, '2019-12-03 09:41:10', 'Class master Module', 'Edit', 2, 'class_master', 1, '2019-12-03 04:11:10', '2019-12-03 04:11:10'),
(146, '2019-12-03 09:42:24', 'Class master Module', 'Edit', 2, 'class_master', 1, '2019-12-03 04:12:24', '2019-12-03 04:12:24'),
(147, '2019-12-03 09:43:29', 'Class master Module', 'Edit', 2, 'class_master', 1, '2019-12-03 04:13:29', '2019-12-03 04:13:29'),
(148, '2019-12-03 09:59:44', 'Class Schedule Module', 'Insert', 6, 'class_sechedule_master', 1, '2019-12-03 04:29:44', '2019-12-03 04:29:44'),
(149, '2019-12-03 10:08:44', 'Deal Master Module', 'Insert', 6, 'deal_master', 1, '2019-12-03 04:38:44', '2019-12-03 04:38:44'),
(150, '2019-12-03 10:25:07', 'Gallary Master Module', 'Insert', 2, 'deal_master', 1, '2019-12-03 04:55:07', '2019-12-03 04:55:07'),
(151, '2019-12-03 10:59:56', 'Gallary Master Module', 'Change Allowshare', 0, 'gallary_master', 1, '2019-12-03 05:29:56', '2019-12-03 05:29:56'),
(152, '2019-12-03 11:01:04', 'Gallary Master Module', 'Change Allowshare', 0, 'gallary_master', 1, '2019-12-03 05:31:04', '2019-12-03 05:31:04'),
(153, '2019-12-03 11:01:15', 'Gallary Master Module', 'Change Allowshare', 0, 'gallary_master', 1, '2019-12-03 05:31:15', '2019-12-03 05:31:15'),
(154, '2019-12-03 11:01:53', 'Gallary Master Module', 'Change Allowshare', 2, 'gallary_master', 1, '2019-12-03 05:31:53', '2019-12-03 05:31:53'),
(155, '2019-12-03 11:01:58', 'Gallary Master Module', 'Change Allowshare', 2, 'gallary_master', 1, '2019-12-03 05:31:58', '2019-12-03 05:31:58'),
(156, '2019-12-03 11:03:46', 'Gallary Master Module', 'Change Allowshare', 2, 'gallary_master', 1, '2019-12-03 05:33:46', '2019-12-03 05:33:46'),
(157, '2019-12-03 11:03:49', 'Gallary Master Module', 'Change Allowshare', 2, 'gallary_master', 1, '2019-12-03 05:33:49', '2019-12-03 05:33:49'),
(158, '2019-12-03 11:04:05', 'Gallary Master Module', 'Change Allowshare', 2, 'gallary_master', 1, '2019-12-03 05:34:05', '2019-12-03 05:34:05'),
(159, '2019-12-03 11:04:10', 'Gallary Master Module', 'Change Allowshare', 2, 'gallary_master', 1, '2019-12-03 05:34:10', '2019-12-03 05:34:10'),
(160, '2019-12-03 11:04:14', 'Gallary Master Module', 'Change Allowshare', 2, 'gallary_master', 1, '2019-12-03 05:34:14', '2019-12-03 05:34:14'),
(161, '2019-12-03 11:05:18', 'Gallary Master Module', 'Change Allowshare', 2, 'gallary_master', 1, '2019-12-03 05:35:18', '2019-12-03 05:35:18'),
(162, '2019-12-03 11:05:25', 'Gallary Master Module', 'Change Allowshare', 2, 'gallary_master', 1, '2019-12-03 05:35:25', '2019-12-03 05:35:25'),
(163, '2019-12-03 11:05:27', 'Gallary Master Module', 'Change Allowshare', 2, 'gallary_master', 1, '2019-12-03 05:35:27', '2019-12-03 05:35:27'),
(164, '2019-12-03 11:07:05', 'Gallary Master Module', 'Change Allowshare', 2, 'gallary_master', 1, '2019-12-03 05:37:05', '2019-12-03 05:37:05'),
(165, '2019-12-03 11:14:27', 'Gallary Master Module', 'Insert', 3, 'deal_master', 1, '2019-12-03 05:44:27', '2019-12-03 05:44:27'),
(166, '2019-12-03 11:14:34', 'Gallary Master Module', 'Insert', 4, 'deal_master', 1, '2019-12-03 05:44:34', '2019-12-03 05:44:34'),
(167, '2019-12-03 11:15:18', 'Gallary Master Module', 'Change Allowshare', 4, 'gallary_master', 1, '2019-12-03 05:45:18', '2019-12-03 05:45:18'),
(168, '2019-12-03 11:15:24', 'Gallary Master Module', 'Edit', 3, 'deal_master', 1, '2019-12-03 05:45:24', '2019-12-03 05:45:24'),
(169, '2019-12-03 11:16:22', 'Gallary Master Module', 'Insert', 5, 'deal_master', 1, '2019-12-03 05:46:22', '2019-12-03 05:46:22'),
(170, '2019-12-03 11:16:32', 'Gallary Master Module', 'Edit', 1, 'deal_master', 1, '2019-12-03 05:46:32', '2019-12-03 05:46:32'),
(171, '2019-12-03 11:16:43', 'Gallary Master Module', 'Edit', 3, 'deal_master', 1, '2019-12-03 05:46:43', '2019-12-03 05:46:43'),
(172, '2019-12-03 11:20:21', 'Gallary Master Module', 'Delete', 1, 'gallary_master', 1, '2019-12-03 05:50:21', '2019-12-03 05:50:21'),
(173, '2019-12-03 11:24:12', 'Gallary Master Module', 'Insert', 6, 'gallary_master', 1, '2019-12-03 05:54:12', '2019-12-03 05:54:12'),
(174, '2019-12-03 11:24:57', 'Class master Module', 'Insert', 8, 'class_master', 1, '2019-12-03 05:54:57', '2019-12-03 05:54:57'),
(175, '2019-12-03 11:25:08', 'Class master Module', 'Edit', 2, 'class_master', 1, '2019-12-03 05:55:08', '2019-12-03 05:55:08'),
(176, '2019-12-03 11:31:44', 'Gallary Master Module', 'Insert', 7, 'gallary_master', 1, '2019-12-03 06:01:44', '2019-12-03 06:01:44'),
(177, '2019-12-03 11:32:53', 'Gallary Master Module', 'Edit', 5, 'gallary_master', 1, '2019-12-03 06:02:53', '2019-12-03 06:02:53'),
(178, '2019-12-03 11:33:25', 'Gallary Master Module', 'Insert', 8, 'gallary_master', 1, '2019-12-03 06:03:25', '2019-12-03 06:03:25'),
(179, '2019-12-03 11:39:19', 'Gallary Master Module', 'Insert', 9, 'gallary_master', 1, '2019-12-03 06:09:19', '2019-12-03 06:09:19'),
(180, '2019-12-03 11:39:42', 'Gallary Master Module', 'Delete', 5, 'gallary_master', 1, '2019-12-03 06:09:42', '2019-12-03 06:09:42'),
(181, '2019-12-03 11:42:27', 'Gallary Master Module', 'Insert', 10, 'gallary_master', 1, '2019-12-03 06:12:27', '2019-12-03 06:12:27'),
(182, '2019-12-03 11:44:17', 'Class Category Module', 'Insert', 7, 'classcategory_master', 1, '2019-12-03 06:14:17', '2019-12-03 06:14:17'),
(183, '2019-12-03 11:45:14', 'Class Category Module', 'Insert', 8, 'classcategory_master', 1, '2019-12-03 06:15:14', '2019-12-03 06:15:14'),
(184, '2019-12-03 11:45:26', 'Class Category Module', 'Insert', 9, 'classcategory_master', 1, '2019-12-03 06:15:26', '2019-12-03 06:15:26'),
(185, '2019-12-04 03:47:27', 'Class Category Module', 'Insert', 10, 'classcategory_master', 1, '2019-12-03 22:17:27', '2019-12-03 22:17:27'),
(186, '2019-12-04 03:53:06', 'Class Category Module', 'Insert', 11, 'classcategory_master', 1, '2019-12-03 22:23:06', '2019-12-03 22:23:06'),
(187, '2019-12-04 03:53:28', 'Class Category Module', 'Edit', 5, 'classcategory_master', 1, '2019-12-03 22:23:28', '2019-12-03 22:23:28'),
(188, '2019-12-04 03:57:44', 'Class Category Module', 'Edit', 1, 'classcategory_master', 1, '2019-12-03 22:27:44', '2019-12-03 22:27:44'),
(189, '2019-12-04 04:02:53', 'Package Module', 'Edit', 25, 'package_master', 1, '2019-12-03 22:32:53', '2019-12-03 22:32:53'),
(190, '2019-12-04 04:07:14', 'Class Category Module', 'Edit', 10, 'classcategory_master', 1, '2019-12-03 22:37:14', '2019-12-03 22:37:14'),
(191, '2019-12-04 04:15:23', 'Room master Module', 'Insert', 7, 'room_master', 1, '2019-12-03 22:45:23', '2019-12-03 22:45:23'),
(192, '2019-12-04 04:25:00', 'Room master Module', 'Edit', 4, 'room_master', 1, '2019-12-03 22:55:00', '2019-12-03 22:55:00'),
(193, '2019-12-04 04:25:02', 'Room master Module', 'Change Status', 5, 'room_master', 1, '2019-12-03 22:55:02', '2019-12-03 22:55:02'),
(194, '2019-12-04 04:27:27', 'Package Module', 'Edit', 10, 'package_master', 1, '2019-12-03 22:57:27', '2019-12-03 22:57:27'),
(195, '2019-12-04 04:29:15', 'Package Module', 'Edit', 10, 'package_master', 1, '2019-12-03 22:59:15', '2019-12-03 22:59:15'),
(196, '2019-12-04 04:29:39', 'Package Module', 'Edit', 10, 'package_master', 1, '2019-12-03 22:59:39', '2019-12-03 22:59:39'),
(197, '2019-12-04 04:31:30', 'Package Module', 'Edit', 10, 'package_master', 1, '2019-12-03 23:01:30', '2019-12-03 23:01:30'),
(198, '2019-12-04 04:33:10', 'Package Module', 'Edit', 22, 'package_master', 1, '2019-12-03 23:03:10', '2019-12-03 23:03:10'),
(199, '2019-12-04 04:33:59', 'Package Module', 'Edit', 24, 'package_master', 1, '2019-12-03 23:03:59', '2019-12-03 23:03:59'),
(200, '2019-12-04 04:35:59', 'Room master Module', 'Edit', 4, 'room_master', 1, '2019-12-03 23:05:59', '2019-12-03 23:05:59'),
(201, '2019-12-04 04:51:50', 'Class master Module', 'Edit', 2, 'class_master', 1, '2019-12-03 23:21:50', '2019-12-03 23:21:50'),
(202, '2019-12-04 04:51:56', 'Class master Module', 'Edit', 2, 'class_master', 1, '2019-12-03 23:21:56', '2019-12-03 23:21:56'),
(203, '2019-12-04 04:51:59', 'Class master Module', 'Change Status', 2, 'class_master', 1, '2019-12-03 23:21:59', '2019-12-03 23:21:59'),
(204, '2019-12-04 04:52:08', 'Class master Module', 'Edit', 4, 'class_master', 1, '2019-12-03 23:22:08', '2019-12-03 23:22:08'),
(205, '2019-12-04 04:54:08', 'Class master Module', 'Edit', 8, 'class_master', 1, '2019-12-03 23:24:08', '2019-12-03 23:24:08'),
(206, '2019-12-04 05:02:06', 'Class master Module', 'Change Status', 8, 'class_master', 1, '2019-12-03 23:32:06', '2019-12-03 23:32:06'),
(207, '2019-12-04 05:02:27', 'Class Category Module', 'Change Status', 5, 'classcategory_master', 1, '2019-12-03 23:32:27', '2019-12-03 23:32:27'),
(208, '2019-12-04 06:30:39', 'Deal Master Module', 'Insert', 7, 'deal_master', 1, '2019-12-04 01:00:39', '2019-12-04 01:00:39'),
(209, '2019-12-04 06:34:28', 'Deal Master Module', 'Insert', 8, 'deal_master', 1, '2019-12-04 01:04:28', '2019-12-04 01:04:28'),
(210, '2019-12-04 06:34:42', 'Deal Master Module', 'Edit', 8, 'deal_master', 1, '2019-12-04 01:04:42', '2019-12-04 01:04:42'),
(211, '2019-12-04 06:47:23', 'Deal Master Module', 'Insert', 9, 'deal_master', 1, '2019-12-04 01:17:23', '2019-12-04 01:17:23'),
(212, '2019-12-04 06:47:45', 'Deal Master Module', 'Insert', 10, 'deal_master', 1, '2019-12-04 01:17:45', '2019-12-04 01:17:45'),
(213, '2019-12-04 06:48:45', 'Deal Master Module', 'Insert', 11, 'deal_master', 1, '2019-12-04 01:18:45', '2019-12-04 01:18:45'),
(214, '2019-12-04 07:36:28', 'Class Schedule Module', 'Insert', 7, 'class_sechedule_master', 1, '2019-12-04 02:06:28', '2019-12-04 02:06:28'),
(215, '2019-12-04 07:47:25', 'Class Schedule Module', 'Insert', 8, 'class_sechedule_master', 1, '2019-12-04 02:17:25', '2019-12-04 02:17:25'),
(216, '2019-12-04 09:04:53', 'Class master Module', 'Edit', 7, 'class_master', 1, '2019-12-04 03:34:53', '2019-12-04 03:34:53'),
(217, '2019-12-04 09:32:04', 'Class Schedule Module', 'Insert', 9, 'class_sechedule_master', 1, '2019-12-04 04:02:04', '2019-12-04 04:02:04'),
(218, '2019-12-04 09:57:57', 'Class Schedule Module', 'Insert', 10, 'class_sechedule_master', 1, '2019-12-04 04:27:57', '2019-12-04 04:27:57'),
(219, '2019-12-04 10:22:15', 'Class Schedule  Module', 'Change Status', 0, 'class_sechedule_master', 1, '2019-12-04 04:52:15', '2019-12-04 04:52:15'),
(220, '2019-12-04 10:22:24', 'Class Schedule  Module', 'Change Status', 0, 'class_sechedule_master', 1, '2019-12-04 04:52:24', '2019-12-04 04:52:24'),
(221, '2019-12-04 10:23:12', 'Class Schedule  Module', 'Change Status', 0, 'class_sechedule_master', 1, '2019-12-04 04:53:12', '2019-12-04 04:53:12'),
(222, '2019-12-04 10:23:18', 'Class Schedule  Module', 'Change Status', 0, 'class_sechedule_master', 1, '2019-12-04 04:53:18', '2019-12-04 04:53:18'),
(223, '2019-12-04 10:23:22', 'Class Schedule  Module', 'Change Status', 0, 'class_sechedule_master', 1, '2019-12-04 04:53:22', '2019-12-04 04:53:22'),
(224, '2019-12-04 10:24:33', 'Class Schedule  Module', 'Change Status', 8, 'class_sechedule_master', 1, '2019-12-04 04:54:33', '2019-12-04 04:54:33'),
(225, '2019-12-04 10:24:43', 'Class Schedule  Module', 'Change Status', 8, 'class_sechedule_master', 1, '2019-12-04 04:54:43', '2019-12-04 04:54:43'),
(226, '2019-12-04 10:56:24', 'Deal Master Module', 'Insert', 12, 'deal_master', 1, '2019-12-04 05:26:24', '2019-12-04 05:26:24'),
(227, '2019-12-04 11:13:21', 'Deal Master Module', 'Insert', 13, 'deal_master', 1, '2019-12-04 05:43:21', '2019-12-04 05:43:21'),
(228, '2019-12-04 11:15:21', 'Deal Master Module', 'Edit', 12, 'deal_master', 1, '2019-12-04 05:45:21', '2019-12-04 05:45:21'),
(229, '2019-12-04 12:20:12', 'Class Schedule Module', 'Insert', 11, 'class_sechedule_master', 1, '2019-12-04 06:50:12', '2019-12-04 06:50:12'),
(230, '2019-12-04 12:23:24', 'Class Schedule Module', 'Insert', 12, 'class_sechedule_master', 1, '2019-12-04 06:53:24', '2019-12-04 06:53:24'),
(231, '2019-12-04 12:30:37', 'Class Schedule Module', 'Insert', 13, 'class_sechedule_master', 1, '2019-12-04 07:00:37', '2019-12-04 07:00:37'),
(232, '2019-12-05 10:18:23', 'Profile  Module', 'Edit', 1, 'profile_master', 1, '2019-12-05 04:48:23', '2019-12-05 04:48:23'),
(233, '2019-12-05 10:18:56', 'Profile  Module', 'Edit', 1, 'profile_master', 1, '2019-12-05 04:48:56', '2019-12-05 04:48:56'),
(234, '2019-12-05 10:25:24', 'Profile  Module', 'Edit', 1, 'profile_master', 1, '2019-12-05 04:55:24', '2019-12-05 04:55:24'),
(235, '2019-12-05 10:26:13', 'Profile Module', 'Insert', 2, 'profile_master', 1, '2019-12-05 04:56:13', '2019-12-05 04:56:13'),
(236, '2019-12-05 10:31:41', 'Profile  Module', 'Edit', 2, 'profile_master', 1, '2019-12-05 05:01:41', '2019-12-05 05:01:41'),
(237, '2019-12-05 10:32:27', 'Profile  Module', 'Edit', 1, 'profile_master', 1, '2019-12-05 05:02:27', '2019-12-05 05:02:27'),
(238, '2019-12-05 10:34:00', 'Profile  Module', 'Edit', 2, 'profile_master', 1, '2019-12-05 05:04:00', '2019-12-05 05:04:00'),
(239, '2019-12-05 10:34:13', 'Profile  Module', 'Edit', 2, 'profile_master', 1, '2019-12-05 05:04:13', '2019-12-05 05:04:13'),
(240, '2019-12-05 10:34:46', 'Profile  Module', 'Edit', 2, 'profile_master', 1, '2019-12-05 05:04:46', '2019-12-05 05:04:46'),
(241, '2019-12-05 10:38:54', 'Profile  Module', 'Edit', 2, 'profile_master', 1, '2019-12-05 05:08:54', '2019-12-05 05:08:54'),
(242, '2019-12-05 10:39:26', 'Profile  Module', 'Edit', 2, 'profile_master', 1, '2019-12-05 05:09:26', '2019-12-05 05:09:26'),
(243, '2019-12-05 10:39:45', 'Profile  Module', 'Edit', 2, 'profile_master', 1, '2019-12-05 05:09:45', '2019-12-05 05:09:45'),
(244, '2019-12-05 10:45:56', 'Profile  Module', 'Edit', 1, 'profile_master', 1, '2019-12-05 05:15:56', '2019-12-05 05:15:56'),
(245, '2019-12-05 11:18:18', 'Profile Module', 'Insert', 3, 'profile_master', 1, '2019-12-05 05:48:18', '2019-12-05 05:48:18'),
(246, '2019-12-05 12:21:58', 'Instructor Module', 'Insert', 1, 'profile_master', 1, '2019-12-05 06:51:58', '2019-12-05 06:51:58'),
(247, '2019-12-05 12:22:36', 'Profile Module', 'Insert', 4, 'profile_master', 1, '2019-12-05 06:52:36', '2019-12-05 06:52:36'),
(248, '2019-12-05 12:25:22', 'Instructor Module', 'Insert', 2, 'profile_master', 1, '2019-12-05 06:55:22', '2019-12-05 06:55:22'),
(249, '2019-12-05 12:27:24', 'Instructor Module', 'Insert', 3, 'profile_master', 1, '2019-12-05 06:57:24', '2019-12-05 06:57:24'),
(250, '2019-12-05 12:29:22', 'Instructor Module', 'Insert', 4, 'profile_master', 1, '2019-12-05 06:59:22', '2019-12-05 06:59:22'),
(251, '2019-12-05 12:32:10', 'Instructor Module', 'Insert', 5, 'profile_master', 1, '2019-12-05 07:02:10', '2019-12-05 07:02:10'),
(252, '2019-12-05 12:35:20', 'Instructor Module', 'Insert', 6, 'profile_master', 1, '2019-12-05 07:05:20', '2019-12-05 07:05:20'),
(253, '2019-12-05 12:37:06', 'Instructor Module', 'Insert', 7, 'profile_master', 1, '2019-12-05 07:07:06', '2019-12-05 07:07:06'),
(254, '2019-12-05 12:38:31', 'Instructor Module', 'Insert', 8, 'profile_master', 1, '2019-12-05 07:08:31', '2019-12-05 07:08:31'),
(255, '2019-12-05 12:40:55', 'Instructor Module', 'Insert', 9, 'profile_master', 1, '2019-12-05 07:10:55', '2019-12-05 07:10:55'),
(256, '2019-12-05 12:42:02', 'Instructor Module', 'Insert', 10, 'profile_master', 1, '2019-12-05 07:12:02', '2019-12-05 07:12:02'),
(257, '2019-12-05 12:45:53', 'Instructor Module', 'Insert', 11, 'profile_master', 1, '2019-12-05 07:15:53', '2019-12-05 07:15:53'),
(258, '2019-12-05 13:20:47', 'Instructor Module', 'Insert', 12, 'profile_master', 1, '2019-12-05 07:50:47', '2019-12-05 07:50:47'),
(259, '2019-12-06 04:01:40', 'Instructor  Module', 'Edit', 3, 'profile_master', 1, '2019-12-05 22:31:40', '2019-12-05 22:31:40'),
(260, '2019-12-06 04:21:30', 'Instructor Module', 'Insert', 13, 'profile_master', 1, '2019-12-05 22:51:30', '2019-12-05 22:51:30'),
(261, '2019-12-06 05:11:36', 'User Access', 'Insert', 4, 'useraccess_master', 1, '2019-12-05 23:41:36', '2019-12-05 23:41:36'),
(262, '2019-12-06 05:35:48', 'User Access  Module', 'Edit', 4, 'useraccess_master', 1, '2019-12-06 00:05:48', '2019-12-06 00:05:48'),
(263, '2019-12-06 05:36:36', 'User Access  Module', 'Edit', 4, 'useraccess_master', 1, '2019-12-06 00:06:36', '2019-12-06 00:06:36'),
(264, '2019-12-06 07:49:01', 'User Access  Module', 'Edit', 4, 'useraccess_master', 1, '2019-12-06 02:19:01', '2019-12-06 02:19:01'),
(265, '2019-12-06 07:55:08', 'User Access  Module', 'Edit', 4, 'useraccess_master', 1, '2019-12-06 02:25:08', '2019-12-06 02:25:08'),
(266, '2019-12-06 07:55:22', 'User Access  Module', 'Edit', 4, 'useraccess_master', 1, '2019-12-06 02:25:22', '2019-12-06 02:25:22'),
(267, '2019-12-06 07:56:48', 'User Access  Module', 'Edit', 4, 'useraccess_master', 1, '2019-12-06 02:26:48', '2019-12-06 02:26:48'),
(268, '2019-12-06 08:09:16', 'User Access', 'Insert', 5, 'useraccess_master', 1, '2019-12-06 02:39:16', '2019-12-06 02:39:16'),
(269, '2019-12-06 08:15:34', 'Instructor  Module', 'Delete', 5, 'instuctor_master', 1, '2019-12-06 02:45:34', '2019-12-06 02:45:34'),
(270, '2019-12-06 08:18:55', 'User Access', 'Insert', 6, 'useraccess_master', 1, '2019-12-06 02:48:55', '2019-12-06 02:48:55'),
(271, '2019-12-06 08:19:12', 'User Access  Module', 'Edit', 4, 'useraccess_master', 1, '2019-12-06 02:49:12', '2019-12-06 02:49:12'),
(272, '2019-12-06 08:20:00', 'User Access  Module', 'Delete', 4, 'useraccess_master', 1, '2019-12-06 02:50:00', '2019-12-06 02:50:00'),
(273, '2019-12-06 08:22:55', 'User Access', 'Insert', 7, 'useraccess_master', 1, '2019-12-06 02:52:55', '2019-12-06 02:52:55'),
(274, '2019-12-06 08:32:27', 'Instructor  Module', 'Edit', 6, 'instuctor_master', 1, '2019-12-06 03:02:27', '2019-12-06 03:02:27'),
(275, '2019-12-06 08:35:08', 'Instructor  Module', 'Edit', 6, 'instuctor_master', 1, '2019-12-06 03:05:08', '2019-12-06 03:05:08'),
(276, '2019-12-06 09:07:59', 'Member Type', 'Insert', 1, 'membertype_master', 1, '2019-12-06 03:37:59', '2019-12-06 03:37:59'),
(277, '2019-12-06 09:17:16', 'Member Type', 'Insert', 2, 'membertype_master', 1, '2019-12-06 03:47:16', '2019-12-06 03:47:16'),
(278, '2019-12-06 09:17:46', 'Member Type', 'Edit', 1, 'membertype_master', 1, '2019-12-06 03:47:46', '2019-12-06 03:47:46'),
(279, '2019-12-06 09:18:54', 'Member Type', 'Edit', 1, 'membertype_master', 1, '2019-12-06 03:48:54', '2019-12-06 03:48:54'),
(280, '2019-12-06 09:19:09', 'Member Type', 'Edit', 1, 'membertype_master', 1, '2019-12-06 03:49:09', '2019-12-06 03:49:09'),
(281, '2019-12-06 09:26:12', 'Member Type Module', 'Delete', 2, 'membertype_master', 1, '2019-12-06 03:56:12', '2019-12-06 03:56:12'),
(282, '2019-12-06 09:26:18', 'Member Type Module', 'Delete', 2, 'membertype_master', 1, '2019-12-06 03:56:18', '2019-12-06 03:56:18'),
(283, '2019-12-06 09:26:20', 'Member Type Module', 'Delete', 2, 'membertype_master', 1, '2019-12-06 03:56:20', '2019-12-06 03:56:20'),
(284, '2019-12-06 09:27:23', 'Member Type Module', 'Insert', 3, 'membertype_master', 1, '2019-12-06 03:57:23', '2019-12-06 03:57:23'),
(285, '2019-12-06 09:27:25', 'Member Type Module', 'Delete', 3, 'membertype_master', 1, '2019-12-06 03:57:25', '2019-12-06 03:57:25'),
(286, '2019-12-06 09:31:53', 'Member Type Module', 'Insert', 4, 'membertype_master', 1, '2019-12-06 04:01:53', '2019-12-06 04:01:53'),
(287, '2019-12-06 09:32:23', 'Member Type Module', 'Insert', 5, 'membertype_master', 1, '2019-12-06 04:02:23', '2019-12-06 04:02:23'),
(288, '2019-12-06 09:33:33', 'Member Type Module', 'Delete', 9, 'membertype_master', 1, '2019-12-06 04:03:33', '2019-12-06 04:03:33'),
(289, '2019-12-06 09:34:43', 'Member Type Module', 'Edit', 5, 'membertype_master', 1, '2019-12-06 04:04:43', '2019-12-06 04:04:43'),
(290, '2019-12-06 09:52:27', 'User Access', 'Insert', 8, 'useraccess_master', 1, '2019-12-06 04:22:27', '2019-12-06 04:22:27'),
(291, '2019-12-06 09:53:50', 'Instructor  Module', 'Edit', 6, 'instuctor_master', 1, '2019-12-06 04:23:50', '2019-12-06 04:23:50'),
(292, '2019-12-06 09:54:19', 'Instructor  Module', 'Edit', 8, 'instuctor_master', 1, '2019-12-06 04:24:19', '2019-12-06 04:24:19'),
(293, '2019-12-06 09:55:14', 'Instructor  Module', 'Edit', 8, 'instuctor_master', 1, '2019-12-06 04:25:14', '2019-12-06 04:25:14'),
(294, '2019-12-06 10:46:57', 'Site Setting Module', 'Insert', 1, 'sitesetting_master', 1, '2019-12-06 05:16:57', '2019-12-06 05:16:57'),
(295, '2019-12-06 11:26:46', 'Site Setting Module', 'Edit', 1, 'sitesetting_master', 1, '2019-12-06 05:56:46', '2019-12-06 05:56:46'),
(296, '2019-12-06 11:28:49', 'Site Setting Module', 'Insert', 2, 'sitesetting_master', 1, '2019-12-06 05:58:49', '2019-12-06 05:58:49'),
(297, '2019-12-06 11:29:12', 'Site Setting Module', 'Edit', 2, 'sitesetting_master', 1, '2019-12-06 05:59:12', '2019-12-06 05:59:12'),
(298, '2019-12-06 11:29:53', 'Site Setting Module', 'Edit', 2, 'sitesetting_master', 1, '2019-12-06 05:59:53', '2019-12-06 05:59:53'),
(299, '2019-12-06 11:39:56', 'Site Setting Module', 'Delete', 2, 'sitesetting_master', 1, '2019-12-06 06:09:56', '2019-12-06 06:09:56'),
(300, '2019-12-06 12:57:08', 'User Access  Module', 'Edit', 8, 'useraccess_master', 1, '2019-12-06 07:27:08', '2019-12-06 07:27:08'),
(301, '2019-12-07 03:50:17', 'Class Schedule Module', 'Insert', 14, 'class_sechedule_master', 1, '2019-12-06 22:20:17', '2019-12-06 22:20:17'),
(302, '2019-12-07 09:42:56', 'Members Module', 'Delete', 3, 'member_master', 1, '2019-12-07 04:12:56', '2019-12-07 04:12:56'),
(303, '2019-12-07 10:01:05', 'Members Module', 'Insert', 9, 'member_master', 1, '2019-12-07 04:31:05', '2019-12-07 04:31:05'),
(304, '2019-12-07 10:38:35', 'Class Schedule Module', 'Insert', 15, 'class_sechedule_master', 1, '2019-12-07 05:08:35', '2019-12-07 05:08:35'),
(305, '2019-12-07 10:39:15', 'Class Schedule Module', 'Insert', 16, 'class_sechedule_master', 1, '2019-12-07 05:09:15', '2019-12-07 05:09:15'),
(306, '2019-12-07 11:09:43', 'Members Module', 'Edit', 9, 'member_master', 1, '2019-12-07 05:39:43', '2019-12-07 05:39:43'),
(307, '2019-12-11 08:59:23', 'Gallary Master Module', 'Edit', 10, 'gallary_master', 1, '2019-12-11 03:29:23', '2019-12-11 03:29:23'),
(308, '2019-12-11 09:33:59', 'Gallary Master Module', 'Edit', 10, 'gallary_master', 1, '2019-12-11 04:03:59', '2019-12-11 04:03:59'),
(309, '2019-12-12 11:10:28', 'Gallary Master Module', 'Edit', 10, 'gallary_master', 1, '2019-12-12 05:40:28', '2019-12-12 05:40:28'),
(310, '2019-12-12 12:35:58', 'Members Module', 'Edit', 9, 'member_master', 1, '2019-12-12 07:05:58', '2019-12-12 07:05:58'),
(311, '2019-12-16 05:21:59', 'Profile  Module', 'Edit', 1, 'profile_master', 1, '2019-12-15 23:51:59', '2019-12-15 23:51:59'),
(312, '2019-12-16 05:27:20', 'User Access  Module', 'Edit', 8, 'useraccess_master', 1, '2019-12-15 23:57:20', '2019-12-15 23:57:20'),
(313, '2019-12-16 05:52:25', 'User Access  Module', 'Edit', 8, 'useraccess_master', 1, '2019-12-16 00:22:25', '2019-12-16 00:22:25'),
(314, '2019-12-16 06:54:37', 'User Access  Module', 'Edit', 7, 'useraccess_master', 1, '2019-12-16 01:24:37', '2019-12-16 01:24:37'),
(315, '2019-12-16 06:56:08', 'User Access  Module', 'Edit', 7, 'useraccess_master', 1, '2019-12-16 01:26:08', '2019-12-16 01:26:08'),
(316, '2019-12-16 06:57:07', 'User Access  Module', 'Edit', 7, 'useraccess_master', 1, '2019-12-16 01:27:07', '2019-12-16 01:27:07'),
(317, '2019-12-16 06:59:32', 'User Access  Module', 'Edit', 7, 'useraccess_master', 1, '2019-12-16 01:29:32', '2019-12-16 01:29:32'),
(318, '2019-12-16 06:59:58', 'User Access  Module', 'Edit', 7, 'useraccess_master', 1, '2019-12-16 01:29:58', '2019-12-16 01:29:58'),
(319, '2019-12-16 07:02:33', 'User Access  Module', 'Edit', 7, 'useraccess_master', 1, '2019-12-16 01:32:33', '2019-12-16 01:32:33'),
(320, '2019-12-16 07:05:45', 'User Access  Module', 'Edit', 7, 'useraccess_master', 1, '2019-12-16 01:35:45', '2019-12-16 01:35:45'),
(321, '2019-12-16 08:42:06', 'User Access  Module', 'Edit', 7, 'useraccess_master', 1, '2019-12-16 03:12:06', '2019-12-16 03:12:06'),
(322, '2019-12-16 08:42:22', 'User Access  Module', 'Edit', 6, 'useraccess_master', 1, '2019-12-16 03:12:22', '2019-12-16 03:12:22'),
(323, '2019-12-16 08:44:54', 'User Access  Module', 'Edit', 7, 'useraccess_master', 1, '2019-12-16 03:14:54', '2019-12-16 03:14:54'),
(324, '2019-12-16 08:57:29', 'User Access', 'Insert', 1, 'useraccess_master', 1, '2019-12-16 03:27:29', '2019-12-16 03:27:29'),
(325, '2019-12-16 08:57:51', 'User Access  Module', 'Edit', 1, 'useraccess_master', 1, '2019-12-16 03:27:51', '2019-12-16 03:27:51'),
(326, '2019-12-16 09:57:04', 'User Access  Module', 'Edit', 1, 'useraccess_master', 1, '2019-12-16 04:27:04', '2019-12-16 04:27:04'),
(327, '2019-12-16 10:00:12', 'Profile Module', 'Insert', 4, 'profile_master', 1, '2019-12-16 04:30:12', '2019-12-16 04:30:12'),
(328, '2019-12-16 10:01:09', 'User Access', 'Insert', 2, 'useraccess_master', 1, '2019-12-16 04:31:09', '2019-12-16 04:31:09'),
(329, '2019-12-16 10:02:02', 'User Access  Module', 'Edit', 1, 'useraccess_master', 1, '2019-12-16 04:32:02', '2019-12-16 04:32:02'),
(330, '2019-12-16 10:02:31', 'User Access  Module', 'Edit', 1, 'useraccess_master', 1, '2019-12-16 04:32:31', '2019-12-16 04:32:31'),
(331, '2019-12-16 10:08:53', 'User Access  Module', 'Edit', 1, 'useraccess_master', 1, '2019-12-16 04:38:53', '2019-12-16 04:38:53'),
(332, '2019-12-16 10:09:28', 'User Access  Module', 'Edit', 1, 'useraccess_master', 1, '2019-12-16 04:39:28', '2019-12-16 04:39:28'),
(333, '2019-12-16 10:19:47', 'User Access  Module', 'Edit', 1, 'useraccess_master', 1, '2019-12-16 04:49:47', '2019-12-16 04:49:47'),
(334, '2019-12-16 10:20:14', 'User Access  Module', 'Edit', 1, 'useraccess_master', 1, '2019-12-16 04:50:14', '2019-12-16 04:50:14'),
(335, '2019-12-16 10:46:32', 'User Access  Module', 'Edit', 1, 'useraccess_master', 1, '2019-12-16 05:16:32', '2019-12-16 05:16:32'),
(336, '2019-12-16 10:46:51', 'User Access  Module', 'Edit', 1, 'useraccess_master', 1, '2019-12-16 05:16:51', '2019-12-16 05:16:51'),
(337, '2019-12-16 10:51:08', 'Instructor Module', 'Insert', 1, 'profile_master', 1, '2019-12-16 05:21:08', '2019-12-16 05:21:08'),
(338, '2019-12-16 11:07:59', 'User Access  Module', 'Edit', 1, 'useraccess_master', 1, '2019-12-16 05:37:59', '2019-12-16 05:37:59'),
(339, '2019-12-16 11:24:11', 'Instructor Module', 'Insert', 1, 'profile_master', 1, '2019-12-16 05:54:11', '2019-12-16 05:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `membertype_master`
--

CREATE TABLE `membertype_master` (
  `membertype_id` int(11) NOT NULL,
  `member_type` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL COMMENT 'for store user id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membertype_master`
--

INSERT INTO `membertype_master` (`membertype_id`, `member_type`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Group1', 1, '2019-12-06 09:18:54', '2019-12-06 03:48:54', 1),
(4, 'Grop', 1, '2019-12-06 04:01:53', '2019-12-06 04:01:53', 1),
(5, 'abcd', 1, '2019-12-06 09:34:43', '2019-12-06 04:04:43', 1);

-- --------------------------------------------------------

--
-- Table structure for table `member_master`
--

CREATE TABLE `member_master` (
  `member_id` int(11) NOT NULL,
  `membername` varchar(100) NOT NULL,
  `icno` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `image_url` varchar(250) NOT NULL,
  `currentpackage` int(11) NOT NULL,
  `membertype` varchar(20) NOT NULL,
  `dateofexpire` date NOT NULL,
  `balancepoint` decimal(10,2) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member_master`
--

INSERT INTO `member_master` (`member_id`, `membername`, `icno`, `dob`, `address`, `email`, `image_url`, `currentpackage`, `membertype`, `dateofexpire`, `balancepoint`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(2, 'rakesh dfgdg', '123456', '2019-12-17', 'fdgfd', 'abcd@gmail.com', '', 3, 'Group', '2019-12-07', '211212.00', 1, '2019-12-07 01:01:33', '2019-12-07 01:01:33', 1),
(9, 'asds', '1234567890', '2019-12-07', 'fdgfd', 'abcd@gmail.com', '5df2342541407_1576154149.jpg', 3, 'Group', '2019-12-05', '211212.00', 1, '2019-12-12 12:35:58', '2019-12-12 07:05:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_master`
--

CREATE TABLE `menu_master` (
  `menu_id` int(11) NOT NULL,
  `menuname` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_master`
--

INSERT INTO `menu_master` (`menu_id`, `menuname`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 1, '2019-12-05 04:21:39', '0000-00-00 00:00:00'),
(2, 'User Access', 2, '2019-12-05 04:21:39', '0000-00-00 00:00:00'),
(3, 'Members', 1, '2019-12-05 04:22:17', '0000-00-00 00:00:00'),
(4, 'Package', 1, '2019-12-05 04:24:30', '0000-00-00 00:00:00'),
(5, 'Class Category', 1, '2019-12-05 04:25:23', '0000-00-00 00:00:00'),
(6, 'Room', 1, '2019-12-05 04:25:35', '0000-00-00 00:00:00'),
(7, 'Class', 1, '2019-12-05 04:25:38', '0000-00-00 00:00:00'),
(8, 'Class Schedule', 1, '2019-12-05 04:26:11', '0000-00-00 00:00:00'),
(9, 'Deals', 1, '2019-12-05 04:26:11', '0000-00-00 00:00:00'),
(10, 'Gallary', 1, '2019-12-05 04:26:44', '0000-00-00 00:00:00'),
(11, 'Member Attendence ', 1, '2019-12-05 04:26:44', '0000-00-00 00:00:00'),
(12, 'Settings', 1, '2019-12-05 04:27:18', '0000-00-00 00:00:00'),
(13, 'Reports', 1, '2019-12-05 04:27:18', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `package_master`
--

CREATE TABLE `package_master` (
  `packege_id` int(11) NOT NULL,
  `package_name` varchar(100) DEFAULT NULL,
  `package_point` decimal(10,0) DEFAULT NULL,
  `package_price` decimal(10,2) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package_master`
--

INSERT INTO `package_master` (`packege_id`, `package_name`, `package_point`, `package_price`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'sagar14', '21', '12.00', 1, 1, '2019-12-03 07:24:19', '2019-12-03 01:54:19'),
(3, 'package12312', '211212', '12.00', 1, 1, '2019-12-03 09:08:18', '2019-12-03 03:38:18'),
(4, 'sagar233', '12', '12.00', 1, 1, '2019-11-29 13:23:01', '2019-11-29 07:36:22'),
(6, 'rakesh123', '12', '1212.00', 1, 1, '2019-11-29 13:25:13', '2019-11-29 07:55:13'),
(7, 'package123122', '10', '123.00', 0, 1, '2019-12-03 09:07:33', '2019-12-03 03:37:33'),
(8, 'rakesh123', '12', '12.00', 0, 1, '2019-11-29 13:20:07', '2019-11-29 06:09:38'),
(10, 'package14', '21', '123.00', 1, 1, '2019-12-04 04:31:30', '2019-12-03 23:01:30'),
(13, '1221', '121', '121.00', 1, 1, '2019-11-29 06:59:47', '2019-11-29 06:59:47'),
(14, 'sagar', '12', '1221.00', 1, 1, '2019-11-29 07:00:36', '2019-11-29 07:00:36'),
(16, 'abcd', '123', '150.00', 1, 1, '2019-11-30 00:27:21', '2019-11-30 00:27:21'),
(17, 'abcd1212', '1232', '1502.00', 11, 1, '2019-11-30 00:46:00', '2019-11-30 00:46:00'),
(18, 'abcd121212', '1232', '1502.00', 11, 1, '2019-11-30 00:46:08', '2019-11-30 00:46:08'),
(19, 'sagarb', '123212', '1502.00', 11, 1, '2019-11-30 00:48:16', '2019-11-30 00:48:16'),
(20, 'sagar122', '123212', '1502.00', 11, 1, '2019-11-30 00:51:36', '2019-11-30 00:51:36'),
(21, 'sagar789', '123212', '1502.00', 1, 1, '2019-11-30 01:08:39', '2019-11-30 01:08:39'),
(22, 'package1234', '21', '123.00', 1, 1, '2019-12-04 04:33:09', '2019-12-03 23:03:09'),
(23, 'package123', '21', '123.00', 1, 1, '2019-11-30 01:30:54', '2019-11-30 01:30:54'),
(24, 'package122', '12', '12.00', 1, 1, '2019-11-30 01:51:55', '2019-11-30 01:51:55'),
(25, 'as', '0', '1.00', 1, 1, '2019-12-04 04:02:53', '2019-12-03 22:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `profile_details`
--

CREATE TABLE `profile_details` (
  `profile_detalis_id` int(11) NOT NULL,
  `profileid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  `submenuid` int(11) NOT NULL,
  `userright` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile_details`
--

INSERT INTO `profile_details` (`profile_detalis_id`, `profileid`, `menuid`, `submenuid`, `userright`, `created_at`, `updated_at`) VALUES
(151, 3, 2, 0, 0, '2019-12-05 11:18:18', '0000-00-00 00:00:00'),
(152, 3, 3, 0, 0, '2019-12-05 11:18:18', '0000-00-00 00:00:00'),
(153, 3, 4, 0, 0, '2019-12-05 11:18:18', '0000-00-00 00:00:00'),
(154, 3, 6, 0, 0, '2019-12-05 11:18:18', '0000-00-00 00:00:00'),
(155, 3, 7, 0, 0, '2019-12-05 11:18:18', '0000-00-00 00:00:00'),
(156, 3, 8, 0, 0, '2019-12-05 11:18:18', '0000-00-00 00:00:00'),
(157, 3, 10, 0, 0, '2019-12-05 11:18:18', '0000-00-00 00:00:00'),
(158, 3, 11, 0, 0, '2019-12-05 11:18:18', '0000-00-00 00:00:00'),
(159, 3, 12, 1, 0, '2019-12-05 11:18:18', '0000-00-00 00:00:00'),
(160, 3, 12, 2, 0, '2019-12-05 11:18:18', '0000-00-00 00:00:00'),
(161, 3, 12, 3, 0, '2019-12-05 11:18:18', '0000-00-00 00:00:00'),
(162, 3, 12, 4, 0, '2019-12-05 11:18:18', '0000-00-00 00:00:00'),
(163, 3, 12, 5, 0, '2019-12-05 11:18:18', '0000-00-00 00:00:00'),
(164, 2, 12, 1, 0, '2019-12-05 12:13:03', '0000-00-00 00:00:00'),
(165, 2, 12, 2, 0, '2019-12-05 12:13:03', '0000-00-00 00:00:00'),
(166, 2, 12, 3, 0, '2019-12-05 12:13:03', '0000-00-00 00:00:00'),
(167, 2, 12, 4, 0, '2019-12-05 12:13:03', '0000-00-00 00:00:00'),
(168, 2, 12, 5, 0, '2019-12-05 12:13:03', '0000-00-00 00:00:00'),
(169, 1, 1, 0, 0, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(170, 1, 2, 0, 0, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(171, 1, 3, 0, 0, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(172, 1, 4, 0, 0, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(173, 1, 5, 0, 0, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(174, 1, 6, 0, 0, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(175, 1, 7, 0, 0, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(176, 1, 8, 0, 0, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(177, 1, 9, 0, 0, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(178, 1, 10, 0, 0, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(179, 1, 11, 0, 0, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(180, 1, 12, 1, 1, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(181, 1, 12, 2, 1, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(182, 1, 12, 3, 1, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(183, 1, 12, 4, 1, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(184, 1, 12, 5, 1, '2019-12-16 05:21:59', '0000-00-00 00:00:00'),
(185, 4, 1, 0, 0, '2019-12-16 10:00:11', '0000-00-00 00:00:00'),
(186, 4, 2, 0, 0, '2019-12-16 10:00:11', '0000-00-00 00:00:00'),
(187, 4, 3, 0, 0, '2019-12-16 10:00:11', '0000-00-00 00:00:00'),
(188, 4, 4, 0, 0, '2019-12-16 10:00:11', '0000-00-00 00:00:00'),
(189, 4, 5, 0, 0, '2019-12-16 10:00:11', '0000-00-00 00:00:00'),
(190, 4, 6, 0, 0, '2019-12-16 10:00:11', '0000-00-00 00:00:00'),
(191, 4, 7, 0, 0, '2019-12-16 10:00:11', '0000-00-00 00:00:00'),
(192, 4, 8, 0, 0, '2019-12-16 10:00:11', '0000-00-00 00:00:00'),
(193, 4, 9, 0, 0, '2019-12-16 10:00:12', '0000-00-00 00:00:00'),
(194, 4, 10, 0, 0, '2019-12-16 10:00:12', '0000-00-00 00:00:00'),
(195, 4, 11, 0, 0, '2019-12-16 10:00:12', '0000-00-00 00:00:00'),
(196, 4, 12, 1, 0, '2019-12-16 10:00:12', '0000-00-00 00:00:00'),
(197, 4, 12, 2, 0, '2019-12-16 10:00:12', '0000-00-00 00:00:00'),
(198, 4, 12, 3, 0, '2019-12-16 10:00:12', '0000-00-00 00:00:00'),
(199, 4, 12, 4, 0, '2019-12-16 10:00:12', '0000-00-00 00:00:00'),
(200, 4, 12, 5, 0, '2019-12-16 10:00:12', '0000-00-00 00:00:00'),
(201, 4, 13, 6, 0, '2019-12-16 10:00:12', '0000-00-00 00:00:00'),
(202, 4, 13, 7, 0, '2019-12-16 10:00:12', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `profile_master`
--

CREATE TABLE `profile_master` (
  `profile_id` int(11) NOT NULL,
  `profile_type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile_master`
--

INSERT INTO `profile_master` (`profile_id`, `profile_type`, `created_at`, `updated_at`, `user_id`, `status`) VALUES
(1, 'Admin', '2019-12-05 04:06:09', '2019-12-05 04:06:09', 1, 1),
(3, 'Instructor', '2019-12-05 05:48:18', '2019-12-05 05:48:18', 1, 1),
(4, 'Users', '2019-12-16 04:30:11', '2019-12-16 04:30:11', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room_master`
--

CREATE TABLE `room_master` (
  `rooom_id` int(11) NOT NULL,
  `room` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room_master`
--

INSERT INTO `room_master` (`rooom_id`, `room`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 'room1232', 0, 1, '2019-12-04 04:25:00', '2019-12-03 22:55:00'),
(5, 'abcd', 1, 1, '2019-12-04 04:25:02', '2019-12-03 03:55:37'),
(6, 'ccccc', 0, 1, '2019-12-03 03:55:44', '2019-12-03 03:55:44'),
(7, 'ww', 1, 1, '2019-12-03 22:45:23', '2019-12-03 22:45:23');

-- --------------------------------------------------------

--
-- Table structure for table `sitesetting_master`
--

CREATE TABLE `sitesetting_master` (
  `sitesetting_id` int(11) NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `site_logo` varchar(100) NOT NULL,
  `site_email` varchar(50) NOT NULL,
  `site_about_details1` varchar(1000) DEFAULT NULL,
  `site_about_details2` varchar(1000) DEFAULT NULL,
  `site_contact_detalis1` varchar(1000) DEFAULT NULL,
  `site_contact_detalis2` varchar(1000) DEFAULT NULL,
  `telephone_no` decimal(10,0) NOT NULL,
  `website` varchar(100) NOT NULL,
  `facebook` varchar(100) NOT NULL,
  `instagram` varchar(100) NOT NULL,
  `firebase` varchar(100) NOT NULL,
  `map` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitesetting_master`
--

INSERT INTO `sitesetting_master` (`sitesetting_id`, `site_name`, `site_logo`, `site_email`, `site_about_details1`, `site_about_details2`, `site_contact_detalis1`, `site_contact_detalis2`, `telephone_no`, `website`, `facebook`, `instagram`, `firebase`, `map`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'site123', '5dea31803097e_1575629184.jpeg', 'abcd@gmail.com', '<p>sdfdsf</p>', '<p>dfds</p>', '<p>df</p>', NULL, '1234567890', 'abc2@', 'sadsd', 'rakesh dfgdg', 'asdsds', 'df', 1, '2019-12-06 11:26:46', '2019-12-06 05:56:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `submenu_master`
--

CREATE TABLE `submenu_master` (
  `submenu_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `submenuname` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `submenu_master`
--

INSERT INTO `submenu_master` (`submenu_id`, `menu_id`, `submenuname`, `status`, `created_at`, `updated_at`) VALUES
(1, 12, 'Language', 1, '2019-12-05 04:28:36', '0000-00-00 00:00:00'),
(2, 12, 'Member Type', 1, '2019-12-05 04:28:36', '0000-00-00 00:00:00'),
(3, 12, 'Site Setting', 1, '2019-12-05 04:29:30', '0000-00-00 00:00:00'),
(4, 12, 'Mobile Notification', 1, '2019-12-05 04:29:30', '0000-00-00 00:00:00'),
(5, 12, 'Profile Manager', 1, '2019-12-05 04:30:08', '0000-00-00 00:00:00'),
(6, 13, 'Class Booking', 1, '2019-12-05 04:31:08', '0000-00-00 00:00:00'),
(7, 13, 'Attendence & Rating', 1, '2019-12-05 04:31:08', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `useraccess_master`
--

CREATE TABLE `useraccess_master` (
  `useraccess_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `mobileno` decimal(10,0) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `useraccess_master`
--

INSERT INTO `useraccess_master` (`useraccess_id`, `user_name`, `email_id`, `mobileno`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Ajaz', 'admin@admin.com', '9904760745', 1, '2019-12-16 03:27:28', '2019-12-16 03:27:28', 1),
(2, 'Ajazkhan', 'ajaz@gmail.com', '9904760745', 1, '2019-12-16 04:31:08', '2019-12-16 04:31:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_right_details`
--

CREATE TABLE `user_right_details` (
  `user_right_id` int(11) NOT NULL,
  `useraccess_id` int(11) NOT NULL,
  `menuid` int(11) NOT NULL COMMENT 'for storemenu',
  `submenuid` int(11) NOT NULL COMMENT 'for store submenu',
  `userright` int(11) NOT NULL COMMENT '0-meas read 1-means modify',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_right_details`
--

INSERT INTO `user_right_details` (`user_right_id`, `useraccess_id`, `menuid`, `submenuid`, `userright`, `created_at`, `updated_at`) VALUES
(46, 2, 1, 0, 0, '2019-12-16 10:01:08', '0000-00-00 00:00:00'),
(47, 2, 2, 0, 0, '2019-12-16 10:01:08', '0000-00-00 00:00:00'),
(48, 2, 3, 0, 0, '2019-12-16 10:01:08', '0000-00-00 00:00:00'),
(49, 2, 4, 0, 0, '2019-12-16 10:01:08', '0000-00-00 00:00:00'),
(50, 2, 5, 0, 0, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(51, 2, 6, 0, 0, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(52, 2, 7, 0, 0, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(53, 2, 8, 0, 0, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(54, 2, 9, 0, 0, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(55, 2, 10, 0, 0, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(56, 2, 11, 0, 0, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(57, 2, 12, 0, 1, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(58, 2, 12, 1, 0, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(59, 2, 12, 2, 0, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(60, 2, 12, 3, 0, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(61, 2, 12, 4, 0, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(62, 2, 12, 5, 0, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(63, 2, 13, 0, 1, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(64, 2, 13, 6, 0, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(65, 2, 13, 7, 0, '2019-12-16 10:01:09', '0000-00-00 00:00:00'),
(531, 1, 1, 0, 0, '2019-12-16 11:07:58', '0000-00-00 00:00:00'),
(532, 1, 2, 0, 0, '2019-12-16 11:07:58', '0000-00-00 00:00:00'),
(533, 1, 3, 0, 0, '2019-12-16 11:07:59', '0000-00-00 00:00:00'),
(534, 1, 4, 0, 0, '2019-12-16 11:07:59', '0000-00-00 00:00:00'),
(535, 1, 5, 0, 0, '2019-12-16 11:07:59', '0000-00-00 00:00:00'),
(536, 1, 6, 0, 0, '2019-12-16 11:07:59', '0000-00-00 00:00:00'),
(537, 1, 7, 0, 0, '2019-12-16 11:07:59', '0000-00-00 00:00:00'),
(538, 1, 8, 0, 0, '2019-12-16 11:07:59', '0000-00-00 00:00:00'),
(539, 1, 9, 0, 0, '2019-12-16 11:07:59', '0000-00-00 00:00:00'),
(540, 1, 10, 0, 0, '2019-12-16 11:07:59', '0000-00-00 00:00:00'),
(541, 1, 11, 0, 0, '2019-12-16 11:07:59', '0000-00-00 00:00:00'),
(542, 1, 12, 0, 1, '2019-12-16 11:07:59', '0000-00-00 00:00:00'),
(543, 1, 12, 1, 1, '2019-12-16 11:07:59', '0000-00-00 00:00:00'),
(544, 1, 12, 2, 1, '2019-12-16 11:07:59', '0000-00-00 00:00:00'),
(545, 1, 12, 3, 1, '2019-12-16 11:07:59', '0000-00-00 00:00:00'),
(546, 1, 12, 4, 1, '2019-12-16 11:07:59', '0000-00-00 00:00:00'),
(547, 1, 12, 5, 1, '2019-12-16 11:07:59', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE `user_settings` (
  `id` int(11) NOT NULL,
  `link_id` int(11) NOT NULL,
  `receive_mobile_notification` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=True & 0=False',
  `prompt_me` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=True & 0=False',
  `language` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=English & 2=Chinese',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `add_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_settings`
--

INSERT INTO `user_settings` (`id`, `link_id`, `receive_mobile_notification`, `prompt_me`, `language`, `status`, `add_date`, `update_date`) VALUES
(1, 8, 1, 1, 1, 1, '2019-12-11 00:00:00', '2019-12-11 00:00:00'),
(2, 11, 1, 1, 1, 1, '2019-12-14 00:00:00', '2019-12-15 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_table`
--
ALTER TABLE `booking_table`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `classcategory_master`
--
ALTER TABLE `classcategory_master`
  ADD PRIMARY KEY (`classcategory_id`);

--
-- Indexes for table `class_master`
--
ALTER TABLE `class_master`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `class_sechedule_master`
--
ALTER TABLE `class_sechedule_master`
  ADD PRIMARY KEY (`classsechedule_id`);

--
-- Indexes for table `deal_master`
--
ALTER TABLE `deal_master`
  ADD PRIMARY KEY (`deal_id`);

--
-- Indexes for table `gallary_master`
--
ALTER TABLE `gallary_master`
  ADD PRIMARY KEY (`gallary_id`);

--
-- Indexes for table `instructor_right`
--
ALTER TABLE `instructor_right`
  ADD PRIMARY KEY (`instucuteright_id`);

--
-- Indexes for table `instuctor_master`
--
ALTER TABLE `instuctor_master`
  ADD PRIMARY KEY (`instructorid`);

--
-- Indexes for table `link_relation_ship`
--
ALTER TABLE `link_relation_ship`
  ADD PRIMARY KEY (`linkrelid`);

--
-- Indexes for table `login_master`
--
ALTER TABLE `login_master`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `log_master`
--
ALTER TABLE `log_master`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `membertype_master`
--
ALTER TABLE `membertype_master`
  ADD PRIMARY KEY (`membertype_id`);

--
-- Indexes for table `member_master`
--
ALTER TABLE `member_master`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `menu_master`
--
ALTER TABLE `menu_master`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `package_master`
--
ALTER TABLE `package_master`
  ADD PRIMARY KEY (`packege_id`);

--
-- Indexes for table `profile_details`
--
ALTER TABLE `profile_details`
  ADD PRIMARY KEY (`profile_detalis_id`);

--
-- Indexes for table `profile_master`
--
ALTER TABLE `profile_master`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `room_master`
--
ALTER TABLE `room_master`
  ADD PRIMARY KEY (`rooom_id`);

--
-- Indexes for table `sitesetting_master`
--
ALTER TABLE `sitesetting_master`
  ADD PRIMARY KEY (`sitesetting_id`);

--
-- Indexes for table `submenu_master`
--
ALTER TABLE `submenu_master`
  ADD PRIMARY KEY (`submenu_id`);

--
-- Indexes for table `useraccess_master`
--
ALTER TABLE `useraccess_master`
  ADD PRIMARY KEY (`useraccess_id`);

--
-- Indexes for table `user_right_details`
--
ALTER TABLE `user_right_details`
  ADD PRIMARY KEY (`user_right_id`);

--
-- Indexes for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_table`
--
ALTER TABLE `booking_table`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `classcategory_master`
--
ALTER TABLE `classcategory_master`
  MODIFY `classcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `class_master`
--
ALTER TABLE `class_master`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `class_sechedule_master`
--
ALTER TABLE `class_sechedule_master`
  MODIFY `classsechedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `deal_master`
--
ALTER TABLE `deal_master`
  MODIFY `deal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `gallary_master`
--
ALTER TABLE `gallary_master`
  MODIFY `gallary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `instructor_right`
--
ALTER TABLE `instructor_right`
  MODIFY `instucuteright_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `instuctor_master`
--
ALTER TABLE `instuctor_master`
  MODIFY `instructorid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `link_relation_ship`
--
ALTER TABLE `link_relation_ship`
  MODIFY `linkrelid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `login_master`
--
ALTER TABLE `login_master`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `log_master`
--
ALTER TABLE `log_master`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT for table `membertype_master`
--
ALTER TABLE `membertype_master`
  MODIFY `membertype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `member_master`
--
ALTER TABLE `member_master`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `menu_master`
--
ALTER TABLE `menu_master`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `package_master`
--
ALTER TABLE `package_master`
  MODIFY `packege_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `profile_details`
--
ALTER TABLE `profile_details`
  MODIFY `profile_detalis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `profile_master`
--
ALTER TABLE `profile_master`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `room_master`
--
ALTER TABLE `room_master`
  MODIFY `rooom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sitesetting_master`
--
ALTER TABLE `sitesetting_master`
  MODIFY `sitesetting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `submenu_master`
--
ALTER TABLE `submenu_master`
  MODIFY `submenu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `useraccess_master`
--
ALTER TABLE `useraccess_master`
  MODIFY `useraccess_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_right_details`
--
ALTER TABLE `user_right_details`
  MODIFY `user_right_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=548;

--
-- AUTO_INCREMENT for table `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
