-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema flwr
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `flwr` ;

-- -----------------------------------------------------
-- Schema flwr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `flwr` DEFAULT CHARACTER SET utf8 ;
USE `flwr` ;

-- -----------------------------------------------------
-- Table `flwr`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flwr`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `creation_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `flwr`.`decision`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flwr`.`decision` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `status` VARCHAR(30) NULL DEFAULT NULL,
  `created_by_id` INT NOT NULL,
  `owner_id` INT NOT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `due_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creation_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_decion_category_idx` (`category_id` ASC),
  CONSTRAINT `fk_decion_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `flwr`.`category` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `flwr`.`choice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flwr`.`choice` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `decision_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `status` VARCHAR(30) NULL DEFAULT NULL,
  `creation_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_choice__idx` (`decision_id` ASC),
  CONSTRAINT `fk_choice_decision`
    FOREIGN KEY (`decision_id`)
    REFERENCES `flwr`.`decision` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `flwr`.`criteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flwr`.`criteria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `decision_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `status` VARCHAR(30) NULL DEFAULT NULL,
  `creation_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_criteria_decision_idx` (`decision_id` ASC),
  CONSTRAINT `fk_criteria_decision`
    FOREIGN KEY (`decision_id`)
    REFERENCES `flwr`.`decision` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `flwr`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flwr`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `author_id` INT NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `decision_id` INT NULL,
  `criteria_id` INT NULL,
  `choice_id` INT NULL,
  `type` VARCHAR(30) NULL DEFAULT NULL,
  `creation_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_comment_decision_idx` (`decision_id` ASC),
  INDEX `fk_comment_criteria_idx` (`criteria_id` ASC),
  INDEX `fk_comment_choice_idx` (`choice_id` ASC),
  CONSTRAINT `fk_comment_decision`
    FOREIGN KEY (`decision_id`)
    REFERENCES `flwr`.`decision` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_comment_criteria`
    FOREIGN KEY (`criteria_id`)
    REFERENCES `flwr`.`criteria` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_comment_choice`
    FOREIGN KEY (`choice_id`)
    REFERENCES `flwr`.`choice` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `flwr`.`test_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flwr`.`test_table` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(30) NOT NULL,
  `lastname` VARCHAR(30) NOT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `reg_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `flwr`.`participant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flwr`.`participant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `full_name` VARCHAR(200) NULL DEFAULT NULL,
  `type` VARCHAR(30) NULL DEFAULT NULL,
  `creation_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `flwr`.`decision_participant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flwr`.`decision_participant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `decision_id` INT NOT NULL,
  `participant_id` INT NULL DEFAULT NULL,
  `creation_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_decision_participant_decision_idx` (`decision_id` ASC),
  INDEX `fk_decision_participant_participant_idx` (`participant_id` ASC),
  CONSTRAINT `fk_decision_participant_decision`
    FOREIGN KEY (`decision_id`)
    REFERENCES `flwr`.`decision` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_decision_participant_participant`
    FOREIGN KEY (`participant_id`)
    REFERENCES `flwr`.`participant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
