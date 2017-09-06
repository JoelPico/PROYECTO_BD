--9.
--Noveno procedimiento almacenado para eliminar un producto insertado.
--teniendo en cuenta que dicho producto no esté relacionado con un pedido.

create or replace PROCEDURE PA_ELIMINAR_PRODUCTO(IDPRODUC IN NUMBER)
AS
BEGIN    
    DELETE PRODUCTO WHERE ID_PRODUCTO=IDPRODUC;
END PA_ELIMINAR_PRODUCTO;

--9. . BLOQUE ANONIMO PARA PROBAR EL PROCEDIMIENTO ALMACENADO

DECLARE
BEGIN 
 PA_ELIMINAR_PRODUCTO (1);
  END;
