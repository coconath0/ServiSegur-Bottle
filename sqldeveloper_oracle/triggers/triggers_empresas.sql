create or replace TRIGGER demo_empresas
AFTER
DELETE OR INSERT OR UPDATE ON empresas
REFERENCING NEW AS N OLD AS O
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('1++++++++++++++++++');
        DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.nombre);
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('2++++++++++++++++++');
        DBMS_OUTPUT.PUT_LINE(:N.id || '-' ||'ANTES: '||:O.nombre || '-' ||'DESPUES: '||:N.nombre);
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('3++++++++++++++++++');
        DBMS_OUTPUT.PUT_LINE(:O.id || '-' ||'ANTES: '||:O.nombre );
    END IF;
END;