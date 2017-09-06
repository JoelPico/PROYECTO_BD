--1.PRIMER TRIGER
--Restringe la operación eliminar en la tabla VENDEDOR. 

create or replace TRIGGER TR_B_D_ELIMINAR_VENDEDOR
Before DELETE ON VENDEDOR
DECLARE
BEGIN
    IF DELETING 
    THEN RAISE_APPLICATION_ERROR(-20039, 'NO SE PUEDE ELIMINAR UN VENDEDOR');
    END IF;
END TR_B_D_ELIMINAR_VENDEDOR;



--OPERACION QUE DESPIERTA EL TRIGGER

DELETE  VENDEDOR;