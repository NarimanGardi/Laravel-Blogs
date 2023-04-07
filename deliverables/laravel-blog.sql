-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2023 at 10:01 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title_en`, `title_ar`, `title_ku`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'quod', 'non', 'nam', '2023-04-07 16:58:38', '2023-04-07 16:58:38', NULL),
(2, 'enim', 'eaque', 'accusantium', '2023-04-07 16:58:39', '2023-04-07 16:58:39', NULL),
(3, 'rerum', 'ut', 'optio', '2023-04-07 16:58:39', '2023-04-07 16:58:39', NULL),
(4, 'repellendus', 'architecto', 'nihil', '2023-04-07 16:58:39', '2023-04-07 16:58:39', NULL),
(5, 'amet', 'ab', 'ipsam', '2023-04-07 16:58:39', '2023-04-07 16:58:39', NULL);

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
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Category', 1, 'a540168f-0031-47e9-a93c-b245fe6fb9d7', 'category', '400x200', '400x200.jpeg', 'image/jpeg', 'public', 'public', 38108, '[]', '[]', '{\"thumb-200\":true,\"thumb-38\":true}', '[]', 1, '2023-04-07 16:58:42', '2023-04-07 16:58:44'),
(2, 'App\\Models\\Category', 2, 'e1ba1c2c-c6ed-468e-9655-3fafa0d29abf', 'category', '400x200', '400x200.jpeg', 'image/jpeg', 'public', 'public', 12297, '[]', '[]', '{\"thumb-200\":true,\"thumb-38\":true}', '[]', 1, '2023-04-07 16:58:45', '2023-04-07 16:58:46'),
(3, 'App\\Models\\Category', 3, 'aacd937a-19bc-4017-bda0-4c1be0dd1ab1', 'category', '400x200', '400x200.jpeg', 'image/jpeg', 'public', 'public', 10043, '[]', '[]', '{\"thumb-200\":true,\"thumb-38\":true}', '[]', 1, '2023-04-07 16:58:47', '2023-04-07 16:58:48'),
(4, 'App\\Models\\Category', 4, 'f9203ecc-2792-431d-8e03-0f87f85dac47', 'category', '400x200', '400x200.jpeg', 'image/jpeg', 'public', 'public', 16008, '[]', '[]', '{\"thumb-200\":true,\"thumb-38\":true}', '[]', 1, '2023-04-07 16:58:49', '2023-04-07 16:58:50'),
(5, 'App\\Models\\Category', 5, '73f390d5-649e-406a-91eb-41921f349dd1', 'category', '400x200', '400x200.jpeg', 'image/jpeg', 'public', 'public', 16008, '[]', '[]', '{\"thumb-200\":true,\"thumb-38\":true}', '[]', 1, '2023-04-07 16:58:51', '2023-04-07 16:58:52'),
(6, 'App\\Models\\Post', 1, '1ed84fe5-0960-40ce-8101-985e492ef7dd', 'post', '1200x630', '1200x630.jpeg', 'image/jpeg', 'public', 'public', 172686, '[]', '[]', '{\"thumb-300\":true,\"thumb-38\":true}', '[]', 1, '2023-04-07 16:58:57', '2023-04-07 16:58:58'),
(7, 'App\\Models\\Post', 2, '64fa5261-2061-44c4-ad08-8ce31cb4e087', 'post', '1200x630', '1200x630.jpeg', 'image/jpeg', 'public', 'public', 88825, '[]', '[]', '{\"thumb-300\":true,\"thumb-38\":true}', '[]', 1, '2023-04-07 16:59:02', '2023-04-07 16:59:03'),
(8, 'App\\Models\\Post', 3, '35606ee5-73c4-4848-bb90-e804a121bd07', 'post', '1200x630', '1200x630.jpeg', 'image/jpeg', 'public', 'public', 111276, '[]', '[]', '{\"thumb-300\":true,\"thumb-38\":true}', '[]', 1, '2023-04-07 16:59:04', '2023-04-07 16:59:05'),
(9, 'App\\Models\\Post', 4, '7ff7a76c-de11-4dbc-be6e-87bec72638c3', 'post', '1200x630', '1200x630.jpeg', 'image/jpeg', 'public', 'public', 110617, '[]', '[]', '{\"thumb-300\":true,\"thumb-38\":true}', '[]', 1, '2023-04-07 16:59:08', '2023-04-07 16:59:08'),
(10, 'App\\Models\\Post', 5, 'f2de242d-2604-452b-bbc9-051cac01948a', 'post', '1200x630', '1200x630.jpeg', 'image/jpeg', 'public', 'public', 173739, '[]', '[]', '{\"thumb-300\":true,\"thumb-38\":true}', '[]', 1, '2023-04-07 16:59:11', '2023-04-07 16:59:12'),
(11, 'App\\Models\\Post', 6, 'f95c26e7-23f1-4778-a31f-5c063f579e82', 'post', '1200x630', '1200x630.jpeg', 'image/jpeg', 'public', 'public', 77414, '[]', '[]', '{\"thumb-300\":true,\"thumb-38\":true}', '[]', 1, '2023-04-07 16:59:15', '2023-04-07 16:59:16'),
(12, 'App\\Models\\Post', 7, 'f789bc91-e5f0-4a64-979a-df70f68323a3', 'post', '1200x630', '1200x630.jpeg', 'image/jpeg', 'public', 'public', 124579, '[]', '[]', '{\"thumb-300\":true,\"thumb-38\":true}', '[]', 1, '2023-04-07 16:59:17', '2023-04-07 16:59:18');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_04_05_112016_create_media_table', 1),
(6, '2023_04_05_172105_create_permission_tables', 1),
(7, '2023_04_06_203854_create_categories_table', 1),
(8, '2023_04_06_225311_create_posts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12);

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage-user', 'web', '2023-04-07 16:58:34', '2023-04-07 16:58:34'),
(2, 'view-user', 'web', '2023-04-07 16:58:34', '2023-04-07 16:58:34'),
(3, 'create-user', 'web', '2023-04-07 16:58:34', '2023-04-07 16:58:34'),
(4, 'edit-user', 'web', '2023-04-07 16:58:34', '2023-04-07 16:58:34'),
(5, 'delete-user', 'web', '2023-04-07 16:58:35', '2023-04-07 16:58:35'),
(6, 'manager-category', 'web', '2023-04-07 16:58:35', '2023-04-07 16:58:35'),
(7, 'view-category', 'web', '2023-04-07 16:58:35', '2023-04-07 16:58:35'),
(8, 'create-category', 'web', '2023-04-07 16:58:35', '2023-04-07 16:58:35'),
(9, 'edit-category', 'web', '2023-04-07 16:58:35', '2023-04-07 16:58:35'),
(10, 'delete-category', 'web', '2023-04-07 16:58:35', '2023-04-07 16:58:35'),
(11, 'manage-post', 'web', '2023-04-07 16:58:35', '2023-04-07 16:58:35'),
(12, 'view-post', 'web', '2023-04-07 16:58:35', '2023-04-07 16:58:35'),
(13, 'create-post', 'web', '2023-04-07 16:58:35', '2023-04-07 16:58:35'),
(14, 'edit-post', 'web', '2023-04-07 16:58:35', '2023-04-07 16:58:35'),
(15, 'delete-post', 'web', '2023-04-07 16:58:35', '2023-04-07 16:58:35');

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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_ku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title_en`, `title_ar`, `title_ku`, `content_en`, `content_ar`, `content_ku`, `category_id`, `author_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Qui aut et.', 'Sed quia ut.', 'Et quisquam dolorem error quas.', 'Placeat natus consectetur sit architecto sit eaque dignissimos.', 'Et exercitationem blanditiis facilis incidunt nam placeat ab enim nulla molestias et in provident.', 'Architecto ad dignissimos adipisci rem explicabo ut.', 1, 7, '2023-04-07 16:58:52', '2023-04-07 16:58:52', NULL),
(2, 'Est possimus aut et autem.', 'Vel sed minima deleniti aliquid.', 'Est rem dolorem incidunt.', 'Dicta sunt dolorem qui mollitia ea quo tenetur recusandae labore et soluta iste sunt.', 'Veniam est aut et aliquam voluptas illum soluta necessitatibus ipsam ipsam facere similique quidem.', 'Quasi et impedit quis corporis dignissimos quas officiis cupiditate rerum.', 3, 1, '2023-04-07 16:58:52', '2023-04-07 16:58:52', NULL),
(3, 'Tenetur repudiandae pariatur sapiente.', 'Sit maiores distinctio esse.', 'Sed unde.', 'Sed nobis architecto culpa earum facere laboriosam ratione temporibus nihil deserunt placeat.', 'Commodi culpa maiores vero omnis mollitia eum.', 'Est voluptas mollitia aliquid nostrum alias facilis maxime facere nihil sed beatae quia.', 1, 9, '2023-04-07 16:58:52', '2023-04-07 16:58:52', NULL),
(4, 'Iste ullam amet cupiditate.', 'Explicabo facere officiis eum.', 'Voluptatem dolores qui eveniet.', 'Sequi et molestias iste corrupti aliquam cupiditate.', 'Recusandae aut corporis explicabo sit soluta deserunt ut quo aperiam nihil commodi doloribus ad.', 'Eaque quis at aperiam officiis non dolores.', 3, 8, '2023-04-07 16:58:52', '2023-04-07 16:58:52', NULL),
(5, 'Commodi accusamus sunt.', 'Iure corrupti dolor.', 'Voluptatem ipsa repudiandae.', 'Mollitia cum ut voluptatibus voluptatem corporis libero nihil quod perferendis voluptates quod.', 'Aliquam reiciendis possimus voluptate voluptas non facere molestiae enim qui laboriosam provident.', 'Eos est aut explicabo culpa cumque voluptatum vitae earum alias aut voluptas amet.', 5, 2, '2023-04-07 16:58:52', '2023-04-07 16:58:52', NULL),
(6, 'Deleniti nam dolores.', 'Aut pariatur consequatur.', 'Corporis porro ea.', 'Qui itaque aut quia et et porro aliquam aut corrupti et omnis.', 'Est doloribus unde nostrum sit quidem modi quidem consequatur vel libero.', 'Sint possimus expedita vero doloribus et repellendus et omnis rem sit.', 3, 11, '2023-04-07 16:58:52', '2023-04-07 16:58:52', NULL),
(7, 'Dignissimos placeat tempora autem.', 'Dolorem et in.', 'Omnis aliquam voluptates doloribus.', 'Sequi praesentium aut expedita ut quis a.', 'Sequi non laudantium accusantium quo id non blanditiis molestiae non quo vel eveniet ut.', 'Et enim eligendi laboriosam aperiam dolore pariatur suscipit accusamus rerum qui accusantium dolores et.', 3, 8, '2023-04-07 16:58:53', '2023-04-07 16:58:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2023-04-07 16:58:34', '2023-04-07 16:58:34'),
(2, 'Author', 'web', '2023-04-07 16:58:34', '2023-04-07 16:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nariman Admin', 'admin@example.com', '2023-04-07 16:58:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2023-04-07 16:58:37', '2023-04-07 16:58:37', NULL),
(2, 'Nariman Author', 'author@example.com', '2023-04-07 16:58:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2023-04-07 16:58:37', '2023-04-07 16:58:37', NULL),
(3, 'Jonas Powlowski I', 'medhurst.leanna@example.net', '2023-04-07 16:58:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LGbv0NhwYk', '2023-04-07 16:58:37', '2023-04-07 16:58:37', NULL),
(4, 'Effie Fadel', 'maude.vonrueden@example.net', '2023-04-07 16:58:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QtKYc1Roe3', '2023-04-07 16:58:38', '2023-04-07 16:58:38', NULL),
(5, 'Ahmed Hegmann', 'neoma.fisher@example.org', '2023-04-07 16:58:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qzaqEDC6ny', '2023-04-07 16:58:38', '2023-04-07 16:58:38', NULL),
(6, 'Mack Schuppe', 'ecarter@example.com', '2023-04-07 16:58:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BRZ57AofTE', '2023-04-07 16:58:38', '2023-04-07 16:58:38', NULL),
(7, 'Dr. Serenity Witting IV', 'mac.emard@example.net', '2023-04-07 16:58:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vZXpSKgBIw', '2023-04-07 16:58:38', '2023-04-07 16:58:38', NULL),
(8, 'River Hansen', 'gwilkinson@example.com', '2023-04-07 16:58:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WDMkV91cd4', '2023-04-07 16:58:38', '2023-04-07 16:58:38', NULL),
(9, 'Miss Kiana Legros', 'ujohnston@example.org', '2023-04-07 16:58:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TozaUC3Xoo', '2023-04-07 16:58:38', '2023-04-07 16:58:38', NULL),
(10, 'Leatha Kessler', 'kallie94@example.org', '2023-04-07 16:58:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zZgawsVwoC', '2023-04-07 16:58:38', '2023-04-07 16:58:38', NULL),
(11, 'Carlie Corwin V', 'brett.hagenes@example.org', '2023-04-07 16:58:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'RAY3nPwMlO', '2023-04-07 16:58:38', '2023-04-07 16:58:38', NULL),
(12, 'Kenny Kassulke', 'murray.roberto@example.org', '2023-04-07 16:58:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'biWbeULslC', '2023-04-07 16:58:38', '2023-04-07 16:58:38', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_category_id_foreign` (`category_id`),
  ADD KEY `posts_author_id_foreign` (`author_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
