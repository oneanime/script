#!/bin/bash

if [ ! -n "$JAVA_HOME" ]; then
  echo 'JAVA_HOME is null'
  exitp
fi

hostnames=$(cat hostInfo/jpshost)

if [ ! -n "$hostnames" ]; then
  echo 'hostnames is null'
  exit
fi

for i in $hostnames; do
  echo "========== $i =========="
  ssh $i "$JAVA_HOME/bin/jps"
done
