#!/bin/bash

hive_home=$HIVE_HOME
cluster_hosts=$(cat hostInfo/hivehost)

case $1 in
"start")
  for i in $cluster_hosts; do
    ssh $i "nohup $HIVE_HOME/bin/hiveserver2 >s2.log >&1 &"
  done
  ;;
"stop")
  for i in $cluster_hosts; do
    ssh $i "$HIVE_HOME/bin/hiveserver2 >s2.log >&1 &"
  done
  ;;
"meta")
  for i in $cluster_hosts; do
    ssh $i "nohup $HIVE_HOME/bin/hive --service metastore >s2.log >&1 &;nohup $HIVE_HOME/bin/hive --service hiveserver2 >s2.log >&1 &"
  done
  ;;
esac
