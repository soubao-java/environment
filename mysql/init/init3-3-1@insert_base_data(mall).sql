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

 Date: 29/12/2020 19:16:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

truncate table `ad`;
truncate table `ad_position`;
truncate table `config`;
truncate table `menu_cfg`;
-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES (1, 1, 0, '封面海报', '#', '/public/upload/ad/2020/03-31/095f0a0fb54b7ac5a4e3b385dd586cc5.jpg', 1553961600, 1806422400, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (2, 1, 0, '自定义广告名称', '1', '/public/upload/ad/2020/03-31/31377706f95edf9db68471da7037fd0e.jpg', 1553961600, 1743350400, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (3, 1, 0, '封面海报', '#', '/public/upload/ad/2020/03-31/e6f5816104271ea72b1c775fa27207ad.jpg', 1553961600, 1774886400, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (4, 1, 0, '自定义广告名称', '1', '/public/upload/ad/2020/03-31/b2021d5b1bbf28bb0f5c3ece8c2e1106.jpg', 1553961600, 1743350400, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (5, 1, 0, '封面海报', '#', '/public/upload/ad/2020/03-31/337c37e689790a1ebd25a0601d1e7d92.jpg', 1553961600, 1711814400, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (6, 50, 0, '精品推荐广告图1', '#', '/public/upload/ad/2019/07-18/9dd57aeb568c5bd29eec67ed1596e56e.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (7, 50, 0, '精品推荐广告图2', '#', '/public/upload/ad/2019/07-18/f18426bd3b043d306966b9fa577cb266.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (8, 50, 0, '精品推荐广告图3', '#', '/public/upload/ad/2019/07-18/657fe7db962ad68bca9efcfc44c2f13d.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (9, 50, 0, '精品推荐广告图3', '#', '/public/upload/ad/2019/07-18/8b8ac58a11731613ba732e45352d6965.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (10, 50, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-02/d521bb7f4e97f5fa4696bdae96240245.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (11, 51, 0, '首页精品推荐广告', '', '/public/upload/ad/2018/03-02/8b85a43c4ab832004dfd9e262fdfc16d.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (12, 51, 0, '精品推荐广告', '', '/public/upload/ad/2018/03-02/0d97973fe155efc5cc372a2c739f5bd6.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (13, 51, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-02/44f794406287e2830830c0a30b5a0f44.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (14, 53, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-02/6b8001225b7f535d7c5fa354e5eee0b0.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (15, 53, 0, '自定义广告名称', '#', '/public/upload/ad/2019/07-19/922955b4a488be3a561da4ff00b3d17a.png', 1451577600, 1767088559, '', '', '', 0, 1, 2, 0, '#000000', ''), (16, 54, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-02/6467b9efa99510392f60b4ceb063fef3.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (17, 51, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-02/2a77027a9b4d531c83c7560b1380fe3c.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (18, 51, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-02/d76f24588940bd712ff8c181dbe65301.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (19, 51, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-02/f467f7bead664cc06d181a9d00d06504.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (20, 603, 0, '自定义广告名称', '#', '/public/upload/ad/2018/02-28/529d8f9ae378b604c651394a0e3d5a67.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 1, 0, '#000000', ''), (21, 54, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-02/f92e4a8f88a637ca8f75949ad4b2ef8d.png', 1451577600, 1767088559, '', '', '', 0, 1, 2, 0, '#000000', ''), (22, 105, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-01/5d5793993b8f2544cc3b641f42566f0e.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 1, 0, '#000000', ''), (23, 106, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-01/dae928762e3232a43ea428271258a2ac.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (24, 107, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-01/aa831fc7c22cad7a67c36f49496b4ca9.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (25, 108, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-01/60320673bb47b2e432efd78a323875ca.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (26, 109, 0, '自定义广告名称', '', '/public/upload/ad/2018/02-28/e8369e429d276a5a0b8bd69cee93833c.png', 1451577600, 1767088559, '', '', '', 0, 1, 5, 0, '#000000', ''), (27, 105, 0, '自定义广告名称', '', '/public/upload/ad/2018/02-28/75ca1acae9ffd7da6b10f52aca45132e.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (28, 106, 0, '自定义广告名称', '', '/public/upload/ad/2018/02-28/8c65444de9bd5b7794b1676280ab9527.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (29, 107, 0, '自定义广告名称', '', '/public/upload/ad/2018/02-28/5c8da9cefc1b52bbd8c34c7582aea101.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (30, 108, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-01/c24ec9b67dd206748d4631ad876c6f31.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 10, 0, '#000000', ''), (31, 109, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-01/08cb0a6316204a0cbde80e0b2decc83c.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 5, 0, '#000000', ''), (32, 99, 0, '自定义广告名称', '', '/public/upload/ad/2018/02-28/d60c4ea9219c27b2dbe4fa8227bb1b33.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (33, 1, 0, '封面海报', '#', '/public/upload/ad/2020/03-31/f46d7ed5927639480d88f62f2cec5214.jpg', 1459353600, 1743350400, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (34, 1, 0, '封面海报', '#', '/public/upload/ad/2020/03-31/f7883a07b7ffb81ec55c6cb1c719657a.jpg', 1553961600, 1774886400, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (35, 53, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-01/3d7e02e7d2366712c6da04864622b3e6.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (37, 500, 3, '轮播广告1', '39', '/public/upload/ad/2018/03-05/fd64378f9e60ede410f2471dc7489928.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (38, 500, 4, '轮播广告2', '81_0_0', '/public/upload/ad/2018/03-05/72a5eed62343781faf0f21f85ef45687.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (39, 500, 3, '轮播广告3', '48', '/public/upload/ad/2018/03-05/876f7038900a2a18e94597598698afab.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (40, 500, 3, '轮播广告4', '65', '/public/upload/ad/2018/03-05/c7d365d83b27ec7be2af08127805835b.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (41, 500, 4, '轮播广告5', '86_0_0', '/public/upload/ad/2018/03-05/79d538d237d1f517629307cce94b4d71.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (42, 506, 4, '自定义广告名称1', '1_2_10', '/public/upload/ad/2019/07-19/17e7af909b6e6ffc88db89f5e7349fe2.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (43, 507, 3, '自定义广告名称2', '73', '/public/upload/ad/2018/03-05/feb42c5890764f95d22cca5a800c087c.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (44, 508, 3, '自定义广告名称3', '72', '/public/upload/ad/2018/03-05/89b446f15d6554ecc59f4791d2591289.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (45, 509, 3, '自定义广告名称4', '71', '/public/upload/ad/2018/03-05/07fe5b84af46160eb2f8a09d4a583d86.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (46, 510, 3, '自定义广告名称5', '70', '/public/upload/ad/2018/03-05/97164b24bb77c5bc923db0d333a03a7c.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (47, 511, 3, '自定义广告名称6', '69', '/public/upload/ad/2018/03-05/780f004805eda726ae7d6a0dfe7f4897.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (48, 512, 3, '自定义广告名称7', '68', '/public/upload/ad/2018/03-05/32f71db0db41b22bcdbd41330b286584.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (49, 513, 3, '自定义广告名称8', '67', '/public/upload/ad/2018/03-05/126973838e17e9206c262e7c5c06ad00.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (50, 514, 3, '自定义广告名称9', '66', '/public/upload/ad/2018/03-05/0a4f54831eb5744cb3bd8dc50b6546e8.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (51, 515, 3, '自定义广告名称10', '64', '/public/upload/ad/2018/03-05/6df736266f1a9adfa5bfda7b2faa6e3e.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (52, 516, 3, '自定义广告名称11', '58', '/public/upload/ad/2019/07-19/62616c617052e7b4819cd5626cc6abd7.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (53, 535, 0, '自定义广告名称12', '53', '/public/upload/ad/2018/03-05/9b86263f20e2c99c90ed6dcd5c2301a3.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, '#000000', ''), (54, 518, 3, '自定义广告名称13', '41', '/public/upload/ad/2018/03-05/d1fd9581240c70b2884b606a4deb48b6.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (55, 1, 0, '自定义广告名称', '#', '/public/upload/ad/2020/03-31/93f74026f9bbf377b14fec7317959490.jpg', 1553961600, 1806422400, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (56, 535, 3, '自定义广告名称', '', '/public/upload/ad/2018/03-27/38f37709f30e9d4d0a1de307d32cf2f4.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (57, 534, 3, '自定义广告名称', '', '/public/upload/ad/2018/03-06/27f311ab8e56d92686e9fbcf8caa6aaa.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (58, 533, 3, '品牌街', '', '/public/upload/ad/2018/03-06/cdad94abc3e50f78f39a7612faa4f654.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (59, 532, 3, '店铺街', '', '/public/upload/ad/2018/03-06/e246a34cdbbbbc3f231d9f88bfe22bd0.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (60, 531, 3, '分类', '', '/public/upload/ad/2018/03-07/2ca6d47626beb27e9d2056594c1fc8c1.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (61, 400, 0, '自定义广告名称', 'http://demo6.tp-shop.cn/Mobile/Goods/goodsInfo/id/31.html', '/public/upload/ad/2019/07-05/2f40196ff12425ab3c7e476a4d9d668d.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (62, 2, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-07/069e6001e6f3de060a390e2165cec702.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (63, 2, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-07/57ebaea4780fd9a5e5a7275fe316f090.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (64, 2, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-07/4945eb947cd875f791cc4a38761c81c5.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (65, 2, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-07/de06bb83de30c757ac265431299cde22.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (66, 2, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-07/4cf5dcfb3938255f0e6eab1dfc9f426e.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (67, 301, 0, '自定义广告名称', 'http://demo6.tp-shop.cn/Mobile/Goods/goodsInfo/id/27.html', '/public/upload/ad/2019/07-05/8e2bb0c2ea05cced6ddb19a34d650767.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (68, 302, 0, '自定义广告名称', 'http://demo6.tp-shop.cn/Mobile/Goods/goodsInfo/id/29.html', '/public/upload/ad/2019/07-05/daf2bc63e1abdc24c58ff7195400a8b1.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (69, 300, 0, '自定义广告名称', 'http://demo6.tp-shop.cn/Mobile/Goods/goodsInfo/id/28.html', '/public/upload/ad/2019/07-05/c55c9e6b94e22724a4704fcfdf2af15a.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (70, 303, 0, '自定义广告名称', 'http://demo6.tp-shop.cn/Mobile/Goods/goodsInfo/id/30.html', '/public/upload/ad/2019/07-05/cba33e4b00a44f274f1455e8f5b50d80.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#351930', ''), (71, 304, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-07/9d73c846ac58afb5eeff4830d75d1653.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (72, 304, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-07/a0d95bac9e8971bbe9fe75c6815a9776.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (73, 305, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-07/a4a203bd616627e834f485d9a29eaa8b.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (74, 306, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-07/671bca1e440c7c7053c1927ac669fdc7.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (75, 307, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-07/975bb4115c377aacc9f5c63b19851d9a.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (76, 307, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-07/05d927f3d86e6bae71012db97cbf7738.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (77, 307, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-07/8c7664f5b02cd657df4a84310c159b10.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (78, 307, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-07/d12201f23ad8e34c0fa23dc49d345fed.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (79, 1, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-05/a8f79171ba070fb1bd02b465ad6fe7c3.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#8000ff', ''), (80, 2, 0, '自定义广告名称', '', '/public/upload/ad/2018/03-15/589ca9015fb5ba860836ce6ad8881f50.jpg', 0, 1767088559, '', '', '', 0, 1, 1, 0, '#000000', ''), (81, 602, 0, 'zbxcx', 'www.baidu.com', '/public/upload/ad/2019/07-19/63a2d4e2b2a22a867f5488ea5f241c8e.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, '#000000', ''), (82, 517, 5, '自定义广告名称', 'www.baidu.com', '/public/upload/ad/2019/07-19/feccd2b042e41e07045a59edadebe1b8.png', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, ''), (83, 603, 0, '精品推荐广告图4', '#', '/public/upload/ad/2019/07-19/ecae30fde5bed68e93934f3625588e09.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (84, 53, 0, '自定义广告名称', '#', '/public/upload/ad/2019/07-19/3c20d7e608e115c9ba1701df357df165.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (85, 53, 0, '自定义广告名称', '#', '/public/upload/ad/2019/07-19/143ad4ea67aff24798a2f4380504c356.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (86, 52, 0, '自定义广告名称', '#', '/public/upload/ad/2019/07-19/ecae30fde5bed68e93934f3625588e09.png', 1451577600, 1767088559, '', '', '', 0, 1, 1, 0, '#000000', ''), (87, 52, 0, '自定义广告名称', 'http://demo6.tp-shop.cn', '/public/upload/ad/2019/07-19/653676d0d52cb29d59a9832430989886.png', 1451577600, 1767088559, '', '', '', 0, 1, 0, 0, '#000000', ''), (88, 9, 0, '自定义广告名称555555', '#', '/public/upload/ad/2020/03-31/07ff5da33a9e9c92ad94575082621909.jpg', 1451577600, 1704038400, '', '', '', 0, 1, 0, 0, '#000000', ''), (89, 1, 0, '自定义广告名称555555', '#', '/public/upload/ad/2020/04-29/08c63c81e90b83be7141aabb1703d70f.jpg', 1577548800, 1903622400, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (90, 1, 0, '自定义广告名称555555', '#', '/public/upload/ad/2020/04-29/0aeb9174f12af8ad92fa04dd6617fbd4.jpg', 1461859200, 1903622400, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (91, 10, 0, '封面海报', '#', '/public/upload/ad/2020/04-29/91.jpg', 1451577600, 1767196800, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (92, 10, 0, '封面海报', '#', '/public/upload/ad/2020/03-31/cc854886e46a8b338c7b49a64225c792.jpg', 1451577600, 1798732800, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (93, 1, 0, '自定义广告名称555555', '#', '/public/upload/ad/2020/04-29/7bceb6742573fd48b53a1f96317abb66.jpg', 1461859200, 1903622400, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (94, 1, 0, '自定义广告名称555555', '#', '/public/upload/ad/2020/04-29/8a54a2f0952a35d13cea4e3778e64bff.jpg', 1461859200, 1745856000, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (95, 10, 0, '自定义广告名称', '#', '/public/upload/ad/2020/04-29/0a202fa6d91ac2f80107b8ac1aa39160.jpg', 1451577600, 2029852800, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (98, 10, 0, '自定义广告名称', '#', '/public/upload/ad/2020/04-29/bfa54fcf6ff1dc19e0574bd2a2c996a4.jpg', 1588089600, 1808928000, '', '', '', 0, 1, 0, 0, '#000000', ''), (99, 10, 0, '自定义广告名称', '#', '/public/upload/ad/2020/04-29/63f5d606c0b05b4e205a23c405beaae6.jpg', 1451577600, 1808928000, '', '', '', 0, 1, 0, 0, '#ffffff', ''), (100, 401, 3, '分类', '', '/public/upload/ad/2018/03-07/2ca6d47626beb27e9d2056594c1fc8c1.jpg', 1451577600, 1767088559, '', '', '', 0, 1, 50, 0, NULL, '');

-- ----------------------------
-- Records of ad_position
-- ----------------------------
INSERT INTO `ad_position` VALUES (1, 'Index页面自动增加广告位 1 ', 0, 0, 'Index页面', NULL, 1), (2, 'Index页面自动增加广告位 2 ', 0, 0, 'Index页面', NULL, 1), (4, 'Topic页面自动增加广告位 4 ', 0, 0, 'Topic页面', NULL, 1), (9, 'User页面自动增加广告位 9 ', 0, 0, 'User页面', NULL, 1), (10, 'Index页面自动增加广告位 10 ', 0, 0, 'Index页面', NULL, 1), (50, 'Index页面自动增加广告位 50 ', 0, 0, 'Index页面', NULL, 1), (51, 'Index页面自动增加广告位 51 ', 0, 0, 'Index页面', NULL, 1), (52, 'Index页面自动增加广告位 52 ', 0, 0, 'Index页面', NULL, 1), (53, 'Index页面自动增加广告位 53 ', 0, 0, 'Index页面', NULL, 1), (54, 'Index页面自动增加广告位 54 ', 0, 0, 'Index页面', NULL, 1), (99, 'Index页面自动增加广告位 99 ', 0, 0, 'Index页面', NULL, 1), (105, 'Index页面自动增加广告位 105 ', 0, 0, 'Index页面', NULL, 1), (106, 'Index页面自动增加广告位 106 ', 0, 0, 'Index页面', NULL, 1), (107, 'Index页面自动增加广告位 107 ', 0, 0, 'Index页面', NULL, 1), (108, 'Index页面自动增加广告位 108 ', 0, 0, 'Index页面', NULL, 1), (109, 'Index页面自动增加广告位 109 ', 0, 0, 'Index页面', NULL, 1), (204, 'Activity页面自动增加广告位 204 ', 0, 0, 'Activity页面', NULL, 1), (205, 'Activity页面自动增加广告位 205 ', 0, 0, 'Activity页面', NULL, 1), (206, 'Activity页面自动增加广告位 206 ', 0, 0, 'Activity页面', NULL, 1), (207, 'Activity页面自动增加广告位 207 ', 0, 0, 'Activity页面', NULL, 1), (208, 'Activity页面自动增加广告位 208 ', 0, 0, 'Activity页面', NULL, 1), (300, 'Index页面自动增加广告位 300 ', 0, 0, 'Index页面', NULL, 1), (301, 'Index页面自动增加广告位 301 ', 0, 0, 'Index页面', NULL, 1), (302, 'Index页面自动增加广告位 302 ', 0, 0, 'Index页面', NULL, 1), (303, 'Index页面自动增加广告位 303 ', 0, 0, 'Index页面', NULL, 1), (304, 'Index页面自动增加广告位 304 ', 0, 0, 'Index页面', NULL, 1), (305, 'Index页面自动增加广告位 305 ', 0, 0, 'Index页面', NULL, 1), (306, 'Index页面自动增加广告位 306 ', 0, 0, 'Index页面', NULL, 1), (307, 'Index页面自动增加广告位 307 ', 0, 0, 'Index页面', NULL, 1), (400, 'Index页面自动增加广告位 400 ', 0, 0, 'Index页面', NULL, 1), (401, 'Goods页面自动增加广告位 401 ', 0, 0, 'Goods页面', NULL, 1), (500, 'Ad页面自动增加广告位 500 ', 0, 0, 'Ad页面', NULL, 1), (501, 'Index页面自动增加广告位 501 ', 0, 0, 'Index页面', NULL, 1), (506, 'Ad页面自动增加广告位 506 ', 0, 0, 'Ad页面', NULL, 1), (507, 'Ad页面自动增加广告位 507 ', 0, 0, 'Ad页面', NULL, 1), (508, 'Ad页面自动增加广告位 508 ', 0, 0, 'Ad页面', NULL, 1), (509, 'Ad页面自动增加广告位 509 ', 0, 0, 'Ad页面', NULL, 1), (510, 'Ad页面自动增加广告位 510 ', 0, 0, 'Ad页面', NULL, 1), (511, 'Ad页面自动增加广告位 511 ', 0, 0, 'Ad页面', NULL, 1), (512, 'Ad页面自动增加广告位 512 ', 0, 0, 'Ad页面', NULL, 1), (513, 'Ad页面自动增加广告位 513 ', 0, 0, 'Ad页面', NULL, 1), (514, 'Ad页面自动增加广告位 514 ', 0, 0, 'Ad页面', NULL, 1), (515, 'Ad页面自动增加广告位 515 ', 0, 0, 'Ad页面', NULL, 1), (516, 'Ad页面自动增加广告位 516 ', 0, 0, 'Ad页面', NULL, 1), (517, 'Ad页面自动增加广告位 517 ', 0, 0, 'Ad页面', NULL, 1), (518, 'Ad页面自动增加广告位 518 ', 0, 0, 'Ad页面', NULL, 1), (531, 'Ad页面自动增加广告位 531 ', 0, 0, 'Ad页面', NULL, 1), (532, 'Ad页面自动增加广告位 532 ', 0, 0, 'Ad页面', NULL, 1), (533, 'Ad页面自动增加广告位 533 ', 0, 0, 'Ad页面', NULL, 1), (534, 'Ad页面自动增加广告位 534 ', 0, 0, 'Ad页面', NULL, 1), (535, 'Ad页面自动增加广告位 535 ', 0, 0, 'Ad页面', NULL, 1), (601, 'Index页面自动增加广告位 601 ', 0, 0, 'Index页面', NULL, 1), (602, '浙北广告位', 675, 50, '浙北', NULL, 1), (603, '精品推荐广告位', 350, 130, '精品推荐广告位', NULL, 1);

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'express_switch', '0', 'express', NULL), (2, 'kd100_key', '1212', 'express', NULL), (3, 'kdniao_id', '', 'express', NULL), (4, 'kdniao_key', '', 'express', NULL), (5, 'record_no', '457648768', 'shop_info', NULL), (6, 'store_name', 'My Mall', 'shop_info', NULL), (7, 'company_name', 'My Mall Ltd.', 'shop_info', NULL), (8, 'store_logo', '/public/upload/logo/2020/12-27/1609007462212.png', 'shop_info', NULL), (9, 'store_user_logo', '/public/upload/logo/2020/12-27/1609007474999.png', 'shop_info', NULL), (10, 'store_ico', '/public/upload/logo/2020/12-27/1609009452787.png', 'shop_info', NULL), (11, 'store_title', 'My Mall 商城', 'shop_info', NULL), (12, 'store_desc', '国内商城系统', 'shop_info', NULL), (13, 'store_keyword', 'My Mall 速度 开源  安全 高效', 'shop_info', NULL), (14, 'seller_login_logo', '/public/upload/logo/2020/12-27/1609009496418.png', 'shop_info', NULL), (15, 'admin_login_logo', '/public/upload/logo/2020/12-27/1609009486682.png', 'shop_info', NULL), (16, 'admin_home_logo', '/public/upload/logo/2020/12-27/1609009485461.png', 'shop_info', NULL), (17, 'wap_home_logo', '/public/upload/logo/2020/12-27/1609009475268.png', 'shop_info', NULL), (18, 'wap_login_logo', '/public/upload/logo/2020/12-27/1609009466050.png', 'shop_info', NULL), (19, 'contact', '謝先生', 'shop_info', NULL), (20, 'phone', '15889560670', 'shop_info', NULL), (21, 'address', '深圳市龙岗区坂田街道城市山海中心', 'shop_info', NULL), (22, 'qq', '2852506358', 'shop_info', NULL), (23, 'qq2', '2852506359', 'shop_info', NULL), (24, 'qq3', '2852506357', 'shop_info', NULL), (25, 'point_send_limit', '50', 'shopping', NULL), (26, 'point_min_limit', '200', 'shopping', NULL), (27, 'point_use_percent', '50', 'shopping', NULL), (28, 'auto_confirm_date', '1', 'shopping', NULL), (29, 'auto_transfer_date', '1', 'shopping', NULL), (30, 'auto_service_date', '1', 'shopping', NULL), (31, 'integral_use_enable', '1', 'shopping', NULL), (32, 'reduce', '1', 'shopping', NULL), (33, 'point_rate', '10', 'shopping', NULL), (34, 'complain_time_limit', '30', 'complain', NULL), (35, 'reg_integral', '200', 'basic', NULL), (36, 'file_size', '1', 'basic', NULL), (37, 'default_storage', '100', 'basic', NULL), (38, 'need', '10', 'basic', NULL), (39, 'min', '10', 'basic', NULL), (40, 'tax', '12', 'basic', NULL), (41, 'hot_keywords', '手机|华为|衣服', 'basic', NULL), (42, 'is_bind_account', '0', 'basic', NULL), (43, 'sms_platform', '2', 'sms', NULL), (44, 'sms_appkey', '', 'sms', NULL), (45, 'sms_secretKey', '', 'sms', NULL), (46, 'sms_product', 'My Mall', 'sms', NULL), (47, 'regis_sms_enable', '0', 'sms', NULL), (48, 'forget_pwd_sms_enable', '1', 'sms', NULL), (49, 'bind_mobile_sms_enable', '1', 'sms', NULL), (50, 'order_add_sms_enable', '1', 'sms', NULL), (51, 'order_pay_sms_enable', '1', 'sms', NULL), (52, 'order_shipping_sms_enable', '1', 'sms', NULL), (53, 'virtual_goods_sms_enable', '1', 'sms', NULL), (54, 'sms_time_out', '60', 'sms', NULL), (55, 'sign_on_off', '1', 'sign', NULL), (56, 'sign_integral', '5', 'sign', NULL), (57, 'sign_signcount', '2', 'sign', NULL), (58, 'sign_award', '20', 'sign', NULL), (59, 'is_mark', '1', 'water', NULL), (60, 'mark_type', 'text', 'water', NULL), (61, 'mark_txt', 'mymall', 'water', NULL), (62, 'mark_txt_size', '30', 'water', NULL), (63, 'mark_txt_color', '#000000', 'water', NULL), (64, 'mark_img', '', 'water', NULL), (65, 'mark_width', '', 'water', NULL), (66, 'mark_height', '', 'water', NULL), (67, 'mark_degree', '54', 'water', NULL), (68, 'mark_quality', '50', 'water', NULL), (69, 'sel', '5', 'water', NULL), (70, 'switch', '1', 'distribut', NULL), (71, 'distribut_set_by', '1', 'distribut', NULL), (72, 'regrade', '1', 'distribut', NULL), (73, 'first_rate', '4', 'distribut', NULL), (74, 'second_rate', '3', 'distribut', NULL), (75, 'third_rate', '2', 'distribut', NULL), (76, 'qr_back', '/public/upload/weixin/2018/03-07/01ecfdadf99c1b2b01baad0a991bd324.jpg', 'distribut', NULL), (77, 'qr_big_back', '/public/upload/weixin/2018/03-07/f6af99ea507fdb2ba29febcb5fb7e888.jpg', 'distribut', NULL), (78, 'qrcode_menu_word', '我的二维码', 'distribut', NULL), (79, 'qrcode_input_word', '我的二维码', 'distribut', NULL), (80, 'smtp_server', '', 'smtp', NULL), (81, 'smtp_port', '465', 'smtp', NULL), (82, 'smtp_user', '', 'smtp', NULL), (83, 'smtp_pwd', '', 'smtp', NULL), (84, 'regis_smtp_enable', '1', 'smtp', NULL), (85, 'test_eamil', '', 'smtp', NULL), (86, 'team_order_limit_time', '60', 'shopping', NULL), (87, 'site_domain', 'http://kingda.com', 'subdomain', NULL), (88, 'weixin_qrcode', '/public/static/images/qrcode.png', 'shop_info', NULL), (89, 't_number', '687474703a2f2f61706974657374322e747073686f702e636e2f686f6d652f546a2f7032', NULL, NULL), (90, 'bd_ak', 'xXo650H9zUKh1Lk19Ztsn984G3Td85', 'basic', NULL), (91, 'bd_serverak', 'WWeszdz3UyzdtLdmcG4OP0oePjSHSwqh', 'basic', NULL), (92, 'im_choose', '1', 'basic', NULL), (93, 'im_website', 'https://im.tpsns.com', 'basic', NULL), (94, 'ws_socket', 'wss://im.tpsns.com:8283', 'basic', NULL), (95, 'enabled_subdomain', '0', 'subdomain', NULL), (96, 'subdomain_edit', '1', 'subdomain', NULL), (97, 'subdomain_times', '3', 'subdomain', NULL), (98, 'site_domain', 'http://kingda.com', 'subdomain', NULL), (99, 'subdomain_length', '3-12', 'subdomain', NULL), (100, 'open_store_time', '0', 'distribut', NULL), (101, 'cash_open', '1', 'cash', NULL), (102, 'service_ratio', '0', 'cash', NULL), (103, 'min_service_money', '0', 'cash', NULL), (104, 'max_service_money', '0', 'cash', NULL), (105, 'min_cash', '0', 'cash', NULL), (106, 'max_cash', '100', 'cash', NULL), (107, 'count_cash', '5000', 'cash', NULL), (108, 'cash_times', '5', 'cash', NULL), (109, 'host', 'https://mymall.com', 'shop_info', NULL), (110, 'finally_pay_time', '86400', 'shopping', NULL), (111, 'switch', '0', 'wx_pay', NULL), (112, 'switch', '0', 'ali_pay', NULL), (113, 'switch', '0', 'pay_pal', NULL), (114, 'facebook_app_id', '4595624377177803', 'facebook', NULL), (115, 'facebook_login_enable', '1', 'facebook', NULL), (116, 'smtp_switch', '1', 'smtp', NULL), (117, 'sms_switch', '1', 'sms', NULL), (118, 'index_format_pc', '0', 'shop_info', NULL), (119, 'store_entry_type', '1', 'shop_info', NULL), (120, 'invoice_enable', '0', 'shop_info', NULL), (121, 'is_random', '1', 'basic', NULL), (122, 'monetary', '2', 'basic', NULL), (123, 'poster_name', 'Chanel Ad', 'poster', NULL), (124, 'canvas_width', '640', 'poster', NULL), (125, 'canvas_height', '1008', 'poster', NULL), (126, 'poster_width', '2667', 'poster', NULL), (127, 'poster_height', '2667', 'poster', NULL), (128, 'back_url', '/public/upload/poster/2020/12-27/1609011108589.jpg', 'poster', NULL), (129, 'canvas_x', '0', 'poster', NULL), (130, 'canvas_y', '0', 'poster', NULL), (131, 'add_time', '1609011131', 'poster', NULL), (132, 'update_time', '0', 'poster', NULL), (133, 'qrcode_size', '150', 'poster', NULL);

-- ----------------------------
-- Records of menu_cfg
-- ----------------------------
INSERT INTO `menu_cfg` VALUES (1, '订单列表', '我的订单', 1), (2, '优惠券', '我的优惠券', 1), (3, '海报', '我的海报', 1), (4, '我的分销', '我的分销', 1), (5, '虚拟订单', '虚拟订单', 1), (6, '拼团订单', '拼团订单', 1), (7, '预约订单', '预约订单', 1), (8, '自提订单', '自提订单', 1), (9, '我的评价', '我的评价', 1), (10, '积分兑换', '积分兑换', 1), (11, '我的签到', '我的签到', 1), (12, '领券中心', '领券中心', 1), (13, '我的收藏', '我的收藏', 1), (14, '我的足迹', '我的足迹', 1), (15, '我的消息', '我的消息', 1), (17, '地址管理', '地址管理', 1), (18, '砍价订单', '砍价订单', 1), (19, '使用帮助', '使用帮助', 1), (20, '我的购物卡', '我的购物卡', 1);

SET FOREIGN_KEY_CHECKS = 1;

