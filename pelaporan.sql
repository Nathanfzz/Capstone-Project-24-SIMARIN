-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2025 at 11:49 AM
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

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id_laporan`, `id_pelapor`, `id_lokasi`, `tanggal_lapor`, `deskripsi`, `foto_bukti`, `status_laporan`, `jenis_laporan`) VALUES
(1, 1, 1, '2025-01-12', 'Air laut berubah warna kecoklatan di sekitar pelabuhan.', NULL, 'Menunggu', ''),
(2, 2, 2, '2025-02-10', 'Ada tumpahan minyak di area laut.', NULL, 'Ditindak', ''),
(3, 3, 3, '2025-02-18', 'Banyak sampah plastik mengapung di permukaan laut.', NULL, 'Selesai', ''),
(4, 4, 4, '2025-03-04', 'Tercium bau bahan kimia di pantai.', NULL, 'Menunggu', ''),
(5, 5, 5, '2025-03-10', 'Ada limbah cair dari kapal industri.', NULL, 'Ditindak', ''),
(6, 6, 6, '2025-03-15', 'Air laut tampak berminyak di permukaan.', NULL, 'Menunggu', ''),
(7, 7, 7, '2025-04-02', 'Banyak ikan mati di pesisir.', NULL, 'Selesai', ''),
(8, 8, 8, '2025-04-07', 'Laut tampak berbusa akibat limbah deterjen.', NULL, 'Menunggu', ''),
(9, 9, 9, '2025-04-14', 'Ada limbah padat di sekitar muara.', NULL, 'Ditindak', ''),
(10, 10, 10, '2025-04-25', 'Terlihat kapal membuang limbah langsung ke laut.', NULL, 'Selesai', ''),
(11, 11, 1, '2025-05-01', 'Ada lumpur pekat di teluk.', NULL, 'Menunggu', ''),
(12, 12, 2, '2025-05-08', 'Bau busuk di area laut terbuka.', NULL, 'Selesai', ''),
(13, 13, 3, '2025-05-16', 'Busa tebal muncul di permukaan air.', NULL, 'Menunggu', ''),
(14, 14, 4, '2025-06-03', 'Banyak ikan mati mendadak.', NULL, 'Ditindak', ''),
(15, 15, 5, '2025-06-10', 'Ada tumpahan bahan bakar kapal.', NULL, 'Selesai', ''),
(16, 16, 6, '2025-06-18', 'Air berwarna kehitaman setelah hujan.', NULL, 'Menunggu', ''),
(17, 17, 7, '2025-06-25', 'Ada busa putih di perairan.', NULL, 'Menunggu', ''),
(18, 18, 8, '2025-07-05', 'Sampah industri terlihat di laut.', NULL, 'Ditindak', ''),
(19, 19, 9, '2025-07-10', 'Laut berubah warna kehijauan.', NULL, 'Menunggu', ''),
(20, 20, 10, '2025-07-18', 'Air laut terkontaminasi oli kapal.', NULL, 'Selesai', ''),
(21, 1, 1, '2025-01-20', 'Kapal nelayan tanpa izin terlihat menangkap ikan.', NULL, 'Ditindak', 'Penangkapan Ikan'),
(22, 2, 2, '2025-01-28', 'Penangkapan ikan dengan jaring trawl.', NULL, 'Menunggu', 'Penangkapan Ikan'),
(23, 3, 3, '2025-02-02', 'Kapal melanggar batas zona tangkap.', NULL, 'Selesai', 'Penangkapan Ikan'),
(24, 4, 4, '2025-02-12', 'Nelayan asing menangkap ikan di wilayah lokal.', NULL, 'Menunggu', 'Penangkapan Ikan'),
(25, 5, 5, '2025-03-01', 'Ada kapal tidak memiliki izin operasional.', NULL, 'Ditindak', 'Penangkapan Ikan'),
(26, 6, 6, '2025-03-08', 'Penangkapan menggunakan bahan peledak.', NULL, 'Selesai', 'Penangkapan Ikan'),
(27, 7, 7, '2025-03-20', 'Nelayan memakai alat tangkap tidak ramah lingkungan.', NULL, 'Menunggu', 'Penangkapan Ikan'),
(28, 8, 8, '2025-03-30', 'Kapal menggunakan pukat harimau.', NULL, 'Ditindak', 'Penangkapan Ikan'),
(29, 9, 9, '2025-04-10', 'Penangkapan di zona larangan.', NULL, 'Menunggu', 'Penangkapan Ikan'),
(30, 10, 10, '2025-04-18', 'Kapal menggunakan sonar ilegal.', NULL, 'Selesai', 'Penangkapan Ikan'),
(31, 11, 1, '2025-05-04', 'Nelayan memakai bahan beracun.', NULL, 'Ditindak', 'Penangkapan Ikan'),
(32, 12, 2, '2025-05-14', 'Kapal berbendera asing beroperasi di wilayah lokal.', NULL, 'Selesai', 'Penangkapan Ikan'),
(33, 13, 3, '2025-05-23', 'Nelayan tanpa dokumen.', NULL, 'Menunggu', 'Penangkapan Ikan'),
(34, 14, 4, '2025-06-02', 'Ada pelanggaran zona tangkap di perairan dangkal.', NULL, 'Selesai', 'Penangkapan Ikan'),
(35, 15, 5, '2025-06-12', 'Kapal beroperasi di malam hari tanpa izin.', NULL, 'Ditindak', 'Penangkapan Ikan'),
(36, 16, 6, '2025-06-20', 'Penangkapan ikan di area konservasi.', NULL, 'Menunggu', 'Penangkapan Ikan'),
(37, 17, 7, '2025-06-29', 'Penggunaan jaring kecil yang dilarang.', NULL, 'Selesai', 'Penangkapan Ikan'),
(38, 18, 8, '2025-07-08', 'Kapal menggunakan alat tangkap modern tanpa izin.', NULL, 'Menunggu', 'Penangkapan Ikan'),
(39, 19, 9, '2025-07-15', 'Nelayan menggunakan pukat dasar.', NULL, 'Ditindak', 'Penangkapan Ikan'),
(40, 20, 10, '2025-07-20', 'Penangkapan di perbatasan wilayah negara.', NULL, 'Selesai', 'Penangkapan Ikan'),
(41, 41, NULL, '2025-11-01', 'kotor', NULL, 'Menunggu', 'Pencemaran Laut'),
(42, 41, NULL, '2025-11-01', 'kotor', NULL, 'Menunggu', 'Pencemaran Laut'),
(43, 41, NULL, '2025-11-01', '1', NULL, 'Menunggu', 'Pencemaran Laut'),
(44, 41, NULL, '2025-11-01', '1', NULL, 'Menunggu', 'Pencemaran Laut'),
(45, 41, NULL, '2025-11-01', 'kotor parah', NULL, 'Menunggu', 'Pencemaran Laut'),
(46, 41, 42, '2025-11-02', 'a', '', 'Menunggu', 'Pencemaran Laut'),
(48, 41, 44, '2025-11-02', 'bb', '', 'Menunggu', 'Penangkapan Ikan');

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

--
-- Dumping data for table `laporan_penangkapan_ikan`
--

INSERT INTO `laporan_penangkapan_ikan` (`id_laporan_penangkapan_ikan`, `jenis_kapal`, `alat_tangkap`, `zona_penangkapan`, `pelanggaran`, `id_laporan`) VALUES
(21, 'Kapal Fiber', 'Jaring Insang', 'Zona B', 'Tidak memiliki izin tangkap', NULL),
(22, 'Perahu Kayu', 'Pukat Harimau', 'Zona C', 'Alat tangkap terlarang', NULL),
(23, 'Kapal Baja', 'Pancing Ulur', 'Zona A', 'Melewati batas zona', NULL),
(24, 'Kapal Asing', 'Trawl', 'Zona D', 'Masuk wilayah Indonesia', NULL),
(25, 'Perahu Motor', 'Rawai', 'Zona B', 'Tidak berizin', NULL),
(26, 'Kapal Baja', 'Peledak', 'Zona C', 'Menggunakan bahan peledak', NULL),
(27, 'Kapal Nelayan', 'Jaring Tarik', 'Zona A', 'Menangkap ikan di luar waktu yang diizinkan', NULL),
(28, 'Perahu Kayu', 'Pukat Cincin', 'Zona B', 'Tidak melapor hasil tangkapan', NULL),
(29, 'Kapal Fiber', 'Jaring Apung', 'Zona C', 'Menangkap ikan di wilayah konservasi', NULL),
(30, 'Kapal Motor', 'Rawai Dasar', 'Zona D', 'Menggunakan kapal di atas tonase yang diizinkan', NULL),
(31, 'Perahu Motor', 'Pancing Tangan', 'Zona A', 'Menangkap ikan pada musim pemijahan', NULL),
(32, 'Kapal Baja', 'Pukat Tarik', 'Zona B', 'Menangkap ikan di luar izin wilayah', NULL),
(33, 'Perahu Kayu', 'Bubu', 'Zona C', 'Tidak melapor hasil tangkapan', NULL),
(34, 'Kapal Fiber', 'Rawai', 'Zona D', 'Menangkap ikan di kawasan terlarang', NULL),
(35, 'Kapal Nelayan', 'Pukat Cincin', 'Zona A', 'Menggunakan alat tangkap ilegal', NULL),
(36, 'Perahu Motor', 'Jaring Insang', 'Zona B', 'Tidak memiliki izin operasional', NULL),
(37, 'Kapal Asing', 'Trawl', 'Zona D', 'Melanggar batas teritorial Indonesia', NULL),
(38, 'Kapal Baja', 'Pancing Ulur', 'Zona C', 'Menangkap spesies dilindungi', NULL),
(39, 'Perahu Kayu', 'Pukat Harimau', 'Zona B', 'Menggunakan alat tangkap merusak habitat', NULL),
(40, 'Kapal Fiber', 'Rawai Dasar', 'Zona A', 'Menangkap ikan di zona larangan penangkapan', NULL);

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

--
-- Dumping data for table `laporan_pencemaran`
--

INSERT INTO `laporan_pencemaran` (`id_laporan_pencemaran`, `sumber_limbah`, `jenis_limbah`, `tingkat_pencemaran`, `nik`, `id_laporan`) VALUES
(1, 'Kapal Industri', 'Minyak', 'Sedang', NULL, NULL),
(2, 'Pabrik Kimia', 'Bahan Kimia', 'Berat', NULL, NULL),
(3, 'Pabrik Kimia PT Laut Bersih', 'Plastik', 'Berat', NULL, NULL),
(4, 'Industri Tekstil', 'Cair', 'Sedang', NULL, NULL),
(5, 'Kapal', 'Oli', 'Berat', NULL, NULL),
(6, 'Pabrik Makanan', 'Organik', 'Ringan', NULL, NULL),
(7, 'Kapal Tanker', 'Minyak', 'Berat', NULL, NULL),
(8, 'Rumah Tangga', 'Deterjen', 'Ringan', NULL, NULL),
(9, 'Perusahaan Tambang', 'Limbah Padat', 'Sedang', NULL, NULL),
(10, 'Kapal Cargo', 'Bahan Bakar', 'Berat', NULL, NULL),
(11, 'Pabrik Logam', 'Kimia', 'Sedang', NULL, NULL),
(12, 'Industri Makanan', 'Organik', 'Ringan', NULL, NULL),
(13, 'Pabrik Pupuk', 'Kimia', 'Sedang', NULL, NULL),
(14, 'Kapal Penangkap', 'Minyak', 'Berat', NULL, NULL),
(15, 'Kapal Tanker', 'Bahan Bakar', 'Sedang', NULL, NULL),
(16, 'Pabrik Tekstil', 'Cair', 'Sedang', NULL, NULL),
(17, 'Pabrik Sabun', 'Deterjen', 'Ringan', NULL, NULL),
(18, 'Kapal Dagang', 'Minyak', 'Sedang', NULL, NULL),
(19, 'Perusahaan Limbah', 'Kimia', 'Berat', NULL, NULL),
(20, 'Kapal Barang', 'Oli', 'Sedang', NULL, NULL),
(41, 'minyak', 'minyak', 'Berat', NULL, NULL),
(42, 'kapal tumpah', 'minyak', 'Berat', '2409116074', 45),
(43, 'dari kapal pertambangan', 'minyak', 'Berat', NULL, 46),
(44, 'a', 'a', 'Berat', NULL, 48);

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

--
-- Dumping data for table `lokasi_laut`
--

INSERT INTO `lokasi_laut` (`id_lokasi`, `nama_lokasi`, `koordinat`, `wilayah`, `kondisi_terakhir`) VALUES
(1, 'Pantai Kemala', -1.276500, 'Balikpapan Selatan', 'Air jernih, ombak tenang, banyak wisatawan'),
(2, 'Pantai Manggar Segarasari', -1.188900, 'Balikpapan Timur', 'Sedikit sampah di bibir pantai'),
(3, 'Pantai Lamaru', -1.157200, 'Balikpapan Timur', 'Kondisi bersih, digunakan untuk rekreasi'),
(4, 'Pantai Monpera', -1.277600, 'Balikpapan Kota', 'Air agak keruh setelah hujan'),
(5, 'Teluk Balikpapan', -1.305000, 'Balikpapan Barat', 'Kawasan industri, air berminyak ringan'),
(6, 'Pantai Melawai', -1.267800, 'Balikpapan Kota', 'Bersih, ramai di sore hari'),
(7, 'Pelabuhan Semayang', -1.269400, 'Balikpapan Barat', 'Perairan padat kapal, sedikit tumpahan minyak'),
(8, 'Pantai Banua Patra', -1.268900, 'Balikpapan Selatan', 'Air tenang, beberapa karang rusak'),
(9, 'Pantai Batu-Batu', -1.191700, 'Balikpapan Timur', 'Bersih, jarang pengunjung'),
(10, 'Pantai Klandasan', -1.273200, 'Balikpapan Kota', 'Bersih, ombak sedang'),
(11, 'Pantai Mangrove Center', -1.195000, 'Balikpapan Timur', 'Air payau, kawasan konservasi mangrove'),
(12, 'Teluk Waru', -1.330000, 'Balikpapan Selatan', 'Sedikit keruh, aktivitas nelayan aktif'),
(13, 'Pantai Sepinggan', -1.270200, 'Balikpapan Selatan', 'Sedikit sampah plastik di pesisir'),
(14, 'Pantai Sumber Rejo', -1.310500, 'Balikpapan Tengah', 'Air bersih, area nelayan tradisional'),
(15, 'Pantai Teritip', -1.145600, 'Balikpapan Timur', 'Air jernih, kondisi alami'),
(16, 'Pantai Stal Kuda', -1.265000, 'Balikpapan Kota', 'Kawasan publik, ombak sedang'),
(17, 'Pantai Baru Balikpapan', -1.258000, 'Balikpapan Kota', 'Kondisi baik, beberapa perahu tambat'),
(18, 'Pulau Tukung', -1.310000, 'Teluk Balikpapan', 'Pulau kecil, air jernih'),
(19, 'Pulau Balang', -1.250000, 'Teluk Balikpapan', 'Air agak keruh, dekat proyek jembatan'),
(20, 'Pantai Nirmala', -1.283200, 'Balikpapan Selatan', 'Air jernih, area wisata keluarga'),
(21, 'Pantai Indah Permai', -1.150900, 'Balikpapan Timur', 'Pantai alami, belum banyak dikunjungi'),
(22, 'Teluk Dalam', -1.337500, 'Balikpapan Selatan', 'Kawasan tambak dan nelayan'),
(23, 'Pantai Karang Jati', -1.211000, 'Balikpapan Timur', 'Air jernih, ombak kecil'),
(24, 'Pantai Asri Lamaru', -1.155800, 'Balikpapan Timur', 'Air tenang, pasir putih halus'),
(25, 'Pantai Wain', -1.200000, 'Balikpapan Timur', 'Dekat hutan lindung, air payau'),
(26, 'Pantai Handil Baru', -1.100000, 'Balikpapan Timur', 'Bersih, banyak kegiatan nelayan'),
(27, 'Pantai Tanjung Batu', -1.145000, 'Balikpapan Timur', 'Bersih, air biru kehijauan'),
(28, 'Pantai Nipah-Nipah', -1.272000, 'Balikpapan Kota', 'Bersih, ombak kecil'),
(29, 'Pantai Pandansari', -1.288000, 'Balikpapan Selatan', 'Bersih, pasir hitam halus'),
(30, 'Pantai Anggana', -1.220000, 'Balikpapan Timur', 'Air sedikit keruh, ombak kecil'),
(31, 'Pantai Benua Baru', -1.340000, 'Balikpapan Selatan', 'Kawasan nelayan, sedikit limbah rumah tangga'),
(32, 'Pantai Cermin', -1.281000, 'Balikpapan Selatan', 'Ombak sedang, air jernih'),
(33, 'Pantai Batu Hitam', -1.294500, 'Balikpapan Barat', 'Tebing berbatu, air jernih'),
(34, 'Pantai Maridan', -1.127000, 'Balikpapan Timur', 'Pantai alami, ombak besar'),
(35, 'Pantai BSB', -1.255000, 'Balikpapan Kota', 'Pantai dekat kompleks perumahan, air bersih'),
(36, 'Pantai Hutan Manggar', -1.190000, 'Balikpapan Timur', 'Air payau, kawasan mangrove padat'),
(37, 'Pantai Samboja Kecil', -1.365000, 'Balikpapan Selatan', 'Air jernih, perbatasan Kutai Kartanegara'),
(38, 'Pantai Margo Mulyo', -1.310000, 'Balikpapan Barat', 'Kawasan industri, air agak keruh'),
(39, 'Pantai Prapatan', -1.268000, 'Balikpapan Kota', 'Air bersih, dekat pusat kota'),
(40, 'Pantai Manggis', -1.173000, 'Balikpapan Timur', 'Kawasan alami, sedikit sampah'),
(41, 'laut kumala', 1.111100, 'balikpapan', 'kotor'),
(42, 'laut kumala', 117.111110, 'balikpapan barat', 'kotor'),
(43, 'laut', 11.100000, 'k', '12'),
(44, 'a', 11.110000, 'a', 'aa');

-- --------------------------------------------------------

--
-- Table structure for table `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` varchar(20) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `id_user`, `email`) VALUES
('2409116074', 41, 'Dani@gmail.com'),
('6401010100010001', 1, 'rina@mail.com'),
('6401010100010002', 2, 'dedi@mail.com'),
('6401010100010003', 3, 'agus@mail.com'),
('6401010100010004', 4, 'siti@mail.com'),
('6401010100010005', 5, 'budi@mail.com'),
('6401010100010006', 6, 'dewi@mail.com'),
('6401010100010007', 7, 'rizal@mail.com'),
('6401010100010008', 8, 'winda@mail.com'),
('6401010100010009', 9, 'ahmad@mail.com'),
('6401010100010010', 10, 'yulia@mail.com'),
('6401010100010011', 11, 'nurr@mail.com'),
('6401010100010012', 12, 'hendra@mail.com'),
('6401010100010013', 13, 'lina@mail.com'),
('6401010100010014', 14, 'andi@mail.com'),
('6401010100010015', 15, 'desi@mail.com'),
('6401010100010016', 16, 'eko@mail.com'),
('6401010100010017', 17, 'ratna@mail.com'),
('6401010100010018', 18, 'teguh@mail.com'),
('6401010100010019', 19, 'mira@mail.com'),
('6401010100010020', 20, 'yoga@mail.com'),
('6401010100010021', 21, 'lala@mail.com'),
('6401010100010022', 22, 'zara@mail.com'),
('6401010100010023', 23, 'seki@mail.com'),
('6401010100010024', 24, 'adell@mail.com'),
('6401010100010025', 25, 'nur@mail.com'),
('6401010100010026', 26, 'putri@mail.com'),
('6401010100010027', 27, 'anis@mail.com'),
('6401010100010028', 28, 'inoy@mail.com'),
('6401010100010029', 29, 'camel@mail.com'),
('6401010100010030', 30, 'jen@mail.com'),
('NIK1762068697622', 42, 'b'),
('NIK1762068807661', 43, 'g');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `jabatan`, `id_user`) VALUES
(31, 'Koordinator Lapangan', NULL),
(32, 'Analis Lingkungan', NULL),
(33, 'Penyidik PSDKP', NULL),
(34, 'Pengawas Laut', NULL),
(35, 'Teknisi Data', NULL),
(36, 'Staf Administrasi', NULL),
(37, 'Kepala Seksi Operasional', NULL),
(38, 'Petugas Verifikasi', NULL),
(39, 'Ahli Kelautan', NULL),
(40, 'Supervisor Lapangan', NULL);

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

--
-- Dumping data for table `tindak_lanjut`
--

INSERT INTO `tindak_lanjut` (`id_tindak`, `id_laporan`, `tanggal_tindak`, `hasil_tindak`, `nominal_denda`, `status_tindakan`) VALUES
(1, 1, '2025-01-03', 'Dilakukan verifikasi awal, ditemukan tumpahan minyak ringan.', 500000.00, 'Selesai'),
(2, 2, '2025-01-05', 'Patroli menemukan limbah plastik di pesisir.', 250000.00, 'Diproses'),
(3, 3, '2025-01-08', 'Ditemukan kapal tanpa izin penangkapan.', 1500000.00, 'Selesai'),
(4, 4, '2025-01-10', 'Kapal nelayan diminta melengkapi dokumen izin tangkap.', 0.00, 'Selesai'),
(5, 5, '2025-01-12', 'Tumpahan minyak terdeteksi dekat pelabuhan, dilakukan pembersihan.', 750000.00, 'Selesai'),
(6, 6, '2025-01-14', 'Ditemukan penggunaan alat tangkap trawl.', 2000000.00, 'Selesai'),
(7, 7, '2025-01-15', 'Peringatan diberikan kepada masyarakat sekitar lokasi limbah.', 0.00, 'Selesai'),
(8, 8, '2025-01-18', 'Pembersihan area pesisir dilakukan oleh petugas.', 300000.00, 'Selesai'),
(9, 9, '2025-01-20', 'Investigasi menemukan limbah berasal dari kapal tanker.', 1000000.00, 'Selesai'),
(10, 10, '2025-01-21', 'Pelanggaran izin penangkapan sedang diproses hukum.', 500000.00, 'Diproses'),
(11, 11, '2025-01-23', 'Limbah rumah tangga tinggi, dilakukan sosialisasi.', 0.00, 'Selesai'),
(12, 12, '2025-01-24', 'Kapal asing ditahan untuk pemeriksaan izin.', 2500000.00, 'Selesai'),
(13, 13, '2025-01-25', 'Tidak ditemukan pencemaran tambahan di lokasi A.', 0.00, 'Selesai'),
(14, 14, '2025-01-26', 'Dilakukan pengawasan ulang terhadap kapal nelayan lokal.', 150000.00, 'Diproses'),
(15, 15, '2025-01-27', 'Pelaku pencemaran diberikan teguran tertulis.', 500000.00, 'Selesai'),
(16, 16, '2025-01-28', 'Ditemukan limbah logam berat, ditindak sesuai SOP.', 1250000.00, 'Selesai'),
(17, 17, '2025-01-29', 'Patroli tambahan dijadwalkan minggu depan.', 0.00, 'Diproses'),
(18, 18, '2025-01-30', 'Kapal penangkap ikan ilegal diamankan.', 3000000.00, 'Selesai'),
(19, 19, '2025-02-01', 'Pelaku overfishing membayar denda administratif.', 2000000.00, 'Selesai'),
(20, 20, '2025-02-02', 'Lokasi pencemaran telah bersih, status ditutup.', 0.00, 'Selesai'),
(21, 21, '2025-02-04', 'Investigasi awal terhadap tumpahan minyak dilakukan.', 0.00, 'Diproses'),
(22, 22, '2025-02-05', 'Pelaku belum ditemukan, kasus masih berjalan.', 0.00, 'Diproses'),
(23, 23, '2025-02-06', 'Kapal nelayan kembali diizinkan beroperasi.', 0.00, 'Selesai'),
(24, 24, '2025-02-07', 'Petugas menemukan tumpahan bahan kimia di perairan.', 800000.00, 'Selesai'),
(25, 25, '2025-02-09', 'Sosialisasi praktik ramah lingkungan dilakukan.', 0.00, 'Selesai'),
(26, 26, '2025-02-10', 'Pelanggaran alat tangkap ditindak, alat disita.', 1800000.00, 'Selesai'),
(27, 27, '2025-02-11', 'Ditemukan kapal melewati zona terlarang.', 1000000.00, 'Selesai'),
(28, 28, '2025-02-12', 'Dilakukan pembersihan lanjutan di lokasi Zona C.', 600000.00, 'Diproses'),
(29, 29, '2025-02-13', 'Limbah padat berhasil dikumpulkan dan diamankan.', 400000.00, 'Selesai'),
(30, 30, '2025-02-14', 'Petugas memastikan area aman dari tumpahan baru.', 0.00, 'Selesai'),
(31, 31, '2025-02-15', 'Ditemukan aktivitas tanpa izin di zona A.', 900000.00, 'Diproses'),
(32, 32, '2025-02-16', 'Patroli gabungan dilakukan di wilayah timur laut.', 0.00, 'Selesai'),
(33, 33, '2025-02-17', 'Pelanggaran kapal asing dilaporkan ke otoritas pusat.', 2500000.00, 'Selesai'),
(34, 34, '2025-02-18', 'Kapal melakukan pelanggaran ulang, ditahan.', 1500000.00, 'Selesai'),
(35, 35, '2025-02-19', 'Limbah domestik meningkat, dilakukan edukasi masyarakat.', 0.00, 'Diproses'),
(36, 36, '2025-02-20', 'Perusahaan pelaku pencemaran membayar denda.', 3500000.00, 'Selesai'),
(37, 37, '2025-02-21', 'Pemeriksaan lanjutan dilakukan terhadap kapal niaga.', 0.00, 'Diproses'),
(38, 38, '2025-02-22', 'Kasus overfishing telah selesai diproses.', 2200000.00, 'Selesai'),
(39, 39, '2025-02-23', 'Tidak ditemukan pelanggaran baru di zona C.', 0.00, 'Selesai'),
(40, 40, '2025-02-24', 'Kasus dibatalkan karena laporan tidak valid.', 0.00, 'Dibatalkan');

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
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `password`, `peran`, `no_hp`) VALUES
(1, 'Rina Andayani', '1231', 'Masyarakat', '081234567801'),
(2, 'Dedi Santoso', '1232', 'Masyarakat', '081234567802'),
(3, 'Agus Rahman', '1233', 'Masyarakat', '081234567803'),
(4, 'Siti Nuraini', '1234', 'Masyarakat', '081234567804'),
(5, 'Budi Hartono', '1235', 'Masyarakat', '081234567805'),
(6, 'Dewi Kurnia', '1236', 'Masyarakat', '081234567806'),
(7, 'Rizal Maulana', '1237', 'Masyarakat', '081234567807'),
(8, 'Winda Pratiwi', '1238', 'Masyarakat', '081234567808'),
(9, 'Ahmad Fauzi', '1239', 'Masyarakat', '081234567809'),
(10, 'Yulia Safitri', '1211', 'Masyarakat', '081234567810'),
(11, 'Nur Hidayah', '1212', 'Masyarakat', '081234567811'),
(12, 'Hendra Wijaya', '1213', 'Masyarakat', '081234567812'),
(13, 'Lina Marlina', '1214', 'Masyarakat', '081234567813'),
(14, 'Andi Saputra', '1215', 'Masyarakat', '081234567814'),
(15, 'Desi Fitriani', '1216', 'Masyarakat', '081234567815'),
(16, 'Eko Prasetyo', '1217', 'Masyarakat', '081234567816'),
(17, 'Ratna Wulandari', '1218', 'Masyarakat', '081234567817'),
(18, 'Teguh Ramadhan', '1219', 'Masyarakat', '081234567818'),
(19, 'Mira Puspita', '1221', 'Masyarakat', '081234567819'),
(20, 'Yoga Pranata', '1222', 'Masyarakat', '081234567820'),
(21, 'Nabila Imtiyaz', '1223', 'Masyarakat', '081234567821'),
(22, 'Zahra Aulis', '1224', 'Masyarakat', '081234567822'),
(23, 'Aliyah Azzah', '1225', 'Masyarakat', '081234567823'),
(24, 'Adella Putri', '1226', 'Masyarakat', '081234567824'),
(25, 'Nurhidayah', '1227', 'Masyarakat', '081234567825'),
(26, 'Putri Syafana', '1228', 'Masyarakat', '081234567826'),
(27, 'Khanisa Octavia', '1229', 'Masyarakat', '081234567827'),
(28, 'Isrina Lutfiah', '1241', 'Masyarakat', '081234567828'),
(29, 'Nayla Camelia', '1242', 'Masyarakat', '081234567829'),
(30, 'Jen Agresia', '1243', 'Masyarakat', '081234567830'),
(31, 'Bayu Setiawan', 'admin1231', 'Petugas', '081234567821'),
(32, 'Dina Kusuma', 'admin1232', 'Petugas', '081234567822'),
(33, 'Rafi Ardian', 'admin1233', 'Petugas', '081234567823'),
(34, 'Mega Lestari', 'admin1234', 'Petugas', '081234567824'),
(35, 'Tono Suhendar', 'admin1235', 'Petugas', '081234567825'),
(36, 'Yuni Astuti', 'admin1236', 'Petugas', '081234567826'),
(37, 'Krisna Adi', 'admin1237', 'Petugas', '081234567827'),
(38, 'Vina Marlina', 'admin1238', 'Petugas', '081234567828'),
(39, 'Bagus Nugraha', 'admin1239', 'Petugas', '081234567829'),
(40, 'Rara Kusnadi', 'admin1230', 'Petugas', '081234567830'),
(41, 'Ahmad Dani', '123', 'Masyarakat', ''),
(42, 'b', '1', 'Masyarakat', '0'),
(43, 'g', '1', 'Masyarakat', '0');

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
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `laporan_penangkapan_ikan`
--
ALTER TABLE `laporan_penangkapan_ikan`
  MODIFY `id_laporan_penangkapan_ikan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `laporan_pencemaran`
--
ALTER TABLE `laporan_pencemaran`
  MODIFY `id_laporan_pencemaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `lokasi_laut`
--
ALTER TABLE `lokasi_laut`
  MODIFY `id_lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tindak_lanjut`
--
ALTER TABLE `tindak_lanjut`
  MODIFY `id_tindak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

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
