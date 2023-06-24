from bottle import Bottle, run, template, static_file, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()

@subapp.route('/', method='GET')
def indexH():

    return template('horario/indexH')