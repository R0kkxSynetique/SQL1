-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Create my_db
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `my_db` DEFAULT CHARACTER SET utf8 ;
USE `my_db` ;

-- -----------------------------------------------------
-- Table `my_db`.`addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `my_db`.`addresses` ;

CREATE TABLE IF NOT EXISTS `my_db`.`addresses` (
  `id_address` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(60) NOT NULL,
  `locality` VARCHAR(60) NOT NULL,
  `postal_code` VARCHAR(60) NOT NULL,
  `administrative_area` VARCHAR(60) NOT NULL,
  `country` VARCHAR(2) NOT NULL,
  `premise` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_address`),
  UNIQUE INDEX `unique` (`street` ASC, `locality` ASC, `postal_code` ASC, `administrative_area` ASC, `country` ASC, `premise` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_db`.`rooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `my_db`.`rooms` ;

CREATE TABLE IF NOT EXISTS `my_db`.`rooms` (
  `id_room` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_room`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_db`.`classes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `my_db`.`classes` ;

CREATE TABLE IF NOT EXISTS `my_db`.`classes` (
  `id_class` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `person_id` INT NOT NULL,
  `room_id` INT NOT NULL,
  PRIMARY KEY (`id_class`, `person_id`, `room_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_classes_people1_idx` (`person_id` ASC) VISIBLE,
  INDEX `fk_classes_rooms1_idx` (`room_id` ASC) VISIBLE,
  CONSTRAINT `fk_classes_people1`
    FOREIGN KEY (`person_id`)
    REFERENCES `my_db`.`people` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_classes_rooms1`
    FOREIGN KEY (`room_id`)
    REFERENCES `my_db`.`rooms` (`id_room`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_db`.`specializations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `my_db`.`specializations` ;

CREATE TABLE IF NOT EXISTS `my_db`.`specializations` (
  `id_specialization` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `description` VARCHAR(150) NULL,
  PRIMARY KEY (`id_specialization`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_db`.`people`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `my_db`.`people` ;

CREATE TABLE IF NOT EXISTS `my_db`.`people` (
  `id_person` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(60) NOT NULL,
  `lastname` VARCHAR(60) NOT NULL,
  `birthdate` DATE NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `phone_number` VARCHAR(60) NOT NULL,
  `IBAN` VARCHAR(60) NULL,
  `class_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  `specialization_id` INT NULL,
  PRIMARY KEY (`id_person`, `class_id`, `address_id`),
  UNIQUE INDEX `unique` (`firstname` ASC, `lastname` ASC, `birthdate` ASC, `email` ASC) VISIBLE,
  INDEX `fk_people_classes1_idx` (`class_id` ASC) VISIBLE,
  INDEX `fk_people_addresses1_idx` (`address_id` ASC) VISIBLE,
  INDEX `fk_people_specializations1_idx` (`specialization_id` ASC) VISIBLE,
  CONSTRAINT `fk_people_classes1`
    FOREIGN KEY (`class_id`)
    REFERENCES `my_db`.`classes` (`id_class`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_people_addresses1`
    FOREIGN KEY (`address_id`)
    REFERENCES `my_db`.`addresses` (`id_address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_people_specializations1`
    FOREIGN KEY (`specialization_id`)
    REFERENCES `my_db`.`specializations` (`id_specialization`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_db`.`trimesters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `my_db`.`trimesters` ;

CREATE TABLE IF NOT EXISTS `my_db`.`trimesters` (
  `id_trimester` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `startdate` DATE NOT NULL,
  `enddate` DATE NOT NULL,
  `class_id` INT NOT NULL,
  PRIMARY KEY (`id_trimester`, `class_id`),
  UNIQUE INDEX `unique` (`name` ASC, `startdate` ASC, `enddate` ASC, `class_id` ASC) VISIBLE,
  INDEX `fk_trimesters_classes1_idx` (`class_id` ASC) VISIBLE,
  CONSTRAINT `fk_trimesters_classes1`
    FOREIGN KEY (`class_id`)
    REFERENCES `my_db`.`classes` (`id_class`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_db`.`courses_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `my_db`.`courses_status` ;

CREATE TABLE IF NOT EXISTS `my_db`.`courses_status` (
  `id_courses_status` INT NOT NULL,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_courses_status`),
  UNIQUE INDEX `unique` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_db`.`courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `my_db`.`courses` ;

CREATE TABLE IF NOT EXISTS `my_db`.`courses` (
  `id_course` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `description` VARCHAR(150) NULL,
  `courses_status_id_courses_status` INT NOT NULL,
  PRIMARY KEY (`id_course`, `courses_status_id_courses_status`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_courses_courses_status1_idx` (`courses_status_id_courses_status` ASC) VISIBLE,
  CONSTRAINT `fk_courses_courses_status1`
    FOREIGN KEY (`courses_status_id_courses_status`)
    REFERENCES `my_db`.`courses_status` (`id_courses_status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_db`.`marks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `my_db`.`marks` ;

CREATE TABLE IF NOT EXISTS `my_db`.`marks` (
  `id_mark` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `mark` DECIMAL(4,2) NOT NULL,
  `course_id` INT NOT NULL,
  `trimester_id` INT NOT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id_mark`, `course_id`, `trimester_id`, `person_id`),
  UNIQUE INDEX `unique` (`name` ASC, `mark` ASC, `course_id` ASC, `trimester_id` ASC, `person_id` ASC) VISIBLE,
  INDEX `fk_marks_courses1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_marks_trimesters1_idx` (`trimester_id` ASC) VISIBLE,
  INDEX `fk_marks_people1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_marks_courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `my_db`.`courses` (`id_course`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_marks_trimesters1`
    FOREIGN KEY (`trimester_id`)
    REFERENCES `my_db`.`trimesters` (`id_trimester`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_marks_people1`
    FOREIGN KEY (`person_id`)
    REFERENCES `my_db`.`people` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_db`.`people_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `my_db`.`people_status` ;

CREATE TABLE IF NOT EXISTS `my_db`.`people_status` (
  `id_people_status` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_people_status`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_db`.`people_has_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `my_db`.`people_has_status` ;

CREATE TABLE IF NOT EXISTS `my_db`.`people_has_status` (
  `person_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`person_id`, `status_id`),
  INDEX `fk_people_has_status_status1_idx` (`status_id` ASC) VISIBLE,
  INDEX `fk_people_has_status_people_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_people_has_status_people`
    FOREIGN KEY (`person_id`)
    REFERENCES `my_db`.`people` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_people_has_status_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `my_db`.`people_status` (`id_people_status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_db`.`people_has_courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `my_db`.`people_has_courses` ;

CREATE TABLE IF NOT EXISTS `my_db`.`people_has_courses` (
  `person_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`person_id`, `course_id`),
  INDEX `fk_people_has_courses_courses1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_people_has_courses_people1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_people_has_courses_people1`
    FOREIGN KEY (`person_id`)
    REFERENCES `my_db`.`people` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_people_has_courses_courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `my_db`.`courses` (`id_course`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_db`.`courses_has_trimesters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `my_db`.`courses_has_trimesters` ;

CREATE TABLE IF NOT EXISTS `my_db`.`courses_has_trimesters` (
  `course_id` INT NOT NULL,
  `trimester_id` INT NOT NULL,
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,
  `weekday` ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL,
  PRIMARY KEY (`course_id`, `trimester_id`),
  INDEX `fk_courses_has_trimesters_trimesters1_idx` (`trimester_id` ASC) VISIBLE,
  INDEX `fk_courses_has_trimesters_courses1_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_courses_has_trimesters_courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `my_db`.`courses` (`id_course`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_has_trimesters_trimesters1`
    FOREIGN KEY (`trimester_id`)
    REFERENCES `my_db`.`trimesters` (`id_trimester`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `my_db`.`courses_has_specializations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `my_db`.`courses_has_specializations` ;

CREATE TABLE IF NOT EXISTS `my_db`.`courses_has_specializations` (
  `course_id` INT NOT NULL,
  `specialization_id` INT NOT NULL,
  PRIMARY KEY (`course_id`, `specialization_id`),
  INDEX `fk_courses_has_specializations_specializations1_idx` (`specialization_id` ASC) VISIBLE,
  INDEX `fk_courses_has_specializations_courses1_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_courses`
    FOREIGN KEY (`course_id`)
    REFERENCES `my_db`.`courses` (`id_course`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_specializations`
    FOREIGN KEY (`specialization_id`)
    REFERENCES `my_db`.`specializations` (`id_specialization`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
