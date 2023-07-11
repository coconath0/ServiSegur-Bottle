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
    stmt = text("""SELECT ca.id AS id,e.nombre AS nombre_vigilante, s.nombre AS nombre_sede, d.nombre AS nombre_dia, ho.rango_horario AS nombre_hora,
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
ORDER BY d.id""".format())
    rows = conn.execute(stmt).fetchall()
    conn.close()
    # respuesta
    locals = {'asistencia': rows, 'mensaje': mensaje}
    return template('asistencia/indexA', locals)

@subapp.route('/edit', method='GET')
def edit():
    mensaje = request.params.mensaje
    control_asistencia_id = int(request.params.id)
    conn = engine.connect()
    stmt = text("""SELECT ca.id AS id, s.id,h.id,e.id,v.id,
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
JOIN empresas em ON em.id = s.empresa_id
WHERE ca.id = {}""".format(control_asistencia_id))
    control_asistencia = conn.execute(stmt).fetchone()
    conn.close()
    locals = {
        'control_asistencia': control_asistencia,
        'mensaje': mensaje,
        'control_asistencia_id':control_asistencia_id
    }
    return template('asistencia/detail', locals)

@subapp.route('/save', method= 'POST')
def save():
    asistencia = int(request.forms.get('asistencia'))
    control_asistencia_id = int(request.forms.get('id'))
    conn = engine.connect()
    stmt = text(("UPDATE control_asistencias SET  asistencia= '{}' WHERE id = {}").format(asistencia,control_asistencia_id))
    conn.execute(stmt)
    conn.commit()
    conn.close()
    mensaje = "Asistencia modificada con exito"
    return redirect("/asistencia/?mensaje=" + mensaje)
