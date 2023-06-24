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
    SELECT E.id AS id_empleado,E.fecha_ini_contrato, E.nombre,E.dni,E.num_cuenta,'No' AS "portaArma" ,S.tipo FROM vigilantes V
INNER JOIN empleados E ON E.id= V.empleado_id
INNER JOIN servicios S ON S.id = V.servicio_id
WHERE V.portaArma = 0
UNION
SELECT E.id AS id_vigilante,E.fecha_ini_contrato, E.nombre,E.dni,E.num_cuenta,'Sí' AS "portaArma" ,S.tipo FROM vigilantes V
INNER JOIN empleados E ON E.id= V.empleado_id
INNER JOIN servicios S ON S.id = V.servicio_id
WHERE V.portaArma = 1
""".format())
    
    rows = conn.execute(stmt)
    conn.close()
    # respuesta
    locals = {'vigilante': rows, 'mensaje': mensaje}

    return template('vigilante/indexV', locals)
