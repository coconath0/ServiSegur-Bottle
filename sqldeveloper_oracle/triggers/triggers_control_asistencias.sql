create or replace TRIGGER demo_control_asistencias
AFTER
DELETE OR INSERT OR UPDATE ON control_asistencias
REFERENCING NEW AS N OLD AS O
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('NUEVO:');
        DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.asistencia|| '-' || :N.sede_id|| '-' || :N.horario_id || '-' || :N.vigilante_id);
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('ANTES: ');
        DBMS_OUTPUT.PUT_LINE(:O.id || '-' || :O.asistencia|| '-' || :O.sede_id|| '-' || :O.horario_id || '-' || :O.vigilante_id);
        DBMS_OUTPUT.PUT_LINE('DESPUES: ');
        DBMS_OUTPUT.PUT_LINE(:N.id || '-' || :N.asistencia|| '-' || :N.sede_id|| '-' || :N.horario_id || '-' || :N.vigilante_id);
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('ANTES: ');
        DBMS_OUTPUT.PUT_LINE(:O.id || '-' || :O.asistencia|| '-' || :O.sede_id|| '-' || :O.horario_id || '-' || :O.vigilante_id);
    END IF;
END;