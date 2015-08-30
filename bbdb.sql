-- phpMyAdmin SQL Dump
-- version 4.0.3
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 08 月 29 日 18:17
-- 服务器版本: 5.5.42
-- PHP 版本: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `bbdb`
--
CREATE DATABASE IF NOT EXISTS `bbdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bbdb`;

-- --------------------------------------------------------

--
-- 表的结构 `highlight`
--

CREATE TABLE IF NOT EXISTS `highlight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `email` text NOT NULL,
  `context` text NOT NULL,
  `qdate` datetime NOT NULL,
  `pageid` tinytext CHARACTER SET ascii NOT NULL,
  `keyword` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=105 ;

--
-- 转存表中的数据 `highlight`
--

INSERT INTO `highlight` (`id`, `uid`, `name`, `email`, `context`, `qdate`, `pageid`, `keyword`) VALUES
(1, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-03 22:25:46', '12', 'test'),
(2, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-03 22:25:48', '12', 'test'),
(3, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-03 22:25:49', '12', 'test'),
(4, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-03 22:41:49', '12', 'test'),
(5, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-03 22:41:51', '12', 'test'),
(6, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-06 22:02:32', '12', 'test'),
(7, 1234, 'lichuan', '', 'asdf', '2015-04-18 21:12:05', '13', 'bes the ideology, or set '),
(8, 1234, 'lichuan', '', '<p>asfasdfasdfasd</p>', '2015-04-18 21:17:33', '13', ' help you before you sta'),
(9, 1234, 'lichuan', '', '<p>asfd</p>', '2015-04-18 21:23:25', '13', 'has a quite different meaning. It is a word that describes the ideol'),
(10, 1234, 'lichuan', '', '<p><br data-mce-bogus="1"></p>', '2015-04-18 21:24:32', '13', 'eductionism refers to a method used in science and in nutritional science '),
(11, 1234, 'lichuan', '', '<p><br data-mce-bogus="1"></p>', '2015-04-18 21:25:12', '13', 'efers to a method used in scienc'),
(12, 1234, 'lichuan', '', '<p><br data-mce-bogus="1"></p>', '2015-04-18 21:25:42', '13', 'ething. The problem com'),
(13, 1234, 'lichuan', '', '<p><br data-mce-bogus="1"></p>', '2015-04-18 21:26:06', '13', 'n is critiquing t'),
(14, 1234, 'lichuan', '', '<p>asdfasdfasdfasdf</p>', '2015-04-18 21:26:08', '13', 'n is critiquing t'),
(15, 1234, 'lichuan', '', '<p>asdfasdfasdfasdf</p>', '2015-04-18 21:26:15', '13', 'n is critiquing t'),
(16, 1234, 'lichuan', '', '<p>asdf</p>', '2015-04-18 21:27:14', '13', 'ollan is critiquing this'),
(17, 1234, 'lichuan', '', '<p>hgkhjkhkj</p>', '2015-04-18 22:07:13', '13', 's showing us the his'),
(18, 1234, 'lichuan', '', '<p>what is it?<br></p>', '2015-04-18 22:07:39', '13', 'As you read through your text to understand these two terms be aware that you may have to read some sections more than once to fully understand them.'),
(19, 1234, 'lichuan', '', '<p>afasdf</p>', '2015-04-19 14:11:56', '13', 'ionism and'),
(20, 1234, 'lichuan', '', '<p>afasdfaasdf</p>', '2015-04-19 14:12:05', '13', 'he ideology'),
(21, 1234, 'lichuan', '', '<p>erwerwer</p>', '2015-04-19 14:13:29', '13', 's the ideology, or set of beliefs about food, that has become th'),
(22, 1234, 'lichuan', '', '<p>fasfd</p>', '2015-04-19 18:47:51', '13', 'ite different meaning. It is a word that describes the ideology, o'),
(23, 1234, 'lichuan', '', '<p>sdfasasd</p>', '2015-04-19 18:51:50', '13', ' like the word nutrition but it has a quite different meaning. It i'),
(24, 1234, 'lichuan', '', '<p>aasdf</p>', '2015-04-19 18:53:01', '13', 'llan is critiquing '),
(25, 1234, 'lichuan', '', '<p>aasdfadfa</p>', '2015-04-19 18:53:10', '13', 'It involves i'),
(26, 1234, 'lichuan', '', '<p>asdffff</p>', '2015-04-19 18:53:57', '13', 'a quite di'),
(27, 1234, 'lichuan', '', '<p>wasfa asdfasd asdfasd&nbsp;</p>', '2015-04-19 18:55:12', '13', 'ideology'),
(28, 1234, 'lichuan', '', '<p>What is it?</p>', '2015-04-19 19:16:31', '13', 'ad through your text to understand these two terms be aware that you may have to read some sections more than once to fully understand them. It is not just the words that are new, but the underlying ideas as well. Pollan is showing us the historical devel'),
(29, 1234, 'lichuan', '', '<p>fsdf</p>', '2015-04-19 19:26:08', '13', 're you '),
(30, 1212, 'wnlc0002', '', '<p>asdfasdfasdf</p>', '2015-04-19 20:07:51', '13', 'deolog'),
(31, 1212, '1234', '', '<p>dsfsdf</p>', '2015-04-20 19:20:32', '13', 'ideas in our culture. Pollan is critiquing this set of ideas.\n\nThe term '),
(32, 1212, '1234', '', '<p>sfasdf</p>', '2015-04-20 19:31:57', '13', 'showing '),
(33, 1212, '1234', '', '<p>cfdg</p>', '2015-04-20 19:34:40', '13', 'fully understand them. It is not just the words that are new, but the underlying ideas as well. Pollan is showing us the historical development of a way of thinking'),
(34, 1212, '1234', '', '<p>safd</p>', '2015-04-20 20:24:33', '13', 'problems for all of us. It was invente'),
(35, 1212, '1234', '', '<p>uiyui</p>', '2015-04-20 20:43:36', '13', 'Source: from Â© istockphoto.com/ Stolk'),
(36, 1212, '1234', '', '<p>iuoui</p>', '2015-04-20 20:44:02', '13', 'The whole is more than the sum of its parts.\n\nWhile he is critical of reductionist foo'),
(37, 1212, '1234', '', '<p>tret</p>', '2015-04-20 20:45:07', '13', 'ideas.\n\nThe term scientific reductionism refers to a method used in science and in nutrition'),
(38, 1212, '1234', '', '<p>ghfg</p>', '2015-04-20 20:47:53', '13', 'ng engine. However, Pollan is arguing that biological systems (foods!) are exponentially more complex than simpler '),
(39, 1212, 'wnlc0002', '', '<p>asdfasdf</p>', '2015-04-20 21:35:00', '13', 'ology, or set'),
(40, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 21:36:48', '12', 'test'),
(41, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 21:46:28', '12', 'test'),
(42, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 21:49:11', '12', 'test'),
(43, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 21:50:09', '12', 'test'),
(44, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 21:51:00', '12', 'test'),
(45, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 21:52:34', '12', 'test'),
(46, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 21:54:37', '12', 'test'),
(47, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 21:55:39', '12', 'test'),
(48, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 21:56:24', '12', 'test'),
(49, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 21:58:40', '12', 'test'),
(50, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 21:59:32', '12', 'test'),
(51, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:01:41', '12', 'test'),
(52, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:04:00', '12', 'test'),
(53, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:06:23', '12', 'test'),
(54, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:06:32', '12', 'test'),
(55, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:06:48', '12', 'test'),
(56, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:08:59', '12', 'test'),
(57, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:09:02', '12', 'test'),
(58, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:09:29', '12', 'test'),
(59, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:11:49', '12', 'test'),
(60, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:11:54', '12', 'test'),
(61, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:13:03', '12', 'test'),
(62, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:13:40', '12', 'test'),
(63, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:14:02', '12', 'test'),
(64, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:14:12', '12', 'test'),
(65, 1234, 'mailart', '', 'someonehaveidea?', '2015-04-20 22:17:40', '12', 'test'),
(66, 1212, 'wnlc0002', '', '<p>assdf</p>', '2015-04-20 22:22:30', '13', 'word '),
(67, 1212, 'wnlc0002', '', '<p>asdfasdf</p>', '2015-04-20 22:26:39', '13', 'nce and in nutritional science specifically. It involves iso'),
(68, 1212, 'wnlc0002', '', '<p>asdfasdf</p>', '2015-04-20 22:28:30', '13', 'n it is assumed that that by adding those parts together you will get'),
(69, 1212, 'wnlc0002', '', '<p>what is it</p>', '2015-04-20 22:36:24', '18', 'term scientific reductionism'),
(70, 1212, 'wnlc0002', '', '<p>test</p>', '2015-04-21 11:07:16', '18', 'or set of belief'),
(71, 1212, 'wnlc0002', '', '<p>Ask test...</p>', '2015-04-21 11:17:42', '18', 'While he is critical of reductionist food science, Pollan is not giving up on science. He is saying we need a different kind of science, one that looks not just at parts but also at whole foods, in whole cultures.'),
(72, 1212, 'wnlc0002', '', '<p>For example, question content..............</p>', '2015-04-21 11:41:38', '18', 'Pollan is critiquing this set of ideas.'),
(73, 1212, 'wnlc0002', '', '<p>test</p>', '2015-04-21 15:13:40', '18', 't involves isolating and analyzing parts of something. '),
(74, 1212, 'wnlc0002', '', '<p><br data-mce-bogus="1"></p>', '2015-04-21 15:13:43', '18', 't involves isolating and analyzing parts of something. '),
(75, 1212, 'wnlc0002', '', '<p>asd</p>', '2015-04-21 15:15:36', '18', 'n our culture. Pollan is c'),
(76, 1212, 'wnlc0002', '', '<p>test</p>', '2015-04-21 15:27:16', '18', 'y be less of a problem in simpler '),
(77, 1212, 'wnlc0002', '', '<p>kjji joi joi</p>', '2015-04-21 19:07:11', '18', ' in science and in nutritional science specifically. It involves isolating and analyzing parts of something. The'),
(78, 1212, 'wnlc0002', '', '<p>Why???</p>', '2015-04-21 23:31:53', '18', 'It involves isolating and analyzing parts of something. '),
(79, 1212, 'wnlc0002', '', '<p>test test</p>', '2015-04-22 10:11:22', '18', 'As you read through your text to understand these two terms be aware that you may have to read some sections more than once to fully understand them.'),
(80, 1212, 'wnlc0002', '', '<p>ask<br data-mce-bogus="1"></p>', '2015-04-22 14:12:23', '18', 'While he is critical of reductionist food science, Pollan is not giving up on science. '),
(81, 1212, 'wnlc0002', '', '<p>why</p>', '2015-04-22 14:48:26', '18', 'Pollan is showing us the historical development of a way of thinking about food that is deeply flawed and has led to serious problems for all of us.'),
(82, 1212, 'wnlc0002', '', '<p>gtttt</p>', '2015-04-22 14:59:33', '18', 'While he is critical of reductionist food science, Pollan is not giving up on science. He is saying we need a different kind of scien'),
(83, 1212, 'wnlc0002', '', '<p>jijoij</p>', '2015-05-07 11:08:36', '18', 'ext to understand these two terms be aware that you may have to read some sections more than once to fully understand them. It is not just the words that are new, but the underlying ideas as well. Pollan is showing us the histori'),
(84, 1212, 'wnlc0002', '', '<p>jhkhkbkjhk</p>', '2015-05-07 11:23:19', '18', 'an is showing us the historical development of a way of thinking about food that is deeply flawed and has led to serious proble'),
(85, 1212, 'wnlc0002', '', '<p>jmjoinoijoi</p>', '2015-05-07 11:43:01', '18', 'As you read through your text to understand these two terms be aware that you may have to read some sections more than once to fully understand them. It is not just the words that are new, but the underlying ideas as well. '),
(86, 1212, 'wnlc0002', '', '<p>George</p>', '2015-05-08 09:32:26', '18', 'As you read through your text to understand these two terms be aware that you may have to read some sections more than once to fully understand them. It is not just the words that are new, but the underlying ideas as well.'),
(87, 1212, 'wnlc0002', '', '<p>etcrwrr<br data-mce-bogus="1"></p>', '2015-05-19 00:09:55', '29', ' question on this topic you will need to explain why Michael Pollan might see Soylent as the ultimate in the nutritionist/red'),
(88, 1212, 'wnlc0002', '', '<p>fweewrwq</p>', '2015-05-19 09:53:02', '29', 'Awareness has been growing about the problems with our food and to some extent individual consumers are able to shape what happens by their personal decisions about where to spend their food dollars.'),
(89, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>asdfa</p>', '2015-07-27 21:17:02', '30', ' of the huge arc of plant and animal material that we actually could digest and get nourishment from each culture chooses a '),
(90, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>asdf</p>', '2015-07-27 21:47:33', 'soci-01', 'ms that it â€œco'),
(91, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>asf</p>', '2015-07-27 22:12:35', 'soci238-01-02', ' wanted me t'),
(92, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>sfdweq</p>', '2015-07-27 22:13:35', 'soci238-01-02', 'ewhere. The underlying attitude was that food was just not that important â€“ other things took priority. However, within a short time of me returning home, guess what would happen? Someone would complain'),
(93, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>ask test</p>', '2015-07-28 10:11:19', 'soci238-01-02', 'The response would usually be â€œanythingâ€'),
(94, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>sfaa</p>', '2015-07-28 10:45:23', 'soci238-02-04', 'ts are of two kinds. There are saturated fats (such as butter or the fat on meat) that come from animals. There are unsaturated fats (such as sunflower oil, olive oil) that come from vegetables. Saturated fats are solid at room temperature, while unsatura'),
(95, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>test</p>', '2015-07-28 10:55:22', 'soci238-04-05', 'Forks over Knives â€“ an excellent feature documentary on the evidence for health benefits from a plan-based diet. It is available through the Humber Library.'),
(96, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>sfa</p>', '2015-07-28 11:09:30', 'soci238-07-05', 'ffers two key explanations for why this has happened and he uses two different strands of sociological theory, the Marxist and the social constructionist. A simplified version of Marxist theor'),
(97, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>fasdas</p>', '2015-07-28 11:12:48', 'soci238-08-05', 'ge denial has been widespread in the privileged Northern countries where the impacts are not yet being felt as strongly as in the Global South. At one level most of us know that something big is going on, but we go about our daily lives pretty much as alw'),
(98, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>sfda</p>', '2015-07-28 11:16:42', 'soci238-09-02', 'What is your reaction to Soylent?'),
(99, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p style="text-align: center;" data-mce-style="text-align: center;"><a href="http://www.google.com" data-mce-href="http://www.google.com">sfasd</a></p>', '2015-07-28 11:17:49', 'soci238-09-05', 'med Birke Baehr made my favourite speech on the topic of food. We will give him the final word. Watch the video and then respond in your fina'),
(100, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>test stest<br data-mce-bogus="1"></p>', '2015-07-28 11:28:32', 'soci238-02-03', 't food science, Pollan is not giving up on science. He is saying we need a different kind of science, one that looks not just at parts but also at whole foods, in whole cultures. Food is a lot more complicated than conventional nutritio'),
(101, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>test</p>', '2015-07-28 11:30:07', 'soci238-07-03', 'Be sure to read Michael Mossâ€™ article The Extraordinary Science of Junk Food'),
(102, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>i dont understand</p>', '2015-07-28 11:50:54', 'soci238-09-04', 'ional meat may become too environmentally costly in the near future, there are researchers who have been working on prototypes for test tube meat. This works off the idea that you can multiply muscle ti'),
(103, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>joj ijoi</p>', '2015-07-28 13:04:42', 'soci238-02-03', 'ods!) are exponentially more complex than simpler mechanical ones. Foods have complex biochemistries with the whole being much more compli'),
(104, 1212, 'wnlc0002', 'lichuan.wen1189@gmail.com', '<p>jjjj</p>', '2015-07-28 14:16:29', 'soci238-01-03', 'l worlds are being continually made, constructed by the interpretive work that we do, but arenâ€™t aw');

-- --------------------------------------------------------

--
-- 表的结构 `reply`
--

CREATE TABLE IF NOT EXISTS `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `name` text NOT NULL,
  `tid` int(11) NOT NULL,
  `context` text NOT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=77 ;

--
-- 转存表中的数据 `reply`
--

INSERT INTO `reply` (`id`, `uid`, `name`, `tid`, `context`, `rdate`) VALUES
(1, 1234, 'professor', 21, 'someonehaveidea?', '2015-04-03 22:38:55'),
(2, 1234, 'Lichuan', 21, 'someonehaveidea?', '2015-04-03 22:38:57'),
(3, 1234, 'professor', 21, 'someonehaveidea?', '2015-04-03 22:38:58'),
(4, 1234, 'mailart', 12, 'someonehaveidea?', '2015-04-19 18:06:59'),
(5, 1234, 'mailart', 12, 'someonehaveidea?', '2015-04-19 18:07:00'),
(6, 1212, 'lichuan', 21, '<p>fasdf</p>', '2015-04-19 18:09:32'),
(7, 1212, 'lichuan', 21, '<p>This is a test</p><p><br data-mce-bogus="1"></p>', '2015-04-19 18:09:53'),
(8, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(9, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(10, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(11, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(12, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(13, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(14, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(15, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(16, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(17, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(18, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(19, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(20, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(21, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(22, 1212, 'lichuan', 7, '<p>asdfasdfasdf</p>', '2015-04-19 18:10:16'),
(23, 1212, 'lichuan', 8, '<p>ffff</p>', '2015-04-19 18:10:36'),
(24, 1212, 'lichuan', 8, '<p>ffff</p>', '2015-04-19 18:10:36'),
(25, 1212, 'lichuan', 8, '<p>ffff</p>', '2015-04-19 18:10:36'),
(26, 1212, 'lichuan', 8, '<p>ffff</p>', '2015-04-19 18:10:36'),
(27, 1212, 'lichuan', 8, '<p>ffff</p>', '2015-04-19 18:10:36'),
(28, 1212, 'lichuan', 8, '<p>ffff</p>', '2015-04-19 18:10:36'),
(29, 1212, 'lichuan', 8, '<p>ffff</p>', '2015-04-19 18:10:36'),
(30, 1212, 'lichuan', 8, '<p>ffff</p>', '2015-04-19 18:10:36'),
(31, 1212, 'lichuan', 8, '<p>ffff</p>', '2015-04-19 18:10:36'),
(32, 1212, 'lichuan', 8, '<p>ffff</p>', '2015-04-19 18:10:36'),
(33, 1212, 'lichuan', 8, '<p>ffff</p>', '2015-04-19 18:10:36'),
(34, 1212, 'lichuan', 8, '<p>ffff</p>', '2015-04-19 18:10:36'),
(35, 1212, 'lichuan', 8, '<p>ffff</p>', '2015-04-19 18:10:36'),
(36, 1212, 'lichuan', 8, '<p>ffff</p>', '2015-04-19 18:10:36'),
(37, 1212, 'lichuan', 9, '<p>fasdfasfd</p>', '2015-04-19 18:13:42'),
(38, 1212, 'lichuan', 10, '<p>fffffffddddd</p>', '2015-04-19 18:13:52'),
(39, 1212, 'lichuan', 15, '<p>fffa</p>', '2015-04-19 18:14:04'),
(40, 1212, 'lichuan', 15, '<p>asdfasf</p>', '2015-04-19 18:14:07'),
(41, 1212, 'lichuan', 10, '<p>ttttt</p>', '2015-04-19 18:16:18'),
(42, 1212, 'lichuan', 17, '<p><br data-mce-bogus="1"></p>', '2015-04-19 18:18:05'),
(43, 1212, 'lichuan', 16, '<p><br data-mce-bogus="1"></p>', '2015-04-19 18:20:44'),
(44, 1212, 'lichuan', 21, '<p>ffffff</p>', '2015-04-19 18:22:05'),
(45, 1212, 'lichuan', 21, '<p><br data-mce-bogus="1"></p>', '2015-04-19 18:30:26'),
(46, 1212, 'lichuan', 7, '<p><br data-mce-bogus="1"></p>', '2015-04-19 18:33:32'),
(47, 1212, 'lichuan', 21, '<p>fffeerwewasdfasdf</p>', '2015-04-19 18:35:09'),
(48, 1212, 'lichuan', 21, '<p>asdfasdf</p>', '2015-04-19 18:39:23'),
(49, 1212, 'lichuan', 21, '<p>adf</p>', '2015-04-19 18:45:23'),
(50, 1212, 'lichuan', 21, '<p>adf</p>', '2015-04-19 18:45:23'),
(51, 1212, 'lichuan', 22, '<p>fasdf</p>', '2015-04-19 18:48:14'),
(52, 1212, 'lichuan', 26, '<p>asdfasdf</p>', '2015-04-19 18:54:03'),
(53, 1212, 'lichuan', 27, '<p>asf</p>', '2015-04-19 18:55:23'),
(54, 1212, 'wnlc0002', 30, '<p>gg</p>', '2015-04-19 20:22:40'),
(55, 1212, 'wnlc0002', 30, '<p>asdasdf</p>', '2015-04-19 20:25:04'),
(56, 1212, 'wnlc0002', 30, '<p>sf</p>', '2015-04-19 20:28:46'),
(57, 1212, 'wnlc0002', 38, '<p>ldsfjsajfoiajsf</p>', '2015-04-20 21:15:40'),
(58, 1212, 'wnlc0002', 12, '<p>45retg</p>', '2015-04-20 21:15:52'),
(59, 1212, 'wnlc0002', 12, '<p>dfgsdg</p>', '2015-04-20 21:16:02'),
(60, 1234, 'mailart', 12, 'someonehaveidea?', '2015-04-20 21:47:41'),
(61, 1212, 'wnlc0002', 39, '<p>asdsaf</p>', '2015-04-20 22:21:26'),
(62, 1212, 'wnlc0002', 66, '<p>dafasdf</p>', '2015-04-20 22:22:59'),
(63, 1234, 'mailart', 12, 'someonehaveidea?', '2015-04-20 22:23:30'),
(64, 1234, 'mailart', 12, 'someonehaveidea?', '2015-04-20 22:23:34'),
(65, 1234, 'mailart', 12, 'someonehaveidea?', '2015-04-20 22:24:18'),
(66, 1234, 'mailart', 12, 'someonehaveidea?', '2015-04-20 22:25:01'),
(67, 1212, 'wnlc0002', 72, '<p>reply content................</p>', '2015-04-21 11:42:00'),
(68, 1212, 'wnlc0002', 73, '<p>asdf</p>', '2015-04-21 15:15:25'),
(69, 1212, 'wnlc0002', 74, '<p>joi joi&nbsp;</p>', '2015-04-21 15:15:38'),
(70, 1212, 'wnlc0002', 76, '<p>test</p>', '2015-04-21 15:27:23'),
(71, 1212, 'wnlc0002', 79, '<p>test</p>', '2015-04-22 14:51:43'),
(72, 1212, 'wnlc0002', 82, '<p>ijoijo ij</p>', '2015-04-22 15:00:01'),
(73, 1212, 'wnlc0002', 86, '<p>iunoijoijoi</p>', '2015-05-08 09:34:30'),
(74, 1212, 'wnlc0002', 87, '<p>sfaweqfwq</p>', '2015-05-19 09:53:10'),
(75, 1212, 'wnlc0002', 89, '<p>asdfasdfasdfasdf</p>', '2015-07-27 21:18:21'),
(76, 1212, 'wnlc0002', 104, '<p>kjil</p>', '2015-07-28 14:20:13');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
