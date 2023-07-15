create or replace TRIGGER demo_fondo_pensiones
BEFORE
DELETE OR INSERT OR UPDATE ON fondo_pensiones
REFERENCING NEW AS N OLD AS O
FOR EACH ROW
DECLARE
empleados_count NUMBER;
fondopensiones_count NUMBER;
BEGIN
    IF INSERTING THEN
        SELECT COUNT(*) INTO fondopensiones_count FROM fondo_pensiones WHERE tipo = :N.tipo;
        IF fondopensiones_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('NUEVO:');
            DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.tipo);
        ELSE
            RAISE_APPLICATION_ERROR(-20001,'Esa fondo de pension ya existe, ingrese otro');
        END IF;
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('ANTES: ');
        DBMS_OUTPUT.PUT_LINE(:O.id || '-' || :O.tipo);
        DBMS_OUTPUT.PUT_LINE('DESPUES: ');
        DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.tipo);
    ELSIF DELETING THEN
        SELECT COUNT(*) INTO empleados_count FROM empleados WHERE fondo_pension_id = :O.id;
        IF empleados_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('ANTES: ');
            DBMS_OUTPUT.PUT_LINE(:O.id || '-' || :O.tipo);
        ELSE
            RAISE_APPLICATION_ERROR(-20001,'Aun no podemos borrar, ya que tenemos empleados con ese fondo que utlizan ese fondo de pension');
        END IF;
    END IF;
END;