DROP DATABASE IF EXISTS `banking_transaction`;
CREATE DATABASE `banking_transaction`;
use `banking_transaction`;
--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, 
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(12,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rfbvkrffamfql7cjmen8v976v` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;

CREATE TABLE `deposits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(12,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjs92lljr0s0ns05eip5oitkni` (`customer_id`),
CONSTRAINT `FKjs92lljr0s0ns05eip5oitkni` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;

CREATE TABLE `transfers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `fees` int(11) NOT NULL,
  `fees_amount` decimal(12,0) NOT NULL,
  `transaction_amount` decimal(12,0) NOT NULL,
  `transfer_amount` decimal(12,0) NOT NULL,
  `recipient_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk3hx2mycbqj5wo0r21toog320` (`recipient_id`),
  KEY `FKi9ytbf7yb0unoomysw7rugr72` (`sender_id`),
CONSTRAINT `FKi9ytbf7yb0unoomysw7rugr72` FOREIGN KEY (`sender_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKk3hx2mycbqj5wo0r21toog320` FOREIGN KEY (`recipient_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `withdraws`
--

DROP TABLE IF EXISTS `withdraws`;

CREATE TABLE `withdraws` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(12,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8kyh1dt0vp46wslywn1dah2h9` (`customer_id`),
CONSTRAINT `FK8kyh1dt0vp46wslywn1dah2h9` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- insert table

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (id,full_name,email,phone,address,balance) VALUES
(1,'Doloribus laborum il','duzyqagahi@mailinator.com','+1 (483) 202-2127','Rosalyn Howe',0),
(2,'Ex fugit exercitati','wijacab@mailinator.com','+1 (596) 452-9922','Moses Meadows',2900),
(3,'Dolore officia eaque','tusiger@mailinator.com','+1 (581) 924-7822','Imogene Dixon',1000),
(4,'Blanditiis occaecat ','putam@mailinator.com','+1 (746) 439-7553','Maxwell Pennington',0),
(5,'Dignissimos amet ne','sirekel@mailinator.com','+1 (881) 121-2407','Garrison George',2990),
(6,'Magni aut sint eos ','bagukyrezy@mailinator.com','+1 (989) 281-9342','Irene Nolan',100),
(7,'Quam eum reiciendis ','lemiliwub@mailinator.com','+1 (125) 607-7363','Joseph Davidson',0),
(8,'Nihil debitis exerci','zywax@mailinator.com','+1 (752) 233-4897','Noelle Clark',1000),
(9,'Repellendus At volu','seximoliwi@mailinator.com','+1 (121) 958-8876','Hall Guy',5900),
(10,'Incididunt voluptas ','pabevigu@mailinator.com','+1 (892) 613-2085','Garrett Alvarez',0),
(11,'Dicta neque eius dic','dahabemo@mailinator.com','+1 (921) 747-7892','Rogan Williamson',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
INSERT INTO `deposits` VALUES 
(1,'2021-09-02 20:10:15',NULL,0,'2021-09-02 20:10:15',NULL,1,10000),
(2,'2021-09-02 21:58:14',NULL,0,'2021-09-02 21:58:14',NULL,1,1000),
(3,'2021-09-03 01:12:26',NULL,0,'2021-09-03 01:12:26',NULL,3,1100),
(4,'2021-09-03 01:17:51',NULL,0,'2021-09-03 01:17:51',NULL,5,1100),
(5,'2021-09-03 02:15:29',NULL,0,'2021-09-03 02:15:29',NULL,5,1000),
(6,'2021-09-03 12:24:45',NULL,0,'2021-09-03 12:24:45',NULL,8,1000),
(7,'2021-09-03 12:48:47',NULL,0,'2021-09-03 12:48:47',NULL,5,1000),
(8,'2021-09-03 12:52:37',NULL,0,'2021-09-03 12:52:37',NULL,1,1000),
(9,'2021-09-03 12:53:16',NULL,0,'2021-09-03 12:53:16',NULL,9,100);
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `withdraws`
--

LOCK TABLES `withdraws` WRITE;
/*!40000 ALTER TABLE `withdraws` DISABLE KEYS */;
INSERT INTO `withdraws` VALUES 
(1,'2021-09-03 12:25:30',NULL,0,'2021-09-03 12:25:30',NULL,8,1000),
(2,'2021-09-03 12:26:44',NULL,0,'2021-09-03 12:26:44',NULL,8,1000),
(3,'2021-09-03 12:29:44',NULL,0,'2021-09-03 12:29:44',NULL,3,100),
(4,'2021-09-03 12:32:27',NULL,0,'2021-09-03 12:32:27',NULL,3,1000),
(5,'2021-09-03 12:48:40',NULL,0,'2021-09-03 12:48:40',NULL,5,1000),
(6,'2021-09-03 12:52:51',NULL,0,'2021-09-03 12:52:51',NULL,9,2000);
/*!40000 ALTER TABLE `withdraws` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
INSERT INTO `transfers` VALUES 
(1,'2021-09-02 20:10:26',NULL,0,'2021-09-02 20:10:26',NULL,10,100,1100,1000,2,1),
(2,'2021-09-02 20:10:28',NULL,0,'2021-09-02 20:10:28',NULL,10,100,1100,1000,2,1),
(3,'2021-09-02 21:58:50',NULL,0,'2021-09-02 21:58:50',NULL,10,200,2200,2000,2,1),
(4,'2021-09-02 22:08:13',NULL,0,'2021-09-02 22:08:13',NULL,10,100,1100,1000,5,1),
(5,'2021-09-02 22:08:32',NULL,0,'2021-09-02 22:08:32',NULL,10,10,110,100,6,5),
(6,'2021-09-03 00:51:39',NULL,0,'2021-09-03 00:51:39',NULL,10,100,1100,1000,3,2),
(7,'2021-09-03 11:41:56',NULL,0,'2021-09-03 11:41:56',NULL,10,100,1100,1000,8,9),
(8,'2021-09-03 12:53:04',NULL,0,'2021-09-03 12:53:04',NULL,10,100,1100,1000,8,9);
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;

-- drop key

/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40000 ALTER TABLE `withdraws` ENABLE KEYS */;
UNLOCK TABLES;
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;