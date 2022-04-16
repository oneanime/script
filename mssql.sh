#!/bin/bash

case $1 in
"start")
    if [ ! -n "$2" ] ; then
      sudo systemctl start mssql-server
    else
      sudo systemctl start mssql-server $2
    fi
;;
"stop")
    sudo systemctl stop mssql-server
;;
"status")
    sudo systemctl status mssql-server
;;
"restart")
    sudo systemctl restart mssql-server
;;
"cli")
    sudo sqlcmd -S localhost -U SA -P '123456Sql'
;;
*)
    echo -e "\n"
    echo "choose input value:"
    echo "1. start (start sql-server)"
    echo "2. stop (stop sql-server)"
    echo "3. status (check sql-server status. if you need no page,you can input '--no-pager' at last)"
    echo -e "\n"
;;
esac
