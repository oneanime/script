#!/bin/bash

case $1 in
"start")
sudo /etc/init.d/clickhouse-server start
;;
"stop")
sudo /etc/init.d/clickhouse-server stop
;;
"restart")
sudo /etc/init.d/clickhouse-server restart
;;
"cli")
clickhouse-client -h 127.0.0.1 -d default -m -u default --password 123456sql
;;
*)
;;
esac
