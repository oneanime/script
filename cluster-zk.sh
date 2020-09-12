#!/bin/bash

zookeeper_home=$ZOOKEEPER_HOME

hostnames=$(cat hostInfo/zkhost)

case $1 in
"start")
  for i in $hostnames; do
    echo "========== $i start=========="
    ssh $i "$zookeeper_home/bin/zkServer.sh start"
  done
;;
"stop")
  for i in $hostnames; do
    echo "========== $i stop=========="
    ssh $i "$zookeeper_home/bin/zkServer.sh stop"
  done
;;
"status")
  for i in $hostnames; do
    echo "========== $i status=========="
    ssh $i "$zookeeper_home/bin/zkServer.sh status"
  done
;;
"*")
  echo "please input start,stop or status"
;;
esac
