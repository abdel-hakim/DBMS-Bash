#!/bin/bash
db_name="`cat tmp`"
source ./desgin.sh
function list_table {
    echo -e "=================="
    echo -e "=   ${BLUE}Tables ${NC}      ="
    echo -e "=================="
    for tb in `ls ./databases/$db_name`
    do
    echo -e "=${GREEN}\t$tb${NC}\t ="
    done
    echo -e "=================="
echo "Enter any key to back"
read xyz
source ./tables_options.sh
}
