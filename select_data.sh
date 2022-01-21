#!/bin/bash
db_name=`cat tmp`
select_data () {
read -p "Select Data From : " table_name
if [  -d ./databases/$db_name/$table_name ]
then
        read -p "Where column Name Is : " col_header
        if [ $col_header ]
        then
            retrive_number=`awk -F: '{ print $0}' ./databases/$db_name/$table_name/$table_name.metadata | grep $col_header | awk -F: '{ print $1}'`
            if [ $retrive_number ]
            then
            read -p "And Data Eqaul : " display_data
                # cut -d " " -f "$retrive_number" ./databases/$db_name/$table_name/$table_name.data | grep $display_data
                cat ./databases/$db_name/$table_name/$table_name.data | grep $display_data
            else
            echo "please enter Valid Data"
            select_data
            
            fi
        else
        echo "please enter Valid Data"
        select_data
        fi
else 
echo " No Such Table "
echo "Please Try again "
fi
}