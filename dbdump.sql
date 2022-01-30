-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2022 at 07:19 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `joindate` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `address`, `birthdate`, `joindate`, `created_at`, `updated_at`) VALUES
(1, 'John', 'Europe', '1993-10-11', '2021-10-12', '2022-01-29 17:56:04', '2022-01-29 10:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2021_12_28_020114_create_posts_table', 1),
(7, '2021_12_28_143726_create_users_table', 1),
(8, '2014_10_12_000000_create_users_table', 2),
(9, '2014_10_12_100000_create_password_resets_table', 2),
(10, '2019_08_19_000000_create_failed_jobs_table', 2),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(12, '2021_12_29_051055_create_users_table', 4),
(13, '2022_01_29_124311_create_employee_table', 5),
(14, '2022_01_29_174637_create_paidleave_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('01602365ad742777ae5182b59023d9d25b23628e5026e9953a399f3af16d4d12cf7ecf944bab926b', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:49:57', '2021-12-28 22:49:57', '2022-12-29 05:49:57'),
('01bd2f28bf1577cb1992a67399da80370fd5befd32a93f1e4b878ebef2f227b0773e20a174d2aae7', 3, 20, 'authToken', '[]', 0, '2022-01-06 10:14:41', '2022-01-06 10:14:41', '2023-01-06 17:14:41'),
('01d72f031051aacdbb99735f3bbde1315ca00459f96dddd6e7e368fe88ad873ec8f850905c128005', 2, 20, 'authToken', '[]', 0, '2021-12-30 18:56:26', '2021-12-30 18:56:26', '2022-12-31 01:56:26'),
('0daaf4ebc256dccf5b97ad037a16dd5b13499f08dfab4193cba840705a7296ad890d22d94f6728f7', 1, 3, 'authToken', '[]', 0, '2021-12-28 08:26:22', '2021-12-28 08:26:22', '2022-12-28 15:26:22'),
('120c1c52558f84777a7c29fa6443b59c4aa52c1ef746b72cc190982eafd98f73eb3edf24927378db', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:55:25', '2021-12-28 22:55:25', '2022-12-29 05:55:25'),
('13ef4733ad170b8bdb81ed5eec4a56f3a728cd93fbd4ae225f9573e34f1f3e16a7ad5eef60a7e75b', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:56:30', '2021-12-28 22:56:30', '2022-12-29 05:56:30'),
('13ff9fd602a9a6e8f18498135e812f5916fa800366b15f20fcf136935a238a13d9c14b02f0589e3a', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:19:21', '2021-12-30 20:19:21', '2022-12-31 03:19:21'),
('14a8d9ad4b0f8d0dc49c35356cf0fd14723133fd107d059d58d2aeffca42fe06f87705b33da4bd66', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:00:06', '2021-12-30 20:00:06', '2022-12-31 03:00:06'),
('16a7375ad6959eee4cf479b2d551bf39cba2cffc828bfd9608ccb6cceaab198da158f8566d8600c8', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:22:50', '2021-12-30 20:22:50', '2022-12-31 03:22:50'),
('1b9ee16b5a6a89e7365f2a776c074b75139b45b4c6adede875441553e6f882cf48ff03702ced89c3', 1, 3, 'authToken', '[]', 0, '2021-12-28 10:26:58', '2021-12-28 10:26:58', '2022-12-28 17:26:58'),
('1c72ae8c3f7c4e3d721557be61b520a1c3e78d4cf8a274de5477787facc1328534a03146fa9d63c5', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:53:03', '2021-12-28 22:53:03', '2022-12-29 05:53:03'),
('206e91586fe0e93514bf292b0fdfc5020ad92d60b6ca8731b482922ce9a5f68f0f638afa29129412', 2, 20, 'authToken', '[]', 0, '2021-12-30 18:44:45', '2021-12-30 18:44:45', '2022-12-31 01:44:45'),
('253ec4265dc8cbc3eeaa360693e4deedd22e715a0293864f5c719eaa531628b78f6ef1be57acc77e', 1, 3, 'authToken', '[]', 0, '2021-12-28 10:22:55', '2021-12-28 10:22:55', '2022-12-28 17:22:55'),
('2af1e74e2b3c8376d04a5945c4c51c69d9e63f7fafbcacbcef44363f4fc0f81dc1ec5e1d35f303d3', 2, 20, 'authToken', '[]', 0, '2022-01-29 14:48:10', '2022-01-29 14:48:10', '2023-01-29 21:48:10'),
('2c882ad39655200cce063ce32ff4017fdab0ece8e5db4833ceea5c922f78a654fa1e2e8e9179044f', 1, 3, 'authToken', '[]', 0, '2021-12-28 10:31:04', '2021-12-28 10:31:04', '2022-12-28 17:31:04'),
('2eba905fc0df8e2eff1160335fe6dccc0328b87faf61742ef3370b831ca7c5e3d607ff0a7be11b8a', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:20:18', '2021-12-30 20:20:18', '2022-12-31 03:20:18'),
('302cee2ccb1da7b3bd9366c539ac8e45c98545aff46d4576b0ce19ae5f5eca05e8eeda85f90f509e', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:21:56', '2021-12-30 20:21:56', '2022-12-31 03:21:56'),
('30d2ef8810aedd586152a5af8cf645cc0997f8472c070dd5c1e613b589b53da41e8576f787527a8b', 2, 20, 'authToken', '[]', 0, '2021-12-30 18:51:26', '2021-12-30 18:51:26', '2022-12-31 01:51:26'),
('330d5ea3a8b133539b1d25f4074e1a0eaa4939f256e2d2c05dba662dd3545687153690a5008ee856', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:46:45', '2021-12-28 22:46:45', '2022-12-29 05:46:45'),
('35585f05e9c0590e8e62860992379895690de315f8b5436adb955baff2a0a7f69dba7824f038733e', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:49:28', '2021-12-28 22:49:28', '2022-12-29 05:49:28'),
('372fe37a39931ac93d8129cccd78bb0de82f1a8880356d3c699bdd1a8cc1938119bb521e1335414e', 2, 20, 'authToken', '[]', 0, '2021-12-30 19:18:40', '2021-12-30 19:18:40', '2022-12-31 02:18:40'),
('375c7a278e06fe7713c50521b83498440ca8092f90798bc0b8ced4d09a9721b34b8026906a67ae5f', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:21:49', '2021-12-30 20:21:49', '2022-12-31 03:21:49'),
('46440eef995852d4734e4cbfa02bc15c1e71523782fbf1fb4ec64d8d38ee168a004d4d3d0beef3c8', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:21:34', '2021-12-30 20:21:34', '2022-12-31 03:21:34'),
('46760e80b0bac07a9d5d425de63d816112cf85cc6653828da4b5af0c4ad63db1dc5aed14ae8625da', 2, 20, 'authToken', '[]', 0, '2021-12-30 18:56:42', '2021-12-30 18:56:42', '2022-12-31 01:56:42'),
('478ac4ca8d4880d5d0840e4b63b5f5c0a36858e67b9fb3ddb61bd1a2c67c032e6978eb973b4393bb', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:56:16', '2021-12-28 22:56:16', '2022-12-29 05:56:16'),
('492e333b19b3eefeabf5211b811b4e0c1aa8e7332d5dbf5a13798db4296ac35b73c923a72903ed3b', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:23:45', '2021-12-30 20:23:45', '2022-12-31 03:23:45'),
('4c424605c53b0c5fd5279acd9cefde510b67456b38661a55de5f356b67d67be0f9b6e8e052ea7b8f', 1, 3, 'authToken', '[]', 0, '2021-12-28 10:30:31', '2021-12-28 10:30:31', '2022-12-28 17:30:31'),
('4db29fd1573a7275ec7549495a00c600c69f28f7624cdc142a67a6665bbc503df2de208931eb9f1a', 2, 20, 'authToken', '[]', 0, '2021-12-30 18:51:34', '2021-12-30 18:51:34', '2022-12-31 01:51:34'),
('5736cf59b02866d7dae957146b9fbd39a556e9d4d4d329ddaab1dc62a24efb47612ed0b09dc9c786', 2, 20, 'authToken', '[]', 0, '2021-12-30 18:54:20', '2021-12-30 18:54:20', '2022-12-31 01:54:20'),
('6c9df9a8b3c5ac627ed11492170c49a54acc698585514a5485713bad58c3b94beafbf3bf76e2ef29', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:58:24', '2021-12-28 22:58:24', '2022-12-29 05:58:24'),
('73017601e11dadef7da5e761d65fde93a9205d37ac005132145673827fcf77900058a0b96678fee6', 2, 20, 'authToken', '[]', 0, '2021-12-30 18:57:52', '2021-12-30 18:57:52', '2022-12-31 01:57:52'),
('754c55449b76912dc445ea6d9032763e8e5b6ac2557cb717750be0ac5e36ef465c76db09df6a7376', 1, 20, 'authToken', '[]', 0, '2021-12-28 22:41:30', '2021-12-28 22:41:30', '2022-12-29 05:41:30'),
('766476e7d81082621e8fdc8320e1a299d0feffa223fff730cb105a2e6a60718492c27b8afbef78e4', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:49:38', '2021-12-28 22:49:38', '2022-12-29 05:49:38'),
('77b747e9fafdd86289a60517812a8bd88429c601c887f85167044ab0690c99e84e935dd4a17ff90b', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:57:39', '2021-12-28 22:57:39', '2022-12-29 05:57:39'),
('821e319efcd0a370d3161829335069df430b25ff6355cdbd0e71c7d25b02fbaed4387befe6e89e20', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:53:32', '2021-12-28 22:53:32', '2022-12-29 05:53:32'),
('8eb72b724796c9c24a57c35dbcad9e0f3c1a3da5faeb12a4516c457f5e1c816b7d2477fa8f1cf3de', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:24:01', '2021-12-30 20:24:01', '2022-12-31 03:24:01'),
('8f95a934079d591395df86bf8d465d526c4a5970d1d484ea6b86d74d49d3720a61a38425cb4514ad', 2, 20, 'authToken', '[]', 0, '2021-12-30 18:50:04', '2021-12-30 18:50:04', '2022-12-31 01:50:04'),
('90b97054e75cfc47487d51c34b3a1f668f40b80e455a8dce789ed20d3ae1ca314a0420a385de526d', 2, 20, 'authToken', '[]', 0, '2021-12-30 19:58:35', '2021-12-30 19:58:35', '2022-12-31 02:58:35'),
('96b24fd9cd4ffe70e4379b0cb98458003a9c898e34b76c88a9fe932133b34c38cd50ab738c4bb2d7', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:24:41', '2021-12-30 20:24:41', '2022-12-31 03:24:41'),
('98843f6315227d5228a3d96ffe938d894ec05eaddcf4077a1072de5dc508657cd7691a243752da9b', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:00:31', '2021-12-30 20:00:31', '2022-12-31 03:00:31'),
('9dec3e92e14708d534e77fda3746a1df1dbbcd3e1c33363670a08f8445b7d59036dfbd473b3e0737', 2, 20, 'authToken', '[]', 0, '2021-12-30 18:57:11', '2021-12-30 18:57:11', '2022-12-31 01:57:11'),
('9ed9dadb9de9c0176f64a348b0feef3a79cf9825a0116b22fd21056f55f05e050bc550b03e8770bb', 2, 20, 'authToken', '[]', 0, '2022-01-06 09:50:50', '2022-01-06 09:50:50', '2023-01-06 16:50:50'),
('a545979d09241f86b4a77c29b2de00cb2a6dce0e42af17b52a1dde6c2a79b704daf5f7a6d53fcaff', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:24:27', '2021-12-30 20:24:27', '2022-12-31 03:24:27'),
('a6f4550c87cf4c0db70c19a1f1f2ff0ec360349cefd7a67fad3ea34b0e5d38c2729cdf9624589ef1', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:55:17', '2021-12-28 22:55:17', '2022-12-29 05:55:17'),
('ab78e7b9700c492cf753f5f75aae9f4081cc7743547a076e8de09e3b27a93d6136de5158af568a6a', 2, 3, 'authToken', '[]', 0, '2021-12-28 10:33:25', '2021-12-28 10:33:25', '2022-12-28 17:33:25'),
('ad3a38be8e204d55757af7701402f0c35b55cd669c50bbf26909edaf7065dce3063ce09696be4cea', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:50:42', '2021-12-28 22:50:42', '2022-12-29 05:50:42'),
('adeb280adf56db53b4818dd69018e8d281756fa5e969f134c92cf4964d576a5c6324ece9941e3993', 1, 3, 'authToken', '[]', 0, '2021-12-28 10:29:04', '2021-12-28 10:29:04', '2022-12-28 17:29:04'),
('af4ffd3b084774b466f5954fb6f77e8d4aca23d362d01751e02e5a81d1d9a7f419d6a8e6e6fb87a2', 2, 20, 'authToken', '[]', 0, '2021-12-30 18:57:58', '2021-12-30 18:57:58', '2022-12-31 01:57:58'),
('b60b94cf7f148d0bb71a0c1606d1424774163ca68e748b0925fe35067e4e0d6ca228883a1fb9276b', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:21:02', '2021-12-30 20:21:02', '2022-12-31 03:21:02'),
('b6b201b3339e4dc5546522839c8d876e2ee8dcd744c1056926cf30d8d2e82072f56efaf07a3bff2e', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:55:46', '2021-12-28 22:55:46', '2022-12-29 05:55:46'),
('b8d80f3a2ec58d86f8c184abfdd2600ddf25038deb4facefbb7382172ab3b301ba4c64256408cf5b', 2, 20, 'authToken', '[]', 0, '2021-12-30 19:58:45', '2021-12-30 19:58:45', '2022-12-31 02:58:45'),
('b95a2692b5d7d28b3a672147cdb341df0fb62b2984f3bb1dca83a933dd07f5ae115bf4a74d5336a0', 1, 20, 'authToken', '[]', 0, '2021-12-28 22:24:30', '2021-12-28 22:24:30', '2022-12-29 05:24:30'),
('b9ae6bd2f89cab179568fa29b3e04830ac9c74fb785edd524b97a338dbf33f7d027a157b28eb20ca', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:21:22', '2021-12-30 20:21:22', '2022-12-31 03:21:22'),
('bb852e911e2a51458dc9b0ab58aa7caba20491ee45910568c68b975be18d367c1e45a18f25f4be6d', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:22:03', '2021-12-30 20:22:03', '2022-12-31 03:22:03'),
('bd5ce9ab6d23de782f32c9f2de463663d6eb0a186dce966c89f8d806a735d76bd1b44471a6f48dcb', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:25:06', '2021-12-30 20:25:06', '2022-12-31 03:25:06'),
('c98691c05e281d4690e6ad30b7a011ff2add0d3a1f359b277e625e796fdc0798c74c4fe814bc9cdb', 2, 3, 'authToken', '[]', 0, '2021-12-28 10:35:19', '2021-12-28 10:35:19', '2022-12-28 17:35:19'),
('ccb0ba3c8fb50bf45a21c0c26722909f3f458bb439ccc436d9fff3a2656a0797d25d6f38fb44b472', 2, 20, 'authToken', '[]', 0, '2021-12-30 18:45:05', '2021-12-30 18:45:05', '2022-12-31 01:45:05'),
('ce89e124f43775ebccd9586556453e16cdf8704d072eee07988588e2832d725212da622495d9d45a', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:23:01', '2021-12-30 20:23:01', '2022-12-31 03:23:01'),
('d868c1cf378fcf12656b44f7e59a1a97f686474f9060c090e4c98906eb453dda30171bfec632946c', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:28:16', '2021-12-30 20:28:16', '2022-12-31 03:28:16'),
('e173abd3dbc703c3edcab26bf9adb100c4f4981654bb7355c466fc095df1fe68789473c2cb7a0a4f', 1, 20, 'authToken', '[]', 0, '2021-12-28 22:42:02', '2021-12-28 22:42:02', '2022-12-29 05:42:02'),
('e2e5bafcea04c4a087004aff52c8015e02d6e2bc3b9f2ec38189a01366458a622c070c613fa78966', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:21:54', '2021-12-30 20:21:54', '2022-12-31 03:21:54'),
('e51f3772b344a1fed5e53f55845ca3a49ea830b2ba0854b0efc23d7974fcfe02e06b969081f6b7e7', 2, 20, 'authToken', '[]', 0, '2021-12-30 19:19:21', '2021-12-30 19:19:21', '2022-12-31 02:19:21'),
('e642cc8630cc44768197a5ec2069e79d992dd75f1fdf026ec6ccc8a027acb8c74259016d7a5351a6', 2, 20, 'authToken', '[]', 0, '2021-12-28 23:08:27', '2021-12-28 23:08:27', '2022-12-29 06:08:27'),
('e98cfabe8cae97e9e9a5d6da7e4a422c4189ec5ca94ebd8a6c567119cc96b98365e16d10f326f8e7', 2, 20, 'authToken', '[]', 0, '2021-12-28 22:58:34', '2021-12-28 22:58:34', '2022-12-29 05:58:34'),
('ed6e91cafa7bfae0b042848f6fe089bd0213055ea948483c396af1fd30f939026edf5f285d81a689', 2, 20, 'authToken', '[]', 0, '2022-01-29 13:07:14', '2022-01-29 13:07:14', '2023-01-29 20:07:14'),
('fa6196254417085aceded13b3bea2416f0da194d6853a3a470c80ebf29e5e478dbd19739fb4c3ca7', 2, 20, 'authToken', '[]', 0, '2021-12-30 20:22:15', '2021-12-30 20:22:15', '2022-12-31 03:22:15'),
('fb7b082f90ebd3ec8530b7bb4a0d52ce92b7fa2505116213b54def48baa98cc8fc83fdb71f0d64fa', 2, 20, 'authToken', '[]', 0, '2021-12-30 18:51:16', '2021-12-30 18:51:16', '2022-12-31 01:51:16'),
('fc3269bc028691660b39be69b3fb5d052a8fbe21c9a45c5a1025df46f0596f75fcb0c5c7cfdddfc4', 1, 3, 'authToken', '[]', 0, '2021-12-28 10:30:29', '2021-12-28 10:30:29', '2022-12-28 17:30:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'W0SMKE4NyCwm4PFNMyPCjIyGvizyNf0u9DZq35zy', NULL, 'http://localhost', 1, 0, 0, '2021-12-28 07:49:16', '2021-12-28 07:49:16'),
(2, NULL, 'Laravel Password Grant Client', 'QlwaO7KKoumc132NopGUJeMUhBik5vCewBag2Ig1', 'users', 'http://localhost', 0, 1, 0, '2021-12-28 07:49:16', '2021-12-28 07:49:16'),
(3, NULL, 'Laravel Personal Access Client', 'rZ6MzBYEFmtzIsy8JkOzomZs6XCG9oJIAaQKEI8R', NULL, 'http://localhost', 1, 0, 0, '2021-12-28 08:09:33', '2021-12-28 08:09:33'),
(4, NULL, 'Laravel Password Grant Client', 'nf58tHJCndhHYJiTwyMjIqMsH9UndlWRBZc2ztGR', 'users', 'http://localhost', 0, 1, 0, '2021-12-28 08:09:33', '2021-12-28 08:09:33'),
(5, NULL, 'Laravel Personal Access Client', 'QAqdyluO1X9YyVv948DPbB2BMYHgajHFSLoDqQYr', NULL, 'http://localhost', 1, 0, 0, '2021-12-28 21:44:35', '2021-12-28 21:44:35'),
(6, NULL, 'Laravel Password Grant Client', '1nTxvMKmJvpzZPPLRhVhNo4OX59UDYDIp6zOlrKG', NULL, 'http://localhost', 0, 1, 0, '2021-12-28 21:44:35', '2021-12-28 21:44:35'),
(7, NULL, 'Laravel Personal Access Client', '8OD2jUscFWR06wWN6LvCi2qD3aMFjOmNTL8ldJiK', NULL, 'http://localhost', 1, 0, 0, '2021-12-28 21:47:38', '2021-12-28 21:47:38'),
(8, NULL, 'Laravel Password Grant Client', 'QhzP9N3CKrAeyhw7N6PJGB2uSajl3rLELxIU2frf', NULL, 'http://localhost', 0, 1, 0, '2021-12-28 21:47:38', '2021-12-28 21:47:38'),
(9, NULL, 'Laravel Personal Access Client', '25eAfuCOSei7RjlyAreuZdPUfLf22lFPu7BomiI2', NULL, 'http://localhost', 1, 0, 0, '2021-12-28 21:47:55', '2021-12-28 21:47:55'),
(10, NULL, 'Laravel Password Grant Client', 'KqsylHe5ccG1107Wj2jgQDz0R1lUr4uQFE43f1eB', NULL, 'http://localhost', 0, 1, 0, '2021-12-28 21:47:55', '2021-12-28 21:47:55'),
(11, NULL, 'Laravel Personal Access Client', '4vGr5TGq2W6pD4uPHmBAMV0a7mAKpptw5QBIrEJM', NULL, 'http://localhost', 1, 0, 0, '2021-12-28 21:48:40', '2021-12-28 21:48:40'),
(12, NULL, 'Laravel Password Grant Client', 'eqFsZTaOqTUXE6b5pLWpq62y7tNMypmJDrZ5d6v4', NULL, 'http://localhost', 0, 1, 0, '2021-12-28 21:48:40', '2021-12-28 21:48:40'),
(13, NULL, 'fajar', '66jLFXvVV1GLYgBwZjlzUDoQA6ECh1mObce9o65w', NULL, 'http://localhost', 1, 0, 0, '2021-12-28 21:48:56', '2021-12-28 21:48:56'),
(14, NULL, 'Laravel Personal Access Client', 'hqF8vaBozo1PuAL1NM8Uxs5Af6JDecsTkFNizQl2', NULL, 'http://localhost', 1, 0, 0, '2021-12-28 21:49:06', '2021-12-28 21:49:06'),
(15, NULL, 'Laravel Password Grant Client', 'VTKO0iCGpuHiv1u1AWDeRGGo7d0mu4aCpjXN3f7k', NULL, 'http://localhost', 0, 1, 0, '2021-12-28 21:49:06', '2021-12-28 21:49:06'),
(16, NULL, 'Laravel Personal Access Client', '5He9vk0ybw4OX0ccWCms4UL5vXj51EBva2SgtOjt', NULL, 'http://localhost', 1, 0, 0, '2021-12-28 21:49:31', '2021-12-28 21:49:31'),
(17, NULL, 'Laravel Password Grant Client', 'AZ9y66DpcLXv2rCT9YqrbXASupqL9IhDipd2530d', NULL, 'http://localhost', 0, 1, 0, '2021-12-28 21:49:31', '2021-12-28 21:49:31'),
(18, NULL, 'Laravel Personal Access Client', 'KLTSPOSjQgUcsj6Mz5Uc1n6yNzYYQlRG4q0OUAiE', NULL, 'http://localhost', 1, 0, 0, '2021-12-28 21:58:00', '2021-12-28 21:58:00'),
(19, NULL, 'Laravel Password Grant Client', 'Zbq2n7Uft9f8556dwtHSwYyThL89p1cbM8bxieOD', 'users', 'http://localhost', 0, 1, 0, '2021-12-28 21:58:00', '2021-12-28 21:58:00'),
(20, NULL, 'Laravel Personal Access Client', 'W0VOxvTEUCUzVkxvR116W0WE0Q2ozVhmVG7KK0uz', NULL, 'http://localhost', 1, 0, 0, '2021-12-28 22:10:02', '2021-12-28 22:10:02'),
(21, NULL, 'Laravel Password Grant Client', 'Eg7MmjOiOU25PGwqWmv7kmiMdQJL0A3qJZvBIudv', 'users', 'http://localhost', 0, 1, 0, '2021-12-28 22:10:02', '2021-12-28 22:10:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-12-28 07:49:16', '2021-12-28 07:49:16'),
(2, 3, '2021-12-28 08:09:33', '2021-12-28 08:09:33'),
(3, 5, '2021-12-28 21:44:35', '2021-12-28 21:44:35'),
(4, 7, '2021-12-28 21:47:38', '2021-12-28 21:47:38'),
(5, 9, '2021-12-28 21:47:55', '2021-12-28 21:47:55'),
(6, 11, '2021-12-28 21:48:40', '2021-12-28 21:48:40'),
(7, 13, '2021-12-28 21:48:56', '2021-12-28 21:48:56'),
(8, 14, '2021-12-28 21:49:06', '2021-12-28 21:49:06'),
(9, 16, '2021-12-28 21:49:31', '2021-12-28 21:49:31'),
(10, 18, '2021-12-28 21:58:00', '2021-12-28 21:58:00'),
(11, 20, '2021-12-28 22:10:02', '2021-12-28 22:10:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paid_leaves`
--

CREATE TABLE `paid_leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idpegawai` bigint(20) NOT NULL,
  `tglcuti` date DEFAULT NULL,
  `lamacuti` bigint(20) DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paid_leaves`
--

INSERT INTO `paid_leaves` (`id`, `idpegawai`, `tglcuti`, `lamacuti`, `keterangan`, `created_at`, `updated_at`) VALUES
(3, 1, '2020-01-01', 2, 'a', '2022-01-29 12:15:04', '2022-01-29 12:15:04'),
(4, 1, '2021-09-01', 5, 'acara keluarga', '2022-01-29 15:29:03', '2022-01-29 15:29:03');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Indomie', 'Mie Instan', '2021-12-28 07:48:33', '2022-01-06 20:50:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `api_token`, `created_at`, `updated_at`) VALUES
(1, 'Fika Ridaul Maulayya', 'test@gmail.com', NULL, '', NULL, '', '2021-12-28 22:23:52', '2021-12-28 22:23:52'),
(2, 'Fika Ridaul Maulayya', 'satria@mail.com', NULL, '$2y$10$0ypGBhDuUFtAQeEefDTAXOEFgO/hWZQMr6nQPkoppmZUXcL7p/4k6', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyMCIsImp0aSI6IjJhZjFlNzRlMmIzYzgzNzZkMDRhNTk0NWM0YzUxYzY5ZDllNjNmN2ZhZmJjYWNiY2VmNDQzNjNmNGZjMGY4MWRjMWVjNWUxZDM1ZjMwM2QzIiwiaWF0IjoxNjQzNDkyODkwLjI1MDkyNywibmJmIjoxNjQzNDkyODkwLjI1MDkzLCJleHAiOjE2NzUwMjg4OTAuMjQ2Mjk4LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.wOdOghmwZW5iX1Khe20oKZ97p_5c1Jt5BmmWl2lKyyjPAzgsq3E0SCAtblY_lEf-qfijpy0CriEFdOoTbQbHygHGWQKXnxnmgayXb7kT1LatdzrKOTxUt0gLrtOkWdBQM274dfjAGAm_wBjvuTgxTpsiGg4s6V0U8OrhpnFAYJ6X4APNX7egPXMV5sHkoWkGDOEn0oimArKUqIvaDjqXWlAnUgyW-hE1Bn5vSZs0u_wYGs-jcbaYyKTZtnqmVjrpj8l-aby1zoelc0xIyCnqXLy_PtafrJ3Pk2Ok8NLHBXqyGn_7-NaAtPsgt6uYMnUkxCnYMfFb1lhtqDHeivXU7b6mQRAgT6OsSUMwj8y9gXD7--W2iHOz-5BcW4haiTOg3ynnRN5F_MZrerPKnRhHg5S1E4jHd9LkmKvtn51Tptb_7N91t5WTTnvheOckKFooWHFni2qbFF0Vzmrm4ftXSdD9sAcnjHy6IRweS5eMS5Rvy_IlcS_lLFkKjxMBVugh6tuO_uUZoeJLdNQGt4w0w7t4SIGUw6Awrz9K8R3SvbSk88RVCVG4Vs_yRUsD7TE7KrgykeKaAJbFYBGCLxIZkWJWirzg4gxVrxLkpua9gz_FZOtTpSS-NsbUOJwf2y6HWu8yBQSZ6pH6m3vCYkeDoKfcRZ52PT7x-PdqIJ4VEyU', '2021-12-28 22:44:19', '2022-01-29 14:48:10'),
(3, 'Fika Ridaul Maulayya', 'satria@gmail.com', NULL, '$2y$10$cJH/kYeacRQ.EYX7zThcUOVqShCLMVOuzbqZq3W0YEXLF9tjcYUxe', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyMCIsImp0aSI6IjAxYmQyZjI4YmYxNTc3Y2IxOTkyYTY3Mzk5ZGE4MDM3MGZkNWJlZmQzMmE5M2YxZTRiODc4ZWJlZjJmMjI3YjA3NzNlMjBhMTc0ZDJhYWU3IiwiaWF0IjoxNjQxNDg5MjgxLjk2NzcxNywibmJmIjoxNjQxNDg5MjgxLjk2NzcyMSwiZXhwIjoxNjczMDI1MjgxLjk2MzM0Nywic3ViIjoiMyIsInNjb3BlcyI6W119.02sTVcqAlrTVq8SJClO96Fjmlm-30SHsfeUOqDzdW1AatE-yAs02q4ULpBMSRgctuqdHpIvQ7vG5zjfZsvshjFOsvFXyS9VMSPThyFFWmuDUn15k2g8cVK0FLFZZAtIsnPgRRd0Ybm-XqoWzMGuTBgotJ8Qa-QTd0uDd02kGU_sqDVONdKSH1ikCFLK3KialBavviBu_DotUjphla3FIsBRv-v-VXOikSAl1QZNwr2w0mKwyRIpXjxQrIOM_TcQ-fU_BTETA_Y3O50isswJk0sFpZa_VnLUKtj_VIRfMZQg03ECNPkiZTVCXoHyOF0iEiu82b3VbvqlqKQZx32JCCqAuvXg37Ehrc8CT-byjDrJdJ9Qw0DyxPlDSqfCDP8caJIj0CL5xIkS3GV5_pzNyebegnSTEK7zoCE6nUuaWe-saaQQAtA8Xmx_pYAooluVXskDBZubMCtxlZXEfP78HZrGZo672sEG-d9pRd7JQo3t25QScbrICS6m14OwoxfBUTFHT_zpoN95ImrYhN4A7NwS2PjQF8T7vVyFooPsGP7rQQ-yphcoH1rMPAhvog6M2oqV-ydz_ibQoVleehDs8q9aIadR-Awf56lOL8dbzIhDxGULiV6sJ_4Yg3SAG-z-avVQGiNxW-X4gteZTuX7DK-FN_dcdPv8PQxwtfxdRCCk', '2022-01-06 10:02:22', '2022-01-06 10:14:41'),
(15, 'joko', 'joko@mail.com', NULL, '$2y$10$V5WCXVQvYr5Sjnwhya1L0OvJJ8yKS8ML1CTN87KYFqJJ.B8yjlQoS', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyMCIsImp0aSI6IjNkYmU2NjkxMzlkY2QzNTg3YjI3NjcwMmU4NjllMDEyMGY2ODMyM2IzZGYyNDI3NGFhZWI4MGExNGRhMzdkNzY0ODExZWMzMGViZmY3YjRjIiwiaWF0IjoxNjQxNTI4MTIwLjY0NzkzNSwibmJmIjoxNjQxNTI4MTIwLjY0NzkzOCwiZXhwIjoxNjczMDY0MTIwLjY0NDM0OCwic3ViIjoiMTUiLCJzY29wZXMiOltdfQ.t6PMpl4ltc7dU60c7hcRfe80CfzvCUbp_i00aTbEyKQ0FfZ1AddfdmSlb60IMKiO0L4YN9o3DFTJQM6nyIE8ZsSQ2Mm_3L8EEfIaTRgiJj4abgxakhSOt6b7u-XZGu5dyj84YCvSSiVv9hGeTfSdk8HwLtzBMRXukb6AqAnSzyy3wJ7IeYOoj5RNZszAF5GRkdTgqCq15Wa8Yq5yVpY99AkVtBKLaZ7MF_ScnFVbCe1vRJXLez61rji2e0Xciifmq0QH_T4Z8NAGmvmPyTlLsNQrJpiHF3XYcyA8kCeR7728MrPQ6XBhVS3hK1YuSTOKW1BBNgg_SZkXHugSUneddBtxkRxVCEqYRX87-xeroXj-u4-V4zsdTGDOjQQXiEWJlay6ilDLKOEvb5V6GIt7KHvyP8_0in5WXU4aq8SEKRyz8ET8M-0IB7yWkOk1JBK3ElVTtrKShpWdFa0LoFM7BJaO8XeOQ4z4Pti23sJvXiagyyCYPJ2Tm8pXHodacmAEwaMF-X7HDzF8GZzPWLBPPPvNejys2MLmujYp42XkDzT2W9hl3miwHOqgmgFkaVcQOmfsBkVc_JvB5KB25rm8Hx3zsHpZihssnxfwn-jRmAvYEnbb0Mb9LGB0AFm1ZPBWRTosCE8zGqJ2wQzJGG3YwbSShxUVXF4OPk3AYysFzhs', '2022-01-06 10:26:16', '2022-01-06 21:02:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `paid_leaves`
--
ALTER TABLE `paid_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `paid_leaves`
--
ALTER TABLE `paid_leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
