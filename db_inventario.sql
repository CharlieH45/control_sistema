-- MySQL Script generated by MySQL Workbench
-- Sat Jul 20 15:48:28 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_inventario
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_inventario
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_inventario` ;
USE `db_inventario` ;

-- -----------------------------------------------------
-- Table `db_inventario`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`roles` (
  `idroles` INT NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idroles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`trabajadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`trabajadores` (
  `idtrabajadores` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` BIGINT(20) NULL,
  `correo` VARCHAR(45) NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `roles_idroles` INT NOT NULL,
  PRIMARY KEY (`idtrabajadores`),
  INDEX `fk_trabajadores_roles1_idx` (`roles_idroles` ASC),
  CONSTRAINT `fk_trabajadores_roles1`
    FOREIGN KEY (`roles_idroles`)
    REFERENCES `db_inventario`.`roles` (`idroles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`proveedores` (
  `idproveedores` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `documento` BIGINT(20) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `telefono` BIGINT(20) NOT NULL,
  `telefono_adicional` BIGINT(20) NOT NULL,
  `trabajadores_idtrabajadores` BIGINT(20) NOT NULL,
  PRIMARY KEY (`idproveedores`),
  INDEX `fk_proveedores_trabajadores1_idx` (`trabajadores_idtrabajadores` ASC),
  CONSTRAINT `fk_proveedores_trabajadores1`
    FOREIGN KEY (`trabajadores_idtrabajadores`)
    REFERENCES `db_inventario`.`trabajadores` (`idtrabajadores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`clientes` (
  `idclientes` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `documento` BIGINT(20) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `telefono` BIGINT(20) NOT NULL,
  `telefono_adicional` BIGINT(20) NOT NULL,
  `trabajadores_idtrabajadores` BIGINT(20) NOT NULL,
  PRIMARY KEY (`idclientes`),
  INDEX `fk_clientes_trabajadores1_idx` (`trabajadores_idtrabajadores` ASC),
  CONSTRAINT `fk_clientes_trabajadores1`
    FOREIGN KEY (`trabajadores_idtrabajadores`)
    REFERENCES `db_inventario`.`trabajadores` (`idtrabajadores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`categorias` (
  `idcategorias` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(45) NOT NULL,
  `trabajadores_idtrabajadores` BIGINT(20) NOT NULL,
  PRIMARY KEY (`idcategorias`),
  INDEX `fk_categorias_trabajadores1_idx` (`trabajadores_idtrabajadores` ASC),
  CONSTRAINT `fk_categorias_trabajadores1`
    FOREIGN KEY (`trabajadores_idtrabajadores`)
    REFERENCES `db_inventario`.`trabajadores` (`idtrabajadores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`productos` (
  `idproductos` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(45) NOT NULL,
  `producto` VARCHAR(45) NOT NULL,
  `categorias_idcategorias` BIGINT(20) NOT NULL,
  `precio` DECIMAL(5,2) NOT NULL,
  `trabajadores_idtrabajadores` BIGINT(20) NOT NULL,
  PRIMARY KEY (`idproductos`),
  INDEX `fk_productos_trabajadores1_idx` (`trabajadores_idtrabajadores` ASC),
  INDEX `fk_productos_categorias1_idx` (`categorias_idcategorias` ASC),
  CONSTRAINT `fk_productos_trabajadores1`
    FOREIGN KEY (`trabajadores_idtrabajadores`)
    REFERENCES `db_inventario`.`trabajadores` (`idtrabajadores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_categorias1`
    FOREIGN KEY (`categorias_idcategorias`)
    REFERENCES `db_inventario`.`categorias` (`idcategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`ventas_mayoristas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`ventas_mayoristas` (
  `idventas_mayoristas` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `clientes_idclientes` BIGINT(20) NOT NULL,
  `productos_idproductos` BIGINT(20) NOT NULL,
  `cantidad` BIGINT(10) NOT NULL,
  `precio_total` DECIMAL(5,2) NOT NULL,
  `trabajadores_idtrabajadores` BIGINT(20) NOT NULL,
  PRIMARY KEY (`idventas_mayoristas`),
  INDEX `fk_ventas_mayoristas_clientes1_idx` (`clientes_idclientes` ASC),
  INDEX `fk_ventas_mayoristas_productos1_idx` (`productos_idproductos` ASC),
  INDEX `fk_ventas_mayoristas_trabajadores1_idx` (`trabajadores_idtrabajadores` ASC),
  CONSTRAINT `fk_ventas_mayoristas_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `db_inventario`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_mayoristas_productos1`
    FOREIGN KEY (`productos_idproductos`)
    REFERENCES `db_inventario`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_mayoristas_trabajadores1`
    FOREIGN KEY (`trabajadores_idtrabajadores`)
    REFERENCES `db_inventario`.`trabajadores` (`idtrabajadores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`compras` (
  `idcompras` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `proveedores_idproveedores` BIGINT(20) NOT NULL,
  `productos_idproductos` BIGINT(20) NOT NULL,
  `cantidad` BIGINT(10) NOT NULL,
  `precio_total` DECIMAL(5,2) NOT NULL,
  `trabajadores_idtrabajadores` BIGINT(20) NOT NULL,
  PRIMARY KEY (`idcompras`),
  INDEX `fk_compras_proveedores1_idx` (`proveedores_idproveedores` ASC),
  INDEX `fk_compras_productos1_idx` (`productos_idproductos` ASC),
  INDEX `fk_compras_trabajadores1_idx` (`trabajadores_idtrabajadores` ASC),
  CONSTRAINT `fk_compras_proveedores1`
    FOREIGN KEY (`proveedores_idproveedores`)
    REFERENCES `db_inventario`.`proveedores` (`idproveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compras_productos1`
    FOREIGN KEY (`productos_idproductos`)
    REFERENCES `db_inventario`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compras_trabajadores1`
    FOREIGN KEY (`trabajadores_idtrabajadores`)
    REFERENCES `db_inventario`.`trabajadores` (`idtrabajadores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`estados_mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`estados_mesas` (
  `idestados_mesas` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idestados_mesas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`mesas` (
  `idmesas` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `mesa` VARCHAR(45) NOT NULL,
  `estados_mesas_idestados_mesas` BIGINT(20) NOT NULL,
  `trabajadores_idtrabajadores` BIGINT(20) NOT NULL,
  PRIMARY KEY (`idmesas`),
  INDEX `fk_mesas_trabajadores1_idx` (`trabajadores_idtrabajadores` ASC),
  INDEX `fk_mesas_estados_mesas1_idx` (`estados_mesas_idestados_mesas` ASC),
  CONSTRAINT `fk_mesas_trabajadores1`
    FOREIGN KEY (`trabajadores_idtrabajadores`)
    REFERENCES `db_inventario`.`trabajadores` (`idtrabajadores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mesas_estados_mesas1`
    FOREIGN KEY (`estados_mesas_idestados_mesas`)
    REFERENCES `db_inventario`.`estados_mesas` (`idestados_mesas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`inventario` (
  `idinventario` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `productos_idproductos` BIGINT(20) NOT NULL,
  `stock` BIGINT(10) NOT NULL,
  `stock_minimo` BIGINT(10) NOT NULL,
  `trabajadores_idtrabajadores` BIGINT(20) NOT NULL,
  PRIMARY KEY (`idinventario`),
  INDEX `fk_inventario_trabajadores1_idx` (`trabajadores_idtrabajadores` ASC),
  INDEX `fk_inventario_productos1_idx` (`productos_idproductos` ASC),
  CONSTRAINT `fk_inventario_trabajadores1`
    FOREIGN KEY (`trabajadores_idtrabajadores`)
    REFERENCES `db_inventario`.`trabajadores` (`idtrabajadores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventario_productos1`
    FOREIGN KEY (`productos_idproductos`)
    REFERENCES `db_inventario`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`ventas_unitarias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`ventas_unitarias` (
  `idventas_unitarias` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `mesas_idmesas` BIGINT(20) NOT NULL,
  `productos_idproductos` BIGINT(20) NOT NULL,
  `inventario_idinventario` BIGINT(20) NOT NULL,
  `cantidad` BIGINT(10) NOT NULL,
  `precio_total` DECIMAL(5,2) NOT NULL,
  `trabajadores_idtrabajadores` BIGINT(20) NOT NULL,
  PRIMARY KEY (`idventas_unitarias`),
  INDEX `fk_ventas_unitarias_mesas1_idx` (`mesas_idmesas` ASC),
  INDEX `fk_ventas_unitarias_productos1_idx` (`productos_idproductos` ASC),
  INDEX `fk_ventas_unitarias_inventario1_idx` (`inventario_idinventario` ASC),
  INDEX `fk_ventas_unitarias_trabajadores1_idx` (`trabajadores_idtrabajadores` ASC),
  CONSTRAINT `fk_ventas_unitarias_mesas1`
    FOREIGN KEY (`mesas_idmesas`)
    REFERENCES `db_inventario`.`mesas` (`idmesas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_unitarias_productos1`
    FOREIGN KEY (`productos_idproductos`)
    REFERENCES `db_inventario`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_unitarias_inventario1`
    FOREIGN KEY (`inventario_idinventario`)
    REFERENCES `db_inventario`.`inventario` (`idinventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_unitarias_trabajadores1`
    FOREIGN KEY (`trabajadores_idtrabajadores`)
    REFERENCES `db_inventario`.`trabajadores` (`idtrabajadores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`informacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`informacion` (
  `idinformacion` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `foto` VARCHAR(45) NOT NULL,
  `nombre_empresa` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` BIGINT(20) NOT NULL,
  `telefono_adicional` BIGINT(20) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `trabajadores_idtrabajadores` BIGINT(20) NOT NULL,
  PRIMARY KEY (`idinformacion`),
  INDEX `fk_informacion_trabajadores1_idx` (`trabajadores_idtrabajadores` ASC),
  CONSTRAINT `fk_informacion_trabajadores1`
    FOREIGN KEY (`trabajadores_idtrabajadores`)
    REFERENCES `db_inventario`.`trabajadores` (`idtrabajadores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`historial_clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`historial_clientes` (
  `idhistorial_clientes` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `documento` BIGINT(20) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `telefono` BIGINT(20) NOT NULL,
  `telefono_adicional` BIGINT(20) NOT NULL,
  `trabajador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idhistorial_clientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`historial_proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`historial_proveedores` (
  `idhistorial_proveedores` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `documento` BIGINT(20) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `telefono` BIGINT(20) NOT NULL,
  `telefono_adicional` BIGINT(20) NOT NULL,
  `trabajador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idhistorial_proveedores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`historial_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`historial_productos` (
  `idhistorial_productos` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(45) NOT NULL,
  `producto` VARCHAR(45) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  `precio` DECIMAL(5,2) NOT NULL,
  `trabajador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idhistorial_productos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`historial_trabajadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`historial_trabajadores` (
  `idhistorial_usuarios` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` BIGINT(20) NULL,
  `correo` VARCHAR(45) NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  `trabajador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idhistorial_usuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`historial_categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`historial_categorias` (
  `idhistorial_categorias` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(45) NOT NULL,
  `trabajor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idhistorial_categorias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`historial_venta_mayorista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`historial_venta_mayorista` (
  `idhistorial_venta_mayorista` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `cliente` VARCHAR(45) NOT NULL,
  `documento` BIGINT(20) NOT NULL,
  `telefono` BIGINT(20) NOT NULL,
  `telefono_adicional` BIGINT(20) NOT NULL,
  `codigo_producto` VARCHAR(45) NOT NULL,
  `producto` VARCHAR(45) NOT NULL,
  `cantidad` BIGINT(10) NOT NULL,
  `precio_unitario` DECIMAL(5,2) NOT NULL,
  `precio_total` DECIMAL(5,2) NOT NULL,
  `trabajador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idhistorial_venta_mayorista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`historial_compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`historial_compras` (
  `idhistorial_compras` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `proveedor` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` BIGINT(20) NOT NULL,
  `telefono_adicional` BIGINT(20) NOT NULL,
  `codigo_producto` VARCHAR(45) NOT NULL,
  `producto` VARCHAR(45) NOT NULL,
  `cantidad` BIGINT(20) NOT NULL,
  `precio_unitario` DECIMAL(5,2) NOT NULL,
  `precio_total` DECIMAL(5,2) NOT NULL,
  `trabajador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idhistorial_compras`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`historial_ventas_unitarias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`historial_ventas_unitarias` (
  `idhistorial_ventas_unitarias` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `mesa` VARCHAR(45) NOT NULL,
  `codigo_producto` VARCHAR(45) NOT NULL,
  `producto` VARCHAR(45) NOT NULL,
  `stock` BIGINT(20) NOT NULL,
  `cantidad` BIGINT(20) NOT NULL,
  `precio_unitario` DECIMAL(5,2) NOT NULL,
  `precio_total` DECIMAL(5,2) NOT NULL,
  `trabajador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idhistorial_ventas_unitarias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`historial_inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`historial_inventario` (
  `idhistorial_inventario` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(45) NOT NULL,
  `producto` VARCHAR(45) NOT NULL,
  `stock` BIGINT(20) NOT NULL,
  `stock_minimo` BIGINT(20) NOT NULL,
  `trabajador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idhistorial_inventario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_inventario`.`historial_informacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_inventario`.`historial_informacion` (
  `idhistorial_informacion` INT NOT NULL AUTO_INCREMENT,
  `foto` VARCHAR(45) NOT NULL,
  `empresa` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` BIGINT(20) NOT NULL,
  `telefono_adicional` BIGINT(20) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idhistorial_informacion`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
