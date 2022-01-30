#!/bin/bash
### List DataBases ###
function list_db {
echo -e "=================="
echo -e "=   ${BLUE}DataBases ${NC}   ="
echo -e "=================="
    for db in `ls $PWD/"databases"`
    do
    echo -e "\t$db"
    done
echo -e "=================="
echo "Enter any key to back"
read xyz
source ./main.sh
}
