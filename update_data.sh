#!/bin/bash
db_name=`cat tmp`
update_data () {
read -p "Delete Data From : " table_name
if [  -d ./databases/$db_name/$table_name ]
then
    col=`awk -F: '{if ($4 == "pk") print $3}' ./databases/$db_name/$table_name/$table_name.metadata `
        read -p "Enter Record To Delete Using Your Pk $col : " update
        record=`grep  $update ./databases/$db_name/$table_name/$table_name.data`
        echo $record > tmp
        read -p "Enter Your Old Value : " old
        read -p "Enter Your New Value : " new
        sed -i "s/"$old"/"$new"/" tmp
        newrecord=`cat tmp`
        sed -i "s/"$record"/"$newrecord"/" $PWD/databases/$db_name/$table_name/$table_name.data
        echo $db_name > "tmp"
else 
    echo " No Such Table "
    echo "Please Try again "
fi
}