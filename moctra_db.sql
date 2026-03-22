-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2026 at 09:54 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moctra_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  `button_text` varchar(50) DEFAULT NULL,
  `button_link` varchar(255) DEFAULT NULL,
  `section` varchar(50) DEFAULT 'home' COMMENT 'home, promotion, sidebar...',
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `subtitle`, `image_url`, `button_text`, `button_link`, `section`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 'Trà Thảo Mộc', '', 'assets/images/banners/1769605666280_1495087762.jpg', 'Xem Ngay', 'san-pham?category=1', 'home', NULL, 1, '2026-01-28 13:07:46', '2026-01-28 13:07:46'),
(4, 'Nguyên Liệu Trà Sữa', '', 'assets/images/banners/1769605714756_1075938731.jpg', 'Xem Ngay', 'san-pham?category=2', 'home', NULL, 1, '2026-01-28 13:08:34', '2026-01-28 13:08:34');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `description`, `is_active`) VALUES
(1, 'Kiến thức trà', 'kien_thuc_tra', 'Chia sẻ kiến thức về trà, cách chọn trà, bảo quản và thưởng thức.', 1),
(2, 'Công thức pha chế', 'cong_thuc_pha_che', 'Các công thức pha trà, trà sữa, topping và biến tấu tại nhà.', 1),
(3, 'Tin tức & ưu đãi', 'tin_tuc_uu_dai', 'Tin tức cửa hàng, chương trình khuyến mãi, sự kiện theo mùa.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status` enum('draft','published','archived') DEFAULT 'draft',
  `views_count` int(11) DEFAULT 0,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `title`, `slug`, `excerpt`, `content`, `featured_image`, `author_id`, `category_id`, `status`, `views_count`, `meta_title`, `meta_description`, `created_at`) VALUES
(1, 'Cách phân biệt trà ô long chất lượng chỉ trong 3 phút', 'cach-phan-biet-tra-o-long-chat-luong-chi-trong-3-phut', 'Một vài dấu hiệu đơn giản giúp bạn nhận biết ô long ngon: mùi hương, màu nước, hậu vị và độ bền nước.', '<p>Ô long ngon thường có mùi hương rõ nhưng không gắt, lớp hương bền và sạch. Khi pha, màu nước trong, không đục, vị đầu êm và hậu ngọt kéo dài. Bạn có thể quan sát lá trà sau khi nở: lá đều, ít vụn, không có mùi lạ.</p><p>Nếu trà cho nhiều nước (pha 4–6 lần vẫn còn vị) thì chất lượng thường ổn hơn. Ngoài ra, bảo quản cũng quan trọng: nên để kín, tránh ẩm, tránh nắng và mùi mạnh trong bếp.</p><p>Khi mua trà, hãy ưu tiên nơi có nguồn gốc rõ ràng và thử pha mẫu để cảm nhận độ sạch của hương.</p>', 'assets/images/blog/1769613708336.png', 15, 1, 'published', 1, 'Cách phân biệt trà ô long chất lượng', 'Hướng dẫn nhận biết ô long ngon qua mùi hương, màu nước, hậu vị và độ bền nước khi pha.', '2025-12-05 03:15:00'),
(2, '5 sai lầm khi bảo quản trà khiến trà nhanh mất hương', '5-sai-lam-khi-bao-quan-tra-khien-tra-nhanh-mat-huong', 'Bảo quản sai cách làm trà bay hương, hút ẩm và biến vị. Dưới đây là 5 lỗi phổ biến và cách khắc phục.', '<p>Trà rất dễ hút ẩm và hút mùi. Sai lầm thường gặp là để trà trong hũ không kín, đặt gần gia vị hoặc khu vực có mùi mạnh. Một lỗi khác là mở hũ nhiều lần và để lâu ngoài không khí, khiến trà oxy hóa nhanh.</p><p>Bạn nên dùng hũ kín, ưu tiên thủy tinh tối màu hoặc túi zip có van, để nơi khô ráo và mát. Nếu mua nhiều, hãy chia nhỏ theo từng lần dùng để giảm số lần mở nắp và giữ hương tốt hơn.</p><p>Tránh để trà cạnh bếp nấu và hạn chế dùng muỗng ướt khi lấy trà.</p>', 'assets/images/blog/1769613476896.png', 16, 1, 'published', 42, '5 sai lầm bảo quản trà', 'Các lỗi bảo quản khiến trà mất hương và cách xử lý để trà giữ mùi vị lâu hơn.', '2025-12-12 12:40:00'),
(3, 'Thưởng trà đúng cách: nhiệt độ nước và thời gian ủ cho từng loại trà', 'thuong-tra-dung-cach-nhiet-do-nuoc-va-thoi-gian-u-cho-tung-loai-tra', 'Nhiệt độ và thời gian ủ quyết định 70% chất lượng ly trà. Mỗi loại trà có “ngưỡng đẹp” riêng.', '<p>Với trà xanh, nhiệt độ nước thường phù hợp khoảng 75–85°C để tránh chát gắt; thời gian ủ ngắn 30–60 giây cho nước đầu. Trà ô long có thể dùng nước nóng hơn (85–95°C) và ủ 20–40 giây cho những lần đầu, tăng dần theo số nước.</p><p>Trà đen thường “chịu nhiệt” tốt hơn, có thể 90–100°C và ủ 2–4 phút tùy khẩu vị. Bạn nên thử điều chỉnh theo loại trà cụ thể và cảm nhận hậu vị để chốt công thức pha phù hợp.</p><p>Nếu dùng ấm nhỏ, tăng số lần rót để giữ vị ổn định.</p>', 'assets/images/blog/1769613550744.png', 17, 1, 'published', 7, 'Nhiệt độ nước và thời gian ủ trà', 'Hướng dẫn nhiệt độ nước và thời gian ủ tối ưu cho trà xanh, ô long và trà đen để tránh đắng chát.', '2026-01-08 02:20:00'),
(4, 'Công thức trà sữa ô long chuẩn vị, ít ngọt nhưng thơm béo', 'cong-thuc-tra-sua-o-long-chuan-vi-it-ngot-nhung-thom-beo', 'Trà sữa ô long cân bằng giữa hương trà và độ béo của sữa. Công thức này dễ làm tại nhà.', '<p>Để trà sữa ô long thơm nhưng không bị chát, hãy pha trà ở 90°C, ủ 30–45 giây cho nước đầu, sau đó lọc ngay. Dùng sữa tươi và một ít kem béo để tạo độ mượt, thêm syrup đường nâu theo mức ngọt mong muốn.</p><p>Nếu thích vị “đậm trà”, có thể tăng lượng trà nhưng giảm thời gian ủ. Khi lắc với đá, bạn sẽ có lớp bọt mịn và mùi hương bùng lên rõ rệt.</p><p>Có thể thêm chút muối biển để vị béo nổi bật hơn.</p>', 'assets/images/blog/1769613415687.png', 18, 2, 'published', 89, 'Công thức trà sữa ô long ít ngọt', 'Cách làm trà sữa ô long tại nhà: thơm hương trà, béo mượt, ít ngọt và không bị chát.', '2025-12-18 07:05:00'),
(5, 'Pha trà đào cam sả tại nhà: thơm mát, dễ uống', 'pha-tra-dao-cam-sa-tai-nha-thom-mat-de-uong', 'Trà đào cam sả có vị chua ngọt nhẹ, mùi sả thoang thoảng, phù hợp ngày nóng.', '<p>Bạn chuẩn bị trà đen hoặc ô long, đào ngâm, cam tươi và sả đập dập. Pha trà đậm hơn bình thường một chút để khi thêm đá không bị nhạt. Đun sả cùng một ít nước đường để lấy hương, sau đó hòa với trà, thêm nước cam vắt và miếng đào.</p><p>Chỉnh lại vị bằng đường hoặc mật ong. Khi uống, mùi sả và cam nổi rõ, hậu trà nhẹ, rất dễ “ghiền”.</p><p>Nếu muốn thanh hơn, giảm syrup và tăng cam tươi.</p>', 'assets/images/blog/1769613682820.png', 19, 2, 'published', 15, 'Trà đào cam sả tại nhà', 'Công thức trà đào cam sả: cân bằng chua ngọt, thơm sả và cam, pha nhanh tại nhà.', '2025-12-25 09:30:00'),
(6, '3 cách làm topping trân châu mềm dai không bị cứng', '3-cach-lam-topping-tran-chau-mem-dai-khong-bi-cung', 'Trân châu ngon là mềm dai, không bở, không cứng lõi. Đây là 3 mẹo quan trọng khi nấu.', '<p>Đầu tiên, đun nước thật sôi rồi mới thả trân châu để không bị dính và không bị cứng lõi. Thứ hai, luộc đúng thời gian theo loại trân châu và ủ thêm trong nồi để hạt chín đều.</p><p>Thứ ba, sau khi vớt ra, ngâm ngay vào nước đường (hoặc mật ong) để giữ độ mềm, tránh khô. Nếu bảo quản lâu, hãy đậy kín và dùng trong ngày để chất lượng ngon nhất.</p><p>Khi thấy trân châu hơi khô, có thể hâm nhẹ với chút nước đường cho mềm lại.</p>', 'assets/images/blog/1769613580038.png', 20, 2, 'published', 31, 'Cách nấu trân châu mềm dai', 'Mẹo luộc và ủ trân châu để mềm dai, không cứng lõi, giữ ngon lâu với nước đường.', '2026-01-03 04:10:00'),
(7, 'Matcha latte kiểu dễ: giữ mùi matcha, không bị tanh', 'matcha-latte-kieu-de-giu-mui-matcha-khong-bi-tanh', 'Matcha latte ngon phụ thuộc vào bước đánh tan matcha và tỷ lệ sữa phù hợp.', '<p>Để matcha không bị vón và không tanh, bạn rây bột matcha trước khi pha. Dùng nước nóng khoảng 70–80°C, đánh matcha bằng chổi hoặc whisk đến khi bọt mịn. Sau đó thêm sữa tươi lạnh hoặc sữa nóng tùy thích.</p><p>Có thể thêm một chút syrup vani hoặc đường để làm tròn vị. Nếu muốn “đậm matcha”, tăng bột nhưng giữ nhiệt độ nước vừa phải để mùi thơm lên rõ.</p><p>Với phiên bản đá, nên dùng sữa lạnh và matcha đậm để không bị nhạt.</p>', 'assets/images/blog/1769613517870.png', 21, 2, 'published', 66, 'Matcha latte không tanh', 'Cách pha matcha latte tại nhà: rây bột, đánh bọt đúng nhiệt độ để thơm và không bị tanh.', '2026-01-10 13:45:00'),
(8, 'Trà gừng mật ong ấm bụng: pha thế nào để không bị hăng', 'tra_gung_mat_ong_am_bung_pha_the_nao_de_khong_bi_hang', 'Gừng tốt nhưng dễ hăng. Pha đúng cách sẽ ấm bụng, thơm dịu và dễ uống hơn.', '<p>Bạn có thể nướng sơ hoặc đập dập gừng rồi hãm với nước nóng 90–95°C khoảng 5–7 phút để mùi thơm dịu hơn. Khi nước gừng bớt nóng (dưới khoảng 60°C) mới cho mật ong để giữ hương.</p><p>Nếu thích vị trà, thêm một ít trà đen/ô long đã pha sẵn để tạo nền. Điều chỉnh lượng gừng theo khẩu vị để tránh cay nồng quá mức.</p><p>Có thể thêm lát chanh mỏng để vị sáng hơn nhưng nhớ cho khi nước nguội bớt.</p>', 'assets/images/tra_gung_mat_ong.png', 22, 2, 'published', 12, 'Trà gừng mật ong không hăng', 'Hướng dẫn pha trà gừng mật ong ấm bụng, thơm dịu, tránh bị hăng và cay nồng quá mức.', '2025-12-28 01:55:00'),
(10, 'Chương trình đầu năm 2026: mua 2 tặng 1 cho nhóm trà thảo mộc', 'chuong-trinh-dau-nam-2026-mua-2-tang-1-cho-nhom-tra-thao-moc', 'Ưu đãi đầu năm cho dòng trà thảo mộc: mua 2 tặng 1 trong thời gian giới hạn.', '<p>Đầu năm 2026, cửa hàng triển khai chương trình mua 2 tặng 1 áp dụng cho một số sản phẩm trà thảo mộc được chọn. Mục tiêu là giúp bạn dễ trải nghiệm nhiều hương vị mới và chọn ra set hợp nhất với nhu cầu.</p><p>Bạn có thể kết hợp các vị khác nhau trong cùng nhóm ưu đãi. Khi thanh toán, hệ thống sẽ tự động áp dụng theo điều kiện, bạn chỉ cần chọn đúng sản phẩm thuộc danh sách.</p><p>Chương trình có thể kết thúc sớm nếu hết số lượng quà tặng.</p>', 'assets/images/blog/1769613499721.png', 24, 3, 'archived', 4, 'Ưu đãi đầu năm 2026 mua 2 tặng 1', 'Chương trình đầu năm 2026: mua 2 tặng 1 áp dụng cho nhóm trà thảo mộc trong thời gian giới hạn.', '2026-01-15 11:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(3, 16, 178, 1, '2026-01-28 14:40:34', '2026-01-28 14:40:34'),
(4, 16, 195, 1, '2026-01-28 14:40:40', '2026-01-28 14:40:40'),
(5, 16, 94, 1, '2026-01-28 14:40:46', '2026-01-28 14:40:46'),
(6, 16, 37, 1, '2026-01-28 14:40:50', '2026-01-28 14:40:50'),
(7, 16, 45, 1, '2026-01-28 14:41:01', '2026-01-28 14:41:01'),
(13, 15, 179, 1, '2026-01-29 02:43:36', '2026-01-29 02:43:36'),
(20, 3, 179, 1, '2026-01-29 03:11:48', '2026-01-29 03:11:48'),
(21, 3, 178, 4, '2026-01-29 03:13:05', '2026-01-29 04:26:04');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `is_active`) VALUES
(1, 'Trà Thảo Mộc', 'tra-thao-moc', NULL, 1),
(2, 'Nguyên Liệu Trà Sữa', 'nguyen-lieu-tra-sua', NULL, 1),
(3, 'Hồng Trà', 'hong-tra', 1, 1),
(4, 'Lục Trà (Trà Xanh)', 'luc-tra', 1, 1),
(5, 'Trà Oolong', 'tra-oolong', 1, 1),
(6, 'Trà Hoa Quả', 'tra-hoa-qua', 1, 1),
(7, 'Trân Châu', 'tran-chau', 2, 1),
(8, 'Bột Sữa & Bột Kem', 'bot-sua-bot-kem', 2, 1),
(9, 'Siro & Mứt', 'siro-mut', 2, 1),
(10, 'Topping Khác (Thạch/Pudding)', 'topping-khac', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `order_number` varchar(50) NOT NULL,
  `status` enum('pending','completed','cancelled') DEFAULT 'pending',
  `total_amount` decimal(15,2) NOT NULL,
  `shipping_fee` decimal(15,2) DEFAULT 0.00,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` enum('pending','paid') DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `shipping_address_id`, `order_number`, `status`, `total_amount`, `shipping_fee`, `payment_method`, `payment_status`, `notes`, `created_at`) VALUES
(1, 1, 1, 'ORD-20260128-001', 'pending', 290000.00, 15000.00, 'COD', 'pending', 'Giao giờ hành chính', '2026-01-28 14:52:33'),
(2, 2, 2, 'ORD-20260128-002', 'pending', 145000.00, 15000.00, 'COD', 'pending', '', '2026-01-28 14:52:33'),
(3, 3, 3, 'ORD-20260128-003', 'cancelled', 500000.00, 0.00, 'BANKING', 'paid', 'Đã chuyển khoản', '2026-01-28 14:52:33'),
(4, 4, 4, 'ORD-20260128-004', 'pending', 85000.00, 20000.00, 'COD', 'pending', '', '2026-01-28 14:52:33'),
(5, 5, 5, 'ORD-20260128-005', 'pending', 1200000.00, 0.00, 'BANKING', 'pending', 'Giao gấp', '2026-01-28 14:52:33'),
(6, 6, 6, 'ORD-20260127-006', 'pending', 160000.00, 15000.00, 'COD', 'pending', 'Gọi trước khi đến', '2026-01-27 14:52:33'),
(7, 7, 7, 'ORD-20260127-007', 'pending', 95000.00, 20000.00, 'MOMO', 'paid', '', '2026-01-27 14:52:33'),
(8, 8, 8, 'ORD-20260126-008', 'pending', 320000.00, 15000.00, 'COD', 'pending', '', '2026-01-26 14:52:33'),
(9, 9, 9, 'ORD-20260126-009', 'pending', 110000.00, 15000.00, 'COD', 'pending', '', '2026-01-26 14:52:33'),
(10, 10, 10, 'ORD-20260127-010', 'pending', 75000.00, 20000.00, 'ZALOPAY', 'paid', '', '2026-01-27 14:52:33'),
(11, 11, 11, 'ORD-20251001-011', 'completed', 450000.00, 0.00, 'BANKING', 'paid', '', '2025-10-01 03:00:00'),
(12, 12, 12, 'ORD-20251002-012', 'completed', 145000.00, 15000.00, 'COD', 'paid', '', '2025-10-02 07:30:00'),
(13, 13, 13, 'ORD-20251005-013', 'completed', 600000.00, 0.00, 'MOMO', 'paid', '', '2025-10-05 02:15:00'),
(14, 14, 14, 'ORD-20251010-014', 'completed', 85000.00, 20000.00, 'COD', 'paid', '', '2025-10-10 09:20:00'),
(15, 15, 15, 'ORD-20251012-015', 'completed', 130000.00, 15000.00, 'COD', 'paid', '', '2025-10-12 04:00:00'),
(16, 16, 16, 'ORD-20251015-016', 'completed', 250000.00, 0.00, 'BANKING', 'paid', '', '2025-10-15 06:45:00'),
(17, 17, 17, 'ORD-20260120-017', 'cancelled', 95000.00, 0.00, 'COD', 'pending', 'Boom hàng', '2026-01-23 14:52:33'),
(18, 18, 18, 'ORD-20260119-018', 'cancelled', 500000.00, 0.00, 'BANKING', 'pending', 'Đổi ý', '2026-01-22 14:52:33'),
(19, 19, 19, 'ORD-20260122-019', 'cancelled', 120000.00, 0.00, 'COD', 'pending', '', '2026-01-25 14:52:33'),
(20, 20, 20, 'ORD-20260118-020', 'cancelled', 80000.00, 0.00, 'COD', 'pending', 'Sai địa chỉ', '2026-01-21 14:52:33'),
(21, 1, 1, 'ORD1769654231459', 'pending', 468500.00, 20000.00, 'momo', 'pending', '', '2026-01-29 02:37:11'),
(22, 1, 1, 'ORD1769655311445', 'pending', 657500.00, 20000.00, 'momo', 'pending', '', '2026-01-29 02:55:11'),
(23, 25, 21, 'ORD1769663804390', 'pending', 247000.00, 60000.00, 'bank', 'pending', '', '2026-01-29 05:16:44'),
(24, 1, 1, 'ORD1769666539148', 'completed', 5254000.00, 35000.00, 'momo', 'pending', '', '2026-01-29 06:02:19');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(15,2) NOT NULL COMMENT 'Giá tại thời điểm mua'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 101, 2, 145000.00),
(2, 2, 101, 1, 145000.00),
(3, 3, 111, 10, 50000.00),
(4, 4, 106, 1, 85000.00),
(5, 5, 109, 10, 120000.00),
(6, 6, 127, 2, 80000.00),
(7, 7, 102, 1, 95000.00),
(8, 8, 112, 2, 160000.00),
(9, 9, 104, 1, 110000.00),
(10, 10, 105, 1, 75000.00),
(11, 11, 178, 3, 150000.00),
(12, 12, 199, 1, 145000.00),
(13, 13, 153, 4, 150000.00),
(14, 14, 126, 1, 85000.00),
(15, 15, 136, 1, 130000.00),
(16, 16, 191, 1, 250000.00),
(17, 17, 102, 1, 95000.00),
(18, 18, 191, 2, 250000.00),
(19, 19, 109, 1, 120000.00),
(20, 20, 127, 1, 80000.00),
(21, 21, 1, 1, 120000.00),
(22, 21, 179, 1, 93500.00),
(23, 21, 183, 1, 130000.00),
(24, 21, 42, 1, 105000.00),
(25, 22, 178, 5, 127500.00),
(26, 23, 179, 2, 93500.00),
(27, 24, 178, 5, 127500.00),
(28, 24, 179, 49, 93500.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `short_description` varchar(500) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT 0.00,
  `sale_price` decimal(15,2) DEFAULT 0.00,
  `sku` varchar(50) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL COMMENT 'Ảnh đại diện chính',
  `is_bestseller` tinyint(1) DEFAULT 0,
  `status` enum('active','inactive','out_of_stock') DEFAULT 'active',
  `ingredients` text DEFAULT NULL,
  `usage_instructions` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `short_description`, `price`, `sale_price`, `sku`, `stock_quantity`, `category_id`, `image_url`, `is_bestseller`, `status`, `ingredients`, `usage_instructions`, `created_at`) VALUES
(1, 'Chè Dây Sapa Thượng Hạng', 'che-day-sapa', 'Được mệnh danh là \"thần dược\" của vùng núi Tây Bắc, Chè Dây Sapa sinh trưởng tự nhiên trong sương mù dày đặc, hấp thụ tinh hoa đất trời để tạo nên dược tính tuyệt vời. Sản phẩm có vị ngọt đắng đặc trưng, nổi tiếng với khả năng trung hòa axit dạ dày, tiêu diệt vi khuẩn HP và hỗ trợ làm lành các vết loét dạ dày tá tràng. Một tách chè dây mỗi sáng không chỉ giúp hệ tiêu hóa khỏe mạnh mà còn mang lại cảm giác an thần, ngủ ngon.', 'Khắc tinh của dạ dày, diệt khuẩn HP, hỗ trợ tiêu hóa tốt.', 120000.00, 0.00, 'TRA001', 49, 1, 'assets/images/che_day_sapa_1.png', 1, 'active', '100% thân và lá Chè Dây (Ampelopsis cantoniensis) thu hái tự nhiên tại Sapa, sấy khô theo phương pháp thủ công giữ nguyên phấn trắng (kết tinh dược liệu).', '1. Lấy khoảng 10-15g chè dây cho vào ấm.\n2. Tráng qua một lần nước sôi để đánh thức trà.\n3. Hãm với 500ml nước sôi 100 độ C trong khoảng 10 phút.\n4. Có thể uống thay nước lọc hàng ngày, ngon hơn khi uống ấm.', '2026-01-28 09:45:07'),
(2, 'Lục Trà Lài Thơm Ngát', 'luc-tra-lai', 'Sự giao thoa tinh tế giữa những búp trà xanh (Lục trà) tươi non mơn mởn và hoa lài (hoa nhài) trắng muốt ngát hương. Trà được ướp hương theo phương pháp thủ công tỉ mỉ, cứ một lớp trà lại đan xen một lớp hoa, ủ kín để hương hoa thấm sâu vào từng tế bào lá trà. Khi pha, nước trà có màu vàng xanh trong trẻo, hương lài bung tỏa nồng nàn quyến rũ, vị chát nhẹ đầu lưỡi và hậu ngọt sâu lắng, mang lại cảm giác thư thái tuyệt đối.', 'Hương hoa lài tự nhiên nồng nàn, cốt trà xanh thanh khiết.', 85000.00, 75000.00, 'TRA002', 100, 1, 'assets/images/luc_tra_lai_1.png', 0, 'active', '90% Lục trà (Trà xanh) sơ chế, 9% Hoa lài tự nhiên sấy khô, 1% Hương hoa lài tổng hợp cao cấp.', '1. Dùng 5g trà cho vào ấm dung tích 200ml.\n2. Nhiệt độ nước lý tưởng: 80-85 độ C (không dùng nước quá sôi sẽ làm cháy trà).\n3. Ủ trà trong 3-5 phút.\n4. Rót ra chén và thưởng thức hương thơm lan tỏa.', '2026-01-28 09:45:07'),
(3, 'Mật Ong Long Trà', 'mat-o-long-tra', 'Một thức uống \"chữa lành\" tâm hồn với sự kết hợp giữa Trà Oolong cao cấp và Mật ong hoa rừng nguyên chất. Vị chát thanh tao, sang trọng của Oolong được làm mềm bởi vị ngọt ngào, ấm áp của mật ong, tạo nên một tổng thể hài hòa khó cưỡng. Sản phẩm không chỉ là thức uống giải khát mà còn giúp làm đẹp da, thanh lọc cơ thể và bổ sung năng lượng tức thì cho ngày dài mệt mỏi.', 'Sự kết hợp hoàn hảo giữa Oolong đậm vị và mật ong ngọt ngào.', 150000.00, 0.00, 'TRA003', 30, 1, 'assets/images/mat_o_long_tra_1.png', 1, 'active', 'Trà Oolong (búp trà lên men bán phần), Bột mật ong hoa rừng tự nhiên, Tinh chất cam thảo.', 'Pha nóng: Hãm 5g trà với 200ml nước sôi 90 độ C trong 3 phút.\nPha lạnh: Hãm trà đậm, thêm đá viên và có thể vắt thêm một chút chanh tươi để tăng hương vị.', '2026-01-28 09:45:07'),
(4, 'Trà An Thần Ngủ Ngon', 'tra-an-than-ngu-ngon', 'Giải pháp tuyệt vời cho những đêm trằn trọc, khó ngủ. Trà An Thần là bài thuốc dân gian được phối trộn từ những thảo dược có tính bình, giúp dưỡng tâm, an thần như Tâm sen, Lạc tiên, Táo đỏ. Vị trà ngọt dịu, không đắng gắt, giúp xoa dịu hệ thần kinh, giảm căng thẳng âu lo (stress) và đưa bạn vào giấc ngủ sâu, tự nhiên, không gây mệt mỏi khi thức dậy.', 'Xua tan âu lo, tìm lại giấc ngủ ngon tự nhiên.', 95000.00, 0.00, 'TRA004', 60, 1, 'assets/images/tra_an_than_ngu_ngon_1.png', 0, 'active', 'Tâm sen (Tim sen) sao vàng hạ thổ, Lạc tiên (Chùm bao), Táo đỏ, Hoa cúc, Cỏ ngọt.', '1. Cho 1 túi lọc hoặc 10g trà vào cốc.\n2. Rót 300ml nước sôi, đậy nắp kín và đợi 10-15 phút để thảo dược tiết ra dưỡng chất.\n3. Nên uống ấm trước khi đi ngủ khoảng 30-60 phút để đạt hiệu quả tốt nhất.', '2026-01-28 09:45:07'),
(5, 'Trà Atiso Túi Lọc', 'tra-atiso-tui-loc', 'Đặc sản nổi tiếng từ vùng đất Đà Lạt ngàn hoa. Trà Atiso được xem là \"thần dược cho lá gan\", giúp thanh nhiệt, giải độc, làm mát gan và giảm mụn nhọt hiệu quả. Sản phẩm được chế biến dưới dạng túi lọc tiện lợi nhưng vẫn giữ trọn vẹn hương vị thơm ngon và dược tính của cây Atiso. Thích hợp cho người hay sử dụng rượu bia hoặc nóng trong người.', 'Mát gan, giải độc, trị mụn, đặc sản Đà Lạt.', 65000.00, 50000.00, 'TRA005', 200, 1, 'assets/images/tra_atiso_tui_loc_1.png', 0, 'active', '50% Bông Atiso, 40% Rễ Atiso, 10% Hoa cúc và Cỏ ngọt (tạo vị ngọt tự nhiên).', 'Nhúng 1-2 túi lọc vào ly nước sôi (150-200ml). Chờ 3-5 phút cho trà ngấm. Có thể thêm đường phèn hoặc mật ong tùy khẩu vị. Uống nóng hoặc đá đều ngon.', '2026-01-28 09:45:07'),
(6, 'Trà Bạc Hà The Mát', 'tra-bac-ha', 'Cảm giác sảng khoái bùng nổ ngay từ ngụm đầu tiên! Những lá bạc hà tươi xanh nhất được sấy lạnh theo công nghệ hiện đại để giữ nguyên tinh dầu Menthol quý giá. Trà Bạc Hà không chỉ giúp hơi thở thơm mát, thông mũi mát họng mà còn có tác dụng tuyệt vời trong việc hỗ trợ tiêu hóa, giảm đầy hơi và tăng cường sự tập trung khi làm việc.', 'The mát cực đỉnh, sảng khoái tinh thần, hỗ trợ tiêu hóa.', 70000.00, 0.00, 'TRA006', 80, 1, 'assets/images/tra_bac_ha_1.png', 0, 'active', '100% Lá Bạc Hà (Peppermint) nguyên chất sấy lạnh, không chất bảo quản.', 'Lấy một nhúm nhỏ lá bạc hà (khoảng 3-5g) cho vào ấm. Hãm với nước sôi 90 độ C trong 5 phút. Thêm một lát chanh và chút mật ong để tạo thành ly trà giải cảm tuyệt vời.', '2026-01-28 09:45:07'),
(7, 'Trà Bắc Thái Nguyên Đặc Biệt', 'tra-bac-thai-nguyen', 'Danh trà đất Việt - \"Thái Nguyên Đệ Nhất Danh Trà\". Những búp chè 1 tôm 2 lá được hái vào sáng sớm tinh mơ khi còn ngậm sương, sau đó trải qua quá trình sao tay điêu luyện của các nghệ nhân. Cánh trà săn nhỏ, cong như móc câu, phủ một lớp tuyết nhẹ. Nước trà xanh ong ánh vàng, tiền vị chát dịu nhưng hậu vị ngọt sâu lắng đọng mãi trong cổ họng.', 'Vị chát tiền ngọt hậu, chuẩn vị trà Bắc truyền thống.', 250000.00, 0.00, 'TRA007', 40, 1, 'assets/images/tra_bac_thai_nguyen_1.png', 1, 'active', '100% Búp chè xanh Tân Cương - Thái Nguyên loại thượng hạng.', '1. Tráng ấm chén bằng nước sôi.\n2. Cho trà vào ấm, tráng nhanh qua nước sôi để rửa trà.\n3. Hãm với nước 85-90 độ C (không dùng nước sôi già) trong 1-2 phút.\n4. Rót hết nước ra tống rồi chia đều ra các chén quân.', '2026-01-28 09:45:07'),
(8, 'Trà Bổ Tỳ Vị', 'tra-bo-ty-vi', 'Dựa trên bài thuốc Đông y cổ truyền, Trà Bổ Tỳ Vị là sự cứu cánh cho những ai có hệ tiêu hóa kém, hay ăn không tiêu, đầy bụng hoặc chán ăn. Sự phối hợp của các vị thuốc quý giúp kiện tỳ, ích khí, làm ấm bụng và kích thích vị giác, giúp bạn ăn ngon miệng hơn và hấp thu dưỡng chất tốt hơn.', 'Kiện tỳ ích khí, giúp ăn ngon, tiêu hóa khỏe.', 110000.00, 0.00, 'TRA008', 50, 1, 'assets/images/tra_bo_ty_vi_1.png', 0, 'active', 'Bạch truật, Đảng sâm, Cam thảo, Trần bì (vỏ quýt khô), Gừng sẻ, Đại táo.', 'Cho 1 gói trà vào ấm, đun sôi với 500ml nước trong khoảng 10-15 phút để ra hết chất thuốc. Chia làm 3 lần uống trong ngày, uống sau khi ăn 30 phút.', '2026-01-28 09:45:07'),
(9, 'Trà Cây Cỏ Máu', 'tra-cay-co-mau', 'Thảo dược bí truyền của người Rục, Quảng Bình. Cây Cỏ Máu (Kê Huyết Đằng) nổi tiếng với công dụng bổ máu, hành huyết, giúp da dẻ hồng hào, căng mịn. Đặc biệt tốt cho phụ nữ sau sinh giúp nhanh lại sức, lợi sữa và người gầy yếu muốn tăng cân, ăn ngủ kém. Nước trà có màu đỏ tươi đẹp mắt, vị chát ngọt lạ miệng.', 'Bổ máu, đẹp da, tăng cân, lợi sữa cho mẹ bầu.', 135000.00, 0.00, 'TRA009', 45, 1, 'assets/images/tra_cay_co_mau_1.png', 0, 'active', 'Thân cây Cỏ Máu (Kê Huyết Đằng) thái lát mỏng, phơi khô tự nhiên.', 'Rửa sạch 100g cỏ máu, đun sôi với 2 lít nước trong khoảng 20-30 phút. Nước sau khi nấu có màu đỏ đẹp, uống thay nước lọc hàng ngày. Bã trà có thể bảo quản tủ lạnh để nấu tiếp lần 2.', '2026-01-28 09:45:07'),
(10, 'Trà Cà Gai Leo Giải Độc', 'tra-ca-gai-leo', 'Lá chắn thép bảo vệ lá gan của bạn. Cà Gai Leo là thảo dược duy nhất được chứng minh có khả năng ức chế virus viêm gan B, ngăn chặn xơ gan và giải độc gan cực mạnh. Sản phẩm là lựa chọn hàng đầu cho cánh mày râu hay phải tiếp khách, uống bia rượu, hoặc người bị men gan cao, nóng trong, mẩn ngứa.', 'Giải độc gan, hạ men gan, giải rượu hiệu quả.', 90000.00, 80000.00, 'TRA010', 100, 1, 'assets/images/tra_ca_gai_leo_1.png', 1, 'active', 'Cà gai leo nguyên chất (thân, lá, rễ) sấy khô, Diệp hạ châu (Chó đẻ răng cưa).', 'Hãm 10-20g trà với 1 lít nước sôi, uống thay nước lọc trong ngày. Với người uống rượu bia, nên uống một cốc trà đặc trước và sau khi nhậu để giảm tác hại của cồn.', '2026-01-28 09:45:07'),
(11, 'Trà Cung Đình Huế', 'tra-cung-dinh-hue', 'Tinh hoa ẩm thực Cố Đô, từng là thức uống chỉ dành cho Vua Chúa. Trà Cung Đình là sự tổng hòa của hàng chục loại thảo mộc quý hiếm, tạo nên hương vị ngọt thanh tao nhã, vừa giải khát vừa bồi bổ long thể. Trà giúp thanh nhiệt, mát gan, sáng mắt, ngủ ngon và ổn định huyết áp.', 'Đặc sản Cố Đô, thanh nhiệt, bổ dưỡng, quà biếu sang trọng.', 85000.00, 0.00, 'TRA011', 150, 1, 'assets/images/tra_cung_dinh_hue_1.png', 1, 'active', 'Atiso, Cúc hoa, Cỏ ngọt, Hoài sơn, Đẳng sâm, Đại táo, Hồng táo, Hồi hoa, Cam thảo bắc, Hoa lài, Hoa hòe...', 'Trộn đều gói trà. Lấy 30g trà hãm với 500ml nước sôi. Có thể thêm đường phèn, uống nóng hoặc thêm đá lạnh đều rất ngon. Thích hợp đãi khách.', '2026-01-28 09:45:07'),
(12, 'Trà Đậu Đen Orihiro', 'tra-dau-den-orihiro', 'Sản phẩm nhập khẩu chính hãng từ Nhật Bản, được tin dùng bởi hàng triệu phụ nữ Á Đông. Đậu đen được rang theo công nghệ đặc biệt giúp hạt nở đều, thơm phức mà không bị cháy. Trà giúp thanh lọc cơ thể (Detox), hỗ trợ giảm cân an toàn, làm đen tóc và giúp da dẻ mịn màng, chống lão hóa từ bên trong.', 'Hàng Nhật nội địa, detox cơ thể, hỗ trợ giảm cân, đẹp da.', 180000.00, 0.00, 'TRA012', 30, 1, 'assets/images/tra_dau_den_orihiro_1.png', 0, 'active', '100% Đậu đen Hokkaido Nhật Bản rang sấy công nghệ cao.', 'Pha 1 túi lọc với 500ml nước sôi. Ủ khoảng 20-30 phút cho trà ra hết dưỡng chất. Uống ấm hoặc để nguội cho vào tủ lạnh dùng dần trong ngày.', '2026-01-28 09:45:07'),
(13, 'Trà Đen DalatFarm', 'tra-den-dalatfarm', 'Nguyên liệu \"linh hồn\" cho những ly trà sữa đậm vị. Được trồng tại các nông trại trên cao nguyên Lâm Đồng, lá trà đen được lên men (oxy hóa) hoàn toàn, cho ra màu nước hồng ngọc đẹp mắt và vị chát đậm đà, không bị át vị khi pha chung với bột sữa. Đây là lựa chọn số 1 cho các quán trà sữa chuyên nghiệp.', 'Chuyên pha trà sữa, vị đậm đà, màu nước đẹp.', 100000.00, 0.00, 'NL001', 200, 2, 'assets/images/tra_den_dalatfarm_1.png', 1, 'active', 'Lá trà đen (Hồng trà) lên men 100%, không hương liệu nhân tạo.', 'Ủ 50g trà với 1 lít nước sôi 100 độ C trong 15-20 phút (đậy kín nắp). Lọc bã trà lấy nước cốt. Pha với bột sữa và đường theo tỷ lệ công thức để có ly trà sữa truyền thống.', '2026-01-28 09:45:07'),
(14, 'Trà Đen Ngọc Quý', 'tra-den-ngoc-quy', 'Dòng trà đen truyền thống của Bảo Lộc, hương thơm nồng nàn quyến rũ. Khác với dòng DalatFarm đậm vị, Trà Đen Ngọc Quý có hương thơm hoa quả tự nhiên nhẹ nhàng hơn, thích hợp để pha các loại trà trái cây (Trà đào, Trà vải) hoặc trà chanh, mang lại cảm giác tươi mát, sảng khoái.', 'Hương thơm nồng, chuyên pha trà trái cây, trà đào.', 95000.00, 0.00, 'NL002', 100, 2, 'assets/images/tra_den_ngoc_quy_1.png', 0, 'active', 'Búp trà xanh lên men, hương liệu thực phẩm an toàn.', 'Ủ 10g trà với 200ml nước sôi trong 10 phút. Lấy nước cốt pha thêm syrup đào, miếng đào ngâm và đá viên để có ly trà đào chuẩn vị.', '2026-01-28 09:45:07'),
(15, 'Trà Đinh Lăng Lợi Sữa', 'tra-dinh-lang', 'Được ví như \"Nhân sâm của người nghèo\", Đinh Lăng có tác dụng bồi bổ cực tốt. Đặc biệt, sản phẩm là cứu tinh cho các mẹ bỉm sữa bị tắc tia sữa hoặc ít sữa. Ngoài ra, uống trà Đinh Lăng còn giúp tăng cường trí nhớ, giảm đau đầu, chóng mặt và cải thiện tình trạng đau lưng mỏi gối ở người lớn tuổi.', 'Lợi sữa cho mẹ bầu, tăng cường trí nhớ, giảm đau lưng.', 120000.00, 0.00, 'TRA013', 40, 1, 'assets/images/tra_dinh_lang_1.png', 0, 'active', 'Rễ củ và lá cây Đinh Lăng lá nhỏ sao vàng hạ thổ.', 'Cho 20g trà vào ấm, đổ nước sôi ngập trà rồi chắt bỏ nước đầu. Đổ tiếp 500ml nước sôi, hãm 15 phút rồi uống. Nước trà có vị ngọt nhẹ, mùi thơm đặc trưng.', '2026-01-28 09:45:07'),
(16, 'Trà Dồi Thân Tím', 'tra-doi-than-tim', 'Một loại thảo dược quý hiếm mọc ở vùng núi đá, ít người biết đến nhưng công dụng lại vô cùng thần kỳ. Trà Dồi Thân Tím chuyên trị các vấn đề về dạ dày, đường ruột, giúp giảm đau bụng, đầy hơi. Ngoài ra, theo kinh nghiệm dân gian, loại cây này còn hỗ trợ giảm đau nhức xương khớp khi thay đổi thời tiết.', 'Hỗ trợ tiêu hóa, giảm đau xương khớp, thảo dược vùng cao.', 115000.00, 0.00, 'TRA014', 35, 1, 'assets/images/tra_doi_than_tim_1.png', 0, 'active', 'Thân và lá cây Dồi Tím sấy khô tự nhiên.', 'Rửa sạch, đun sôi với nước uống thay trà hàng ngày. Vị trà hơi chát nhẹ, tính mát, rất dễ uống.', '2026-01-28 09:45:07'),
(17, 'Trà Đông Tử Vị', 'tra-dong-tu-vi', 'Thức uống thượng hạng dành cho sức khỏe vàng. Sự kết hợp xa xỉ giữa Đông Trùng Hạ Thảo và các vị thuốc bổ như Kỷ Tử, Táo Đỏ. Trà giúp tăng cường hệ miễn dịch, bồi bổ phổi, thận và phục hồi sức khỏe nhanh chóng cho người mới ốm dậy. Món quà sức khỏe đẳng cấp để biếu tặng ông bà, cha mẹ.', 'Bồi bổ toàn diện, tăng cường miễn dịch, bổ phổi thận.', 350000.00, 300000.00, 'TRA015', 20, 1, 'assets/images/tra_dong_tu_vi_1.png', 0, 'active', 'Đông Trùng Hạ Thảo sấy thăng hoa, Kỷ tử đỏ, Táo đỏ Tân Cương, Long nhãn Hưng Yên.', 'Cho một gói trà vào ly, rót 300ml nước sôi 90 độ. Đậy nắp kín 10 phút. Sau khi uống hết nước, có thể ăn luôn cả cái (xác trà) để hấp thu trọn vẹn dinh dưỡng.', '2026-01-28 09:45:07'),
(18, 'Trà Đường Nâu Nguyên Chất', 'tra-duong-nau-nguyen-chat', 'Viên trà đường nâu cô đặc - giải pháp tiện lợi cho cuộc sống bận rộn. Mỗi viên đường là sự kết hợp của đường mía thô nguyên chất nấu cùng gừng già, táo đỏ, long nhãn... Chỉ cần thả vào nước nóng là tan ngay, tạo thành ly trà thơm lừng, ngọt ấm. Cực tốt cho chị em phụ nữ vào \"ngày đèn đỏ\" giúp giảm đau bụng và làm ấm cơ thể.', 'Giảm đau bụng kinh, làm ấm cơ thể, tiện lợi dễ dùng.', 140000.00, 0.00, 'NL003', 60, 2, 'assets/images/tra_duong_nau_nguyen_chat_1.png', 0, 'active', 'Đường mía thô, Gừng sẻ, Táo đỏ, Kỷ tử, Hoa hồng (tùy vị).', 'Lấy 1 viên đường nâu cho vào cốc. Rót 200ml nước sôi 100 độ C. Khuấy nhẹ cho đường tan hết và thưởng thức khi còn nóng.', '2026-01-28 09:45:07'),
(19, 'Trà Dưỡng Nhan 7 Vị', 'tra-duong-nhan', 'Bí quyết \"trẻ mãi không già\" của các cung tần mỹ nữ xưa. Set trà gồm 7 vị thảo mộc quý (Thất vị) giúp bổ sung Collagen thực vật, làm đẹp da, mờ nám sạm và thanh nhiệt cơ thể. Nước trà nấu lên có độ sánh nhẹ của tuyết yến và nhựa đào, vị ngọt thanh của đường phèn, ăn giòn sần sật rất vui miệng.', 'Bổ sung Collagen, đẹp da, mờ nám, thanh nhiệt.', 160000.00, 140000.00, 'TRA016', 80, 1, 'assets/images/tra_duong_nhan_1.png', 1, 'active', 'Tuyết yến, Nhựa đào, Bồ mễ (Hạt sen tuyết), Kỷ tử, Táo đỏ, Long nhãn, Hạt chia, Đường phèn.', 'Ngâm Tuyết yến, Nhựa đào, Bồ mễ qua đêm cho nở mềm. Rửa sạch tạp chất. Đun sôi nước với đường phèn và táo đỏ, long nhãn. Cuối cùng cho các nguyên liệu đã ngâm vào đun sôi lại 5-10 phút. Để nguội ăn như chè.', '2026-01-28 09:45:07'),
(20, 'Trà Hoa Đu Đủ Đực', 'tra-du-du-duc', 'Hoa đu đủ đực từ lâu đã là bài thuốc dân gian quý hiếm, đặc biệt trong việc hỗ trợ điều trị ho, viêm họng và các bệnh về đường hô hấp. Ngoài ra, nhiều nghiên cứu còn chỉ ra công dụng hỗ trợ ngăn ngừa khối u và cải thiện hệ tiêu hóa. Hoa được thu hái thủ công, phơi trong bóng râm để giữ nguyên dược tính.', 'Trị ho, bổ phổi, hỗ trợ ngăn ngừa khối u.', 210000.00, 0.00, 'TRA017', 25, 1, 'assets/images/tra_du_du_duc_1.png', 0, 'active', '100% Hoa đu đủ đực phơi khô tự nhiên.', 'Cách 1: Hãm trà uống hàng ngày (vị hơi đắng).\nCách 2: Hấp cách thủy với mật ong hoặc đường phèn để trị ho (ngọt dễ uống hơn).\nCách 3: Ngâm với mật ong trong bình thủy tinh 1 tháng rồi dùng dần.', '2026-01-28 09:45:07'),
(21, 'Trà Fitne Herbal Thái Lan', 'tra-fitne-herbal', 'Sản phẩm trà thảo mộc \"quốc dân\" của Thái Lan, nổi tiếng khắp Đông Nam Á. Trà Fitne Herbal tận dụng sức mạnh nhuận tràng tự nhiên của lá sen và vỏ đại để hỗ trợ đào thải độc tố đường ruột, giảm táo bón và ngăn ngừa tích tụ mỡ thừa. Hương vị thơm nhẹ, dễ uống, là người bạn đồng hành không thể thiếu cho những ai muốn duy trì vóc dáng thon gọn mà không cần ăn kiêng quá khắt khe.', 'Trà giảm cân, thải độc ruột nổi tiếng Thái Lan.', 130000.00, 0.00, 'TRA018', 50, 1, 'assets/images/tra_fitne_herbal_1.png', 1, 'active', 'Lá sen (Senna leaves), Vỏ đại (Senna pods), Hương liệu thảo mộc tự nhiên.', 'Ngâm 1 túi trà vào cốc nước nóng (150ml) trong khoảng 10-20 phút. Nên uống vào buổi tối trước khi đi ngủ. Tác dụng đào thải thường xuất hiện sau 8-10 tiếng.', '2026-01-28 09:45:40'),
(22, 'Trà Gạo Lứt Huyết Rồng', 'tra-gao-luc', 'Thức uống dân dã nhưng mang lại giá trị sức khỏe phi thường. Những hạt gạo lứt huyết rồng đỏ au được tuyển chọn, rang tay thủ công trên lửa củi sao cho hạt gạo bung nở vừa tới, dậy mùi thơm nồng nàn như mùi cốm mới. Nước trà đỏ thẫm, vị ngọt thanh, uống vào mát gan, thanh nhiệt, giúp da dẻ hồng hào và hỗ trợ xương khớp cực tốt.', 'Gạo lứt rang tay thủ công, thơm nồng, mát gan, đẹp da.', 60000.00, 0.00, 'TRA019', 150, 1, 'assets/images/tra_gao_luc_1.png', 0, 'active', '100% Gạo lứt huyết rồng rang mộc, có thể mix thêm đậu đen xanh lòng (tùy mẻ).', 'Cho 2-3 muỗng gạo lứt vào bình giữ nhiệt hoặc ấm trà. Chế 500ml nước sôi, ủ kín trong 15-20 phút cho gạo nở bung. Chắt lấy nước uống cả ngày. Xác gạo có thể ăn được, rất bùi và ngon.', '2026-01-28 09:45:40'),
(23, 'Trà Genpi Orihiro Nhật Bản', 'tra-genpi-orihiro', 'Bí quyết tiêu mỡ bụng của người Nhật. Genpi Tea là sự phối trộn tinh tế của các loại thảo mộc phương Đông, tập trung vào khả năng đốt cháy mỡ thừa vùng bụng và bắp tay. Không gây mệt mỏi, không gây mất nước, Genpi giúp cơ thể nhẹ nhàng, thanh thoát hơn mỗi ngày. Sản phẩm đặc biệt phù hợp cho dân văn phòng ngồi nhiều, ít vận động.', 'Hỗ trợ giảm mỡ bụng, nhập khẩu Nhật Bản.', 195000.00, 0.00, 'TRA020', 40, 1, 'assets/images/tra_genpi_orihiro_1.png', 1, 'active', 'Trà Pu’er (Phổ Nhĩ), Trà Ô Long, Hồng trà Nam Phi (Rooibos), Hạt ý dĩ, Lá dây thìa canh.', 'Pha 1 gói trà với 500ml nước sôi. Để trà ngấm trong 3-5 phút. Có thể uống nóng hoặc để nguội uống lạnh thay nước lọc. Một gói có thể pha được 2-3 lần nước.', '2026-01-28 09:45:40'),
(24, 'Trà Giảo Cổ Lam 7 Lá', 'tra-giao-co-lam', 'Được mệnh danh là \"Cỏ Trường Thọ\", Giảo Cổ Lam là thảo dược quý giúp ổn định huyết áp, hạ mỡ máu và ngăn ngừa các biến chứng tim mạch. Sản phẩm sử dụng loại Giảo Cổ Lam 7 lá (loại có dược tính cao nhất), thu hái từ vùng núi đá vôi Hòa Bình. Vị trà đắng trước ngọt sau, uống quen sẽ thấy rất nghiền, người nhẹ nhõm, ăn ngủ tốt.', 'Hạ mỡ máu, ổn định huyết áp, tốt cho tim mạch.', 105000.00, 95000.00, 'TRA021', 70, 1, 'assets/images/tra_giao_co_lam_1.png', 0, 'active', '100% thân và lá Giảo Cổ Lam 7 lá sấy khô.', 'Lấy 10-15g trà hãm với nước sôi như pha trà mạn. Uống vào buổi sáng hoặc đầu giờ chiều giúp tỉnh táo. Lưu ý: Người huyết áp thấp nên uống lúc no và thêm vài lát gừng.', '2026-01-28 09:45:40'),
(25, 'Trà Gừng Mật Ong Hòa Tan', 'tra-gung', 'Vị cứu tinh cho những ngày gió lạnh hoặc khi bị cảm lạnh, đau bụng. Bột trà gừng được làm từ gừng sẻ già cay nồng, kết hợp với mật ong hoa nhãn ngọt ngào. Chỉ cần 1 phút pha chế là bạn đã có ngay ly trà nóng hổi, làm ấm cơ thể từ bên trong, giúp lưu thông khí huyết và giảm cảm giác buồn nôn, khó chịu.', 'Làm ấm cơ thể, giải cảm, giảm đau bụng, tiện lợi.', 55000.00, 0.00, 'TRA022', 100, 1, 'assets/images/tra_gung_1.png', 0, 'active', 'Tinh chất gừng già, Bột mật ong, Đường phèn.', 'Hòa tan 1 gói trà vào 150ml nước nóng (80-90 độ C). Khuấy đều và thưởng thức. Có thể vắt thêm chanh để tăng đề kháng.', '2026-01-28 09:45:40'),
(26, 'Trà Hà Thủ Ô Túi Lọc', 'tra-ha-thu-o-tui-loc', '\"Muốn cho xanh tóc đỏ da, rủ nhau lên núi tìm Hà Thủ Ô\". Nay không cần lên núi, bạn vẫn có thể tận hưởng công dụng tuyệt vời này với Trà Hà Thủ Ô túi lọc tiện lợi. Sản phẩm được chế biến kỹ (cửu chưng cửu sái) để loại bỏ độc tính, giữ lại tinh chất giúp bồi bổ khí huyết, làm đen tóc và ngăn ngừa lão hóa sớm.', 'Xanh tóc, đỏ da, bồi bổ khí huyết.', 85000.00, 0.00, 'TRA023', 60, 1, 'assets/images/tra_ha_thu_o_tui_loc_1.png', 0, 'active', 'Hà thủ ô đỏ chế đậu đen, Đương quy, Kỷ tử, Cỏ ngọt.', 'Nhúng túi trà vào 200ml nước sôi. Chờ 5 phút. Nên uống liên tục trong 2-3 tháng để thấy hiệu quả rõ rệt lên mái tóc và làn da.', '2026-01-28 09:45:40'),
(27, 'Trà Hoàng Thảo Mộc Cung Đình', 'tra-hoang-thao-moc', 'Dòng trà Signature (Thượng hạng) của Mộc Trà. Đây là sự kết hợp công phu của 12 loại thảo mộc quý hiếm nhất, tạo nên hương vị \"Vương Giả\" không nơi nào có được. Trà có vị ngọt thanh tao của táo đỏ, hương thơm nồng nàn của quế và hoa hồi, hậu vị sâu lắng của sâm. Một set trà không chỉ là thức uống mà còn là một tác phẩm nghệ thuật để biếu tặng.', 'Thượng hạng 12 vị, quà biếu sang trọng, bồi bổ toàn diện.', 280000.00, 250000.00, 'TRA024', 30, 1, 'assets/images/tra_hoang_thao_moc_1.png', 1, 'active', 'Nhân sâm, Linh chi, Đông trùng hạ thảo, Kỷ tử, Táo đỏ, Long nhãn, Hoa cúc, Nụ hồng, Cỏ ngọt...', 'Dùng bộ ấm trà thủy tinh. Cho gói trà vào, tráng qua nước nóng. Hãm với 500ml nước sôi trong 10-15 phút. Vừa thưởng trà, vừa ngắm hoa nở trong ấm.', '2026-01-28 09:45:40'),
(28, 'Trà Hoa Cúc Quế Hoa Kỳ Tử', 'tra-hoa-cuc-que-hoa-ky-tu', 'Bộ ba \"Dưỡng Nhan - Sáng Mắt - An Thần\". Bạch cúc giúp thanh nhiệt, sáng mắt; Quế hoa (Hoa mộc) mang hương thơm ngọt ngào quyến rũ; Kỷ tử bồi bổ gan thận. Sự kết hợp này tạo nên một ly trà vàng óng đẹp mắt, hương thơm vương vấn mãi không tan, giúp xua tan mệt mỏi sau những giờ làm việc căng thẳng bên máy tính.', 'Sáng mắt, đẹp da, hương thơm quyến rũ.', 110000.00, 0.00, 'TRA025', 50, 1, 'assets/images/tra_hoa_cuc_que_hoa_ky_tu_1.png', 0, 'active', 'Bạch cúc (Cúc trắng), Quế hoa (Hoa mộc), Kỷ tử đỏ.', 'Cho các nguyên liệu vào ly. Rót nước sôi, đậy nắp hãm 5 phút. Mở nắp ra là hương thơm tỏa khắp phòng. Uống nóng hoặc thêm đá đều ngon.', '2026-01-28 09:45:40'),
(29, 'Trà Hồng Sâm Nguyên Lát', 'tra-hong-sam', 'Sức mạnh từ củ sâm ngàn năm. Những củ sâm tươi 6 năm tuổi được hấp sấy thành Hồng Sâm, sau đó thái lát mỏng và tẩm mật ong. Khi hãm trà, lát sâm nở ra, tiết ra dưỡng chất saponin quý giá giúp phục hồi sinh lực, tăng cường trí nhớ và hệ miễn dịch. Thức uống vàng cho người cao tuổi và người làm việc trí óc cường độ cao.', 'Phục hồi sinh lực, tăng trí nhớ, tốt cho người già.', 320000.00, 0.00, 'TRA026', 20, 1, 'assets/images/tra_hong_sam_1.png', 0, 'active', '100% Hồng sâm 6 năm tuổi thái lát, tẩm mật ong rừng.', 'Lấy 2-3 lát sâm cho vào cốc, đổ nước sôi hãm 10 phút. Uống hết nước có thể ăn luôn lát sâm (dẻo, ngọt, hơi đắng nhẹ). Dùng vào buổi sáng để nạp năng lượng.', '2026-01-28 09:45:40'),
(30, 'Trà Hồng Sâm Hàn Quốc (Hộp Gỗ)', 'tra-hong-sam-han-quoc', 'Sản phẩm nhập khẩu nguyên hộp từ Hàn Quốc - Xứ sở Nhân Sâm. Được đóng gói trong hộp gỗ sang trọng, đây là món quà sức khỏe đẳng cấp để biếu sếp, đối tác hoặc người thân. Trà dạng hòa tan tiện lợi, giữ nguyên hương vị đặc trưng của sâm Hàn Quốc, giúp bồi bổ cơ thể toàn diện.', 'Nhập khẩu Hàn Quốc, hộp gỗ sang trọng, quà biếu đẳng cấp.', 450000.00, 0.00, 'TRA027', 15, 1, 'assets/images/tra_hong_sam_han_quoc_1.png', 1, 'active', 'Tinh chất hồng sâm cô đặc, đường glucose, lactose.', 'Hòa tan 1 gói trà với nước ấm hoặc nước lạnh. Khuấy đều và thưởng thức. Ngày dùng 1-2 gói.', '2026-01-28 09:45:40'),
(31, 'Túi Trà Khô Khử Mùi (Hút Ẩm)', 'tra-hut-am', 'Tận dụng hương thơm tự nhiên của các loại trà mộc (Trà lài, Trà sen, Quế), túi trà khô là giải pháp khử mùi hoàn hảo cho ô tô, tủ quần áo, tủ giày hay phòng ngủ. Không hóa chất độc hại, túi trà tỏa hương thơm dịu nhẹ, hút ẩm mốc và mang lại cảm giác thư thái cho không gian sống của bạn.', 'Khử mùi ô tô, tủ quần áo, hút ẩm tự nhiên.', 40000.00, 0.00, 'PK001', 100, 1, 'assets/images/tra_hut_am_1.png', 0, 'active', 'Bã trà khô sấy kỹ, Hoa hồi, Quế thanh, Nụ hoa lài.', 'Treo túi trà ở nơi cần khử mùi. Sau 1-2 tháng khi mùi hương giảm, có thể thay túi mới hoặc nhỏ thêm tinh dầu vào túi trà để tiếp tục sử dụng.', '2026-01-28 09:45:40'),
(32, 'Trà Khổ Qua Rừng (Mướp Đắng)', 'tra-kho-qua', '\"Thuốc đắng dã tật\". Khổ qua rừng có vị đắng đậm hơn khổ qua thường nhưng dược tính cao gấp nhiều lần. Đây là \"khắc tinh\" của bệnh tiểu đường và mỡ máu cao. Uống trà khổ qua hàng ngày giúp ổn định đường huyết, thanh nhiệt, giải độc cơ thể và ngăn ngừa mụn nhọt do nóng trong.', 'Hạ đường huyết, tốt cho người tiểu đường, thanh nhiệt.', 95000.00, 0.00, 'TRA028', 70, 1, 'assets/images/tra_kho_qua_1.png', 0, 'active', '100% trái và dây khổ qua rừng thái lát sấy khô.', 'Cho 5-7 lát khổ qua vào ly, hãm với nước sôi. Nước đầu có thể hơi đắng, từ nước thứ 2 vị sẽ ngọt hậu dễ uống hơn. Có thể kết hợp với cỏ ngọt để giảm vị đắng.', '2026-01-28 09:45:40'),
(33, 'Trà Lài Tân Cương Thượng Hạng', 'tra-lai-tan-cuong', 'Sự kết hợp đỉnh cao giữa \"Đệ nhất danh trà\" Tân Cương Thái Nguyên và hoa lài Quế thơm ngát. Không dùng hương liệu, trà được ướp bằng hoa lài tươi 100% qua 4-5 lần ướp (dệt hương). Cánh trà xoăn chặt, nước xanh vàng óng, hương thơm hoa lài quyện chặt vào vị chát dịu của trà, tạo nên dư vị khó quên.', 'Trà Tân Cương ướp hoa lài tươi, hương thơm tinh tế.', 180000.00, 0.00, 'TRA029', 40, 1, 'assets/images/tra_lai_tan_cuong_1.png', 1, 'active', 'Búp chè Tân Cương 1 tôm 2 lá, Hoa lài (hoa nhài) tươi.', 'Pha với nước sôi 85-90 độ C. Thời gian hãm trà ngắn (khoảng 30-45 giây) để giữ được hương hoa tươi mới và vị trà không bị chát gắt.', '2026-01-28 09:45:40'),
(34, 'Trà Lá Nam Giảm Cân Cổ Truyền', 'tra-la-nam', 'Công thức giảm cân an toàn từ thảo dược nước Nam. Không gây mệt mỏi, không tác dụng phụ. Trà Lá Nam tập trung vào việc thanh lọc gan thận, đào thải mỡ thừa qua đường bài tiết và tiêu hóa. Kiên trì sử dụng kết hợp ăn uống điều độ, bạn sẽ sớm lấy lại vóc dáng thon gọn và làn da sáng mịn.', 'Giảm cân an toàn, thanh lọc cơ thể, tiêu mỡ.', 80000.00, 0.00, 'TRA030', 90, 1, 'assets/images/tra_la_nam_1.png', 0, 'active', 'Lá sen, Chè vằng, Phan tả diệp, Vỏ bưởi, Sơn tra, Hoa nhài.', 'Rửa sạch 1 gói trà, đun sôi với 1.5 - 2 lít nước trong 15 phút. Để nguội uống thay nước lọc cả ngày. Ngon hơn khi uống lạnh.', '2026-01-28 09:45:40'),
(35, 'Trà Lá Ổi Hỗ Trợ Giảm Cân', 'tra-la-oi', 'Xu hướng giảm cân lành mạnh từ thiên nhiên. Lá ổi chứa nhiều Polyphenol, Carotenoid, Flavonoid giúp ngăn chặn sự chuyển hóa tinh bột thành đường, từ đó hỗ trợ giảm cân và kiểm soát đường huyết hiệu quả. Trà lá ổi có vị chát nhẹ, hương thơm dịu, rất dễ uống và tốt cho hệ tiêu hóa.', 'Ngăn hấp thụ tinh bột, giảm cân, tốt cho người tiểu đường.', 50000.00, 0.00, 'TRA031', 100, 1, 'assets/images/tra_la_oi_1.png', 0, 'active', '100% búp non và lá ổi sẻ sấy khô.', 'Lấy một nhúm lá ổi (khoảng 5-7g) hãm với nước sôi 10 phút. Uống sau bữa ăn 30 phút để hạn chế hấp thụ chất béo và tinh bột từ thức ăn.', '2026-01-28 09:45:40'),
(36, 'Set Trà Lipton Xí Muội Giải Nhiệt', 'tra-lipton-xi-muoi', 'Thức uống \"tuổi thơ\" nay đã được nâng cấp với phiên bản tiện lợi. Vị chua chua mặn mặn của xí muội, ngọt thanh của cam thảo kết hợp với vị chát nhẹ của trà Lipton tạo nên ly nước giải khát \"thần thánh\" đánh bay cơn khát mùa hè. Cung cấp Vitamin C giúp tăng đề kháng.', 'Giải khát mùa hè, chua ngọt mặn mà, ngon khó cưỡng.', 45000.00, 0.00, 'NL004', 150, 2, 'assets/images/tra_lipton_xi_muoi_1.png', 1, 'active', 'Túi trà Lipton nhãn vàng, Xí muội mặn, Xí muội ngọt, Táo đỏ, Cam thảo, Đường phèn.', 'Ngâm túi trà và các nguyên liệu với 200ml nước sôi. Dầm nát xí muội để ra vị chua mặn. Thêm đường phèn khuấy tan. Thêm đá thật nhiều và thưởng thức.', '2026-01-28 09:45:40'),
(37, 'Trà Mâm Xôi (Raspberry Tea)', 'tra-mam-xoi', 'Hương vị chua ngọt quyến rũ từ những quả mâm xôi đỏ mọng. Trà Mâm Xôi chứa hàm lượng Vitamin C và chất chống oxy hóa cực cao, giúp trẻ hóa làn da và tăng cường sức đề kháng. Màu trà đỏ hồng tự nhiên rất đẹp mắt, thích hợp để pha chế các loại trà trái cây nhiệt đới (Fruit Tea) sang chảnh.', 'Vị chua ngọt tự nhiên, giàu Vitamin C, pha trà trái cây.', 125000.00, 0.00, 'TRA032', 40, 1, 'assets/images/tra_mam_xoi_1.png', 0, 'active', 'Quả mâm xôi sấy lạnh nguyên trái, Hibiscus (Atiso đỏ), Táo sấy.', 'Hãm trà với nước sôi 5 phút. Khi uống có thể dầm nát quả mâm xôi để cảm nhận vị chua thanh. Ngon tuyệt khi pha cùng trà nhài và đá lạnh.', '2026-01-28 09:45:40'),
(38, 'Trà Mãng Cầu Xiêm (Soursop Tea)', 'tra-mang-cau-slim', 'Đặc sản miền Tây sông nước. Trà được làm từ thịt quả mãng cầu xiêm già, thái sợi và sao khô. Trà có hương thơm nồng nàn đặc trưng của mãng cầu, vị ngọt dịu và hơi chát nhẹ. Công dụng tuyệt vời trong việc an thần, giúp ngủ ngon, hạ huyết áp và hỗ trợ giảm cân nhờ cơ chế đốt cháy chất béo.', 'Hương thơm nồng nàn, hỗ trợ ngủ ngon, hạ huyết áp.', 110000.00, 0.00, 'TRA033', 60, 1, 'assets/images/tra_mang_cau_slim_1.png', 0, 'active', '100% thịt trái mãng cầu xiêm gọt vỏ, bỏ hạt, thái sợi sấy khô.', 'Lấy 5-7g trà hãm với nước sôi. Màu trà vàng nhạt, rất thơm. Có thể uống nóng hoặc lạnh. Bã trà sau khi hãm có thể ăn được, dẻo dẻo bùi bùi.', '2026-01-28 09:45:40'),
(39, 'Trà Detox Cam Quế Mật Ong', 'tra-mix-vi-cam-que', 'Set trà \"Chill\" cho những ngày mưa hoặc Giáng sinh. Sự kết hợp ấm áp giữa cam vàng sấy lạnh, quế thanh cay nồng và hoa hồi thơm phức. Trà giúp làm ấm cơ thể, giảm ho, thư giãn tinh thần và detox thanh lọc độc tố. Một ly trà cam quế ấm nóng trên tay là liệu pháp xả stress tuyệt vời.', 'Detox cơ thể, thư giãn tinh thần, hương vị Giáng sinh.', 15000.00, 0.00, 'TRA034', 200, 1, 'assets/images/tra_mix_vi_cam_que_1.png', 1, 'active', 'Cam vàng sấy lát, Quế thanh, Hoa hồi, Đường phèn nâu.', 'Cho 1 set trà vào cốc. Rót 250ml nước sôi. Đậy nắp ủ 10 phút cho tinh dầu quế và cam tiết ra. Thêm mật ong nếu thích ngọt hơn. Uống khi còn ấm.', '2026-01-28 09:45:40'),
(40, 'Trà Móc Câu Tân Cương Đặc Biệt', 'tra-moc-cau', 'Đỉnh cao của trà xanh Việt Nam. Những búp chè non nhất được sao suốt bởi đôi bàn tay nghệ nhân, cánh trà săn lại, cong cong như lưỡi câu. Khi pha, nước xanh sánh như mật ong, hương cốm non ngào ngạt lan tỏa. Vị chát đậm đà kích thích vị giác, sau đó là vị ngọt hậu sâu lắng, đọng lại rất lâu trong cổ họng.', 'Cánh trà cong như móc câu, vị đậm đà, hương cốm.', 220000.00, 0.00, 'TRA035', 30, 1, 'assets/images/tra_moc_cau_1.png', 0, 'active', 'Búp chè tươi vùng Tân Cương - Thái Nguyên (1 tôm 1 lá).', 'Yêu cầu nước pha trà chuẩn 85-90 độ C. Tráng ấm, tráng trà nhanh. Hãm trà 30-60 giây. Rót hết ra tống và thưởng thức từng ngụm nhỏ để cảm nhận hết tinh túy.', '2026-01-28 09:45:40'),
(41, 'Trà Mộc Hoa Tây Bắc', 'tra-moc-hoa-tay-bac', 'Gói trọn hương sắc của núi rừng Tây Bắc vào trong một tách trà. Sản phẩm là sự kết hợp của các loại hoa rừng tự nhiên và thảo mộc vùng cao, mang lại hương vị hoang dã, phóng khoáng nhưng cũng đầy tinh tế. Trà giúp thư giãn thần kinh, giảm stress và mang lại cảm giác bình yên như đang đứng giữa đại ngàn.', 'Hương vị núi rừng, thư giãn, giảm stress.', 130000.00, 0.00, 'TRA036', 44, 1, 'assets/images/tra_moc_hoa_tay_bac_1.png', 0, 'active', 'Hoa cúc rừng, Nụ vối, Cỏ ngọt, Hoa nhài, Táo mèo thái lát.', 'Tráng ấm bằng nước sôi. Cho 10g trà vào ấm, hãm với nước sôi 90 độ trong 5-7 phút. Thưởng thức khi còn nóng để cảm nhận hương thơm hoa cỏ.', '2026-01-28 09:46:07'),
(42, 'Lục Trà Nhài DalatFarm (Pha Chế)', 'tra-nhai-dalatfarm', 'Dòng trà chuyên dụng cho các quán trà sữa và cà phê. Lục trà (trà xanh) được trồng tại nông trại Đà Lạt, ướp hương hoa nhài theo công nghệ mới giúp lưu hương lâu, vị chát đậm đà, không bị mất mùi khi lắc với đá hoặc pha chung với syrup trái cây. Giải pháp tối ưu chi phí cho chủ quán.', 'Nguyên liệu pha chế, hương nhài đậm, giá tốt.', 105000.00, 0.00, 'NL005', 179, 2, 'assets/images/tra_nhai_dalatfarm_1.png', 1, 'active', '• Thành phần: trà xanh chất lượng (89,5%), hoa lài (10%), hương lài tổng hợp.\r\n\r\n• Hướng dẫn sử dụng: cho trà vào ấm, dùng nước sôi tráng ấm và trà, sau đó đổ bỏ nước tráng, thêm nước sôi vào để pha trà, chờ 3 - 5 phút để có hương vị đậm đà.\r\n\r\n• Hướng dẫn bảo quản: bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp mặt trời. Luôn đóng kín bao trà sau khi sử dụng.\r\n\r\n• Thông tin cảnh báo an toàn, vệ sinh: không sử dụng khi sản phẩm có hiện tượng nấm mốc, mùi lạ.\r\n\r\n• Quy cách đóng gói: trà đựng trong túi thiếc chuyên dụng bảo quản thực phẩm, thêm hộp thiếc bên ngoài giúp bảo quản trà cách tốt hơn, hiện đại, sang trọng, món quà sức khoẻ cho người thân.', 'Ủ 30g trà với 1 lít nước 85 độ C trong 7 phút. Lọc lấy cốt trà. Pha với đường, chanh hoặc syrup trái cây để làm các món trà trái cây giải nhiệt.', '2026-01-28 09:46:07'),
(43, 'Trà Nhài Hương (Trà Đá)', 'tra-nhai-huong', '💥 TRÀ NHÀI MAXKO – HƯƠNG NHÀI NGÁT THƠM, TRÀ XANH HẬU NGỌT 💥\r\n\r\n\r\n\r\n🌼 Trà Nhài Maxko là sự kết hợp hài hòa giữa búp trà xanh non tuyển chọn và hoa nhài trắng nguyên chất, mang đến mùi hương dịu dàng, vị trà thanh khiết, rất phù hợp để pha trà chanh, trà hoa quả, trà nhài nguyên chất.\r\n\r\n\r\n\r\n✨ ĐẶC ĐIỂM NỔI BẬT:\r\n\r\n\r\n\r\n✅ Hương hoa nhài nhẹ nhàng, thanh mát, lưu hương dài sau khi uống\r\n\r\n\r\n\r\n✅ Vị trà xanh nhẹ chát, hậu ngọt sâu lắng\r\n\r\n\r\n\r\n✅ Giúp đồ uống trở nên tinh tế, dễ chịu và dễ gây nghiện\r\n\r\n\r\n\r\n🍹 PHÙ HỢP CHO:\r\n\r\n\r\n\r\nTrà chanh, trà nhài lạnh, trà trái cây, trà mix siro/trái cây\r\n\r\n\r\n\r\nCác quán trà chanh, tiệm nước, cà phê hoặc sử dụng tại nhà\r\n\r\n\r\n\r\nGiá thành hợp lý, chất lượng ổn định qua từng lần pha chế', 'Chuyên pha trà đá, trà chanh, giá rẻ.', 70000.00, 0.00, 'NL006', 100, 2, 'assets/images/tra_nhai_huong_1.png', 0, 'active', 'Trà xanh, hương liệu hoa lài.', 'Hãm trà với nước sôi già (100 độ). Ủ 10-15 phút để trà ra hết chất chát. Pha loãng với nước lọc và thêm đá.', '2026-01-28 09:46:07'),
(44, 'Lục Trà Nhài Layla Cao Cấp', 'tra-nhai-layla', 'Trà Nhài Layla - Trà Xanh Nhài 95g\r\n\r\nTrà có nguồn gốc xuất xứ từ khu vực Châu Á, chủ yếu là ở Tây Nam Trung Quốc. Sau đó nhà sư thuộc Thiền tông Nhật Bản sang Trung Quốc tu đạo đã mang trà về và phất triển thành nghệ thuật trà đạo vang danh cả thế giới.\r\n\r\nTrà có nhiều tác dụng tốt cho sức khỏe. Trà chứa một số lượng lớn các hóa chất sinh học như flavonoid, acid amin, vitamin,…có tác dụng chống ung thư. Đặc biệt caffeine trong trà sẽ giúp con người tỉnh táo nếu uống vào buổi sớm. Trà thúc đẩy quá trình trao đổi chất và được đưa vào thực đơn ăn kiêng vì catechin trong trà ngăn ngừa béo phì, ung thư gan hay đại tràng.\r\n\r\nThông tin sản phẩm:\r\n\r\n- Tên sản phẩm: Trà nhài Layla\r\n\r\n- Khối lượng: 95g\r\n\r\n- Xuất xứ: Việt Nam\r\n\r\n- Hạn sử dụng: 12 tháng \r\n\r\n- Hương vị: Trà hoa nhài\r\n\r\nTrà xanh được ướp thêm hương hoa nhài gọi là Lục trà nhài, vị chát nhẹ cùng hương nhài thơm ngát làm cho thức uống trà sữa nhài nghe có vẻ khá đơn giản nhưng lại là 1 trong những cái tên được khách hàng gọi lên nhiều nhất tại các quán trà sữa.', 'Cao cấp cho quán trà sữa, hương thanh thoát, nước trong.', 140000.00, 0.00, 'NL007', 80, 2, 'assets/images/tra_nhai_layla_1.png', 0, 'active', 'Trà xanh cao cấp, Hoa nhài sấy khô, Hương liệu tự nhiên.', 'Tỷ lệ 1:30 (1g trà : 30ml nước). Nhiệt độ 80-85 độ C. Thời gian ủ 7-9 phút. Mở nắp khi ủ để nước trà không bị đỏ.', '2026-01-28 09:46:07'),
(45, 'Trà Nhân Trần Cam Thảo', 'tra-nhan-tran-cam-thao', 'TRÀ NHÂN TRẦN CAM THẢO\r\n\r\nKết hợp giữa các loại thảo dược của nước ta và công nghệ hiện đại mang đến giải pháp chăm sóc sức khỏe an toàn từ thiên nhiên.\r\n\r\nCác bài thuốc dân gian đã được Trà Thảo Mộc Hòa Bình nghiên cứu và sản xuất cho ra các sản phẩm trà túi lọc rất hiệu quả trong chăm sóc sức khỏe, tiện lợi cho người sử dụng.\r\n\r\n\r\n\r\n🌿THÔNG TIN SẢN PHẨM\r\n\r\n - Thương hiệu: Trà Thảo Dược Hòa Bình\r\n\r\n - Xuất xứ: Việt Nam\r\n\r\n - Số lượng: 50 Túi Lọc ,3Gam\r\n\r\n - Khối Lượng 1 Hộp: 150Gam \r\n\r\n - Mùi ,Vị: Thơm ngon dễ uống\r\n\r\n - Liều lượng: Dùng thay nước hằng ngày\r\n\r\n - Hạn sử dụng: 1 Năm kể từ ngày sản xuất ( xem trên bao bì )\r\n\r\n\r\n\r\n🌿6 THÀNH PHẦN:\r\n\r\n- Nấm lim xanh, dây thìa canh, lá sen, thảo quyết minh, giảo cổ lam, khổ qua...\r\n\r\n\r\n\r\n🌿 LỢI ÍCH\r\n\r\n- Thanh nhiệt, thanh lọc cơ thể.\r\n\r\n- Hết nóng trong, đẹp da.\r\n\r\n- Hỗ trợ tiêu hóa.\r\n\r\n- Giảm căng thẳng mệt mỏi.\r\n\r\n- Thải độc thanh lọc cơ thể.', 'Giải nhiệt mùa hè, mát gan, vị ngọt tự nhiên.', 40000.00, 0.00, 'TRA037', 150, 1, 'assets/images/tra_nhan_tran_cam_thao_1.png', 1, 'active', 'Cây nhân trần phơi khô, Cam thảo bắc thái lát.', 'Rửa sạch nguyên liệu. Đun sôi với nước trong 10-15 phút. Để nguội hoặc thêm đá uống thay nước lọc. Phụ nữ mang thai nên hạn chế sử dụng.', '2026-01-28 09:46:07'),
(46, 'Trà Nõn Tôm Tân Cương (Thượng Hạng)', 'tra-non-tom', '1. THÔNG TIN CHI TIẾT SẢN PHẨM:\r\n\r\n\r\n\r\nTrà Nõn Tôm Thượng Hạng – Đặc sản Trà Tân Cương Thái Nguyên Chính Hiệu \r\n\r\nQuy cách : 100g/200g\r\n\r\nThương hiệu : LƯƠNG TRÀ\r\n\r\nLà dòng Trà chất lượng cao cấp, xứng đáng để những người Yêu Trà, Sành Trà thưởng thức\r\n\r\n\r\n\r\nNước trà: Nước trà sánh có màu vàng sáng. Hương thơm mùi cốm nếp mới, hương thơm của tự nhiên.\r\n\r\nVị trà: Vị chát dịu, hậu ngọt sâu, bùi vị trà.\r\n\r\n\r\n\r\nTrà được thu hái tỉ mỉ tại những vườn chè truyền thống lâu năm đạt tiêu chuẩn VietGap bằng phương pháp thủ công, thu hoạch những búp trà non hái đúng quy chuẩn “1 búp 1 lá non”.\r\n\r\n\r\n\r\nTrà được sao, sấy chế biến lên hương hoàn toàn theo cách thủ công truyền thống do chính đôi bàn tay và bí kíp của Nghệ Nhân Trà hơn 50 năm kinh nghiệm. ', '1 tôm 1 lá, nước xanh cốm, vị ngọt hậu sâu sắc.', 450000.00, 420000.00, 'TRA038', 20, 1, 'assets/images/tra_non_tom_1.png', 1, 'active', '100% Nõn trà Tân Cương Thái Nguyên tuyển chọn.', 'Dùng nước 80-85 độ C. Tráng ấm chén kỹ. Đánh thức trà nhanh. Hãm trà khoảng 20-30 giây là rót ra ngay. Có thể pha được 4-5 nước vẫn ngọt.', '2026-01-28 09:46:07'),
(47, 'Trà Oolong Lai Châu', 'tra-o-long-lai-chau', 'Được trồng trên độ cao 1200m tại Tam Đường, Lai Châu, nơi có khí hậu mát mẻ quanh năm tương tự Đài Loan. Trà Oolong tại đây có viên tròn đều, màu xanh đen bóng. Vị trà mềm mại, ít chát, hương thơm hoa cỏ tự nhiên rất dễ chịu. Đây là niềm tự hào mới của ngành chè Việt Nam.', 'Oolong Việt Nam chất lượng cao, vị mềm mại.', 180000.00, 0.00, 'TRA039', 50, 1, 'assets/images/tra_o_long_lai_chau_1.png', 0, 'active', 'Búp trà Oolong Kim Tuyên/Thanh Tâm lên men bán phần.', 'Nhiệt độ nước: 95-100 độ C. Tráng trà nhanh. Hãm 45-60 giây cho nước đầu. Hương vị ngon nhất ở nước thứ 2 và 3.', '2026-01-28 09:46:07'),
(48, 'Trà Oolong Nướng (Roasted Oolong)', 'tra-o-long-len-men', 'Bí quyết tạo nên món \"Trà Sữa Nướng\" vạn người mê. Trà Oolong được rang ở nhiệt độ cao (Roasting) tạo ra mùi hương khói (Smoky) đặc trưng và vị trà đậm đà, mạnh mẽ. Khi pha với sữa, vị trà vẫn nổi bật chứ không bị lấn át, tạo nên ly trà sữa thơm lừng, béo ngậy.', 'Hương khói đặc trưng, chuyên làm trà sữa nướng.', 160000.00, 0.00, 'NL008', 60, 2, 'assets/images/tra_o_long_len_men_1.png', 1, 'active', 'Trà Oolong rang nhiệt độ cao.', 'Ủ 40g trà với 1 lít nước sôi 100 độ C trong 10-12 phút. Lấy nước cốt pha trà sữa nướng, trà sữa kem trứng.', '2026-01-28 09:46:07'),
(49, 'Trà Phổ Nhĩ (Pu-erh Tea)', 'tra-pho-nhi', '🌿 Trà Phổ Nhĩ Hóa Thạch Toái Ngân Tử - Tây Song Bản, Vân Nam - Hương Nhu 14 năm\r\n\r\n\r\n\r\n▪ Quy cách: Hộp thiết 100g\r\n\r\n▪ Loại trà: Phổ Nhĩ (Puer)\r\n\r\n▪ Hương vị: Thanh, hậu ngọt, Hương Nhu\r\n\r\n▪ Xuất sứ: Tây Song Bản, Vân Nam, Trung Quốc\r\n\r\n▪ Bảo Quản: Tránh ánh nắng, ẩm thấp, mùi nồng.\r\n\r\n▪ Hạn sử dụng: 36 tháng\r\n\r\nTrong điều kiện tốt thì trà càng để lâu càng lên men càng ngon\r\n\r\n▪ Năm sản Xuất 2006 \r\n\r\n\r\n\r\nỞ Trung Quốc có một loại trà hảo hạng, nhưng bề ngoài của nó giống như những cục đất đen xì kém bắt mắt. Nó được gọi là trà Phổ Nhĩ Hóa Thạch. Không giống như trà phổ nhĩ khác, hóa thạch trà giống như những viên đá hay đất nhỏ, hay người Trung Quốc gọi là bạc vụn (Toái Ngân) bởi lẽ hình dạng của trà giống như bạc vụn ngày xưa.\r\n\r\nTrong quá trình lên men, trà Phổ Nhĩ sẽ tiết ra chất Pectin (hỗn hợp các acid polygalacturonic và các este methyl) khiến cho trà bị kết dính lại với nhau, những vụn trà đóng cục này sẽ được lên men kỹ hơn để tạo ra Hóa Thạch trà, theo nhà sản xuất thì khoảng 50kg trà Phổ Nhĩ sẽ lựa ra được một ít Hóa Thạch trà.\r\n\r\n\r\n\r\nHóa thạch trà của trà Phổ Nhĩ không chỉ có tác dụng đơn thuần là để giải khát, nó còn có những lợi ích nhất định đối với cơ thể. Và còn nhiều điều thú vị khác nữa ....hãy dùng qua một lần để cảm nhận nhé mọi người.', 'Trà bánh lên men lâu năm, vị gỗ đặc trưng, giảm mỡ máu.', 550000.00, 0.00, 'TRA040', 10, 1, 'assets/images/tra_pho_nhi_1.png', 0, 'active', 'Lá trà Shan Tuyết cổ thụ lên men ép bánh.', 'Dùng dao tách một miếng nhỏ (5-7g). Tráng trà 2 lần nước sôi để loại bỏ tạp chất và đánh thức trà. Hãm nước sôi 100 độ. Nước trà màu đỏ nâu rất đẹp.', '2026-01-28 09:46:07'),
(50, 'Trà Quế Hoa (Hoa Mộc)', 'tra-que-hoa', '🌟 Trà Quế Hoa Mộc Hoa Sấy Khô - Tự Nhiên, Không Hóa Chất 🌟\r\n\r\n\r\n\r\nCải thiện sức khỏe và hương vị thơm ngon: Trà Quế Hoa Mộc Hoa Sấy Khô là lựa chọn lý tưởng để tăng cường sức đề kháng, giảm đau họng và hỗ trợ tiêu hóa. Với hương vị thanh tự nhiên và tính mát, đây là loại trà không thể thiếu trong tủ đồ của bạn!\r\n\r\n\r\n\r\n🌿 Tự nhiên và An Toàn 🌿\r\n\r\n- Trà Quế Hoa Mộc Hoa Sấy Khô được làm từ nguyên liệu tự nhiên, không sử dụng chất bảo quản hay hương liệu.\r\n\r\n- Hỗ trợ giảm đau họng và cải thiện tiêu hóa hiệu quả.\r\n\r\n\r\n\r\n📦 Đa dạng trọng lượng 📦\r\n\r\n- Có nhiều trọng lượng để lựa chọn: 20gr, 50gr, 100gr, và 200gr.\r\n\r\n- Phù hợp cho mọi nhu cầu sử dụng, từ dùng cá nhân đến chia sẻ với gia đình và bạn bè.\r\n\r\n\r\n\r\n🍃 Cách pha trà 🍃\r\n\r\n- Có thể pha nóng hoặc lạnh tùy theo sở thích.\r\n\r\n- Thêm đường phèn hoặc mật ong để tăng hương vị.\r\n\r\n\r\n\r\nTrà Quế Hoa Mộc Hoa Sấy Khô không chỉ là một thức uống ngon miệng mà còn là một liệu pháp tự nhiên giúp bạn chăm sóc sức khỏe một cách toàn diện!', 'Hương thơm trái chín ngọt ngào, dưỡng nhan, làm bánh/thạch.', 190000.00, 0.00, 'TRA041', 29, 1, 'assets/images/tra_que_hoa_1.png', 0, 'active', '100% Nụ hoa mộc sấy khô.', 'Pha trà: Hãm 3g hoa với 200ml nước sôi. Có thể mix cùng trà Oolong hoặc trà đen để tăng hương vị.', '2026-01-28 09:46:07'),
(51, 'Trà Quế Thảo Mộc Ấm Nồng', 'tra-que-thao-moc', 'Sự kết hợp giữa vỏ quế dày nhiều tinh dầu và các loại thảo mộc phương Đông. Vị cay nồng của quế giúp làm ấm cơ thể nhanh chóng, kích thích tuần hoàn máu và giảm đau nhức xương khớp mùa lạnh. Hương thơm ấm áp của trà mang lại cảm giác an toàn, vỗ về.\r\n\r\n✨ CÔNG DỤNG\r\n\r\n\r\n\r\nTheo Y Học Cổ Truyền, Quế là 1 trong Tứ Đại Danh Dược, được ví như Sâm. Giúp:  \r\n\r\n\r\n\r\n- Làm ấm cơ thể, ngăn ngừa cảm lạnh\r\n\r\n\r\n\r\n- Lưu thông máu, hỗ trợ giảm mỡ máu, tốt cho tim mạch, ngăn ngừa đột quỵ\r\n\r\n\r\n\r\n- Giúp ổn định đường huyết cho người bị tiểu đường\r\n\r\n\r\n\r\n- Giúp tiêu hóa thức ăn, giải rượu, bia\r\n\r\n\r\n\r\n- Giúp sạch khoang miệng, cho hơi thở thơm tho\r\n\r\n\r\n\r\n- Giúp thanh lọc cơ thể, giảm cân một cách an toàn', 'Vị cay ấm, tốt cho tuần hoàn máu, giảm đau nhức.', 80000.00, 0.00, 'TRA042', 60, 1, 'assets/images/tra_que_thao_moc_1.png', 0, 'active', 'Quế thanh cạo vỏ, Hồi, Thảo quả, Cỏ ngọt.', 'Bẻ nhỏ quế thanh, hãm cùng các thảo mộc với nước sôi già. Nên uống nóng vào buổi sáng mùa đông hoặc khi bị cảm lạnh.', '2026-01-28 09:46:07'),
(52, 'Trà Sâm Dứa Đà Nẵng', 'tra-sam-dua', '🌟 Hương vị tự nhiên và thanh nhiệt, giải độc - Trà Sâm Dứa Đà Nẵng là lựa chọn hoàn hảo cho sức khỏe và tinh thần của bạn! \r\n\r\n\r\n\r\n🌿 Đặc điểm nổi bật:\r\n\r\n- Thanh nhiệt, giải độc: Giúp cơ thể bạn cân bằng và khỏe mạnh.\r\n\r\n- Hỗ trợ giảm cân: Với thành phần từ trà xanh và lá dứa, trà này hỗ trợ quá trình giảm cân hiệu quả.\r\n\r\n- Hương vị tự nhiên: Vị đắng hậu ngọt, chát trà xanh và mùi thơm dễ chịu của lá dứa tạo nên trải nghiệm uống trà độc đáo.', 'Đặc sản Đà Nẵng, thơm nồng mùi lá dứa.', 60000.00, 0.00, 'TRA043', 100, 1, 'assets/images/tra_sam_dua_1.png', 1, 'active', 'Búp trà xanh, Lá dứa (Lá nếp), Hoa lài, Hương thảo mộc.', 'Pha trà như bình thường. Rót ra ly đá đầy. Cảm giác mát lạnh và hương thơm lá dứa sẽ xua tan cái nóng mùa hè.', '2026-01-28 09:46:07'),
(53, 'Trà Sâm Hồng Thảo Mộc', 'tra-sam-hong', 'Thức uống thanh nhiệt từ vùng núi Tây Bắc. Trà Sâm Hồng có vị ngọt đậm đà tự nhiên từ cỏ ngọt và chè dây, hoàn toàn không cần thêm đường. Rất tốt cho người bị nóng trong, hay nổi mụn, mất ngủ hoặc người tiểu đường muốn uống ngọt mà không hại sức khỏe.', 'Vị ngọt tự nhiên, mát gan, trị mụn, tốt cho người tiểu đường.', 75000.00, 0.00, 'TRA044', 80, 1, 'assets/images/tra_sam_hong_1.png', 0, 'active', 'Chè dây, Cỏ ngọt, Hoa la hán, Kim ngân hoa.', 'Hãm 10g trà với nước sôi. Uống nóng hoặc bỏ tủ lạnh uống thay nước giải khát. Vị ngọt lưu lại rất lâu ở cổ họng.', '2026-01-28 09:46:07'),
(54, 'Trà Sâm Kỳ Tử Hải Dương', 'tra-sam-ky-hai-duong', 'Sản phẩm bồi bổ khí huyết thượng hạng. Sâm (Đảng sâm hoặc Sâm Bố Chính) kết hợp với Kỷ tử đỏ tạo nên bài thuốc giúp sáng mắt, hồng da, tăng cường sinh lực. Vị trà ngọt thanh, tính bình, thích hợp cho cả nam và nữ muốn cải thiện sức khỏe.', 'Bổ khí huyết, sáng mắt, tăng cường sinh lực.', 120000.00, 0.00, 'TRA045', 40, 1, 'assets/images/tra_sam_ky_hai_duong_1.png', 0, 'active', 'Sâm thái lát sấy khô, Kỷ tử đỏ (Câu kỷ tử).', 'Hãm nước sôi uống như trà. Sau khi uống hết nước nên ăn cả cái để tận dụng hết dược chất.', '2026-01-28 09:46:07'),
(55, 'Trà Sâm Tố Nữ Hồi Xuân', 'tra-sam-to-nu', 'Bí mật của sự quyến rũ. Sâm Tố Nữ chứa hoạt chất Estrogen thực vật mạnh gấp ngàn lần mầm đậu nành, giúp cân bằng nội tiết tố nữ, làm nở nang vòng 1, giảm khô hạn và bốc hỏa ở phụ nữ tiền mãn kinh. Uống trà mỗi ngày để gìn giữ nét xuân thì rạng rỡ.', 'Cân bằng nội tiết nữ, nở ngực, đẹp da, giảm bốc hỏa.', 200000.00, 0.00, 'TRA046', 30, 1, 'assets/images/tra_sam_to_nu_1.png', 0, 'active', 'Củ Sâm Tố Nữ thái lát sấy lạnh.', 'Đun sôi 10-15g sâm với 1 lít nước trong 20 phút. Chia uống trong ngày. Không dùng cho phụ nữ mang thai hoặc người có u xơ.', '2026-01-28 09:46:07'),
(56, 'Trà Tâm Sen (Tim Sen) Huế', 'tra-tam-sen', 'Vị thuốc đắng dã tật từ tâm của hạt sen. Tâm sen có tính hàn, vị đắng, tác dụng thanh tâm hỏa, trấn kinh, an thần cực mạnh. Chuyên trị chứng mất ngủ kinh niên, hay hồi hộp, tim đập nhanh, huyết áp cao. Chỉ cần một nhúm nhỏ tâm sen là bạn sẽ có một giấc ngủ ngon đến sáng.', 'Đặc trị mất ngủ, hạ huyết áp, thanh nhiệt.', 150000.00, 0.00, 'TRA047', 50, 1, 'assets/images/tra_tam_sen_1.png', 0, 'active', 'Tâm sen (Tim sen) loại 1 sao vàng hạ thổ.', 'Lấy một lượng nhỏ (khoảng 3g) rửa sạch, hãm với nước sôi 5-10 phút. Nên uống vào buổi tối. Người huyết áp thấp không nên dùng nhiều.', '2026-01-28 09:46:07'),
(57, 'Trà Tấm (Trà Cám) Thái Nguyên', 'tra-tam-vun', 'Những mảnh vụn nhỏ gãy ra từ quá trình sao chè Thái Nguyên, tuy ngoại hình không đẹp nhưng chất lượng nước vẫn rất \"đỉnh\". Trà Tấm cho màu nước xanh đậm đà, hương thơm nồng và độ chát cao, rất tiết kiệm. Đây là lựa chọn số 1 của các quán trà đá vỉa hè.', 'Giá rẻ, nước đậm đà, chuyên pha trà đá.', 40000.00, 0.00, 'TRA048', 200, 1, 'assets/images/tra_tam_vun_1.png', 0, 'active', 'Vụn chè Thái Nguyên (gồm nõn tôm và lá gãy).', 'Dùng túi vải lọc trà để pha cho nước trong. Hãm nước sôi già. Pha loãng làm trà đá.', '2026-01-28 09:46:07'),
(58, 'Trà Thái Nguyên Truyền Thống', 'tra-thai-nguyen', 'Hương vị quen thuộc của mọi gia đình Việt. Trà búp Thái Nguyên loại truyền thống với cánh trà to, chắc. Nước trà màu vàng mật ong, vị chát đậm đà, \"uống đến đâu biết đến đấy\". Thích hợp để uống hàng ngày sau bữa ăn hoặc đãi khách bình dân.', 'Vị chát đậm truyền thống, nước vàng mật ong.', 180000.00, 0.00, 'TRA049', 50, 1, 'assets/images/tra_thai_nguyen_1.png', 0, 'active', '100% Chè búp Thái Nguyên sao khô.', 'Pha với nước sôi 100 độ C. Ngâm 3-5 phút tùy khẩu vị uống đậm hay nhạt.', '2026-01-28 09:46:07'),
(59, 'Trà Thái Xanh (Cha Tra Mue)', 'tra-thai-xanh', 'Nguyên liệu nhập khẩu để làm món Trà Sữa Thái Xanh huyền thoại. Bột trà có mùi thơm thảo mộc đặc trưng, khi pha ra có màu xanh ngọc bích rất đẹp mắt. Vị trà chát nhẹ, béo ngậy khi kết hợp với sữa đặc và bột béo.', 'Nguyên liệu làm trà sữa Thái Xanh, màu đẹp.', 65000.00, 0.00, 'NL009', 150, 2, 'assets/images/tra_thai_xanh_1.png', 1, 'active', 'Bột trà xanh Thái Lan, Màu thực phẩm, Hương liệu.', 'Nấu trà với nước sôi, lọc bã. Thêm bột kem béo và sữa đặc khi nước trà còn nóng. Thêm đá và thạch rau câu để thưởng thức.', '2026-01-28 09:46:07'),
(60, 'Trà Thảo Mộc Ba Kích Tím', 'tra-thao-moc-ba-kich', '\"Ông uống bà khen\". Ba kích tím Quảng Ninh nổi tiếng với công dụng bổ thận tráng dương, mạnh gân cốt. Ngoài cách ngâm rượu truyền thống, Ba kích sấy khô có thể dùng để sắc nước uống hàng ngày, giúp giảm đau lưng mỏi gối và tăng cường sức khỏe sinh lý phái mạnh.', 'Bổ thận tráng dương, mạnh gân cốt, giảm đau lưng.', 160000.00, 0.00, 'TRA050', 30, 1, 'assets/images/tra_thao_moc_ba_kich_1.png', 0, 'active', 'Củ Ba Kích tím bỏ lõi, sấy khô.', 'Sắc 15-20g ba kích với 1 lít nước, đun nhỏ lửa 30 phút. Hoặc dùng ngâm rượu (1kg khô ngâm 4-5 lít rượu 40 độ).', '2026-01-28 09:46:07'),
(61, 'Ngự Trà An Nữ (Điều Kinh)', 'tra-thao-moc-ngu-tra-an-nu', 'Bài thuốc quý dành riêng cho phái đẹp. Sự kết hợp của Ích Mẫu, Hương Phụ và Ngải Cứu giúp điều hòa kinh nguyệt, giảm đau bụng kinh và giúp da dẻ hồng hào hơn. Thức uống chăm sóc sức khỏe tử cung và nội tiết tố nữ từ gốc.', 'Điều hòa kinh nguyệt, giảm đau bụng, tốt cho phụ nữ.', 145000.00, 72500.00, 'TRA051', 40, 1, 'assets/images/tra_thao_moc_ngu_tra_an_nu_1.png', 0, 'active', 'Ích mẫu, Hương phụ, Ngải cứu, Đương quy, Xuyên khung.', 'Hãm trà hoặc sắc uống. Nên uống trước kỳ kinh 5-7 ngày để giảm đau bụng hiệu quả. Không dùng khi đang mang thai.', '2026-01-28 09:46:07');
INSERT INTO `products` (`id`, `name`, `slug`, `description`, `short_description`, `price`, `sale_price`, `sku`, `stock_quantity`, `category_id`, `image_url`, `is_bestseller`, `status`, `ingredients`, `usage_instructions`, `created_at`) VALUES
(62, 'Trà Thảo Mộc Xuân Thu', 'tra-thao-moc-xuan-thu', 'Lấy cảm hứng từ sự giao mùa, trà Xuân Thu mang lại sự cân bằng cho cơ thể. Vị trà nhẹ nhàng, thanh khiết từ các loại hoa và thảo mộc tính bình, giúp thư giãn, giảm mệt mỏi và tăng cường sức đề kháng khi thời tiết thay đổi.', 'Cân bằng cơ thể, tăng đề kháng, hương vị nhẹ nhàng.', 125000.00, 62500.00, 'TRA052', 35, 1, 'assets/images/tra_thao_moc_xuan_thu_1.png', 0, 'active', 'Hoa cúc, Kỷ tử, Táo đỏ, Cỏ ngọt, Nụ nhài.', 'Pha trà với nước nóng, thưởng thức vào buổi sáng sớm hoặc chiều tà để cảm nhận sự thư thái.', '2026-01-28 09:46:07'),
(63, 'Trà Tía Tô (Perilla Tea)', 'tra-tia-to', 'Bí quyết làm đẹp da của phụ nữ Nhật Bản. Lá tía tô tím chứa hoạt chất làm trắng da tự nhiên, mờ thâm nám và chống lão hóa. Ngoài ra, trà tía tô nóng còn là bài thuốc giải cảm lạnh, trừ hàn, giảm ho cực kỳ hiệu quả trong dân gian.', 'Làm trắng da, trị nám, giải cảm lạnh.', 60000.00, 30000.00, 'TRA053', 80, 1, 'assets/images/tra_tia_to_1.png', 0, 'active', 'Thân và lá tía tô tím sấy khô.', 'Hãm trà uống hàng ngày thay nước để làm đẹp da. Khi bị cảm, uống một cốc trà tía tô nóng đậm đặc rồi đắp chăn cho ra mồ hôi.', '2026-01-28 09:46:07'),
(64, 'Trà Rau Mương Dạ Dày', 'tra-tui-loc-cay-rau-muong', 'Khắc tinh của vi khuẩn HP dạ dày. Cây rau mương là thảo dược dân gian được lưu truyền với khả năng hỗ trợ điều trị trào ngược dạ dày, viêm loét và tiêu diệt khuẩn HP. Dạng túi lọc tiện lợi, dễ uống, giúp bạn xua tan nỗi lo đau bao tử.', 'Hỗ trợ trị trào ngược dạ dày, diệt khuẩn HP.', 75000.00, 0.00, 'TRA054', 60, 1, 'assets/images/tra_tui_loc_cay_rau_muong_1.png', 0, 'active', 'Cây rau mương (thân, lá, hoa) phơi khô xay nhỏ.', 'Nhúng 2 túi lọc vào cốc nước sôi. Uống trước bữa ăn 15-30 phút để tráng lớp niêm mạc dạ dày.', '2026-01-28 09:46:07'),
(65, 'Trà Xanh Ướp Hoa Nhài Tự Nhiên', 'tra-uop-hoa-nhai', 'Sự tinh tế của nghệ thuật ướp trà Hà Thành. Không dùng hương liệu, chỉ dùng những nụ hoa nhài trắng muốt ngắt vào buổi chiều, ủ cùng trà xanh Thái Nguyên suốt đêm để hương hoa thấm sâu vào lõi trà. Vị trà chát đượm, hương hoa thanh khiết, tao nhã.', 'Ướp hoa tươi tự nhiên 100%, hương vị tao nhã.', 200000.00, 0.00, 'TRA055', 25, 1, 'assets/images/tra_uop_hoa_nhai_1.png', 0, 'active', 'Trà xanh Thái Nguyên loại 1, Hoa nhài quế.', 'Nhiệt độ nước 80-85 độ C. Hãm nhanh để giữ hương hoa. Thưởng thức chậm rãi.', '2026-01-28 09:46:07'),
(66, 'Trà Xanh Nguyên Chất (Green Tea)', 'tra-xanh', 'Lá trà xanh bánh tẻ được sấy khô đơn giản để giữ nguyên hàm lượng EGCG và chất chống oxy hóa cao nhất. Vị trà chát nhẹ, không gắt, tính mát, giúp thanh nhiệt, giải độc, chống lão hóa và ngăn ngừa ung thư.', 'Giàu EGCG, chống lão hóa, thanh nhiệt.', 50000.00, 0.00, 'TRA056', 100, 1, 'assets/images/tra_xanh_1.png', 0, 'active', 'Lá trà xanh bánh tẻ sấy khô.', 'Hãm nước uống hàng ngày. Có thể thêm chanh, đường, đá để làm trà chanh giải khát.', '2026-01-28 09:46:07'),
(67, 'Trà Xanh Cổ Thụ Suối Giàng', 'tra-xanh-co-thu', 'Thu hái từ những cây chè cổ thụ hàng trăm năm tuổi trên đỉnh núi cao, quanh năm mây phủ. Rễ cây cắm sâu vào lòng đất hút dưỡng chất nên trà có nội chất cực mạnh. Vị trà rất đậm, nước vàng óng, có thể pha được 7-8 nước mà vẫn còn vị. Dành cho người \"nghiện\" trà lâu năm.', 'Trà núi cao, nội chất mạnh, pha được nhiều nước.', 350000.00, 0.00, 'TRA057', 15, 1, 'assets/images/tra_xanh_co_thu_1.png', 0, 'active', 'Búp chè cổ thụ 1 tôm 2 lá.', 'Dùng nước sôi 100 độ. Trà cổ thụ cần nhiệt cao để đánh thức hương vị. Uống xong vị ngọt đọng lại rất lâu.', '2026-01-28 09:46:07'),
(68, 'Trà Shan Tuyết Hà Giang', 'tra-xanh-shan-tuyet', 'Danh trà lừng danh của vùng núi phía Bắc. Búp trà to, mập mạp, phủ một lớp lông tơ trắng mịn như tuyết. Khi pha, nước trà sánh vàng như mật ong rừng, hương thơm cốm non ngào ngạt, vị chát êm và hậu ngọt sâu sắc. Sản phẩm đạt tiêu chuẩn OCOP 5 sao.', 'Búp trà phủ tuyết trắng, đặc sản OCOP, vị thượng hạng.', 300000.00, 280000.00, 'TRA058', 20, 1, 'assets/images/tra_xanh_shan_tuyet_1.png', 1, 'active', '100% Chè Shan Tuyết cổ thụ Hà Giang.', 'Tráng ấm chén nóng. Dùng nước 90-95 độ C. Thưởng thức hương thơm trà bốc lên ngào ngạt trước khi uống.', '2026-01-28 09:46:07'),
(69, 'Chè Dây Rừng Mù Cang Chải', 'che-day-rung-mu-cang-chai', 'Thu hái từ vùng núi cao Mù Cang Chải, nơi có khí hậu khắc nghiệt tạo nên dược tính mạnh mẽ hơn. Chè dây ở đây có lớp phấn trắng dày, vị đắng nhẹ nhưng hậu ngọt rất sâu, hiệu quả gấp đôi trong việc hỗ trợ dạ dày.', 'Chè dây rừng nguyên chất, dược tính mạnh.', 135000.00, 0.00, 'TRA069', 40, 1, 'assets/images/che_day_sapa_1.png', 0, 'active', '100% Chè dây rừng Mù Cang Chải', 'Hãm nước sôi uống thay nước lọc.', '2026-01-28 10:20:14'),
(70, 'Lục Trà Ướp Hoa Lài (Cold Brew)', 'luc-tra-uop-hoa-lai-lanh', 'Phiên bản trà lài đặc biệt thích hợp cho phương pháp ủ lạnh (Cold Brew). Cánh trà to, không bị nát, khi ủ lạnh qua đêm sẽ cho ra nước trà ngọt lịm, không hề chát đắng, hương hoa lài giữ được trọn vẹn sự tươi mới.', 'Chuyên dùng ủ lạnh Cold Brew, vị ngọt ngào.', 95000.00, 0.00, 'TRA070', 80, 1, 'assets/images/luc_tra_lai_1.png', 1, 'active', 'Lục trà, Hoa lài tươi', 'Ủ 10g trà với 1 lít nước nguội trong tủ lạnh 8-12 tiếng.', '2026-01-28 10:20:14'),
(71, 'Oolong Mật Ong Rừng', 'oolong-mat-ong-rung', 'Sự kết hợp giữa Oolong Tứ Quý và mật ong khoái rừng già. Vị trà đậm đà quyện với vị ngọt khé đặc trưng của mật ong rừng tạo nên thức uống bồi bổ sức khỏe tuyệt vời, giúp tăng cường đề kháng tự nhiên.', 'Oolong kết hợp mật ong khoái, tăng đề kháng.', 180000.00, 0.00, 'TRA071', 25, 1, 'assets/images/mat_o_long_tra_1.png', 0, 'active', 'Trà Oolong, Mật ong rừng', 'Pha nóng để thưởng thức hương vị tốt nhất.', '2026-01-28 10:20:14'),
(72, 'Thảo Mộc An Thần Cung Đình', 'thao-moc-an-than-cung-dinh', 'Công thức bí truyền từ Thái Y Viện, không chỉ giúp ngủ ngon mà còn dưỡng tâm, bổ huyết. Vị trà thanh nhẹ, thoang thoảng mùi thảo mộc cung đình, mang lại cảm giác thư thái như đang ở chốn hoàng cung.', 'Bài thuốc cung đình, dưỡng tâm an thần.', 120000.00, 0.00, 'TRA072', 50, 1, 'assets/images/tra_an_than_ngu_ngon_1.png', 0, 'active', 'Tâm sen, Long nhãn, Bá tử nhân', 'Uống 1 tách ấm trước khi ngủ.', '2026-01-28 10:20:14'),
(73, 'Trà Bạc Hà Lạnh (Menthol Tea)', 'tra-bac-ha-lanh', 'Cảm giác mát lạnh sảng khoái tức thì! Hàm lượng tinh dầu Menthol được tăng cường giúp thông mũi mát họng cực nhanh. Thích hợp uống vào mùa hè hoặc khi cần sự tỉnh táo cao độ để làm việc.', 'Siêu mát lạnh, tỉnh táo tức thì.', 75000.00, 0.00, 'TRA073', 60, 1, 'assets/images/tra_bac_ha_1.png', 1, 'active', 'Lá bạc hà Nhật Bản sấy lạnh', 'Pha với đá và chanh tươi.', '2026-01-28 10:20:14'),
(74, 'Chè Búp Tân Cương Xanh', 'che-bup-tan-cuong-xanh', 'Dòng chè mộc bình dân, nước xanh, vị đậm, phù hợp với gu uống trà \"nặng đô\" của các cụ cao niên. Chè được sao tay kỹ, cánh săn chắc, pha được nhiều nước mà không bị nhạt.', 'Chè mộc đậm đà, nước xanh, giá tốt.', 150000.00, 0.00, 'TRA074', 100, 1, 'assets/images/tra_bac_thai_nguyen_1.png', 0, 'active', 'Chè búp Thái Nguyên', 'Pha nước sôi già.', '2026-01-28 10:20:14'),
(75, 'Ngự Trà Hoàng Cung (Hộp Quà)', 'ngu-tra-hoang-cung', 'Phiên bản hộp quà biếu Tết sang trọng của Trà Cung Đình. Gói trọn tinh hoa ẩm thực Huế với 16 vị thảo mộc tuyển chọn. Món quà ý nghĩa mang lời chúc sức khỏe, bình an cho người nhận.', 'Hộp quà biếu sang trọng, 16 vị thảo mộc.', 250000.00, 0.00, 'TRA075', 20, 1, 'assets/images/tra_cung_dinh_hue_1.png', 1, 'active', 'Thảo mộc cung đình tuyển chọn', 'Pha ấm lớn đãi khách.', '2026-01-28 10:20:14'),
(76, 'Hồng Trà Sữa Dalat (Túi Lớn)', 'hong-tra-sua-dalat', 'Gói lớn 1kg tiết kiệm dành cho các quán trà sữa hoặc gia đình đông người. Hồng trà được lên men kỹ, cho màu nước đỏ nâu đẹp mắt và hương thơm caramel tự nhiên, pha trà sữa béo ngậy cực chuẩn.', 'Gói lớn tiết kiệm, chuyên pha trà sữa.', 180000.00, 0.00, 'NL010', 50, 2, 'assets/images/tra_den_dalatfarm_1.png', 0, 'active', 'Hồng trà Đà Lạt', 'Ủ trà lấy cốt pha trà sữa.', '2026-01-28 10:20:14'),
(77, 'Gạo Lứt Đậu Đen Xanh Lòng', 'gao-lut-dau-den-xanh-long', 'Sự kết hợp \"gấp đôi canxi\" từ gạo lứt huyết rồng và đậu đen xanh lòng hạt nhỏ. Nước trà thơm mùi đậu rang, vị ngọt bùi, giúp xương chắc khỏe và thận hoạt động tốt hơn.', 'Tốt cho xương khớp, bổ thận, thơm bùi.', 70000.00, 0.00, 'TRA076', 90, 1, 'assets/images/tra_gao_luc_1.png', 0, 'active', 'Gạo lứt, Đậu đen xanh lòng', 'Hãm nước sôi uống cả cái lẫn nước.', '2026-01-28 10:20:14'),
(78, 'Trà Gừng Sả Mật Ong', 'tra-gung-sa-mat-ong', 'Thêm hương vị sả chanh tươi mát giúp cân bằng vị cay của gừng. Thức uống detox, giải cảm tuyệt vời, giúp làm ấm bụng và thư giãn cơ bắp sau khi vận động mạnh.', 'Thêm vị sả thơm mát, detox, giải cảm.', 60000.00, 0.00, 'TRA077', 80, 1, 'assets/images/tra_gung_1.png', 0, 'active', 'Gừng, Sả, Mật ong', 'Pha nước nóng.', '2026-01-28 10:20:14'),
(79, 'Thập Toàn Đại Bổ Trà', 'thap-toan-dai-bo-tra', 'Bài thuốc \"Thập Toàn Đại Bổ\" nay đã có dạng trà tiện lợi. Giúp phục hồi sinh lực cho người mới ốm dậy, người già yếu. Vị ngọt đậm đà của các vị thuốc bắc nhưng rất dễ uống, không bị hăng.', 'Bồi bổ toàn diện, phục hồi sức khỏe.', 300000.00, 0.00, 'TRA078', 15, 1, 'assets/images/tra_hoang_thao_moc_1.png', 0, 'active', 'Đảng sâm, Bạch linh, Bạch truật...', 'Sắc uống hoặc hãm kỹ.', '2026-01-28 10:20:14'),
(80, 'Hồng Sâm Thái Lát Tẩm Mật', 'hong-sam-thai-lat-tam-mat', 'Những lát hồng sâm dẻo quánh, thấm đẫm mật ong rừng. Có thể ăn trực tiếp như mứt hoặc hãm trà đều ngon. Vị đắng nhẹ của sâm hòa quyện với vị ngọt của mật ong tạo nên hương vị khó quên.', 'Ăn trực tiếp hoặc pha trà, dẻo ngọt.', 350000.00, 0.00, 'TRA079', 20, 1, 'assets/images/tra_hong_sam_1.png', 1, 'active', 'Hồng sâm, Mật ong', 'Ăn trực tiếp 2-3 lát mỗi ngày.', '2026-01-28 10:20:14'),
(81, 'Khổ Qua Rừng Sấy Khô (Vị Mộc)', 'kho-qua-rung-say-kho', 'Dành cho người thích vị đắng nguyên bản. Khổ qua rừng được phơi nắng tự nhiên, không tẩm ướp, giữ nguyên dược tính cao nhất hỗ trợ điều trị tiểu đường.', 'Vị đắng nguyên bản, hỗ trợ tiểu đường mạnh.', 100000.00, 0.00, 'TRA080', 60, 1, 'assets/images/tra_kho_qua_1.png', 0, 'active', 'Khổ qua rừng nguyên chất', 'Hãm nước sôi.', '2026-01-28 10:20:14'),
(82, 'Trà Nhài Cổ Thụ', 'tra-nhai-co-thu', 'Sử dụng búp chè Shan Tuyết cổ thụ ướp hương nhài thay vì chè Tân Cương thông thường. Vị trà đậm đà hơn, chát êm hơn và pha được nhiều nước hơn. Một trải nghiệm mới lạ cho người yêu trà nhài.', 'Nền trà cổ thụ đậm đà, hương nhài thanh khiết.', 220000.00, 0.00, 'TRA081', 30, 1, 'assets/images/tra_lai_tan_cuong_1.png', 0, 'active', 'Chè Shan Tuyết, Hoa nhài', 'Pha nước 90 độ C.', '2026-01-28 10:20:14'),
(83, 'Trà Quả Mọng (Berry Tea)', 'tra-qua-mong', 'Sự bùng nổ của các loại quả mọng: Mâm xôi, Dâu tây, Việt quất. Vị chua ngọt tự nhiên, màu đỏ rực rỡ, chứa cực nhiều Vitamin C giúp đẹp da và tăng cường hệ miễn dịch.', 'Mix nhiều loại quả mọng, giàu Vitamin C.', 140000.00, 0.00, 'TRA082', 40, 1, 'assets/images/tra_mam_xoi_1.png', 1, 'active', 'Mâm xôi, Dâu tây, Việt quất sấy', 'Pha trà trái cây lạnh.', '2026-01-28 10:20:14'),
(84, 'Trà Mãng Cầu Xiêm Giảm Cân', 'tra-mang-cau-xiem-giam-can', 'Tập trung vào công dụng hỗ trợ giảm cân của mãng cầu xiêm. Trà được sấy khô kiệt nước, hương thơm nồng hơn, giúp giảm cảm giác thèm ăn và đốt cháy mỡ thừa hiệu quả.', 'Hỗ trợ giảm cân, hương thơm nồng.', 120000.00, 0.00, 'TRA083', 50, 1, 'assets/images/tra_mang_cau_slim_1.png', 0, 'active', 'Thịt mãng cầu xiêm già', 'Uống trước bữa ăn.', '2026-01-28 10:20:14'),
(85, 'Oolong Tứ Quý (Four Seasons)', 'oolong-tu-quy', 'Giống trà Oolong Tứ Quý nổi tiếng với hương thơm hoa cỏ bốn mùa. Nước trà màu vàng ánh xanh, vị chát rất nhẹ, hậu ngọt thanh, uống cả ngày không biết chán.', 'Hương hoa bốn mùa, vị thanh nhẹ.', 190000.00, 0.00, 'TRA084', 40, 1, 'assets/images/tra_o_long_lai_chau_1.png', 1, 'active', 'Trà Oolong Tứ Quý', 'Pha công phu trà.', '2026-01-28 10:20:14'),
(86, 'Mộc Quế Hoa Trà (Osmanthus)', 'moc-que-hoa-tra', 'Tên gọi mỹ miều cho loại trà hoa mộc cao cấp. Những nụ hoa vàng ươm được tuyển chọn kỹ lưỡng, không lẫn tạp chất, chuyên dùng để ướp trà sen hoặc làm thạch Quế Hoa dưỡng nhan.', 'Hoa mộc tuyển chọn, làm thạch dưỡng nhan.', 210000.00, 0.00, 'TRA085', 25, 1, 'assets/images/tra_que_hoa_1.png', 0, 'active', 'Hoa mộc thượng hạng', 'Pha trà hoặc nấu chè.', '2026-01-28 10:20:14'),
(87, 'Sâm Hồng Bát Tiên', 'sam-hong-bat-tien', 'Phiên bản cao cấp bổ sung thêm Kỷ tử và Táo đỏ vào Trà Sâm Hồng. Không chỉ mát gan mà còn bổ máu, đẹp da, thích hợp cho chị em phụ nữ văn phòng.', 'Thêm kỷ tử táo đỏ, đẹp da mát gan.', 90000.00, 0.00, 'TRA086', 60, 1, 'assets/images/tra_sam_hong_1.png', 0, 'active', 'Chè dây, Cỏ ngọt, Kỷ tử, Táo đỏ', 'Hãm uống hàng ngày.', '2026-01-28 10:20:14'),
(88, 'Bạch Trà Shan Tuyết Cổ Thụ', 'bach-tra-shan-tuyet', 'Đỉnh cao của trà Việt. Chỉ hái 1 tôm (búp non nhất) của cây chè cổ thụ, phơi khô tự nhiên trong bóng râm (không sao nhiệt). Bạch trà có lớp lông tuyết trắng muốt, hương thơm cỏ khô tinh tế, vị thanh khiết như nước suối nguồn.', 'Bạch trà quý hiếm, phơi khô tự nhiên.', 500000.00, 0.00, 'TRA087', 10, 1, 'assets/images/tra_xanh_shan_tuyet_1.png', 1, 'active', '100% búp non Shan Tuyết (1 tôm)', 'Pha nước 85 độ, thưởng thức tinh tế.', '2026-01-28 10:20:14'),
(89, 'Hồng Trà Bá Tước (Earl Grey)', 'hong-tra-ba-tuoc', 'Dòng trà quý tộc phương Tây. Hồng trà (Trà đen) hảo hạng được ướp tinh dầu vỏ cam Bergamot miền Địa Trung Hải. Hương thơm cam chanh nồng nàn quyện với vị trà đậm đà tạo nên phong cách thưởng trà kiểu Anh đích thực.', 'Hương cam Bergamot quý tộc, phong cách Anh Quốc.', 115000.00, 0.00, 'TRA089', 50, 2, 'assets/images/tra_den_dalatfarm_1.png', 1, 'active', 'Hồng trà, Tinh dầu Bergamot', 'Pha nóng, thêm đường hoặc sữa tươi.', '2026-01-28 10:23:10'),
(90, 'Lục Trà Lài King (Dòng Vua)', 'luc-tra-lai-king', 'Phiên bản cao cấp nhất của dòng trà nhài pha chế. Sử dụng cốt trà xanh vùng cao ít chát, độ hương (độ thơm) cao gấp đôi loại thường. Chuyên dùng cho các món trà trái cây cao cấp (\"King\") yêu cầu độ thơm tinh tế.', 'Độ hương gấp đôi, chuyên pha trà trái cây cao cấp.', 145000.00, 0.00, 'NL011', 100, 2, 'assets/images/luc_tra_lai_1.png', 0, 'active', 'Trà xanh tuyển chọn ướp hương lài', 'Ủ trà nhiệt độ 80 độ C để giữ hương.', '2026-01-28 10:23:10'),
(91, 'Trà Gừng Đường Đen (Ô Mai)', 'tra-gung-duong-den', 'Sự kết hợp giữa vị cay nồng của gừng già và vị ngọt đậm đà, thơm mùi mật mía của đường đen (đường nâu). Thức uống lý tưởng cho phụ nữ ngày \"đèn đỏ\" hoặc người bị tụt huyết áp, lạnh bụng.', 'Vị ngọt đậm đà đường đen, làm ấm cực nhanh.', 65000.00, 0.00, 'TRA091', 80, 1, 'assets/images/tra_gung_1.png', 0, 'active', 'Bột gừng, Đường đen mật mía', 'Pha nước nóng uống liền.', '2026-01-28 10:23:10'),
(92, 'Trà Hoa Cúc Chi Hưng Yên', 'tra-hoa-cuc-chi-hung-yen', 'Đặc sản \"Cúc Tiến Vua\" nổi tiếng Hưng Yên. Bông cúc chi nhỏ, tròn xoe, màu vàng rực rỡ, được sấy lạnh nguyên bông. Vị trà hơi đắng nhẹ nhưng hậu ngọt, giúp sáng mắt, ngủ ngon và thanh nhiệt giải độc cực tốt.', 'Cúc Tiến Vua sấy lạnh nguyên bông, sáng mắt.', 150000.00, 135000.00, 'TRA092', 40, 1, 'assets/images/tra_hoa_cuc_que_hoa_ky_tu_1.png', 0, 'active', '100% Hoa cúc chi sấy lạnh', 'Hãm với nước sôi, thêm kỷ tử táo đỏ.', '2026-01-28 10:23:10'),
(93, 'Trà Oolong Sữa (Milk Oolong)', 'tra-o-long-sua', 'Dòng Oolong đặc biệt có hương thơm sữa tự nhiên (Milky) thoang thoảng dù không hề pha sữa. Vị trà mượt mà như lụa, béo ngậy nơi đầu lưỡi. Đây là giống trà lai tạo đặc biệt, rất được lòng phái nữ.', 'Hương sữa tự nhiên, vị mượt mà béo ngậy.', 210000.00, 0.00, 'TRA093', 30, 1, 'assets/images/tra_o_long_lai_chau_1.png', 1, 'active', 'Búp trà Oolong giống Kim Tuyên', 'Pha nhiệt độ 90-95 độ C.', '2026-01-28 10:23:10'),
(94, 'Trà Gạo Lứt Xạ Đen', 'tra-gao-lut-xa-den', 'Bổ sung thêm Xạ Đen - thảo dược hỗ trợ ngăn ngừa ung bướu vào trà gạo lứt truyền thống. Vị trà vẫn thơm mùi gạo rang nhưng có thêm chút nhẫn nhẹ của thảo mộc, tăng cường khả năng thải độc gan.', 'Thêm xạ đen ngừa ung bướu, thải độc gan.', 75000.00, 0.00, 'TRA094', 60, 1, 'assets/images/tra_gao_luc_1.png', 0, 'active', 'Gạo lứt, Xạ đen, Đậu đen', 'Đun sôi hoặc hãm trong bình giữ nhiệt.', '2026-01-28 10:23:10'),
(95, 'Trà Cà Gai Leo Túi Lọc', 'tra-ca-gai-leo-tui-loc', 'Phiên bản túi lọc tiện lợi của cà gai leo. Dành cho người bận rộn muốn bảo vệ gan, giải rượu bia nhưng không có thời gian đun nấu. Chỉ cần 3 phút là có ngay ly trà giải độc gan thơm ngon.', 'Giải độc gan dạng túi lọc tiện lợi.', 60000.00, 0.00, 'TRA095', 120, 1, 'assets/images/tra_tui_loc_cay_rau_muong_1.png', 0, 'active', 'Cà gai leo, Diệp hạ châu', 'Nhúng túi lọc vào nước sôi.', '2026-01-28 10:23:10'),
(96, 'Trà Dây Cao Bằng (Chè Dây)', 'tra-day-cao-bang', 'Cùng là chè dây nhưng thu hái ở vùng núi Cao Bằng. Lá chè dày hơn, nhiều nhựa trắng hơn, vị chát đậm hơn một chút so với chè Sapa. Hiệu quả cắt cơn đau dạ dày rất nhanh chóng.', 'Đặc sản Cao Bằng, cắt cơn đau dạ dày nhanh.', 110000.00, 0.00, 'TRA096', 45, 1, 'assets/images/che_day_sapa_1.png', 0, 'active', 'Chè dây Cao Bằng phơi khô', 'Hãm nước sôi uống hàng ngày.', '2026-01-28 10:23:10'),
(97, 'Lá Bạc Hà Sấy Khô (Âu)', 'la-bac-ha-say-kho', 'Lá bạc hà giống Âu (Peppermint) sấy khô nguyên lá. Mùi thơm nồng nàn hơn hẳn bạc hà ta. Thường dùng để pha trà (Tea blend) hoặc làm bánh, trang trí đồ uống rất đẹp mắt.', 'Giống bạc hà Âu thơm nồng, dùng pha trà/làm bánh.', 80000.00, 0.00, 'TRA097', 50, 1, 'assets/images/tra_bac_ha_1.png', 0, 'active', 'Lá bạc hà sấy nguyên cánh', 'Pha riêng hoặc mix cùng trà đen.', '2026-01-28 10:23:10'),
(98, 'Trà Sơn Mật Hồng Sâm (Đặc Biệt)', 'tra-son-mat-hong-sam', 'Tên đầy đủ của loại trà thảo mộc nổi tiếng Tây Bắc. \"Sơn Mật\" là mật của núi rừng. Vị ngọt của trà hoàn toàn từ cỏ ngọt và mật ong rừng thấm vào cây cỏ. Không đường hóa học, an toàn tuyệt đối.', 'Vị ngọt mật núi rừng, thanh nhiệt, an thần.', 85000.00, 0.00, 'TRA098', 70, 1, 'assets/images/tra_sam_hong_1.png', 1, 'active', 'Trà dây, kim ngân, cỏ ngọt, hoa nhài', 'Uống thay nước lọc.', '2026-01-28 10:23:10'),
(99, 'Chè Đắng Cao Bằng (Thái Lát)', 'che-dang-cao-bang', 'Nhìn hình thức rất giống khổ qua thái lát nhưng đây là Chè Đắng (Chè Khổ). Vị rất đắng nhưng hậu ngọt (Khổ tận cam lai). Chỉ cần 1-2 lát nhỏ (như đinh) là đủ cho một ấm trà. Giúp tỉnh táo và tiêu mỡ cực mạnh.', 'Rất đắng nhưng hậu ngọt, tiêu mỡ mạnh.', 160000.00, 0.00, 'TRA099', 20, 1, 'assets/images/tra_kho_qua_1.png', 1, 'active', 'Lá chè đắng cuộn tròn thái lát', 'Chỉ dùng 1-2 lát pha với nước sôi.', '2026-01-28 10:23:10'),
(100, 'Trà Sen Tây Hồ (Ướp Xổi)', 'tra-sen-tay-ho', 'Tinh hoa trà Việt. Trà xanh Tân Cương thượng hạng ướp trong bông sen Bách Diệp vùng Hồ Tây. Hương sen thơm ngát, thanh tao quyện với vị chát dịu của trà. (Hình ảnh minh họa là trà ướp hương hoa, nét tương đồng về màu sắc và cánh trà).', 'Quốc ẩm Việt Nam, ướp hương sen thanh tao.', 400000.00, 380000.00, 'TRA100', 10, 1, 'assets/images/tra_uop_hoa_nhai_1.png', 1, 'active', 'Trà xanh, Gạo sen, Nhụy sen', 'Pha nước 85 độ, thưởng thức tinh tế.', '2026-01-28 10:23:10'),
(101, 'Bột Sữa Khoai Môn Cao Cấp', 'bot-sua-khoai-mon', 'Bột sữa khoai môn (Taro Milk Powder) là nguyên liệu không thể thiếu để pha chế món trà sữa khoai môn \"thần thánh\". Sản phẩm có màu tím nhạt tự nhiên đẹp mắt, hương thơm khoai môn nồng nàn quyến rũ và vị béo ngậy đặc trưng. Bột mịn, dễ hòa tan, không bị vón cục, giúp ly trà sữa của bạn chuẩn vị quán.', 'Hương khoai môn nồng nàn, màu tím đẹp mắt.', 145000.00, 0.00, 'NL101', 100, 2, 'assets/images/bot-sua_khoai_mon_2.png', 1, 'active', 'Bột kem béo, tinh chất khoai môn, đường, màu thực phẩm tự nhiên.', 'Hòa tan 30g bột với 100ml nước nóng, thêm trà và sữa đặc.', '2026-01-28 12:24:12'),
(102, 'Bột Cacao Nguyên Chất', 'bot-cacao', 'Bột Cacao được nghiền từ những hạt cacao lên men chất lượng cao. Vị đắng đậm đà, hậu ngọt nhẹ, không pha tạp chất. Thích hợp để làm Chocolate đá xay, Cacao nóng, rắc mặt Tiramisu hoặc pha chế các loại đồ uống đá xay (Ice Blended).', 'Vị đắng đậm đà, làm đá xay cực ngon.', 95000.00, 0.00, 'NL102', 80, 2, 'assets/images/bot_cacao_1.png', 0, 'active', '100% hạt cacao nghiền mịn.', 'Pha 2 thìa bột với sữa đặc và nước nóng.', '2026-01-28 12:24:12'),
(103, 'Bột Cacao Thượng Hạng (Premium)', 'bot-ca-cao-thuong-hang', 'Dòng Cacao cao cấp với hàm lượng bơ cacao cao hơn, mang lại độ béo ngậy và hương thơm nồng nàn hơn hẳn loại thường. Sản phẩm tan nhanh trong nước lạnh, rất tiện lợi cho các Barista chuyên nghiệp. Màu nâu đỏ sang trọng, vị đắng dịu tinh tế.', 'Hàm lượng bơ cacao cao, tan nhanh, béo ngậy.', 180000.00, 160000.00, 'NL103', 50, 2, 'assets/images/bot_ca_cao_thuong_hang_1.png', 1, 'active', 'Bột cacao nguyên chất tách béo một phần.', 'Dùng làm sốt socola hoặc pha đồ uống cao cấp.', '2026-01-28 12:24:12'),
(104, 'Bột Frappe (Bột Mix) Dans', 'bot-frappe-dans', 'Bí quyết để món đá xay (Smoothie/Ice Blended) lâu tan và sánh mịn như kem. Bột Frappe Dans giúp liên kết các nguyên liệu, chống tách lớp nước và đá, tạo độ dẻo dai cho đồ uống. Hàng Việt Nam chất lượng cao, giá thành hợp lý cho các chủ quán.', 'Chống tách lớp, giúp đá xay sánh mịn.', 110000.00, 0.00, 'NL104', 120, 2, 'assets/images/bot_frappe_dans_1.png', 0, 'active', 'Maltodextrin, chất ổn định thực phẩm.', 'Sử dụng 10-15g cho một ly đá xay 500ml.', '2026-01-28 12:24:12'),
(105, 'Bột Kem Béo Thực Vật Creamer X', 'bot-kem-beo-creamer-x', 'Dòng bột kem béo chuyên dụng để pha trà sữa Đài Loan. Creamer X tôn lên vị trà đậm đà mà không làm mất đi mùi hương đặc trưng của trà. Độ béo vừa phải (32%), vị ngọt thanh, giúp ly trà sữa có độ sánh và ngậy hoàn hảo.', 'Tôn vị trà, độ béo 32%, chuyên pha trà sữa.', 75000.00, 0.00, 'NL105', 200, 2, 'assets/images/bot_kem_beo_creamerX_1.png', 1, 'active', 'Sirô glucose, dầu cọ tinh luyện, chất nhũ hóa.', 'Pha trực tiếp vào cốt trà nóng.', '2026-01-28 12:24:12'),
(106, 'Bột Sữa Béo Hà Lan (Kievit)', 'bot-kem-beo-ha-lan', 'Nhập khẩu từ Hà Lan (Indo), đây là \"tượng đài\" trong làng nguyên liệu trà sữa. Bột sữa Kievit có độ béo cao, vị sữa thơm lừng nhưng không ngấy. Khi pha với hồng trà sẽ cho ra màu nâu sữa sáng đẹp mắt, vị béo quyện với vị chát của trà tạo nên hương vị trà sữa truyền thống chuẩn mực.', 'Nhập khẩu Hà Lan, vị béo thơm lừng, chuẩn vị truyền thống.', 85000.00, 0.00, 'NL106', 150, 2, 'assets/images/bot_kem_beo_halan_1.png', 1, 'active', 'Tinh bột sắn, dầu hạt cọ hydro hóa.', 'Tỷ lệ vàng: 1 trà : 3 bột sữa : 2 đường.', '2026-01-28 12:24:12'),
(107, 'Bột Kem Béo Hàn Quốc (Frima)', 'bot-kem-beo-korea', 'Dòng bột kem không sữa (Non-dairy creamer) nổi tiếng của tập đoàn Dongsuh Hàn Quốc. Frima có vị sữa thanh hơn, ít béo hơn dòng Hà Lan, phù hợp với gu trà sữa hiện đại, nhẹ nhàng (Light milk tea). Rất hợp để pha cà phê sữa hoặc trà sữa gạo rang.', 'Vị sữa thanh nhẹ, gu Hàn Quốc, pha cà phê ngon.', 90000.00, 0.00, 'NL107', 80, 2, 'assets/images/bot_kem_beo_koera_1.png', 0, 'active', 'Dầu thực vật, đường, casein.', 'Dùng thay thế sữa tươi trong pha chế.', '2026-01-28 12:24:12'),
(108, 'Bột Kem Béo Thái Lan (B-One)', 'bot-kem-beo-thai-lan', 'Nguyên liệu chính để làm nên ly trà sữa Thái Xanh/Thái Đỏ đậm đà béo ngậy. Bột B-One có độ béo cực cao, giúp đồ uống sánh đặc, dậy mùi. Ngoài ra còn dùng để nấu súp, làm bánh hoặc sốt kem.', 'Độ béo cực cao, chuyên trị trà sữa Thái.', 65000.00, 0.00, 'NL108', 300, 2, 'assets/images/bot_kem_beo_thai_lan_1.png', 0, 'active', 'Chất béo thực vật, đường kính.', 'Hòa tan trong nước nóng, không cần đun sôi.', '2026-01-28 12:24:12'),
(109, 'Bột Làm Kem Trứng (Egg Pudding)', 'bot-kem-chung', 'Tự làm Pudding trứng núng nính, mềm tan ngay tại nhà chỉ trong 10 phút. Bột đã được pha sẵn tỷ lệ chuẩn, chỉ cần nấu sôi với đường và nước. Pudding thành phẩm có màu vàng tươi, thơm mùi trứng sữa, là topping \"best seller\" của mọi quán trà sữa.', 'Làm pudding trứng núng nính, mềm tan.', 120000.00, 0.00, 'NL109', 60, 2, 'assets/images/bot_kem_chung_1.png', 1, 'active', 'Bột trứng, bột sữa, carrageenan.', 'Tỷ lệ 100g bột : 1 lít nước : 100g đường.', '2026-01-28 12:24:12'),
(110, 'Bột Làm Chè Khúc Bạch (Panna Cotta)', 'bot-khuc-bach', 'Giải pháp làm chè khúc bạch nhanh gọn, không cần gelatin lá lỉnh kỉnh. Bột tạo đông tốt, kết cấu mềm dẻo, dai nhẹ, thơm mùi phô mai và hạnh nhân. Có thể biến tấu thành Panna Cotta kiểu Ý dễ dàng.', 'Làm khúc bạch nhanh gọn, dẻo dai, thơm hạnh nhân.', 135000.00, 0.00, 'NL110', 40, 2, 'assets/images/bot_khuc_bach_1.png', 0, 'active', 'Gelatin bột, bột kem béo, hương hạnh nhân.', 'Nấu với sữa tươi và kem whipping.', '2026-01-28 12:24:12'),
(111, 'Bột Gelatin (Thay Thế Lá)', 'bot-la-gelatin', 'Gelatin dạng bột tiện lợi, dễ cân đo, dùng để làm đông các loại bánh mousse, cheesecake, thạch, kẹo dẻo. Độ đông (Bloom) tiêu chuẩn 250, giúp bánh đứng form tốt mà vẫn mềm mịn, tan trong miệng.', 'Tạo đông bánh Mousse, thạch, kẹo dẻo.', 50000.00, 0.00, 'NL111', 100, 2, 'assets/images/bot_la_gelatin_1.png', 0, 'active', '100% Gelatin chiết xuất từ da động vật.', 'Ngâm nước lạnh 15 phút cho nở rồi đun chảy.', '2026-01-28 12:24:12'),
(112, 'Bột Matcha Đài Loan', 'bot-matcha', 'Bột trà xanh Matcha chuyên dùng cho pha chế (Cooking grade). Màu xanh tươi sáng, vị chát nhẹ đặc trưng, hương thơm thoang thoảng. Dùng làm Matcha đá xay, Matcha Latte hoặc làm bánh bông lan trà xanh màu lên rất đẹp.', 'Màu xanh tươi, chuyên làm đá xay, làm bánh.', 160000.00, 140000.00, 'NL112', 70, 2, 'assets/images/bot_matcha_1.png', 0, 'active', 'Lá trà xanh nghiền mịn.', 'Rây bột trước khi dùng để tránh vón cục.', '2026-01-28 12:24:12'),
(113, 'Bột Milk Foam Vị Vàng Sữa (Cheese)', 'bot-milkfoam-vang-sua', 'Tạo lớp kem mặn (Macchiato) thần thánh chỉ trong 2 phút đánh bông. Bột Milk Foam vị Vàng Sữa (Phô mai mặn) có vị béo ngậy, mặn nhẹ, sánh đặc, không bị chìm khi rót lên mặt trà. Giải pháp thay thế whipping cream đắt đỏ cho các quán.', 'Tạo lớp kem mặn phô mai, sánh đặc, đánh bông nhanh.', 115000.00, 0.00, 'NL113', 90, 2, 'assets/images/bot_milkFoam_vang_sua_2.png', 1, 'active', 'Bột kem béo, bột phô mai, muối biển.', 'Đánh bông 100g bột với 160ml nước lạnh.', '2026-01-28 12:24:12'),
(114, 'Bột Phô Mai Lắc (Cheese Powder)', 'bot-pho-mai', 'Bột phô mai màu cam đậm, vị mặn ngọt béo ngậy. Chuyên dùng để rắc lên khoai tây lách (khoai tây lắc), khoai lang lắc hoặc làm lớp foam phô mai cho trà sữa. Hương vị phô mai Cheddar đậm đà kích thích vị giác.', 'Rắc khoai tây lắc, làm sốt phô mai.', 60000.00, 0.00, 'NL114', 150, 2, 'assets/images/bot_pho_mai_1.png', 0, 'active', 'Bột phô mai, đường, muối, gia vị.', 'Rắc trực tiếp lên đồ ăn nóng.', '2026-01-28 12:24:12'),
(115, 'Bột Rau Câu Giòn (Agar Agar)', 'bot-rau-cau', 'Bột rau câu Agar nguyên chất, tạo độ giòn sần sật. Thích hợp làm thạch rau câu truyền thống, thạch sơn thủy, hoặc topping trà sữa dạng giòn. Độ đông kết cao, chỉ cần lượng nhỏ bột là đông được nhiều nước.', 'Làm thạch giòn sần sật, độ đông cao.', 40000.00, 0.00, 'NL115', 200, 2, 'assets/images/bot_rau_cau_1.png', 0, 'active', '100% chiết xuất rong câu chỉ vàng.', 'Ngâm nước 30 phút trước khi nấu.', '2026-01-28 12:24:12'),
(116, 'Bột Rau Câu Con Cá Thái (Jelly)', 'bot-rau-cau-ca-thai', 'Thương hiệu rau câu nổi tiếng của Thái Lan. Tạo ra loại thạch vừa giòn vừa dẻo, ít bị tách nước (chảy nước) sau khi đông. Rất được ưa chuộng để làm thạch trái cây, thạch phô mai viên.', 'Thạch vừa giòn vừa dẻo, ít tách nước, hàng Thái.', 45000.00, 0.00, 'NL116', 180, 2, 'assets/images/bot_rau_cau_ca_thai_1.png', 0, 'active', 'Bột rau câu, bột konjac.', 'Nấu sôi tan hết bột là được.', '2026-01-28 12:24:12'),
(117, 'Bột Rau Câu Con Cá Dẻo', 'bot-rau-cau-con-ca', 'Chuyên dùng để làm thạch dẻo, thạch dừa (rau câu dừa). Thành phẩm trong suốt, núng nính, có độ dai nhẹ rất ngon miệng. Có thể dùng làm lớp bao bên ngoài cho thạch phô mai, thạch củ năng.', 'Làm thạch dẻo, thạch dừa trong suốt.', 35000.00, 0.00, 'NL117', 250, 2, 'assets/images/bot_rau_cau_con_ca_1.png', 1, 'active', 'Carrageenan, bột konjac.', 'Trộn đều với đường trước khi cho vào nước sôi.', '2026-01-28 12:24:12'),
(118, 'Bột Sữa Béo Indo (Vana Blanca)', 'bot-sua-beo-kievit', 'Một dòng bột sữa khác từ Indonesia (Vana Blanca), cạnh tranh trực tiếp với Kievit. Vị sữa thanh hơn, ít ngậy hơn, giúp làm nổi bật vị trà. Phù hợp cho các dòng trà sữa Nhài (Jasmine Milk Tea) hoặc Oolong sữa.', 'Vị thanh, tôn vị trà nhài/oolong.', 80000.00, 0.00, 'NL118', 100, 2, 'assets/images/bot_sua_beo_kievit_1.png', 0, 'active', 'Chất béo thực vật, đường.', 'Hòa tan trong nước nóng.', '2026-01-28 12:24:12'),
(119, 'Bột Làm Pudding Khoai Môn', 'bot-sua-khoai-mon-pudding', 'Bột Pudding hương khoai môn tím lịm tìm sim. Dùng làm topping trà sữa cực \"cuốn\". Pudding mềm mượt, thơm nức mũi, ăn vào tan ngay trong miệng. Màu tím pastel lên hình cực đẹp.', 'Làm topping pudding khoai môn tím lịm.', 130000.00, 0.00, 'NL119', 50, 2, 'assets/images/bot_sua_khoai_mon_1.png', 0, 'active', 'Bột sữa, bột khoai môn, chất làm đông.', 'Nấu sôi với nước và đường.', '2026-01-28 12:24:12'),
(120, 'Bột Sương Sáo Đen (Grass Jelly)', 'bot-suong-sao', 'Bột làm thạch sương sáo (thạch đen) giải nhiệt mùa hè. Mùi thảo mộc đặc trưng, thạch dai giòn, đen bóng. Ăn cùng nước cốt dừa, hạt é hoặc làm topping trà sữa đều tuyệt vời. Sản phẩm đóng gói tiện lợi, dễ nấu tại nhà.', 'Thạch đen giải nhiệt, dai giòn, thơm thảo mộc.', 55000.00, 0.00, 'NL120', 120, 2, 'assets/images/bot_suong_sao_1.png', 1, 'active', 'Lá sương sáo cô đặc, bột năng.', 'Khuấy đều tay khi nấu để tránh vón cục.', '2026-01-28 12:24:12'),
(121, 'Đào Hồng Ngâm Nước Đường (Thái Miếng)', 'dao-hong-thai-mieng', 'Những miếng đào hồng tươi ngon, giòn sần sật được ngâm trong nước đường đậm đặc. Đào có màu hồng cam tự nhiên, vị ngọt thanh, không bị bở. Đây là topping \"quốc dân\" cho món Trà Đào Cam Sả huyền thoại.', 'Đào miếng giòn sần sật, chuyên làm trà đào.', 65000.00, 0.00, 'NL121', 150, 2, 'assets/images/dao_hong_thai_mieng_1.png', 1, 'active', 'Đào tươi 57%, nước, đường, acid citric.', 'Ăn trực tiếp hoặc trang trí trà đào.', '2026-01-28 12:25:24'),
(122, 'Đào Ngâm Nước Đường (Đào Vàng)', 'dao-ngam', 'Đào vàng (Yellow Peach) bổ đôi, thịt dày, màu vàng óng ả cực kỳ đẹp mắt. Vị đào ngọt đậm, hương thơm nồng nàn hơn đào hồng. Thích hợp để làm Bingsu, trang trí bánh kem hoặc pha trà đào phong cách cổ điển.', 'Đào vàng bổ đôi, thịt dày, ngọt đậm.', 70000.00, 0.00, 'NL122', 120, 2, 'assets/images/dao_ngam_1.png', 0, 'active', 'Đào vàng, nước đường ngô.', 'Cắt lát trang trí đồ uống/bánh ngọt.', '2026-01-28 12:25:24'),
(123, 'Kem Béo Thực Vật (Topping Cream)', 'kem-beo-thuc-vat', 'Dòng kem chuyên dụng để đánh bông (Whipping) làm lớp foam sữa, trang trí bánh kem hoặc pha cà phê cốt dừa. Độ nở cao gâp 4 lần, vị vani thơm béo, đứng kem lâu và không bị chảy nước ở nhiệt độ phòng.', 'Độ nở cao, vị vani, làm foam hoặc trang trí bánh.', 85000.00, 0.00, 'NL123', 80, 2, 'assets/images/kem_beo_thuc_vat_1.png', 0, 'active', 'Nước, dầu hạt cọ hydro hóa, đường.', 'Đánh bông bằng máy ở tốc độ trung bình.', '2026-01-28 12:25:24'),
(124, 'Siro Bạc Hà (Mint Syrup)', 'siro-bac-ha', 'Màu xanh ngọc bích tuyệt đẹp cùng cảm giác mát lạnh tê đầu lưỡi. Siro Bạc Hà là nguyên liệu chính cho các món Soda Blue Ocean, Mojito hoặc Trà sữa Bạc Hà. Vị ngọt sâu, hương menthol sảng khoái đánh bay cái nóng mùa hè.', 'Màu xanh ngọc, mát lạnh, pha Soda/Mojito.', 95000.00, 0.00, 'NL124', 60, 2, 'assets/images/siro_bac_ha_1.png', 0, 'active', 'Đường mía, tinh chất bạc hà, màu thực phẩm.', 'Tỷ lệ 1:7 (1 phần siro : 7 phần nước).', '2026-01-28 12:25:24'),
(125, 'Siro Cam (Orange Syrup)', 'siro-cam', 'Hương vị cam tươi mọng nước được cô đặc trong chai siro. Vị chua ngọt cân bằng, màu cam tươi sáng. Dùng để pha trà cam quế, soda cam hoặc rưới lên đá bào đều rất ngon. Bổ sung hương vị trái cây tự nhiên cho menu quán.', 'Vị cam tươi, chua ngọt cân bằng.', 80000.00, 0.00, 'NL125', 50, 2, 'assets/images/siro_cam_1.png', 0, 'active', 'Nước cốt cam cô đặc, đường.', 'Pha chế đồ uống đá xay, trà trái cây.', '2026-01-28 12:25:24'),
(126, 'Siro Chanh Dây (Passion Fruit)', 'siro-chanh-day', 'Vị chua thanh đặc trưng và hương thơm quyến rũ của chanh dây (mắc mát). Sản phẩm có màu vàng tươi, giúp kích thích vị giác mạnh mẽ. Là \"best seller\" trong các dòng siro trái cây nhờ tính ứng dụng cao: từ trà chanh dây, soda đến sữa chua đánh đá.', 'Chua thanh, thơm nồng, làm trà chanh dây cực đỉnh.', 85000.00, 0.00, 'NL126', 100, 2, 'assets/images/siro_chanh_day_1.png', 1, 'active', 'Cốt chanh dây, đường.', 'Lắc đều trước khi sử dụng.', '2026-01-28 12:25:24'),
(127, 'Siro Dâu Tây (Strawberry Syrup)', 'siro-dau', 'Màu đỏ quyến rũ và hương thơm ngọt ngào của dâu tây Đà Lạt. Siro có độ sánh tốt, vị ngọt đậm đà. Chuyên dùng cho món Trà sữa dâu, Sữa tươi lắc dâu hoặc làm lớp sốt chảy trên thành ly (wall cup) đẹp mắt.', 'Màu đỏ đẹp, ngọt ngào, pha trà sữa dâu.', 80000.00, 0.00, 'NL127', 90, 2, 'assets/images/siro_dau_1.png', 1, 'active', 'Nước ép dâu tây, đường fructose.', 'Dùng 20ml cho ly 500ml.', '2026-01-28 12:25:24'),
(128, 'Siro Dừa (Coconut Syrup)', 'siro-dua', 'Hương vị béo ngậy, thơm lừng của cốt dừa tươi. Không cần lích kích nạo dừa, chỉ cần một chút siro là có ngay ly cà phê cốt dừa hay cacao dừa thơm ngon. Vị ngọt dịu, không gắt, hòa quyện tốt với sữa và cà phê.', 'Thơm béo mùi dừa, pha cà phê cốt dừa.', 90000.00, 0.00, 'NL128', 40, 2, 'assets/images/siro_dua_1.png', 0, 'active', 'Hương dừa tự nhiên, đường.', 'Pha chế cà phê, cacao, đá xay.', '2026-01-28 12:25:24'),
(129, 'Siro Dưa Lưới (Melon Syrup)', 'siro-dua-luoi', 'Mang hương thơm ngọt mát, thanh khiết của dưa lưới xanh. Màu xanh lá nhẹ nhàng rất \"chill\". Thường được dùng để pha Trà sữa dưa lưới (Melon Milk Tea) hoặc Soda dưa lưới. Hương vị lạ miệng, dễ gây nghiện.', 'Hương dưa lưới thanh mát, màu xanh lá.', 95000.00, 0.00, 'NL129', 30, 2, 'assets/images/siro_dua_luoi_1.png', 0, 'active', 'Chiết xuất dưa lưới, đường.', 'Pha với trà nhài hoặc soda.', '2026-01-28 12:25:24'),
(130, 'Siro Đường Đen (Brown Sugar)', 'siro-duong-den', 'Linh hồn của món \"Sữa tươi trân châu đường đen\". Siro đường đen có độ đậm đặc cao, màu nâu cánh gián, hương thơm caramel cháy cạnh đặc trưng. Khi rót vào ly tạo hiệu ứng đường chảy (tiger stripe) cực đẹp và bám thành ly tốt.', 'Đậm đặc, tạo vân hổ đẹp, chuyên pha sữa tươi đường đen.', 110000.00, 95000.00, 'NL130', 200, 2, 'assets/images/siro_duong_den_1.png', 1, 'active', 'Đường mía nâu cô đặc, hương caramel.', 'Rót quanh thành ly trước khi cho sữa.', '2026-01-28 12:25:24'),
(131, 'Siro Kiwi (Kiwi Syrup)', 'siro-kiwi', 'Vị chua dịu và màu xanh bắt mắt của trái Kiwi nhiệt đới. Siro Kiwi rất hợp khi mix cùng trà xanh hoặc sữa chua. Tạo nên ly đồ uống vừa ngon miệng vừa giàu vitamin, giải nhiệt cực tốt.', 'Vị chua dịu, màu xanh, pha trà trái cây.', 90000.00, 0.00, 'NL131', 50, 2, 'assets/images/siro_kiwi_1.png', 0, 'active', 'Nước ép kiwi, đường.', 'Pha Soda Kiwi hoặc sinh tố.', '2026-01-28 12:25:24'),
(132, 'Siro Măng Cụt (Mangosteen)', 'siro-mang-cut', 'Hương vị \"Nữ hoàng trái cây\" độc đáo. Vị chua ngọt thanh tao, màu tím hồng lạ mắt. Đây là hương vị \"hot trend\" mới nổi, dùng để pha món Trà Măng Cụt đang làm mưa làm gió trên thị trường.', 'Hot trend trà măng cụt, vị chua ngọt thanh tao.', 120000.00, 0.00, 'NL132', 40, 2, 'assets/images/siro_mang_cut_1.png', 1, 'active', 'Cốt măng cụt, đường phèn.', 'Pha với trà xanh nhài.', '2026-01-28 12:25:24'),
(133, 'Siro Nho Đen (Grape Syrup)', 'siro-nho', 'Mùi thơm nồng nàn như kẹo nho, màu tím đậm quyến rũ. Siro nho rất được trẻ em yêu thích. Dùng để pha trà sữa nho, soda nho hoặc làm thạch rau câu vị nho.', 'Thơm mùi kẹo nho, màu tím đậm.', 80000.00, 0.00, 'NL133', 60, 2, 'assets/images/siro_nho_1.png', 0, 'active', 'Hương nho tổng hợp, màu thực phẩm.', 'Pha chế đồ uống giải khát.', '2026-01-28 12:25:24'),
(134, 'Siro Ổi Hồng (Pink Guava)', 'siro-oi', 'Hương thơm ngào ngạt của ổi xá lị chín. Màu hồng san hô tuyệt đẹp (Pink Guava). Vị chát nhẹ vỏ ổi và ngọt lịm ruột ổi được tái hiện hoàn hảo. Món Trà Ổi Hồng là best seller tại nhiều chuỗi cửa hàng lớn.', 'Thơm lừng ổi chín, màu hồng san hô, pha trà ổi.', 95000.00, 0.00, 'NL134', 80, 2, 'assets/images/siro_oi_1.png', 1, 'active', 'Mứt ổi hồng, đường, hương liệu.', 'Pha với trà Oolong hoặc trà nhài.', '2026-01-28 12:25:24'),
(135, 'Siro Đào (Peach Syrup)', 'si_ro_dao', 'Nguyên liệu nền tảng cho ly trà đào đậm vị. Nếu chỉ dùng đào ngâm thì nước sẽ nhạt, thêm 20ml siro đào này sẽ giúp ly trà dậy mùi thơm nức mũi và có màu vàng cam đẹp mắt hơn hẳn.', 'Dậy mùi trà đào, màu vàng cam đẹp.', 80000.00, 0.00, 'NL135', 150, 2, 'assets/images/si_ro_dao_1.png', 1, 'active', 'Cốt đào cô đặc, đường.', 'Kết hợp với đào ngâm để pha trà đào.', '2026-01-28 12:25:24'),
(136, 'Tép Bưởi Hồng (Pomelo Pulp)', 'tep-buoi-hong', 'Topping cao cấp dạng tép (pulp) tự nhiên. Tép bưởi hồng mọng nước, khi cắn vào nổ tanh tách trong miệng rất thú vị. Vị chua nhẹ, không bị đắng. Chuyên dùng cho món Trà Bưởi Mật Ong hoặc Trà Dương Chi Cam Lộ.', 'Tép bưởi mọng nước, không đắng, topping cao cấp.', 130000.00, 0.00, 'NL136', 40, 2, 'assets/images/tep_buoi_hong_1.png', 0, 'active', 'Tép bưởi tươi 80%, đường.', 'Múc trực tiếp vào ly trà.', '2026-01-28 12:25:24'),
(137, 'Thạch Cá 4 Màu (Jelly Fish)', 'thach-ca-4-mau-douxian', 'Những chú cá thạch nhỏ xinh với 4 màu sắc rực rỡ. Thạch dai dai, dẻo dẻo, nhai vui miệng. Là topping yêu thích của học sinh, sinh viên. Giúp ly trà sữa thêm phần sinh động và bắt mắt.', 'Hình cá dễ thương, 4 màu rực rỡ, dai dẻo.', 45000.00, 0.00, 'NL137', 100, 2, 'assets/images/thach_ca_4_mau_douxian_1.png', 0, 'active', 'Bột rau câu, đường, màu thực phẩm.', 'Dùng trực tiếp (đã ngâm nước đường).', '2026-01-28 12:25:24'),
(138, 'Thạch Dừa Thô (Nata De Coco)', 'thach-dua-coco', 'Thạch dừa Bến Tre lên men tự nhiên. Cắt vuông hạt lựu, màu trắng trong, vị ngọt thanh, giòn sần sật. Đây là topping truyền thống nhưng chưa bao giờ hết hot, hợp với mọi loại trà sữa và trà trái cây.', 'Thạch dừa Bến Tre, giòn sần sật, ngọt thanh.', 40000.00, 0.00, 'NL138', 200, 2, 'assets/images/thach_dua_coco_1.png', 1, 'active', 'Nước dừa già lên men.', 'Múc ăn liền (bỏ nước ngâm nếu muốn giảm ngọt).', '2026-01-28 12:25:24'),
(139, 'Thạch Rau Câu Vị Kiwi', 'thach-huong-kiwi', 'Thạch rau câu có sẵn vị Kiwi chua ngọt, cắt hạt lựu tiện lợi. Màu xanh lá trong suốt đẹp mắt. Khi nhai cảm nhận được độ giòn và hương thơm kiwi lan tỏa. Tiết kiệm thời gian nấu thạch cho chủ quán.', 'Thạch làm sẵn vị kiwi, màu xanh, giòn ngon.', 50000.00, 0.00, 'NL139', 60, 2, 'assets/images/thach_huong_kiwi_1.png', 0, 'active', 'Rau câu, hương kiwi, đường.', 'Dùng làm topping trà sữa, trà trái cây.', '2026-01-28 12:25:24'),
(140, 'Thạch Rau Câu Thủy Tinh (Cắt Sẵn)', 'thach-rau-cau-cat', 'Thạch rau câu truyền thống nhưng được cắt máy đều tăm tắp. Màu trắng trong suốt như thủy tinh, vị ngọt nhẹ, giòn dai cân bằng. Dễ dàng nhuộm màu bằng siro để tạo ra nhiều phiên bản thạch sắc màu.', 'Trong suốt như thủy tinh, cắt sẵn tiện lợi.', 35000.00, 0.00, 'NL140', 120, 2, 'assets/images/thach_rau_cau_cat_1.png', 0, 'active', 'Bột rau câu dẻo, đường.', 'Có thể ngâm siro để tạo màu.', '2026-01-28 12:25:24'),
(141, 'Thạch Trân Châu Trắng Đen (Konjac)', 'thach-tran-chau-trang-den', 'Một sự đánh lừa thị giác thú vị! Nhìn giống hệt trân châu đen truyền thống nhưng thực chất là thạch Konjac giòn dai sần sật. Ưu điểm là không bị cứng khi bỏ tủ lạnh, ăn rất vui miệng. Sự kết hợp 2 màu trắng đen tạo điểm nhấn bắt mắt cho ly trà sữa.', 'Nhìn giống trân châu nhưng giòn sần sật, không bị cứng.', 50000.00, 0.00, 'NL141', 80, 2, 'assets/images/thach_tran_chau_trang_den_1.png', 0, 'active', 'Bột konjac, đường, màu thực phẩm.', 'Múc trực tiếp vào ly (ăn liền).', '2026-01-28 12:26:02'),
(142, 'Thạch Jelly Vị Cà Phê', 'thach-vi-ca-phe', 'Những viên thạch nâu bóng loáng mang hương thơm nồng nàn của cà phê rang xay. Vị đắng nhẹ quyện với vị ngọt của thạch, là \"cặp bài trùng\" không thể thiếu cho món Trà sữa Cà phê hoặc Cacao dầm.', 'Thơm lừng cà phê, vị đắng nhẹ.', 45000.00, 0.00, 'NL142', 60, 2, 'assets/images/thach_vi_ca_phe_1.png', 0, 'active', 'Rau câu, tinh chất cà phê.', 'Dùng làm topping trà sữa.', '2026-01-28 12:26:02'),
(143, 'Thạch Jelly Vị Đào (Peach Jelly)', 'thach-vi-dao', 'Thạch rau câu vị đào thơm ngát, màu hồng cam nhẹ nhàng. Vị chua ngọt hài hòa, khi nhai cảm giác như đang ăn miếng đào tươi. Cực hợp để mix cùng Trà đào cam sả hoặc Trà sữa đào.', 'Hương đào thơm ngát, chua ngọt hài hòa.', 45000.00, 0.00, 'NL143', 90, 2, 'assets/images/thach_vi_dao_1.png', 1, 'active', 'Rau câu, hương đào.', 'Ăn liền.', '2026-01-28 12:26:02'),
(144, 'Thạch Jelly Vị Dâu Tây', 'thach-vi-dau', 'Viên thạch đỏ mọng như ngọc ruby, mang hương thơm ngọt ngào của dâu tây. Rất được lòng các bạn nhỏ và phái nữ. Làm topping cho Trà sữa dâu hay Sữa chua đánh đá đều tuyệt vời.', 'Màu đỏ ruby, hương dâu ngọt ngào.', 45000.00, 0.00, 'NL144', 70, 2, 'assets/images/thach_vi_dau_1.png', 0, 'active', 'Rau câu, cốt dâu tây.', 'Topping trà sữa, sữa chua.', '2026-01-28 12:26:02'),
(145, 'Thạch Jelly Vị Nho', 'thach-vi-nho', 'Thạch nho màu tím biếc, vị chua dịu đặc trưng. Kết cấu dai giòn, bóng bẩy. Thường được dùng trong các món trà trái cây hiện đại hoặc soda nho.', 'Màu tím biếc, vị nho chua dịu.', 45000.00, 0.00, 'NL145', 50, 2, 'assets/images/thach_vi_nho_1.png', 0, 'active', 'Rau câu, hương nho đen.', 'Dùng trực tiếp.', '2026-01-28 12:26:02'),
(146, 'Thạch Jelly Vị Socola', 'thach-vi-socola', 'Dành cho tín đồ hảo ngọt. Thạch socola đậm đà, mềm dẻo. Ăn cùng với trà sữa truyền thống hoặc Milo dầm là \"hết nước chấm\".', 'Vị socola đậm đà, mềm dẻo.', 45000.00, 0.00, 'NL146', 80, 2, 'assets/images/thach_vi_socola_1.png', 0, 'active', 'Rau câu, bột cacao.', 'Topping trà sữa.', '2026-01-28 12:26:02'),
(147, 'Thạch Jelly Vị Táo Xanh (Green Apple)', 'thach-vi-tao', 'Màu xanh lá tươi mát mắt, hương táo xanh chua thanh kích thích vị giác. Loại thạch này giúp cân bằng độ béo của trà sữa, tạo cảm giác đỡ ngán khi uống.', 'Màu xanh tươi mát, vị táo chua thanh.', 45000.00, 0.00, 'NL147', 40, 2, 'assets/images/thach_vi_tao_1.png', 0, 'active', 'Rau câu, hương táo xanh.', 'Topping trà trái cây.', '2026-01-28 12:26:02'),
(148, 'Thạch Jelly Vị Trà Xanh (Matcha)', 'thach-vi-tra-xanh', 'Thơm mùi lá trà xanh, vị chát nhẹ tinh tế. Thạch Matcha là sự lựa chọn healthy, ít ngọt, phù hợp với các dòng trà sữa Nhật Bản hoặc Latte.', 'Thơm mùi trà, chát nhẹ tinh tế.', 48000.00, 0.00, 'NL148', 50, 2, 'assets/images/thach_vi_tra_xanh_1.png', 0, 'active', 'Rau câu, bột matcha Đài Loan.', 'Ăn liền.', '2026-01-28 12:26:02'),
(149, 'Thạch Jelly Vị Việt Quất (Blueberry)', 'thach-vi-viet-quat', 'Màu xanh tím than sang trọng, vị chua ngọt đậm đà của quả việt quất. Đây là loại topping cao cấp thường thấy ở các chuỗi trà sữa lớn.', 'Màu xanh tím sang trọng, vị chua ngọt.', 48000.00, 0.00, 'NL149', 45, 2, 'assets/images/thach_vi_viet_quat_1.png', 0, 'active', 'Rau câu, hương việt quất.', 'Dùng trực tiếp.', '2026-01-28 12:26:02'),
(150, 'Trân Châu Đen Andes (Hàng Đài Loan)', 'tran-chau-andes-dailoan', 'Thương hiệu trân châu số 1 Đài Loan. Hạt trân châu Andes khi nấu lên có độ bóng đẹp, dẻo dai vừa phải, để lâu không bị cứng. Hương vị caramel thơm lừng, thấm đẫm vào từng hạt trân châu.', 'Hàng chuẩn Đài Loan, dẻo dai, thơm caramel.', 65000.00, 0.00, 'NL150', 200, 2, 'assets/images/tran_chau_andes_dailoan_1.png', 1, 'active', 'Tinh bột sắn, nước, màu caramel.', 'Nấu 30 phút, ủ 30 phút.', '2026-01-28 12:26:02'),
(151, 'Trân Châu Hoàng Kim Boduo', 'tran-chau-boduo-caramel', 'Trân châu màu vàng kim óng ánh (Golden Pearl). Khác với trân châu đen, loại này có vị ngọt thanh của mật ong và đường nâu. Dai dai, dẻo dẻo, nhìn rất sang chảnh trong ly trà sữa.', 'Màu vàng kim, vị mật ong đường nâu.', 70000.00, 0.00, 'NL151', 150, 2, 'assets/images/tran_chau_boduo_caramel_1.png', 1, 'active', 'Tinh bột sắn, đường nâu.', 'Nấu kỹ trước khi dùng.', '2026-01-28 12:26:02'),
(152, 'Trân Châu Đen Douxian', 'tran-chau-douxian', 'Dòng trân châu giá rẻ chất lượng ổn định. Hạt nhỏ (mini), dễ hút, độ dai tốt. Phù hợp cho các quán bình dân hoặc mô hình kinh doanh trà sữa khổng lồ.', 'Hạt nhỏ dễ hút, giá rẻ, độ dai tốt.', 40000.00, 0.00, 'NL152', 300, 2, 'assets/images/tran_chau_douxian_1.png', 0, 'active', 'Bột năng, hương liệu.', 'Nấu sôi 20 phút.', '2026-01-28 12:26:02'),
(153, 'Trân Châu 3Q Trắng (Ngọc Trai) Wings', 'tran-trau-3q-wingszion', 'Nữ hoàng topping - Trân châu 3Q (Konjac Pearl). Hạt trong suốt như ngọc trai, ăn giòn sần sật, không cần nấu (ăn liền). Vị ngọt nhẹ, thanh mát, là topping không thể thiếu của món Trà sữa trân châu trắng.', 'Ăn liền không cần nấu, giòn sần sật, hạt trong suốt.', 150000.00, 135000.00, 'NL153', 100, 2, 'assets/images/tran_trau_3q_wingszion_1.png', 1, 'active', 'Nước, đường, bột konjac, carrageenan.', 'Múc trực tiếp vào ly.', '2026-01-28 12:26:02'),
(154, 'Trân Châu Sợi (Sợi Vàng)', 'tran-trau-soi', 'Thay đổi phong cách với trân châu dạng sợi dài lạ mắt. Sợi trân châu vàng óng, mềm mượt như mì, hút lên miệng tạo cảm giác thú vị. Vị caramel đậm đà không thua kém trân châu hạt.', 'Dạng sợi lạ mắt, mềm mượt, vị caramel.', 55000.00, 0.00, 'NL154', 60, 2, 'assets/images/tran_trau_soi_1.png', 0, 'active', 'Bột sắn, màu caramel.', 'Nấu như trân châu hạt.', '2026-01-28 12:26:02'),
(155, 'Trân Châu Đen Wonderfull', 'tran-trau-wonderfull', 'Hạt trân châu size lớn (Big size), chuyên dùng cho món Sữa tươi trân châu đường đen. Hạt to, dai, nhai rất \"đã\". Khả năng thấm đường đen cực tốt, tạo độ dẻo quánh đặc trưng.', 'Size lớn, chuyên làm sữa tươi trân châu đường đen.', 50000.00, 0.00, 'NL155', 120, 2, 'assets/images/tran_trau_wonderfull_1.png', 0, 'active', 'Tinh bột sắn cao cấp.', 'Nấu kỹ để hạt chín đều.', '2026-01-28 12:26:02'),
(156, 'Vải Thiều Ngâm Nước Đường (Lon)', 'vai-thieu-ngam', 'Những trái vải thiều trắng nõn, dày cùi, bỏ hạt, ngâm trong nước đường thanh mát. Vải giữ được độ giòn và hương thơm đặc trưng. Nguyên liệu chính cho món Trà Vải (Lychee Tea) giải nhiệt mùa hè.', 'Trái vải trắng nõn, dày cùi, làm trà vải.', 65000.00, 0.00, 'NL156', 200, 2, 'assets/images/vai_thieu_ngam_1.png', 1, 'active', 'Vải thiều 56%, nước, đường.', 'Dùng cả cái và nước ngâm.', '2026-01-28 12:26:02'),
(157, 'Xí Muội Đỏ (Salted Plum)', 'xi-muoi-do', 'Xí muội (ô mai) mặn ngọt, màu đỏ tươi. Dùng để pha chế món Trà Lipton xí muội hoặc Tắc xí muội huyền thoại. Vị mặn của xí muội giúp cân bằng vị ngọt của đường, tạo nên thức uống bù khoáng cực tốt.', 'Vị mặn ngọt, pha Lipton xí muội/Tắc xí muội.', 80000.00, 0.00, 'NL157', 50, 2, 'assets/images/xi_muoi_do_1.png', 0, 'active', 'Quả mơ, muối, đường.', 'Dầm nát trong ly nước.', '2026-01-28 12:26:02'),
(158, 'Bột Khoai Môn Tím (Premium)', 'bot-khoai-mon-tim-premium', 'Dòng bột khoai môn cao cấp với hàm lượng khoai môn thật lên đến 60%. Màu tím đậm đà hơn, vị béo ngậy và thơm mùi khoai môn nướng đặc trưng. Chuyên dùng cho các món Taro Milk Tea thượng hạng.', 'Hàm lượng khoai thật cao, màu tím đậm.', 160000.00, 0.00, 'NL158', 50, 2, 'assets/images/bot-sua_khoai_mon_2.png', 0, 'active', 'Bột khoai môn nguyên chất, bột sữa.', 'Pha chế trà sữa khoai môn.', '2026-01-28 12:26:36'),
(159, 'Cacao Đắng Nguyên Chất (Dark)', 'cacao-dang-nguyen-chat', 'Dành cho những ai yêu thích vị đắng của Chocolate đen. Sản phẩm không chứa đường, độ đắng 70%, cực kỳ đậm vị. Thích hợp để làm cốt bánh Brownie hoặc pha cacao nóng đậm đà.', 'Vị đắng 70%, không đường, đậm đà.', 105000.00, 0.00, 'NL159', 60, 2, 'assets/images/bot_cacao_1.png', 0, 'active', '100% bột cacao tách béo.', 'Pha chế hoặc làm bánh.', '2026-01-28 12:26:36'),
(160, 'Bột Chống Tách Lớp (Mix Powder)', 'bot-chong-tach-lop', 'Giải pháp kinh tế cho các quán cà phê take-away. Bột Mix giúp đá xay lâu tan hơn, hỗn hợp sánh dẻo hơn mà không làm thay đổi hương vị gốc của đồ uống. Hàng nội địa chất lượng cao.', 'Giúp đá xay lâu tan, hỗn hợp sánh dẻo.', 95000.00, 0.00, 'NL160', 100, 2, 'assets/images/bot_frappe_dans_1.png', 0, 'active', 'Chất ổn định, Maltodextrin.', '10g cho 1 ly đá xay.', '2026-01-28 12:26:36'),
(161, 'Bột Sữa Béo Kievit (Bao Bì Mới)', 'bot-sua-beo-kievit-new', 'Phiên bản bao bì mới của bột sữa Kievit Hà Lan huyền thoại. Chất lượng vẫn giữ nguyên độ béo 35%, giúp ly trà sữa tròn vị, tôn lên hương trà và hậu vị béo ngậy khó quên.', 'Độ béo 35%, bao bì mới, hàng nhập khẩu.', 85000.00, 0.00, 'NL161', 200, 2, 'assets/images/bot_kem_beo_halan_1.png', 1, 'active', 'Tinh bột sắn, dầu thực vật.', 'Pha trà sữa truyền thống.', '2026-01-28 12:26:36'),
(162, 'Pudding Trứng Phô Mai', 'pudding-trung-pho-mai', 'Sự kết hợp giữa vị trứng béo ngậy và chút mặn nhẹ của phô mai. Bột Pudding này tạo ra thành phẩm núng nính, mềm tan, vị lạ miệng hơn so với pudding trứng truyền thống.', 'Vị trứng mix phô mai, mềm tan.', 125000.00, 0.00, 'NL162', 40, 2, 'assets/images/bot_kem_chung_1.png', 0, 'active', 'Bột trứng, bột phô mai, gelatin.', 'Nấu sôi với nước và đường.', '2026-01-28 12:26:36'),
(163, 'Matcha Uji Nhật Bản (Vụ Xuân)', 'matcha-uji-nhat-ban', 'Bột trà xanh Matcha thu hoạch vào vụ Xuân cho màu xanh ngọc bích rực rỡ nhất và vị chát dịu nhất. Dòng Matcha cao cấp này thích hợp để làm Latte Art hoặc pha chế các món Matcha lạnh.', 'Thu hoạch vụ Xuân, màu xanh ngọc bích.', 180000.00, 0.00, 'NL163', 30, 2, 'assets/images/bot_matcha_1.png', 1, 'active', '100% Matcha Nhật Bản.', 'Rây mịn trước khi dùng.', '2026-01-28 12:26:36'),
(164, 'Macchiato Cheese Foam (Mặn)', 'macchiato-cheese-foam', 'Bột váng sữa vị phô mai mặn đậm đà. Lớp foam đánh lên bông xốp, đứng form lâu, vị mặn rõ rệt giúp cân bằng độ ngọt của trà sữa. Là lớp phủ hoàn hảo cho Hồng trà kem mặn.', 'Vị phô mai mặn đậm đà, đứng form lâu.', 115000.00, 0.00, 'NL164', 80, 2, 'assets/images/bot_milkFoam_vang_sua_2.png', 1, 'active', 'Bột kem, muối biển, phô mai.', 'Đánh bông với nước lạnh.', '2026-01-28 12:26:36');
INSERT INTO `products` (`id`, `name`, `slug`, `description`, `short_description`, `price`, `sale_price`, `sku`, `stock_quantity`, `category_id`, `image_url`, `is_bestseller`, `status`, `ingredients`, `usage_instructions`, `created_at`) VALUES
(165, 'Phô Mai Lắc Vị Cay (Spicy Cheese)', 'pho-mai-lac-vi-cay', 'Biến tấu thú vị với chút bột ớt cay nhẹ trong bột phô mai. Sản phẩm chuyên dùng cho gà rán lắc phô mai hoặc khoai tây lắc, tạo cảm giác kích thích vị giác cực mạnh.', 'Vị phô mai cay nhẹ, rắc gà rán/khoai tây.', 65000.00, 0.00, 'NL165', 100, 2, 'assets/images/bot_pho_mai_1.png', 0, 'active', 'Bột phô mai, bột ớt, gia vị.', 'Rắc trực tiếp lên đồ ăn.', '2026-01-28 12:26:36'),
(166, 'Agar Agar Giòn (Con Vịt)', 'agar-agar-gion', 'Thương hiệu rau câu Con Vịt nổi tiếng. Chuyên làm thạch giòn, thạch dừa. Độ đông kết cực nhanh và cứng cáp, thích hợp làm các loại thạch cắt hạt lựu topping.', 'Thương hiệu Con Vịt, thạch giòn cứng.', 40000.00, 0.00, 'NL166', 150, 2, 'assets/images/bot_rau_cau_1.png', 0, 'active', 'Bột rau câu nguyên chất.', 'Ngâm 30p trước khi nấu.', '2026-01-28 12:26:36'),
(167, 'Đào Ngâm Rhodes (Nam Phi)', 'dao-ngam-rhodes', 'Đào ngâm nhập khẩu từ Nam Phi. Trái đào to, thịt dày, độ giòn cao và nước ngâm rất thơm. Lon lớn 825g tiết kiệm, phù hợp cho các quán kinh doanh trà đào chuyên nghiệp.', 'Nhập khẩu Nam Phi, trái to, giòn sần sật.', 75000.00, 0.00, 'NL167', 120, 2, 'assets/images/dao_ngam_1.png', 1, 'active', 'Đào vàng, nước đường.', 'Pha trà đào.', '2026-01-28 12:26:36'),
(168, 'Whipping Cream Thực Vật (Rich\'s)', 'whipping-cream-thuc-vat', 'Kem làm bánh và pha chế đa năng. Có sẵn đường, vị ngọt nhẹ, hương vani. Đánh bông nhanh gấp 3 lần kem động vật. Dùng làm kem trang trí bánh hoặc dollop bông kem trên ly đá xay.', 'Có đường sẵn, đánh bông nhanh, đa năng.', 80000.00, 0.00, 'NL168', 90, 2, 'assets/images/kem_beo_thuc_vat_1.png', 0, 'active', 'Nước, dầu thực vật, đường.', 'Bảo quản đông lạnh.', '2026-01-28 12:26:36'),
(169, 'Siro Bạc Hà Tuyết (Snow Mint)', 'siro-bac-ha-tuyet', 'Dòng siro bạc hà trắng (trong suốt), không màu. Vẫn giữ nguyên vị the mát cực mạnh nhưng không làm đổi màu đồ uống. Thích hợp để pha chế các loại cocktail layer hoặc soda trong suốt.', 'Màu trong suốt, vị the mát mạnh.', 95000.00, 0.00, 'NL169', 40, 2, 'assets/images/siro_bac_ha_1.png', 0, 'active', 'Tinh chất bạc hà trắng.', 'Pha chế cocktail/soda.', '2026-01-28 12:26:36'),
(170, 'Mứt Sinh Tố Chanh Dây (Jam)', 'mut-sinh-to-chanh-day', 'Khác với siro (dạng lỏng), đây là mứt sinh tố đậm đặc có chứa cả hạt chanh dây tươi. Khi pha chế tạo cảm giác như dùng trái cây tươi thật. Vị chua ngọt tự nhiên, thơm nồng nàn.', 'Dạng mứt sệt, có hạt chanh dây tươi.', 90000.00, 0.00, 'NL170', 60, 2, 'assets/images/siro_chanh_day_1.png', 1, 'active', 'Cốt chanh dây 60%, đường.', 'Làm sinh tố, soda.', '2026-01-28 12:26:36'),
(171, 'Sốt Đường Nâu Hàn Quốc (Syrup)', 'sot-duong-nau-han-quoc', 'Phiên bản sốt đường nâu đậm đặc hơn, độ bám thành ly (walling) cực tốt. Vị đường cháy (Smoky) rõ rệt, chuẩn phong cách The Alley. Không bị tan nhanh trong sữa tươi.', 'Sốt đậm đặc, bám ly tốt, vị đường cháy.', 120000.00, 0.00, 'NL171', 80, 2, 'assets/images/siro_duong_den_1.png', 0, 'active', 'Đường đen cô đặc.', 'Trang trí thành ly.', '2026-01-28 12:26:36'),
(172, 'Mứt Dâu Tây Boduo (Có Xác)', 'mut-dau-tay-boduo', 'Mứt dâu tây cao cấp của hãng Boduo. Chứa 80% xác dâu tây nghiền, cho màu đỏ tự nhiên và vị chua ngọt chân thật. Thích hợp làm món Sữa tươi lắc dâu hoặc đá xay dâu.', 'Có xác dâu thật, hãng Boduo cao cấp.', 95000.00, 0.00, 'NL172', 50, 2, 'assets/images/siro_dau_1.png', 0, 'active', 'Dâu tây nghiền, đường.', 'Pha chế đồ uống đá xay.', '2026-01-28 12:26:36'),
(173, 'Thạch Dừa Sợi (Coconut Slice)', 'thach-dua-soi', 'Thay vì cắt hạt lựu, thạch dừa này được thái dạng sợi dài như sợi mì. Ăn rất vui miệng, dai dai giòn giòn. Thường dùng trong món Chè Thái hoặc Trà sữa thạch dừa sợi.', 'Dạng sợi dài lạ miệng, dai giòn.', 42000.00, 0.00, 'NL173', 100, 2, 'assets/images/thach_dua_coco_1.png', 0, 'active', 'Thạch dừa lên men.', 'Ăn liền.', '2026-01-28 12:26:36'),
(174, 'Thạch Konjac Trân Châu (3Q)', 'thach-konjac-tran-chau', 'Tên gọi khác của thạch trân châu trắng. Được làm từ củ Konjac (khoai nưa) nên rất ít calo, phù hợp cho người ăn kiêng (Low carb) mà vẫn thèm topping trà sữa.', 'Ít calo, giòn dai, hỗ trợ giảm cân.', 52000.00, 0.00, 'NL174', 70, 2, 'assets/images/thach_tran_chau_trang_den_1.png', 0, 'active', 'Bột Konjac, chất tạo ngọt.', 'Topping giảm cân.', '2026-01-28 12:26:36'),
(175, 'Trân Châu Đen Đường Đen (Black Sugar)', 'tran-chau-den-duong-den', 'Trân châu được tẩm ướp hương đường đen ngay từ trong lõi. Khi nấu lên tỏa mùi thơm đường cháy nồng nàn, màu đen bóng bẩy. Kết hợp hoàn hảo với sữa tươi.', 'Hương đường đen thấm trong lõi, đen bóng.', 68000.00, 0.00, 'NL175', 180, 2, 'assets/images/tran_chau_andes_dailoan_1.png', 1, 'active', 'Bột sắn, hương đường đen.', 'Nấu kỹ và ủ đường đen.', '2026-01-28 12:26:36'),
(176, 'Thạch 3Q Ngọc Trai (Magic Pearl)', 'thach-3q-ngoc-trai', 'Loại thạch trân châu 3Q cao cấp với độ giòn vượt trội. Hạt trong veo lấp lánh như ngọc trai dưới đáy ly. Vị ngọt thanh nhẹ, không làm gắt cổ.', 'Độ giòn vượt trội, hạt trong veo lấp lánh.', 155000.00, 0.00, 'NL176', 60, 2, 'assets/images/tran_trau_3q_wingszion_1.png', 1, 'active', 'Konjac, đường, nước.', 'Ăn liền.', '2026-01-28 12:26:36'),
(177, 'Vải Thiều Lục Ngạn (Lon)', 'vai-thieu-luc-ngan', 'Tuyển chọn từ vùng vải Lục Ngạn nổi tiếng. Trái vải to đều, hạt nhỏ, cơm dày và trắng muốt. Nước ngâm vải ngọt thanh, thơm lừng mùi vải chín, dùng để pha trà rất ngon.', 'Đặc sản Lục Ngạn, trái to, cơm dày.', 70000.00, 0.00, 'NL177', 150, 2, 'assets/images/vai_thieu_ngam_1.png', 0, 'active', 'Vải thiều tươi, nước đường.', 'Pha trà vải.', '2026-01-28 12:26:36'),
(178, 'Bột Matcha Latte 3in1', 'bot-matcha-latte-3in1', '- Vị đậm đà dậy mùi trà, thơm ngon chuẩn vị trà sữa Đài Loan KHÔNG CẦN ĐI TIỆM\' mà vẫn\' \'NGON NHƯ NGOÀI TIỆM\'.\r\n\r\n\r\n\r\n - không cần pha chế, không cần nấu - pha siêu dễ\r\n\r\n- Dùng cho quán rất tiện lợi, nhanh chóng, dễ bảo quản, nhất là với hình thức take away. Hoặc dùng ngay tại nhà đều được..\r\n\r\n- có thể phá cách làm món trà sữa đá xay - cho menu thức uống hè.\r\n\r\n- Tuỳ ý topping thêm thạch, milk foam.. khi dùng\r\n\r\n\r\n\r\n** ĐẶC BIỆT: LOW CALORIES - uống không sợ fat.\r\n\r\n\r\n\r\n** Không quá ngọt có thể dùng luôn không cần thêm syrup đường.\r\n\r\n---------------------------\r\n\r\nCông thức đề nghị : 50g bột : 300ml nước ( có thể cho thêm đường để tăng độ ngọt )\r\n\r\nLưu ý : Bột đã có sẵn thành phần sữa va đường . cho nước vào dùng ngay được\r\n\r\n---------------------------\r\n\r\nSẢN PHẨM CỦA CÔNG TY TNHH LUCKY VN STAR - EASY SET UP', 'Pha sẵn 3in1, tiện lợi, vị béo ngọt.', 150000.00, 127500.00, 'NL178', 90, 2, 'assets/images/bot_matcha_1.png', 0, 'inactive', 'Matcha, bột kem, đường.', 'Pha 20g bột với 150ml nước nóng.', '2026-01-28 12:27:15'),
(179, 'Siro Vỏ Cam Xanh (Blue Curacao)', 'siro-blue-curacao', 'Màu xanh đại dương tuyệt đẹp (Deep Blue). Hương vị vỏ cam đắng nhẹ đặc trưng. Nguyên liệu không thể thiếu để pha chế các món Soda Blue Ocean, Cocktail hay trà sữa đám mây.', 'Màu xanh đại dương, vị vỏ cam, pha Soda.', 110000.00, 93500.00, 'NL179', -2, 2, 'assets/images/siro_bac_ha_1.png', 1, 'active', 'Tinh chất vỏ cam, màu xanh thực phẩm.', 'Tạo màu và hương cho đồ uống.', '2026-01-28 12:27:15'),
(180, 'Siro Hạt Dẻ (Hazelnut Syrup)', 'siro-hat-de', 'Hương thơm bùi béo, nồng nàn của hạt dẻ nướng. Rất hợp khi kết hợp với cà phê (Hazelnut Coffee) hoặc Trà sữa nướng. Vị ngọt ấm áp, thích hợp cho menu đồ uống mùa đông.', 'Thơm mùi hạt dẻ nướng, pha cà phê/trà sữa.', 120000.00, 84000.00, 'NL180', 40, 2, 'assets/images/siro_duong_den_1.png', 0, 'active', 'Hương hạt dẻ, đường caramel.', 'Pha Latte hoặc Trà sữa.', '2026-01-28 12:27:15'),
(181, 'Siro Caramel Mặn (Salted Caramel)', 'siro-caramel-man', 'Sự cân bằng hoàn hảo giữa vị ngọt của đường cháy và chút mặn của muối biển. Tạo chiều sâu hương vị cho các món đá xay hoặc Macchiato. Vị mặn nhẹ kích thích vị giác cực mạnh.', 'Vị ngọt mặn hài hòa, caramel muối.', 125000.00, 87500.00, 'NL181', 45, 2, 'assets/images/siro_duong_den_1.png', 0, 'active', 'Caramel, muối biển.', 'Pha chế đá xay, cafe.', '2026-01-28 12:27:15'),
(182, 'Siro Táo Xanh (Green Apple)', 'siro-tao-xanh', 'Vị chua thanh và hương thơm tươi mát của táo xanh. Thường dùng để pha Soda Apple, Trà thạch táo hoặc làm lớp thạch rau câu màu xanh ngọc bích.', 'Chua thanh, thơm mát mùi táo.', 90000.00, 0.00, 'NL182', 60, 2, 'assets/images/siro_kiwi_1.png', 0, 'active', 'Cốt táo xanh, đường.', 'Pha soda giải nhiệt.', '2026-01-28 12:27:15'),
(183, 'Siro Vải Hoa Hồng (Lychee Rose)', 'siro-vai-hoa-hong', 'Sự kết hợp lãng mạn giữa hương vải ngọt ngào và hương hoa hồng quyến rũ. Tạo nên món Trà Vải Hoa Hồng sang chảnh, thơm nức mũi. (Hình ảnh minh họa là vải ngâm, tượng trưng cho thành phần chính).', 'Hương vải mix hoa hồng, sang chảnh.', 130000.00, 0.00, 'NL183', 29, 2, 'assets/images/vai_thieu_ngam_1.png', 1, 'active', 'Hương vải, hương hoa hồng.', 'Pha trà trái cây cao cấp.', '2026-01-28 12:27:15'),
(184, 'Trân Châu Hoàng Kim Mini (Hạt Nhỏ)', 'tran-chau-hoang-kim-mini', 'Phiên bản hạt nhỏ (baby) của trân châu hoàng kim. Hạt nhỏ dễ hút, cảm giác nhai \"đã\" miệng hơn vì số lượng hạt nhiều hơn trong mỗi lần hút. Vẫn giữ độ dẻo dai và vị mật ong đặc trưng.', 'Hạt nhỏ (baby), dẻo dai, dễ hút.', 75000.00, 0.00, 'NL184', 120, 2, 'assets/images/tran_chau_boduo_caramel_1.png', 0, 'active', 'Bột sắn, mật ong.', 'Nấu nhanh chín hơn loại hạt to.', '2026-01-28 12:27:15'),
(185, 'Thạch Nha Đam (Aloe Vera)', 'thach-nha-dam', 'Thạch nha đam tự nhiên cắt hạt lựu, giòn sần sật, thanh mát. Đã được xử lý kỹ không còn nhớt và đắng. Topping dưỡng nhan tuyệt vời cho các món trà trái cây và sữa chua.', 'Nha đam tự nhiên, giòn, không đắng.', 55000.00, 0.00, 'NL185', 80, 2, 'assets/images/thach_rau_cau_cat_1.png', 0, 'active', 'Nha đam 100%, nước đường.', 'Ăn liền.', '2026-01-28 12:27:15'),
(186, 'Bột Làm Tàu Hũ Singapore', 'bot-tau-hu-singapore', 'Bột làm tàu hũ (pudding đậu nành) mềm mịn, béo ngậy, tan trong miệng. Không cần dùng thạch cao. Hương đậu nành thơm lừng, kết hợp với trân châu đường đen là chuẩn bài.', 'Làm tàu hũ mềm mịn, thơm đậu nành.', 140000.00, 0.00, 'NL186', 50, 2, 'assets/images/bot_khuc_bach_1.png', 1, 'active', 'Bột đậu nành, bột kem, chất làm đông.', 'Nấu sôi để nguội là đông.', '2026-01-28 12:27:15'),
(187, 'Hạt Thủy Tinh Dâu (Strawberry Popping Boba)', 'hat-thuy-tinh-dau', 'Loại topping \"phát nổ\" trong miệng. Vỏ ngoài mỏng dai, bên trong chứa nước cốt dâu tây. Khi cắn nhẹ sẽ vỡ òa vị chua ngọt bất ngờ. Trẻ em cực kỳ yêu thích.', 'Hạt nổ trong miệng, vị dâu tây.', 160000.00, 0.00, 'NL187', 40, 2, 'assets/images/thach_vi_dau_1.png', 0, 'active', 'Nước ép dâu, màng bọc rong biển.', 'Múc nhẹ tay, ăn liền.', '2026-01-28 12:27:15'),
(188, 'Hạt Thủy Tinh Yaourt (Yogurt Popping)', 'hat-thuy-tinh-yaourt', 'Hạt thủy tinh nhân sữa chua chua ngọt ngọt. Màu trắng đục như ngọc trai. Kết hợp với các món đá xay hoặc trà trái cây nhiệt đới rất hợp.', 'Hạt nổ vị sữa chua, lạ miệng.', 165000.00, 0.00, 'NL188', 35, 2, 'assets/images/thach_tran_chau_trang_den_1.png', 0, 'active', 'Sữa chua, màng bọc thực phẩm.', 'Topping cao cấp.', '2026-01-28 12:27:15'),
(189, 'Mứt Việt Quất (Blueberry Jam)', 'mut-viet-quat', 'Mứt trái cây có xác việt quất nghiền. Dùng để làm Soda Blueberry hoặc phết lên bánh mì, làm nhân bánh kem. Vị chua dịu, màu tím sẫm đẹp mắt.', 'Mứt có xác trái cây, chua dịu.', 100000.00, 0.00, 'NL189', 60, 2, 'assets/images/siro_nho_1.png', 0, 'active', 'Việt quất nghiền, đường.', 'Làm soda hoặc đá xay.', '2026-01-28 12:27:15'),
(190, 'Bột Cốt Dừa Béo (Coconut Powder)', 'bot-cot-dua-beo', 'Thay thế nước cốt dừa lon. Bột cốt dừa có ưu điểm dễ bảo quản, độ béo cao và hương thơm ổn định. Dùng pha Cacao dừa, Cà phê dừa hoặc nấu chè.', 'Thay thế cốt dừa lon, béo ngậy.', 70000.00, 0.00, 'NL190', 150, 2, 'assets/images/bot_kem_beo_thai_lan_1.png', 0, 'active', 'Cơm dừa sấy phun, bột kem.', 'Hòa tan với nước nóng.', '2026-01-28 12:27:15'),
(191, 'Bột Tinh Than Tre (Takesumi)', 'bot-tinh-than-tre', 'Bột than tre Nhật Bản siêu mịn, không mùi, không vị, tạo màu đen huyền bí cho thực phẩm. Dùng làm Trà sữa than tre, bánh cuộn than tre hoặc kem đen. Có tác dụng thải độc cơ thể.', 'Tạo màu đen huyền bí, thải độc.', 250000.00, 0.00, 'NL191', 20, 2, 'assets/images/bot_suong_sao_1.png', 0, 'active', '100% than tre hoạt tính thực phẩm.', 'Dùng lượng rất nhỏ để tạo màu.', '2026-01-28 12:27:15'),
(192, 'Thạch Củ Năng (Water Chestnut)', 'thach-cu-nang', 'Giả lập món thạch củ năng bọc bột lọc. Thạch dai bên ngoài, bên trong giòn sần sật vị củ năng. Topping quen thuộc của món chè khúc bạch hoặc trà sữa.', 'Giòn sần sật, dai ngoài giòn trong.', 60000.00, 0.00, 'NL192', 90, 2, 'assets/images/thach_rau_cau_cat_1.png', 0, 'active', 'Củ năng, bột năng.', 'Luộc chín trước khi dùng.', '2026-01-28 12:27:15'),
(193, 'Bột Kem Trứng Nướng (Brulee)', 'bot-kem-trung-nuong', 'Phiên bản nâng cấp dùng để làm lớp kem trứng cháy trên mặt trà sữa (Crème Brûlée). Vị trứng đậm đà hơn, có thể dùng đèn khò để đốt lớp đường phía trên tạo màu caramen đẹp mắt.', 'Làm lớp kem trứng cháy, vị đậm đà.', 135000.00, 0.00, 'NL193', 50, 2, 'assets/images/bot_kem_chung_1.png', 1, 'active', 'Bột trứng, bột phô mai, đường.', 'Đánh bông và khò lửa.', '2026-01-28 12:27:15'),
(194, 'Bột Sương Sáo Hạt Chia', 'bot-suong-sao-hat-chia', 'Sự kết hợp giữa thạch đen giải nhiệt và siêu thực phẩm hạt chia. Khi nấu xong, hạt chia lơ lửng trong thạch nhìn rất đẹp và tăng giá trị dinh dưỡng.', 'Thạch đen mix hạt chia, bổ dưỡng.', 65000.00, 0.00, 'NL194', 100, 2, 'assets/images/bot_suong_sao_1.png', 0, 'active', 'Bột sương sáo, hạt chia.', 'Nấu như sương sáo thường.', '2026-01-28 12:27:15'),
(195, 'Thạch Dừa Thô (Chưa Nấu)', 'thach-dua-tho', 'Dành cho khách muốn tự tay chế biến. Thạch dừa khô ép nước, khi ngâm sẽ nở ra rất nhiều. Có thể nấu với đường phèn, lá dứa tùy khẩu vị. Rất kinh tế.', 'Thạch thô chưa nấu, nở nhiều, kinh tế.', 150000.00, 0.00, 'NL195', 40, 2, 'assets/images/thach_dua_coco_1.png', 0, 'active', 'Phôi thạch dừa sấy.', 'Ngâm xả nước nhiều lần rồi nấu.', '2026-01-28 12:27:15'),
(196, 'Siro Trà Bí Đao (Winter Melon)', 'siro-tra-bi-dao', 'Cốt bí đao cô đặc thơm lừng. Dùng để pha trà bí đao hạt chia giải nhiệt cấp tốc mà không cần nấu bí tươi lỉnh kỉnh. Vị ngọt thanh, mùi thơm bí đao nấu đường phèn đặc trưng.', 'Cốt bí đao cô đặc, giải nhiệt.', 85000.00, 0.00, 'NL196', 150, 2, 'assets/images/siro_dua_luoi_1.png', 1, 'active', 'Cốt bí đao, đường phèn.', 'Pha loãng với nước và đá.', '2026-01-28 12:27:15'),
(197, 'Trân Châu Tuyết (Snow Pearl)', 'tran-chau-tuyet', 'Dòng trân châu 3Q cao cấp với độ trong suốt tuyệt đối và độ giòn dai vượt trội. Hạt to đều, không bị vụn. Là topping \"must-have\" cho các dòng trà trái cây hiện đại.', 'Trong suốt như tuyết, giòn dai.', 155000.00, 0.00, 'NL197', 80, 2, 'assets/images/tran_trau_3q_wingszion_1.png', 1, 'active', 'Konjac cao cấp.', 'Ăn liền.', '2026-01-28 12:27:15'),
(198, 'Set Nguyên Liệu Tàu Hũ Trân Châu', 'set-tau-hu-tran-chau', 'Combo tiện lợi gồm: Bột tàu hũ, Trân châu đường đen và Đường nâu Hàn Quốc. Giúp bạn tự làm món Tàu hũ trân châu đường đen nổi tiếng tại nhà dễ dàng.', 'Combo tiện lợi, tự làm tàu hũ tại nhà.', 99000.00, 0.00, 'NL198', 200, 2, 'assets/images/bot_kem_chung_1.png', 1, 'active', 'Bột tàu hũ, trân châu, đường đen.', 'Đủ nguyên liệu cho 5-6 chén.', '2026-01-28 12:27:15'),
(199, 'Bột Chè Khúc Bạch Vị Phô Mai', 'bot-khuc-bach-pho-mai', 'Bột làm chè khúc bạch được bổ sung thêm bột phô mai, giúp viên khúc bạch béo ngậy hơn, thơm hơn. Món chè giải nhiệt sang chảnh.', 'Vị phô mai béo ngậy, làm chè khúc bạch.', 145000.00, 0.00, 'NL199', 30, 2, 'assets/images/bot_khuc_bach_1.png', 0, 'active', 'Gelatin, bột kem, bột phô mai.', 'Nấu với sữa tươi.', '2026-01-28 12:27:15'),
(200, 'Bột Rau Câu Sơn Thủy', 'bot-rau-cau-son-thuy', 'Bột rau câu dẻo chuyên dùng đổ thạch sơn thủy (loang màu). Độ trong cao, dẻo dai, dễ tạo vân đẹp mắt. Gói lớn tiết kiệm cho gia đình.', 'Làm thạch loang màu nghệ thuật.', 45000.00, 0.00, 'NL200', 100, 2, 'assets/images/bot_rau_cau_1.png', 0, 'active', 'Bột rau câu dẻo.', 'Nấu thạch nghệ thuật.', '2026-01-28 12:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`, `alt_text`, `sort_order`, `created_at`) VALUES
(1, 1, 'assets/images/che_day_sapa_2.png', 'Chè Dây Sapa - Ảnh 2', 1, '2026-01-28 09:46:51'),
(2, 1, 'assets/images/che_day_sapa_3.png', 'Chè Dây Sapa - Ảnh 3', 2, '2026-01-28 09:46:51'),
(3, 2, 'assets/images/luc_tra_lai_2.png', 'Lục Trà Lài - Ảnh 2', 1, '2026-01-28 09:46:51'),
(4, 2, 'assets/images/luc_tra_lai_3.png', 'Lục Trà Lài - Ảnh 3', 2, '2026-01-28 09:46:51'),
(5, 3, 'assets/images/mat_o_long_tra_2.png', 'Mật Ong Long Trà - Ảnh 2', 1, '2026-01-28 09:46:51'),
(6, 3, 'assets/images/mat_o_long_tra_3.png', 'Mật Ong Long Trà - Ảnh 3', 2, '2026-01-28 09:46:51'),
(7, 4, 'assets/images/tra_an_than_ngu_ngon_2.png', 'Trà An Thần - Ảnh 2', 1, '2026-01-28 09:46:51'),
(8, 4, 'assets/images/tra_an_than_ngu_ngon_3.png', 'Trà An Thần - Ảnh 3', 2, '2026-01-28 09:46:51'),
(9, 5, 'assets/images/tra_atiso_tui_loc_2.png', 'Atiso Túi Lọc - Ảnh 2', 1, '2026-01-28 09:46:51'),
(10, 5, 'assets/images/tra_atiso_tui_loc_3.png', 'Atiso Túi Lọc - Ảnh 3', 2, '2026-01-28 09:46:51'),
(11, 6, 'assets/images/tra_bac_ha_2.png', 'Trà Bạc Hà - Ảnh 2', 1, '2026-01-28 09:46:51'),
(12, 6, 'assets/images/tra_bac_ha_3.png', 'Trà Bạc Hà - Ảnh 3', 2, '2026-01-28 09:46:51'),
(13, 7, 'assets/images/tra_bac_thai_nguyen_2.png', 'Trà Bắc Thái Nguyên - Ảnh 2', 1, '2026-01-28 09:46:51'),
(14, 7, 'assets/images/tra_bac_thai_nguyen_3.png', 'Trà Bắc Thái Nguyên - Ảnh 3', 2, '2026-01-28 09:46:51'),
(15, 8, 'assets/images/tra_bo_ty_vi_2.png', 'Trà Bổ Tỳ Vị - Ảnh 2', 1, '2026-01-28 09:46:51'),
(16, 8, 'assets/images/tra_bo_ty_vi_3.png', 'Trà Bổ Tỳ Vị - Ảnh 3', 2, '2026-01-28 09:46:51'),
(17, 9, 'assets/images/tra_cay_co_mau_2.png', 'Trà Cây Cỏ Máu - Ảnh 2', 1, '2026-01-28 09:46:51'),
(18, 9, 'assets/images/tra_cay_co_mau_3.png', 'Trà Cây Cỏ Máu - Ảnh 3', 2, '2026-01-28 09:46:51'),
(19, 10, 'assets/images/tra_ca_gai_leo_2.png', 'Trà Cà Gai Leo - Ảnh 2', 1, '2026-01-28 09:46:51'),
(20, 10, 'assets/images/tra_ca_gai_leo_3.png', 'Trà Cà Gai Leo - Ảnh 3', 2, '2026-01-28 09:46:51'),
(21, 11, 'assets/images/tra_cung_dinh_hue_2.png', 'Trà Cung Đình Huế - Ảnh 2', 1, '2026-01-28 09:46:51'),
(22, 11, 'assets/images/tra_cung_dinh_hue_3.png', 'Trà Cung Đình Huế - Ảnh 3', 2, '2026-01-28 09:46:51'),
(23, 12, 'assets/images/tra_dau_den_orihiro_2.png', 'Trà Đậu Đen - Ảnh 2', 1, '2026-01-28 09:46:51'),
(24, 12, 'assets/images/tra_dau_den_orihiro_3.png', 'Trà Đậu Đen - Ảnh 3', 2, '2026-01-28 09:46:51'),
(25, 13, 'assets/images/tra_den_dalatfarm_2.png', 'Trà Đen DalatFarm - Ảnh 2', 1, '2026-01-28 09:46:51'),
(26, 13, 'assets/images/tra_den_dalatfarm_3.png', 'Trà Đen DalatFarm - Ảnh 3', 2, '2026-01-28 09:46:51'),
(27, 14, 'assets/images/tra_den_ngoc_quy_2.png', 'Trà Đen Ngọc Quý - Ảnh 2', 1, '2026-01-28 09:46:51'),
(28, 15, 'assets/images/tra_dinh_lang_2.png', 'Trà Đinh Lăng - Ảnh 2', 1, '2026-01-28 09:46:51'),
(29, 15, 'assets/images/tra_dinh_lang_3.png', 'Trà Đinh Lăng - Ảnh 3', 2, '2026-01-28 09:46:51'),
(30, 16, 'assets/images/tra_doi_than_tim_2.png', 'Trà Dồi Thân Tím - Ảnh 2', 1, '2026-01-28 09:46:51'),
(31, 16, 'assets/images/tra_doi_than_tim_3.png', 'Trà Dồi Thân Tím - Ảnh 3', 2, '2026-01-28 09:46:51'),
(32, 17, 'assets/images/tra_dong_tu_vi_2.png', 'Trà Đông Tử Vị - Ảnh 2', 1, '2026-01-28 09:46:51'),
(33, 17, 'assets/images/tra_dong_tu_vi_3.png', 'Trà Đông Tử Vị - Ảnh 3', 2, '2026-01-28 09:46:51'),
(34, 18, 'assets/images/tra_duong_nau_nguyen_chat_2.png', 'Trà Đường Nâu - Ảnh 2', 1, '2026-01-28 09:46:51'),
(35, 18, 'assets/images/tra_duong_nau_nguyen_chat_3.png', 'Trà Đường Nâu - Ảnh 3', 2, '2026-01-28 09:46:51'),
(36, 19, 'assets/images/tra_duong_nhan_2.png', 'Trà Dưỡng Nhan - Ảnh 2', 1, '2026-01-28 09:46:51'),
(37, 19, 'assets/images/tra_duong_nhan_3.png', 'Trà Dưỡng Nhan - Ảnh 3', 2, '2026-01-28 09:46:51'),
(38, 20, 'assets/images/tra_du_du_duc_2.png', 'Trà Đu Đủ Đực - Ảnh 2', 1, '2026-01-28 09:46:51'),
(39, 20, 'assets/images/tra_du_du_duc_3.png', 'Trà Đu Đủ Đực - Ảnh 3', 2, '2026-01-28 09:46:51'),
(40, 21, 'assets/images/tra_fitne_herbal_2.png', 'Trà Fitne Herbal - Ảnh 2', 1, '2026-01-28 09:46:51'),
(41, 21, 'assets/images/tra_fitne_herbal_3.png', 'Trà Fitne Herbal - Ảnh 3', 2, '2026-01-28 09:46:51'),
(42, 22, 'assets/images/tra_gao_luc_2.png', 'Trà Gạo Lứt - Ảnh 2', 1, '2026-01-28 09:46:51'),
(43, 22, 'assets/images/tra_gao_luc_3.png', 'Trà Gạo Lứt - Ảnh 3', 2, '2026-01-28 09:46:51'),
(44, 23, 'assets/images/tra_genpi_orihiro_2.png', 'Trà Genpi Orihiro - Ảnh 2', 1, '2026-01-28 09:46:51'),
(45, 23, 'assets/images/tra_genpi_orihiro_3.png', 'Trà Genpi Orihiro - Ảnh 3', 2, '2026-01-28 09:46:51'),
(46, 24, 'assets/images/tra_giao_co_lam_2.png', 'Trà Giảo Cổ Lam - Ảnh 2', 1, '2026-01-28 09:46:51'),
(47, 24, 'assets/images/tra_giao_co_lam_3.png', 'Trà Giảo Cổ Lam - Ảnh 3', 2, '2026-01-28 09:46:51'),
(48, 25, 'assets/images/tra_gung_2.png', 'Trà Gừng - Ảnh 2', 1, '2026-01-28 09:46:51'),
(49, 26, 'assets/images/tra_ha_thu_o_tui_loc_2.png', 'Trà Hà Thủ Ô - Ảnh 2', 1, '2026-01-28 09:46:51'),
(50, 26, 'assets/images/tra_ha_thu_o_tui_loc_3.png', 'Trà Hà Thủ Ô - Ảnh 3', 2, '2026-01-28 09:46:51'),
(51, 27, 'assets/images/tra_hoang_thao_moc_2.png', 'Trà Hoàng Thảo Mộc - Ảnh 2', 1, '2026-01-28 09:46:51'),
(52, 27, 'assets/images/tra_hoang_thao_moc_3.png', 'Trà Hoàng Thảo Mộc - Ảnh 3', 2, '2026-01-28 09:46:51'),
(53, 28, 'assets/images/tra_hoa_cuc_que_hoa_ky_tu_2.png', 'Trà Hoa Cúc - Ảnh 2', 1, '2026-01-28 09:46:51'),
(54, 28, 'assets/images/tra_hoa_cuc_que_hoa_ky_tu_3.png', 'Trà Hoa Cúc - Ảnh 3', 2, '2026-01-28 09:46:51'),
(55, 29, 'assets/images/tra_hong_sam_2.png', 'Trà Hồng Sâm - Ảnh 2', 1, '2026-01-28 09:46:51'),
(56, 29, 'assets/images/tra_hong_sam_3.png', 'Trà Hồng Sâm - Ảnh 3', 2, '2026-01-28 09:46:51'),
(57, 30, 'assets/images/tra_hong_sam_han_quoc_2.png', 'Hồng Sâm HQ - Ảnh 2', 1, '2026-01-28 09:46:51'),
(58, 30, 'assets/images/tra_hong_sam_han_quoc_3.png', 'Hồng Sâm HQ - Ảnh 3', 2, '2026-01-28 09:46:51'),
(59, 31, 'assets/images/tra_hut_am_2.png', 'Trà Hút Ẩm - Ảnh 2', 1, '2026-01-28 09:46:51'),
(60, 31, 'assets/images/tra_hut_am_3.png', 'Trà Hút Ẩm - Ảnh 3', 2, '2026-01-28 09:46:51'),
(61, 32, 'assets/images/tra_kho_qua_2.png', 'Trà Khổ Qua - Ảnh 2', 1, '2026-01-28 09:46:51'),
(62, 32, 'assets/images/tra_kho_qua_3.png', 'Trà Khổ Qua - Ảnh 3', 2, '2026-01-28 09:46:51'),
(63, 33, 'assets/images/tra_lai_tan_cuong_2.png', 'Trà Lài Tân Cương - Ảnh 2', 1, '2026-01-28 09:46:51'),
(64, 33, 'assets/images/tra_lai_tan_cuong_3.png', 'Trà Lài Tân Cương - Ảnh 3', 2, '2026-01-28 09:46:51'),
(65, 34, 'assets/images/tra_la_nam_2.png', 'Trà Lá Nam - Ảnh 2', 1, '2026-01-28 09:46:51'),
(66, 34, 'assets/images/tra_la_nam_3.png', 'Trà Lá Nam - Ảnh 3', 2, '2026-01-28 09:46:51'),
(67, 35, 'assets/images/tra_la_oi_2.png', 'Trà Lá Ổi - Ảnh 2', 1, '2026-01-28 09:46:51'),
(68, 35, 'assets/images/tra_la_oi_3.png', 'Trà Lá Ổi - Ảnh 3', 2, '2026-01-28 09:46:51'),
(69, 36, 'assets/images/tra_lipton_xi_muoi_2.png', 'Lipton Xí Muội - Ảnh 2', 1, '2026-01-28 09:46:51'),
(70, 36, 'assets/images/tra_lipton_xi_muoi_3.png', 'Lipton Xí Muội - Ảnh 3', 2, '2026-01-28 09:46:51'),
(71, 37, 'assets/images/tra_mam_xoi_2.png', 'Trà Mâm Xôi - Ảnh 2', 1, '2026-01-28 09:46:51'),
(72, 37, 'assets/images/tra_mam_xoi_3.png', 'Trà Mâm Xôi - Ảnh 3', 2, '2026-01-28 09:46:51'),
(73, 38, 'assets/images/tra_mang_cau_slim_2.png', 'Trà Mãng Cầu - Ảnh 2', 1, '2026-01-28 09:46:51'),
(74, 38, 'assets/images/tra_mang_cau_slim_3.png', 'Trà Mãng Cầu - Ảnh 3', 2, '2026-01-28 09:46:51'),
(75, 39, 'assets/images/tra_mix_vi_cam_que_2.png', 'Trà Mix Cam Quế - Ảnh 2', 1, '2026-01-28 09:46:51'),
(76, 39, 'assets/images/tra_mix_vi_cam_que_3.png', 'Trà Mix Cam Quế - Ảnh 3', 2, '2026-01-28 09:46:51'),
(77, 40, 'assets/images/tra_moc_cau_2.png', 'Trà Móc Câu - Ảnh 2', 1, '2026-01-28 09:46:51'),
(78, 40, 'assets/images/tra_moc_cau_3.png', 'Trà Móc Câu - Ảnh 3', 2, '2026-01-28 09:46:51'),
(79, 41, 'assets/images/tra_moc_hoa_tay_bac_2.png', 'Trà Mộc Hoa - Ảnh 2', 1, '2026-01-28 09:46:51'),
(80, 41, 'assets/images/tra_moc_hoa_tay_bac_3.png', 'Trà Mộc Hoa - Ảnh 3', 2, '2026-01-28 09:46:51'),
(81, 42, 'assets/images/tra_nhai_dalatfarm_2.png', 'Trà Nhài Dalat - Ảnh 2', 1, '2026-01-28 09:46:51'),
(82, 42, 'assets/images/tra_nhai_dalatfarm_3.png', 'Trà Nhài Dalat - Ảnh 3', 2, '2026-01-28 09:46:51'),
(83, 43, 'assets/images/tra_nhai_huong_2.png', 'Trà Nhài Hương - Ảnh 2', 1, '2026-01-28 09:46:51'),
(84, 43, 'assets/images/tra_nhai_huong_3.png', 'Trà Nhài Hương - Ảnh 3', 2, '2026-01-28 09:46:51'),
(85, 44, 'assets/images/tra_nhai_layla_2.png', 'Trà Nhài Layla - Ảnh 2', 1, '2026-01-28 09:46:51'),
(86, 44, 'assets/images/tra_nhai_layla_3.png', 'Trà Nhài Layla - Ảnh 3', 2, '2026-01-28 09:46:51'),
(87, 45, 'assets/images/tra_nhan_tran_cam_thao_2.png', 'Nhân Trần Cam Thảo - Ảnh 2', 1, '2026-01-28 09:46:51'),
(88, 45, 'assets/images/tra_nhan_tran_cam_thao_3.png', 'Nhân Trần Cam Thảo - Ảnh 3', 2, '2026-01-28 09:46:51'),
(89, 46, 'assets/images/tra_non_tom_2.png', 'Trà Nõn Tôm - Ảnh 2', 1, '2026-01-28 09:46:51'),
(90, 46, 'assets/images/tra_non_tom_3.png', 'Trà Nõn Tôm - Ảnh 3', 2, '2026-01-28 09:46:51'),
(91, 47, 'assets/images/tra_o_long_lai_chau_2.png', 'Oolong Lai Châu - Ảnh 2', 1, '2026-01-28 09:46:51'),
(92, 47, 'assets/images/tra_o_long_lai_chau_3.png', 'Oolong Lai Châu - Ảnh 3', 2, '2026-01-28 09:46:51'),
(93, 48, 'assets/images/tra_o_long_len_men_2.png', 'Oolong Lên Men - Ảnh 2', 1, '2026-01-28 09:46:51'),
(94, 48, 'assets/images/tra_o_long_len_men_3.png', 'Oolong Lên Men - Ảnh 3', 2, '2026-01-28 09:46:51'),
(95, 49, 'assets/images/tra_pho_nhi_2.png', 'Trà Phổ Nhĩ - Ảnh 2', 1, '2026-01-28 09:46:51'),
(96, 49, 'assets/images/tra_pho_nhi_3.png', 'Trà Phổ Nhĩ - Ảnh 3', 2, '2026-01-28 09:46:51'),
(97, 50, 'assets/images/tra_que_hoa_2.png', 'Trà Quế Hoa - Ảnh 2', 1, '2026-01-28 09:46:51'),
(98, 50, 'assets/images/tra_que_hoa_3.png', 'Trà Quế Hoa - Ảnh 3', 2, '2026-01-28 09:46:51'),
(99, 51, 'assets/images/tra_que_thao_moc_2.png', 'Trà Quế Thảo Mộc - Ảnh 2', 1, '2026-01-28 09:46:51'),
(100, 51, 'assets/images/tra_que_thao_moc_3.png', 'Trà Quế Thảo Mộc - Ảnh 3', 2, '2026-01-28 09:46:51'),
(101, 52, 'assets/images/tra_sam_dua_2.png', 'Trà Sâm Dứa - Ảnh 2', 1, '2026-01-28 09:46:51'),
(102, 52, 'assets/images/tra_sam_dua_3.png', 'Trà Sâm Dứa - Ảnh 3', 2, '2026-01-28 09:46:51'),
(103, 53, 'assets/images/tra_sam_hong_2.png', 'Trà Sâm Hồng - Ảnh 2', 1, '2026-01-28 09:46:51'),
(104, 53, 'assets/images/tra_sam_hong_3.png', 'Trà Sâm Hồng - Ảnh 3', 2, '2026-01-28 09:46:51'),
(105, 54, 'assets/images/tra_sam_ky_hai_duong_2.png', 'Sâm Kỳ Hải Dương - Ảnh 2', 1, '2026-01-28 09:46:51'),
(106, 54, 'assets/images/tra_sam_ky_hai_duong_3.png', 'Sâm Kỳ Hải Dương - Ảnh 3', 2, '2026-01-28 09:46:51'),
(107, 55, 'assets/images/tra_sam_to_nu_2.png', 'Sâm Tố Nữ - Ảnh 2', 1, '2026-01-28 09:46:51'),
(108, 55, 'assets/images/tra_sam_to_nu_3.png', 'Sâm Tố Nữ - Ảnh 3', 2, '2026-01-28 09:46:51'),
(109, 56, 'assets/images/tra_tam_sen_2.png', 'Trà Tâm Sen - Ảnh 2', 1, '2026-01-28 09:46:51'),
(110, 56, 'assets/images/tra_tam_sen_3.png', 'Trà Tâm Sen - Ảnh 3', 2, '2026-01-28 09:46:51'),
(111, 57, 'assets/images/tra_tam_vun_2.png', 'Trà Tấm Vụn - Ảnh 2', 1, '2026-01-28 09:46:51'),
(112, 57, 'assets/images/tra_tam_vun_3.png', 'Trà Tấm Vụn - Ảnh 3', 2, '2026-01-28 09:46:51'),
(113, 58, 'assets/images/tra_thai_nguyen_2.png', 'Trà Thái Nguyên - Ảnh 2', 1, '2026-01-28 09:46:51'),
(114, 58, 'assets/images/tra_thai_nguyen_3.png', 'Trà Thái Nguyên - Ảnh 3', 2, '2026-01-28 09:46:51'),
(115, 59, 'assets/images/tra_thai_xanh_2.png', 'Trà Thái Xanh - Ảnh 2', 1, '2026-01-28 09:46:51'),
(116, 59, 'assets/images/tra_thai_xanh_3.png', 'Trà Thái Xanh - Ảnh 3', 2, '2026-01-28 09:46:51'),
(117, 60, 'assets/images/tra_thao_moc_ba_kich_2.png', 'Ba Kích - Ảnh 2', 1, '2026-01-28 09:46:51'),
(118, 60, 'assets/images/tra_thao_moc_ba_kich_3.png', 'Ba Kích - Ảnh 3', 2, '2026-01-28 09:46:51'),
(119, 61, 'assets/images/tra_thao_moc_ngu_tra_an_nu_2.png', 'Ngự Trà An Nữ - Ảnh 2', 1, '2026-01-28 09:46:51'),
(120, 61, 'assets/images/tra_thao_moc_ngu_tra_an_nu_3.png', 'Ngự Trà An Nữ - Ảnh 3', 2, '2026-01-28 09:46:51'),
(121, 62, 'assets/images/tra_thao_moc_xuan_thu_2.png', 'Xuân Thu - Ảnh 2', 1, '2026-01-28 09:46:51'),
(122, 62, 'assets/images/tra_thao_moc_xuan_thu_3.png', 'Xuân Thu - Ảnh 3', 2, '2026-01-28 09:46:51'),
(123, 63, 'assets/images/tra_tia_to_2.png', 'Trà Tía Tô - Ảnh 2', 1, '2026-01-28 09:46:51'),
(124, 63, 'assets/images/tra_tia_to_3.png', 'Trà Tía Tô - Ảnh 3', 2, '2026-01-28 09:46:51'),
(125, 64, 'assets/images/tra_tui_loc_cay_rau_muong_2.png', 'Rau Mương - Ảnh 2', 1, '2026-01-28 09:46:51'),
(126, 64, 'assets/images/tra_tui_loc_cay_rau_muong_3.png', 'Rau Mương - Ảnh 3', 2, '2026-01-28 09:46:51'),
(127, 65, 'assets/images/tra_uop_hoa_nhai_2.png', 'Trà Ướp Nhài - Ảnh 2', 1, '2026-01-28 09:46:51'),
(128, 65, 'assets/images/tra_uop_hoa_nhai_3.png', 'Trà Ướp Nhài - Ảnh 3', 2, '2026-01-28 09:46:51'),
(129, 67, 'assets/images/tra_xanh_co_thu_2.png', 'Trà Xanh Cổ Thụ - Ảnh 2', 1, '2026-01-28 09:46:51'),
(130, 67, 'assets/images/tra_xanh_co_thu_3.png', 'Trà Xanh Cổ Thụ - Ảnh 3', 2, '2026-01-28 09:46:51'),
(131, 68, 'assets/images/tra_xanh_shan_tuyet_2.png', 'Shan Tuyết - Ảnh 2', 1, '2026-01-28 09:46:51'),
(132, 68, 'assets/images/tra_xanh_shan_tuyet_3.png', 'Shan Tuyết - Ảnh 3', 2, '2026-01-28 09:46:51'),
(256, 69, 'assets/images/che_day_sapa_2.png', 'Chè Dây Rừng - Ảnh 2', 1, '2026-01-28 10:20:16'),
(257, 70, 'assets/images/luc_tra_lai_2.png', 'Lục Trà Lài - Ảnh 2', 1, '2026-01-28 10:20:16'),
(258, 71, 'assets/images/mat_o_long_tra_2.png', 'Oolong Mật Ong - Ảnh 2', 1, '2026-01-28 10:20:16'),
(259, 72, 'assets/images/tra_an_than_ngu_ngon_2.png', 'An Thần - Ảnh 2', 1, '2026-01-28 10:20:16'),
(260, 73, 'assets/images/tra_bac_ha_2.png', 'Bạc Hà Lạnh - Ảnh 2', 1, '2026-01-28 10:20:16'),
(261, 74, 'assets/images/tra_bac_thai_nguyen_2.png', 'Tân Cương Xanh - Ảnh 2', 1, '2026-01-28 10:20:16'),
(262, 75, 'assets/images/tra_cung_dinh_hue_2.png', 'Ngự Trà - Ảnh 2', 1, '2026-01-28 10:20:16'),
(263, 76, 'assets/images/tra_den_dalatfarm_2.png', 'Hồng Trà Sữa - Ảnh 2', 1, '2026-01-28 10:20:16'),
(264, 77, 'assets/images/tra_gao_luc_2.png', 'Gạo Lứt Đậu Đen - Ảnh 2', 1, '2026-01-28 10:20:16'),
(265, 78, 'assets/images/tra_gung_2.png', 'Gừng Sả - Ảnh 2', 1, '2026-01-28 10:20:16'),
(266, 79, 'assets/images/tra_hoang_thao_moc_2.png', 'Thập Toàn Đại Bổ - Ảnh 2', 1, '2026-01-28 10:20:16'),
(267, 80, 'assets/images/tra_hong_sam_2.png', 'Hồng Sâm Lát - Ảnh 2', 1, '2026-01-28 10:20:16'),
(268, 81, 'assets/images/tra_kho_qua_2.png', 'Khổ Qua Rừng - Ảnh 2', 1, '2026-01-28 10:20:16'),
(269, 82, 'assets/images/tra_lai_tan_cuong_2.png', 'Nhài Cổ Thụ - Ảnh 2', 1, '2026-01-28 10:20:16'),
(270, 83, 'assets/images/tra_mam_xoi_2.png', 'Berry Tea - Ảnh 2', 1, '2026-01-28 10:20:16'),
(271, 84, 'assets/images/tra_mang_cau_slim_2.png', 'Mãng Cầu Giảm Cân - Ảnh 2', 1, '2026-01-28 10:20:16'),
(272, 85, 'assets/images/tra_o_long_lai_chau_2.png', 'Oolong Tứ Quý - Ảnh 2', 1, '2026-01-28 10:20:16'),
(273, 86, 'assets/images/tra_que_hoa_2.png', 'Mộc Quế Hoa - Ảnh 2', 1, '2026-01-28 10:20:16'),
(274, 87, 'assets/images/tra_sam_hong_2.png', 'Sâm Hồng Bát Tiên - Ảnh 2', 1, '2026-01-28 10:20:16'),
(275, 88, 'assets/images/tra_xanh_shan_tuyet_2.png', 'Bạch Trà - Ảnh 2', 1, '2026-01-28 10:20:16'),
(287, 89, 'assets/images/tra_den_dalatfarm_2.png', 'Bá Tước - Ảnh 2', 1, '2026-01-28 10:23:12'),
(288, 90, 'assets/images/luc_tra_lai_2.png', 'Lài King - Ảnh 2', 1, '2026-01-28 10:23:12'),
(289, 91, 'assets/images/tra_gung_2.png', 'Gừng Đen - Ảnh 2', 1, '2026-01-28 10:23:12'),
(290, 92, 'assets/images/tra_hoa_cuc_que_hoa_ky_tu_2.png', 'Cúc Chi - Ảnh 2', 1, '2026-01-28 10:23:12'),
(291, 93, 'assets/images/tra_o_long_lai_chau_2.png', 'Oolong Sữa - Ảnh 2', 1, '2026-01-28 10:23:12'),
(292, 94, 'assets/images/tra_gao_luc_2.png', 'Gạo Lứt Xạ Đen - Ảnh 2', 1, '2026-01-28 10:23:12'),
(293, 95, 'assets/images/tra_tui_loc_cay_rau_muong_2.png', 'Cà Gai Leo - Ảnh 2', 1, '2026-01-28 10:23:12'),
(294, 96, 'assets/images/che_day_sapa_2.png', 'Dây Cao Bằng - Ảnh 2', 1, '2026-01-28 10:23:12'),
(295, 97, 'assets/images/tra_bac_ha_2.png', 'Bạc Hà Khô - Ảnh 2', 1, '2026-01-28 10:23:12'),
(296, 98, 'assets/images/tra_sam_hong_2.png', 'Sơn Mật - Ảnh 2', 1, '2026-01-28 10:23:12'),
(297, 99, 'assets/images/tra_kho_qua_2.png', 'Chè Đắng - Ảnh 2', 1, '2026-01-28 10:23:12'),
(298, 100, 'assets/images/tra_uop_hoa_nhai_2.png', 'Sen Tây Hồ - Ảnh 2', 1, '2026-01-28 10:23:12'),
(302, 102, 'assets/images/bot_cacao_2.png', 'Bột Cacao - Ảnh 2', 1, '2026-01-28 12:24:13'),
(303, 102, 'assets/images/bot_cacao_3.png', 'Bột Cacao - Ảnh 3', 2, '2026-01-28 12:24:13'),
(304, 103, 'assets/images/bot_ca_cao_thuong_hang_2.png', 'Cacao Premium - Ảnh 2', 1, '2026-01-28 12:24:13'),
(305, 103, 'assets/images/bot_ca_cao_thuong_hang_3.png', 'Cacao Premium - Ảnh 3', 2, '2026-01-28 12:24:13'),
(306, 104, 'assets/images/bot_frappe_dans_2.png', 'Frappe Dans - Ảnh 2', 1, '2026-01-28 12:24:13'),
(307, 104, 'assets/images/bot_frappe_dans_3.png', 'Frappe Dans - Ảnh 3', 2, '2026-01-28 12:24:13'),
(308, 105, 'assets/images/bot_kem_beo_creamerX_2.png', 'Creamer X - Ảnh 2', 1, '2026-01-28 12:24:13'),
(309, 105, 'assets/images/bot_kem_beo_creamerX_3.png', 'Creamer X - Ảnh 3', 2, '2026-01-28 12:24:13'),
(310, 105, 'assets/images/bot_kem_beo_creamerX_4.png', 'Creamer X - Ảnh 4', 3, '2026-01-28 12:24:13'),
(311, 106, 'assets/images/bot_kem_beo_halan_2.png', 'Kievit - Ảnh 2', 1, '2026-01-28 12:24:13'),
(312, 106, 'assets/images/bot_kem_beo_halan_3.png', 'Kievit - Ảnh 3', 2, '2026-01-28 12:24:13'),
(313, 106, 'assets/images/bot_kem_beo_halan_4.png', 'Kievit - Ảnh 4', 3, '2026-01-28 12:24:13'),
(314, 107, 'assets/images/bot_kem_beo_koera_2.png', 'Frima - Ảnh 2', 1, '2026-01-28 12:24:13'),
(315, 107, 'assets/images/bot_kem_beo_koera_3.png', 'Frima - Ảnh 3', 2, '2026-01-28 12:24:13'),
(316, 107, 'assets/images/bot_kem_beo_koera_4.png', 'Frima - Ảnh 4', 3, '2026-01-28 12:24:13'),
(317, 108, 'assets/images/bot_kem_beo_thai_lan_2.png', 'B-One - Ảnh 2', 1, '2026-01-28 12:24:13'),
(318, 108, 'assets/images/bot_kem_beo_thai_lan_3.png', 'B-One - Ảnh 3', 2, '2026-01-28 12:24:13'),
(319, 108, 'assets/images/bot_kem_beo_thai_lan_4.png', 'B-One - Ảnh 4', 3, '2026-01-28 12:24:13'),
(320, 109, 'assets/images/bot_kem_chung_2.png', 'Egg Pudding - Ảnh 2', 1, '2026-01-28 12:24:13'),
(321, 109, 'assets/images/bot_kem_chung_3.png', 'Egg Pudding - Ảnh 3', 2, '2026-01-28 12:24:13'),
(322, 110, 'assets/images/bot_khuc_bach_2.png', 'Khúc Bạch - Ảnh 2', 1, '2026-01-28 12:24:13'),
(323, 110, 'assets/images/bot_khuc_bach_3.png', 'Khúc Bạch - Ảnh 3', 2, '2026-01-28 12:24:13'),
(324, 111, 'assets/images/bot_la_gelatin_2.png', 'Gelatin - Ảnh 2', 1, '2026-01-28 12:24:13'),
(325, 111, 'assets/images/bot_la_gelatin_3.png', 'Gelatin - Ảnh 3', 2, '2026-01-28 12:24:13'),
(326, 112, 'assets/images/bot_matcha_2.png', 'Matcha - Ảnh 2', 1, '2026-01-28 12:24:13'),
(327, 112, 'assets/images/bot_matcha_3.png', 'Matcha - Ảnh 3', 2, '2026-01-28 12:24:13'),
(328, 113, 'assets/images/bot_milkFoam_vang_sua_2.png', 'Milk Foam - Ảnh 2', 1, '2026-01-28 12:24:13'),
(329, 113, 'assets/images/bot_milkFoam_vang_sua_3.png', 'Milk Foam - Ảnh 3', 2, '2026-01-28 12:24:13'),
(330, 114, 'assets/images/bot_pho_mai_2.png', 'Phô Mai - Ảnh 2', 1, '2026-01-28 12:24:13'),
(331, 114, 'assets/images/bot_pho_mai_3.png', 'Phô Mai - Ảnh 3', 2, '2026-01-28 12:24:13'),
(332, 115, 'assets/images/bot_rau_cau_2.png', 'Agar - Ảnh 2', 1, '2026-01-28 12:24:13'),
(333, 115, 'assets/images/bot_rau_cau_3.png', 'Agar - Ảnh 3', 2, '2026-01-28 12:24:13'),
(334, 116, 'assets/images/bot_rau_cau_ca_thai_2.png', 'Rau Câu Thái - Ảnh 2', 1, '2026-01-28 12:24:13'),
(335, 116, 'assets/images/bot_rau_cau_ca_thai_3.png', 'Rau Câu Thái - Ảnh 3', 2, '2026-01-28 12:24:13'),
(336, 117, 'assets/images/bot_rau_cau_con_ca_2.png', 'Cá Dẻo - Ảnh 2', 1, '2026-01-28 12:24:13'),
(337, 117, 'assets/images/bot_rau_cau_con_ca_3.png', 'Cá Dẻo - Ảnh 3', 2, '2026-01-28 12:24:13'),
(338, 118, 'assets/images/bot_sua_beo_kievit_2.png', 'Indo - Ảnh 2', 1, '2026-01-28 12:24:13'),
(339, 118, 'assets/images/bot_sua_beo_kievit_3.png', 'Indo - Ảnh 3', 2, '2026-01-28 12:24:13'),
(340, 118, 'assets/images/bot_sua_beo_kievit_4.png', 'Indo - Ảnh 4', 3, '2026-01-28 12:24:13'),
(341, 119, 'assets/images/bot_sua_khoai_mon_2.png', 'Pudding Môn - Ảnh 2', 1, '2026-01-28 12:24:13'),
(342, 119, 'assets/images/bot_sua_khoai_mon_3.png', 'Pudding Môn - Ảnh 3', 2, '2026-01-28 12:24:13'),
(343, 120, 'assets/images/bot_suong_sao_2.png', 'Sương Sáo - Ảnh 2', 1, '2026-01-28 12:24:13'),
(344, 120, 'assets/images/bot_suong_sao_3.png', 'Sương Sáo - Ảnh 3', 2, '2026-01-28 12:24:13'),
(365, 121, 'assets/images/dao_hong_thai_mieng_2.png', 'Đào Hồng - Ảnh 2', 1, '2026-01-28 12:25:25'),
(366, 121, 'assets/images/dao_hong_thai_mieng_3.png', 'Đào Hồng - Ảnh 3', 2, '2026-01-28 12:25:25'),
(367, 121, 'assets/images/dao_hong_thai_mieng_4.png', 'Đào Hồng - Ảnh 4', 3, '2026-01-28 12:25:25'),
(368, 122, 'assets/images/dao_ngam_2.png', 'Đào Ngâm - Ảnh 2', 1, '2026-01-28 12:25:25'),
(369, 122, 'assets/images/dao_ngam_3.png', 'Đào Ngâm - Ảnh 3', 2, '2026-01-28 12:25:25'),
(370, 122, 'assets/images/dao_ngam_4.png', 'Đào Ngâm - Ảnh 4', 3, '2026-01-28 12:25:25'),
(371, 123, 'assets/images/kem_beo_thuc_vat_2.png', 'Kem Béo - Ảnh 2', 1, '2026-01-28 12:25:25'),
(372, 123, 'assets/images/kem_beo_thuc_vat_3.png', 'Kem Béo - Ảnh 3', 2, '2026-01-28 12:25:25'),
(373, 123, 'assets/images/kem_beo_thuc_vat_4.png', 'Kem Béo - Ảnh 4', 3, '2026-01-28 12:25:25'),
(374, 124, 'assets/images/siro_bac_ha_2.png', 'Siro Bạc Hà - Ảnh 2', 1, '2026-01-28 12:25:25'),
(375, 124, 'assets/images/siro_bac_ha_3.png', 'Siro Bạc Hà - Ảnh 3', 2, '2026-01-28 12:25:25'),
(376, 125, 'assets/images/siro_cam_2.png', 'Siro Cam - Ảnh 2', 1, '2026-01-28 12:25:25'),
(377, 125, 'assets/images/siro_cam_3.png', 'Siro Cam - Ảnh 3', 2, '2026-01-28 12:25:25'),
(378, 126, 'assets/images/siro_chanh_day_2.png', 'Chanh Dây - Ảnh 2', 1, '2026-01-28 12:25:25'),
(379, 126, 'assets/images/siro_chanh_day_3.png', 'Chanh Dây - Ảnh 3', 2, '2026-01-28 12:25:25'),
(380, 127, 'assets/images/siro_dau_2.png', 'Siro Dâu - Ảnh 2', 1, '2026-01-28 12:25:25'),
(381, 127, 'assets/images/siro_dau_3.png', 'Siro Dâu - Ảnh 3', 2, '2026-01-28 12:25:25'),
(382, 128, 'assets/images/siro_dua_2.png', 'Siro Dừa - Ảnh 2', 1, '2026-01-28 12:25:25'),
(383, 128, 'assets/images/siro_dua_3.png', 'Siro Dừa - Ảnh 3', 2, '2026-01-28 12:25:25'),
(384, 129, 'assets/images/siro_dua_luoi_2.png', 'Dưa Lưới - Ảnh 2', 1, '2026-01-28 12:25:25'),
(385, 129, 'assets/images/siro_dua_luoi_3.png', 'Dưa Lưới - Ảnh 3', 2, '2026-01-28 12:25:25'),
(386, 130, 'assets/images/siro_duong_den_2.png', 'Đường Đen - Ảnh 2', 1, '2026-01-28 12:25:25'),
(387, 130, 'assets/images/siro_duong_den_3.png', 'Đường Đen - Ảnh 3', 2, '2026-01-28 12:25:25'),
(388, 131, 'assets/images/siro_kiwi_2.png', 'Siro Kiwi - Ảnh 2', 1, '2026-01-28 12:25:25'),
(389, 131, 'assets/images/siro_kiwi_3.png', 'Siro Kiwi - Ảnh 3', 2, '2026-01-28 12:25:25'),
(390, 132, 'assets/images/siro_mang_cut_2.png', 'Măng Cụt - Ảnh 2', 1, '2026-01-28 12:25:25'),
(391, 132, 'assets/images/siro_mang_cut_3.png', 'Măng Cụt - Ảnh 3', 2, '2026-01-28 12:25:25'),
(392, 133, 'assets/images/siro_nho_2.png', 'Siro Nho - Ảnh 2', 1, '2026-01-28 12:25:25'),
(393, 133, 'assets/images/siro_nho_3.png', 'Siro Nho - Ảnh 3', 2, '2026-01-28 12:25:25'),
(394, 134, 'assets/images/siro_oi_2.png', 'Siro Ổi - Ảnh 2', 1, '2026-01-28 12:25:25'),
(395, 134, 'assets/images/siro_oi_3.png', 'Siro Ổi - Ảnh 3', 2, '2026-01-28 12:25:25'),
(396, 136, 'assets/images/tep_buoi_hong_2.png', 'Bưởi Hồng - Ảnh 2', 1, '2026-01-28 12:25:25'),
(397, 136, 'assets/images/tep_buoi_hong_3.png', 'Bưởi Hồng - Ảnh 3', 2, '2026-01-28 12:25:25'),
(398, 136, 'assets/images/tep_buoi_hong_4.png', 'Bưởi Hồng - Ảnh 4', 3, '2026-01-28 12:25:25'),
(399, 137, 'assets/images/thach_ca_4_mau_douxian_2.png', 'Thạch Cá - Ảnh 2', 1, '2026-01-28 12:25:25'),
(400, 137, 'assets/images/thach_ca_4_mau_douxian_3.png', 'Thạch Cá - Ảnh 3', 2, '2026-01-28 12:25:25'),
(401, 138, 'assets/images/thach_dua_coco_2.png', 'Thạch Dừa - Ảnh 2', 1, '2026-01-28 12:25:25'),
(402, 138, 'assets/images/thach_dua_coco_3.png', 'Thạch Dừa - Ảnh 3', 2, '2026-01-28 12:25:25'),
(403, 140, 'assets/images/thach_rau_cau_cat_2.png', 'Thạch Cắt - Ảnh 2', 1, '2026-01-28 12:25:25'),
(404, 140, 'assets/images/thach_rau_cau_cat_3.png', 'Thạch Cắt - Ảnh 3', 2, '2026-01-28 12:25:25'),
(428, 141, 'assets/images/thach_tran_chau_trang_den_2.png', 'TC Trắng Đen - Ảnh 2', 1, '2026-01-28 12:26:03'),
(429, 141, 'assets/images/thach_tran_chau_trang_den_3.png', 'TC Trắng Đen - Ảnh 3', 2, '2026-01-28 12:26:03'),
(430, 142, 'assets/images/thach_vi_ca_phe_2.png', 'Thạch Cafe - Ảnh 2', 1, '2026-01-28 12:26:03'),
(431, 142, 'assets/images/thach_vi_ca_phe_3.png', 'Thạch Cafe - Ảnh 3', 2, '2026-01-28 12:26:03'),
(432, 143, 'assets/images/thach_vi_dao_2.png', 'Thạch Đào - Ảnh 2', 1, '2026-01-28 12:26:03'),
(433, 143, 'assets/images/thach_vi_dao_3.png', 'Thạch Đào - Ảnh 3', 2, '2026-01-28 12:26:03'),
(434, 144, 'assets/images/thach_vi_dau_2.png', 'Thạch Dâu - Ảnh 2', 1, '2026-01-28 12:26:03'),
(435, 144, 'assets/images/thach_vi_dau_3.png', 'Thạch Dâu - Ảnh 3', 2, '2026-01-28 12:26:03'),
(436, 145, 'assets/images/thach_vi_nho_2.png', 'Thạch Nho - Ảnh 2', 1, '2026-01-28 12:26:03'),
(437, 145, 'assets/images/thach_vi_nho_3.png', 'Thạch Nho - Ảnh 3', 2, '2026-01-28 12:26:03'),
(438, 146, 'assets/images/thach_vi_socola_2.png', 'Thạch Socola - Ảnh 2', 1, '2026-01-28 12:26:03'),
(439, 146, 'assets/images/thach_vi_socola_3.png', 'Thạch Socola - Ảnh 3', 2, '2026-01-28 12:26:03'),
(440, 147, 'assets/images/thach_vi_tao_2.png', 'Thạch Táo - Ảnh 2', 1, '2026-01-28 12:26:03'),
(441, 147, 'assets/images/thach_vi_tao_3.png', 'Thạch Táo - Ảnh 3', 2, '2026-01-28 12:26:03'),
(442, 148, 'assets/images/thach_vi_tra_xanh_2.png', 'Thạch Matcha - Ảnh 2', 1, '2026-01-28 12:26:03'),
(443, 148, 'assets/images/thach_vi_tra_xanh_3.png', 'Thạch Matcha - Ảnh 3', 2, '2026-01-28 12:26:03'),
(444, 149, 'assets/images/thach_vi_viet_quat_2.png', 'Thạch Việt Quất - Ảnh 2', 1, '2026-01-28 12:26:03'),
(445, 149, 'assets/images/thach_vi_viet_quat_3.png', 'Thạch Việt Quất - Ảnh 3', 2, '2026-01-28 12:26:03'),
(446, 150, 'assets/images/tran_chau_andes_dailoan_2.png', 'TC Andes - Ảnh 2', 1, '2026-01-28 12:26:03'),
(447, 150, 'assets/images/tran_chau_andes_dailoan_3.png', 'TC Andes - Ảnh 3', 2, '2026-01-28 12:26:03'),
(448, 151, 'assets/images/tran_chau_boduo_caramel_2.png', 'TC Boduo - Ảnh 2', 1, '2026-01-28 12:26:03'),
(449, 151, 'assets/images/tran_chau_boduo_caramel_3.png', 'TC Boduo - Ảnh 3', 2, '2026-01-28 12:26:03'),
(450, 152, 'assets/images/tran_chau_douxian_2.png', 'TC Douxian - Ảnh 2', 1, '2026-01-28 12:26:03'),
(451, 152, 'assets/images/tran_chau_douxian_3.png', 'TC Douxian - Ảnh 3', 2, '2026-01-28 12:26:03'),
(452, 153, 'assets/images/tran_trau_3q_wingszion_2.png', '3Q Wings - Ảnh 2', 1, '2026-01-28 12:26:03'),
(453, 153, 'assets/images/tran_trau_3q_wingszion_3.png', '3Q Wings - Ảnh 3', 2, '2026-01-28 12:26:03'),
(454, 154, 'assets/images/tran_trau_soi_2.png', 'TC Sợi - Ảnh 2', 1, '2026-01-28 12:26:03'),
(455, 154, 'assets/images/tran_trau_soi_3.png', 'TC Sợi - Ảnh 3', 2, '2026-01-28 12:26:03'),
(456, 155, 'assets/images/tran_trau_wonderfull_2.png', 'TC Wonderfull - Ảnh 2', 1, '2026-01-28 12:26:03'),
(457, 155, 'assets/images/tran_trau_wonderfull_3.png', 'TC Wonderfull - Ảnh 3', 2, '2026-01-28 12:26:03'),
(458, 155, 'assets/images/tran_trau_wonderfull_4.png', 'TC Wonderfull - Ảnh 4', 3, '2026-01-28 12:26:03'),
(459, 156, 'assets/images/vai_thieu_ngam_2.png', 'Vải Thiều - Ảnh 2', 1, '2026-01-28 12:26:03'),
(460, 156, 'assets/images/vai_thieu_ngam_3.png', 'Vải Thiều - Ảnh 3', 2, '2026-01-28 12:26:03'),
(461, 156, 'assets/images/vai_thieu_ngam_4.png', 'Vải Thiều - Ảnh 4', 3, '2026-01-28 12:26:03'),
(462, 157, 'assets/images/xi_muoi_do_2.png', 'Xí Muội - Ảnh 2', 1, '2026-01-28 12:26:03'),
(463, 157, 'assets/images/xi_muoi_do_3.png', 'Xí Muội - Ảnh 3', 2, '2026-01-28 12:26:03'),
(464, 157, 'assets/images/xi_muoi_do_4.png', 'Xí Muội - Ảnh 4', 3, '2026-01-28 12:26:03'),
(491, 158, 'assets/images/bot-sua_khoai_mon_2.png', 'Khoai Môn - Ảnh 2', 1, '2026-01-28 12:26:37'),
(492, 159, 'assets/images/bot_cacao_2.png', 'Cacao Dark - Ảnh 2', 1, '2026-01-28 12:26:37'),
(493, 160, 'assets/images/bot_frappe_dans_2.png', 'Bột Mix - Ảnh 2', 1, '2026-01-28 12:26:37'),
(494, 161, 'assets/images/bot_kem_beo_halan_2.png', 'Kievit New - Ảnh 2', 1, '2026-01-28 12:26:37'),
(495, 162, 'assets/images/bot_kem_chung_2.png', 'Pudding Phô Mai - Ảnh 2', 1, '2026-01-28 12:26:37'),
(496, 163, 'assets/images/bot_matcha_2.png', 'Matcha Uji - Ảnh 2', 1, '2026-01-28 12:26:37'),
(497, 164, 'assets/images/bot_milkFoam_vang_sua_2.png', 'Macchiato - Ảnh 2', 1, '2026-01-28 12:26:37'),
(498, 165, 'assets/images/bot_pho_mai_2.png', 'Phô Mai Cay - Ảnh 2', 1, '2026-01-28 12:26:37'),
(499, 166, 'assets/images/bot_rau_cau_2.png', 'Agar Vịt - Ảnh 2', 1, '2026-01-28 12:26:37'),
(500, 167, 'assets/images/dao_ngam_2.png', 'Đào Nam Phi - Ảnh 2', 1, '2026-01-28 12:26:37'),
(501, 168, 'assets/images/kem_beo_thuc_vat_2.png', 'Whipping Rich - Ảnh 2', 1, '2026-01-28 12:26:37'),
(502, 169, 'assets/images/siro_bac_ha_2.png', 'Snow Mint - Ảnh 2', 1, '2026-01-28 12:26:37'),
(503, 170, 'assets/images/siro_chanh_day_2.png', 'Mứt Chanh Dây - Ảnh 2', 1, '2026-01-28 12:26:37'),
(504, 171, 'assets/images/siro_duong_den_2.png', 'Sốt Đường Nâu - Ảnh 2', 1, '2026-01-28 12:26:37'),
(505, 172, 'assets/images/siro_dau_2.png', 'Mứt Dâu Boduo - Ảnh 2', 1, '2026-01-28 12:26:37'),
(506, 173, 'assets/images/thach_dua_coco_2.png', 'Dừa Sợi - Ảnh 2', 1, '2026-01-28 12:26:37'),
(507, 174, 'assets/images/thach_tran_chau_trang_den_2.png', 'Konjac 3Q - Ảnh 2', 1, '2026-01-28 12:26:37'),
(508, 175, 'assets/images/tran_chau_andes_dailoan_2.png', 'TC Đường Đen - Ảnh 2', 1, '2026-01-28 12:26:37'),
(509, 176, 'assets/images/tran_trau_3q_wingszion_2.png', '3Q Ngọc Trai - Ảnh 2', 1, '2026-01-28 12:26:37'),
(510, 177, 'assets/images/vai_thieu_ngam_2.png', 'Vải Lục Ngạn - Ảnh 2', 1, '2026-01-28 12:26:37'),
(522, 178, 'assets/images/bot_matcha_2.png', 'Matcha 3in1 - Ảnh 2', 1, '2026-01-28 12:27:15'),
(523, 179, 'assets/images/siro_bac_ha_2.png', 'Blue Curacao - Ảnh 2', 1, '2026-01-28 12:27:15'),
(524, 180, 'assets/images/siro_duong_den_2.png', 'Hazelnut - Ảnh 2', 1, '2026-01-28 12:27:15'),
(525, 181, 'assets/images/siro_duong_den_2.png', 'Caramel Mặn - Ảnh 2', 1, '2026-01-28 12:27:15'),
(526, 182, 'assets/images/siro_kiwi_2.png', 'Táo Xanh - Ảnh 2', 1, '2026-01-28 12:27:15'),
(527, 183, 'assets/images/vai_thieu_ngam_2.png', 'Vải Hoa Hồng - Ảnh 2', 1, '2026-01-28 12:27:15'),
(528, 184, 'assets/images/tran_chau_boduo_caramel_2.png', 'Hoàng Kim Mini - Ảnh 2', 1, '2026-01-28 12:27:15'),
(529, 185, 'assets/images/thach_rau_cau_cat_2.png', 'Nha Đam - Ảnh 2', 1, '2026-01-28 12:27:15'),
(530, 186, 'assets/images/bot_khuc_bach_2.png', 'Tàu Hũ Sing - Ảnh 2', 1, '2026-01-28 12:27:15'),
(531, 187, 'assets/images/thach_vi_dau_2.png', 'Thủy Tinh Dâu - Ảnh 2', 1, '2026-01-28 12:27:15'),
(532, 188, 'assets/images/thach_tran_chau_trang_den_2.png', 'Thủy Tinh Yogurt - Ảnh 2', 1, '2026-01-28 12:27:15'),
(533, 189, 'assets/images/siro_nho_2.png', 'Mứt Việt Quất - Ảnh 2', 1, '2026-01-28 12:27:15'),
(534, 190, 'assets/images/bot_kem_beo_thai_lan_2.png', 'Cốt Dừa - Ảnh 2', 1, '2026-01-28 12:27:15'),
(535, 191, 'assets/images/bot_suong_sao_2.png', 'Than Tre - Ảnh 2', 1, '2026-01-28 12:27:15'),
(536, 192, 'assets/images/thach_rau_cau_cat_2.png', 'Củ Năng - Ảnh 2', 1, '2026-01-28 12:27:15'),
(537, 193, 'assets/images/bot_kem_chung_2.png', 'Kem Trứng Nướng - Ảnh 2', 1, '2026-01-28 12:27:15'),
(538, 194, 'assets/images/bot_suong_sao_2.png', 'Sương Sáo Hạt Chia - Ảnh 2', 1, '2026-01-28 12:27:15'),
(539, 195, 'assets/images/thach_dua_coco_2.png', 'Dừa Thô - Ảnh 2', 1, '2026-01-28 12:27:15'),
(540, 196, 'assets/images/siro_dua_luoi_2.png', 'Bí Đao - Ảnh 2', 1, '2026-01-28 12:27:15'),
(541, 197, 'assets/images/tran_trau_3q_wingszion_2.png', '3Q Tuyết - Ảnh 2', 1, '2026-01-28 12:27:15'),
(542, 198, 'assets/images/bot_kem_chung_2.png', 'Combo Tàu Hũ - Ảnh 2', 1, '2026-01-28 12:27:15'),
(543, 199, 'assets/images/bot_khuc_bach_2.png', 'Khúc Bạch Phô Mai - Ảnh 2', 1, '2026-01-28 12:27:15'),
(544, 200, 'assets/images/bot_rau_cau_2.png', 'Sơn Thủy - Ảnh 2', 1, '2026-01-28 12:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT 5 COMMENT '1 đến 5 sao',
  `comment_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `product_id`, `user_id`, `rating`, `comment_text`, `created_at`) VALUES
(1, 1, 1, 5, 'Quá dữ!!', '2026-01-18 13:38:23'),
(2, 179, 3, 4, 'fasf', '2026-01-29 03:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'VD: Mừng lễ 8/3...',
  `description` text DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `discount_type` varchar(20) DEFAULT 'PERCENT' COMMENT 'PERCENT hoặc FIXED_AMOUNT',
  `discount_value` decimal(15,2) DEFAULT 0.00,
  `image_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `name`, `description`, `start_date`, `end_date`, `discount_type`, `discount_value`, `image_url`, `is_active`, `created_at`) VALUES
(1, 'Mừng Lễ 8/3', 'Giảm giá các loại trà hoa dành tặng người thương', '2023-03-01 00:00:00', '2026-03-10 23:59:59', 'PERCENT', 20.00, 'assets/images/promo_1769607767237_banner-8-3.jpg', 1, '2026-01-17 08:26:39'),
(2, 'Xả Kho Nguyên Liệu', 'Giảm giá cực sâu các loại topping', '2023-01-01 00:00:00', '2026-12-31 23:59:59', 'FIXED_AMOUNT', 5000.00, 'assets/images/banner-xa-kho.jpg', 0, '2026-01-17 08:26:39'),
(3, 'Siêu sale halloween', 'Giảm dên 30% cho các sản phẩm trà', '2026-01-27 15:55:44', '2026-01-29 15:55:48', 'PERCENT', 30.00, 'assets/images/promo_1769614145312_sale_halloween.jpg', 1, '2026-01-27 08:56:03');

-- --------------------------------------------------------

--
-- Table structure for table `promotion_items`
--

CREATE TABLE `promotion_items` (
  `id` int(11) NOT NULL,
  `promotion_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotion_items`
--

INSERT INTO `promotion_items` (`id`, `promotion_id`, `product_id`) VALUES
(31, 3, 178),
(32, 3, 180),
(33, 3, 181);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role` enum('admin','customer','editor') DEFAULT 'customer',
  `date_of_birth` datetime DEFAULT NULL,
  `dateOfBirth` datetime DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT 'other',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `first_name`, `last_name`, `phone`, `avatar`, `role`, `date_of_birth`, `dateOfBirth`, `gender`, `is_active`, `created_at`) VALUES
(1, 'Nhat Nam', 'nhatnam@gmail.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', NULL, NULL, '0363867570', NULL, 'admin', NULL, NULL, 'other', 1, '2025-12-30 04:12:40'),
(2, 'TieuMat', 'totieumat@gmail.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Mạt', 'Tiểu', '0363867570', NULL, 'admin', NULL, NULL, 'other', 0, '2026-01-26 12:41:49'),
(3, 'nguyenvanan', 'an.nguyen@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'An', 'Nguyễn Văn', '0901000001', 'assets/images/useravata.png', 'customer', '1995-01-15 00:00:00', NULL, 'male', 1, '2026-01-28 14:25:23'),
(4, 'tranthibich', 'bich.tran@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Bích', 'Trần Thị', '0901000002', 'assets/images/useravata.png', 'customer', '1998-03-22 00:00:00', NULL, 'female', 1, '2026-01-28 14:25:23'),
(5, 'lehoangnam', 'nam.le@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Nam', 'Lê Hoàng', '0901000003', 'assets/images/useravata.png', 'customer', '2000-05-10 00:00:00', NULL, 'male', 1, '2026-01-28 14:25:23'),
(6, 'phamthihuong', 'huong.pham@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Hương', 'Phạm Thị', '0901000004', 'assets/images/useravata.png', 'customer', '1997-12-05 00:00:00', NULL, 'female', 1, '2026-01-28 14:25:23'),
(7, 'hoangminhtuan', 'tuan.hoang@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Tuấn', 'Hoàng Minh', '0901000005', 'assets/images/useravata.png', 'customer', '1992-08-19 00:00:00', NULL, 'male', 1, '2026-01-28 14:25:23'),
(8, 'dothithanh', 'thanh.do@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Thanh', 'Đỗ Thị', '0901000006', 'assets/images/useravata.png', 'customer', '2001-02-14 00:00:00', NULL, 'female', 0, '2026-01-28 14:25:23'),
(9, 'vuquanghuy', 'huy.vu@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Huy', 'Vũ Quang', '0901000007', 'assets/images/useravata.png', 'customer', '1999-11-30 00:00:00', NULL, 'male', 1, '2026-01-28 14:25:23'),
(10, 'buithilan', 'lan.bui@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Lan', 'Bùi Thị', '0901000008', 'assets/images/useravata.png', 'customer', '1996-07-07 00:00:00', NULL, 'female', 1, '2026-01-28 14:25:23'),
(11, 'dangvanthanh', 'thanh.dang@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Thành', 'Đặng Văn', '0901000009', 'assets/images/useravata.png', 'customer', '1994-04-25 00:00:00', NULL, 'male', 1, '2026-01-28 14:25:23'),
(12, 'ngominhhieu', 'hieu.ngo@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Hiếu', 'Ngô Minh', '0901000010', 'assets/images/useravata.png', 'customer', '2002-09-02 00:00:00', NULL, 'male', 1, '2026-01-28 14:25:23'),
(13, 'lythithu', 'thu.ly@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Thu', 'Lý Thị', '0901000011', 'assets/images/useravata.png', 'customer', '1993-06-18 00:00:00', NULL, 'female', 1, '2026-01-28 14:25:23'),
(14, 'trinhvankhai', 'khai.trinh@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Khải', 'Trịnh Văn', '0901000012', 'assets/images/useravata.png', 'customer', '1991-10-10 00:00:00', NULL, 'male', 1, '2026-01-28 14:25:23'),
(15, 'phanvanhau', 'hau.phan@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Hậu', 'Phan Văn', '0901000013', 'assets/images/useravata.png', 'customer', '2000-01-20 00:00:00', NULL, 'male', 1, '2026-01-28 14:25:23'),
(16, 'vohoangyen', 'yen.vo@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Yến', 'Võ Hoàng', '0901000014', 'assets/images/useravata.png', 'customer', '1998-12-24 00:00:00', NULL, 'female', 1, '2026-01-28 14:25:23'),
(17, 'duongvanminh', 'minh.duong@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Minh', 'Dương Văn', '0901000015', 'assets/images/useravata.png', 'customer', '1995-05-05 00:00:00', NULL, 'male', 1, '2026-01-28 14:25:23'),
(18, 'luongthithuy', 'thuy.luong@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Thủy', 'Lương Thị', '0901000016', 'assets/images/useravata.png', 'customer', '2001-08-15 00:00:00', NULL, 'female', 1, '2026-01-28 14:25:23'),
(19, 'havanhung', 'hung.ha@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Hùng', 'Hà Văn', '0901000017', 'assets/images/useravata.png', 'customer', '1990-03-03 00:00:00', NULL, 'male', 1, '2026-01-28 14:25:23'),
(20, 'taquangbuu', 'buu.ta@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Bửu', 'Tạ Quang', '0901000018', 'assets/images/useravata.png', 'customer', '1997-09-09 00:00:00', NULL, 'male', 1, '2026-01-28 14:25:23'),
(21, 'caothiminh', 'minh.cao@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Minh', 'Cao Thị', '0901000019', 'assets/images/useravata.png', 'customer', '1996-11-11 00:00:00', NULL, 'female', 1, '2026-01-28 14:25:23'),
(22, 'maiquangvinh', 'vinh.mai@example.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', 'Vinh', 'Mai Quang', '0901000020', 'assets/images/useravata.png', 'customer', '1994-02-28 00:00:00', NULL, 'male', 0, '2026-01-28 14:25:23'),
(23, 'NhatNam', 'namphong@gmail.com', '$2a$12$650Ba0.yd5i426A3BJ5uT.DR4XodZh6Aba0mHq60ulIcHBT8KVX66', NULL, NULL, '0909123456', NULL, 'customer', NULL, NULL, 'other', 1, '2026-01-28 14:38:22'),
(24, 'phannhatnam.2005', 'phannhatnam.2005@gmail.com', '$2a$12$NnyUM22G6zOfbcXmm.q66exmNxtR/UQzvAmnVWXjp9px/DUEdaIH.', 'Nhật', 'Nam', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJAYwAes_ksmgQGPkMyz1ylq-t9ofy9oPMBdnVxzmc4l9Gc35uK=s96-c', 'customer', NULL, NULL, 'other', 1, '2026-01-28 23:50:21'),
(25, 'nam123', 'phannhatnamn1@gmail.com', '$2a$12$9PgzW0nDjJenSJ8ygg6EuuBpRsh3v6h3WJ5gbValU6QFTNQT0TdkW', NULL, NULL, '0383867570', NULL, 'customer', NULL, NULL, 'other', 1, '2026-01-29 04:56:56'),
(26, 'NhatNamN1', 'phannhatnamn2@gmail.com', '$2a$12$7/VOJveaOLSCUFvnIwa2fOjcGhXiLpAzTlwQLJPLxKECYPpwRl0ja', NULL, NULL, '0909123456', NULL, 'admin', NULL, NULL, 'other', 1, '2026-03-22 08:48:59');

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL COMMENT 'Nhà riêng, Văn phòng...',
  `province` varchar(100) DEFAULT NULL,
  `ward` varchar(100) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `full_name`, `phone_number`, `label`, `province`, `ward`, `street_address`, `is_default`) VALUES
(1, 1, NULL, '0363867570', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 101', 1),
(2, 2, 'Tiểu Mạt', '0363867570', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 102', 1),
(3, 3, 'Nguyễn Văn An', '0901000001', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 103', 1),
(4, 4, 'Trần Thị Bích', '0901000002', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 104', 1),
(5, 5, 'Lê Hoàng Nam', '0901000003', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 105', 1),
(6, 6, 'Phạm Thị Hương', '0901000004', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 106', 1),
(7, 7, 'Hoàng Minh Tuấn', '0901000005', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 107', 1),
(8, 8, 'Đỗ Thị Thanh', '0901000006', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 108', 1),
(9, 9, 'Vũ Quang Huy', '0901000007', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 109', 1),
(10, 10, 'Bùi Thị Lan', '0901000008', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 110', 1),
(11, 11, 'Đặng Văn Thành', '0901000009', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 111', 1),
(12, 12, 'Ngô Minh Hiếu', '0901000010', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 112', 1),
(13, 13, 'Lý Thị Thu', '0901000011', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 113', 1),
(14, 14, 'Trịnh Văn Khải', '0901000012', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 114', 1),
(15, 15, 'Phan Văn Hậu', '0901000013', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 115', 1),
(16, 16, 'Võ Hoàng Yến', '0901000014', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 116', 1),
(17, 17, 'Dương Văn Minh', '0901000015', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 117', 1),
(18, 18, 'Lương Thị Thủy', '0901000016', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 118', 1),
(19, 19, 'Hà Văn Hùng', '0901000017', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 119', 1),
(20, 20, 'Tạ Quang Bửu', '0901000018', 'Nhà riêng', 'Hồ Chí Minh', 'Phường Linh Trung', 'KTX Khu B, ĐHQG, TP. Thủ Đức - Phòng 120', 1),
(21, 25, '', '', 'Địa chỉ mới', '', '', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cmt_post` (`post_id`),
  ADD KEY `fk_cmt_user` (`user_id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `fk_post_author` (`author_id`),
  ADD KEY `fk_post_cat` (`category_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cart_user` (`user_id`),
  ADD KEY `fk_cart_prod` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `fk_cat_parent` (`parent_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `fk_ord_user` (`user_id`),
  ADD KEY `fk_ord_addr` (`shipping_address_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_item_ord` (`order_id`),
  ADD KEY `fk_item_prod` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `fk_prod_cat` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_img_prod` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rev_prod` (`product_id`),
  ADD KEY `fk_rev_user` (`user_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion_items`
--
ALTER TABLE `promotion_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_promo_main` (`promotion_id`),
  ADD KEY `fk_promo_prod` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_addr_user` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=545;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `promotion_items`
--
ALTER TABLE `promotion_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `fk_cmt_post` FOREIGN KEY (`post_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cmt_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `fk_post_author` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_post_cat` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_prod` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_cat_parent` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_ord_addr` FOREIGN KEY (`shipping_address_id`) REFERENCES `user_addresses` (`id`),
  ADD CONSTRAINT `fk_ord_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_item_ord` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_item_prod` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_prod_cat` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_img_prod` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `fk_rev_prod` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rev_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promotion_items`
--
ALTER TABLE `promotion_items`
  ADD CONSTRAINT `fk_promo_main` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_promo_prod` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `fk_addr_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
