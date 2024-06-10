-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Jun 2024 pada 12.26
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_katalog`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(11) NOT NULL,
  `id_pengguna` int(11) DEFAULT NULL,
  `Id_oleh_oleh` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id_cart`, `id_pengguna`, `Id_oleh_oleh`) VALUES
(108, 24, '1'),
(109, 24, 'z'),
(110, 24, 'z'),
(111, 24, 'z'),
(112, 24, 'z'),
(113, 24, '9'),
(114, 24, '9'),
(115, 24, '9'),
(116, 24, '9'),
(117, 24, 'C'),
(118, 24, 'C'),
(119, 26, '4'),
(120, 26, '7'),
(121, 26, 'E');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_oleh_oleh`
--

CREATE TABLE `kategori_oleh_oleh` (
  `Id_Kategori` char(10) NOT NULL,
  `Nama_Kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori_oleh_oleh`
--

INSERT INTO `kategori_oleh_oleh` (`Id_Kategori`, `Nama_Kategori`) VALUES
('1', 'Makanan'),
('2', 'Minuman'),
('3', 'Kerajinan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oleh_oleh`
--

CREATE TABLE `oleh_oleh` (
  `Id_oleh_oleh` char(10) NOT NULL,
  `Gambar` text DEFAULT NULL,
  `Nama_oleh_oleh` varchar(50) DEFAULT NULL,
  `Harga` float DEFAULT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Id_Kategori` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `oleh_oleh`
--

INSERT INTO `oleh_oleh` (`Id_oleh_oleh`, `Gambar`, `Nama_oleh_oleh`, `Harga`, `Deskripsi`, `Id_Kategori`) VALUES
('1', 'se\'i babi.jpg', 'Se\'i Babi 500 gr', 200000, 'se\'i babi adalah makanan khas dari NTT yang terbuat dari daging babi (Non Halal) diolah dengan cara di asapi sampai mengeluarkan aroma yang khas', '1'),
('3', 'Jagung Titi.jpg', 'Jagung Titi  100 gr', 30000, 'Camilan yang terbuat dari jagung yang dititi / dipipihkan dan memiliki rasa gurih manis', '1'),
('4', 'Rebok.jpg', 'Rebok 100 gr', 50000, 'Rebok merupakan makanan yang terbuat dari campuran tepung jagung atau beras dengan gula yang di tumbuk didalam alu agu ngencung dan memiliki cita rasa yang manisnikamt\r\n', '1'),
('5', 'Roti Kompiang.jpg', 'Roti Kompiang isi 10', 50000, 'Roti khas dari Manggarai yang memiliki taburan wijen diatasnya, memiliki rasa manis dan sedikit gurih', '1'),
('6', 'teh kelor.jpg', 'Teh Celup Daun Kelor', 25000, 'Produk Teh yang dibuat dari perpaduan daun kelor dan jeruk nipis yang telah dikeringkan. Kandungan yang terdapat pada produk ini baik bagi sistem kekebelan tubuh, memperlancar metabolisme, tubuh, juga dapat menstabilkan berat badan.', '2'),
('7', 'gula semut.jpg', 'Gula Semut Pulau Rote 50 gr', 50000, 'Gula semut adalah makanan yang terbuat dari nira atau hasil sadapan pada daun lontar, kemudian dimasak lalu di gosok menggunakan batok kelapa hingga menjadi serbuk.', '2'),
('8', 'kopi colol.jpg', 'Kopi Manggarai 100 gr', 50000, 'Kopi khas Manggarai Colol yang terbuat dari biji kopi pilihan yang berkualitas ', '2'),
('9', 'tuak.jpg', 'Tuak khas NTT 600 ml', 80000, 'Tuak merupakan minuman hasil fermentasi air pohon aren yang memiliki cita rasa manis dan sedikit asam serta terdepat sedikit kandungan alkohol', '2'),
('A', 'Kain Songke.jpg', 'Kain Songke', 800000, 'Kain tenun yang berasal dari Manggarai yang memiliki motif yang sangat beragam yang biasa digunakan masyarakat sekitar dalam upacara adat.', '3'),
('B', 'Kain Tenun Ikat.jpg', 'Kain Tenun Ikat', 1000000, 'Kain Tenun ikat berasal dari sumba,NTT yang proses pembuatannya masih tradisional , ditenun dari helaian benang pakan atau benang lungsin yang sebelumnya diikat dan dicelupkan ke dalam zat pewarna alami.\n', '3'),
('C', 'mamuli satu set.jpg', 'Mamuli satu set', 250000, 'Mamuli adalah perhiasan kuno khas Pulau Sumba berbentuk unik yang tergolong langka. Mamuli berupa anting-anting dan kalung, bentuk dasarnya menyerupai simbol omega, rahim atau kelamin perempuan.', '3'),
('D', 'madu.jpg', 'Madu Khas NTT  100 ml', 75000, 'Madu khas NTT merupakan madu asli 100% yang diambil dari pepohonan tinggi di pedalaman Pulau Timor yang memiliki kualitas Madu terbaik ke-3 di dunia, setelah Yunani dan Australia.', '2'),
('E', 'Patung Komodo.jpg', 'Patung Komodo', 300000, 'Nusa Tenggara Timur terkenal dengan icon hewan khas nya yaitu \"Komodo\". Sehingga untuk tetap melestarikan ke khasan tersebut para pengerajin membuat patung komodo sebagai salah satu oleh-oleh khas dari daerah ini.', '3'),
('F', 'Sasando.jpg', 'Sasando', 800000, 'Sasando alat musik yang berasal dari Nusa Tenggara Timur merupakan alat musik yang di mainkan dengan cara di petik. Alat musik ini  terbuat dari daun lontar yang melengkung dan berbentuk setengah lingkaran serta memiliki suara yang khas.', '3'),
('S', 'gelang.jpg', 'Gelang kain', 10000, 'Gelang yang terbuat dari tenun khas NTT memiliki berbagai macam motif dan ukuran.bagus', '3'),
('z', 'sopi.jpg', 'sopi khas NTT', 75000, 'Bahan baku untuk pembuatan sopi umumnya sama yakni dari pohon lontar. Pohon lontar yang sudah mengasilkan nira, (air), diambil kemudian dikumpulkan dan di biarkan beberapa waktu dalam wadah yang sudah dicampur dengan akar kayu, atau kulit kayu, kemudian disuling hingga menjadi sopi.', '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password`, `role`) VALUES
(1, 'tasya', '$2y$10$CjY8DEC1nwmAhY0WmKgNmeZWJXJ9GNAcqbWlFeuRZhn', 0),
(3, 'ayus', '$2y$10$53HIxr8QzjyCF.r42OX48OieYNSKOHT7R57YS04omwCZfCpbkukR6', 0),
(4, 'diane', '$2y$10$mYKpnY8.y046XKmLcIHKQehIN/5.66LUZx3YYIImKXl8p/0sHWHsq', 0),
(17, 'admin', '$2y$10$uF5gGmmJ4MUo.KTksxhFyeAdk5wjGlKAy5iBepRa/Y6Um/IoZBmzy', 1),
(24, 'aril', '$2y$10$9LuY8BXIRBfarLMh4zVKpOYWitVMvyGzsIrfD4F/lq3cYhw.rzRD2', 0),
(25, 'selena', '$2y$10$L9rTzBa2LcktSGU0.Sdk3OZVKmYJhrnimnwAPaV96n7MeP8iaEM46', 0),
(26, 'nana', '$2y$10$07vLdGXx698yzT8VPnv4ceDQv4xSnXm6w57y4dqQ3hDFioxPXeiam', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `id_pengguna` (`id_pengguna`),
  ADD KEY `Id_oleh_oleh` (`Id_oleh_oleh`);

--
-- Indeks untuk tabel `kategori_oleh_oleh`
--
ALTER TABLE `kategori_oleh_oleh`
  ADD PRIMARY KEY (`Id_Kategori`);

--
-- Indeks untuk tabel `oleh_oleh`
--
ALTER TABLE `oleh_oleh`
  ADD PRIMARY KEY (`Id_oleh_oleh`),
  ADD KEY `Id_Kategori` (`Id_Kategori`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`Id_oleh_oleh`) REFERENCES `oleh_oleh` (`Id_oleh_oleh`);

--
-- Ketidakleluasaan untuk tabel `oleh_oleh`
--
ALTER TABLE `oleh_oleh`
  ADD CONSTRAINT `oleh_oleh_ibfk_1` FOREIGN KEY (`Id_Kategori`) REFERENCES `kategori_oleh_oleh` (`Id_Kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
