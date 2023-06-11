from bottle import Bottle, run, template

app = Bottle()

@app.route('/', method='GET')
def home():
    locals = { 'mensaje': 'Si se puede'}
    return template('home', locals)

if __name__ == '__main__':
    run(app, host='localhost', port=8080, debug=True, reloader=True)