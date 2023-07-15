from bottle import Bottle, run, template, static_file, request, redirect, route
from sqlalchemy import text
from database import engine
from routes.asistencia_routes import subapp as asistencia_routes
from routes.sede_routes import subapp as sede_routes
from routes.horario_routes import subapp as horario_routes
from routes.vigilante_routes import subapp as vigilante_routes

app = Bottle()

""" Static files """
@app.route('/static/css/<filename>')
def server_static(filename):
    return static_file(filename, root='./views/static/css')

@app.route('/static/js/<filename>')
def server_static(filename):
    return static_file(filename, root='./views/static/js')

@app.route('/static/img/<filename>')
def server_static(filename):
    return static_file(filename, root='./views/static/img')


""" Front page """
@app.route('/', method='GET')
def home():
    #respuesta
    return template('home')


if __name__ == '__main__':
    app.mount('/asistencia', asistencia_routes)
    app.mount('/sede', sede_routes)
    app.mount('/horario', horario_routes)
    app.mount('/vigilante', vigilante_routes)
    run(app, host='localhost', port=8080, debug=True, reloader=True)