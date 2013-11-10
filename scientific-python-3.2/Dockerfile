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
RUN apt-get install -y python3 python3-dev

# database client
# sqllite client
RUN apt-get install libsqlite3-dev sqlite3
# Postgresql client
RUN apt-get install -y postgresql-client-9.1 postgresql-client-common libpq5 libpq-dev
# Needed for mysql-python
RUN apt-get -y install libmysqlclient-dev

# needed for httplib2
RUN apt-get install -y libxml2-dev libxslt-dev

# atlas needed for scikit-learn
#RUN apt-get install -y libatlas-dev libatlas3-base

# distribute
RUN wget http://python-distribute.org/distribute_setup.py 
RUN python distribute_setup.py
RUN rm -f /distribute_setup.py

# pip
RUN wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py 
RUN python get-pip.py
RUN rm -f /get-pip.py

RUN apt-get install -y libfreetype6 libfreetype6-dev

# python-PIL
RUN apt-get install -y python-imaging libpng-dev 

# pyzmq
RUN apt-get install -y libzmq-dev

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

# It is necessary to use the perl_compile.pl script to make a flat dockerfile
# since this many run commands exceeds the layer limit.
#
# scipy stack
RUN pip install pyzmq==14.0.0
RUN pip install numpy==1.8.0
RUN pip install scipy==0.13.0
RUN pip install ipython==1.1.0
RUN pip install matplotlib==1.3.1
RUN pip install pandas==0.12.0
RUN pip install sympy==0.7.3
RUN pip install nose==1.3.0
# other packages
RUN pip install pyzmq==14.0.0
RUN pip install argparse==1.2.1
RUN pip install beautifulsoup==3.2.0
RUN pip install biopython==1.62
RUN pip install boto==2.15.0
RUN pip install cython==0.19.2
RUN pip install distribute==0.6.49
RUN pip install faulthandler==2.2
RUN pip install h5py==2.2.0
RUN pip install html5lib==0.99
RUN pip install httplib2==0.8
RUN pip install lxml==3.2.3
RUN pip install mdp==3.3
RUN pip install mysql-python==1.2.4
RUN pip install nltk==2.0.4
RUN pip install numexpr==2.2.2
RUN pip install oursql==0.9.3.1
RUN pip install paramiko==1.8.0
RUN pip install PIL==1.1.7
RUN pip install ply==3.4
RUN pip install psutil==1.1.3
RUN pip install psycopg2==2.5.1
RUN pip install pycrypto==2.6.1
RUN pip install pyface==4.3.0
RUN pip install pyfits==3.1.2
RUN pip install pyflakes==0.7.3
RUN pip install pyglet==1.1.4
RUN pip install pymc==2.3
RUN pip install pyparsing==2.0.1
RUN pip install Pyrex==0.9.9
RUN pip install python-dateutil==2.1
RUN pip install pytz==2013.7
RUN pip install PyYAML==3.10
#RUN pip install rpy2==2.3.8
RUN pip install scikits-image==0.7.1
RUN pip install scikit-learn==0.14.1
RUN pip install patsy==0.2.1
RUN pip install statsmodels==0.5.0
RUN pip install simplejson==3.3.1
RUN pip install six==1.4.1
RUN pip install SQLAlchemy==0.8.3
RUN pip install storm==0.20
RUN pip install tables==3.0.0
RUN pip install tornado==3.1.1
RUN pip install traits==4.3.0
RUN pip install traitsui==4.3.0
RUN pip install Twisted==13.1.0
RUN pip install wsgiref==0.1.2
RUN pip install zope.interface==4.0.5


EXPOSE 8888
