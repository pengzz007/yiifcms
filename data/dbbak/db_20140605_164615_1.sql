# your database backup
# version:5.5.27-log
# time:2014-06-05 16:46:15
# --------------------------------------------------------


DROP TABLE IF EXISTS `yii_ad`;
CREATE TABLE `yii_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `position_id` int(10) unsigned NOT NULL COMMENT '广告位ID',
  `title` varchar(50) NOT NULL COMMENT '广告名称',
  `title_alias` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `width` varchar(10) NOT NULL DEFAULT '' COMMENT '图片宽',
  `height` varchar(10) NOT NULL DEFAULT '' COMMENT '图片高',
  `intro` text COMMENT '广告描述',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `attach_file` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告';

INSERT INTO `yii_ad` VALUES('2','1','首页banner1','index_banner','','','1440','500','','0','uploads/images/201404/113511a7cd1.png','1','Y','1379544139');
INSERT INTO `yii_ad` VALUES('3','1','首页banner2','index_banner','','','1440','500','','0','uploads/images/201404/0b92e2274de.png','2','Y','1379544231');

DROP TABLE IF EXISTS `yii_ad_position`;
CREATE TABLE `yii_ad_position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` varchar(100) NOT NULL DEFAULT '' COMMENT '广告位名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='广告位管理表 ';

INSERT INTO `yii_ad_position` VALUES('1','首页banner幻灯片');
INSERT INTO `yii_ad_position` VALUES('2','底部幻灯片');

DROP TABLE IF EXISTS `yii_catalog`;
CREATE TABLE `yii_catalog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('article','image','soft','video','goods') NOT NULL DEFAULT 'article' COMMENT '栏目类型',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类',
  `catalog_name` varchar(100) NOT NULL COMMENT '名称',
  `content` text COMMENT '详细介绍',
  `seo_title` varchar(100) NOT NULL DEFAULT '' COMMENT 'seo标题',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo关键字',
  `seo_description` text COMMENT 'seo描述',
  `attach_file` varchar(100) DEFAULT '' COMMENT '附件',
  `attach_thumb` varchar(100) DEFAULT '' COMMENT '缩略图',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `data_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数据量',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `redirect_url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='全局分类';

INSERT INTO `yii_catalog` VALUES('1','article','0','新闻','新闻<br />','d','d','d','uploads/images/201403/8a4b5e11db6.png','uploads/thumbs/201403/small_8a4b5e11db6.png','0','0','Y','','1379545020','1394509418');
INSERT INTO `yii_catalog` VALUES('2','article','1','公司动态','公司动态栏目介绍','','','','uploads/images/201402/98f97227c00.png','','2','0','Y','','1379545199','1394509418');
INSERT INTO `yii_catalog` VALUES('3','article','1','行业新闻','行业新闻栏目介绍','','','','uploads/images/201403/b49f2b45b50.jpg','uploads/thumbs/201403/small_b49f2b45b50.jpg','1','0','Y','','1379545248','1394509418');
INSERT INTO `yii_catalog` VALUES('4','goods','0','产品','产品栏目介绍','','','','','','0','0','Y','','1379545330','1394517482');
INSERT INTO `yii_catalog` VALUES('5','goods','4','新品上市','新品上市栏目介绍','','','','','','1','0','Y','','1379545388','1394517482');
INSERT INTO `yii_catalog` VALUES('6','goods','4','特价商品','特价商品栏目介绍','','','','','','0','0','N','','1379545435','1394517482');
INSERT INTO `yii_catalog` VALUES('8','image','0','图集','','','','','','','0','0','Y','','0','1399616730');
INSERT INTO `yii_catalog` VALUES('9','image','8','最新热图','最新热图','最新热图','最新热图','最新热图','','','0','0','Y','','0','1399616723');
INSERT INTO `yii_catalog` VALUES('10','soft','0','热门软件','','热门软件','热门软件','热门软件','','','0','0','Y','','1400489000','1400489000');
INSERT INTO `yii_catalog` VALUES('11','soft','10','网站软件','网站软件','网站软件','网站软件','网站软件','','','0','0','Y','','1400489069','1400489069');
INSERT INTO `yii_catalog` VALUES('12','video','0','最新视频','','','','','','','0','0','Y','','1400828336','1400828336');
INSERT INTO `yii_catalog` VALUES('13','video','12','最新电影','','','','','','','0','0','Y','','1400828453','1400828453');

DROP TABLE IF EXISTS `yii_goods`;
CREATE TABLE `yii_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `catalog_id` int(10) unsigned DEFAULT NULL COMMENT '栏目id',
  `price` decimal(10,2) unsigned DEFAULT NULL,
  `default_image` varchar(200) DEFAULT NULL COMMENT '商品图片',
  `default_thumb` varchar(200) DEFAULT NULL COMMENT '商品缩略图',
  `image_list` varchar(255) DEFAULT NULL COMMENT '商品组图',
  `content` text COMMENT '商品内容',
  `views` int(10) unsigned DEFAULT '0' COMMENT '浏览次数',
  `sales` int(10) unsigned DEFAULT '0' COMMENT '销售次数',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `status` enum('Y','N') DEFAULT 'Y' COMMENT '显示状态',
  `recom_id` int(10) DEFAULT '0' COMMENT '推荐位id',
  `sort_order` mediumint(10) unsigned DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品表';

INSERT INTO `yii_goods` VALUES('1','小米手机','5','0.00','uploads/images/201405/3fdd860df5d.jpg','uploads/thumbs/201405/small_3fdd860df5d.jpg','a:1:{i:0;a:4:{s:6:\"fileId\";s:2:\"45\";s:4:\"file\";s:37:\"uploads/images/201405/6bf7dd586e7.jpg\";s:4:\"desc\";s:0:\"\";s:3:\"url\";s:0:\"\";}}','','0','0','1401076650','1401092539','Y','0','0');

DROP TABLE IF EXISTS `yii_link`;
CREATE TABLE `yii_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '名称',
  `link` varchar(100) DEFAULT NULL COMMENT '链接',
  `logo` varchar(255) DEFAULT NULL COMMENT 'LOGO图标',
  `sortorder` smallint(10) DEFAULT '255' COMMENT '排序',
  `status_is` enum('Y','N') DEFAULT 'Y' COMMENT '状态Y-显示N-隐藏',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='链接表';

INSERT INTO `yii_link` VALUES('16','ThinkPHP','http://www.thinkphp.cn/','','255','Y');
INSERT INTO `yii_link` VALUES('3','站长之家','http://www.chinaz.com','','2','Y');
INSERT INTO `yii_link` VALUES('4','PHPChina','http://www.phpchina.com','','3','Y');
INSERT INTO `yii_link` VALUES('5','Discuz动力社区','http://www.discuz.net','','4','Y');
INSERT INTO `yii_link` VALUES('6','DNSPod','http://www.dnspod.cn','','255','Y');
INSERT INTO `yii_link` VALUES('7','PHP100中文网','http://www.php100.com/','','255','Y');
INSERT INTO `yii_link` VALUES('8','  WEB技术开发','http://www.itokit.com/','','255','Y');
INSERT INTO `yii_link` VALUES('9','源码爱好者 ','http://www.codefans.net/','','255','Y');
INSERT INTO `yii_link` VALUES('10','PHPCMS','http://bbs.phpcms.cn/','','255','Y');
INSERT INTO `yii_link` VALUES('11',' PHPwind论坛','http://www.phpwind.net/','','255','Y');
INSERT INTO `yii_link` VALUES('12','Drupal中国  ','http://drupalchina.cn/','','255','Y');
INSERT INTO `yii_link` VALUES('13','德问编程','http://www.dewen.org/','','255','Y');
INSERT INTO `yii_link` VALUES('14','stackoverflow','http://stackoverflow.com/','','255','Y');
INSERT INTO `yii_link` VALUES('15','Linux课程学习','http://itercast.com/','','255','Y');
INSERT INTO `yii_link` VALUES('17','CakePHP','http://cakephp.org/','','255','Y');
INSERT INTO `yii_link` VALUES('18','站长之家','http://www.chinaz.com','uploads/images/201404/d7ab0fba105.png','255','Y');

DROP TABLE IF EXISTS `yii_mail_log`;
CREATE TABLE `yii_mail_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accept` varchar(50) DEFAULT NULL COMMENT '收件人邮箱',
  `subject` varchar(100) DEFAULT NULL COMMENT '邮件标题',
  `message` text COMMENT '邮件内容',
  `sendtime` int(10) unsigned DEFAULT NULL COMMENT '发送时间',
  `status` enum('waiting','success','failed') DEFAULT 'waiting' COMMENT '当前邮件状态(待发送、发送成功、发送失败)',
  `level` enum('1','2','3') DEFAULT '3' COMMENT '邮件优先级(越小越优先)',
  `times` tinyint(2) unsigned DEFAULT '0' COMMENT '发送次数',
  `error` varchar(100) DEFAULT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='发送邮件日志';

INSERT INTO `yii_mail_log` VALUES('1','yiicms','测试邮件','','1400230262','success','3','3','You must provide at least one recipient email address.');
INSERT INTO `yii_mail_log` VALUES('2','376685457@qq.com','yiicms','测试邮件','0','waiting','3','0','');
INSERT INTO `yii_mail_log` VALUES('3','376685457@qq.com','yiicms','测试邮件','0','waiting','3','0','');
INSERT INTO `yii_mail_log` VALUES('4','376685457@qq.com','yiicms','测试邮件','0','waiting','3','0','');
INSERT INTO `yii_mail_log` VALUES('5','376685457@qq.com','yiicms','测试邮件','0','waiting','3','0','');
INSERT INTO `yii_mail_log` VALUES('6','376685457@qq.com','yiicms','测试邮件','0','waiting','3','0','');
INSERT INTO `yii_mail_log` VALUES('7','376685457@qq.com','yiicms','测试邮件','0','waiting','3','0','');
INSERT INTO `yii_mail_log` VALUES('8','376685457@qq.com','yiicms','测试邮件','0','waiting','3','0','');
INSERT INTO `yii_mail_log` VALUES('9','376685457@qq.com','yiicms','测试邮件','1400230572','success','3','1','');
INSERT INTO `yii_mail_log` VALUES('10','376685457@qq.com','yiicms','测试邮件','1400230784','success','3','1','');
INSERT INTO `yii_mail_log` VALUES('11','376685457@qq.com','yiicms','测试邮件','1400230820','failed','3','1','SMTP Error: Could not connect to SMTP host.');
INSERT INTO `yii_mail_log` VALUES('12','376685457@qq.com','yiicms','测试邮件<p><a href=\"baidu.com\">百度一下</a></p>','1400230886','success','3','1','');
INSERT INTO `yii_mail_log` VALUES('13','376685457@qq.com','yiicms','测试邮件<p><a href=\"baidu.com\">百度一下</a></p>','1400231187','success','3','1','');
INSERT INTO `yii_mail_log` VALUES('14','326196998@qq.com','我的yii网站 账号激活','<p>尊敬的新用户：test001 您好，欢迎注册我的yii网站，为了更好的为您服务，请点击下面链接进行账号激活：<br/>						<a href=\"http://www.yii.local/site/authEmail/33.htm?authcode=MTUdoTWoxKcHc\">http://www.yii.local/site/authEmail/33.htm?authcode=MTUdoTWoxKcHc</a><br/>如果上面链接不能点击，请复制到浏览器地址栏中进行访问。<br/>						再次感谢您的光顾，如果有其他疑问，						请联系本网站的管理员<a href=\"mailto\">xb_zjh@126.com</a>。</p>','1400462628','success','3','1','');
INSERT INTO `yii_mail_log` VALUES('15','xb_zjh@126.com','重设邮箱','<p>尊敬的用户：{testUser} 您好，您已经申请修改邮箱操作，请输入下面的验证码进行验证：<br/><br/>						{941606}<br/><br/>						==================<br/><br/>如果不是您本人操作，请尽快联系本网站的管理员：<a href=\"mailto:{xb_zjh@126.com}\">{xb_zjh@126.com}</a>。</p>','1401782862','success','3','1','');
INSERT INTO `yii_mail_log` VALUES('16','1441044277@qq.com','重设邮箱','<p>尊敬的用户：testUser 您好，您已经申请修改邮箱操作，请输入下面的验证码进行验证：<br/><br/>						895844<br/><br/>						==================<br/><br/>如果不是您本人操作，请尽快联系本网站的管理员：<a href=\"mailto:xb_zjh@126.com\">xb_zjh@126.com</a>。</p>','1401783826','success','3','1','');
INSERT INTO `yii_mail_log` VALUES('17','1441044277@qq.com','重设邮箱','<p>尊敬的用户：testUser 您好，您已经申请修改邮箱操作，请输入下面的验证码进行验证：<br/><br/>						718976<br/><br/>						==================<br/><br/>如果不是您本人操作，请尽快联系本网站的管理员：<a href=\"mailto:xb_zjh@126.com\">xb_zjh@126.com</a>。</p>','1401784431','success','3','1','');
INSERT INTO `yii_mail_log` VALUES('18','1441044277@qq.com','重设邮箱','<p>尊敬的用户：testUser 您好，您已经申请修改邮箱操作，请输入下面的验证码进行验证：<br/><br/>						119147<br/><br/>						==================<br/><br/>如果不是您本人操作，请尽快联系本网站的管理员：<a href=\"mailto:xb_zjh@126.com\">xb_zjh@126.com</a>。</p>','1401784617','success','3','1','');

DROP TABLE IF EXISTS `yii_menu`;
CREATE TABLE `yii_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(30) DEFAULT NULL COMMENT '导航菜单',
  `menu_link` varchar(50) DEFAULT NULL COMMENT '导航链接',
  `unique` varchar(20) DEFAULT NULL COMMENT '唯一标示',
  `status_is` enum('Y','N') DEFAULT 'Y' COMMENT '是否显示',
  `parent_id` int(10) unsigned DEFAULT '0' COMMENT '上级菜单',
  `sort_order` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `target` enum('Y','N') DEFAULT 'N' COMMENT '新窗口打开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='导航菜单表';

INSERT INTO `yii_menu` VALUES('1','首页','/','index','Y','0','0','Y');
INSERT INTO `yii_menu` VALUES('2','资讯','/post/index.htm','post','Y','0','0','N');
INSERT INTO `yii_menu` VALUES('3','图集','/image/index.htm','image','Y','0','0','N');
INSERT INTO `yii_menu` VALUES('4','软件','/soft/index.htm','soft','Y','0','0','N');

DROP TABLE IF EXISTS `yii_page`;
CREATE TABLE `yii_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `title_second` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `title_alias` char(40) NOT NULL COMMENT '标签',
  `html_path` varchar(100) NOT NULL DEFAULT '' COMMENT 'html路径',
  `html_file` varchar(100) NOT NULL DEFAULT '' COMMENT 'html文件',
  `intro` text COMMENT '简单描述',
  `content` mediumtext NOT NULL COMMENT '内容',
  `seo_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO KEYWORDS',
  `seo_description` text COMMENT 'SEO DESCRIPTION',
  `template` varchar(30) NOT NULL DEFAULT '' COMMENT '模板',
  `attach_file` varchar(60) NOT NULL DEFAULT '' COMMENT '附件',
  `attach_thumb` varchar(60) NOT NULL DEFAULT '' COMMENT '附件小图',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='单页';

INSERT INTO `yii_page` VALUES('1','关于我们','','about','','','BageCms是一款基于php5+mysql5开发的多功能开源的网站内容管理系统。使用高性能的PHP5的web应用程序开发框架YII构建，具有操作简单、稳定、安全、高效、跨平台等特点。采用MVC设计模式，模板定制方便灵活，内置小挂工具，方便制作各类功能和效果，BageCms可用于企业建站、个人博客、资讯门户、图片站等各类型站点','<p>	BageCms是一款基于php5+mysql5开发的多功能开源的网站内容管理系统。使用高性能的PHP5的web应用程序开发框架YII构建，具有操作简单、稳定、安全、高效、跨平台等特点。采用MVC设计模式，模板定制方便灵活，内置小挂工具，方便制作各类功能和效果，BageCms可用于企业建站、个人博客、资讯门户、图片站等各类型站点。<br /><br />特点：<br /><br />1.开源免费<br />无论是个人还是企业展示型网站均可用本系统来完成<br /><br />2.数据调用方便快捷<br />自主研发的数据调用模块，能快速调用各类型数据，方便建站<br /><br />3.应用范围广<br />这套系统不是企业网站管理系统，也不是博客程序，更不是专业的图片管理系统，但它却具备大部分企业站、博客站、图片站的功能<br /><br />4.安全高性能<br />基于高性能的PHP5的web应用程序开发框架YII构建具有稳定、安全、高效、跨平台等特点<br /><br />5.URL自定义<br />系统支持自定义伪静态显示方式，良好的支持搜索引擎SEO。个性化设置每个栏目、内容的标题标签、描述标签、关键词标签<br /><br />6.自定义数据模型<br />系统可自定义数据模型满足各种表示形式和字段需求<br /><br />7.完善的后台权限控制<br />特有的管理员权限管理机制，可以灵活设置管理员的栏目管理权限、网站信息的添加、修改、删除权限等<br /><br /><br />系统运行环境：<br />数据库： mysql5+<br />PHP版本：php5.2.+<br />服务器：linux,unix,freebsd等<br /><br />官方网址：http://www.bagecms.com<br />下载地址：http://www.bagecms.com/download/bagecms<br /><br />演示地址：http://demo.bagecms.com<br />后台地址：http://demo.bagecms.com/admini<br />用户：bagecms<br />密码：bagecms</p><p>	<br /></p>','','','','','uploads/201309/logo.jpg','uploads/201309/logo.jpg','0','0','','1322999570');
INSERT INTO `yii_page` VALUES('2','联系我们','','contact','','','','<p>	QQ:5565907</p><p>	QQ群：139869141</p><p>	BageCMS官方网站：<a href=\"http://www.bagecms.com\" target=\"_blank\">http://www.bagecms.com</a></p><p>	八哥软件官方网站：<a href=\"http://www.bagesoft.cn\" target=\"_blank\">http://www.bagesoft.cn</a></p>','','','','','','','0','0','','1322999588');
INSERT INTO `yii_page` VALUES('3','企业文化','','cultural','','','企业文化是企业为解决生存和发展的问题的而树立形成的，被组织成员认为有效而共享，并共同遵循的基本信念和认知。 企业文化集中体现了一个企业经营管理的核心主张，以及由此产生的组织行为。','<div>	<div>		迪尔和肯尼迪把企业文化整个理论系统概述为5个要素，即企业环境、价值观、英雄人物、文化仪式和文化网络。	</div>	<div>		企业环境是指企业的性质、企业的经营方向、外部环境、企业的社会形象、与外界的联系等方面。它往往决定企业的行为。	</div>	<div>		价值观是指企业内成员对某个事件或某种行为好与坏、善与恶、正确与错误、是否值得仿效的一致认识。价值观是企业文化的核心，统一的价值观使企业内成员在判断自己行为时具有统一的标准，并以此来选择自己的行为。	</div>	<div>		英雄人物是指企业文化的核心人物或企业文化的人格化，其作用在于作为一种活的样板，给企业中其他员工提供可供仿效的榜样，对企业文化的形成和强化起着极为重要的作用。	</div>	<div>		文化仪式是指企业内的各种表彰、奖励活动、聚会以及文娱活动等，它可以把企业中发生的某些事情戏剧化和形象化，来生动的宣传和体现本企业的价值观，使人们通过这些生动活泼的活动来领会企业文化的内涵，使企业文化“寓教于乐”之中。	</div>	<div>		文化网络是指非正式的信息传递渠道，主要是传播文化信息。它是由某种非正式的组织和人群，以及某一特定场合所组成，它所传递出的信息往往能反映出职工的愿望和心态。	</div>	<h3>		产生	</h3>	<div>		企业领导者把文化的变化人的功能应用于企业，以解决现代企业管理中的问题，就有了企业文化。企业管理理论和企业文化管理理论都追求效益。但前者为追求效益而把人当作客体，后者为追求效益把文化概念自觉应用于企业，把具有丰富创造性的人作为管理理论的中心。这种指导思想反映到企业管理中去，就有了人们称之为企业文化的种种观念。	</div>	<h3>		认识	</h3>	<div>		从企业文化的现实出发，进行深入的调查研究，把握企业文化各种现象之间的本质联系。依据实践经验，从感认认识到理性认识，进行科学的概括、总结。	</div>	<h3>		意义	</h3>	<div>		一．企业文化能激发员工的使命感。不管是什么企业都有它的责任和使命，企业使命感是全体员工工作的目标和方向，是企业不断发展或前进的动力之源。	</div>	<div>		二．企业文化能凝聚员工的归属感。　企业文化的作用就是通过企业价值观的提炼和传播，让一群来自不同地方的人共同追求同一个梦想。	</div>	<div>		三．企业文化能加强员工的责任感。企业要通过大量的资料和文件宣传员工责任感的重要性，管理人员要给全体员工灌输责任意识，危机意识和团队意识，要让大家清楚地认识企业是全体员工共同的企业。	</div>	<div>		四．企业文化能赋予员工的荣誉感。每个人都要在自己的工作岗位，工作领域，多做贡献，多出成绩，多追求荣誉感。	</div>	<div>		五．企业文化能实现员工的成就感。一个企业的繁荣昌盛关系到每一个公司员工的生存，企业繁荣了，员工们就会引以为豪，会更积极努力的进取，荣耀越高，成就感就越大，越明显。	</div></div><div></div>','','','','','','','0','0','','1331877791');
INSERT INTO `yii_page` VALUES('4','管理团队1','','team','','','团队是现代企业管理中战斗的核心，几乎没有一家企业不谈团队，好象团队就是企业做大做强的灵丹妙药，只要抓紧团队建设就能有锦锈前程了。团队是个好东西，但怎样的团队才算一个好团队，怎样才能运作好一个团队呢？却是许多企业管理者不甚了然的，于是在企业团队建设的过程中就出现了许多弊病，例如从理论著作中生搬硬套到团队运作里面，是很难产生好团队的。','<div>	<div>		团队是现代企业管理中战斗的核心，几乎没有一家企业不谈团队，好象团队就是企业做大做强的灵丹妙药，只要抓紧团队建设就能有锦锈前程了。团队是个好东西，但怎样的团队才算一个好团队，怎样才能运作好一个团队呢？却是许多企业管理者不甚了然的，于是在企业团队建设的过程中就出现了许多弊病，例如从理论著作中生搬硬套到团队运作里面，是很难产生好团队的。任何理念都不能执着，执着生僵化，就会蜕变为形式主义，后果很糟糕。在如今企业管理者热火朝天进行的团队建设中就存在这个问题，将团队作为企业文化建设的至上准则是不恰当的，是不符合多元化的现实状况的。	</div>	<div>		一个优秀的企业管理者，应该怎样管理员工?道理也很简单，那就是要给员工创造一个充分利用自己的个性将工作干得最好的条件。不一定什么都要团队化，太死板了。虽然现在的企业也都提倡创新，但如果管理者过分强调团队精神，则员工的创新精神必然受到压抑。压抑个性就是压抑创新，没有个性哪来的创新?说得极端一点，企业管理者要谨防团队建设法西斯化。团队是需要的，企业管理者在团队建设的同时要遵循一个原则，不能压抑员工的个性。在团队内部，企业管理者要给员工充分的自由，少说几句少数服从多数，要知道，聪明的人在世界上还就占少数。	</div>	<div>		企业管理者应该解放思想，要有多元化的思维。不同的企业，团队的性质也不一样。要量体裁衣建设符合企业内在要求的团队，要灵活变化，别搞一刀切。如果该企业是劳动密集型企业，那你可以建设一支高度纪律性组织性的团队。如果该企业是知识密集型企业，那就要以自由主义来管理员工了，建立一支人尽其才的团队是最重要的，严格说算不上是团队，也没必要强调团队，更注重的应该是员工的个人创造力，千万别让团队束缚住员工的头脑，当然应该有的纪律和合作也是不可少的。如果企业既有创造型员工也有操作型员工，那可将团队建设重点放到操作型员工身上。需要注意的一点是，越聪明的人越倾向个人主义，这个情况，企业管理者要注意有的放矢。	</div></div><div></div>','','','','','','','0','0','Y','1379392484');

DROP TABLE IF EXISTS `yii_post`;
CREATE TABLE `yii_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '用户',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `title_second` varchar(255) NOT NULL DEFAULT '' COMMENT '副标题',
  `title_style` varchar(255) NOT NULL DEFAULT '' COMMENT '标题样式',
  `html_path` varchar(100) NOT NULL DEFAULT '' COMMENT 'html路径',
  `html_file` varchar(100) NOT NULL DEFAULT '' COMMENT 'html文件名',
  `catalog_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `special_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '专题编号',
  `intro` text COMMENT '摘要',
  `image_list` text COMMENT '组图',
  `seo_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_description` text COMMENT 'SEO描述',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `content` mediumtext NOT NULL COMMENT '内容',
  `copy_from` varchar(100) NOT NULL DEFAULT '' COMMENT '来源',
  `copy_url` varchar(255) NOT NULL DEFAULT '' COMMENT '来源url',
  `redirect_url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转URL',
  `tags` varchar(255) NOT NULL DEFAULT '' COMMENT 'tags',
  `view_count` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '查看次数',
  `commend` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '推荐',
  `attach_status` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '是否上传附件',
  `attach_file` varchar(255) NOT NULL DEFAULT '' COMMENT '附件名称',
  `attach_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '附件缩略图',
  `favorite_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `attention_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注次数',
  `top_line` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '头条',
  `last_update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `reply_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复次数',
  `reply_allow` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '允许评论',
  `sort_desc` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '新闻状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='内容管理';

INSERT INTO `yii_post` VALUES('1','1','价值1960元JJ林俊杰「时线Time Line」世界巡回演唱会北京站VIP门票2张，百度团购免费送啦！9月28日首都体育馆','','','','','2','0','【中奖号码计算方法】：开奖日前一天的“全国福利彩票新3D开奖号码”+“全国体育彩票排列5开奖号码”+“百度收盘股价小数点后两位” = 10位数（即3组数字合并，10位均按顺序排列，此10位数若首位为0则去掉）。
★ ...','','','','','【中奖号码计算方法】：开奖日前一天的“全国福利彩票新3D开奖号码”+“全国体育彩票排列5开奖号码”+“百度收盘股价小数点后两位” = 10位数（即3组数字合并，10位均按顺序排列，此10位数若首位为0则去掉）。<br />★ 以此10位数整除以活动截止日（xxx年x月xx日 23:59:59）的所有抽奖人数（每个抽奖号即为一个抽奖人数），得到的余数+1即为本次活动的获奖号码<br />① 若获奖号码不足7位，则再加上本次所有抽奖人数，直至加到不为空的抽奖号码为止，此号码为本次活动的中奖号码。<br />② 获奖号码满足7位，但中奖号码为空，则再减去本次抽奖人数之和，直至减不为空的抽奖号码为止，此号码为本次活动的中奖号码。<br />③ 如彩票开奖方开奖时间滞后,或股票交易所休市则本活动开奖日也将进行相应的顺延；<br />④如果当天需要开多个奖，则用此号码分别+011 +021 +031……得出当天其他获奖号码。如果开奖最后一天抽奖号码加值后超过了总参加人数，则将抽奖号码减去总参加人数得到新的抽奖号码。<br /><p>	若您的“抽奖号”与最终获奖号码完全一致，就可以获得本次活动的大奖啦！</p><p>	<img src=\"/cms/uploads/201309/523a32fdf1f07.jpg\" alt=\"\" /> </p>★ 例如：<br />如2013年7月10日<br />新3D号码：4,8,7<br />排列5号码：8，2，9，0，5<br />百度股票收盘价：93.43 小数点后2位：4,3<br />将这3组数依序合并后得到4878290543<br />如果截止至7月15日23:59:59活动结束时的抽奖人数为28999<br />以4878290543整除以28999，商为168222，余数：20765&nbsp;<br />得到余数加1， 20765+1=20766。<br />不足7位数，则20766+28999+……+28999=1006732<br />：【兑奖流程】：1、我们的客服人员会与中奖者电话联系，并核实百度账号和手机号码等，确认获奖信息和使用规则。<br />2、中奖用户在体验特权前1天内，请电话联系团团。（4000-998-998）<br />3、若因信息错误或无效等造成的开奖后15个工作日内无法联系到中奖者，视为中奖者自动放弃该奖品，中奖号码+1顺延下一位。','','','','','18','Y','Y','uploads/201309/523a32e18f2c4.jpg','uploads/201309/thumb_523a32e18f2c4.jpg','0','0','N','1401871656','0','Y','0','Y','1379545825');
INSERT INTO `yii_post` VALUES('14','1','App Annie获1500万美元投资 将持续扩展国际业务','','','','','2','1','（朱旭冬）9月18日晚间消息，移动智能市场数据平台App Annie 今日宣布完成一轮总金额为1500万美元的融资，由红杉资本的美国基金领投，现有投资者IDG资本、Greycroft 、e.Ventures 和 Infinity Venture 参与跟投。

INSERT INTO `yii_post` VALUES('15','1','Groupon收购本地体验初创公司SideTour','','','','','2','1','','','','','','<p>	据国外媒体报道，团购巨人Groupon今日宣布，公司已经收购了本地体验初创公司SideTour。后者是一个帮助人们发现、预订和参加本地活动的市场平台，Groupon没有透露这项收购交易的具体条款。</p><p>	SideTour精选了一些独具特色且有人主持的聚会类活动，让客户们能够与相应领域的资深专家面对面地交流，从而更加了解自己所在的城市和他们关心的事。</p><p>	GrouponLive业务总经理格雷格鲁丁（Greg Rudin）称：“SideTour精心策划的各种本地体验将进一步拓展Groupon的愿景，也就是将Groupon打造成消费者可以随时随地访问的平台。如果Groupon能够提供这些极具个性化的活动、旅游和值得铭记的聚会，我们就能够为我们的客户提供更多有趣的方法，帮助他们探索和发现最好的本地体验。”</p><p>	那些活动大多为私人聚会，人数平均在12人左右，涵盖的行业包括视频、饮料、建筑、历史、艺术等等。SideTour目前提供的公开和私人聚会多达500多种，使用这个平台的聚会主持超过了400人。那些主持者包括厨师、艺术家、奥运金牌获得者、星探和品酒师等等。</p><p>	SideTour的首席执行官韦平戈亚尔（Vipin Goyal）称：“我们很高兴有机会把我们独创的聚会服务提供给这么多热衷于本地体验的人。Groupon可以帮助我们发现更多的本地专家并为他们提供一个与更多客户沟通的平台。”</p><p>	SideTour将继续独立经营一段时间，Groupon将通过其电子邮件、网页和移动渠道向它的4300万活跃用户推广SideTour的聚会服务。</p><p>	SideTour创立于2011年，目前在芝加哥、纽约、费城和华盛顿特区设有办事机构。它计划在未来几个月里开辟更多的市场。</p>','','','','','8','Y','Y','uploads/201309/523a54c220262.jpg','uploads/201309/thumb_523a54c220262.jpg','0','0','N','1401871231','0','Y','0','Y','1379554498');
INSERT INTO `yii_post` VALUES('16','1','美国下令FCC修改规定 禁止运营商锁定所售手机','','a:3:{s:4:\"bold\";s:1:\"Y\";s:9:\"underline\";s:1:\"Y\";s:5:\"color\";s:6:\"FF2969\";}','','','2','1','在手机解锁上，美国消费者和运营商展开持久战，美国政府和白宫逐渐站在消费者一边。


	近日美国电信和信息管理局（NTIA）正式向联邦通信委员会（FCC）发函，要求修改规定，未来移动运营商销售给用户的手机、平板...','a:2:{i:0;a:4:{s:6:\"fileId\";s:2:\"36\";s:4:\"file\";s:37:\"uploads/images/201405/21e1adee63a.png\";s:4:\"desc\";s:2:\"04\";s:3:\"url\";s:5:\"04url\";}i:1;a:4:{s:6:\"fileId\";s:2:\"37\";s:4:\"file\";s:37:\"uploads/images/201405/f23850e09dc.png\";s:4:\"desc\";s:2:\"05\";s:3:\"url\";s:5:\"05url\";}}','','','','<p>	在手机解锁上，美国消费者和运营商展开持久战，美国政府和白宫逐渐站在消费者一边。</p><p>	近日美国电信和信息管理局（NTIA）正式向联邦通信委员会（FCC）发函，要求修改规定，未来移动运营商销售给用户的手机、平板等，均不能锁定于网络。</p><p>	所谓“锁定”，指的是运营商通过技术手段，限制某一部手机和平板，只能使用自家的移动网络进行通信。</p><p>	上述机构对FCC表示，消费者应该获得更多自由，选择不同的移动通信服务商，自由使用自己合法购买的移动设备，对相关规定进行修改之后，可以增强移动通信市场的竞争，增加消费者满意度。</p><p>	目前还不清楚FCC是否会痛快答应修改规定的要求。众所周知的是，美国电信行业，也雇请了游说团体，捍卫对手机锁定的做法。</p><p>	据报道，1990年代以前，美国电信运营商销售的手机，均未锁定于自家网络。此后，为了降低用户流失率，运营商开始锁定手机。不过，对于熟悉IT知识的民间高手来说，根据网络资源对手机进行解锁，难度并不大。</p><p>	1998年，美国通过《千年数字版权法》，法律本意是要抑制盗版，但最后却禁止了用户对手机解锁。从2006年以来，支持消费者的美国议员们，也屡屡要求修改法律，允许用户自由解锁。</p><p>	在移动运营商看来，他们对用户购买手机的价格进行了大额补贴，目的是通过用户在一年或两年的合同期限内，用花费流量费的消费，弥补运营商购机补贴。如果让用户自由解锁，将损害运营商的利益。</p><p>	以苹果手机为例，运营商捆绑两年合约的补贴价格为199美元，但是其裸机零售价超过600美元，这400多美元其实由运营商买单。</p><p>	上述机构NTIA还指出，只要是消费者承诺继续使用某种服务，或是针对提前结束合约支付了违约罚金等，美国的运营商就应该免费帮助用户进行解锁。</p>','','','','美国,禁止运营商,锁定手机','89','Y','Y','uploads/201309/523a54f7d9591.jpg','uploads/201309/thumb_523a54f7d9591.jpg','1','2','Y','1401936478','4','N','5','Y','1379554552');
INSERT INTO `yii_post` VALUES('22','1','图盟 每日囧图05.24','','','','','9','0','','a:2:{i:0;a:4:{s:6:\"fileId\";s:2:\"63\";s:4:\"file\";s:37:\"uploads/images/201406/d6bf42140c0.jpg\";s:4:\"desc\";N;s:3:\"url\";N;}i:1;a:4:{s:6:\"fileId\";s:2:\"64\";s:4:\"file\";s:37:\"uploads/images/201406/4ca469fcfbf.jpg\";s:4:\"desc\";N;s:3:\"url\";N;}}','','','','','猫扑','http://dzh.mop.com/ttq/20140523/0/zF7lFlI2d0ef25F7.shtml','','','12','N','N','uploads/images/201406/badc32cd99a.gif','uploads/thumbs/201406/small_badc32cd99a.gif','0','0','N','1401864736','0','Y','0','Y','1401864736');
INSERT INTO `yii_post` VALUES('23','1','Facebook POP，迈向大师操作之路','','','','','3','0','Facebook发布Paper后，不满足于将其作为一个概念性产品，反而更进一步开源了其背后的动画引擎POP。POP的开发者是Kimon Tsinteris，曾致力于创造出逼真的、充满物力效应的体验。POP也是在这个理念下催生出来的结果。 ','','','','','<p>
	Facebook发布Paper之后，似乎还不满足于只是将其作为一个概念性产品，反而更进一步开源了其背后的动画引擎
POP（https://github.com/facebook/pop），此举大有三年前发布的iOS&nbsp;UI框架Three20（https:
//github.com/facebookarchive/three20）的意味。而POP开源后不负Facebook的厚望，在GitHub上不足
一个月的时间，就已拥有了6000多个Star，非常火爆。
</p>
<p>
	POP背后的开发者是Kimon&nbsp;Tsinteris，他是
Push&nbsp;Pop&nbsp;Press的联合创始人，曾在苹果担任高级工程师，并参与了iPhone和iPad上的软件研发（iPhone的指南针及地图）。
2011年，Facebook收购了他的公司，此后他便加入了Facebook负责Facebook&nbsp;iOS版本的开发。
</p>
<p>
	如果你打开
Push&nbsp;Pop&nbsp;Press开发的《AI&nbsp;Gore》这款App，就会发现它的交互和动画与Paper几乎如出一辙，原因就在于，它们都是由
Kimon&nbsp;Tsinteris开发的。由于不满足于苹果自身动画框架的单调，Push&nbsp;Pop&nbsp;Press致力于创造一个逼真的、充满物理效应的体验。
POP就是在这个理念下催生出来的新一代成果。
</p>
<p>
	POP使用Objective-C++编写。Objective-C++是对C++的扩展，
就像Objective-C是C的扩展一样。而至于为什么他们用Objective-C++而不是纯粹的Objective-C，原因在于他们更喜欢
Objective-C++的语法特性所提供的便利。
</p>
<p>
	<b>POP的架构</b> 
</p>
<p>
	POP目前由四个部分组成（如图1所示），即Animations、Engine、Utility、WebCore。
</p>
<p style=\"text-align:center;\">
	<a href=\"http://cms.csdnimg.cn/article/201406/04/538edd54d9240.jpg\" target=\"_blank\"><img src=\"http://cms.csdnimg.cn/article/201406/04/538edd54d9240.jpg\" border=\"0\" /></a> 
</p>
<p style=\"text-align:center;\">
	图1 &nbsp;POP架构图
</p>
<p>
	POP动画极为流畅，其秘密就在于这个引擎中的POPAnimator。POP通过CADisplayLink让动画实现了60&nbsp;FPS的流畅效果，打造了一个游戏级的动画引擎。
</p>
<p>
	CADisplayLink
是类似NSTimer的定时器，不同之处在于，NSTimer用于我们定义任务的执行周期及资料的更新周期，它的执行受CPU的阻塞所影响。而
CADisplayLink则用于定义画面的重绘和动画的演变，它的执行是基于Frames的间隔。通过CADisplayLink，苹果允许开发者将
App的重绘速度设定到与屏幕刷新频率一致。因此开发者可以获得非常流畅的交互动画，这项技术的应用在游戏中非常常见，著名的Cocos-2d引擎也用到
了这个重要的技术。
</p>
<p>
	WebCore里包含了一些从苹果的开源的网页渲染引擎里拿到的源文件
（http://opensource.apple.com/source/WebCore），它与Utility里的组件一并为POP的各项复杂计算提
供了基本支持。因此，通过Engine、Utility、WebCore三个基石，打造了Animations。
</p>
<p>
	POPAnimation
有着与CALayer非常相似的API。如果你知道CALayer的动画API，那么你对下面的接口一定非常熟悉。说到这里，想必你一定开始迫不及待地想
试试POP了（因篇幅所限，下面的代码并不是完整代码，你可以到https://github.com/kevinzhow/pop-handapp获取
示例App）。
</p>
<p>
	<b>基本类型</b> 
</p>
<p>
	<b>·</b> Spring&nbsp;Animation
</p>
<p style=\"text-align:center;\">
	<a href=\"http://cms.csdnimg.cn/article/201406/04/538edd87c1b25.jpg\" target=\"_blank\"><img src=\"http://cms.csdnimg.cn/article/201406/04/538edd87c1b25.jpg\" border=\"0\" /></a> 
</p>
<p style=\"text-align:center;\">
	图2 &nbsp; 默认的两种动画模式以及他们的动画节奏
</p>
<p>
	POP默认提供了两个非常特别的动画模式，第一个就是Spring&nbsp;Animation（如图2所示），另一个是Decay&nbsp;Animation。让我们先来看看Spring&nbsp;Animation，控制其动画效果的主要参数包括：
</p>
<p>
	<span>&nbsp; &nbsp;&nbsp;<b>·</b>&nbsp;Bounciness反弹，影响动画作用的参数的变化幅度；</span> 
</p>
<p>
	&nbsp; &nbsp;&nbsp;<b>·</b>&nbsp;Speed速度；
</p>
<p>
	&nbsp; &nbsp;&nbsp;<b>·</b>&nbsp;Tension拉力，影响回弹力度及速度；
</p>
<p>
	&nbsp; &nbsp;&nbsp;<b>·</b>&nbsp;Friction摩擦力，开启后，动画会不断重复，并且幅度逐渐削弱，直到停止；
</p>
<p>
	&nbsp; &nbsp;&nbsp;<b>·</b>&nbsp;Mass质量，细微地影响动画的回弹力度和速度。
</p>
<p>
	实际上，Tension、Friction、Mass这三个参数的作用很微妙，需要在示例程序中仔细体会。使用&nbsp;Spring&nbsp;Animation的方式非常简单，如代码1所示。
</p>
<p style=\"text-align:center;\">
	<a href=\"http://cms.csdnimg.cn/article/201406/04/538eddc2a11c8.jpg\" target=\"_blank\"><img src=\"http://cms.csdnimg.cn/article/201406/04/538eddc2a11c8.jpg\" border=\"0\" /></a> 
</p>
<p style=\"text-align:center;\">
	代码1
</p>
<p>
	通过[POPSpringAnimation&nbsp;animationWithPropertyNamed:kPOPLayerScaleXY]我们创建了一个在二维平面上分别沿着X轴和Y轴进行缩放的动画。
</p>
<p>
	下面我们介绍三个重要的参数。
</p>
<p>
	<b>&nbsp; &nbsp; ·</b>&nbsp;fromValue将告诉POP物体被动画操作的属性从什么数值开始运行。如果不提供fromValue，那么POP将默认使用当前数值。在这个例子中，就默认使用当前的比例。
</p>
<p>
	<b>&nbsp; &nbsp; ·</b>&nbsp;toValue是我们希望动画结束后，物体被动画操作的属性停留在什么值上，在这个例子中，toValue告诉了POP，我们希望沿着X轴和Y轴各缩放几倍。
</p>
<p>
	<b>&nbsp; &nbsp; ·</b>&nbsp;completionBlock提供了一个Callback，动画的执行过程会不断调用这个block，finished这个布尔变量可以用来做动画完成与否的判断。
</p>
<p>
	值得一提的是，这里toValue和fromValue的值应该和动画所作用的属性是一样的数据结构。例如，如果我们的操作对象是bounds，那么这里的toValue则应该是[NSValue&nbsp;valueWithCGRect:]&nbsp;。
</p>
<p>
	最后，我们使用pop_addAnimation来让动画开始生效，如果想删除动画的话，那么需要调用pop_removeAllAnimations。
</p>
<p>
	与iOS自带的动画不同，如果你在动画的执行过程中删除了物体的动画，那么物体会停在动画状态的最后一个瞬间，而不是闪回开始前的状态。
</p>
<p>
	<b>·</b>&nbsp;Decay&nbsp;Animation
</p>
<p>
	Decay&nbsp;Animation
可以实现衰减的动画效果。这个动画有一个重要的参数即velocity（速率），这个参数一般并不用于物体的自发动画，而是与用户的交互共生。这和
iOS&nbsp;7引入的UIDynamic非常相似，如果你想实现一些物理效果，Decay&nbsp;Animation也是不错的选择。
</p>
<p>
	Decay的动画没有toValue只有fromValue，以fromValue作为原始值，按照velocity来做衰减操作。如果我们想做一个刹车效果，则可以像代码2这样操作：
</p>
<p style=\"text-align:center;\">
	<a href=\"http://cms.csdnimg.cn/article/201406/04/538eddf5e19dd.jpg\" target=\"_blank\"><img src=\"http://cms.csdnimg.cn/article/201406/04/538eddf5e19dd.jpg\" border=\"0\" /></a> 
</p>
<p style=\"text-align:center;\">
	代码2
</p>
<p>
	这
个动画会使得物体从X坐标的25.0开始做100点/秒的减速运动。如果velocity里的数字是负值，那么你的动画就会反方向执行动画效果。这里非常
值得一提的是，velocity也是必须和你操作的属性有相同的数据结构，如果你操作的是bounds，想实现一个水滴滴到桌面的扩散效果，那么
velocity则应该是[NSValue&nbsp;valueWithRect:CGRectMake(0,&nbsp;0,&nbsp;20,&nbsp;20)]。
</p>
<p>
	deceleration（负加速度）是一个很少用到的值，它影响动画被重力影响的效果。默认值就是我们地球的重力加速度0.998。如果你程序里的动画开发给火星人看，那么使用0.376这个值会更合适。
</p>
<p>
	<b>·</b>&nbsp;Property&nbsp;Animation和Basic&nbsp;Animation
</p>
<p>
	POP
号称可以对物体的任何属性进行动画，其背后就是这个Property&nbsp;Animation驱动。Spring&nbsp;Animation和
Decay&nbsp;Animation都是继承自这个类，接下来我们通过一个Counting&nbsp;Label的例子来演示Property&nbsp;Animation的
神奇能力。在这个动画中，我们也使用了Basic&nbsp;Animation，动画模式是经典的ease-in-out，不使用
Spring&nbsp;Animation是因为我们并不需要计数器的数值进行回弹，如代码3所示。
</p>
<p style=\"text-align:center;\">
	<a href=\"http://cms.csdnimg.cn/article/201406/04/538ede19813c2.jpg\" target=\"_blank\"><img src=\"http://cms.csdnimg.cn/article/201406/04/538ede19813c2.jpg\" border=\"0\" /></a> 
</p>
<p style=\"text-align:center;\">
	代码3
</p>
<p>
	通过POPBasicAnimation的timingFunction我们定义了动画的展现方式——渐入渐出。随后通过POPAnimatableProperty来定义POP如何操作Label上的数值。
</p>
<p>
	这
里我们需要注意两个函数，readBlock和writeBlock。readBlock定义了动画如何获取要操作的属性数值，writeBlock定义
了动画如何修改要操作的属性数值。在这两个函数中，obj就是我们的Label，values是动画所操作的属性数组，其值必须是CGFloat。
</p>
<p>
	你
可能会问，什么是动画所操作的属性数组？回顾之前我们在Decay&nbsp;Animation中操作的bounds内容，可以看出values[0]、
values[1]、values[2]、values[3]分别对应了CGRectMake（0,&nbsp;0,&nbsp;20.0,&nbsp;20.0）的0、0、20.0、
20.0。这里我们需要操作Label上显示的文字，所以只需要一个values[0]属性即可。
</p>
<p>
	通过values[0]=
[[obj&nbsp;description]&nbsp;floatValue]我们告诉POP如何获取这个值。相应地，我们通过[obj&nbsp;setText:
[NSString&nbsp;stringWithFormat:@\"%.2f\",values[0]]]，告诉POP如何改变Label的属性。
</p>
<p>
	threshold定义了动画的变化阀值，如果这里使用1，那么我们就不会看到动画执行时小数点后面的数字变化。
</p>
<p>
	到这里，我们的Counting&nbsp;Label就完成了，是不是超简单？
</p>
<p>
	<b>实战</b> 
</p>
<p>
	<b>·</b>&nbsp;PopUp和Decay&nbsp;Move
</p>
<p>
	这个实例中，我将介绍一下如何将Decay动画和用户的手势操作结合起来，实现一个推冰壶的效果。手势的处理方式如代码4所示。
</p>
<p style=\"text-align:center;\">
	<a href=\"http://cms.csdnimg.cn/article/201406/04/538ede3db962b.jpg\" target=\"_blank\"><img src=\"http://cms.csdnimg.cn/article/201406/04/538ede3db962b.jpg\" border=\"0\" /></a> 
</p>
<p style=\"text-align:center;\">
	代码4
</p>
<p>
	当
用户触摸这个冰壶时，所有动画会立刻停止，然后冰壶会跟随用户的手指移动。在用户松开冰壶时，通过
[pan&nbsp;velocityInView:self.view]我们获取了用户手指移动的速率，在
addDecayPositionAnimationWithVelocity中生成动画，如代码5所示。
</p>
<p style=\"text-align:center;\">
	<a href=\"http://cms.csdnimg.cn/article/201406/04/538ede58dd45e.jpg\" target=\"_blank\"><img src=\"http://cms.csdnimg.cn/article/201406/04/538ede58dd45e.jpg\" border=\"0\" /></a> 
</p>
<p style=\"text-align:center;\">
	代码5
</p>
<p>
	动画生效后，冰壶就会在低摩擦的状态下前进并逐渐停止。如果想增大摩擦力，则可以将速率乘以摩擦系数。
</p>
<p>
	<b>·</b>&nbsp;Fly&nbsp;In
</p>
<p>
	在这个实例中，我将介绍一下如何将两个动画相结合，实现一个像Path中卡片飞入的效果。如代码6所示。
</p>
<p style=\"text-align:center;\">
	<a href=\"http://cms.csdnimg.cn/article/201406/04/538ede7de353c.jpg\" target=\"_blank\"><img src=\"http://cms.csdnimg.cn/article/201406/04/538ede7de353c.jpg\" border=\"0\" /></a> 
</p>
<p style=\"text-align:center;\">
	代码6
</p>
<p>
	第一个Spring&nbsp;Animation实现了卡片下落的效果，第二个Basic&nbsp;Animation实现了卡片的渐入效果，而最后的一个Basic&nbsp;Animation则实现了卡片倾斜的效果。
</p>
<p>
	这
里需要注意的是，我们使用了duration来定义Basic&nbsp;Animation的执行时间，并用beginTime来定义动画的开始时间。
beginTime接受的是一个以秒为单位的时间，所以我们使用了&nbsp;CACurrentMediaTime()来获取当前的时间，在此之上增加上了期望动
画延迟的时间。
</p>
<p>
	<b>·</b>&nbsp;Transform
</p>
<p>
	这个实例真的酷极了，我们将实现一个用户点击后播放按钮转换为进度条容器的变形效果。首先创建一个进度条，通过lineCap&nbsp;lineWidth调整进度条的样式，然后使用UIBezierPath来定义进度条的走向，如代码7所示。
</p>
<p style=\"text-align:center;\">
	<a href=\"http://cms.csdnimg.cn/article/201406/04/538edea238f76.jpg\" target=\"_blank\"><img src=\"http://cms.csdnimg.cn/article/201406/04/538edea238f76.jpg\" border=\"0\" /></a> 
</p>
<p style=\"text-align:center;\">
	代码7
</p>
<p>
	代码8就是实现变形的代码。从这段代码不难看出，scale和bounds的变化效果是一起进行的。这时，播放按钮将缩小，然后改变外形成为进度条的容器。在变形结束后，将触发进度条的动画。
</p>
<p style=\"text-align:center;\">
	<a href=\"http://cms.csdnimg.cn/article/201406/04/538edebc1ae26.jpg\" target=\"_blank\"><img src=\"http://cms.csdnimg.cn/article/201406/04/538edebc1ae26.jpg\" border=\"0\" /></a> 
</p>
<p style=\"text-align:center;\">
	代码8
</p>
<p>
	这里我们使用UIGraphicsBeginImageContext-WithOptions()去开启绘画上下文，动画结束后使用UIGraphicsEndImageContext()来清空绘画的上下文。这两个函数主要是影响画板的大小。
</p>','csdn','http://www.csdn.net/article/2014-06-04/2820077-Facebook-POP-Practice','','','7','N','N','uploads/images/201406/1053bfe806b.png','uploads/thumbs/201406/small_1053bfe806b.png','0','0','N','1401956502','0','Y','0','Y','1401955341');

DROP TABLE IF EXISTS `yii_post_comment`;
CREATE TABLE `yii_post_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标题id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `nickname` varchar(60) NOT NULL DEFAULT 'guest' COMMENT '用户名',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `content` text NOT NULL COMMENT '评论内容',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `status_answer` enum('Y','N') NOT NULL DEFAULT 'N',
  `answer_content` text COMMENT '回复内容',
  `client_ip` char(5) NOT NULL DEFAULT '127' COMMENT '评论ip',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='新闻评论';


DROP TABLE IF EXISTS `yii_post_tags`;
CREATE TABLE `yii_post_tags` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(100) NOT NULL COMMENT 'tag名称',
  `data_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数据总数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='新闻标签';

INSERT INTO `yii_post_tags` VALUES('1','贵族养生','1','1379546108');
INSERT INTO `yii_post_tags` VALUES('2','休闲放松','1','1379546108');
INSERT INTO `yii_post_tags` VALUES('3','麦乐迪','1','1379546248');
INSERT INTO `yii_post_tags` VALUES('4','KTV','1','1379546248');
INSERT INTO `yii_post_tags` VALUES('5','iOS7','1','1379546869');
INSERT INTO `yii_post_tags` VALUES('6','普通用户','1','1379546869');
INSERT INTO `yii_post_tags` VALUES('7','全新图标设计','1','1379546869');
INSERT INTO `yii_post_tags` VALUES('8','甲骨文','1','1379547034');
INSERT INTO `yii_post_tags` VALUES('9','净利润','1','1379547034');
INSERT INTO `yii_post_tags` VALUES('10','谷歌','1','1379554258');
INSERT INTO `yii_post_tags` VALUES('11','追踪工具','1','1379554258');
INSERT INTO `yii_post_tags` VALUES('12','AdID','1','1379554258');
INSERT INTO `yii_post_tags` VALUES('13','洗牌','1','1379554258');
INSERT INTO `yii_post_tags` VALUES('14','微软','1','1379554317');
INSERT INTO `yii_post_tags` VALUES('15','Windows8.1','1','1379554317');
INSERT INTO `yii_post_tags` VALUES('16','基本版售价','1','1379554317');
INSERT INTO `yii_post_tags` VALUES('17','三星','1','1379554397');
INSERT INTO `yii_post_tags` VALUES('18','智能手表','1','1379554397');
INSERT INTO `yii_post_tags` VALUES('19','二代产品','1','1379554397');
INSERT INTO `yii_post_tags` VALUES('20','App','1','1379554460');
INSERT INTO `yii_post_tags` VALUES('21','Annie','1','1379554460');
INSERT INTO `yii_post_tags` VALUES('22','美元投资','1','1379554460');
INSERT INTO `yii_post_tags` VALUES('23','国际业务','1','1379554460');
INSERT INTO `yii_post_tags` VALUES('24','美国','1','1379554552');
INSERT INTO `yii_post_tags` VALUES('25','禁止运营商','1','1379554552');
INSERT INTO `yii_post_tags` VALUES('26','锁定手机','1','1379554552');
INSERT INTO `yii_post_tags` VALUES('27','Facebook','5','1379554636');
INSERT INTO `yii_post_tags` VALUES('28','高管','1','1379554636');
INSERT INTO `yii_post_tags` VALUES('29','离职','1','1379554636');
INSERT INTO `yii_post_tags` VALUES('30','投奔','1','1379554636');
INSERT INTO `yii_post_tags` VALUES('31','阿里巴巴','5','1379554636');
INSERT INTO `yii_post_tags` VALUES('32','诺基亚','1','1379554696');
INSERT INTO `yii_post_tags` VALUES('33','宣布','1','1379554696');
INSERT INTO `yii_post_tags` VALUES('34','Lumia1520','1','1379554696');
INSERT INTO `yii_post_tags` VALUES('35','yii','4','1395211247');
INSERT INTO `yii_post_tags` VALUES('36','新品','1','1395212757');

DROP TABLE IF EXISTS `yii_question`;
CREATE TABLE `yii_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户',
  `scope` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '所属分类',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱',
  `telephone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `question` text NOT NULL COMMENT '内容',
  `contact_other` varchar(100) NOT NULL DEFAULT '' COMMENT '其它联系方式',
  `answer_status` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '回复状态',
  `answer_content` text COMMENT '回复内容',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='客服';

INSERT INTO `yii_question` VALUES('1','0','0','','zjh','326196998@qq.com','','yiiCms是一款基于php5+mysql5开发的多功能开源的网站内容管理系统。使用高性能的PHP5的web应用程序开发框架YII构建，具有操作简单、稳定、安全、高效、跨平台等特点。采用MVC设计模式，模板定制方便灵活，内置小挂工具，方便制作各类功能和效果，yiicms可用于企业建站、个人博客、资讯门户、图片站等各类型站点。','','N','如果您需要购买商业程序、项目外包订制、交流合作的，欢迎使用以下方式和我们联系','Y','1379546643');

DROP TABLE IF EXISTS `yii_recommend_position`;
CREATE TABLE `yii_recommend_position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐位id',
  `recommend_name` varchar(100) DEFAULT NULL COMMENT '推荐位名称',
  `type` enum('article','image','soft','video','goods') NOT NULL DEFAULT 'article' COMMENT '栏目类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='推荐位表';

INSERT INTO `yii_recommend_position` VALUES('1','首页文章推荐','article');
INSERT INTO `yii_recommend_position` VALUES('3','图集推荐','image');
INSERT INTO `yii_recommend_position` VALUES('4','图集推荐二','image');

DROP TABLE IF EXISTS `yii_recommend_post`;
CREATE TABLE `yii_recommend_post` (
  `id` int(10) unsigned NOT NULL COMMENT '推荐位id',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推荐内容id',
  `sort_order` int(10) unsigned DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`,`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推荐内容表';

INSERT INTO `yii_recommend_post` VALUES('1','15','255');
INSERT INTO `yii_recommend_post` VALUES('1','16','255');

DROP TABLE IF EXISTS `yii_session`;
CREATE TABLE `yii_session` (
  `id` char(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='session表';

INSERT INTO `yii_session` VALUES('vkngif76usicpa55u6a36cpji1','1401961574','admin__returnUrl|s:10:\"/admin.htm\";Yii.CCaptchaAction.33c9b0a4.admin/default.captcha|s:4:\"jagd\";Yii.CCaptchaAction.33c9b0a4.admin/default.captchacount|i:4;admin__id|s:1:\"1\";admin__name|s:9:\"zjh_admin\";adminstatus|s:1:\"1\";admingroupid|s:2:\"10\";admingroupname|s:15:\"系统管理员\";adminemail|s:14:\"xb_zjh@126.com\";admin__states|a:4:{s:6:\"status\";b:1;s:7:\"groupid\";b:1;s:9:\"groupname\";b:1;s:5:\"email\";b:1;}6cb602a7c53e8febaeafaaea1085c566__id|s:2:\"31\";6cb602a7c53e8febaeafaaea1085c566__name|s:8:\"testUser\";6cb602a7c53e8febaeafaaea1085c566status|s:1:\"1\";6cb602a7c53e8febaeafaaea1085c566groupid|s:1:\"1\";6cb602a7c53e8febaeafaaea1085c566groupname|s:12:\"普通用户\";6cb602a7c53e8febaeafaaea1085c566email|s:17:\"1441044277@qq.com\";6cb602a7c53e8febaeafaaea1085c566__states|a:4:{s:6:\"status\";b:1;s:7:\"groupid\";b:1;s:9:\"groupname\";b:1;s:5:\"email\";b:1;}');

DROP TABLE IF EXISTS `yii_setting`;
CREATE TABLE `yii_setting` (
  `scope` varchar(30) NOT NULL DEFAULT '' COMMENT '范围',
  `variable` varchar(50) NOT NULL COMMENT '变量',
  `value` text COMMENT '值',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统配置';

INSERT INTO `yii_setting` VALUES('base','site_name','我的yii网站','');
INSERT INTO `yii_setting` VALUES('base','site_domain','http://www.yii.local','');
INSERT INTO `yii_setting` VALUES('base','admin_email','xb_zjh@126.com','');
INSERT INTO `yii_setting` VALUES('base','site_icp','京','');
INSERT INTO `yii_setting` VALUES('base','site_closed_summary','系统维护中，请稍候......','');
INSERT INTO `yii_setting` VALUES('base','site_stats','第三方统计代码','');
INSERT INTO `yii_setting` VALUES('seo','seo_title','我的yii网站','');
INSERT INTO `yii_setting` VALUES('seo','seo_description','我的yii网站','');
INSERT INTO `yii_setting` VALUES('seo','seo_keywords','yii,php,html,web','');
INSERT INTO `yii_setting` VALUES('base','admin_telephone','18606712910','');
INSERT INTO `yii_setting` VALUES('base','site_status','open','');
INSERT INTO `yii_setting` VALUES('base','site_status_intro','网站正在维护，对您带来的不便我们深表歉意，请稍后再来访问...','');
INSERT INTO `yii_setting` VALUES('base','admin_logger','open','');
INSERT INTO `yii_setting` VALUES('base','user_status','open','');
INSERT INTO `yii_setting` VALUES('base','user_mail_verify','open','');
INSERT INTO `yii_setting` VALUES('base','site_copyright','Copyright @ 2014-2015','');
INSERT INTO `yii_setting` VALUES('upload','upload_water_size','100x100','');
INSERT INTO `yii_setting` VALUES('upload','upload_water_file','static/public/watermark.png','');
INSERT INTO `yii_setting` VALUES('upload','upload_water_status','open','');
INSERT INTO `yii_setting` VALUES('upload','upload_allow_ext','jpg,gif,bmp,jpeg,png,doc,zip,rar,7z,txt,sql,pdf','');
INSERT INTO `yii_setting` VALUES('upload','upload_max_size','20000','');
INSERT INTO `yii_setting` VALUES('upload','upload_water_scope','100x100','');
INSERT INTO `yii_setting` VALUES('upload','upload_water_position','5','');
INSERT INTO `yii_setting` VALUES('upload','upload_water_padding','5','');
INSERT INTO `yii_setting` VALUES('upload','upload_water_trans','30','');
INSERT INTO `yii_setting` VALUES('custom','_address','北京市朝阳区','');
INSERT INTO `yii_setting` VALUES('custom','_telephone','(+86 10) 5992 8888','');
INSERT INTO `yii_setting` VALUES('custom','_fax','传真:(+86 10) 5992 0000','');
INSERT INTO `yii_setting` VALUES('custom','_mobile','18600000000','');
INSERT INTO `yii_setting` VALUES('template','theme','classic','');
INSERT INTO `yii_setting` VALUES('template','template','default','');

DROP TABLE IF EXISTS `yii_soft`;
CREATE TABLE `yii_soft` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '' COMMENT '软件标题',
  `catalog_id` smallint(5) unsigned DEFAULT '0' COMMENT '分类id ',
  `cover_image` varchar(100) DEFAULT '' COMMENT '封面图片',
  `fileid` varchar(255) DEFAULT NULL COMMENT '文件id',
  `filetype` varchar(10) NOT NULL DEFAULT '' COMMENT '文件类型',
  `language` varchar(10) NOT NULL DEFAULT '' COMMENT '软件语言',
  `softtype` varchar(10) NOT NULL DEFAULT '' COMMENT '软件类型',
  `os` varchar(100) NOT NULL DEFAULT '' COMMENT '操作系统',
  `softrank` enum('5','4','3','2','1') NOT NULL DEFAULT '5' COMMENT '软件等级',
  `softsize` varchar(10) NOT NULL DEFAULT '' COMMENT '软件大小',
  `softlink` varchar(100) DEFAULT '' COMMENT '软件外部下载链接',
  `introduce` text COMMENT '软件简介',
  `pay` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '支付费用',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '最近更新时间',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '发布时间',
  `down_count` smallint(8) unsigned DEFAULT '0' COMMENT '下载次数',
  `status` enum('Y','N') DEFAULT 'Y' COMMENT '是否显示',
  `seo_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_description` text COMMENT 'SEO描述',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='软件管理表';

INSERT INTO `yii_soft` VALUES('3',' 腾讯QQ2013 SP6 官方正式版','11','','','','zh_cn','domestic','Win2003,WinXP,Win8','5','','','<span>QQ产品团队经过数月的奋战，全新感觉的QQ2013 Beta1版本终于打造完成，QQ2013拥有全新登录界面，登录速度更快捷；安全模块的升级让你的QQ更安全，群视频秀让群聊更有氛围。本站提供qq2013最新版官方下载,腾讯qq2013官方下载正式版。</span>','0.00','1400750629','1400549982','0','Y','','','');
INSERT INTO `yii_soft` VALUES('4','阿里旺旺 2014卖家版 V7.20.36T 正式版','11','uploads/images/201405/6a30a96a755.jpg','','','zh_cn','domestic','Win2003,WinXP,Win8','5','','','<p>	<br /></p><p>	【阿里旺旺 2014卖家版概括介绍】</p><p>	免费网商沟通软件。</p><p>	<br /></p><br />【阿里旺旺 2014卖家版基本介绍】<br /><p>	阿里旺旺，是阿里巴巴为商人度身定做的免费网上商务沟通软件。它能帮您轻松找客户，发布、管理商业信息；及时把握商机，随时洽谈做生意！</p><p>	<br /></p>&nbsp;&nbsp;&nbsp;<br />【阿里旺旺 2014卖家版软件特点】<br />1. 随时联系客户 <br />每一条信息都标记着您的在线状态 , 让商人随时联系您<br />2. 海量商机搜索 <br />不登录网站，快速搜索阿里巴巴大市场 600 万商机！ <br />3. 巧发','0.00','1400752129','1400550081','0','Y','','','');

DROP TABLE IF EXISTS `yii_special`;
CREATE TABLE `yii_special` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `title_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '标题别名',
  `intro` text COMMENT '描述',
  `content` text COMMENT '详细介绍',
  `attach_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '附件缩略图',
  `attach_file` varchar(255) NOT NULL DEFAULT '' COMMENT '附件名称',
  `seo_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo标题',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo关键字',
  `seo_description` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo描述',
  `template` varchar(50) NOT NULL DEFAULT '' COMMENT '模板',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击次数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '入库时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='专题';

INSERT INTO `yii_special` VALUES('1','专题二','special2','美国特斯拉电动汽车公司（Tesla Motors）首席执行官艾伦•马斯克（Elon Musk）周二表示，该公司力争在未来三年里推出能够“自动驾驶”的汽车，从而正式加入到拥有谷歌(微博)和多家汽车厂商的无人驾驶汽车市场的争夺之中','<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">	美国特斯拉电动汽车公司（Tesla Motors）首席执行官艾伦•马斯克（Elon Musk）周二表示，该公司力争在未来三年里推出能够“自动驾驶”的汽车，从而正式加入到拥有<a class=\"a-tips-Article-QQ\" href=\"http://stockhtm.finance.qq.com/astock/ggcx/GOOG.OQ.htm\" target=\"_blank\">谷歌</a>(<a href=\"http://t.qq.com/googlechina#pref=qqcom.keyword\" target=\"_blank\">微博</a>)和多家汽车厂商的无人驾驶汽车市场的争夺之中。</p><p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">	马斯克在接受英国《金融时报》的采访时表示，特斯拉自动驾驶汽车将会让司机把90%的驾驶权转交给汽车的电脑系统，而全自动无人驾驶汽车则需要更长的研发时间。</p><p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">	马斯克指出，特斯拉的自动驾驶汽车将由该公司采用自有技术进行内部研发，并不会外包给其他公司。这一点也得到了该公司一位新闻发言人的证实。</p><p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">	特斯拉官网近日发布了一个招聘“高级驾驶员辅助系统控制工程师”的启示，负责帮助“特斯拉成为自动驾驶汽车市场的领导者”。</p>','uploads/thumbs/201403/small_8e9e89a2e6a.png','uploads/images/201403/8e9e89a2e6a.png','','','','','Y','0','4','1379547110');
INSERT INTO `yii_special` VALUES('2','专题一','special1','','<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">	随着移动科技的不断发展，人们生活的方方面面都感受到了新科技所带来的巨大影响，餐饮领域自然也不例外。无论是在餐馆的餐桌上放置平板电脑、还是推出可互动的点菜、买单应用都是餐饮企业为进一步促进消费者来店消费所想出的妙招。其中，美国知名餐厅运营商Brinker International.Inc旗下Chili\'s Grill &amp; Bar最近做出的动作便是移动化大潮来袭下的一个最好示范。</p><p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">	<img src=\"/cms/uploads/201309/523a380d1d4c0.jpg\" alt=\"\" /> </p><p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">	目前，该公司已经在旗下部分餐厅中测试由Ziosk研发的桌面服务系统，该系统可以使消费者在无需服务员出现的情况完成点菜、买单等操作，甚至还可以利用该系统玩游戏。对此，Chili\'s Grill &amp; Bar品牌战略高级副总裁表示，“由于消费者更倾向于在配备了这类桌面系统的餐厅花费更多金钱，因此这一科技可以帮助公司有效提高销售额。”</p><p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">	事实上，由于桌面服务系统会时不时的显示一些甜品的图片，Chili\'s Grill &amp; Bar餐厅的甜品销量已经迎来了大约20%的提升。因此我们不难想象，如果Chili\'s Grill &amp; Bar未来将这一图片展示的范围扩大到酒精类饮品和其他拥有更大利润率的菜品时能够取得怎样的效果。</p><p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">	与此同时，桌面服务设备中自带的那些看似不起眼的小游戏也有望为餐厅带来额外收入。比如，Chili\'s Grill &amp; Bar会向每位需要使用游戏服务的消费者收取0.99美元的费用，其中Chili\'s Grill &amp; Bar将可以拿到50%的分成，而另一半则由Ziosk收取。考虑到Chili\'s Grill &amp; Bar目前仅仅是从Ziosk处以租赁的形式拿到这些设备的这一事实，这样的分成比例还算比较公平。</p>','uploads/thumbs/201403/small_9e6fac7a8c2.png','uploads/images/201403/9e6fac7a8c2.png','','','','','Y','0','24','1379547152');

DROP TABLE IF EXISTS `yii_upload`;
CREATE TABLE `yii_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户名',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '原始文件名称',
  `file_name` varchar(100) NOT NULL DEFAULT '' COMMENT '带路径文件名',
  `thumb_name` varbinary(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `file_ext` varchar(5) NOT NULL DEFAULT 'jpg' COMMENT '扩展名称',
  `file_mime` varchar(50) NOT NULL DEFAULT '' COMMENT '文件头信息',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `down_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='附件';

INSERT INTO `yii_upload` VALUES('20','1','5.png','uploads/images/201403/3b68894af12.png','','png','application/octet-stream','1724','0','1394775273');
INSERT INTO `yii_upload` VALUES('19','1','4.png','uploads/images/201403/7b1f180d893.png','','png','application/octet-stream','624','0','1394766396');
INSERT INTO `yii_upload` VALUES('18','1','3.png','uploads/images/201403/618ffae8688.png','','png','image/png','1158','0','1394765930');
INSERT INTO `yii_upload` VALUES('11','1','4.png','uploads/images/201403/3191fae4146.png','','png','application/octet-stream','624','0','1394518529');
INSERT INTO `yii_upload` VALUES('12','1','3.png','uploads/images/201403/99416091f65.png','','png','application/octet-stream','1158','0','1394518529');
INSERT INTO `yii_upload` VALUES('15','1','gallery_848120_420_420.jpg','uploads/images/201403/0630a657021.jpg','','jpg','application/octet-stream','27151','0','1394520368');
INSERT INTO `yii_upload` VALUES('21','1','4.png','uploads/images/201403/3db31e78ed6.png','','png','application/octet-stream','624','0','1394776929');
INSERT INTO `yii_upload` VALUES('22','1','5.png','uploads/images/201403/8d263a71832.png','','png','application/octet-stream','1724','0','1394777029');
INSERT INTO `yii_upload` VALUES('23','1','dui.png','uploads/images/201403/d31cf787453.png','','png','image/png','307','0','1394777079');
INSERT INTO `yii_upload` VALUES('24','1','5.png','uploads/images/201403/aa13e88c5b4.png','','png','application/octet-stream','1724','0','1394781140');
INSERT INTO `yii_upload` VALUES('25','1','2013052136594429.GIF','uploads/images/201403/502591bcd60.gif','','gif','application/octet-stream','136474','0','1394781772');
INSERT INTO `yii_upload` VALUES('26','1','1270881934.jpg','uploads/images/201403/45dc43ecaae.jpg','','jpg','application/octet-stream','88396','0','1394781772');
INSERT INTO `yii_upload` VALUES('27','1','6.png','uploads/attached/image/201403/85f1fd7ad55.png','','png','image/png','1665','0','1394781813');
INSERT INTO `yii_upload` VALUES('28','1','email_hui.gif','uploads/attached/image/201403/e54c3f369b1.gif','','gif','application/octet-stream','1694','0','1394781834');
INSERT INTO `yii_upload` VALUES('35','1','4.png','uploads/images/201405/e591eae944b.png','','png','application/octet-stream','624','0','1400139041');
INSERT INTO `yii_upload` VALUES('36','1','4.png','uploads/images/201405/21e1adee63a.png','','png','application/octet-stream','624','0','1400139407');
INSERT INTO `yii_upload` VALUES('37','1','5.png','uploads/images/201405/f23850e09dc.png','','png','application/octet-stream','1724','0','1400139621');
INSERT INTO `yii_upload` VALUES('41','1','4.png','uploads/images/201405/157922e4cf3.png','','png','application/octet-stream','624','0','1400141603');
INSERT INTO `yii_upload` VALUES('43','1','3.png','uploads/images/201405/c5fa21d533b.png','','png','application/octet-stream','1158','0','1400205224');
INSERT INTO `yii_upload` VALUES('44','1','5.png','uploads/images/201405/12d4aa28af4.png','','png','application/octet-stream','1724','0','1400205363');
INSERT INTO `yii_upload` VALUES('45','1','xiaomi_note.jpg','uploads/images/201405/6bf7dd586e7.jpg','','jpg','application/octet-stream','245509','0','1401092533');
INSERT INTO `yii_upload` VALUES('63','1','002.jpg','uploads/images/201406/d6bf42140c0.jpg','','jpg','application/octet-stream','24918','0','1401864670');
INSERT INTO `yii_upload` VALUES('64','1','003.jpg','uploads/images/201406/4ca469fcfbf.jpg','','jpg','application/octet-stream','21220','0','1401864674');

DROP TABLE IF EXISTS `yii_user`;
CREATE TABLE `yii_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `groupid` int(10) unsigned DEFAULT '0' COMMENT '用户组id',
  `status` tinyint(2) DEFAULT '1' COMMENT '-1待审核 0 -禁用  1-通过',
  `addtime` int(10) DEFAULT NULL COMMENT '注册时间',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `sign` varchar(100) DEFAULT NULL COMMENT '个性签名',
  `web` varchar(100) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `qq` varchar(11) DEFAULT NULL COMMENT 'qq号码',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '上次登录ip',
  `logins` int(10) unsigned DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 DELAY_KEY_WRITE=1 COMMENT='用户表';

INSERT INTO `yii_user` VALUES('1','zjh_admin','$2a$08$O9zKWgiL8YBa5Lzss2G5PO08tAj1HmI6R.2J3hLXPC9lPcLPPx5GS','xb_zjh@126.com','10','1','1379001600','','','','','NULL','','','0');
INSERT INTO `yii_user` VALUES('2','没那么简单','$2a$13$5HFLakgTxQyyfzcZFQElWOk5W.OHhPnfwKXLAYwokPNVsZSyW4Tqy','376685457@qq.com','9','1','1379091600','','','','','','','','0');
INSERT INTO `yii_user` VALUES('7','微博评论','$2a$13$TEpIe58TLJIUmLuoE7pYD.KK74cRlLXSaNoXf0bnxbcLFFmmW1E5u','xweibo_user85589@sina.com','1','1','1379101600','','','','','','','','0');
INSERT INTO `yii_user` VALUES('31','testUser','$2a$08$QuvI8Ory.KMdKvmaCV/g9O8AoVTQMMvDrS.wvkOnEWBIBJwm3kLsq','1441044277@qq.com','1','1','1399346040','uploads/avatar/201405/small_31_c696db73478.jpg','nicename','这个家伙很懒，什么都不写','http://www.baidu.com','','','127.0.0.1','6');
INSERT INTO `yii_user` VALUES('32','test123','$2a$08$IrFpdJZKlMTUoiLS/D79kOiFfy9MInvsRQuoNc5hiCSL9qSISQxIm','test123@qq.com','1','1','1399346280','','','','','','','','0');
INSERT INTO `yii_user` VALUES('33','test001','$2a$08$mmxLn6zpboN/Q2BnDfk4MesW4qbcIRD0ONmiuJ/gwv1X1kuinCTge','326196998@qq.com','1','1','1400462626','uploads/avatar/201405/small_33_0681827b824.png','','','','','','127.0.0.1','3');

DROP TABLE IF EXISTS `yii_user_group`;
CREATE TABLE `yii_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(30) DEFAULT '' COMMENT '用户组名称',
  `acl` varchar(255) DEFAULT '' COMMENT '权限控制',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户组';

INSERT INTO `yii_user_group` VALUES('1','普通用户','');
INSERT INTO `yii_user_group` VALUES('2','VIP①用户','');
INSERT INTO `yii_user_group` VALUES('3','VIP②用户','');
INSERT INTO `yii_user_group` VALUES('4','VIP④用户','');
INSERT INTO `yii_user_group` VALUES('5','VIP⑤用户','');
INSERT INTO `yii_user_group` VALUES('6','VIP⑥用户','');
INSERT INTO `yii_user_group` VALUES('7','VIP⑦用户','');
INSERT INTO `yii_user_group` VALUES('8','VIP⑧用户','');
INSERT INTO `yii_user_group` VALUES('9','网站编辑','default|login,catalog|index,catalog|create,all,link|index,link|create,link|update,link|delete,link|batch');
INSERT INTO `yii_user_group` VALUES('10','系统管理员','Administrator');

DROP TABLE IF EXISTS `yii_video`;
CREATE TABLE `yii_video` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '视频名称',
  `catalog_id` smallint(5) unsigned DEFAULT '0' COMMENT '分类id ',
  `cover_image` varchar(100) DEFAULT '' COMMENT '封面图片',
  `fileid` varchar(255) DEFAULT NULL COMMENT '文件id',
  `language` varchar(10) NOT NULL DEFAULT '' COMMENT '视频语言',
  `video_type` varchar(10) NOT NULL DEFAULT '' COMMENT '视频类型',
  `video_score` decimal(3,1) unsigned NOT NULL DEFAULT '0.0' COMMENT '视频评分',
  `video_size` varchar(10) NOT NULL DEFAULT '' COMMENT '视频大小',
  `download` varchar(100) DEFAULT '' COMMENT '下载链接',
  `introduce` text COMMENT '软件简介',
  `pay` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '支付费用',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '最近更新时间',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '发布时间',
  `down_count` smallint(8) unsigned DEFAULT '0' COMMENT '下载次数',
  `status` enum('Y','N') DEFAULT 'Y' COMMENT '是否显示',
  `seo_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_description` text COMMENT 'SEO描述',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='软件管理表';

INSERT INTO `yii_video` VALUES('1','美国队长','12','','','englise','science','8.8','','','美国队长','0.00','1401068449','1400834656','0','Y','','','');
