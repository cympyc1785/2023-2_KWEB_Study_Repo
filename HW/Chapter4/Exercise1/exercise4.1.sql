CREATE TABLE `students` (
	`id` 				INT NOT NULL AUTO_INCREMENT,
	`name` 				VARCHAR(20) NOT NULL,
	`admission_year`	INT NOT NULL,
	`major` 			VARCHAR(20) NOT NULL,
	`individual_num` 	INT NOT NULL,
	`phone_num` 		VARCHAR(20) NOT NULL,
	`address` 			VARCHAR(100) NOT NULL,
	`credit_sum` 		INT DEFAULT 0,
	`average_credit` 	FLOAT DEFAULT 0.0,
	`is_attending` 		TINYINT DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;