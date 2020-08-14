#!/bin/bash
case $1 in
    "start")
            echo "========启动日志服务: $i==============="
            java -jar /opt/module/logger/logger-0.0.1-SNAPSHOT.jar >/dev/null 2>&1  &
     ;;
    "stop")
            echo "========关闭日志服务: $i==============="
            "ps -ef|grep logger-0.0.1-SNAPSHOT.jar | grep -v grep|awk '{print \$2}'|xargs kill" >/dev/null 2>&1
    ;;
    *)
    ;;
esac

