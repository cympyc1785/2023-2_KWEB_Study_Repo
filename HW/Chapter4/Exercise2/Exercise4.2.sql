CREATE TABLE `users`(
	`id`                    INT NOT NULL AUTO_INCREMENT,
	`user_id`               INT NOT NULL,
	`pw`                    VARCHAR(20) NOT NULL,
	`nickname`              VARCHAR(20) NOT NULL,
	`profile_img_link`      TEXT NOT NULL,
	`profile_state_message` TEXT NOT NULL,
	`is_quit`               TINYINT DEFAULT 0,
	`register_date`         INT NOT NULL,
	PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels`(
	`id`                    INT NOT NULL AUTO_INCREMENT,
	`channel_name`          VARCHAR(20) NOT NULL,
	`channel_establisher`   INT NOT NULL,
	`channel_link`          TEXT NOT NULL,
	`max_subscriber`        INT NOT NULL,
	`is_quit`               TINYINT DEFAULT 0,
	`establish_date`        INT NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`channel_establisher`) REFERENCES `users`(`id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats`(
	`id`            INT NOT NULL AUTO_INCREMENT,
	`content`       TEXT NOT NULL,
	`writer`        INT NOT NULL,
	`channel`       INT NOT NULL,
	`write_date`    INT NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`writer`) REFERENCES `users`(`id`) ON DELETE CASCADE,
	FOREIGN KEY (`channel`) REFERENCES `channels`(`id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks`(
	`id`            INT NOT NULL AUTO_INCREMENT,
	`blocker`       INT NOT NULL,
	`blockee`       INT NOT NULL,
	`block_date`    INT NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`blocker`) REFERENCES `users`(`id`) ON DELETE CASCADE,
	FOREIGN KEY (`blockee`) REFERENCES `users`(`id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows`(
	`id`            INT NOT NULL AUTO_INCREMENT,
	`follower`      INT NOT NULL,
	`followee`      INT NOT NULL,
	`follow_date`   INT NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE,
	FOREIGN KEY (`followee`) REFERENCES `users`(`id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;