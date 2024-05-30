# Use the official Python image as the application service
FROM python:3.8-slim as app

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=myflaskapp
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=root
ENV FLASK_APP=run.py

# Install system dependencies
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install Flask==2.3.3 flask-cors Flask-MySQLdb Flask-SQLAlchemy

# Copy the database init script and Flask app
COPY ./init.sql /docker-entrypoint-initdb.d/
COPY ./webapp /webapp 
WORKDIR /webapp

# Start the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]

