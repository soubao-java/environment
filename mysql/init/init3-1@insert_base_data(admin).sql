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

INSERT INTO `menu` VALUES (1604, 1572, '1572', 'video_list', 1, '/setup/wechat/material_manage/video_list', '', 0, '2021-01-15 05:07:48', '2021-01-15 05:07:48'), (1601, 1572, '1572', 'material_manage', 1, '/setup/wechat/material_manage', '', 0, '2021-01-15 05:07:30', '2021-01-15 05:07:30'), (1602, 1572, '1572', 'news', 1, '/setup/wechat/material_manage/news', '', 0, '2021-01-15 05:07:36', '2021-01-15 05:07:36'), (1603, 1572, '1572', 'news_list', 1, '/setup/wechat/material_manage/news_list', '', 0, '2021-01-15 05:07:42', '2021-01-15 05:07:42'), (1600, 1572, '1572', 'image_list', 1, '/setup/wechat/material_manage/image_list', '', 0, '2021-01-15 05:07:24', '2021-01-15 05:07:24'), (1599, 1572, '1572', 'follower_list', 1, '/setup/wechat/follower/follower_list', '', 0, '2021-01-15 05:07:17', '2021-01-15 05:07:17'), (1598, 1572, '1572', 'subdomain_set', 1, '/setup/shop_set/subdomain/subdomain_set', '', 0, '2021-01-15 05:07:11', '2021-01-15 05:07:11'), (1597, 1572, '1572', 'subdomain_list', 1, '/setup/shop_set/subdomain/subdomain_list', '', 0, '2021-01-15 05:07:05', '2021-01-15 05:07:05'), (1596, 1572, '1572', 'subdomain_edit', 1, '/setup/shop_set/subdomain/subdomain_edit', '', 0, '2021-01-15 05:06:59', '2021-01-15 05:06:59'), (1594, 1572, '1572', 'reply', 1, '/setup/wechat/reply', '', 0, '2021-01-15 05:06:46', '2021-01-15 05:06:46'), (1595, 1572, '1572', 'wx_menu', 1, '/setup/wechat/wx_menu', '', 0, '2021-01-15 05:06:53', '2021-01-15 05:06:53'), (1593, 1572, '1572', 'miniapp', 1, '/setup/wechat/miniapp', '', 0, '2021-01-15 05:06:40', '2021-01-15 05:06:40'), (1592, 1572, '1572', 'material_manage', 1, '/setup/wechat/material_manage', '', 0, '2021-01-15 05:06:35', '2021-01-15 05:06:35'), (1591, 1572, '1572', 'subdomain', 1, '/setup/shop_set/subdomain', '', 0, '2021-01-15 05:06:28', '2021-01-15 05:06:28'), (1590, 1572, '1572', 'push', 1, '/setup/shop_set/push', '', 0, '2021-01-15 05:06:23', '2021-01-15 05:06:23'), (1588, 1572, '1572', 'login_plugin', 1, '/setup/plugin_set/login_plugin', '', 0, '2021-01-15 05:06:11', '2021-01-15 05:06:11'), (1589, 1572, '1572', 'pay_plugin', 1, '/setup/plugin_set/pay_plugin', '', 0, '2021-01-15 05:06:17', '2021-01-15 05:06:17'), (1534, 1532, '1532,1509', '海报详情', 1, '/page/ad/poster_admin', '', 1, '2021-01-15 04:56:03', '2021-01-16 04:47:10'), (1533, 1532, '1532,1509', '广告列表', 1, '/page/ad/ad_list', '', 1, '2021-01-15 04:55:55', '2021-01-16 04:47:12'), (1532, 1509, '1509', '广告', 1, '/page/ad', '', 1, '2021-01-15 04:55:47', '2021-01-16 04:47:16'), (1531, 1528, '1509,1528', '帮助内容', 1, '/page/article/help/help_content_list', '', 1, '2021-01-15 04:55:42', '2021-01-16 04:47:23'), (1530, 1528, '1509,1528', '帮助类型', 1, '/page/article/help/help_type_list', '', 1, '2021-01-15 04:55:33', '2021-01-16 04:47:24'), (1529, 1528, '1509,1528', '帮助管理', 1, '/page/article/help/help_content', '', 1, '2021-01-15 04:55:25', '2021-01-16 04:47:25'), (1528, 1509, '1509', '商家入驻', 1, '/page/article/help_list', '', 0, '2021-01-15 04:55:17', '2021-01-16 04:47:30'), (1527, 1526, '1509,1526', '会员协议列表', 1, '/page/article/system_article_list', '', 1, '2021-01-15 04:55:12', '2021-01-16 04:47:41'), (1526, 1509, '1509', '会员协议', 1, '/page/system_article', '', 1, '2021-01-15 04:55:03', '2021-01-16 04:47:37'), (1525, 1509, '1509', 'friend_link', 1, '/page/article/friend_link', '', 0, '2021-01-15 04:54:58', '2021-01-15 07:08:15'), (1524, 1509, '1509', '友情链接', 1, '/page/article', '', 1, '2021-01-15 04:54:49', '2021-01-16 04:47:51'), (1523, 1522, '1522,1509', '文章管理', 1, '/page/article/article_list', '', 1, '2021-01-15 04:54:43', '2021-01-16 04:48:09'), (1522, 1509, '1509', '文章列表', 1, '/page/article', '', 1, '2021-01-15 04:54:36', '2021-01-16 04:48:05'), (1521, 1520, '1520,1509', '新闻管理', 1, '/page/news/news_list', '', 1, '2021-01-15 04:54:30', '2021-01-16 04:48:23'), (1520, 1509, '1509', '新闻列表', 1, '/page/news', '', 1, '2021-01-15 04:54:22', '2021-01-16 04:48:15'), (1519, 1517, '1509,1517', 'pc首页', 1, '/page/pc/pc_index', '', 1, '2021-01-15 04:54:17', '2021-01-16 04:48:33'), (1518, 1517, '1509,1517', '广告编辑', 1, '/page/ad/ad_edit', '', 1, '2021-01-15 04:54:09', '2021-01-16 04:48:36'), (1517, 1509, '1509', 'pc首页', 1, '/page/pc', '', 1, '2021-01-15 04:54:00', '2021-01-16 04:48:30'), (1516, 1509, '1509', 'news_comment_list', 1, '/page/news/news_comment_list', '', 0, '2021-01-15 04:53:55', '2021-01-15 04:53:55'), (1515, 1509, '1509', 'pc_block_design', 1, '/page/pc/pc_block_design', '', 0, '2021-01-15 04:53:49', '2021-01-15 04:53:49'), (1514, 1509, '1509', 'pc_section', 1, '/page/pc/pc_section', '', 0, '2021-01-15 04:53:43', '2021-01-15 04:53:43'), (1513, 1509, '1509', 'update_trial_poster', 1, '/page/ad/update_trial_poster', '', 0, '2021-01-15 04:53:37', '2021-01-15 04:53:37'), (1512, 1509, '1509', '文章分类', 1, '/page/article/article_cat_list', '', 1, '2021-01-15 04:53:31', '2021-01-16 04:48:46'), (1511, 1509, '1509', '新闻分类', 1, '/page/news/news_cat_list', '', 1, '2021-01-15 04:53:26', '2021-01-16 04:48:47'), (1510, 1509, '1509', '个人中心', 1, '/page/app/user_center', '', 1, '2021-01-15 04:53:19', '2021-01-16 04:48:49'), (1509, 0, '', '页面', 1, '/page', '', 0, '2021-01-15 04:53:14', '2021-01-15 04:53:14'), (1508, 1507, '1484,1507', '会员签到', 1, '/market/user_sign/user_sign_list', '', 1, '2021-01-15 04:44:53', '2021-01-16 04:49:07'), (1507, 1484, '1484', '用户签到', 1, '/market/user_sign', '', 1, '2021-01-15 04:44:44', '2021-01-16 04:49:10'), (1506, 1505, '1484,1505', '会员等级管理', 1, '/market/member_levels', '', 1, '2021-01-15 04:44:39', '2021-01-16 04:49:18'), (1505, 1484, '1484', '会员等级', 1, '/market/member_levels', '', 1, '2021-01-15 04:44:30', '2021-01-16 04:49:17'), (1504, 1484, '1484', '添加会员', 1, '/market/add_member', '', 1, '2021-01-15 04:44:24', '2021-01-16 04:49:39'), (1503, 1484, '1484', '会员资金调节', 1, '/market/add_account', '', 1, '2021-01-15 04:44:16', '2021-01-16 04:49:31'), (1502, 1484, '1484', '会员信息管理', 1, '/market/member_details', '', 1, '2021-01-15 04:44:08', '2021-01-16 04:49:44'), (1501, 1484, '1484', '资金记录列表', 1, '/market/member_account', '', 1, '2021-01-15 04:44:00', '2021-01-16 04:49:35'), (1500, 1484, '1484', '会员收货地址', 1, '/market/member_address', '', 1, '2021-01-15 04:43:52', '2021-01-16 04:49:37'), (1499, 1484, '1484', '会员列表', 1, '/market/members', '', 1, '2021-01-15 04:43:43', '2021-01-16 04:49:48'), (1657, 1484, '1484', 'inventory_goods', 1, '/market/inventory_goods', '', 0, '2021-01-15 21:51:50', '2021-01-15 21:51:50'), (1498, 1497, '1497,1484', '商品清单列表', 1, '/market/inventory', '', 1, '2021-01-15 04:43:38', '2021-01-16 04:49:53'), (1497, 1484, '1484', '商品清单', 1, '/market/inventory', '', 1, '2021-01-15 04:43:30', '2021-01-16 04:49:55'), (1496, 1495, '1484,1495', '品牌管理', 1, '/market/brands', '', 1, '2021-01-15 04:43:24', '2021-01-16 04:50:07'), (1495, 1484, '1484', '品牌列表', 1, '/market/brands', '', 1, '2021-01-15 04:43:16', '2021-01-16 04:50:04'), (1494, 1493, '1484,1493', '添加修改模型', 1, '/market/goods_types', '', 1, '2021-01-15 04:43:10', '2021-01-16 04:50:14'), (1493, 1484, '1484', '商品模型', 1, '/market/goods_types', '', 1, '2021-01-15 04:43:02', '2021-01-16 04:50:17'), (1492, 1491, '1484,1491', '添加修改分类', 1, '/market/goods_categories', '', 1, '2021-01-15 04:42:56', '2021-01-16 04:50:23'), (1491, 1484, '1484', '商品分类', 1, '/market/goods_categories', '', 1, '2021-01-15 04:42:49', '2021-01-16 04:50:22'), (1490, 1484, '1484', 'tax', 1, '/market/tax', '', 0, '2021-01-15 04:42:42', '2021-01-15 04:42:42'), (1661, 1456, '1456', '售后详情_returned_detail', 1, '/order/returned_detail', '', 0, '2021-01-15 22:57:45', '2021-01-15 22:57:45'), (1488, 1484, '1484', '充值面额', 1, '/market/recharge_face', '', 1, '2021-01-15 04:42:31', '2021-01-16 04:50:30'), (1487, 1484, '1484', '充值记录', 1, '/market/recharge_record', '', 1, '2021-01-15 04:42:25', '2021-01-16 04:50:33'), (1486, 1484, '1484', '库存日志', 1, '/market/stock_log', '', 1, '2021-01-15 04:42:20', '2021-01-16 04:50:35'), (1485, 1484, '1484', '商品列表', 1, '/market/goods', '', 1, '2021-01-15 04:42:14', '2021-01-16 04:50:43'), (1484, 0, '', '商城', 1, '/market', '', 0, '2021-01-15 04:42:08', '2021-01-15 04:42:08'), (1483, 1456, '1456', 'expose_detail', 1, '/order/expose_detail', '', 0, '2021-01-15 04:42:04', '2021-01-15 22:27:36'), (1482, 1456, '1456', '添加举报类型_add_expose_type', 1, '/order/add_expose_type', '', 0, '2021-01-15 04:41:56', '2021-01-15 22:29:58'), (1481, 1456, '1456', '添加举报主题_add_expose_subject', 1, '/order/add_expose_subject', '', 0, '2021-01-15 04:41:49', '2021-01-15 22:30:26'), (1480, 1456, '1456', '主题设置_expose_subject', 1, '/order/expose_subject', '', 0, '2021-01-15 04:41:41', '2021-01-15 22:31:40'), (1479, 1456, '1456', '新增投诉主题_add_subject', 1, '/order/add_subject', '', 0, '2021-01-15 04:41:33', '2021-01-15 22:32:11'), (1478, 1456, '1456', '类型设置_expose_type', 1, '/order/expose_type', '', 0, '2021-01-15 04:41:25', '2021-01-15 22:29:21'), (1477, 1456, '1456', '举报管理', 1, '/order/expose', '', 1, '2021-01-15 04:41:17', '2021-01-16 04:51:06'), (1476, 1456, '1456', '失效设置_complain_subject', 1, '/order/complain_subject', '', 0, '2021-01-15 04:41:12', '2021-01-15 22:44:16'), (1475, 1456, '1456', '时效设置_complain_time', 1, '/order/complain_time', '', 0, '2021-01-15 04:41:04', '2021-01-15 22:47:23'), (1474, 1456, '1456', '新增投诉管理_add_subject', 1, '/order/add_subject', '', 0, '2021-01-15 04:40:55', '2021-01-15 22:48:14'), (1473, 1456, '1456', '投诉管理详情_complain_detail', 1, '/order/complain_detail', '', 0, '2021-01-15 04:40:47', '2021-01-15 22:47:54'), (1472, 1456, '1456', '投诉管理', 1, '/order/complains', '', 1, '2021-01-15 04:40:40', '2021-01-16 04:51:15'), (1471, 1470, '1456,1470', '售后退货列表', 1, '/order/returned', '', 1, '2021-01-15 04:40:33', '2021-01-16 04:51:21'), (1470, 1456, '1456', '售后退货', 1, '/order/returned', '', 1, '2021-01-15 04:40:25', '2021-01-16 04:51:24'), (1469, 1468, '1468,1456', '商品订单', 1, '/order/orders', '', 1, '2021-01-15 04:40:20', '2021-01-16 04:51:28'), (1468, 1456, '1456', '订单列表', 1, '/order/orders', '', 1, '2021-01-15 04:40:12', '2021-01-16 04:51:30'), (1467, 1456, '1456', 'trial_order_list', 1, '/order/trial_order_list', '', 0, '2021-01-15 04:40:06', '2021-01-15 04:40:06'), (1466, 1456, '1456', '商品咨询', 1, '/order/goods_consult', '', 1, '2021-01-15 04:40:01', '2021-01-16 04:51:35'), (1465, 1456, '1456', '商品评论', 1, '/order/comment', '', 1, '2021-01-15 04:39:54', '2021-01-16 04:51:38'), (1464, 1456, '1456', '换货维修', 1, '/order/repairs', '', 1, '2021-01-15 04:39:49', '2021-01-16 04:51:44'), (1463, 1456, '1456', '发票管理', 1, '/order/invoice', '', 1, '2021-01-15 04:39:43', '2021-01-16 04:51:46'), (1462, 1456, '1456', '退换货', 1, '/order/return', '', 1, '2021-01-15 04:39:37', '2021-01-16 04:51:50'), (1460, 1456, '1456', '试用退款单', 1, '/order/trial_goods_refund', '', 1, '2021-01-15 04:39:26', '2021-01-16 04:51:55'), (1461, 1456, '1456', '退款单', 1, '/order/refund_order', '', 1, '2021-01-15 04:39:32', '2021-01-16 04:51:51'), (1459, 1456, '1456', '订单日志', 1, '/order/order_log', '', 1, '2021-01-15 04:39:21', '2021-01-16 04:51:59'), (1458, 1456, '1456', '拼团订单', 1, '/order/team', '', 1, '2021-01-15 04:39:14', '2021-01-16 04:52:03'), (1457, 1456, '1456', '拼团列表', 1, '/order/founds', '', 1, '2021-01-15 04:39:09', '2021-01-16 04:52:05'), (1456, 0, '', '订单', 1, '/order', '', 0, '2021-01-15 04:39:03', '2021-01-15 04:39:03'), (1449, 1426, '1426', '优惠劵详情_coupon_list', 1, '/marketing/coupon_list', '', 0, '2021-01-15 04:32:23', '2021-01-16 01:54:36'), (1448, 1426, '1426', 'newbie_coupons_details_新手优惠劵详情', 1, '/marketing/newbie_coupons_details', '', 0, '2021-01-15 04:32:15', '2021-01-16 01:58:08'), (1447, 1426, '1426', 'newbie_coupons_edit_编辑新人优惠劵', 1, '/marketing/newbie_coupons_edit', '', 0, '2021-01-15 04:32:08', '2021-01-16 01:57:36'), (1446, 1426, '1426', '新人优惠劵', 1, '/marketing/newbie_coupons', '', 1, '2021-01-15 04:32:00', '2021-01-16 04:53:06'), (1445, 1426, '1426', 'marketing/coupon_编辑代金券', 1, '/marketing/coupon', '', 0, '2021-01-15 04:31:53', '2021-01-16 01:45:30'), (1444, 1443, '1426,1443', '优惠劵列表', 1, '/marketing/coupons', '', 1, '2021-01-15 04:31:46', '2021-01-16 04:53:13'), (1443, 1426, '1426', '优惠劵', 1, '/marketing/coupons', '', 1, '2021-01-15 04:31:38', '2021-01-16 04:53:13'), (1442, 1426, '1426', 'luckdraw_team', 1, '/marketing/luckdraw_team', '', 0, '2021-01-15 04:31:32', '2021-01-15 04:31:32'), (1441, 1426, '1426', 'discount', 1, '/marketing/discount', '', 0, '2021-01-15 04:31:26', '2021-01-15 04:31:26'), (1440, 1426, '1426', 'collocation_info', 1, '/marketing/collocation_info', '', 0, '2021-01-15 04:31:20', '2021-01-15 04:31:20'), (1439, 1426, '1426', 'team_activity', 1, '/marketing/team_activity', '', 0, '2021-01-15 04:31:14', '2021-01-15 04:31:14'), (1438, 1426, '1426', 'order_pro', 1, '/marketing/order_pro', '', 0, '2021-01-15 04:31:09', '2021-01-15 04:31:09'), (1437, 1426, '1426', '拼团购', 1, '/marketing/share_team', '', 1, '2021-01-15 04:31:02', '2021-01-16 04:53:20'), (1664, 1426, '1426', '优惠券面额', 1, '/marketing/coupon_add', '', 1, '2021-01-16 01:56:09', '2021-01-16 04:53:01'), (1434, 1426, '1426', '试用商品', 1, '/marketing/trial_goodslist', '', 1, '2021-01-15 04:30:45', '2021-01-16 04:53:22'), (1433, 1426, '1426', '搭配购管理', 1, '/marketing/collocation', '', 1, '2021-01-15 04:30:40', '2021-01-16 04:53:23'), (1432, 1426, '1426', '预售管理', 1, '/marketing/pre_sell', '', 1, '2021-01-15 04:30:34', '2021-01-16 04:53:24'), (1431, 1426, '1426', '订单促销', 1, '/marketing/prom_order', '', 1, '2021-01-15 04:30:29', '2021-01-16 04:53:26'), (1430, 1426, '1426', '优惠促销', 1, '/marketing/prom_goods', '', 1, '2021-01-15 04:30:22', '2021-01-16 04:53:27'), (1429, 1426, '1426', '团购管理', 1, '/marketing/group_buy', '', 1, '2021-01-15 04:30:17', '2021-01-16 04:53:29'), (1428, 1426, '1426', '抢购管理', 1, '/marketing/flash_sale', '', 1, '2021-01-15 04:30:11', '2021-01-16 04:53:30'), (1427, 1426, '1426', '营销菜单', 1, '/marketing/menu', '', 1, '2021-01-15 04:30:05', '2021-01-16 04:53:34'), (1426, 0, '', '营销', 1, '/marketing', '', 0, '2021-01-15 04:30:00', '2021-01-15 04:30:00'), (1425, 1418, '1418', 'my_store_manage', 1, '/distribution/my_store_manage', '', 0, '2021-01-15 04:29:57', '2021-01-15 04:29:57'), (1424, 1418, '1418', '分成日志', 1, '/distribution/rebate_log', '', 1, '2021-01-15 04:29:50', '2021-01-16 04:53:45'), (1423, 1418, '1418', '分销商等级', 1, '/distribution/distribut_level', '', 1, '2021-01-15 04:29:45', '2021-01-16 04:53:46'), (1422, 1418, '1418', '分销设置', 1, '/setup/shop_set/distribut', '', 1, '2021-01-15 04:29:39', '2021-01-16 04:53:47'), (1421, 1418, '1418', '分销关系', 1, '/distribution/distribut_relation', '', 1, '2021-01-15 04:29:33', '2021-01-16 04:53:48'), (1420, 1418, '1418', '分销商列表', 1, '/distribution/distributor_list', '', 0, '2021-01-15 04:29:28', '2021-01-16 04:53:53'), (1419, 1418, '1418', '分销商品', 1, '/distribution/distribution_goods_list', '', 1, '2021-01-15 04:29:21', '2021-01-16 04:53:51'), (1418, 0, '', '分销', 1, '/distribution', '', 0, '2021-01-15 04:29:15', '2021-01-15 04:29:15'), (1417, 1392, '1392', 'user_withdrawals_details_会员提现申请详情', 1, '/statistics/user_withdrawals_details', '', 0, '2021-01-15 04:29:12', '2021-01-17 20:57:44'), (1416, 1392, '1392', 'store_withdrawals_details_商家提现申请详情', 1, '/statistics/store_withdrawals_details', '', 0, '2021-01-15 04:29:04', '2021-01-17 20:56:39'), (1415, 1392, '1392', '会员提现申请', 1, '/statistics/user_withdrawals', '', 1, '2021-01-15 04:28:56', '2021-01-17 20:12:54'), (1414, 1409, '1409,1392', '用户分析', 1, '/statistics/operation_report/user_analysis', '', 0, '2021-01-15 04:28:50', '2021-01-17 20:47:31'), (1413, 1409, '1409,1392', '购物调查', 1, '/statistics/operation_report/shop_survey', '', 1, '2021-01-15 04:28:42', '2021-01-17 20:13:34'), (1412, 1409, '1409,1392', '商品调查', 1, '/statistics/operation_report/goods_survey', '', 0, '2021-01-15 04:28:33', '2021-01-17 20:47:35'), (1411, 1409, '1409,1392', ' 统计', 1, '/statistics/operation_report/funnel', '', 0, '2021-01-15 04:28:25', '2021-01-17 20:47:39'), (1410, 1409, '1409,1392', '活动调查', 1, '/statistics/operation_report/activity_survey', '', 0, '2021-01-15 04:28:18', '2021-01-17 20:47:42'), (1409, 1392, '1392', '运营概况', 1, '/statistics/operation_report', '', 1, '2021-01-15 04:28:10', '2021-01-17 20:45:55'), (1408, 1392, '1392', 'operation_report', 1, '/statistics/operation_report', '', 0, '2021-01-15 04:28:03', '2021-01-17 21:14:18'), (1407, 1392, '1392', 'finance_order', 1, '/statistics/finance_order', '', 0, '2021-01-15 04:27:58', '2021-01-17 21:14:19'), (1406, 1392, '1392', 'store_order_content', 1, '/statistics/store_order_content', '', 0, '2021-01-15 04:27:51', '2021-01-17 21:14:20'), (1405, 1392, '1392', 'statistics', 1, '/statistics/statistics', '', 0, '2021-01-15 04:27:45', '2021-01-17 21:14:22'), (1404, 1392, '1392', 'statistics_set', 1, '/statistics/statistics_set', '', 0, '2021-01-15 04:27:40', '2021-01-17 21:14:24'), (1403, 1392, '1392', 'report_order', 1, '/statistics/report_order', '', 0, '2021-01-15 04:27:34', '2021-01-17 20:22:59'), (1402, 1392, '1392', '销售排行', 1, '/statistics/sales_ranking', '', 1, '2021-01-15 04:27:28', '2021-01-17 20:13:02'), (1401, 1392, '1392', '会员转款列表', 1, '/statistics/user_remittance', '', 1, '2021-01-15 04:27:22', '2021-01-17 20:13:04'), (1400, 1392, '1392', '会员排行', 1, '/statistics/user_top', '', 1, '2021-01-15 04:27:17', '2021-01-17 20:13:09'), (1399, 1392, '1392', '会员统计', 1, '/statistics/user_report', '', 1, '2021-01-15 04:27:11', '2021-01-17 20:13:09'), (1398, 1392, '1392', '平台支出记录', 1, '/statistics/expense_log', '', 1, '2021-01-15 04:27:05', '2021-01-17 20:13:11'), (1397, 1392, '1392', '商家结算记录', 1, '/statistics/order_statis', '', 1, '2021-01-15 04:27:00', '2021-01-17 20:13:11'), (1396, 1392, '1392', '商家转款列表', 1, '/statistics/store_remittance_list', '', 1, '2021-01-15 04:26:53', '2021-01-17 20:13:13'), (1395, 1392, '1392', '商家提现申请', 1, '/statistics/store_withdrawals', '', 1, '2021-01-15 04:26:47', '2021-01-17 20:13:15'), (1394, 1392, '1392', '销售明细', 1, '/statistics/sale_list', '', 1, '2021-01-15 04:26:42', '2021-01-17 20:13:18'), (1393, 1392, '1392', '销售概况', 1, '/statistics/report', '', 1, '2021-01-15 04:26:37', '2021-01-17 20:13:19'), (1392, 0, '', '统计', 1, '/statistics', '', 0, '2021-01-15 04:26:31', '2021-01-15 04:26:31'), (1391, 1390, '1363,1390', '商家满意度', 1, '/seller/store_satisfaction/store_satisfaction_list', '', 1, '2021-01-15 04:24:06', '2021-01-16 04:54:06'), (1390, 1363, '1363', '店铺满意度', 1, '/seller/store_satisfaction', '', 1, '2021-01-15 04:23:57', '2021-01-16 04:54:01'), (1389, 1363, '1363', '店铺帮助', 1, '/page/article/help/help_content_list', '', 1, '2021-01-15 04:23:52', '2021-01-16 04:54:09'), (1388, 1363, '1363', '消费者保障服务管理_guarantee_item', 1, '/seller/guarantee/guarantee_item', '', 0, '2021-01-15 04:23:46', '2021-01-16 04:54:17'), (1387, 1383, '1363,1383', '服务保障列表', 1, '/seller/guarantee/guarantee_item_list', '', 1, '2021-01-15 04:23:37', '2021-01-16 04:54:25'), (1667, 1363, '1363', 'guarantee_costlog_list', 1, '/seller/guarantee/guarantee_costlog_list', '', 0, '2021-01-16 02:54:32', '2021-01-16 02:54:32'), (1386, 1383, '1363,1383', '店铺保障服务', 1, '/seller/guarantee/guarantee_list', '', 1, '2021-01-15 04:23:30', '2021-01-16 04:54:28'), (1385, 1383, '1363,1383', '保障服务申请_guarantee_apply', 1, '/seller/guarantee/guarantee_apply', '', 0, '2021-01-15 04:23:22', '2021-01-16 02:49:44'), (1382, 1381, '1363,1381', '店铺等级列表', 1, '/seller/store_grade/store_grades', '', 1, '2021-01-15 04:23:00', '2021-01-16 04:54:49'), (1383, 1363, '1363', '消费者保障服务', 1, '/seller/guarantee', '', 1, '2021-01-15 04:23:05', '2021-01-16 04:54:24'), (1381, 1363, '1363', '店铺等级', 1, '/seller/store_grade', '', 1, '2021-01-15 04:22:52', '2021-01-16 04:54:50'), (1665, 1379, '1379,1363', '新增店铺分类', 1, '/seller/store_class/store_class', '', 1, '2021-01-16 02:28:23', '2021-01-16 04:54:58'), (1380, 1379, '1379,1363', '店铺分类列表', 1, '/seller/store_class/store_class_list', '', 1, '2021-01-15 04:22:45', '2021-01-16 04:54:59'), (1666, 1381, '1363,1381', '新增店铺等级', 1, '/seller/store_grade/store_grade', '', 1, '2021-01-16 02:31:54', '2021-01-16 04:54:46'), (1379, 1363, '1363', '店铺分类', 1, '/seller/store_class', '', 1, '2021-01-15 04:22:37', '2021-01-16 04:54:57'), (1375, 1371, '1363,1371', '经营类目审核', 1, '/seller/store_manage/apply_class_list', '', 1, '2021-01-15 04:22:10', '2021-01-16 04:55:10'), (1376, 1363, '1363', '店铺-新增_store_add', 1, '/seller/store_manage/store_add', '', 0, '2021-01-15 04:22:18', '2021-01-16 02:21:31'), (1377, 1363, '1363', '自营店铺', 1, '/seller/own_store/own_stores', '', 1, '2021-01-15 04:22:24', '2021-01-16 04:55:04'), (1374, 1371, '1363,1371', '签约审核', 1, '/seller/store_manage/reopen_list', '', 1, '2021-01-15 04:22:02', '2021-01-16 04:55:12'), (1371, 1363, '1363', '商家管理', 1, '/seller/store_manage', '', 1, '2021-01-15 04:21:38', '2021-01-16 04:55:10'), (1373, 1371, '1363,1371', '开店申请', 1, '/seller/store_manage/store_applys', '', 1, '2021-01-15 04:21:54', '2021-01-16 04:55:14'), (1372, 1371, '1363,1371', '店铺列表', 1, '/seller/store_manage/stores', '', 1, '2021-01-15 04:21:46', '2021-01-16 04:55:15'), (1370, 1363, '1363', 'reopen', 1, '/seller/store_manage/reopen', '', 0, '2021-01-15 04:21:33', '2021-01-15 04:21:33'), (1369, 1363, '1363', 'guarantee_log_list', 1, '/seller/guarantee/guarantee_log_list', '', 0, '2021-01-15 04:21:26', '2021-01-15 04:21:26'), (1366, 1363, '1363', 'store_detail', 1, '/seller/store_manage/store_detail', '', 0, '2021-01-15 04:21:08', '2021-01-15 04:21:08'), (1367, 1363, '1363', 'store_edit', 1, '/seller/store_manage/store_edit', '', 0, '2021-01-15 04:21:14', '2021-01-15 04:21:14'), (1368, 1363, '1363', 'guarantee_costlog_list', 1, '/seller/guarantee/guarantee_costlog_list', '', 0, '2021-01-15 04:21:21', '2021-01-15 04:21:21'), (1365, 1363, '1363', 'store_class_info', 1, '/seller/store_manage/store_class_info', '', 0, '2021-01-15 04:21:03', '2021-01-15 04:21:03'), (1364, 1363, '1363', 'store_apply_detail', 1, '/seller/store_manage/store_apply_detail', '', 0, '2021-01-15 04:20:56', '2021-01-15 04:20:56'), (1363, 0, '', '商家', 1, '/seller', '', 0, '2021-01-15 04:20:51', '2021-01-15 04:20:51'), (1318, 1315, '1315', '调度日志', 1, '/jobs/job_log', '', 1, '2021-01-15 04:09:28', '2021-01-16 04:55:25'), (1317, 1315, '1315', '任务管理', 1, '/jobs/job_info', '', 1, '2021-01-15 04:09:23', '2021-01-16 04:55:25'), (1316, 1315, '1315', '仪表盘', 1, '/jobs/dashboard', '', 1, '2021-01-15 04:09:17', '2021-01-16 04:55:27'), (1315, 0, '', '调度中心', 1, '/jobs', '', 1, '2021-01-15 04:09:11', '2021-01-16 04:55:30'), (1668, 1390, '1363,1390', '店铺评分', 1, '/seller/store_satisfaction/store_score_list', '', 1, '2021-01-16 03:06:48', '2021-01-16 04:54:03'), (1662, 1456, '1456', '订单详情_order_detail', 1, '/order/order_detail', '', 0, '2021-01-15 23:00:49', '2021-01-15 23:00:49'), (1660, 1484, '1484', '/market/goods_category', 1, '/market/goods_category', '', 0, '2021-01-15 22:15:18', '2021-01-15 22:15:18'), (1659, 1484, '1484', 'market/goods_type', 1, '/market/goods_type', '', 0, '2021-01-15 21:56:23', '2021-01-15 21:56:23'), (1658, 1484, '1484', 'market/brand', 1, '/market/brand', '', 0, '2021-01-15 21:54:08', '2021-01-15 21:54:08'), (1656, 1484, '1484', 'member_level', 1, '/market/member_level', '', 0, '2021-01-15 21:37:34', '2021-01-15 21:37:34'), (1655, 1507, '1484,1507', 'sign_config', 1, '/market/user_sign/sign_config', '', 0, '2021-01-15 21:32:35', '2021-01-15 21:35:16'), (1654, 1509, '1509', 'pc_section', 1, '/page/pc/pc_section', '', 0, '2021-01-15 21:14:50', '2021-01-15 21:14:50'), (1653, 1509, '1509', 'pc_block_design', 1, '/page/pc/pc_block_design', '', 0, '2021-01-15 21:14:29', '2021-01-15 21:14:29'), (1652, 1509, '1509', 'news', 1, '/page/news/news', '', 0, '2021-01-15 07:19:37', '2021-01-15 07:19:37'), (1650, 1509, '1509', 'news_comment_list', 1, '/page/news/news_comment_list', '', 0, '2021-01-15 07:18:14', '2021-01-15 07:18:14'), (1651, 1509, '1509', 'news_cat_list', 1, '/page/news/news_cat_list', '', 0, '2021-01-15 07:18:46', '2021-01-15 07:18:46'), (1644, 1572, '1572', 'shipping_details', 1, '/setup/shipping_set/shipping_details', '', 0, '2021-01-15 06:40:29', '2021-01-15 06:40:29'), (1645, 1509, '1509', 'poster_admin', 1, '/page/ad/poster_admin', '', 0, '2021-01-15 06:51:07', '2021-01-15 06:51:07'), (1646, 1509, '1509', 'ad_edit', 1, '/page/ad/ad_edit', '', 0, '2021-01-15 06:52:51', '2021-01-15 06:52:51'), (1647, 1509, '1509', 'system_article', 1, '/page/article/system_article', '', 0, '2021-01-15 07:04:33', '2021-01-15 07:04:56'), (1648, 1524, '1524,1509', '友情链接列表', 1, '/page/article/friend_link_list', '', 1, '2021-01-15 07:08:59', '2021-01-16 04:47:59'), (1649, 1509, '1509', 'article', 1, '/page/article/article', '', 0, '2021-01-15 07:13:34', '2021-01-15 07:13:34'), (1587, 1572, '1572', 'store_msg_tpl', 1, '/setup/msg_tpl/store_msg_tpl', '', 0, '2021-01-15 05:06:05', '2021-01-15 05:06:05'), (1586, 1572, '1572', 'store_msg_detail', 1, '/setup/msg_tpl/store_msg_detail', '', 0, '2021-01-15 05:05:59', '2021-01-15 05:05:59'), (1585, 1572, '1572', 'member_msg_tpl', 1, '/setup/msg_tpl/member_msg_tpl', '', 0, '2021-01-15 05:05:53', '2021-01-15 05:05:53'), (1584, 1572, '1572', 'member_msg_detail', 1, '/setup/msg_tpl/member_msg_detail', '', 0, '2021-01-15 05:05:47', '2021-01-15 05:05:47'), (1583, 1572, '1572', 'suppliers_detail', 1, '/setup/suppliers_detail', '', 0, '2021-01-15 05:05:40', '2021-01-15 05:05:40'), (1582, 1572, '1572', 'suppliers', 1, '/setup/suppliers', '', 0, '2021-01-15 05:05:35', '2021-01-15 05:05:35'), (1581, 1572, '1572', '第三方登录', 1, '/setup/third_login_set', '', 1, '2021-01-15 05:05:29', '2021-01-16 04:46:13'), (1580, 1572, '1572', '支付配置', 1, '/setup/pay_pal/set', '', 1, '2021-01-15 05:05:23', '2021-01-16 04:46:41'), (1579, 1572, '1572', '支付宝配置', 1, '/setup/ali_pay/ali_pay_set', '', 1, '2021-01-15 05:05:17', '2021-01-16 04:46:36'), (1578, 1572, '1572', '支付设置', 1, '/setup/wechat/pay_set', '', 1, '2021-01-15 05:05:11', '2021-01-16 04:46:25'), (1577, 1572, '1572', '微信用户', 1, '/setup/wechat/wx_user', '', 1, '2021-01-15 05:05:06', '2021-01-16 04:46:27'), (1576, 1572, '1572', '发送邮件', 1, '/setup/email', '', 1, '2021-01-15 05:05:00', '2021-01-16 04:46:30'), (1575, 1572, '1572', '管理列表', 1, '/setup/admin_list', '', 1, '2021-01-15 05:04:55', '2021-01-16 04:46:45'), (1574, 1572, '1572', 'SEO设置', 1, '/setup/seo_set', '', 1, '2021-01-15 05:04:48', '2021-01-16 04:46:49'), (1573, 1572, '1572', '地区&配送', 1, '/setup/address_with_send/address_with_send', '', 1, '2021-01-15 05:04:43', '2021-01-16 04:46:52'), (1572, 0, '', '设置', 1, '/setup', '', 0, '2021-01-15 05:04:37', '2021-01-15 05:04:37'), (1605, 1572, '1572', 'default', 1, '/setup/wechat/reply/default', '', 0, '2021-01-15 05:07:55', '2021-01-15 05:07:55'), (1606, 1572, '1572', 'follow', 1, '/setup/wechat/reply/follow', '', 0, '2021-01-15 05:08:00', '2021-01-15 05:08:00'), (1607, 1572, '1572', 'keyword', 1, '/setup/wechat/reply/keyword', '', 0, '2021-01-15 05:08:07', '2021-01-15 05:08:07'), (1608, 1572, '1572', 'addorUpNavigation', 1, '/setup/addorUpNavigation', '', 0, '2021-01-15 05:08:13', '2021-01-15 05:08:13'), (1609, 1572, '1572', 'day_navigation', 1, '/setup/day_navigation', '', 0, '2021-01-15 05:08:19', '2021-01-15 05:08:19'), (1610, 1572, '1572', 'emaillog', 1, '/setup/emaillog', '', 0, '2021-01-15 05:08:25', '2021-01-15 05:08:25'), (1611, 1572, '1572', 'emailreceiver', 1, '/setup/emailreceiver', '', 0, '2021-01-15 05:08:31', '2021-01-15 05:08:31'), (1612, 1572, '1572', 'menus', 1, '/setup/menus', '', 0, '2021-01-15 05:08:36', '2021-01-15 05:08:36'), (1613, 1572, '1572', 'plugin', 1, '/setup/plugin', '', 0, '2021-01-15 05:08:43', '2021-01-15 05:08:43'), (1614, 1572, '1572', 'plugins', 1, '/setup/plugins', '', 0, '2021-01-15 05:08:48', '2021-01-15 05:08:48'), (1615, 1572, '1572', 'roles', 1, '/setup/roles', '', 0, '2021-01-15 05:08:54', '2021-01-15 05:08:54'), (1616, 1572, '1572', '商城设置', 1, '/setup/shop_set', '', 1, '2021-01-15 05:09:00', '2021-01-16 04:44:36'), (1617, 1616, '1572,1616', '商城信息', 1, '/setup/shop_set/shop_info', '', 1, '2021-01-15 05:09:08', '2021-01-16 04:45:54'), (1618, 1616, '1572,1616', '基本设置', 1, '/setup/shop_set/basic_set', '', 1, '2021-01-15 05:09:17', '2021-01-16 04:45:50'), (1619, 1616, '1572,1616', '税费设置', 1, '/setup/shop_set/withdrawal_set', '', 1, '2021-01-15 05:09:25', '2021-01-16 04:45:14'), (1620, 1616, '1572,1616', '购物流程', 1, '/setup/shop_set/shopping', '', 1, '2021-01-15 05:09:33', '2021-01-16 04:45:05'), (1621, 1616, '1572,1616', '短信/邮件设置', 1, '/setup/shop_set/notice', '', 1, '2021-01-15 05:09:41', '2021-01-16 04:45:02'), (1622, 1616, '1572,1616', '水印设置', 1, '/setup/shop_set/water', '', 1, '2021-01-15 05:09:49', '2021-01-16 04:44:52'), (1623, 1616, '1572,1616', '分销设置', 1, '/setup/shop_set/distribut', '', 1, '2021-01-15 05:09:58', '2021-01-16 04:44:39'), (1624, 1616, '1572,1616', '对象存储', 1, '/setup/shop_set/oss', '', 1, '2021-01-15 05:10:06', '2021-01-16 04:44:56'), (1625, 1616, '1572,1616', '海报设置', 1, '/setup/shop_set/poster', '', 1, '2021-01-15 05:10:14', '2021-01-16 04:44:36'), (1626, 1616, '1572,1616', '小费/税费', 1, '/setup/shop_set/tip', '', 1, '2021-01-15 05:10:22', '2021-01-16 04:44:34'), (1627, 1572, '1572', '短信模板', 1, '/setup/sms_tpl', '', 1, '2021-01-15 05:10:28', '2021-01-16 04:44:28'), (1628, 1627, '1572,1627', '短信模板详情', 1, '/setup/sms_tpl_detail', '', 1, '2021-01-15 05:10:36', '2021-01-16 04:44:27'), (1629, 1572, '1572', '快递公司', 1, '/setup/shippings', '', 1, '2021-01-15 05:10:42', '2021-01-16 04:44:16'), (1630, 1629, '1572,1629', '快递设置', 1, '/setup/shipping_set/express', '', 1, '2021-01-15 05:10:50', '2021-01-16 04:44:15'), (1631, 1629, '1572,1629', '快递公司详情', 1, '/setup/shipping_set/shipping_details/:id', '', 1, '2021-01-15 05:10:59', '2021-01-16 04:44:11'), (1632, 1629, '1572,1629', '快递公司列表', 1, '/setup/shipping_set/shipping_list', '', 1, '2021-01-15 05:11:07', '2021-01-16 04:44:07'), (1633, 1572, '1572', '消息通知', 1, '/setup/msg_tpl', '', 1, '2021-01-15 05:11:13', '2021-01-16 04:43:40'), (1634, 1633, '1633,1572', '用户信息模板', 1, '/setup/msg_tpl/member_msg_tpl', '', 1, '2021-01-15 05:11:21', '2021-01-16 04:43:38'), (1635, 1633, '1633,1572', '商家消息模板', 1, '/setup/msg_tpl/store_msg_tpl', '', 1, '2021-01-15 05:11:29', '2021-01-16 04:43:37'), (1636, 1633, '1633,1572', '商家详情', 1, '/setup/msg_tpl/store_msg_detail', '', 1, '2021-01-15 05:11:38', '2021-01-16 04:43:56'), (1637, 1572, '1572', '邮件', 1, '/setup/emails', '', 1, '2021-01-15 05:11:44', '2021-01-16 04:43:19'), (1638, 1637, '1572,1637', '平台日志', 1, '/setup/emails/emaillog', '', 1, '2021-01-15 05:11:51', '2021-01-16 04:43:29'), (1639, 1637, '1572,1637', '商家日志', 1, '/setup/emails/selleremaillog', '', 1, '2021-01-15 05:12:00', '2021-01-16 04:43:20'), (1640, 1572, '1572', '其他', 1, '/setup/', '', 0, '2021-01-15 05:12:06', '2021-01-16 04:43:16'), (1641, 0, '', '首页', 1, '/home', '', 1, '2021-01-15 05:12:09', '2021-01-16 04:42:56'), (1642, 1641, '1641', '系统后台', 1, '/home/system', '', 1, '2021-01-15 05:12:15', '2021-01-16 04:43:00'), (1643, 1641, '1641', '业务流程', 1, '/home/explain', '', 1, '2021-01-15 05:12:20', '2021-01-16 04:42:59'), (1669, 1402, '1402,1392', '商品销售排行', 1, '/statistics/sales_ranking/sale_top', '', 1, '2021-01-17 20:27:22', '2021-01-17 20:42:22'), (1670, 1402, '1402,1392', '店铺销售排行', 1, '/statistics/sales_ranking/store_top', '', 0, '2021-01-17 20:32:36', '2021-01-17 20:41:29');

INSERT INTO `jobs_info` VALUES (5, NULL, 'jobs-mall', '0 0/1 * * * ?', 'activityJobHandler', NULL, 30, 3, 1609223580000, 1609223640000, 'soubao', '每分钟执行一次', 0, NULL, 1592622709000), (6, NULL, 'jobs-mall', '0 0 1 1 * ?', 'mouthJobHandler', NULL, 30, 3, 1606755600000, 1609434000000, 'soubao', '每月1号凌晨1点执行一次', 0, NULL, 1592638707000), (7, NULL, 'jobs-order', '0 0 */1 * * ?', 'autoReceiveJob', NULL, 30, 3, 1598259600000, 1611478800000, 'soubao', '每小时执行一次,自动收货确认', 0, NULL, 1592638707000), (9, NULL, 'jobs-order', '0 0 0 1-2 * ?', 'autoConfirmJob', NULL, 30, 3, 1606838400000, 1609430400000, 'soubao', '每天执行一次,分销记录自动分成', 0, NULL, 1592638707000), (10, NULL, 'jobs-user', '0 0 1 1 * ?', 'mouthJobHandler', NULL, 30, 3, 1606755600000, 1609434000000, 'soubao', '删除一个月以前的短信', 0, NULL, 1592793884000), (23, NULL, 'jobs-mall', '1 0 0 * * ?', 'dayJobHandler', NULL, 30, 3, 1608912001000, 1609257601000, 'soubao', '每天0点01秒执行一次', 0, NULL, 1597113303000), (24, NULL, 'jobs-mall', '0 0 /1 * * ? ', 'hourJobHandler', NULL, 30, 3, 1609221600000, 1609225200000, 'soubao', '每小时执行一次', 0, NULL, 1597115699000);
SET FOREIGN_KEY_CHECKS = 1;
