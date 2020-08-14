#!/bin/bash

phoenix_home=$PHOENIX_HOME

$phoenix_home/bin/sqlline.py hadoop101,hadoop102,hadoop103:2181
