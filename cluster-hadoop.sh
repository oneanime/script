#!/bin/bash
################################## check evn ########################

hadoop_home=$HADOOP_HOME

###################################################################
dfs_hostname=$(cat hostInfo/hadoophost | awk 'NR==1')
yarn_hostname=$(cat hostInfo/hadoophost | awk 'NR==2')
##################################################################

case $1 in
"start")
	ssh "$dfs_hostname" "$hadoop_home/sbin/start-dfs.sh"
	ssh "$yarn_hostname" "$hadoop_home/sbin/start-yarn.sh"
;;
"stop")
	ssh "$dfs_hostname" "$hadoop_home/sbin/stop-dfs.sh"
	ssh "$yarn_hostname" "$hadoop_home/sbin/stop-yarn.sh"
;;
"*")
	echo "please input start or stop"
;;
esac

