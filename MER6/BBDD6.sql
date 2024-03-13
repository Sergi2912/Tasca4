-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER6` ;
USE `MER6` ;

-- -----------------------------------------------------
-- Table `MER6`.`Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Avion` (
  `ID` INT NOT NULL,
  `Marca` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Capacitat` VARCHAR(45) NULL,
  `Autonomia` VARCHAR(45) NULL,
  `data_fabricacio` VARCHAR(45) NULL,
  `data_mort` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Vol` (
  `ID` INT NOT NULL,
  `Num_vol` VARCHAR(45) NULL,
  `Origen` VARCHAR(45) NULL,
  `Desti` VARCHAR(45) NULL,
  `data_sortida` VARCHAR(45) NULL,
  `hora_sortida` VARCHAR(45) NULL,
  `hora_arribada` VARCHAR(45) NULL,
  `data_arribada` VARCHAR(45) NULL,
  `id_avion` VARCHAR(45) NULL,
  `Avion_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Vol_Avion1_idx` (`Avion_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vol_Avion1`
    FOREIGN KEY (`Avion_ID`)
    REFERENCES `MER6`.`Avion` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Pasatger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Pasatger` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Reserva` (
  `ID` INT NOT NULL,
  `data_` DATE NULL,
  `Import` VARCHAR(45) NULL,
  `ID_vol` VARCHAR(45) NULL,
  `ID_passatger` VARCHAR(45) NULL,
  `Vol_ID` INT NOT NULL,
  `Pasatger_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Reserva_Vol_idx` (`Vol_ID` ASC) VISIBLE,
  INDEX `fk_Reserva_Pasatger1_idx` (`Pasatger_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Vol`
    FOREIGN KEY (`Vol_ID`)
    REFERENCES `MER6`.`Vol` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Pasatger1`
    FOREIGN KEY (`Pasatger_ID`)
    REFERENCES `MER6`.`Pasatger` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
