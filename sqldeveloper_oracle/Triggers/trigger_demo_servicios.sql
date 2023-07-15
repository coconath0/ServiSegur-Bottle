create or replace TRIGGER demo_servicios
BEFORE DELETE OR INSERT OR UPDATE ON servicios
REFERENCING NEW AS N OLD AS O
FOR EACH ROW
DECLARE
vigilantes_count NUMBER;
servicios_count NUMBER;
BEGIN
    IF INSERTING THEN
        SELECT COUNT(*) INTO servicios_count FROM servicios WHERE tipo = :N.tipo;
        IF servicios_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('NUEVO:');
            DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.tipo);
        ELSE
            RAISE_APPLICATION_ERROR(-20001,'Ya está registrado ese tipo de servicio, ingrese otro');
        END IF;
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('ANTES: ');
        DBMS_OUTPUT.PUT_LINE(:O.id || '-' || :O.tipo);
        DBMS_OUTPUT.PUT_LINE('DESPUES: ');
        DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.tipo);
    ELSIF DELETING THEN
        SELECT COUNT(*) INTO vigilantes_count FROM vigilantes WHERE servicio_id = :O.id;
        IF vigilantes_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('ANTES: ');
            DBMS_OUTPUT.PUT_LINE(:O.id || '-' || :O.tipo);
        ELSE
            RAISE_APPLICATION_ERROR(-20001,'Aun no podemos borrar, ya que tenemos vigilantes haciendo ese tipo de servicio');
        END IF;
    END IF;
END;