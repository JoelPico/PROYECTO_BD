--6.
--Sexto procedimiento almacenado de agregar un pedido 

create or replace PROCEDURE PA_INSERTAR_PEDIDO
(
   ID_PEDIDO            IN INTEGER,
   ID_VENDEDOR          IN INTEGER,
   ID_CLIENTE           IN INTEGER,
   FECHA_REALIZACION    IN DATE,
   FECHA_ENVIO          IN DATE,
   FORMA_ENVIO          IN VARCHAR2
 )
AS
BEGIN
INSERT INTO PEDIDO VALUES (ID_PEDIDO,ID_VENDEDOR,ID_CLIENTE,FECHA_REALIZACION,FECHA_ENVIO,FORMA_ENVIO);
END PA_INSERTAR_PEDIDO;


--6. . BLOQUE ANONIMO PARA PROBAR EL PROCEDIMIENTO ALMACENADO

DECLARE
BEGIN 
 PA_INSERTAR_PEDIDO (1,1,1,'3/09/2016','3/10/2016','SERVIENTREGA');
  END;
