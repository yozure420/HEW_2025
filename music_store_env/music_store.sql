-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- ホスト: db
-- 生成日時: 2025 年 10 月 28 日 01:48
-- サーバのバージョン： 8.0.39
-- PHP のバージョン: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `music_store`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `activity_log`
--

CREATE TABLE `activity_log` (
  `log_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `track_id` bigint DEFAULT NULL,
  `action_type` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `bookmark`
--

CREATE TABLE `bookmark` (
  `bookmark_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `track_id` bigint NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `cart`
--

CREATE TABLE `cart` (
  `user_id` bigint NOT NULL,
  `track_id` bigint NOT NULL,
  `added_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `comment`
--

CREATE TABLE `comment` (
  `comment_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `track_id` bigint NOT NULL,
  `parent_comment_id` bigint DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `favorite`
--

CREATE TABLE `favorite` (
  `user_id` bigint NOT NULL,
  `track_id` bigint NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `favorite`
--

INSERT INTO `favorite` (`user_id`, `track_id`, `created_at`) VALUES
(1, 1, '2025-10-28 01:39:25'),
(1, 3, '2025-10-28 01:39:25'),
(2, 2, '2025-10-28 01:39:25');

-- --------------------------------------------------------

--
-- テーブルの構造 `follow`
--

CREATE TABLE `follow` (
  `follower_id` bigint NOT NULL,
  `followee_id` bigint NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `genre`
--

CREATE TABLE `genre` (
  `genre_id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `genre`
--

INSERT INTO `genre` (`genre_id`, `name`) VALUES
(1, 'Lo-fi'),
(2, 'EDM'),
(3, 'Trap'),
(4, 'Jazz'),
(5, 'Ambient'),
(6, 'Lo-fi'),
(7, 'EDM'),
(8, 'Trap'),
(9, 'Jazz'),
(10, 'Ambient'),
(11, 'Lo-Fi'),
(12, 'Piano'),
(13, 'EDM');

-- --------------------------------------------------------

--
-- テーブルの構造 `like`
--

CREATE TABLE `like` (
  `like_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `track_id` bigint NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `material`
--

CREATE TABLE `material` (
  `material_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `material_genre`
--

CREATE TABLE `material_genre` (
  `material_genre_id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `play_history`
--

CREATE TABLE `play_history` (
  `history_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `track_id` bigint NOT NULL,
  `played_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `track_id` bigint NOT NULL,
  `price_at_buy` decimal(10,2) NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'JPY',
  `payment_status` enum('PENDING','PAID','FAILED','REFUNDED') NOT NULL DEFAULT 'PAID',
  `payment_tx_id` varchar(100) DEFAULT NULL,
  `purchased_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `purchase`
--

INSERT INTO `purchase` (`purchase_id`, `user_id`, `track_id`, `price_at_buy`, `currency`, `payment_status`, `payment_tx_id`, `purchased_at`, `created_at`) VALUES
(1, 1, 1, 300.00, 'JPY', 'PAID', NULL, '2025-10-28 01:39:34', '2025-10-28 01:39:34'),
(2, 1, 3, 450.00, 'JPY', 'PAID', NULL, '2025-10-28 01:39:34', '2025-10-28 01:39:34'),
(3, 2, 2, 200.00, 'JPY', 'PAID', NULL, '2025-10-28 01:39:34', '2025-10-28 01:39:34');

-- --------------------------------------------------------

--
-- テーブルの構造 `tags`
--

CREATE TABLE `tags` (
  `tag_id` bigint NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `track`
--

CREATE TABLE `track` (
  `track_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `genre_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(120) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `track`
--

INSERT INTO `track` (`track_id`, `user_id`, `genre_id`, `title`, `description`, `price`, `created_at`) VALUES
(1, 1, 1, 'Morning Loop', 'Chill beat for studying', 480.00, '2025-10-24 03:05:55'),
(2, 1, 2, 'City Night', 'Upbeat city vibes', 0.00, '2025-10-24 03:05:55'),
(3, 2, 4, 'Blue Coffee', 'Mellow jazz guitar', 350.00, '2025-10-24 03:05:55'),
(4, 2, 5, 'Space Drift', 'Ambient drone pad', 200.00, '2025-10-24 03:05:55'),
(5, 3, 3, '808 Workout', 'Trap drums practice', 250.00, '2025-10-24 03:05:55'),
(6, 1, 1, 'Night Walk', 'lofi beat', 300.00, '2025-10-28 01:39:07'),
(7, 1, 2, 'Morning Keys', 'piano solo', 200.00, '2025-10-28 01:39:07'),
(8, 2, 3, 'Drop Wave', NULL, 450.00, '2025-10-28 01:39:07'),
(9, 3, 1, 'Rain Window', 'chill hops', 250.00, '2025-10-28 01:39:07');

-- --------------------------------------------------------

--
-- テーブルの構造 `track_material`
--

CREATE TABLE `track_material` (
  `track_id` bigint NOT NULL,
  `material_id` bigint NOT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `track_tag`
--

CREATE TABLE `track_tag` (
  `track_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `user`
--

CREATE TABLE `user` (
  `user_id` bigint UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password_hash` char(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password_hash`, `created_at`, `updated_at`) VALUES
(1, 'alice', 'alice@example.com', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '2025-10-24 03:03:10', '2025-10-24 03:03:10'),
(2, 'bob', 'bob@example.com', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '2025-10-24 03:03:10', '2025-10-24 03:03:10'),
(3, 'carol', 'carol@example.com', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '2025-10-24 03:03:10', '2025-10-24 03:03:10'),
(4, 'alice', 'alice@example.com', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '2025-10-24 03:05:55', '2025-10-24 03:05:55'),
(5, 'bob', 'bob@example.com', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '2025-10-24 03:05:55', '2025-10-24 03:05:55'),
(6, 'carol', 'carol@example.com', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '2025-10-24 03:05:55', '2025-10-24 03:05:55'),
(7, 'alice', 'alice@example.com', 'hash1', '2025-10-28 01:38:24', '2025-10-28 01:38:24'),
(8, 'bob', 'bob@example.com', 'hash2', '2025-10-28 01:38:24', '2025-10-28 01:38:24'),
(9, 'charlie', 'charlie@example.com', 'hash3', '2025-10-28 01:38:24', '2025-10-28 01:38:24');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `idx_al_user` (`user_id`,`created_at`),
  ADD KEY `idx_al_track` (`track_id`);

--
-- テーブルのインデックス `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`bookmark_id`),
  ADD KEY `idx_bm_user` (`user_id`,`created_at`),
  ADD KEY `idx_bm_track` (`track_id`);

--
-- テーブルのインデックス `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`user_id`,`track_id`),
  ADD KEY `idx_cart_track` (`track_id`);

--
-- テーブルのインデックス `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `idx_comment_user` (`user_id`),
  ADD KEY `idx_comment_track` (`track_id`),
  ADD KEY `idx_comment_parent` (`parent_comment_id`);

--
-- テーブルのインデックス `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`user_id`,`track_id`);

--
-- テーブルのインデックス `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`follower_id`,`followee_id`),
  ADD KEY `idx_follow_followee` (`followee_id`);

--
-- テーブルのインデックス `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- テーブルのインデックス `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `idx_like_user` (`user_id`,`created_at`),
  ADD KEY `idx_like_track` (`track_id`);

--
-- テーブルのインデックス `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`material_id`);

--
-- テーブルのインデックス `material_genre`
--
ALTER TABLE `material_genre`
  ADD PRIMARY KEY (`material_genre_id`);

--
-- テーブルのインデックス `play_history`
--
ALTER TABLE `play_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `idx_ph_user` (`user_id`,`played_at`),
  ADD KEY `idx_ph_track` (`track_id`,`played_at`);

--
-- テーブルのインデックス `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`);

--
-- テーブルのインデックス `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD UNIQUE KEY `uq_tag_name` (`name`);

--
-- テーブルのインデックス `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`track_id`),
  ADD KEY `fk_track_user` (`user_id`),
  ADD KEY `fk_track_genre` (`genre_id`);

--
-- テーブルのインデックス `track_material`
--
ALTER TABLE `track_material`
  ADD PRIMARY KEY (`track_id`,`material_id`),
  ADD KEY `idx_tm_material` (`material_id`);

--
-- テーブルのインデックス `track_tag`
--
ALTER TABLE `track_tag`
  ADD PRIMARY KEY (`track_id`,`tag_id`),
  ADD KEY `idx_tt_tag` (`tag_id`);

--
-- テーブルのインデックス `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `log_id` bigint NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `bookmark`
--
ALTER TABLE `bookmark`
  MODIFY `bookmark_id` bigint NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- テーブルの AUTO_INCREMENT `like`
--
ALTER TABLE `like`
  MODIFY `like_id` bigint NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `material`
--
ALTER TABLE `material`
  MODIFY `material_id` bigint NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `material_genre`
--
ALTER TABLE `material_genre`
  MODIFY `material_genre_id` bigint NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `play_history`
--
ALTER TABLE `play_history`
  MODIFY `history_id` bigint NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` bigint NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `track`
--
ALTER TABLE `track`
  MODIFY `track_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- テーブルの AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `fk_track_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_track_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `track_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
