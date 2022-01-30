#!/bin/bash
source ./listdb.sh
source ./createdb.sh
source ./connectdb.sh
source ./dropdb.sh
source ./desgin.sh
##enhance UI
PS3="Enter a number: "
echo " "
echo -e "\t*===================================*"
echo -e "\t*===========*\t${BLUE}MO${NC} DBMS\t*===========*"
echo -e "\t*===================================*"
echo " "
select choice in "Create Database" "List Databases"  "Connect To Databases" "Drop Database"
do
case $REPLY in
1) createdb
;;
2) list_db
;;
3) clear
   connect
;;
4) drop_db
;;
*) echo $REPLY "is not one of the choices."
;;
esac
done
