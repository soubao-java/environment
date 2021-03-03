use bb2_order;
/*
 Navicat Premium Data Transfer

 Source Server         : 线上演示站
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 120.24.42.191:3306
 Source Schema         : bb2_order

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 03/03/2021 10:17:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ali_pay
-- ----------------------------
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
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论ip地址',
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
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `user_contact` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原告联系方式',
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
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户邮箱',
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投诉主题表' ROW_FORMAT = Dynamic;

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
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户邮箱',
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
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发货单' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `expose_pic` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片1',
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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '举报主题表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '举报类型表' ROW_FORMAT = Dynamic;

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
  `tip_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '小费',
  `tax_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '税费',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下单时间',
  `confirm_time` int(10) NULL DEFAULT 0 COMMENT '收货确认时间',
  `pay_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付时间',
  `transaction_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方平台交易流水号',
  `prom_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '订单类型：0默认1抢购2团购3优惠4预售6拼团',
  `is_virtual` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为虚拟订单',
  `is_cod` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为到付',
  `prom_id` int(10) NOT NULL DEFAULT 0 COMMENT '活动id',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1043 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2273 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单评分表' ROW_FORMAT = Dynamic;

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
  `tax_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '税费',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1074 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `seller_tip` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商家小费',
  `admin_tip` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '总平台小费',
  `tax_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '税费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家订单结算表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pay_pal
-- ----------------------------
DROP TABLE IF EXISTS `pay_pal`;
CREATE TABLE `pay_pal`  (
  `pay_id` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'clientID',
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密钥',
  PRIMARY KEY (`pay_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for recharge
-- ----------------------------
DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge`  (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '会员ID',
  `order_sn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '充值单号',
  `account` decimal(10, 2) NOT NULL COMMENT '充值金额',
  `ctime` int(11) NOT NULL COMMENT '充值时间',
  `pay_time` int(11) NOT NULL DEFAULT 0 COMMENT '支付时间',
  `pay_trade_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT ' \'如果为微信支付(JSAPI,NATIVE,APP,MWEB)\',',
  `pay_oauth` int(80) NOT NULL COMMENT '支付方式第三方支付平台:1微信支付,2支付宝3:stripe,4:p',
  `pay_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '充值状态0:待支付 1:充值成功 ',
  `transaction_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方平台交易流水号',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for recharge_face
-- ----------------------------
DROP TABLE IF EXISTS `recharge_face`;
CREATE TABLE `recharge_face`  (
  `face_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '面额id',
  `face_value` decimal(10, 2) UNSIGNED NOT NULL COMMENT '面额值',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`face_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

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
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stripe
-- ----------------------------
DROP TABLE IF EXISTS `stripe`;
CREATE TABLE `stripe`  (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `publishable_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '可发布的密钥',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密钥',
  `hook_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '钩子的密钥',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'stripe支付配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trial_comment
-- ----------------------------
DROP TABLE IF EXISTS `trial_comment`;
CREATE TABLE `trial_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `order_sn` bigint(255) NOT NULL COMMENT '订单号',
  `conform` int(255) NOT NULL COMMENT '描述相符',
  `seller_serve` int(255) NOT NULL COMMENT '卖家服务',
  `physical_serve` int(255) NOT NULL COMMENT '物流服务',
  `goods_meet` int(255) NOT NULL COMMENT '商品满意度',
  `effect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家印象',
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评价',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图片',
  `zan_num` int(11) NULL DEFAULT 0 COMMENT '点赞人数',
  `add_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trial_order
-- ----------------------------
DROP TABLE IF EXISTS `trial_order`;
CREATE TABLE `trial_order`  (
  `order_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '试用订单id',
  `order_sn` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单sn',
  `store_id` int(10) NOT NULL COMMENT '店铺id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `is_shipping` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '未(待)发货0，确认发货1, 已发货2，部分发货3,',
  `is_receive` tinyint(1) NOT NULL COMMENT '未收货0，已收货1，部分收货2',
  `is_paid` tinyint(1) NOT NULL COMMENT '未支付0，已支付1，部分支付2',
  `is_cancel` tinyint(1) NOT NULL COMMENT '未取消0，已取消1',
  `is_refund` tinyint(1) NOT NULL COMMENT '未退款0，已退款，部分退款',
  `is_comment` tinyint(1) NOT NULL COMMENT '未评价，已评价',
  `goods_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '商品总价',
  `total_amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '订单总价',
  `user_money` decimal(10, 2) UNSIGNED NOT NULL COMMENT '用户余额',
  `order_amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '订单应付金额',
  `pay_oauth` tinyint(1) NOT NULL COMMENT '第三方支付平台:0不使用支付平台1微信支付,2支付宝3:stripe,4:paypal',
  `pay_trade_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '如果为微信支付(JSAPI,NATIVE,APP,MWEB)',
  `transaction_id` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '第三方支付平台交易流水号',
  `gmt_paid` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `gmt_receive` datetime(0) NULL DEFAULT NULL COMMENT '收货时间',
  `gmt_shipping` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `deleted` tinyint(10) NOT NULL DEFAULT 0 COMMENT '软删除',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `shipping_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '邮费',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试用订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trial_order_deliver
-- ----------------------------
DROP TABLE IF EXISTS `trial_order_deliver`;
CREATE TABLE `trial_order_deliver`  (
  `deliver_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '发货id',
  `store_id` int(10) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `shipping_id` int(10) NOT NULL DEFAULT 0 COMMENT '收货id',
  `shipping_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '物流code',
  `shipping_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '物流名称',
  `shipping_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '物流单号',
  `consignor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发货人姓名',
  `consignor_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发货人手机号',
  `consignor_province_id` int(10) NOT NULL DEFAULT 0 COMMENT '发货人省id',
  `consignor_city_id` int(10) NOT NULL DEFAULT 0 COMMENT '发货人市id',
  `consignor_district_id` int(10) NOT NULL DEFAULT 0 COMMENT '发货人区id',
  `consignor_town_id` int(10) NOT NULL DEFAULT 0 COMMENT '发货人镇id',
  `consignor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发货人详细地址',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`deliver_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试用订单发货' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trial_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `trial_order_goods`;
CREATE TABLE `trial_order_goods`  (
  `order_goods_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单商品id',
  `order_sn` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单编号',
  `goods_id` int(10) NOT NULL DEFAULT 0 COMMENT '商品id',
  `trial_apply_id` int(10) NOT NULL COMMENT '试用名单id',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_num` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '商品数',
  `goods_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '商品原价',
  `pay_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '商品购买价',
  `is_shipping` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '未发货0，已发货1',
  `is_comment` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否评价',
  PRIMARY KEY (`order_goods_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试用订单商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trial_order_shipping
-- ----------------------------
DROP TABLE IF EXISTS `trial_order_shipping`;
CREATE TABLE `trial_order_shipping`  (
  `shipping_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '发货单id',
  `order_sn` bigint(20) NOT NULL DEFAULT 0 COMMENT '订单编号',
  `consignee_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `consignee_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `consignee_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货人email',
  `consignee_province_id` int(10) NOT NULL COMMENT '收货人省id',
  `consignee_city_id` int(10) NOT NULL DEFAULT 0 COMMENT '收货人市id',
  `consignee_district_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收货人区id',
  `consignee_town_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收货人镇id',
  `consignee_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  PRIMARY KEY (`shipping_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试用订单收货人信息' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for virtual_code
-- ----------------------------
DROP TABLE IF EXISTS `virtual_code`;
CREATE TABLE `virtual_code`  (
  `code_id` int(255) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL DEFAULT 0 COMMENT '订单id',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '兑换码',
  `is_use` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否使用',
  `is_expire` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否过期',
  `use_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '使用的时间',
  `expire_time` datetime(0) NOT NULL COMMENT '过期时间',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`code_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wx_pay
-- ----------------------------
DROP TABLE IF EXISTS `wx_pay`;
CREATE TABLE `wx_pay`  (
  `mch_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信支付的商户id',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信支付的商户密钥',
  `apiclient_cert` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付商户证书',
  `apiclient_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付商户证书密钥'
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
