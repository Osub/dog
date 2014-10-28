#auth模块规则数据表
DROP TABLE IF EXISTS dog_auth_rule;
CREATE TABLE dog_auth_rule (
	`id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT  comment '规则id【最大值是16777215】',
	`name` char(80) NOT NULL DEFAULT '' comment '规则唯一标识',
	`title` char(20) NOT NULL DEFAULT '' comment '规则标题',
	`type` tinyint(1) NOT NULL DEFAULT '1' comment '如果type为1， condition字段就可以定义规则表达式',
	`status` tinyint(1) NOT NULL DEFAULT '1' comment '状态1正常，0禁用',
	`condition` char(100) NOT NULL DEFAULT '' comment '规则附件条件,满足附加条件的规则,才认为是有效的规则',
	PRIMARY KEY (id),
	UNIQUE KEY name (name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
#auth模块用户组数据表
DROP TABLE IF EXISTS dog_auth_group;
CREATE TABLE dog_auth_group (
	`id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
	`title` char(100) NOT NULL DEFAULT '' comment '用户组名称',
	`status` tinyint(1) NOT NULL DEFAULT '1' comment '用户组状态，1正常，0禁用',
	`rules` char(80) NOT NULL DEFAULT '' comment '用户组拥有的规则id集合',
	PRIMARY KEY (id)
)ENGINE=MyISAM DEFAULT CHARSET=utf8;
#auth模块用户组明细数据表
DROP TABLE IF EXISTS dog_auth_user;
CREATE TABLE dog_auth_user (
	`uid` mediumint(8) unsigned NOT NULL,
	`group_id` mediumint(8) unsigned NOT NULL,
	UNIQUE KEY uid_group_id (uid,group_id),
	KEY uid (uid), 
	KEY group_id (group_id)
 ) ENGINE=MyISAM DEFAULT CHARSET=utf8;



