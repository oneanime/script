#! /bin/bash

if [ ! -n "$1" ]
then
  echo '输入参数（start 或者stop）'
else
  if [ "$1" = "start" ]
  then
	/opt/module/hadoop/sbin/start-dfs.sh;/opt/module/hadoop/sbin/start-yarn.sh
  elif [ "$1" = "stop" ]
  then
	/opt/module/hadoop/sbin/stop-dfs.sh;/opt/module/hadoop/sbin/stop-yarn.sh
  else
	echo "输入start或start" 
  fi 
fi
