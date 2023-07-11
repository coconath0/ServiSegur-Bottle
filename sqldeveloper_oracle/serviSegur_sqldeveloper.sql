-- fondo_pensiones --
-- up
CREATE TABLE fondo_pensiones(
	id NUMBER(7) PRIMARY KEY,
	tipo VARCHAR2(30)
);

ALTER TABLE fondo_pensiones ADD (
  CONSTRAINT fondo_pensiones_pk PRIMARY KEY (ID));

CREATE SEQUENCE fondo_pensiones_seq START WITH 1;

CREATE OR REPLACE TRIGGER fondo_pensiones_pk 
BEFORE INSERT ON fondo_pensiones 
FOR EACH ROW

BEGIN
  SELECT fondo_pensiones_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- fill fondo pensiones
-- up
INSERT ALL
    INTO fondo_pensiones (id,tipo) VALUES (1,'PRIMA')
    INTO fondo_pensiones (id,tipo) VALUES (2,'HABITAT')
    INTO fondo_pensiones (id,tipo) VALUES (3,'INTEGRA')
    INTO fondo_pensiones (id,tipo) VALUES (4,'PROFUTURO')
    INTO fondo_pensiones (id,tipo) VALUES (5,'ONP')
SELECT * FROM dual;



-- dias--

CREATE TABLE dias(
	id NUMBER(7) PRIMARY KEY,
	nombre VARCHAR2(15)
);

ALTER TABLE dias ADD (
  CONSTRAINT dias_pk PRIMARY KEY (ID));

CREATE SEQUENCE dias_seq START WITH 1;

CREATE OR REPLACE TRIGGER dias_pk 
BEFORE INSERT ON dias 
FOR EACH ROW

BEGIN
  SELECT dias_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- fill dias
-- up 
INSERT ALL
    INTO dias(id,nombre) VALUES (1,'Lunes')
    INTO dias(id,nombre) VALUES (2,'Martes')
    INTO dias(id,nombre) VALUES (3,'Miércoles')
    INTO dias(id,nombre) VALUES (4,'Jueves')
    INTO dias(id,nombre) VALUES (5,'Viernes')
    INTO dias(id,nombre) VALUES (6,'Sábado')
    INTO dias(id,nombre) VALUES (7,'Domingo')
SELECT * FROM dual;

-- horas --

CREATE TABLE horas(
	id NUMBER(7) PRIMARY KEY,
	rango_horario VARCHAR2(30)
);

ALTER TABLE horas ADD (
  CONSTRAINT horas_pk PRIMARY KEY (ID));

CREATE SEQUENCE horas_seq START WITH 1;

CREATE OR REPLACE TRIGGER horas_pk 
BEFORE INSERT ON horas 
FOR EACH ROW

BEGIN
  SELECT horas_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- horas
--up
INSERT ALL
    INTO horas (id,rango_horario) VALUES (1,'00:00:00-06:00:00')
    INTO horas (id,rango_horario) VALUES (2,'01:00:00-07:00:00')
    INTO horas (id,rango_horario) VALUES (3,'02:00:00-08:00:00')
    INTO horas (id,rango_horario) VALUES (4,'03:00:00-09:00:00')
    INTO horas (id,rango_horario) VALUES (5,'04:00:00-10:00:00')
    INTO horas (id,rango_horario) VALUES (6,'05:00:00-11:00:00')
    INTO horas (id,rango_horario) VALUES (7,'06:00:00-12:00:00')
    INTO horas (id,rango_horario) VALUES (8,'07:00:00-13:00:00')
    INTO horas (id,rango_horario) VALUES (9,'08:00:00-14:00:00')
    INTO horas (id,rango_horario) VALUES (10,'09:00:00-15:00:00')
    INTO horas (id,rango_horario) VALUES (11,'10:00:00-16:00:00')
    INTO horas (id,rango_horario) VALUES (12,'11:00:00-17:00:00')
    INTO horas (id,rango_horario) VALUES (13,'12:00:00-18:00:00')
    INTO horas (id,rango_horario) VALUES (14,'13:00:00-19:00:00')
    INTO horas (id,rango_horario) VALUES (15,'14:00:00-20:00:00')
    INTO horas (id,rango_horario) VALUES (16,'15:00:00-21:00:00')
    INTO horas (id,rango_horario) VALUES (17,'16:00:00-22:00:00')
    INTO horas (id,rango_horario) VALUES (18,'17:00:00-23:00:00')
    INTO horas (id,rango_horario) VALUES (19,'18:00:00-00:00:00')
SELECT * FROM dual;


-- sevicios --
CREATE TABLE servicios(
	id NUMBER(7) PRIMARY KEY,
	tipo VARCHAR2(30)
);

ALTER TABLE servicios ADD (
  CONSTRAINT servicios_pk PRIMARY KEY (ID));

CREATE SEQUENCE servicios_seq START WITH 1;

CREATE OR REPLACE TRIGGER servicios_pk 
BEFORE INSERT ON servicios 
FOR EACH ROW

BEGIN
  SELECT servicios_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- fill servicios
-- up
INSERT ALL
    INTO servicios(id,tipo) VALUES (1,'Seguridad y vigilancia privada')
    INTO servicios(id,tipo) VALUES (2,'Prevensionistas de seguridad')
    INTO servicios(id,tipo) VALUES (3,'Resguardo personal')
    INTO servicios(id,tipo) VALUES (4,'Seguridad para eventos')
    INTO servicios(id,tipo) VALUES (5,'Custodia de mercaderia')
SELECT * FROM dual;


-- empresas --

CREATE TABLE empresas(
	id NUMBER(7) PRIMARY KEY,
	nombre VARCHAR2(60)
);

ALTER TABLE empresas ADD (
  CONSTRAINT empresas_pk PRIMARY KEY (ID));

CREATE SEQUENCE empresas_seq START WITH 1;

CREATE OR REPLACE TRIGGER empresas_pk 
BEFORE INSERT ON empresas 
FOR EACH ROW

BEGIN
  SELECT empresas_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- fill empresas
INSERT ALL
    INTO empresas  (id,nombre) VALUES (1,'Ulima')
    INTO empresas  (id,nombre) VALUES (2,'Fallabella')
    INTO empresas  (id,nombre) VALUES (3,'Reniec')
    INTO empresas  (id,nombre) VALUES (4,'Sodimac')
SELECT * FROM dual;


-- seguros --

CREATE TABLE seguros(
	id NUMBER(7) PRIMARY KEY,
	nombre VARCHAR2(30)
);

ALTER TABLE seguros ADD (
  CONSTRAINT seguros_pk PRIMARY KEY (ID));

CREATE SEQUENCE seguros_seq START WITH 1;

CREATE OR REPLACE TRIGGER seguros_pk 
BEFORE INSERT ON seguros 
FOR EACH ROW

BEGIN
  SELECT seguros_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- fill seguros
-- up
INSERT ALL
    INTO seguros (id,nombre) VALUES (1,'MAPFRE')
    INTO seguros (id,nombre) VALUES (2,'CARDIF')
    INTO seguros (id,nombre) VALUES (3,'ACE')
    INTO seguros (id,nombre) VALUES (4,'PACIFICO')
SELECT * FROM dual;



-- horarios --

-- up
CREATE TABLE horarios(
  ID NUMBER(7) PRIMARY KEY,
  dia_id NUMBER(7),
  hora_id NUMBER(7),
  FOREIGN KEY (dia_id) REFERENCES dias,
  FOREIGN KEY (hora_id) REFERENCES horas
);

ALTER TABLE horarios ADD (
  CONSTRAINT horarios_pk PRIMARY KEY (ID));

CREATE SEQUENCE horarios_seq START WITH 1;

CREATE OR REPLACE TRIGGER horarios_pk 
BEFORE INSERT ON horarios 
FOR EACH ROW

BEGIN
  SELECT horarios_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- fill horarios

INSERT ALL
    INTO horarios (id,dia_id, hora_id) VALUES (1,1,1)
    INTO horarios (id,dia_id, hora_id) VALUES (2,1,2)
    INTO horarios (id,dia_id, hora_id) VALUES (3,1,3)
    INTO horarios (id,dia_id, hora_id) VALUES (4,1,4)
    INTO horarios (id,dia_id, hora_id) VALUES (5,1,5)
    INTO horarios (id,dia_id, hora_id) VALUES (6,1,6)
    INTO horarios (id,dia_id, hora_id) VALUES (7,1,7)
    INTO horarios (id,dia_id, hora_id) VALUES (8,1,8)
    INTO horarios (id,dia_id, hora_id) VALUES (9,1,9)
    INTO horarios (id,dia_id, hora_id) VALUES (10,1,10)
    INTO horarios (id,dia_id, hora_id) VALUES (11,1,11)
    INTO horarios (id,dia_id, hora_id) VALUES (12,1,12)
    INTO horarios (id,dia_id, hora_id) VALUES (13,1,13)
    INTO horarios (id,dia_id, hora_id) VALUES (14,1,14)
    INTO horarios (id,dia_id, hora_id) VALUES (15,1,15)
    INTO horarios (id,dia_id, hora_id) VALUES (16,1,16)
    INTO horarios (id,dia_id, hora_id) VALUES (17,1,17)
    INTO horarios (id,dia_id, hora_id) VALUES (18,1,18)
    INTO horarios (id,dia_id, hora_id) VALUES (19,1,19)
    INTO horarios (id,dia_id, hora_id) VALUES (20,2,1)
    INTO horarios (id,dia_id, hora_id) VALUES (21,2,2)
    INTO horarios (id,dia_id, hora_id) VALUES (22,2,3)
    INTO horarios (id,dia_id, hora_id) VALUES (23,2,4)
    INTO horarios (id,dia_id, hora_id) VALUES (24,2,5)
    INTO horarios (id,dia_id, hora_id) VALUES (25,2,6)
    INTO horarios (id,dia_id, hora_id) VALUES (26,2,7)
    INTO horarios (id,dia_id, hora_id) VALUES (27,2,8)
    INTO horarios (id,dia_id, hora_id) VALUES (28,2,9)
    INTO horarios (id,dia_id, hora_id) VALUES (29,2,10)
    INTO horarios (id,dia_id, hora_id) VALUES (30,2,11)
    INTO horarios (id,dia_id, hora_id) VALUES (31,2,12)
    INTO horarios (id,dia_id, hora_id) VALUES (32,2,13)
    INTO horarios (id,dia_id, hora_id) VALUES (33,2,14)
    INTO horarios (id,dia_id, hora_id) VALUES (34,2,15)
    INTO horarios (id,dia_id, hora_id) VALUES (35,2,16)
    INTO horarios (id,dia_id, hora_id) VALUES (36,2,17)
    INTO horarios (id,dia_id, hora_id) VALUES (37,2,18)
    INTO horarios (id,dia_id, hora_id) VALUES (38,2,19)
    INTO horarios (id,dia_id, hora_id) VALUES (39,3,1)
    INTO horarios (id,dia_id, hora_id) VALUES (40,3,2)
    INTO horarios (id,dia_id, hora_id) VALUES (41,3,3)
    INTO horarios (id,dia_id, hora_id) VALUES (42,3,4)
    INTO horarios (id,dia_id, hora_id) VALUES (43,3,5)
    INTO horarios (id,dia_id, hora_id) VALUES (44,3,6)
    INTO horarios (id,dia_id, hora_id) VALUES (45,3,7)
    INTO horarios (id,dia_id, hora_id) VALUES (46,3,8)
    INTO horarios (id,dia_id, hora_id) VALUES (47,3,9)
    INTO horarios (id,dia_id, hora_id) VALUES (48,3,10)
    INTO horarios (id,dia_id, hora_id) VALUES (49,3,11)
    INTO horarios (id,dia_id, hora_id) VALUES (50,3,12)
    INTO horarios (id,dia_id, hora_id) VALUES (51,3,13)
    INTO horarios (id,dia_id, hora_id) VALUES (52,3,14)
    INTO horarios (id,dia_id, hora_id) VALUES (53,3,15)
    INTO horarios (id,dia_id, hora_id) VALUES (54,3,16)
    INTO horarios (id,dia_id, hora_id) VALUES (55,3,17)
    INTO horarios (id,dia_id, hora_id) VALUES (56,3,18)
    INTO horarios (id,dia_id, hora_id) VALUES (57,3,19)
    INTO horarios (id,dia_id, hora_id) VALUES (58,4,1)
    INTO horarios (id,dia_id, hora_id) VALUES (59,4,2)
    INTO horarios (id,dia_id, hora_id) VALUES (60,4,3)
    INTO horarios (id,dia_id, hora_id) VALUES (61,4,4)
    INTO horarios (id,dia_id, hora_id) VALUES (62,4,5)
    INTO horarios (id,dia_id, hora_id) VALUES (63,4,6)
    INTO horarios (id,dia_id, hora_id) VALUES (64,4,7)
    INTO horarios (id,dia_id, hora_id) VALUES (65,4,8)
    INTO horarios (id,dia_id, hora_id) VALUES (66,4,9)
    INTO horarios (id,dia_id, hora_id) VALUES (67,4,10)
    INTO horarios (id,dia_id, hora_id) VALUES (68,4,11)
    INTO horarios (id,dia_id, hora_id) VALUES (69,4,12)
    INTO horarios (id,dia_id, hora_id) VALUES (70,4,13)
    INTO horarios (id,dia_id, hora_id) VALUES (71,4,14)
    INTO horarios (id,dia_id, hora_id) VALUES (72,4,15)
    INTO horarios (id,dia_id, hora_id) VALUES (73,4,16)
    INTO horarios (id,dia_id, hora_id) VALUES (74,4,17)
    INTO horarios (id,dia_id, hora_id) VALUES (75,4,18)
    INTO horarios (id,dia_id, hora_id) VALUES (76,4,19)
    INTO horarios (id,dia_id, hora_id) VALUES (77,5,1)
    INTO horarios (id,dia_id, hora_id) VALUES (78,5,2)
    INTO horarios (id,dia_id, hora_id) VALUES (79,5,3)
    INTO horarios (id,dia_id, hora_id) VALUES (80,5,4)
    INTO horarios (id,dia_id, hora_id) VALUES (81,5,5)
    INTO horarios (id,dia_id, hora_id) VALUES (82,5,6)
    INTO horarios (id,dia_id, hora_id) VALUES (83,5,7)
    INTO horarios (id,dia_id, hora_id) VALUES (84,5,8)
    INTO horarios (id,dia_id, hora_id) VALUES (85,5,9)
    INTO horarios (id,dia_id, hora_id) VALUES (86,5,10)
    INTO horarios (id,dia_id, hora_id) VALUES (87,5,11)
    INTO horarios (id,dia_id, hora_id) VALUES (88,5,12)
    INTO horarios (id,dia_id, hora_id) VALUES (89,5,13)
    INTO horarios (id,dia_id, hora_id) VALUES (90,5,14)
    INTO horarios (id,dia_id, hora_id) VALUES (91,5,15)
    INTO horarios (id,dia_id, hora_id) VALUES (92,5,16)
    INTO horarios (id,dia_id, hora_id) VALUES (93,5,17)
    INTO horarios (id,dia_id, hora_id) VALUES (94,5,18)
    INTO horarios (id,dia_id, hora_id) VALUES (95,5,19)
    INTO horarios (id,dia_id, hora_id) VALUES (96,6,1)
    INTO horarios (id,dia_id, hora_id) VALUES (97,6,2)
    INTO horarios (id,dia_id, hora_id) VALUES (98,6,3)
    INTO horarios (id,dia_id, hora_id) VALUES (99,6,4)
    INTO horarios (id,dia_id, hora_id) VALUES (100,6,5)
    INTO horarios (id,dia_id, hora_id) VALUES (101,6,6)
    INTO horarios (id,dia_id, hora_id) VALUES (102,6,7)
    INTO horarios (id,dia_id, hora_id) VALUES (103,6,8)
    INTO horarios (id,dia_id, hora_id) VALUES (104,6,9)
    INTO horarios (id,dia_id, hora_id) VALUES (105,6,10)
    INTO horarios (id,dia_id, hora_id) VALUES (106,6,11)
    INTO horarios (id,dia_id, hora_id) VALUES (107,6,12)
    INTO horarios (id,dia_id, hora_id) VALUES (108,6,13)
    INTO horarios (id,dia_id, hora_id) VALUES (109,6,14)
    INTO horarios (id,dia_id, hora_id) VALUES (110,6,15)
    INTO horarios (id,dia_id, hora_id) VALUES (111,6,16)
    INTO horarios (id,dia_id, hora_id) VALUES (112,6,17)
    INTO horarios (id,dia_id, hora_id) VALUES (113,6,18)
    INTO horarios (id,dia_id, hora_id) VALUES (114,6,19)
    INTO horarios (id,dia_id, hora_id) VALUES (115,7,1)
    INTO horarios (id,dia_id, hora_id) VALUES (116,7,2)
    INTO horarios (id,dia_id, hora_id) VALUES (117,7,3)
    INTO horarios (id,dia_id, hora_id) VALUES (118,7,4)
    INTO horarios (id,dia_id, hora_id) VALUES (119,7,5)
    INTO horarios (id,dia_id, hora_id) VALUES (120,7,6)
    INTO horarios (id,dia_id, hora_id) VALUES (121,7,7)
    INTO horarios (id,dia_id, hora_id) VALUES (122,7,8)
    INTO horarios (id,dia_id, hora_id) VALUES (123,7,9)
    INTO horarios (id,dia_id, hora_id) VALUES (124,7,10)
    INTO horarios (id,dia_id, hora_id) VALUES (125,7,11)
    INTO horarios (id,dia_id, hora_id) VALUES (126,7,12)
    INTO horarios (id,dia_id, hora_id) VALUES (127,7,13)
    INTO horarios (id,dia_id, hora_id) VALUES (128,7,14)
    INTO horarios (id,dia_id, hora_id) VALUES (129,7,15)
    INTO horarios (id,dia_id, hora_id) VALUES (130,7,16)
    INTO horarios (id,dia_id, hora_id) VALUES (131,7,17)
    INTO horarios (id,dia_id, hora_id) VALUES (132,7,18)
    INTO horarios (id,dia_id, hora_id) VALUES (133,7,19)
SELECT * FROM dual;


-- sedes --
-- up
CREATE TABLE sedes(
  ID NUMBER(7) PRIMARY KEY,
  nombre VARCHAR2(60) NOT NULL,
  empresa_id NUMBER(7),
  FOREIGN KEY (empresa_id) REFERENCES empresas
);

ALTER TABLE sedes ADD (
  CONSTRAINT sedes_pk PRIMARY KEY (ID));

CREATE SEQUENCE sedes_seq START WITH 1;

CREATE OR REPLACE TRIGGER sedes_pk 
BEFORE INSERT ON sedes 
FOR EACH ROW

BEGIN
  SELECT sedes_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/


-- fill sedes
-- up
INSERT ALL
    INTO sedes  (id,nombre, empresa_id) VALUES (1,'Ulima-Monterrico', 1)
    INTO sedes  (id,nombre, empresa_id) VALUES (2,'Ulima-Mayorazgo', 1)
    INTO sedes  (id,nombre, empresa_id) VALUES (3,'Fallabella-Surco', 2)
    INTO sedes  (id,nombre, empresa_id) VALUES (4,'Fallabella-SantaAnita', 2)
    INTO sedes  (id,nombre, empresa_id) VALUES (5,'Fallabella-SanIsidro', 2)
    INTO sedes  (id,nombre, empresa_id) VALUES (6,'Fallabella-SanMiguel', 2)
    INTO sedes  (id,nombre, empresa_id) VALUES (7,'Fallabella-Miraflores', 2)
    INTO sedes  (id,nombre, empresa_id) VALUES (8,'Reniec-SanBorja', 3)
    INTO sedes  (id,nombre, empresa_id) VALUES (9,'Reniec-SantaAnita', 3)
    INTO sedes  (id,nombre, empresa_id) VALUES (10,'Reniec-Miraflores', 3)
    INTO sedes  (id,nombre, empresa_id) VALUES (11,'Sodimac-Ate', 4)
    INTO sedes  (id,nombre, empresa_id) VALUES (12,'Sodimac-Comas', 4)
SELECT * FROM dual;


-- empleados --
-- up
CREATE TABLE empleados(
  ID NUMBER(7) PRIMARY KEY,
  fecha_ini_contrato VARCHAR2(15) NOT NULL,
  nombre VARCHAR2(30) NOT NULL,
  dni VARCHAR2(8) NOT NULL,
  num_cuenta VARCHAR2(60) NOT NULL,
  fondo_pension_id NUMBER(7),
  seguro_id NUMBER(7),
  FOREIGN KEY (fondo_pension_id) REFERENCES fondo_pensiones,
  FOREIGN KEY (seguro_id) REFERENCES seguros
);

ALTER TABLE empleados ADD (
  CONSTRAINT empleados_pk PRIMARY KEY (ID));

CREATE SEQUENCE empleados_seq START WITH 1;

CREATE OR REPLACE TRIGGER empleados_pk 
BEFORE INSERT ON empleados 
FOR EACH ROW

BEGIN
  SELECT empleados_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- fill empleados
-- up

INSERT ALL
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (1,'03/05/2022', 'Ricky Blasio', '31762941', '00110057760240568000', 1, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (2,'15/03/2022', 'Sheffy Callaby', '40060172', '00110057730239716084', 2, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (3,'02/03/2022', 'Carlynne Bresner', '43563003', '00110057760240201756', 4, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (4,'13/02/2022', 'Gunther Winterborne', '85782537', '001100570254804585', 4, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (5,'29/09/2022', 'Brok MacAdam', '13738612', '00110057760276956931', 5, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (6,'23/03/2022', 'Ellary Seers', '88776119', '00110057740277262313', 2, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (7,'26/06/2022', 'Blinnie Wallsam', '47137301', '00110057780283687318', 5, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (8,'01/06/2022', 'Dunstan Marfell', '79567727', '00110057740285897085', 1, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (9,'22/12/2022', 'Riannon Heberden', '46315475', '001100570208929861', 1, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (10,'10/09/2022', 'Indira Pruvost', '88587765', '00110057730286541462', 4, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (11,'08/10/2022', 'Kendre Hustler', '87432971', '00110057790292858621', 5, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (12,'22/12/2022', 'Allx Byre', '19808352', '00110057710292858427', 1, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (13,'14/04/2022', 'Angie McArdle', '27047258', '001101440200420202', 1, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (14,'10/08/2022', 'Roxie Heaviside', '47254319', '001100570252278142', 5, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (15,'20/12/2022', 'Ayn Roll', '12961825', '00110057700294051857', 2, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (16,'29/10/2022', 'Cristina Gourley', '54276409', '00110057720296414280', 2, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (17,'13/06/2022', 'Royal Dobby', '70540405', '001108140229693471', 2, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (18,'03/09/2022', 'Kris Pontefract', '17952547', '00110057740275025861', 4, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (19,'11/09/2022', 'Lindsay Langstone', '24459613', '00110057750247011448', 4, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (20,'25/12/2022', 'Elbertine Ordemann', '56569896', '00110579060203348540', 1, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (21,'03/04/2022', 'Ado Blackden', '21879344', '00110579070203521676', 5, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (22,'29/12/2022', 'Inez Coughtrey', '48781969', '00110579090203521307', 4, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (23,'13/06/2022', 'Jillene Stennes', '30806763', '001100570299703771', 1, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (24,'13/09/2022', 'Guinevere Kleinbaum', '56695676', '00110579070203522176', 5, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (25,'28/12/2022', 'Hyacinthia Gonet', '52304514', '00110814160225663837', 4, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (26,'24/09/2022', 'Mile Trengove', '38529748', '00110579000203988965', 5, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (27,'27/09/2022', 'Adrien Gatherell', '24728828', '001102690200318521', 3, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (28,'04/08/2022', 'Atlanta Arnley', '96481372', '001108760200107970', 4, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (29,'27/10/2022', 'Arline Rosborough', '99980609', '00110579010204327563', 3, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (30,'23/01/2023', 'Alexandr Ashford', '65393397', '00219111217762102655', 3, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (31,'10/05/2022', 'Auroora Di Franceshci', '14088999', '00110579010207482268', 1, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (32,'27/09/2022', 'Evonne Boc', '89809262', '00110579050207482233', 5, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (33,'03/11/2022', 'Claudelle Helmke', '71959469', '001100570235900409', 4, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (34,'07/09/2022', 'Haily Jay', '13145076', '00110832020035205339', 2, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (35,'19/12/2022', 'Ammamaria Lawrinson', '48777214', '001104670200190351', 5, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (36,'13/09/2022', 'Cullie Halleday', '95033167', '00110579060212990522', 4, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (37,'15/06/2022', 'Elke Lumox', '31689525', '001103160200612777', 5, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (38,'02/01/2023', 'Pauly Colson', '69838547', '00110579030212806926', 5, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (39,'13/12/2022', 'Corry Dunthorn', '65956886', '00110579090212943001', 4, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (40,'11/06/2022', 'Hanni Dumigan', '51178885', '001109330200582473', 2, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (41,'05/03/2022', 'Coreen Tremolieres', '71957832', '001100570277368278', 4, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (42,'17/05/2022', 'Tristan Shavel', '46103178', '001100570240025427', 1, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (43,'02/03/2022', 'Lindy Brownhill', '43899914', '00110579050213542523', 5, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (44,'01/06/2022', 'Harri Headey', '73248378', '00110579040213886257', 1, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (45,'23/07/2022', 'Galina McCane', '30739249', '00110579060215029149', 1, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (46,'28/05/2022', 'Robin Dulwitch', '74077252', '00110579070215029653', 5, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (47,'24/02/2022', 'Therese Tremberth', '72425970', '001103830200488087', 1, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (48,'09/09/2022', 'Dore Tomicki', '30192897', '001101410200605508', 5, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (49,'18/10/2022', 'Pauline Skedge', '65831618', '00110057700292745959', 3, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (50,'04/01/2023', 'Dennie Gorner', '34499779', '00110579020215127825', 5, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (51,'11/03/2022', 'Debra Richardes', '31291798', '00110579010215305111', 1, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (52,'16/12/2022', 'Mil Chasteau', '63419208', '00110057790286612890', 1, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (53,'14/03/2022', 'Nikos Ogbourne', '47096510', '00110579050215499188', 5, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (54,'14/03/2022', 'Benoite Radmer', '78430414', '001108140211663214', 1, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (55,'26/10/2022', 'Vikky Walby', '65425370', '00110579050215542709', 2, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (56,'10/02/2022', 'Drucie Dansie', '25019465', '00110579000215549746', 1, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (57,'21/03/2022', 'Dredi Aspinal', '76330173', '00219110727730200952', 5, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (58,'02/09/2022', 'Ban Entwhistle', '17059180', '00110579080215728616', 1, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (59,'09/01/2023', 'Ramonda Goullee', '99268121', '001100570299866948', 1, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (60,'27/10/2022', 'Janetta Yele', '92920830', '00110579060215670782', 2, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (61,'03/09/2022', 'Bobbye Skitt', '46122345', '00110579010215670510', 5, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (62,'30/01/2023', 'Neilla Duffett', '43053955', '001108140237369535', 5, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (63,'09/02/2022', 'Greta Bispham', '78211876', '001100570275026027', 1, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (64,'11/03/2022', 'Wilmette Bealing', '50077916', '001103230200825612', 4, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (65,'27/03/2022', 'Harley Bisset', '11653853', '00110579040215728519', 5, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (66,'29/12/2022', 'Reg McCaffery', '97491474', '00110579010215768960', 2, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (67,'14/04/2022', 'Dorotea Waadenburg', '42743451', '00110579010215772127', 1, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (68,'03/09/2022', 'Kasey Collinette', '43252834', '00110579090215897736', 3, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (69,'06/04/2022', 'Fan Clemmitt', '73572585', '00110579030215841455', 4, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (70,'10/04/2022', 'Joy Pulman', '73139039', '00110579070215841463', 2, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (71,'19/03/2022', 'Welch Odams', '13868619', '00110579000215873160', 3, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (72,'31/03/2022', 'Madelaine Piche', '99404378', '00110579010215872792', 2, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (73,'13/11/2022', 'Dennie Bartolozzi', '17759801', '00110579060215873020', 5, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (74,'15/01/2023', 'Gilbertine Phorsby', '66198876', '00110579010215933724', 4, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (75,'05/04/2022', 'Walt Buttle', '21679667', '00110579040215940836', 3, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (76,'20/11/2022', 'Elita Chittey', '80049490', '00110579030216115294', 4, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (77,'09/10/2022', 'Cash O Canavan', '57188228', '00110579070215999830', 2, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (78,'12/02/2022', 'Catie Copper', '76947476', '00110579040216042513', 5, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (79,'24/09/2022', 'Mack Leyburn', '66156338', '00110579050216115170', 1, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (80,'13/04/2022', 'Avictor Fernandes', '71182952', '001101250200630580', 3, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (81,'29/03/2022', 'Patrica Gergler', '31156310', '00110579050216115146', 3, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (82,'28/04/2022', 'Maxine Cleobury', '64215093', '00110579060216114603', 2, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (83,'23/06/2022', 'Christie Caberas', '68692641', '00110579070216114565', 4, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (84,'28/03/2022', 'Bonnie Matic', '28583364', '001108140234692114', 1, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (85,'19/10/2022', 'Orlan Zimmer', '89884719', '001101620200691018', 1, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (86,'01/10/2022', 'Zacharias Kitchingman', '28470411', '001105790215229288', 5, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (87,'06/09/2022', 'Manuel Applegate', '58846681', '001100570271643218', 3, 3)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (88,'09/05/2022', 'Ilsa Berrecloth', '82174865', '00110579050216236822', 5, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (89,'20/06/2022', 'Herc MacQueen', '95403616', '00110579090216236679', 4, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (90,'01/12/2022', 'Godfry Lambal', '59915475', '00110579080216278207', 5, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (91,'28/06/2022', 'Baxie Ganforthe', '30430275', '00110579040216278134', 4, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (92,'23/01/2023', 'Fanchette Witcher', '72934637', '00110579080216294636', 5, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (93,'30/11/2022', 'Hanna Yesinin', '24947235', '00110579010216336630', 4, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (94,'29/11/2022', 'Sophie Lawles', '23920079', '001108140231462940', 1, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (95,'29/06/2022', 'Willie Jankowski', '48940540', '00110579010216336606', 3, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (96,'21/12/2022', 'Nannie Berrigan', '32376772', '00110057700292858885', 2, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (97,'31/12/2022', 'Lodovico McTrustram', '32137801', '00110579000216387804', 4, 1)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (98,'16/01/2023', 'Prent Bowdler', '40866533', '00110579030216387812', 3, 2)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (99,'13/03/2022', 'Annabelle Turl', '49730922', '00110057750292645679', 5, 4)
    INTO empleados (id,fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id) VALUES (100,'02/09/2022', 'Lacee Izachik', '87651933', '00110579050216449338', 2, 2)
SELECT * FROM dual;


-- administrativos --
-- up
CREATE TABLE administrativos(
  ID NUMBER(7) PRIMARY KEY,
  empleado_id NUMBER(7),
  FOREIGN KEY (empleado_id) REFERENCES empleados
);

ALTER TABLE administrativos ADD (
  CONSTRAINT administrativos_pk PRIMARY KEY (ID));

CREATE SEQUENCE administrativos_seq START WITH 1;

CREATE OR REPLACE TRIGGER administrativos_pk 
BEFORE INSERT ON administrativos 
FOR EACH ROW

BEGIN
  SELECT administrativos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- administrativos
--up
INSERT ALL
    INTO administrativos(id,empleado_id) VALUES (1,86)
    INTO administrativos(id,empleado_id) VALUES (2,71)
    INTO administrativos(id,empleado_id) VALUES (3,35)
    INTO administrativos(id,empleado_id) VALUES (4,44)
    INTO administrativos(id,empleado_id) VALUES (5,55)
    INTO administrativos(id,empleado_id) VALUES (6,63)
    INTO administrativos(id,empleado_id) VALUES (7,15)
    INTO administrativos(id,empleado_id) VALUES (8,57)
    INTO administrativos(id,empleado_id) VALUES (9,60)
    INTO administrativos(id,empleado_id) VALUES (10,14)
    INTO administrativos(id,empleado_id) VALUES (11,89)
    INTO administrativos(id,empleado_id) VALUES (12,22)
    INTO administrativos(id,empleado_id) VALUES (13,39)
    INTO administrativos(id,empleado_id) VALUES (14,54)
    INTO administrativos(id,empleado_id) VALUES (15,92)
    INTO administrativos(id,empleado_id) VALUES (16,21)
    INTO administrativos(id,empleado_id) VALUES (17,17)
    INTO administrativos(id,empleado_id) VALUES (18,5)
    INTO administrativos(id,empleado_id) VALUES (19,77)
    INTO administrativos(id,empleado_id) VALUES (20,25)
SELECT * FROM dual;


-- contratos --
-- up
CREATE TABLE contratos(
  ID NUMBER(7) PRIMARY KEY,
  fecha_ini VARCHAR2(15) NOT NULL,
  fecha_fin VARCHAR2(15) NOT NULL,
  empresa_id NUMBER(7),
  administrativo_id NUMBER(7),
  FOREIGN KEY (empresa_id) REFERENCES empresas,
  FOREIGN KEY (administrativo_id) REFERENCES administrativos
);

ALTER TABLE contratos ADD (
  CONSTRAINT contratos_pk PRIMARY KEY (ID));

CREATE SEQUENCE contratos_seq START WITH 1;

CREATE OR REPLACE TRIGGER contratos_pk 
BEFORE INSERT ON contratos 
FOR EACH ROW

BEGIN
  SELECT contratos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- fill contratos
INSERT ALL
    INTO contratos  (id,fecha_ini, fecha_fin, administrativo_id, empresa_id) VALUES (1,'21/03/2022', '17/04/2024', 1, 1)
    INTO contratos  (id,fecha_ini, fecha_fin, administrativo_id, empresa_id) VALUES (2,'09/03/2022', '14/04/2024', 2, 2)
    INTO contratos  (id,fecha_ini, fecha_fin, administrativo_id, empresa_id) VALUES (3,'18/02/2022', '11/04/2024', 2, 3)
    INTO contratos  (id,fecha_ini, fecha_fin, administrativo_id, empresa_id) VALUES (4,'19/02/2022', '16/04/2024', 2, 1)
    INTO contratos  (id,fecha_ini, fecha_fin, administrativo_id, empresa_id) VALUES (5,'22/02/2022', '02/04/2024', 6, 2)
    INTO contratos  (id,fecha_ini, fecha_fin, administrativo_id, empresa_id) VALUES (6,'24/03/2022', '09/04/2024', 8, 3)
    INTO contratos  (id,fecha_ini, fecha_fin, administrativo_id, empresa_id) VALUES (7,'28/02/2022', '08/04/2024', 7, 2)
    INTO contratos  (id,fecha_ini, fecha_fin, administrativo_id, empresa_id) VALUES (8,'11/03/2022', '29/04/2024', 12, 2)
    INTO contratos  (id,fecha_ini, fecha_fin, administrativo_id, empresa_id) VALUES (9,'11/03/2022', '28/04/2024', 18, 2)
    INTO contratos  (id,fecha_ini, fecha_fin, administrativo_id, empresa_id) VALUES (10,'15/02/2022', '23/04/2024', 19, 4)
    INTO contratos  (id,fecha_ini, fecha_fin, administrativo_id, empresa_id) VALUES (11,'23/02/2022', '05/04/2024', 4, 4)
    INTO contratos  (id,fecha_ini, fecha_fin, administrativo_id, empresa_id) VALUES (12,'16/02/2022', '20/04/2024', 5, 3)
SELECT * FROM dual;


-- documentos --
-- up
CREATE TABLE documentos(
  ID NUMBER(7) PRIMARY KEY,
  doc_url VARCHAR2(1500) NOT NULL,
  contrato_id NUMBER(7),
  FOREIGN KEY (contrato_id) REFERENCES contratos
);

ALTER TABLE documentos ADD (
  CONSTRAINT documentos_pk PRIMARY KEY (ID));

CREATE SEQUENCE documentos_seq START WITH 1;

CREATE OR REPLACE TRIGGER documentos_pk 
BEFORE INSERT ON documentos 
FOR EACH ROW

BEGIN
  SELECT documentos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- fill documentos
-- up
INSERT ALL
    INTO documentos (id,doc_url, contrato_id) VALUES (1,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHqSURBVDjL3ZHbThpRFIZ5i3kcLRYPqIgUGcDhNKBAqyKCobTR2NhiKmCstcWmBmtLPaCO4CQ6SBWVKInx0N70KbjhCf7O3ia0ZS686F0vVrL3Xvv7VvIvFQBVuOITQxfe6tj5IEPu9xW/ZxGcu2aJnAksxW9eYP42hmB5oBY48zAjJ240QoP7HH3j8xYhWgwiUgiAyxpFlTxZmL2ewvrPNBJX0wid+TF0zCsEHtEKGcbT4igWK0k8OwzBumGo0uZoeUCYuZzE0vUcVn6k8OSbUyFwyfDbSgKvShOIFsZgWTfU2K96pv5huOSm8KfvS/AXHAqBQ2CxcJFAsjwDe5YFgWkGdzCPoSMXHhed8BXs8B7YFALbVh/6Nx+RyWAzevR91qEu+Jf6XwRuecdkTSRp27YcVtaoCLE33Qn9sha6D+3oSrVB+07zO0RXzsx4chxmT18ifhqjSTcKej5qMbkfRVQM12EqILA8uRaRgnguhRE7mqJrahR0y5MjYgi+TTfsq1a0vVELVODYMVUJ/Lo0jZG8768d/1md71uhS2nBZxwYzwXRn2bxMNksqLgtoxgQ/RjOe2HK9FCrYaVLIehY1KB9oYVpnVfXnKscrMsmqBNNEm2a13ol05c7+L7SzD1gWpLNVXW8SST3X7gvtJUuvnAlAAAAAElFTkSuQmCC', 10)
    INTO documentos (id,doc_url, contrato_id) VALUES (2,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALISURBVBgZfcFLbFRVHMDh37mPeXQ6M8VaGSvYilRgqmLSKErcSdSVaGIQoytkx0pDQjRx5Up3btSY+IjGFRhWJCQaNYZEQA1YMGWqlXYs6XPK3LnzuI9zzt8aazQG+T4lItzMK8/uHbuzMnhkqNz/mGDMStD+cnZh9YO3Pz8/xTolIvyfNw7tO7T9js2vj+24e3TzsICUWF3qUb9aW7g0t/Tmldnld5SI8F8vPzXhjG0f+WR8pHywujXj3rLN4A7WsEmOYP5FbMZn5soP5uTX3x/0uIFto8PvP/LAxAvjlSYqvkBad6Cvn05q+Tj+jLzOs3/Lk+79u5ZecriB4YHC8zsv/Y4+eQ1ty9jsKK35A9Rr47iOQNLDj0KGSvmqN33qwYu5UrWqlMPfstmCLwnYjEen+AS1qXOtUt+kL5Vd+RNzeyiYhOcGariKoqfE2bn10Y98pRQI64SL3x5m9fE99PuWsLnGYmO6P1hzVd9glR4lHGmDsoB4HloibJKNF9/FJC44JbxNBS78eBbfRty3e4J779nr+K5DLpzhWOMcI7dvIfTz/Lpy/ZRHqhyxCSbJIFawvToT1Tad5QZ6eZFoZgqfv0TA7gLQmuS7a3ed/+Ls9KseSnJW9+gsLBMvzWCTLm62zMjTH6JQzP/yEznTJe/n0CYldgq0vjrKiW9+PnD89OU5j9TBy9/G0MOvARZEEBuiW2ew0VXKuQ6NxSZtkyKqy6axo/zp+OnLc6zzSEXERNjuJGICxITYaBbEIjYi4/SoVBLEtBHTJT9QZpV/eMSIWI1NVxAdICZAbAyiQWLEdhHTweoQMSEoxb95JCIKg+g1RDcR3URMgOgAMQGiQ8S0ENNBbISN66yL2OBJYq/rbqMvbWeK2KIj4oMtgtyKmBhIECcGEpRjMFEkktiYDZ5E8Vu/vffMQwj7UBS5GQHUmQQrn7LhDzEafwIN5+bTAAAAAElFTkSuQmCC', 4)
    INTO documentos (id,doc_url, contrato_id) VALUES (3,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKRSURBVDjLhVNLTBNRFD3TTju1FCcBaxuaQEr94ydiZIHGpcFISBOi0YREZWHCVoyRxKUxxq0LXcACQyLsjO6KjSEiDfHDz0S0CLSxlFKd2g7MTDudGd+bMAQCxJucuXfuu+fcO/PeYwzDALVoNMqRuI3guq7rR4g/SEBC/Svxc8T3EUTD4bCGTcZQAUI+RvxLr9d70u/3o6KiAm63G3Qtn89DFEUkk0lks9lRkrvW3t6e2lCgRZFI5F0ikaDtjN1MVVVjYmLCGBoa6qccC7Z1kQafz4f/WSAQAGlyaXOOpQ+SNNUymQxcLhc4joPD4TBzkiRBEASkUimEQiGzdlcBlmWRy+WgKIr5Xi6XUSgUUCwWzTVN+IAzeOOde71orP0eAaOkbrDWf6Cw2+3mBLSYgny3KULXPOUY2BUB/hMd4IOn8XfhMGYjvU+2TECLLRLDMNA0zYw5JYa6Ghke/hyEn9/gZEqo3OuHp7qW3yJgESjoNPSdlb8gWCOCr29BMT0Ip5tBYnIWqlL6o8irzVsEaHcKSqQCen4cweok+FAblNRz2JxlODx1cEkzGWmVbTl7Z/jHhgCF1Z3GYjIKf+U8+ANhQn4Gm6OMUiGI9MhHg5Gl1sbu8UnKNc8B7Ui3ipxEcwvlpVFw6hz2N1xGabkXdqeBYqEOmfefEZWac4e6xz9Z22hbn+BmLBZbi8fjEBdG4NF/QdUDSM88hQ4FawKJR6cxLDZl86qzZdtdoDYwMBAkQg/2LL/ovNLVh++Dd7G0OAau9hTkrKgnnE39GW3f/Z6enpUdBSx7ePu4eq+zi4VNw+TbV0gsxFd5b9X5i4+mpnY63tsErl6okhvrfWzT0SAMR3FMXsnean08Pb/b/fgHqpjCspi90kkAAAAASUVORK5CYII=', 7)
    INTO documentos (id,doc_url, contrato_id) VALUES (4,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGvSURBVDjLpZO7alZREEbXiSdqJJDKYJNCkPBXYq12prHwBezSCpaidnY+graCYO0DpLRTQcR3EFLl8p+9525xgkRIJJApB2bN+gZmqCouU+NZzVef9isyUYeIRD0RTz482xouBBBNHi5u4JlkgUfx+evhxQ2aJRrJ/oFjUWysXeG45cUBy+aoJ90Sj0LGFY6anw2o1y/mK2ZS5pQ50+2XiBbdCvPk+mpw2OM/Bo92IJMhgiGCox+JeNEksIC11eLwvAhlzuAO37+BG9y9x3FTuiWTzhH61QFvdg5AdAZIB3Mw50AKsaRJYlGsX0tymTzf2y1TR9WwbogYY3ZhxR26gBmocrxMuhZNE435FtmSx1tP8QgiHEvj45d3jNlONouAKrjjzWaDv4CkmmNu/Pz9CzVh++Yd2rIz5tTnwdZmAzNymXT9F5AtMFeaTogJYkJfdsaaGpyO4E62pJ0yUCtKQFxo0hAT1JU2CWNOJ5vvP4AIcKeao17c2ljFE8SKEkVdWWxu42GYK9KE4c3O20pzSpyyoCx4v/6ECkCTCqccKorNxR5uSXgQnmQkw2Xf+Q+0iqQ9Ap64TwAAAABJRU5ErkJggg==', 5)
    INTO documentos (id,doc_url, contrato_id) VALUES (5,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHgSURBVDjLjZLNbtNAFIXrJ8mL+QVQoVUWICFEFZCAbrJCAdpFWCC1i1QgVLEoZYFAgrY0rhPHTmwnThP/BKetU9vxT7I5zHWEhEBuWBxpFnO+c+6dWQGw8qfUisQNdnR+tD+ojQ9txz2wHPvdea1f7fDtssj9ff8fs7VnlCbCJRIzwsxNMfuZIuoGuPriwtjqlOSndS4XQMlkJuPcm2F+yXSxUGrHcD9YUDcbfC6AalMyGaNuiIvDEdx9C0FjwqAJfMGD/qRZywXQvFk6SxwfOOhvdwpGRSnYb/pslASxMYX6UHRuaDB0aGYCuO9N9J4rhW65VTC39AWgN0XnnpAPMHeN2lT1F3XrHqzXBsxXOq4+u0idGN7XMeTiaf4IvRcKP/5oIxlEWSKJjCTayeClhubaUf4SlWcCp5el0ujtEGHrOtt8asUIxQmGzCzdOS6JxW/5z5hBHguc9qjJdzekfqQGSM4jdFaFsHX7hG+sf7/5I5HaG2dV7UFD0+6K2lTxs8W1b536yuoPTVo72lwKUO+Lc6pP5nQYZ/uIeyGCMw+shbYUoBTrGYBE9UmhdI1A9CD/D0BaP6nKrC6rrZGRRGc5G+H401LAb5HBZ7WpOp3z7uUC2HtXqDKJJe/k3fsF8TkmWq5zP6gAAAAASUVORK5CYII=', 11)
    INTO documentos (id,doc_url, contrato_id) VALUES (6,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ8SURBVBgZBcHda5V1AADg5/d73/d42g66bF8ZTgbbxcpoKaNJXWQ3fUJJdRF5JxRF5EGEboIZ/QPiTeFNGF03GFiRUSZiUGxlSlnqtsZya6ustY9z3vPx9jyhfkRXacCEVBVARARABAA0ccvJfME7aWnAhOGDVX37STJiSgjEQIjEQAxICAgoWtz6rlr6ZEoqVdW3n3pC/xgJVn7izxliJImIJAiRoqDSTe8+eqeqKUgyYpkHDwEO0djg+jlunKW1jkBRIHB7mfJdtInaCCmbS1yZZPYiG6tkndz7HE+eYtc4INBoUGvQzMlJRcTA5hJXPyIG0kj3KKOH2THAQ0eZOc2Nc9Sb5HUaLWpEERH9Y7zwIY+9y9CzrM3y5VssXAD2vULfKPU6tSaNJjlRGxICsk56RnjgZZ44Rdcg0+8zfx44cJRiG7UGjRY1ooiAvy/z6ZtMn2ZjlayDR96mcg8XTrK+TKnC3meoNWm0yUlFxEgR2Vph4SuWvuX+w+x5lAPH+fgNi++9ZvHarzZ+uy4rp3avtw3mpNoQSArGj5NVWPiamQ/oHqHSZ3EluL2ybPT5I7YN3mfrx8/9fPEL6WYUQSzo2cuuMXpG2P0wa/9wZRLMTX9j6OCLyjfPC2de0jE7ac/ATvONIAUCWys0Nsk6WL1Jvc7vv4B89Q/l/kGeOgYgPXG3vB2kchRNtPjsGNkOFi5TbzL7PWdelXWWbf5wVufU6+pbyzbx31oiTUhODOvSf8e4O4cpVYgF23vZ0UdXHzEKMTN/7aqYRY1kw79/FeaWEt3t9qVQf1xXqd+EflVtNFFDjhw1NFm03dz6hrwVZElhZywuDa20n/4fCNbrcsCV4KMAAAAASUVORK5CYII=', 12)
    INTO documentos (id,doc_url, contrato_id) VALUES (7,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHySURBVDjLtZPvT1JxFMb5O/gHskVzrrV+mFZomDdEDGkYKSXlRleY6IzcFdQ7lBgYeaELBNjFEpbWi9psRU7JnCa3VYTV/WfY01davkFk0/XivDp7Ps/Zc86RAZAdpmT/BWDLmun+5ZuS5X0P+paMML82SKZXeroqYGDttty22it6Po8iWeCxIAlI/5pF9Osj3M8MwPCsXex8ekVeEWAlYn+OxaKUxNx2FKmfcTzfjiH2ncNsnsfIOzu00RZxT4B1pZee3GTw4vdfVyEfxkTWAdfyMMJfHiL2LYgImcSyeAstgQt0GeBuxiQl8iEIP/iSW/eCrtiV0rLXkm3s1ThVnN6cQkj0w511osl7TioD9L29QcaNY64QhWvlHrrmtey/niasclCcEqrp81B669HoPo0yAEmaBBcpuTOZQegF9S6gdUaJqms0vdRL3JYXQdEHLueD9snlovpxc2qnd8nfiIues9gXYEx30INLFvAksB1IIPcAd9LdaPY1oEcw4HqiE2ecJ7DvHegSlGh/Y0FgywP3uhPeDRae9TG4P7nArjHQ8W2oG1KgIkATUcmpYJNonjeC+TCMyZJwFOMfR+BadaCdo3DcdhRVT5kkTZOkC/VjJ3GKqUNHSA3NTCsR1+BAz1RrPwaFtQYH/kZF/5GKa/wDDtK86rC6fMkAAAAASUVORK5CYII=', 7)
    INTO documentos (id,doc_url, contrato_id) VALUES (8,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHxSURBVDjLpZPLa1NREIe/PKhSNK2g9UEIKqEFRSgooi4sCJqCuHEpduEDwZU7/wGhu27cdKWoG7WQrsSgKAV3SnFTAqZCW22xlAbTpL0xyb0z4+Ke5mHrqgMHfouZ3/lm5pyImbGTiLLDiG+KsTfLTRQ1wwARwMBUUQPRUIvCoxupSIcBwJF9XRiGKRhgaqiBtZmowtxKdSuBmGHmChTMDDNH44xUDVVD/G1aEAkRMUPVFW5q7TTxRbcamGiYaKCqmOIK1FEp6fIzDu36SSwYBO53biFQUDFE1NG0tIqSLE1yOr3KicwdMse+8HW0f7iDQANFXI8tklAnN3KcS03TM3AZ70eORG8KS61lcw+O320aBAGIaLP/dpM+8vSeuopU8+zen6QmSxweGuwOvNJ4y0AEkbiburvdwlWWgz780gLRWJFI1KMrUYRalY3leqyNwBBxxW76Cb/AmdgE3QcEDXyiugbRvZjf4NurQi1fqNxrIzA3g/D2ZH2K/uAdA5eGsMZ7IrLOzNsa5lUxhYW5ys2Rl/PZNgKlsFh1g4OLBz9x8kqGRnGceLyHmY8+r5euU9xzHgNePD+bDffvHsy/Z3Fy+HN9ZdS8wjWbfnxh/cmt9Mh2efH//bJf88UPlfLU0epv78/s7OrD20+/T2yX9xfxXpKxy4ipWwAAAABJRU5ErkJggg==', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (9,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKrSURBVDjLfZNbSFNxHMcX9WLgQ1h0kXrp/lhQdjGIEotegiCKiiIjjSx88SEpzZRIpWKFnGmCOubAS1YkmZlpXnLedtrUIpdTJ9N53Jnb2cy55fbt9z9OmQke+Jz/4fy+3+//rgCgCOfik7qjRD7BE3bCSQwQKlb7Xx9ujCQ4wv9Jb0H/qIRh0Ycxz19YHdP4zI+C1UKayCUBIXOdtmkAc4EgrBLwpsuN6l43Ohw+eEkUIFiNaZh2IWQhgGMFlx/y4yG1ptmF0vYpGF0BBOkfNZAC8/VQCCcH0MchImBx+KHRiTCJ86JavReqLyIGpyGPYIJeHmp9jGCQBQSYV+69nuZX2yuhqNmOwiY7+qzA7wlAZ/LQdGbhmAUECpBoKM45wE3Uz68JxwIMRosL6rZJChCg+irgPS+hsnWQCWyM121meMg0RqMxTQHGsTkYLRKrG1iA+MP6h3oWUEjmVxTSafaw4jgRHWI8tTweN0v2oarHJdNnnWEacTFA1SiAa5hAfoMNXUPLA+6UHcejmku4ULAHZZ0O9IYFGAwjTnCNNtlcQekmMYgU7THc1RxGkvoAEor348Hb86jsfoHUqrM4pdwCfti1OAV5EduHvDAKwOgMYHYDyZoYvOM5VOvzZWN5txLKhlSodXm4pY1HTM5aCvjILW6jn7ZGoD365QT0NuAGzZeZn9enILcuGY9rE5FZcx1ZH5JQ0JKNK6Wx2PlwlX/JQbLTdhntQKsFuFy0FxVdSmg7nkHdnofibzkUchuqliwkak9jd0aUMzpNEbHsKFvdQXynEZwr2I4zL7ciTrkRsU/X4WrJEXDNmUjQxJN5s/tE1r31K14mfkTCT5sP/eOz6DG7cDA3CtfUJ7ErfdNkXHZG1LLbuMJ1ZvA70iO82+6vxoY0xZpw/T9xhOmhB93shgAAAABJRU5ErkJggg==', 10)
    INTO documentos (id,doc_url, contrato_id) VALUES (10,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJcSURBVDjLbZPfa85xFMdf36/nebbGBcLaMmtM2DybElsjQm5c+PEnoKSQCzfEnZtduLRdSJFc4UK5sEizSLtQNCYXJMXKlMeG7fv5cc5x8X02w06dzqdPn/M673M6n8TM2H/6WruZ3TaoYPQYhhlgRh5s1lUCwU18GLpxfjVAgfzBMYP15bZVyfjXCcxmkiCHKabwfeIX085QK7RQtRwAO8ptTcmujiZWNZSxnICa5lU1r758cR11tQW2HTjOXwDMlpTbm7n//B2VyhSmCoDOqDDD1Pg+OUXmPHOt2gJJoVRg7cZmWuuXIgJmiqohYogqUY3pLHDrzuP5AIaI8nF8klJaJMsygvNEze8jCygUSyxbWIOazQMAVJQoAecch7a25vJzdZgZ1wffEmqL/JP/R0EQRUIkSsrNx29wIRLFkKhEEoqlEj7mQ50XEKPiQ8ArWFpDUixCamiiqCpeErz8D0irQyREIWYRF4QsClkQXIi4KDgvuKlnfP50iZZ1A5R3j7PvXOeFvxWIElzABcnbEcOLEkWR6ac01r9h84YuVi5dy+DoXYZfP7nYfbJxcTq3heBzgI/KdBB8EFxUpn48YtP6TiQVOhv2Ikmgu9wDcCKdWRgfhegiLihZEELQXL4TKj+/UEwWsX/DKQDO7LnCmhUdALWzMxAxxAsu5J6FiHOK98q3yQqjY8/ofXgYgN4Hh3k/PgKQzc6ANGVLVweWJIgYUQytxsQdZHhkgJ6O7dx71U8pKfD05RBAX2Jm7DzSd9WMo/nPm7P/GFTP1A5BzQtIPMAPoH/48tjZ3wRCz4QMKdc8AAAAAElFTkSuQmCC', 8)
    INTO documentos (id,doc_url, contrato_id) VALUES (11,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAFxSURBVDjLpZO/S1ZRGMc/5/aqIFhYKCKBOGTttYT1JziJsw26uQit/gHOOgQR7tHi0tjmWIGDPyIoGgQd1BCqe+8532/Dfd/7evEtFR84nOE853O+z/c5T7DNTaIF8GL98zIwATwDHoONCchkWSALIAklTvta/vrw/u0nyLycfRSwzfzap9e+Zqy+3bHtSgHwHODN1nEt7X+FLUzfZe/HaV6XgDzWOXwwOgBACL0v7x/mAPz+U/bXANuDnVe/HOVXMs8phS5AbnWkXTWUxHlAAFh6v4iUkM2rmQ2+HfzseXly/A5WAiCrABWtKApGxu5R5GWdPDTY31h1CbEBqDwviwhAnheNF8tkytTsixS7gFArKNug8nITY3HOg3bXY4ztPTWS+25d7KkduwBFGQgpJrY/7mGrTjz7VfRWoGqIWgBJ+g5MvlvYvOD2P0uwT7o/MWlzbuXDlO2nSMNSBAsrYUVwwhLV5NqgM8h2AcJNx/kvz3X5EBChVawAAAAASUVORK5CYII=', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (12,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAABxSURBVCjPY/jPgB8yUFtBdkPqh4T/kR+CD+A0Ie5B5P/ABJwmxBiE//f/gMeKkAlB/90W4FHg88Dzv20ATgVeBq7/bT7g8YXjBJf/RgvwKLB4YPFfKwCnAjMH0/8a/3EGlEmD7gG1A/IHJDfQOC4wIQALYP87Y6unEgAAAABJRU5ErkJggg==', 7)
    INTO documentos (id,doc_url, contrato_id) VALUES (13,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAMOSURBVDjLVZNNaBxlAIafb+ab2Z3N7Oxv/nYTEyv2LzQJpKBgrQqNUKmY4kUIXqUHT70p9iB48CKIiN5E0It6KFiwiv9FpAVpKUggNc3mZ7vpJpv9n93ZnZ35PNRI+8B7e9/n9gqlFAeIVUfPeN3zh0R0eVpYM1OanhvTCEY0f3tU79+ctnpfHM73fuQhxIHAWHnmkOGXPjgZyS09l5hnNv4YOdMhoQmigzqGt4nhfeub1fpnVsl/e+hMv/q/QKy+Me0EO5dfso/OvzB8grgV4HGXJC7jwAQ2oxxDuC36xZ+Rhe+v6iutZf2iqklReNe0tPSHZ2Nz84ujR7ht3iJKjcexiOIQI8SiixxcR7QtRORFlK7O9t0rlyy4KBEj5+YisVeez85wy9zGIUeGDDYhDhYOITYuoh2BvTJ68y7B0GnCym8XGq+KL2U0MrE8Z2SRVhqdPmlCsvgk8RlCkgAivRbUNKj1YPMeeu4wcnjRql7/+jVpyvxsPjbK3whi5LEAB0WWgBRgqwAaFah04X4V7puwdwddz+FXjJMSbXI8aSTYCgU2oKMwEdgCEoDhug/G5SjsmFDUoV+DXJ7BnpiUVCNBaJqEXfDVfwG6CjoKnF4crZGCVvNBug0IPXzPZOCnAunfk8W6ro7H2gK3A02gGoDeA1MDGx2nkYG6C24bvDaMSzq7ZfxBsiC7O+aNDaWOn0oLfl0HMwDlQRCAHYUkEGvFkLsp2G9Bo0n41AiNG6sMBvY1yZr6/JsV//XZZ3WZaEp2t6DvgWFA1QRHQbwjSDeTUGvCiSPU1ovU/typQPIrTV0yrrl3vE+/+8XlaCIgq8H+BtSLUN2C2ibsl8ArR+HYGE0rwvbvRTr96HsL6od1CUDDf+enK92JwT+982cWEswvRmiug6qAr0E4AV4uoFXosnV1g8bN5kcp7E8eOZOYKtmUqm/ZiDdfPhV3Zp6IM5k0SIUBstwmXKvCX5UdM6y9n2b34wV1IXxEcEBU3J4dprU0zODpjFBTIyoIxgjXxlB/PIl1eUmdLjzc/xceOVXddrB6BQAAAABJRU5ErkJggg==', 3)
    INTO documentos (id,doc_url, contrato_id) VALUES (14,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAADzSURBVDjLY/z//z8DJYCJgUJAsQEsMEZ5efn/f//+Mfz58weOf//+Dce/fv2C0yC8d+9eRpA+RkrDAO6Czi3vrpT7COnA+LGxsdeRbUTHZ86c0UQx4MfvvwyZi55cvXX7a8jeZvXrQEWKuDSDMAyAvdCy+cV/EW42hk/ffzOcvvP1zMNbX+JOTdW7TowX4GGQs/jFlVfvvzPdvfop+OxM/euenp5XYLb9/PkTbjPMWw8fPtRB8cK3n/8YVuUpasG99OOHCrqzkWMDwwUUx4K3t/d/fIGGnCZA+PPnz1ROB7a2tv+xBRayrR8+fGDEGQsDlpkACSYJhTJIjokAAAAASUVORK5CYII=', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (15,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAEsSURBVDjLY/j//z8DJZhhmBuQvdj8a+p8w//xc3U5yTIgeb7h18bNUf/DZ2j8958qz0nQgPyltv9zF5v/TV9o/Ddxrv7fmvWh/1ednvi/ZLX/f9d+8b+23YI8eA0AOvn/hnPT/q89OwWsccXpCf8n7Cn5v/B41/+MpW7/TdvZ/+o2M/LjNADoZLDmvl35/zt3ZP9v3Zb2v2Fz4v+mren/Zxxq/h+zwOa/aj3DH5wGRM/W/L/y1IT/S0/0/l94rOv/vKMdQEOy/k8/1PQ/banHf8VahlfSlQwGOA0InK74z3Oi9D/nftF/1t38/+LmW/2fdrDhf9Jit//ytQzPJSsZtEiKBe1mxq/xC53/y1czPAFqVic5GoFO/ipXzfxftJJBkeyUKFzOwDm48wIAh5XH+g7drOwAAAAASUVORK5CYII=', 9)
    INTO documentos (id,doc_url, contrato_id) VALUES (16,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJuSURBVDjLjZDLa1x1GIafc8uZqUlMMmmsLV7SC2hLCoJQ6tou3Lj0T+jGtQjusnLlP1Bw01UJgrqUoAiC2aixDUQl2oC9TjuZSWbOOTPn/L6La5MRfOHbvTy8zxe5O8fT3Hv9opt/784ZN0vcqN18F2P9hesPv/5X2d1P3Hj71VF4ctu92nEvttyPNj10b/vwh7N/Hu+mTImrzaYLb8PkMcgAwoA4n8PELhzvTgWYgtUPicIh+AQd70Mdo3JS9z8WODr8mdD9BqsLrDoi61zDBP7nAiPOz5HNv4nXT7HsFOaGip0E1Nuvzbv5rpudcSNx9TryCBn9hvR38EmBViPa569OVzC1T9KVj85lL70PPgEt81D+RfXHOu3ld/DWU5J8AC5oYBrAP05X3gMZgg5BC9L2CqE8IIl38fEILUdk0QoapiioAFbiUoA3WP0cmjEixsyLF/HWMzTvk8wuoNOeaGJouYce/oI1Xbx+QDJ/Hm2cuv87XpVEzQAvH3F6Keboq2VXpVaxXVPWUw1OlHVI2qvE2SKedXAfIMHJFy9hrS5N7znt618Qp7PABA/DfHJ0963ed59+FqsYURwj1R4yvIcMfyWdvYI0Tih7NAfP0EaJ82UIAxg/Ipo8obVwiabxC7EGNsa9bbK5y6Rzl8mWrlEd3CfJl9BTZ2m98S6Wv0z14A7uExxB5JDR/gZN7RupBNuq+3c/iE9fIckSwrig6O9RHfa+LX/8csHF12Zmom5n7qdXoCBOHSkfU3T/JtS+Fd2/01k14aap3VBlzYQdU9805dbVDwf7APufL66K+E0NfkOFNRXfUWPThFv/APJzrlrFns7aAAAAAElFTkSuQmCC', 12)
    INTO documentos (id,doc_url, contrato_id) VALUES (17,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKoSURBVDjLpVM9TFNRFP7ubWvb1x+QQAtRIFaRmEakaYiGiJaAurioiYsxXXVxMHESB40TJI5OOihxq0sZTDBq6kANikAJNLSBAokQ29q/1x/69673PoSoMS6c5Oa8c979zv2+k3MIYwz7MYp9mvb3IBKJ9HB3T7BSFAXcW8Q3P/KvWOTHXC5XaBdDRDIajZ7jflyn03VYrVYQQnZ+cr9bTJjwyWQSxWJxg+dv9vX1fST81SEevLXZbKRWlLE++wlyfBO5+BZq5ZIK1BkkWGxtsNoPoePUaTCdHqurqxzGLpDl5eVZDu41m8148+QBVoLv/qv5aP8QBm/fR6lUEsznNF6vd2xtbU3vcDhw7IwHBTmrXqxXymC1GpdB0XnSDvfFw7C0n0XXwGUYG5pUOYlEQtJyBrnh4WFLuVwG7wEGvHeg0WjUIoVCAay+jVx4FJbWfjQVMjB1diEej6t3uIQkTafTU3a7HQaDQaUVi8WQSqWQzWZR4wwK3yZhanbD2uZCfuMDVhYDKrharQoWE9Tn8z3f1ScKCGr5fF59XU6uIL8+CUtzI+o5P2zOG6CJ99BpqcqCMxihCwsLOQEWIJE0mUzQ6/WglKC6NYmW7ivA9ldMv3wFc2MJJL2E2o95wS7l8XjyVJZlRXRTkiQIKep4Uop6JowDrAzLwSKUcgxgCur5zzjiuYvU/DhQyYyqd7mWkNPpvOX3+8O8H8hkMqCEoRD1obGjF0oxxLEluK91Q6ls8l5F0OI4D33osX5vEsnO6EmBQOCFVqu92lRbIhKR0XrcyF+d5lormHkd5kVOgGgaAOMlfHk2EmeKMkj+3sZgMNhO5x5u9Fx/Cg1d47OQ5ln2x/5pjN34vjiHyMQjH/nXOk+NuZOsrkhM4YsklmjvsD2PneWa+QnIJn6IP3aTNQAAAABJRU5ErkJggg==', 9)
    INTO documentos (id,doc_url, contrato_id) VALUES (18,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAABjSURBVCjPY/zPgB8wMVCqgAVElP//x/AHDH+D4S8w/sWwl5GBgfE/MSYU/Ifphej8xbCLEaaAOBNS/yPbjIC3iHZD5P9faHqvk+gGbzQTYD76TLQbbP//hOqE6f5AvBsIRhYAysRMHy5Vf6kAAAAASUVORK5CYII=', 11)
    INTO documentos (id,doc_url, contrato_id) VALUES (19,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAANDSURBVDjLZZNvUBN0GMf3ot7ldb2q63UvuuuFd93Vq/ROMYyu9C4CCwE1uqHFOD3D1SxPUFCb5OBwBwMJMf5GjT/bMBhjILjGNraxv47JcGrIakIYAxT89BtXHdqLz7vn832eF99HAkg2UjhyYIugXRAR/CVYFswKumXD+995en6j+Izgh6TQf6sJe6wP0/QoutAonYEBOgLNHDLlPJL2ZRk+Mex57okAIT0rGGkMnufeooNQ3IsnPo424kQ/5afR6+Wya5x21wgV1jPkaNPdH7fvfn5jQFND4AxTC2b8CxZ8cz6csy6aJ338OBVG5ZhE+WuA74asaH0DVFgUpF9517AeIOS3BA+jD8zo5vR0zOvpjQ/Re9tLXfAGFz0hZHoHsh4Lp216NJEqHDNa3q9NXU1Tb9+dDPhJP1WN/Xc9LXNdtN23Yo25KXf6UNpuINU5yDcaOeLXoHYeJNj0EZNdpbgupVJS+YYnGRCd+KOHxmgt5bFLYrsXS8xF4S9OpF12iqw28iePUeLYxYxJzvyEDh7cZW6iA+P5nWvJgMXwvIlTwWJkk3I0dwdpidjJaR2jYGAYZegqSruCmO8EK7e7mTErSXh+ZnV6hPH6T5HIru1P3Jwz8Y37KAVuFfXTRnJbLOR2ekivuc6F/mri3q9ZS4yQuFlAfExG4EoeEw15vFf85rLks8HcO87ZTlTeU3wbHqTEdo3MRjvZ2hAntc3c93zF2pKFxfA+lqJ7WfAr8GtSMI+peF2x+Z5EFKNbG6hEN9XA4eunOelqJbtpFHltJTM2+T9yLku3svjTexy/+m2+139Onak4GTAoOaDLTBXFeOSJ6fnCeIgjA4WUNp3Fc7VInD3MUiSP5WgO8+KSgJCLLmZiDjcn5ceCrPUi7Wnd1VVuPkZPoAZlfQY+gwJ3r4o71gwWI3uJu77Epd6BXJ1BzVAxx9vy17f/18QPLqdtEsVwl/Uepv1cCixME9R8iEnxMqPVafSVbafBfBRjqAFFqzQphwQvPfFMO6u2bUq5sMVQIn2NFUsVK9YKrKXbaDv4Ct3D1WjMJ5LianKz4MX/feO/ZGx94WHZvlcf959No+7c1rUdis0JIfwmGBBkPz3/Nw6S0St8tXZAAAAAAElFTkSuQmCC', 11)
    INTO documentos (id,doc_url, contrato_id) VALUES (20,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJtSURBVDjLpZPNS5RRFMZ/7zgzWmqTFpObMiuyKDOFCoJaCUKKUFAUBRKtWrSpoP8gwk1BixbpppURtIigqAjKkgSp0KJP86NGbaYZpxmd9773ve89LTTKj1bdxblw4Pmd53Kf44gI/3PCADJyT0z+ByIaMT4S+IjRiPGQwANfERiFGBd8RezQDWc+IDBEth9dRBcBB+YKIDB169hiB142wTIRxLqzXQdELOAg/CE4oWLEd5d4gjFYPYnJ94H1ENGzt9VgFWIVYl2iqw9i/cISgMADDGIViD8n+lusEFvATfaTLq4ie+eizPx4gqMS7WEAM52etTxvsou1ag7ionPDeD+XU1V3glhNA9nhWt4/6OwIA9hAoT71YLzPEGgQQ6BylFTHEVtA58agpIHK+C4yQ++IOpryFVWUrVoXCwMEbhqTS1C28zhgsXqU/KubSFDAn/kGxTuI1TTjTXQTXe4w+vo9vtJp5U7vDQE4IvjJAaYenScofILAx4qPl/+KhLcS29iCGr+OE5kiUlZOSWHou5+baNp15vbH0O//Lt/djp9NkX16GSs+mfQ42m4htqkNlbhGKOKjc+tJPn6OzhdaG88+fA0QAsAonKIQpY2nELOSsftd2JV7iG9rQU92UhQVvFw1qWf9RFJ9bD7X178gB4qp+1cQoxhLZihrbMNInInBq1TEo6jMWjJPewinX2K1mpcDZ+Ey3epoksOnu/jQfZ7xkV6K19VjkqnximhRc92FF28Wxj20sPHh86TRb+9SU7+P0tJaEv2D08rVB5YSL+ngyP5Kt3HDmvDurTVIxOt1k6mTrZcGvvxrnX8BwNty8Brb9FgAAAAASUVORK5CYII=', 5)
    INTO documentos (id,doc_url, contrato_id) VALUES (21,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIuSURBVDjLjZPBaxpBFMY/E5u1MdZuNFgVaqsHoSCE0BzEm6eehFxaafGQQ1oCtodCj14tFq8pveVP8NCTUForCLnYSwVbexHrrhFtm4jiqjuznRkxRDDBgeENb9/83vfe24FhGFhmt8JhY5F/BUuuj/v7C/0mTpmtarVqEEKg6zpmlu9Op4NSqQSPx4NAIIBYLGaa3TFfpk0mE/j9fnG+DObnaDQqbD6fn1MwB+DZ+Pryc1oZYQxCAWpQpgh49EDHaDS6GjAej0WWnTv/FjYSuL0c4KQpi6w6nSrQWXZKDext69A07XoAX7vu7hXjlK9XwD/ywK/1TVa/IRRQMu2FwRQ8eTi5XsE5OcNwOIR0WkSj0YDD4UC33UYkEoHNZsPx8ScxynQ6/VdRlLeVSuX9BeDNyeE9s03Cea4nxplIJDAYDNBsNlEoFGC32/n8YTab0Wq15HK5/I4l2boAUErv/6mdAb8bePz0GVKpFA+E2+1GKBQS52w2C7WlYsNh/fby4NUOAzwXgNelF7dM1PRZq4+xvrEugPyHqtfriMfjkGUZ/X5f/JFHH45AtkebPIapkgSA6OSQ6NTor/VM6qkiALVfNa4KmUwGVqtV+HhJYI1d+37zLnYB1gdNvIVkMmnMAnq9HsLhMLxeLywWC9qsibVaDZIkwefzweVyYagNoSoqisXij7nHFAwGV1nNIZYxx7q9xS6tMvdKt9s9YFZxOp05Zm+wcRNVVTss4d5/6EF77ncyqQUAAAAASUVORK5CYII=', 4)
    INTO documentos (id,doc_url, contrato_id) VALUES (22,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKrSURBVDjLpdPbT9IBAMXx/qR6qNbWUy89WS5rmVtutbZalwcNgyRLLMyuoomaZpRQCt5yNRELL0TkBSXUTBT5hZSXQPwBAvor/fZGazlb6+G8nIfP0znbgG3/kz+Knsbb+xxNV63DLxVLHzqV0vCrfMluzFmw1OW8ePEwf8+WgM1UXDnapVgLePr5Nj9DJBJGFEN8+TzKqL2RzkenV4yl5ws2BXob1WVeZxXhoB+PP0xzt0Bly0fKTePozV5GphYQPA46as+gU5/K+w2w6Ev2Ol/KpNCigM01R2uPgDcQIRSJEYys4JmNoO/y0tbnY9JlxnA9M15bfHZHCnjzVN4x7TLz6fMSJqsPgLAoMvV1niSQBGIbUP3Ki93t57XhItVXjulTQHf9hfk5/xgGyzQTgQjx7xvE4nG0j3UsiiLR1VVaLN3YpkTuNLgZGzRSq8wQUoD16flkOPSF28/cLCYkwqvrrAGXC1UYWtuRX1PR5RhgTJTI1Q4wKwzwWHk4kQI6a04nQ99mUOlczMYkFhPrBMQoN+7eQ35Nhc01SvA7OEMSFzTv8c/0UXc54xfQcj/bNzNmRmNy0zctMpeEQFSio/cdvqUICz9AiEPb+DLK2gE+2MrR5qXPpoAn6mxdr1GBwz1FiclDcAPCEkTXIboByz8guA75eg8WxxDtFZloZIdNKaDu5rnt9UVHE5POep6Zh7llmsQlLBNLSMTiEm5hGXXDJ6qb3zJiLaIiJy1Zpjy587ch1ahOKJ6XHGGiv5KeQSfFun4ulb/josZOYY0di/0tw9YCquX7KZVnFW46Ze2V4wU1ivRYe1UWI1Y1vgkDvo9PGLIoabp7kIrctJXSS8eKtjyTtuDErrK8jIYHuQf8VbK0RJUsLfEg94BfIztkLMvP3v3XN/5rfgIYvAvmgKE6GAAAAABJRU5ErkJggg==', 1)
    INTO documentos (id,doc_url, contrato_id) VALUES (23,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGqSURBVDjLlZM7S0JhGMfVox+gqYZuQkMETYZNQmi2+QGKligiCBoalFragoqGzDM41NRQQy4VKDhUSyC0NLR1EeKIt7wePV7/vc/BI97NF36cA+f9/97neQ6vCoCKrVGGgWHswyRDQxkFVU1gkCQpWSqVKuVyGZ1g3+Fyuc5aJYrASOFsNgtRFOukUikkEgmEw2FZEgqFwPN8k4SWmgS0IZ/Po1AoyE8ik8kgmUwiEonIglwuBzrE7XbLkjYBhRVIQIF0Oo1oNNrWUm0m6iYBa6O+gd6pb6WVWCwmVyIIQndBK40SqoTmEY/H/y9olFA7NBMSDSQgisWiPBeSEAMLqIrvWyde1mbgt+jwtDIBfl7D9xRQSCHoOceb3YT8wymq716I17sIbM9WfGbtTl8Blf+8OoUcC8NpAxxDwKEe0eMF+Ba5z75/gaCyq68eNK7EwQj8Zm21UVDtNoPH5XFkL9YBFpLsKvwyglscfFbuR7kLc2zKItvc8TJ93ZwgsDkNwaFHZE+Hjw01/DZtxWvl9hXBGEl6XeXLpWH+zsIJVPa9hQtfmbgjyv4BPlWugike25IAAAAASUVORK5CYII=', 4)
    INTO documentos (id,doc_url, contrato_id) VALUES (24,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ3SURBVDjLpVJdSJNhFD7bp7Js6qaUDqmxEFfRQFmZ00wjXYK2kgX+h114Ed5siZf9aIWFUSLRReVFgUElGVkURDCkKI3NlKIaRYmWmJmSue3b+9f5DGuBBNoHLwfe7zw/57yPSggB//NFLQcUKHG4BCEuESbt6uUQCDncqNm3x4gEbtVSR5jbuStGEPoaHSRibV7yCDxMWhH8HsHpCd6n7J8E9mPDLsGZmzN27tHJze2z23aUIbAcCTITfM+Y0qMiDQd7gNJSQdnd6MudZZEEhYd9Y5VbpFRZ9kJmlG/OdOGNdC0+58wNg03ijFZxTnGJhJZKjt1RuBCHXFmV9QfszccmbXf/9Lfc2MeTZkvBytFiw/h1Q/Z6xkhTuS3eyCh1qeQDdT0Kya/FUC3am7yjt769aCjMp4Lv7yzoyNeZHM26Ndnw7mHTjODcXnO/NpdzdggFzv71CkVHBmNKxp/cy5sY3Jo2MxKiejY7VZGwzlhUD0D8EAia4VP/+V7BuNNS84AoGHXEvCmMUc/tJOsXt7kuGdddPJsZbUqy1gKEfDBwtQu0uiDQULgUj2MBp7YfHXLhvONo5yWnpMdzylbd15YXHG3QrobtWao4fQC4/AHTw4H9eA6mgkYVleXjAx22uHkCVHXtzYhGdcI8p3PalMuhK/YYVDmhW5sBPDCM2CBYnWY09Rk0Gj8kWyo2UDnsnifgjLTf7P8+guqtC7aYHK5PTCuxxsZ9BUGn8LEl8N7yKzECHvLDqnQj9pCGvpZNGxeNMtobs1R3pUrqj0gwraQ/4q8apBVmmHj1Avy9Ld2LJhHtaXyXnEHBBdrnEUf8rqBUIVJ+AugPahHelS39AAAAAElFTkSuQmCC', 6)
    INTO documentos (id,doc_url, contrato_id) VALUES (25,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKsSURBVDjLfZPLa1RnGIef75zv3OLEDObWqcaYYJUWgqa40MmilioE2kI3XVXRFsmqUAqi/4G7brpxpaLgpUIEcaEW23RbKRYqASfKJOIlMbfJZDyTc/kuXaS1BmNfeBcv/Hjeuzh/494PxoivmpkJU8WbZteGnoTQ49yxLz78HkAaKw59NtTTGYahEMLl/ywxoFXOtV8fHQVWAc3UBEEQigu/1UhYoCEq9HXPEnl1lDUsLkeMP2qjxb6PpJ3jX/ahjRD/QmWmwHFcHAGZM0NfxyyB/5h62kBphQwC+ntKTFY3UPQ7MGZtVRLAAI4jSO0cvldjaaVOqhMypVA2JggC4jSiPXKw2DWD+Q8gBFYZUp2TqJSVPCUzCm0AkWONRjoCa+2bFVi7CgjppBFPY12P1MRkSuO5EXGjQKtfYjC/RH53li1Jvw+DADivAI6g4G7m2Uw3yUKBFruJVrEJtdjOzJMSZa9K+YMapfIRBrvuh/dO7RgGkPZ1gNfFu9EgT/8co1h4jtAaL+nk455eDvRVadt5kPjxTTZs7BVqa3305nf9x161UFkYQRuDNoYd6Rz7enoxQHX6BZG9QXHgW3RznLBjC4l+Sumj3S0qrp2W1loEMLx6WAC4A0s04wXC6b/oKI9QmLpDXpvCcecRToy/cR6SJi+nU1eKde5VR0V0VMT4Hu88vIgXWYyawTFL4LRi84wHVyrJeGV5RIaeqGPytl3de0GIf1CWpHqLZOoXuvYMYbOfEbrBg9spMk3Ic20nqsuHDl+eHJW+FD+NjlX3ZdoOvL7i/eJ64b2hT9xs/jRStjE+ltm7zU8TubWc++QXj57cP7qay9p1/cm14d/TF6dsXPnc/vFjuXHm6+2H19PJt33e88n5O8v1sW3NxXhlYmLuxDdnH15dT/c3MC9g0QGCji8AAAAASUVORK5CYII=', 3)
    INTO documentos (id,doc_url, contrato_id) VALUES (26,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKKSURBVDjLjZJLaFNBFIa/ufcmJjHa1tYoiCIiPhCfoNKVoCIuFAWFLqS+QKXo1qUg4lLBhYIgNiiCBBRBxbe0Iqjgo7WgFsWmtmbRhlhNSczNnTnj4ta0xY0Dszhwzj/f+f9R1lq6u7u3jj65cF8XcuihLFvSvev5vzOsurq6VhhjXkhQmepiyF88zObLH/5r2vO89V4mk+ltbm4+Fvt4L51sBCwEQTCpUUSw1k6q4/F4KNLS0rLEGHNeUq24aIrPOv55yXEcRKRWK6VqgjWCaM+99LSUBQkbAE7dHEIELIQDAgKc3N00vkaNYGYrrtL8etpZExCBZXPjYwLhfd9fAsAYA4Db0NAwUldXN1h5eWOnU+yhku1n4a6jHG//QkxVGRj6hV/x+fS1QG64SMyt0tEzws3n3/lW0C8nEOzFVZqRJyHB73KFjesWs2NNkruvvnNiz9JJvlztzCPS1u5kMpneXC53LP/wCqW318BarLWU/YAfoxqAx2+GaoMVDUUf8j+rKCUTPdiHi2bkUceY8wrXQmCEs21rELFYwMWS8MD3fYql6ngKzus76ekpi5jQ8VjEoeIHnM704yjQRhAj44lYSEQmEezHQVO434FSCi0W32hcJwJYFCbMXyzWCloHVKt6AsGr2+lkSiBMh9FyQER5tG2bhpYq4IAFq4SYF+XM9QEKxdIEgu0HQoK7nbiuixGLSwThN+3vjtCUmIfCIV8e5NDaczjEKPtjHmitl6/+9KAvMSOOtZDNZvE8l/mzYVZylE0r11EfnQMO/KzMITVVk4iCpxTq758+sKhxw7xkdGOuFAxe/lzoWXXw1qUlC5pW1E+pJ+ZNR0uAEkFZg6gyvQN9DBcD/gCIAXUVRPlHKwAAAABJRU5ErkJggg==', 5)
    INTO documentos (id,doc_url, contrato_id) VALUES (27,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAI9SURBVDjLjZM7aFNRGMdTA+Jg8UFx0qGDi4PgoERE6qCIUJxEwcFOdhPEdhB0FVQsmRRbaM1mhdIhtUVBwzU2mPf71bzfuTEUb9repiVNrr8rNsQaJcOf795zz//xffccjaIoml3IsrwP9KnPlUrlWOe3f0GzR0Cr1mq1eqhcLk8Xi8X5fD5/ricB1bnD/Qnkl7lc7mEmk9lIpVKWeDx+o6vA79gqtGotlUoHIOcQuZnNZvWQX4HxaDSaDIfDbwKBwP69An2dgHyH2JtASCaTfoSGVlZWPodCoXuQjV6v1+d2u093nUGhUNAS20b/C7huETsM2RiJRCZIdtHn8y27XK5vDodjuasAkS+DFCk+pdNpN2QRZxmBEZxtfr//fiKRuG61WtcsFsuDvwQgzeO8GovF1MFZqRHaMHo8nh0wS/RxyF6VbDabi4IgDLTJEE6hnqDGcZQZ2A9amsJVJMlHu92+ZbPZRNYvITAKOWsymUbaAvT7mknXgcSmPANbJfYGKT7gXGRNUAUgrzmdzq/sG263gPFxXDI41yA2+ehiYGUGtslmiRROyOr7AjM5/8dvbL57q9teWvwiLr6vBYPBdZJ42NjEVaKW6LlGnWUGg10P0s7MtKE1N6c0nj5TKhN6kdg1XOv0vA5xivrfO6HZfvRYak1OKi29Xqnfuq3Enr9oEHOJI3yyp8skXxs2NO6OKq2xMaV+5aoiXhgSOJH9vZB/CUhnzuq+nxg0FI4MSLmDhw35/qO63cvVi8BP3IoJNAAt5FMAAAAASUVORK5CYII=', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (28,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJJSURBVDjLpZNNbxJRFIb7A/wF/A5YunRDovsmRk3cmLAxcdG0uiFuXDSmkBlLFNOmtYFKgibUtqlJG6UjiGksU0oZPgQs0KEwMw4Dw8dQjnPuMCNq48abvJub87zn4547BQBTk7q2CDZdDl1OXdNjOcd3tj/jJ8Eruuxzb2RX+NMpHT/MMUfHJwKbSgv7Bxnm9YciPRMSXRiDsb8ZjOGrwWjNzZ4UOL4pg6IOQLsYEbU6fajWRYgdpLilnYIbY00T08COcCrzTen2NMCj9ocgKgMQdLV7Q3KnqH3YTyQV/1YWTezEAPvCsjGzCTfkPtR/9IGXDNWkHlTFnmWysxfj7q/x2I4NDRxh5juNZf8LPm12ifBkimdAheI0smjgjH3NMtgzlmqCNx5tGnq4Abe9LIHLjS7IHQ3OJRWW1zcYZNFgOnl0LOCwmq0BgTEjgqbQoHSuQrGuEqO+dgFrgXUBWWJwyKaIAZaPcEXoWvD1uQjc8rBQ4FUio4oBLK+8sgycH7+kGUnpQUvVrF4xK4KomwuGQf6sQ14mV5GA8gesFhyB3TxdrjZhNAKSwSzXzIpgrtaBbLUDg+EI9j6nwe3btIZoexBsuHajCU6QjSlfBmaqbZIgr2f3Pl/l7vpyxjOai0S9Zd2R91GFF41Aqa1Z1eAyYeZcRQSPP6jMUlu/FmlylecDCfdqKMLFk3ko8zKZCfacLgmwHWVhnlriZrzv/l7lyc9072XJ9fjFNv10cYWhnvmEBS8tPPH4mVlPmL5DZy7/TP/znX8C6zgR9sd1gukAAAAASUVORK5CYII=', 9)
    INTO documentos (id,doc_url, contrato_id) VALUES (29,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAC6SURBVCjPfdHhDoIgFAVg6jlq6x10vGdbrQfsR7bcskSTgE73gjAtirP5Qz/hsiNEWIuvpLUWhZCZbMQygEK31ll85rCNRPJnjQc6SosrzjgSUNiNRLLXGNATUmhQo6I3PU7YMwngSSBE4YbLeMwAmiUC3sP4Z0ekpjCbAeP/Mp60uBObAONjE+GR1RTYCbD+KL7XDMwTZvoDjL9XBC4PaGzHoNSdfWV3cUNDPVFZZbYsTiFWv8pOhb8BUJ5M7qO6PVQAAAAASUVORK5CYII=', 1)
    INTO documentos (id,doc_url, contrato_id) VALUES (30,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHySURBVDjLtZPvT1JxFMb5O/gHskVzrrV+mFZomDdEDGkYKSXlRleY6IzcFdQ7lBgYeaELBNjFEpbWi9psRU7JnCa3VYTV/WfY01davkFk0/XivDp7Ps/Zc86RAZAdpmT/BWDLmun+5ZuS5X0P+paMML82SKZXeroqYGDttty22it6Po8iWeCxIAlI/5pF9Osj3M8MwPCsXex8ekVeEWAlYn+OxaKUxNx2FKmfcTzfjiH2ncNsnsfIOzu00RZxT4B1pZee3GTw4vdfVyEfxkTWAdfyMMJfHiL2LYgImcSyeAstgQt0GeBuxiQl8iEIP/iSW/eCrtiV0rLXkm3s1ThVnN6cQkj0w511osl7TioD9L29QcaNY64QhWvlHrrmtey/niasclCcEqrp81B669HoPo0yAEmaBBcpuTOZQegF9S6gdUaJqms0vdRL3JYXQdEHLueD9snlovpxc2qnd8nfiIues9gXYEx30INLFvAksB1IIPcAd9LdaPY1oEcw4HqiE2ecJ7DvHegSlGh/Y0FgywP3uhPeDRae9TG4P7nArjHQ8W2oG1KgIkATUcmpYJNonjeC+TCMyZJwFOMfR+BadaCdo3DcdhRVT5kkTZOkC/VjJ3GKqUNHSA3NTCsR1+BAz1RrPwaFtQYH/kZF/5GKa/wDDtK86rC6fMkAAAAASUVORK5CYII=', 4)
    INTO documentos (id,doc_url, contrato_id) VALUES (31,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGkSURBVDjLpZM/T8JAGMZf/gRU0lgU1EZDok5KSIwOfgKJhsGlgyaOfAE/Abo7dNfQ1W9AmNk0kjYO6ISLk4tBDJb27nzfKyWNFhLjJZeXlnue5/feXWNCCPjPSEa9bLfbpud5Z67rJrECVjmHwyHVW13XTyMNbNueR8GNqqp6Oj0HDoqAc5CMSJrNqtBsNk7w6beBZVmHJM7lcquZTAa6L69A6ZwL4IKjkQCGZo7jRLeAixuFQkH+Hgy+wEXxo/2ABnw8D8pHso1IA+oxlUpBr9fzkxmD7eKOTBejdNrwiQTkzFBEi+hgCN227rEymU7/aZXj6QT+Xgm5mAyKpV2ZHlCIiD2IhwkCA2lCyczv/U3pQv3dAB5aF9nCWDwSBun152v4/PDk80QDQgtuJYn4CJnju/PFC+ALRMfHrUYS0CkkEgk/mXEpIAOfxN/cnwTxEMFdq9WCfr8PiqLAzGwab2BMGjHh0xDhRIJqtbpvGEal0+lcapq2t76xCUv5NSkIWltZzss7Eh6xqK+xVquVUXiFsxR8TFRp4hE/maa5NdXgL+Mbb/xsAcKofWEAAAAASUVORK5CYII=', 7)
    INTO documentos (id,doc_url, contrato_id) VALUES (32,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJFSURBVDjLpZNfaM0BFMc/v7s/pv25tnsXlrzo2nav3d3y4CaelqLw4l1JEVaUl1GeUHtQXpiSUvKqZFFWJtFajO62K/KwlXQn7syfe+3PPX883AkNKefl1KnzOed8zzmBu/M/Vvm74OnMiayZJlTNVfXO2fT5nX8ChJYm9zRhJFrrWok1xAJRTf+tgyWAU6neDwuyUCx5ieJCEREZ+xsgcHfOjJ50M0XV0LL39sa2QEwYnRr7JKKqqiER4cru641LNFBT1tfGMDfMHccCNcMd4s3xsLribjyeePp7EVUVdcPcyBVe83HuI+KCuRMKKjBz1oVjiMgfAKJk81kaqsKsrG3h/dc86loex+dRUwQlUhdhz7VdLiKIKLcPDATBz3dwbPCgx5vjZKczqBnmirihrjRUhVlTvxYzxzEGRx5w99Bg8MsdiCjqimjZ62KymmIz87x5+YLZ2SLF+QJuxR8jHL13wEWUFTUrUDNKXiprYoqYUZ13ossr2Lh1E2uaYtx/fpPh7EPS3S3nQt8rJ1a2syq8isnPE8SbkiSakiQiKTqiKWSqSKqtEw0pnau3oUGJdMdmgCOVACURBCXz7hkbop1MvJ0kl59CVYmGo8x8zlMV1LGjfT8Ax7su0z/eB9yqqQSQkqBmJCJJRI1cfoobe/sDgO2XurxQmOZ5bojR3CN6tl2ld2AfNRXLAObKABGevBpBVFlc0dwPYcWorw2Gx4aCzckt9I/3UR1U8ijzAOBi8K/vnO5u6QUOA/XAF6Bv+EKu5xvVXGolRpHH+AAAAABJRU5ErkJggg==', 3)
    INTO documentos (id,doc_url, contrato_id) VALUES (33,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJKSURBVBgZpcFdaI1xHMDx73POs7NzbMO25qXFGikRkmQXLuQlL3GpuHDhwkuSC1dKaQp37pTszhWFFJFGLG1cuDG1cyHKsnm3tXP2nGf/5//7/36myI2i9vlEZsZM5JihHDMUn7351fgLUcV7xYngPaRipE5wXkgzI/FKmgox0zYsK/GHIWqEYIgaEgwvhlfFe8OL4oOSidLz+DMxv1RqQlAQNSQoWTC8KF6MTBQngcwbTpTMKy2NMemkEDNtx5pGegerbFnVyEQtcP3ZOHu7mikVIoxpBoPDNfrKExzcNB8nytW+L2jqyTkRak5pbsyjCvV1OdIsUCpEXLz7kQjovvGejrYCK9pLtLcW6JxXJPWKJkIuccLzNwnrl87i9otxinURh7e2EecjJl3AgMQFVGHj8tn8VJ0KOB+wJJCbTI3NK5p4MlRh2+rZ1Jxy/tYozhvJVMAMkqlA5eEVysdXM7CzyNCRZSwt96AuI55IM3wwnpYrrFvSgBlMOsHMSFwAg5XD17CRR3TtP0R950rSV700DTxk0GpEW86Vbc/aZkbGHJlXnCjOG5koTpRMlAP9u9h99ASlt30w2g9z5vIt7uDBg9fElaqQZoGmYp6sLqLoI3y9IRLhJYdXoyX5QHFBJ+w6yW9x90IW8J14LPVcuj+KeUOdYplgXjEXIFMsKFsLLdRe3qPhzjFc+okaUK3k+Ra1EpkZ/9K/r7270NRwelGrxHFuhOpX4d3nfPBTdiYyM/7HwL7Fp5KxD0fyIeoIeRs1uLy9Vy78AKt+cH41HYv2AAAAAElFTkSuQmCC', 3)
    INTO documentos (id,doc_url, contrato_id) VALUES (34,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAK4SURBVBgZBcFfaFV1AADg7/zO2Zy7A3fVebdEQ2yCoeVfmmhQGlRgmCg0sEAoeivvWy/BiigYvoi9hPYgEfQYKGVgiIhaaJPSVlC6hU7v9Pon166755577+n7ovRtvZ3LjUiUAQQEAAQAQBO3HWrc8HHSudyIwRfLShuJOwgJUUSIiAIhIkSIiRAhb3H7Urnz++MSibLSRtKY/s3EuPsH9y4TAnFAIEYUyHN6FrNkA0uOlxMQdxC6WL8bsJusxt+nuPYdrVlE5DkiHk7TtYg2QRtRwuMKV79l4hy1Kh0Fnn6dVw/zxBAgIsuoZzQbNEgEhIjHFX7/mhCRBBavY92bLFjOcwe4fIRrp0ibNFKyFnWCgID+zez9iu2f8NQuZiY4/QE3zgIb3qW0jjSl3iRr0iBoQ0yEjgJ9q3l2H68cpncFY1/wzxlgywHyedQzshZ1goAID37j5PuMHaFWpaObbR/Ss5Szh5idprOHNTupN8naNEgEhEAemLurfv20cxfGXElXKi7qc/9en709tyz88XNfTixSLBY99JJnJqu2pbFEGyLiXLap7JsT5/2Xd9r31htqtZqpqSnHf0p136l6bd9+cRyrVCrGxsbcbKySgJDTt8aFyYbrlX/tGR527NP3nJ+c0z8wYO3atSYezbl48KDp6WlbV5Zs27vfyckdEiBi7q5fxy8pFAqgvHrGmT8bhoeHFYtFs7OzqtWqo0ePKj8/6BcUehdKNJA30TJw/5yfHw2A0cvztNoNo6OjCoUCqNVq8mZm9MRFO97ZqnrrpvijQb365w8pDpo/v9vZ8WnpXGrV+i02DW21bNkyrVZLqVQyNDTkhe3bDawY9Nf4VdfGrzyI0pf1dvYb0a/cajE52+Oz25t1L3lSx7wu7Zw9d36wMJtzbOkurSjI0rp7lamZBTMPdv4PY0MOogadRGMAAAAASUVORK5CYII=', 1)
    INTO documentos (id,doc_url, contrato_id) VALUES (35,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKOSURBVDjLdVNNTxphEH5YVhZFRCCNmB6UYmgIRSJJD6QcS0QTT7145NT/4KUXY4yJHjzzB/gDJl68NE0IJCbaA+GzJBQBQ1RU1ALLbmfeAqmJTjJ5331n5pl5Zmah6zpYSQw+n+/z4eFhxuv1xuhb5rehyqFQKJJIJFLsw2+jOHEpGwx6i72OjvB2ZQW/T0+hbWzgDf4J25TjY7iWl9E4O0NvfV3YPLpukAwk7GRRFFhsNgwGA0zb7Zg0GmGXJKFmcjFbrcI2OTMD8xCYY6XhHWZZRq5cFk75YhEagXRmZ9GZnsbAbEYunxe2XKEwBsCIYwnQbJT95/w8ip0Olii7m6hJFKD3++iqKn7RWSZ9p2kI0flI9iVAkv+v4IPTCb/FAr3Xg0pOGiuBmQjo/cQEvHQaSJX7ezwS6LiKdDqtq6r6qvb7ff3p6UkoC79xDMfKeEG63S6y2Sw8Hg9KpZLgfnt7i9XV1dHIxyK9BMDBtVoNVup8MBiE2+3G1NQUKPNYR0DPKuBHzn59fY08df3m5gZXV1dYXFwUQLRkcDgcwm6nKYXDYcszAOKKZDKJh4cHxONxcXIlqVQKzWYTG7RcMjW70WjglJbN6XR+ewbAjpVKBV82N7G3tyf4u1wuBAIB1Ot17O/vCyBaa0SjUVSr1a+SPiRDh3Z+fg4LjZFle3tbVLRJYJFIBGtra4jFYujRiLe2toQP7Y4iKrinuXZIKJs1k8mI1T44OBDd50pGoEyJ8+3u7ooKLi4u/ggAbpjRaJxhfu12G99PTuD3+0Xpl5eXKND6KvSvLCwsYG5uDhptIyViWk3xN+7s7PygkX3i+93dHZgKNQgmk0lknqV/gu+tVktUwDTortI0Pv4FgnWCE6f7EysAAAAASUVORK5CYII=', 8)
    INTO documentos (id,doc_url, contrato_id) VALUES (36,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJRSURBVBgZpcHda81xHMDx9+d3fudYzuYw2RaZ5yTWolEiuZpCSjGJFEktUUr8A6ZxQZGHmDtqdrGUXHgoeZqSp1F2bLFWjtkOB8PZzvmd7+djv5XaBRfL6yVmxv+QjQeu7l25uuZYJmtxM0AVU8Wpw9RQU8w51AxzDqfKhFjwq6Mjdbj1RN0Zv2ZFzaloUdwrL2Is4r+y7hRwxs8G5mUzPxmrwcA8hvnmjIZtcxmr3Y09hHwzJZQvOAwwNZyCYqgaThVXMFzBCD7fJfv8MpHiKvaV3ePV2f07fMwIiSeIGeYJJoao4HmCiIeIQzPXifY+paJqO4lZi/nWPZ/krabjvlNHyANMBAQiBiqgakQMCunbxHJviM9bQeZdBzHJUzKhguLJlQnf1BghAmZ4gImAgAjk++8jP56QmL2GXG8zsfFCz8skA1mQXKbaU3X8ISIgQsgDcun7FL7cJjFnLUMfLyLRr0SLS4hbhiup5Szd19rpFYKAESKICCERoS95neyHmyTmbmAodQ4vGpAfmEn6YTtTahv4ODiRkGdOCUUAAUSE/uQNfqTaKFu4jvynJiIxIzcwg/SjF1RsOk9R+QJMlZCvqvwhQFdbM4XvrynIVHpfn2ZSWYyhzHS+PUtSueUC0cQ0QmpGyE9197TUnwzq1DnUKbXSxOb6S7xtPkjngzbGVVbzvS/FjaGt9DU8xlRRJdTCMDEzRjuyZ1FwaFe9j+d4eecaPd1dPxNTSlfWHm1v5y/EzBitblXp4JLZ5f6yBbOwaK5tsD+9c33jq/f8w2+mRSjOllPhkAAAAABJRU5ErkJggg==', 5)
    INTO documentos (id,doc_url, contrato_id) VALUES (37,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAENSURBVDjLpZM/SwNREMTnxBRpFYmctaKCfwrBSCrRLuL3iEW6+EEUG8XvIVjYWNgJdhFjIXamv3s7u/ssrtO7hFy2fcOPmd03SYwR88xi1cPgpRdjjDB1mBquju+TMt1CFcDd0V7q4GilAwpnd2A0qCvcHRSdHUBqAYgOyaUGIBQAc4fkNSJIIGgGj4ZQx4EEAY3waPUiSC5FhLoOQkbQCJvioPQfnN2ctpuNJugKNUWYsMR/gO71yYPk8tRaboGmoCvS1RQ7/c1sq7f+OBUQcjkPGb9+xmOoF6ckCQb9pmj3rz6pKtPB5e5rmq7tmxk+hqO34e1or0yXTGrj9sXGs1Ib73efh1WaZN46/wI8JLfHaN24FwAAAABJRU5ErkJggg==', 8)
    INTO documentos (id,doc_url, contrato_id) VALUES (38,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJOSURBVDjLjZPbaxNBFMarf4cFwb9AIgXBR18Enyw+i1gs4g01kphSlPjQeAtNzNqGNLVpNCGhEvBS21Rr0ZIK6ovFiKbNbXNpdpNsstncUz9nNiauErEDHwMz8/1mzjlz+gD0UZGxh0hFNPAf7SXa3fUpAKparVZoNpvbrVYLvUT2YbFYTEqIEjBAzZIkoVwud1UsFiEIAjKZjAxJp9NgGKYL6Zh3UQA9UK1WUa/X5ZmqVCqhUCiA4zgZUKlUQC+xWq1tCAUM3v6+74hu2cH4eUz6OcwFcvgYEmUANYiiiFF3Aq5XHIJRCeqHLOJbFcg5OW6Mqm495fL2NznYl7OwveYxsZSF6QUHEpIc9+eQgOvuFL6EMjC6wrg4GZZfIwOGbazX8TaPY/qAr5Ms72oOBt8WknwVem8KWmcCY0/S0E1HcXYyhjNMBAYH2waYF8izl3I4eGLqmjLjz9by+PRNxCMS0k0C0c+yMDjj0MwmMOGJ4+Vqtg0Yn+dwf5HH/sG75/4uWzAiwbfCQ+dMYSGQxdhMHMPmMFY+8MgX623AiDu9+YAADg35LErzHU8SGkcSI4+T0DoSuGRnoZ5mcdIUwdC9zd85OHpjQzP+nMOVmZj4NSZBKNVh9LbN6xslnGai8CxmMP+Ol81criwntgugZTysDmovTEXEUVcKV8lt520s5kjJvP4MTpkjyApVXCZmvTWKRqMh6w9A5yO9Xy9ijUgZCi1lL/UEkMUf/+qDHtruAn5BDpAvXKYbOzGTsyW5exWAfgrZQTt3RFu//yfHVsX/fi5tjwAAAABJRU5ErkJggg==', 12)
    INTO documentos (id,doc_url, contrato_id) VALUES (39,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKrSURBVDjLpVNNSFRRGD33zZs3P85vOs3kOEUK4qqQCqzcDE0F2eBQgbQIhMAWGWREQdAyaF2LFkaLJCLbBBVoCga5KNEwChK00kYdHWfGnzfjzPu93ffGooTceOG89937vnPued93L6GUYjuDwzYHf7v7w5Dd6W7MiEpFvqRyOjOkg0Jjgc7caQy6Xp5vgIJoirK+mklOTE3xAb83cqm13iMplNhtln/UyeaYlN9FSbUUJa36/F2pxKXX1FpZ1cmToRSSGRkFiWImqyOZ0zG7oiO1qiMtUmQKFIoGzGZl3HuVwnJB4tyBSB1XkDRis3II7/LgzVgaK3kFQQ+BlZkRLAQCbwDwOQiyazJ6hxfh2+FBpc9meuLWS6ppsTbkQk3Qg77RNJZFBVUuziQKTMhrJ8iJBjmNqkoPasMukI3mcYWSVq4mS6ytdiHgd+LZ26RJMIhuhiyLHw8k4fU6zRwH/1cXCsWyA8Kqoyoq7LyO3WEfXo+kcbyxylzv/5hBhK0VM5PofngfLpcLPaoKPhwDvy5pMNzIsorFnIhI0A1BsCKVs+PdxJp5UOojfmhiEv3Dz9F46AiaWi6iIQjcuH7NEFAp6y1JZxk54IbDboWhuHenE7sZjLYlv33Fy95u7D/YjH3Np3Hz8gW0xk9iITXHfiE3Ny3J6p6GGgdxOThCOM3c1bBO2OPzp3G8eNqDpqbDSJxN4NyZBBKnWujo+2FSqkv85OX80syxq31+m7uigrdZCM+qybH2WZhKiM5w5McA9yUNOhUKa3eORi3NsTjGRkfItP9Ecml64TuMy/Q/dHR0UEEQHsTj8bzf7xe7uroetbe301gsZv2dQ7a6jYw8Jsvygc7OzhDLuyKK4q35+Xnn4OBg8U/SVg42xMedTudkW1sbjUajls3ffwGqPWPVeFFgygAAAABJRU5ErkJggg==', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (40,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJDSURBVDjLxVNdSFNhGH7OD3NmuaVnapg5lVCJKINWlBJFYGTSz0XYReHFIJFdehEEFkEF3kd00ZWFXSlIYgyDRlsLJVkbEgu3JjpxZqaOOde+8329ZyIs6kLwohee873fy3me73nPeT9JCIGdhIwdxv8XULeS9j6/jZZ+zvlhrnOTznRsgpkZY1k9y6bo+XDiybU3/xSg8Dc3aHVH7XvJlgSdczAOyoBfJBSNrza/GP08QlvlLwE6fbcqo868PIUBzxecae9EcNyDrC4Qn5mG48JNRP1DWAyFqeXrf7ZA5Aqy/bqpthSxoA/FZXaspRlSGwwLs1FyIbCaYuA6UFlWjKqzPaJAqw9Te5e/DXWFpYuPvYMt9barpxpsiCQ2sJLKkmVOEMhkeQ5GbtmloK68ENQNPgYicHtC4zPD3SdU+mBtxw9qCM+ncydnDHKOZJDFphjta76+hBYZgPlHDPus5TAJh6PqEi9RyYrJGMbUXACjr57BVGDGsZY2HDnZmrPPdA7LZD/s7C0aOrtQUHMI6aAb2vsxnA77XFLT+RuCJRNgyUXYtBLIsozE0gokSy1EegnGqPdaJ3Gl5wEKI++AuBewWLGkVmPC/WE294KBxsbGqNPpFC6XS1Ae2qobGDuncv5pUOTHz3sVwqjnz8Etn8/XR2ua8Dz/V+mKiK8HRvYXDXcjk17AOtWSawrVMS9t5zZ6Oyrvm/YU3a0qZaoqzyH5nSGWUPTshuiVtnudfR0H7qSW528rulRtOCLW01Y3e/QbBKBEL0GVKsYAAAAASUVORK5CYII=', 9)
    INTO documentos (id,doc_url, contrato_id) VALUES (41,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ+SURBVDjLfZPNTxNRFMXnX3DhxkRN48aEf8CkYaFGAy7cKImRCAv8iInGnSDGhSFEsJqoUWxABGNQ0zZFGrWRfqS1rf2ype1MC5FaytBmirWK1M7YTofjm0GaUAqLt7lzz++ce98bKh6Pg2EYxGIxRKNRRCIRhMNhhEIhBIPB3QConQ5F0zQkSdpyMpmMAvH5fDtCKNlZFrAsqzin0+kaRK6RFHC73dtCKDmy3Cy7yYVAIBAqFosQRVGpy0Cv1wuHw9EQQsmuG41EXCaRWUEQkCuKsC2tJ0mlUnC5XLDZbFsglOy8EblarUIWfy9JuDuzhr4vgJVd/5ZMJhGwPMLcxBnMT/UjMnoc0SdNHRSZkc/n80pTpVIBR5wHw2sYYoDhOKCZWYf8yUyCs3djJfYOKGbxK2aA915LjvL7/c1kRn55eVmB0HlRcdYSwPNZYCQBvPn8HoX4bZSXTOAcGvC0EdW0G/TYRUGZw+PxqMmMfC6XUyCJHyIGQhK0JIEp7ESBuQWJd4P/dgWFwFXMvuwiI5yHc+TaodoynE6nmmya5ziuBhl32/GTvgFJ8KKU7ITAtmM10YvU2ElYJl/AYDDs37RRsmW11Wrls9ksssxbcMHu/+IOCItn8Zu5iaT2BOzGUVmsUm6h/lqmp6fV5ld95cTH6yT2JwgLXfjLnsMKSTL/tAUW02vo9XpV7RrrAc8u7+2Kf+hF1PwAGX8bSgvtKER68HWYxJ6a2CRuCNANHgVW05gbPg177x54tK1waY7BYhzfIm4I6LvQJJa9j1H2P4S//zB0lw7ArB+FTqdTNXzK9YW25l3Cnc6Dom2gVbTeP+I0DvWcIuJ92/1M/wCZISaoLgB85AAAAABJRU5ErkJggg==', 8)
    INTO documentos (id,doc_url, contrato_id) VALUES (42,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJHSURBVDjLlZPNi81hFMc/z7137p1mTCFvNZfGSzLIWNjZKRvFRoqNhRCSYm8xS3+AxRRZ2JAFJWJHSQqTQkbEzYwIM+6Yid/znJfH4prLXShOnb6r8/nWOd8Tcs78bz0/f+KMu50y05nK/wy+uHDylbutqS5extvGcxaWqtoGDA8PZ3dnrs2srQc2Zko41UXLmLdyDW5OfvsUkUgbYGbU63UAQggdmvMzFmzZCgTi7CQmkZwdEaX0JwDgTnGbTCaE0G4zw80omhPI92lcEtkNkdgJCCHwJX7mZvNaB0A14SaYJlwTrpHsTkoFlV1nt2c3x5YYo1/vM9A/gKpxdfwyu/v3teCayKq4JEwT5EB2R6WgYmrs2bYbcUNNUVfEhIfFYy69uci+1fuRX84mkawFSxd/4nVWUopUVIykwlQxRTJBTIDA4Pp1jBZPuNW4wUAPmCqWIn29X1k4f5Ku8g9mpKCkakRLVEs1auVuauVuyqHMo8ejNCe+sWPVTkQKXCMmkeZUmUZjETF1tc6ooly+fgUVw9So1/tRN6YnZji46QghBFKKuAouERNhMlbAHZFE6e7pB+He8MMw+GGI4xtOMf1+lsl3TQ4NHf19BSlaO1DB9BfMHdX0O0iqSgiBbJkjm491hClJbA1LxCURgpPzXwAHhg63necAIi3XngXLcRU0fof8ETMljIyM5LGxMcbHxzvy/6fuXdWgt6+PWncv1e4euqo1ZmabvHs5+jn8yzufO7hiiZmuNpNBM13rbvVSpbrXJE7/BMkHtU9jFIC/AAAAAElFTkSuQmCC', 9)
    INTO documentos (id,doc_url, contrato_id) VALUES (43,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJzSURBVDjLpZNLSFRxFMZ/944z42MqH2MllWJEkT1UjHETSFJiVAtdtHFly5aCm6xNWyFw2aoIoiAoWgjSIqkWghAuVFBTJJVGGV/pzPznzr3/c9qEaUaLOsuPw4/z+D5HVfmfKvhdCIadmCo9KrSLkFAFFUZFGFLh0YFbmt7d7+yeIBh2WlR44lT31jqlCTRSDmpRs4rdGMP70j8vQndZh37YBwjeOx1a2vLaPdqFFh/CZqcQbw0NcuAU4haewvFdvIVXeCsfOitv65sdgP/eKVfla+jCi5i4Wwy/HCSVNJy5eAhUmR7fIl4Jl6+fJxS9wPeRO2kRaqq6dN0FUKHHremLmewKm/PvCLuGtptFLM1usDS3SdvNIiIRsNsTmPUxis/2xcTSA+ACiHDDKWtGtj8TdbZoSkA0bLjSXkTr9QjRsKEp8XNpb4qC0tOI5cZuQB3Rg6xML+z5yOZymo1ls0dLLRrAw1pqdwAqGA1yePkSVhc9xCr5nJDJKEuzhuScIcgryTlDdjMLqogQ2vGBWObxTUP8ZDVzI5OMf0xREHGJH48SPxJi/VuGmdEtKqosx07FEFuA7zH7CyAM+qtjDWU1F2koNai/jfo5xObQwHC4CrQ+AFXCFY2Y1a/4eQZ/3cAykJ18mCY4gBs5Aeqg4oHNo9ZHxQdcQrEzaLSe5KeHad9jYAdQ1qkpEbqzs89AjxE62IwTKkdFQRQ3EidceRUtbmVt4i1+nu7Ge5raZ+Xkc+eaWB6X1PXWRirO4YZdkIDAs2SSMyyP9M8HPneb7uvQH7MAsPjUiYmlV4R2a0kEeQh8RgOfocCn/9KDv4TpX+oHaI9cJDajhlcAAAAASUVORK5CYII=', 9)
    INTO documentos (id,doc_url, contrato_id) VALUES (44,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAC3SURBVCjPvdCxDYMwEAVQSxQ0CImKKldE19FRITeu3LihiGQGYYKbIBtkgtuACdiACW4NcgEnpKJE11j6T98+m9Wcj7kERIqsM6ymHwJ7dvQJmhvSryFK5N1rLFtc4gT8Bx4JOO42gC+Y6wM8pJ/D6Ec3dnOrAJ9ga64O0EtIDS3fBS0sGi/FklMCQXwCjQIoa1vZYsqnrEnAi0sAGWQ/5Zx9r/CkT+NW18QBWMu39TIydN1Xn88bUK7xEQPM95QAAAAASUVORK5CYII=', 4)
    INTO documentos (id,doc_url, contrato_id) VALUES (45,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIrSURBVDjLpdNfSFNhGMdx6Q9RDoIuLAQtYVuWpZSunKQXjYIKwdBqkJkEYRhIBEFRRmVbGYNB2hTnVKaGzWFq/im0mLgyLTNjpdSFJkX/hCxYY26db+ecYliQF3rx44Xz8nzO8748bxgQNp/8d8OoS41s0Ca0uBPXvu3VqMYbk+Parx5Nsl3RRyHmjpjdswKfosOF6ey9CENPEFqdBNM2MaKNJ+D7StflLTIiA8bUrQu8sUuavOrF017lIrwxYqIXErSWwOsR+PgBhgZhoA9XWw0T3UbqTsZLwBEZMKUkhvtUS3uxW6G+GmrEtfsuPH0MXR3gGf79vfIGZQUa3vWYMR+OkYBIGbBpN6r9qxUvZEBsmYMZUHwR6sSiPjf0P4RaG1OnTvidZzS8uV0gFRO6xBaNMiOgXjmB3QY5WZB7AK5dAkc9PBdb7+oUu6pgpLRkymXazlhn4d/AYMIqg2Axf8NQCHnZcCwHTAZodsD4GPTch3vtDJeX88q+n77rOyXAEwK+rFe0in8Iyq1n7oKic9B0C9wugjerf34/lPXDr08PuPJyZKD5fIoEFIUAX2x4v2AthYZaMXaEjlb8Og2TaxTCs317BgMWs/59fm7V5qgIPFWZVOTHSUBaCGhMXmd9GR/hnVQuEz6LGVWt8DuSYh/NnAmxQFd5fIPcwczzzzpI/wDFLRe2zQsYHShLnxcgFz8w7QiN8JwA59lkCTg9F8Dy5xVK6/KZe78AQiW2y4SvvaoAAAAASUVORK5CYII=', 11)
    INTO documentos (id,doc_url, contrato_id) VALUES (46,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKoSURBVDjLpZLbT5JhHMdZ1/VP1Cqrtco21kU3zevWVa3NXOuuedVmoU2jUR6CoRwcw1SYHIzJQQxBUXgLXg6Ga+mIwkBBBp08pYGvEOa393nbWC5Xa1389mzPnu/v+/t+nh8PAO9/6p8FBoMBWq0Wvb29UKlU13ihUAikAoEAfD4fKIrC5OQkxsfHMTo6CrvdDovFApPJBL1ez70tl8vI5XKQy+UxXjAYxPb2Nkql0h8rn89Do9G839jYwNzcHGQyWVoikdTzaJrmLrLZLKamppDJZEDu0uk0PB4PkskknE4n98ZqtSIWi3ETicXimgoDr9eLcDgMl8vF9/v9sNlsfCI2Go18EqOvr49PxEqlkj84OMjlb21trao0cLvdiEajHINUKsUxIM5EHI/HQTmUmKcFGHqixezsLHGHUCjcv+sXRkZGUCgUMDExAZY03+FwECf+sNWEhLs2vZq0YMZeZ+zv7ydi/PaNbK6W6elpJBIJEDFxNpvNiIdUWI4bUS7M4/XwFbwKO9DU1LSz5x7odDpCGj09Peju7kafqg1R62UUl50ofujC2oILkaGbENxp2PnrIr21Xdr3xnzRsPLOimL2AehHZ/Ft1YoZbQ1kwutfdzUYGBg4ypJ+rFarCWl0dnZCIxcgTTWjtKQHM38DdMcZbGUasZ4ag6frwveI4tyBSgMWVgs5FQrFLalUuigVtzWwTi+/sOC2Fm9jM3H1ZyXr2ChyZPxKhCTVwkoDdqdb2LXkFiUSiWBM14wM3YXSJzXnvpmsZSNUcyeTqgfz8Snohyc/+0Unju/K3d7eDpFIhJD8/DqzsoDSGoXiEstgyfJL2VDOx5B7YcSz5iOWPQGy460EO04zgbZTDOvEsE6M7/4x5vm9KoYVMdTdwwzVeIjxCg4GfgDxYPxXmKLFvgAAAABJRU5ErkJggg==', 8)
    INTO documentos (id,doc_url, contrato_id) VALUES (47,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAACjSURBVCjPY/jPgB8yEKmgPKH8ffn/0n4IL3F99P+QAjQTyveX/IexIwWCz2NYUbw/7z/CYK/9GApy92cgKXDEVJC+PxFJgQWmgoT9kUgK9DEVROwPRFKghqnAv9/7v2MAhK3iINePocBNwf69xXlDhf8Myg4y58UUsISkmYL+fI39ivul+0UMSA/q/wza/1X+y/0X/y/0n+c/+3/m/6SbgAsCAM8i/W7eee6fAAAAAElFTkSuQmCC', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (48,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAMUSURBVDjLbZNLaFx1HIW/O5ln6jSZJE3SJE1L+pym1aSbirXoogah1KZUIYISRerCot34orjTBsQigt2I+EAEFwouRBMogdgniUmkIMZMpulMY2eaSdqYed659/5/PxelXWjO+vBtvnMsVWWtzP78TDciH6hoVEXeih8b/n2tnvVfQGL4aLOKvqEiJxu3Hqs3lWXupkaLKvqZGvl4z8BoZk3A3Eh/QFVfUpG3o+1921riz+ITQzE7SSBUQy45xj9/T6VV5KyKfNEzeKnyAJAY6e9D9L1QrOdgy67jhGPbQR28lTlujJ1h0+4D+Go3Uy0tsZicorA0M67GnNl3Yvwna3b46FeIDDZtG7DCDXuxC8usLs1gnCJuKUvIqtLauRPsFWoe6sQXjpLPJlhMTlFeSX/nVyMv7Dh0znILyxSzY4iTJ1ReopzPkl+4xb6BTwlE1kEphZaSWPkEjW0PU9cA07/MP+dXkZJi1QXDIaINnVSW/qQ2Vk99LEKEMtg3wQTBvgWVBcq3xymmrhDechw1UvKrCAhgBQnUbScQimLnJpFijkANWOXr4FPemfiBlWqV97e0QDCEuh4qgk+NcM+DAa2Cfx3h5l6CDXHC0Vrk9nlW0z9iey4dTXFOzaaQso04HmoMfjXmnlA1IC5IGbTKmxPfg7o44uJ4HhtjO4i37qdgl3h5fpxvmx5HjeBXkYgvEAAi4N0BqYLYeOLwVPcgRgUjBkHJrC6wt+MARafCkYtDfCTtYb8auTB/4ZNDbbueJhLrAM2AcxfbczAqpO/M4YqHJy6ucclXC/RsOkjRLXPixuWgT4w5XFi49OpfI6eT6YlvMAQhuhPbs/GMR8v6TlrXb2ZjXReBmggbou1ML1zm2vWri4elfsODKU9/vr9ZRU6pkdfaHumvf/2Pr7EdB0ccbM+hq3E3j3b1MXnzCr8mzs+UPe3NDGn1f2f67Vxvtxo5rSLPb33iFauSS5GZucbJ0sXqns4nQ2OJ0SlHeCwzpM6ab7yfq2e7+1TkXUSCKvLhi3bySyM1TRUxgdyQevd7/wI8lcwGoqfWawAAAABJRU5ErkJggg==', 4)
    INTO documentos (id,doc_url, contrato_id) VALUES (49,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAH2SURBVDjLnZO9a1RBEMB/++5d1LxgPjQYkpxdLEVItFEU0mgay/wDCtfpvyBpIgommCoHqSy0s5Jgo2kEjRa2R/CrM0HzJd7lvZndsXiX8+VDFIddZncZfjOzM+PMjHq9biEEQgh47/Heo6ptXdwi0taTk5MuBvDeMzg4zOb2NphBvsAMA8ysfcaM3t4eFhefAdAGbG5tcevhK/5F7lfPk2XZb4CqtlzCcOU0XZ0dVPoTjh6J2RFDNCAevMHr5fdYMNI0BSACEJE8TMA5R2NH+bq5QyP1mIF6I9NAqrmNGXsjEBHCbnzO4ZzjR0MJltKTlInjElEwrAUIFg4CLOQIV4A0M08mgaSzg1IpInK5DwuHACik4JzLIYA5RyP1uMjydyDsTyHLMqJSBMCXz5/+WoVSXDoI6CjH3L15Du+NcrnM2uoqSddxzIyNjW8MnBqg2Wy2fj4cADxYWnp5pdBlfSLyYmho6IaqsrKysqCq4yKyXujKpwBut3xFmZmZua2q1y9eujze3d3Lk8ePmqp6Z3p6+t5+2z2Aubm5fhFZGxk5Q9+Jk3h1iCpJcoyPH+osL7/5OTs721UExMVLmqZjlUqFiYlrqCpmhpkRRRFjo2dZX/+eVKvVq/Pz888PjQBgamrqnYiM7p/C1mS+rdVqF/6Ywv/IL/azYiamBPboAAAAAElFTkSuQmCC', 8)
    INTO documentos (id,doc_url, contrato_id) VALUES (50,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALVSURBVBgZBcE7jBRlAADg79+dvb2929u9F8cbIeHhK8TeggiNHnbQaDS2xsICDXbGzt7KWEi0sLHQGEUiYhTQYEKEEDlCcrzUg4PjgL2dmZ3Z3bnx+8L80VfOzMzNHKxWqwAgAAAIAiBgWKx7+ODhL9HM3MzBzz85IVSC4foAAEFQKgWQDmIEZVlRrpdKhfePv3cwqlarCkNh8JXk9CVTZ1Irx3cYn2i6fv0P15LP3F3pmJhoub/aUY1q1pLMW/OlWlRVAeh0VnWeGbEWx9JTC+L4njiOhfySvNfVS7v6vVivFxtmiRDWEUQB0G5voBwYe3eaj/9SPzJrbvMWjcENveEeE5MTRqoVUW1EnGZCyBFUgKDT6YjjridzhbWpod7XixTryvScQR5Lu4lBnsqzRD9PhVCCCKDdnqMcmGy3dN5+1tSnq4YHNqvP5nb0V9Wa243Vq2ojNd20jzUCFQLIslwSpzprHd3xwuO9ZF/eVBaZSv+krBfr54ksia33EwEEUQA0GpOarUS71QK1N3ZqHDsvKp6yZeaqrNGztXlFfWRFv3dbtfKmgCgAup1EHOdIXFxa9s+gYuPuwr4T1y0dTsxc+FD8288eLz8SmmPW5xMBkRAEtCY3WRvmLqep2/2a6alpy4eCQyeH7py9Z7Rz3/7XP1Df9ZzelZ8snD9j95OmCpRl6c9/b/l+ccF/j1ZlWSaOE3Geu/B0qXb2d3sOHDF641fhi9eM3fzGzh1Tdj+6KgpIh4mVYqA+0jTeaMvyvuZoU/vvO7bdTS0NMqObdjF/DED00WatLBYRhFAxoaUXUvWiYSw0bbz2wMhSz60X96tcOC29/IPx796R95al6K5VxfUx0XBYKIrC1ukXbJ0hgCDswUvMhiA+klg4961tUw1Rtaa7MnR7pWpxcp/w6tHDP26Ym325WosQBEAAADyf3LL97kUTWSIeHbPY3uvscNOp/wGooE3b/ShD8gAAAABJRU5ErkJggg==', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (51,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHcSURBVDjLhZPZihpREIb7JeY2wbcQmjxZbrIQ5nKSIYQ8gyuKOwqKihuKKy5xnJ5GRzteTIjTp51e+HPqDDaKSy7qoqvq/+qvYykNBgP0+310u110Oh202220Wi00m000Go0rANKlkHq9HhzHOYr5fC4g1Wr1IkSiySRQVVVMVhTFhVCOu0CpVDoLkcgyNdM0StTr9eZms4FlWSJPwEqlgnw+fxIi0dRdIxe/cMuqYRgw2SO2v9OiNpvNUCwWkcvljiASTd5Ztm0bJLa3GvTpZ+iT9xySErXpdEoukE6nDyAS35Gt12vRZJomTP0R+q9PYPc3MB6+C9AOMplMyAXi8bgLkWq12ju+I9M0TTRtnzp45pOZ8g2G+vMIMh6PyQUikYiACEq5XJb5jmy1Wr1C/vQ55CMM5XYPwr+1hKgPh0NygVAodOXuUigUZL4jWy6Xx5CHH2B313gaXcOxLeEimUwiEAi8PXhRvp+czWbZYrHYg3yAfvcFf6e3eDE2+2KPu8J+ZDIZOZVKMbrEV0gPz/df4ViGK/b7/R73EU8dRyKRkGOxGKNL3P3EJOb5A/FZAEU0GvXyl2Z0YKPR6KT4IoAiHA57g8EgI7HP5/OcPOX//V35VC8XvzlX/we1NDqN64FopAAAAABJRU5ErkJggg==', 9)
    INTO documentos (id,doc_url, contrato_id) VALUES (52,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAM9SURBVDjLdZPrS1NhHMcPREH/QC96nxURWS+iktC8bEt3skHoi95EbYk5KStqdtPGLKcuczSELnYhK0bzhpfK5nSZed1MPZtzzpq3pnN5tOY2p+fbsxMEUj3wgx9fvr8Pz+X7UACof9VwPb1juC6l2l6T/N5WJdr9P99fgqPxyCYyrLLXpczPMg/xrbcQzOukH0P6xJLBl/Gb/wsYaUpdT4Zlw/Vi55RVi5XgNLilCSy6qhGYrIO79Tw+P4/92v/soNz6JGbjGoCjKVXgaDhi/tpxA4Hvn4m0BHAswr4ejBiOImAvRsitx6JNB2fdSVge7e/su7+X5gFk+LGjgeZ8jkr4vQPwjbVgrIsYP6hhe3MOrreZ8Nvvwm/NQ9D5CMsTesx1q8C8kKBHt+dF5LLCXNCNkLcPvgEtvL0qTJnOwlmbhs57MVieswB+BzD7FtwXHcBcBiYrER5VoUu7K0yRy2JXg+PAjyEsT9ZgwXoL/v48UgpM1op5DTONgPsBOJsCfmMcZhoOYoG5i87SnSxlqznMri4RwM8RAmEArxEBRg1/VyZm6sUIj2iA0RKE2kWYa9wHj0kET3Mq2P4SfNLsYCnGIGRXeIAdWCTbne8kkHcIO7VYaEtDyCwCa4zB3EchZoxJmG6Ix3StEN+7C9FRtI2lyPv+BpAjgO1CYOoNmqu10JQUoqKiAkUFl2AlRxltFKJIdZHXim/no+aBAibV1gVq8FV8iAt/Iy/nwrK3BRW66ygrK4PH44HL5UJbWxvuqHOhU8vhGGZ4rb29nfcoTx9YoQYq45pHjZexNGVC67uXuHpFAcvgIArz5aBpMWQyGbRaLXJzc/meFouRf/4ED7l08VyYIsnaQJIlI+FwKi8cw60CFQ8IjldCJEyA0WiExWKB2WyGwWCAICEOLcot7ghAqVQG/kSZJGtTzvHopuwzUi4CuHnjApISEyEQCCCRSPiK9Anxh1bTjh1tjQAyMjLm13yM7WRJUsVjpRp16PWrp6iqqkJ5eTlycnKgUCj4PqLp9XqfRqOZp2navgYQFRW1LjY2Njo5OfmLTHoqkC3PXM2Wn+GuZQhK09PTE7KyshZJBaRS6c+IJ+L9BchY24ysm0a5AAAAAElFTkSuQmCC', 8)
    INTO documentos (id,doc_url, contrato_id) VALUES (53,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAF7SURBVDjL1VM9a8JQFD3PiEGSCO1ih1gnB0EkdCkKzp0E/0IHIRQc3bJ0LTh28me00CJ06SSddGmQGKpYHbQGVEz8wte8QIqQoYND6YXHvXC5h3POvY9QSnFMhHBk/D1A2C80TbtzU9X3hGX/bbdb1Go1UqlU6Gq1Qr1eJwEGu92uWiwWkU6nkUgk0Gq1cKtmoF29Qdd1qKpKJUmCKIoolUpGgIEgCGi321AUBbFYDPl8Hi/vQzSbBZTLCpbLJQaDAXieZ/V5AIChZ7NZPPRP8dxjxCIonMm4SKXQaDSQy+XQ6XQgyzKTFAlIYMjRaBRPZgizPY8ZeLx+CeA4DvP5HEy74zhYr9dMbnALtm1jsVi4pu1BmUUcAQ0RjMdjr/crwHQ6hWmauDyxIBEHIrGRCfdhGIY35A+zjRxe748Hk8kElmW5G/jEtWsiY9PTe/gYDhGPx71eMpn02DCQAMBoNLp3ad50u13i736z2XiZuX94F248+nPk/3+mb7TL1kbVXJ5aAAAAAElFTkSuQmCC', 9)
    INTO documentos (id,doc_url, contrato_id) VALUES (54,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAF6SURBVDjLjZO/S8NAFMe/l8Q0ASUUXRwK9R9wFDfdunV19Q9wcmg3/wHp4FLo4CA4Ce3o6OLWUZwKpbRLMdDFCKH5dd73SkvQkvTgeLnLe5/3vXfvhJQSu4xutyuDIEC73Rb5fQM7jizLMBwO/+1b+UWv1+soRZdCiGO1PFJzT33r4Hq9DsuyigFRFN02Gg1UKpWNc5qmehJimmYxgE6e5+GsX4VrZQgzHlfiwI7xdP5VroAOzCZMidaFgGVIENH5sPAdZeUAwzAQxzGECrSpVt0Qq0ygErKbAh5DqOC7dxWj0gtKEGSl5QAWiYCX009t18Wj9UxvK8DYBugHz3hN+hiNRnp9+PAINlzpLawBTedqlflkpcC/uUYVKFewrsF4PNZ2MpnozLPZbJOg9AgMYNdx0BJUq9U2CQoBvEYGzOdz2LYN3/fhOA4Wi4UG839hDVTf/4RhuJ9XwLdAy/5Qr1EWAqbT6f1gMGgul0sdmAMjSRK4rvv2F/ALQmi5wbpDa1QAAAAASUVORK5CYII=', 8)
    INTO documentos (id,doc_url, contrato_id) VALUES (55,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAMoSURBVDjLndPLb5RVHMbx5515pxfnnaadQi9MSykzRSFSqyWjITVoUIMhLmClLky6YcempKBGgitDJEgaIlVjMGkkLkCqIUTjyo7YQs00dYYZpsNoufReaWn7nvM757yX4wJJJBoXfv+AT57NY2it8bBT2fct6aoeodQeoSgplISQYpSE+i6onv2gWr9e/tEbMY6/ZTwETmaO7ZKO+uKZ6q7WoFkBx/BQV7keN6fyuJj7qj9mfJJVjturlNf9+YH40CPAiV+P7tsYSlysDW/AtLqHcTuPoA5gp/U0zl39bKnS3ZeMGC+NJhNWNHdrFbdn7f3nD7cPAkDgw/GjUaHEQJ21EWN2Ean7I7jvrCBR2YL5ubtgjN4L692HttRVROtrKtDWaIFIDbzy9nAUAAJcUk9n9S6rRFPI8wlwV2B9MApLhPBN5sJ4LHj6miDnQKI5jMKMQLSqHG1NEUtw6vkLYHuDoXJk7QKUK1EVsNBe9QRGiz+D1sRBR5p9HZsjQeX4mLqnUJyTaKgNQ5DYCwAmJ7FNGi4CMNBhPYlN5THc+b2EdCl9tjUysIFIdsZqKzFS5ODMA1v1sDUWghTUCgAmI071FevKuiI7MD9zF/1jJ5ckU33Hll87M7GSNn8IP15aWBbbTRjgzIf2fUhlQpEIPljAafKXG8Mdl64PLkqSxw/PNp3fvRR+S/PcxPM8/cKlbb0Q0gPnGsQ81NaEML1gQ0kqPQAYfflt5uv+U1Ntl7esBHs0p7yzudkyir/BX7NBRODCA3ENYbtojj+G4aslOJIuA4A5WOo4qzkd15xOO/GWMifeAt/zYI5lAcYguYSQHoiAzu0RFCbnkcllbM9RfQBgapuZPuNvqp3JMremGuJGHqHGJvg2g2YEKThIeEjEwigUp1HM3YQrRffs0JFFAAiEPj6z6K+xbuNaGsgVEGpohE8cHhE8ElAksMocXEll8FMqNTkzd+vV2aEjF/7xhbWuF1/WQnyq4pta3fp1CPw4Ar3wR/tzO9455ylJrqu+91x1Yj71rv2vZwKA5a1PWZ5UvVqpPb5yktp12xuWZrL4jx4B/k9/AolT0+iTfsOYAAAAAElFTkSuQmCC', 8)
    INTO documentos (id,doc_url, contrato_id) VALUES (56,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALKSURBVDjLldNbaJt1HMbx73tok7Q5tukhmzXNShuHXgwvlIEIgpp5pgqiIN5PUPBw4RClKjjwxhvZcDeCeKEgu1mKMUWYVFQUPFRZOrtmW0zWxKZdm3fNm/f0/3nVguIm/u6fz83veTQR4f/cSjFf9FwpWM2geOdzq7PmfwbO5EcUjOgaV5TIy2E99lAqPERtc/VhgBsC1VL+AzQeEJ+EpyQaiyT1+vm2oFyt60jpukC1lJ9WwlI8Uwgn9j+GJgH2HyXctZ+JRzyturY19/jbF9/8V6Bayj9hhIc/i4/Nkkjfhl0/RbDTxmu3EC1KenKY2p9bTwN/B6qlfAb4KJK+/d7YyCx9hoN9+X2UY6NcBz0SRnwbzCFGo+bUbs68MJ+f1g2+CnzGU5NPacmJR3A3vsC6soiybfyeg73dJdQv9JuCBIJlK7UH+I6cTE8fysRHjxA4K3jNE+jeNuK5dDYsvB0Xr+dhJjUwTFSg2N5RrT3As+RgaDCNs9Ng+dsi/f2KPokSAuKJPmprFoYIhmjogzfT63RxXPl+F9Dta2q+WfkV33cZGJiiXonTbA1wqbZO91qPqVuimLpis+Lx+4c/sXLiOxJLjbvL95uvAmgiwuJ7B76JZVKHp+44wpenihSOPou91eaHcpGU0WHIN+mujzBzz5OEcrdiL5U5t7gQXF2uvKjtVnnh+IHz8X3JGdQMo9mbGM8lqJ+r8PmnRQ5edbjr6HEiq2eh8TUkkrTNLD+WFy/uvfG+Y9X8mbnc6cHE8uyFzcv8smAxlh3DVILeVYTHc/DgS3t9MecyGEqb1P45ptOv5QqIlDLZFBOH9mMGPr+9e5bDjz7DYG0ex27SBayOwfIqDe16a/zklcm3UPL66L4YqY6P11RMDPmYeh1r3edSywi8nryh3WjOH7+QNVxHjnkezw87Eh3YaGkhT8KBIQ2Bk4Wy/85fhGJYxwKt7REAAAAASUVORK5CYII=', 4)
    INTO documentos (id,doc_url, contrato_id) VALUES (57,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJfSURBVDjLpVNNiFJRFD6O4j8EMpoMTGU6LUbCMJAmmFzYQpjViIgkSNtoldDOzUCbCIJA2rlpNv4thiCY5dSmNJOiYhwRJ8nIMdT8/3nq7ZxH7/GaoE33cbjn3ne+737nnHtljDH4n6E4vZFMJg04RZB4C2cLznK0MtoLXD8JhUI/pPEyqQIEb2s0ml2n06kzGo2gVCr5/clkAo1GA/L5/KDf798Oh8MZEUQEZIlEwp3NZtlgMGAcx7HhcMja7TZrtVqs2+2y8XjMEMxisRgLBoNeAbdEJAjWa7XaXbvdDnK5HHq9HiABIBFMp1NAIDSbTcjlclCtVmGxWDwNBAJ6wi79FhJxOByrKpUKUAEFwHw+503w0+k0RKNR0Ol0YDAYqDb3RQIM8ppMJj5XCp7NZiIB+ZlMhurD+6VSCfR6Pcn3igS4cNHpo9FIBApGJwtgUnN4eAgUi75LbKPQCalsMjo5lUrx/4V9wRcwAkEOT9+gtlEaUrBARgD7nYsglylg+GlIsJy0Bvv1eh3UarUom8DSVOx3rWBZs8DKeTN8t/Gd2JfW4HGhUPhKLSuXy2LOvGz8Lt9bgwuWc2BdRhKTFZbNBhhutm+5H1xTijcxHo+7O53OQa1WA7wTUCwWoVKpgC28CiqTAs6eMYNt5RJM51M4/vYF8u/fjicT7uUfV9nv92/j+hn2WU/9ppqQClJWXT8Cz1UPT3Dw+hWcnDQ28g8/vJGdfo0+n8+AexF0tzDPdfRH6B+Pbvy84rl+E7g5B3vP9+Ddo4+yvx7Tv8bmjouhZODGdL05+Bw74gl+AetZvIbkaCwtAAAAAElFTkSuQmCC', 6)
    INTO documentos (id,doc_url, contrato_id) VALUES (58,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAH0SURBVDjLxdPPS9tgGAfwgH/ATmPD0w5jMFa3IXOMFImsOKnbmCUTacW1WZM2Mf1ho6OBrohkIdJfWm9aLKhM6GF4Lz3No/+AMC/PYQXBXL1+95oxh1jGhsgOX/LywvN5n/fN+3IAuKuEuzagVFoO27b1/Z+BcrnUx4otx7FPLWsJvYpIM2SS9H4PqNWqfK1W8VKplHlW/G1zs4G9vS9YXPx4CaDkXOFES4Om4gceUK2WsbZWR72+gtXVFezsbKHVamF7ewtm/sMFgBJZhd6pvm4kDndaAo2KOmt5Gfv7X9HpdNBut9FsNmFZFgPrMHKZc4DkjHyi6KC3MZNehTOuGAH5Xx5ybK/Y3f0Mx3Fg2zaKxSIMw2DjT0inNQ84nogcUUQJHIfZquNT3hzx46DBALizg2o01qEoCqLRKERRRDAYhKYlWRK/AJdCMwH2BY28+Qk8fg667wdXKJjY2FiHaeaRzWYQCk1AEASGzSCZjP/ewtik5r6eBD0dM+nRSMb1j4LuPDnkFhZymJ/PsmLdazmV0jxEkqKsK+niIQ69mKUBwdd9OAx3SADdHtC53FyK12dVXlVlPpF4zytK7OgMyucNyHLs8m+8+2zJHRwG3fId9LxIbNU+OR6zWU57AR5y84FKN+71//EqM2iapfv/HtPf5gcdtKR8VW88PgAAAABJRU5ErkJggg==', 5)
    INTO documentos (id,doc_url, contrato_id) VALUES (59,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAK5SURBVDjLjZBbSNNxHMVXDz3UQ0892AVSs4Q0shQRA5uzCFGL5Rxqc1u5mZpNnWNN533eaDr976blZeFllc7mMLMl6IOGqdOpS4vAPaRbb6FiQjpPm5QahvmFw5cfP87nezgkAKS9JI4+zp5Wey3Ot57AnMZ9rYnn0RAV6HHoz/+eZl74SYq12d2x0OaGnapL9azeF6CBeYxY6PSHrZeDH8OVsOmCsaA9BYva8/u+AKroo5V2cy8Wh1RYMz/D8nsV5id60F/sZ90XgBoew51pydxYmuyAY7YTKxY97AMEihKu6v4J4JK92Ep26CLBIEPFoqwl033HCGHqT7uOj69dhbAbcjFY+wAXOOd7AgQ+R/4CMIPPUJTsMEd1PBk71SjjQV4nQYUiF/lSAbo+tqCkvwi+eec0F/lnD28BZPRLg0+Sb6Gz4B5m2sRo5dNAMCioTQpDk1kM9bgQVaYMlJsy0f6pAen6NAQlB6i2AAq6Z/uXfu2uwrTZZMjGH6HCJEDxaDpyRlMg+pACtoqFOVXU/wurKI6GYkKEfMN9pKvjwK26ibjSUFAl12B7GrENOHi5RqQQpe0qzIeWBW5dDArb2ei2KGG2GSF7lwK6zBcMoffrTfOB4OeJVL5peeAbUPpSh9xGLQSEBvUjqxAo5hFfcn29a7oaXTMEXCPt40DWl4TAVLdVknt4LY3G614xzDogmQE4I0DCABDTDdC1ADEEROT4ocdSj51jmFK6ACBNSfzXxzrk4L+yg9kLMPUbiNdugKZxIFINRModuPLwNB4b76LMyNo0l71lbSew1oTYOkoyEJs3DK4RYL9xJtADDANwx5WifA6xvCjclnqj0pi4edm1XW8nQEr63JwU1FNEzQ6ktej900dBzptyahpk8SRCsk3wvPHCKs9KLEgQehuchiVX7N+73NXfL+Zkqi9OGtlWAAAAAElFTkSuQmCC', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (60,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAANjSURBVDjLbZNdTFtlAEDPd+9tKS20HS1/tbAuDNyEEMffIv5hMkW3RU2my96ci/HF6IPZgz65LEZnYnzQxFezJYtREzaJ06hkA8zGgs4hIOOnAyZdadpy296WS2+5vdfXYTzv57wdYds2D1JQE62amjyiZycfMwvzdaWsXsL76Iw/2HGxubP/Nv9BPBhQ48uvpefOfewPtTRKspui6WJ7s8i2niMRX425Gl7+rC4U+jKyr8vYEdALmje9On9RMc8fLd+W2TU4SNlQEdsq+XQcWYQo5jdI3/2DRF5bjHS98VzHoZP3AER+c1NJR7+9oYi13kBdLxtjo1S1ezDUGbJTcTwtu6j2N6L49iM5aogv/cnC32tzT5w61+8NtuXkd996/Z3UF2dPNT1/jPLmIoYxQeqnW+j3szQ+eRCH0we2DcUUhhqjOtSNc2u9Njo96/d4nCPym6+Gf/D19bgzP49R3eykkIyRm82w+/ABHLKAchnJtLDMEnapRDGrU9nQydK1S10YxSnFKs4FvOHjbKjnSc2ukJ9XaTvezf2bsxRzZYRTwRV0ozideNwKFY4c5epmlGCHdHloZFBJz8YI790m/MIzLF4YpmyBwxUk8tTjYJYQNmjJJJZhkk1qbOdKONYnqfVUoydXDyj6+CT603EU28LhdxJoDXLr61/pOjaAjMAWMr7aemzTwOtzIUwDXAGyWeiPVOWl0CsDaMsZ5i9fhapKwi3tNPXsYeL7CdRUHiHZ2AhsIYEMWCaSqwajkCGRtdYU05T0itYGd1W6HT21RCGToi7cgMsXYPq3eYSQ2d8XwV8FkmUiXB6E4mHj3iqFItfEX9988lFmc+X9UGA3lcY0mfUkbY+EQAgsRSGnFrnz+xqYFhVuiYbuw8yMjPPdldFL0aJ0UqTuXK+6MfT5dUPb6jx64ggz4zd5OLKFSyqBDbYsYQsbWfFTkFr5Z2KSqxeGNK2jvv3MUCImBff1F7yhrpcWlu9Gp0Z+IfhQE/nKXjYdESylHlHRjBzsB9ce5OURtOiVFa25+tkzQ4nYjpmGPz3tSSSi79VkZ9/2+lt8NXvbUO1KPLaGV1/HiI0Z0ThfzSWsD86Oa8n/vRHgwxM9A35LPeRUswf9TjxJtzM9GbUWVhPZ0Rf7/D+eHk7uEP4FZ6iVh4fSzgIAAAAASUVORK5CYII=', 1)
    INTO documentos (id,doc_url, contrato_id) VALUES (61,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAG+SURBVDjLnZNNSwJRFIbfGccPCKJMoqSwdBcEobUQWrmIChJs07pVuA36By0KWrTtB7hqGSQSFBGCbdq0ECkhSmgxldmHOuP9aO4VpSEV6cDhHu7c85z3nLkXnHP048/RKO+0r6JPO9nc7LivCErL8vk8p5SCEILWKlzXdWSzWfj9foRCIcTjcaWVo/2mNRoNBINBGf8GizgWi8k1k8nYFNgAopqwi0KzM2oxKAMYZ5YiYHmGwDCM7gDTNGWV8Fi54yCBof4AudKwrEpYUwGxqjPGkZgjqNfrvQHCFsZfuvzO4d4KxEdx8PLBa/XPpQJGm7PgloKN+UZvBRX6LgGLk3oXBV588c/OgJ1ccso15MEKX7X6ZUilUlBVFYqiyDWRSKBivONxvGgDtG+ilTStOh3IV25lNU3TEA6HEYlEZCyg5VoZrgEX1o6W122A7ezWIKhyPuL04ayUlodFkvCWihqpYv9qFwFfAMSkB0uHsdk2gBKaNEyT3+kFfL9Wkbk5BXMyOByONiR9nYZWd+Ht40VcOD8lbLc9A3rs2ZMPw/IqKAq4l/JKxZKtX68yitenMibMgNtteuJ/HtN/7AcakErwOe40HwAAAABJRU5ErkJggg==', 1)
    INTO documentos (id,doc_url, contrato_id) VALUES (62,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAADTSURBVDjLY/j//z8DJZhhGBhw8uTJ/5RgsAF//vwhC7948QJhADkGDTEDtp9c+790ZsL/tD7//4ldXv+X7pmBagA+vOnosv+NqxP/b7ky9f+FZ7v+9+/O+h/er/u/fXHZfwaQKYRwYpfn/42XJ/zfeG3SfxDo2ZP6v39P+n/bfHniEotPteH/bVfm/EcGmy5N/W+eLUmcAZY50t+7dyX9b9+VANbcvjMB7AKgAd+JMgCosCW4R+N/764UsM0gGsQHivcQneaBijuA+BPI2VC6AyQOAPdpPzVHO/APAAAAAElFTkSuQmCC', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (63,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJrSURBVDjLpVPNS1RxFD1vPpwPefoGG+1FZllWEkZSLYIWpiiJSEgt1VUQ/RXSMmgx4LLQRS1CgmpT2DLogz5khoTRwKaiMckZmtHnPN97v4/u+80M5SJc+OBwNr9z7rn33atJKbGXL7Tbg4WFhVnG2LjneSFiECu4ruvzQ+1/CTKZTDMJ7hmGcS0SicMhEYSAek2aRMLA/PzzvwmKmf4BycU0ISh4uLGFN7YFtEAIqxyOG0YhehMeDAgpyEiCk5njOFWDYro/KIW4Gk2c7w6Gk5AeU+CuDfv3EsrBS0h/WiGRpBBCYXBoWLWhDKhqO2E8HOsAK39AINoLzovYLn1GpfEyNitn0H0KqrqsVfdbVwkKH/saSHw9YpzWgSCEvUajdVD6/gIiOQHRPAhh/UIm/Z4qc1Wdcw5z5Eo1geC8VzJxI6J3QTKbPEzQeKkSmVXykJszaCqVcKE9Bit2EV4ooVLI2gwCJJ6OtpzbZxeXUCksQ4scU3/XMAcQd3KI21nECs/gch1Mi2Fdz2GmlAKNspaA8bmt/JuXxB4hLNnrSaNjLMm2S3ArBVjyMFbN22ChVjWDmeW72NpkKoVvsGMPvj7taZKM/4w2nYxXymuQ5ji2jT78yK+ryELKGgOH2k08uD+7cxOFxx83xA/Ev61xnBiew8YWh71hQXB/6nUDWWVZbSFQF3951D0sPNZpF3Nji87ou1dv07AsC7quIxqL0AZqyojXUvjJ/ZUO/VM9Txg9Prmy2AU8SaVSI9ls9pZpmmePdB5Fa/KgEtRb3t+WhH8b2m7XODU1NUTCO4Se+jH57IP2YUnb6zn/Ad9Qrbi4Y2W9AAAAAElFTkSuQmCC', 4)
    INTO documentos (id,doc_url, contrato_id) VALUES (64,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALhSURBVDjLdVNLSBtRFL1vZpKYTCQdUZNUMGahJbTF0roxG7NoqXQZKG6EQrV0Z6kLF0pDDSguxO7aRejKLLW7brRgiSWKVcFgq2JDSUJsYmKi0fw0M+m9Aw0KNnBnwnv3nHPPeW9YtVqF637r6+sDlUqlX5ZluLi48Ltcro/X9bHLBKFQyIGAONYZghOtra1NtL+6upoyGAwWXDMiWYvb7d75h+EugX0I3MamPWwyY8nlchmotFqtTGvn5+d7WNt+v993hWBra2tMFMVBm83GSZJESvtY5lKpBMViERRFIcJ93LegFa6xsXFwenp6jLACPZCVSyQS5IWRotlsFjmOI++qisPhoHWR9iKRCAQCgSqSc1cyCAaDEyaTaZRUKbiTkxOIRqOg0WjAbreDIAgqYaFQILuTIyMj6gQMA9rAcZuxRIvFIuXzechms0S4gv89Op0O0Ja3q6urm8TQKiwtLWWRLI+YQwEf99rb27mjoyNVlRSTySSgBc/U1NQXUvH5fLS2iAJAfU6nU0Kb0szMzE2OxiJvSKSOTipGoxHQTu14qYf2MUy1BzMDmpTssNnZ2Y10Ot2MY4qdnZ0SpY7HRj5XEOghMJb3AYt3K2ufoJKIwZm2TtnTtp2uaTrCtRDn5+cnrFbrKClRYHQKsVhMVWxJboIpHoQOlxt09ttQDC3Az+VFObu781olmJube4Mq4zgBOz4+ViegohOhsfPv+sD57BXow18B4t8ATDcgLdhgc2H5t3oPMAMFA2J6vZ4uFYTD4TxOYOjp6WFEAOkDqLPYAZ4M13IR3lqBV1hbzYLX6/VlMpnnGM5hQ0PD/fr6+s3e3l66lZAcfyQ/fNrHi9HPUC4moID9pzkedsMQr30LHo/nBb7u4Oi3MIMkKvO5XA5SqRREpLvlHyuByp+SHnK8BrIZBr/iTEbp9+x/n/PQ0NAAgvvpiBlj/mHN96Z85uAlLzObzFfjiPrweKEy+RdV4845vRqFoQAAAABJRU5ErkJggg==', 11)
    INTO documentos (id,doc_url, contrato_id) VALUES (65,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALzSURBVBgZpcFdSN11GMDx7/+cv06Px3ePujrqNHG6RYxazbEaxdquuinoIiLqtoIQ1nUrogiqXdTdroLIIroJ2l1GDW0uNzWcHdGpO2tTm1M3X875v/ye5+kIuwi6Cfp8PDPj//Bf+OB8XbYp/UtNqjyLeWCKmCFxTBjGxHFMFISEYYgrhkhQJCoG3F3dWMrnFp71O5qrp44ebMt2tjSwS83YJWqoGmKGiCJqiAiiRizC+OQfDT+Hmzn/wcaqbCaVZDa/ghPhytR1+h/rZWxilkMPt+NiZeLqdfr69jE8PEXbvmZElJ5sLZnWvfW+54GaUZb0WN9WCs6jIGWsF2J+Gp1DRFFLEFFJ6JWzdmeTjmw9ThXP8/De/fJXS7giCTW8RJKjj+5nIypHVBE1VMGJ4lSp8QsMDY0Rbq/hopjVW5v4l6bzr/Rm7KPG2qpkJpNtSZZXektzOZZW1oic4JwgosQCJ595gu4DXTo/vTW1vLWp13K/nfXMjF1vnv1h8MgjnS/1dnVQm06xvznBP7311XGCeJvu1KdMjM2c//rj15+jJEHJi+9/395Yl36+JdNIJJDew7+ELibb1Mf4xhv41bXHuM9/+vQ3XlrD73qf7KnA88FLUFPhMTB4HDNHpI7IOR6o76av9QhbwQ6/F0/XHT4x+t7loc/OeGbG2+cuyInHexJ/bRmdrdUc604zMNjPyYOvIqaICoqxcu8m9VXNXFz4kSs3LhC4sM6nJIg0sXznLvPLOwRhE0Oj0wQaIabk1+aI1eE0JpaYzXCLQ21PsR0XuLQ4vOZT4uKYWJTIOWYWbiJqBGUBThwtNe04FcSU5Xs3aEi3Mv7nCKOz41Y0DvuUBFFEsRjR1rQHcT5qxq3VkC8ufkKkEYGLeKjpAP1dpxjLDzNybYzmuZfjkW/PTfqULE5enSncXu0tq6hCxaGqJOMzpFxEhTNqTBgvDuAlKhnJXWZv/jXW59c/p8QzM/6Lrne8HdFkqqjSdftDW+S+vwHrxbCSH7ilcAAAAABJRU5ErkJggg==', 11)
    INTO documentos (id,doc_url, contrato_id) VALUES (66,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIxSURBVDjLpdNdSFNhGAfww0Cri+gyKLowpMC+LsooEy+SgqJuKqRIiIQKkryoi4zaUmbWSHKdPkYz05xdnKNobmwW6Vi6tbk2TDYl82PTTSr3PXe2s2T+O+dgYwV54S7+vBcvz4/neXleAgCRTf570UXdLda9ORUytW1LDbbkp1TK8h8PLu1rvn92C7houBxfEbA/E+Hn4C6wAQMYTxO8vbkwvMjBYiKED3X7BUQAaFqao6XLgxZyDaxyAp9JArYnBCLjd5CM2bDIupCI6MEEtRjQtWK2rx7t13fzQMUfYHNfx7H4wtQ9xFwPEZuuR+I7jWSgH9H5FrBRI4KeGgTcN6CoKoT3YyMaL+TxwCYBoOi6M5+6i37xgM9YICQ8elnAmKCai4YDJHCPnEDnrUJMdFfxxUg/Ik2JlSPq7anYtAw+0x74zXs54AqYGRLxMN9FK/yem5hySpcMDYfh6hX/DXRR15yhcclS2FEBv+Ugl0OIjFWCmVUgGR9FzE8h6mvGF7MMY21lMJNHecCZBrRUWXhhcrn9ga0IOy4Kxey8BoGZWnwbKsCkbSOGX+cJwFtJEQ9I04C+o5SNTojBuOXc3I8Qn1Nh7v062BUiWHXnWLtD+1TVTxt7anPhfHUayqs7eKAkDajbz3tN5HpYH4swJBfBQq7Fu6aSROZOcAWlLyt3Ch1kzr/iIv0DyHpqirMCvloVJ7MChGJ9w5H0Cq8K6Lx9gAeqVwM8X/6F/Lkh8+43zznRPkqpYfEAAAAASUVORK5CYII=', 6)
    INTO documentos (id,doc_url, contrato_id) VALUES (67,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIfSURBVDjLpZNNSJRRFIafc79v+r7RUKFGMrLRQgqqVUQWbYogaB8VGURQltDC2gS5iDA3UYugWha5iqBF4CIr6JegRUQSTEQ/JIo/pIw/83/vaTHjmDpF0Mu9i3N578v73nOuqCr/Ax+grev+VVuQIxMpG85kK7DcwjIaQE2U2w+uHOz0AayTtu72rbH6WExEfBTQ8j1BFVTnasUWchy/9OgYUBSYmLFBbGVMOq71srqxjsBzWA3A1GKE4jaCZ4QfiQEud54ib0XKEVJZMManZX0Tm1t34RkPVQvigwhGBBGDMYaIZ3Bu0RvMxQyCkDC6vOj3L9ByyEUC+VyGfCYNIqg6nFqcMwigqnhiKeRSqLqlDlRhPDnMz7EkeVfAqWUqO0rOrkFKnPpgkvRsEtRUFhgZrSIymJk/0BiqmTJ5kiiDg7p0DlyJb7xlGC+omLslcZfGgTtExr6S+HyBVrMzgAMLHfwJLYletk32sfHoSYLmTaQ/9FP98kn4eG/kjA+gziHA2PePFQW2v73OhtPnCL88gxfdVNXWsS4e590nLQ6SlJpzo6erXP2OoeeHCVc1w/6z89kvNuA5afIBaqIm6QqZ2oYqKbawJFhajMQaSL3vo/phB9n0CClgesrDegz7ANWBuXei5+mOVF63OLc0wp7o7jB88yqIr4jiexGmxwt8GzWquJvyr9/59aG152cnhts9K3Hr6ZDCrX39hZ5fKo7iczfDI18AAAAASUVORK5CYII=', 1)
    INTO documentos (id,doc_url, contrato_id) VALUES (68,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIsSURBVDjLpVNLSJQBEP7+h6uu62vLVAJDW1KQTMrINQ1vPQzq1GOpa9EppGOHLh0kCEKL7JBEhVCHihAsESyJiE4FWShGRmauu7KYiv6Pma+DGoFrBQ7MzGFmPr5vmDFIYj1mr1WYfrHPovA9VVOqbC7e/1rS9ZlrAVDYHig5WB0oPtBI0TNrUiC5yhP9jeF4X8NPcWfopoY48XT39PjjXeF0vWkZqOjd7LJYrmGasHPCCJbHwhS9/F8M4s8baid764Xi0Ilfp5voorpJfn2wwx/r3l77TwZUvR+qajXVn8PnvocYfXYH6k2ioOaCpaIdf11ivDcayyiMVudsOYqFb60gARJYHG9DbqQFmSVNjaO3K2NpAeK90ZCqtgcrjkP9aUCXp0moetDFEeRXnYCKXhm+uTW0CkBFu4JlxzZkFlbASz4CQGQVBFeEwZm8geyiMuRVntzsL3oXV+YMkvjRsydC1U+lhwZsWXgHb+oWVAEzIwvzyVlk5igsi7DymmHlHsFQR50rjl+981Jy1Fw6Gu0ObTtnU+cgs28AKgDiy+Awpj5OACBAhZ/qh2HOo6i+NeA73jUAML4/qWux8mt6NjW1w599CS9xb0mSEqQBEDAtwqALUmBaG5FV3oYPnTHMjAwetlWksyByaukxQg2wQ9FlccaK/OXA3/uAEUDp3rNIDQ1ctSk6kHh1/jRFoaL4M4snEMeD73gQx4M4PsT1IZ5AfYH68tZY7zv/ApRMY9mnuVMvAAAAAElFTkSuQmCC', 11)
    INTO documentos (id,doc_url, contrato_id) VALUES (69,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKySURBVDjLpVNfSFNRGP+de++2a66Fm3PNdKArUnCaiSijPzCR6qGg3i2itygQetDHXiIf6qWaYBA9+BL0EGhPlZUwQoQo1mpsAxss1Klzc3O72527t+9cUXor6MDvfBfu9/u+3/l95zBd1/E/S+Lb1NTUvXK5HKhWq3W1Wo1VKhWToihmHjVNYxaLRbXb7a/HxsZGef7IyEgfhZ/T09ObLBgMHhJFMdfb2wuuhggGol/e4urFY1CXnuHR+w7YXJ2IxxPXstnsYyLbCFz6gOj1eiNdXV12l8uFVCqF1dVVbGxsoNnTgY+f1xErnERP32kwxrCysnJZEASLLMuQJInl8/kzEnU9arPZEIlE0NTUBJ/PBzoK6ChwOp2IRqMIhUJwOBwIBAJIp9PI5XJGTiwWOy7xxLW1NTQ2NqJa78GDOQXFHQaN9FmYCWdb2mEvFEh+HFwlJyYSCbjdbuOoAt+KxSJaW1sx+01FRRcgmwhmATXBhPlf9QYxk8kYZFVVQQbvq5R4AXLbwHbNTEQRkkAOkUWMNlU3gyZkgJN5Hv/m0VDAq+xV5UvXtV0yFREIosBQKpWMnD8V7BXYV0COwqzXYUeTIfAJ6bsqzFCwtbUFq4chXJpDqW4bB/ryWM8uGQXE7u7uu1ar1XDW46xHWjGjysTdW6YpOKJ+R2L5A9r9NpzqH8BQ/3lU5QxSahjZ3DYk3p134ONxZLMYaGszzOFyC+R+OByG5NvEiQ4/mVpDj3sY7368xKDPj2R8FhJ1Hk0mk/dJjqWhoYEtLi4yXoDL45EM0w97a8zErLjQecNQdmfoKU1skkya4Ub//TH5b7coVy6dk3fodowPP8fEm+uQRQtevJopC//y4jRde7gQ/kSGSkZnM5MQ+jrPfwXZvz7nwVvNExRuEg4SCoTJhSfL478BoeOJpjqa+ZsAAAAASUVORK5CYII=', 9)
    INTO documentos (id,doc_url, contrato_id) VALUES (70,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAK2SURBVBgZBcHLjxN1AADg79eZttvddttll+WxIGrAV4QYTbxoYsSLgjc5arx68qCGf8G7J+NBEg8e9GqURDEmEiOJAWNUwIi8sryWDbSdmc60Mx2/Lxw78caZ1fXVo1EUAYAAACAIgICymrt/7/6P8er66tHPPzklNIJyPgNAENRqAWSzBEFdN9TzWq3y0ckPj8ZRFKmUwuxL6fcXrJzJbJ18xFKv6/LlX1xMP3Nra6jXW3Z3eyiKm0Zp7t1jtWYcaQAMh9uGT7eMkkR2+m9JcluSJEJxQTEZm2Rj00liMkmUeSqEOYI4APr9ndQzi+/v4OPz2m+tWd+zV2d2xaQ8pDfoaUUNcbMlyXIhFAgaQDAcDiXJ2MP1ymilNPn6X6q5OvvZrEhk49SsyBR5alpkQqhBDNDvr1PPDPrLhu89Y+XTbeUre7TXCo9MtzW7+y22I81W0zibYkSgQQB5XkiTzHA0NF6qPHiC/Iv/1FWuMf1WPklMi1SeJubTVABBHACdzkB3OdVfXgbNtx/V+eCsuDpg7+pf8s7ERvcP7daW6eSaqPGOgDgAxsNUkhRI/bZ5x41Zw66DlSdPXbZ5PLUr+kYx+slg8Yj2uW1hNRPQEIKA5cFuFgZ+z0rXpk2DwU53XjtgX7xisrXXoDuycX1B54dLbrQqdbMFYqjr2rmbV13YvKTb7cnzXJKkkqLw61MNh7+6Ijl/3eZK0+3nHzdqBvtbbRAHZGVqq5ppt7qWOn15MdVd6Or/ed2+W5lWkwfPHnbzsZZ2e8HStKCuQUwQQkPPsknItKuOxdC16+I9rc2Jqy8dURxMvHz2oX/27xa1m5irZqWAuCwrVVXZ2PGcjVUCCMIhvMpaCCC8OPdCNBMttESNSDWvlFUlvHni+Hc719dej5oxggAIAAAIAIGyrGzd3Tr9P5JrNp8Zt4rCAAAAAElFTkSuQmCC', 9)
    INTO documentos (id,doc_url, contrato_id) VALUES (71,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIpSURBVDjLpZP7T1JhGMfPn9RaznVZa7Zhl1WoOI1ZtNlmq5Wrma1jMTSG5li1ahWSFJKmjuhEYzVJCDGQUNJI7WYX7ALnhFwiKFvn2zkHKw6d33y27y/v830+++5535cAQCxHhN7+AR23I9Ba30EzMIeTva9BWl4+ljJbRhLqHk9i/trDOLpdDLoeMCAyuZ8oVtP1WVYKYPYsfCv2Eqd9bdB61dB4SJxwNQuHjcZnkAKY3F+Efu/0VZjDV9A9eVFoiIo37L88JQkwDjNCv7CIPm8MheINey+ERIC6/kpFtXkbdhjKUdtVIfITVn9URGRSOajOBv8ClH1yRZVpK9s63IL2kVbIz20RBvkaGI3mAVQgBmosCsd4FG8+p7Gzc0wA1Fi2KyqMm1nyfhNqjHKsP1WKct1GDPpisPLy0/8nePUxhWqdD1xkJReZbXY0oqxjLbtOU7JJf2ceqewibAFa8FKBJYCQgktg49Rg3QMuMupv1uGw/QA26Faza9SrZHyidtt7JDOLsAdp3B3Pixh6QiOd/bdZVY8SGjeJg1QDH5ktbVkp+7OPtsG3SHz9gXuhfALnJPeQHBM0ClVrqOIjg4uMkuMrZIW3oe6fEwBD3KBzScQtPy3awfNIEiq9T/IdkDdeYIEDuJ4ygtcd5gD8QLF2dT76JQU4ap5FPP0ddDKHT/EsInQGRKXWi2KVHXNSUoAjppnRQ4ZwZt+lKdSfD2H3meDyvjKv3+cfGcwF4FggAAAAAElFTkSuQmCC', 1)
    INTO documentos (id,doc_url, contrato_id) VALUES (72,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIvSURBVDjLpZNPiBJRHMffG6aZHcd1RNaYSspxSbFkWTpIh+iwVEpsFC1EYO2hQ9BlDx067L1b0KVDRQUa3jzWEughiDDDZRXbDtauU5QV205R6jo6at+3lNShKdgHH77zm9/f994MHQwGZCuLI1tctgVKpZJQLBYluxj6ty3M3V+alfvNG1Efzy03XGT9e3vu+rkD9/5rAiTPiGI/2RvZNrrSkmWL52ReGNw9f+3hzD8LIHmC9M2M4pHI2upbEqD18tdPnwmzOWJlpi/fmrAtcMrfnld5k+gvdeKTrcXT07FJxVovMHuMtsiUv3/xjzOoVCo3Lcs6DEi32xVAIBKJ0MzCY3My6BN1XSeqqpKnperGiamDUi6Xa3U6nTemaRLoGodEy+v1hlEsjBdXBEGg+Xz+2fgORazVamclSSLVavXMnjGHlM1m78iy7Gi321dDoVAYRQK0UCiMU0pfN5vNXShggH2gDud21gloeNahO6EfoSr4Iopi3TCMBS4aja40Go1vmOA9Ao7DsYgORx0ORxkadzqdS9AYdBn+uKIoTI9omsa28GTzO3iEBeMCHGyCIPQDdDd0lU0AaswG7L0X52QAHbs/uXkL6HD7twnKrIPL5Sqyjm63m00U93g8JdjHoC9QJIYCdfB8+CWmUqkuHKMI8rPThQahr8BeUEWwBt4BFZ33g0vJZPIQ/+s+kcCDDQSTn1c0BElD2HXj0Emv13tg+y/YrUQiITBNp9OdH302kDq15BFkAAAAAElFTkSuQmCC', 10)
    INTO documentos (id,doc_url, contrato_id) VALUES (73,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAACwSURBVDjLY/j//z8DJZhh1ADsBuRPiazJmxLxKa3P/39ki8Mnzwq9GqINyOgPbGhcnfh/y5Wp/y882/W/f3fW//B+3f/m2ZI9RBkQ2+7yfePlCf83Xpv0HwR69qT+79+TDjLgO1EG+FQb/t92Zc5/ZLDp0lSQAf+JMsAyR/p7966k/+27EsCa23cmkOYCoMKW4B6N/727UsA2g2gQn+gwgBrSAcSfQM6G0h2jSRk3BgASP+M7I0sypgAAAABJRU5ErkJggg==', 4)
    INTO documentos (id,doc_url, contrato_id) VALUES (74,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGWSURBVDjLlZNNSwJRFIa1Tf8hElq1qCDJxk22CdsErVvbLotQbGFkZBYWRqCghqv2tXHRokACw4IICvoHbRS/8HPGGbXe7hkcGTU/uvAwA3Pf555zhqsBoGFrkmFgGIcwxRijjIKmJTCIolhsNBrfzWYTf8G+IxgMBrolisBI4Wq1Cp7n25RKJRQKBaTTaVmSSqUQCoU6JLS0JKANtVoNkiTJT6JSqaBYLCKTycgCQRBAh0QiEVnSI6CwAgkoUC6Xkc1me1pqzUTbIWBttDfQO/WttJLL5eRKkslkf0E3aglVQvPI5/OjC9QSaodmQqJ/CYh6vS7PhSTEvwVUBQm8iUOcxl2jCSikQBW44064Hh1wPuzCEd0ZXVATBThjNhzE7Lj+DCPyEcDWjQUr3qUvzj4/PvQv+BInsNxuwHFnxdW7H4E3H2xRK0xHnMTt6+/Vgp9Bc1gPr8L/eg7fiwdrl2bozBOb6ruwyIbEs419L5P5Yhlnz8fwPLmwsDdHIYNaoCPJoKtscnNgJUNvn8XM9jSFdJT9BVHxpMfQmzHDAAAAAElFTkSuQmCC', 9)
    INTO documentos (id,doc_url, contrato_id) VALUES (75,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKSSURBVDjLnVPdSxRRFP/N7Pq1U+q2an5tPqSVPQjhF1hYrElJBBE9RPQY7Ev00h9Q7EMLRSAGhUIP0UNqQkaYCOVDUJEZ9iDqurhGsaDpbOvq7uzO3I/uzK7rWi/R4f44Z2bu+Z3fmXuuxDmHaYFAgDPGYIJSaoEQkvW5MAwj6+3ImLmxuroW0VgMMEnTy4q55Xg2Nr3TWYrx8bHdBNGNDdzoe49/sXveVui6vkNgp/NwREdx59wWbLINjDLBKsAIknohRlevI85dkGUZi/Nz4IwjlUqlCdSvHlsBaYfDVYODrnJwg1igugbt1wJe/uxCgjkhyRIgSch0YSmQrQfK3AqbRl5RHVh8TmxUhAJRObqIV8udmE90gEuyyJUsmMY4SxOsfzmVLwiuFZUeFq+FdG1FqE5hbXkCY6E2zCZO7iSaPtOyOLL0P2CUHuOEeQv2NoATTXBUQZyPWDJK5FV0OAZhYzqSVEEQp5GQKjIK0i3YRfKDQldLmaYuiMoM+Y568dWOqrpulKpBUENHNDyD598vYDb+AzpftQhsdltGAaHD8fDHd2Gt/WZlRTliwddw1naBJKPQE+vYIAeQOvIIHXV5uLi/EpqmWQQy0i1I25M4NDR0n5NNT2thX5OjuF6OrCyR5c3GD8mKS53m1AWDwcfCe8T0RXKm8kWWwLTQyNG3+Y5qj6Z+G55Ur87EDKX7+IlOT0mJE4PPnmoi4bbf77+bO1BZgtBIYw8z6MMtvfjWpHrlSUPDIexzlYESCYaopihFCC0FMDX1Kd7b27snO4DbgUgOC5x/s3bZ7XbXoKfnrCXTLGDCnMCW5iZEIqri9XrP9Pf3T+xSkGs+n29a9Nr85y3M3MzPAwMDbX+18L/2G23Jn5HeUDltAAAAAElFTkSuQmCC', 5)
    INTO documentos (id,doc_url, contrato_id) VALUES (76,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGvSURBVDjLpZO7alZREEbXiSdqJJDKYJNCkPBXYq12prHwBezSCpaidnY+graCYO0DpLRTQcR3EFLl8p+9525xgkRIJJApB2bN+gZmqCouU+NZzVef9isyUYeIRD0RTz482xouBBBNHi5u4JlkgUfx+evhxQ2aJRrJ/oFjUWysXeG45cUBy+aoJ90Sj0LGFY6anw2o1y/mK2ZS5pQ50+2XiBbdCvPk+mpw2OM/Bo92IJMhgiGCox+JeNEksIC11eLwvAhlzuAO37+BG9y9x3FTuiWTzhH61QFvdg5AdAZIB3Mw50AKsaRJYlGsX0tymTzf2y1TR9WwbogYY3ZhxR26gBmocrxMuhZNE435FtmSx1tP8QgiHEvj45d3jNlONouAKrjjzWaDv4CkmmNu/Pz9CzVh++Yd2rIz5tTnwdZmAzNymXT9F5AtMFeaTogJYkJfdsaaGpyO4E62pJ0yUCtKQFxo0hAT1JU2CWNOJ5vvP4AIcKeao17c2ljFE8SKEkVdWWxu42GYK9KE4c3O20pzSpyyoCx4v/6ECkCTCqccKorNxR5uSXgQnmQkw2Xf+Q+0iqQ9Ap64TwAAAABJRU5ErkJggg==', 1)
    INTO documentos (id,doc_url, contrato_id) VALUES (77,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALBSURBVDjLnZPfT1JhHMa56h9o66KrVqtZrWV60U0Xtf6DtjY3a6u7wi1TWIYusQKhBDIWwiY0S2IKOtCFS5DfsaGSTVZrhCAsROX3DzlgJE/vOY3WqivP9pyzc/Y+n+/7Pt/vYanVaplKpWoDwNqPWEqlskkul9ulUumZfQHo29DQEHdwcNA/MDBwaF8AgUBwgM/nL/B4PDuHwzlIf/P5fCKPx1N3OBx1i8VSNZvNDpPJdOG/AFpOp7Oju7t7SyaThVwul5eYKXKBVs7pwPqMCZOTk1WtVsv7BxAIBOZXVlZ+LC0tVb1eL1KpFEqlErYyRYTnXYi0NjNKWi3QaDR1Evqr34DV1VVJLBZjKvXP8RhjsVjEZrqAGxN1XHsDLOsUiJpvIZuIMOtsNhskEomIAZCXMm3K5/MMoKFcLoeNZB7RjW1EPV3IhAxIBDQMnF4rFAr3SOhXWCScOg3429xQZFmN1BctajtrCExfxXb0A7PLYDCI3t7eNZbRaNyjqQ1DA5DJZGB/N4HPxjZUU29RTciQDZthHW1HeaeESqUCLpcLll6vLyUSCWZbtLFQKCCdTmNx0QffdBfSwSlUvz2CW9yK75kpfHx5GVaDlDlKZ2cnWDqdzkonTxtpAG0eGRmJPxfcptZtfdhNvga1dhNu0TlUYj3IR+bgGL60w7nbkWWz2c9Y4+Pj92dnZ0F3ggbQZJVSUSKV/DkSXCXKRflr2y+FrpOjDCPmksP7tKWf6cLY2NgR0teS3+9HPB5HuVyG/sWdeswtw+6WkqleDrWTI7QwTyrCBrU5A/fjM9uuh6dPMcOgUChGyZiCDBPIUME9fLFOpcPYzdpQTZIMkoY/NI1a6RPiPi3sfScMDID8jYfJYITFYnGN9LfmenK+9l7UTHmEZylSiSKVKCf/JOV40EQRE2XjHadsPceohXtHPT8Bse8J0M1mZB4AAAAASUVORK5CYII=', 4)
    INTO documentos (id,doc_url, contrato_id) VALUES (78,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ7SURBVDjLpZNNbxJRFIb7A/wF/A5YunRDovEjalEXJm5M2Ji4aFoTI6kxjcVaCGOJYtq0NlBJ0AS0tcbWSkeQhhQopQwfAhYotAwIAwPDUI5zLh9SdedN3kzmznmfc86dc4cAYGhQZ2ZAJkkhSSlJ1ZWyuyf7M37QeEqSfOxNWW37uk+5fVF6Z3ePDQRD7KY3TL/eSFAj1qIaYzD2BKBrPm1xZjWBvTiTK5SB45sgHreJKjUBMvkiuLxBZnY1rsHYHqQHkKM5GP7O1Rsi4OKFFhS5JrCSqo0W2eN4ATY9fs60HEGInACwLywbM/fMR2UB9gt1yJUEomypAYk834esrruYO4s5bEeGAIWN/kFh2YNmldZ7wjw8uUX2cYUTB2Cwuin0IkDp2o7Q2DOWmjqqw6WHTgLIFBsQz/Fw7p6DAPBbuSbCYYmHuSUHjV4EqPw7uyweVv6nABfHP0vaIAbMfHbMLskBVx97yDtWIYjHsGheYtFLAL5AkAAKlSZcm/LDhQefCACBlx/RcP7+B7gy4SbVdKpowtz8qz5A+WUrRJe4BlR4EdKs1P8Tn9TCNiQPOwaEDU96IXZQI38mmi6BwWTut6Awr8WoVKYA7TYQA5Z5YzpAMqKw9OtP/RDJ1KDZasP6txBojO/7hyi7azlSrzk9DFvunDKaMDtmjGZrxIhPTBCTsuufLzC3jNHOb+wNkuFtQGP/6ORyxSoJLFVFUg2CcJgwczRdBJ3Jwo0aln8P0uAoa80ezYLVzrj9MUjlyuRMsOdQkoUVZwC0hllmRP/u71EevEy3XybV4y9WqKmZedrwzMhO6yl2QmeiR3U26iYV/vdl+p/r/AvMhAk86cw6LgAAAABJRU5ErkJggg==', 8)
    INTO documentos (id,doc_url, contrato_id) VALUES (79,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAInSURBVDjLpZPLS1RhFMB/M/eOr0YzH2mjghPjwoWGInWTMDCkmVZB/QPVrty1GXAVtHATLRIXtWgRBGGB2iKxIEgbopJhTMse9Jrpjoz4zuudx/d9LWxGh1oIHjicc+B8v/PgOw6lFHsRJ3uUPQP0eDweBM4DSClRSiGlzFMhxD/2r95zmKaZqaqq0gB27iPr/89m/UgkInSllOZyubg5JUhZ6yx/fIFKb+Csbuagt4Uz7i/4fD6C4ytYdgprM4Vlp3lw0YcQQtN3Vm2fu0XGfMOPaJTvCxaqbxqAdDrNtZPFSFmYGwtACIGeDQDSNW10tdbRXaDz8u0MEU3LJU5MTOQtz+/3bwGEEFuPM5LXCQ+6voy7rIyp1DGWlmxwbwEMw8hVz3ad18FK9BPV3sM80ttZ+pmiqKKA2o1fucT7Y3f4ujLDb3sNO7mJ/+g5ykXDdgd1+9aYXSxHVpRzoKYAe82mVC4AxTwND7PomqO7y6C+oonns8OMTA9QK9q3AVcCx3PzWZZFMplEygaklIyNDnE2cBrhFBw51MOz90MYLZ08HHmyDYhGoyQSCSorK2lsbKSkpCQHXFidx+VwE2i+BMDVU7d5/G6QjBxFF0J8CIfDzUIIOjo6HKFQSMVisbxft7q+zKwZImJOEuy5S//4BYq0QjSnrhy7uUaj13O93ru/r7P1BE21bXyeDxOaniT2bfWGY7fnbPR6+oHLQCmwDgy+GjCDfwBGL0x8usOKBQAAAABJRU5ErkJggg==', 5)
    INTO documentos (id,doc_url, contrato_id) VALUES (80,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKrSURBVDjLpdPbT9IBAMXx/qR6qNbWUy89WS5rmVtutbZalwcNgyRLLMyuoomaZpRQCt5yNRELL0TkBSXUTBT5hZSXQPwBAvor/fZGazlb6+G8nIfP0znbgG3/kz+Knsbb+xxNV63DLxVLHzqV0vCrfMluzFmw1OW8ePEwf8+WgM1UXDnapVgLePr5Nj9DJBJGFEN8+TzKqL2RzkenV4yl5ws2BXob1WVeZxXhoB+PP0xzt0Bly0fKTePozV5GphYQPA46as+gU5/K+w2w6Ev2Ol/KpNCigM01R2uPgDcQIRSJEYys4JmNoO/y0tbnY9JlxnA9M15bfHZHCnjzVN4x7TLz6fMSJqsPgLAoMvV1niSQBGIbUP3Ki93t57XhItVXjulTQHf9hfk5/xgGyzQTgQjx7xvE4nG0j3UsiiLR1VVaLN3YpkTuNLgZGzRSq8wQUoD16flkOPSF28/cLCYkwqvrrAGXC1UYWtuRX1PR5RhgTJTI1Q4wKwzwWHk4kQI6a04nQ99mUOlczMYkFhPrBMQoN+7eQ35Nhc01SvA7OEMSFzTv8c/0UXc54xfQcj/bNzNmRmNy0zctMpeEQFSio/cdvqUICz9AiEPb+DLK2gE+2MrR5qXPpoAn6mxdr1GBwz1FiclDcAPCEkTXIboByz8guA75eg8WxxDtFZloZIdNKaDu5rnt9UVHE5POep6Zh7llmsQlLBNLSMTiEm5hGXXDJ6qb3zJiLaIiJy1Zpjy587ch1ahOKJ6XHGGiv5KeQSfFun4ulb/josZOYY0di/0tw9YCquX7KZVnFW46Ze2V4wU1ivRYe1UWI1Y1vgkDvo9PGLIoabp7kIrctJXSS8eKtjyTtuDErrK8jIYHuQf8VbK0RJUsLfEg94BfIztkLMvP3v3XN/5rfgIYvAvmgKE6GAAAAABJRU5ErkJggg==', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (81,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHMSURBVDjLpZNNS1VRGIWf67HQ8MZVEtLserNIsk8JA0f1F8JZ/oRG9RNs3ESaNQscFQ5KCoIiopGhhFDgHZRgZEIRSN3PvddqcI5memZu2Ow1WQ/Pu+Et2OYgp4MDns7tcH9hY0dFNgZiBAyWkCEqzVFw71a58B8AYLD3MMZYYMAyMngXRILPm7X9BtHGzgoC29iZTQaSjGRiO2eEGFNFbKSsuJ31P6Qdtf8THZXSBVFC0Sk0iv7CCtcOPSDxFlEmhBxAEFlJmU2aC7HBaZ4zXBmn4tcoGgXvBygoK21D0nzSbxgsT3B0YJyB8I6euEbIA4TAv6JMiKJbGwyFVxSPlYhbTxm6NM1IWEBq5wBizMrp/I6i3HrB4NhNaCyz+GiOnlKdvvoSw8lKnkGqrAAxmlL7E2f6GhR7a6j5BSzi7/ecunGXiWSexdnJ4h6DTF1GsU2l9phS+QqqrWDVuTo1ilrf6Oqqcu7ydUKzdWePgVhdr7G6/ofk+0sqI+c5UvyBw08oJCzNVwGhRpX+s8PEZvv225kLY4W8bVycnfx6cXruRNKxhsOvdCF2TZ10j7L58QPVZzNPOvM2LDRbXcsPp+qWsbTreudFwvbxvyYHcoBEg0hXAAAAAElFTkSuQmCC', 5)
    INTO documentos (id,doc_url, contrato_id) VALUES (82,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAG/SURBVDjLjZK9T8JQFMVZTUyc3IyJg4mDi87+GyYu6qB/gcZdFxkkJM66qJMGSNRBxDzigJMRQ1jQ4EcQ+SgVKB+FtuL13EdJxNDq8Ev7Xu85797T51nwhqeAH5w6cAxWwDgReX7jwYfdaCIraroptB7NLlVQrOoiGEsL1G06GZyxuILicsMUH3VTlOqGKNUMUdTacj+j1Nng0NGAT2WxYosK1bbIVVoiW27J9V8G57WWKVSczMV5iK+Tudv1vVh5yXdlLQN+os4AFZss2Ob82CCgQmhYHSnmkzf2b6rIhTAaaT2aXZALIRdCLgRtkA1WfYG4iKcVYX52JIs7EYvFmJ8wGiEXQi6EXAhdyn2MxQaPcg68zIETTvzyLsPzWnwqixVbhFwI3RFykes+A9vkIBKX4jCoIxdCLrI4/0OcUXXK4/1dbbDBS088xGGCCzAJCsiF2lanT8xdKNhHXvRarLFBqmcwCrbAhL32+kP3lHguETKRsNlbqUFPeY2OoikW62DNM+jf2ibzQNN0g5ALC75AGiT59oIReQ+cDGyTB+TC4jaYGXiRXMTD3AFogVmnOjeDMRAC025duo7wH74BwZ8JlHrTPLcAAAAASUVORK5CYII=', 8)
    INTO documentos (id,doc_url, contrato_id) VALUES (83,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAFrSURBVDjLpZO/SmNREMZ/uVxFCGy7L+AjpAgoIUW4hZjCCDZCbCQgVlY+gaDNLghibbmy2EgQTCOp8gaWYmFrpbE4Z+azuPe6UVE2ZGBgzoHz/Zk5U5HELFFZ2/uzu9ysHT2OVZUAd+SOuSEXLkdmuITMMHd+zIfn29uH/YtfGydpbal2PLdQTX4uTEVcfR7bMXCSjoOS8ePT1NJfghKAVCYONhenBtg+vCcHkAOwcwOnTRiNRkjCzHD3TwmQZRnmlgNQTOG0mSPX6/V3TJNTmqw9FgAl0tY1nGUwHA4xM2KMbyom1Uii0+ng5oUFz1HPshy50Wh8yTp59tJCWaxfwt9VMRgMiDG+y48Kut3uWz/SGAKQP5ZEq9X6lrmMGGJhofCyclGhvyb6/T4hBEIIxBgJIXyaQq/XQ6WC8vJqHSCh3W7/1z/wQlH6cHd/vvM7bLgZbv86biWzhNyQFXvhTsF5DlCZdRsTZoxXOgYqlSAcLRcAAAAASUVORK5CYII=', 3)
    INTO documentos (id,doc_url, contrato_id) VALUES (84,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKhSURBVDjLpZNZSJRRFMd/937fN58zqWPpjBWamYmtlG0YLW+RVEQPLQ9JVNBCENR7UEhFJPUSZZAR0UsLCEE9VGQLLVCG5kJm2CZajjg2rjPfzHdvD4NTRj31h/NwDvf++Z17zxFaa/5HJkDFkVtn3ITYHh5x04ZifzmlxqdeGzK9XKmt2nbYBHCVqDi+b3EgGAgIIUw0oFP3BFqD1mO5xk047K68txNIGoSHXDuQExAHzl5jan4WtqFwtQ3SjxQkQwoMKfja1syJw/uJu0KkWhiJgZQmxUXTmVe2EkMaaO2CMEEIpBAIIZFSYhkSpf54g7E2bTuNNG96kvcvyuivY5NzmcGnL6la+MTfdOHYjnEGcSdKPDoKQqC1QmkXpSQCyB68S3GkAe/8CvyFpfz4VELb/ZrTKQOtoTfSTV8oQlwlUNplINaD4+ZRqB4xL6+DzOIVhDve4REOGZmTSc+e5h9n8L3Hh9UZ/VXQAQrMZ6yb1U7WjLXEvl3H4xN8aWwjMqy1dPoXyDF8rUEaHqRhJ8NMo8DTSEXJW7KK1hHtvoSw+rHSM/CqPi5+WDK89GBtu/yd4HcFBx6wJf8V/pkbiXZVI604zsB0OuveYJQdpcvJcQEkgFYKAYQ+t9LZ+hLZWk355BaCc9fjfK/B8GhiAwV0Pa7nWHMpMrsk9ZVmctaSE3b+5BF6Gm4S0IoEeXxrPsfEoIdoOJ++122I8stUbp4COClSCZDplRGViDLF5xBqqmHOyr3Ync9ov/2cxnth3j9sxL/mBLnBbHJ9cSzpYFtCpwgm2PLGnpMPl4/E9fxV0ZDfab1D4YJVRHr76Kh/r+/4Dg33VLW40AKAbYHX5CqA+HOdt66eNLpoRq65bHYh2oq9GA317tpwqunjv9b5J0pAFDVe4XHbAAAAAElFTkSuQmCC', 6)
    INTO documentos (id,doc_url, contrato_id) VALUES (85,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGrSURBVDjLxZO7ihRBFIa/6u0ZW7GHBUV0UQQTZzd3QdhMQxOfwMRXEANBMNQX0MzAzFAwEzHwARbNFDdwEd31Mj3X7a6uOr9BtzNjYjKBJ6nicP7v3KqcJFaxhBVtZUAK8OHlld2st7Xl3DJPVONP+zEUV4HqL5UDYHr5xvuQAjgl/Qs7TzvOOVAjxjlC+ePSwe6DfbVegLVuT4r14eTr6zvA8xSAoBLzx6pvj4l+DZIezuVkG9fY2H7YRQIMZIBwycmzH1/s3F8AapfIPNF3kQk7+kw9PWBy+IZOdg5Ug3mkAATy/t0usovzGeCUWTjCz0B+Sj0ekfdvkZ3abBv+U4GaCtJ1iEm6ANQJ6fEzrG/engcKw/wXQvEKxSEKQxRGKE7Izt+DSiwBJMUSm71rguMYhQKrBygOIRStf4TiFFRBvbRGKiQLWP29yRSHKBTtfdBmHs0BUpgvtgF4yRFR+NUKi0XZcYjCeCG2smkzLAHkbRBmP0/Uk26O5YnUActBp1GsAI+S5nRJJJal5K1aAMrq0d6Tm9uI6zjyf75dAe6tx/SsWeD//o2/Ab6IH3/h25pOAAAAAElFTkSuQmCC', 11)
    INTO documentos (id,doc_url, contrato_id) VALUES (86,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKbSURBVDjLfVPfS1NhGH7O2THJubmtWUZrYNGFzELRsggLFSUJqosuxaCiy7rsHwiJiDYvCykvC68qIiSsXVgU1NTIZkpZmgulnL82d35+ve+3TTCqb7zfe87O9zzv8/74FCEE/rcSicQ9y7K6TNPUyIO8NMMw2N9X/kUwNjZWQYA+n893trS0DDqB4DiQpwnj9/swOPgU2t/Ao6OjJxgcDAZ3ud1uTH+dA0d3HAFHOEQkYBOZruvQksmkbtv2FjJ5qCiTfTqd/lMyFhfTROSgvaNT/qcxOBQKY2lpWUYX/BOsUkjjF4qJgL8Cjx89RKS2Xkbnb1IBszL4al+CjilQFNrzm/RsqysruHHpoIw4kngNVrvz5Om8ApbKUfmgP7ANqqpCIVMLxs9MIJx8xNoDjfJZFGqgsgJ6JwIVLpdrk6kFz+v2yHl88PZj3j2Fu0sxmZZUYBbao6gKXJq2EV16ToE8r5xlIhSswZP3NzFjeaUKScAbF4RT4IjV28tk/l+yF2E6VH3HQjBiodK7DzVVTVjNZZD+/oYIM7IrkkAt5Mn2eTI/C+F6A+2Rc7Cp77Zjg0cotTyL/aGjWDPWcfnZMTSY3XmCkhIN1y/UyfaYpoVsVkf/lCHB335NkRKaD1Jj2iZW9FXU7W7GmpnF0PodaFTJW/H48+PFQSEf8Hg81Tk7B8u2sMMbJrAtyX4szyBQXoXE7EuMp5Komz+DTXeht7f3CpGcOtR0pDU23o2coVMNDMrXwN5gBIf3dODtzCsMTwyj/mcntuqeiQ2CWCxWSS1baGlpQ7nHQ6NsQ3OpRBrNRKPR8tpraqYx3FoWnxyaMxy0pXrEJ8ZtXCaSvkj2bmDgQUNx/gv34iN/zxoCLybjWHfQvNAjpou43xdyww7T9h6SAAAAAElFTkSuQmCC', 3)
    INTO documentos (id,doc_url, contrato_id) VALUES (87,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJRSURBVBgZpcHda81xHMDx9+d3fudYzuYw2RaZ5yTWolEiuZpCSjGJFEktUUr8A6ZxQZGHmDtqdrGUXHgoeZqSp1F2bLFWjtkOB8PZzvmd7+djv5XaBRfL6yVmxv+QjQeu7l25uuZYJmtxM0AVU8Wpw9RQU8w51AxzDqfKhFjwq6Mjdbj1RN0Zv2ZFzaloUdwrL2Is4r+y7hRwxs8G5mUzPxmrwcA8hvnmjIZtcxmr3Y09hHwzJZQvOAwwNZyCYqgaThVXMFzBCD7fJfv8MpHiKvaV3ePV2f07fMwIiSeIGeYJJoao4HmCiIeIQzPXifY+paJqO4lZi/nWPZ/krabjvlNHyANMBAQiBiqgakQMCunbxHJviM9bQeZdBzHJUzKhguLJlQnf1BghAmZ4gImAgAjk++8jP56QmL2GXG8zsfFCz8skA1mQXKbaU3X8ISIgQsgDcun7FL7cJjFnLUMfLyLRr0SLS4hbhiup5Szd19rpFYKAESKICCERoS95neyHmyTmbmAodQ4vGpAfmEn6YTtTahv4ODiRkGdOCUUAAUSE/uQNfqTaKFu4jvynJiIxIzcwg/SjF1RsOk9R+QJMlZCvqvwhQFdbM4XvrynIVHpfn2ZSWYyhzHS+PUtSueUC0cQ0QmpGyE9197TUnwzq1DnUKbXSxOb6S7xtPkjngzbGVVbzvS/FjaGt9DU8xlRRJdTCMDEzRjuyZ1FwaFe9j+d4eecaPd1dPxNTSlfWHm1v5y/EzBitblXp4JLZ5f6yBbOwaK5tsD+9c33jq/f8w2+mRSjOllPhkAAAAABJRU5ErkJggg==', 4)
    INTO documentos (id,doc_url, contrato_id) VALUES (88,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKbSURBVDjLpZNLbIxRGIaf/9Lfpa1rZ0hNtYpEVRBiNkUiEZFoKjSxQmLBglizIQiJILEgWHQlgkpLGg1BU6E3imorLkElLmOmM1XV6mXm/8/5LH5GI7EQJ/lyztm85/ne872GiPA/ywa40NC3X4TtSnRIa43S4GmNUhqlBU/pUaVQnqC0fnRk89ywDaBFdpeHs3P+5eUDlW8XpgmU1jkAmdU7QQSUB1qB6/rnVBLcFCRdcF0G99bjumrMKIFfPgjkBkB7fon3UyQJbhK8FLyIAuB66rcHSumfAgZ8ToBon0Rrn0T5+6AzyKd5eVi3j7HDuUfnmchWRITTN6PyfdiViw3dIiJS2RgTEZErzf69qiUmg59rJFq/R/o6a0UGIvK1s0paTqyN2QCu0mgRbAuqW+JYlsnVB3FsC2pa4yQSuxjKLmbK3BJ6u17iGCmyJ0wna+rMiekWBLAtgw3hADWtCdaHg9Q+jrO64BVDmUVMKlxDMnoZZ7zB+/ZX9A+ZGMmeRWkC0WCbUPskQWvPcR7eEEI6xvDYPCbNKWMkcg7T8cjIysfxPnC+dwun95a/Nn1HNSJChgWlSwMAFNtDbJw+g4lzyhiJnMXMcEn1F9B9vwNZto/vTggAE/ypA7BMg7qOHnL6PrBYxhEsXkcqVoHlCMn+fLob2mDVSQIFC9M/ZwN4nud7YMKMgTpyJ8/GkyDRZ6eYHHQY6c2jp/Ul5qqTBHLz0VqwTH4TuMpvYcHMLDoaK5i/fAdjPjbyuqaJ9lu9PL/zFKPkEMFQoU9qGWgtetQgSdPBS28Wp5TOzO1KkHpey6xFK/iW+EJX2xvuhg7z5do34GE6C30DI9cBjD/jvGnllOElhdPscNEsJCPZPBxPbCs92vnub6H6AWmNdrgLt0FkAAAAAElFTkSuQmCC', 5)
    INTO documentos (id,doc_url, contrato_id) VALUES (89,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJGSURBVDjLjZNNSFRRFMd/970ZNbX8KCHUCVxM4CYSDaKkoAgywk3gPoyCyFq0cW0bSUTIcNEm2uWqUEIIrEUqUoFZuZAEFcPGD9LRGOe9+3FajE5jCnW4l3O53Ps7/3PPPUpEmJ6eFucczjmstVhrMcZkfe7UWmd9S0uLigBYa6msrGZ9YwNEIDNABAFEJLtGhLKyUoaGXgGQBawnk9x9NMr/WNetU4Rh+AdgjNkOCdWxYxQX5hGrKKIgP0JaC9o4tAUrMP7+E+KEIAgA8AC01hmZgFKKVNqQWE+TCiwiYKwQGkdgMmdE2K1Aa43b0acUSik2UwYnAaVFUSIRH88Jsg1w4vYCxGUQKgeyFVpC7SgqzMP3PTyViSFuHwA5KSilMhBAlCIVWJQnmX3A/Z1CGIZ4vgfA/NzsP6vgR/y9gLxohM4bJ7FWiEajLC8tUVR8CBFhbW2VRDDD5MIom1tJugaeIfZARrGI0N/f3621Pp/zy8q11m+qqqpajTF8WBieKKmxdfW1DVSXx3k79ZLxr++Ym1ntVjvly7Wenp57xpjms43nLpSUlPFwoI1rV6+A79Fc20b38E18PJ6/GEhHci/29vZWaK2X4/HjlB8+gtGQSKzw89cKUVVMU20rAPcvPmHwSx8wULALEARBQywWo6npMsYYRAQR4cFgkqnFMSYXR2i/9JTO19cp8PMB0ntS6Ojo+Ki1rs/twHk9iVfzgzMnGokfreNbYoKxzyN8n03u/wb72ek7lZ3AbeAgsAn0jT9ebP8NoAhq3YVujicAAAAASUVORK5CYII=', 5)
    INTO documentos (id,doc_url, contrato_id) VALUES (90,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIsSURBVDjLpZPNbhJRFMf/w9fwNUiVlZWPncSmqemm7FjZaGJcsdCkS17AJ8AH6BvU6BKfgFIXLqArTQngSoPUDSGEhAUCLQN3xnPOMLSJGBdOcnK45J7f+Z//vVezbRv/8/luLxqNxvvlcnm0WCx8lEFZwjRNzh8KhcKrjYBWq3WHCt7G4/GCrocxpyJYFkQbKdzaiuPs7PQlrf4ENJvNp1ycSCS2I5EILn/2wN0ty4ZlWwSyoQg2n883j0CbT1OplCyurq6xoOKvrQsCWOt4cvhMxtgI4BkDgQDG47HTWSk82nks3e1Vdzb6rwqYrKiIN/GBsPRW8wtlJd35ixl5JJNJVKvVIf0XpP0/KH+kfCIKHK9sATFgZ3dfuosH9gJGNIx8Po9oNJrweDyYTqd7g8Fgr91uv/C4szkKWDJBlDP70LjEtZoik8lA1/W1bB6ZFVHDhwJYF6sb4xj07tsJzKUp3vR6PQyHQ/T7fVBnuR+s2MPmuLeRJcvxWU5+fe8NQlpYOrJ0PubRaIRgMIhYLCYAMZE3eL1eZ27FrhOAVdEathK4O6rrGX+sjBV8rtfrmEwmMAwDwZBON1ATkFoZ627m36trfQMoFosHnU7neaVSuTg/r0EPaMikHyCV2kY6eZ/tFfmscjabwe/3IxQKCYDH126/xlKpdEj0Y4pd9zFls1nkcjmk0+m1F6yi2+2iVqt91/71nMvlcoCkFymOKO4S2EedfxHkE8Xxb6/5rMKMZgtBAAAAAElFTkSuQmCC', 11)
    INTO documentos (id,doc_url, contrato_id) VALUES (91,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIJSURBVDjLpZM9SJVRGMd/532vetOswQgjSoW2gj4Gh4ZoiIKGwGi4EtQQ0VxLQhAOEW2NzUVLOQRBBioUakGT5CBiGhZe8aameLv3nPc9H0/DvX7hHQSf4ZzDgf/v/3/O4VEiwl4qYo+VWT/I7EdxxSVEUsRZxFvEpYhLEJ+ANXhnEKfBGg5ef6W2A7yj7lRuh4MIKKgugMBKX/fOBMlqnn0iSNCVCwUiAVAImwQVNSBW12jBOUK6gCt+g5Agklb2kEIwSDBI0NQf6iLYcg2ATwCHBANiq6KtYoOEMohD0hoJ3L/lSuRtzpoQTBWiIeiKiSvtBARvMD9GcMk0+BTE4c0a2bbDFedgEK9BQu038HoZt5Zn/5mbQCCkvyiOvUF8GaRMYXiawvAk5fm3RI2K7/2ZnssD7tkGQIlg/4yzMjTKgfN3UUoRxG6IS1OWs7mHNHScRI8PMDEy+GTwUl0p2vrfzZ23sauLrA4/r4oN4g1zQ2OcuHiD7Mxn1MtuGn++o72tJRYl9zcS4Awqjmg6dwc90U/x63viltNkWy9gl/rItnbA1QebvfceIQ6qXa0P0+LraxJsgjiDWI3TBSAiUoqpT3N0dt2i6fcHEr1AGSiuxUzOkFe7mcbR3NHe+uamR8daXCYTzVFcdMwWYm+NPFa7HecvueM9pb/z92Kv2nwseYEXVwbc0/9TqFA0aM0H7QAAAABJRU5ErkJggg==', 12)
    INTO documentos (id,doc_url, contrato_id) VALUES (92,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAADTSURBVDjLY/j//z8DJZhhGBhw8uTJ/5RgsAF//vwhC7948QJhADkGDTEDtp9c+790ZsL/tD7//4ldXv+X7pmBagA+vOnosv+NqxP/b7ky9f+FZ7v+9+/O+h/er/u/fXHZfwaQKYRwYpfn/42XJ/zfeG3SfxDo2ZP6v39P+n/bfHniEotPteH/bVfm/EcGmy5N/W+eLUmcAZY50t+7dyX9b9+VANbcvjMB7AKgAd+JMgCosCW4R+N/764UsM0gGsQHivcQneaBijuA+BPI2VC6AyQOAPdpPzVHO/APAAAAAElFTkSuQmCC', 5)
    INTO documentos (id,doc_url, contrato_id) VALUES (93,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKESURBVDjLjZNPaJJhHMc9ddulU8ei/WkQRQwanbLD1JweDDaI/q2cDhQWOjGNwXTCBk5BbeRczZZjNx1sNWaBS802CNPDOpgo2y4h4kT8O53x7X2eoUvaYYcvPO/vfX6f5/P+3vdlAWBFo1FecGYYm5q7+Pz0Clgs1s0z5iJpvhYOh4vft0P4sR2A90kX6vX6mUIhGo3m3Orq6tCn6RF8mx+B93EXKpVKS0qlEorFYjP5fB5HR0fHgFYDPzYedP4HaEAaKRQKqNVqrQYbhhGEHFJs3O/E4eEhzcvlfWiW9vGCidq1B/XiHlRMiEUT0DTYOjZYH+xEtVqlIc1L/jRcTN5/SWNxMw2Fc5cCiFWLwfqkFF9fS/BxoIPSSf49dYxpVL5N4PmbBJ1BuVz+c6rB2r0OOiACaDwKCTmRPDtpzuVyyGazRQbQc2IwIUFwdhhrovZm89i7PSgWkhidT0DuiEM29wuyVz+RTqeRyWROmcGWH25hO7xeL8xmM5xOJ4xGI2KxGA4ODpo1k8kEl8uFtra2O02DD+PMl2h5Bq3gFqxWK1KpFJLJJAKBACwWCxwOB+LxOK2FQiG6h81mL7UYLMzNQq0YRWRnB1NTUxAKhZBIJLDZbNBqtXQtEAig1+spRKlUFk4MtGKMPeLBoJugADIwHo8Hn8+HSCSCYDAIj8cDLpdLXyMBMKBqi8HMtAFyiZgCdDod+vr6wOFwIBKJaMia1BoGUqk0Tw1UKtWl5f6rcAz04GE/hyqT01ZWVmC326FQKMDso2tSc7vddAZ8Pn+XRX5nkqGO87fHb1yYHLx+Wc+o/xaLxWWZTFaVy+U1Zli63t5eOXNdIjVyj+zp7u7m/wVntrWV38u6ZgAAAABJRU5ErkJggg==', 5)
    INTO documentos (id,doc_url, contrato_id) VALUES (94,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAF+SURBVDjLnZOxalRBFIa/e3djWGyE1GJhlcogRLCwshPrgI2NjaCktZZUCVaB5A1s8gI2PkMKGwu3CIIgKGuuu5ts7pzzH4t7k5tZSVw8MDPMmcPHnP+fKSKCFzsfXz1+uLp9PIubEoSEJJI3q0nIHFMw4IRPn7+/fv/26R5AH+DR+upub2lQrixBRBBARDsARRABiub8zth2gQ4wTVFO6hMioi2CIJDIcueg8cxL2ugDuAWbT26zaLx8d0QGMPcriyMAuhb6vYI6pRxQVeMrAUUBUFAUULS56sfo4rwESNfcIIO1azLPb3A0/Hq4/+HW/V+n4Arkjlwkc9yFyfHkuMRyTJHpMAOsP7i31lsesHKjs+qy8vMu/K7qtQwwPlNZzSZIlz2Pv/cBUjCdtzElsfXs7sI2brz5kotodr2I3cuMRsRkOcBd/1a/m/CzuXdw/HO0mIWtj5NqlAO+DYcHz7dmG26GJ8dSan5fXSNv7JMbYSJZDcHBBfi8r/+NP5dvHwJcdb23AAAAAElFTkSuQmCC', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (95,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAArSURBVCjPY/jPgB8y0EHByf/4IVDBHzzwBUTByUGgAK8jX/zHDxkGQVwAACuKdiqzzuaTAAAAAElFTkSuQmCC', 5)
    INTO documentos (id,doc_url, contrato_id) VALUES (96,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGaSURBVBgZpcG9alRRGIXh99vnKIGgrbaCl5BOC2/BJgi2NmIlFoK9oI1CIJ39kInxhxReh1VKCZmfQkiVTOLs863l7GAau5DnCdtcRzx+ufPi4aON98cLr9uAhCVSiWVk4Uxk40xS4vbNenpwMH395cPmdr/xYGPrxtp6ubPGVayfLnIL2O4X1WVxfMJVnVUXVnqnefv0Plf17N0hTW+LZjkkBiyTAmEkkxI5mBxMWizT3Lt7i1TS9Ng0UYKwcQkcJhSUEkQUIpLoTKdCP5hGQ9L0qaQpgCMgoDMoQDKdoURHH5BhsohGKZpimdFoxGQyYXdnh9nREXvjMbPphO97u8ynE/a/7jKbT/ix/5nf8zmj0QgpufDq0083g+RB8iC5Zrpmepnp80z/qdVny+rFsvrkvLp58uabV+iHWrkQQQC2iQjMik1hpRQ6IG1KmGaoA03vFE0HmJUIsGkigksCuggs0Vii6SVxKYBgJYL/dfzTdTSyafrpr8Px8491U5koRWYiiawVScjGSpxGFpaQaMashG2uo3BNfwFx+DLsFQ4W2wAAAABJRU5ErkJggg==', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (97,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAMOSURBVDjLVZNNaBxlAIafb+ab2Z3N7Oxv/nYTEyv2LzQJpKBgrQqNUKmY4kUIXqUHT70p9iB48CKIiN5E0It6KFiwiv9FpAVpKUggNc3mZ7vpJpv9n93ZnZ35PNRI+8B7e9/n9gqlFAeIVUfPeN3zh0R0eVpYM1OanhvTCEY0f3tU79+ctnpfHM73fuQhxIHAWHnmkOGXPjgZyS09l5hnNv4YOdMhoQmigzqGt4nhfeub1fpnVsl/e+hMv/q/QKy+Me0EO5dfso/OvzB8grgV4HGXJC7jwAQ2oxxDuC36xZ+Rhe+v6iutZf2iqklReNe0tPSHZ2Nz84ujR7ht3iJKjcexiOIQI8SiixxcR7QtRORFlK7O9t0rlyy4KBEj5+YisVeez85wy9zGIUeGDDYhDhYOITYuoh2BvTJ68y7B0GnCym8XGq+KL2U0MrE8Z2SRVhqdPmlCsvgk8RlCkgAivRbUNKj1YPMeeu4wcnjRql7/+jVpyvxsPjbK3whi5LEAB0WWgBRgqwAaFah04X4V7puwdwddz+FXjJMSbXI8aSTYCgU2oKMwEdgCEoDhug/G5SjsmFDUoV+DXJ7BnpiUVCNBaJqEXfDVfwG6CjoKnF4crZGCVvNBug0IPXzPZOCnAunfk8W6ro7H2gK3A02gGoDeA1MDGx2nkYG6C24bvDaMSzq7ZfxBsiC7O+aNDaWOn0oLfl0HMwDlQRCAHYUkEGvFkLsp2G9Bo0n41AiNG6sMBvY1yZr6/JsV//XZZ3WZaEp2t6DvgWFA1QRHQbwjSDeTUGvCiSPU1ovU/typQPIrTV0yrrl3vE+/+8XlaCIgq8H+BtSLUN2C2ibsl8ArR+HYGE0rwvbvRTr96HsL6od1CUDDf+enK92JwT+982cWEswvRmiug6qAr0E4AV4uoFXosnV1g8bN5kcp7E8eOZOYKtmUqm/ZiDdfPhV3Zp6IM5k0SIUBstwmXKvCX5UdM6y9n2b34wV1IXxEcEBU3J4dprU0zODpjFBTIyoIxgjXxlB/PIl1eUmdLjzc/xceOVXddrB6BQAAAABJRU5ErkJggg==', 8)
    INTO documentos (id,doc_url, contrato_id) VALUES (98,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALJSURBVDjLpVNbS1RRFP72nHGaUedmpamj5pgKSUli0eXJfOipoELs+hA+FFT44oMSRBkZ1GNC/oAoCJ+C8QaSZhdCTEU0rbyP05jTzOTczv20zkz6IBFBBxZrs9f+vv3t76zFNE3D/3zGjYXa01OuKUqtJstZqizPUnSb6+vDem29o8OpiuIFimZFEOZUQXiY09rq0WtMV6B2d98k8F2YTU4YOKjRCKTw+qQqSZcJFKPoTMty7Nu2pwRKJILY2DjiPv9TIrvGlK6uk5osvjSUl4ERGJIEmEyQlpeRmJpeUkQxaikp3mt2u4FwEPoFcDgR6u1FaHzivpGk3uDy88DiccDnBxQVkGWkFReAO3SgUONFcGYLMDxC71RTF1jTYTt2FIEPw1eMJLOCs9mAuXkqyoBGhxQF+PQFBjvtcwyY+aq7BIhyKgeCYCUqFJ636QSmJIAXAEFIEYhSimTFl1STvFkPjfYEqqmUJRFkpmokg9bJ+Z1MpgKfIICSAutAZcs6mSmMBvLCADLRYCCWfnlmBnDlAbEokCASnqcbhFQW+VRO7lPQX0CpG4GB17qCZyzc3u4mFf2WItdu864cYHIKWAv+bg5lU4V3bYxiFLHQd3CZNqT9zIynx7PLuAceTyg2OPiK9/kPqqEfeWmV+8HSqb8WvSkwue5dHUXIHkbFmQaUXmxETrYVIX6FC0YmFtlGK39rabHTm5pIVqOzqtJqzc8F3r2nNoxiaLkT1Q1NsMwOkLFvALsDAWMRPvYNzbOtszDf0FBNRI8dxYWHd9TWJE3rbzuF449egFWd3jwXvpOLkaGAxv40TJ/r6hxEco+8ue4syGVTC88TR85fsmQseSAk/KCWQ2Sdw/QsVtjfpnGipuYs9Ykr4pp3mqwZtwq2y0ajwYvImoyFVU6ReO02+9dxfnuusDkW9F3lFFakcNoKoZ6c6JPbfgHHGqU/+iLy1wAAAABJRU5ErkJggg==', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (99,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAArSURBVCjPY/jPgB8y0EHByf/4IVDBHzzwBUTByUGgAK8jX/zHDxkGQVwAACuKdiqzzuaTAAAAAElFTkSuQmCC', 4)
    INTO documentos (id,doc_url, contrato_id) VALUES (100,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALMSURBVDjLfZNLaJRnFIaf779PMuYPmSSjCUmYKBXREBLwEhUXIm2otlRBN1WsIoJLRcRdN0VEcKWgC1trV7pQBHGjokKrYBFNWsQk2gwpphNzGWcymcx//T4XIWpQ++4OHJ7zcnhfcenGk9NSiu9nA+n4ER9LLRxNAxyTiwe+6z4MYEgldm/b0NLgOI4QQuf/5EmIo5Brd1/+AMwBZn1p27Yjfrv/Bo8pSmKQTHqchFkkUpL8dIJnL12q1AoMUhzdmSGWQsxDjSACTdPRBATaGJn6cWxrhKJfIoojDNumvWUJ2eFqaq16pFzoygCQgKYJfDWBZb6hUCnixx5BFBGpMrZtU/YTpBIaCrXgMe8BQqAiiR+HeJFPJfQJZEQsARGiZEy79SeFmz/yVbLD7f/luBLe6F4DQKk5gEMDpXIOpZv4skwQxZh6gnIpydq6SXob8yTqd+NmuihklzNw68Kp9wBNkNSbGR17jevkqKrWsEXETL6KVGmGXWvqqXG7yf/zHEsELKpZTDLV6hrqQ4DZSFOii1dP71Gb/A8Rx2Rsm+2bV1PbvgU/dxmrSjDSN0DoBVNeZWb9OweDUweJpSSWki/8CXpa2hBmkabOLtylX+ONnkezIsxkG5qXVeG0t2X1kdtDhlIKAfTOBQsAvaNAYfg+y5qW4i77Fm/0HJoZEUxnmHzQx6Pq/eU9B3b0AWjiE3n1J4dIORaNK7cSjF1AtxT+dBuv/3iM3XuWopWJ53c1xxRFZEhneh2di3tY9O8r0pUioWwm9/cZJB7lfDOTjwao++Ycdk0KQxfvLhqWIa5cvTfcE8SqQylIZ391dx76mcHLRxn6/SF2aydePidHWg/Plh8UYkMvYGpcmgcIpRba/+ngqvDY/kMGWkzfneuMZF/MuA11G7880d//qYJ9BNi1qa7S3Z421qzIoEz/YWV8Yt+2k38Nf66hbwFu+Dui0xbh3gAAAABJRU5ErkJggg==', 3)
    INTO documentos (id,doc_url, contrato_id) VALUES (101,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAACfSURBVCjPY/jPgB8yUFNBiWDBzOy01PKEmZG7sSrIe5dVDqIjygP/Y1GQm5b2P7kDwvbAZkK6S8L/6P8hM32N/zPYu2C1InJ36P/A/x7/bc+YoSooLy3/D4Px/23+SyC5G8kEf0EIbZSmfdfov9wZDCvc0uzLYWyZ/2J3MRTYppn/14eaIvKOvxxDgUma7ju1M/LlkmnC5bwdNIoL7BAAWzr8P9A5d4gAAAAASUVORK5CYII=', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (102,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIMSURBVDjLpVNLaxNRFP6STmaKdFqrgYKWlGLSgoiKCwsKVnFRtBsVUSTNyj/gxv4Bl678AyKCoCulgmtd+W7romgzKT4QMW1G+5hMpnPnnuuZm6ZNawoVBw7n3pn5vvP4zkkopfA/j9F8cafO3FekCjGpIgKIvayftTXOkr71jkz2/UXA4HxXfz72gIx/lBsWSfiVtwiWHK8B3kRQeX/6lmnnkuDAwn0MJSKQEFChQCp9CcHixxgsGWw3B01uRKfx9t1HIP1POpoSdUulLyD0vqO26IAkDW7tgSZYeHPqcmpXxkTChKzOaAKSEdo6jnEWVY5ehFxdHs2cn55rScDR73H6DKyyRWs1R0haGdR+z8YZ3MyMTj9rpUKi/PLkUJuZfmX3nkNYmQBxzYprpyCA2XMRrvNAcdfDhgKkm6ttKTdW6jH4w4RpD/ALAaNzhH2kSwALoSJCd9+VhIqEVVeD4C1MclaOT0Ke0Cowq+X9eLHapLH23f1XreDzI27LfqT2HIfvzsRAyLB2N1coXV8vodUkfn16+HnnvrPDhrmXsxBY+fmOwcVlJh/IFebK207iuqSShg0rjer8B9TcWY7q38nmnRstm7g1gy9PDk2129mjinjy3OIvJjvI4PJ2u7CJgMEdUMmVuA9ShLez14rj/7RMDHzNAzTP/gCDvR2to968NSs9HBxqvu/E/gBCSoxk53STJQAAAABJRU5ErkJggg==', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (103,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKfSURBVDjLfZNLaNRXFIe/O//JTCePxqQiRq2CDcQkGFoQF0VaCS4MAVGoiEhDpEigi0JxXYKhthTaTRcuVOhCIgXBFCtVCLb1laoNKkl8tIyPSCoTY8aOJqP538evixiZUOKBw+Uezve7h3PONZKYs81fntPuLfX8MZonOOF9wPtA8AHnAhveeYsDvVcZPPCRmWOSlFjwnhCEsy9BN3t6N+vOCe98KUKi9PLqNetxsaex7BIdb36FjT3W+lnB1wkE55kuWpZVpbGxp7X8J9bV3mGpbvN2dYap4gzev7YC3/Pn8DiL00maa56yOjVEoraVTZVnWFKR4vK1MYLzPQsKnPumrXvk74mey0M51pf/RrJuO4lF79Oc6OfK9VGG/8r13Ort7C5ljCTsxVUZKWpQUBQEX1zs6OpqOb1nZcseSKSIH/zIkfPRzzuahvZJCUIQ3hYn6rY/emAkEZ+tG1N543IJJKEgEjUfQPkqZJ8gW8BODuGLjxCGYC3xs/vE+ccdRhLF42ZLsPRGTZ9WJpfvRHGOED8h2Dz4IsiBSWKSVQRnKQweJT84coI0u8zcIhWOmPrgOZlas60hWrEVxePITaNQRP45mAiXf0ju1DEfP6O75Xvtn9fE6o+VJc26F/f6+sLTmyAhzaAwA4oxRIz/eixvZ2ibg/83hZqdmjKZin5byCIDKGAwII9CgIiptd+qf8ExAog32stq3sWYJHKOOP8QU1ZLIlVNasnSlcP7zNrS/Hl/YbJvcSaI1mhRE4Ur3zE5MJDFcKGiob6zas1G0nXN5O/k2oHhBTbRfWgqV2cmTu5l4veBg87yXuPX2v3v7Wzb3eOH/4mfx7yYpn1+ydIrHzvEJ9n93B35nM2lcUlc+ozqM7v44Zdt3CiN/wel+5Gy/cSN+gAAAABJRU5ErkJggg==', 3)
    INTO documentos (id,doc_url, contrato_id) VALUES (104,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJOSURBVDjLpZI9T1RBFIaf3buAoBgJ8rl6QVBJVNDCShMLOhBj6T+wNUaDjY0WmpBIgYpAjL/AShJ+gVYYYRPIony5IETkQxZ2770zc2fGYpflQy2MJzk5J5M5z/vO5ESstfxPxA4erL4Zuh4pLnoaiUZdq7XAGKzRJVbIBZ3JPLJaD9c/eCj/CFgZfNl5qK5q8EhTXdxxLKgQjAFr0NK0ppOpt9n51D2gd2cmsvOElVcvOoprKvuPtriNzsY8rH+H0ECoQEg4WklY1czP8akZby51p6G3b6QAWBl43llSVTlUfuZE3NmYh9Vl0HkHSuVq4ENFNWFdC+uJ5JI/9/V2Y//rkShA1HF6yk/VxJ0f07CcgkCB7+fSC8Dzcy7mp4l9/khlUzwecaI9hT+wRrsOISylcsphCFLl1RXIvBMpYDZJrKYRjHELACNEgC/KCQQofWBQ5nuV64UAP8AEfrDrQEiLlJD18+p7BguwfAoBUmKEsLsAGZSiFWxtgWWP4gGAkuB5YDRWylKAKIDJZBa1H8Kx47C1Cdls7qLnQTZffQ+20lB7EiU1ent7sQBQ6+vdq2PJ5dC9ABW1sJnOQbL5Qc/HpNOYehf/4lW+jY4vh2tr3fsWafrWzRtlDW5f9aVzjUVj72FmCqzBypBQCKzbjLp8jZUPo7OZyYm7bYkvw/sAAFMd7V3lp5sGqs+fjRcZhVYKY0xupwysfpogk0jcb5ucffbbKu9Esv1Kl1N2+Ekk5rg2DIXRmog1Jdr3F/Tm5mO0edc6MSP/CvjX+AV0DoH1Z+D54gAAAABJRU5ErkJggg==', 10)
    INTO documentos (id,doc_url, contrato_id) VALUES (105,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKkSURBVDjLdZPfS5NRGMf9B/wL+keCbr3wStArL/RKEdQLCxGEGqLJgkQx0A31IsUmKRbohSxds2Ws0ja3ynLzR20sdb1be3/YptPt03OmSRN64fOel/f5Pt/znPOcUwFU/Ev9A/ctYUQICpqQESKCU8Wu6/9NrBQcQv5FIMbnuMG31Ck/rDMS6WNWgnFU7FJTWWZwmex2rUY4LxRJGPB83eTZR5N36VNyIioIKqY0SvvX5K+BQwX0PKXHEvW0T2fS/4uwXqAo/2TAKFzEL00cJQP5uCkUYuk8029TRFMXoqVADufLFLvHlCo4kpcl46miWFQGBZVbmn1Z1rf00WDCpzG2qvEpATtH8DZqyXJOSJ9AUgwMKSVzDqawfLEnDmUQCsd0pt78FIMkzldJFoMGc2u7SnComH+zhyVJTqeTr9oZ4R/nhGOGioeUQWor8VtmTjImyeNi8n7PUsED4cYlB+MTE3i9XoYejTC3npYqs0qTujJwepM4PEeMeA5Z3y83eDw5ic/nwzAMPB4P9+0PCcWsK4NQ6HsGh/ewlDz7QZeNLKLKVuW7XC78fj+WZbG1tUUmk2FhYYG7th7q7Uvhq0307+cIJyGehT1T0GFmZoaNjQ2y2SzxeJxIJEI0GkXXdZRxc3MzV23MS2uS0qPtDAQO4XUMpqafMCFrHx0dZXh4mIGBAex2O729vdy+fYeGhsZs2UHSpF1hDdYkeXmnyOKXM+bDOWaDWVwbFk8DJuuxfPlBun6UE2aRTalgZeecwcFB+vr6sNlsdHV10d7eTmtrK42NjdTW1uZqamr472UKfjfo7+/H7XZjmibb29sEAgE2NzfRNI2hoSGqq6vLr+b163zP1lPs7u6ms7OTjo4O2traaGlpoampibq6urOqqqrjPwDsCp2+T9HiAAAAAElFTkSuQmCC', 1)
    INTO documentos (id,doc_url, contrato_id) VALUES (106,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJUSURBVDjLhZPPS1RRHMU/997nzDihTx0zFxrRxkqyQKNaBBGCWzetXUhYCUKLfrhtEdFGCqEWQf9AuK5FQouiokWrFoYuBioZ480o47x57/5q0cw4ReUXzvKce8/3fI/w3gMghBgCDgGK/08JKHrvHQDeexoi4/V6vaK1tsYY/zfU63W/vLz8EDgCSO894sKtF2Z4IKcS5XHG4qzHGEdeKDaKEasPpnDOkaYphUKBra0tVlZWHs3Pzy8BxSCXzzJ+cpC1qEaaGoy2OOMYKXSytl5CSon3HiEEAGEYMjMzsxAEAXNzc0vSGmsq2zFHuzpIYk1SN4z0dVKuxOAsSimklC2BTCZDLpdjdnZ2ARiQ1pibqx++plE55nghz4n+PFF5l1dvNrhx+TRSSpRSZDIZKpUKURRRKpVaGxX23VD4fnPs+bGe4uQBVcVZTznO8M1PcerSXVBdWGt/g3OOMAwJguBs4CyLZ0bHJkXfHZxLkGabXr1N1+ZL4s/3yY/dQynVjBohRDM1AKTTtWuifxqrK9i4iN1dx8YbyL4Jdj4+aRGbVpRSBEHQEgis0d3Sg7dVsDW8reF1BYQiKe/seW28rJT64wfG4X2Kt/Evsqvh7S7YOjrZO7RmlO1kAGl0uuP1DjjdEInBW7yponV361pbBCmRUrYJVPXj+MszhOxAZg8ic4MI1cOPT2/Jj179bXntaFn7/pQwiVisRVx3KV06BeN6Cc9d4fD0bYJ8+K9SuSAIzou2Nk4kSfJaKZUD5D6NdNbaWjabvdguMNyo837k5lig9BMTlFjmy9KhMwAAAABJRU5ErkJggg==', 3)
    INTO documentos (id,doc_url, contrato_id) VALUES (107,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIvSURBVDjLjZPLaxNRFIeriP+AO7Gg7nRXqo1ogoKCK0Fbig8QuxKhPop04SYLNYqlKpEmQlDBRRcFFWlBqqJYLVpbq6ktaRo0aWmamUxmJpN5ZvKoP++9mmlqWuzAt7jc+X2Hcy6nDkAdhXxbCI2Epv+wlbDeyVUJGm3bzpVKpcVyuYyVIPcIBAL3qiXVgiYaNgwDpmk6qKoKRVEgCAKT8DyPYDDoSCrhdYHrO9qzkdOQvp+E+O04hC+tED63gBs+QiDnhQgTWJYFWiQUCv2RUEH/g4YNXwdcT/VEJ6xkF8zEDRixq1CnriD94SikH08gikJNS2wmVLDwybONH3GbNt8DY+YMrDk/tGkvhOFmKPE+pxVJkpDJZMBx3JJAHN+/MTPq8amxdtj8fWjhwzB+diH5ag9y8V6QubDhUYmmaWwesiwvCYRRtyv9ca9oc37kk3egTbbBiPowP+iGOHGT0A1h7BrS43ehiXHous5EjoCEx3IzF6FMnYMcPgs95iOCW1DDXqTfnEBqsBnRR9shTvYibyhsiBRHwL13dabe7r797uHOx3Kkm1T2IDfhhTRyAfMDh5Aauox8Ns5aKRQKDNrSsiHSZ6SHoq1i9nkDuNfHkHi2D9loHwtSisUig4ZXFaSG2pB8cZBUPY+ila0JV1Mj8F/a3DHbfwDq3Mtlb12R/EuNoKN10ylLmv612h6swKIj+CvZRQZk0ou1hMm/OtveKkE9laxhnSvQ1a//DV9axd5NSHlCAAAAAElFTkSuQmCC', 9)
    INTO documentos (id,doc_url, contrato_id) VALUES (108,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIhSURBVDjLlZPrThNRFIWJicmJz6BWiYbIkYDEG0JbBiitDQgm0PuFXqSAtKXtpE2hNuoPTXwSnwtExd6w0pl2OtPlrphKLSXhx07OZM769qy19wwAGLhM1ddC184+d18QMzoq3lfsD3LZ7Y3XbE5DL6Atzuyilc5Ciyd7IHVfgNcDYTQ2tvDr5crn6uLSvX+Av2Lk36FFpSVENDe3OxDZu8apO5rROJDLo30+Nlvj5RnTlVNAKs1aCVFr7b4BPn6Cls21AWgEQlz2+Dl1h7IdA+i97A/geP65WhbmrnZZ0GIJpr6OqZqYAd5/gJpKox4Mg7pD2YoC2b0/54rJQuJZdm6Izcgma4TW1WZ0h+y8BfbyJMwBmSxkjw+VObNanp5h/adwGhaTXF4NWbLj9gEONyCmUZmd10pGgf1/vwcgOT3tUQE0DdicwIod2EmSbwsKE1P8QoDkcHPJ5YESjgBJkYQpIEZ2KEB51Y6y3ojvY+P8XEDN7uKS0w0ltA7QGCWHCxSWWpwyaCeLy0BkA7UXyyg8fIzDoWHeBaDN4tQdSvAVdU1Aok+nsNTipIEVnkywo/FHatVkBoIhnFisOBoZxcGtQd4B0GYJNZsDSiAEadUBCkstPtN3Avs2Msa+Dt9XfxoFSNYF/Bh9gP0bOqHLAm2WUF1YQskwrVFYPWkf3h1iXwbvqGfFPSGW9Eah8HSS9fuZDnS32f71m8KFY7xs/QZyu6TH2+2+FAAAAABJRU5ErkJggg==', 5)
    INTO documentos (id,doc_url, contrato_id) VALUES (109,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAADpSURBVCjPY/jPgB8y0EmBHXdWaeu7ef9rHuaY50jU3J33v/VdVqkdN1SBEZtP18T/L/7f/X/wf+O96kM3f9z9f+T/xP8+XUZsYAWGfsUfrr6L2Ob9J/X/pP+V/1P/e/+J2LbiYfEHQz+ICV1N3yen+3PZf977/9z/Q//X/rf/7M81Ob3pu1EXWIFuZvr7aSVBOx1/uf0PBEK3/46/gnZOK0l/r5sJVqCp6Xu99/2qt+v+T/9f+L8CSK77v+pt73vf65qaYAVqzPYGXvdTvmR/z/4ZHhfunP0p+3vKF6/79gZqzPQLSYoUAABKPQ+kpVV/igAAAABJRU5ErkJggg==', 7)
    INTO documentos (id,doc_url, contrato_id) VALUES (110,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGkSURBVDjLxZPPi81RGMY/59zvN1chC0lSViZJzJQk/4BYTWNBkyhZsrDCgprl7JQFpSxsbEZdG5qFJjvKRLFTU4MsrGjouvf9ZXHOnTKyugtvnc6PzvnU8zzvSRHBOJUZs8YGNCxM/UODgziogDrIENTKmQHDgAE0AOyb3fDW/xzmYFbWYnWt8OJRBQCsfQF3wuoFVcIURAmVshchVEGFdud+6McIEBABR26Q2q3E23uEGfnwJdA+9uwq+eRtUttFl+aJT29ApAJUi7ZwaLcRL+dIx26RbIC/vgvm5KOXQX4iT67QOXQWXV1eB2RECsADcgNb9oIr8f0z+fh18tRF/MMiaccEzen7+MdX4EUigyDT/1X0uQOQDl4gVhZhuIY9niUI8oEZ5MEp/H2P5sRcMVOtAgZaaO7ggi/fIU1Mw4+vdGYekrrbsXcLtOd7dCbPoE9vVoCCQIr53cHkOYJvxXVVQorTIdX9UQqqYEaYsWnzHug9p6EfIEKyLmkUoVnJPqq52aFjkAIaL4nVSnFtVyCx3llYwHDDrJTu87+bNv333/gbANMZYUMccT8AAAAASUVORK5CYII=', 8)
    INTO documentos (id,doc_url, contrato_id) VALUES (111,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAH0SURBVBgZpcFPaM9xHMfx5/vz/Ywfv6ZwGC1mtRsXtRvFQSmlKK3JkRJymAul5EJcrFZrcnO0QpELDgrlKJcd5M9PtpHawew39v2+3y/7rlZuLI+HSeJ/2OGhO2d27+2/PtNWUwIiUAQejkKEArkTEnLHI1i3qpybmJg8f+/GwGju39U/0tFopq4GK9Gca/sIMJrbpVJ75gcrNV8qsSjLxZVjfazUiWstalkKaguVI0AhPCAQEcIj8Ep4JVzBgoveTZ14OLWMRM2SYRJKhkxYGCkZZgkzxwpRRCJXohaVU8seTi0BMgODQhAGEaIQJCvIBm7CU1ALD2pZIZaYgUQCZAYGZiAXYSADklFEQS3CqeUIZ5mZsUQiATIjspEjmHp4k+mHY7Q/vaWjq5sdq/cAB8lVWbLEDAMkYWaIRRIJmH50i9lX4+w8cpzVvduZf/OYNc+f8mRfx9kkD2oFYICZYYAByYxkRuvuMH17DtF49wy7fZS17+/T27MBmYZyRLDMAGORGX9amGrR2NQLB86xLF/eTBG2LU9+aI2fGi4Hwp3wwN2JCLwsiQhCYqCxnvbrRzQfnObX/BfawOz3Ai+YMkn8zYvB7surOpsXt2ysck6fmf1W8fFr4eVPXTJJ/IuXg1svzM1MnSzcerzQpGBs/+Pq6m9gRhRi/EsJnAAAAABJRU5ErkJggg==', 6)
    INTO documentos (id,doc_url, contrato_id) VALUES (112,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKRSURBVDjLhVNLTBNRFD3TTju1FCcBaxuaQEr94ydiZIHGpcFISBOi0YREZWHCVoyRxKUxxq0LXcACQyLsjO6KjSEiDfHDz0S0CLSxlFKd2g7MTDudGd+bMAQCxJucuXfuu+fcO/PeYwzDALVoNMqRuI3guq7rR4g/SEBC/Svxc8T3EUTD4bCGTcZQAUI+RvxLr9d70u/3o6KiAm63G3Qtn89DFEUkk0lks9lRkrvW3t6e2lCgRZFI5F0ikaDtjN1MVVVjYmLCGBoa6qccC7Z1kQafz4f/WSAQAGlyaXOOpQ+SNNUymQxcLhc4joPD4TBzkiRBEASkUimEQiGzdlcBlmWRy+WgKIr5Xi6XUSgUUCwWzTVN+IAzeOOde71orP0eAaOkbrDWf6Cw2+3mBLSYgny3KULXPOUY2BUB/hMd4IOn8XfhMGYjvU+2TECLLRLDMNA0zYw5JYa6Ghke/hyEn9/gZEqo3OuHp7qW3yJgESjoNPSdlb8gWCOCr29BMT0Ip5tBYnIWqlL6o8irzVsEaHcKSqQCen4cweok+FAblNRz2JxlODx1cEkzGWmVbTl7Z/jHhgCF1Z3GYjIKf+U8+ANhQn4Gm6OMUiGI9MhHg5Gl1sbu8UnKNc8B7Ui3ipxEcwvlpVFw6hz2N1xGabkXdqeBYqEOmfefEZWac4e6xz9Z22hbn+BmLBZbi8fjEBdG4NF/QdUDSM88hQ4FawKJR6cxLDZl86qzZdtdoDYwMBAkQg/2LL/ovNLVh++Dd7G0OAau9hTkrKgnnE39GW3f/Z6enpUdBSx7ePu4eq+zi4VNw+TbV0gsxFd5b9X5i4+mpnY63tsErl6okhvrfWzT0SAMR3FMXsnean08Pb/b/fgHqpjCspi90kkAAAAASUVORK5CYII=', 6)
    INTO documentos (id,doc_url, contrato_id) VALUES (113,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGOSURBVDjLlZPNapNBFIafSdOvtbFgSi1dREEtguDSnTfStbgW9A6y9BICinfkRosRFw1mE5BoS4rNzPlzEfOrYjJwOGfzPvO+h5kUEWx6zt6+eO1ur8x0VN9E+Ondyy/udlLdPua8d8ZBrdIZoN1uh7szLTOb9WePgxpOdXjMzXsnuDlx/gGRzAxgZrRaLQBSSks94iPNJ0+BRL4aYpKJcER0GbAqns5mhptRRgNMC1Aj3P50sChanFULboJpwbUAiXCnlPEcoKr/BJgWQhWXMnEQE4DKmNrfHKyW/L7ZJBNyzVGzR4RSSp4DFh2sOhEpmCpWMo0bPzi4NWR76xqR/0SYA8a4ZkwyF9+3cD0kl8HyEqeA1fwpJUrJuAouGRNhmOvgjkhZD6AynuxABdNMSnXcHdU1AUXyRCwZl0JKTsQGAJFJhL3mHVwFzT8hBpgpqdPpRLfbpd/vL73/xX56v0djf5+d3QbV7h7b1Q6jqwu+fn7/La3znd88v3tkpg/M5JGZPnS3Vq1enZrky19GcE/tIr8QhwAAAABJRU5ErkJggg==', 2)
    INTO documentos (id,doc_url, contrato_id) VALUES (114,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAILSURBVDjLpZPNS5VBFIefmXduKVcrKKKSFBdJVJSCSfQPSC1tIxIEUQR9Qa6UQHQTuAiCFhbtWtSmoAKJJMpAqSBJ2gh9UaYXw4jU9N73zsdpMVfDIBDugWHODDMP/H7nHCUilBOaMqNsgOFe0380BLABnAUXwBbB+XjngaJACgaAXR3//A2rlw/gfcytL+UOXtwtAQAWchAC4ksPnEO8A+sQZ+PZWsQ5cJbM1t2Ql2WAgAg0d6My1cj4DcR79IFT4PL4x5fQR66hMhW45/3It7dgbQngXNQmATIbkFd9qEM9KJ8S3gyAD+iW82AXsQ8vkOxvx30dWwForI2AIKANVNVBcMjcFPpwF7rpJOHDE9SWBsyxW4TJ1xCiRFLBkC9EfSGgALXvBPJxEKpq8Pc70K1X0XvamOxpIfd5lsWZHCZrqG34TX0qGFIXaSFAsISx6+iDncj7QZK22+AtkzfPMZdW0thxkfX1e8m/G2Ji5CmmUERJ/w6h8TjCr+i6c4iNTouN7r98MEzz6T4qPw3D9Ahs3MQPU8fE0CiGvIC1KF+BWi6h97H2Es0tzheo2FYPRzv/dmDvdopBSoBnd1Y6Cy9QXL1njGJpfJDso7Ok+RmWgIX5BJNo1FqmcaS9pndddfbyzs3OGD3Fwqzjy/fE24L0qLWO82h7bdfiz9yZxKs6n8i0wEDrkLvyB9KrOCqdUGipAAAAAElFTkSuQmCC', 10)
    INTO documentos (id,doc_url, contrato_id) VALUES (115,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJKSURBVDjLdZJNSFRRFIC/82YazQJpkVgbQV9aU23cuQtatIxaREi4C9zmQvrBpEUGLtvnQkqIVi0jgmzjT5PWZJYwIiEG2iInnR/ffeeeFuNMjtaFwz1wz/fde+69Ymb03Z1Ine88uZxMSuP84lo4PtKb5x/j0rX7zafPtee2torlxWymY/rVWCRmBlAneZ/9Hk6M9tVJLl693dx5tiNXKBbLix9nOzJvnkUANQHAjTtPU+n248uYNc7MLIYvnwzkAS5cvtUcnjmVKxZK5a+fZzvm3z6PqkydAODKzceprs4TOfXx4Q/Tc2EUFelMd+UK26XSty+Z8NO7F9HeejEzBgcHHwD3qjIzo6WlJQGgqnjvWV9fVzPDzFBVCoXCw/Hx8eHkLjAUXn8k+y/NDNTAe8OXNLH221FSMODXWO8QMBwANDU1ScsRIZCDcKzGj7xjNe+IvZAQCADnnEAlx8xoTELrUSEZ/IXLkbK6GbEVeRIiJIIKEIigqtQEzjmcVsBjjYJIBf65HWOeXVgIEAIRAqMmSAJEUUTkgd2dU2LkywoIIkYAeKOSG3jZJ1BVnFaK1Hu2nKcpFeDUCAJQBcQQE6qPXieI45gdNcxDKTbUV/o8lDBiJ3VwNbz39S0UdgznoeSMWEHNUBNMKmf2tgfG6gUNDQ1svh5lZWWFkaUlBtracM6RTqdZmJuju7ubqakpenp6mJycJAzDWgtiZvT391trayuq+t/w3tdm7z3ZbJZMJiNJgI2NDRYWFmqL3nvM7EBe/crVvwPwB5ahnKoTKjg4AAAAAElFTkSuQmCC', 9)
    INTO documentos (id,doc_url, contrato_id) VALUES (116,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJVSURBVDjLpZNLSJRhFIafGf/QTJ008zKKIWTgQkdByMxW5SJQgmjVToKCcNNlIQTRosCNu3IhgbsWCSG6ELwUlJi1KS3FCymUDCWh43VG5zvntPgnaxMIfXA23+J9H973nICZ8T/PG3l0+p8KqoaqIWo4UUQUJ4pzihP/zwMoqalERcAMMwMLYoAJmBmmijpFRVA1UDCCTL6f9AVUHLHlH8TXNg7knB3KoTBc9IfAxIivbTB84R1m+O721wD3w7fIOlwGKD0PujleUICIEgTQVAqjO12M7jxhNzCHKLjUJAXerkbQ+BSmezhRLJVB0Gf2sWuPLrEb6OXl9g2SGsMJJB04B1O7TQyunGFj6wsiiiqIWoogJeDEUZcdQUR4nbhEknlfRGBuq4S+2HVuLz7dJ1A1PFVDnfiBaZLpjSmaS/KJbifYTmtmdbOGXL3Ct5WzbCWKUJdGtZrfyt8CTpRI/k+qjhUTzjhJdUhRq+Zr9jzKM8p2n5OIecR3Enw8dYJEfB0P8EQNdYaIUphejpribA81xVCKM8qIzqyTuRXkXGMdpXkVvJruY+LzG7xMxXOiqBgZR7JIdA5g4ov5nfs7sFhRzuWWFiQoRIqbGJnppb6qgd6FfjwRBQsQys0nJycPVb/Syqt32V4eBJShF8McCmRxsfIaAHfOdzPwqQsJ9PsEi7Oz+7v923myvdUnUCMWckxHx5mMjtHe1EPHUCsZaemkGQQOco31beGHpeWhew3VjVQU1bLw/QPjU2MsL613Bg56zvVt4Q7gJpANbAJdE4+j7b8A7WGuGfrlZ+8AAAAASUVORK5CYII=', 10)
    INTO documentos (id,doc_url, contrato_id) VALUES (117,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJwSURBVDjLbZPLb01RFIe/c3pbvdU2RYsmfUS1KrdaqkGQCANDzyZMjEhEYiBiYGCkf4LExEQiDDxiQARh4DWoegxERG4IQkQ8cnsb2rPP3mstg6OlcleyspKdtb71++2dHZkZ24+c7TOzywYljA2GYQaYkRWbSRWPd+V398+d6ALIkTUcNFjeX+iIvn4rYzY9BBlMMYXx8i+mnKGWW8KfyACwqb/QHm0ZaKejtR/LCKhptlWz7S1NddTV5ti44xCzAJjN6+/r5ObTN5RKk5gqADqtwgxTY3xiksSl/Bt/LBDlanL0rOike9F8RMBMUTVEDFElqDGVeC5duVcJYIgoH75OUBNXkyQJ3qUEzc4DVeSqa2ieOwc1qwAAVJQgHuccu9Z2Z/IzdVj5Gd/eXuSF7OW/+b8KvCjiA0Fizt97hfOBIEYsCduar7C0Zwul4iPM8rMA8TQgBCX1nlTB4jlE1XmozlOof0nnkg00tg7Smo7R3jheCQA+CCEJOC8kQUi8kJcv9DJKQ3MTMnGNtoF9bG17TVVcSYEo3vkM4AXvhYI9pK1vNyTPGTt3gfqmKZbVf2R1m6tswacZIA3KAimyclFEw7xJ1L0DU+TnE7o2H2NXocTYqfUNMwA1Iw1CcAHnldSnrJbbNHWsQidfYDrF0HAvmn6mtrbI4MZhgkuPzroDEUNSwXmh24/S2zNIXcN3LPyAqIpnV4uAokmRlmWdiPOHH4ysKMw8I3HMmnUDWBQx9OkuLYXTEL8nbmwBjLX7d864rsovpWvr8YXF6yMnpwF3bt0YPZD9PGNoeZnHZ/ZgapjqrBppkNgkRRUzW/wbVUOsic+TyncAAAAASUVORK5CYII=', 10)
    INTO documentos (id,doc_url, contrato_id) VALUES (118,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIaSURBVDjLY/j//z8DLqyaNVPLrnr5PMnESay41DDgM8Cuellm+7rTT0RiJ3Aii4snTGIiygDnupV5c/dc/QF0AT9MTCl9hq5P67qtRBng3ri6ZN2Je/9lU6bKgfgSCZPVJ2+7+CR9+u5tRBng07K2+sCVZ//lUqepCMX0y87cefnO9B2XH4rGTZQgyoCA9vUt5+69/a+QNj25f/O504evPf+jkDbNmuhADOna1Hn50cf/fZvPf7vz8ut/87JFOUTFAq9tHDiUI/u3dd8Fatxy9tH/xCk7FxCMRiGXNCmjzLmrneo2XtLJmLckffqesxcefPgfP3HbUcHgRha8Bgg5p0kANd5OWHXnf8i8C59TN7/6P3PXjf8PX//4H965bg+vZbgjXgOMsuasiVt67a+Ub4GdhHeef8LaJ/9n773zf+nZ9//Tt7//H7vsxn9Zz7QUnAZ4de375Fi3Ahy/RnnTpqdteP6/ZNGpf+kbn/7XjZty0Ld3x2XrgvVfuA08ObAa4NK09XnUkmsvHJvWHU3b9ua/Wd7yG+Y5a14HTj3yGSSvHlZW5lCx/b+QRZA0VgPkgsvDAqcffxO17MY/s5xlp7lMAyVMM1Y8DF9w8RenlqOcWVbfHPvSLX94jX0FcMaCiGu6hJhHlgKMrx83/1jypuf//Sftf5q0+u5/o6RFN0jKjTyGXuyGiQuu25dt+26SuuQBj5G3CLoaAMk4ntedg7qJAAAAAElFTkSuQmCC', 4)
    INTO documentos (id,doc_url, contrato_id) VALUES (119,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJFSURBVDjLzZLdS9NRGMf3Fwy6jLrPKKerSAsqXzKn0xY4ZrIhbvulKwtrOCdYuWDOza02Ai96AxEEaXixTMkllDdKUjhrrmDMlMFGuLbTXO7N/b6d3+rCYFLQTQ98eTiH83yel/PwAPD+Rbz/A8D2dsupvlIRTjmdluS0XWT7WifJXu4gGUZN0q2tJHWxhSSbpGSrQRJJnKtT5AE0QEaVwMwLYH4eWF4G/H7A50Pu9StExsYQHR1FfGQEsQcPEXQ4ELzdj83T1Yl4+SkJB3iLJ4+AyUnA6QRWVgCPB5iYQE6nQ1CjQYhhEFWrsaFQ4F1jIz6ZzfB33QARlgU5QAnbo11kLSaAZsP6OvI2N4ecVIqQWIwv9fX4RrVaVYWPAwNYZdpBSo6HYweFsvwMaL97aL/TOUM/4HIB4TCwtARWLkeEBsYoJCYSIWAy4bOSAREcC0SLSkt/+4Wspp2fUammtvV6YGEB8HrB0tJJTQ0StbXYGBrCGg2OHT4aiB4QFBf8xpRcwU/KmqcyPfqfADqDRGUlUlYrnhoYdNtlbPs9CVqMFfG6XsHNgnuwdf4C/7tI7E733QI7Po6sxQKnQYk7TiWee4fhCblhf3kFzfZilHXutRVcjs2Ks/vjJ8/409puJK9roTJWw/XBAZfvfn6+ttlLsM92cIDkrhtGjpQfov2+of2uNfQJMe19jJ327P0wB/i7dT1xdV/S6lZh0N2WDx6caftzBTtFHxqbbEW462bymTnPnXedwS4QM1WcK/uXN3P3PwAfNsr5/6zP/QAAAABJRU5ErkJggg==', 9)
    INTO documentos (id,doc_url, contrato_id) VALUES (120,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAEjSURBVDjLxVM7TsRADPVEK4oVSrGU1FyCjltwADrOQhOJe1DsMbbfYjsQ2g4h5cvM2MaeT1BIJNBSYMl69iTv+TOJYWb4ixWnEquqCpVX3x887bqxJSQAkgwRwEvsE97drM0wDLAooHZxXgBlsiAmJDl4ecPwTtd1ywJaXsmZqLFP5JBHPrRtuyyQ29Xq2nIU44mYWtM0ywJKOr7TOC9hjIOAOvwgcHu9Nr+5hYnAw/bI81EYvLTgBJ1lsA7BORIkeLy/MnVdTzu43JwFJPmwdFGjgNcRxH0BXsj757i8mQBzWhaqK4EDGZ1gyvV8+KD5LeRqPmCKQ/UYo3oSJ6L5DqwlOLz2ghiq6pzOxvZ1fuQvYra+73PrfJKXZcmK5t/+xmyf9PZAc1Cvzt0AAAAASUVORK5CYII=', 1)
SELECT * FROM dual;


-- vigilantes --
-- up
CREATE TABLE vigilantes(
  ID NUMBER(7) PRIMARY KEY,
  portaArma NUMBER(1),
  capacitacion NUMBER(1),
  servicio_id NUMBER(7),
  empleado_id NUMBER(7),
  FOREIGN KEY (servicio_id) REFERENCES servicios,
  FOREIGN KEY (empleado_id) REFERENCES empleados
);

ALTER TABLE vigilantes ADD (
  CONSTRAINT vigilantes_pk PRIMARY KEY (ID));

CREATE SEQUENCE vigilantes_seq START WITH 1;

CREATE OR REPLACE TRIGGER vigilantes_pk 
BEFORE INSERT ON vigilantes 
FOR EACH ROW

BEGIN
  SELECT vigilantes_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- fill vigilantes
-- up
INSERT ALL
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(1,1,1,3,29)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(2,1,0,3,37)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(3,1,0,3,68)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(4,0,0,4,83)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(5,1,1,2,8)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(6,1,1,3,58)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(7,1,1,3,90)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(8,0,1,4,65)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(9,1,1,4,16)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(10,1,1,2,79)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(11,0,1,5,27)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(12,1,1,2,87)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(13,0,1,3,24)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(14,0,1,5,78)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(15,1,0,3,30)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(16,0,1,4,41)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(17,0,0,4,19)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(18,0,0,1,4)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(19,1,1,2,1)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(20,0,1,2,20)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(21,1,0,1,76)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(22,1,1,4,38)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(23,0,0,5,28)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(24,1,0,5,99)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(25,0,1,2,69)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(26,1,1,2,84)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(27,1,1,3,93)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(28,1,0,1,100)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(29,0,1,2,34)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(30,0,0,5,91)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(31,0,1,1,32)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(32,1,1,3,52)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(33,1,0,1,11)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(34,1,1,3,18)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(35,1,1,5,45)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(36,0,0,4,47)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(37,0,0,2,67)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(38,1,1,4,59)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(39,0,1,1,88)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(40,0,1,3,81)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(41,0,1,1,26)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(42,1,1,1,70)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(43,0,0,2,64)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(44,1,0,5,82)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(45,1,1,4,72)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(46,1,0,1,56)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(47,1,1,5,13)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(48,0,0,4,96)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(49,1,1,1,2)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(50,0,1,4,31)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(51,0,1,4,74)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(52,1,0,1,51)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(53,1,1,1,85)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(54,0,0,4,75)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(55,0,1,4,36)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(56,0,0,2,49)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(57,0,0,4,43)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(58,0,0,1,98)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(59,0,0,1,53)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(60,1,0,1,12)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(61,1,0,2,33)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(62,1,1,1,97)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(63,1,0,2,9)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(64,1,0,3,3)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(65,0,1,2,42)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(66,0,0,2,62)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(67,1,0,5,94)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(68,1,1,5,6)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(69,1,0,5,66)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(70,1,0,1,23)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(71,0,0,4,50)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(72,1,1,2,10)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(73,1,0,5,7)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(74,1,1,5,40)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(75,1,1,4,80)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(76,0,0,4,46)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(77,1,1,1,61)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(78,1,1,5,73)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(79,0,0,5,95)
    INTO vigilantes(id,portaArma,capacitacion,servicio_id,empleado_id) VALUES(80,0,0,1,48)
SELECT * FROM dual;

-- control asistencias --

-- up
CREATE TABLE control_asistencias(
  ID NUMBER(7) PRIMARY KEY,
  asistencia NUMBER(1),
  sede_id NUMBER(7),
  horario_id NUMBER(7),
  vigilante_id NUMBER(7),
  FOREIGN KEY (sede_id) REFERENCES sedes,
  FOREIGN KEY (horario_id) REFERENCES horarios,
  FOREIGN KEY (vigilante_id) REFERENCES vigilantes
);

ALTER TABLE control_asistencias ADD (
  CONSTRAINT control_asistencias_pk PRIMARY KEY (ID));

CREATE SEQUENCE control_asistencias_seq START WITH 1;

CREATE OR REPLACE TRIGGER control_asistencias_pk 
BEFORE INSERT ON control_asistencias 
FOR EACH ROW

BEGIN
  SELECT control_asistencias_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- fill control asistencias
-- up

INSERT ALL
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (1,1,10,5,44)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (2,0,2,30,48)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (3,0,10,73,2)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (4,0,11,3,67)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (5,1,8,98,12)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (6,1,1,28,70)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (7,0,11,127,43)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (8,1,12,117,67)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (9,0,10,99,54)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (10,1,3,99,42)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (11,1,9,122,56)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (12,1,2,3,30)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (13,0,6,9,72)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (14,1,12,72,58)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (15,0,8,98,64)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (16,1,9,7,6)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (17,1,5,129,49)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (18,1,7,81,53)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (19,1,6,8,60)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (20,0,4,73,76)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (21,0,12,53,32)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (22,0,11,131,25)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (23,1,11,112,33)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (24,0,6,106,6)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (25,1,6,7,78)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (26,0,2,107,72)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (27,0,2,34,70)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (28,1,1,55,25)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (29,1,7,40,58)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (30,1,12,75,34)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (31,0,8,91,20)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (32,0,2,5,14)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (33,0,3,68,18)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (34,0,5,63,16)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (35,0,9,6,62)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (36,0,5,91,42)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (37,1,12,52,37)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (38,1,5,111,43)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (39,0,10,17,37)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (40,0,12,115,29)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (41,0,9,2,10)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (42,0,4,77,3)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (43,1,10,27,36)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (44,0,12,96,45)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (45,1,10,122,59)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (46,1,7,112,20)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (47,1,10,109,76)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (48,1,11,87,33)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (49,1,5,69,23)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (50,0,11,57,44)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (51,1,5,7,24)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (52,1,9,18,66)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (53,1,12,62,75)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (54,1,7,9,18)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (55,1,3,104,57)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (56,0,4,124,27)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (57,0,2,84,35)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (58,1,12,100,16)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (59,1,5,121,68)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (60,0,8,77,61)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (61,0,2,47,58)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (62,1,2,33,78)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (63,1,5,49,12)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (64,0,3,65,47)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (65,0,11,70,80)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (66,1,9,85,23)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (67,0,3,67,51)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (68,1,7,7,8)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (69,0,7,100,50)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (70,1,12,31,2)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (71,1,11,73,10)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (72,1,10,33,67)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (73,0,7,43,47)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (74,0,12,91,58)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (75,0,9,82,15)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (76,1,12,22,41)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (77,0,6,52,49)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (78,0,10,69,33)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (79,1,9,130,67)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (80,0,7,53,3)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (81,1,3,49,59)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (82,1,4,19,27)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (83,0,3,52,47)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (84,1,3,74,50)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (85,0,3,84,9)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (86,0,5,56,2)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (87,0,9,21,46)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (88,1,7,70,45)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (89,0,5,105,39)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (90,0,2,119,4)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (91,0,8,119,62)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (92,0,8,46,30)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (93,0,9,18,49)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (94,0,5,16,43)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (95,0,12,14,49)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (96,0,6,118,79)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (97,1,9,100,65)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (98,0,6,9,46)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (99,0,2,79,38)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (100,0,1,66,15)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (101,1,3,26,20)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (102,0,1,16,59)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (103,1,7,103,45)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (104,1,10,100,47)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (105,0,10,4,29)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (106,1,7,18,37)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (107,1,2,110,18)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (108,1,8,99,77)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (109,1,7,87,6)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (110,0,1,31,60)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (111,1,10,114,79)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (112,0,11,99,54)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (113,0,4,125,8)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (114,0,9,39,60)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (115,0,8,122,61)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (116,0,8,53,21)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (117,1,12,49,28)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (118,1,7,22,31)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (119,1,1,117,12)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (120,0,1,62,63)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (121,1,3,68,49)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (122,1,10,123,23)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (123,1,10,30,42)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (124,1,4,30,9)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (125,1,4,58,40)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (126,0,3,64,13)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (127,1,1,99,30)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (128,1,7,5,75)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (129,1,4,34,75)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (130,0,4,62,33)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (131,0,7,60,69)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (132,0,1,87,31)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (133,0,9,40,68)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (134,0,6,120,20)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (135,0,10,49,52)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (136,1,11,120,35)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (137,0,10,64,59)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (138,0,6,65,70)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (139,0,11,28,14)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (140,1,1,72,80)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (141,1,7,27,26)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (142,0,2,39,71)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (143,0,4,8,32)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (144,1,4,33,45)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (145,0,12,5,76)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (146,1,9,61,40)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (147,0,8,28,68)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (148,0,1,31,1)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (149,1,8,45,20)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (150,1,8,64,61)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (151,0,12,117,14)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (152,1,1,22,37)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (153,1,9,17,62)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (154,1,12,46,55)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (155,0,6,118,28)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (156,0,6,42,6)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (157,1,8,111,65)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (158,1,1,23,54)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (159,0,8,133,33)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (160,0,1,85,21)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (161,0,11,8,78)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (162,0,2,73,51)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (163,0,7,77,4)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (164,0,5,110,49)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (165,0,1,64,72)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (166,0,6,24,44)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (167,1,5,130,1)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (168,1,5,105,79)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (169,1,8,6,25)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (170,1,7,34,57)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (171,0,11,90,79)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (172,1,5,62,40)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (173,0,11,1,50)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (174,1,10,36,44)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (175,0,6,1,77)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (176,0,9,18,6)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (177,0,10,128,53)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (178,0,9,127,70)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (179,1,2,12,25)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (180,1,12,120,42)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (181,1,9,58,4)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (182,0,7,2,7)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (183,1,11,41,27)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (184,1,10,127,18)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (185,0,7,112,22)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (186,0,7,5,14)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (187,1,3,40,27)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (188,1,1,68,26)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (189,0,8,131,13)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (190,0,9,27,14)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (191,0,5,78,21)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (192,1,10,102,79)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (193,1,4,115,23)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (194,0,4,35,75)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (195,0,12,130,66)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (196,0,3,129,61)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (197,0,5,109,37)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (198,1,10,24,34)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (199,1,12,97,62)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (200,0,2,38,69)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (201,1,1,12,22)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (202,0,12,21,21)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (203,1,7,54,63)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (204,0,5,114,45)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (205,0,4,17,58)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (206,0,1,112,58)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (207,0,7,74,29)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (208,1,9,84,11)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (209,0,2,84,52)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (210,0,4,16,47)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (211,0,3,47,60)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (212,0,2,82,14)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (213,0,1,64,37)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (214,0,5,37,5)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (215,1,7,115,35)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (216,1,1,60,53)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (217,1,2,110,30)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (218,0,3,120,25)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (219,1,11,28,20)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (220,1,3,19,46)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (221,1,9,122,39)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (222,1,6,12,28)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (223,1,6,118,43)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (224,0,3,38,10)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (225,0,7,99,39)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (226,0,12,32,6)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (227,0,3,89,19)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (228,0,12,7,57)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (229,0,6,107,70)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (230,0,1,71,13)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (231,0,6,4,6)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (232,1,12,11,27)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (233,0,3,47,42)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (234,0,1,42,50)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (235,1,7,20,41)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (236,0,10,66,15)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (237,1,3,31,49)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (238,1,4,105,44)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (239,0,2,14,67)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (240,0,9,125,42)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (241,0,10,72,80)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (242,1,9,113,33)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (243,1,11,17,17)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (244,1,9,123,79)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (245,1,7,16,74)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (246,1,6,100,45)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (247,1,3,6,10)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (248,1,5,2,37)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (249,1,3,108,43)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (250,0,7,51,49)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (251,0,6,15,31)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (252,1,4,128,52)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (253,0,3,74,60)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (254,1,11,113,8)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (255,1,5,96,69)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (256,0,6,119,72)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (257,0,10,17,23)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (258,1,8,29,45)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (259,0,6,109,63)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (260,1,2,89,58)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (261,0,3,68,5)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (262,1,4,2,65)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (263,0,3,47,28)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (264,0,3,121,77)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (265,0,7,75,48)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (266,1,5,27,28)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (267,0,8,48,38)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (268,1,3,61,29)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (269,1,3,127,62)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (270,0,6,8,66)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (271,0,2,93,45)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (272,0,4,65,37)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (273,1,9,18,44)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (274,0,4,70,32)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (275,1,10,125,10)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (276,1,11,117,1)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (277,1,12,30,10)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (278,0,8,68,3)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (279,0,10,73,35)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (280,1,11,23,13)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (281,1,7,40,56)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (282,0,6,15,35)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (283,1,4,130,48)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (284,1,9,69,78)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (285,1,2,39,56)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (286,0,7,130,43)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (287,0,9,93,72)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (288,0,8,126,40)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (289,0,3,14,36)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (290,1,4,94,14)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (291,0,2,51,3)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (292,0,7,70,76)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (293,0,11,15,18)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (294,0,2,88,50)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (295,0,1,78,42)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (296,0,7,44,52)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (297,1,10,106,9)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (298,0,10,79,62)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (299,0,8,102,78)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (300,0,6,8,63)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (301,0,9,103,14)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (302,1,12,88,80)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (303,0,12,92,4)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (304,0,4,64,30)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (305,0,12,24,66)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (306,1,6,7,73)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (307,0,3,6,15)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (308,1,3,9,1)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (309,0,7,40,4)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (310,0,4,77,36)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (311,1,7,126,67)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (312,0,5,53,9)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (313,1,11,16,40)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (314,0,7,120,77)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (315,0,2,18,62)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (316,0,12,124,26)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (317,0,1,67,5)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (318,0,12,90,55)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (319,0,11,64,32)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (320,1,8,26,2)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (321,0,10,59,6)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (322,1,7,108,30)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (323,0,4,14,62)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (324,0,10,50,10)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (325,0,1,105,78)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (326,1,7,75,74)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (327,1,11,64,35)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (328,1,2,113,53)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (329,1,6,91,71)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (330,1,4,15,60)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (331,1,7,6,50)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (332,0,4,44,15)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (333,1,7,129,27)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (334,0,3,14,45)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (335,1,1,26,26)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (336,1,11,59,8)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (337,1,11,83,40)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (338,0,5,17,48)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (339,0,1,76,52)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (340,1,6,97,53)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (341,1,4,79,78)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (342,1,4,8,41)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (343,0,11,9,1)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (344,0,9,77,76)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (345,0,12,82,80)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (346,0,2,34,27)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (347,0,9,49,13)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (348,0,4,131,18)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (349,1,10,71,36)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (350,0,11,17,62)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (351,0,4,41,48)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (352,0,12,36,44)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (353,1,3,94,44)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (354,1,9,117,10)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (355,1,4,97,32)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (356,1,9,30,18)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (357,0,10,127,28)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (358,0,1,20,20)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (359,0,8,23,34)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (360,0,3,19,54)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (361,1,10,49,39)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (362,0,11,54,8)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (363,1,8,43,40)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (364,0,5,102,68)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (365,1,11,119,12)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (366,0,9,1,71)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (367,0,6,98,15)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (368,1,11,66,21)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (369,0,5,34,20)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (370,1,5,35,19)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (371,0,10,43,6)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (372,0,8,56,45)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (373,1,2,45,5)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (374,1,7,61,71)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (375,1,5,14,35)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (376,0,3,69,33)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (377,1,3,85,60)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (378,1,9,53,32)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (379,0,6,38,21)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (380,0,2,25,70)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (381,1,4,132,4)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (382,0,12,36,19)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (383,0,6,56,51)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (384,0,1,15,13)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (385,0,2,60,70)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (386,0,11,44,44)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (387,1,9,16,45)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (388,0,7,16,39)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (389,1,11,92,66)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (390,0,8,19,70)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (391,0,3,102,79)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (392,0,7,91,15)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (393,1,3,60,3)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (394,1,2,130,9)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (395,0,9,98,19)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (396,0,10,131,28)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (397,1,6,72,41)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (398,0,2,96,48)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (399,1,4,118,79)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (400,0,3,50,24)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (401,0,7,75,57)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (402,1,4,8,32)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (403,1,9,81,39)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (404,1,12,109,11)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (405,1,5,95,28)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (406,1,7,86,16)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (407,0,7,124,44)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (408,1,1,87,53)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (409,0,2,99,10)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (410,0,5,23,57)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (411,0,11,80,62)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (412,0,4,59,9)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (413,1,2,86,56)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (414,1,6,107,52)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (415,1,3,35,26)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (416,1,1,104,52)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (417,0,2,37,43)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (418,1,9,83,32)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (419,0,9,64,58)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (420,1,3,100,74)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (421,0,1,46,21)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (422,0,8,41,19)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (423,0,8,17,50)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (424,1,10,100,50)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (425,1,9,13,61)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (426,1,7,131,14)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (427,1,11,79,63)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (428,0,8,88,55)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (429,0,10,108,3)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (430,1,5,10,41)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (431,0,7,62,67)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (432,0,1,7,39)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (433,0,2,90,68)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (434,0,11,71,52)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (435,1,12,2,23)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (436,1,2,82,10)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (437,0,11,96,35)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (438,0,1,48,34)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (439,1,3,19,22)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (440,0,5,45,19)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (441,1,2,124,23)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (442,1,9,92,40)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (443,0,8,46,77)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (444,0,7,62,24)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (445,1,3,109,3)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (446,0,7,57,73)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (447,1,10,58,16)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (448,1,6,6,12)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (449,1,2,43,68)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (450,1,3,82,8)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (451,0,2,57,37)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (452,1,12,107,5)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (453,1,1,20,56)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (454,1,4,70,40)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (455,1,7,68,15)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (456,1,12,46,2)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (457,1,2,63,36)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (458,0,8,58,80)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (459,0,6,38,69)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (460,1,11,80,49)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (461,0,2,130,48)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (462,0,1,21,60)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (463,1,2,40,56)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (464,0,1,55,71)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (465,1,7,66,67)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (466,1,8,96,18)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (467,1,9,89,70)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (468,1,9,99,40)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (469,1,2,131,25)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (470,0,1,61,7)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (471,0,2,18,33)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (472,1,3,133,52)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (473,1,3,23,62)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (474,1,3,14,60)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (475,0,5,7,28)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (476,1,6,4,22)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (477,1,3,58,43)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (478,0,9,121,47)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (479,1,2,82,5)
    INTO control_asistencias (id,asistencia, sede_id, horario_id, vigilante_id) VALUES (480,1,10,18,39)
SELECT * FROM dual;







