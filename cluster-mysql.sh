#!/bin/bash

case $1 in
"start")
sudo service mysql start
;;
"stop")
sudo service mysql stop
;;
"restart")
sudo service mysql restart
;;
*)
;;
esac
