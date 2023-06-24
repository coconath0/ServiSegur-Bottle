from bottle import Bottle, run, template, static_file, request, redirect
from sqlalchemy import text
from sqlalchemy import engine
from routes.asistencia_rou import subapp as asistencia_rou
from routes.sede_rou import subapp as sede_rou
from routes.horario_rou import subapp as horario_rou
from routes.vigilante_rou import subapp as vigilante_rou

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
    return template('home')



@app.route('/asistencia', method='GET')
def home():
    return template('asistencia')

@app.route('/sede', method='GET')
def home():
    return template('sede')

@app.route('/horario', method='GET')
def home():
    return template('horario')

@app.route('/vigilante', method='GET')
def home():
    return template('vigilante')


if __name__ == '__main__':
    run(app, host='localhost', port=8080, debug=True, reloader=True)