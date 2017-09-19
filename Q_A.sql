-- phpMyAdmin SQL Dump
-- version 3.4.7
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 產生日期: 2017 年 08 月 30 日 08:09
-- 伺服器版本: 5.5.17
-- PHP 版本: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 資料庫: `Q&A`
--

-- --------------------------------------------------------

--
-- 表的結構 `All_semester`
--

CREATE TABLE IF NOT EXISTS `All_semester` (
  `Subject_code` char(7) CHARACTER SET utf8 NOT NULL COMMENT '科目代號',
  `Subject_name` char(7) CHARACTER SET utf8 NOT NULL COMMENT '科目名稱',
  PRIMARY KEY (`Subject_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 轉存資料表中的資料 `All_semester`
--

INSERT INTO `All_semester` (`Subject_code`, `Subject_name`) VALUES
('IECS101', '系統程式');

-- --------------------------------------------------------

--
-- 表的結構 `broadcast`
--

CREATE TABLE IF NOT EXISTS `broadcast` (
  `Teacher_ID` char(8) CHARACTER SET utf8 NOT NULL COMMENT '教師帳號',
  `Broad_code` int(3) NOT NULL COMMENT '發布訊息序號',
  `Broad_time` char(12) CHARACTER SET utf8 NOT NULL COMMENT '發布時間',
  `Class_code` int(4) NOT NULL COMMENT '選課代號',
  `Title` char(30) CHARACTER SET utf8 NOT NULL COMMENT '訊息主旨',
  `message` text CHARACTER SET utf8 NOT NULL COMMENT '發布訊息內容',
  PRIMARY KEY (`Teacher_ID`,`Broad_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 轉存資料表中的資料 `broadcast`
--

INSERT INTO `broadcast` (`Teacher_ID`, `Broad_code`, `Broad_time`, `Class_code`, `Title`, `message`) VALUES
('T9428281', 1, '201708231624', 1459, '考試', '考上課範圍');

-- --------------------------------------------------------

--
-- 表的結構 `Chapter`
--

CREATE TABLE IF NOT EXISTS `Chapter` (
  `Chapter_code` char(3) CHARACTER SET utf8 NOT NULL COMMENT '章節代碼',
  `Subject_code` char(7) CHARACTER SET utf8 NOT NULL COMMENT '科目代碼',
  `Chapter_name` char(15) CHARACTER SET utf8 NOT NULL COMMENT '章節名稱',
  PRIMARY KEY (`Chapter_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 轉存資料表中的資料 `Chapter`
--

INSERT INTO `Chapter` (`Chapter_code`, `Subject_code`, `Chapter_name`) VALUES
('001', 'IECS101', 'sorting');

-- --------------------------------------------------------

--
-- 表的結構 `Qestion_amount`
--

CREATE TABLE IF NOT EXISTS `Qestion_amount` (
  `Subject_code` char(7) CHARACTER SET utf8 NOT NULL COMMENT '科目代碼',
  `Chapter_code` char(3) CHARACTER SET utf8 NOT NULL COMMENT '章節代碼',
  `Choice` int(4) NOT NULL COMMENT '單選題',
  `TorF` int(4) NOT NULL COMMENT '是非題',
  `QandA` int(4) NOT NULL COMMENT '問答題',
  PRIMARY KEY (`Subject_code`,`Chapter_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 轉存資料表中的資料 `Qestion_amount`
--

INSERT INTO `Qestion_amount` (`Subject_code`, `Chapter_code`, `Choice`, `TorF`, `QandA`) VALUES
('IECS101', '001', 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的結構 `Question_Choice`
--

CREATE TABLE IF NOT EXISTS `Question_Choice` (
  `Question_number` char(4) CHARACTER SET utf8 NOT NULL COMMENT '題目序號',
  `chapter_code` char(3) CHARACTER SET utf8 NOT NULL COMMENT '章節代號',
  `Question_text` text CHARACTER SET utf8 NOT NULL COMMENT '題目內容',
  `Graph_way` char(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '圖片路徑',
  `Answer1` text CHARACTER SET utf8 NOT NULL COMMENT '答案內容',
  `Answer2` text CHARACTER SET utf8 COMMENT '答案內容',
  `Answer3` text CHARACTER SET utf8 COMMENT '答案內容',
  `Answer4` text CHARACTER SET utf8 COMMENT '答案內容',
  `True_answer` binary(4) NOT NULL COMMENT '正確答案(0/1)',
  PRIMARY KEY (`Question_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 轉存資料表中的資料 `Question_Choice`
--

INSERT INTO `Question_Choice` (`Question_number`, `chapter_code`, `Question_text`, `Graph_way`, `Answer1`, `Answer2`, `Answer3`, `Answer4`, `True_answer`) VALUES
('0001', '001', '蘋果的英文', NULL, '(A)apple', '(B)orange', '(C)pineapple', '(D)kiwi', '\0\0\0\0');

-- --------------------------------------------------------

--
-- 表的結構 `Question_QandA`
--

CREATE TABLE IF NOT EXISTS `Question_QandA` (
  `Question_number` char(4) CHARACTER SET utf8 NOT NULL COMMENT '題目序號',
  `chapter_code` char(3) CHARACTER SET utf8 NOT NULL COMMENT '章節代號',
  `Question_text` text CHARACTER SET utf8 NOT NULL COMMENT '題目內容',
  `Graph_way` char(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '圖片路徑',
  `True_answer` text CHARACTER SET utf8 NOT NULL COMMENT '正確答案',
  PRIMARY KEY (`Question_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 轉存資料表中的資料 `Question_QandA`
--

INSERT INTO `Question_QandA` (`Question_number`, `chapter_code`, `Question_text`, `Graph_way`, `True_answer`) VALUES
('0001', '001', '李德暐除了是笨蛋還是神麼', NULL, '大白癡');

-- --------------------------------------------------------

--
-- 表的結構 `Question_TorF`
--

CREATE TABLE IF NOT EXISTS `Question_TorF` (
  `Question_number` char(4) CHARACTER SET utf8 NOT NULL COMMENT '題目序號',
  `chapter_code` char(3) CHARACTER SET utf8 NOT NULL COMMENT '章節代號',
  `Question_text` text CHARACTER SET utf8 NOT NULL COMMENT '題目內容',
  `Graph_way` char(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '圖片路徑',
  `True_answer` binary(1) NOT NULL COMMENT ' 正確答案(0/1)',
  PRIMARY KEY (`Question_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 轉存資料表中的資料 `Question_TorF`
--

INSERT INTO `Question_TorF` (`Question_number`, `chapter_code`, `Question_text`, `Graph_way`, `True_answer`) VALUES
('0001', '001', '沛瑄是笨蛋嗎', NULL, '1');

-- --------------------------------------------------------

--
-- 表的結構 `Student_list`
--

CREATE TABLE IF NOT EXISTS `Student_list` (
  `Account` char(8) CHARACTER SET utf8 NOT NULL COMMENT '學生帳號',
  `Ssn` char(6) CHARACTER SET utf8 NOT NULL COMMENT '身分證後六碼',
  `Password` char(16) CHARACTER SET utf8 NOT NULL COMMENT '密碼',
  PRIMARY KEY (`Account`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 轉存資料表中的資料 `Student_list`
--

INSERT INTO `Student_list` (`Account`, `Ssn`, `Password`) VALUES
('03360686', '987654', 'ld'),
('03361010', '654321', 'ps'),
('03361026', '123456', 'rt');

-- --------------------------------------------------------

--
-- 表的結構 `Student_study`
--

CREATE TABLE IF NOT EXISTS `Student_study` (
  `Account` char(8) CHARACTER SET utf8 NOT NULL COMMENT '學生帳號',
  `Class_code` int(4) NOT NULL COMMENT '選課代號',
  PRIMARY KEY (`Account`,`Class_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 轉存資料表中的資料 `Student_study`
--

INSERT INTO `Student_study` (`Account`, `Class_code`) VALUES
('03360686', 1459),
('03361010', 1459),
('03361026', 1459);

-- --------------------------------------------------------

--
-- 表的結構 `Subject_list`
--

CREATE TABLE IF NOT EXISTS `Subject_list` (
  `Teacher_ID` char(8) CHARACTER SET utf8 NOT NULL COMMENT ' 教師帳號',
  `Subject_code` char(7) CHARACTER SET utf8 NOT NULL COMMENT '科目代號',
  `Subject_name` char(5) CHARACTER SET utf8 NOT NULL COMMENT '科目名稱',
  PRIMARY KEY (`Teacher_ID`,`Subject_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 轉存資料表中的資料 `Subject_list`
--

INSERT INTO `Subject_list` (`Teacher_ID`, `Subject_code`, `Subject_name`) VALUES
('T9428281', 'IECS101', '計算機概論');

-- --------------------------------------------------------

--
-- 表的結構 `Teacher_list`
--

CREATE TABLE IF NOT EXISTS `Teacher_list` (
  `Account` char(8) CHARACTER SET utf8 NOT NULL COMMENT '教師帳號',
  `Ssn` char(6) CHARACTER SET utf8 NOT NULL COMMENT '身份字號後六碼',
  `Password` char(16) CHARACTER SET utf8 NOT NULL COMMENT '密碼',
  PRIMARY KEY (`Account`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 轉存資料表中的資料 `Teacher_list`
--

INSERT INTO `Teacher_list` (`Account`, `Ssn`, `Password`) VALUES
('T9428281', '332149', '332149');

-- --------------------------------------------------------

--
-- 表的結構 `Teacher_teach`
--

CREATE TABLE IF NOT EXISTS `Teacher_teach` (
  `Account` char(8) CHARACTER SET utf8 NOT NULL COMMENT '教師帳號',
  `Teacher_name` char(6) CHARACTER SET utf8 NOT NULL COMMENT '教師名稱',
  `Subject_code` char(7) CHARACTER SET utf8 NOT NULL COMMENT '科目代號',
  `Subject_name` char(5) CHARACTER SET utf8 NOT NULL COMMENT '科目名稱',
  `Class_code` int(4) NOT NULL COMMENT '選課代號',
  `Class` char(6) CHARACTER SET utf8 NOT NULL COMMENT '班級',
  PRIMARY KEY (`Account`,`Class_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 轉存資料表中的資料 `Teacher_teach`
--

INSERT INTO `Teacher_teach` (`Account`, `Teacher_name`, `Subject_code`, `Subject_name`, `Class_code`, `Class`) VALUES
('T9428281', '王家輝', 'IECS101', '計算機概論', 1459, '資工一甲');

-- --------------------------------------------------------

--
-- 表的結構 `Testlist`
--

CREATE TABLE IF NOT EXISTS `Testlist` (
  `Teacher_ID` char(8) CHARACTER SET utf8 NOT NULL COMMENT '教師帳號',
  `Test_number` int(4) NOT NULL COMMENT '考卷序號',
  `Exam_value` tinyint(1) NOT NULL COMMENT '是否交卷(0/1)',
  PRIMARY KEY (`Teacher_ID`,`Test_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的結構 `Test_assign`
--

CREATE TABLE IF NOT EXISTS `Test_assign` (
  `Text_number` int(4) NOT NULL COMMENT '考試序號',
  `Question_type` char(1) CHARACTER SET utf8 NOT NULL COMMENT '題目類型',
  `Question_number` char(4) CHARACTER SET utf8 NOT NULL COMMENT '題目序號',
  PRIMARY KEY (`Text_number`,`Question_type`,`Question_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的結構 `Test_Attribute`
--

CREATE TABLE IF NOT EXISTS `Test_Attribute` (
  `Test_number` int(4) NOT NULL,
  `Class_code` int(4) NOT NULL,
  `Test_start_time` date DEFAULT NULL,
  `Test_end_time` date NOT NULL,
  `Test_name` char(10) CHARACTER SET utf8 NOT NULL,
  `RorA` tinyint(1) NOT NULL,
  `State` tinyint(1) NOT NULL,
  `Per_choice` int(2) NOT NULL,
  `Per_T_or_F` int(2) NOT NULL,
  `Per_Q_and_A` int(2) NOT NULL,
  `To_correct` binary(2) NOT NULL,
  PRIMARY KEY (`Test_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的結構 `Test_random`
--

CREATE TABLE IF NOT EXISTS `Test_random` (
  `Test_number` int(4) NOT NULL COMMENT '考卷序號',
  `Subject_code` char(7) CHARACTER SET utf8 NOT NULL COMMENT '科目代號',
  `Chapter_code` char(3) CHARACTER SET utf8 NOT NULL COMMENT '章節代碼',
  `Choice` int(4) NOT NULL COMMENT '單選',
  `TorF` int(4) NOT NULL COMMENT '是非',
  `QandA` int(4) NOT NULL COMMENT '問答',
  PRIMARY KEY (`Test_number`,`Subject_code`,`Chapter_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的結構 `Test_score`
--

CREATE TABLE IF NOT EXISTS `Test_score` (
  `Student_ID` char(8) CHARACTER SET utf8 NOT NULL,
  `Check_arti` int(1) NOT NULL,
  `Choice_1` char(4) CHARACTER SET utf8 NOT NULL,
  `Choice1_score` int(2) NOT NULL,
  `TorF_1` char(4) CHARACTER SET utf8 NOT NULL,
  `TorF1_score` int(2) NOT NULL,
  `QandA_1` int(2) NOT NULL,
  `QandA1_score` int(2) NOT NULL,
  PRIMARY KEY (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的結構 `Test_StuAnswer`
--

CREATE TABLE IF NOT EXISTS `Test_StuAnswer` (
  `Student_ID` char(8) CHARACTER SET utf8 NOT NULL COMMENT '學生帳號',
  `Choice_1` char(4) CHARACTER SET utf8 NOT NULL COMMENT '題目序號',
  `Choice1_answer` int(2) NOT NULL COMMENT '此題答案',
  `TorF_1` char(4) CHARACTER SET utf8 NOT NULL COMMENT '題目序號',
  `TorF1_ answer` int(2) NOT NULL COMMENT '此題答案',
  `QandA_1` int(2) NOT NULL COMMENT '題目序號',
  `QandA1_ answer` int(2) NOT NULL COMMENT '此題答案',
  PRIMARY KEY (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
