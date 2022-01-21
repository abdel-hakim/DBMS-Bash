#!/bin/bash
db_name=`cat tmp`
delete_data (){
read -p "Delete Data From : " table_name
if [  -d ./databases/$db_name/$table_name ]
then
    col=`awk -F: '{if ($4 == "pk") print $3}' ./databases/$db_name/$table_name/$table_name.metadata `
        read -p "Enter Record To Delete Using Your Pk $col : " deleted
        grep -v $deleted ./databases/$db_name/$table_name/$table_name.data > tmp && cp tmp ./databases/$db_name/$table_name/$table_name.data
        echo $db_name > "tmp"
        echo "record Delete Sucssefully "
else 
    echo " No Such Table "
    echo "Please Try again "
fi
}