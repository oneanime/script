#!/bin/bash



case $1 in 
"start")
   $MONGODB_HOME/bin/mongod -f $MONGODB_HOME/etc/mongodb.conf
;;
"stop")
   $MONGODB_HOME/bin/mongod -f $MONGODB_HOME/etc/mongodb.conf --shutdown
;;
*)
   echo "please input start or stop"
esac
