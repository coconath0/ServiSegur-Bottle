import os
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

#Conexion a base de datos mediante sqlite en /db/AppServi.db:
engine = create_engine('sqlite:///db/AppServi.db')
session_db = sessionmaker()
session_db.configure(bind = engine)

#Para conexión a Oracle, usaremos otro metodo