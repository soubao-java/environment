use bb2_mall;
/*
 Navicat Premium Data Transfer

 Source Server         : 120.24.42.191
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 120.24.42.191:3306
 Source Schema         : bb2_mall

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 29/12/2020 18:05:59
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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupon_price
-- ----------------------------
DROP TABLE IF EXISTS `coupon_price`;
CREATE TABLE `coupon_price`  (
  `coupon_price_id` smallint(4) NOT NULL AUTO_INCREMENT,
  `coupon_price_value` smallint(4) NOT NULL DEFAULT 0 COMMENT '优惠券面额',
  PRIMARY KEY (`coupon_price_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券面额表' ROW_FORMAT = Dynamic;

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
  `location_url_is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '精选推荐（右边）是否显示',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`floor_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品排序',
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
  `seller_sort` int(11) NOT NULL DEFAULT 50 COMMENT '店铺商品排序',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `is_recommend_seller` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐(店铺)',
  `is_new_seller` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否新品(店铺)',
  `is_hot_seller` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否热卖(店铺)',
  PRIMARY KEY (`goods_id`) USING BTREE,
  INDEX `goods_sn`(`goods_sn`) USING BTREE,
  INDEX `cat_id`(`cat_id1`) USING BTREE,
  INDEX `exchange_integral`(`exchange_integral`) USING BTREE,
  INDEX `goods_name`(`goods_name`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for goods_cat_region_tax_rate
-- ----------------------------
DROP TABLE IF EXISTS `goods_cat_region_tax_rate`;
CREATE TABLE `goods_cat_region_tax_rate`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cat_id` int(10) NOT NULL DEFAULT 0 COMMENT '商品分类id',
  `region_id` int(10) NOT NULL DEFAULT 0 COMMENT '地区id',
  `tax_rate` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '税率',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Fixed;

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
) ENGINE = InnoDB AUTO_INCREMENT = 185 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 876 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品浏览历史表' ROW_FORMAT = Dynamic;

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
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `inventory_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品清单名称',
  PRIMARY KEY (`inventory_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品清单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for inventory_goods
-- ----------------------------
DROP TABLE IF EXISTS `inventory_goods`;
CREATE TABLE `inventory_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `inventory_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品清单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品与清单中间表' ROW_FORMAT = Fixed;

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
-- Table structure for navigation
-- ----------------------------
DROP TABLE IF EXISTS `navigation`;
CREATE TABLE `navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '导航主键',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '导航名称',
  `is_show` int(10) NOT NULL COMMENT '是否显示:1显示，2不显示',
  `is_new` int(10) NOT NULL COMMENT '是否新窗口：1是，2否',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '跳转路径',
  `position` int(255) NOT NULL COMMENT '位置:1前台顶部，2前台底部，3商家底部',
  `affiliation` int(10) NOT NULL COMMENT '归属：0pc，1h5',
  PRIMARY KEY (`id`)
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for poster
-- ----------------------------
DROP TABLE IF EXISTS `poster`;
CREATE TABLE `poster`  (
  `poster_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '海报名称',
  `poster_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `start_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '开始时间',
  `end_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '结束时间',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uri',
  PRIMARY KEY (`poster_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for poster_admin
-- ----------------------------
DROP TABLE IF EXISTS `poster_admin`;
CREATE TABLE `poster_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `admin_id` int(11) NOT NULL COMMENT 'adminid',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `poster_id` int(11) NOT NULL COMMENT '创建海报表外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for poster_seller
-- ----------------------------
DROP TABLE IF EXISTS `poster_seller`;
CREATE TABLE `poster_seller`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `store_cat_id` int(11) NOT NULL COMMENT '本店类型id',
  `store_id` int(11) NOT NULL COMMENT '商家id',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `poster_id` int(11) NOT NULL COMMENT '创建海报表外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

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
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `goods_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_spec` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `order_sn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `store_id` int(11) NULL DEFAULT NULL COMMENT '商家ID',
  `muid` int(11) NULL DEFAULT NULL COMMENT '操作用户ID',
  `stock` int(11) NULL DEFAULT NULL COMMENT '更改库存',
  `ctime` int(11) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2122 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for trial_apply
-- ----------------------------
DROP TABLE IF EXISTS `trial_apply`;
CREATE TABLE `trial_apply`  (
  `apply_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `trial_id` int(10) NOT NULL DEFAULT 0 COMMENT '试用商品主键',
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户id',
  `is_auth` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否认证：0未支付待认证，1认证，2已支付不通过',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '申请试用名单' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for trial_goods
-- ----------------------------
DROP TABLE IF EXISTS `trial_goods`;
CREATE TABLE `trial_goods`  (
  `trial_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺id',
  `template_id` int(10) NOT NULL DEFAULT 0 COMMENT '运费模板，0为包邮',
  `trialt_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '试用数量',
  `limit_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最多试用人数',
  `is_auth` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否通过平台审核，0可参与，1不可参与',
  `is_close` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '平台是否关闭',
  `is_end` tinyint(1) NOT NULL COMMENT '是否到点结束',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除 0,为可用，1为不可用',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `state` int(11) NOT NULL COMMENT '0未开始，1已开始，2已结束',
  PRIMARY KEY (`trial_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试用商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trial_poster
-- ----------------------------
DROP TABLE IF EXISTS `trial_poster`;
CREATE TABLE `trial_poster`  (
  `trial_poster_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片上传路径',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '跳转地址',
  `state` int(255) NOT NULL COMMENT '1可用 0不可以用',
  PRIMARY KEY (`trial_poster_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trial_record
-- ----------------------------
DROP TABLE IF EXISTS `trial_record`;
CREATE TABLE `trial_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试用记录id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `store_id` int(11) NOT NULL COMMENT '商家id',
  `win_count` int(11) NOT NULL COMMENT '中奖次数',
  `comment_count` int(11) NOT NULL COMMENT '评论次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for trial_share
-- ----------------------------
DROP TABLE IF EXISTS `trial_share`;
CREATE TABLE `trial_share`  (
  `share_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分享主键id',
  `trial_id` int(11) NOT NULL COMMENT '试用商品id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`share_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime(0) NOT NULL,
  `log_modified` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信公共帐号' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
