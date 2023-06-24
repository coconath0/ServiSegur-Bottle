from bottle import Bottle, run, template, static_file, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()

#consulta sedes con su empresa
@subapp.route('/', method='GET')
def indexS():
    # mensaje
    mensaje = request.params.mensaje
    print(mensaje)
    # acceso a db
    conn = engine.connect()
    # ejecutamos un query
    stmt = text(""" SELECT s.nombre AS nombre_sede, e.nombre AS nombre_empresa
FROM sedes s
JOIN empresas e ON s.empresa_id = e.id;""".format())
    
    rows = conn.execute(stmt)
    conn.close()
    # respuesta
    locals = {'sede': rows, 'mensaje': mensaje}

    return template('sede/indexS', locals)