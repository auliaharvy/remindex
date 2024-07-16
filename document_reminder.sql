-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jun 2024 pada 05.29
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `document_reminder`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(191) DEFAULT NULL,
  `event` varchar(191) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `batch_uuid` char(36) DEFAULT NULL,
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
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `group_name` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `order` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Active',
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
  `name` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `commentable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `commentable_type` varchar(191) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `user_name` varchar(191) DEFAULT NULL,
  `order` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
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
  `counter` int(11) NOT NULL DEFAULT 0,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `counters`
--

INSERT INTO `counters` (`id`, `year`, `counter`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 2024, 940, NULL, NULL, '2024-06-26 03:24:45', '2024-06-26 03:24:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `departments`
--

CREATE TABLE `departments` (
  `id` char(36) NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
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
('9b289bec-52cc-48da-80f6-bf9de8cb714a', 'FIN', 'FINANCE/ACCOUNTING', NULL, 1, 1, 1, NULL, '2024-01-23 04:19:29', '2024-05-14 01:10:28', NULL),
('9b289c58-0c51-452e-8274-3d0f576ed658', 'GS', 'GENERAL SERVICE', NULL, 1, 1, 1, NULL, '2024-01-23 04:20:40', '2024-05-14 01:11:20', NULL),
('9b289c68-aa9d-4ae6-a385-303d2fc9bf23', 'LOG', 'LOGISTIK', NULL, 1, 1, 1, NULL, '2024-01-23 04:20:51', '2024-05-14 01:11:48', NULL),
('9b9790b9-fb00-4e8f-9b35-df684c58933d', 'MCP', 'MARKETING CP', NULL, 1, 1, 1, NULL, '2024-03-18 09:05:04', '2024-05-14 01:12:13', NULL),
('9b9bab75-9e8e-4cd0-a6cb-301deff0cfdb', 'ADM', 'ADMINISTRATION', NULL, 1, 1, 1, NULL, '2024-03-20 10:03:08', '2024-05-14 01:09:19', NULL),
('9b9d0af4-9925-454b-bc87-0517e9a3f150', 'BPT', 'INFORMATION SYSTEM', NULL, 1, 1, 1, NULL, '2024-03-21 02:25:59', '2024-05-14 01:10:03', NULL),
('9c0991de-4462-46d3-9316-e68264152876', 'MJP', 'MARKETING JOHNSON PROFESSIONAL', NULL, 1, 1, 1, NULL, '2024-05-14 01:12:39', '2024-05-14 01:12:39', NULL),
('9c0991f6-eda1-418a-862c-84c093776595', 'OCC', 'OCCUPANCY', NULL, 1, 1, 1, NULL, '2024-05-14 01:12:55', '2024-05-14 01:12:55', NULL),
('9c099235-7638-4f23-ba31-900cfac67e74', 'ODE', 'WAREHOUSE/ OTHER DISTRIBUTIONS', NULL, 1, 1, 1, NULL, '2024-05-14 01:13:36', '2024-05-14 01:13:36', NULL),
('9c099247-6f16-43cc-92a3-b1d33b072ed6', 'PRO', 'PRODUCTION', NULL, 1, 1, 1, NULL, '2024-05-14 01:13:47', '2024-05-14 01:13:47', NULL),
('9c099265-3c9c-454f-8856-652000be2b1e', 'QC', 'QUALITY CONTROL', NULL, 1, 1, 1, NULL, '2024-05-14 01:14:07', '2024-05-14 01:14:07', NULL),
('9c099287-f178-4e79-938f-84397477b966', 'RND', 'RESEARCH & DEVELOPMENT', NULL, 1, 1, 1, NULL, '2024-05-14 01:14:30', '2024-05-14 01:14:30', NULL),
('9c0992a0-e9ef-4eb8-938c-97336614e269', 'SAL', 'SALES FORCE', NULL, 1, 1, 1, NULL, '2024-05-14 01:14:46', '2024-05-14 01:14:46', NULL),
('9c366a3e-ee8b-4d0c-b0f9-84bdfc841789', 'QC', 'QUALITY CONTROL', NULL, 1, 1, 1, 1, '2024-06-05 08:14:06', '2024-06-05 08:14:49', '2024-06-05 08:14:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `documents`
--

CREATE TABLE `documents` (
  `id` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `document_type_id` char(36) NOT NULL,
  `department_id` char(36) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `document_type_name` varchar(100) DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `location` varchar(191) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_used` int(11) NOT NULL DEFAULT 0 COMMENT '0: used, 1: unused',
  `is_expired` int(11) NOT NULL DEFAULT 0 COMMENT '0: expired, 1: non expired',
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
('9c60416f-2ba1-4030-b1f4-af7b264b6204', 21, '9c39f811-b50a-4417-bae7-265a520818cd', '9b289c68-aa9d-4ae6-a385-303d2fc9bf23', 'Aulia Harvy', 'auliaharvy@sangkil.net', 'Izin Perusahaan', 'LOGISTIK', 'DOC-2024-938', 'Test import 3 auliaharvy', 'Gudang', 'Client C', 'Klien C', NULL, 1, 0, 0, 1, 1, NULL, '2024-06-26 03:24:45', '2024-06-26 03:24:45', NULL),
('9c60416f-2ba1-445f-8402-d61203dc7f89', 21, '9b7f0de6-cc66-4872-9888-e3c4eada5dd5', '9b9d0af4-9925-454b-bc87-0517e9a3f150', 'Aulia Harvy', 'auliaharvy@sangkil.net', 'Surat Ijin Edar', 'INFORMATION SYSTEM', 'DOC-2024-937', 'Test import 2 auliaharvy', 'Gudang', 'Client B', 'Klien B', NULL, 1, 0, 0, 1, 1, NULL, '2024-06-26 03:24:45', '2024-06-26 03:24:45', NULL),
('9c603eab-49a7-454a-933e-0fdb3b93aa45', 21, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'Aulia Harvy', 'auliaharvy@sangkil.net', 'SERTIFIKAT NOMOR IJIN EDAR', 'FINANCE/ACCOUNTING', 'DOC-2024-935', 'Test dokumen manual', 'Kabinet 1', 'Kabinet 1', 'test dokumen', '1719371822.pdf', 2, 0, 0, 1, 1, NULL, '2024-06-26 03:17:02', '2024-06-26 03:17:02', NULL),
('9c60416f-1f70-487f-9f76-da7d94872cdb', 21, '9b289c9f-af53-4bf8-8852-4b913beb7ea9', '9b9bab75-9e8e-4cd0-a6cb-301deff0cfdb', 'Aulia Harvy', 'auliaharvy@sangkil.net', 'STNK', 'ADMINISTRATION', 'DOC-2024-936', 'Test import 1 auliaharvy', 'Gudang', 'Client A', 'Klien A', NULL, 1, 0, 0, 1, 1, NULL, '2024-06-26 03:24:45', '2024-06-26 03:24:45', NULL),
('9c603ab5-ddc8-47d0-9910-05c5a1f7ee3e', 21, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'Aulia Harvy', 'auliaharvy@sangkil.net', 'SERTIFIKAT NOMOR IJIN EDAR', 'FINANCE/ACCOUNTING', 'DOC-2024-934', 'Test dokumen manual', 'Kabinet 1', 'Kabinet 1', 'test dokumen', NULL, 2, 0, 0, 1, 1, NULL, '2024-06-26 03:05:57', '2024-06-26 03:05:57', NULL),
('9c6039ac-8b1a-4cfb-9496-f9ae23a7c437', 21, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'Aulia Harvy', 'auliaharvy@sangkil.net', 'SERTIFIKAT NOMOR IJIN EDAR', 'FINANCE/ACCOUNTING', 'DOC-2024-933', 'Test dokumen manual', 'Kabinet 1', 'Kabinet 1', 'test dokumen', NULL, 2, 0, 0, 1, 1, NULL, '2024-06-26 03:03:04', '2024-06-26 03:03:04', NULL),
('9c603937-54b5-421b-8d7c-6cafb858cdc4', 21, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9b9bab75-9e8e-4cd0-a6cb-301deff0cfdb', 'Aulia Harvy', 'auliaharvy@sangkil.net', 'SERTIFIKAT NOMOR IJIN EDAR', 'ADMINISTRATION', 'DOC-2024-932', 'Test dokumen manual', 'Kabinet 1', 'Kabinet 1', 'test dokumen', NULL, 2, 0, 0, 1, 1, NULL, '2024-06-26 03:01:47', '2024-06-26 03:01:47', NULL),
('9c43fb44-ead7-4b10-8b42-b77bdd997537', 38, '9c422579-308f-498a-aa1e-e05fde35d9ae', '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'Liana Tjia', 'liana.tjia@scjohnson.co.id', 'Master Sekretaris', 'FINANCE/ACCOUNTING', 'DOC-2024-930', 'Bank Correspondence & Telex Lokal', 'F-1B-5', 'A – 14 (1)', 'Deposito Lippo  2008/09', NULL, 5, 0, 1, 36, 36, NULL, '2024-06-12 02:05:23', '2024-06-12 02:05:23', NULL),
('9c426965-6bb9-413c-9ee7-6472cbab09e5', 25, '9b289c9f-af53-4bf8-8852-4b913beb7ea9', '9b289c58-0c51-452e-8274-3d0f576ed658', 'Inneke Vincentia', 'inneke.vincentia@scjohnson.co.id', 'STNK', 'GENERAL SERVICE', 'DOC-2024-929', 'STNK Mobil BMW', 'laci', 'stnk', NULL, NULL, 5, 1, 1, 1, 1, NULL, '2024-06-11 07:21:40', '2024-06-11 07:21:40', NULL),
('9c4267b4-a31f-4c3f-a812-164557a41d0f', 38, '9c422579-308f-498a-aa1e-e05fde35d9ae', '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'Liana Tjia', 'liana.tjia@scjohnson.co.id', 'Master Sekretaris', 'FINANCE/ACCOUNTING', 'DOC-2024-927', 'Bank Correspondence & Telex Lokal', 'F-1B-5', 'A – 14 (1)', 'Deposito Lippo  2008/09', NULL, 5, 0, 1, 36, 36, NULL, '2024-06-11 07:16:56', '2024-06-11 07:16:56', NULL),
('9c4226fb-9a4e-4db1-bef6-889a9f1a5725', 38, '9c422579-308f-498a-aa1e-e05fde35d9ae', '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'Liana Tjia', 'liana.tjia@scjohnson.co.id', 'Master Sekretaris', 'FINANCE/ACCOUNTING', 'DOC-2024-925', 'Bank Correspondence & Telex Lokal', 'F-1B-5', 'A – 14 (1)', 'Deposito Lippo 2008/09', NULL, 5, 1, 1, 36, 36, NULL, '2024-06-11 04:15:57', '2024-06-11 04:15:57', NULL),
('9c4227a1-4186-4a44-a8be-96b1335af87a', 38, '9c422579-308f-498a-aa1e-e05fde35d9ae', '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'Liana Tjia', 'liana.tjia@scjohnson.co.id', 'Master Sekretaris', 'FINANCE/ACCOUNTING', 'DOC-2024-926', 'Bank Correspondence & Telex Lokal', 'F-1B-5', 'A – 14 (1)', 'Deposito Lippo  2008/09', NULL, 5, 1, 1, 36, 36, NULL, '2024-06-11 04:17:46', '2024-06-11 04:17:46', NULL),
('9c4226bc-8ba6-45f4-8a32-67be3e118108', 38, '9c422579-308f-498a-aa1e-e05fde35d9ae', '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'Liana Tjia', 'liana.tjia@scjohnson.co.id', 'Master Sekretaris', 'FINANCE/ACCOUNTING', 'DOC-2024-924', 'Bank Correspondence & Telex Lokal', 'F-1B-5', 'A – 14 (1)', 'Deposito Lippo 2008/09', NULL, 5, 1, 1, 36, 36, NULL, '2024-06-11 04:15:16', '2024-06-11 04:15:16', NULL),
('9c3a8853-6806-4b4a-8f3a-22d17b68815a', 34, '9c39f811-b50a-4417-bae7-265a520818cd', '9b289c58-0c51-452e-8274-3d0f576ed658', 'Megawati Suryana', 'Megawati@scjohnson.co.id', 'Izin Perusahaan', 'GENERAL SERVICE', 'DOC-2024-913', 'Izin Perusahaan Peraturan Perusahaan Depnaker', 'Ruang Personnel', 'Depnaker', '324 PP L IV D', NULL, 2, 1, 0, 1, 1, 1, '2024-06-07 09:21:32', '2024-06-07 09:21:43', '2024-06-07 09:21:43'),
('9c3a87a0-47ac-41e7-b8f6-98e91e6e0014', 34, '9c39f811-b50a-4417-bae7-265a520818cd', '9b289c58-0c51-452e-8274-3d0f576ed658', 'Megawati Suryana', 'Megawati@scjohnson.co.id', 'Izin Perusahaan', 'GENERAL SERVICE', 'DOC-2024-912', 'Izin Perusahaan Peraturan Perusahaan Depnaker', 'Ruang Personnel', 'Depnaker', '324 PP L IV D', NULL, 2, 1, 0, 1, 1, 1, '2024-06-07 09:19:34', '2024-06-07 09:19:47', '2024-06-07 09:19:47'),
('9c3a8743-ae87-4244-b664-beee8ed0490b', 34, '9c39f811-b50a-4417-bae7-265a520818cd', '9b289c58-0c51-452e-8274-3d0f576ed658', 'Megawati Suryana', 'Megawati@scjohnson.co.id', 'Izin Perusahaan', 'GENERAL SERVICE', 'DOC-2024-911', 'Izin Perusahaan Peraturan Perusahaan Depnaker', 'Ruang Personnel', 'Depnaker', '324 PP L IV D', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 09:18:33', '2024-06-07 09:18:33', NULL),
('9c3a6e35-2c23-43d1-8806-eac188c56b79', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-902', 'Sertifikat Kalibrasi Spectrophotometer UV-Vis', 'bench depan', 'Balai Kalibrasi', 'HACH DR2800/1346370', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e35-260b-4f19-8180-edfe7148beb5', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-901', 'Sertifikat Kalibrasi Ring Gauge  Kroeplin', 'lemari', 'Balai Kalibrasi', 'A2100 0641-32 AA05P031 03618', NULL, 1, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e35-260b-48d3-98a8-c2babbf03ce9', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-900', 'Sertifikat Kalibrasi Stopwatch', 'lemari', 'Balai Kalibrasi', 'Diamond 803', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e35-1ff3-4e35-bcc6-341bd8515219', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-899', 'Sertifikat Kalibrasi Meteran ACE', 'lemari', 'Balai Kalibrasi', '3.5 M 2165157', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e35-1ff3-492e-bf48-01b05204531e', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-898', 'Sertifikat Kalibrasi Volume Pipet Iwaki Pyrex', 'bench tengah', 'Balai Kalibrasi', '50 ml', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e35-19db-4e48-8bf6-002890ec5a20', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-897', 'Sertifikat Kalibrasi Volume Pipet Iwaki Pyrex', 'bench tengah', 'Balai Kalibrasi', '25 ml', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e35-13c3-4765-8444-7f83130e5268', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-896', 'Sertifikat Kalibrasi Volume Pipet Iwaki Pyrex', 'bench tengah', 'Balai Kalibrasi', '10 ml', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e35-13c3-4262-a927-4529d37f6fe1', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-895', 'Sertifikat Kalibrasi Volume Pipet Iwaki Pyrex', 'bench tengah', 'Balai Kalibrasi', '1 ml', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e35-0dab-4f1d-b89e-a205858d85dd', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-894', 'Sertifikat Kalibrasi Hydrometer Iwaki Pyrex', 'bench tengah', 'Balai Kalibrasi', '1.000 - 1.200', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e35-0793-4ec2-bf14-61744e05d451', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-892', 'Sertifikat Kalibrasi Hydrometer Iwaki Pyrex', 'bench tengah', 'Balai Kalibrasi', '0.800 - 0.900', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e35-0dab-4024-9633-f157031823ff', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-893', 'Sertifikat Kalibrasi Hydrometer Iwaki Pyrex', 'bench tengah', 'Balai Kalibrasi', '0.900 - 1.000', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e35-0793-4ad2-9fc1-4e639fa94a0d', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-891', 'Sertifikat Kalibrasi Hydrometer Iwaki Pyrex', 'bench tengah', 'Balai Kalibrasi', '0.700 - 0.800', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e35-017b-44b4-be10-d975cb47e159', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-890', 'Sertifikat Kalibrasi Labu ukur Iwaki pyrex', 'bench tengah', 'Balai Kalibrasi', '1000 ml', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e34-fb63-4cd1-99ed-a02bd787dac9', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-889', 'Sertifikat Kalibrasi Labu ukur Iwaki pyrex', 'bench tengah', 'Balai Kalibrasi', '250 ml', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e34-fb63-4896-9a33-153d13662aae', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-888', 'Sertifikat Kalibrasi Labu ukur Iwaki pyrex', 'bench tengah', 'Balai Kalibrasi', '100 ml', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e34-f54b-4ef6-9931-587a2c2f3e58', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-887', 'Sertifikat Kalibrasi Gelas Ukur Iwaki Pyrex', 'bench tengah', 'Balai Kalibrasi', '100 ml', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e34-f54b-4861-abd6-2d4c14ba7871', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-886', 'Sertifikat Kalibrasi Gelas Ukur Iwaki Pyrex', 'bench tengah', 'Balai Kalibrasi', '50 ml', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
('9c3a6e34-ef33-4a2b-9ead-beddc6cf0cd9', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-885', 'Sertifikat Kalibrasi Gelas Ukur Iwaki Pyrex', 'bench tengah', 'Balai Kalibrasi', '25 ml', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-e91b-4f08-b7b2-ce923d3f0818', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-884', 'Sertifikat Kalibrasi Gelas Ukur Iwaki Pyrex', 'bench tengah', 'Balai Kalibrasi', '10 ml', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-e91b-43a1-b4b0-a1efc0e1d609', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-883', 'Sertifikat Kalibrasi Piknometer Iwaki Pyrex', 'bench tengah', 'Balai Kalibrasi', '10 ml', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-dceb-4ba0-80fe-cbbf07d6e847', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-881', 'Sertifikat Kalibrasi Refraktometer Hergestelt I', 'bench depan', 'Balai Kalibrasi', 'DDR 1 752358', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-e303-415e-9fa4-d21b435a17aa', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-882', 'Sertifikat Kalibrasi Buret Manual  Normax', 'bench tengah', 'Balai Kalibrasi', '25 ml AS', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-dceb-425f-acc5-55227ddb3535', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-880', 'Sertifikat Kalibrasi pH Meter Mettler', 'bench depan', 'Balai Kalibrasi', 'Seven Compact Duo 5818340756', NULL, 1, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-d6d3-4956-8b20-ac7a25ad402c', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-879', 'Sertifikat Kalibrasi Viscosimeter Broekfield', 'bench depan', 'Calthesys', 'DVEE LVT JO 86040567', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-d0bb-44d0-ac1d-f906b6567859', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-878', 'Sertifikat Kalibrasi Burette Digital', 'bench tengah', 'Balai Kalibrasi', 'Brand A/09N55816', NULL, 1, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-d0bb-4acf-a3cd-41377f7d5a03', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-877', 'Sertifikat Kalibrasi Burette Digital', 'bench tengah', 'Balai Kalibrasi', 'Brand 17D45549', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-caa3-487f-8f97-f94520cf473f', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-876', 'Sertifikat Kalibrasi Burette Digital', 'bench tengah', 'Balai Kalibrasi', 'Brand 2 09Z9947', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-caa3-433a-a39b-b858a7d593a9', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-875', 'Sertifikat Kalibrasi Pressure Gauge 1', 'lemari', 'Balai Kalibrasi', 'Ashcroft 524-09', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-c48b-4de7-85bd-fa6527b059f2', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-874', 'Sertifikat Kalibrasi Digimatic Caliper  1', 'lemari', 'Balai Kalibrasi', 'Mitutoyo 0023833', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-c48b-43f0-a7bf-ef9ee30aa937', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-873', 'Sertifikat Kalibrasi Thickness Gauge  1', 'lemari', 'Balai Kalibrasi', 'Mitutoyo 2048 F 7301', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-be73-4471-9d2d-0e4b5ba073d3', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-872', 'Sertifikat Kalibrasi Glasthermometer  1', 'lemari', 'Balai Kalibrasi', 'Immersion Total / N16B', NULL, 1, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-b85b-4b49-9f3b-ae0ede5e83d7', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-871', 'Sertifikat Kalibrasi Anak Timbangan', 'lemari', 'Balai Kalibrasi', 'Mettler Toledo', NULL, 3, 1, 0, 1, 28, NULL, '2024-06-07 08:08:29', '2024-06-10 02:25:27', NULL),
('9c3a6e34-b85b-4ef0-a984-a4579479c9d4', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-870', 'Sertifikat Kalibrasi Timbangan RADWAG', 'area check fg', 'Balai Kalibrasi', 'WTC 2000 506297', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-b243-456e-9c7c-058d93ef10f4', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-869', 'Sertifikat Kalibrasi Timbangan Ohaus', 'area check pm', 'Balai Kalibrasi', 'Scout SPX 2201 B911377970', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-b243-4997-94ee-451f301b3d56', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-868', 'Sertifikat Kalibrasi Timbangan Ohaus', 'area check subcon', 'Balai Kalibrasi', 'NV 2101 8337346267', NULL, 1, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-ac2b-46a6-8c84-fe8dd9ae36d9', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-867', 'Sertifikat Kalibrasi Timbangan Ohaus', 'liquid line', 'Balai Kalibrasi', 'Scout SPX 2201 B303736116', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a6e34-a613-49c2-b237-8c8f32950b83', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-866', 'Sertifikat Kalibrasi Timbangan Mettler Toledo', 'bench samping', 'Mettler Toledo', 'MS 204TS/00 C252448703', NULL, 4, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c3a3e69-35f6-4ab6-8a44-b5d1a5ae0c83', 24, '9b289c9f-af53-4bf8-8852-4b913beb7ea9', '9b289c58-0c51-452e-8274-3d0f576ed658', 'Chandra Kirana', 'chandra.kirana@scjohnson.co.id', 'STNK', 'GENERAL SERVICE', 'DOC-2024-858', 'STNK B M W Samsat', 'Yusuf', 'Samsat', 'B 8948 KO - SCJ', NULL, 1, 1, 0, 1, 1, NULL, '2024-06-07 05:54:51', '2024-06-07 05:54:51', NULL),
('9c3a6e34-99e2-485c-8884-b0be5801b63f', 30, '9c35de10-a7b6-4762-9a8f-05ce94700eef', '9c099265-3c9c-454f-8856-652000be2b1e', 'Juliani Widjaya', 'Juliani.Widjaya@scjohnson.co.id', 'Sertifikat Kalibrasi', 'QUALITY CONTROL', 'DOC-2024-865', 'Sertifikat Kalibrasi Timbangan Mettler Toledo', 'bench samping', 'Balai Kalibrasi', 'GB 3002 1119200450', NULL, 2, 1, 0, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
('9c2a1457-0451-425c-a0dd-55407a0d5d84', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-847', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH HANG \'N GO CAR FRESHENER SAKURA BLOOM', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20602020588', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
('9c2a1456-fe39-4225-9c54-ae005f9499ac', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-846', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH CAR FRESHENER HANG \'N GO, VANILLA ICE CREAM', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20602810297', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
('9c2a1456-fe39-4cb7-8e04-904caec3bb0a', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-845', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH HANG \'N GO CAR FRESHENER, DARK ICE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20602020176', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
('9c2a1456-f821-4147-b246-6965e1136986', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-844', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH CAR FRESHENER HANG \'N GO ORANGE PEACH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20602220069', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
('9c2a1456-f821-4d70-b589-ee03184c3281', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-843', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH CAR FRESHENER HANG \'N GO, CARAMEL VANILLA COFFEE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20602810296', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
('9c2a1456-f209-4fe5-ad1a-5f0bc17ff2dd', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-842', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH HANG \'N GO CAR FRESHENER, STRAWBERRY BUBBLEGUM', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20602910281', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
('9c2a1456-f209-427d-8c48-051bbc3056f8', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-841', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH HANG \'N GO FROZEN LIME', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20603510041', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
('9c2a1456-ebf1-48e7-9071-e71ae4327113', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-840', 'SERTIFIKAT NOMOR IJIN EDAR GLADE TOUCH \'N FRESH FOR TOILET, FRESH LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20601610212', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
('9c2a1456-ebf1-4e7e-87ef-6987b3a0759d', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-839', 'SERTIFIKAT NOMOR IJIN EDAR GLADE TOUCH \'N FRESH FOR TOILET, LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20601610215', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
('9c2a1456-e5d9-41d2-a1a0-2119eea490cc', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-838', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER TOUCH \'N FRESH FOR BEDROOM,OCEAN ESCAPE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20601910059', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-e5d9-4320-9baf-09676c8f503c', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-837', 'SERTIFIKAT NOMOR IJIN EDAR GLADE TOUCH \'N FRESH AIR FRESHENER, PEONY & BERRY BLISS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20601810645', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-dfc1-4dff-8466-de0883f556d4', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-836', 'SERTIFIKAT NOMOR IJIN EDAR GLADE TOUCH \'N FRESH FOR BEDROOM, SUMMER BOUQUET', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20601610210', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-dfc1-4ec8-8d6b-ffe6a3564202', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-835', 'SERTIFIKAT NOMOR IJIN EDAR GLADE TOUCH \'N FRESH FOR BEDROOM, ROMANTIC LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20601610214', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-d9a9-4571-bf99-96bdabb44c9e', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-834', 'SERTIFIKAT NOMOR IJIN EDAR GLADE DEO SMILE NEW CAR FRESH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20602220047', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-d390-4e9a-8252-1a6b557e6a56', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-833', 'SERTIFIKAT NOMOR IJIN EDAR GLADE DEO SMILE BREEZE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20602220046', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-d390-4c4e-84fc-b5cc6ec4a96a', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-832', 'SERTIFIKAT NOMOR IJIN EDAR GLADE DEO SMILE CITRUS BERRIES', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20602220048', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-cd78-4fb4-8b0d-ec9402fa132c', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-831', 'SERTIFIKAT NOMOR IJIN EDAR GLADE DEO SMILE ELEGANT VANILLA & OUD WOOD', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKL 20602320280', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-cd78-40de-8aa2-1bacda25950c', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-830', 'SERTIFIKAT NOMOR IJIN EDAR J-80 SANITIZER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20502310170', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-c760-4a90-a49d-fb85868aeba6', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-829', 'SERTIFIKAT NOMOR IJIN EDAR TRUSOL KARBOL WANGI', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20502710323', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-c760-4211-8c85-314492d04a48', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-828', 'SERTIFIKAT NOMOR IJIN EDAR ACTION CLEANER AND DESINFECTANT', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20502710985', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-c148-481a-9628-d929e432b5c4', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-827', 'SERTIFIKAT NOMOR IJIN EDAR FORWARD CLEANER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20502711707', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-c148-4e29-a722-8710652075ad', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-826', 'SERTIFIKAT NOMOR IJIN EDAR SC JOHNSON HAND SANITIZER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20501020168', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-bb30-4329-8ce9-3ceb2831d7f0', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-825', 'SERTIFIKAT NOMOR IJIN EDAR SC JOHNSON HAND SANITIZER LIQUID, GREEN TEA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20501122476', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-bb30-4ebf-b34b-ee457cb04c54', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-824', 'SERTIFIKAT NOMOR IJIN EDAR SC JOHNSON HAND SANITIZER LIQUID, FLORAL', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20501122504', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-b518-4c80-aa58-30c41bbac937', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-823', 'SERTIFIKAT NOMOR IJIN EDAR GLADE 3 in 1 SURFACE DISINFECTANT & AIR SANITIZER CLEAN AND FRESH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20502024018', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-b518-49b6-97e4-40ef5c21b633', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-822', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK KARBOL WANGI SEREH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20502020173', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-af00-4b9b-8a49-09be4ee5ded8', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-821', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK KARBOL WANGI LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20502811891', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-af00-4b29-8b4b-9639374cb8ff', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-820', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK KARBOL WANGI PINUS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20502910552', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-a8e8-43d9-972e-4bf86b1fb8e2', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-819', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK KARBOL WANGI MINT', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20502811892', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-a8e8-4258-aa10-f6c1a8502c77', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-818', 'SERTIFIKAT NOMOR IJIN EDAR GLADE CONTINUOUS FRESHNESS AIR FRESHENER, MORNING FRESHNESS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601110554', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-a2d0-431f-b7c9-2ed0c4383a55', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-817', 'SERTIFIKAT NOMOR IJIN EDAR GLADE CONTINUOUS FRESHNESS, OCEAN ESCAPE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601210465', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-a2d0-4615-bb14-301ceda75d3b', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-816', 'SERTIFIKAT NOMOR IJIN EDAR GLADE CONTINUOUS FRESHNESS, FLOWER NECTAR', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601110555', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-9cb8-449b-852f-f4714167b6f9', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-815', 'SERTIFIKAT NOMOR IJIN EDAR GLADE SENSATION AIR FRESHENER, LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601711272', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-9cb8-457c-96e5-1b758fe08743', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-814', 'SERTIFIKAT NOMOR IJIN EDAR GLADE SENSATION AIR FRESHENER, PEONY AND BERRY BLISS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601710368', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-96a0-47b8-82d5-23b8560e7adf', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-813', 'SERTIFIKAT NOMOR IJIN EDAR GLADE SENSATION AIR FRESHENER, CAR AQUA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601610478', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-96a0-4be7-842d-ea9460bc3d8d', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-812', 'SERTIFIKAT NOMOR IJIN EDAR GLADE SENSATION AIR FRESHENER, JASMINE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601711271', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-9088-432a-a2d9-cda73537792c', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-811', 'SERTIFIKAT NOMOR IJIN EDAR GLADE SENSATION AIR FRESHENER DÉCOR, LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601610473', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-9088-4084-8982-04c3483bdae6', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-810', 'SERTIFIKAT NOMOR IJIN EDAR GLADE SENSATION CAR MORNING FRESHNESS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20603010598', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-8a70-4ae6-b344-5e81a0f1d898', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-809', 'SERTIFIKAT NOMOR IJIN EDAR GLADE PENYEGAR UDARA, SAKURA BLOOM', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601220493', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-8a70-4739-a55f-605fccefdbd5', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-808', 'SERTIFIKAT NOMOR IJIN EDAR GLADE PENYEGAR UDARA, OCEAN ESCAPE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601320519', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-8458-4252-ac72-33d0a6001b70', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-807', 'SERTIFIKAT NOMOR IJIN EDAR GLADE PENYEGAR UDARA LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601710142', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-8458-4705-a9f2-f1193b555bcc', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-806', 'SERTIFIKAT NOMOR IJIN EDAR GLADE PENYEGAR UDARA APPLE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601710141', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-7e40-4985-a102-6d084be235e5', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-805', 'SERTIFIKAT NOMOR IJIN EDAR GLADE PENYEGAR UDARA FRENCH BOUQUET', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601710140', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-7e40-4af3-a3f2-a884c6689cf3', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-804', 'SERTIFIKAT NOMOR IJIN EDAR GLADE PENYEGAR UDARA FRENCH MODERN', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601710143', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-7828-44ae-9ce5-73d1488114ef', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-803', 'SERTIFIKAT NOMOR IJIN EDAR REFRESH CARPET DEODORIZER, LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20605220041', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-7828-4a2c-b753-003926480715', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-802', 'SERTIFIKAT NOMOR IJIN EDAR REFRESH CARPET DEODORIZER, LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20605220017', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-7210-49ad-bf4c-e6ded2d719a9', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-801', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH REED DIFFUSER MEN SERIES OCEAN', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601320514', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-7210-4fab-ab7d-f413e8f1437c', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-800', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH REED DIFFUSER MEN SERIES MIDNIGHT', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601320512', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-6bf8-432c-ad45-f2c27447237d', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-799', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH REED DIFFUSER MEN SERIES FOREST', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601320511', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-6bf8-47be-a6f0-784a72c6105c', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-798', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH REED DIFFUSER MEN SERIES DESERT', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601320513', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-65e0-4fa8-9e42-16a1917f4494', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-797', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER ESSENTIAL OIL, PEPPERMINT', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601122225', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-65e0-43d4-b770-3e47c7ae1a8d', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-796', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER ESSENTIAL OIL, LEMONGRASS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601122175', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-5fc8-4526-864f-f2ac572fa43d', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-795', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER ESSENTIAL OIL, COFFEE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601122167', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-5fc8-4230-8354-58c121ee6ec0', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-794', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER ESSENTIAL OIL, LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601122139', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-59b0-4e29-88da-86dc6b178825', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-793', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH REED DIFFUSER, JAPANESE MATCHA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601420008', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-5398-4a43-8312-d1b4c3d135e8', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-792', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH REED DIFFUSER, KOREAN MAGNOLIA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601420007', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-5398-4550-bfd3-c068b782ae8a', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-791', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH ROOM FRESHENER REED DIFFUSER, MINT EUCALYPTUS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601910488', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-5398-4570-92fe-1f1a050be33f', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-790', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH ROOM FRESHENER REED DIFFUSER, MORNING COFFEE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601024080', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL);
INSERT INTO `documents` (`id`, `user_id`, `document_type_id`, `department_id`, `user_name`, `user_email`, `document_type_name`, `department_name`, `code`, `name`, `location`, `source`, `description`, `file`, `status`, `is_used`, `is_expired`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('9c2a1456-4d80-4cc2-9b01-955a1abeb9e3', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-789', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH ROOM FRESHENER REED DIFFUSER, AMBER LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601910433', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-4768-4c11-9225-05eb6f42ad89', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-788', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH ROOM FRESHENER REED DIFFUSER, VANILLA BEAN', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601910532', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-4768-430f-82ff-9d48730c383a', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-787', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH ROOM FRESHENER REED DIFFUSER, YUZU PEACH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601024049', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-4150-4b13-b182-9fad5a78b805', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-786', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH ROOM FRESHENER REED DIFFUSER, SAKURA BLOOM', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601910490', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-4150-4a0f-8aa7-dddd78ce216c', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-785', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER, SAKURA BLOOM', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601023808', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-3b38-41ba-b352-9792ae88ecf6', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-784', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER, MORNING COFFEE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601710549', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-3b38-46ac-817e-b3add24b17f8', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-783', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER, ORANGE VERBENA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601020180', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-3520-4556-9ce1-45a214abe023', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-782', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER, ROSE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601610632', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-3520-497c-83b8-537c298b8dc7', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-781', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER STRAWBERRY BUBBLEGUM', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601911218', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-2f08-48f8-bb18-b62d31bdba93', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-780', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER, LEMON YUZU', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601020207', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-2f08-4778-b35a-e877dce6ab9e', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-779', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH EVERYWHERE KOREAN MAGNOLIA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601420004', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-28f0-4f69-9929-dcc46aaede78', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-778', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH FRESHENER EVERYWHERE, SAKURA BLOOM', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601023806', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-28f0-4207-bb29-a923518f3e7f', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-777', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH CAR FRESHENER EVERYWHERE, CAPPUCCINO COFFEE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20602220037', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-22d8-4686-a4f6-02d703920e8e', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-776', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER EVERYWHERE, MORNING COFFEE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601710551', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-22d8-4cff-b927-a0cd0b6ab12d', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-775', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH EVERYWHERE, STRAWBERRY BUBBLEGUM', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601911369', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-1cc0-4f94-8198-fddb70f8e475', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-774', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER EVERYWHERE, ORANGE VERBENA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601023710', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-1cc0-47fc-8087-ea24dab72e0a', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-773', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH EVERYWHERE PEWANGI RUANGAN, APPLE SPLASH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601410312', NULL, 1, 1, 0, 1, 23, NULL, '2024-05-30 05:03:57', '2024-06-11 01:57:08', NULL),
('9c2a1456-16a8-4451-8af6-8cd988e4f683', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-772', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AUTOMATIC SPRAY AIR FRESHENER, SAKURA BLOOM', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601023812', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-16a8-4a4a-a577-4dbc32add5b8', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-771', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER AUTOMATIC SPRAY, MORNING COFFEE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601710544', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-1090-4cbd-8ccf-b5402840eb29', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-770', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AUTOMATIC SPRAY AIR FRESHENER, STRAWBERRY BUBBLEGUM', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601911195', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-1090-4064-a026-425393ce9e33', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-769', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AUTOMATIC SPRAY ORANGE VERBENA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601020179', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-0a77-499d-bb39-6e0950bb2ed3', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-768', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER POP SCENT, JOY', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601911172', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-0a77-4c30-bf06-96063023a972', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-767', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER POP SCENT, LOVELY', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601911174', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-045f-42c8-8499-74f7a7a2e092', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-766', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER POP SCENT, PRETTY', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601911175', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1456-045f-409f-b3a0-e2281f86a21b', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-765', 'SERTIFIKAT NOMOR IJIN EDAR BAYFRESH AIR FRESHENER POP SCENT, CLEAN', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601910965', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-fe47-4a67-adc7-c9dc799c9596', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-764', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER AUTOMATIC SPRAY, ELEGANT VANILLA & OUD WOOD', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601812083', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-fe47-4f07-a40b-d56f9785181b', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-763', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AUTOMATIC SPRAY, OCEAN ESCAPE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601310656', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-f82f-4bbc-aba1-8da47a12fc59', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-762', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER AUTOMATIC SPRAY, WILD BERRIES', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601811050', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-f217-4297-a256-30a3307c7a2c', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-761', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER AUTOMATIC SPRAY, LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601811544', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-f217-4bb1-975d-8bb02d0ca229', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-760', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER AUTOMATIC SPRAY PEONY AND BERRY BLISS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601811527', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-ebff-42ec-b012-2e072afb1cbd', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-759', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AUTOMATIC SPRAY, LAVENDER & VANILLA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601310657', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-ebff-4a55-97b5-577d35f473de', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-758', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER AUTOMATIC SPRAY, SHEER VANILLA EMBRACE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601220318', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-e5e7-4916-81c5-52ff4de47b6f', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-757', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AUTOMATIC SPRAY, AQUA MARINE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601220224', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-e5e7-47a4-9683-5ab937e9763c', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-756', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER HANG IT FRESH FLORAL FRESH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601122668', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-dfcf-48e3-9b9e-3df35b7b338b', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-755', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER HANG IT FRESH LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601122667', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-dfcf-4261-a789-a9e71fa97f41', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-754', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER HANG IT FRESH WILD BERRIES', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20605122673', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-d9b7-4cd1-b984-21964937390f', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-753', 'SERTIFIKAT NOMOR IJIN EDAR GLADE ONE FOR ALL AIR FRESHENER, JASMINE TEA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601420019', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-d9b7-46d1-b070-eea5685e2086', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-752', 'SERTIFIKAT NOMOR IJIN EDAR GLADE ONE FOR ALL , KLEPON CAKE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601420009', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-d39f-4989-9720-8791066781f0', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-751', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER ONE FOR ALL, ELEGANT VANILLA & OUDWOOD', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601911470', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-d39f-468d-aece-21f6da5edc6a', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-750', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER ONE FOR ALL, PEONY & BERRY BLISS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601711620', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-cd87-46e4-8a9d-75df62d8b047', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-749', 'SERTIFIKAT NOMOR IJIN EDAR GLADE ONE FOR ALL AIR FRESHENER, OCEAN ESCAPE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601610240', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-cd87-4d00-bccb-d04f31346eff', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-748', 'SERTIFIKAT NOMOR IJIN EDAR GLADE ONE FOR ALL AIR FRESHENER, EXOTIC FLOWERS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601610182', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-c76f-4e51-853a-49d0c5c01dea', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-747', 'SERTIFIKAT NOMOR IJIN EDAR GLADE ONE FOR ALL AIR FRESHENER, ORANGE PEACH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601610198', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-c76f-49a1-ba82-1049d3ccc97e', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-746', 'SERTIFIKAT NOMOR IJIN EDAR GLADE ONE FOR ALL AIR FRESHENER, LEMON SQUASH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601610181', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-c157-4733-8676-e2268626cdc9', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-745', 'SERTIFIKAT NOMOR IJIN EDAR GLADE ONE FOR ALL AIR FRESHENER, SHEER VANILLA EMBRACE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601220444', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-bb3f-4ad2-bd0c-2b334ae968a1', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-744', 'SERTIFIKAT NOMOR IJIN EDAR GLADE CAR AIR FRESHENER, FRESH LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20603610197', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-bb3f-4894-ba06-b18359045faf', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-743', 'SERTIFIKAT NOMOR IJIN EDAR GLADE CAR FRESH AIR FRESHENER, WILD BERRIES', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20602811177', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-b527-48a0-a3a4-6d5740049da6', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-742', 'SERTIFIKAT NOMOR IJIN EDAR GLADE CAR FRESH, AQUA MARINE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20602220066', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-b527-4416-8cf6-c2cf68fa47eb', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-741', 'SERTIFIKAT NOMOR IJIN EDAR GLADE CAR FRESH, SWEET APPLE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20603610239', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-af0f-4c84-b4ac-13957759b7f7', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-740', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER AEROSOL SPRAY, ELEGANT VANILLA & OUD WOOD', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601812261', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-af0f-45a7-abc5-8fa281b035d9', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-739', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AEROSOL SPRAY, OCEAN ESCAPE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601410433', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-a8f7-4eba-bafc-074be17753ca', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-738', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER AEROSOL SPRAY, WILD BERRIES', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601811055', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-a8f7-4b49-b131-7c31c1643f87', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-737', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AEROSOL SPRAY AIR FRESHENER, WILD LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601510232', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-a2df-49ba-a92b-14844373cc49', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-736', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AEROSOL SPRAY, ORANGE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601410429', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-a2df-4e22-9c27-60af6822f3aa', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-735', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AEROSOL SPRAY AIR FRESHENER, LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601910066', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-9cc7-48a2-acb6-e4441821b054', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-734', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AEROSOL SPRAY, SPRING JASMINE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601410432', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-9cc7-470d-8a45-3cc4e0ca47ec', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-733', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER AEROSOL SPRAY, PEONY AND BERRY BLISS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601812298', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-96af-452a-93c4-9dbed13e9945', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-732', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER AEROSOL SPRAY, SHEER VANILLA EMBRACE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601220317', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-96af-4fb1-bcf2-a7d76407846d', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-731', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER AEROSOL SPRAY, AQUA MARINE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601220251', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-9097-4602-8ea3-7e8edd4e563f', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-730', 'SERTIFIKAT NOMOR IJIN EDAR GLADE BATHROOM FRESH AIR FRESHENER, LAVENDER MIST', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601320947', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-9097-42a2-bd6f-ed5648ef4d86', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-729', 'SERTIFIKAT NOMOR IJIN EDAR GLADE BATHROOM FRESH AIR FRESHENER, FRESH AIR', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601321236', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-8a7f-48f2-af44-fd06a6b80c0b', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-728', 'SERTIFIKAT NOMOR IJIN EDAR GLADE BATHROOM FRESH AIR FRESHENER, MOUNTAIN PINE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601320949', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-8a7f-41bc-b8b7-5d413d522608', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-727', 'SERTIFIKAT NOMOR IJIN EDAR GLADE BATHROOM FRESH AIR FRESHENER, LEMON ZEST', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601320948', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-8467-47f7-abeb-ccd2da31a32c', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-726', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER DIAMOND, ESPRESSO COFFEE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20602023879', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-8467-4115-8b89-41bcb9fb0a5a', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-725', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER DIAMOND, WILD BERRIES', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20603610665', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-7e4f-4a96-a20a-46f4152b9286', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-724', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER DIAMOND, AQUA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20603610664', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-7e4f-4284-a50e-de4cfee372a8', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-723', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER DIAMOND, SPRING APPLE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20603610666', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-7837-470b-b3fc-d496817ef89a', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-722', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER DIAMOND, ORANGE SPLASH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20603610660', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-7837-47f1-a4c5-986a4c277771', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-721', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER DIAMOND, LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20603610659', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-721f-4db0-be27-6f58ce40ecdf', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-720', 'SERTIFIKAT NOMOR IJIN EDAR GLADE CAR GEL, OCEAN ESCAPE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20602420001', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-721f-4f2f-a3d8-7e8667f5e416', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-719', 'SERTIFIKAT NOMOR IJIN EDAR GLADE CAR GEL, ESPRESSO COFFEE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20602122522', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-6c07-447e-8e04-8b210fa5f915', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-718', 'SERTIFIKAT NOMOR IJIN EDAR GLADE CAR GEL AIR FRESHENER, WIILD BERRIES', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20602811393', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-6c07-4777-956b-19b683bcfad2', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-717', 'SERTIFIKAT NOMOR IJIN EDAR GLADE CAR GEL, ORANGE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601800444', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-65ef-4e47-879f-63302e50b27d', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-716', 'SERTIFIKAT NOMOR IJIN EDAR GLADE SCENTED GEL ELEGANT VANILLA & OUDWOOD', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601911606', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-65ef-484a-8d8a-93afb7b18eb9', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-715', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER SCENTED GEL, WILD BERRIES', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601811118', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
('9c2a1455-5fd7-4e1c-9b71-9c09556a540f', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-714', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER SCENTED GEL, APPLE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601710194', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-5fd7-4716-b3c6-f879bafd6347', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-713', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER SCENTED GEL, LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601800437', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-59bf-435a-86fe-f0a3f51cbadf', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-712', 'SERTIFIKAT NOMOR IJIN EDAR GLADE AIR FRESHENER SCENTED GEL, OCEAN ESCAPE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20601210464', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-53a7-48f4-ac7d-a4f2a3529113', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-711', 'SERTIFIKAT NOMOR IJIN EDAR SC JOHNSON PROFESSIONAL, GLASS POLISH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20302420002', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-53a7-428d-8954-8044f47b95cf', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-710', 'SERTIFIKAT NOMOR IJIN EDAR TRANSNINE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310811228', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-4d8f-4be7-866c-a0a878db72b6', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-709', 'SERTIFIKAT NOMOR IJIN EDAR GO GETTER BOWL CLEANER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308220026', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-4d8f-422c-a21d-a2e48e3ef4df', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-708', 'SERTIFIKAT NOMOR IJIN EDAR GLANCE GLASS CLEANER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20302610298', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-4777-4823-9013-1f80d47d1dd2', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-707', 'SERTIFIKAT NOMOR IJIN EDAR NEW STREAM CONCENTRATE DISHWASHING CLEANER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20301710131', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-4777-4b6f-a98e-bb566201d7aa', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-706', 'SERTIFIKAT NOMOR IJIN EDAR BEFRESH LIQUID HAND SOAP CONCENTRATE, MELON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20309320454', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-415f-4349-a04a-65f71d4b4a80', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-705', 'SERTIFIKAT NOMOR IJIN EDAR BEFRESH LIQUID HAND SOAP CONCENTRATE, APPLE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20207610512', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-415f-4118-bcf9-609e3f61fea0', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-704', 'SERTIFIKAT NOMOR IJIN EDAR BEFRESH LIQUID HAND SOAP CONCENTRATE, CITRUS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20207610514', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-3b46-4b8d-9875-d6c74022ff5e', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-703', 'SERTIFIKAT NOMOR IJIN EDAR BEFRESH LIQUID HAND SOAP CONCENTRATE, ORANGE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20207710105', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-3b46-48d3-bb33-5594d8f44d24', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-702', 'SERTIFIKAT NOMOR IJIN EDAR BEFRESH LIQUID HAND SOAP CONCENTRATE, NON PARFUM', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20207710104', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-352e-477e-a8ff-22c452471f9b', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-701', 'SERTIFIKAT NOMOR IJIN EDAR BEFRESH LIQUID HAND SOAP CONCENTRATE, SAKURA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20309220129', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-352e-4f9d-8d22-e3d13f799cfe', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-700', 'SERTIFIKAT NOMOR IJIN EDAR SOFT CARE LIQUID HAND SOAP', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20206800101', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-2f16-4f7f-aadb-490a8d10c460', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-699', 'SERTIFIKAT NOMOR IJIN EDAR SOFT CARE LIQUID HAND SOAP, GREEN TEA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20309220168', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-2f16-480c-bccc-69fb59c0d3fd', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-698', 'SERTIFIKAT NOMOR IJIN EDAR SHINE UP SPECIAL', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20305220003', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-28fe-4ec8-9c2f-8f502c2c8a30', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-697', 'SERTIFIKAT NOMOR IJIN EDAR SHINE UP FURNITURE POLISH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20306710133', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-28fe-488b-a4b7-d57f1046074e', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-696', 'SERTIFIKAT NOMOR IJIN EDAR SHINE UP PREMIUM FURNITURE POLISH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20305220006', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-22e6-4be5-bbeb-98d629142890', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-695', 'SERTIFIKAT NOMOR IJIN EDAR RUGBEE HDSSR CARPET SPOTTER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20307210081', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-22e6-4aeb-923c-4ac40ca32683', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-694', 'SERTIFIKAT NOMOR IJIN EDAR RUGBEE CARPET SHAMPOO', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20307711932', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-1cce-43ae-bbb1-960000aa804a', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-693', 'SERTIFIKAT NOMOR IJIN EDAR RUGBEE CARPET SHAMPOO, LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20306220006', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-1cce-400f-9fca-4a900aae84ec', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-692', 'SERTIFIKAT NOMOR IJIN EDAR GLO METAL POLISH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310220102', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-16b6-4bb7-abd0-4491f60d1fae', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-691', 'SERTIFIKAT NOMOR IJIN EDAR SC JOHNSON KITCHEN CLEANER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310320565', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-16b6-4e51-9e7b-84e1d3999e69', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-690', 'SERTIFIKAT NOMOR IJIN EDAR BREAK-UP PLUS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310910456', NULL, 1, 1, 0, 1, 23, NULL, '2024-05-30 05:03:56', '2024-06-11 02:13:16', NULL),
('9c2a1455-109e-4651-934d-7178da85fcba', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-689', 'SERTIFIKAT NOMOR IJIN EDAR EXPOSE MULTI SURFACES CLEANER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310811518', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-0a86-4b50-bc57-4aa4039fc6fb', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-688', 'SERTIFIKAT NOMOR IJIN EDAR CONQ-R DUST, PENJEBAK DEBU', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310220121', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-0a86-4e1b-8e78-646d4b74561b', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-687', 'SERTIFIKAT NOMOR IJIN EDAR BIG BARE CLEANER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310220433', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-046e-447b-88b5-d2922868bea8', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-686', 'SERTIFIKAT NOMOR IJIN EDAR FREEDOM PEMBERSIH LANTAI', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303900405', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1455-046e-4042-9144-a317ca765a6b', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-685', 'SERTIFIKAT NOMOR IJIN EDAR WAX STRIP SPECIAL FLOOR FINISH REMOVER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303900436', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-fe56-4708-8abb-07048fed896e', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-684', 'SERTIFIKAT NOMOR IJIN EDAR BREAK UP', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303710132', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL);
INSERT INTO `documents` (`id`, `user_id`, `document_type_id`, `department_id`, `user_name`, `user_email`, `document_type_name`, `department_name`, `code`, `name`, `location`, `source`, `description`, `file`, `status`, `is_used`, `is_expired`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('9c2a1454-fe56-41ba-964d-cd4bf99c0929', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-683', 'SERTIFIKAT NOMOR IJIN EDAR MARBLE KLIN, LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303220084', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-f83e-4bf8-bc8a-54e014da214d', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-682', 'SERTIFIKAT NOMOR IJIN EDAR MARBLE KLIN, LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303220067', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-f83e-4503-a5fd-d6b602022a67', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-681', 'SERTIFIKAT NOMOR IJIN EDAR TERRASHINE HIGH GLOSS FINISH AND SEALER FOR TERRAZZO FLOORS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303121476', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-f226-41de-a58d-5c832054dbe6', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-680', 'SERTIFIKAT NOMOR IJIN EDAR COMPLETE FOR FLOORS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303418061', NULL, 1, 1, 0, 1, 23, NULL, '2024-05-30 05:03:56', '2024-06-11 02:15:16', NULL),
('9c2a1454-f226-49da-83a8-1b60c0bb8237', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-679', 'SERTIFIKAT NOMOR IJIN EDAR BRITE PLUS PEMBERSIH LANTAI, JERUK NIPIS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303910889', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-ec0e-42cf-8eec-2aacd91a38df', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-678', 'SERTIFIKAT NOMOR IJIN EDAR BRITE PLUS PEMBERSIH LANTAI, APEL HIJAU', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303910964', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-ec0e-4dd4-82c0-8ef17f923de3', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-677', 'SERTIFIKAT NOMOR IJIN EDAR TRAFFIC LIQUID WAX', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20311210075', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-e5f6-4b0e-a267-6760452aad70', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-676', 'SERTIFIKAT NOMOR IJIN EDAR KIT BACK TO BLACK TRIM & PLASTIC RESTORER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310121239', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-e5f6-4783-bc89-a972ebdf53d3', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-675', 'SERTIFIKAT NOMOR IJIN EDAR KIT MOTOR BACK TO BLACK', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310121277', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-dfde-48ee-bbcc-41c4f04ed515', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-674', 'SERTIFIKAT NOMOR IJIN EDAR KIT WATERLESS CAR WASH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310021057', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-dfde-4e66-8ddb-fce65dcb5e80', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-673', 'SERTIFIKAT NOMOR IJIN EDAR KIT GP-9 MP HEAVY DUTY LUBRICANT', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310812047', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-d9c6-4aec-8e92-3091569cbbb2', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-672', 'SERTIFIKAT NOMOR IJIN EDAR KIT MOTOR QUICK SHINE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310810021', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-d9c6-4fbe-b46c-b40ae3122de2', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-671', 'SERTIFIKAT NOMOR IJIN EDAR KIT DETAILER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310810356', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-d3ae-402d-8b1e-ede712e01846', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-670', 'SERTIFIKAT NOMOR IJIN EDAR KIT GRAND PRIX PREMIUM COMPOUND', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310220427', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-d3ae-46ba-ad17-301a29d51dc4', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-669', 'SERTIFIKAT NOMOR IJIN EDAR KIT GLASS POLISH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308610305', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-cd96-45b2-944c-2d1bc5e8a4bc', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-668', 'SERTIFIKAT NOMOR IJIN EDAR KIT GRAND PRIX CLEANER WAX', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308710129', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-cd96-43c6-93df-2e7e13409aca', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-667', 'SERTIFIKAT NOMOR IJIN EDAR KIT GRAND PRIX SPEED  DETAILER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308710313', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-c77e-48b4-9f7f-603aa66aa252', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-666', 'SERTIFIKAT NOMOR IJIN EDAR KIT GRAND PRIX TIRE SHINE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310220326', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-c166-4190-9585-53eb511e8c41', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-665', 'SERTIFIKAT NOMOR IJIN EDAR KIT RUBBING COMPOUND', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310810367', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-c166-4620-b82e-0544cd902c85', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-664', 'SERTIFIKAT NOMOR IJIN EDAR KIT MOTOR CHAIN LUBE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310122533', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-bb4e-4b0b-b2c0-222c287d2493', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-663', 'SERTIFIKAT NOMOR IJIN EDAR KIT GLASS CLEANER + RAIN REPELLENT', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310910823', NULL, 1, 1, 0, 1, 23, NULL, '2024-05-30 05:03:56', '2024-06-11 02:53:05', NULL),
('9c2a1454-bb4e-46e9-8425-67f967cc4ae6', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-662', 'SERTIFIKAT NOMOR IJIN EDAR KIT METAL POLISH CREAM', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310910190', NULL, 1, 1, 0, 1, 23, NULL, '2024-05-30 05:03:56', '2024-06-11 02:55:11', NULL),
('9c2a1454-b536-43e5-83b3-f74986b6baaf', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-661', 'SERTIFIKAT NOMOR IJIN EDAR KIT LEATHER CARE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310121743', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-b536-4eb6-bd1e-34b1a0061299', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-660', 'SERTIFIKAT NOMOR IJIN EDAR KIT BLACK MAGIC TIRE GEL', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308710802', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-af1e-4b29-a2ea-750e6026f374', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-659', 'SERTIFIKAT NOMOR IJIN EDAR KIT BLACK MAGIC INSTANT TIRE FOAM', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308610423', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-af1e-4b02-8c15-81d6a934ee01', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-658', 'SERTIFIKAT NOMOR IJIN EDAR KIT MULTI PURPOSE CLEANER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20311610210', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-a906-4028-9bf6-c03eebfdda60', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-657', 'SERTIFIKAT NOMOR IJIN EDAR KIT WIPER FLUID', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310910569', NULL, 1, 1, 0, 1, 23, NULL, '2024-05-30 05:03:56', '2024-06-11 03:03:34', NULL),
('9c2a1454-a906-4dc7-b547-cd32385da7ca', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-656', 'SERTIFIKAT NOMOR IJIN EDAR KIT INTERIOR PROTECTANT NATURAL SHINE, FRESH OUTDOOR', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310910446', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-a2ee-4c02-9b5f-4360b88d2cf0', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-655', 'SERTIFIKAT NOMOR IJIN EDAR KIT INTERIOR PROTECTANT HIGH GLOSS, FRESH ORANGE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308510116', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-9cd6-4a86-8dd1-a43aceba3b6b', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-654', 'SERTIFIKAT NOMOR IJIN EDAR KIT MOTOR MULTIGUNA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310910536', NULL, 1, 1, 0, 1, 23, NULL, '2024-05-30 05:03:56', '2024-06-11 03:00:04', NULL),
('9c2a1454-9cd6-431e-b973-9e0dac0bc64a', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-653', 'SERTIFIKAT NOMOR IJIN EDAR KIT WASH & WAX, CAR WAX SHAMPOO', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308710763', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-8476-4c71-988e-732e2f201a43', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-652', 'SERTIFIKAT NOMOR IJIN EDAR KIT WASH & GLOW CAR SHAMPOO', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308418015', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-7e5e-4581-ac1f-bf27a583e0c8', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-651', 'SERTIFIKAT NOMOR IJIN EDAR KIT MOTOR SHAMPOO', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20311710241', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-7e5e-465b-92fb-b252329f5f59', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-650', 'SERTIFIKAT NOMOR IJIN EDAR KIT METALLIC LIQUID CAR WAX', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308610694', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-7846-4e03-8c9d-3a2b5c60d167', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-649', 'SERTIFIKAT NOMOR IJIN EDAR KIT MOTOR PASTE WAX METALLIC', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310910535', NULL, 1, 1, 0, 1, 23, NULL, '2024-05-30 05:03:56', '2024-06-11 03:01:50', NULL),
('9c2a1454-7846-4a92-94c9-2631c1de15a0', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-648', 'SERTIFIKAT NOMOR IJIN EDAR KIT MOTOR PASTE WAX ORIGINAL', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310020548', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-722d-4f64-b1ff-d423edc940ba', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-647', 'SERTIFIKAT NOMOR IJIN EDAR KIT RESTORATIVE HEAVY DUTY PASTE POLISH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310810295', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-722d-4b1b-b738-e7ed0d476c53', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-646', 'SERTIFIKAT NOMOR IJIN EDAR KIT METALLIC CAR PASTE WAX', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308710103', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-6c15-41db-8f67-f7d3f1e34aa8', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-645', 'SERTIFIKAT NOMOR IJIN EDAR KIT NEW CAR PASTE WAX', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310121658', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-6c15-415a-9b81-6c2955920e85', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-644', 'SERTIFIKAT NOMOR IJIN EDAR KIT ORIGINAL LIGHT PASTE POLISH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310810294', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-65fd-4021-9e80-4f949913e678', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-643', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK IN TANK BLUEY DUAL COLOUR', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308810843', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-65fd-4023-91eb-dd9d3b841d09', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-642', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK PORSELEN', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303810143', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-5fe5-4275-9273-0844a6c2f44c', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-641', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK KAMAR MANDI KOREAN MAGNOLIA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303320597', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-59cd-4df6-acb6-b1829b7813c5', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-640', 'SERTIFIKAT NOMOR IJIN EDARBEBEK KAMAR MANDI, LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303810045', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-59cd-4bf4-9577-9d1a161bb9bc', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-639', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK KAMAR MANDI, FRESH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303810060', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-53b5-4d90-903e-036eeae62f62', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-638', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK KAMAR MANDI, FRUITOPIA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303220195', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-53b5-4a46-aae1-8afcb41325ea', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-637', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK KAMAR MANDI, LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303810051', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-4d9d-4399-8451-f3cf6ce06ba1', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-636', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK KLOSET, PEMBERSIH KLOSET EXTRA KUAT', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308810014', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-4d9d-4447-abd0-bd83f79b7931', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-635', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK KLOSET, LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308810603', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-4785-4db8-80d9-b7c47263011b', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-634', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK KLOSET, PINUS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308810844', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-4785-4737-a2af-c5cdd28a9bcf', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-633', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK KLOSET, LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308810548', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-416d-41b7-abd5-1391810d4cca', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-632', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK KLOSET, FRUITOPIA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308220024', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-416d-4f6f-a654-fa1683835e43', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-631', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK KLOSET, KOREAN MAGNOLIA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308320067', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-3b55-4e92-b7c6-1a385f5a3345', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-630', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK SEMERBAK FLUSH KOREAN MAGNOLIA', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308320065', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-3b55-4c3a-98c7-6275fb92e5d9', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-629', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK SEMERBAK FLUSH LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308810087', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-353d-4a0c-9cb9-0474673db711', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-628', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK SEMERBAK FLUSH PINE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308810088', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-353d-488c-8cf2-6515b96d4acc', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-627', 'SERTIFIKAT NOMOR IJIN EDAR BEBEK SEMERBAK FLUSH LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308810086', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-2f25-4d19-a5c2-329cb5a4120d', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-626', 'SERTIFIKAT NOMOR IJIN EDAR WINDEX PEMBERSIH KACA WANGI APPLE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20302610223', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-2f25-4b07-8d5b-f4df6cb02c7c', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-625', 'SERTIFIKAT NOMOR IJIN EDAR WINDEX PEMBERSIH KACA WANGI LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20302610226', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-290d-4847-826d-c5fc229ef073', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-624', 'SERTIFIKAT NOMOR IJIN EDAR WINDEX PEMBERSIH KACA WANGI FRESH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20302610224', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-290d-42ef-bf8a-7c6140896e66', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-623', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE TOILET CLEANING GEL, FRESH CLEAN', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308810073', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-22f5-4e01-b99e-7f5bc8600457', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-622', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE TOILET CLEANING GEL, CITRUS', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308810075', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-22f5-45f6-a90c-f2b8a64137bd', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-621', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE TOILET CLEANING GEL, LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20308810074', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-1cdd-4474-a985-f180fe6b47cb', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-620', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE CLEAR PEMBERSIH KACA SERBAGUNA APEL', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20302120645', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-1cdd-4236-8ec1-98f42e6dc5e3', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-619', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE CLEAR PEMBERSIH KACA SERBAGUNA ORIGINAL', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20302120640', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-16c5-4c94-bea3-e69d0c61a245', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-618', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE CLEAR PEMBERSIH KACA SERBAGUNA LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20302120621', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-16c5-40fa-b305-b7bc73688c95', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-617', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE CLEAR PEMBERSIH KACA SERBAGUNA LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20302120620', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-10ad-476d-b6e8-7c00f638b47d', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-616', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE PEMBERSIH KAMAR MANDI', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303810129', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-10ad-48d5-81cc-fae5bb3dba42', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-615', 'SERTIFIKAT NOMOR IJIN EDAR MR. MUSCLE KITCHEN & MULTI-SURFACE CLEANER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20310220119', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-0a95-4827-a37d-e0d68d9137cf', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-614', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE PEMBERSIH DAPUR LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20311510556', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-0a95-456b-a9fc-d010cb7de811', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-613', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE PEMBERSIH DAPUR ORANGE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20311510557', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-047d-4f20-a4ff-39bb5738c5b2', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-612', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE PEMBERSIH LANTAI KERAMIK APPLE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303220050', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1454-047d-4e55-9d38-cd2ad0136971', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-611', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE PEMBERSIH LANTAI KERAMIK LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303220049', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1453-fe65-40ff-ae97-cbd9f746b910', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-610', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE PEMBERSIH LANTAI KERAMIK LEMON', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303220044', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1453-fe65-4811-b614-b53b96f09afb', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-609', 'SERTIFIKAT NOMOR IJIN EDARMR.MUSCLE PEMBERSIH LANTAI MARMER & GRANIT', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20302510592', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1453-f84d-493d-bb00-9f594c6e84db', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-608', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE PEMBERSIH LANTAI WANGI FRUITY FLORAL', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303811819', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1453-f84d-4153-b824-49bc86f6c630', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-607', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE PEMBERSIH LANTAI WANGI LAVENDER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303812045', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1453-f235-4b4b-85dc-c7fbbbc64a7b', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-606', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE PEMBERSIH LANTAI WANGI LEMON FRESH', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303811726', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1453-f235-464b-81ac-0977277cfd0a', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-605', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE PEMBERSIH LANTAI WANGI  APPLE GREEN', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303811724', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1453-ec1d-41c1-bf0f-c4e33a8d02af', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-604', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE PEMBERSIH LANTAI WANGI CLASSIC PINE', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303811725', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1453-e605-412c-8b8a-7653be54efb1', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-603', 'SERTIFIKAT NOMOR IJIN EDAR MR.MUSCLE PEMBERSIH LANTAI KMR BAYI & ANAK', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303510535', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1453-e605-4be6-b6e2-17bb900eaad9', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-602', 'SERTIFIKAT NOMOR IJIN EDAR PLEDGE WOOD FLOOR CLEANER', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20303310007', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1453-dfed-4a5a-b840-27fc20048881', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-601', 'SERTIFIKAT NOMOR IJIN EDAR PLEDGE FURNITURE POLISH ORANGE (AEROSOL)', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20306410436', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1453-dfed-4532-93fd-aaacb1250c15', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-600', 'SERTIFIKAT NOMOR IJIN EDAR PLEDGE FURNITURE POLISH WITH NATURAL ORANGE OIL', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20306410380', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
('9c2a1453-d9d5-4b4c-88e8-fa1ad60b14a3', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-599', 'SERTIFIKAT NOMOR IJIN EDAR PLEDGE FURNITURE POLISH LEMON (CAIR)', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20305810095', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:55', '2024-05-30 05:03:55', NULL),
('9c2a1453-d3bd-4842-a4fa-ab92813a4c82', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-598', 'SERTIFIKAT NOMOR IJIN EDAR PLEDGE FURNITURE POLISH WITH NATURAL SANDALWOOD OIL', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20306410379', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:55', '2024-05-30 05:03:55', NULL),
('9c2a1453-c175-4fcf-a22d-9f8816b66972', 23, '9b289c86-c740-4709-b95f-c34058d4a0d3', '9c099287-f178-4e79-938f-84397477b966', 'Yayah Komariah', 'yayah.komariah@scjohnson.co.id', 'SERTIFIKAT NOMOR IJIN EDAR', 'RESEARCH & DEVELOPMENT', 'DOC-2024-597', 'SERTIFIKAT NOMOR IJIN EDAR PLEDGE FURNITURE POLISH LEMON (AEROSOL)', 'Ruang Ibu Luciana (Laci no.7 & 11)', 'KEMENKES', 'PKD 20305220012', NULL, 1, 1, 0, 1, 1, NULL, '2024-05-30 05:03:55', '2024-05-30 05:03:55', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `document_schedules`
--

CREATE TABLE `document_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` char(36) NOT NULL,
  `schedule_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
(870, '9c60416f-2ba1-4030-b1f4-af7b264b6204', '2025-06-11 17:00:00', '2025-06-12', NULL, 60, 10, 24, NULL, NULL, 1, 1, NULL, '2024-06-26 03:24:45', '2024-06-26 03:24:45', NULL),
(869, '9c60416f-2ba1-445f-8402-d61203dc7f89', '2025-04-11 17:00:00', '2025-04-12', NULL, 60, 10, 24, NULL, NULL, 1, 1, NULL, '2024-06-26 03:24:45', '2024-06-26 03:24:45', NULL),
(868, '9c60416f-1f70-487f-9f76-da7d94872cdb', '2025-03-11 17:00:00', '2025-03-12', NULL, 60, 10, 24, NULL, NULL, 1, 1, NULL, '2024-06-26 03:24:45', '2024-06-26 03:24:45', NULL),
(867, '9c603eab-49a7-454a-933e-0fdb3b93aa45', '2024-06-28 17:00:00', '2024-06-29', NULL, 10, 1, 24, NULL, NULL, 1, 1, NULL, '2024-06-26 03:17:02', '2024-06-26 03:17:02', NULL),
(866, '9c603ab5-ddc8-47d0-9910-05c5a1f7ee3e', '2024-06-28 17:00:00', '2024-06-29', NULL, 10, 1, 24, NULL, NULL, 1, 1, NULL, '2024-06-26 03:05:57', '2024-06-26 03:05:57', NULL),
(865, '9c6039ac-8b1a-4cfb-9496-f9ae23a7c437', '2024-06-28 17:00:00', '2024-06-29', NULL, 10, 1, 24, NULL, NULL, 1, 1, NULL, '2024-06-26 03:03:04', '2024-06-26 03:03:04', NULL),
(864, '9c603937-54b5-421b-8d7c-6cafb858cdc4', '2024-06-28 17:00:00', '2024-06-29', NULL, 10, 1, 24, NULL, NULL, 1, 1, NULL, '2024-06-26 03:01:47', '2024-06-26 03:01:47', NULL),
(863, '9c3a8853-6806-4b4a-8f3a-22d17b68815a', '2024-06-30 17:00:00', '2024-07-01', NULL, 60, 10, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 09:21:32', '2024-06-07 09:21:32', NULL),
(862, '9c3a87a0-47ac-41e7-b8f6-98e91e6e0014', '2024-06-30 17:00:00', '2024-07-01', NULL, 60, 10, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 09:19:34', '2024-06-07 09:19:34', NULL),
(861, '9c3a8743-ae87-4244-b664-beee8ed0490b', '2024-06-30 17:00:00', '2024-07-01', NULL, 60, 10, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 09:18:33', '2024-06-07 09:18:33', NULL),
(860, '9c3a6e35-2c23-43d1-8806-eac188c56b79', '2024-08-03 17:00:00', '2024-08-04', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(859, '9c3a6e35-260b-4f19-8180-edfe7148beb5', '2024-08-14 17:00:00', '2024-08-15', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(858, '9c3a6e35-260b-48d3-98a8-c2babbf03ce9', '2024-08-01 17:00:00', '2024-08-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(857, '9c3a6e35-1ff3-4e35-bcc6-341bd8515219', '2024-08-01 17:00:00', '2024-08-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(856, '9c3a6e35-1ff3-492e-bf48-01b05204531e', '2024-08-01 17:00:00', '2024-08-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(855, '9c3a6e35-19db-4e48-8bf6-002890ec5a20', '2024-08-01 17:00:00', '2024-08-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(854, '9c3a6e35-13c3-4765-8444-7f83130e5268', '2024-08-01 17:00:00', '2024-08-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(853, '9c3a6e35-13c3-4262-a927-4529d37f6fe1', '2024-08-01 17:00:00', '2024-08-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(852, '9c3a6e35-0dab-4f1d-b89e-a205858d85dd', '2024-08-01 17:00:00', '2024-08-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(851, '9c3a6e35-0dab-4024-9633-f157031823ff', '2024-08-01 17:00:00', '2024-08-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(850, '9c3a6e35-0793-4ec2-bf14-61744e05d451', '2024-08-01 17:00:00', '2024-08-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(849, '9c3a6e35-0793-4ad2-9fc1-4e639fa94a0d', '2024-08-01 17:00:00', '2024-08-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(848, '9c3a6e35-017b-44b4-be10-d975cb47e159', '2024-08-02 17:00:00', '2024-08-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(847, '9c3a6e34-fb63-4cd1-99ed-a02bd787dac9', '2024-08-02 17:00:00', '2024-08-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(846, '9c3a6e34-fb63-4896-9a33-153d13662aae', '2024-08-02 17:00:00', '2024-08-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(845, '9c3a6e34-f54b-4ef6-9931-587a2c2f3e58', '2024-08-02 17:00:00', '2024-08-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(844, '9c3a6e34-f54b-4861-abd6-2d4c14ba7871', '2024-08-02 17:00:00', '2024-08-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(843, '9c3a6e34-ef33-4a2b-9ead-beddc6cf0cd9', '2024-08-02 17:00:00', '2024-08-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(842, '9c3a6e34-e91b-4f08-b7b2-ce923d3f0818', '2024-08-02 17:00:00', '2024-08-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(841, '9c3a6e34-e91b-43a1-b4b0-a1efc0e1d609', '2024-08-02 17:00:00', '2024-08-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(840, '9c3a6e34-e303-415e-9fa4-d21b435a17aa', '2024-08-03 17:00:00', '2024-08-04', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(839, '9c3a6e34-dceb-4ba0-80fe-cbbf07d6e847', '2024-08-03 17:00:00', '2024-08-04', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(838, '9c3a6e34-dceb-425f-acc5-55227ddb3535', '2024-08-09 17:00:00', '2024-08-10', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(837, '9c3a6e34-d6d3-4956-8b20-ac7a25ad402c', '2024-08-01 17:00:00', '2024-08-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(836, '9c3a6e34-d0bb-44d0-ac1d-f906b6567859', '2024-08-09 17:00:00', '2024-08-10', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(835, '9c3a6e34-d0bb-4acf-a3cd-41377f7d5a03', '2024-08-03 17:00:00', '2024-08-04', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(834, '9c3a6e34-caa3-487f-8f97-f94520cf473f', '2024-08-03 17:00:00', '2024-08-04', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(833, '9c3a6e34-caa3-433a-a39b-b858a7d593a9', '2024-08-02 17:00:00', '2024-08-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(832, '9c3a6e34-c48b-4de7-85bd-fa6527b059f2', '2024-08-02 17:00:00', '2024-08-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(831, '9c3a6e34-c48b-43f0-a7bf-ef9ee30aa937', '2024-08-02 17:00:00', '2024-08-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(830, '9c3a6e34-be73-4471-9d2d-0e4b5ba073d3', '2024-08-10 17:00:00', '2024-08-11', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(829, '9c3a6e34-b85b-4b49-9f3b-ae0ede5e83d7', '2024-08-02 17:00:00', '2024-08-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(828, '9c3a6e34-b85b-4ef0-a984-a4579479c9d4', '2024-08-04 17:00:00', '2024-08-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(827, '9c3a6e34-b243-456e-9c7c-058d93ef10f4', '2024-08-04 17:00:00', '2024-08-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(826, '9c3a6e34-b243-4997-94ee-451f301b3d56', '2024-08-09 17:00:00', '2024-08-10', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(825, '9c3a6e34-ac2b-46a6-8c84-fe8dd9ae36d9', '2024-08-04 17:00:00', '2024-08-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(824, '9c3a6e34-a613-49c2-b237-8c8f32950b83', '2024-03-14 17:00:00', '2024-03-15', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(823, '9c3a6e34-99e2-485c-8884-b0be5801b63f', '2024-08-03 17:00:00', '2024-08-04', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(822, '9c3a3e69-35f6-4ab6-8a44-b5d1a5ae0c83', '2025-04-21 17:00:00', '2025-04-22', NULL, 21, 10, 20, NULL, NULL, 1, 1, NULL, '2024-06-07 05:54:51', '2024-06-07 05:54:51', NULL),
(821, '9c2a1457-0451-425c-a0dd-55407a0d5d84', '2025-04-14 17:00:00', '2025-04-15', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(820, '9c2a1456-fe39-4225-9c54-ae005f9499ac', '2027-05-24 17:00:00', '2027-05-25', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(819, '9c2a1456-fe39-4cb7-8e04-904caec3bb0a', '2026-04-27 17:00:00', '2026-04-28', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(818, '9c2a1456-f821-4147-b246-6965e1136986', '2027-05-24 17:00:00', '2027-05-25', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(817, '9c2a1456-f821-4d70-b589-ee03184c3281', '2027-05-24 17:00:00', '2027-05-25', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(816, '9c2a1456-f209-4fe5-ad1a-5f0bc17ff2dd', '2028-07-31 17:00:00', '2028-08-01', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(815, '9c2a1456-f209-427d-8c48-051bbc3056f8', '2028-07-31 17:00:00', '2028-08-01', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(814, '9c2a1456-ebf1-48e7-9071-e71ae4327113', '2025-04-15 17:00:00', '2025-04-16', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(813, '9c2a1456-ebf1-4e7e-87ef-6987b3a0759d', '2025-04-15 17:00:00', '2025-04-16', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(812, '9c2a1456-e5d9-41d2-a1a0-2119eea490cc', '2028-04-19 17:00:00', '2028-04-20', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(811, '9c2a1456-e5d9-4320-9baf-09676c8f503c', '2026-12-01 17:00:00', '2026-12-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(810, '9c2a1456-dfc1-4dff-8466-de0883f556d4', '2025-04-15 17:00:00', '2025-04-16', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(809, '9c2a1456-dfc1-4ec8-8d6b-ffe6a3564202', '2026-11-30 17:00:00', '2026-12-01', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(808, '9c2a1456-d9a9-4571-bf99-96bdabb44c9e', '2027-04-04 17:00:00', '2027-04-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(807, '9c2a1456-d390-4e9a-8252-1a6b557e6a56', '2026-04-04 17:00:00', '2026-04-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(806, '9c2a1456-d390-4c4e-84fc-b5cc6ec4a96a', '2027-04-04 17:00:00', '2027-04-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(805, '9c2a1456-cd78-4fb4-8b0d-ec9402fa132c', '2028-07-31 17:00:00', '2028-08-01', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(804, '9c2a1456-cd78-40de-8aa2-1bacda25950c', '2027-12-05 17:00:00', '2027-12-06', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(803, '9c2a1456-c760-4a90-a49d-fb85868aeba6', '2027-04-26 17:00:00', '2027-04-27', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(802, '9c2a1456-c760-4211-8c85-314492d04a48', '2027-08-03 17:00:00', '2027-08-04', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(801, '9c2a1456-c148-481a-9628-d929e432b5c4', '2027-11-14 17:00:00', '2027-11-15', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(800, '9c2a1456-c148-4e29-a722-8710652075ad', '2025-03-02 17:00:00', '2025-03-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(799, '9c2a1456-bb30-4329-8ce9-3ceb2831d7f0', '2026-12-07 17:00:00', '2026-12-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(798, '9c2a1456-bb30-4ebf-b34b-ee457cb04c54', '2026-12-12 17:00:00', '2026-12-13', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(797, '9c2a1456-b518-4c80-aa58-30c41bbac937', '2025-12-05 17:00:00', '2025-12-06', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(796, '9c2a1456-b518-49b6-97e4-40ef5c21b633', '2025-03-31 17:00:00', '2025-04-01', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(795, '9c2a1456-af00-4b9b-8a49-09be4ee5ded8', '2028-09-14 17:00:00', '2028-09-15', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(794, '9c2a1456-af00-4b29-8b4b-9639374cb8ff', '2026-12-06 17:00:00', '2026-12-07', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(793, '9c2a1456-a8e8-43d9-972e-4bf86b1fb8e2', '2028-09-14 17:00:00', '2028-09-15', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(792, '9c2a1456-a8e8-4258-aa10-f6c1a8502c77', '2026-07-18 17:00:00', '2026-07-19', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(791, '9c2a1456-a2d0-431f-b7c9-2ed0c4383a55', '2027-04-05 17:00:00', '2027-04-06', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(790, '9c2a1456-a2d0-4615-bb14-301ceda75d3b', '2026-07-21 17:00:00', '2026-07-22', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(789, '9c2a1456-9cb8-449b-852f-f4714167b6f9', '2027-09-19 17:00:00', '2027-09-20', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(788, '9c2a1456-9cb8-457c-96e5-1b758fe08743', '2027-04-05 17:00:00', '2027-04-06', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(787, '9c2a1456-96a0-47b8-82d5-23b8560e7adf', '2026-06-11 17:00:00', '2026-06-12', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(786, '9c2a1456-96a0-4be7-842d-ea9460bc3d8d', '2027-09-17 17:00:00', '2027-09-18', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(785, '9c2a1456-9088-432a-a2d9-cda73537792c', '2026-06-11 17:00:00', '2026-06-12', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(784, '9c2a1456-9088-4084-8982-04c3483bdae6', '2024-09-29 17:00:00', '2024-09-30', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(783, '9c2a1456-8a70-4ae6-b344-5e81a0f1d898', '2027-12-13 17:00:00', '2027-12-14', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(782, '9c2a1456-8a70-4739-a55f-605fccefdbd5', '2028-02-01 17:00:00', '2028-02-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(781, '9c2a1456-8458-4252-ac72-33d0a6001b70', '2027-05-07 17:00:00', '2027-05-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(780, '9c2a1456-8458-4705-a9f2-f1193b555bcc', '2027-01-13 17:00:00', '2027-01-14', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(779, '9c2a1456-7e40-4985-a102-6d084be235e5', '2027-01-24 17:00:00', '2027-01-25', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(778, '9c2a1456-7e40-4af3-a3f2-a884c6689cf3', '2027-01-23 17:00:00', '2027-01-24', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(777, '9c2a1456-7828-44ae-9ce5-73d1488114ef', '2027-04-20 17:00:00', '2027-04-21', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(776, '9c2a1456-7828-4a2c-b753-003926480715', '2027-04-04 17:00:00', '2027-04-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(775, '9c2a1456-7210-49ad-bf4c-e6ded2d719a9', '2028-01-29 17:00:00', '2028-01-30', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(774, '9c2a1456-7210-4fab-ab7d-f413e8f1437c', '2028-01-25 17:00:00', '2028-01-26', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(773, '9c2a1456-6bf8-432c-ad45-f2c27447237d', '2028-01-25 17:00:00', '2028-01-26', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(772, '9c2a1456-6bf8-47be-a6f0-784a72c6105c', '2028-01-29 17:00:00', '2028-01-30', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(771, '9c2a1456-65e0-4fa8-9e42-16a1917f4494', '2026-11-14 17:00:00', '2026-11-15', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(770, '9c2a1456-65e0-43d4-b770-3e47c7ae1a8d', '2026-11-08 17:00:00', '2026-11-09', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(769, '9c2a1456-5fc8-4526-864f-f2ac572fa43d', '2026-11-08 17:00:00', '2026-11-09', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(768, '9c2a1456-5fc8-4230-8354-58c121ee6ec0', '2026-11-07 17:00:00', '2026-11-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(767, '9c2a1456-59b0-4e29-88da-86dc6b178825', '2029-01-09 17:00:00', '2029-01-10', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(766, '9c2a1456-5398-4a43-8312-d1b4c3d135e8', '2029-01-09 17:00:00', '2029-01-10', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(765, '9c2a1456-5398-4550-bfd3-c068b782ae8a', '2029-03-31 17:00:00', '2029-04-01', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(764, '9c2a1456-5398-4570-92fe-1f1a050be33f', '2025-12-13 17:00:00', '2025-12-14', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(763, '9c2a1456-4d80-4cc2-9b01-955a1abeb9e3', '2029-03-26 17:00:00', '2029-03-27', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(762, '9c2a1456-4768-4c11-9225-05eb6f42ad89', '2029-04-01 17:00:00', '2029-04-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(761, '9c2a1456-4768-430f-82ff-9d48730c383a', '2025-12-09 17:00:00', '2025-12-10', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(760, '9c2a1456-4150-4b13-b182-9fad5a78b805', '2029-03-30 17:00:00', '2029-03-31', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(759, '9c2a1456-4150-4a0f-8aa7-dddd78ce216c', '2025-11-17 17:00:00', '2025-11-18', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(758, '9c2a1456-3b38-41ba-b352-9792ae88ecf6', '2026-01-10 17:00:00', '2026-01-11', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(757, '9c2a1456-3b38-46ac-817e-b3add24b17f8', '2025-03-04 17:00:00', '2025-03-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(756, '9c2a1456-3520-4556-9ce1-45a214abe023', '2025-01-03 17:00:00', '2025-01-04', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(755, '9c2a1456-3520-497c-83b8-537c298b8dc7', '2026-01-10 17:00:00', '2026-01-11', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(754, '9c2a1456-2f08-48f8-bb18-b62d31bdba93', '2026-01-10 17:00:00', '2026-01-11', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(753, '9c2a1456-2f08-4778-b35a-e877dce6ab9e', '2029-01-09 17:00:00', '2029-01-10', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(752, '9c2a1456-28f0-4f69-9929-dcc46aaede78', '2025-11-17 17:00:00', '2025-11-18', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(751, '9c2a1456-28f0-4207-bb29-a923518f3e7f', '2027-03-23 17:00:00', '2027-03-24', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(750, '9c2a1456-22d8-4686-a4f6-02d703920e8e', '2027-01-24 17:00:00', '2027-01-25', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(749, '9c2a1456-22d8-4cff-b927-a0cd0b6ab12d', '2024-11-21 17:00:00', '2024-11-22', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(748, '9c2a1456-1cc0-4f94-8198-fddb70f8e475', '2025-11-09 17:00:00', '2025-11-10', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(747, '9c2a1456-1cc0-47fc-8087-ea24dab72e0a', '2024-06-11 01:57:08', '2027-01-25', NULL, 60, 7, 24, NULL, NULL, 1, 23, NULL, '2024-05-30 05:03:57', '2024-06-11 01:57:08', NULL),
(746, '9c2a1456-16a8-4451-8af6-8cd988e4f683', '2025-11-17 17:00:00', '2025-11-18', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(745, '9c2a1456-16a8-4a4a-a577-4dbc32add5b8', '2027-05-22 17:00:00', '2027-05-23', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(744, '9c2a1456-1090-4cbd-8ccf-b5402840eb29', '2024-10-27 17:00:00', '2024-10-28', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(743, '9c2a1456-1090-4064-a026-425393ce9e33', '2025-03-04 17:00:00', '2025-03-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(742, '9c2a1456-0a77-499d-bb39-6e0950bb2ed3', '2024-10-21 17:00:00', '2024-10-22', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(741, '9c2a1456-0a77-4c30-bf06-96063023a972', '2024-10-21 17:00:00', '2024-10-22', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(740, '9c2a1456-045f-42c8-8499-74f7a7a2e092', '2024-10-21 17:00:00', '2024-10-22', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(739, '9c2a1456-045f-409f-b3a0-e2281f86a21b', '2024-09-01 17:00:00', '2024-09-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(738, '9c2a1455-fe47-4a67-adc7-c9dc799c9596', '2028-10-09 17:00:00', '2028-10-10', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(737, '9c2a1455-fe47-4f07-a40b-d56f9785181b', '2028-05-07 17:00:00', '2028-05-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(736, '9c2a1455-f82f-4bbc-aba1-8da47a12fc59', '2028-05-04 17:00:00', '2028-05-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(735, '9c2a1455-f217-4297-a256-30a3307c7a2c', '2028-07-16 17:00:00', '2028-07-17', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(734, '9c2a1455-f217-4bb1-975d-8bb02d0ca229', '2028-07-16 17:00:00', '2028-07-17', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(733, '9c2a1455-ebff-42ec-b012-2e072afb1cbd', '2028-05-04 17:00:00', '2028-05-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(732, '9c2a1455-ebff-4a55-97b5-577d35f473de', '2027-09-05 17:00:00', '2027-09-06', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(731, '9c2a1455-e5e7-4916-81c5-52ff4de47b6f', '2027-07-04 17:00:00', '2027-07-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(730, '9c2a1455-e5e7-47a4-9683-5ab937e9763c', '2026-12-27 17:00:00', '2026-12-28', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(729, '9c2a1455-dfcf-48e3-9b9e-3df35b7b338b', '2026-12-27 17:00:00', '2026-12-28', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(728, '9c2a1455-dfcf-4261-a789-a9e71fa97f41', '2026-12-27 17:00:00', '2026-12-28', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(727, '9c2a1455-d9b7-4cd1-b984-21964937390f', '2029-01-13 17:00:00', '2029-01-14', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(726, '9c2a1455-d9b7-46d1-b070-eea5685e2086', '2029-01-09 17:00:00', '2029-01-10', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(725, '9c2a1455-d39f-4989-9720-8791066781f0', '2024-12-05 17:00:00', '2024-12-06', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(724, '9c2a1455-d39f-468d-aece-21f6da5edc6a', '2027-01-24 17:00:00', '2027-01-25', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(723, '9c2a1455-cd87-46e4-8a9d-75df62d8b047', '2026-03-29 17:00:00', '2026-03-30', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(722, '9c2a1455-cd87-4d00-bccb-d04f31346eff', '2026-03-29 17:00:00', '2026-03-30', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(721, '9c2a1455-c76f-4e51-853a-49d0c5c01dea', '2026-03-29 17:00:00', '2026-03-30', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(720, '9c2a1455-c76f-49a1-ba82-1049d3ccc97e', '2026-03-29 17:00:00', '2026-03-30', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(719, '9c2a1455-c157-4733-8676-e2268626cdc9', '2027-11-07 17:00:00', '2027-11-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(718, '9c2a1455-bb3f-4ad2-bd0c-2b334ae968a1', '2026-04-05 17:00:00', '2026-04-06', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(717, '9c2a1455-bb3f-4894-ba06-b18359045faf', '2027-01-27 17:00:00', '2027-01-28', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(716, '9c2a1455-b527-48a0-a3a4-6d5740049da6', '2027-08-17 17:00:00', '2027-08-18', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(715, '9c2a1455-b527-4416-8cf6-c2cf68fa47eb', '2026-03-29 17:00:00', '2026-03-30', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(714, '9c2a1455-af0f-4c84-b4ac-13957759b7f7', '2027-03-30 17:00:00', '2027-03-31', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(713, '9c2a1455-af0f-45a7-abc5-8fa281b035d9', '2028-11-13 17:00:00', '2028-11-14', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(712, '9c2a1455-a8f7-4eba-bafc-074be17753ca', '2028-05-07 17:00:00', '2028-05-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(711, '9c2a1455-a8f7-4b49-b131-7c31c1643f87', '2024-11-20 17:00:00', '2024-11-21', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(710, '9c2a1455-a2df-49ba-a92b-14844373cc49', '2027-03-31 17:00:00', '2027-04-01', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(709, '9c2a1455-a2df-4e22-9c27-60af6822f3aa', '2028-11-13 17:00:00', '2028-11-14', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(708, '9c2a1455-9cc7-48a2-acb6-e4441821b054', '2027-03-30 17:00:00', '2027-03-31', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(707, '9c2a1455-9cc7-470d-8a45-3cc4e0ca47ec', '2027-04-03 17:00:00', '2027-04-04', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(706, '9c2a1455-96af-452a-93c4-9dbed13e9945', '2027-09-05 17:00:00', '2027-09-06', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(705, '9c2a1455-96af-4fb1-bcf2-a7d76407846d', '2027-07-18 17:00:00', '2027-07-19', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(704, '9c2a1455-9097-4602-8ea3-7e8edd4e563f', '2028-08-05 17:00:00', '2028-08-06', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(703, '9c2a1455-9097-42a2-bd6f-ed5648ef4d86', '2028-09-17 17:00:00', '2028-09-18', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(702, '9c2a1455-8a7f-48f2-af44-fd06a6b80c0b', '2028-08-05 17:00:00', '2028-08-06', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(701, '9c2a1455-8a7f-41bc-b8b7-5d413d522608', '2028-08-05 17:00:00', '2028-08-06', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(700, '9c2a1455-8467-47f7-abeb-ccd2da31a32c', '2025-11-23 17:00:00', '2025-11-24', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(699, '9c2a1455-8467-4115-8b89-41bcb9fb0a5a', '2026-10-10 17:00:00', '2026-10-11', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(698, '9c2a1455-7e4f-4a96-a20a-46f4152b9286', '2026-10-10 17:00:00', '2026-10-11', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(697, '9c2a1455-7e4f-4284-a50e-de4cfee372a8', '2026-10-10 17:00:00', '2026-10-11', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(696, '9c2a1455-7837-470b-b3fc-d496817ef89a', '2026-10-10 17:00:00', '2026-10-11', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(695, '9c2a1455-7837-47f1-a4c5-986a4c277771', '2026-10-10 17:00:00', '2026-10-11', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(694, '9c2a1455-721f-4db0-be27-6f58ce40ecdf', '2029-01-13 17:00:00', '2029-01-14', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(693, '9c2a1455-721f-4f2f-a3d8-7e8667f5e416', '2026-12-13 17:00:00', '2026-12-14', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(692, '9c2a1455-6c07-447e-8e04-8b210fa5f915', '2026-08-09 17:00:00', '2026-08-10', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(691, '9c2a1455-6c07-4777-956b-19b683bcfad2', '2026-08-08 17:00:00', '2026-08-09', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(690, '9c2a1455-65ef-4e47-879f-63302e50b27d', '2024-12-30 17:00:00', '2024-12-31', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(689, '9c2a1455-65ef-484a-8d8a-93afb7b18eb9', '2028-05-24 17:00:00', '2028-05-25', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(688, '9c2a1455-5fd7-4e1c-9b71-9c09556a540f', '2026-12-07 17:00:00', '2026-12-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(687, '9c2a1455-5fd7-4716-b3c6-f879bafd6347', '2026-12-07 17:00:00', '2026-12-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(686, '9c2a1455-59bf-435a-86fe-f0a3f51cbadf', '2026-12-13 17:00:00', '2026-12-14', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(685, '9c2a1455-53a7-48f4-ac7d-a4f2a3529113', '2029-01-19 17:00:00', '2029-01-20', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(684, '9c2a1455-53a7-428d-8954-8044f47b95cf', '2028-06-20 17:00:00', '2028-06-21', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(683, '9c2a1455-4d8f-4be7-866c-a0a878db72b6', '2027-09-13 17:00:00', '2027-09-14', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(682, '9c2a1455-4d8f-422c-a21d-a2e48e3ef4df', '2026-06-03 17:00:00', '2026-06-04', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(681, '9c2a1455-4777-4823-9013-1f80d47d1dd2', '2027-02-03 17:00:00', '2027-02-04', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(680, '9c2a1455-4777-4b6f-a98e-bb566201d7aa', '2028-07-06 17:00:00', '2028-07-07', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(679, '9c2a1455-415f-4349-a04a-65f71d4b4a80', '2026-08-29 17:00:00', '2026-08-30', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(678, '9c2a1455-415f-4118-bcf9-609e3f61fea0', '2026-08-29 17:00:00', '2026-08-30', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(677, '9c2a1455-3b46-4b8d-9875-d6c74022ff5e', '2027-01-10 17:00:00', '2027-01-11', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(676, '9c2a1455-3b46-48d3-bb33-5594d8f44d24', '2027-01-24 17:00:00', '2027-01-25', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(675, '9c2a1455-352e-477e-a8ff-22c452471f9b', '2027-05-23 17:00:00', '2027-05-24', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(674, '9c2a1455-352e-4f9d-8d22-e3d13f799cfe', '2026-10-19 17:00:00', '2026-10-20', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(673, '9c2a1455-2f16-4f7f-aadb-490a8d10c460', '2027-07-04 17:00:00', '2027-07-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(672, '9c2a1455-2f16-480c-bccc-69fb59c0d3fd', '2027-01-24 17:00:00', '2027-01-25', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(671, '9c2a1455-28fe-4ec8-9c2f-8f502c2c8a30', '2027-01-24 17:00:00', '2027-01-25', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(670, '9c2a1455-28fe-488b-a4b7-d57f1046074e', '2027-04-04 17:00:00', '2027-04-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(669, '9c2a1455-22e6-4be5-bbeb-98d629142890', '2026-10-19 17:00:00', '2026-10-20', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(668, '9c2a1455-22e6-4aeb-923c-4ac40ca32683', '2027-12-05 17:00:00', '2027-12-06', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(667, '9c2a1455-1cce-43ae-bbb1-960000aa804a', '2027-07-04 17:00:00', '2027-07-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(666, '9c2a1455-1cce-400f-9fca-4a900aae84ec', '2026-10-19 17:00:00', '2026-10-20', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(665, '9c2a1455-16b6-4bb7-abd0-4491f60d1fae', '2028-03-06 17:00:00', '2028-03-07', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(664, '9c2a1455-16b6-4e51-9e7b-84e1d3999e69', '2024-06-11 02:13:16', '2029-04-05', NULL, 60, 7, 24, NULL, NULL, 1, 23, NULL, '2024-05-30 05:03:56', '2024-06-11 02:13:15', NULL),
(663, '9c2a1455-109e-4651-934d-7178da85fcba', '2028-07-04 17:00:00', '2028-07-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(662, '9c2a1455-0a86-4b50-bc57-4aa4039fc6fb', '2027-05-07 17:00:00', '2027-05-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(661, '9c2a1455-0a86-4e1b-8e78-646d4b74561b', '2027-11-14 17:00:00', '2027-11-15', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(660, '9c2a1455-046e-447b-88b5-d2922868bea8', '2027-11-14 17:00:00', '2027-11-15', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(659, '9c2a1455-046e-4042-9144-a317ca765a6b', '2027-11-14 17:00:00', '2027-11-15', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(658, '9c2a1454-fe56-4708-8abb-07048fed896e', '2027-01-24 17:00:00', '2027-01-25', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(657, '9c2a1454-fe56-41ba-964d-cd4bf99c0929', '2027-04-20 17:00:00', '2027-04-21', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(656, '9c2a1454-f83e-4bf8-bc8a-54e014da214d', '2027-03-28 17:00:00', '2027-03-29', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(655, '9c2a1454-f83e-4503-a5fd-d6b602022a67', '2026-08-01 17:00:00', '2026-08-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(654, '9c2a1454-f226-41de-a58d-5c832054dbe6', '2024-06-11 02:15:16', '2029-05-29', NULL, 60, 7, 24, NULL, NULL, 1, 23, NULL, '2024-05-30 05:03:56', '2024-06-11 02:15:16', NULL),
(653, '9c2a1454-f226-49da-83a8-1b60c0bb8237', '2024-08-18 17:00:00', '2024-08-19', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(652, '9c2a1454-ec0e-42cf-8eec-2aacd91a38df', '2024-09-01 17:00:00', '2024-09-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(651, '9c2a1454-ec0e-4dd4-82c0-8ef17f923de3', '2026-10-19 17:00:00', '2026-10-20', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(650, '9c2a1454-e5f6-4b0e-a267-6760452aad70', '2026-06-28 17:00:00', '2026-06-29', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(649, '9c2a1454-e5f6-4783-bc89-a972ebdf53d3', '2026-06-30 17:00:00', '2026-07-01', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(648, '9c2a1454-dfde-48ee-bbcc-41c4f04ed515', '2025-04-29 17:00:00', '2025-04-30', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(647, '9c2a1454-dfde-4e66-8ddb-fce65dcb5e80', '2028-10-08 17:00:00', '2028-10-09', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(646, '9c2a1454-d9c6-4aec-8e92-3091569cbbb2', '2028-07-18 17:00:00', '2028-07-19', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(645, '9c2a1454-d9c6-4fbe-b46c-b40ae3122de2', '2027-12-19 17:00:00', '2027-12-20', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(644, '9c2a1454-d3ae-402d-8b1e-ede712e01846', '2027-11-07 17:00:00', '2027-11-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(643, '9c2a1454-d3ae-46ba-ad17-301a29d51dc4', '2026-04-21 17:00:00', '2026-04-22', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(642, '9c2a1454-cd96-45b2-944c-2d1bc5e8a4bc', '2026-12-07 17:00:00', '2026-12-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(641, '9c2a1454-cd96-43c6-93df-2e7e13409aca', '2027-04-04 17:00:00', '2027-04-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(640, '9c2a1454-c77e-48b4-9f7f-603aa66aa252', '2027-09-06 17:00:00', '2027-09-07', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(639, '9c2a1454-c166-4190-9585-53eb511e8c41', '2027-12-19 17:00:00', '2027-12-20', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(638, '9c2a1454-c166-4620-b82e-0544cd902c85', '2026-12-15 17:00:00', '2026-12-16', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(637, '9c2a1454-bb4e-4b0b-b2c0-222c287d2493', '2024-06-11 02:53:05', '2029-06-10', NULL, 60, 7, 24, NULL, NULL, 1, 23, NULL, '2024-05-30 05:03:56', '2024-06-11 02:53:05', NULL),
(636, '9c2a1454-bb4e-46e9-8425-67f967cc4ae6', '2024-06-11 02:55:11', '2029-04-24', NULL, 60, 7, 24, NULL, NULL, 1, 23, NULL, '2024-05-30 05:03:56', '2024-06-11 02:55:11', NULL),
(635, '9c2a1454-b536-43e5-83b3-f74986b6baaf', '2026-09-08 17:00:00', '2026-09-09', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(634, '9c2a1454-b536-4eb6-bd1e-34b1a0061299', '2027-01-18 17:00:00', '2027-01-19', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(633, '9c2a1454-af1e-4b29-a2ea-750e6026f374', '2027-01-25 17:00:00', '2027-01-26', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(632, '9c2a1454-af1e-4b02-8c15-81d6a934ee01', '2026-05-01 17:00:00', '2026-05-02', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(631, '9c2a1454-a906-4028-9bf6-c03eebfdda60', '2024-06-11 03:03:34', '2029-04-14', NULL, 60, 7, 24, NULL, NULL, 1, 23, NULL, '2024-05-30 05:03:56', '2024-06-11 03:03:34', NULL),
(630, '9c2a1454-a906-4dc7-b547-cd32385da7ca', '2024-09-22 17:00:00', '2024-09-23', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(629, '9c2a1454-a2ee-4c02-9b5f-4360b88d2cf0', '2024-10-03 17:00:00', '2024-10-04', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(628, '9c2a1454-9cd6-4a86-8dd1-a43aceba3b6b', '2024-06-11 03:00:04', '2029-04-14', NULL, 60, 7, 24, NULL, NULL, 1, 23, NULL, '2024-05-30 05:03:56', '2024-06-11 03:00:04', NULL),
(627, '9c2a1454-9cd6-431e-b973-9e0dac0bc64a', '2026-11-25 17:00:00', '2026-11-26', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(626, '9c2a1454-8476-4c71-988e-732e2f201a43', '2026-11-23 17:00:00', '2026-11-24', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(625, '9c2a1454-7e5e-4581-ac1f-bf27a583e0c8', '2027-03-30 17:00:00', '2027-03-31', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(624, '9c2a1454-7e5e-465b-92fb-b252329f5f59', '2026-10-30 17:00:00', '2026-10-31', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(623, '9c2a1454-7846-4e03-8c9d-3a2b5c60d167', '2024-06-11 03:01:50', '2029-04-05', NULL, 60, 7, 24, NULL, NULL, 1, 23, NULL, '2024-05-30 05:03:56', '2024-06-11 03:01:50', NULL),
(622, '9c2a1454-7846-4a92-94c9-2631c1de15a0', '2025-06-22 17:00:00', '2025-06-23', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(621, '9c2a1454-722d-4f64-b1ff-d423edc940ba', '2027-12-19 17:00:00', '2027-12-20', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(620, '9c2a1454-722d-4b1b-b738-e7ed0d476c53', '2026-12-07 17:00:00', '2026-12-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(619, '9c2a1454-6c15-41db-8f67-f7d3f1e34aa8', '2026-12-07 17:00:00', '2026-12-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(618, '9c2a1454-6c15-415a-9b81-6c2955920e85', '2027-12-22 17:00:00', '2027-12-23', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(617, '9c2a1454-65fd-4021-9e80-4f949913e678', '2026-07-31 17:00:00', '2026-08-01', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(616, '9c2a1454-65fd-4023-91eb-dd9d3b841d09', '2026-07-05 17:00:00', '2026-07-06', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(615, '9c2a1454-5fe5-4275-9273-0844a6c2f44c', '2028-12-13 17:00:00', '2028-12-14', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(614, '9c2a1454-59cd-4df6-acb6-b1829b7813c5', '2025-03-26 17:00:00', '2025-03-27', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(613, '9c2a1454-59cd-4bf4-9577-9d1a161bb9bc', '2025-03-15 17:00:00', '2025-03-16', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(612, '9c2a1454-53b5-4d90-903e-036eeae62f62', '2027-09-04 17:00:00', '2027-09-05', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(611, '9c2a1454-53b5-4a46-aae1-8afcb41325ea', '2026-12-09 17:00:00', '2026-12-10', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(610, '9c2a1454-4d9d-4399-8451-f3cf6ce06ba1', '2026-02-09 17:00:00', '2026-02-10', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(609, '9c2a1454-4d9d-4447-abd0-bd83f79b7931', '2027-01-19 17:00:00', '2027-01-20', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(608, '9c2a1454-4785-4db8-80d9-b7c47263011b', '2028-02-19 17:00:00', '2028-02-20', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(607, '9c2a1454-4785-4737-a2af-c5cdd28a9bcf', '2028-02-15 17:00:00', '2028-02-16', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(606, '9c2a1454-416d-41b7-abd5-1391810d4cca', '2027-09-05 17:00:00', '2027-09-06', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(605, '9c2a1454-416d-4f6f-a654-fa1683835e43', '2028-12-17 17:00:00', '2028-12-18', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(604, '9c2a1454-3b55-4e92-b7c6-1a385f5a3345', '2028-12-17 17:00:00', '2028-12-18', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(603, '9c2a1454-3b55-4c3a-98c7-6275fb92e5d9', '2029-04-02 17:00:00', '2029-04-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(602, '9c2a1454-353d-4a0c-9cb9-0474673db711', '2029-04-02 17:00:00', '2029-04-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(601, '9c2a1454-353d-488c-8cf2-6515b96d4acc', '2029-04-02 17:00:00', '2029-04-03', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(600, '9c2a1454-2f25-4d19-a5c2-329cb5a4120d', '2026-03-27 17:00:00', '2026-03-28', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(599, '9c2a1454-2f25-4b07-8d5b-f4df6cb02c7c', '2026-03-27 17:00:00', '2026-03-28', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(598, '9c2a1454-290d-4847-826d-c5fc229ef073', '2026-03-27 17:00:00', '2026-03-28', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(597, '9c2a1454-290d-42ef-bf8a-7c6140896e66', '2024-09-22 17:00:00', '2024-09-23', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(596, '9c2a1454-22f5-4e01-b99e-7f5bc8600457', '2024-09-22 17:00:00', '2024-09-23', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(595, '9c2a1454-22f5-45f6-a90c-f2b8a64137bd', '2024-09-22 17:00:00', '2024-09-23', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(594, '9c2a1454-1cdd-4474-a985-f180fe6b47cb', '2026-03-28 17:00:00', '2026-03-29', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(593, '9c2a1454-1cdd-4236-8ec1-98f42e6dc5e3', '2026-03-28 17:00:00', '2026-03-29', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(592, '9c2a1454-16c5-4c94-bea3-e69d0c61a245', '2027-01-23 17:00:00', '2027-01-24', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(591, '9c2a1454-16c5-40fa-b305-b7bc73688c95', '2026-03-27 17:00:00', '2026-03-28', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(590, '9c2a1454-10ad-476d-b6e8-7c00f638b47d', '2027-09-17 17:00:00', '2027-09-18', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(589, '9c2a1454-10ad-48d5-81cc-fae5bb3dba42', '2027-05-07 17:00:00', '2027-05-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(588, '9c2a1454-0a95-4827-a37d-e0d68d9137cf', '2026-04-18 17:00:00', '2026-04-19', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL);
INSERT INTO `document_schedules` (`id`, `document_id`, `schedule_timestamp`, `schedule_date`, `schedule_time`, `reminder_day`, `reminder_repeat`, `reminder_interval`, `reminder_sent`, `next_reminder`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(587, '9c2a1454-0a95-456b-a9fc-d010cb7de811', '2025-10-12 17:00:00', '2025-10-13', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(586, '9c2a1454-047d-4f20-a4ff-39bb5738c5b2', '2027-03-15 17:00:00', '2027-03-16', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(585, '9c2a1454-047d-4e55-9d38-cd2ad0136971', '2027-03-15 17:00:00', '2027-03-16', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(584, '9c2a1453-fe65-40ff-ae97-cbd9f746b910', '2027-03-09 17:00:00', '2027-03-10', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(583, '9c2a1453-fe65-4811-b614-b53b96f09afb', '2027-01-24 17:00:00', '2027-01-25', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(582, '9c2a1453-f84d-493d-bb00-9f594c6e84db', '2028-08-20 17:00:00', '2028-08-21', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(581, '9c2a1453-f84d-4153-b824-49bc86f6c630', '2028-08-20 17:00:00', '2028-08-21', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(580, '9c2a1453-f235-4b4b-85dc-c7fbbbc64a7b', '2028-08-20 17:00:00', '2028-08-21', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(579, '9c2a1453-f235-464b-81ac-0977277cfd0a', '2028-08-20 17:00:00', '2028-08-21', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(578, '9c2a1453-ec1d-41c1-bf0f-c4e33a8d02af', '2028-08-20 17:00:00', '2028-08-21', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(577, '9c2a1453-e605-412c-8b8a-7653be54efb1', '2025-05-18 17:00:00', '2025-05-19', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(576, '9c2a1453-e605-4be6-b6e2-17bb900eaad9', '2027-05-28 17:00:00', '2027-05-29', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(575, '9c2a1453-dfed-4a5a-b840-27fc20048881', '2027-01-27 17:00:00', '2027-01-28', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(574, '9c2a1453-dfed-4532-93fd-aaacb1250c15', '2024-09-11 17:00:00', '2024-09-12', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(573, '9c2a1453-d9d5-4b4c-88e8-fa1ad60b14a3', '2028-04-07 17:00:00', '2028-04-08', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:55', '2024-05-30 05:03:55', NULL),
(572, '9c2a1453-d3bd-4842-a4fa-ab92813a4c82', '2024-09-22 17:00:00', '2024-09-23', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:55', '2024-05-30 05:03:55', NULL),
(571, '9c2a1453-c175-4fcf-a22d-9f8816b66972', '2024-09-15 17:00:00', '2024-09-16', NULL, 60, 7, 24, NULL, NULL, 1, 1, NULL, '2024-05-30 05:03:55', '2024-05-30 05:03:55', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `document_types`
--

CREATE TABLE `document_types` (
  `id` char(36) NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
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
('9b289c86-c740-4709-b95f-c34058d4a0d3', 'SNIE', 'SERTIFIKAT NOMOR IJIN EDAR', NULL, 1, 1, 1, NULL, '2024-01-23 04:21:10', '2024-05-14 05:23:53', NULL),
('9b289c9f-af53-4bf8-8852-4b913beb7ea9', '0002', 'STNK', NULL, 1, 1, 1, NULL, '2024-01-23 04:21:27', '2024-06-07 05:54:40', NULL),
('9b7f0de6-cc66-4872-9888-e3c4eada5dd5', '1', 'Surat Ijin Edar', NULL, 1, 1, 1, NULL, '2024-03-06 03:39:23', '2024-03-06 03:39:23', NULL),
('9b9d0c55-2068-4e4d-9c63-77ed2fb92d12', '654', 'Percobaan 2', NULL, 1, 1, 1, 1, '2024-03-21 02:29:50', '2024-06-07 02:37:37', '2024-06-07 02:37:37'),
('9c35de10-a7b6-4762-9a8f-05ce94700eef', 'CAL', 'Sertifikat Kalibrasi', 'Jadwal Kalibrasi Alat Ukur', 1, 28, 28, NULL, '2024-06-05 01:42:08', '2024-06-05 01:42:08', NULL),
('9c35de56-9166-418b-93bf-b5740850dd8a', 'TERA', 'Sertifikat Tera', 'Jadwal Tera Alat Ukur', 1, 28, 28, NULL, '2024-06-05 01:42:54', '2024-06-05 01:42:54', NULL),
('9c39f7b8-9bb2-4d24-aef5-80e77c68d064', 'S I O', 'S I O', NULL, 1, 1, 1, NULL, '2024-06-07 02:37:11', '2024-06-07 02:37:11', NULL),
('9c39f811-b50a-4417-bae7-265a520818cd', 'IP', 'Izin Perusahaan', NULL, 1, 1, 1, NULL, '2024-06-07 02:38:09', '2024-06-07 02:38:09', NULL),
('9c39f842-d0b0-4996-8c27-d23c73c43b15', 'IPE', 'Izin Peralatan', NULL, 1, 1, 1, NULL, '2024-06-07 02:38:41', '2024-06-07 02:38:41', NULL),
('9c3a6832-f271-433a-841f-8911f1419131', 'CAL', 'Sertifikat Kalibrasi', NULL, 1, 1, 1, NULL, '2024-06-07 07:51:42', '2024-06-07 07:51:42', NULL),
('9c422579-308f-498a-aa1e-e05fde35d9ae', 'FIN-SEC', 'Master Sekretaris', 'Master Filing Finance Secretary', 1, 36, 36, NULL, '2024-06-11 04:11:44', '2024-06-11 04:11:44', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `mime_type` varchar(191) DEFAULT NULL,
  `disk` varchar(191) NOT NULL,
  `conversions_disk` varchar(191) DEFAULT NULL,
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
  `migration` varchar(191) NOT NULL,
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
  `model_type` varchar(191) NOT NULL,
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
  `model_type` varchar(191) NOT NULL,
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
(5, 'App\\Models\\User', 20),
(5, 'App\\Models\\User', 22),
(5, 'App\\Models\\User', 31),
(5, 'App\\Models\\User', 32),
(5, 'App\\Models\\User', 33),
(5, 'App\\Models\\User', 37),
(5, 'App\\Models\\User', 38),
(6, 'App\\Models\\User', 23),
(6, 'App\\Models\\User', 24),
(6, 'App\\Models\\User', 25),
(6, 'App\\Models\\User', 26),
(6, 'App\\Models\\User', 27),
(6, 'App\\Models\\User', 28),
(6, 'App\\Models\\User', 29),
(6, 'App\\Models\\User', 30),
(6, 'App\\Models\\User', 34),
(6, 'App\\Models\\User', 35),
(6, 'App\\Models\\User', 36),
(6, 'App\\Models\\User', 39),
(6, 'App\\Models\\User', 40),
(6, 'App\\Models\\User', 41),
(6, 'App\\Models\\User', 42),
(6, 'App\\Models\\User', 43),
(6, 'App\\Models\\User', 44),
(6, 'App\\Models\\User', 45),
(6, 'App\\Models\\User', 46);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
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
('54536032-8353-49b8-b89f-ddf21f4c21d8', 'App\\Notifications\\NewUserDocumentCreatedWithoutSchedule', 'App\\Models\\User', 38, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Bank Correspondence & Telex Lokal<\\/strong> on <strong>Liana Tjia<\\/strong>\",\"url_backend\":\"http:\\/\\/hq-exch-01:1234\\/admin\\/documents\\/9c4226bc-8ba6-45f4-8a32-67be3e118108\",\"url_frontend\":\"\"}', NULL, '2024-06-11 04:15:16', '2024-06-11 04:15:16'),
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
('d496c22e-3798-4cee-a0e7-d2cc3915a349', 'App\\Notifications\\WaitingDocument', 'App\\Models\\User', 2, '{\"title\":\"Document Entering the reminder period!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Document Entering the reminder period | <strong>Docukemtn Kontrak Pegawai A<\\/strong> on <strong>Admin Istrator<\\/strong>\",\"url_backend\":\"http:\\/\\/localhost:8000\\/admin\\/documents\\/9b862b42-3c5d-4cb6-a457-cb381f34c06c\",\"url_frontend\":\"\"}', NULL, '2024-03-12 07:08:53', '2024-03-12 07:08:53'),
('a7d24b0b-ffbf-4714-aa6d-665199009bed', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 3<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ee39-41c3-958e-8404784b251b\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:10:02', '2024-03-12 17:10:02'),
('88caace9-bb51-4413-890d-dc348d963182', 'App\\Notifications\\WaitingDocument', 'App\\Models\\User', 20, '{\"title\":\"Document Entering the reminder period!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Document Entering the reminder period | <strong>Row 3<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ee39-41c3-958e-8404784b251b\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:10:09', '2024-03-12 17:10:09'),
('faf6c889-2613-4879-ab63-a06cc4620df3', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 2<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ec66-489e-a106-aa9f87e4944d\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:10:09', '2024-03-12 17:10:09'),
('204e6dd9-8d7c-4b93-9a46-61bbbead3516', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 3<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ee39-41c3-958e-8404784b251b\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:11:02', '2024-03-12 17:11:02'),
('119317c0-8f4a-413c-9d12-5fcba18da6e2', 'App\\Notifications\\WaitingDocument', 'App\\Models\\User', 20, '{\"title\":\"Document Entering the reminder period!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Document Entering the reminder period | <strong>Row 3<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ee39-41c3-958e-8404784b251b\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:11:02', '2024-03-12 17:11:02'),
('529802ea-f8c8-49a8-8a7b-d237a1edcfec', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 2<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ec66-489e-a106-aa9f87e4944d\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:11:02', '2024-03-12 17:11:02'),
('b5fcd1fa-68ee-4eb1-b9b0-4232554aeb97', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 3<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ee39-41c3-958e-8404784b251b\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:12:02', '2024-03-12 17:12:02'),
('d0b8ba7e-9af9-4128-ba3a-336bc312184f', 'App\\Notifications\\WaitingDocument', 'App\\Models\\User', 20, '{\"title\":\"Document Entering the reminder period!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Document Entering the reminder period | <strong>Row 3<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ee39-41c3-958e-8404784b251b\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:12:02', '2024-03-12 17:12:02'),
('0b08b9b4-a528-471c-95f3-78dac5582a82', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 2<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ec66-489e-a106-aa9f87e4944d\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:12:02', '2024-03-12 17:12:02'),
('326acb73-2324-42b1-b292-3cbd0f5d6744', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 3<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ee39-41c3-958e-8404784b251b\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:13:02', '2024-03-12 17:13:02'),
('b82317cb-d375-47b7-88e8-32f52368cf9d', 'App\\Notifications\\WaitingDocument', 'App\\Models\\User', 20, '{\"title\":\"Document Entering the reminder period!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Document Entering the reminder period | <strong>Row 3<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ee39-41c3-958e-8404784b251b\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:13:02', '2024-03-12 17:13:02'),
('3cee933e-6f24-4cca-996a-cd44bed86f50', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 2<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ec66-489e-a106-aa9f87e4944d\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:13:02', '2024-03-12 17:13:02'),
('e92c814c-6fe3-4b44-a9ac-a21a3c6ee921', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 2<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ec66-489e-a106-aa9f87e4944d\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:14:01', '2024-03-12 17:14:01'),
('117d82ac-3703-427f-88d1-df0ec94222fc', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 2<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ec66-489e-a106-aa9f87e4944d\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:15:02', '2024-03-12 17:15:02'),
('d974ed6c-0a3b-4f7f-b9ee-e6eebf696841', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 2<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ec66-489e-a106-aa9f87e4944d\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:16:02', '2024-03-12 17:16:02'),
('b62f7b92-4f4a-446e-8a9b-6d1880d51fa5', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 2<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ec66-489e-a106-aa9f87e4944d\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:17:02', '2024-03-12 17:17:02'),
('9fc8b772-0374-478b-9fc6-2232e7b39c68', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Row 2<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b8b54e9-ec66-489e-a106-aa9f87e4944d\",\"url_frontend\":\"\"}', NULL, '2024-03-12 17:18:02', '2024-03-12 17:18:02'),
('592bd40f-6dd4-460b-8937-2deef90a6436', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Surat Ijin Edar Produk A<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b862acf-1f19-47bd-87fb-560d4189b088\",\"url_frontend\":\"\"}', NULL, '2024-03-19 17:00:03', '2024-03-19 17:00:03'),
('6cf9fa88-3fcf-478b-a4fb-2e2ef52c61e6', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 5, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Izin edar produk pembersih 1<\\/strong> on <strong>General User<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b9bac47-43e0-4b4c-b99f-b24a4bc5be17\",\"url_frontend\":\"\"}', NULL, '2024-03-20 10:05:26', '2024-03-20 10:05:26'),
('1cdf8d4f-2e20-4565-b1d7-1a1300167238', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 20, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Izin edar produk pembersih 1<\\/strong> on <strong>General User<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b9bac47-43e0-4b4c-b99f-b24a4bc5be17\",\"url_frontend\":\"\"}', NULL, '2024-03-20 10:05:28', '2024-03-20 10:05:28'),
('7243e969-c341-4c2f-95fc-463984bd711e', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 5, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Izin edar produk pembersih 1<\\/strong> on <strong>General User<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b9bac47-43e0-4b4c-b99f-b24a4bc5be17\",\"url_frontend\":\"\"}', NULL, '2024-03-20 10:05:28', '2024-03-20 10:05:28'),
('986213d6-8be9-4581-9026-d16030f53dac', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Surat Ijin Edar Produk A<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b862acf-1f19-47bd-87fb-560d4189b088\",\"url_frontend\":\"\"}', NULL, '2024-03-20 17:00:02', '2024-03-20 17:00:02'),
('6d55517c-16e1-4c44-bb36-544e008101fb', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Surat Ijin Edar Produk A<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b862acf-1f19-47bd-87fb-560d4189b088\",\"url_frontend\":\"\"}', NULL, '2024-03-21 17:00:02', '2024-03-21 17:00:02'),
('72268e42-ab90-4528-beaa-e381178b02c1', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Surat Ijin Edar Produk A<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b862acf-1f19-47bd-87fb-560d4189b088\",\"url_frontend\":\"\"}', NULL, '2024-03-22 17:00:01', '2024-03-22 17:00:01'),
('c3229d96-7f21-45a0-862d-1e311448fb4f', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Surat Ijin Edar Produk A<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b862acf-1f19-47bd-87fb-560d4189b088\",\"url_frontend\":\"\"}', NULL, '2024-03-23 17:00:04', '2024-03-23 17:00:04'),
('e6b027f5-d3bc-4cf4-8e54-5ccdc35a4fee', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Surat Ijin Edar Produk A<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b862acf-1f19-47bd-87fb-560d4189b088\",\"url_frontend\":\"\"}', NULL, '2024-03-24 17:00:02', '2024-03-24 17:00:02'),
('db66ad21-34c3-4ecc-a113-394882336d9d', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Surat Ijin Edar Produk A<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b862acf-1f19-47bd-87fb-560d4189b088\",\"url_frontend\":\"\"}', NULL, '2024-03-25 17:00:02', '2024-03-25 17:00:02'),
('eb3be47e-8a81-4acc-97df-c3e23bcb7908', 'App\\Notifications\\ExpiredDocument', 'App\\Models\\User', 20, '{\"title\":\"Doucment Expired!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"Doucment Expired | <strong>Surat Ijin Edar Produk A<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"https:\\/\\/remindex.auliaharvy.com\\/admin\\/documents\\/9b862acf-1f19-47bd-87fb-560d4189b088\",\"url_frontend\":\"\"}', NULL, '2024-03-26 17:00:03', '2024-03-26 17:00:03'),
('88d06ed7-2cc8-4580-9925-ebd579451b03', 'App\\Notifications\\NewUserDocumentCreatedWithoutSchedule', 'App\\Models\\User', 38, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Bank Correspondence & Telex Lokal<\\/strong> on <strong>Liana Tjia<\\/strong>\",\"url_backend\":\"http:\\/\\/hq-exch-01:1234\\/admin\\/documents\\/9c4226fb-9a4e-4db1-bef6-889a9f1a5725\",\"url_frontend\":\"\"}', NULL, '2024-06-11 04:15:57', '2024-06-11 04:15:57'),
('f2032f37-4995-4b1f-bf96-e807ac9b8834', 'App\\Notifications\\NewUserDocumentCreatedWithoutSchedule', 'App\\Models\\User', 38, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Bank Correspondence & Telex Lokal<\\/strong> on <strong>Liana Tjia<\\/strong>\",\"url_backend\":\"http:\\/\\/hq-exch-01:1234\\/admin\\/documents\\/9c4227a1-4186-4a44-a8be-96b1335af87a\",\"url_frontend\":\"\"}', NULL, '2024-06-11 04:17:46', '2024-06-11 04:17:46'),
('863925eb-23cd-4202-aeaa-ad1148bbeb85', 'App\\Notifications\\NewUserDocumentCreatedWithoutSchedule', 'App\\Models\\User', 25, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>STNK Mobil BMW<\\/strong> on <strong>Inneke Vincentia<\\/strong>\",\"url_backend\":\"http:\\/\\/hq-exch-01:1234\\/admin\\/documents\\/9c426965-6bb9-413c-9ee7-6472cbab09e5\",\"url_frontend\":\"\"}', NULL, '2024-06-11 07:21:40', '2024-06-11 07:21:40'),
('4659f9d0-aa65-45b4-b75f-d1a0a3bb67ad', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 21, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Test dokumen manual<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/hq-exch-01:1234\\/admin\\/documents\\/9c603937-54b5-421b-8d7c-6cafb858cdc4\",\"url_frontend\":\"\"}', NULL, '2024-06-26 03:01:47', '2024-06-26 03:01:47'),
('847ce091-169f-484c-a11c-073e1220aaca', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 21, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Test dokumen manual<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/hq-exch-01:1234\\/admin\\/documents\\/9c6039ac-8b1a-4cfb-9496-f9ae23a7c437\",\"url_frontend\":\"\"}', NULL, '2024-06-26 03:03:04', '2024-06-26 03:03:04'),
('556514ce-45e5-4ace-8d4f-b092ebb42119', 'App\\Notifications\\NewUserDocumentCreated', 'App\\Models\\User', 21, '{\"title\":\"New Document added!\",\"module\":\"Document\",\"type\":\"created\",\"icon\":\"fas fa-file\",\"text\":\"New Document | <strong>Test dokumen manual<\\/strong> on <strong>Aulia Harvy<\\/strong>\",\"url_backend\":\"http:\\/\\/hq-exch-01:1234\\/admin\\/documents\\/9c603ab5-ddc8-47d0-9910-05c5a1f7ee3e\",\"url_frontend\":\"\"}', NULL, '2024-06-26 03:05:57', '2024-06-26 03:05:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `guard_name` varchar(125) NOT NULL,
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
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
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
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `intro` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) DEFAULT NULL,
  `is_featured` int(11) DEFAULT NULL,
  `featured_image` varchar(191) DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_og_image` varchar(191) DEFAULT NULL,
  `meta_og_url` varchar(191) DEFAULT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `moderated_by` int(10) UNSIGNED DEFAULT NULL,
  `moderated_at` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_by_name` varchar(191) DEFAULT NULL,
  `created_by_alias` varchar(191) DEFAULT NULL,
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
  `name` varchar(125) NOT NULL,
  `guard_name` varchar(125) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super admin', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(5, 'user', 'web', '2024-01-23 04:15:55', '2024-01-23 04:15:55'),
(6, 'super user', 'web', '2024-05-14 01:17:08', '2024-05-14 01:17:08');

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
(1, 6),
(4, 5),
(4, 6),
(20, 6),
(21, 6),
(22, 6),
(23, 6),
(24, 6),
(25, 6),
(26, 6),
(27, 6),
(28, 6),
(29, 6),
(30, 6),
(35, 6),
(40, 5),
(40, 6),
(41, 5),
(41, 6),
(42, 5),
(42, 6),
(43, 5),
(43, 6),
(44, 6),
(45, 6),
(49, 6),
(54, 6);

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
(858, 870, 21, 1, 1, '2024-06-26 03:24:45', '2024-06-26 03:24:45', NULL),
(857, 869, 21, 1, 1, '2024-06-26 03:24:45', '2024-06-26 03:24:45', NULL),
(856, 868, 21, 1, 1, '2024-06-26 03:24:45', '2024-06-26 03:24:45', NULL),
(855, 867, 21, 1, 1, '2024-06-26 03:17:02', '2024-06-26 03:17:02', NULL),
(854, 860, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(853, 859, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(852, 858, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(851, 857, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(850, 856, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(849, 855, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(848, 854, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(847, 853, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(846, 852, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(845, 851, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(844, 850, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(843, 849, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(842, 848, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(841, 847, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(840, 846, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(839, 845, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(838, 844, 28, 1, 1, '2024-06-07 08:08:30', '2024-06-07 08:08:30', NULL),
(837, 843, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(836, 842, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(835, 841, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(834, 840, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(833, 839, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(832, 838, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(831, 837, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(830, 836, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(829, 835, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(828, 834, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(827, 833, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(826, 832, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(825, 831, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(824, 830, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(823, 829, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(822, 828, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(821, 827, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(820, 826, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(819, 825, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(818, 824, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(817, 823, 28, 1, 1, '2024-06-07 08:08:29', '2024-06-07 08:08:29', NULL),
(816, 802, 28, 1, 1, '2024-06-04 04:25:13', '2024-06-04 04:25:13', NULL),
(815, 821, 23, 1, 1, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(814, 820, 23, 1, 1, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(813, 819, 23, 1, 1, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(812, 818, 23, 1, 1, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(811, 817, 23, 1, 1, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(810, 816, 23, 1, 1, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(809, 815, 23, 1, 1, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(808, 814, 23, 1, 1, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(807, 813, 23, 1, 1, '2024-05-30 05:03:58', '2024-05-30 05:03:58', NULL),
(806, 812, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(805, 811, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(804, 810, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(803, 809, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(802, 808, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(801, 807, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(800, 806, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(799, 805, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(798, 804, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(797, 803, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(796, 802, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(795, 801, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(794, 800, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(793, 799, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(792, 798, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(791, 797, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(790, 796, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(789, 795, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(788, 794, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(787, 793, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(786, 792, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(785, 791, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(784, 790, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(783, 789, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(782, 788, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(781, 787, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(780, 786, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(779, 785, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(778, 784, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(777, 783, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(776, 782, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(775, 781, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(774, 780, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(773, 779, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(772, 778, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(771, 777, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(770, 776, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(769, 775, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(768, 774, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(767, 773, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(766, 772, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(765, 771, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(764, 770, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(763, 769, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(762, 768, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(761, 767, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(760, 766, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(759, 765, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(758, 764, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(757, 763, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(756, 762, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(755, 761, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(754, 760, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(753, 759, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(752, 758, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(751, 757, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(750, 756, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(749, 755, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(748, 754, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(747, 753, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(746, 752, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(745, 751, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(744, 750, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(743, 749, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(742, 748, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(741, 747, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(740, 746, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(739, 745, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(738, 744, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(737, 743, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(736, 742, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(735, 741, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(734, 740, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(733, 739, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(732, 738, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(731, 737, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(730, 736, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(729, 735, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(728, 734, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(727, 733, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(726, 732, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(725, 731, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(724, 730, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(723, 729, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(722, 728, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(721, 727, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(720, 726, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(719, 725, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(718, 724, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(717, 723, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(716, 722, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(715, 721, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(714, 720, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(713, 719, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(712, 718, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(711, 717, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(710, 716, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(709, 715, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(708, 714, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(707, 713, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(706, 712, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(705, 711, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(704, 710, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(703, 709, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(702, 708, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(701, 707, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(700, 706, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(699, 705, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(698, 704, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(697, 703, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(696, 702, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(695, 701, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(694, 700, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(693, 699, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(692, 698, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(691, 697, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(690, 696, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(689, 695, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(688, 694, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(687, 693, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(686, 692, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(685, 691, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(684, 690, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(683, 689, 23, 1, 1, '2024-05-30 05:03:57', '2024-05-30 05:03:57', NULL),
(682, 688, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(681, 687, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(680, 686, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(679, 685, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(678, 684, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(677, 683, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(676, 682, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(675, 681, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(674, 680, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(673, 679, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(672, 678, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(671, 677, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(670, 676, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(669, 675, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(668, 674, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(667, 673, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(666, 672, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(665, 671, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(664, 670, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(663, 669, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(662, 668, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(661, 667, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(660, 666, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(659, 665, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(658, 664, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(657, 663, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(656, 662, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(655, 661, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(654, 660, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(653, 659, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(652, 658, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(651, 657, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(650, 656, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(649, 655, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(648, 654, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(647, 653, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(646, 652, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(645, 651, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(644, 650, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(643, 649, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(642, 648, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(641, 647, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(640, 646, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(639, 645, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(638, 644, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(637, 643, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(636, 642, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(635, 641, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(634, 640, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(633, 639, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(632, 638, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(631, 637, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(630, 636, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(629, 635, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(628, 634, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(627, 633, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(626, 632, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(625, 631, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(624, 630, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(623, 629, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(622, 628, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(621, 627, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(620, 626, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(619, 625, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(618, 624, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(617, 623, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(616, 622, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(615, 621, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(614, 620, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(613, 619, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(612, 618, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(611, 617, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(610, 616, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(609, 615, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(608, 614, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(607, 613, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(606, 612, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(605, 611, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(604, 610, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(603, 609, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(602, 608, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(601, 607, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(600, 606, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(599, 605, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(598, 604, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(597, 603, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(596, 602, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(595, 601, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(594, 600, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(593, 599, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(592, 598, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(591, 597, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(590, 596, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(589, 595, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(588, 594, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(587, 593, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(586, 592, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(585, 591, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(584, 590, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(583, 589, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(582, 588, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(581, 587, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(580, 586, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(579, 585, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(578, 584, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(577, 583, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(576, 582, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(575, 581, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(574, 580, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(573, 579, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(572, 578, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(571, 577, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(570, 576, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(569, 575, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(568, 574, 23, 1, 1, '2024-05-30 05:03:56', '2024-05-30 05:03:56', NULL),
(567, 573, 23, 1, 1, '2024-05-30 05:03:55', '2024-05-30 05:03:55', NULL),
(566, 572, 23, 1, 1, '2024-05-30 05:03:55', '2024-05-30 05:03:55', NULL),
(565, 571, 23, 1, 1, '2024-05-30 05:03:55', '2024-05-30 05:03:55', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `val` text DEFAULT NULL,
  `type` char(20) NOT NULL DEFAULT 'string',
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
  `taggable_type` varchar(191) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `group_name` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
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
  `name` varchar(191) NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `username` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `url_website` varchar(191) DEFAULT NULL,
  `url_facebook` varchar(191) DEFAULT NULL,
  `url_twitter` varchar(191) DEFAULT NULL,
  `url_instagram` varchar(191) DEFAULT NULL,
  `url_linkedin` varchar(191) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `user_metadata` text DEFAULT NULL,
  `last_ip` varchar(191) DEFAULT NULL,
  `login_count` int(11) NOT NULL DEFAULT 0,
  `last_login` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
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
(1, 1, 'Super Admin', 'Super', 'Admin', '100001', 'super@admin.com', '930.927.3386', 'Male', NULL, NULL, NULL, NULL, NULL, '2022-03-10', NULL, NULL, 'img/default-avatar.jpg', NULL, '207.68.151.128', 173, '2024-06-26 02:58:44', NULL, 1, NULL, 1, NULL, '2024-01-23 04:15:54', '2024-06-26 02:58:44', NULL),
(2, 2, 'Admin Istrator', 'Admin', 'Istrator', '100002', 'admin@admin.com', '870-988-9497', 'Female', NULL, NULL, NULL, NULL, NULL, '1975-05-03', NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, NULL, 1, 1, '2024-01-23 04:15:54', '2024-05-20 06:40:50', '2024-05-20 06:40:50'),
(3, 3, 'Manager', 'Manager', 'User User', '100003', 'manager@manager.com', '772-749-4710', 'Female', NULL, NULL, NULL, NULL, NULL, '2020-01-11', NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, NULL, 1, 1, '2024-01-23 04:15:55', '2024-05-20 06:41:39', '2024-05-20 06:41:39'),
(4, 4, 'Executive User', 'Executive', 'User', '100004', 'executive@executive.com', '+1-715-471-0040', 'Other', NULL, NULL, NULL, NULL, NULL, '2002-08-19', NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, NULL, 1, 1, '2024-01-23 04:15:55', '2024-05-20 06:41:33', '2024-05-20 06:41:33'),
(5, 5, 'General User', 'General', 'User', '100005', 'user@user.com', '+16162676098', 'Female', NULL, NULL, NULL, NULL, NULL, '1984-04-11', NULL, NULL, 'img/default-avatar.jpg', NULL, '127.0.0.1', 1, '2024-02-12 15:31:03', NULL, 1, NULL, 1, 1, '2024-01-23 04:15:55', '2024-05-20 06:41:26', '2024-05-20 06:41:26'),
(16, 21, 'Aulia Harvy', 'Aulia', 'Harvy', '100021', 'auliaharvy@sangkil.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', 2, '2024-03-09 06:13:58', NULL, 1, 1, 21, NULL, '2024-03-04 15:25:37', '2024-03-09 06:13:58', NULL),
(15, 20, 'Aulia Harvy', 'Aulia', 'Harvy', '100020', 'auliaharvy@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, '180.242.130.200', 17, '2024-03-18 09:25:03', NULL, 1, 1, 1, 1, '2024-03-03 00:14:23', '2024-05-20 06:41:19', '2024-05-20 06:41:19'),
(17, 22, 'Aditya FRR', 'Aditya', 'FRR', '100022', 'Adittt@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, '116.206.15.40', 2, '2024-03-21 02:32:52', NULL, 1, 1, 1, 1, '2024-03-21 02:02:13', '2024-05-20 06:41:00', '2024-05-20 06:41:00'),
(18, 22, 'Aditya FRR', 'Aditya', 'FRR', '100022', 'Adittt@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-03-21 02:02:14', '2024-03-21 02:02:14', NULL),
(19, 23, 'Yayah Komariah', 'Yayah', 'Komariah', '100023', 'yayah.komariah@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '207.68.151.91', 5, '2024-06-11 01:50:57', NULL, 1, 1, 23, NULL, '2024-05-20 06:46:03', '2024-06-11 01:50:57', NULL),
(20, 23, 'Yayah Komariah', 'Yayah', 'Komariah', '100023', 'yayah.komariah@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-05-20 06:46:04', '2024-05-20 06:46:04', NULL),
(21, 24, 'Chandra Kirana', 'Chandra', 'Kirana', '100024', 'chandra.kirana@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-05-20 06:48:34', '2024-05-20 06:48:34', NULL),
(22, 24, 'Chandra Kirana', 'Chandra', 'Kirana', '100024', 'chandra.kirana@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-05-20 06:48:35', '2024-05-20 06:48:35', NULL),
(23, 25, 'Inneke Vincentia', 'Inneke', 'Vincentia', '100025', 'inneke.vincentia@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-05-20 06:49:49', '2024-05-20 06:49:49', NULL),
(24, 25, 'Inneke Vincentia', 'Inneke', 'Vincentia', '100025', 'inneke.vincentia@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-05-20 06:49:49', '2024-05-20 06:49:49', NULL),
(25, 26, 'Sian Sian Ie', 'Sian', 'Sian Ie', '100026', 'sian.ie@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-05-20 06:53:00', '2024-05-20 06:53:00', NULL),
(26, 26, 'Sian Sian Ie', 'Sian', 'Sian Ie', '100026', 'sian.ie@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-05-20 06:53:00', '2024-05-20 06:53:00', NULL),
(27, 27, 'Ros Rupawan', 'Ros', 'Rupawan', '100027', 'ros.rupawan@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-05-20 06:54:25', '2024-05-20 06:54:25', NULL),
(28, 27, 'Ros Rupawan', 'Ros', 'Rupawan', '100027', 'ros.rupawan@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-05-20 06:54:25', '2024-05-20 06:54:25', NULL),
(29, 28, 'Maryana Suryana', 'Maryana', 'Suryana', '100028', 'Maryana.Suryana@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '207.68.151.222', 6, '2024-06-11 01:31:00', NULL, 1, 1, 28, NULL, '2024-06-03 05:38:16', '2024-06-11 01:31:00', NULL),
(30, 28, 'Maryana Suryana', 'Maryana', 'Suryana', '100028', 'Maryana.Suryana@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-03 05:38:16', '2024-06-03 05:38:16', NULL),
(31, 29, 'Fincencia Febriel Dewanta', 'Fincencia', 'Febriel Dewanta', '100029', 'Fincencia@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-05 07:26:23', '2024-06-05 07:26:23', NULL),
(32, 29, 'Fincencia Febriel Dewanta', 'Fincencia', 'Febriel Dewanta', '100029', 'Fincencia@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-05 07:26:23', '2024-06-05 07:26:23', NULL),
(33, 30, 'Juliani Widjaya', 'Juliani', 'Widjaya', '100030', 'Juliani.Widjaya@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-07 07:54:35', '2024-06-07 07:54:35', NULL),
(34, 30, 'Juliani Widjaya', 'Juliani', 'Widjaya', '100030', 'Juliani.Widjaya@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-07 07:54:35', '2024-06-07 07:54:35', NULL),
(35, 31, 'Suyanto Suyanto', 'Suyanto', 'Suyanto', '100031', 'Suyanto@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-07 07:56:00', '2024-06-07 07:56:00', NULL),
(36, 31, 'Suyanto Suyanto', 'Suyanto', 'Suyanto', '100031', 'Suyanto@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-07 07:56:00', '2024-06-07 07:56:00', NULL),
(37, 32, 'Antonius Antonius', 'Antonius', 'Antonius', '100032', 'Antonius@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-07 07:58:41', '2024-06-07 07:58:41', NULL),
(38, 32, 'Antonius Antonius', 'Antonius', 'Antonius', '100032', 'Antonius@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-07 07:58:41', '2024-06-07 07:58:41', NULL),
(39, 33, 'Phung Sian Min', 'Phung', 'Sian Min', '100033', 'Phung.Sian.Min@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-07 08:02:45', '2024-06-07 08:02:45', NULL),
(40, 33, 'Phung Sian Min', 'Phung', 'Sian Min', '100033', 'Phung.Sian.Min@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-07 08:02:45', '2024-06-07 08:02:45', NULL),
(41, 34, 'Megawati Suryana', 'Megawati', 'Suryana', '100034', 'Megawati@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-07 08:04:01', '2024-06-07 08:04:01', NULL),
(42, 34, 'Megawati Suryana', 'Megawati', 'Suryana', '100034', 'Megawati@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-07 08:04:01', '2024-06-07 08:04:01', NULL),
(43, 35, 'Agus Ruhiat', 'Agus', 'Ruhiat', '100035', 'Agus.Ruhiat@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-07 08:06:58', '2024-06-07 08:06:58', NULL),
(44, 35, 'Agus Ruhiat', 'Agus', 'Ruhiat', '100035', 'Agus.Ruhiat@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-07 08:06:59', '2024-06-07 08:06:59', NULL),
(45, 36, 'Jessira Darmawan', 'Jessira', 'Darmawan', '100036', 'jessira.darmawan@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '207.68.151.224', 5, '2024-06-25 02:10:31', NULL, 1, 1, 36, NULL, '2024-06-11 02:43:25', '2024-06-25 02:10:31', NULL),
(46, 36, 'Jessira Darmawan', 'Jessira', 'Darmawan', '100036', 'jessira.darmawan@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 02:43:26', '2024-06-11 02:43:26', NULL),
(47, 37, 'Tomy Hendarmin', 'Tomy', 'Hendarmin', '100037', 'tomy.hendarmin@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '207.68.151.76', 5, '2024-06-12 04:14:59', NULL, 1, 1, 37, NULL, '2024-06-11 02:45:59', '2024-06-12 04:14:59', NULL),
(48, 37, 'Tomy Hendarmin', 'Tomy', 'Hendarmin', '100037', 'tomy.hendarmin@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 02:45:59', '2024-06-11 02:45:59', NULL),
(49, 38, 'Liana Tjia', 'Liana', 'Tjia', '100038', 'liana.tjia@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 02:47:27', '2024-06-11 02:47:27', NULL),
(50, 38, 'Liana Tjia', 'Liana', 'Tjia', '100038', 'liana.tjia@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 02:47:27', '2024-06-11 02:47:27', NULL),
(51, 39, 'Nelly Febriani', 'Nelly', 'Febriani', '100039', 'nelly@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '207.68.151.154', 2, '2024-06-11 04:05:21', NULL, 1, 1, 39, NULL, '2024-06-11 02:58:06', '2024-06-11 04:05:21', NULL),
(52, 39, 'Nelly Febriani', 'Nelly', 'Febriani', '100039', 'nelly@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 02:58:06', '2024-06-11 02:58:06', NULL),
(53, 40, 'Amanda Ayuningtyas', 'Amanda', 'Ayuningtyas', '100040', 'amanda.ayuningtyas@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 03:15:14', '2024-06-11 03:15:14', NULL),
(54, 40, 'Amanda Ayuningtyas', 'Amanda', 'Ayuningtyas', '100040', 'amanda.ayuningtyas@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 03:15:14', '2024-06-11 03:15:14', NULL),
(55, 41, 'Christina Dewi', 'Christina', 'Dewi', '100041', 'christina.dewi@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 03:18:57', '2024-06-11 03:18:57', NULL),
(56, 41, 'Christina Dewi', 'Christina', 'Dewi', '100041', 'christina.dewi@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 03:18:57', '2024-06-11 03:18:57', NULL),
(57, 42, 'Eka Pratiwi', 'Eka', 'Pratiwi', '100042', 'eka.pratiwi@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 03:22:00', '2024-06-11 03:22:00', NULL),
(58, 42, 'Eka Pratiwi', 'Eka', 'Pratiwi', '100042', 'eka.pratiwi@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 03:22:00', '2024-06-11 03:22:00', NULL),
(59, 43, 'Ernawati Ernawati', 'Ernawati', 'Ernawati', '100043', 'ernawati@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 03:25:23', '2024-06-11 03:25:23', NULL),
(60, 43, 'Ernawati Ernawati', 'Ernawati', 'Ernawati', '100043', 'ernawati@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 03:25:23', '2024-06-11 03:25:23', NULL),
(61, 44, 'Kristianto Kristianto', 'Kristianto', 'Kristianto', '100044', 'kristianto@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 03:27:53', '2024-06-11 03:27:53', NULL),
(62, 44, 'Kristianto Kristianto', 'Kristianto', 'Kristianto', '100044', 'kristianto@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 03:27:53', '2024-06-11 03:27:53', NULL),
(63, 45, 'Sherlyana Gunawan', 'Sherlyana', 'Gunawan', '100045', 'sherlyana.gunawan@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 03:29:52', '2024-06-11 03:29:52', NULL),
(64, 45, 'Sherlyana Gunawan', 'Sherlyana', 'Gunawan', '100045', 'sherlyana.gunawan@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 03:29:52', '2024-06-11 03:29:52', NULL),
(65, 46, 'Wenwen Bahagia Putra', 'Wenwen', 'Bahagia Putra', '100046', 'wenwen.bahagia.putra@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '207.68.151.227', 1, '2024-06-11 09:12:16', NULL, 1, 1, 46, NULL, '2024-06-11 03:42:08', '2024-06-11 09:12:16', NULL),
(66, 46, 'Wenwen Bahagia Putra', 'Wenwen', 'Bahagia Putra', '100046', 'wenwen.bahagia.putra@scjohnson.co.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/default-avatar.jpg', NULL, NULL, 0, NULL, NULL, 1, 1, 1, NULL, '2024-06-11 03:42:08', '2024-06-11 03:42:08', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` char(36) DEFAULT NULL,
  `department_name` varchar(200) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `username` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT 'img/default-avatar.jpg',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
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
(2, NULL, NULL, 'Admin Istrator', 'Admin', 'Istrator', '100002', 'admin@admin.com', '870-988-9497', 'Female', '1975-05-03', '2024-01-23 04:15:52', '$2y$10$X8zNoI4N7yfDRP1tgOGLP.LtmuyKXcEzt9FVyaaUFjaQ5y3dqFttG', 'img/default-avatar.jpg', 1, NULL, NULL, 1, 1, '2024-01-23 04:15:52', '2024-05-20 06:40:50', '2024-05-20 06:40:50'),
(3, NULL, NULL, 'Manager', 'Manager', 'User User', '100003', 'manager@manager.com', '772-749-4710', 'Female', '2020-01-11', '2024-01-23 04:15:52', '$2y$10$3eGe6382zepb.qshxjyME.mSVU.vgOlZ/YAZCkFQHRp7kEIRjjUxO', 'img/default-avatar.jpg', 1, NULL, NULL, 1, 1, '2024-01-23 04:15:52', '2024-05-20 06:41:39', '2024-05-20 06:41:39'),
(4, NULL, NULL, 'Executive User', 'Executive', 'User', '100004', 'executive@executive.com', '+1-715-471-0040', 'Other', '2002-08-19', '2024-01-23 04:15:52', '$2y$10$uxkpemzZ4FWh/lYDwe5.3.5YPAkgrRWU3xAMhfiu0ZuNuIdCr7o8i', 'img/default-avatar.jpg', 1, NULL, NULL, 1, 1, '2024-01-23 04:15:52', '2024-05-20 06:41:33', '2024-05-20 06:41:33'),
(5, NULL, NULL, 'General User', 'General', 'User', '100005', 'user@user.com', '+16162676098', 'Female', '1984-04-11', '2024-01-23 04:15:52', '$2y$10$8RyR5JNc3cEjlyVOXodnvOCF1xpw7Pa5cvV/ldpan.dOdDSnd8gVS', 'img/default-avatar.jpg', 1, NULL, NULL, 1, 1, '2024-01-23 04:15:52', '2024-05-20 06:41:26', '2024-05-20 06:41:26'),
(21, '9b289c58-0c51-452e-8274-3d0f576ed658', 'Accounting', 'Aulia Harvy', 'Aulia', 'Harvy', '100021', 'auliaharvy@sangkil.net', NULL, NULL, NULL, '2024-03-04 15:25:37', '$2y$10$S2gtI0GUFjGfKvi6uJcsoeBuS.N5GIbG4jIi4rBr3Cx1KkYaLJOFW', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-03-04 15:25:37', '2024-03-09 06:13:44', NULL),
(20, '9b289c58-0c51-452e-8274-3d0f576ed658', 'Accounting', 'Aulia Harvy', 'Aulia', 'Harvy', '100020', 'auliaharvy@gmail.com', NULL, NULL, NULL, '2024-03-03 00:14:23', '$2y$10$13.cpMeR05D90E8Qnstuq.3TKbB0xOk6ucMuyaOxV0ay0iYMY2FI.', 'img/default-avatar.jpg', 1, NULL, 1, 1, 1, '2024-03-03 00:14:23', '2024-05-20 06:41:19', '2024-05-20 06:41:19'),
(22, '9b9bab75-9e8e-4cd0-a6cb-301deff0cfdb', 'Legal', 'Aditya FRR', 'Aditya', 'FRR', '100022', 'Adittt@gmail.com', NULL, NULL, NULL, '2024-03-21 02:02:13', '$2y$10$253yH.Ybzqv.OZaAPdxZBOeqdHOKpIlSto37sMkO0VnAL/7hlnhwy', 'img/default-avatar.jpg', 1, NULL, 1, 1, 1, '2024-03-21 02:02:13', '2024-05-20 06:41:00', '2024-05-20 06:41:00'),
(23, '9c099287-f178-4e79-938f-84397477b966', 'RESEARCH & DEVELOPMENT', 'Yayah Komariah', 'Yayah', 'Komariah', '100023', 'yayah.komariah@scjohnson.co.id', NULL, NULL, NULL, '2024-05-20 06:46:03', '$2y$10$Y.Mkafjl9WBx5.IQXL4Vy.VH4vu9DQudfV1W8s4i1uyVJ7ze5cZOu', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-05-20 06:46:03', '2024-06-07 03:12:41', NULL),
(24, '9b289c58-0c51-452e-8274-3d0f576ed658', 'GENERAL SERVICE', 'Chandra Kirana', 'Chandra', 'Kirana', '100024', 'chandra.kirana@scjohnson.co.id', NULL, NULL, NULL, '2024-05-20 06:48:34', '$2y$10$HPm9YSVy7pFnlwQd0PSA4uLY.3DrDopEkR6rUlGZK./P4V1iXobCG', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-05-20 06:48:34', '2024-05-20 06:48:34', NULL),
(25, '9b289c58-0c51-452e-8274-3d0f576ed658', 'GENERAL SERVICE', 'Inneke Vincentia', 'Inneke', 'Vincentia', '100025', 'inneke.vincentia@scjohnson.co.id', NULL, NULL, NULL, '2024-05-20 06:49:49', '$2y$10$D3EH9MwmOcjpdo6eWliRG.pF/birODuoF5NX5KNkt.hDtx1jct6g.', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-05-20 06:49:49', '2024-05-20 06:49:49', NULL),
(26, '9c099287-f178-4e79-938f-84397477b966', 'RESEARCH & DEVELOPMENT', 'Sian Sian Ie', 'Sian', 'Sian Ie', '100026', 'sian.ie@scjohnson.co.id', NULL, NULL, NULL, '2024-05-20 06:53:00', '$2y$10$ZU3.WJEVXNVk/POkblP1kepCZKUZHTi0KokeZe4mOGtTHo/ooGJhS', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-05-20 06:53:00', '2024-05-20 06:53:00', NULL),
(27, '9b289c58-0c51-452e-8274-3d0f576ed658', 'GENERAL SERVICE', 'Ros Rupawan', 'Ros', 'Rupawan', '100027', 'ros.rupawan@scjohnson.co.id', NULL, NULL, NULL, '2024-05-20 06:54:25', '$2y$10$bT4So/erixw6gX73cbYkFuoYEMU0RzPHbkljVrd6KTcI9BFSzx6Ka', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-05-20 06:54:25', '2024-05-20 06:54:25', NULL),
(28, '9c099287-f178-4e79-938f-84397477b966', 'RESEARCH & DEVELOPMENT', 'Maryana Suryana', 'Maryana', 'Suryana', '100028', 'Maryana.Suryana@scjohnson.co.id', NULL, NULL, NULL, '2024-06-03 05:38:16', '$2y$10$PTJtpTrkb6DUF7iR.tEtrOYnrQ9Alq.f7U2Gn7NnIhP/BpUtBL8k2', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-03 05:38:16', '2024-06-03 05:38:16', NULL),
(29, '9c0991f6-eda1-418a-862c-84c093776595', 'OCCUPANCY', 'Fincencia Febriel Dewanta', 'Fincencia', 'Febriel Dewanta', '100029', 'Fincencia@scjohnson.co.id', NULL, NULL, NULL, '2024-06-05 07:26:23', '$2y$10$78cNPEeOdXjmMl3WOq/RrOnLOAD7vjqR9KYYl0YYDXjKyP6wkgK..', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-05 07:26:23', '2024-06-05 07:26:23', NULL),
(30, '9c099265-3c9c-454f-8856-652000be2b1e', 'QUALITY CONTROL', 'Juliani Widjaya', 'Juliani', 'Widjaya', '100030', 'Juliani.Widjaya@scjohnson.co.id', NULL, NULL, NULL, '2024-06-07 07:54:35', '$2y$10$JxqHvu1bkuRJWdjZHTHdZON/3sQsqbostQVamOZ0XLuknR40k.xmO', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-07 07:54:35', '2024-06-07 07:54:35', NULL),
(31, '9c099247-6f16-43cc-92a3-b1d33b072ed6', 'PRODUCTION', 'Suyanto Suyanto', 'Suyanto', 'Suyanto', '100031', 'Suyanto@scjohnson.co.id', NULL, NULL, NULL, '2024-06-07 07:56:00', '$2y$10$zHy4BDVsjSYAonxUYsw3eu2UOoBqKtZCwM7Ft.ccgo1PdTiNlkeeW', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-07 07:56:00', '2024-06-07 07:56:00', NULL),
(32, '9b289c68-aa9d-4ae6-a385-303d2fc9bf23', 'LOGISTIK', 'Antonius Antonius', 'Antonius', 'Antonius', '100032', 'Antonius@scjohnson.co.id', NULL, NULL, NULL, '2024-06-07 07:58:41', '$2y$10$.hiKAGhzXkwiQlKQmcWlV.jt.F4CeuFDYboMZAmBpiVH9f.kQmo.O', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-07 07:58:41', '2024-06-07 07:58:41', NULL),
(33, '9b9d0af4-9925-454b-bc87-0517e9a3f150', 'INFORMATION SYSTEM', 'Phung Sian Min', 'Phung', 'Sian Min', '100033', 'Phung.Sian.Min@scjohnson.co.id', NULL, NULL, NULL, '2024-06-07 08:02:45', '$2y$10$YE.fGU/am8UEgvtCgSYl7u8WJGjY81q05KD1Mcv7DFrMHcASe5XJi', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-07 08:02:45', '2024-06-07 08:02:45', NULL),
(34, '9b289c58-0c51-452e-8274-3d0f576ed658', 'GENERAL SERVICE', 'Megawati Suryana', 'Megawati', 'Suryana', '100034', 'Megawati@scjohnson.co.id', NULL, NULL, NULL, '2024-06-07 08:04:01', '$2y$10$aVgEP48tBAs2vMAq6dEYm./4kl4Z23jbwnh96s4Elfd5G3wXh6e8S', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-07 08:04:01', '2024-06-07 08:04:01', NULL),
(35, '9c099247-6f16-43cc-92a3-b1d33b072ed6', 'PRODUCTION', 'Agus Ruhiat', 'Agus', 'Ruhiat', '100035', 'Agus.Ruhiat@scjohnson.co.id', NULL, NULL, NULL, '2024-06-07 08:06:58', '$2y$10$sCs2tGiHnuvkhwxaEeMk0O72QxH8V2UfMVNvMEkJhkODe3mRgHZLG', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-07 08:06:58', '2024-06-07 08:06:58', NULL),
(36, '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'FINANCE/ACCOUNTING', 'Jessira Darmawan', 'Jessira', 'Darmawan', '100036', 'jessira.darmawan@scjohnson.co.id', NULL, NULL, NULL, '2024-06-11 02:43:25', '$2y$10$aHzRRfeGVUFubFjiaoIqkeFkIvGQjpMGe94t3oywh4U4aF8WaNfom', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-11 02:43:25', '2024-06-11 02:43:25', NULL),
(37, '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'FINANCE/ACCOUNTING', 'Tomy Hendarmin', 'Tomy', 'Hendarmin', '100037', 'tomy.hendarmin@scjohnson.co.id', NULL, NULL, NULL, '2024-06-11 02:45:58', '$2y$10$CLbKUg2BYT.KvlgPMHqJ5OcHTtogovez5oB51CYMscKQcEYp2Td2S', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-11 02:45:59', '2024-06-11 02:45:59', NULL),
(38, '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'FINANCE/ACCOUNTING', 'Liana Tjia', 'Liana', 'Tjia', '100038', 'liana.tjia@scjohnson.co.id', NULL, NULL, NULL, '2024-06-11 02:47:27', '$2y$10$wXf3hi9SC2QMGEMoBvHpAu4vMd6igvEt85tzI6cXhfyLyenaT2YkS', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-11 02:47:27', '2024-06-11 02:47:27', NULL),
(39, '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'FINANCE/ACCOUNTING', 'Nelly Febriani', 'Nelly', 'Febriani', '100039', 'nelly@scjohnson.co.id', NULL, NULL, NULL, '2024-06-11 02:58:06', '$2y$10$e5dqSQuWHMH8OrZ9TkVgTuXLomBaldxgKQVNVuD0rdv4QTRKnuxnS', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-11 02:58:06', '2024-06-11 02:58:06', NULL),
(40, '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'FINANCE/ACCOUNTING', 'Amanda Ayuningtyas', 'Amanda', 'Ayuningtyas', '100040', 'amanda.ayuningtyas@scjohnson.co.id', NULL, NULL, NULL, '2024-06-11 03:15:14', '$2y$10$p8c.R9b/y.kgzm0BfBnrJ.g1HaOZCAq2sW3nys5ufCAEFKL3VVNyq', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-11 03:15:14', '2024-06-11 03:15:14', NULL),
(41, '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'FINANCE/ACCOUNTING', 'Christina Dewi', 'Christina', 'Dewi', '100041', 'christina.dewi@scjohnson.co.id', NULL, NULL, NULL, '2024-06-11 03:18:57', '$2y$10$h0DnXYbqdJa.3QuJ6TC7dOzF.NlWfif9VPXhjPMcY7LRak0jLMtTu', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-11 03:18:57', '2024-06-11 03:18:57', NULL),
(42, '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'FINANCE/ACCOUNTING', 'Eka Pratiwi', 'Eka', 'Pratiwi', '100042', 'eka.pratiwi@scjohnson.co.id', NULL, NULL, NULL, '2024-06-11 03:22:00', '$2y$10$fiEQgXNs0aMavjQt.hawS.XxFQnNi9BTEolAmLOO0XbWqlj61Zr9G', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-11 03:22:00', '2024-06-11 03:22:00', NULL),
(43, '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'FINANCE/ACCOUNTING', 'Ernawati Ernawati', 'Ernawati', 'Ernawati', '100043', 'ernawati@scjohnson.co.id', NULL, NULL, NULL, '2024-06-11 03:25:23', '$2y$10$pvnzi2i1aaZdlomrRIxxA.1YMNMfAgFvdtH1c16zVwEINzJ4KD8Zy', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-11 03:25:23', '2024-06-11 03:25:23', NULL),
(44, '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'FINANCE/ACCOUNTING', 'Kristianto Kristianto', 'Kristianto', 'Kristianto', '100044', 'kristianto@scjohnson.co.id', NULL, NULL, NULL, '2024-06-11 03:27:53', '$2y$10$ECuBK2s1vDcdi5DJrrGX4Oswl3Yc25L.M1SnjSyJMDZ4Y6D/Gyq4a', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-11 03:27:53', '2024-06-11 03:27:53', NULL),
(45, '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'FINANCE/ACCOUNTING', 'Sherlyana Gunawan', 'Sherlyana', 'Gunawan', '100045', 'sherlyana.gunawan@scjohnson.co.id', NULL, NULL, NULL, '2024-06-11 03:29:52', '$2y$10$yHwgABkexWxTFh4b7PBRReyp/y8Ao0j.J8hqtLqs7.ZzdJJzrvzTe', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-11 03:29:52', '2024-06-11 03:29:52', NULL),
(46, '9b289bec-52cc-48da-80f6-bf9de8cb714a', 'FINANCE/ACCOUNTING', 'Wenwen Bahagia Putra', 'Wenwen', 'Bahagia Putra', '100046', 'wenwen.bahagia.putra@scjohnson.co.id', NULL, NULL, NULL, '2024-06-11 03:42:08', '$2y$10$cY7vxi3RlhWM8tWbyxxCDuWs.2QzPToclZrcdA2BhvJb92NQsmzYe', 'img/default-avatar.jpg', 1, NULL, 1, 1, NULL, '2024-06-11 03:42:08', '2024-06-11 03:42:08', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_providers`
--

CREATE TABLE `user_providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(191) NOT NULL,
  `provider_id` varchar(191) NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=871;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `schedule_pics`
--
ALTER TABLE `schedule_pics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=859;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `user_providers`
--
ALTER TABLE `user_providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
