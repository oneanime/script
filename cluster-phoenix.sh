#!/bin/bash

phoenix_home=$PHOENIX_HOME
case $1 in
"start")
$phoenix_home/bin/sqlline.py pseudo:2181
;;
"stop")
jps | grep SqlLine | awk '{print $1}'| xargs kill -9
;;
*)
;;
esac
