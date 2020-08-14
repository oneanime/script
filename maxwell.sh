#!/bin/bash

case $1 in
"start")
$MAXWELL_HOME/bin/maxwell --config  /$MAXWELL_HOME/conf/maxwell.properties >/dev/null 2>&1 &
;;
"stop")
jps | grep Maxwell | awk '{print $1}'| xargs kill -9
;;
*)
;;
esac
