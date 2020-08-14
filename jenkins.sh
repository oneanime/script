#!/bin/bash

case $1 in
"start")
  sudo systemctl start jenkins
  ;;
"stop")
  systemctl stop jenkins
  ;;
"status")
  systemctl status jenkins
  ;;
"restart")
  systemctl restart jenkins
  ;;
*) ;;

esac
