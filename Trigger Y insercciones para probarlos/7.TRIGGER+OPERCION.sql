--7.SEPTIMO TRIGGER
-- El campo TIPO_CONTRATO solo puede tener los valores �TEMPORAL� Y �FIJO�.


create or replace TRIGGER TR_B_IU_TIPOCONTRATO_VENDEDOR 
BEFORE 
INSERT OR UPDATE OF TIPO_CONTRATO ON VENDEDOR
FOR EACH ROW WHEN (NEW.TIPO_CONTRATO<>'FIJO' AND NEW.TIPO_CONTRATO<>'TEMPORAL')
DECLARE
BEGIN
    RAISE_APPLICATION_ERROR(-20039, 'EL TIPO DE CONTRATO SOLO PUEDE SER TEMPORAL O FIJO NO :'|| :NEW.TIPO_CONTRATO);
END TR_B_IU_TIPOCONTRATO_VENDEDOR  ;


----OPERACION QUE DESPIERTA EL TRIGGER

INSERT INTO VENDEDOR (ID_VENDEDOR,CI_VENDEDOR,NOMBRE_VENDEDOR,APELLIDO_VENDEDOR,FECHA_NACIMIENTO,SEXO_VENDEDOR,CIUDAD_VENDEDOR,DIRECCION_VENDEDOR,CORREO_VENDEDOR,TELEFONO_VENDEDOR,SUELDO_VENDEDOR,FECHA_CONTRATO,TIPO_CONTRATO,FOTO_VENDEDOR)
VALUES (1,'13164534574','SLEIDER','PARRALES','3/09/1997','M','MANTA','SANTA CLARA CALLE 209 AV 45','SLEIDER@GMAIL.COM','0987568554',360,'6/09/2015','TEMPO',NULL);