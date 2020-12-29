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

 Date: 29/12/2020 17:38:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `add_time` int(11) NOT NULL DEFAULT 0,
  `last_login` int(11) NOT NULL DEFAULT 0,
  `last_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `nav_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `lang_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `paypwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付密码',
  `role_id` smallint(5) NULL DEFAULT 0 COMMENT '角色id',
  `suppliers_id` smallint(5) UNSIGNED NULL DEFAULT NULL COMMENT 'suppliers_id',
  `site_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0没有城市分站，1有',
  `open_teach` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`admin_id`) USING BTREE,
  INDEX `user_name`(`user_name`) USING BTREE,
  INDEX `agency_id`(`paypwd`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Table structure for expense_log
-- ----------------------------
DROP TABLE IF EXISTS `expense_log`;
CREATE TABLE `expense_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NULL DEFAULT NULL COMMENT '操作管理员',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '支出金额',
  `integral` int(10) NULL DEFAULT 0 COMMENT '赠送积分',
  `type` tinyint(1) NULL DEFAULT 0 COMMENT '支出类型0商家提现1用户提现2订单取消退款3订单售后退款4其他',
  `addtime` int(11) NULL DEFAULT NULL COMMENT '日志记录时间',
  `log_type_id` int(11) NULL DEFAULT 0 COMMENT '业务关联ID',
  `user_id` int(10) NULL DEFAULT 0 COMMENT '涉及会员id',
  `store_id` int(10) NULL DEFAULT 0 COMMENT '涉及商家id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '平台支出金额或赠送积分记录日志';

-- ----------------------------
-- Table structure for jobs_info
-- ----------------------------
DROP TABLE IF EXISTS `jobs_info`;
CREATE TABLE `jobs_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `app` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务名',
  `cron` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务执行CRON',
  `handler` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `param` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `timeout` int(11) NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `fail_retry_count` int(11) NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `last_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '上次调度时间',
  `next_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '下次调度时间',
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0、启用 1、已禁用',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务信息';

-- ----------------------------
-- Table structure for jobs_lock
-- ----------------------------
DROP TABLE IF EXISTS `jobs_lock`;
CREATE TABLE `jobs_lock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `owner` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '持有者',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 533756 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务锁';

-- ----------------------------
-- Table structure for jobs_log
-- ----------------------------
DROP TABLE IF EXISTS `jobs_log`;
CREATE TABLE `jobs_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `job_id` bigint(20) NOT NULL COMMENT '任务ID',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行地址',
  `handler` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务 handler',
  `param` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务参数',
  `fail_retry_count` int(11) NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `trigger_code` int(11) NOT NULL DEFAULT 0 COMMENT '触发器调度返回码',
  `trigger_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器调度类型',
  `trigger_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '触发器调度返回信息',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务调度日志';

-- ----------------------------
-- Table structure for jobs_registry
-- ----------------------------
DROP TABLE IF EXISTS `jobs_registry`;
CREATE TABLE `jobs_registry`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `app` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务名',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IP 地址',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0、启用 1、已禁用',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务注册信息';

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `log_id` bigint(16) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) NULL DEFAULT NULL,
  `log_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_time` int(10) NULL DEFAULT NULL,
  `log_type` tinyint(2) NULL DEFAULT 0 COMMENT '0默认1操作店铺2审核活动3处理投诉4其他',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

SET FOREIGN_KEY_CHECKS = 1;
