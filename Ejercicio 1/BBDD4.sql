-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER4` ;
USE `MER4` ;

-- -----------------------------------------------------
-- Table `MER4`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Client` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Adresa` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER4`.`Tipus_Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Tipus_Polissa` (
  `ID` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER4`.`Venedors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Venedors` (
  `DNI` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER4`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Polissa` (
  `NUM_polissa` INT NOT NULL,
  `Preu_anual` VARCHAR(45) NULL,
  `Tipus_pagament` VARCHAR(45) NULL,
  `Data_inici_virgencia` DATE NULL,
  `Tipus_Polissa_ID` INT NOT NULL,
  `Client_DNI` VARCHAR(9) NOT NULL,
  `Venedors_DNI` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`NUM_polissa`, `Tipus_Polissa_ID`, `Client_DNI`, `Venedors_DNI`),
  INDEX `fk_Polissa_Tipus_Polissa_idx` (`Tipus_Polissa_ID` ASC) VISIBLE,
  INDEX `fk_Polissa_Client1_idx` (`Client_DNI` ASC) VISIBLE,
  INDEX `fk_Polissa_Venedors1_idx` (`Venedors_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Tipus_Polissa`
    FOREIGN KEY (`Tipus_Polissa_ID`)
    REFERENCES `MER4`.`Tipus_Polissa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Client1`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `MER4`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Venedors1`
    FOREIGN KEY (`Venedors_DNI`)
    REFERENCES `MER4`.`Venedors` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
