-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2022 at 04:08 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` text NOT NULL,
  `mes` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `mes`, `date`) VALUES
(1, 'first_post', 'firstpost@gmail.com', '1234567890', 'First Post', '2022-11-19 22:01:28'),
(2, 'abc', 'abc@123', '123', 'hi123', NULL),
(3, 'abc', 'abc@123', '123', 'hi123', '2022-11-19 23:25:36'),
(4, 'Jeet Singh', 'abc@1234', '7897654352', 'This is an example', '2022-11-19 23:26:05'),
(5, 'Akku Singh', 'Akku@gmail.com', '7876450987', 'This is the mail message.', '2022-11-20 00:38:20'),
(6, 'Akku Singh', 'Akku@gmail.com', '7876450987', 'This is the mail message.', '2022-11-20 00:38:26'),
(7, 'Jeet', 'abc123@123', '7876590982', 'THis is the mail test', '2022-11-20 01:41:41'),
(8, 'Akku', 'akku123@gmail.com', '7878560947', 'This message form APS', '2022-11-26 22:38:34'),
(9, 'Akku', 'akku123@gmail.com', '7878560947', 'This message form APS', '2022-11-26 22:39:51'),
(10, 'Ramesh', 'rmm123@gmail.com', '9876543098', 'This is from Ramesh.', '2022-11-26 22:40:47'),
(11, 'Pradnya', 'pradnya123@gmail.com', '8796789450', 'Hi, This is from Pradnay.', '2022-11-26 22:44:28'),
(12, '', 'abc@gmail.com', '8769809873', 'This is an contact message.', '2022-11-27 18:59:48'),
(13, '', 'abc@gmail.com', '8769809873', 'This is an contact message.', '2022-11-27 19:00:19');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `date`) VALUES
(2, 'This is Second Post', 'Second post', 'second-post', 'This template is from Bootstrap.', '2022-11-27 01:13:51'),
(4, 'Python Tutorial', 'Tagline for python', 'first-slug', 'You will understand python', '2022-11-27 18:28:59'),
(5, 'Let us C', 'Go with c', 'third-post', 'Understand C language. Have a great day.', '2022-11-27 18:35:22'),
(8, 'This is example', 'example tag', 'sixth post', 'This is for example.', '2022-11-27 18:38:23'),
(10, 'hi', 'jkdji', 'jdifj i', 'jkdji j', '2022-11-27 18:44:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
