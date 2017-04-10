/*
Navicat MySQL Data Transfer

Source Server         : cjluzzl_localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : testonlinexam

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-04-10 18:38:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 班级信息', '6', 'add_userclass');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 班级信息', '6', 'change_userclass');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 班级信息', '6', 'delete_userclass');
INSERT INTO `auth_permission` VALUES ('24', 'Can add 用户信息', '7', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('25', 'Can change 用户信息', '7', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('26', 'Can delete 用户信息', '7', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('27', 'Can add 邮箱验证码', '8', 'add_emailrevifyrecord');
INSERT INTO `auth_permission` VALUES ('28', 'Can change 邮箱验证码', '8', 'change_emailrevifyrecord');
INSERT INTO `auth_permission` VALUES ('29', 'Can delete 邮箱验证码', '8', 'delete_emailrevifyrecord');
INSERT INTO `auth_permission` VALUES ('30', 'Can add 轮播图', '9', 'add_banner');
INSERT INTO `auth_permission` VALUES ('31', 'Can change 轮播图', '9', 'change_banner');
INSERT INTO `auth_permission` VALUES ('32', 'Can delete 轮播图', '9', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 允许学号', '10', 'add_alloweduser');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 允许学号', '10', 'change_alloweduser');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 允许学号', '10', 'delete_alloweduser');
INSERT INTO `auth_permission` VALUES ('36', 'Can view 允许学号', '10', 'view_alloweduser');
INSERT INTO `auth_permission` VALUES ('37', 'Can view 轮播图', '9', 'view_banner');
INSERT INTO `auth_permission` VALUES ('38', 'Can view 邮箱验证码', '8', 'view_emailrevifyrecord');
INSERT INTO `auth_permission` VALUES ('39', 'Can view 班级信息', '6', 'view_userclass');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 用户信息', '7', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('41', 'Can add 课程', '11', 'add_courselist');
INSERT INTO `auth_permission` VALUES ('42', 'Can change 课程', '11', 'change_courselist');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete 课程', '11', 'delete_courselist');
INSERT INTO `auth_permission` VALUES ('44', 'Can add 题库', '12', 'add_question');
INSERT INTO `auth_permission` VALUES ('45', 'Can change 题库', '12', 'change_question');
INSERT INTO `auth_permission` VALUES ('46', 'Can delete 题库', '12', 'delete_question');
INSERT INTO `auth_permission` VALUES ('47', 'Can add 试卷列表', '13', 'add_paperlist');
INSERT INTO `auth_permission` VALUES ('48', 'Can change 试卷列表', '13', 'change_paperlist');
INSERT INTO `auth_permission` VALUES ('49', 'Can delete 试卷列表', '13', 'delete_paperlist');
INSERT INTO `auth_permission` VALUES ('50', 'Can add 试题列表', '14', 'add_paper');
INSERT INTO `auth_permission` VALUES ('51', 'Can change 试题列表', '14', 'change_paper');
INSERT INTO `auth_permission` VALUES ('52', 'Can delete 试题列表', '14', 'delete_paper');
INSERT INTO `auth_permission` VALUES ('53', 'Can view 课程', '11', 'view_courselist');
INSERT INTO `auth_permission` VALUES ('54', 'Can view 试题列表', '14', 'view_paper');
INSERT INTO `auth_permission` VALUES ('55', 'Can view 试卷列表', '13', 'view_paperlist');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 题库', '12', 'view_question');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 通知发布', '15', 'add_notice');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 通知发布', '15', 'change_notice');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 通知发布', '15', 'delete_notice');
INSERT INTO `auth_permission` VALUES ('60', 'Can add 用户留言', '16', 'add_usernote');
INSERT INTO `auth_permission` VALUES ('61', 'Can change 用户留言', '16', 'change_usernote');
INSERT INTO `auth_permission` VALUES ('62', 'Can delete 用户留言', '16', 'delete_usernote');
INSERT INTO `auth_permission` VALUES ('63', 'Can add 用户做题记录', '17', 'add_useranswerlog');
INSERT INTO `auth_permission` VALUES ('64', 'Can change 用户做题记录', '17', 'change_useranswerlog');
INSERT INTO `auth_permission` VALUES ('65', 'Can delete 用户做题记录', '17', 'delete_useranswerlog');
INSERT INTO `auth_permission` VALUES ('66', 'Can add 用户总分', '18', 'add_userscore');
INSERT INTO `auth_permission` VALUES ('67', 'Can change 用户总分', '18', 'change_userscore');
INSERT INTO `auth_permission` VALUES ('68', 'Can delete 用户总分', '18', 'delete_userscore');
INSERT INTO `auth_permission` VALUES ('69', 'Can view 通知发布', '15', 'view_notice');
INSERT INTO `auth_permission` VALUES ('70', 'Can view 用户做题记录', '17', 'view_useranswerlog');
INSERT INTO `auth_permission` VALUES ('71', 'Can view 用户留言', '16', 'view_usernote');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 用户总分', '18', 'view_userscore');
INSERT INTO `auth_permission` VALUES ('73', 'Can add Bookmark', '19', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('74', 'Can change Bookmark', '19', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete Bookmark', '19', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('76', 'Can add User Setting', '20', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('77', 'Can change User Setting', '20', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('78', 'Can delete User Setting', '20', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('79', 'Can add User Widget', '21', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('80', 'Can change User Widget', '21', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('81', 'Can delete User Widget', '21', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('82', 'Can add log entry', '22', 'add_log');
INSERT INTO `auth_permission` VALUES ('83', 'Can change log entry', '22', 'change_log');
INSERT INTO `auth_permission` VALUES ('84', 'Can delete log entry', '22', 'delete_log');
INSERT INTO `auth_permission` VALUES ('85', 'Can view Bookmark', '19', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('86', 'Can view log entry', '22', 'view_log');
INSERT INTO `auth_permission` VALUES ('87', 'Can view User Setting', '20', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('88', 'Can view User Widget', '21', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('89', 'Can add captcha store', '23', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('90', 'Can change captcha store', '23', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('91', 'Can delete captcha store', '23', 'delete_captchastore');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------

-- ----------------------------
-- Table structure for coures_courselist
-- ----------------------------
DROP TABLE IF EXISTS `coures_courselist`;
CREATE TABLE `coures_courselist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `decs` varchar(500) NOT NULL,
  `add_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coures_courselist
-- ----------------------------
INSERT INTO `coures_courselist` VALUES ('1', '数据结构', '数据机构与算法设计', '2017-04-03');
INSERT INTO `coures_courselist` VALUES ('2', 'java语言程序设计', 'Java语言的语法以及编程实战', '2017-04-03');
INSERT INTO `coures_courselist` VALUES ('3', '小学数学', '小学数学人人学', '2017-04-03');

-- ----------------------------
-- Table structure for coures_paper
-- ----------------------------
DROP TABLE IF EXISTS `coures_paper`;
CREATE TABLE `coures_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` date NOT NULL,
  `paper_name_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coures_paper_51e862cf` (`paper_name_id`),
  KEY `coures_paper_7aa0f6ee` (`question_id`),
  KEY `coures_paper_ea134da7` (`course_id`),
  CONSTRAINT `coures_paper_course_id_bbb6941b_fk_coures_courselist_id` FOREIGN KEY (`course_id`) REFERENCES `coures_courselist` (`id`),
  CONSTRAINT `coures_paper_paper_name_id_db46332d_fk_coures_paperlist_id` FOREIGN KEY (`paper_name_id`) REFERENCES `coures_paperlist` (`id`),
  CONSTRAINT `coures_paper_question_id_f1d0b8c2_fk_coures_question_id` FOREIGN KEY (`question_id`) REFERENCES `coures_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coures_paper
-- ----------------------------
INSERT INTO `coures_paper` VALUES ('1', '2017-04-04', '1', '1', '1');
INSERT INTO `coures_paper` VALUES ('2', '2017-04-04', '1', '2', '1');
INSERT INTO `coures_paper` VALUES ('3', '2017-04-04', '1', '3', '1');
INSERT INTO `coures_paper` VALUES ('4', '2017-04-04', '1', '4', '1');
INSERT INTO `coures_paper` VALUES ('5', '2017-04-04', '1', '5', '1');
INSERT INTO `coures_paper` VALUES ('6', '2017-04-04', '1', '6', '1');
INSERT INTO `coures_paper` VALUES ('7', '2017-04-04', '1', '7', '1');
INSERT INTO `coures_paper` VALUES ('9', '2017-04-04', '1', '8', '1');
INSERT INTO `coures_paper` VALUES ('10', '2017-04-04', '1', '9', '1');
INSERT INTO `coures_paper` VALUES ('11', '2017-04-04', '1', '10', '1');
INSERT INTO `coures_paper` VALUES ('12', '2017-04-04', '2', '11', '3');
INSERT INTO `coures_paper` VALUES ('13', '2017-04-04', '2', '12', '3');
INSERT INTO `coures_paper` VALUES ('14', '2017-04-04', '2', '13', '1');
INSERT INTO `coures_paper` VALUES ('15', '2017-04-04', '2', '14', '1');

-- ----------------------------
-- Table structure for coures_paperlist
-- ----------------------------
DROP TABLE IF EXISTS `coures_paperlist`;
CREATE TABLE `coures_paperlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_allow` tinyint(1) NOT NULL,
  `add_time` date NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coures_paperlist_course_id_945bf724_fk_coures_courselist_id` (`course_id`),
  CONSTRAINT `coures_paperlist_course_id_945bf724_fk_coures_courselist_id` FOREIGN KEY (`course_id`) REFERENCES `coures_courselist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coures_paperlist
-- ----------------------------
INSERT INTO `coures_paperlist` VALUES ('1', '第一次测试', '1', '2017-04-04', '1');
INSERT INTO `coures_paperlist` VALUES ('2', '三年级第一次月考', '1', '2017-04-04', '3');

-- ----------------------------
-- Table structure for coures_question
-- ----------------------------
DROP TABLE IF EXISTS `coures_question`;
CREATE TABLE `coures_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionType` varchar(2) NOT NULL,
  `content` longtext NOT NULL,
  `answer` longtext NOT NULL,
  `choice_a` longtext NOT NULL,
  `choice_b` longtext NOT NULL,
  `choice_c` longtext NOT NULL,
  `choice_d` longtext NOT NULL,
  `score` int(11) NOT NULL,
  `note` longtext NOT NULL,
  `boolt` longtext NOT NULL,
  `boolf` longtext NOT NULL,
  `add_time` date NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coures_question_course_id_1c63d3e4_fk_coures_courselist_id` (`course_id`),
  CONSTRAINT `coures_question_course_id_1c63d3e4_fk_coures_courselist_id` FOREIGN KEY (`course_id`) REFERENCES `coures_courselist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coures_question
-- ----------------------------
INSERT INTO `coures_question` VALUES ('1', 'xz', 'C语言发明者是谁？', 'B', 'A.詹姆斯·高斯林', 'B.丹尼斯·里奇', 'C.林纳斯·托瓦兹', 'D.严蔚敏', '10', '问答题在此处做答', 'True', 'False', '2017-04-03', '1');
INSERT INTO `coures_question` VALUES ('2', 'xz', '研究数据结构就是研究（）', 'D', 'A.数据的逻辑结构', 'B.数据的存储结构', 'C.数据的逻辑结构和存储结构', 'D.数据的逻辑结构、存储结构及其基本操作', '10', '问答题在此处做答', 'True', 'False', '2017-04-03', '1');
INSERT INTO `coures_question` VALUES ('3', 'xz', '与数据元素本身的形式、内容、相对位置和个数无关的是数据的（）结构', 'C', 'A.存储', 'B.物理', 'C.逻辑', 'D.物理和存储', '10', '问答题在此处做答', 'True', 'False', '2017-04-03', '1');
INSERT INTO `coures_question` VALUES ('4', 'xz', '数据结构在计算机存储空间中的存放形式称为（）', 'C', 'A.数据元素之间的关系', 'B.数据结构', 'C.数据的存储结构', 'D.数据的逻辑结构', '10', '问答题在此处做答', 'True', 'False', '2017-04-03', '1');
INSERT INTO `coures_question` VALUES ('5', 'xz', '数据的存储结构是指（）', 'B', 'A.数据所占的存储空间', 'B.数据的逻辑结构在计算机中的表示', 'C.存储在外存中的数据', 'D.数据在计算机的顺序访问形式', '10', '问答题在此处做答', 'True', 'False', '2017-04-03', '1');
INSERT INTO `coures_question` VALUES ('6', 'xz', '以下说法正确的是（）', 'D', 'A.数据元素是数据的最小单位', 'B.数据项是数据的基本单位', 'C.数据结构是带结构的各数据项的集合', 'D.一些表面上很不想同的数据，可以有相同的逻辑结构', '10', '问答题在此处做答', 'True', 'False', '2017-04-03', '1');
INSERT INTO `coures_question` VALUES ('7', 'xz', '从逻辑上可以把数据结构分成（）', 'C', 'A.动态结构和静态结构', 'B.紧凑结构和非紧凑结构', 'C.线性结构和非线性结构', 'D.内部结构和外部结构', '10', '问答题在此处做答', 'True', 'False', '2017-04-03', '1');
INSERT INTO `coures_question` VALUES ('8', 'xz', '算法分析的目的是（）', 'C', 'A.找出数据结构的合理性', 'B.研究算法中的输入和输出的关系', 'C.分析算法的效率以求改进', 'D.分析算法的易懂性和文档性', '10', '问答题在此处做答', 'True', 'False', '2017-04-03', '1');
INSERT INTO `coures_question` VALUES ('9', 'xz', '算法分析的两个主要方面', 'A', 'A.时间复杂度和空间复杂度', 'B.正确性和简单性', 'C.分析算法的效率以求改进', 'D.分析算法的易懂性和文档性', '10', '问答题在此处做答', 'True', 'False', '2017-04-04', '1');
INSERT INTO `coures_question` VALUES ('10', 'xz', '算法的时间复杂度是指（）', 'D', 'A.执行算法程序锁需要的时间', 'B.算法程序中的指令条数', 'C.算法程序的长度', 'D.算法执行过程中所需要的基本运算次数', '10', '问答题在此处做答', 'True', 'False', '2017-04-04', '1');
INSERT INTO `coures_question` VALUES ('11', 'xz', '请问 3 + 9 = ___', 'C', 'A.11', 'B.13', 'C.12', 'D.14', '25', '问答题在此处做答', 'True', 'False', '2017-04-04', '3');
INSERT INTO `coures_question` VALUES ('12', 'xz', '3 * 5 = ___', 'A', 'A.15', 'B.16', 'C.14', 'D.13', '25', '问答题在此处做答', 'True', 'False', '2017-04-04', '3');
INSERT INTO `coures_question` VALUES ('13', 'pd', '我有两块糖，吃了一块，还剩三块', 'False', 'A.', 'B.', 'C.', 'D.', '25', '问答题在此处做答', 'True', 'False', '2017-04-04', '3');
INSERT INTO `coures_question` VALUES ('14', 'xz', '学校与小明家的距离是3km，小明骑自行车以300米/分钟的匀速去学校，那么他需要多长时间到学校', 'D', 'A.11分钟', 'B.15分钟', 'C.12分钟', 'D.10分钟', '25', '问答题在此处做答', 'True', 'False', '2017-04-04', '3');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('23', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('11', 'coures', 'courselist');
INSERT INTO `django_content_type` VALUES ('14', 'coures', 'paper');
INSERT INTO `django_content_type` VALUES ('13', 'coures', 'paperlist');
INSERT INTO `django_content_type` VALUES ('12', 'coures', 'question');
INSERT INTO `django_content_type` VALUES ('15', 'operate', 'notice');
INSERT INTO `django_content_type` VALUES ('17', 'operate', 'useranswerlog');
INSERT INTO `django_content_type` VALUES ('16', 'operate', 'usernote');
INSERT INTO `django_content_type` VALUES ('18', 'operate', 'userscore');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('10', 'users', 'alloweduser');
INSERT INTO `django_content_type` VALUES ('9', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'emailrevifyrecord');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'userclass');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('19', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('20', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-04-03 23:43:57');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2017-04-03 23:43:57');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2017-04-03 23:43:58');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2017-04-03 23:43:58');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2017-04-03 23:43:58');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2017-04-03 23:43:58');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2017-04-03 23:43:58');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2017-04-03 23:43:58');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2017-04-03 23:43:58');
INSERT INTO `django_migrations` VALUES ('10', 'users', '0001_initial', '2017-04-03 23:43:59');
INSERT INTO `django_migrations` VALUES ('11', 'admin', '0001_initial', '2017-04-03 23:43:59');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0002_logentry_remove_auto_add', '2017-04-03 23:43:59');
INSERT INTO `django_migrations` VALUES ('13', 'captcha', '0001_initial', '2017-04-03 23:43:59');
INSERT INTO `django_migrations` VALUES ('14', 'coures', '0001_initial', '2017-04-03 23:43:59');
INSERT INTO `django_migrations` VALUES ('15', 'coures', '0002_paper_course', '2017-04-03 23:43:59');
INSERT INTO `django_migrations` VALUES ('16', 'operate', '0001_initial', '2017-04-03 23:44:00');
INSERT INTO `django_migrations` VALUES ('17', 'operate', '0002_auto_20170403_2323', '2017-04-03 23:44:00');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2017-04-03 23:44:00');
INSERT INTO `django_migrations` VALUES ('19', 'users', '0002_alloweduser', '2017-04-03 23:44:00');
INSERT INTO `django_migrations` VALUES ('20', 'xadmin', '0001_initial', '2017-04-03 23:44:00');
INSERT INTO `django_migrations` VALUES ('21', 'xadmin', '0002_log', '2017-04-03 23:44:00');
INSERT INTO `django_migrations` VALUES ('22', 'xadmin', '0003_auto_20160715_0100', '2017-04-03 23:44:00');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('769elg2ktegxulb0fn4tu3xgglt2c43j', 'M2NhNmE2ZjE5NjU3MmUwZGIyYzc5ZGYwNGQ0ZTFjMDdmZjJiZjYwNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiZmU3Mzk1MzdkZjRhYjg2Nzc4NWFjYjlkODcwZjE2OGI1MjJmNWE1NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2017-04-24 17:08:24');
INSERT INTO `django_session` VALUES ('8h5jq0fffjm7x63dyjiq888dn20uo13k', 'Y2I5M2NmMmJkMjg1N2Q2NmU5N2ZhMzQ4ZWVhMjNkZDkzNDE1NDU4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZlNzM5NTM3ZGY0YWI4Njc3ODVhY2I5ZDg3MGYxNjhiNTIyZjVhNTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2017-04-18 22:19:31');

-- ----------------------------
-- Table structure for operate_notice
-- ----------------------------
DROP TABLE IF EXISTS `operate_notice`;
CREATE TABLE `operate_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pub_time` date NOT NULL,
  `pub_content` longtext NOT NULL,
  `pub_name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operate_notice_pub_name_id_1ba66da6_fk_users_userprofile_id` (`pub_name_id`),
  CONSTRAINT `operate_notice_pub_name_id_1ba66da6_fk_users_userprofile_id` FOREIGN KEY (`pub_name_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operate_notice
-- ----------------------------

-- ----------------------------
-- Table structure for operate_useranswerlog
-- ----------------------------
DROP TABLE IF EXISTS `operate_useranswerlog`;
CREATE TABLE `operate_useranswerlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` longtext NOT NULL,
  `score` int(11) NOT NULL,
  `add_time` date NOT NULL,
  `course_id` int(11) NOT NULL,
  `paper_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operate_useranswerlog_course_id_294c2464_fk_coures_courselist_id` (`course_id`),
  KEY `operate_useranswerlog_paper_id_5d88f6eb_fk_coures_paper_id` (`paper_id`),
  KEY `operate_useranswerlog_user_id_6ced708d_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operate_useranswerlog_course_id_294c2464_fk_coures_courselist_id` FOREIGN KEY (`course_id`) REFERENCES `coures_courselist` (`id`),
  CONSTRAINT `operate_useranswerlog_paper_id_5d88f6eb_fk_coures_paper_id` FOREIGN KEY (`paper_id`) REFERENCES `coures_paper` (`id`),
  CONSTRAINT `operate_useranswerlog_user_id_6ced708d_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operate_useranswerlog
-- ----------------------------

-- ----------------------------
-- Table structure for operate_usernote
-- ----------------------------
DROP TABLE IF EXISTS `operate_usernote`;
CREATE TABLE `operate_usernote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` date NOT NULL,
  `note_content` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operate_usernote_user_id_07966e99_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operate_usernote_user_id_07966e99_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operate_usernote
-- ----------------------------

-- ----------------------------
-- Table structure for operate_userscore
-- ----------------------------
DROP TABLE IF EXISTS `operate_userscore`;
CREATE TABLE `operate_userscore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) NOT NULL,
  `add_time` date NOT NULL,
  `paper_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operate_userscore_user_id_b7fbf01a_fk_users_userprofile_id` (`user_id`),
  KEY `operate_userscore_paper_id_a32de3cb_uniq` (`paper_id`),
  CONSTRAINT `operate_userscore_paper_id_a32de3cb_fk_coures_paperlist_id` FOREIGN KEY (`paper_id`) REFERENCES `coures_paperlist` (`id`),
  CONSTRAINT `operate_userscore_user_id_b7fbf01a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operate_userscore
-- ----------------------------
INSERT INTO `operate_userscore` VALUES ('1', '100', '2017-04-04', '2', '2');
INSERT INTO `operate_userscore` VALUES ('2', '0', '2017-04-04', '2', '2');
INSERT INTO `operate_userscore` VALUES ('3', '0', '2017-04-04', '2', '2');
INSERT INTO `operate_userscore` VALUES ('4', '100', '2017-04-04', '2', '2');
INSERT INTO `operate_userscore` VALUES ('5', '100', '2017-04-04', '2', '2');
INSERT INTO `operate_userscore` VALUES ('6', '100', '2017-04-04', '2', '2');
INSERT INTO `operate_userscore` VALUES ('7', '100', '2017-04-04', '2', '2');
INSERT INTO `operate_userscore` VALUES ('8', '100', '2017-04-04', '2', '2');
INSERT INTO `operate_userscore` VALUES ('9', '100', '2017-04-04', '2', '2');
INSERT INTO `operate_userscore` VALUES ('10', '100', '2017-04-06', '2', '2');
INSERT INTO `operate_userscore` VALUES ('11', '100', '2017-04-10', '2', '2');
INSERT INTO `operate_userscore` VALUES ('12', '100', '2017-04-10', '2', '2');
INSERT INTO `operate_userscore` VALUES ('13', '100', '2017-04-10', '2', '2');
INSERT INTO `operate_userscore` VALUES ('14', '75', '2017-04-10', '2', '2');

-- ----------------------------
-- Table structure for users_alloweduser
-- ----------------------------
DROP TABLE IF EXISTS `users_alloweduser`;
CREATE TABLE `users_alloweduser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_alloweduser
-- ----------------------------

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_banner
-- ----------------------------

-- ----------------------------
-- Table structure for users_emailrevifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailrevifyrecord`;
CREATE TABLE `users_emailrevifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `is_alive` tinyint(1) NOT NULL,
  `send_type` varchar(10) NOT NULL,
  `send_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailrevifyrecord
-- ----------------------------

-- ----------------------------
-- Table structure for users_userclass
-- ----------------------------
DROP TABLE IF EXISTS `users_userclass`;
CREATE TABLE `users_userclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userclass
-- ----------------------------
INSERT INTO `users_userclass` VALUES ('1', '14信算2', '0');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `user_classname_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `users_userprofile_d7743ff6` (`user_classname_id`),
  CONSTRAINT `users_userprofi_user_classname_id_25b146c5_fk_users_userclass_id` FOREIGN KEY (`user_classname_id`) REFERENCES `users_userclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('2', 'pbkdf2_sha256$24000$3DagSFbeFwGy$ro4MaJYYSxORvmJou5OOJl8A9oG9R3KGEGJ0KQyQZWw=', '2017-04-10 16:54:00', '1', 'root', '', '', '410018832@qq.com', '1', '1', '2017-04-03 23:46:00', '任志远', '2017-04-04', 'male', '15068895421', 'static/images/head/2017/04/python_y9icNZd.png', '1');
INSERT INTO `users_userprofile` VALUES ('3', 'pbkdf2_sha256$24000$QJow0LzaTYmA$Cr5m8UTFQqjRc1ToBuImbi06UpSEziBsCJd9HoIJy+4=', null, '0', '1400801299', '', '', '', '0', '1', '2017-04-10 17:07:41', '', null, 'female', null, 'static/images/head/default.png', '1');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2017-04-03 23:47:20', '127.0.0.1', '1', '数据结构', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('2', '2017-04-03 23:47:38', '127.0.0.1', '2', 'java语言程序设计', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('3', '2017-04-03 23:48:08', '127.0.0.1', '3', '小学数学', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('4', '2017-04-03 23:49:55', '127.0.0.1', '1', '数据结构(题干:C语言发明者是谁？ | 正确答案:B )', 'create', '已添加', '12', '2');
INSERT INTO `xadmin_log` VALUES ('5', '2017-04-03 23:51:42', '127.0.0.1', '2', '数据结构(题干:研究数据结构就是研究（） | 正确答案:D )', 'create', '已添加', '12', '2');
INSERT INTO `xadmin_log` VALUES ('6', '2017-04-03 23:52:55', '127.0.0.1', '3', '数据结构(题干:与数据元素本身的形式、内容、相对位置和个数无关的是数据的（）结构 | 正确答案:C )', 'create', '已添加', '12', '2');
INSERT INTO `xadmin_log` VALUES ('7', '2017-04-03 23:54:19', '127.0.0.1', '4', '数据结构(题干:数据结构在计算机存储空间中的存放形式称为（） | 正确答案:C )', 'create', '已添加', '12', '2');
INSERT INTO `xadmin_log` VALUES ('8', '2017-04-03 23:56:06', '127.0.0.1', '5', '数据结构(题干:数据的存储结构是指（） | 正确答案:B )', 'create', '已添加', '12', '2');
INSERT INTO `xadmin_log` VALUES ('9', '2017-04-03 23:58:02', '127.0.0.1', '6', '数据结构(题干:以下说法正确的是（） | 正确答案:D )', 'create', '已添加', '12', '2');
INSERT INTO `xadmin_log` VALUES ('10', '2017-04-03 23:59:20', '127.0.0.1', '7', '数据结构(题干:从逻辑上可以把数据结构分成（） | 正确答案:C )', 'create', '已添加', '12', '2');
INSERT INTO `xadmin_log` VALUES ('11', '2017-04-04 00:00:52', '127.0.0.1', '8', '数据结构(题干:算法分析的目的是（） | 正确答案:C )', 'create', '已添加', '12', '2');
INSERT INTO `xadmin_log` VALUES ('12', '2017-04-04 00:02:01', '127.0.0.1', '9', '数据结构(题干:算法分析的两个主要方面 | 正确答案:A )', 'create', '已添加', '12', '2');
INSERT INTO `xadmin_log` VALUES ('13', '2017-04-04 00:03:26', '127.0.0.1', '10', '数据结构(题干:算法的时间复杂度是指（） | 正确答案:D )', 'create', '已添加', '12', '2');
INSERT INTO `xadmin_log` VALUES ('14', '2017-04-04 00:04:17', '127.0.0.1', '1', '数据结构(试卷名称:第一次测试 | 使用状态:True)', 'create', '已添加', '13', '2');
INSERT INTO `xadmin_log` VALUES ('15', '2017-04-04 00:04:50', '127.0.0.1', '1', '数据结构(试卷名称:第一次测试 | 使用状态:True) (C语言发明者是谁？)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('16', '2017-04-04 00:04:56', '127.0.0.1', '2', '数据结构(试卷名称:第一次测试 | 使用状态:True) (研究数据结构就是研究（）)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('17', '2017-04-04 00:05:09', '127.0.0.1', '3', '数据结构(试卷名称:第一次测试 | 使用状态:True) (与数据元素本身的形式、内容、相对位置和个数无关的是数据的（）结构)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('18', '2017-04-04 00:05:16', '127.0.0.1', '4', '数据结构(试卷名称:第一次测试 | 使用状态:True) (数据结构在计算机存储空间中的存放形式称为（）)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('19', '2017-04-04 00:05:56', '127.0.0.1', '5', '数据结构(试卷名称:第一次测试 | 使用状态:True) (数据的存储结构是指（）)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('20', '2017-04-04 00:06:25', '127.0.0.1', '6', '数据结构(试卷名称:第一次测试 | 使用状态:True) (以下说法正确的是（）)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('21', '2017-04-04 00:06:43', '127.0.0.1', '7', '数据结构(试卷名称:第一次测试 | 使用状态:True) (从逻辑上可以把数据结构分成（）)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('22', '2017-04-04 00:07:04', '127.0.0.1', '8', '数据结构(试卷名称:第一次测试 | 使用状态:True) (从逻辑上可以把数据结构分成（）)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('23', '2017-04-04 00:07:27', '127.0.0.1', null, '', 'delete', '批量删除 1 个 试题列表', null, '2');
INSERT INTO `xadmin_log` VALUES ('24', '2017-04-04 00:07:50', '127.0.0.1', '9', '数据结构(试卷名称:第一次测试 | 使用状态:True) (算法分析的目的是（）)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('25', '2017-04-04 00:08:01', '127.0.0.1', '10', '数据结构(试卷名称:第一次测试 | 使用状态:True) (算法分析的两个主要方面)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('26', '2017-04-04 00:08:20', '127.0.0.1', '11', '数据结构(试卷名称:第一次测试 | 使用状态:True) (算法的时间复杂度是指（）)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('27', '2017-04-04 00:13:23', '127.0.0.1', '11', '小学数学(题干:请问 3 + 9 = ___ | 正确答案:C )', 'create', '已添加', '12', '2');
INSERT INTO `xadmin_log` VALUES ('28', '2017-04-04 00:14:20', '127.0.0.1', '12', '小学数学(题干:3 * 5 = ___ | 正确答案:A )', 'create', '已添加', '12', '2');
INSERT INTO `xadmin_log` VALUES ('29', '2017-04-04 00:15:16', '127.0.0.1', '13', '小学数学(题干:我有两块糖，吃了一块，还剩三块 | 正确答案:False )', 'create', '已添加', '12', '2');
INSERT INTO `xadmin_log` VALUES ('30', '2017-04-04 00:18:19', '127.0.0.1', '14', '小学数学(题干:学校与小明家的距离是3km，小明骑自行车以300米/分钟的匀速去学校，那么他需要多长时间到学校 | 正确答案:D )', 'create', '已添加', '12', '2');
INSERT INTO `xadmin_log` VALUES ('31', '2017-04-04 00:19:34', '127.0.0.1', '2', '小学数学(试卷名称:三年级第一次月考 | 使用状态:True)', 'create', '已添加', '13', '2');
INSERT INTO `xadmin_log` VALUES ('32', '2017-04-04 00:20:07', '127.0.0.1', '12', '小学数学(试卷名称:三年级第一次月考 | 使用状态:True) (请问 3 + 9 = ___)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('33', '2017-04-04 00:20:30', '127.0.0.1', '13', '小学数学(试卷名称:三年级第一次月考 | 使用状态:True) (3 * 5 = ___)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('34', '2017-04-04 00:20:43', '127.0.0.1', '14', '小学数学(试卷名称:三年级第一次月考 | 使用状态:True) (我有两块糖，吃了一块，还剩三块)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('35', '2017-04-04 00:20:59', '127.0.0.1', '15', '小学数学(试卷名称:三年级第一次月考 | 使用状态:True) (学校与小明家的距离是3km，小明骑自行车以300米/分钟的匀速去学校，那么他需要多长时间到学校)', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('36', '2017-04-04 13:33:23', '127.0.0.1', '2', 'root', 'change', '已修改 last_login，nick_name，birthday，gender，mobile 和 image 。', '7', '2');
INSERT INTO `xadmin_log` VALUES ('37', '2017-04-10 17:07:41', '127.0.0.1', '3', '1400801299', 'create', '已添加', '7', '2');
INSERT INTO `xadmin_log` VALUES ('38', '2017-04-10 17:08:24', '127.0.0.1', '2', 'root', 'change', '已修改 last_login 和 image 。', '7', '2');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '2');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
