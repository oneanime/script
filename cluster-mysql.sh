#!/bin/bash

mysql_base_dir=$MYSQL_HOME

case $1 in
"start")
sudo ${mysql_base_dir}/support-files/mysql.server start
#sudo service mysql start
;;
"stop")
sudo ${mysql_base_dir}/support-files/mysql.server stop
#sudo service mysql stop
;;
"restart")
sudo ${mysql_base_dir}/support-files/mysql.server restart
#sudo service mysql restart
;;
"cli")
sudo ${mysql_base_dir}/bin/mysql -uroot -p
;;
"rcli")
sudo ${mysql_base_dir}/bin/mysql -uroot -h192.168.79.200 -p123456sql
#mysql -uroot -h192.168.79.200 -p123456sql
;;
"import")
sudo ${mysql_base_dir}/bin/mysql -uroot -h192.168.79.200 -p123456sql -t < $2
#mysql -uroot -h192.168.79.200 -p123456sql -t < $2
;;
*)
;;
esac
