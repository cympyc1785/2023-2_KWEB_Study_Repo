SELECT `tickets`.`user`, `users`.`name` , `seat_number`
FROM `tickets`
INNER JOIN `users` ON `tickets`.`user` = `users`.`id`
WHERE `train` = 11
ORDER BY `seat_number` ASC;

SELECT `tickets`.`user`, `users`.`name`,
	count(`tickets`.`train`) AS `trains_count`,
	sum(`trains`.`distance`)/10 AS `total_distance`
FROM `tickets`
LEFT JOIN `users` ON `tickets`.`user` = `users`.`id`
LEFT JOIN `trains` ON `tickets`.`train` = `trains`.`id`
GROUP BY `user` ORDER BY `total_distance` DESC LIMIT 0, 6;

SELECT `t`.`id`, `types`.`name`,
	`src`.`name` AS `src_stn` , `dest`.`name` AS `dst_stn`,
	TIMEDIFF(`t`.`arrival`, `t`.`departure`) AS `travel_time`
FROM `trains` AS `t`
LEFT JOIN `types` ON `t`.`type` = `types`.`id`
LEFT JOIN `stations` AS `src` ON `t`.`source` = `src`.`id`
LEFT JOIN `stations` AS `dest` ON `t`.`destination` = `dest`.`id`
ORDER BY `travel_time` DESC LIMIT 0, 6;

SELECT `types`.`name`,
	`src`.`name` AS `src_stn` , `dest`.`name` AS `dst_stn`,
	`t`.`departure`, `t`.`arrival`,
	round(`types`.`fare_rate` * `t`.`distance` / 1000, -2) AS `fare`
FROM `trains` AS `t`
LEFT JOIN `types` ON `t`.`type` = `types`.`id`
LEFT JOIN `stations` AS `src` ON `t`.`source` = `src`.`id`
LEFT JOIN `stations` AS `dest` ON `t`.`destination` = `dest`.`id`
ORDER BY `t`.`departure` ASC;

SELECT `t`.`id`, `types`.`name`,
	`src`.`name` AS `src_stn` , `dest`.`name` AS `dst_stn`,
	count(*) AS `occupied`,
	`types`.`max_seats` AS `maximum`
FROM `tickets`
INNER JOIN `trains` AS `t` ON `t`.`id` = `tickets`.`train`
INNER JOIN `types` ON `t`.`type` = `types`.`id`
INNER JOIN `stations` AS `src` ON `t`.`source` = `src`.`id`
INNER JOIN `stations` AS `dest` ON `t`.`destination` = `dest`.`id`
GROUP BY `t`.`id`
ORDER BY `t`.`id` ASC;


SELECT `t`.`id`, `types`.`name`,
	`src`.`name` AS `src_stn` , `dest`.`name` AS `dst_stn`,
	count(*) AS `occupied`,
	`types`.`max_seats` AS `maximum`
FROM `trains` AS `t`
LEFT JOIN `types` ON `t`.`type` = `types`.`id`
LEFT JOIN `stations` AS `src` ON `t`.`source` = `src`.`id`
LEFT JOIN `stations` AS `dest` ON `t`.`destination` = `dest`.`id`
RIGHT JOIN `tickets` ON `t`.`id` = `tickets`.`train`
GROUP BY `t`.`id`
ORDER BY `t`.`id` ASC;

