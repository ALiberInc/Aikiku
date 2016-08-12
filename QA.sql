-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: QA
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `qa_blobs`
--

DROP TABLE IF EXISTS `qa_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_blobs` (
  `blobid` bigint(20) unsigned NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `content` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `cookieid` bigint(20) unsigned DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`blobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_blobs`
--

LOCK TABLES `qa_blobs` WRITE;
/*!40000 ALTER TABLE `qa_blobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_cache`
--

DROP TABLE IF EXISTS `qa_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_cache` (
  `type` char(8) CHARACTER SET ascii NOT NULL,
  `cacheid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `lastread` datetime NOT NULL,
  PRIMARY KEY (`type`,`cacheid`),
  KEY `lastread` (`lastread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_cache`
--

LOCK TABLES `qa_cache` WRITE;
/*!40000 ALTER TABLE `qa_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_categories`
--

DROP TABLE IF EXISTS `qa_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_categories` (
  `categoryid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) unsigned NOT NULL DEFAULT '0',
  `position` smallint(5) unsigned NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `parentid` (`parentid`,`tags`),
  UNIQUE KEY `parentid_2` (`parentid`,`position`),
  KEY `backpath` (`backpath`(200))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_categories`
--

LOCK TABLES `qa_categories` WRITE;
/*!40000 ALTER TABLE `qa_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_categorymetas`
--

DROP TABLE IF EXISTS `qa_categorymetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_categorymetas` (
  `categoryid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`categoryid`,`title`),
  CONSTRAINT `qa_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_categorymetas`
--

LOCK TABLES `qa_categorymetas` WRITE;
/*!40000 ALTER TABLE `qa_categorymetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_categorymetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_contentwords`
--

DROP TABLE IF EXISTS `qa_contentwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_contentwords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  `count` tinyint(3) unsigned NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_contentwords`
--

LOCK TABLES `qa_contentwords` WRITE;
/*!40000 ALTER TABLE `qa_contentwords` DISABLE KEYS */;
INSERT INTO `qa_contentwords` VALUES (1,13,2,'Q',1),(1,14,1,'Q',1),(1,15,1,'Q',1);
/*!40000 ALTER TABLE `qa_contentwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_cookies`
--

DROP TABLE IF EXISTS `qa_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_cookies` (
  `cookieid` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `createip` varbinary(16) NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` varbinary(16) DEFAULT NULL,
  PRIMARY KEY (`cookieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_cookies`
--

LOCK TABLES `qa_cookies` WRITE;
/*!40000 ALTER TABLE `qa_cookies` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_cookies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_iplimits`
--

DROP TABLE IF EXISTS `qa_iplimits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_iplimits` (
  `ip` varbinary(16) NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `ip` (`ip`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_iplimits`
--

LOCK TABLES `qa_iplimits` WRITE;
/*!40000 ALTER TABLE `qa_iplimits` DISABLE KEYS */;
INSERT INTO `qa_iplimits` VALUES ('\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','L',408616,1),('\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','Q',408611,1);
/*!40000 ALTER TABLE `qa_iplimits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_messages`
--

DROP TABLE IF EXISTS `qa_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_messages` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('PUBLIC','PRIVATE') NOT NULL DEFAULT 'PRIVATE',
  `fromuserid` int(10) unsigned NOT NULL,
  `touserid` int(10) unsigned NOT NULL,
  `fromhidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tohidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`messageid`),
  KEY `type` (`type`,`fromuserid`,`touserid`,`created`),
  KEY `touserid` (`touserid`,`type`,`created`),
  KEY `fromhidden` (`fromhidden`),
  KEY `tohidden` (`tohidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_messages`
--

LOCK TABLES `qa_messages` WRITE;
/*!40000 ALTER TABLE `qa_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_options`
--

DROP TABLE IF EXISTS `qa_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(12000) NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_options`
--

LOCK TABLES `qa_options` WRITE;
/*!40000 ALTER TABLE `qa_options` DISABLE KEYS */;
INSERT INTO `qa_options` VALUES ('allow_change_usernames','1'),('allow_close_questions','1'),('allow_login_email_only',''),('allow_private_messages','1'),('allow_self_answer','1'),('allow_user_walls','1'),('avatar_allow_gravatar','1'),('avatar_allow_upload','1'),('avatar_default_show',''),('avatar_profile_size','200'),('avatar_q_list_size','0'),('avatar_q_page_q_size','50'),('avatar_users_size','30'),('block_bad_words',''),('block_ips_write',''),('cache_flaggedcount',''),('cache_qcount','1'),('cache_queuedcount',''),('cache_tagcount','2'),('cache_uapprovecount','0'),('cache_unaqcount','1'),('cache_unselqcount','1'),('cache_unupaqcount','1'),('cache_userpointscount','1'),('caching_enabled','0'),('columns_tags','3'),('columns_users','2'),('comment_on_as','1'),('comment_on_qs','0'),('confirm_user_emails','1'),('custom_footer',''),('custom_header',''),('custom_in_head',''),('db_version','63'),('do_ask_check_qs','0'),('do_complete_tags','1'),('do_count_q_views','1'),('do_example_tags','1'),('editor_for_as','WYSIWYG Editor'),('editor_for_qs','WYSIWYG Editor'),('event_logger_to_database',''),('event_logger_to_files',''),('extra_field_active',''),('facebook_app_id',''),('feedback_email','jack80342@outlook.com'),('feedback_enabled','1'),('feed_for_hot',''),('feed_for_qa','1'),('feed_for_questions','1'),('feed_for_unanswered','1'),('feed_per_category','1'),('flagging_of_posts','1'),('form_security_salt','p57unwawszsrcl4xdg2400njao1xnjkx'),('from_email','no-reply@example.com'),('home_description',''),('hot_weight_answers','100'),('hot_weight_a_age','100'),('hot_weight_q_age','100'),('hot_weight_views','100'),('hot_weight_votes','100'),('links_in_new_window',''),('logo_height',''),('logo_show',''),('logo_url',''),('logo_width',''),('mailing_enabled',''),('match_example_tags','3'),('max_len_q_title','120'),('max_num_q_tags','5'),('max_rate_ip_as','50'),('max_rate_ip_logins','20'),('max_rate_ip_messages','10'),('max_rate_ip_qs','20'),('max_rate_user_as','25'),('max_rate_user_messages','5'),('max_rate_user_qs','10'),('max_store_user_updates','50'),('minify_html','1'),('min_len_q_content','0'),('min_len_q_title','12'),('min_num_q_tags','0'),('moderate_users',''),('mouseover_content_on',''),('nav_activity',''),('nav_ask','1'),('nav_categories',''),('nav_home',''),('nav_hot',''),('nav_qa_is_home',''),('nav_questions','1'),('nav_tags','1'),('nav_unanswered','1'),('nav_users','1'),('neat_urls','5'),('notify_admin_q_post',''),('notify_users_default','1'),('pages_prev_next','3'),('page_size_ask_tags','5'),('page_size_home','20'),('page_size_qs','20'),('page_size_q_as','10'),('page_size_tags','30'),('page_size_una_qs','20'),('page_size_users','30'),('page_size_wall','10'),('permit_anon_view_ips','70'),('permit_close_q','70'),('permit_delete_hidden','40'),('permit_edit_a','100'),('permit_edit_c','70'),('permit_edit_q','70'),('permit_edit_silent','40'),('permit_flag','110'),('permit_hide_show','70'),('permit_moderate','100'),('permit_post_a','150'),('permit_post_c','150'),('permit_post_q','150'),('permit_post_wall','110'),('permit_retag_cat','70'),('permit_select_a','100'),('permit_view_q_page','150'),('permit_view_voters_flaggers','20'),('permit_vote_a','120'),('permit_vote_down','120'),('permit_vote_q','120'),('points_a_selected','30'),('points_a_voted_max_gain','20'),('points_a_voted_max_loss','5'),('points_base','100'),('points_multiple','10'),('points_per_a_voted',''),('points_per_a_voted_down','2'),('points_per_a_voted_up','2'),('points_per_q_voted',''),('points_per_q_voted_down','1'),('points_per_q_voted_up','1'),('points_post_a','4'),('points_post_q','2'),('points_q_voted_max_gain','10'),('points_q_voted_max_loss','3'),('points_select_a','3'),('points_to_titles',''),('points_vote_down_a','1'),('points_vote_down_q','1'),('points_vote_on_a',''),('points_vote_on_q',''),('points_vote_up_a','1'),('points_vote_up_q','1'),('q_urls_remove_accents',''),('q_urls_title_length','50'),('register_notify_admin',''),('show_a_c_links','1'),('show_a_form_immediate','if_no_as'),('show_compact_numbers','1'),('show_custom_answer',''),('show_custom_ask',''),('show_custom_footer',''),('show_custom_header',''),('show_custom_home',''),('show_custom_in_head',''),('show_custom_sidebar','1'),('show_custom_sidepanel',''),('show_custom_welcome','0'),('show_fewer_cs_from','10'),('show_full_date_days','7'),('show_message_history','1'),('show_notice_visitor',''),('show_notice_welcome',''),('show_post_update_meta','1'),('show_url_links','1'),('show_user_points','1'),('show_user_titles','1'),('show_view_counts',''),('show_view_count_q_page',''),('show_when_created','1'),('site_language',''),('site_maintenance',''),('site_text_direction','ltr'),('site_theme','Snow'),('site_theme_mobile','Snow'),('site_title','Localhost Q&A'),('site_url','http://localhost/question2answer/'),('smtp_active',''),('sort_answers_by','created'),('tags_or_categories','tc'),('tag_separator_comma',''),('use_microdata','1'),('votes_separated',''),('voting_on_as','1'),('voting_on_qs','1'),('voting_on_q_page_only',''),('wysiwyg_editor_upload_images','');
/*!40000 ALTER TABLE `qa_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_pages`
--

DROP TABLE IF EXISTS `qa_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_pages` (
  `pageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL,
  `permit` tinyint(3) unsigned DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext,
  PRIMARY KEY (`pageid`),
  UNIQUE KEY `position` (`position`),
  KEY `tags` (`tags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_pages`
--

LOCK TABLES `qa_pages` WRITE;
/*!40000 ALTER TABLE `qa_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_postmetas`
--

DROP TABLE IF EXISTS `qa_postmetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_postmetas` (
  `postid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`postid`,`title`),
  CONSTRAINT `qa_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_postmetas`
--

LOCK TABLES `qa_postmetas` WRITE;
/*!40000 ALTER TABLE `qa_postmetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_postmetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_posts`
--

DROP TABLE IF EXISTS `qa_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_posts` (
  `postid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) unsigned DEFAULT NULL,
  `categoryid` int(10) unsigned DEFAULT NULL,
  `catidpath1` int(10) unsigned DEFAULT NULL,
  `catidpath2` int(10) unsigned DEFAULT NULL,
  `catidpath3` int(10) unsigned DEFAULT NULL,
  `acount` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `selchildid` int(10) unsigned DEFAULT NULL,
  `closedbyid` int(10) unsigned DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `cookieid` bigint(20) unsigned DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT NULL,
  `upvotes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `downvotes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` varbinary(16) DEFAULT NULL,
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(12000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`postid`),
  KEY `type` (`type`,`created`),
  KEY `type_2` (`type`,`acount`,`created`),
  KEY `type_4` (`type`,`netvotes`,`created`),
  KEY `type_5` (`type`,`views`,`created`),
  KEY `type_6` (`type`,`hotness`),
  KEY `type_7` (`type`,`amaxvote`,`created`),
  KEY `parentid` (`parentid`,`type`),
  KEY `userid` (`userid`,`type`,`created`),
  KEY `selchildid` (`selchildid`,`type`,`created`),
  KEY `closedbyid` (`closedbyid`),
  KEY `catidpath1` (`catidpath1`,`type`,`created`),
  KEY `catidpath2` (`catidpath2`,`type`,`created`),
  KEY `catidpath3` (`catidpath3`,`type`,`created`),
  KEY `categoryid` (`categoryid`,`type`,`created`),
  KEY `createip` (`createip`,`created`),
  KEY `updated` (`updated`,`type`),
  KEY `flagcount` (`flagcount`,`created`,`type`),
  KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  KEY `lastip` (`lastip`,`updated`,`type`),
  CONSTRAINT `qa_posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  CONSTRAINT `qa_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_posts` (`postid`),
  CONSTRAINT `qa_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE SET NULL,
  CONSTRAINT `qa_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_posts` (`postid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_posts`
--

LOCK TABLES `qa_posts` WRITE;
/*!40000 ALTER TABLE `qa_posts` DISABLE KEYS */;
INSERT INTO `qa_posts` VALUES (1,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,1,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,0,0,0,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,41746100000,0,'','2016-08-12 20:06:10',NULL,NULL,'一加一等于几？别说你不知道','( ⊙ o ⊙ )！','#,-d',NULL,'@');
/*!40000 ALTER TABLE `qa_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_posttags`
--

DROP TABLE IF EXISTS `qa_posttags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_posttags` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  `postcreated` datetime NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`,`postcreated`),
  CONSTRAINT `qa_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_posttags`
--

LOCK TABLES `qa_posttags` WRITE;
/*!40000 ALTER TABLE `qa_posttags` DISABLE KEYS */;
INSERT INTO `qa_posttags` VALUES (1,16,'2016-08-12 20:06:10'),(1,18,'2016-08-12 20:06:10');
/*!40000 ALTER TABLE `qa_posttags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_sharedevents`
--

DROP TABLE IF EXISTS `qa_sharedevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  `lastpostid` int(10) unsigned NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `updated` datetime NOT NULL,
  KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  KEY `questionid` (`questionid`,`entitytype`,`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_sharedevents`
--

LOCK TABLES `qa_sharedevents` WRITE;
/*!40000 ALTER TABLE `qa_sharedevents` DISABLE KEYS */;
INSERT INTO `qa_sharedevents` VALUES ('Q',1,1,1,NULL,1,'2016-08-12 20:06:10'),('U',1,1,1,NULL,1,'2016-08-12 20:06:10'),('T',16,1,1,NULL,1,'2016-08-12 20:06:10'),('T',18,1,1,NULL,1,'2016-08-12 20:06:10');
/*!40000 ALTER TABLE `qa_sharedevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_tagmetas`
--

DROP TABLE IF EXISTS `qa_tagmetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`tag`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_tagmetas`
--

LOCK TABLES `qa_tagmetas` WRITE;
/*!40000 ALTER TABLE `qa_tagmetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_tagmetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_tagwords`
--

DROP TABLE IF EXISTS `qa_tagwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_tagwords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_tagwords`
--

LOCK TABLES `qa_tagwords` WRITE;
/*!40000 ALTER TABLE `qa_tagwords` DISABLE KEYS */;
INSERT INTO `qa_tagwords` VALUES (1,16),(1,17);
/*!40000 ALTER TABLE `qa_tagwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_titlewords`
--

DROP TABLE IF EXISTS `qa_titlewords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_titlewords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_titlewords`
--

LOCK TABLES `qa_titlewords` WRITE;
/*!40000 ALTER TABLE `qa_titlewords` DISABLE KEYS */;
INSERT INTO `qa_titlewords` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12);
/*!40000 ALTER TABLE `qa_titlewords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userevents`
--

DROP TABLE IF EXISTS `qa_userevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userevents` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  `lastpostid` int(10) unsigned NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `updated` datetime NOT NULL,
  KEY `userid` (`userid`,`updated`),
  KEY `questionid` (`questionid`,`userid`),
  CONSTRAINT `qa_userevents_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userevents`
--

LOCK TABLES `qa_userevents` WRITE;
/*!40000 ALTER TABLE `qa_userevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userfavorites`
--

DROP TABLE IF EXISTS `qa_userfavorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userfavorites` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `nouserevents` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  KEY `userid` (`userid`,`nouserevents`),
  KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`),
  CONSTRAINT `qa_userfavorites_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userfavorites`
--

LOCK TABLES `qa_userfavorites` WRITE;
/*!40000 ALTER TABLE `qa_userfavorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userfavorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userfields`
--

DROP TABLE IF EXISTS `qa_userfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userfields` (
  `fieldid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `content` varchar(40) DEFAULT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL,
  `permit` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`fieldid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userfields`
--

LOCK TABLES `qa_userfields` WRITE;
/*!40000 ALTER TABLE `qa_userfields` DISABLE KEYS */;
INSERT INTO `qa_userfields` VALUES (1,'name',NULL,1,0,NULL),(2,'location',NULL,2,0,NULL),(3,'website',NULL,3,2,NULL),(4,'about',NULL,4,1,NULL);
/*!40000 ALTER TABLE `qa_userfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userlevels`
--

DROP TABLE IF EXISTS `qa_userlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userlevels` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `level` tinyint(3) unsigned DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  KEY `entitytype` (`entitytype`,`entityid`),
  CONSTRAINT `qa_userlevels_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userlevels`
--

LOCK TABLES `qa_userlevels` WRITE;
/*!40000 ALTER TABLE `qa_userlevels` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userlimits`
--

DROP TABLE IF EXISTS `qa_userlimits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userlimits` (
  `userid` int(10) unsigned NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `userid` (`userid`,`action`),
  CONSTRAINT `qa_userlimits_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userlimits`
--

LOCK TABLES `qa_userlimits` WRITE;
/*!40000 ALTER TABLE `qa_userlimits` DISABLE KEYS */;
INSERT INTO `qa_userlimits` VALUES (1,'Q',408611,1);
/*!40000 ALTER TABLE `qa_userlimits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userlogins`
--

DROP TABLE IF EXISTS `qa_userlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userlogins` (
  `userid` int(10) unsigned NOT NULL,
  `source` varchar(16) CHARACTER SET ascii NOT NULL,
  `identifier` varbinary(1024) NOT NULL,
  `identifiermd5` binary(16) NOT NULL,
  KEY `source` (`source`,`identifiermd5`),
  KEY `userid` (`userid`),
  CONSTRAINT `qa_userlogins_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userlogins`
--

LOCK TABLES `qa_userlogins` WRITE;
/*!40000 ALTER TABLE `qa_userlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_usermetas`
--

DROP TABLE IF EXISTS `qa_usermetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_usermetas` (
  `userid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`userid`,`title`),
  CONSTRAINT `qa_usermetas_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_usermetas`
--

LOCK TABLES `qa_usermetas` WRITE;
/*!40000 ALTER TABLE `qa_usermetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_usermetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_usernotices`
--

DROP TABLE IF EXISTS `qa_usernotices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_usernotices` (
  `noticeid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`noticeid`),
  KEY `userid` (`userid`,`created`),
  CONSTRAINT `qa_usernotices_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_usernotices`
--

LOCK TABLES `qa_usernotices` WRITE;
/*!40000 ALTER TABLE `qa_usernotices` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_usernotices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userpoints`
--

DROP TABLE IF EXISTS `qa_userpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userpoints` (
  `userid` int(10) unsigned NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `points` (`points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userpoints`
--

LOCK TABLES `qa_userpoints` WRITE;
/*!40000 ALTER TABLE `qa_userpoints` DISABLE KEYS */;
INSERT INTO `qa_userpoints` VALUES (1,120,1,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `qa_userpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userprofile`
--

DROP TABLE IF EXISTS `qa_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userprofile` (
  `userid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  UNIQUE KEY `userid` (`userid`,`title`),
  CONSTRAINT `qa_userprofile_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userprofile`
--

LOCK TABLES `qa_userprofile` WRITE;
/*!40000 ALTER TABLE `qa_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_users`
--

DROP TABLE IF EXISTS `qa_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_users` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `createip` varbinary(16) NOT NULL,
  `email` varchar(80) NOT NULL,
  `handle` varchar(20) NOT NULL,
  `avatarblobid` bigint(20) unsigned DEFAULT NULL,
  `avatarwidth` smallint(5) unsigned DEFAULT NULL,
  `avatarheight` smallint(5) unsigned DEFAULT NULL,
  `passsalt` binary(16) DEFAULT NULL,
  `passcheck` binary(20) DEFAULT NULL,
  `passhash` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `loggedin` datetime NOT NULL,
  `loginip` varbinary(16) NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` varbinary(16) DEFAULT NULL,
  `emailcode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessioncode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessionsource` varchar(16) CHARACTER SET ascii DEFAULT '',
  `flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `wallposts` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `email` (`email`),
  KEY `handle` (`handle`),
  KEY `level` (`level`),
  KEY `created` (`created`,`level`,`flags`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_users`
--

LOCK TABLES `qa_users` WRITE;
/*!40000 ALTER TABLE `qa_users` DISABLE KEYS */;
INSERT INTO `qa_users` VALUES (1,'2016-08-12 19:53:26','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','jack80342@outlook.com','aliber',NULL,NULL,NULL,NULL,NULL,'$2y$10$rqhzThAzlM7JEcdByew0Xec1zmJPOWIhDJaUAYOEjbGLZ6UFxcKwC',120,'2016-08-13 01:36:16','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','2016-08-12 20:06:10','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','','kwylorww',NULL,0,0);
/*!40000 ALTER TABLE `qa_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_uservotes`
--

DROP TABLE IF EXISTS `qa_uservotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_uservotes` (
  `postid` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  UNIQUE KEY `userid` (`userid`,`postid`),
  KEY `postid` (`postid`),
  CONSTRAINT `qa_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_uservotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_uservotes`
--

LOCK TABLES `qa_uservotes` WRITE;
/*!40000 ALTER TABLE `qa_uservotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_uservotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_widgets`
--

DROP TABLE IF EXISTS `qa_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_widgets` (
  `widgetid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL,
  PRIMARY KEY (`widgetid`),
  UNIQUE KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_widgets`
--

LOCK TABLES `qa_widgets` WRITE;
/*!40000 ALTER TABLE `qa_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_words`
--

DROP TABLE IF EXISTS `qa_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_words` (
  `wordid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) unsigned NOT NULL DEFAULT '0',
  `contentcount` int(10) unsigned NOT NULL DEFAULT '0',
  `tagwordcount` int(10) unsigned NOT NULL DEFAULT '0',
  `tagcount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wordid`),
  KEY `word` (`word`),
  KEY `tagcount` (`tagcount`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_words`
--

LOCK TABLES `qa_words` WRITE;
/*!40000 ALTER TABLE `qa_words` DISABLE KEYS */;
INSERT INTO `qa_words` VALUES (1,'一',1,0,0,0),(2,'加',1,0,0,0),(3,'等',1,0,0,0),(4,'于',1,0,0,0),(5,'几',1,0,0,0),(6,'？',1,0,0,0),(7,'别',1,0,0,0),(8,'说',1,0,0,0),(9,'你',1,0,0,0),(10,'不',1,0,0,0),(11,'知',1,0,0,0),(12,'道',1,0,0,0),(13,'⊙',0,1,0,0),(14,'o',0,1,0,0),(15,'！',0,1,0,0),(16,'#',0,0,1,1),(17,'d',0,0,1,0),(18,'-d',0,0,0,1);
/*!40000 ALTER TABLE `qa_words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-13  1:39:57
