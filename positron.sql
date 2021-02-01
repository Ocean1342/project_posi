-- Adminer 4.7.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `isbn` varchar(1000) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `authors` varchar(1000) NOT NULL,
  `categories` varchar(1000) NOT NULL,
  `status` varchar(1000) NOT NULL,
  `thumbnailUrl` varchar(1000) DEFAULT NULL,
  `shortDescription` text,
  `longDescription` mediumtext,
  `publishedDate` datetime NOT NULL,
  `pageCount` int(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `category` (`id`, `parent_id`, `title`, `description`, `keywords`) VALUES
(1,	0,	'Branded Foods',	'Branded Foods keywords',	'Branded Foods description'),
(2,	0,	'Households',	'Households keywords',	'Households description'),
(3,	0,	'Veggies & Fruits',	'Veggies & Fruits description',	'Veggies & Fruits keywords'),
(4,	3,	'Vegetables',	'Vegetables description',	'Vegetables keywords'),
(5,	3,	'Fruits',	'Fruits description',	'Fruits keywords'),
(6,	0,	'Kitchen',	NULL,	NULL),
(7,	0,	'Short Codes',	NULL,	NULL),
(8,	0,	'Beverages',	NULL,	NULL),
(9,	8,	'Soft Drinks',	NULL,	NULL),
(10,	8,	'Juices',	NULL,	NULL),
(11,	0,	'Pet Food',	NULL,	NULL),
(12,	0,	'Frozen Foods',	NULL,	NULL),
(13,	12,	'Frozen Snacks',	NULL,	NULL),
(14,	12,	'Frozen Nonveg',	NULL,	NULL),
(15,	0,	'Bread & Bakery',	NULL,	NULL);

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `old_price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'no-image.png',
  `is_offer` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `product` (`id`, `category_id`, `title`, `content`, `price`, `old_price`, `description`, `keywords`, `img`, `is_offer`) VALUES
(1,	1,	'knorr instant soup (100 gm)',	'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',	3.00,	0.00,	NULL,	NULL,	'5.png',	1),
(2,	1,	'chings noodles (75 gm)',	'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',	5.00,	8.00,	NULL,	NULL,	'6.png',	1),
(3,	1,	'lahsun sev (150 gm)',	'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',	3.00,	5.00,	NULL,	NULL,	'7.png',	1),
(4,	1,	'premium bake rusk (300 gm)',	'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',	5.00,	7.00,	NULL,	NULL,	'8.png',	1),
(5,	4,	'fresh spinach (palak)',	'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',	2.00,	3.00,	NULL,	NULL,	'9.png',	1),
(6,	5,	'fresh mango dasheri (1 kg)',	'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',	5.00,	8.00,	NULL,	NULL,	'10.png',	1),
(7,	5,	'fresh apple red (1 kg)',	'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',	6.00,	8.00,	NULL,	NULL,	'11.png',	1),
(8,	4,	'fresh broccoli (500 gm)',	'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',	4.00,	6.00,	NULL,	NULL,	'12.png',	1),
(9,	10,	'mixed fruit juice (1 ltr)',	'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',	3.00,	0.00,	NULL,	NULL,	'13.png',	1),
(10,	10,	'prune juice - sunsweet (1 ltr)',	'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',	4.00,	0.00,	NULL,	NULL,	'14.png',	1),
(11,	9,	'coco cola zero can (330 ml)',	'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',	3.00,	0.00,	NULL,	NULL,	'15.png',	1),
(12,	9,	'sprite bottle (2 ltr)',	'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',	3.00,	0.00,	NULL,	NULL,	'16.png',	1);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `username`, `password`, `auth_key`) VALUES
(1,	'admin',	'$2y$13$g8lZofZ7YzwVxsazXSlR.OrWjlXzw7IeDMfyW0PGvLHX0sWXSGlYy',	'8t6DSy_0WKpHUccND_DQEPkKtnkXZhWT');

-- 2021-02-01 13:11:26
