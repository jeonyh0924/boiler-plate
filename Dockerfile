FROM ubuntu:18.04
MAINTAINER hungyb0924@gmail.com

# 패캐지 업그레이드, Python3 설치
RUN         apt -y update
RUN         apt -y dist-upgrade
RUN         apt -y install python3-pip

# Nginx, uWSGI 설치 (Web server, wsgi)
RUN         apt -y install nginx
RUN         pip3 install uwsgi

# docker build 할 때 path에 해당하는 폴더 전체 내용을 Image /srv/proejct/ 폴더 내부에 복사
COPY        ./ /srv/project
WORKDIR     /srv/project
RUN         pip3 install -r requirements.txt

ENV         DJANGO_SETTINGS_MODULE  config.settings.production
# 프로세스 실행 명령
WORKDIR     /srv/project/app
RUN         python3 manage.py collectstatic --noinput

# Ngin
RUN         rm -rf  /etc/nginx/sites-available/* && \
            rm -rf  /etc/nginx/sites-enabled/* && \
            cp -f   /srv/project/.config/app.nginx \
                    /etc/nginx/sites-available/ && \
            ln -sf  /etc/nginx/sites-available/app.nginx \
                    /etc/nginx/sites-enabled/app.nginx

#RUN         cp -f   /srv/project/.config/supervisord.conf \
#                    /etc/supervisor/conf.d/
#CMD python3 manage.py runserver 0:8000
# uWSGI
#CMD         uwsgi --http :8000 --chdir /srv/project/app --wsgi config.wsgi