/*
Navicat MySQL Data Transfer

Source Server         : songshu
Source Server Version : 50648
Source Host           : 47.106.166.151:3306
Source Database       : online_mall

Target Server Type    : MYSQL
Target Server Version : 50648
File Encoding         : 65001

Date: 2020-09-29 11:28:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mall_cart`
-- ----------------------------
DROP TABLE IF EXISTS `mall_cart`;
CREATE TABLE `mall_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_cart
-- ----------------------------
INSERT INTO `mall_cart` VALUES ('14', '26', '1', '1', '1', '2020-06-05 11:55:06', '2020-06-05 11:55:06');
INSERT INTO `mall_cart` VALUES ('30', '24', '9', '94', '0', '2020-06-23 18:26:38', '2020-09-12 15:49:57');
INSERT INTO `mall_cart` VALUES ('32', '24', '11', '37', '0', '2020-06-23 18:26:45', '2020-09-12 15:49:57');
INSERT INTO `mall_cart` VALUES ('35', '24', '7', '22', '0', '2020-06-23 18:36:25', '2020-09-19 17:49:48');
INSERT INTO `mall_cart` VALUES ('61', '12001', '114', '0', '0', '2020-08-11 17:19:40', '2020-08-19 22:53:49');
INSERT INTO `mall_cart` VALUES ('65', '12001', '91', '1', '0', '2020-08-13 11:13:59', '2020-08-19 22:53:49');
INSERT INTO `mall_cart` VALUES ('66', '12001', '2', '1', '1', '2020-08-13 11:14:10', '2020-09-19 15:56:10');
INSERT INTO `mall_cart` VALUES ('67', '12001', '64', '1', '0', '2020-08-13 11:14:22', '2020-08-19 22:53:49');
INSERT INTO `mall_cart` VALUES ('68', '12001', '11', '1', '0', '2020-08-13 11:14:30', '2020-08-19 22:53:49');
INSERT INTO `mall_cart` VALUES ('70', '12003', '55', '4', '1', '2020-09-08 21:26:08', '2020-09-08 21:26:15');
INSERT INTO `mall_cart` VALUES ('75', '24', '1', '999', '0', '2020-09-12 15:49:41', '2020-09-19 17:49:49');
INSERT INTO `mall_cart` VALUES ('77', '12001', '25', '1', '1', '2020-09-21 17:17:24', '2020-09-21 17:17:24');

-- ----------------------------
-- Table structure for `mall_category`
-- ----------------------------
DROP TABLE IF EXISTS `mall_category`;
CREATE TABLE `mall_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `sort_order` int(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100041 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_category
-- ----------------------------
INSERT INTO `mall_category` VALUES ('100001', '0', '二次元', '1', null, '2020-04-10 15:34:45', '2020-04-10 15:34:45');
INSERT INTO `mall_category` VALUES ('100002', '0', '科技', '1', null, '2020-04-10 15:35:17', '2020-04-10 15:35:17');
INSERT INTO `mall_category` VALUES ('100003', '0', '芯片', '1', null, '2020-04-10 15:35:42', '2020-04-10 15:35:42');
INSERT INTO `mall_category` VALUES ('100004', '0', '图书', '1', null, '2020-04-10 15:36:22', '2020-04-10 15:36:22');
INSERT INTO `mall_category` VALUES ('100005', '0', '品如衣柜', '1', null, '2020-04-10 15:36:48', '2020-04-10 15:36:48');
INSERT INTO `mall_category` VALUES ('100006', '100031', '双开门冰箱', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100007', '100031', '电视', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100008', '100031', '洗衣机', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100009', '100031', '空调', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100010', '100031', '热水器', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100011', '100033', '笔记本电脑', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100012', '100033', '手机', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100013', '100033', '平板电脑', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100014', '100033', '数码相机', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100015', '100033', '3C配件', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100016', '100032', '女装', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100017', '100032', '帽子专区', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100018', '100032', '旅行箱', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100019', '100032', '手提包', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100020', '100032', '保暖内衣', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100021', '100034', '最爱零食', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100022', '100034', '生鲜', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100023', '100034', '半成菜', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100024', '100034', '速冻专区', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100025', '100034', '进口牛奶', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100026', '100035', '白酒', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100027', '100035', '红酒', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100028', '100035', '饮料', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100029', '100035', '调整鸡尾酒', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100030', '100035', '进口洋酒', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100031', '0', '家用电器', '1', null, null, null);
INSERT INTO `mall_category` VALUES ('100032', '0', '服装箱包', '1', null, '2020-04-10 15:56:51', '2020-04-10 15:56:51');
INSERT INTO `mall_category` VALUES ('100033', '0', '数码', '1', null, '2020-06-22 17:43:34', '2020-06-22 17:43:34');
INSERT INTO `mall_category` VALUES ('100034', '0', '食品生鲜', '1', null, '2020-06-22 17:44:14', '2020-06-22 17:44:14');
INSERT INTO `mall_category` VALUES ('100035', '0', '酒水饮料', '1', null, '2020-06-22 17:44:25', '2020-06-22 17:44:25');
INSERT INTO `mall_category` VALUES ('100037', '100001', '刀剑神域', '1', null, '2020-08-07 15:12:38', '2020-08-07 15:12:38');
INSERT INTO `mall_category` VALUES ('100038', '100001', 'JOJO的奇妙冒险', '1', null, '2020-08-07 15:14:01', '2020-08-07 15:14:01');
INSERT INTO `mall_category` VALUES ('100039', '100004', '人文社科类', '1', null, '2020-08-07 16:15:20', '2020-08-07 16:15:20');
INSERT INTO `mall_category` VALUES ('100040', '100003', '中芯国际7nm芯片', '1', null, '2020-09-17 17:05:21', '2020-09-17 17:05:21');

-- ----------------------------
-- Table structure for `mall_order`
-- ----------------------------
DROP TABLE IF EXISTS `mall_order`;
CREATE TABLE `mall_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shipping_id` int(11) DEFAULT NULL,
  `payment` decimal(20,2) DEFAULT NULL,
  `payment_type` int(4) DEFAULT NULL,
  `postage` int(10) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `payment_time` datetime DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `close_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no_index` (`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_order
-- ----------------------------
INSERT INTO `mall_order` VALUES ('1', '1587977908448', '21', '3', '7500.00', '1', '0', '0', null, null, null, null, '2020-04-27 16:58:28', '2020-04-27 16:58:28');
INSERT INTO `mall_order` VALUES ('2', '1587979319481', '21', '2', '2000.00', '1', '0', '40', null, '2020-04-27 17:41:25', null, null, '2020-04-27 17:21:59', '2020-04-27 17:41:25');
INSERT INTO `mall_order` VALUES ('3', '1590303909655', '21', '4', '2000.00', '1', '0', '0', null, null, null, null, '2020-05-24 15:05:09', '2020-05-24 15:05:09');
INSERT INTO `mall_order` VALUES ('4', '1590395709396', '21', '1', '4500.00', '1', '0', '0', null, null, null, null, '2020-05-25 16:35:09', '2020-05-25 16:35:09');
INSERT INTO `mall_order` VALUES ('5', '1590414505964', '21', '1', '4500.00', '1', '0', '0', null, null, null, null, '2020-05-25 21:48:25', '2020-05-25 21:48:25');
INSERT INTO `mall_order` VALUES ('6', '1591071803810', '24', '8', '3000.00', '1', '0', '0', null, null, null, null, '2020-06-02 12:23:23', '2020-06-02 12:23:23');
INSERT INTO `mall_order` VALUES ('7', '1591073951191', '24', '8', '4000.00', '1', '0', '60', null, null, null, null, '2020-06-02 12:59:11', '2020-06-02 12:59:11');
INSERT INTO `mall_order` VALUES ('8', '1591154118830', '24', '8', '1500.00', '1', '0', '0', null, null, null, null, '2020-06-03 11:15:18', '2020-06-03 11:15:18');
INSERT INTO `mall_order` VALUES ('9', '1591154294046', '24', '8', '1500.00', '1', '0', '60', null, null, null, null, '2020-06-03 11:18:14', '2020-06-03 11:18:14');
INSERT INTO `mall_order` VALUES ('10', '1591154853824', '24', '8', '1500.00', '1', '0', '20', '2020-06-12 16:20:15', null, null, null, '2020-06-03 11:27:33', '2020-06-12 16:20:19');
INSERT INTO `mall_order` VALUES ('11', '1591157923518', '24', '8', '1500.00', '1', '0', '20', '2020-06-03 13:45:30', null, null, null, '2020-06-03 12:18:43', '2020-06-03 13:45:31');
INSERT INTO `mall_order` VALUES ('12', '1591159652843', '24', '8', '1500.00', '1', '0', '40', '2020-06-03 13:27:04', '2020-06-22 19:05:09', null, null, '2020-06-03 12:47:32', '2020-06-22 19:05:09');
INSERT INTO `mall_order` VALUES ('13', '1591161620517', '24', '8', '1500.00', '1', '0', '20', '2020-06-03 13:20:42', null, null, null, '2020-06-03 13:20:20', '2020-06-03 13:20:43');
INSERT INTO `mall_order` VALUES ('14', '1591164652603', '24', '3', '3000.00', '1', '0', '20', '2020-06-03 14:11:18', null, null, null, '2020-06-03 14:10:52', '2020-06-03 14:11:19');
INSERT INTO `mall_order` VALUES ('15', '1591189119363', '21', '13', '6500.00', '1', '0', '40', '2020-06-03 20:58:57', '2020-06-22 17:41:37', null, null, '2020-06-03 20:58:39', '2020-06-22 17:41:37');
INSERT INTO `mall_order` VALUES ('16', '1591612521926', '24', '1', '3000.00', '1', '0', '40', '2020-06-08 18:35:45', '2020-06-22 16:10:55', null, null, '2020-06-08 18:35:21', '2020-06-22 16:10:55');
INSERT INTO `mall_order` VALUES ('17', '1592051623596', '24', '14', '6000.00', '1', '0', '40', '2020-06-13 20:34:34', '2020-06-22 16:06:52', null, null, '2020-06-13 20:33:43', '2020-06-22 16:06:52');
INSERT INTO `mall_order` VALUES ('18', '1592130208031', '24', '14', '9000.00', '1', '0', '40', '2020-06-14 18:23:49', '2020-06-22 16:06:34', null, null, '2020-06-14 18:23:27', '2020-06-22 16:06:34');
INSERT INTO `mall_order` VALUES ('19', '1592813254521', '24', '1', '18998.00', '1', '0', '40', '2020-06-22 16:07:57', '2020-06-22 16:09:45', null, null, '2020-06-22 16:07:34', '2020-06-22 16:09:45');
INSERT INTO `mall_order` VALUES ('20', '1592908112572', '24', '15', '40500.00', '1', '0', '40', '2020-06-23 18:28:57', '2020-06-24 22:20:40', null, null, '2020-06-23 18:28:32', '2020-06-24 22:20:40');
INSERT INTO `mall_order` VALUES ('21', '1594119160756', '12000', '16', '1999.00', '1', '0', '40', '2020-07-10 12:12:24', '2020-07-10 21:09:23', null, null, '2020-07-07 18:52:40', '2020-07-10 21:09:23');
INSERT INTO `mall_order` VALUES ('22', '1594128673621', '12000', '16', '1999.00', '1', '0', '40', '2020-07-07 21:31:49', '2020-07-09 09:54:50', null, null, '2020-07-07 21:31:13', '2020-07-09 09:54:50');
INSERT INTO `mall_order` VALUES ('23', '1594354161336', '12000', '16', '24.00', '1', '0', '0', null, null, null, null, '2020-07-10 12:09:21', '2020-07-10 12:09:21');
INSERT INTO `mall_order` VALUES ('24', '1594378687613', '12000', '16', '3998.00', '1', '0', '60', null, null, null, null, '2020-07-10 18:58:07', '2020-07-10 18:58:07');
INSERT INTO `mall_order` VALUES ('25', '1594561601965', '12000', '17', '1999.00', '1', '0', '0', null, null, null, null, '2020-07-12 21:46:41', '2020-07-12 21:46:41');
INSERT INTO `mall_order` VALUES ('26', '1594633481700', '12000', '18', '8996.00', '1', '0', '40', '2020-07-13 17:58:46', '2020-07-14 22:01:36', null, null, '2020-07-13 17:44:41', '2020-07-14 22:01:36');
INSERT INTO `mall_order` VALUES ('27', '1594731356241', '12000', '17', '1999.00', '1', '0', '40', '2020-07-14 20:56:25', '2020-07-17 23:07:00', null, null, '2020-07-14 20:55:56', '2020-07-17 23:07:00');
INSERT INTO `mall_order` VALUES ('28', '1594780837971', '12000', '17', '9995.00', '1', '0', '0', null, null, null, null, '2020-07-15 10:40:37', '2020-07-15 10:40:37');
INSERT INTO `mall_order` VALUES ('29', '1594782690134', '12000', '17', '6000.00', '1', '0', '60', null, null, null, null, '2020-07-15 11:11:30', '2020-07-15 11:11:30');
INSERT INTO `mall_order` VALUES ('30', '1594795194373', '12000', '17', '1999.00', '1', '0', '0', null, null, null, null, '2020-07-15 14:39:54', '2020-07-15 14:39:54');
INSERT INTO `mall_order` VALUES ('31', '1596378994995', '24', '14', '90000.00', '1', '0', '60', '2020-08-02 22:37:07', '2020-08-02 22:39:15', null, null, '2020-08-02 22:36:34', '2020-08-02 22:39:15');
INSERT INTO `mall_order` VALUES ('32', '1596770988533', '24', '8', '79999.00', '1', '0', '0', null, null, null, null, '2020-08-07 11:29:48', '2020-08-07 11:29:48');
INSERT INTO `mall_order` VALUES ('33', '1596969523191', '24', '14', '48.00', '1', '0', '20', '2020-08-09 18:39:06', null, null, null, '2020-08-09 18:38:43', '2020-08-09 18:39:06');
INSERT INTO `mall_order` VALUES ('34', '1596969627372', '24', '14', '12.00', '1', '0', '60', null, null, null, null, '2020-08-09 18:40:27', '2020-08-09 18:40:27');
INSERT INTO `mall_order` VALUES ('35', '1596969735512', '24', '1', '9995.00', '1', '0', '60', null, null, null, null, '2020-08-09 18:42:15', '2020-08-09 18:42:15');
INSERT INTO `mall_order` VALUES ('36', '1596969745273', '24', '7', '8997.00', '1', '0', '60', null, null, null, null, '2020-08-09 18:42:25', '2020-08-09 18:42:25');
INSERT INTO `mall_order` VALUES ('37', '1596969756092', '24', '3', '12000.00', '1', '0', '60', null, null, null, null, '2020-08-09 18:42:36', '2020-08-09 18:42:36');
INSERT INTO `mall_order` VALUES ('38', '1596969770699', '24', '8', '6016.00', '1', '0', '60', null, null, null, null, '2020-08-09 18:42:50', '2020-08-09 18:42:50');
INSERT INTO `mall_order` VALUES ('39', '1596969824368', '24', '19', '20.00', '1', '0', '60', null, null, null, null, '2020-08-09 18:43:44', '2020-08-09 18:43:44');
INSERT INTO `mall_order` VALUES ('40', '1596969869356', '24', '6', '79999.00', '1', '0', '0', null, null, null, null, '2020-08-09 18:44:29', '2020-08-09 18:44:29');
INSERT INTO `mall_order` VALUES ('41', '1596969890076', '24', '1', '79999.00', '1', '0', '60', null, null, null, null, '2020-08-09 18:44:50', '2020-08-09 18:44:50');
INSERT INTO `mall_order` VALUES ('42', '1596980076816', '24', '19', '79999.00', '1', '0', '60', null, null, null, null, '2020-08-09 21:34:36', '2020-08-09 21:34:36');
INSERT INTO `mall_order` VALUES ('43', '1597068586258', '24', '19', '79999.00', '1', '0', '60', null, null, null, null, '2020-08-10 22:09:46', '2020-08-10 22:09:46');
INSERT INTO `mall_order` VALUES ('44', '1597135424592', '24', '19', '80.00', '1', '0', '40', '2020-08-11 16:44:24', '2020-08-15 19:13:28', null, null, '2020-08-11 16:43:44', '2020-08-15 19:13:28');
INSERT INTO `mall_order` VALUES ('45', '1597137567713', '12001', '20', '2999.00', '1', '0', '60', null, null, null, null, '2020-08-11 17:19:27', '2020-08-11 17:19:27');
INSERT INTO `mall_order` VALUES ('46', '1597146367120', '24', '8', '79999.00', '1', '0', '40', '2020-08-11 19:46:38', '2020-08-11 22:22:49', null, null, '2020-08-11 19:46:07', '2020-08-11 22:22:49');
INSERT INTO `mall_order` VALUES ('47', '1599123073624', '24', '3', '999999999.00', '1', '0', '60', null, null, null, null, '2020-09-03 16:51:13', '2020-09-03 16:51:13');
INSERT INTO `mall_order` VALUES ('48', '1599123091877', '24', '19', '1332.00', '1', '0', '40', '2020-09-03 16:52:26', '2020-09-15 10:24:54', null, null, '2020-09-03 16:51:31', '2020-09-15 10:24:54');
INSERT INTO `mall_order` VALUES ('49', '1599573758010', '12004', '21', '1996.00', '1', '0', '60', null, null, null, null, '2020-09-08 22:02:37', '2020-09-08 22:02:37');
INSERT INTO `mall_order` VALUES ('50', '1599573892245', '12004', '21', '1996.00', '1', '0', '20', '2020-09-08 22:06:25', null, null, null, '2020-09-08 22:04:52', '2020-09-08 22:06:25');
INSERT INTO `mall_order` VALUES ('51', '1599574028777', '12004', '21', '1996.00', '1', '0', '40', '2020-09-08 22:07:29', '2020-09-15 10:24:45', null, null, '2020-09-08 22:07:08', '2020-09-15 10:24:45');
INSERT INTO `mall_order` VALUES ('52', '1599786845980', '24', '14', '2999.00', '1', '0', '60', null, null, null, null, '2020-09-11 09:14:05', '2020-09-11 09:14:05');
INSERT INTO `mall_order` VALUES ('53', '1600150701736', '12005', '22', '3000.00', '1', '0', '20', '2020-09-15 14:18:55', null, null, null, '2020-09-15 14:18:21', '2020-09-15 14:18:57');
INSERT INTO `mall_order` VALUES ('54', '1600250044938', '12001', '20', '15.00', '1', '0', '60', null, null, null, null, '2020-09-16 17:54:04', '2020-09-16 17:54:04');
INSERT INTO `mall_order` VALUES ('55', '1600333945263', '24', '7', '79999.00', '1', '0', '40', '2020-09-17 17:13:10', '2020-09-17 19:42:51', null, null, '2020-09-17 17:12:25', '2020-09-17 19:42:51');
INSERT INTO `mall_order` VALUES ('56', '1600509059788', '24', '19', '234.00', '1', '0', '40', '2020-09-19 17:54:04', '2020-09-20 14:38:32', null, null, '2020-09-19 17:50:59', '2020-09-20 14:38:32');

-- ----------------------------
-- Table structure for `mall_order_item`
-- ----------------------------
DROP TABLE IF EXISTS `mall_order_item`;
CREATE TABLE `mall_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_image` varchar(500) DEFAULT NULL,
  `current_unit_price` decimal(20,2) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `total_price` decimal(20,2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_no_index` (`order_no`) USING BTREE,
  KEY `order_no_user_id_index` (`order_no`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_order_item
-- ----------------------------
INSERT INTO `mall_order_item` VALUES ('1', '1587977908448', '21', '3', '华为mate40', '/203292ff-33bf-4d4b-a254-f48169b35042.jpg', '3000.00', '1', '3000.00', '2020-04-27 16:58:28', '2020-04-27 16:58:28');
INSERT INTO `mall_order_item` VALUES ('2', '1587977908448', '21', '4', '华为mate30', '6d0f7faa-b138-4c97-9b4d-8eee26e68c5f.jpg', '3000.00', '1', '3000.00', '2020-04-27 16:58:28', '2020-04-27 16:58:28');
INSERT INTO `mall_order_item` VALUES ('3', '1587977908448', '21', '5', '美的冰箱xb30', 'e889491e-81d8-4614-97d4-757c7bf85c5c.jpg', '1500.00', '1', '1500.00', '2020-04-27 16:58:28', '2020-04-27 16:58:28');
INSERT INTO `mall_order_item` VALUES ('4', '1587979319481', '21', '1', '三星爆炸牌电池', '203292ff-33bf-4d4b-a254-f48169b35042.jpg', '2000.00', '1', '2000.00', '2020-04-27 17:21:59', '2020-04-27 17:21:59');
INSERT INTO `mall_order_item` VALUES ('5', '1590303909655', '21', '1', '三星爆炸牌电池', '203292ff-33bf-4d4b-a254-f48169b35042.jpg', '2000.00', '1', '2000.00', '2020-05-24 15:05:09', '2020-05-24 15:05:09');
INSERT INTO `mall_order_item` VALUES ('6', '1590395709396', '21', '5', '美的冰箱xb30', '203292ff-33bf-4d4b-a254-f48169b35042.jpg', '1500.00', '1', '1500.00', '2020-05-25 16:35:09', '2020-05-25 16:35:09');
INSERT INTO `mall_order_item` VALUES ('7', '1590395709396', '21', '3', '华为mate40', 'e889491e-81d8-4614-97d4-757c7bf85c5c.jpg', '3000.00', '1', '3000.00', '2020-05-25 16:35:09', '2020-05-25 16:35:09');
INSERT INTO `mall_order_item` VALUES ('8', '1590414505964', '21', '5', '美的冰箱xb30', '203292ff-33bf-4d4b-a254-f48169b35042.jpg', '1500.00', '1', '1500.00', '2020-05-25 21:48:26', '2020-05-25 21:48:26');
INSERT INTO `mall_order_item` VALUES ('9', '1590414505964', '21', '3', '华为mate40', 'e889491e-81d8-4614-97d4-757c7bf85c5c.jpg', '3000.00', '1', '3000.00', '2020-05-25 21:48:26', '2020-05-25 21:48:26');
INSERT INTO `mall_order_item` VALUES ('10', '1591071803810', '24', '3', '华为mate40', 'e889491e-81d8-4614-97d4-757c7bf85c5c.jpg', '3000.00', '1', '3000.00', '2020-06-02 12:23:23', '2020-06-02 12:23:23');
INSERT INTO `mall_order_item` VALUES ('11', '1591073951191', '24', '1', '三星爆炸牌电池', '203292ff-33bf-4d4b-a254-f48169b35042.jpg', '2000.00', '2', '4000.00', '2020-06-02 12:59:11', '2020-06-02 12:59:11');
INSERT INTO `mall_order_item` VALUES ('12', '1591154118830', '24', '5', '美的冰箱xb30', '203292ff-33bf-4d4b-a254-f48169b35042.jpg', '1500.00', '1', '1500.00', '2020-06-03 11:15:18', '2020-06-03 11:15:18');
INSERT INTO `mall_order_item` VALUES ('13', '1591154294046', '24', '5', '美的冰箱xb30', '203292ff-33bf-4d4b-a254-f48169b35042.jpg', '1500.00', '1', '1500.00', '2020-06-03 11:18:14', '2020-06-03 11:18:14');
INSERT INTO `mall_order_item` VALUES ('14', '1591154853824', '24', '5', '美的冰箱xb30', '203292ff-33bf-4d4b-a254-f48169b35042.jpg', '1500.00', '1', '1500.00', '2020-06-03 11:27:33', '2020-06-03 11:27:33');
INSERT INTO `mall_order_item` VALUES ('15', '1591157923518', '24', '5', '美的冰箱xb30', '203292ff-33bf-4d4b-a254-f48169b35042.jpg', '1500.00', '1', '1500.00', '2020-06-03 12:18:43', '2020-06-03 12:18:43');
INSERT INTO `mall_order_item` VALUES ('16', '1591159652843', '24', '5', '美的冰箱xb30', '203292ff-33bf-4d4b-a254-f48169b35042.jpg', '1500.00', '1', '1500.00', '2020-06-03 12:47:32', '2020-06-03 12:47:32');
INSERT INTO `mall_order_item` VALUES ('17', '1591161620517', '24', '5', '美的冰箱xb30', '203292ff-33bf-4d4b-a254-f48169b35042.jpg', '1500.00', '1', '1500.00', '2020-06-03 13:20:20', '2020-06-03 13:20:20');
INSERT INTO `mall_order_item` VALUES ('18', '1591164652603', '24', '3', '华为mate40', 'e889491e-81d8-4614-97d4-757c7bf85c5c.jpg', '3000.00', '1', '3000.00', '2020-06-03 14:10:52', '2020-06-03 14:10:52');
INSERT INTO `mall_order_item` VALUES ('19', '1591189119363', '21', '3', '华为mate40', 'e889491e-81d8-4614-97d4-757c7bf85c5c.jpg', '3000.00', '1', '3000.00', '2020-06-03 20:58:39', '2020-06-03 20:58:39');
INSERT INTO `mall_order_item` VALUES ('20', '1591189119363', '21', '5', '美的冰箱xb30', '203292ff-33bf-4d4b-a254-f48169b35042.jpg', '1500.00', '1', '1500.00', '2020-06-03 20:58:39', '2020-06-03 20:58:39');
INSERT INTO `mall_order_item` VALUES ('21', '1591189119363', '21', '1', '三星爆炸牌电池', '203292ff-33bf-4d4b-a254-f48169b35042.jpg', '2000.00', '1', '2000.00', '2020-06-03 20:58:39', '2020-06-03 20:58:39');
INSERT INTO `mall_order_item` VALUES ('22', '1591612521926', '24', '3', '华为mate40', 'e889491e-81d8-4614-97d4-757c7bf85c5c.jpg', '3000.00', '1', '3000.00', '2020-06-08 18:35:21', '2020-06-08 18:35:21');
INSERT INTO `mall_order_item` VALUES ('23', '1592051623596', '24', '2', '小米9', 'e889491e-81d8-4614-97d4-757c7bf85c5c.jpg', '2000.00', '3', '6000.00', '2020-06-13 20:33:43', '2020-06-13 20:33:43');
INSERT INTO `mall_order_item` VALUES ('24', '1592130208031', '24', '3', '华为mate40', 'e889491e-81d8-4614-97d4-757c7bf85c5c.jpg', '3000.00', '3', '9000.00', '2020-06-14 18:23:27', '2020-06-14 18:23:27');
INSERT INTO `mall_order_item` VALUES ('25', '1592813254521', '24', '5', '美的冰箱xb30', '21d749ee-5326-445a-97cb-b9ca3396384a.jpg', '1500.00', '3', '4500.00', '2020-06-22 16:07:34', '2020-06-22 16:07:34');
INSERT INTO `mall_order_item` VALUES ('26', '1592813254521', '24', '2', '小米9手机', '77bb7ee5-b3da-4afb-95f5-293ef35e2588.jpg', '2999.00', '1', '2999.00', '2020-06-22 16:07:34', '2020-06-22 16:07:34');
INSERT INTO `mall_order_item` VALUES ('27', '1592813254521', '24', '1', '三星手机爆炸牌电池', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '1999.00', '1', '1999.00', '2020-06-22 16:07:34', '2020-06-22 16:07:34');
INSERT INTO `mall_order_item` VALUES ('28', '1592813254521', '24', '3', '华为mate40手机', '4eb655e6-697c-4cd2-9d3d-f43913dd74c3.jpg', '3000.00', '1', '3000.00', '2020-06-22 16:07:34', '2020-06-22 16:07:34');
INSERT INTO `mall_order_item` VALUES ('29', '1592813254521', '24', '6', '小米10手机', 'a03f3004-8dcd-4a5b-8291-7e318016caec.jpg', '4500.00', '1', '4500.00', '2020-06-22 16:07:34', '2020-06-22 16:07:34');
INSERT INTO `mall_order_item` VALUES ('30', '1592813254521', '24', '4', '华为mate30手机', '5f5601c4-df2a-4951-b928-6a0108b95cf0.jpg', '2000.00', '1', '2000.00', '2020-06-22 16:07:34', '2020-06-22 16:07:34');
INSERT INTO `mall_order_item` VALUES ('31', '1592908112572', '24', '6', '小米10手机', 'a03f3004-8dcd-4a5b-8291-7e318016caec.jpg', '4500.00', '9', '40500.00', '2020-06-23 18:28:32', '2020-06-23 18:28:32');
INSERT INTO `mall_order_item` VALUES ('32', '1594119160756', '12000', '108', '海尔冰箱', '2328040c-1c80-436b-a8f8-451c437ccf5a.jpg', '1999.00', '1', '1999.00', '2020-07-07 18:52:40', '2020-07-07 18:52:40');
INSERT INTO `mall_order_item` VALUES ('33', '1594128673621', '12000', '108', '海尔冰箱', '2328040c-1c80-436b-a8f8-451c437ccf5a.jpg', '1999.00', '1', '1999.00', '2020-07-07 21:31:13', '2020-07-07 21:31:13');
INSERT INTO `mall_order_item` VALUES ('34', '1594354161336', '12000', '24', '苹果手机测试商品', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '24.00', '1', '24.00', '2020-07-10 12:09:21', '2020-07-10 12:09:21');
INSERT INTO `mall_order_item` VALUES ('35', '1594378687613', '12000', '1', '三星手机爆炸牌电池', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '1999.00', '2', '3998.00', '2020-07-10 18:58:07', '2020-07-10 18:58:07');
INSERT INTO `mall_order_item` VALUES ('36', '1594561601965', '12000', '108', '海尔冰箱', '2328040c-1c80-436b-a8f8-451c437ccf5a.jpg', '1999.00', '1', '1999.00', '2020-07-12 21:46:41', '2020-07-12 21:46:41');
INSERT INTO `mall_order_item` VALUES ('37', '1594633481700', '12000', '2', '小米9手机', '77bb7ee5-b3da-4afb-95f5-293ef35e2588.jpg', '2999.00', '1', '2999.00', '2020-07-13 17:44:41', '2020-07-13 17:44:41');
INSERT INTO `mall_order_item` VALUES ('38', '1594633481700', '12000', '108', '海尔冰箱', '2328040c-1c80-436b-a8f8-451c437ccf5a.jpg', '1999.00', '3', '5997.00', '2020-07-13 17:44:41', '2020-07-13 17:44:41');
INSERT INTO `mall_order_item` VALUES ('39', '1594731356241', '12000', '1', '三星手机爆炸牌电池', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '1999.00', '1', '1999.00', '2020-07-14 20:55:56', '2020-07-14 20:55:56');
INSERT INTO `mall_order_item` VALUES ('40', '1594780837971', '12000', '1', '三星手机爆炸牌电池', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '1999.00', '5', '9995.00', '2020-07-15 10:40:37', '2020-07-15 10:40:37');
INSERT INTO `mall_order_item` VALUES ('41', '1594782690134', '12000', '111', '美的空调', '0aec78a0-cb92-4985-a5ff-420661f65313.jpg', '3000.00', '2', '6000.00', '2020-07-15 11:11:30', '2020-07-15 11:11:30');
INSERT INTO `mall_order_item` VALUES ('42', '1594795194373', '12000', '108', '海尔冰箱', '2328040c-1c80-436b-a8f8-451c437ccf5a.jpg', '1999.00', '1', '1999.00', '2020-07-15 14:39:54', '2020-07-15 14:39:54');
INSERT INTO `mall_order_item` VALUES ('43', '1596378994995', '24', '6', '小米10手机', 'a03f3004-8dcd-4a5b-8291-7e318016caec.jpg', '4500.00', '20', '90000.00', '2020-08-02 22:36:34', '2020-08-02 22:36:34');
INSERT INTO `mall_order_item` VALUES ('44', '1596770988533', '24', '114', '稀有亚总、Asuna、明日奈', 'ca7a0bee-6b16-4f10-87be-1d97cf0dec3e.jpg', '79999.00', '1', '79999.00', '2020-08-07 11:29:48', '2020-08-07 11:29:48');
INSERT INTO `mall_order_item` VALUES ('45', '1596969523191', '24', '12', '苹果手机测试商品电脑外设', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '12.00', '4', '48.00', '2020-08-09 18:38:43', '2020-08-09 18:38:43');
INSERT INTO `mall_order_item` VALUES ('46', '1596969627372', '24', '12', '苹果手机测试商品电脑外设', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '12.00', '1', '12.00', '2020-08-09 18:40:27', '2020-08-09 18:40:27');
INSERT INTO `mall_order_item` VALUES ('47', '1596969735512', '24', '1', '三星手机爆炸牌电池', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '1999.00', '5', '9995.00', '2020-08-09 18:42:15', '2020-08-09 18:42:15');
INSERT INTO `mall_order_item` VALUES ('48', '1596969745273', '24', '2', '小米9手机', '77bb7ee5-b3da-4afb-95f5-293ef35e2588.jpg', '2999.00', '3', '8997.00', '2020-08-09 18:42:25', '2020-08-09 18:42:25');
INSERT INTO `mall_order_item` VALUES ('49', '1596969756092', '24', '3', '华为mate40手机', '4eb655e6-697c-4cd2-9d3d-f43913dd74c3.jpg', '3000.00', '4', '12000.00', '2020-08-09 18:42:36', '2020-08-09 18:42:36');
INSERT INTO `mall_order_item` VALUES ('50', '1596969770699', '24', '4', '华为mate30手机', '5f5601c4-df2a-4951-b928-6a0108b95cf0.jpg', '2000.00', '3', '6000.00', '2020-08-09 18:42:50', '2020-08-09 18:42:50');
INSERT INTO `mall_order_item` VALUES ('51', '1596969770699', '24', '8', '苹果手机测试商品(游戏机)', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '8.00', '2', '16.00', '2020-08-09 18:42:50', '2020-08-09 18:42:50');
INSERT INTO `mall_order_item` VALUES ('52', '1596969824368', '24', '10', '苹果手机测试商品（网络设备）', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '10.00', '2', '20.00', '2020-08-09 18:43:44', '2020-08-09 18:43:44');
INSERT INTO `mall_order_item` VALUES ('53', '1596969869356', '24', '114', '稀有亚总、Asuna、明日奈', 'ca7a0bee-6b16-4f10-87be-1d97cf0dec3e.jpg', '79999.00', '1', '79999.00', '2020-08-09 18:44:29', '2020-08-09 18:44:29');
INSERT INTO `mall_order_item` VALUES ('54', '1596969890076', '24', '114', '稀有亚总、Asuna、明日奈', 'ca7a0bee-6b16-4f10-87be-1d97cf0dec3e.jpg', '79999.00', '1', '79999.00', '2020-08-09 18:44:50', '2020-08-09 18:44:50');
INSERT INTO `mall_order_item` VALUES ('55', '1596980076816', '24', '114', '稀有亚总、Asuna、明日奈', 'ca7a0bee-6b16-4f10-87be-1d97cf0dec3e.jpg', '79999.00', '1', '79999.00', '2020-08-09 21:34:36', '2020-08-09 21:34:36');
INSERT INTO `mall_order_item` VALUES ('56', '1597068586258', '24', '114', '稀有亚总、Asuna、明日奈', 'ca7a0bee-6b16-4f10-87be-1d97cf0dec3e.jpg', '79999.00', '1', '79999.00', '2020-08-10 22:09:46', '2020-08-10 22:09:46');
INSERT INTO `mall_order_item` VALUES ('57', '1597135424592', '24', '40', '苹果手机测试商品教辅资料', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '40.00', '2', '80.00', '2020-08-11 16:43:44', '2020-08-11 16:43:44');
INSERT INTO `mall_order_item` VALUES ('58', '1597137567713', '12001', '114', '稀有亚总、Asuna、明日奈', 'ca7a0bee-6b16-4f10-87be-1d97cf0dec3e.jpg', '79999.00', '0', '0.00', '2020-08-11 17:19:27', '2020-08-11 17:19:27');
INSERT INTO `mall_order_item` VALUES ('59', '1597137567713', '12001', '2', '小米9手机', '77bb7ee5-b3da-4afb-95f5-293ef35e2588.jpg', '2999.00', '1', '2999.00', '2020-08-11 17:19:27', '2020-08-11 17:19:27');
INSERT INTO `mall_order_item` VALUES ('60', '1597146367120', '24', '114', '稀有亚总、Asuna、明日奈', 'ca7a0bee-6b16-4f10-87be-1d97cf0dec3e.jpg', '79999.00', '1', '79999.00', '2020-08-11 19:46:07', '2020-08-11 19:46:07');
INSERT INTO `mall_order_item` VALUES ('61', '1599123073624', '24', '113', '月亮', 'ce9af46e-b2d5-4aba-a05f-402f5f7ab6dc.jpeg', '999999999.00', '1', '999999999.00', '2020-09-03 16:51:13', '2020-09-03 16:51:13');
INSERT INTO `mall_order_item` VALUES ('62', '1599123091877', '24', '36', '苹果手机测试商品首饰', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '36.00', '37', '1332.00', '2020-09-03 16:51:31', '2020-09-03 16:51:31');
INSERT INTO `mall_order_item` VALUES ('63', '1599573758010', '12004', '110', '海尔洗衣机', '4f5917fa-d805-426a-9b32-5c3ad7d0772a.jpg', '1996.00', '1', '1996.00', '2020-09-08 22:02:37', '2020-09-08 22:02:37');
INSERT INTO `mall_order_item` VALUES ('64', '1599573892245', '12004', '110', '海尔洗衣机', '4f5917fa-d805-426a-9b32-5c3ad7d0772a.jpg', '1996.00', '1', '1996.00', '2020-09-08 22:04:52', '2020-09-08 22:04:52');
INSERT INTO `mall_order_item` VALUES ('65', '1599574028777', '12004', '110', '海尔洗衣机', '4f5917fa-d805-426a-9b32-5c3ad7d0772a.jpg', '1996.00', '1', '1996.00', '2020-09-08 22:07:08', '2020-09-08 22:07:08');
INSERT INTO `mall_order_item` VALUES ('66', '1599786845980', '24', '2', '小米9手机', '77bb7ee5-b3da-4afb-95f5-293ef35e2588.jpg', '2999.00', '1', '2999.00', '2020-09-11 09:14:05', '2020-09-11 09:14:05');
INSERT INTO `mall_order_item` VALUES ('67', '1600150701736', '12005', '3', '华为mate40手机', '4eb655e6-697c-4cd2-9d3d-f43913dd74c3.jpg', '3000.00', '1', '3000.00', '2020-09-15 14:18:21', '2020-09-15 14:18:21');
INSERT INTO `mall_order_item` VALUES ('68', '1600250044938', '12001', '15', '苹果手机测试商品冰箱', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '15.00', '1', '15.00', '2020-09-16 17:54:04', '2020-09-16 17:54:04');
INSERT INTO `mall_order_item` VALUES ('69', '1600333945263', '24', '114', '稀有亚总', 'ca7a0bee-6b16-4f10-87be-1d97cf0dec3e.jpg', '79999.00', '1', '79999.00', '2020-09-17 17:12:25', '2020-09-17 17:12:25');
INSERT INTO `mall_order_item` VALUES ('70', '1600509059788', '24', '13', '苹果手机测试商品电视', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '13.00', '18', '234.00', '2020-09-19 17:50:59', '2020-09-19 17:50:59');

-- ----------------------------
-- Table structure for `mall_pay_info`
-- ----------------------------
DROP TABLE IF EXISTS `mall_pay_info`;
CREATE TABLE `mall_pay_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_no` bigint(20) DEFAULT NULL,
  `pay_playform` int(10) DEFAULT NULL,
  `platform_number` varchar(200) DEFAULT NULL,
  `platform_status` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_pay_info
-- ----------------------------
INSERT INTO `mall_pay_info` VALUES ('1', '24', '1591161620517', '1', '2020060322001453280504495717', 'WAIT_BUYER_PAY', '2020-06-03 13:20:34', '2020-06-03 13:20:34');
INSERT INTO `mall_pay_info` VALUES ('2', '24', '1591161620517', '1', '2020060322001453280504495717', 'TRADE_SUCCESS', '2020-06-03 13:20:43', '2020-06-03 13:20:43');
INSERT INTO `mall_pay_info` VALUES ('3', '24', '1591159652843', '1', '2020060322001453280504495976', 'WAIT_BUYER_PAY', '2020-06-03 13:26:48', '2020-06-03 13:26:48');
INSERT INTO `mall_pay_info` VALUES ('4', '24', '1591159652843', '1', '2020060322001453280504495976', 'TRADE_SUCCESS', '2020-06-03 13:27:06', '2020-06-03 13:27:06');
INSERT INTO `mall_pay_info` VALUES ('5', '24', '1591157923518', '1', '2020060322001453280504495573', 'WAIT_BUYER_PAY', '2020-06-03 13:45:21', '2020-06-03 13:45:21');
INSERT INTO `mall_pay_info` VALUES ('6', '24', '1591157923518', '1', '2020060322001453280504495573', 'TRADE_SUCCESS', '2020-06-03 13:45:31', '2020-06-03 13:45:31');
INSERT INTO `mall_pay_info` VALUES ('7', '24', '1591164652603', '1', '2020060322001453280504495857', 'WAIT_BUYER_PAY', '2020-06-03 14:11:02', '2020-06-03 14:11:02');
INSERT INTO `mall_pay_info` VALUES ('8', '24', '1591164652603', '1', '2020060322001453280504495857', 'TRADE_SUCCESS', '2020-06-03 14:11:19', '2020-06-03 14:11:19');
INSERT INTO `mall_pay_info` VALUES ('9', '21', '1591189119363', '1', '2020060322001453280504496104', 'WAIT_BUYER_PAY', '2020-06-03 20:58:48', '2020-06-03 20:58:48');
INSERT INTO `mall_pay_info` VALUES ('10', '21', '1591189119363', '1', '2020060322001453280504496104', 'TRADE_SUCCESS', '2020-06-03 20:58:58', '2020-06-03 20:58:58');
INSERT INTO `mall_pay_info` VALUES ('11', '24', '1591612521926', '1', '2020060822001453280504498525', 'WAIT_BUYER_PAY', '2020-06-08 18:35:32', '2020-06-08 18:35:32');
INSERT INTO `mall_pay_info` VALUES ('12', '24', '1591612521926', '1', '2020060822001453280504498525', 'TRADE_SUCCESS', '2020-06-08 18:35:49', '2020-06-08 18:35:49');
INSERT INTO `mall_pay_info` VALUES ('13', '24', '1591154853824', '1', '2020061222001453280504501633', 'WAIT_BUYER_PAY', '2020-06-12 16:20:01', '2020-06-12 16:20:01');
INSERT INTO `mall_pay_info` VALUES ('14', '24', '1591154853824', '1', '2020061222001453280504501633', 'TRADE_SUCCESS', '2020-06-12 16:20:19', '2020-06-12 16:20:19');
INSERT INTO `mall_pay_info` VALUES ('15', '24', '1592051623596', '1', '2020061322001453280504502524', 'WAIT_BUYER_PAY', '2020-06-13 20:34:25', '2020-06-13 20:34:25');
INSERT INTO `mall_pay_info` VALUES ('16', '24', '1592051623596', '1', '2020061322001453280504502524', 'TRADE_SUCCESS', '2020-06-13 20:34:35', '2020-06-13 20:34:35');
INSERT INTO `mall_pay_info` VALUES ('17', '24', '1592130208031', '1', '2020061422001453280504502866', 'WAIT_BUYER_PAY', '2020-06-14 18:23:41', '2020-06-14 18:23:41');
INSERT INTO `mall_pay_info` VALUES ('18', '24', '1592130208031', '1', '2020061422001453280504502866', 'TRADE_SUCCESS', '2020-06-14 18:23:50', '2020-06-14 18:23:50');
INSERT INTO `mall_pay_info` VALUES ('19', '24', '1592813254521', '1', '2020062222001453280504507926', 'WAIT_BUYER_PAY', '2020-06-22 16:07:47', '2020-06-22 16:07:47');
INSERT INTO `mall_pay_info` VALUES ('20', '24', '1592813254521', '1', '2020062222001453280504507926', 'TRADE_SUCCESS', '2020-06-22 16:07:59', '2020-06-22 16:07:59');
INSERT INTO `mall_pay_info` VALUES ('21', '24', '1592908112572', '1', '2020062322001453280504508149', 'WAIT_BUYER_PAY', '2020-06-23 18:28:45', '2020-06-23 18:28:45');
INSERT INTO `mall_pay_info` VALUES ('22', '24', '1592908112572', '1', '2020062322001453280504508149', 'TRADE_SUCCESS', '2020-06-23 18:29:01', '2020-06-23 18:29:01');
INSERT INTO `mall_pay_info` VALUES ('23', '12000', '1594128673621', '1', '2020070722001468000505537294', 'WAIT_BUYER_PAY', '2020-07-07 21:31:21', '2020-07-07 21:31:21');
INSERT INTO `mall_pay_info` VALUES ('24', '12000', '1594128673621', '1', '2020070722001468000505537294', 'TRADE_SUCCESS', '2020-07-07 21:31:51', '2020-07-07 21:31:51');
INSERT INTO `mall_pay_info` VALUES ('25', '12000', '1594119160756', '1', '2020071022001468000505556654', 'WAIT_BUYER_PAY', '2020-07-10 12:11:14', '2020-07-10 12:11:14');
INSERT INTO `mall_pay_info` VALUES ('26', '12000', '1594119160756', '1', '2020071022001468000505556654', 'TRADE_SUCCESS', '2020-07-10 12:12:26', '2020-07-10 12:12:26');
INSERT INTO `mall_pay_info` VALUES ('27', '12000', '1594633481700', '1', '2020071322001468000505570230', 'WAIT_BUYER_PAY', '2020-07-13 17:58:38', '2020-07-13 17:58:38');
INSERT INTO `mall_pay_info` VALUES ('28', '12000', '1594633481700', '1', '2020071322001468000505570230', 'TRADE_SUCCESS', '2020-07-13 17:58:47', '2020-07-13 17:58:47');
INSERT INTO `mall_pay_info` VALUES ('29', '12000', '1594731356241', '1', '2020071422001468000505574304', 'WAIT_BUYER_PAY', '2020-07-14 20:56:12', '2020-07-14 20:56:12');
INSERT INTO `mall_pay_info` VALUES ('30', '12000', '1594731356241', '1', '2020071422001468000505574304', 'TRADE_SUCCESS', '2020-07-14 20:56:26', '2020-07-14 20:56:26');
INSERT INTO `mall_pay_info` VALUES ('31', '12000', '1594782690134', '1', '2020071522001468000505575804', 'WAIT_BUYER_PAY', '2020-07-15 11:11:50', '2020-07-15 11:11:50');
INSERT INTO `mall_pay_info` VALUES ('32', '24', '1596378994995', '1', '2020080222001453280504534125', 'WAIT_BUYER_PAY', '2020-08-02 22:36:50', '2020-08-02 22:36:50');
INSERT INTO `mall_pay_info` VALUES ('33', '24', '1596378994995', '1', '2020080222001453280504534125', 'TRADE_SUCCESS', '2020-08-02 22:37:08', '2020-08-02 22:37:08');
INSERT INTO `mall_pay_info` VALUES ('34', '24', '1596969523191', '1', '2020080922001453280504538784', 'WAIT_BUYER_PAY', '2020-08-09 18:38:57', '2020-08-09 18:38:57');
INSERT INTO `mall_pay_info` VALUES ('35', '24', '1596969523191', '1', '2020080922001453280504538784', 'TRADE_SUCCESS', '2020-08-09 18:39:06', '2020-08-09 18:39:06');
INSERT INTO `mall_pay_info` VALUES ('36', '24', '1597135424592', '1', '2020081122001453280504539792', 'WAIT_BUYER_PAY', '2020-08-11 16:44:04', '2020-08-11 16:44:04');
INSERT INTO `mall_pay_info` VALUES ('37', '24', '1597135424592', '1', '2020081122001453280504539792', 'TRADE_SUCCESS', '2020-08-11 16:44:25', '2020-08-11 16:44:25');
INSERT INTO `mall_pay_info` VALUES ('38', '24', '1597146367120', '1', '2020081122001453280504539697', 'WAIT_BUYER_PAY', '2020-08-11 19:46:35', '2020-08-11 19:46:35');
INSERT INTO `mall_pay_info` VALUES ('39', '24', '1597146367120', '1', '2020081122001453280504539697', 'TRADE_SUCCESS', '2020-08-11 19:46:39', '2020-08-11 19:46:39');
INSERT INTO `mall_pay_info` VALUES ('40', '24', '1599123091877', '1', '2020090322001453280504953796', 'WAIT_BUYER_PAY', '2020-09-03 16:52:19', '2020-09-03 16:52:19');
INSERT INTO `mall_pay_info` VALUES ('41', '24', '1599123091877', '1', '2020090322001453280504953796', 'TRADE_SUCCESS', '2020-09-03 16:52:28', '2020-09-03 16:52:28');
INSERT INTO `mall_pay_info` VALUES ('42', '12004', '1599573892245', '1', '2020090822001423010500698950', 'WAIT_BUYER_PAY', '2020-09-08 22:05:56', '2020-09-08 22:05:56');
INSERT INTO `mall_pay_info` VALUES ('43', '12004', '1599573892245', '1', '2020090822001423010500698950', 'TRADE_SUCCESS', '2020-09-08 22:06:25', '2020-09-08 22:06:25');
INSERT INTO `mall_pay_info` VALUES ('44', '12004', '1599574028777', '1', '2020090822001423010500700672', 'WAIT_BUYER_PAY', '2020-09-08 22:07:18', '2020-09-08 22:07:18');
INSERT INTO `mall_pay_info` VALUES ('45', '12004', '1599574028777', '1', '2020090822001423010500700672', 'TRADE_SUCCESS', '2020-09-08 22:07:30', '2020-09-08 22:07:30');
INSERT INTO `mall_pay_info` VALUES ('46', '12005', '1600150701736', '1', '2020091522001494550500809517', 'WAIT_BUYER_PAY', '2020-09-15 14:18:42', '2020-09-15 14:18:42');
INSERT INTO `mall_pay_info` VALUES ('47', '12005', '1600150701736', '1', '2020091522001494550500809517', 'TRADE_SUCCESS', '2020-09-15 14:18:57', '2020-09-15 14:18:57');
INSERT INTO `mall_pay_info` VALUES ('48', '24', '1600333945263', '1', '2020091722001453280505284571', 'WAIT_BUYER_PAY', '2020-09-17 17:12:58', '2020-09-17 17:12:58');
INSERT INTO `mall_pay_info` VALUES ('49', '24', '1600333945263', '1', '2020091722001453280505284571', 'TRADE_SUCCESS', '2020-09-17 17:13:10', '2020-09-17 17:13:10');
INSERT INTO `mall_pay_info` VALUES ('50', '24', '1600509059788', '1', '2020091922001453280505333729', 'WAIT_BUYER_PAY', '2020-09-19 17:53:55', '2020-09-19 17:53:55');
INSERT INTO `mall_pay_info` VALUES ('51', '24', '1600509059788', '1', '2020091922001453280505333729', 'TRADE_SUCCESS', '2020-09-19 17:54:06', '2020-09-19 17:54:06');

-- ----------------------------
-- Table structure for `mall_product`
-- ----------------------------
DROP TABLE IF EXISTS `mall_product`;
CREATE TABLE `mall_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `subtitle` varchar(200) DEFAULT NULL,
  `main_image` varchar(500) DEFAULT NULL,
  `sub_images` text,
  `detail` text,
  `price` decimal(20,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `status` int(6) DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_product
-- ----------------------------
INSERT INTO `mall_product` VALUES ('1', '100012', '三星手机爆炸牌电池', '三星小促销', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" src=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '3999.00', '99999', '1', null, '2020-09-12 15:49:29');
INSERT INTO `mall_product` VALUES ('2', '100012', '小米9手机', '小米大促销', '77bb7ee5-b3da-4afb-95f5-293ef35e2588.jpg', '77bb7ee5-b3da-4afb-95f5-293ef35e2588.jpg,827692bb-0c2c-4d71-a6a4-ca4bd2d27fc7.jpg,c439471d-5f40-4888-822d-5951d87e7077.jpg,0013f34b-7a70-45ca-b372-96e8dce5c5cb.jpg', '<p>非常优秀的手机</p><p><img alt=\"15.jpg\" src=\"http://img.guangping.store/a6ac19a3-ea19-4a3d-885c-49e872668747.jpg\" width=\"790\" height=\"1444\"><br></p>', '2999.00', '1999', '1', null, '2020-09-17 17:00:59');
INSERT INTO `mall_product` VALUES ('3', '100012', '华为mate40手机', '大降价', '4eb655e6-697c-4cd2-9d3d-f43913dd74c3.jpg', '4eb655e6-697c-4cd2-9d3d-f43913dd74c3.jpg,c6a55616-d07e-47b2-8f92-cf9f4dbc1573.jpg,0dfb9ff1-9678-4171-812d-83c82bdca003.jpg,6033232b-1f20-43e0-ae17-f90487786d1d.jpg', '<p>华为mate40</p><p><img alt=\"14.jpg\" src=\"http://img.guangping.store/824d8628-2f6f-4478-b849-132dfa773893.jpg\" width=\"790\" height=\"1444\"><br></p>', '3000.00', '2988', '1', null, '2020-09-17 17:01:09');
INSERT INTO `mall_product` VALUES ('4', '100012', '华为mate30手机', '跳楼大降价，只此一会', '5f5601c4-df2a-4951-b928-6a0108b95cf0.jpg', '5f5601c4-df2a-4951-b928-6a0108b95cf0.jpg,03ad6d5b-66b3-46ac-a926-edfe43062ce7.jpg,c50c58e9-d3a4-48e2-94c8-8683d62a25bd.jpg', '<p>华为mate30</p><p><img alt=\"14.jpg\" src=\"http://img.guangping.store/4ab6c261-5231-4672-b822-7b73ebe8e81d.jpg\" width=\"790\" height=\"1444\"><br></p>', '2000.00', '2998', '1', null, '2020-09-17 17:01:20');
INSERT INTO `mall_product` VALUES ('5', '100009', '美的冰箱xb30', '家电下乡', '21d749ee-5326-445a-97cb-b9ca3396384a.jpg', '21d749ee-5326-445a-97cb-b9ca3396384a.jpg,b045fafb-e0ac-4e10-b53d-9d6af8a8a01d.jpg', '<p>确实我是手机，2333</p><p><img alt=\"12.jpg\" src=\"http://img.guangping.store/aaaeb3a9-1d08-4c67-b831-b6a7f939131f.jpg\" width=\"790\" height=\"1444\"><br></p>', '1500.00', '4988', '1', null, '2020-06-22 17:40:49');
INSERT INTO `mall_product` VALUES ('6', '100034', '小米10手机', '小米大促销', 'a03f3004-8dcd-4a5b-8291-7e318016caec.jpg', 'a03f3004-8dcd-4a5b-8291-7e318016caec.jpg,688b8d52-ca73-4a78-ba21-2934171dd40d.jpg,90e161ec-4bb8-4ae8-94f4-c328bbe800f9.jpg,59968296-47b8-43b0-8a3f-1d8663c895c9.jpg', '<p>小米10</p><p><img alt=\"11.jpg\" src=\"http://img.guangping.store/ad55992a-af90-40d6-a855-28e0f89c83e6.jpg\" width=\"790\" height=\"1443\"><img alt=\"12.jpg\" src=\"http://img.guangping.store/e6aca8be-d8cf-43ff-877b-90b0c3ae11b9.jpg\" width=\"790\" height=\"1444\"><br></p>', '4500.00', '80', '1', null, '2020-08-02 22:36:34');
INSERT INTO `mall_product` VALUES ('7', '100010', '松鼠数码', '次时代最牛逼的数码产品', '686a1320-2b20-4004-87c8-e57280e0d746.jpg', '686a1320-2b20-4004-87c8-e57280e0d746.jpg,bac63cca-3709-4bb3-92bb-1cc36e69d4ca.jpg,3fae0ff9-2c1f-4419-bb69-65f7c096f918.jpg,f3bf50ca-03bd-4673-afe7-f2a98c8455e2.jpg', '<p>松鼠数码，值得信赖的产品</p><p><img alt=\"11.jpg\" src=\"http://img.guangping.store/19e07223-18c4-461a-b9e0-fa6a4af8058e.jpg\" width=\"790\" height=\"1443\"><br></p>', '996.00', '996', '1', null, '2020-06-21 21:49:25');
INSERT INTO `mall_product` VALUES ('8', '100034', '苹果手机测试商品(游戏机)', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" src=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '8.00', '94', '1', null, '2020-08-09 18:42:50');
INSERT INTO `mall_product` VALUES ('9', '100012', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" src=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '9.00', '94', '2', null, '2020-08-12 10:36:33');
INSERT INTO `mall_product` VALUES ('10', '100035', '苹果手机测试商品（网络设备）', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" src=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '10.00', '94', '1', null, '2020-08-09 18:43:44');
INSERT INTO `mall_product` VALUES ('11', '100021', '苹果手机测试商品办公配件', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '11.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('12', '100021', '苹果手机测试商品电脑外设', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '12.00', '90', '1', '2020-06-22 18:03:54', '2020-08-09 18:40:27');
INSERT INTO `mall_product` VALUES ('13', '100021', '苹果手机测试商品电视', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '13.00', '76', '1', '2020-06-22 18:03:54', '2020-09-19 17:50:59');
INSERT INTO `mall_product` VALUES ('14', '100030', '苹果手机测试商品空调', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '14.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('15', '100030', '苹果手机测试商品冰箱', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '15.00', '94', '1', '2020-06-22 18:03:54', '2020-09-16 17:54:04');
INSERT INTO `mall_product` VALUES ('16', '100030', '苹果手机测试商品洗衣机', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '16.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('17', '100030', '苹果手机测试商品吸油烟机', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '17.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('18', '100030', '苹果手机测试商品洗碗机', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '18.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('19', '100030', '苹果手机测试商品净水器', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '19.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('20', '100021', '苹果手机测试商品沙发', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '20.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('21', '100021', '苹果手机测试商品桌椅', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '21.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('22', '100021', '苹果手机测试商品衣柜', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '22.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('23', '100021', '苹果手机测试商品电脑桌', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '23.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('24', '100021', '苹果手机测试商品厨卫家电', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '24.00', '93', '1', '2020-06-22 18:03:54', '2020-07-10 12:09:21');
INSERT INTO `mall_product` VALUES ('25', '100021', '苹果手机测试商品小家电', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '25.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('26', '100016', '苹果手机测试商品加湿器', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '26.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('27', '100016', '苹果手机测试商品个护化妆', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '27.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('28', '100016', '苹果手机测试商品清洁用品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '28.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('29', '100016', '苹果手机测试商品纸品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '29.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('30', '100016', '苹果手机测试商品母婴用品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '30.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('31', '100016', '苹果手机测试商品儿童玩具', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '31.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('32', '100001', '苹果手机测试商品童装童鞋', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '32.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('33', '100001', '苹果手机测试商品鞋靴', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '33.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('34', '100001', '苹果手机测试商品箱包', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '34.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('35', '100001', '苹果手机测试商品钟表', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '35.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('36', '100001', '苹果手机测试商品首饰', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '36.00', '57', '1', '2020-06-22 18:03:54', '2020-09-03 16:51:31');
INSERT INTO `mall_product` VALUES ('37', '100001', '苹果手机测试商品图书', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '37.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('38', '100001', '苹果手机测试商品影音', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '38.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('39', '100011', '苹果手机测试商品文具', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '39.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('40', '100011', '苹果手机测试商品教辅资料', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '40.00', '92', '1', '2020-06-22 18:03:54', '2020-08-11 16:43:44');
INSERT INTO `mall_product` VALUES ('41', '100017', '苹果手机测试商品电脑', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" src=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '41.00', '94', '1', null, '2020-08-07 15:17:47');
INSERT INTO `mall_product` VALUES ('42', '100018', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '42.00', '94', '2', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('43', '100019', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '43.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('44', '100020', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '44.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('45', '100016', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '45.00', '94', '2', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('46', '100012', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '46.00', '94', '2', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('47', '100013', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '47.00', '94', '2', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('48', '100014', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '48.00', '94', '2', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('49', '100015', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '49.00', '94', '2', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('50', '100002', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '50.00', '94', '2', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('51', '100003', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '51.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('52', '100004', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '52.00', '94', '2', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('53', '100005', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '53.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('54', '100006', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '54.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('55', '100007', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '55.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('56', '100008', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '56.00', '94', '2', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('57', '100009', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '57.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('58', '100010', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '58.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('59', '100011', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '59.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('60', '100012', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '60.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('61', '100013', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '61.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('62', '100014', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '62.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('63', '100015', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '63.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('64', '100016', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '64.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('65', '100017', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '65.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('66', '100018', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '66.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('67', '100019', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '67.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('68', '100020', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '68.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('69', '100021', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '69.00', '94', '2', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('70', '100022', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '70.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('71', '100023', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '71.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('72', '100024', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '72.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('73', '100025', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '73.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('74', '100026', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '74.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('75', '100027', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '75.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('76', '100028', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '76.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('77', '100029', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '77.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('78', '100030', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '78.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('79', '100031', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '79.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('80', '100032', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '80.00', '94', '1', '2020-06-22 18:03:54', '2020-06-22 18:03:54');
INSERT INTO `mall_product` VALUES ('81', '100033', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '81.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('82', '100034', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '82.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('83', '100035', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '83.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('84', '100021', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '84.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('85', '100022', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '85.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('86', '100023', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '86.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('87', '100024', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '87.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('88', '100025', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '88.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('89', '100021', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '89.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('90', '100021', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '90.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('91', '100021', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '91.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('92', '100022', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '92.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('93', '100022', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '93.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('94', '100022', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '94.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('95', '100023', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '95.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('96', '100023', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '96.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('97', '100023', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '97.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('98', '100023', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '98.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('99', '100007', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '99.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('100', '100007', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '100.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('101', '100009', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '101.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('102', '100009', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '102.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('103', '100008', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '103.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('104', '100008', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '104.00', '94', '2', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('105', '100006', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '105.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('106', '100006', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '106.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('107', '100006', '苹果手机测试商品', '跳楼大降价', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,\r\n5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', '<p>很秀的一款手机</p><p><img alt=\"15.jpg\" \r\nsrc=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', '107.00', '94', '1', '2020-06-22 18:03:55', '2020-06-22 18:03:55');
INSERT INTO `mall_product` VALUES ('108', '100006', '海尔冰箱', '家电下乡，全村降价', '2328040c-1c80-436b-a8f8-451c437ccf5a.jpg', '2328040c-1c80-436b-a8f8-451c437ccf5a.jpg,1da5b075-05b0-412b-8361-126383071b5a.jpg,122ac5bc-c6e7-49e6-b38c-094649fe8c60.jpg', '<p>我是冰箱</p><p><img alt=\"14.jpg\" src=\"http://img.guangping.store/7f5e4b20-bb41-4e44-b4b1-26d8cabaf6ad.jpg\" width=\"790\" height=\"1444\"><br></p>', '1999.00', '993', '1', '2020-06-22 18:17:13', '2020-07-15 14:39:54');
INSERT INTO `mall_product` VALUES ('109', '100007', '液晶电视', '27寸超大屏幕', '197c6815-0ea8-4e8f-a8c0-eee7e865b3a1.jpg', '197c6815-0ea8-4e8f-a8c0-eee7e865b3a1.jpg,93322e15-e8f7-44f6-b5fe-2989e05c0505.jpg,f7f821c7-0461-4979-938f-3327e9998a47.jpg', '<p>我是电视</p><p><img alt=\"15.jpg\" src=\"http://img.guangping.store/994d19ce-87b6-418f-bc8d-47a245378e21.jpg\" width=\"790\" height=\"1444\"><br></p>', '966.00', '1555', '1', '2020-06-22 18:18:10', '2020-06-22 18:18:10');
INSERT INTO `mall_product` VALUES ('110', '100008', '海尔洗衣机', '我是洗衣机', '4f5917fa-d805-426a-9b32-5c3ad7d0772a.jpg', '4f5917fa-d805-426a-9b32-5c3ad7d0772a.jpg,b60d8509-33a6-4e26-801d-e1bb12f2ca7d.jpg,40283ba5-66e6-4960-8c08-034f30160c68.jpg', '<p>我是洗衣机</p><p><img alt=\"16.jpg\" src=\"http://img.guangping.store/79882333-1cef-45f4-883d-9504f45f77dc.jpg\" width=\"790\" height=\"1443\"><br></p>', '1996.00', '1232', '1', '2020-06-22 18:19:56', '2020-09-08 22:07:08');
INSERT INTO `mall_product` VALUES ('111', '100009', '美的空调', '是美帝空调呀', '0aec78a0-cb92-4985-a5ff-420661f65313.jpg', '0aec78a0-cb92-4985-a5ff-420661f65313.jpg,5b5e1edd-b8f1-4346-a666-a5b0f91be882.jpg', '<p>我是空调</p><p><img alt=\"11.jpg\" src=\"http://img.guangping.store/7b220c55-f5a7-4560-98f4-e4af0e379674.jpg\" width=\"790\" height=\"1443\"><br></p>', '3000.00', '666', '1', '2020-06-22 18:20:44', '2020-07-15 11:11:30');
INSERT INTO `mall_product` VALUES ('112', '100010', '海尔热水器', '我是热水器', '28e9d686-b8dd-4af8-8e71-d692d2578d3f.jpg', '28e9d686-b8dd-4af8-8e71-d692d2578d3f.jpg,411bf8c3-a642-4ad9-bf95-6e675e414188.jpg', '<p>我是热水器啦</p><p><img alt=\"16.jpg\" src=\"http://img.guangping.store/04a2bc66-cb1b-4e9e-88ae-6588c6e3344e.jpg\" width=\"790\" height=\"1443\"><br></p>', '3000.00', '50', '1', '2020-06-22 18:21:30', '2020-06-22 18:21:30');
INSERT INTO `mall_product` VALUES ('113', '100003', '月亮', '一种不可多得的物件', 'ce9af46e-b2d5-4aba-a05f-402f5f7ab6dc.jpeg', 'ce9af46e-b2d5-4aba-a05f-402f5f7ab6dc.jpeg', '', '999999999.00', '1', '1', null, '2020-09-03 16:51:13');
INSERT INTO `mall_product` VALUES ('114', '100037', '稀有亚总', '前排出售', 'ca7a0bee-6b16-4f10-87be-1d97cf0dec3e.jpg', 'ca7a0bee-6b16-4f10-87be-1d97cf0dec3e.jpg,22d26210-cea1-4dd3-8933-a2748470479b.jpg,bfee9527-3c31-41b2-93ba-69d0d266e653.jpg,926a9c15-61c2-43d4-a139-f73402584035.jpg,fd63c130-4de2-4f7b-b13c-f950ff7975d9.jpg', '<p>给我最喜欢的亚总，btw，桐人是渣男。</p><p><img alt=\"22-1F21Z00I02H.png\" src=\"http://img.guangping.store/1dc3c68a-a935-4388-a43b-8f29cad7fe34.png\" width=\"1131\" height=\"800\" style=\"\"><img alt=\"22-1F21Z00SIU.jpg\" src=\"http://img.guangping.store/3372b78c-e6ac-4773-b497-b790447f9638.jpg\" width=\"1000\" height=\"708\" style=\"\"><img alt=\"Asuna-Yuuki-desktopsky-32589.jpg\" src=\"http://img.guangping.store/78af05ac-b744-494b-ae22-fc01fa7b256a.jpg\" width=\"1920\" height=\"1080\" style=\"\"><img alt=\"ROAME.NET.PIC.181074.20140815.100001.0003.jpg\" src=\"http://img.guangping.store/83fed7b4-3887-47eb-ac89-9a53d3158431.jpg\" width=\"1091\" height=\"1402\"><img alt=\"ROAME.NET.PIC.181074.20140815.100001.0006.jpg\" src=\"http://img.guangping.store/31eef824-e092-4c93-974f-1734022d1540.jpg\" width=\"899\" height=\"1200\"></p><p><img alt=\"ROAME.NET.PIC.181074.20140815.103800.0002.jpg\" src=\"http://img.guangping.store/d4f9558f-e50f-4ef7-b0fa-1776e011977f.jpg\" width=\"1003\" height=\"1248\"><br></p>', '79999.00', '0', '1', null, '2020-09-17 17:12:25');

-- ----------------------------
-- Table structure for `mall_shipping`
-- ----------------------------
DROP TABLE IF EXISTS `mall_shipping`;
CREATE TABLE `mall_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `receiver_name` varchar(20) DEFAULT NULL,
  `receiver_phone` varchar(20) DEFAULT NULL,
  `receiver_mobile` varchar(20) DEFAULT NULL,
  `receiver_province` varchar(20) DEFAULT NULL,
  `receiver_city` varchar(20) DEFAULT NULL,
  `receiver_district` varchar(20) DEFAULT NULL,
  `receiver_address` varchar(20) DEFAULT NULL,
  `receiver_zip` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_shipping
-- ----------------------------
INSERT INTO `mall_shipping` VALUES ('1', '24', '宋书航', '18774970814', '', '广东省', '东莞', null, '梅溪湖十字路口', '100000', null, '2020-05-25 09:40:41');
INSERT INTO `mall_shipping` VALUES ('3', '24', '阿十六', '18374199025', null, '江西省', '鹰潭', null, '坡子街17号路口', '100000', null, '2020-08-10 14:30:18');
INSERT INTO `mall_shipping` VALUES ('6', '24', '亚索', '19811112222', '', '台湾省', '高雄', null, '旧金山中山路口', '', null, '2020-05-25 09:42:10');
INSERT INTO `mall_shipping` VALUES ('7', '24', '豆豆', '18774970814', '', '广东省', '深圳', null, '深圳大学1号', '425600', '2020-05-24 19:15:40', '2020-05-24 19:15:40');
INSERT INTO `mall_shipping` VALUES ('8', '24', '永恩', '18774970814', null, '湖南省', '永州', null, '松鼠航家', '', null, '2020-09-11 09:25:17');
INSERT INTO `mall_shipping` VALUES ('9', '21', '宋书航', '18774970814', null, '广东省', '东莞', null, '梅溪湖十字路口', '100000', '2020-06-03 20:57:35', '2020-06-03 20:57:35');
INSERT INTO `mall_shipping` VALUES ('10', '21', '宋', '18774970814', null, '湖南省', '长沙', null, '雨花区', '425600', '2020-06-03 20:57:41', '2020-06-03 20:57:41');
INSERT INTO `mall_shipping` VALUES ('12', '21', '阿十六', '18374199025', null, '香港', '九龙', null, '坡子街17号路口', '100000', '2020-06-03 20:58:08', '2020-06-03 20:58:08');
INSERT INTO `mall_shipping` VALUES ('13', '21', '十六', '18774970814', null, '台湾省', '云林', null, '雨花区', '425600', '2020-06-03 20:58:33', '2020-06-03 20:58:33');
INSERT INTO `mall_shipping` VALUES ('14', '24', '艾克', '18774970825', null, '香港', '新界', null, '祖安大道', '', null, '2020-08-10 14:30:36');
INSERT INTO `mall_shipping` VALUES ('17', '12000', 'xxx', '18345097265', null, '广东省', '珠海', null, 'weq2342', 'qwaeqwe', '2020-07-12 18:41:23', '2020-07-12 18:41:23');
INSERT INTO `mall_shipping` VALUES ('18', '12000', '1233', '18345097265', null, '北京', '通州', null, '124312', '1234124', '2020-07-13 11:06:14', '2020-07-13 11:06:14');
INSERT INTO `mall_shipping` VALUES ('19', '24', '结城明日奈', '18774970814', null, '湖南省', '长沙', null, '雨花区香樟路北冲水库', '425600', null, '2020-09-19 17:50:48');
INSERT INTO `mall_shipping` VALUES ('20', '12001', '永恩', '18774970814', null, '湖南省', '长沙', null, '雨花区', '425600', null, '2020-08-11 17:19:23');
INSERT INTO `mall_shipping` VALUES ('21', '12004', '123456', '13345678912', null, '上海', '黄浦', null, '12345', '12312', '2020-09-08 22:02:32', '2020-09-08 22:02:32');
INSERT INTO `mall_shipping` VALUES ('22', '12005', '123', '18113594239', null, '北京', '东城', null, '123', '425600', '2020-09-15 14:18:16', '2020-09-15 14:18:16');

-- ----------------------------
-- Table structure for `mall_user`
-- ----------------------------
DROP TABLE IF EXISTS `mall_user`;
CREATE TABLE `mall_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL,
  `role` int(4) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_unique` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12006 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_user
-- ----------------------------
INSERT INTO `mall_user` VALUES ('21', 'username', 'DB685E3BE421CE222B8F773B87126746', 'test@163.com', '18774970814', '你多大', '18', '0', '2020-04-09 21:52:27', '2020-06-03 20:54:02');
INSERT INTO `mall_user` VALUES ('24', 'songshu', 'DB685E3BE421CE222B8F773B87126746', '0120@163.com', '18774970814', '你多大？', '18', '1', '2020-05-27 12:59:12', '2020-08-14 11:31:24');
INSERT INTO `mall_user` VALUES ('25', '江昭鹏', '73C3695CF13B17C8C834E2F76B4B5BC4', '1390932736@qq.com', '15096137470', '哈哈', '不要打哈哈', '0', '2020-06-02 12:32:49', '2020-06-02 12:32:49');
INSERT INTO `mall_user` VALUES ('26', '1', '3D8AAD8BF59FF18A2CE1F9F24CF4A592', '984023894@qq.com', '13297327215', '1', '1', '0', '2020-06-05 11:54:37', '2020-06-05 11:54:37');
INSERT INTO `mall_user` VALUES ('27', 'admin', '4EC90C45452BB8EA2B6709EF63292567', '123213@email.com', '18373377227', 'ggggg', 'aaaaa', '0', '2020-06-05 12:42:18', '2020-06-05 12:42:18');
INSERT INTO `mall_user` VALUES ('28', '测试用户', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('29', '测试用户2', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('30', '测试用户3', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('31', '测试用户4', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('32', '测试用户5', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('33', '测试用户6', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('34', '测试用户7', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('35', '测试用户8', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('36', '测试用户9', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('37', '测试用户10', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('38', '测试用户11', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('39', '测试用户12', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('40', '测试用户13', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('41', '测试用户14', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('42', '测试用户15', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('43', '测试用户16', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('44', '测试用户1', '123456', 'admin@happymmall.com', '13800138000', '问题', '答案', '1', '2016-11-06 16:56:45', '2017-04-04 19:27:36');
INSERT INTO `mall_user` VALUES ('1999', 'SongShuHang1999', '123456', 'Java0120@163.com', '1874970814', '世界最帅是谁', '松鼠航', '0', '2020-06-14 18:15:04', '2020-06-14 18:15:04');
INSERT INTO `mall_user` VALUES ('11999', '我是大帅哥', 'DB685E3BE421CE222B8F773B87126746', '192@163.com', '18774970814', '嘻嘻嘻', '嘻嘻嘻', '0', '2020-06-14 18:26:31', '2020-06-14 18:26:31');
INSERT INTO `mall_user` VALUES ('12000', 'Brunce', 'DB685E3BE421CE222B8F773B87126746', '67464668@126.com', '18345097266', 'hi', 'hello', '0', '2020-07-07 18:51:11', '2020-07-11 15:48:29');
INSERT INTO `mall_user` VALUES ('12001', '最爱Asuna', 'DB685E3BE421CE222B8F773B87126746', 'java01210@163.com', '18774970814', 'Asuna本名', '结城明日奈', '0', '2020-08-09 18:48:32', '2020-08-09 18:48:32');
INSERT INTO `mall_user` VALUES ('12002', 'asd', '1AD2E9D285416CD351C30843958DE468', 'asd@qq.com', '16478945231', 'asd', 'asd', '0', '2020-08-16 00:43:32', '2020-08-16 00:43:32');
INSERT INTO `mall_user` VALUES ('12003', '龙儿', 'DB685E3BE421CE222B8F773B87126746', '222f1d6a1@163.com', '17742614394', 'longping', '123', '0', '2020-09-08 21:25:57', '2020-09-08 21:25:57');
INSERT INTO `mall_user` VALUES ('12004', '123456', 'DB685E3BE421CE222B8F773B87126746', '123456789@qq.com', '13355557777', '123', '123', '0', '2020-09-08 22:01:40', '2020-09-08 22:01:40');
INSERT INTO `mall_user` VALUES ('12005', 'root', 'DB685E3BE421CE222B8F773B87126746', '12345678@qq.com', '18112312595', '123456', '123456', '0', '2020-09-15 14:17:23', '2020-09-15 14:17:23');

-- ----------------------------
-- Procedure structure for `BatchInsert`
-- ----------------------------
DROP PROCEDURE IF EXISTS `BatchInsert`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `BatchInsert`(IN init INT, IN loop_time INT)
BEGIN
      DECLARE Var INT;
      DECLARE ID INT;
      SET Var = 0;
      SET ID = init;
      WHILE Var < loop_time DO
          insert into mall_user(id, username, password, email, phone, question, answer, role,create_time,update_time) 
					values (ID, CONCAT('SongShuHang', ID), '123456', 'Java0120@163.com', '1874970814', '世界最帅是谁', '松鼠航', '0', Now(), NOW());
          SET ID = ID + 1;
          SET Var = Var + 1;
      END WHILE;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `BatchInsert2`
-- ----------------------------
DROP PROCEDURE IF EXISTS `BatchInsert2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `BatchInsert2`(IN init INT, IN loop_time INT)
BEGIN
      DECLARE Var INT;
      DECLARE ID INT;
      SET Var = 0;
      SET ID = init;
      WHILE Var < loop_time DO
          INSERT INTO `mall_product` 
VALUES (ID, '10002', '苹果手机测试商品', '跳楼大降价', 
'4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg', '4241695c-b9c7-41ad-89ac-4a6a877421c1.jpg,
5d582ded-19db-4dba-96ed-9631cfc40f47.jpg,39c561af-d8f9-4e55-a71b-10db9bb1dd7c.jpg', 
'<p>很秀的一款手机</p><p><img alt=\"15.jpg\" 
src=\"http://img.guangping.store/7c3b7c06-3655-469d-803d-40c46ce480d7.jpg\" width=\"790\" height=\"1444\"><br></p>', 
ID, '94', '1', NOW(), NOW());
          SET ID = ID + 1;
          SET Var = Var + 1;
      END WHILE;
  END
;;
DELIMITER ;
