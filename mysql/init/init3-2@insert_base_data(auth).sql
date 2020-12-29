use bb2_auth;
/*
 Navicat Premium Data Transfer

 Source Server         : 120.24.42.191
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 120.24.42.191:3306
 Source Schema         : bb2_auth

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 29/12/2020 18:23:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

truncate table `oauth_client_details`;
-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('admin', '', '{bcrypt}$2a$10$HBX6q6TndkgMxhSEdoFqWOUtctaJEMoXe49NWh8Owc.4MTunv.wXa', 'server', 'password,refresh_token,sms,third_oauth', NULL, 'oauth2', NULL, NULL, NULL, NULL), ('seller', NULL, '{bcrypt}$2a$10$HBX6q6TndkgMxhSEdoFqWOUtctaJEMoXe49NWh8Owc.4MTunv.wXa', 'server', 'password,refresh_token,sms,third_oauth', NULL, 'oauth2', NULL, NULL, NULL, NULL), ('shop', NULL, '{bcrypt}$2a$10$HBX6q6TndkgMxhSEdoFqWOUtctaJEMoXe49NWh8Owc.4MTunv.wXa', 'server', 'password,refresh_token,sms,third_oauth', NULL, 'oauth2', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

