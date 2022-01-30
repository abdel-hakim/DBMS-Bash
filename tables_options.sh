#!/bin/bash
source ./create_table.sh
source ./drop_table.sh
source ./list_table.sh
source ./insert_data.sh
source ./select_data.sh
source ./update_data.sh
source ./delete_data.sh
PS3="Enter your choice : "
select choice in "Create Table" "List Tables"  "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table" "back" 
do
case $REPLY in
1)
 clear
 create_table
;;
2)
 clear
 list_table
;;
3)
 clear
 drop_table
;;
4)
 clear 
 insert
;;
5) 
 clear
 select_data
;;
6)
 clear 
 delete_data
;;
7)
update_data
;;
8)
clear
./main.sh
;;
*) echo $REPLY "is not one of the choices."
;;
esac
done
