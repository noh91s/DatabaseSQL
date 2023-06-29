-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mysql06
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mysql06
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mysql06` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mysql06` ;

-- -----------------------------------------------------
-- Table `mysql06`.`member0626`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql06`.`member0626` (
  `member0626_id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `create_date` DATE NOT NULL,
  PRIMARY KEY (`member0626_id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mysql06`.`board0626`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql06`.`board0626` (
  `board0626_id` BIGINT NOT NULL AUTO_INCREMENT,
  `board_title` VARCHAR(100) NOT NULL,
  `board_content` VARCHAR(255) NOT NULL,
  `board_writer` VARCHAR(255) NOT NULL,
  `create_date` DATE NOT NULL,
  PRIMARY KEY (`board0626_id`),
  INDEX `board_writer` (`board_writer` ASC) VISIBLE,
  CONSTRAINT `board0626_ibfk_1`
    FOREIGN KEY (`board_writer`)
    REFERENCES `mysql06`.`member0626` (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
