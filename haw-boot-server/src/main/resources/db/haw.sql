SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`
(
    `SCHED_NAME`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `TRIGGER_NAME`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `BLOB_DATA`     blob                                                          NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    INDEX `SCHED_NAME` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`
(
    `SCHED_NAME`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `CALENDAR`      blob                                                          NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`
(
    `SCHED_NAME`      varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `TRIGGER_NAME`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `TRIGGER_GROUP`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `TIME_ZONE_ID`    varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`
(
    `SCHED_NAME`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `ENTRY_ID`          varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL,
    `TRIGGER_NAME`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `TRIGGER_GROUP`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `INSTANCE_NAME`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `FIRED_TIME`        bigint(13)                                                    NOT NULL,
    `SCHED_TIME`        bigint(13)                                                    NOT NULL,
    `PRIORITY`          int(11)                                                       NOT NULL,
    `STATE`             varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL,
    `JOB_NAME`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `JOB_GROUP`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `IS_NONCONCURRENT`  varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL,
    `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
    INDEX `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
    INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
    INDEX `IDX_QRTZ_FT_J_G` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
    INDEX `IDX_QRTZ_FT_JG` (`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
    INDEX `IDX_QRTZ_FT_T_G` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    INDEX `IDX_QRTZ_FT_TG` (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`
(
    `SCHED_NAME`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `JOB_NAME`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `JOB_GROUP`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `DESCRIPTION`       varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `JOB_CLASS_NAME`    varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `IS_DURABLE`        varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL,
    `IS_NONCONCURRENT`  varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL,
    `IS_UPDATE_DATA`    varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL,
    `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL,
    `JOB_DATA`          blob                                                          NULL,
    PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
    INDEX `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
    INDEX `IDX_QRTZ_J_GRP` (`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`
(
    `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `LOCK_NAME`  varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks`
VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`
(
    `SCHED_NAME`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`
(
    `SCHED_NAME`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `INSTANCE_NAME`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `LAST_CHECKIN_TIME` bigint(13)                                                    NOT NULL,
    `CHECKIN_INTERVAL`  bigint(13)                                                    NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`
(
    `SCHED_NAME`      varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `TRIGGER_NAME`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `TRIGGER_GROUP`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `REPEAT_COUNT`    bigint(7)                                                     NOT NULL,
    `REPEAT_INTERVAL` bigint(12)                                                    NOT NULL,
    `TIMES_TRIGGERED` bigint(10)                                                    NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`
(
    `SCHED_NAME`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `TRIGGER_NAME`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `STR_PROP_1`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `STR_PROP_2`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `STR_PROP_3`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `INT_PROP_1`    int(11)                                                       NULL DEFAULT NULL,
    `INT_PROP_2`    int(11)                                                       NULL DEFAULT NULL,
    `LONG_PROP_1`   bigint(20)                                                    NULL DEFAULT NULL,
    `LONG_PROP_2`   bigint(20)                                                    NULL DEFAULT NULL,
    `DEC_PROP_1`    decimal(13, 4)                                                NULL DEFAULT NULL,
    `DEC_PROP_2`    decimal(13, 4)                                                NULL DEFAULT NULL,
    `BOOL_PROP_1`   varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL,
    `BOOL_PROP_2`   varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`
(
    `SCHED_NAME`     varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `TRIGGER_NAME`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `TRIGGER_GROUP`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `JOB_NAME`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `JOB_GROUP`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `DESCRIPTION`    varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `NEXT_FIRE_TIME` bigint(13)                                                    NULL DEFAULT NULL,
    `PREV_FIRE_TIME` bigint(13)                                                    NULL DEFAULT NULL,
    `PRIORITY`       int(11)                                                       NULL DEFAULT NULL,
    `TRIGGER_STATE`  varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL,
    `TRIGGER_TYPE`   varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL,
    `START_TIME`     bigint(13)                                                    NOT NULL,
    `END_TIME`       bigint(13)                                                    NULL DEFAULT NULL,
    `CALENDAR_NAME`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `MISFIRE_INSTR`  smallint(2)                                                   NULL DEFAULT NULL,
    `JOB_DATA`       blob                                                          NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    INDEX `IDX_QRTZ_T_J` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
    INDEX `IDX_QRTZ_T_JG` (`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
    INDEX `IDX_QRTZ_T_C` (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
    INDEX `IDX_QRTZ_T_G` (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
    INDEX `IDX_QRTZ_T_STATE` (`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
    INDEX `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
    INDEX `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
    INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
    INDEX `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
    INDEX `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
    INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
    INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`,
                                           `TRIGGER_STATE`) USING BTREE,
    CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `id`          int(10) UNSIGNED                                              NOT NULL AUTO_INCREMENT COMMENT '??????',
    `param_key`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '?????????',
    `param_value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '?????????',
    `status`      tinyint(1) UNSIGNED                                           NOT NULL COMMENT '??????',
    `remark`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '??????',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_param_key` (`param_key`) USING BTREE,
    INDEX `idx_status` (`status`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config`
VALUES (1, 'attendance_start_time', '06:00', 1, '????????????????????????');
INSERT INTO `sys_config`
VALUES (2, 'attendance_time', '08:30', 1, '????????????');
INSERT INTO `sys_config`
VALUES (3, 'attendance_end_time', '09:30', 1, '????????????????????????');
INSERT INTO `sys_config`
VALUES (4, 'closing_start_time', '16:30', 1, '????????????????????????');
INSERT INTO `sys_config`
VALUES (5, 'closing_time', '17:30', 1, '????????????');
INSERT INTO `sys_config`
VALUES (6, 'closing_end_time', '23:59', 1, '????????????????????????');

-- ----------------------------
-- Table structure for tb_action
-- ----------------------------
DROP TABLE IF EXISTS `tb_action`;
CREATE TABLE `tb_action`
(
    `id`          int(11) UNSIGNED                                              NOT NULL AUTO_INCREMENT COMMENT '??????',
    `action_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '????????????',
    `action_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '????????????',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_action_name` (`action_name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '?????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_action
-- ----------------------------
INSERT INTO `tb_action`
VALUES (1, 'INSERT', '??????');
INSERT INTO `tb_action`
VALUES (2, 'DELETE', '??????');
INSERT INTO `tb_action`
VALUES (3, 'UPDATE', '??????');
INSERT INTO `tb_action`
VALUES (4, 'SELECT', '??????');
INSERT INTO `tb_action`
VALUES (5, 'APPROVAL', '??????');
INSERT INTO `tb_action`
VALUES (6, 'EXPORT', '??????');
INSERT INTO `tb_action`
VALUES (7, 'BACKUP', '??????');

-- ----------------------------
-- Table structure for tb_checkin
-- ----------------------------
DROP TABLE IF EXISTS `tb_checkin`;
CREATE TABLE `tb_checkin`
(
    `id`          int(10) UNSIGNED                                              NOT NULL AUTO_INCREMENT COMMENT '??????',
    `user_id`     int(10) UNSIGNED                                              NOT NULL COMMENT '??????ID',
    `address`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '????????????',
    `country`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '??????',
    `province`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '??????',
    `city`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '??????',
    `district`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '??????',
    `status`      tinyint(3) UNSIGNED                                           NOT NULL COMMENT '????????????',
    `risk`        int(255) UNSIGNED                                             NULL DEFAULT 0 COMMENT '????????????',
    `date`        date                                                          NOT NULL COMMENT '????????????',
    `create_time` datetime(0)                                                   NOT NULL COMMENT '????????????',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_user_id` (`user_id`, `date`) USING BTREE,
    INDEX `idx_date` (`date`) USING BTREE,
    INDEX `idx_status` (`status`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 33
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '?????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_checkin
-- ----------------------------

-- ----------------------------
-- Table structure for tb_city
-- ----------------------------
DROP TABLE IF EXISTS `tb_city`;
CREATE TABLE `tb_city`
(
    `id`   int(10) UNSIGNED                                              NOT NULL AUTO_INCREMENT COMMENT '??????',
    `city` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '????????????',
    `code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '????????????',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_city` (`city`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 330
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '??????????????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_city
-- ----------------------------
INSERT INTO `tb_city`
VALUES (1, '?????????', 'ab');
INSERT INTO `tb_city`
VALUES (2, '?????????', 'ak');
INSERT INTO `tb_city`
VALUES (3, '????????????', 'aks');
INSERT INTO `tb_city`
VALUES (4, '????????????', 'alsm');
INSERT INTO `tb_city`
VALUES (5, '?????????', 'anshun');
INSERT INTO `tb_city`
VALUES (6, '?????????', 'aq');
INSERT INTO `tb_city`
VALUES (7, '?????????', 'as');
INSERT INTO `tb_city`
VALUES (8, '?????????', 'ay');
INSERT INTO `tb_city`
VALUES (9, '?????????', 'baise');
INSERT INTO `tb_city`
VALUES (10, '?????????', 'baishan');
INSERT INTO `tb_city`
VALUES (11, '?????????', 'baoji');
INSERT INTO `tb_city`
VALUES (12, '?????????', 'bazhong');
INSERT INTO `tb_city`
VALUES (13, '?????????', 'bb');
INSERT INTO `tb_city`
VALUES (14, '?????????', 'bc');
INSERT INTO `tb_city`
VALUES (15, '?????????', 'bd');
INSERT INTO `tb_city`
VALUES (16, '???????????????', 'betl');
INSERT INTO `tb_city`
VALUES (17, '?????????', 'bh');
INSERT INTO `tb_city`
VALUES (18, '?????????', 'bijie');
INSERT INTO `tb_city`
VALUES (19, '?????????', 'bj');
INSERT INTO `tb_city`
VALUES (20, '???????????????', 'bn');
INSERT INTO `tb_city`
VALUES (21, '?????????', 'bozhou');
INSERT INTO `tb_city`
VALUES (22, '?????????', 'bs');
INSERT INTO `tb_city`
VALUES (23, '?????????', 'bt');
INSERT INTO `tb_city`
VALUES (24, '?????????', 'bx');
INSERT INTO `tb_city`
VALUES (25, '?????????', 'by');
INSERT INTO `tb_city`
VALUES (26, '???????????????', 'bycem');
INSERT INTO `tb_city`
VALUES (27, '???????????????', 'bygl');
INSERT INTO `tb_city`
VALUES (28, '?????????', 'bz');
INSERT INTO `tb_city`
VALUES (29, '?????????', 'cangzhou');
INSERT INTO `tb_city`
VALUES (30, '?????????', 'cc');
INSERT INTO `tb_city`
VALUES (31, '?????????', 'cd');
INSERT INTO `tb_city`
VALUES (32, '?????????', 'cf');
INSERT INTO `tb_city`
VALUES (33, '?????????', 'changde');
INSERT INTO `tb_city`
VALUES (34, '?????????', 'changzhi');
INSERT INTO `tb_city`
VALUES (35, '?????????', 'chaozhou');
INSERT INTO `tb_city`
VALUES (36, '?????????', 'chengde');
INSERT INTO `tb_city`
VALUES (37, '?????????', 'chenzhou');
INSERT INTO `tb_city`
VALUES (38, '?????????', 'chizhou');
INSERT INTO `tb_city`
VALUES (39, '?????????', 'chongzuo');
INSERT INTO `tb_city`
VALUES (40, '?????????', 'chuzhou');
INSERT INTO `tb_city`
VALUES (41, '?????????', 'cj');
INSERT INTO `tb_city`
VALUES (42, '?????????', 'cq');
INSERT INTO `tb_city`
VALUES (43, '?????????', 'cs');
INSERT INTO `tb_city`
VALUES (44, '?????????', 'cx');
INSERT INTO `tb_city`
VALUES (45, '?????????', 'cy');
INSERT INTO `tb_city`
VALUES (46, '?????????', 'cz');
INSERT INTO `tb_city`
VALUES (47, '?????????', 'dali');
INSERT INTO `tb_city`
VALUES (48, '?????????', 'dazhou');
INSERT INTO `tb_city`
VALUES (49, '?????????', 'dd');
INSERT INTO `tb_city`
VALUES (50, '?????????', 'deyang');
INSERT INTO `tb_city`
VALUES (51, '?????????', 'dg');
INSERT INTO `tb_city`
VALUES (52, '?????????', 'dh');
INSERT INTO `tb_city`
VALUES (53, '?????????', 'diqing');
INSERT INTO `tb_city`
VALUES (54, '?????????', 'dl');
INSERT INTO `tb_city`
VALUES (55, '?????????', 'dq');
INSERT INTO `tb_city`
VALUES (56, '?????????', 'dt');
INSERT INTO `tb_city`
VALUES (57, '?????????', 'dx');
INSERT INTO `tb_city`
VALUES (58, '???????????????', 'dxal');
INSERT INTO `tb_city`
VALUES (59, '?????????', 'dy');
INSERT INTO `tb_city`
VALUES (60, '?????????', 'dz');
INSERT INTO `tb_city`
VALUES (61, '???????????????', 'erds');
INSERT INTO `tb_city`
VALUES (62, '?????????', 'es');
INSERT INTO `tb_city`
VALUES (63, '?????????', 'ez');
INSERT INTO `tb_city`
VALUES (64, '????????????', 'fcg');
INSERT INTO `tb_city`
VALUES (65, '?????????', 'fs');
INSERT INTO `tb_city`
VALUES (66, '?????????', 'fushun');
INSERT INTO `tb_city`
VALUES (67, '?????????', 'fuzhou');
INSERT INTO `tb_city`
VALUES (68, '?????????', 'fx');
INSERT INTO `tb_city`
VALUES (69, '?????????', 'fy');
INSERT INTO `tb_city`
VALUES (70, '?????????', 'fz');
INSERT INTO `tb_city`
VALUES (71, '?????????', 'ga');
INSERT INTO `tb_city`
VALUES (72, '?????????', 'ganzhou');
INSERT INTO `tb_city`
VALUES (73, '?????????', 'ganzi');
INSERT INTO `tb_city`
VALUES (74, '?????????', 'gg');
INSERT INTO `tb_city`
VALUES (75, '?????????', 'gl');
INSERT INTO `tb_city`
VALUES (76, '?????????', 'guangyuan');
INSERT INTO `tb_city`
VALUES (77, '?????????', 'guoluo');
INSERT INTO `tb_city`
VALUES (78, '?????????', 'guyuan');
INSERT INTO `tb_city`
VALUES (79, '?????????', 'gy');
INSERT INTO `tb_city`
VALUES (80, '?????????', 'gz');
INSERT INTO `tb_city`
VALUES (81, '?????????', 'ha');
INSERT INTO `tb_city`
VALUES (82, '?????????', 'haibei');
INSERT INTO `tb_city`
VALUES (83, '?????????', 'haidong');
INSERT INTO `tb_city`
VALUES (84, '?????????', 'hainan');
INSERT INTO `tb_city`
VALUES (85, '?????????', 'hanzhong');
INSERT INTO `tb_city`
VALUES (86, '?????????', 'hb');
INSERT INTO `tb_city`
VALUES (87, '?????????', 'hc');
INSERT INTO `tb_city`
VALUES (88, '?????????', 'hd');
INSERT INTO `tb_city`
VALUES (89, '????????????', 'heb');
INSERT INTO `tb_city`
VALUES (90, '?????????', 'hegang');
INSERT INTO `tb_city`
VALUES (91, '?????????', 'heihe');
INSERT INTO `tb_city`
VALUES (92, '?????????', 'heyuan');
INSERT INTO `tb_city`
VALUES (93, '?????????', 'heze');
INSERT INTO `tb_city`
VALUES (94, '?????????', 'hezhou');
INSERT INTO `tb_city`
VALUES (95, '?????????', 'hf');
INSERT INTO `tb_city`
VALUES (96, '?????????', 'hg');
INSERT INTO `tb_city`
VALUES (97, '?????????', 'hh');
INSERT INTO `tb_city`
VALUES (98, '???????????????', 'hlbe');
INSERT INTO `tb_city`
VALUES (99, '????????????', 'hld');
INSERT INTO `tb_city`
VALUES (100, '?????????', 'hm');
INSERT INTO `tb_city`
VALUES (101, '?????????', 'hn');
INSERT INTO `tb_city`
VALUES (102, '?????????', 'honghe');
INSERT INTO `tb_city`
VALUES (103, '?????????', 'hs');
INSERT INTO `tb_city`
VALUES (104, '?????????', 'hshi');
INSERT INTO `tb_city`
VALUES (105, '?????????', 'ht');
INSERT INTO `tb_city`
VALUES (106, '???????????????', 'hu');
INSERT INTO `tb_city`
VALUES (107, '?????????', 'huaibei');
INSERT INTO `tb_city`
VALUES (108, '?????????', 'huangnan');
INSERT INTO `tb_city`
VALUES (109, '?????????', 'huangshan');
INSERT INTO `tb_city`
VALUES (110, '?????????', 'huizhou');
INSERT INTO `tb_city`
VALUES (111, '?????????', 'huzhou');
INSERT INTO `tb_city`
VALUES (112, '?????????', 'hx');
INSERT INTO `tb_city`
VALUES (113, '?????????', 'hy');
INSERT INTO `tb_city`
VALUES (114, '?????????', 'hz');
INSERT INTO `tb_city`
VALUES (115, '?????????', 'ja');
INSERT INTO `tb_city`
VALUES (116, '?????????', 'jc');
INSERT INTO `tb_city`
VALUES (117, '????????????', 'jdz');
INSERT INTO `tb_city`
VALUES (118, '?????????', 'jh');
INSERT INTO `tb_city`
VALUES (119, '?????????', 'jiaozuo');
INSERT INTO `tb_city`
VALUES (120, '?????????', 'jinchang');
INSERT INTO `tb_city`
VALUES (121, '?????????', 'jingmen');
INSERT INTO `tb_city`
VALUES (122, '?????????', 'jingzhou');
INSERT INTO `tb_city`
VALUES (123, '?????????', 'jining');
INSERT INTO `tb_city`
VALUES (124, '?????????', 'jinzhou');
INSERT INTO `tb_city`
VALUES (125, '?????????', 'jixi');
INSERT INTO `tb_city`
VALUES (126, '?????????', 'jiyuan');
INSERT INTO `tb_city`
VALUES (127, '?????????', 'jj');
INSERT INTO `tb_city`
VALUES (128, '?????????', 'jl');
INSERT INTO `tb_city`
VALUES (129, '?????????', 'jm');
INSERT INTO `tb_city`
VALUES (130, '????????????', 'jms');
INSERT INTO `tb_city`
VALUES (131, '?????????', 'jn');
INSERT INTO `tb_city`
VALUES (132, '?????????', 'jq');
INSERT INTO `tb_city`
VALUES (133, '?????????', 'jx');
INSERT INTO `tb_city`
VALUES (134, '?????????', 'jy');
INSERT INTO `tb_city`
VALUES (135, '????????????', 'jyg');
INSERT INTO `tb_city`
VALUES (136, '?????????', 'jz');
INSERT INTO `tb_city`
VALUES (137, '?????????', 'kashi');
INSERT INTO `tb_city`
VALUES (138, '?????????', 'kf');
INSERT INTO `tb_city`
VALUES (139, '???????????????', 'klmy');
INSERT INTO `tb_city`
VALUES (140, '?????????', 'km');
INSERT INTO `tb_city`
VALUES (141, '???????????????', 'kzls');
INSERT INTO `tb_city`
VALUES (142, '?????????', 'la');
INSERT INTO `tb_city`
VALUES (143, '?????????', 'lb');
INSERT INTO `tb_city`
VALUES (144, '?????????', 'lc');
INSERT INTO `tb_city`
VALUES (145, '?????????', 'ld');
INSERT INTO `tb_city`
VALUES (146, '?????????', 'leshan');
INSERT INTO `tb_city`
VALUES (147, '?????????', 'lf');
INSERT INTO `tb_city`
VALUES (148, '?????????', 'lh');
INSERT INTO `tb_city`
VALUES (149, '?????????', 'liangshan');
INSERT INTO `tb_city`
VALUES (150, '?????????', 'liaoyang');
INSERT INTO `tb_city`
VALUES (151, '?????????', 'liaoyuan');
INSERT INTO `tb_city`
VALUES (152, '?????????', 'lincang');
INSERT INTO `tb_city`
VALUES (153, '?????????', 'linfen');
INSERT INTO `tb_city`
VALUES (154, '?????????', 'linyi');
INSERT INTO `tb_city`
VALUES (155, '?????????', 'lishui');
INSERT INTO `tb_city`
VALUES (156, '?????????', 'liuzhou');
INSERT INTO `tb_city`
VALUES (157, '?????????', 'lj');
INSERT INTO `tb_city`
VALUES (158, '?????????', 'll');
INSERT INTO `tb_city`
VALUES (159, '?????????', 'ln');
INSERT INTO `tb_city`
VALUES (160, '?????????', 'longyan');
INSERT INTO `tb_city`
VALUES (161, '????????????', 'lps');
INSERT INTO `tb_city`
VALUES (162, '?????????', 'luzhou');
INSERT INTO `tb_city`
VALUES (163, '?????????', 'ly');
INSERT INTO `tb_city`
VALUES (164, '????????????', 'lyg');
INSERT INTO `tb_city`
VALUES (165, '?????????', 'lz');
INSERT INTO `tb_city`
VALUES (166, '????????????', 'mas');
INSERT INTO `tb_city`
VALUES (167, '????????????', 'mdj');
INSERT INTO `tb_city`
VALUES (168, '?????????', 'mm');
INSERT INTO `tb_city`
VALUES (169, '?????????', 'ms');
INSERT INTO `tb_city`
VALUES (170, '?????????', 'my');
INSERT INTO `tb_city`
VALUES (171, '?????????', 'mz');
INSERT INTO `tb_city`
VALUES (172, '?????????', 'nanchong');
INSERT INTO `tb_city`
VALUES (173, '?????????', 'nb');
INSERT INTO `tb_city`
VALUES (174, '?????????', 'nc');
INSERT INTO `tb_city`
VALUES (175, '?????????', 'nd');
INSERT INTO `tb_city`
VALUES (176, '?????????', 'neijiang');
INSERT INTO `tb_city`
VALUES (177, '?????????', 'nj');
INSERT INTO `tb_city`
VALUES (178, '?????????', 'nn');
INSERT INTO `tb_city`
VALUES (179, '?????????', 'np');
INSERT INTO `tb_city`
VALUES (180, '?????????', 'nt');
INSERT INTO `tb_city`
VALUES (181, '?????????', 'nujiang');
INSERT INTO `tb_city`
VALUES (182, '?????????', 'ny');
INSERT INTO `tb_city`
VALUES (183, '????????????', 'pds');
INSERT INTO `tb_city`
VALUES (184, '?????????', 'pe');
INSERT INTO `tb_city`
VALUES (185, '?????????', 'pj');
INSERT INTO `tb_city`
VALUES (186, '?????????', 'pl');
INSERT INTO `tb_city`
VALUES (187, '?????????', 'pt');
INSERT INTO `tb_city`
VALUES (188, '?????????', 'px');
INSERT INTO `tb_city`
VALUES (189, '?????????', 'py');
INSERT INTO `tb_city`
VALUES (190, '????????????', 'pzh');
INSERT INTO `tb_city`
VALUES (191, '?????????', 'qd');
INSERT INTO `tb_city`
VALUES (192, '????????????', 'qdn');
INSERT INTO `tb_city`
VALUES (193, '????????????', 'qhd');
INSERT INTO `tb_city`
VALUES (194, '?????????', 'qianjiang');
INSERT INTO `tb_city`
VALUES (195, '?????????', 'qingyang');
INSERT INTO `tb_city`
VALUES (196, '?????????', 'qinzhou');
INSERT INTO `tb_city`
VALUES (197, '?????????', 'qj');
INSERT INTO `tb_city`
VALUES (198, '?????????', 'qn');
INSERT INTO `tb_city`
VALUES (199, '???????????????', 'qqhr');
INSERT INTO `tb_city`
VALUES (200, '????????????', 'qth');
INSERT INTO `tb_city`
VALUES (201, '?????????', 'quzhou');
INSERT INTO `tb_city`
VALUES (202, '????????????', 'qxn');
INSERT INTO `tb_city`
VALUES (203, '?????????', 'qy');
INSERT INTO `tb_city`
VALUES (204, '?????????', 'qz');
INSERT INTO `tb_city`
VALUES (205, '?????????', 'rz');
INSERT INTO `tb_city`
VALUES (206, '?????????', 'sanya');
INSERT INTO `tb_city`
VALUES (207, '?????????', 'sg');
INSERT INTO `tb_city`
VALUES (208, '?????????', 'sh');
INSERT INTO `tb_city`
VALUES (209, '?????????', 'shaoyang');
INSERT INTO `tb_city`
VALUES (210, '?????????', 'shiyan');
INSERT INTO `tb_city`
VALUES (211, '?????????', 'shuozhou');
INSERT INTO `tb_city`
VALUES (212, '????????????', 'sjz');
INSERT INTO `tb_city`
VALUES (213, '?????????', 'sl');
INSERT INTO `tb_city`
VALUES (214, '?????????', 'sm');
INSERT INTO `tb_city`
VALUES (215, '????????????', 'smx');
INSERT INTO `tb_city`
VALUES (216, '????????????', 'snj');
INSERT INTO `tb_city`
VALUES (217, '?????????', 'songyuan');
INSERT INTO `tb_city`
VALUES (218, '?????????', 'sp');
INSERT INTO `tb_city`
VALUES (219, '?????????', 'sq');
INSERT INTO `tb_city`
VALUES (220, '?????????', 'sr');
INSERT INTO `tb_city`
VALUES (221, '?????????', 'st');
INSERT INTO `tb_city`
VALUES (222, '?????????', 'su');
INSERT INTO `tb_city`
VALUES (223, '?????????', 'suihua');
INSERT INTO `tb_city`
VALUES (224, '?????????', 'suining');
INSERT INTO `tb_city`
VALUES (225, '?????????', 'suizhou');
INSERT INTO `tb_city`
VALUES (226, '?????????', 'suqian');
INSERT INTO `tb_city`
VALUES (227, '?????????', 'suzhou');
INSERT INTO `tb_city`
VALUES (228, '?????????', 'sw');
INSERT INTO `tb_city`
VALUES (229, '?????????', 'sx');
INSERT INTO `tb_city`
VALUES (230, '?????????', 'sy');
INSERT INTO `tb_city`
VALUES (231, '????????????', 'sys');
INSERT INTO `tb_city`
VALUES (232, '?????????', 'bendibao.com/news/yqdengji/');
INSERT INTO `tb_city`
VALUES (233, '????????????', 'szs');
INSERT INTO `tb_city`
VALUES (234, '?????????', 'ta');
INSERT INTO `tb_city`
VALUES (235, '?????????', 'tacheng');
INSERT INTO `tb_city`
VALUES (236, '?????????', 'taizhou');
INSERT INTO `tb_city`
VALUES (237, '?????????', 'tc');
INSERT INTO `tb_city`
VALUES (238, '?????????', 'th');
INSERT INTO `tb_city`
VALUES (239, '?????????', 'tianshui');
INSERT INTO `tb_city`
VALUES (240, '?????????', 'tj');
INSERT INTO `tb_city`
VALUES (241, '????????????', 'tlf');
INSERT INTO `tb_city`
VALUES (242, '?????????', 'tm');
INSERT INTO `tb_city`
VALUES (243, '?????????', 'tongliao');
INSERT INTO `tb_city`
VALUES (244, '?????????', 'tongling');
INSERT INTO `tb_city`
VALUES (245, '?????????', 'tr');
INSERT INTO `tb_city`
VALUES (246, '?????????', 'ts');
INSERT INTO `tb_city`
VALUES (247, '?????????', 'ty');
INSERT INTO `tb_city`
VALUES (248, '?????????', 'tz');
INSERT INTO `tb_city`
VALUES (249, '?????????', 'weihai');
INSERT INTO `tb_city`
VALUES (250, '?????????', 'wf');
INSERT INTO `tb_city`
VALUES (251, '?????????', 'wh');
INSERT INTO `tb_city`
VALUES (252, '???????????????', 'wlcb');
INSERT INTO `tb_city`
VALUES (253, '???????????????', 'wlmq');
INSERT INTO `tb_city`
VALUES (254, '?????????', 'wn');
INSERT INTO `tb_city`
VALUES (255, '?????????', 'ws');
INSERT INTO `tb_city`
VALUES (256, '?????????', 'wuhai');
INSERT INTO `tb_city`
VALUES (257, '?????????', 'wuhu');
INSERT INTO `tb_city`
VALUES (258, '?????????', 'wuwei');
INSERT INTO `tb_city`
VALUES (259, '?????????', 'wuzhong');
INSERT INTO `tb_city`
VALUES (260, '?????????', 'wuzhou');
INSERT INTO `tb_city`
VALUES (261, '?????????', 'wx');
INSERT INTO `tb_city`
VALUES (262, '?????????', 'wz');
INSERT INTO `tb_city`
VALUES (263, '????????????', 'wzs');
INSERT INTO `tb_city`
VALUES (264, '?????????', 'xa');
INSERT INTO `tb_city`
VALUES (265, '?????????', 'xam');
INSERT INTO `tb_city`
VALUES (266, '?????????', 'xc');
INSERT INTO `tb_city`
VALUES (267, '?????????', 'xf');
INSERT INTO `tb_city`
VALUES (268, '?????????', 'xg');
INSERT INTO `tb_city`
VALUES (269, '?????????', 'xiangtan');
INSERT INTO `tb_city`
VALUES (270, '?????????', 'xiangxi');
INSERT INTO `tb_city`
VALUES (271, '?????????', 'xianning');
INSERT INTO `tb_city`
VALUES (272, '?????????', 'xiantao');
INSERT INTO `tb_city`
VALUES (273, '?????????', 'xianyang');
INSERT INTO `tb_city`
VALUES (274, '?????????', 'xinyu');
INSERT INTO `tb_city`
VALUES (275, '?????????', 'xinzhou');
INSERT INTO `tb_city`
VALUES (276, '???????????????', 'xl');
INSERT INTO `tb_city`
VALUES (277, '?????????', 'xm');
INSERT INTO `tb_city`
VALUES (278, '?????????', 'xn');
INSERT INTO `tb_city`
VALUES (279, '?????????', 'xt');
INSERT INTO `tb_city`
VALUES (280, '?????????', 'xuancheng');
INSERT INTO `tb_city`
VALUES (281, '?????????', 'xx');
INSERT INTO `tb_city`
VALUES (282, '?????????', 'xy');
INSERT INTO `tb_city`
VALUES (283, '?????????', 'xz');
INSERT INTO `tb_city`
VALUES (284, '?????????', 'ya');
INSERT INTO `tb_city`
VALUES (285, '?????????', 'yanbian');
INSERT INTO `tb_city`
VALUES (286, '?????????', 'yancheng');
INSERT INTO `tb_city`
VALUES (287, '?????????', 'yangquan');
INSERT INTO `tb_city`
VALUES (288, '?????????', 'yb');
INSERT INTO `tb_city`
VALUES (289, '?????????', 'yc');
INSERT INTO `tb_city`
VALUES (290, '?????????', 'yf');
INSERT INTO `tb_city`
VALUES (291, '?????????', 'yich');
INSERT INTO `tb_city`
VALUES (292, '?????????', 'yichang');
INSERT INTO `tb_city`
VALUES (293, '?????????', 'yichun');
INSERT INTO `tb_city`
VALUES (294, '?????????', 'yili');
INSERT INTO `tb_city`
VALUES (295, '?????????', 'yingtan');
INSERT INTO `tb_city`
VALUES (296, '?????????', 'yiyang');
INSERT INTO `tb_city`
VALUES (297, '?????????', 'yj');
INSERT INTO `tb_city`
VALUES (298, '?????????', 'yk');
INSERT INTO `tb_city`
VALUES (299, '?????????', 'yl');
INSERT INTO `tb_city`
VALUES (300, '?????????', 'yn');
INSERT INTO `tb_city`
VALUES (301, '?????????', 'yongzhou');
INSERT INTO `tb_city`
VALUES (302, '?????????', 'ys');
INSERT INTO `tb_city`
VALUES (303, '?????????', 'yt');
INSERT INTO `tb_city`
VALUES (304, '?????????', 'yulin');
INSERT INTO `tb_city`
VALUES (305, '?????????', 'yuncheng');
INSERT INTO `tb_city`
VALUES (306, '?????????', 'yx');
INSERT INTO `tb_city`
VALUES (307, '?????????', 'yy');
INSERT INTO `tb_city`
VALUES (308, '?????????', 'yz');
INSERT INTO `tb_city`
VALUES (309, '?????????', 'zaozhuang');
INSERT INTO `tb_city`
VALUES (310, '?????????', 'zb');
INSERT INTO `tb_city`
VALUES (311, '?????????', 'zg');
INSERT INTO `tb_city`
VALUES (312, '?????????', 'zh');
INSERT INTO `tb_city`
VALUES (313, '?????????', 'zhangye');
INSERT INTO `tb_city`
VALUES (314, '?????????', 'zhangzhou');
INSERT INTO `tb_city`
VALUES (315, '?????????', 'zhanjiang');
INSERT INTO `tb_city`
VALUES (316, '?????????', 'zhoushan');
INSERT INTO `tb_city`
VALUES (317, '?????????', 'zhuzhou');
INSERT INTO `tb_city`
VALUES (318, '?????????', 'zj');
INSERT INTO `tb_city`
VALUES (319, '????????????', 'zjj');
INSERT INTO `tb_city`
VALUES (320, '????????????', 'zjk');
INSERT INTO `tb_city`
VALUES (321, '?????????', 'zk');
INSERT INTO `tb_city`
VALUES (322, '????????????', 'zmd');
INSERT INTO `tb_city`
VALUES (323, '?????????', 'zq');
INSERT INTO `tb_city`
VALUES (324, '?????????', 'zs');
INSERT INTO `tb_city`
VALUES (325, '?????????', 'zt');
INSERT INTO `tb_city`
VALUES (326, '?????????', 'zunyi');
INSERT INTO `tb_city`
VALUES (327, '?????????', 'zw');
INSERT INTO `tb_city`
VALUES (328, '?????????', 'zy');
INSERT INTO `tb_city`
VALUES (329, '?????????', 'zz');

-- ----------------------------
-- Table structure for tb_dept
-- ----------------------------
DROP TABLE IF EXISTS `tb_dept`;
CREATE TABLE `tb_dept`
(
    `id`        int(10) UNSIGNED                                              NOT NULL AUTO_INCREMENT COMMENT '??????',
    `dept_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '????????????',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_dept_name` (`dept_name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_dept
-- ----------------------------
INSERT INTO `tb_dept`
VALUES (11, '?????????');
INSERT INTO `tb_dept`
VALUES (5, '?????????');
INSERT INTO `tb_dept`
VALUES (4, '?????????');
INSERT INTO `tb_dept`
VALUES (3, '?????????');
INSERT INTO `tb_dept`
VALUES (1, '?????????');
INSERT INTO `tb_dept`
VALUES (2, '?????????');

-- ----------------------------
-- Table structure for tb_face_model
-- ----------------------------
DROP TABLE IF EXISTS `tb_face_model`;
CREATE TABLE `tb_face_model`
(
    `id`         int(10) UNSIGNED                                      NOT NULL AUTO_INCREMENT COMMENT '?????????',
    `user_id`    int(10) UNSIGNED                                      NOT NULL COMMENT '??????ID',
    `face_model` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '??????????????????',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_user_id` (`user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_face_model
-- ----------------------------

-- ----------------------------
-- Table structure for tb_holidays
-- ----------------------------
DROP TABLE IF EXISTS `tb_holidays`;
CREATE TABLE `tb_holidays`
(
    `id`   int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '??????',
    `date` date             NOT NULL COMMENT '??????',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_date` (`date`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '????????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_holidays
-- ----------------------------

-- ----------------------------
-- Table structure for tb_meeting
-- ----------------------------
DROP TABLE IF EXISTS `tb_meeting`;
CREATE TABLE `tb_meeting`
(
    `id`          bigint(20) UNSIGNED                                           NOT NULL AUTO_INCREMENT COMMENT '??????',
    `uuid`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'UUID',
    `title`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '????????????',
    `creator_id`  bigint(200)                                                   NOT NULL COMMENT '?????????ID',
    `date`        date                                                          NOT NULL COMMENT '??????',
    `place`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '????????????',
    `start`       time(0)                                                       NOT NULL COMMENT '????????????',
    `end`         time(0)                                                       NOT NULL COMMENT '????????????',
    `type`        smallint(6)                                                   NOT NULL COMMENT '???????????????1???????????????2???????????????',
    `members`     json                                                          NOT NULL COMMENT '?????????',
    `desc`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '????????????',
    `instance_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '???????????????ID',
    `status`      smallint(6)                                                   NOT NULL COMMENT '?????????1????????????2????????????3????????????',
    `create_time` datetime(0)                                                   NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '????????????',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_creator_id` (`creator_id`) USING BTREE,
    INDEX `idx_date` (`date`) USING BTREE,
    INDEX `idx_type` (`type`) USING BTREE,
    INDEX `idx_status` (`status`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 48
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '?????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_meeting
-- ----------------------------

-- ----------------------------
-- Table structure for tb_module
-- ----------------------------
DROP TABLE IF EXISTS `tb_module`;
CREATE TABLE `tb_module`
(
    `id`          int(10) UNSIGNED                                              NOT NULL AUTO_INCREMENT COMMENT '??????',
    `module_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '????????????',
    `module_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '????????????',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_module_id` (`module_code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '???????????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_module
-- ----------------------------
INSERT INTO `tb_module`
VALUES (1, 'USER', '????????????');
INSERT INTO `tb_module`
VALUES (2, 'EMPLOYEE', '????????????');
INSERT INTO `tb_module`
VALUES (3, 'DEPT', '????????????');
INSERT INTO `tb_module`
VALUES (4, 'MEETING', '????????????');
INSERT INTO `tb_module`
VALUES (5, 'WORKFLOW', '???????????????');

-- ----------------------------
-- Table structure for tb_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission`;
CREATE TABLE `tb_permission`
(
    `id`              int(10) UNSIGNED                                              NOT NULL AUTO_INCREMENT COMMENT '??????',
    `permission_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '??????',
    `module_id`       int(10) UNSIGNED                                              NOT NULL COMMENT '??????ID',
    `action_id`       int(10) UNSIGNED                                              NOT NULL COMMENT '??????ID',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_permission` (`permission_name`) USING BTREE,
    UNIQUE INDEX `unq_complex` (`module_id`, `action_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_permission
-- ----------------------------
INSERT INTO `tb_permission`
VALUES (1, 'USER:INSERT', 1, 1);
INSERT INTO `tb_permission`
VALUES (2, 'USER:DELETE', 1, 2);
INSERT INTO `tb_permission`
VALUES (3, 'USER:UPDATE', 1, 3);
INSERT INTO `tb_permission`
VALUES (4, 'USER:SELECT', 1, 4);
INSERT INTO `tb_permission`
VALUES (5, 'EMPLOYEE:INSERT', 2, 1);
INSERT INTO `tb_permission`
VALUES (6, 'EMPLOYEE:DELETE', 2, 2);
INSERT INTO `tb_permission`
VALUES (7, 'EMPLOYEE:UPDATE', 2, 3);
INSERT INTO `tb_permission`
VALUES (8, 'EMPLOYEE:SELECT', 2, 4);
INSERT INTO `tb_permission`
VALUES (9, 'DEPT:INSERT', 3, 1);
INSERT INTO `tb_permission`
VALUES (10, 'DEPT:DELETE', 3, 2);
INSERT INTO `tb_permission`
VALUES (11, 'DEPT:UPDATE', 3, 3);
INSERT INTO `tb_permission`
VALUES (12, 'DEPT:SELECT', 3, 4);
INSERT INTO `tb_permission`
VALUES (13, 'MEETING:INSERT', 4, 1);
INSERT INTO `tb_permission`
VALUES (14, 'MEETING:DELETE', 4, 2);
INSERT INTO `tb_permission`
VALUES (15, 'MEETING:UPDATE', 4, 3);
INSERT INTO `tb_permission`
VALUES (16, 'MEETING:SELECT', 4, 4);
INSERT INTO `tb_permission`
VALUES (17, 'WORKFLOW:APPROVAL', 5, 5);
INSERT INTO `tb_permission`
VALUES (18, 'ROOT', 0, 0);

UPDATE tb_permission
SET id=0
WHERE permission_name = 'ROOT';

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`
(
    `id`          int(10) UNSIGNED                                              NOT NULL AUTO_INCREMENT COMMENT '??????',
    `role_name`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '????????????',
    `permissions` json                                                          NOT NULL COMMENT '????????????',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_role_name` (`role_name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '?????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role`
VALUES (1, '?????????', '[
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17
]');
INSERT INTO `tb_role`
VALUES (2, '????????????', '[
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11
]');
INSERT INTO `tb_role`
VALUES (3, '????????????', '[
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8
]');
INSERT INTO `tb_role`
VALUES (4, '???????????????', '[
  0
]');

UPDATE tb_role
SET id=0
WHERE role_name = '???????????????';

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`
(
    `id`          int(10) UNSIGNED                                                NOT NULL AUTO_INCREMENT COMMENT '??????',
    `open_id`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '?????????????????????',
    `nickname`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '??????',
    `photo`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '????????????',
    `name`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci    NULL DEFAULT NULL COMMENT '??????',
    `sex`         enum ('???','???') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '??????',
    `tel`         char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci       NULL DEFAULT NULL COMMENT '????????????',
    `email`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '??????',
    `hiredate`    date                                                            NULL DEFAULT NULL COMMENT '????????????',
    `role`        json                                                            NOT NULL COMMENT '??????',
    `root`        tinyint(1)                                                      NOT NULL COMMENT '????????????????????????',
    `dept_id`     int(10) UNSIGNED                                                NULL DEFAULT NULL COMMENT '????????????',
    `status`      tinyint(4)                                                      NOT NULL COMMENT '??????',
    `create_time` datetime(0)                                                     NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '????????????',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_open_id` (`open_id`) USING BTREE,
    INDEX `unq_email` (`email`) USING BTREE,
    INDEX `idx_dept_id` (`dept_id`) USING BTREE,
    INDEX `idx_status` (`status`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '?????????'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------

-- ----------------------------
-- Table structure for tb_workday
-- ----------------------------
DROP TABLE IF EXISTS `tb_workday`;
CREATE TABLE `tb_workday`
(
    `id`   int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
    `date` date    NULL DEFAULT NULL COMMENT '??????',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unq_date` (`date`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_workday
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
