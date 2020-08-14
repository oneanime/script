#!/bin/bash

SCRIPT_HOME=/home/hp/bin

case $1 in
"start")
  $SCRIPT_HOME/cluster-hadoop.sh start
  $SCRIPT_HOME/cluster-zk.sh start
  $HBASE_HOME/bin/start-hbase.sh
  ;;
"stop")
  $SCRIPT_HOME/cluster-hadoop.sh stop
  $SCRIPT_HOME/cluster-zk.sh stop
  $HBASE_HOME/bin/stop-hbase.sh
  ;;
*) ;;

esac
