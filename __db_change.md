ALTER TABLE `expedientes`.`partidas` 
ADD COLUMN `detallemetrados` TEXT NULL DEFAULT NULL AFTER `tipopartidas_id`,
ADD COLUMN `detallestecnicos` TEXT NULL DEFAULT NULL AFTER `detallemetrados`,
ADD COLUMN `detalleanalisis` TEXT NULL DEFAULT NULL AFTER `detallestecnicos`;
-- Cambios realizados 18-08-2018 --

ALTER TABLE `u590019162_exp`.`calculoflete` 
CHANGE COLUMN `items` `items` TEXT NULL DEFAULT NULL ;

ALTER TABLE `u590019162_exp`.`calculoflete` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;
-- Cambios realizados 26-08-2018 --


ALTER TABLE `expedientes`.`calculoflete` 
ADD COLUMN `preciokm` FLOAT(11) NULL DEFAULT NULL AFTER `distancia_virtual`;

CREATE TABLE IF NOT EXISTS `expedientes`.`especificacionusuarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `especificadegastos_id` INT(11) NOT NULL,
  `materiales_id` INT(11) NOT NULL,
  `fecha_at` DATETIME NULL DEFAULT NULL,
  `fecha_in` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_especificacionusuarios_especificadegastos1_idx` (`especificadegastos_id` ASC),
  INDEX `fk_especificacionusuarios_materiales1_idx` (`materiales_id` ASC),
  CONSTRAINT `fk_especificacionusuarios_especificadegastos1`
    FOREIGN KEY (`especificadegastos_id`)
    REFERENCES `expedientes`.`especificadegastos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_especificacionusuarios_materiales1`
    FOREIGN KEY (`materiales_id`)
    REFERENCES `expedientes`.`materiales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

ALTER TABLE `expedientes`.`calculoflete` 
CHANGE COLUMN `preciokm` `preciotn` FLOAT(11) NULL DEFAULT NULL ;

ALTER TABLE `expedientes`.`calculoflete` 
CHANGE COLUMN `origen` `origen` VARCHAR(250) NULL DEFAULT NULL ,
CHANGE COLUMN `destino` `destino` VARCHAR(250) NULL DEFAULT NULL ;

ALTER TABLE `expedientes`.`calculoflete` 
CHANGE COLUMN `factor_tipo_carretera` `factor_tipo_carretera` FLOAT(11) NULL DEFAULT NULL ,
CHANGE COLUMN `factor_retorno` `factor_retorno` FLOAT(11) NULL DEFAULT NULL ,
CHANGE COLUMN `reajustek1` `reajustek1` FLOAT(11) NULL DEFAULT NULL ;
--- cambios realizados 27-08-2018 ---


ALTER TABLE `expedientes`.`calculoflete` 
CHANGE COLUMN `costotn` `costotn` FLOAT(11) NULL DEFAULT NULL COMMENT 'S/ x TM calculo de preciotn por el factor_tipo_carretera' AFTER `factor_retorno`,
CHANGE COLUMN `factor_tipo_carretera` `factor_tipo_carretera` FLOAT(11) NULL DEFAULT NULL COMMENT 'FACTOR DE CONVERSION SEGÚN TIPO DE CARRETERA' ,
CHANGE COLUMN `distancia_virtual` `distancia_virtual` FLOAT(11) NULL DEFAULT NULL COMMENT 'DISTANCIA VIRTUAL (Km)' ,
CHANGE COLUMN `preciotn` `preciotn` FLOAT(11) NULL DEFAULT NULL COMMENT 'S/ x TM (ingresado por usuario)' ,
CHANGE COLUMN `factor_retorno` `factor_retorno` FLOAT(11) NULL DEFAULT NULL COMMENT 'FACOR DE RETORNO AL VACIO FRV' ,
CHANGE COLUMN `reajustek1` `reajustek1` FLOAT(11) NULL DEFAULT NULL COMMENT 'REAJUSTE K1' ,
CHANGE COLUMN `costokg` `sub_total_tm` FLOAT(11) NULL DEFAULT NULL COMMENT 'SUB TOTAL S/ X TM' ,
CHANGE COLUMN `total` `total` FLOAT(11) NULL DEFAULT NULL COMMENT 'TOTAL' ,
ADD COLUMN `costo_km_tn` FLOAT(11) NULL DEFAULT NULL COMMENT 'COSTO DE KM X TN' AFTER `sub_total_tm`;

--- cambios realizados 03-09-2018 ---

ALTER TABLE `expedientes` CHANGE `aclempresas_id` `aclempresas_id` INT(10) UNSIGNED NULL;
ALTER TABLE `expedientes` ADD `referencia_nombre` VARCHAR(250) NULL AFTER `aclempresas_id`;
ALTER TABLE `expedientes` CHANGE `aclempresas_id` `aclempresas_id` INT(10) UNSIGNED NULL DEFAULT '0';
ALTER TABLE `modulos` ADD `url` VARCHAR(250) NULL AFTER `nombre`;
ALTER TABLE `partidas` ADD `partidas_id` INT(11) NULL AFTER `fecha_in`;
ALTER TABLE `detallemetrados` ADD `detallemetrados_id` INT(11) NULL AFTER `imagen`;

ALTER TABLE `expedientes` ADD `prefijo` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL AFTER `id`, ADD `codigo` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL AFTER `prefijo`;
--- cambios realizados 07-11-2018  cambio echo en local como nube ---