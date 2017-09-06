--4.CUARTO TRIGGER
--impide que ingrese pedidos antes de las 8:00 am y despu�s de las 18:00 pm. Lo cual es la hora de trabajo establecida.
--Tener en cuenta que el trigger se dispara con la hora que tiene el ordenador

create or replace TRIGGER TR_B_D_HORADETRABAJO_PEDIDO
  BEFORE DELETE OR INSERT OR UPDATE ON PEDIDO
DECLARE
BEGIN

  IF (TO_CHAR(SYSDATE, 'HH24') < 8 OR TO_CHAR(SYSDATE, 'HH24') >= 10) THEN
    raise_application_error( -20502, 'NO PUEDE REALIZAR UN PEDIDO ANTES O DESPUES DE LA JORNADA DE TRABAJO');
  END IF;
END TR_B_D_HORADETRABAJO_PEDIDO;


----OPERACION QUE DESPIERTA EL TRIGGER

INSERT INTO PEDIDO (ID_PEDIDO,ID_VENDEDOR,ID_CLIENTE,FECHA_REALIZACION,FECHA_ENVIO,FORMA_ENVIO)
VALUES (1,1,1,'3/09/2016','3/10/2016','SERVIENTREGA');