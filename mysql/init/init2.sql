use bb2_auth;
truncate table `oauth_client_details`;
truncate table `oauth_access_token`;
truncate table `oauth_approvals`;
truncate table `oauth_client_token`;
truncate table `oauth_code`;
truncate table `oauth_refresh_token`;

INSERT INTO `oauth_client_details` VALUES ('admin', '', '{bcrypt}$2a$10$HBX6q6TndkgMxhSEdoFqWOUtctaJEMoXe49NWh8Owc.4MTunv.wXa', 'server', 'password,refresh_token,sms,third_oauth', NULL, 'oauth2', NULL, NULL, NULL, NULL);
INSERT INTO `oauth_client_details` VALUES ('seller', NULL, '{bcrypt}$2a$10$HBX6q6TndkgMxhSEdoFqWOUtctaJEMoXe49NWh8Owc.4MTunv.wXa', 'server', 'password,refresh_token,sms,third_oauth', NULL, 'oauth2', NULL, NULL, NULL, NULL);
INSERT INTO `oauth_client_details` VALUES ('shop', NULL, '{bcrypt}$2a$10$HBX6q6TndkgMxhSEdoFqWOUtctaJEMoXe49NWh8Owc.4MTunv.wXa', 'server', 'password,refresh_token,sms,third_oauth', NULL, 'oauth2', NULL, NULL, NULL, NULL);
INSERT INTO `oauth_access_token` VALUES ('c5508dc8caf2dcc16ee972b9ad001905', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000171D863CCAB787372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E71007E0002787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C756571007E0005787074002461363638323261362D613633302D346566362D383066352D3438646635366366643064647371007E0009770800000171D863CCA878737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400067365727665727874000662656172657274002462623763326331352D636234392D343938382D623236392D323135653835623637626663, '5adbdc33127a50be8eb69979db183f35', 'admin', 'admin', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001FE0200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E0014787074000561646D696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000474000A6772616E745F7479706574000870617373776F7264740009636C69656E745F696474000561646D696E74000573636F7065740006736572766572740008757365726E616D6574000C7B61646D696E7D61646D696E78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F4000000000000171007E002178017371007E0027770C000000103F400000000000017371007E000D7400066F6175746832787371007E001A3F40000000000000770800000010000000007870707371007E0027770C000000103F40000000000000787371007E0027770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001FE0200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F4000000000000C7708000000100000000571007E001C71007E001D71007E002071007E002174000D636C69656E745F73656372657474000631323334353671007E001E71007E001F71007E002271007E002378007073720021636F6D2E736F7562616F2E747073686F706262632E656E746974792E41646D696E000000000000000102000E4C000761646454696D657400134C6A6176612F6C616E672F496E74656765723B4C000761646D696E496471007E00384C0005656D61696C71007E000E4C00086C616E675479706571007E000E4C00066C617374497071007E000E4C00096C6173744C6F67696E71007E00384C00076E61764C69737471007E000E4C00096F70656E54656163687400134C6A6176612F6C616E672F426F6F6C65616E3B4C000870617373776F726471007E000E4C000670617970776471007E000E4C0006726F6C65496471007E00384C000673697465496471007E00384C000B737570706C69657273496471007E00384C0008757365724E616D6571007E000E7870737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078705C8B92727371007E003B000000017400007400007400093132372E302E302E317371007E003B5E746F25740000737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400447B6263727970747D24326124313024314C6F734554394E416F482F33627639647A754B2E4F59476B44784F6B5032714B354975737A6E64366E365345726167776C48446174000071007E003E7371007E003B000000007074000561646D696E, 'f7ac5094a00f4d9040c0dac1b3eda68a');

use bb2_admin;

truncate table `admin`;
truncate table `jobs_info`;

INSERT INTO `admin` VALUES (1, 'admin', 'wyp001@163.com', '{bcrypt}$2a$10$/TFbsEFkPOJi3wnaLUHIZe2DEB0D67mnz14T029XXnnWwyn8.eIwG', 1461978472, 1588164999, '183.11.38.107', '', '', '', 1, 6, 0, 0);
INSERT INTO `admin` VALUES (2, 'shop', 'wyp001@163.com', '{bcrypt}$2a$10$zfttXeKuxIZu50s9A84GD.Y8dwZb2QxZlwUlg6prJrWOAR9T2x.um', 1461978472, 1588163219, '183.11.38.107', '', '', '', 1, 6, 0, 0);
INSERT INTO `admin` VALUES (3, 'test', '1377327082@qq.com', '{bcrypt}$2a$10$YCE3gtsoP4KFVKCcNxnfRO3ZfepsBvNspUex5ORaR/nz936ecfoI6', 1521599192, 1522113946, '183.11.39.155', NULL, '', '', 5, 1, 0, 1);

INSERT INTO `jobs_info` VALUES (1, NULL, 'jobs-mall', '0 0/1 * * * ?', 'activityJobHandler', NULL, 30, 3, 1597217820000, 1597217880000, 'soubao', '每分钟执行一次', 0, NULL, 1592622709000);
INSERT INTO `jobs_info` VALUES (2, NULL, 'jobs-mall', '0 0 1 1 * ?', 'mouthJobHandler', NULL, 30, 3, 1596214810000, 1598893200000, 'soubao', '每月1号凌晨1点执行一次', 0, NULL, 1592638707000);
INSERT INTO `jobs_info` VALUES (3, NULL, 'jobs-order', '0 0 */1 * * ?', 'autoReceiveJob', NULL, 30, 3, 1598259600000, 1611478800000, 'soubao', '每小时执行一次,自动收货确认', 0, NULL, 1592638707000);
INSERT INTO `jobs_info` VALUES (4, NULL, 'jobs-order', '0 0 0 1-2 * ?', 'autoConfirmJob', NULL, 30, 3, 1596211210000, 1598889600000, 'soubao', '每天执行一次,分销记录自动分成', 0, NULL, 1592638707000);
INSERT INTO `jobs_info` VALUES (5, NULL, 'jobs-user', '0 0 1 1 * ?', 'mouthJobHandler', NULL, 30, 3, 1596214810000, 1598893200000, 'soubao', '删除一个月以前的短信', 0, NULL, 1592793884000);
INSERT INTO `jobs_info` VALUES (6, NULL, 'jobs-mall', '1 0 0 * * ?', 'dayJobHandler', NULL, 30, 3, 1597161601000, 1597248001000, 'soubao', '每天0点01秒执行一次', 0, NULL, 1597113303000);
INSERT INTO `jobs_info` VALUES (7, NULL, 'jobs-mall', '0 0 /1 * * ? ', 'hourJobHandler', NULL, 30, 3, 1597215600000, 1597219200000, 'soubao', '每小时执行一次', 0, NULL, 1597115699000);

use bb2_mall;

truncate table `config`;

INSERT INTO `config` VALUES (1, 'express_switch', '0', 'express', NULL);
INSERT INTO `config` VALUES (2, 'kd100_key', '1212', 'express', NULL);
INSERT INTO `config` VALUES (3, 'kdniao_id', '', 'express', NULL);
INSERT INTO `config` VALUES (4, 'kdniao_key', '', 'express', NULL);
INSERT INTO `config` VALUES (5, 'record_no', '粤ICP备15065422号-3', 'shop_info', NULL);
INSERT INTO `config` VALUES (6, 'store_name', '搜豹商城', 'shop_info', NULL);
INSERT INTO `config` VALUES (7, 'company_name', 'TPshop搜豹公司', 'shop_info', NULL);
INSERT INTO `config` VALUES (8, 'store_logo', '/public/upload/logo/2020/8-24/1598256191892.png', 'shop_info', NULL);
INSERT INTO `config` VALUES (9, 'store_user_logo', '/public/upload/logo/2020/8-24/1598250543646.png', 'shop_info', NULL);
INSERT INTO `config` VALUES (10, 'store_ico', '/public/upload/logo/2018/03-20/82d37f6770ce7ef6a98c1a9aaf951a3d.png', 'shop_info', NULL);
INSERT INTO `config` VALUES (11, 'store_title', 'TPshop开源商城', 'shop_info', NULL);
INSERT INTO `config` VALUES (12, 'store_desc', '国内著名的开源商城系统', 'shop_info', NULL);
INSERT INTO `config` VALUES (13, 'store_keyword', '速度 开源  安全 高效', 'shop_info', NULL);
INSERT INTO `config` VALUES (14, 'seller_login_logo', '/public/upload/logo/2020/8-24/1598250553453.png', 'shop_info', NULL);
INSERT INTO `config` VALUES (15, 'admin_login_logo', '/public/upload/logo/2020/8-24/1598250562026.png', 'shop_info', NULL);
INSERT INTO `config` VALUES (16, 'admin_home_logo', '/public/upload/logo/2020/8-24/1598250573995.png', 'shop_info', NULL);
INSERT INTO `config` VALUES (17, 'wap_home_logo', '/public/upload/logo/2020/8-24/1598250593111.png', 'shop_info', NULL);
INSERT INTO `config` VALUES (18, 'wap_login_logo', '/public/upload/logo/2020/8-24/1598250596974.png', 'shop_info', NULL);
INSERT INTO `config` VALUES (19, 'contact', '张先生', 'shop_info', NULL);
INSERT INTO `config` VALUES (20, 'phone', '15889560670', 'shop_info', NULL);
INSERT INTO `config` VALUES (21, 'address', '深圳市龙岗区坂田街道城市山海中心', 'shop_info', NULL);
INSERT INTO `config` VALUES (22, 'qq', '2852506358', 'shop_info', NULL);
INSERT INTO `config` VALUES (23, 'qq2', '2852506359', 'shop_info', NULL);
INSERT INTO `config` VALUES (24, 'qq3', '2852506357', 'shop_info', NULL);
INSERT INTO `config` VALUES (25, 'point_send_limit', '50', 'shopping', NULL);
INSERT INTO `config` VALUES (26, 'point_min_limit', '200', 'shopping', NULL);
INSERT INTO `config` VALUES (27, 'point_use_percent', '50', 'shopping', NULL);
INSERT INTO `config` VALUES (28, 'auto_confirm_date', '1', 'shopping', NULL);
INSERT INTO `config` VALUES (29, 'auto_transfer_date', '1', 'shopping', NULL);
INSERT INTO `config` VALUES (30, 'auto_service_date', '1', 'shopping', NULL);
INSERT INTO `config` VALUES (31, 'integral_use_enable', '1', 'shopping', NULL);
INSERT INTO `config` VALUES (32, 'reduce', '1', 'shopping', NULL);
INSERT INTO `config` VALUES (33, 'point_rate', '10', 'shopping', NULL);
INSERT INTO `config` VALUES (34, 'complain_time_limit', '30', 'complain', NULL);
INSERT INTO `config` VALUES (35, 'reg_integral', '200', 'basic', NULL);
INSERT INTO `config` VALUES (36, 'file_size', '1', 'basic', NULL);
INSERT INTO `config` VALUES (37, 'default_storage', '100', 'basic', NULL);
INSERT INTO `config` VALUES (38, 'need', '10', 'basic', NULL);
INSERT INTO `config` VALUES (39, 'min', '10', 'basic', NULL);
INSERT INTO `config` VALUES (40, 'tax', '12', 'basic', NULL);
INSERT INTO `config` VALUES (41, 'hot_keywords', '手机|华为|衣服', 'basic', NULL);
INSERT INTO `config` VALUES (42, 'is_bind_account', '0', 'basic', NULL);
INSERT INTO `config` VALUES (43, 'sms_platform', '2', 'sms', NULL);
INSERT INTO `config` VALUES (44, 'sms_appkey', '', 'sms', NULL);
INSERT INTO `config` VALUES (45, 'sms_secretKey', '', 'sms', NULL);
INSERT INTO `config` VALUES (46, 'sms_product', 'TPshop商城', 'sms', NULL);
INSERT INTO `config` VALUES (47, 'regis_sms_enable', '0', 'sms', NULL);
INSERT INTO `config` VALUES (48, 'forget_pwd_sms_enable', '1', 'sms', NULL);
INSERT INTO `config` VALUES (49, 'bind_mobile_sms_enable', '1', 'sms', NULL);
INSERT INTO `config` VALUES (50, 'order_add_sms_enable', '1', 'sms', NULL);
INSERT INTO `config` VALUES (51, 'order_pay_sms_enable', '1', 'sms', NULL);
INSERT INTO `config` VALUES (52, 'order_shipping_sms_enable', '1', 'sms', NULL);
INSERT INTO `config` VALUES (53, 'virtual_goods_sms_enable', '1', 'sms', NULL);
INSERT INTO `config` VALUES (54, 'sms_time_out', '60', 'sms', NULL);
INSERT INTO `config` VALUES (55, 'sign_on_off', '1', 'sign', NULL);
INSERT INTO `config` VALUES (56, 'sign_integral', '5', 'sign', NULL);
INSERT INTO `config` VALUES (57, 'sign_signcount', '2', 'sign', NULL);
INSERT INTO `config` VALUES (58, 'sign_award', '20', 'sign', NULL);
INSERT INTO `config` VALUES (59, 'is_mark', '1', 'water', NULL);
INSERT INTO `config` VALUES (60, 'mark_type', 'text', 'water', NULL);
INSERT INTO `config` VALUES (61, 'mark_txt', 'tpshop', 'water', NULL);
INSERT INTO `config` VALUES (62, 'mark_txt_size', '30', 'water', NULL);
INSERT INTO `config` VALUES (63, 'mark_txt_color', '#000000', 'water', NULL);
INSERT INTO `config` VALUES (64, 'mark_img', '', 'water', NULL);
INSERT INTO `config` VALUES (65, 'mark_width', '', 'water', NULL);
INSERT INTO `config` VALUES (66, 'mark_height', '', 'water', NULL);
INSERT INTO `config` VALUES (67, 'mark_degree', '54', 'water', NULL);
INSERT INTO `config` VALUES (68, 'mark_quality', '50', 'water', NULL);
INSERT INTO `config` VALUES (69, 'sel', '5', 'water', NULL);
INSERT INTO `config` VALUES (70, 'switch', '1', 'distribut', NULL);
INSERT INTO `config` VALUES (71, 'distribut_set_by', '0', 'distribut', NULL);
INSERT INTO `config` VALUES (72, 'regrade', '1', 'distribut', NULL);
INSERT INTO `config` VALUES (73, 'first_rate', '4', 'distribut', NULL);
INSERT INTO `config` VALUES (74, 'second_rate', '3', 'distribut', NULL);
INSERT INTO `config` VALUES (75, 'third_rate', '2', 'distribut', NULL);
INSERT INTO `config` VALUES (76, 'qr_back', '/public/upload/weixin/2018/03-07/01ecfdadf99c1b2b01baad0a991bd324.jpg', 'distribut', NULL);
INSERT INTO `config` VALUES (77, 'qr_big_back', '/public/upload/weixin/2018/03-07/f6af99ea507fdb2ba29febcb5fb7e888.jpg', 'distribut', NULL);
INSERT INTO `config` VALUES (78, 'qrcode_menu_word', '我的二维码', 'distribut', NULL);
INSERT INTO `config` VALUES (79, 'qrcode_input_word', '我的二维码', 'distribut', NULL);
INSERT INTO `config` VALUES (80, 'smtp_server', '', 'smtp', NULL);
INSERT INTO `config` VALUES (81, 'smtp_port', '465', 'smtp', NULL);
INSERT INTO `config` VALUES (82, 'smtp_user', '', 'smtp', NULL);
INSERT INTO `config` VALUES (83, 'smtp_pwd', '', 'smtp', NULL);
INSERT INTO `config` VALUES (84, 'regis_smtp_enable', '0', 'smtp', NULL);
INSERT INTO `config` VALUES (85, 'test_eamil', '', 'smtp', NULL);
INSERT INTO `config` VALUES (86, 'team_order_limit_time', '60', 'shopping', NULL);
INSERT INTO `config` VALUES (87, 'site_domain', 'http://kingda.com', 'subdomain', NULL);
INSERT INTO `config` VALUES (88, 'weixin_qrcode', '/public/static/images/qrcode.png', 'shop_info', NULL);
INSERT INTO `config` VALUES (89, 't_number', '687474703a2f2f61706974657374322e747073686f702e636e2f686f6d652f546a2f7032', NULL, NULL);
INSERT INTO `config` VALUES (90, 'bd_ak', 'xXo650H9zUKh1Lk19Ztsn984G3Td85', 'basic', NULL);
INSERT INTO `config` VALUES (91, 'bd_serverak', 'WWeszdz3UyzdtLdmcG4OP0oePjSHSwqh', 'basic', NULL);
INSERT INTO `config` VALUES (92, 'im_choose', '1', 'basic', NULL);
INSERT INTO `config` VALUES (93, 'im_website', 'https://im.tpsns.com', 'basic', NULL);
INSERT INTO `config` VALUES (94, 'ws_socket', 'wss://im.tpsns.com:8283', 'basic', NULL);
INSERT INTO `config` VALUES (95, 'enabled_subdomain', '0', 'subdomain', NULL);
INSERT INTO `config` VALUES (96, 'subdomain_edit', '1', 'subdomain', NULL);
INSERT INTO `config` VALUES (97, 'subdomain_times', '3', 'subdomain', NULL);
INSERT INTO `config` VALUES (98, 'site_domain', 'http://kingda.com', 'subdomain', NULL);
INSERT INTO `config` VALUES (99, 'subdomain_length', '3-12', 'subdomain', NULL);
INSERT INTO `config` VALUES (100, 'open_store_time', '0', 'distribut', NULL);
INSERT INTO `config` VALUES (101, 'cash_open', '1', 'cash', NULL);
INSERT INTO `config` VALUES (102, 'service_ratio', '0', 'cash', NULL);
INSERT INTO `config` VALUES (103, 'min_service_money', '0', 'cash', NULL);
INSERT INTO `config` VALUES (104, 'max_service_money', '0', 'cash', NULL);
INSERT INTO `config` VALUES (105, 'min_cash', '0', 'cash', NULL);
INSERT INTO `config` VALUES (106, 'max_cash', '100', 'cash', NULL);
INSERT INTO `config` VALUES (107, 'count_cash', '5000', 'cash', NULL);
INSERT INTO `config` VALUES (108, 'cash_times', '5', 'cash', NULL);
INSERT INTO `config` VALUES (109, 'host', 'https://j.tpsns.com', 'shop_info', NULL);
INSERT INTO `config` VALUES (110, 'finally_pay_time', '86400', 'shopping', NULL);
INSERT INTO `config` VALUES (111, 'switch', '0', 'wx_pay', NULL);
INSERT INTO `config` VALUES (112, 'switch', '0', 'ali_pay', NULL);
INSERT INTO `config` VALUES (113, 'switch', '0', 'pay_pal', NULL);