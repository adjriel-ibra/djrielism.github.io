-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 03 Mar 2025 pada 09.25
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jual_beli`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `Buyers`
--

CREATE TABLE `Buyers` (
  `buyer_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `buyer_address` text NOT NULL,
  `buyer_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `Buyers`
--

INSERT INTO `Buyers` (`buyer_name`, `email`, `password`, `buyer_address`, `buyer_number`) VALUES
('Adjriel ibra', 'adj@amikom', '123', 'dekat tambak boyo', '081212121212'),
('admin', 'admin@amikom', 'admin', 'rumah admin', '123123123'),
('anas alawy', 'alwy@amikom', '123', 'dekat tambak boyo', '081313131313'),
('buyer1', 'buyer1@amikom', 'buyer123', 'dalam kampus amikom', '321321'),
('buyer2', 'buyer2@amikom', 'buyer123', 'belakang kampus', '321321'),
('putri nadiah', 'nadiah@amikom', '123', 'jauh dari amikom', '081717171717'),
('raihan wahyu', 'godrong@amikom', '123', 'klaten, jawa tengah', '081414141414'),
('zahwa erliandara', 'zahwa@amikom', '123', 'dekat amikom', '081616161616');

-- --------------------------------------------------------

--
-- Struktur dari tabel `Carts`
--

CREATE TABLE `Carts` (
  `cart_id` int(11) NOT NULL,
  `buyer_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `Carts`
--

INSERT INTO `Carts` (`cart_id`, `buyer_name`) VALUES
(2, 'admin'),
(1, 'buyer1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `Cart_Items`
--

CREATE TABLE `Cart_Items` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `Cart_Items`
--

INSERT INTO `Cart_Items` (`cart_item_id`, `cart_id`, `product_id`, `quantity`, `total_price`) VALUES
(26, 1, 123, 1, 34500),
(28, 1, 139, 1, 230000),
(31, 1, 144, 1, 294000),
(37, 1, 149, 1, 229900),
(38, 1, 128, 1, 45000),
(40, 1, 118, 1, 35600),
(43, 1, 117, 1, 19500),
(44, 2, 139, 2, 460000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `Chat`
--

CREATE TABLE `Chat` (
  `chat_id` int(11) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `chat_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `Chat`
--

INSERT INTO `Chat` (`chat_id`, `sender`, `receiver`, `message`, `chat_time`) VALUES
(663, 'buyer1', 'seller1', 'pengetesan aplikasi chatting', '2024-11-29 14:14:33'),
(664, 'seller1', 'buyer1', 'lancar boskuuuuuuuu', '2024-11-29 14:14:47'),
(665, 'seller1', 'buyer1', 'cek lagi 123', '2024-11-29 19:48:10'),
(666, 'buyer1', 'seller1', 'amann', '2024-11-29 19:48:17'),
(667, 'buyer1', 'seller1', 'test', '0000-00-00 00:00:00'),
(668, 'buyer1', 'seller1', 'p', '2024-12-08 15:31:46'),
(669, 'buyer1', 'seller1', 'test', '2024-12-08 15:32:10'),
(673, 'buyer1', 'seller2', 'thanks', '2024-12-09 10:59:01'),
(674, 'buyer1', 'Anas Alawy', 'p', '2024-12-09 14:32:52'),
(675, 'buyer1', 'Adjriel Ibra', 'test', '2024-12-09 14:34:14'),
(676, 'buyer1', 'seller1', 'p', '2024-12-09 16:40:47'),
(677, 'seller1', 'buyer1', 'p', '2024-12-09 16:40:52'),
(678, 'buyer1', 'seller1', 'test', '2024-12-15 00:13:17'),
(679, 'buyer1', 'buyer1', 'test', '2024-12-15 00:36:41'),
(680, 'seller1', 'buyer1', 'test terooss', '2024-12-15 02:08:51'),
(681, 'seller1', 'buyer1', 'test', '2024-12-15 02:08:56'),
(682, 'buyer1', 'seller1', 'p', '2024-12-15 02:09:04'),
(683, 'seller1', 'buyer1', 'ga sengaja', '2024-12-15 02:09:12'),
(684, 'buyer1', 'seller1', 'wkwkwkwk', '2024-12-15 02:09:21'),
(685, 'seller1', 'buyer1', 'test', '2024-12-15 02:09:38'),
(686, 'seller1', 'buyer1', 'test', '2024-12-15 22:04:54'),
(687, 'seller1', 'buyer1', 'anjay', '2024-12-15 22:05:01'),
(688, 'buyer1', 'seller1', 'test', '2024-12-15 22:05:24'),
(689, 'Zahwa erliandara', 'buyer1', 'test', '2024-12-16 23:39:10'),
(690, 'buyer1', 'Zahwa erliandara', 'test', '2024-12-16 23:39:35'),
(691, 'Zahwa erliandara', 'buyer1', 'test', '2024-12-16 23:39:45'),
(692, 'admin', 'admin', 'test chatting hari senin, 13 januari 2025', '2025-01-13 11:08:41'),
(693, 'Adjriel Ibra', 'admin', 'test', '2025-01-13 11:10:36'),
(694, 'admin', 'Adjriel Ibra', 'test chatting hari senin, 13 januari 2025', '2025-01-13 11:11:37'),
(695, 'Adjriel Ibra', 'admin', 'test fitur chatting dari seller Adjriel Ibra', '2025-01-13 11:12:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `Products`
--

CREATE TABLE `Products` (
  `product_id` int(11) NOT NULL,
  `seller_name` varchar(225) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_desc` text DEFAULT NULL,
  `product_price` int(10) NOT NULL,
  `product_stock` int(11) DEFAULT 0,
  `product_img` varchar(255) DEFAULT NULL,
  `product_category` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `Products`
--

INSERT INTO `Products` (`product_id`, `seller_name`, `product_name`, `product_desc`, `product_price`, `product_stock`, `product_img`, `product_category`) VALUES
(4, 'Zahwa erliandara', 'Eprise Journee Daryan Dress 115314518', 'Eprise, fashion terbaik untuk lengkapi penampilanmu. Hadirkan kenyamanan dengan sentuhan material yang soft dan berkualitas. Memiliki desain simpel untuk gaya semakin modis.', 282000, 67, 'uploads/Eprise Journee Daryan Dress 115314518.png', 'womens'),
(5, 'Zahwa erliandara', 'INVIO Maisie Puﬀ Shoulder Shirt Soft Pink _ Kemeja Wanita', 'If you love classic shirt tailoring but want a bit more sophistication, then you are going to love this Maisie Shirt with puﬀed shoulder and long sleeves. Designed for a slightly slim fit, it has a straight point collar and covered tonal buttons that will add a lavish and dramatic feel to your everyday wear.', 350000, 87, 'uploads/INVIO Maisie Puﬀ Shoulder Shirt Soft Pink _ Kemeja Wanita.png', 'womens'),
(6, 'Zahwa erliandara', 'INVIO x Anissa Aziza Emily Two-Piece Blouse Set _ Atasan Wanita', 'The Emily Blouse set is a chic two-piece ensemble featuring a sheer organza button-up shirt paired with a structured tube vest. The shirt is designed with a classic collar, cuffed sleeves, and delicate fabric covered buttons, adding a touch of elegance to the translucent fabric.\r\nThe vest, crafted in a blush shade of pink fabric with a curved hem, complements the airy blouse and provides a subtle layer of sophistication. Sold as one cohesive set, the Emily Blouse Set offers versatile options, perfect for both formal and casual occasions where a hint of refinement and luxury is desired.', 534000, 53, 'uploads/INVIO x Anissa Aziza Emily Two-Piece Blouse Set _ Atasan Wanita.png', 'womens'),
(7, 'Zahwa erliandara', 'Love, Bonito - Blazer Wanita - Audrey Tailored Cape Blazer', 'She doesn\'t need to say a word she screams badassery, even when she\'s not talking. Audrey\'s well-constructed silhouette helps you look the most polished, even if you\'ve been racing through your deck at 4am. But don\'t let her fool you: she\'s lightweight and breathable, enough to make people wonder how easy you do it. Comes with front pockets and a front clasp closure.', 725000, 34, 'uploads/Love, Bonito - Blazer Wanita - Audrey Tailored Cape Blazer.png', 'womens'),
(8, 'Zahwa erliandara', 'Love, Bonito - Dress Wanita - Abelia Ruched Babydoll Dress - Clay', 'Lempar dan pergi untuk kencan makan siang itu. Mini dress ini menampilkan siluet babydoll dan garis leher persegi. Termasuk lengan bengkak ruched dan saku samping fungsional. Dilengkapi dengan ritsleting di belakang.', 419000, 67, 'uploads/Love, Bonito - Dress Wanita - Abelia Ruched Babydoll Dress - Clay.png', 'womens'),
(9, 'Zahwa erliandara', 'Love, Bonito - Romper Wanita - Boxy Collared Belted Romper', 'Weekends were made for this. Features a boxy silhouette for a roomy, vacation-ready fit, and a detachable sash for easy post-bloat adjustments. Closes with a back zip.', 755000, 45, 'uploads/Love, Bonito - Romper Wanita - Boxy Collared Belted Romper.png', 'womens'),
(10, 'Zahwa erliandara', 'This Is April Atasan Rajut Wanita Lengan Panjang Kekinian Alivia Knit Top', 'Baju wanita lengan panjang berkerah V-neck dari bahan rajut adalah pilihan yang nyaman dan modis. Desain kerah V-neck memberikan kesan leher yang lebih panjang dan ramping, sementara lengan panjang memberikan tampilan yang lebih terstruktur dan elegan. Baju ini bisa dipadupadankan dengan berbagai pilihan bawahannya, seperti jeans, rok, atau celana panjang, dan cocok untuk acara kasual, santai, maupun semi-formal.\r\nproduct tag : outfit cafe, outfit date, outfit mall, outfit hangout, outfit kampus, hijab friendly.\r\n', 279000, 67, 'uploads/This Is April Atasan Rajut Wanita Lengan Panjang Kekinian Alivia Knit Top.png', 'womens'),
(11, 'Zahwa erliandara', 'This Is April Kemeja Wanita Lengan Panjang Kekinian Zayla Top Red A600913121', 'Kemeja wanita lengan panjang ini terbuat dari bahan cotton yang nyaman dan breathable. Desainnya dihiasi dengan motif bunga yang memberi kesan feminine. Bagian belakang kemeja sedikit lebih panjang, menciptakan siluet asimetris yang modern dan stylish. Kemeja ini juga dilengkapi dengan kancing di bagian lengan. Dengan tampilan yang chic dan praktis, kemeja ini cocok dipadukan dengan berbagai celana atau rok untuk tampilan kasual atau semi-formal yang elegan.', 259000, 56, 'uploads/This Is April Kemeja Wanita Lengan Panjang Kekinian Zayla Top Red A600913121.png', 'womens'),
(12, 'Zahwa erliandara', 'This Is April Midi Dress Wanita Lengan Pendek Kekinian Enola Dress C30090902100', 'Midi dress wanita dengan lengan pendek dilengkapi dengan tali di bagian belakang yang bisa diikat. Lengan berbentuk balon memberikan kesan modis dan lebih bervolume dan di bagian bawah lengan terdapat karet. Dress ini juga dilengkapi dengan furing, namun tetap di sarankan untuk menggunakan inner saat pemakaian. Dress ini cocok untuk berbagai acara, baik acara formal, semi-formal, maupun kasual. ', 279000, 68, 'uploads/This Is April Midi Dress Wanita Lengan Pendek Kekinian Enola Dress C30090902100.png', 'womens'),
(102, 'Zahwa erliandara', 'Josephine Anni - Hera Polo Top', 'Hera Polo top offers a comfortable feel when worn since it was made from cotton yarn in thick rib knitting style, designed for a relaxed fit. The sailor collar detail and half-zip closure add a unique touch. Available in rich bordeaux and brown, it\'s a perfect staple piece for daily wear', 650000, 12, 'uploads/Josephine Anni - Hera Polo Top.png', 'womens'),
(103, 'Zahwa erliandara', 'Josephine Anni - Bisous Top', 'The Bisous Top is a captivating blend of elegance and modernity. Its structured yet comfortable fit offers a flattering silhouette, while the curved sleeves and peplum shape add a touch of playful sophistication. The scarf-like neckline completes the feminine look. The button opening and back zipper provide convenient closures. With its fresh and unique design, the Bisous Top is a perfect choice for making a statement', 540000, 23, 'uploads/Josephine Anni - Bisous Top.png', 'womens'),
(104, 'Zahwa erliandara', 'Josephine Anni - Sophia Skirt\r\n', 'Carefully crafted from the finest semi-wool material, Sophia Skirt is a seamless blend of modernity and sophistication. With A-line silhouette and comfortable midi length, this skirt features a high waist cut with flap pockets on the hipline and adjustable belt on the side for a polished look. The asymmetrical front layer adds a dynamic dimension to the overall body line, making it the perfect statement piece for any occasion.', 460000, 24, 'uploads/Josephine Anni - Sophia Skirt.png', 'womens'),
(105, 'Zahwa erliandara', 'INVIO x Jennifer Christie - Jullie Pleated Dress | Gaun Wanita', 'The elegant Jullie Pleated Dress is designed in a classic feminine silhouette with pleats on the side. Made from    the finest flowy material and cut on the waist that accentuates your body line. It has notched lapels, a double-breasted closure, and 6 pearl buttons at the front and cuffs. Wear it as it is or style it as an outer with your favorite top and bottom', 468000, 20, 'uploads/INVIO x Jennifer Christie - Jullie Pleated Dress | Gaun Wanita.png', 'womens'),
(106, 'Zahwa erliandara', 'INVIO Finley Waistband Trouser | Celana Wanita - Metropolis', 'An enduring silhouette, the straight-leg Finley Trouser is designed to flatter with its pleat detailing and horn-effect button detail on the extended waistband. Sitting high on the waist, front and back leg creases guarantee polished finishes with belt loops and side pockets adding functionality. Set to become your daily go-to bottom, button up with any of our blouses and shirts to energize your work week.', 350000, 20, 'uploads/INVIO Finley Waistband Trouser | Celana Wanita - Metropolis.png', 'womens'),
(107, 'Zahwa erliandara', 'This Is April Celana Panjang Kulot Wanita Kekinian Addison Pants', 'Celana panjang kulot ini dirancang dengan model yang lebar dan nyaman, memberikan kesan santai namun tetap modis. Bagian pinggang dilengkapi dengan karet elastis full, yang memastikan celana tetap nyaman dipakai sepanjang hari, dengan penyesuaian yang fleksibel. Di bagian depan, celana ini dilengkapi dengan kancing dan resleting hidup yang fungsional, memberikan tampilan lebih terstruktur dan mudah dipakai.Celana ini juga dilengkapi dengan kantong di bagian depan, menambah elemen praktis untuk menyimpan barang-barang kecil Anda. Desainnya sedikit menerawang, memberikan efek ringan dan kasual. Oleh karena itu, disarankan untuk mengenakan dalaman atau legging untuk kenyamanan dan penampilan yang lebih maksimal.Dengan tampilan yang simpel namun tetap stylish, celana kulot ini dapat dipadukan dengan berbagai jenis atasan, seperti kaos, blus, atau bahkan tunik, untuk menciptakan berbagai gaya yang cocok untuk acara santai maupun semi-formal.', 280000, 30, 'uploads/This Is April Celana Panjang Kulot Wanita Kekinian Addison Pants.png', 'womens'),
(108, 'Zahwa erliandara', 'Merche Tas Bahu Wanita Alice Large', 'Introducing the Alice Large Totebag, the ultimate companion for every occasion. Crafted with premium nylon, waterproof materials, this totebag ensures your belongings stay dry and protected, no matter the weather. Its spacious interior provides ample room for all your Big Stuff, from your daily necessities to your gym gear, making it perfect for work, travel, and everything in between', 350000, 30, 'uploads/Merche Tas Bahu Wanita Alice Large.png', 'womens'),
(109, 'Zahwa erliandara', 'Paris Zoey Women Zoelle Flat Shoes Tulip PZX2223301', 'Memperkenalkan Sepatu Tunggal Wanita Paris Zoey, menampilkan desain kaki Mueller yang trendi dengan busur besar dan sol yang nyaman. Sepatu ini hadir dalam kombinasi warna coklat muda dan aprikot yang indah, sempurna untuk setiap kesempatan. Merek Paris Zoey dikenal dengan alas kaki berkualitas tinggi dan bergaya, dan sepatu tunggal ini tidak terkecuali. Mereka dibuat dengan bahan terbaik dan dibuat dengan presisi untuk memastikan kenyamanan dan daya tahan maksimal.\r\n', 140000, 20, 'uploads/Paris Zoey Women Zoelle Flat Shoes Tulip PZX2223301.png', 'womens'),
(110, 'Zahwa erliandara', 'Paris Zoey Sandal Wanita Wedges Sepatu Rosa PZX2324303', 'Paris Zoey dengan megahnya meluncurkan sandal ini, yang mengadopsi desain strap dan digunakan dengan gesper, yang simpel, nyaman, dan serbaguna. Sepatu ini menggunakan sol yang tebal sehingga setelah dipakai dapat memanjangkan proporsi tubuh anda sehingga membuat anda semakin cantik dan cantik.Merek Paris Zoey dikenal dengan alas kaki berkualitas tinggi dan bergaya, dan sepatu tunggal ini tidak terkecuali. Mereka dibuat dengan bahan terbaik dan dibuat dengan presisi untuk memastikan kenyamanan dan daya tahan maksimal.', 160000, 20, 'uploads/Paris Zoey Sandal Wanita Wedges Sepatu Rosa PZX2324303.png', 'womens'),
(111, 'Zahwa erliandara', 'skintific symwhite 377 dark spot moisturizer', 'Moisturizer dengan kandungan Symwhite 377, efektif\r\nmenyamarkan noda hitam dan mencerahkan kulit.\r\nMemiliki tekstur velvet, ringan dan mudah meresap saat\r\ndiaplikasikan, serta tidak menimbulkan rasa greasy namun\r\ntetap memberikan kelembaban yang cukup pada kulit.\r\nTriple Active Formula, dilengkapi dengan Symwhite 377\r\nGlutathione dan Tranexamic Acid yang secara signifikan\r\nmenyamarkan noda hitam membandel, bekas jerawat dan sun spots, serta mengunci kelembaban kulit. Glutathione sebagai antioksidan yang dapat membantu mencegah\r\ntanda-tanda penuaan dini.\r\nUkuran: 30 ml\r\nNo BPOM:\r\nManfaat:\r\n Mencerahkan kulit dan menyamarkan noda hitam Sebagai antioksidan yang membantu mencegah tanda-tanda penuaan dini\r\n• Melembabkan kulit wajah tanpa rasa lengket\r\n• Membantu mengontrol minyak di wajah\r\nHero Ingredients:\r\nSymWhite377 :Membantu menyamarkan noda hitam\r\nGlutathione : Sebagai antioxidant, membantu meratakan warna kulit serta menjadikan kulit tampak bercahaya\r\nTranexamic Acid : Membantu kulit tampak lebih cerah dan menyamarkan tampilan noda hitam.\r\n5× ceramide : menjaga skin barrier dan kelembab an kulit.\r\n', 99810, 20, 'uploads/skintific symwhite 377 dark spot moisturizer.jpg', 'perawatan'),
(112, 'Zahwa erliandara', 'GLAD2GLOW AHA BHA PHA INTENSIVE PEELING SOLUTION\r\n', 'GLAD2GLOW AHA BHA PHA Intensive Peeling solution,\r\nserum dengan cara dibilas, dilengkapi kandungan\r\nkombinasi AHA BHA PHA yang kuat dalam satu produk\r\nuntuk membantu mencerahkan, melembutkan dan\r\nmeratakan tekstur kulit. Dengan mengangkat sel kulit\r\nmati penyebab kekusaman kulit, serta membantu untuk\r\nmengecilkan tampilan pori-pori wajah dan membantu\r\nproses pengeringan jerawat dan menyamarkan bekas\r\njerawat pada wajah.\r\nUkuran: 15 ml / 0.5FL.0Z\r\nNo BPOM: NA11240100441\r\nManfaat:\r\nMencerahkan dan melembutkan wajah\r\nMengangkat sel kulit mati dan minyak dalam kulit\r\nMembantu untuk mengecilkan tampilan pori-pori dan\r\nmeratakan tekstur kulit\r\nMembantu proses pengeringan jerawat\r\nHero Ingredients:\r\nAHA ( Glycolic Acid + Lactic Acid)\r\nMengangkat sel kulit mati, kulit terasa lebih lembut, dan\r\ntampak lebih cerah dan bercahaya.\r\nBHA (Salicylic Acid)\r\nFormula yang mudah larut dalam minyak yang efektif\r\nuntuk membersihkan kotoran pada pori-pori.\r\nPHA ((Gluconolactone)\r\nDengan mekanisme \"Time Release\". (Molekul lebih besar dari AHA), mengelupas sel kulit mati dengan lembut, dan memberikan rasa lembab.\r\nInositol\r\nInositol yang bersumber dari tumbuhan, membantu\r\nmenyeimbangkan konsentrasi air dan garam serta\r\nmeningkatkan kejernihan/kebersihan kulit.\r\nDIPEPTIDE\r\nMembantu mengontrol minyak berlebih dan minimalisasi tampilan pori.', 47999, 30, 'uploads/GLAD2GLOW AHA BHA PHA INTENSIVE PEELING_SOLUTION.jpg', 'perawatan'),
(113, 'Zahwa erliandara', 'SKINTIFIC Mugwort Anti Pores & Acne Clay Mask', 'mengandung ekstrak Mugwort dengan kualitas terbaik\r\nuntuk melawan breakout agar kulit lebih cerah dan ceria.\r\nManfaat:\r\nMenenangkan Jerawat, Menenangkan Bruntusan, Membersihkan secara mendalam, Mengurangi kemerahan, Membersihkan pori-pori, Menghaluskan dan, menyamaratakan warna kulit, Memperbaiki skin barrier, Melembabkan dan oil control, Mengecilkan pori-pori\r\nHero Ingredients:\r\nMugwort: Mugwort adalah sebuah kandungan\r\npenyembuhan alami karena memiliki sifat menenangkan.\r\nMemiliki manfaat sebagai antibakterial, anti-fungal,\r\nanti-inflamasi, anti-aging, dan melindungi skin barrier.\r\nKandungan alami ini membantu untuk membersihkan\r\nracun, menstimulasi pembaruan kulit, dan mencerahkan\r\nkulit kusam. Dapat digunakan untuk kulit kering dan iritasi dikarenakan memberikan sensasi menenangkan untuk kulit yang sedang rusak.\r\nNiacinamide (vitamin B3): Adalah kandungan aktif yang cerdas dan multi-fungsi, dikarenakan dapat menembus lapisan luar kulit untuk memperbaiki warna kulit yang\r\ntidak merata, noda hitam, kulit kendur, pori-pori besar,mengurangi kusam, dan melindungi kulit ketika terpapar sinar UV agar kulit tampak lebih halus dan lebih muda\r\nSalicylic acid: Menembus secara mendalam ke kulit\r\nuntuk menghilangkan sel-sel kulit mati yang menyumbat pori-pori, sehingga menyebabkan jerawat. \r\n', 49400, 30, 'uploads/Skintific Mugwort Anti Pores & Acne Clay Mask.jpg', 'perawatan'),
(114, 'Zahwa erliandara', 'lavojoy Hold Me Tight Pro Shampoo Spring Wonder 280ml', 'Sampo berbasis Asam Amino dengan formula 0% silikon\r\ndan 0% sulfat yang membersihkan dengan lembut.\r\nDikombinasikan dengan ginseng, jahe, kafein dan Kopexil.\r\nMembantu mengurangi minyak berlebih, mengurangi\r\nkerontokan rambut, memperkuat akar rambut, dan\r\nmeremajakan folikel rambut.\r\nBenefit:\r\n1. Anti-hair Loss\r\nBerbagai formula pemadat rambut dan anti-rontokmemperkuat akar dan helai rambut, meningkatkan metabolisme sel kulit kepala untuk mempercepat pertumbuhan rambut secara efektif\r\n2. Gentle Cleansing\r\nFormula O silikon dan O sulfat, tidak berbahaya bagi kulit\r\nkepala; berbasis asam amino tingkat perawatan wajah,\r\npembersihan lembut tanpa iritasi\r\n3. Balance\r\nMenjaga keseimbangan kadar air-minyak kulit kepala agar\r\nrambut dapat bertumbuh dengan sehat\r\nHow To Use / Cara Pakai Shampoo:\r\nTuangkan shampoo secukupnya ke telapak tangan Anda,\r\npijatkan ke kulit kepala, lalu bilas.\r\nSpecial Ingredients:\r\nGinseng, Jahe, Angelica, Daun Arborvitae - menstabilkan\r\nakar rambut dan meningkatkan metabolisme sel kulit\r\nkepala untuk mempercepat pertumbuhan rambut secara\r\nefektif\r\nKafein - antioksidan, mengurangi DHT yang menyebabkan kerontokan rambut, dan demikian mengurangi kerontokan rambut\r\nKopexil - menutrisi folikel rambut, memperkuat rambut,\r\nmempercepat pertumbuhan rambut\r\nPerfume Description\r\n[Spring Wonder]\r\nTerre Fragrance:\r\nTop Notes: Lemon, Patchouli\r\nMiddle Notes: Cedar, Cypress\r\nBase Notes: Amber, Musk', 90100, 30, 'uploads/Lavojoy Hold Me Tight Pro Shampoo Spring Wonder 280ml.jpg', 'perawatan'),
(115, 'Zahwa erliandara', 'Facetology TripleCare Sunscreen SPF 40 PA+++ 40ml', 'Diformulasikan dengan HYBRID formulation dengan\r\nmenggabungkan kedua macam tipe UV Filters baik\r\nphysical maupun chemical memberikan perlindungan\r\nmaksimal terhadap paparan sinar UV Matahari.\r\nFacetolgy Triple Care Suncreen tidak hanya memberikan 1\r\nmanfaat, namun 3 MANFAAT sekaligus!\r\nHybrid UV Filters dan Blue Oleoactif memberikan\r\nperlindungan terhadap UV A, UV B & Blue Light\r\nCICA, Mugwort & SyriCalm menengankan dan sebagai anti\r\ninflamation agents\r\nRasakan NEW ERA OF YOUR DREAM SUNSCREEN\r\nTexture Seringan Air\r\nSensai dingin sejuk\r\nNo Drama White Cast\r\nMudah di aplikasikan ga ribet cuman 30 detik!\r\nWajah tampil fresh, ga pake lama siap beraktifitas\r\n', 70500, 30, 'uploads/Facetology TripleCare Sunscreen SPF 40 PA+++ 40ml.jpg', 'perawatan'),
(117, 'Putri Nadiah', 'Handgrip Honda Original Plus Jalu Stang Pcx Universal', 'NB : konfirmasi stok warna & motor harap chat dulu.\r\nTanpa konfirmasi stok warna dan berita, barang akan di\r\nkirim secara random.\r\nJadi sebelum beli tolong tanyakan dulu, karna stok\r\nterbatas.. BELI = SETUJU\r\nBeli berarti setuju dengan peraturan penjual.\r\nBarang yang dijual dipastikan baru.\r\nTerimakasih\r\n*Order sebelum jam 16:00 wib atau jam 4sore pesanan dikirim hari yang sama kecuali minggu atau libur nasional tidak ada pengiriman*\r\n', 19500, 30, 'uploads/ Handgrip Honda Original Plus Jalu Stang Pcx_Universal.jpg', 'otomotif'),
(118, 'Putri Nadiah', 'Sarung Jok Motor Portable Elastis Cover Pelindung Jok Terbaru Cover Jok Motor Gibsprotect\r\n', 'Sarung pelindung jok motor material bahan elastis, Tahan air Kualitas premium, Tahan terhadap goresan yg dapat merusak kulit jok motor.\r\nFleksibilitas tinggi dan anti-shedding (kesat), Desain Universal mampu menyesuaikan tipe jok motor, pemasangan portable mudah bongkar pasang.\r\nSpesifikasi Produk:\r\nBahan: Kulit PU\r\nWarna: Hitam\r\nModel : Universal Seat\r\nFiture : Double breacket lock\r\nGrafis : Printed\r\nSize :M L dan XL\r\n', 35600, 30, 'uploads/ Sarung Jok Motor Portable Elastis Cover Pelindung_Jok.jpg', 'otomotif'),
(119, 'Putri Nadiah', 'Spion koso segi lima bisa dilipat universal', 'Cocok Untuk Motor : Honda Dan Yamaha\r\nbagian daun kaca bahan plastik\r\nbagian gagang/tangkai.bahan besi\r\nbarang sesuai difoto, model koso warna hitam polos, model sesuai foto,fleksibel bisa di putar 360 derajat.', 30500, 30, 'uploads/Spion koso segi lima bisa dilipat universal.jpg', 'otomotif'),
(120, 'Putri Nadiah', 'stiker spy x family', 'bahan stiker printing automotive sticker, laminasi glossy, tahan air, strong durability.\r\nbisa request kanan kirinya\r\n', 7000, 30, 'uploads/stiker spy x family stiker helm, motor.jpg', 'otomotif'),
(121, 'Putri Nadiah', 'sVan Belt + Roller (Drive Belt Kit)-Honda', 'HET produk ini adalah: Rp 155000\r\nHarga tertera disini adalah HET + biaya transaksi dari\r\nMarketplace\r\nHET tersedia di website resmi Honda Cengkareng atau\r\ndatang langsung ke gudang / AHASS kami.\r\nNama Resmi Produk: Belt Drive Kit\r\nKode Part: 23100KZLBAO\r\nKategori:Van Belt (Drive Belt)', 170600, 30, 'uploads/Van Belt + Roller (Drive Belt Kit)-Honda.jpg', 'otomotif'),
(122, 'Raihan Wahyu', 'Masker', '  Lindungi diri Anda dengan masker berkualitas tinggi yang nyaman dan efektif!  \r\n   - **Perlindungan Maksimal:** Menyaring debu, polusi, dan partikel kecil lainnya.  \r\n   - **Material Nyaman:** Lembut di kulit dan mudah bernapas, cocok untuk pemakaian sehari-hari.  \r\n   - **Desain Praktis:** Tersedia dalam berbagai model seperti 3-ply, KN95, hingga masker kain stylish\r\n', 20000, 30, 'uploads/Masker.jpg', 'kesehatan'),
(123, 'Raihan Wahyu', 'Pasta Gigi', ' Jaga kesehatan gigi dan mulut Anda dengan pasta gigi pilihan!  \r\n   - **Formula Aktif:** Membantu melawan bakteri, mencegah gigi berlubang, dan menjaga napas segar.  \r\n   - **Varian Lengkap:** Untuk pemutihan gigi, gigi sensitif, atau perawatan khusus.  \r\n   - **Rasa Menyegarkan:** Nikmati sensasi bersih dan segar setelah setiap sikat. ', 34500, 30, 'uploads/Pasta gigi.jpg', 'kesehatan'),
(124, 'Raihan Wahyu', 'Plester Luka:', ' Pertolongan pertama untuk luka kecil dengan plester luka praktis!  \r\n   - **Hypoallergenic:** Aman untuk semua jenis kulit, termasuk kulit sensitif.  \r\n   - **Tahan Air:** Melindungi luka agar tetap kering dan bersih.  \r\n   - **Beragam Ukuran:** Cocok untuk luka kecil hingga sedang.  \r\n', 17000, 30, 'uploads/Plester.jpg', 'kesehatan'),
(125, 'Raihan Wahyu', 'Thermometer Digital', 'Pantau suhu tubuh dengan cepat dan akurat menggunakan thermometer digital!  \r\n   - **Hasil Cepat:** Membaca suhu hanya dalam beberapa detik.  \r\n   - **Mudah Digunakan:** Layar digital yang jelas dan indikator suhu.  \r\n   - **Desain Aman:** Tanpa merkuri, cocok untuk anak-anak maupun dewasa.', 15000, 30, 'uploads/Thermometer digital.jpg', 'kesehatan'),
(126, 'Raihan Wahyu', ' Vitamin C Tablet', 'Tingkatkan daya tahan tubuh Anda dengan vitamin C tablet berkualitas!  \r\n   - **Dosis Harian Optimal:** Mendukung sistem imun tubuh dan mencegah kelelahan.  \r\n   - **Mudah Dikonsumsi:** Tablet kunyah atau larut dalam air dengan rasa yang enak.  \r\n   - **Manfaat Tambahan:** Membantu menjaga kesehatan kulit dan mempercepat pemulihan tubuh. **Pilih produk terbaik sesuai kebutuhan Anda untuk menjaga kesehatan dan kenyamanan setiap hari!**', 7700, 30, 'uploads/Vitamin C.jpg', 'kesehatan'),
(127, 'Anas Alawy', 'ANTARESTAR Official - Topi Running Pria Sport Outdoor Drymax Series', 'ANTARESTAR Official - Topi Running Pria Wanita Topi Sport Outdoor Drymax Series\r\nTopi Running ini sangat cocok buat kamu yang suka beraktifitas ke luar ruang seperti, Hiking, Camping, Olahraga, Nongkrong ke Mall, dan disegala aktifitas apapun di luar ruang. Dengan tampilan design yang Casual & Sporty dilengkapi dengan bahan yang berkualitas akan membuatmu semakin nyaman ketika dipakai serta yang pasti terbebas dari paparan sinar matahari. Dilengkapi juga dengan strap belakang untuk menyesuaikan ukuran kepala kamu agar kamu semakin percaya diri kemanapun dan dimanapun kamu pergi.\r\nSpesifikasi Topi\r\n- All Size & Unisex\r\n- Logo : Antarestar\r\n- Bahan Goretex 3 Layer\r\n- Sablon Polyflek Reflektor\r\n- Adjuster Velcro\r\n- Lingkar Kepala : 59 cm\r\n💢Kami menerima segala macam komplain (terutama jika memang karena kesalahan Kami). Harap videokan paket saat barang diterima/dibuka. 🙏\r\nAlasan kenapa harus belanja di tempat Kami :\r\n✔ Kami berkomitmen untuk memberikan pelayanan yang terbaik (boleh tukar/retur jika produk yang diterima tidak sesuai deskripsi/foto produk, kurang), karena stock milik kami sendiri.\r\n✔ Ada bonus untuk yang order banyak dan atau yang kasih review bagus serta bintang 5 yang terpilih\r\n✔ Bisa bayar menggunakan metode COD (Cash On Delivery). Bayar ke kurir yang mengantarkan paket di rumah Anda.\r\n✔ Belanja Online praktis dengan COD tanpa ribet transfer-transfer atau pergi ke mini market untuk bayar.', 125000, 30, 'uploads/Topi running .jpg', 'Hobi'),
(128, 'Anas Alawy', 'Topi Bucket Pria Hat Rimba Topi Pria Wanita Gunung Topi Rimba Outdoor', 'GARANSI 100% GANTI BARU JIKA SOBEK / RUSAK AKIBAT PENGIRIMAN.\r\nONGKOS KIRIM RETURN KAMI COVER TERGANTUNG DOMISILI\r\n\r\nMenerima pembayaran COD / Cash On Delivery\r\n\r\nPelayanan chat 100% fast respond dan real time sesuai jam operasional toko\r\n\r\nTopi Pria / Bucket Hat / Topi Pria Wanita Rimba Outdoor Gunung / Topi Rimba\r\n\r\n- COCOK UNTUK DI PAKAI SAAT AKTIFITAS DI LUAR RUMAH\r\n- COCOK JUGA UNTUK PARA PENDAKI\r\n- DENGAN TALI\r\n- UNTUK WARNA DIKIRIM RANDOM\r\n- DENGAN Desain YANG Simple DAN TERLIHAT KEREN JIKA DI PAKAI NYA', 45000, 30, 'uploads/Topi rimba.jpg', 'Hobi'),
(129, 'Anas Alawy', 'Jaket Gunung Pria Wanita Jacket Outdoor Hiking Antarestar Aether Serie', 'Jaket Gunung Pria Wanita Jacket Outdoor Hiking Antarestar Aether Series\r\n\r\nJaket Aether adalah sebuah jaket yang dirancang untuk digunakan dalam kegiatan outdoor. Jaket ini memiliki desain yang fungsional dan nyaman, serta menggunakan bahan berkualitas tinggi untuk memberikan perlindungan dan kenyamanan saat Anda berada di luar ruangan.\r\n\r\nSpesifikasi\r\n- Bagian dalam jaket Aether terbuat dari bahan dakron, yang merupakan bahan yang ringan dan memiliki sifat isolasi termal yang baik. Bahan dakron membantu menjaga suhu tubuh Anda agar tetap hangat dan nyaman saat Anda beraktivitas di luar ruangan, terutama dalam kondisi cuaca yang dingin.\r\n- Bahan luar jaket Aether terbuat dari bahan parasut yang tahan angin, dirancang untuk melindungi anda saat berkegiatan di luar ruangan\r\n- Jaket Aether dilengkapi dengan dua saku di bagian kiri dan kanan, yang memungkinkan Anda untuk menyimpan dan mengakses barang-barang kecil dengan mudah\r\n- Jaket ini juga dilengkapi dengan zipper YKK, yang dapat memudahkan Anda saat membuka dan menutup jaket dengan cepat.\r\n- Ukuran : M,L,XL,2XL\r\n- Limited Edition (Stock Terbatas)\r\n\r\n💢Kami menerima segala macam komplain (terutama jika memang karena kesalahan Kami). Harap videokan paket saat barang diterima/dibuka. 🙏\r\n\r\nAlasan kenapa harus belanja di tempat Kami :\r\n✔ Kami berkomitmen untuk memberikan pelayanan yang terbaik (boleh tukar/retur jika produk yang diterima tidak sesuai deskripsi/foto produk, kurang), karena stock milik kami sendiri.\r\n✔ Ada bonus untuk yang order banyak dan atau yang kasih review bagus serta bintang 5 yang terpilih\r\n✔ Bisa bayar menggunakan metode COD (Cash On Delivery). Bayar ke kurir yang mengantarkan paket di rumah Anda.\r\n✔ Belanja Online praktis dengan COD tanpa ribet transfer-transfer atau pergi ke mini market untuk bayar. ', 350000, 30, 'uploads/Jaket gunung.jpg', 'Hobi'),
(130, 'Anas Alawy', 'Daypack Cartenz Tas Ransel Gunung Outdoor Travel Backpack Antarestar - Abu-abu', 'Daypack Tas Ransel Gunung Outdoor Tas Travel Pria Wanita Casual Kekinian\r\n\r\nTas Cartenz Hadir dengan desain yang sangat Simple Namun Elegan. Sangat cocok digunakan untuk kegiatan formal atau non-formal seperti travelling, ke sekolah , kuliah atau lainya . Terbuat dari bahan yang sangat Berkualitas dan Wateproof serta Memiliki 2 kompartemen utama (Depan & Tengah) dan tambahan 1 kompartemen di tengah dalam yaitu tempat untuk menaruh laptop dan terdapat 2 kantong kecil di bagian luar kiri dan kanan.\r\n\r\nSPESIFIKASI & FITUR PRODUK\r\n\r\n- Bahan Cordura Ripstok\r\n- Kompartemen : zipper puller , Buckle Belt\r\n- Waterproof\r\n- Volume isi 22 liter\r\n- Adjustable Webbing\r\n- Terdapat tumblr Pocket pada sisi tas\r\n- Mudah kering apabila terkena cipratan air\r\n- dapat digunakan dikegiatan formal/ non-formal\r\n\r\nUkuran : P 25cm x L 13cm x T 45cm\r\n\r\nAlasan kenapa harus belanja di tempat Kami :\r\n✔ Kami berkomitmen untuk memberikan pelayanan yang terbaik (boleh tukar/retur jika produk yang diterima tidak sesuai deskripsi/foto produk, kurang), karena stock milik kami sendiri.\r\n✔ Ada bonus untuk yang order banyak dan atau yang kasih review bagus serta bintang 5 yang terpilih \r\n✔ Bisa bayar menggunakan metode COD (Cash On Delivery). Bayar ke kurir yang mengantarkan paket di rumah Anda.\r\n✔Belanja Online praktis dengan COD tanpa ribet transfer-transfer atau pergi ke mini market untuk bayar.', 120000, 30, 'uploads/Tas gunung.jpg', 'Hobi'),
(131, 'Anas Alawy', 'ANTARESTAR Official – Celana Olahraga Motion Basic Short Dry Fit Lari Running Gym Running Gym', 'Antarestar Official – Celana Olahraga Motion Basic Short Dry Fit Lari Running Gym\r\n\r\nBahan : Despo\r\n\r\nDengan daya tahan luar biasa yang menjaga produk tetap awet, kemampuan pengelolaan kelembapan untuk menjaga kenyamanan selama dipakai, elastisitas yang memungkinzkan gerakan bebas, serta sifat anti-kusut yang menjaga penampilan tetap rapi. Ringan dan nyaman saat dikenakan, bahan Despo adalah pilihan ideal untuk olahraga apa pun.', 98000, 30, 'uploads/Celana running.jpg', 'Hobi'),
(132, 'Anas Alawy', 'Celana Pendek Mills Away Indonesian Short Green', 'Dapatkan harga LEBIH MURAH dengan pembelian langsung di Offline Store!\r\n\r\nSebelum order, harap tanyakan ketersediaan stok dan size ke Admin.\r\nOrder masuk maksimal jam 15.00 dikirim di hari yang sama.\r\nPengiriman Same day maksimal jam 13.00.\r\nPengiriman instan maksimal jam 19.00.\r\nSelamat Berbelanja di FORY SPORT CIKARANG 😊\r\n\r\nCelana pendek khusus untuk melengkapi jersey Away Player Issue dan jersey Away Replica Version, dilengkapi dengan tali panjang untuk adjust di bagian dalam.. Dengan bahan yang didesain dengan SUN PROTECTION untuk Melindungi dari sinar UV matahari, MOISTURE WICKING Sebagai Penyerapan cepat saat berkeringat dan COOL OMNI untuk Menjaga agar tetap nyaman saat berkeringat.\r\n\r\nsize chart\r\nS : Waistban 33cm x Outseam 42cm\r\n\r\nM : Waistban 36cm x Outseam 44cm\r\n\r\nL : Waistban 38cm x Outseam 45cm\r\n\r\nXL : Waistban 41cm x Outseam 45cm\r\n\r\nXXL : Waistban 43cm x Outseam 47cm\r\n\r\nXXXL : Waistban 45cm x Outseam 47cm', 115000, 30, 'uploads/Celana bola.jpg', 'Hobi'),
(133, 'Anas Alawy', 'ANTARESTAR Official – Celana Olahraga Motion Basic Short Dry Fit Lari Running Gym Running Gym', 'Antarestar Official – Celana Olahraga Motion Basic Short Dry Fit Lari Running Gym\r\n\r\nBahan : Despo\r\n\r\nDengan daya tahan luar biasa yang menjaga produk tetap awet, kemampuan pengelolaan kelembapan untuk menjaga kenyamanan selama dipakai, elastisitas yang memungkinzkan gerakan bebas, serta sifat anti-kusut yang menjaga penampilan tetap rapi. Ringan dan nyaman saat dikenakan, bahan Despo adalah pilihan ideal untuk olahraga apa pun.', 98000, 30, 'uploads/Celana running.jpg', 'Hobi'),
(134, 'Anas Alawy', 'ANTARESTAR Official – Baju Olahraga Lari Jersey Running Neorun Jersey Dry Fit Gym Lari Running Unisex', 'Semangat berolahraga dapat bersumber dari perlengkapan olahraga yang dapat meningkatkan mood untuk berolahraga, seperti jersey dengan warna-warna yang cerah. Jersey Neorun Series dari Antarestar ini contohnya, tampil dengan warna-warna gradasi yang cerah dan menyala, sehingga menciptakan tampilan yang unik, eye-catching, serta membuatmu tampil beda, bersemangat, dan penuh percaya diri.', 179000, 30, 'uploads/Baju lari.jpg', 'Hobi'),
(135, 'Adjriel Ibra', 'Shacket Jacket - Jacket Pria Fleece Original Civity', 'Shacket Jacket\r\n\r\nMerek : Civity\r\nMaterial : Fleece\r\nKancing : Snap Button/ Kancing Cetek Besi \r\n\r\nUkuran : S M L XL XXL XXXL\r\nDetail ukuran\r\nPanjang x Lebar dada x Panjang lengan\r\n\r\nS : 66 cm x 48 cm x 56 cm\r\nM : 68 cm x 50 cm x 58 cm\r\nL : 70 cm x 52 cm x 60 cm\r\nXL : 72 cm x 54 cm x 62 cm\r\nXXL : 74 cm x 56 cm x 64 cm\r\nXXXL : 76 cm x 58 cm x 66 cm\r\n*Toleransi ukuran -/+ 1 cm\r\n\r\n\r\nGaransi 100% uang kembali jika menerima barang yang cacat/tidak sesuai pesanan.\r\nPengajuan garansi dapat dilakukan sebelum menekan/meng-klik pesanan diterima', 86900, 20, 'uploads/baju.webp', 'mans'),
(136, 'Adjriel Ibra', 'CELANA KANTOR FORMAL PRIA SLIMFIT BAHAN DASAR KAIN WOL', 'Formal Pants Slimfit R-BOND Cocok dikenakan untuk acara casual, semi formal, dan sopan.\r\nBahan semi woll, adem, dan nyaman dikenakan untuk kegiatan indoor atau outdoor.\r\n\r\nDETAIL PRODUK:\r\n- Bahan : Semi woll\r\n- 2 Kantong Depan\r\n- 2 Kantong Belakang\r\n\r\nUkuran : 27 sampai 38\r\n? SIZE CHART (lingkar Pinggang)\r\n?Uk. 27 LP : 72 Cm L Paha : 50cm L Ankle : 32cm\r\n?Uk. 28 LP : 74 Cm L Paha : 50cm L Ankle : 32cm\r\n?Uk. 29 LP : 76 Cm L Paha : 52cm L Ankle : 32cm\r\n?Uk. 30 LP : 78 Cm L Paha : 54cm L Ankle : 32cm\r\n?Uk. 31 LP : 80 Cm L Paha : 56cm L Ankle : 32cm\r\n?Uk. 32 LP : 82 Cm L Paha : 58cm L Ankle : 32cm\r\n? Uk.33 LP : 86 Cm L Paha : 60cm L Ankle : 34cm\r\n?Uk. 34 LP : 88 Cm L Paha : 62cm L Ankle : 34cm\r\n?Uk. 35 LP : 91 Cm L Paha : 64cm L Ankle : 36cm\r\n?Uk. 36 LP : 93 Cm L Paha : 66cm L Ankle : 36cm\r\n?Uk. 37 LP : 95 Cm L Paha : 68cm L Ankle : 38cm\r\n?Uk. 38 LP : 97 Cm L Paha : 70cm L Ankle : 38cm\r\n?Uk. 39 LP : 100 Cm L Paha : 70cm L Ankle : 38cm\r\nPanjang Celana 100 \r\n\r\nToleransi ukuran -/+ 1 sampai 2 cm\r\n.Kemiripan warna bisa sedikit berbeda dengan foto produk karena faktor kecerahan lighting dan banyak faktor lainnya\r\n\r\nPerawatan :\r\nUntuk menjaga pakaian tetap terawat, cuci pakaianmu jangan terlalu kasar, pisahkan pakaian bedasarkan warna, tambahkan pelembut, balik pakaian saat mencuci dan dijemur.', 51750, 30, 'uploads/celana.webp', 'mans'),
(137, 'Adjriel Ibra', 'Kaos Pria Distro Lengan Pendek Kayser Time Baju T-Shirt Keren', 'Feel the comfort, Kayser T- shirt terbuat dari bahan Premium combed kualitas terbaik yang sejuk dan lembut. nyaman dipakai, design Exclusive, Simple & Fashionable. \r\n\r\n>> DETAIL :\r\nBahan Babyterry, Kualitas Bahan sedang.\r\n- Motif Sablon dengan heat press sistem  bukan manual (tangan)\r\n- Leher manset dan tangan manset menggunakan RIB Good Quality.\r\n- Lengan Pendek.\r\n\r\n>> DETAIL SIZE (Lengan Pendek dan Panjang Ukuran sama, hanya beda pada Lengannya) :\r\n- SIZE M - L : Lingkar Dada 104CM x Panjang baju 68CM\r\nLebar Baju 52CM\r\n\r\n- SIZE XL : Lingkar Dada 107CM x Panjang baju 70CM\r\nLebar Baju 54CM\r\n\r\n- Size XXL : Lingkar Dada 114CM x Panjang 72CM\r\nLebar Baju 57CM\r\n\r\nLeher manset dan tangan manset menggunakan RIB Good Quality\r\nNyaman di pakai\r\nTidak Pudar (Tajam)  & Tahan Lama dan tidak mudah Melar\r\nSisi jahitan, Samping + bawah sangat rapih.\r\n\r\nmengutamakan quality control sebelum pengiriman \r\n- Pengiriman 100% AMAN', 49900, 30, 'uploads/kaosdistro.webp', 'mans'),
(138, 'Adjriel Ibra', 'KEMEJA BATIK PRIA LENGAN PANJANG', 'Matt 100% full katun halus,tidak mudah kusut,jahitan rapi\r\nBahan adem & nyaman di pakai cocok untuk berbagai acara & ready stok seragam\r\n\r\nSize\r\nM:lingkar dada102cm\r\nL:lingkar dada 106cm\r\nXl:lingkar dada 110cm\r\n(Reguler Size)\r\n#kemeja #kemejabatik #kemejacowok #kemejakerja #batiknusantara #batiksolo #batikmodern #batikpekalongan #batikjogja #batikkerenbanget #batikkeren #batikkerja #batikkondangan #batikpria#batikpriamodern #batiknusantara #batikpriakerja#batikkombinasi #batikkeren', 70000, 30, 'uploads/kemeja batik.webp', 'mans'),
(139, 'Adjriel Ibra', 'Jaket Baseball Varsity Pria Full Bordir', 'Produk sedang dalam tahap produksi Kamis atau Jumat Ini sudah ready\r\n\r\nDeskripsi Produk\r\nKapan lagi bisa beli jaket berkualitas tinggi dengan harga seminim mungkin.\r\nNikmati fantasi belanja eceran dengan harga grosiran .\r\nBarang yang dipajang semua ready. kalo tidak ready = Tidak dipajang.\r\n\r\nBahan Fleece Tebal\r\nMotif Full Bordir\r\nMotif Belakang Polos\r\n\r\nKombinasi Warna Jaket\r\nHitam Tangan Cream\r\nNavy Tangan Cream\r\nHijau Tangan Cream\r\nDenim Tangan Cream\r\nMustrad Tangan Cream\r\nMaroon Tangan Hitam\r\n\r\nReady Size\r\nAnak Usia 4-5TAHUN (Size S Anak) Belum Tersedia\r\n\r\nAnak 7-10tahun M Anak  (P 55CM LD 92CM)\r\nAnak 11-13TAHUN L Anak (P58CM LD96CM)\r\n\r\nM ( Untuk Remaja Dewasa 12-17 tahun) P 62CM LD 104 CM\r\nL ( Untuk  Dewasa 17 tahun Keatas BB 50-64KG ) P 67CM LD 108 CM\r\nXL ( Untuk  Dewasa Berat Badan 65-74kg ) P 70CM LD 108-112 CM\r\nXXL( Untuk Berat badan 75 ke atas) P 73 CM LD 108-116 CM\r\n\r\nPengertian dari bahan Fleece\r\n1. Bagian luar bahan ini sangat lembut.\r\n2. Bagian luar bahan apabila disentuh akan terasa sangat hangat.\r\n3. Mampu menyerap panas dengan baik.\r\n4. Mampu menyerap air dengan baik.\r\n5. Mampu menyerap keringat dengan baik.\r\n6. Mampu melancarkan sirkulasi udara dengan baik.\r\n7. Bahan fleece tidak mudah melar.\r\n8. Memiliki sifat yang elastis.\r\n9. Cocok digunakan buat musim hujan dan musin panas.\r\n10. Tekstur bahanya sangat lembut', 230000, 30, 'uploads/jaket.webp', 'mans'),
(140, 'Adjriel Ibra', 'Aerostreet 37-44 Osaka Krem Biru Hitam - Sepatu Sneakers Sport', 'TIDAK AKAN JEBOL setelah dicuci atau kehujanan karena menggunakan technologi baru Shoes Injection Mould bahan sole dicairkan dengan tekanan tinggi menyatu sempurna dengan bahan kain dari sepatu tanpa menggunakan proses lem.\r\n\r\nBahan : Kanvas - Mesh - Kulit sintetis\r\n\r\nPanduan ukuran :\r\n\r\nUkuran 37 Panjang telapak kaki 23.9 cm\r\nUkuran 38 Panjang telapak kaki 24.6 cm\r\nUkuran 39 Panjang telapak kaki 25.2 cm\r\nUkuran 40 Panjang telapak kaki 25.9 cm\r\nUkuran 41 Panjang telapak kaki 26.6 cm\r\nUkuran 42 Panjang telapak kaki 27.2 cm\r\nUkuran 43 Panjang telapak kaki 27.9 cm\r\nUkuran 44 Panjang telapak kaki 28.6 cm\r\n\r\nBelanja langsung dari pabrik nya\r\nnow everyone can buy a good shoe\r\n\r\nRESELLER dan DROPSHIPER very welcome\r\ndapatkan discount spesial dari pabrik langsung\r\n\r\n*semua stok dijamin ready\r\n*Open order 24 jam\r\n*Fast response jam 08.00-16.00 Senin s/d Sabtu\r\n*Order diatas jam 09.00 akan di proses pada hari berikutnya\r\n*Order pada hari minggu dan hari libur Nasional, akan kami proses pada hari kerja', 166900, 30, 'uploads/sepatu.webp', 'mans'),
(141, 'Adjriel Ibra', 'Leedoo Sepatu Olahraga Pria Sepatu Pria Casual Sneakers Fashion Cowok Kekinian Sport Shoes MR704', 'Note : tidak memiliki besi didepan\r\nLeedoo Sneakers Casual Sneakers Olahraga Pria Sepatu Pria Fashion Cowok Kekinian Sport Shoe MR704\r\n\r\nKepada calon pembeli dimohon untuk membaca deskripsi sebelum memesan produk. \r\nDan tanyakan stoknya terlebih dahulu.\r\n\r\nSepatu Sneaker Original & 100% Kekinian.\r\nSepatu Sneaker murah tapi gak murahan.\r\nSepatu yang kami jual 100% baru + box.\r\nBarang sesuai dengan GAMBAR.\r\nSepatu Sneakers ringan, Kaki bergerak leluasa Sepatu Sneakers lembut di dalam, Nyaman saat dipakai, Sepatu Sneakers Anti slip, Tidak pengap, Tidak mudah lepas, Sepatu Sneakers Model simple dan elegan, Trend Fashion.\r\n\r\nFitur : Sol Berbahan Karet Jadi Terasa Empuk & Nyaman Ketika Digunakan.\r\nCocok Digunakan Untuk : Sekolah, Kuliah, Kerja, Traveling, HangOut\r\n\r\nReady warna : Hitam & Putih\r\nBahan : Ice Slik + PU\r\nSize 39-44\r\nPerincian Size \r\n39 = 24.5 cm \r\n40 = 25 cm \r\n41 = 25.5 cm \r\n42 = 26 cm \r\n43 = 26.5 cm \r\n44 = 27 cm \r\n\r\nJadwal Pengiriman Hari Senin-Sabtu\r\nOrder sebelum jam 12:00 WIB  akan diproses dihari yang sama.\r\nOrder melewati jam 12:00 WIB akan diproses dihari selanjutnya.\r\nHari minggu dan tanggal merah libur, tidak ada pengiriman.\r\nUpdate resi maksimal 1x24jam setelah paket dipickup pihak ekspedisi.\r\n\r\nGunakan Voucher FREE ONGKIR dari Shopee untuk menikmati subsidi ongkir.\r\n\r\n*CATATAN YANG PERLU DIPERHATIKAN* \r\n‘’PENGIRIMAN SEPATU APAPUN SUDAH TERMASUK BOX DENGAN KEADAAN BARU, APABILA SETELAH SAMPAI TUJUAN BOX ADA KERUSAKAN BUKAN KESALAHAN DARI KAMI. UNTUK PEMESANAN SEPATU JANGAN LUPA BERI KETERANGAN UKURAN/SIZE YANG DIPESAN’’.\r\n\r\nPesanan sesuai dengan invoice pesanan awal tidak dapat di retur.\r\nPesanan salah kirim barang, warna maupun ukuran boleh ditukar.\r\nMasa diperbolehkan retur 3 hari setelah barang diterima. Dan harus dalam keadaan belum dipakai.\r\n\r\nPERHATIKAN SEBELUM ORDER\r\n\r\n- Pastikan Alamat & No.Telp Tujuan / Pengiriman Jelas & Lengkap.\r\n- Pastikan Ukuran & Warna yang diinginkan sesuai dengan yang ada di pesanan, apabila sudah terlanjur membayar pesanan namun ada kesalahan dalam mengorder bisa konfirmasi untuk pergantian ukuran & warna melalui chat sebelum dikirim.S\r\n- Pastikan Ukuran Sepatu dengan Ukuran Kaki sesuai & pas ketika pesanan tiba ditempat, apabila pesanan sudah tiba namun size sepatu lebih besar/kecil dapat ditukar dengan size lain\r\n\r\n#Sepatu #Sepatupria #Sneakers #Sneakerspria #Sneaker #Sneakerpria #Shoes #Shoessport #sepatuslipon #slipon #sepatuhiking', 89900, 30, 'uploads/sepatuledo.webp', 'mans'),
(142, 'Putri Nadiah', 'Monster XKT08 Bluetooth Earphone Wireless Earphone', 'Selamat datang di Mall, kami berkomitmen untuk menyediakan produk yang kuat dan layanan terbaik kepada pelanggan.\r\nBeli produk kami dari Shopee tanpa khawatir karena kami menjamin produk tersebut 100% asli dan baru.\r\nNikmati belanja Anda di toko kami dan semoga hari Anda menyenangkan.\r\n\r\nXKT08 Produk Fitur:\r\n1. Tampilan bergaya, warna yang kaya, mudah dibawa \r\n2. Pengurangan kebisingan panggilan ENC, tidak takut kebisingan \r\n3. Versi Bluetooth 5.3, koneksi lebih stabil \r\n4. Mode latensi rendah, pengalaman bermain game yang lebih mengejutkan \r\n5. Speaker dinamis 13mm, musik lebih bergelombang pengalaman\r\n\r\nSpesifikasi Produk:\r\nMerk: Monster\r\nModel: XKT08\r\nVersi Bluetooth: 5.3\r\nJenis produk: Earphone Bluetooth\r\nAntarmuka pengisian daya: Tipe-C\r\nUkuran ruang pengisian daya: 78*28*21mm\r\nJarak transmisi Bluetooth: ≥ 10M\r\nKapasitas baterai earphone: 33mAh\r\nKapasitas baterai ruang pengisian daya: 300mAh\r\nKelas tahan air: IPX5\r\nFungsi kendali jarak jauh: Kontrol nirkabel\r\n\r\nXKT08 PRO Fitur:\r\n1. Gaya kapal perang luar angkasa yang keren\r\n2. Efek pencahayaan e-sports yang keren\r\n3. Nyaman untuk dibawa\r\n4. Pengisian daya yang sangat cepat\r\n5. Panggilan berkualitas tinggi\r\n6. Daya tahan baterai super lama, latensi game rendah\r\n7. Kumparan bergerak multi-unit\r\n\r\nSpesifikasi Produk:\r\nMerk: Monster\r\nModel: XKT08 PRO\r\nVersi Bluetooth: v5.4\r\nJarak transmisi: ≥10m\r\nDiameter pengeras suara: 13mm\r\nImpedansi pengeras suara: 32Ω±15%\r\nSensitivitas: 109±3dB\r\nRentang respons frekuensi: 20Hz-20kHz\r\nKapasitas baterai (kotak pengisian daya): 300mAh 3.7V\r\nKapasitas baterai (headphone): 33mAh 3.7V\r\nWaktu pengisian daya (headphone): sekitar 1,5 jam\r\nDaya tahan baterai (headphone): kurang lebih 5 jam\r\nDaya tahan baterai (termasuk wadah pengisi daya): sekitar 20 jam\r\nBerat earphone tunggal: 3,7g\r\nKotak pengisi daya + earphone berat: 39g\r\nTingkat kedap air: IPX4\r\n\r\nTekan dan tahan area sentuh telinga kanan selama dua detik untuk beralih mode permainan/musik!\r\n\r\nIsi Kemasan:\r\n1 * lubang suara\r\n1 * tali pengikat\r\n1 * Panduan Pengguna\r\n1 * kabel pengisi daya\r\n1 * kotak pengisi daya\r\n\r\nKiat:\r\nProduk sebenarnya tersedia. Produk akan dikirim dalam 1 hari kerja setelah pembayaran.\r\n\r\n❤ Jika Anda tidak puas dengan pembelian Anda atau memiliki pertanyaan, silakan hubungi kami terlebih dahulu. Tolong jangan meninggalkan ulasan buruk tanpa komunikasi.\r\nKami dengan senang hati menyelesaikan masalah Anda.\r\nTerima kasih banyak!\r\n\r\n#Monster\r\n#Earphone Bluetooth\r\n#Earphone Monster\r\n#Earphone\r\n#Earphone Nirkabel', 113400, 30, 'uploads/tws.webp', 'elektronik'),
(143, 'Putri Nadiah', 'Mini Proyektor LED YG300 / YG-300 / YG 300 LCD Portable Projector', 'Deskripsi Mini Proyektor LED YG300 / YG-300 / YG 300 LCD Portable Projector Home - Kuning\r\nNotes: Penggunaan proyektor lebih cocok untuk multimedia rumahan, seperti home theater, untuk menonton film dsb (home use), tidak disarankan untuk presentasi di kantor atau sekolah\r\n\r\nMini Proyector LED YG300 / YG-300 / YG 300 LCD Portable Projector Home Theater (Bergaransi Toko 3 Hari)\r\nSpesifikasi:\r\n- Product model: YG-300\r\n- Color: Yellow White\r\n- Type: LCD\r\n- Light Source: LED\r\n- LED Lamp Life: 30000 hours\r\n- Plug type: EU (Cocok untuk digunakan di Indonesia)\r\n- Supported language: English, Chinese, etc\r\n- Brightness: 400-600 Lumens\r\n- Contrast Ratio: 800:1\r\n- Projection Screen Size: 24-60 inches\r\n- Projection distance: 0.8-2M\r\n- Optical resolution: 320 * 240 pixels\r\n- Support resolution: 1080P\r\n- Format Musik: MP3, WMA, APE, FLAC, OGG, AAC\r\n- Format Video: RM, RMVB, AVI, MOV, MP4, VOB, MPG, DAT, MPEG\r\n- Input: 3.5mm Audio Headphone (AV), CVBS, HDMI, TF Card Slot, USB\r\n- Built In speaker\r\n- Support power bank charging\r\n\r\nKelebihan:\r\n- Tersedia slot untuk TF Card, HDMI, USB, AV, CVBS\r\n- Proyektor YG-300 ini hadir dengan desain yang minimalis hanya 126.4 x 85.8 x 47.7mm dan ringan sehingga mudah dibawa kemana saja.\r\n- Proyektor ini dapat ditenagai dengan power bank karena mendukung daya 5V/2A sehingga menjadikan power bank sebagai tenaga cadangan untuk proyektor ini.\r\n- Proyektor ini menampilkan gambar dengan kualitas HD atau resolusi 1920 x 1080 pixels. Native Resolusi dari proyektor ini adalah 320 x 240 pixels.\r\n- Proyektor YG-300 ini telah mengadaptasi sitem pendinginan yang dilengkapi kipas axial hydraulic yangmengantisipasi panas dan tidak menimbulkan kebisingan\r\n\r\nIsi Kemasan:\r\n- 1 x Projector YG300\r\n- 1 x Remote\r\n- 1 x Charger\r\n- 1 x AV Cable', 209999, 30, 'uploads/proyektor.webp', 'elektronik'),
(144, 'Putri Nadiah', 'Fantech Multi platform Gamepad Wireless Android PC PS Gaming Controller Shooter III WGP13S Joystick USB Type C', 'Shooter III WGP13S Multi-Platform Gamepad\r\n\r\nPrecision Hall-Effect Triggers\r\nNikmati pengalaman bermain dengan akurasi tingkat tinggi yang belom pernah kamu rasakan sebelumnya. Dengan electromagnetic-control gamepad ini menawarkan pengalaman presisi milimeter-level dan trigger dibawah 1 mm.Play Any Game, Anywhere\r\nGamepad ini memiliki kemampuan multi-platform terbaik sehingga kamu bisa mainkan game apapun di berbagai device yang kamu inginkan.Motion Sensor\r\nGamepad WGP13S hadir dengan fitur motion sensor untuk memberikan pengalaman bermain yang lebih memukau. Semua objek yang kamu gunakan dalam game seperti kendaraan hingga senjata bisa bergerak secara akurat mengikuti pergerakkan gamepad.Anti-Drift Hall Effect Sticks\r\nTidak akan ada lagi drifting pada game-game yang kamu mainkan karena gamepad WGP13S sudah memiliki analog dengan fitur anti drift hall effect. Fitur ini siap memberikan input yang super presisi untuk kepuasan bermain serta tingkat durabilitas yang tinggi.Timed Macro\r\nPada gamepad ini juga terdapat fitur timed macro yang berfungsi untuk merekam dan mereplikasi gameplay kamu. Fitur ini dapat merekam hingga 63 penekanan tombol dengan rentang waktu selama 5 menit.Grippy Textured Surface\r\nGamepad WGP13S dirancang dengan grip yang memiliki tekstur anti-slip sehingga memastikan gamepad dapat dipegang dengan nyaman.Low Profile Dual USB C & USB A Dongle\r\nGamepad ini telah dilengkapi juga dengan dongle USB C dan USB A untuk menghubungkan gamepad pada device yang kamu inginkan secara wireless. Dapatkan pengalaman bermain game anti delay dengan dongle yang compact dan mudah untuk dibawa ke mana pun.Asymmetric Vibrating Controller\r\nDengan gamepad WGP13S pengalaman bermain game semakin nyata karena memiliki fitur vibration system. Fitur ini memiliki 4 level getaran yang bisa disesuaikan dengan game-game yang sedang dimainkan untuk mendapatkan pengalaman terbaik.\r\nHigh-Polling Rate\r\nGamepad ini telah dibekali dengan 1000Hz polling rate pada kedua mode koneksi, mode wired dan mode wireless Strikespeed, untuk mendapatkan performa yang ultra-responsive.Adjustable Thumbstick Circularity & Sensitivity\r\nDengan gamepad WGP13S kamu bisa mengatur circularity dan sensitivitas thumbstick sehingga kamu dapat menyesuaikannya dengan preferensi dan kebutuhan setiap game yang kamu mainkan.', 294000, 30, 'uploads/gamepad.webp', 'elektronik');
INSERT INTO `Products` (`product_id`, `seller_name`, `product_name`, `product_desc`, `product_price`, `product_stock`, `product_img`, `product_category`) VALUES
(145, 'Putri Nadiah', 'ADVAN Laptop Workplus AMD Ryzen 5 6600H 14\' FHD IPS 16Gb 512Gb 1 TB Ryzen 7 7735HS 16GB 512GB Win 11', 'Fitur ADVAN Laptop Workplus:\r\nLaptop / notebook Advan Workplus menggunakan processor AMD ryzen 5 6600H ditujukan untuk professional, sangat nyaman digunakan untuk bekerja, programing, content creator, IT, main game, serta mendukung semua kegiatan Anda.\r\nLaptop / notebook Advan Workplus dapat di buka 180° sehingga dapat digunakan untuk berbagai aktifitas seperti presentasi dengan mudah dengan rekan kerja anda di dalam 1 meja.\r\nLaptop Advan Workplus memiliki dimensi layar 14 inch FHD 1920*1200 dengan rasio 16:10 dan di dukung teknologi IPS. Membuat layar menjadi tajam dan nyaman di mata Anda.\r\nLaptop Advan Workplus memiliki berat tidak sampai 1.3 Kg membuat laptop ini ringan dan sangat nyaman Ketika digunakan mobile.\r\nLaptop Advan Workplus memiliki keamanan lebih tinggi dengan fitur fingerprint. Cukup dengan jari Anda untuk masuk ke system windows.\r\nFree Windows 11 Original\r\n\r\nBundling Hemat \r\n- Workplus 512g+HS-SSD-G3000/512G\r\n- Workplus 512g+HS-SSD-G3000/1024G\r\n- Workplus 512g+HS-SSD-G7000/512G\r\n\r\n_____________________________________________________________________________________________________________________________________________________________________________\r\nSpecification Ryzen 5  :\r\nCPU : AMD Ryzen 5 6600H\r\nDisplay : 14\' 16:10 FHD 1920*1200 IPS\r\nGPU : AMD Integrated graphics\r\nRAM : 16GB Onboard\r\nMemory : 512 GB PCIE 3.0 SSD upgradable\r\nCamera : Yes\r\nFingerprint : Yes\r\nWIFI : 802.11 b/g/n/ac/ax\r\nBluetooth : Yes\r\nSpeaker : 2x box speakers 4Ω 2W\r\nBattery : Polymer 5050mAh 58Wh\r\nSize : 313.8*222*17.87mm\r\nFree OS : Windows 11 Original\r\nPORT : 2x USB Type C 3.2 Gen1 (PD/DP/Charger/Data)\r\n1x Micro SD\r\n2x USB 3.2 Gen1\r\n1x HDMI 2.0\r\n1x Jack Earphone 3.5mm\r\n\r\nKelengkapan Unit :\r\n☑ Box / Dus Laptop\r\n☑ Unit Laptop\r\n☑ Charger\r\n☑ Kartu Garansi\r\n☑ Manual book\r\nGaransi 1 Tahun\r\n____________________________________________________________________________________________________________________________________________________________________\r\nAdvan WORKPLUS Ryzen 7 7735HS 16GB 512GB AMD Radeon 680M FHD IPS Windows 11 Original Laptop\r\nSpeksifikasi Ryzen 7\r\nProsesor : AMD Ryzen 7 7735HS 3.2 - 4.75GHz (8C/16T/16MB Cache) \r\n\r\nGrafis;\r\n- AMD Radeon 680M\r\n- 512MB (VRAM)\r\n- 768 Stream Processor\r\n- AMD RDNA 2\r\n\r\nRAM/ Memori;\r\n- 16GB LPDDR5 6400MHz\r\n- Dual Channel 128bit\r\n\r\nPenyimpanan;\r\n- 512GB NVMe Gen 3\r\n\r\nSistem Operasi;\r\n- Windows 11 Home 64bit Original\r\n\r\nLayar;\r\n- IPS\r\n- 1920 x 1200\r\n- Aspek Rasio > 16:10\r\n- 350 nits Brightness\r\n- 57.5% sRGB\r\n- Refresh Rate 60Hz\r\n- Sudut Pandang > 178°/178°\r\n- Tilt up 180°\r\n- AMD FreeSync\r\n- Anti Glare\r\n\r\nColokan;\r\n- 2x USB 3.2 Type C Gen1 (Power Delivery/ Display Port/ DATA/ Charger)\r\n- 2x USB 3.2 Type A Gen 1\r\n- 1x HDMI 2.0\r\n- 1x Micro SD Reader\r\n- 1x Headphone / microphone combo jack (3.5mm)\r\n- 1x Kesington Lock\r\n\r\nKonektivitas;\r\n- WiFi 6E + Bluetooth 5.2 Series\r\n\r\nLainnya;\r\n- HD Camera\r\n- Stereo Speakers\r\n- Backlit Keyboard > Yes\r\n- Fingerprint > Yes\r\n\r\nBaterai & Daya;\r\n- Li-ion Polymer Battery\r\n- 5022mAh\r\n- 58Wh\r\n\r\nPendingin;\r\n- Dual Cooling System with Large Fan\r\n- Triple Heatpipe\r\n\r\nGaransi Resmi Advan 1 Tahun\r\n_________________________________________________________________________________________________________________________________________________________________\r\nLaptop / notebook Advan Workplus menggunakan processor INTEL I5 12600H ditujukan untuk professional, sangat nyaman digunakan untuk bekerja, programing, content creator, IT, main game, serta mendukung semua kegiatan Anda.\r\n\r\nSpecification :\r\nCPU		: INTEL I5 12600H\r\nDisplay		: 14\' 16:10 FHD 1920*1200 IPS \r\nRAM		: 24GB LPDDR5\r\nMemory	: 512 GB PCIE 3.0 SSD upgradable\r\nCamera		: Yes\r\nFingerprint	: Yes\r\nWIFI		: 802.11 b/g/n/ac/ax\r\nBluetooth	: Yes\r\nSpeaker		: 2x box speakers 4Ω 2W\r\nBattery		: Polymer 5050mAh 58Wh\r\nSize		: 313.8*222*17.87mm\r\nFree OS		: Windows 11 Original\r\nPORT 		: 2x USB Type C 3.2 Gen1 (PD/DP/Charger/Data)\r\n		  1x Micro SD \r\n		  2x USB 3.2 Gen1\r\n		  1x HDMI 2.0\r\n		  1x Jack Earphone 3.5mm', 8599000, 30, 'uploads/laptop.webp', 'elektronik'),
(146, 'Putri Nadiah', 'Thinkplus TH10 Headphone Bluetooth Wireless Headset Earphone', 'LN-EAR-TH10-BK\r\nLN-EAR-TH10-WH\r\n\r\nNo Postel : 6041/SDPPI/2022\r\n\r\nNOTE : SAAT PENGGUNAAN MENGGUNAKAN KABEL AUX, FUNGSI TOMBOL PADA HEADPHONE TIDAK AKAN BERFUNGSI \r\n\r\n-Rasakan suara HIFI,3D dengan Dual power loudspeakers dan CVC microphones.\r\n-Audio AUX yang kompatibel dengan banyak perangkat android atau ios.\r\nNyaman dipakai lama, dengan masa pakai baterai yang kuat.\r\n\r\nSpesifikasi Produk :\r\n\r\nBluetooth version : V5.0\r\nBluetooth distance : 10m\r\nSpeaker size : 40mm\r\nFrequency range : 20Hz-20KHz\r\nImpedence of glass speaker : 32Ω ±15%\r\nSpeaker sensitivity : 110dB±3dB\r\nMicrophone sensitivity : -42dB±3dB\r\nPlaying time : about 15 hours (60% volume)\r\nBattery capacity : 3.7V/300mAh\r\nKabel koneksi : 3.5mm audio cable\r\nCharging interface : Type-C\r\nSurround : 9D\r\nBluetooth transmission distance : 10-15m\r\nBattery life : 8 hours of gaming, 12 hours of playback\r\n\r\nButton Function :\r\n1. Play/Pause/Answer/Hang up\r\n2. Short press : Volume increase Long press : Next song\r\n3. Short press : Volume reduction Long press : Previous song\r\n4. Power on/off pairing\r\n5. Indicator light\r\n6. Charging port\r\n7. 3.5mm audio interface\r\n8. Microphone\r\n\r\nIsi paket :\r\n1* Bluetooth Headphone\r\n1* Charge Line Type c USB\r\n1* 3.5mm to 3.5mm Audio Cable\r\n1* Manual Book\r\n\r\n\r\nGaransi: 12 Bulan (Cacat pabrik, langsung ganti baru. kerusakan akibat pengguna garansi void)\r\n\r\nNotes :\r\n1. Harap pastikan pesanan sudah sesuai sebelum check out.\r\n2. Sesuai kebijakan Shopee Mall, produk tidak dapat ditukar size / warna / model \r\n3. Untuk klaim produk tidak lengkap harap sertakan video unboxing paket FULL tanpa Jeda dalam kondisi packingan seller.\r\n4. Setelah barang sampai mohon dicek kelengkapan produk dan pastikan barang diterima dengan kondisi baik sebelum klik \"Pesanan Diterima\".', 152000, 30, 'uploads/headsettp.webp', 'elektronik'),
(147, 'Putri Nadiah', 'KZ EDX Pro with Mic Noise Cancelling Earphone Heavy Bass Sensation Sport Headset', 'Knowledge Zenith Official Shop Garansi 1 Tahun.\r\n====================\r\n- PERHATIAN -\r\nBeli di kami sudah pasti original dan bergaransi 1 tahun. Kami banyak menerima permintaan klaim garansi dan pertanyaan-pertanyaan seputar produk dari orang yang tidak membeli dengan kami, jika tidak membeli dengan kami maka tidak dapat klaim garansi ke kami. Jadi pastikan beli di Knowledge Zenith Official Shop. Terima kasih.\r\n====================\r\nBanyak pertanyaan yang masuk, apa bedanya dengan EDX? \r\n\r\nJadi KZ EDX Pro ini ialah versi upgrade dari KZ EDX, desain menarik, kabel lebih awet dan tentunya bassnya lebih berkualitas dibanding KZ EDX. Dengan kabel model terbaru ini diharapkan user lebih awet dalam menggunakan earphone. \r\n\r\nSpecification:\r\n\r\n1. Product Name: KZ EDX pro\r\n2. Brand: KZ\r\n3. Model: EDX PRO\r\n4. Earphone type: In-ear\r\n5. Impedance: 24Ω\r\n6. Earphone sensitivity: 112dB/mW\r\n7. Frequency range: 10-20000Hz\r\n8. Interface: 3.5mm\r\n9.Cable Lngth: 1.25±0.05m\r\n10.Color: Black/Clear/Cyan\r\n11.Whether with cable: Yes\r\n12.Earphone interface: 2Pin 0.75mm\r\n13.Whether with mic: Mic\r\n14.Whether can replacement cable: Yes\r\n15.Driver unit: 1 Dynamic,10mm Dual magnetic circuit dynamic drive\r\n\r\nNote:\r\n- Pengiriman dilakukan pada hari Senin - Sabtu.\r\n- Tidak ada pengiriman pada hari Minggu dan hari libur nasional.', 79999, 30, 'uploads/headsetkabel.webp', 'elektronik'),
(148, 'Putri Nadiah', 'P47M Headphone Headset Bluetooth Gaming Cat Ears Wireless', 'Deskripsi:\r\n Material: Leather+PVC\r\n Type: Wireless+Wired\r\n Bluetooth Version : 5.0\r\n Baterai specifications 200 mAh\r\n Compatible: for Smartphone/ bluetooth devices/ devices with 3.5mm audio jeck\r\n Wearing method: head-mounted\r\n Headphone output source: universal\r\n Charging voltage 5V/1A\r\n Charging time about 2,5 hours\r\n\r\nSupport :\r\n Control Button : Yes\r\n Volume Control : Yes\r\n Active Noise-Cancellation : Yes\r\n Style : Ear Hook\r\n Sensitivity : 125dB\r\n Line Length : 0m\r\n Function : for Video Game\r\n Function : Common Headphone\r\n Function : For Mobile Phone\r\n\r\nSpecification:\r\n Bluetouch Versio: V5 0\r\n Plug Diameter: 40mm\r\n Net Weight: 200g\r\n Wireless Working Range: 10M (Whitout Obstacles)\r\n Speaker: 40mm\r\n Speaker Frequency: 20Hz-20KHz\r\n Battery: 3.7V\r\n Play time: 5H\r\n Talk time: 5H\r\n Charging time: About 2,5 Hours\r\n Slot Memory Card\r\n Bisa Di Tekuk\r\n\r\n\r\nPackage: 1pc* Headphones Cat-Ears\r\n\r\n\r\nTalking / music time : LED light turn on for about 7 hours / turn off for about 20 hours', 23987, 30, 'uploads/headsetkucing.webp', 'elektronik'),
(149, 'Raihan Wahyu', 'LEMARI PLASTIK LEMARI PAKAIAN KACA DAN KUNCI', 'WARNA PUTIH\r\n4 SSN KACA + KUNCI PUTIH\r\nMAX ORDER 1 PCS DALAM 1X CEKOUT\r\nPENGIRMAN MOTIF SESUAI STOCK YG TERSEDIA YA KA \r\n\r\nPRODUK YANG KAMI KIRIM AKAN KAMI CEK TRLBH DAHULU AGAR TIDAK ADA KERUSAKAN MAUPUN KEKURANGAN MOHON VIDEO UNBOXING KETIKA BARANG SAMPAI\r\nJIKA ADA KENDALA BISA HUB SAYA TERLEBIH DAHULU AKAN DI BANTU \r\n\r\nPEMASANGAN MUDAH\r\nLEMARI BONGKAR PASANG\r\n\r\n\r\nANTI RAYAP\r\nANTI KARAT\r\nANTI JAMUR\r\nANTI AIR\r\nANTI BANJIR', 229900, 30, 'uploads/lemariplastik.webp', 'Dekorasi'),
(150, 'Raihan Wahyu', 'Wallpaper Dinding Stiker Wallfoam 3D Sticker Dekorasi Kamar', ' Ukuran : 35cmX 30cm /  70cm X 15cm. Thickness   : 3mm. Bahan: Busa. Kategori: stiker wallpaper. Pola: 3D. Gaya pasta dinding: stiker dinding 3D\r\n\r\nFitur Produk:\r\n✅ Panel dekorasi dinding lingkungan berkualitas tinggi\r\n- Bahan wallpaper busa bata 3D AMAN, tidak ada deteksi logam berat berbahaya (timbal, kadmium, merkuri)\r\n\r\n✅ Mudah dibersihkan\r\n-Tahan air, tahan lembab dan berisolasi suara. Mudah dibersihkan dan dirawat dengan kain basah, bahan penutup dinding ekonomis.\r\n\r\n✅ Mudah digunakan\r\n- Self adhesive peel and stick wallpaper, easy paste and remove sticker.Mudah dipotong & DIY bentuknya sesuai dengan area ruangan Anda, sangat MENARIK!\r\n\r\n✅ Multi guna\r\n- Dinding unggulan, Dinding kotor, dinding TV, latar belakang Sofa, dinding ruang tamu, dinding kamar tidur, dapur, kamar anak-anak, tangga. Latar belakang Penerimaan Kantor dan di atas kaca, permukaan yang dicat, papan kayu, permukaan dinding, dll.\r\n\r\nT: Bisakah menempel di kayu lapis?\r\nA: Ya, karena itu lem yang diperkuat!\r\nT: Apakah produk akan dilipat?\r\nA: Produk tidak akan dilipat.\r\nT: Bagaimana cara menggunakannya?\r\nA: Bersihkan frist dinding, Sobek kertas dan tempel\r\n\r\n☆ Sebelum memulai: Bersihkan permukaan halus dari debu / perekat / kotoran\r\n☆ Lepaskan kertas antistick dan tempelkan secara menyeluruh di dinding', 984, 30, 'uploads/wallpaper.webp', 'Dekorasi'),
(151, 'Raihan Wahyu', 'Dejavu Tong Sampah Plastik Tertutup Minimalis Tempat Sampah Dengan Klik Otomatis Kotak Sampah HSB602', 'Tempat Sampah merupakan merupakan produk tempat sampah dengan material Plastik yang terbaik. Memiliki kualitas terbaik yang membuat tempat sampah ini kuat dan tahan lama. Dengan desain yang menarik, simple dan harga yang ekonomis. Tempat sampah ini cocok digunakan dirumah, perkantoran, atau di ruang terbuka umum.\r\n\r\nKelebihan Produk :\r\n☞Tempat sampah design minimalis dan colurful\r\n☞Cocok untuk di dalam ruangan\r\n☞Mudah untuk dipindahkan dilengkapi dengan gagang\r\n☞Menjaga ruangan tetap bersih\r\n☞Cocok untuk di kamar mandi\r\n☞Terbuka dengan sekali tekan\r\n☞Mudah digunakan\r\n☞Tersedia dalam 2 ukuran\r\n☞Bahan plastik lentur dan awet\r\n\r\n✿Varian 602\r\n✿Bahan : Plastik\r\n✿Warna : Putih, HItam, Abu, Biru，Cream Kitty，Cream Astro，Cream Rusa\r\n✿Varian : Sedang dan Besar\r\n✿Ukuran\r\n✿Besar : 15cm/17.5cm x 23cm/25.5cm x 34.5cm\r\n\r\n✿Varian 785\r\n✿Bahan : Plastik\r\n✿Warna : Pink, Biru Muda, Biru Tua\r\n✿Ukuran : 14cm x 14cm \r\n\r\n✿Varian 161\r\n✿Bahan : Plastik\r\n✿Ukuran : Biru，Abu，Pink，Cream Kitty，Cream Astro\r\n✿Besar : 21cm*21cm*31cm\r\n✿UNTUK LEBIH JELAS UKURAN DAN MODEL VARIANNYA BISA LIHAT DI GAMBAR VARIAN KAMI YA\r\n\r\nWAJIB tambahan bubble agar lebih aman bisa klik link ini : \r\nhttps://shopee.co.id/product/281272694/9616255188/\r\n\r\nMOHON DI BACA : \r\nKOMPLAIN tanpa video pembukaan tidak di anggap sah. \r\nSeller TIDAK BERTANGGUNG JAWAB atas segala kerusakan yang terjadi pada pengiriman\r\n\r\n●Noted : \r\n●pesanan akan dikirimkan sesuai pilihan yang di checkout, tidak tulis dicatatan\r\n●jika barang yang di order produk atau warnanya habis,maka akan diganti langsung dengan produk atau warna lain\r\n\r\n#tempatsampah #kotaksampah #storagesampah #tempatsampahplastik #tempahsampahdapur #tempatsampahkamarmandi #tempatsampahruangtamu \r\n#tempatsampahkantor ', 18990, 30, 'uploads/t4sampah.webp', 'Dekorasi'),
(152, 'Raihan Wahyu', 'Dejavu Keset Diatomite Kamar Mandi Keset Lantai Kaki Bundar Batu Anti Slip Karet HRD325', 'HBC345 \r\nBahan:Crystal Velvet Beludru\r\n\r\nKeset lantai penyerap super dengan bahan yang lembut, nyaman dan terasa nyaman. Itu dapat digulung dengan bebas untuk penyimpanan mudah. Membuat rumah bersih, hangat dan nyaman. Keset lantai anti selip terbuat dari Crystal Velvet Beludru, yang lebih cepat kering daripada keset lantai biasa. Bagian bawah karet anti-selip digenggam dengan kuat untuk meningkatkan keamanan dan stabilitas.\r\n\r\n\r\nTerbuat Dari Bahan Berkualitas Tinggi, Daya Resapan Air Yang Kuat, Lembut Dan Nyaman.\r\nDesain Bawah Terdapat Karet Sehingga Anti-Selip, Bernapas Dan Tahan Jamur.\r\nCocok Untuk Kamar Mandi, Dapur, Ruang Tamu, dll.\r\n\r\nFitur :\r\n* Keset lentur dan bisa digulung\r\n* Mudah dibersihkan, bisa dg menggunakan mesin cuci\r\n* Keset Diatomite menghemat waktu anda 10-30 menit yang terbuang untuk membersihkan noda keset biasa.\r\n* Super Absorbent / Sangat Cepat Menyerap Air\r\n* Membuat kaki nyaman dan kering\r\n* Karet lembut, anti slip\r\n* Diatomite sangat berpori dan mampu menahan air hingga 150% dari beratnya. Terdapat banyak pori dipermukaan yang berfungsi mengontrol kelembapan dan penghilang bau. Karena karakteristiknya yang cepat menyerap kelembaban, tungau tidak dapat bertahan dan berkembang biak, kondisi ini membuat lingkungan bersih dan higienis.\r\nUNTUK LEBIH JELAS UKURAN DAN MODEL VARIANNYA BISA LIHAT DI GAMBAR VARIAN KAMI YA\r\n\r\nBahan :\r\n325/326/327/328/329 bahan Diatomite\r\nVarian JY = Crystal Velvet Beludru\r\nUkuran : \r\n325/326/327/328 : 60cm x 40cm ( Ketebalan: 0.2mm kain penyerap + karet 3.4mm )\r\n329 : 40cm * 35cm ( Ketebalan: 0.2mm kain penyerap + karet 3.4mm )\r\n345 : 40cm x 60cm\r\n\r\nWAJIB tambahan bubble agar lebih aman bisa klik link ini : \r\nhttps://shopee.co.id/product/281272694/9616255188/\r\n\r\nMOHON DI BACA : \r\nKOMPLAIN tanpa video pembukaan tidak di anggap sah. \r\nSeller TIDAK BERTANGGUNG JAWAB atas segala kerusakan yang terjadi pada pengiriman\r\n\r\nNoted : \r\n- pesanan akan dikirimkan sesuai pilihan yang di checkout, tidak tulis dicatatan\r\n- jika barang yang di order produk atau warnanya habis,maka akan diganti langsung dengan produk atau warna lain\r\n\r\n#Kesetlantai #kesetkamarmandi #karpetlantai #karpetlantai #karpetantislip #warnawarni #kesetkaki #kesetkamarmandi #kesetantislip #kesetdapur #kesetlantai #perlengkapanrumah #iburumahtangga #perlengkapandapur #alatdapur #karpetdapur ', 11500, 30, 'uploads/keset.webp', 'Dekorasi'),
(153, 'Raihan Wahyu', 'Rak Dapur 4 Susun Rak Troli Serbaguna Rak Persegi Rak Segitiga', 'Deskripsi Produk :\r\n\r\nRak Susun Serbaguna square ini berbahan plastic tebal dan  pola berrongga pada setiap rak sehingga tetap kering, tidak lembap dan anti-bakteri. Didesain modern dan minimalis, dapat mempercantik ruangan Anda dan terlihat lebih rapih. Rak Serbaguna ini juga dapat digunakan dimana saja seperti, kamar mandi, ruang tamu, kamar tidur dll. Rak ini juga cocok untuk anak-anak dan dewasa. \r\n\r\nKeunggulan  Produk :\r\n\r\n- Berbahan plastic tebal sangat kokoh dan lebih tahan lama.\r\n\r\n- Didesain berongga pada setiap susunnya sehingga anti bakteri dan tetap kering \r\n\r\n- Mudah dibersihkan \r\n\r\n- Cocok digunakan untuk di kamar mandi juga karena air akan langsung jatuh kebawa\r\n\r\n- Bisa ditempatkan dimana saja dan untuk macam-macam peralatan rumah tangga, peralatan mandi, bumbu dapur, \r\n\r\n  snack, pakaian, handuk, buku, mainan anak, hiasan dll\r\n\r\n- Pada setiap rak dilengkapi pagar pembatas untuk mencegah barang jatuh. \r\n\r\n- Mempunyai fitur roda  \r\n\r\n- Roda juga dapat dilepas jika ingin diletakkan diatas meja\r\n\r\n- Pemasangan juga sangat mudah, simple dan praktis\r\n\r\n \r\n\r\nTersedia :\r\n\r\n-Rak 2 Tingkat\r\n\r\n-Rak 3 Tingkat\r\n\r\n-Rak 4 tingkat dengan Roda 360 derajat', 35890, 30, 'uploads/rak.webp', 'Dekorasi'),
(154, 'Raihan Wahyu', 'Paus Biru - Wall Border List 3D Foam Wallpaper Dinding List Stiker LIST-B', 'Paus Biru - Wall Border List adalah sentuhan dekoratif yang menyegarkan untuk ruang Anda. Dengan panjang 1.15 meter, wall border ini memberikan sentuhan istimewa pada dinding Anda dengan motif 3D yang menghadirkan kesan ruang yang lebih hidup. \r\n\r\nSPESIFIKASI\r\nUkuran: LIST-B8H...\r\nP. 1.15m x L.8cm x Tebal 0.75cm\r\nUkuran: LIST-B5H...\r\nP. 1.15m x L.5cm x Tebal 0.65cm\r\nBahan: Foam Empuk (XPE)', 4200, 30, 'uploads/list.webp', 'Dekorasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `Sellers`
--

CREATE TABLE `Sellers` (
  `seller_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `store_address` text DEFAULT NULL,
  `bank_num` varchar(20) NOT NULL,
  `bank_type` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `Sellers`
--

INSERT INTO `Sellers` (`seller_name`, `email`, `password`, `store_name`, `store_address`, `bank_num`, `bank_type`) VALUES
('Adjriel Ibra', 'adjriel@amikom', 'adj123', 'djrl_store', 'kelapa kampit, belitung timur', '32198478291', 'BRI'),
('admin', 'admin@amikom', 'admin', 'admin_store', 'rumah admin', '123123123', 'BRI'),
('Anas Alawy', 'alwy@amikom', 'alw123', 'kebument_store', 'kebumen, jawa tengah', '42983017482', 'BRI'),
('Putri Nadiah', 'nadiah@amikom', 'pnd123', 'toko_nadiah', 'sleman, yogyakarta', '539387128742', 'MANDIRI'),
('Raihan wahyu', 'raihanGondrong@amikom', 'rwp123', 'gondrongShop', 'klate, jawa tengah', '42917582795', 'BNI'),
('Zahwa erliandara', 'zahwa_er@amikom', 'zhw123', 'zhw store', 'tanjung pandan, belitung', '43198765783', 'MANDIRI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `Transactions`
--

CREATE TABLE `Transactions` (
  `transaction_id` int(11) NOT NULL,
  `buyer_name` varchar(255) NOT NULL,
  `seller_name` varchar(255) NOT NULL,
  `total_price` int(10) NOT NULL,
  `status` enum('pending','paid','shipped','completed','cancelled') DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `Transactions`
--

INSERT INTO `Transactions` (`transaction_id`, `buyer_name`, `seller_name`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(29, 'buyer1', 'Raihan wahyu', 264400, 'shipped', '2024-12-30 10:33:15', '2024-12-31 03:18:06'),
(30, 'buyer1', 'Raihan wahyu', 264400, 'pending', '2024-12-30 10:34:04', '2024-12-30 10:34:04'),
(31, 'buyer1', 'Adjriel Ibra', 230000, 'completed', '2024-12-30 10:35:57', '2024-12-31 03:37:49'),
(32, 'buyer1', 'Adjriel Ibra', 230000, 'completed', '2024-12-30 14:10:46', '2024-12-30 17:44:41'),
(33, 'buyer1', 'Putri Nadiah', 882000, 'pending', '2024-12-30 14:10:53', '2024-12-30 14:10:53'),
(34, 'buyer1', 'Anas Alawy', 45000, 'pending', '2024-12-30 14:11:02', '2024-12-30 14:11:02'),
(35, 'buyer1', 'Putri Nadiah', 329600, 'pending', '2024-12-30 18:30:03', '2024-12-30 18:30:03'),
(36, 'buyer1', 'Raihan wahyu', 264400, 'pending', '2024-12-30 19:47:40', '2024-12-30 19:47:40'),
(37, 'buyer1', 'Putri Nadiah', 349100, 'pending', '2024-12-31 03:16:22', '2024-12-31 03:16:22'),
(38, 'admin', 'Adjriel Ibra', 460000, 'cancelled', '2025-01-13 05:06:43', '2025-01-13 05:34:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_items`
--

CREATE TABLE `transaction_items` (
  `transaction_item_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaction_items`
--

INSERT INTO `transaction_items` (`transaction_item_id`, `transaction_id`, `product_id`, `quantity`, `total_price`) VALUES
(1, 29, 123, 1, 34500),
(2, 29, 149, 1, 229900),
(3, 30, 123, 1, 34500),
(4, 30, 149, 1, 229900),
(5, 31, 139, 1, 230000),
(6, 32, 139, 1, 230000),
(7, 33, 144, 3, 882000),
(8, 34, 128, 1, 45000),
(9, 35, 144, 1, 294000),
(10, 35, 118, 1, 35600),
(11, 36, 123, 1, 34500),
(12, 36, 149, 1, 229900),
(13, 37, 144, 1, 294000),
(14, 37, 118, 1, 35600),
(15, 37, 117, 1, 19500),
(16, 38, 139, 2, 460000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `Buyers`
--
ALTER TABLE `Buyers`
  ADD PRIMARY KEY (`buyer_name`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `Carts`
--
ALTER TABLE `Carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `buyer_name` (`buyer_name`);

--
-- Indeks untuk tabel `Cart_Items`
--
ALTER TABLE `Cart_Items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `Chat`
--
ALTER TABLE `Chat`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indeks untuk tabel `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `seller_name` (`seller_name`);

--
-- Indeks untuk tabel `Sellers`
--
ALTER TABLE `Sellers`
  ADD PRIMARY KEY (`seller_name`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `Transactions`
--
ALTER TABLE `Transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `buyer_name` (`buyer_name`),
  ADD KEY `seller_name` (`seller_name`);

--
-- Indeks untuk tabel `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD PRIMARY KEY (`transaction_item_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `Carts`
--
ALTER TABLE `Carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `Cart_Items`
--
ALTER TABLE `Cart_Items`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `Chat`
--
ALTER TABLE `Chat`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=696;

--
-- AUTO_INCREMENT untuk tabel `Products`
--
ALTER TABLE `Products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT untuk tabel `Transactions`
--
ALTER TABLE `Transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `transaction_items`
--
ALTER TABLE `transaction_items`
  MODIFY `transaction_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `Carts`
--
ALTER TABLE `Carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`buyer_name`) REFERENCES `Buyers` (`buyer_name`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `Cart_Items`
--
ALTER TABLE `Cart_Items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `Carts` (`cart_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_name`) REFERENCES `Sellers` (`seller_name`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `Transactions`
--
ALTER TABLE `Transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`buyer_name`) REFERENCES `Buyers` (`buyer_name`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`seller_name`) REFERENCES `Sellers` (`seller_name`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD CONSTRAINT `transaction_items_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  ADD CONSTRAINT `transaction_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
