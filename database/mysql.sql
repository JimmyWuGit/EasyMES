
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mes_area
-- ----------------------------
DROP TABLE IF EXISTS `mes_area`;
CREATE TABLE `mes_area`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_AreaCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '库区编号',
  `F_AreaType` int NOT NULL COMMENT '库区类型',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_NeedRule` tinyint NULL DEFAULT NULL COMMENT '是否需要先进先出',
  `F_StackType` tinyint NULL DEFAULT NULL COMMENT 'true货架 false叠加',
  `F_Prefix` int NULL DEFAULT NULL COMMENT '库位前缀',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_area
-- ----------------------------

-- ----------------------------
-- Table structure for mes_batchinfo
-- ----------------------------
DROP TABLE IF EXISTS `mes_batchinfo`;
CREATE TABLE `mes_batchinfo`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_FlowType` int NULL DEFAULT NULL COMMENT '流转类型(0入库绑定，1领用，2产出，3库存，4出库，5检验)',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号编号',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_TransferBoxCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转箱编号',
  `F_LocationCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库位号',
  `F_MaterialBatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号批次',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备id',
  `F_EqpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备名称',
  `F_Num` double NOT NULL COMMENT '数量',
  `F_DoneNum` double NOT NULL COMMENT '使用数量',
  `F_ParentId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '父级',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_batchinfo
-- ----------------------------

-- ----------------------------
-- Table structure for mes_boardaccount
-- ----------------------------
DROP TABLE IF EXISTS `mes_boardaccount`;
CREATE TABLE `mes_boardaccount`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_Account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账户',
  `F_Password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属设备',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_boardaccount
-- ----------------------------

-- ----------------------------
-- Table structure for mes_bomform
-- ----------------------------
DROP TABLE IF EXISTS `mes_bomform`;
CREATE TABLE `mes_bomform`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号主键-1',
  `F_SonMaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组成主键-n',
  `F_BomType` int NULL DEFAULT NULL COMMENT 'Bom类型（0erp,1mes）',
  `F_ProcessId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序主键',
  `F_Num` double NOT NULL COMMENT '数量',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_bomform
-- ----------------------------

-- ----------------------------
-- Table structure for mes_checkdatestorage
-- ----------------------------
DROP TABLE IF EXISTS `mes_checkdatestorage`;
CREATE TABLE `mes_checkdatestorage`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_CheckStorageType` int NOT NULL COMMENT '盘点类型',
  `F_CheckDate` date NOT NULL COMMENT '盘点日期',
  `F_ClassNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '班别（A白班，B夜班）',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_BeginNum` double NOT NULL COMMENT '上一班数量',
  `F_CurrentNum` double NULL DEFAULT NULL COMMENT '当前数量',
  `F_CurrentPallet` int NULL DEFAULT NULL COMMENT '当前托数',
  `F_InNum` double NULL DEFAULT NULL COMMENT '入库数量',
  `F_OutNum` double NULL DEFAULT NULL COMMENT '出库数量',
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  PRIMARY KEY (`F_Id`) USING BTREE,
  UNIQUE INDEX `mes_checkdatestorage`(`F_CheckStorageType`, `F_CheckDate`, `F_ClassNum`, `F_MaterialId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_checkdatestorage
-- ----------------------------

-- ----------------------------
-- Table structure for mes_checkoutdescription
-- ----------------------------
DROP TABLE IF EXISTS `mes_checkoutdescription`;
CREATE TABLE `mes_checkoutdescription`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `F_ParentId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '父级id',
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '描述',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `F_Layers` int NULL DEFAULT NULL COMMENT '层级',
  `F_ClickNum` bigint NOT NULL COMMENT '选择次数',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_checkoutdescription
-- ----------------------------

-- ----------------------------
-- Table structure for mes_consumeinfo
-- ----------------------------
DROP TABLE IF EXISTS `mes_consumeinfo`;
CREATE TABLE `mes_consumeinfo`  (
  `F_Id` bigint NOT NULL COMMENT 'id',
  `F_TransferBoxCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转箱编号',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_MaterialBatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号批次',
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `F_Num` double NOT NULL COMMENT '数量',
  `F_ProcessId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序Id',
  `F_ProcessName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序名称',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备Id',
  `F_EqpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备名称',
  `F_WorkOrderId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工单Id',
  `F_WorkOrderCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工单编号',
  `F_WorkOrderRunSort` int NULL DEFAULT NULL COMMENT '执行顺序',
  `F_OutPutId` bigint NULL DEFAULT NULL COMMENT '产出id',
  `F_WorkOrderDetailId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工单明细Id',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_consumeinfo
-- ----------------------------

-- ----------------------------
-- Table structure for mes_controljob
-- ----------------------------
DROP TABLE IF EXISTS `mes_controljob`;
CREATE TABLE `mes_controljob`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_JobCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度编号',
  `F_JobInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度信息',
  `F_IsToPlanMan` tinyint NOT NULL COMMENT '是否发送计划人员',
  `F_IsNotice` tinyint NOT NULL COMMENT '是否通知',
  `F_Priority` int NOT NULL COMMENT '优先级（从大到小执行）',
  `F_DoneTime` datetime NULL DEFAULT NULL COMMENT '执行时间',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_JobType` int NOT NULL COMMENT '0补货，1入库，2出库，3产出上架，4移库，5作业开始，6作业结束,7领用退回',
  `F_NeedId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '需求id',
  `F_FinishTime` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `F_JobState` int NOT NULL COMMENT '任务状态（0等待，1执行，2完成,3结束）',
  `F_NeedEqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '需求设备id',
  `F_NeedNum` double NULL DEFAULT NULL COMMENT '数量',
  `F_NeedTime` datetime NULL DEFAULT NULL COMMENT '需求时间',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_controljob
-- ----------------------------

-- ----------------------------
-- Table structure for mes_controljobmusttime
-- ----------------------------
DROP TABLE IF EXISTS `mes_controljobmusttime`;
CREATE TABLE `mes_controljobmusttime`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_JobType` int NOT NULL COMMENT '0补货，1入库，2出库，3产出上架，4移库，5作业开始，6作业结束,7领用退回',
  `F_NeedTime` int NOT NULL COMMENT '任务响应时间(分)',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_JobType` int NOT NULL COMMENT '0补货，1入库，2出库，3产出上架，4移库，5作业开始，6作业结束,7领用退回',
  `F_UserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户ID',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备ID',
  `F_UserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `F_EqpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_controljobuserbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqpareabanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqpareabanding`;
CREATE TABLE `mes_eqpareabanding`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转箱编号',
  `F_AreaId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '库区Id',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_eqpareabanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqpmaterialbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqpmaterialbanding`;
CREATE TABLE `mes_eqpmaterialbanding`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备ID',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_Num` double NOT NULL COMMENT '产量数量',
  `F_ProduceType` int NOT NULL COMMENT '生产模式(0独立，1共享)',
  `F_Priority` int NOT NULL COMMENT '从大到小',
  `F_PrgName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '夹具编号',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_eqpmaterialbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqpmaterialuse
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqpmaterialuse`;
CREATE TABLE `mes_eqpmaterialuse`  (
  `F_Id` bigint NOT NULL COMMENT 'id',
  `F_TransferBoxCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转箱编号',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_MaterialBatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号批次',
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `F_Num` double NOT NULL COMMENT '数量',
  `F_DoneNum` double NULL DEFAULT NULL COMMENT '消耗数量',
  `F_ProcessId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序Id',
  `F_ProcessName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序名称',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备id',
  `F_EqpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备名称',
  `F_WorkOrderId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工单Id',
  `F_WorkOrderCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工单编号',
  `F_WorkOrderRunSort` int NULL DEFAULT NULL COMMENT '执行顺序',
  `F_WorkOrderDetailId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工单明细Id',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `F_LocationCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库位号',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_eqpmaterialuse
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqppqccheckitem
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqppqccheckitem`;
CREATE TABLE `mes_eqppqccheckitem`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备ID',
  `F_Sequence` int NULL DEFAULT NULL COMMENT '顺序',
  `F_CheckItem` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '点检项目',
  `F_CheckStand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检验基准',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_eqppqccheckitem
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqppqcdetail
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqppqcdetail`;
CREATE TABLE `mes_eqppqcdetail`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_PId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_CheckItemId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day3` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day4` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day5` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day6` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day7` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day8` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day9` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day10` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day11` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day12` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day13` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day14` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day15` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day16` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day17` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day18` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day19` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day20` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day21` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day22` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day23` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day24` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day25` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day26` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day27` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day28` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day29` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day30` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Day31` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_CheckItem` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '检测项名字',
  `F_CheckStand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检测标准',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_eqppqcdetail
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqppqcmaster
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqppqcmaster`;
CREATE TABLE `mes_eqppqcmaster`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备ID',
  `F_CheckMonth` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '点检月份',
  `F_Shift` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '班别',
  `F_Remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_eqppqcmaster
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqprepair
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqprepair`;
CREATE TABLE `mes_eqprepair`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_RepairNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '维修单号',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ProblemType` int NULL DEFAULT NULL COMMENT '故障分类',
  `F_ProblemClass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '故障等级：1低级，2中级，3高级',
  `F_ProblemDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '故障描述',
  `F_PhotoPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '故障图片路径',
  `F_CallRepairMan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报修人ID',
  `F_CallRepairTime` datetime NULL DEFAULT NULL COMMENT '报修时间',
  `F_DistributeTime` datetime NULL DEFAULT NULL COMMENT '派工时间',
  `F_StartRepairTime` datetime NULL DEFAULT NULL COMMENT '维修开始时间',
  `F_EndRepairTime` datetime NULL DEFAULT NULL COMMENT '维修结束时间',
  `F_Status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态：1,报修；2，已派工；3,维修中；4，确认中，99，关闭',
  `F_ConfirmMan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '确认人ID,同报修人',
  `F_ConfirmTime` datetime NULL DEFAULT NULL COMMENT '确认时间',
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_EqpName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_CallRepairManName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报修人姓名',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '设备维修记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_eqprepair
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqprepairmanrecord
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqprepairmanrecord`;
CREATE TABLE `mes_eqprepairmanrecord`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_RepairId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备维修记录表主键',
  `F_RepairMan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '维修人Id',
  `F_DistributeTime` datetime NULL DEFAULT NULL COMMENT '派工时间',
  `F_StartRepairTime` datetime NULL DEFAULT NULL COMMENT '维修开始时间',
  `F_EndRepairTime` datetime NULL DEFAULT NULL COMMENT '维修结束时间',
  `F_RepairResult` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '维修结果',
  `F_Status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态：1,派工，2，维修中，99，完成',
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_RepairManName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '维修人姓名',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '维修人员记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_eqprepairmanrecord
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqprepairprocess
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqprepairprocess`;
CREATE TABLE `mes_eqprepairprocess`  (
  `F_RepairId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '维修单主键',
  `F_AddTime` datetime NULL DEFAULT NULL COMMENT '动作时间',
  `F_ActionDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '动作描述'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_eqprepairprocess
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqpstoprecord
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqpstoprecord`;
CREATE TABLE `mes_eqpstoprecord`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_StopType` int NULL DEFAULT NULL COMMENT '1：故障停机，2：计划内停机，3:急停停机',
  `F_PlanStopStartTime` datetime NULL DEFAULT NULL COMMENT '计划停机开始时间',
  `F_PlanStopEndTime` datetime NULL DEFAULT NULL COMMENT '计划停机结束时间',
  `F_StopReasonType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '停机原因分类：1人2机3料4法5环',
  `F_StopReason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '停机原因',
  `F_RealStopStartTime` datetime NULL DEFAULT NULL COMMENT '实际停机开始时间',
  `F_RealStopEndTime` datetime NULL DEFAULT NULL COMMENT '实际停机结束时间',
  `F_Solution` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '解决措施',
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_EqpName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_IsRecovery` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否恢复，Y是，N否',
  `F_Shift` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '班别',
  `F_Day` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当班日期',
  `F_RepeatWeekday` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '周几重复，空不重复',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '停机记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_eqpstoprecord
-- ----------------------------

-- ----------------------------
-- Table structure for mes_eqpworktime
-- ----------------------------
DROP TABLE IF EXISTS `mes_eqpworktime`;
CREATE TABLE `mes_eqpworktime`  (
  `F_Id` bigint NOT NULL COMMENT '主键',
  `F_StartTime` datetime NOT NULL COMMENT '结束时间',
  `F_EndTime` datetime NOT NULL COMMENT '开始时间',
  `F_TimeNum` double NOT NULL COMMENT '计算以半小时算',
  `F_UserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id',
  `F_UserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名称',
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_eqpworktime
-- ----------------------------

-- ----------------------------
-- Table structure for mes_equipment
-- ----------------------------
DROP TABLE IF EXISTS `mes_equipment`;
CREATE TABLE `mes_equipment`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_ParentId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_EqpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备名称',
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '设备描述',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_EqpState` int NOT NULL,
  `F_EqpOwner` int NULL DEFAULT NULL COMMENT '财产所属',
  `F_UseDate` datetime NULL DEFAULT NULL COMMENT '接收日期',
  `F_PlanUserNum` int NULL DEFAULT NULL COMMENT '预计使用次数',
  `F_UsedNum` int NULL DEFAULT NULL COMMENT '已使用次数',
  `F_MaintainNum` int NULL DEFAULT NULL COMMENT '保养周期',
  `F_EqpType` int NOT NULL COMMENT '设备类型',
  `F_IsMaintain` tinyint NOT NULL COMMENT '是否需要保养',
  `F_IsOtherEqp` tinyint NOT NULL COMMENT '是否加载流动设备',
  `F_MaintainType` int NULL DEFAULT NULL COMMENT '保养类型',
  `F_EqpUse` int NOT NULL COMMENT '设备用途',
  `F_MoldingNum` int NULL DEFAULT NULL COMMENT '模具模数',
  `F_CompanyName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属公司',
  `F_MouldType` int NULL DEFAULT NULL COMMENT '模具类型',
  `F_DieNum` int NULL DEFAULT NULL COMMENT '模具号',
  `F_PlcState` int NULL DEFAULT NULL COMMENT 'plc状态',
  `F_BatchPrefix` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '批次前缀',
  `F_BatchType` int NULL DEFAULT NULL COMMENT '批次类型(0、年月日班，1、年月日时分秒)',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绑定物料',
  `F_OutTransferNum` int NULL DEFAULT NULL COMMENT '产出容器限制',
  `F_PlanStopTime` int NULL DEFAULT NULL COMMENT '固定停机时间分钟(min)',
  `F_OEE` int NULL DEFAULT NULL COMMENT 'OEE(%)',
  `F_Beat` double NULL DEFAULT NULL COMMENT '节拍(s)'
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_equipment
-- ----------------------------
INSERT INTO `mes_equipment` VALUES ('08dab324-2b7c-4c57-836d-e3db2073193d', '0', '点焊1号线', 0, 1, '点焊1号线', '2022-10-21 13:21:56', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-21 13:25:18', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 15, 0, NULL, NULL, NULL, NULL, 'DH1', 1, NULL, 1, 30, 96, 61);
INSERT INTO `mes_equipment` VALUES ('08dab324-9e2b-47bc-80d4-5a9cdfc728cd', '0', '切割1号线', 0, 1, '', '2022-10-21 13:25:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 6, 0, NULL, NULL, NULL, NULL, 'QG1', 1, NULL, 1, 30, 98, 126);
INSERT INTO `mes_equipment` VALUES ('08dab324-d447-4b9e-8933-a50e21483734', '0', '冲压1号线', 0, 1, '冲压1号线', '2022-10-21 13:26:39', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 10, 0, NULL, NULL, NULL, NULL, 'CY1', 1, NULL, 1, 30, 98, 32);
INSERT INTO `mes_equipment` VALUES ('08dab326-31e6-45f1-80d1-3ddc20eb7577', '0', '模具', 0, 1, '', '2022-10-21 13:36:25', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 7, 2, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 0, 0, 0);
-- ----------------------------
-- Table structure for mes_equipmentstatusdate
-- ----------------------------
DROP TABLE IF EXISTS `mes_equipmentstatusdate`;
CREATE TABLE `mes_equipmentstatusdate`  (
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备的ID，（无主键）',
  `F_OfflineTimes` int NULL DEFAULT NULL COMMENT '离线累计秒数',
  `F_RunTimes` int NULL DEFAULT NULL COMMENT '运行累计秒数',
  `F_WarningTimes` int NULL DEFAULT NULL COMMENT '报警累计秒数',
  `F_ErrorTimes` int NULL DEFAULT NULL COMMENT '故障累计秒数',
  `F_OffTimes` int NULL DEFAULT NULL COMMENT '停机累计秒数',
  `F_Date` date NULL DEFAULT NULL COMMENT '日期',
  `F_CurrQty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '实时下料数',
  `F_LastUpdateTime` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `F_MsgSended` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否已通知'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_equipmentstatusdate
-- ----------------------------

-- ----------------------------
-- Table structure for mes_equipmentstatusdatebyhour
-- ----------------------------
DROP TABLE IF EXISTS `mes_equipmentstatusdatebyhour`;
CREATE TABLE `mes_equipmentstatusdatebyhour`  (
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备的ID，（无主键）',
  `F_OfflineTimes` int NULL DEFAULT NULL COMMENT '离线累计秒数',
  `F_RunTimes` int NULL DEFAULT NULL COMMENT '运行累计秒数',
  `F_WarningTimes` int NULL DEFAULT NULL COMMENT '报警累计秒数',
  `F_ErrorTimes` int NULL DEFAULT NULL COMMENT '故障累计秒数',
  `F_OffTimes` int NULL DEFAULT NULL COMMENT '停机累计秒数',
  `F_DateHour` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日期小时',
  `F_Date` date NULL DEFAULT NULL COMMENT '日期'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_equipmentstatusdatebyhour
-- ----------------------------

-- ----------------------------
-- Table structure for mes_equipmentstatuslog
-- ----------------------------
DROP TABLE IF EXISTS `mes_equipmentstatuslog`;
CREATE TABLE `mes_equipmentstatuslog`  (
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备的ID，（无主键）',
  `F_PLCSTATUS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态',
  `F_DATE` datetime NULL DEFAULT NULL COMMENT '日期'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_equipmentstatuslog
-- ----------------------------

-- ----------------------------
-- Table structure for mes_instorage
-- ----------------------------
DROP TABLE IF EXISTS `mes_instorage`;
CREATE TABLE `mes_instorage`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_InStorageCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '入库单编号',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `F_Num` double NOT NULL COMMENT '数量',
  `F_DoneNum` double NOT NULL COMMENT '完成数量',
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_InStorageState` int NOT NULL COMMENT '入库单状态',
  `F_BadNum` double NULL DEFAULT NULL COMMENT '不良数量',
  `F_BatchJson` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '批号列表',
  `F_PlanTime` datetime NULL DEFAULT NULL COMMENT '计划时间',
  `F_CarNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车牌',
  `F_IsUserEdit` tinyint NULL DEFAULT NULL COMMENT '是否修改',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_instorage
-- ----------------------------

-- ----------------------------
-- Table structure for mes_instorageinfo
-- ----------------------------
DROP TABLE IF EXISTS `mes_instorageinfo`;
CREATE TABLE `mes_instorageinfo`  (
  `F_Id` bigint NOT NULL COMMENT 'id',
  `F_TransferBoxCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转箱编号',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_MaterialBatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号批次',
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `F_Num` double NOT NULL COMMENT '数量',
  `F_InStorageId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入库单id',
  `F_LocationCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `F_BandingUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绑定人id',
  `F_BandingUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绑定人',
  `F_BandingTime` datetime NULL DEFAULT NULL COMMENT '绑定时间',
  `F_OriginalBatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原始批次',
  `F_IsTemp` tinyint NULL DEFAULT NULL COMMENT '临时标识绑定中',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_instorageinfo
-- ----------------------------

-- ----------------------------
-- Table structure for mes_laserlinedata
-- ----------------------------
DROP TABLE IF EXISTS `mes_laserlinedata`;
CREATE TABLE `mes_laserlinedata`  (
  `F_Id` bigint NOT NULL COMMENT '主键-自增',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备ID',
  `F_AddTime` datetime NULL DEFAULT NULL COMMENT '时间',
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_PrgName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_RunTime` int NULL DEFAULT NULL,
  `F_ClassPiece` int NULL DEFAULT NULL COMMENT '切割序号',
  `F_StationNo` int NULL DEFAULT NULL COMMENT '转台号',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_laserlinedata
-- ----------------------------

-- ----------------------------
-- Table structure for mes_location
-- ----------------------------
DROP TABLE IF EXISTS `mes_location`;
CREATE TABLE `mes_location`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_AreaId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '库区id',
  `F_AreaCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '库区编号',
  `F_LocationCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '库位编号',
  `F_SortCode` int NOT NULL COMMENT '顺序',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LocationState` tinyint NOT NULL,
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料编号',
  `F_MaterialName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '物料名称',
  `F_LocationType` int NOT NULL COMMENT '库位类型(0正常，1临时)',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_location
-- ----------------------------

-- ----------------------------
-- Table structure for mes_locationmaterialbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_locationmaterialbanding`;
CREATE TABLE `mes_locationmaterialbanding`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_LocationId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '库位id',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料编号',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料名称',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_locationmaterialbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_material
-- ----------------------------
DROP TABLE IF EXISTS `mes_material`;
CREATE TABLE `mes_material`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号编号',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号名称',
  `F_MaterialDescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialSize` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号规格',
  `F_MaterialBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号材质',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_MaterialPic` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片路径',
  `F_Customer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户',
  `F_CustomerProNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户品号',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_CpkStData` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '零件cpk标准Json字符串',
  `F_ModelRefer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参考模型',
  `F_NeedCheckout` tinyint NULL DEFAULT NULL COMMENT '是否需要检验',
  `F_WarmNum` int NULL DEFAULT NULL COMMENT '最小预警值',
  `F_ContainerNum` int NULL DEFAULT NULL COMMENT '容器值',
  `F_CheckoutDescriptionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检验说明id',
  `F_ReceiveNum` int NOT NULL COMMENT '领料倍数限制',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_material
-- ----------------------------

-- ----------------------------
-- Table structure for mes_materialeqpbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_materialeqpbanding`;
CREATE TABLE `mes_materialeqpbanding`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号主键-1',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备主键-n',
  `F_EqpUse` int NULL DEFAULT NULL COMMENT '设备用途',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_materialeqpbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_needcheck
-- ----------------------------
DROP TABLE IF EXISTS `mes_needcheck`;
CREATE TABLE `mes_needcheck`  (
  `F_Id` bigint NOT NULL COMMENT '主键',
  `F_IsCheck` tinyint NOT NULL COMMENT '检验标识',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CheckType` int NOT NULL COMMENT '检验类型',
  `F_TransferBoxCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转箱编号',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号名称',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_MaterialBatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号批次',
  `F_LocationCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库位号',
  `F_EqpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备名称',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备Id',
  `F_Num` double NULL DEFAULT NULL COMMENT '检验数量',
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '质检信息',
  `F_IsTwoCheck` tinyint NULL DEFAULT NULL COMMENT '二次检验标识',
  `F_IsNeedTwoCheck` tinyint NULL DEFAULT NULL COMMENT '是否二次检验',
  `F_FinishTime` datetime NULL DEFAULT NULL COMMENT '检验完成时间',
  `F_TwoFinishTime` datetime NULL DEFAULT NULL COMMENT '二次检验完成时间',
  `F_SourceId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '来源id',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_needcheck
-- ----------------------------

-- ----------------------------
-- Table structure for mes_order
-- ----------------------------
DROP TABLE IF EXISTS `mes_order`;
CREATE TABLE `mes_order`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_OrderCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单编号',
  `F_Customer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '客户',
  `F_PlanStartTime` datetime NOT NULL COMMENT '计划开始时间',
  `F_PlanEndTime` datetime NOT NULL COMMENT '计划结束时间',
  `F_DayNum` int NOT NULL COMMENT '天数',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_IsFinish` tinyint NOT NULL COMMENT '完成状态',
  `F_PredictOverTime` datetime NULL DEFAULT NULL COMMENT '预期完成时间',
  `F_ActualOverTime` datetime NULL DEFAULT NULL COMMENT '实际完成时间',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_order
-- ----------------------------

-- ----------------------------
-- Table structure for mes_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `mes_orderdetail`;
CREATE TABLE `mes_orderdetail`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_OrderId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单Id',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_NeedNum` double NOT NULL COMMENT '需求数量',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for mes_outputinfo
-- ----------------------------
DROP TABLE IF EXISTS `mes_outputinfo`;
CREATE TABLE `mes_outputinfo`  (
  `F_Id` bigint NOT NULL COMMENT 'id',
  `F_TransferBoxCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转箱编号',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_MaterialBatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号批次',
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `F_Num` double NOT NULL COMMENT '数量',
  `F_ProcessId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序Id',
  `F_ProcessName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序名称',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备Id',
  `F_EqpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备名称',
  `F_WorkOrderId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工单Id',
  `F_WorkOrderCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工单编号',
  `F_WorkOrderRunSort` int NULL DEFAULT NULL COMMENT '执行顺序',
  `F_LocationCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_WorkOrderDetailId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工单明细Id',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `F_BandingUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绑定人id',
  `F_BandingUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绑定人',
  `F_BandingTime` datetime NULL DEFAULT NULL COMMENT '绑定时间',
  `F_IsTemp` tinyint NULL DEFAULT NULL COMMENT '临时标识绑定中',
  `F_GoOnProduce` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '继续生产',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_outputinfo
-- ----------------------------

-- ----------------------------
-- Table structure for mes_outstorage
-- ----------------------------
DROP TABLE IF EXISTS `mes_outstorage`;
CREATE TABLE `mes_outstorage`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_OutStorageCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '出库单编号',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `F_Num` double NOT NULL COMMENT '数量',
  `F_DoneNum` double NOT NULL COMMENT '完成数量',
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_OutStorageState` int NOT NULL COMMENT '出库单状态',
  `F_PlanTime` datetime NULL DEFAULT NULL COMMENT '计划时间',
  `F_CarNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车牌',
  `F_OrderId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单Id',
  `F_IsUserEdit` tinyint NULL DEFAULT NULL COMMENT '是否修改',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_outstorage
-- ----------------------------

-- ----------------------------
-- Table structure for mes_outstorageinfo
-- ----------------------------
DROP TABLE IF EXISTS `mes_outstorageinfo`;
CREATE TABLE `mes_outstorageinfo`  (
  `F_Id` bigint NOT NULL COMMENT 'id',
  `F_TransferBoxCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转箱编号',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_MaterialBatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号批次',
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `F_Num` double NOT NULL COMMENT '数量',
  `F_OutStorageId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出库单id',
  `F_LocationCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `F_BandingUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绑定人id',
  `F_BandingUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绑定人',
  `F_BandingTime` datetime NULL DEFAULT NULL COMMENT '绑定时间',
  `F_TargetTransferCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '装箱容器',
  `F_IsTemp` tinyint NULL DEFAULT NULL COMMENT '临时标识绑定中',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_outstorageinfo
-- ----------------------------

-- ----------------------------
-- Table structure for mes_processeqpbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_processeqpbanding`;
CREATE TABLE `mes_processeqpbanding`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_ProcessId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工序主键-1',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备主键-1',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_processeqpbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_processflow
-- ----------------------------
DROP TABLE IF EXISTS `mes_processflow`;
CREATE TABLE `mes_processflow`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工序id',
  `F_ProcessFlowName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工序名称',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '工序备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_processflow
-- ----------------------------

-- ----------------------------
-- Table structure for mes_readytransferbox
-- ----------------------------
DROP TABLE IF EXISTS `mes_readytransferbox`;
CREATE TABLE `mes_readytransferbox`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_TransferBoxCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流转箱编号',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备Id',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`F_Id`) USING BTREE,
  UNIQUE INDEX `mes_ReadyTransferBox_key1`(`F_TransferBoxCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_readytransferbox
-- ----------------------------

-- ----------------------------
-- Table structure for mes_returnmaterial
-- ----------------------------
DROP TABLE IF EXISTS `mes_returnmaterial`;
CREATE TABLE `mes_returnmaterial`  (
  `F_Id` bigint NOT NULL COMMENT 'id',
  `F_TransferBoxCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转箱编号',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_MaterialBatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号批次',
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `F_Num` double NOT NULL COMMENT '数量',
  `F_ProcessId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序Id',
  `F_ProcessName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序名称',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备Id',
  `F_EqpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备名称',
  `F_WorkOrderId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工单Id',
  `F_WorkOrderCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工单编号',
  `F_WorkOrderRunSort` int NULL DEFAULT NULL COMMENT '执行顺序',
  `F_LocationCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_WorkOrderDetailId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工单明细Id',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_returnmaterial
-- ----------------------------

-- ----------------------------
-- Table structure for mes_scapimage
-- ----------------------------
DROP TABLE IF EXISTS `mes_scapimage`;
CREATE TABLE `mes_scapimage`  (
  `F_Id` bigint NOT NULL COMMENT 'id',
  `F_ScapId` bigint NOT NULL COMMENT '可疑id',
  `F_FilePath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '上传路径',
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '缺陷信息',
  `F_DescriptionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缺陷id',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_scapimage
-- ----------------------------

-- ----------------------------
-- Table structure for mes_scapmaterial
-- ----------------------------
DROP TABLE IF EXISTS `mes_scapmaterial`;
CREATE TABLE `mes_scapmaterial`  (
  `F_Id` bigint NOT NULL COMMENT 'id',
  `F_BatchCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '条码编号',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_MaterialBatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号批次',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `F_CheckId` bigint NOT NULL COMMENT '检验id',
  `F_CheckType` int NOT NULL COMMENT '检验类型',
  `F_IsCheck` tinyint NOT NULL COMMENT '检验完成',
  `F_IsTemp` tinyint NOT NULL COMMENT '临时表示还在常规质检',
  `F_Num` double NOT NULL COMMENT '可疑数量',
  `F_ScapNum` double NOT NULL COMMENT '报废数量',
  `F_ReturnNum` double NOT NULL COMMENT '退回数量',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_scapmaterial
-- ----------------------------

-- ----------------------------
-- Table structure for mes_scapmaterialreturn
-- ----------------------------
DROP TABLE IF EXISTS `mes_scapmaterialreturn`;
CREATE TABLE `mes_scapmaterialreturn`  (
  `F_Id` bigint NOT NULL COMMENT 'id',
  `F_BatchCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '条码编号',
  `F_ScapMaterialId` bigint NOT NULL COMMENT '可疑物料Id',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_MaterialBatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号批次',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `F_Num` double NOT NULL COMMENT '退回数量',
  `F_TransferBoxCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '退回流转箱编号',
  `F_BackMaterialBatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '退回料号批次',
  `F_IsProduce` tinyint NOT NULL COMMENT '是否生产',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_scapmaterialreturn
-- ----------------------------

-- ----------------------------
-- Table structure for mes_storage
-- ----------------------------
DROP TABLE IF EXISTS `mes_storage`;
CREATE TABLE `mes_storage`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_TransferBoxCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转箱编号',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_MaterialBatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号批次',
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `F_Num` double NOT NULL COMMENT '数量',
  `F_LocationCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_IsCheckout` tinyint NOT NULL,
  `F_BatchId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '批次Id',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_storage
-- ----------------------------

-- ----------------------------
-- Table structure for mes_storagechangeinfo
-- ----------------------------
DROP TABLE IF EXISTS `mes_storagechangeinfo`;
CREATE TABLE `mes_storagechangeinfo`  (
  `F_Id` bigint NOT NULL COMMENT 'id',
  `F_TransferBoxCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转箱编号',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_MaterialCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号描述',
  `F_MaterialUnit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号单位',
  `F_MaterialType` int NOT NULL COMMENT '料号分类',
  `F_MaterialBatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号批次',
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `F_Num` double NOT NULL COMMENT '转移数量',
  `F_LocationCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库位编号',
  `F_NewLocationCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '新库位编号',
  `F_NewTransferBoxCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '新流转箱编号',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `F_StorageId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ChangeType` int NULL DEFAULT NULL COMMENT '变动类型',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_storagechangeinfo
-- ----------------------------

-- ----------------------------
-- Table structure for mes_transferbox
-- ----------------------------
DROP TABLE IF EXISTS `mes_transferbox`;
CREATE TABLE `mes_transferbox`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_TransferCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转箱编号',
  `F_TransferType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转箱类型',
  `F_TransferMaxNum` double NOT NULL COMMENT '流转箱最大数',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_TransferState` int NULL DEFAULT NULL COMMENT '流转箱状态',
  `F_LocationCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库位编号',
  `F_IsTemp` tinyint NULL DEFAULT NULL COMMENT '是否一次性',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_transferbox
-- ----------------------------

-- ----------------------------
-- Table structure for mes_transferboxbatch
-- ----------------------------
DROP TABLE IF EXISTS `mes_transferboxbatch`;
CREATE TABLE `mes_transferboxbatch`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_BatchName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '容器条码名称',
  `F_MaxNum` int NOT NULL COMMENT '容器最大数',
  `F_BatchCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '编号前缀',
  `F_BatchNum` bigint NULL DEFAULT NULL COMMENT '当前编号',
  `F_IsCheck` tinyint NULL DEFAULT NULL COMMENT '是否质检',
  PRIMARY KEY (`F_Id`) USING BTREE,
  UNIQUE INDEX `mes_TranferBoxBatch_key1`(`F_BatchCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_transferboxbatch
-- ----------------------------

-- ----------------------------
-- Table structure for mes_transfertypematerialbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_transfertypematerialbanding`;
CREATE TABLE `mes_transfertypematerialbanding`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_TransferType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转箱类型',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料Id',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_transfertypematerialbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_workdetaileqpbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_workdetaileqpbanding`;
CREATE TABLE `mes_workdetaileqpbanding`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_WorkOrderDetailId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工单明细Id',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备Id',
  `F_EqpType` int NOT NULL COMMENT '设备类型',
  `F_EqpUse` int NOT NULL COMMENT '设备用途',
  `F_MouldNum` int NOT NULL COMMENT '模块使用数',
  `F_IsMaster` tinyint NOT NULL COMMENT '是否主设备',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_workdetaileqpbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_workdetailprocessbanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_workdetailprocessbanding`;
CREATE TABLE `mes_workdetailprocessbanding`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_WorkOrderDetailId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工单明细Id',
  `F_ProcessId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工序Id',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_workdetailprocessbanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_workdetailtimebanding
-- ----------------------------
DROP TABLE IF EXISTS `mes_workdetailtimebanding`;
CREATE TABLE `mes_workdetailtimebanding`  (
  `F_Id` bigint NOT NULL COMMENT 'id',
  `F_WorkOrderDetailId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '明细id',
  `F_EqpWorkTimeId` bigint NOT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_workdetailtimebanding
-- ----------------------------

-- ----------------------------
-- Table structure for mes_workorder
-- ----------------------------
DROP TABLE IF EXISTS `mes_workorder`;
CREATE TABLE `mes_workorder`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_WorkOrderCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工单编号',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_PlanNum` int NOT NULL COMMENT '计划数量',
  `F_DoneNum` int NOT NULL COMMENT '完成数量',
  `F_BadNum` int NOT NULL COMMENT '不良数量',
  `F_WorkOrderState` int NOT NULL COMMENT '工单状态',
  `F_PlanStartTime` datetime NULL DEFAULT NULL COMMENT '计划开始时间',
  `F_PlanEndTime` datetime NULL DEFAULT NULL COMMENT '计划结束时间',
  `F_RealStartTime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `F_RealEndTime` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_SplitType` int NOT NULL,
  `F_WorkPlanId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计划ID',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_workorder
-- ----------------------------

-- ----------------------------
-- Table structure for mes_workorderdetail
-- ----------------------------
DROP TABLE IF EXISTS `mes_workorderdetail`;
CREATE TABLE `mes_workorderdetail`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_WorkOrderId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工单编号',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '料号Id',
  `F_PlanNum` double NOT NULL COMMENT '计划数量',
  `F_DoneNum` double NOT NULL COMMENT '完成数量',
  `F_BadNum` double NOT NULL COMMENT '不良数量',
  `F_WorkOrderState` int NOT NULL COMMENT '工单状态',
  `F_PlanStartTime` datetime NULL DEFAULT NULL COMMENT '计划开始时间',
  `F_PlanEndTime` datetime NULL DEFAULT NULL COMMENT '计划结束时间',
  `F_RealStartTime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `F_RealEndTime` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_RunSort` int NULL DEFAULT NULL COMMENT '执行顺序',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_workorderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for mes_workorderdetaildata
-- ----------------------------
DROP TABLE IF EXISTS `mes_workorderdetaildata`;
CREATE TABLE `mes_workorderdetaildata`  (
  `F_WorkOrderDetailId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '子工单ID',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备ID',
  `F_DataTable` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据采集表名（HotlineData,WeldlineData,LaserlineData）',
  `F_DataTableId` bigint NULL DEFAULT NULL COMMENT '数据采集表记录ID',
  `F_MouldNum` int NULL DEFAULT NULL COMMENT '每次产出数'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_workorderdetaildata
-- ----------------------------

-- ----------------------------
-- Table structure for mes_workplan
-- ----------------------------
DROP TABLE IF EXISTS `mes_workplan`;
CREATE TABLE `mes_workplan`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '计划说明',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Date` date NULL DEFAULT NULL COMMENT '计划日期',
  `F_ClassNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '班别（A白班，B夜班）',
  `F_EqpId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备Id',
  `F_EqpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备名称',
  `F_MaterialId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '料号Id',
  `F_PlanNum` double NOT NULL COMMENT '计划数量',
  `F_DoneNum` double NOT NULL COMMENT '完成数量',
  `F_WorkPlanType` int NOT NULL COMMENT '计划类型',
  `F_IsUserEdit` tinyint NULL DEFAULT NULL COMMENT '是否修改',
  `F_ProcessId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mes_workplan
-- ----------------------------

-- ----------------------------
-- Table structure for mob_dingtalkconfig
-- ----------------------------
DROP TABLE IF EXISTS `mob_dingtalkconfig`;
CREATE TABLE `mob_dingtalkconfig`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_DingType` int NOT NULL,
  `F_IsWebLogin` tinyint NOT NULL,
  `F_AppName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_RedirectUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_AppId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_AppSecret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_AgentId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_AppKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_IsDingInfo` tinyint NOT NULL,
  `F_Url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_IsBoardLogin` tinyint NOT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mob_dingtalkconfig
-- ----------------------------
INSERT INTO `mob_dingtalkconfig` VALUES ('08d94c02-7cb6-4275-8b5a-b344e494df63', 1, 0, '看板Web', 'http://127.0.0.1:8082/BoardLogin/DingLogin', 'xxxxxxxx', 'xxxxxxxxxx', '', 0, 1, '', '2021-07-21 12:46:22', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, '2022-10-19 10:08:29', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '', 0, 'http://127.0.0.1:8082/', 1);
INSERT INTO `mob_dingtalkconfig` VALUES ('0a26a181-c0bf-414b-8e54-f688796858b1', 0, 0, 'MES小程序', '', '', 'RUCXv_EziNLtYo76sBJFoNwj69L1shAOfPbfrABDafgnepo6jQHT7af6gwT4hpK6', '656255403', 0, 1, '', '2020-11-21 10:43:11', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, '2022-10-24 13:00:14', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 'dingbxlfyt9shwpqql7a', 1, '', 0);
INSERT INTO `mob_dingtalkconfig` VALUES ('5353df01-dc34-4dc2-bd4b-6cf155ef00e4', 1, 1, 'MES系统PC端', 'http://127.0.0.1:8082/Login/DingLogin', 'xxxxxxxxx', 'xxxxxxxxx', '', 0, 1, '', '2020-11-21 10:35:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, '2022-10-19 10:09:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '', 0, 'http://127.0.0.1:8082/', 0);
INSERT INTO `mob_dingtalkconfig` VALUES ('fb494f74-e9f5-4ce6-8dac-2a922cf5c8a8', 2, 0, 'Mes系统移动端', '', '', 'xxxxxxx', 'xxxxx', 0, 1, '', '2020-11-23 09:06:28', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, '2022-10-19 10:08:50', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 'xxxxxxxx', 1, 'http://127.0.0.1:8082/', 0);

-- ----------------------------
-- Table structure for mob_dinguser
-- ----------------------------
DROP TABLE IF EXISTS `mob_dinguser`;
CREATE TABLE `mob_dinguser`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_SysUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统用户Id',
  `F_UserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '员工唯一标识ID',
  `F_UserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '成员名称',
  `F_Active` tinyint NULL DEFAULT NULL COMMENT '是否已经激活',
  `F_OrderInDepts` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '在对应的部门中的排序，Map结构的json字符串，key是部门的Id，value是人员在这个部门的排序值',
  `F_IsAdmin` tinyint NULL DEFAULT NULL COMMENT '是否为企业的管理员',
  `F_IsBoss` tinyint NULL DEFAULT NULL COMMENT '是否为企业的老板',
  `F_UnionId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '在当前isv全局范围内唯一标识一个用户的身份,用户无法修改',
  `F_IsLeaderInDepts` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '在对应的部门中是否为主管：Map结构的json字符串，key是部门的Id，value是人员在这个部门中是否为主管，true表示是，false表示不是',
  `F_IsLeader` tinyint NULL DEFAULT NULL COMMENT ' 是否是部门的主管',
  `F_IsHide` tinyint NULL DEFAULT NULL COMMENT '是否号码隐藏',
  `F_DepartmentId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '成员所属部门id列表',
  `F_Position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职位信息',
  `F_Avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像url',
  `F_HiredDate` datetime NULL DEFAULT NULL COMMENT '入职时间',
  `F_JobNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '员工工号',
  `F_IsSenior` tinyint NULL DEFAULT NULL COMMENT '是否是高管',
  `F_Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `F_Mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  `F_Order` int NULL DEFAULT NULL COMMENT '部门排序',
  `F_WorkPlace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作地',
  `F_RolesId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '新增的钉钉用户在系统中的角色',
  `F_IsWork` tinyint NULL DEFAULT NULL COMMENT '是否在班',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mob_dinguser
-- ----------------------------

-- ----------------------------
-- Table structure for oms_flowinstance
-- ----------------------------
DROP TABLE IF EXISTS `oms_flowinstance`;
CREATE TABLE `oms_flowinstance`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键Id',
  `F_InstanceSchemeId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程实例模板Id',
  `F_Code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '实例编号',
  `F_CustomName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '自定义名称',
  `F_ActivityId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当前节点ID',
  `F_ActivityType` int NULL DEFAULT NULL COMMENT '当前节点类型（0会签节点）',
  `F_ActivityName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当前节点名称',
  `F_PreviousId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前一个ID',
  `F_SchemeContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '流程模板内容',
  `F_SchemeId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程模板ID',
  `F_DbName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `F_FrmData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '表单数据',
  `F_FrmType` int NOT NULL COMMENT '表单类型',
  `F_FrmContentData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '表单字段',
  `F_FrmContentParse` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '表单参数（冗余）',
  `F_FrmId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表单ID',
  `F_SchemeType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程类型',
  `F_FlowLevel` int NOT NULL COMMENT '等级',
  `F_Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '实例备注',
  `F_IsFinish` int NOT NULL COMMENT '是否完成',
  `F_MakerList` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行人',
  `F_OrganizeId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属部门',
  `F_EnabledMark` tinyint NULL DEFAULT NULL COMMENT '有效',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户主键',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  `F_FrmContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '表单元素json',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工作流流程实例表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_flowinstance
-- ----------------------------

-- ----------------------------
-- Table structure for oms_flowinstancehis
-- ----------------------------
DROP TABLE IF EXISTS `oms_flowinstancehis`;
CREATE TABLE `oms_flowinstancehis`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键Id',
  `F_InstanceId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例Id',
  `F_FromNodeId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开始节点Id',
  `F_FromNodeType` int NULL DEFAULT NULL COMMENT '开始节点类型',
  `F_FromNodeName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开始节点名称',
  `F_ToNodeId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结束节点Id',
  `F_ToNodeType` int NULL DEFAULT NULL COMMENT '结束节点类型',
  `F_ToNodeName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结束节点名称',
  `F_TransitionSate` tinyint NOT NULL COMMENT '转化状态',
  `F_IsFinish` tinyint NOT NULL COMMENT '是否结束',
  `F_CreatorTime` datetime NOT NULL COMMENT '转化时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人Id',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人名称',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工作流实例流转历史记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_flowinstancehis
-- ----------------------------

-- ----------------------------
-- Table structure for oms_flowinstanceinfo
-- ----------------------------
DROP TABLE IF EXISTS `oms_flowinstanceinfo`;
CREATE TABLE `oms_flowinstanceinfo`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键Id',
  `F_InstanceId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例进程Id',
  `F_Content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作内容',
  `F_CreatorTime` datetime NOT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户主键',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工作流实例操作记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_flowinstanceinfo
-- ----------------------------

-- ----------------------------
-- Table structure for oms_formtest
-- ----------------------------
DROP TABLE IF EXISTS `oms_formtest`;
CREATE TABLE `oms_formtest`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `F_UserName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请假人姓名',
  `F_RequestType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请假分类，病假，事假，公休等',
  `F_StartTime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `F_EndTime` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `F_RequestComment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请假说明',
  `F_Attachment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '附件，用于提交病假证据等',
  `F_CreatorTime` datetime NOT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户主键',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  `F_FlowInstanceId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属流程ID',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '模拟一个自定页面的表单，该数据会关联到流程实例FrmData，可用于复杂页面的设计及后期的数据分析' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_formtest
-- ----------------------------

-- ----------------------------
-- Table structure for oms_message
-- ----------------------------
DROP TABLE IF EXISTS `oms_message`;
CREATE TABLE `oms_message`  (
  `F_Id` bigint NOT NULL COMMENT '主键Id',
  `F_MessageType` int NULL DEFAULT NULL COMMENT '信息类型（通知、私信、处理）',
  `F_ToUserId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '收件人主键',
  `F_ToUserName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '收件人',
  `F_MessageInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `F_EnabledMark` tinyint NULL DEFAULT NULL COMMENT '有效',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户主键',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  `F_HrefTarget` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跳转类型',
  `F_Href` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跳转地址',
  `F_KeyValue` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '待办关联键',
  `F_ClickRead` tinyint NULL DEFAULT NULL COMMENT '点击已读',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_message
-- ----------------------------

-- ----------------------------
-- Table structure for oms_messagehis
-- ----------------------------
DROP TABLE IF EXISTS `oms_messagehis`;
CREATE TABLE `oms_messagehis`  (
  `F_Id` bigint NOT NULL COMMENT '主键Id',
  `F_MessageId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '信息Id',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户主键',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_messagehis
-- ----------------------------

-- ----------------------------
-- Table structure for oms_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `oms_uploadfile`;
CREATE TABLE `oms_uploadfile`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键Id',
  `F_FilePath` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件路径',
  `F_FileName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名称',
  `F_FileType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件类型（0 文件，1 图片）',
  `F_FileSize` int NULL DEFAULT NULL COMMENT '文件大小',
  `F_FileExtension` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件扩展名',
  `F_FileBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件所属',
  `F_Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `F_OrganizeId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属部门',
  `F_EnabledMark` tinyint NULL DEFAULT NULL COMMENT '有效',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户主键',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`F_Id`) USING BTREE,
  INDEX `IX_OMS_UPLOADFile`(`F_FileName`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_uploadfile
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dataprivilegerule
-- ----------------------------
DROP TABLE IF EXISTS `sys_dataprivilegerule`;
CREATE TABLE `sys_dataprivilegerule`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_ModuleId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ModuleCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_PrivilegeRules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_SortCode` int NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE,
  INDEX `XK_DataPrivilegeRule_1`(`F_ModuleId`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dataprivilegerule
-- ----------------------------

-- ----------------------------
-- Table structure for sys_filterip
-- ----------------------------
DROP TABLE IF EXISTS `sys_filterip`;
CREATE TABLE `sys_filterip`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_Type` tinyint NULL DEFAULT NULL,
  `F_StartIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_EndIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_SortCode` int NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_EndTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_filterip
-- ----------------------------

-- ----------------------------
-- Table structure for sys_flowscheme
-- ----------------------------
DROP TABLE IF EXISTS `sys_flowscheme`;
CREATE TABLE `sys_flowscheme`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键Id',
  `F_SchemeCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程编号',
  `F_SchemeName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程名称',
  `F_SchemeType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程分类',
  `F_SchemeVersion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程内容版本',
  `F_SchemeCanUser` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '流程模板使用者',
  `F_SchemeContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '流程内容',
  `F_FrmId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表单ID',
  `F_FrmType` int NOT NULL COMMENT '表单类型',
  `F_AuthorizeType` int NOT NULL COMMENT '模板权限类型：0完全公开,1指定部门/人员',
  `F_SortCode` int NULL DEFAULT NULL COMMENT '排序码',
  `F_DeleteMark` tinyint NULL DEFAULT NULL COMMENT '删除标记',
  `F_EnabledMark` tinyint NULL DEFAULT NULL COMMENT '有效',
  `F_Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户主键',
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建用户',
  `F_LastModifyTime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改用户主键',
  `F_LastModifyUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改用户',
  `F_OrganizeId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属部门',
  `F_DeleteTime` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工作流模板信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_flowscheme
-- ----------------------------

-- ----------------------------
-- Table structure for sys_form
-- ----------------------------
DROP TABLE IF EXISTS `sys_form`;
CREATE TABLE `sys_form`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '表单模板Id',
  `F_Name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表单名称',
  `F_FrmType` int NULL DEFAULT NULL COMMENT '表单类型，0：默认动态表单；1：Web自定义表单',
  `F_WebId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统页面标识，当表单类型为用Web自定义的表单时，需要标识加载哪个页面',
  `F_Fields` int NULL DEFAULT NULL COMMENT '字段个数',
  `F_ContentData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '表单中的控件属性描述',
  `F_ContentParse` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '表单控件位置模板',
  `F_Content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '表单原html模板未经处理的',
  `F_SortCode` int NULL DEFAULT NULL COMMENT '排序码',
  `F_EnabledMark` tinyint NULL DEFAULT NULL COMMENT '是否启用',
  `F_DeleteMark` tinyint NULL DEFAULT NULL COMMENT '逻辑删除标志',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `F_LastModifyTime` datetime NULL DEFAULT NULL COMMENT '最后修改时间',
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最后修改人',
  `F_DeleteTime` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除人',
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `F_OrganizeId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属组织',
  `F_DbName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据库名称',
  PRIMARY KEY (`F_Id`) USING BTREE,
  INDEX `IX_SYS_FORM`(`F_Name`) USING BTREE COMMENT '唯一'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '表单模板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_form
-- ----------------------------

-- ----------------------------
-- Table structure for sys_items
-- ----------------------------
DROP TABLE IF EXISTS `sys_items`;
CREATE TABLE `sys_items`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_ParentId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_EnCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_IsTree` tinyint NULL DEFAULT NULL,
  `F_Layers` int NULL DEFAULT NULL,
  `F_SortCode` int NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE,
  INDEX `IX_Sys_Items`(`F_EnCode`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_items
-- ----------------------------
INSERT INTO `sys_items` VALUES ('002eeaa9-c804-4c98-afd9-7ddc7c1e4c46', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_ControlJobType', '调度任务类型', 0, 2, 12, 0, 1, '', '2021-01-20 09:35:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('00F76465-DBBA-484A-B75C-E81DEE9313E6', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', 'Education', '学历', 0, 2, 8, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('08d9344e-25dc-40ab-8eeb-473d9321c7e2', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_StopConfig', '急停停机配置', 0, 2, 14, 0, 1, '', '2021-06-21 08:47:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('08d93f50-133e-4fe7-860d-4dd9cd33cfe5', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_ScapType', '可疑状态', 0, 2, 15, 0, 1, '', '2021-07-05 08:59:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('08dab327-a5c5-4ce4-8567-a45c414ab232', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_MoveEqpSetting', '流动设备设定', 0, 2, 16, 0, 1, '', '2022-10-21 13:46:49', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-21 13:46:56', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
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
INSERT INTO `sys_items` VALUES ('9a7079bd-0660-4549-9c2d-db5e8616619f', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', 'DbLogType', '系统日志', 0, 2, 16, 0, 1, NULL, '2016-07-19 17:09:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('9EB4602B-BF9A-4710-9D80-C73CE89BEC5D', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', 'OrganizeCategory', '机构分类', 0, 2, 2, 0, 1, NULL, NULL, NULL, '2020-04-28 09:07:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_items` VALUES ('a7faf382-c88c-43e1-aff3-98f261a693ea', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_TransferType', '流转箱类型', 0, 2, 8, 0, 1, '', '2020-12-14 12:39:09', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('BDD797C3-2323-4868-9A63-C8CC3437AEAA', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', '104', '性别', 0, 2, 15, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('bf06d1e0-cfde-40c9-954c-df930e26e319', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_EqpUse', '设备用途', 0, 2, 3, 0, 1, '', '2020-11-30 15:03:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-01 15:51:53', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_items` VALUES ('c2a3ec97-e4f0-46a5-addf-1ba4e40e2ab9', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_WorkOrderState', '工单状态', 0, 2, 7, 0, 1, '', '2020-12-07 13:39:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('cd6a17c3-34ca-44d3-a072-4f75a94f5960', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_EqpOwner', '财产所属', 0, 2, 4, 0, 1, '', '2020-12-01 09:37:13', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-01 15:51:58', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_items` VALUES ('d56acc3d-39f2-41a0-a900-a6866139d348', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_MaintainType', '保养周期类型', 0, 2, 2, 0, 1, '', '2020-11-30 14:50:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-12-01 15:51:48', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL);
INSERT INTO `sys_items` VALUES ('D94E4DC1-C2FD-4D19-9D5D-3886D39900CE', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', 'RoleType', '角色类型', 0, 2, 3, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('e3c2ee7c-14e8-42c9-bb0d-29fc4c42ec37', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_TransferState', '流转箱状态', 0, 2, 11, 0, 1, '', '2021-01-06 13:11:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('f948d392-2b2c-4c07-9143-13635e955ed6', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_MaterialType', '物料分类', 0, 2, 6, 0, 1, '', '2020-12-01 15:52:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('FA7537E2-1C64-4431-84BF-66158DD63269', '77070117-3F1A-41BA-BF81-B8B85BF10D5E', '101', '婚姻', 0, 2, 12, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_items` VALUES ('faff6e57-5a15-4ba7-a971-d5453e3040c2', '879dc37f-8b6e-44d5-a153-ce4bdc3e66e1', 'Mes_CheckType', '检验类型', 0, 2, 13, 0, 1, '', '2021-05-21 15:05:40', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_itemsdetail
-- ----------------------------
DROP TABLE IF EXISTS `sys_itemsdetail`;
CREATE TABLE `sys_itemsdetail`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_ItemId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ParentId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ItemCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ItemName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_SimpleSpelling` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_IsDefault` tinyint NULL DEFAULT NULL,
  `F_Layers` int NULL DEFAULT NULL,
  `F_SortCode` int NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE,
  INDEX `IX_Sys_ItemsDetail`(`F_ItemId`, `F_ItemCode`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_itemsdetail
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_Date` datetime NULL DEFAULT NULL,
  `F_Account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_NickName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_IPAddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_IPAddressName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ModuleId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ModuleName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_Result` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_KeyValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CompanyId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_ParentId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Layers` int NULL DEFAULT NULL,
  `F_EnCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_UrlAddress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_Target` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_IsMenu` tinyint NULL DEFAULT NULL,
  `F_IsExpand` tinyint NULL DEFAULT NULL,
  `F_IsFields` tinyint NULL DEFAULT NULL,
  `F_IsPublic` tinyint NULL DEFAULT NULL,
  `F_AllowEdit` tinyint NULL DEFAULT NULL,
  `F_AllowDelete` tinyint NULL DEFAULT NULL,
  `F_SortCode` int NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_IsBoard` tinyint NULL DEFAULT NULL COMMENT '是否看板',
  `F_Authorize` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE,
  INDEX `IX_Sys_Module`(`F_FullName`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_module` VALUES ('F298F868-B689-4982-8C8B-9268CBF0308D', '253646c6-ffd8-4c7f-9673-f349bbafcbe5', 2, 'Duty', '岗位管理', 'fa fa-users', '/SystemOrganize/Duty/Index', 'iframe', 1, 0, 0, 0, 0, 0, 5, 0, 1, '', NULL, NULL, '2020-06-16 08:11:54', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, NULL);
INSERT INTO `sys_module` VALUES ('f82fd629-5f3a-45d6-8681-5ec47e66a807', '462027E0-0848-41DD-BCC3-025DCAE65555', 3, 'Flowscheme', '流程设计', 'fa fa-list-alt', '/SystemManage/Flowscheme/Index', 'iframe', 1, 0, 0, 0, 0, 0, 9, 0, 1, '', '2020-07-10 08:50:52', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-03-02 09:47:26', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');
INSERT INTO `sys_module` VALUES ('ffcf9006-570e-44f5-80d4-32c213813a92', '5c4c18b1-88be-4819-ab5a-199bba8ae070', 3, 'OutputReport', '产出记录', '', '/ReportRecord/OutputReport/Index', 'iframe', 1, 0, 0, 0, 0, 0, 8, 0, 1, '', '2021-02-26 08:52:04', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2021-02-26 08:55:14', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 0, '');

-- ----------------------------
-- Table structure for sys_modulebutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_modulebutton`;
CREATE TABLE `sys_modulebutton`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_ModuleId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ParentId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Layers` int NULL DEFAULT NULL,
  `F_EnCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Location` int NULL DEFAULT NULL,
  `F_JsEvent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_UrlAddress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_Split` tinyint NULL DEFAULT NULL,
  `F_IsPublic` tinyint NULL DEFAULT NULL,
  `F_AllowEdit` tinyint NULL DEFAULT NULL,
  `F_AllowDelete` tinyint NULL DEFAULT NULL,
  `F_SortCode` int NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Authorize` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE,
  INDEX `IX_Sys_ModuleButton`(`F_ModuleId`, `F_Layers`, `F_EnCode`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_modulebutton` VALUES ('08dab58c-bd53-4793-85de-bd4bd3aa4a35', '4666f434-3178-42e5-a44f-1f34cadb3c44', '0', 1, 'EqpCallRepair', '故障报修', NULL, 1, 'EqpCallRepair', '', NULL, 0, 0, 0, 1, 0, 1, '', '2022-10-24 14:55:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-24 14:56:06', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 'EqpCallRepair');
INSERT INTO `sys_modulebutton` VALUES ('08dab58c-bd53-49c1-8a1e-ff507ece06ab', '4666f434-3178-42e5-a44f-1f34cadb3c44', '0', 1, 'EqpRepairInfo', '设备维修', NULL, 1, 'EqpRepairInfo', '', NULL, 0, 0, 0, 2, 0, 1, '', '2022-10-24 14:55:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-24 14:56:42', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 'EqpRepairInfo');
INSERT INTO `sys_modulebutton` VALUES ('08dab58c-bd53-4a2f-8a6b-1403129ee16c', '4666f434-3178-42e5-a44f-1f34cadb3c44', '0', 1, 'EqpRepairRecord', '维修记录', NULL, 1, 'EqpRepairRecord', '', NULL, 0, 0, 0, 3, 0, 1, '', '2022-10-24 14:55:30', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-24 14:57:14', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, 'EqpRepairRecord');
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
INSERT INTO `sys_modulebutton` VALUES ('85bfbb9d-24f0-4a6f-8bb8-0f87826d04fa', '152a8e93-cebb-4574-ae74-2a86595ff986', '0', 1, 'NF-add', '新增字段', NULL, 1, 'add', '/SystemManage/ModuleFields/Form', 0, 0, 0, 0, 0, 0, 1, '', '2020-05-21 14:39:20', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2020-05-21 15:38:53', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('85F5212F-E321-4124-B155-9374AA5D9C10', '64A1C550-2C61-4A8C-833D-ACD0C012260F', '0', 1, 'NF-delete', '删除菜单', NULL, 2, 'delete', '/SystemManage/Module/DeleteForm', 0, 0, 0, 0, 3, 0, 1, NULL, NULL, NULL, '2016-07-25 15:41:15', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
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
INSERT INTO `sys_modulebutton` VALUES ('9a908e26-f348-45d1-a470-15d20f798a84', 'e093b2d3-ec49-4b4d-91ec-63f57f4e3f1d', '0', 1, 'NF-details', '查看', NULL, 2, 'details', '/MaterialManage/TransferBox/Details', 0, 0, 0, 0, 3, 0, 1, NULL, '2020-12-14 12:44:38', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('9fc77888-bbca-4996-9240-a0f389819f6f', '7e4e4a48-4d51-4159-a113-2a211186f13a', '0', 1, 'NF-edit', '修改公告', NULL, 2, 'edit', '/SystemOrganize/Notice/Form', 0, 0, 0, 0, 2, 0, 1, '', NULL, NULL, '2020-06-16 08:12:21', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('9FD543DB-C5BB-4789-ACFF-C5865AFB032C', '64A1C550-2C61-4A8C-833D-ACD0C012260F', '0', 1, 'NF-add', '新增菜单', NULL, 1, 'add', '/SystemManage/Module/Form', 0, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, '2016-07-25 15:41:08', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
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
INSERT INTO `sys_modulebutton` VALUES ('D4FCAFED-7640-449E-80B7-622DDACD5012', '64A1C550-2C61-4A8C-833D-ACD0C012260F', '0', 1, 'NF-details', '查看菜单', NULL, 2, 'details', '/SystemManage/Module/Details', 0, 0, 0, 0, 4, 0, 1, NULL, NULL, NULL, '2020-04-27 17:37:29', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
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
INSERT INTO `sys_modulebutton` VALUES ('E29FCBA7-F848-4A8B-BC41-A3C668A9005D', '64A1C550-2C61-4A8C-833D-ACD0C012260F', '0', 1, 'NF-edit', '修改菜单', NULL, 2, 'edit', '/SystemManage/Module/Form', 0, 0, 0, 0, 2, 0, 1, NULL, NULL, NULL, '2016-07-25 15:41:02', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
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
INSERT INTO `sys_modulebutton` VALUES ('FD3D073C-4F88-467A-AE3B-CDD060952CE6', '64A1C550-2C61-4A8C-833D-ACD0C012260F', '0', 1, 'NF-modulebutton', '按钮管理', NULL, 2, 'modulebutton', '/SystemManage/ModuleButton/Index', 0, 0, 0, 0, 5, 0, 1, NULL, NULL, NULL, '2020-04-07 14:34:09', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);
INSERT INTO `sys_modulebutton` VALUES ('ffffe7f8-900c-413a-9970-bee7d6599cce', '91A6CFAD-B2F9-4294-BDAE-76DECF412C6C', '0', 1, 'NF-edit', '修改角色', NULL, 2, 'edit', '/SystemOrganize/Role/Form', 0, 0, 0, 0, 2, 0, 1, '', NULL, NULL, '2020-06-16 08:13:35', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_modulefields
-- ----------------------------
DROP TABLE IF EXISTS `sys_modulefields`;
CREATE TABLE `sys_modulefields`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_ModuleId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_EnCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_IsPublic` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE,
  INDEX `IX_Sys_ModuleFields`(`F_ModuleId`, `F_EnCode`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_Title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_CreatorUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`F_Id`) USING BTREE,
  INDEX `IX_Sys_Notice`(`F_Title`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_openjob
-- ----------------------------
DROP TABLE IF EXISTS `sys_openjob`;
CREATE TABLE `sys_openjob`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_FileName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_JobName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_JobGroup` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_StarRunTime` datetime NULL DEFAULT NULL,
  `F_EndRunTime` datetime NULL DEFAULT NULL,
  `F_CronExpress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastRunTime` datetime NULL DEFAULT NULL COMMENT '最后一次执行时间',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_JobId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务Id',
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '任务信息',
  `F_CreatorTime` datetime NULL DEFAULT NULL COMMENT '执行时间',
  `F_EnabledMark` tinyint NOT NULL COMMENT '执行状态',
  `F_JobName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_openjoblog
-- ----------------------------

-- ----------------------------
-- Table structure for sys_organize
-- ----------------------------
DROP TABLE IF EXISTS `sys_organize`;
CREATE TABLE `sys_organize`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_ParentId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Layers` int NULL DEFAULT NULL,
  `F_EnCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ShortName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_CategoryId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ManagerId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_TelePhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_MobilePhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_WeChat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Fax` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_AreaId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_AllowEdit` tinyint NULL DEFAULT NULL,
  `F_AllowDelete` tinyint NULL DEFAULT NULL,
  `F_SortCode` int NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`F_Id`) USING BTREE,
  INDEX `IX_Sys_Organize`(`F_EnCode`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_organize
-- ----------------------------
INSERT INTO `sys_organize` VALUES ('5AB270C0-5D33-4203-A54F-4552699FDA3C', '0', 1, 'Company', '水之云', NULL, 'Company', '', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, 0, 1, 0, 1, '', '2016-06-10 00:00:00', NULL, '2021-03-30 14:41:26', 'b05fb485-c0ea-4f1b-9c3c-dcf43566e162', NULL, NULL);

-- ----------------------------
-- Table structure for sys_printtemplate
-- ----------------------------
DROP TABLE IF EXISTS `sys_printtemplate`;
CREATE TABLE `sys_printtemplate`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_PrintTemplateName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模板名称',
  `F_PrintTemplatePath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模板地址',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_PrintTemplateDescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模板描述',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_PrintTemplatePath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模板地址',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ParentId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '父级id',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_printtemplatehis
-- ----------------------------

-- ----------------------------
-- Table structure for sys_quickmodule
-- ----------------------------
DROP TABLE IF EXISTS `sys_quickmodule`;
CREATE TABLE `sys_quickmodule`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_ModuleId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE,
  INDEX `IX_Sys_QuickModule`(`F_ModuleId`, `F_CreatorUserId`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_quickmodule
-- ----------------------------

-- ----------------------------
-- Table structure for sys_reporttemplate
-- ----------------------------
DROP TABLE IF EXISTS `sys_reporttemplate`;
CREATE TABLE `sys_reporttemplate`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_PrintTemplateName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模板名称',
  `F_PrintTemplatePath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模板地址',
  `F_DeleteMark` tinyint NOT NULL,
  `F_EnabledMark` tinyint NOT NULL,
  `F_Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_PrintTemplateType` int NOT NULL COMMENT '模板类型 0json 1xlsx',
  `F_PrintTemplateJson` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '模板内容',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_reporttemplate
-- ----------------------------

-- ----------------------------
-- Table structure for sys_reporttemplatehis
-- ----------------------------
DROP TABLE IF EXISTS `sys_reporttemplatehis`;
CREATE TABLE `sys_reporttemplatehis`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_ParentId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '父级id',
  `F_PrintTemplatePath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模板地址',
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_PrintTemplateType` int NOT NULL COMMENT '模板类型 0json 1xlsx',
  `F_PrintTemplateJson` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '模板内容',
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_reporttemplatehis
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_OrganizeId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Category` int NULL DEFAULT NULL,
  `F_EnCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_AllowEdit` tinyint NULL DEFAULT NULL,
  `F_AllowDelete` tinyint NULL DEFAULT NULL,
  `F_SortCode` int NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`F_Id`) USING BTREE,
  INDEX `IX_Sys_Role`(`F_EnCode`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_roleauthorize
-- ----------------------------
DROP TABLE IF EXISTS `sys_roleauthorize`;
CREATE TABLE `sys_roleauthorize`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_ItemType` int NULL DEFAULT NULL,
  `F_ItemId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ObjectType` int NULL DEFAULT NULL,
  `F_ObjectId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_SortCode` int NULL DEFAULT NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_roleauthorize
-- ----------------------------

-- ----------------------------
-- Table structure for sys_serverstate
-- ----------------------------
DROP TABLE IF EXISTS `sys_serverstate`;
CREATE TABLE `sys_serverstate`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_WebSite` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ARM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_CPU` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_IIS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Date` date NULL DEFAULT NULL,
  `F_Cout` int NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE,
  INDEX `IX_Sys_ServerState`(`F_WebSite`, `F_Date`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_serverstate
-- ----------------------------

-- ----------------------------
-- Table structure for sys_systemset
-- ----------------------------
DROP TABLE IF EXISTS `sys_systemset`;
CREATE TABLE `sys_systemset`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_Logo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_LogoCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ProjectName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_CompanyName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_AdminAccount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_AdminPassword` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_MobilePhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_PrincipalMan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_EndTime` datetime NULL DEFAULT NULL,
  `F_DbString` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_DBProvider` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_HostUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_systemset
-- ----------------------------
INSERT INTO `sys_systemset` VALUES ('d69fd66a-6a77-4011-8a25-53a79bdf5001', '/icon/favicon.ico', 'EasyMES', 'MES信息系统', '水之云', 'admin', '13579', 0, 1, '', '2020-06-12 16:30:00', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '2022-10-19 09:56:51', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', NULL, NULL, '13600000000', 'xxxx', '2032-06-26 00:00:00', 'Data Source = localhost;Initial Catalog = szprslmes;User ID=sa;Password=Hgame3569@;MultipleActiveResultSets=true;', 'System.Data.SqlClient', 'localhost');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_Account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_RealName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_NickName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_HeadIcon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Gender` tinyint NULL DEFAULT NULL,
  `F_Birthday` datetime NULL DEFAULT NULL,
  `F_MobilePhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_WeChat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ManagerId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_SecurityLevel` int NULL DEFAULT NULL,
  `F_Signature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_OrganizeId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DepartmentId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_RoleId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_DutyId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_IsAdmin` tinyint NULL DEFAULT NULL,
  `F_IsBoss` tinyint NULL DEFAULT NULL,
  `F_IsLeaderInDepts` tinyint NULL DEFAULT NULL,
  `F_IsSenior` tinyint NULL DEFAULT NULL,
  `F_SortCode` int NULL DEFAULT NULL,
  `F_DeleteMark` tinyint NULL DEFAULT NULL,
  `F_EnabledMark` tinyint NULL DEFAULT NULL,
  `F_Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CreatorTime` datetime NULL DEFAULT NULL,
  `F_CreatorUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LastModifyTime` datetime NULL DEFAULT NULL,
  `F_LastModifyUserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DeleteTime` datetime NULL DEFAULT NULL,
  `F_DeleteUserId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_DingTalkOpenId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DingTalkNick` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_DingTalkUnionId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_WxOpenId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_WxNickName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_HeadImgUrl` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_IsPlanMan` tinyint NOT NULL COMMENT '调度人员',
  `F_WebSocketPort` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '打印端口',
  PRIMARY KEY (`F_Id`) USING BTREE,
  INDEX `IX_Sys_User`(`F_Account`) USING BTREE COMMENT '唯一键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', 'admin', '超级管理员', '超级管理员', NULL, 1, '2020-03-28 00:00:00', '13600000001', '3333', NULL, NULL, NULL, NULL, 'd69fd66a-6a77-4011-8a25-53a79bdf5001', '5AB270C0-5D33-4203-A54F-4552699FDA3C', NULL, NULL, 1, 0, 0, 0, NULL, 0, 1, '系统内置账户', '2016-07-20 00:00:00', NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, 0, '7181');

-- ----------------------------
-- Table structure for sys_userlogon
-- ----------------------------
DROP TABLE IF EXISTS `sys_userlogon`;
CREATE TABLE `sys_userlogon`  (
  `F_Id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_UserId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_UserPassword` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_UserSecretkey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_AllowStartTime` datetime NULL DEFAULT NULL,
  `F_AllowEndTime` datetime NULL DEFAULT NULL,
  `F_LockStartDate` datetime NULL DEFAULT NULL,
  `F_LockEndDate` datetime NULL DEFAULT NULL,
  `F_FirstVisitTime` datetime NULL DEFAULT NULL,
  `F_PreviousVisitTime` datetime NULL DEFAULT NULL,
  `F_LastVisitTime` datetime NULL DEFAULT NULL,
  `F_ChangePasswordDate` datetime NULL DEFAULT NULL,
  `F_MultiUserLogin` tinyint NULL DEFAULT NULL,
  `F_LogOnCount` int NULL DEFAULT NULL,
  `F_UserOnLine` tinyint NULL DEFAULT NULL,
  `F_Question` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_AnswerQuestion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `F_CheckIPAddress` tinyint NULL DEFAULT NULL,
  `F_Language` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_Theme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_LoginSession` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ErrorNum` int NULL DEFAULT NULL,
  PRIMARY KEY (`F_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_userlogon
-- ----------------------------
INSERT INTO `sys_userlogon` VALUES ('9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '9f2ec079-7d0f-4fe2-90ab-8b09a8302aba', '52c6b3f2456d7a6e4ce848c38bb0a228', 'b648e3d3de301b49', NULL, NULL, NULL, NULL, NULL, '2020-04-17 14:47:44', '2020-04-17 14:59:58', NULL, 0, 360, 0, NULL, NULL, 0, NULL, NULL, 'evrcyibdv42f3ykhfy1yz3ur', 0);

SET FOREIGN_KEY_CHECKS = 1;
