/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : szprslmes

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 21/10/2022 10:48:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mes_area
-- ----------------------------
DROP TABLE IF EXISTS `mes_area`;
CREATE TABLE `mes_area`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_AREACODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '库区编号',
  `F_AREATYPE` int NOT NULL COMMENT '库区类型',
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_NEEDRULE` tinyint NULL DEFAULT NULL COMMENT '是否需要先进先出',
  `F_STACKTYPE` tinyint NULL DEFAULT NULL COMMENT 'true货架 false叠加',
  `F_PREFIX` int NOT NULL COMMENT '库位前缀',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_area
-- ----------------------------

-- ----------------------------
-- Table structure for mes_batchinfo
-- ----------------------------
DROP TABLE IF EXISTS `mes_batchinfo`;
CREATE TABLE `mes_batchinfo`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_FLOWTYPE` int NULL DEFAULT NULL COMMENT '流转类型(0入库绑定，1领用，2产出，3库存，4出库，5检验)',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号编号',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_TRANSFERBOXCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流转箱编号',
  `F_LOCATIONCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '库位号',
  `F_MATERIALBATCH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号批次',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备id',
  `F_EQPNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备名称',
  `F_NUM` double NOT NULL COMMENT '数量',
  `F_DONENUM` double NOT NULL COMMENT '使用数量',
  `F_PARENTID` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '父级',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_batchinfo
-- ----------------------------

-- ----------------------------
-- Table structure for mes_boardaccount
-- ----------------------------
DROP TABLE IF EXISTS `mes_boardaccount`;
CREATE TABLE `mes_boardaccount`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'Id',
  `F_ACCOUNT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '账号',
  `F_PASSWORD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL COMMENT '是否启用',
  `F_DELETEMARK` tinyint NULL DEFAULT NULL COMMENT '逻辑删除标志',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人',
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL COMMENT '最后修改时间',
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '最后修改人',
  `F_DELETETIME` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '删除人',
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '内容',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_boardaccount
-- ----------------------------

-- ----------------------------
-- Table structure for mes_bomform
-- ----------------------------
DROP TABLE IF EXISTS `mes_bomform`;
CREATE TABLE `mes_bomform`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号主键-1',
  `F_SONMATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '组成主键-n',
  `F_BOMTYPE` int NULL DEFAULT NULL COMMENT 'Bom类型（0erp,1mes）',
  `F_PROCESSID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工序主键',
  `F_NUM` double NOT NULL COMMENT '数量',
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_bomform
-- ----------------------------

-- ----------------------------
-- Table structure for mes_checkdatestorage
-- ----------------------------
DROP TABLE IF EXISTS `mes_checkdatestorage`;
CREATE TABLE `mes_checkdatestorage`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_CHECKSTORAGETYPE` int NOT NULL COMMENT '盘点类型',
  `F_CHECKDATE` date NOT NULL COMMENT '盘点日期',
  `F_CLASSNUM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '班别（A白班，B夜班）',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_BEGINNUM` double NOT NULL COMMENT '上一班数量',
  `F_CURRENTNUM` double NULL DEFAULT NULL COMMENT '当前数量',
  `F_CURRENTPALLET` int NULL DEFAULT NULL COMMENT '当前托数',
  `F_INNUM` double NULL DEFAULT NULL COMMENT '入库数量',
  `F_OUTNUM` double NULL DEFAULT NULL COMMENT '出库数量',
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  PRIMARY KEY (`F_ID`) USING BTREE,
  UNIQUE INDEX `MES_CHECKDATESTORAGE`(`F_CHECKSTORAGETYPE`, `F_CHECKDATE`, `F_CLASSNUM`, `F_MATERIALID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_checkdatestorage
-- ----------------------------

-- ----------------------------
-- Table structure for mes_checkoutdescription
-- ----------------------------
DROP TABLE IF EXISTS `mes_checkoutdescription`;
CREATE TABLE `mes_checkoutdescription`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '主键',
  `F_PARENTID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '父级id',
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '描述',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人',
  `F_LAYERS` int NULL DEFAULT NULL COMMENT '层级',
  `F_CLICKNUM` bigint NOT NULL COMMENT '选择次数',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_checkoutdescription
-- ----------------------------
INSERT INTO `mes_checkoutdescription` VALUES ('00263df0-8ada-49b9-9780-5c58354cd7aa', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', '表面压伤\n', '2021-05-31 14:50:06', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 9);
INSERT INTO `mes_checkoutdescription` VALUES ('003875e3-844c-4bdc-91d1-d5e9ad0f601f', 'abb700fa-a466-4a4c-b39f-6289f7959765', '位置不符合样件要求\n', '2021-05-31 14:35:52', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 418);
INSERT INTO `mes_checkoutdescription` VALUES ('01375fb2-615a-4012-9ec2-9c5a451b6d41', '5bb9d397-82a6-4447-8fd8-3822b10b90cf', '锈蚀\n', '2021-05-31 14:36:53', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('08d93b6f-3b2a-48e3-8c49-f9a8b6cb7338', 'de5392a6-75ff-4b0d-b57b-c82f4bcabfe5', '料片报废', '2021-06-30 10:31:57', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 835);
INSERT INTO `mes_checkoutdescription` VALUES ('08d93c3b-a641-4c8b-8470-38a837fcbc14', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', 'H柱开裂', '2021-07-01 10:55:14', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 3, 72);
INSERT INTO `mes_checkoutdescription` VALUES ('08d93cfc-062f-4882-81bc-a446baaa546a', '7511df4a-92d9-454d-b04b-6ae16162da33', '生锈', '2021-07-02 09:52:18', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 2, 17);
INSERT INTO `mes_checkoutdescription` VALUES ('08d93cfc-1dd5-4d1d-8d52-b1ecc8f5c08f', '7511df4a-92d9-454d-b04b-6ae16162da33', '颜色异常', '2021-07-02 09:52:58', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 2, 78);
INSERT INTO `mes_checkoutdescription` VALUES ('08d93cfe-3364-4453-8a78-25bb269062c1', '7511df4a-92d9-454d-b04b-6ae16162da33', '内左', '2021-07-02 10:07:53', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('08d93cfe-423c-49bf-8435-dee09a345b27', '08d93cfe-3364-4453-8a78-25bb269062c1', '焊缝不良', '2021-07-02 10:08:18', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 3, 31);
INSERT INTO `mes_checkoutdescription` VALUES ('08d93cff-c673-4274-8494-aca4e51cebc1', '7511df4a-92d9-454d-b04b-6ae16162da33', '内右', '2021-07-02 10:19:09', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('08d93cff-d1a7-4fb0-8482-ab3e4c1a93bc', '08d93cff-c673-4274-8494-aca4e51cebc1', '焊缝不良', '2021-07-02 10:19:28', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 3, 44);
INSERT INTO `mes_checkoutdescription` VALUES ('08d93d01-df3c-4409-82f6-f76d2f9ba4bd', '08d93cfe-3364-4453-8a78-25bb269062c1', '压伤', '2021-07-02 10:34:10', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 3, 20);
INSERT INTO `mes_checkoutdescription` VALUES ('08d93d01-e93a-4b3b-81a7-e5a5dc86627d', '08d93cff-c673-4274-8494-aca4e51cebc1', '压伤', '2021-07-02 10:34:27', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 3, 2);
INSERT INTO `mes_checkoutdescription` VALUES ('08d93f6a-70a6-4985-8540-d113b259eb70', 'a1d6edd2-41df-447f-912b-568e38f7f5cc', '不良', '2021-07-05 12:07:44', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('08d93f6a-7f57-4cb8-8ec1-dfad0df4db71', '08d93f6a-70a6-4985-8540-d113b259eb70', '破拆', '2021-07-05 12:08:09', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 3, 2);
INSERT INTO `mes_checkoutdescription` VALUES ('08d940de-d0a1-4f09-824a-de05c455ff33', '7511df4a-92d9-454d-b04b-6ae16162da33', '试条', '2021-07-07 08:33:18', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 2, 5);
INSERT INTO `mes_checkoutdescription` VALUES ('08d940de-d6f4-4d1b-8446-303cc3f3aa25', 'f13e7573-9466-436d-ab3e-8157d31bde09', '试条', '2021-07-07 08:33:28', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('08d94362-645d-48ce-8cf6-7f3069f16d11', '7511df4a-92d9-454d-b04b-6ae16162da33', '划伤', '2021-07-10 13:20:12', 'def906e6-a389-4d39-9e3d-3c3adf1baace', 2, 4);
INSERT INTO `mes_checkoutdescription` VALUES ('08d94362-7bb5-41d5-8dbc-0d8ae12f7f81', 'de5392a6-75ff-4b0d-b57b-c82f4bcabfe5', '切割试条', '2021-07-10 13:20:51', 'def906e6-a389-4d39-9e3d-3c3adf1baace', 2, 64);
INSERT INTO `mes_checkoutdescription` VALUES ('08d94362-89f2-4358-8edd-7added30d283', '7511df4a-92d9-454d-b04b-6ae16162da33', '压伤', '2021-07-10 13:21:15', 'def906e6-a389-4d39-9e3d-3c3adf1baace', 2, 130);
INSERT INTO `mes_checkoutdescription` VALUES ('08d94ce9-d4fd-4e48-8e13-495d8979e124', 'f13e7573-9466-436d-ab3e-8157d31bde09', '批量开裂隔离', '2021-07-22 16:22:23', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 90);
INSERT INTO `mes_checkoutdescription` VALUES ('08d94d6e-35e7-4fd1-89e8-66f8285d2eba', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', '门槛开裂', '2021-07-23 08:10:00', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 8);
INSERT INTO `mes_checkoutdescription` VALUES ('08d95d3c-031d-4d78-81c6-8958b910fb2e', 'de5392a6-75ff-4b0d-b57b-c82f4bcabfe5', '测试', '2021-08-12 10:50:58', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 2, 18);
INSERT INTO `mes_checkoutdescription` VALUES ('08d962a8-e33c-4097-8015-08baa890b819', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', 'B柱开裂', '2021-08-19 08:32:56', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 3, 1);
INSERT INTO `mes_checkoutdescription` VALUES ('08d962a8-ee78-40ac-8dc0-5bf853b9daa1', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', 'A柱开裂', '2021-08-19 08:33:14', '08d93c3b-59d6-4acb-8e28-3f8591df15a7', 3, 2);
INSERT INTO `mes_checkoutdescription` VALUES ('08d97d67-c949-4c4b-8d18-eeb0133936fd', '0', '系统调账', '2021-09-22 09:24:56', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', 1, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('08d97d67-d5f9-4e54-8493-a717efe1633d', '08d97d67-c949-4c4b-8d18-eeb0133936fd', '实物比系统少', '2021-09-22 09:25:17', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('0ae7821b-5d75-4328-b50c-a83b29dbe78f', 'b9576923-8a3c-414c-8348-2320663a7b3f', '结疤\n', '2021-05-31 14:14:34', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('0ca88032-bb25-4675-9865-00e10af19c2a', '329a8bef-d2b3-461e-b803-5933301caa2e', '孔未割穿\n', '2021-05-31 15:04:32', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 1);
INSERT INTO `mes_checkoutdescription` VALUES ('1018bf40-16d4-4bf6-9162-3f5dd7ab559c', 'f13e7573-9466-436d-ab3e-8157d31bde09', '厚度', '2021-05-31 14:17:42', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('1187bf11-80f1-4f1c-8c16-cc27dd048ef7', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', '边缘起皱\n', '2021-05-31 14:51:55', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('1340b1fb-a047-46a0-b0dc-2936f63c069e', 'c6c532d4-c9b9-48e1-9199-d72204bbfdda', '焊核过小\n', '2021-05-31 14:39:05', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('13e00e9f-c791-4b14-9532-e1360cbb6926', 'de5392a6-75ff-4b0d-b57b-c82f4bcabfe5', '颜色异常\n', '2021-05-31 14:53:21', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('151181f7-c086-4cd6-9baa-1a9e0d3183d4', 'cb0af8f6-1118-4fd3-a55e-d605ea18adef', '毛刺\n', '2021-05-31 14:45:03', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 70);
INSERT INTO `mes_checkoutdescription` VALUES ('158ac25f-49ec-4e15-89b2-5e624614312d', '2fc41b2f-f28d-4406-9720-9094b1b60337', '切割面锯齿/波浪\n', '2021-05-31 14:57:37', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 9);
INSERT INTO `mes_checkoutdescription` VALUES ('183ee8af-db01-41ed-91bb-5276d72ae02d', 'b2461abf-11e0-4b6e-b44c-87b3f7b7e76e', '大\n', '2021-05-31 15:01:11', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('18d2eec6-ad12-45d9-bc88-67911c75e1df', '31751f07-4b47-4052-9083-399a1becf704', '不清晰\n', '2021-05-31 14:34:20', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('1aa194f7-0764-4357-a6d2-38fc5c234b45', '329a8bef-d2b3-461e-b803-5933301caa2e', '孔偏\n', '2021-05-31 15:04:18', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 104);
INSERT INTO `mes_checkoutdescription` VALUES ('1d4523b2-b681-42c7-a389-5f9f840bed4e', '25a64940-b1a9-4937-a70d-aefa3aaaaa39', 'Mn 超差\n', '2021-05-31 14:28:57', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('1e769bc7-80d9-4ac4-966f-51dbb2f78ea2', 'b3174687-ca6e-4b0d-acd9-012cc5b1012d', '宽度不均匀', '2021-05-31 14:23:56', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 2);
INSERT INTO `mes_checkoutdescription` VALUES ('2035c0a8-c4a5-42de-937e-2878ba75d192', '5bb9d397-82a6-4447-8fd8-3822b10b90cf', '变形\n', '2021-05-31 14:37:40', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 8);
INSERT INTO `mes_checkoutdescription` VALUES ('2390dc0b-f18e-47e9-8eeb-b037cf9038e7', '2fc41b2f-f28d-4406-9720-9094b1b60337', '表面烧伤\n', '2021-05-31 14:58:39', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 2);
INSERT INTO `mes_checkoutdescription` VALUES ('250f6cbb-c28b-4b7f-95d0-9958e810a82e', 'b3174687-ca6e-4b0d-acd9-012cc5b1012d', '未融合', '2021-05-31 14:23:06', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 5);
INSERT INTO `mes_checkoutdescription` VALUES ('25a64940-b1a9-4937-a70d-aefa3aaaaa39', 'f13e7573-9466-436d-ab3e-8157d31bde09', '化学成分\n', '2021-05-31 14:28:12', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('2854e518-7da4-47f7-aca5-27153e540cdd', 'abb700fa-a466-4a4c-b39f-6289f7959765', '深度不符合样件要求\n', '2021-05-31 14:36:13', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('28a7abe0-e38f-47b3-8901-a9211d8a6fde', '2fc41b2f-f28d-4406-9720-9094b1b60337', '过切\n', '2021-05-31 14:59:13', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('2b9de8f5-619f-4a0b-9bb9-8fe26e12a05e', 'd765b09e-4f9a-4266-98aa-ec3db11072ba', '屈服强度超差', '2021-05-31 14:27:20', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('2e32c38b-59a1-472c-b963-9110b8acc46c', 'abb700fa-a466-4a4c-b39f-6289f7959765', '造型不符合样件要求\n', '2021-05-31 14:35:34', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('2e671ad0-b332-4865-a657-2685b2ec5c3f', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', '压印\n', '2021-05-31 14:53:02', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 72);
INSERT INTO `mes_checkoutdescription` VALUES ('2e6724ed-6458-45f9-968c-84afcc6dc6f1', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', '杂物\n', '2021-05-31 14:49:31', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 3);
INSERT INTO `mes_checkoutdescription` VALUES ('2fc41b2f-f28d-4406-9720-9094b1b60337', '7511df4a-92d9-454d-b04b-6ae16162da33', '外观\n', '2021-05-31 14:56:50', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('3078b24f-d510-4673-9196-b42364717e33', '25a64940-b1a9-4937-a70d-aefa3aaaaa39', 'S 超差\n', '2021-05-31 14:29:42', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('3147af10-c910-4b81-a3a2-eac8e835073f', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', 'R角开裂', '2021-05-31 14:51:13', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 418);
INSERT INTO `mes_checkoutdescription` VALUES ('31751f07-4b47-4052-9083-399a1becf704', 'a1d6edd2-41df-447f-912b-568e38f7f5cc', '标识\n', '2021-05-31 14:33:43', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('31ab757d-efcd-45a0-a91a-f7265ccaa745', '85bb0014-bb63-4c12-9713-06cdd183a7d8', '未指定位置偏移＞20mm\n', '2021-05-31 14:44:11', '280f093d-6f66-40fd-abca-085f7bf12bd8', 4, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('329a8bef-d2b3-461e-b803-5933301caa2e', '7511df4a-92d9-454d-b04b-6ae16162da33', '孔位\n', '2021-05-31 15:03:44', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('34ccfd9a-2d4a-4bc5-9829-c09341e0311b', '7511df4a-92d9-454d-b04b-6ae16162da33', '型面尺寸\n', '2021-05-31 15:02:57', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('35f4603f-c3db-426a-9b2b-85a956c1d28a', '329a8bef-d2b3-461e-b803-5933301caa2e', '孔变形\n', '2021-05-31 15:03:58', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 3);
INSERT INTO `mes_checkoutdescription` VALUES ('372ecc43-9b6a-490c-be12-0e08eb09de59', '25a64940-b1a9-4937-a70d-aefa3aaaaa39', 'Ti 超差\n', '2021-05-31 14:30:37', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('37882a87-b06a-4e06-86b8-d7c9ca5b94df', 'a1d6edd2-41df-447f-912b-568e38f7f5cc', '压痕过深\n', '2021-05-31 14:45:57', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 4);
INSERT INTO `mes_checkoutdescription` VALUES ('3c1a77a9-bbd8-4f89-a9e2-29beb9cceb29', 'f13e7573-9466-436d-ab3e-8157d31bde09', '标签', '2021-05-31 14:06:34', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('3ccd1567-2bff-4e87-b50a-4429afad2400', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', '边缘变形\n', '2021-05-31 14:52:12', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 4);
INSERT INTO `mes_checkoutdescription` VALUES ('3db80cc0-42c8-4e94-b083-c8e5adb47645', '61ea7a39-7d19-49cb-8b11-1b0f1dfd9343', '大', '2021-05-31 15:02:08', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('3e911710-8d60-4f1c-a59d-f02af32cc954', '2fc41b2f-f28d-4406-9720-9094b1b60337', '杂物\n', '2021-05-31 14:57:05', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 46);
INSERT INTO `mes_checkoutdescription` VALUES ('3ec5f78d-24f0-4499-9e25-08d85ff55528', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', '表面氧化\n', '2021-05-31 14:50:40', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('41fe8208-b666-4346-8425-9ac9cfa3f375', 'de5392a6-75ff-4b0d-b57b-c82f4bcabfe5', '超时\n', '2021-05-31 14:56:22', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 505);
INSERT INTO `mes_checkoutdescription` VALUES ('42e58159-7381-442d-8cdb-6cf22e5e65c6', '4c10334e-ef5b-42ff-a3e1-903fe1529834', '整垛错层＞5mm', '2021-05-31 14:09:11', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('4362975c-d36a-4947-85a9-dbdbe0bb9c3c', '25a64940-b1a9-4937-a70d-aefa3aaaaa39', 'Al 超差\n', '2021-05-31 14:30:00', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('44144b11-7ee6-4a09-8aa7-4121bb22cdc8', 'b9576923-8a3c-414c-8348-2320663a7b3f', '锈蚀', '2021-05-31 14:15:02', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('446cc90c-7669-41e9-a674-f6e0c9357a20', '5577a250-78d4-411f-ae12-6a6e3146b921', '外轮廓度不符', '2021-05-31 14:25:20', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 121);
INSERT INTO `mes_checkoutdescription` VALUES ('4538a854-0a84-4b0e-85aa-7155ddd243af', '5bb9d397-82a6-4447-8fd8-3822b10b90cf', '划伤\n', '2021-05-31 14:37:08', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('45d24aec-50c8-4969-9220-19991e2cd5b1', '2fc41b2f-f28d-4406-9720-9094b1b60337', '切边多料\n', '2021-05-31 14:58:23', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('45d32c82-7f36-44b2-974a-b984d70e0b5d', 'a1d6edd2-41df-447f-912b-568e38f7f5cc', '边缘焊点\n', '2021-05-31 14:45:38', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('472492db-6f59-46b5-8762-c18c3f441bd6', '8bbc5756-b885-4640-a1b3-5071d00ca327', '破损', '2021-05-31 14:06:54', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('49dbbf76-7ffb-4677-9cea-39ad49b4a95d', 'b273013e-e2e0-4804-a9b0-3ba8c61235d1', '少切\n', '2021-05-31 15:05:17', '280f093d-6f66-40fd-abca-085f7bf12bd8', 4, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('49ed23be-ecd0-4235-aacd-900c18765551', '5bb9d397-82a6-4447-8fd8-3822b10b90cf', '折痕\n', '2021-05-31 14:37:24', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('4b2a0769-c293-4c4a-a545-0479ac624796', 'b2461abf-11e0-4b6e-b44c-87b3f7b7e76e', '小\n', '2021-05-31 15:01:29', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('4c10334e-ef5b-42ff-a3e1-903fe1529834', 'f13e7573-9466-436d-ab3e-8157d31bde09', '摆放', '2021-05-31 14:08:40', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('4f5c31c2-5feb-49eb-945d-bad3aaede058', '2fc41b2f-f28d-4406-9720-9094b1b60337', '未切断\n', '2021-05-31 14:59:31', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('50f706bf-8076-4c14-8074-6a157c7a111e', 'a1d6edd2-41df-447f-912b-568e38f7f5cc', '焊接飞溅\n', '2021-05-31 14:46:17', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('525f578a-6974-4e75-9514-e162bceb36d2', 'b3174687-ca6e-4b0d-acd9-012cc5b1012d', '裂纹', '2021-05-31 14:20:55', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 1);
INSERT INTO `mes_checkoutdescription` VALUES ('5577a250-78d4-411f-ae12-6a6e3146b921', 'f13e7573-9466-436d-ab3e-8157d31bde09', '尺寸', '2021-05-31 14:25:05', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('562073dd-b38c-471d-adcc-c6b3cece9235', '57b284b4-574c-46d0-afc5-7076485b8b21', '焊点周围有裂纹\n', '2021-05-31 14:42:13', '280f093d-6f66-40fd-abca-085f7bf12bd8', 4, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('56a8eef7-b1a5-4761-b0b5-692822168ac5', 'e76f8cce-408a-4138-b663-6a7bb827cb47', '不完整', '2021-05-31 14:07:45', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('57b284b4-574c-46d0-afc5-7076485b8b21', 'cb0af8f6-1118-4fd3-a55e-d605ea18adef', '裂纹\n', '2021-05-31 14:41:18', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('5bb9d397-82a6-4447-8fd8-3822b10b90cf', 'a1d6edd2-41df-447f-912b-568e38f7f5cc', '半成品表面\n', '2021-05-31 14:36:33', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('5e340f0e-27fc-454a-bafd-e4168872b11f', 'bbc44dab-0e11-4978-a160-c2888a27292c', '上补丁板焊点数＜11个\n', '2021-05-31 14:39:37', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('61ea7a39-7d19-49cb-8b11-1b0f1dfd9343', '7511df4a-92d9-454d-b04b-6ae16162da33', '切边尺寸\n', '2021-05-31 15:01:55', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('65e18967-5862-471f-ba41-b01eef86e06c', 'a1d6edd2-41df-447f-912b-568e38f7f5cc', '焊核尺寸超差\n', '2021-05-31 14:46:40', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('66ee1997-8773-4b42-b545-088b1a2c072e', '7511df4a-92d9-454d-b04b-6ae16162da33', '基准孔尺寸\n', '2021-05-31 14:59:58', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('68f9ffb0-5510-461c-8f52-90b1c70e9cd3', 'd765b09e-4f9a-4266-98aa-ec3db11072ba', '抗拉强度超差', '2021-05-31 14:27:36', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('6a4f3bdd-1cb4-4b5a-93e9-519634aff88a', '13e00e9f-c791-4b14-9532-e1360cbb6926', '发白\n', '2021-05-31 14:53:37', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 4);
INSERT INTO `mes_checkoutdescription` VALUES ('6a6e8963-9587-4515-8581-e5f02a995276', '25a64940-b1a9-4937-a70d-aefa3aaaaa39', 'P 超差\n', '2021-05-31 14:29:25', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('6a8e799a-bbc3-4232-832e-7d9078fc761d', 'c6c532d4-c9b9-48e1-9199-d72204bbfdda', '无熔核\n', '2021-05-31 14:38:50', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('6afc647c-2afb-4473-9157-5f5ae72f643d', 'b3174687-ca6e-4b0d-acd9-012cc5b1012d', '断弧', '2021-05-31 14:22:43', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('6b0b4797-d183-4021-a442-f47e872f268e', '57b284b4-574c-46d0-afc5-7076485b8b21', '表面裂缝较大较深\n', '2021-05-31 14:41:36', '280f093d-6f66-40fd-abca-085f7bf12bd8', 4, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('6b273a22-e92c-4cf8-812f-426c76d3fa2e', 'bbc44dab-0e11-4978-a160-c2888a27292c', '下补丁板焊点数＜14个\n', '2021-05-31 14:39:51', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('6b53854c-5314-4ea4-b3f0-2acbdb02af6c', 'f13e7573-9466-436d-ab3e-8157d31bde09', '粗糙度超差', '2021-05-31 14:26:25', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('6b9a5e4b-167f-4ea2-a45f-5f7ba9a5d6b8', 'b3174687-ca6e-4b0d-acd9-012cc5b1012d', '起弧收弧距离料边小于2mm', '2021-05-31 14:24:11', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('6ea88fd3-513b-46c6-ba7e-6c05a97c5889', 'b9576923-8a3c-414c-8348-2320663a7b3f', '裂纹\n', '2021-05-31 14:13:32', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('71b034b0-9c21-44f0-bb20-eb5cb0400512', '25a64940-b1a9-4937-a70d-aefa3aaaaa39', 'Si 超差\n', '2021-05-31 14:29:09', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('739601ce-decc-4244-bfe1-338408d5ce53', 'b273013e-e2e0-4804-a9b0-3ba8c61235d1', '多切\n', '2021-05-31 15:05:30', '280f093d-6f66-40fd-abca-085f7bf12bd8', 4, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('73d0d6d5-2d42-416b-81c5-91b2872b53d7', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', '表面白色斑点\n', '2021-05-31 14:52:45', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 1);
INSERT INTO `mes_checkoutdescription` VALUES ('7511df4a-92d9-454d-b04b-6ae16162da33', '0', '切割\n', '2021-05-31 14:56:36', '280f093d-6f66-40fd-abca-085f7bf12bd8', 1, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('759e447a-a757-41f3-9684-69a092cde520', 'cb0af8f6-1118-4fd3-a55e-d605ea18adef', '穿孔\n\n', '2021-05-31 14:42:39', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 1);
INSERT INTO `mes_checkoutdescription` VALUES ('787b7e9d-69da-4e4f-a9d6-67a396c00dd8', '34ccfd9a-2d4a-4bc5-9829-c09341e0311b', '大', '2021-05-31 15:03:06', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('7aa0b554-11f1-406f-8477-f0a8e532d540', '25a64940-b1a9-4937-a70d-aefa3aaaaa39', 'CEIIW  超差\n', '2021-05-31 14:31:46', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('7d1540cd-8490-43a1-ac2d-0e21ab712d54', 'b3174687-ca6e-4b0d-acd9-012cc5b1012d', '对接明显错位', '2021-05-31 14:23:38', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 53);
INSERT INTO `mes_checkoutdescription` VALUES ('7f5c82e4-4847-4baf-9b4b-31336db49a2d', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', '变形\n', '2021-05-31 14:49:47', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 208);
INSERT INTO `mes_checkoutdescription` VALUES ('8106105f-8fc7-4eb1-8dca-d4ee3718c1b6', '66ee1997-8773-4b42-b545-088b1a2c072e', '大\n', '2021-05-31 15:00:14', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('81430c6a-f20c-43d3-ac8d-9ca07e2234b2', 'f13e7573-9466-436d-ab3e-8157d31bde09', '涂层厚度超差', '2021-05-31 14:26:40', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('8304d364-a2b6-4cec-b557-2eac4b2c22cf', 'b3174687-ca6e-4b0d-acd9-012cc5b1012d', '气孔', '2021-05-31 14:22:16', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('842a7e7d-50b5-42bb-bd24-fb5dc75893ec', 'a1bf9197-a1ec-46c5-aab1-29b9d316bb64', '超差\n', '2021-05-31 14:17:16', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('8430f28c-7136-427a-8a09-3c923d702a4c', '25a64940-b1a9-4937-a70d-aefa3aaaaa39', 'Cr 超差\n', '2021-05-31 14:31:07', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('855de5fc-827f-488f-b7c7-248beccce9da', 'b9576923-8a3c-414c-8348-2320663a7b3f', '夹渣\n', '2021-05-31 14:14:09', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('85bb0014-bb63-4c12-9713-06cdd183a7d8', 'cb0af8f6-1118-4fd3-a55e-d605ea18adef', '位置偏差\n', '2021-05-31 14:43:18', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('8bbc5756-b885-4640-a1b3-5071d00ca327', 'f13e7573-9466-436d-ab3e-8157d31bde09', '包装', '2021-05-31 14:06:22', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('8e79d046-8617-4419-bce8-850014d424dc', 'b9576923-8a3c-414c-8348-2320663a7b3f', '毛刺\n', '2021-05-31 14:16:34', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('8f6b1434-9c8c-4036-9a37-a6a677e33fcd', '5577a250-78d4-411f-ae12-6a6e3146b921', '焊缝位置度不符\n', '2021-05-31 14:25:35', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('90459274-2335-4352-971d-a099b80b1e15', '2fc41b2f-f28d-4406-9720-9094b1b60337', '切边毛刺\n', '2021-05-31 14:58:56', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('9242ce99-29f9-40ab-a382-2b700a16bbc0', '9a27861b-7234-45c3-918c-8777ae48e18f', '上补丁板\n', '2021-05-31 14:40:28', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('92e8c602-f5b7-4b41-96db-79ac79bf8176', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', '定位孔变形\n', '2021-05-31 14:52:27', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 2);
INSERT INTO `mes_checkoutdescription` VALUES ('99d9f68a-ce10-4d6c-887c-3fed8ede6dfd', '31751f07-4b47-4052-9083-399a1becf704', '不完整\n', '2021-05-31 14:34:36', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('9a27861b-7234-45c3-918c-8777ae48e18f', 'a1d6edd2-41df-447f-912b-568e38f7f5cc', '多余焊点\n', '2021-05-31 14:40:12', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('a11ba511-1bba-4f08-b5e7-6ca06c3c05fd', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', '表面划伤\n', '2021-05-31 14:50:58', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 14);
INSERT INTO `mes_checkoutdescription` VALUES ('a1bf9197-a1ec-46c5-aab1-29b9d316bb64', 'f13e7573-9466-436d-ab3e-8157d31bde09', '尺寸\n', '2021-05-31 14:17:01', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('a1d6edd2-41df-447f-912b-568e38f7f5cc', '0', '点焊\n\n', '2021-05-31 14:33:22', '280f093d-6f66-40fd-abca-085f7bf12bd8', 1, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('a20c3b0f-6ba2-45d5-87eb-7e48b53be924', '2fc41b2f-f28d-4406-9720-9094b1b60337', '切边熔渣\n', '2021-05-31 14:58:08', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('a9a2a0d6-728c-4493-ada8-a68e24a4cd28', '4c10334e-ef5b-42ff-a3e1-903fe1529834', '整垛倾斜＞3mm', '2021-05-31 14:09:23', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('abb700fa-a466-4a4c-b39f-6289f7959765', 'a1d6edd2-41df-447f-912b-568e38f7f5cc', '凸包\n', '2021-05-31 14:34:56', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('ac498f30-e613-45d6-81dc-b0e3cdeb6035', '13e00e9f-c791-4b14-9532-e1360cbb6926', '发绿\n', '2021-05-31 14:54:08', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('ae02e9cd-59c4-461d-97c3-9d0b5209bf6e', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', '颜色条纹\n', '2021-05-31 14:51:27', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 1);
INSERT INTO `mes_checkoutdescription` VALUES ('af041cc0-f9e8-40bb-bc78-d52ddf1c674a', '25a64940-b1a9-4937-a70d-aefa3aaaaa39', 'C 超差\n', '2021-05-31 14:28:42', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('b0409e3c-e44c-4c32-9d34-33a4865d1135', 'd765b09e-4f9a-4266-98aa-ec3db11072ba', '延伸率超差\n', '2021-05-31 14:27:51', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('b06dea03-cdc9-467a-bc0e-550bca9df131', '13e00e9f-c791-4b14-9532-e1360cbb6926', '发红/紫\n', '2021-05-31 14:53:52', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('b2461abf-11e0-4b6e-b44c-87b3f7b7e76e', '7511df4a-92d9-454d-b04b-6ae16162da33', '孔径\n', '2021-05-31 15:00:55', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('b273013e-e2e0-4804-a9b0-3ba8c61235d1', '329a8bef-d2b3-461e-b803-5933301caa2e', '孔数量\n', '2021-05-31 15:04:57', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('b3174687-ca6e-4b0d-acd9-012cc5b1012d', 'f13e7573-9466-436d-ab3e-8157d31bde09', '焊缝', '2021-05-31 14:19:27', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('b51a910f-6bfe-4ae1-a1e5-888d6da79193', '3c1a77a9-bbd8-4f89-a9e2-29beb9cceb29', '信息错误', '2021-05-31 14:07:10', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('b9576923-8a3c-414c-8348-2320663a7b3f', 'f13e7573-9466-436d-ab3e-8157d31bde09', '表面', '2021-05-31 14:13:08', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('bae85b38-c84b-4bd2-8c85-3b6ab7620ceb', '2fc41b2f-f28d-4406-9720-9094b1b60337', '切割飞溅\n', '2021-05-31 14:57:51', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('bb906cf7-d4df-478a-90c1-d1189767782f', '1018bf40-16d4-4bf6-9162-3f5dd7ab559c', '超差', '2021-05-31 14:18:32', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('bbc44dab-0e11-4978-a160-c2888a27292c', 'a1d6edd2-41df-447f-912b-568e38f7f5cc', '漏焊\n', '2021-05-31 14:39:22', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('bc378176-9963-4c46-8bd6-f1f2ba0672bd', '25a64940-b1a9-4937-a70d-aefa3aaaaa39', 'N 超差\n', '2021-05-31 14:30:51', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('bd6bdeba-46bd-49b6-ad2c-b3ae267d21ff', 'b9576923-8a3c-414c-8348-2320663a7b3f', '手感明显划伤\n', '2021-05-31 14:16:11', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('c24c2df0-1644-41a2-8786-a3ed10a27641', '25a64940-b1a9-4937-a70d-aefa3aaaaa39', 'B 超差\n', '2021-05-31 14:31:29', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('c29b2f13-c3ff-4950-bcd8-05d4a2c2f73d', '31751f07-4b47-4052-9083-399a1becf704', '无\n', '2021-05-31 14:34:03', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('c39dcf43-2fb4-4050-a4d3-86465273716c', '9a27861b-7234-45c3-918c-8777ae48e18f', '下补丁板\n', '2021-05-31 14:40:47', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('c6c532d4-c9b9-48e1-9199-d72204bbfdda', 'a1d6edd2-41df-447f-912b-568e38f7f5cc', '虚焊\n', '2021-05-31 14:38:33', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('ca4551e0-246f-4f70-ba39-5c64b2b70f73', 'cb0af8f6-1118-4fd3-a55e-d605ea18adef', '扭曲\n', '2021-05-31 14:42:59', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('cb0af8f6-1118-4fd3-a55e-d605ea18adef', 'a1d6edd2-41df-447f-912b-568e38f7f5cc', '焊点外观\n', '2021-05-31 14:41:02', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('d09137b5-2c71-4072-8de8-04c0f558f0c8', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', '表面拉毛\n', '2021-05-31 14:50:23', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 25);
INSERT INTO `mes_checkoutdescription` VALUES ('d1c375d7-1a69-453f-ab22-66f8cce24a7b', 'e567b8ae-6a30-4a49-a46e-ac466f946d86', '隐裂\n', '2021-05-31 14:51:42', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 10);
INSERT INTO `mes_checkoutdescription` VALUES ('d462df7d-d434-4c75-9d08-5f22aec831a8', 'f13e7573-9466-436d-ab3e-8157d31bde09', '厚度超差', '2021-05-31 14:25:55', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('d6933e82-7e70-4404-bb2b-82af7b27b327', '85bb0014-bb63-4c12-9713-06cdd183a7d8', '指定位置偏移＞10mm\n', '2021-05-31 14:43:35', '280f093d-6f66-40fd-abca-085f7bf12bd8', 4, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('d765b09e-4f9a-4266-98aa-ec3db11072ba', 'f13e7573-9466-436d-ab3e-8157d31bde09', '机械性能', '2021-05-31 14:27:05', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('de5392a6-75ff-4b0d-b57b-c82f4bcabfe5', '0', '热压\n', '2021-05-31 14:48:36', '280f093d-6f66-40fd-abca-085f7bf12bd8', 1, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('e567b8ae-6a30-4a49-a46e-ac466f946d86', 'de5392a6-75ff-4b0d-b57b-c82f4bcabfe5', '外观\n', '2021-05-31 14:49:12', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('e76f8cce-408a-4138-b663-6a7bb827cb47', 'f13e7573-9466-436d-ab3e-8157d31bde09', '钢印', '2021-05-31 14:06:41', '280f093d-6f66-40fd-abca-085f7bf12bd8', 2, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('e7737981-b305-4580-a09a-632510835847', '2fc41b2f-f28d-4406-9720-9094b1b60337', '变形\n', '2021-05-31 14:57:19', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 41);
INSERT INTO `mes_checkoutdescription` VALUES ('ee38e227-b6ea-45d9-8fda-fa863e50fd65', '13e00e9f-c791-4b14-9532-e1360cbb6926', '发黄\n', '2021-05-31 14:54:30', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 33);
INSERT INTO `mes_checkoutdescription` VALUES ('f13e7573-9466-436d-ab3e-8157d31bde09', '0', '原材料', '2021-05-31 14:05:41', '280f093d-6f66-40fd-abca-085f7bf12bd8', 1, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('f1c51899-be72-474f-869f-428e961a4c0a', '34ccfd9a-2d4a-4bc5-9829-c09341e0311b', '小', '2021-05-31 15:03:18', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('f2ae9d82-be71-490a-bfad-19c8daaf1390', 'e76f8cce-408a-4138-b663-6a7bb827cb47', '无', '2021-05-31 14:07:20', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('f3400f38-5571-450f-a1a5-e7374f4a9d46', 'b273013e-e2e0-4804-a9b0-3ba8c61235d1', '废料堵孔\n', '2021-05-31 15:06:00', '280f093d-6f66-40fd-abca-085f7bf12bd8', 4, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('f3bd8137-f2d2-45fe-8663-d4aaec644708', '66ee1997-8773-4b42-b545-088b1a2c072e', '小\n', '2021-05-31 15:00:28', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('f5c41e50-53b0-409a-93f2-4d1427973138', '5bb9d397-82a6-4447-8fd8-3822b10b90cf', '油污\n', '2021-05-31 14:38:12', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('f6d6c545-7f91-466c-825c-594db7131882', '61ea7a39-7d19-49cb-8b11-1b0f1dfd9343', '小', '2021-05-31 15:02:26', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('f8866d0d-d993-45b8-a18a-abb2870a9cf8', 'e76f8cce-408a-4138-b663-6a7bb827cb47', '不清晰', '2021-05-31 14:07:32', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);
INSERT INTO `mes_checkoutdescription` VALUES ('fb6eec89-5820-40a5-9b83-ed145eea34ab', 'b3174687-ca6e-4b0d-acd9-012cc5b1012d', '台阶面向下', '2021-05-31 14:24:27', '280f093d-6f66-40fd-abca-085f7bf12bd8', 3, 0);

-- ----------------------------
-- Table structure for mes_consumeinfo
-- ----------------------------
DROP TABLE IF EXISTS `mes_consumeinfo`;
CREATE TABLE `mes_consumeinfo`  (
  `F_ID` bigint NOT NULL COMMENT 'id',
  `F_TRANSFERBOXCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流转箱编号',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_MATERIALBATCH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号批次',
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人id',
  `F_NUM` double NOT NULL COMMENT '数量',
  `F_PROCESSID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工序Id',
  `F_PROCESSNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工序名称',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备Id',
  `F_EQPNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备名称',
  `F_WORKORDERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工单Id',
  `F_WORKORDERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工单编号',
  `F_WORKORDERRUNSORT` int NULL DEFAULT NULL COMMENT '执行顺序',
  `F_OUTPUTID` bigint NULL DEFAULT NULL COMMENT '产出id',
  `F_WORKORDERDETAILID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工单明细Id',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_consumeinfo
-- ----------------------------

-- ----------------------------
-- Table structure for mes_controljob
-- ----------------------------
DROP TABLE IF EXISTS `mes_controljob`;
CREATE TABLE `mes_controljob`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_JOBCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '调度编号',
  `F_JOBINFO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '调度信息',
  `F_ISTOPLANMAN` tinyint NOT NULL COMMENT '是否发送计划人员',
  `F_ISNOTICE` tinyint NOT NULL COMMENT '是否通知',
  `F_PRIORITY` int NOT NULL COMMENT '优先级（从大到小执行）',
  `F_DONETIME` datetime NULL DEFAULT NULL COMMENT '执行时间',
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_JOBTYPE` int NOT NULL COMMENT '0补货，1入库，2出库，3产出上架，4移库，5作业开始，6作业结束,7领用退回',
  `F_NEEDID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '需求id',
  `F_FINISHTIME` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `F_JOBSTATE` int NOT NULL COMMENT '任务状态（0等待，1执行，2完成,3结束）',
  `F_NEEDEQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '需求设备id',
  `F_NEEDNUM` double NULL DEFAULT NULL COMMENT '数量',
  `F_NEEDTIME` datetime NULL DEFAULT NULL COMMENT '需求时间',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_controljob
-- ----------------------------

-- ----------------------------
-- Table structure for mes_controljobmusttime
-- ----------------------------
DROP TABLE IF EXISTS `mes_controljobmusttime`;
CREATE TABLE `mes_controljobmusttime`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_JOBTYPE` int NOT NULL COMMENT '0补货，1入库，2出库，3产出上架，4移库，5作业开始，6作业结束,7领用退回',
  `F_NEEDTIME` int NOT NULL COMMENT '任务响应时间(分)',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_controljobmusttime
-- ----------------------------
INSERT INTO `mes_controljobmusttime` VALUES ('08d92a23-54c9-41c3-8c19-a76e74652839', 0, 40);
INSERT INTO `mes_controljobmusttime` VALUES ('08d92a24-ba9b-4f0d-880f-23b034c09db3', 3, 40);
INSERT INTO `mes_controljobmusttime` VALUES ('08d92a24-bd7e-4d42-8e3f-10a0f129175d', 4, 120);
INSERT INTO `mes_controljobmusttime` VALUES ('08d92a24-c795-4cfa-81f5-21b9b6e3f78c', 7, 40);
INSERT INTO `mes_controljobmusttime` VALUES ('08d92a24-cb8e-403b-8cc1-cf4aa9300762', 10, 120);
INSERT INTO `mes_controljobmusttime` VALUES ('08d92a24-d259-49ed-842e-4fbc5dfa9774', 11, 120);
INSERT INTO `mes_controljobmusttime` VALUES ('08d92a2d-3da1-46bf-829d-b44762284e44', 9, 7200);
INSERT INTO `mes_controljobmusttime` VALUES ('08d92a2d-4149-43d9-8625-b3dd858f8a0d', 8, 2880);
INSERT INTO `mes_controljobmusttime` VALUES ('08d92a2d-4908-4ecf-8e56-60d3128cc201', 6, 1500);
INSERT INTO `mes_controljobmusttime` VALUES ('08d92a2d-4dab-488f-8d4b-d3df864fdb1e', 5, 1500);
INSERT INTO `mes_controljobmusttime` VALUES ('08d92a2d-5576-4034-8727-2bf9b41d4869', 2, 1500);
INSERT INTO `mes_controljobmusttime` VALUES ('08d92a2d-58fc-4a14-8c55-88444f708673', 1, 1500);

-- ----------------------------
-- Table structure for mes_controljobuserbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_controljobuserbanding`;
CREATE TABLE `mes_controljobuserbanding`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_JOBTYPE` int NOT NULL COMMENT '0补货，1入库，2出库，3产出上架，4移库，5作业开始，6作业结束,7领用退回',
  `F_USERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '用户ID',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备ID',
  `F_USERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '用户名',
  `F_EQPNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_controljobuserbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqpareabanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqpareabanding`;
CREATE TABLE `mes_eqpareabanding`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流转箱编号',
  `F_AREAID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '库区Id',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_eqpareabanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqpmaterialbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqpmaterialbanding`;
CREATE TABLE `mes_eqpmaterialbanding`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '设备ID',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_NUM` double NOT NULL COMMENT '产量数量',
  `F_PRODUCETYPE` int NOT NULL COMMENT '生产模式(0独立，1共享)',
  `F_PRIORITY` int NOT NULL COMMENT '从大到小',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_eqpmaterialbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqpmaterialuse
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqpmaterialuse`;
CREATE TABLE `mes_eqpmaterialuse`  (
  `F_ID` bigint NOT NULL COMMENT 'id',
  `F_TRANSFERBOXCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流转箱编号',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_MATERIALBATCH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号批次',
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人id',
  `F_NUM` double NOT NULL COMMENT '数量',
  `F_DONENUM` double NULL DEFAULT NULL COMMENT '消耗数量',
  `F_PROCESSID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工序Id',
  `F_PROCESSNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工序名称',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '设备id',
  `F_EQPNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备名称',
  `F_WORKORDERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工单Id',
  `F_WORKORDERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工单编号',
  `F_WORKORDERRUNSORT` int NULL DEFAULT NULL COMMENT '执行顺序',
  `F_WORKORDERDETAILID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工单明细Id',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人',
  `F_LOCATIONCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '库位号',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_eqpmaterialuse
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqppqccheckitem
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqppqccheckitem`;
CREATE TABLE `mes_eqppqccheckitem`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '设备ID',
  `F_SEQUENCE` int NULL DEFAULT NULL COMMENT '顺序',
  `F_CHECKITEM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '点检项目',
  `F_CHECKSTAND` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '检验基准',
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_eqppqccheckitem
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqppqcdetail
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqppqcdetail`;
CREATE TABLE `mes_eqppqcdetail`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_PID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_CHECKITEMID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY3` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY4` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY5` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY6` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY7` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY8` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY9` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY10` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY11` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY12` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY13` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY14` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY15` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY16` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY17` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY18` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY19` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY20` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY21` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY22` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY23` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY24` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY25` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY26` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY27` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY28` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY29` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY30` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DAY31` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_CHECKITEM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '检测项名字',
  `F_CHECKSTAND` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '检测标准',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_eqppqcdetail
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqppqcmaster
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqppqcmaster`;
CREATE TABLE `mes_eqppqcmaster`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '设备ID',
  `F_CHECKMONTH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '点检月份',
  `F_SHIFT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '班别',
  `F_REMARK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_eqppqcmaster
-- ----------------------------
INSERT INTO `mes_eqppqcmaster` VALUES ('08d92b47-e463-4e7d-822d-70c93a240b09', '0d3555e5-cc4b-445c-9795-f7c2e5e9e7fa', '202106', '白班', '[{\"day\":13,\"dayRemark\":\"13号点检：无异常\"},{\"day\":10,\"dayRemark\":\"OKK1\"},{\"day\":15,\"dayRemark\":\"5S不符合标准\"}]');
INSERT INTO `mes_eqppqcmaster` VALUES ('08d92bb8-3c72-4e39-8cb6-987449c3ca27', '0d3555e5-cc4b-445c-9795-f7c2e5e9e7fa', '202106', '夜班', '[{\"day\":11,\"dayRemark\":\"11号夜班点检\"},{\"day\":13,\"dayRemark\":\"夜班13OK确认\"}]');

-- ----------------------------
-- Table structure for mes_eqprepair
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqprepair`;
CREATE TABLE `mes_eqprepair`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_REPAIRNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '维修单号',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_PROBLEMTYPE` int NULL DEFAULT NULL COMMENT '故障分类',
  `F_PROBLEMCLASS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '故障等级：1低级，2中级，3高级',
  `F_PROBLEMDESC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '故障描述',
  `F_PHOTOPATH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '故障图片路径',
  `F_CALLREPAIRMAN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '报修人ID',
  `F_CALLREPAIRTIME` datetime NULL DEFAULT NULL COMMENT '报修时间',
  `F_DISTRIBUTETIME` datetime NULL DEFAULT NULL COMMENT '派工时间',
  `F_STARTREPAIRTIME` datetime NULL DEFAULT NULL COMMENT '维修开始时间',
  `F_ENDREPAIRTIME` datetime NULL DEFAULT NULL COMMENT '维修结束时间',
  `F_STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '状态：1,报修；2，已派工；3,维修中；4，确认中，99，关闭',
  `F_CONFIRMMAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '确认人ID,同报修人',
  `F_CONFIRMTIME` datetime NULL DEFAULT NULL COMMENT '确认时间',
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_EQPNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_CALLREPAIRMANNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '报修人姓名',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin COMMENT = '设备维修记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_eqprepair
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqprepairmanrecord
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqprepairmanrecord`;
CREATE TABLE `mes_eqprepairmanrecord`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_REPAIRID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备维修记录表主键',
  `F_REPAIRMAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '维修人Id',
  `F_DISTRIBUTETIME` datetime NULL DEFAULT NULL COMMENT '派工时间',
  `F_STARTREPAIRTIME` datetime NULL DEFAULT NULL COMMENT '维修开始时间',
  `F_ENDREPAIRTIME` datetime NULL DEFAULT NULL COMMENT '维修结束时间',
  `F_REPAIRRESULT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '维修结果',
  `F_STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '状态：1,派工，2，维修中，99，完成',
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_REPAIRMANNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '维修人姓名',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin COMMENT = '维修人员记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_eqprepairmanrecord
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqprepairprocess
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqprepairprocess`;
CREATE TABLE `mes_eqprepairprocess`  (
  `F_REPAIRID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '维修单主键',
  `F_ADDTIME` datetime NULL DEFAULT NULL COMMENT '动作时间',
  `F_ACTIONDESC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '动作描述'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_eqprepairprocess
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqpstoprecord
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqpstoprecord`;
CREATE TABLE `mes_eqpstoprecord`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_STOPTYPE` int NULL DEFAULT NULL COMMENT '1：故障停机，2：计划内停机，3:急停停机',
  `F_PLANSTOPSTARTTIME` datetime NULL DEFAULT NULL COMMENT '计划停机开始时间',
  `F_PLANSTOPENDTIME` datetime NULL DEFAULT NULL COMMENT '计划停机结束时间',
  `F_STOPREASONTYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '停机原因分类：1人2机3料4法5环',
  `F_STOPREASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '停机原因',
  `F_REALSTOPSTARTTIME` datetime NULL DEFAULT NULL COMMENT '实际停机开始时间',
  `F_REALSTOPENDTIME` datetime NULL DEFAULT NULL COMMENT '实际停机结束时间',
  `F_SOLUTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '解决措施',
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_EQPNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ISRECOVERY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '是否恢复，Y是，N否',
  `F_SHIFT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '班别',
  `F_DAY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '当班日期',
  `F_REPEATWEEKDAY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '周几重复，空不重复',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin COMMENT = '停机记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_eqpstoprecord
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqpworktime
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqpworktime`;
CREATE TABLE `mes_eqpworktime`  (
  `F_ID` bigint NOT NULL COMMENT '主键',
  `F_STARTTIME` datetime NOT NULL COMMENT '结束时间',
  `F_ENDTIME` datetime NOT NULL COMMENT '开始时间',
  `F_TIMENUM` double NOT NULL COMMENT '计算以半小时算',
  `F_USERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '用户id',
  `F_USERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '用户名称',
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_eqpworktime
-- ----------------------------

-- ----------------------------
-- Table structure for mes_equipment
-- ----------------------------
DROP TABLE IF EXISTS `mes_equipment`;
CREATE TABLE `mes_equipment`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_PARENTID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_EQPNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '设备名称',
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '设备描述',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_EQPSTATE` int NOT NULL,
  `F_EQPOWNER` int NULL DEFAULT NULL COMMENT '财产所属',
  `F_USEDATE` datetime NULL DEFAULT NULL COMMENT '接收日期',
  `F_PLANUSERNUM` int NULL DEFAULT NULL COMMENT '预计使用次数',
  `F_USEDNUM` int NULL DEFAULT NULL COMMENT '已使用次数',
  `F_MAINTAINNUM` int NULL DEFAULT NULL COMMENT '保养周期',
  `F_EQPTYPE` int NOT NULL COMMENT '设备类型',
  `F_ISMAINTAIN` tinyint NOT NULL COMMENT '是否需要保养',
  `F_ISOTHEREQP` tinyint NOT NULL COMMENT '是否加载流动设备',
  `F_MAINTAINTYPE` int NULL DEFAULT NULL COMMENT '保养类型',
  `F_EQPUSE` int NOT NULL COMMENT '设备用途',
  `F_MOLDINGNUM` int NULL DEFAULT NULL COMMENT '模具模数',
  `F_COMPANYNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '所属公司',
  `F_MOULDTYPE` int NULL DEFAULT NULL COMMENT '模具类型',
  `F_DIENUM` int NULL DEFAULT NULL COMMENT '模具号',
  `F_PLCSTATE` int NULL DEFAULT NULL COMMENT 'plc状态',
  `F_BATCHPREFIX` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '批次前缀',
  `F_BATCHTYPE` int NULL DEFAULT NULL COMMENT '批次类型(0、年月日班，1、年月日时分秒)',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '绑定物料',
  `F_OUTTRANSFERNUM` int NULL DEFAULT NULL COMMENT '产出容器限制',
  `F_PLANSTOPTIME` int NULL DEFAULT NULL COMMENT '固定停机时间分钟(min)',
  `F_OEE` int NULL DEFAULT NULL COMMENT 'OEE(%)',
  `F_BEAT` double NULL DEFAULT NULL COMMENT '节拍(s)',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_equipment
-- ----------------------------
INSERT INTO `mes_equipment` VALUES ('08daa9e9-a98f-4c62-8d93-8b2ca4612bfd', '0', '测试', 0, 1, '', '2022-10-09 19:30:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `mes_equipment` VALUES ('08dab179-3611-4de9-8330-073f186c6bc3', '0', '1111', 0, 1, '', '2022-10-19 10:25:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 7, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 0, 0, 0);

-- ----------------------------
-- Table structure for mes_equipmentstatusdate
-- ----------------------------
DROP TABLE IF EXISTS `mes_equipmentstatusdate`;
CREATE TABLE `mes_equipmentstatusdate`  (
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '设备的ID，（无主键）',
  `F_OFFLINETIMES` int NULL DEFAULT NULL COMMENT '离线累计秒数',
  `F_RUNTIMES` int NULL DEFAULT NULL COMMENT '运行累计秒数',
  `F_WARNINGTIMES` int NULL DEFAULT NULL COMMENT '报警累计秒数',
  `F_ERRORTIMES` int NULL DEFAULT NULL COMMENT '故障累计秒数',
  `F_OFFTIMES` int NULL DEFAULT NULL COMMENT '停机累计秒数',
  `F_DATE` date NULL DEFAULT NULL COMMENT '日期',
  `F_CURRQTY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '实时下料数',
  `F_LASTUPDATETIME` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `F_MSGSENDED` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '是否已钉钉通知'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_equipmentstatusdate
-- ----------------------------

-- ----------------------------
-- Table structure for mes_equipmentstatusdatebyhour
-- ----------------------------
DROP TABLE IF EXISTS `mes_equipmentstatusdatebyhour`;
CREATE TABLE `mes_equipmentstatusdatebyhour`  (
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '设备的ID，（无主键）',
  `F_OFFLINETIMES` int NULL DEFAULT NULL COMMENT '离线累计秒数',
  `F_RUNTIMES` int NULL DEFAULT NULL COMMENT '运行累计秒数',
  `F_WARNINGTIMES` int NULL DEFAULT NULL COMMENT '报警累计秒数',
  `F_ERRORTIMES` int NULL DEFAULT NULL COMMENT '故障累计秒数',
  `F_OFFTIMES` int NULL DEFAULT NULL COMMENT '停机累计秒数',
  `F_DATEHOUR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '日期小时',
  `F_DATE` date NULL DEFAULT NULL COMMENT '日期'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_equipmentstatusdatebyhour
-- ----------------------------

-- ----------------------------
-- Table structure for mes_equipmentstatuslog
-- ----------------------------
DROP TABLE IF EXISTS `mes_equipmentstatuslog`;
CREATE TABLE `mes_equipmentstatuslog`  (
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '设备的ID，（无主键）',
  `F_PLCSTATUS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '状态',
  `F_DATE` datetime NULL DEFAULT NULL COMMENT '日期'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_equipmentstatuslog
-- ----------------------------

-- ----------------------------
-- Table structure for mes_instorage
-- ----------------------------
DROP TABLE IF EXISTS `mes_instorage`;
CREATE TABLE `mes_instorage`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_INSTORAGECODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '入库单编号',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人id',
  `F_NUM` double NOT NULL COMMENT '数量',
  `F_DONENUM` double NOT NULL COMMENT '完成数量',
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_INSTORAGESTATE` int NOT NULL COMMENT '入库单状态',
  `F_BADNUM` double NULL DEFAULT NULL COMMENT '不良数量',
  `F_BATCHJSON` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '批号列表',
  `F_PLANTIME` datetime NULL DEFAULT NULL COMMENT '计划时间',
  `F_CARNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '车牌',
  `F_ISUSEREDIT` tinyint NULL DEFAULT NULL COMMENT '是否修改',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_instorage
-- ----------------------------

-- ----------------------------
-- Table structure for mes_instorageinfo
-- ----------------------------
DROP TABLE IF EXISTS `mes_instorageinfo`;
CREATE TABLE `mes_instorageinfo`  (
  `F_ID` bigint NOT NULL COMMENT 'id',
  `F_TRANSFERBOXCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流转箱编号',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_MATERIALBATCH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号批次',
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人id',
  `F_NUM` double NOT NULL COMMENT '数量',
  `F_INSTORAGEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '入库单id',
  `F_LOCATIONCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人',
  `F_BANDINGUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '绑定人id',
  `F_BANDINGUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '绑定人',
  `F_BANDINGTIME` datetime NULL DEFAULT NULL COMMENT '绑定时间',
  `F_ORIGINALBATCH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '原始批次',
  `F_ISTEMP` tinyint NULL DEFAULT NULL COMMENT '临时标识绑定中',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_instorageinfo
-- ----------------------------

-- ----------------------------
-- Table structure for mes_location
-- ----------------------------
DROP TABLE IF EXISTS `mes_location`;
CREATE TABLE `mes_location`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_AREAID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '库区id',
  `F_AREACODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '库区编号',
  `F_LOCATIONCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '库位编号',
  `F_SORTCODE` int NOT NULL COMMENT '顺序',
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LOCATIONSTATE` tinyint NOT NULL,
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '物料编号',
  `F_MATERIALNAME` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '物料名称',
  `F_LOCATIONTYPE` int NOT NULL COMMENT '库位类型(0正常，1临时)',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_location
-- ----------------------------

-- ----------------------------
-- Table structure for mes_locationmaterialbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_locationmaterialbanding`;
CREATE TABLE `mes_locationmaterialbanding`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_LOCATIONID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '库位id',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '物料id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '物料编号',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '物料名称',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_locationmaterialbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_material
-- ----------------------------
DROP TABLE IF EXISTS `mes_material`;
CREATE TABLE `mes_material`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号编号',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号名称',
  `F_MATERIALDESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALSIZE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号规格',
  `F_MATERIALBY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号材质',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_MATERIALPIC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '图片路径',
  `F_CUSTOMER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '客户',
  `F_CUSTOMERPRONO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '客户品号',
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_CPKSTDATA` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '零件cpk标准Json字符串',
  `F_MODELREFER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '参考模型',
  `F_NEEDCHECKOUT` tinyint NULL DEFAULT NULL COMMENT '是否需要检验',
  `F_WARMNUM` int NULL DEFAULT NULL COMMENT '预警值',
  `F_CONTAINERNUM` int NULL DEFAULT NULL COMMENT '容器值',
  `F_CHECKOUTDESCRIPTIONID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '检验说明id',
  `F_RECEIVENUM` int NOT NULL COMMENT '领料倍数限制',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_material
-- ----------------------------

-- ----------------------------
-- Table structure for mes_materialeqpbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_materialeqpbanding`;
CREATE TABLE `mes_materialeqpbanding`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号主键-1',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '设备主键-n',
  `F_EQPUSE` int NULL DEFAULT NULL COMMENT '设备用途',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_materialeqpbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_needcheck
-- ----------------------------
DROP TABLE IF EXISTS `mes_needcheck`;
CREATE TABLE `mes_needcheck`  (
  `F_ID` bigint NOT NULL COMMENT '主键',
  `F_ISCHECK` tinyint NOT NULL COMMENT '检验标识',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CHECKTYPE` int NOT NULL COMMENT '检验类型',
  `F_TRANSFERBOXCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流转箱编号',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号名称',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_MATERIALBATCH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号批次',
  `F_LOCATIONCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '库位号',
  `F_EQPNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备名称',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备Id',
  `F_NUM` double NULL DEFAULT NULL COMMENT '检验数量',
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '质检信息',
  `F_ISTWOCHECK` tinyint NULL DEFAULT NULL COMMENT '二次检验标识',
  `F_ISNEEDTWOCHECK` tinyint NULL DEFAULT NULL COMMENT '是否二次检验',
  `F_FINISHTIME` datetime NULL DEFAULT NULL COMMENT '检验完成时间',
  `F_TWOFINISHTIME` datetime NULL DEFAULT NULL COMMENT '二次检验完成时间',
  `F_SOURCEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '来源id',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_needcheck
-- ----------------------------

-- ----------------------------
-- Table structure for mes_order
-- ----------------------------
DROP TABLE IF EXISTS `mes_order`;
CREATE TABLE `mes_order`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_ORDERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '订单编号',
  `F_CUSTOMER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '客户',
  `F_PLANSTARTTIME` datetime NOT NULL COMMENT '计划开始时间',
  `F_PLANENDTIME` datetime NOT NULL COMMENT '计划结束时间',
  `F_DAYNUM` int NOT NULL COMMENT '天数',
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ISFINISH` tinyint NOT NULL COMMENT '完成状态',
  `F_PREDICTOVERTIME` datetime NULL DEFAULT NULL COMMENT '预期完成时间',
  `F_ACTUALOVERTIME` datetime NULL DEFAULT NULL COMMENT '实际完成时间',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_order
-- ----------------------------

-- ----------------------------
-- Table structure for mes_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `mes_orderdetail`;
CREATE TABLE `mes_orderdetail`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_ORDERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '订单Id',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_NEEDNUM` double NOT NULL COMMENT '需求数量',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for mes_outputinfo
-- ----------------------------
DROP TABLE IF EXISTS `mes_outputinfo`;
CREATE TABLE `mes_outputinfo`  (
  `F_ID` bigint NOT NULL COMMENT 'id',
  `F_TRANSFERBOXCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流转箱编号',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_MATERIALBATCH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号批次',
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人id',
  `F_NUM` double NOT NULL COMMENT '数量',
  `F_PROCESSID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工序Id',
  `F_PROCESSNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工序名称',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备Id',
  `F_EQPNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备名称',
  `F_WORKORDERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工单Id',
  `F_WORKORDERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工单编号',
  `F_WORKORDERRUNSORT` int NULL DEFAULT NULL COMMENT '执行顺序',
  `F_LOCATIONCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_WORKORDERDETAILID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工单明细Id',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人',
  `F_BANDINGUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '绑定人id',
  `F_BANDINGUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '绑定人',
  `F_BANDINGTIME` datetime NULL DEFAULT NULL COMMENT '绑定时间',
  `F_ISTEMP` tinyint NULL DEFAULT NULL COMMENT '临时标识绑定中',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_outputinfo
-- ----------------------------

-- ----------------------------
-- Table structure for mes_outstorage
-- ----------------------------
DROP TABLE IF EXISTS `mes_outstorage`;
CREATE TABLE `mes_outstorage`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_OUTSTORAGECODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '出库单编号',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人id',
  `F_NUM` double NOT NULL COMMENT '数量',
  `F_DONENUM` double NOT NULL COMMENT '完成数量',
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_OUTSTORAGESTATE` int NOT NULL COMMENT '出库单状态',
  `F_PLANTIME` datetime NULL DEFAULT NULL COMMENT '计划时间',
  `F_CARNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '车牌',
  `F_ORDERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '订单Id',
  `F_ISUSEREDIT` tinyint NULL DEFAULT NULL COMMENT '是否修改',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_outstorage
-- ----------------------------

-- ----------------------------
-- Table structure for mes_outstorageinfo
-- ----------------------------
DROP TABLE IF EXISTS `mes_outstorageinfo`;
CREATE TABLE `mes_outstorageinfo`  (
  `F_ID` bigint NOT NULL COMMENT 'id',
  `F_TRANSFERBOXCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流转箱编号',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_MATERIALBATCH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号批次',
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人id',
  `F_NUM` double NOT NULL COMMENT '数量',
  `F_OUTSTORAGEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '出库单id',
  `F_LOCATIONCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人',
  `F_BANDINGUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '绑定人id',
  `F_BANDINGUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '绑定人',
  `F_BANDINGTIME` datetime NULL DEFAULT NULL COMMENT '绑定时间',
  `F_TARGETTRANSFERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '装箱容器',
  `F_ISTEMP` tinyint NULL DEFAULT NULL COMMENT '临时标识绑定中',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_outstorageinfo
-- ----------------------------

-- ----------------------------
-- Table structure for mes_processeqpbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_processeqpbanding`;
CREATE TABLE `mes_processeqpbanding`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_PROCESSID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '工序主键-1',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '设备主键-1',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_processeqpbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_processflow
-- ----------------------------
DROP TABLE IF EXISTS `mes_processflow`;
CREATE TABLE `mes_processflow`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '工序id',
  `F_PROCESSFLOWNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '工序名称',
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '工序备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_processflow
-- ----------------------------

-- ----------------------------
-- Table structure for mes_readytransferbox
-- ----------------------------
DROP TABLE IF EXISTS `mes_readytransferbox`;
CREATE TABLE `mes_readytransferbox`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_TRANSFERBOXCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '流转箱编号',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备Id',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`F_ID`) USING BTREE,
  UNIQUE INDEX `MES_READYTRANSFERBOX_KEY1`(`F_TRANSFERBOXCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_readytransferbox
-- ----------------------------

-- ----------------------------
-- Table structure for mes_returnmaterial
-- ----------------------------
DROP TABLE IF EXISTS `mes_returnmaterial`;
CREATE TABLE `mes_returnmaterial`  (
  `F_ID` bigint NOT NULL COMMENT 'id',
  `F_TRANSFERBOXCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流转箱编号',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_MATERIALBATCH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号批次',
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人id',
  `F_NUM` double NOT NULL COMMENT '数量',
  `F_PROCESSID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工序Id',
  `F_PROCESSNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工序名称',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备Id',
  `F_EQPNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备名称',
  `F_WORKORDERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工单Id',
  `F_WORKORDERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工单编号',
  `F_WORKORDERRUNSORT` int NULL DEFAULT NULL COMMENT '执行顺序',
  `F_LOCATIONCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_WORKORDERDETAILID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工单明细Id',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_returnmaterial
-- ----------------------------

-- ----------------------------
-- Table structure for mes_scapimage
-- ----------------------------
DROP TABLE IF EXISTS `mes_scapimage`;
CREATE TABLE `mes_scapimage`  (
  `F_ID` bigint NOT NULL COMMENT 'id',
  `F_SCAPID` bigint NOT NULL COMMENT '可疑id',
  `F_FILEPATH` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '上传路径',
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '缺陷信息',
  `F_DESCRIPTIONID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '缺陷id',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_scapimage
-- ----------------------------

-- ----------------------------
-- Table structure for mes_scapmaterial
-- ----------------------------
DROP TABLE IF EXISTS `mes_scapmaterial`;
CREATE TABLE `mes_scapmaterial`  (
  `F_ID` bigint NOT NULL COMMENT 'id',
  `F_BATCHCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '条码编号',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_MATERIALBATCH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号批次',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人id',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人',
  `F_CHECKID` bigint NOT NULL COMMENT '检验id',
  `F_CHECKTYPE` int NOT NULL COMMENT '检验类型',
  `F_ISCHECK` tinyint NOT NULL COMMENT '检验完成',
  `F_ISTEMP` tinyint NOT NULL COMMENT '临时表示还在常规质检',
  `F_NUM` double NOT NULL COMMENT '可疑数量',
  `F_SCAPNUM` double NOT NULL COMMENT '报废数量',
  `F_RETURNNUM` double NOT NULL COMMENT '退回数量',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_scapmaterial
-- ----------------------------

-- ----------------------------
-- Table structure for mes_scapmaterialreturn
-- ----------------------------
DROP TABLE IF EXISTS `mes_scapmaterialreturn`;
CREATE TABLE `mes_scapmaterialreturn`  (
  `F_ID` bigint NOT NULL COMMENT 'id',
  `F_BATCHCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '条码编号',
  `F_SCAPMATERIALID` bigint NOT NULL COMMENT '可疑物料Id',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_MATERIALBATCH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号批次',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人id',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人',
  `F_NUM` double NOT NULL COMMENT '退回数量',
  `F_TRANSFERBOXCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '退回流转箱编号',
  `F_BACKMATERIALBATCH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '退回料号批次',
  `F_ISPRODUCE` tinyint NOT NULL COMMENT '是否生产',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_scapmaterialreturn
-- ----------------------------

-- ----------------------------
-- Table structure for mes_storage
-- ----------------------------
DROP TABLE IF EXISTS `mes_storage`;
CREATE TABLE `mes_storage`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_TRANSFERBOXCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流转箱编号',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_MATERIALBATCH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号批次',
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人id',
  `F_NUM` double NOT NULL COMMENT '数量',
  `F_LOCATIONCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ISCHECKOUT` tinyint NOT NULL,
  `F_BATCHID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '批次Id',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_storage
-- ----------------------------

-- ----------------------------
-- Table structure for mes_storagechangeinfo
-- ----------------------------
DROP TABLE IF EXISTS `mes_storagechangeinfo`;
CREATE TABLE `mes_storagechangeinfo`  (
  `F_ID` bigint NOT NULL COMMENT 'id',
  `F_TRANSFERBOXCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流转箱编号',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_MATERIALCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号描述',
  `F_MATERIALUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号单位',
  `F_MATERIALTYPE` int NOT NULL COMMENT '料号分类',
  `F_MATERIALBATCH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号批次',
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人id',
  `F_NUM` double NOT NULL COMMENT '转移数量',
  `F_LOCATIONCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '库位编号',
  `F_NEWLOCATIONCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '新库位编号',
  `F_NEWTRANSFERBOXCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '新流转箱编号',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人',
  `F_STORAGEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_CHANGETYPE` int NULL DEFAULT NULL COMMENT '变动类型',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_storagechangeinfo
-- ----------------------------

-- ----------------------------
-- Table structure for mes_transferbox
-- ----------------------------
DROP TABLE IF EXISTS `mes_transferbox`;
CREATE TABLE `mes_transferbox`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_TRANSFERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流转箱编号',
  `F_TRANSFERTYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流转箱类型',
  `F_TRANSFERMAXNUM` double NOT NULL COMMENT '流转箱最大数',
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_TRANSFERSTATE` int NULL DEFAULT NULL COMMENT '流转箱状态',
  `F_LOCATIONCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '库位编号',
  `F_ISTEMP` tinyint NULL DEFAULT NULL COMMENT '是否一次性',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_transferbox
-- ----------------------------

-- ----------------------------
-- Table structure for mes_transferboxbatch
-- ----------------------------
DROP TABLE IF EXISTS `mes_transferboxbatch`;
CREATE TABLE `mes_transferboxbatch`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_BATCHNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '容器条码名称',
  `F_MAXNUM` int NOT NULL COMMENT '容器最大数',
  `F_BATCHCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '编号前缀',
  `F_BATCHNUM` bigint NULL DEFAULT NULL COMMENT '当前编号',
  `F_ISCHECK` tinyint NULL DEFAULT NULL COMMENT '是否质检',
  PRIMARY KEY (`F_ID`) USING BTREE,
  UNIQUE INDEX `MES_TRANFERBOXBATCH_KEY1`(`F_BATCHCODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_transferboxbatch
-- ----------------------------

-- ----------------------------
-- Table structure for mes_transfertypematerialbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_transfertypematerialbanding`;
CREATE TABLE `mes_transfertypematerialbanding`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_TRANSFERTYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流转箱类型',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '物料Id',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_transfertypematerialbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_workdetaileqpbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_workdetaileqpbanding`;
CREATE TABLE `mes_workdetaileqpbanding`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_WORKORDERDETAILID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '工单明细Id',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '设备Id',
  `F_EQPTYPE` int NOT NULL COMMENT '设备类型',
  `F_EQPUSE` int NOT NULL COMMENT '设备用途',
  `F_MOULDNUM` int NOT NULL COMMENT '模块使用数',
  `F_ISMASTER` tinyint NOT NULL COMMENT '是否主设备',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_workdetaileqpbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_workdetailprocessbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_workdetailprocessbanding`;
CREATE TABLE `mes_workdetailprocessbanding`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_WORKORDERDETAILID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '工单明细Id',
  `F_PROCESSID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '工序Id',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_workdetailprocessbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_workdetailtimebanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_workdetailtimebanding`;
CREATE TABLE `mes_workdetailtimebanding`  (
  `F_ID` bigint NOT NULL COMMENT 'id',
  `F_WORKORDERDETAILID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '明细id',
  `F_EQPWORKTIMEID` bigint NOT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_workdetailtimebanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_workorder
-- ----------------------------
DROP TABLE IF EXISTS `mes_workorder`;
CREATE TABLE `mes_workorder`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_WORKORDERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '工单编号',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_PLANNUM` int NOT NULL COMMENT '计划数量',
  `F_DONENUM` int NOT NULL COMMENT '完成数量',
  `F_BADNUM` int NOT NULL COMMENT '不良数量',
  `F_WORKORDERSTATE` int NOT NULL COMMENT '工单状态',
  `F_PLANSTARTTIME` datetime NULL DEFAULT NULL COMMENT '计划开始时间',
  `F_PLANENDTIME` datetime NULL DEFAULT NULL COMMENT '计划结束时间',
  `F_REALSTARTTIME` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `F_REALENDTIME` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_SPLITTYPE` int NOT NULL,
  `F_WORKPLANID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '计划ID',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_workorder
-- ----------------------------

-- ----------------------------
-- Table structure for mes_workorderdetail
-- ----------------------------
DROP TABLE IF EXISTS `mes_workorderdetail`;
CREATE TABLE `mes_workorderdetail`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_WORKORDERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '工单编号',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '料号Id',
  `F_PLANNUM` double NOT NULL COMMENT '计划数量',
  `F_DONENUM` double NOT NULL COMMENT '完成数量',
  `F_BADNUM` double NOT NULL COMMENT '不良数量',
  `F_WORKORDERSTATE` int NOT NULL COMMENT '工单状态',
  `F_PLANSTARTTIME` datetime NULL DEFAULT NULL COMMENT '计划开始时间',
  `F_PLANENDTIME` datetime NULL DEFAULT NULL COMMENT '计划结束时间',
  `F_REALSTARTTIME` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `F_REALENDTIME` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_RUNSORT` int NULL DEFAULT NULL COMMENT '执行顺序',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_workorderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for mes_workorderdetaildata
-- ----------------------------
DROP TABLE IF EXISTS `mes_workorderdetaildata`;
CREATE TABLE `mes_workorderdetaildata`  (
  `F_WORKORDERDETAILID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '子工单ID',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '设备ID',
  `F_DATATABLE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '数据采集表名（HotlineData,WeldlineData,LaserlineData）',
  `F_DATATABLEID` bigint NULL DEFAULT NULL COMMENT '数据采集表记录ID',
  `F_MOULDNUM` int NULL DEFAULT NULL COMMENT '每次产出数'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_workorderdetaildata
-- ----------------------------

-- ----------------------------
-- Table structure for mes_workplan
-- ----------------------------
DROP TABLE IF EXISTS `mes_workplan`;
CREATE TABLE `mes_workplan`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'id',
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '计划说明',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DATE` date NULL DEFAULT NULL COMMENT '计划日期',
  `F_CLASSNUM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '班别（A白班，B夜班）',
  `F_EQPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备Id',
  `F_EQPNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '设备名称',
  `F_MATERIALID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '料号Id',
  `F_PLANNUM` double NOT NULL COMMENT '计划数量',
  `F_DONENUM` double NOT NULL COMMENT '完成数量',
  `F_WORKPLANTYPE` int NOT NULL COMMENT '计划类型',
  `F_ISUSEREDIT` tinyint NULL DEFAULT NULL COMMENT '是否修改',
  `F_PROCESSID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工序',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_workplan
-- ----------------------------

-- ----------------------------
-- Table structure for mob_dingtalkconfig
-- ----------------------------
DROP TABLE IF EXISTS `mob_dingtalkconfig`;
CREATE TABLE `mob_dingtalkconfig`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_DINGTYPE` int NOT NULL,
  `F_ISWEBLOGIN` tinyint NOT NULL,
  `F_APPNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_REDIRECTURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_APPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_APPSECRET` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_AGENTID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_APPKEY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ISDINGINFO` tinyint NOT NULL,
  `F_URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ISBOARDLOGIN` tinyint NOT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mob_dingtalkconfig
-- ----------------------------
INSERT INTO `mob_dingtalkconfig` VALUES ('08d94c02-7cb6-4275-8b5a-b344e494df63', 1, 0, '看板Web', 'http://127.0.0.1:8082/BoardLogin/DingLogin', 'xxxxxxxx', 'xxxxxxxxxx', '', 0, 1, '', '2021-07-21 12:46:22', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, '2022-10-19 10:08:29', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '', 0, 'http://127.0.0.1:8082/', 1);
INSERT INTO `mob_dingtalkconfig` VALUES ('0a26a181-c0bf-414b-8e54-f688796858b1', 0, 0, 'MES小程序', '', '', 'xxxxxx', 'xxxx', 0, 1, '', '2020-11-21 10:43:11', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, '2022-10-19 10:09:04', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 'xxxxxx', 1, '', 0);
INSERT INTO `mob_dingtalkconfig` VALUES ('5353df01-dc34-4dc2-bd4b-6cf155ef00e4', 1, 1, 'MES系统PC端', 'http://127.0.0.1:8082/Login/DingLogin', 'xxxxxxxxx', 'xxxxxxxxx', '', 0, 1, '', '2020-11-21 10:35:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, '2022-10-19 10:09:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '', 0, 'http://127.0.0.1:8082/', 0);
INSERT INTO `mob_dingtalkconfig` VALUES ('fb494f74-e9f5-4ce6-8dac-2a922cf5c8a8', 2, 0, 'Mes系统移动端', '', '', 'xxxxxxx', 'xxxxx', 0, 1, '', '2020-11-23 09:06:28', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, '2022-10-19 10:08:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 'xxxxxxxx', 1, 'http://127.0.0.1:8082/', 0);

-- ----------------------------
-- Table structure for mob_dinguser
-- ----------------------------
DROP TABLE IF EXISTS `mob_dinguser`;
CREATE TABLE `mob_dinguser`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_SYSUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '系统用户Id',
  `F_USERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '员工唯一标识ID',
  `F_USERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '成员名称',
  `F_ACTIVE` tinyint NULL DEFAULT NULL COMMENT '是否已经激活',
  `F_ORDERINDEPTS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '在对应的部门中的排序，Map结构的json字符串，key是部门的Id，value是人员在这个部门的排序值',
  `F_ISADMIN` tinyint NULL DEFAULT NULL COMMENT '是否为企业的管理员',
  `F_ISBOSS` tinyint NULL DEFAULT NULL COMMENT '是否为企业的老板',
  `F_UNIONID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '在当前isv全局范围内唯一标识一个用户的身份,用户无法修改',
  `F_ISLEADERINDEPTS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '在对应的部门中是否为主管：Map结构的json字符串，key是部门的Id，value是人员在这个部门中是否为主管，true表示是，false表示不是',
  `F_ISLEADER` tinyint NULL DEFAULT NULL COMMENT ' 是否是部门的主管',
  `F_ISHIDE` tinyint NULL DEFAULT NULL COMMENT '是否号码隐藏',
  `F_DEPARTMENTID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '成员所属部门id列表',
  `F_POSITION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '职位信息',
  `F_AVATAR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '头像url',
  `F_HIREDDATE` datetime NULL DEFAULT NULL COMMENT '入职时间',
  `F_JOBNUMBER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '员工工号',
  `F_ISSENIOR` tinyint NULL DEFAULT NULL COMMENT '是否是高管',
  `F_EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '电子邮件',
  `F_MOBILE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '手机号码',
  `F_ORDER` int NULL DEFAULT NULL COMMENT '部门排序',
  `F_WORKPLACE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '工作地',
  `F_ROLESID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '新增的钉钉用户在系统中的角色',
  `F_ISWORK` tinyint NULL DEFAULT NULL COMMENT '是否在班',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mob_dinguser
-- ----------------------------

-- ----------------------------
-- Table structure for oms_flowinstance
-- ----------------------------
DROP TABLE IF EXISTS `oms_flowinstance`;
CREATE TABLE `oms_flowinstance`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '主键Id',
  `F_INSTANCESCHEMEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '流程实例模板Id',
  `F_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '实例编号',
  `F_CUSTOMNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '自定义名称',
  `F_ACTIVITYID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '当前节点ID',
  `F_ACTIVITYTYPE` int NULL DEFAULT NULL COMMENT '当前节点类型（0会签节点）',
  `F_ACTIVITYNAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '当前节点名称',
  `F_PREVIOUSID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '前一个ID',
  `F_SCHEMECONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '流程模板内容',
  `F_SCHEMEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '流程模板ID',
  `F_DBNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '数据库名称',
  `F_FRMDATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '表单数据',
  `F_FRMTYPE` int NOT NULL COMMENT '表单类型',
  `F_FRMCONTENTDATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '表单字段',
  `F_FRMCONTENTPARSE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '表单参数（冗余）',
  `F_FRMID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '表单ID',
  `F_SCHEMETYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '流程类型',
  `F_FLOWLEVEL` int NOT NULL COMMENT '等级',
  `F_DESCRIPTION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '实例备注',
  `F_ISFINISH` int NOT NULL COMMENT '是否完成',
  `F_MAKERLIST` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '执行人',
  `F_ORGANIZEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '所属部门',
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL COMMENT '有效',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建用户主键',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建用户',
  `F_FRMCONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '表单元素json',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin COMMENT = '工作流流程实例表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_flowinstance
-- ----------------------------

-- ----------------------------
-- Table structure for oms_flowinstancehis
-- ----------------------------
DROP TABLE IF EXISTS `oms_flowinstancehis`;
CREATE TABLE `oms_flowinstancehis`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '主键Id',
  `F_INSTANCEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '实例Id',
  `F_FROMNODEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '开始节点Id',
  `F_FROMNODETYPE` int NULL DEFAULT NULL COMMENT '开始节点类型',
  `F_FROMNODENAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '开始节点名称',
  `F_TONODEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '结束节点Id',
  `F_TONODETYPE` int NULL DEFAULT NULL COMMENT '结束节点类型',
  `F_TONODENAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '结束节点名称',
  `F_TRANSITIONSATE` tinyint NOT NULL COMMENT '转化状态',
  `F_ISFINISH` tinyint NOT NULL COMMENT '是否结束',
  `F_CREATORTIME` datetime NOT NULL COMMENT '转化时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '操作人Id',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '操作人名称',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin COMMENT = '工作流实例流转历史记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_flowinstancehis
-- ----------------------------

-- ----------------------------
-- Table structure for oms_flowinstanceinfo
-- ----------------------------
DROP TABLE IF EXISTS `oms_flowinstanceinfo`;
CREATE TABLE `oms_flowinstanceinfo`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '主键Id',
  `F_INSTANCEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '实例进程Id',
  `F_CONTENT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '操作内容',
  `F_CREATORTIME` datetime NOT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建用户主键',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin COMMENT = '工作流实例操作记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_flowinstanceinfo
-- ----------------------------

-- ----------------------------
-- Table structure for oms_formtest
-- ----------------------------
DROP TABLE IF EXISTS `oms_formtest`;
CREATE TABLE `oms_formtest`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT 'ID',
  `F_USERNAME` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '请假人姓名',
  `F_REQUESTTYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '请假分类，病假，事假，公休等',
  `F_STARTTIME` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `F_ENDTIME` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `F_REQUESTCOMMENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '请假说明',
  `F_ATTACHMENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '附件，用于提交病假证据等',
  `F_CREATORTIME` datetime NOT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建用户主键',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建用户',
  `F_FLOWINSTANCEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '所属流程ID',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin COMMENT = '模拟一个自定页面的表单，该数据会关联到流程实例FrmData，可用于复杂页面的设计及后期的数据分析' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_formtest
-- ----------------------------

-- ----------------------------
-- Table structure for oms_message
-- ----------------------------
DROP TABLE IF EXISTS `oms_message`;
CREATE TABLE `oms_message`  (
  `F_ID` bigint NOT NULL COMMENT '主键Id',
  `F_MESSAGETYPE` int NULL DEFAULT NULL COMMENT '信息类型（通知、私信、处理）',
  `F_TOUSERID` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '收件人主键',
  `F_TOUSERNAME` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '收件人',
  `F_MESSAGEINFO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '内容',
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL COMMENT '有效',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建用户主键',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建用户',
  `F_HREFTARGET` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '跳转类型',
  `F_HREF` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '跳转地址',
  `F_KEYVALUE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '待办关联键',
  `F_CLICKREAD` tinyint NULL DEFAULT NULL COMMENT '点击已读',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_message
-- ----------------------------

-- ----------------------------
-- Table structure for oms_messagehis
-- ----------------------------
DROP TABLE IF EXISTS `oms_messagehis`;
CREATE TABLE `oms_messagehis`  (
  `F_ID` bigint NOT NULL COMMENT '主键Id',
  `F_MESSAGEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '信息Id',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建用户主键',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_messagehis
-- ----------------------------

-- ----------------------------
-- Table structure for oms_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `oms_uploadfile`;
CREATE TABLE `oms_uploadfile`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '主键Id',
  `F_FILEPATH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '文件路径',
  `F_FILENAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '文件名称',
  `F_FILETYPE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '文件类型（0 文件，1 图片）',
  `F_FILESIZE` int NULL DEFAULT NULL COMMENT '文件大小',
  `F_FILEEXTENSION` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '文件扩展名',
  `F_FILEBY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '文件所属',
  `F_DESCRIPTION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '备注',
  `F_ORGANIZEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '所属部门',
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL COMMENT '有效',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建用户主键',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`F_ID`) USING BTREE,
  INDEX `IX_OMS_UPLOADFILE`(`F_FILENAME`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_uploadfile
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dataprivilegerule
-- ----------------------------
DROP TABLE IF EXISTS `sys_dataprivilegerule`;
CREATE TABLE `sys_dataprivilegerule`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_MODULEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_MODULECODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_PRIVILEGERULES` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_SORTCODE` int NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE,
  INDEX `XK_DATAPRIVILEGERULE_1`(`F_MODULEID`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dataprivilegerule
-- ----------------------------

-- ----------------------------
-- Table structure for sys_filterip
-- ----------------------------
DROP TABLE IF EXISTS `sys_filterip`;
CREATE TABLE `sys_filterip`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_TYPE` tinyint NULL DEFAULT NULL,
  `F_STARTIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ENDIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_SORTCODE` int NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_ENDTIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_filterip
-- ----------------------------

-- ----------------------------
-- Table structure for sys_flowscheme
-- ----------------------------
DROP TABLE IF EXISTS `sys_flowscheme`;
CREATE TABLE `sys_flowscheme`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '主键Id',
  `F_SCHEMECODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '流程编号',
  `F_SCHEMENAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '流程名称',
  `F_SCHEMETYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '流程分类',
  `F_SCHEMEVERSION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '流程内容版本',
  `F_SCHEMECANUSER` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '流程模板使用者',
  `F_SCHEMECONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '流程内容',
  `F_FRMID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '表单ID',
  `F_FRMTYPE` int NOT NULL COMMENT '表单类型',
  `F_AUTHORIZETYPE` int NOT NULL COMMENT '模板权限类型：0完全公开,1指定部门/人员',
  `F_SORTCODE` int NULL DEFAULT NULL COMMENT '排序码',
  `F_DELETEMARK` tinyint NULL DEFAULT NULL COMMENT '删除标记',
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL COMMENT '有效',
  `F_DESCRIPTION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建用户主键',
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建用户',
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '修改用户主键',
  `F_LASTMODIFYUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '修改用户',
  `F_ORGANIZEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '所属部门',
  `F_DELETETIME` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin COMMENT = '工作流模板信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_flowscheme
-- ----------------------------

-- ----------------------------
-- Table structure for sys_form
-- ----------------------------
DROP TABLE IF EXISTS `sys_form`;
CREATE TABLE `sys_form`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '表单模板Id',
  `F_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '表单名称',
  `F_FRMTYPE` int NULL DEFAULT NULL COMMENT '表单类型，0：默认动态表单；1：Web自定义表单',
  `F_WEBID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '系统页面标识，当表单类型为用Web自定义的表单时，需要标识加载哪个页面',
  `F_FIELDS` int NULL DEFAULT NULL COMMENT '字段个数',
  `F_CONTENTDATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '表单中的控件属性描述',
  `F_CONTENTPARSE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '表单控件位置模板',
  `F_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '表单原html模板未经处理的',
  `F_SORTCODE` int NULL DEFAULT NULL COMMENT '排序码',
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL COMMENT '是否启用',
  `F_DELETEMARK` tinyint NULL DEFAULT NULL COMMENT '逻辑删除标志',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '创建人',
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL COMMENT '最后修改时间',
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '最后修改人',
  `F_DELETETIME` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '删除人',
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '内容',
  `F_ORGANIZEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '所属组织',
  `F_DBNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '数据库名称',
  PRIMARY KEY (`F_ID`) USING BTREE,
  INDEX `IX_SYS_FORM`(`F_NAME`) USING BTREE COMMENT '唯一'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin COMMENT = '表单模板表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_form
-- ----------------------------
INSERT INTO `sys_form` VALUES ('c4ddd0df-c29c-4d1d-b406-0c59b91236a4', '222', 0, '', 8, 'input_2,password_3,radio_6,select_7,date_14,input_15,rate_11,editor_16', NULL, '[\n    {\n        \"id\": \"grid_1\",\n        \"index\": 0,\n        \"tag\": \"grid\",\n        \"span\": 2,\n        \"columns\": [\n            {\n                \"span\": 12,\n                \"list\": [\n                    {\n                        \"id\": \"input_2\",\n                        \"index\": 0,\n                        \"label\": \"用户名\",\n                        \"tag\": \"input\",\n                        \"tagIcon\": \"input\",\n                        \"placeholder\": \"请输入\",\n                        \"defaultValue\": null,\n                        \"labelWidth\": null,\n                        \"width\": \"100%\",\n                        \"clearable\": true,\n                        \"maxlength\": null,\n                        \"showWordLimit\": false,\n                        \"readonly\": false,\n                        \"disabled\": false,\n                        \"required\": true,\n                        \"expression\": \"string\",\n                        \"document\": \"\"\n                    }\n                ]\n            },\n            {\n                \"span\": 12,\n                \"list\": [\n                    {\n                        \"id\": \"password_3\",\n                        \"index\": 0,\n                        \"label\": \"密码\",\n                        \"tag\": \"password\",\n                        \"tagIcon\": \"password\",\n                        \"placeholder\": \"请输入\",\n                        \"defaultValue\": null,\n                        \"labelWidth\": null,\n                        \"width\": \"100%\",\n                        \"clearable\": true,\n                        \"maxlength\": null,\n                        \"showWordLimit\": false,\n                        \"readonly\": false,\n                        \"disabled\": false,\n                        \"required\": true,\n                        \"document\": \"\"\n                    }\n                ]\n            }\n        ]\n    },\n    {\n        \"id\": \"grid_4\",\n        \"index\": 1,\n        \"tag\": \"grid\",\n        \"span\": 2,\n        \"columns\": [\n            {\n                \"span\": 12,\n                \"list\": [\n                    {\n                        \"id\": \"radio_6\",\n                        \"index\": 0,\n                        \"label\": \"性别\",\n                        \"tag\": \"radio\",\n                        \"tagIcon\": \"radio\",\n                        \"labelWidth\": null,\n                        \"width\": \"100%\",\n                        \"disabled\": false,\n                        \"required\": true,\n                        \"document\": \"\",\n                        \"options\": [\n                            {\n                                \"text\": \"男\",\n                                \"value\": \"value1\"\n                            },\n                            {\n                                \"text\": \"女\",\n                                \"value\": \"value2\"\n                            }\n                        ]\n                    }\n                ]\n            },\n            {\n                \"span\": 12,\n                \"list\": [\n                    {\n                        \"id\": \"select_7\",\n                        \"index\": 0,\n                        \"label\": \"类型\",\n                        \"tag\": \"select\",\n                        \"tagIcon\": \"select\",\n                        \"labelWidth\": null,\n                        \"width\": \"100%\",\n                        \"disabled\": false,\n                        \"required\": true,\n                        \"document\": \"\",\n                        \"optionType\": \"local\",\n                        \"remoteUrl\": \"http://www.fishpro.com.cn/demo1/\",\n                        \"remoteMethod\": \"post\",\n                        \"remoteOptionText\": \"options.data.dictName\",\n                        \"remoteOptionValue\": \"options.data.dictId\",\n                        \"remoteDefaultValue\": \"12\",\n                        \"options\": [\n                            {\n                                \"text\": \"管理员\",\n                                \"value\": \"value122\"\n                            },\n                            {\n                                \"text\": \"供应商\",\n                                \"value\": \"value2333\"\n                            },\n                            {\n                                \"text\": \"经销商\",\n                                \"value\": \"value3\"\n                            }\n                        ]\n                    }\n                ]\n            }\n        ]\n    },\n    {\n        \"id\": \"grid_12\",\n        \"index\": 2,\n        \"tag\": \"grid\",\n        \"span\": 2,\n        \"columns\": [\n            {\n                \"span\": 12,\n                \"list\": [\n                    {\n                        \"id\": \"date_14\",\n                        \"index\": 0,\n                        \"label\": \"出生日期\",\n                        \"tag\": \"date\",\n                        \"tagIcon\": \"date\",\n                        \"labelWidth\": null,\n                        \"width\": \"100%\",\n                        \"clearable\": true,\n                        \"maxlength\": null,\n                        \"defaultValue\": null,\n                        \"datetype\": \"date\",\n                        \"range\": false,\n                        \"dateformat\": \"yyyy-MM-dd\",\n                        \"isInitValue\": false,\n                        \"maxValue\": \"9999-12-31\",\n                        \"minValue\": \"1900-1-1\",\n                        \"trigger\": null,\n                        \"position\": \"absolute\",\n                        \"theme\": \"default\",\n                        \"mark\": null,\n                        \"showBottom\": true,\n                        \"zindex\": 66666666,\n                        \"readonly\": false,\n                        \"disabled\": false,\n                        \"required\": true,\n                        \"document\": \"\"\n                    }\n                ]\n            },\n            {\n                \"span\": 12,\n                \"list\": [\n                    {\n                        \"id\": \"input_15\",\n                        \"index\": 0,\n                        \"label\": \"身份证号\",\n                        \"tag\": \"input\",\n                        \"tagIcon\": \"input\",\n                        \"placeholder\": \"输入身份证号\",\n                        \"defaultValue\": null,\n                        \"labelWidth\": null,\n                        \"width\": \"100%\",\n                        \"clearable\": true,\n                        \"maxlength\": null,\n                        \"showWordLimit\": false,\n                        \"readonly\": false,\n                        \"disabled\": false,\n                        \"required\": true,\n                        \"expression\": \"string\",\n                        \"document\": \"\"\n                    }\n                ]\n            }\n        ]\n    },\n    {\n        \"id\": \"rate_11\",\n        \"index\": 3,\n        \"label\": \"用户评价\",\n        \"tag\": \"rate\",\n        \"tagIcon\": \"rate\",\n        \"labelWidth\": null,\n        \"defaultValue\": 0,\n        \"rateLength\": 5,\n        \"half\": false,\n        \"text\": false,\n        \"theme\": \"default\",\n        \"showBottom\": true,\n        \"readonly\": false,\n        \"required\": true,\n        \"document\": \"\"\n    },\n    {\n        \"id\": \"editor_16\",\n        \"index\": 4,\n        \"label\": \"备注\",\n        \"tag\": \"editor\",\n        \"tagIcon\": \"editor\",\n        \"placeholder\": \"请输入\",\n        \"defaultValue\": null,\n        \"labelWidth\": null,\n        \"width\": \"100%\",\n        \"clearable\": true,\n        \"maxlength\": null,\n        \"showWordLimit\": false,\n        \"tool\": [],\n        \"hideTool\": [],\n        \"height\": \"120px\",\n        \"uploadImage\": {},\n        \"readonly\": false,\n        \"disabled\": false,\n        \"required\": true,\n        \"document\": \"\"\n    }\n]', 2, 1, 0, '2021-03-05 11:55:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-11 10:33:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '', '', NULL);

-- ----------------------------
-- Table structure for sys_items
-- ----------------------------
DROP TABLE IF EXISTS `sys_items`;
CREATE TABLE `sys_items`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_PARENTID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ENCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_FULLNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ISTREE` tinyint NULL DEFAULT NULL,
  `F_LAYERS` int NULL DEFAULT NULL,
  `F_SORTCODE` int NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE,
  INDEX `IX_SYS_ITEMS`(`F_ENCODE`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_items
-- ----------------------------
INSERT INTO `sys_items` VALUES ('002eeaa9-c804-4c98-afd9-7ddc7c1e4c46', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_ControlJobType', '调度任务类型', 0, 2, 12, 0, 1, '', '2021-01-20 09:35:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('00F76465-DBBA-484A-B75C-E81DEE9313E6', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', 'Education', '学历', 0, 2, 8, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('08d9344e-25dc-40ab-8eeb-473d9321c7e2', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_StopConfig', '急停停机配置', 0, 2, 14, 0, 1, '', '2021-06-21 08:47:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('08d93f50-133e-4fe7-860d-4dd9cd33cfe5', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_ScapType', '可疑状态', 0, 2, 15, 0, 1, '', '2021-07-05 08:59:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('0DF5B725-5FB8-487F-B0E4-BC563A77EB04', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', 'DbType', '数据库类型', 0, 2, 4, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('15023A4E-4856-44EB-BE71-36A106E2AA59', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', '103', '民族', 0, 2, 14, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('2748F35F-4EE2-417C-A907-3453146AAF67', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', 'Certificate', '证件名称', 0, 2, 7, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('2e440789-bd9b-46a5-9a64-190163f8a9cf', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_EqpState', '设备状态', 0, 2, 1, 0, 1, '', '2020-11-30 14:45:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-01 15:51:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_items` VALUES ('3d2fc3d0-ef1c-41c2-9ca0-cf027dc7a854', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_EqpType', '设备类型', 0, 2, 0, 0, 1, '', '2020-11-30 14:35:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-01 15:51:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_items` VALUES ('5da129a3-45ce-43cf-a483-e7f9ad90297d', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_MouldType', '模具类型', 0, 2, 5, 0, 1, '', '2020-12-01 10:16:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-01 15:52:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_items` VALUES ('64c10822-0c85-4516-9b59-879b818547ae', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', 'MessageType', '信息类型', 0, 2, 16, 0, 1, '', '2020-07-29 16:51:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('77070117-3F1A-41BA-BF81-B8B85BF10D5E', '0', 'Sys_Items', '通用字典', 1, 1, 1, 0, 1, NULL, NULL, NULL, '2020-04-20 17:17:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_items` VALUES ('7e0b19a6-89f5-4802-bf76-0a692a518473', '0', 'Mob_Items', '移动端', 0, 1, 3, 0, 1, '', '2020-11-21 10:02:12', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('8742966f-322c-4ed8-b737-ffee53d85a5d', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_AreaType', '库区类型', 0, 2, 10, 0, 1, '', '2020-12-17 09:37:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', '0', 'Mes_Items', 'Mes字典', 0, 1, 2, 0, 1, '', '2020-11-18 10:32:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('885d3b97-ae33-4cb6-b7b0-e1a7e72f6de2', '7e0b19a6-89f5-4802-bf76-0a692a518473', 'Mob_DingType', '钉钉应用类型', 0, 2, 0, 0, 1, '', '2020-11-21 10:02:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-11-21 10:31:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_items` VALUES ('8CEB2F71-026C-4FA6-9A61-378127AE7320', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', '102', '生育', 0, 2, 13, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('954AB9A1-9928-4C6D-820A-FC1CDC85CDE0', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', 'AuditState', '审核状态', 0, 2, 6, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('9EB4602B-BF9A-4710-9D80-C73CE89BEC5D', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', 'OrganizeCategory', '机构分类', 0, 2, 2, 0, 1, NULL, NULL, NULL, '2020-04-28 09:07:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_items` VALUES ('9a7079bd-0660-4549-9c2d-db5e8616619f', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', 'DbLogType', '系统日志', 0, 2, 16, 0, 1, NULL, '2016-07-19 17:09:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('BDD797C3-2323-4868-9A63-C8CC3437AEAA', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', '104', '性别', 0, 2, 15, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('D94E4DC1-C2FD-4D19-9D5D-3886D39900CE', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', 'RoleType', '角色类型', 0, 2, 3, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('FA7537E2-1C64-4431-84BF-66158DD63269', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', '101', '婚姻', 0, 2, 12, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('a7faf382-c88c-43e1-aff3-98f261a693ea', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_TransferType', '流转箱类型', 0, 2, 8, 0, 1, '', '2020-12-14 12:39:09', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('bf06d1e0-cfde-40c9-954c-df930e26e319', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_EqpUse', '设备用途', 0, 2, 3, 0, 1, '', '2020-11-30 15:03:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-01 15:51:53', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_items` VALUES ('c2a3ec97-e4f0-46a5-addf-1ba4e40e2ab9', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_WorkOrderState', '工单状态', 0, 2, 7, 0, 1, '', '2020-12-07 13:39:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('cd6a17c3-34ca-44d3-a072-4f75a94f5960', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_EqpOwner', '财产所属', 0, 2, 4, 0, 1, '', '2020-12-01 09:37:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-01 15:51:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_items` VALUES ('d56acc3d-39f2-41a0-a900-a6866139d348', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_MaintainType', '保养周期类型', 0, 2, 2, 0, 1, '', '2020-11-30 14:50:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-01 15:51:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_items` VALUES ('e3c2ee7c-14e8-42c9-bb0d-29fc4c42ec37', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_TransferState', '流转箱状态', 0, 2, 11, 0, 1, '', '2021-01-06 13:11:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('f948d392-2b2c-4c07-9143-13635e955ed6', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_MaterialType', '物料分类', 0, 2, 6, 0, 1, '', '2020-12-01 15:52:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('faff6e57-5a15-4ba7-a971-d5453e3040c2', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_CheckType', '检验类型', 0, 2, 13, 0, 1, '', '2021-05-21 15:05:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_itemsdetail
-- ----------------------------
DROP TABLE IF EXISTS `sys_itemsdetail`;
CREATE TABLE `sys_itemsdetail`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_ITEMID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_PARENTID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ITEMCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ITEMNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_SIMPLESPELLING` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_ISDEFAULT` tinyint NULL DEFAULT NULL,
  `F_LAYERS` int NULL DEFAULT NULL,
  `F_SORTCODE` int NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE,
  INDEX `IX_SYS_ITEMSDETAIL`(`F_ITEMID`, `F_ITEMCODE`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_itemsdetail
-- ----------------------------
INSERT INTO `sys_itemsdetail` VALUES ('0096ad81-4317-486e-9144-a6a02999ff19', '2748F35F-4EE2-417C-A907-3453146AAF67', NULL, '4', '护照', NULL, 0, NULL, 4, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('018e7873-e7dd-4163-a9f2-e99eadcc44fb', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '6', '激光切割', NULL, 0, NULL, 6, 0, 1, '固定', '2020-11-30 15:04:57', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:17:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('04aba88d-f09b-46c6-bd90-a38471399b0e', 'D94E4DC1-C2FD-4D19-9D5D-3886D39900CE', NULL, '2', '业务角色', NULL, 0, NULL, 2, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('07d28cf3-eb8d-479e-b7b0-b353ca2dbd72', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '0', '3D扫描站', NULL, 0, NULL, 0, 0, 1, '固定', '2020-11-30 15:03:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:16:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('0883b606-2b0b-493f-9b9a-6e94fefc7d99', 'c2a3ec97-e4f0-46a5-addf-1ba4e40e2ab9', NULL, '3', '已终止', NULL, 0, NULL, 3, 0, 1, '', '2021-01-04 13:38:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('08d9344e-5290-4470-8b94-367ced6d6c84', '08d9344e-25dc-40ab-8eeb-473d9321c7e2', NULL, '0', '质检异常停机', NULL, 0, NULL, 0, 0, 0, '', '2021-06-21 08:48:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-07-14 18:28:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('08d93f50-1eb2-44a8-8b01-58293dad9a3c', '08d93f50-133e-4fe7-860d-4dd9cd33cfe5', NULL, '0', '可疑', NULL, 0, NULL, 0, 0, 1, '', '2021-07-05 08:59:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('08d93f50-2a0b-4ee0-85ed-991d2f83205c', '08d93f50-133e-4fe7-860d-4dd9cd33cfe5', NULL, '1', '报废', NULL, 0, NULL, 1, 0, 1, '', '2021-07-05 08:59:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('08d93f50-3018-40c7-8c57-23039cd57610', '08d93f50-133e-4fe7-860d-4dd9cd33cfe5', NULL, '2', '正常', NULL, 0, NULL, 2, 0, 1, '', '2021-07-05 08:59:49', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-07-05 09:00:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('08d941ac-6c83-449a-80ec-f7cce40335fe', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '18', '夹具', NULL, 0, NULL, 18, 0, 1, '流动', '2021-07-08 09:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:16:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('08d946b2-3901-4172-8337-67f5936e04ee', '08d9344e-25dc-40ab-8eeb-473d9321c7e2', NULL, '1', '是否开立工单', NULL, 0, NULL, 1, 0, 1, '', '2021-07-14 18:29:12', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('08d946b3-3244-45a0-81df-5ee294a46666', '08d9344e-25dc-40ab-8eeb-473d9321c7e2', NULL, '2', '是否及时领料和产出', NULL, 0, NULL, 2, 0, 0, '', '2021-07-14 18:36:11', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-08-18 14:07:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('0a2ba6b9-716f-410f-8e89-929ec2277333', '64c10822-0c85-4516-9b59-879b818547ae', NULL, '1', '私信', NULL, 0, NULL, 1, 0, 1, '', '2020-07-29 16:51:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('0bfc45f0-009f-4fa7-8883-d2dd8700629c', 'faff6e57-5a15-4ba7-a971-d5453e3040c2', NULL, '1', '领用检验', NULL, 0, NULL, 1, 0, 1, '', '2021-05-21 15:06:14', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('0c9d7265-6b7d-4830-a3e4-bf7a89646697', '8742966f-322c-4ed8-b737-ffee53d85a5d', NULL, '0', '物料库区', NULL, 0, NULL, 0, 0, 1, '', '2020-12-17 09:40:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 09:41:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('0fb9b7d9-97c1-4702-b29c-845a692e61da', '2e440789-bd9b-46a5-9a64-190163f8a9cf', NULL, '1', '运行', NULL, 0, NULL, 1, 0, 1, '', '2020-11-30 14:45:29', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-11-30 14:46:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('1950efdf-8685-4341-8d2c-ac85ac7addd0', '00F76465-DBBA-484A-B75C-E81DEE9313E6', NULL, '1', '小学', NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('19EE595A-E775-409D-A48F-B33CF9F262C7', '9EB4602B-BF9A-4710-9D80-C73CE89BEC5D', NULL, 'WorkGroup', '小组', NULL, 0, NULL, 7, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('1a18d92e-f55f-47e7-a28d-2bb3c32aca2c', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '3', '攻牙', NULL, 0, NULL, 3, 0, 1, '固定', '2020-11-30 15:04:18', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:16:53', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('1bc8abe3-abb4-41df-97fc-3f60299a5889', '002eeaa9-c804-4c98-afd9-7ddc7c1e4c46', NULL, '3', '产出上架', NULL, 0, NULL, 3, 0, 1, '', '2021-01-20 09:37:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('2146dbe0-6e99-42de-b717-66c84eef42e9', 'f948d392-2b2c-4c07-9143-13635e955ed6', NULL, '2', '成品', NULL, 0, NULL, 2, 0, 1, '', '2020-12-01 16:09:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-22 09:35:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('24e39617-f04e-4f6f-9209-ad71e870e7c6', '9a7079bd-0660-4549-9c2d-db5e8616619f', NULL, 'Submit', '提交', NULL, 0, NULL, 7, 0, 1, NULL, '2016-07-19 17:11:19', NULL, '2016-07-19 18:20:54', NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('2533c1a9-3902-403e-81ee-9b82c5c2e68f', '3d2fc3d0-ef1c-41c2-9ca0-cf027dc7a854', NULL, '1', '流动', NULL, 0, NULL, 1, 0, 1, '', '2020-11-30 14:35:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('27e85cb8-04e7-447b-911d-dd1e97dfab83', '0DF5B725-5FB8-487F-B0E4-BC563A77EB04', NULL, 'Oracle', 'Oracle', NULL, 0, NULL, 2, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('27f4ae04-8c5b-4318-b259-2cf59c1bc72a', 'cd6a17c3-34ca-44d3-a072-4f75a94f5960', NULL, '1', '客户', NULL, 0, NULL, 1, 0, 1, '', '2020-12-01 09:37:43', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('28e1b5be-7532-4fa8-b382-e270d8e4b464', 'c2a3ec97-e4f0-46a5-addf-1ba4e40e2ab9', NULL, '2', '已完成', NULL, 0, NULL, 2, 0, 1, '', '2020-12-07 13:43:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('2B540AC5-6E64-4688-BB60-E0C01DFA982C', '9EB4602B-BF9A-4710-9D80-C73CE89BEC5D', NULL, 'SubCompany', '子公司', NULL, 0, NULL, 4, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('2C3715AC-16F7-48FC-AB40-B0931DB1E729', '9EB4602B-BF9A-4710-9D80-C73CE89BEC5D', NULL, 'Area', '区域', NULL, 0, NULL, 2, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('2bde0211-abd8-4186-9986-9258028a973d', '5da129a3-45ce-43cf-a483-e7f9ad90297d', NULL, '1', '冷冲型', NULL, 0, NULL, 1, 0, 1, '', '2020-12-01 10:16:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('34222d46-e0c6-446e-8150-dbefc47a1d5f', '00F76465-DBBA-484A-B75C-E81DEE9313E6', NULL, '6', '本科', NULL, 0, NULL, 6, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('342baf8f-2cc4-4cca-a709-7b11b8dca510', '3d2fc3d0-ef1c-41c2-9ca0-cf027dc7a854', NULL, '0', '固定', NULL, 0, NULL, 0, 0, 1, '', '2020-11-30 14:35:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('34a642b2-44d4-485f-b3fc-6cce24f68b0f', '0DF5B725-5FB8-487F-B0E4-BC563A77EB04', NULL, 'MySql', 'MySql', NULL, 0, NULL, 3, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('355ad7a4-c4f8-4bd3-9c72-ff07983da0f0', '00F76465-DBBA-484A-B75C-E81DEE9313E6', NULL, '9', '其他', NULL, 0, NULL, 9, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('376dfe19-9de6-45e8-ba5b-39ecff7e9794', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '11', '抛丸', NULL, 0, NULL, 11, 0, 1, '固定', '2020-11-30 15:06:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:17:21', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('392f88a8-02c2-49eb-8aed-b2acf474272a', '9a7079bd-0660-4549-9c2d-db5e8616619f', NULL, 'Update', '修改', NULL, 0, NULL, 6, 0, 1, NULL, '2016-07-19 17:11:14', NULL, '2016-07-19 18:20:49', NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('3c884a03-4f34-4150-b134-966387f1de2a', '9a7079bd-0660-4549-9c2d-db5e8616619f', NULL, 'Exit', '退出', NULL, 0, NULL, 2, 0, 1, NULL, '2016-07-19 17:10:49', NULL, '2016-07-19 18:20:23', NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('3f280e2b-92f6-466c-8cc3-d7c8ff48cc8d', '00F76465-DBBA-484A-B75C-E81DEE9313E6', NULL, '7', '硕士', NULL, 0, NULL, 7, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('41053517-215d-4e11-81cd-367c0e9578d7', '954AB9A1-9928-4C6D-820A-FC1CDC85CDE0', NULL, '3', '通过', NULL, 0, NULL, 3, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('433511a9-78bd-41a0-ab25-e4d4b3423055', '00F76465-DBBA-484A-B75C-E81DEE9313E6', NULL, '2', '初中', NULL, 0, NULL, 2, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('442a9185-439b-4c7a-943c-773ea57015e1', '002eeaa9-c804-4c98-afd9-7ddc7c1e4c46', NULL, '6', '工单结束', NULL, 0, NULL, 6, 0, 1, '', '2021-01-20 09:37:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('45000772-a0a7-4789-9cd1-793b5646d09e', 'c2a3ec97-e4f0-46a5-addf-1ba4e40e2ab9', NULL, '0', '等待中', NULL, 0, NULL, 0, 0, 1, '', '2020-12-07 13:43:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('477ea5b7-24d2-43e2-8e87-8e068a911d80', '002eeaa9-c804-4c98-afd9-7ddc7c1e4c46', NULL, '11', '出库装箱', NULL, 0, NULL, 11, 0, 1, '', '2021-05-24 15:11:44', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('486a82e3-1950-425e-b2ce-b5d98f33016a', '00F76465-DBBA-484A-B75C-E81DEE9313E6', NULL, '5', '大专', NULL, 0, NULL, 5, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('48a01591-f00c-4a5e-a105-bc32858304b7', 'faff6e57-5a15-4ba7-a971-d5453e3040c2', NULL, '4', '出库检验', NULL, 0, NULL, 4, 0, 1, '', '2021-05-21 15:06:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('48c4e0f5-f570-4601-8946-6078762db3bf', '2748F35F-4EE2-417C-A907-3453146AAF67', NULL, '3', '军官证', NULL, 0, NULL, 3, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('49300258-1227-4b85-b6a2-e948dbbe57a4', '15023A4E-4856-44EB-BE71-36A106E2AA59', NULL, '汉族', '汉族', NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('49b68663-ad01-4c43-b084-f98e3e23fee8', '954AB9A1-9928-4C6D-820A-FC1CDC85CDE0', NULL, '7', '废弃', NULL, 0, NULL, 7, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('4c2f2428-2e00-4336-b9ce-5a61f24193f6', '2748F35F-4EE2-417C-A907-3453146AAF67', NULL, '2', '士兵证', NULL, 0, NULL, 2, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('4d205f1f-9414-4beb-a9cf-4750cfee3e9e', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '12', '激光落料', NULL, 0, NULL, 12, 0, 1, '固定', '2020-11-30 15:06:18', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:17:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('4f7fd03e-af20-418a-9d68-25f0d756dca6', '3d2fc3d0-ef1c-41c2-9ca0-cf027dc7a854', NULL, '2', '其他', NULL, 0, NULL, 2, 0, 1, '', '2020-11-30 14:35:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('53fafeba-99af-4eb6-95e6-0481c8395556', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '8', '端拾器', NULL, 0, NULL, 8, 0, 1, '流动', '2020-11-30 15:05:18', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:15:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('54128d90-1cd0-4bce-a1dc-47e58ecc58c1', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '17', '行架', NULL, 0, NULL, 17, 0, 1, '固定', '2021-03-08 09:46:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:17:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('57eec4b3-6f50-4186-b82d-2d62ee306d0f', '885d3b97-ae33-4cb6-b7b0-e1a7e72f6de2', NULL, '2', 'H5', NULL, 0, NULL, 2, 0, 1, '', '2020-11-23 09:01:49', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-11-23 09:04:16', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('582e0b66-2ee9-4885-9f0c-3ce3ebf96e12', '8CEB2F71-026C-4FA6-9A61-378127AE7320', NULL, '1', '已育', NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('5ba53647-a0d2-4e6b-8bce-fee2e589d872', '002eeaa9-c804-4c98-afd9-7ddc7c1e4c46', NULL, '4', '物料变动', NULL, 0, NULL, 4, 0, 1, '', '2021-01-20 09:37:24', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('5d6def0e-e2a7-48eb-b43c-cc3631f60dd7', 'BDD797C3-2323-4868-9A63-C8CC3437AEAA', NULL, '1', '男', NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('616fc56d-bc05-43bf-942c-c23299255ac6', '2e440789-bd9b-46a5-9a64-190163f8a9cf', NULL, '3', '维修', NULL, 0, NULL, 3, 0, 1, '', '2020-11-30 14:45:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('62e0afc3-e194-4f75-ad75-434f30acf387', '8742966f-322c-4ed8-b737-ffee53d85a5d', NULL, '2', '产品库区', NULL, 0, NULL, 2, 0, 1, '', '2020-12-17 09:41:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 09:41:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('63acf96d-6115-4d76-a994-438f59419aad', '954AB9A1-9928-4C6D-820A-FC1CDC85CDE0', NULL, '5', '退回', NULL, 0, NULL, 5, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('643209c8-931b-4641-9e04-b8bdd11800af', '9a7079bd-0660-4549-9c2d-db5e8616619f', NULL, 'Login', '登录', NULL, 0, NULL, 1, 0, 1, NULL, '2016-07-19 17:10:39', NULL, '2016-07-19 18:20:17', NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('65b7a5a2-ada2-4c8f-9b2e-bee2f0b5d8e7', '002eeaa9-c804-4c98-afd9-7ddc7c1e4c46', NULL, '2', '产品出库', NULL, 0, NULL, 2, 0, 1, '', '2021-01-20 09:36:57', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('6623a0f8-09a3-458c-82e7-e41710fb19bb', 'f948d392-2b2c-4c07-9143-13635e955ed6', NULL, '0', '原料', NULL, 0, NULL, 0, 0, 1, '', '2020-12-01 16:10:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-22 09:35:14', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('6b29542c-cb70-4d6b-9769-16f4fde65038', 'd56acc3d-39f2-41a0-a900-a6866139d348', NULL, '0', '次数', NULL, 0, NULL, 0, 0, 1, '', '2020-11-30 14:51:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-11-30 14:55:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('711ccaab-a8b1-46b4-89bc-474042e2acd1', '5da129a3-45ce-43cf-a483-e7f9ad90297d', NULL, '0', '热成型', NULL, 0, NULL, 0, 0, 1, '', '2020-12-01 10:16:28', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('7306bc04-3e76-4925-92e3-d2b8638ec42c', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '15', '焊机', NULL, 0, NULL, 15, 0, 1, '固定', '2021-03-08 09:29:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:17:29', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('738edf2a-d59f-4992-97ef-d847db23bcb8', 'FA7537E2-1C64-4431-84BF-66158DD63269', NULL, '1', '已婚', NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('795f2695-497a-4f5e-ab1d-706095c1edb9', '9a7079bd-0660-4549-9c2d-db5e8616619f', NULL, 'Other', '其他', NULL, 0, NULL, 0, 0, 1, NULL, '2016-07-19 17:10:33', NULL, '2016-07-19 18:20:09', NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('7a6d1bc4-3ec7-4c57-be9b-b4c97d60d5f6', '954AB9A1-9928-4C6D-820A-FC1CDC85CDE0', NULL, '1', '草稿', NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('7c1135be-0148-43eb-ae49-62a1e16ebbe3', 'FA7537E2-1C64-4431-84BF-66158DD63269', NULL, '5', '其他', NULL, 0, NULL, 5, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('7d18b3d6-738b-4b63-8163-b14a5750a6d0', '2e440789-bd9b-46a5-9a64-190163f8a9cf', NULL, '4', '异常', NULL, 0, NULL, 4, 0, 1, '', '2020-11-30 14:45:56', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('7d2d71e9-71f8-489c-b37e-8c684268af4b', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '13', '其他', NULL, 0, NULL, 13, 0, 1, '其他', '2020-11-30 15:06:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:16:16', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('7fc8fa11-4acf-409a-a771-aaf1eb81e814', '9a7079bd-0660-4549-9c2d-db5e8616619f', NULL, 'Exception', '异常', NULL, 0, NULL, 8, 0, 1, NULL, '2016-07-19 17:11:25', NULL, '2016-07-19 18:21:01', NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('80aa1d96-8b52-43f3-bb1a-ad4733ac8dec', 'a7faf382-c88c-43e1-aff3-98f261a693ea', NULL, '0', '通用', NULL, 0, NULL, 0, 0, 1, '', '2020-12-14 12:39:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('822baf7c-abdb-4257-9b78-1f550806f544', 'BDD797C3-2323-4868-9A63-C8CC3437AEAA', NULL, '0', '女', NULL, 0, NULL, 2, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('835cb824-c29e-4275-a1bc-1624b32fa8de', '002eeaa9-c804-4c98-afd9-7ddc7c1e4c46', NULL, '5', '工单作业', NULL, 0, NULL, 5, 0, 1, '', '2021-01-20 09:37:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('84738997-117e-4e0a-9460-abd65df7c6a0', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '10', '冲压', NULL, 0, NULL, 10, 0, 1, '固定', '2020-11-30 15:05:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:17:17', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('85cf359c-80be-4bd7-9a0c-876b3048c19a', 'cd6a17c3-34ca-44d3-a072-4f75a94f5960', NULL, '0', '公司', NULL, 0, NULL, 0, 0, 1, '', '2020-12-01 09:37:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('8892186f-22ff-40c4-9907-e80721f9c5fe', '64c10822-0c85-4516-9b59-879b818547ae', NULL, '2', '待办', NULL, 0, NULL, 2, 0, 1, '', '2020-07-29 16:52:21', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-07-31 17:33:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('8b7b38bf-07c5-4f71-a853-41c5add4a94e', '954AB9A1-9928-4C6D-820A-FC1CDC85CDE0', NULL, '6', '完成', NULL, 0, NULL, 6, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('8bc2effa-5f12-4b27-bdb9-2e90152d7735', 'c2a3ec97-e4f0-46a5-addf-1ba4e40e2ab9', NULL, '1', '执行中', NULL, 0, NULL, 1, 0, 1, '', '2020-12-07 13:43:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('8d6ec317-0cb9-4db3-a6b2-97b1bbfa6b5a', '8742966f-322c-4ed8-b737-ffee53d85a5d', NULL, '3', '空置库区', NULL, 0, NULL, 3, 0, 1, '', '2020-12-17 09:41:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('929c380a-d11d-4983-8c9c-ca326a3b6331', '002eeaa9-c804-4c98-afd9-7ddc7c1e4c46', NULL, '1', '来料入库', NULL, 0, NULL, 1, 0, 1, '', '2021-01-20 09:36:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-05-24 15:11:53', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('930b8de2-049f-4753-b9fd-87f484911ee4', '00F76465-DBBA-484A-B75C-E81DEE9313E6', NULL, '8', '博士', NULL, 0, NULL, 8, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('9638f236-260b-41fd-bb57-3ff897de2c57', 'faff6e57-5a15-4ba7-a971-d5453e3040c2', NULL, '2', '产出检验', NULL, 0, NULL, 2, 0, 1, '', '2021-05-21 15:06:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('9b6a2225-6138-4cf2-9845-1bbecdf9b3ed', '8CEB2F71-026C-4FA6-9A61-378127AE7320', NULL, '3', '其他', NULL, 0, NULL, 3, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('A64EBB80-6A24-48AF-A10E-B6A532C32CA6', '9EB4602B-BF9A-4710-9D80-C73CE89BEC5D', NULL, 'Department', '部门', NULL, 0, NULL, 5, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('B97BD7F5-B212-40C1-A1F7-DD9A2E63EEF2', '9EB4602B-BF9A-4710-9D80-C73CE89BEC5D', NULL, 'Group', '集团', NULL, 0, NULL, 1, 0, 1, '', NULL, NULL, '2020-06-29 17:35:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('D082BDB9-5C34-49BF-BD51-4E85D7BFF646', '9EB4602B-BF9A-4710-9D80-C73CE89BEC5D', NULL, 'Company', '公司', NULL, 0, NULL, 3, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('D1F439B9-D80E-4547-9EF0-163391854AB5', '9EB4602B-BF9A-4710-9D80-C73CE89BEC5D', NULL, 'SubDepartment', '子部门', NULL, 0, NULL, 6, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('a13ccf0d-ac8f-44ac-a522-4a54edf1f0fa', '9a7079bd-0660-4549-9c2d-db5e8616619f', NULL, 'Delete', '删除', NULL, 0, NULL, 5, 0, 1, NULL, '2016-07-19 17:11:09', NULL, '2016-07-19 18:20:43', NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('a4974810-d88d-4d54-82cc-fd779875478f', '00F76465-DBBA-484A-B75C-E81DEE9313E6', NULL, '4', '中专', NULL, 0, NULL, 4, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('a6f271f9-8653-4c5c-86cf-4cd00324b3c3', 'FA7537E2-1C64-4431-84BF-66158DD63269', NULL, '4', '丧偶', NULL, 0, NULL, 4, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('a7258605-6d35-4240-bb7e-b3a77252b0d3', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '7', '模具', NULL, 0, NULL, 7, 0, 1, '流动', '2020-11-30 15:05:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:15:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('a7c4aba2-a891-4558-9b0a-bd7a1100a645', 'FA7537E2-1C64-4431-84BF-66158DD63269', NULL, '2', '未婚', NULL, 0, NULL, 2, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('acb128a6-ff63-4e25-b1e8-0a336ed3ab18', '00F76465-DBBA-484A-B75C-E81DEE9313E6', NULL, '3', '高中', NULL, 0, NULL, 3, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('accdd4db-f825-4940-abdb-8f485e4d5927', 'e3c2ee7c-14e8-42c9-bb0d-29fc4c42ec37', NULL, '1', '绑定', NULL, 0, NULL, 1, 0, 1, '', '2021-01-06 13:12:24', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-06 13:13:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('ace2d5e8-56d4-4c8b-8409-34bc272df404', '2748F35F-4EE2-417C-A907-3453146AAF67', NULL, '5', '其它', NULL, 0, NULL, 5, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('ad0700cb-1fef-4fd0-a500-d78924b0e91f', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '9', '加热炉', NULL, 0, NULL, 9, 0, 1, '固定', '2020-11-30 15:05:28', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:17:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('aec54116-8583-46e9-96ea-af9aca5827d0', '885d3b97-ae33-4cb6-b7b0-e1a7e72f6de2', NULL, '1', '三方Web', NULL, 0, NULL, 1, 0, 1, '', '2020-11-21 10:03:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-11-23 09:04:09', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('b63f7a2a-7f23-408a-8781-56b34475b0d1', 'faff6e57-5a15-4ba7-a971-d5453e3040c2', NULL, '0', '入库检验', NULL, 0, NULL, 0, 0, 1, '', '2021-05-21 15:06:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('ba1d27db-cf19-4cc0-9b18-0745e98f8088', '64c10822-0c85-4516-9b59-879b818547ae', NULL, '0', '通知', NULL, 0, NULL, 0, 0, 1, '', '2020-07-29 16:51:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('bcaa8409-3597-4360-9d7f-11f0a6ad5488', '002eeaa9-c804-4c98-afd9-7ddc7c1e4c46', NULL, '9', '二次质检', NULL, 0, NULL, 9, 0, 1, '', '2021-05-24 12:03:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('c092c994-b763-4068-a425-0a4896a00999', '002eeaa9-c804-4c98-afd9-7ddc7c1e4c46', NULL, '0', '设备领料', NULL, 0, NULL, 0, 0, 1, '', '2021-01-20 09:36:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('c5ce1bd9-6971-4d76-8642-6ec7a5202c75', 'f948d392-2b2c-4c07-9143-13635e955ed6', NULL, '1', '半成品', NULL, 0, NULL, 1, 0, 1, '', '2020-12-01 16:09:54', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('ca2fb710-57e0-4401-89ce-474f4fb0994d', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '4', '镟铆', NULL, 0, NULL, 4, 0, 1, '固定', '2020-11-30 15:04:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:16:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('cc6daa5c-a71c-4b2c-9a98-336bc3ee13c8', 'D94E4DC1-C2FD-4D19-9D5D-3886D39900CE', NULL, '3', '其他角色', NULL, 0, NULL, 3, 0, 1, '', NULL, NULL, '2020-06-18 10:15:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('ccc8e274-75da-4eb8-bed0-69008ab7c41c', '9a7079bd-0660-4549-9c2d-db5e8616619f', NULL, 'Visit', '访问', NULL, 0, NULL, 3, 0, 1, NULL, '2016-07-19 17:10:55', NULL, '2016-07-19 18:20:29', NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('ccf113a8-4374-44be-aec0-2eddda1161dc', 'e3c2ee7c-14e8-42c9-bb0d-29fc4c42ec37', NULL, '3', '使用', NULL, 0, NULL, 3, 0, 1, '', '2021-01-06 13:12:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('ce340c73-5048-4940-b86e-e3b3d53fdb2c', '954AB9A1-9928-4C6D-820A-FC1CDC85CDE0', NULL, '2', '提交', NULL, 0, NULL, 2, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('cf05666d-07a6-4dbd-bafb-0c931874fe2a', '002eeaa9-c804-4c98-afd9-7ddc7c1e4c46', NULL, '8', '常规质检', NULL, 0, NULL, 8, 0, 1, '', '2021-05-24 12:03:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('d03c7953-f9af-4b26-8795-58f6d249e752', '002eeaa9-c804-4c98-afd9-7ddc7c1e4c46', NULL, '10', '入库上架', NULL, 0, NULL, 10, 0, 1, '', '2021-05-24 15:11:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('d14e661c-c921-4df8-a247-cadde6adc1bf', '8742966f-322c-4ed8-b737-ffee53d85a5d', NULL, '1', '半成品库区', NULL, 0, NULL, 1, 0, 1, '', '2020-12-17 09:41:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('d5e847ce-44d8-4e35-845d-d81ed0498cbf', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '5', '机械人', NULL, 0, NULL, 5, 0, 1, '固定', '2020-11-30 15:04:36', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:17:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('d69cb819-2bb3-4e1d-9917-33b9a439233d', '2748F35F-4EE2-417C-A907-3453146AAF67', NULL, '1', '身份证', NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('de2167f3-40fe-4bf7-b8cb-5b1c554bad7a', '8CEB2F71-026C-4FA6-9A61-378127AE7320', NULL, '2', '未育', NULL, 0, NULL, 2, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('e1979a4f-7fc1-42b9-a0e2-52d7059e8fb9', '954AB9A1-9928-4C6D-820A-FC1CDC85CDE0', NULL, '4', '待审', NULL, 0, NULL, 4, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('e2be96dd-e124-490d-8aa6-bcec4909651d', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '1', '液压机', NULL, 0, NULL, 1, 0, 1, '固定', '2020-11-30 15:04:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:16:44', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('e5079bae-a8c0-4209-9019-6a2b4a3a7dac', 'D94E4DC1-C2FD-4D19-9D5D-3886D39900CE', NULL, '1', '系统角色', NULL, 0, NULL, 1, 0, 1, '', NULL, NULL, '2020-06-24 09:08:22', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('e545061c-93fd-4ca2-ab29-b43db9db798b', '9a7079bd-0660-4549-9c2d-db5e8616619f', NULL, 'Create', '新增', NULL, 0, NULL, 4, 0, 1, NULL, '2016-07-19 17:11:03', NULL, '2016-07-19 18:20:35', NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('eba0de8f-ff66-4415-827d-336da3ea39f1', '885d3b97-ae33-4cb6-b7b0-e1a7e72f6de2', NULL, '0', '小程序', NULL, 0, NULL, 0, 0, 1, '', '2020-11-21 10:03:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('ed56c545-56f6-48e2-bfef-6a90ab8b1420', 'd56acc3d-39f2-41a0-a900-a6866139d348', NULL, '1', '时间(天)', NULL, 0, NULL, 1, 0, 1, '', '2020-11-30 14:51:18', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('f08a9823-e331-4837-a28d-f766668592b0', 'e3c2ee7c-14e8-42c9-bb0d-29fc4c42ec37', NULL, '2', '在库', NULL, 0, NULL, 2, 0, 1, '', '2021-01-06 13:12:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('f29973bf-eb91-414e-959f-52e8251e1b87', 'e3c2ee7c-14e8-42c9-bb0d-29fc4c42ec37', NULL, '0', '空闲', NULL, 0, NULL, 0, 0, 1, '', '2021-01-06 13:11:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('f9609400-7caf-49af-ae3c-7671a9292fb3', 'FA7537E2-1C64-4431-84BF-66158DD63269', NULL, '3', '离异', NULL, 0, NULL, 3, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('fa6c1873-888c-4b70-a2cc-59fccbb22078', '0DF5B725-5FB8-487F-B0E4-BC563A77EB04', NULL, 'SqlServer', 'SqlServer', NULL, 0, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('faaac4dc-9413-4971-8f1b-348397c1a7b7', '2e440789-bd9b-46a5-9a64-190163f8a9cf', NULL, '2', '保养', NULL, 0, NULL, 2, 0, 1, '', '2020-11-30 14:45:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('fad061eb-9ec8-4d9f-ae47-0588194caf02', '2e440789-bd9b-46a5-9a64-190163f8a9cf', NULL, '0', '空闲', NULL, 0, NULL, 0, 0, 1, '', '2020-11-30 14:45:22', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('fc35d37e-1030-442a-9b2b-d153710f03ca', '002eeaa9-c804-4c98-afd9-7ddc7c1e4c46', NULL, '7', '物料退回', NULL, 0, NULL, 7, 0, 1, '', '2021-01-20 09:37:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('fc42e714-3fe9-429e-a1dd-6e4a30f7eddd', 'faff6e57-5a15-4ba7-a971-d5453e3040c2', NULL, '3', '库存检验', NULL, 0, NULL, 3, 0, 1, '', '2021-05-21 15:06:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_itemsdetail` VALUES ('fe1668c9-362f-42b8-a868-ac9e59f39d26', 'bf06d1e0-cfde-40c9-954c-df930e26e319', NULL, '2', '焊接', NULL, 0, NULL, 2, 0, 1, '固定', '2020-11-30 15:04:09', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-09 20:16:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_DATE` datetime NULL DEFAULT NULL,
  `F_ACCOUNT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_NICKNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_IPADDRESS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_IPADDRESSNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_MODULEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_MODULENAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_RESULT` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_KEYVALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_COMPANYID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_PARENTID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LAYERS` int NULL DEFAULT NULL,
  `F_ENCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_FULLNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ICON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_URLADDRESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_TARGET` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ISMENU` tinyint NULL DEFAULT NULL,
  `F_ISEXPAND` tinyint NULL DEFAULT NULL,
  `F_ISFIELDS` tinyint NULL DEFAULT NULL,
  `F_ISPUBLIC` tinyint NULL DEFAULT NULL,
  `F_ALLOWEDIT` tinyint NULL DEFAULT NULL,
  `F_ALLOWDELETE` tinyint NULL DEFAULT NULL,
  `F_SORTCODE` int NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ISBOARD` tinyint NULL DEFAULT NULL COMMENT '是否看板',
  `F_AUTHORIZE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE,
  INDEX `IX_SYS_MODULE`(`F_FULLNAME`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_module
-- ----------------------------
INSERT INTO `sys_module` VALUES ('01849cc9-c6da-4184-92f8-34875dac1d42', '462027E0-0848-41DD-BCC3-025DCAE65555', 2, 'CodeGenerator', '代码生成', 'fa fa-code', '/SystemManage/CodeGenerator/Index', 'iframe', 1, 0, 0, 0, 0, 0, 2, 0, 1, '', '2020-05-06 13:11:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-16 09:27:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('08d92a3f-bdb2-42be-89c7-fae5d3a4fec3', '83e2713c-3b2b-4795-8e48-646785a1936b', 3, 'EqpPqcCheckItem', '设备点检项', 'fa fa-cc-diners-club', '/EquipmentManage/EqpPqcCheckItem/Index', 'iframe', 1, 0, 0, 0, 0, 0, 5, 0, 1, '', '2021-06-08 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-24 13:40:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('08d92af0-e091-40c3-8a90-914a3266dafc', '83e2713c-3b2b-4795-8e48-646785a1936b', 3, 'EqpPqcCheckMD', '设备日点检', 'fa fa-adjust', '/EquipmentManage/EqpPqcCheckMD/Index', 'iframe', 1, 0, 0, 0, 0, 0, 6, 0, 1, '', '2021-06-09 10:47:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('08d92be4-74ba-4edf-8357-49547cae7fbc', '83e2713c-3b2b-4795-8e48-646785a1936b', 3, 'EqpStopRecord', '设备停机', 'fa fa-exclamation-triangle', '/EquipmentManage/EqpStopRecord/Index', 'iframe', 1, 0, 0, 0, 0, 0, 7, 0, 1, '', '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-08-27 10:12:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('08d92fa2-7423-43dc-8839-359e00c53878', '08d935e2-5205-4f27-8a80-331f2856ee0e', 3, 'WorkPlan', '生产计划', 'fa fa-paper-plane-o', '/ProcessManage/WorkPlan/Index', 'iframe', 1, 0, 0, 0, 0, 0, 0, 0, 1, '', '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-23 09:04:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('08d92fb7-7754-4c3b-8341-c60bc590212d', '83e2713c-3b2b-4795-8e48-646785a1936b', 3, 'EqpRepair', '设备维修记录', 'fa fa-bitbucket-square', '/EquipmentManage/EqpRepair/Index', 'iframe', 1, 0, 0, 0, 0, 0, 8, 0, 1, '', '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-24 13:42:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('08d93158-2459-490a-868d-a826777f22e4', '101358e6-eb92-431a-9f05-949f05738506', 3, 'TransferBoxBatch', '条码打印', 'fa fa-print', '/MaterialManage/TransferBoxBatch/Index', 'iframe', 1, 0, 0, 0, 0, 0, 101, 0, 1, '', '2021-06-17 14:21:29', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-07-05 09:03:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('08d935e2-5205-4f27-8a80-331f2856ee0e', 'd5be1a41-547d-4001-8ae7-f6568e4d6cfe', 2, 'PlanManage', '计划管理', 'fa fa-paper-plane', NULL, 'expand', 1, 1, 0, 0, 0, 0, 1, 0, 1, '', '2021-06-23 09:00:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('08d9360c-dd12-43e8-8ebe-0104c5bd3c08', '08d935e2-5205-4f27-8a80-331f2856ee0e', 3, 'InStoragePlan', '采购计划', 'fa fa-adjust', '/PlanManage/InStoragePlan/Index', 'iframe', 1, 0, 0, 0, 0, 0, 1, 0, 1, '', '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-23 15:04:16', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('08d93615-4748-4f48-88aa-162ed2db75a9', '08d935e2-5205-4f27-8a80-331f2856ee0e', 3, 'OutStoragePlan', '交付计划', 'fa fa-hand-paper-o', '/PlanManage/OutStoragePlan/Index', 'iframe', 1, 0, 0, 0, 0, 0, 2, 0, 1, '', '2021-06-23 15:05:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('08d93d2e-a9ac-44ba-86bf-af6814a028b3', '5c4c18b1-88be-4819-ab5a-199bba8ae070', 3, 'AllBadStorageReport', '不良品汇总', '', '/ReportRecord/AllBadStorageReport/Index', 'iframe', 1, 0, 0, 0, 0, 0, 11, 0, 1, '', '2021-07-02 15:54:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-07-02 16:26:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('08d94670-7854-4707-8a1e-256200820167', '732b0226-a8d6-41e7-b731-a8c4252f1c88', 3, 'ScapMaterialReturn', '退回记录', 'fa fa-caret-left', '/QualityManage/ScapMaterialReturn/Index', 'iframe', 1, 0, 0, 0, 0, 0, 3, 0, 1, '', '2021-07-14 10:38:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-07-14 10:59:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('08d94b44-8770-42cb-8dc2-ef4c67a7b162', '5c4c18b1-88be-4819-ab5a-199bba8ae070', 3, 'CheckDateStorage', '盘点记录', '', '/ReportRecord/CheckDateStorage/Index', 'iframe', 1, 0, 0, 0, 0, 0, 12, 0, 1, '', '2021-07-20 14:06:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-07-20 14:06:49', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('08d94c14-e1b5-4b56-8873-37fb81ebaad3', '08d935e2-5205-4f27-8a80-331f2856ee0e', 3, 'Order', '订单管理', 'fa fa-500px', '/PlanManage/Order/Index', 'iframe', 1, 0, 0, 0, 0, 0, 3, 0, 1, '', '2021-07-21 14:58:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-07-26 09:15:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('08d97330-6dd4-4435-851b-d6b12ea91518', '462027E0-0848-41DD-BCC3-025DCAE65555', 3, 'ReportTemplate', '报表模板', 'fa fa-area-chart', '/SystemManage/ReportTemplate/Index', 'iframe', 1, 0, 0, 0, 0, 0, 11, 0, 1, '', '2021-09-09 09:23:29', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-09-09 13:30:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('08dab306-91ba-4cd2-8fd2-591c0fce6ab1', 'd5be1a41-547d-4001-8ae7-f6568e4d6cfe', 2, 'RunMonitor', '运营监控', 'fa fa-tv', NULL, 'expand', 1, 1, 0, 0, 0, 0, 96, 0, 1, '', '2022-10-21 09:50:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_module` VALUES ('08dab30a-d896-4019-8066-7001d27a834e', '08dab306-91ba-4cd2-8fd2-591c0fce6ab1', 3, 'BoardAccount', '看板账户', 'fa fa-address-book', '/RunMonitor/BoardAccount/Index', 'iframe', 1, 0, 0, 0, 0, 0, 0, 0, 1, '', '2022-10-21 10:20:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_module` VALUES ('08dab30b-0c23-4b79-8743-35952367b7d8', '08dab306-91ba-4cd2-8fd2-591c0fce6ab1', 3, 'LogisticScanScreen', '物流信息看板', 'fa fa-clock-o', '/RunMonitor/LogisticScanScreen/Index', 'blank', 1, 0, 0, 0, 0, 0, 1, 0, 1, '', '2022-10-21 10:22:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_module` VALUES ('08dab30b-24a5-4bd2-8124-6f5037002a73', '08dab306-91ba-4cd2-8fd2-591c0fce6ab1', 3, 'EqpScanScreen', '设备扫码看板', 'fa fa-sheqel', '/RunMonitor/EqpScanScreen/Index', 'blank', 1, 0, 0, 0, 0, 0, 2, 0, 1, '', '2022-10-21 10:22:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_module` VALUES ('08dab30b-4c9e-445f-82a9-e0264f432d57', '08dab306-91ba-4cd2-8fd2-591c0fce6ab1', 3, 'SmartScreen', '总生产情况', 'fa fa-file-movie-o', '/RunMonitor/SmartScreen/Index', 'blank', 1, 0, 0, 0, 0, 0, 3, 0, 1, '', '2022-10-21 10:23:54', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_module` VALUES ('0a479fd4-57ca-46db-a8bf-c30d5871b1f9', '5c841e96-00f1-47ea-aec7-d197278562de', 3, 'ControlJobPlaner', '调度人员', 'fa fa-user-secret', '/ClassTask/ControlJobPlaner/Index', 'iframe', 1, 0, 0, 0, 0, 0, 0, 0, 1, '', '2021-01-18 14:53:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-18 15:18:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('0bddfade-d5b4-46c3-b0b6-45fb9f728e38', '5c4c18b1-88be-4819-ab5a-199bba8ae070', 3, 'ReturnMaterialReport', '领用退回记录', '', '/ReportRecord/ReturnMaterialReport/Index', 'iframe', 1, 0, 0, 0, 0, 0, 6, 0, 1, '', '2021-02-26 08:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-26 08:55:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('101358e6-eb92-431a-9f05-949f05738506', 'd5be1a41-547d-4001-8ae7-f6568e4d6cfe', 2, 'MaterialManage', '生产管理', 'fa fa-shopping-cart', NULL, 'expand', 1, 1, 0, 0, 0, 0, 3, 0, 1, '', '2020-11-18 10:43:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-23 09:03:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('152a8e93-cebb-4574-ae74-2a86595ff986', '462027E0-0848-41DD-BCC3-025DCAE65555', 2, 'ModuleFields', '字段管理', 'fa fa-table', '/SystemManage/ModuleFields/Index', 'iframe', 0, 0, 0, 0, 0, 0, 4, 0, 1, '', '2020-05-21 14:39:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-15 14:55:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('240eb9e4-d5f8-4097-8611-dcdb30c2f49a', '732b0226-a8d6-41e7-b731-a8c4252f1c88', 3, 'CheckoutDescription', '检验参数', 'fa fa-sitemap', '/QualityManage/CheckoutDescription/Index', 'iframe', 1, 0, 0, 0, 0, 0, 0, 0, 1, '', '2021-05-18 08:17:36', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-18 13:11:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('253646c6-ffd8-4c7f-9673-f349bbafcbe5', '87dc2de3-ccbc-4dab-bb90-89fc68cbde4f', 2, 'SystemOrganize', '单位组织', 'fa fa-reorder', NULL, 'expand', 1, 1, 0, 0, 0, 0, 0, 0, 1, '', '2020-06-15 14:52:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-23 10:37:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('25b77622-ff89-47d2-b0b4-c8c8a7ff74d9', '5c4c18b1-88be-4819-ab5a-199bba8ae070', 3, 'ConsumeReport', '消耗记录', '', '/ReportRecord/ConsumeReport/Index', 'iframe', 1, 0, 0, 0, 0, 0, 7, 0, 1, '', '2021-02-26 08:51:29', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-26 08:55:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('25ca371f-9c67-4e0e-9ca7-0dec2e836613', '101358e6-eb92-431a-9f05-949f05738506', 3, 'InStorage', '入库管理', 'fa fa-get-pocket', '/MaterialManage/InStorage/Index', 'iframe', 1, 0, 0, 0, 0, 0, 5, 0, 1, '', '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 09:51:09', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('262ca754-1c73-436c-a9a2-b6374451a845', '253646c6-ffd8-4c7f-9673-f349bbafcbe5', 2, 'DataPrivilegeRule', '数据权限', 'fa fa-database', '/SystemOrganize/DataPrivilegeRule/Index', 'iframe', 1, 0, 0, 0, 0, 0, 3, 0, 1, '', '2020-06-01 09:44:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-16 08:11:44', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('26452c9a-243d-4c81-97b9-a3ad581c3bf4', '253646c6-ffd8-4c7f-9673-f349bbafcbe5', 2, 'Organize', '机构管理', 'fa fa-sitemap', '/SystemOrganize/Organize/Index', 'iframe', 1, 0, 0, 0, 0, 0, 2, 0, 1, '', '2020-04-09 15:24:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-16 08:11:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('2c2ddbce-ee87-4134-9b32-54d0bd572910', '462027E0-0848-41DD-BCC3-025DCAE65555', 3, 'Form', '表单设计', 'fa fa-wpforms', '/SystemManage/Form/Index', 'iframe', 1, 0, 0, 0, 0, 0, 8, 0, 1, '', '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-02 09:47:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('2ffc3301-8ec2-4157-a4c3-232797aae120', '3e431a6e-1906-48f6-91da-16015b40dd20', 3, 'WorkOrderRun', '工单作业', 'fa fa-fast-forward', '/ProcessManage/WorkOrderRun/Index', 'iframe', 1, 0, 0, 0, 0, 0, 3, 0, 1, '', '2020-12-09 08:32:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('30c629a0-910e-404b-8c29-a73a6291fd95', '73FD1267-79BA-4E23-A152-744AF73117E9', 3, 'AppLog', '系统日志', 'fa fa-file', '/SystemSecurity/AppLog/Index', 'iframe', 1, 0, 0, 0, 0, 0, 0, 0, 1, '', '2020-07-08 10:12:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-07-08 10:14:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('33f831db-f9a4-43e7-8688-d08073af575b', '5c841e96-00f1-47ea-aec7-d197278562de', 3, 'DoneControlJob', '已完成任务', 'fa fa-history', '/ClassTask/ControlJob/Done', 'iframe', 1, 0, 0, 0, 0, 0, 3, 0, 1, '', '2021-01-18 14:30:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('38CA5A66-C993-4410-AF95-50489B22939C', '253646c6-ffd8-4c7f-9673-f349bbafcbe5', 2, 'User', '用户管理', 'fa fa-address-card-o', '/SystemOrganize/User/Index', 'iframe', 1, 0, 0, 0, 0, 0, 6, 0, 1, '', NULL, NULL, '2020-06-16 08:11:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('39226710-b665-489e-aaa0-a8c15d29ed4c', '101358e6-eb92-431a-9f05-949f05738506', 3, 'BomInfo', 'Bom结构', 'fa fa-anchor', '/MaterialManage/BomInfo/Index', 'iframe', 1, 0, 0, 0, 0, 0, 4, 0, 1, '', '2020-12-03 13:56:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 09:50:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('39fce29e-2d24-934c-432b-87fda7e92d81', '5c841e96-00f1-47ea-aec7-d197278562de', 3, 'ControlJobUserBanding', '信息设置', 'fa fa-info', '/ClassTask/ControlJobUserBanding/Index', 'iframe', 1, 0, 0, 0, 0, 0, 4, 0, 1, '', '2021-06-03 13:55:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-03 15:49:57', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('3e431a6e-1906-48f6-91da-16015b40dd20', 'd5be1a41-547d-4001-8ae7-f6568e4d6cfe', 2, 'ProcessManage', '工艺排程', 'fa fa-hourglass-start', NULL, 'expand', 1, 1, 0, 0, 0, 0, 2, 0, 1, '', '2020-11-18 10:40:24', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-23 09:03:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('423A200B-FA5F-4B29-B7B7-A3F5474B725F', '462027E0-0848-41DD-BCC3-025DCAE65555', 2, 'ItemsData', '数据字典', 'fa fa-align-justify', '/SystemManage/ItemsData/Index', 'iframe', 1, 0, 0, 0, 0, 0, 5, 0, 1, '', NULL, NULL, '2020-06-15 14:57:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('462027E0-0848-41DD-BCC3-025DCAE65555', '87dc2de3-ccbc-4dab-bb90-89fc68cbde4f', 2, 'SystemManage', '系统管理', 'fa fa-gears', NULL, 'expand', 1, 1, 0, 0, 0, 0, 1, 0, 1, '', NULL, NULL, '2020-06-23 10:38:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('4666f434-3178-42e5-a44f-1f34cadb3c43', 'a955a782-35d2-4a47-b6de-2c93a0e524b2', 2, 'MesStorageApp', '库存应用', '', NULL, 'expand', 0, 0, 0, 0, 0, 0, 5, 0, 1, '', '2021-04-27 15:45:44', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, 'MesStorageApp');
INSERT INTO `sys_module` VALUES ('4666f434-3178-42e5-a44f-1f34cadb3c44', 'a955a782-35d2-4a47-b6de-2c93a0e524b2', 2, 'MesHotlineApp', '设备相关', '', NULL, 'expand', 0, 0, 0, 0, 0, 0, 5, 0, 1, '', '2021-04-27 15:45:44', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, 'MesHotlineApp');
INSERT INTO `sys_module` VALUES ('484269cb-9aea-4af1-b7f6-f99e7e396ad1', '462027E0-0848-41DD-BCC3-025DCAE65555', 3, 'SystemOptions', '系统配置', 'fa fa-gears', '/SystemOrganize/SystemSet/SetForm', 'iframe', 1, 0, 1, 0, 0, 0, 0, 0, 1, '', '2020-06-12 14:32:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-02 09:47:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('49F61713-C1E4-420E-BEEC-0B4DBC2D7DE8', '73FD1267-79BA-4E23-A152-744AF73117E9', 3, 'ServerMonitoring', '服务器监控', 'fa fa-desktop', '/SystemSecurity/ServerMonitoring/Index', 'expand', 1, 0, 0, 0, 0, 0, 4, 0, 1, '', NULL, NULL, '2020-07-02 08:45:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('50cdea18-b06a-43c8-963c-8f52fb9d94de', '101358e6-eb92-431a-9f05-949f05738506', 3, 'MaterialBom', '物料工序绑定', '', '/MaterialManage/MaterialBom/Index', 'iframe', 0, 0, 0, 0, 0, 0, 99, 0, 1, '', '2020-12-03 14:42:53', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 09:50:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('5391c5c0-55c0-4132-a26d-5d27fcec1c18', '101358e6-eb92-431a-9f05-949f05738506', 3, 'Location', '库位管理', 'fa fa-map-marker', '/MaterialManage/Location/Index', 'iframe', 1, 0, 0, 0, 0, 0, 1, 0, 1, '', '2020-12-17 08:32:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 09:49:29', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('5c4c18b1-88be-4819-ab5a-199bba8ae070', 'd5be1a41-547d-4001-8ae7-f6568e4d6cfe', 2, 'ReportRecord', '报表记录', 'fa fa-bar-chart', NULL, 'expand', 1, 1, 0, 0, 0, 0, 98, 0, 1, '', '2021-02-26 08:36:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-23 09:01:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('5c841e96-00f1-47ea-aec7-d197278562de', 'd5be1a41-547d-4001-8ae7-f6568e4d6cfe', 2, 'ClassTask', '调度任务', 'fa fa-address-card-o', NULL, 'expand', 1, 1, 0, 0, 0, 0, 0, 0, 1, '', '2020-12-04 08:20:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-18 15:59:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('5f9873e9-0308-4a8e-84b7-1c4c61f37654', '87dc2de3-ccbc-4dab-bb90-89fc68cbde4f', 2, 'FlowManage', '流程中心', 'fa fa-stack-overflow', NULL, 'expand', 1, 1, 0, 0, 0, 0, 3, 0, 1, '', '2020-07-14 15:39:44', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-05-19 16:16:21', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('605444e5-704f-4cca-8d00-75175e2aef05', '5f9873e9-0308-4a8e-84b7-1c4c61f37654', 3, 'ToDoFlow', '待处理流程', 'fa fa-volume-control-phone', '/FlowManage/Flowinstance/ToDoFlow', 'iframe', 1, 0, 0, 0, 0, 0, 1, 0, 1, '', '2020-07-15 15:03:12', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('64A1C550-2C61-4A8C-833D-ACD0C012260F', '462027E0-0848-41DD-BCC3-025DCAE65555', 3, 'Module', '系统菜单', 'fa fa-music', '/SystemManage/Module/Index', 'iframe', 1, 0, 0, 0, 0, 0, 1, 0, 1, '测试', NULL, NULL, '2020-07-14 15:45:36', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('667a7393-ed53-43e0-bf2a-c349e5dd48e5', '5c4c18b1-88be-4819-ab5a-199bba8ae070', 3, 'EqpMaterialUseReport', '领用记录', '', '/ReportRecord/EqpMaterialUseReport/Index', 'iframe', 1, 0, 0, 0, 0, 0, 5, 0, 1, '', '2021-02-26 08:50:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-26 08:55:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('69f6aebb-965b-4380-910f-99aba0776261', '101358e6-eb92-431a-9f05-949f05738506', 3, 'Storage', '库存管理', 'fa fa-shopping-basket', '/MaterialManage/Storage/Index', 'iframe', 1, 0, 0, 0, 0, 0, 7, 0, 1, '', '2020-12-31 09:50:14', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-04 11:09:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('6b196514-0df1-41aa-ae64-9bb598960709', '87dc2de3-ccbc-4dab-bb90-89fc68cbde4f', 2, 'FileManage', '文件中心', 'fa fa-file-text-o', NULL, 'expand', 1, 1, 0, 0, 0, 0, 4, 0, 1, '', '2020-07-22 11:43:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-08-12 11:17:44', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('6bdd6d88-4391-476e-bcec-10e41cbdcea7', '5c4c18b1-88be-4819-ab5a-199bba8ae070', 3, 'EqpWorkTime', '设备值班记录', '', '/ReportRecord/EqpWorkTime/Index', 'iframe', 1, 0, 0, 0, 0, 0, 10, 0, 1, '', '2021-04-08 11:40:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('6d903aa1-35e3-4b75-b2a4-261be30a0e15', '5c4c18b1-88be-4819-ab5a-199bba8ae070', 3, 'AllStorageReport', '库存汇总', '', '/ReportRecord/AllStorageReport/Index', 'iframe', 1, 0, 0, 0, 0, 0, 0, 0, 1, '', '2021-04-01 14:24:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-04-01 14:25:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('732b0226-a8d6-41e7-b731-a8c4252f1c88', 'd5be1a41-547d-4001-8ae7-f6568e4d6cfe', 2, 'QualityManage', '品质监管', 'fa fa-calendar-check-o', NULL, 'expand', 1, 1, 0, 0, 0, 0, 5, 0, 1, '', '2020-11-18 10:45:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-23 09:03:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('73FD1267-79BA-4E23-A152-744AF73117E9', '87dc2de3-ccbc-4dab-bb90-89fc68cbde4f', 2, 'SystemSecurity', '系统安全', 'fa fa-desktop', NULL, 'expand', 1, 1, 0, 0, 0, 0, 2, 0, 1, '', NULL, NULL, '2020-06-23 10:54:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('788d27cb-598d-41da-ac11-b7ddf0914b08', 'c9a88d3e-e66b-4929-906a-f6eaec00527f', 3, 'DingTalkConfig', '应用配置', NULL, '/DingTalkManage/DingTalkConfig/Index', 'iframe', 1, 0, 0, 0, 0, 0, 1, 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('79c73d26-6f49-463a-9002-98eba48e36b2', '101358e6-eb92-431a-9f05-949f05738506', 3, 'Area', '库区管理', 'fa fa-home', '/MaterialManage/Area/Index', 'iframe', 1, 0, 0, 0, 0, 0, 0, 0, 1, '', '2020-12-17 08:31:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 09:49:21', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('7cb65e00-8af2-4cf2-b318-8ba28b3c154e', '6b196514-0df1-41aa-ae64-9bb598960709', 3, 'Uploadfile', '文件管理', 'fa fa-file-text-o', '/FileManage/Uploadfile/Index', 'iframe', 1, 0, 0, 0, 0, 0, 1, 0, 1, '', '2020-07-22 12:05:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-07-22 17:20:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('7cce1014-5087-4184-9848-77e164be4e17', '3e431a6e-1906-48f6-91da-16015b40dd20', 3, 'WorkOrder', '工单管理', 'fa fa-sticky-note', '/ProcessManage/WorkOrder/Index', 'iframe', 1, 0, 0, 0, 0, 0, 2, 0, 1, '', '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-07 13:46:55', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('7e4e4a48-4d51-4159-a113-2a211186f13a', '253646c6-ffd8-4c7f-9673-f349bbafcbe5', 3, 'Notice', '系统公告', 'fa fa-book', '/SystemOrganize/Notice/Index', 'iframe', 0, 0, 1, 0, 0, 0, 0, 0, 0, '', '2020-04-14 15:39:29', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-11-15 13:38:44', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('83d761e9-4ab8-45db-a9ce-32bc148b6922', '83e2713c-3b2b-4795-8e48-646785a1936b', 3, 'EqpArea', '设备区域绑定', '', '/EquipmentManage/EqpArea/Index', 'iframe', 0, 0, 0, 0, 0, 0, 3, 0, 1, '', '2020-12-17 11:22:14', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('83e2713c-3b2b-4795-8e48-646785a1936b', 'd5be1a41-547d-4001-8ae7-f6568e4d6cfe', 2, 'EquipmentManage', '设备维护', 'fa fa-sheqel', NULL, 'expand', 1, 1, 0, 0, 0, 0, 4, 0, 1, '', '2020-11-18 10:46:55', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-23 09:03:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('84e5ec65-f803-485e-b703-4d07eaaf6c05', '101358e6-eb92-431a-9f05-949f05738506', 3, 'OutStorage', '出库管理', 'fa fa-sign-out', '/MaterialManage/OutStorage/Index', 'iframe', 1, 0, 0, 0, 0, 0, 6, 0, 1, '', '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 09:51:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('87dc2de3-ccbc-4dab-bb90-89fc68cbde4f', '0', 1, 'GeneralManage', '常规管理', '', NULL, 'expand', 1, 1, 0, 0, 0, 0, 0, 0, 1, '', '2020-06-23 10:37:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-30 15:33:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('8968b428-2a8b-4dbe-ad47-73dd408ddd5e', '3e431a6e-1906-48f6-91da-16015b40dd20', 3, 'ProcessFlow', '工序管理', 'fa fa-hourglass-1', '/ProcessManage/ProcessFlow/Index', 'iframe', 1, 0, 0, 0, 0, 0, 1, 0, 1, '', '2020-12-03 09:49:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-03 10:30:43', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('91448822-e10b-4146-b9fe-2669073cc7f1', 'a955a782-35d2-4a47-b6de-2c93a0e524b2', 2, 'MesProduceApp', '生产应用', '', NULL, 'expand', 0, 0, 0, 0, 0, 0, 0, 0, 1, '', '2021-04-27 15:17:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, 'MesProduceApp');
INSERT INTO `sys_module` VALUES ('91A6CFAD-B2F9-4294-BDAE-76DECF412C6C', '253646c6-ffd8-4c7f-9673-f349bbafcbe5', 2, 'Role', '角色管理', 'fa fa-user-circle', '/SystemOrganize/Role/Index', 'iframe', 1, 0, 0, 0, 0, 0, 4, 0, 1, '', NULL, NULL, '2020-06-16 08:11:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('96EE855E-8CD2-47FC-A51D-127C131C9FB9', '73FD1267-79BA-4E23-A152-744AF73117E9', 3, 'Log', '操作日志', 'fa fa-clock-o', '/SystemSecurity/Log/Index', 'iframe', 1, 0, 0, 0, 0, 0, 1, 0, 1, '', NULL, NULL, '2020-07-08 10:13:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('F298F868-B689-4982-8C8B-9268CBF0308D', '253646c6-ffd8-4c7f-9673-f349bbafcbe5', 2, 'Duty', '岗位管理', 'fa fa-users', '/SystemOrganize/Duty/Index', 'iframe', 1, 0, 0, 0, 0, 0, 5, 0, 1, '', NULL, NULL, '2020-06-16 08:11:54', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('a083a171-932a-48b8-b053-13f9b39d555a', 'a955a782-35d2-4a47-b6de-2c93a0e524b2', 2, 'MesLogisticsApp', '物流应用', '', NULL, 'expand', 0, 0, 0, 0, 0, 0, 1, 0, 1, '', '2021-04-27 15:19:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, 'MesLogisticsApp');
INSERT INTO `sys_module` VALUES ('a2cae27f-0b49-4181-8760-4be3a3560988', '5c841e96-00f1-47ea-aec7-d197278562de', 3, 'DoingControlJob', '当前任务', 'fa fa-snowflake-o', '/ClassTask/ControlJob/Doing', 'iframe', 1, 0, 0, 0, 0, 0, 2, 0, 1, '', '2021-01-18 14:28:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-22 09:16:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('a303cbe1-60eb-437b-9a69-77ff8b48f173', '253646c6-ffd8-4c7f-9673-f349bbafcbe5', 3, 'SystemSet', '租户设置', 'fa fa-connectdevelop', '/SystemOrganize/SystemSet/Index', 'iframe', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-14 16:40:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('a3a4742d-ca39-42ec-b95a-8552a6fae579', '73FD1267-79BA-4E23-A152-744AF73117E9', 2, 'FilterIP', '访问控制', 'fa fa-filter', '/SystemSecurity/FilterIP/Index', 'iframe', 1, 0, 0, 0, 0, 0, 2, 0, 1, NULL, '2016-07-17 22:06:10', NULL, '2020-04-16 14:10:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('a5b323e7-db24-468f-97d7-a17bf5396742', '87dc2de3-ccbc-4dab-bb90-89fc68cbde4f', 2, 'InfoManage', '信息中心', 'fa fa-info', NULL, 'expand', 1, 1, 0, 0, 0, 0, 5, 0, 1, '', '2020-07-29 16:40:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-08-12 11:17:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('a620c016-27cb-46f8-86c9-44c197617524', '83e2713c-3b2b-4795-8e48-646785a1936b', 3, 'EqpUser', '设备人员绑定', '', '/EquipmentManage/EqpUser/Index', 'iframe', 0, 0, 0, 0, 0, 0, 4, 0, 1, '', '2021-01-15 11:26:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('a8f0c195-53c5-4b05-b65e-5fafb14a3aec', '5c841e96-00f1-47ea-aec7-d197278562de', 3, 'ControlJob', '待执行任务', 'fa fa-tasks', '/ClassTask/ControlJob/Index', 'iframe', 1, 0, 0, 0, 0, 0, 1, 0, 1, '', '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-18 14:29:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('a955a782-35d2-4a47-b6de-2c93a0e524b2', '0', 1, 'MesSmallApp', 'MES小程序', '', NULL, 'expand', 0, 1, 0, 0, 0, 0, 3, 0, 1, '', '2021-04-27 14:19:17', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-04-27 15:20:12', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, 'MesSmallApp');
INSERT INTO `sys_module` VALUES ('af863666-a357-4e06-bffd-df98e1d29ab8', '83e2713c-3b2b-4795-8e48-646785a1936b', 3, 'Equipment', '设备管理', 'fa fa-sheqel', '/EquipmentManage/Equipment/Index', 'iframe', 1, 0, 0, 0, 0, 0, 1, 0, 1, '', '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-02 14:30:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('b26cea9c-21ba-42fa-98fc-b8fe0b92451d', '732b0226-a8d6-41e7-b731-a8c4252f1c88', 3, 'NeedCheck', '质检管理', 'fa fa-calendar-check-o', '/QualityManage/NeedCheck/Index', 'iframe', 1, 0, 0, 0, 0, 0, 1, 0, 1, '', '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-18 13:11:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('b39698da-6117-433e-8a02-ef1392d1fe3b', '732b0226-a8d6-41e7-b731-a8c4252f1c88', 3, 'ScapMaterial', '不良品管理', 'fa fa-bluetooth-b', '/QualityManage/ScapMaterial/Index', 'iframe', 1, 0, 0, 0, 0, 0, 2, 0, 1, '', '2021-05-21 13:59:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-18 13:11:44', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('b398f0e5-44d3-4206-9d90-e2f5d2740379', '0', 1, 'MobileManage', '移动端', '', NULL, 'expand', 1, 1, 0, 0, 0, 0, 2, 0, 1, '', '2020-11-21 08:47:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-11-21 08:47:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('b5ff9591-f939-41c0-8c68-3b9c2fe02bdd', 'a955a782-35d2-4a47-b6de-2c93a0e524b2', 2, 'MesCheckoutApp', '质检应用', '', NULL, 'expand', 0, 0, 0, 0, 0, 0, 4, 0, 1, '', '2021-04-27 15:29:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, 'MesCheckoutApp');
INSERT INTO `sys_module` VALUES ('badc3ee2-fcbb-43ae-9efe-2309f8a63834', '101358e6-eb92-431a-9f05-949f05738506', 3, 'MaterialEqp', '物料设备绑定', '', '/MaterialManage/MaterialEqp/Index', 'iframe', 0, 0, 0, 0, 0, 0, 100, 0, 1, '', '2020-12-02 15:54:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 09:49:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('be2173ad-0833-4a9a-8024-b9f32f892de5', '5c4c18b1-88be-4819-ab5a-199bba8ae070', 3, 'InStorageReport', '入库报表', '', '/ReportRecord/InStorageReport/Index', 'iframe', 1, 0, 0, 0, 0, 0, 1, 0, 1, '', '2021-02-26 08:39:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-26 08:54:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('beaddc98-9037-4fc6-8d21-493fe47f20e8', '101358e6-eb92-431a-9f05-949f05738506', 3, 'TransferTypeManage', '流转类型绑定', '', '/MaterialManage/TransferType/Index', 'iframe', 0, 0, 0, 0, 0, 0, 98, 0, 1, '', '2020-12-14 13:12:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 09:50:18', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('c87cd44f-d064-4d3c-a43e-de01a7a8785e', '5f9873e9-0308-4a8e-84b7-1c4c61f37654', 3, 'Flowinstance', '我的流程', 'fa fa-user-o', '/FlowManage/Flowinstance/Index', 'iframe', 1, 0, 0, 0, 0, 0, 0, 0, 1, '', '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-07-24 15:59:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('c9a88d3e-e66b-4929-906a-f6eaec00527f', 'b398f0e5-44d3-4206-9d90-e2f5d2740379', 2, 'DingTalkManage', '钉钉应用', 'fa fa-mobile-phone', NULL, 'expand', 1, 1, 0, 0, 0, 0, 0, 0, 1, '', '2020-11-21 09:09:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-11-21 09:52:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('cf527f37-2b29-403a-a83b-a6fb0af33b7f', '5c4c18b1-88be-4819-ab5a-199bba8ae070', 3, 'StorageChangeReport', '库存变动记录', '', '/ReportRecord/StorageChangeReport/Index', 'iframe', 1, 0, 0, 0, 0, 0, 9, 0, 1, '', '2021-02-26 08:53:12', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-26 08:55:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('d5be1a41-547d-4001-8ae7-f6568e4d6cfe', '0', 1, 'MesManage', 'MES系统', '', NULL, 'expand', 1, 1, 0, 0, 0, 0, 1, 0, 1, '', '2020-11-18 10:37:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('d742c96e-b61c-4cea-afeb-81805789687b', '462027E0-0848-41DD-BCC3-025DCAE65555', 2, 'ItemsType', '字典分类', 'fa fa-align-justify', '/SystemManage/ItemsType/Index', 'iframe', 0, 0, 0, 0, 0, 0, 6, 0, 1, '', '2020-04-27 16:51:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-15 14:57:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('d9078b9a-5db6-4429-b489-3700e56f367f', '462027E0-0848-41DD-BCC3-025DCAE65555', 3, 'PrintTemplate', '打印模板', 'fa fa-print', '/SystemManage/PrintTemplate/Index', 'iframe', 1, 0, 0, 0, 0, 0, 10, 0, 1, '', '2021-01-14 13:24:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-14 13:57:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('db891a42-1b8a-4797-9518-2b038f457a25', '5c4c18b1-88be-4819-ab5a-199bba8ae070', 3, 'MaterialReport', '物料追溯', '', '/ReportRecord/MaterialReport/Index', 'iframe', 1, 0, 0, 0, 0, 0, 0, 0, 1, '', '2021-02-26 08:54:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', '101358e6-eb92-431a-9f05-949f05738506', 3, 'TransferBox', '流转箱管理', 'fa fa-paper-plane-o', '/MaterialManage/TransferBox/Index', 'iframe', 1, 0, 0, 0, 0, 0, 2, 0, 1, '', '2020-12-14 12:44:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 09:50:28', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('e3188a69-de3a-40ef-a5ff-5eaf460f5d20', '73FD1267-79BA-4E23-A152-744AF73117E9', 3, 'OpenJobs', '定时任务', 'fa fa-paper-plane-o', '/SystemSecurity/OpenJobs/Index', 'iframe', 1, 0, 0, 0, 0, 0, 3, 0, 1, '', '2020-05-26 13:55:22', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-07-08 10:13:54', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('e9190a56-e173-4483-8a3e-f17b86e4766e', 'a5b323e7-db24-468f-97d7-a17bf5396742', 3, 'Message', '通知管理', 'fa fa-info-circle', '/InfoManage/Message/Index', 'iframe', 1, 0, 0, 0, 0, 0, 1, 0, 1, '', '2020-07-29 16:44:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-08-03 16:13:56', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('ea9864ce-e397-42b0-8819-0680b78fcf4c', 'a955a782-35d2-4a47-b6de-2c93a0e524b2', 2, 'MesOutstorageApp', '出库应用', '', NULL, 'expand', 0, 0, 0, 0, 0, 0, 3, 0, 1, '', '2021-04-27 15:27:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, 'MesOutstorageApp');
INSERT INTO `sys_module` VALUES ('eb3cf8ac-947d-4091-9c8e-75da8bae5e7f', '5c4c18b1-88be-4819-ab5a-199bba8ae070', 3, 'OutStorageReport', '出库记录', '', '/ReportRecord/OutStorageReport/Index', 'iframe', 1, 0, 0, 0, 0, 0, 2, 0, 1, '', '2021-02-26 08:40:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-26 08:54:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('ed757a25-82d5-43cc-89f4-ed26a51fb4f0', '462027E0-0848-41DD-BCC3-025DCAE65555', 2, 'ModuleButton', '菜单按钮', 'fa fa-arrows-alt', '/SystemManage/ModuleButton/Index', 'iframe', 0, 0, 0, 0, 0, 0, 3, 0, 1, '', '2020-04-27 16:56:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-15 14:55:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('ed896675-541a-4d34-bf77-29c87d7a26bb', '101358e6-eb92-431a-9f05-949f05738506', 3, 'Material', '物料管理', 'fa fa-product-hunt', '/MaterialManage/Material/Index', 'iframe', 1, 0, 0, 0, 0, 0, 3, 0, 1, '', '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 09:50:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('ee136db7-178a-4bb0-b878-51287a5e2e2b', '5f9873e9-0308-4a8e-84b7-1c4c61f37654', 3, 'DoneFlow', '已处理流程', 'fa fa-history', '/FlowManage/Flowinstance/DoneFlow', 'iframe', 1, 0, 0, 0, 0, 0, 2, 0, 1, '', '2020-07-15 15:05:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('eeb05603-45d5-4205-88fc-0fe60357710d', 'a955a782-35d2-4a47-b6de-2c93a0e524b2', 2, 'MesInstorageApp', '入库应用', '', NULL, 'expand', 0, 0, 0, 0, 0, 0, 2, 0, 1, '', '2021-04-27 15:19:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0, 'MesInstorageApp');
INSERT INTO `sys_module` VALUES ('f82fd629-5f3a-45d6-8681-5ec47e66a807', '462027E0-0848-41DD-BCC3-025DCAE65555', 3, 'Flowscheme', '流程设计', 'fa fa-list-alt', '/SystemManage/Flowscheme/Index', 'iframe', 1, 0, 0, 0, 0, 0, 9, 0, 1, '', '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-02 09:47:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('ffcf9006-570e-44f5-80d4-32c213813a92', '5c4c18b1-88be-4819-ab5a-199bba8ae070', 3, 'OutputReport', '产出记录', '', '/ReportRecord/OutputReport/Index', 'iframe', 1, 0, 0, 0, 0, 0, 8, 0, 1, '', '2021-02-26 08:52:04', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-26 08:55:14', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');

-- ----------------------------
-- Table structure for sys_modulebutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_modulebutton`;
CREATE TABLE `sys_modulebutton`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_MODULEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_PARENTID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LAYERS` int NULL DEFAULT NULL,
  `F_ENCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_FULLNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ICON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LOCATION` int NULL DEFAULT NULL,
  `F_JSEVENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_URLADDRESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_SPLIT` tinyint NULL DEFAULT NULL,
  `F_ISPUBLIC` tinyint NULL DEFAULT NULL,
  `F_ALLOWEDIT` tinyint NULL DEFAULT NULL,
  `F_ALLOWDELETE` tinyint NULL DEFAULT NULL,
  `F_SORTCODE` int NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_AUTHORIZE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE,
  INDEX `IX_SYS_MODULEBUTTON`(`F_MODULEID`, `F_LAYERS`, `F_ENCODE`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_modulebutton
-- ----------------------------
INSERT INTO `sys_modulebutton` VALUES ('00121ebb-3871-465d-9586-cd38c5a25b18', '6bdd6d88-4391-476e-bcec-10e41cbdcea7', '0', 1, 'NF-add', '清空记录', NULL, 1, 'add', '/ReportRecord/EqpWorkTime/Fotm', 0, 0, 0, 0, 1, 0, 1, '', '2021-04-08 11:40:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-04-08 11:41:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('0063eff0-11b4-4da6-b864-f6e3b4c3f89a', '6d903aa1-35e3-4b75-b2a4-261be30a0e15', '0', 1, 'NF-add', '预警', NULL, 1, 'add', '/ReportRecord/AllStorageReport/Form', 0, 0, 0, 0, 0, 0, 1, '', '2021-04-01 14:26:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-04-01 14:26:36', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('00eafd02-2d7e-4750-a799-3d8cdf062b14', 'eeb05603-45d5-4205-88fc-0fe60357710d', '0', 1, 'InStorageCancleBanding', '入库取消绑定', NULL, 1, 'InStorageCancleBanding', '', NULL, 0, 0, 0, 1, 0, 1, '', '2021-04-27 16:05:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'InStorageCancleBanding');
INSERT INTO `sys_modulebutton` VALUES ('01600a2b-c218-48d6-bb37-842daa727248', '152a8e93-cebb-4574-ae74-2a86595ff986', '0', 1, 'NF-delete', '删除字段', NULL, 2, 'delete', '/SystemManage/ModuleFields/DeleteForm', 0, 0, 0, 0, 2, 0, 1, '', '2020-05-21 14:39:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-21 15:15:16', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('02a4ee76-4715-4d98-a742-f7ecd7e7d9dd', 'b5ff9591-f939-41c0-8c68-3b9c2fe02bdd', '0', 1, 'ReturnCheckout', '质检返库', NULL, 1, 'ReturnCheckout', '', NULL, 0, 0, 0, 5, 0, 1, '', '2021-05-26 09:24:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'ReturnCheckout');
INSERT INTO `sys_modulebutton` VALUES ('05a198ba-cafa-42c2-8ed8-3140f9c4ef9d', 'd9078b9a-5db6-4429-b489-3700e56f367f', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/SystemManage/PrintTemplate/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2021-01-14 13:24:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('064d1ffc-40dd-4bf2-8e7e-aab42e683995', 'b39698da-6117-433e-8a02-ef1392d1fe3b', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/QualityManage/ScapMaterial/Details', 0, 0, 0, 0, 0, 0, 1, NULL, '2021-05-21 13:59:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('071f5982-efb2-4fa3-a6cf-a02f3f1f9d92', 'ed757a25-82d5-43cc-89f4-ed26a51fb4f0', '0', 1, 'NF-add', '新增按钮', NULL, 1, 'add', '/SystemManage/ModuleButton/Form', 0, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, '2020-04-27 16:56:56', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('0726694c-417d-4222-bbe6-268fec47145f', '91448822-e10b-4146-b9fe-2669073cc7f1', '0', 1, 'NeedMaterialJob', '生产领用申请', NULL, 1, 'NeedMaterialJob', '', NULL, 0, 0, 0, 0, 0, 1, '', '2021-04-27 15:53:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'NeedMaterialJob');
INSERT INTO `sys_modulebutton` VALUES ('08d92a20-b747-4c5a-8a06-c1ce8588c7ce', '39fce29e-2d24-934c-432b-87fda7e92d81', '0', 1, 'NF-time', '设置时间', NULL, 1, 'time', '/ClassTask/ControlJobUserBanding/TimeForm', NULL, 0, 0, 0, 1, 0, 1, '', '2021-06-08 09:57:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d92a3f-db7e-48a4-85f6-6fa01dfa49e2', '08d92a3f-bdb2-42be-89c7-fae5d3a4fec3', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/EquipmentManage/EqpPqcCheckitem/Form', 0, 0, 0, 0, 0, 0, 1, '', '2021-06-08 13:40:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-08 13:41:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d92a3f-db7e-492e-8761-8d531b99eea2', '08d92a3f-bdb2-42be-89c7-fae5d3a4fec3', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/EquipmentManage/EqpPqcCheckitem/Form', 0, 0, 0, 0, 1, 0, 1, '', '2021-06-08 13:40:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-08 13:41:17', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d92a3f-db7e-496f-8818-7e8575081481', '08d92a3f-bdb2-42be-89c7-fae5d3a4fec3', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/EquipmentManage/EqpPqcCheckitem/DeleteForm', 0, 0, 0, 0, 2, 0, 1, '', '2021-06-08 13:40:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-08 13:41:36', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d92a3f-db7e-49c7-8997-8b28aa22bd1f', '08d92a3f-bdb2-42be-89c7-fae5d3a4fec3', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/EquipmentManage/EqpPqcCheckitem/Details', 0, 0, 0, 0, 3, 0, 1, '', '2021-06-08 13:40:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-08 13:41:43', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d92ba9-f27c-4d5f-8d21-1acdd7cd6c4b', '69f6aebb-965b-4380-910f-99aba0776261', '0', 1, 'NF-import', '导入', NULL, 1, 'import', '/MaterialManage/Storage/Import', NULL, 0, 0, 0, 2, 0, 1, '', '2021-06-10 08:51:57', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-10 08:52:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d92be4-74ca-4f08-8388-da5aca619fee', '08d92be4-74ba-4edf-8357-49547cae7fbc', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/EquipmentManage/EqpStopRecord/AddForm', 0, 0, 0, 0, 0, 0, 1, '', '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-10-08 09:41:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d92be4-74ca-4f8d-87b4-1be4e1137e9d', '08d92be4-74ba-4edf-8357-49547cae7fbc', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/EquipmentManage/EqpStopRecord/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d92be4-74ca-4fee-8728-e784d4edd9e9', '08d92be4-74ba-4edf-8357-49547cae7fbc', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/EquipmentManage/EqpStopRecord/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d92be4-74cb-4045-8935-d894e9a5098f', '08d92be4-74ba-4edf-8357-49547cae7fbc', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/EquipmentManage/EqpStopRecord/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d92c81-b505-4041-8f6c-f18e9630ed1c', '08d92a3f-bdb2-42be-89c7-fae5d3a4fec3', '0', 1, 'NF-clonebutton', '点检项复制', NULL, 2, 'CloneForm', '/EquipmentManage/EqpPqcCheckitem/CloneForm', 0, 0, 0, 0, 4, 0, 1, '', '2021-06-11 10:36:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-11 10:37:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d92fa2-7437-4d8b-8592-8dce722502bf', '08d92fa2-7423-43dc-8839-359e00c53878', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/ProcessManage/WorkPlan/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d92fa2-7437-4e6b-804d-6843753457d9', '08d92fa2-7423-43dc-8839-359e00c53878', '0', 1, 'NF-batchAdd', '批量创建工单', NULL, 2, 'batchAdd', '/ProcessManage/WorkPlan/BatchCreateWorkOrder', 0, 0, 0, 0, 1, 0, 1, '', '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-17 15:25:04', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d92fa2-7437-4ef3-8737-91cc6871ae8b', '08d92fa2-7423-43dc-8839-359e00c53878', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/ProcessManage/WorkPlan/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d92fb7-7762-4998-8f28-acc9f98831a6', '08d92fb7-7754-4c3b-8341-c60bc590212d', '0', 1, 'TF-add', '新增', NULL, 1, 'add', '/EquipmentManage/EqpRepair/ManRecordForm', 0, 0, 0, 0, 4, 0, 1, '', '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-17 10:48:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d92fb7-7762-4a62-8cbb-c60e9098f62e', '08d92fb7-7754-4c3b-8341-c60bc590212d', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/EquipmentManage/EqpRepair/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d92fb7-7762-4aa6-828e-83a1a9b06913', '08d92fb7-7754-4c3b-8341-c60bc590212d', '0', 1, 'TF-delete', '删除', NULL, 2, 'delete', '/EquipmentManage/EqpRepair/ManRecordDeleteForm', 0, 0, 0, 0, 5, 0, 1, '', '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-17 10:49:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d92fb7-7762-4ae8-83f5-2aeed3949514', '08d92fb7-7754-4c3b-8341-c60bc590212d', '0', 1, 'TF-details', '查看', NULL, 2, 'details', '/EquipmentManage/EqpRepair/ManRecordDetails', 0, 0, 0, 0, 6, 0, 1, '', '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-18 08:50:36', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d9313a-3be4-4173-8d12-5227170b7c60', '08d92fb7-7754-4c3b-8341-c60bc590212d', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/EquipmentManage/EqpRepair/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2021-06-17 10:47:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d9313a-3be4-4281-842e-de7dcfdeaa34', '08d92fb7-7754-4c3b-8341-c60bc590212d', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/EquipmentManage/EqpRepair/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2021-06-17 10:47:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d93158-2734-48a5-8aaa-cb936a2d8dd9', '08d93158-2459-490a-868d-a826777f22e4', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/MaterialManage/TransferBoxBatch/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2021-06-17 14:21:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d93158-2734-4988-8ec7-b05bdd501837', '08d93158-2459-490a-868d-a826777f22e4', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/MaterialManage/TransferBoxBatch/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2021-06-17 14:21:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d93158-2734-4a10-810d-19bf895a26f1', '08d93158-2459-490a-868d-a826777f22e4', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/MaterialManage/TransferBoxBatch/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2021-06-17 14:21:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d93159-94c7-440b-8243-118a163a60f0', '08d93158-2459-490a-868d-a826777f22e4', '0', 1, 'NF-print', '打印', NULL, 1, 'print', '/MaterialManage/TransferBoxBatch/PrinterForm', NULL, 0, 0, 0, 4, 0, 1, '', '2021-06-17 14:31:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-18 10:14:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d931f3-0997-4e93-8110-2eacfb6cdbbe', '08d92fb7-7754-4c3b-8341-c60bc590212d', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/EquipmentManage/EqpRepair/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2021-06-18 08:50:16', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d93219-b1c6-42da-88e3-b486742cdf43', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', '0', 1, 'NF-enabled', '完成质检', NULL, 2, 'enabled', '/QualityManage/NeedCheck/EnabledForm', 0, 0, 0, 0, 1, 0, 1, '', '2021-06-18 13:26:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-18 13:27:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d93615-5caa-4d8b-831d-d6c728780fc4', '08d93615-4748-4f48-88aa-162ed2db75a9', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/PlanManage/OutStoragePlan/Form', 0, 0, 0, 0, 0, 0, 1, '', '2021-06-23 15:06:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-08-16 20:39:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d93615-5caa-4e25-85fb-a71993e2687e', '08d93615-4748-4f48-88aa-162ed2db75a9', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/PlanManage/OutStoragePlan/DeleteForm', 0, 0, 0, 0, 2, 0, 1, '', '2021-06-23 15:06:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-08-16 20:39:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d93615-773a-47ed-8a25-0cbf31c4f892', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/PlanManage/InStoragePlan/Form', 0, 0, 0, 0, 0, 0, 1, '', '2021-06-23 15:06:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-08-16 20:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d93615-773a-4979-862b-1f1d852fb314', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/PlanManage/InStoragePlan/DeleteForm', 0, 0, 0, 0, 2, 0, 1, '', '2021-06-23 15:06:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-08-16 20:38:54', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d936a5-bfd2-49d6-88fd-9b19bff30f88', '08d92fa2-7423-43dc-8839-359e00c53878', '0', 1, 'NF-createNote', '创建工单', NULL, 1, 'createNote', '/ProcessManage/WorkPlan/CreateWorkOrder', NULL, 0, 0, 0, 3, 0, 1, '', '2021-06-24 08:19:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d93c2e-efcb-4f18-8829-fa085aad9c10', '08d92fa2-7423-43dc-8839-359e00c53878', '0', 1, 'NF-otherAdd', '附加生产', NULL, 1, 'otherAdd', '/ProcessManage/WorkPlan/AddForm', NULL, 0, 0, 0, 4, 0, 1, '', '2021-07-01 09:24:14', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d93d33-d056-459d-8c47-d3aafb539c2b', 'b5ff9591-f939-41c0-8c68-3b9c2fe02bdd', '0', 1, 'BadStorageInfo', '不良品汇总', NULL, 1, 'BadStorageInfo', '', NULL, 0, 0, 0, 7, 0, 1, '', '2021-07-02 16:31:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'BadStorageInfo');
INSERT INTO `sys_modulebutton` VALUES ('08d94a91-7899-437d-8fd2-e1c5e10f61b2', 'a083a171-932a-48b8-b053-13f9b39d555a', '0', 1, 'ConsumeMaterial1', '扫码领用物料', NULL, 1, 'ConsumeMaterial1', '', NULL, 0, 0, 0, 3, 0, 1, '', '2021-07-19 16:44:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'ConsumeMaterial1');
INSERT INTO `sys_modulebutton` VALUES ('08d94a91-8849-4e26-846f-5cd3edbe5d9f', 'a083a171-932a-48b8-b053-13f9b39d555a', '0', 1, 'OutputMaterialLocation1', '扫码产出上架', NULL, 1, 'OutputMaterialLocation1', '', NULL, 0, 0, 0, 4, 0, 1, '', '2021-07-19 16:45:17', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'OutputMaterialLocation1');
INSERT INTO `sys_modulebutton` VALUES ('08d94b27-e1ff-46ab-8f47-46c5c900b0d6', '69f6aebb-965b-4380-910f-99aba0776261', '0', 1, 'NF-print', '打印', NULL, 1, 'print', 'print', NULL, 0, 0, 0, 6, 0, 1, '', '2021-07-20 10:41:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-13 14:23:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d94b38-5252-492f-8acf-744c5a3906bf', 'ea9864ce-e397-42b0-8819-0680b78fcf4c', '0', 1, 'OutStorage1', '扫码下架', NULL, 1, 'OutStorage1', '', NULL, 0, 0, 0, 3, 0, 1, '', '2021-07-20 12:39:12', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'OutStorage1');
INSERT INTO `sys_modulebutton` VALUES ('08d94b47-2fa7-4b05-87a2-e8b827c489c5', '08d94b44-8770-42cb-8dc2-ef4c67a7b162', '0', 1, 'NF-add', '清空记录', NULL, 1, 'add', '/ReportRecord/CheckDateStorage/Fotm', 0, 0, 0, 0, 1, 0, 1, '', '2021-07-20 14:25:36', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-07-20 14:25:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d94c14-e1ca-4206-8a31-d60d885e9ac2', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/PlanManage/Order/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2021-07-21 14:58:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d94c14-e1ca-42ca-8ddc-2ceea031a8ea', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/PlanManage/Order/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2021-07-21 14:58:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d94c14-e1ca-434d-8024-3eb69cce8bb0', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/PlanManage/Order/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2021-07-21 14:58:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d94c14-e1ca-43be-899c-34cd6122a6db', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/PlanManage/Order/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2021-07-21 14:58:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d94fe5-2f1f-4ba2-8d92-63a2e8e3b4be', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', '0', 1, 'NF-enabled', '启用', NULL, 2, 'enabled', '/PlanManage/Order/EnabledForm', 0, 0, 0, 0, 4, 0, 1, '', '2021-07-26 11:26:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-07-26 11:26:56', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d95878-a40e-4413-86f4-21042d7998dc', '08d92fa2-7423-43dc-8839-359e00c53878', '0', 1, 'NF-deleteall', '删除全部计划', NULL, 1, 'deleteall', '/ProcessManage/WorkPlan/DeleteAllForm', NULL, 0, 0, 0, 5, 0, 1, '', '2021-08-06 09:22:22', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d95878-b9f4-47a9-8a4f-e41b9a5c7a1b', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', '0', 1, 'NF-deleteall', '删除全部计划', NULL, 1, 'deleteall', '/PlanManage/InStoragePlan/DeleteAllForm', NULL, 0, 0, 0, 3, 0, 1, '', '2021-08-06 09:22:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-08-16 20:38:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d95878-ce7f-4716-877e-d9d6331e64a3', '08d93615-4748-4f48-88aa-162ed2db75a9', '0', 1, 'NF-deleteall', '删除全部计划', NULL, 1, 'deleteall', '/PlanManage/OutStoragePlan/DeleteAllForm', NULL, 0, 0, 0, 3, 0, 1, '', '2021-08-06 09:23:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-08-16 20:39:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d9612f-406a-4650-8469-829593b485df', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', '0', 1, 'NF-over', '结案', NULL, 1, 'over', '/PlanManage/Order/OverForm', NULL, 0, 0, 0, 5, 0, 1, '', '2021-08-17 11:29:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d963a3-ed2f-468f-8d22-6e20aeea4b71', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', '0', 1, 'NF-enabledAll', '显示全部计划', NULL, 1, 'enabledAll', '/PlanManage/InStoragePlan/EnabledAllForm', NULL, 0, 0, 0, 4, 0, 1, '', '2021-08-20 14:29:56', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-08-23 14:11:57', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d963a3-f586-4385-8db2-d37f37689c90', '08d93615-4748-4f48-88aa-162ed2db75a9', '0', 1, 'NF-enabledAll', '显示全部计划', NULL, 1, 'enabledAll', '/PlanManage/OutStoragePlan/EnabledAllForm', NULL, 0, 0, 0, 4, 0, 1, '', '2021-08-20 14:30:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-08-23 14:12:09', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d96da9-64f0-49d7-8528-fe30b78e529d', '38CA5A66-C993-4410-AF95-50489B22939C', '0', 1, 'NF-print', '打印', NULL, 1, 'print', 'print', NULL, 0, 0, 0, 4, 0, 1, '', '2021-09-02 08:34:16', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-14 14:29:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d97330-c16b-4b70-868c-5f1511c02f78', '08d97330-6dd4-4435-851b-d6b12ea91518', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/SystemManage/ReportTemplate/Form', 0, 0, 0, 0, 0, 0, 1, '', '2021-09-09 09:25:49', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-09-09 13:30:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d97330-c16b-4bf2-8fc3-586be9c6b02a', '08d97330-6dd4-4435-851b-d6b12ea91518', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/SystemManage/ReportTemplate/Form', 0, 0, 0, 0, 1, 0, 1, '', '2021-09-09 09:25:49', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-09-09 13:30:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d97330-c16b-4c5c-88a4-9e05027097a1', '08d97330-6dd4-4435-851b-d6b12ea91518', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/SystemManage/ReportTemplate/DeleteForm', 0, 0, 0, 0, 2, 0, 1, '', '2021-09-09 09:25:49', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-09-09 13:30:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d97330-c16b-4cb8-8329-b6a539ee51ca', '08d97330-6dd4-4435-851b-d6b12ea91518', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/SystemManage/ReportTemplate/Details', 0, 0, 0, 0, 3, 0, 1, '', '2021-09-09 09:25:49', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-09-09 13:30:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d97353-5dbb-4d3b-868c-b64e56ac96a6', 'd9078b9a-5db6-4429-b489-3700e56f367f', '0', 1, 'NF-download', '下载', NULL, 1, 'download', '/SystemManage/PrintTemplate/Download', 0, 0, 0, 0, 4, 0, 1, '', '2021-09-09 13:33:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-09-09 13:33:53', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d97353-77a5-418c-8554-9815ea09cdef', '08d97330-6dd4-4435-851b-d6b12ea91518', '0', 1, 'NF-download', '下载', NULL, 1, 'download', '/SystemManage/ReportTemplate/Download', 0, 0, 0, 0, 4, 0, 1, '', '2021-09-09 13:34:18', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-09-09 13:34:28', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d98082-e408-47c9-8978-0ad58a19a792', '08d98082-e3f5-4234-847c-4ff7cc1d0b9f', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/ProduceReport/GP12CheckReport/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2021-09-26 08:16:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d98082-e408-486b-8448-8b0a9e8add12', '08d98082-e3f5-4234-847c-4ff7cc1d0b9f', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/ProduceReport/GP12CheckReport/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2021-09-26 08:16:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d98082-e408-48ce-85c8-06062ec63c13', '08d98082-e3f5-4234-847c-4ff7cc1d0b9f', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/ProduceReport/GP12CheckReport/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2021-09-26 08:16:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d98082-e408-4926-87c5-6fd8aa21aedd', '08d98082-e3f5-4234-847c-4ff7cc1d0b9f', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/ProduceReport/GP12CheckReport/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2021-09-26 08:16:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('08d98083-00a8-425d-8588-aff74ef85732', '08d98082-e3f5-4234-847c-4ff7cc1d0b9f', '0', 1, 'NF-download', '下载', NULL, 1, 'download', '/ProduceReport/GP12CheckReport/Download', 0, 0, 0, 0, 4, 0, 1, '', '2021-09-26 08:17:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-09-26 08:17:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d98157-42c2-42e6-8f61-10c17452a972', '08d966c3-26bd-4808-8e49-03d2085e08f4', '0', 1, 'NF-add', '停机原因', NULL, 1, 'add', '/ProduceReport/HotProduceReport/Form', NULL, 0, 0, 0, 0, 0, 1, '', '2021-09-27 09:36:43', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d98157-4f3a-4196-81be-d9fe01221b68', '08d9679f-3156-4e38-8788-1c11763b3ece', '0', 1, 'NF-add', '停机原因', NULL, 1, 'add', '/ProduceReport/WeldlineProduceReport/Form', NULL, 0, 0, 0, 0, 0, 1, '', '2021-09-27 09:37:04', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-09-27 09:37:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d98157-6104-4adb-8951-3fc82d041189', '08d9679f-4591-41be-86dc-56924fc0d49c', '0', 1, 'NF-add', '停机原因', NULL, 1, 'add', '/ProduceReport/LaserProduceReport/Form', NULL, 0, 0, 0, 0, 0, 1, '', '2021-09-27 09:37:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-09-27 09:37:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d98256-54bc-4b73-807e-4d3e7dba2b5d', '69f6aebb-965b-4380-910f-99aba0776261', '0', 1, 'NF-done', '批量删除', NULL, 2, 'done', '/MaterialManage/Storage/DoneForm', 0, 0, 0, 0, 2, 0, 1, '', '2021-09-28 16:02:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-09-28 16:03:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d9a4b8-24a5-4b3e-8682-169a9ab29c04', '39226710-b665-489e-aaa0-a8c15d29ed4c', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/MaterialManage/BomInfo/Form', NULL, 0, 0, 0, 1, 0, 1, '', '2021-11-11 10:08:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('08d9a573-f1e5-4726-8a35-4feb68fdb31f', '50cdea18-b06a-43c8-963c-8f52fb9d94de', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/MaterialManage/BomInfo/Form', NULL, 0, 0, 0, 1, 0, 1, '', '2021-11-12 08:32:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('094d05bd-f2d8-47c1-989c-76525539b457', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', '0', 1, 'NF-import', '导入', NULL, 1, 'import', '/MaterialManage/TransferBox/Import', NULL, 0, 0, 0, 5, 0, 1, '', '2021-01-12 12:14:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-12 12:14:29', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('09711a0c-18c9-42e0-9cc4-ebfbc2745200', 'beaddc98-9037-4fc6-8d21-493fe47f20e8', '0', 1, 'TF-add', '新增', NULL, 1, 'add', '/MaterialManage/TransferType/Form', NULL, 0, 0, 0, 4, 0, 1, '', '2020-12-14 14:09:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-14 14:10:04', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('0a1ba1d7-b4f3-45a4-a4da-e70fb25bb766', 'e9190a56-e173-4483-8a3e-f17b86e4766e', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/InfoManage/Message/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2020-07-29 16:44:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('0b1b307b-2aac-456b-acfb-484a05c71bd7', '26452c9a-243d-4c81-97b9-a3ad581c3bf4', '0', 1, 'NF-edit', '修改机构', NULL, 2, 'edit', '/SystemOrganize/Organize/Form', 0, 0, 0, 0, 2, 0, 1, '', NULL, NULL, '2020-07-23 10:47:04', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('0cd16e19-6532-4260-abf8-83b8eb32b25b', '240eb9e4-d5f8-4097-8611-dcdb30c2f49a', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/QualityManage/CheckoutDescription/Form', 0, 0, 0, 0, 2, 0, 1, '', '2021-05-18 08:18:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-05-18 08:18:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('0d777b07-041a-4205-a393-d1a009aaafc7', '423A200B-FA5F-4B29-B7B7-A3F5474B725F', '0', 1, 'NF-edit', '修改字典', NULL, 2, 'edit', '/SystemManage/ItemsData/Form', 0, 0, 0, 0, 3, 0, 1, NULL, NULL, NULL, '2016-07-25 15:37:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('0e156a57-8133-4d1b-9d0f-9b7554e7b1fc', 'd742c96e-b61c-4cea-afeb-81805789687b', '0', 1, 'NF-edit', '修改分类', NULL, 2, 'edit', '/SystemManage/ItemsType/Form', 0, 0, 0, 0, 3, 0, 1, NULL, NULL, NULL, '2020-04-27 16:52:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('0eb93272-6e36-4d9e-866b-b238f41a8581', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', '0', 1, 'NF-Run', '执行', NULL, 1, 'Run', '/ClassTask/ControlJob/RunForm', NULL, 0, 0, 0, 4, 0, 1, '', '2021-01-18 14:25:55', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-18 14:26:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('0f4d177b-1aa4-4807-a4c2-8d918813ac53', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', '0', 1, 'NF-enabled', '启用', NULL, 2, 'enabled', '/MaterialManage/InStorage/EnabledForm', 0, 0, 0, 0, 4, 0, 1, '', '2021-01-04 14:11:21', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-04 14:11:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('0fa5e0a8-c786-40af-81af-b133b42dded5', '262ca754-1c73-436c-a9a2-b6374451a845', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/SystemOrganize/DataPrivilegeRule/DeleteForm', 0, 0, 0, 0, 2, 0, 1, '', '2020-06-01 09:44:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-16 08:13:22', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('0fee2019-e009-4047-876a-c2d8a62f9672', '828084e8-4361-40f2-bd3e-96acb4bc229b', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/RunMonitor/BoardAccount/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2021-01-25 09:03:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('104bcc01-0cfd-433f-87f4-29a8a3efb313', '423A200B-FA5F-4B29-B7B7-A3F5474B725F', '0', 1, 'NF-add', '新建字典', NULL, 1, 'add', '/SystemManage/ItemsData/Form', 0, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, '2016-07-25 15:37:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('1191df4c-0593-4ee8-85ab-ad4f3bbc8184', 'beaddc98-9037-4fc6-8d21-493fe47f20e8', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/SystemManage/ItemsData/DeleteForm', 0, 0, 0, 0, 2, 0, 1, '', '2020-12-14 14:09:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-14 14:11:53', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('13c9a15f-c50d-4f09-8344-fd0050f70086', 'F298F868-B689-4982-8C8B-9268CBF0308D', '0', 1, 'NF-add', '新建岗位', NULL, 1, 'add', '/SystemOrganize/Duty/Form', 0, 0, 0, 0, 1, 0, 1, '', NULL, NULL, '2020-06-16 08:13:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('14617a4f-bfef-4bc2-b943-d18d3ff8d22f', '38CA5A66-C993-4410-AF95-50489B22939C', '0', 1, 'NF-delete', '删除用户', NULL, 2, 'delete', '/SystemOrganize/User/DeleteForm', 0, 0, 0, 0, 3, 0, 1, '', NULL, NULL, '2020-06-16 08:14:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('15362a59-b242-494a-bc6e-413b4a63580e', '38CA5A66-C993-4410-AF95-50489B22939C', '0', 1, 'NF-disabled', '禁用', NULL, 2, 'disabled', '/SystemOrganize/User/DisabledAccount', 0, 0, 0, 0, 6, 0, 1, '', '2016-07-25 15:25:54', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-16 08:14:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('153e4773-7425-403f-abf7-42db13f84c8d', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', '0', 1, 'NF-details', '进度', NULL, 2, 'details', '/FlowManage/Flowinstance/Details', 0, 0, 0, 0, 3, 0, 1, '', '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-07-14 13:58:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('16030e33-e405-4c5b-ae20-d875e471fd04', '7cce1014-5087-4184-9848-77e164be4e17', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/ProcessManage/WorkOrder/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('171f1fa5-6c98-4686-8efa-6534378fb93f', '79c73d26-6f49-463a-9002-98eba48e36b2', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/MaterialManage/Area/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2020-12-17 08:31:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('17a0e46f-28f9-4787-832c-0da25c321ce4', '7cb65e00-8af2-4cf2-b318-8ba28b3c154e', '0', 1, 'NF-download', '下载', NULL, 1, 'download', '/FileManage/Uploadfile/Download', 0, 0, 0, 0, 0, 0, 1, '', '2020-07-22 12:05:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-07-22 14:47:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('17d2d452-bf13-42ce-bcff-68d840a4ce78', 'fb087f6b-fa45-43c7-903c-3a80a450ff45', '0', 1, 'NF-details', '查看详细', NULL, 2, 'details', '/ProductionReport/Tdreport/TdDetails', 0, 0, 0, 0, 4, 0, 1, '', '2021-02-05 08:50:36', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-04 15:51:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('1a588a3b-95d7-4b3a-b50a-d3bc40de9fe3', '7cb65e00-8af2-4cf2-b318-8ba28b3c154e', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/FileManage/Uploadfile/Details', 0, 0, 0, 0, 1, 0, 1, '', '2020-07-22 12:05:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-07-22 14:47:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('1b32e4d2-1e93-4b40-b3f6-da20a5957234', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/MaterialManage/Location/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2020-12-17 08:32:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('1b72be70-e44d-43d6-91d0-dc3ad628d22e', '26452c9a-243d-4c81-97b9-a3ad581c3bf4', '0', 1, 'NF-details', '查看机构', NULL, 2, 'details', '/SystemOrganize/Organize/Details', 0, 0, 0, 0, 4, 0, 1, '', NULL, NULL, '2020-07-23 10:47:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('1c97a035-f3ba-4dc5-a711-5fbf87e24c47', 'a620c016-27cb-46f8-86c9-44c197617524', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/EquipmentManage/EqpUser/DeleteForm', 0, 0, 0, 0, 1, 0, 1, '', '2021-01-15 11:26:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-15 11:26:44', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('1d1e71a6-dd8b-4052-8093-f1d7d347b9bc', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/SystemOrganize/SystemSet/Details', 0, 0, 0, 0, 2, 0, 1, '', '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-16 08:12:44', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('1e4f989f-9110-41e9-bfec-302a671d53af', '79c73d26-6f49-463a-9002-98eba48e36b2', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/MaterialManage/Area/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2020-12-17 08:31:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('1ee1c46b-e767-4532-8636-936ea4c12003', '423A200B-FA5F-4B29-B7B7-A3F5474B725F', '0', 1, 'NF-delete', '删除字典', NULL, 2, 'delete', '/SystemManage/ItemsData/DeleteForm', 0, 0, 0, 0, 4, 0, 1, NULL, NULL, NULL, '2016-07-25 15:37:53', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('208c2915-d6d0-4bb0-8ec4-154f86561f5a', 'e3188a69-de3a-40ef-a5ff-5eaf460f5d20', '0', 1, 'NF-enabled', '启用', NULL, 2, 'enabled', '/SystemSecurity/OpenJobs/ChangeStatus', 0, 0, 0, 0, 4, 0, 1, '', '2020-05-26 13:55:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-27 08:42:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('215c648d-f86a-49cc-b0d5-b68cddcff792', '84e5ec65-f803-485e-b703-4d07eaaf6c05', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/MaterialManage/OutStorage/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('23780fa8-b92c-4c0e-830e-ddcbe6cf4463', '64A1C550-2C61-4A8C-833D-ACD0C012260F', '0', 1, 'NF-modulefields', '字段管理', NULL, 2, 'modulefields', '/SystemManage/ModuleFields/Index', 0, 0, 0, 0, 6, 0, 1, '', '2020-05-21 14:28:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('239077ff-13e1-4720-84e1-67b6f0276979', '91A6CFAD-B2F9-4294-BDAE-76DECF412C6C', '0', 1, 'NF-delete', '删除角色', NULL, 2, 'delete', '/SystemOrganize/Role/DeleteForm', 0, 0, 0, 0, 3, 0, 1, '', NULL, NULL, '2020-06-16 08:13:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('24ba1d09-4675-473e-b429-9d63cc3e50d1', 'fb087f6b-fa45-43c7-903c-3a80a450ff45', '0', 1, 'NF-chart', '曲线分析', NULL, 2, 'chart', '/ProductionReport/Tdreport/ChartEnterDialog', 0, 0, 0, 0, 6, 0, 1, '', '2021-03-24 10:26:04', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-24 10:25:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('25613ba8-8bb2-4357-a8d4-a558cb85eea3', 'af863666-a357-4e06-bffd-df98e1d29ab8', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/EquipmentManage/Equipment/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('28592383-195f-4911-98ce-c817a8c1a716', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', '0', 1, 'NF-banding', '物料绑定', NULL, 1, 'banding', '/MaterialManage/TransferType/Index', NULL, 0, 0, 0, 4, 0, 1, '', '2020-12-14 13:13:21', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-14 14:09:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('29306956-f9b2-4e76-bc23-4b8f02d21be3', 'F298F868-B689-4982-8C8B-9268CBF0308D', '0', 1, 'NF-import', '导入', NULL, 1, 'import', '/SystemOrganize/Duty/Import', NULL, 0, 0, 0, 5, 0, 1, '', '2020-08-12 10:17:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-08-12 10:17:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('29421e16-0ddd-466b-8b6f-19980c01c955', 'ed896675-541a-4d34-bf77-29c87d7a26bb', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/MaterialManage/Material/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('2a05c5ca-1eb3-4204-86fb-e355d798a535', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/MaterialManage/TransferBox/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2020-12-14 12:44:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('2a8f5342-5eb7-491c-a1a9-a2631d8eb5d6', '38CA5A66-C993-4410-AF95-50489B22939C', '0', 1, 'NF-enabled', '启用', NULL, 2, 'enabled', '/SystemOrganize/User/EnabledAccount', 0, 0, 0, 0, 7, 0, 1, '', '2016-07-25 15:28:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-16 08:14:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('2aa1b5c9-57e7-4e1f-bd44-c477fa847d8c', '7cce1014-5087-4184-9848-77e164be4e17', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/ProcessManage/WorkOrder/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('2cde1cd0-cfc8-4901-96ef-1fe0c8bf997c', '2c2ddbce-ee87-4134-9b32-54d0bd572910', '0', 1, 'NF-view', '视图模型', NULL, 1, 'view', '/SystemManage/Form/Index', NULL, 0, 0, 0, 5, 0, 1, '', '2020-07-09 12:06:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('2cfa7ae3-260c-4c48-b7fb-3d94861e9cea', 'beaddc98-9037-4fc6-8d21-493fe47f20e8', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/SystemManage/ItemsData/Details', 0, 0, 0, 0, 3, 0, 1, '', '2020-12-14 14:09:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-14 14:12:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('2ec7f52c-43b7-45bb-8714-17511817d1b8', 'e3188a69-de3a-40ef-a5ff-5eaf460f5d20', '0', 1, 'NF-log', '日志', NULL, 1, 'log', '/SystemSecurity/OpenJobs/Details', NULL, 0, 0, 0, 6, 0, 1, '', '2020-12-02 12:17:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('30bf72ed-f62f-49a9-adfc-49693871605f', 'd742c96e-b61c-4cea-afeb-81805789687b', '0', 1, 'NF-details', '查看分类', NULL, 2, 'details', '/SystemManage/ItemsType/Details', 0, 0, 0, 0, 5, 0, 1, NULL, NULL, NULL, '2020-04-27 16:52:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('310bb831-a46f-4117-9d02-a3e551611dcf', 'e3188a69-de3a-40ef-a5ff-5eaf460f5d20', '0', 1, 'NF-delete', '删除任务', NULL, 2, 'delete', '/SystemSecurity/OpenJobs/DeleteForm', 0, 0, 0, 0, 3, 0, 1, '', '2020-05-26 13:55:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-26 13:56:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('329c0326-ce68-4a24-904d-aade67a90fc7', 'a3a4742d-ca39-42ec-b95a-8552a6fae579', '0', 1, 'NF-details', '查看策略', NULL, 2, 'details', '/SystemSecurity/FilterIP/Details', 0, 0, 0, 0, 4, 0, 1, NULL, NULL, NULL, '2020-04-17 12:51:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('3440df47-fa09-47c2-abe8-44411985701c', 'ed896675-541a-4d34-bf77-29c87d7a26bb', '0', 1, 'NF-eqpbanding', '设备绑定', NULL, 1, 'eqpbanding', '/MaterialManage/MaterialEqp/Index', NULL, 0, 0, 0, 4, 0, 1, '', '2020-12-03 08:05:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-03 08:14:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('34d0a617-86dc-44e1-83fc-815043ac1af4', '91448822-e10b-4146-b9fe-2669073cc7f1', '0', 1, 'OutputMaterial', '生产产出物料', NULL, 1, 'OutputMaterial', '', NULL, 0, 0, 0, 4, 0, 1, '', '2021-04-27 16:02:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'OutputMaterial');
INSERT INTO `sys_modulebutton` VALUES ('352de4d7-1e60-41a8-b983-b79676c6a556', 'ea9864ce-e397-42b0-8819-0680b78fcf4c', '0', 1, 'OutStorageBandingCancle', '出库取消装箱', NULL, 1, 'OutStorageBandingCancle', '', NULL, 0, 0, 0, 2, 0, 1, '', '2021-04-27 16:06:57', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'OutStorageBandingCancle');
INSERT INTO `sys_modulebutton` VALUES ('35fc1b7c-40b0-42b8-a0f9-c67087566289', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/SystemManage/Flowscheme/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('38e39592-6e86-42fb-8f72-adea0c82cbc1', '38CA5A66-C993-4410-AF95-50489B22939C', '0', 1, 'NF-revisepassword', '密码重置', NULL, 2, 'revisepassword', '/SystemOrganize/User/RevisePassword', 0, 0, 0, 0, 5, 0, 1, '', '2016-07-25 14:18:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-16 08:14:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('398edf66-1ca8-4519-b2a7-f202008901c7', 'badc3ee2-fcbb-43ae-9efe-2309f8a63834', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/MaterialManage/MaterialEqp/Form', 0, 0, 0, 0, 0, 0, 1, '', '2020-12-02 16:23:53', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-02 16:24:17', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('39fce29e-2dac-4340-a9ea-1034e0ede28f', '39fce29e-2d24-934c-432b-87fda7e92d81', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/ClassTask/ControlJobUserBanding/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2021-06-03 13:55:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('39fce29e-2dac-c882-a2ae-efe34a55a09f', '39fce29e-2d24-934c-432b-87fda7e92d81', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/ClassTask/ControlJobUserBanding/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2021-06-03 13:55:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('39fce31f-fd77-2934-0b3d-74948cf3d490', '39fce29e-2d24-934c-432b-87fda7e92d81', '0', 1, 'NF-clonebutton', '克隆按人员', NULL, 2, 'clonebutton', '/ClassTask/ControlJobUserBanding/CloneForm', 0, 0, 0, 0, 5, 0, 1, '', '2021-06-03 16:17:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-08 09:57:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('3a2b4848-3749-486a-8986-5f7efe10e4d4', '3108dc9a-a476-4709-be34-1b8ee82d54d6', '0', 1, 'NF-chart', '曲线分析', NULL, 2, 'chart', '/ProductionReport/HotlineData/Chart', 0, 0, 0, 0, 5, 0, 1, '', '2021-02-03 09:39:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-02 12:43:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('3a35c662-a356-45e4-953d-00ebd981cad6', '96EE855E-8CD2-47FC-A51D-127C131C9FB9', '0', 1, 'NF-add', '清空日志', NULL, 1, 'add', '/SystemSecurity/Log/RemoveLog', 0, 0, 0, 0, 1, 0, 1, '', NULL, NULL, '2021-02-26 13:19:54', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('3c20ddc2-8a64-4d3f-bd39-ffcc36dc69c5', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', '0', 1, 'NF-return', '退回', NULL, 1, 'return', '/MaterialManage/TransferBox/ReturnForm', NULL, 0, 0, 0, 7, 0, 1, '', '2021-02-09 13:26:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('3c8bc8ed-4cc4-43bc-accd-d4acb2a0358d', '30c629a0-910e-404b-8c29-a73a6291fd95', '0', 1, 'NF-details', '查看日志', NULL, 2, 'details', '/SystemSecurity/AppLog/Details', 0, 0, 0, 0, 0, 0, 1, '', '2020-07-08 10:41:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-30 15:42:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('3d0e99d1-a150-43dc-84ae-f0e2e0ad2217', 'ed757a25-82d5-43cc-89f4-ed26a51fb4f0', '0', 1, 'NF-edit', '修改按钮', NULL, 2, 'edit', '/SystemManage/ModuleButton/Form', 0, 0, 0, 0, 2, 0, 1, NULL, NULL, NULL, '2020-04-27 16:57:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('3f69d32f-cb3b-4fa0-863b-98b9a090d7e9', '7e4e4a48-4d51-4159-a113-2a211186f13a', '0', 1, 'NF-add', '新建公告', NULL, 1, 'add', '/SystemOrganize/Notice/Form', 0, 0, 0, 0, 1, 0, 1, '', NULL, NULL, '2020-06-16 08:12:18', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('43e09a61-c2b0-46c1-9b81-76d686b390d4', 'ed757a25-82d5-43cc-89f4-ed26a51fb4f0', '0', 1, 'NF-clonebutton', '克隆按钮', NULL, 1, 'clonebutton', '/SystemManage/ModuleButton/CloneButton', 0, 0, 0, 0, 5, 0, 1, NULL, '2020-04-28 09:54:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-11 14:55:36', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('44ac9a8e-f4ac-4b6c-ab1a-8723da6ea36a', '4666f434-3178-42e5-a44f-1f34cadb3c43', '0', 1, 'GetStorage', '库存查询', NULL, 1, 'GetStorage', '', NULL, 0, 0, 0, 0, 0, 1, '', '2021-04-27 16:08:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'GetStorage');
INSERT INTO `sys_modulebutton` VALUES ('45a11ce3-c470-4dad-b5ed-189f8efcadf3', '2ffc3301-8ec2-4157-a4c3-232797aae120', '0', 1, 'NF-Run', '执行', NULL, 1, 'Run', '/ProcessManage/WorkOrderRun/Form', NULL, 0, 0, 0, 0, 0, 1, '', '2020-12-09 08:33:22', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('4727adf7-5525-4c8c-9de5-39e49c268349', '38CA5A66-C993-4410-AF95-50489B22939C', '0', 1, 'NF-edit', '修改用户', NULL, 2, 'edit', '/SystemOrganize/User/Form', 0, 0, 0, 0, 2, 0, 1, '', NULL, NULL, '2020-06-16 08:14:16', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('4748945e-e179-483e-b14a-7cc29cc18ab6', '7cce1014-5087-4184-9848-77e164be4e17', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/ProcessManage/WorkOrder/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('482b1be7-10c2-4ca0-9efd-dcbb15396466', '788d27cb-598d-41da-ac11-b7ddf0914b08', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/DingTalkManage/DingTalkConfig/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('48679ba7-74ef-48ae-9de1-e9fc2eae7621', '7cce1014-5087-4184-9848-77e164be4e17', '0', 1, 'NF-flow', '流程', NULL, 2, 'flow', '/ProcessManage/WorkOrder/Flow', 0, 0, 0, 0, 4, 0, 1, '', '2021-01-08 12:22:09', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-11 12:12:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('491df014-bc06-4d49-bbb5-2235b5436836', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', '0', 1, 'NF-print', '打印', NULL, 1, 'print', 'print', NULL, 0, 0, 0, 4, 0, 1, '', '2021-01-14 14:29:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-14 14:29:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('4b876abc-1b85-47b0-abc7-96e313b18ed8', '423A200B-FA5F-4B29-B7B7-A3F5474B725F', '0', 1, 'NF-itemstype', '分类管理', NULL, 1, 'itemstype', '/SystemManage/ItemsType/Index', 0, 0, 0, 0, 2, 0, 1, NULL, '2016-07-25 15:36:21', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-04-07 14:33:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('4bb19533-8e81-419b-86a1-7ee56bf1dd45', '252229DB-35CA-47AE-BDAE-C9903ED5BA7B', '0', 1, 'NF-delete', '删除机构', NULL, 2, 'delete', '/SystemManage/Organize/DeleteForm', 0, 0, 0, 0, 3, 0, 1, NULL, NULL, NULL, '2020-04-07 14:22:56', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('4c794628-9b09-4d60-8fb5-63c1a37b2b60', '2c2ddbce-ee87-4134-9b32-54d0bd572910', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/SystemManage/Form/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('4d559146-7425-4e67-b02d-f16c41eb481a', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', '0', 1, 'NF-print', '打印', NULL, 1, 'print', 'print', NULL, 0, 0, 0, 6, 0, 1, '', '2021-01-13 14:23:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-13 14:23:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('4e044eb2-a753-4e99-a1af-a707a3475fc5', '0a479fd4-57ca-46db-a8bf-c30d5871b1f9', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/ClassTask/ControlJobPlaner/DeleteForm', 0, 0, 0, 0, 1, 0, 1, '', '2021-01-18 14:53:55', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-18 14:54:11', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('4e44d96b-bd7d-4634-bfe4-9fe2aeec8592', '8968b428-2a8b-4dbe-ad47-73dd408ddd5e', '0', 1, 'TF-delete', '设备-删除', NULL, 1, 'delete', '/ProcessManage/ProcessFlow/DeleteForm', NULL, 0, 0, 0, 5, 0, 1, '', '2020-12-03 11:22:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-06 09:13:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('4e97842e-3b1f-44fc-ba0f-bddf9449a44a', '0bddfade-d5b4-46c3-b0b6-45fb9f728e38', '0', 1, 'NF-add', '清空记录', NULL, 1, 'add', '/ReportRecord/ReturnMaterialReport/Fotm', 0, 0, 0, 0, 1, 0, 1, '', '2021-03-09 14:40:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-09 14:40:04', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('4f727b61-0aa4-45f0-83b5-7fcddfe034e8', 'ed757a25-82d5-43cc-89f4-ed26a51fb4f0', '0', 1, 'NF-delete', '删除按钮', NULL, 2, 'delete', '/SystemManage/ModuleButton/DeleteForm', 0, 0, 0, 0, 3, 0, 1, NULL, NULL, NULL, '2020-04-27 16:57:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('5084abcf-21ec-4edf-bf9f-513bb17514d9', 'eeb05603-45d5-4205-88fc-0fe60357710d', '0', 1, 'InStorageBanding', '入库绑定', NULL, 1, 'InStorageBanding', '', NULL, 0, 0, 0, 0, 0, 1, '', '2021-04-27 16:05:04', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'InStorageBanding');
INSERT INTO `sys_modulebutton` VALUES ('50a6975c-48e2-45d3-932b-8c7423dcc2be', 'af863666-a357-4e06-bffd-df98e1d29ab8', '0', 1, 'NF-banding', '区域绑定', NULL, 1, 'banding', '/EquipmentManage/EqpArea/Index', NULL, 0, 0, 0, 4, 0, 1, '', '2020-12-17 11:17:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 11:19:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('51eb09eb-09be-44ab-82be-10c2e3d1c482', '91448822-e10b-4146-b9fe-2669073cc7f1', '0', 1, 'ReturnMaterialJob', '生产退料申请', NULL, 1, 'ReturnMaterialJob', '', NULL, 0, 0, 0, 1, 0, 1, '', '2021-04-27 16:00:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'ReturnMaterialJob');
INSERT INTO `sys_modulebutton` VALUES ('52613262-e95b-4f2c-b339-d75e9dbf03b2', 'af863666-a357-4e06-bffd-df98e1d29ab8', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/EquipmentManage/Equipment/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('551df1d7-f8fc-4a4e-a34d-5691b589c5c4', 'af863666-a357-4e06-bffd-df98e1d29ab8', '0', 1, 'NF-materialbanding', '物料绑定', NULL, 1, 'NF-materialbanding', '/EquipmentManage/Equipment/MaterialForm', NULL, 0, 0, 0, 5, 0, 1, '', '2021-01-15 11:02:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-07-22 11:27:11', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('55cc5aba-8121-4151-8df5-f6846396d1a3', '2c2ddbce-ee87-4134-9b32-54d0bd572910', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/SystemManage/Form/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('56376d1f-3244-48c8-b5ff-c25793f0811e', '25b77622-ff89-47d2-b0b4-c8c8a7ff74d9', '0', 1, 'NF-add', '清空记录', NULL, 1, 'add', '/ReportRecord/ConsumeReport/Fotm', 0, 0, 0, 0, 1, 0, 1, '', '2021-03-09 14:40:28', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-09 14:40:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('572c3ed8-94e8-4d5e-a0b7-324732f718f8', '2ffc3301-8ec2-4157-a4c3-232797aae120', '0', 1, 'NF-Over', '结束', NULL, 1, 'Over', '/ProcessManage/WorkOrderRun/OverForm', NULL, 0, 0, 0, 1, 0, 1, '', '2020-12-21 14:45:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('5c1265c0-e72a-4bdc-a5be-2515d6afc107', 'fb087f6b-fa45-43c7-903c-3a80a450ff45', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/ProductionReport/Tdreport/DeleteForm', 0, 0, 0, 0, 5, 0, 1, '', '2021-03-24 10:24:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-05 08:51:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('5c321b1f-4f56-4276-a1aa-dd23ce12a1fc', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/FlowManage/Flowinstance/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('5d708d9d-6ebe-40ea-8589-e3efce9e74ec', '91A6CFAD-B2F9-4294-BDAE-76DECF412C6C', '0', 1, 'NF-add', '新建角色', NULL, 1, 'add', '/SystemOrganize/Role/Form', 0, 0, 0, 0, 1, 0, 1, '', NULL, NULL, '2020-06-16 08:13:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('60e3aef8-126d-4bde-a8b5-6b378a1fa9f6', 'beaddc98-9037-4fc6-8d21-493fe47f20e8', '0', 1, 'TF-delete', '删除', NULL, 1, 'delete', '/MaterialManage/TransferType/DeleteForm', NULL, 0, 0, 0, 5, 0, 1, '', '2020-12-14 14:09:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-14 14:10:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('61a54b03-776d-460b-91b5-9b048ea8a15d', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/ClassTask/ControlJob/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('62442d35-234d-4ca1-9105-68ed5a8b4e11', '3108dc9a-a476-4709-be34-1b8ee82d54d6', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/ProductionReport/HotlineData/Details', 0, 0, 0, 0, 4, 0, 1, '', '2021-02-02 12:42:18', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-29 10:27:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('634d0a2e-d274-4d9a-8fa4-d910f1d0eb2c', '828084e8-4361-40f2-bd3e-96acb4bc229b', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/RunMonitor/BoardAccount/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2021-01-25 09:03:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('63cd2162-ab5f-4b7f-9bbd-5c2e7625e639', '152a8e93-cebb-4574-ae74-2a86595ff986', '0', 1, 'NF-details', '查看字段', NULL, 2, 'details', '/SystemManage/ModuleFields/Details', 0, 0, 0, 0, 3, 0, 1, '', '2020-05-21 14:39:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-21 15:11:22', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('641fd85a-96a6-4801-9385-b27fa5d3e564', 'b5ff9591-f939-41c0-8c68-3b9c2fe02bdd', '0', 1, 'CheckoutJob', '质检申请', NULL, 1, 'CheckoutJob', '', NULL, 0, 0, 0, 1, 0, 1, '', '2021-05-26 09:22:49', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'CheckoutJob');
INSERT INTO `sys_modulebutton` VALUES ('6453cb3c-c527-4f74-a09f-48c3d26b5863', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/MaterialManage/TransferBox/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2020-12-14 12:44:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('66fdc1a7-327a-42bd-97e8-8dcfb6212e8c', '84e5ec65-f803-485e-b703-4d07eaaf6c05', '0', 1, 'NF-disabled', '终止', NULL, 2, 'disabled', '/MaterialManage/OutStorage/DisabledForm', 0, 0, 0, 0, 5, 0, 1, '', '2021-01-04 14:32:43', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-04 14:33:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('67dac5bd-b923-43f0-9b29-a850ec8d356e', 'ed896675-541a-4d34-bf77-29c87d7a26bb', '0', 1, 'NF-print', '打印', NULL, 1, 'print', 'print', NULL, 0, 0, 0, 7, 0, 1, '', '2021-01-14 14:30:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-14 14:30:21', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('67e487ea-f49b-4f86-ad1e-f31248f461a8', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/MaterialManage/InStorage/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('6b3aa51b-7590-471a-bd84-49e6589c1f32', '8968b428-2a8b-4dbe-ad47-73dd408ddd5e', '0', 1, 'NF-details', '工序-查看', NULL, 2, 'details', '/ProcessManage/ProcessFlow/Details', 0, 0, 0, 0, 3, 0, 1, '', '2020-12-03 09:49:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-06 09:13:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('6f872aa0-1aae-4f42-a3ba-a61079057749', 'e9190a56-e173-4483-8a3e-f17b86e4766e', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/InfoManage/Message/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2020-07-29 16:44:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('709a4a7b-4d98-462d-b47c-351ef11db06f', '252229DB-35CA-47AE-BDAE-C9903ED5BA7B', '0', 1, 'NF-Details', '查看机构', NULL, 2, 'details', '/SystemManage/Organize/Details', 0, 0, 0, 0, 4, 0, 1, NULL, NULL, NULL, '2020-04-07 14:23:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('73ac1957-7558-49f6-8642-59946d05b8e6', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/SystemManage/Flowscheme/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('746629aa-858b-4c5e-9335-71b0fa08a584', 'ed757a25-82d5-43cc-89f4-ed26a51fb4f0', '0', 1, 'NF-details', '查看按钮', NULL, 2, 'details', '/SystemManage/ModuleButton/Details', 0, 0, 0, 0, 4, 0, 1, NULL, NULL, NULL, '2020-04-27 17:37:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('74eecdfb-3bee-405d-be07-27a78219c179', '38CA5A66-C993-4410-AF95-50489B22939C', '0', 1, 'NF-add', '新建用户', NULL, 1, 'add', '/SystemOrganize/User/Form', 0, 0, 0, 0, 1, 0, 1, '', NULL, NULL, '2020-06-16 08:14:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('7667ca4d-9f37-48af-9c2e-a11801c0ae33', '38CA5A66-C993-4410-AF95-50489B22939C', '0', 1, 'NF-dingcancle', '钉钉清除', NULL, 1, 'dingcancle', '/SystemOrganize/User/DingCancle', NULL, 0, 0, 0, 8, 0, 1, '', '2020-11-19 16:38:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('772eb88a-5f67-4bb1-a122-0c83a2bdb5ef', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', '0', 1, 'NF-add', '申请', NULL, 1, 'add', '/FlowManage/Flowinstance/Form', 0, 0, 0, 0, 0, 0, 1, '', '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-07-14 13:58:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('7e10a7ac-8b65-4c7c-8eee-92d69d7dcbd9', '26452c9a-243d-4c81-97b9-a3ad581c3bf4', '0', 1, 'NF-add', '新建机构', NULL, 1, 'add', '/SystemOrganize/Organize/Form', 0, 0, 0, 0, 1, 0, 1, '', NULL, NULL, '2020-07-23 10:46:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('7ee3ff62-ab18-4886-9451-89b1d152172e', '7e4e4a48-4d51-4159-a113-2a211186f13a', '0', 1, 'NF-details', '查看公告', NULL, 2, 'details', '/SystemOrganize/Notice/Details', 0, 0, 0, 0, 4, 0, 1, '', NULL, NULL, '2020-06-16 08:12:28', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('7f57c359-0c70-414f-9446-55faf534f204', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', '0', 1, 'NF-import', '导入', NULL, 1, 'import', '/MaterialManage/Location/Import', NULL, 0, 0, 0, 5, 0, 1, '', '2021-02-02 08:54:16', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-02 08:57:24', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('810a68f6-40cb-413c-b351-d065173bd6f7', '84e5ec65-f803-485e-b703-4d07eaaf6c05', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/MaterialManage/OutStorage/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('815d472a-abdf-448e-bc67-172123ba60df', 'beaddc98-9037-4fc6-8d21-493fe47f20e8', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/SystemManage/ItemsData/Form', 0, 0, 0, 0, 0, 0, 1, '', '2020-12-14 14:09:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-14 14:11:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('8187bc3a-d003-45e5-9327-7e7267d24fcd', 'ed896675-541a-4d34-bf77-29c87d7a26bb', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/MaterialManage/Material/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('81a8dd98-9ad6-4dcd-b878-25560a7f59f0', '3108dc9a-a476-4709-be34-1b8ee82d54d6', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/ProductionReport/HotlineData/DeleteForm', 0, 0, 0, 0, 3, 0, 1, '', '2021-01-29 10:25:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-29 10:27:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('81c01c51-304c-43a0-aee1-4fc096c58892', '828084e8-4361-40f2-bd3e-96acb4bc229b', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/RunMonitor/BoardAccount/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2021-01-25 09:03:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('822b37d6-3d6a-463b-93fb-fe06f43d90e0', 'af863666-a357-4e06-bffd-df98e1d29ab8', '0', 1, 'NF-print', '打印', NULL, 1, 'print', 'print', NULL, 0, 0, 0, 6, 0, 1, '', '2021-01-14 14:31:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-15 11:02:16', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('82b2f4a2-55a1-4f44-b667-3449739643f6', '262ca754-1c73-436c-a9a2-b6374451a845', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/SystemOrganize/DataPrivilegeRule/Form', 0, 0, 0, 0, 1, 0, 1, '', '2020-06-01 09:44:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-16 08:13:18', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('82f162cb-beb9-4a79-8924-cd1860e26e2e', '423A200B-FA5F-4B29-B7B7-A3F5474B725F', '0', 1, 'NF-details', '查看字典', NULL, 2, 'details', '/SystemManage/ItemsData/Details', 0, 0, 0, 0, 5, 0, 1, NULL, NULL, NULL, '2020-04-17 12:50:57', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('832f5195-f3ab-4683-82ad-a66a71735ffc', '2c2ddbce-ee87-4134-9b32-54d0bd572910', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/SystemManage/Form/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('83690e2c-43f0-489f-9481-4b72ad828d4e', '4666f434-3178-42e5-a44f-1f34cadb3c43', '0', 1, 'StorageChange', '流转箱转移', NULL, 1, 'StorageChange', '', NULL, 0, 0, 0, 3, 0, 1, '', '2021-04-27 16:09:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'StorageChange');
INSERT INTO `sys_modulebutton` VALUES ('8379135e-5b13-4236-bfb1-9289e6129034', 'a3a4742d-ca39-42ec-b95a-8552a6fae579', '0', 1, 'NF-delete', '删除策略', NULL, 2, 'delete', '/SystemSecurity/FilterIP/DeleteForm', 0, 0, 0, 0, 3, 0, 1, NULL, NULL, NULL, '2016-07-25 15:57:57', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('84445468-0716-400e-8072-100a292246b6', '84e5ec65-f803-485e-b703-4d07eaaf6c05', '0', 1, 'NF-print', '打印', NULL, 2, 'print', 'print', NULL, 0, 0, 0, 6, 0, 1, '', '2021-03-29 08:38:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-29 08:38:54', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('85F5212F-E321-4124-B155-9374AA5D9C10', '64A1C550-2C61-4A8C-833D-ACD0C012260F', '0', 1, 'NF-delete', '删除菜单', NULL, 2, 'delete', '/SystemManage/Module/DeleteForm', 0, 0, 0, 0, 3, 0, 1, NULL, NULL, NULL, '2016-07-25 15:41:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('85bfbb9d-24f0-4a6f-8bb8-0f87826d04fa', '152a8e93-cebb-4574-ae74-2a86595ff986', '0', 1, 'NF-add', '新增字段', NULL, 1, 'add', '/SystemManage/ModuleFields/Form', 0, 0, 0, 0, 0, 0, 1, '', '2020-05-21 14:39:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-21 15:38:53', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('87068c95-42c8-4f20-b786-27cb9d3d5ff7', 'e3188a69-de3a-40ef-a5ff-5eaf460f5d20', '0', 1, 'NF-add', '新建任务', NULL, 1, 'add', '/SystemSecurity/OpenJobs/Form', 0, 0, 0, 0, 1, 0, 1, '', '2020-05-26 13:55:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-26 13:56:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('88f7b3a8-fd6d-4f8e-a861-11405f434868', 'F298F868-B689-4982-8C8B-9268CBF0308D', '0', 1, 'NF-details', '查看岗位', NULL, 2, 'details', '/SystemOrganize/Duty/Details', 0, 0, 0, 0, 4, 0, 1, '', NULL, NULL, '2020-06-16 08:14:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('897b1de8-3710-439f-b252-b1d6d06a082c', '4666f434-3178-42e5-a44f-1f34cadb3c43', '0', 1, 'StorageMove', '流转箱移库', NULL, 1, 'StorageMove', '', NULL, 0, 0, 0, 2, 0, 1, '', '2021-04-27 16:09:29', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'StorageMove');
INSERT INTO `sys_modulebutton` VALUES ('89c915bb-35f7-47dc-a206-9deae36b34db', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/ClassTask/ControlJob/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('8a9993af-69b2-4d8a-85b3-337745a1f428', 'F298F868-B689-4982-8C8B-9268CBF0308D', '0', 1, 'NF-delete', '删除岗位', NULL, 2, 'delete', '/SystemOrganize/Duty/DeleteForm', 0, 0, 0, 0, 3, 0, 1, '', NULL, NULL, '2020-06-16 08:13:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('8c0df9a6-af02-4450-bab8-226755f1a806', '240eb9e4-d5f8-4097-8611-dcdb30c2f49a', '0', 1, 'NF-add', '新建', NULL, 1, 'add', '/QualityManage/CheckoutDescription/Form', 0, 0, 0, 0, 1, 0, 1, '', '2021-05-18 08:18:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-05-18 08:18:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('8c4cdddd-24b2-4fb0-9cb3-86273a476d0a', '788d27cb-598d-41da-ac11-b7ddf0914b08', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/DingTalkManage/DingTalkConfig/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('8f32069f-20f3-48c9-8e35-cd245fffcf64', '01849cc9-c6da-4184-92f8-34875dac1d42', '0', 1, 'NF-add', '模板生成', NULL, 2, 'add', '/SystemManage/CodeGenerator/Form', 0, 0, 0, 0, 0, 0, 1, '', NULL, NULL, '2020-07-23 15:36:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('8f698747-a1c3-468d-9279-99990987e0f9', '7e4e4a48-4d51-4159-a113-2a211186f13a', '0', 1, 'NF-delete', '删除公告', NULL, 2, 'delete', '/SystemOrganize/Notice/DeleteForm', 0, 0, 0, 0, 3, 0, 1, '', NULL, NULL, '2021-04-27 14:54:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('90e52c1e-8fbd-4169-95ed-747f1dccfcf9', '8968b428-2a8b-4dbe-ad47-73dd408ddd5e', '0', 1, 'NF-edit', '工序-修改', NULL, 2, 'edit', '/ProcessManage/ProcessFlow/Form', 0, 0, 0, 0, 1, 0, 1, '', '2020-12-03 09:49:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-06 09:13:18', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('91260897-df2c-4228-8323-d42795faaf90', '84e5ec65-f803-485e-b703-4d07eaaf6c05', '0', 1, 'NF-enabled', '启用', NULL, 2, 'enabled', '/MaterialManage/OutStorage/EnabledForm', 0, 0, 0, 0, 4, 0, 1, '', '2021-01-04 14:32:43', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-04 14:32:53', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('91be873e-ccb7-434f-9a3b-d312d6d5798a', '252229DB-35CA-47AE-BDAE-C9903ED5BA7B', '0', 1, 'NF-edit', '修改机构', NULL, 2, 'edit', '/SystemManage/Organize/Form', 0, 0, 0, 0, 2, 0, 1, NULL, NULL, NULL, '2020-04-07 14:22:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('91d768bb-fb68-4807-b3b6-db355bdd6e09', '2c2ddbce-ee87-4134-9b32-54d0bd572910', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/SystemManage/Form/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('9230de13-fb93-43f3-9c27-17bc0f950717', 'd9078b9a-5db6-4429-b489-3700e56f367f', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/SystemManage/PrintTemplate/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2021-01-14 13:24:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('923e066d-a552-450c-af6f-1ced15a71308', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', '0', 1, 'NF-disabled', '终止', NULL, 2, 'disabled', '/MaterialManage/InStorage/DisabledForm', 0, 0, 0, 0, 5, 0, 1, '', '2021-01-04 14:11:21', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-04 14:12:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('926ae4a9-0ecb-4d5e-a66e-5bae15ae27c2', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/SystemOrganize/SystemSet/Form', 0, 0, 0, 0, 1, 0, 1, '', '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-16 08:12:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('957a355d-d931-40f6-9da0-dddfd9135fe0', 'e9190a56-e173-4483-8a3e-f17b86e4766e', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/InfoManage/Message/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2020-07-29 16:44:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('95c46c7a-41d9-45ad-8633-913bece2fafe', 'ed896675-541a-4d34-bf77-29c87d7a26bb', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/MaterialManage/Material/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('9685d895-e557-4212-8afb-c9b4170faeaf', '828084e8-4361-40f2-bd3e-96acb4bc229b', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/RunMonitor/BoardAccount/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2021-01-25 09:03:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('98c2519c-b39f-4bf3-9543-5cc2630a4bbd', '152a8e93-cebb-4574-ae74-2a86595ff986', '0', 1, 'NF-clonefields', '克隆字段', NULL, 1, 'clonefields', '/SystemManage/ModuleFields/CloneFields', 0, 0, 0, 0, 5, 0, 1, '', '2020-05-21 15:39:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-21 15:40:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('9FD543DB-C5BB-4789-ACFF-C5865AFB032C', '64A1C550-2C61-4A8C-833D-ACD0C012260F', '0', 1, 'NF-add', '新增菜单', NULL, 1, 'add', '/SystemManage/Module/Form', 0, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, '2016-07-25 15:41:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('9a908e26-f348-45d1-a470-15d20f798a84', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/MaterialManage/TransferBox/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2020-12-14 12:44:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('9fc77888-bbca-4996-9240-a0f389819f6f', '7e4e4a48-4d51-4159-a113-2a211186f13a', '0', 1, 'NF-edit', '修改公告', NULL, 2, 'edit', '/SystemOrganize/Notice/Form', 0, 0, 0, 0, 2, 0, 1, '', NULL, NULL, '2020-06-16 08:12:21', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('D4FCAFED-7640-449E-80B7-622DDACD5012', '64A1C550-2C61-4A8C-833D-ACD0C012260F', '0', 1, 'NF-details', '查看菜单', NULL, 2, 'details', '/SystemManage/Module/Details', 0, 0, 0, 0, 4, 0, 1, NULL, NULL, NULL, '2020-04-27 17:37:29', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('E29FCBA7-F848-4A8B-BC41-A3C668A9005D', '64A1C550-2C61-4A8C-833D-ACD0C012260F', '0', 1, 'NF-edit', '修改菜单', NULL, 2, 'edit', '/SystemManage/Module/Form', 0, 0, 0, 0, 2, 0, 1, NULL, NULL, NULL, '2016-07-25 15:41:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('FD3D073C-4F88-467A-AE3B-CDD060952CE6', '64A1C550-2C61-4A8C-833D-ACD0C012260F', '0', 1, 'NF-modulebutton', '按钮管理', NULL, 2, 'modulebutton', '/SystemManage/ModuleButton/Index', 0, 0, 0, 0, 5, 0, 1, NULL, NULL, NULL, '2020-04-07 14:34:09', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('a2d11fb0-767d-4ed6-8f7d-7e2f2d47a7cb', 'a2cae27f-0b49-4181-8760-4be3a3560988', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/ClassTask/ControlJob/Details', 0, 0, 0, 0, 0, 0, 1, '', '2021-01-18 14:30:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-19 08:41:24', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('a361156a-db2c-40b9-8449-189ce27da27c', 'ea9864ce-e397-42b0-8819-0680b78fcf4c', '0', 1, 'OutStorageBanding', '出库装箱', NULL, 1, 'OutStorageBanding', '', NULL, 0, 0, 0, 1, 0, 1, '', '2021-04-27 16:06:36', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'OutStorageBanding');
INSERT INTO `sys_modulebutton` VALUES ('a3a37705-a4cb-4f26-b247-dfc68e00046d', '8968b428-2a8b-4dbe-ad47-73dd408ddd5e', '0', 1, 'NF-add', '工序-新增', NULL, 1, 'add', '/ProcessManage/ProcessFlow/Form', 0, 0, 0, 0, 0, 0, 1, '', '2020-12-03 09:49:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-06 09:13:14', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('a525955f-81ad-4521-849a-dbc355531883', 'b5ff9591-f939-41c0-8c68-3b9c2fe02bdd', '0', 1, 'TwoCheckout', '二次质检', NULL, 1, 'TwoCheckout', '', NULL, 0, 0, 0, 4, 0, 1, '', '2021-05-26 09:23:55', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'TwoCheckout');
INSERT INTO `sys_modulebutton` VALUES ('a5c8f6ff-1f2b-4827-88e3-e7af141af6f5', '0a479fd4-57ca-46db-a8bf-c30d5871b1f9', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/ClassTask/ControlJobPlaner/Form', 0, 0, 0, 0, 0, 0, 1, '', '2021-01-18 14:53:55', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-18 14:54:16', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('a9bd165e-2ab0-4463-b054-586d2c0a93f2', '3108dc9a-a476-4709-be34-1b8ee82d54d6', '0', 1, 'NF-cpk', 'Cpk分析', NULL, 2, 'cpk', '/ProductionReport/HotlineData/CpkEnterDialog', 0, 0, 0, 0, 6, 0, 1, '', '2021-01-29 10:25:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-03 09:42:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('aadb4281-3b01-4cfa-9398-767ad60a8703', 'ea9864ce-e397-42b0-8819-0680b78fcf4c', '0', 1, 'OutStorage', '产品出库', NULL, 1, 'OutStorage', '', NULL, 0, 0, 0, 0, 0, 1, '', '2021-04-27 16:06:16', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'OutStorage');
INSERT INTO `sys_modulebutton` VALUES ('aaf58c1b-4af2-4e5f-a3e4-c48e86378191', 'a3a4742d-ca39-42ec-b95a-8552a6fae579', '0', 1, 'NF-edit', '修改策略', NULL, 2, 'edit', '/SystemSecurity/FilterIP/Form', 0, 0, 0, 0, 2, 0, 1, NULL, NULL, NULL, '2016-07-25 15:57:49', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('ab68803e-02ed-4abf-907a-b5878da021fb', '788d27cb-598d-41da-ac11-b7ddf0914b08', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/DingTalkManage/DingTalkConfig/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('abfdff21-8ebf-4024-8555-401b4df6acd9', '38CA5A66-C993-4410-AF95-50489B22939C', '0', 1, 'NF-details', '查看用户', NULL, 2, 'details', '/SystemOrganize/User/Details', 0, 0, 0, 0, 4, 0, 1, '', NULL, NULL, '2020-06-16 08:14:22', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('ac332167-9f87-4d0a-9c0d-0fadd1bfda50', 'a083a171-932a-48b8-b053-13f9b39d555a', '0', 1, 'OutputMaterialLocation', '物流产出上架', NULL, 1, 'OutputMaterialLocation', '', NULL, 0, 0, 0, 2, 0, 1, '', '2021-04-27 16:04:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'OutputMaterialLocation');
INSERT INTO `sys_modulebutton` VALUES ('ad02b7e4-b558-47a4-852d-b141e8ef27aa', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', '0', 1, 'NF-banding', '绑定物料', NULL, 2, 'banding', '/MaterialManage/Location/AddForm', NULL, 0, 0, 0, 6, 0, 1, '', '2021-04-12 14:45:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('ae2cb069-b8f9-4e33-ac9c-10766c5b8a0a', '3108dc9a-a476-4709-be34-1b8ee82d54d6', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/ProductionReport/HotlineData/Form', 0, 0, 0, 0, 2, 0, 1, '', '2021-01-29 10:25:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-29 10:26:55', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('aef967fa-e331-4891-b26e-ad4161b60150', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', '0', 1, 'NF-print', '打印', NULL, 1, 'print', '/QualityManage/NeedCheck/PrinterForm', 0, 0, 0, 0, 0, 0, 1, '', '2021-05-27 12:39:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-07-05 08:43:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('af3ce4e5-ae06-4558-a01b-a6b031c31bfd', '79c73d26-6f49-463a-9002-98eba48e36b2', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/MaterialManage/Area/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2020-12-17 08:31:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('afa6eb2a-9477-4c91-816a-652dce303675', '84e5ec65-f803-485e-b703-4d07eaaf6c05', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/MaterialManage/OutStorage/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('afa9fd66-a535-4fe0-940e-34f413c98355', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/MaterialManage/Location/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2020-12-17 08:32:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('b07d18b7-8f32-4fe8-a402-f1df22b70ef8', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', '0', 1, 'NF-print', '打印', NULL, 2, 'print', 'print', NULL, 0, 0, 0, 6, 0, 1, '', '2021-03-29 08:38:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-29 08:39:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('b2d222c3-ea50-4cb6-b05f-eadd4ab68c04', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/ClassTask/ControlJob/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('b2f7f312-86c7-416a-86a4-c6409e786b11', 'ed896675-541a-4d34-bf77-29c87d7a26bb', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/MaterialManage/Material/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('b4be6eee-3509-4685-8064-34b9cacc690a', 'ee136db7-178a-4bb0-b878-51287a5e2e2b', '0', 1, 'NF-details', '进度', NULL, 2, 'details', '/FlowManage/Flowinstance/Details', 0, 0, 0, 0, 1, 0, 1, '', '2020-07-15 15:05:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-07-15 15:04:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('b55330a1-3190-4cee-aba5-e60a9b515817', 'ed896675-541a-4d34-bf77-29c87d7a26bb', '0', 1, 'NF-bombanding', '工序绑定', NULL, 1, 'bombanding', '/MaterialManage/MaterialBom/Index', NULL, 0, 0, 0, 5, 0, 1, '', '2020-12-03 09:26:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-03 14:41:36', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('b6f741f3-53a1-4dfb-9cd8-cd24da010e1c', '79c73d26-6f49-463a-9002-98eba48e36b2', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/MaterialManage/Area/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2020-12-17 08:31:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('b6fb6da1-ee60-4635-98d5-ccc48a6ea790', '788d27cb-598d-41da-ac11-b7ddf0914b08', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/DingTalkManage/DingTalkConfig/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('b70177e4-40b6-4221-8807-f081310d5540', '84e5ec65-f803-485e-b703-4d07eaaf6c05', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/MaterialManage/OutStorage/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('b7bf4423-23f7-495f-8f09-a402e3e3cfc8', '83d761e9-4ab8-45db-a9ce-32bc148b6922', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/EquipmentManage/EqpArea/DeleteForm', 0, 0, 0, 0, 1, 0, 1, '', '2020-12-17 11:22:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 11:23:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('b83c84e4-6264-4b8e-b319-a49fbf34860d', '262ca754-1c73-436c-a9a2-b6374451a845', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/SystemOrganize/DataPrivilegeRule/Form', 0, 0, 0, 0, 0, 0, 1, '', '2020-06-01 09:44:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-16 08:13:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('b88f2b75-0d9a-4400-8a15-0df5bec263a5', 'beaddc98-9037-4fc6-8d21-493fe47f20e8', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/SystemManage/ItemsData/Form', 0, 0, 0, 0, 1, 0, 1, '', '2020-12-14 14:09:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-14 14:11:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('b8939694-f8e9-4931-a7bd-7114e7170c80', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/MaterialManage/InStorage/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('ba72435b-1185-4108-8020-7310c5a70233', '01849cc9-c6da-4184-92f8-34875dac1d42', '0', 1, 'NF-details', '查看数据表', NULL, 2, 'details', '/SystemManage/CodeGenerator/Details', 0, 0, 0, 0, 2, 0, 1, NULL, NULL, NULL, '2020-05-06 13:12:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('bc8f5f31-f226-41f2-aaff-bdc9571bd54c', 'd9078b9a-5db6-4429-b489-3700e56f367f', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/SystemManage/PrintTemplate/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2021-01-14 13:24:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('be75a305-421e-4d91-9967-dff081e3a4f7', 'eeb05603-45d5-4205-88fc-0fe60357710d', '0', 1, 'InStorageLocation', '入库上架', NULL, 1, 'InStorageLocation', '', NULL, 0, 0, 0, 2, 0, 1, '', '2021-04-27 16:05:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'InStorageLocation');
INSERT INTO `sys_modulebutton` VALUES ('c26b571e-5d29-4d5d-b841-c934edb17ca0', 'cf527f37-2b29-403a-a83b-a6fb0af33b7f', '0', 1, 'NF-add', '清空记录', NULL, 1, 'add', '/ReportRecord/StorageChangeReport/Fotm', 0, 0, 0, 0, 1, 0, 1, '', '2021-03-09 14:41:09', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-09 14:41:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('c3793300-ff6f-4790-89ad-215bc4f3348b', '8941c6fe-7413-40cb-9852-695ecf69662a', '0', 1, 'NF-details', '查看详细', NULL, 2, 'details', '/ProductionReport/AutoCpkLog/CpkLogDetail', 0, 0, 0, 0, 4, 0, 1, '', '2021-02-01 10:08:44', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-05 09:00:36', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('c7f6afc9-0eeb-4ebc-a4e8-5cceedb08604', '6bdd6d88-4391-476e-bcec-10e41cbdcea7', '0', 1, 'NF-details', '查看设备', NULL, 2, 'details', '/ReportRecord/EqpWorkTime/Details', 0, 0, 0, 0, 2, 0, 1, '', '2021-04-08 11:41:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-04-08 11:41:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('c8eed325-56ad-4210-b610-3e3bb68eb0be', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/FlowManage/Flowinstance/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('c97bdd88-5df3-40a9-aa33-fdf2beed9d1c', 'a083a171-932a-48b8-b053-13f9b39d555a', '0', 1, 'ReturnMaterial', '物流退回物料', NULL, 1, 'ReturnMaterial', '', NULL, 0, 0, 0, 1, 0, 1, '', '2021-04-27 16:04:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'ReturnMaterial');
INSERT INTO `sys_modulebutton` VALUES ('ca302b02-6835-41c0-ae24-97dfb690fd1c', '240eb9e4-d5f8-4097-8611-dcdb30c2f49a', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/QualityManage/CheckoutDescription/Details', 0, 0, 0, 0, 4, 0, 1, '', '2021-05-18 08:18:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-05-18 08:18:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('cb409d35-a09a-4808-b278-32f349ae0459', '2ffc3301-8ec2-4157-a4c3-232797aae120', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/ProcessManage/WorkOrderRun/Details', 0, 0, 0, 0, 2, 0, 1, '', '2021-01-08 08:05:16', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-08 08:05:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('cba403cb-6418-44b7-868d-19e04af673ce', 'd742c96e-b61c-4cea-afeb-81805789687b', '0', 1, 'NF-delete', '删除分类', NULL, 2, 'delete', '/SystemManage/ItemsType/DeleteForm', 0, 0, 0, 0, 4, 0, 1, NULL, NULL, NULL, '2020-04-27 16:52:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('ccfb8572-f661-4da2-8bc0-ceff351229ec', '83d761e9-4ab8-45db-a9ce-32bc148b6922', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/EquipmentManage/EqpArea/Form', 0, 0, 0, 0, 0, 0, 1, '', '2020-12-17 11:22:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-17 11:22:57', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('cd65e50a-0bea-45a9-b82e-f2eacdbd209e', '252229DB-35CA-47AE-BDAE-C9903ED5BA7B', '0', 1, 'NF-add', '新建机构', NULL, 1, 'add', '/SystemManage/Organize/Form', 0, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, '2020-04-07 14:22:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('ceb3cbcf-5dca-4d1b-afec-0e356ea33bc6', '69f6aebb-965b-4380-910f-99aba0776261', '0', 1, 'NF-transfer', '库存变动', NULL, 1, 'transfer', '/MaterialManage/Storage/Form', NULL, 0, 0, 0, 1, 0, 1, '', '2020-12-31 09:52:36', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-10 13:43:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('cf235c14-e4ad-478a-8e9c-9f7ec5a80255', '4666f434-3178-42e5-a44f-1f34cadb3c43', '0', 1, 'AreaStorage', '库存汇总', NULL, 1, 'AreaStorage', '', NULL, 0, 0, 0, 1, 0, 1, '', '2021-04-27 16:09:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'AreaStorage');
INSERT INTO `sys_modulebutton` VALUES ('d00db889-23eb-41d4-b941-be4e6e236455', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/MaterialManage/TransferBox/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2020-12-14 12:44:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('d1086ccf-e605-44a4-9777-629810cec02d', '152a8e93-cebb-4574-ae74-2a86595ff986', '0', 1, 'NF-edit', '修改字段', NULL, 2, 'edit', '/SystemManage/ModuleFields/Form', 0, 0, 0, 0, 1, 0, 1, '', '2020-05-21 14:39:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-21 15:15:11', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('d20c1c0a-a0d3-4227-b24f-81ef1bcff60c', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/MaterialManage/InStorage/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('d20ee9fb-48ee-48d2-99e5-44b92cde7ec8', 'b5ff9591-f939-41c0-8c68-3b9c2fe02bdd', '0', 1, 'CheckoutCancle', '取消可疑', NULL, 1, 'CheckoutCancle', '', NULL, 0, 0, 0, 3, 0, 1, '', '2021-05-26 09:23:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'CheckoutCancle');
INSERT INTO `sys_modulebutton` VALUES ('d26da420-7e73-41ef-8361-86551b8dd1bb', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/SystemOrganize/SystemSet/Form', 0, 0, 0, 0, 0, 0, 1, '', '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-16 08:12:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('d2ecb5e8-e5cc-49c8-ba86-dbd7e51ca20b', 'e3188a69-de3a-40ef-a5ff-5eaf460f5d20', '0', 1, 'NF-edit', '修改任务', NULL, 2, 'edit', '/SystemSecurity/OpenJobs/Form', 0, 0, 0, 0, 2, 0, 1, '', '2020-05-26 13:55:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-26 13:56:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('d30ff0f3-39da-4033-a320-56f26edd5b51', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/SystemManage/Flowscheme/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('d4074121-0d4f-465e-ad37-409bbe15bf8a', 'a3a4742d-ca39-42ec-b95a-8552a6fae579', '0', 1, 'NF-add', '新建策略', NULL, 1, 'add', '/SystemSecurity/FilterIP/Form', 0, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, '2016-07-25 15:57:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('d42aaaae-4973-427c-ad86-7a6b20b09325', '605444e5-704f-4cca-8d00-75175e2aef05', '0', 1, 'NF-vft', '处理', NULL, 1, 'vft', '/FlowManage/Flowinstance/Verification', 0, 0, 0, 0, 0, 0, 1, '', '2020-07-15 15:03:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-07-15 15:04:24', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('d4a4bb19-36f5-4267-b264-1a3ea2c510e6', '91448822-e10b-4146-b9fe-2669073cc7f1', '0', 1, 'FinishWorkOrderJob', '工单结束申请', NULL, 1, 'FinishWorkOrderJob', '', NULL, 0, 0, 0, 2, 0, 1, '', '2021-04-27 16:01:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'FinishWorkOrderJob');
INSERT INTO `sys_modulebutton` VALUES ('d5d5de3c-2182-420d-b44e-6c71c5ab1537', 'af863666-a357-4e06-bffd-df98e1d29ab8', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/EquipmentManage/Equipment/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('d6251574-692e-4fce-a3a0-fa1ed64cd05b', 'd9078b9a-5db6-4429-b489-3700e56f367f', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/SystemManage/PrintTemplate/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2021-01-14 13:24:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('d63212a7-5977-43e9-a162-9ff5763f20e2', '240eb9e4-d5f8-4097-8611-dcdb30c2f49a', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/QualityManage/CheckoutDescription/DeleteForm', 0, 0, 0, 0, 3, 0, 1, '', '2021-05-18 08:18:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-05-18 08:18:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('d75fd32e-6ef7-4514-915b-5165794df754', '50cdea18-b06a-43c8-963c-8f52fb9d94de', '0', 1, 'NF-submit', '保存', NULL, 1, 'submit', '/MaterialManage/MaterialBom/SubmitForm', NULL, 0, 0, 0, 0, 0, 1, '', '2021-01-06 08:13:49', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-06 08:14:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('d7a452f3-3596-4339-8803-d61fb4eec013', 'F298F868-B689-4982-8C8B-9268CBF0308D', '0', 1, 'NF-export', '导出', NULL, 1, 'export', '/SystemOrganize/Duty/Export', NULL, 0, 0, 0, 6, 0, 1, '', '2020-08-12 10:17:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-08-12 10:18:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('d8d92dcd-db85-4dde-8df2-d3be835dcc56', '91448822-e10b-4146-b9fe-2669073cc7f1', '0', 1, 'GetWorkOrderInfo', '工单查询', NULL, 1, 'GetWorkOrderInfo', '', NULL, 0, 0, 0, 3, 0, 1, '', '2021-04-27 16:01:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'GetWorkOrderInfo');
INSERT INTO `sys_modulebutton` VALUES ('d9e74251-61ff-4472-adec-ad316cb9a307', 'd742c96e-b61c-4cea-afeb-81805789687b', '0', 1, 'NF-add', '新建分类', NULL, 1, 'add', '/SystemManage/ItemsType/Form', 0, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, '2020-04-27 16:52:12', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('da9da00e-d30a-4ef6-b86d-5f402cd3e64d', '8968b428-2a8b-4dbe-ad47-73dd408ddd5e', '0', 1, 'NF-delete', '工序-删除', NULL, 2, 'delete', '/ProcessManage/ProcessFlow/DeleteForm', 0, 0, 0, 0, 2, 0, 1, '', '2020-12-03 09:49:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-06 09:13:22', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('da9f9a0d-e350-46fd-a44e-e543acaa8d34', '33f831db-f9a4-43e7-8688-d08073af575b', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/ClassTask/ControlJob/Details', 0, 0, 0, 0, 0, 0, 1, '', '2021-01-19 08:41:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-19 08:41:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('dc8064f7-1122-4ebd-820e-79964716c13d', 'be2173ad-0833-4a9a-8024-b9f32f892de5', '0', 1, 'NF-add', '清空记录', NULL, 1, 'add', '/ReportRecord/InStorageReport/Fotm', 0, 0, 0, 0, 1, 0, 1, '', '2021-02-26 13:16:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-09 10:43:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('dd259bbd-51a8-4bfe-adac-586738779351', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/MaterialManage/Location/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2020-12-17 08:32:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('dd9f45e6-0fa5-4c98-8420-8199c9175507', 'a620c016-27cb-46f8-86c9-44c197617524', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/EquipmentManage/EqpUser/Form', 0, 0, 0, 0, 0, 0, 1, '', '2021-01-15 11:26:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-15 11:26:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('dddaa429-6ebb-4d0e-ab1f-86307fa8a385', 'af863666-a357-4e06-bffd-df98e1d29ab8', '0', 1, 'NF-edit', '修改', NULL, 2, 'edit', '/EquipmentManage/Equipment/Form', 0, 0, 0, 0, 1, 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('df626d9c-e3ba-4851-8926-3e175055cc8b', '8941c6fe-7413-40cb-9852-695ecf69662a', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/ProductionReport/AutoCpkLog/DeleteForm', 0, 0, 0, 0, 5, 0, 1, '', '2021-02-05 08:58:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-05 09:00:49', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('e06965bc-b693-4b91-96f9-fc10ca2aa1f0', 'e3188a69-de3a-40ef-a5ff-5eaf460f5d20', '0', 1, 'NF-disabled', '关闭', NULL, 2, 'disabled', '/SystemSecurity/OpenJobs/ChangeStatus', 0, 0, 0, 0, 5, 0, 1, '', '2020-05-26 13:55:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-27 08:42:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('e12bc302-e651-463a-a159-68968ece733a', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/QualityManage/NeedCheck/Details', 0, 0, 0, 0, 2, 0, 1, '', '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-06-18 13:27:24', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('e376d482-023e-4715-a9c8-2a393c24426e', '605444e5-704f-4cca-8d00-75175e2aef05', '0', 1, 'NF-details', '进度', NULL, 2, 'details', '/FlowManage/Flowinstance/Details', 0, 0, 0, 0, 1, 0, 1, '', '2020-07-15 15:03:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-07-15 15:04:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('e46372b7-7c30-4f62-af2b-33a4f3393ddc', 'b5ff9591-f939-41c0-8c68-3b9c2fe02bdd', '0', 1, 'CheckoutInfo', '不良查询', NULL, 1, 'CheckoutInfo', '', NULL, 0, 0, 0, 0, 0, 1, '', '2021-04-27 16:07:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-05-26 09:22:18', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 'CheckoutInfo');
INSERT INTO `sys_modulebutton` VALUES ('e4ddb5b5-d576-4c50-847c-aa501ac5a38c', 'b5ff9591-f939-41c0-8c68-3b9c2fe02bdd', '0', 1, 'FirstCheckout', '常规检验', NULL, 1, 'FirstCheckout', '', NULL, 0, 0, 0, 2, 0, 1, '', '2021-04-27 16:07:54', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-05-26 09:23:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 'FirstCheckout');
INSERT INTO `sys_modulebutton` VALUES ('e6514544-1436-431d-acbc-c44802831ea8', '01849cc9-c6da-4184-92f8-34875dac1d42', '0', 1, 'NF-entitycode', '实体生成', NULL, 2, 'entitycode', '/SystemManage/CodeGenerator/EntityCode', NULL, 0, 0, 0, 1, 0, 1, '', '2020-07-23 15:36:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-07-23 15:36:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('e68fffbb-00bd-465c-9527-b04c554b6ba6', '7cce1014-5087-4184-9848-77e164be4e17', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/ProcessManage/WorkOrder/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('e75e4efc-d461-4334-a764-56992fec38e6', 'F298F868-B689-4982-8C8B-9268CBF0308D', '0', 1, 'NF-edit', '修改岗位', NULL, 2, 'edit', '/SystemOrganize/Duty/Form', 0, 0, 0, 0, 2, 0, 1, '', NULL, NULL, '2020-06-16 08:13:55', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('e8ec8398-2a2e-4b00-82e2-6f2bb19a63cd', '8968b428-2a8b-4dbe-ad47-73dd408ddd5e', '0', 1, 'TF-add', '设备-新增', NULL, 1, 'add', '/ProcessManage/ProcessFlow/EqpForm', NULL, 0, 0, 0, 4, 0, 1, '', '2020-12-03 11:22:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-06 09:13:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('eb71bee8-e348-4892-9257-4b7147921918', 'ed896675-541a-4d34-bf77-29c87d7a26bb', '0', 1, 'NF-import', '导入', NULL, 1, 'import', '/MaterialManage/Material/Import', NULL, 0, 0, 0, 6, 0, 1, '', '2021-01-12 12:14:56', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-12 12:15:14', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('ebbe0e28-966a-402f-bae6-6ceaa5475006', 'eb3cf8ac-947d-4091-9c8e-75da8bae5e7f', '0', 1, 'NF-add', '清空记录', NULL, 1, 'add', '/ReportRecord/OutStorageReport/Fotm', 0, 0, 0, 0, 1, 0, 1, '', '2021-03-09 10:43:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-09 10:43:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('ec452d72-4969-4880-b52f-316ffdfa19bd', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/SystemManage/Flowscheme/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('f0db4138-2d89-4553-9322-5ebb9bbafbc3', '39226710-b665-489e-aaa0-a8c15d29ed4c', '0', 1, 'NF-submit', '保存', NULL, 1, 'submit', '/MaterialManage/BomInfo/SubmitForm', NULL, 0, 0, 0, 0, 0, 1, '', '2021-01-05 16:46:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-01-05 17:07:44', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('f1eb5b12-2898-4aa6-81bf-14473482b764', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/MaterialManage/InStorage/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('f353f74e-644c-4ed5-8558-eef6bdd35985', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/MaterialManage/Location/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2020-12-17 08:32:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('f4299350-e36f-4cd3-90a4-86b418e05f92', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/ClassTask/ControlJob/DeleteForm', 0, 0, 0, 0, 2, 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('f48f69a6-53b7-4636-8738-0748d44353e6', 'ffcf9006-570e-44f5-80d4-32c213813a92', '0', 1, 'NF-add', '清空记录', NULL, 1, 'add', '/ReportRecord/OutputReport/Fotm', 0, 0, 0, 0, 1, 0, 1, '', '2021-03-09 14:40:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-09 14:40:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('f4ed7001-d04e-4b5f-843a-767edc8506f7', 'fb087f6b-fa45-43c7-903c-3a80a450ff45', '0', 1, 'NF-cpk', 'Cpk分析', NULL, 2, 'cpk', '/ProductionReport/Tdreport/CpkEnterDialog', 0, 0, 0, 0, 7, 0, 1, '', '2021-02-04 12:50:18', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-24 10:26:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('f51da6f6-8511-49f3-982b-a30ed0946706', '26452c9a-243d-4c81-97b9-a3ad581c3bf4', '0', 1, 'NF-delete', '删除机构', NULL, 2, 'delete', '/SystemOrganize/Organize/DeleteForm', 0, 0, 0, 0, 3, 0, 1, '', NULL, NULL, '2020-07-23 10:47:09', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('f552d4fa-791c-4891-95ff-298ca775c656', 'badc3ee2-fcbb-43ae-9efe-2309f8a63834', '0', 1, 'NF-delete', '删除', NULL, 2, 'delete', '/MaterialManage/MaterialEqp/DeleteForm', 0, 0, 0, 0, 1, 0, 1, '', '2020-12-02 16:23:53', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-02 16:24:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('f688f8af-262a-4769-9ad5-4122422f072f', 'b5ff9591-f939-41c0-8c68-3b9c2fe02bdd', '0', 1, 'ChangeCheckoutState', '状态变动', NULL, 1, 'ChangeCheckoutState', '', NULL, 0, 0, 0, 6, 0, 1, '', '2021-04-27 16:08:11', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-05-26 09:21:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 'ChangeCheckoutState');
INSERT INTO `sys_modulebutton` VALUES ('f7b696c4-9af0-4bde-b92a-1f9f151007b8', '91448822-e10b-4146-b9fe-2669073cc7f1', '0', 1, 'OutputMaterialCancle', '生产产出取消', NULL, 1, 'OutputMaterialCancle', '', NULL, 0, 0, 0, 5, 0, 1, '', '2021-04-27 16:02:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'OutputMaterialCancle');
INSERT INTO `sys_modulebutton` VALUES ('f85f3bd5-ad1b-43d2-84f6-bbae465c65d9', '667a7393-ed53-43e0-bf2a-c349e5dd48e5', '0', 1, 'NF-add', '清空记录', NULL, 1, 'add', '/ReportRecord/EqpMaterialUseReport/Fotm', 0, 0, 0, 0, 1, 0, 1, '', '2021-03-09 14:39:04', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-09 14:39:17', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '');
INSERT INTO `sys_modulebutton` VALUES ('f8c0cd71-e206-4991-91cf-fa96d5652eac', 'a083a171-932a-48b8-b053-13f9b39d555a', '0', 1, 'ConsumeMaterial', '物流领用物料', NULL, 1, 'ConsumeMaterial', '', NULL, 0, 0, 0, 0, 0, 1, '', '2021-04-27 16:03:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 'ConsumeMaterial');
INSERT INTO `sys_modulebutton` VALUES ('f93763ff-51a1-478d-9585-3c86084c54f3', '91A6CFAD-B2F9-4294-BDAE-76DECF412C6C', '0', 1, 'NF-details', '查看角色', NULL, 2, 'details', '/SystemOrganize/Role/Details', 0, 0, 0, 0, 4, 0, 1, '', NULL, NULL, '2020-06-16 08:13:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('fcb4d9f0-63f0-4bd0-9779-eed26da5c4b3', 'e9190a56-e173-4483-8a3e-f17b86e4766e', '0', 1, 'NF-add', '新增', NULL, 1, 'add', '/InfoManage/Message/Form', 0, 0, 0, 0, 0, 0, 1, NULL, '2020-07-29 16:44:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('ffffe7f8-900c-413a-9970-bee7d6599cce', '91A6CFAD-B2F9-4294-BDAE-76DECF412C6C', '0', 1, 'NF-edit', '修改角色', NULL, 2, 'edit', '/SystemOrganize/Role/Form', 0, 0, 0, 0, 2, 0, 1, '', NULL, NULL, '2020-06-16 08:13:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_modulefields
-- ----------------------------
DROP TABLE IF EXISTS `sys_modulefields`;
CREATE TABLE `sys_modulefields`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_MODULEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ENCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_FULLNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ISPUBLIC` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE,
  INDEX `IX_SYS_MODULEFIELDS`(`F_MODULEID`, `F_ENCODE`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_modulefields
-- ----------------------------
INSERT INTO `sys_modulefields` VALUES ('00a79cc3-a490-4772-909a-38567e3ea6da', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_ProjectName', '项目名称', 0, 1, '', '2020-06-12 14:33:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-12 16:13:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('0153fba2-3b50-4294-b699-43606a5e7fa4', '39226710-b665-489e-aaa0-a8c15d29ed4c', 'F_BomType', 'Bom类型（0erp,1mes）', 0, 1, NULL, '2020-12-03 13:56:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('01722807-2004-4e33-a13d-cbd33d0f917e', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', 'F_DoneNum', '完成数量', 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('01c48d54-a8fe-4471-818e-adb42bd34c41', '79c73d26-6f49-463a-9002-98eba48e36b2', 'F_AreaType', '库区类型', 0, 1, NULL, '2020-12-17 08:31:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('01c5a74f-682c-462e-87af-0eaf445854a9', '79c73d26-6f49-463a-9002-98eba48e36b2', 'F_AreaCode', '库区编号', 0, 1, NULL, '2020-12-17 08:31:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('035d9296-1e17-42b7-9d8f-c9cc3b1d8e3f', '7cb65e00-8af2-4cf2-b318-8ba28b3c154e', 'F_FileExtension', '文件扩展名', 0, 1, NULL, '2020-07-22 12:05:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('06896834-cc65-47bd-9bcc-55526f828d6e', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', 'F_Num', '检验数量', 0, 1, NULL, '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92be4-74cb-40ab-8cc3-0a7932cc0be3', '08d92be4-74ba-4edf-8357-49547cae7fbc', 'F_EqpId', 'F_EqpId', 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92be4-74cb-410a-887f-faa313013934', '08d92be4-74ba-4edf-8357-49547cae7fbc', 'F_StopType', '1：故障停机，2：计划内停机', 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92be4-74cb-4171-867f-b5ae990e1af5', '08d92be4-74ba-4edf-8357-49547cae7fbc', 'F_PlanStopStartTime', '计划停机开始时间', 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92be4-74cb-41c6-842a-b6d5f1616da6', '08d92be4-74ba-4edf-8357-49547cae7fbc', 'F_PlanStopEndTime', '计划停机结束时间', 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92be4-74cb-422b-8d95-2f44b8b5d33e', '08d92be4-74ba-4edf-8357-49547cae7fbc', 'F_StopReasonType', '停机原因分类：1人2机3料4法5环', 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92be4-74cb-4280-81dd-eb3f81e52386', '08d92be4-74ba-4edf-8357-49547cae7fbc', 'F_StopReason', '停机原因', 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92be4-74cb-42bf-819b-093738061c33', '08d92be4-74ba-4edf-8357-49547cae7fbc', 'F_RealStopStartTime', '实际停机开始时间', 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92be4-74cb-42fa-8eee-4478e878b9f9', '08d92be4-74ba-4edf-8357-49547cae7fbc', 'F_RealStopEndTime', '实际停机结束时间', 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92be4-74cb-4335-8fed-933cb6bb87b5', '08d92be4-74ba-4edf-8357-49547cae7fbc', 'F_Solution', '解决措施', 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92be4-74cb-4371-8d66-b6349a315591', '08d92be4-74ba-4edf-8357-49547cae7fbc', 'F_Description', '备注', 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92be4-74cb-43ac-8f96-7678560197e2', '08d92be4-74ba-4edf-8357-49547cae7fbc', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92be4-74cb-43e9-8779-93727f0924e4', '08d92be4-74ba-4edf-8357-49547cae7fbc', 'F_CreatorUserId', 'F_CreatorUserId', 0, 1, NULL, '2021-06-10 15:50:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fa2-7438-4012-80c1-3bfe8c202004', '08d92fa2-7423-43dc-8839-359e00c53878', 'F_WorkPlanCode', '计划编号', 0, 1, NULL, '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fa2-7438-40a5-8de9-97e1e68dd328', '08d92fa2-7423-43dc-8839-359e00c53878', 'F_MaterialId', '料号Id', 0, 1, NULL, '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fa2-7438-4125-8e5b-6bde895875ce', '08d92fa2-7423-43dc-8839-359e00c53878', 'F_PlanNum', '计划数量', 0, 1, NULL, '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fa2-7438-41b4-8dc6-451275072498', '08d92fa2-7423-43dc-8839-359e00c53878', 'F_PlanStartTime', '计划开始时间', 0, 1, NULL, '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fa2-7438-4244-8db5-520b82fb8b17', '08d92fa2-7423-43dc-8839-359e00c53878', 'F_PlanEndTime', '计划结束时间', 0, 1, NULL, '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fa2-7438-42d4-85fb-cfdddd6e954d', '08d92fa2-7423-43dc-8839-359e00c53878', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fa2-7438-4361-88e1-8b94d9d774d3', '08d92fa2-7423-43dc-8839-359e00c53878', 'F_Description', '备注', 0, 1, NULL, '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fa2-7438-43f0-8246-a64ba6637ee1', '08d92fa2-7423-43dc-8839-359e00c53878', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fa2-7438-4474-84a8-37e072b7eaf2', '08d92fa2-7423-43dc-8839-359e00c53878', 'F_CreatorUserId', 'F_CreatorUserId', 0, 1, NULL, '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fa2-7438-44f3-8581-3b191ee12ce5', '08d92fa2-7423-43dc-8839-359e00c53878', 'F_SplitType', 'F_SplitType', 0, 1, NULL, '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fa2-7438-456f-8c25-2435376aefbe', '08d92fa2-7423-43dc-8839-359e00c53878', 'F_DoneNum', '完成数量', 0, 1, NULL, '2021-06-15 10:08:23', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4b2b-84f6-19133394a7e9', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_RepairNo', '维修单号', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4b78-833a-899f8810120b', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_EqpId', 'F_EqpId', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4bcb-8494-7aa7648d7ead', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_ProblemType', '故障分类', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4c1d-89c6-c9739106ad52', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_ProblemClass', '故障等级：低级，中级，高级', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4c70-8ada-cbbf32f483f1', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_ProblemDesc', '故障描述', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4cc4-88ca-dd845207a850', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_PhotoPath', '故障图片路径', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4d17-801e-0c640c99ca1b', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_CallRepairMan', '报修人ID', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4d6d-8acf-bb570a4a409f', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_CallRepairTime', '报修时间', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4dc0-89b8-8d6486fc7083', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_DistributeTime', '派工时间', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4e13-8f81-d9fea77f4f50', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_StartRepairTime', '维修开始时间', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4e55-8942-bea5dd5458f6', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_EndRepairTime', '维修结束时间', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4e94-8c77-c3c91965b82e', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_Status', '状态：1,报修；2，已派工；3,维修中；4，确认中，5，关闭', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4ed1-857d-74c68411f4b6', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_ConfirmMan', '确认人ID,同报修人', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4f0e-8059-7c3992125358', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_ConfirmTime', '确认时间', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4f4b-8361-4ff2077066ef', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4f88-83e5-c2c3c57928db', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_Description', '备注', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7762-4fc6-875d-160b3eea6b71', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d92fb7-7763-4031-8bbd-9b1edf82690d', '08d92fb7-7754-4c3b-8341-c60bc590212d', 'F_CreatorUserId', 'F_CreatorUserId', 0, 1, NULL, '2021-06-15 12:38:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d93158-2734-4af9-845b-b260d1c782ac', '08d93158-2459-490a-868d-a826777f22e4', 'F_BatchName', '容器条码名称', 0, 1, NULL, '2021-06-17 14:21:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d93158-2734-4b71-888e-16ae948f2291', '08d93158-2459-490a-868d-a826777f22e4', 'F_MaxNum', '容器最大数', 0, 1, NULL, '2021-06-17 14:21:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d93158-2734-4be3-8197-da919fbb5bf9', '08d93158-2459-490a-868d-a826777f22e4', 'F_BatchCode', '条码当前编号', 0, 1, NULL, '2021-06-17 14:21:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd24-496f-88bd-e29db67c6d88', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_InStorageCode', '入库单编号', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd24-4a18-88c3-caee22d95444', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_MaterialId', '料号Id', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd24-4aa7-8984-c004045ae8c6', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_MaterialCode', '料号描述', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd24-4b4a-8953-8391f90872b8', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_MaterialName', '料号描述', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd24-4bde-8882-e415c95a7820', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_MaterialUnit', '料号单位', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd24-4c72-86f8-fb652be55cc1', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_MaterialType', '料号分类', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd24-4cee-8b23-657dba7aaa1d', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd24-4d74-864f-96df96694674', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_Description', '备注', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd24-4df4-8797-16226c1e2444', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_CreatorTime', '创建时间', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd24-4e84-852a-ed87518334f1', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_CreatorUserId', '创建人id', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd24-4eff-8c7a-5b7b7957158a', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_Num', '数量', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd24-4fde-865f-661381dfcd10', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_DoneNum', '完成数量', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd25-4057-8c67-32866d3ef6ad', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_InStorageState', '入库单状态', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd25-40c9-89cb-2c81a0508f58', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_BadNum', '不良数量', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd25-413a-8f13-d1793e7816eb', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_BatchJson', '批号列表', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd25-41a7-8bab-77b3c68008f0', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_PlanTime', '计划时间', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9360c-dd25-4218-882a-2fe5e52e8123', '08d9360c-dd12-43e8-8ebe-0104c5bd3c08', 'F_CarNo', '车牌', 0, 1, NULL, '2021-06-23 14:05:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d94c14-e1ca-4436-8a1a-39fba065ab87', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', 'F_OrderCode', '订单编号', 0, 1, NULL, '2021-07-21 14:58:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d94c14-e1ca-44b2-89c9-dccc224cbb7c', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', 'F_Customer', '客户', 0, 1, NULL, '2021-07-21 14:58:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d94c14-e1ca-4529-8a4b-dd62bde75495', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', 'F_PlanStartTime', '计划开始时间', 0, 1, NULL, '2021-07-21 14:58:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d94c14-e1ca-459d-8aed-9bfec1abd366', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', 'F_PlanEndTime', '计划结束时间', 0, 1, NULL, '2021-07-21 14:58:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d94c14-e1ca-4614-84d2-4ba39de1a91e', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', 'F_DayNum', '天数', 0, 1, NULL, '2021-07-21 14:58:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d94c14-e1ca-4688-8217-c8caed2fad93', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2021-07-21 14:58:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d94c14-e1ca-46ff-8b5b-6d65f54c43fc', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', 'F_Description', '备注', 0, 1, NULL, '2021-07-21 14:58:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d94c14-e1ca-4776-8a2a-adf8bbe68a4a', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2021-07-21 14:58:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d94c14-e1ca-47e7-8a04-df5a5a5d5fb6', '08d94c14-e1b5-4b56-8873-37fb81ebaad3', 'F_CreatorUserId', 'F_CreatorUserId', 0, 1, NULL, '2021-07-21 14:58:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d966c3-26cc-42e9-8419-b4b307abffe8', '08d966c3-26bd-4808-8e49-03d2085e08f4', 'F_EqpId', '设备ID', 0, 1, NULL, '2021-08-24 13:51:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d966c3-26cc-4375-836b-558a4d944edd', '08d966c3-26bd-4808-8e49-03d2085e08f4', 'F_Date', '日期', 0, 1, NULL, '2021-08-24 13:51:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d966c3-26cc-43de-872e-04a1db8908d5', '08d966c3-26bd-4808-8e49-03d2085e08f4', 'F_Shift', '班别', 0, 1, NULL, '2021-08-24 13:51:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d966c3-26cc-4466-80b4-6d13851bc7af', '08d966c3-26bd-4808-8e49-03d2085e08f4', 'F_EqpName', '设备名称', 0, 1, NULL, '2021-08-24 13:51:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d966c3-26cc-44e4-85f9-06f058e2a3c7', '08d966c3-26bd-4808-8e49-03d2085e08f4', 'F_DieNum', '模具号', 0, 1, NULL, '2021-08-24 13:51:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d966c3-26cc-4575-8a5c-767dd451d2d2', '08d966c3-26bd-4808-8e49-03d2085e08f4', 'F_MaterialName', '产品名称', 0, 1, NULL, '2021-08-24 13:51:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d966c3-26cc-45e7-86a3-ca4a5ce4b5e1', '08d966c3-26bd-4808-8e49-03d2085e08f4', 'F_Beat', '节拍(s)', 0, 1, NULL, '2021-08-24 13:51:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d966c3-26cc-4677-8f16-bd0b6c6ae90b', '08d966c3-26bd-4808-8e49-03d2085e08f4', 'F_Num', '总产量', 0, 1, NULL, '2021-08-24 13:51:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d966c3-26cc-470b-8041-37553a8a6b3c', '08d966c3-26bd-4808-8e49-03d2085e08f4', 'F_SourceBadNum', '料片报废', 0, 1, NULL, '2021-08-24 13:51:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d966c3-26cc-47a9-8804-d22d5a46042d', '08d966c3-26bd-4808-8e49-03d2085e08f4', 'F_ProduceBadNum', '产品报废', 0, 1, NULL, '2021-08-24 13:51:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d966c3-26cc-488b-8751-bfaf0559e682', '08d966c3-26bd-4808-8e49-03d2085e08f4', 'F_DetailJson', '明细', 0, 1, NULL, '2021-08-24 13:51:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9679f-315c-4b76-80ee-2aaddb66bbe7', '08d9679f-3156-4e38-8788-1c11763b3ece', 'F_Date', '日期', 0, 1, NULL, '2021-08-25 16:06:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9679f-315c-4bf6-8f0d-8d635bd076df', '08d9679f-3156-4e38-8788-1c11763b3ece', 'F_Shift', '班别', 0, 1, NULL, '2021-08-25 16:06:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9679f-315c-4c72-8043-1c5efa1ff342', '08d9679f-3156-4e38-8788-1c11763b3ece', 'F_ProduceException', '生产异常', 0, 1, NULL, '2021-08-25 16:06:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9679f-315c-4cc8-8cca-da3ac83558b2', '08d9679f-3156-4e38-8788-1c11763b3ece', 'F_DetailJson', '明细', 0, 1, NULL, '2021-08-25 16:06:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9679f-315c-4d12-8f8f-8a0ca45d41b2', '08d9679f-3156-4e38-8788-1c11763b3ece', 'F_WorkerMan', '值班人', 0, 1, NULL, '2021-08-25 16:06:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9679f-4596-4036-8fa4-c749031c04c1', '08d9679f-4591-41be-86dc-56924fc0d49c', 'F_Date', '日期', 0, 1, NULL, '2021-08-25 16:06:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9679f-4596-4085-846b-b0fd6b39cba5', '08d9679f-4591-41be-86dc-56924fc0d49c', 'F_Shift', '班别', 0, 1, NULL, '2021-08-25 16:06:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9679f-4596-40c4-871f-d0cc4075e072', '08d9679f-4591-41be-86dc-56924fc0d49c', 'F_ProduceException', '生产异常', 0, 1, NULL, '2021-08-25 16:06:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9679f-4596-4107-8e30-71434f953d98', '08d9679f-4591-41be-86dc-56924fc0d49c', 'F_DetailJson', '明细', 0, 1, NULL, '2021-08-25 16:06:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d9679f-4596-4144-85f8-16fc09773118', '08d9679f-4591-41be-86dc-56924fc0d49c', 'F_WorkerMan', '值班人', 0, 1, NULL, '2021-08-25 16:06:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d98082-e408-498f-866f-179be589a58e', '08d98082-e3f5-4234-847c-4ff7cc1d0b9f', 'F_Date', '日期', 0, 1, NULL, '2021-09-26 08:16:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d98082-e408-49eb-8849-e62e95cdb5d5', '08d98082-e3f5-4234-847c-4ff7cc1d0b9f', 'F_FilePath', '文件路径', 0, 1, NULL, '2021-09-26 08:16:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d98082-e408-4a2b-8480-4335a6f307bf', '08d98082-e3f5-4234-847c-4ff7cc1d0b9f', 'F_MaterialName', '产品名称', 0, 1, NULL, '2021-09-26 08:16:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d98082-e408-4a6a-8102-a5631dd0466d', '08d98082-e3f5-4234-847c-4ff7cc1d0b9f', 'F_MaterialId', '物料id', 0, 1, NULL, '2021-09-26 08:16:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('08d98082-e408-4aa6-89c9-bbb0adebb70e', '08d98082-e3f5-4234-847c-4ff7cc1d0b9f', 'F_MaterialCode', '产品编号', 0, 1, NULL, '2021-09-26 08:16:31', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('0917606f-f448-49d3-b78d-e08a17a1cc4f', '2c2ddbce-ee87-4134-9b32-54d0bd572910', 'F_CreatorTime', '创建时间', 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('0927895a-9d35-435c-b980-13f7102043c3', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_PrincipalMan', '联系人', 0, 1, NULL, '2020-06-12 14:33:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('094611e9-37b7-4acb-b4a7-842dc6745f04', 'b39698da-6117-433e-8a02-ef1392d1fe3b', 'F_MaterialName', '物料名称', 0, 1, NULL, '2021-05-21 13:59:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('095a270d-f1f3-4713-ae90-1a23ee0597d1', '7cce1014-5087-4184-9848-77e164be4e17', 'F_PlanEndTime', '计划结束时间', 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('0986da5b-16a3-4330-8449-0508699c93e3', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_SchemeName', '流程名称', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('0bee31e0-9c06-4270-980e-05e40090cdda', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_IsOtherEqp', '是否加载流动设备', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('0c137838-42bc-45e0-a376-c12f161fb449', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', 'F_EqpName', '设备名称', 0, 1, NULL, '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('0d216246-f372-48fb-8c2f-dda9924a4625', '2c2ddbce-ee87-4134-9b32-54d0bd572910', 'F_Content', '表单原html模板未经处理的', 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('0d373b77-62fa-420d-84b3-b8219f94c0fc', 'ed896675-541a-4d34-bf77-29c87d7a26bb', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('0f2f8e1b-8dce-4780-9374-d94023e9227d', 'b39698da-6117-433e-8a02-ef1392d1fe3b', 'F_CreatorUserName', '检验人', 0, 1, NULL, '2021-05-21 13:59:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('113ad8cf-e4cd-4ee5-b825-66014b46e62f', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_NeedId', '需求id', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('139014db-12fc-433b-88c8-3893590a624e', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_Description', '设备描述', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('13e8f8dd-3713-46c9-bbf5-4d5190b8e9b7', 'ed896675-541a-4d34-bf77-29c87d7a26bb', 'F_MaterialDescription', '料号描述', 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('1406d021-de90-4246-af02-6950716214c1', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_Description', '备注', 0, 1, NULL, '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('14075893-fccf-4011-b875-666e97f80b59', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_JobCode', '调度编号', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('1641a15d-87cf-4658-8d39-a1197fb26c43', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_ActivityName', '当前节点名称', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('16eb5807-81ca-4de5-9eb3-7a5ef6ac7b94', 'ed896675-541a-4d34-bf77-29c87d7a26bb', 'F_MaterialBy', '料号材质', 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('186b9cc1-f4d2-43ad-9369-3f34c1dd7b90', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_Code', '实例编号', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('18d606fa-4baf-49e7-987d-8dde8561385a', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_LogoCode', 'Logo编号', 0, 1, NULL, '2020-06-12 14:33:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('1aed66a5-ac73-451d-99a0-fd7ca1da6004', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2020-12-17 08:32:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('1b70fa16-9ed5-4142-92d7-42e5f99cb825', '7cce1014-5087-4184-9848-77e164be4e17', 'F_CreatorUserId', 'F_CreatorUserId', 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('1ba8ebaf-b89c-4699-be3a-520b16efeeb4', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_FrmId', '表单ID', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('1cecc967-7ea1-46d0-b4fa-f90a15783d1c', '7e4e4a48-4d51-4159-a113-2a211186f13a', 'F_Title', '标题', 0, 1, '', '2020-05-22 16:41:18', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-23 09:12:07', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('1eadcbe3-74d7-4192-be4b-5697d89fea6d', '79c73d26-6f49-463a-9002-98eba48e36b2', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2020-12-17 08:31:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('1f1bc83a-bb01-4fed-928c-f33288fcb01f', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', 'F_CreatorTime', '创建时间', 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('1f7c7123-1777-4d8d-85d3-409c9a9423d4', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', 'F_LocationCode', '库位编号', 0, 1, NULL, '2020-12-17 08:32:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('1faf10d8-3007-4e5b-9512-c0ac8fe0a5b7', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', 'F_InStorageCode', '入库单编号', 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('1ffb5d50-2dc3-41f0-b863-93c45afd7709', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_LastModifyUserName', '修改用户', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('21a53e80-9887-4ca3-908f-a858c2def860', '7cb65e00-8af2-4cf2-b318-8ba28b3c154e', 'F_FilePath', '文件路径', 0, 1, NULL, '2020-07-22 12:05:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('21d40431-d289-415f-bfaf-5a23bf4dac9c', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_AdminPassword', '系统密码', 0, 1, '', '2020-06-12 14:33:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-15 14:23:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('22289940-a299-4d46-b68a-204bfab51b01', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_EnabledMark', '有效', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('25507ea6-0c09-46d5-8887-0c083edc4efa', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', 'F_AreaCode', '库区编号', 0, 1, NULL, '2020-12-17 08:32:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('25612b64-9499-46fd-9a3d-779362a3cba2', '7cb65e00-8af2-4cf2-b318-8ba28b3c154e', 'F_CreatorUserName', '创建用户', 0, 1, NULL, '2020-07-22 12:05:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('26196897-58b0-4ba5-b71c-5802c78064e7', 'ed896675-541a-4d34-bf77-29c87d7a26bb', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('263acbf3-44b2-4be5-82ce-8a038d43a5c5', '7cb65e00-8af2-4cf2-b318-8ba28b3c154e', 'F_Description', '备注', 0, 1, NULL, '2020-07-22 12:05:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('27170f5a-fe07-46aa-9772-07493acb5eb2', '828084e8-4361-40f2-bd3e-96acb4bc229b', 'F_Password', '密码', 0, 1, NULL, '2021-01-25 09:03:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('2748bc96-8238-4942-aa1b-767cbbda6d26', 'ed896675-541a-4d34-bf77-29c87d7a26bb', 'F_MaterialPic', '图片路径', 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('27b53e39-bad5-4710-8967-8993f5a40de2', '39226710-b665-489e-aaa0-a8c15d29ed4c', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2020-12-03 13:56:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('28cac0d8-2e64-4d04-a112-10268f597a23', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_CreatorUserId', 'F_CreatorUserId', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('29ac033c-6963-437d-ae44-bef31d7a984c', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', 'F_MaterialBatch', '物料批次', 0, 1, NULL, '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('2e5702e7-829f-46a2-ac2a-a09b76a084a4', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', 'F_IsCheck', '检验标识', 0, 1, NULL, '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('2e6d1a10-ebaf-4458-a697-16f5a64694f5', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', 'F_TransferBoxCode', '流转箱编号', 0, 1, NULL, '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('309c622d-2217-499f-aa83-2eccd72205a1', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_CreatorTime', '创建时间', 0, 1, '', '2020-06-12 14:33:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-12 14:35:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('31e67c21-b265-4736-9807-d1f6a4c98b77', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('33f55a8a-1daf-4adb-9931-1b6cace1c13a', '2c2ddbce-ee87-4134-9b32-54d0bd572910', 'F_EnabledMark', '是否启用', 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('344cf340-e664-446f-ba79-6d37e466f9d8', '7cb65e00-8af2-4cf2-b318-8ba28b3c154e', 'F_FileSize', '文件大小', 0, 1, NULL, '2020-07-22 12:05:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('35fd6dcf-a4ad-46aa-b8c6-f980fdcefcfe', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', 'F_SortCode', '顺序', 0, 1, NULL, '2020-12-17 08:32:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('3633fbd2-bc69-4c09-8b0e-655c424f367a', '828084e8-4361-40f2-bd3e-96acb4bc229b', 'F_Account', '账户', 0, 1, NULL, '2021-01-25 09:03:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('36df66b8-bcf1-43bf-92d5-ea915faa8b94', '2c2ddbce-ee87-4134-9b32-54d0bd572910', 'F_Description', '内容', 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('39311645-780a-4c55-9f52-6c7ae80b0f02', '7cce1014-5087-4184-9848-77e164be4e17', 'F_WorkOrderCode', '工单编号', 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('3961f233-46ef-4fd2-815e-733bb288946c', '2c2ddbce-ee87-4134-9b32-54d0bd572910', 'F_ContentData', '表单中的控件属性描述', 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('39fce29e-2dad-38db-332f-fb638a6e64fa', '39fce29e-2d24-934c-432b-87fda7e92d81', 'F_JobType', '0补货，1入库，2出库，3产出上架，4移库，5作业开始，6作业结束,7领用退回', 0, 1, NULL, '2021-06-03 13:55:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('39fce29e-2dad-584b-b88f-8f014cf32b36', '39fce29e-2d24-934c-432b-87fda7e92d81', 'F_UserId', '用户ID', 0, 1, NULL, '2021-06-03 13:55:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('39fce29e-2dad-ff3e-10ec-2678a6b671eb', '39fce29e-2d24-934c-432b-87fda7e92d81', 'F_EqpId', '设备ID', 0, 1, NULL, '2021-06-03 13:55:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('3a02b650-09c6-4826-add8-cef8504b43b1', '84e5ec65-f803-485e-b703-4d07eaaf6c05', 'F_MaterialType', '料号分类', 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('3b304c8d-a54d-47b7-ad21-e6d01c283904', '91A6CFAD-B2F9-4294-BDAE-76DECF412C6C', 'F_CreatorUserName', '创建人', 0, 1, '', '2020-06-03 09:57:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('3cede4da-ece7-4cd0-a7eb-f149d86b967c', '84e5ec65-f803-485e-b703-4d07eaaf6c05', 'F_CreatorUserId', '创建人id', 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('3e4609b9-0b5e-4334-aca5-00b5fc9c4af6', '7cce1014-5087-4184-9848-77e164be4e17', 'F_RealEndTime', '结束时间', 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('3e83c9d7-fdde-4626-81d3-f2e4d26d238d', 'b39698da-6117-433e-8a02-ef1392d1fe3b', 'F_IsCheck', '检验完成', 0, 1, NULL, '2021-05-21 13:59:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('3fd72c46-64cc-49a8-b868-ae692e870971', '7cce1014-5087-4184-9848-77e164be4e17', 'F_PlanStartTime', '计划开始时间', 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('3fee41bd-64a6-4280-ac93-0ce835fecf41', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_CreatorTime', '创建时间', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('437568ca-c79a-418e-ac50-5f218e552e96', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', 'F_ScapNum', '报废数量', 0, 1, NULL, '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('4461450b-3e3a-46e6-9ae8-e13180d772d2', '7cce1014-5087-4184-9848-77e164be4e17', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('452cbcbf-c195-4d93-ad33-7c672013eafb', '788d27cb-598d-41da-ac11-b7ddf0914b08', 'F_CreatorTime', '创建时间', 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('45f62f54-8ad4-45f2-9f37-a7f0d15ee815', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_Description', '备注', 0, 1, NULL, '2020-06-12 14:33:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('468541e1-5c2e-481c-adb8-f8fc9e28aaa4', '7cce1014-5087-4184-9848-77e164be4e17', 'F_PlanNum', '计划数量', 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('47b8d043-aa5e-4a09-98b1-aaf24d6589dd', '7cb65e00-8af2-4cf2-b318-8ba28b3c154e', 'F_FileBy', '文件所属', 0, 1, NULL, '2020-07-22 12:05:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('48b1d488-1bb3-48c4-9893-4f38409a7b2e', '788d27cb-598d-41da-ac11-b7ddf0914b08', 'F_RedirectUrl', '回调地址', 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('4986e7eb-efa4-4143-979a-708cfcb3ebfa', 'd9078b9a-5db6-4429-b489-3700e56f367f', 'F_PrintTemplatePath', '模板地址', 0, 1, NULL, '2021-01-14 13:24:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('49d6a83e-646f-48af-b71e-8f8d60f73396', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_DbString', '连接字符串', 0, 1, '', '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-12 13:57:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('4b2b3c5b-22f0-4a64-9857-c794f1d8a181', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_LogoCode', 'Logo编号', 0, 1, NULL, '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('4d0ece5d-bb05-4730-990c-02488a5ede60', 'b39698da-6117-433e-8a02-ef1392d1fe3b', 'F_TransferBoxCode', '退回流转箱编号', 0, 1, NULL, '2021-05-21 13:59:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('4dd71c0e-68e8-4e7d-9c7e-2a5046c97555', 'b39698da-6117-433e-8a02-ef1392d1fe3b', 'F_IsBack', '是否正常', 0, 1, NULL, '2021-05-21 13:59:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('4e90e4dc-fc8d-456e-aa7d-2420e31212c2', 'e9190a56-e173-4483-8a3e-f17b86e4766e', 'F_ToUserId', '收件人主键', 0, 1, NULL, '2020-07-29 16:44:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('506bdb21-9de2-48b2-83e5-ea5f90d9e88a', 'b39698da-6117-433e-8a02-ef1392d1fe3b', 'F_CreatorTime', '检验时间', 0, 1, NULL, '2021-05-21 13:59:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('506e828f-6ff6-48c5-890a-1bcb70d3e57b', 'd9078b9a-5db6-4429-b489-3700e56f367f', 'F_CreatorUserId', 'F_CreatorUserId', 0, 1, NULL, '2021-01-14 13:24:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('5100bb13-038a-45b7-aa54-cd3cf7887d40', '8968b428-2a8b-4dbe-ad47-73dd408ddd5e', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2020-12-03 09:49:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('523a8089-d975-4c73-97a3-95bd0fffff10', '84e5ec65-f803-485e-b703-4d07eaaf6c05', 'F_OutStorageCode', '出库单编号', 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('52d0ff8a-b1c2-4766-89bb-410a8181fa13', 'ed896675-541a-4d34-bf77-29c87d7a26bb', 'F_MaterialType', '料号分类', 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('52ebd42b-245a-48bf-83bc-ea0030c933cc', '39226710-b665-489e-aaa0-a8c15d29ed4c', 'F_SonMaterialId', '组成主键-n', 0, 1, NULL, '2020-12-03 13:56:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('54109c70-142b-47fa-b7fe-1e2efd8862d4', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('588cdc6a-716c-480e-acc3-30937dd44dc4', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_FinishId', '完成id', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('5a218598-40b4-4046-a61e-e7b4f8dd0d85', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_SchemeContent', '流程内容', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('5b2cb54c-5fe8-4f8f-b281-d6de27dcfc18', '7cb65e00-8af2-4cf2-b318-8ba28b3c154e', 'F_FileType', '文件类型', 0, 1, NULL, '2020-07-22 12:05:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('5b369ae0-ce33-4ab5-a954-f29e4a6c1ba6', 'ed896675-541a-4d34-bf77-29c87d7a26bb', 'F_CustomerProNO', '客户品号', 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('5ce0ba1f-f21f-42d2-9e36-7ddead3461f7', '8968b428-2a8b-4dbe-ad47-73dd408ddd5e', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2020-12-03 09:49:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('5e1693ab-9d98-4a14-9afc-fef1d51ac347', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', 'F_CheckType', '检验类型', 0, 1, NULL, '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('61b72ebf-78d0-4235-985f-733c06f104cd', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_PlanUserNum', '预计使用次数', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('61cff792-0cc4-4d46-9bd5-eb5fc272dfeb', '828084e8-4361-40f2-bd3e-96acb4bc229b', 'F_Description', '备注', 0, 1, NULL, '2021-01-25 09:03:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('642e8c4b-7762-42b6-9fbd-8495c54606a2', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_Logo', 'Logo图标', 0, 1, NULL, '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('67964562-bd8d-46b6-a5c8-86a17d00dcd5', '39226710-b665-489e-aaa0-a8c15d29ed4c', 'F_Num', '数量', 0, 1, NULL, '2020-12-03 13:56:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('6b797d08-1ba2-4ef1-a4b7-bf2e193a547c', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_JobState', '任务状态（0等待，1执行，2完成）', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('6c6a951c-44ea-4544-b63c-8f018096c007', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_ParentId', 'F_ParentId', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('6d1a0016-9634-4425-b840-af55f4fb383f', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_DBProvider', '数据库类型', 0, 1, '', '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-12 13:57:21', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('6e177e5f-4ce8-4f7b-b790-b320bb2659db', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_EnabledMark', '有效', 0, 1, NULL, '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('6ea5fcb1-7fa3-4750-b39d-c580df5fc645', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2020-12-14 12:44:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('6ec6ed61-884c-4519-904c-2f3cb717aef7', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_PrincipalMan', '联系人', 0, 1, NULL, '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('6ffce56e-bd4c-4e53-907a-fa4c5be9543e', 'b39698da-6117-433e-8a02-ef1392d1fe3b', 'F_MaterialType', '物料分类', 0, 1, NULL, '2021-05-21 13:59:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('702f2c2e-b66e-44e8-a846-fd96c38027e3', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_CustomName', '实例名称', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('7209885d-9f4a-4071-a104-714aae9a84d4', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', 'F_MaterialCode', '物料编号', 0, 1, NULL, '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('736f74b5-b794-408a-b271-056656eacc97', '84e5ec65-f803-485e-b703-4d07eaaf6c05', 'F_MaterialBatch', '料号批次', 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('7419ac65-7138-480f-9196-cec7c6c2ff40', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', 'F_Description', '备注', 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('7496086e-32ec-4875-8013-73ce1c2784a2', 'e9190a56-e173-4483-8a3e-f17b86e4766e', 'F_CreatorUserId', '创建用户主键', 0, 1, NULL, '2020-07-29 16:44:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('7556eb6c-982a-4fde-b6c5-c312524a7e87', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_IsMaintain', '是否需要保养', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('756ce041-ad4f-4895-b184-d9c9c4df9a04', '38CA5A66-C993-4410-AF95-50489B22939C', 'F_OrganizeId', '部门Id', 0, 1, '', '2020-06-08 16:25:17', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('75c41f22-fa5f-4ed9-a64d-54b80e4b9669', '79c73d26-6f49-463a-9002-98eba48e36b2', 'F_Description', '备注', 0, 1, NULL, '2020-12-17 08:31:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('760601a9-28f2-415a-b838-14b9cbe9f411', 'd9078b9a-5db6-4429-b489-3700e56f367f', 'F_PrintTemplateName', '模板名称', 0, 1, NULL, '2021-01-14 13:24:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('765c254a-111f-46ad-815a-561066b63d1d', '39226710-b665-489e-aaa0-a8c15d29ed4c', 'F_MaterialId', '料号主键-1', 0, 1, NULL, '2020-12-03 13:56:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('7694c8c5-34ba-42fd-bb9e-537f91127538', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_UserDate', '接受日期', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('76a12c51-00c7-4bf0-af5a-0dfa745c119e', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', 'F_CreatorTime', '创建时间', 0, 1, NULL, '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('76cbcdd9-ffeb-41a1-8f9c-51dea4a02fa2', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_EndTime', '到期时间', 0, 1, NULL, '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('76e64bb6-cb36-45c4-852f-6a044d5b2c3d', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_SchemeType', '流程分类', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('770af4b6-29ef-47b1-aea8-6092562d9800', '2c2ddbce-ee87-4134-9b32-54d0bd572910', 'F_ContentParse', '表单控件位置模板', 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('78060317-6db4-4cc8-ab06-49b6c65c5a7d', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2020-12-17 08:32:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('78981dd9-c948-47b9-9b10-075b0db74cad', '84e5ec65-f803-485e-b703-4d07eaaf6c05', 'F_MaterialCode', '料号描述', 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('78a9a6c0-e854-4225-b75e-5e7cfaf46c67', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_ProjectName', '项目名称', 0, 1, '', '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-12 13:56:54', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('7a23d352-33fa-4eba-a2d1-b99da996d824', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_EqpState', 'F_EqpState', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('7a5d9c75-e32a-4a7e-99f2-6169edf13042', '828084e8-4361-40f2-bd3e-96acb4bc229b', 'F_CreatorUserId', 'F_CreatorUserId', 0, 1, NULL, '2021-01-25 09:03:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('7bbc0446-3621-4f8a-b913-f5889057c0f3', '788d27cb-598d-41da-ac11-b7ddf0914b08', 'F_AppId', 'AppId', 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('7c9f1bbc-4efc-40cf-bc1f-72fc826bfab8', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', 'F_Description', '检验信息', 0, 1, NULL, '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('7d7bfd9b-93f8-4a31-ab35-b361082de79b', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('7dfa39c1-a8d3-4460-922b-5a770d6e307f', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_SchemeCode', '流程编号', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('8024dfbc-8236-4a86-8869-d09e59c3dfe3', '91A6CFAD-B2F9-4294-BDAE-76DECF412C6C', 'F_CreatorTime', '创建时间', 0, 1, '', '2020-06-03 09:57:59', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-22 17:06:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('80899139-2938-4e0a-9f80-16bf70d00658', '7cb65e00-8af2-4cf2-b318-8ba28b3c154e', 'F_CreatorTime', '创建时间', 0, 1, NULL, '2020-07-22 12:05:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('81d404d1-5639-4d5a-8ac1-d47b0414c321', 'e9190a56-e173-4483-8a3e-f17b86e4766e', 'F_MessageType', '信息类型（通知、私信、处理）', 0, 1, NULL, '2020-07-29 16:44:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('81d74921-21be-4360-bae3-653d0fade184', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_CreatorUserName', '创建用户', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('823b9649-030c-4dbb-b790-b184565f4746', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_MakerList', '执行人', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('82f21e4c-0d14-4559-92d4-657b34640a47', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_SortCode', '排序码', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('83584b47-0a29-446d-8ff2-6c6d3eccca3d', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_FrmId', '表单ID', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('8376537c-b23b-4b51-a6f0-75fc3467c574', '2c2ddbce-ee87-4134-9b32-54d0bd572910', 'F_Fields', '字段个数', 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('83e5307e-29e4-4310-8996-dd60a9e1dfaf', '8968b428-2a8b-4dbe-ad47-73dd408ddd5e', 'F_Description', '工序备注', 0, 1, NULL, '2020-12-03 09:49:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('84b3ac62-5d85-4263-946d-e12be86cbfa1', '7cb65e00-8af2-4cf2-b318-8ba28b3c154e', 'F_FileName', '文件名称', 0, 1, NULL, '2020-07-22 12:05:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('886485a3-188b-4821-b0e6-44342892213a', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', 'F_TransferMaxNum', '流转箱最大数', 0, 1, NULL, '2020-12-14 12:44:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('889fc780-cd2f-45c9-b07c-030e6d3ddc29', 'e9190a56-e173-4483-8a3e-f17b86e4766e', 'F_CreatorUserName', '创建用户', 0, 1, NULL, '2020-07-29 16:44:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('8b15457f-7b9b-45e4-af53-f821c3210abb', '828084e8-4361-40f2-bd3e-96acb4bc229b', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2021-01-25 09:03:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('8ba0c532-4b85-4a02-aec8-499d93b97dcb', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_CreatorTime', '创建时间', 0, 1, NULL, '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('8c16bb85-1e95-4dd3-8537-b15d20cd7ee5', 'ed896675-541a-4d34-bf77-29c87d7a26bb', 'F_Description', '备注', 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('8cb969f8-d126-42e5-81de-279e65a474d3', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_JobInfo', '调度信息', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('8cf11fd0-8ee5-408d-9d5d-15c4342befda', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_OrganizeId', '所属部门', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('8d95deea-2b01-453c-85ed-955c48d4b3e4', '84e5ec65-f803-485e-b703-4d07eaaf6c05', 'F_Description', '备注', 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('8f5ce993-986c-4825-b3bc-f34f54d4f37f', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_FlowLevel', '等级', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('8f8260d2-7459-428c-ad95-be3df2023f94', '788d27cb-598d-41da-ac11-b7ddf0914b08', 'F_AgentId', 'AgentId', 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('8f949940-dc8d-46a1-8a73-8680256d978f', '39226710-b665-489e-aaa0-a8c15d29ed4c', 'F_CreatorUserId', 'F_CreatorUserId', 0, 1, NULL, '2020-12-03 13:56:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('8f9b9573-e271-469b-86e7-6cb3283ac6c3', '39226710-b665-489e-aaa0-a8c15d29ed4c', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2020-12-03 13:56:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('90386357-54f8-4aeb-8b24-f45ee8c08ba4', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_OrganizeId', '所属部门', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('9088560d-f73e-4cb4-babd-0e6bedfe87cb', '788d27cb-598d-41da-ac11-b7ddf0914b08', 'F_DingType', '应用类型', 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('91b3ca56-61e8-444d-b506-7dec452f1daa', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_SchemeContent', '流程模板内容', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('92fcbab0-0e8d-4201-ab94-12291a0123fc', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_DoneUserId', '执行人id', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('9306a857-ef87-4a73-a801-9da0a697bfd2', '84e5ec65-f803-485e-b703-4d07eaaf6c05', 'F_MaterialName', '料号描述', 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('936023df-503f-4322-b243-47158c9617a6', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_EndTime', '到期时间', 0, 1, NULL, '2020-06-16 09:38:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('9507a93a-a258-4ba1-93db-d51798268c5e', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_CreatorUserId', '创建人Id', 0, 1, '', '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-12 13:57:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('95e5bdc5-03f1-48bc-9abc-5dfb3eb7063a', '7cce1014-5087-4184-9848-77e164be4e17', 'F_RealStartTime', '开始时间', 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('96938fba-948f-422e-8566-bd851151991a', '84e5ec65-f803-485e-b703-4d07eaaf6c05', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('97e01394-7d87-4242-8088-807abbff77c2', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_JobType', '调度类型（0补货，1下料，2入库，3出库，4移库，5作业开始，6作业结束）', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('985ab6e3-3818-432c-9d6b-050953bf126c', '828084e8-4361-40f2-bd3e-96acb4bc229b', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2021-01-25 09:03:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('98d6c90c-a46a-49f0-a800-acf97e47bf70', '84e5ec65-f803-485e-b703-4d07eaaf6c05', 'F_MaterialUnit', '料号单位', 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('98e7930d-37f0-4499-874d-b89207657eaa', '7cb65e00-8af2-4cf2-b318-8ba28b3c154e', 'F_OrganizeId', '所属部门', 0, 1, NULL, '2020-07-22 12:05:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('99ecc5e7-2b02-49d8-b091-ee1aec8130ee', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_Description', '备注', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('9b55ddc4-8e5d-4790-be72-4213559b0961', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', 'F_LocationCode', '库位号', 0, 1, NULL, '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('9c838bd8-cd68-4d95-a948-5916c52adb23', '79c73d26-6f49-463a-9002-98eba48e36b2', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2020-12-17 08:31:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('9e9256e3-bcbb-4be1-b26d-aa832f268580', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', 'F_MaterialCode', '料号描述', 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('9f1e6816-49ab-40ff-a0f3-19946c7d6d7b', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', 'F_MaterialName', '料号描述', 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('a24c4b7c-6f97-4a68-90b7-c11dd563ea0f', 'ed896675-541a-4d34-bf77-29c87d7a26bb', 'F_MaterialName', '料号名称', 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('a24c6ed3-8c91-4ade-a5c1-8c5eb9719368', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_AdminAccount', '系统账户', 0, 1, '', '2020-06-12 14:33:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-15 14:23:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('a4549ab8-73c9-40a1-82ee-1fb794cb651e', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_Description', '备注', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('a4bee312-7dde-4594-8f2b-8f357f2cfc90', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_UsedNum', '已使用次数', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('a619715a-46b9-4b3e-81d2-a450038dceb6', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_Description', '实例备注', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('a6320b89-1c15-4afa-9c30-2e1f508212e2', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_HostUrl', '域名', 0, 1, '', '2020-06-15 17:01:14', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-15 17:01:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('a8d7783d-d2eb-424f-a27e-66ea092fc604', '84e5ec65-f803-485e-b703-4d07eaaf6c05', 'F_MaterialId', '料号Id', 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('a8e25165-3366-4d06-9145-beefc80156b3', 'd9078b9a-5db6-4429-b489-3700e56f367f', 'F_Description', '备注', 0, 1, NULL, '2021-01-14 13:24:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('a96a4a9f-7685-4478-920c-fc192840505c', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', 'F_Description', '备注', 0, 1, NULL, '2020-12-14 12:44:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('a983cc2e-d045-4c35-a53e-2f0775edf639', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_CreatorUserName', '创建用户', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('aa191acb-86fe-4204-b24c-d27d7cdef4ee', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', 'F_Num', '数量', 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('aa75975a-bf00-429b-8c58-825b43d29eb4', '2c2ddbce-ee87-4134-9b32-54d0bd572910', 'F_SortCode', '排序码', 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('ade5f260-395e-4ad9-9454-83d1574ef892', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', 'F_TransferCode', '流转箱编号', 0, 1, NULL, '2020-12-14 12:44:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('ae4282b2-30ff-48e8-9e3d-9863ceb6c438', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_CreatorUserId', 'F_CreatorUserId', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('ae98e800-05b8-4a67-ab20-03aa1eebb7c8', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_MaintainNum', '保养周期', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b06b2f6f-c392-473f-bea7-96bcf04a025d', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_IsFinish', '是否完成', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b0da4158-e71b-45cc-9cc4-a3547631295c', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_IsToPlanMan', '是否发送计划人员', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b1d0e803-5b57-4629-9db3-2d232c09cf8a', '7cce1014-5087-4184-9848-77e164be4e17', 'F_DoneNum', '完成数量', 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b1e5e6d9-970e-4422-9ccd-1465da1ec45b', 'b39698da-6117-433e-8a02-ef1392d1fe3b', 'F_CheckType', '检验类型', 0, 1, NULL, '2021-05-21 13:59:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b2e8a59b-99ce-432b-b5ed-e7c8859dcfad', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_SchemeType', '流程类型', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b3e6bab9-7e4c-4f87-83ff-d0f1bf6f9df8', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_FrmType', '表单类型', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b4697530-35c5-4f8c-9221-873472d4124c', '788d27cb-598d-41da-ac11-b7ddf0914b08', 'F_IsWebLogin', 'Web登录', 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b474c442-3a67-410a-824d-e9fe7620a10b', '788d27cb-598d-41da-ac11-b7ddf0914b08', 'F_EnabledMark', '有效', 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b4aec327-84c5-4389-9449-2568d3718312', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', 'F_MaterialUnit', '料号单位', 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b56a98de-4f9d-4753-ae06-e3bea339dc9f', '2c2ddbce-ee87-4134-9b32-54d0bd572910', 'F_WebId', '系统页面标识，当表单类型为用Web自定义的表单时，需要标识加载哪个页面', 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b575c4c7-ff55-4d77-be60-9d847ecf5694', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', 'F_MaterialType', '物料分类', 0, 1, NULL, '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b5a08597-f348-48ae-8824-d76628635981', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_EqpName', '设备名称', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b67b5eb6-ecae-4156-8ef8-9e80b7a1345a', '7e4e4a48-4d51-4159-a113-2a211186f13a', 'F_CreatorUserName', '创建人', 0, 1, '', '2020-05-22 16:53:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('b68b00b4-6f56-4832-8774-eab1d02e2fc1', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_AdminPassword', '系统密码', 0, 1, NULL, '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b765ca2a-4337-4e24-b330-9c923ca793f0', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_CreatorUserId', '创建用户主键', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('b8e360f7-817f-4dc7-82c4-11fd51fc77de', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_FrmContentParse', '表单控件位置模板', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('bb0c21c4-4370-47d6-9c0a-670c1bce57f5', 'b39698da-6117-433e-8a02-ef1392d1fe3b', 'F_BatchCode', '条码编号', 0, 1, NULL, '2021-05-21 13:59:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('bb211871-ec1c-49be-9950-41b09db68ba6', '7cce1014-5087-4184-9848-77e164be4e17', 'F_Description', '备注', 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('bb2cf8d7-0702-491e-8bff-8e3a93d39117', '788d27cb-598d-41da-ac11-b7ddf0914b08', 'F_CreatorUserName', '创建人', 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('bd5762c4-f9ad-436e-8fe3-6adc8ba4958e', '39226710-b665-489e-aaa0-a8c15d29ed4c', 'F_ProcessId', '工序主键', 0, 1, NULL, '2020-12-03 13:56:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('bd8b0f82-43fd-44ed-9814-de1876fced8c', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_SchemeCanUser', '流程模板使用者', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('be804654-d6d7-44d1-8950-6841a2626720', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_CreatorUserId', '创建人Id', 0, 1, '', '2020-06-12 14:33:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-12 13:57:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('bee47318-9236-4938-8de6-3a372cff31f7', '84e5ec65-f803-485e-b703-4d07eaaf6c05', 'F_CreatorTime', '创建时间', 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('bf5a2919-281c-44e2-a83b-74576e08743e', '7e4e4a48-4d51-4159-a113-2a211186f13a', 'F_EnabledMark', '状态', 0, 1, '', '2020-05-22 16:53:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-08 16:49:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('bfbe0195-3fae-42d2-9d46-6bf5400d64ea', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_DbString', '连接字符串', 0, 1, '', '2020-06-12 14:33:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-12 13:57:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('c077b982-c595-43e8-9095-711bee01e830', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_AuthorizeType', '模板权限类型：0完全公开,1指定部门/人员', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('c0a08cd8-43bc-4d57-844a-2a39c4a408e6', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_CompanyName', '公司名称', 0, 1, NULL, '2020-06-12 14:33:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('c21bfb1a-b2bb-4a39-bc34-6da262bdd5e5', 'ed896675-541a-4d34-bf77-29c87d7a26bb', 'F_MaterialSize', '料号规格', 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('c2349607-aeec-48e6-95ad-52f14c3df722', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', 'F_CreatorUserId', 'F_CreatorUserId', 0, 1, NULL, '2020-12-14 12:44:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('c4a2499d-780c-42db-a2a4-a3c1084533ca', 'e9190a56-e173-4483-8a3e-f17b86e4766e', 'F_MessageInfo', '内容', 0, 1, NULL, '2020-07-29 16:44:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('c4c5840c-90a5-4a4e-aea4-9f284ece3921', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_AdminAccount', '系统账户', 0, 1, '', '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-12 13:56:32', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('c4d6a87a-70ec-4065-8188-e82e8ac8690d', 'ed896675-541a-4d34-bf77-29c87d7a26bb', 'F_Customer', '客户', 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('c55d31cd-25fb-44b4-9c7f-3946452aef6f', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', 'F_MaterialBatch', '料号批次', 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('c5b6802f-42e4-4655-8fba-53ef3f9056c1', '7cce1014-5087-4184-9848-77e164be4e17', 'F_BedNum', '不良数量', 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('c5f26f24-be6b-483e-af07-80c06f5b941b', 'ed896675-541a-4d34-bf77-29c87d7a26bb', 'F_MaterialCode', '料号编号', 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('c5ff9de2-dbd8-477a-8e43-e7910ab874a8', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_EqpOwner', '财产所属', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('c8761118-40d1-4916-b9df-d041c27320fe', 'd9078b9a-5db6-4429-b489-3700e56f367f', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2021-01-14 13:24:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('c87b90e3-6949-47f3-b8c5-c4f69af92200', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_CompanyName', '公司名称', 0, 1, NULL, '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('c8923b9e-b5f2-4420-a5ab-d35ba16e79f7', '788d27cb-598d-41da-ac11-b7ddf0914b08', 'F_AppName', '应用名称', 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('cba04ab7-b1b2-406e-a889-53484469cfe7', '7e4e4a48-4d51-4159-a113-2a211186f13a', 'F_CreatorUserId', '创建人Id', 0, 0, '', '2020-06-03 16:42:33', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-23 09:05:44', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('cddfb494-6d34-408d-8364-1c0bf270d4cd', '2c2ddbce-ee87-4134-9b32-54d0bd572910', 'F_FrmType', '表单类型，0：默认动态表单；1：Web自定义表单', 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('cdfbb34c-ce23-4214-b204-d95639c37f7f', 'b39698da-6117-433e-8a02-ef1392d1fe3b', 'F_MaterialBatch', '物料批次', 0, 1, NULL, '2021-05-21 13:59:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('cdfff32c-c512-4aae-8f37-bcb41fe6338e', 'b39698da-6117-433e-8a02-ef1392d1fe3b', 'F_BackMaterialBatch', '退回料号批次', 0, 1, NULL, '2021-05-21 13:59:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('cf019cef-8ed1-42f6-a8cf-ce6c5f834288', '7cce1014-5087-4184-9848-77e164be4e17', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('d03113cc-ac15-462f-9ca2-f8b28cde5efd', 'd9078b9a-5db6-4429-b489-3700e56f367f', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2021-01-14 13:24:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('d1a990b1-189b-498f-9176-fc009b3952ad', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', 'F_Description', '备注', 0, 1, NULL, '2020-12-17 08:32:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('d39fa128-e61c-49e2-83d3-4cb289f34ca3', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', 'F_CreatorTime', 'F_CreatorTime', 0, 1, NULL, '2020-12-14 12:44:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('d3a77926-a549-4bd5-a8f9-2e0a64815872', '84e5ec65-f803-485e-b703-4d07eaaf6c05', 'F_Num', '数量', 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('d4a0cc88-4c3c-42e5-b116-8bdc44da8357', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_ToEqpId', '指定设备', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('d4b49a55-491e-494c-b2d2-082a414bcbb9', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_Logo', 'Logo图标', 0, 1, NULL, '2020-06-12 14:33:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('d52c6878-9283-45d7-82f9-b465fa33a89b', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_DBProvider', '数据库类型', 0, 1, '', '2020-06-12 14:33:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-06-12 13:57:21', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('d53cf640-037a-4126-9b75-daa77fa712b3', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_FrmContentData', '表单中的控件属性描述', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('d6ab81f8-0deb-4344-b228-bee537801ede', '788d27cb-598d-41da-ac11-b7ddf0914b08', 'F_AppSecret', 'AppSecret', 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('d6f9071b-f47d-4272-a329-46bd1fa0c2d9', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', 'F_MaterialName', '物料名称', 0, 1, NULL, '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('d75e45d3-763d-45ef-ab08-22f58eef5fce', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', 'F_MaterialType', '料号分类', 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('d782d010-89af-4c1d-8e96-35833c38c3d8', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_SchemeVersion', '流程内容版本', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('d87ad0d7-6e9c-4795-8144-2c55c331531e', '39226710-b665-489e-aaa0-a8c15d29ed4c', 'F_Description', '备注', 0, 1, NULL, '2020-12-03 13:56:34', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('d88a3d04-4a0d-4bfe-b34f-4130eb0accc9', '2c2ddbce-ee87-4134-9b32-54d0bd572910', 'F_Name', '表单名称', 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('d9e2a9fe-8a87-4266-aaae-f8e47b63187b', 'c87cd44f-d064-4d3c-a43e-de01a7a8785e', 'F_FrmData', '表单数据', 0, 1, NULL, '2020-07-14 09:21:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('db09d23a-ca82-4676-8fc4-18e974eb86b8', 'b39698da-6117-433e-8a02-ef1392d1fe3b', 'F_MaterialCode', '物料编号', 0, 1, NULL, '2021-05-21 13:59:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('dba95c11-47ea-4cb3-9152-c5c5dbc092c5', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_EqpType', '设备类型', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('dc4cd5fd-8933-44f8-9500-fc36285f50b2', '7e4e4a48-4d51-4159-a113-2a211186f13a', 'F_CreatorTime', '创建时间', 0, 1, '', '2020-05-22 16:53:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-22 17:06:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('ddd93ca7-d821-4abd-a342-9be1782dabe9', '7e4e4a48-4d51-4159-a113-2a211186f13a', 'F_Content', '内容', 0, 1, '', '2020-05-22 16:42:41', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-22 16:53:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0);
INSERT INTO `sys_modulefields` VALUES ('e084f62c-2403-476b-bead-23c5ac4ff13c', 'b26cea9c-21ba-42fa-98fc-b8fe0b92451d', 'F_FinishTime', '检验完成时间', 0, 1, NULL, '2021-05-21 13:57:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('e175859e-9284-47fd-a168-d1a12ddd125d', 'a303cbe1-60eb-437b-9a69-77ff8b48f173', 'F_MobilePhone', '联系方式', 0, 1, NULL, '2020-06-12 13:54:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('e18deb3b-188b-497b-a4e3-20c29cc09fd5', 'd9078b9a-5db6-4429-b489-3700e56f367f', 'F_PrintTemplateDescription', '模板描述', 0, 1, NULL, '2021-01-14 13:24:01', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('e3051d49-b5bf-4aba-b224-e3ba0eb2dd27', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_IsNotice', '是否通知', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('e3a8532b-308c-43b5-bc73-2adcaada998a', '788d27cb-598d-41da-ac11-b7ddf0914b08', 'F_Description', '备注', 0, 1, NULL, '2020-11-21 09:55:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('e50675bb-3d9d-4d74-bb85-28d253149730', '7cce1014-5087-4184-9848-77e164be4e17', 'F_MaterialId', '料号Id', 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('e6c0d0cb-7d44-43c6-9036-0fcce49303f8', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', 'F_CreatorUserId', 'F_CreatorUserId', 0, 1, NULL, '2020-12-17 08:32:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('e706cac2-aef2-4f3e-85e1-29183a104d68', 'ed896675-541a-4d34-bf77-29c87d7a26bb', 'F_MaterialUnit', '料号单位', 0, 1, NULL, '2020-12-01 14:31:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('e7a49b29-0c59-4665-9e73-5f495fced4d4', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_CreatorTime', '创建时间', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('e843972a-e7ad-4252-b43e-f008b2d7e06a', 'af863666-a357-4e06-bffd-df98e1d29ab8', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2020-11-30 14:05:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('e85b97a0-d6f6-4d0f-8bdc-a7eccf9fdd95', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_DoneTime', '执行时间', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('e9ed0496-046a-41b4-aa8e-1f5c8553b963', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_FinishTime', '完成时间', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('eb6b22e7-a804-4f6d-b969-d5c6db5f3043', '2c2ddbce-ee87-4134-9b32-54d0bd572910', 'F_CreatorUserId', '创建人', 0, 1, NULL, '2020-07-08 14:34:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('ec413c38-4472-4e36-b406-84f883d48609', 'e9190a56-e173-4483-8a3e-f17b86e4766e', 'F_CreatorTime', '创建时间', 0, 1, NULL, '2020-07-29 16:44:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('ed938b87-a291-40cd-8a23-204e15f81cb3', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_EnabledMark', '有效', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('edeabb1a-de3c-48d0-b677-5d35807632dc', '7cb65e00-8af2-4cf2-b318-8ba28b3c154e', 'F_EnabledMark', '有效', 0, 1, NULL, '2020-07-22 12:05:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('edf1d2cb-07dd-41cb-a475-41b982c43dff', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_MobilePhone', '联系方式', 0, 1, NULL, '2020-06-12 14:33:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('f0d51864-40c6-44dc-934f-598c7bb04c56', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', 'F_CreatorUserId', '创建人id', 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('f0e838e8-c07c-4f24-9dd3-0c1727074441', '484269cb-9aea-4af1-b7f6-f99e7e396ad1', 'F_EnabledMark', '有效', 0, 1, NULL, '2020-06-16 09:38:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('f2c75a6b-ad06-49b2-93cf-7a7312c97ff5', 'e9190a56-e173-4483-8a3e-f17b86e4766e', 'F_EnabledMark', '有效', 0, 1, NULL, '2020-07-29 16:44:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('f8a85900-44e6-4786-ad64-e219eb8cffbe', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_FrmType', '表单类型', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('fbce3e50-da9b-4f5a-b919-ad90fe8920ed', '8968b428-2a8b-4dbe-ad47-73dd408ddd5e', 'F_ProcessFlowName', '工序名称', 0, 1, NULL, '2020-12-03 09:49:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('fc460468-bb76-4cf8-8107-d710347945ca', '5391c5c0-55c0-4132-a26d-5d27fcec1c18', 'F_AreaId', '库区id', 0, 1, NULL, '2020-12-17 08:32:46', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('fc7f572d-6dc2-4592-8d67-4b3155b49dd9', 'e9190a56-e173-4483-8a3e-f17b86e4766e', 'F_ToUserName', '收件人', 0, 1, NULL, '2020-07-29 16:44:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('fc82f7af-efc8-4f25-b9ca-31ecfb2213e1', '7cce1014-5087-4184-9848-77e164be4e17', 'F_WorkOrderState', '工单状态', 0, 1, NULL, '2020-12-07 12:14:37', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('fda6f2c8-f5fa-4c49-adc5-ffdedc5897dc', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', 'F_TransferType', '流转箱类型', 0, 1, NULL, '2020-12-14 12:44:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('fdb9e4f1-e3e8-4e8c-961a-9ee64b64fd4b', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_Priority', '优先级（从大到小执行）', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('fdc24c5c-58ae-498d-a637-1d5d59df7ba4', '84e5ec65-f803-485e-b703-4d07eaaf6c05', 'F_DoneNum', '完成数量', 0, 1, NULL, '2020-12-16 13:39:10', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('fe1ca281-5d25-43b1-ac14-a924d022d3be', '25ca371f-9c67-4e0e-9ca7-0dec2e836613', 'F_EnabledMark', 'F_EnabledMark', 0, 1, NULL, '2020-12-16 13:38:27', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('ff0006a8-1e6f-43db-99b7-13e59157e8b6', 'a8f0c195-53c5-4b05-b65e-5fafb14a3aec', 'F_DoneUserName', '执行人', 0, 1, NULL, '2021-01-15 14:19:45', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_modulefields` VALUES ('ff60fd1e-d0df-4847-bc5a-1bf4c3310c9c', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 'F_CreatorUserId', '创建用户主键', 0, 1, NULL, '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_TITLE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_CREATORUSERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  PRIMARY KEY (`F_ID`) USING BTREE,
  INDEX `IX_SYS_NOTICE`(`F_TITLE`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_openjob
-- ----------------------------
DROP TABLE IF EXISTS `sys_openjob`;
CREATE TABLE `sys_openjob`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_FILENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_JOBNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_JOBGROUP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_STARRUNTIME` datetime NULL DEFAULT NULL,
  `F_ENDRUNTIME` datetime NULL DEFAULT NULL,
  `F_CRONEXPRESS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTRUNTIME` datetime NULL DEFAULT NULL COMMENT '最后一次执行时间',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_openjob
-- ----------------------------
INSERT INTO `sys_openjob` VALUES ('08d9296b-2e10-403e-8272-87847110d046', 'WaterCloud.Service.AutoJob.ReadDingUserWorkJob', '定时更新在班情况', 'WaterCloud', '2021-11-30 07:25:19', '2021-11-30 07:25:18', '0 0 0/1 * * ?', 0, 1, '每1小时更新一次在班情况', '2021-06-07 12:17:36', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-11-30 07:25:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '2021-12-13 08:00:00');
INSERT INTO `sys_openjob` VALUES ('08d93471-4a21-4b26-8c4a-5d96d0823c7d', 'WaterCloud.Service.AutoJob.DeleteMessageJob', '删除通知信息', 'WaterCloud', '2021-11-30 07:25:19', '2021-11-30 07:25:18', '0 0 0 * * ?', 0, 1, '每天0点清除1日前的通知', '2021-06-21 12:59:03', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-11-30 07:25:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '2021-12-13 00:00:00');
INSERT INTO `sys_openjob` VALUES ('08d93a92-e732-4df4-89a8-ed2b69b619d8', 'WaterCloud.Service.AutoJob.CheckEqpStopJob', '未完成任务项设备停机', 'WaterCloud', '2021-11-30 07:25:19', '2021-11-30 07:25:18', '0 0/1 * * * ?', 0, 1, '每1分钟扫描一次任务是否完成', '2021-06-29 08:14:47', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-11-30 07:25:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '2021-12-13 08:29:00');
INSERT INTO `sys_openjob` VALUES ('08d94b55-de96-4d88-89dc-67e9745c9f0b', 'WaterCloud.Service.AutoJob.CheckDateStorageJob', '每日盘点', 'WaterCloud', '2021-11-30 07:25:19', '2021-11-30 07:25:18', '0 0 8,20 * * ?', 0, 1, '每天8点、20点 系统进行盘点', '2021-07-20 16:10:43', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-11-30 07:25:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '2021-12-13 08:00:00');
INSERT INTO `sys_openjob` VALUES ('08d95e17-7c91-489b-8615-f660bdc39bd1', 'WaterCloud.Service.AutoJob.AutoUpdatePlanJob', 'APS执行', 'WaterCloud', '2021-11-30 07:25:19', '2021-11-30 07:25:18', '0 0 7 * * ?', 0, 1, '每天早上7点执行APS更新计划', '2021-08-13 13:02:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-11-30 07:25:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '2021-08-26 07:00:00');
INSERT INTO `sys_openjob` VALUES ('08d961f5-c728-418d-8c54-67c2f74fd2ac', 'WaterCloud.Service.AutoJob.ReturnProduceJob', '产出退回', 'WaterCloud', '2021-11-30 07:25:19', '2021-11-30 07:25:18', '0 50 * * * ?', 0, 1, '每个小时执行，产出退回超过24小时的产出未上架的料,除去检验料', '2021-08-18 11:10:49', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-11-30 07:25:19', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '2021-12-13 07:50:00');
INSERT INTO `sys_openjob` VALUES ('b57a4ea0-e8f5-4df8-addc-8f0920fab395', 'WaterCloud.Service.AutoJob.SaveServerStateJob', '服务器状态', 'WaterCloud', '2021-11-30 07:25:20', '2021-11-30 07:25:19', '0 0/5 * * * ?', 0, 1, '每5分钟更新一次服务器状态', '2021-03-03 08:34:29', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-11-30 07:25:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '2021-12-13 08:25:00');

-- ----------------------------
-- Table structure for sys_openjoblog
-- ----------------------------
DROP TABLE IF EXISTS `sys_openjoblog`;
CREATE TABLE `sys_openjoblog`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_JOBID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '任务Id',
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '任务信息',
  `F_CREATORTIME` datetime NULL DEFAULT NULL COMMENT '执行时间',
  `F_ENABLEDMARK` tinyint NOT NULL COMMENT '执行状态',
  `F_JOBNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '任务名称',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_openjoblog
-- ----------------------------
INSERT INTO `sys_openjoblog` VALUES ('08d96cd3-0f5b-4623-8610-8172c8a83c49', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-01 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d96d9c-39b5-42f7-86cf-37e420c83cbe', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-02 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d96e65-642d-4666-81e3-34cfebfdc1d3', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-03 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d96f2e-8e96-45bc-8fc2-765282a09cfd', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-04 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d96ff7-b8f1-4b0b-86f6-f8bb16dfc8d1', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-05 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d970c0-e35c-4035-8c0c-be85bf0bd1a6', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-06 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9718a-0dc5-440f-80a8-90329bf39e57', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-07 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d97253-3830-4941-8b2a-ceaed7f43051', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-08 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9731c-629e-43a7-8669-46a86a260d59', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-09 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d973e5-8d04-43fc-827b-9a670ac46daf', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-10 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d974ae-b77b-4386-852e-88907ea5b259', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-11 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d97577-e1d6-47ce-8b83-4738be429e8a', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-12 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d97641-0c53-4582-803c-4c84467dd597', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-13 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9770a-36ab-4401-84a7-176067021a65', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-14 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d977d3-6113-4d8f-8f25-650419130fd2', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-15 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9789c-8b7d-41f9-88e9-3d44ced412e0', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-16 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d97965-b5e7-4a9f-8794-24ce7786ffb4', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-17 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d97a2e-e051-4bff-8f20-a056f3d87532', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-18 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d97af8-0aba-4e74-8bd7-c6c81d9767cd', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-19 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d97bc1-3524-43db-806a-c87274b04b8e', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-20 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d97c8a-5f8e-4ec0-80ce-8ea52f42404b', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-21 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d97d53-89f8-4169-8a06-322e63be6c43', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-22 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d97e1c-b463-4029-8fbe-63685b77be9b', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-23 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d97ee5-decb-4401-8fa8-f788d7474b6a', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-24 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d97faf-0934-4810-8b88-e67d53501f26', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-25 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d98078-339f-432a-8d43-225e354abe50', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-26 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d98141-5e18-4aa1-807d-b766f9b40ea2', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-27 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9820a-8874-4486-8159-44c07b3992ea', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-28 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d982d3-b2db-4a1a-88e7-2415452502d1', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-29 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9839c-dd45-469c-8a2f-7c5e0a79055f', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-09-30 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d98466-07b1-4081-81ad-11e2c4489167', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-01 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9852f-3218-4aa9-82e0-8f598e4052d8', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-02 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d98569-de8a-4180-8be2-d8f19ebe130c', '08d9296b-2e10-403e-8272-87847110d046', '执行失败，更新员工在班情况失败！不知道这样的主机。 (oapi.dingtalk.com:443)', '2021-10-02 14:00:00', 0, '定时更新在班情况');
INSERT INTO `sys_openjoblog` VALUES ('08d9878a-b16b-4f10-8f46-bb09941256ef', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-05 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d98853-dbc2-4eb2-87b3-0c4842dc0f02', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-06 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9891d-0629-4a5c-8dd4-249559fcddfd', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-07 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d989e6-3094-4ace-8108-8844a39933bd', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-08 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d98aaf-5afe-40c0-8608-74208272735c', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-09 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d98b78-8568-4698-83bc-c9841bf2eb01', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-10 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d98c41-afd2-4ad9-8532-cdf0683940fe', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-11 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d98d0a-da3b-416e-8806-e236a22161ca', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-12 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d98dd4-04a6-41c5-8ce7-8dcbfdcd3756', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-13 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d98e9d-2f0f-4542-898b-12ce8e80c212', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-14 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d98f66-5977-4fb5-8da1-4bf95a266475', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-15 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9902f-83e2-4b1a-8a2a-430cae89283d', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-16 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d990f8-ae4d-412a-8b19-00fed694492b', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-17 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d991c1-d8b4-4dac-8cba-fd83dccd3d8d', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-18 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9928b-0320-41d0-899d-9cbeb851a0e5', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-19 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d99354-2d88-4975-8652-98dc7a88dc12', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-20 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9941d-57f3-4c05-85a0-1a4665b7d8a4', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-21 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d994e6-825e-4085-843f-0e0c05c6f035', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-22 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d995af-acc6-4b8c-83dc-a425691a7bf7', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-23 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d99678-d730-42f1-8bd9-ba1f48b68406', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-24 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d99742-019a-4503-8ba1-a7113365bbb3', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-25 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9980b-2c05-4051-8bf2-cb8d0bf1a9df', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-26 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d998d4-566d-4780-869c-b54fc3aaf33c', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-27 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9999d-80d7-4b34-82f0-2d337f0289b6', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-28 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d99a66-ab42-41de-8050-81373036f065', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-29 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d99b2f-d5aa-4250-8c3c-0c9b9981be98', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-30 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d99bf9-0016-4780-85de-44c6eccca4cb', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-10-31 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d99cc2-2a7e-46c6-8331-d232e6c21da4', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-01 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d99d8b-54e7-49bf-848f-7ee969b643a5', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-02 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d99e54-7f52-4813-8f46-cdee043aa1f7', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-03 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d99f1d-a9bb-4371-8a9a-8fb2b1c1ab04', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-04 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d99fe6-d426-4f79-8201-4e9fcfc1caf6', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-05 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9a0af-fe8e-4bdb-8e68-f5318b648d0f', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-06 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9a179-28fc-4e3b-8a65-c0052cde8966', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-07 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9a242-5362-435e-8167-7096e91a8921', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-08 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9a30b-7dcd-4f15-8a85-6d26ffa12b61', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-09 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9a3d4-a836-4dce-81c8-18d5bda628c9', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-10 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9a49d-d29f-4ce8-8f3b-e06b89b7fa8a', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-11 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9a566-fd0a-485c-83f5-dcf75c05328e', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-12 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9a630-2786-436e-89b9-ae8a88685b01', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-13 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9a6f9-51de-4c41-8f8c-19ac709fbca2', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-14 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9a7c2-7c47-45f5-82ac-d1898994fc9d', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-15 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9a88b-a6b0-46ff-80ae-7abe6af27696', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-16 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9a954-d11a-4c51-8c2d-1938f31e5c7c', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-17 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9aa1d-fb84-486d-869f-e94e2baf54a7', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-18 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9aae7-25ed-495b-8544-cfc3ec02111c', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-19 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9abb0-5058-44c9-8cc6-f92234b766aa', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-20 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9ac79-7ac0-4fcc-89da-9e9b0c1a2292', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-21 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9ad42-a52b-4918-83cc-99d5103e0ab3', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-22 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9ae0b-cf95-4671-8b86-776a09dba4b4', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-23 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9aed4-f9fd-4911-83e4-a3a0d4b0691f', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-24 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9af9e-2469-4f01-8cac-b69e416f5de3', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-25 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9b067-4ed2-4630-8f8a-52dcd2038281', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-26 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9b130-793a-4c85-8987-91e5e3fe5614', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-27 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9b1f9-a3a5-4bea-8cf1-32fd7648f1d9', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-28 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9b2c2-ce0e-4ee1-882b-b0c0d2a16fd9', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-11-29 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9b455-22fa-473d-8dfc-4ce61c6acd28', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-12-01 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9b51e-4d4d-4829-85b7-cc17bc397152', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-12-02 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9b5e7-77b5-4650-8224-36a2ae6ad3c5', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-12-03 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9b6b0-a21e-4ef5-8374-e105e7a4dfd8', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-12-04 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9b779-cc89-49a0-8623-72050a6282ec', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-12-05 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9b842-f6f2-49a0-861f-8970c517d59d', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-12-06 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9b90c-215f-4887-8c93-37290dee9c33', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-12-07 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9b9d5-4bc7-4685-8f5a-2b94c9322ef7', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-12-08 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9ba9e-7630-4c89-8644-75635008f5fd', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-12-09 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9bb67-a09b-4163-8beb-b3c6ea80653e', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-12-10 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9bc30-cb04-4303-80e7-95c091db4130', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-12-11 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9bcf9-f56c-4f75-8d53-dab33314e5bc', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-12-12 07:00:00', 0, 'APS执行');
INSERT INTO `sys_openjoblog` VALUES ('08d9bdc3-1fd9-4479-8ab6-5b4965d5f0d6', '08d95e17-7c91-489b-8615-f660bdc39bd1', '执行失败，APS更新失败！没有订单需要执行APS', '2021-12-13 07:00:00', 0, 'APS执行');

-- ----------------------------
-- Table structure for sys_organize
-- ----------------------------
DROP TABLE IF EXISTS `sys_organize`;
CREATE TABLE `sys_organize`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_PARENTID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LAYERS` int NULL DEFAULT NULL,
  `F_ENCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_FULLNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_SHORTNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_CATEGORYID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_MANAGERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_TELEPHONE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_MOBILEPHONE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_WECHAT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_FAX` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_AREAID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ADDRESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_ALLOWEDIT` tinyint NULL DEFAULT NULL,
  `F_ALLOWDELETE` tinyint NULL DEFAULT NULL,
  `F_SORTCODE` int NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  PRIMARY KEY (`F_ID`) USING BTREE,
  INDEX `IX_SYS_ORGANIZE`(`F_ENCODE`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_organize
-- ----------------------------
INSERT INTO `sys_organize` VALUES ('5AB270C0-5D33-4203-A54F-4552699FDA3C', '0', 1, 'Company', '水之云', NULL, 'Company', '', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, 0, 1, 0, 1, '', '2016-06-10 00:00:00', NULL, '2021-03-30 14:41:26', 'b05fb485-c0ea-4f1b-9c3c-dcf43566e162', NULL, NULL);

-- ----------------------------
-- Table structure for sys_printtemplate
-- ----------------------------
DROP TABLE IF EXISTS `sys_printtemplate`;
CREATE TABLE `sys_printtemplate`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_PRINTTEMPLATENAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '模板名称',
  `F_PRINTTEMPLATEPATH` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '模板地址',
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_PRINTTEMPLATEDESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '模板描述',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_printtemplate
-- ----------------------------
INSERT INTO `sys_printtemplate` VALUES ('08dab30e-3e4a-4dab-8536-08eb819a63de', '二维码编号名称模板', '/file/code1.frx', 0, 1, '', '2022-10-21 10:44:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, '二维码参数barId；名称参数name：编号参数code');
INSERT INTO `sys_printtemplate` VALUES ('08dab30e-5e26-442c-8ad3-8cb4bb9409dd', '出入库单据模板', '/file/code2.frx', 0, 1, '', '2022-10-21 10:45:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, '二维码参数barId;名称参数name;编号参数code;数量参数num;');

-- ----------------------------
-- Table structure for sys_printtemplatehis
-- ----------------------------
DROP TABLE IF EXISTS `sys_printtemplatehis`;
CREATE TABLE `sys_printtemplatehis`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_PRINTTEMPLATEPATH` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '模板地址',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_PARENTID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '父级id',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_printtemplatehis
-- ----------------------------

-- ----------------------------
-- Table structure for sys_quickmodule
-- ----------------------------
DROP TABLE IF EXISTS `sys_quickmodule`;
CREATE TABLE `sys_quickmodule`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_MODULEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE,
  INDEX `IX_SYS_QUICKMODULE`(`F_MODULEID`, `F_CREATORUSERID`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_quickmodule
-- ----------------------------
INSERT INTO `sys_quickmodule` VALUES ('08d96c58-22dc-422e-8380-6a25455fd816', '01849cc9-c6da-4184-92f8-34875dac1d42', 0, 1, NULL, '2021-08-31 16:20:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_quickmodule` VALUES ('08d96c58-22dc-4486-8924-18167c5d9465', '08d92a3f-bdb2-42be-89c7-fae5d3a4fec3', 0, 1, NULL, '2021-08-31 16:20:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_quickmodule` VALUES ('08d96c58-22dc-46c2-8367-4a29cd14b279', '08d92af0-e091-40c3-8a90-914a3266dafc', 0, 1, NULL, '2021-08-31 16:20:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_quickmodule` VALUES ('08d96c58-22dc-4903-86a8-e4e4f8e34f95', '08d92be4-74ba-4edf-8357-49547cae7fbc', 0, 1, NULL, '2021-08-31 16:20:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_quickmodule` VALUES ('08d96c58-22dc-4b2f-8880-a179f0714022', '08d92fa2-7423-43dc-8839-359e00c53878', 0, 1, NULL, '2021-08-31 16:20:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_quickmodule` VALUES ('08d96c58-22dc-4d3c-85c8-843289b645d1', '08d92fb7-7754-4c3b-8341-c60bc590212d', 0, 1, NULL, '2021-08-31 16:20:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_quickmodule` VALUES ('08d96c58-22dc-4f5e-848f-49681c661a91', '08d93158-2459-490a-868d-a826777f22e4', 0, 1, NULL, '2021-08-31 16:20:05', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_quickmodule` VALUES ('08d96e83-6dc4-490e-8343-fbb916dacba9', '26452c9a-243d-4c81-97b9-a3ad581c3bf4', 0, 1, NULL, '2021-09-03 10:35:01', '08d96e82-89ea-4ed8-89fb-9520423dbcf7', NULL, NULL, NULL, NULL);
INSERT INTO `sys_quickmodule` VALUES ('08d96e83-6dc4-4c78-8753-ba8bc4dc7b8a', '262ca754-1c73-436c-a9a2-b6374451a845', 0, 1, NULL, '2021-09-03 10:35:01', '08d96e82-89ea-4ed8-89fb-9520423dbcf7', NULL, NULL, NULL, NULL);
INSERT INTO `sys_quickmodule` VALUES ('08d96e83-6dc4-4f80-8d29-d38555d467a1', '91A6CFAD-B2F9-4294-BDAE-76DECF412C6C', 0, 1, NULL, '2021-09-03 10:35:01', '08d96e82-89ea-4ed8-89fb-9520423dbcf7', NULL, NULL, NULL, NULL);
INSERT INTO `sys_quickmodule` VALUES ('08d96e83-6dc5-4268-8628-a9db6cde327c', 'F298F868-B689-4982-8C8B-9268CBF0308D', 0, 1, NULL, '2021-09-03 10:35:01', '08d96e82-89ea-4ed8-89fb-9520423dbcf7', NULL, NULL, NULL, NULL);
INSERT INTO `sys_quickmodule` VALUES ('08d96e83-6dc5-453c-81ff-e467b31890a4', '38CA5A66-C993-4410-AF95-50489B22939C', 0, 1, NULL, '2021-09-03 10:35:01', '08d96e82-89ea-4ed8-89fb-9520423dbcf7', NULL, NULL, NULL, NULL);
INSERT INTO `sys_quickmodule` VALUES ('08d96e83-6dc5-4a4a-80f4-1d76587a94f2', '2c2ddbce-ee87-4134-9b32-54d0bd572910', 0, 1, NULL, '2021-09-03 10:35:01', '08d96e82-89ea-4ed8-89fb-9520423dbcf7', NULL, NULL, NULL, NULL);
INSERT INTO `sys_quickmodule` VALUES ('08d96e83-6dc5-4d49-8549-14b52139252a', 'f82fd629-5f3a-45d6-8681-5ec47e66a807', 0, 1, NULL, '2021-09-03 10:35:01', '08d96e82-89ea-4ed8-89fb-9520423dbcf7', NULL, NULL, NULL, NULL);
INSERT INTO `sys_quickmodule` VALUES ('08d96e83-6dc6-405b-8766-aee351a656a9', 'd9078b9a-5db6-4429-b489-3700e56f367f', 0, 1, NULL, '2021-09-03 10:35:01', '08d96e82-89ea-4ed8-89fb-9520423dbcf7', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_reporttemplate
-- ----------------------------
DROP TABLE IF EXISTS `sys_reporttemplate`;
CREATE TABLE `sys_reporttemplate`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_PRINTTEMPLATENAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '模板名称',
  `F_PRINTTEMPLATEPATH` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '模板地址',
  `F_DELETEMARK` tinyint NOT NULL,
  `F_ENABLEDMARK` tinyint NOT NULL,
  `F_DESCRIPTION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '备注',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_PRINTTEMPLATETYPE` int NOT NULL COMMENT '模板类型 0json 1xlsx',
  `F_PRINTTEMPLATEJSON` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '模板内容',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_reporttemplate
-- ----------------------------

-- ----------------------------
-- Table structure for sys_reporttemplatehis
-- ----------------------------
DROP TABLE IF EXISTS `sys_reporttemplatehis`;
CREATE TABLE `sys_reporttemplatehis`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_PARENTID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '父级id',
  `F_PRINTTEMPLATEPATH` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL COMMENT '模板地址',
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_PRINTTEMPLATETYPE` int NOT NULL COMMENT '模板类型 0json 1xlsx',
  `F_PRINTTEMPLATEJSON` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL COMMENT '模板内容',
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_reporttemplatehis
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_ORGANIZEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_CATEGORY` int NULL DEFAULT NULL,
  `F_ENCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_FULLNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ALLOWEDIT` tinyint NULL DEFAULT NULL,
  `F_ALLOWDELETE` tinyint NULL DEFAULT NULL,
  `F_SORTCODE` int NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  PRIMARY KEY (`F_ID`) USING BTREE,
  INDEX `IX_SYS_ROLE`(`F_ENCODE`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_roleauthorize
-- ----------------------------
DROP TABLE IF EXISTS `sys_roleauthorize`;
CREATE TABLE `sys_roleauthorize`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_ITEMTYPE` int NULL DEFAULT NULL,
  `F_ITEMID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_OBJECTTYPE` int NULL DEFAULT NULL,
  `F_OBJECTID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_SORTCODE` int NULL DEFAULT NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_roleauthorize
-- ----------------------------

-- ----------------------------
-- Table structure for sys_serverstate
-- ----------------------------
DROP TABLE IF EXISTS `sys_serverstate`;
CREATE TABLE `sys_serverstate`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_WEBSITE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ARM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_CPU` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_IIS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DATE` date NULL DEFAULT NULL,
  `F_COUT` int NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE,
  INDEX `IX_SYS_SERVERSTATE`(`F_WEBSITE`, `F_DATE`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_serverstate
-- ----------------------------

-- ----------------------------
-- Table structure for sys_systemset
-- ----------------------------
DROP TABLE IF EXISTS `sys_systemset`;
CREATE TABLE `sys_systemset`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_LOGO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_LOGOCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_PROJECTNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_COMPANYNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ADMINACCOUNT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ADMINPASSWORD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_MOBILEPHONE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_PRINCIPALMAN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ENDTIME` datetime NULL DEFAULT NULL,
  `F_DBSTRING` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_DBPROVIDER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_HOSTURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_systemset
-- ----------------------------
INSERT INTO `sys_systemset` VALUES ('d69fd66a-6a77-4011-8a25-53a79bdf5001', '/icon/favicon.ico', 'EasyMES', 'MES信息系统', '水之云', 'admin', '13579', 0, 1, '', '2020-06-12 16:30:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-19 09:56:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '13600000000', 'xxxx', '2032-06-26 00:00:00', 'Data Source = localhost;Initial Catalog = szprslmes;User ID=sa;Password=Hgame3569@;MultipleActiveResultSets=true;', 'System.Data.SqlClient', 'localhost');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_ACCOUNT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_REALNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_NICKNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_HEADICON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_GENDER` tinyint NULL DEFAULT NULL,
  `F_BIRTHDAY` datetime NULL DEFAULT NULL,
  `F_MOBILEPHONE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_EMAIL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_WECHAT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_MANAGERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_SECURITYLEVEL` int NULL DEFAULT NULL,
  `F_SIGNATURE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_ORGANIZEID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DEPARTMENTID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_ROLEID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_DUTYID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_ISADMIN` tinyint NULL DEFAULT NULL,
  `F_ISBOSS` tinyint NULL DEFAULT NULL,
  `F_ISLEADERINDEPTS` tinyint NULL DEFAULT NULL,
  `F_ISSENIOR` tinyint NULL DEFAULT NULL,
  `F_SORTCODE` int NULL DEFAULT NULL,
  `F_DELETEMARK` tinyint NULL DEFAULT NULL,
  `F_ENABLEDMARK` tinyint NULL DEFAULT NULL,
  `F_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CREATORTIME` datetime NULL DEFAULT NULL,
  `F_CREATORUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LASTMODIFYTIME` datetime NULL DEFAULT NULL,
  `F_LASTMODIFYUSERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DELETETIME` datetime NULL DEFAULT NULL,
  `F_DELETEUSERID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_DINGTALKOPENID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DINGTALKNICK` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_DINGTALKUNIONID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_WXOPENID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_WXNICKNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_HEADIMGURL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ISPLANMAN` tinyint NOT NULL COMMENT '调度人员',
  `F_WEBSOCKETPORT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL COMMENT '打印端口',
  PRIMARY KEY (`F_ID`) USING BTREE,
  INDEX `IX_SYS_USER`(`F_ACCOUNT`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', 'admin', '超级管理员', '超级管理员', NULL, 1, '2020-03-28 00:00:00', '13600000001', '3333', NULL, NULL, NULL, NULL, 'd69fd66a-6a77-4011-8a25-53a79bdf5001', '5AB270C0-5D33-4203-A54F-4552699FDA3C', NULL, NULL, 1, 0, 0, 0, NULL, 0, 1, '系统内置账户', '2016-07-20 00:00:00', NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, 0, '7181');

-- ----------------------------
-- Table structure for sys_userlogon
-- ----------------------------
DROP TABLE IF EXISTS `sys_userlogon`;
CREATE TABLE `sys_userlogon`  (
  `F_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NOT NULL,
  `F_USERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_USERPASSWORD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_USERSECRETKEY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ALLOWSTARTTIME` datetime NULL DEFAULT NULL,
  `F_ALLOWENDTIME` datetime NULL DEFAULT NULL,
  `F_LOCKSTARTDATE` datetime NULL DEFAULT NULL,
  `F_LOCKENDDATE` datetime NULL DEFAULT NULL,
  `F_FIRSTVISITTIME` datetime NULL DEFAULT NULL,
  `F_PREVIOUSVISITTIME` datetime NULL DEFAULT NULL,
  `F_LASTVISITTIME` datetime NULL DEFAULT NULL,
  `F_CHANGEPASSWORDDATE` datetime NULL DEFAULT NULL,
  `F_MULTIUSERLOGIN` tinyint NULL DEFAULT NULL,
  `F_LOGONCOUNT` int NULL DEFAULT NULL,
  `F_USERONLINE` tinyint NULL DEFAULT NULL,
  `F_QUESTION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ANSWERQUESTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL,
  `F_CHECKIPADDRESS` tinyint NULL DEFAULT NULL,
  `F_LANGUAGE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_THEME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_LOGINSESSION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_bin NULL DEFAULT NULL,
  `F_ERRORNUM` int NULL DEFAULT NULL,
  PRIMARY KEY (`F_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_userlogon
-- ----------------------------
INSERT INTO `sys_userlogon` VALUES ('08d96e82-89ea-4ed8-89fb-9520423dbcf7', '08d96e82-89ea-4ed8-89fb-9520423dbcf7', '107b8ef72a5ee9b734d89c8617fa4c1c', '1eacb75a6c6118fd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_userlogon` VALUES ('9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '52c6b3f2456d7a6e4ce848c38bb0a228', 'b648e3d3de301b49', NULL, NULL, NULL, NULL, NULL, '2020-04-17 14:47:44', '2020-04-17 14:59:58', NULL, 0, 360, 0, NULL, NULL, 0, NULL, NULL, 'evrcyibdv42f3ykhfy1yz3ur', 0);

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO `szprslmes`.`sys_modulebutton` (`F_ID`, `F_MODULEID`, `F_PARENTID`, `F_LAYERS`, `F_ENCODE`, `F_FULLNAME`, `F_ICON`, `F_LOCATION`, `F_JSEVENT`, `F_URLADDRESS`, `F_SPLIT`, `F_ISPUBLIC`, `F_ALLOWEDIT`, `F_ALLOWDELETE`, `F_SORTCODE`, `F_DELETEMARK`, `F_ENABLEDMARK`, `F_DESCRIPTION`, `F_CREATORTIME`, `F_CREATORUSERID`, `F_LASTMODIFYTIME`, `F_LASTMODIFYUSERID`, `F_DELETETIME`, `F_DELETEUSERID`, `F_AUTHORIZE`) VALUES ('08dab58c-bd53-4a2f-8a6b-1403129ee16c', '4666f434-3178-42e5-a44f-1f34cadb3c44', '0', 1, 'EqpRepairRecord', '维修记录', NULL, 1, 'EqpRepairRecord', '', NULL, 0, 0, 0, 3, 0, 1, '', '2022-10-24 14:55:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-24 14:57:14', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 'EqpRepairRecord');
INSERT INTO `szprslmes`.`sys_modulebutton` (`F_ID`, `F_MODULEID`, `F_PARENTID`, `F_LAYERS`, `F_ENCODE`, `F_FULLNAME`, `F_ICON`, `F_LOCATION`, `F_JSEVENT`, `F_URLADDRESS`, `F_SPLIT`, `F_ISPUBLIC`, `F_ALLOWEDIT`, `F_ALLOWDELETE`, `F_SORTCODE`, `F_DELETEMARK`, `F_ENABLEDMARK`, `F_DESCRIPTION`, `F_CREATORTIME`, `F_CREATORUSERID`, `F_LASTMODIFYTIME`, `F_LASTMODIFYUSERID`, `F_DELETETIME`, `F_DELETEUSERID`, `F_AUTHORIZE`) VALUES ('08dab58c-bd53-49c1-8a1e-ff507ece06ab', '4666f434-3178-42e5-a44f-1f34cadb3c44', '0', 1, 'EqpRepairInfo', '设备维修', NULL, 1, 'EqpRepairInfo', '', NULL, 0, 0, 0, 2, 0, 1, '', '2022-10-24 14:55:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-24 14:56:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 'EqpRepairInfo');
INSERT INTO `szprslmes`.`sys_modulebutton` (`F_ID`, `F_MODULEID`, `F_PARENTID`, `F_LAYERS`, `F_ENCODE`, `F_FULLNAME`, `F_ICON`, `F_LOCATION`, `F_JSEVENT`, `F_URLADDRESS`, `F_SPLIT`, `F_ISPUBLIC`, `F_ALLOWEDIT`, `F_ALLOWDELETE`, `F_SORTCODE`, `F_DELETEMARK`, `F_ENABLEDMARK`, `F_DESCRIPTION`, `F_CREATORTIME`, `F_CREATORUSERID`, `F_LASTMODIFYTIME`, `F_LASTMODIFYUSERID`, `F_DELETETIME`, `F_DELETEUSERID`, `F_AUTHORIZE`) VALUES ('08dab58c-bd53-4793-85de-bd4bd3aa4a35', '4666f434-3178-42e5-a44f-1f34cadb3c44', '0', 1, 'EqpCallRepair', '故障报修', NULL, 1, 'EqpCallRepair', '', NULL, 0, 0, 0, 1, 0, 1, '', '2022-10-24 14:55:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-24 14:56:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 'EqpCallRepair');

