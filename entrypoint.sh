#!/bin/sh

# Nginx를 백그라운드에서 실행
nginx -g 'daemon off;' &

# Gunicorn을 포그라운드에서 실행
# gunicorn --workers 2 --bind [IP:PORT] [모듈:앱객체]
gunicorn --workers 2 --bind unix:/tmp/gunicorn.sock app.main:app