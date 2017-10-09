# start with a base image
FROM ubuntu:14.04
MAINTAINER Real Python <info@realpython.com>



# install dependencies
RUN apt-get -qq update
RUN apt-get install -y python python-pip


# grab contents of source directory
ADD ./stockprediction /stockprediction/

# specify working directory
WORKDIR /stockprediction

# build app
#!/usr/bin/python
RUN apt-get install -y python-dev 
RUN apt-get install -y libmysqlclient-dev
RUN pip install MySQL-python
RUN /etc/init.d/mysql start
RUN pip install django
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py test

# expose port 8000 for us to use
EXPOSE 8000

CMD python stockprediction/manage.py runserver 0.0.0.0:8000
