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

 Date: 29/12/2020 18:19:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

truncate table `admin`;
truncate table `jobs_info`;
-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'wyp001@163.com', '{bcrypt}$2a$10$/TFbsEFkPOJi3wnaLUHIZe2DEB0D67mnz14T029XXnnWwyn8.eIwG', 1461978472, 1609224305, '127.0.0.1', '', '', '', 1, 6, 0, 1), (2, 'shop', 'wyp001@163.com', '{bcrypt}$2a$10$zfttXeKuxIZu50s9A84GD.Y8dwZb2QxZlwUlg6prJrWOAR9T2x.um', 1461978472, 1588163219, '183.11.38.107', '', '', '', 1, 6, 0, 0), (3, 'test', '1377327082@qq.com', '{bcrypt}$2a$10$YCE3gtsoP4KFVKCcNxnfRO3ZfepsBvNspUex5ORaR/nz936ecfoI6', 1521599192, 1522113946, '183.11.39.155', NULL, '', '', 5, 1, 0, 1), (4, 'admin1', 'test@yahoo.com', '{bcrypt}$2a$10$vKNRbWZreW8tu7.vBw9PR.Z3X2RwuRvGfBqGlc3XMDulc7/C3g/IO', 1609014581, 0, '', NULL, '', '', 0, NULL, 0, 1);
INSERT INTO `jobs_info` VALUES (5, NULL, 'jobs-mall', '0 0/1 * * * ?', 'activityJobHandler', NULL, 30, 3, 1609223580000, 1609223640000, 'soubao', '每分钟执行一次', 0, NULL, 1592622709000), (6, NULL, 'jobs-mall', '0 0 1 1 * ?', 'mouthJobHandler', NULL, 30, 3, 1606755600000, 1609434000000, 'soubao', '每月1号凌晨1点执行一次', 0, NULL, 1592638707000), (7, NULL, 'jobs-order', '0 0 */1 * * ?', 'autoReceiveJob', NULL, 30, 3, 1598259600000, 1611478800000, 'soubao', '每小时执行一次,自动收货确认', 0, NULL, 1592638707000), (9, NULL, 'jobs-order', '0 0 0 1-2 * ?', 'autoConfirmJob', NULL, 30, 3, 1606838400000, 1609430400000, 'soubao', '每天执行一次,分销记录自动分成', 0, NULL, 1592638707000), (10, NULL, 'jobs-user', '0 0 1 1 * ?', 'mouthJobHandler', NULL, 30, 3, 1606755600000, 1609434000000, 'soubao', '删除一个月以前的短信', 0, NULL, 1592793884000), (23, NULL, 'jobs-mall', '1 0 0 * * ?', 'dayJobHandler', NULL, 30, 3, 1608912001000, 1609257601000, 'soubao', '每天0点01秒执行一次', 0, NULL, 1597113303000), (24, NULL, 'jobs-mall', '0 0 /1 * * ? ', 'hourJobHandler', NULL, 30, 3, 1609221600000, 1609225200000, 'soubao', '每小时执行一次', 0, NULL, 1597115699000);

SET FOREIGN_KEY_CHECKS = 1;
