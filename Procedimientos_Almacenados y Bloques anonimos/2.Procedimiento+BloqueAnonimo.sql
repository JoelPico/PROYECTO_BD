--2.
--Segundo procedimiento almacenado para agregar una categor�a

create or replace PROCEDURE PA_INSERTAR_CATEGORIA
(
   ID_CATEGORIA         IN INTEGER,
   NOMBRE_CATEGORIA     IN VARCHAR2,
   DESCRIPCION          IN VARCHAR2
)
AS
BEGIN
INSERT INTO CATEGORIA VALUES (ID_CATEGORIA,NOMBRE_CATEGORIA,DESCRIPCION);
END PA_INSERTAR_CATEGORIA;



--2. BLOQUE ANONIMO PARA PROBAR EL PROCEDIMIENTO ALMACENADO

DECLARE
BEGIN 
 PA_INSERTAR_CATEGORIA (1,'ACEITES','TIPOS DE ACEITES Y DERIVADOS DEL MISMO');
  END;