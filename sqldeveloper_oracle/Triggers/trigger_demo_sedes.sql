create or replace TRIGGER demo_sedes
BEFORE
DELETE OR INSERT OR UPDATE ON sedes
REFERENCING NEW AS N OLD AS O
FOR EACH ROW
DECLARE
controlA_count NUMBER;
sede_count NUMBER;
BEGIN
    IF INSERTING THEN
        SELECT COUNT(*) INTO sede_count FROM sedes WHERE nombre = :N.nombre;
        IF sede_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('NUEVO:');
            DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.nombre|| '-' || :N.empresa_id);
        ELSE
            RAISE_APPLICATION_ERROR(-20001,'No es posible esa sede, ya que tiene el mismo nombre');
        END IF;
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('ANTES: ');
        DBMS_OUTPUT.PUT_LINE(:O.id || '-' || :O.nombre|| '-' || :O.empresa_id);
        DBMS_OUTPUT.PUT_LINE('DESPUES: ');
        DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.nombre|| '-' || :N.empresa_id);
    ELSIF DELETING THEN
        SELECT COUNT(*) INTO controlA_count FROM control_asistencias WHERE sede_id = :O.id;
        IF controlA_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('ANTES: ');
            DBMS_OUTPUT.PUT_LINE(:O.id || '-' || :O.nombre|| '-' || :O.empresa_id);
        ELSE
            RAISE_APPLICATION_ERROR(-20001,'Aun no podemos borrar, ya que tenemos un control de asistencia que esta asignando una determinada sede');
        END IF;
    END IF;
END;