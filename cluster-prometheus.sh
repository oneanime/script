#!/bin/bash

PROMETHEUS_HOME=/mnt/module/prometheus
PROMETHEUS_DATA_DIR=/mnt/data/prometheus/

case $1 in
"start")
nohup ${PROMETHEUS_HOME}/prometheus --storage.tsdb.path="${PROMETHEUS_DATA_DIR}" --log.level=debug --web.enable-lifecycle --web.enable-admin-api --config.file=${PROMETHEUS_HOME}/prometheus.yml > ${PROMETHEUS_HOME}/prometheus.log 2>&1 &
;;
"stop")
jps | grep prometheus | awk '{print $1}'| xargs kill -9
;;
esac
