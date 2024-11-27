-- SQL added here will be installed to the "defaultdb" databases on db container startup
-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `swana_action_logs`;
CREATE TABLE `swana_action_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_language_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_id_logdate` (`user_id`,`log_date`),
  KEY `idx_user_id_extension` (`user_id`,`extension`),
  KEY `idx_extension_item_id` (`extension`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_action_logs_extensions`;
CREATE TABLE `swana_action_logs_extensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_action_logs_users`;
CREATE TABLE `swana_action_logs_users` (
  `user_id` int(11) unsigned NOT NULL,
  `notify` tinyint(1) unsigned NOT NULL,
  `extensions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_notify` (`notify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_action_log_config`;
CREATE TABLE `swana_action_log_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_assets`;
CREATE TABLE `swana_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1,	0,	0,	123,	0,	'root.1',	'Root Asset',	'{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(2,	1,	1,	2,	1,	'com_admin',	'com_admin',	'{}'),
(3,	1,	3,	6,	1,	'com_banners',	'com_banners',	'{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(4,	1,	7,	8,	1,	'com_cache',	'com_cache',	'{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(5,	1,	9,	10,	1,	'com_checkin',	'com_checkin',	'{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(6,	1,	11,	12,	1,	'com_config',	'com_config',	'{}'),
(7,	1,	13,	16,	1,	'com_contact',	'com_contact',	'{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(8,	1,	17,	24,	1,	'com_content',	'com_content',	'{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1}}'),
(9,	1,	25,	26,	1,	'com_cpanel',	'com_cpanel',	'{}'),
(10,	1,	27,	28,	1,	'com_installer',	'com_installer',	'{\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),
(11,	1,	29,	30,	1,	'com_languages',	'com_languages',	'{\"core.admin\":{\"7\":1}}'),
(12,	1,	31,	32,	1,	'com_login',	'com_login',	'{}'),
(13,	1,	33,	34,	1,	'com_mailto',	'com_mailto',	'{}'),
(14,	1,	35,	36,	1,	'com_massmail',	'com_massmail',	'{}'),
(15,	1,	37,	38,	1,	'com_media',	'com_media',	'{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),
(16,	1,	39,	42,	1,	'com_menus',	'com_menus',	'{\"core.admin\":{\"7\":1}}'),
(17,	1,	43,	44,	1,	'com_messages',	'com_messages',	'{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(18,	1,	45,	86,	1,	'com_modules',	'com_modules',	'{\"core.admin\":{\"7\":1}}'),
(19,	1,	87,	90,	1,	'com_newsfeeds',	'com_newsfeeds',	'{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(20,	1,	91,	92,	1,	'com_plugins',	'com_plugins',	'{\"core.admin\":{\"7\":1}}'),
(21,	1,	93,	94,	1,	'com_redirect',	'com_redirect',	'{\"core.admin\":{\"7\":1}}'),
(22,	1,	95,	96,	1,	'com_search',	'com_search',	'{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(23,	1,	97,	98,	1,	'com_templates',	'com_templates',	'{\"core.admin\":{\"7\":1}}'),
(24,	1,	99,	102,	1,	'com_users',	'com_users',	'{\"core.admin\":{\"7\":1}}'),
(26,	1,	103,	104,	1,	'com_wrapper',	'com_wrapper',	'{}'),
(27,	8,	18,	23,	2,	'com_content.category.2',	'Uncategorised',	'{}'),
(28,	3,	4,	5,	2,	'com_banners.category.3',	'Uncategorised',	'{}'),
(29,	7,	14,	15,	2,	'com_contact.category.4',	'Uncategorised',	'{}'),
(30,	19,	88,	89,	2,	'com_newsfeeds.category.5',	'Uncategorised',	'{}'),
(32,	24,	100,	101,	2,	'com_users.category.7',	'Uncategorised',	'{}'),
(33,	1,	105,	106,	1,	'com_finder',	'com_finder',	'{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(34,	1,	107,	108,	1,	'com_joomlaupdate',	'com_joomlaupdate',	'{}'),
(35,	1,	109,	110,	1,	'com_tags',	'com_tags',	'{}'),
(36,	1,	111,	112,	1,	'com_contenthistory',	'com_contenthistory',	'{}'),
(37,	1,	113,	114,	1,	'com_ajax',	'com_ajax',	'{}'),
(38,	1,	115,	116,	1,	'com_postinstall',	'com_postinstall',	'{}'),
(39,	18,	46,	47,	2,	'com_modules.module.1',	'Main Menu',	'{}'),
(40,	18,	48,	49,	2,	'com_modules.module.2',	'Login',	'{}'),
(41,	18,	50,	51,	2,	'com_modules.module.3',	'Popular Articles',	'{}'),
(42,	18,	52,	53,	2,	'com_modules.module.4',	'Recently Added Articles',	'{}'),
(43,	18,	54,	55,	2,	'com_modules.module.8',	'Toolbar',	'{}'),
(44,	18,	56,	57,	2,	'com_modules.module.9',	'Quick Icons',	'{}'),
(45,	18,	58,	59,	2,	'com_modules.module.10',	'Logged-in Users',	'{}'),
(46,	18,	60,	61,	2,	'com_modules.module.12',	'Admin Menu',	'{}'),
(47,	18,	62,	63,	2,	'com_modules.module.13',	'Admin Submenu',	'{}'),
(48,	18,	64,	65,	2,	'com_modules.module.14',	'User Status',	'{}'),
(49,	18,	66,	67,	2,	'com_modules.module.15',	'Title',	'{}'),
(50,	18,	68,	69,	2,	'com_modules.module.16',	'Login Form',	'{}'),
(51,	18,	70,	71,	2,	'com_modules.module.17',	'Breadcrumbs',	'{}'),
(52,	18,	72,	73,	2,	'com_modules.module.79',	'Multilanguage status',	'{}'),
(53,	18,	74,	75,	2,	'com_modules.module.86',	'Joomla Version',	'{}'),
(54,	16,	40,	41,	2,	'com_menus.menu.1',	'Main Menu',	'{}'),
(55,	18,	76,	77,	2,	'com_modules.module.87',	'Sample Data',	'{}'),
(56,	1,	117,	118,	1,	'com_privacy',	'com_privacy',	'{}'),
(57,	1,	119,	120,	1,	'com_actionlogs',	'com_actionlogs',	'{}'),
(58,	18,	78,	79,	2,	'com_modules.module.88',	'Latest Actions',	'{}'),
(59,	18,	80,	81,	2,	'com_modules.module.89',	'Privacy Dashboard',	'{}'),
(60,	1,	121,	122,	1,	'com_swa',	'com_swa',	'{}'),
(61,	18,	82,	83,	2,	'com_modules.module.90',	'Main Nav Bar',	'{}'),
(62,	18,	84,	85,	2,	'com_modules.module.91',	'Legal Menu',	'{}'),
(63,	27,	19,	20,	3,	'com_content.article.1',	'Lorem Ipsum',	'{}'),
(64,	27,	21,	22,	3,	'com_content.article.2',	'Duis id accumsan risus',	'{}');

DROP TABLE IF EXISTS `swana_associations`;
CREATE TABLE `swana_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_banners`;
CREATE TABLE `swana_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_banner_clients`;
CREATE TABLE `swana_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_banner_tracks`;
CREATE TABLE `swana_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_categories`;
CREATE TABLE `swana_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1,	0,	0,	0,	11,	0,	'',	'system',	'ROOT',	'root',	'',	'',	1,	0,	'0000-00-00 00:00:00',	1,	'{}',	'',	'',	'{}',	421,	'2019-02-10 14:19:01',	0,	'0000-00-00 00:00:00',	0,	'*',	1),
(2,	27,	1,	1,	2,	1,	'uncategorised',	'com_content',	'Uncategorised',	'uncategorised',	'',	'',	1,	0,	'0000-00-00 00:00:00',	1,	'{\"category_layout\":\"\",\"image\":\"\"}',	'',	'',	'{\"author\":\"\",\"robots\":\"\"}',	421,	'2019-02-10 14:19:01',	0,	'0000-00-00 00:00:00',	0,	'*',	1),
(3,	28,	1,	3,	4,	1,	'uncategorised',	'com_banners',	'Uncategorised',	'uncategorised',	'',	'',	1,	0,	'0000-00-00 00:00:00',	1,	'{\"category_layout\":\"\",\"image\":\"\"}',	'',	'',	'{\"author\":\"\",\"robots\":\"\"}',	421,	'2019-02-10 14:19:01',	0,	'0000-00-00 00:00:00',	0,	'*',	1),
(4,	29,	1,	5,	6,	1,	'uncategorised',	'com_contact',	'Uncategorised',	'uncategorised',	'',	'',	1,	0,	'0000-00-00 00:00:00',	1,	'{\"category_layout\":\"\",\"image\":\"\"}',	'',	'',	'{\"author\":\"\",\"robots\":\"\"}',	421,	'2019-02-10 14:19:01',	0,	'0000-00-00 00:00:00',	0,	'*',	1),
(5,	30,	1,	7,	8,	1,	'uncategorised',	'com_newsfeeds',	'Uncategorised',	'uncategorised',	'',	'',	1,	0,	'0000-00-00 00:00:00',	1,	'{\"category_layout\":\"\",\"image\":\"\"}',	'',	'',	'{\"author\":\"\",\"robots\":\"\"}',	421,	'2019-02-10 14:19:01',	0,	'0000-00-00 00:00:00',	0,	'*',	1),
(7,	32,	1,	9,	10,	1,	'uncategorised',	'com_users',	'Uncategorised',	'uncategorised',	'',	'',	1,	0,	'0000-00-00 00:00:00',	1,	'{\"category_layout\":\"\",\"image\":\"\"}',	'',	'',	'{\"author\":\"\",\"robots\":\"\"}',	421,	'2019-02-10 14:19:01',	0,	'0000-00-00 00:00:00',	0,	'*',	1);

DROP TABLE IF EXISTS `swana_contact_details`;
CREATE TABLE `swana_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_content`;
CREATE TABLE `swana_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`),
  KEY `idx_alias` (`alias`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`, `note`) VALUES
(1,	63,	'Lorem Ipsum',	'lorem-ipsum',	'<div id=\"lipsum\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget egestas velit, sed placerat odio. Suspendisse at leo nec magna scelerisque sodales et vestibulum ligula. Donec eget velit laoreet, dictum quam vel, sagittis felis. Sed ornare ipsum quis dolor tempus, nec egestas ex molestie. Suspendisse enim odio, posuere quis volutpat sit amet, cursus sed nunc. Quisque feugiat turpis nunc, at mattis odio tincidunt sed. In hac habitasse platea dictumst. Sed luctus lobortis tortor et semper.</p>\r\n<p>Mauris vitae hendrerit nisl, ut semper orci. Nullam hendrerit congue consectetur. Donec pharetra ultrices sapien et varius. Nulla id orci finibus, aliquet mauris sed, dignissim nisl. Sed congue eu mi quis venenatis. Curabitur in pulvinar dolor. Sed varius aliquam erat non rutrum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras fringilla viverra dictum.</p>\r\n<p>Morbi pulvinar massa id lacus bibendum blandit. Nam eget massa tempus, sollicitudin diam quis, interdum magna. Suspendisse pretium orci lacinia tortor tincidunt sodales. Aliquam a eros mollis, eleifend libero ut, porttitor erat. Donec quis velit nec justo interdum efficitur. Nulla tristique venenatis magna nec lacinia. Duis ultrices, mi eget aliquam commodo, purus diam sodales libero, a euismod nisl tortor et neque. Nulla nisi lacus, volutpat sit amet diam nec, fringilla malesuada nibh. Donec vehicula pulvinar lacus ut rhoncus. Morbi eget velit semper lacus convallis sollicitudin sit amet ut velit. Duis luctus augue ac est maximus faucibus. Aenean vel pharetra enim.</p>\r\n<p>Nunc vel pellentesque ante, ut sagittis lectus. Aenean et vehicula nisi. In hac habitasse platea dictumst. Quisque a aliquet quam, a vulputate nisl. Aenean non tincidunt ipsum. Nulla arcu turpis, consectetur a cursus sed, scelerisque ut quam. Ut id ipsum vel nisi tincidunt commodo ac eget nisl. Aenean leo neque, suscipit vel sem sit amet, molestie pharetra tellus. Nunc dictum turpis sed risus cursus, mollis dignissim diam vulputate. Aenean tristique nunc nunc, eu consectetur nunc rutrum ut. Phasellus lacinia libero dui, a dignissim nisi dapibus at.</p>\r\n<p>Aliquam hendrerit rutrum massa et aliquet. Phasellus elementum pellentesque est, ut congue erat porttitor quis. Phasellus ante risus, tincidunt congue maximus non, efficitur nec eros. Sed nec viverra ligula, at interdum massa. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse non sagittis massa. Vivamus sed eros efficitur, pulvinar lectus vitae, ultricies lorem. Phasellus vel arcu luctus, vehicula nunc eget, rutrum tortor. Cras id orci urna. Nam sit amet felis quis lacus pulvinar pharetra sed quis tortor. Aliquam eget mollis erat. Cras dignissim gravida varius. Cras malesuada tincidunt fermentum. Quisque vel massa blandit odio vehicula mattis vitae id elit.</p>\r\n</div>',	'',	1,	2,	'2019-02-10 17:01:25',	421,	'',	'2019-02-10 17:01:25',	0,	0,	'0000-00-00 00:00:00',	'2019-02-10 17:01:25',	'0000-00-00 00:00:00',	'{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}',	'{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}',	'{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',	1,	1,	'',	'',	1,	0,	'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',	1,	'*',	'',	''),
(2,	64,	'Duis id accumsan risus',	'duis-id-accumsan-risus',	'<p>Duis id accumsan risus. Vestibulum augue nisi, semper vitae lacus nec, volutpat posuere lectus. Vivamus ut nisi bibendum, pellentesque massa ut, semper sem. Vestibulum placerat finibus erat, vehicula condimentum enim. Suspendisse volutpat risus sed nibh rutrum rutrum eleifend sit amet nisi. Vestibulum risus lorem, condimentum et vehicula id, tincidunt vitae neque. Praesent malesuada elementum tortor quis ultrices. Aliquam sit amet orci lectus. Donec pellentesque semper suscipit. Ut eget magna ultricies, luctus velit nec, semper est. Nam consequat sit amet mi eleifend scelerisque. Mauris non ante vitae lorem sodales fermentum eget a arcu. Nullam consectetur felis arcu, ut iaculis magna aliquam vel. Aenean vestibulum placerat congue.</p>\r\n<p>Phasellus turpis augue, scelerisque consequat dolor eu, rhoncus venenatis nisi. Quisque dictum interdum commodo. Sed cursus nulla ac porta consectetur. Nullam vel nisi cursus, mattis odio ac, condimentum orci. Vivamus dapibus nisl eget nisi efficitur dignissim. Maecenas viverra, velit ac lacinia dignissim, enim mi viverra turpis, quis bibendum est ex vel elit. Ut elementum, est quis ultrices dignissim, arcu mauris eleifend metus, sit amet egestas sem magna in nisi. Sed imperdiet diam vitae dignissim condimentum. Pellentesque mollis, massa et mollis egestas, turpis mauris varius augue, eget ultrices mauris justo sagittis tortor. Integer sed tempus dui. Phasellus viverra efficitur justo, quis hendrerit magna pulvinar in.</p>\r\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam non pretium eros. Aliquam sapien odio, dapibus eu lacinia quis, faucibus in tellus. Donec porttitor mi eget massa interdum, nec suscipit elit pharetra. Donec tincidunt eros quis dignissim feugiat. Quisque rhoncus convallis purus sed varius. Aliquam scelerisque quam quis leo aliquam, nec interdum ligula consequat.</p>\r\n<p>Curabitur quis felis feugiat, mollis elit quis, maximus leo. Aenean sed facilisis risus. Integer ac ornare justo. Nunc hendrerit velit ac massa imperdiet pellentesque. Nulla facilisi. Sed sed diam id metus ultricies lobortis. Donec tellus dolor, congue in nunc eget, luctus pulvinar turpis. Nullam at gravida diam. Nullam sapien lacus, varius vel malesuada ac, commodo id nibh. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla facilisi. Aenean ullamcorper eu sem nec ultricies. Donec consectetur ultricies nulla, sed tempus nisi interdum at.</p>\r\n<p>Vestibulum tincidunt sem nec enim pharetra efficitur sit amet in lectus. Etiam pretium risus leo. In euismod erat ex, a efficitur elit tristique quis. Duis pharetra enim mauris, eu ultricies quam maximus a. Curabitur in vulputate velit, at vestibulum ligula. Nam placerat mi vitae purus eleifend, at viverra libero tempus. Fusce elementum sollicitudin tortor, sed consequat odio porttitor ac. Duis vulputate commodo sapien, non condimentum nibh consectetur vel.</p>',	'',	1,	2,	'2019-02-10 17:03:51',	421,	'',	'2019-02-10 17:03:51',	0,	0,	'0000-00-00 00:00:00',	'2019-02-10 17:03:51',	'0000-00-00 00:00:00',	'{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}',	'{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}',	'{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',	1,	0,	'',	'',	1,	0,	'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',	0,	'*',	'',	''),
(3,	67,	'Sponsors Page New',	'sponsorsnew',	'<p>non condimentum nibh consectetur vel.</p>',	'',	1,	2,	'2021-12-04 17:03:51',	421,	'',	'2021-12-04 17:03:51',	0,	0,	'0000-00-00 00:00:00',	'2021-12-04 17:03:51',	'0000-00-00 00:00:00',	'{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}',	'{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}',	'{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',	1,	0,	'',	'',	1,	0,	'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',	0,	'*',	'',	'');

DROP TABLE IF EXISTS `swana_contentitem_tag_map`;
CREATE TABLE `swana_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';


DROP TABLE IF EXISTS `swana_content_frontpage`;
CREATE TABLE `swana_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_content_frontpage` (`content_id`, `ordering`) VALUES
(1,	1);

DROP TABLE IF EXISTS `swana_content_rating`;
CREATE TABLE `swana_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_content_types`;
CREATE TABLE `swana_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1,	'Article',	'com_content.article',	'{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"Content\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}',	'',	'{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"asset_id\", \"note\":\"note\"}, \"special\":{\"fulltext\":\"fulltext\"}}',	'ContentHelperRoute::getArticleRoute',	'{\"formFile\":\"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(2,	'Contact',	'com_contact.contact',	'{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"Contact\",\"prefix\":\"ContactTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}',	'',	'{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}',	'ContactHelperRoute::getContactRoute',	'{\"formFile\":\"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\",\"xreference\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }'),
(3,	'Newsfeed',	'com_newsfeeds.newsfeed',	'{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"Newsfeed\",\"prefix\":\"NewsfeedsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}',	'',	'{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}',	'NewsfeedsHelperRoute::getNewsfeedRoute',	'{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(4,	'User',	'com_users.user',	'{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}',	'',	'{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerdate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}',	'UsersHelperRoute::getUserRoute',	''),
(5,	'Article Category',	'com_content.category',	'{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}',	'',	'{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}',	'ContentHelperRoute::getCategoryRoute',	'{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(6,	'Contact Category',	'com_contact.category',	'{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}',	'',	'{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}',	'ContactHelperRoute::getCategoryRoute',	'{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(7,	'Newsfeeds Category',	'com_newsfeeds.category',	'{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}',	'',	'{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}',	'NewsfeedsHelperRoute::getCategoryRoute',	'{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(8,	'Tag',	'com_tags.tag',	'{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"Tag\",\"prefix\":\"TagsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}',	'',	'{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}',	'TagsHelperRoute::getTagRoute',	'{\"formFile\":\"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(9,	'Banner',	'com_banners.banner',	'{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"Banner\",\"prefix\":\"BannersTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}',	'',	'{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}',	'',	'{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(10,	'Banners Category',	'com_banners.category',	'{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}',	'',	'{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}',	'',	'{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(11,	'Banner Client',	'com_banners.client',	'{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"Client\",\"prefix\":\"BannersTable\"}}',	'',	'',	'',	'{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}'),
(12,	'User Notes',	'com_users.note',	'{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"Note\",\"prefix\":\"UsersTable\"}}',	'',	'',	'',	'{\"formFile\":\"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(13,	'User Notes Category',	'com_users.category',	'{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}',	'',	'{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}',	'',	'{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');

DROP TABLE IF EXISTS `swana_core_log_searches`;
CREATE TABLE `swana_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_extensions`;
CREATE TABLE `swana_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=805 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1,	0,	'com_mailto',	'component',	'com_mailto',	'',	0,	1,	1,	1,	'{\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mailto\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(2,	0,	'com_wrapper',	'component',	'com_wrapper',	'',	0,	1,	1,	1,	'{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"wrapper\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(3,	0,	'com_admin',	'component',	'com_admin',	'',	1,	1,	1,	1,	'{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(4,	0,	'com_banners',	'component',	'com_banners',	'',	1,	1,	1,	0,	'{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}',	'{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(5,	0,	'com_cache',	'component',	'com_cache',	'',	1,	1,	1,	1,	'{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(6,	0,	'com_categories',	'component',	'com_categories',	'',	1,	1,	1,	1,	'{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(7,	0,	'com_checkin',	'component',	'com_checkin',	'',	1,	1,	1,	1,	'{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(8,	0,	'com_contact',	'component',	'com_contact',	'',	1,	1,	1,	0,	'{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}',	'{\"contact_layout\":\"_:default\",\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_tags\":\"1\",\"show_info\":\"1\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_image\":\"1\",\"show_misc\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"articles_display_num\":\"10\",\"show_profile\":\"0\",\"show_user_custom_fields\":[\"-1\"],\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"0\",\"maxLevel\":\"-1\",\"show_subcat_desc\":\"1\",\"show_empty_categories\":\"0\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_subcat_desc_cat\":\"1\",\"show_empty_categories_cat\":\"0\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"0\",\"show_pagination_limit\":\"0\",\"show_headings\":\"1\",\"show_image_heading\":\"0\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"initial_sort\":\"ordering\",\"captcha\":\"\",\"show_email_form\":\"1\",\"show_email_copy\":\"0\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_feed_link\":\"1\",\"sef_advanced\":0,\"sef_ids\":0,\"custom_fields_enable\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(9,	0,	'com_cpanel',	'component',	'com_cpanel',	'',	1,	1,	1,	1,	'{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(10,	0,	'com_installer',	'component',	'com_installer',	'',	1,	1,	1,	1,	'{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}',	'{\"show_jed_info\":\"1\",\"cachetimeout\":\"6\",\"minimum_stability\":\"4\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(11,	0,	'com_languages',	'component',	'com_languages',	'',	1,	1,	1,	1,	'{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}',	'{\"administrator\":\"en-GB\",\"site\":\"en-GB\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(12,	0,	'com_login',	'component',	'com_login',	'',	1,	1,	1,	1,	'{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(13,	0,	'com_media',	'component',	'com_media',	'',	1,	1,	0,	1,	'{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}',	'{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(14,	0,	'com_menus',	'component',	'com_menus',	'',	1,	1,	1,	1,	'{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}',	'{\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(15,	0,	'com_messages',	'component',	'com_messages',	'',	1,	1,	1,	1,	'{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(16,	0,	'com_modules',	'component',	'com_modules',	'',	1,	1,	1,	1,	'{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(17,	0,	'com_newsfeeds',	'component',	'com_newsfeeds',	'',	1,	1,	1,	0,	'{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}',	'{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(18,	0,	'com_plugins',	'component',	'com_plugins',	'',	1,	1,	1,	1,	'{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(19,	0,	'com_search',	'component',	'com_search',	'',	1,	1,	1,	0,	'{\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"search\"}',	'{\"enabled\":\"0\",\"search_phrases\":\"1\",\"search_areas\":\"1\",\"show_date\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(20,	0,	'com_templates',	'component',	'com_templates',	'',	1,	1,	1,	1,	'{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}',	'{\"template_positions_display\":\"0\",\"upload_limit\":\"10\",\"image_formats\":\"gif,bmp,jpg,jpeg,png\",\"source_formats\":\"txt,less,ini,xml,js,php,css,scss,sass\",\"font_formats\":\"woff,ttf,otf\",\"compressed_formats\":\"zip\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(22,	0,	'com_content',	'component',	'com_content',	'',	1,	1,	0,	1,	'{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}',	'{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"1\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"1\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_icons\":\"1\",\"show_print_icon\":\"1\",\"show_email_icon\":\"0\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"save_history\":\"1\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(23,	0,	'com_config',	'component',	'com_config',	'',	1,	1,	0,	1,	'{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}',	'{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"10\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"12\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(24,	0,	'com_redirect',	'component',	'com_redirect',	'',	1,	1,	0,	1,	'{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(25,	0,	'com_users',	'component',	'com_users',	'',	1,	1,	0,	1,	'{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}',	'{\"allowUserRegistration\":\"1\",\"new_usertype\":\"2\",\"guest_usergroup\":\"9\",\"sendpassword\":\"0\",\"useractivation\":\"0\",\"mail_to_admin\":\"0\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"minimum_length\":\"4\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"save_history\":\"1\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(27,	0,	'com_finder',	'component',	'com_finder',	'',	1,	1,	0,	0,	'{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}',	'{\"enabled\":\"0\",\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_autosuggest\":\"1\",\"show_suggested_query\":\"1\",\"show_explained_query\":\"1\",\"show_advanced\":\"1\",\"show_advanced_tips\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"sort_order\":\"relevance\",\"sort_direction\":\"desc\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stem\":\"1\",\"stemmer\":\"snowball\",\"enable_logging\":\"0\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(28,	0,	'com_joomlaupdate',	'component',	'com_joomlaupdate',	'',	1,	1,	0,	1,	'{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.2\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}',	'{\"updatesource\":\"default\",\"customurl\":\"\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(29,	0,	'com_tags',	'component',	'com_tags',	'',	1,	1,	1,	1,	'{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"December 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}',	'{\"tag_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"tag_list_orderby\":\"title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_descripion\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(30,	0,	'com_contenthistory',	'component',	'com_contenthistory',	'',	1,	1,	1,	0,	'{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"May 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contenthistory\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(31,	0,	'com_ajax',	'component',	'com_ajax',	'',	1,	1,	1,	1,	'{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(32,	0,	'com_postinstall',	'component',	'com_postinstall',	'',	1,	1,	1,	1,	'{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(33,	0,	'com_fields',	'component',	'com_fields',	'',	1,	1,	1,	0,	'{\"name\":\"com_fields\",\"type\":\"component\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"COM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(34,	0,	'com_associations',	'component',	'com_associations',	'',	1,	1,	1,	0,	'{\"name\":\"com_associations\",\"type\":\"component\",\"creationDate\":\"Januar 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"COM_ASSOCIATIONS_XML_DESCRIPTION\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(35,	0,	'com_privacy',	'component',	'com_privacy',	'',	1,	1,	1,	1,	'{\"name\":\"com_privacy\",\"type\":\"component\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacy\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(36,	0,	'com_actionlogs',	'component',	'com_actionlogs',	'',	1,	1,	1,	1,	'{\"name\":\"com_actionlogs\",\"type\":\"component\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\"}',	'{\"ip_logging\":0,\"csv_delimiter\":\",\",\"loggable_extensions\":[\"com_banners\",\"com_cache\",\"com_categories\",\"com_config\",\"com_contact\",\"com_content\",\"com_installer\",\"com_media\",\"com_menus\",\"com_messages\",\"com_modules\",\"com_newsfeeds\",\"com_plugins\",\"com_redirect\",\"com_tags\",\"com_templates\",\"com_users\"]}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(102,	0,	'LIB_PHPUTF8',	'library',	'phputf8',	'',	0,	1,	1,	1,	'{\"name\":\"LIB_PHPUTF8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phputf8\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(103,	0,	'LIB_JOOMLA',	'library',	'joomla',	'',	0,	1,	1,	1,	'{\"name\":\"LIB_JOOMLA\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"https:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}',	'{\"mediaversion\":\"2326e96cc50b256f0e89e76a39d69012\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(104,	0,	'LIB_IDNA',	'library',	'idna_convert',	'',	0,	1,	1,	1,	'{\"name\":\"LIB_IDNA\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"phlyLabs\",\"copyright\":\"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de\",\"authorEmail\":\"phlymail@phlylabs.de\",\"authorUrl\":\"http:\\/\\/phlylabs.de\",\"version\":\"0.8.0\",\"description\":\"LIB_IDNA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"idna_convert\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(105,	0,	'FOF',	'library',	'fof',	'',	0,	1,	1,	1,	'{\"name\":\"FOF\",\"type\":\"library\",\"creationDate\":\"2015-04-22 13:15:32\",\"author\":\"Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"copyright\":\"(C)2011-2015 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeebabackup.com\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"2.4.3\",\"description\":\"LIB_FOF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fof\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(106,	0,	'LIB_PHPASS',	'library',	'phpass',	'',	0,	1,	1,	1,	'{\"name\":\"LIB_PHPASS\",\"type\":\"library\",\"creationDate\":\"2004-2006\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"http:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(200,	0,	'mod_articles_archive',	'module',	'mod_articles_archive',	'',	0,	1,	1,	0,	'{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_archive\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(201,	0,	'mod_articles_latest',	'module',	'mod_articles_latest',	'',	0,	1,	1,	0,	'{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_latest\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(202,	0,	'mod_articles_popular',	'module',	'mod_articles_popular',	'',	0,	1,	1,	0,	'{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_popular\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(203,	0,	'mod_banners',	'module',	'mod_banners',	'',	0,	1,	1,	0,	'{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_banners\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(204,	0,	'mod_breadcrumbs',	'module',	'mod_breadcrumbs',	'',	0,	1,	1,	1,	'{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_breadcrumbs\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(205,	0,	'mod_custom',	'module',	'mod_custom',	'',	0,	1,	1,	1,	'{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(206,	0,	'mod_feed',	'module',	'mod_feed',	'',	0,	1,	1,	0,	'{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(207,	0,	'mod_footer',	'module',	'mod_footer',	'',	0,	1,	1,	0,	'{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_footer\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(208,	0,	'mod_login',	'module',	'mod_login',	'',	0,	1,	1,	1,	'{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(209,	0,	'mod_menu',	'module',	'mod_menu',	'',	0,	1,	1,	1,	'{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(210,	0,	'mod_articles_news',	'module',	'mod_articles_news',	'',	0,	1,	1,	0,	'{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_news\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(211,	0,	'mod_random_image',	'module',	'mod_random_image',	'',	0,	1,	1,	0,	'{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_random_image\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(212,	0,	'mod_related_items',	'module',	'mod_related_items',	'',	0,	1,	1,	0,	'{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_related_items\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(213,	0,	'mod_search',	'module',	'mod_search',	'',	0,	1,	1,	0,	'{\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_search\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(214,	0,	'mod_stats',	'module',	'mod_stats',	'',	0,	1,	1,	0,	'{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(215,	0,	'mod_syndicate',	'module',	'mod_syndicate',	'',	0,	1,	1,	1,	'{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_syndicate\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(216,	0,	'mod_users_latest',	'module',	'mod_users_latest',	'',	0,	1,	1,	0,	'{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_users_latest\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(218,	0,	'mod_whosonline',	'module',	'mod_whosonline',	'',	0,	1,	1,	0,	'{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_whosonline\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(219,	0,	'mod_wrapper',	'module',	'mod_wrapper',	'',	0,	1,	1,	0,	'{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_wrapper\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(220,	0,	'mod_articles_category',	'module',	'mod_articles_category',	'',	0,	1,	1,	0,	'{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_category\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(221,	0,	'mod_articles_categories',	'module',	'mod_articles_categories',	'',	0,	1,	1,	0,	'{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_categories\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(222,	0,	'mod_languages',	'module',	'mod_languages',	'',	0,	1,	1,	1,	'{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_languages\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(223,	0,	'mod_finder',	'module',	'mod_finder',	'',	0,	1,	0,	0,	'{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_finder\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(300,	0,	'mod_custom',	'module',	'mod_custom',	'',	1,	1,	1,	1,	'{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(301,	0,	'mod_feed',	'module',	'mod_feed',	'',	1,	1,	1,	0,	'{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(302,	0,	'mod_latest',	'module',	'mod_latest',	'',	1,	1,	1,	0,	'{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latest\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(303,	0,	'mod_logged',	'module',	'mod_logged',	'',	1,	1,	1,	0,	'{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_logged\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(304,	0,	'mod_login',	'module',	'mod_login',	'',	1,	1,	1,	1,	'{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(305,	0,	'mod_menu',	'module',	'mod_menu',	'',	1,	1,	1,	0,	'{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(307,	0,	'mod_popular',	'module',	'mod_popular',	'',	1,	1,	1,	0,	'{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_popular\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(308,	0,	'mod_quickicon',	'module',	'mod_quickicon',	'',	1,	1,	1,	1,	'{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_quickicon\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(309,	0,	'mod_status',	'module',	'mod_status',	'',	1,	1,	1,	0,	'{\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_status\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(310,	0,	'mod_submenu',	'module',	'mod_submenu',	'',	1,	1,	1,	0,	'{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_submenu\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(311,	0,	'mod_title',	'module',	'mod_title',	'',	1,	1,	1,	0,	'{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(312,	0,	'mod_toolbar',	'module',	'mod_toolbar',	'',	1,	1,	1,	1,	'{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(313,	0,	'mod_multilangstatus',	'module',	'mod_multilangstatus',	'',	1,	1,	1,	0,	'{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}',	'{\"cache\":\"0\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(314,	0,	'mod_version',	'module',	'mod_version',	'',	1,	1,	1,	0,	'{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_version\"}',	'{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(315,	0,	'mod_stats_admin',	'module',	'mod_stats_admin',	'',	1,	1,	1,	0,	'{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats_admin\"}',	'{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(316,	0,	'mod_tags_popular',	'module',	'mod_tags_popular',	'',	0,	1,	1,	0,	'{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_popular\"}',	'{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(317,	0,	'mod_tags_similar',	'module',	'mod_tags_similar',	'',	0,	1,	1,	0,	'{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_similar\"}',	'{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(318,	0,	'mod_sampledata',	'module',	'mod_sampledata',	'',	1,	1,	1,	0,	'{\"name\":\"mod_sampledata\",\"type\":\"module\",\"creationDate\":\"July 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"MOD_SAMPLEDATA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_sampledata\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(319,	0,	'mod_latestactions',	'module',	'mod_latestactions',	'',	1,	1,	1,	0,	'{\"name\":\"mod_latestactions\",\"type\":\"module\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_LATESTACTIONS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latestactions\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(320,	0,	'mod_privacy_dashboard',	'module',	'mod_privacy_dashboard',	'',	1,	1,	1,	0,	'{\"name\":\"mod_privacy_dashboard\",\"type\":\"module\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_PRIVACY_DASHBOARD_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_privacy_dashboard\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(400,	0,	'plg_authentication_gmail',	'plugin',	'gmail',	'authentication',	0,	0,	1,	0,	'{\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"gmail\"}',	'{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}',	'',	'',	0,	'0000-00-00 00:00:00',	1,	0),
(401,	0,	'plg_authentication_joomla',	'plugin',	'joomla',	'authentication',	0,	1,	1,	1,	'{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(402,	0,	'plg_authentication_ldap',	'plugin',	'ldap',	'authentication',	0,	0,	1,	0,	'{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}',	'{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}',	'',	'',	0,	'0000-00-00 00:00:00',	3,	0),
(403,	0,	'plg_content_contact',	'plugin',	'contact',	'content',	0,	1,	1,	0,	'{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"January 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	1,	0),
(404,	0,	'plg_content_emailcloak',	'plugin',	'emailcloak',	'content',	0,	1,	1,	0,	'{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"emailcloak\"}',	'{\"mode\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	1,	0),
(406,	0,	'plg_content_loadmodule',	'plugin',	'loadmodule',	'content',	0,	1,	1,	0,	'{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}',	'{\"style\":\"xhtml\"}',	'',	'',	0,	'2011-09-18 15:22:50',	0,	0),
(407,	0,	'plg_content_pagebreak',	'plugin',	'pagebreak',	'content',	0,	1,	1,	0,	'{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}',	'{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	4,	0),
(408,	0,	'plg_content_pagenavigation',	'plugin',	'pagenavigation',	'content',	0,	1,	1,	0,	'{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}',	'{\"position\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	5,	0),
(409,	0,	'plg_content_vote',	'plugin',	'vote',	'content',	0,	0,	1,	0,	'{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	6,	0),
(410,	0,	'plg_editors_codemirror',	'plugin',	'codemirror',	'editors',	0,	1,	1,	1,	'{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 - 2017 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"http:\\/\\/codemirror.net\\/\",\"version\":\"5.40.0\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"codemirror\"}',	'{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}',	'',	'',	0,	'0000-00-00 00:00:00',	1,	0),
(411,	0,	'plg_editors_none',	'plugin',	'none',	'editors',	0,	1,	1,	1,	'{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"September 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"none\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	2,	0),
(412,	0,	'plg_editors_tinymce',	'plugin',	'tinymce',	'editors',	0,	1,	1,	0,	'{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2018\",\"author\":\"Ephox Corporation\",\"copyright\":\"Ephox Corporation\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"http:\\/\\/www.tinymce.com\",\"version\":\"4.5.9\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tinymce\"}',	'{\"configuration\":{\"toolbars\":{\"2\":{\"toolbar1\":[\"bold\",\"underline\",\"strikethrough\",\"|\",\"undo\",\"redo\",\"|\",\"bullist\",\"numlist\",\"|\",\"pastetext\"]},\"1\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"formatselect\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"code\",\"|\",\"hr\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"pastetext\",\"preview\"]},\"0\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"styleselect\",\"|\",\"formatselect\",\"fontselect\",\"fontsizeselect\",\"|\",\"searchreplace\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"image\",\"|\",\"code\",\"|\",\"forecolor\",\"backcolor\",\"|\",\"fullscreen\",\"|\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"emoticons\",\"media\",\"hr\",\"ltr\",\"rtl\",\"|\",\"cut\",\"copy\",\"paste\",\"pastetext\",\"|\",\"visualchars\",\"visualblocks\",\"nonbreaking\",\"blockquote\",\"template\",\"|\",\"print\",\"preview\",\"codesample\",\"insertdatetime\",\"removeformat\"]}},\"setoptions\":{\"2\":{\"access\":[\"1\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"1\":{\"access\":[\"6\",\"2\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"0\":{\"access\":[\"7\",\"4\",\"8\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}}},\"sets_amount\":3,\"html_height\":\"550\",\"html_width\":\"750\"}',	'',	'',	0,	'0000-00-00 00:00:00',	3,	0),
(413,	0,	'plg_editors-xtd_article',	'plugin',	'article',	'editors-xtd',	0,	1,	1,	0,	'{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"article\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	1,	0),
(414,	0,	'plg_editors-xtd_image',	'plugin',	'image',	'editors-xtd',	0,	1,	1,	0,	'{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"image\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	2,	0),
(415,	0,	'plg_editors-xtd_pagebreak',	'plugin',	'pagebreak',	'editors-xtd',	0,	1,	1,	0,	'{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	3,	0),
(416,	0,	'plg_editors-xtd_readmore',	'plugin',	'readmore',	'editors-xtd',	0,	1,	1,	0,	'{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"readmore\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	4,	0),
(417,	0,	'plg_search_categories',	'plugin',	'categories',	'search',	0,	1,	1,	0,	'{\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}',	'{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(418,	0,	'plg_search_contacts',	'plugin',	'contacts',	'search',	0,	1,	1,	0,	'{\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}',	'{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(419,	0,	'plg_search_content',	'plugin',	'content',	'search',	0,	1,	1,	0,	'{\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}',	'{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(420,	0,	'plg_search_newsfeeds',	'plugin',	'newsfeeds',	'search',	0,	1,	1,	0,	'{\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}',	'{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(422,	0,	'plg_system_languagefilter',	'plugin',	'languagefilter',	'system',	0,	0,	1,	1,	'{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	1,	0),
(423,	0,	'plg_system_p3p',	'plugin',	'p3p',	'system',	0,	0,	1,	0,	'{\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"p3p\"}',	'{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}',	'',	'',	0,	'0000-00-00 00:00:00',	2,	0),
(424,	0,	'plg_system_cache',	'plugin',	'cache',	'system',	0,	0,	1,	1,	'{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cache\"}',	'{\"browsercache\":\"0\",\"cachetime\":\"15\"}',	'',	'',	0,	'0000-00-00 00:00:00',	9,	0),
(425,	0,	'plg_system_debug',	'plugin',	'debug',	'system',	0,	1,	1,	0,	'{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"debug\"}',	'{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}',	'',	'',	0,	'0000-00-00 00:00:00',	4,	0),
(426,	0,	'plg_system_log',	'plugin',	'log',	'system',	0,	1,	1,	1,	'{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	5,	0),
(427,	0,	'plg_system_redirect',	'plugin',	'redirect',	'system',	0,	0,	1,	1,	'{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	3,	0),
(428,	0,	'plg_system_remember',	'plugin',	'remember',	'system',	0,	1,	1,	1,	'{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	7,	0),
(429,	0,	'plg_system_sef',	'plugin',	'sef',	'system',	0,	1,	1,	0,	'{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	8,	0),
(430,	0,	'plg_system_logout',	'plugin',	'logout',	'system',	0,	1,	1,	1,	'{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	6,	0),
(431,	0,	'plg_user_contactcreator',	'plugin',	'contactcreator',	'user',	0,	0,	1,	0,	'{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}',	'{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}',	'',	'',	0,	'0000-00-00 00:00:00',	1,	0),
(432,	0,	'plg_user_joomla',	'plugin',	'joomla',	'user',	0,	1,	1,	0,	'{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}',	'{\"autoregister\":\"1\",\"mail_to_user\":\"1\",\"forceLogout\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	2,	0),
(433,	0,	'plg_user_profile',	'plugin',	'profile',	'user',	0,	0,	1,	0,	'{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}',	'{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(434,	0,	'plg_extension_joomla',	'plugin',	'joomla',	'extension',	0,	1,	1,	1,	'{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	1,	0),
(435,	0,	'plg_content_joomla',	'plugin',	'joomla',	'content',	0,	1,	1,	0,	'{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(436,	0,	'plg_system_languagecode',	'plugin',	'languagecode',	'system',	0,	0,	1,	0,	'{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	10,	0),
(437,	0,	'plg_quickicon_joomlaupdate',	'plugin',	'joomlaupdate',	'quickicon',	0,	1,	1,	1,	'{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomlaupdate\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(438,	0,	'plg_quickicon_extensionupdate',	'plugin',	'extensionupdate',	'quickicon',	0,	1,	1,	1,	'{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"extensionupdate\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(439,	0,	'plg_captcha_recaptcha',	'plugin',	'recaptcha',	'captcha',	0,	0,	1,	0,	'{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha\"}',	'{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(440,	0,	'plg_system_highlight',	'plugin',	'highlight',	'system',	0,	1,	1,	0,	'{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"highlight\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	7,	0),
(441,	0,	'plg_content_finder',	'plugin',	'finder',	'content',	0,	0,	1,	0,	'{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(442,	0,	'plg_finder_categories',	'plugin',	'categories',	'finder',	0,	1,	1,	0,	'{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	1,	0),
(443,	0,	'plg_finder_contacts',	'plugin',	'contacts',	'finder',	0,	1,	1,	0,	'{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	2,	0),
(444,	0,	'plg_finder_content',	'plugin',	'content',	'finder',	0,	1,	1,	0,	'{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	3,	0),
(445,	0,	'plg_finder_newsfeeds',	'plugin',	'newsfeeds',	'finder',	0,	1,	1,	0,	'{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	4,	0),
(447,	0,	'plg_finder_tags',	'plugin',	'tags',	'finder',	0,	1,	1,	0,	'{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"February 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(448,	0,	'plg_twofactorauth_totp',	'plugin',	'totp',	'twofactorauth',	0,	0,	1,	0,	'{\"name\":\"plg_twofactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"totp\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(449,	0,	'plg_authentication_cookie',	'plugin',	'cookie',	'authentication',	0,	1,	1,	0,	'{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"July 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_COOKIE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cookie\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(450,	0,	'plg_twofactorauth_yubikey',	'plugin',	'yubikey',	'twofactorauth',	0,	0,	1,	0,	'{\"name\":\"plg_twofactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"yubikey\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(451,	0,	'plg_search_tags',	'plugin',	'tags',	'search',	0,	1,	1,	0,	'{\"name\":\"plg_search_tags\",\"type\":\"plugin\",\"creationDate\":\"March 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}',	'{\"search_limit\":\"50\",\"show_tagged_items\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(452,	0,	'plg_system_updatenotification',	'plugin',	'updatenotification',	'system',	0,	1,	1,	0,	'{\"name\":\"plg_system_updatenotification\",\"type\":\"plugin\",\"creationDate\":\"May 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"updatenotification\"}',	'{\"lastrun\":1549808380}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(453,	0,	'plg_editors-xtd_module',	'plugin',	'module',	'editors-xtd',	0,	1,	1,	0,	'{\"name\":\"plg_editors-xtd_module\",\"type\":\"plugin\",\"creationDate\":\"October 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_MODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"module\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(454,	0,	'plg_system_stats',	'plugin',	'stats',	'system',	0,	1,	1,	0,	'{\"name\":\"plg_system_stats\",\"type\":\"plugin\",\"creationDate\":\"November 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"stats\"}',	'{\"mode\":3,\"lastrun\":1549808426,\"unique_id\":\"22cdcf682bc1dcd25d7132cc4e6db4f5b77a9cc2\",\"interval\":12}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(455,	0,	'plg_installer_packageinstaller',	'plugin',	'packageinstaller',	'installer',	0,	1,	1,	1,	'{\"name\":\"plg_installer_packageinstaller\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"packageinstaller\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	1,	0),
(456,	0,	'PLG_INSTALLER_FOLDERINSTALLER',	'plugin',	'folderinstaller',	'installer',	0,	1,	1,	1,	'{\"name\":\"PLG_INSTALLER_FOLDERINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"folderinstaller\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	2,	0),
(457,	0,	'PLG_INSTALLER_URLINSTALLER',	'plugin',	'urlinstaller',	'installer',	0,	1,	1,	1,	'{\"name\":\"PLG_INSTALLER_URLINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"urlinstaller\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	3,	0),
(458,	0,	'plg_quickicon_phpversioncheck',	'plugin',	'phpversioncheck',	'quickicon',	0,	1,	1,	1,	'{\"name\":\"plg_quickicon_phpversioncheck\",\"type\":\"plugin\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpversioncheck\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(459,	0,	'plg_editors-xtd_menu',	'plugin',	'menu',	'editors-xtd',	0,	1,	1,	0,	'{\"name\":\"plg_editors-xtd_menu\",\"type\":\"plugin\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menu\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(460,	0,	'plg_editors-xtd_contact',	'plugin',	'contact',	'editors-xtd',	0,	1,	1,	0,	'{\"name\":\"plg_editors-xtd_contact\",\"type\":\"plugin\",\"creationDate\":\"October 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(461,	0,	'plg_system_fields',	'plugin',	'fields',	'system',	0,	1,	1,	0,	'{\"name\":\"plg_system_fields\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_SYSTEM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(462,	0,	'plg_fields_calendar',	'plugin',	'calendar',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_calendar\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CALENDAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"calendar\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(463,	0,	'plg_fields_checkboxes',	'plugin',	'checkboxes',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_checkboxes\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"checkboxes\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(464,	0,	'plg_fields_color',	'plugin',	'color',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_color\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_COLOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"color\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(465,	0,	'plg_fields_editor',	'plugin',	'editor',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_editor\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_EDITOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"editor\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(466,	0,	'plg_fields_imagelist',	'plugin',	'imagelist',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_imagelist\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"imagelist\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(467,	0,	'plg_fields_integer',	'plugin',	'integer',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_integer\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_INTEGER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"integer\"}',	'{\"multiple\":\"0\",\"first\":\"1\",\"last\":\"100\",\"step\":\"1\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(468,	0,	'plg_fields_list',	'plugin',	'list',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_list\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_LIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"list\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(469,	0,	'plg_fields_media',	'plugin',	'media',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_media\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(470,	0,	'plg_fields_radio',	'plugin',	'radio',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_radio\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_RADIO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"radio\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(471,	0,	'plg_fields_sql',	'plugin',	'sql',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_sql\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_SQL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sql\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(472,	0,	'plg_fields_text',	'plugin',	'text',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_text\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"text\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(473,	0,	'plg_fields_textarea',	'plugin',	'textarea',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_textarea\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"textarea\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(474,	0,	'plg_fields_url',	'plugin',	'url',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_url\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_URL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"url\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(475,	0,	'plg_fields_user',	'plugin',	'user',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_user\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(476,	0,	'plg_fields_usergrouplist',	'plugin',	'usergrouplist',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_usergrouplist\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"usergrouplist\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(477,	0,	'plg_content_fields',	'plugin',	'fields',	'content',	0,	1,	1,	0,	'{\"name\":\"plg_content_fields\",\"type\":\"plugin\",\"creationDate\":\"February 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_CONTENT_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(478,	0,	'plg_editors-xtd_fields',	'plugin',	'fields',	'editors-xtd',	0,	1,	1,	0,	'{\"name\":\"plg_editors-xtd_fields\",\"type\":\"plugin\",\"creationDate\":\"February 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(479,	0,	'plg_sampledata_blog',	'plugin',	'blog',	'sampledata',	0,	1,	1,	0,	'{\"name\":\"plg_sampledata_blog\",\"type\":\"plugin\",\"creationDate\":\"July 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"PLG_SAMPLEDATA_BLOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"blog\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(480,	0,	'plg_system_sessiongc',	'plugin',	'sessiongc',	'system',	0,	1,	1,	0,	'{\"name\":\"plg_system_sessiongc\",\"type\":\"plugin\",\"creationDate\":\"February 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.6\",\"description\":\"PLG_SYSTEM_SESSIONGC_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sessiongc\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(481,	0,	'plg_fields_repeatable',	'plugin',	'repeatable',	'fields',	0,	1,	1,	0,	'{\"name\":\"plg_fields_repeatable\",\"type\":\"plugin\",\"creationDate\":\"April 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_FIELDS_REPEATABLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"repeatable\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(482,	0,	'plg_content_confirmconsent',	'plugin',	'confirmconsent',	'content',	0,	0,	1,	0,	'{\"name\":\"plg_content_confirmconsent\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_CONTENT_CONFIRMCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"confirmconsent\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(483,	0,	'PLG_SYSTEM_ACTIONLOGS',	'plugin',	'actionlogs',	'system',	0,	1,	1,	0,	'{\"name\":\"PLG_SYSTEM_ACTIONLOGS\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(484,	0,	'PLG_ACTIONLOG_JOOMLA',	'plugin',	'joomla',	'actionlog',	0,	1,	1,	0,	'{\"name\":\"PLG_ACTIONLOG_JOOMLA\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_ACTIONLOG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(485,	0,	'plg_system_privacyconsent',	'plugin',	'privacyconsent',	'system',	0,	0,	1,	0,	'{\"name\":\"plg_system_privacyconsent\",\"type\":\"plugin\",\"creationDate\":\"April 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_PRIVACYCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacyconsent\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(486,	0,	'plg_system_logrotation',	'plugin',	'logrotation',	'system',	0,	1,	1,	0,	'{\"name\":\"plg_system_logrotation\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_LOGROTATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logrotation\"}',	'{\"lastrun\":1549808380}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(487,	0,	'plg_privacy_user',	'plugin',	'user',	'privacy',	0,	1,	1,	0,	'{\"name\":\"plg_privacy_user\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(488,	0,	'plg_quickicon_privacycheck',	'plugin',	'privacycheck',	'quickicon',	0,	1,	1,	0,	'{\"name\":\"plg_quickicon_privacycheck\",\"type\":\"plugin\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_QUICKICON_PRIVACYCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacycheck\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(489,	0,	'plg_user_terms',	'plugin',	'terms',	'user',	0,	0,	1,	0,	'{\"name\":\"plg_user_terms\",\"type\":\"plugin\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TERMS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"terms\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(490,	0,	'plg_privacy_contact',	'plugin',	'contact',	'privacy',	0,	1,	1,	0,	'{\"name\":\"plg_privacy_contact\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(491,	0,	'plg_privacy_content',	'plugin',	'content',	'privacy',	0,	1,	1,	0,	'{\"name\":\"plg_privacy_content\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(492,	0,	'plg_privacy_message',	'plugin',	'message',	'privacy',	0,	1,	1,	0,	'{\"name\":\"plg_privacy_message\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_MESSAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"message\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(493,	0,	'plg_privacy_actionlogs',	'plugin',	'actionlogs',	'privacy',	0,	1,	1,	0,	'{\"name\":\"plg_privacy_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(494,	0,	'plg_captcha_recaptcha_invisible',	'plugin',	'recaptcha_invisible',	'captcha',	0,	0,	1,	0,	'{\"name\":\"plg_captcha_recaptcha_invisible\",\"type\":\"plugin\",\"creationDate\":\"November 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_INVISIBLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha_invisible\"}',	'{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(495,	0,	'plg_privacy_consents',	'plugin',	'consents',	'privacy',	0,	1,	1,	0,	'{\"name\":\"plg_privacy_consents\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONSENTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"consents\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(503,	0,	'beez3',	'template',	'beez3',	'',	0,	1,	1,	0,	'{\"name\":\"beez3\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"3.1.0\",\"description\":\"TPL_BEEZ3_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}',	'{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(504,	0,	'hathor',	'template',	'hathor',	'',	1,	1,	1,	0,	'{\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"3.0.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}',	'{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(506,	0,	'protostar',	'template',	'protostar',	'',	0,	1,	1,	0,	'{\"name\":\"protostar\",\"type\":\"template\",\"creationDate\":\"4\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_PROTOSTAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}',	'{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(507,	0,	'isis',	'template',	'isis',	'',	1,	1,	1,	0,	'{\"name\":\"isis\",\"type\":\"template\",\"creationDate\":\"3\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ISIS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}',	'{\"templateColor\":\"\",\"logoFile\":\"\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(600,	802,	'English (en-GB)',	'language',	'en-GB',	'',	0,	1,	1,	1,	'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"January 2019\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.2\",\"description\":\"en-GB site language\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(601,	802,	'English (en-GB)',	'language',	'en-GB',	'',	1,	1,	1,	1,	'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"January 2019\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.2\",\"description\":\"en-GB administrator language\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(700,	0,	'files_joomla',	'file',	'joomla',	'',	0,	1,	1,	1,	'{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"January 2019\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.2\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(802,	0,	'English (en-GB) Language Pack',	'package',	'pkg_en-GB',	'',	0,	1,	1,	1,	'{\"name\":\"English (en-GB) Language Pack\",\"type\":\"package\",\"creationDate\":\"January 2019\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.2.1\",\"description\":\"en-GB language pack\",\"group\":\"\",\"filename\":\"pkg_en-GB\"}',	'',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(803,	0,	'com_swa',	'component',	'com_swa',	'',	1,	1,	0,	0,	'{\"name\":\"com_swa\",\"type\":\"component\",\"creationDate\":\"July 2014\",\"author\":\"SWA Tech Team\",\"copyright\":\"Copyright (C) 2014. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/studentwindsurfing.co.uk\",\"version\":\"0.1\",\"description\":\"Component for the Student Windsurfing Association website\",\"group\":\"\",\"filename\":\"swa\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(804,	0,	'Favourite',	'template',	'favourite',	'',	0,	1,	1,	0,	'{\"name\":\"Favourite\",\"type\":\"template\",\"creationDate\":\"2012\",\"author\":\"FavThemes\",\"copyright\":\"Copyright (C) 2012-2017 FavThemes. All rights reserved.\",\"authorEmail\":\"hello@favthemes.com\",\"authorUrl\":\"https:\\/\\/www.favthemes.com\",\"version\":\"4.1\",\"description\":\"\\n\\n<p style=\\\"max-width: 900px; margin-bottom: 21px; text-align: justify;\\\"><strong>Favourite<\\/strong> is a free responsive Joomla! template with 200+ settings for an easy and fast customization, using Bootstrap 3, HTML5, CSS3, Google Fonts and Font Awesome. Design amazing responsive websites with this smart template that adapts and resizes itself to desktop and mobile devices, making your website looking great for everyone!\\n\\n<\\/br><\\/br>\\n\\nThis free template can be used on unlimited personal or commercial websites, just don''t resell it! Once you ordered and downloaded the template from our store, you have free and unlimited access to all future Joomla! versions of the product.<\\/p>\\n\\n<a href=\\\"http:\\/\\/demo.favthemes.com\\/favourite\\/\\\" class=\\\"btn btn-success\\\" target=\\\"_blank\\\">Demo<\\/a>\\n\\n<a href=\\\"http:\\/\\/www.favthemes.com\\/docs\\\" class=\\\"btn btn-info\\\" target=\\\"_blank\\\">Documentation<\\/a>\\n\\n<\\/br><\\/br>\\n\\n<a href=\\\"http:\\/\\/demo.favthemes.com\\/favourite\\/\\\" target=\\\"_blank\\\">\\n  <img class=\\\"fav-admin-img\\\" style=\\\"padding: 4px; border: 1px solid #DDD; border-radius: 4px;\\\" src=\\\"..\\/templates\\/favourite\\/template_preview.png\\\" alt=\\\"Favourite Responsive Template\\\">\\n<\\/a>\\n\\n<\\/br><\\/br>\\nCopyright &#169; 2012-2017 <a href=\\\"https:\\/\\/www.favthemes.com\\\" target=\\\"_blank\\\" style=\\\"font-weight: bold;\\\">FavThemes<\\/a>.\\n<\\/br><\\/br>\\n\\n<link rel=\\\"stylesheet\\\" href=\\\"..\\/templates\\/favourite\\/admin\\/admin.css\\\" type=\\\"text\\/css\\\" \\/>\\n<link rel=\\\"stylesheet\\\" href=\\\"\\/\\/maxcdn.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\\\" type=\\\"text\\/css\\\" \\/>\\n<link rel=\\\"stylesheet\\\" href=\\\"\\/\\/fonts.googleapis.com\\/css?family=Open+Sans\\\" type=\\\"text\\/css\\\" \\/>\\n<script src=\\\"..\\/templates\\/favourite\\/admin\\/jscolor\\/jscolor.js\\\" type=\\\"text\\/javascript\\\"><\\/script>\\n\\n\",\"group\":\"\",\"filename\":\"templateDetails\"}',	'{\"template_styles\":\"style1\",\"custom_style\":\"\",\"max_width\":\"\",\"show_copyright\":\"1\",\"copyright_text\":\"FavThemes\",\"copyright_text_link\":\"www.favthemes.com\",\"nav_link_padding\":\"\",\"nav_font_size\":\"\",\"nav_text_transform\":\"uppercase\",\"nav_icons_color\":\"\",\"nav_icons_font_size\":\"\",\"nav_google_font\":\"Lato\",\"nav_google_font_weight\":\"700\",\"nav_google_font_style\":\"normal\",\"titles_font_size\":\"\",\"titles_line_height\":\"\",\"titles_text_align\":\"left\",\"titles_text_transform\":\"uppercase\",\"module_title_icon_font_size\":\"\",\"module_title_icon_padding\":\"\",\"module_title_icon_border_radius\":\"\",\"titles_google_font\":\"Lato\",\"titles_google_font_weight\":\"700\",\"titles_google_font_style\":\"normal\",\"error_page_article_id\":\"3\",\"offline_page_style\":\"offline-light\",\"offline_page_bg_image_style\":\"no-repeat; background-attachment: fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;\",\"show_back_to_top\":\"1\",\"back_to_top_style_color\":\"\",\"back_to_top_text\":\"Back to Top\",\"body_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"body_bg_image_overlay\":\"fav-transparent\",\"body_bg_color\":\"\",\"body_color\":\"\",\"body_title_color\":\"\",\"body_link_color\":\"\",\"body_link_hover_color\":\"\",\"notice_bg_style\":\"fav-module-block-color\",\"notice_bg_color\":\"\",\"notice_color\":\"\",\"notice_title_color\":\"\",\"notice_link_color\":\"\",\"notice_link_hover_color\":\"\",\"topbar_bg_style\":\"fav-module-block-light\",\"topbar_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"topbar_bg_image_overlay\":\"fav-transparent\",\"topbar_bg_color\":\"\",\"topbar_color\":\"\",\"topbar_title_color\":\"\",\"topbar_link_color\":\"\",\"topbar_link_hover_color\":\"\",\"slide_width\":\"\",\"slide_bg_style\":\"fav-module-block-light\",\"slide_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"slide_bg_image_overlay\":\"fav-transparent\",\"slide_bg_color\":\"\",\"slide_color\":\"\",\"slide_title_color\":\"\",\"slide_link_color\":\"\",\"slide_link_hover_color\":\"\",\"intro_bg_style\":\"fav-module-block-light\",\"intro_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"intro_bg_image_overlay\":\"fav-transparent\",\"intro_bg_color\":\"\",\"intro_color\":\"\",\"intro_title_color\":\"\",\"intro_link_color\":\"\",\"intro_link_hover_color\":\"\",\"breadcrumbs_bg_style\":\"fav-module-block-light\",\"breadcrumbs_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"breadcrumbs_bg_image_overlay\":\"fav-transparent\",\"breadcrumbs_bg_color\":\"\",\"breadcrumbs_color\":\"\",\"breadcrumbs_title_color\":\"\",\"breadcrumbs_link_color\":\"\",\"breadcrumbs_link_hover_color\":\"\",\"lead_bg_style\":\"fav-module-block-light\",\"lead_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"lead_bg_image_overlay\":\"fav-transparent\",\"lead_bg_color\":\"\",\"lead_color\":\"\",\"lead_title_color\":\"\",\"lead_link_color\":\"\",\"lead_link_hover_color\":\"\",\"promo_bg_style\":\"fav-module-block-light\",\"promo_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"promo_bg_image_overlay\":\"fav-transparent\",\"promo_bg_color\":\"\",\"promo_color\":\"\",\"promo_title_color\":\"\",\"promo_link_color\":\"\",\"promo_link_hover_color\":\"\",\"prime_bg_style\":\"fav-module-block-light\",\"prime_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"prime_bg_image_overlay\":\"fav-transparent\",\"prime_bg_color\":\"\",\"prime_color\":\"\",\"prime_title_color\":\"\",\"prime_link_color\":\"\",\"prime_link_hover_color\":\"\",\"showcase_bg_style\":\"fav-module-block-dark\",\"showcase_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"showcase_bg_image_overlay\":\"fav-transparent\",\"showcase_bg_color\":\"\",\"showcase_color\":\"\",\"showcase_title_color\":\"\",\"showcase_link_color\":\"\",\"showcase_link_hover_color\":\"\",\"feature_bg_style\":\"fav-module-block-light\",\"feature_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"feature_bg_image_overlay\":\"fav-transparent\",\"feature_bg_color\":\"\",\"feature_color\":\"\",\"feature_title_color\":\"\",\"feature_link_color\":\"\",\"feature_link_hover_color\":\"\",\"focus_bg_style\":\"fav-module-block-color\",\"focus_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"focus_bg_image_overlay\":\"fav-transparent\",\"focus_bg_color\":\"\",\"focus_color\":\"\",\"focus_title_color\":\"\",\"focus_link_color\":\"\",\"focus_link_hover_color\":\"\",\"portfolio_bg_style\":\"fav-module-block-dark\",\"portfolio_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"portfolio_bg_image_overlay\":\"fav-transparent\",\"portfolio_bg_color\":\"\",\"portfolio_color\":\"\",\"portfolio_title_color\":\"\",\"portfolio_link_color\":\"\",\"portfolio_link_hover_color\":\"\",\"screen_bg_style\":\"fav-module-block-light\",\"screen_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"screen_bg_image_overlay\":\"fav-transparent\",\"screen_bg_color\":\"\",\"screen_color\":\"\",\"screen_title_color\":\"\",\"screen_link_color\":\"\",\"screen_link_hover_color\":\"\",\"top_bg_style\":\"fav-module-block-light\",\"top_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"top_bg_image_overlay\":\"fav-transparent\",\"top_bg_color\":\"\",\"top_color\":\"\",\"top_title_color\":\"\",\"top_link_color\":\"\",\"top_link_hover_color\":\"\",\"maintop_bg_style\":\"fav-module-block-light\",\"maintop_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"maintop_bg_image_overlay\":\"fav-transparent\",\"maintop_bg_color\":\"\",\"maintop_color\":\"\",\"maintop_title_color\":\"\",\"maintop_link_color\":\"\",\"maintop_link_hover_color\":\"\",\"mainbottom_bg_style\":\"fav-module-block-light\",\"mainbottom_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"mainbottom_bg_image_overlay\":\"fav-transparent\",\"mainbottom_bg_color\":\"\",\"mainbottom_color\":\"\",\"mainbottom_title_color\":\"\",\"mainbottom_link_color\":\"\",\"mainbottom_link_hover_color\":\"\",\"bottom_bg_style\":\"fav-module-block-light\",\"bottom_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"bottom_bg_image_overlay\":\"fav-transparent\",\"bottom_bg_color\":\"\",\"bottom_color\":\"\",\"bottom_title_color\":\"\",\"bottom_link_color\":\"\",\"bottom_link_hover_color\":\"\",\"note_bg_style\":\"fav-module-block-dark\",\"note_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"note_bg_image_overlay\":\"fav-transparent\",\"note_bg_color\":\"\",\"note_color\":\"\",\"note_title_color\":\"\",\"note_link_color\":\"\",\"note_link_hover_color\":\"\",\"base_bg_style\":\"fav-module-block-light\",\"base_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"base_bg_image_overlay\":\"fav-transparent\",\"base_bg_color\":\"\",\"base_color\":\"\",\"base_title_color\":\"\",\"base_link_color\":\"\",\"base_link_hover_color\":\"\",\"block_bg_style\":\"fav-module-block-light\",\"block_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"block_bg_image_overlay\":\"fav-transparent\",\"block_bg_color\":\"\",\"block_color\":\"\",\"block_title_color\":\"\",\"block_link_color\":\"\",\"block_link_hover_color\":\"\",\"user_bg_style\":\"fav-module-block-light\",\"user_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"user_bg_image_overlay\":\"fav-transparent\",\"user_bg_color\":\"\",\"user_color\":\"\",\"user_title_color\":\"\",\"user_link_color\":\"\",\"user_link_hover_color\":\"\",\"footer_bg_style\":\"fav-module-block-dark\",\"footer_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"footer_bg_image_overlay\":\"fav-transparent\",\"footer_bg_color\":\"\",\"footer_color\":\"\",\"footer_title_color\":\"\",\"footer_link_color\":\"\",\"footer_link_hover_color\":\"\",\"show_default_logo\":\"1\",\"default_logo\":\"logo.png\",\"default_logo_img_alt\":\"Favourite template\",\"default_logo_padding\":\"\",\"default_logo_margin\":\"\",\"show_media_logo\":\"0\",\"media_logo_img_alt\":\"Favourite template\",\"media_logo_padding\":\"\",\"media_logo_margin\":\"\",\"show_text_logo\":\"0\",\"text_logo\":\"Favourite\",\"text_logo_color\":\"\",\"text_logo_font_size\":\"\",\"text_logo_google_font\":\"Open Sans\",\"text_logo_google_font_weight\":\"400\",\"text_logo_google_font_style\":\"normal\",\"text_logo_line_height\":\"\",\"text_logo_padding\":\"\",\"text_logo_margin\":\"\",\"show_slogan\":\"0\",\"slogan\":\"slogan text here\",\"slogan_color\":\"\",\"slogan_font_size\":\"\",\"slogan_line_height\":\"\",\"slogan_padding\":\"\",\"slogan_margin\":\"\",\"show_retina_logo\":\"0\",\"retina_logo_height\":\"52px\",\"retina_logo_width\":\"188px\",\"retina_logo_img_alt\":\"Favourite template\",\"retina_logo_padding\":\"0px\",\"retina_logo_margin\":\"0px\",\"mobile_nav_color\":\"favth-navbar-default\",\"show_mobile_menu_text\":\"1\",\"mobile_menu_text\":\"Menu\",\"mobile_paragraph_font_size\":\"\",\"mobile_paragraph_line_height\":\"\",\"mobile_title_font_size\":\"\"}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0),
(805,	0,	'plg_swa_viewlevels',	'plugin',	'viewlevels',	'swa',	0,	1,	1,	0,	'{\"name\":\"plg_swa_viewlevels\",\"type\":\"plugin\",\"creationDate\":\"June 2015\",\"author\":\"Adam Shorland\",\"copyright\":\"Copyright (C) 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"0.0.2\",\"description\":\"Plugin to give inject extra view levels for SWA members.\",\"group\":\"\",\"filename\":\"viewlevels\"}',	'{}',	'',	'',	0,	'0000-00-00 00:00:00',	0,	0);

DROP TABLE IF EXISTS `swana_fields`;
CREATE TABLE `swana_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_user_id` (`created_user_id`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_fields_categories`;
CREATE TABLE `swana_fields_categories` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_fields_groups`;
CREATE TABLE `swana_fields_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_fields_values`;
CREATE TABLE `swana_fields_values` (
  `field_id` int(10) unsigned NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `idx_field_id` (`field_id`),
  KEY `idx_item_id` (`item_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_finder_filters`;
CREATE TABLE `swana_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links`;
CREATE TABLE `swana_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` text,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`(100)),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_terms0`;
CREATE TABLE `swana_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_terms1`;
CREATE TABLE `swana_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_terms2`;
CREATE TABLE `swana_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_terms3`;
CREATE TABLE `swana_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_terms4`;
CREATE TABLE `swana_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_terms5`;
CREATE TABLE `swana_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_terms6`;
CREATE TABLE `swana_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_terms7`;
CREATE TABLE `swana_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_terms8`;
CREATE TABLE `swana_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_terms9`;
CREATE TABLE `swana_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_termsa`;
CREATE TABLE `swana_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_termsb`;
CREATE TABLE `swana_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_termsc`;
CREATE TABLE `swana_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_termsd`;
CREATE TABLE `swana_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_termse`;
CREATE TABLE `swana_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_links_termsf`;
CREATE TABLE `swana_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_taxonomy`;
CREATE TABLE `swana_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `swana_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1,	0,	'ROOT',	0,	0,	0);

DROP TABLE IF EXISTS `swana_finder_taxonomy_map`;
CREATE TABLE `swana_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_terms`;
CREATE TABLE `swana_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_terms_common`;
CREATE TABLE `swana_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `swana_finder_terms_common` (`term`, `language`) VALUES
('a',	'en'),
('about',	'en'),
('after',	'en'),
('ago',	'en'),
('all',	'en'),
('am',	'en'),
('an',	'en'),
('and',	'en'),
('any',	'en'),
('are',	'en'),
('aren\'t',	'en'),
('as',	'en'),
('at',	'en'),
('be',	'en'),
('but',	'en'),
('by',	'en'),
('for',	'en'),
('from',	'en'),
('get',	'en'),
('go',	'en'),
('how',	'en'),
('if',	'en'),
('in',	'en'),
('into',	'en'),
('is',	'en'),
('isn\'t',	'en'),
('it',	'en'),
('its',	'en'),
('me',	'en'),
('more',	'en'),
('most',	'en'),
('must',	'en'),
('my',	'en'),
('new',	'en'),
('no',	'en'),
('none',	'en'),
('not',	'en'),
('nothing',	'en'),
('of',	'en'),
('off',	'en'),
('often',	'en'),
('old',	'en'),
('on',	'en'),
('onc',	'en'),
('once',	'en'),
('only',	'en'),
('or',	'en'),
('other',	'en'),
('our',	'en'),
('ours',	'en'),
('out',	'en'),
('over',	'en'),
('page',	'en'),
('she',	'en'),
('should',	'en'),
('small',	'en'),
('so',	'en'),
('some',	'en'),
('than',	'en'),
('thank',	'en'),
('that',	'en'),
('the',	'en'),
('their',	'en'),
('theirs',	'en'),
('them',	'en'),
('then',	'en'),
('there',	'en'),
('these',	'en'),
('they',	'en'),
('this',	'en'),
('those',	'en'),
('thus',	'en'),
('time',	'en'),
('times',	'en'),
('to',	'en'),
('too',	'en'),
('true',	'en'),
('under',	'en'),
('until',	'en'),
('up',	'en'),
('upon',	'en'),
('use',	'en'),
('user',	'en'),
('users',	'en'),
('version',	'en'),
('very',	'en'),
('via',	'en'),
('want',	'en'),
('was',	'en'),
('way',	'en'),
('were',	'en'),
('what',	'en'),
('when',	'en'),
('where',	'en'),
('which',	'en'),
('who',	'en'),
('whom',	'en'),
('whose',	'en'),
('why',	'en'),
('wide',	'en'),
('will',	'en'),
('with',	'en'),
('within',	'en'),
('without',	'en'),
('would',	'en'),
('yes',	'en'),
('yet',	'en'),
('you',	'en'),
('your',	'en'),
('yours',	'en');

DROP TABLE IF EXISTS `swana_finder_tokens`;
CREATE TABLE `swana_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_tokens_aggregate`;
CREATE TABLE `swana_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_finder_types`;
CREATE TABLE `swana_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `swana_languages`;
CREATE TABLE `swana_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1,	0,	'en-GB',	'English (en-GB)',	'English (United Kingdom)',	'en',	'en_gb',	'',	'',	'',	'',	1,	1,	1);

DROP TABLE IF EXISTS `swana_menu`;
CREATE TABLE `swana_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_language` (`language`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100))
) ENGINE=InnoDB AUTO_INCREMENT=2215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1,	'',	'Menu_Item_Root',	'root',	'',	'',	'',	'',	1,	0,	0,	0,	0,	'0000-00-00 00:00:00',	0,	0,	'',	0,	'',	0,	243,	0,	'*',	0),
(587,	'main-nav-bar',	'My Tickets',	'my-tickets',	'',	'account/my-tickets',	'index.php?option=com_swa&view=membertickets',	'component',	1,	589,	2,	803,	4255,	'2019-02-10 15:59:14',	0,	2,	'',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	96,	97,	0,	'*',	0),
(589,	'main-nav-bar',	'Account',	'account',	'',	'account',	'',	'heading',	1,	1,	1,	0,	4255,	'2019-02-10 15:59:08',	0,	2,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1}',	91,	100,	0,	'*',	0),
(590,	'main-nav-bar',	'Sponsors',	'sponsors',	'',	'the-swa/sponsors',	'index.php?option=com_content&view=article&id=752',	'component',	1,	660,	2,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	8,	9,	0,	'*',	0),
(591,	'main-nav-bar',	'Club',	'club',	'',	'club',	'',	'heading',	1,	1,	1,	0,	4255,	'2019-02-10 15:58:42',	0,	7,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1}',	57,	70,	0,	'*',	0),
(602,	'main-nav-bar',	'How to attract freshers',	'how-to-attract-freshers',	'',	'club/how-to-attract-freshers',	'index.php?option=com_content&view=article&id=518',	'component',	-2,	591,	2,	22,	0,	'0000-00-00 00:00:00',	0,	7,	' ',	0,	'{\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	62,	63,	0,	'*',	0),
(603,	'main-nav-bar',	'How to (legally) make money',	'how-to-legally-make-money',	'',	'club/how-to-legally-make-money',	'index.php?option=com_content&view=article&id=517',	'component',	-2,	591,	2,	22,	0,	'0000-00-00 00:00:00',	0,	7,	' ',	0,	'{\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	64,	65,	0,	'*',	0),
(604,	'main-nav-bar',	'How to (sensibly) spend money',	'how-to-sensibly-spend-money',	'',	'club/how-to-sensibly-spend-money',	'index.php?option=com_content&view=article&id=519',	'component',	-2,	591,	2,	22,	0,	'0000-00-00 00:00:00',	0,	7,	' ',	0,	'{\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	66,	67,	0,	'*',	0),
(605,	'main-nav-bar',	'How to run a safe event',	'how-to-run-a-safe-event',	'',	'club/how-to-run-a-safe-event',	'index.php?option=com_content&view=article&id=520',	'component',	-2,	591,	2,	22,	0,	'0000-00-00 00:00:00',	0,	7,	' ',	0,	'{\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	68,	69,	0,	'*',	0),
(610,	'main-nav-bar',	'Events',	'events',	'',	'events',	'',	'heading',	1,	1,	1,	0,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1}',	43,	56,	0,	'*',	0),
(614,	'main-nav-bar',	'My Account',	'my-account',	'',	'account/my-account',	'index.php?option=com_users&view=profile&layout=edit',	'component',	1,	589,	2,	25,	4255,	'2019-02-10 15:59:10',	0,	2,	'',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	92,	93,	0,	'*',	0),
(626,	'main-nav-bar',	'Competition Rules',	'competition-rules',	'',	'events/competition-rules',	'index.php?option=com_content&view=article&id=549',	'component',	1,	610,	2,	22,	0,	'0000-00-00 00:00:00',	0,	1,	'',	0,	'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	52,	53,	0,	'*',	0),
(627,	'main-nav-bar',	'Format & Details',	'event-details',	'',	'events/event-details',	'index.php?option=com_content&view=article&id=124',	'component',	1,	610,	2,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	50,	51,	0,	'*',	0),
(628,	'main-nav-bar',	'Help us',	'help-us',	'',	'the-swa/help-us',	'index.php?option=com_content&view=article&id=161',	'component',	1,	660,	2,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	10,	11,	0,	'*',	0),
(629,	'main-nav-bar',	'Our History',	'our-history',	'',	'the-swa/our-history',	'index.php?option=com_content&view=article&id=295',	'component',	1,	660,	2,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	6,	7,	0,	'*',	0),
(630,	'bottom-nav-bar',	'Legal Information',	'legal-information',	'',	'legal-information',	'index.php?option=com_content&view=article&id=317',	'component',	1,	1,	1,	22,	4255,	'2019-02-10 15:57:21',	0,	1,	' ',	0,	'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	17,	18,	0,	'*',	0),
(631,	'bottom-nav-bar',	'FAQ / Contact Us',	'faq-contact-us',	'',	'faq-contact-us',	'index.php?option=com_content&view=article&id=192',	'component',	-2,	1,	1,	22,	0,	'0000-00-00 00:00:00',	0,	1,	'',	0,	'{\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	129,	130,	0,	'*',	0),
(632,	'main-nav-bar',	'What do we do',	'what-do-we-do',	'',	'the-swa/what-do-we-do',	'index.php?option=com_content&view=article&id=206',	'component',	1,	660,	2,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	4,	5,	0,	'*',	0),
(633,	'bottom-nav-bar',	'Privacy Policy',	'privacy-policy',	'',	'privacy-policy',	'index.php?option=com_content&view=article&id=425',	'component',	1,	1,	1,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	19,	20,	0,	'*',	0),
(634,	'main-nav-bar',	'Who are we?',	'who-are-we',	'',	'the-swa/who-are-we',	'index.php?option=com_swa&view=committee',	'component',	1,	660,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	2,	3,	0,	'*',	0),
(635,	'main-nav-bar',	'Org',	'organisation',	'',	'organisation',	'',	'heading',	1,	1,	1,	0,	4255,	'2019-02-10 15:58:49',	0,	8,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1}',	71,	90,	0,	'*',	0),
(660,	'main-nav-bar',	'The SWA',	'the-swa',	'',	'the-swa',	'',	'heading',	1,	1,	1,	0,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1}',	1,	14,	0,	'*',	0),
(663,	'main',	'com_banners',	'Banners',	'',	'Banners',	'index.php?option=com_banners',	'component',	0,	1,	1,	4,	0,	'0000-00-00 00:00:00',	0,	0,	'class:banners',	0,	'',	119,	128,	0,	'*',	1),
(664,	'main',	'com_banners',	'Banners',	'',	'Banners/Banners',	'index.php?option=com_banners',	'component',	0,	663,	2,	4,	0,	'0000-00-00 00:00:00',	0,	0,	'class:banners',	0,	'',	120,	121,	0,	'*',	1),
(665,	'main',	'com_banners_categories',	'Categories',	'',	'Banners/Categories',	'index.php?option=com_categories&extension=com_banners',	'component',	0,	663,	2,	6,	0,	'0000-00-00 00:00:00',	0,	0,	'class:banners-cat',	0,	'',	122,	123,	0,	'*',	1),
(666,	'main',	'com_banners_clients',	'Clients',	'',	'Banners/Clients',	'index.php?option=com_banners&view=clients',	'component',	0,	663,	2,	4,	0,	'0000-00-00 00:00:00',	0,	0,	'class:banners-clients',	0,	'',	124,	125,	0,	'*',	1),
(667,	'main',	'com_banners_tracks',	'Tracks',	'',	'Banners/Tracks',	'index.php?option=com_banners&view=tracks',	'component',	0,	663,	2,	4,	0,	'0000-00-00 00:00:00',	0,	0,	'class:banners-tracks',	0,	'',	126,	127,	0,	'*',	1),
(668,	'main',	'com_contact',	'Contacts',	'',	'Contacts',	'index.php?option=com_contact',	'component',	0,	1,	1,	8,	0,	'0000-00-00 00:00:00',	0,	0,	'class:contact',	0,	'',	131,	136,	0,	'*',	1),
(669,	'main',	'com_contact_contacts',	'Contacts',	'',	'Contacts/Contacts',	'index.php?option=com_contact',	'component',	0,	668,	2,	8,	0,	'0000-00-00 00:00:00',	0,	0,	'class:contact',	0,	'',	132,	133,	0,	'*',	1),
(670,	'main',	'com_contact_categories',	'Categories',	'',	'Contacts/Categories',	'index.php?option=com_categories&extension=com_contact',	'component',	0,	668,	2,	6,	0,	'0000-00-00 00:00:00',	0,	0,	'class:contact-cat',	0,	'',	134,	135,	0,	'*',	1),
(671,	'main',	'com_messages',	'Messaging',	'',	'Messaging',	'index.php?option=com_messages',	'component',	0,	1,	1,	15,	0,	'0000-00-00 00:00:00',	0,	0,	'class:messages',	0,	'',	137,	140,	0,	'*',	1),
(672,	'main',	'com_messages_add',	'New Private Message',	'',	'Messaging/New Private Message',	'index.php?option=com_messages&task=message.add',	'component',	0,	671,	2,	15,	0,	'0000-00-00 00:00:00',	0,	0,	'class:messages-add',	0,	'',	138,	139,	0,	'*',	1),
(674,	'main',	'com_newsfeeds',	'News Feeds',	'',	'News Feeds',	'index.php?option=com_newsfeeds',	'component',	0,	1,	1,	17,	0,	'0000-00-00 00:00:00',	0,	0,	'class:newsfeeds',	0,	'',	141,	146,	0,	'*',	1),
(675,	'main',	'com_newsfeeds_feeds',	'Feeds',	'',	'News Feeds/Feeds',	'index.php?option=com_newsfeeds',	'component',	0,	674,	2,	17,	0,	'0000-00-00 00:00:00',	0,	0,	'class:newsfeeds',	0,	'',	142,	143,	0,	'*',	1),
(676,	'main',	'com_newsfeeds_categories',	'Categories',	'',	'News Feeds/Categories',	'index.php?option=com_categories&extension=com_newsfeeds',	'component',	0,	674,	2,	6,	0,	'0000-00-00 00:00:00',	0,	0,	'class:newsfeeds-cat',	0,	'',	144,	145,	0,	'*',	1),
(677,	'main',	'com_redirect',	'Redirect',	'',	'Redirect',	'index.php?option=com_redirect',	'component',	0,	1,	1,	24,	0,	'0000-00-00 00:00:00',	0,	0,	'class:redirect',	0,	'',	147,	148,	0,	'*',	1),
(678,	'main',	'com_search',	'Basic Search',	'',	'Basic Search',	'index.php?option=com_search',	'component',	0,	1,	1,	19,	0,	'0000-00-00 00:00:00',	0,	0,	'class:search',	0,	'',	149,	150,	0,	'*',	1),
(679,	'main',	'com_finder',	'Smart Search',	'',	'Smart Search',	'index.php?option=com_finder',	'component',	0,	1,	1,	27,	0,	'0000-00-00 00:00:00',	0,	0,	'class:finder',	0,	'',	151,	152,	0,	'*',	1),
(680,	'main',	'com_joomlaupdate',	'Joomla! Update',	'',	'Joomla! Update',	'index.php?option=com_joomlaupdate',	'component',	1,	1,	1,	28,	0,	'0000-00-00 00:00:00',	0,	0,	'class:joomlaupdate',	0,	'',	153,	154,	0,	'*',	1),
(681,	'main',	'com_tags',	'Tags',	'',	'Tags',	'index.php?option=com_tags',	'component',	0,	1,	1,	29,	0,	'0000-00-00 00:00:00',	0,	1,	'class:tags',	0,	'',	155,	156,	0,	'',	1),
(682,	'main',	'com_postinstall',	'Post-installation messages',	'',	'Post-installation messages',	'index.php?option=com_postinstall',	'component',	0,	1,	1,	32,	0,	'0000-00-00 00:00:00',	0,	1,	'class:postinstall',	0,	'',	157,	158,	0,	'*',	1),
(901,	'main-nav-bar',	'My Membership',	'my-membership',	'',	'account/my-membership',	'index.php?option=com_swa&view=memberdetails',	'component',	1,	589,	2,	803,	4255,	'2019-02-10 15:59:12',	0,	2,	'',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	94,	95,	0,	'*',	0),
(963,	'main-nav-bar',	'Members',	'members',	'',	'club/members',	'index.php?option=com_swa&view=universitymembers',	'component',	1,	591,	2,	803,	4255,	'2019-02-10 15:58:45',	0,	7,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	58,	59,	0,	'*',	0),
(964,	'main-nav-bar',	'Event Attendees',	'event-attendees',	'',	'club/event-attendees',	'index.php?option=com_swa&view=universityeventattendees',	'component',	1,	591,	2,	803,	4255,	'2019-02-10 15:58:46',	0,	7,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	60,	61,	0,	'*',	0),
(1043,	'main-nav-bar',	'My Details',	'my-details',	'',	'organisation/my-details',	'index.php?option=com_swa&view=orgcommitteedetails',	'component',	1,	635,	2,	803,	4255,	'2019-02-10 15:58:51',	0,	8,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	72,	73,	0,	'*',	0),
(1044,	'main-nav-bar',	'Committee',	'committee',	'',	'organisation/committee',	'index.php?option=com_swa&view=committee',	'component',	1,	635,	2,	803,	4255,	'2019-02-10 15:58:53',	0,	8,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	74,	75,	0,	'*',	0),
(1066,	'main-nav-bar',	'Calendar',	'calendar',	'',	'events/calendar',	'index.php?option=com_swa&view=events',	'component',	1,	610,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	46,	47,	0,	'*',	0),
(1068,	'main-nav-bar',	'Season Results',	'season-results',	'',	'events/season-results',	'index.php?option=com_swa&view=seasonresults',	'component',	1,	610,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	54,	55,	0,	'*',	0),
(1069,	'main-nav-bar',	'Qualified members',	'qualified-members',	'',	'organisation/qualified-members',	'index.php?option=com_swa&view=orgmemberqualifications',	'component',	1,	635,	2,	803,	4255,	'2019-02-10 15:58:57',	0,	8,	'',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	76,	77,	0,	'*',	0),
(1089,	'main-nav-bar',	'My Qualifications',	'my-qualifications',	'',	'account/my-qualifications',	'index.php?option=com_swa&view=qualifications',	'component',	1,	589,	2,	803,	4255,	'2019-02-10 15:59:15',	0,	2,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	98,	99,	0,	'*',	0),
(1109,	'main-nav-bar',	'Buy tickets',	'buy-tickets',	'',	'events/buy-tickets',	'index.php?option=com_swa&view=ticketpurchase',	'component',	1,	610,	2,	803,	4255,	'2019-02-10 15:58:33',	0,	1,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	48,	49,	0,	'*',	0),
(1167,	'main-nav-bar',	'Universities',	'universities',	'',	'organisation/universities',	'index.php?option=com_swa&view=universities',	'component',	1,	635,	2,	803,	4255,	'2019-02-10 15:59:00',	0,	8,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	78,	79,	0,	'*',	0),
(1374,	'main-nav-bar',	'Contact Us',	'contact-us',	'',	'the-swa/contact-us',	'index.php?option=com_contact&view=contact&id=1',	'component',	1,	660,	2,	8,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"presentation_style\":\"\",\"show_contact_category\":\"\",\"show_contact_list\":\"\",\"show_tags\":\"\",\"show_info\":\"\",\"show_name\":\"\",\"show_position\":\"\",\"show_email\":\"\",\"add_mailto_link\":\"\",\"show_street_address\":\"\",\"show_suburb\":\"\",\"show_state\":\"\",\"show_postcode\":\"\",\"show_country\":\"\",\"show_telephone\":\"\",\"show_mobile\":\"\",\"show_fax\":\"\",\"show_webpage\":\"\",\"show_image\":\"\",\"allow_vcard\":\"\",\"show_misc\":\"\",\"show_articles\":\"\",\"articles_display_num\":\"\",\"show_links\":\"\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"show_email_form\":\"\",\"show_email_copy\":\"\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"\",\"custom_reply\":\"\",\"redirect\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	12,	13,	0,	'*',	0),
(1451,	'main-nav-bar',	'Login',	'login',	'',	'login',	'index.php?option=com_users&view=login',	'component',	1,	1,	1,	25,	4255,	'2019-02-10 16:00:40',	0,	5,	' ',	0,	'{\"loginredirectchoice\":\"1\",\"login_redirect_url\":\"\",\"login_redirect_menuitem\":\"1706\",\"logindescription_show\":\"1\",\"login_description\":\"\",\"login_image\":\"\",\"logoutredirectchoice\":\"1\",\"logout_redirect_url\":\"\",\"logout_redirect_menuitem\":\"\",\"logoutdescription_show\":\"1\",\"logout_description\":\"\",\"logout_image\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	115,	116,	0,	'*',	0),
(1657,	'main-nav-bar',	'Logout',	'logout',	'',	'logout',	'index.php?option=com_users&view=login&layout=logout&task=user.menulogout',	'component',	1,	1,	1,	25,	4255,	'2019-02-10 16:00:39',	0,	2,	' ',	0,	'{\"logout\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	113,	114,	0,	'*',	0),
(1663,	'main-nav-bar',	'About',	'about',	'',	'about',	'',	'heading',	-2,	1,	1,	0,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1}',	117,	118,	0,	'*',	0),
(1679,	'main',	'COM_SMARTCOUNTDOWN3',	'com-smartcountdown3',	'',	'com-smartcountdown3',	'index.php?option=com_smartcountdown3',	'component',	1,	1,	1,	10020,	0,	'0000-00-00 00:00:00',	0,	1,	'class:component',	0,	'{}',	161,	162,	0,	'',	1),
(1680,	'main-nav-bar',	'Search',	'search',	'',	'search',	'index.php?option=com_search&view=search',	'component',	-2,	1,	1,	19,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"search_phrases\":\"\",\"search_areas\":\"\",\"show_date\":\"\",\"searchphrase\":\"0\",\"ordering\":\"newest\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	163,	164,	0,	'*',	0),
(1681,	'main-nav-bar',	'Blog',	'blog',	'',	'media-outlet/blog',	'index.php?option=com_content&view=category&layout=blog&id=302',	'component',	-2,	1687,	2,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"layout_type\":\"blog\",\"show_category_heading_title_text\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"-1\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_featured\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	36,	37,	0,	'*',	0),
(1682,	'main-nav-bar',	'People',	'people',	'',	'media-outlet/people',	'index.php?option=com_content&view=category&layout=blog&id=297',	'component',	-2,	1687,	2,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"layout_type\":\"blog\",\"show_category_heading_title_text\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_featured\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	30,	31,	0,	'*',	0),
(1683,	'main-nav-bar',	'SWA Society',	'society',	'',	'media-outlet/society',	'index.php?option=com_content&view=category&layout=blog&id=297',	'component',	1,	1687,	2,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"layout_type\":\"blog\",\"show_category_heading_title_text\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_featured\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	24,	25,	0,	'*',	0),
(1684,	'main-nav-bar',	'Skills & Guides',	'skills',	'',	'media-outlet/skills',	'index.php?option=com_content&view=category&layout=blog&id=299',	'component',	1,	1687,	2,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"layout_type\":\"blog\",\"show_category_heading_title_text\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_featured\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	28,	29,	0,	'*',	0),
(1685,	'main-nav-bar',	'SWA Sponsors',	'sponsors',	'',	'media-outlet/sponsors',	'index.php?option=com_content&view=category&layout=blog&id=296',	'component',	0,	1687,	2,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"layout_type\":\"blog\",\"show_category_heading_title_text\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_featured\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	26,	27,	0,	'*',	0),
(1686,	'main-nav-bar',	'SWA Series',	'series',	'',	'media-outlet/series',	'index.php?Itemid=',	'alias',	1,	1687,	2,	0,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"aliasoptions\":\"1690\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1}',	22,	23,	0,	'*',	0),
(1687,	'main-nav-bar',	'Media',	'media-outlet',	'',	'media-outlet',	'',	'heading',	1,	1,	1,	0,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1}',	21,	42,	0,	'*',	0),
(1688,	'main-nav-bar',	'Archive',	'archive',	'',	'media-outlet/archive',	'index.php?option=com_content&view=category&layout=blog&id=306',	'component',	-2,	1687,	2,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"layout_type\":\"blog\",\"show_category_heading_title_text\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_featured\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	34,	35,	0,	'*',	0),
(1689,	'main-nav-bar',	'Miscellaneous',	'miscellaneous',	'',	'media-outlet/miscellaneous',	'index.php?option=com_content&view=category&layout=blog&id=307',	'component',	-2,	1687,	2,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"layout_type\":\"blog\",\"show_category_heading_title_text\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_featured\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	32,	33,	0,	'*',	0),
(1690,	'main-nav-bar',	'Articles',	'articles',	'',	'events/articles',	'index.php?option=com_content&view=category&layout=blog&id=144',	'component',	1,	610,	2,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"layout_type\":\"blog\",\"show_category_heading_title_text\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_featured\":\"\",\"article_layout\":\"_:default\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	44,	45,	0,	'*',	0),
(1695,	'main',	'COM_FAVICON',	'com-favicon',	'',	'com-favicon',	'index.php?option=com_favicon',	'component',	1,	1,	1,	10035,	0,	'0000-00-00 00:00:00',	0,	1,	'../media/com_favicon/assets/images/favicon16.png',	0,	'{}',	165,	166,	0,	'',	1),
(1696,	'main-nav-bar',	'Help',	'help',	'',	'help',	'index.php?option=com_faqbookpro&view=section&id=7',	'component',	1,	1,	1,	10007,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	101,	112,	0,	'*',	0),
(1697,	'main-nav-bar',	'Members',	'members',	'',	'help/members',	'index.php?option=com_faqbookpro&view=topic&id=16',	'component',	1,	1696,	2,	10007,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	104,	105,	0,	'*',	0),
(1698,	'main-nav-bar',	'Club committee',	'club-committee',	'',	'help/club-committee',	'index.php?option=com_faqbookpro&view=topic&id=17',	'component',	1,	1696,	2,	10007,	0,	'0000-00-00 00:00:00',	0,	7,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	108,	109,	0,	'*',	0),
(1699,	'main-nav-bar',	'SWA committee',	'swa-committee',	'',	'help/swa-committee',	'index.php?option=com_faqbookpro&view=topic&id=18',	'component',	1,	1696,	2,	10007,	0,	'0000-00-00 00:00:00',	0,	8,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	110,	111,	0,	'*',	0),
(1700,	'main-nav-bar',	'Website',	'website',	'',	'help/website',	'index.php?option=com_faqbookpro&view=section&id=7',	'component',	-2,	1696,	2,	10007,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	106,	107,	0,	'*',	0),
(1701,	'main-nav-bar',	'The SWA',	'the-swa',	'',	'help/the-swa',	'index.php?option=com_faqbookpro&view=topic&id=15',	'component',	1,	1696,	2,	10007,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	102,	103,	0,	'*',	0),
(1702,	'main',	'COM_RANTISPAM',	'com-rantispam',	'',	'com-rantispam',	'index.php?option=com_rantispam',	'component',	1,	1,	1,	10043,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_rantispam/assets/images/s_com_rantispam.png',	0,	'{}',	167,	174,	0,	'',	1),
(1703,	'main',	'COM_RANTISPAM_TITLE_SPAMS',	'com-rantispam-title-spams',	'',	'com-rantispam/com-rantispam-title-spams',	'index.php?option=com_rantispam&view=spams',	'component',	1,	1702,	2,	10043,	0,	'0000-00-00 00:00:00',	0,	1,	'class:component',	0,	'{}',	168,	169,	0,	'',	1),
(1704,	'main',	'COM_RANTISPAM_TITLE_BANNEDIPS',	'com-rantispam-title-bannedips',	'',	'com-rantispam/com-rantispam-title-bannedips',	'index.php?option=com_rantispam&view=bannedips',	'component',	1,	1702,	2,	10043,	0,	'0000-00-00 00:00:00',	0,	1,	'class:component',	0,	'{}',	170,	171,	0,	'',	1),
(1705,	'main',	'COM_RANTISPAM_TITLE_ABOUT',	'com-rantispam-title-about',	'',	'com-rantispam/com-rantispam-title-about',	'index.php?option=com_rantispam&view=about',	'component',	1,	1702,	2,	10043,	0,	'0000-00-00 00:00:00',	0,	1,	'class:component',	0,	'{}',	172,	173,	0,	'',	1),
(1706,	'bottom-nav-bar',	'Home',	'home',	'',	'home',	'index.php?option=com_content&view=featured',	'component',	1,	1,	1,	22,	4255,	'2019-02-10 15:57:19',	0,	1,	' ',	0,	'{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"orderby_pri\":\"none\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	15,	16,	1,	'*',	0),
(1712,	'main',	'Blank Component',	'blank-component',	'',	'blank-component',	'index.php?option=com_blankcomponent',	'component',	1,	1,	1,	10052,	0,	'0000-00-00 00:00:00',	0,	1,	'class:component',	0,	'{}',	175,	176,	0,	'',	1),
(1713,	'main-nav-bar',	'home2',	'home2',	'',	'home2',	'index.php?option=com_content&view=featured',	'component',	-2,	1,	1,	22,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	177,	178,	0,	'*',	0),
(1728,	'main-nav-bar',	'Images & Videos',	'gallery',	'',	'media-outlet/gallery',	'index.php?option=com_bt_media&view=category&catid=6',	'component',	-2,	1687,	2,	10066,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"theme\":\"\",\"show_filter_bar\":\"\",\"cat_cat_info\":\"\",\"cat_show_parent\":\"\",\"cat_show_child\":\"\",\"show_media_type\":\"\",\"show_list_limit_item\":\"\",\"show_ordering\":\"\",\"order_type\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	38,	41,	0,	'*',	0),
(1730,	'main',	'COM_BT_MEDIA',	'com-bt-media',	'',	'com-bt-media',	'index.php?option=com_bt_media',	'component',	1,	1,	1,	10066,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_bt_media/assets/icon/s_bt_media.png',	0,	'{}',	179,	188,	0,	'',	1),
(1731,	'main',	'COM_BT_MEDIA_MENU_CPANEL_TITLE',	'com-bt-media-menu-cpanel-title',	'',	'com-bt-media/com-bt-media-menu-cpanel-title',	'index.php?option=com_bt_media&view=controlpanel',	'component',	1,	1730,	2,	10066,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_bt_media/assets/icon/s_bt_media.png',	0,	'{}',	180,	181,	0,	'',	1),
(1732,	'main',	'COM_BT_MEDIA_MENU_CATEGORYS_TITLE',	'com-bt-media-menu-categorys-title',	'',	'com-bt-media/com-bt-media-menu-categorys-title',	'index.php?option=com_bt_media&view=categories',	'component',	1,	1730,	2,	10066,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_bt_media/assets/icon/s_category-manager.png',	0,	'{}',	182,	183,	0,	'',	1),
(1733,	'main',	'COM_BT_MEDIA_MENU_MEDIASMANAGEMENT_TITLE',	'com-bt-media-menu-mediasmanagement-title',	'',	'com-bt-media/com-bt-media-menu-mediasmanagement-title',	'index.php?option=com_bt_media&view=list',	'component',	1,	1730,	2,	10066,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_bt_media/assets/icon/s_media-manager.png',	0,	'{}',	184,	185,	0,	'',	1),
(1734,	'main',	'COM_BT_MEDIA_MENU_TAG_TITLE',	'com-bt-media-menu-tag-title',	'',	'com-bt-media/com-bt-media-menu-tag-title',	'index.php?option=com_bt_media&view=tags',	'component',	1,	1730,	2,	10066,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_bt_media/assets/icon/s_tags-manager.png',	0,	'{}',	186,	187,	0,	'',	1),
(1735,	'main-nav-bar',	'Videos',	'videos',	'',	'media-outlet/gallery/videos',	'index.php?option=com_bt_media&view=list&categories[0]=',	'component',	-2,	1728,	3,	10066,	0,	'0000-00-00 00:00:00',	0,	1,	' ',	0,	'{\"theme\":\"\",\"show_filter_bar\":\"\",\"show_sub_media\":\"\",\"show_media_type\":\"video\",\"show_list_limit_item\":\"\",\"show_ordering\":\"\",\"order_type\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	39,	40,	0,	'*',	0),
(1736,	'main-nav-bar',	'Committee Gallery',	'committee-gallery',	'',	'organisation/committee-gallery',	'index.php?option=com_bt_media&view=category&catid=11',	'component',	1,	635,	2,	10066,	0,	'0000-00-00 00:00:00',	0,	8,	' ',	0,	'{\"theme\":\"\",\"show_filter_bar\":\"\",\"cat_cat_info\":\"\",\"cat_show_parent\":\"\",\"cat_show_child\":\"\",\"show_media_type\":\"\",\"show_list_limit_item\":\"\",\"show_ordering\":\"\",\"order_type\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	80,	81,	0,	'*',	0),
(1737,	'main-nav-bar',	'Media Upload',	'media-upload',	'',	'organisation/media-upload',	'index.php?option=com_bt_media&view=detail&layout=edit',	'component',	1,	635,	2,	10066,	0,	'0000-00-00 00:00:00',	0,	8,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	82,	83,	0,	'*',	0),
(1738,	'main-nav-bar',	'Create Article',	'create-article',	'',	'organisation/create-article',	'index.php?option=com_content&view=form&layout=edit',	'component',	1,	635,	2,	22,	0,	'0000-00-00 00:00:00',	0,	8,	' ',	0,	'{\"enable_category\":\"0\",\"catid\":\"\",\"redirect_menuitem\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	84,	85,	0,	'*',	0),
(1741,	'main-nav-bar',	'Emails',	'emails',	'',	'organisation/emails',	'index.php?option=com_phcloud&view=emails',	'component',	1,	635,	2,	10090,	0,	'0000-00-00 00:00:00',	0,	8,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	86,	87,	0,	'*',	0),
(1742,	'main-nav-bar',	'PH Ctrl Pan',	'ph-ctrl-pan',	'',	'organisation/ph-ctrl-pan',	'index.php?option=com_phcloud&view=cpanel',	'component',	-2,	635,	2,	10090,	0,	'0000-00-00 00:00:00',	0,	6,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	88,	89,	0,	'*',	0),
(1744,	'main',	'COM_PHCLOUD',	'com-phcloud',	'',	'com-phcloud',	'index.php?option=com_phcloud',	'component',	1,	1,	1,	10090,	0,	'0000-00-00 00:00:00',	0,	1,	'class:component',	0,	'{}',	189,	190,	0,	'',	1),
(1745,	'main',	'COM_PROFILES',	'com-profiles',	'',	'com-profiles',	'index.php?option=com_profiles',	'component',	1,	1,	1,	10093,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_profiles/filemanager/images/icons/folder.png',	0,	'{}',	191,	192,	0,	'',	1),
(2133,	'main',	'COM_FAQBOOKPRO_ADMIN_MENU',	'com-faqbookpro-admin-menu',	'',	'com-faqbookpro-admin-menu',	'index.php?option=com_faqbookpro',	'component',	1,	1,	1,	10007,	0,	'0000-00-00 00:00:00',	0,	1,	'class:component',	0,	'{}',	193,	202,	0,	'',	1),
(2134,	'main',	'COM_FAQBOOKPRO_SUBMENU_SECTIONS',	'com-faqbookpro-submenu-sections',	'',	'com-faqbookpro-admin-menu/com-faqbookpro-submenu-sections',	'index.php?option=com_faqbookpro&view=sections',	'component',	1,	2133,	2,	10007,	0,	'0000-00-00 00:00:00',	0,	1,	'class:sections',	0,	'{}',	194,	195,	0,	'',	1),
(2135,	'main',	'COM_FAQBOOKPRO_SUBMENU_TOPICS',	'com-faqbookpro-submenu-topics',	'',	'com-faqbookpro-admin-menu/com-faqbookpro-submenu-topics',	'index.php?option=com_faqbookpro&view=topics',	'component',	1,	2133,	2,	10007,	0,	'0000-00-00 00:00:00',	0,	1,	'class:topics',	0,	'{}',	196,	197,	0,	'',	1),
(2136,	'main',	'COM_FAQBOOKPRO_SUBMENU_QUESTIONS',	'com-faqbookpro-submenu-questions',	'',	'com-faqbookpro-admin-menu/com-faqbookpro-submenu-questions',	'index.php?option=com_faqbookpro&view=questions',	'component',	1,	2133,	2,	10007,	0,	'0000-00-00 00:00:00',	0,	1,	'class:questions',	0,	'{}',	198,	199,	0,	'',	1),
(2137,	'main',	'COM_FAQBOOKPRO_SUBMENU_ABOUT',	'com-faqbookpro-submenu-about',	'',	'com-faqbookpro-admin-menu/com-faqbookpro-submenu-about',	'index.php?option=com_faqbookpro&view=about',	'component',	1,	2133,	2,	10007,	0,	'0000-00-00 00:00:00',	0,	1,	'class:about',	0,	'{}',	200,	201,	0,	'',	1),
(2195,	'main',	'COM_SWA',	'com-swa',	'',	'com-swa',	'index.php?option=com_swa',	'component',	1,	1,	1,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_com_swa.png',	0,	'{}',	203,	240,	0,	'',	1),
(2196,	'main',	'COM_SWA_TITLE_MEMBERS',	'com-swa-title-members',	'',	'com-swa/com-swa-title-members',	'index.php?option=com_swa&view=members',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	204,	205,	0,	'',	1),
(2197,	'main',	'COM_SWA_TITLE_COMMITTEE',	'com-swa-title-committee',	'',	'com-swa/com-swa-title-committee',	'index.php?option=com_swa&view=committeemembers',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	206,	207,	0,	'',	1),
(2198,	'main',	'COM_SWA_TITLE_UNIVERSITYMEMBERS',	'com-swa-title-universitymembers',	'',	'com-swa/com-swa-title-universitymembers',	'index.php?option=com_swa&view=universitymembers',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	208,	209,	0,	'',	1),
(2199,	'main',	'COM_SWA_TITLE_QUALIFICATIONS',	'com-swa-title-qualifications',	'',	'com-swa/com-swa-title-qualifications',	'index.php?option=com_swa&view=qualifications',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	210,	211,	0,	'',	1),
(2200,	'main',	'COM_SWA_TITLE_EVENTS',	'com-swa-title-events',	'',	'com-swa/com-swa-title-events',	'index.php?option=com_swa&view=events',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	212,	213,	0,	'',	1),
(2201,	'main',	'COM_SWA_TITLE_EVENTHOSTS',	'com-swa-title-eventhosts',	'',	'com-swa/com-swa-title-eventhosts',	'index.php?option=com_swa&view=eventhosts',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	214,	215,	0,	'',	1),
(2202,	'main',	'COM_SWA_TITLE_EVENTREGISTRATIONS',	'com-swa-title-eventregistrations',	'',	'com-swa/com-swa-title-eventregistrations',	'index.php?option=com_swa&view=eventregistrations',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	216,	217,	0,	'',	1),
(2203,	'main',	'COM_SWA_TITLE_EVENTTICKETS',	'com-swa-title-eventtickets',	'',	'com-swa/com-swa-title-eventtickets',	'index.php?option=com_swa&view=eventtickets',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	218,	219,	0,	'',	1),
(2204,	'main',	'COM_SWA_TITLE_TICKETS',	'com-swa-title-tickets',	'',	'com-swa/com-swa-title-tickets',	'index.php?option=com_swa&view=tickets',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	220,	221,	0,	'',	1),
(2208,	'main',	'COM_SWA_TITLE_UNIVERSITIES',	'com-swa-title-universities',	'',	'com-swa/com-swa-title-universities',	'index.php?option=com_swa&view=universities',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	228,	229,	0,	'',	1),
(2209,	'main',	'COM_SWA_TITLE_SEASONS',	'com-swa-title-seasons',	'',	'com-swa/com-swa-title-seasons',	'index.php?option=com_swa&view=seasons',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	230,	231,	0,	'',	1),
(2210,	'main',	'COM_SWA_TITLE_COMPETITIONS',	'com-swa-title-competitions',	'',	'com-swa/com-swa-title-competitions',	'index.php?option=com_swa&view=competitions',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	232,	233,	0,	'',	1),
(2211,	'main',	'COM_SWA_TITLE_COMPETITIONTYPES',	'com-swa-title-competitiontypes',	'',	'com-swa/com-swa-title-competitiontypes',	'index.php?option=com_swa&view=competitiontypes',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	234,	235,	0,	'',	1),
(2212,	'main',	'COM_SWA_TITLE_TEAMRESULTS',	'com-swa-title-teamresults',	'',	'com-swa/com-swa-title-teamresults',	'index.php?option=com_swa&view=teamresults',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	236,	237,	0,	'',	1),
(2213,	'main',	'COM_SWA_TITLE_INDIVIDUALRESULTS',	'com-swa-title-individualresults',	'',	'com-swa/com-swa-title-individualresults',	'index.php?option=com_swa&view=individualresults',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	238,	239,	0,	'',	1),
(2215,	'main',	'COM_SWA_TITLE_SPONSORS',	'com-swa-title-sponsors',	'',	'com-swa/com-swa-title-sponsors',	'index.php?option=com_swa&view=sponsors',	'component',	1,	2195,	2,	803,	0,	'0000-00-00 00:00:00',	0,	1,	'components/com_swa/assets/images/s_default.png',	0,	'{}',	240,	241,	0,	'',	1),
(2214,	'main',	'COM_AKEEBA',	'com-akeeba',	'',	'com-akeeba',	'index.php?option=com_akeeba',	'component',	1,	1,	1,	10015,	0,	'0000-00-00 00:00:00',	0,	1,	'class:component',	0,	'{}',	241,	242,	0,	'',	1),
(4785,	'main-nav-bar',	'Update Club Agreement',	'club-agreement',	'',	'club/agreement',	'index.php?option=com_swa&view=clubagreement',	'component',	1,	2458,	3,	10052,	14657,	'2022-05-21 13:35:23',	0,	1,	' ',	0,	'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',	151,	152,	0,	'*',	0);

DROP TABLE IF EXISTS `swana_menu_types`;
CREATE TABLE `swana_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`, `client_id`) VALUES
(8,	729,	'main-nav-bar',	'Main Nav Bar',	'',	0),
(10,	743,	'bottom-nav-bar',	'Bottom Nav Bar',	'',	0);

DROP TABLE IF EXISTS `swana_messages`;
CREATE TABLE `swana_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_messages_cfg`;
CREATE TABLE `swana_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_modules`;
CREATE TABLE `swana_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1,	39,	'Main Menu',	'',	'',	1,	'position-7',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_menu',	1,	1,	'{\"menutype\":\"mainmenu\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',	0,	'*'),
(2,	40,	'Login',	'',	'',	1,	'login',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_login',	1,	1,	'',	1,	'*'),
(3,	41,	'Popular Articles',	'',	'',	3,	'cpanel',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_popular',	3,	1,	'{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',	1,	'*'),
(4,	42,	'Recently Added Articles',	'',	'',	4,	'cpanel',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_latest',	3,	1,	'{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',	1,	'*'),
(8,	43,	'Toolbar',	'',	'',	1,	'toolbar',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_toolbar',	3,	1,	'',	1,	'*'),
(9,	44,	'Quick Icons',	'',	'',	1,	'icon',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_quickicon',	3,	1,	'',	1,	'*'),
(10,	45,	'Logged-in Users',	'',	'',	2,	'cpanel',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_logged',	3,	1,	'{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',	1,	'*'),
(12,	46,	'Admin Menu',	'',	'',	1,	'menu',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_menu',	3,	1,	'{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}',	1,	'*'),
(13,	47,	'Admin Submenu',	'',	'',	1,	'submenu',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_submenu',	3,	1,	'',	1,	'*'),
(14,	48,	'User Status',	'',	'',	2,	'status',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_status',	3,	1,	'',	1,	'*'),
(15,	49,	'Title',	'',	'',	1,	'title',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_title',	3,	1,	'',	1,	'*'),
(16,	50,	'Login Form',	'',	'',	7,	'position-7',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_login',	1,	1,	'{\"greeting\":\"1\",\"name\":\"0\"}',	0,	'*'),
(17,	51,	'Breadcrumbs',	'',	'',	1,	'position-2',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_breadcrumbs',	1,	1,	'{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"0\",\"cache_time\":\"0\",\"cachemode\":\"itemid\"}',	0,	'*'),
(79,	52,	'Multilanguage status',	'',	'',	1,	'status',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	0,	'mod_multilangstatus',	3,	1,	'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',	1,	'*'),
(86,	53,	'Joomla Version',	'',	'',	1,	'footer',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_version',	3,	1,	'{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',	1,	'*'),
(87,	55,	'Sample Data',	'',	'',	0,	'cpanel',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_sampledata',	6,	1,	'{}',	1,	'*'),
(88,	58,	'Latest Actions',	'',	'',	0,	'cpanel',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_latestactions',	6,	1,	'{}',	1,	'*'),
(89,	59,	'Privacy Dashboard',	'',	'',	0,	'cpanel',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_privacy_dashboard',	6,	1,	'{}',	1,	'*'),
(90,	61,	'Main Nav Bar',	'',	'',	1,	'nav',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_menu',	1,	0,	'{\"menutype\":\"main-nav-bar\",\"base\":\"\",\"startLevel\":1,\"endLevel\":0,\"showAllChildren\":1,\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',	0,	'*'),
(91,	62,	'Legal Menu',	'',	'',	1,	'footer6',	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	1,	'mod_menu',	1,	1,	'{\"menutype\":\"bottom-nav-bar\",\"base\":\"\",\"startLevel\":1,\"endLevel\":0,\"showAllChildren\":1,\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',	0,	'*');

DROP TABLE IF EXISTS `swana_modules_menu`;
CREATE TABLE `swana_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_modules_menu` (`moduleid`, `menuid`) VALUES
(1,	0),
(2,	0),
(3,	0),
(4,	0),
(6,	0),
(7,	0),
(8,	0),
(9,	0),
(10,	0),
(12,	0),
(13,	0),
(14,	0),
(15,	0),
(16,	0),
(17,	0),
(79,	0),
(86,	0),
(87,	0),
(88,	0),
(89,	0),
(90,	0),
(91,	0);

DROP TABLE IF EXISTS `swana_newsfeeds`;
CREATE TABLE `swana_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_overrider`;
CREATE TABLE `swana_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_postinstall_messages`;
CREATE TABLE `swana_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1,	700,	'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE',	'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY',	'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION',	'plg_twofactorauth_totp',	1,	'action',	'site://plugins/twofactorauth/totp/postinstall/actions.php',	'twofactorauth_postinstall_action',	'site://plugins/twofactorauth/totp/postinstall/actions.php',	'twofactorauth_postinstall_condition',	'3.2.0',	1),
(2,	700,	'COM_CPANEL_WELCOME_BEGINNERS_TITLE',	'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE',	'',	'com_cpanel',	1,	'message',	'',	'',	'',	'',	'3.2.0',	1),
(3,	700,	'COM_CPANEL_MSG_STATS_COLLECTION_TITLE',	'COM_CPANEL_MSG_STATS_COLLECTION_BODY',	'',	'com_cpanel',	1,	'message',	'',	'',	'admin://components/com_admin/postinstall/statscollection.php',	'admin_postinstall_statscollection_condition',	'3.5.0',	1),
(4,	700,	'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME',	'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY',	'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION',	'plg_system_updatenotification',	1,	'action',	'site://plugins/system/updatenotification/postinstall/updatecachetime.php',	'updatecachetime_postinstall_action',	'site://plugins/system/updatenotification/postinstall/updatecachetime.php',	'updatecachetime_postinstall_condition',	'3.6.3',	1),
(5,	700,	'COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_TITLE',	'COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_BODY',	'',	'com_cpanel',	1,	'message',	'',	'',	'admin://components/com_admin/postinstall/joomla40checks.php',	'admin_postinstall_joomla40checks_condition',	'3.7.0',	1),
(6,	700,	'TPL_HATHOR_MESSAGE_POSTINSTALL_TITLE',	'TPL_HATHOR_MESSAGE_POSTINSTALL_BODY',	'TPL_HATHOR_MESSAGE_POSTINSTALL_ACTION',	'tpl_hathor',	1,	'action',	'admin://templates/hathor/postinstall/hathormessage.php',	'hathormessage_postinstall_action',	'admin://templates/hathor/postinstall/hathormessage.php',	'hathormessage_postinstall_condition',	'3.7.0',	1),
(7,	700,	'PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_TITLE',	'PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_BODY',	'PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_ACTION',	'plg_captcha_recaptcha',	1,	'action',	'site://plugins/captcha/recaptcha/postinstall/actions.php',	'recaptcha_postinstall_action',	'site://plugins/captcha/recaptcha/postinstall/actions.php',	'recaptcha_postinstall_condition',	'3.8.6',	1),
(8,	700,	'COM_ACTIONLOGS_POSTINSTALL_TITLE',	'COM_ACTIONLOGS_POSTINSTALL_BODY',	'',	'com_actionlogs',	1,	'message',	'',	'',	'',	'',	'3.9.0',	1),
(9,	700,	'COM_PRIVACY_POSTINSTALL_TITLE',	'COM_PRIVACY_POSTINSTALL_BODY',	'',	'com_privacy',	1,	'message',	'',	'',	'',	'',	'3.9.0',	1);

DROP TABLE IF EXISTS `swana_privacy_consents`;
CREATE TABLE `swana_privacy_consents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `state` int(10) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind` tinyint(4) NOT NULL DEFAULT '0',
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_privacy_requests`;
CREATE TABLE `swana_privacy_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `requested_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `request_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token_created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_redirect_links`;
CREATE TABLE `swana_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_old_url` (`old_url`(100)),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_schemas`;
CREATE TABLE `swana_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_schemas` (`extension_id`, `version_id`) VALUES
(700,	'3.9.0-2018-10-21'),
(803,	'0.1');

DROP TABLE IF EXISTS `swana_session`;
CREATE TABLE `swana_session` (
  `session_id` varbinary(192) NOT NULL,
  `client_id` tinyint(3) unsigned DEFAULT NULL,
  `guest` tinyint(3) unsigned DEFAULT '1',
  `time` int(11) NOT NULL DEFAULT '0',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
(UNHEX('3839633838313139386162616633376237323432623465393030663037613765'),	1,	0,	1549818247,	'joomla|s:2780:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToyODA7czo1OiJ0b2tlbiI7czozMjoiZDJDQzBGenl1TjJBbzdZeUdZa0R4MmV0c0ZOZWhGZ1UiO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0OTgxMTczNDtzOjQ6Imxhc3QiO2k6MTU0OTgxODI0NTtzOjM6Im5vdyI7aToxNTQ5ODE4MjQ2O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjc6e3M6MTM6ImNvbV9pbnN0YWxsZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NzoibWVzc2FnZSI7czowOiIiO3M6MTc6ImV4dGVuc2lvbl9tZXNzYWdlIjtzOjA6IiI7czoxMjoicmVkaXJlY3RfdXJsIjtOO31zOjk6ImNvbV91c2VycyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZGF0YSI7Tjt9fX1zOjc6ImNvbV9zd2EiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZWRpdCI7Tzo4OiJzdGRDbGFzcyI6Nzp7czo2OiJtZW1iZXIiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZGF0YSI7Tjt9czoxMDoidW5pdmVyc2l0eSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJkYXRhIjtOO3M6MjoiaWQiO2E6MDp7fX1zOjE1OiJjb21taXR0ZWVtZW1iZXIiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZGF0YSI7Tjt9czoxNjoidW5pdmVyc2l0eW1lbWJlciI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJkYXRhIjtOO3M6MjoiaWQiO2E6MDp7fX1zOjU6ImV2ZW50IjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImRhdGEiO047fXM6MTU6ImNvbXBldGl0aW9udHlwZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJkYXRhIjtOO31zOjY6InNlYXNvbiI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJkYXRhIjtOO3M6MjoiaWQiO2E6MDp7fX19fXM6OToiY29tX21lbnVzIjtPOjg6InN0ZENsYXNzIjoyOntzOjU6Iml0ZW1zIjtPOjg6InN0ZENsYXNzIjo0OntzOjg6Im1lbnV0eXBlIjtzOjA6IiI7czo0OiJsaXN0IjthOjQ6e3M6OToiZGlyZWN0aW9uIjtzOjM6ImFzYyI7czo1OiJsaW1pdCI7czoyOiIyMCI7czo4OiJvcmRlcmluZyI7czo1OiJhLmxmdCI7czo1OiJzdGFydCI7ZDowO31zOjk6ImNsaWVudF9pZCI7aTowO3M6MTA6ImxpbWl0c3RhcnQiO2k6MDt9czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6Iml0ZW0iO086ODoic3RkQ2xhc3MiOjQ6e3M6NDoiZGF0YSI7TjtzOjQ6InR5cGUiO047czo0OiJsaW5rIjtOO3M6MjoiaWQiO2E6MDp7fX19fXM6MTE6ImNvbV9tb2R1bGVzIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImVkaXQiO086ODoic3RkQ2xhc3MiOjE6e3M6NjoibW9kdWxlIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImRhdGEiO047fX1zOjM6ImFkZCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo2OiJtb2R1bGUiO086ODoic3RkQ2xhc3MiOjI6e3M6MTI6ImV4dGVuc2lvbl9pZCI7TjtzOjY6InBhcmFtcyI7Tjt9fX1zOjEwOiJjb21fY29uZmlnIjtPOjg6InN0ZENsYXNzIjoxOntzOjY6ImNvbmZpZyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo2OiJnbG9iYWwiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZGF0YSI7Tjt9fX1zOjExOiJjb21fY29udGVudCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjc6ImFydGljbGUiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZGF0YSI7Tjt9fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7czozOiI0MjEiO31zOjExOiJhcHBsaWNhdGlvbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJxdWV1ZSI7YTowOnt9fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9\";',	421,	'admin'),
(UNHEX('6235363334353036396366663338353564303663386430353161656166363931'),	0,	1,	1549818816,	'joomla|s:736:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToyNjtzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjozOntzOjU6InN0YXJ0IjtpOjE1NDk4MTYzNTY7czo0OiJsYXN0IjtpOjE1NDk4MTg4MTQ7czozOiJub3ciO2k6MTU0OTgxODgxNjt9czo1OiJ0b2tlbiI7czozMjoiN3dYa0t2T1B5Y0wwQURxRmtnRzBUUlcwTVRGeUlSSUIiO31zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6MDp7fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',	0,	'');

DROP TABLE IF EXISTS `swana_swa_committee`;
CREATE TABLE `swana_swa_committee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `position` varchar(50) NOT NULL,
  `blurb` varchar(2000) NOT NULL,
  `image` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_committee_member_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `swana_swa_sponsors`;
CREATE TABLE `swana_swa_sponsors` (
  `name` varchar(32) NOT NULL,
  `logo_url` varchar(512) NOT NULL,
  `blurb` text NOT NULL,
  `sponsor_level` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `swana_swa_sponsors` (`name`, `logo_url`, `blurb`, `sponsor_level`, `id`) VALUES
('Sample Sponsor',	'https://cdn.vox-cdn.com/thumbor/Uk16ijHSOhgjs0byA-rA4p2icMY=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/10666689/hypnotoad.jpg',	'All hail the hypnotoad',	1,	1);

INSERT INTO `swana_swa_committee` (`id`, `member_id`, `position`, `blurb`, `image`, `ordering`) VALUES
(1,	2,	'Under',	'<p>blah blah blah</p>',	'https://openclipart.org/download/242499/1456705995.svg',	1);

DROP TABLE IF EXISTS `swana_swa_competition`;
CREATE TABLE `swana_swa_competition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `competition_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_competition_event1_idx` (`event_id`),
  KEY `fk_competition_competition_type1_idx` (`competition_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `swana_swa_competition_type`;
CREATE TABLE `swana_swa_competition_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `series` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `swana_swa_competition_type` (`id`, `name`, `series`) VALUES
(1,	'Team',	'Team'),
(2,	'Wave',	'Wave'),
(3,	'Freestyle',	'Freestyle'),
(4,	'Advanced Race',	'Race'),
(5,	'Intermediate Race',	'Race'),
(6,	'Beginner Race',	'Race');


DROP TABLE IF EXISTS `swana_swa_event`;
CREATE TABLE `swana_swa_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `season_id` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `date_open` date NOT NULL,
  `date_close` date NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_event_season1_idx` (`season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `swana_swa_event` (`id`, `name`, `season_id`, `capacity`, `date_open`, `date_close`, `date`) VALUES
(1,	'The Best Event',	19,	10,	'2019-02-10',	'2999-02-13',	'2999-02-15');

DROP TABLE IF EXISTS `swana_swa_event_host`;
CREATE TABLE `swana_swa_event_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_event_host_event1_idx` (`event_id`),
  KEY `fk_event_host_university1_idx` (`university_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `swana_swa_event_host` (`id`, `event_id`, `university_id`) VALUES
(1,	1,	1);

DROP TABLE IF EXISTS `swana_swa_event_registration`;
CREATE TABLE `swana_swa_event_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_event_registration_event1_idx` (`event_id`),
  KEY `fk_event_registration_member1_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `swana_swa_event_registration` (`id`, `event_id`, `member_id`) VALUES
(1,	1, 7);


DROP TABLE IF EXISTS `swana_swa_event_ticket`;
CREATE TABLE `swana_swa_event_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `notes` text,
  `need_level` varchar(20) DEFAULT NULL,
  `need_swa` tinyint(1) NOT NULL DEFAULT '0',
  `need_xswa` tinyint(1) NOT NULL DEFAULT '0',
  `need_host` tinyint(1) NOT NULL DEFAULT '0',
  `need_qualification` tinyint(1) NOT NULL DEFAULT '0',
  `details` text,
  PRIMARY KEY (`id`),
  KEY `fk_event_ticket_event1_idx` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `swana_swa_event_ticket` (`id`, `event_id`, `name`, `quantity`, `price`, `notes`, `need_level`, `need_swa`, `need_xswa`, `need_host`, `need_qualification`, `details`) VALUES
(1,	1,	'Windsurf (normal)',	5,	10.00,	'',	NULL,	0,	0,	0,	0,	'{   \"visible\": \"All\",   \"xswa\": false,   \"qualification\": false,   \"committee\": false,   \"member\": {\"allowed\": [],\"denied\": []},   \"university\": {\"allowed\": [],\"denied\": []},   \"level\": {\"allowed\": [],\"denied\": []},   \"addons\": [] } '),
(2,	1,	'Host',	5,	5.00,	'',	NULL,	0,	0,	0,	0,	'{   \"visible\": \"All\",   \"xswa\": false,   \"qualification\": false,   \"committee\": false,   \"member\": {\"allowed\": [],\"denied\": []},   \"university\": {\"allowed\": [],\"denied\": []},   \"level\": {\"allowed\": [],\"denied\": []},   \"addons\": [] } '),
(3,	1,	'Party (has-addons)',	5,	5.00,	'',	NULL,	0,	0,	0,	0,	'{   \"visible\": \"All\",   \"xswa\": false,   \"qualification\": false,   \"committee\": false,   \"member\": {\"allowed\": [],\"denied\": []},   \"university\": {\"allowed\": [],\"denied\": []},   \"level\": {\"allowed\": [],\"denied\": []},   \"addons\":  [{
		"name": "T-Shirt",
		"description": "Limited Edition AK19 T-Shirt",
		"options": {
			"name": "Size",
			"values": [{
					"label": "XS",
					"value": "XS"
				},
				{
					"label": "S",
					"value": "S"
				},
				{
					"label": "M",
					"value": "M"
				},
				{
					"label": "L",
					"value": "L"
				},
				{
					"label": "XL",
					"value": "XL:"
				},
				{
					"label": "XXL",
					"value": "XXL"
				}
			]
		},
		"price": 6.99
	}, {
		"name": "Hoodie",
		"description": "Limited Edition AK19 Hoodie",
		"options": {
			"name": "Size",
			"values": [{
					"label": "XS",
					"value": "XS"
				},
				{
					"label": "S",
					"value": "S"
				},
				{
					"label": "M",
					"value": "M"
				},
				{
					"label": "L",
					"value": "L"
				},
				{
					"label": "XL",
					"value": "XL:"
				},
				{
					"label": "XXL",
					"value": "XXL"
				}
			]
		},
		"price": 15.5
	}, {
		"name": "Crew Neck Jumper",
		"description": "Limited Edition AK19 Jumper",
		"options": {
			"name": "Option",
			"values": [{
					"label": "XS",
					"value": "XS"
				},
				{
					"label": "S",
					"value": "S"
				},
				{
					"label": "M",
					"value": "M"
				},
				{
					"label": "L",
					"value": "L"
				},
				{
					"label": "XL",
					"value": "XL:"
				},
				{
					"label": "XXL",
					"value": "XXL"
				}
			]
		},
		"price": 15
	}] } ');


DROP TABLE IF EXISTS `swana_swa_indi_result`;
CREATE TABLE `swana_swa_indi_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `competition_id` int(11) NOT NULL,
  `result` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_indi_result_competition1_idx` (`competition_id`),
  KEY `fk_indi_result_member1_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `swana_swa_member`;
CREATE TABLE `swana_swa_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `lifetime_member` tinyint(1) NOT NULL DEFAULT '0',
  `gender` varchar(255) NOT NULL DEFAULT 'None',
  `pronouns` varchar(30) NOT NULL,
  `ethnicity` varchar(70) NOT NULL DEFAULT 'Default',
  `dob` date NOT NULL DEFAULT '0000-00-00',
  `university_id` int(11) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT 'Beginner',
  `race` varchar(255) NOT NULL DEFAULT 'None',
  `econtact` varchar(255) NOT NULL,
  `enumber` varchar(255) NOT NULL,
  `dietary` varchar(30) NOT NULL DEFAULT 'None',
  `medical` TEXT DEFAULT NULL,
  `tel` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `fk_member_user_idx` (`user_id`),
  KEY `fk_member_university_idx` (`university_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `swana_swa_member`
  (`id`, `user_id`, `lifetime_member`, `gender`,   `pronouns`,   `dob`,          `university_id`,   `level`,          `race`,    `econtact`,   `enumber`,        `dietary`,  `tel`,           `ethnicity`) VALUES
  (1,     427,       1,                 'Male',     'he/him',     '1989-02-10',   1,                 'Advanced',       'Male',    'Rachel',     '07656765455',    'Vegan',    '07805925656',   'English / Welsh / Scottish / Northern Irish / British'),
  (2,     426,       1,                 'Female',   'she/they',   '1994-02-10',   2,                 'Beginner',       'Female',  'Ross',       '07656765455',    'None',     '07805925657',   'English / Welsh / Scottish / Northern Irish / British'),
  (3,     425,       1,                 'Male',     'he/her',     '1996-01-29',   2,                 'Advanced',       'Male',   'Chandler',   '07656765455',    'Vegan',    '07805925659',   'English / Welsh / Scottish / Northern Irish / British'),
  (4,     424,       0,                 'Male',     'he/them',    '1999-02-10',   1,                 'Beginner',       'Male',   'Monica',     '07656765455',    'Halal',    '07805936373',   'English / Welsh / Scottish / Northern Irish / British'),
  (5,     422,       0,                 'Male',     'she/her',    '1998-02-10',   1,                 'Intermediate',   'Male',    'Joey',       '07656765455',    'Kosher',   '07805925689',   'English / Welsh / Scottish / Northern Irish / British'),
  (6,     423,       0,                 'Female',   'she/he',     '1998-02-10',   1,                 'Intermediate',   'Female',  'Phoebe',     '07656765455',    'Vegan',    '07805925651',   'English / Welsh / Scottish / Northern Irish / British'),
  (7,     421,       1,                 'Male',     'he/him',     '1992-01-01',   1,                 'Intermediate',   'Male',   'Janice',     '07656765455',    'None',     '07123456789',   'Irish');


DROP TABLE IF EXISTS `swana_swa_membership`;
CREATE TABLE `swana_swa_membership` (
  `member_id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  PRIMARY KEY (`member_id`,`season_id`),
  KEY `fk_membership_member_idx` (`member_id`),
  KEY `fk_membership_season_idx` (`season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `swana_swa_qualification`;
CREATE TABLE `swana_swa_qualification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `expiry_date` date NOT NULL,
  `file` mediumblob NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_qualification_member_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `swana_swa_season`;
CREATE TABLE `swana_swa_season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `year_UNIQUE` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `swana_swa_season` (`id`, `year`) VALUES
(11,	'2011/12'),
(12,	'2012/13'),
(13,	'2013/14'),
(14,	'2014/15'),
(15,	'2015/16'),
(16,	'2016/17'),
(17,	'2017/18'),
(18,	'2018/19'),
(19,	'2019/20'),
(20,	'2020/21');

DROP TABLE IF EXISTS `swana_swa_team_result`;
CREATE TABLE `swana_swa_team_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `competition_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `team_number` int(11) NOT NULL DEFAULT '1',
  `result` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_team_result_competition1_idx` (`competition_id`),
  KEY `fk_team_result_university1_idx` (`university_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `swana_swa_ticket`;
CREATE TABLE `swana_swa_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `event_ticket_id` int(11) NOT NULL,
  `paid` decimal(6,2) NOT NULL,
  `details` text,
  PRIMARY KEY (`id`),
  KEY `fk_ticket_event_ticket1_idx` (`event_ticket_id`),
  KEY `fk_ticket_member1_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `swana_swa_ticket` (`id`, `member_id`, `event_ticket_id`, `paid`, `details`) VALUES
(1,	6,	2,	0.00,	'{\"addons\":[]}'),
(2,	5,	1,	0.00,	'{\"addons\":[]}'),
(3,	4,	3,	0.00,	'\"addons\":{\"T-Shirt\":{\"qty\":1,\"price\":5,\"option\":\"S\"}}}'),
(4,	2,	1,	0.00,	'{\"addons\":[]}'),
(5,	2,	2,	0.00,	'{\"addons\":[]}'),
(6,	4,	3,	0.00,	'{\"addons\":[]}'),
(7,	3,	2,	0.00,	'\"addons\":{\"T-Shirt\":{\"qty\":1,\"price\":5,\"option\":\"L\"}}}'),
(8,	6,	1,	0.00,	'{\"addons\":[]}');

DROP TABLE IF EXISTS `swana_swa_university`;
CREATE TABLE `swana_swa_university` (
										`id` int(11) NOT NULL AUTO_INCREMENT,
										`name` varchar(200) NOT NULL,
										`url` varchar(200) DEFAULT NULL,
										`au_address` varchar(200) DEFAULT NULL,
										`au_additional_address` varchar(200) DEFAULT NULL,
										`au_postcode` varchar(10) DEFAULT NULL,
										`club_email_1` varchar(100) DEFAULT NULL,
										`club_email_2` varchar(100) DEFAULT NULL,
										`club_contact_name` varchar(100) DEFAULT NULL,
										`club_contact_method` varchar(25) DEFAULT NULL,
										`club_contact_value` varchar(100) DEFAULT NULL,
										PRIMARY KEY (`id`),
										UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `swana_swa_university` (`id`, `name`, `url`, `au_address`, `au_additional_address`, `au_postcode`, `club_email_1`, `club_email_2`, `club_contact_name`, `club_contact_method`, `club_contact_value`) VALUES
(1,	'University1',	'',	'Ex quia quia ut tota',	'Fugit in ea qui odi',	'Et laborum',	'rylaqygov@mailinator.com',	'qokenu@mailinator.com',	'Hayfa Black',	'Email',	'jehuwe'),
(2,	'University2',	'',	'testaddress',	'',	'testcode',	'testmail@mail.com',	'testmail@mail.com',	'testname',	'SMS',	'999');

DROP TABLE IF EXISTS `swana_swa_university_member`;
CREATE TABLE `swana_swa_university_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `committee` varchar(15) NOT NULL DEFAULT '0',
  `graduated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_member_id_university_id` (`member_id`,`university_id`),
  KEY `fk_university_member_member_idx` (`member_id`),
  KEY `fk_university_member_university_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `swana_swa_university_member` (`id`, `member_id`, `university_id`, `committee`, `graduated`) VALUES
(1,	6,	1,	'0',	0),
(2,	5,	1,	'0',	0),
(3,	4,	1,	'0',	1),
(4,	3,	2,	'0',	0),
(5,	1,	1,	'Committee',	0),
(6,	2,	2,	'0',	0),
(7, 7,  1,  '0',  0);

DROP TABLE IF EXISTS `swana_tags`;
CREATE TABLE `swana_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1,	0,	0,	1,	0,	'',	'ROOT',	'root',	'',	'',	1,	0,	'0000-00-00 00:00:00',	1,	'',	'',	'',	'',	421,	'2019-02-10 14:19:01',	'',	0,	'0000-00-00 00:00:00',	'',	'',	0,	'*',	1,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00');

DROP TABLE IF EXISTS `swana_template_styles`;
CREATE TABLE `swana_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4,	'beez3',	0,	'0',	'Beez3 - Default',	'{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/joomla_black.gif\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"templatecolor\":\"personal\",\"html5\":\"0\"}'),
(5,	'hathor',	1,	'0',	'Hathor - Default',	'{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}'),
(7,	'protostar',	0,	'0',	'protostar - Default',	'{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}'),
(8,	'isis',	1,	'1',	'isis - Default',	'{\"templateColor\":\"\",\"logoFile\":\"\"}'),
(9,	'swa3_template_v2',	0,	'0',	'swa3_template_v2 - Default',	''),
(10,	'swa3_template_v4',	0,	'0',	'swa3_template_v4 - Default',	''),
(11,	'swa3_template_v4',	0,	'0',	'swa3_template_v4 - Default',	''),
(13,	'swa3_template_v5',	0,	'0',	'swa3_template_v5 - Default',	''),
(24,	'favourite',	0,	'0',	'Favourite - Default',	'{\"template_styles\":\"style1\",\"custom_style\":\"\",\"max_width\":\"\",\"show_copyright\":\"1\",\"copyright_text\":\"FavThemes\",\"copyright_text_link\":\"www.favthemes.com\",\"nav_link_padding\":\"\",\"nav_font_size\":\"\",\"nav_text_transform\":\"uppercase\",\"nav_icons_color\":\"\",\"nav_icons_font_size\":\"\",\"nav_google_font\":\"Lato\",\"nav_google_font_weight\":\"700\",\"nav_google_font_style\":\"normal\",\"titles_font_size\":\"\",\"titles_line_height\":\"\",\"titles_text_align\":\"left\",\"titles_text_transform\":\"uppercase\",\"module_title_icon_font_size\":\"\",\"module_title_icon_padding\":\"\",\"module_title_icon_border_radius\":\"\",\"titles_google_font\":\"Lato\",\"titles_google_font_weight\":\"700\",\"titles_google_font_style\":\"normal\",\"error_page_article_id\":\"3\",\"offline_page_style\":\"offline-light\",\"offline_page_bg_image_style\":\"no-repeat; background-attachment: fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;\",\"show_back_to_top\":\"1\",\"back_to_top_style_color\":\"\",\"back_to_top_text\":\"Back to Top\",\"body_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"body_bg_image_overlay\":\"fav-transparent\",\"body_bg_color\":\"\",\"body_color\":\"\",\"body_title_color\":\"\",\"body_link_color\":\"\",\"body_link_hover_color\":\"\",\"notice_bg_style\":\"fav-module-block-color\",\"notice_bg_color\":\"\",\"notice_color\":\"\",\"notice_title_color\":\"\",\"notice_link_color\":\"\",\"notice_link_hover_color\":\"\",\"topbar_bg_style\":\"fav-module-block-light\",\"topbar_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"topbar_bg_image_overlay\":\"fav-transparent\",\"topbar_bg_color\":\"\",\"topbar_color\":\"\",\"topbar_title_color\":\"\",\"topbar_link_color\":\"\",\"topbar_link_hover_color\":\"\",\"slide_width\":\"\",\"slide_bg_style\":\"fav-module-block-light\",\"slide_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"slide_bg_image_overlay\":\"fav-transparent\",\"slide_bg_color\":\"\",\"slide_color\":\"\",\"slide_title_color\":\"\",\"slide_link_color\":\"\",\"slide_link_hover_color\":\"\",\"intro_bg_style\":\"fav-module-block-light\",\"intro_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"intro_bg_image_overlay\":\"fav-transparent\",\"intro_bg_color\":\"\",\"intro_color\":\"\",\"intro_title_color\":\"\",\"intro_link_color\":\"\",\"intro_link_hover_color\":\"\",\"breadcrumbs_bg_style\":\"fav-module-block-light\",\"breadcrumbs_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"breadcrumbs_bg_image_overlay\":\"fav-transparent\",\"breadcrumbs_bg_color\":\"\",\"breadcrumbs_color\":\"\",\"breadcrumbs_title_color\":\"\",\"breadcrumbs_link_color\":\"\",\"breadcrumbs_link_hover_color\":\"\",\"lead_bg_style\":\"fav-module-block-light\",\"lead_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"lead_bg_image_overlay\":\"fav-transparent\",\"lead_bg_color\":\"\",\"lead_color\":\"\",\"lead_title_color\":\"\",\"lead_link_color\":\"\",\"lead_link_hover_color\":\"\",\"promo_bg_style\":\"fav-module-block-light\",\"promo_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"promo_bg_image_overlay\":\"fav-transparent\",\"promo_bg_color\":\"\",\"promo_color\":\"\",\"promo_title_color\":\"\",\"promo_link_color\":\"\",\"promo_link_hover_color\":\"\",\"prime_bg_style\":\"fav-module-block-light\",\"prime_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"prime_bg_image_overlay\":\"fav-transparent\",\"prime_bg_color\":\"\",\"prime_color\":\"\",\"prime_title_color\":\"\",\"prime_link_color\":\"\",\"prime_link_hover_color\":\"\",\"showcase_bg_style\":\"fav-module-block-dark\",\"showcase_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"showcase_bg_image_overlay\":\"fav-transparent\",\"showcase_bg_color\":\"\",\"showcase_color\":\"\",\"showcase_title_color\":\"\",\"showcase_link_color\":\"\",\"showcase_link_hover_color\":\"\",\"feature_bg_style\":\"fav-module-block-light\",\"feature_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"feature_bg_image_overlay\":\"fav-transparent\",\"feature_bg_color\":\"\",\"feature_color\":\"\",\"feature_title_color\":\"\",\"feature_link_color\":\"\",\"feature_link_hover_color\":\"\",\"focus_bg_style\":\"fav-module-block-color\",\"focus_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"focus_bg_image_overlay\":\"fav-transparent\",\"focus_bg_color\":\"\",\"focus_color\":\"\",\"focus_title_color\":\"\",\"focus_link_color\":\"\",\"focus_link_hover_color\":\"\",\"portfolio_bg_style\":\"fav-module-block-dark\",\"portfolio_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"portfolio_bg_image_overlay\":\"fav-transparent\",\"portfolio_bg_color\":\"\",\"portfolio_color\":\"\",\"portfolio_title_color\":\"\",\"portfolio_link_color\":\"\",\"portfolio_link_hover_color\":\"\",\"screen_bg_style\":\"fav-module-block-light\",\"screen_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"screen_bg_image_overlay\":\"fav-transparent\",\"screen_bg_color\":\"\",\"screen_color\":\"\",\"screen_title_color\":\"\",\"screen_link_color\":\"\",\"screen_link_hover_color\":\"\",\"top_bg_style\":\"fav-module-block-light\",\"top_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"top_bg_image_overlay\":\"fav-transparent\",\"top_bg_color\":\"\",\"top_color\":\"\",\"top_title_color\":\"\",\"top_link_color\":\"\",\"top_link_hover_color\":\"\",\"maintop_bg_style\":\"fav-module-block-light\",\"maintop_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"maintop_bg_image_overlay\":\"fav-transparent\",\"maintop_bg_color\":\"\",\"maintop_color\":\"\",\"maintop_title_color\":\"\",\"maintop_link_color\":\"\",\"maintop_link_hover_color\":\"\",\"mainbottom_bg_style\":\"fav-module-block-light\",\"mainbottom_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"mainbottom_bg_image_overlay\":\"fav-transparent\",\"mainbottom_bg_color\":\"\",\"mainbottom_color\":\"\",\"mainbottom_title_color\":\"\",\"mainbottom_link_color\":\"\",\"mainbottom_link_hover_color\":\"\",\"bottom_bg_style\":\"fav-module-block-light\",\"bottom_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"bottom_bg_image_overlay\":\"fav-transparent\",\"bottom_bg_color\":\"\",\"bottom_color\":\"\",\"bottom_title_color\":\"\",\"bottom_link_color\":\"\",\"bottom_link_hover_color\":\"\",\"note_bg_style\":\"fav-module-block-dark\",\"note_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"note_bg_image_overlay\":\"fav-transparent\",\"note_bg_color\":\"\",\"note_color\":\"\",\"note_title_color\":\"\",\"note_link_color\":\"\",\"note_link_hover_color\":\"\",\"base_bg_style\":\"fav-module-block-light\",\"base_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"base_bg_image_overlay\":\"fav-transparent\",\"base_bg_color\":\"\",\"base_color\":\"\",\"base_title_color\":\"\",\"base_link_color\":\"\",\"base_link_hover_color\":\"\",\"block_bg_style\":\"fav-module-block-light\",\"block_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"block_bg_image_overlay\":\"fav-transparent\",\"block_bg_color\":\"\",\"block_color\":\"\",\"block_title_color\":\"\",\"block_link_color\":\"\",\"block_link_hover_color\":\"\",\"user_bg_style\":\"fav-module-block-light\",\"user_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"user_bg_image_overlay\":\"fav-transparent\",\"user_bg_color\":\"\",\"user_color\":\"\",\"user_title_color\":\"\",\"user_link_color\":\"\",\"user_link_hover_color\":\"\",\"footer_bg_style\":\"fav-module-block-dark\",\"footer_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"footer_bg_image_overlay\":\"fav-transparent\",\"footer_bg_color\":\"\",\"footer_color\":\"\",\"footer_title_color\":\"\",\"footer_link_color\":\"\",\"footer_link_hover_color\":\"\",\"show_default_logo\":\"1\",\"default_logo\":\"logo.png\",\"default_logo_img_alt\":\"Favourite template\",\"default_logo_padding\":\"\",\"default_logo_margin\":\"\",\"show_media_logo\":\"0\",\"media_logo_img_alt\":\"Favourite template\",\"media_logo_padding\":\"\",\"media_logo_margin\":\"\",\"show_text_logo\":\"0\",\"text_logo\":\"Favourite\",\"text_logo_color\":\"\",\"text_logo_font_size\":\"\",\"text_logo_google_font\":\"Open Sans\",\"text_logo_google_font_weight\":\"400\",\"text_logo_google_font_style\":\"normal\",\"text_logo_line_height\":\"\",\"text_logo_padding\":\"\",\"text_logo_margin\":\"\",\"show_slogan\":\"0\",\"slogan\":\"slogan text here\",\"slogan_color\":\"\",\"slogan_font_size\":\"\",\"slogan_line_height\":\"\",\"slogan_padding\":\"\",\"slogan_margin\":\"\",\"show_retina_logo\":\"0\",\"retina_logo_height\":\"52px\",\"retina_logo_width\":\"188px\",\"retina_logo_img_alt\":\"Favourite template\",\"retina_logo_padding\":\"0px\",\"retina_logo_margin\":\"0px\",\"mobile_nav_color\":\"favth-navbar-default\",\"show_mobile_menu_text\":\"1\",\"mobile_menu_text\":\"Menu\",\"mobile_paragraph_font_size\":\"\",\"mobile_paragraph_line_height\":\"\",\"mobile_title_font_size\":\"\"}'),
(25,	'favourite',	0,	'1',	'Favourite - Swa Core',	'{\"template_styles\":\"style1\",\"custom_style\":\"\",\"max_width\":\"\",\"show_copyright\":\"0\",\"copyright_text\":\"FavThemes\",\"copyright_text_link\":\"www.favthemes.com\",\"nav_link_padding\":\"\",\"nav_font_size\":\"\",\"nav_text_transform\":\"uppercase\",\"nav_icons_color\":\"\",\"nav_icons_font_size\":\"\",\"nav_google_font\":\"Lato\",\"nav_google_font_weight\":\"700\",\"nav_google_font_style\":\"normal\",\"titles_font_size\":\"\",\"titles_line_height\":\"\",\"titles_text_align\":\"left\",\"titles_text_transform\":\"uppercase\",\"module_title_icon_font_size\":\"\",\"module_title_icon_padding\":\"\",\"module_title_icon_border_radius\":\"\",\"titles_google_font\":\"Lato\",\"titles_google_font_weight\":\"700\",\"titles_google_font_style\":\"normal\",\"error_page_article_id\":\"3\",\"offline_page_style\":\"offline-light\",\"offline_page_bg_image\":\"\",\"offline_page_bg_image_style\":\"no-repeat; background-attachment: fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;\",\"show_back_to_top\":\"1\",\"back_to_top_style_color\":\"\",\"back_to_top_text\":\"Back to Top\",\"body_bg_image\":\"images\\/FavouriteTemplate\\/body.jpg\",\"body_bg_image_style\":\"no-repeat; background-attachment: fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;\",\"body_bg_image_overlay\":\"fav-transparent\",\"body_bg_color\":\"\",\"body_color\":\"\",\"body_title_color\":\"\",\"body_link_color\":\"\",\"body_link_hover_color\":\"\",\"notice_bg_style\":\"fav-module-block-color\",\"notice_bg_color\":\"\",\"notice_color\":\"\",\"notice_title_color\":\"\",\"notice_link_color\":\"\",\"notice_link_hover_color\":\"\",\"topbar_bg_style\":\"fav-module-block-clear\",\"topbar_bg_image\":\"\",\"topbar_bg_image_style\":\"no-repeat; background-attachment: fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;\",\"topbar_bg_image_overlay\":\"fav-transparent\",\"topbar_bg_color\":\"\",\"topbar_color\":\"\",\"topbar_title_color\":\"\",\"topbar_link_color\":\"\",\"topbar_link_hover_color\":\"\",\"slide_width\":\"\",\"slide_bg_style\":\"fav-module-block-clear\",\"slide_bg_image\":\"images\\/Screen-Shot-2017-05-17-at-22.30.10.png\",\"slide_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"slide_bg_image_overlay\":\"fav-transparent\",\"slide_bg_color\":\"\",\"slide_color\":\"\",\"slide_title_color\":\"\",\"slide_link_color\":\"\",\"slide_link_hover_color\":\"\",\"intro_bg_style\":\"fav-module-block-clear\",\"intro_bg_image\":\"\",\"intro_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"intro_bg_image_overlay\":\"fav-transparent\",\"intro_bg_color\":\"\",\"intro_color\":\"\",\"intro_title_color\":\"\",\"intro_link_color\":\"\",\"intro_link_hover_color\":\"\",\"breadcrumbs_bg_style\":\"fav-module-block-clear\",\"breadcrumbs_bg_image\":\"\",\"breadcrumbs_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"breadcrumbs_bg_image_overlay\":\"fav-transparent\",\"breadcrumbs_bg_color\":\"\",\"breadcrumbs_color\":\"\",\"breadcrumbs_title_color\":\"\",\"breadcrumbs_link_color\":\"\",\"breadcrumbs_link_hover_color\":\"\",\"lead_bg_style\":\"fav-module-block-clear\",\"lead_bg_image\":\"\",\"lead_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"lead_bg_image_overlay\":\"fav-transparent\",\"lead_bg_color\":\"\",\"lead_color\":\"\",\"lead_title_color\":\"\",\"lead_link_color\":\"\",\"lead_link_hover_color\":\"\",\"promo_bg_style\":\"fav-module-block-clear\",\"promo_bg_image\":\"\",\"promo_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"promo_bg_image_overlay\":\"fav-transparent\",\"promo_bg_color\":\"\",\"promo_color\":\"\",\"promo_title_color\":\"\",\"promo_link_color\":\"\",\"promo_link_hover_color\":\"\",\"prime_bg_style\":\"fav-module-block-clear\",\"prime_bg_image\":\"\",\"prime_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"prime_bg_image_overlay\":\"fav-transparent\",\"prime_bg_color\":\"\",\"prime_color\":\"\",\"prime_title_color\":\"\",\"prime_link_color\":\"\",\"prime_link_hover_color\":\"\",\"showcase_bg_style\":\"fav-module-block-clear\",\"showcase_bg_image\":\"\",\"showcase_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"showcase_bg_image_overlay\":\"fav-transparent\",\"showcase_bg_color\":\"\",\"showcase_color\":\"\",\"showcase_title_color\":\"\",\"showcase_link_color\":\"\",\"showcase_link_hover_color\":\"\",\"feature_bg_style\":\"fav-module-block-clear\",\"feature_bg_image\":\"\",\"feature_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"feature_bg_image_overlay\":\"fav-transparent\",\"feature_bg_color\":\"\",\"feature_color\":\"\",\"feature_title_color\":\"\",\"feature_link_color\":\"\",\"feature_link_hover_color\":\"\",\"focus_bg_style\":\"fav-module-block-clear\",\"focus_bg_image\":\"\",\"focus_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"focus_bg_image_overlay\":\"fav-overlay\",\"focus_bg_color\":\"\",\"focus_color\":\"\",\"focus_title_color\":\"\",\"focus_link_color\":\"\",\"focus_link_hover_color\":\"\",\"portfolio_bg_style\":\"fav-module-block-clear\",\"portfolio_bg_image\":\"\",\"portfolio_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"portfolio_bg_image_overlay\":\"fav-transparent\",\"portfolio_bg_color\":\"\",\"portfolio_color\":\"\",\"portfolio_title_color\":\"\",\"portfolio_link_color\":\"\",\"portfolio_link_hover_color\":\"\",\"screen_bg_style\":\"fav-module-block-clear\",\"screen_bg_image\":\"\",\"screen_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"screen_bg_image_overlay\":\"fav-transparent\",\"screen_bg_color\":\"\",\"screen_color\":\"\",\"screen_title_color\":\"\",\"screen_link_color\":\"\",\"screen_link_hover_color\":\"\",\"top_bg_style\":\"fav-module-block-clear\",\"top_bg_image\":\"\",\"top_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"top_bg_image_overlay\":\"fav-transparent\",\"top_bg_color\":\"\",\"top_color\":\"\",\"top_title_color\":\"\",\"top_link_color\":\"\",\"top_link_hover_color\":\"\",\"maintop_bg_style\":\"fav-module-block-clear\",\"maintop_bg_image\":\"\",\"maintop_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"maintop_bg_image_overlay\":\"fav-transparent\",\"maintop_bg_color\":\"\",\"maintop_color\":\"\",\"maintop_title_color\":\"\",\"maintop_link_color\":\"\",\"maintop_link_hover_color\":\"\",\"mainbottom_bg_style\":\"fav-module-block-clear\",\"mainbottom_bg_image\":\"\",\"mainbottom_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"mainbottom_bg_image_overlay\":\"fav-transparent\",\"mainbottom_bg_color\":\"\",\"mainbottom_color\":\"\",\"mainbottom_title_color\":\"\",\"mainbottom_link_color\":\"\",\"mainbottom_link_hover_color\":\"\",\"bottom_bg_style\":\"fav-module-block-clear\",\"bottom_bg_image\":\"\",\"bottom_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"bottom_bg_image_overlay\":\"fav-transparent\",\"bottom_bg_color\":\"\",\"bottom_color\":\"\",\"bottom_title_color\":\"\",\"bottom_link_color\":\"\",\"bottom_link_hover_color\":\"\",\"note_bg_style\":\"fav-module-block-clear\",\"note_bg_image\":\"\",\"note_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"note_bg_image_overlay\":\"fav-transparent\",\"note_bg_color\":\"\",\"note_color\":\"\",\"note_title_color\":\"\",\"note_link_color\":\"\",\"note_link_hover_color\":\"\",\"base_bg_style\":\"fav-module-block-clear\",\"base_bg_image\":\"\",\"base_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"base_bg_image_overlay\":\"fav-transparent\",\"base_bg_color\":\"\",\"base_color\":\"\",\"base_title_color\":\"\",\"base_link_color\":\"\",\"base_link_hover_color\":\"\",\"block_bg_style\":\"fav-module-block-color\",\"block_bg_image\":\"\",\"block_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"block_bg_image_overlay\":\"fav-transparent\",\"block_bg_color\":\"B8B8B8\",\"block_color\":\"\",\"block_title_color\":\"\",\"block_link_color\":\"\",\"block_link_hover_color\":\"\",\"user_bg_style\":\"fav-module-block-clear\",\"user_bg_image\":\"\",\"user_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"user_bg_image_overlay\":\"fav-transparent\",\"user_bg_color\":\"\",\"user_color\":\"\",\"user_title_color\":\"\",\"user_link_color\":\"\",\"user_link_hover_color\":\"\",\"footer_bg_style\":\"fav-module-block-light\",\"footer_bg_image\":\"\",\"footer_bg_image_style\":\"repeat; background-attachment: initial; -webkit-background-size: auto; -moz-background-size: auto; -o-background-size: auto; background-size: auto;\",\"footer_bg_image_overlay\":\"fav-transparent\",\"footer_bg_color\":\"9C9C9C\",\"footer_color\":\"\",\"footer_title_color\":\"\",\"footer_link_color\":\"\",\"footer_link_hover_color\":\"\",\"show_default_logo\":\"0\",\"default_logo\":\"logo.png\",\"default_logo_img_alt\":\"Favourite template\",\"default_logo_padding\":\"\",\"default_logo_margin\":\"\",\"show_media_logo\":\"1\",\"media_logo\":\"images\\/SWA_Vector.png\",\"media_logo_img_alt\":\"Student Windsurf Association\",\"media_logo_padding\":\"\",\"media_logo_margin\":\"\",\"show_text_logo\":\"0\",\"text_logo\":\"Favourite\",\"text_logo_color\":\"\",\"text_logo_font_size\":\"\",\"text_logo_google_font\":\"Open Sans\",\"text_logo_google_font_weight\":\"400\",\"text_logo_google_font_style\":\"normal\",\"text_logo_line_height\":\"\",\"text_logo_padding\":\"\",\"text_logo_margin\":\"\",\"show_slogan\":\"1\",\"slogan\":\"The Student Windsurfing Association\",\"slogan_color\":\"\",\"slogan_font_size\":\"\",\"slogan_line_height\":\"\",\"slogan_padding\":\"\",\"slogan_margin\":\"\",\"show_retina_logo\":\"0\",\"retina_logo\":\"\",\"retina_logo_height\":\"52px\",\"retina_logo_width\":\"188px\",\"retina_logo_img_alt\":\"Favourite template\",\"retina_logo_padding\":\"0px\",\"retina_logo_margin\":\"0px\",\"mobile_nav_color\":\"favth-navbar-default\",\"show_mobile_menu_text\":\"1\",\"mobile_menu_text\":\"Menu\",\"mobile_paragraph_font_size\":\"\",\"mobile_paragraph_line_height\":\"\",\"mobile_title_font_size\":\"\",\"analytics_code\":\"  (function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){\\r\\n  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\\r\\n  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\\r\\n  })(window,document,\'script\',\'https:\\/\\/www.google-analytics.com\\/analytics.js\',\'ga\');\\r\\n\\r\\n  ga(\'create\', \'UA-68859407-1\', \'auto\');\\r\\n  ga(\'send\', \'pageview\');\\r\\n\\r\\n\"}');

DROP TABLE IF EXISTS `swana_ucm_base`;
CREATE TABLE `swana_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_ucm_content`;
CREATE TABLE `swana_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_content_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`(100)),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';


DROP TABLE IF EXISTS `swana_ucm_history`;
CREATE TABLE `swana_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(1,	1,	1,	'',	'2019-02-10 17:01:25',	421,	4759,	'6295c1ad15299a043b345e204d730a3550afa281',	'{\"id\":1,\"asset_id\":63,\"title\":\"Lorem Ipsum\",\"alias\":\"lorem-ipsum\",\"introtext\":\"<div id=\\\"lipsum\\\">\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget egestas velit, sed placerat odio. Suspendisse at leo nec magna scelerisque sodales et vestibulum ligula. Donec eget velit laoreet, dictum quam vel, sagittis felis. Sed ornare ipsum quis dolor tempus, nec egestas ex molestie. Suspendisse enim odio, posuere quis volutpat sit amet, cursus sed nunc. Quisque feugiat turpis nunc, at mattis odio tincidunt sed. In hac habitasse platea dictumst. Sed luctus lobortis tortor et semper.<\\/p>\\r\\n<p>Mauris vitae hendrerit nisl, ut semper orci. Nullam hendrerit congue consectetur. Donec pharetra ultrices sapien et varius. Nulla id orci finibus, aliquet mauris sed, dignissim nisl. Sed congue eu mi quis venenatis. Curabitur in pulvinar dolor. Sed varius aliquam erat non rutrum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras fringilla viverra dictum.<\\/p>\\r\\n<p>Morbi pulvinar massa id lacus bibendum blandit. Nam eget massa tempus, sollicitudin diam quis, interdum magna. Suspendisse pretium orci lacinia tortor tincidunt sodales. Aliquam a eros mollis, eleifend libero ut, porttitor erat. Donec quis velit nec justo interdum efficitur. Nulla tristique venenatis magna nec lacinia. Duis ultrices, mi eget aliquam commodo, purus diam sodales libero, a euismod nisl tortor et neque. Nulla nisi lacus, volutpat sit amet diam nec, fringilla malesuada nibh. Donec vehicula pulvinar lacus ut rhoncus. Morbi eget velit semper lacus convallis sollicitudin sit amet ut velit. Duis luctus augue ac est maximus faucibus. Aenean vel pharetra enim.<\\/p>\\r\\n<p>Nunc vel pellentesque ante, ut sagittis lectus. Aenean et vehicula nisi. In hac habitasse platea dictumst. Quisque a aliquet quam, a vulputate nisl. Aenean non tincidunt ipsum. Nulla arcu turpis, consectetur a cursus sed, scelerisque ut quam. Ut id ipsum vel nisi tincidunt commodo ac eget nisl. Aenean leo neque, suscipit vel sem sit amet, molestie pharetra tellus. Nunc dictum turpis sed risus cursus, mollis dignissim diam vulputate. Aenean tristique nunc nunc, eu consectetur nunc rutrum ut. Phasellus lacinia libero dui, a dignissim nisi dapibus at.<\\/p>\\r\\n<p>Aliquam hendrerit rutrum massa et aliquet. Phasellus elementum pellentesque est, ut congue erat porttitor quis. Phasellus ante risus, tincidunt congue maximus non, efficitur nec eros. Sed nec viverra ligula, at interdum massa. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse non sagittis massa. Vivamus sed eros efficitur, pulvinar lectus vitae, ultricies lorem. Phasellus vel arcu luctus, vehicula nunc eget, rutrum tortor. Cras id orci urna. Nam sit amet felis quis lacus pulvinar pharetra sed quis tortor. Aliquam eget mollis erat. Cras dignissim gravida varius. Cras malesuada tincidunt fermentum. Quisque vel massa blandit odio vehicula mattis vitae id elit.<\\/p>\\r\\n<\\/div>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"2\",\"created\":\"2019-02-10 17:01:25\",\"created_by\":\"421\",\"created_by_alias\":\"\",\"modified\":\"2019-02-10 17:01:25\",\"modified_by\":null,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2019-02-10 17:01:25\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_associations\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":1,\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"1\",\"hits\":null,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\",\"note\":\"\"}',	0),
(2,	2,	1,	'',	'2019-02-10 17:03:51',	421,	4766,	'fd56264e19a7fa87eb6f3a1ca6f0549470298a5f',	'{\"id\":2,\"asset_id\":64,\"title\":\"Duis id accumsan risus\",\"alias\":\"duis-id-accumsan-risus\",\"introtext\":\"<p>Duis id accumsan risus. Vestibulum augue nisi, semper vitae lacus nec, volutpat posuere lectus. Vivamus ut nisi bibendum, pellentesque massa ut, semper sem. Vestibulum placerat finibus erat, vehicula condimentum enim. Suspendisse volutpat risus sed nibh rutrum rutrum eleifend sit amet nisi. Vestibulum risus lorem, condimentum et vehicula id, tincidunt vitae neque. Praesent malesuada elementum tortor quis ultrices. Aliquam sit amet orci lectus. Donec pellentesque semper suscipit. Ut eget magna ultricies, luctus velit nec, semper est. Nam consequat sit amet mi eleifend scelerisque. Mauris non ante vitae lorem sodales fermentum eget a arcu. Nullam consectetur felis arcu, ut iaculis magna aliquam vel. Aenean vestibulum placerat congue.<\\/p>\\r\\n<p>Phasellus turpis augue, scelerisque consequat dolor eu, rhoncus venenatis nisi. Quisque dictum interdum commodo. Sed cursus nulla ac porta consectetur. Nullam vel nisi cursus, mattis odio ac, condimentum orci. Vivamus dapibus nisl eget nisi efficitur dignissim. Maecenas viverra, velit ac lacinia dignissim, enim mi viverra turpis, quis bibendum est ex vel elit. Ut elementum, est quis ultrices dignissim, arcu mauris eleifend metus, sit amet egestas sem magna in nisi. Sed imperdiet diam vitae dignissim condimentum. Pellentesque mollis, massa et mollis egestas, turpis mauris varius augue, eget ultrices mauris justo sagittis tortor. Integer sed tempus dui. Phasellus viverra efficitur justo, quis hendrerit magna pulvinar in.<\\/p>\\r\\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam non pretium eros. Aliquam sapien odio, dapibus eu lacinia quis, faucibus in tellus. Donec porttitor mi eget massa interdum, nec suscipit elit pharetra. Donec tincidunt eros quis dignissim feugiat. Quisque rhoncus convallis purus sed varius. Aliquam scelerisque quam quis leo aliquam, nec interdum ligula consequat.<\\/p>\\r\\n<p>Curabitur quis felis feugiat, mollis elit quis, maximus leo. Aenean sed facilisis risus. Integer ac ornare justo. Nunc hendrerit velit ac massa imperdiet pellentesque. Nulla facilisi. Sed sed diam id metus ultricies lobortis. Donec tellus dolor, congue in nunc eget, luctus pulvinar turpis. Nullam at gravida diam. Nullam sapien lacus, varius vel malesuada ac, commodo id nibh. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla facilisi. Aenean ullamcorper eu sem nec ultricies. Donec consectetur ultricies nulla, sed tempus nisi interdum at.<\\/p>\\r\\n<p>Vestibulum tincidunt sem nec enim pharetra efficitur sit amet in lectus. Etiam pretium risus leo. In euismod erat ex, a efficitur elit tristique quis. Duis pharetra enim mauris, eu ultricies quam maximus a. Curabitur in vulputate velit, at vestibulum ligula. Nam placerat mi vitae purus eleifend, at viverra libero tempus. Fusce elementum sollicitudin tortor, sed consequat odio porttitor ac. Duis vulputate commodo sapien, non condimentum nibh consectetur vel.<\\/p>\",\"fulltext\":\"\",\"state\":1,\"catid\":\"2\",\"created\":\"2019-02-10 17:03:51\",\"created_by\":\"421\",\"created_by_alias\":\"\",\"modified\":\"2019-02-10 17:03:51\",\"modified_by\":null,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2019-02-10 17:03:51\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_associations\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":1,\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"1\",\"hits\":null,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"1\",\"language\":\"*\",\"xreference\":\"\",\"note\":\"\"}',	0);

DROP TABLE IF EXISTS `swana_updates`;
CREATE TABLE `swana_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';


DROP TABLE IF EXISTS `swana_update_sites`;
CREATE TABLE `swana_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';

INSERT INTO `swana_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1,	'Joomla! Core',	'collection',	'https://update.joomla.org/core/list.xml',	1,	1549808424,	''),
(2,	'Accredited Joomla! Translations',	'collection',	'https://update.joomla.org/language/translationlist_3.xml',	1,	0,	''),
(3,	'Joomla! Update Component Update Site',	'extension',	'https://update.joomla.org/core/extensions/com_joomlaupdate.xml',	1,	0,	'');

DROP TABLE IF EXISTS `swana_update_sites_extensions`;
CREATE TABLE `swana_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

INSERT INTO `swana_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1,	700),
(2,	802),
(3,	28);

DROP TABLE IF EXISTS `swana_usergroups`;
CREATE TABLE `swana_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1,	0,	1,	18,	'Public'),
(2,	1,	8,	15,	'Registered'),
(3,	2,	9,	14,	'Author'),
(4,	3,	10,	13,	'Editor'),
(5,	4,	11,	12,	'Publisher'),
(6,	1,	4,	7,	'Manager'),
(7,	6,	5,	6,	'Administrator'),
(8,	1,	16,	17,	'Super Users'),
(9,	1,	2,	3,	'Guest');

DROP TABLE IF EXISTS `swana_users`;
CREATE TABLE `swana_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
(421,	'Super User',	'admin',	'info@swa.co.uk',	'$2y$10$ZcjQVdxj30o8EVYCoEd0Zu4xL2do7p7MOHLRTYAUgejQidlLEnR9u',	0,	1,	'2019-02-10 14:19:02',	'2019-02-10 15:15:36',	'0',	'',	'0000-00-00 00:00:00',	0,	'',	'',	0),
(422,	'John Smith',	'johnsmith',	'js@example.com',	'$2y$10$tWZiATb/7e0zB9wuKvzOleNhKV5eVt/MapmthW4GEGnwg5eTEVCTS',	0,	0,	'2019-02-10 15:24:48',	'0000-00-00 00:00:00',	'',	'{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}',	'0000-00-00 00:00:00',	0,	'',	'',	0),
(423,	'Jane Smith',	'janesmith',	'jane@example.com',	'$2y$10$y0bhBEzBJIbyjqfFCpCybOw.3rmxRrttYkOhfXoEYG2thGRvb3vI2',	0,	0,	'2019-02-10 15:25:57',	'0000-00-00 00:00:00',	'',	'{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}',	'0000-00-00 00:00:00',	0,	'',	'',	0),
(424,	'Mark Thompson',	'mthomp',	'mt@example.com',	'$2y$10$8eSvR3CI7gILJbBLH/1pPeJtd1bEzVleV.ghvDP0mR/7MLChE5THe',	0,	0,	'2019-02-10 15:27:00',	'0000-00-00 00:00:00',	'',	'{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}',	'0000-00-00 00:00:00',	0,	'',	'',	0),
(425,	'Ben Dover',	'bendover',	'bd@example.com',	'$2y$10$B94OF41ggtE7RkAVXS65O..OUAyrqD6EP9j89DXoPnw8D1qwE38vS',	0,	0,	'2019-02-10 15:28:41',	'0000-00-00 00:00:00',	'',	'{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}',	'0000-00-00 00:00:00',	0,	'',	'',	0),
(426,	'Example SWA Committee person',	'swacom',	'com@example.com',	'$2y$10$Wi7Iv3csPRy73dvzLiRPfeDLsh6lowxzk3yaMMOf2pvOBfAiejkmC',	0,	0,	'2019-02-10 15:29:21',	'0000-00-00 00:00:00',	'',	'{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}',	'0000-00-00 00:00:00',	0,	'',	'',	0),
(427,	'Uni Committee Person',	'unicom',	'unicom@example.com',	'$2y$10$doyHhJ.imnpWo6zzDISnTu0vr9IK4X/GaxAGRDqD8mB.csTbfp4Eq',	0,	0,	'2019-02-10 15:30:37',	'2019-02-10 15:53:29',	'',	'{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}',	'0000-00-00 00:00:00',	0,	'',	'',	0);

DROP TABLE IF EXISTS `swana_user_keys`;
CREATE TABLE `swana_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_user_notes`;
CREATE TABLE `swana_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `swana_user_profiles`;
CREATE TABLE `swana_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';


DROP TABLE IF EXISTS `swana_user_usergroup_map`;
CREATE TABLE `swana_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_user_usergroup_map` (`user_id`, `group_id`) VALUES
(421,	8),
(422,	2),
(423,	2),
(424,	2),
(425,	2),
(426,	2),
(427,	2);

DROP TABLE IF EXISTS `swana_utf8_conversion`;
CREATE TABLE `swana_utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_utf8_conversion` (`converted`) VALUES
(2);

DROP TABLE IF EXISTS `swana_viewlevels`;
CREATE TABLE `swana_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `swana_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1,	'Public',	0,	'[1]'),
(2,	'Registered',	2,	'[6,2,8]'),
(3,	'Special',	3,	'[6,3,8]'),
(5,	'Guest',	1,	'[9]'),
(6,	'Super Users',	4,	'[8]'),
(7,	'Club Committee',	0,	'[]'),
(8,	'Org Committee',	0,	'[]');

-- 2019-02-10 17:17:48


DROP TABLE IF EXISTS `swana_university_agreements`;
CREATE TABLE `swana_university_agreements` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `signed` BIT NOT NULL DEFAULT 0,
  `date` DATE,
  `university_id` int(11),
  `member_id` int(11) COLLATE utf8mb4_unicode_ci,
  `override` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `swana_university_agreements` (`id`,`signed`,`date`,`university_id`, `member_id`, `override`) VALUES
(1 ,0 ,NULL,NULL,NULL, 0),
(2 ,1 ,'2019-02-10',9 ,1,0);


-- `signed`
-- --'Whether the agreement has been signed'
-- `date`
-- -- 'The date the agreement was last signed'
-- `member_id`
-- -- 'The member that signed the agreement',
-- override, the values this takes mean; 0=nothing, 1=give access, 2=remove access
