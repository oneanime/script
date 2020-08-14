#!/bin/bash
flink_home=$FLINK_HOME
$flink_home/bin/yarn-session.sh -n 2 -s 2 -jm 1024 -tm 1024 -nm $1 -d
