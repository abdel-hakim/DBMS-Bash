#!/bin/bash
### Drop DataBases ###
function drop_db {
    read -p "Enter DataBase Name you need to Delete : " db_Name
if [ -d ./databases/$db_Name ]
    then
        rm -r /databases/$db_Name
        echo "DataBase Deleted Successfully "
    else
        echo "No Such Name For DataBase !!! "
        echo "Please enter The Correct Name !!! "
    drop_db
    fi
}