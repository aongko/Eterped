-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2013 at 06:33 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eterped`
--
CREATE DATABASE IF NOT EXISTS `eterped`;
USE `eterped`;

-- --------------------------------------------------------

--
-- Table structure for table `ChatLog`
--

DROP TABLE IF EXISTS `ChatLog`;
CREATE TABLE IF NOT EXISTS `ChatLog` (
  `ChatLogId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Content` varchar(250) NOT NULL,
  PRIMARY KEY (`ChatLogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Data`
--

DROP TABLE IF EXISTS `Data`;
CREATE TABLE IF NOT EXISTS `Data` (
  `DataId` int(11) NOT NULL AUTO_INCREMENT,
  `ParentId` int(11) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Src` varchar(250) DEFAULT NULL,
  `OwnerId` int(11) NOT NULL,
  PRIMARY KEY (`DataId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `MappingDataAccess`
--

DROP TABLE IF EXISTS `MappingDataAccess`;
CREATE TABLE IF NOT EXISTS `MappingDataAccess` (
  `MappingId` int(11) NOT NULL AUTO_INCREMENT,
  `DataId` int(11) NOT NULL,
  `UserGroupId` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `RoleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`MappingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `MappingUserGroup`
--

DROP TABLE IF EXISTS `MappingUserGroup`;
CREATE TABLE IF NOT EXISTS `MappingUserGroup` (
  `MappingId` int(11) NOT NULL AUTO_INCREMENT,
  `UserGroupId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `DateJoin` datetime NOT NULL,
  PRIMARY KEY (`MappingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
CREATE TABLE IF NOT EXISTS `Roles` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT,
  `Role` varchar(50) NOT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `UserGroups`
--

DROP TABLE IF EXISTS `UserGroups`;
CREATE TABLE IF NOT EXISTS `UserGroups` (
  `UserGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `CreatorId` int(11) NOT NULL,
  PRIMARY KEY (`UserGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
CREATE TABLE IF NOT EXISTS `Users` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `RoleId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
