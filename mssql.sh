#!/bin/bash

if [ ! -n "$1" ] ;then
    echo -e "\n"
    echo "choose input value:"
    echo "1. start (start sql-server)"
    echo "2. stop (stop sql-server)"
    echo "3. status (check sql-server status. if you need no page,you can input '--no-pager' at last)"
    echo -e "\n"
else
    if [ ! -n "$2" ] ; then
	systemctl $1 mssql-server	
    else
        systemctl $1 mssql-server $2
    fi
fi


