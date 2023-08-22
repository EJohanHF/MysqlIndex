CREATE DATABASE `Testing`;
USE `Testing`;

CREATE TABLE `datos` (
	 `nombre` INT(11)

);


DELIMITER //
DROP PROCEDURE IF EXISTS CA_datosList //
CREATE PROCEDURE CA_datosList (IN BUSQUEDA int)
BEGIN
    SELECT * FROM datos WHERE NOMBRE = BUSQUEDA ;
END //

DELIMITER ;

CALL CA_datosList (0);

DELIMITER //
DROP PROCEDURE IF EXISTS CA_datosModify //
CREATE PROCEDURE CA_datosModify (IN nuevo_nombre int , OUT mensaje VARCHAR(100))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET mensaje = 'error';
        RESIGNAL;
    END;

    START TRANSACTION;

    UPDATE datos SET nombre = nuevo_nombre ;

    COMMIT;
     SET mensaje = 'Update';

END //
DELIMITER ;

CALL CA_datosModify ('', @mensaje);
SELECT @mensaje;

DELIMITER //
DROP PROCEDURE IF EXISTS CA_datosInsert //
CREATE PROCEDURE CA_datosInsert (IN nuevoNumero int , OUT mensaje VARCHAR(100))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET mensaje = 'ERROR';
        RESIGNAL;
    END;

    START TRANSACTION;

   INSERT INTO datos (nombre) VALUE (nuevoNumero);

    COMMIT;
     SET mensaje = 'INSERT';

END //
DELIMITER ;

CALL CA_datosInsert (4, @state);
SELECT @state;



DELIMITER //
DROP PROCEDURE IF EXISTS CA_datosDelete //
CREATE PROCEDURE CA_datosDelete (IN numero int , OUT mensaje VARCHAR(100))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET mensaje = 'ERROR';
        RESIGNAL;
    END;

    START TRANSACTION;

  	 DELETE FROM datos WHERE nombre = numero;

    COMMIT;
     SET mensaje = 'DELETE';

END //
DELIMITER ;

CALL CA_datosDelete (4, @state);
SELECT @state;

SELECT * FROM datos





