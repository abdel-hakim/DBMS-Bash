#!/bin/bash
db_name=`cat tmp`

check_repeated_pk () {

reapted_value=`cut -f1 -d: ./databases/$db_name/$table_name/$table_name.data | grep -w $1`

if [[ $reapted_value == '' ]]
then
   return 1 ;
else
   return 0 ;
fi

}




delete_data (){
read -p "Delete Data From : " table_name
if [ $table_name ]
then
if [  -d ./databases/$db_name/$table_name ]
then
    #enhance to delete any thing not only id
    col=`awk -F: '{if ($4 == "pk") print $3}' ./databases/$db_name/$table_name/$table_name.metadata`
    while [[ true ]]
    do
        read -p "Enter Record To Delete Using Your Pk $col : " deleted
        if [ $deleted ]
        then 
            if check_repeated_pk $deleted; then
                sed -i  '/^'$deleted'/d' ./databases/$db_name/$table_name/$table_name.data
                clear
                echo -e "\n\n\t${YELLOW}Deleting...${NC}"
                sleep 2
                clear
                echo -e "\n\t${GREEN}Record Delete Sucssefully${NC}\n" 
                break 
            else
            echo -e "\n\t${RED}PK not found${NC}"
            break
            fi 
            
        else
        echo -e "\n\t${YELLOW}enter valid data${NC}"
        continue
        fi
    done
else 
    echo -e "\n\t${RED}No Such Table${NC}"
    echo -e "\n\t${RED}Please Try again${NC}"
fi
else
echo -e "\n\t${RED}enter valid data${NC}"
fi

echo -e "*==== ${CYAN}Do you want delte another record!${NC} ====*"
select type in 'Yes' 'No'
do
    case $REPLY in 
        1) clear 
        delete_data
        ;;
        2) 
            break ;; 
        *) echo "$REPLY is not one of the choices";
        ;;
    esac
done
clear
./tables_options.sh
}
