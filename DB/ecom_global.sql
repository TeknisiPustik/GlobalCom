/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - ecom_global
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ecom_global` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `ecom_global`;

/*Table structure for table `katalog` */

DROP TABLE IF EXISTS `katalog`;

CREATE TABLE `katalog` (
  `id_katalog` int(11) NOT NULL AUTO_INCREMENT,
  `nama_katalog` varchar(64) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `deskripsi` text NOT NULL,
  PRIMARY KEY (`id_katalog`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `katalog` */

insert  into `katalog`(`id_katalog`,`nama_katalog`,`slug`,`deskripsi`) values 
(10,'LAPTOP','LAPTOP',''),
(11,'MONITOR','MONITOR',''),
(12,'AKSESORIS','AKSESORIS',''),
(13,'PRINTER','PRINTER','');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `resi` varchar(16) NOT NULL,
  `pembeli_id` int(11) NOT NULL,
  `total_harga` double(16,0) NOT NULL,
  `status` enum('0','1','2') NOT NULL,
  `kirim_ke` text NOT NULL,
  `terbaca` enum('0','1','2') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `order` */

insert  into `order`(`id_order`,`resi`,`pembeli_id`,`total_harga`,`status`,`kirim_ke`,`terbaca`,`created_at`,`updated_at`) values 
(14,'1492986210',0,150000,'0','SP 2A KOTA TERNATE, KOTA : TERNATE, PROFINSI : MALUKU UTARA, KODEPOS : 1234567','0','2017-04-24 00:23:30','2017-04-24 00:23:30'),
(15,'1492986242',0,70000,'0','SP 2A KOTA TERNATE, KOTA : TERNATE, PROFINSI : MALUKU UTARA, KODEPOS : 1234567','0','2017-04-24 00:24:02','2017-04-24 00:24:02'),
(16,'1492986284',0,120000,'0','SP 2A KOTA TERNATE, KOTA : TERNATE, PROFINSI : MALUKU UTARA, KODEPOS : 1234567','0','2017-04-24 00:24:44','2017-04-24 00:24:44'),
(17,'1492986338',0,70000,'0','SP 2A KOTA TERNATE, KOTA : TERNATE, PROFINSI : MALUKU UTARA, KODEPOS : 1234567','0','2017-04-24 00:25:38','2017-04-24 00:25:38'),
(18,'1492986376',0,150000,'0','SP 2A KOTA TERNATE, KOTA : TERNATE, PROFINSI : MALUKU UTARA, KODEPOS : 1234567','0','2017-04-24 00:26:16','2017-04-24 00:26:16'),
(19,'1492986445',0,250000,'0','SP 2A KOTA TERNATE, KOTA : TERNATE, PROFINSI : MALUKU UTARA, KODEPOS : 1234567','0','2017-04-24 00:27:25','2017-04-24 00:27:25'),
(20,'1704274514',3,22700514,'2','GEDONG TATAAN, KOTA : LAMPUNG, PROFINSI : LAMPUNG, KODEPOS : 314141','0','2024-01-03 16:40:03','2024-01-03 10:35:14'),
(21,'1704274923',3,4000923,'0','GEDONG TATAAN, KOTA : LAMPUNG, PROFINSI : LAMPUNG, KODEPOS : 314141','0','2024-01-03 10:42:03','2024-01-03 10:42:03');

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `id_ordetail` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `produk_harga` double(16,0) NOT NULL,
  `qty` tinyint(4) NOT NULL,
  `subtotal` double(16,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_ordetail`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `orderdetail` */

insert  into `orderdetail`(`id_ordetail`,`order_id`,`produk_id`,`produk_harga`,`qty`,`subtotal`,`created_at`) values 
(1,1,12,70000,1,70000,'2017-03-26 10:59:28'),
(2,2,12,70000,1,70000,'2017-03-26 11:02:59'),
(3,3,12,70000,1,70000,'2017-03-26 11:06:55'),
(4,4,6,220000,2,440000,'2017-03-28 06:23:34'),
(5,5,10,150000,1,150000,'2017-03-28 06:26:23'),
(6,6,12,70000,1,70000,'2017-04-28 04:32:54'),
(7,7,8,250000,1,250000,'2017-04-28 04:37:14'),
(8,8,12,70000,1,70000,'2017-04-28 04:40:53'),
(9,9,9,220000,1,220000,'2017-04-28 04:45:52'),
(10,10,6,220000,1,220000,'2017-04-30 04:11:45'),
(11,11,11,120000,1,120000,'2017-04-30 04:34:58'),
(12,12,5,11880,1,11880,'2017-04-30 04:41:49'),
(13,13,10,150000,1,150000,'2017-04-24 00:13:10'),
(14,14,10,150000,1,150000,'2017-04-24 00:23:30'),
(15,15,12,70000,1,70000,'2017-04-24 00:24:03'),
(16,16,11,120000,1,120000,'2017-04-24 00:24:44'),
(17,17,12,70000,1,70000,'2017-04-24 00:25:38'),
(18,18,10,150000,1,150000,'2017-04-24 00:26:16'),
(19,19,8,250000,1,250000,'2017-04-24 00:27:25'),
(20,20,17,4000000,2,8000000,'2024-01-03 10:35:14'),
(21,20,18,9000000,1,9000000,'2024-01-03 10:35:14'),
(22,20,16,5700000,1,5700000,'2024-01-03 10:35:14'),
(23,21,17,4000000,1,4000000,'2024-01-03 10:42:03');

/*Table structure for table `orderkonfirm` */

DROP TABLE IF EXISTS `orderkonfirm`;

CREATE TABLE `orderkonfirm` (
  `id_orkonfirm` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `resi` varchar(16) NOT NULL,
  `metode` varchar(16) NOT NULL,
  `tujuan` varchar(16) NOT NULL,
  `atasnama` varchar(128) NOT NULL,
  `dari` varchar(16) NOT NULL,
  `rekening` varchar(32) NOT NULL,
  `tanggal_transfer` date NOT NULL,
  `terbaca` enum('0','1') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_orkonfirm`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `orderkonfirm` */

insert  into `orderkonfirm`(`id_orkonfirm`,`order_id`,`resi`,`metode`,`tujuan`,`atasnama`,`dari`,`rekening`,`tanggal_transfer`,`terbaca`,`created_at`) values 
(2,20,'1704274514','','Mandiri','Yusuf','BRI','1234567890','2024-01-03','0','2024-01-03 10:40:03');

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pelanggan` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `alamat` text NOT NULL,
  `kota` varchar(64) NOT NULL,
  `profinsi` varchar(32) NOT NULL,
  `kodepos` varchar(8) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `pelanggan` */

insert  into `pelanggan`(`id_pelanggan`,`nama_pelanggan`,`email`,`phone`,`alamat`,`kota`,`profinsi`,`kodepos`,`password`,`created_at`,`updated_at`) values 
(3,'Yusuf Ridho','ridho@gmail.coom','123','Gedong Tataan','Lampung','Lampung','314141','202cb962ac59075b964b07152d234b70','2024-01-03 10:10:48','2024-01-03 10:10:48');

/*Table structure for table `pengaturan` */

DROP TABLE IF EXISTS `pengaturan`;

CREATE TABLE `pengaturan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namasitus` varchar(255) NOT NULL,
  `metatag` text NOT NULL,
  `metadeskripsi` text NOT NULL,
  `logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `pengaturan` */

/*Table structure for table `produk` */

DROP TABLE IF EXISTS `produk`;

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL AUTO_INCREMENT,
  `katalog_id` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `permalink` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga_jual` double(16,0) NOT NULL,
  `harga_coret` double(16,0) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `produk` */

insert  into `produk`(`id_produk`,`katalog_id`,`nama_produk`,`permalink`,`stok`,`harga_jual`,`harga_coret`,`gambar`,`deskripsi`,`created_at`,`updated_at`) values 
(14,10,'AXIOO PONGO','axioo-pongo',10,15000000,5,'axioo_pongo_1704272692.jpg','Processor : Intel Core i7-11700 octa-core (16 thread) 2,5 GHz TurboBoost 4,9GHz\r\nDisplay : 16.1 inci resolusi full HD IPS 1920 x 1080 piksel, 100% sRGB Color Gamut, 250 nits brightness, 144Hz refresh rate\r\nRAM : 16GB DDR4 3200MHz dual-channel, upgradeable to 64GB DDR4\r\nStorage : 512GB SSD PCIe 3.0 x4 M.2 NVMe, 1x SATA3 6.0 Gb/s Connectors\r\nGraphics : Nvidia GeForce RTX 3070 VRAM 8GB GDDR6\r\nKeyboard : Customizable Multi-Color Backlit Keyboard\r\nWireless : Wi-Fi 6 Intel AX201 (802.11ax) 2×2, Bluetooth 5.2\r\nPorts : 1 x USB 3.2 Gen 2 port (Type C); 1 x USB 3.2 Gen 2 port (Type A); 1 x USB 3.2 Gen 1 port (Type A); 1 x USB 2.0 port; 2 x Mini Display 1.4 port; 1 x HDMI output port (with HDCP),;1 x 2-in-1 3.5mm Audio Jack (Headphone / Microphone); 1 x 2-in-1 3.5mm Audio Jack (Microphone / S/PDIF optical); 1 x SDCard reader; 1 x DC-in jack\r\nCamera Front 1.0M HD video camera\r\nAudio : 2 x Speakers\r\nBaterai : 6-cell, 56 Whr Smart Li-ion battery\r\nColor : Black\r\nOperating System : Windows 11','2024-01-03 16:38:00','2024-01-03 10:06:09'),
(15,10,'ASUS Zenbook','asus-zenbook',1,11000000,0,'asus_zenbook_1704272950.jpg','Intel® Core™ i5-13500H Processor 2.6 GHz (18MB Cache, up to 4.7 GHz, 12 cores, 16 Threads)\r\nIntel® Iris Xe Graphics\r\n16GB LPDDR5 on board\r\n1TB M.2 NVMe™ PCIe® 4.0 Performance SSD\r\n14.0-inch, 2.8K (2880 x 1800) OLED 16:10 aspect ratio, 0.2ms response time, 90Hz refresh rate, 400nits, 550nits HDR peak brightness, 100% DCI-P3 color gamut, 1,000,000:1, VESA CERTIFIED Display HDR True Black 500, 1.07 billion colors, PANTONE Validated, Glossy display, 70% less harmful blue light, TÜV Rheinland-certified, SGS Eye Care Display, Touch screen, (Screen-to-body ratio)90%, With stylus support\r\n','2024-01-03 10:09:10','2024-01-03 10:09:10'),
(16,10,'AXIOO MyBook','axioo-mybook',10,6000000,5,'axioo_mybook_1704273746.jpg','Processor : Intel Celeron N4020 ( 1.10 GHz; 4M Cache; up to 2.80 GHz )\r\nDisplay : 13.3? IPS 2.5K (2560×1600)\r\nMemory : RAM 4GB DDR4\r\nStorage : 256GB SSD\r\nGraphics : Integrated Intel UHD Graphics\r\nWireless : WiFi + BT4.0\r\nHiRes Webcam\r\nOperating System : Windows 10 Pro','2024-01-03 16:37:49','2024-01-03 10:22:26'),
(17,13,'Brodher Printer','brodher-printer',9,4000000,0,'brodher_printer_1704274007.jpg','A4, Letter, A5, A5(Long Edge), A6, Executive, Legal, Folio, Mexico Legal, India Folio\r\nUp to 250 sheets of 80 gsm plain paper\r\nLaser Printer\r\n356 mm x 360 mm x 183 mm','2024-01-03 16:42:03','2024-01-03 10:26:47'),
(18,13,'Brother MFC-T4500DW','brother-mfc-t4500dw',10,9000000,0,'brother_mfc-t4500dw_1704274293.jpg','Solusi Cetak Efisien - Printer A3 Multifungsi dengan Sistem Refill Ink Tank. Konektivitas Wireless & Ethernet, Cetak Warna Bolak-Balik Otomatis, ADF - Scan/Copy/Fax.  Didesain secara profesional untuk Mencetak Secara Cepat, Hemat Biaya, dan tetap Memiliki Kualitas Cetak Foto yang Brilian dengan Botol Tinta Ultra High Yield. Wi-Fi Direct, Mobile & USB Print.','2024-01-03 16:37:57','2024-01-03 10:33:08'),
(19,12,'Mouse Rexsus Rx-108','mouse-rexsus-rx-108',100,130000,0,'mouse_rexsus_rx-108_1704299055.jpg','','2024-01-03 17:24:15','2024-01-03 17:24:15'),
(20,12,'Cliptec','cliptec',100,100000,0,'cliptec_1704299159.jpg','Wirelles Mouse','2024-01-03 17:25:59','2024-01-03 17:25:59'),
(21,12,'Speaker Selena','speaker-selena',100,90000,0,'speaker_selena_1704299266.jpg','','2024-01-03 17:27:46','2024-01-03 17:27:46');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`nama`,`email`,`phone`,`created_at`) values 
(1,'admin','21232f297a57a5a743894a0e4a801fc3','Administrator','administrator@admin.com','08123456789','2017-04-24 05:22:06');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
