-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018 年 1 月 27 日 07:34
-- サーバのバージョン： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gs_db`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `gs_an_table`
--

CREATE TABLE `gs_an_table` (
  `no` int(4) NOT NULL,
  `id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `regiDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `gs_an_table`
--

INSERT INTO `gs_an_table` (`no`, `id`, `title`, `url`, `comment`, `regiDate`) VALUES
(1, 'dF4KPwAACAAJ', '十角館の殺人', 'http://books.google.com/books/content?id=dF4KPwAACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE71_qb3glM7eO7_kSJnUj9XaRM72XFN9WaMWBdvVwzzfva5m_dWADASL7y737nJZqWaCvGtrVKHtUtLe5m1QstPn-DeKm4pdWl0oNGa1uODvIPBwpUBRr8VjP2d1tXo_0SGXJpOD&source=gbs_api', '十角形の奇妙な館を訪れた大学ミステリ研の七人。彼らを襲う連続殺人の謎。結末に待ち受ける“衝撃の一行”とは?本格ミステリの名作がYA!に登場。', '2018-01-25 20:26:09'),
(2, 'cFOhFTUXzRMC', 'ドラえもん学', 'http://books.google.com/books/content?id=cFOhFTUXzRMC&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE72kaCt2-jM6RvgP79UlUoSEjT5N0xBZCgueWFiVGYg2q25gVRdNEKKG799pD-1vs7MyMcdjQr7ciTgTf91Bc2yK6B9edtO6j5Z_qCjFoAd8y4cY2l9W7hzm7iUi2GFcA0ov4Fqo&source=gbs_api', '詳細なデータに基づき、<wbr>国民的アイドルの誕生秘話と作品の妙味を活字だけで追う意欲作。<wbr>ドラえもんがコミュニケーションの潤滑油に。 【PHP研究所】', '2018-01-25 23:15:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gs_an_table`
--
ALTER TABLE `gs_an_table`
  ADD PRIMARY KEY (`no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gs_an_table`
--
ALTER TABLE `gs_an_table`
  MODIFY `no` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
