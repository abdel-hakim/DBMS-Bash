#!/bin/bash
db_name="`cat tmp`"

drop_table () {
    read -p "Enter Table Name To Drop : " table_name
    if [ -d ./databases/$db_name/$table_name ]
    then
    rm -r ./databases/$db_name/$table_name
    echo "Table Deleted Successfully "
    else 
    echo "Table Does Not Exist "
    drop_table
    fi
}