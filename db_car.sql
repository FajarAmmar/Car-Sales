-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2022 at 09:47 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_car`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `COSTUMER_ID` varchar(6) NOT NULL,
  `FIRSTNAME` varchar(50) DEFAULT NULL,
  `LASTNAME` varchar(50) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `CONTACT_NO` varchar(13) DEFAULT NULL,
  `GENDER` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`COSTUMER_ID`, `FIRSTNAME`, `LASTNAME`, `ADDRESS`, `EMAIL`, `CONTACT_NO`, `GENDER`) VALUES
('CST001', 'FAJAR', 'MAULANA', 'Komp pertama NO.C/15, NANGGALO PADANG', 'fajarmaulana@email.com', '081234567890', 'MALE'),
('CST002', 'Gemilang', 'Ammar', 'Jalan Duri Rambutan No.30 , Cengkareng , Jakarta Barat', 'gemilangammar@email.com', '089765432111', 'MALE'),
('CST003', 'Putri', 'Amanda', 'Jalan Merdeka no.30 , Besi, Lampung', 'putriamanda@email.com', '081982736450', 'FEMALE');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `EMPLOYEE_ID` varchar(6) NOT NULL,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `JOB_TITLE` varchar(50) DEFAULT NULL,
  `CONTACT_NO` varchar(13) DEFAULT NULL,
  `HIRED_DATE` date DEFAULT NULL,
  `SALARY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME`, `JOB_TITLE`, `CONTACT_NO`, `HIRED_DATE`, `SALARY`) VALUES
('EMP001', 'Eri', 'Putranda', 'Sales1', '084387354432', '2020-04-15', 12850000),
('EMP002', 'Kenny', 'Kurniasih', 'Sales2', '081245379438', '2021-07-14', 8000000),
('EMP003', 'Rizki', 'Qamar', 'Sales3', '081233445599', '2022-01-03', 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_location`
--

CREATE TABLE `tbl_location` (
  `LOCATION_ID` varchar(6) NOT NULL,
  `PROVINCE` varchar(50) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_location`
--

INSERT INTO `tbl_location` (`LOCATION_ID`, `PROVINCE`, `CITY`) VALUES
('LOC001', 'Jakarta', 'JAKARTA BARAT'),
('LOC002', 'Sumatera Barat', 'Padang'),
('LOC003', 'Lampung', 'Lampung');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `PRODUCT_ID` varchar(6) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`PRODUCT_ID`, `NAME`, `price`) VALUES
('CAR001', 'Emlima Hybrid', 300000000),
('CAR002', 'Emlima m22', 250000000),
('CAR003', 'Emlima GA', 200000000),
('CAR004', 'Emlima GS', 280000000),
('CAR005', 'EMLIMA X20', 220000000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sale`
--

CREATE TABLE `tbl_sale` (
  `TRANS_ID` varchar(7) DEFAULT NULL,
  `PRODUCT_ID` varchar(6) DEFAULT NULL,
  `EMPLOYEE_ID` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_sale`
--

INSERT INTO `tbl_sale` (`TRANS_ID`, `PRODUCT_ID`, `EMPLOYEE_ID`) VALUES
('TRC001', 'CAR002', 'EMP001'),
('TRC002', 'CAR003', 'EMP001'),
('TRC003', 'CAR004', 'EMP003');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction`
--

CREATE TABLE `tbl_transaction` (
  `TRANS_ID` varchar(7) NOT NULL,
  `EMPLOYEE_ID` varchar(6) DEFAULT NULL,
  `PRODUCT_ID` varchar(6) DEFAULT NULL,
  `COSTUMER_ID` varchar(6) DEFAULT NULL,
  `LOCATION_ID` varchar(6) DEFAULT NULL,
  `DATE_TIME` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_transaction`
--

INSERT INTO `tbl_transaction` (`TRANS_ID`, `EMPLOYEE_ID`, `PRODUCT_ID`, `COSTUMER_ID`, `LOCATION_ID`, `DATE_TIME`) VALUES
('TRC001', 'EMP001', 'CAR002', 'CST002', 'LOC001', '2022-07-09'),
('TRC002', 'EMP001', 'CAR003', 'CST003', 'LOC003', '2022-07-12'),
('TRC003', 'EMP003', 'CAR004', 'CST002', 'LOC001', '2022-07-08');

--
-- Triggers `tbl_transaction`
--
DELIMITER $$
CREATE TRIGGER `after_sale` AFTER INSERT ON `tbl_transaction` FOR EACH ROW BEGIN
INSERT INTO tbl_sale(TRANS_ID, PRODUCT_ID, EMPLOYEE_ID) values(new.TRANS_ID, new.PRODUCT_ID, new.EMPLOYEE_ID);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`COSTUMER_ID`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`EMPLOYEE_ID`);

--
-- Indexes for table `tbl_location`
--
ALTER TABLE `tbl_location`
  ADD PRIMARY KEY (`LOCATION_ID`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`PRODUCT_ID`);

--
-- Indexes for table `tbl_sale`
--
ALTER TABLE `tbl_sale`
  ADD KEY `TRANS_ID` (`TRANS_ID`),
  ADD KEY `PRODUCT_ID` (`PRODUCT_ID`),
  ADD KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`);

--
-- Indexes for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD PRIMARY KEY (`TRANS_ID`),
  ADD KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`),
  ADD KEY `PRODUCT_ID` (`PRODUCT_ID`),
  ADD KEY `COSTUMER_ID` (`COSTUMER_ID`),
  ADD KEY `LOCATION_ID` (`LOCATION_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_sale`
--
ALTER TABLE `tbl_sale`
  ADD CONSTRAINT `tbl_sale_ibfk_1` FOREIGN KEY (`TRANS_ID`) REFERENCES `tbl_transaction` (`TRANS_ID`),
  ADD CONSTRAINT `tbl_sale_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `tbl_product` (`PRODUCT_ID`),
  ADD CONSTRAINT `tbl_sale_ibfk_3` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `tbl_employee` (`EMPLOYEE_ID`);

--
-- Constraints for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD CONSTRAINT `tbl_transaction_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `tbl_employee` (`EMPLOYEE_ID`),
  ADD CONSTRAINT `tbl_transaction_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `tbl_product` (`PRODUCT_ID`),
  ADD CONSTRAINT `tbl_transaction_ibfk_3` FOREIGN KEY (`COSTUMER_ID`) REFERENCES `tbl_customer` (`COSTUMER_ID`),
  ADD CONSTRAINT `tbl_transaction_ibfk_4` FOREIGN KEY (`LOCATION_ID`) REFERENCES `tbl_location` (`LOCATION_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
