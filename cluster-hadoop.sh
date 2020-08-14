#!/bin/bash
################################## check evn ########################

if [ ! -n "$USER" ]; then
  echo 'USER is null'
  exit
fi

hadoop_home=$HADOOP_HOME
user=$USER

###################################################################
dfs_hostname=$(cat hostInfo/hadoophost | awk 'NR==1')
yarn_hostname=$(cat hostInfo/hadoophost | awk 'NR==2')
##################################################################
if [ "$1" = "start" ]; then
  ssh "$user"@"$dfs_hostname" "$hadoop_home/sbin/start-dfs.sh"
  ssh "$user"@"$yarn_hostname" "$hadoop_home/sbin/start-yarn.sh"
elif [ "$1" = "stop" ]; then
  ssh "$user"@"$dfs_hostname" "$hadoop_home/sbin/stop-dfs.sh"
  ssh "$user"@"$yarn_hostname" "$hadoop_home/sbin/stop-yarn.sh"
else
  echo "please input start or stop"
fi
