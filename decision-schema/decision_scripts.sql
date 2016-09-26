--replace '--' by '#' for mysql comments
--Insert category
INSERT INTO `flwr`.`category`(`name`,`description`) VALUES ('Category One','Category One Description');
--Insert participants
INSERT INTO `flwr`.`participant` (`name`, `full_name`) VALUES ('dleite', 'Diogo Cachim Leite');
INSERT INTO `flwr`.`participant` (`name`,`full_name`) VALUES ('rmateus','Ricardo Mateus');
INSERT INTO `flwr`.`participant`(`name`,`full_name`) VALUES ('fantonio','Florival Antonio');
INSERT INTO `flwr`.`participant`(`name`,`full_name`) VALUES ('ldaniel','Luis Daniel');
--Insert decision
INSERT INTO `flwr`.`decision`(`name`,`description`,`status`,`created_by_id`,`owner_id`,`category_id`,`due_dt`) VALUES 
	('decision One','decision One description','Initiated',1,1,1,current_date());
--Insert decision participants	
INSERT INTO `flwr`.`decision_participant` (`decision_id`,`participant_id`) VALUES (1, 1);
INSERT INTO `flwr`.`decision_participant` (`decision_id`,`participant_id`) VALUES (1, 2);
INSERT INTO `flwr`.`decision_participant` (`decision_id`,`participant_id`) VALUES (1, 3);
--Insert choices
INSERT INTO `flwr`.`choice` (`decision_id`,`name`,`description`,`status`) VALUES (1, 'choice One', 'choice One description', 'choiceStat');
INSERT INTO `flwr`.`choice` (`decision_id`,`name`,`description`,`status`) VALUES (1, 'choice Two', 'choice Two description', 'choiceStat');
INSERT INTO `flwr`.`choice` (`decision_id`,`name`,`description`,`status`) VALUES (1, 'choice Three', 'choice Three description', 'choiceStat');
--Insert criteria
INSERT INTO `flwr`.`criteria` (`decision_id`,`name`,`description`,`status`) VALUES (1, 'criteria One', 'criteria One description', 'criteriaStat');
INSERT INTO `flwr`.`criteria` (`decision_id`,`name`,`description`,`status`) VALUES (1, 'criteria Two', 'criteria Two description', 'criteriaStat');
INSERT INTO `flwr`.`criteria` (`decision_id`,`name`,`description`,`status`) VALUES (1, 'criteria Three', 'criteria Three description', 'criteriaStat');
--Insert comments decision
INSERT INTO `flwr`.`comment`(`author_id`,`description`,`decision_id`,`type`) VALUES (1, 'comment on decision', 1, 'type of comment');