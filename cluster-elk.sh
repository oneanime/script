#!/bin/bash

es_home=/opt/storage/elasticsearch/
kibana_home=/opt/tools/kibana
case $1  in
    "start") {
        for i in pseudo
        do
            ssh $i  "source /etc/profile;${es_home}/bin/elasticsearch >$es_home/logs/es.log 2>&1 &"
        done
        nohup ${kibana_home}/bin/kibana >$kibana_home/kibana.log 2>&1 &
    };;
    "stop") {
        ps -ef|grep ${kibana_home} |grep -v grep|awk '{print $2}'|xargs kill

        for i in pseudo
        do
            ssh $i "ps -ef|grep $es_home |grep -v grep|awk '{print \$2}'|xargs kill" >/dev/null 2>&1
        done
    };;
    *){
        echo "你启动的姿势不正确, 请使用参数 start 来启动es集群, 使用参数 stop 来关闭es集群"
    };;
esac
