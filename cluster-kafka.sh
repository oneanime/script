#!/bin/bash
################################## check evn ########################

kafka_home=$KAFKA_HOME
cluster_hosts=$(cat hostInfo/kafkahost)
#zk_ip_port=hadoop101:2181
bootstrap_server_hostname=`echo $cluster_hosts | awk '{print $1}'`
bootstrap_server=$bootstrap_server_hostname":9092"
source_java="source ~/.bash_profile"

#####################################################################
case $1 in
"start")
  for i in $cluster_hosts; do
    echo "========== $i ===kafka-start======="
    ssh $i "${source_java}&&$kafka_home/bin/kafka-server-start.sh -daemon $kafka_home/config/server.properties"
  done
  ;;
"stop")
  for i in $cluster_hosts; do
    echo "==========$i====kafka-stop========"
    ssh $i "${source_java}&&$kafka_home/bin/kafka-server-stop.sh"
  done
  ;;
"list")
  $kafka_home/bin/kafka-topics.sh --bootstrap-server $bootstrap_server --list
  ;;
"tc")
  topic_name=$2
  replication_num=$3
  partition_num=$4

  if [[ -n "$replication_num" ]] && [[ -n "$replication_num" ]]; then
    $kafka_home/bin/kafka-topics.sh --bootstrap-server $bootstrap_server --create --replication-factor $replication_num --partitions $partition_num --topic $topic_name
  else
    $kafka_home/bin/kafka-topics.sh --bootstrap-server $bootstrap_server --create --replication-factor 2 --partitions 3 --topic $topic_name
  fi
  ;;
"td")
  topic_name=$2
  $kafka_home/bin/kafka-topics.sh --bootstrap-server $bootstrap_server --delete --topic $topic_name
  ;;
"desc")
  topic_name=$2
  $kafka_home/bin/kafka-topics.sh --bootstrap-server $bootstrap_server --describe --topic $topic_name
  ;;
"kcp")
  topic_name=$2
  if [ ! -n "$topic_name" ]; then
    echo "$topic_name is null"
  fi
  $kafka_home/bin/kafka-console-producer.sh --broker-list $bootstrap_server --topic $topic_name
  ;;
"kcc")
  topic_name=$2
  if [ ! -n "$topic_name" ]; then
    echo "$topic_name is null"
  fi
  $kafka_home/bin/kafka-console-consumer.sh --bootstrap-server $bootstrap_server --from-beginning --topic $topic_name
  ;;
"print-log")
  $kafka_home/bin/kafka-run-class.sh kafka.tools.DumpLogSegments --files $2 --print-data-log
  ;;
"print-index")
  $kafka_home/bin/kafka-run-class.sh kafka.tools.DumpLogSegments --files $2
  ;;
"print-timeindex")
  $kafka_home/bin/kafka-run-class.sh kafka.tools.DumpLogSegments --files $2 --verify-index-only
  ;;
"help")
  echo "start"
  echo "stop"
  echo "list"
  echo "tc(topic create)"
  echo "td(topic delete)"
  echo "desc(describe)"
  echo "kcp(kafka-console-producer)"
  echo "kcc(kafka-console-consumer)"
  echo "print-log"
  echo "print-index"
  echo "print-timeindex"
  ;;
*)
  echo "start"
  echo "stop"
  echo "list"
  echo "tc(topic create)"
  echo "td(topic delete)"
  echo "desc(describe)"
  echo "kcp(kafka-console-producer)"
  echo "kcc(kafka-console-consumer)"
  echo "print-log"
  echo "print-index"
  echo "print-timeindex"
  ;;
esac
