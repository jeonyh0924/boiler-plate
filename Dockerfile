FROM ubuntu:18.04
MAINTAINER hungyb0924@gmail.com

RUN apt -y update
RUN apt -y dist-upgrade
RUN apt -y install python3-pip

COPY ./ /srv/project
WORKDIR /srv/project
RUN pip3 install -r requirements.txt

WORKDIR /srv/project/app
CMD python3 manage.py runserver 0:8000