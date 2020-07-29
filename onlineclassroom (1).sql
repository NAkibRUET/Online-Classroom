-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 29, 2020 at 08:44 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineclassroom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `Name` varchar(110) NOT NULL,
  `email` varchar(110) NOT NULL,
  `password` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `Name`, `email`, `password`) VALUES
(1, 'Admin', 'admin@admin.com', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `answer_submit`
--

CREATE TABLE `answer_submit` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `student` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_info`
--

CREATE TABLE `attendance_info` (
  `id` int(11) NOT NULL,
  `teacher` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(110) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_attendance`
--

CREATE TABLE `daily_attendance` (
  `id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_questions`
--

CREATE TABLE `exam_questions` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q_no` int(11) NOT NULL,
  `question` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option3` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option4` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `teacher` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `details` varchar(9000) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `teacher`, `title`, `details`, `timestamp`) VALUES
(3, 'boshir@gmail.com', '5 including inspector injured from explosion at Pallabi Police Station', '<p><strong>Four police personnel and a staff of Pallabi Police Station were injured after a &#39;weight machine&#39; that they seized during a drive exploded inside the police station this morning, police said.</strong></p>\r\n\r\n<p>The injured are: Inspector (Operations) Imranul Islam (48), Sub-Inspectors Sajib Khan (30), Angkush Kumar (28) and Rumi Tabres Haider (28) and a police station staffer Mohammad Riaj (28).</p>\r\n\r\n<p>They were rushed to different hospitals in the capital. Riaj&#39;s condition is critical, said Walid Hossain, deputy commissioner (media) of Dhaka Metropolitan Police.&nbsp;</p>\r\n\r\n<p>According to the DC, a team of Pallabi Police Station yesterday arrested three criminals along with firearms and some other things including the weight machine.</p>\r\n\r\n<p>The machine was kept in the duty officer&#39;s room which exploded around 6:00am, said DC Walid.</p>\r\n', '2020-07-29 07:33:20'),
(4, 'boshir@gmail.com', ' ভয় আর মামলাতে আটকে গেছে শিক্ষার্থীদের জীবন', '<p>দুই বছর আগে নিরাপদ সড়ক দাবির আন্দোলনে অন্যদের সঙ্গে অংশ নেন ঢাকা পলিটেকনিক ইনস্টিটিউটের শিক্ষার্থী তারিক আজিজ।&nbsp;</p>\r\n\r\n<p>আন্দোলন শেষ হওয়ার এক মাস পর ২০১৮ সালের সেপ্টেম্বরে টঙ্গীর বাসা থেকে তাঁকে গ্রেপ্তার করে ঢাকা মহানগর গোয়েন্দা পুলিশ (ডিবি)। এরপর জানতে পারেন, রাজধানীর বিভিন্ন থানায় তাঁর নামে নয়টি মামলা হয়েছে। গ্রেপ্তারের ১০ মাস পর জেল থেকে জামিনে ছাড়া পান তিনি।</p>\r\n\r\n<p>জেল থেকে আপাতত মুক্তি পেলেও ভোগান্তির শেষ হয়নি তারিকের। মামলার কারণে প্রতি মাসে নিয়মিত আদালতে হাজিরা দিতে হচ্ছে তাঁকে। গত সোমবার মুঠোফোনে তিনি&nbsp;<em>প্রথম আলো</em>কে বলেন, কোনো মাসের নয় দিনই চলে গেছে হাজিরা দেওয়ার জন্য আদালতে যাওয়া&ndash;আসা করতে করতে। জেলে থাকার কারণে দুটো সেমিস্টারের ফল খুব খারাপ হয়েছে। মনে হচ্ছে, ভয় আর মামলাতেই আটকে গেছে জীবন।</p>\r\n\r\n<p>২০১৮ সালের ২৯ জুলাই রাজধানীর বিমানবন্দর সড়কে বাসচাপায় শহীদ রমিজ উদ্দিন ক্যান্টনমেন্ট কলেজের দুই শিক্ষার্থী আবদুল করিম (রাজীব) ও দিয়া খানম (মীম) নিহত হওয়ার পর নিরাপদ সড়কের দাবিতে আন্দোলনে নামেন স্কুল&ndash;কলেজ ও বিশ্ববিদ্যালয়ের শিক্ষার্থীরা। ১০ দিন ধরে চলা ওই আন্দোলন ঘিরে শিক্ষার্থীসহ কয়েক শ ব্যক্তির নামে রাজধানীর বিভিন্ন থানায় ৬০টি মামলা হয়। এসব মামলার বেশির ভাগ আসামিই অজ্ঞাতনামা।</p>\r\n\r\n<p>তখন এসব মামলায় গ্রেপ্তার করে ৯৯ জনকে কারাগারে পাঠানো হয়। এঁদের মধ্যে ৫২ জন শিক্ষার্থী। এসব শিক্ষার্থী এখন জামিনে থাকলেও আদালতে হাজিরা দিতে হচ্ছে তাঁদের। তবে গত মার্চ মাস থেকে করোনার কারণে আদালতের নিয়মিত কার্যক্রম বন্ধ থাকায় আপাতত তাঁদের হাজিরা দিতে হচ্ছে না।</p>\r\n\r\n<p>আন্দোলনের মাঝপথে ২০১৮ সালের ৪ আগস্ট রাজধানীর জিগাতলায় ক্ষমতাসীন আওয়ামী লীগের সহযোগী সংগঠন ছাত্রলীগের নেতা&ndash;কর্মীদের নির্মম হামলার শিকার হন শিক্ষার্থীরা। এ ঘটনার প্রতিবাদে পরদিন শাহবাগ থেকে মিছিল নিয়ে শিক্ষার্থীরা ধানমন্ডির দিকে যেতে চাইলে সায়েন্স ল্যাবরেটরি মোড়সহ বিভিন্ন এলাকায় হামলার শিকার হন। সেদিন শিক্ষার্থীদের সঙ্গে পিটিয়ে রক্তাক্ত করা হয় ১২ জন সাংবাদিককেও। হামলাকারীদের অনেকের মুখ হেলমেটে ঢাকা থাকায় তারা হেলমেট বাহিনী নামে পরিচিতি পায়। দুই বছর হয়ে গেলেও হামলাকারীদের কারও বিরুদ্ধে এখন পর্যন্ত মামলা বা অন্য কোনো ব্যবস্থা নেওয়া হয়নি। সরকারের বিভিন্ন পর্যায় থেকে ওই সময়ে হামলাকারীদের গ্রেপ্তার ও বিচারের আশ্বাস দেওয়া হয়। কিছুদিন পর সরকার বিষয়টি &lsquo;ভুলে&rsquo; যায়।</p>\r\n\r\n<p>পুরো ঘটনার বিষয়ে জাতীয় মানবাধিকার কমিশনের চেয়ারম্যান নাসিমা বেগম&nbsp;<em>প্রথম আলো</em>কে বলেন, সবাইকে এভাবে ঝুলিয়ে রাখার তো মানে হয় না। নিরাপদ সড়ক আন্দোলনে অংশ নেওয়া শিক্ষার্থীদের বিরুদ্ধে করা মামলার বিষয়টি যাতে দ্রুত সুরাহা হয়, সেই তাগাদা দিয়ে তিনি শিগগিরই জননিরাপত্তাসচিবকে চিঠি দেবেন।</p>\r\n\r\n<p>জেল খেটে বেরিয়ে আসা নয়জন শিক্ষার্থীর সঙ্গে গত সপ্তাহে কথা বলেছে&nbsp;<em>প্রথম আলো</em>। তাঁরা বলছেন, অধিকাংশ মামলার বাদী পুলিশ। যে কারণে এসব মামলার প্রভাব ব্যক্তিজীবনে বহুমুখী। কেউ কেউ শিক্ষাজীবন শেষ করা নিয়ে অনিশ্চয়তায় রয়েছেন। কোনোভাবে শিক্ষাজীবন শেষ হলেও মামলার কারণে সরকারি চাকরি না পাওয়ার শঙ্কার কথা জানিয়েছেন কেউ কেউ। এ ছাড়া গোয়েন্দা প্রতিবেদনে মামলার তথ্য থাকায় পাসপোর্ট পাওয়া নিয়ে সমস্যায় পড়ার কথাও বলেছেন কয়েকজন। আবার তাঁদের অনেকের জন্য মামলার খরচ চালানো কঠিন হয়ে পড়েছে। তাঁরা বলছেন, যৌক্তিক আন্দোলনে অংশ নেওয়ার পরও এসব মামলা সম্পূর্ণ রাজনৈতিক উদ্দেশ্যে হয়েছে। মামলাগুলো থেকে তাঁরা অব্যাহতি চান।</p>\r\n\r\n<p>শিক্ষার্থীদের বিরুদ্ধে করা এসব মামলার বিষয়ে সরকারের কোনো সিদ্ধান্ত আছে কি না জানতে চাইলে ঢাকা মহানগর পুলিশ কমিশনার মো. শফিকুল ইসলাম&nbsp;<em>প্রথম আলো</em>কে বলেন, &lsquo;মামলাগুলো পেন্ডিং অবস্থায় আছে।&rsquo; নিষ্পত্তি বা প্রত্যাহারের বিষয়ে কোনো উদ্যোগ নেওয়া হবে কি না এমন প্রশ্নের জবাবে তিনি বলেন, &lsquo;আমার একক সিদ্ধান্তে তো নিষ্পত্তি হবে না বুঝতেই পারছেন। সিদ্ধান্ত আরও ওপর থেকে আসতে হবে। এ বিষয়ে এখনো কোনো সিদ্ধান্ত হয়নি।&rsquo;</p>\r\n\r\n<p>পুলিশের করা বিভিন্ন মামলার এজাহারের তথ্য অনুযায়ী, শিক্ষার্থীদের বিরুদ্ধে তখন দুই কারণে মামলা হয়। প্রথমত রাজপথে আন্দোলন করার কারণে। এ ক্ষেত্রে সরকারি কাজে বাধা দেওয়া, ভাঙচুরের অভিযোগ আনা হয় বেসরকারি বিশ্ববিদ্যালয়ের ২২ ছাত্রসহ শত শত শিক্ষার্থীর বিরুদ্ধে। দ্বিতীয়ত হলো সামাজিক যোগাযোগমাধ্যমে নিরাপদ সড়ক আন্দোলনের প্রচার চালানো। এ ছাড়া গুজব ছাড়ানো হয়েছে এমন অভিযোগও করে পুলিশ।</p>\r\n\r\n<p>এমনই একটি মামলায় কারাভোগ করে বেরিয়ে আসা সাউথইস্ট বিশ্ববিদ্যালয়ের শিক্ষার্থী জাহিদুল হক&nbsp;<em>প্রথম আলো</em>কে বলেন, &lsquo;মামলা চলতে থাকায় আর্থিক ও মানসিক সমস্যায় পড়েছেন তাঁরা। এখন পুলিশ দেখলেই ভয় লাগে। মনে হয় এই বুঝি গ্রেপ্তার করতে এল। এ ছাড়া পড়াশোনা প্রায় শেষের দিকে। চাকরির বাজারে কেউ মামলার আসামিকে নেবে কি না, সেটা নিয়েও দুশ্চিন্তা আছে। সব মিলিয়ে যেদিকেই তাকাই, সেদিকেই মামলাটাকে একটা বাধা মনে হচ্ছে।&rsquo;</p>\r\n\r\n<p>আন্দোলনের সময় শিক্ষার্থীদের অনেকের বিরুদ্ধে মামলার অন্যতম কারণ ছিল সামাজিক যোগাযোগমাধ্যমে স্ট্যাটাস দেওয়া ও ভিডিও শেয়ার করা। এ ক্ষেত্রে অভিযোগ আনা হয় ফেসবুক, টুইটার, ফেসবুক পেজ ও গ্রুপ, ইউটিউব, অনলাইন নিউজ পোর্টাল, ব্লগে বিভিন্ন উসকানিমূলক লেখা, পোস্ট, ফটো বা ভিডিওর মাধ্যমে আইনশৃঙ্খলা পরিস্থিতির অবনতি ঘটানোর। অভিযোগ ছিল গুজব ছড়ানোরও।</p>\r\n\r\n<p>তবে দুই বছর পার হয়ে গেলেও এখনো গুজবের উৎসের সন্ধান পায়নি পুলিশ। ডিএমপির সাইবার অপরাধ দমন বিভাগের উপকমিশনার এ এফ এম কিবরিয়া&nbsp;<em>প্রথম আলো</em>কে বলেন, যারা গুজব ছড়িয়েছিল, তাদের অনেককেই শনাক্ত করা হয়েছে। মামলাগুলো এখনো তদন্তাধীন রয়েছে।</p>\r\n\r\n<p>ওই সময় শুধু জিগাতলা, সায়েন্স ল্যাবরেটরি মোড়েই নয়, শিক্ষার্থীদের ওপর হামলা হয় মিরপুরেও। এ ছাড়া ইস্ট ওয়েস্ট বিশ্ববিদ্যালয়ের শিক্ষার্থীরা নিজ ক্যাম্পাসে অবরুদ্ধ অবস্থাতেই হামলার শিকার হন। এসব ঘটনায় ক্ষমতাসীন দলের সহযোগী সংগঠনের নেতা&ndash;কর্মীরা জড়িত। এ ছাড়া নর্থ সাউথ বিশ্ববিদ্যালয় এলাকাতে পুলিশের লাঠিপেটার শিকার হন শিক্ষার্থীরা।</p>\r\n\r\n<p>নিরাপদ সড়কের দাবিতে আন্দোলন করা শিক্ষার্থীদের বিরুদ্ধে হওয়া মামলাগুলোকে আইনের অপপ্রয়োগ ও অপব্যবহার বলে মনে করেন বিশিষ্ট আইনজীবী শাহদীন মালিক। তিনি&nbsp;<em>প্রথম আলো</em>কে বলেন, দু&ndash;একজনের বিরুদ্ধে যদি অকাট্য প্রমাণ পাওয়া যায়, তাহলে তাঁদের মামলাগুলোও দ্রুত নিষ্পত্তি করা উচিত। অন্য মামলাগুলো দীর্ঘায়িত না করে তুলে নেওয়াই বাঞ্ছনীয়। ইদানীং দেখা যাচ্ছে, কোনো ভিত্তি বা স্বল্প ভিত্তি না থাকলেও ফৌজদারি আইনের অপব্যবহার করে প্রতিবাদ মিছিল, আন্দোলন ও বিরুদ্ধ মতকে দমন করা হচ্ছে।</p>\r\n', '2020-07-29 07:39:53');

-- --------------------------------------------------------

--
-- Table structure for table `online_exam`
--

CREATE TABLE `online_exam` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `date` date NOT NULL,
  `no_of_question` int(11) NOT NULL,
  `mark_per_mcq` int(11) NOT NULL,
  `mark_per_sq` int(11) NOT NULL,
  `archived` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_result`
--

CREATE TABLE `online_exam_result` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `student` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mark` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pm`
--

CREATE TABLE `pm` (
  `id` int(11) NOT NULL,
  `sender` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(9000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `seen` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qa_comment`
--

CREATE TABLE `qa_comment` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commenter` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commenterType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qa_post`
--

CREATE TABLE `qa_post` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `vote` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qa_vote`
--

CREATE TABLE `qa_vote` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_comment`
--

CREATE TABLE `resource_comment` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commenter` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commenterType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_vote`
--

CREATE TABLE `resource_vote` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `short_question_mark`
--

CREATE TABLE `short_question_mark` (
  `id` int(11) NOT NULL,
  `student` varchar(100) NOT NULL,
  `question_id` int(11) NOT NULL,
  `mark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `short_question_mark`
--

INSERT INTO `short_question_mark` (`id`, `student`, `question_id`, `mark`) VALUES
(10, 'hussain0296@gmail.com', 82, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_register`
--

CREATE TABLE `student_register` (
  `id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roll` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_register`
--

INSERT INTO `student_register` (`id`, `email`, `name`, `roll`, `class`, `section`, `password`, `approved`) VALUES
(1, 'hussain0296@gmail.com', 'Ali Hussain', '47', 'Level 4 Term 2', 'A', '123', 1),
(4, 'nakib143048@gmail.com', 'Nakib Hossain', '48', 'Level 4 Term 2', 'A', '123', 1),
(7, 'kalam@gmail.com', 'Kalam Khan', '15', 'Level 4 Term 1', 'A', '123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `teacher` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` int(11) NOT NULL,
  `mark` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_submit`
--

CREATE TABLE `task_submit` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `student` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mark` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_register`
--

CREATE TABLE `teacher_register` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_register`
--

INSERT INTO `teacher_register` (`id`, `name`, `email`, `designation`, `password`, `approved`) VALUES
(1, 'Boshir Ahmed', 'boshir@gmail.com', 'Professor', '123', 1),
(2, 'Adil Ali', 'adil@adil.com', 'Lecturer', '123', 1),
(3, 'Rizoan Toufiq', 'rt@gmail.com', 'Lecturer', '123', 0),
(10, 'Abul Khan', 'abul@gmail.com', 'Professor', '123', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `answer_submit`
--
ALTER TABLE `answer_submit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_info`
--
ALTER TABLE `attendance_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily_attendance`
--
ALTER TABLE `daily_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exam`
--
ALTER TABLE `online_exam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exam_result`
--
ALTER TABLE `online_exam_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pm`
--
ALTER TABLE `pm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qa_comment`
--
ALTER TABLE `qa_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qa_post`
--
ALTER TABLE `qa_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qa_vote`
--
ALTER TABLE `qa_vote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource_comment`
--
ALTER TABLE `resource_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource_vote`
--
ALTER TABLE `resource_vote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `short_question_mark`
--
ALTER TABLE `short_question_mark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_register`
--
ALTER TABLE `student_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_submit`
--
ALTER TABLE `task_submit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_register`
--
ALTER TABLE `teacher_register`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `answer_submit`
--
ALTER TABLE `answer_submit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `attendance_info`
--
ALTER TABLE `attendance_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `daily_attendance`
--
ALTER TABLE `daily_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `exam_questions`
--
ALTER TABLE `exam_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `online_exam`
--
ALTER TABLE `online_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `online_exam_result`
--
ALTER TABLE `online_exam_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `pm`
--
ALTER TABLE `pm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `qa_comment`
--
ALTER TABLE `qa_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `qa_post`
--
ALTER TABLE `qa_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `qa_vote`
--
ALTER TABLE `qa_vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `resource_comment`
--
ALTER TABLE `resource_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `resource_vote`
--
ALTER TABLE `resource_vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `short_question_mark`
--
ALTER TABLE `short_question_mark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student_register`
--
ALTER TABLE `student_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `task_submit`
--
ALTER TABLE `task_submit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `teacher_register`
--
ALTER TABLE `teacher_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
