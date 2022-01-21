#!/bin/bash
### List DataBases ###
function list_db {
echo -e "=================="
echo -e "=   DataBases    ="
echo -e "=================="
    for db in `ls $PWD/"databases"`
    do
    echo $db
    done
echo -e "=================="
source ./main.sh
}
