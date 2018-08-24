ALTER TABLE `expedientes`.`partidas` 
ADD COLUMN `detallemetrados` TEXT NULL DEFAULT NULL AFTER `tipopartidas_id`,
ADD COLUMN `detallestecnicos` TEXT NULL DEFAULT NULL AFTER `detallemetrados`,
ADD COLUMN `detalleanalisis` TEXT NULL DEFAULT NULL AFTER `detallestecnicos`;
-- Cambios realizados 18-08-2018 --

ALTER TABLE `expedientes`.`calculoflete` 
CHANGE COLUMN `items` `items` TEXT NULL DEFAULT NULL ;