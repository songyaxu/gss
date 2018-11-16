/*
 Navicat Premium Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : rm-bp168uotg0aupq876yo.mysql.rds.aliyuncs.com:3306
 Source Schema         : gss

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 21/01/2018 22:34:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin');
INSERT INTO `admin` VALUES ('admin1', 'e00cf25ad42683b3df678c61f42c6bda', 'admin1');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (16, '222-附件', 'chrome.dll.sig', '\\webapp\\file/2018/01/05/180536\\chrome.dll.sig', '2018-01-05 18:05:37');
INSERT INTO `file` VALUES (17, '测试2222-附件', 'chrome.dll.sig', '\\webapp\\file\\2018\\01\\05\\181520\\chrome.dll.sig', '2018-01-05 18:15:20');
INSERT INTO `file` VALUES (18, 'wqwqq-附件', 'chrome.dll', '\\webapp\\file\\2018\\01\\05\\181641\\chrome.dll', '2018-01-05 18:16:42');
INSERT INTO `file` VALUES (19, '测试222222-附件', 'jira5.2升级到7.6.2.md', '\\webapp\\file/2018/01/04/183421/jira5.2升级到7.6.2.md', '2018-01-11 18:34:22');
INSERT INTO `file` VALUES (20, '测试题目1-附件', 'jirabackup.sh', '\\webapp\\file/2018/01/05/100300/jirabackup.sh', '2018-01-12 10:03:01');
INSERT INTO `file` VALUES (21, '测试文章-附件', 'jirabackup.sh', '\\webapp\\file/2018/01/03/150656/jirabackup.sh', '2018-01-17 15:06:56');
INSERT INTO `file` VALUES (22, '基于安卓的系统-附件', 'jirabackup.sh', '\\webapp\\file/2018/01/03/165936/jirabackup.sh', '2018-01-17 16:59:36');
INSERT INTO `file` VALUES (23, '基于WEB的选题-附件', 'rsyncd.conf', '\\webapp\\file/2018/01/03/171010/rsyncd.conf', '2018-01-17 17:10:10');
INSERT INTO `file` VALUES (24, 'C++的选题-附件', 'rsyncd.conf', '\\webapp\\file/2018/01/03/171521/rsyncd.conf', '2018-01-17 17:15:22');
INSERT INTO `file` VALUES (25, 'Centos7下查询java安装路径-附件', 'gss.sql', '/webapp/file/2018/01/04/131351/gss.sql', '2018-01-18 13:13:51');
INSERT INTO `file` VALUES (26, 'Your Company JIRA-附件', 'rsyncd.conf', '/webapp/file/2018/01/04/132020/rsyncd.conf', '2018-01-18 13:20:20');
INSERT INTO `file` VALUES (27, '222-附件', 'gss.sql', '/webapp/file/2018-01-19 16:09:00/gss.sql', '2018-01-19 16:09:00');
INSERT INTO `file` VALUES (28, '222-附件', 'gss.sql', '/webapp/file//2018/01/05/161122/gss.sql', '2018-01-19 16:11:23');
INSERT INTO `file` VALUES (29, '222-附件', 'favicon.ico', '/webapp/file//2018/01/19/161917/favicon.ico', '2018-01-19 16:19:18');
INSERT INTO `file` VALUES (30, '222-附件', 'gss.sql', '/webapp/file//2018/01/19/163016/gss.sql', '2018-01-19 16:30:17');
INSERT INTO `file` VALUES (31, '222-附件', 'gss.sql', '/webapp/file//2018/01/19/163710/gss.sql', '2018-01-19 16:37:10');
INSERT INTO `file` VALUES (32, '222-附件', 'jira above 7.2 export  excel file.txt', '/webapp/file//2018/01/19/164305/jira above 7.2 export  excel file.txt', '2018-01-19 16:43:05');
INSERT INTO `file` VALUES (33, '222-附件', 'jirabackup.sh', '/webapp/file//2018/01/19/164727/jirabackup.sh', '2018-01-19 16:47:27');
INSERT INTO `file` VALUES (34, 'wdasdw-附件', 'OnKeyDetector.log', '/webapp/file/2018/01/21/153401/OnKeyDetector.log', '2018-01-21 15:34:02');
INSERT INTO `file` VALUES (35, 'hahahha-附件', 'chrome.dll', '/webapp/file/2018/01/21/202548/chrome.dll', '2018-01-21 20:25:49');
INSERT INTO `file` VALUES (36, 'hahahha-附件', 'chrome.dll', '/webapp/file//2018/01/21/202924/chrome.dll', '2018-01-21 20:29:25');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `topic_id` int(11) NULL DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `stage` int(11) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `receive_id` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_id` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, '更新了状态', 12, 1, 1, NULL, '开题进行中', '111', '0141122', '2018-01-18 11:55:38');
INSERT INTO `message` VALUES (2, '更新了状态', 18, 1, 1, NULL, '开题进行中', '777', '0141122', '2018-01-18 13:33:30');
INSERT INTO `message` VALUES (3, '评论了', 12, 2, 1, NULL, '抓紧写开题报告', '111', '0141122', '2018-01-18 16:33:11');
INSERT INTO `message` VALUES (4, '更新了状态', 13, 1, 1, NULL, '开题进行中', '333', '0141122', '2018-01-18 16:12:33');
INSERT INTO `message` VALUES (5, '评论了', 12, 2, 1, NULL, '好的好的', '49746', '111', '2018-01-18 16:33:14');
INSERT INTO `message` VALUES (6, '评论了', 12, 2, 1, NULL, '老师，我已经提交了', '49746', '111', '2018-01-18 18:11:25');
INSERT INTO `message` VALUES (11, '评论了', 12, 2, 1, NULL, '好的', '111', '0141122', '2018-01-18 23:31:14');
INSERT INTO `message` VALUES (12, '更新了状态', 12, 4, 1, NULL, '流程结束', '111', '0141122', '2018-01-18 23:31:20');
INSERT INTO `message` VALUES (13, '更新了状态', 12, 1, 2, NULL, '此阶段已将开始', '111', '0141122', '2018-01-18 23:31:20');
INSERT INTO `message` VALUES (14, '更新了状态', 12, 4, 2, NULL, '流程结束', '111', '0141122', '2018-01-18 23:31:53');
INSERT INTO `message` VALUES (15, '更新了状态', 12, 1, 3, NULL, '此阶段已将开始', '111', '0141122', '2018-01-18 23:31:53');
INSERT INTO `message` VALUES (16, '评论了', 12, 2, 3, NULL, '认真书写哦', '111', '0141122', '2018-01-18 23:32:12');
INSERT INTO `message` VALUES (17, '更新了状态', 12, 4, 3, NULL, '流程结束', '111', '0141122', '2018-01-18 23:32:21');
INSERT INTO `message` VALUES (18, '更新了状态', 12, 1, 4, NULL, '此阶段已将开始', '111', '0141122', '2018-01-18 23:32:21');
INSERT INTO `message` VALUES (19, '评论了', 12, 2, 4, NULL, '开始了吗', '111', '0141122', '2018-01-18 23:32:46');
INSERT INTO `message` VALUES (20, '更新了状态', 12, 4, 4, NULL, '流程结束', '111', '0141122', '2018-01-18 23:32:51');
INSERT INTO `message` VALUES (21, '更新了状态', 12, 1, 5, NULL, '此阶段已将开始', '111', '0141122', '2018-01-18 23:32:51');
INSERT INTO `message` VALUES (22, '评论了', 12, 2, 5, NULL, '答辩准备好了吗？', '111', '0141122', '2018-01-18 23:33:10');
INSERT INTO `message` VALUES (23, '评论了', 12, 2, 5, NULL, '嗯嗯 准备好了', '49746', '111', '2018-01-18 23:34:11');
INSERT INTO `message` VALUES (24, '上传了文件', 12, 3, 5, NULL, '代码', '0141122', '111', '2018-01-19 16:32:30');
INSERT INTO `message` VALUES (25, '更新了文件', 12, 3, 5, NULL, '开题报告', '0141122', '111', '2018-01-19 16:32:35');
INSERT INTO `message` VALUES (26, '上传了', 12, 3, 5, NULL, '代码', '0141122', '111', '2018-01-19 16:37:10');
INSERT INTO `message` VALUES (27, '上传了', 12, 3, 5, NULL, '代码', '0141122', '111', '2018-01-19 16:43:05');
INSERT INTO `message` VALUES (28, '更新了文件', 12, 3, 5, NULL, '毕业论文', '0141122', '111', '2018-01-19 16:47:27');
INSERT INTO `message` VALUES (29, '填写了', 12, 2, 5, NULL, '答辩记录单', '111', '0141136', '2018-01-21 02:24:01');
INSERT INTO `message` VALUES (30, '更新了状态', 23, 0, 1, NULL, '开题进行中', '1012', '0141122', '2018-01-21 15:41:33');
INSERT INTO `message` VALUES (31, '评论了', 23, 2, 1, NULL, '我要开始了', '49746', '1012', '2018-01-21 15:44:48');
INSERT INTO `message` VALUES (32, '更新了状态', 24, 1, 1, NULL, '开题进行中', '10111', '0141122', '2018-01-21 20:59:05');
INSERT INTO `message` VALUES (33, '更新了状态', 24, 1, 1, NULL, '开题进行中', '10111', '0141122', '2018-01-21 20:59:15');
INSERT INTO `message` VALUES (34, '上传了', 24, 3, 0, NULL, '开题报告', '0141122', '10111', '2018-01-21 20:29:25');
INSERT INTO `message` VALUES (35, '评论了', 24, 2, 1, NULL, '你好', '10111', '0141122', '2018-01-21 20:31:02');
INSERT INTO `message` VALUES (36, '更新了状态', 24, 4, 1, NULL, '流程结束', '10111', '0141122', '2018-01-21 20:33:16');
INSERT INTO `message` VALUES (37, '更新了状态', 24, 1, 2, NULL, '此阶段已将开始', '10111', '0141122', '2018-01-21 20:33:16');
INSERT INTO `message` VALUES (38, '评论了', 24, 2, 2, NULL, 'jisdas', '10111', '0141122', '2018-01-21 20:33:38');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` int(11) NULL DEFAULT 0,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `major` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `dept` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '//状态：0：可选、1：已确定、2：开题报告、3、论文或程序指导、4：中期答辩、5论文或程序指导、6：答辩、7：结题',
  `last_login_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('101', '38b3eff8baf56627478ec76a704e9b52', '101', 0, '', '', '', '', 0, '2017-12-28 17:16:38');
INSERT INTO `student` VALUES ('10111', 'e10adc3949ba59abbe56e057f20f883e', 'bater', 0, '', '', '', '', 2, '2018-01-21 20:56:39');
INSERT INTO `student` VALUES ('1012', 'e10adc3949ba59abbe56e057f20f883e', 'hahaha', 0, '', '', '', '', 1, '2018-01-21 15:42:18');
INSERT INTO `student` VALUES ('111', '698d51a19d8a121ce581499d7b701668', 'aaa', 2, '2222@222.com', '22222', '软件工程', '软件学院', 5, '2018-01-21 22:29:29');
INSERT INTO `student` VALUES ('1212', 'a01610228fe998f515a72dd730294d87', '222', 0, '', '', '', '', 0, NULL);
INSERT INTO `student` VALUES ('222', 'bcbe3365e6ac95ea2c0343a2395834dd', '222', 0, '', '', '', '', 1, '2018-01-18 12:01:10');
INSERT INTO `student` VALUES ('333', '310dcbbf4cce62f762a2aaa148d556bd', '333', 0, '', '', '', '', 1, '2018-01-18 16:07:24');
INSERT INTO `student` VALUES ('444', '550a141f12de6341fba65b0ad0433500', '444', 0, '', '', '', '', 1, '2018-01-21 21:28:21');
INSERT INTO `student` VALUES ('555', '15de21c670ae7c3f6f3f1f37029303c9', '555', 0, '', '', '', '', 1, '2018-01-21 21:28:34');
INSERT INTO `student` VALUES ('666', 'fae0b27c451c728867a567e8c1bb4e53', '666', 0, '', '', '', '', 0, '2018-01-21 21:28:46');
INSERT INTO `student` VALUES ('777', 'f1c1592588411002af340cbaedd6fc33', '777', 0, '', '', '', '', 1, '2018-01-18 13:32:48');
INSERT INTO `student` VALUES ('888', '0a113ef6b61820daa5611c870ed8d5ee', '888', 0, '', '', '', '', 0, '2017-12-25 00:45:56');
INSERT INTO `student` VALUES ('999', 'b706835de79a2b4e80506f582af3676a', '999', 0, '', '', '', '', 0, NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` int(11) NOT NULL DEFAULT 0 COMMENT '0:-，1:男、2:女',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0:老师、1:答辩秘书',
  `last_login_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('0141122', 'a95d6dc46363af43fb3ad73f8045aa79', '王帅', 1, 'aaa@aaa.com', '222222222', 0, '2018-01-21 22:25:45');
INSERT INTO `teacher` VALUES ('0141123', 'b14349752e045c9103d9ae577cacb47c', '0141123', 0, NULL, NULL, 0, '2018-01-18 12:03:43');
INSERT INTO `teacher` VALUES ('0141124', 'aba4e8875f36b91528cc650f7aa92256', '0141124', 0, NULL, NULL, 0, '2018-01-18 13:14:41');
INSERT INTO `teacher` VALUES ('0141125', '049280fdbd8ad7a2860f08658ffc7bf4', '0141125', 0, NULL, NULL, 0, '2018-01-18 13:21:16');
INSERT INTO `teacher` VALUES ('0141126', 'e6f1fa20a5cd60aef73a270251ee097f', '0141126', 0, NULL, NULL, 0, '2018-01-18 13:21:32');
INSERT INTO `teacher` VALUES ('0141127', '6f8d815f25efa5009c6f9f68529a00bd', '0141127', 0, NULL, NULL, 0, NULL);
INSERT INTO `teacher` VALUES ('0141128', 'b38cbf32b4d12f402d0207be8aa6ff2a', '0141128', 0, NULL, NULL, 0, NULL);
INSERT INTO `teacher` VALUES ('0141129', 'ed1f8773e3617fa19f79a60ec68354c3', '0141129', 0, NULL, NULL, 0, NULL);
INSERT INTO `teacher` VALUES ('0141130', '17106ac76cca678d4b680e4a4b718a89', '0141130', 0, NULL, NULL, 0, NULL);
INSERT INTO `teacher` VALUES ('0141131', 'fd300f297790c230da5e4eadf1e3b3d2', '0141131', 0, NULL, NULL, 0, NULL);
INSERT INTO `teacher` VALUES ('0141132', '7c07e5ae087bb4df6530ae81ee9cb9bd', '0141132', 0, NULL, NULL, 0, NULL);
INSERT INTO `teacher` VALUES ('0141133', '5bbc01d7d7e8674271f21e1e2f9ce12d', '0141133', 0, NULL, NULL, 0, NULL);
INSERT INTO `teacher` VALUES ('0141134', 'f60d58fa9e1260a189b4c53164bc7ee5', '0141134', 0, NULL, NULL, 0, NULL);
INSERT INTO `teacher` VALUES ('0141135', 'bd2b8601387a00c0b5ab8fb1c9661fb1', '0141135', 0, NULL, NULL, 0, NULL);
INSERT INTO `teacher` VALUES ('0141136', '0e95a584412065afaad727573da6089f', '0141136', 1, NULL, NULL, 1, '2018-01-21 22:33:31');
INSERT INTO `teacher` VALUES ('0141137', '4fe2469a82ba41cc250a3131a72835b3', '0141137', 0, NULL, NULL, 0, NULL);
INSERT INTO `teacher` VALUES ('0141138', '107c16eea135df7791c2f1305ce6b752', '0141138', 0, NULL, NULL, 0, NULL);
INSERT INTO `teacher` VALUES ('0141139', '5797f934dbd4432e5d2bb6f03b5f8af2', '0141139', 0, NULL, NULL, 0, NULL);
INSERT INTO `teacher` VALUES ('0141140', '42142ab816e477380bf2124c0e3d3812', '0141140', 0, NULL, NULL, 0, NULL);
INSERT INTO `teacher` VALUES ('0141141', '6f8923e7482233493d09045ba3fcc0af', '0141141', 0, NULL, NULL, 0, NULL);
INSERT INTO `teacher` VALUES ('0141142', '0141142', '0141142', 0, NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `teacher_id` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student_id` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `secretary_id` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `valid` int(11) NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '//状态：0：可选、1：已确定、2：开题报告、3、论文或程序指导、4：中期答辩、5论文或程序指导、6：答辩、7：结题',
  `is_open` int(11) NOT NULL DEFAULT 0,
  `is_finished` int(11) NOT NULL DEFAULT 0,
  `attachment` int(11) NULL DEFAULT NULL,
  `proposal` int(11) NULL DEFAULT NULL,
  `medium_defense` int(11) NULL DEFAULT NULL,
  `thesis` int(11) NULL DEFAULT NULL,
  `code` int(11) NULL DEFAULT NULL,
  `record` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '答辩记录单---答辩秘书填写',
  `time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES (12, '222', '22', '22', '0141122', '111', '0141136', 1, 6, 0, 0, 16, 30, 27, 33, 32, '完成100%', '2018-01-05 18:05:37');
INSERT INTO `topic` VALUES (13, '测试2222', '222', '2222', '0141122', '333', NULL, 1, 1, 0, 0, 17, 0, 0, 0, NULL, NULL, '2018-01-05 18:15:20');
INSERT INTO `topic` VALUES (14, 'wqwqq', 'wqwqw', 'wqqw', '0141122', NULL, NULL, 1, 0, 0, 0, 18, 0, 0, 0, 0, NULL, '2018-01-05 18:16:42');
INSERT INTO `topic` VALUES (15, '测试222222', '3233', '323232', '0141122', NULL, NULL, 1, 0, 0, 0, 19, 0, 0, 0, 0, NULL, '2018-01-11 18:34:22');
INSERT INTO `topic` VALUES (16, '测试题目1', '32323', '3232', '0141123', NULL, NULL, 1, 0, 0, 0, 20, 0, 0, 0, 0, NULL, '2018-01-12 10:03:01');
INSERT INTO `topic` VALUES (17, '测试文章', '测试内容', '测试描述', '0141122', NULL, NULL, 1, 0, 0, 0, 21, 0, 0, 0, 0, NULL, '2018-01-17 15:06:57');
INSERT INTO `topic` VALUES (18, '基于安卓的系统', '给予安卓开发的系统', '安卓开发', '0141122', '777', '0141136', 1, 2, 0, 0, 22, 0, 0, 0, NULL, NULL, '2018-01-17 16:59:37');
INSERT INTO `topic` VALUES (19, '基于WEB的选题', '内容指导', '描述', '0141123', '222', NULL, 1, 1, 0, 0, 23, 0, 0, 0, NULL, NULL, '2018-01-17 17:10:10');
INSERT INTO `topic` VALUES (20, 'C++的选题', '选题', '选题', '0141122', NULL, NULL, 1, 0, 0, 0, 24, 0, 0, 0, 0, NULL, '2018-01-17 17:15:22');
INSERT INTO `topic` VALUES (21, 'Centos7下查询java安装路径', 'centos的java', '描述', '0141124', '444', NULL, 1, 1, 0, 0, 25, 0, 0, 0, NULL, NULL, '2018-01-18 13:13:51');
INSERT INTO `topic` VALUES (22, 'Your Company JIRA', 'ceshi', 'ceshi', '0141126', '555', NULL, 1, 1, 0, 0, 26, 0, 0, 0, NULL, NULL, '2018-01-18 13:20:21');
INSERT INTO `topic` VALUES (23, 'wdasdw', 'wasdwasdw', 'sdwasdwa', '0141122', '1012', NULL, 1, 1, 0, 0, 34, 0, 0, 0, 0, NULL, '2018-01-21 15:34:02');
INSERT INTO `topic` VALUES (24, 'hahahha', 'dsdsdsdsds', 'dssdsdsds', '0141122', '10111', NULL, 1, 3, 0, 0, 35, 36, 0, 0, 0, NULL, '2018-01-21 20:25:49');

-- ----------------------------
-- Table structure for topic_map
-- ----------------------------
DROP TABLE IF EXISTS `topic_map`;
CREATE TABLE `topic_map`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `topic_id` int(11) NOT NULL,
  `topic_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0：待审核 1：选题成功2：被拒绝3：已放弃',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topic_map
-- ----------------------------
INSERT INTO `topic_map` VALUES (1, '111', 'aaa', '0141122', '王帅', 12, '222', '2018-01-08 22:35:11', 1);
INSERT INTO `topic_map` VALUES (5, '111', 'aaa', '0141122', '王帅', 13, '测试2222', '2018-01-08 22:42:36', 2);
INSERT INTO `topic_map` VALUES (6, '111', 'aaa', '0141122', '王帅', 14, 'wqwqq', '2018-01-08 22:42:41', 2);
INSERT INTO `topic_map` VALUES (7, '111', 'aaa', '0141122', '王帅', 12, '222', '2018-01-12 09:43:30', 2);
INSERT INTO `topic_map` VALUES (8, '333', '333', '0141122', '王帅', 13, '测试2222', '2018-01-12 15:50:19', 1);
INSERT INTO `topic_map` VALUES (9, '333', '333', '0141122', '王帅', 14, 'wqwqq', '2018-01-12 15:54:55', 2);
INSERT INTO `topic_map` VALUES (10, '222', '222', '0141123', '0141123', 19, '基于WEB的选题', '2018-01-18 12:01:24', 1);
INSERT INTO `topic_map` VALUES (11, '444', '444', '0141124', '0141124', 21, 'Centos7下查询java安装路径', '2018-01-18 13:14:22', 1);
INSERT INTO `topic_map` VALUES (12, '555', '555', '0141126', '0141126', 22, 'Your Company JIRA', '2018-01-18 13:21:01', 1);
INSERT INTO `topic_map` VALUES (13, '777', '777', '0141122', '王帅', 17, '测试文章', '2018-01-18 13:32:58', 2);
INSERT INTO `topic_map` VALUES (14, '777', '777', '0141122', '王帅', 18, '基于安卓的系统', '2018-01-18 13:33:01', 1);
INSERT INTO `topic_map` VALUES (15, '1012', 'hahaha', '0141122', '王帅', 23, 'wdasdw', '2018-01-21 15:36:00', 1);
INSERT INTO `topic_map` VALUES (16, '10111', 'bater', '0141122', '王帅', 24, 'hahahha', '2018-01-21 20:26:52', 1);
INSERT INTO `topic_map` VALUES (17, '666', '666', '0141122', '王帅', 14, 'wqwqq', '2018-01-21 21:28:54', 0);
INSERT INTO `topic_map` VALUES (18, '666', '666', '0141122', '王帅', 15, '测试222222', '2018-01-21 21:29:00', 0);

SET FOREIGN_KEY_CHECKS = 1;
