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
SELECT E.id AS id_vigilante,E.fecha_ini_contrato, E.nombre,E.dni,E.num_cuenta,'No' AS "portaArma" ,S.tipo FROM vigilantes V
INNER JOIN empleados E ON E.id= V.empleado_id
INNER JOIN servicios S ON S.id = V.servicio_id
WHERE V.portaArma = 0
UNION
SELECT E.id AS id_vigilante,E.fecha_ini_contrato, E.nombre,E.dni,E.num_cuenta,'Sí' AS "portaArma" ,S.tipo FROM vigilantes V
INNER JOIN empleados E ON E.id= V.empleado_id
INNER JOIN servicios S ON S.id = V.servicio_id
WHERE V.portaArma = 1""".format())

    rows = conn.execute(stmt)
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
    servicio = conn.execute(stmt1)
    conn.close()
    vigilante = (0, "", "", "", "", 0, "")
    portaArma = (0, 1)
    locals = {
        'vigilante': vigilante,
        'servicio': servicio,
        'portaArma': portaArma,
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
SELECT E.id AS id_vigilante,E.fecha_ini_contrato, E.nombre,E.dni,E.num_cuenta,'No' AS "portaArma" ,S.tipo FROM vigilantes V
INNER JOIN empleados E ON E.id= V.empleado_id
INNER JOIN servicios S ON S.id = V.servicio_id
WHERE V.portaArma = 0
UNION
SELECT E.id AS id_vigilante,E.fecha_ini_contrato, E.nombre,E.dni,E.num_cuenta,'Sí' AS "portaArma" ,S.tipo FROM vigilantes V
INNER JOIN empleados E ON E.id= V.empleado_id
INNER JOIN servicios S ON S.id = V.servicio_id
WHERE V.portaArma = 1)
WHERE id_vigilante = {}""").format(vigilante_id))
    vigilante = conn.execute(stmt).fetchone()

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
    control_asistencia = conn.execute(stmt)

    stmt1 = text(("SELECT * FROM servicios").format())
    servicio = conn.execute(stmt1)
    conn.close()
    locals = {
        'vigilante': vigilante,
        'control_asistencia': control_asistencia,
        'id': vigilante_id,
        'servicio': servicio,
        'mensaje': mensaje,
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
