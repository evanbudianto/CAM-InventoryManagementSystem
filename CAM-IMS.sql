-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2017 at 10:21 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iims_app_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `ID` int(11) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `Contact` varchar(50) NOT NULL,
  `Address` varchar(300) NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `CreatedDate` varchar(30) NOT NULL,
  `ModifiedDate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`ID`, `CustomerName`, `Contact`, `Address`, `CreatedBy`, `ModifiedBy`, `CreatedDate`, `ModifiedDate`) VALUES
(1, 'Ludwig', '0811 1991 12121', 'CSO', 1, 1, '11 April, 2017', '11 April, 2017 | 10:43 am'),
(3, 'Evan Budianto', '08111991805', 'NDS', 3, 4, '11 April, 2017', '18 April, 2017 | 10:28 am'),
(4, 'Abdul Rahim', '08111990210', 'National Digital Sales', 3, 3, '20 April, 2017', '20 April, 2017 | 9:52 am');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inventory`
--

CREATE TABLE `tbl_inventory` (
  `ID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Description` varchar(300) NOT NULL DEFAULT 'Not Available',
  `Quantity` int(11) NOT NULL,
  `Warranty` varchar(30) NOT NULL DEFAULT '0',
  `UnitPrice` varchar(10) NOT NULL,
  `Status` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `CreatedBy` int(11) NOT NULL,
  `CreatedDate` varchar(30) NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `ModifiedDate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_inventory`
--

INSERT INTO `tbl_inventory` (`ID`, `CategoryID`, `Title`, `Description`, `Quantity`, `Warranty`, `UnitPrice`, `Status`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES
(1, 2, 'Kertas HVS A4 60 gsm', 'Merk Sidu', 100, 'No Warranty', '200000', 'Yes', 1, '11 April, 2017', 3, '20 April, 2017 | 10:52 am'),
(2, 3, 'Flashdisk CBS - 16 GB', '', 62, 'No Warranty', '50000', 'Yes', 4, '18 April, 2017', 3, '27 April, 2017 | 1:18 pm'),
(3, 4, 'Goodie Bag - medium', '', 78, 'No Warranty', '5000', 'Yes', 4, '18 April, 2017', 3, '18 April, 2017 | 2:01 pm'),
(4, 1, 'Kardus', 'kardus penyimpanan barang', 17, 'No Warranty', '5000', 'Yes', 3, '20 April, 2017', 3, '21 April, 2017 | 8:57 am'),
(5, 3, 'Flashdisk Toshiba - 1 GB', '', 20, 'No Warranty', '200000', 'Yes', 3, '20 April, 2017', 3, '20 April, 2017 | 11:13 am'),
(6, 3, 'Flashdisk 64 GB', 'tes', 76, 'No Warranty', '200000', 'Yes', 3, '21 April, 2017', 3, '27 April, 2017 | 1:18 pm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inventory_category`
--

CREATE TABLE `tbl_inventory_category` (
  `ID` int(11) NOT NULL,
  `CategoryName` varchar(30) NOT NULL,
  `CategoryKey` varchar(50) NOT NULL,
  `Description` varchar(300) NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CreatedDate` varchar(30) NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `ModifiedDate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_inventory_category`
--

INSERT INTO `tbl_inventory_category` (`ID`, `CategoryName`, `CategoryKey`, `Description`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES
(1, 'Uncategorized', 'uncategorized', '<p>This is the default category</p>', 1, '', 1, '2013-03-16 15:27:36'),
(2, 'ATK', 'atk', 'Alat Tulis Kantor: kertas, pensil, pulpen, buku, agenda, lem, dsb.', 1, '11 April, 2017', 1, '11 April, 2017 | 10:13 am'),
(3, 'Flashdisk', 'flashdisk', 'Flasdisk dan media penyimpanan portabel lainnya', 4, '18 April, 2017', 4, '18 April, 2017 | 9:10 am'),
(4, 'Goodie Bag', 'goodie-bag', '', 4, '18 April, 2017', 4, '18 April, 2017 | 9:15 am');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_invoice`
--

CREATE TABLE `tbl_invoice` (
  `ID` int(11) NOT NULL,
  `InvoiceNumber` varchar(50) NOT NULL,
  `InvoiceType` varchar(30) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `CustomerNameForCashSale` varchar(30) NOT NULL,
  `CustomerMobileForCashSale` varchar(30) NOT NULL DEFAULT '0',
  `CreatedDate` varchar(30) NOT NULL,
  `ServiceCharge` varchar(10) NOT NULL,
  `TotalCost` varchar(10) NOT NULL,
  `TotalDiscount` varchar(10) NOT NULL,
  `VAT` varchar(10) NOT NULL,
  `GrandTotal` decimal(10,0) NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `ModifiedDate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_invoice`
--

INSERT INTO `tbl_invoice` (`ID`, `InvoiceNumber`, `InvoiceType`, `CustomerID`, `CustomerNameForCashSale`, `CustomerMobileForCashSale`, `CreatedDate`, `ServiceCharge`, `TotalCost`, `TotalDiscount`, `VAT`, `GrandTotal`, `CreatedBy`, `ModifiedBy`, `ModifiedDate`) VALUES
(3, 'INV-09065', 'Regular Request', 3, '', '0', '17 April, 2017', '', '200000', '', '', '200000', 3, 3, '17 April, 2017 | 3:17 pm'),
(4, 'INV-95101', 'Regular Request', 3, '', '0', '18 April, 2017', '', '550000', '', '', '550000', 4, 4, '18 April, 2017 | 9:16 am'),
(5, 'REQ-170444736', 'Regular Request', 3, '', '0', '18 April, 2017', '', '50000', '', '', '50000', 3, 3, '18 April, 2017 | 1:36 pm'),
(12, 'REQ-1704-1', 'Regular Request', 3, '', '0', '18 April, 2017', '', '5000', '', '', '5000', 3, 3, '18 April, 2017 | 2:01 pm'),
(13, 'REQ-1704-2', 'Regular Request', 3, '', '0', '18 April, 2017', '', '200000', '', '', '200000', 3, 3, '18 April, 2017 | 2:09 pm'),
(14, 'REQ-1704-3', 'Regular Request', 3, '', '0', '18 April, 2017', '', '50000', '', '', '50000', 3, 3, '18 April, 2017 | 2:13 pm'),
(15, 'REQ-1704-4', 'Regular Request', 3, '', '0', '18 April, 2017', '0', '4250000', '0', '0', '4250000', 3, 3, '18 April, 2017 | 3:08 pm'),
(16, 'REQ-1704-5', 'Regular Request', 3, '', '0', '01 May, 2017', '0', '5000', '0', '0', '5000', 3, 3, '21 April, 2017 | 8:57 am'),
(17, 'REQ-1704-6', 'Regular Request', 3, '', '0', '21 April, 2017', '0', '4000000', '0', '0', '4000000', 3, 3, '21 April, 2017 | 9:10 am'),
(18, 'REQ-1704-7', 'Regular Request', 3, '', '0', '27 April, 2017', '0', '1100000', '0', '0', '1100000', 3, 3, '27 April, 2017 | 1:18 pm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_invoice_details`
--

CREATE TABLE `tbl_invoice_details` (
  `ID` int(11) NOT NULL,
  `InvoiceID` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Description` varchar(300) NOT NULL,
  `UnitPrice` decimal(10,0) NOT NULL,
  `Warranty` varchar(30) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `SerialNumber` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_invoice_details`
--

INSERT INTO `tbl_invoice_details` (`ID`, `InvoiceID`, `Title`, `Description`, `UnitPrice`, `Warranty`, `Quantity`, `SerialNumber`) VALUES
(2, 2, 'Kertas HVS A4 60 gsm', 'Merk Sidu', '200000', 'No Warranty', 9, ''),
(3, 3, 'Kertas HVS A4 60 gsm', 'Merk Sidu', '200000', 'No Warranty', 1, ''),
(4, 4, 'Flashdisk CBS - 16 GB', '', '50000', 'No Warranty', 10, ''),
(5, 4, 'Goodie Bag - medium', '', '5000', 'No Warranty', 10, ''),
(6, 5, 'Flashdisk CBS - 16 GB', '', '50000', 'No Warranty', 1, ''),
(13, 12, 'Goodie Bag - medium', '', '5000', 'No Warranty', 1, ''),
(14, 13, 'Kertas HVS A4 60 gsm', 'Merk Sidu', '200000', 'No Warranty', 1, ''),
(15, 14, 'Flashdisk CBS - 16 GB', '', '50000', 'No Warranty', 1, ''),
(16, 15, 'Flashdisk CBS - 16 GB', '', '50000', 'No Warranty', 17, ''),
(17, 15, 'Kertas HVS A4 60 gsm', 'Merk Sidu', '200000', 'No Warranty', 17, ''),
(18, 16, 'Kardus', 'kardus penyimpanan barang', '5000', 'No Warranty', 1, ''),
(19, 17, 'Flashdisk 64 GB', 'tes', '200000', 'No Warranty', 20, ''),
(20, 18, 'Flashdisk 64 GB', 'tes', '200000', 'No Warranty', 4, ''),
(21, 18, 'Flashdisk CBS - 16 GB', '', '50000', 'No Warranty', 6, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_organization`
--

CREATE TABLE `tbl_organization` (
  `ID` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `SubTitle` varchar(100) NOT NULL,
  `Description` varchar(300) NOT NULL,
  `Address` varchar(300) NOT NULL,
  `Mobile` varchar(20) NOT NULL,
  `Phone` varchar(25) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Website` varchar(50) NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `ModifiedDate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_organization`
--

INSERT INTO `tbl_organization` (`ID`, `Title`, `SubTitle`, `Description`, `Address`, `Mobile`, `Phone`, `Email`, `Website`, `CreatedBy`, `ModifiedBy`, `ModifiedDate`) VALUES
(1, 'Corporate Account Management - TELKOMSEL', '', '', 'Telkom Landmark Tower, Tower 1, Lt. 18, Jl. Jend. Gatot Subroto Kav. 52, Jakarta 12710 - Indonesia', '+62-811', '+62-21 5240811', 'cs@telkomsel.com', 'enterprise.telkomsel.com', 4, 3, '20 April, 2017 | 11:06 am');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_todo`
--

CREATE TABLE `tbl_todo` (
  `ID` int(11) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Status` enum('Complete','Incomplete') NOT NULL,
  `CreatedDate` varchar(30) NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `ModifiedBy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedDate` varchar(30) NOT NULL,
  `FinishedBy` int(11) NOT NULL,
  `FinishedDate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `ID` int(11) NOT NULL,
  `UserName` varchar(30) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Contact` varchar(25) NOT NULL,
  `Address` text NOT NULL,
  `IsActive` tinyint(4) NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CreatedDate` varchar(30) NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `ModifiedDate` varchar(30) NOT NULL,
  `AdminType` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`ID`, `UserName`, `Password`, `Name`, `Contact`, `Address`, `IsActive`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `AdminType`) VALUES
(1, 'admin', 'd700e32e6356642bfcee6aa89f7c7e6fe055da36', 'Administrator', '555777999', 'Earth', 1, 1, '01 January, 2013', 1, '11 April, 2015 | 3:09 am', ''),
(3, 'evan', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Evan', '08111991805', 'TSO', 1, 1, '11 April, 2017', 1, '11 April, 2017 | 4:24 pm', 'General Admin'),
(4, 'endang_sutisna', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Endang Sutisna', '08111991', 'TSO', 1, 3, '18 April, 2017', 3, '18 April, 2017 | 8:19 am', 'General Admin'),
(5, 'hendragiri', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Hendragiri Waspadajati', '081111121211', 'CPM', 1, 4, '18 April, 2017', 4, '18 April, 2017 | 10:10 am', ''),
(6, 'akbarisanto', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Ridho Akbarisanto', '0811111', 'BKLPK', 1, 3, '20 April, 2017', 3, '20 April, 2017 | 3:13 pm', 'General Admin'),
(7, 'danangan', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Danang Arbansa', '0812121', 'ENCR', 1, 3, '20 April, 2017', 3, '20 April, 2017 | 3:18 pm', '0'),
(8, 'yuprat', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Yudha Pratama', '0812123', 'CCD', 1, 3, '20 April, 2017', 3, '20 April, 2017 | 3:19 pm', '0'),
(9, 'evita', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Evita', '08123123', 'ABC', 1, 3, '20 April, 2017', 3, '20 April, 2017 | 5:05 pm', '0'),
(10, 'jokowi', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Joko Widodo', '081111', 'RI1', 1, 3, '20 April, 2017', 3, '20 April, 2017 | 5:19 pm', '0'),
(11, 'jusufkalla', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Jusuf Kalla', '081211212', 'RI1', 1, 3, '20 April, 2017', 3, '20 April, 2017 | 5:20 pm', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Contact` (`Contact`);

--
-- Indexes for table `tbl_inventory`
--
ALTER TABLE `tbl_inventory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_inventory_category`
--
ALTER TABLE `tbl_inventory_category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_invoice_details`
--
ALTER TABLE `tbl_invoice_details`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_organization`
--
ALTER TABLE `tbl_organization`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_todo`
--
ALTER TABLE `tbl_todo`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_inventory`
--
ALTER TABLE `tbl_inventory`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_inventory_category`
--
ALTER TABLE `tbl_inventory_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tbl_invoice_details`
--
ALTER TABLE `tbl_invoice_details`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tbl_organization`
--
ALTER TABLE `tbl_organization`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_todo`
--
ALTER TABLE `tbl_todo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
