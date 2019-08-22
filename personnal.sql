/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : personnal

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 03/11/2018 12:33:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dep_trans
-- ----------------------------
DROP TABLE IF EXISTS `dep_trans`;
CREATE TABLE `dep_trans`  (
  `dep_trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `after_dep` int(11) NOT NULL,
  `trans_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trans_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `trans_date` date NOT NULL,
  PRIMARY KEY (`dep_trans_id`) USING BTREE,
  INDEX `dep_trans_dep_fk`(`after_dep`) USING BTREE,
  INDEX `dep_trans_emp_fk`(`emp_id`) USING BTREE,
  CONSTRAINT `dep_trans_dep_fk` FOREIGN KEY (`after_dep`) REFERENCES `department` (`dep_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dep_trans_emp_fk` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dep_trans
-- ----------------------------
INSERT INTO `dep_trans` VALUES (1, 1506, 4, '2', '不适合目前的工作', '', '2018-10-29');
INSERT INTO `dep_trans` VALUES (2, 1507, 2, '1', '', '', '2018-12-20');
INSERT INTO `dep_trans` VALUES (4, 1518, 10, '2', '其他', '无', '2018-11-02');
INSERT INTO `dep_trans` VALUES (5, 1518, 5, '2', '其他', '无', '2018-11-02');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dep_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dep_phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dep_far` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dep_describe` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dep_sup` int(11) DEFAULT NULL,
  `estdate` date NOT NULL,
  PRIMARY KEY (`dep_id`) USING BTREE,
  INDEX `dep_sup_fk`(`dep_sup`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '财务部', '2', '1547852', '85 519-85129131', '管理财务', NULL, '2015-04-06');
INSERT INTO `department` VALUES (2, '产品开发部', '2', '1548741', '85 519-85124866', '软件设计开发', NULL, '2015-05-01');
INSERT INTO `department` VALUES (3, '品管部', '2', '4521478', '85 519-85127412', '软件品质管理', 2, '2015-06-01');
INSERT INTO `department` VALUES (4, '人力资源部', '2', '4852444', '85 519-85129652', '管理员工分配', NULL, '2015-04-01');
INSERT INTO `department` VALUES (5, '营销部', '2', '4869325', '85 519-85174569', '产品销售', NULL, '2015-02-01');
INSERT INTO `department` VALUES (10, '保洁部', '2', '1824560666', '85 519-85129132', '扫垃圾', 0, '2018-11-02');

-- ----------------------------
-- Table structure for dimission
-- ----------------------------
DROP TABLE IF EXISTS `dimission`;
CREATE TABLE `dimission`  (
  `dim_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `dim_date` date NOT NULL,
  `dim_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dim_direc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`dim_id`) USING BTREE,
  UNIQUE INDEX `emp_id_unique`(`emp_id`) USING BTREE,
  CONSTRAINT `dim_emp_fk` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dimission
-- ----------------------------
INSERT INTO `dimission` VALUES (1, 1505, '2018-01-01', '3', '无', '无');
INSERT INTO `dimission` VALUES (2, 1502, '2018-05-20', '1', '腾讯', '无');
INSERT INTO `dimission` VALUES (3, 1504, '2019-08-10', '2', '', '工作懒散');
INSERT INTO `dimission` VALUES (4, 1510, '2009-10-10', '3', '', '已到退休年龄');
INSERT INTO `dimission` VALUES (6, 1518, '2018-11-02', '1', '腾讯', '无');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date NOT NULL,
  `dep_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `entry_date` date NOT NULL,
  `work_date` date NOT NULL,
  `work_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `emp_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`emp_id`) USING BTREE,
  INDEX `emp_dep_fk`(`dep_id`) USING BTREE,
  INDEX `emp_post_fk`(`post_id`) USING BTREE,
  CONSTRAINT `emp_dep_fk` FOREIGN KEY (`dep_id`) REFERENCES `department` (`dep_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `emp_post_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1519 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1501, '高新强', '1', '1985-01-04', 2, 5, '2016-01-02', '2016-01-04', '1', '汉族', '15640842136', '708956136@qq.com');
INSERT INTO `employee` VALUES (1502, '于馨冉', '2', '1986-02-28', 1, 1, '2016-03-11', '2016-03-24', '1', '汉族', '1359846549', '789564239@163.com');
INSERT INTO `employee` VALUES (1503, '贺依沄', '2', '1993-12-30', 1, 3, '2018-04-01', '2018-07-01', '1', '满族', '1359865441', '1563289745@163.com');
INSERT INTO `employee` VALUES (1504, '左永杰', '1', '1984-07-17', 4, 1, '2016-06-19', '2016-06-21', '1', '壮族', '18968413584', '6541289513@qq.com');
INSERT INTO `employee` VALUES (1505, '段健', '1', '1992-08-22', 5, 7, '2018-02-01', '2018-02-02', '2', '汉族', '13842369541', '4365954998@sina.com');
INSERT INTO `employee` VALUES (1506, '毛显富', '1', '1986-09-27', 4, 3, '2008-05-23', '2008-06-01', '1', '汉族', '18963654357', '9065436978@qq.com');
INSERT INTO `employee` VALUES (1507, '王嘉怡', '2', '1996-08-22', 2, 8, '2009-04-25', '2009-06-04', '1', '锡伯族', '18963654357', '85987348@qq.com');
INSERT INTO `employee` VALUES (1508, '许克', '1', '1993-07-23', 2, 6, '2018-04-16', '2008-04-22', '2', '汉族', '13625795468', '4891235879@qq.com');
INSERT INTO `employee` VALUES (1509, '魏红艳', '2', '1969-06-27', 4, 1, '2006-04-12', '2006-04-18', '1', '汉族', '1956845315', '2148945642@qq.com');
INSERT INTO `employee` VALUES (1510, '诌常', '1', '1987-05-26', 3, 2, '2010-09-02', '2010-10-05', '1', '汉族', '13759854621', '15484894@yahoo.com');
INSERT INTO `employee` VALUES (1511, '张国', '2', '1996-10-10', 4, 5, '2010-06-12', '2010-06-19', '2', '汉族', '15284845569', '3562798@qq.com');
INSERT INTO `employee` VALUES (1512, '王家华', '1', '1993-03-13', 4, 4, '2018-10-05', '2018-10-20', '1', '满族', '182606643963', '5678323311@qq.com');
INSERT INTO `employee` VALUES (1513, '李华', '1', '1993-03-13', 4, 4, '2018-10-12', '2018-10-28', '1', '汉族', '15284845569', '3562798@qq.com');
INSERT INTO `employee` VALUES (1517, '许嵩', '1', '1988-05-22', 1, 1, '2018-10-29', '2018-11-02', '1', '汉族', '18260664396', '');
INSERT INTO `employee` VALUES (1518, '张国已', '1', '1984-11-01', 5, 1, '2018-11-02', '2018-11-29', '1', '汉族', '1528484556', '3562798@qq.com');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `strength` int(11) NOT NULL,
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, '经理', '1', 2);
INSERT INTO `post` VALUES (2, '副经理', '1', 6);
INSERT INTO `post` VALUES (3, '会计', '4', 6);
INSERT INTO `post` VALUES (4, '主管', '1', 5);
INSERT INTO `post` VALUES (5, '架构师', '2', 2);
INSERT INTO `post` VALUES (6, '程序员', '2', 50);
INSERT INTO `post` VALUES (7, '推销员', '3', 20);
INSERT INTO `post` VALUES (8, '广告策划', '4', 4);
INSERT INTO `post` VALUES (10, '保洁阿姨', '1', 30);

-- ----------------------------
-- Table structure for post_trans
-- ----------------------------
DROP TABLE IF EXISTS `post_trans`;
CREATE TABLE `post_trans`  (
  `post_trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `after_post` int(11) NOT NULL,
  `trans_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trans_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `trans_date` date NOT NULL,
  PRIMARY KEY (`post_trans_id`) USING BTREE,
  INDEX `post_trans_emp_fk`(`emp_id`) USING BTREE,
  INDEX `post_trans_post_fk`(`after_post`) USING BTREE,
  CONSTRAINT `post_trans_emp_fk` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_trans_post_fk` FOREIGN KEY (`after_post`) REFERENCES `post` (`post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_trans
-- ----------------------------
INSERT INTO `post_trans` VALUES (1, 1506, 3, '2', '不适合目前的岗位', '给予降职', '2018-10-29');
INSERT INTO `post_trans` VALUES (2, 1511, 5, '1', '', '', '2018-12-02');

-- ----------------------------
-- Table structure for probation
-- ----------------------------
DROP TABLE IF EXISTS `probation`;
CREATE TABLE `probation`  (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `evaluate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '1：转正 2：延期 3：不予录用',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`pro_id`) USING BTREE,
  UNIQUE INDEX `emp_id_unique`(`emp_id`) USING BTREE,
  CONSTRAINT `pro_emp_fk` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of probation
-- ----------------------------
INSERT INTO `probation` VALUES (1, 1505, '2018-02-02', '2018-03-02', '基础不扎实', '3', '试用一个月');
INSERT INTO `probation` VALUES (3, 1507, '2009-06-04', '2009-07-04', '先看业绩', '2', '业绩好就转正');
INSERT INTO `probation` VALUES (4, 1508, '2018-04-22', '2018-08-20', '基础扎实态度认真', '2', '试用3个月');
INSERT INTO `probation` VALUES (5, 1502, '2016-03-24', '2016-07-24', '业务能力优秀', '1', '试用2个月');
INSERT INTO `probation` VALUES (10, 1501, '2018-10-11', '2018-10-05', '基础扎实态度认真', NULL, '无');
INSERT INTO `probation` VALUES (15, 1518, '2018-11-02', '2018-12-28', '很好', '2', '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userid` int(10) NOT NULL AUTO_INCREMENT,
  `pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0：人事经理 1：员工',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('蒙广福', 1, '123456', '0');
INSERT INTO `user` VALUES ('于振洋', 2, '123456', '0');
INSERT INTO `user` VALUES ('庾鹏飞', 3, '123456', '1');
INSERT INTO `user` VALUES ('方仕凯', 4, '123456', '0');

SET FOREIGN_KEY_CHECKS = 1;
