from bottle import Bottle, run, template, static_file, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()

#Consulta asistencias
@subapp.route('/', method='GET')
def indexA():
    # mensaje
    mensaje = request.params.mensaje
    print(mensaje)
    # acceso a db
    conn = engine.connect()
    # ejecutamos un query
    stmt = text("""SELECT ca.horario_id AS id,e.nombre AS nombre_vigilante, s.nombre AS nombre_sede, d.nombre AS nombre_dia, ho.rango_horario AS nombre_hora,
CASE ca.asistencia
WHEN 0 THEN 'FALTÓ'
WHEN 1 THEN 'ASISTIÓ'
END AS asistencia
FROM control_asistencias ca
JOIN vigilantes v ON ca.vigilante_id = v.id
JOIN empleados e ON v.empleado_id = e.id
JOIN sedes s ON ca.sede_id = s.id
JOIN horarios h ON ca.horario_id = h.id
JOIN dias d ON h.dia_id = d.id
JOIN horas ho ON h.hora_id = ho.id 
ORDER BY id""".format())
    
    rows = conn.execute(stmt)
    conn.close()
    # respuesta
    locals = {'asistencia': rows, 'mensaje': mensaje}
    return template('asistencia/indexA', locals)