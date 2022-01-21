#!/bin/bash
db_name="`cat tmp`"
function list_table {
    for tb in `ls ./databases/$db_name`
    do
    echo $tb
    done
source ./tables_options.sh
}
