-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2013 at 03:32 AM
-- Server version: 5.6.11
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eterped`
--
CREATE DATABASE IF NOT EXISTS `eterped` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `eterped`;

-- --------------------------------------------------------

--
-- Table structure for table `chatlog`
--

CREATE TABLE IF NOT EXISTS `chatlog` (
  `ChatLogId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Content` varchar(250) NOT NULL,
  PRIMARY KEY (`ChatLogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE IF NOT EXISTS `data` (
  `DataId` int(11) NOT NULL AUTO_INCREMENT,
  `ParentId` int(11) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Src` varchar(250) DEFAULT NULL,
  `OwnerId` int(11) NOT NULL,
  PRIMARY KEY (`DataId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mappingdataaccess`
--

CREATE TABLE IF NOT EXISTS `mappingdataaccess` (
  `MappingId` int(11) NOT NULL AUTO_INCREMENT,
  `DataId` int(11) NOT NULL,
  `UserGroupId` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `RoleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`MappingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mappingusergroup`
--

CREATE TABLE IF NOT EXISTS `mappingusergroup` (
  `MappingId` int(11) NOT NULL AUTO_INCREMENT,
  `UserGroupId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `DateJoin` datetime NOT NULL,
  PRIMARY KEY (`MappingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT,
  `Role` varchar(50) NOT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`RoleId`, `Role`) VALUES
(1, 'admin'),
(2, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE IF NOT EXISTS `usergroups` (
  `UserGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `CreatorId` int(11) NOT NULL,
  PRIMARY KEY (`UserGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `RoleId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
