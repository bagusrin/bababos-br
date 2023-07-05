# ************************************************************
# Sequel Ace SQL dump
# Version 20046
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 8.0.27)
# Database: db_bababos
# Generation Time: 2023-07-05 20:20:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can view log entry',1,'view_logentry'),
	(5,'Can add permission',2,'add_permission'),
	(6,'Can change permission',2,'change_permission'),
	(7,'Can delete permission',2,'delete_permission'),
	(8,'Can view permission',2,'view_permission'),
	(9,'Can add group',3,'add_group'),
	(10,'Can change group',3,'change_group'),
	(11,'Can delete group',3,'delete_group'),
	(12,'Can view group',3,'view_group'),
	(13,'Can add user',4,'add_user'),
	(14,'Can change user',4,'change_user'),
	(15,'Can delete user',4,'delete_user'),
	(16,'Can view user',4,'view_user'),
	(17,'Can add content type',5,'add_contenttype'),
	(18,'Can change content type',5,'change_contenttype'),
	(19,'Can delete content type',5,'delete_contenttype'),
	(20,'Can view content type',5,'view_contenttype'),
	(21,'Can add session',6,'add_session'),
	(22,'Can change session',6,'change_session'),
	(23,'Can delete session',6,'delete_session'),
	(24,'Can view session',6,'view_session'),
	(25,'Can add Token',7,'add_token'),
	(26,'Can change Token',7,'change_token'),
	(27,'Can delete Token',7,'delete_token'),
	(28,'Can view Token',7,'view_token'),
	(29,'Can add token',8,'add_tokenproxy'),
	(30,'Can change token',8,'change_tokenproxy'),
	(31,'Can delete token',8,'delete_tokenproxy'),
	(32,'Can view token',8,'view_tokenproxy'),
	(33,'Can add customer',9,'add_customer'),
	(34,'Can change customer',9,'change_customer'),
	(35,'Can delete customer',9,'delete_customer'),
	(36,'Can view customer',9,'view_customer'),
	(37,'Can add fleet',10,'add_fleet'),
	(38,'Can change fleet',10,'change_fleet'),
	(39,'Can delete fleet',10,'delete_fleet'),
	(40,'Can view fleet',10,'view_fleet'),
	(41,'Can add order',11,'add_order'),
	(42,'Can change order',11,'change_order'),
	(43,'Can delete order',11,'delete_order'),
	(44,'Can view order',11,'view_order'),
	(45,'Can add product',12,'add_product'),
	(46,'Can change product',12,'change_product'),
	(47,'Can delete product',12,'delete_product'),
	(48,'Can view product',12,'view_product'),
	(49,'Can add rfq',13,'add_rfq'),
	(50,'Can change rfq',13,'change_rfq'),
	(51,'Can delete rfq',13,'delete_rfq'),
	(52,'Can view rfq',13,'view_rfq'),
	(53,'Can add supplier',14,'add_supplier'),
	(54,'Can change supplier',14,'change_supplier'),
	(55,'Can delete supplier',14,'delete_supplier'),
	(56,'Can view supplier',14,'view_supplier'),
	(57,'Can add shipping cost',15,'add_shippingcost'),
	(58,'Can change shipping cost',15,'change_shippingcost'),
	(59,'Can delete shipping cost',15,'delete_shippingcost'),
	(60,'Can view shipping cost',15,'view_shippingcost'),
	(61,'Can add rfq item',16,'add_rfqitem'),
	(62,'Can change rfq item',16,'change_rfqitem'),
	(63,'Can delete rfq item',16,'delete_rfqitem'),
	(64,'Can view rfq item',16,'view_rfqitem'),
	(65,'Can add pricelist',17,'add_pricelist'),
	(66,'Can change pricelist',17,'change_pricelist'),
	(67,'Can delete pricelist',17,'delete_pricelist'),
	(68,'Can view pricelist',17,'view_pricelist'),
	(69,'Can add order item',18,'add_orderitem'),
	(70,'Can change order item',18,'change_orderitem'),
	(71,'Can delete order item',18,'delete_orderitem'),
	(72,'Can view order item',18,'view_orderitem');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`)
VALUES
	(1,'pbkdf2_sha256$600000$Fo5SZcFVz4HWRsM9VnN1QT$4uK+NtNl7JuSBRHhP+/UN0k/1mgJHDGMxLwGFcyqNJ0=',NULL,1,'bagus','','','bagusrin.xyz@gmail.com',1,1,'2023-07-05 20:19:11.127187');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table authtoken_token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authtoken_token`;

CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `state` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;

INSERT INTO `customers` (`id`, `created_at`, `updated_at`, `deleted_at`, `code`, `address`, `city`, `state`)
VALUES
	(1,'2023-06-26 16:30:37.522388','2023-06-26 16:30:37.522549',NULL,'M1-ABDI-11','Taman Sari, Kec. Setu','Bekasi','Jawa Barat'),
	(2,'2023-06-26 17:02:34.269769','2023-06-26 17:02:34.269846',NULL,'M1-PUMS-11','Gunung Sindur','Bogor','Jawa Barat'),
	(3,'2023-06-26 17:03:02.058090','2023-06-26 17:03:02.058178',NULL,'M1-STQI-11','Kel. Rorotan- Cilincing','Jakarta Utara','DKI Jakarta'),
	(4,'2023-06-26 17:03:38.647045','2023-06-26 17:03:38.647127',NULL,'M1-SUGP-11','Gn. Putri Kec. Gn. Putri','Bekasi','Jawa Barat'),
	(5,'2023-06-26 17:03:51.491191','2023-06-26 17:03:51.491224',NULL,'M1-SURA-11','Padurenan, Mustika Jaya','Bekasi','Jawa Barat');

/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(3,'auth','group'),
	(2,'auth','permission'),
	(4,'auth','user'),
	(7,'authtoken','token'),
	(8,'authtoken','tokenproxy'),
	(5,'contenttypes','contenttype'),
	(9,'db','customer'),
	(10,'db','fleet'),
	(11,'db','order'),
	(18,'db','orderitem'),
	(17,'db','pricelist'),
	(12,'db','product'),
	(13,'db','rfq'),
	(16,'db','rfqitem'),
	(15,'db','shippingcost'),
	(14,'db','supplier'),
	(6,'sessions','session');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'contenttypes','0001_initial','2023-07-04 16:11:46.335396'),
	(2,'auth','0001_initial','2023-07-04 16:11:46.704631'),
	(3,'admin','0001_initial','2023-07-04 16:11:46.770413'),
	(4,'admin','0002_logentry_remove_auto_add','2023-07-04 16:11:46.784113'),
	(5,'admin','0003_logentry_add_action_flag_choices','2023-07-04 16:11:46.793153'),
	(6,'contenttypes','0002_remove_content_type_name','2023-07-04 16:11:46.841675'),
	(7,'auth','0002_alter_permission_name_max_length','2023-07-04 16:11:46.864077'),
	(8,'auth','0003_alter_user_email_max_length','2023-07-04 16:11:46.875952'),
	(9,'auth','0004_alter_user_username_opts','2023-07-04 16:11:46.886104'),
	(10,'auth','0005_alter_user_last_login_null','2023-07-04 16:11:46.909287'),
	(11,'auth','0006_require_contenttypes_0002','2023-07-04 16:11:46.910635'),
	(12,'auth','0007_alter_validators_add_error_messages','2023-07-04 16:11:46.915777'),
	(13,'auth','0008_alter_user_username_max_length','2023-07-04 16:11:46.948306'),
	(14,'auth','0009_alter_user_last_name_max_length','2023-07-04 16:11:46.965508'),
	(15,'auth','0010_alter_group_name_max_length','2023-07-04 16:11:46.975813'),
	(16,'auth','0011_update_proxy_permissions','2023-07-04 16:11:46.980099'),
	(17,'auth','0012_alter_user_first_name_max_length','2023-07-04 16:11:47.020412'),
	(18,'authtoken','0001_initial','2023-07-04 16:11:47.035959'),
	(19,'authtoken','0002_auto_20160226_1747','2023-07-04 16:11:47.047081'),
	(20,'authtoken','0003_tokenproxy','2023-07-04 16:11:47.048560'),
	(21,'db','0001_initial','2023-07-04 16:11:47.245975'),
	(22,'sessions','0001_initial','2023-07-04 16:11:47.258309'),
	(23,'db','0002_remove_rfqitem_product_remove_rfqitem_rfq_and_more','2023-07-05 01:13:15.785396'),
	(24,'db','0003_orderitem_supplier','2023-07-05 04:40:57.128280'),
	(25,'db','0004_order_total_product_amount_and_more','2023-07-05 15:59:26.432376');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table fleets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fleets`;

CREATE TABLE `fleets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `capacity` int NOT NULL,
  `unit` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `fleets` WRITE;
/*!40000 ALTER TABLE `fleets` DISABLE KEYS */;

INSERT INTO `fleets` (`id`, `created_at`, `updated_at`, `deleted_at`, `type`, `capacity`, `unit`)
VALUES
	(1,'2023-06-28 01:13:07.635887','2023-06-28 01:13:07.635910',NULL,'Fuso',8,'Ton'),
	(2,'2023-06-28 01:13:20.007930','2023-06-28 01:13:20.007976',NULL,'Tronton',22,'Ton');

/*!40000 ALTER TABLE `fleets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_items`;

CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `qty` int NOT NULL,
  `unit` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `unit_selling_price` double NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `supplier_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_412ad78b_fk_orders_id` (`order_id`),
  KEY `order_items_product_id_dd557d5a_fk_products_id` (`product_id`),
  KEY `order_items_supplier_id_ce130c11_fk_suppliers_id` (`supplier_id`),
  CONSTRAINT `order_items_order_id_412ad78b_fk_orders_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_product_id_dd557d5a_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `order_items_supplier_id_ce130c11_fk_suppliers_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;

INSERT INTO `order_items` (`id`, `created_at`, `updated_at`, `deleted_at`, `qty`, `unit`, `unit_selling_price`, `order_id`, `product_id`, `supplier_id`)
VALUES
	(1,'2023-07-05 17:02:02.495274','2023-07-05 17:02:02.495301',NULL,11,'',2362162.1616,1,1,2),
	(2,'2023-07-05 17:02:02.495335','2023-07-05 17:02:02.495343',NULL,6,'',2833333.75,1,2,2),
	(3,'2023-07-05 17:11:12.604827','2023-07-05 17:11:12.604873',NULL,30,'',227026.8,2,10,8),
	(4,'2023-07-05 17:16:41.453400','2023-07-05 17:16:41.453461',NULL,100,'',911711.7116800001,3,3,5),
	(5,'2023-07-05 18:34:42.825806','2023-07-05 18:34:42.825870',NULL,24,'',760540.54056,4,13,2),
	(6,'2023-07-05 18:35:35.124446','2023-07-05 18:35:35.124509',NULL,75,'',217567.35,5,10,8),
	(7,'2023-07-05 18:36:34.519112','2023-07-05 18:36:34.519149',NULL,8,'',405968.75,6,11,2);

/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `order_date` datetime(6) DEFAULT NULL,
  `total_amount` double NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_id` bigint NOT NULL,
  `order_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quotation_date` datetime(6) DEFAULT NULL,
  `quotation_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_product_amount` double DEFAULT NULL,
  `total_shipping_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_customer_id_b7016332_fk_customers_id` (`customer_id`),
  CONSTRAINT `orders_customer_id_b7016332_fk_customers_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `deleted_at`, `order_date`, `total_amount`, `status`, `customer_id`, `order_no`, `quotation_date`, `quotation_no`, `total_product_amount`, `total_shipping_amount`)
VALUES
	(1,'2023-07-05 17:02:02.472832','2023-07-05 20:01:47.899698',NULL,'2023-07-05 20:01:47.899691',6995495.9116,'ordered',1,'5e8a3d2f-0656-4e83-a1a8-10655fdcd58d','2023-07-05 17:02:02.472877','c3da6a98-0d9a-48e8-a203-e988baa3792f',5195495.9116,1800000),
	(2,'2023-07-05 17:11:12.599695','2023-07-05 17:11:12.599756',NULL,NULL,2027026.8,'quotation',4,NULL,'2023-07-05 17:11:12.599815','452d1f84-34bb-4156-bf37-feb63da4dd5d',227026.8,1800000),
	(3,'2023-07-05 17:16:41.432207','2023-07-05 17:16:41.432268',NULL,NULL,2511711.71168,'quotation',3,NULL,'2023-07-05 17:16:41.432328','0b81f483-5bbe-4bd8-893d-033a439faf88',911711.7116800001,1600000),
	(4,'2023-07-05 18:34:42.814523','2023-07-05 18:34:42.814939',NULL,NULL,2660540.54056,'quotation',2,NULL,'2023-07-05 18:34:42.815019','e781235e-1830-4c99-872f-598ef3f2fc57',760540.54056,1900000),
	(5,'2023-07-05 18:35:35.119687','2023-07-05 18:35:35.119727',NULL,NULL,2117567.35,'quotation',2,NULL,'2023-07-05 18:35:35.119791','a0303175-626e-428e-8539-1e12de8a9ad4',217567.35,1900000),
	(6,'2023-07-05 18:36:34.515188','2023-07-05 19:04:11.428317',NULL,'2023-07-05 19:04:11.428310',2305968.75,'ordered',2,'58242adb-0235-454f-b874-ba052ba4edbb','2023-07-05 18:36:34.515292','b846b815-1903-4b26-96e0-4d00c7b38f83',405968.75,1900000);

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pricelists
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricelists`;

CREATE TABLE `pricelists` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `price` double NOT NULL,
  `unit` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `stock` int NOT NULL,
  `product_id` bigint NOT NULL,
  `supplier_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pricelists_product_id_4ec47957_fk_products_id` (`product_id`),
  KEY `pricelists_supplier_id_2b21b8d7_fk_suppliers_id` (`supplier_id`),
  CONSTRAINT `pricelists_product_id_4ec47957_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `pricelists_supplier_id_2b21b8d7_fk_suppliers_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `pricelists` WRITE;
/*!40000 ALTER TABLE `pricelists` DISABLE KEYS */;

INSERT INTO `pricelists` (`id`, `created_at`, `updated_at`, `deleted_at`, `price`, `unit`, `stock`, `product_id`, `supplier_id`)
VALUES
	(1,'2023-07-04 07:40:08.400878','2023-07-04 07:40:08.400936',NULL,5596216.216,'',200,18,6),
	(2,'2023-07-04 08:11:24.541032','2023-07-04 08:11:24.541096',NULL,1789729.73,'',200,19,6),
	(3,'2023-07-04 08:11:49.922512','2023-07-04 08:11:49.922557',NULL,2390540.541,'',200,20,6),
	(4,'2023-07-04 08:12:05.958112','2023-07-04 08:12:05.958156',NULL,3008783.784,'',200,21,6),
	(5,'2023-07-04 08:12:46.772752','2023-07-04 08:12:46.772806',NULL,3640765.766,'',200,22,6),
	(6,'2023-07-04 08:13:09.347011','2023-07-04 08:13:09.347037',NULL,1066572.973,'',200,16,6),
	(7,'2023-07-04 08:13:25.405695','2023-07-04 08:13:25.405754',NULL,1540090.09,'',200,14,6),
	(8,'2023-07-04 08:13:48.923355','2023-07-04 08:13:48.923425',NULL,166129.7297,'',200,9,6),
	(9,'2023-07-04 08:14:07.646841','2023-07-04 08:14:07.646873',NULL,259720.7207,'',200,10,6),
	(10,'2023-07-04 08:14:26.009749','2023-07-04 08:14:26.009788',NULL,372075.6757,'',200,11,6),
	(11,'2023-07-04 08:14:39.276921','2023-07-04 08:14:39.276966',NULL,506627.027,'',200,12,6),
	(12,'2023-07-04 08:15:23.793051','2023-07-04 08:15:23.793118',NULL,1559459.459,'',200,23,2),
	(13,'2023-07-04 08:15:40.056813','2023-07-04 08:15:40.056849',NULL,2727027.027,'',200,24,2),
	(14,'2023-07-04 08:15:55.969424','2023-07-04 08:15:55.969480',NULL,4163063.063,'',200,15,2),
	(15,'2023-07-04 08:16:11.307816','2023-07-04 08:16:11.307878',NULL,3544144.144,'',200,22,2),
	(16,'2023-07-04 08:16:29.939951','2023-07-04 08:16:29.939987',NULL,990990.991,'',200,16,2),
	(17,'2023-07-04 08:16:44.221971','2023-07-04 08:16:44.222006',NULL,1447747.748,'',200,14,2),
	(18,'2023-07-04 08:17:08.811382','2023-07-04 08:17:08.811436',NULL,143694,'',200,9,2),
	(19,'2023-07-04 08:17:31.683294','2023-07-04 08:17:31.683325',NULL,324775,'',200,11,2),
	(20,'2023-07-04 08:17:55.874653','2023-07-04 08:17:55.874732',NULL,443243,'',200,12,2),
	(21,'2023-07-04 08:18:06.662270','2023-07-04 08:18:06.662361',NULL,633783.7838,'',200,13,2),
	(22,'2023-07-04 08:18:45.741795','2023-07-04 08:18:45.741849',NULL,804504.5045,'',200,25,2),
	(23,'2023-07-04 08:19:20.011152','2023-07-04 08:19:20.011212',NULL,2266667,'',200,2,2),
	(24,'2023-07-04 08:19:33.805721','2023-07-04 08:19:33.805841',NULL,518919,'',200,4,2),
	(25,'2023-07-04 08:19:46.107929','2023-07-04 08:19:46.107978',NULL,582702.7027,'',200,5,2),
	(26,'2023-07-04 08:20:04.216131','2023-07-04 08:20:04.216167',NULL,1968468.468,'',200,1,2),
	(27,'2023-07-04 08:20:38.918740','2023-07-04 08:20:38.919929',NULL,4387387.387,'',200,2,5),
	(28,'2023-07-04 08:20:54.236729','2023-07-04 08:20:54.236758',NULL,828828.8288,'',200,3,5),
	(29,'2023-07-04 08:21:09.494183','2023-07-04 08:21:09.494243',NULL,400900.9009,'',200,6,5),
	(30,'2023-07-04 08:21:35.489173','2023-07-04 08:21:35.489232',NULL,504504.5045,'',200,7,1),
	(31,'2023-07-04 08:21:58.089156','2023-07-04 08:21:58.089184',NULL,627027.027,'',200,8,1),
	(32,'2023-07-04 08:22:25.530734','2023-07-04 08:22:25.530804',NULL,788288.2883,'',200,26,3),
	(33,'2023-07-04 08:23:11.153696','2023-07-04 08:23:11.153762',NULL,855855.8559,'',200,27,3),
	(34,'2023-07-04 08:23:34.780641','2023-07-04 08:23:34.780676',NULL,1576767.568,'',200,16,3),
	(35,'2023-07-04 08:23:49.713902','2023-07-04 08:23:49.713953',NULL,2366674.775,'',200,14,3),
	(36,'2023-07-04 08:33:59.463818','2023-07-04 08:33:59.463878',NULL,151577.4775,'',200,9,7),
	(37,'2023-07-04 08:34:35.487673','2023-07-04 08:34:35.487732',NULL,475662.1622,'',200,10,7),
	(38,'2023-07-04 08:35:03.111501','2023-07-04 08:35:03.111573',NULL,687067.5676,'',200,11,8),
	(39,'2023-07-04 08:35:19.598584','2023-07-04 08:35:19.598758',NULL,468262.1622,'',200,12,8),
	(40,'2023-07-04 08:35:40.173872','2023-07-04 08:35:40.173907',NULL,1233198.198,'',200,13,8),
	(41,'2023-07-04 08:35:55.094047','2023-07-04 08:35:55.094081',NULL,7040000,'',200,17,8),
	(42,'2023-07-04 08:36:11.834999','2023-07-04 08:36:11.835027',NULL,9864865,'',200,28,8),
	(43,'2023-07-04 08:36:28.968175','2023-07-04 08:36:28.968258',NULL,189189,'',200,10,8),
	(44,'2023-07-04 08:36:45.393963','2023-07-04 08:36:45.393991',NULL,1261261.261,'',200,14,8),
	(45,'2023-07-04 08:37:01.553386','2023-07-04 08:37:01.553445',NULL,144144.1441,'',200,9,8),
	(46,'2023-07-04 08:37:22.783076','2023-07-04 08:37:22.783138',NULL,189189.1892,'',200,10,4);

/*!40000 ALTER TABLE `pricelists` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `sku` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `unit` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `deleted_at`, `sku`, `name`, `unit`)
VALUES
	(1,'2023-06-28 00:42:38.685321','2023-06-28 00:42:38.685481',NULL,'UNP-120','Industri Bangunan','Batang'),
	(2,'2023-06-28 00:43:34.363526','2023-06-28 00:43:34.363587',NULL,'UNP-200','Industri Bangunan','Batang'),
	(3,'2023-06-28 00:47:11.073627','2023-06-28 00:47:11.073651',NULL,'PLT-BRDS0230','Industri Farmasi','Lembar'),
	(4,'2023-06-28 00:47:23.722177','2023-06-28 00:47:23.722229',NULL,'PLT-SPHC0155','Industri Farmasi','Lembar'),
	(5,'2023-06-28 00:47:32.102825','2023-06-28 00:47:32.102844',NULL,'PLT-SPHC0180','Industri Farmasi','Lembar'),
	(6,'2023-06-28 00:47:40.709106','2023-06-28 00:47:40.709129',NULL,'PLT-SPHC0120','Industri Farmasi','Lembar'),
	(7,'2023-06-28 00:47:49.772996','2023-06-28 00:47:49.773051',NULL,'PLT-SPHC0150','Industri Farmasi','Lembar'),
	(8,'2023-06-28 00:47:59.370913','2023-06-28 00:47:59.370965',NULL,'PLT-SPHC0200','Industri Farmasi','Lembar'),
	(9,'2023-06-28 00:48:07.638164','2023-06-28 00:48:07.638189',NULL,'SIK-040040-IBB','Industri Bangunan','Batang'),
	(10,'2023-06-28 00:48:16.404392','2023-06-28 00:48:16.404433',NULL,'SIK-050050-IBB','Industri Bangunan','Batang'),
	(11,'2023-06-28 00:48:50.365807','2023-06-28 00:48:50.365856',NULL,'SIK-060060-IBB','Industri Bangunan','Batang'),
	(12,'2023-06-28 00:49:35.118901','2023-06-28 00:49:35.118991',NULL,'SIK-070070-IBB','Industri Bangunan','Batang'),
	(13,'2023-06-28 00:49:46.219622','2023-06-28 00:49:46.219667',NULL,'SIK-080080-IBB','Industri Bangunan','Batang'),
	(14,'2023-06-28 00:49:54.565237','2023-06-28 00:49:54.565332',NULL,'SIK-120120-IBB','Industri Bangunan','Batang'),
	(15,'2023-06-28 00:50:09.962519','2023-06-28 00:50:09.962565',NULL,'PIP-SCH4080','Industri Bangunan','Batang'),
	(16,'2023-06-28 00:50:17.222656','2023-06-28 00:50:17.222675',NULL,'SIK-100100-IBB','Industri Bangunan','Batang'),
	(17,'2023-06-28 00:50:58.244036','2023-06-28 00:50:58.244085',NULL,'WFL-300-GG','Industri Bangunan','Batang'),
	(18,'2023-07-04 05:50:14.455357','2023-07-04 05:50:14.455497',NULL,'PLT-SPHC1000','Industri Farmasi','Lembar'),
	(19,'2023-07-04 08:01:29.920544','2023-07-04 08:01:29.920621',NULL,'PLT-SPHC0400','Industri Farmasi','Lembar'),
	(20,'2023-07-04 08:03:28.671584','2023-07-04 08:03:28.671663',NULL,'PLT-SPHC0500','Industri Farmasi','Lembar'),
	(21,'2023-07-04 08:03:50.335004','2023-07-04 08:03:50.335039',NULL,'PLT-SPHC0600','Industri Farmasi','Lembar'),
	(22,'2023-07-04 08:04:00.141462','2023-07-04 08:04:00.141541',NULL,'PLT-SPHC1200-GG','Industri Farmasi','Lembar'),
	(23,'2023-07-04 08:06:16.241494','2023-07-04 08:06:16.241555',NULL,'PIP-SCH404','Industri Bangunan','Batang'),
	(24,'2023-07-04 08:06:33.780822','2023-07-04 08:06:33.780903',NULL,'PIP-SCH4060','Industri Bangunan','Batang'),
	(25,'2023-07-04 08:08:02.817516','2023-07-04 08:08:02.817556',NULL,'SIK-090090-KS','Industri Farmasi','Lembar'),
	(26,'2023-07-04 08:09:17.746130','2023-07-04 08:09:17.746210',NULL,'PLT-SPHC0026','Industri Bangunan','Batang'),
	(27,'2023-07-04 08:09:36.492162','2023-07-04 08:09:36.492248',NULL,'PLT-SPHC0280','Industri Bangunan','Batang'),
	(28,'2023-07-04 08:10:27.210285','2023-07-04 08:10:27.210351',NULL,'PLT-KPL0100','Industri Bangunan','Batang');

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shipping_costs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shipping_costs`;

CREATE TABLE `shipping_costs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `origin` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `destination` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `price` double NOT NULL,
  `fleet_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shipping_costs_fleet_id_13c8daab_fk_fleets_id` (`fleet_id`),
  CONSTRAINT `shipping_costs_fleet_id_13c8daab_fk_fleets_id` FOREIGN KEY (`fleet_id`) REFERENCES `fleets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `shipping_costs` WRITE;
/*!40000 ALTER TABLE `shipping_costs` DISABLE KEYS */;

INSERT INTO `shipping_costs` (`id`, `created_at`, `updated_at`, `deleted_at`, `origin`, `destination`, `price`, `fleet_id`)
VALUES
	(1,'2023-06-29 04:20:01.000000','2023-06-29 04:20:01.000000',NULL,'Cilincing','Jakarta Timur',1600000,1),
	(2,'2023-06-29 04:20:45.000000','2023-06-29 04:20:45.000000',NULL,'Cilincing','Jakarta Barat',1600000,1),
	(3,'2023-06-29 04:21:57.000000','2023-06-29 04:21:57.000000',NULL,'Cilincing','Jakarta Utara',1600000,1),
	(4,'2023-06-29 04:29:12.000000','2023-06-29 04:29:12.000000',NULL,'Cilincing','Jakarta Selatan',1600000,1),
	(5,'2023-06-29 04:52:17.000000','2023-06-29 04:52:17.000000',NULL,'Cilincing','Bekasi',1800000,1),
	(6,'2023-06-29 04:53:01.000000','2023-06-29 04:53:01.000000',NULL,'Cilincing','Depok',1800000,1),
	(7,'2023-06-29 04:53:09.000000','2023-06-29 04:53:09.000000',NULL,'Cilincing','Cikarang',1800000,1),
	(8,'2023-06-29 04:58:58.000000','2023-06-29 04:58:58.000000',NULL,'Cilincing','Bogor',1900000,1),
	(9,'2023-06-29 05:00:27.000000','2023-06-29 05:00:27.000000',NULL,'Cilincing','Tangerang',1800000,1),
	(10,'2023-06-29 07:01:25.000000','2023-06-29 07:01:25.000000',NULL,'Cilincing','Jakarta Timur',2500000,2),
	(11,'2023-06-29 07:01:42.000000','2023-06-29 07:01:42.000000',NULL,'Cilincing','Jakarta Barat',2500000,2),
	(12,'2023-06-29 07:01:54.000000','2023-06-29 07:01:54.000000',NULL,'Cilincing','Jakarta Utara',2500000,2),
	(13,'2023-06-29 07:02:00.000000','2023-06-29 07:02:00.000000',NULL,'Cilincing','Jakarta Selatan',2500000,2),
	(14,'2023-06-29 07:02:17.000000','2023-06-29 07:02:17.000000',NULL,'Cilincing','Bekasi',3450000,2),
	(15,'2023-06-29 07:02:21.000000','2023-06-29 07:02:21.000000',NULL,'Cilincing','Depok',3450000,2),
	(16,'2023-06-29 07:02:25.000000','2023-06-29 07:02:25.000000',NULL,'Cilincing','Cikarang',3450000,2),
	(17,'2023-06-29 07:02:37.000000','2023-06-29 07:02:37.000000',NULL,'Cilincing','Tangerang',3450000,2),
	(18,'2023-06-29 07:02:52.000000','2023-06-29 07:02:52.000000',NULL,'Cilincing','Bogor',3600000,2),
	(19,'2023-07-05 18:16:07.415626','2023-07-05 18:16:07.415699',NULL,'Cilincing','Jakarta Pusat',2500000,2),
	(20,'2023-07-05 18:16:15.608654','2023-07-05 18:16:15.608695',NULL,'Cilincing','Jakarta Pusat',1600000,1);

/*!40000 ALTER TABLE `shipping_costs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table suppliers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `state` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;

INSERT INTO `suppliers` (`id`, `created_at`, `updated_at`, `deleted_at`, `code`, `address`, `city`, `state`)
VALUES
	(1,'2023-06-27 22:57:43.663036','2023-06-27 22:57:43.663085',NULL,'S1-KPS-1','Kelurahan Klender, Kecamatan Duren Sawit','Jakarta Timur','DKI Jakarta'),
	(2,'2023-06-27 23:44:36.814332','2023-06-27 23:44:36.814412',NULL,'S1-HSC-1','Mangga Dua Sel., Kecamatan Sawah Besar','Jakarta Pusat','DKI Jakarta'),
	(3,'2023-06-27 23:45:10.241170','2023-06-27 23:45:10.241227',NULL,'S1-PSB-1','Tubagus Angke','Jakarta Utara','DKI Jakarta'),
	(4,'2023-06-27 23:45:35.185509','2023-06-27 23:45:35.185529',NULL,'S1-SUM-1','Kedung Waringin, Kec. Tanah Sereal','Bogor','Jawa Barat'),
	(5,'2023-06-27 23:46:06.918673','2023-06-27 23:46:06.918693',NULL,'S1-ISB-1','Penjaringan','Jakarta Utara','DKI Jakarta'),
	(6,'2023-06-27 23:46:33.155308','2023-06-27 23:46:33.155356',NULL,'S1-FIX-1','Godangdia','Jakarta Pusat','DKI Jakarta'),
	(7,'2023-06-27 23:47:01.738322','2023-06-27 23:47:01.738342',NULL,'S1-SAM-1','Bantar Gebang','Bekasi','Jawa Barat'),
	(8,'2023-06-27 23:47:28.976800','2023-06-27 23:47:28.976849',NULL,'S1-SSC-1','Kec. Sawah Besar','Jakarta Pusat','DKI Jakarta');

/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
