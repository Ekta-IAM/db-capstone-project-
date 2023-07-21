-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `LittleLemonDB` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Customers` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `idCustomer` INT NOT NULL,
  `customerName` VARCHAR(45) NULL,
  `contactNumber` INT NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staffs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Staffs` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staffs` (
  `idStaffMember` INT NOT NULL,
  `staffName` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`idStaffMember`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Bookings` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `idBooking` INT NOT NULL,
  `idCustomer` INT NOT NULL,
  `idStaffMember` INT NOT NULL,
  `tableNumber` INT NOT NULL,
  `bookingDate` DATE NULL,
  PRIMARY KEY (`idBooking`),
  INDEX `idCustomer_idx` (`idCustomer` ASC) VISIBLE,
  INDEX `idStaffMember_idx` (`idStaffMember` ASC) VISIBLE,
  CONSTRAINT `idCustomer`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `LittleLemonDB`.`Customers` (`idCustomer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idStaffMember`
    FOREIGN KEY (`idStaffMember`)
    REFERENCES `LittleLemonDB`.`Staffs` (`idStaffMember`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Menus` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `idMenu` INT NOT NULL,
  `cuisines` VARCHAR(45) NULL,
  `starters` VARCHAR(45) NULL,
  `courses` VARCHAR(45) NULL,
  `drinks` VARCHAR(45) NULL,
  `desserts` VARCHAR(45) NULL,
  PRIMARY KEY (`idMenu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Delivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Delivery` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Delivery` (
  `idDelivery` INT NOT NULL,
  `deliveryDate` DATE NULL,
  `deliveryStatus` VARCHAR(45) NULL,
  PRIMARY KEY (`idDelivery`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Orders` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `idOrder` INT NOT NULL,
  `orderDate` DATE NULL,
  `quantity` INT NULL,
  `totalCost` DECIMAL(10,5) NULL,
  `idBooking` INT NULL,
  `idMenu` INT NULL,
  `idDelivery` INT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `idBooking_idx` (`idBooking` ASC) VISIBLE,
  INDEX `idMenu_idx` (`idMenu` ASC) VISIBLE,
  INDEX `idDelivery_idx` (`idDelivery` ASC) VISIBLE,
  CONSTRAINT `idBooking`
    FOREIGN KEY (`idBooking`)
    REFERENCES `LittleLemonDB`.`Bookings` (`idBooking`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idMenu`
    FOREIGN KEY (`idMenu`)
    REFERENCES `LittleLemonDB`.`Menus` (`idMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idDelivery`
    FOREIGN KEY (`idDelivery`)
    REFERENCES `LittleLemonDB`.`Delivery` (`idDelivery`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
