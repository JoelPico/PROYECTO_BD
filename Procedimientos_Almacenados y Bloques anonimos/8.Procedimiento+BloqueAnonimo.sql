
--8.
--Octavo procedimiento almacenado para eliminar un proveedor insertado.
--teniendo en cuenta que no esté relacionado con un producto determinado.

create or replace PROCEDURE PA_ELIMINAR_PROVEEDOR(IDPROV IN NUMBER)
AS
BEGIN    
    DELETE PROVEEDOR WHERE ID_PROVEEDOR=IDPROV;
END PA_ELIMINAR_PROVEEDOR;


--8. BLOQUE ANONIMO PARA PROBAR EL PROCEDIMIENTO ALMACENADO

DECLARE
BEGIN 
 PA_ELIMINAR_PROVEEDOR (1);
  END;