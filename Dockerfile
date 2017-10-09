# start with a base image
FROM ubuntu:14.04
MAINTAINER Real Python <info@realpython.com>
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && \
  rm -rf /var/lib/apt/lists/* && \
  sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
  sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf && \
  echo "mysqld_safe &" > /tmp/config && \
  echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
  echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'" >> /tmp/config && \
  bash /tmp/config && \
  rm -f /tmp/config

# Define mountable directories.
VOLUME ["/etc/mysql", "/var/lib/mysql"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["mysqld_safe"]

# Expose ports.
EXPOSE 3306


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
#`RUN pip install MySQL-python
RUN pip install django
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py test

# expose port 8000 for us to use
EXPOSE 8000

CMD python stockprediction/manage.py runserver 0.0.0.0:8000
