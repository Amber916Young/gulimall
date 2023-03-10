-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: gulimall_admin
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler','TASK_1','DEFAULT','0 0/30 * * * ?','Europe/Dublin');
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler','TASK_1','DEFAULT',NULL,'io.renren.modules.job.utils.ScheduleJob','0','0','0','0',_binary '?\?\0sr\0org.quartz.JobDataMap???????\?\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap?\?\??\?](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\?.?(v\n\?\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\??\?`\?\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj?KYt\0\0xpw\0\0?\?>?\?xt\00 0/30 * * * ?sr\0java.lang.Long;?\????#\?\0J\0valuexr\0java.lang.Number????\??\0\0xp\0\0\0\0\0\0\0t\0renrent\0????????????sr\0java.lang.Integer??????8\0I\0valuexq\0~\0\0\0\0\0x\0');
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler','STATE_ACCESS'),('RenrenScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler','Mengs-MacBook-Pro.local1675866379559',1675867689019,15000);
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1675868400000,1675866600000,5,'WAITING','CRON',1674650758000,0,NULL,2,_binary '?\?\0sr\0org.quartz.JobDataMap???????\?\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap?\?\??\?](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\?.?(v\n\?\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\??\?`\?\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj?KYt\0\0xpw\0\0?\?>?\?xt\00 0/30 * * * ?sr\0java.lang.Long;?\????#\?\0J\0valuexr\0java.lang.Number????\??\0\0xp\0\0\0\0\0\0\0t\0renrent\0????????????sr\0java.lang.Integer??????8\0I\0valuexq\0~\0\0\0\0\0x\0');
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_job`
--

DROP TABLE IF EXISTS `schedule_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean??????',
  `params` varchar(2000) DEFAULT NULL COMMENT '??????',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron?????????',
  `status` tinyint DEFAULT NULL COMMENT '????????????  0?????????  1?????????',
  `remark` varchar(255) DEFAULT NULL COMMENT '??????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='????????????';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_job`
--

LOCK TABLES `schedule_job` WRITE;
/*!40000 ALTER TABLE `schedule_job` DISABLE KEYS */;
INSERT INTO `schedule_job` VALUES (1,'testTask','renren','0 0/30 * * * ?',0,'????????????','2023-01-25 12:45:21');
/*!40000 ALTER TABLE `schedule_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_job_log`
--

DROP TABLE IF EXISTS `schedule_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '????????????id',
  `job_id` bigint NOT NULL COMMENT '??????id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean??????',
  `params` varchar(2000) DEFAULT NULL COMMENT '??????',
  `status` tinyint NOT NULL COMMENT '????????????    0?????????    1?????????',
  `error` varchar(2000) DEFAULT NULL COMMENT '????????????',
  `times` int NOT NULL COMMENT '??????(???????????????)',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='??????????????????';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_job_log`
--

LOCK TABLES `schedule_job_log` WRITE;
/*!40000 ALTER TABLE `schedule_job_log` DISABLE KEYS */;
INSERT INTO `schedule_job_log` VALUES (1,1,'testTask','renren',0,NULL,1,'2023-01-26 00:31:24'),(2,1,'testTask','renren',0,NULL,1,'2023-01-26 17:00:00'),(3,1,'testTask','renren',0,NULL,3,'2023-01-26 17:30:00'),(4,1,'testTask','renren',0,NULL,1,'2023-01-26 18:00:00'),(5,1,'testTask','renren',0,NULL,2,'2023-01-26 18:30:00'),(6,1,'testTask','renren',0,NULL,12,'2023-01-26 19:00:00'),(7,1,'testTask','renren',0,NULL,2,'2023-01-26 22:30:00'),(8,1,'testTask','renren',0,NULL,1,'2023-01-26 23:00:00'),(9,1,'testTask','renren',0,NULL,2,'2023-01-27 00:00:00'),(10,1,'testTask','renren',0,NULL,5,'2023-01-27 00:30:00'),(11,1,'testTask','renren',0,NULL,5,'2023-01-27 01:30:00'),(12,1,'testTask','renren',0,NULL,6,'2023-01-27 17:30:00'),(13,1,'testTask','renren',0,NULL,2,'2023-01-27 18:00:00'),(14,1,'testTask','renren',0,NULL,2,'2023-01-27 18:30:00'),(15,1,'testTask','renren',0,NULL,0,'2023-01-27 19:30:00'),(16,1,'testTask','renren',0,NULL,3,'2023-01-27 20:00:00'),(17,1,'testTask','renren',0,NULL,1,'2023-01-27 20:30:00'),(18,1,'testTask','renren',0,NULL,1,'2023-01-27 23:00:00'),(19,1,'testTask','renren',0,NULL,2,'2023-01-27 23:30:00'),(20,1,'testTask','renren',0,NULL,2,'2023-01-28 00:00:00'),(21,1,'testTask','renren',0,NULL,1,'2023-01-28 00:30:00'),(22,1,'testTask','renren',0,NULL,2,'2023-01-28 01:00:00'),(23,1,'testTask','renren',0,NULL,2,'2023-01-28 02:00:00'),(24,1,'testTask','renren',0,NULL,1,'2023-01-30 17:00:00'),(25,1,'testTask','renren',0,NULL,2,'2023-01-30 17:30:00'),(26,1,'testTask','renren',0,NULL,1,'2023-01-30 18:00:00'),(27,1,'testTask','renren',0,NULL,5,'2023-01-30 19:00:00'),(28,1,'testTask','renren',0,NULL,2,'2023-01-30 19:30:00'),(29,1,'testTask','renren',0,NULL,4,'2023-01-30 20:00:00'),(30,1,'testTask','renren',0,NULL,1,'2023-01-30 20:30:00'),(31,1,'testTask','renren',0,NULL,3,'2023-01-30 21:00:00'),(32,1,'testTask','renren',0,NULL,4,'2023-01-30 21:30:00'),(33,1,'testTask','renren',0,NULL,4,'2023-01-30 22:00:00'),(34,1,'testTask','renren',0,NULL,3,'2023-01-30 22:30:00'),(35,1,'testTask','renren',0,NULL,1,'2023-01-30 23:00:00'),(36,1,'testTask','renren',0,NULL,3,'2023-01-30 23:30:00'),(37,1,'testTask','renren',0,NULL,1,'2023-01-31 00:00:00'),(38,1,'testTask','renren',0,NULL,4,'2023-01-31 00:30:00'),(39,1,'testTask','renren',0,NULL,0,'2023-01-31 17:30:00'),(40,1,'testTask','renren',0,NULL,2,'2023-01-31 18:00:00'),(41,1,'testTask','renren',0,NULL,17,'2023-01-31 18:30:00'),(42,1,'testTask','renren',0,NULL,2,'2023-01-31 19:00:00'),(43,1,'testTask','renren',0,NULL,1,'2023-01-31 19:30:00'),(44,1,'testTask','renren',0,NULL,1,'2023-01-31 20:00:00'),(45,1,'testTask','renren',0,NULL,3,'2023-01-31 20:30:00'),(46,1,'testTask','renren',0,NULL,1,'2023-01-31 22:30:00'),(47,1,'testTask','renren',0,NULL,3,'2023-01-31 23:00:00'),(48,1,'testTask','renren',0,NULL,2,'2023-01-31 23:30:00'),(49,1,'testTask','renren',0,NULL,2,'2023-02-01 20:00:00'),(50,1,'testTask','renren',0,NULL,3,'2023-02-01 20:30:00'),(51,1,'testTask','renren',0,NULL,3,'2023-02-01 21:00:00'),(52,1,'testTask','renren',0,NULL,2,'2023-02-01 21:30:00'),(53,1,'testTask','renren',0,NULL,1,'2023-02-01 22:30:00'),(54,1,'testTask','renren',0,NULL,1,'2023-02-01 23:00:00'),(55,1,'testTask','renren',0,NULL,2,'2023-02-01 23:30:00'),(56,1,'testTask','renren',0,NULL,1,'2023-02-02 00:00:00'),(57,1,'testTask','renren',0,NULL,1,'2023-02-02 17:30:00'),(58,1,'testTask','renren',0,NULL,3,'2023-02-02 18:00:00'),(59,1,'testTask','renren',0,NULL,3,'2023-02-02 18:30:00'),(60,1,'testTask','renren',0,NULL,4,'2023-02-02 19:00:00'),(61,1,'testTask','renren',0,NULL,1,'2023-02-02 19:30:00'),(62,1,'testTask','renren',0,NULL,2,'2023-02-02 20:00:00'),(63,1,'testTask','renren',0,NULL,4,'2023-02-02 20:30:00'),(64,1,'testTask','renren',0,NULL,3,'2023-02-02 21:00:00'),(65,1,'testTask','renren',0,NULL,3,'2023-02-02 21:30:00'),(66,1,'testTask','renren',0,NULL,12,'2023-02-02 22:00:00'),(67,1,'testTask','renren',0,NULL,3,'2023-02-02 22:30:00'),(68,1,'testTask','renren',0,NULL,3,'2023-02-02 23:00:00'),(69,1,'testTask','renren',0,NULL,3,'2023-02-02 23:30:00'),(70,1,'testTask','renren',0,NULL,3,'2023-02-03 00:00:00'),(71,1,'testTask','renren',0,NULL,3,'2023-02-03 00:30:00'),(72,1,'testTask','renren',0,NULL,4,'2023-02-03 01:00:00'),(73,1,'testTask','renren',0,NULL,2,'2023-02-03 01:30:00'),(74,1,'testTask','renren',0,NULL,2,'2023-02-03 11:00:11'),(75,1,'testTask','renren',0,NULL,12,'2023-02-03 17:30:00'),(76,1,'testTask','renren',0,NULL,12,'2023-02-03 18:00:00'),(77,1,'testTask','renren',0,NULL,1,'2023-02-03 18:30:00'),(78,1,'testTask','renren',0,NULL,2,'2023-02-03 19:00:00'),(79,1,'testTask','renren',0,NULL,4,'2023-02-03 19:30:00'),(80,1,'testTask','renren',0,NULL,1,'2023-02-03 20:00:00'),(81,1,'testTask','renren',0,NULL,1,'2023-02-03 20:30:00'),(82,1,'testTask','renren',0,NULL,3,'2023-02-03 21:00:00'),(83,1,'testTask','renren',0,NULL,3,'2023-02-03 21:30:00'),(84,1,'testTask','renren',0,NULL,1,'2023-02-03 22:00:00'),(85,1,'testTask','renren',0,NULL,2,'2023-02-04 00:30:00'),(86,1,'testTask','renren',0,NULL,1,'2023-02-07 17:30:00'),(87,1,'testTask','renren',0,NULL,3,'2023-02-07 22:00:00'),(88,1,'testTask','renren',0,NULL,2,'2023-02-07 22:30:00'),(89,1,'testTask','renren',0,NULL,6,'2023-02-07 23:00:00'),(90,1,'testTask','renren',0,NULL,12,'2023-02-07 23:30:00'),(91,1,'testTask','renren',0,NULL,2,'2023-02-08 00:30:00'),(92,1,'testTask','renren',0,NULL,3,'2023-02-08 01:00:00'),(93,1,'testTask','renren',0,NULL,1,'2023-02-08 17:00:00'),(94,1,'testTask','renren',0,NULL,2,'2023-02-08 17:30:00'),(95,1,'testTask','renren',0,NULL,2,'2023-02-08 18:00:00'),(96,1,'testTask','renren',0,NULL,3,'2023-02-08 18:30:00'),(97,1,'testTask','renren',0,NULL,2,'2023-02-08 20:00:00'),(98,1,'testTask','renren',0,NULL,2,'2023-02-08 20:30:00'),(99,1,'testTask','renren',0,NULL,2,'2023-02-08 21:00:00'),(100,1,'testTask','renren',0,NULL,5,'2023-02-08 21:30:00'),(101,1,'testTask','renren',0,NULL,4,'2023-02-08 22:00:00'),(102,1,'testTask','renren',0,NULL,2,'2023-02-08 22:30:00');
/*!40000 ALTER TABLE `schedule_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_captcha`
--

DROP TABLE IF EXISTS `sys_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '?????????',
  `expire_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='???????????????';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_captcha`
--

LOCK TABLES `sys_captcha` WRITE;
/*!40000 ALTER TABLE `sys_captcha` DISABLE KEYS */;
INSERT INTO `sys_captcha` VALUES ('00ce0512-6506-4937-8664-8932d425f830','g5fne','2023-02-08 16:57:00'),('156892b0-9026-4fe3-835c-4ef82d683e8d','44a3w','2023-01-26 00:51:16'),('17de34d7-be65-4f01-8e31-a11bedc128a9','fcygf','2023-02-07 17:44:46'),('24a17ef4-07e3-4ce2-8e7b-ca119ce6f7e8','yy5px','2023-01-25 21:12:51'),('32649632-9523-48f2-8988-73f1fce1fb5a','3mm34','2023-01-30 17:41:44'),('3cfcbed5-8462-4997-8259-402d17f58010','ge62x','2023-02-03 17:51:49'),('3ebfe1df-40bf-4bf6-8a20-c8841c5f6041','6x26n','2023-01-25 21:00:45'),('4cb21da8-6546-480a-8ef7-dd49f4b96f16','bepmw','2023-01-26 02:47:44'),('5644cc22-bbb0-42ab-881c-058ab5d163f7','mmypp','2023-01-26 02:52:40'),('83ef8e78-ea42-47c9-81f4-d03ab5b5d969','ney48','2023-01-26 18:27:39'),('a3e54069-44ed-4fcf-8daa-3dc645187c42','a67ap','2023-01-26 02:50:54'),('a6726e1a-797b-42eb-8f9b-347f7c313cab','faeam','2023-02-01 20:20:06'),('a77b8799-190f-4bd4-8b22-0d602a63fcfa','nxdym','2023-01-31 01:19:35'),('a8548b47-f7ef-4ab1-8cd1-400e62dc75f4','bb87p','2023-01-26 02:52:48'),('aebcabdf-083f-4303-8dc9-1049605f8b88','nn78m','2023-01-25 21:14:36'),('b1aac6a4-2320-4568-89cc-988b37876d7d','a727n','2023-01-25 23:00:04'),('b467ae50-2b07-4ebe-8191-070348906264','c48d3','2023-01-25 21:11:18'),('bb8b2746-0bb7-4968-8c15-4d2269c11547','w4f3c','2023-01-26 00:39:56'),('bc384bc1-2497-4752-862f-71dd786a5d5b','5pdf4','2023-01-26 00:40:03'),('ccaf8c6a-87fe-4e44-8c61-481190bdcb7e','6bfdn','2023-01-25 21:09:29'),('d5306cac-7936-4e16-87f7-51d8ca4b5c99','acd6f','2023-01-26 02:51:17'),('e8b9f381-52c5-456f-8762-982001396486','df3my','2023-01-30 17:40:14'),('fb6178c2-6280-41ee-830c-7a25eb56e210','7e4nx','2023-02-01 20:14:00');
/*!40000 ALTER TABLE `sys_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint DEFAULT '1' COMMENT '??????   0?????????   1?????????',
  `remark` varchar(500) DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='?????????????????????';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'CLOUD_STORAGE_CONFIG_KEY','{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}',0,'?????????????????????');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '?????????',
  `operation` varchar(50) DEFAULT NULL COMMENT '????????????',
  `method` varchar(200) DEFAULT NULL COMMENT '????????????',
  `params` varchar(5000) DEFAULT NULL COMMENT '????????????',
  `time` bigint NOT NULL COMMENT '????????????(??????)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP??????',
  `create_date` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='????????????';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (24,'admin','????????????','io.renren.modules.sys.controller.SysRoleController.save()','[{\"roleId\":1,\"roleName\":\"general\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[31,32,34,49,46,50,52,51,45,48,57,40,43,58,59,60,61,53,54,55,56,-666666],\"createTime\":\"Feb 1, 2023 11:33:31 AM\"}]',123,'0:0:0:0:0:0:0:1','2023-02-01 19:33:31'),(25,'admin','????????????','io.renren.modules.sys.controller.SysUserController.save()','[{\"userId\":2,\"username\":\"general\",\"password\":\"e0ec5206da042ff7b9f910a4202fae4ed0595e6e199b72812f84e883810978b8\",\"salt\":\"eEsFg0fiqmEkoSjvWoZK\",\"email\":\"xxxxx@gmail.com\",\"mobile\":\"12345678902\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Feb 1, 2023 11:34:29 AM\"}]',50,'0:0:0:0:0:0:0:1','2023-02-01 19:34:30');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '?????????ID??????????????????0',
  `name` varchar(50) DEFAULT NULL COMMENT '????????????',
  `url` varchar(200) DEFAULT NULL COMMENT '??????URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '??????(??????????????????????????????user:list,user:create)',
  `type` int DEFAULT NULL COMMENT '??????   0?????????   1?????????   2?????????',
  `icon` varchar(50) DEFAULT NULL COMMENT '????????????',
  `order_num` int DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='????????????';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'System Management',NULL,NULL,0,'system',0),(2,1,'Administrator List','sys/user',NULL,1,'admin',1),(3,1,'Role Management','sys/role',NULL,1,'role',2),(4,1,'Menu management','sys/menu',NULL,1,'menu',3),(5,1,'SQL Monitor','http://localhost:8888/renren-fast/druid/sql.html',NULL,1,'sql',4),(6,1,'Scheduled Tasks','job/schedule',NULL,1,'job',5),(7,6,'??????',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),(8,6,'??????',NULL,'sys:schedule:save',2,NULL,0),(9,6,'??????',NULL,'sys:schedule:update',2,NULL,0),(10,6,'??????',NULL,'sys:schedule:delete',2,NULL,0),(11,6,'??????',NULL,'sys:schedule:pause',2,NULL,0),(12,6,'??????',NULL,'sys:schedule:resume',2,NULL,0),(13,6,'????????????',NULL,'sys:schedule:run',2,NULL,0),(14,6,'????????????',NULL,'sys:schedule:log',2,NULL,0),(15,2,'??????',NULL,'sys:user:list,sys:user:info',2,NULL,0),(16,2,'??????',NULL,'sys:user:save,sys:role:select',2,NULL,0),(17,2,'??????',NULL,'sys:user:update,sys:role:select',2,NULL,0),(18,2,'??????',NULL,'sys:user:delete',2,NULL,0),(19,3,'??????',NULL,'sys:role:list,sys:role:info',2,NULL,0),(20,3,'??????',NULL,'sys:role:save,sys:menu:list',2,NULL,0),(21,3,'??????',NULL,'sys:role:update,sys:menu:list',2,NULL,0),(22,3,'??????',NULL,'sys:role:delete',2,NULL,0),(23,4,'??????',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(24,4,'??????',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(25,4,'??????',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(26,4,'??????',NULL,'sys:menu:delete',2,NULL,0),(27,1,'Parameter management','sys/config','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'config',6),(29,1,'System log','sys/log','sys:log:list',1,'log',7),(30,1,'File upload','oss/oss','sys:oss:all',1,'oss',6),(31,0,'Product system','','',0,'el-icon-s-data',0),(32,31,'Category maintenance','product/category','',1,'',0),(34,31,'Brand Management','product/brand',NULL,1,'',NULL),(40,0,'Order system','','',0,'config',1),(43,40,'Order Management','order/order','',1,'el-icon-tickets',0),(45,51,'SPU Management','product/spu','',1,'',0),(46,49,'Basic Attributes','product/baseattr','',1,'',0),(48,51,'Add Product','product/spuadd','',1,'',0),(49,31,'Product attributes',NULL,NULL,0,NULL,NULL),(50,49,'Sales attributes','product/saleattr',NULL,1,NULL,NULL),(51,31,'Product Info',NULL,NULL,0,'zonghe',NULL),(52,49,'Attribute groups','product/attrgroup','',1,'',0),(53,40,'Payment  Management','order/payment',NULL,1,NULL,2),(54,40,'Refund  Management','order/refund',NULL,1,NULL,3),(56,40,'Refund Reason','order/orderreturnreason',NULL,1,NULL,4),(57,51,'SKU Management','product/manager',NULL,1,NULL,NULL),(58,43,'??????',NULL,'order:order:list,order:order:info',2,NULL,6),(59,43,'??????',NULL,'order:order:save',2,NULL,6),(60,43,'??????',NULL,'order:order:update',2,NULL,6),(61,43,'??????',NULL,'order:order:delete',2,NULL,6);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_bak`
--

DROP TABLE IF EXISTS `sys_menu_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu_bak` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '?????????ID??????????????????0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '????????????',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '??????URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '??????(??????????????????????????????user:list,user:create)',
  `type` int DEFAULT NULL COMMENT '??????   0?????????   1?????????   2?????????',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '????????????',
  `order_num` int DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='????????????';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_bak`
--

LOCK TABLES `sys_menu_bak` WRITE;
/*!40000 ALTER TABLE `sys_menu_bak` DISABLE KEYS */;
INSERT INTO `sys_menu_bak` VALUES (1,0,'System Management',NULL,NULL,0,'system',0),(2,1,'Administrator List','sys/user',NULL,1,'admin',1),(3,1,'Role Management','sys/role',NULL,1,'role',2),(4,1,'Menu management','sys/menu',NULL,1,'menu',3),(5,1,'SQL Monitor','http://localhost:8888/renren-fast/druid/sql.html',NULL,1,'sql',4),(6,1,'Scheduled Tasks','job/schedule',NULL,1,'job',5),(7,6,'??????',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),(8,6,'??????',NULL,'sys:schedule:save',2,NULL,0),(9,6,'??????',NULL,'sys:schedule:update',2,NULL,0),(10,6,'??????',NULL,'sys:schedule:delete',2,NULL,0),(11,6,'??????',NULL,'sys:schedule:pause',2,NULL,0),(12,6,'??????',NULL,'sys:schedule:resume',2,NULL,0),(13,6,'????????????',NULL,'sys:schedule:run',2,NULL,0),(14,6,'????????????',NULL,'sys:schedule:log',2,NULL,0),(15,2,'??????',NULL,'sys:user:list,sys:user:info',2,NULL,0),(16,2,'??????',NULL,'sys:user:save,sys:role:select',2,NULL,0),(17,2,'??????',NULL,'sys:user:update,sys:role:select',2,NULL,0),(18,2,'??????',NULL,'sys:user:delete',2,NULL,0),(19,3,'??????',NULL,'sys:role:list,sys:role:info',2,NULL,0),(20,3,'??????',NULL,'sys:role:save,sys:menu:list',2,NULL,0),(21,3,'??????',NULL,'sys:role:update,sys:menu:list',2,NULL,0),(22,3,'??????',NULL,'sys:role:delete',2,NULL,0),(23,4,'??????',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(24,4,'??????',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(25,4,'??????',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(26,4,'??????',NULL,'sys:menu:delete',2,NULL,0),(27,1,'Parameter management','sys/config','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'config',6),(29,1,'System log','sys/log','sys:log:list',1,'log',7),(30,1,'File upload','oss/oss','sys:oss:all',1,'oss',6),(31,0,'Product system','','',0,'tubiao',0),(32,31,'Category maintenance','product/category','',1,'',0),(34,31,'Brand Management','product/brand',NULL,1,'',NULL),(40,0,'Order system','','',0,'config',0),(43,40,'Order Management','order/order','',1,'',0),(45,51,'SPU Management','product/spu','',1,'',0),(46,49,'Basic Attributes','product/baseattr','',1,'',0),(48,51,'Add Product','product/spuadd','',1,'',0),(49,31,'Product attributes',NULL,NULL,0,NULL,NULL),(50,49,'Sales attributes','product/saleattr',NULL,1,NULL,NULL),(51,31,'Product Info',NULL,NULL,0,'zonghe',NULL),(52,49,'Attribute groups','product/attrgroup','',1,'',0),(53,40,'Payment Search','order/payment',NULL,1,NULL,NULL),(54,40,'Refund Search','order/refund',NULL,1,NULL,NULL),(55,40,'Grade Rules','order/settings',NULL,1,NULL,NULL),(56,40,'Returns processing','order/return',NULL,1,NULL,NULL),(57,51,'SKU Management','product/manager',NULL,1,NULL,NULL),(58,43,'??????',NULL,'order:order:list,order:order:info',2,NULL,6),(59,43,'??????',NULL,'order:order:save',2,NULL,6),(60,43,'??????',NULL,'order:order:update',2,NULL,6),(61,43,'??????',NULL,'order:order:delete',2,NULL,6);
/*!40000 ALTER TABLE `sys_menu_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss`
--

DROP TABLE IF EXISTS `sys_oss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL??????',
  `create_date` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='????????????';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss`
--

LOCK TABLES `sys_oss` WRITE;
/*!40000 ALTER TABLE `sys_oss` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '????????????',
  `remark` varchar(100) DEFAULT NULL COMMENT '??????',
  `create_user_id` bigint DEFAULT NULL COMMENT '?????????ID',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='??????';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'general','',1,'2023-02-01 19:33:31');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '??????ID',
  `menu_id` bigint DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='???????????????????????????';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1,1,31),(2,1,32),(3,1,34),(4,1,49),(5,1,46),(6,1,50),(7,1,52),(8,1,51),(9,1,45),(10,1,48),(11,1,57),(12,1,40),(13,1,43),(14,1,58),(15,1,59),(16,1,60),(17,1,61),(18,1,53),(19,1,54),(20,1,55),(21,1,56),(22,1,-666666);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '?????????',
  `password` varchar(100) DEFAULT NULL COMMENT '??????',
  `salt` varchar(20) DEFAULT NULL COMMENT '???',
  `email` varchar(100) DEFAULT NULL COMMENT '??????',
  `mobile` varchar(100) DEFAULT NULL COMMENT '?????????',
  `status` tinyint DEFAULT NULL COMMENT '??????  0?????????   1?????????',
  `create_user_id` bigint DEFAULT NULL COMMENT '?????????ID',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='????????????';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','root@renren.io','13612345678',1,1,'2016-11-11 11:11:11'),(2,'general','e0ec5206da042ff7b9f910a4202fae4ed0595e6e199b72812f84e883810978b8','eEsFg0fiqmEkoSjvWoZK','xxxxx@gmail.com','12345678902',1,1,'2023-02-01 19:34:30');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '??????ID',
  `role_id` bigint DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='???????????????????????????';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,2,1);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_token`
--

DROP TABLE IF EXISTS `sys_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_token` (
  `user_id` bigint NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='????????????Token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_token`
--

LOCK TABLES `sys_user_token` WRITE;
/*!40000 ALTER TABLE `sys_user_token` DISABLE KEYS */;
INSERT INTO `sys_user_token` VALUES (1,'eb05970d41ece5de8e566fa3e0d6c0d5','2023-02-09 10:26:57','2023-02-08 22:26:57'),(2,'415590982c9e5b9f321eb128a23f2a0e','2023-02-04 12:04:22','2023-02-04 00:04:22');
/*!40000 ALTER TABLE `sys_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '?????????',
  `mobile` varchar(20) NOT NULL COMMENT '?????????',
  `password` varchar(64) DEFAULT NULL COMMENT '??????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='??????';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'mark','13612345678','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','2017-03-23 22:37:41');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-08 14:50:43
