#!/bin/bash
source ./create_table.sh
source ./drop_table.sh
source ./list_table.sh
source ./insert_data.sh
source ./select_data.sh
source ./update_data.sh
PS3="Enter your choice : "
select choice in "Create Table" "List Tables"  "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table"
do
case $REPLY in
1)
 clear
 create_table
;;
2) list_table
;;
3) drop_table
;;
4) insert
;;
5) select_data
;;
6) delete_data
;;
7) update_data
;;

*) echo $REPLY "is not one of the choices."
;;
esac
done
