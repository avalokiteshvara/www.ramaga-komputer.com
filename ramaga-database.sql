-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.20 - Source distribution
-- Server OS:                    Linux
-- HeidiSQL Version:             9.2.0.4950
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for ramaga-komputer
CREATE DATABASE IF NOT EXISTS `ramaga-komputer` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ramaga-komputer`;


-- Dumping structure for table ramaga-komputer.ci_sessions
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) DEFAULT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  `prevent_update` int(10) DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.ci_sessions: ~1 rows (approximately)
DELETE FROM `ci_sessions`;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`, `prevent_update`) VALUES
	('10c1124dc633417e658de63af3b47f7a', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1435935026, 'a:10:{s:9:"user_data";s:0:"";s:9:"view_tipe";s:4:"grid";s:4:"sort";s:4:"nama";s:5:"order";s:3:"ASC";s:2:"id";s:1:"2";s:12:"nama_lengkap";s:6:"member";s:5:"email";s:16:"member@gmail.com";s:6:"status";s:6:"MEMBER";s:11:"sudah_login";i:1;s:13:"cart_contents";a:3:{s:32:"8208a34c870ec1cddb1b092f464b3392";a:8:{s:5:"rowid";s:32:"8208a34c870ec1cddb1b092f464b3392";s:2:"id";s:4:"P002";s:3:"qty";s:1:"1";s:5:"price";s:8:"14000000";s:4:"name";s:53:"APPLE MacBook Air MD224ZA/A 11.6 Inch Laptop (Silver)";s:6:"gambar";s:36:"e1d397e8e0ffb8e1e7adc825b9b597e1.jpg";s:4:"slug";s:51:"apple-macbook-air-md224za-a-11-6-inch-laptop-silver";s:8:"subtotal";i:14000000;}s:11:"total_items";i:1;s:10:"cart_total";i:14000000;}}', NULL),
	('6d0aaa31ca00354416e450373645d2e4', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', 1435907866, 'a:8:{s:9:"user_data";s:0:"";s:2:"id";s:1:"2";s:12:"nama_lengkap";s:6:"member";s:5:"email";s:16:"member@gmail.com";s:6:"status";s:6:"MEMBER";s:9:"view_tipe";s:4:"grid";s:4:"sort";s:4:"nama";s:5:"order";s:3:"ASC";}', NULL);
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.tbl_barang_masuk
CREATE TABLE IF NOT EXISTS `tbl_barang_masuk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `no_invoice` varchar(50) DEFAULT NULL,
  `nama_pegawai` varchar(50) DEFAULT NULL,
  `nilai_total` double DEFAULT NULL,
  `keterangan` date DEFAULT NULL,
  `masuk_at` date DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_invoice` (`no_invoice`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.tbl_barang_masuk: ~3 rows (approximately)
DELETE FROM `tbl_barang_masuk`;
/*!40000 ALTER TABLE `tbl_barang_masuk` DISABLE KEYS */;
INSERT INTO `tbl_barang_masuk` (`id`, `no_invoice`, `nama_pegawai`, `nilai_total`, `keterangan`, `masuk_at`, `update_at`) VALUES
	(1, 'INV-001', 'Andi', 45000000, '0000-00-00', '2015-07-03', '2015-07-03 06:25:50'),
	(2, 'INV-002', 'Andi', 140000000, '0000-00-00', '2015-07-03', '2015-07-03 12:53:21'),
	(3, 'INV-003', 'Anto', 240000000, '0000-00-00', '2015-07-03', '2015-07-03 14:13:41');
/*!40000 ALTER TABLE `tbl_barang_masuk` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.tbl_barang_masuk_details
CREATE TABLE IF NOT EXISTS `tbl_barang_masuk_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_barang_masuk` int(11) DEFAULT NULL,
  `kode_produk` varchar(50) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.tbl_barang_masuk_details: ~3 rows (approximately)
DELETE FROM `tbl_barang_masuk_details`;
/*!40000 ALTER TABLE `tbl_barang_masuk_details` DISABLE KEYS */;
INSERT INTO `tbl_barang_masuk_details` (`id`, `id_barang_masuk`, `kode_produk`, `jumlah`) VALUES
	(1, 1, 'P001', 10),
	(2, 2, 'P002', 10),
	(3, 3, 'P005', 10);
/*!40000 ALTER TABLE `tbl_barang_masuk_details` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.tbl_data
CREATE TABLE IF NOT EXISTS `tbl_data` (
  `kode` varchar(50) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.tbl_data: ~0 rows (approximately)
DELETE FROM `tbl_data`;
/*!40000 ALTER TABLE `tbl_data` DISABLE KEYS */;
INSERT INTO `tbl_data` (`kode`, `content`) VALUES
	('welcome_greets', '<h2>Selamat Datang di ramaga-komputer.com</h2>\r\n<strong>ramaga-komputer.com</strong> adalah perusahaan suplier barang-barang komputer. Termasuk didalamnya semua barang dan jasa yang berkaitan dengan teknologi informasi. Kami melayani perusahaan-perusahaan, kantor, pabrik, supermarket, pendidikan, bank, koperasi, asuransi, hingga home user atau pengguna di rumah. \r\n\r\n<p>Kami membantu mereka, memberikan solusi dibidang IT, menyediakan barang-barang Teknologi Informasi yang berkualitas, bergaransi, dengan harga terbaik.</p>\r\n      <p style="text-align: left;">Semenjak berdiri tahun 1999, hingga saat ini, kami telah dipercaya untuk bekerja sama dengan berbagai vendor / produsen produk-produk komputer. Para vendor tersebut memberikan dukungan sepenuhnya terhadap produk-produk yang dijual melalui <strong>Komputer-Online.com</strong>. Dukungan yang diberikan berupa garansi terhadap produk, maupun harga yang bersaing.</p>');
/*!40000 ALTER TABLE `tbl_data` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.tbl_gambar_produk
CREATE TABLE IF NOT EXISTS `tbl_gambar_produk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_produk` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gambar` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.tbl_gambar_produk: ~1 rows (approximately)
DELETE FROM `tbl_gambar_produk`;
/*!40000 ALTER TABLE `tbl_gambar_produk` DISABLE KEYS */;
INSERT INTO `tbl_gambar_produk` (`id`, `kode_produk`, `updated_at`, `gambar`) VALUES
	(5, 'P001', '2015-07-03 06:52:15', 'd103ee18279389e4a5947fa23fae4c78.jpg');
/*!40000 ALTER TABLE `tbl_gambar_produk` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.tbl_komputer
CREATE TABLE IF NOT EXISTS `tbl_komputer` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.tbl_komputer: ~5 rows (approximately)
DELETE FROM `tbl_komputer`;
/*!40000 ALTER TABLE `tbl_komputer` DISABLE KEYS */;
INSERT INTO `tbl_komputer` (`id`, `title`, `slug`, `update_at`) VALUES
	(1, 'Apple', 'komputer/apple', '2015-07-02 14:38:36'),
	(2, 'Desktop', 'komputer/desktop', '2015-07-02 12:57:32'),
	(3, 'Notebook', 'komputer/notebook', '2015-07-02 12:57:38'),
	(4, 'Server', 'komputer/server', '2015-07-02 12:57:49'),
	(5, 'Workstation', 'komputer/workstation', '2015-07-02 12:58:00');
/*!40000 ALTER TABLE `tbl_komputer` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.tbl_peripheral
CREATE TABLE IF NOT EXISTS `tbl_peripheral` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.tbl_peripheral: ~7 rows (approximately)
DELETE FROM `tbl_peripheral`;
/*!40000 ALTER TABLE `tbl_peripheral` DISABLE KEYS */;
INSERT INTO `tbl_peripheral` (`id`, `title`, `slug`, `update_at`) VALUES
	(1, 'Harddisk Internal', 'peripheral/HD-internal', '2015-07-02 14:12:10'),
	(2, 'Harddisk Eksternal', 'peripheral/HD-eksternal', '2015-07-02 14:12:18'),
	(3, 'RAM', 'peripheral/ram', '2016-07-02 12:59:55'),
	(4, 'Monitor', 'peripheral/monitor', '2015-07-02 13:00:30'),
	(5, 'VGA', 'peripheral/VGA', '2015-07-02 14:12:31'),
	(6, 'Mouse', 'peripheral/mouse', '2015-07-02 13:00:54'),
	(7, 'Keyboard', 'peripheral/keyboard', '2015-07-02 13:01:05'),
	(8, 'USB Modem', 'peripheral/usb-modem', '2015-07-02 14:12:24');
/*!40000 ALTER TABLE `tbl_peripheral` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.tbl_produk
CREATE TABLE IF NOT EXISTS `tbl_produk` (
  `kode` varchar(50) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `jenis` enum('komputer','peripheral','software') NOT NULL,
  `id_jenis` tinyint(4) DEFAULT NULL,
  `harga` double NOT NULL,
  `harga_lama` double NOT NULL,
  `promo` enum('Y','N') NOT NULL DEFAULT 'N',
  `berat` float NOT NULL,
  `gambar` varchar(50) NOT NULL DEFAULT 'no_images.jpg',
  `deskripsi` text NOT NULL,
  `aktif` enum('Y','N') DEFAULT 'Y',
  `tgl_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.tbl_produk: ~5 rows (approximately)
DELETE FROM `tbl_produk`;
/*!40000 ALTER TABLE `tbl_produk` DISABLE KEYS */;
INSERT INTO `tbl_produk` (`kode`, `nama`, `slug`, `jenis`, `id_jenis`, `harga`, `harga_lama`, `promo`, `berat`, `gambar`, `deskripsi`, `aktif`, `tgl_update`) VALUES
	('P001', 'LENOVO IdeaPad B40-45 59439756 14 Inch Laptop (Black)', 'lenovo-ideapad-b40-45-59439756-14-inch-laptop-black', 'komputer', 3, 4400000, 0, 'N', 2, '5d237409780a77017092b74edcfcf996.jpg', ' Power 	45Watt Power Adapter 3 pin\nSize (WxDxH)mm 	340mm x 24.5mm x 247mm\nPart Number 	59439756\nColor 	black\nWarranty 	1 Year Warranty\nWebcam 	720P Camera\nCPU Brand 	AMD\nKapasitas Harddisk 	500 GB\nVideo Card 	Integrated AMD Radeon R4 Graphics\nHard Drive 	500GB SATA HDD 5400Rpm\nBattery 	4Cell battery 32 Whr up to 5 hours\nMemory 	4GB DDR3L 1600MHz\nOptical 	DVD-RW Multiburner\n\n', 'Y', '2015-07-06 11:43:45'),
	('P002', 'APPLE MacBook Air MD224ZA/A 11.6 Inch Laptop (Silver)', 'apple-macbook-air-md224za-a-11-6-inch-laptop-silver', 'komputer', 1, 14000000, 0, 'N', 1, 'e1d397e8e0ffb8e1e7adc825b9b597e1.jpg', '  CPU 	Intel\nBrand 	APPLE\nSize (WxDxH)mm 	11.8 x 7.56 x 0.68 inches \nColor 	Silver\nWarranty 	1-Tahun Garansi Terbatas oleh Distributor Resmi \nWebcam 	Webcam\nCPU Brand 	INTEL\nWiFi 	Built-in AirPort Extreme Wi-Fi \nKapasitas Harddisk 	128 GB\nVideo Card 	Intel HD Graphics 4000\nRAM 	4 GB\nHard Drive 	128 GB SSD \nMemory 	4 GB DDR3  ', 'Y', '2015-07-06 11:43:19'),
	('P003', 'ASUS K30AD 15.6 Inch Desktop PC (Intel Pentium G3220)', 'asus-k30ad-15-6-inch-desktop-pc-intel-pentium-g3220', 'komputer', 2, 4300000, 0, 'N', 2, '924d4d13b08a20c8e13eb5193efba62b.jpg', ' Package Weight 	45 kg\nVideo Card 	Integrated Intel HD Graphics\nAudio 	6 Channel Audio\nBrand 	ASUS\nOther 	Standard Keyboard & Optical Mouse USB\nWarranty 	1 Year Parts Warranty\nCard Reader 	4 in 1 Card Reader\nRAM 	2 GB\nDisplay Size 	15.6 Inch  ', 'Y', '2015-07-06 11:43:24'),
	('P004', 'CORSAIR Force GT (CSSD-F90GBGT-BK)', 'corsair-force-gt-cssd-f90gbgt-bk', 'peripheral', 1, 1140000, 0, 'N', 1, '020e4711853c7d3f3a7648457b6b1fc7.jpg', 'Capacity 90GB | Interface SATA III | Feature: Operating Temperature : 0C to +70C, Storage Temperature : -20C to +85C, Operating Humidity : 10% to 90% RH (0 to +40 C), Maximum Operating Altitude : 3,048 m (up to 10,000 ft.), Maximum Non-Operating  ', 'Y', '2015-07-06 11:43:35'),
	('P005', 'Asus RS520-E6/RS8+ PIKE1078', 'asus-rs520-e6-rs8-pike1078', 'komputer', 4, 24000000, 0, 'N', 2, 'cb78fea3d0af3d61d71249e36524f391.jpg', 'Slot Type: 2 * PCI-E x8 (x8 link)(Full-Height/Full-Length) | 1 * PCI-E x4 (x4 link)(Full-Height/Half-Length) | SATA Controller: Intel ICH10R: 6 SATA2 300MB/s ports | Intel Matrix Storage (for Windows only) | (Support software RAID 0, 1, 10 & 5) | LSI MegaRAID (for Linux/Windows) | (Support software RAID 0, 1, 10) | SAS Controller: ASUS PIKE1078 support 8 SAS HDD with Raid 0,1,10,5,6 ', 'Y', '2015-07-06 11:43:31');
/*!40000 ALTER TABLE `tbl_produk` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.tbl_produk_viewed
CREATE TABLE IF NOT EXISTS `tbl_produk_viewed` (
  `slug` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `viewed_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.tbl_produk_viewed: ~8 rows (approximately)
DELETE FROM `tbl_produk_viewed`;
/*!40000 ALTER TABLE `tbl_produk_viewed` DISABLE KEYS */;
INSERT INTO `tbl_produk_viewed` (`slug`, `ip`, `viewed_at`) VALUES
	('apple-macbook-air-md224za-a-11-6-inch-laptop-silve', '127.0.0.1', '2015-07-03'),
	('apple-macbook-air-md224za-a-11-6-inch-laptop-silve', '127.0.0.1', '2015-07-03'),
	('corsair-force-gt-cssd-f90gbgt-bk', '127.0.0.1', '2015-07-06'),
	('apple-macbook-air-md224za-a-11-6-inch-laptop-silve', '127.0.0.1', '2015-07-06'),
	('apple-macbook-air-md224za-a-11-6-inch-laptop-silve', '127.0.0.1', '2015-07-06'),
	('apple-macbook-air-md224za-a-11-6-inch-laptop-silve', '127.0.0.1', '2015-07-06'),
	('apple-macbook-air-md224za-a-11-6-inch-laptop-silve', '127.0.0.1', '2015-07-06'),
	('apple-macbook-air-md224za-a-11-6-inch-laptop-silve', '127.0.0.1', '2015-07-06'),
	('apple-macbook-air-md224za-a-11-6-inch-laptop-silve', '127.0.0.1', '2015-07-06'),
	('apple-macbook-air-md224za-a-11-6-inch-laptop-silve', '127.0.0.1', '2015-07-06'),
	('apple-macbook-air-md224za-a-11-6-inch-laptop-silve', '127.0.0.1', '2015-07-08');
/*!40000 ALTER TABLE `tbl_produk_viewed` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.tbl_review
CREATE TABLE IF NOT EXISTS `tbl_review` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_produk` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `isi` text NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `accepted` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.tbl_review: ~0 rows (approximately)
DELETE FROM `tbl_review`;
/*!40000 ALTER TABLE `tbl_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_review` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.tbl_software
CREATE TABLE IF NOT EXISTS `tbl_software` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.tbl_software: ~5 rows (approximately)
DELETE FROM `tbl_software`;
/*!40000 ALTER TABLE `tbl_software` DISABLE KEYS */;
INSERT INTO `tbl_software` (`id`, `title`, `slug`, `update_at`) VALUES
	(1, 'Adobe', 'software/adobe', '2015-07-02 13:02:52'),
	(2, 'Office', 'software/office', '2015-07-02 13:02:58'),
	(3, 'Sistem Operasi', 'software/sistem-operasi', '2015-07-02 14:11:38'),
	(4, 'Anti Virus', 'software/anti-virus', '2015-07-02 14:11:47');
/*!40000 ALTER TABLE `tbl_software` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.tbl_trans_details
CREATE TABLE IF NOT EXISTS `tbl_trans_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_trans` int(7) DEFAULT NULL,
  `kode_produk` varchar(50) DEFAULT NULL,
  `harga_satuan` double DEFAULT NULL,
  `quantity` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.tbl_trans_details: ~0 rows (approximately)
DELETE FROM `tbl_trans_details`;
/*!40000 ALTER TABLE `tbl_trans_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_trans_details` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.tbl_trans_header
CREATE TABLE IF NOT EXISTS `tbl_trans_header` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `id_user` int(10) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telp` varchar(50) DEFAULT NULL,
  `propinsi` varchar(50) DEFAULT NULL,
  `kota` varchar(50) DEFAULT NULL,
  `kode_pos` varchar(50) DEFAULT NULL,
  `alamat` text,
  `pesan` text,
  `status` enum('WAITING_PAYMENT','PROCESSING','CANCELED','COMPLETE','PAYMENT_CONFIRMED') DEFAULT 'WAITING_PAYMENT',
  `ongkos_kirim` double DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.tbl_trans_header: ~0 rows (approximately)
DELETE FROM `tbl_trans_header`;
/*!40000 ALTER TABLE `tbl_trans_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_trans_header` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.tbl_trans_konfirmasi
CREATE TABLE IF NOT EXISTS `tbl_trans_konfirmasi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_trans` int(7) DEFAULT NULL,
  `tgl_setor` date DEFAULT NULL,
  `metode_bayar` varchar(50) DEFAULT NULL,
  `nama_penyetor` varchar(50) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `jml_transfer` double DEFAULT NULL,
  `metode_kirim` varchar(50) DEFAULT NULL,
  `pesan` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.tbl_trans_konfirmasi: ~0 rows (approximately)
DELETE FROM `tbl_trans_konfirmasi`;
/*!40000 ALTER TABLE `tbl_trans_konfirmasi` DISABLE KEYS */;
INSERT INTO `tbl_trans_konfirmasi` (`id`, `id_trans`, `tgl_setor`, `metode_bayar`, `nama_penyetor`, `bank`, `jml_transfer`, `metode_kirim`, `pesan`) VALUES
	(1, 1, '2015-07-03', 'Setoran Tunai, Transfer Bank', 'Anto', 'BCA - No.Rek xx.xx.xx.xx', 14000000, 'TIKI', '');
/*!40000 ALTER TABLE `tbl_trans_konfirmasi` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.tbl_user
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(50) NOT NULL,
  `propinsi` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `kode_pos` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` enum('MEMBER','ADMIN') NOT NULL DEFAULT 'MEMBER',
  `aktif` enum('Y','N') NOT NULL DEFAULT 'Y',
  `kode_aktivasi` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.tbl_user: ~2 rows (approximately)
DELETE FROM `tbl_user`;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` (`id`, `nama_lengkap`, `alamat`, `telp`, `propinsi`, `kota`, `kode_pos`, `tgl_lahir`, `email`, `password`, `status`, `aktif`, `kode_aktivasi`) VALUES
	(2, 'member', 'jl.memberraya', '631245', 'jatim', 'surabaya', '78654', '1981-10-08', 'member@gmail.com', 'aa08769cdcb26674c6706093503ff0a3', 'MEMBER', 'Y', ''),
	(3, 'admin', 'xxxx', '1234567', 'xxxx', 'xxxx', '123456', '0000-00-00', 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3', 'ADMIN', 'Y', '0lsa3NlplhhxmTtp3eFm');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.wilayah_kabupaten
CREATE TABLE IF NOT EXISTS `wilayah_kabupaten` (
  `id` varchar(4) NOT NULL,
  `provinsi_id` varchar(2) NOT NULL DEFAULT '',
  `nama` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.wilayah_kabupaten: ~499 rows (approximately)
DELETE FROM `wilayah_kabupaten`;
/*!40000 ALTER TABLE `wilayah_kabupaten` DISABLE KEYS */;
INSERT INTO `wilayah_kabupaten` (`id`, `provinsi_id`, `nama`) VALUES
	('1101', '11', 'Kab. Simeulue'),
	('1102', '11', 'Kab. Aceh Singkil'),
	('1103', '11', 'Kab. Aceh Selatan'),
	('1104', '11', 'Kab. Aceh Tenggara'),
	('1105', '11', 'Kab. Aceh Timur'),
	('1106', '11', 'Kab. Aceh Tengah'),
	('1107', '11', 'Kab. Aceh Barat'),
	('1108', '11', 'Kab. Aceh Besar'),
	('1109', '11', 'Kab. Pidie'),
	('1110', '11', 'Kab. Bireuen'),
	('1111', '11', 'Kab. Aceh Utara'),
	('1112', '11', 'Kab. Aceh Barat Daya'),
	('1113', '11', 'Kab. Gayo Lues'),
	('1114', '11', 'Kab. Aceh Tamiang'),
	('1115', '11', 'Kab. Nagan Raya'),
	('1116', '11', 'Kab. Aceh Jaya'),
	('1117', '11', 'Kab. Bener Meriah'),
	('1118', '11', 'Kab. Pidie Jaya'),
	('1171', '11', 'Kota Banda Aceh'),
	('1172', '11', 'Kota Sabang'),
	('1173', '11', 'Kota Langsa'),
	('1174', '11', 'Kota Lhokseumawe'),
	('1175', '11', 'Kota Subulussalam'),
	('1201', '12', 'Kab. Nias'),
	('1202', '12', 'Kab. Mandailing Natal'),
	('1203', '12', 'Kab. Tapanuli Selatan'),
	('1204', '12', 'Kab. Tapanuli Tengah'),
	('1205', '12', 'Kab. Tapanuli Utara'),
	('1206', '12', 'Kab. Toba Samosir'),
	('1207', '12', 'Kab. Labuhan Batu'),
	('1208', '12', 'Kab. Asahan'),
	('1209', '12', 'Kab. Simalungun'),
	('1210', '12', 'Kab. Dairi'),
	('1211', '12', 'Kab. Karo'),
	('1212', '12', 'Kab. Deli Serdang'),
	('1213', '12', 'Kab. Langkat'),
	('1214', '12', 'Kab. Nias Selatan'),
	('1215', '12', 'Kab. Humbang Hasundutan'),
	('1216', '12', 'Kab. Pakpak Bharat'),
	('1217', '12', 'Kab. Samosir'),
	('1218', '12', 'Kab. Serdang Bedagai'),
	('1219', '12', 'Kab. Batu Bara'),
	('1220', '12', 'Kab. Padang Lawas Utara'),
	('1221', '12', 'Kab. Padang Lawas'),
	('1222', '12', 'Kab. Labuhan Batu Selatan'),
	('1223', '12', 'Kab. Labuhan Batu Utara'),
	('1224', '12', 'Kab. Nias Utara'),
	('1225', '12', 'Kab. Nias Barat'),
	('1271', '12', 'Kota Sibolga'),
	('1272', '12', 'Kota Tanjung Balai'),
	('1273', '12', 'Kota Pematang Siantar'),
	('1274', '12', 'Kota Tebing Tinggi'),
	('1275', '12', 'Kota Medan'),
	('1276', '12', 'Kota Binjai'),
	('1277', '12', 'Kota Padangsidimpuan'),
	('1278', '12', 'Kota Gunungsitoli'),
	('1301', '13', 'Kab. Kepulauan Mentawai'),
	('1302', '13', 'Kab. Pesisir Selatan'),
	('1303', '13', 'Kab. Solok'),
	('1304', '13', 'Kab. Sijunjung'),
	('1305', '13', 'Kab. Tanah Datar'),
	('1306', '13', 'Kab. Padang Pariaman'),
	('1307', '13', 'Kab. Agam'),
	('1308', '13', 'Kab. Lima Puluh Kota'),
	('1309', '13', 'Kab. Pasaman'),
	('1310', '13', 'Kab. Solok Selatan'),
	('1311', '13', 'Kab. Dharmasraya'),
	('1312', '13', 'Kab. Pasaman Barat'),
	('1371', '13', 'Kota Padang'),
	('1372', '13', 'Kota Solok'),
	('1373', '13', 'Kota Sawah Lunto'),
	('1374', '13', 'Kota Padang Panjang'),
	('1375', '13', 'Kota Bukittinggi'),
	('1376', '13', 'Kota Payakumbuh'),
	('1377', '13', 'Kota Pariaman'),
	('1401', '14', 'Kab. Kuantan Singingi'),
	('1402', '14', 'Kab. Indragiri Hulu'),
	('1403', '14', 'Kab. Indragiri Hilir'),
	('1404', '14', 'Kab. Pelalawan'),
	('1405', '14', 'Kab. S I A K'),
	('1406', '14', 'Kab. Kampar'),
	('1407', '14', 'Kab. Rokan Hulu'),
	('1408', '14', 'Kab. Bengkalis'),
	('1409', '14', 'Kab. Rokan Hilir'),
	('1410', '14', 'Kab. Kepulauan Meranti'),
	('1471', '14', 'Kota Pekanbaru'),
	('1473', '14', 'Kota D U M A I'),
	('1501', '15', 'Kab. Kerinci'),
	('1502', '15', 'Kab. Merangin'),
	('1503', '15', 'Kab. Sarolangun'),
	('1504', '15', 'Kab. Batang Hari'),
	('1505', '15', 'Kab. Muaro Jambi'),
	('1506', '15', 'Kab. Tanjung Jabung Timur'),
	('1507', '15', 'Kab. Tanjung Jabung Barat'),
	('1508', '15', 'Kab. Tebo'),
	('1509', '15', 'Kab. Bungo'),
	('1571', '15', 'Kota Jambi'),
	('1572', '15', 'Kota Sungai Penuh'),
	('1601', '16', 'Kab. Ogan Komering Ulu'),
	('1602', '16', 'Kab. Ogan Komering Ilir'),
	('1603', '16', 'Kab. Muara Enim'),
	('1604', '16', 'Kab. Lahat'),
	('1605', '16', 'Kab. Musi Rawas'),
	('1606', '16', 'Kab. Musi Banyuasin'),
	('1607', '16', 'Kab. Banyu Asin'),
	('1608', '16', 'Kab. Ogan Komering Ulu Selatan'),
	('1609', '16', 'Kab. Ogan Komering Ulu Timur'),
	('1610', '16', 'Kab. Ogan Ilir'),
	('1611', '16', 'Kab. Empat Lawang'),
	('1671', '16', 'Kota Palembang'),
	('1672', '16', 'Kota Prabumulih'),
	('1673', '16', 'Kota Pagar Alam'),
	('1674', '16', 'Kota Lubuklinggau'),
	('1701', '17', 'Kab. Bengkulu Selatan'),
	('1702', '17', 'Kab. Rejang Lebong'),
	('1703', '17', 'Kab. Bengkulu Utara'),
	('1704', '17', 'Kab. Kaur'),
	('1705', '17', 'Kab. Seluma'),
	('1706', '17', 'Kab. Mukomuko'),
	('1707', '17', 'Kab. Lebong'),
	('1708', '17', 'Kab. Kepahiang'),
	('1709', '17', 'Kab. Bengkulu Tengah'),
	('1771', '17', 'Kota Bengkulu'),
	('1801', '18', 'Kab. Lampung Barat'),
	('1802', '18', 'Kab. Tanggamus'),
	('1803', '18', 'Kab. Lampung Selatan'),
	('1804', '18', 'Kab. Lampung Timur'),
	('1805', '18', 'Kab. Lampung Tengah'),
	('1806', '18', 'Kab. Lampung Utara'),
	('1807', '18', 'Kab. Way Kanan'),
	('1808', '18', 'Kab. Tulangbawang'),
	('1809', '18', 'Kab. Pesawaran'),
	('1810', '18', 'Kab. Pringsewu'),
	('1811', '18', 'Kab. Mesuji'),
	('1812', '18', 'Kab. Tulang Bawang Barat'),
	('1813', '18', 'Kab. Pesisir Barat'),
	('1871', '18', 'Kota Bandar Lampung'),
	('1872', '18', 'Kota Metro'),
	('1901', '19', 'Kab. Bangka'),
	('1902', '19', 'Kab. Belitung'),
	('1903', '19', 'Kab. Bangka Barat'),
	('1904', '19', 'Kab. Bangka Tengah'),
	('1905', '19', 'Kab. Bangka Selatan'),
	('1906', '19', 'Kab. Belitung Timur'),
	('1971', '19', 'Kota Pangkal Pinang'),
	('2101', '21', 'Kab. Karimun'),
	('2102', '21', 'Kab. Bintan'),
	('2103', '21', 'Kab. Natuna'),
	('2104', '21', 'Kab. Lingga'),
	('2105', '21', 'Kab. Kepulauan Anambas'),
	('2171', '21', 'Kota B A T A M'),
	('2172', '21', 'Kota Tanjung Pinang'),
	('3101', '31', 'Kab. Kepulauan Seribu'),
	('3171', '31', 'Kota Jakarta Selatan'),
	('3172', '31', 'Kota Jakarta Timur'),
	('3173', '31', 'Kota Jakarta Pusat'),
	('3174', '31', 'Kota Jakarta Barat'),
	('3175', '31', 'Kota Jakarta Utara'),
	('3201', '32', 'Kab. Bogor'),
	('3202', '32', 'Kab. Sukabumi'),
	('3203', '32', 'Kab. Cianjur'),
	('3204', '32', 'Kab. Bandung'),
	('3205', '32', 'Kab. Garut'),
	('3206', '32', 'Kab. Tasikmalaya'),
	('3207', '32', 'Kab. Ciamis'),
	('3208', '32', 'Kab. Kuningan'),
	('3209', '32', 'Kab. Cirebon'),
	('3210', '32', 'Kab. Majalengka'),
	('3211', '32', 'Kab. Sumedang'),
	('3212', '32', 'Kab. Indramayu'),
	('3213', '32', 'Kab. Subang'),
	('3214', '32', 'Kab. Purwakarta'),
	('3215', '32', 'Kab. Karawang'),
	('3216', '32', 'Kab. Bekasi'),
	('3217', '32', 'Kab. Bandung Barat'),
	('3218', '32', 'Kab. Pangandaran'),
	('3271', '32', 'Kota Bogor'),
	('3272', '32', 'Kota Sukabumi'),
	('3273', '32', 'Kota Bandung'),
	('3274', '32', 'Kota Cirebon'),
	('3275', '32', 'Kota Bekasi'),
	('3276', '32', 'Kota Depok'),
	('3277', '32', 'Kota Cimahi'),
	('3278', '32', 'Kota Tasikmalaya'),
	('3279', '32', 'Kota Banjar'),
	('3301', '33', 'Kab. Cilacap'),
	('3302', '33', 'Kab. Banyumas'),
	('3303', '33', 'Kab. Purbalingga'),
	('3304', '33', 'Kab. Banjarnegara'),
	('3305', '33', 'Kab. Kebumen'),
	('3306', '33', 'Kab. Purworejo'),
	('3307', '33', 'Kab. Wonosobo'),
	('3308', '33', 'Kab. Magelang'),
	('3309', '33', 'Kab. Boyolali'),
	('3310', '33', 'Kab. Klaten'),
	('3311', '33', 'Kab. Sukoharjo'),
	('3312', '33', 'Kab. Wonogiri'),
	('3313', '33', 'Kab. Karanganyar'),
	('3314', '33', 'Kab. Sragen'),
	('3315', '33', 'Kab. Grobogan'),
	('3316', '33', 'Kab. Blora'),
	('3317', '33', 'Kab. Rembang'),
	('3318', '33', 'Kab. Pati'),
	('3319', '33', 'Kab. Kudus'),
	('3320', '33', 'Kab. Jepara'),
	('3321', '33', 'Kab. Demak'),
	('3322', '33', 'Kab. Semarang'),
	('3323', '33', 'Kab. Temanggung'),
	('3324', '33', 'Kab. Kendal'),
	('3325', '33', 'Kab. Batang'),
	('3326', '33', 'Kab. Pekalongan'),
	('3327', '33', 'Kab. Pemalang'),
	('3328', '33', 'Kab. Tegal'),
	('3329', '33', 'Kab. Brebes'),
	('3371', '33', 'Kota Magelang'),
	('3372', '33', 'Kota Surakarta'),
	('3373', '33', 'Kota Salatiga'),
	('3374', '33', 'Kota Semarang'),
	('3375', '33', 'Kota Pekalongan'),
	('3376', '33', 'Kota Tegal'),
	('3401', '34', 'Kab. Kulon Progo'),
	('3402', '34', 'Kab. Bantul'),
	('3403', '34', 'Kab. Gunung Kidul'),
	('3404', '34', 'Kab. Sleman'),
	('3471', '34', 'Kota Yogyakarta'),
	('3501', '35', 'Kab. Pacitan'),
	('3502', '35', 'Kab. Ponorogo'),
	('3503', '35', 'Kab. Trenggalek'),
	('3504', '35', 'Kab. Tulungagung'),
	('3505', '35', 'Kab. Blitar'),
	('3506', '35', 'Kab. Kediri'),
	('3507', '35', 'Kab. Malang'),
	('3508', '35', 'Kab. Lumajang'),
	('3509', '35', 'Kab. Jember'),
	('3510', '35', 'Kab. Banyuwangi'),
	('3511', '35', 'Kab. Bondowoso'),
	('3512', '35', 'Kab. Situbondo'),
	('3513', '35', 'Kab. Probolinggo'),
	('3514', '35', 'Kab. Pasuruan'),
	('3515', '35', 'Kab. Sidoarjo'),
	('3516', '35', 'Kab. Mojokerto'),
	('3517', '35', 'Kab. Jombang'),
	('3518', '35', 'Kab. Nganjuk'),
	('3519', '35', 'Kab. Madiun'),
	('3520', '35', 'Kab. Magetan'),
	('3521', '35', 'Kab. Ngawi'),
	('3522', '35', 'Kab. Bojonegoro'),
	('3523', '35', 'Kab. Tuban'),
	('3524', '35', 'Kab. Lamongan'),
	('3525', '35', 'Kab. Gresik'),
	('3526', '35', 'Kab. Bangkalan'),
	('3527', '35', 'Kab. Sampang'),
	('3528', '35', 'Kab. Pamekasan'),
	('3529', '35', 'Kab. Sumenep'),
	('3571', '35', 'Kota Kediri'),
	('3572', '35', 'Kota Blitar'),
	('3573', '35', 'Kota Malang'),
	('3574', '35', 'Kota Probolinggo'),
	('3575', '35', 'Kota Pasuruan'),
	('3576', '35', 'Kota Mojokerto'),
	('3577', '35', 'Kota Madiun'),
	('3578', '35', 'Kota Surabaya'),
	('3579', '35', 'Kota Batu'),
	('3601', '36', 'Kab. Pandeglang'),
	('3602', '36', 'Kab. Lebak'),
	('3603', '36', 'Kab. Tangerang'),
	('3604', '36', 'Kab. Serang'),
	('3671', '36', 'Kota Tangerang'),
	('3672', '36', 'Kota Cilegon'),
	('3673', '36', 'Kota Serang'),
	('3674', '36', 'Kota Tangerang Selatan'),
	('5101', '51', 'Kab. Jembrana'),
	('5102', '51', 'Kab. Tabanan'),
	('5103', '51', 'Kab. Badung'),
	('5104', '51', 'Kab. Gianyar'),
	('5105', '51', 'Kab. Klungkung'),
	('5106', '51', 'Kab. Bangli'),
	('5107', '51', 'Kab. Karang Asem'),
	('5108', '51', 'Kab. Buleleng'),
	('5171', '51', 'Kota Denpasar'),
	('5201', '52', 'Kab. Lombok Barat'),
	('5202', '52', 'Kab. Lombok Tengah'),
	('5203', '52', 'Kab. Lombok Timur'),
	('5204', '52', 'Kab. Sumbawa'),
	('5205', '52', 'Kab. Dompu'),
	('5206', '52', 'Kab. Bima'),
	('5207', '52', 'Kab. Sumbawa Barat'),
	('5208', '52', 'Kab. Lombok Utara'),
	('5271', '52', 'Kota Mataram'),
	('5272', '52', 'Kota Bima'),
	('5301', '53', 'Kab. Sumba Barat'),
	('5302', '53', 'Kab. Sumba Timur'),
	('5303', '53', 'Kab. Kupang'),
	('5304', '53', 'Kab. Timor Tengah Selatan'),
	('5305', '53', 'Kab. Timor Tengah Utara'),
	('5306', '53', 'Kab. Belu'),
	('5307', '53', 'Kab. Alor'),
	('5308', '53', 'Kab. Lembata'),
	('5309', '53', 'Kab. Flores Timur'),
	('5310', '53', 'Kab. Sikka'),
	('5311', '53', 'Kab. Ende'),
	('5312', '53', 'Kab. Ngada'),
	('5313', '53', 'Kab. Manggarai'),
	('5314', '53', 'Kab. Rote Ndao'),
	('5315', '53', 'Kab. Manggarai Barat'),
	('5316', '53', 'Kab. Sumba Tengah'),
	('5317', '53', 'Kab. Sumba Barat Daya'),
	('5318', '53', 'Kab. Nagekeo'),
	('5319', '53', 'Kab. Manggarai Timur'),
	('5320', '53', 'Kab. Sabu Raijua'),
	('5371', '53', 'Kota Kupang'),
	('6101', '61', 'Kab. Sambas'),
	('6102', '61', 'Kab. Bengkayang'),
	('6103', '61', 'Kab. Landak'),
	('6104', '61', 'Kab. Pontianak'),
	('6105', '61', 'Kab. Sanggau'),
	('6106', '61', 'Kab. Ketapang'),
	('6107', '61', 'Kab. Sintang'),
	('6108', '61', 'Kab. Kapuas Hulu'),
	('6109', '61', 'Kab. Sekadau'),
	('6110', '61', 'Kab. Melawi'),
	('6111', '61', 'Kab. Kayong Utara'),
	('6112', '61', 'Kab. Kubu Raya'),
	('6171', '61', 'Kota Pontianak'),
	('6172', '61', 'Kota Singkawang'),
	('6201', '62', 'Kab. Kotawaringin Barat'),
	('6202', '62', 'Kab. Kotawaringin Timur'),
	('6203', '62', 'Kab. Kapuas'),
	('6204', '62', 'Kab. Barito Selatan'),
	('6205', '62', 'Kab. Barito Utara'),
	('6206', '62', 'Kab. Sukamara'),
	('6207', '62', 'Kab. Lamandau'),
	('6208', '62', 'Kab. Seruyan'),
	('6209', '62', 'Kab. Katingan'),
	('6210', '62', 'Kab. Pulang Pisau'),
	('6211', '62', 'Kab. Gunung Mas'),
	('6212', '62', 'Kab. Barito Timur'),
	('6213', '62', 'Kab. Murung Raya'),
	('6271', '62', 'Kota Palangka Raya'),
	('6301', '63', 'Kab. Tanah Laut'),
	('6302', '63', 'Kab. Kota Baru'),
	('6303', '63', 'Kab. Banjar'),
	('6304', '63', 'Kab. Barito Kuala'),
	('6305', '63', 'Kab. Tapin'),
	('6306', '63', 'Kab. Hulu Sungai Selatan'),
	('6307', '63', 'Kab. Hulu Sungai Tengah'),
	('6308', '63', 'Kab. Hulu Sungai Utara'),
	('6309', '63', 'Kab. Tabalong'),
	('6310', '63', 'Kab. Tanah Bumbu'),
	('6311', '63', 'Kab. Balangan'),
	('6371', '63', 'Kota Banjarmasin'),
	('6372', '63', 'Kota Banjar Baru'),
	('6401', '64', 'Kab. Paser'),
	('6402', '64', 'Kab. Kutai Barat'),
	('6403', '64', 'Kab. Kutai Kartanegara'),
	('6404', '64', 'Kab. Kutai Timur'),
	('6405', '64', 'Kab. Berau'),
	('6409', '64', 'Kab. Penajam Paser Utara'),
	('6471', '64', 'Kota Balikpapan'),
	('6472', '64', 'Kota Samarinda'),
	('6474', '64', 'Kota Bontang'),
	('6501', '65', 'Kab. Malinau'),
	('6502', '65', 'Kab. Bulungan'),
	('6503', '65', 'Kab. Tana Tidung'),
	('6504', '65', 'Kab. Nunukan'),
	('6571', '65', 'Kota Tarakan'),
	('7101', '71', 'Kab. Bolaang Mongondow'),
	('7102', '71', 'Kab. Minahasa'),
	('7103', '71', 'Kab. Kepulauan Sangihe'),
	('7104', '71', 'Kab. Kepulauan Talaud'),
	('7105', '71', 'Kab. Minahasa Selatan'),
	('7106', '71', 'Kab. Minahasa Utara'),
	('7107', '71', 'Kab. Bolaang Mongondow Utara'),
	('7108', '71', 'Kab. Siau Tagulandang Biaro'),
	('7109', '71', 'Kab. Minahasa Tenggara'),
	('7110', '71', 'Kab. Bolaang Mongondow Selatan'),
	('7111', '71', 'Kab. Bolaang Mongondow Timur'),
	('7171', '71', 'Kota Manado'),
	('7172', '71', 'Kota Bitung'),
	('7173', '71', 'Kota Tomohon'),
	('7174', '71', 'Kota Kotamobagu'),
	('7201', '72', 'Kab. Banggai Kepulauan'),
	('7202', '72', 'Kab. Banggai'),
	('7203', '72', 'Kab. Morowali'),
	('7204', '72', 'Kab. Poso'),
	('7205', '72', 'Kab. Donggala'),
	('7206', '72', 'Kab. Toli-toli'),
	('7207', '72', 'Kab. Buol'),
	('7208', '72', 'Kab. Parigi Moutong'),
	('7209', '72', 'Kab. Tojo Una-una'),
	('7210', '72', 'Kab. Sigi'),
	('7271', '72', 'Kota Palu'),
	('7301', '73', 'Kab. Kepulauan Selayar'),
	('7302', '73', 'Kab. Bulukumba'),
	('7303', '73', 'Kab. Bantaeng'),
	('7304', '73', 'Kab. Jeneponto'),
	('7305', '73', 'Kab. Takalar'),
	('7306', '73', 'Kab. Gowa'),
	('7307', '73', 'Kab. Sinjai'),
	('7308', '73', 'Kab. Maros'),
	('7309', '73', 'Kab. Pangkajene Dan Kepulauan'),
	('7310', '73', 'Kab. Barru'),
	('7311', '73', 'Kab. Bone'),
	('7312', '73', 'Kab. Soppeng'),
	('7313', '73', 'Kab. Wajo'),
	('7314', '73', 'Kab. Sidenreng Rappang'),
	('7315', '73', 'Kab. Pinrang'),
	('7316', '73', 'Kab. Enrekang'),
	('7317', '73', 'Kab. Luwu'),
	('7318', '73', 'Kab. Tana Toraja'),
	('7322', '73', 'Kab. Luwu Utara'),
	('7325', '73', 'Kab. Luwu Timur'),
	('7326', '73', 'Kab. Toraja Utara'),
	('7371', '73', 'Kota Makassar'),
	('7372', '73', 'Kota Parepare'),
	('7373', '73', 'Kota Palopo'),
	('7401', '74', 'Kab. Buton'),
	('7402', '74', 'Kab. Muna'),
	('7403', '74', 'Kab. Konawe'),
	('7404', '74', 'Kab. Kolaka'),
	('7405', '74', 'Kab. Konawe Selatan'),
	('7406', '74', 'Kab. Bombana'),
	('7407', '74', 'Kab. Wakatobi'),
	('7408', '74', 'Kab. Kolaka Utara'),
	('7409', '74', 'Kab. Buton Utara'),
	('7410', '74', 'Kab. Konawe Utara'),
	('7471', '74', 'Kota Kendari'),
	('7472', '74', 'Kota Baubau'),
	('7501', '75', 'Kab. Boalemo'),
	('7502', '75', 'Kab. Gorontalo'),
	('7503', '75', 'Kab. Pohuwato'),
	('7504', '75', 'Kab. Bone Bolango'),
	('7505', '75', 'Kab. Gorontalo Utara'),
	('7571', '75', 'Kota Gorontalo'),
	('7601', '76', 'Kab. Majene'),
	('7602', '76', 'Kab. Polewali Mandar'),
	('7603', '76', 'Kab. Mamasa'),
	('7604', '76', 'Kab. Mamuju'),
	('7605', '76', 'Kab. Mamuju Utara'),
	('8101', '81', 'Kab. Maluku Tenggara Barat'),
	('8102', '81', 'Kab. Maluku Tenggara'),
	('8103', '81', 'Kab. Maluku Tengah'),
	('8104', '81', 'Kab. Buru'),
	('8105', '81', 'Kab. Kepulauan Aru'),
	('8106', '81', 'Kab. Seram Bagian Barat'),
	('8107', '81', 'Kab. Seram Bagian Timur'),
	('8108', '81', 'Kab. Maluku Barat Daya'),
	('8109', '81', 'Kab. Buru Selatan'),
	('8171', '81', 'Kota Ambon'),
	('8172', '81', 'Kota Tual'),
	('8201', '82', 'Kab. Halmahera Barat'),
	('8202', '82', 'Kab. Halmahera Tengah'),
	('8203', '82', 'Kab. Kepulauan Sula'),
	('8204', '82', 'Kab. Halmahera Selatan'),
	('8205', '82', 'Kab. Halmahera Utara'),
	('8206', '82', 'Kab. Halmahera Timur'),
	('8207', '82', 'Kab. Pulau Morotai'),
	('8271', '82', 'Kota Ternate'),
	('8272', '82', 'Kota Tidore Kepulauan'),
	('9101', '91', 'Kab. Fakfak'),
	('9102', '91', 'Kab. Kaimana'),
	('9103', '91', 'Kab. Teluk Wondama'),
	('9104', '91', 'Kab. Teluk Bintuni'),
	('9105', '91', 'Kab. Manokwari'),
	('9106', '91', 'Kab. Sorong Selatan'),
	('9107', '91', 'Kab. Sorong'),
	('9108', '91', 'Kab. Raja Ampat'),
	('9109', '91', 'Kab. Tambrauw'),
	('9110', '91', 'Kab. Maybrat'),
	('9171', '91', 'Kota Sorong'),
	('9401', '94', 'Kab. Merauke'),
	('9402', '94', 'Kab. Jayawijaya'),
	('9403', '94', 'Kab. Jayapura'),
	('9404', '94', 'Kab. Nabire'),
	('9408', '94', 'Kab. Kepulauan Yapen'),
	('9409', '94', 'Kab. Biak Numfor'),
	('9410', '94', 'Kab. Paniai'),
	('9411', '94', 'Kab. Puncak Jaya'),
	('9412', '94', 'Kab. Mimika'),
	('9413', '94', 'Kab. Boven Digoel'),
	('9414', '94', 'Kab. Mappi'),
	('9415', '94', 'Kab. Asmat'),
	('9416', '94', 'Kab. Yahukimo'),
	('9417', '94', 'Kab. Pegunungan Bintang'),
	('9418', '94', 'Kab. Tolikara'),
	('9419', '94', 'Kab. Sarmi'),
	('9420', '94', 'Kab. Keerom'),
	('9426', '94', 'Kab. Waropen'),
	('9427', '94', 'Kab. Supiori'),
	('9428', '94', 'Kab. Mamberamo Raya'),
	('9429', '94', 'Kab. Nduga'),
	('9430', '94', 'Kab. Lanny Jaya'),
	('9431', '94', 'Kab. Mamberamo Tengah'),
	('9432', '94', 'Kab. Yalimo'),
	('9433', '94', 'Kab. Puncak'),
	('9434', '94', 'Kab. Dogiyai'),
	('9435', '94', 'Kab. Intan Jaya'),
	('9436', '94', 'Kab. Deiyai'),
	('9471', '94', 'Kota Jayapura');
/*!40000 ALTER TABLE `wilayah_kabupaten` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.wilayah_provinsi
CREATE TABLE IF NOT EXISTS `wilayah_provinsi` (
  `id` varchar(2) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `id_zonawilayah` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.wilayah_provinsi: ~34 rows (approximately)
DELETE FROM `wilayah_provinsi`;
/*!40000 ALTER TABLE `wilayah_provinsi` DISABLE KEYS */;
INSERT INTO `wilayah_provinsi` (`id`, `nama`, `id_zonawilayah`) VALUES
	('11', 'Aceh', 1),
	('12', 'Sumatera Utara', 1),
	('13', 'Sumatera Barat', 1),
	('14', 'Riau', 1),
	('15', 'Jambi', 1),
	('16', 'Sumatera Selatan', 1),
	('17', 'Bengkulu', 1),
	('18', 'Lampung', 1),
	('19', 'Kepulauan Bangka Belitung', 1),
	('21', 'Kepulauan Riau', 1),
	('31', 'Dki Jakarta', 2),
	('32', 'Jawa Barat', 2),
	('33', 'Jawa Tengah', 2),
	('34', 'Di Yogyakarta', 2),
	('35', 'Jawa Timur', 2),
	('36', 'Banten', 3),
	('51', 'Bali', 3),
	('52', 'Nusa Tenggara Barat', 3),
	('53', 'Nusa Tenggara Timur', 3),
	('61', 'Kalimantan Barat', 3),
	('62', 'Kalimantan Tengah', 3),
	('63', 'Kalimantan Selatan', 3),
	('64', 'Kalimantan Timur', 3),
	('65', 'Kalimantan Utara', 3),
	('71', 'Sulawesi Utara', 3),
	('72', 'Sulawesi Tengah', 3),
	('73', 'Sulawesi Selatan', 3),
	('74', 'Sulawesi Tenggara', 3),
	('75', 'Gorontalo', 3),
	('76', 'Sulawesi Barat', 3),
	('81', 'Maluku', 3),
	('82', 'Maluku Utara', 3),
	('91', 'Papua Barat', 3),
	('94', 'Papua', 3);
/*!40000 ALTER TABLE `wilayah_provinsi` ENABLE KEYS */;


-- Dumping structure for table ramaga-komputer.zona_wilayah
CREATE TABLE IF NOT EXISTS `zona_wilayah` (
  `zona` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nilai_per_kilo` double DEFAULT NULL,
  PRIMARY KEY (`zona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table ramaga-komputer.zona_wilayah: ~2 rows (approximately)
DELETE FROM `zona_wilayah`;
/*!40000 ALTER TABLE `zona_wilayah` DISABLE KEYS */;
INSERT INTO `zona_wilayah` (`zona`, `nilai_per_kilo`) VALUES
	(1, 35000),
	(2, 20000),
	(3, 37000);
/*!40000 ALTER TABLE `zona_wilayah` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
