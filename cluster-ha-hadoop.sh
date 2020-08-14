#!/bin/bash

zookeeper_home=/opt/module/zookeeper
hostnames=$(cat /opt/module/hadoop/etc/hadoop/slaves)
dfs_hostname="hadoop101"
#启动一个rm和所有的nm所在的host
yarn_hostname="hadoop102"
#启动配置HA yarn其他节点中的rm
yarn_hostnames="hadoop103"
user=$USER
hadoop_home=$HADOOP_HOME

if [ ! -n "$hostnames" ]; then
  echo 'hostnames is null'
  exit
fi

if [ "$1" = "start" ]; then

  for i in $hostnames; do
    echo "==========zk $i start=========="
    ssh $i "$zookeeper_home/bin/zkServer.sh start"
  done

  echo "==========dfs and zkf start=========="
  ssh "$user"@"$dfs_hostname" "$hadoop_home/sbin/start-dfs.sh"

  echo "==========yarn start=========="
  ssh "$user"@"$yarn_hostname" "$hadoop_home/sbin/start-yarn.sh"
  for i in $yarn_hostnames; do
    ssh $i "$hadoop_home/sbin/yarn-daemon.sh start resourcemanager"
  done

elif [ "$1" = "stop" ]; then

  echo "==========dfs and zkf stop=========="
  ssh "$user"@"$dfs_hostname" "$hadoop_home/sbin/stop-dfs.sh"

  echo "==========yarn stop=========="
  ssh "$user"@"$yarn_hostname" "$hadoop_home/sbin/stop-yarn.sh"
  for i in $yarn_hostnames; do
    ssh $i "$hadoop_home/sbin/yarn-daemon.sh stop resourcemanager"
  done

  for i in $hostnames; do
    echo "==========zk $i stop=========="
    ssh $i "$zookeeper_home/bin/zkServer.sh stop"
  done

else
  echo "please input start,stop"
fi
