# start with a base image
FROM ubuntu:14.04
MAINTAINER Real Python <info@realpython.com>

# install dependencies
RUN apt-get -qq update
RUN apt-get install -y python python-pip

# grab contents of source directory
#ADD ./src /src/

# specify working directory
#WORKDIR /src

# build app
RUN pip install django
RUN python stockprediction/manage.py makemigrations --noinput
RUN python stockprediction/manage.py migrate --noinput
RUN python stockprediction/manage.py test --noinput

# expose port 8000 for us to use
EXPOSE 8000

CMD python stockprediction/manage.py runserver 0.0.0.0:8000
