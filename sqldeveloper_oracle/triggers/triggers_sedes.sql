create or replace TRIGGER demo_sedes
AFTER
DELETE OR INSERT OR UPDATE ON sedes
REFERENCING NEW AS N OLD AS O
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('NUEVO:');
        DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.nombre|| '-' || :N.empresa_id);
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('ANTES: ');
        DBMS_OUTPUT.PUT_LINE(:O.id || '-' || :O.nombre|| '-' || :O.empresa_id);
        DBMS_OUTPUT.PUT_LINE('DESPUES: ');
        DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.nombre|| '-' || :N.empresa_id);
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('ANTES: ');
        DBMS_OUTPUT.PUT_LINE(:O.id || '-' || :O.nombre|| '-' || :O.empresa_id);
    END IF;
END;