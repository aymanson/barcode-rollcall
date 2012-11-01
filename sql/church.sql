-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 02, 2012 at 12:53 AM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `church`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `user_profile_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `arrival_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `user_profile_id`, `date`, `arrival_time`) VALUES
(1, 1, '2012-11-05', '2012-11-01 15:50:21'),
(2, 2, '2012-11-02', '2012-11-01 16:22:13'),
(3, 7, '2012-11-02', '2012-11-01 16:22:22'),
(4, 1, '2012-11-02', '2012-11-01 16:22:25'),
(5, 1, '2012-11-02', '2012-11-01 16:22:59'),
(6, 1, '2012-11-02', '2012-11-01 16:23:20'),
(7, 3, '2012-11-02', '2012-11-01 16:26:49'),
(8, 15, '2012-11-02', '2012-11-01 16:26:56'),
(9, 15, '2012-11-02', '2012-11-01 16:26:56'),
(10, 1524, '2012-11-02', '2012-11-01 16:27:14'),
(11, 1524, '2012-11-02', '2012-11-01 16:27:14'),
(12, 22222, '2012-11-02', '2012-11-01 16:28:00'),
(13, 22222, '2012-11-02', '2012-11-01 16:28:00'),
(14, 22222, '2012-11-02', '2012-11-01 16:28:14'),
(15, 22222, '2012-11-02', '2012-11-01 16:28:14'),
(16, 1, '2012-11-02', '2012-11-01 16:28:20'),
(17, 22222, '2012-11-02', '2012-11-01 16:28:26'),
(18, 22222, '2012-11-02', '2012-11-01 16:28:26'),
(19, 22222, '2012-11-02', '2012-11-01 16:28:44'),
(20, 22222, '2012-11-02', '2012-11-01 16:28:46'),
(21, 22222, '2012-11-02', '2012-11-01 16:28:46'),
(22, 22222, '2012-11-02', '2012-11-01 16:28:51'),
(23, 22222, '2012-11-02', '2012-11-01 16:28:51'),
(24, 22222, '2012-11-02', '2012-11-01 16:34:08'),
(25, 6, '2012-11-02', '2012-11-01 16:34:12'),
(26, 6, '2012-11-02', '2012-11-01 16:34:31'),
(27, 5, '2012-11-02', '2012-11-01 16:34:33'),
(28, 8, '2012-11-02', '2012-11-01 16:34:58'),
(29, 3, '2012-11-02', '2012-11-01 16:40:00'),
(30, 5, '2012-11-02', '2012-11-01 16:40:31'),
(31, 3, '2012-11-02', '2012-11-01 16:43:23'),
(32, 3, '2012-11-02', '2012-11-01 16:43:49'),
(33, 3, '2012-11-02', '2012-11-01 16:45:35'),
(34, 5, '2012-11-02', '2012-11-01 16:45:40'),
(35, 5, '2012-11-02', '2012-11-01 16:46:32'),
(36, 3, '2012-11-02', '2012-11-01 16:46:42'),
(37, 3, '2012-11-02', '2012-11-01 16:46:56'),
(38, 3, '2012-11-02', '2012-11-01 16:47:34');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` bigint(19) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `name`) VALUES
(1, '小明');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
