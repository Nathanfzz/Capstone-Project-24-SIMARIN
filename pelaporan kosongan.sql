-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2025 at 04:26 PM
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
-- Database: `pelaporan`
--

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` int(11) NOT NULL,
  `id_pelapor` int(11) DEFAULT NULL,
  `id_lokasi` int(11) DEFAULT NULL,
  `tanggal_lapor` date DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `foto_bukti` longblob DEFAULT NULL,
  `status_laporan` enum('Menunggu','Ditindak','Selesai') DEFAULT 'Menunggu',
  `jenis_laporan` enum('Pencemaran Laut','Penangkapan Ikan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_penangkapan_ikan`
--

CREATE TABLE `laporan_penangkapan_ikan` (
  `id_laporan_penangkapan_ikan` int(11) NOT NULL,
  `jenis_kapal` varchar(100) DEFAULT NULL,
  `alat_tangkap` varchar(100) DEFAULT NULL,
  `zona_penangkapan` varchar(100) DEFAULT NULL,
  `pelanggaran` varchar(255) DEFAULT NULL,
  `id_laporan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_pencemaran`
--

CREATE TABLE `laporan_pencemaran` (
  `id_laporan_pencemaran` int(11) NOT NULL,
  `sumber_limbah` varchar(100) DEFAULT NULL,
  `jenis_limbah` varchar(100) DEFAULT NULL,
  `tingkat_pencemaran` enum('Ringan','Sedang','Berat') DEFAULT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `id_laporan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lokasi_laut`
--

CREATE TABLE `lokasi_laut` (
  `id_lokasi` int(11) NOT NULL,
  `nama_lokasi` varchar(100) NOT NULL,
  `koordinat` decimal(10,6) DEFAULT NULL,
  `wilayah` varchar(100) DEFAULT NULL,
  `kondisi_terakhir` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` varchar(20) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tindak_lanjut`
--

CREATE TABLE `tindak_lanjut` (
  `id_tindak` int(11) NOT NULL,
  `id_laporan` int(11) DEFAULT NULL,
  `tanggal_tindak` date DEFAULT NULL,
  `hasil_tindak` text DEFAULT NULL,
  `nominal_denda` decimal(12,2) DEFAULT NULL,
  `status_tindakan` enum('Diproses','Selesai','Dibatalkan') DEFAULT 'Diproses'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `peran` enum('Masyarakat','Petugas','Admin') DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `id_pelapor` (`id_pelapor`),
  ADD KEY `id_lokasi` (`id_lokasi`);

--
-- Indexes for table `laporan_penangkapan_ikan`
--
ALTER TABLE `laporan_penangkapan_ikan`
  ADD PRIMARY KEY (`id_laporan_penangkapan_ikan`),
  ADD KEY `fk_penangkapan_laporan` (`id_laporan`);

--
-- Indexes for table `laporan_pencemaran`
--
ALTER TABLE `laporan_pencemaran`
  ADD PRIMARY KEY (`id_laporan_pencemaran`),
  ADD KEY `fk_pencemaran_masyarakat` (`nik`),
  ADD KEY `fk_pencemaran_laporan` (`id_laporan`);

--
-- Indexes for table `lokasi_laut`
--
ALTER TABLE `lokasi_laut`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indexes for table `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`nik`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`),
  ADD KEY `fk_petugas_user` (`id_user`);

--
-- Indexes for table `tindak_lanjut`
--
ALTER TABLE `tindak_lanjut`
  ADD PRIMARY KEY (`id_tindak`),
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `laporan_penangkapan_ikan`
--
ALTER TABLE `laporan_penangkapan_ikan`
  MODIFY `id_laporan_penangkapan_ikan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `laporan_pencemaran`
--
ALTER TABLE `laporan_pencemaran`
  MODIFY `id_laporan_pencemaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `lokasi_laut`
--
ALTER TABLE `lokasi_laut`
  MODIFY `id_lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `tindak_lanjut`
--
ALTER TABLE `tindak_lanjut`
  MODIFY `id_tindak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`id_pelapor`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi_laut` (`id_lokasi`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `laporan_penangkapan_ikan`
--
ALTER TABLE `laporan_penangkapan_ikan`
  ADD CONSTRAINT `fk_penangkapan_laporan` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_penangkapan_ikan_ibfk_1` FOREIGN KEY (`id_laporan_penangkapan_ikan`) REFERENCES `laporan` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_pencemaran`
--
ALTER TABLE `laporan_pencemaran`
  ADD CONSTRAINT `fk_pencemaran_laporan` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pencemaran_masyarakat` FOREIGN KEY (`nik`) REFERENCES `masyarakat` (`nik`),
  ADD CONSTRAINT `laporan_pencemaran_ibfk_1` FOREIGN KEY (`id_laporan_pencemaran`) REFERENCES `laporan` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD CONSTRAINT `masyarakat_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `petugas`
--
ALTER TABLE `petugas`
  ADD CONSTRAINT `fk_petugas_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `petugas_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tindak_lanjut`
--
ALTER TABLE `tindak_lanjut`
  ADD CONSTRAINT `tindak_lanjut_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
