-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2B
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2B
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2B` ;
USE `MER2B` ;

-- -----------------------------------------------------
-- Table `MER2B`.`peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`peliculas` (
  `ISBN` INT(20) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `director` VARCHAR(45) NULL,
  `protagonista` VARCHAR(45) NULL,
  `actor secundari` VARCHAR(45) NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`cine` (
  `nif` INT(9) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `ubicacio` VARCHAR(45) NULL,
  `num_salas` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `codi_postal` VARCHAR(45) NULL,
  PRIMARY KEY (`nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`tarifa` (
  `id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `preu` VARCHAR(45) NULL,
  `descripcio` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`projeccio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`projeccio` (
  `sala_peli` INT NULL,
  `hora_inici` VARCHAR(45) NULL,
  `hora_final` VARCHAR(45) NULL,
  `cine_nif` INT(9) NULL,
  `peliculas_ISBN` INT(20) NULL,
  `tarifa_id` INT NULL,
  INDEX `fk_projeccio_peliculas1_idx` (`peliculas_ISBN` ASC) VISIBLE,
  INDEX `fk_projeccio_tarifa1_idx` (`tarifa_id` ASC) VISIBLE,
  CONSTRAINT `fk_projeccio_cine`
    FOREIGN KEY (`cine_nif`)
    REFERENCES `MER2B`.`cine` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projeccio_peliculas1`
    FOREIGN KEY (`peliculas_ISBN`)
    REFERENCES `MER2B`.`peliculas` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projeccio_tarifa1`
    FOREIGN KEY (`tarifa_id`)
    REFERENCES `MER2B`.`tarifa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
