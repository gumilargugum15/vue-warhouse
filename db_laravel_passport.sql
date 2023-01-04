/*
 Navicat Premium Data Transfer

 Source Server         : mysql_local
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : db_laravel_passport

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 28/12/2022 21:33:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (34, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (35, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (36, '2016_06_01_000001_create_oauth_auth_codes_table', 1);
INSERT INTO `migrations` VALUES (37, '2016_06_01_000002_create_oauth_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (38, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1);
INSERT INTO `migrations` VALUES (39, '2016_06_01_000004_create_oauth_clients_table', 1);
INSERT INTO `migrations` VALUES (40, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);
INSERT INTO `migrations` VALUES (41, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (42, '2022_12_10_014502_create_products_table', 1);
INSERT INTO `migrations` VALUES (43, '2022_12_22_064216_create_products_ins_table', 1);
INSERT INTO `migrations` VALUES (44, '2022_12_22_065345_create_products_in_details_table', 1);

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_access_tokens_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
INSERT INTO `oauth_access_tokens` VALUES ('a9d8f3b2f9fc246cbc4f66c29dfb9ecbc036e80238e889019213d296f8467be19918fff23098190f', 1, 3, 'authToken', '[]', 0, '2022-12-28 14:14:45', '2022-12-28 14:14:45', '2023-12-28 14:14:45');

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_auth_codes_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth_auth_codes
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_clients_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
INSERT INTO `oauth_clients` VALUES (1, 1, 'Laravel Personal Access Client', 'sicjNgWLwlPc6EewpzzTNSRdtmvxdGeE1G9g0YLJ', NULL, 'http://localhost', 1, 0, 0, '2022-12-22 13:34:00', '2022-12-22 13:34:00');
INSERT INTO `oauth_clients` VALUES (2, 1, 'Laravel Password Grant Client', 'ZUnPZAdJjWX75LgzIhOqtBpNDfOI1VB5hUp9Qnpo', 'users', 'http://localhost', 0, 1, 0, '2022-12-22 13:34:00', '2022-12-22 13:34:00');
INSERT INTO `oauth_clients` VALUES (3, 1, 'Laravel Personal Access Client', 'K6yEmhlBa7Neu7hiNGFJDlrvCU4F9ytfNTlexibp', NULL, 'http://localhost', 1, 0, 0, '2022-12-22 13:34:18', '2022-12-22 13:34:18');
INSERT INTO `oauth_clients` VALUES (4, 1, 'Laravel Password Grant Client', 'AdWq7xetTqB3Uz5Ldm4bhQ0znjt7JhQwHatQaUoA', 'users', 'http://localhost', 0, 1, 0, '2022-12-22 13:34:18', '2022-12-22 13:34:18');

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
INSERT INTO `oauth_personal_access_clients` VALUES (1, 1, '2022-12-22 13:34:00', '2022-12-22 13:34:00');
INSERT INTO `oauth_personal_access_clients` VALUES (2, 3, '2022-12-22 13:34:18', '2022-12-22 13:34:18');

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_refresh_tokens_access_token_id_index`(`access_token_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `price` decimal(18, 2) NULL DEFAULT NULL,
  `stock` int NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'B00001', 'SAMPOERNA MILD 16', NULL, 29000.00, 10, '2022-12-22 14:01:15', '2022-12-22 14:01:15');
INSERT INTO `products` VALUES (2, 'B00002', 'SURYA 16', NULL, 29000.00, 10, '2022-12-22 14:02:29', '2022-12-22 14:02:29');
INSERT INTO `products` VALUES (3, 'B00003', 'CLASS MILD', NULL, 22000.00, 10, '2022-12-22 14:03:01', '2022-12-22 14:03:01');
INSERT INTO `products` VALUES (4, 'B00004', 'DJI SAM SOE', NULL, 19000.00, 10, '2022-12-22 14:12:47', '2022-12-22 14:12:47');
INSERT INTO `products` VALUES (5, 'B00005', 'SAMPOERNA KRETEK', NULL, 15000.00, 10, '2022-12-22 14:13:27', '2022-12-22 14:13:27');
INSERT INTO `products` VALUES (6, 'B00006', 'DJARUM COKLAT', NULL, 15000.00, 10, '2022-12-22 14:13:52', '2022-12-22 14:13:52');

-- ----------------------------
-- Table structure for products_in_details
-- ----------------------------
DROP TABLE IF EXISTS `products_in_details`;
CREATE TABLE `products_in_details`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_in_id` int NOT NULL DEFAULT 0,
  `products_id` int NOT NULL DEFAULT 0,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products_in_details
-- ----------------------------
INSERT INTO `products_in_details` VALUES (1, 1, 6, 'B00006', 'DJARUM COKLAT', '1', '1', NULL, '2022-12-25 12:34:53', '2022-12-25 12:34:53');
INSERT INTO `products_in_details` VALUES (2, 1, 5, 'B00005', 'SAMPOERNA KRETEK', '1', '1', NULL, '2022-12-25 12:34:53', '2022-12-25 12:34:53');
INSERT INTO `products_in_details` VALUES (3, 2, 5, 'B00005', 'SAMPOERNA KRETEK', '1', '1', NULL, '2022-12-25 13:36:49', '2022-12-25 13:36:49');
INSERT INTO `products_in_details` VALUES (4, 2, 4, 'B00004', 'DJI SAM SOE', '1', '1', NULL, '2022-12-25 13:36:49', '2022-12-25 13:36:49');
INSERT INTO `products_in_details` VALUES (5, 2, 3, 'B00003', 'CLASS MILD', '1', '1', NULL, '2022-12-25 13:36:49', '2022-12-25 13:36:49');
INSERT INTO `products_in_details` VALUES (6, 3, 1, 'B00001', 'SAMPOERNA MILD 16', '1', '1', NULL, '2022-12-25 13:54:45', '2022-12-25 13:54:45');
INSERT INTO `products_in_details` VALUES (7, 3, 2, 'B00002', 'SURYA 16', '1', '1', NULL, '2022-12-25 13:54:45', '2022-12-25 13:54:45');
INSERT INTO `products_in_details` VALUES (8, 4, 6, 'B00006', 'DJARUM COKLAT', '1', '1', NULL, '2022-12-25 15:31:29', '2022-12-25 15:31:29');
INSERT INTO `products_in_details` VALUES (9, 4, 5, 'B00005', 'SAMPOERNA KRETEK', '1', '1', NULL, '2022-12-25 15:31:29', '2022-12-25 15:31:29');
INSERT INTO `products_in_details` VALUES (10, 5, 3, 'B00003', 'CLASS MILD', '1', '1', NULL, '2022-12-25 22:56:25', '2022-12-25 22:56:25');
INSERT INTO `products_in_details` VALUES (11, 5, 4, 'B00004', 'DJI SAM SOE', '1', '1', NULL, '2022-12-25 22:56:25', '2022-12-25 22:56:25');
INSERT INTO `products_in_details` VALUES (12, 5, 6, 'B00006', 'DJARUM COKLAT', '1', '1', NULL, '2022-12-25 22:56:25', '2022-12-25 22:56:25');
INSERT INTO `products_in_details` VALUES (13, 6, 6, 'B00006', 'DJARUM COKLAT', '1', '1', NULL, '2022-12-28 11:54:52', '2022-12-28 11:54:52');
INSERT INTO `products_in_details` VALUES (14, 6, 5, 'B00005', 'SAMPOERNA KRETEK', '1', '1', NULL, '2022-12-28 11:54:52', '2022-12-28 11:54:52');
INSERT INTO `products_in_details` VALUES (15, 7, 3, 'B00003', 'CLASS MILD', '1', '1', NULL, '2022-12-28 14:11:04', '2022-12-28 14:11:04');
INSERT INTO `products_in_details` VALUES (16, 7, 4, 'B00004', 'DJI SAM SOE', '1', '1', NULL, '2022-12-28 14:11:04', '2022-12-28 14:11:04');

-- ----------------------------
-- Table structure for products_ins
-- ----------------------------
DROP TABLE IF EXISTS `products_ins`;
CREATE TABLE `products_ins`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int NULL DEFAULT 0,
  `date_in` date NOT NULL,
  `qty` int NULL DEFAULT 0,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products_ins
-- ----------------------------
INSERT INTO `products_ins` VALUES (1, 'FR00001', 1, '2022-12-25', 0, '-', '1', NULL, '2022-12-25 12:34:53', '2022-12-25 12:34:53');
INSERT INTO `products_ins` VALUES (2, 'FR00002', 2, '2022-12-25', 0, '-', '1', NULL, '2022-12-25 13:36:49', '2022-12-25 13:36:49');
INSERT INTO `products_ins` VALUES (3, 'FR00003', 2, '2022-12-25', 0, '-', '1', NULL, '2022-12-25 13:54:45', '2022-12-25 13:54:45');
INSERT INTO `products_ins` VALUES (4, 'FR00004', 2, '2022-12-25', 0, NULL, '1', NULL, '2022-12-25 15:31:29', '2022-12-25 15:31:29');
INSERT INTO `products_ins` VALUES (5, 'FR00005', 3, '2022-12-26', 0, NULL, '1', NULL, '2022-12-25 22:56:25', '2022-12-25 22:56:25');
INSERT INTO `products_ins` VALUES (6, 'RF00006', 1, '2022-12-28', 0, NULL, '1', NULL, '2022-12-28 11:54:52', '2022-12-28 11:54:52');
INSERT INTO `products_ins` VALUES (7, 'RF00007', 2, '2022-12-28', 0, '-', '1', NULL, '2022-12-28 14:11:04', '2022-12-28 14:11:04');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Gugum Gumilar', 'admin@gmail.com', NULL, '$2y$10$UaE72cpnbSVQS0J85lllxuhOWE4wvHO./PKFQL4qhI3wOxHXI4y7i', NULL, '2022-12-22 09:42:08', '2022-12-22 09:42:08');

SET FOREIGN_KEY_CHECKS = 1;
