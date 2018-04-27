-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2018 at 11:46 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `superhero_dating_site`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(6) NOT NULL,
  `comment` varchar(60) NOT NULL,
  `commented_on` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `superheroes`
--

CREATE TABLE `superheroes` (
  `email` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `gender` varchar(26) NOT NULL,
  `location` varchar(60) NOT NULL,
  `amount_of_likes` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `superheroes`
--

INSERT INTO `superheroes` (`email`, `name`, `gender`, `location`, `amount_of_likes`) VALUES
('alias_private_investigations@api.com', 'Jessica Jones', 'Female', 'New York City', 33),
('batman@bm.com', 'Bruce Wayne', 'Male', 'Gotham', 56),
('blackwidow@hero.com', 'Natasha Romanoff', 'Female', 'Russia', 34),
('blue_box@timelord.com', 'The Doctor', 'Multiple', 'The Universe', 42),
('deadpool@hero.com', 'Wade Wilson', 'Male', 'Canada', 24),
('harleyquinn@hero.com', 'Dr. Harleen Quinzel', 'Female', 'Arkham Asylum', 14),
('poison_ivy@hero.com', 'Pamela Lillian Isley', 'Female', 'Gotham City', 45),
('proff.x@xinst.com', 'Professor Charles Francis Xavier', 'Male', 'Westchester County, New York', 31),
('wonderwoman@hero.com', 'Diana', 'Woman', 'Paradise island', 37);

-- --------------------------------------------------------

--
-- Table structure for table `superhero_has_superpowers`
--

CREATE TABLE `superhero_has_superpowers` (
  `email` varchar(60) NOT NULL,
  `type` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `superhero_has_superpowers`
--

INSERT INTO `superhero_has_superpowers` (`email`, `type`) VALUES
('alias_private_investigations@api.com', 'Super Healing'),
('batman@bm.com', 'Arrogance'),
('blackwidow@hero.com', 'Arrogance'),
('blue_box@timelord.com', 'Super Healing'),
('deadpool@hero.com', 'Super Healing'),
('harleyquinn@hero.com', 'Mad Scientist'),
('poison_ivy@hero.com', 'Mad Scientist'),
('proff.x@xinst.com', 'Telepath'),
('wonderwoman@hero.com', 'Have awesome super-stuff');

-- --------------------------------------------------------

--
-- Table structure for table `superpowers`
--

CREATE TABLE `superpowers` (
  `type` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `superpowers`
--

INSERT INTO `superpowers` (`type`) VALUES
('Arrogance'),
('Have awesome super-stuff'),
('Mad Scientist'),
('Super Healing'),
('Telepath'),
('Timelord');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `superheroes`
--
ALTER TABLE `superheroes`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `superhero_has_superpowers`
--
ALTER TABLE `superhero_has_superpowers`
  ADD KEY `email` (`email`,`type`);

--
-- Indexes for table `superpowers`
--
ALTER TABLE `superpowers`
  ADD PRIMARY KEY (`type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
