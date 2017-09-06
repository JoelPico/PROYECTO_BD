--6.SEXTO TRIGGER
--limita la cantidad a ingresar si es mayor a las unidades existentes de un determinado producto.

create or replace TRIGGER TR_B_IU_PERMITIRCANTIDAD
before
INSERT OR UPDATE ON DETALLE_PEDIDO
FOR EACH ROW
DECLARE
unidad_existente integer:=0;
NO_ADMITIDO EXCEPTION;
BEGIN
select UNIDADES_EXISTENTES into unidad_existente from PRODUCTO where ID_PRODUCTO = :new.ID_PRODUCTO;
    if :new.CANTIDAD >unidad_existente then
        RAISE NO_ADMITIDO;
    END IF;
EXCEPTION
    WHEN NO_ADMITIDO THEN
    RAISE_APPLICATION_ERROR(-20085,'Esta cantidad :' || :NEW.CANTIDAD||  ' es mayor a la existencia del producto :'||unidad_existente );

END TR_B_IU_PERMITIRCANTIDAD;

----OPERACION QUE DESPIERTA EL TRIGGER

  INSERT INTO DETALLE_PEDIDO (ID_PRODUCTO,ID_PEDIDO,CANTIDAD,PRECIO_SUBTOTAL,DESCUENTO,PRECIO_TOTAL)
 VALUES (1,1,30,34,8,4);
 --Debemos insertar una cantidad mayor de un determinado producto para que se dispare el trigger