-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Waktu pembuatan: 12 Mar 2024 pada 17.16
-- Versi server: 5.7.39
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_remindex`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'posts', 'updated', 'Modules\\Article\\Models\\Post', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"updated_by\":1,\"deleted_at\":null},\"old\":{\"updated_by\":null,\"deleted_at\":\"2024-03-13T18:00:00.000000Z\"}}', NULL, '2024-03-02 08:14:54', '2024-03-02 08:14:54'),
(2, 'posts', 'restored', 'Modules\\Article\\Models\\Post', 'restored', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"adasd\",\"slug\":\"asdsa\",\"intro\":\"asd\",\"content\":\"asd\",\"type\":\"asd\",\"category_id\":1,\"category_name\":\"asd\",\"is_featured\":1,\"featured_image\":\"ads\",\"meta_title\":\"ads\",\"meta_keywords\":\"das\",\"meta_description\":\"sad\",\"meta_og_image\":\"asd\",\"meta_og_url\":\"dsa\",\"hits\":0,\"order\":null,\"status\":1,\"moderated_by\":null,\"moderated_at\":null,\"created_by\":null,\"created_by_name\":null,\"created_by_alias\":null,\"updated_by\":1,\"deleted_by\":null,\"published_at\":null,\"created_at\":\"2024-03-13T18:00:00.000000Z\",\"deleted_at\":null}}', NULL, '2024-03-02 08:14:54', '2024-03-02 08:14:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `group_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keyword` text COLLATE utf8mb4_unicode_ci,
  `order` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `group_name`, `image`, `meta_title`, `meta_description`, `meta_keyword`, `order`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Kategori Natura', 'kategori-natura', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', 1, 1, NULL, '2024-02-06 06:34:56', '2024-02-06 06:34:56', NULL),
(2, 'ad', 'asd', 'asdsa', NULL, NULL, 'asd', 'sad', 'asd', NULL, 'Active', 1, 1, NULL, '2024-03-02 08:10:51', '2024-03-02 08:10:51', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `commentable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `moderated_by` int(10) UNSIGNED DEFAULT NULL,
  `moderated_at` datetime DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `counters`
--

CREATE TABLE `counters` (
  `id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `counters`
--

INSERT INTO `counters` (`id`, `year`, `counter`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 2024, 73, NULL, NULL, '2024-03-12 07:07:53', '2024-03-12 07:07:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `departments`
--

CREATE TABLE `departments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `departments`
--

INSERT INTO `departments` (`id`, `code`, `name`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('9b289bec-52cc-48da-80f6-bf9de8cb714a', 'Dept-0001', 'Sales', NULL, 1, 1, 1, NULL, '2024-01-23 04:19:29', '2024-01-23 04:19:29', NULL),
('9b289c58-0c51-452e-8274-3d0f576ed658', 'Dept-0002', 'Accounting', NULL, 1, 1, 1, NULL, '2024-01-23 04:20:40', '2024-01-23 04:20:40', NULL),
('9b289c68-aa9d-4ae6-a385-303d2fc9bf23', 'Dept-0003', 'Human Capital', NULL, 1, 1, 1, NULL, '2024-01-23 04:20:51', '2024-01-23 04:20:51', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `documents`
--

CREATE TABLE `documents` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `document_type_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_type_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `is_used` int(11) NOT NULL DEFAULT '0' COMMENT '0: used, 1: unused',
  `is_expired` int(11) NOT NULL DEFAULT '0' COMMENT '0: expired, 1: non expired',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `documents`
--

INSERT INTO `documents` (`id`, `user_id`, `document_type_id`, `department_id`, `user_name`, `user_email`, `document_type_name`, `department_name`, `code`, `name`, `location`, `source`, `description`, `file`, `status`, `is_used`, `is_expired`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('9b8b54e9-e979-4333-89c3-7b05f6d409d2', 20, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9b289c68-aa9d-4ae6-a385-303d2fc9bf23', 'Aulia Harvy', 'auliaharvy@gmail.com', 'Kontrak Pegawai', 'Human Capital', 'DOC-2024-70', 'Row 1', 'Gudang', 'Pemprov', 'Test Document Import Row 1 Normal', NULL, 1, 0, 0, 1, 1, NULL, '2024-03-12 07:07:53', '2024-03-12 13:57:57', NULL),
('9b8b54e9-ec66-489e-a106-aa9f87e4944d', 20, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9b289c58-0c51-452e-8274-3d0f576ed658', 'Aulia Harvy', 'auliaharvy@gmail.com', 'Kontrak Pegawai', 'Accounting', 'DOC-2024-71', 'Row 2', 'Gudang', 'Pemprov', 'Test Document Import Row 2 To Be Process', NULL, 2, 0, 0, 1, NULL, NULL, '2024-03-12 07:07:53', '2024-03-12 07:08:53', NULL),
('9b8b54e9-ee39-41c3-958e-8404784b251b', 20, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9b289c58-0c51-452e-8274-3d0f576ed658', 'Aulia Harvy', 'auliaharvy@gmail.com', 'Kontrak Pegawai', 'Accounting', 'DOC-2024-72', 'Row 3', 'Gudang', 'Pemprov', 'Test Document Import Row 3 Expired', NULL, 4, 0, 0, 1, NULL, NULL, '2024-03-12 07:07:53', '2024-03-12 07:08:53', NULL),
('9b898b29-2af3-4328-81f8-068d712493ca', 3, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9b289c58-0c51-452e-8274-3d0f576ed658', 'Manager', 'manager@manager.com', 'Kontrak Pegawai', 'Accounting', 'DOC-2024-37', 'C', 'Filing Kabinet HR', 'Kementrian Industri', 'a', NULL, 5, 1, 1, 1, 1, NULL, '2024-03-11 08:47:55', '2024-03-11 08:47:55', NULL),
('9b862b42-3c5d-4cb6-a457-cb381f34c06c', 2, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9b289c58-0c51-452e-8274-3d0f576ed658', 'Admin Istrator', 'admin@admin.com', 'Kontrak Pegawai', 'Accounting', 'DOC-2024-36', 'Docukemtn Kontrak Pegawai A', 'Filing Kabinet HR', 'Internal', NULL, NULL, 4, 0, 0, 20, NULL, NULL, '2024-03-09 16:32:16', '2024-03-12 07:08:53', NULL),
('9b862acf-1f19-47bd-87fb-560d4189b088', 20, '9b7f0de6-cc66-4872-9888-e3c4eada5dd5', '9b289c58-0c51-452e-8274-3d0f576ed658', 'Aulia Harvy', 'auliaharvy@gmail.com', 'Surat Ijin Edar', 'Accounting', 'DOC-2024-35', 'Surat Ijin Edar Produk A', 'Filing Kabinet HR', 'Kementrian Perdagangan', NULL, NULL, 1, 0, 0, 20, 20, NULL, '2024-03-09 16:31:01', '2024-03-09 16:31:01', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `document_schedules`
--

CREATE TABLE `document_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `schedule_date` date DEFAULT NULL,
  `schedule_time` time DEFAULT NULL,
  `reminder_day` int(11) NOT NULL,
  `reminder_repeat` int(11) NOT NULL,
  `reminder_interval` int(11) NOT NULL,
  `reminder_sent` int(10) DEFAULT NULL,
  `next_reminder` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `document_schedules`
--

INSERT INTO `document_schedules` (`id`, `document_id`, `schedule_timestamp`, `schedule_date`, `schedule_time`, `reminder_day`, `reminder_repeat`, `reminder_interval`, `reminder_sent`, `next_reminder`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(60, '9b8b54e9-ee39-41c3-958e-8404784b251b', '2024-03-12 07:08:53', '2024-02-12', NULL, 68, 10, 24, 2, '2024-05-21', 1, NULL, NULL, '2024-03-12 07:07:53', '2024-03-12 07:08:53', NULL),
(59, '9b8b54e9-ec66-489e-a106-aa9f87e4944d', '2024-03-12 07:08:53', '2024-04-12', NULL, 69, 10, 24, 1, '2024-05-21', 1, NULL, NULL, '2024-03-12 07:07:53', '2024-03-12 07:08:53', NULL),
(58, '9b8b54e9-e979-4333-89c3-7b05f6d409d2', '2024-05-11 17:00:00', '2024-05-12', NULL, 30, 10, 24, NULL, NULL, 1, 1, NULL, '2024-03-12 07:07:53', '2024-03-12 07:07:53', NULL),
(56, '9b862b42-3c5d-4cb6-a457-cb381f34c06c', '2024-03-12 07:08:53', '2024-03-11', NULL, 0, 2, 24, 2, '2024-03-14', 20, NULL, NULL, '2024-03-09 16:32:16', '2024-03-12 07:08:53', NULL),
(55, '9b862acf-1f19-47bd-87fb-560d4189b088', '2024-03-29 17:00:00', '2024-03-30', NULL, 10, 10, 24, NULL, NULL, 20, 20, NULL, '2024-03-09 16:31:01', '2024-03-09 16:31:01', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `document_types`
--

CREATE TABLE `document_types` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `document_types`
--

INSERT INTO `document_types` (`id`, `code`, `name`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('9b289c86-c740-4709-b95f-c34058d4a0d3', '0001', 'Kontrak Pegawai', NULL, 1, 1, 1, NULL, '2024-01-23 04:21:10', '2024-01-23 04:21:10', NULL),
('9b289c9f-af53-4bf8-8852-4b913beb7ea9', '0002', 'STNK Mobil', NULL, 1, 1, 1, NULL, '2024-01-23 04:21:27', '2024-01-23 04:21:27', NULL),
('9b7f0de6-cc66-4872-9888-e3c4eada5dd5', '1', 'Surat Ijin Edar', NULL, 1, 1, 1, NULL, '2024-03-06 03:39:23', '2024-03-06 03:39:23', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"b9af2089-f6ef-4b5f-b0d0-8b82191a8a3d\",\"displayName\":\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:46:\\\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\\\":2:{s:8:\\\"document\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:32:\\\"Modules\\\\Document\\\\Models\\\\Document\\\";s:2:\\\"id\\\";s:36:\\\"9b673464-8385-41c1-8ada-a2ed1cc5f56c\\\";s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"0f25d2ab-522a-4990-ae31-ce10984028cf\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\"}}', 0, NULL, 1708675630, 1708675630),
(2, 'default', '{\"uuid\":\"31da1036-fe57-47f8-95ef-f719956ace0a\",\"displayName\":\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:46:\\\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\\\":2:{s:8:\\\"document\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:32:\\\"Modules\\\\Document\\\\Models\\\\Document\\\";s:2:\\\"id\\\";s:36:\\\"9b673464-8385-41c1-8ada-a2ed1cc5f56c\\\";s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"0f25d2ab-522a-4990-ae31-ce10984028cf\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1708675630, 1708675630),
(3, 'default', '{\"uuid\":\"4c291780-6b6d-47ed-be9a-88f1a1b79a50\",\"displayName\":\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:46:\\\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\\\":2:{s:8:\\\"document\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:32:\\\"Modules\\\\Document\\\\Models\\\\Document\\\";s:2:\\\"id\\\";s:36:\\\"9b673522-54fe-4067-b92c-d80cafe43e86\\\";s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"08d66b2e-de18-4498-8f9b-ae81b1a4f301\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\"}}', 0, NULL, 1708675754, 1708675754),
(4, 'default', '{\"uuid\":\"8384838e-9b76-473e-a34c-eb6f584dd97d\",\"displayName\":\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"roles\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:46:\\\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\\\":2:{s:8:\\\"document\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:32:\\\"Modules\\\\Document\\\\Models\\\\Document\\\";s:2:\\\"id\\\";s:36:\\\"9b673522-54fe-4067-b92c-d80cafe43e86\\\";s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"08d66b2e-de18-4498-8f9b-ae81b1a4f301\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1708675754, 1708675754),
(5, 'default', '{\"uuid\":\"aff347ae-5c43-41f0-99a3-e3b4ef5023d5\",\"displayName\":\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:11;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:46:\\\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\\\":2:{s:8:\\\"document\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:32:\\\"Modules\\\\Document\\\\Models\\\\Document\\\";s:2:\\\"id\\\";s:36:\\\"9b6d5f2d-9c2d-42cc-a09e-60347a5c0081\\\";s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"43db8428-9659-4cec-87b5-1a84093c1fe0\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\"}}', 0, NULL, 1708940507, 1708940507),
(6, 'default', '{\"uuid\":\"d0ddfebc-250b-4002-a012-26cec3a3c0e9\",\"displayName\":\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:11;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:46:\\\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\\\":2:{s:8:\\\"document\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:32:\\\"Modules\\\\Document\\\\Models\\\\Document\\\";s:2:\\\"id\\\";s:36:\\\"9b6d5f2d-9c2d-42cc-a09e-60347a5c0081\\\";s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"43db8428-9659-4cec-87b5-1a84093c1fe0\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1708940507, 1708940507),
(7, 'default', '{\"uuid\":\"a5f86299-4c93-48f0-85e3-dd7409dca8de\",\"displayName\":\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:11;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:46:\\\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\\\":2:{s:8:\\\"document\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:32:\\\"Modules\\\\Document\\\\Models\\\\Document\\\";s:2:\\\"id\\\";s:36:\\\"9b6d5f2d-9c2d-42cc-a09e-60347a5c0081\\\";s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"480ebaff-fb25-457b-96d7-11c36a9f2659\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\"}}', 0, NULL, 1708940507, 1708940507),
(8, 'default', '{\"uuid\":\"8a6d6600-a2db-4ebc-9695-1774da17a216\",\"displayName\":\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:11;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:46:\\\"Modules\\\\Document\\\\Notifications\\\\DocumentCreated\\\":2:{s:8:\\\"document\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:32:\\\"Modules\\\\Document\\\\Models\\\\Document\\\";s:2:\\\"id\\\";s:36:\\\"9b6d5f2d-9c2d-42cc-a09e-60347a5c0081\\\";s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"480ebaff-fb25-457b-96d7-11c36a9f2659\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1708940507, 1708940507),
(9, 'default', '{\"uuid\":\"7b469728-1a1e-42c5-a99e-8078f677019c\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedProfileCreate\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:58:\\\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedProfileCreate\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserCreated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1708940838, 1708940838),
(10, 'default', '{\"uuid\":\"cc0b3e73-b41b-47e7-9137-f2818226de51\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedNotifySuperUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:60:\\\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedNotifySuperUser\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserCreated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1708940838, 1708940838),
(11, 'default', '{\"uuid\":\"30901297-ae80-4664-b975-189ca818b5e7\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedNotifyUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:55:\\\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedNotifyUser\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserUpdated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709375360, 1709375360),
(12, 'default', '{\"uuid\":\"300d791f-bbb8-46e6-9c26-c19d58cc903b\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedProfileUpdate\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:58:\\\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedProfileUpdate\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserUpdated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709375360, 1709375360),
(13, 'default', '{\"uuid\":\"5bdaae4f-2056-4c52-8342-6121c5e2d2ea\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedNotifyUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:55:\\\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedNotifyUser\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserUpdated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709375371, 1709375371),
(14, 'default', '{\"uuid\":\"151f70b4-0275-4cdf-84b6-3faf58e3bae8\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedProfileUpdate\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:58:\\\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedProfileUpdate\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserUpdated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709375371, 1709375371),
(15, 'default', '{\"uuid\":\"93235a45-cfbe-4de6-afdb-9a598660e675\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedNotifyUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:55:\\\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedNotifyUser\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserUpdated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709420732, 1709420732),
(16, 'default', '{\"uuid\":\"9df63bf3-08c1-49d5-b69d-7d7a77b54caa\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedProfileUpdate\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:58:\\\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedProfileUpdate\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserUpdated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709420732, 1709420732),
(17, 'default', '{\"uuid\":\"dce4c087-1fa2-439e-b87e-4c1927b2be1d\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedProfileCreate\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:58:\\\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedProfileCreate\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserCreated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709425530, 1709425530),
(18, 'default', '{\"uuid\":\"e56b8fab-f810-4848-90fa-0dc0b281f08d\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedNotifySuperUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:60:\\\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedNotifySuperUser\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserCreated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709425530, 1709425530),
(19, 'default', '{\"uuid\":\"422c1672-e2db-4a82-b1f5-a212ccaca8af\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedNotifyUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:55:\\\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedNotifyUser\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserUpdated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709425752, 1709425752),
(20, 'default', '{\"uuid\":\"c6d0233b-b540-4af5-95d8-65f9a207d25f\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedProfileUpdate\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:58:\\\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedProfileUpdate\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserUpdated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709425752, 1709425752),
(21, 'default', '{\"uuid\":\"8aedafe2-7955-495c-8d2b-d22b339045de\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedNotifyUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:55:\\\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedNotifyUser\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserUpdated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709426400, 1709426400),
(22, 'default', '{\"uuid\":\"6aa08645-bfc6-4226-bd2a-37150ff57729\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedProfileUpdate\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:58:\\\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedProfileUpdate\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserUpdated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709426400, 1709426400),
(23, 'default', '{\"uuid\":\"d6579093-1975-47a7-aa76-7df966b430df\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedNotifyUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:55:\\\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedNotifyUser\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserUpdated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709426413, 1709426413),
(24, 'default', '{\"uuid\":\"6d2cbcd2-e786-4d1b-8b11-685fbae09851\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedProfileUpdate\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:58:\\\"App\\\\Listeners\\\\Backend\\\\UserUpdated\\\\UserUpdatedProfileUpdate\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserUpdated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709426413, 1709426413),
(25, 'default', '{\"uuid\":\"6ec7e879-853a-471e-a20d-304d8ed52925\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedProfileCreate\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:58:\\\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedProfileCreate\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserCreated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:16;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709427067, 1709427067),
(26, 'default', '{\"uuid\":\"02ff182c-dc09-4fbc-bcd2-639f52a9e112\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedNotifySuperUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:60:\\\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedNotifySuperUser\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserCreated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:16;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709427067, 1709427067),
(27, 'default', '{\"uuid\":\"ce035669-d493-431c-ae23-635c2f5bf581\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedProfileCreate\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:58:\\\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedProfileCreate\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserCreated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:19;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709428213, 1709428213),
(28, 'default', '{\"uuid\":\"182eb530-bbe5-43a4-a5a7-89571eceb989\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedNotifySuperUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:60:\\\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedNotifySuperUser\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserCreated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:19;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709428213, 1709428213),
(29, 'default', '{\"uuid\":\"9ad833cd-d581-4ab9-87d1-6c76507dbcba\",\"displayName\":\"App\\\\Notifications\\\\UserAccountCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:19;}s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:36:\\\"App\\\\Notifications\\\\UserAccountCreated\\\":2:{s:10:\\\"\\u0000*\\u0000request\\\";a:1:{s:8:\\\"password\\\";s:6:\\\"secret\\\";}s:2:\\\"id\\\";s:36:\\\"7c254efe-8bfa-4e03-bf9f-6a0c9c667226\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1709428213, 1709428213),
(30, 'default', '{\"uuid\":\"626acd53-25e0-471b-95e3-f4744b5e964d\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedProfileCreate\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:58:\\\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedProfileCreate\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserCreated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709428463, 1709428463),
(31, 'default', '{\"uuid\":\"f7779df6-cf6c-4661-b150-35877a1cc48a\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedNotifySuperUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:60:\\\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedNotifySuperUser\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserCreated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709428463, 1709428463),
(32, 'default', '{\"uuid\":\"c32040e5-b81c-4010-a9cc-f30a3a336611\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedProfileCreate\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:58:\\\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedProfileCreate\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserCreated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709569537, 1709569537),
(33, 'default', '{\"uuid\":\"683e27a5-3be6-4dc3-8f92-c0b6e886f262\",\"displayName\":\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedNotifySuperUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":19:{s:5:\\\"class\\\";s:60:\\\"App\\\\Listeners\\\\Backend\\\\UserCreated\\\\UserCreatedNotifySuperUser\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:30:\\\"App\\\\Events\\\\Backend\\\\UserCreated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:2:{i:0;s:5:\\\"roles\\\";i:1;s:11:\\\"permissions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1709569537, 1709569537);

-- --------------------------------------------------------

--
-- Struktur dari tabel `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_03_11_062135_create_posts_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_02_19_173641_create_settings_table', 1),
(7, '2020_02_19_173700_create_userprofiles_table', 1),
(8, '2020_02_19_173711_create_notifications_table', 1),
(9, '2020_02_22_115918_create_user_providers_table', 1),
(10, '2020_05_01_163442_create_tags_table', 1),
(11, '2020_05_01_163833_create_polymorphic_taggables_table', 1),
(12, '2020_05_04_151517_create_comments_table', 1),
(13, '2022_04_01_132914_create_media_table', 1),
(14, '2022_04_01_133918_create_permission_tables', 1),
(15, '2022_04_01_134140_create_activity_log_table', 1),
(16, '2022_04_01_134141_add_event_column_to_activity_log_table', 1),
(17, '2022_04_01_134142_add_batch_uuid_column_to_activity_log_table', 1),
(18, '2023_03_12_195541_add_expires_at_column_to_personal_access_tokens_table', 1),
(19, '2023_07_30_013129_create_categories_table', 1),
(20, '2023_12_12_123643_create_documents_table', 1),
(21, '2023_12_12_123822_create_departments_table', 1),
(22, '2023_12_12_123845_create_documenttypes_table', 1),
(23, '2024_01_06_000926_create_document_schedules_table', 1),
(24, '2024_01_06_000955_create_schedule_pics_table', 1),
(25, '2024_02_23_121302_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 11),
(18, 'App\\Models\\User', 16),
(19, 'App\\Models\\User', 16),
(21, 'App\\Models\\User', 16),
(40, 'App\\Models\\User', 11),
(41, 'App\\Models\\User', 11),
(42, 'App\\Models\\User', 11),
(43, 'App\\Models\\User', 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 6),
(1, 'App\\Models\\User', 7),
(1, 'App\\Models\\User', 8),
(1, 'App\\Models\\User', 9),
(1, 'App\\Models\\User', 10),
(1, 'App\\Models\\User', 16),
(1, 'App\\Models\\User', 19),
(1, 'App\\Models\\User', 21),
(5, 'App\\Models\\User', 3),
(5, 'App\\Models\\User', 5),
(5, 'App\\Models\\User', 11),
(5, 'App\\Models\\User', 12),
(5, 'App\\Models\\User', 13),
(5, 'App\\Models\\User', 14),
(5, 'App\\Models\\User', 15),
(5, 'App\\Models\\User', 19),
(5, 'App\\Models\\User', 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('6f78bf61-8271-4303-9cb6-3581c8552fe2', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 21, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>b<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7c0525-02f8-4f59-b55a-d59a8a0f36a5\",\"url_frontend\":\"\"}', NULL, '2024-03-04 15:27:25', '2024-03-04 15:27:25'),
('14b3f0c4-39cf-44ae-8645-06370e340668', 'Modules\\Document\\Notifications\\DocumentCreated', 'App\\Models\\User', 11, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Test menggunakan user<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/documents\\/9b52a31d-66de-4c77-916b-389120fd48ed\",\"url_frontend\":\"\"}', NULL, '2024-02-13 01:44:24', '2024-02-13 01:44:24'),
('cc6a5cf8-a308-4449-aeba-1e90a2d0965f', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 20, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>b<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7c0525-02f8-4f59-b55a-d59a8a0f36a5\",\"url_frontend\":\"\"}', NULL, '2024-03-04 15:27:39', '2024-03-04 15:27:39'),
('1c6ac5eb-c29a-445a-b4d9-33695316be3a', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 21, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>b<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7c0525-02f8-4f59-b55a-d59a8a0f36a5\",\"url_frontend\":\"\"}', NULL, '2024-03-04 15:40:44', '2024-03-04 15:40:44'),
('afb5017a-2da2-4307-b64a-b40543d832d0', 'App\\Notifications\\WaitingDocument', 'App\\Models\\User', 21, '{\"title\":\"Document Entering the reminder period!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Document Entering the reminder period | <strong>b<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7c0525-02f8-4f59-b55a-d59a8a0f36a5\",\"url_frontend\":\"\"}', NULL, '2024-03-04 15:40:59', '2024-03-04 15:40:59'),
('dc7837cf-3e59-4f91-8ed7-0d96a1a3d41c', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 11, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Test PIC 2<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b6d61a4-085a-4b01-acf8-3985fb408fc1\",\"url_frontend\":\"\"}', NULL, '2024-02-26 08:48:38', '2024-02-26 08:48:38'),
('01e38abe-2cd0-447f-b34a-0cd3c49f87f7', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 11, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Test PIC 2<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b6d6262-e038-4d2d-8b44-95b510d7ebfb\",\"url_frontend\":\"\"}', NULL, '2024-02-26 08:50:43', '2024-02-26 08:50:43'),
('dbe07192-bdbd-4bfa-81e0-0dce7fbaec32', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 14, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Test PIC 2<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b6d6262-e038-4d2d-8b44-95b510d7ebfb\",\"url_frontend\":\"\"}', NULL, '2024-02-26 08:50:53', '2024-02-26 08:50:53'),
('33635753-0856-44b3-ba3c-1b9807d5d34b', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 11, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Aulia Harvy<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b6df783-0777-4ccf-b327-d7247d5aa457\",\"url_frontend\":\"\"}', NULL, '2024-02-26 15:47:43', '2024-02-26 15:47:43'),
('e11f9402-4f99-4eb7-b8c5-007a57d9950c', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 14, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Aulia Harvy<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b6df783-0777-4ccf-b327-d7247d5aa457\",\"url_frontend\":\"\"}', NULL, '2024-02-26 15:47:44', '2024-02-26 15:47:44'),
('d3deb432-5696-48c8-b1e9-bfa626ab0385', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 20, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>a<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7c001f-e6f9-47e5-8292-0cf53032c58c\",\"url_frontend\":\"\"}', NULL, '2024-03-04 15:13:23', '2024-03-04 15:13:23'),
('4379362d-b690-430c-b937-dc20c11164ae', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 20, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>a<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7c001f-e6f9-47e5-8292-0cf53032c58c\",\"url_frontend\":\"\"}', NULL, '2024-03-04 15:13:37', '2024-03-04 15:13:37'),
('346b6b7c-aed4-4ab3-aa64-260110733675', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>a<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7c001f-e6f9-47e5-8292-0cf53032c58c\",\"url_frontend\":\"\"}', NULL, '2024-03-04 15:40:59', '2024-03-04 15:40:59'),
('c08c7778-6f95-4255-b5e1-9f67f1ee2316', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 21, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>c<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7d62b6-3568-460e-a13e-810f38516b43\",\"url_frontend\":\"\"}', NULL, '2024-03-05 07:44:53', '2024-03-05 07:44:53'),
('a24a3902-fa8a-4510-9f79-45a7dafbc59a', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 21, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>c<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7d62b6-3568-460e-a13e-810f38516b43\",\"url_frontend\":\"\"}', NULL, '2024-03-05 07:45:07', '2024-03-05 07:45:07'),
('3a7e4ffb-2ea4-4c42-99fe-43770287fd8a', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 20, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>d<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7d6308-f4fd-487c-9131-d94218875036\",\"url_frontend\":\"\"}', NULL, '2024-03-05 07:45:47', '2024-03-05 07:45:47'),
('983a897f-b8bb-4312-9a28-110f36809fdc', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 20, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>d<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7d6308-f4fd-487c-9131-d94218875036\",\"url_frontend\":\"\"}', NULL, '2024-03-05 07:46:01', '2024-03-05 07:46:01'),
('4bf5e13b-48be-4c47-823f-e358414da3a6', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 20, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Surat Ijin Edar Produk A<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/documents\\/9b7f103c-955c-426b-9c9a-e7033cc861c4\",\"url_frontend\":\"\"}', NULL, '2024-03-06 03:45:55', '2024-03-06 03:45:55'),
('583f2765-d5ef-4542-9a66-2f5902720193', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 1, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Surat Ijin Edar Produk A<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/documents\\/9b7f103c-955c-426b-9c9a-e7033cc861c4\",\"url_frontend\":\"\"}', NULL, '2024-03-06 03:45:56', '2024-03-06 03:45:56'),
('6874da69-89b7-4f80-922e-fda032b5a88b', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 2, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Surat Ijin Edar Produk A<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/documents\\/9b7f103c-955c-426b-9c9a-e7033cc861c4\",\"url_frontend\":\"\"}', NULL, '2024-03-06 03:45:56', '2024-03-06 03:45:56'),
('a6c4f47c-87e1-4df2-a450-3d3b9c27d567', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Surat Ijin Edar Produk A<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7f103c-955c-426b-9c9a-e7033cc861c4\",\"url_frontend\":\"\"}', NULL, '2024-03-08 03:44:58', '2024-03-08 03:44:58'),
('49dd017b-6f88-4335-a711-6bace70efa26', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>d<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7d6308-f4fd-487c-9131-d94218875036\",\"url_frontend\":\"\"}', NULL, '2024-03-08 03:45:12', '2024-03-08 03:45:12'),
('5abc56c1-3e1e-42b6-bdd7-3871d0944635', 'App\\Notifications\\WaitingDocument', 'App\\Models\\User', 20, '{\"title\":\"Document Entering the reminder period!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Document Entering the reminder period | <strong>d<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7d6308-f4fd-487c-9131-d94218875036\",\"url_frontend\":\"\"}', NULL, '2024-03-08 03:45:12', '2024-03-08 03:45:12'),
('08f43839-0afe-410a-8f7a-4bb8a28364ce', 'App\\Notifications\\WaitingDocument', 'App\\Models\\User', 21, '{\"title\":\"Document Entering the reminder period!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Document Entering the reminder period | <strong>c<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7d62b6-3568-460e-a13e-810f38516b43\",\"url_frontend\":\"\"}', NULL, '2024-03-08 03:45:12', '2024-03-08 03:45:12'),
('61f033de-1348-42f5-919c-1386fd0708db', 'App\\Notifications\\WaitingDocument', 'App\\Models\\User', 21, '{\"title\":\"Document Entering the reminder period!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Document Entering the reminder period | <strong>b<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7c0525-02f8-4f59-b55a-d59a8a0f36a5\",\"url_frontend\":\"\"}', NULL, '2024-03-08 03:45:12', '2024-03-08 03:45:12'),
('56aa0738-ce57-43fd-a2ae-2df804fb2ded', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>a<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7c001f-e6f9-47e5-8292-0cf53032c58c\",\"url_frontend\":\"\"}', NULL, '2024-03-08 03:45:12', '2024-03-08 03:45:12'),
('3b70fcf0-20f7-4364-95d0-e2a9ca813505', 'App\\Notifications\\NewUserDocumentCreatedWithoutSchedule', 'App\\Models\\User', 20, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Kontrak pegawai<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/documents\\/9b834e2a-8453-4c1f-a2f3-84a3bca8c675\",\"url_frontend\":\"\"}', NULL, '2024-03-08 06:22:24', '2024-03-08 06:22:24'),
('4a7fc646-3719-452e-9d08-c441dd2895c0', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 20, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Test FIle<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/documents\\/9b83845f-619a-45b1-9c93-1c3b7557a982\",\"url_frontend\":\"\"}', NULL, '2024-03-08 08:53:58', '2024-03-08 08:53:58'),
('837e3fa2-c5c2-4b6d-bdae-2229b7c67b1a', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 21, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Test FIle<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/documents\\/9b83845f-619a-45b1-9c93-1c3b7557a982\",\"url_frontend\":\"\"}', NULL, '2024-03-08 08:54:13', '2024-03-08 08:54:13'),
('2b6946f0-22c1-458c-8dbd-39f75ee11c0c', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>d<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7d6308-f4fd-487c-9131-d94218875036\",\"url_frontend\":\"\"}', NULL, '2024-03-08 11:18:15', '2024-03-08 11:18:15'),
('1237f268-6a2d-40f1-b781-75e90def5dc7', 'App\\Notifications\\WaitingDocument', 'App\\Models\\User', 20, '{\"title\":\"Document Entering the reminder period!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Document Entering the reminder period | <strong>d<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7d6308-f4fd-487c-9131-d94218875036\",\"url_frontend\":\"\"}', NULL, '2024-03-08 11:18:29', '2024-03-08 11:18:29'),
('3502726a-f4df-458c-a4e9-7c2a82cd8a06', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>d<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7d6308-f4fd-487c-9131-d94218875036\",\"url_frontend\":\"\"}', NULL, '2024-03-08 11:21:02', '2024-03-08 11:21:02'),
('eaa1e3d8-9ff1-44b0-bc5d-a132b6788cb7', 'App\\Notifications\\WaitingDocument', 'App\\Models\\User', 20, '{\"title\":\"Document Entering the reminder period!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Document Entering the reminder period | <strong>d<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7d6308-f4fd-487c-9131-d94218875036\",\"url_frontend\":\"\"}', NULL, '2024-03-08 11:21:16', '2024-03-08 11:21:16'),
('b9c5db22-7336-464a-aeae-92d3583aacf9', 'App\\Notifications\\WaitingDocument', 'App\\Models\\User', 21, '{\"title\":\"Document Entering the reminder period!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Document Entering the reminder period | <strong>b<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7c0525-02f8-4f59-b55a-d59a8a0f36a5\",\"url_frontend\":\"\"}', NULL, '2024-03-08 11:21:16', '2024-03-08 11:21:16'),
('568e0b8b-d8b3-4274-a27d-c1eb4ba7e305', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>a<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b7c001f-e6f9-47e5-8292-0cf53032c58c\",\"url_frontend\":\"\"}', NULL, '2024-03-08 11:21:16', '2024-03-08 11:21:16'),
('0fa8ecff-7979-49fe-a761-c67d8be6ebba', 'App\\Notifications\\NewUserDocumentCreatedWithoutSchedule', 'App\\Models\\User', 2, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Test No Aulia<\\/strong> on <strong>Admin Istrator<\\/strong>\",\"url_backend\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/documents\\/9b85dbc0-06d3-4ee8-9e5b-822ae15d6b20\",\"url_frontend\":\"\"}', NULL, '2024-03-09 12:49:57', '2024-03-09 12:49:57'),
('6ee30fcb-292b-4e30-837d-f05b62613534', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 20, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Surat Ijin Edar Produk A<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/documents\\/9b862acf-1f19-47bd-87fb-560d4189b088\",\"url_frontend\":\"\"}', NULL, '2024-03-09 16:31:01', '2024-03-09 16:31:01'),
('0a29757e-34d5-43e1-922a-f8deec28f955', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 2, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Surat Ijin Edar Produk A<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/documents\\/9b862acf-1f19-47bd-87fb-560d4189b088\",\"url_frontend\":\"\"}', NULL, '2024-03-09 16:31:02', '2024-03-09 16:31:02'),
('df4baaee-1ed4-4130-82c9-09036371a33a', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 2, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Docukemtn Kontrak Pegawai A<\\/strong> on <strong>Admin Istrator<\\/strong>\",\"url_backend\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/documents\\/9b862b42-3c5d-4cb6-a457-cb381f34c06c\",\"url_frontend\":\"\"}', NULL, '2024-03-09 16:32:16', '2024-03-09 16:32:16'),
('8d26cfda-3d52-4c04-b3cd-eb3b72c6ac60', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 20, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Docukemtn Kontrak Pegawai A<\\/strong> on <strong>Admin Istrator<\\/strong>\",\"url_backend\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/documents\\/9b862b42-3c5d-4cb6-a457-cb381f34c06c\",\"url_frontend\":\"\"}', NULL, '2024-03-09 16:32:17', '2024-03-09 16:32:17'),
('65ccb86a-890c-4dbc-b4b1-81a84daefa2c', 'App\\Notifications\\NewUserDocumentCreatedWithoutSchedule', 'App\\Models\\User', 3, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>C<\\/strong> on <strong>Manager<\\/strong>\",\"url_backend\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/documents\\/9b898b29-2af3-4328-81f8-068d712493ca\",\"url_frontend\":\"\"}', NULL, '2024-03-11 08:47:55', '2024-03-11 08:47:55'),
('e844064a-d43d-4a86-9122-bb765b41e702', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 3<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b8b54e9-ee39-41c3-958e-8404784b251b\",\"url_frontend\":\"\"}', NULL, '2024-03-12 07:08:38', '2024-03-12 07:08:38'),
('d5774766-027f-4d1c-8fa1-9a4255afa964', 'App\\Notifications\\WaitingDocument', 'App\\Models\\User', 20, '{\"title\":\"Document Entering the reminder period!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Document Entering the reminder period | <strong>Row 3<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b8b54e9-ee39-41c3-958e-8404784b251b\",\"url_frontend\":\"\"}', NULL, '2024-03-12 07:08:53', '2024-03-12 07:08:53'),
('5f2c18f1-806f-4d85-a677-53d1464ff08f', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 2<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b8b54e9-ec66-489e-a106-aa9f87e4944d\",\"url_frontend\":\"\"}', NULL, '2024-03-12 07:08:53', '2024-03-12 07:08:53'),
('3cdc7236-cbda-471e-a383-3d34295a630e', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 2, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Docukemtn Kontrak Pegawai A<\\/strong> on <strong>Admin Istrator<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b862b42-3c5d-4cb6-a457-cb381f34c06c\",\"url_frontend\":\"\"}', NULL, '2024-03-12 07:08:53', '2024-03-12 07:08:53'),
('d496c22e-3798-4cee-a0e7-d2cc3915a349', 'App\\Notifications\\WaitingDocument', 'App\\Models\\User', 2, '{\"title\":\"Document Entering the reminder period!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Document Entering the reminder period | <strong>Docukemtn Kontrak Pegawai A<\\/strong> on <strong>Admin Istrator<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b862b42-3c5d-4cb6-a457-cb381f34c06c\",\"url_frontend\":\"\"}', NULL, '2024-03-12 07:08:53', '2024-03-12 07:08:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view_backend', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(2, 'edit_settings', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(3, 'view_logs', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(4, 'view_users', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(5, 'add_users', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(6, 'edit_users', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(7, 'delete_users', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(8, 'restore_users', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(9, 'block_users', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(10, 'view_roles', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(11, 'add_roles', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(12, 'edit_roles', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(13, 'delete_roles', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(14, 'restore_roles', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(15, 'view_backups', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(16, 'add_backups', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(17, 'create_backups', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(18, 'download_backups', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(19, 'delete_backups', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(20, 'view_posts', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(21, 'add_posts', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(22, 'edit_posts', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(23, 'delete_posts', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(24, 'restore_posts', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(25, 'view_categories', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(26, 'add_categories', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(27, 'edit_categories', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(28, 'delete_categories', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(29, 'restore_categories', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(30, 'view_tags', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(31, 'add_tags', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(32, 'edit_tags', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(33, 'delete_tags', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(34, 'restore_tags', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(35, 'view_comments', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(36, 'add_comments', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(37, 'edit_comments', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(38, 'delete_comments', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(39, 'restore_comments', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(40, 'view_documents', 'web', NULL, NULL),
(41, 'add_documents', 'web', NULL, NULL),
(42, 'edit_documents', 'web', NULL, NULL),
(43, 'delete_documents', 'web', NULL, NULL),
(44, 'view_documenttypes', 'web', '2024-02-13 00:56:21', '2024-02-13 00:56:21'),
(45, 'add_documenttypes', 'web', '2024-02-13 00:56:21', '2024-02-13 00:56:21'),
(46, 'edit_documenttypes', 'web', '2024-02-13 00:56:21', '2024-02-13 00:56:21'),
(47, 'delete_documenttypes', 'web', '2024-02-13 00:56:21', '2024-02-13 00:56:21'),
(48, 'restore_documenttypes', 'web', '2024-02-13 00:56:21', '2024-02-13 00:56:21'),
(49, 'view_departments', 'web', '2024-02-13 00:56:32', '2024-02-13 00:56:32'),
(50, 'add_departments', 'web', '2024-02-13 00:56:32', '2024-02-13 00:56:32'),
(51, 'edit_departments', 'web', '2024-02-13 00:56:32', '2024-02-13 00:56:32'),
(52, 'delete_departments', 'web', '2024-02-13 00:56:32', '2024-02-13 00:56:32'),
(53, 'restore_departments', 'web', '2024-02-13 00:56:32', '2024-02-13 00:56:32'),
(54, 'restore_documents', 'web', '2024-02-13 00:56:40', '2024-02-13 00:56:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` int(11) DEFAULT NULL,
  `featured_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_og_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_og_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `moderated_by` int(10) UNSIGNED DEFAULT NULL,
  `moderated_at` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_by_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_alias` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `name`, `slug`, `intro`, `content`, `type`, `category_id`, `category_name`, `is_featured`, `featured_image`, `meta_title`, `meta_keywords`, `meta_description`, `meta_og_image`, `meta_og_url`, `hits`, `order`, `status`, `moderated_by`, `moderated_at`, `created_by`, `created_by_name`, `created_by_alias`, `updated_by`, `deleted_by`, `published_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'adasd', 'asdsa', 'asd', 'asd', 'asd', 1, 'asd', 1, 'ads', 'ads', 'das', 'sad', 'asd', 'dsa', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-13 17:00:00', '2024-03-02 08:14:54', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super admin', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(5, 'user', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 5),
(4, 5),
(40, 5),
(41, 5),
(42, 5),
(43, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `schedule_pics`
--

CREATE TABLE `schedule_pics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_schedule_id` bigint(20) NOT NULL,
  `user_pic_id` bigint(20) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `schedule_pics`
--

INSERT INTO `schedule_pics` (`id`, `document_schedule_id`, `user_pic_id`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(54, 60, 20, 1, 1, '2024-03-12 07:07:53', '2024-03-12 07:07:53', NULL),
(53, 59, 20, 1, 1, '2024-03-12 07:07:53', '2024-03-12 07:07:53', NULL),
(52, 58, 20, 1, 1, '2024-03-12 07:07:53', '2024-03-12 07:07:53', NULL),
(51, 56, 20, 20, 20, '2024-03-09 16:32:17', '2024-03-09 16:32:17', NULL),
(50, 55, 2, 20, 20, '2024-03-09 16:31:02', '2024-03-09 16:31:02', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val` text COLLATE utf8mb4_unicode_ci,
  `type` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'string',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `name`, `val`, `type`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'app_name', 'Remindex', 'string', 1, 1, NULL, '2024-01-23 04:22:32', '2024-01-23 04:22:32', NULL),
(2, 'footer_text', '<a href=\"#\" class=\"text-muted\">Copyright @2024</a>', 'string', 1, 1, NULL, '2024-01-23 04:22:32', '2024-01-23 04:22:32', NULL),
(3, 'show_copyright', '1', 'text', 1, 1, NULL, '2024-01-23 04:22:32', '2024-01-23 04:22:32', NULL),
(4, 'email', 'info@example.com', 'string', 1, 1, NULL, '2024-01-23 04:22:32', '2024-01-23 04:22:32', NULL),
(5, 'website_url', '#', 'string', 1, 1, NULL, '2024-01-23 04:22:32', '2024-01-28 09:36:57', NULL),
(6, 'facebook_url', '#', 'string', 1, 1, NULL, '2024-01-23 04:22:32', '2024-01-23 04:22:32', NULL),
(7, 'twitter_url', '#', 'string', 1, 1, NULL, '2024-01-23 04:22:32', '2024-01-28 09:36:57', NULL),
(8, 'instagram_url', '#', 'string', 1, 1, NULL, '2024-01-23 04:22:32', '2024-01-28 09:36:57', NULL),
(9, 'youtube_url', '#', 'string', 1, 1, NULL, '2024-01-23 04:22:33', '2024-01-28 09:36:57', NULL),
(10, 'linkedin_url', '#', 'string', 1, 1, NULL, '2024-01-23 04:22:33', '2024-01-23 04:22:33', NULL),
(11, 'whatsapp_url', '#', 'string', 1, 1, NULL, '2024-01-23 04:22:33', '2024-01-23 04:22:33', NULL),
(12, 'messenger_url', '#', 'string', 1, 1, NULL, '2024-01-23 04:22:33', '2024-01-23 04:22:33', NULL),
(13, 'meta_site_name', 'Remindex | Auto Reminder System', 'text', 1, 1, NULL, '2024-01-23 04:22:33', '2024-01-28 09:36:57', NULL),
(14, 'meta_description', 'A sistem for automation for document reminder', 'text', 1, 1, NULL, '2024-01-23 04:22:33', '2024-01-28 09:36:57', NULL),
(15, 'meta_keyword', 'Web Application, web app, Document, Reminder', 'text', 1, 1, NULL, '2024-01-23 04:22:33', '2024-01-28 09:36:58', NULL),
(16, 'meta_image', 'img/default_banner.jpg', 'text', 1, 1, NULL, '2024-01-23 04:22:33', '2024-01-23 04:22:33', NULL),
(17, 'meta_fb_app_id', NULL, 'text', 1, 1, NULL, '2024-01-23 04:22:33', '2024-01-28 09:36:58', NULL),
(18, 'meta_twitter_site', NULL, 'text', 1, 1, NULL, '2024-01-23 04:22:33', '2024-01-28 09:36:58', NULL),
(19, 'meta_twitter_creator', NULL, 'text', 1, 1, NULL, '2024-01-23 04:22:33', '2024-01-28 09:36:58', NULL),
(20, 'google_analytics', NULL, 'text', 1, 1, NULL, '2024-01-23 04:22:33', '2024-01-28 09:37:09', NULL),
(21, 'custom_css_block', NULL, 'string', 1, 1, NULL, '2024-01-23 04:22:33', '2024-01-23 04:22:33', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `taggables`
--

CREATE TABLE `taggables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `taggable_id` bigint(20) UNSIGNED NOT NULL,
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keyword` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `userprofiles`
--

CREATE TABLE `userprofiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_metadata` text COLLATE utf8mb4_unicode_ci,
  `last_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `userprofiles`
--

INSERT INTO `userprofiles` (`id`, `user_id`, `name`, `first_name`, `last_name`, `username`, `email`, `mobile`, `gender`, `url_website`, `url_facebook`, `url_twitter`, `url_instagram`, `url_linkedin`, `date_of_birth`, `address`, `bio`, `avatar`, `user_metadata`, `last_ip`, `login_count`, `last_login`, `email_verified_at`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Super Admin', 'Super', 'Admin', '100001', 'super@admin.com', '930.927.3386', 'Male', NULL, NULL, NULL, NULL, NULL, '2022-03-10', NULL, NULL, 'img/default-avatar.jpg', NULL, '127.0.0.1', 93, '2024-03-12 16:44:30', NULL, 1, NULL, 1, NULL, '2024-01-23 04:15:54', '2024-03-12 16:44:30', NULL),
(2, 2, 'Admin Istrator', 'Admin', 'Istrator', '100002', 'admin@admin.com', '870-988-9497', 'Female', NULL, NULL, NULL, NULL, NULL, '1975-05-03', NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, NULL, '2024-01-23 04:15:54', '2024-01-23 04:15:54', NULL),
(3, 3, 'Manager', 'Manager', 'User User', '100003', 'manager@manager.com', '772-749-4710', 'Female', NULL, NULL, NULL, NULL, NULL, '2020-01-11', NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, NULL, '2024-01-23 04:15:55', '2024-03-02 09:29:31', NULL),
(4, 4, 'Executive User', 'Executive', 'User', '100004', 'executive@executive.com', '+1-715-471-0040', 'Other', NULL, NULL, NULL, NULL, NULL, '2002-08-19', NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, NULL, '2024-01-23 04:15:55', '2024-01-23 04:15:55', NULL),
(5, 5, 'General User', 'General', 'User', '100005', 'user@user.com', '+16162676098', 'Female', NULL, NULL, NULL, NULL, NULL, '1984-04-11', NULL, NULL, 'img/default-avatar.jpg', NULL, '127.0.0.1', 1, '2024-02-12 15:31:03', NULL, 1, NULL, 5, NULL, '2024-01-23 04:15:55', '2024-02-12 15:31:03', NULL),
(16, 21, 'Aulia Harvy', 'Aulia', 'Harvy', '100021', 'auliaharvy@sangkil.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', 2, '2024-03-09 06:13:58', NULL, 1, 1, 21, NULL, '2024-03-04 15:25:37', '2024-03-09 06:13:58', NULL),
(15, 20, 'Aulia Harvy', 'Aulia', 'Harvy', '100020', 'auliaharvy@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', 16, '2024-03-12 16:40:39', NULL, 1, 1, 20, NULL, '2024-03-03 00:14:23', '2024-03-12 16:40:39', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'img/default-avatar.jpg',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `department_id`, `department_name`, `name`, `first_name`, `last_name`, `username`, `email`, `mobile`, `gender`, `date_of_birth`, `email_verified_at`, `password`, `avatar`, `status`, `remember_token`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, NULL, 'Super Admin', 'Super', 'Admin', '100001', 'super@admin.com', '930.927.3386', 'Male', '2022-03-10', '2024-01-23 04:15:52', '$2y$10$HtMd2Z.9eYOZ2BH/zi8f0euvBY61AUWGZifhSAMU0SFiD96572TCi', 'img/default-avatar.jpg', 1, NULL, NULL, NULL, NULL, '2024-01-23 04:15:52', '2024-01-23 04:15:52', NULL),
(2, NULL, NULL, 'Admin Istrator', 'Admin', 'Istrator', '100002', 'admin@admin.com', '870-988-9497', 'Female', '1975-05-03', '2024-01-23 04:15:52', '$2y$10$X8zNoI4N7yfDRP1tgOGLP.LtmuyKXcEzt9FVyaaUFjaQ5y3dqFttG', 'img/default-avatar.jpg', 1, NULL, NULL, NULL, NULL, '2024-01-23 04:15:52', '2024-01-23 04:15:52', NULL),
(3, NULL, NULL, 'Manager', 'Manager', 'User User', '100003', 'manager@manager.com', '772-749-4710', 'Female', '2020-01-11', '2024-01-23 04:15:52', '$2y$10$3eGe6382zepb.qshxjyME.mSVU.vgOlZ/YAZCkFQHRp7kEIRjjUxO', 'img/default-avatar.jpg', 1, NULL, NULL, 1, 1, '2024-01-23 04:15:52', '2024-03-02 09:29:31', NULL),
(4, NULL, NULL, 'Executive User', 'Executive', 'User', '100004', 'executive@executive.com', '+1-715-471-0040', 'Other', '2002-08-19', '2024-01-23 04:15:52', '$2y$10$uxkpemzZ4FWh/lYDwe5.3.5YPAkgrRWU3xAMhfiu0ZuNuIdCr7o8i', 'img/default-avatar.jpg', 1, NULL, NULL, NULL, NULL, '2024-01-23 04:15:52', '2024-01-23 04:15:52', NULL),
(5, NULL, NULL, 'General User', 'General', 'User', '100005', 'user@user.com', '+16162676098', 'Female', '1984-04-11', '2024-01-23 04:15:52', '$2y$10$8RyR5JNc3cEjlyVOXodnvOCF1xpw7Pa5cvV/ldpan.dOdDSnd8gVS', 'img/default-avatar.jpg', 1, NULL, NULL, NULL, NULL, '2024-01-23 04:15:52', '2024-01-23 04:15:52', NULL),
(21, '9b289c58-0c51-452e-8274-3d0f576ed658', 'Accounting', 'Aulia Harvy', 'Aulia', 'Harvy', '100021', 'auliaharvy@sangkil.net', NULL, NULL, NULL, '2024-03-04 15:25:37', '$2y$10$S2gtI0GUFjGfKvi6uJcsoeBuS.N5GIbG4jIi4rBr3Cx1KkYaLJOFW', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-03-04 15:25:37', '2024-03-09 06:13:44', NULL),
(20, '9b289c58-0c51-452e-8274-3d0f576ed658', 'Accounting', 'Aulia Harvy', 'Aulia', 'Harvy', '100020', 'auliaharvy@gmail.com', NULL, NULL, NULL, '2024-03-03 00:14:23', '$2y$10$13.cpMeR05D90E8Qnstuq.3TKbB0xOk6ucMuyaOxV0ay0iYMY2FI.', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-03-03 00:14:23', '2024-03-03 00:14:23', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_providers`
--

CREATE TABLE `user_providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `document_schedules`
--
ALTER TABLE `document_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD KEY `password_reset_tokens_email_index` (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `schedule_pics`
--
ALTER TABLE `schedule_pics`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `taggables`
--
ALTER TABLE `taggables`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `userprofiles`
--
ALTER TABLE `userprofiles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `user_providers`
--
ALTER TABLE `user_providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_providers_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `counters`
--
ALTER TABLE `counters`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `document_schedules`
--
ALTER TABLE `document_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `schedule_pics`
--
ALTER TABLE `schedule_pics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `taggables`
--
ALTER TABLE `taggables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `userprofiles`
--
ALTER TABLE `userprofiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `user_providers`
--
ALTER TABLE `user_providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
