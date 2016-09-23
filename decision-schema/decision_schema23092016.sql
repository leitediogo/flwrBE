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

-- -----------------------------------------------------
-- Schema flwr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `flwr` DEFAULT CHARACTER SET utf8 ;
USE `flwr` ;

-- -----------------------------------------------------
-- Table `flwr`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flwr`.`comment` (
  `id` INT NOT NULL,
  `author` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `type` VARCHAR(30) NULL DEFAULT NULL,
  `creation_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `flwr`.`decision`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flwr`.`decision` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `created_by` VARCHAR (100) NOT NULL,
  `owner` VARCHAR (100) NOT NULL,
  `participant_id` VARCHAR (100) NOT NULL,
  `status` VARCHAR(30) NULL DEFAULT NULL,
  `category_id` VARCHAR (30) NULL DEFAULT NULL,
  `comment_id` INT NULL DEFAULT NULL,
  `due_dt` TIMESTAMP,
  `creation_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_decision_comment_idx` (`comment_id` ASC),
  CONSTRAINT `fk_decision_comment`
    FOREIGN KEY (`comment_id`)
    REFERENCES `flwr`.`comment` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 3
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
  `comment_id` INT NULL DEFAULT NULL,
  `creation_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_choice__idx` (`decision_id` ASC),
  INDEX `fk_choice_comment_idx` (`comment_id` ASC),
  CONSTRAINT `fk_choice_decision`
    FOREIGN KEY (`decision_id`)
    REFERENCES `flwr`.`decision` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_choice_comment`
    FOREIGN KEY (`comment_id`)
    REFERENCES `flwr`.`comment` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
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
  `comment_id` INT NULL DEFAULT NULL,
  `creation_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_criteria_decision_idx` (`decision_id` ASC),
  INDEX `fk_criteria_comment_idx` (`comment_id` ASC),
  CONSTRAINT `fk_criteria_decision`
    FOREIGN KEY (`decision_id`)
    REFERENCES `flwr`.`decision` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_criteria_comment`
    FOREIGN KEY (`comment_id`)
    REFERENCES `flwr`.`comment` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `flwr`.`test_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flwr`.`test_table` (
  `id` INT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(30) NOT NULL,
  `lastname` VARCHAR(30) NOT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `reg_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
