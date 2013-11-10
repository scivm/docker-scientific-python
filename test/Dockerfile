FROM ubuntu:12.04

RUN echo "deb ftp://mirror.hetzner.de/ubuntu/packages precise main restricted universe multiverse" > /etc/apt/sources.list
#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# basic tools
RUN apt-get install -y vim-tiny

# compilers
#RUN apt-get install -y gfortran build-essential make gcc build-essential

# install python
ADD repo.sh /tmp/repo.sh
ADD fkrull-deadsnakes-precise.list /tmp/fkrull-deadsnakes-precise.list
RUN chmod 755 /tmp/repo.sh; /tmp/repo.sh
RUN apt-get update
RUN apt-get install -y python3.1 python3.1-dev

