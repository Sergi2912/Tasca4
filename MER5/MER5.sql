-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER5` ;
USE `MER5` ;

-- -----------------------------------------------------
-- Table `MER5`.`tipus_vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`tipus_vehicle` (
  `id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Vehicle` (
  `ID` INT NOT NULL,
  `marca` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `matricula` VARCHAR(7) NULL,
  `num_carroseria` VARCHAR(45) NULL,
  `tipus_vehicle_id` VARCHAR(45) NULL,
  `tipus_vehicle_id1` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Vehicle_tipus_vehicle_idx` (`tipus_vehicle_id1` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_tipus_vehicle`
    FOREIGN KEY (`tipus_vehicle_id1`)
    REFERENCES `MER5`.`tipus_vehicle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`client_vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`client_vehicle` (
  `id` INT NOT NULL,
  `data_inici` DATE NULL,
  `data_fi` DATE NULL,
  `Client_DNI` VARCHAR(9) NULL,
  `Vechicle_ID` INT NULL,
  `Vehicle_ID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_client_vehicle_Vehicle1_idx` (`Vehicle_ID` ASC) VISIBLE,
  CONSTRAINT `fk_client_vehicle_Vehicle1`
    FOREIGN KEY (`Vehicle_ID`)
    REFERENCES `MER5`.`Vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Client` (
  `DNI` VARCHAR(9) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(50) NULL,
  `dir` VARCHAR(200) NULL,
  `poblacio` VARCHAR(60) NULL,
  `email` VARCHAR(45) NULL,
  `telefon` INT(9) NULL,
  `usuari` VARCHAR(45) NULL,
  `contrasenya` VARCHAR(45) NULL,
  `n_vehicles` INT NULL,
  `client_vehicle_id` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `fk_Client_client_vehicle1_idx` (`client_vehicle_id` ASC) VISIBLE,
  CONSTRAINT `fk_Client_client_vehicle1`
    FOREIGN KEY (`client_vehicle_id`)
    REFERENCES `MER5`.`client_vehicle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Cita` (
  `ID` INT NOT NULL,
  `data` DATE NULL,
  `hora` VARCHAR(45) NULL,
  `ubicacio` VARCHAR(45) NULL,
  `Client_DNI` VARCHAR(9) NULL,
  `Vechicle_ID` VARCHAR(45) NULL,
  `Vehicle_ID` INT NOT NULL,
  `Client_DNI1` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Cita_Vehicle1_idx` (`Vehicle_ID` ASC) VISIBLE,
  INDEX `fk_Cita_Client1_idx` (`Client_DNI1` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Vehicle1`
    FOREIGN KEY (`Vehicle_ID`)
    REFERENCES `MER5`.`Vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cita_Client1`
    FOREIGN KEY (`Client_DNI1`)
    REFERENCES `MER5`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
