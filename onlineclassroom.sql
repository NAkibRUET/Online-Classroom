-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 30, 2020 at 03:23 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `classroom`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer_submit`
--

DROP TABLE IF EXISTS `answer_submit`;
CREATE TABLE IF NOT EXISTS `answer_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `student` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_info`
--

DROP TABLE IF EXISTS `attendance_info`;
CREATE TABLE IF NOT EXISTS `attendance_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(110) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance_info`
--

INSERT INTO `attendance_info` (`id`, `teacher`, `class`, `section`) VALUES
(5, 'boshir@gmail.com', 'Level 4 Term 2', 'A'),
(6, 'boshir@gmail.com', 'Level 2 Term 2', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `daily_attendance`
--

DROP TABLE IF EXISTS `daily_attendance`;
CREATE TABLE IF NOT EXISTS `daily_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a_id` int(11) NOT NULL,
  `data` json NOT NULL,
  `date` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `daily_attendance`
--

INSERT INTO `daily_attendance` (`id`, `a_id`, `data`, `date`) VALUES
(72, 5, '[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0]', '2020-01-18 18:14:50');

-- --------------------------------------------------------

--
-- Table structure for table `exam_questions`
--

DROP TABLE IF EXISTS `exam_questions`;
CREATE TABLE IF NOT EXISTS `exam_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `q_no` int(11) NOT NULL,
  `question` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option3` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option4` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam`
--

DROP TABLE IF EXISTS `online_exam`;
CREATE TABLE IF NOT EXISTS `online_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `date` date NOT NULL,
  `no_of_question` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_result`
--

DROP TABLE IF EXISTS `online_exam_result`;
CREATE TABLE IF NOT EXISTS `online_exam_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `student` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mark` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pm`
--

DROP TABLE IF EXISTS `pm`;
CREATE TABLE IF NOT EXISTS `pm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(9000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qa_comment`
--

DROP TABLE IF EXISTS `qa_comment`;
CREATE TABLE IF NOT EXISTS `qa_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `comment` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commenter` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commenterType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qa_comment`
--

INSERT INTO `qa_comment` (`id`, `post_id`, `comment`, `commenter`, `commenterType`, `time`) VALUES
(5, 17, '<pre>\r\n<code>The Solution is here\r\nspan {\r\n  float: right;\r\n  position: relative;\r\n  bottom:40px;\r\n}</code></pre>\r\n', 'hussain0296@gmail.com', 'student', '2020-01-20 22:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `qa_post`
--

DROP TABLE IF EXISTS `qa_post`;
CREATE TABLE IF NOT EXISTS `qa_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL,
  `vote` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qa_post`
--

INSERT INTO `qa_post` (`id`, `title`, `user`, `userType`, `details`, `time`, `vote`) VALUES
(19, 'why is the filed called \'video_file\' yet you\'re only allowing images.', 'hussain0296@gmail.com', 'student', '<p>why is the filed called &#39;video_file&#39; yet you&#39;re only allowing images.</p>\r\n', '2020-01-22 19:09:56', 0),
(17, 'CSS background image to fit width, height should auto-scale in proportion', 'boshir@gmail.com', 'teacher', '<p>I have</p>\r\n\r\n<pre>\r\n<code>body {\r\n    background: url(images/background.svg);\r\n}</code></pre>\r\n\r\n<p>The desired effect is that this background image will have width equal to that of the page, height changing to maintain the proportion. e.g. if the original image happens to be 100*200 (any units) and the body is 600px wide, the background image should end up being 1200px high. The height should change automatically if the window is resized. Is this possible?</p>\r\n\r\n<p>At the moment, Firefox looks like it&#39;s making the height fit and then adjusting the width. Is this perhaps because the height is the longest dimension and it&#39;s trying to avoid cropping? I&nbsp;<em>want</em>&nbsp;to crop vertically, then scroll: no horizontal repeat.</p>\r\n\r\n<p>Also, Chrome is placing the image in the centre, no repeat, even when&nbsp;<code>background-repeat:repeat</code>&nbsp;is given explicitly, which is the default anyway.</p>\r\n', '2020-01-20 21:03:18', 3),
(16, 'How do I give text or an image a transparent background using CSS?', 'hussain0296@gmail.com', 'student', '<p>Is it possible, using CSS only, to make the&nbsp;<code>background</code>&nbsp;of an element semi-transparent but have the content (text &amp; images) of the element opaque?</p>\r\n\r\n<p>I&#39;d like to accomplish this without having the text and the background as two separate elements.</p>\r\n\r\n<p>When trying:</p>\r\n\r\n<pre>\r\n<code>p {\r\n  position: absolute;\r\n  background-color: green;\r\n  filter: alpha(opacity=60);\r\n  opacity: 0.6;\r\n}\r\n\r\nspan {\r\n  color: white;\r\n  filter: alpha(opacity=100);\r\n  opacity: 1;\r\n}</code></pre>\r\n\r\n<pre>\r\n<code>&lt;p&gt;\r\n  &lt;span&gt;Hello world&lt;/span&gt;\r\n&lt;/p&gt;</code></pre>\r\n', '2020-01-20 21:01:24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_vote`
--

DROP TABLE IF EXISTS `qa_vote`;
CREATE TABLE IF NOT EXISTS `qa_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`id`, `title`, `description`, `type`, `url`, `filename`, `user`, `userType`) VALUES
(8, 'hy is the filed called video_file yet youre only allowing images', '', 'PPT', '', 'attendanceTeacherView.png', 'hussain0296@gmail.com', 'student'),
(7, 'Check file extension in upload form in PHP', 'I check the file extension for upload or not uploaded. My example methods worked, but now I need to understand if my methods (using pathinfo) is true. Is there another better and faster way?', 'PDF', '', 'Tahsin-Masrur-Cover-Letter.pdf', 'hussain0296@gmail.com', 'student'),
(9, 'why is the filed called \'video_file\' yet you\'re only allowing images.', 'why is the filed called \'video_file\' yet you\'re only allowing images.', 'CSV', '', 'data.csv', 'hussain0296@gmail.com', 'student'),
(10, 'Flow chart of selection sort', 'Flow chart of selection sort Flow chart of selection sort Flow chart of selection sort', 'Image', '', 'attendanceTeacherView2.png', 'nakib143048@gmail.com', 'student'),
(11, 'Introduction To OOP PHP | Object Oriented PHP Tutorial For Beginners | PHP Tutorial |', 'Hi everyone! Welcome to my Object Oriented PHP tutorial course here on YouTube. In this course you will take your next step into PHP and learn how to create classes, objects, methods, etc. To help you become an expert in OOP PHP.\r\n\r\nLearn Procedural PHP here: https://www.youtube.com/watch?v=qVU3V...\r\n', 'Youtube Video', 'Anz0ArcQ5kI', '', 'boshir@gmail.com', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `resource_comment`
--

DROP TABLE IF EXISTS `resource_comment`;
CREATE TABLE IF NOT EXISTS `resource_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `comment` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commenter` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commenterType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_comment`
--

INSERT INTO `resource_comment` (`id`, `post_id`, `comment`, `commenter`, `commenterType`, `time`) VALUES
(6, 9, '<p>Very Useful Resource</p>\r\n', 'hussain0296@gmail.com', 'student', '2020-01-22 19:23:45'),
(7, 10, '<p>Nice Post</p>\r\n', 'nakib143048@gmail.com', 'student', '2020-01-22 19:33:03'),
(8, 11, '<h2><strong>This was very useful video to learn about object oriented php</strong></h2>\r\n', 'hussain0296@gmail.com', 'student', '2020-01-22 19:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `resource_vote`
--

DROP TABLE IF EXISTS `resource_vote`;
CREATE TABLE IF NOT EXISTS `resource_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_register`
--

DROP TABLE IF EXISTS `student_register`;
CREATE TABLE IF NOT EXISTS `student_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roll` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_register`
--

INSERT INTO `student_register` (`id`, `email`, `name`, `roll`, `class`, `section`, `password`) VALUES
(1, 'hussain0296@gmail.com', 'Ali Hussain', '68', 'Level 4 Term 2', 'A', '123'),
(4, 'nakib143048@gmail.com', 'Nakib Hossain', '48', 'Level 4 Term 2', 'A', '123');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE IF NOT EXISTS `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `teacher` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `title`, `details`, `class`, `filename`, `date`, `time`, `teacher`, `publish`) VALUES
(6, 'Flow chart of selection sort', 'Flow chart of selection sort', 'Level 1 Term 2', 'fouradja.m', '2020-12-12', '12:13:00', 'boshir@gmail.com', '1'),
(7, 'why is the filed called \'video_file\' yet you\'re only allowing images.', '', 'Level 4 Term 2', 'madja.m', '2020-10-10', '10:20:00', 'boshir@gmail.com', '1'),
(8, 'Assignment on Virus', 'Find out details about the viruses mentioned in the file', 'Level 4 Term 2', 'NEIGH_CONN.pdf', '2020-02-20', '23:59:00', 'boshir@gmail.com', '1'),
(9, 'PHP get timestamp from separate date and time\r\n', '', 'Level 4 Term 2', '[HorribleSubs] Ace of Diamond Act II - 38 [480p].mkv[www.torrentbd.net].torrent', '2012-12-12', '01:21:00', 'boshir@gmail.com', '0');

-- --------------------------------------------------------

--
-- Table structure for table `task_submit`
--

DROP TABLE IF EXISTS `task_submit`;
CREATE TABLE IF NOT EXISTS `task_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `student` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mark` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_submit`
--

INSERT INTO `task_submit` (`id`, `task_id`, `student`, `file_name`, `mark`) VALUES
(3, 7, 'hussain0296@gmail.com', '[TorrentBD]Aiseesoft PDF to Word Converter 3.2.32 Multilingual + Reg.torrent', '10'),
(5, 7, 'nakib143048@gmail.com', '.picasa.ini', '15'),
(6, 8, 'nakib143048@gmail.com', 'BS 23 Viva.png', '10');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_register`
--

DROP TABLE IF EXISTS `teacher_register`;
CREATE TABLE IF NOT EXISTS `teacher_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_register`
--

INSERT INTO `teacher_register` (`id`, `name`, `email`, `designation`, `password`) VALUES
(1, 'Boshir Ahmed', 'boshir@gmail.com', 'Professor', '123'),
(2, 'Adil Ali', 'adil@adil.com', 'Lecturer', '123'),
(3, 'Rizoan Toufiq', 'rt@gmail.com', 'Lecturer', '123'),
(4, 'Asif Hossain', 'asif@gmail.com', 'Lecturer', '123');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
