--10
--Decimo procedimiento almacenado para eliminar un cliente insertado.
--teniendo en cuenta que dicho cliente no tenga pedidos realizados que no se han entregado. 

create or replace PROCEDURE PA_ELIMINAR_CLIENTE(IDCLIEN IN NUMBER)
AS
BEGIN    
    DELETE CLIENTE WHERE ID_CLIENTE=IDCLIEN;
END PA_ELIMINAR_CLIENTE;

--10. . BLOQUE ANONIMO PARA PROBAR EL PROCEDIMIENTO ALMACENADO

DECLARE
BEGIN 
 PA_ELIMINAR_CLIENTE (1);
  END;