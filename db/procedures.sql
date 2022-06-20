USE escuelawhatsapp;

DELIMITER $$
USE `escuelawhatsapp`$$

CREATE PROCEDURE `alumnoAddOrEdit` (
  IN _ID INT,
  IN _ID_ALUMNO  VARCHAR(45),  
  IN _NOMBRES  VARCHAR(45),
  IN _APELLIDOS  VARCHAR(45),
  IN _IDENTIFICACION  VARCHAR(45),
  IN _GENERO  VARCHAR(45),
  IN _CORREO  VARCHAR(45),
  IN _TELEFONO  VARCHAR(45),
  IN _DIRECCION  VARCHAR(45),
  IN _GRADO  VARCHAR(45),
  IN _OBSERVACIONES  VARCHAR(45)
)
BEGIN 
  IF _ID = 0 THEN
    INSERT INTO alumnos ( ID_ALUMNO,NOMBRES,APELLIDOS,IDENTIFICACION,GENERO,CORREO,TELEFONO,DIRECCION, GRADO, OBSERVACIONES)
    VALUES (_ID_ALUMNO, _NOMBRES, _APELLIDOS ,_IDENTIFICACION ,_GENERO ,_CORREO ,_TELEFONO ,_DIRECCION ,_GRADO ,_OBSERVACIONES );

    SET _ID = LAST_INSERT_ID();
  ELSE
    UPDATE alumnos
    SET
     ID_ALUMNO =_ID_ALUMNO ,
     NOMBRES=  _NOMBRES,
     APELLIDOS = _APELLIDOS,
     IDENTIFICACION = _IDENTIFICACION ,
     GENERO = _GENERO ,
     CORREO = _CORREO,
     TELEFONO = _TELEFONO ,
     DIRECCION = _DIRECCION ,
     GRADO = _GRADO ,
     OBSERVACIONES=_OBSERVACIONES 
    WHERE ID = _ID;
  END IF;

  SELECT _ID AS 'ID';
END
