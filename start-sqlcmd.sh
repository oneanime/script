#! /bin/bash


if [! -n "$1"] ;then
   /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 123456Sql
else
   /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 123456Sql -i $1
fi



