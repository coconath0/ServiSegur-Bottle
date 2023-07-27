# ServiSegur Database System - Data Engineering Project
The ServiSegur-Bottle is a service application that uses a SQLite database to store information. This application is an implementation and programming project for the course of Data Engineering. It serves as the database system for the company ServiSegur.

## Installation

1. Clone this repository to your local machine using the following command:

```
git clone https://github.com/coconath0/ServiSegur-Bottle.git
```

2. Navigate to the project directory:

```
cd ServiSegur-Bottle
```

3. Install the required dependencies using pip:

```
pip install -r requirements.txt
```

## Database Configuration

The project uses a SQLite database to store information. To configure the database connection, follow the steps below:

1. Ensure you have SQLite installed on your system.

2. Open the `database.py` file and look for the following lines of code:

```python
import os
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Database connection using SQLite in /db/AppServi.db:
engine = create_engine('sqlite:///db/AppServi.db')
session_db = sessionmaker()
session_db.configure(bind=engine)
```

3. If you want to change the location or name of the database, modify the connection string `'sqlite:///db/AppServi.db'` according to your preferences.

## Usage

### Prerequisites

Ensure you have Python and the required dependencies installed. You can install the dependencies using the `requirements.txt` file included in the repository:

```bash
pip install -r requirements.txt
```

### Running the Application

To run the application, simply execute the `maih.py` file:

```bash
python main.py
```

The application will run at `http://localhost:8000/`, and you can access it from your web browser.

####If you get an error from sqlalchemy then use the command below:

```
> pip install --upgrade sqlalchemy
```

### Application Routes

The application uses routes to manage different parts of the functionality. Below are the available routes:

- `/` - Home page, displays a simple homepage.
- `/asistencia` - Route to manage attendance (provided by `asistencia_routes`).
- `/sede` - Route to manage headquarters (provided by `sede_routes`).
- `/horario` - Route to manage schedules (provided by `horario_routes`).
- `/vigilante` - Route to manage security guards (provided by `vigilante_routes`).

### Static Files

The application serves static files (CSS, JS, images) to enhance the user experience. These files are located in the following paths:

- `/static/css/<filename>` - CSS files.
- `/static/js/<filename>` - JavaScript files.
- `/static/img/<filename>` - Image files.

Make sure to keep the static files in the appropriate folder within your project structure.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
