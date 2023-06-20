from bottle import Bottle, run, template, static_file

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


""" Front page and Filters """
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