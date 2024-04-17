-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2024 at 06:59 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `obrsphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked`
--

CREATE TABLE `booked` (
  `id` int(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `name` varchar(250) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '1=Paid, 0- Unpaid',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booked`
--

INSERT INTO `booked` (`id`, `schedule_id`, `ref_no`, `name`, `qty`, `status`, `date_updated`) VALUES
(1, 1, '202206248407', 'Ahmed', 2, 1, '2024-01-10 08:25:12'),
(2, 4, '202206252673', 'Talat Hussain', 2, 0, '2024-01-10 08:25:22'),
(3, 2, '202206251496', 'Qasim Ali', 3, 1, '2024-01-10 08:25:30'),
(4, 4, '202206254769', 'Saad Abdullah', 1, 1, '2024-01-10 08:25:42'),
(5, 7, '202206257753', 'AHMED AKHUNZADA', 34, 0, '2024-01-10 08:25:56'),
(6, 5, '20220625746', 'WALI KHAN', 3, 1, '2024-01-10 08:26:07'),
(7, 9, '202206252201', 'MALIK HUZAIFA', 1, 0, '2024-01-10 21:20:46'),
(8, 8, '202401097095', 'Capital Transports', 1, 0, '2024-01-09 19:58:07'),
(9, 1, '2024011075', 'malik_huzaifa', 12, 0, '2024-01-10 08:19:35');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `bus_number` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `name`, `bus_number`, `status`, `date_updated`) VALUES
(1, 'Coaster', 'RWP-203', 1, '2024-01-10 08:26:56'),
(2, 'Coach', 'LHR-97', 1, '2024-01-10 21:21:44'),
(3, 'HIACE', 'ISB-99', 1, '2024-01-10 08:27:26'),
(4, 'Coaster', 'LM-8199', 1, '2024-01-10 08:26:36'),
(5, 'Business Class', 'KHR-997', 1, '2024-01-10 21:21:31'),
(6, 'Bus', 'RWP-980', 1, '2024-01-10 21:21:59'),
(7, 'Red Coach', 'QWE8787', 1, '2024-01-10 21:22:06'),
(8, 'Business Class', 'ISB-0099', 1, '2024-01-10 21:21:14'),
(10, 'DEWOO', 'RWP-877', 1, '2024-01-10 08:29:22');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(30) NOT NULL,
  `terminal_name` text NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0= inactive , 1= active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `terminal_name`, `city`, `state`, `status`, `date_updated`) VALUES
(1, 'Pirwadhi', 'Rawalpindi', 'Punjab', 1, '2024-01-10 22:00:10'),
(2, 'Kohistan Travels', 'Lahore', 'Punjab', 1, '2024-01-10 22:03:32'),
(3, 'Faisal Movers', 'Islamabad', 'Islamabad', 1, '2024-01-10 22:00:33'),
(4, 'Sadar', 'Karachi', 'Sind', 1, '2024-01-10 22:00:38'),
(5, 'Kinat Travels', 'Faislabad', 'Islamabad', 1, '2024-01-10 22:03:39'),
(6, 'Lari Adda', 'Kashmir', 'Kashmir', 1, '2024-01-10 22:01:25'),
(7, 'Faizabad', 'Rawalpindi', 'Punjab', 1, '2024-01-10 22:01:34'),
(8, 'SWAT', 'SWAT', 'Punjab', 1, '2024-01-10 21:36:27'),
(9, 'Peshawar', 'Peshawar', 'Peshawar', 1, '2024-01-10 21:36:18');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_list`
--

CREATE TABLE `schedule_list` (
  `id` int(30) NOT NULL,
  `bus_id` int(30) NOT NULL,
  `from_location` int(30) NOT NULL,
  `to_location` int(30) NOT NULL,
  `departure_time` datetime NOT NULL,
  `eta` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `availability` int(11) NOT NULL,
  `price` text NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule_list`
--

INSERT INTO `schedule_list` (`id`, `bus_id`, `from_location`, `to_location`, `departure_time`, `eta`, `status`, `availability`, `price`, `date_updated`) VALUES
(1, 6, 1, 5, '2024-06-25 15:00:00', '2024-06-25 20:00:00', 1, 25, '50', '2024-01-10 16:46:48'),
(2, 6, 1, 4, '2024-06-25 20:00:00', '2024-06-25 01:00:00', 1, 30, '26', '2024-01-10 03:27:08'),
(3, 1, 3, 9, '2024-06-26 10:00:00', '2024-06-26 16:00:00', 1, 32, '33', '2024-01-10 03:27:08'),
(4, 1, 4, 1, '2024-06-26 08:00:00', '2024-06-26 19:00:00', 1, 30, '65', '2024-01-10 16:46:37'),
(5, 7, 8, 4, '2024-06-27 10:00:00', '2024-06-27 19:00:00', 1, 33, '80', '2024-01-10 16:47:21'),
(6, 4, 7, 6, '2024-06-26 11:00:00', '2024-06-25 13:00:00', 1, 35, '43', '2024-01-10 03:27:08'),
(7, 8, 9, 1, '2024-01-10 09:00:00', '2024-01-11 23:00:00', 1, 34, '75', '2024-01-10 03:27:08'),
(8, 3, 6, 1, '2024-01-18 13:00:00', '2024-01-18 08:37:00', 1, 31, '68', '2024-01-10 03:27:08'),
(9, 4, 3, 1, '2024-01-11 08:36:00', '2024-01-10 14:00:00', 1, 38, '65', '2024-01-10 16:46:42'),
(10, 7, 2, 2, '2024-01-12 21:41:00', '2024-01-10 23:00:00', 1, 50, '100', '2024-01-10 16:46:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(150) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT 1,
  `username` varchar(25) NOT NULL,
  `password` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
(1, 'Huzaifa Jawed', 1, 'huzaifa', '8489d7673bfb7762f95c136492106151', 1, '2024-01-10 22:57:43'),
(2, 'Ahmed Chorahi', 1, 'ahmed', '73e2f77424d3ddeac535c4b14da6ef1e', 1, '2024-01-10 22:56:37'),
(3, 'Talat Hussain', 1, 'talat', 'e27416231c347f217a2664da0944dde7', 1, '2024-01-10 22:58:50'),
(4, 'Malik Huzaifa', 1, 'malik', '8489d7673bfb7762f95c136492106151', 1, '2024-01-10 22:57:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked`
--
ALTER TABLE `booked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booked`
--
ALTER TABLE `booked`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2024 at 06:59 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `obrsphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked`
--

CREATE TABLE `booked` (
  `id` int(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `name` varchar(250) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '1=Paid, 0- Unpaid',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booked`
--

INSERT INTO `booked` (`id`, `schedule_id`, `ref_no`, `name`, `qty`, `status`, `date_updated`) VALUES
(1, 1, '202206248407', 'Ahmed', 2, 1, '2024-01-10 08:25:12'),
(2, 4, '202206252673', 'Talat Hussain', 2, 0, '2024-01-10 08:25:22'),
(3, 2, '202206251496', 'Qasim Ali', 3, 1, '2024-01-10 08:25:30'),
(4, 4, '202206254769', 'Saad Abdullah', 1, 1, '2024-01-10 08:25:42'),
(5, 7, '202206257753', 'AHMED AKHUNZADA', 34, 0, '2024-01-10 08:25:56'),
(6, 5, '20220625746', 'WALI KHAN', 3, 1, '2024-01-10 08:26:07'),
(7, 9, '202206252201', 'MALIK HUZAIFA', 1, 0, '2024-01-10 21:20:46'),
(8, 8, '202401097095', 'Capital Transports', 1, 0, '2024-01-09 19:58:07'),
(9, 1, '2024011075', 'malik_huzaifa', 12, 0, '2024-01-10 08:19:35');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `bus_number` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `name`, `bus_number`, `status`, `date_updated`) VALUES
(1, 'Coaster', 'RWP-203', 1, '2024-01-10 08:26:56'),
(2, 'Coach', 'LHR-97', 1, '2024-01-10 21:21:44'),
(3, 'HIACE', 'ISB-99', 1, '2024-01-10 08:27:26'),
(4, 'Coaster', 'LM-8199', 1, '2024-01-10 08:26:36'),
(5, 'Business Class', 'KHR-997', 1, '2024-01-10 21:21:31'),
(6, 'Bus', 'RWP-980', 1, '2024-01-10 21:21:59'),
(7, 'Red Coach', 'QWE8787', 1, '2024-01-10 21:22:06'),
(8, 'Business Class', 'ISB-0099', 1, '2024-01-10 21:21:14'),
(10, 'DEWOO', 'RWP-877', 1, '2024-01-10 08:29:22');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(30) NOT NULL,
  `terminal_name` text NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0= inactive , 1= active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `terminal_name`, `city`, `state`, `status`, `date_updated`) VALUES
(1, 'Pirwadhi', 'Rawalpindi', 'Punjab', 1, '2024-01-10 22:00:10'),
(2, 'Kohistan Travels', 'Lahore', 'Punjab', 1, '2024-01-10 22:03:32'),
(3, 'Faisal Movers', 'Islamabad', 'Islamabad', 1, '2024-01-10 22:00:33'),
(4, 'Sadar', 'Karachi', 'Sind', 1, '2024-01-10 22:00:38'),
(5, 'Kinat Travels', 'Faislabad', 'Islamabad', 1, '2024-01-10 22:03:39'),
(6, 'Lari Adda', 'Kashmir', 'Kashmir', 1, '2024-01-10 22:01:25'),
(7, 'Faizabad', 'Rawalpindi', 'Punjab', 1, '2024-01-10 22:01:34'),
(8, 'SWAT', 'SWAT', 'Punjab', 1, '2024-01-10 21:36:27'),
(9, 'Peshawar', 'Peshawar', 'Peshawar', 1, '2024-01-10 21:36:18');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_list`
--

CREATE TABLE `schedule_list` (
  `id` int(30) NOT NULL,
  `bus_id` int(30) NOT NULL,
  `from_location` int(30) NOT NULL,
  `to_location` int(30) NOT NULL,
  `departure_time` datetime NOT NULL,
  `eta` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `availability` int(11) NOT NULL,
  `price` text NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule_list`
--

INSERT INTO `schedule_list` (`id`, `bus_id`, `from_location`, `to_location`, `departure_time`, `eta`, `status`, `availability`, `price`, `date_updated`) VALUES
(1, 6, 1, 5, '2024-06-25 15:00:00', '2024-06-25 20:00:00', 1, 25, '50', '2024-01-10 16:46:48'),
(2, 6, 1, 4, '2024-06-25 20:00:00', '2024-06-25 01:00:00', 1, 30, '26', '2024-01-10 03:27:08'),
(3, 1, 3, 9, '2024-06-26 10:00:00', '2024-06-26 16:00:00', 1, 32, '33', '2024-01-10 03:27:08'),
(4, 1, 4, 1, '2024-06-26 08:00:00', '2024-06-26 19:00:00', 1, 30, '65', '2024-01-10 16:46:37'),
(5, 7, 8, 4, '2024-06-27 10:00:00', '2024-06-27 19:00:00', 1, 33, '80', '2024-01-10 16:47:21'),
(6, 4, 7, 6, '2024-06-26 11:00:00', '2024-06-25 13:00:00', 1, 35, '43', '2024-01-10 03:27:08'),
(7, 8, 9, 1, '2024-01-10 09:00:00', '2024-01-11 23:00:00', 1, 34, '75', '2024-01-10 03:27:08'),
(8, 3, 6, 1, '2024-01-18 13:00:00', '2024-01-18 08:37:00', 1, 31, '68', '2024-01-10 03:27:08'),
(9, 4, 3, 1, '2024-01-11 08:36:00', '2024-01-10 14:00:00', 1, 38, '65', '2024-01-10 16:46:42'),
(10, 7, 2, 2, '2024-01-12 21:41:00', '2024-01-10 23:00:00', 1, 50, '100', '2024-01-10 16:46:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(150) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT 1,
  `username` varchar(25) NOT NULL,
  `password` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
(1, 'Huzaifa Jawed', 1, 'huzaifa', '8489d7673bfb7762f95c136492106151', 1, '2024-01-10 22:57:43'),
(2, 'Ahmed Chorahi', 1, 'ahmed', '73e2f77424d3ddeac535c4b14da6ef1e', 1, '2024-01-10 22:56:37'),
(3, 'Talat Hussain', 1, 'talat', 'e27416231c347f217a2664da0944dde7', 1, '2024-01-10 22:58:50'),
(4, 'Malik Huzaifa', 1, 'malik', '8489d7673bfb7762f95c136492106151', 1, '2024-01-10 22:57:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked`
--
ALTER TABLE `booked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booked`
--
ALTER TABLE `booked`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2024 at 06:59 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `obrsphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked`
--

CREATE TABLE `booked` (
  `id` int(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `name` varchar(250) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '1=Paid, 0- Unpaid',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booked`
--

INSERT INTO `booked` (`id`, `schedule_id`, `ref_no`, `name`, `qty`, `status`, `date_updated`) VALUES
(1, 1, '202206248407', 'Ahmed', 2, 1, '2024-01-10 08:25:12'),
(2, 4, '202206252673', 'Talat Hussain', 2, 0, '2024-01-10 08:25:22'),
(3, 2, '202206251496', 'Qasim Ali', 3, 1, '2024-01-10 08:25:30'),
(4, 4, '202206254769', 'Saad Abdullah', 1, 1, '2024-01-10 08:25:42'),
(5, 7, '202206257753', 'AHMED AKHUNZADA', 34, 0, '2024-01-10 08:25:56'),
(6, 5, '20220625746', 'WALI KHAN', 3, 1, '2024-01-10 08:26:07'),
(7, 9, '202206252201', 'MALIK HUZAIFA', 1, 0, '2024-01-10 21:20:46'),
(8, 8, '202401097095', 'Capital Transports', 1, 0, '2024-01-09 19:58:07'),
(9, 1, '2024011075', 'malik_huzaifa', 12, 0, '2024-01-10 08:19:35');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `bus_number` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `name`, `bus_number`, `status`, `date_updated`) VALUES
(1, 'Coaster', 'RWP-203', 1, '2024-01-10 08:26:56'),
(2, 'Coach', 'LHR-97', 1, '2024-01-10 21:21:44'),
(3, 'HIACE', 'ISB-99', 1, '2024-01-10 08:27:26'),
(4, 'Coaster', 'LM-8199', 1, '2024-01-10 08:26:36'),
(5, 'Business Class', 'KHR-997', 1, '2024-01-10 21:21:31'),
(6, 'Bus', 'RWP-980', 1, '2024-01-10 21:21:59'),
(7, 'Red Coach', 'QWE8787', 1, '2024-01-10 21:22:06'),
(8, 'Business Class', 'ISB-0099', 1, '2024-01-10 21:21:14'),
(10, 'DEWOO', 'RWP-877', 1, '2024-01-10 08:29:22');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(30) NOT NULL,
  `terminal_name` text NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0= inactive , 1= active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `terminal_name`, `city`, `state`, `status`, `date_updated`) VALUES
(1, 'Pirwadhi', 'Rawalpindi', 'Punjab', 1, '2024-01-10 22:00:10'),
(2, 'Kohistan Travels', 'Lahore', 'Punjab', 1, '2024-01-10 22:03:32'),
(3, 'Faisal Movers', 'Islamabad', 'Islamabad', 1, '2024-01-10 22:00:33'),
(4, 'Sadar', 'Karachi', 'Sind', 1, '2024-01-10 22:00:38'),
(5, 'Kinat Travels', 'Faislabad', 'Islamabad', 1, '2024-01-10 22:03:39'),
(6, 'Lari Adda', 'Kashmir', 'Kashmir', 1, '2024-01-10 22:01:25'),
(7, 'Faizabad', 'Rawalpindi', 'Punjab', 1, '2024-01-10 22:01:34'),
(8, 'SWAT', 'SWAT', 'Punjab', 1, '2024-01-10 21:36:27'),
(9, 'Peshawar', 'Peshawar', 'Peshawar', 1, '2024-01-10 21:36:18');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_list`
--

CREATE TABLE `schedule_list` (
  `id` int(30) NOT NULL,
  `bus_id` int(30) NOT NULL,
  `from_location` int(30) NOT NULL,
  `to_location` int(30) NOT NULL,
  `departure_time` datetime NOT NULL,
  `eta` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `availability` int(11) NOT NULL,
  `price` text NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule_list`
--

INSERT INTO `schedule_list` (`id`, `bus_id`, `from_location`, `to_location`, `departure_time`, `eta`, `status`, `availability`, `price`, `date_updated`) VALUES
(1, 6, 1, 5, '2024-06-25 15:00:00', '2024-06-25 20:00:00', 1, 25, '50', '2024-01-10 16:46:48'),
(2, 6, 1, 4, '2024-06-25 20:00:00', '2024-06-25 01:00:00', 1, 30, '26', '2024-01-10 03:27:08'),
(3, 1, 3, 9, '2024-06-26 10:00:00', '2024-06-26 16:00:00', 1, 32, '33', '2024-01-10 03:27:08'),
(4, 1, 4, 1, '2024-06-26 08:00:00', '2024-06-26 19:00:00', 1, 30, '65', '2024-01-10 16:46:37'),
(5, 7, 8, 4, '2024-06-27 10:00:00', '2024-06-27 19:00:00', 1, 33, '80', '2024-01-10 16:47:21'),
(6, 4, 7, 6, '2024-06-26 11:00:00', '2024-06-25 13:00:00', 1, 35, '43', '2024-01-10 03:27:08'),
(7, 8, 9, 1, '2024-01-10 09:00:00', '2024-01-11 23:00:00', 1, 34, '75', '2024-01-10 03:27:08'),
(8, 3, 6, 1, '2024-01-18 13:00:00', '2024-01-18 08:37:00', 1, 31, '68', '2024-01-10 03:27:08'),
(9, 4, 3, 1, '2024-01-11 08:36:00', '2024-01-10 14:00:00', 1, 38, '65', '2024-01-10 16:46:42'),
(10, 7, 2, 2, '2024-01-12 21:41:00', '2024-01-10 23:00:00', 1, 50, '100', '2024-01-10 16:46:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(150) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT 1,
  `username` varchar(25) NOT NULL,
  `password` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
(1, 'Huzaifa Jawed', 1, 'huzaifa', '8489d7673bfb7762f95c136492106151', 1, '2024-01-10 22:57:43'),
(2, 'Ahmed Chorahi', 1, 'ahmed', '73e2f77424d3ddeac535c4b14da6ef1e', 1, '2024-01-10 22:56:37'),
(3, 'Talat Hussain', 1, 'talat', 'e27416231c347f217a2664da0944dde7', 1, '2024-01-10 22:58:50'),
(4, 'Malik Huzaifa', 1, 'malik', '8489d7673bfb7762f95c136492106151', 1, '2024-01-10 22:57:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked`
--
ALTER TABLE `booked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booked`
--
ALTER TABLE `booked`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
