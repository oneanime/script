#!/bin/bash

zookeeper_home=$ZOOKEEPER_HOME

hostnames=$(cat hostInfo/zkhost)

if [ ! -n "$hostnames" ]; then
  echo 'hostnames is null'
  exit
fi

if [ "$1" = "start" ]; then
  for i in $hostnames; do
    echo "========== $i start=========="
    ssh $i "$zookeeper_home/bin/zkServer.sh start"
  done
elif [ "$1" = "stop" ]; then
  for i in $hostnames; do
    echo "========== $i stop=========="
    ssh $i "$zookeeper_home/bin/zkServer.sh stop"
  done
elif [ "$1" = "status" ]; then
  for i in $hostnames; do
    echo "========== $i status=========="
    ssh $i "$zookeeper_home/bin/zkServer.sh status"
  done
else
  echo "please input start,stop or status"
fi
