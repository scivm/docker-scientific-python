FROM ubuntu:12.04

RUN echo "deb ftp://mirror.hetzner.de/ubuntu/packages precise main restricted universe multiverse" > /etc/apt/sources.list
#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# basic tools
RUN apt-get install -y openssh-server git-core curl wget vim-tiny

# compilers
RUN apt-get install -y gfortran build-essential make gcc build-essential

# install python
ADD repo.sh /tmp/repo.sh
ADD fkrull-deadsnakes-precise.list /tmp/fkrull-deadsnakes-precise.list
RUN chmod 755 /tmp/repo.sh; /tmp/repo.sh
RUN apt-get update
RUN apt-get install -y python3.3 python3.3-dev

# database client
# sqllite client
RUN apt-get install libsqlite3-dev sqlite3
# Postgresql client
RUN apt-get install -y postgresql-client-9.1 postgresql-client-common libpq5 libpq-dev
# Needed for mysql-python
RUN apt-get -y install libmysqlclient-dev

# needed for httplib2
RUN apt-get install -y libxml2-dev libxslt-dev

RUN apt-get install -y libfreetype6 libfreetype6-dev

# python-PIL
RUN apt-get install -y python-imaging libpng-dev 

# pyzmq
RUN apt-get install -y libzmq-dev

# atlas

# hdf5
ADD hdf5_install.sh /tmp/hdf5_install.sh
RUN chmod 755 /tmp/hdf5_install.sh; /tmp/hdf5_install.sh

# blas
ADD blas.sh /tmp/blas.sh
RUN chmod 755 /tmp/blas.sh; /tmp/blas.sh
ENV BLAS /usr/local/lib/libfblas.a

# lapack
ADD lapack.sh /tmp/lapack.sh
RUN chmod 755 /tmp/lapack.sh; /tmp/lapack.sh
ENV LAPACK /usr/local/lib/liblapack.a

# distribute
RUN wget http://python-distribute.org/distribute_setup.py
RUN python distribute_setup.py
RUM rm -f /distribute*

# pip
RUN wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
RUN python get-pip.py
RUN rm -f /get-pip.py

# virtualenv
# This gets a current version.  Do not use the version packaged with ubuntu
RUN pip install virtualenv==1.10.1


# scientific python packages
ADD packages.sh /tmp/packages.sh
ADD requirements.sh /tmp/requirements.sh
RUN chmod 755 /tmp/packages.sh; /tmp/packages.sh

EXPOSE 8888
