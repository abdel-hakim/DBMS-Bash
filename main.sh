#!/bin/bash
source ./listdb.sh
source ./createdb.sh
source ./connectdb.sh
source ./dropdb.sh
PS3="Enter a number: "
select choice in "Create Database" "List Databases"  "Connect To Databases" "Drop Database" "Exit"
do
case $REPLY in
1) createdb
;;
2) list_db
;;
3) connect
;;
4) drop_db
;;
5) exit
;;
*) echo $REPLY "is not one of the choices."
;;
esac
done
