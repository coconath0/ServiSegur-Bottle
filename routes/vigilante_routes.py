from bottle import Bottle, run, template, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()


@subapp.route('/', method='GET')
def indexV():
    # mensaje
    mensaje = request.params.mensaje
    print(mensaje)
    # acceso a db
    conn = engine.connect()
    # ejecutamos un query
    stmt = text("""
SELECT E.id AS id_vigilante,E.fecha_ini_contrato, E.nombre,E.dni,E.num_cuenta,'No' AS "portaArma" ,S.tipo, V.capacitacion,SE.nombre,FP.tipo FROM vigilantes V
INNER JOIN empleados E ON E.id= V.empleado_id
INNER JOIN servicios S ON S.id = V.servicio_id
INNER JOIN seguros SE ON E.seguro_id = SE.id
INNER JOIN fondo_pensiones FP ON E.fondo_pension_id = FP.id
WHERE V.portaArma = 0
UNION
SELECT E.id AS id_vigilante,E.fecha_ini_contrato, E.nombre,E.dni,E.num_cuenta,'Sí' AS "portaArma" ,S.tipo, V.capacitacion, SE.nombre,FP.tipo FROM vigilantes V
INNER JOIN empleados E ON E.id= V.empleado_id
INNER JOIN servicios S ON S.id = V.servicio_id
INNER JOIN seguros SE ON E.seguro_id = SE.id
INNER JOIN fondo_pensiones FP ON E.fondo_pension_id = FP.id
WHERE V.portaArma = 1""".format())
    rows = conn.execute(stmt).fetchall()
    conn.close()
    # respuesta
    locals = {'vigilante': rows, 'mensaje': mensaje}

    return template('vigilante/indexV', locals)


@subapp.route('/delete', method='GET')
def delete():
    empleado_id = int(request.params.id)
    # acceso a db
    conn = engine.connect()
    stmt = text(
        ("DELETE FROM empleados WHERE id = {}").format(empleado_id))
    conn.execute(stmt)
    conn.commit()
    conn.close()
    # respuesta
    return redirect("/vigilante/?id=" + str(empleado_id) +
                    "&mensaje=Se ha eliminado un vigilante")


@subapp.route('/new', method='GET')
def empleado_new():
    conn = engine.connect()
    stmt1 = text(("SELECT * FROM servicios").format())
    servicio = conn.execute(stmt1).fetchall()
    stmt = text(("SELECT * FROM seguros").format())
    seguros = conn.execute(stmt).fetchall()
    stmt = text(("SELECT * FROM fondo_pensiones").format())
    fondo_pensiones = conn.execute(stmt).fetchall()
    conn.close()
    vigilante = (0, "", "", "", "", 0, "", 0, "", "")
    portaArma = (0, 1)
    locals = {
        'vigilante': vigilante,
        'servicio': servicio,
        'portaArma': portaArma,
        'seguros': seguros,
        'fondo_pensiones': fondo_pensiones
    }
    # respuesta
    return template('vigilante/detail', locals)


@subapp.route('/edit', method='GET')
def edit():
    # mensaje
    mensaje = request.params.mensaje
    vigilante_id = int(request.params.id)
    # acceso a db
    conn = engine.connect()
    stmt = text(("""SELECT * FROM(
SELECT E.id AS id_vigilante,E.fecha_ini_contrato, E.nombre,E.dni,E.num_cuenta,'No' AS "portaArma" ,S.tipo, V.capacitacion, SE.nombre,FP.tipo FROM vigilantes V
INNER JOIN empleados E ON E.id= V.empleado_id
INNER JOIN servicios S ON S.id = V.servicio_id
INNER JOIN seguros SE ON E.seguro_id = SE.id
INNER JOIN fondo_pensiones FP ON E.fondo_pension_id = FP.id
WHERE V.portaArma = 0
UNION
SELECT E.id AS id_vigilante,E.fecha_ini_contrato, E.nombre,E.dni,E.num_cuenta,'Sí' AS "portaArma" ,S.tipo,V.capacitacion, SE.nombre,FP.tipo FROM vigilantes V
INNER JOIN empleados E ON E.id= V.empleado_id
INNER JOIN servicios S ON S.id = V.servicio_id
INNER JOIN seguros SE ON E.seguro_id = SE.id
INNER JOIN fondo_pensiones FP ON E.fondo_pension_id = FP.id
WHERE V.portaArma = 1)
WHERE id_vigilante = {}""").format(vigilante_id))
    vigilante = conn.execute(stmt).fetchone()
    # traer todos los horarios del empleado que es vigilante
    stmt = text(("""
    SELECT CA.horario_id AS id, DIA.nombre , HORA.rango_horario, S.nombre, E.nombre , CA.id AS r_id FROM control_asistencias CA
INNER JOIN horarios H ON CA.horario_id = H.id
INNER JOIN horas HORA ON H.hora_id  = HORA.id
INNER JOIN dias DIA ON H.dia_id = DIA.id
INNER JOIN sedes S ON CA.sede_id = S.id
INNER JOIN empresas E ON S.empresa_id = E.id
INNER JOIN vigilantes v ON CA.vigilante_id = v.id
WHERE empleado_id = {};
  """).format(vigilante_id))
    control_asistencia = conn.execute(stmt).fetchall()
    stmt1 = text(("SELECT * FROM servicios").format())
    servicio = conn.execute(stmt1).fetchall()
    stmt = text(("SELECT * FROM seguros").format())
    seguros = conn.execute(stmt).fetchall()
    stmt = text(("SELECT * FROM fondo_pensiones").format())
    fondo_pensiones = conn.execute(stmt).fetchall()
    conn.close()
    locals = {
        'vigilante': vigilante,
        'control_asistencia': control_asistencia,
        'id': vigilante_id,
        'servicio': servicio,
        'mensaje': mensaje,
        'seguros': seguros,
        'fondo_pensiones': fondo_pensiones
    }
    # respuesta
    return template('vigilante/detail', locals)


@subapp.route('/edit/delete', method='GET')
def delete():
    control_asistencia_id = int(request.params.id)
    vigilante_id = int(request.params.vigilante_id)
    # acceso a db
    conn = engine.connect()
    stmt = text(
        ("DELETE FROM control_asistencias WHERE id = {}").format(control_asistencia_id))
    conn.execute(stmt)
    conn.commit()
    conn.close()
    # respuesta
    return redirect("/vigilante/edit?id=" + str(vigilante_id) +
                    "&mensaje=Se ha eliminado un horario de vigilante")


@subapp.route('/save', method='POST')
def vigilante_save():
    id = int(request.forms.get('id'))
    fecha_ini_contrato = request.forms.get('fecha_ini_contrato')
    nombre = request.forms.get('nombre')
    dni = request.forms.get('dni')
    num_cuenta = request.forms.get('num_cuenta')
    portaArma = int(request.forms.get('portaArma'))
    servicio_id = request.forms.get('servicio_id')
    capacitacion = int(request.forms.get('capacitacion'))
    seguro_id = request.forms.get('seguro')
    fondo_pension_id = request.forms.get('fondo_pension')
    conn = engine.connect()

    mensaje = ""
    if id == 0:
        # crear
        stmt = text(("INSERT INTO empleados (fecha_ini_contrato,nombre,dni,num_cuenta,fondo_pension_id,seguro_id) VALUES ('{}','{}','{}','{}','{}','{}')").format(
            fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id))
        rs = conn.execute(stmt)
        empleado_id = rs.lastrowid
        stmt = text(("INSERT INTO vigilantes (portaArma,capacitacion,servicio_id,empleado_id) VALUES ('{}','{}','{}','{}')").format(
            portaArma, capacitacion, servicio_id, empleado_id))
        conn.execute(stmt)
        mensaje = "Artista creado con exito"
    else:
        # ejecutamos un query
        stmt = text(
            ("UPDATE empleados SET  fecha_ini_contrato= '{}',nombre='{}',dni='{}',num_cuenta='{}',fondo_pension_id='{}',seguro_id='{}' WHERE id = {}").format(fecha_ini_contrato, nombre, dni, num_cuenta, fondo_pension_id, seguro_id, id))
        rs = conn.execute(stmt)
        actualizar_vigilante = rs.lastrowid
        stmt = text(("UPDATE vigilantes SET portaArma='{}',capacitacion='{}',servicio_id='{}' WHERE empleado_id = '{}'").format(
            portaArma, capacitacion, servicio_id, actualizar_vigilante))
        mensaje = "Vigilante modificado con exito"
        conn.execute(stmt)
    conn.commit()
    conn.close()
    return redirect("/vigilante/?mensaje=" + mensaje)


@subapp.route('/horario/new', method='GET')
def horario_new():
    # en verdad toma el id del empleado, pero como referencia ponemos vigilante_id
    #vigilante_id = int(request.params.id)
    # acceso a db
    vigilante_id = int((request.params.vigilante_id))
    conn = engine.connect()
    stmt = text(("SELECT * FROM dias").format())
    dias = conn.execute(stmt).fetchall()
    stmt = text(("SELECT * FROM horas").format())
    horas = conn.execute(stmt).fetchall()
    stmt = text(("SELECT * FROM sedes").format())
    sedes = conn.execute(stmt).fetchall()
    conn.close()
    horario = (0, "", "", "")
    locals = {
        'horario': horario,
        'dias': dias,
        'horas': horas,
        'sedes': sedes,
        'vigilante_id': vigilante_id
    }
    # respuesta
    return template('vigilante/detail_horario', locals)


@subapp.route('/horario/new/save', method='POST')
def horario_new_save():
    vigilante_id = int(request.forms.get('vigilante_id'))
    dia_id = int(request.forms.get('dia'))
    hora_id = int(request.forms.get('hora'))
    sede_id = int(request.forms.get('sede'))
    # por defecto no asistió
    asistencia = 0
    # acceso a db
    conn = engine.connect()
    stmt = text(
        "SELECT id FROM vigilantes WHERE empleado_id='{}'".format(vigilante_id))
    result = conn.execute(stmt)
    row = result.fetchone()
    vigilante_oficial_id = row[0]
    print(vigilante_oficial_id)
    stmt = text(("INSERT INTO horarios (dia_id, hora_id) VALUES('{}','{}')").format(
        dia_id, hora_id))
    h = conn.execute(stmt)
    horario_id = h.lastrowid
    print(horario_id)
    stmt = text(("INSERT INTO control_asistencias (asistencia, sede_id,horario_id,vigilante_id) VALUES ('{}', '{}','{}','{}')").format(
        asistencia, sede_id, horario_id, vigilante_oficial_id))
    conn.execute(stmt)
    conn.commit()
    conn.close()
    return redirect("/vigilante/edit?id=" + str(vigilante_id) +
                    "&mensaje=Se ha agregado un horario al vigilante")
