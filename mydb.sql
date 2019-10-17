-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2019 at 03:18 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `client_fname` varchar(45) NOT NULL,
  `client_lname` varchar(45) NOT NULL,
  `client_initial` varchar(45) NOT NULL,
  `client_address` varchar(45) NOT NULL,
  `client_contact` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `client_fname`, `client_lname`, `client_initial`, `client_address`, `client_contact`) VALUES
(1, 'Andre', 'Lagsac', 'M.', '236 H.Santos St. Tejeros Bliss Makati City', '895-65-65');

-- --------------------------------------------------------

--
-- Table structure for table `client_has_commodities`
--

CREATE TABLE `client_has_commodities` (
  `client_id` int(11) NOT NULL,
  `commodities_id` int(11) NOT NULL,
  `commodities_employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commodities`
--

CREATE TABLE `commodities` (
  `id` int(11) NOT NULL,
  `com_type` varchar(45) NOT NULL,
  `com_validity` varchar(45) NOT NULL,
  `com_worth` varchar(45) NOT NULL,
  `com_quantity` varchar(45) NOT NULL,
  `com_brand` varchar(45) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `id` int(11) NOT NULL,
  `con_signed` varchar(45) NOT NULL,
  `con_date` datetime NOT NULL,
  `con_expiration` datetime NOT NULL,
  `client_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `employee_client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `del_cour` varchar(45) NOT NULL,
  `del_data_receive` varchar(45) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`id`, `del_cour`, `del_data_receive`, `client_id`) VALUES
(2, 'LBC', 'October 12 2019', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `emp_fname` varchar(45) NOT NULL,
  `emp_lname` varchar(45) NOT NULL,
  `emp_initial` varchar(2) NOT NULL,
  `emp_address` varchar(255) NOT NULL,
  `emp_dob` datetime NOT NULL,
  `client_id` int(11) NOT NULL,
  `financial_report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `emp_fname`, `emp_lname`, `emp_initial`, `emp_address`, `emp_dob`, `client_id`, `financial_report_id`) VALUES
(2, 'Kyla', 'Lapid', 'C.', 'Taguig City', '2019-10-08 00:00:00', 1, 40);

-- --------------------------------------------------------

--
-- Table structure for table `financial_report`
--

CREATE TABLE `financial_report` (
  `id` int(11) NOT NULL,
  `fr_amount` varchar(45) NOT NULL,
  `fr_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `financial_report`
--

INSERT INTO `financial_report` (`id`, `fr_amount`, `fr_date`) VALUES
(40, 'P230,000', '2019-10-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` int(11) NOT NULL,
  `sal_amount` varchar(45) NOT NULL,
  `sal_received` varchar(45) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `employee_client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `id` int(11) NOT NULL,
  `trai_location` varchar(45) NOT NULL,
  `trai_num_employ` varchar(45) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `employee_client_id` int(11) NOT NULL,
  `employee_financial_report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `training`
--

INSERT INTO `training` (`id`, `trai_location`, `trai_num_employ`, `employee_id`, `employee_client_id`, `employee_financial_report_id`) VALUES
(30, 'Manila City', '10', 2, 1, 40);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_has_commodities`
--
ALTER TABLE `client_has_commodities`
  ADD PRIMARY KEY (`client_id`,`commodities_id`,`commodities_employee_id`),
  ADD KEY `fk_client_has_commodities_commodities1_idx` (`commodities_id`,`commodities_employee_id`),
  ADD KEY `fk_client_has_commodities_client1_idx` (`client_id`);

--
-- Indexes for table `commodities`
--
ALTER TABLE `commodities`
  ADD PRIMARY KEY (`id`,`employee_id`),
  ADD KEY `fk_commodities_employee_idx` (`employee_id`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`id`,`client_id`,`employee_id`,`employee_client_id`),
  ADD KEY `fk_contract_client1_idx` (`client_id`),
  ADD KEY `fk_contract_employee1_idx` (`employee_id`,`employee_client_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`,`client_id`),
  ADD KEY `fk_delivery_client1_idx` (`client_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`,`client_id`,`financial_report_id`),
  ADD KEY `fk_employee_client1_idx` (`client_id`),
  ADD KEY `fk_employee_financial_report1_idx` (`financial_report_id`);

--
-- Indexes for table `financial_report`
--
ALTER TABLE `financial_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`,`employee_id`,`employee_client_id`),
  ADD KEY `fk_salary_employee1_idx` (`employee_id`,`employee_client_id`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`id`,`employee_id`,`employee_client_id`,`employee_financial_report_id`),
  ADD KEY `fk_training_employee1_idx` (`employee_id`,`employee_client_id`,`employee_financial_report_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_has_commodities`
--
ALTER TABLE `client_has_commodities`
  ADD CONSTRAINT `fk_client_has_commodities_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_client_has_commodities_commodities1` FOREIGN KEY (`commodities_id`,`commodities_employee_id`) REFERENCES `commodities` (`id`, `employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `commodities`
--
ALTER TABLE `commodities`
  ADD CONSTRAINT `fk_commodities_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `fk_contract_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contract_employee1` FOREIGN KEY (`employee_id`,`employee_client_id`) REFERENCES `employee` (`id`, `client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `fk_delivery_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employee_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employee_financial_report1` FOREIGN KEY (`financial_report_id`) REFERENCES `financial_report` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `fk_salary_employee1` FOREIGN KEY (`employee_id`,`employee_client_id`) REFERENCES `employee` (`id`, `client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `fk_training_employee1` FOREIGN KEY (`employee_id`,`employee_client_id`,`employee_financial_report_id`) REFERENCES `employee` (`id`, `client_id`, `financial_report_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
