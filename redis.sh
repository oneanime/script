#!/bin/bash

redis_home=$REDIS_HOME

if [ "$1" = "start" ]; then
  $REDIS_HOME/bin/redis-server /home/hp/conf/redis.conf
elif [ "$1" = "stop" ]; then
  $REDIS_HOME/bin/redis-cli -h 127.0.0.1 -p 6379 -a 123456sql shutdown
elif [ "$1" = "cli" ]; then
  $REDIS_HOME/bin/redis-cli -a 123456sql --raw
fi
