-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 24, 2018 at 02:31 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DB_Project`
--

-- --------------------------------------------------------

--
-- Table structure for table `BOOKS`
--

CREATE TABLE `BOOKS` (
  `HotelID` int(10) NOT NULL,
  `TripID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `COLLEGE`
--

CREATE TABLE `COLLEGE` (
  `CollegeID` int(10) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `SBdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HOTEL`
--

CREATE TABLE `HOTEL` (
  `HotelID` int(10) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Cost` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PAYMENT`
--

CREATE TABLE `PAYMENT` (
  `CardNumber` int(16) NOT NULL,
  `CardType` varchar(30) NOT NULL,
  `BillingAddress` varchar(50) DEFAULT NULL,
  `BillingFName` varchar(20) DEFAULT NULL,
  `BillingLName` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PAYSWITH`
--

CREATE TABLE `PAYSWITH` (
  `PaymentID` int(10) NOT NULL,
  `PaymentDate` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  `CardNumber` int(16) NOT NULL,
  `CardType` varchar(30) NOT NULL,
  `UserID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ROUNDTRIPFLIGHT`
--

CREATE TABLE `ROUNDTRIPFLIGHT` (
  `FlightID` int(10) NOT NULL,
  `Duration` int(10) DEFAULT NULL,
  `Cost` float DEFAULT NULL,
  `Airline` varchar(30) DEFAULT NULL,
  `Origin` varchar(50) DEFAULT NULL,
  `DepartureDateTO` date DEFAULT NULL,
  `DepartureTimeTo` time DEFAULT NULL,
  `DepartureDateFrom` date DEFAULT NULL,
  `DepartureTImeFrom` time DEFAULT NULL,
  `TripID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `TAKES`
--

CREATE TABLE `TAKES` (
  `UserID` int(11) NOT NULL,
  `TripID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `TRIP`
--

CREATE TABLE `TRIP` (
  `TripID` int(10) NOT NULL,
  `Date` date DEFAULT NULL,
  `Cost` float DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE `USER` (
  `UserID` int(10) NOT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `College` varchar(30) DEFAULT NULL,
  `CollegeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BOOKS`
--
ALTER TABLE `BOOKS`
  ADD KEY `HotelID` (`HotelID`),
  ADD KEY `TripID` (`TripID`);

--
-- Indexes for table `COLLEGE`
--
ALTER TABLE `COLLEGE`
  ADD PRIMARY KEY (`CollegeID`);

--
-- Indexes for table `HOTEL`
--
ALTER TABLE `HOTEL`
  ADD PRIMARY KEY (`HotelID`);

--
-- Indexes for table `PAYMENT`
--
ALTER TABLE `PAYMENT`
  ADD PRIMARY KEY (`CardNumber`,`CardType`);

--
-- Indexes for table `PAYSWITH`
--
ALTER TABLE `PAYSWITH`
  ADD PRIMARY KEY (`PaymentID`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD KEY `CardNumber` (`CardNumber`) USING BTREE,
  ADD KEY `CardType` (`CardType`);

--
-- Indexes for table `ROUNDTRIPFLIGHT`
--
ALTER TABLE `ROUNDTRIPFLIGHT`
  ADD PRIMARY KEY (`FlightID`),
  ADD KEY `TripID` (`TripID`);

--
-- Indexes for table `TAKES`
--
ALTER TABLE `TAKES`
  ADD KEY `UserID` (`UserID`),
  ADD KEY `TripID` (`TripID`);

--
-- Indexes for table `TRIP`
--
ALTER TABLE `TRIP`
  ADD PRIMARY KEY (`TripID`);

--
-- Indexes for table `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `CollegeID` (`CollegeID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BOOKS`
--
ALTER TABLE `BOOKS`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `HOTEL` (`HotelID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`TripID`) REFERENCES `TRIP` (`TripID`);

--
-- Constraints for table `PAYSWITH`
--
ALTER TABLE `PAYSWITH`
  ADD CONSTRAINT `payswith_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `USER` (`UserID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `payswith_ibfk_2` FOREIGN KEY (`CardNumber`) REFERENCES `PAYMENT` (`CardNumber`) ON UPDATE CASCADE;

--
-- Constraints for table `ROUNDTRIPFLIGHT`
--
ALTER TABLE `ROUNDTRIPFLIGHT`
  ADD CONSTRAINT `roundtripflight_ibfk_1` FOREIGN KEY (`TripID`) REFERENCES `TRIP` (`TripID`) ON UPDATE CASCADE;

--
-- Constraints for table `TAKES`
--
ALTER TABLE `TAKES`
  ADD CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `USER` (`UserID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`TripID`) REFERENCES `TRIP` (`TripID`) ON UPDATE CASCADE;

--
-- Constraints for table `USER`
--
ALTER TABLE `USER`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `COLLEGE` (`CollegeID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
