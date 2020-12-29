use bb2_seller;
/*
 Navicat Premium Data Transfer

 Source Server         : 120.24.42.191
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 120.24.42.191:3306
 Source Schema         : bb2_seller

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 29/12/2020 18:09:17
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
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺消费者保障服务加入情况表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消费者保障服务项目表' ROW_FORMAT = Dynamic;

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
-- Table structure for pc_index_template
-- ----------------------------
DROP TABLE IF EXISTS `pc_index_template`;
CREATE TABLE `pc_index_template`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '模板名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卖家用户表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卖家日志表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺地址表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺可发布商品类目表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺分类表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺商品分类表' ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

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
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺消息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卖家店铺导航信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_pc_index_template
-- ----------------------------
DROP TABLE IF EXISTS `store_pc_index_template`;
CREATE TABLE `store_pc_index_template`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `pc_index_template_id` int(10) NOT NULL COMMENT '模板id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '续签内容表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
