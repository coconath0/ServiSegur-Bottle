from bottle import Bottle, run, template, static_file, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()


@subapp.route('/', method='GET')
def indexH():
    # mensaje
    mensaje = request.params.mensaje
    print(mensaje)
    # acceso a db
    conn = engine.connect()
    # ejecutamos un query
    stmt = text("""SELECT ca.horario_id AS id,e.nombre AS nombre_vigilante, d.nombre AS nombre_dia, ho.rango_horario AS nombre_hora, s.nombre AS nombre_sede
FROM control_asistencias ca
JOIN vigilantes v ON ca.vigilante_id = v.id
JOIN empleados e ON v.empleado_id = e.id
JOIN sedes s ON ca.sede_id = s.id
JOIN horarios h ON ca.horario_id = h.id
JOIN dias d ON h.dia_id = d.id
JOIN horas ho ON h.hora_id = ho.id
ORDER BY id;""".format())

    rows = conn.execute(stmt)
    conn.close()
    # respuesta
    locals = {'horario': rows, 'mensaje': mensaje}

    return template('horario/indexH', locals)
