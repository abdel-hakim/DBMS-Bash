#!/bin/bash
db_name="`cat tmp`"
source ./desgin.sh
drop_table () {
while [[ true ]]
do
    read -p "Enter Table Name To Drop : " table_name
    if [ "$table_name" == '' ]
    then
    echo -e "\n\t${RED}Please Enter Valid Data${NC}\n"
    elif [ -d ./databases/$db_name/$table_name ]
    then
    rm -r ./databases/$db_name/$table_name/*
    rmdir ./databases/$db_name/$table_name
    clear
    echo -e "\n\n\t${YELLOW}Deleting ... ${NC}"
    sleep 2
    clear
    echo -e "\n\t${GREEN}Table Deleted Successfully${NC}\n"
    break
    else 
    echo -e "\n\t${RED}Table Does Not Exist${NC}\n"
    drop_table
    fi
done
./tables_options.sh
}