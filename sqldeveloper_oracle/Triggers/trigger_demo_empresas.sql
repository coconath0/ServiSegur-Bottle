create or replace TRIGGER demo_empresas
BEFORE
DELETE OR INSERT OR UPDATE ON empresas
REFERENCING NEW AS N OLD AS O
FOR EACH ROW
DECLARE
contratos_count NUMBER;
empresas_count NUMBER;
BEGIN
    IF INSERTING THEN
        SELECT COUNT(*) INTO empresas_count FROM empresas WHERE nombre = :N.nombre;
        IF empresas_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('1++++++++++++++++++');
            DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.nombre);
        ELSE
            RAISE_APPLICATION_ERROR(-20001,'Esa empresa ya existe, ingrese otro');
        END IF;
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('2++++++++++++++++++');
        DBMS_OUTPUT.PUT_LINE(:N.id || '-' ||'ANTES: '||:O.nombre || '-' ||'DESPUES: '||:N.nombre);
    ELSIF DELETING THEN
        SELECT COUNT(*) INTO contratos_count FROM contratos WHERE empresa_id = :O.id;
        IF contratos_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('3++++++++++++++++++');
            DBMS_OUTPUT.PUT_LINE(:O.id || '-' ||'ANTES: '||:O.nombre );
        ELSE
            RAISE_APPLICATION_ERROR(-20001,'Aun no podemos borrar, ya que tenemos contratos vigentes con esa empresa');
        END IF;
    END IF;
END;