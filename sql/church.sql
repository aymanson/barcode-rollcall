-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2012 at 04:44 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

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
  `record_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;


-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE IF NOT EXISTS `district` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `name`, `code`) VALUES
(1, 'Tsim Sha Tsui', '01'),
(2, 'Yuen Long', '02');

-- --------------------------------------------------------

--
-- Table structure for table `profile_group_mapping`
--

CREATE TABLE IF NOT EXISTS `profile_group_mapping` (
  `user_profile_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  KEY `user_profile_id` (`user_profile_id`,`user_group_id`),
  KEY `user_group_id` (`user_group_id`),
  KEY `user_profile_id_2` (`user_profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sub_district`
--

CREATE TABLE IF NOT EXISTS `sub_district` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `district_id` bigint(20) NOT NULL,
  `code` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `district_id` (`district_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sub_district`
--

INSERT INTO `sub_district` (`id`, `name`, `district_id`, `code`) VALUES
(1, 'Kowloon City', 1, '01');

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`id`, `name`) VALUES
(1, '職青');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` bigint(19) NOT NULL,
  `login` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `chi_name` varchar(50) NOT NULL,
  `eng_name` varchar(100) NOT NULL,
  `sex` char(1) NOT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `district_id` bigint(20) NOT NULL,
  `sub_district_id` bigint(20) NOT NULL,
  `mobile_phone_no` varchar(20) DEFAULT NULL,
  `last_update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_update_by` bigint(20) NOT NULL,
  `card_id` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `district_id` (`district_id`),
  KEY `sub_district_id` (`sub_district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `profile_group_mapping`
--
ALTER TABLE `profile_group_mapping`
  ADD CONSTRAINT `profile_group_mapping_ibfk_2` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`),
  ADD CONSTRAINT `profile_group_mapping_ibfk_1` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`id`);

--
-- Constraints for table `sub_district`
--
ALTER TABLE `sub_district`
  ADD CONSTRAINT `sub_district_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`);

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_profile_ibfk_2` FOREIGN KEY (`sub_district_id`) REFERENCES `sub_district` (`id`),
  ADD CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
