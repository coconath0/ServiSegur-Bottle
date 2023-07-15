create or replace TRIGGER demo_empleados
BEFORE
DELETE OR INSERT OR UPDATE ON empleados
REFERENCING NEW AS N OLD AS O
FOR EACH ROW
DECLARE 
empleados_count NUMBER;
BEGIN

    IF INSERTING THEN
        SELECT COUNT(*) INTO empleados_count FROM empleados WHERE dni  = :N.dni;
        IF empleados_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('NUEVO:');
            DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.fecha_ini_contrato|| '-' || :N.nombre|| '-' || :N.dni || '-' || :N.num_cuenta|| '-' || :N.fondo_pension_id|| '-' || :N.seguro_id);
        ELSE
            RAISE_APPLICATION_ERROR(-20001,'El numero de dni coincide con el de otro usuario');
        END IF;
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('ANTES: ');
        DBMS_OUTPUT.PUT_LINE(:O.id || '-' || :O.fecha_ini_contrato|| '-' || :O.nombre|| '-' || :O.dni || '-' || :O.num_cuenta|| '-' || :O.fondo_pension_id|| '-' || :O.seguro_id);
        DBMS_OUTPUT.PUT_LINE('DESPUES: ');
        DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.fecha_ini_contrato|| '-' || :N.nombre|| '-' || :N.dni || '-' || :N.num_cuenta|| '-' || :N.fondo_pension_id|| '-' || :N.seguro_id);

    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('ANTES: ');
        DBMS_OUTPUT.PUT_LINE(:O.id || '-' || :O.fecha_ini_contrato|| '-' || :O.nombre|| '-' || :O.dni || '-' || :O.num_cuenta|| '-' || :O.fondo_pension_id|| '-' || :O.seguro_id);
    END IF;
END;