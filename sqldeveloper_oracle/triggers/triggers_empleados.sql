create or replace TRIGGER demo_empleados
AFTER
DELETE OR INSERT OR UPDATE ON empleados
REFERENCING NEW AS N OLD AS O
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('NUEVO:');
        DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.fecha_ini_contrato|| '-' || :N.nombre|| '-' || :N.dni || '-' || :N.num_cuenta|| '-' || :N.fondo_pension_id|| '-' || :N.seguro_id);
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