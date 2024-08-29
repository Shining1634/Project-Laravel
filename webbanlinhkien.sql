-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th2 22, 2024 lúc 11:26 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webbanlinhkien`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `id` bigint UNSIGNED NOT NULL,
  `slide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slide1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`id`, `slide`, `slide1`, `ads`, `created_at`, `updated_at`) VALUES
(10, 'pv-banner-1222x465-eada7.jpg', 'banner4.jpg', 'ads1.jpg', NULL, NULL),
(11, NULL, 'banner1.jpg', 'ads2.jpg', NULL, NULL),
(13, NULL, 'banner3.jpg', '', '2020-12-24 02:27:12', '2020-12-24 02:27:12'),
(14, NULL, 'banner.jpg', '', '2020-12-24 02:27:33', '2020-12-24 02:27:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `bill_id` int UNSIGNED NOT NULL,
  `customerID` int UNSIGNED NOT NULL,
  `date_order` datetime NOT NULL,
  `total` double NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Chưa xử lí',
  `payment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codevnpay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_details`
--

CREATE TABLE `bill_details` (
  `id` int UNSIGNED NOT NULL,
  `bill_id` int UNSIGNED NOT NULL,
  `productID` bigint UNSIGNED NOT NULL,
  `quantily` int NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `categoryID` bigint UNSIGNED NOT NULL,
  `categoryName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cate_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`categoryID`, `categoryName`, `cate_description`, `created_at`, `updated_at`) VALUES
(1, 'MacBook', NULL, '2020-12-07 14:08:28', '2024-02-21 18:22:42'),
(2, 'AirPods', NULL, '2020-12-07 14:15:04', '2024-02-21 18:37:41'),
(6, 'ipad', NULL, '2020-12-07 23:13:53', '2024-02-21 18:16:52'),
(7, 'iphone', NULL, '2020-12-07 23:14:14', '2024-02-21 18:01:45'),
(9, 'Apple Watch', NULL, '2020-12-11 11:17:31', '2024-02-21 18:07:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `productID` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `name`, `comment`, `productID`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'ba đời nhà tôi mua hàng on mà chưa thấy sản phẩm nào tốt như sản phẩm này !', 20, 1, '2021-01-06 04:29:14', '2021-01-06 04:29:14'),
(3, 'admin', 'alo', 20, 1, '2021-01-06 04:35:55', '2021-01-06 04:35:55'),
(5, 'admin', 'test', 19, 1, '2021-01-06 04:43:20', '2021-01-06 04:43:20'),
(6, 'phuc', 'sản phẩm tốt', 20, 2, '2021-01-18 11:16:18', '2021-01-18 11:16:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` int UNSIGNED NOT NULL,
  `userID` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` int NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_12_07_132053_create_categories_table', 1),
(4, '2020_12_07_132151_create_products_table', 1),
(5, '2020_12_08_062736_create_products_table', 2),
(6, '2014_10_12_100000_create_password_resets_table', 3),
(7, '2020_12_20_060054_create_bills_table', 4),
(8, '2020_12_20_060151_create_bill_details_table', 4),
(9, '2020_12_20_085208_create_customers_table', 5),
(10, '2020_12_22_194654_create_bills_table', 6),
(11, '2020_12_22_194752_create_bill_details_table', 6),
(12, '2020_12_22_194901_create_customers_table', 6),
(13, '2020_12_23_034626_create_bills_table', 7),
(14, '2020_12_23_034753_create_bill_details_table', 7),
(15, '2020_12_23_034941_create_customers_table', 7),
(16, '2020_12_24_052010_create_banner_table', 8),
(17, '2020_12_27_001651_create_replies_table', 9),
(18, '2020_12_27_001843_create_comments_table', 9),
(19, '2021_01_10_090247_create_productdetails_table', 10),
(20, '2019_12_14_000001_create_personal_access_tokens_table', 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productdetails`
--

CREATE TABLE `productdetails` (
  `id` bigint UNSIGNED NOT NULL,
  `productID` bigint UNSIGNED NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guarantee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `productImage1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `productImage2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `productImage3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `productdetails`
--

INSERT INTO `productdetails` (`id`, `productID`, `brand`, `guarantee`, `productImage1`, `productImage2`, `productImage3`, `description`, `created_at`, `updated_at`) VALUES
(2, 19, 'INTEL', '36', 'cpui7.webp', 'cpui7-2.webp', 'cpui7-3.webp', '<h4 class=\"font-weight-bold mb-4\">Hiệu suất ở cấp độ mới</h4>\r\n         <p>Bộ xử lý Intel Core i7-9700 thế hệ thứ 9 đưa hiệu năng máy tính để bàn chính lên một cấp độ hoàn toàn mới. i7-9700 với bộ nhớ cache 12MB và công nghệ Intel® Turbo Boost 2.0 điều chỉnh tần số turbo tối đa lên tới 4.70 GHz. Hỗ trợ đa nhiệm với 8 luồng hiệu suất cao được cung cấp bởi 8 lõi với công nghệ siêu phân luồng Intel® (Công nghệ Intel® HT) để giải quyết khối lượng công việc đòi hỏi khắt khe nhất.</p>\r\n              <img src=\"cpu.jpg\" alt=\"\" class=\"img-fluid mx-auto d-block\">\r\n              <h4 class=\"font-weight-bold mb-4\">Các tính năng chính trên Intel Core i7-9700:</h4>\r\n              <ul>\r\n                <li>Tăng tốc dữ liệu khi được ghép nối với bộ nhớ Intel® Optane ™ để truy xuất dữ liệu bạn sử dụng nhiều nhất một cách nhanh chóng.</li>\r\n                <li>Hỗ trợ công nghệ bộ nhớ RAM DDR4, cho phép các hệ thống có thể nâng cấp lên tới 64GB và tốc độ truyền tải lên tới 2666 MT/s.</li>\r\n                <li>Hỗ trợ chipset Intel® Z390 bao gồm khả năng kết nối chưa từng có với tất cả các thiết bị của bạn có tích hợp USB 3.1 Gen 2, Intel® Wireless-AC và hỗ trợ tốc độ Gigabit Wi-Fi.</li>\r\n                <li>Tương thích với chipset Intel® 300 series</li>\r\n              </ul>\r\n              \r\n\r\n  \r\n<div class=\"collapse\">\r\n  <h4 class=\"font-weight-bold mb-4\">Cung cấp sức mạnh xử lý tối ưu</h4>\r\n  <p>Intel Core i7-9700 cung cấp sức mạnh xử lý mạnh mẽ để chơi game, ghi hình hoặc livestream vượt trội hơn so với các thế hệ trước. Công nghệ Intel® Quick Sync Video để phát livestream trực tuyến, ghi hình và xử lý đa nhiệm mà không bị gián đoạn. Khởi động hệ thống với công nghệ bộ nhớ Intel® Optane™ giúp tăng tốc tải và khởi chạy các ứng dụng và trò chơi chỉ trong vài giây.</p>\r\n  <p>Intel Core i7-9700 còn được tích hợp các công nghệ truyền thông tiên tiến mang lại nội dung chất lượng cao cho máy tính để bàn của bạn, bao gồm:</p>\r\n  <p>- Mã hóa/giải mã 10-bit HEVC, giải mã 10-bit VP9:</p>\r\n  <ul>\r\n    <li>Truyền phát trực tiếp các nội dung 4K cao cấp một cách mượt mà từ các nhà cung cấp trực tuyến hàng đầu.</li>\r\n    <li>Cung cấp trải nghiệm xem video 4K trên màn hình kích thước lớn của bạn.</li>\r\n  </ul>\r\n  <p>- Dải động cao (HDR) và Rec. 2020 (Gam màu rộng) cung cấp trải nghiệm xem hình ảnh và video nâng cao.</p>\r\n</div>', '2021-01-10 04:22:53', '2021-01-12 15:20:04'),
(3, 20, 'INTEL', '36', 'cpui5.webp', 'cpui52.webp', 'cpui5-3.webp', '<h3 style=\"text-align: center; \"><b>Giới thiệu về sản phẩm</b></h3><h5 style=\"text-align: center; \">CPU intel Core&nbsp;<a href=\"https://phongvu.vn/bo-vi-xu-ly-cpu-intel-core-i5-9400f-9m-cache-up-to-4-10ghz-p36902.html\" style=\"color: rgb(13, 110, 253); text-decoration-line: underline; font-family: Roboto, sans-serif; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51);\">i5-9400F</span></a><span style=\"color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;đã lên kệ tại Phong Vũ với 6 nhân thuộc dòng Coffee Lake Refresh và được sản xuất trên tiến trình xử lý 14nm của hãng. CPU Intel Core i5-9400F với hậu tố F khá mới mẻ đến từ việc lược giản GPU onboard với I5-9400.&nbsp;CPU Intel Core i5-9400F hướng đến phục vụ các PC hiệu năng trung bình có nhu cầu khai thác khoảng&nbsp;6 nhân vật lý và sở hữu card màn hình rời.&nbsp;</span></h5><p style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(0, 0, 0); text-align: center;\"><br></p><h5 style=\"text-align: center;\"><span style=\"text-align: justify;\"><font color=\"#333333\" face=\"Roboto, sans-serif\" style=\"\"><br></font></span></h5><h5 style=\"text-align: center; \"><b><br></b></h5>\r\n\r\n<img src=\"../public/frontend/image/gt/79.-CPU-Intel-i5-9400F.jpg\" alt=\"\" style=\"height:400px; float: left;\">  \r\n<div class=\"collapse\">\r\nCPU Core i5-9400F có nhân nhưng không có Hyper-Threading (siêu phân luồng) hoạt động ở mức 2.9 – 4.1 GHz, 9 MB cache – bộ nhớ đệm. Hỗ trợ bộ nhớ RAM DDR4-2666 và đòi hỏi công suất TDP là 65 W. Core i5-9400F là một trong những bộ xử lý sáu nhân phổ thông của Intel dành cho máy tính để bàn và do đó sẽ là một trong những CPU rẻ nhất có sáu nhân.\r\n\r\nTrở lại vào tháng 10, Intel đã chính thức công bố ba bộ xử lý Gen Core thứ 9 cho máy tính để bàn: Core i9-9900K và Core i7-9700K tám nhân, cũng như Core i5-9600K sáu nhân. Có giá chát chúa như thường lệ, những CPU này đa nhân, tần số cao và mở khóa ép xung nhắm đến những người đam mê có xu hướng chi tiêu rất nhiều cho phần cứng nói chung. Ngược lại, Core i5-9400F đi kèm với hệ số nhân bị khóa và TDP 65 W, do đó nhắm đến các dàn máy tính PC phổ thông với các card đồ họa rời.\r\n\r\n\r\n </div>', '2021-01-10 04:40:33', '2021-01-14 23:58:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `productID` bigint UNSIGNED NOT NULL,
  `categoryID` bigint UNSIGNED NOT NULL,
  `productName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `productImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listPrice` int NOT NULL,
  `discountPercent` tinyint NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`productID`, `categoryID`, `productName`, `productImage`, `listPrice`, `discountPercent`, `description`, `created_at`, `updated_at`) VALUES
(19, 2, 'Tai nghe AirPods 2 hộp sạc dây', 'airpods1.jpg', 2790000, 2, '<div>Tuyệt vời</div>', '2020-12-11 09:32:29', '2024-02-21 18:39:06'),
(20, 2, 'Tai nghe AirPods Pro 2023 USB-C', 'airpods2.jpg', 5990000, 3, '<div><font color=\"#333333\" face=\"Roboto, sans-serif\"><span style=\"font-size: 14px;\">Tuyệt vời</span></font></div>', '2020-12-11 09:38:35', '2024-02-21 18:40:40'),
(21, 1, 'MacBook Air 13 inch M1 2020 8CPU 7GPU 8GB/256GB', 'mac1.jpg', 18490000, 6, '<p>Tuyệt vời</p>', '2020-12-11 09:40:01', '2024-02-21 18:23:53'),
(22, 1, 'MacBook Air 13 inch M2 2022 8CPU 8GPU 8GB/256GB', 'mac2.jpg', 25990000, 8, '<p>Tuyệt vời</p>', '2020-12-11 09:41:17', '2024-02-21 18:25:30'),
(23, 6, 'iPad Gen 9 2021 10.2 inch WiFi 64GB', 'ipad1.jpg', 7690000, 3, '<p>Tuyệt vời</p>', '2020-12-11 09:44:16', '2024-02-21 18:17:59'),
(24, 6, 'iPad Gen 10 2022 10.9 inch WiFi 64GB', 'ipad2.jpg', 10990000, 5, '<p>Tuyệt vời</p>', '2020-12-11 09:47:52', '2024-02-21 18:19:09'),
(25, 9, 'Apple Watch Ultra 2 GPS + Cellular 49mm viền Titanium Dây Alpine Loop cỡ vừa', 'watch1.jpg', 21490000, 5, '<p>Tuyệt vời</p>', '2020-12-11 10:30:34', '2024-02-21 18:09:17'),
(26, 9, 'Apple Watch Ultra 2 GPS + Cellular 49mm viền Titanium Dây Alpine Loop cỡ nhỏ', 'watch2.jpg', 21490000, 3, '<p>Tuyệt vời</p>', '2020-12-11 10:32:06', '2024-02-21 18:10:17'),
(31, 9, 'Apple Watch Ultra GPS + Cellular 49mm Titanium Alpine Loop Medium', 'watch3.jpg', 17990000, 6, '<p>Tuyệt vời</p>', '2020-12-25 05:23:08', '2024-02-21 18:11:25'),
(32, 9, 'Apple Watch SE 2 GPS + Cellular 40mm viền nhôm dây cao su', 'watch4.jpg', 7190000, 4, '<p>Tuyệt vời</p>', '2020-12-25 05:26:05', '2024-02-21 18:12:55'),
(33, 7, 'iPhone 15 Pro Max 256GB', 'iPhone 15 Pro Max.jpg', 31490000, 10, '<p>Tuyệt vời</p>', '2020-12-25 05:32:33', '2024-02-21 18:02:31'),
(34, 7, 'iPhone 14 Pro Max 128GB', 'iPhone 14 Pro Max.jpg', 27390000, 8, '<p>Tuyệt vời</p>', '2020-12-25 05:35:06', '2024-02-21 18:04:02'),
(35, 7, 'iPhone 13 128GB', 'iphone 13 128GB.jpg', 14990000, 21, '<p>Tuyệt vời</p>', '2020-12-25 05:36:28', '2024-02-21 18:05:03'),
(36, 7, 'iPhone 11 64GB', 'iphone 11 64G.jpg', 9990000, 16, '<p>Tuyệt vời</p>', '2020-12-25 05:38:21', '2024-02-21 18:06:10'),
(41, 1, 'MacBook Air 15 inch M2 2023 8CPU 10GPU 8GB/256GB', 'mac3.jpg', 29990000, 6, '<p>Tuyệt vời</p>', '2021-01-14 23:12:01', '2024-02-21 18:27:13'),
(42, 1, 'MacBook Air 13 inch M1 2020 8CPU 7GPU 16GB/256GB', 'mac4.jpg', 26490000, 8, '<p>Tuyệt vời</p>', '2021-01-14 23:13:28', '2024-02-21 18:28:13'),
(43, 1, 'MacBook Air 13 inch M2 2022 8CPU 8GPU 16GB/256GB', 'mac5.jpg', 30990000, 3, '<p>Tuyệt vời</p>', '2021-01-14 23:14:20', '2024-02-21 18:30:06'),
(44, 1, 'MacBook Pro 16 inch M2 Pro 2023 12CPU 19GPU 16GB/1TB', 'mac6.jpg', 62990000, 4, '<p>Tuyệt vời</p>', '2021-01-14 23:15:06', '2024-02-21 18:32:05'),
(45, 1, 'MacBook Pro 14 inch M1 Pro 2021 10CPU 16GPU 16GB/1TB', 'mac7.jpg', 44990000, 2, '<p>Tuyệt vời</p>', '2021-01-14 23:15:49', '2024-02-21 18:33:46'),
(46, 1, 'MacBook Pro 14 2023 M3 8 CPU/10 GPU/8GB/512GB', 'mac8.jpg', 39190000, 3, '<p>Tuyệt&nbsp;</p>', '2021-01-14 23:17:13', '2024-02-21 18:35:37'),
(47, 2, 'Tai nghe AirPods 3 2022 Hộp sạc dây', 'airpods3.jpg', 4290000, 4, '<p>Tuyệt vời</p>', '2021-01-14 23:18:28', '2024-02-21 18:42:41'),
(48, 2, 'Tai nghe AirPods Pro 2022', 'airpods4.jpg', 5290000, 5, '<p>Tuyệt vời</p>', '2021-01-14 23:19:17', '2024-02-21 18:43:54'),
(53, 6, 'iPad Air 5 2022 10.9 inch M1 WiFi 64GB', 'ipad3.jpg', 14490000, 4, '<p>Tuyệt vời</p>', '2021-01-14 23:31:11', '2024-02-21 18:20:23'),
(54, 6, 'iPad Pro 11 2022 M2 WiFi 128GB', 'ipad4.jpg', 20190000, 7, '<p>Tuyệt vời</p>', '2021-01-14 23:32:05', '2024-02-21 18:21:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `replies`
--

CREATE TABLE `replies` (
  `id` int UNSIGNED NOT NULL,
  `comment_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `replies`
--

INSERT INTO `replies` (`id`, `comment_id`, `name`, `reply`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 5, 'admin', 'ok bạn nhé', 1, '2021-01-12 13:30:40', '2021-01-12 13:30:40'),
(2, 5, 'admin', 'ok', 1, '2021-01-12 13:31:33', '2021-01-12 13:31:33'),
(3, 1, 'phuc', 'tôi cũng vậy', 2, '2021-01-18 11:17:02', '2021-01-18 11:17:02'),
(4, 3, 'phuc', 'ola', 2, '2021-01-18 11:48:13', '2021-01-18 11:48:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeuser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `typeuser`, `created_at`, `updated_at`) VALUES
(2, 'phuc', 'phuc@gmail.com', NULL, '$2y$10$MNF4H9AlUpmjl2rmCcMn.O3ZvwbpScxY9Pj4LJYFpRLUApMl8N3fm', NULL, 'user', NULL, '2020-12-19 17:47:11'),
(5, 'nam', 'nam@gmail.com', NULL, '$2y$10$FR7LihhkCMEchaC2kd1vgu7VBM1q.Za/OvgzibhGCd2ZXqYqOqZ7G', NULL, 'user', '2020-12-26 14:48:24', '2020-12-26 14:48:24'),
(7, 'Duy Tân', 'ndtan.19it6@vku.udn.vn', NULL, '$2y$10$U3inBlRKheRlXW20XT6d1eFOZbPiyLJYRHQGjhj9EjYIZ5CrTLGPe', NULL, 'user', '2021-01-18 15:54:30', '2021-01-18 15:54:30'),
(8, 'admin', 'admin@example.com', NULL, '$2y$10$p.B39TF/XjRaPSdR6UFzSeHS8iG4qXE8uVwHOboUGLrjIGY3mqgxu', NULL, 'admin', '2024-02-21 17:52:10', '2024-02-21 17:52:10'),
(9, 'user', 'user@gmail.com', NULL, '$2y$10$iVVJxRPjyhV1IfPeqVbfPuG/ixYpL37kbCp3b6.SNA0N2W./q.E3m', NULL, 'user', '2024-02-22 01:31:40', '2024-02-22 01:31:40');

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `v_category`
-- (See below for the actual view)
--
CREATE TABLE `v_category` (
`countcate` bigint
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `v_quantity`
-- (See below for the actual view)
--
CREATE TABLE `v_quantity` (
`categoryName` varchar(255)
,`quantity` bigint
);

-- --------------------------------------------------------

--
-- Cấu trúc cho view `v_category`
--
DROP TABLE IF EXISTS `v_category`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_category`  AS SELECT count(`categories`.`categoryID`) AS `countcate` FROM `categories` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `v_quantity`
--
DROP TABLE IF EXISTS `v_quantity`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_quantity`  AS SELECT `categories`.`categoryName` AS `categoryName`, count(`products`.`productID`) AS `quantity` FROM (`categories` join `products` on((`products`.`categoryID` = `categories`.`categoryID`))) GROUP BY `categories`.`categoryName` ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `customerID` (`customerID`);

--
-- Chỉ mục cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productID` (`productID`),
  ADD KEY `bill_id` (`bill_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryID`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productID` (`productID`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `productdetails`
--
ALTER TABLE `productdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productID` (`productID`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `products_categoryid_foreign` (`categoryID`);

--
-- Chỉ mục cho bảng `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `bill_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `productdetails`
--
ALTER TABLE `productdetails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `productID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT cho bảng `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customers` (`id`);

--
-- Các ràng buộc cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  ADD CONSTRAINT `bill_details_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`),
  ADD CONSTRAINT `bill_details_ibfk_3` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`bill_id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`);

--
-- Các ràng buộc cho bảng `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `productdetails`
--
ALTER TABLE `productdetails`
  ADD CONSTRAINT `productdetails_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_categoryid_foreign` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
