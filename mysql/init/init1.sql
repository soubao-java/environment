DROP DATABASE IF EXISTS bb2_admin;
CREATE DATABASE bb2_admin;
DROP DATABASE IF EXISTS bb2_auth;
CREATE DATABASE bb2_auth;
DROP DATABASE IF EXISTS bb2_mall;
CREATE DATABASE bb2_mall;
DROP DATABASE IF EXISTS bb2_order;
CREATE DATABASE bb2_order;
DROP DATABASE IF EXISTS bb2_seller;
CREATE DATABASE bb2_seller;
DROP DATABASE IF EXISTS bb2_user;
CREATE DATABASE bb2_user;
DROP DATABASE IF EXISTS bb2_seata;
CREATE DATABASE bb2_seata;

CREATE USER `bb2_master_user`@`%` IDENTIFIED BY 'soubao@2020';
GRANT ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TEMPORARY TABLES, 
CREATE VIEW, DELETE, DROP, EVENT, EXECUTE, INDEX, INSERT, LOCK TABLES, REFERENCES, SELECT, SHOW VIEW, TRIGGER, 
UPDATE ON `bb2\_admin`.* TO `bb2_master_user`@`%` WITH GRANT OPTION;

GRANT ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TEMPORARY TABLES, 
CREATE VIEW, DELETE, DROP, EVENT, EXECUTE, INDEX, INSERT, LOCK TABLES, REFERENCES, SELECT, SHOW VIEW, TRIGGER, 
UPDATE ON `bb2\_auth`.* TO `bb2_master_user`@`%` WITH GRANT OPTION;

GRANT ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TEMPORARY TABLES, 
CREATE VIEW, DELETE, DROP, EVENT, EXECUTE, INDEX, INSERT, LOCK TABLES, REFERENCES, SELECT, SHOW VIEW, TRIGGER, 
UPDATE ON `bb2\_mall`.* TO `bb2_master_user`@`%` WITH GRANT OPTION;

GRANT ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TEMPORARY TABLES, 
CREATE VIEW, DELETE, DROP, EVENT, EXECUTE, INDEX, INSERT, LOCK TABLES, REFERENCES, SELECT, SHOW VIEW, TRIGGER, 
UPDATE ON `bb2\_order`.* TO `bb2_master_user`@`%` WITH GRANT OPTION;

GRANT ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TEMPORARY TABLES, 
CREATE VIEW, DELETE, DROP, EVENT, EXECUTE, INDEX, INSERT, LOCK TABLES, REFERENCES, SELECT, SHOW VIEW, TRIGGER, 
UPDATE ON `bb2\_seller`.* TO `bb2_master_user`@`%` WITH GRANT OPTION;

GRANT ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TEMPORARY TABLES, 
CREATE VIEW, DELETE, DROP, EVENT, EXECUTE, INDEX, INSERT, LOCK TABLES, REFERENCES, SELECT, SHOW VIEW, TRIGGER, 
UPDATE ON `bb2\_user`.* TO `bb2_master_user`@`%` WITH GRANT OPTION;
flush privileges;

GRANT ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TEMPORARY TABLES, 
CREATE VIEW, DELETE, DROP, EVENT, EXECUTE, INDEX, INSERT, LOCK TABLES, REFERENCES, SELECT, SHOW VIEW, TRIGGER, 
UPDATE ON `bb2\_seata`.* TO `bb2_master_user`@`%` WITH GRANT OPTION;
flush privileges;

-- ----------------------------
-- ----------------------------

use bb2_admin;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `add_time` int(11) NOT NULL DEFAULT 0,
  `last_login` int(11) NOT NULL DEFAULT 0,
  `last_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
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
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 307 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '平台支出金额或赠送积分记录日志' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3645 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务信息' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务锁' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务调度日志' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务注册信息' ROW_FORMAT = Dynamic;


SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- ----------------------------
use bb2_auth;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token`  (
  `token_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authentication` blob NULL,
  `refresh_token` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_approvals
-- ----------------------------
DROP TABLE IF EXISTS `oauth_approvals`;
CREATE TABLE `oauth_approvals`  (
  `userId` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clientId` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expiresAt` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `lastModifiedAt` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_ids` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token`  (
  `token_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code`  (
  `code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authentication` blob NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token`  (
  `token_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication` blob NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- ----------------------------
use bb2_mall;

/*
 Navicat Premium Data Transfer

 Source Server         : 120.24.42.191-3307
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 120.24.42.191:3307
 Source Schema         : bb2_mall

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 04/09/2020 15:47:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad`  (
  `ad_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告位置ID',
  `media_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告类型',
  `ad_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告名称',
  `ad_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `ad_code` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '投放时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `link_man` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '添加人',
  `link_email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '添加人邮箱',
  `link_phone` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '添加人联系电话',
  `click_count` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击量',
  `enabled` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `orderby` smallint(6) NULL DEFAULT 50 COMMENT '排序',
  `target` tinyint(1) NULL DEFAULT 0 COMMENT '是否开启浏览器新窗口',
  `bgcolor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景颜色',
  `ad_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'APP端广告位key,该值固定, APP端通过该key索引对应广告位',
  PRIMARY KEY (`ad_id`) USING BTREE,
  INDEX `enabled`(`enabled`) USING BTREE,
  INDEX `position_id`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ad_position
-- ----------------------------
DROP TABLE IF EXISTS `ad_position`;
CREATE TABLE `ad_position`  (
  `position_id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `position_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `ad_width` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告位宽度',
  `ad_height` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告位高度',
  `position_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告描述',
  `position_style` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板',
  `is_open` tinyint(1) NULL DEFAULT 0 COMMENT '0关闭1开启',
  PRIMARY KEY (`position_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 604 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `article_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT 0 COMMENT '类别ID',
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章作者',
  `author_email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者邮箱',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `article_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 2,
  `is_open` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件地址',
  `open_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章摘要',
  `click` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `publish_time` int(11) NULL DEFAULT NULL COMMENT '文章预告发布时间',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '文章缩略图',
  PRIMARY KEY (`article_id`) USING BTREE,
  INDEX `cat_id`(`cat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for article_cat
-- ----------------------------
DROP TABLE IF EXISTS `article_cat`;
CREATE TABLE `article_cat`  (
  `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `cat_type` smallint(6) NULL DEFAULT 0 COMMENT '默认分组',
  `parent_id` smallint(6) NULL DEFAULT 0 COMMENT '夫级ID',
  `show_in_nav` tinyint(1) NULL DEFAULT 0 COMMENT '是否导航显示',
  `sort_order` smallint(6) NULL DEFAULT 50 COMMENT '排序',
  `cat_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类描述',
  `keywords` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '搜索关键词',
  `cat_alias` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`cat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '品牌表',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '品牌名称',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '品牌logo',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌描述',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '品牌地址',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT 50 COMMENT '排序',
  `cat_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '品牌分类',
  `cat_id1` int(11) NULL DEFAULT 0 COMMENT '一级分类id',
  `cat_id2` int(10) NULL DEFAULT 0 COMMENT '二级分类id',
  `cat_id3` int(11) NULL DEFAULT 0 COMMENT '三级分类id',
  `is_hot` tinyint(1) NULL DEFAULT 0 COMMENT '是否推荐',
  `store_id` int(10) NULL DEFAULT 0 COMMENT '商家ID',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '0正常 1审核中 2审核失败 审核状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for brand_type
-- ----------------------------
DROP TABLE IF EXISTS `brand_type`;
CREATE TABLE `brand_type`  (
  `type_id` int(10) UNSIGNED NOT NULL COMMENT '类型id',
  `brand_id` int(10) UNSIGNED NOT NULL COMMENT '品牌id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类型与品牌对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '购物车表',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `session_id` char(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'session',
  `goods_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `goods_sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `market_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `goods_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '本店价',
  `member_goods_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '会员折扣价',
  `goods_num` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买数量',
  `spec_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品规格key 对应tp_spec_goods_price 表',
  `spec_key_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品规格组合名称',
  `bar_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品条码',
  `selected` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '购物车选中状态',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '加入购物车的时间',
  `prom_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠',
  `prom_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动id',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'sku',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家店铺ID',
  `shop_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '门店ID',
  `sgs_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '门店商品表ID',
  `item_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '规格ID',
  `combination_group_id` int(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '搭配购的组id/cart_id',
  `cart_store_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '属于哪个店铺的购物车，store_id是记哪个店铺的商品',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `session_id`(`session_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for combination
-- ----------------------------
DROP TABLE IF EXISTS `combination`;
CREATE TABLE `combination`  (
  `combination_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `is_on_sale` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上下架，0下，1上',
  `start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动有效起始时间',
  `end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动有效截止时间',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '审核状态,0待审核;1审核通过;2审核拒绝',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺id',
  `is_deleted` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`combination_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组合促销表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for combination_goods
-- ----------------------------
DROP TABLE IF EXISTS `combination_goods`;
CREATE TABLE `combination_goods`  (
  `combination_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规格名称',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `item_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `original_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '原价/商城价',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '优惠价格',
  `is_master` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1主0从'
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组合促销商品映射关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inc_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '优惠券名字',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '发放类型 0下单赠送 1 按用户发放 2 免费领取 3 线下发放',
  `use_type` tinyint(1) NULL DEFAULT 0 COMMENT '使用范围：0全店通用1指定商品可用2指定分类商品可用',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠券金额',
  `condition` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '使用条件',
  `createnum` int(11) NULL DEFAULT 10 COMMENT '发放数量',
  `send_num` int(11) NULL DEFAULT 0 COMMENT '已领取数量',
  `use_num` int(11) NULL DEFAULT 0 COMMENT '已使用数量',
  `send_start_time` int(11) NULL DEFAULT NULL COMMENT '发放开始时间',
  `send_end_time` int(11) NULL DEFAULT NULL COMMENT '发放结束时间',
  `use_start_time` int(11) NULL DEFAULT NULL COMMENT '使用开始时间',
  `use_end_time` int(11) NULL DEFAULT NULL COMMENT '使用结束时间',
  `add_time` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `store_id` int(10) NULL DEFAULT 0 COMMENT '商家店铺ID',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：1有效2无效',
  `coupon_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠券描述',
  `validity_day` int(1) NULL DEFAULT 0 COMMENT '使用有效期x天，仅用于新人优惠券',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE,
  INDEX `use_end_time`(`use_end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupon_list
-- ----------------------------
DROP TABLE IF EXISTS `coupon_list`;
CREATE TABLE `coupon_list`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `cid` int(8) NOT NULL DEFAULT 0 COMMENT '优惠券 对应coupon表id',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '发放类型 0下单赠送 1 按用户发放 2 免费领取 3 线下发放',
  `uid` int(8) NOT NULL DEFAULT 0 COMMENT '用户id',
  `order_id` int(8) NOT NULL DEFAULT 0 COMMENT '订单id',
  `get_order_id` int(11) NULL DEFAULT NULL COMMENT '送券订单ID',
  `use_time` int(11) NOT NULL DEFAULT 0 COMMENT '使用时间',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '优惠券兑换码',
  `send_time` int(11) NOT NULL DEFAULT 0 COMMENT '发放时间',
  `store_id` int(10) NULL DEFAULT 0 COMMENT '商家店铺ID',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '0未使用1已使用2已过期',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '删除标识;1:删除,0未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `code`(`code`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupon_price
-- ----------------------------
DROP TABLE IF EXISTS `coupon_price`;
CREATE TABLE `coupon_price`  (
  `coupon_price_id` smallint(4) NOT NULL AUTO_INCREMENT,
  `coupon_price_value` smallint(4) NOT NULL DEFAULT 0 COMMENT '优惠券面额',
  PRIMARY KEY (`coupon_price_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券面额表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for email_log
-- ----------------------------
DROP TABLE IF EXISTS `email_log`;
CREATE TABLE `email_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `send_role` int(1) NULL DEFAULT 0 COMMENT '角色，0管理员，1商家，2用户',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '邮件',
  `code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '发送时间',
  `send_id` int(11) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '1:发送成功,0:发送失败',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件内容',
  `scene` int(1) NOT NULL DEFAULT 0 COMMENT '发送场景,0普通邮件，1验证码',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '主题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flash_sale
-- ----------------------------
DROP TABLE IF EXISTS `flash_sale`;
CREATE TABLE `flash_sale`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '活动标题',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '参团商品ID',
  `item_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '对应spec_goods_price商品规格id',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '活动价格',
  `goods_num` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '商品参加活动数',
  `buy_limit` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '每人限购数',
  `buy_num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已购买人数',
  `order_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已下单数',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动描述',
  `start_time` int(11) UNSIGNED NOT NULL COMMENT '开始时间',
  `end_time` int(11) UNSIGNED NOT NULL COMMENT '结束时间',
  `is_end` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已结束',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `recommend` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '抢购状态：1正常，0待审核，2审核拒绝，3关闭活动，4商品售馨',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '软删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for floor
-- ----------------------------
DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor`  (
  `floor_id` smallint(3) NOT NULL AUTO_INCREMENT COMMENT 'pc首页楼层组件',
  `title_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '标题类型（0图片，1文字）',
  `title_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '楼层标题',
  `title_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '标题图片',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '楼层名称',
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '背景颜色',
  `sort` int(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`floor_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for floor_block
-- ----------------------------
DROP TABLE IF EXISTS `floor_block`;
CREATE TABLE `floor_block`  (
  `floor_block_id` int(6) NOT NULL AUTO_INCREMENT COMMENT '楼层商品模块主键',
  `floor_id` smallint(3) NOT NULL DEFAULT 0 COMMENT '楼层id',
  `sort` int(6) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`floor_block_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for floor_block_goods
-- ----------------------------
DROP TABLE IF EXISTS `floor_block_goods`;
CREATE TABLE `floor_block_goods`  (
  `floor_block_id` smallint(3) NOT NULL COMMENT '楼层商品模块主键',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品id'
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for floor_brand
-- ----------------------------
DROP TABLE IF EXISTS `floor_brand`;
CREATE TABLE `floor_brand`  (
  `floor_id` smallint(3) NOT NULL COMMENT '楼层id',
  `brand_id` smallint(5) NOT NULL DEFAULT 0 COMMENT '品牌id',
  `sort` int(6) NOT NULL DEFAULT 0 COMMENT '排序'
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for floor_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `floor_goods_category`;
CREATE TABLE `floor_goods_category`  (
  `floor_id` smallint(3) NOT NULL DEFAULT 0 COMMENT 'pc首页楼层组件',
  `cat_id` int(5) NOT NULL COMMENT '商品分类id',
  `sort` int(6) NOT NULL DEFAULT 0 COMMENT '排序'
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for floor_url
-- ----------------------------
DROP TABLE IF EXISTS `floor_url`;
CREATE TABLE `floor_url`  (
  `floor_url_id` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `floor_id` smallint(3) NOT NULL COMMENT '楼层id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '标题',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片链接',
  `location` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:活动图片(左边)，1：精选推荐（右边）',
  `href` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '跳转链接',
  `is_blank` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否新窗口打开',
  `sort` int(6) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`floor_url_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for freight_config
-- ----------------------------
DROP TABLE IF EXISTS `freight_config`;
CREATE TABLE `freight_config`  (
  `config_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `first_unit` double(16, 4) NOT NULL DEFAULT 0.0000 COMMENT '首(重：体积：件）',
  `first_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '首(重：体积：件）运费',
  `continue_unit` double(16, 4) UNSIGNED NOT NULL DEFAULT 0.0000 COMMENT '继续加（件：重量：体积）区间',
  `continue_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '继续加（件：重量：体积）的运费',
  `template_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '运费模板ID',
  `is_default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是默认运费配置.0不是，1是',
  `store_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺ID',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '运费配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for freight_region
-- ----------------------------
DROP TABLE IF EXISTS `freight_region`;
CREATE TABLE `freight_region`  (
  `template_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '模板id',
  `config_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '运费模板配置ID',
  `region_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'region表id',
  `store_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for freight_template
-- ----------------------------
DROP TABLE IF EXISTS `freight_template`;
CREATE TABLE `freight_template`  (
  `template_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `template_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 件数；1 商品重量；2 商品体积',
  `is_enable_default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否启用使用默认运费配置,0:不启用，1:启用',
  `store_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺Id',
  PRIMARY KEY (`template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '运费模板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for friend_link
-- ----------------------------
DROP TABLE IF EXISTS `friend_link`;
CREATE TABLE `friend_link`  (
  `link_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `link_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `link_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `orderby` tinyint(3) UNSIGNED NOT NULL DEFAULT 50 COMMENT '排序',
  `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示',
  `target` tinyint(1) NULL DEFAULT 1 COMMENT '是否新窗口打开',
  PRIMARY KEY (`link_id`) USING BTREE,
  INDEX `show_order`(`orderby`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `cat_id1` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一级分类id',
  `cat_id2` int(11) NULL DEFAULT 0 COMMENT '二级分类',
  `cat_id3` int(11) NULL DEFAULT 0 COMMENT '三级分类',
  `store_cat_id1` int(11) NULL DEFAULT 0 COMMENT '本店一级分类',
  `store_cat_id2` int(11) NULL DEFAULT 0 COMMENT '本店二级分类',
  `goods_sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `click_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击数',
  `brand_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '品牌id',
  `store_count` int(5) NOT NULL DEFAULT 10 COMMENT '库存数量',
  `collect_sum` int(10) NULL DEFAULT 0 COMMENT '商品收藏数',
  `comment_count` smallint(5) NULL DEFAULT 0 COMMENT '商品评论数',
  `weight` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品重量克为单位',
  `volume` double(10, 4) UNSIGNED NOT NULL DEFAULT 0.0000 COMMENT '商品体积。单位立方米',
  `market_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `shop_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '本店价',
  `cost_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '商品成本价',
  `exchange_integral` int(10) NOT NULL DEFAULT 0 COMMENT 'COMMENT \'积分兑换：0不参与积分兑换',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品关键词',
  `goods_remark` varchar(420) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品简单描述',
  `goods_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详细描述',
  `mobile_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '手机端商品详情',
  `original_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品上传原始图',
  `is_virtual` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是虚拟商品 1是 0否',
  `virtual_indate` int(11) NULL DEFAULT 0 COMMENT '虚拟商品有效期',
  `virtual_limit` smallint(6) NULL DEFAULT 0 COMMENT '虚拟商品购买上限',
  `virtual_refund` tinyint(1) NULL DEFAULT 1 COMMENT '是否允许过期退款， 1是，0否',
  `is_on_sale` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0下架1上架2违规下架',
  `is_free_shipping` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否包邮0否1是',
  `on_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品上架时间',
  `sort` smallint(4) UNSIGNED NOT NULL DEFAULT 50 COMMENT '商品排序',
  `is_recommend` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `is_new` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否新品',
  `is_hot` tinyint(1) NULL DEFAULT 0 COMMENT '是否热卖',
  `goods_type` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品所属类型id，取值表goods_type的id',
  `give_integral` int(11) NULL DEFAULT 0 COMMENT '购买商品赠送积分',
  `sales_sum` int(11) NULL DEFAULT 0 COMMENT '商品销量',
  `virtual_sales_sum` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '虚拟销售量',
  `prom_type` tinyint(1) NULL DEFAULT 0 COMMENT '0默认1抢购2团购3优惠促销4预售5虚拟(5其实没用)6拼团',
  `prom_id` int(11) NULL DEFAULT 0 COMMENT '优惠活动id',
  `distribut` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '佣金用于分销分成',
  `store_id` int(11) NULL DEFAULT 0 COMMENT '商家店铺ID',
  `spu` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'SPU',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'SKU',
  `goods_state` tinyint(1) NULL DEFAULT 1 COMMENT '0待审核1审核通过2审核失败',
  `close_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '违规下架原因',
  `suppliers_id` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '供应商ID',
  `template_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '运费模板ID',
  `is_own_shop` tinyint(1) NULL DEFAULT 0 COMMENT '1:第三方自营店,2:总平台自营店',
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '视频地址',
  `label_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品标签',
  `plate_top` int(10) NULL DEFAULT 0 COMMENT '关联版式头部',
  `plate_bottom` int(10) NULL DEFAULT 0 COMMENT '关联版式底部',
  `last_update` timestamp(0) NOT NULL DEFAULT '2020-06-10 00:00:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`goods_id`) USING BTREE,
  INDEX `goods_sn`(`goods_sn`) USING BTREE,
  INDEX `cat_id`(`cat_id1`) USING BTREE,
  INDEX `exchange_integral`(`exchange_integral`) USING BTREE,
  INDEX `goods_name`(`goods_name`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 253 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `goods_attr`;
CREATE TABLE `goods_attr`  (
  `goods_attr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品属性id自增',
  `goods_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `attr_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '属性id',
  `attr_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  `attr_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '属性价格',
  PRIMARY KEY (`goods_attr_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `attr_id`(`attr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `goods_attribute`;
CREATE TABLE `goods_attribute`  (
  `attr_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '属性名称',
  `type_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '属性分类id',
  `attr_index` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0不需要检索 1关键字检索',
  `attr_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下拉框展示给商家选择',
  `attr_input_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '2多行文本框,平台属性录入方式',
  `attr_values` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '可选值列表',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 50 COMMENT '属性排序',
  PRIMARY KEY (`attr_id`) USING BTREE,
  INDEX `cat_id`(`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
  `name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品分类名称',
  `mobile_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '手机端显示的商品分类名',
  `parent_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父id',
  `parent_id_path` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '家族图谱',
  `level` tinyint(1) NULL DEFAULT 0 COMMENT '等级',
  `sort_order` tinyint(1) UNSIGNED NOT NULL DEFAULT 50 COMMENT '顺序排序',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `image` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '分类图片',
  `is_hot` tinyint(1) NULL DEFAULT 0 COMMENT '是否推荐为热门分类',
  `cat_group` tinyint(1) NULL DEFAULT 0 COMMENT '分类分组默认0',
  `commission` tinyint(2) NULL DEFAULT 0 COMMENT '佣金比例',
  `commission_rate` tinyint(1) NULL DEFAULT 0 COMMENT '分佣比例用于分销',
  `type_id` int(11) NULL DEFAULT 0 COMMENT '对应的类型id(商品模型ID)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_collect
-- ----------------------------
DROP TABLE IF EXISTS `goods_collect`;
CREATE TABLE `goods_collect`  (
  `collect_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `goods_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `cat_id3` mediumint(8) NOT NULL DEFAULT 0,
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`collect_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_consult
-- ----------------------------
DROP TABLE IF EXISTS `goods_consult`;
CREATE TABLE `goods_consult`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品咨询id',
  `goods_id` int(11) NULL DEFAULT 0 COMMENT '商品id',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '网名',
  `add_time` int(11) NULL DEFAULT 0 COMMENT '咨询时间',
  `consult_type` tinyint(1) NULL DEFAULT 1 COMMENT '1 商品咨询 2 支付咨询 3 配送 4 售后',
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '咨询内容',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父id 用于管理员回复',
  `store_id` int(11) NULL DEFAULT 0 COMMENT '店铺id',
  `is_show` tinyint(1) NULL DEFAULT 0 COMMENT '是否显示',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '管理回复状态，0未回复，1已回复',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_coupon
-- ----------------------------
DROP TABLE IF EXISTS `goods_coupon`;
CREATE TABLE `goods_coupon`  (
  `coupon_id` int(8) NOT NULL COMMENT '优惠券id',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '指定的商品id：为零表示不指定商品',
  `goods_category_id` smallint(5) NOT NULL DEFAULT 0 COMMENT '指定的商品分类：为零表示不指定分类',
  PRIMARY KEY (`coupon_id`, `goods_id`, `goods_category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_images
-- ----------------------------
DROP TABLE IF EXISTS `goods_images`;
CREATE TABLE `goods_images`  (
  `img_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '图片id 自增',
  `goods_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `img_sort` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '商品缩略图排序,最小的拍最前面',
  `album_id` int(11) NULL DEFAULT NULL COMMENT '相册ID',
  PRIMARY KEY (`img_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 866 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_visit
-- ----------------------------
DROP TABLE IF EXISTS `goods_visit`;
CREATE TABLE `goods_visit`  (
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `visit_time` int(11) NOT NULL COMMENT '浏览时间',
  `cat_id1` int(11) NOT NULL COMMENT '商品一级分类',
  `cat_id2` int(11) NOT NULL COMMENT '商品二级分类',
  `cat_id3` int(11) NOT NULL COMMENT '商品三级分类',
  `visit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  PRIMARY KEY (`goods_id`, `user_id`, `visit_id`) USING BTREE,
  INDEX `visit_id`(`visit_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品浏览历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_buy
-- ----------------------------
DROP TABLE IF EXISTS `group_buy`;
CREATE TABLE `group_buy`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '团购ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '活动名称',
  `start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束时间',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `item_id` bigint(20) NULL DEFAULT 0 COMMENT '对应spec_goods_price商品规格id',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '团购价格',
  `goods_num` int(10) NULL DEFAULT 0 COMMENT '商品参团数',
  `buy_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品已购买数',
  `order_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已下单人数',
  `virtual_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '虚拟购买数',
  `rebate` decimal(10, 1) UNSIGNED NOT NULL DEFAULT 0.0 COMMENT '折扣',
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '本团介绍',
  `goods_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品原价',
  `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `recommend` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐 0.未推荐 1.已推荐',
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '查看次数',
  `store_id` int(10) NULL DEFAULT 0 COMMENT '商家店铺ID',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '团购状态，0待审核，1正常2拒绝3关闭',
  `is_end` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否结束,1结束 ，0正常',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '软删除',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团购商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_buy_goods_item
-- ----------------------------
DROP TABLE IF EXISTS `group_buy_goods_item`;
CREATE TABLE `group_buy_goods_item`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_buy_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '团购id',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `item_id` bigint(10) NOT NULL DEFAULT 0 COMMENT '对应spec_goods_price商品规格id',
  `price` decimal(10, 2) NOT NULL COMMENT '团购价格',
  `goods_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品参团数',
  `virtual_num` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟购买数',
  `rebate` decimal(10, 1) NOT NULL COMMENT '折扣',
  `goods_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '商品原价',
  `buy_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买数量',
  `order_num` int(11) NOT NULL DEFAULT 0 COMMENT '已下单人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '团购活动商品表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for help
-- ----------------------------
DROP TABLE IF EXISTS `help`;
CREATE TABLE `help`  (
  `help_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '帮助ID',
  `help_sort` tinyint(1) UNSIGNED NULL DEFAULT 255 COMMENT '排序',
  `help_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `help_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '帮助内容',
  `help_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '跳转链接',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '更新时间',
  `type_id` int(10) UNSIGNED NOT NULL COMMENT '帮助类型',
  `page_show` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '页面类型:1为店铺,2为会员,默认为1',
  `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  PRIMARY KEY (`help_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帮助内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for help_type
-- ----------------------------
DROP TABLE IF EXISTS `help_type`;
CREATE TABLE `help_type`  (
  `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名称',
  `sort_order` tinyint(1) UNSIGNED NULL DEFAULT 255 COMMENT '排序',
  `help_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'auto' COMMENT '调用编号(auto的可删除)',
  `is_show` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否显示,0为否,1为是,默认为1',
  `help_show` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '页面类型:1为店铺,2为会员,默认为1',
  `pid` int(8) NULL DEFAULT 0 COMMENT '默认0为一级分类',
  `level` tinyint(2) NULL DEFAULT 0,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帮助类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu_cfg
-- ----------------------------
DROP TABLE IF EXISTS `menu_cfg`;
CREATE TABLE `menu_cfg`  (
  `menu_id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '自定义名称',
  `default_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '默认名称',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否显示',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `article_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT 0 COMMENT '类别ID',
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `check_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '审核状态 0未审核  1通过 2拒绝',
  `check_describe` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核理由描述',
  `tags` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻标签',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '作者id（用户id）',
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章作者',
  `author_email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者邮箱',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `article_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 2,
  `is_open` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件地址',
  `open_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章摘要',
  `click` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `publish_time` int(11) NULL DEFAULT NULL COMMENT '文章预告发布时间',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '文章缩略图',
  `thumb2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '文章缩略图2',
  `thumb3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '文章缩略图3',
  `pickup_id` int(8) UNSIGNED NULL DEFAULT NULL COMMENT '新闻来源  发布新闻的管理员角色id',
  `type` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '新闻列表显示样式 0不显示图片 1左显示，2右显示 3上显示 4下显示',
  `source` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '新闻来源 、0=总平台 1=商家 2=用户',
  PRIMARY KEY (`article_id`) USING BTREE,
  INDEX `cat_id`(`cat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for news_cat
-- ----------------------------
DROP TABLE IF EXISTS `news_cat`;
CREATE TABLE `news_cat`  (
  `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `cat_type` smallint(6) NULL DEFAULT 0 COMMENT '默认分组',
  `parent_id` smallint(6) NULL DEFAULT 0 COMMENT '夫级ID',
  `show_in_nav` tinyint(1) NULL DEFAULT 0 COMMENT '是否导航显示',
  `sort_order` smallint(6) NULL DEFAULT 50 COMMENT '排序',
  `cat_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类描述',
  `keywords` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '搜索关键词',
  `cat_alias` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`cat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for news_comment
-- ----------------------------
DROP TABLE IF EXISTS `news_comment`;
CREATE TABLE `news_comment`  (
  `comment_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `article_id` smallint(5) NOT NULL DEFAULT 0 COMMENT '新闻ID',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `check_type` tinyint(255) UNSIGNED NULL DEFAULT 0 COMMENT '审核状态 0未审核  1通过 2拒绝',
  `check_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核理由描述',
  `is_delete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0正常显示，1虚拟删除不显示',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `like_num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞量',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pre_sell
-- ----------------------------
DROP TABLE IF EXISTS `pre_sell`;
CREATE TABLE `pre_sell`  (
  `pre_sell_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '预售id',
  `goods_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `item_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '规格id',
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规格名称',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '预售标题',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '预售描述',
  `deposit_goods_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订购商品数',
  `deposit_order_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订购订单数',
  `stock_num` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '预售库存',
  `sell_start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动开始时间',
  `sell_end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动结束时间',
  `pay_start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '尾款支付开始时间',
  `pay_end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '尾款支付结束时间',
  `deposit_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '订金',
  `price_ladder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '价格阶梯。预定人数达到多少个时，价格为多少钱',
  `delivery_time_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开始发货时间描述',
  `store_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺id',
  `is_finished` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已结束:0,正常；1，结束（待处理）；2,成功结束；3，失败结束。',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '团购状态，0待审核，1正常2拒绝3关闭',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '软删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`pre_sell_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prom_goods
-- ----------------------------
DROP TABLE IF EXISTS `prom_goods`;
CREATE TABLE `prom_goods`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '促销活动名称',
  `type` int(2) NOT NULL DEFAULT 0 COMMENT '促销类型:0直接打折,1减价优惠,2固定金额出售,3买就赠优惠券',
  `expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '优惠体现',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动描述',
  `start_time` int(11) NOT NULL COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '1正常，0管理员关闭',
  `is_end` tinyint(1) NULL DEFAULT 0 COMMENT '是否已结束',
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适用范围',
  `store_id` int(10) NULL DEFAULT 0 COMMENT '商家店铺id',
  `orderby` int(10) NULL DEFAULT 0 COMMENT '排序',
  `prom_img` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动宣传图片',
  `recommend` tinyint(1) NULL DEFAULT 0 COMMENT '是否推荐',
  `buy_limit` int(10) NULL DEFAULT NULL COMMENT '每人限购数',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '软删除',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prom_order
-- ----------------------------
DROP TABLE IF EXISTS `prom_order`;
CREATE TABLE `prom_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '活动名称',
  `type` int(2) NOT NULL DEFAULT 0 COMMENT '活动类型 0满额打折,1满额优惠金额,2满额送积分,3满额送优惠券',
  `money` float(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最小金额',
  `expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠体现',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动描述',
  `start_time` int(11) UNSIGNED NOT NULL COMMENT '活动开始时间',
  `end_time` int(11) UNSIGNED NOT NULL COMMENT '活动结束时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1正常，0管理员关闭',
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '适用范围',
  `prom_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动宣传图',
  `store_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家店铺id',
  `orderby` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `recommend` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除1为是,0为否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `level` tinyint(4) NULL DEFAULT 0,
  `parent_id` int(10) NULL DEFAULT NULL,
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0普通，1热门城市',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47500 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for seo
-- ----------------------------
DROP TABLE IF EXISTS `seo`;
CREATE TABLE `seo`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键词',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'SEO信息存放表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spec
-- ----------------------------
DROP TABLE IF EXISTS `spec`;
CREATE TABLE `spec`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格表',
  `name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格名称',
  `order` int(11) NULL DEFAULT 50 COMMENT '排序',
  `is_upload_image` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可上传规格图:0不可，1可以',
  `search_index` tinyint(1) NULL DEFAULT 0 COMMENT '是否需要检索',
  `cat_id1` int(11) NULL DEFAULT 0 COMMENT '一级分类',
  `cat_id2` int(11) NULL DEFAULT 0 COMMENT '二级分类',
  `cat_id3` int(11) NULL DEFAULT 0 COMMENT '三级分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spec_goods_price
-- ----------------------------
DROP TABLE IF EXISTS `spec_goods_price`;
CREATE TABLE `spec_goods_price`  (
  `item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规格商品id',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品id',
  `goods_mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品规格备注',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '规格键名',
  `key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '规格键名中文',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `store_count` int(11) NOT NULL DEFAULT 10 COMMENT '库存数量',
  `bar_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商品条形码',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'SKU',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺商家id',
  `spec_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规格商品主图',
  `prom_id` int(10) NOT NULL DEFAULT 0 COMMENT '参加活动id',
  `prom_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '参加活动类型',
  `cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '成本价',
  PRIMARY KEY (`item_id`) USING BTREE,
  INDEX `gk`(`goods_id`, `key`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE,
  INDEX `key`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 393 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spec_image
-- ----------------------------
DROP TABLE IF EXISTS `spec_image`;
CREATE TABLE `spec_image`  (
  `goods_id` int(11) NULL DEFAULT 0 COMMENT '商品规格图片表id',
  `spec_image_id` int(11) NULL DEFAULT 0 COMMENT 'tp_spec_item引用规格项id',
  `src` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '商品规格图片路径',
  `store_id` int(11) NULL DEFAULT 0 COMMENT '商家id',
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `spec_img_id`(`spec_image_id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spec_item
-- ----------------------------
DROP TABLE IF EXISTS `spec_item`;
CREATE TABLE `spec_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格项id',
  `spec_id` int(11) NULL DEFAULT NULL COMMENT '规格id',
  `item` varchar(54) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格项',
  `store_id` int(11) NULL DEFAULT 0 COMMENT '商家id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `spec_id`(`spec_id`) USING BTREE,
  INDEX `item`(`item`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 249 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spec_type
-- ----------------------------
DROP TABLE IF EXISTS `spec_type`;
CREATE TABLE `spec_type`  (
  `type_id` int(10) UNSIGNED NOT NULL COMMENT '类型id',
  `spec_id` int(10) UNSIGNED NOT NULL COMMENT '规格id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类型与规格对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_log
-- ----------------------------
DROP TABLE IF EXISTS `stock_log`;
CREATE TABLE `stock_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_spec` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `order_sn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `store_id` int(11) NULL DEFAULT NULL COMMENT '商家ID',
  `muid` int(11) NULL DEFAULT NULL COMMENT '操作用户ID',
  `stock` int(11) NULL DEFAULT NULL COMMENT '更改库存',
  `ctime` int(11) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2139 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_article
-- ----------------------------
DROP TABLE IF EXISTS `system_article`;
CREATE TABLE `system_article`  (
  `doc_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `doc_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用标识码',
  `doc_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `doc_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `doc_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间/修改时间',
  PRIMARY KEY (`doc_id`) USING BTREE,
  UNIQUE INDEX `doc_code`(`doc_code`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for team_activity
-- ----------------------------
DROP TABLE IF EXISTS `team_activity`;
CREATE TABLE `team_activity`  (
  `team_id` int(10) NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '拼团活动标题',
  `team_type` tinyint(1) NULL DEFAULT 0 COMMENT '拼团活动类型,0分享团1佣金团2抽奖团',
  `time_limit` int(11) NULL DEFAULT 0 COMMENT '成团有效期。单位（秒)',
  `team_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '拼团价',
  `needer` int(10) NULL DEFAULT 2 COMMENT '需要成团人数',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品名称',
  `bonus` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '团长佣金',
  `stock_limit` int(11) NULL DEFAULT 0 COMMENT '抽奖限量',
  `goods_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '商品id',
  `buy_limit` smallint(4) NULL DEFAULT 0 COMMENT '单次团购买限制数0为不限制',
  `sales_sum` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '已拼多少件',
  `virtual_num` int(10) NULL DEFAULT 0 COMMENT '虚拟销售基数',
  `share_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享标题',
  `share_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享描述',
  `share_img` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享图片',
  `store_id` int(11) NULL DEFAULT 0 COMMENT '商家id',
  `sort` smallint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_recommend` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '0待审核1正常2拒绝3关闭',
  `is_lottery` tinyint(1) NULL DEFAULT 0 COMMENT '是否已经抽奖.1是，0否',
  `add_time` int(15) NULL DEFAULT 0 COMMENT '创建时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '软删除',
  `item_id` int(10) NULL DEFAULT 0 COMMENT '商品规格id',
  PRIMARY KEY (`team_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for team_follow
-- ----------------------------
DROP TABLE IF EXISTS `team_follow`;
CREATE TABLE `team_follow`  (
  `follow_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `follow_user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '参团会员id',
  `follow_user_nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参团会员昵称',
  `follow_user_head_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员头像',
  `follow_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '参团时间',
  `order_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单id',
  `found_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开团ID',
  `found_user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开团人user_id',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拼团活动id',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '参团状态0:待拼单(表示已下单但是未支付)1拼单成功(已支付)2成团成功3成团失败',
  `is_win` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '抽奖团是否中奖',
  PRIMARY KEY (`follow_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参团表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for team_found
-- ----------------------------
DROP TABLE IF EXISTS `team_found`;
CREATE TABLE `team_found`  (
  `found_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `found_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开团时间',
  `found_end_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成团截止时间',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '团长id',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拼团活动id',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '团长用户名昵称',
  `head_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '团长头像',
  `order_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '团长订单id',
  `join` int(8) UNSIGNED NOT NULL DEFAULT 1 COMMENT '已参团人数',
  `need` int(8) UNSIGNED NOT NULL DEFAULT 1 COMMENT '需多少人成团',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '拼团价格',
  `goods_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品原价',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拼团状态0:待开团(表示已下单但是未支付)1:已经开团(团长已支付)2:拼团成功,3拼团失败',
  `bonus_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '团长佣金领取状态：0无1领取',
  `store_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺id',
  `is_auto` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已自动处理：0无1是',
  PRIMARY KEY (`found_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '开团表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for team_goods_item
-- ----------------------------
DROP TABLE IF EXISTS `team_goods_item`;
CREATE TABLE `team_goods_item`  (
  `team_id` int(10) UNSIGNED NOT NULL COMMENT '活动id',
  `goods_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `item_id` int(10) UNSIGNED NOT NULL COMMENT '规格id',
  `team_price` decimal(10, 2) NOT NULL COMMENT '拼团价',
  `sales_sum` int(11) NOT NULL DEFAULT 0 COMMENT '已拼数量',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已删除0否，1删除'
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for team_lottery
-- ----------------------------
DROP TABLE IF EXISTS `team_lottery`;
CREATE TABLE `team_lottery`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT 0 COMMENT '幸运儿手机',
  `order_id` int(11) NULL DEFAULT 0 COMMENT '订单id',
  `order_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '幸运儿手机',
  `team_id` int(11) NULL DEFAULT 0 COMMENT '拼团活动ID',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '会员昵称',
  `head_pic` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '幸运儿头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for user_distribution
-- ----------------------------
DROP TABLE IF EXISTS `user_distribution`;
CREATE TABLE `user_distribution`  (
  `user_id` int(11) NULL DEFAULT NULL COMMENT '分销会员id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `goods_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `cat_id` smallint(6) NULL DEFAULT 0 COMMENT '商品分类ID',
  `brand_id` mediumint(8) NULL DEFAULT 0 COMMENT '商品品牌',
  `share_num` int(10) NULL DEFAULT 0 COMMENT '分享次数',
  `sales_num` int(11) NULL DEFAULT 0 COMMENT '分销销量',
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `addtime` int(11) NULL DEFAULT NULL COMMENT '加入个人分销库时间',
  `store_id` int(11) NOT NULL COMMENT '商品对应的店铺ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 348 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户选择分销商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wx_material
-- ----------------------------
DROP TABLE IF EXISTS `wx_material`;
CREATE TABLE `wx_material`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信公众号素材',
  `media_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '微信媒体id',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '素材类型：text、image、news、video',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '素材名称',
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介，视频素材用',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '素材路径',
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片素材url / 视频素材封面路径',
  `update_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `media_id`(`media_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `wx_menu`;
CREATE TABLE `wx_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '0 view 1 click',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT 0 COMMENT '上级菜单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wx_mini
-- ----------------------------
DROP TABLE IF EXISTS `wx_mini`;
CREATE TABLE `wx_mini`  (
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'appid',
  `app_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'secret'
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '小程序配置信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wx_news
-- ----------------------------
DROP TABLE IF EXISTS `wx_news`;
CREATE TABLE `wx_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图文子素材id',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标题',
  `material_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '图片素材id，一个图片为素材可包括几个子图文',
  `author` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '作者',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'html内容',
  `digest` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '摘要',
  `thumb_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '封面链接',
  `thumb_media_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '封面媒体id',
  `wx_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信图文地址',
  `news_index` int(10) NULL DEFAULT NULL COMMENT '文章在图文消息中的位置，多图文消息时，此字段才有意义，第一篇为0',
  `content_source_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '原文链接',
  `show_cover_pic` int(1) NULL DEFAULT 0 COMMENT '是否显示封面',
  `need_open_comment` int(1) NULL DEFAULT 1 COMMENT '是否打开评论，0不打开，1打开',
  `only_fans_can_comment` int(1) NULL DEFAULT 0 COMMENT '是否粉丝才可评论，0所有人可评论，1粉丝才可评论',
  `update_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信图文' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wx_reply
-- ----------------------------
DROP TABLE IF EXISTS `wx_reply`;
CREATE TABLE `wx_reply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复类型keyword,default,follow',
  `match` int(1) NULL DEFAULT 0 COMMENT '匹配规则：0-半匹配，1-全匹配',
  `msg_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复消息类型text,news',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词，type为keyword时',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'text使用该自动存储文本',
  `material_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'news、image的素材id等',
  `update_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信自动回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT 'uid',
  `wxname` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公众号名称',
  `aeskey` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'aeskey',
  `encode` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'encode',
  `appid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'appsecret',
  `wxid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公众号原始ID',
  `weixin` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信号',
  `headerpic` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像地址',
  `token` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token',
  `mutual_token` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '交互token 与微信',
  `create_time` int(11) NOT NULL COMMENT 'create_time',
  `updatetime` int(11) NOT NULL COMMENT 'updatetime',
  `tplcontentid` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容模版ID',
  `share_ticket` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分享ticket',
  `share_dated` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'share_dated',
  `authorizer_access_token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'authorizer_access_token',
  `authorizer_refresh_token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'authorizer_refresh_token',
  `authorizer_expires` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'authorizer_expires',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型',
  `web_access_token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT ' 网页授权token',
  `web_refresh_token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'web_refresh_token',
  `web_expires` int(11) NOT NULL COMMENT '过期时间',
  `qr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'qr',
  `menu_config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '菜单',
  `wait_access` tinyint(1) NULL DEFAULT 0 COMMENT '微信接入状态,0待接入1已接入',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `uid_2`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信公共帐号' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------
-- ----------------------------
use bb2_order;
/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : bb2_order

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 12/05/2020 17:29:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `pay_pal` (
  `pay_id` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `client_id` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT 'clientID',
  `secret` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '密钥',
  PRIMARY KEY (`pay_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ali_pay`;
CREATE TABLE `ali_pay`  (
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '应用ID',
  `merchant_private_key` varchar(2555) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户私钥，您的PKCS8格式RSA2私钥',
  `alipay_public_key` varchar(2555) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付宝公钥'
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `goods_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `order_id` mediumint(8) NOT NULL DEFAULT 0 COMMENT '订单id',
  `rec_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单商品id',
  `shop_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '门店',
  `store_id` int(10) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `add_time` int(11) UNSIGNED NOT NULL COMMENT '评论时间',
  `ip_address` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论ip地址',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示;0:不显示；1:显示',
  `img` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '晒单图片',
  `spec_key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `goods_rank` decimal(2, 1) NOT NULL DEFAULT 0.0 COMMENT '商品评价等级，好 中 差',
  `zan_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞人数',
  `zan_userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `reply_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论回复数',
  `is_anonymous` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否匿名评价0:是；1不是',
  `impression` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '印象标签',
  `deleted` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '假删除标识;1:删除,0:未删除',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级评论ID',
  `order_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `id_value`(`goods_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for complain
-- ----------------------------
DROP TABLE IF EXISTS `complain`;
CREATE TABLE `complain`  (
  `complain_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉id',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '订单编号',
  `order_goods_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单商品ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '原告id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原告名称',
  `user_contact` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原告联系方式',
  `store_id` int(11) NULL DEFAULT NULL COMMENT '被告id',
  `store_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '被告名称',
  `complain_subject_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '投诉主题',
  `complain_subject_id` int(11) NULL DEFAULT NULL COMMENT '投诉主题id',
  `complain_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '投诉内容',
  `complain_pic` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投诉图片',
  `complain_time` int(11) NULL DEFAULT NULL COMMENT '投诉时间',
  `complain_handle_time` int(11) NOT NULL DEFAULT 0 COMMENT '投诉处理时间',
  `complain_handle_admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '投诉处理人id',
  `appeal_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '申诉内容',
  `appeal_time` int(11) NULL DEFAULT NULL COMMENT '申诉时间',
  `appeal_pic` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申诉图片',
  `final_handle_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最终处理意见',
  `final_handle_time` int(11) NULL DEFAULT NULL COMMENT '最终处理时间',
  `final_handle_admin_id` int(11) NULL DEFAULT NULL COMMENT '最终处理人id',
  `complain_state` tinyint(2) NOT NULL DEFAULT 1 COMMENT '投诉状态(1待处理2对话中3待仲裁4已完成)',
  `user_handle_time` int(11) NULL DEFAULT 0 COMMENT '用户提交仲裁时间',
  PRIMARY KEY (`complain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投诉表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for complain_subject
-- ----------------------------
DROP TABLE IF EXISTS `complain_subject`;
CREATE TABLE `complain_subject`  (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉主题id',
  `subject_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '投诉主题',
  `subject_desc` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '投诉主题描述',
  `subject_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '投诉主题状态(1-有效/2-失效)',
  PRIMARY KEY (`subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投诉主题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for complain_talk
-- ----------------------------
DROP TABLE IF EXISTS `complain_talk`;
CREATE TABLE `complain_talk`  (
  `talk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉对话id',
  `complain_id` int(11) NOT NULL COMMENT '投诉id',
  `talk_member_id` int(11) NOT NULL COMMENT '发言人id',
  `talk_member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发言人名称',
  `talk_member_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发言人类型(1-投诉人/2-被投诉人/3-平台)',
  `talk_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发言内容',
  `talk_state` tinyint(4) NOT NULL DEFAULT 0 COMMENT '发言状态(1-显示/2-不显示)',
  `talk_admin` int(11) NOT NULL DEFAULT 0 COMMENT '对话管理员，屏蔽对话人的id',
  `talk_time` int(11) NOT NULL COMMENT '对话发表时间',
  PRIMARY KEY (`talk_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投诉对话表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for distribut_level
-- ----------------------------
DROP TABLE IF EXISTS `distribut_level`;
CREATE TABLE `distribut_level`  (
  `level_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `level_type` tinyint(1) NULL DEFAULT 0 COMMENT '分销等级类别',
  `rate1` decimal(6, 2) NULL DEFAULT 0.00 COMMENT '一级佣金比例',
  `rate2` decimal(6, 2) NULL DEFAULT 0.00 COMMENT '二级佣金比例',
  `rate3` decimal(6, 2) NULL DEFAULT 0.00 COMMENT '三级佣金比例',
  `order_money` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '升级条件',
  `level_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for delivery_doc
-- ----------------------------
DROP TABLE IF EXISTS `delivery_doc`;
CREATE TABLE `delivery_doc`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '发货单ID',
  `order_id` int(11) UNSIGNED NOT NULL COMMENT '订单ID',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户ID',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `consignee` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人',
  `zipcode` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系手机',
  `country` int(11) UNSIGNED NOT NULL COMMENT '国ID',
  `province` int(11) UNSIGNED NOT NULL COMMENT '省ID',
  `city` int(11) UNSIGNED NOT NULL COMMENT '市ID',
  `district` int(11) UNSIGNED NOT NULL COMMENT '区ID',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `shipping_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流code',
  `shipping_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递名称',
  `shipping_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '运费',
  `invoice_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物流单号',
  `tel` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座机电话',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '管理员添加的备注信息',
  `best_time` int(11) NULL DEFAULT NULL COMMENT '友好收货时间',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否已经删除',
  `store_id` int(11) NULL DEFAULT 0 COMMENT '店铺商家id',
  `send_type` tinyint(1) NULL DEFAULT 0 COMMENT '发货方式0自填快递1在线预约2电子面单3无需物流',
  `store_address_consignee` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺发货人',
  `store_address_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发货人手机',
  `store_address_province_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发货省',
  `store_address_city_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发货市',
  `store_address_district_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发货县/区',
  `store_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发货地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1784 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发货单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for expose
-- ----------------------------
DROP TABLE IF EXISTS `expose`;
CREATE TABLE `expose`  (
  `expose_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报id',
  `expose_user_id` int(11) NOT NULL COMMENT '举报人id',
  `expose_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '举报人会员名',
  `expose_order_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '相关订单号',
  `expose_goods_id` int(11) NOT NULL COMMENT '被举报的商品id',
  `expose_goods_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '被举报的商品名称',
  `expose_type_id` int(11) NULL DEFAULT NULL COMMENT '举报类型',
  `expose_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '举报类型名称',
  `expose_subject_id` int(11) NULL DEFAULT NULL COMMENT '举报主题id',
  `expose_subject_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '举报主题',
  `expose_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '举报信息',
  `expose_pic` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片1',
  `expose_time` int(11) NOT NULL COMMENT '举报时间',
  `expose_store_id` int(11) NOT NULL COMMENT '被举报商品的店铺id',
  `expose_store_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名',
  `expose_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '举报状态(1未处理/2已处理)',
  `expose_handle_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报处理结果(1无效举报/2恶意举报/3有效举报)',
  `expose_handle_msg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '举报处理信息',
  `expose_handle_time` int(11) NULL DEFAULT 0 COMMENT '举报处理时间',
  `expose_handle_admin_id` int(11) NULL DEFAULT 0 COMMENT '管理员id',
  PRIMARY KEY (`expose_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '举报表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for expose_subject
-- ----------------------------
DROP TABLE IF EXISTS `expose_subject`;
CREATE TABLE `expose_subject`  (
  `expose_subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报主题id',
  `expose_subject_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '举报主题内容',
  `expose_subject_type_id` int(11) NOT NULL COMMENT '举报类型id',
  `expose_subject_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '举报类型名称 ',
  `expose_subject_state` tinyint(11) NOT NULL DEFAULT 0 COMMENT '举报主题状态(1可用/2失效)',
  PRIMARY KEY (`expose_subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '举报主题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for expose_type
-- ----------------------------
DROP TABLE IF EXISTS `expose_type`;
CREATE TABLE `expose_type`  (
  `expose_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报类型id',
  `expose_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '举报类型名称 ',
  `expose_type_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '举报类型描述',
  `expose_type_state` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报类型状态(1有效/2失效)',
  PRIMARY KEY (`expose_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '举报类型表' ROW_FORMAT = Dynamic;

CREATE TABLE `wx_pay` (
  `mch_id` varchar(255) NOT NULL DEFAULT '' COMMENT '微信支付的商户id',
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT '微信支付的商户密钥',
  `apiclient_cert` varchar(255) NOT NULL DEFAULT '' COMMENT '支付商户证书',
  `apiclient_key` varchar(255) NOT NULL DEFAULT '' COMMENT '支付商户证书密钥'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `master_order_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主订单号',
  `order_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单状态.0待确认，1已确认，2已收货，3已取消，4已完成，5已作废',
  `pay_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付状态.0待支付，1已支付，2部分支付，3已退款，4拒绝退款',
  `shipping_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发货状态',
  `consignee` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人',
  `country` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '国家',
  `province` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '省份',
  `city` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '城市',
  `district` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '县区',
  `twon` int(11) NOT NULL DEFAULT 0 COMMENT '乡镇',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '地址',
  `zipcode` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机',
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮件',
  `shipping_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物流code',
  `shipping_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物流名称',
  `shipping_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `shipping_time` int(11) NULL DEFAULT 0 COMMENT '最新发货时间',
  `pay_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付code',
  `pay_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `invoice_title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发票抬头',
  `taxpayer` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '纳税人识别号',
  `goods_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品总价',
  `user_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '使用余额',
  `coupon_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '优惠了多少',
  `integral` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用积分',
  `integral_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '使用积分抵多少钱',
  `order_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '应付款金额',
  `total_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '订单总价',
  `paid_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '订金',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下单时间',
  `confirm_time` int(10) NULL DEFAULT 0 COMMENT '收货确认时间',
  `pay_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付时间',
  `transaction_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '第三方平台交易流水号',
  `prom_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '活动id',
  `prom_type` tinyint(2) NULL DEFAULT 0 COMMENT '订单类型：0默认1抢购2团购3优惠4预售5虚拟6拼团',
  `order_prom_id` int(10) NOT NULL DEFAULT 0 COMMENT '订单活动id',
  `order_prom_amount` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '订单活动优惠金额',
  `discount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格调整',
  `user_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户备注',
  `admin_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '管理员备注',
  `parent_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '父单单号',
  `store_id` int(10) NULL DEFAULT 0 COMMENT '店铺ID',
  `order_store_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '记录是属于哪个店铺下的订单，store_id是属于哪个d店铺发货',
  `is_comment` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否评价（0：未评价；1：已评价）',
  `shop_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '自提点门店id',
  `deleted` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '用户假删除标识,1:删除,0未删除',
  `order_statis_id` int(1) NULL DEFAULT 0 COMMENT '结算id如果为0为未结算',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `order_sn`(`order_sn`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `master_order_sn`(`master_order_sn`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4719 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_action
-- ----------------------------
DROP TABLE IF EXISTS `order_action`;
CREATE TABLE `order_action`  (
  `action_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单ID',
  `action_user` int(11) NOT NULL DEFAULT 0 COMMENT '操作人 0 为用户操作，其他为管理员id',
  `order_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `shipping_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `pay_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `action_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作备注',
  `log_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作时间',
  `status_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态描述',
  `user_type` tinyint(1) NULL DEFAULT 0 COMMENT '0管理员1商家2前台用户',
  `store_id` int(11) NULL DEFAULT 0 COMMENT '商家店铺ID',
  PRIMARY KEY (`action_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12686 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_comment
-- ----------------------------
DROP TABLE IF EXISTS `order_comment`;
CREATE TABLE `order_comment`  (
  `order_commemt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单评论索引id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `describe_score` decimal(2, 1) NOT NULL COMMENT '描述相符分数（0~5）',
  `seller_score` decimal(2, 1) NOT NULL COMMENT '卖家服务分数（0~5）',
  `logistics_score` decimal(2, 1) NOT NULL COMMENT '物流服务分数（0~5）',
  `commemt_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '评分时间',
  `deleted` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '不删除0；删除：1',
  PRIMARY KEY (`order_commemt_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 337 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单评分表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods`  (
  `rec_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表id自增',
  `order_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单id',
  `goods_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `goods_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_num` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT '购买数量',
  `final_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品实际购买价格',
  `goods_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '本店价',
  `cost_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品成本价',
  `member_goods_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '会员折扣价',
  `give_integral` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买商品赠送积分',
  `spec_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品规格key',
  `spec_key_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规格对应的中文名字',
  `bar_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '条码',
  `is_comment` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否评价',
  `prom_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠, 4 预售',
  `prom_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动id',
  `is_send` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0未发货，1已发货，2已换货，3已退货',
  `delivery_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发货单ID',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'sku',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家店铺id',
  `commission` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家抽成比例',
  `is_checkout` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已跟商家结账0 否1是',
  `deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:为删除；1：已删除',
  `distribut` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '三级分销的金额',
  `shop_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '门店ID',
  PRIMARY KEY (`rec_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4779 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_statis
-- ----------------------------
DROP TABLE IF EXISTS `order_statis`;
CREATE TABLE `order_statis`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_date` int(11) NOT NULL COMMENT '开始日期',
  `end_date` int(11) NOT NULL COMMENT '结束日期',
  `order_totals` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单商品金额',
  `shipping_totals` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '物流运费',
  `return_totals` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退款金额',
  `return_integral` int(11) NULL DEFAULT 0 COMMENT '退还积分',
  `commis_totals` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '平台抽成',
  `give_integral` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '送出积分金额',
  `result_totals` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '本期应结',
  `create_date` int(11) NULL DEFAULT NULL COMMENT '创建记录日期',
  `store_id` int(11) NULL DEFAULT 0 COMMENT '店铺id',
  `order_prom_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '优惠价',
  `coupon_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '优惠券抵扣',
  `integral` int(11) NULL DEFAULT 0 COMMENT '订单使用积分',
  `distribut` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '分销金额',
  `pay_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实付款',
  `discount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '调整金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 331 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家订单结算表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rebate_log
-- ----------------------------
DROP TABLE IF EXISTS `rebate_log`;
CREATE TABLE `rebate_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分成记录表',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '获佣用户',
  `buy_user_id` int(11) NULL DEFAULT 0 COMMENT '购买人id',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '购买人名称',
  `order_sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '订单编号',
  `order_id` int(11) NULL DEFAULT 0 COMMENT '订单id',
  `goods_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '订单商品总额',
  `money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '获佣金额',
  `level` tinyint(1) NULL DEFAULT 1 COMMENT '获佣用户级别',
  `create_time` int(11) NULL DEFAULT 0 COMMENT '分成记录生成时间',
  `confirm` int(11) NULL DEFAULT 0 COMMENT '确定收货时间',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '0未付款,1已付款, 2等待分成(已收货) 3已分成, 4已取消',
  `confirm_time` int(11) NULL DEFAULT 0 COMMENT '确定分成或者取消时间',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '如果是取消, 有取消备注',
  `store_id` int(11) NULL DEFAULT 0 COMMENT '店铺id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 252 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for recharge
-- ----------------------------
DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge`  (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '会员ID',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `order_sn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '充值单号',
  `account` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '充值金额',
  `ctime` int(11) NULL DEFAULT NULL COMMENT '充值时间',
  `pay_time` int(11) NULL DEFAULT NULL COMMENT '支付时间',
  `pay_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `pay_status` tinyint(1) NULL DEFAULT 0 COMMENT '充值状态0:待支付 1:充值成功 2:交易关闭',
  `transaction_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方平台交易流水号',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `reply_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `comment_id` int(10) NOT NULL COMMENT '评论id：关联评论表',
  `parent_id` int(10) NOT NULL DEFAULT 0 COMMENT '父类id，0为最顶级',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '回复人的昵称',
  `to_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '被回复人的昵称',
  `deleted` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '未删除0；删除：1',
  `reply_time` int(10) UNSIGNED NOT NULL COMMENT '回复时间',
  PRIMARY KEY (`reply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for return_goods
-- ----------------------------
DROP TABLE IF EXISTS `return_goods`;
CREATE TABLE `return_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '退货申请表id自增',
  `rec_id` int(11) NOT NULL DEFAULT 0 COMMENT '对应订单商品表ID',
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单id',
  `order_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品id',
  `goods_num` smallint(6) NOT NULL DEFAULT 1 COMMENT '退货数量',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0仅退款 1退货退款  2换货 3维修',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '退换货退款申请原因',
  `describe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '问题描述',
  `evidence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '申请凭据',
  `imgs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '上传图片路径',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '-2用户取消-1不同意0待审核1通过2已发货3待退款4换货完成5退款完成6申诉仲裁',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '卖家审核进度说明',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `store_id` int(10) NOT NULL DEFAULT 0 COMMENT '商家店铺ID',
  `spec_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品规格',
  `consignee` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户姓名',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `refund_integral` int(10) NOT NULL DEFAULT 0 COMMENT '退还积分',
  `refund_deposit` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退还预存款',
  `refund_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退款金额',
  `refund_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0退到用户余额 1支付原路退回',
  `refund_mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '管理员退款备注',
  `refund_time` int(11) NOT NULL DEFAULT 0 COMMENT '退款时间',
  `addtime` int(11) NOT NULL DEFAULT 0 COMMENT '售后申请时间',
  `checktime` int(11) NOT NULL DEFAULT 0 COMMENT '卖家审核时间',
  `receivetime` int(11) NOT NULL DEFAULT 0 COMMENT '卖家收货时间',
  `canceltime` int(11) NOT NULL DEFAULT 0 COMMENT '用户取消时间',
  `seller_delivery` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '换货服务，卖家重新发货信息',
  `delivery` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户发货信息',
  `gap` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退款差额',
  `gap_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '差额原因',
  `is_receive` tinyint(1) NOT NULL DEFAULT 0 COMMENT '申请售后时是否已收货0未收货1已收货',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rec_id`(`rec_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;


use bb2_seller;

/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : bb2_seller

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 12/05/2020 17:30:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for account_log_store
-- ----------------------------
DROP TABLE IF EXISTS `account_log_store`;
CREATE TABLE `account_log_store`  (
  `log_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `store_id` int(8) UNSIGNED NOT NULL,
  `store_money` decimal(10, 2) NOT NULL COMMENT '店铺金额',
  `pending_money` decimal(10, 2) NOT NULL COMMENT '店铺未结算金额',
  `change_time` int(10) UNSIGNED NOT NULL COMMENT '变动时间',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `order_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `order_id` int(10) NULL DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `user_id`(`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
-- ----------------------------
-- Table structure for guarantee
-- ----------------------------
DROP TABLE IF EXISTS `guarantee`;
CREATE TABLE `guarantee`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `store_id` int(11) NOT NULL COMMENT '店铺ID',
  `store_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `grt_id` int(11) NOT NULL COMMENT '服务项目ID',
  `joinstate` tinyint(1) NOT NULL DEFAULT 0 COMMENT '加入状态 0未申请 1已申请 2已加入',
  `cost` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '保证金余额',
  `costimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款凭证图',
  `isopen` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0关闭 1开启',
  `auditstate` tinyint(1) NOT NULL DEFAULT 0 COMMENT '申请审核状态0未审核1审核通过2审核失败3已支付保证金4保证金审核通过5保证金审核失败',
  `quitstate` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退出申请状态0未申请 1已申请 2申请失败',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺消费者保障服务加入情况表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guarantee_apply
-- ----------------------------
DROP TABLE IF EXISTS `guarantee_apply`;
CREATE TABLE `guarantee_apply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请ID',
  `grt_id` int(11) NOT NULL COMMENT '保障项目ID',
  `store_id` int(11) NOT NULL COMMENT '店铺ID',
  `store_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `add_time` int(11) NOT NULL COMMENT '申请时间',
  `auditstate` tinyint(1) NOT NULL DEFAULT 0 COMMENT '审核状态 0未审核 1审核通过 2审核失败 3保证金待审核 4保证金审核通过 5保证金审核失败',
  `cost` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '保证金金额',
  `costimg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保证金付款凭证图片',
  `apply_type` tinyint(1) NULL DEFAULT 1 COMMENT '申请类型0退出1加入',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消费者保障服务申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guarantee_costlog
-- ----------------------------
DROP TABLE IF EXISTS `guarantee_costlog`;
CREATE TABLE `guarantee_costlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `grt_id` int(11) NOT NULL COMMENT '保障项目ID',
  `grt_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保障项目名称',
  `store_id` int(11) NOT NULL COMMENT '店铺ID',
  `store_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `admin_id` int(11) NULL DEFAULT NULL COMMENT '操作管理员ID',
  `admin_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作管理员名称',
  `price` decimal(10, 2) NOT NULL COMMENT '金额',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺消费者保障服务保证金日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guarantee_item
-- ----------------------------
DROP TABLE IF EXISTS `guarantee_item`;
CREATE TABLE `guarantee_item`  (
  `grt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `grt_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保障项目名称',
  `grt_describe` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保障项目描述',
  `grt_cost` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '保证金',
  `grt_icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图标',
  `grt_descurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容介绍文章地址',
  `grt_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 0关闭 1开启',
  `grt_sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `grt_charge` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收费规则',
  `grt_compensate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '理赔规则',
  `grt_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '赔付金额',
  `grt_score` int(10) NULL DEFAULT 0 COMMENT '扣除分数',
  PRIMARY KEY (`grt_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消费者保障服务项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guarantee_log
-- ----------------------------
DROP TABLE IF EXISTS `guarantee_log`;
CREATE TABLE `guarantee_log`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `log_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `log_storename` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `log_grtid` int(11) NOT NULL COMMENT '服务项目ID',
  `log_grtname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务项目名称',
  `log_msg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作描述',
  `log_addtime` int(11) NOT NULL COMMENT '添加时间',
  `log_role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作者角色 管理员为admin 商家为seller',
  `log_userid` int(11) NOT NULL COMMENT '操作者ID',
  `log_username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作者名称',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺消费者保障服务日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller`  (
  `seller_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '卖家编号',
  `seller_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '卖家用户名',
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户编号',
  `group_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '卖家组编号',
  `store_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '店铺编号',
  `is_admin` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否管理员(0-不是 1-是)',
  `seller_quicklink` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家快捷操作',
  `last_login_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '最后登录时间',
  `enabled` tinyint(1) NULL DEFAULT 0 COMMENT '激活状态 0启用1关闭',
  `add_time` int(11) NULL DEFAULT NULL,
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于app 授权类似于session_id',
  `open_teach` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否显示新手向导',
  PRIMARY KEY (`seller_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卖家用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for seller_log
-- ----------------------------
DROP TABLE IF EXISTS `seller_log`;
CREATE TABLE `seller_log`  (
  `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `log_content` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志内容',
  `log_time` int(10) UNSIGNED NOT NULL COMMENT '日志时间',
  `log_seller_id` int(10) UNSIGNED NOT NULL COMMENT '卖家编号',
  `log_seller_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '卖家帐号',
  `log_store_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `log_seller_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '卖家ip',
  `log_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志url',
  `log_state` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '日志状态(0-失败 1-成功)',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1902 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卖家日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shipping
-- ----------------------------
DROP TABLE IF EXISTS `shipping`;
CREATE TABLE `shipping`  (
  `shipping_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '物流公司id',
  `shipping_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `shipping_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物流公司编码',
  `shipping_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物流描述',
  `shipping_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物流公司logo',
  `template_width` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '运单模板宽度',
  `template_height` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '运单模板高度',
  `template_offset_x` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '运单模板左偏移量',
  `template_offset_y` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '运单模板上偏移量',
  `template_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '运单模板图片',
  `template_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打印项偏移校正',
  PRIMARY KEY (`shipping_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `store_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺索引id',
  `invite_user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐人开店',
  `store_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺名称',
  `grade_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺等级',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '会员id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员名称',
  `seller_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店主卖家用户名',
  `sc_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺分类',
  `company_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺公司名称',
  `province_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺所在省份ID',
  `city_id` mediumint(8) NOT NULL DEFAULT 0 COMMENT '店铺所在城市ID',
  `district` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺所在地区ID',
  `store_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细地区',
  `longitude` decimal(10, 7) NULL DEFAULT 0.0000000 COMMENT '商家地址经度',
  `latitude` decimal(10, 7) NULL DEFAULT 0.0000000 COMMENT '商家地址纬度',
  `store_zip` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮政编码',
  `store_state` tinyint(1) NOT NULL DEFAULT 2 COMMENT '店铺状态，0关闭，1开启，2审核中',
  `store_close_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺关闭原因',
  `store_sort` int(11) NOT NULL DEFAULT 0 COMMENT '店铺排序',
  `store_rebate_paytime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺结算类型',
  `store_time` int(11) NULL DEFAULT NULL COMMENT '开店时间',
  `store_end_time` int(11) NULL DEFAULT 0 COMMENT '店铺有效截止时间',
  `store_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺logo',
  `store_banner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺横幅',
  `store_avatar` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺头像',
  `seo_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺seo关键字',
  `seo_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺seo描述',
  `store_aliwangwang` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '阿里旺旺',
  `store_qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'QQ',
  `store_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商家电话',
  `store_zy` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主营商品',
  `store_domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺二级域名',
  `store_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '推荐，0为否，1为是，默认为0',
  `store_theme` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'default' COMMENT '店铺当前主题',
  `store_credit` int(10) NOT NULL DEFAULT 0 COMMENT '店铺信用',
  `store_desccredit` decimal(3, 2) NOT NULL DEFAULT 0.00 COMMENT '描述相符度分数',
  `store_servicecredit` decimal(3, 2) NOT NULL DEFAULT 0.00 COMMENT '服务态度分数',
  `store_deliverycredit` decimal(3, 2) NOT NULL DEFAULT 0.00 COMMENT '发货速度分数',
  `store_collect` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺收藏数量',
  `store_slide` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '店铺幻灯片',
  `store_slide_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '店铺幻灯片链接',
  `store_printdesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打印订单页面下方说明文字',
  `store_sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺销量',
  `store_presales` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '售前客服',
  `store_aftersales` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '售后客服',
  `store_workingtime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '工作时间',
  `store_free_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '超出该金额免运费，大于0才表示该值有效',
  `store_warning_storage` int(10) NULL DEFAULT 0 COMMENT ' 库存预警数',
  `store_decoration_switch` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺装修开关(0-关闭 装修编号-开启)',
  `store_decoration_only` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开启店铺装修时，仅显示店铺装修(1-是 0-否',
  `is_own_shop` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否自营店铺 1是 0否',
  `bind_all_gc` tinyint(1) NULL DEFAULT 0 COMMENT '自营店是否绑定全部分类 0否1是',
  `qitian` tinyint(1) NULL DEFAULT 0 COMMENT '7天退换',
  `certified` tinyint(1) NULL DEFAULT 0 COMMENT '正品保障',
  `returned` tinyint(1) NULL DEFAULT 0 COMMENT '退货承诺',
  `store_free_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商家配送时间',
  `mb_slide` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '手机店铺 轮播图链接地址',
  `mb_slide_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '手机版广告链接',
  `deliver_region` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺默认配送区域',
  `cod` tinyint(1) NULL DEFAULT 0 COMMENT '货到付款',
  `two_hour` tinyint(1) NULL DEFAULT 0 COMMENT '两小时发货',
  `ensure` tinyint(1) NULL DEFAULT 0 COMMENT '保证服务开关',
  `deposit` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '保证金额',
  `deposit_icon` tinyint(1) NULL DEFAULT 0 COMMENT '保证金显示开关',
  `store_money` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '店铺可用资金',
  `pending_money` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '待结算资金',
  `deleted` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '未删除0，已删除1',
  `goods_examine` tinyint(1) NULL DEFAULT 0 COMMENT '店铺发布商品是否需要审核',
  `service_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '客户下单, 接收下单提醒短信',
  `domain_enable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用二级域名.1:启用;0:关闭',
  `store_type` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺类型。0普通店铺。供应商店',
  `default_store` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1为默认k一同步平台必须为自营。可以同步给线下店铺',
  `store_notice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺公告',
  PRIMARY KEY (`store_id`) USING BTREE,
  INDEX `store_name`(`store_name`) USING BTREE,
  INDEX `sc_id`(`sc_id`) USING BTREE,
  INDEX `store_state`(`store_state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺数据表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for store_address
-- ----------------------------
DROP TABLE IF EXISTS `store_address`;
CREATE TABLE `store_address`  (
  `store_address_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `consignee` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人',
  `province_id` int(11) NOT NULL DEFAULT 0 COMMENT '省份',
  `city_id` int(11) NOT NULL DEFAULT 0 COMMENT '城市',
  `district_id` int(11) NOT NULL DEFAULT 0 COMMENT '地区',
  `town_id` int(11) NOT NULL DEFAULT 0 COMMENT '乡镇',
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地址',
  `zip_code` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机',
  `is_default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1为默认收货地址',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0为发货地址。1为收货地址',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺id',
  PRIMARY KEY (`store_address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_apply
-- ----------------------------
DROP TABLE IF EXISTS `store_apply`;
CREATE TABLE `store_apply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invite_user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐人开店',
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '申请人会员ID',
  `contacts_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contacts_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机',
  `contacts_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人邮箱',
  `company_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `company_type` tinyint(1) NULL DEFAULT 1 COMMENT '公司性质',
  `company_website` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司网址',
  `company_province` mediumint(8) NULL DEFAULT 0 COMMENT '公司所在省份',
  `company_city` mediumint(8) NULL DEFAULT 0 COMMENT '公司所在城市',
  `company_district` mediumint(8) NULL DEFAULT 0 COMMENT '公司所在地区',
  `company_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司详细地址',
  `company_telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `company_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `company_fax` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `company_zipcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `business_licence_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照注册号/统一社会信用代码',
  `business_licence_cert` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照电子版',
  `threeinone` tinyint(1) NULL DEFAULT 1 COMMENT '是否为一证一码商家',
  `reg_capital` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册资金',
  `legal_person` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `legal_identity_cert` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人身份证照片',
  `legal_identity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人身份证号',
  `business_date_start` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照有效期',
  `business_date_end` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orgnization_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
  `orgnization_cert` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码证',
  `attached_tax_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税人识别号',
  `tax_rate` tinyint(2) NULL DEFAULT 0 COMMENT '纳税类型税码',
  `taxpayer` tinyint(1) NULL DEFAULT 1 COMMENT '纳税人类型',
  `taxpayer_cert` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一般纳税人资格证书',
  `business_scope` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '营业执照经营范围',
  `store_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `seller_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家账号',
  `store_type` tinyint(1) NULL DEFAULT 0 COMMENT '店铺性质',
  `store_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_person_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺负责人姓名',
  `store_person_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺负责人手机',
  `store_person_qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺联系人QQ',
  `store_person_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺负责人邮箱',
  `store_person_cert` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺负责人身份证照片',
  `store_person_identity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺负责人身份证号',
  `bank_account_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算银行名称',
  `bank_account_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算银行账号',
  `bank_branch_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行支行名称',
  `bank_province` mediumint(8) NULL DEFAULT 0 COMMENT '开户银行支行所在地',
  `bank_city` mediumint(8) NULL DEFAULT 0 COMMENT '开户银行支行所在城市',
  `main_channel` tinyint(1) NULL DEFAULT 0 COMMENT '近一年主营渠道',
  `sales_volume` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '近一年销售额',
  `sku_num` mediumint(8) NULL DEFAULT 1 COMMENT '可网售商品数量',
  `ec_experience` tinyint(1) NULL DEFAULT 0 COMMENT '同类电子商务网站经验',
  `avg_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '预计平均客单价',
  `ware_house` tinyint(1) NULL DEFAULT 0 COMMENT '仓库情况',
  `entity_shop` tinyint(1) NULL DEFAULT 0 COMMENT '有无实体店',
  `sc_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺分类名称',
  `sc_id` int(10) NULL DEFAULT NULL COMMENT '店铺分类编号',
  `sc_bail` mediumint(8) NULL DEFAULT 0 COMMENT '店铺分类保证金',
  `sg_id` tinyint(2) NULL DEFAULT 0 COMMENT '店铺等级编号',
  `sg_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺等级名称',
  `store_class_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请分类佣金信息',
  `paying_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '付款金额',
  `paying_amount_cert` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款凭证',
  `apply_state` tinyint(2) NULL DEFAULT 0 COMMENT '店铺申请状态 0未审核，1通过，2拒绝',
  `review_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员审核信息',
  `add_time` int(11) NULL DEFAULT 0 COMMENT '提交申请时间',
  `apply_type` tinyint(1) NULL DEFAULT 0 COMMENT '申请类型默认0企业1个人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for store_bind_class
-- ----------------------------
DROP TABLE IF EXISTS `store_bind_class`;
CREATE TABLE `store_bind_class`  (
  `bid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `store_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '店铺ID',
  `commis_rate` tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '佣金比例',
  `class_1` mediumint(9) UNSIGNED NULL DEFAULT 0 COMMENT '一级分类',
  `class_2` mediumint(9) UNSIGNED NULL DEFAULT 0 COMMENT '二级分类',
  `class_3` mediumint(9) UNSIGNED NULL DEFAULT 0 COMMENT '三级分类',
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态0审核中1审核通过 2审核失败',
  PRIMARY KEY (`bid`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺可发布商品类目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_class
-- ----------------------------
DROP TABLE IF EXISTS `store_class`;
CREATE TABLE `store_class`  (
  `sc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `sc_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `sc_bail` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '保证金数额',
  `sc_sort` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`sc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_distribut
-- ----------------------------
DROP TABLE IF EXISTS `store_distribut`;
CREATE TABLE `store_distribut`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id自增',
  `switch` tinyint(1) NULL DEFAULT 0 COMMENT '分销开关',
  `condition` tinyint(1) NULL DEFAULT 0 COMMENT '成为分销商条件 0 直接成为分销商,1成功购买商品后成为分销商',
  `regrade` tinyint(1) NULL DEFAULT 0 COMMENT '返佣级数0一级1两级2三级',
  `first_rate` tinyint(1) NULL DEFAULT 0 COMMENT '一级分销商比例',
  `second_rate` tinyint(1) NULL DEFAULT 0 COMMENT '二级分销商名称',
  `third_rate` tinyint(1) NULL DEFAULT 0 COMMENT '三级分销商名称',
  `date` tinyint(1) NULL DEFAULT 15 COMMENT '订单收货确认后多少天可以分成',
  `store_id` int(11) NULL DEFAULT 0 COMMENT '店铺id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_extend
-- ----------------------------
DROP TABLE IF EXISTS `store_extend`;
CREATE TABLE `store_extend`  (
  `store_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺ID',
  `express` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '快递公司ID的组合',
  `pricerange` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '店铺统计设置的商品价格区间',
  `orderpricerange` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '店铺统计设置的订单价格区间',
  `pic_num` int(10) NULL DEFAULT 0 COMMENT '已上传图片数量',
  PRIMARY KEY (`store_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_goods_class
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_class`;
CREATE TABLE `store_goods_class`  (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `cat_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺商品分类名称',
  `parent_id` int(11) NOT NULL COMMENT '父级id',
  `shop_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '门店id',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `cat_sort` int(11) NOT NULL DEFAULT 0 COMMENT '商品分类排序',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分类显示状态',
  `is_nav_show` tinyint(1) NULL DEFAULT 0 COMMENT '是否显示在导航栏',
  `is_recommend` tinyint(1) NULL DEFAULT 0 COMMENT '是否首页推荐',
  `show_num` smallint(4) NULL DEFAULT 4 COMMENT '首页此类商品显示数量',
  PRIMARY KEY (`cat_id`) USING BTREE,
  INDEX `stc_parent_id`(`parent_id`, `cat_sort`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺商品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_grade
-- ----------------------------
DROP TABLE IF EXISTS `store_grade`;
CREATE TABLE `store_grade`  (
  `sg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `sg_name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  `sg_goods_limit` mediumint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '允许发布的商品数量',
  `sg_album_limit` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '允许上传图片数量',
  `sg_space_limit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上传空间大小，单位MB',
  `sg_template_limit` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '选择店铺模板套数',
  `sg_template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板内容',
  `sg_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开店费用(元/年)',
  `sg_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请说明',
  `sg_function` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加功能',
  `sg_sort` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '级别，数目越大级别越高',
  `sg_act_limits` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限',
  PRIMARY KEY (`sg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_invite
-- ----------------------------
DROP TABLE IF EXISTS `store_invite`;
CREATE TABLE `store_invite`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `invite_user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '谁邀请开店铺',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1949 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for store_msg
-- ----------------------------
DROP TABLE IF EXISTS `store_msg`;
CREATE TABLE `store_msg`  (
  `sm_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '店铺消息id',
  `store_id` int(10) UNSIGNED NOT NULL COMMENT '店铺id',
  `content` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '消息内容',
  `addtime` int(10) UNSIGNED NOT NULL COMMENT '发送时间',
  `open` tinyint(1) NOT NULL DEFAULT 0 COMMENT '消息是否已被查看',
  PRIMARY KEY (`sm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3347 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_msg_tpl
-- ----------------------------
DROP TABLE IF EXISTS `store_msg_tpl`;
CREATE TABLE `store_msg_tpl`  (
  `smt_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板编码',
  `smt_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `smt_message_switch` tinyint(3) UNSIGNED NOT NULL COMMENT '站内信默认开关，0关，1开',
  `smt_message_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站内信内容',
  `smt_message_forced` tinyint(3) UNSIGNED NOT NULL COMMENT '站内信强制接收，0否，1是',
  `smt_short_switch` tinyint(3) UNSIGNED NOT NULL COMMENT '短信默认开关，0关，1开',
  `smt_short_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '短信内容',
  `smt_short_forced` tinyint(3) UNSIGNED NOT NULL COMMENT '短信强制接收，0否，1是',
  `smt_mail_switch` tinyint(3) UNSIGNED NOT NULL COMMENT '邮件默认开，0关，1开',
  `smt_mail_subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件标题',
  `smt_mail_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件内容',
  `smt_mail_forced` tinyint(3) UNSIGNED NOT NULL COMMENT '邮件强制接收，0否，1是',
  `smt_short_sign` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '短信签名',
  `smt_short_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '短信模板ID',
  PRIMARY KEY (`smt_code`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家消息模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_navigation
-- ----------------------------
DROP TABLE IF EXISTS `store_navigation`;
CREATE TABLE `store_navigation`  (
  `sn_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '导航ID',
  `sn_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '导航名称',
  `sn_store_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '卖家店铺ID',
  `sn_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '导航内容',
  `sn_sort` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '导航排序',
  `sn_is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '导航是否显示',
  `sn_add_time` int(11) NOT NULL COMMENT '添加时间',
  `sn_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺导航的外链URL',
  `sn_new_open` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺导航外链是否在新窗口打开：0不开新窗口1开新窗口，默认是0',
  PRIMARY KEY (`sn_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卖家店铺导航信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_reopen
-- ----------------------------
DROP TABLE IF EXISTS `store_reopen`;
CREATE TABLE `store_reopen`  (
  `re_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `re_grade_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺等级ID',
  `re_grade_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  `re_grade_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '等级收费(元/年)',
  `re_year` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '续签时长(年)',
  `re_pay_amount` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '应付总金额',
  `re_store_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名字',
  `re_store_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺ID',
  `re_state` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态0默认，未上传凭证1审核中2审核通过',
  `re_start_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '有效期开始时间',
  `re_end_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '有效期结束时间',
  `re_create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '记录创建时间',
  `re_pay_cert` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款凭证',
  `re_pay_cert_explain` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款凭证说明',
  `admin_note` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核备注',
  PRIMARY KEY (`re_id`, `re_create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '续签内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_shipping
-- ----------------------------
DROP TABLE IF EXISTS `store_shipping`;
CREATE TABLE `store_shipping`  (
  `shipping_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺快递公司表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_withdrawals
-- ----------------------------
DROP TABLE IF EXISTS `store_withdrawals`;
CREATE TABLE `store_withdrawals`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商家提现申请表',
  `store_id` int(11) NULL DEFAULT 0 COMMENT '商家id',
  `create_time` int(11) NULL DEFAULT 0 COMMENT '申请日期',
  `refuse_time` int(11) NULL DEFAULT 0 COMMENT '拒绝时间',
  `pay_time` int(11) NULL DEFAULT 0 COMMENT '支付时间',
  `check_time` int(11) NULL DEFAULT 0 COMMENT '审核时间',
  `money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '提现金额',
  `bank_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '银行名称 如支付宝 微信 中国银行 农业银行等',
  `bank_card` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '银行账号',
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '银行账户名 可以是支付宝可以其他银行',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '提现备注',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态：-2删除作废-1审核失败0申请中1审核通过2已转款完成',
  `pay_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款对账流水号',
  `taxfee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '手续费',
  `error_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转款失败错误代码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers`  (
  `suppliers_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `suppliers_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '供应商名称',
  `suppliers_desc` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商描述',
  `is_check` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '供应商状态',
  `suppliers_contacts` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '供应商联系人',
  `suppliers_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '供应商电话',
  `store_id` int(10) NULL DEFAULT 0 COMMENT '所属商家id',
  PRIMARY KEY (`suppliers_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;


use bb2_user;
/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : bb2_user

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 12/05/2020 17:31:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice`  (
  `invoice_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单id',
  `order_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `store_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家id',
  `invoice_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0普通发票1电子发票2增值税发票',
  `invoice_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '发票金额',
  `invoice_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发票抬头',
  `invoice_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发票内容',
  `invoice_rate` decimal(10, 4) UNSIGNED NOT NULL DEFAULT 0.0000 COMMENT '发票税率',
  `taxpayer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '纳税人识别号',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '发票状态0待开1已开2作废',
  `atime` int(11) NOT NULL DEFAULT 0 COMMENT '开票时间',
  `ctime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`invoice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '发票信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_log
-- ----------------------------
DROP TABLE IF EXISTS `account_log`;
CREATE TABLE `account_log`  (
  `log_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `user_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '用户金额',
  `frozen_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '冻结金额',
  `pay_points` mediumint(9) NOT NULL DEFAULT 0 COMMENT '支付积分',
  `change_time` int(10) UNSIGNED NOT NULL COMMENT '变动时间',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `order_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单id',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5302 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_msg_tpl
-- ----------------------------
DROP TABLE IF EXISTS `member_msg_tpl`;
CREATE TABLE `member_msg_tpl`  (
  `mmt_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户消息模板编号',
  `mmt_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板名称',
  `mmt_message_switch` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '站内信接收开关',
  `mmt_message_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '站内信消息内容',
  `mmt_short_switch` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '短信接收开关',
  `mmt_short_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '短信接收内容',
  `mmt_mail_switch` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '邮件接收开关',
  `mmt_mail_subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮件标题',
  `mmt_mail_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件内容',
  `mmt_short_sign` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '短信签名',
  `mmt_short_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '短信模板ID',
  PRIMARY KEY (`mmt_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户消息模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `message_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `admin_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员id',
  `seller_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家管理员id',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站内信内容',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '个体消息：0，全体消息：1',
  `category` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0系统消息，1物流通知，2优惠促销，3商品提醒，4我的资产，5商城好店',
  `send_time` int(10) UNSIGNED NOT NULL COMMENT '发送时间',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息序列化内容',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for message_activity
-- ----------------------------
DROP TABLE IF EXISTS `message_activity`;
CREATE TABLE `message_activity`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息标题',
  `message_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息内容',
  `img_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `send_time` int(10) UNSIGNED NOT NULL COMMENT '发送时间',
  `end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动结束时间',
  `mmt_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户消息模板编号',
  `prom_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1抢购2团购3优惠促销4预售5虚拟6拼团7搭配购8自定义图文消息9订单促销',
  `prom_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动id',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺ID',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 729 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for message_logistics
-- ----------------------------
DROP TABLE IF EXISTS `message_logistics`;
CREATE TABLE `message_logistics`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `message_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `img_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `send_time` int(10) UNSIGNED NOT NULL COMMENT '发送时间',
  `order_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '单号',
  `order_id` int(11) NOT NULL DEFAULT 0 COMMENT '物流订单id',
  `mmt_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户消息模板编号',
  `type` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '1到货通知2发货提醒3签收提醒4评价提醒5退货提醒6退款提醒',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺ID',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2853 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for message_notice
-- ----------------------------
DROP TABLE IF EXISTS `message_notice`;
CREATE TABLE `message_notice`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '个体消息：0，全体消息:1',
  `message_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `message_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `send_time` int(10) UNSIGNED NOT NULL COMMENT '发送时间',
  `mmt_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户消息模板编号',
  `type` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '0系统公告1降价通知2优惠券到账提醒3优惠券使用提醒4优惠券即将过期提醒5预售订单尾款支付提醒6提现到账提醒',
  `prom_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动id',
  `store_id` int(11) NULL DEFAULT 0 COMMENT '店铺ID',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for message_private
-- ----------------------------
DROP TABLE IF EXISTS `message_private`;
CREATE TABLE `message_private`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `send_time` int(10) UNSIGNED NOT NULL COMMENT '发送时间',
  `send_user_id` mediumint(8) UNSIGNED NOT NULL COMMENT '发送者',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_users
-- ----------------------------
DROP TABLE IF EXISTS `oauth_users`;
CREATE TABLE `oauth_users`  (
  `tu_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表自增ID',
  `user_id` mediumint(8) NOT NULL COMMENT '用户表ID',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '第三方开放平台openid',
  `oauth` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '第三方授权平台',
  `unionid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oauth_child` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'mp标识来自公众号, open标识来自开放平台,用于标识来自哪个第三方授权平台, 因为同是微信平台有来自公众号和开放平台',
  PRIMARY KEY (`tu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3831 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sms_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_log`;
CREATE TABLE `sms_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `mobile` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' COMMENT '手机号',
  `session_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' COMMENT 'session_id',
  `add_time` int(11) NULL DEFAULT 0 COMMENT '发送时间',
  `code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' COMMENT '验证码',
  `seller_id` int(10) NULL DEFAULT 0,
  `status` int(1) NULL DEFAULT 0 COMMENT '1:发送成功,0:发送失败',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信内容',
  `scene` int(1) NULL DEFAULT 0 COMMENT '发送场景,1:用户注册,2:找回密码,3:客户下单,4:客户支付,5:商家发货,6:身份验证',
  `error_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '发送短信异常内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sms_template
-- ----------------------------
DROP TABLE IF EXISTS `sms_template`;
CREATE TABLE `sms_template`  (
  `tpl_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sms_sign` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '短信签名',
  `sms_tpl_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '短信模板ID',
  `tpl_content` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发送短信内容',
  `send_scene` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '短信发送场景',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`tpl_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短信模板配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_collect
-- ----------------------------
DROP TABLE IF EXISTS `store_collect`;
CREATE TABLE `store_collect`  (
  `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NULL DEFAULT NULL,
  `store_id` int(10) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL COMMENT '收藏店铺时间',
  `store_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收藏会员名称',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表id',
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮件',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `sex` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 保密 1 男 2 女',
  `birthday` int(11) NOT NULL DEFAULT 0 COMMENT '生日',
  `user_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '用户金额',
  `frozen_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '冻结金额',
  `distribut_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '累积分佣金额',
  `pay_points` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消费积分',
  `paypwd` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付密码',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `last_login` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `last_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'QQ',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_validated` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否验证手机',
  `head_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `bank_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行名称',
  `bank_card` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户真实姓名',
  `idcard` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `email_validated` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否验证电子邮箱',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方返回昵称',
  `level` tinyint(1) NULL DEFAULT 1 COMMENT '会员等级',
  `discount` decimal(10, 2) NULL DEFAULT 1.00 COMMENT '会员折扣，默认1不享受',
  `total_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '消费累计额度',
  `is_lock` tinyint(1) NULL DEFAULT 0 COMMENT '是否被锁定冻结',
  `is_distribut` tinyint(1) NULL DEFAULT 0 COMMENT '是否为分销商 0 否 1 是',
  `first_leader` int(11) NULL DEFAULT 0 COMMENT '第一个上级',
  `second_leader` int(11) NULL DEFAULT 0 COMMENT '第二个上级',
  `third_leader` int(11) NULL DEFAULT 0 COMMENT '第三个上级',
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用于app 授权类似于session_id',
  `underling_number` int(5) NULL DEFAULT 0 COMMENT '用户下线数',
  `message_mask` bit(6) NOT NULL DEFAULT b'111111' COMMENT '消息掩码',
  `push_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '推送id',
  `distribut_level` tinyint(2) NULL DEFAULT 0 COMMENT '分销商等级',
  `xcx_qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序专属二维码',
  `is_store_member` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '属于哪个店铺的会员',
  `is_entry` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0平常注册，1微信注册绑定，2微信账号关联',
  `manifesto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个人签名',
  `distribut_withdrawals_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '累积分销佣金提现',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `mobile`(`mobile_validated`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3714 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `address_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `consignee` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人',
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `country` int(11) NOT NULL DEFAULT 0 COMMENT '国家',
  `province` int(11) NOT NULL DEFAULT 0 COMMENT '省份',
  `city` int(11) NOT NULL DEFAULT 0 COMMENT '城市',
  `district` int(11) NOT NULL DEFAULT 0 COMMENT '地区',
  `twon` int(11) NULL DEFAULT 0 COMMENT '乡镇',
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地址',
  `zipcode` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机',
  `is_default` tinyint(1) NULL DEFAULT 0 COMMENT '默认收货地址',
  `longitude` decimal(10, 7) NOT NULL DEFAULT 0.0000000 COMMENT '地址经度',
  `latitude` decimal(10, 7) NOT NULL DEFAULT 0.0000000 COMMENT '地址纬度',
  PRIMARY KEY (`address_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1259 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_extend
-- ----------------------------
DROP TABLE IF EXISTS `user_extend`;
CREATE TABLE `user_extend`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NULL DEFAULT 0,
  `invoice_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `taxpayer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税人识别号',
  `invoice_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不开发票/明细',
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `idcard` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `cash_alipay` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '提现支付宝号',
  `cash_unionpay` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '提现银行卡号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_level
-- ----------------------------
DROP TABLE IF EXISTS `user_level`;
CREATE TABLE `user_level`  (
  `level_id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `level_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头衔名称',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '等级必要金额',
  `discount` smallint(4) NULL DEFAULT 0 COMMENT '折扣',
  `describe` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message`  (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `message_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息id',
  `category` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '通知消息：0, 活动消息：1, 物流:2, 私信:3',
  `is_see` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否查看：0未查看, 1已查看',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户假删除标识,1:删除,0未删除',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '查看状态：0未查看，1已查看',
  PRIMARY KEY (`rec_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `message_id`(`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8660 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_sign
-- ----------------------------
DROP TABLE IF EXISTS `user_sign`;
CREATE TABLE `user_sign`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `sign_total` int(11) NULL DEFAULT 0 COMMENT '累计签到天数',
  `sign_count` int(11) NULL DEFAULT 0 COMMENT '连续签到天数',
  `sign_last` char(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0' COMMENT '最后签到时间，时间格式20170907',
  `sign_time` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '历史签到时间，以逗号隔开',
  `cumtrapz` int(11) NULL DEFAULT 0 COMMENT '用户累计签到总积分',
  `this_month` int(6) NULL DEFAULT NULL COMMENT '本月累计积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_store
-- ----------------------------
DROP TABLE IF EXISTS `user_store`;
CREATE TABLE `user_store`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `store_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名',
  `true_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真名',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'QQ',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `store_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺图片',
  `store_time` int(11) NOT NULL DEFAULT 0 COMMENT '开店时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3020 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户店铺信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for withdrawals
-- ----------------------------
DROP TABLE IF EXISTS `withdrawals`;
CREATE TABLE `withdrawals`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提现申请表',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '提现金额',
  `create_time` int(11) NULL DEFAULT 0 COMMENT '申请时间',
  `check_time` int(11) NULL DEFAULT 0 COMMENT '审核时间',
  `pay_time` int(11) NULL DEFAULT 0 COMMENT '支付时间',
  `refuse_time` int(11) NULL DEFAULT 0 COMMENT '拒绝时间',
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '银行名称 如支付宝 微信 中国银行 农业银行等',
  `bank_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '银行账号或支付宝账号',
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '提款账号真实姓名',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '提现备注',
  `taxfee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '税收手续费',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态：-2删除作废-1审核失败0申请中1审核通过2付款成功3付款失败',
  `pay_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款对账流水号',
  `error_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款失败错误代码',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '提箱类型:0余额提现,1佣金提现',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

use bb2_seata;
/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : bb2_seat_server

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 22/06/2020 14:46:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for branch_table
-- ----------------------------
DROP TABLE IF EXISTS `branch_table`;
CREATE TABLE `branch_table`  (
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `transaction_id` bigint(20) NULL DEFAULT NULL,
  `resource_group_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `branch_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `client_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `application_data` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`branch_id`) USING BTREE,
  INDEX `idx_xid`(`xid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for global_table
-- ----------------------------
DROP TABLE IF EXISTS `global_table`;
CREATE TABLE `global_table`  (
  `xid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `transaction_id` bigint(20) NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `application_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transaction_service_group` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transaction_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeout` int(11) NULL DEFAULT NULL,
  `begin_time` bigint(20) NULL DEFAULT NULL,
  `application_data` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`xid`) USING BTREE,
  INDEX `idx_gmt_modified_status`(`gmt_modified`, `status`) USING BTREE,
  INDEX `idx_transaction_id`(`transaction_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lock_table
-- ----------------------------
DROP TABLE IF EXISTS `lock_table`;
CREATE TABLE `lock_table`  (
  `row_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xid` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transaction_id` bigint(20) NULL DEFAULT NULL,
  `branch_id` bigint(20) NOT NULL,
  `resource_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `table_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pk` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`row_key`) USING BTREE,
  INDEX `idx_branch_id`(`branch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

