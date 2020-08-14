#!/bin/bash

case $1 in
"start")
  $NGINX_HOME/sbin/nginx
  ;;
"stop")
  $NGINX_HOME/sbin/nginx -s stop
  ;;
*) ;;

esac
