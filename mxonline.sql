/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : mxonline

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-09-05 15:07:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
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
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 用户信息', '7', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 用户信息', '7', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 用户信息', '7', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 邮箱验证码', '8', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 邮箱验证码', '8', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 邮箱验证码', '8', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 轮播图', '9', 'add_banner');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 轮播图', '9', 'change_banner');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 轮播图', '9', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 课程', '10', 'add_course');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 课程', '10', 'change_course');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 课程', '10', 'delete_course');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 章节', '11', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 章节', '11', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 章节', '11', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 视频', '12', 'add_video');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 视频', '12', 'change_video');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 视频', '12', 'delete_video');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 课程资源', '13', 'add_courseresource');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 课程资源', '13', 'change_courseresource');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 课程资源', '13', 'delete_courseresource');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 城市', '14', 'add_citydict');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 城市', '14', 'change_citydict');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 城市', '14', 'delete_citydict');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 课程机构', '15', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 课程机构', '15', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 课程机构', '15', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 教师', '16', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 教师', '16', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 教师', '16', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 用户咨询', '17', 'add_userask');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 用户咨询', '17', 'change_userask');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 用户咨询', '17', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 课程评论', '18', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 课程评论', '18', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 课程评论', '18', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 用户收藏', '19', 'add_userfavourate');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 用户收藏', '19', 'change_userfavourate');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 用户收藏', '19', 'delete_userfavourate');
INSERT INTO `auth_permission` VALUES ('58', 'Can add 用户消息', '20', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('59', 'Can change 用户消息', '20', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete 用户消息', '20', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 用户课程', '21', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 用户课程', '21', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 用户课程', '21', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('64', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('65', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('66', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('67', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 课程', '10', 'view_course');
INSERT INTO `auth_permission` VALUES ('69', 'Can view 课程资源', '13', 'view_courseresource');
INSERT INTO `auth_permission` VALUES ('70', 'Can view 章节', '11', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('71', 'Can view 视频', '12', 'view_video');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 课程评论', '18', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('73', 'Can view 用户咨询', '17', 'view_userask');
INSERT INTO `auth_permission` VALUES ('74', 'Can view 用户课程', '21', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('75', 'Can view 用户收藏', '19', 'view_userfavourate');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 用户消息', '20', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('77', 'Can view 城市', '14', 'view_citydict');
INSERT INTO `auth_permission` VALUES ('78', 'Can view 课程机构', '15', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('79', 'Can view 教师', '16', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('80', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('81', 'Can view 轮播图', '9', 'view_banner');
INSERT INTO `auth_permission` VALUES ('82', 'Can view 邮箱验证码', '8', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('83', 'Can view 用户信息', '7', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('84', 'Can add Bookmark', '22', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('85', 'Can change Bookmark', '22', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('86', 'Can delete Bookmark', '22', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('87', 'Can add User Setting', '23', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('88', 'Can change User Setting', '23', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('89', 'Can delete User Setting', '23', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('90', 'Can add User Widget', '24', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('91', 'Can change User Widget', '24', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('92', 'Can delete User Widget', '24', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('93', 'Can view Bookmark', '22', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('94', 'Can view User Setting', '23', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('95', 'Can view User Widget', '24', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('96', 'Can add log entry', '25', 'add_log');
INSERT INTO `auth_permission` VALUES ('97', 'Can change log entry', '25', 'change_log');
INSERT INTO `auth_permission` VALUES ('98', 'Can delete log entry', '25', 'delete_log');
INSERT INTO `auth_permission` VALUES ('99', 'Can view log entry', '25', 'view_log');
INSERT INTO `auth_permission` VALUES ('100', 'Can add captcha store', '26', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('101', 'Can change captcha store', '26', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('102', 'Can delete captcha store', '26', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('103', 'Can view captcha store', '26', 'view_captchastore');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `captcha_captchastore`
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------

-- ----------------------------
-- Table structure for `courses_course`
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `favour_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11),
  `category` varchar(20),
  `teacher_id` int(11),
  `need_know` varchar(200),
  `teacher_tell` varchar(200),
  `cource_notice` varchar(100),
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_11456c5a` (`course_org_id`),
  KEY `courses_course_d9614d40` (`teacher_id`),
  CONSTRAINT `courses_cours_course_org_id_4d2c4aab_fk_orgnization_courseorg_id` FOREIGN KEY (`course_org_id`) REFERENCES `orgnization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_orgnization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `orgnization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES ('1', 'django 入门', 'django 入门', '<p>&nbsp; &nbsp; django 入门 <img src=\"/media/courses/ueditor/aobama_20170815095439_666.png\" alt=\"aobama.png\"/><img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/> </p>', 'cj', '11', '16', '12', 'courses/2017/08/mysql.jpg', '21', '2017-07-31 15:38:00.000000', '3', '', null, '', '', '', '0');
INSERT INTO `courses_course` VALUES ('2', '线性代数', '线性代数', '线性代数线性代数线性代数', 'gj', '12', '1231', '123', 'courses/2017/08/01.jpg', '11322', '2017-08-06 10:41:00.000000', '3', null, null, null, null, null, '0');
INSERT INTO `courses_course` VALUES ('3', 'JAVA 中级', 'JAVA 中级', 'JAVA 中级JAVA 中级', 'zj', '1', '3123', '23', 'courses/2017/08/01_small.jpg', '12312', '2017-08-06 10:43:00.000000', '4', null, null, null, null, null, '1');
INSERT INTO `courses_course` VALUES ('4', 'JAVA 高级', 'JAVA 高级', 'JAVA 高级JAVA 高级JAVA 高级', 'gj', '123', '4324', '324', 'courses/2017/08/02_small.jpg', '32424', '2017-08-06 10:43:00.000000', '10', null, null, null, null, null, '1');
INSERT INTO `courses_course` VALUES ('5', 'JAVa 初级', 'JAVa 初级', 'JAVa 初级JAVa 初级JAVa 初级', 'cj', '545', '2424', '234', 'courses/2017/08/02.jpg', '248', '2017-08-06 10:44:00.000000', '10', null, null, null, null, null, '1');
INSERT INTO `courses_course` VALUES ('6', 'python 初级', 'python 初级', 'python 初级python 初级python 初级', 'cj', '2312', '56', '456', 'courses/2017/08/02_mid.jpg', '573', '2017-08-06 10:44:00.000000', '9', 'web开发', '1', 'python基础你需要有', 'django的进阶开发', '可爱的公告', '0');
INSERT INTO `courses_course` VALUES ('7', 'python 高级', 'python 高级', 'python 高级', 'gj', '2432', '123', '5464', 'courses/2017/08/02_V6Rp6o0.jpg', '79', '2017-08-06 10:44:00.000000', '9', null, null, null, null, null, '0');
INSERT INTO `courses_course` VALUES ('8', 'Php初级', 'Php初级', 'Php初级Php初级Php初级Php初级', 'cj', '1', '123', '12', 'courses/2017/08/sass.jpg', '1', '2017-08-13 18:11:00.000000', '5', 'web开发', '2', '好好学习', '天天向上', '好好学习  | 天天向上', '0');
INSERT INTO `courses_course` VALUES ('9', 'php中级', 'php中级php中级', 'php中级php中级php中级', 'zj', '543', '134', '34', 'courses/2017/08/sass_yUViIT0.jpg', '4523', '2017-08-13 18:12:00.000000', '8', 'web开发', '2', '好好学习', '天天向上', '好好学习  | 天天向上', '0');
INSERT INTO `courses_course` VALUES ('10', 'php高级', 'php高级php高级php高级', 'php高级php高级php高级', 'zj', '4324', '134', '1433', 'courses/2017/08/sass_g1oYFZU.jpg', '0', '2017-08-13 18:13:00.000000', '8', 'web开发', '2', '好好学习', '天天向上', '好好学习  | 天天向上', '0');
INSERT INTO `courses_course` VALUES ('11', '前端开发', '前端开发', '前端开发前端开发', 'cj', '11', '0', '0', 'courses/2017/08/banner.jpg', '0', '2017-08-15 06:09:00.000000', '2', '前端开发', '1', '前端开发', '前端开发', '前端开发', '0');
INSERT INTO `courses_course` VALUES ('13', '清华概率论', '清华概率论', '清华概率论', 'zj', '121', '1', '1', 'courses/2017/08/aobama.png', '2', '2017-08-15 07:25:00.000000', '3', '', '1', '', '', '', '0');

-- ----------------------------
-- Table structure for `courses_courseresource`
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES ('1', '前端页面', 'course/resource/2017/08/banner.jpg', '2017-08-07 21:55:00.000000', '6');
INSERT INTO `courses_courseresource` VALUES ('2', '前端页面', 'course/resource/2017/08/banner_kelVSjP.jpg', '2017-08-07 21:55:00.000000', '6');
INSERT INTO `courses_courseresource` VALUES ('3', '前端页面', 'course/resource/2017/08/banner_47iACkR.jpg', '2017-08-07 21:55:00.000000', '6');
INSERT INTO `courses_courseresource` VALUES ('4', '后端页面', 'course/resource/2017/08/57a801860001c34b12000460.jpg', '2017-08-07 21:56:00.000000', '6');
INSERT INTO `courses_courseresource` VALUES ('5', '前端页面', 'course/resource/2017/08/aobama.png', '2017-08-15 06:09:00.000000', '11');

-- ----------------------------
-- Table structure for `courses_lesson`
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES ('2', '夜的第一章', '2017-08-06 16:12:00.000000', '6');
INSERT INTO `courses_lesson` VALUES ('3', '夜的第二章', '2017-08-06 16:12:00.000000', '6');
INSERT INTO `courses_lesson` VALUES ('4', '夜的第三章', '2017-08-06 16:12:00.000000', '6');
INSERT INTO `courses_lesson` VALUES ('6', '第一章', '2017-08-15 06:09:00.000000', '11');

-- ----------------------------
-- Table structure for `courses_video`
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES ('1', '1.1 最初章', '2017-08-06 16:21:00.000000', '2', 'http://ouer5413z.bkt.clouddn.com/2.mp4', '0');
INSERT INTO `courses_video` VALUES ('2', '2.1', '2017-08-06 16:22:00.000000', '3', 'https://www.douyu.com/', '0');
INSERT INTO `courses_video` VALUES ('3', '3.1', '2017-08-06 16:22:00.000000', '4', 'https://www.douyu.com/', '0');
INSERT INTO `courses_video` VALUES ('4', '1.2 次章', '2017-08-06 16:28:00.000000', '2', 'https://www.douyu.com/', '0');
INSERT INTO `courses_video` VALUES ('5', '1.3 三段', '2017-08-06 16:28:00.000000', '2', 'https://www.douyu.com/', '0');
INSERT INTO `courses_video` VALUES ('6', '2.2', '2017-08-06 16:30:00.000000', '3', 'https://www.douyu.com/', '0');
INSERT INTO `courses_video` VALUES ('7', '2.3', '2017-08-06 16:30:00.000000', '3', 'https://www.douyu.com/', '0');
INSERT INTO `courses_video` VALUES ('8', '3.2', '2017-08-06 16:30:00.000000', '4', 'https://www.douyu.com/', '0');
INSERT INTO `courses_video` VALUES ('9', '3.3', '2017-08-06 16:30:00.000000', '4', 'https://www.douyu.com/', '0');

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('4', '2017-07-31 10:36:41.330000', '5', 'bobby', '1', '已添加。', '7', '1');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('26', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('10', 'courses', 'course');
INSERT INTO `django_content_type` VALUES ('13', 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES ('11', 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES ('12', 'courses', 'video');
INSERT INTO `django_content_type` VALUES ('18', 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('17', 'operation', 'userask');
INSERT INTO `django_content_type` VALUES ('21', 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES ('19', 'operation', 'userfavourate');
INSERT INTO `django_content_type` VALUES ('20', 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES ('14', 'orgnization', 'citydict');
INSERT INTO `django_content_type` VALUES ('15', 'orgnization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('16', 'orgnization', 'teacher');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('9', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('25', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-07-30 11:20:49.204000');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-07-30 11:20:59.686000');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-07-30 11:21:02.041000');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-07-30 11:21:02.318000');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2017-07-30 11:21:03.752000');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-07-30 11:21:04.826000');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-07-30 11:21:05.968000');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-07-30 11:21:06.043000');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-07-30 11:21:06.870000');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-07-30 11:21:06.976000');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-07-30 11:21:07.095000');
INSERT INTO `django_migrations` VALUES ('12', 'sessions', '0001_initial', '2017-07-30 11:21:07.966000');
INSERT INTO `django_migrations` VALUES ('13', 'users', '0001_initial', '2017-07-30 12:06:24.729000');
INSERT INTO `django_migrations` VALUES ('14', 'courses', '0001_initial', '2017-07-31 01:11:42.744000');
INSERT INTO `django_migrations` VALUES ('15', 'operation', '0001_initial', '2017-07-31 01:11:47.435000');
INSERT INTO `django_migrations` VALUES ('16', 'orgnization', '0001_initial', '2017-07-31 01:11:49.513000');
INSERT INTO `django_migrations` VALUES ('17', 'users', '0002_banner_emailverifyrecord', '2017-07-31 01:11:50.149000');
INSERT INTO `django_migrations` VALUES ('18', 'users', '0003_auto_20170731_0942', '2017-07-31 01:42:55.893000');
INSERT INTO `django_migrations` VALUES ('19', 'users', '0004_auto_20170731_0943', '2017-07-31 01:43:54.569000');
INSERT INTO `django_migrations` VALUES ('20', 'xadmin', '0001_initial', '2017-07-31 11:05:41.097000');
INSERT INTO `django_migrations` VALUES ('21', 'xadmin', '0002_log', '2017-07-31 13:05:41.882000');
INSERT INTO `django_migrations` VALUES ('22', 'xadmin', '0003_auto_20160715_0100', '2017-07-31 13:05:42.637000');
INSERT INTO `django_migrations` VALUES ('23', 'captcha', '0001_initial', '2017-08-01 10:18:55.161000');
INSERT INTO `django_migrations` VALUES ('24', 'courses', '0002_auto_20170801_1018', '2017-08-01 10:18:55.244000');
INSERT INTO `django_migrations` VALUES ('25', 'users', '0005_auto_20170801_1018', '2017-08-01 10:18:55.496000');
INSERT INTO `django_migrations` VALUES ('26', 'orgnization', '0002_courseorg_category', '2017-08-03 09:02:57.083000');
INSERT INTO `django_migrations` VALUES ('27', 'orgnization', '0003_auto_20170803_1541', '2017-08-03 15:41:50.941000');
INSERT INTO `django_migrations` VALUES ('28', 'courses', '0003_course_course_org', '2017-08-03 20:13:16.743000');
INSERT INTO `django_migrations` VALUES ('29', 'orgnization', '0004_teacher_image', '2017-08-03 23:25:45.254000');
INSERT INTO `django_migrations` VALUES ('30', 'courses', '0004_course_category', '2017-08-06 14:22:30.320000');
INSERT INTO `django_migrations` VALUES ('31', 'courses', '0005_auto_20170806_1619', '2017-08-06 16:19:54.386000');
INSERT INTO `django_migrations` VALUES ('32', 'courses', '0006_video_learn_times', '2017-08-07 21:49:37.961000');
INSERT INTO `django_migrations` VALUES ('33', 'courses', '0007_course_teacher', '2017-08-07 22:23:11.893000');
INSERT INTO `django_migrations` VALUES ('34', 'courses', '0008_auto_20170807_2235', '2017-08-07 22:35:28.106000');
INSERT INTO `django_migrations` VALUES ('35', 'courses', '0009_course_cource_notice', '2017-08-08 21:31:24.030000');
INSERT INTO `django_migrations` VALUES ('36', 'orgnization', '0005_teacher_age', '2017-08-09 17:02:34.995000');
INSERT INTO `django_migrations` VALUES ('37', 'users', '0006_auto_20170812_1349', '2017-08-12 13:49:47.799000');
INSERT INTO `django_migrations` VALUES ('38', 'courses', '0010_course_is_banner', '2017-08-13 14:26:18.200000');
INSERT INTO `django_migrations` VALUES ('39', 'orgnization', '0006_courseorg_tag', '2017-08-13 14:26:19.094000');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('2xt81zymwgqe1kk7ihr15208pdl3dhth', 'NzY5YjlmNDE4YTBhZjJhNzZjZjU2Y2JkNzE5YTBkNTZlYmEyZDkwZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjJkMmRkY2FlMGIxNzgzNmEwOTcwYTljZGNlNzc2ZDliZjIxNzdlNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2017-08-15 08:08:02.710000');
INSERT INTO `django_session` VALUES ('4ofy7rplewp9d9vo9ns9wa84ebhx8rvn', 'OTVlNjkwNGQzMzhjNDI3OTk0MWIzMWRjNjc4Y2E4ZTgwOTQ2ZDNhZjp7IkxJU1RfUVVFUlkiOltbInVzZXJzIiwidXNlcnByb2ZpbGUiXSwiIl0sIl9hdXRoX3VzZXJfaGFzaCI6IjJkMmRkY2FlMGIxNzgzNmEwOTcwYTljZGNlNzc2ZDliZjIxNzdlNjkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2017-08-24 20:40:24.798000');
INSERT INTO `django_session` VALUES ('6egsv54vfoy7uwobyx683lhw4be5gb5d', 'MmU2MDhkMWFlZTkzZmM1Mzg2ZjY2MDk3NjNkYWUyYzBlMmNkMjI2ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjA1ODMxOGIxZDBmNjAwMzUwNzQ3YzU4YzY0ZWJhODM3YzE5ZDIzMzYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEyIn0=', '2017-09-01 16:45:37.957000');
INSERT INTO `django_session` VALUES ('7vsblkxcukztnn3mgdqo6kbwostiky7l', 'NDlmNGVjMDc0MzM3MTUzZGM1ZjQzMmM4YmJmZGZmZTc2MDY1OTg1OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJvcmduaXphdGlvbiIsInRlYWNoZXIiXSwiIl0sIl9hdXRoX3VzZXJfaGFzaCI6IjJkMmRkY2FlMGIxNzgzNmEwOTcwYTljZGNlNzc2ZDliZjIxNzdlNjkiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2017-08-23 19:31:09.602000');
INSERT INTO `django_session` VALUES ('9v9up29bub9qe8ceq3rfh7hbnievpjv2', 'ZjBmNjNjOWYwZjUwY2Y1ZjIxMzQxYWQ0ZGI4Yjc5NDE1MjEzZGQ5NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiMDMxZWU5NTJmMmY2MTVlMzI4ZGU2MmY0ZDE5YWZhNThlYWNjZTk4NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2017-08-27 21:42:15.177000');
INSERT INTO `django_session` VALUES ('cpaniyua0te4e6cb5qernm13606gthqw', 'OGNjMDcxMTk5YTQ0M2NiMWU4OGU4MTRlNDY3MzQzOTNjYjQwMDMyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiMmQyZGRjYWUwYjE3ODM2YTA5NzBhOWNkY2U3NzZkOWJmMjE3N2U2OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2017-08-23 07:47:58.287000');
INSERT INTO `django_session` VALUES ('fiqqq58ho5seoqihzjap9benm5ajkcah', 'NTY0NTJiZTA2NTczYWU4ZDc3Mjg2Y2FiNDY3NWQ3M2FkNDJkMWUwMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzMWVlOTUyZjJmNjE1ZTMyOGRlNjJmNGQxOWFmYTU4ZWFjY2U5ODYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2017-08-27 09:18:54.454000');
INSERT INTO `django_session` VALUES ('hevnkoerbtd4ed6s3vu0txpli8s1w02u', 'N2Y4ZDg3MzRmNDE5NTc5ZTBlMmQ5ZDg2ZGM2OWMzMzRkYzdkMTNmNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiIyZDJkZGNhZTBiMTc4MzZhMDk3MGE5Y2RjZTc3NmQ5YmYyMTc3ZTY5IiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2017-08-17 20:10:17.180000');
INSERT INTO `django_session` VALUES ('iwv4x6vhtcnr2fuxluikzkxjcgd0v784', 'OTAwOGYyZTA0NmUzMDFlZDNlZjE0MGEyZTdjMDg2NzE3Y2M0ZTNhMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsImNvdXJzZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiMmQyZGRjYWUwYjE3ODM2YTA5NzBhOWNkY2U3NzZkOWJmMjE3N2U2OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2017-08-17 22:57:42.425000');
INSERT INTO `django_session` VALUES ('jbqwobxxmqdjifampitjnf20re11vkv1', 'NjMzODM1NmI3NmJmNmViN2M4YTQwYjIwN2M0ODRjZjJhN2RhMjVkODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sib3Jnbml6YXRpb24iLCJjb3Vyc2VvcmciXSwiIl0sIl9hdXRoX3VzZXJfaGFzaCI6IjJkMmRkY2FlMGIxNzgzNmEwOTcwYTljZGNlNzc2ZDliZjIxNzdlNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIn0=', '2017-08-17 15:51:39.071000');
INSERT INTO `django_session` VALUES ('jjl7rfkw28jy1yh3tx5b6m7ed5d3fmit', 'N2Y4ZDg3MzRmNDE5NTc5ZTBlMmQ5ZDg2ZGM2OWMzMzRkYzdkMTNmNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiIyZDJkZGNhZTBiMTc4MzZhMDk3MGE5Y2RjZTc3NmQ5YmYyMTc3ZTY5IiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2017-08-18 12:47:36.801000');
INSERT INTO `django_session` VALUES ('o7d8liiy225v3kedqwbouqt9ojw1vjab', 'OGNjMDcxMTk5YTQ0M2NiMWU4OGU4MTRlNDY3MzQzOTNjYjQwMDMyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiMmQyZGRjYWUwYjE3ODM2YTA5NzBhOWNkY2U3NzZkOWJmMjE3N2U2OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2017-08-24 20:37:53.012000');

-- ----------------------------
-- Table structure for `operation_coursecomments`
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------
INSERT INTO `operation_coursecomments` VALUES ('1', 'df', '2017-08-09 07:30:35.298000', '6', '1');
INSERT INTO `operation_coursecomments` VALUES ('2', '一生轩你', '2017-08-09 07:35:04.535000', '6', '1');

-- ----------------------------
-- Table structure for `operation_userask`
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------
INSERT INTO `operation_userask` VALUES ('1', '缪文渊', '18817391235', 'django', '2017-08-03 19:47:57.291000');
INSERT INTO `operation_userask` VALUES ('2', '繆文君', '18817391236', 'flask', '2017-08-03 20:00:19.107000');

-- ----------------------------
-- Table structure for `operation_usercourse`
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES ('1', '2017-08-09 10:04:00.000000', '6', '1');
INSERT INTO `operation_usercourse` VALUES ('2', '2017-08-09 14:00:21.732000', '5', '1');
INSERT INTO `operation_usercourse` VALUES ('3', '2017-08-09 14:00:21.766000', '5', '1');
INSERT INTO `operation_usercourse` VALUES ('4', '2017-08-09 16:22:05.581000', '7', '1');
INSERT INTO `operation_usercourse` VALUES ('5', '2017-08-15 06:00:57.217000', '1', '6');
INSERT INTO `operation_usercourse` VALUES ('6', '2017-08-17 06:23:20.419000', '1', '1');

-- ----------------------------
-- Table structure for `operation_userfavourate`
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavourate`;
CREATE TABLE `operation_userfavourate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavourate_user_id_fee704d7_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavourate_user_id_fee704d7_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userfavourate
-- ----------------------------
INSERT INTO `operation_userfavourate` VALUES ('12', '10', '1', '2017-08-06 15:33:13.270000', '1');
INSERT INTO `operation_userfavourate` VALUES ('13', '8', '1', '2017-08-06 15:40:19.829000', '1');
INSERT INTO `operation_userfavourate` VALUES ('23', '8', '2', '2017-08-11 09:15:30.811000', '1');
INSERT INTO `operation_userfavourate` VALUES ('24', '5', '1', '2017-08-11 09:22:53.150000', '1');
INSERT INTO `operation_userfavourate` VALUES ('25', '2', '1', '2017-08-11 09:23:00.508000', '1');
INSERT INTO `operation_userfavourate` VALUES ('26', '2', '3', '2017-08-12 15:53:01.913000', '1');
INSERT INTO `operation_userfavourate` VALUES ('27', '1', '1', '2017-08-17 06:22:20.050000', '1');

-- ----------------------------
-- Table structure for `operation_usermessage`
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(200) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------
INSERT INTO `operation_usermessage` VALUES ('1', '1', '欢迎注册mmp', '1', '2017-08-15 11:22:25.000000');
INSERT INTO `operation_usermessage` VALUES ('2', '1', '啦啦啦', '1', '2017-08-22 11:31:58.000000');
INSERT INTO `operation_usermessage` VALUES ('3', '1', '额呵呵', '1', '2017-08-22 11:32:19.000000');

-- ----------------------------
-- Table structure for `orgnization_citydict`
-- ----------------------------
DROP TABLE IF EXISTS `orgnization_citydict`;
CREATE TABLE `orgnization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `desc` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orgnization_citydict
-- ----------------------------
INSERT INTO `orgnization_citydict` VALUES ('1', '北京市', '2017-08-03 08:46:00.000000', '北京市');
INSERT INTO `orgnization_citydict` VALUES ('2', '上海市', '2017-08-03 08:46:00.000000', '上海市');
INSERT INTO `orgnization_citydict` VALUES ('3', '广州市', '2017-08-03 08:46:00.000000', '广州市');
INSERT INTO `orgnization_citydict` VALUES ('4', '深圳市', '2017-08-03 08:46:00.000000', '深圳市');
INSERT INTO `orgnization_citydict` VALUES ('5', '天津市', '2017-08-03 08:46:00.000000', '天津市');

-- ----------------------------
-- Table structure for `orgnization_courseorg`
-- ----------------------------
DROP TABLE IF EXISTS `orgnization_courseorg`;
CREATE TABLE `orgnization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dec` longtext NOT NULL,
  `click_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `courses_num` int(11) NOT NULL,
  `students_num` int(11) NOT NULL,
  `tag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orgnization_courseor_city_id_a6739b68_fk_orgnization_citydict_id` (`city_id`),
  CONSTRAINT `orgnization_courseor_city_id_a6739b68_fk_orgnization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `orgnization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orgnization_courseorg
-- ----------------------------
INSERT INTO `orgnization_courseorg` VALUES ('2', '慕课网', '慕课网(IMOOC)是IT技能学习平台。慕课网(IMOOC)提供了丰富的移动端开发、php开发、web前端、android开发以及html5等视频教程资源公开课。', '1', '0', 'org/2017/08/imooc_CQtz2rY.png', '北京市', '2017-08-03 08:48:00.000000', '4', 'pxjg', '0', '0', '全国知名');
INSERT INTO `orgnization_courseorg` VALUES ('3', '清华大学', '清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1清华大学1', '0', '1', 'org/2017/08/njdx.jpg', '南昌', '2017-08-03 08:56:00.000000', '2', 'gr', '3', '0', '全国知名');
INSERT INTO `orgnization_courseorg` VALUES ('4', '慕课网1', '慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1', '0', '0', 'org/2017/08/imooc_qEaMov1.png', '南长街', '2017-08-03 08:56:00.000000', '3', 'pxjg', '10', '0', '全国知名');
INSERT INTO `orgnization_courseorg` VALUES ('5', '慕课网2', '慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2', '0', '0', 'org/2017/08/imooc_Y2Tonsq.png', '王企鹅屋企', '2017-08-03 08:57:00.000000', '2', 'pxjg', '0', '8999', '全国知名');
INSERT INTO `orgnization_courseorg` VALUES ('6', '慕课网3', '慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3', '0', '0', 'org/2017/08/imooc_OO2ykYP.png', '是非得失', '2017-08-03 08:57:00.000000', '5', 'pxjg', '0', '0', '全国知名');
INSERT INTO `orgnization_courseorg` VALUES ('7', '慕课网4', '慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4', '0', '0', 'org/2017/08/imooc_OO2ykYP_3YzMLX9.png', '似懂非懂是', '2017-08-03 08:57:00.000000', '2', 'pxjg', '0', '0', '全国知名');
INSERT INTO `orgnization_courseorg` VALUES ('8', '慕课网5', '慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5', '0', '0', 'org/2017/08/imooc_OO2ykYP_hT4fNRC.png', '多萨法', '2017-08-03 08:58:00.000000', '1', 'pxjg', '0', '0', '全国知名');
INSERT INTO `orgnization_courseorg` VALUES ('9', '慕课网6', '慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6', '0', '0', 'org/2017/08/imooc_Gn1sRjp.png', '防撒旦', '2017-08-03 08:58:00.000000', '2', 'pxjg', '0', '0', '全国知名');
INSERT INTO `orgnization_courseorg` VALUES ('10', '慕课网7', '发的所发生的', '0', '0', 'org/2017/08/imooc_OO2ykYP_9cduUqZ.png', '爱的色放', '2017-08-03 08:58:00.000000', '2', 'pxjg', '9', '10000', '全国知名');
INSERT INTO `orgnization_courseorg` VALUES ('11', '慕课网8', '阿斯蒂芬是打发打发', '0', '0', 'org/2017/08/imooc_OO2ykYP_eYaDKLK.png', '阿道夫', '2017-08-03 08:59:00.000000', '3', 'gx', '0', '0', '全国知名');

-- ----------------------------
-- Table structure for `orgnization_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `orgnization_teacher`;
CREATE TABLE `orgnization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `trait` varchar(50) NOT NULL,
  `click_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orgnization_teacher_org_id_e5320f64_fk_orgnization_courseorg_id` (`org_id`),
  CONSTRAINT `orgnization_teacher_org_id_e5320f64_fk_orgnization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `orgnization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orgnization_teacher
-- ----------------------------
INSERT INTO `orgnization_teacher` VALUES ('1', 'bobby', '100', 'XXXXX', 'Python 工程师', 'XXXX', '3', '0', '2017-08-03 20:07:00.000000', '8', 'teacher/2017/08/aobama.png', '20');
INSERT INTO `orgnization_teacher` VALUES ('2', '还是bobby', '5', 'XXXX', 'XXX', 'XXX', '11', '0', '2017-08-03 20:09:00.000000', '3', 'teacher/2017/08/aobama_CbNcPRy.png', '20');

-- ----------------------------
-- Table structure for `users_banner`
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_banner
-- ----------------------------
INSERT INTO `users_banner` VALUES ('1', '遇见好答案', 'banner/2017/08/57a801860001c34b12000460.jpg', 'http://www.baidu.com', '100', '2017-08-13 17:41:00.000000');
INSERT INTO `users_banner` VALUES ('2', '响应式开发', 'banner/2017/08/57aa86a0000145c512000460.jpg', 'http://www.baidu.com', '101', '2017-08-13 17:44:00.000000');

-- ----------------------------
-- Table structure for `users_emailverifyrecord`
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(30) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES ('2', 'admin', '412990319@qq.com', 'register', '2017-07-31 13:07:00.000000');
INSERT INTO `users_emailverifyrecord` VALUES ('3', 'bobby', 'admin@admin.com', 'register', '2017-07-31 13:17:00.000000');
INSERT INTO `users_emailverifyrecord` VALUES ('4', 'xm5Ejsd5Dx9hqD8q', '412990319@qq.com', 'register', '2017-08-01 19:35:49.450000');
INSERT INTO `users_emailverifyrecord` VALUES ('5', '9swJKpgnmjqsRRrN', 'miaowenyuan2000@126.com', 'register', '2017-08-01 19:41:06.506000');
INSERT INTO `users_emailverifyrecord` VALUES ('6', 'uBGKm9NG7vmNOZF9', 'miaowenyuan2000@126.com', 'register', '2017-08-01 19:47:08.199000');
INSERT INTO `users_emailverifyrecord` VALUES ('7', 'x1iTi6YNN8f4o38A', 'miaowenyuan2000@126.com', 'register', '2017-08-01 19:50:28.297000');
INSERT INTO `users_emailverifyrecord` VALUES ('8', 'uSrah13W3mDm1yz8', 'miaowenyuan2000@126.com', 'register', '2017-08-01 19:54:14.663000');
INSERT INTO `users_emailverifyrecord` VALUES ('9', 'sM4rc8BCWXKWdtFT', 'miaowenyuan2000@126.com', 'register', '2017-08-01 19:57:45.560000');
INSERT INTO `users_emailverifyrecord` VALUES ('10', 'N3mcwNJjUDaBtJuJ', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:03:02.803000');
INSERT INTO `users_emailverifyrecord` VALUES ('11', 'RkeCXzTxjmQLPy8U', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:04:21.789000');
INSERT INTO `users_emailverifyrecord` VALUES ('12', 'Id2t1ZGjwWL4rQ3M', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:05:34.237000');
INSERT INTO `users_emailverifyrecord` VALUES ('13', 'hBy6rQolY4DKvNZ9', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:08:52.891000');
INSERT INTO `users_emailverifyrecord` VALUES ('14', 'oapqjxE4cxYBVkWY', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:12:48.163000');
INSERT INTO `users_emailverifyrecord` VALUES ('15', 'IFPrk2E9qmNLD5zw', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:14:04.069000');
INSERT INTO `users_emailverifyrecord` VALUES ('16', '5VZOp8VOdyBcljqP', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:19:30.769000');
INSERT INTO `users_emailverifyrecord` VALUES ('17', 'qcpmgZtxXEsoBPKG', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:21:32.385000');
INSERT INTO `users_emailverifyrecord` VALUES ('18', 'jyWiEjvuhS4lAk90', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:22:26.868000');
INSERT INTO `users_emailverifyrecord` VALUES ('19', 'Pn71G06GZfCq0440', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:23:11.462000');
INSERT INTO `users_emailverifyrecord` VALUES ('20', 'Ag4gmnNg68pBKdZo', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:24:25.112000');
INSERT INTO `users_emailverifyrecord` VALUES ('21', 'C6yCgFZF89qIHLAH', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:25:31.178000');
INSERT INTO `users_emailverifyrecord` VALUES ('22', 'vUe9rRRrhYlH0v8l', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:28:24.124000');
INSERT INTO `users_emailverifyrecord` VALUES ('23', 'gUGcjaY32R5RQjYV', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:35:36.586000');
INSERT INTO `users_emailverifyrecord` VALUES ('24', '1aRHKu5FJfEqpZsi', 'miaowenyuan2000@126.com', 'register', '2017-08-01 20:37:38.731000');
INSERT INTO `users_emailverifyrecord` VALUES ('25', 'IydkqUaYHALHKnGK', 'miaowenyuan2017@sina.com', 'register', '2017-08-01 23:08:13.356000');
INSERT INTO `users_emailverifyrecord` VALUES ('26', '6LFrWiPnoPvEgkFH', '412990319@qq.com', 'register', '2017-08-02 06:20:00.698000');
INSERT INTO `users_emailverifyrecord` VALUES ('27', 'XGzQvQjeYGZ3R4nA', '4120319@qq.com', 'forget', '2017-08-02 08:30:22.323000');
INSERT INTO `users_emailverifyrecord` VALUES ('28', '7435ofHSf1HGWC9b', '412990319@qq.com', 'forget', '2017-08-02 08:36:04.319000');
INSERT INTO `users_emailverifyrecord` VALUES ('29', 'ndgSmS1XvN9lMyW6', '412990319@qq.com', 'forget', '2017-08-02 08:40:08.062000');
INSERT INTO `users_emailverifyrecord` VALUES ('30', 'lNpT', '412990319@qq.com', 'change_email', '2017-08-12 13:50:25.231000');
INSERT INTO `users_emailverifyrecord` VALUES ('31', 'n4LfDMMLz25kIn6B', '412990319@qq.com', 'forget', '2017-08-14 20:09:12.399000');
INSERT INTO `users_emailverifyrecord` VALUES ('32', 'H8veD0bwfTB2JXsF', '412990319@qq.com', 'forget', '2017-08-14 20:13:57.549000');
INSERT INTO `users_emailverifyrecord` VALUES ('33', 'VaV2uaVq9GW5qLPi', '412990319@qq.com', 'register', '2017-08-18 13:52:16.786000');
INSERT INTO `users_emailverifyrecord` VALUES ('34', 'RI6daGQLOEMyVAHi', '412990319@qq.com', 'register', '2017-08-18 13:57:07.884000');
INSERT INTO `users_emailverifyrecord` VALUES ('35', 'Z75GCIDS0rcSbpEA', '412990319@qq.com', 'register', '2017-08-18 13:58:23.472000');
INSERT INTO `users_emailverifyrecord` VALUES ('36', 'Zs6p2NyYnnmWVopI', '412990319@qq.com', 'register', '2017-08-18 16:32:18.617000');
INSERT INTO `users_emailverifyrecord` VALUES ('37', 'hq08sLBipP0Cf8IY', '412990319@qq.com', 'register', '2017-08-18 16:35:05.142000');
INSERT INTO `users_emailverifyrecord` VALUES ('38', 'tqF1oT7dVb5E2pq8', '412990319@qq.com', 'register', '2017-08-18 16:38:18.046000');
INSERT INTO `users_emailverifyrecord` VALUES ('39', 'xhYribEoDxepYtVM', '412990319@qq.com', 'register', '2017-08-18 16:44:53.270000');

-- ----------------------------
-- Table structure for `users_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birday` date DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$24000$ah5so2FDFq7A$3zWXBDavK2Rv2DlekVD9T3sU0g9NDMuc4bCai0hp1Ns=', '2017-08-15 06:01:24.375000', '1', 'yuan', '', '', '', '1', '1', '2017-07-31 01:44:00.000000', 'McGod', '2008-07-31', 'male', '中南海', '18817391235', 'image/2017/08/fqy.png');
INSERT INTO `users_userprofile` VALUES ('5', 'admin123', '2017-07-31 10:36:00.000000', '0', 'bobby', '', '', '1@12.com', '0', '1', '2017-07-31 10:36:00.000000', 'bobby', '2017-07-31', 'female', '202', '111', 'image/default.png');
INSERT INTO `users_userprofile` VALUES ('6', 'pbkdf2_sha256$24000$xkgaueXuodDV$aZjr8ws162JYDXC/ErB8RGRfDEoCjqS2/lub1vU6G0k=', '2017-08-15 06:00:32.656000', '0', 'wen', '', '', '', '1', '1', '2017-08-02 06:20:00.643000', '', null, 'female', '', null, 'image/default.png');
INSERT INTO `users_userprofile` VALUES ('12', 'pbkdf2_sha256$24000$7aS46YJxGsKt$t2ZKIcgKRnNIWahRYDr+avz4Oonlmzb+jl/3d2hhCCg=', '2017-08-18 16:45:37.868000', '0', 'hansmiao', '', '', '412990319@qq.com', '0', '1', '2017-08-18 16:44:36.512000', '', null, 'female', '', null, 'image/default.png');

-- ----------------------------
-- Table structure for `users_userprofile_groups`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `users_userprofile_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `xadmin_bookmark`
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
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for `xadmin_log`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2017-07-31 13:07:56.713000', '127.0.0.1', '2', 'EmailVerifyRecord object', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2017-07-31 13:17:12.354000', '127.0.0.1', '3', 'bobby(admin@admin.com)', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2017-07-31 15:40:07.584000', '127.0.0.1', '1', 'Course object', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2017-07-31 15:41:40.628000', '127.0.0.1', '1', 'Lesson object', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2017-08-03 08:46:24.360000', '127.0.0.1', '1', 'CityDict object', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2017-08-03 08:46:35.658000', '127.0.0.1', '2', 'CityDict object', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2017-08-03 08:46:43.764000', '127.0.0.1', '3', 'CityDict object', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2017-08-03 08:46:51.297000', '127.0.0.1', '4', 'CityDict object', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2017-08-03 08:47:03.548000', '127.0.0.1', '5', 'CityDict object', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2017-08-03 08:52:38.198000', '127.0.0.1', '1', 'CourseOrg object', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2017-08-03 08:52:40.924000', '127.0.0.1', '2', 'CourseOrg object', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2017-08-03 08:53:10.442000', '127.0.0.1', null, '', 'delete', '批量删除 1 个 课程机构', null, '1');
INSERT INTO `xadmin_log` VALUES ('13', '2017-08-03 08:56:49.293000', '127.0.0.1', '3', '清华大学', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2017-08-03 08:57:15.205000', '127.0.0.1', '4', '慕课网1', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2017-08-03 08:57:32.446000', '127.0.0.1', '5', '慕课网2', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2017-08-03 08:57:47.451000', '127.0.0.1', '6', '慕课网3', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2017-08-03 08:58:02.829000', '127.0.0.1', '7', '慕课网4', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2017-08-03 08:58:22.310000', '127.0.0.1', '8', '慕课网5', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2017-08-03 08:58:41.358000', '127.0.0.1', '9', '慕课网6', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2017-08-03 08:59:03.063000', '127.0.0.1', '10', '慕课网7', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2017-08-03 08:59:18.565000', '127.0.0.1', '11', '慕课网8', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2017-08-03 15:00:49.001000', '127.0.0.1', '6', '慕课网3', 'change', '已修改 city 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2017-08-03 15:01:04.424000', '127.0.0.1', '2', '慕课网', 'change', '已修改 city 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2017-08-03 15:32:28.415000', '127.0.0.1', '11', '慕课网8', 'change', '已修改 category 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2017-08-03 15:32:38.249000', '127.0.0.1', '3', '清华大学', 'change', '已修改 category 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2017-08-03 15:48:08.383000', '127.0.0.1', '10', '慕课网7', 'change', '已修改 students_num 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2017-08-03 15:50:46.630000', '127.0.0.1', '5', '慕课网2', 'change', '已修改 students_num 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2017-08-03 15:51:26.076000', '127.0.0.1', '4', '慕课网1', 'change', '已修改 courses_num 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2017-08-03 15:51:38.355000', '127.0.0.1', '10', '慕课网7', 'change', '已修改 courses_num 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2017-08-03 20:08:01.764000', '127.0.0.1', '1', 'Teacher object', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2017-08-03 20:10:08.025000', '127.0.0.1', '2', '还是bobby', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2017-08-03 22:57:42.007000', '127.0.0.1', '1', 'django 入门', 'change', '已修改 image 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2017-08-03 23:12:20.244000', '127.0.0.1', '1', 'django 入门', 'change', '已修改 course_org 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2017-08-03 23:26:29.448000', '127.0.0.1', '1', 'bobby', 'change', '已修改 image 。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2017-08-03 23:34:27.187000', '127.0.0.1', '2', '还是bobby', 'change', '已修改 image 。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2017-08-06 10:39:48.269000', '127.0.0.1', '1', 'django 入门', 'change', '已修改 image 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2017-08-06 10:42:17.004000', '127.0.0.1', '2', '线性代数', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2017-08-06 10:43:43.658000', '127.0.0.1', '3', 'JAVA 中级', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2017-08-06 10:44:06.764000', '127.0.0.1', '4', 'JAVA 高级', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2017-08-06 10:44:34.486000', '127.0.0.1', '5', 'JAVa 初级', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2017-08-06 10:44:51.491000', '127.0.0.1', '6', 'python 初级', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2017-08-06 10:45:18.634000', '127.0.0.1', '7', 'python 高级', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2017-08-06 10:47:01.959000', '127.0.0.1', '8', 'python 初级', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2017-08-06 14:17:36.984000', '127.0.0.1', '1', 'bobby', 'change', '已修改 org 。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2017-08-06 14:20:29.889000', '127.0.0.1', '1', 'Lesson object', 'change', '已修改 course 。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2017-08-06 14:22:47.763000', '127.0.0.1', '8', 'python 初级', 'change', '已修改 category 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2017-08-06 14:33:48.115000', '127.0.0.1', '1', 'UserCourse object', 'create', '已添加。', '21', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2017-08-06 14:36:08.011000', '127.0.0.1', '1', 'yuan', 'change', '已修改 last_login，address，mobile 和 image 。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2017-08-06 14:43:49.391000', '127.0.0.1', '1', 'UserCourse object', 'change', '已修改 course 。', '21', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2017-08-06 16:12:16.843000', '127.0.0.1', '2', 'Lesson object', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2017-08-06 16:12:38.949000', '127.0.0.1', '3', 'Lesson object', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2017-08-06 16:12:51.001000', '127.0.0.1', '4', 'Lesson object', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2017-08-06 16:21:41.947000', '127.0.0.1', '1', 'Video object', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2017-08-06 16:22:18.790000', '127.0.0.1', '2', 'Video object', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2017-08-06 16:22:56.216000', '127.0.0.1', '3', 'Video object', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2017-08-06 16:27:57.732000', '127.0.0.1', '1', 'Video object', 'change', '已修改 name 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('57', '2017-08-06 16:28:27.101000', '127.0.0.1', '4', 'Video object', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('58', '2017-08-06 16:28:30.524000', '127.0.0.1', '4', 'Video object', 'change', '没有字段被修改。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2017-08-06 16:28:58.858000', '127.0.0.1', '5', 'Video object', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('60', '2017-08-06 16:30:05.874000', '127.0.0.1', '2', '2.1', 'change', '已修改 name 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2017-08-06 16:30:13.902000', '127.0.0.1', '6', '2.2', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('62', '2017-08-06 16:30:21.182000', '127.0.0.1', '7', '2.3', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('63', '2017-08-06 16:30:31.929000', '127.0.0.1', '3', '3.1', 'change', '已修改 name 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('64', '2017-08-06 16:30:38.671000', '127.0.0.1', '8', '3.2', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('65', '2017-08-06 16:30:47.989000', '127.0.0.1', '9', '3.3', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('66', '2017-08-06 16:41:20.085000', '127.0.0.1', null, '', 'delete', '批量删除 1 个 课程', null, '1');
INSERT INTO `xadmin_log` VALUES ('67', '2017-08-07 21:56:27.947000', '127.0.0.1', '1', 'CourseResource object', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('68', '2017-08-07 21:56:35.185000', '127.0.0.1', '2', 'CourseResource object', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('69', '2017-08-07 21:56:44.986000', '127.0.0.1', '3', 'CourseResource object', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('70', '2017-08-07 21:57:10.398000', '127.0.0.1', '4', 'CourseResource object', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('71', '2017-08-07 22:26:07.983000', '127.0.0.1', '6', 'python 初级', 'change', '已修改 teacher 和 category 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('72', '2017-08-07 22:33:05.036000', '127.0.0.1', '1', 'bobby', 'change', '已修改 work_position 。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('73', '2017-08-07 22:36:16.433000', '127.0.0.1', '6', 'python 初级', 'change', '已修改 need_know 和 teacher_tell 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('74', '2017-08-08 21:32:22.972000', '127.0.0.1', '6', 'python 初级', 'change', '已修改 cource_notice 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('75', '2017-08-09 13:46:18.537000', '127.0.0.1', '1', 'UserCourse object', 'change', '没有字段被修改。', '21', '1');
INSERT INTO `xadmin_log` VALUES ('76', '2017-08-09 16:21:48.902000', '127.0.0.1', '1', '1.1 最初章', 'change', '已修改 url 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('77', '2017-08-09 17:03:08.490000', '127.0.0.1', '2', '还是bobby', 'change', '没有字段被修改。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('78', '2017-08-09 19:31:09.080000', '127.0.0.1', '2', '还是bobby', 'change', '已修改 click_num 。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('79', '2017-08-10 20:37:52.557000', '127.0.0.1', '1', 'yuan', 'change', '已修改 last_login 和 birday 。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('80', '2017-08-13 17:44:36.772000', '127.0.0.1', '1', 'Banner object', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('81', '2017-08-13 17:45:07.389000', '127.0.0.1', '2', 'Banner object', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('82', '2017-08-13 17:51:19.370000', '127.0.0.1', '11', '慕课网8', 'change', '没有字段被修改。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('83', '2017-08-13 18:12:45.243000', '127.0.0.1', '8', 'Php初级', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('84', '2017-08-13 18:13:22.557000', '127.0.0.1', '9', 'php中级', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('85', '2017-08-13 18:13:54.909000', '127.0.0.1', '10', 'php高级', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('86', '2017-08-15 06:00:14.079000', '127.0.0.1', '1', 'django 入门', 'change', '没有字段被修改。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('87', '2017-08-15 06:01:47.892000', '127.0.0.1', '1', 'django 入门', 'change', '没有字段被修改。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('88', '2017-08-15 06:10:16.828000', '127.0.0.1', '11', '前端开发', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('89', '2017-08-15 07:16:02.378000', '127.0.0.1', '12', '清华概率论', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('90', '2017-08-15 07:22:52.258000', '127.0.0.1', '12', '清华概率论', 'delete', '', '10', '1');

-- ----------------------------
-- Table structure for `xadmin_usersettings`
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', '1');
INSERT INTO `xadmin_usersettings` VALUES ('3', 'dashboard:home:pos', '', '6');
INSERT INTO `xadmin_usersettings` VALUES ('4', 'courses_course_editform_portal', 'box-0,lesson_set-group,,,,courseresource_set-group', '1');

-- ----------------------------
-- Table structure for `xadmin_userwidget`
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
