use bb2_shop;

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
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '门店主键',
  `store_id` int(11) NOT NULL COMMENT '商家ID',
  `shop_name` varchar(255) NOT NULL COMMENT '门店名称',
  `user_id` int(11) NOT NULL COMMENT '会员id',
  `user_name` varchar(255) NOT NULL COMMENT '会员名称',
  `shopper_name` varchar(255) NOT NULL COMMENT '店主卖家用户名',
  `province_id` int(11) NOT NULL COMMENT '门店所在省份ID',
  `city_id` int(11) NOT NULL COMMENT '门店所在城市ID',
  `district_id` int(11) NOT NULL COMMENT '门店所在地区ID',
  `shop_address` varchar(255) NOT NULL COMMENT '门店详细地址',
  `lat` varchar(255) NOT NULL DEFAULT '' COMMENT '纬度',
  `lng` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `shop_zip` varchar(255) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `shop_close_info` varchar(255) NOT NULL DEFAULT '' COMMENT '门店关闭原因',
  `shop_sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `start_time` varchar(255) NOT NULL DEFAULT '' COMMENT '开始营业时间0-24',
  `end_time` varchar(255) NOT NULL DEFAULT '' COMMENT '结束时间0-24',
  `work_time` varchar(255) NOT NULL DEFAULT '' COMMENT '营业时间周一到周末',
  `route` varchar(255) NOT NULL DEFAULT '' COMMENT '交通路线',
  `shop_entity_img` varchar(255) NOT NULL DEFAULT '' COMMENT '门店实景图片',
  `shop_log` varchar(255) NOT NULL DEFAULT '' COMMENT '门店log',
  `shop_banner` varchar(255) NOT NULL DEFAULT '' COMMENT '门店横幅',
  `shop_avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '门店头像',
  `shop_ali_ww` varchar(255) NOT NULL DEFAULT '' COMMENT '阿里旺旺',
  `shop_qq` varchar(255) NOT NULL DEFAULT '' COMMENT 'qq',
  `shop_wx` varchar(255) NOT NULL DEFAULT '' COMMENT '微信',
  `shop_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `shop_theme` varchar(255) NOT NULL DEFAULT '' COMMENT '门店主题',
  `shop_credit` int(5) NOT NULL DEFAULT '0' COMMENT '门店信用',
  `shop_desc_credit` int(5) NOT NULL DEFAULT '0' COMMENT '描述相符度分数',
  `shop_service_credit` int(5) NOT NULL DEFAULT '0' COMMENT '服务态度分数',
  `shop_delivery_credit` int(5) NOT NULL DEFAULT '0' COMMENT '发货速度分数',
  `shop_collect` int(100) NOT NULL DEFAULT '0' COMMENT '门店收藏',
  `shop_decoration_switch` int(2) NOT NULL DEFAULT '0' COMMENT '门店装修开关(0-关闭 装修编号-开启)'',',
  `shop_free_time` varchar(255) NOT NULL DEFAULT '' COMMENT '门店配送时间',
  `service_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '客户下单, 接收下单提醒短信',
  `mini_order_price` decimal(10,2) NOT NULL COMMENT '起送价',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `check_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '审核时间',
  `is_check` int(10) NOT NULL DEFAULT '0' COMMENT '审核是否通过 0：为待审核，1：通过 ，2不通过',
  `is_open` int(10) NOT NULL COMMENT '0:未开启，1：开启',
  `is_recommend` int(10) NOT NULL DEFAULT '0' COMMENT '是否推荐：0非，1是',
  `is_del` int(10) NOT NULL DEFAULT '0' COMMENT '1删除',
  PRIMARY KEY (`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店表' ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for shop_slide
-- ----------------------------
DROP TABLE IF EXISTS `shop_slide`;
CREATE TABLE `shop_slide` (
  `slide_id` int(100) NOT NULL AUTO_INCREMENT COMMENT '门店轮播图',
  `shop_id` int(11) NOT NULL COMMENT '门店外键',
  `slide_img` varchar(255) NOT NULL COMMENT '图片',
  `slide_url` varchar(255) NOT NULL COMMENT '链接地址',
  `pc_or_h5` int(255) NOT NULL COMMENT '0:pc,1:h5',
  `slide_sort` int(255) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`)
) ENGINE=MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店表轮播图' ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for shop_clerk
-- ----------------------------
DROP TABLE IF EXISTS `shop_clerk`;
CREATE TABLE `shop_clerk` (
  `shop_clerk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '多门店人员id',
  `clerk_account` varchar(255) NOT NULL COMMENT '账号',
  `user_id` int(11) NOT NULL COMMENT '绑定用户id',
  `shop_id` int(11) NOT NULL COMMENT '绑定门店',
  `store_id` int(11) NOT NULL COMMENT '商家id',
  `is_admin` int(10) NOT NULL DEFAULT '0' COMMENT '1：是',
  `end_login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `enabled` int(10) NOT NULL DEFAULT '0' COMMENT '激活状态 0激活 1,非激活',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`shop_clerk_id`)
) ENGINE=MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店账号' ROW_FORMAT = Dynamic;


SET FOREIGN_KEY_CHECKS = 1;