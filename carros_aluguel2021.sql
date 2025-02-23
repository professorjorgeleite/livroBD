-- MySQL Script generated by MySQL Workbench
-- Wed Dec  1 10:26:33 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ciaerea
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `pessoas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pessoas` ;

CREATE TABLE IF NOT EXISTS `pessoas` (
  `idpessoas` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(15) NULL,
  `datanascimento` DATE NULL,
  `sexo` ENUM('m', 'f', 'nd') NULL,
  PRIMARY KEY (`idpessoas`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telefones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `telefones` ;

CREATE TABLE IF NOT EXISTS `telefones` (
  `idtelefones` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(45) NULL,
  `idpessoas` INT NOT NULL,
  PRIMARY KEY (`idtelefones`, `idpessoas`),
  INDEX `fk_telefones_pessoas_idx` (`idpessoas` ASC) VISIBLE,
  CONSTRAINT `fk_telefones_pessoas`
    FOREIGN KEY (`idpessoas`)
    REFERENCES `pessoas` (`idpessoas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carros` ;

CREATE TABLE IF NOT EXISTS `carros` (
  `idcarros` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(45) NULL,
  `ano` YEAR NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `idcategorias` INT NOT NULL,
  PRIMARY KEY (`idcarros`, `idcategorias`),
  UNIQUE INDEX `placa_UNIQUE` (`placa` ASC) VISIBLE,
  INDEX `fk_carros_categorias1_idx` (`idcategorias` ASC) VISIBLE,
  CONSTRAINT `fk_carros_categorias1`
    FOREIGN KEY (`idcategorias`)
    REFERENCES `ciaerea`.`categorias` (`idcategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alugueis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alugueis` ;

CREATE TABLE IF NOT EXISTS `alugueis` (
  `idalugueis` INT NOT NULL AUTO_INCREMENT,
  `idpessoas` INT NOT NULL,
  `idcarros` INT NOT NULL,
  `datainicial` DATE NULL,
  `datafinal` DATE NULL,
  `valortotal` FLOAT NULL,
  PRIMARY KEY (`idalugueis`, `idpessoas`, `idcarros`),
  INDEX `fk_pessoas_has_carros_carros1_idx` (`idcarros` ASC) VISIBLE,
  INDEX `fk_pessoas_has_carros_pessoas1_idx` (`idpessoas` ASC) VISIBLE,
  CONSTRAINT `fk_pessoas_has_carros_pessoas1`
    FOREIGN KEY (`idpessoas`)
    REFERENCES `pessoas` (`idpessoas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoas_has_carros_carros1`
    FOREIGN KEY (`idcarros`)
    REFERENCES `carros` (`idcarros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `categorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `categorias` ;

CREATE TABLE IF NOT EXISTS `categorias` (
  `idcategorias` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  `caracteristicas` VARCHAR(300) NULL,
  `precodiaria` FLOAT NULL,
  PRIMARY KEY (`idcategorias`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
