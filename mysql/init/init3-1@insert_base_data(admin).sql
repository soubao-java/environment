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

INSERT INTO `admin_role` VALUES (1, 1, 1);

INSERT INTO `role` VALUES (1, '超级管理员', '超级管理员', '2021-01-12 17:16:34', '2021-01-12 17:16:34', 0);

INSERT INTO `menu` VALUES (1604, 1572, '1572', 'video_list', 1, '/setup/wechat/material_manage/video_list', '', 0, '2021-01-15 05:07:48', '2021-01-15 05:07:48', 0), (1601, 1572, '1572', 'material_manage', 1, '/setup/wechat/material_manage', '', 0, '2021-01-15 05:07:30', '2021-01-15 05:07:30', 0), (1602, 1572, '1572', 'news', 1, '/setup/wechat/material_manage/news', '', 0, '2021-01-15 05:07:36', '2021-01-15 05:07:36', 0), (1603, 1572, '1572', 'news_list', 1, '/setup/wechat/material_manage/news_list', '', 0, '2021-01-15 05:07:42', '2021-01-15 05:07:42', 0), (1600, 1572, '1572', 'image_list', 1, '/setup/wechat/material_manage/image_list', '', 0, '2021-01-15 05:07:24', '2021-01-15 05:07:24', 0), (1599, 1572, '1572', 'follower_list', 1, '/setup/wechat/follower/follower_list', '', 0, '2021-01-15 05:07:17', '2021-01-15 05:07:17', 0), (1598, 1572, '1572', 'subdomain_set', 1, '/setup/shop_set/subdomain/subdomain_set', '', 0, '2021-01-15 05:07:11', '2021-01-15 05:07:11', 0), (1597, 1572, '1572', 'subdomain_list', 1, '/setup/shop_set/subdomain/subdomain_list', '', 0, '2021-01-15 05:07:05', '2021-01-15 05:07:05', 0), (1596, 1572, '1572', 'subdomain_edit', 1, '/setup/shop_set/subdomain/subdomain_edit', '', 0, '2021-01-15 05:06:59', '2021-01-15 05:06:59', 0), (1594, 1572, '1572', 'reply', 1, '/setup/wechat/reply', '', 0, '2021-01-15 05:06:46', '2021-01-15 05:06:46', 0), (1595, 1572, '1572', 'wx_menu', 1, '/setup/wechat/wx_menu', '', 0, '2021-01-15 05:06:53', '2021-01-15 05:06:53', 0), (1593, 1572, '1572', 'miniapp', 1, '/setup/wechat/miniapp', '', 0, '2021-01-15 05:06:40', '2021-01-15 05:06:40', 0), (1592, 1572, '1572', 'material_manage', 1, '/setup/wechat/material_manage', '', 0, '2021-01-15 05:06:35', '2021-01-15 05:06:35', 0), (1591, 1572, '1572', 'subdomain', 1, '/setup/shop_set/subdomain', '', 0, '2021-01-15 05:06:28', '2021-01-15 05:06:28', 0), (1590, 1572, '1572', 'push', 1, '/setup/shop_set/push', '', 0, '2021-01-15 05:06:23', '2021-01-15 05:06:23', 0), (1588, 1572, '1572', 'login_plugin', 1, '/setup/plugin_set/login_plugin', '', 0, '2021-01-15 05:06:11', '2021-01-15 05:06:11', 0), (1589, 1572, '1572', 'pay_plugin', 1, '/setup/plugin_set/pay_plugin', '', 0, '2021-01-15 05:06:17', '2021-01-15 05:06:17', 0), (1534, 1532, '1532,1509', '海报详情', 1, '/page/ad/poster_admin', '', 0, '2021-01-15 04:56:03', '2021-01-15 04:56:03', 0), (1533, 1532, '1532,1509', '广告列表', 1, '/page/ad/ad_list', '', 0, '2021-01-15 04:55:55', '2021-01-15 06:58:04', 0), (1532, 1509, '1509', '广告', 1, '/page/ad', '', 0, '2021-01-15 04:55:47', '2021-01-15 06:58:22', 0), (1531, 1528, '1509,1528', '帮助内容', 1, '/page/article/help/help_content_list', '', 0, '2021-01-15 04:55:42', '2021-01-15 04:55:42', 0), (1530, 1528, '1509,1528', '帮助类型', 1, '/page/article/help/help_type_list', '', 0, '2021-01-15 04:55:33', '2021-01-15 04:55:33', 0), (1529, 1528, '1509,1528', '帮助管理', 1, '/page/article/help/help_content', '', 0, '2021-01-15 04:55:25', '2021-01-15 04:55:25', 0), (1528, 1509, '1509', '商家入驻', 1, '/page/article/help_list', '', 0, '2021-01-15 04:55:17', '2021-01-15 04:55:17', 0), (1527, 1526, '1509,1526', '会员协议列表', 1, '/page/article/system_article_list', '', 0, '2021-01-15 04:55:12', '2021-01-15 07:03:16', 0), (1526, 1509, '1509', '会员协议', 1, '/page/system_article', '', 0, '2021-01-15 04:55:03', '2021-01-15 07:02:21', 0), (1525, 1509, '1509', 'friend_link', 1, '/page/article/friend_link', '', 0, '2021-01-15 04:54:58', '2021-01-15 07:08:15', 0), (1524, 1509, '1509', '友情链接', 1, '/page/article', '', 0, '2021-01-15 04:54:49', '2021-01-15 07:07:49', 0), (1523, 1522, '1522,1509', '文章管理', 1, '/page/article/article_list', '', 0, '2021-01-15 04:54:43', '2021-01-15 07:12:19', 0), (1522, 1509, '1509', '文章列表', 1, '/page/article', '', 0, '2021-01-15 04:54:36', '2021-01-15 07:12:04', 0), (1521, 1520, '1520,1509', '新闻管理', 1, '/page/news/news_list', '', 0, '2021-01-15 04:54:30', '2021-01-15 07:19:14', 0), (1520, 1509, '1509', '新闻列表', 1, '/page/news', '', 0, '2021-01-15 04:54:22', '2021-01-15 07:19:07', 0), (1519, 1517, '1509,1517', 'pc首页', 1, '/page/pc/pc_index', '', 0, '2021-01-15 04:54:17', '2021-01-15 21:07:43', 0), (1518, 1517, '1509,1517', '广告编辑', 1, '/page/ad/ad_edit', '', 0, '2021-01-15 04:54:09', '2021-01-15 04:54:09', 0), (1517, 1509, '1509', 'pc首页', 1, '/page/pc', '', 0, '2021-01-15 04:54:00', '2021-01-15 21:06:07', 0), (1516, 1509, '1509', 'news_comment_list', 1, '/page/news/news_comment_list', '', 0, '2021-01-15 04:53:55', '2021-01-15 04:53:55', 0), (1515, 1509, '1509', 'pc_block_design', 1, '/page/pc/pc_block_design', '', 0, '2021-01-15 04:53:49', '2021-01-15 04:53:49', 0), (1514, 1509, '1509', 'pc_section', 1, '/page/pc/pc_section', '', 0, '2021-01-15 04:53:43', '2021-01-15 04:53:43', 0), (1513, 1509, '1509', 'update_trial_poster', 1, '/page/ad/update_trial_poster', '', 0, '2021-01-15 04:53:37', '2021-01-15 04:53:37', 0), (1512, 1509, '1509', '文章分类', 1, '/page/article/article_cat_list', '', 0, '2021-01-15 04:53:31', '2021-01-15 04:53:31', 0), (1511, 1509, '1509', '新闻分类', 1, '/page/news/news_cat_list', '', 0, '2021-01-15 04:53:26', '2021-01-15 04:53:26', 0), (1510, 1509, '1509', '个人中心', 1, '/page/app/user_center', '', 0, '2021-01-15 04:53:19', '2021-01-15 04:53:19', 0), (1509, 0, '', '页面', 1, '/page', '', 0, '2021-01-15 04:53:14', '2021-01-15 04:53:14', 0), (1508, 1507, '1484,1507', '会员签到', 1, '/market/user_sign/user_sign_list', '', 0, '2021-01-15 04:44:53', '2021-01-15 04:44:53', 0), (1507, 1484, '1484', '用户签到', 1, '/market/user_sign', '', 0, '2021-01-15 04:44:44', '2021-01-15 04:44:44', 0), (1506, 1505, '1484,1505', '会员等级管理', 1, '/market/member_levels', '', 0, '2021-01-15 04:44:39', '2021-01-15 21:39:58', 0), (1505, 1484, '1484', '会员等级', 1, '/market/member_levels', '', 0, '2021-01-15 04:44:30', '2021-01-15 04:44:30', 0), (1504, 1484, '1484', '添加会员', 1, '/market/add_member', '', 0, '2021-01-15 04:44:24', '2021-01-15 21:42:00', 0), (1503, 1484, '1484', '会员资金调节', 1, '/market/add_account', '', 0, '2021-01-15 04:44:16', '2021-01-15 21:42:16', 0), (1502, 1484, '1484', '会员信息管理', 1, '/market/member_details', '', 0, '2021-01-15 04:44:08', '2021-01-15 21:43:16', 0), (1501, 1484, '1484', '资金记录列表', 1, '/market/member_account', '', 0, '2021-01-15 04:44:00', '2021-01-15 21:42:53', 0), (1500, 1484, '1484', '会员收货地址', 1, '/market/member_address', '', 0, '2021-01-15 04:43:52', '2021-01-15 21:43:02', 0), (1499, 1484, '1484', '会员列表', 1, '/market/members', '', 0, '2021-01-15 04:43:43', '2021-01-15 04:43:43', 0), (1657, 1484, '1484', 'inventory_goods', 1, '/market/inventory_goods', '', 0, '2021-01-15 21:51:50', '2021-01-15 21:51:50', 0), (1498, 1497, '1497,1484', '商品清单列表', 1, '/market/inventory', '', 0, '2021-01-15 04:43:38', '2021-01-15 21:50:52', 0), (1497, 1484, '1484', '商品清单', 1, '/market/inventory', '', 0, '2021-01-15 04:43:30', '2021-01-15 04:43:30', 0), (1496, 1495, '1484,1495', '品牌管理', 1, '/market/brands', '', 0, '2021-01-15 04:43:24', '2021-01-15 21:53:49', 0), (1495, 1484, '1484', '品牌列表', 1, '/market/brands', '', 0, '2021-01-15 04:43:16', '2021-01-15 04:43:16', 0), (1494, 1493, '1484,1493', '添加修改模型', 1, '/market/goods_types', '', 0, '2021-01-15 04:43:10', '2021-01-15 21:56:09', 0), (1493, 1484, '1484', '商品模型', 1, '/market/goods_types', '', 0, '2021-01-15 04:43:02', '2021-01-15 04:43:02', 0), (1492, 1491, '1484,1491', '添加修改分类', 1, '/market/goods_categories', '', 0, '2021-01-15 04:42:56', '2021-01-15 22:17:53', 0), (1491, 1484, '1484', '商品分类', 1, '/market/goods_categories', '', 0, '2021-01-15 04:42:49', '2021-01-15 22:16:17', 0), (1490, 1484, '1484', 'tax', 1, '/market/tax', '', 0, '2021-01-15 04:42:42', '2021-01-15 04:42:42', 0), (1661, 1456, '1456', '售后详情_returned_detail', 1, '/order/returned_detail', '', 0, '2021-01-15 22:57:45', '2021-01-15 22:57:45', 0), (1488, 1484, '1484', '充值面额', 1, '/market/recharge_face', '', 0, '2021-01-15 04:42:31', '2021-01-15 04:42:31', 0), (1487, 1484, '1484', '充值记录', 1, '/market/recharge_record', '', 0, '2021-01-15 04:42:25', '2021-01-15 04:42:25', 0), (1486, 1484, '1484', '库存日志', 1, '/market/stock_log', '', 0, '2021-01-15 04:42:20', '2021-01-15 04:42:20', 0), (1485, 1484, '1484', '商品列表', 1, '/market/goods', '', 0, '2021-01-15 04:42:14', '2021-01-15 04:42:14', 0), (1484, 0, '', '商城', 1, '/market', '', 0, '2021-01-15 04:42:08', '2021-01-15 04:42:08', 0), (1483, 1456, '1456', 'expose_detail', 1, '/order/expose_detail', '', 0, '2021-01-15 04:42:04', '2021-01-15 22:27:36', 0), (1482, 1456, '1456', '添加举报类型_add_expose_type', 1, '/order/add_expose_type', '', 0, '2021-01-15 04:41:56', '2021-01-15 22:29:58', 0), (1481, 1456, '1456', '添加举报主题_add_expose_subject', 1, '/order/add_expose_subject', '', 0, '2021-01-15 04:41:49', '2021-01-15 22:30:26', 0), (1480, 1456, '1456', '主题设置_expose_subject', 1, '/order/expose_subject', '', 0, '2021-01-15 04:41:41', '2021-01-15 22:31:40', 0), (1479, 1456, '1456', '新增投诉主题_add_subject', 1, '/order/add_subject', '', 0, '2021-01-15 04:41:33', '2021-01-15 22:32:11', 0), (1478, 1456, '1456', '类型设置_expose_type', 1, '/order/expose_type', '', 0, '2021-01-15 04:41:25', '2021-01-15 22:29:21', 0), (1477, 1456, '1456', '举报管理', 1, '/order/expose', '', 0, '2021-01-15 04:41:17', '2021-01-15 04:41:17', 0), (1476, 1456, '1456', '失效设置_complain_subject', 1, '/order/complain_subject', '', 0, '2021-01-15 04:41:12', '2021-01-15 22:44:16', 0), (1475, 1456, '1456', '时效设置_complain_time', 1, '/order/complain_time', '', 0, '2021-01-15 04:41:04', '2021-01-15 22:47:23', 0), (1474, 1456, '1456', '新增投诉管理_add_subject', 1, '/order/add_subject', '', 0, '2021-01-15 04:40:55', '2021-01-15 22:48:14', 0), (1473, 1456, '1456', '投诉管理详情_complain_detail', 1, '/order/complain_detail', '', 0, '2021-01-15 04:40:47', '2021-01-15 22:47:54', 0), (1472, 1456, '1456', '投诉管理', 1, '/order/complains', '', 0, '2021-01-15 04:40:40', '2021-01-15 04:40:40', 0), (1471, 1470, '1456,1470', '售后退货列表', 1, '/order/returned', '', 0, '2021-01-15 04:40:33', '2021-01-15 22:56:29', 0), (1470, 1456, '1456', '售后退货', 1, '/order/returned', '', 0, '2021-01-15 04:40:25', '2021-01-15 04:40:25', 0), (1469, 1468, '1468,1456', '商品订单', 1, '/order/orders', '', 0, '2021-01-15 04:40:20', '2021-01-15 23:00:22', 0), (1468, 1456, '1456', '订单列表', 1, '/order/orders', '', 0, '2021-01-15 04:40:12', '2021-01-15 04:40:12', 0), (1467, 1456, '1456', 'trial_order_list', 1, '/order/trial_order_list', '', 0, '2021-01-15 04:40:06', '2021-01-15 04:40:06', 0), (1466, 1456, '1456', '商品咨询', 1, '/order/goods_consult', '', 0, '2021-01-15 04:40:01', '2021-01-15 04:40:01', 0), (1465, 1456, '1456', '商品评论', 1, '/order/comment', '', 0, '2021-01-15 04:39:54', '2021-01-15 04:39:54', 0), (1464, 1456, '1456', '换货维修', 1, '/order/repairs', '', 0, '2021-01-15 04:39:49', '2021-01-15 04:39:49', 0), (1463, 1456, '1456', '发票管理', 1, '/order/invoice', '', 0, '2021-01-15 04:39:43', '2021-01-15 04:39:43', 0), (1462, 1456, '1456', '退换货', 1, '/order/return', '', 0, '2021-01-15 04:39:37', '2021-01-15 04:39:37', 0), (1460, 1456, '1456', '试用退款单', 1, '/order/trial_goods_refund', '', 0, '2021-01-15 04:39:26', '2021-01-15 04:39:26', 0), (1461, 1456, '1456', '退款单', 1, '/order/refund_order', '', 0, '2021-01-15 04:39:32', '2021-01-15 04:39:32', 0), (1459, 1456, '1456', '订单日志', 1, '/order/order_log', '', 0, '2021-01-15 04:39:21', '2021-01-15 04:39:21', 0), (1458, 1456, '1456', '拼团订单', 1, '/order/team', '', 0, '2021-01-15 04:39:14', '2021-01-15 04:39:14', 0), (1457, 1456, '1456', '拼团列表', 1, '/order/founds', '', 0, '2021-01-15 04:39:09', '2021-01-15 04:39:09', 0), (1456, 0, '', '订单', 1, '/order', '', 0, '2021-01-15 04:39:03', '2021-01-15 04:39:03', 0), (1449, 1426, '1426', '优惠劵详情_coupon_list', 1, '/marketing/coupon_list', '', 0, '2021-01-15 04:32:23', '2021-01-16 01:54:36', 0), (1448, 1426, '1426', 'newbie_coupons_details_新手优惠劵详情', 1, '/marketing/newbie_coupons_details', '', 0, '2021-01-15 04:32:15', '2021-01-16 01:58:08', 0), (1447, 1426, '1426', 'newbie_coupons_edit_编辑新人优惠劵', 1, '/marketing/newbie_coupons_edit', '', 0, '2021-01-15 04:32:08', '2021-01-16 01:57:36', 0), (1446, 1426, '1426', '新人优惠劵', 1, '/marketing/newbie_coupons', '', 0, '2021-01-15 04:32:00', '2021-01-15 04:32:00', 0), (1445, 1426, '1426', 'marketing/coupon_编辑代金券', 1, '/marketing/coupon', '', 0, '2021-01-15 04:31:53', '2021-01-16 01:45:30', 0), (1444, 1443, '1426,1443', '优惠劵列表', 1, '/marketing/coupons', '', 0, '2021-01-15 04:31:46', '2021-01-16 01:47:31', 0), (1443, 1426, '1426', '优惠劵', 1, '/marketing/coupons', '', 0, '2021-01-15 04:31:38', '2021-01-15 04:31:38', 0), (1442, 1426, '1426', 'luckdraw_team', 1, '/marketing/luckdraw_team', '', 0, '2021-01-15 04:31:32', '2021-01-15 04:31:32', 0), (1441, 1426, '1426', 'discount', 1, '/marketing/discount', '', 0, '2021-01-15 04:31:26', '2021-01-15 04:31:26', 0), (1440, 1426, '1426', 'collocation_info', 1, '/marketing/collocation_info', '', 0, '2021-01-15 04:31:20', '2021-01-15 04:31:20', 0), (1439, 1426, '1426', 'team_activity', 1, '/marketing/team_activity', '', 0, '2021-01-15 04:31:14', '2021-01-15 04:31:14', 0), (1438, 1426, '1426', 'order_pro', 1, '/marketing/order_pro', '', 0, '2021-01-15 04:31:09', '2021-01-15 04:31:09', 0), (1437, 1426, '1426', '拼团购', 1, '/marketing/share_team', '', 0, '2021-01-15 04:31:02', '2021-01-16 01:34:55', 0), (1664, 1426, '1426', '优惠券面额', 1, '/marketing/coupon_add', '', 0, '2021-01-16 01:56:09', '2021-01-16 01:56:09', 0), (1434, 1426, '1426', '试用商品', 1, '/marketing/trial_goodslist', '', 0, '2021-01-15 04:30:45', '2021-01-15 04:30:45', 0), (1433, 1426, '1426', '搭配购管理', 1, '/marketing/collocation', '', 0, '2021-01-15 04:30:40', '2021-01-15 04:30:40', 0), (1432, 1426, '1426', '预售管理', 1, '/marketing/pre_sell', '', 0, '2021-01-15 04:30:34', '2021-01-15 04:30:34', 0), (1431, 1426, '1426', '订单促销', 1, '/marketing/prom_order', '', 0, '2021-01-15 04:30:29', '2021-01-15 04:30:29', 0), (1430, 1426, '1426', '优惠促销', 1, '/marketing/prom_goods', '', 0, '2021-01-15 04:30:22', '2021-01-15 04:30:22', 0), (1429, 1426, '1426', '团购管理', 1, '/marketing/group_buy', '', 0, '2021-01-15 04:30:17', '2021-01-15 04:30:17', 0), (1428, 1426, '1426', '抢购管理', 1, '/marketing/flash_sale', '', 0, '2021-01-15 04:30:11', '2021-01-15 04:30:11', 0), (1427, 1426, '1426', '营销菜单', 1, '/marketing/menu', '', 0, '2021-01-15 04:30:05', '2021-01-15 04:30:05', 0), (1426, 0, '', '营销', 1, '/marketing', '', 0, '2021-01-15 04:30:00', '2021-01-15 04:30:00', 0), (1425, 1418, '1418', 'my_store_manage', 1, '/distribution/my_store_manage', '', 0, '2021-01-15 04:29:57', '2021-01-15 04:29:57', 0), (1424, 1418, '1418', '分成日志', 1, '/distribution/rebate_log', '', 0, '2021-01-15 04:29:50', '2021-01-15 04:29:50', 0), (1423, 1418, '1418', '分销商等级', 1, '/distribution/distribut_level', '', 0, '2021-01-15 04:29:45', '2021-01-15 04:29:45', 0), (1422, 1418, '1418', '分销设置', 1, '/setup/shop_set/distribut', '', 0, '2021-01-15 04:29:39', '2021-01-15 04:29:39', 0), (1421, 1418, '1418', '分销关系', 1, '/distribution/distribut_relation', '', 0, '2021-01-15 04:29:33', '2021-01-15 04:29:33', 0), (1420, 1418, '1418', '分销商列表', 1, '/distribution/distributor_list', '', 0, '2021-01-15 04:29:28', '2021-01-15 04:29:28', 0), (1419, 1418, '1418', '分销商品', 1, '/distribution/distribution_goods_list', '', 0, '2021-01-15 04:29:21', '2021-01-15 04:29:21', 0), (1418, 0, '', '分销', 1, '/distribution', '', 0, '2021-01-15 04:29:15', '2021-01-15 04:29:15', 0), (1417, 1415, '1415,1392', '会员提现申请详情', 1, '/statistics/user_withdrawals_details', '', 0, '2021-01-15 04:29:12', '2021-01-15 04:29:12', 0), (1416, 1415, '1415,1392', '商家提现申请详情', 1, '/statistics/store_withdrawals_details', '', 0, '2021-01-15 04:29:04', '2021-01-15 04:29:04', 0), (1415, 1392, '1392', '会员提现申请', 1, '/statistics/user_withdrawals', '', 0, '2021-01-15 04:28:56', '2021-01-15 04:28:56', 0), (1414, 1409, '1409,1392', '用户分析', 1, '/statistics/operation_report/user_analysis', '', 0, '2021-01-15 04:28:50', '2021-01-15 04:28:50', 0), (1413, 1409, '1409,1392', '购物调查', 1, '/statistics/operation_report/shop_survey', '', 0, '2021-01-15 04:28:42', '2021-01-15 04:28:42', 0), (1412, 1409, '1409,1392', '商品调查', 1, '/statistics/operation_report/goods_survey', '', 0, '2021-01-15 04:28:33', '2021-01-15 04:28:33', 0), (1411, 1409, '1409,1392', ' 统计', 1, '/statistics/operation_report/funnel', '', 0, '2021-01-15 04:28:25', '2021-01-15 04:28:25', 0), (1410, 1409, '1409,1392', '活动调查', 1, '/statistics/operation_report/activity_survey', '', 0, '2021-01-15 04:28:18', '2021-01-15 04:28:18', 0), (1409, 1392, '1392', '运营概况', 1, '/statistics/finance', '', 0, '2021-01-15 04:28:10', '2021-01-15 04:28:10', 0), (1408, 1392, '1392', 'operation_report', 1, '/statistics/operation_report', '', 0, '2021-01-15 04:28:03', '2021-01-15 04:28:03', 0), (1407, 1392, '1392', 'finance_order', 1, '/statistics/finance_order', '', 0, '2021-01-15 04:27:58', '2021-01-15 04:27:58', 0), (1406, 1392, '1392', 'store_order_content', 1, '/statistics/store_order_content', '', 0, '2021-01-15 04:27:51', '2021-01-15 04:27:51', 0), (1405, 1392, '1392', 'statistics', 1, '/statistics/statistics', '', 0, '2021-01-15 04:27:45', '2021-01-15 04:27:45', 0), (1404, 1392, '1392', 'statistics_set', 1, '/statistics/statistics_set', '', 0, '2021-01-15 04:27:40', '2021-01-15 04:27:40', 0), (1403, 1392, '1392', 'report_order', 1, '/statistics/report_order', '', 0, '2021-01-15 04:27:34', '2021-01-15 04:27:34', 0), (1402, 1392, '1392', '销售排行', 1, '/statistics/sales_ranking', '', 0, '2021-01-15 04:27:28', '2021-01-15 04:27:28', 0), (1401, 1392, '1392', '会员转款列表', 1, '/statistics/user_remittance', '', 0, '2021-01-15 04:27:22', '2021-01-15 04:27:22', 0), (1400, 1392, '1392', '会员排行', 1, '/statistics/user_top', '', 0, '2021-01-15 04:27:17', '2021-01-15 04:27:17', 0), (1399, 1392, '1392', '会员统计', 1, '/statistics/user_report', '', 0, '2021-01-15 04:27:11', '2021-01-15 04:27:11', 0), (1398, 1392, '1392', '平台支出记录', 1, '/statistics/expense_log', '', 0, '2021-01-15 04:27:05', '2021-01-15 04:27:05', 0), (1397, 1392, '1392', '商家结算记录', 1, '/statistics/order_statis', '', 0, '2021-01-15 04:27:00', '2021-01-15 04:27:00', 0), (1396, 1392, '1392', '商家转款列表', 1, '/statistics/store_remittance_list', '', 0, '2021-01-15 04:26:53', '2021-01-15 04:26:53', 0), (1395, 1392, '1392', '商家提现申请', 1, '/statistics/store_withdrawals', '', 0, '2021-01-15 04:26:47', '2021-01-15 04:26:47', 0), (1394, 1392, '1392', '销售明细', 1, '/statistics/sale_list', '', 0, '2021-01-15 04:26:42', '2021-01-15 04:26:42', 0), (1393, 1392, '1392', '销售概况', 1, '/statistics/report', '', 0, '2021-01-15 04:26:37', '2021-01-15 04:26:37', 0), (1392, 0, '', '统计', 1, '/statistics', '', 0, '2021-01-15 04:26:31', '2021-01-15 04:26:31', 0), (1391, 1390, '1363,1390', '商家满意度', 1, '/seller/store_satisfaction/store_satisfaction_list', '', 0, '2021-01-15 04:24:06', '2021-01-15 04:24:06', 0), (1390, 1363, '1363', '店铺满意度', 1, '/seller/store_satisfaction', '', 0, '2021-01-15 04:23:57', '2021-01-15 04:23:57', 0), (1389, 1363, '1363', '店铺帮助', 1, '/page/article/help/help_content_list', '', 0, '2021-01-15 04:23:52', '2021-01-16 03:03:44', 0), (1388, 1363, '1363', '消费者保障服务管理_guarantee_item', 1, '/seller/guarantee/guarantee_item', '', 0, '2021-01-15 04:23:46', '2021-01-16 02:44:18', 0), (1387, 1383, '1363,1383', '服务保障列表', 1, '/seller/guarantee/guarantee_item_list', '', 0, '2021-01-15 04:23:37', '2021-01-16 02:42:58', 0), (1667, 1363, '1363', 'guarantee_costlog_list', 1, '/seller/guarantee/guarantee_costlog_list', '', 0, '2021-01-16 02:54:32', '2021-01-16 02:54:32', 0), (1386, 1383, '1363,1383', '店铺保障服务', 1, '/seller/guarantee/guarantee_list', '', 0, '2021-01-15 04:23:30', '2021-01-15 04:23:30', 0), (1385, 1383, '1363,1383', '保障服务申请_guarantee_apply', 1, '/seller/guarantee/guarantee_apply', '', 0, '2021-01-15 04:23:22', '2021-01-16 02:49:44', 0), (1382, 1381, '1363,1381', '店铺等级列表', 1, '/seller/store_grade/store_grades', '', 0, '2021-01-15 04:23:00', '2021-01-16 02:40:13', 0), (1383, 1363, '1363', '消费者保障服务', 1, '/seller/guarantee', '', 0, '2021-01-15 04:23:05', '2021-01-15 04:23:05', 0), (1381, 1363, '1363', '店铺等级', 1, '/seller/store_grade', '', 0, '2021-01-15 04:22:52', '2021-01-16 02:35:45', 0), (1665, 1379, '1379,1363', '新增店铺分类', 1, '/seller/store_class/store_class', '', 0, '2021-01-16 02:28:23', '2021-01-16 02:28:23', 0), (1380, 1379, '1379,1363', '店铺分类列表', 1, '/seller/store_class/store_class_list', '', 0, '2021-01-15 04:22:45', '2021-01-16 02:24:51', 0), (1666, 1381, '1363,1381', '新增店铺等级', 1, '/seller/store_grade/store_grade', '', 0, '2021-01-16 02:31:54', '2021-01-16 02:39:12', 0), (1379, 1363, '1363', '店铺分类', 1, '/seller/store_class', '', 0, '2021-01-15 04:22:37', '2021-01-16 02:24:19', 0), (1375, 1371, '1363,1371', '经营类目审核', 1, '/seller/store_manage/apply_class_list', '', 0, '2021-01-15 04:22:10', '2021-01-15 04:22:10', 0), (1376, 1363, '1363', '店铺-新增_store_add', 1, '/seller/store_manage/store_add', '', 0, '2021-01-15 04:22:18', '2021-01-16 02:21:31', 0), (1377, 1363, '1363', '自营店铺', 1, '/seller/own_store/own_stores', '', 0, '2021-01-15 04:22:24', '2021-01-15 04:22:24', 0), (1374, 1371, '1363,1371', '签约审核', 1, '/seller/store_manage/reopen_list', '', 0, '2021-01-15 04:22:02', '2021-01-15 04:22:02', 0), (1371, 1363, '1363', '商家管理', 1, '/seller/store_manage', '', 0, '2021-01-15 04:21:38', '2021-01-15 04:21:38', 0), (1373, 1371, '1363,1371', '开店申请', 1, '/seller/store_manage/store_applys', '', 0, '2021-01-15 04:21:54', '2021-01-15 04:21:54', 0), (1372, 1371, '1363,1371', '店铺列表', 1, '/seller/store_manage/stores', '', 0, '2021-01-15 04:21:46', '2021-01-15 04:21:46', 0), (1370, 1363, '1363', 'reopen', 1, '/seller/store_manage/reopen', '', 0, '2021-01-15 04:21:33', '2021-01-15 04:21:33', 0), (1369, 1363, '1363', 'guarantee_log_list', 1, '/seller/guarantee/guarantee_log_list', '', 0, '2021-01-15 04:21:26', '2021-01-15 04:21:26', 0), (1366, 1363, '1363', 'store_detail', 1, '/seller/store_manage/store_detail', '', 0, '2021-01-15 04:21:08', '2021-01-15 04:21:08', 0), (1367, 1363, '1363', 'store_edit', 1, '/seller/store_manage/store_edit', '', 0, '2021-01-15 04:21:14', '2021-01-15 04:21:14', 0), (1368, 1363, '1363', 'guarantee_costlog_list', 1, '/seller/guarantee/guarantee_costlog_list', '', 0, '2021-01-15 04:21:21', '2021-01-15 04:21:21', 0), (1365, 1363, '1363', 'store_class_info', 1, '/seller/store_manage/store_class_info', '', 0, '2021-01-15 04:21:03', '2021-01-15 04:21:03', 0), (1364, 1363, '1363', 'store_apply_detail', 1, '/seller/store_manage/store_apply_detail', '', 0, '2021-01-15 04:20:56', '2021-01-15 04:20:56', 0), (1363, 0, '', '商家', 1, '/seller', '', 0, '2021-01-15 04:20:51', '2021-01-15 04:20:51', 0), (1318, 1315, '1315', '调度日志', 1, '/jobs/job_log', '', 0, '2021-01-15 04:09:28', '2021-01-15 04:09:28', 0), (1317, 1315, '1315', '任务管理', 1, '/jobs/job_info', '', 0, '2021-01-15 04:09:23', '2021-01-15 04:09:23', 0), (1316, 1315, '1315', '仪表盘', 1, '/jobs/dashboard', '', 0, '2021-01-15 04:09:17', '2021-01-15 04:09:17', 0), (1315, 0, '', '调度中心', 1, '/jobs', '', 0, '2021-01-15 04:09:11', '2021-01-15 04:09:11', 0), (1668, 1390, '1363,1390', '店铺评分', 1, '/seller/store_satisfaction/store_score_list', '', 0, '2021-01-16 03:06:48', '2021-01-16 03:06:48', 0), (1662, 1456, '1456', '订单详情_order_detail', 1, '/order/order_detail', '', 0, '2021-01-15 23:00:49', '2021-01-15 23:00:49', 0), (1660, 1484, '1484', '/market/goods_category', 1, '/market/goods_category', '', 0, '2021-01-15 22:15:18', '2021-01-15 22:15:18', 0), (1659, 1484, '1484', 'market/goods_type', 1, '/market/goods_type', '', 0, '2021-01-15 21:56:23', '2021-01-15 21:56:23', 0), (1658, 1484, '1484', 'market/brand', 1, '/market/brand', '', 0, '2021-01-15 21:54:08', '2021-01-15 21:54:08', 0), (1656, 1484, '1484', 'member_level', 1, '/market/member_level', '', 0, '2021-01-15 21:37:34', '2021-01-15 21:37:34', 0), (1655, 1507, '1484,1507', 'sign_config', 1, '/market/user_sign/sign_config', '', 0, '2021-01-15 21:32:35', '2021-01-15 21:35:16', 0), (1654, 1509, '1509', 'pc_section', 1, '/page/pc/pc_section', '', 0, '2021-01-15 21:14:50', '2021-01-15 21:14:50', 0), (1653, 1509, '1509', 'pc_block_design', 1, '/page/pc/pc_block_design', '', 0, '2021-01-15 21:14:29', '2021-01-15 21:14:29', 0), (1652, 1509, '1509', 'news', 1, '/page/news/news', '', 0, '2021-01-15 07:19:37', '2021-01-15 07:19:37', 0), (1650, 1509, '1509', 'news_comment_list', 1, '/page/news/news_comment_list', '', 0, '2021-01-15 07:18:14', '2021-01-15 07:18:14', 0), (1651, 1509, '1509', 'news_cat_list', 1, '/page/news/news_cat_list', '', 0, '2021-01-15 07:18:46', '2021-01-15 07:18:46', 0), (1644, 1572, '1572', 'shipping_details', 1, '/setup/shipping_set/shipping_details', '', 0, '2021-01-15 06:40:29', '2021-01-15 06:40:29', 0), (1645, 1509, '1509', 'poster_admin', 1, '/page/ad/poster_admin', '', 0, '2021-01-15 06:51:07', '2021-01-15 06:51:07', 0), (1646, 1509, '1509', 'ad_edit', 1, '/page/ad/ad_edit', '', 0, '2021-01-15 06:52:51', '2021-01-15 06:52:51', 0), (1647, 1509, '1509', 'system_article', 1, '/page/article/system_article', '', 0, '2021-01-15 07:04:33', '2021-01-15 07:04:56', 0), (1648, 1524, '1524,1509', '友情链接列表', 1, '/page/article/friend_link_list', '', 0, '2021-01-15 07:08:59', '2021-01-15 07:10:10', 0), (1649, 1509, '1509', 'article', 1, '/page/article/article', '', 0, '2021-01-15 07:13:34', '2021-01-15 07:13:34', 0), (1587, 1572, '1572', 'store_msg_tpl', 1, '/setup/msg_tpl/store_msg_tpl', '', 0, '2021-01-15 05:06:05', '2021-01-15 05:06:05', 0), (1586, 1572, '1572', 'store_msg_detail', 1, '/setup/msg_tpl/store_msg_detail', '', 0, '2021-01-15 05:05:59', '2021-01-15 05:05:59', 0), (1585, 1572, '1572', 'member_msg_tpl', 1, '/setup/msg_tpl/member_msg_tpl', '', 0, '2021-01-15 05:05:53', '2021-01-15 05:05:53', 0), (1584, 1572, '1572', 'member_msg_detail', 1, '/setup/msg_tpl/member_msg_detail', '', 0, '2021-01-15 05:05:47', '2021-01-15 05:05:47', 0), (1583, 1572, '1572', 'suppliers_detail', 1, '/setup/suppliers_detail', '', 0, '2021-01-15 05:05:40', '2021-01-15 05:05:40', 0), (1582, 1572, '1572', 'suppliers', 1, '/setup/suppliers', '', 0, '2021-01-15 05:05:35', '2021-01-15 05:05:35', 0), (1581, 1572, '1572', '第三方登录', 1, '/setup/third_login_set', '', 0, '2021-01-15 05:05:29', '2021-01-15 05:05:29', 0), (1580, 1572, '1572', '支付配置', 1, '/setup/pay_pal/set', '', 0, '2021-01-15 05:05:23', '2021-01-15 05:05:23', 0), (1579, 1572, '1572', '支付宝配置', 1, '/setup/ali_pay/ali_pay_set', '', 0, '2021-01-15 05:05:17', '2021-01-15 05:05:17', 0), (1578, 1572, '1572', '支付设置', 1, '/setup/wechat/pay_set', '', 0, '2021-01-15 05:05:11', '2021-01-15 05:05:11', 0), (1577, 1572, '1572', '微信用户', 1, '/setup/wechat/wx_user', '', 0, '2021-01-15 05:05:06', '2021-01-15 05:05:06', 0), (1576, 1572, '1572', '发送邮件', 1, '/setup/email', '', 0, '2021-01-15 05:05:00', '2021-01-15 05:05:00', 0), (1575, 1572, '1572', '管理列表', 1, '/setup/admin_list', '', 0, '2021-01-15 05:04:55', '2021-01-15 05:04:55', 0), (1574, 1572, '1572', 'SEO设置', 1, '/setup/seo_set', '', 0, '2021-01-15 05:04:48', '2021-01-15 05:04:48', 0), (1573, 1572, '1572', '地区&配送', 1, '/setup/address_with_send/address_with_send', '', 0, '2021-01-15 05:04:43', '2021-01-15 05:04:43', 0), (1572, 0, '', '设置', 1, '/setup', '', 0, '2021-01-15 05:04:37', '2021-01-15 05:04:37', 0), (1605, 1572, '1572', 'default', 1, '/setup/wechat/reply/default', '', 0, '2021-01-15 05:07:55', '2021-01-15 05:07:55', 0), (1606, 1572, '1572', 'follow', 1, '/setup/wechat/reply/follow', '', 0, '2021-01-15 05:08:00', '2021-01-15 05:08:00', 0), (1607, 1572, '1572', 'keyword', 1, '/setup/wechat/reply/keyword', '', 0, '2021-01-15 05:08:07', '2021-01-15 05:08:07', 0), (1608, 1572, '1572', 'addorUpNavigation', 1, '/setup/addorUpNavigation', '', 0, '2021-01-15 05:08:13', '2021-01-15 05:08:13', 0), (1609, 1572, '1572', 'day_navigation', 1, '/setup/day_navigation', '', 0, '2021-01-15 05:08:19', '2021-01-15 05:08:19', 0), (1610, 1572, '1572', 'emaillog', 1, '/setup/emaillog', '', 0, '2021-01-15 05:08:25', '2021-01-15 05:08:25', 0), (1611, 1572, '1572', 'emailreceiver', 1, '/setup/emailreceiver', '', 0, '2021-01-15 05:08:31', '2021-01-15 05:08:31', 0), (1612, 1572, '1572', 'menus', 1, '/setup/menus', '', 0, '2021-01-15 05:08:36', '2021-01-15 05:08:36', 0), (1613, 1572, '1572', 'plugin', 1, '/setup/plugin', '', 0, '2021-01-15 05:08:43', '2021-01-15 05:08:43', 0), (1614, 1572, '1572', 'plugins', 1, '/setup/plugins', '', 0, '2021-01-15 05:08:48', '2021-01-15 05:08:48', 0), (1615, 1572, '1572', 'roles', 1, '/setup/roles', '', 0, '2021-01-15 05:08:54', '2021-01-15 05:08:54', 0), (1616, 1572, '1572', '商城设置', 1, '/setup/shop_set', '', 0, '2021-01-15 05:09:00', '2021-01-15 05:09:00', 0), (1617, 1616, '1572,1616', '商城信息', 1, '/setup/shop_set/shop_info', '', 0, '2021-01-15 05:09:08', '2021-01-15 05:09:08', 0), (1618, 1616, '1572,1616', '基本设置', 1, '/setup/shop_set/basic_set', '', 0, '2021-01-15 05:09:17', '2021-01-15 05:09:17', 0), (1619, 1616, '1572,1616', '税费设置', 1, '/setup/shop_set/withdrawal_set', '', 0, '2021-01-15 05:09:25', '2021-01-15 05:09:25', 0), (1620, 1616, '1572,1616', '购物流程', 1, '/setup/shop_set/shopping', '', 0, '2021-01-15 05:09:33', '2021-01-15 05:09:33', 0), (1621, 1616, '1572,1616', '短信/邮件设置', 1, '/setup/shop_set/notice', '', 0, '2021-01-15 05:09:41', '2021-01-15 05:09:41', 0), (1622, 1616, '1572,1616', '水印设置', 1, '/setup/shop_set/water', '', 0, '2021-01-15 05:09:49', '2021-01-15 05:09:49', 0), (1623, 1616, '1572,1616', '分销设置', 1, '/setup/shop_set/distribut', '', 0, '2021-01-15 05:09:58', '2021-01-15 05:09:58', 0), (1624, 1616, '1572,1616', '对象存储', 1, '/setup/shop_set/oss', '', 0, '2021-01-15 05:10:06', '2021-01-15 05:10:06', 0), (1625, 1616, '1572,1616', '海报设置', 1, '/setup/shop_set/poster', '', 0, '2021-01-15 05:10:14', '2021-01-15 05:10:14', 0), (1626, 1616, '1572,1616', '小费/税费', 1, '/setup/shop_set/tip', '', 0, '2021-01-15 05:10:22', '2021-01-15 05:10:22', 0), (1627, 1572, '1572', '短信模板', 1, '/setup/sms_tpl', '', 0, '2021-01-15 05:10:28', '2021-01-15 05:10:28', 0), (1628, 1627, '1572,1627', '短信模板详情', 1, '/setup/sms_tpl_detail', '', 0, '2021-01-15 05:10:36', '2021-01-15 05:10:36', 0), (1629, 1572, '1572', '快递公司', 1, '/setup/shippings', '', 0, '2021-01-15 05:10:42', '2021-01-15 05:10:42', 0), (1630, 1629, '1572,1629', '快递设置', 1, '/setup/shipping_set/express', '', 0, '2021-01-15 05:10:50', '2021-01-15 05:10:50', 0), (1631, 1629, '1572,1629', '快递公司详情', 1, '/setup/shipping_set/shipping_details/:id', '', 0, '2021-01-15 05:10:59', '2021-01-15 05:10:59', 0), (1632, 1629, '1572,1629', '快递公司列表', 1, '/setup/shipping_set/shipping_list', '', 0, '2021-01-15 05:11:07', '2021-01-15 05:11:07', 0), (1633, 1572, '1572', '消息通知', 1, '/setup/msg_tpl', '', 0, '2021-01-15 05:11:13', '2021-01-15 05:11:13', 0), (1634, 1633, '1633,1572', '用户信息模板', 1, '/setup/msg_tpl/member_msg_tpl', '', 0, '2021-01-15 05:11:21', '2021-01-15 05:11:21', 0), (1635, 1633, '1633,1572', '商家消息模板', 1, '/setup/msg_tpl/store_msg_tpl', '', 0, '2021-01-15 05:11:29', '2021-01-15 05:11:29', 0), (1636, 1633, '1633,1572', '商家详情', 1, '/setup/msg_tpl/store_msg_detail', '', 0, '2021-01-15 05:11:38', '2021-01-15 06:25:00', 0), (1637, 1572, '1572', '邮件', 1, '/setup/emails', '', 0, '2021-01-15 05:11:44', '2021-01-15 05:11:44', 0), (1638, 1637, '1572,1637', '平台日志', 1, '/setup/emails/emaillog', '', 0, '2021-01-15 05:11:51', '2021-01-15 06:17:40', 0), (1639, 1637, '1572,1637', '商家日志', 1, '/setup/emails/selleremaillog', '', 0, '2021-01-15 05:12:00', '2021-01-15 06:17:30', 0), (1640, 1572, '1572', '其他', 1, '/setup/', '', 0, '2021-01-15 05:12:06', '2021-01-15 05:12:06', 0), (1641, 0, '', '首页', 1, '/home', '', 1, '2021-01-15 05:12:09', '2021-01-16 16:57:25', 0), (1642, 1641, '1641', '系统后台', 1, '/home/system', '', 1, '2021-01-15 05:12:15', '2021-01-16 17:15:20', 0), (1643, 1641, '1641', '业务流程', 1, '/home/explain', '', 1, '2021-01-15 05:12:20', '2021-01-16 16:39:09', 0);

INSERT INTO `role_menu` VALUES (1576, 1, 1654), (1575, 1, 1653), (1574, 1, 1652), (1573, 1, 1651), (1572, 1, 1650), (1571, 1, 1649), (1570, 1, 1648), (1569, 1, 1647), (1568, 1, 1646), (1567, 1, 1645), (1566, 1, 1644), (1565, 1, 1534), (1564, 1, 1533), (1563, 1, 1532), (1562, 1, 1531), (1561, 1, 1530), (1560, 1, 1529), (1559, 1, 1528), (1558, 1, 1527), (1557, 1, 1526), (1556, 1, 1525), (1555, 1, 1524), (1554, 1, 1523), (1553, 1, 1522), (1552, 1, 1521), (1551, 1, 1520), (1550, 1, 1519), (1549, 1, 1518), (1548, 1, 1517), (1547, 1, 1516), (1546, 1, 1515), (1545, 1, 1514), (1544, 1, 1513), (1543, 1, 1512), (1542, 1, 1511), (1541, 1, 1510), (1540, 1, 1509), (1539, 1, 1508), (1538, 1, 1507), (1537, 1, 1506), (1536, 1, 1505), (1535, 1, 1504), (1534, 1, 1503), (1533, 1, 1502), (1532, 1, 1501), (1531, 1, 1500), (1530, 1, 1499), (1529, 1, 1498), (1528, 1, 1497), (1527, 1, 1496), (1526, 1, 1495), (1525, 1, 1494), (1524, 1, 1493), (1523, 1, 1492), (1522, 1, 1491), (1521, 1, 1490), (1583, 1, 1661), (1519, 1, 1488), (1518, 1, 1487), (1517, 1, 1486), (1516, 1, 1485), (1515, 1, 1484), (1514, 1, 1483), (1513, 1, 1482), (1512, 1, 1481), (1511, 1, 1480), (1510, 1, 1479), (1509, 1, 1478), (1508, 1, 1477), (1507, 1, 1476), (1506, 1, 1475), (1505, 1, 1474), (1504, 1, 1473), (1503, 1, 1472), (1502, 1, 1471), (1501, 1, 1470), (1500, 1, 1469), (1499, 1, 1468), (1498, 1, 1467), (1497, 1, 1466), (1496, 1, 1465), (1495, 1, 1464), (1494, 1, 1463), (1493, 1, 1462), (1492, 1, 1461), (1491, 1, 1460), (1490, 1, 1459), (1489, 1, 1458), (1488, 1, 1457), (1487, 1, 1456), (1486, 1, 1449), (1485, 1, 1448), (1484, 1, 1447), (1483, 1, 1446), (1482, 1, 1445), (1481, 1, 1444), (1480, 1, 1443), (1479, 1, 1442), (1478, 1, 1441), (1477, 1, 1440), (1476, 1, 1439), (1475, 1, 1438), (1474, 1, 1437), (1590, 1, 1668), (1588, 1, 1666), (1471, 1, 1434), (1470, 1, 1433), (1469, 1, 1432), (1468, 1, 1431), (1467, 1, 1430), (1466, 1, 1429), (1465, 1, 1428), (1464, 1, 1427), (1463, 1, 1426), (1462, 1, 1425), (1461, 1, 1424), (1460, 1, 1423), (1459, 1, 1422), (1458, 1, 1421), (1457, 1, 1420), (1456, 1, 1419), (1455, 1, 1418), (1454, 1, 1417), (1453, 1, 1416), (1452, 1, 1415), (1451, 1, 1414), (1450, 1, 1413), (1449, 1, 1412), (1448, 1, 1411), (1447, 1, 1410), (1446, 1, 1409), (1445, 1, 1408), (1444, 1, 1407), (1443, 1, 1406), (1442, 1, 1405), (1441, 1, 1404), (1440, 1, 1403), (1439, 1, 1402), (1438, 1, 1401), (1437, 1, 1400), (1436, 1, 1399), (1435, 1, 1398), (1434, 1, 1397), (1433, 1, 1396), (1432, 1, 1395), (1431, 1, 1394), (1430, 1, 1393), (1429, 1, 1392), (1428, 1, 1391), (1427, 1, 1390), (1426, 1, 1389), (1425, 1, 1388), (1424, 1, 1387), (1423, 1, 1386), (1422, 1, 1385), (1589, 1, 1667), (1420, 1, 1383), (1419, 1, 1382), (1418, 1, 1381), (1417, 1, 1380), (1416, 1, 1379), (1587, 1, 1665), (1414, 1, 1377), (1413, 1, 1376), (1412, 1, 1375), (1411, 1, 1374), (1410, 1, 1373), (1409, 1, 1372), (1408, 1, 1371), (1407, 1, 1370), (1406, 1, 1369), (1405, 1, 1368), (1404, 1, 1367), (1403, 1, 1366), (1402, 1, 1365), (1401, 1, 1364), (1400, 1, 1363), (1399, 1, 1318), (1398, 1, 1317), (1397, 1, 1316), (1396, 1, 1315), (1395, 1, 1643), (1394, 1, 1642), (1393, 1, 1641), (1392, 1, 1640), (1391, 1, 1639), (1390, 1, 1638), (1389, 1, 1637), (1388, 1, 1636), (1387, 1, 1635), (1386, 1, 1634), (1385, 1, 1633), (1384, 1, 1632), (1383, 1, 1631), (1382, 1, 1630), (1381, 1, 1629), (1380, 1, 1628), (1379, 1, 1627), (1378, 1, 1626), (1377, 1, 1625), (1376, 1, 1624), (1375, 1, 1623), (1374, 1, 1622), (1373, 1, 1621), (1372, 1, 1620), (1371, 1, 1619), (1370, 1, 1618), (1369, 1, 1617), (1368, 1, 1616), (1367, 1, 1615), (1366, 1, 1614), (1365, 1, 1613), (1364, 1, 1612), (1363, 1, 1611), (1362, 1, 1610), (1361, 1, 1609), (1360, 1, 1608), (1359, 1, 1607), (1358, 1, 1606), (1357, 1, 1605), (1356, 1, 1604), (1355, 1, 1603), (1354, 1, 1602), (1353, 1, 1601), (1352, 1, 1600), (1351, 1, 1599), (1350, 1, 1598), (1349, 1, 1597), (1348, 1, 1596), (1347, 1, 1595), (1346, 1, 1594), (1345, 1, 1593), (1344, 1, 1592), (1343, 1, 1591), (1342, 1, 1590), (1341, 1, 1589), (1340, 1, 1588), (1339, 1, 1587), (1338, 1, 1586), (1337, 1, 1585), (1336, 1, 1584), (1335, 1, 1583), (1334, 1, 1582), (1333, 1, 1581), (1332, 1, 1580), (1331, 1, 1579), (1330, 1, 1578), (1329, 1, 1577), (1328, 1, 1576), (1327, 1, 1575), (1326, 1, 1574), (1325, 1, 1573), (1324, 1, 1572), (1577, 1, 1655), (1578, 1, 1656), (1579, 1, 1657), (1580, 1, 1658), (1581, 1, 1659), (1582, 1, 1660), (1584, 1, 1662), (1586, 1, 1664);

INSERT INTO `jobs_info` VALUES (5, NULL, 'jobs-mall', '0 0/1 * * * ?', 'activityJobHandler', NULL, 30, 3, 1609223580000, 1609223640000, 'soubao', '每分钟执行一次', 0, NULL, 1592622709000), (6, NULL, 'jobs-mall', '0 0 1 1 * ?', 'mouthJobHandler', NULL, 30, 3, 1606755600000, 1609434000000, 'soubao', '每月1号凌晨1点执行一次', 0, NULL, 1592638707000), (7, NULL, 'jobs-order', '0 0 */1 * * ?', 'autoReceiveJob', NULL, 30, 3, 1598259600000, 1611478800000, 'soubao', '每小时执行一次,自动收货确认', 0, NULL, 1592638707000), (9, NULL, 'jobs-order', '0 0 0 1-2 * ?', 'autoConfirmJob', NULL, 30, 3, 1606838400000, 1609430400000, 'soubao', '每天执行一次,分销记录自动分成', 0, NULL, 1592638707000), (10, NULL, 'jobs-user', '0 0 1 1 * ?', 'mouthJobHandler', NULL, 30, 3, 1606755600000, 1609434000000, 'soubao', '删除一个月以前的短信', 0, NULL, 1592793884000), (23, NULL, 'jobs-mall', '1 0 0 * * ?', 'dayJobHandler', NULL, 30, 3, 1608912001000, 1609257601000, 'soubao', '每天0点01秒执行一次', 0, NULL, 1597113303000), (24, NULL, 'jobs-mall', '0 0 /1 * * ? ', 'hourJobHandler', NULL, 30, 3, 1609221600000, 1609225200000, 'soubao', '每小时执行一次', 0, NULL, 1597115699000);
SET FOREIGN_KEY_CHECKS = 1;
