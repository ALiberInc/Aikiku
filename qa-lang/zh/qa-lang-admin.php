<?php
	
/*
	Question2Answer (c) Gideon Greenspan

	http://www.question2answer.org/

	
	File: qa-include/qa-lang-admin.php
	Version: See define()s at top of qa-include/qa-base.php
	Description: Language phrases for admin center

        ---------------------
         Translator: Fish
         Site: http://wx.fanfau.com
         Created: 2013-08-06
        ---------------------

        ---------------------
        Translator: forlong401
        Site: http://androidren.com
        Updated: 2015-01-21
        Note: update it from 1.6.3 to 1.7
        ---------------------

	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2
	of the License, or (at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	More about this license: http://www.question2answer.org/license.php
*/

	return array(
		'active_widgets_explanation' => '已激活的工具',
		'add_category_button' => '添加分类',
		'add_field_button' => '添加字段',
		'add_link_button' => '添加链接',
		'add_link_link' => ' - ^1添加链接^2',
		'add_new_field' => '添加新字段',
		'add_new_title' => '添加新标题',
		'add_page_button' => '添加页面',
		'add_title_button' => '添加标题',
		'add_widget_button' => '添加部件',
		'add_widget_link' => ' - ^1添加部件^2',
		'admin_title' => '管理中心',
		'approve_user_popup' => '批准用户',	
		'after_footer' => '在页脚的链接后',
		'after_main_menu' => '在顶部的选项卡之后',
		'after_x_tab' => '选项卡 "^" 之后',
		'after_x' => '"^" 之后',
		'moderate_title' => '审核',
		'basic_editor' => '基本编辑器',
		'before_main_menu' => '在顶部的选项卡之前',
		'blobs_directory_error' => '定义为 QA_BLOBS_DIRECTORY 的目录 ^ ，在这台服务器上是不可写的。',
		'blobs_move_complete' => '上传的图片和文档已迁移完毕。',
		'blobs_move_moved' => '迁移 ^1 的 ^2 上传的图片和文档',
		'blobs_stop' => '停止转移',
		'blobs_to_db' => '大块二进制数据(图片和文档等)迁移到数据库',
		'blobs_to_db_note' => '- 把磁盘中所有上传的图片和文档迁移到数据库',
		'blobs_to_disk' => '大块二进制数据（图片和文档等）迁移到磁盘',
		'blobs_to_disk_note' => '- 把数据库中所有上传的图片和文档迁移到磁盘',
		'block_button' => '锁定',
		'block_ips_note' => '范围使用连接符(-)、匹配任何数字使用(*)。例如：192.168.0.4,192.168.0.0-192.168.0.31,192.168.0.* ',
		'block_user_popup' => '屏蔽用户',	
		'block_words_note' => '使用 * 匹配任何字母。例如：doh（只会匹配 doh 这个单词），doh*（这将匹配到 doh 或者 dohno），do*h（这将匹配到 doh,dooh,dough）。',
		'cancel_mailing_button' => '取消邮件发送',
		'categories_introduction' => '点击\'添加分类\'开始分类',
		'categories_not_shown' => '一些有分类的问题将不会被显示',
		'categories_title' => '分类',
		'categories' => '分类',
		'category_add_sub' => '添加子分类',
		'category_added' => '已添加分类',
		'category_already_used' => '已被分类使用',
		'category_default_slug' => '分类-^',
		'category_description' => '分类描述(可选):',
		'category_max_depth_x' => '为了防止一些分类多于 ^ 级，因此一些选项或许被隐藏了。',
		'category_move_parent' => '移动到不同的父类',
		'category_name_first' => '第一个分类的名称：',
		'category_name' => '分类名:',
		'category_no_add_subs_x' => '该分类已达 ^ 级，无法创建子分类。',
		'category_no_delete_subs' => '无法删除该分类，该类中还有子分类。',
		'category_no_sub_error' => '^q 问题/秒 在这个分类没有子分类 - ^1设置子分类^2',
		'category_no_sub_to' => '移动没有子分类的问题到 ^ 中：',
		'category_no_subs' => '无',
		'category_none_error' => '^q 问题/秒 目前没有分类 - ^1设置分类^2',
		'category_none_to' => '移动没有分类的问题到：',
		'category_parent' => '父分类:',
		'category_saved' => '分类已保存',
		'category_slug' => '分类别名 - URL 片段：',
		'category_subs' => '子分类:',
		'category_top_level' => '无父类 (顶级)',
		'characters' => '字符',
		'check_language_suffix' => ' - ^1语言文件检查^2',
		'click_name_edit' => '自定义页面或链接:',
		'database_cleanup' => '数据库清理',
		'delete_category_reassign' => '删除这个分类并把该分类下的问题分配到：',
		'delete_category' => '删除该分类',
		'delete_field' => '删除该字段',
		'delete_hidden_complete' => '所有没有依赖关系(从属)的帖子已经被删除',
		'delete_hidden_note' => ' - 所有没有依赖关系(从属)的隐藏的问题，回答和评论',
		'delete_hidden' => '删除隐藏的帖子',
		'delete_link' => '删除该链接',
		'delete_page' => '删除该页',
		'delete_stop' => '停止删除',
		'delete_title' => '删除该标题',
		'delete_widget_position' => '从该位置删除这个部件',
		'edit_custom_page' => '编辑自定义页面',
		'edit_field' => ' - ^1字段编辑^2',
		'edit_link' => ' - ^1链接编辑^2',
		'edit_page' => ' - ^1页面编辑^2',
		'edit_title' => ' - ^1标题编辑^2',
		'emails_per_minute' => '邮件/分钟',
		'emails_title' => '邮件',
		'feed_link_example' => 'Feed 示例',
		'feed_link' => 'Feed订阅',
		'feeds_title' => 'RSS',
		'field_link_url' => 'URL链接',
		'field_multi_line' => '多行文本',
		'field_name' => '字段名称:',
		'field_single_line' => '单行文本',
		'field_type' => '内容类型:',
		'first' => '第一个',
		'flagged_title' => '举报',
		'form_security_expired' => '表单安全码已过期 - 请重试',
		'from_anon' => '来自匿名用户:',
		'from_users' => '来自用户:',
		'general_title' => '普通',
		'hidden_answers_deleted' => '已删除 ^1的^2 无依赖(从属)的隐藏回答。',
		'hidden_comments_deleted' => '已删除 ^1的^2 隐藏的评论。',
		'hidden_questions_deleted' => '已删除 ^1的^2 无依赖(从属)的隐藏的问题。',
		'hotness_factors' => '问题热度评分：',
		'hidden_title' => '隐藏',
		'ip_address_pages' => 'IP 地址页',
		'layout_title' => '布局',
		'link_name' => '链接名:',
		'link_new_window' => '在新窗口中打开链接',
		'link_url' => '链接的URL - 绝对或者相对于 Q2A 的根目录:',
		'lists_title' => '列表',
		'mailing_complete' => '邮件发送完成',
		'mailing_explanation' => '用户可以在账户页面退订。',
		'mailing_progress' => '邮件已发送给用户 ^1 of ^2。',
		'mailing_title' => '邮件群发',
		'mailing_unsubscribe' => '退订邮件的链接将会添加到每封邮件的底部。',
		'maintenance_admin_only' => '网站 ^1维护^2 中，普通用户无法访问。',
		'maximum_x' => ' （max ^）',
		'approve_users_title' => '用户审核',
		'module_x_database_init' => '模块 ^1 ^2 需要 ^3数据库初始化^4。',
		'most_flagged_title' => '举报最多的问题',
		'mysql_version' => 'MySQL 版本:',
		'nav_links_explanation' => '显示导航链接:',
		'nav_qa_is_home' => 'Q&A (主页链接)',
		'neat_urls_note' => ' (需要 ^1htaccess^2 文件)',
		'no_approve_found' => '没有等待审核的内容',
		'no_classification' => '无',
		'no_flagged_found' => '没有举报内容',
		'no_hidden_found' => '没有找到隐藏的内容',
		'no_image_gd' => '编译安装的PHP版本不支持GD图像，因此用户无法直接上传自己的头像。',
		'no_link' => '无链接',
		'no_multibyte' => '编译安装的PHP版本不支持多字节字符串，搜索非罗马字符会出现问题',
		'no_privileges' => '只有管理员才可以访问该页',
		'no_unapproved_found' => '没有等待审核用户',
		'not_logged_in' => '^1管理员^2才可以访问本页面。',
		'opposite_main_menu' => '标签右侧',
		'options_reset' => '重置设置',
		'options_saved' => '设置已保存',
		'options' => '选项',
		'page_already_used' => '该页面已经在使用',
		'page_content_html' => '显示在页面的内容 - 允许HTML：',
		'page_default_slug' => '页面-^',
		'page_heading' => '在页面顶部显示标题：',
		'page_name' => '页面名称(还用于选项卡或者链接)',
		'page_slug' => '页面别名（URL片段）：',
		'pages_explanation' => '点击 \'添加页面\' 按钮来添加自定义页面到你的站点，或点击 \'添加链接\' 来链接到其他网页。',
		'pages_title' => '页面',
		'pause_mailing_button' => '暂停邮件发送',
		'per_ip_hour' => 'IP/小时',
		'per_user_hour' => '用户/小时',
		'permissions_title' => '权限',
		'permit_to_view' => '可见:',
		'php_version' => 'PHP 版本:',
		'pixels' => '像素',
		'plugin_module' => ' (插件模块: ^)',
		'plugin_pages_explanation' => '插件页：',
		'plugins_title' => '插件',
		'points_defaults_shown' => '如下所示为默认值，但是 还没有应用：',
		'points_required' => '获得积分必须先填标题：',
		'points_title' => '积分',
		'points' => '分',
		'position' => '位置:',
		'posting_title' => '帖子',
		'profile_fields' => '用户页面上多余的字段或登记表:',
		'q2a_build_date' => '创建时间:',
		'q2a_db_size' => '数据库大小:',
		'q2a_db_version' => 'Q2A 数据库版本:',
		'q2a_latest_version' => '最新版本:',
		'q2a_version' => 'Question2Answer 版本:',
		'question_lists' => '问题列表',
		'question_pages' => '问题页面',
		'recalc_categories_backpaths' => '重新计算分类 ^1的^2 URL路径...',
		'recalc_categories_complete' => '成功计算所有分类。',
		'recalc_categories_note' => ' - 帖子分类和帖子计数',
		'recalc_categories_recounting' => '重计数分类 ^1 的 ^2 问题...',
		'recalc_categories_updated' => '重计算过 ^1 的 ^2 帖子...',
		'recalc_categories' => '重新计算分类',
		'recalc_points_complete' => '所有用户的积分计算成功。',
		'recalc_points_note' => ' - 用户排名和积分',
		'recalc_points_recalced' => '重新计算过的用户 ^1的^2 ...',
		'recalc_points_usercount' => '估算用户总数...',
		'recalc_points' => '重算用户积分',
		'recalc_posts_count' => '获取问题的 回答 和 评论 的总数...',
		'recalc_stop' => '停止重新计算',
		'recent_approve_title' => '最新等待的审核内容',
		'recent_hidden_title' => '最近隐藏的内容',
		'recount_posts_as_recounted' => '重计帖子 ^1的^2 回答数和热度...',
		'recount_posts_complete' => '成功重新计数了所有帖子。',
		'recount_posts_note' => ' - 每个帖子的回答数、投票、举报、热度',
		'recount_posts_stop' => '停止重计数',
		'recount_posts_votes_recounted' => '重计帖子 ^1的^2 投票数和举报数...',
		'recount_posts' => '帖子重计数',
		'refill_events_complete' => '成功重填所有的事件流',
		'refill_events_note' => ' - 重填用户更新列表',
		'refill_events_refilled' => '^1 个问题已经重填，共 ^2 个...',
		'refill_events' => '重填事件流',
		'registration_fields' => '新增注册字段',
		'reindex_content' => '内容重索引',
		'reindex_content_note' => ' - 为搜索和相关问题提供相关信息',
		'reindex_content_stop' => '停止重索引',
		'reindex_pages_reindexed' => '已重索引 ^1的^2 页面...',
		'reindex_posts_complete' => '所以帖子已成功的重索引',
		'reindex_posts_reindexed' => '重索引过 ^1的^2 帖子',
		'reindex_posts_wordcounted' => '已完成^1条，共 ^2 ...',
		'requires_php_version' => '禁用 - 需要PHP ^ 或者更高版本',
		'requires_q2a_version' => '禁用 - 需要Question2Answer ^ 或者更高版本',
		'reset_options_button' => '重置为默认',
		'reset_options_confirm' => '你确定要重置此页面上的所有选项的缺省值？',	
		'resume_mailing_button' => '恢复邮件',
		'save_view_button' => '保存并查看',
		'save_options_button' => '保存',
		'save_recalc_button' => '保存并重新计算',
		'send_test_button' => '发送测试邮件给我',
		'show_defaults_button' => '显示默认',
		'show_on_register_form' => '在用户登记表中显示字段',
		'slug_bad_chars' => '别名不能包含字符: ^',
		'slug_reserved' => '保留别名',
		'spam_title' => '反垃圾',
		'start_mailing_button' => '开始发送',
		'stats_title' => '统计',
		'stop_recalc_warning' => '一个数据库清理的操作已经在执行。如果你现在就想关闭这个页面，操作将会被中断。',
		'tag_pages' => '标签页面',
		'tags_and_categories' => '标签和分类',
		'tags_not_shown' => '一些有标签的问题将不会被显示。',
		'tags' => '标签',
		'test_sent_to_x' => '测试消息已发送到 ^',
		'title_already_used' => '该值已经被其他标题使用了',
		'top_level_categories' => '顶级分类:',
		'total_as' => '回答总数:',
		'total_cs' => '评论总数:',
		'total_qs' => '问题总数:',
		'unnamed_plugin' => '未命名插件',
		'upgrade_db' => '该版本需要^1升级^2你的Q2A数据库',
		'url_format_note' => '选项为 ^ 标签的表示可用。对于搜索引擎优化(SEO)第一个 ^ 是最佳选择。',
		'user_pages' => '用户页面',
		'user_title' => '用户标题 - 允许HTML:',
		'user_titles' => '基于积分的用户标题:',
		'users_active' => '活跃的用户:',
		'users_must_have' => '用户必须有',
		'users_posted' => '用户发布:',
		'users_registered' => '已注册用户:',
		'users_title' => '用户',
		'users_voted' => '用户投票:',
		'version_get_x' => '获取 ^',
		'version_requires_php' => '^1 需要 PHP ^2', 
		'version_requires_q2a' => '^1 需要 Q2A ^2', 
		'version_latest_unknown' => '未知最新版本',
		'version_latest' => '最新',
		'viewing_title' => '视图',
		'widget_all_pages' => '在所有可用页面的这个位置上显示部件',
		'widget_global_options' => ' - ^1选项^2',
		'widget_name' => '部件名称:',
		'widget_no_positions' => '该部件已经被添加到所有可用位置。',
		'widget_not_available' => '该部件不可用。可能是因为插件提供的部件已卸载。',
		'widget_pages_explanation' => '在下面页面的这个位置上显示这个部件：',
		'widgets_explanation' => '可用部件',
	);
	

/*
	Omit PHP closing tag to help avoid accidental output
*/
