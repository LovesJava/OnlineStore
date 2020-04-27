/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : online_mall

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2020-04-27 20:36:28
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_cart
-- ----------------------------
INSERT INTO `mall_cart` VALUES ('15', '21', '2', '12', '0', '2020-04-27 17:06:33', '2020-04-27 17:06:33');
INSERT INTO `mall_cart` VALUES ('16', '21', '3', '12', '0', '2020-04-27 17:06:41', '2020-04-27 17:06:41');
INSERT INTO `mall_cart` VALUES ('17', '21', '4', '14', '0', '2020-04-27 17:06:46', '2020-04-27 17:16:30');
INSERT INTO `mall_cart` VALUES ('18', '21', '5', '12', '0', '2020-04-27 17:07:01', '2020-04-27 17:07:01');

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
) ENGINE=InnoDB AUTO_INCREMENT=100033 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_category
-- ----------------------------
INSERT INTO `mall_category` VALUES ('10001', '0', '家电', '1', null, '2020-04-10 15:34:45', '2020-04-10 15:34:45');
INSERT INTO `mall_category` VALUES ('10002', '0', '手机', '1', null, '2020-04-10 15:35:17', '2020-04-10 15:35:17');
INSERT INTO `mall_category` VALUES ('10003', '0', '家具', '1', null, '2020-04-10 15:35:42', '2020-04-10 15:35:42');
INSERT INTO `mall_category` VALUES ('10004', '10003', '沙发', '1', null, '2020-04-10 15:36:22', '2020-04-10 15:36:22');
INSERT INTO `mall_category` VALUES ('10005', '10003', '衣柜', '1', null, '2020-04-10 15:36:48', '2020-04-10 15:36:48');
INSERT INTO `mall_category` VALUES ('10006', '10002', '小米', '1', null, '2020-04-10 15:37:18', '2020-04-10 15:37:18');
INSERT INTO `mall_category` VALUES ('10007', '10002', '华为', '1', null, '2020-04-10 15:37:38', '2020-04-10 15:37:38');
INSERT INTO `mall_category` VALUES ('10008', '10001', '彩电', '1', null, '2020-04-10 15:38:05', '2020-04-10 15:38:05');
INSERT INTO `mall_category` VALUES ('10009', '10001', '冰箱', '1', null, '2020-04-10 15:38:27', '2020-04-10 15:38:27');
INSERT INTO `mall_category` VALUES ('10010', '10001', '微波炉', '1', null, '2020-04-10 15:38:45', '2020-04-10 15:38:45');
INSERT INTO `mall_category` VALUES ('100032', '0', '日用品(改)', '1', null, '2020-04-10 15:56:51', '2020-04-10 15:56:51');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_order
-- ----------------------------
INSERT INTO `mall_order` VALUES ('1', '1587977908448', '21', '3', '7500.00', '1', '0', '10', null, null, null, null, '2020-04-27 16:58:28', '2020-04-27 16:58:28');
INSERT INTO `mall_order` VALUES ('2', '1587979319481', '21', '2', '2000.00', '1', '0', '40', null, '2020-04-27 17:41:25', null, null, '2020-04-27 17:21:59', '2020-04-27 17:41:25');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_order_item
-- ----------------------------
INSERT INTO `mall_order_item` VALUES ('1', '1587977908448', '21', '3', '华为mate40', 'test1.jpg', '3000.00', '1', '3000.00', '2020-04-27 16:58:28', '2020-04-27 16:58:28');
INSERT INTO `mall_order_item` VALUES ('2', '1587977908448', '21', '4', '华为mate30', 'test1.jpg', '3000.00', '1', '3000.00', '2020-04-27 16:58:28', '2020-04-27 16:58:28');
INSERT INTO `mall_order_item` VALUES ('3', '1587977908448', '21', '5', '美的冰箱xb30', 'test1.jpg', '1500.00', '1', '1500.00', '2020-04-27 16:58:28', '2020-04-27 16:58:28');
INSERT INTO `mall_order_item` VALUES ('4', '1587979319481', '21', '1', '三星爆炸牌电池', 'test.jpg', '2000.00', '1', '2000.00', '2020-04-27 17:21:59', '2020-04-27 17:21:59');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_pay_info
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_product
-- ----------------------------
INSERT INTO `mall_product` VALUES ('1', '1', '三星爆炸牌电池', '三星小促销', 'test.jpg', 'test.jpg', 'detailtext', '2000.00', '99', '1', null, '2020-04-27 17:21:59');
INSERT INTO `mall_product` VALUES ('2', '10006', '小米9', '小米大促销', 'test1.jpg', 'test1.jpg,11.jpg,2.jpg,3.jpg', 'detailtext', '2000.00', '1000', '1', '2020-04-17 19:09:43', '2020-04-17 19:09:43');
INSERT INTO `mall_product` VALUES ('3', '10007', '华为mate40', '大降价', 'test1.jpg', 'test1.jpg,11.jpg,2.jpg,3.jpg', 'detailtext', '3000.00', '2999', '1', '2020-04-17 19:11:59', '2020-04-27 16:58:28');
INSERT INTO `mall_product` VALUES ('4', '10007', '华为mate30', '停大降价', 'test1.jpg', 'test1.jpg,11.jpg,2.jpg,3.jpg', 'detailtext', '3000.00', '2999', '2', '2020-04-17 19:12:35', '2020-04-27 16:58:29');
INSERT INTO `mall_product` VALUES ('5', '10009', '美的冰箱xb30', '家电下乡', 'test1.jpg', 'test1.jpg,11.jpg,2.jpg,3.jpg', 'detailtext', '1500.00', '4999', '1', '2020-04-17 19:13:37', '2020-04-27 16:58:29');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_shipping
-- ----------------------------
INSERT INTO `mall_shipping` VALUES ('1', '21', '宋书航', '010', '18688888888', '北京', '北京市', null, '中关村', '100000', '2020-04-21 16:59:21', '2020-04-21 16:59:21');
INSERT INTO `mall_shipping` VALUES ('3', '21', '阿十六', '010', '18688888888', '北京', '北京市', null, '中关村', '100000', null, '2020-04-21 17:12:10');
INSERT INTO `mall_shipping` VALUES ('4', '21', '豆豆', '010', '18774970814', '湖南省', '长沙市', null, '雨花区', '100000', '2020-04-21 17:13:15', '2020-04-21 17:13:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_user
-- ----------------------------
INSERT INTO `mall_user` VALUES ('21', 'username', '373E484089A360AD001A86B025448E43', 'test@163.com', '18774970814', '谁是猪', '你是猪', '0', '2020-04-09 21:52:27', '2020-04-09 21:52:27');
INSERT INTO `mall_user` VALUES ('22', 'root', 'D8F80B67499E434EA61ADAF6E6219BF2', 'amind@163.com', '1234561111', '新问题', '老答案，骗你的', '1', '2020-04-09 21:53:05', '2020-04-09 22:16:00');
