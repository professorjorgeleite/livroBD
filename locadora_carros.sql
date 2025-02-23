-- MySQL Script generated by MySQL Workbench
-- Mon Nov 29 10:41:02 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema locadoracarros
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `locadoracarros` ;

-- -----------------------------------------------------
-- Schema locadoracarros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `locadoracarros` DEFAULT CHARACTER SET utf8 ;
USE `locadoracarros` ;

-- -----------------------------------------------------
-- Table `locadoracarros`.`pessoas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `locadoracarros`.`pessoas` ;

CREATE TABLE IF NOT EXISTS `locadoracarros`.`pessoas` (
  `idpessoas` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `cpf` VARCHAR(11) NULL,
  `datanascimento` DATE NULL,
  `email` VARCHAR(500) NULL,
  `sexo` ENUM('m', 'f') NULL,
  PRIMARY KEY (`idpessoas`),
  UNIQUE INDEX `CPF_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadoracarros`.`telefones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `locadoracarros`.`telefones` ;

CREATE TABLE IF NOT EXISTS `locadoracarros`.`telefones` (
  `idtelefones` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(45) NULL,
  `idpessoas` INT NOT NULL,
  PRIMARY KEY (`idtelefones`, `idpessoas`),
  INDEX `fk_telefones_pessoas_idx` (`idpessoas` ASC) VISIBLE,
  CONSTRAINT `fk_telefones_pessoas`
    FOREIGN KEY (`idpessoas`)
    REFERENCES `locadoracarros`.`pessoas` (`idpessoas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadoracarros`.`carros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `locadoracarros`.`carros` ;

CREATE TABLE IF NOT EXISTS `locadoracarros`.`carros` (
  `idcarros` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(15) NULL,
  `modelo` VARCHAR(45) NULL,
  `preco_diaria` FLOAT NULL,
  UNIQUE INDEX `placa_UNIQUE` (`placa` ASC) VISIBLE,
  PRIMARY KEY (`idcarros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadoracarros`.`alugueis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `locadoracarros`.`alugueis` ;

CREATE TABLE IF NOT EXISTS `locadoracarros`.`alugueis` (
  `idalugueis` INT NOT NULL AUTO_INCREMENT,
  `idpessoas` INT NOT NULL,
  `idcarros` INT NOT NULL,
  `datainicial` DATE NOT NULL,
  `datafinal` DATE NULL,
  `valor_total` FLOAT NULL DEFAULT 0,
  INDEX `fk_pessoas_has_carros_carros1_idx` (`idcarros` ASC) VISIBLE,
  INDEX `fk_pessoas_has_carros_pessoas1_idx` (`idpessoas` ASC) VISIBLE,
  PRIMARY KEY (`idalugueis`, `idpessoas`, `idcarros`),
  CONSTRAINT `fk_pessoas_has_carros_pessoas1`
    FOREIGN KEY (`idpessoas`)
    REFERENCES `locadoracarros`.`pessoas` (`idpessoas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoas_has_carros_carros1`
    FOREIGN KEY (`idcarros`)
    REFERENCES `locadoracarros`.`carros` (`idcarros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
