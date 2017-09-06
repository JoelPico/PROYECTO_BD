
--5.QUINTO TRIGGER
--Cada vez que se ingrese una CANTIDAD en la tabla DETALLE_PEDIDO
--debe calcularse automáticamente el total de unidades existentes y llenar el campo UNIDADES_EXISTENTES en la tabla PRODUCTO. 

create or replace TRIGGER TR_A_IU_UNIDADESEXISTENTES
AFTER
INSERT OR UPDATE ON DETALLE_PEDIDO
FOR EACH ROW
DECLARE
unidad_existente PRODUCTO.UNIDADES_EXISTENTES%type;
NO_ADMITIDO EXCEPTION;
BEGIN
select UNIDADES_EXISTENTES into unidad_existente from PRODUCTO where ID_PRODUCTO = :new.ID_PRODUCTO;
    if :new.CANTIDAD >=1 then
        unidad_existente := (unidad_existente) - (:NEW.CANTIDAD);
else
        unidad_existente:=unidad_existente;
    end if;
     update PRODUCTO set UNIDADES_EXISTENTES = unidad_existente where ID_PRODUCTO = :new.ID_PRODUCTO;

END TR_A_IU_UNIDADESEXISTENTES;


----OPERACION QUE DESPIERTA EL TRIGGER

 INSERT INTO DETALLE_PEDIDO (ID_PRODUCTO,ID_PEDIDO,CANTIDAD,PRECIO_SUBTOTAL,DESCUENTO,PRECIO_TOTAL)
 VALUES (1,1,20,34,8,4);
 
 --Unavez que insertamos una cantidad determinada.
 --realizamos un - select *from producto;
 --para verificar que se actualizo la cantidades existentes del determinado producto