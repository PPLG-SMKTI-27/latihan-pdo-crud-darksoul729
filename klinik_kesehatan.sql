-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 01, 2025 at 04:09 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klinik_kesehatan`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `spesialisasi` varchar(100) NOT NULL,
  `jam_praktik` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama`, `spesialisasi`, `jam_praktik`) VALUES
(1, 'Raka', 'Gigi', '14:40'),
(2, 'Kia', 'Mata', '15:00'),
(3, 'Rasya', 'Jantung', '17:00'),
(4, 'Tiara', 'THT', '16:00'),
(5, 'Kepin', 'Saraf', '13:00'),
(6, 'rakabuming', 'Penyakit Dalam', '10:00');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int NOT NULL,
  `id_dokter` int NOT NULL,
  `hari` varchar(10) NOT NULL,
  `jam_mulai` varchar(10) NOT NULL,
  `jam_selesai` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`) VALUES
(1, 1, 'Rabu', '14:40', '17:00'),
(2, 2, 'Kamis', '15:00', '18:00'),
(3, 3, 'Jumat', '17:00', '20:00'),
(4, 4, 'Senin', '16:00', '19:00'),
(5, 5, 'Selasa', '13:00', '16:00'),
(6, 1, 'Jumat', '16.00', '17.00');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `umur` int NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telepon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama`, `umur`, `alamat`, `telepon`) VALUES
(1, 'Asep', 18, 'JL. Kedondong', '081234082370'),
(2, 'Rabi', 20, 'JL. Kemakmuran', '08237984132'),
(3, 'Tung', 30, 'JL. Mawar', '08283243872'),
(4, 'Hura', 25, 'JL. Gajah', '08237894239'),
(5, 'ropa', 15, 'JL. Mangga', '0812379820'),
(6, 'Ra', 29, 'Jl. Gatsu', '08192838923'),
(7, 'Kolam', 10, 'iosaois', '2894782');

-- --------------------------------------------------------

--
-- Table structure for table `rekam_medis`
--

CREATE TABLE `rekam_medis` (
  `id_rekam` int NOT NULL,
  `id_pasien` int NOT NULL,
  `id_dokter` int NOT NULL,
  `diagnosa` varchar(100) DEFAULT NULL,
  `tgl_periksa` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rekam_medis`
--

INSERT INTO `rekam_medis` (`id_rekam`, `id_pasien`, `id_dokter`, `diagnosa`, `tgl_periksa`) VALUES
(1, 1, 1, 'Gigi Berlubang', '2025-09-29'),
(2, 2, 2, 'Mata Minus', '2025-09-28'),
(3, 3, 3, 'Sakit Jantung', '2025-09-27'),
(4, 4, 4, 'Sakit Tenggorokkan', '2025-09-26'),
(5, 5, 5, 'Saraf Kecepit', '2025-09-25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD PRIMARY KEY (`id_rekam`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD CONSTRAINT `rekam_medis_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `rekam_medis_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
