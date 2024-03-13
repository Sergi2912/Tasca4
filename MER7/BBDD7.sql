-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER7` ;
USE `MER7` ;

-- -----------------------------------------------------
-- Table `MER7`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Empleat` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Client` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Ticket` (
  `Num` INT NOT NULL,
  `Num_factura` VARCHAR(45) NULL,
  `Nom_empresa` VARCHAR(45) NULL,
  `NIF` VARCHAR(45) NULL,
  `Domicili_fiscal` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Web` VARCHAR(45) NULL,
  `Correu` VARCHAR(45) NULL,
  `Data` DATE NULL,
  `Forma_pagament` VARCHAR(45) NULL,
  `Empleat_ID` INT NOT NULL,
  `Client_ID` INT NOT NULL,
  PRIMARY KEY (`Num`),
  INDEX `fk_Ticket_Empleat1_idx` (`Empleat_ID` ASC) VISIBLE,
  INDEX `fk_Ticket_Client1_idx` (`Client_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Empleat1`
    FOREIGN KEY (`Empleat_ID`)
    REFERENCES `MER7`.`Empleat` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_Client1`
    FOREIGN KEY (`Client_ID`)
    REFERENCES `MER7`.`Client` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Producte` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(45) NULL,
  `IVA` VARCHAR(45) NULL,
  `Preu_Unitari` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`Linia_ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Linia_ticket` (
  `ID` INT NOT NULL,
  `Quantitat` VARCHAR(45) NULL,
  `Descompte` VARCHAR(45) NULL,
  `Ticket_Num` INT NOT NULL,
  `Producte_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Linia_ticket_Ticket_idx` (`Ticket_Num` ASC) VISIBLE,
  INDEX `fk_Linia_ticket_Producte1_idx` (`Producte_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Linia_ticket_Ticket`
    FOREIGN KEY (`Ticket_Num`)
    REFERENCES `MER7`.`Ticket` (`Num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linia_ticket_Producte1`
    FOREIGN KEY (`Producte_ID`)
    REFERENCES `MER7`.`Producte` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
