create or replace TRIGGER demo_servicios
AFTER
DELETE OR INSERT OR UPDATE ON servicios
REFERENCING NEW AS N OLD AS O
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('NUEVO:');
        DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.tipo);
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('ANTES: ');
        DBMS_OUTPUT.PUT_LINE(:O.id || '-' || :O.tipo);
        DBMS_OUTPUT.PUT_LINE('DESPUES: ');
        DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.tipo);
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('ANTES: ');
        DBMS_OUTPUT.PUT_LINE(:O.id || '-' || :O.tipo);
    END IF;
END;