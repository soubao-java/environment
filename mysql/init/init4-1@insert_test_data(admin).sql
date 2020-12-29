use bb2_admin;


/*
 Navicat Premium Data Transfer

 Source Server         : 120.24.42.191
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 120.24.42.191:3306
 Source Schema         : bb2_admin

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 29/12/2020 19:35:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

truncate table `log`;
truncate table `expense_log`;
truncate table `jobs_lock`;
truncate table `jobs_log`;
truncate table `jobs_registry`;
-- ----------------------------
-- Records of expense_log
-- ----------------------------
INSERT INTO `expense_log` VALUES (1, 1, 0.00, 0, 2, 1520237312, 4, 11, 3), (2, 1, 0.00, 0, 3, 1520303288, 11, 11, 4), (3, 1, 12.00, 0, 2, 1520305959, 11, 11, 4), (4, 1, 200.00, 0, 1, 1520307805, 1, 14, 0), (5, 1, 99.00, 0, 2, 1520476059, 40, 4, 4), (6, 1, 0.00, 0, 3, 1520478238, 41, 17, 4), (7, 1, 0.00, 0, 3, 1521109506, 90, 15, 14), (8, 1, 0.00, 0, 2, 1521186277, 101, 78, 2), (9, 1, 0.00, 0, 2, 1521454176, 165, 70, 30), (10, 1, 9.50, 0, 2, 1521514463, 193, 3, 30), (11, 1, 19.00, 0, 2, 1521514577, 190, 3, 12), (12, 1, 0.00, 0, 2, 1521534444, 219, 79, 30), (13, 1, 0.00, 0, 2, 1521535577, 224, 79, 30), (14, 1, 0.02, 0, 3, 1521541767, 207, 13, 9), (15, 1, 0.01, 0, 3, 1521547670, 254, 15, 14), (16, 1, 0.00, 0, 3, 1521548402, 240, 78, 9), (17, 1, 0.00, 0, 3, 1521549032, 211, 79, 30), (18, 1, 0.00, 0, 2, 1521623120, 282, 119, 30), (19, 1, 100.00, 0, 0, 1521768375, 7, 0, 4), (20, 1, 20.00, 0, 0, 1521768816, 8, 0, 4), (21, 1, 100.00, 0, 0, 1521768844, 5, 0, 4), (22, 1, 100.00, 0, 0, 1521768921, 4, 0, 4), (23, 1, 0.00, 0, 2, 1521785988, 438, 39, 1), (24, 1, 0.00, 0, 3, 1521881995, 521, 159, 4), (25, 1, 0.00, 0, 3, 1522045638, 542, 166, 4), (26, 1, 0.04, 0, 3, 1522048135, 218, 13, 9), (27, 1, 0.01, 0, 1, 1522122867, 19, 78, 0), (28, 1, 100.00, 0, 1, 1522122872, 23, 166, 0), (29, 1, 0.00, 0, 3, 1522153256, 617, 145, 4), (30, 1, 1.00, 0, 3, 1522153272, 117, 11, 9), (31, 1, 522.72, 0, 2, 1522202733, 606, 169, 4), (32, 1, 696.96, 0, 2, 1522203350, 608, 169, 4), (33, 1, 777.84, 0, 2, 1522218139, 652, 157, 4), (34, 1, 100.00, 0, 0, 1522287866, 2, 0, 4), (35, 1, 0.00, 0, 3, 1522315689, 898, 2, 1), (36, 1, 0.00, 0, 3, 1522315733, 897, 2, 1), (37, 1, 0.00, 0, 3, 1522317525, 917, 2, 1), (38, 1, 100.00, 0, 1, 1522375527, 25, 34, 0), (39, 1, 79.00, 0, 2, 1522403741, 945, 146, 4);

SET FOREIGN_KEY_CHECKS = 1;