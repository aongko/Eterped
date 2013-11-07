-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2013 at 10:17 AM
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

--
-- Dumping data for table `mappingusergroup`
--

INSERT INTO `mappingusergroup` (`MappingId`, `UserGroupId`, `UserId`, `DateJoin`) VALUES
(1, 1, 1, '2013-11-07 00:00:00');

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`RoleId`, `Role`) VALUES
(1, 'admin'),
(2, 'users');

--
-- Dumping data for table `usergroups`
--

INSERT INTO `usergroups` (`UserGroupId`, `Name`, `CreatorId`) VALUES
(1, 'admin', 1);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserId`, `UserName`, `Password`, `RoleId`) VALUES
(1, 'admin', '21232f297a57a5a743894ae4a801fc3', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
