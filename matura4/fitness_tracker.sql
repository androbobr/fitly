-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2025 at 12:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fitness_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `izvedene_vaje`
--

CREATE TABLE `izvedene_vaje` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vaja_id` int(11) NOT NULL,
  `seti` int(11) NOT NULL,
  `ponovitve` int(11) NOT NULL,
  `kilaza` decimal(5,2) NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `izvedene_vaje`
--

INSERT INTO `izvedene_vaje` (`id`, `user_id`, `vaja_id`, `seti`, `ponovitve`, `kilaza`, `datum`) VALUES
(1, 5, 1, 1, 3, 40.00, '2025-02-17'),
(2, 5, 10, 1, 4, 10.00, '2025-02-17'),
(3, 5, 8, 1, 4, 50.00, '2025-02-17'),
(4, 5, 1, 3, 12, 50.00, '2025-02-17'),
(5, 5, 10, 3, 10, 120.00, '2025-02-18'),
(6, 5, 8, 3, 12, 120.00, '2025-03-07'),
(7, 5, 15, 3, 8, 70.00, '2025-03-20'),
(8, 5, 8, 3, 12, 120.00, '2025-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `teza`
--

CREATE TABLE `teza` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `teza` decimal(5,2) NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teza`
--

INSERT INTO `teza` (`id`, `user_id`, `teza`, `datum`) VALUES
(14, 5, 74.00, '2025-03-07'),
(15, 5, 78.00, '2025-03-08'),
(16, 5, 79.00, '2025-03-20'),
(17, 5, 80.00, '2025-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `uporabniki`
--

CREATE TABLE `uporabniki` (
  `id` int(11) NOT NULL,
  `uporabnisko_ime` varchar(50) NOT NULL,
  `geslo` varchar(255) NOT NULL,
  `e_posta` varchar(100) NOT NULL,
  `avatar` varchar(255) DEFAULT 'default.jpg',
  `ime` varchar(50) DEFAULT NULL,
  `starost` int(11) DEFAULT NULL,
  `visina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uporabniki`
--

INSERT INTO `uporabniki` (`id`, `uporabnisko_ime`, `geslo`, `e_posta`, `avatar`, `ime`, `starost`, `visina`) VALUES
(5, 'AndražBele', '$2y$10$u8sxWU.9IhHILOi9ER5IKOtxxiVZWMBTtQoCTib7pGCItlKvGxPSm', 'ibeleandri1@gmail.com', 'uploads/fabisiak.jpg', 'Andraž Bele', 18, 174);

-- --------------------------------------------------------

--
-- Table structure for table `vaje`
--

CREATE TABLE `vaje` (
  `id` int(11) NOT NULL,
  `ime` varchar(100) NOT NULL,
  `slika` varchar(255) NOT NULL,
  `opis` text DEFAULT NULL,
  `kategorija` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vaje`
--

INSERT INTO `vaje` (`id`, `ime`, `slika`, `opis`, `kategorija`) VALUES
(1, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', ''),
(2, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', ''),
(3, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', ''),
(4, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', ''),
(5, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', ''),
(6, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', ''),
(7, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', ''),
(8, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', ''),
(9, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', ''),
(10, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', ''),
(11, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', ''),
(12, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', ''),
(13, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', ''),
(14, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', ''),
(15, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', ''),
(16, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', ''),
(17, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', ''),
(18, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', ''),
(19, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', ''),
(20, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', ''),
(21, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', ''),
(22, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', ''),
(23, 'Push-ups', 'images/pushup.jpg', 'Klasična vaja za prsa in triceps.', ''),
(24, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', ''),
(25, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', ''),
(26, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', ''),
(27, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', ''),
(28, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', ''),
(29, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', ''),
(30, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', ''),
(31, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', ''),
(32, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', ''),
(33, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', ''),
(34, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', ''),
(35, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', ''),
(36, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', ''),
(37, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', ''),
(38, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', ''),
(39, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', ''),
(40, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', ''),
(41, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', ''),
(42, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', ''),
(43, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', ''),
(44, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', ''),
(45, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', ''),
(46, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', ''),
(47, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', ''),
(48, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', ''),
(49, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', ''),
(50, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', ''),
(51, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', ''),
(52, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', ''),
(53, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', ''),
(54, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', ''),
(55, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', ''),
(56, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', ''),
(57, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', ''),
(58, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', ''),
(59, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', ''),
(60, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', ''),
(61, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', ''),
(62, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', ''),
(63, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', ''),
(64, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', ''),
(65, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', ''),
(66, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', ''),
(67, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', ''),
(68, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', ''),
(69, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', ''),
(70, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', ''),
(71, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', ''),
(72, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', ''),
(73, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', ''),
(74, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', ''),
(75, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', ''),
(76, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', ''),
(77, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', ''),
(78, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', ''),
(79, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', ''),
(80, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', ''),
(81, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', ''),
(82, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', ''),
(83, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', ''),
(84, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', ''),
(85, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', ''),
(86, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(87, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(88, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(89, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(90, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(91, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(92, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(93, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(94, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(95, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(96, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(97, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(98, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(99, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(100, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(101, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(102, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(103, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(104, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(105, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(106, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(107, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(108, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(109, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(110, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(111, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(112, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(113, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(114, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(115, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(116, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(117, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(118, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(119, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(120, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(121, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(122, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(123, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(124, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(125, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(126, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(127, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(128, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(129, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(130, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(131, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(132, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(133, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(134, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(135, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(136, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(137, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(138, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(139, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(140, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(141, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(142, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(143, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(144, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(145, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(146, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(147, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(148, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(149, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(150, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(151, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(152, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(153, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(154, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(155, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(156, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(157, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(158, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(159, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(160, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(161, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(162, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(163, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(164, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(165, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(166, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(167, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(168, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(169, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(170, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(171, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(172, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(173, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(174, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(175, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(176, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(177, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(178, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(179, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(180, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(181, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(182, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(183, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(184, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(185, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(186, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(187, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(188, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(189, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(190, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(191, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(192, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(193, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(194, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(195, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(196, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(197, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(198, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(199, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(200, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(201, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(202, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(203, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(204, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(205, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(206, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(207, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(208, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(209, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(210, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(211, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(212, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(213, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(214, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(215, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(216, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(217, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(218, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(219, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(220, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(221, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(222, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(223, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(224, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(225, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(226, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(227, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(228, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(229, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(230, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(231, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(232, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(233, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(234, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(235, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(236, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(237, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(238, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(239, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(240, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(241, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(242, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(243, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(244, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(245, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(246, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(247, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(248, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(249, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(250, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(251, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(252, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(253, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(254, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(255, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(256, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(257, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(258, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(259, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(260, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(261, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(262, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(263, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(264, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(265, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(266, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(267, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(268, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(269, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(270, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(271, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(272, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(273, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(274, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(275, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(276, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(277, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(278, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(279, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(280, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(281, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(282, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(283, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(284, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(285, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(286, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(287, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(288, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(289, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(290, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(291, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(292, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(293, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(294, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(295, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(296, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(297, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(298, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(299, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(300, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(301, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(302, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(303, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(304, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(305, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(306, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(307, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(308, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(309, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(310, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(311, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(312, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(313, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(314, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(315, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(316, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(317, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(318, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(319, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(320, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(321, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(322, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(323, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(324, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(325, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(326, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(327, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(328, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(329, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(330, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(331, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(332, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(333, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(334, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(335, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(336, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(337, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(338, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(339, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(340, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet'),
(341, 'Bench Press', 'images/bench_press.jpg', 'Osnovna vaja za prsa.', 'Prsa'),
(342, 'Incline Bench Press', 'images/incline_bench.jpg', 'Nagibna klop za zgornji del prsi.', 'Prsa'),
(343, 'Dips', 'images/dips.jpg', 'Vadba za spodnji del prsi in triceps.', 'Prsa'),
(344, 'Dumbbell Flyes', 'images/dumbbell_flyes.jpg', 'Izolacija prsi s hantli.', 'Prsa'),
(345, 'Cable Crossovers', 'images/cable_crossovers.jpg', 'Izolacija prsi s kabli.', 'Prsa'),
(346, 'Push-ups', 'images/pushups.jpg', 'Klasična vaja za prsa in triceps.', 'Prsa'),
(347, 'Squats', 'images/squats.jpg', 'Osnovna vaja za noge.', 'Noge'),
(348, 'Leg Press', 'images/leg_press.jpg', 'Pritiski nog na napravi.', 'Noge'),
(349, 'Lunges', 'images/lunges.jpg', 'Izmenični koraki naprej.', 'Noge'),
(350, 'Leg Curls', 'images/leg_curls.jpg', 'Upogib kolen za zadnje stegenske mišice.', 'Noge'),
(351, 'Calf Raises', 'images/calf_raises.jpg', 'Dvigi na prste za meča.', 'Noge'),
(352, 'Deadlifts', 'images/deadlifts.jpg', 'Osnovna vaja za hrbet in noge.', 'Hrbet'),
(353, 'Pull-ups', 'images/pullups.jpg', 'Vlečenja za zgornji del hrbta.', 'Hrbet'),
(354, 'Barbell Rows', 'images/barbell_rows.jpg', 'Veslanje s palico.', 'Hrbet'),
(355, 'Lat Pulldown', 'images/lat_pulldown.jpg', 'Vleka zgornjega lat stroja.', 'Hrbet'),
(356, 'Face Pulls', 'images/face_pulls.jpg', 'Vadba za zadnje rame in zgornji hrbet.', 'Hrbet'),
(357, 'T-bar Row', 'images/tbar_row.jpg', 'Veslanje s T-barjem.', 'Hrbet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `izvedene_vaje`
--
ALTER TABLE `izvedene_vaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vaja_id` (`vaja_id`);

--
-- Indexes for table `teza`
--
ALTER TABLE `teza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `uporabniki`
--
ALTER TABLE `uporabniki`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uporabnisko_ime` (`uporabnisko_ime`),
  ADD UNIQUE KEY `e_posta` (`e_posta`);

--
-- Indexes for table `vaje`
--
ALTER TABLE `vaje`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `izvedene_vaje`
--
ALTER TABLE `izvedene_vaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `teza`
--
ALTER TABLE `teza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `uporabniki`
--
ALTER TABLE `uporabniki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vaje`
--
ALTER TABLE `vaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `izvedene_vaje`
--
ALTER TABLE `izvedene_vaje`
  ADD CONSTRAINT `izvedene_vaje_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `uporabniki` (`id`),
  ADD CONSTRAINT `izvedene_vaje_ibfk_2` FOREIGN KEY (`vaja_id`) REFERENCES `vaje` (`id`);

--
-- Constraints for table `teza`
--
ALTER TABLE `teza`
  ADD CONSTRAINT `teza_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `uporabniki` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
