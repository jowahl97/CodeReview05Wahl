-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 20. Dez 2019 um 10:53
-- Server-Version: 10.4.10-MariaDB
-- PHP-Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr05_johannes_wahl_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `billing_details`
--

CREATE TABLE `billing_details` (
  `BILL_ID` char(6) NOT NULL,
  `BILL_DATE` date NOT NULL,
  `BILL_STATUS` char(1) NOT NULL,
  `DISCOUNT_AMOUNT` decimal(10,2) NOT NULL,
  `TOTAL_AMOUNT` decimal(10,2) NOT NULL,
  `TAX_AMOUNT` decimal(10,2) NOT NULL,
  `BOOKING_ID` char(5) NOT NULL,
  `TOTAL_LATE_FEE` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking_details`
--

CREATE TABLE `booking_details` (
  `BOOKING_ID` char(5) NOT NULL,
  `FROM_DT_TIME` datetime NOT NULL,
  `RET_DT_TIME` datetime NOT NULL,
  `AMOUNT` decimal(10,2) NOT NULL,
  `BOOKING_STATUS` char(1) NOT NULL,
  `PICKUP_LOC` char(4) NOT NULL,
  `DROP_LOC` char(4) NOT NULL,
  `REG_NUM` char(7) NOT NULL,
  `DL_NUM` char(8) NOT NULL,
  `INS_CODE` char(4) DEFAULT NULL,
  `ACT_RET_DT_TIME` datetime DEFAULT NULL,
  `DISCOUNT_CODE` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `REGISTRATION_NUMBER` char(7) NOT NULL,
  `MODEL_NAME` varchar(25) NOT NULL,
  `MAKE` varchar(25) NOT NULL,
  `MODEL_YEAR` decimal(4,0) NOT NULL,
  `MILEAGE` int(11) NOT NULL,
  `CAR_CATEGORY_NAME` varchar(25) NOT NULL,
  `LOC_ID` char(4) NOT NULL,
  `AVAILABILITY_FLAG` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_categ`
--

CREATE TABLE `car_categ` (
  `CATEGORY_NAME` varchar(25) NOT NULL,
  `NO_OF_LUGGAGE` int(11) NOT NULL,
  `NO_OF_PERSON` int(11) NOT NULL,
  `COST_PER_DAY` decimal(5,2) NOT NULL,
  `LATE_FEE_PER_HOUR` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `client`
--

CREATE TABLE `client` (
  `Client_ID` char(8) NOT NULL,
  `FNAME` varchar(25) NOT NULL,
  `MNAME` varchar(15) DEFAULT NULL,
  `LNAME` varchar(25) NOT NULL,
  `PHONE_NUMBER` decimal(10,0) NOT NULL,
  `EMAIL_ID` varchar(30) NOT NULL,
  `STREET` varchar(30) NOT NULL,
  `STATE_NAME` varchar(20) NOT NULL,
  `ZIPCODE` decimal(5,0) NOT NULL,
  `MEMBERSHIP_TYPE` char(1) NOT NULL DEFAULT 'N',
  `MEMBERSHIP_ID` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `discount_details`
--

CREATE TABLE `discount_details` (
  `DISCOUNT_CODE` char(4) NOT NULL,
  `DISCOUNT_NAME` varchar(25) NOT NULL,
  `EXPIRE_DATE` date NOT NULL,
  `DISCOUNT_PERCENTAGE` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location_details`
--

CREATE TABLE `location_details` (
  `LOCATION_ID` char(4) NOT NULL,
  `LOCATION_NAME` varchar(50) NOT NULL,
  `STREET` varchar(30) NOT NULL,
  `CITY` varchar(20) NOT NULL,
  `STATE_NAME` varchar(20) NOT NULL,
  `ZIPCODE` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rental_car_insurance`
--

CREATE TABLE `rental_car_insurance` (
  `INSURANCE_CODE` char(4) NOT NULL,
  `INSURANCE_NAME` varchar(50) NOT NULL,
  `COVERAGE_TYPE` varchar(200) NOT NULL,
  `COST_PER_DAY` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `billing_details`
--
ALTER TABLE `billing_details`
  ADD PRIMARY KEY (`BILL_ID`),
  ADD KEY `BILLINGFK1` (`BOOKING_ID`);

--
-- Indizes für die Tabelle `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`BOOKING_ID`),
  ADD KEY `BOOKINGFK1` (`PICKUP_LOC`),
  ADD KEY `BOOKINGFK2` (`DROP_LOC`),
  ADD KEY `BOOKINGFK3` (`REG_NUM`),
  ADD KEY `BOOKINGFK4` (`DL_NUM`),
  ADD KEY `BOOKINGFK5` (`INS_CODE`),
  ADD KEY `BOOKINGFK6` (`DISCOUNT_CODE`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`REGISTRATION_NUMBER`),
  ADD KEY `CARFK1` (`CAR_CATEGORY_NAME`),
  ADD KEY `CARFK2` (`LOC_ID`);

--
-- Indizes für die Tabelle `car_categ`
--
ALTER TABLE `car_categ`
  ADD PRIMARY KEY (`CATEGORY_NAME`);

--
-- Indizes für die Tabelle `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Client_ID`);

--
-- Indizes für die Tabelle `discount_details`
--
ALTER TABLE `discount_details`
  ADD PRIMARY KEY (`DISCOUNT_CODE`),
  ADD UNIQUE KEY `DISCOUNTSK` (`DISCOUNT_NAME`);

--
-- Indizes für die Tabelle `location_details`
--
ALTER TABLE `location_details`
  ADD PRIMARY KEY (`LOCATION_ID`);

--
-- Indizes für die Tabelle `rental_car_insurance`
--
ALTER TABLE `rental_car_insurance`
  ADD PRIMARY KEY (`INSURANCE_CODE`),
  ADD UNIQUE KEY `INSURANCESK` (`INSURANCE_NAME`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `billing_details`
--
ALTER TABLE `billing_details`
  ADD CONSTRAINT `BILLINGFK1` FOREIGN KEY (`BOOKING_ID`) REFERENCES `booking_details` (`BOOKING_ID`);

--
-- Constraints der Tabelle `booking_details`
--
ALTER TABLE `booking_details`
  ADD CONSTRAINT `BOOKINGFK1` FOREIGN KEY (`PICKUP_LOC`) REFERENCES `location_details` (`LOCATION_ID`),
  ADD CONSTRAINT `BOOKINGFK2` FOREIGN KEY (`DROP_LOC`) REFERENCES `location_details` (`LOCATION_ID`),
  ADD CONSTRAINT `BOOKINGFK3` FOREIGN KEY (`REG_NUM`) REFERENCES `car` (`REGISTRATION_NUMBER`),
  ADD CONSTRAINT `BOOKINGFK4` FOREIGN KEY (`DL_NUM`) REFERENCES `client` (`Client_ID`),
  ADD CONSTRAINT `BOOKINGFK5` FOREIGN KEY (`INS_CODE`) REFERENCES `rental_car_insurance` (`INSURANCE_CODE`),
  ADD CONSTRAINT `BOOKINGFK6` FOREIGN KEY (`DISCOUNT_CODE`) REFERENCES `discount_details` (`DISCOUNT_CODE`);

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `CARFK1` FOREIGN KEY (`CAR_CATEGORY_NAME`) REFERENCES `car_categ` (`CATEGORY_NAME`),
  ADD CONSTRAINT `CARFK2` FOREIGN KEY (`LOC_ID`) REFERENCES `location_details` (`LOCATION_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
