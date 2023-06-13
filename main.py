from bottle import Bottle, run, template, static_file

app = Bottle()


@app.route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='./views/static')


@app.route('/', method='GET')
def home():
    return template('home')

if __name__ == '__main__':
    run(app, host='localhost', port=8080, debug=True, reloader=True)