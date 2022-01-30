#!/bin/bash
### Drop DataBases ###
source ./desgin.sh
function drop_db {
while [[ true ]]
do
    read -p "Enter DataBase Name you need to Delete : " db_Name
    if [ "$db_Name" == '' ]
        then
            echo -e "\n\t${RED}Please enter valid data${NC}\n"
            break
        elif [ -d ./databases/$db_Name ]
        then
            rm -r ./databases/$db_Name/
            echo -e "\n\n\t${YELLOW}Deleting...${NC}\n"
            sleep 2
            clear
            echo -e "\n\t${GREEN}DataBase Deleted Successfully${NC}\n "
            sleep 2
            clear
            break
        else
            echo -e "\n\t${RED}No Such Name For DataBase ${NC}"
            echo -e "\t${RED}Please enter The Correct Name  ${NC}\n"
            sleep 1
        drop_db
        fi
done
echo -e "*==== ${CYAN}Do you want Delete another Database !${NC} ====*"
select type in 'Yes' 'No'
do
case $REPLY in 
    1) drop_db
    ;;
    2) clear 
    ./main.sh
    ;;
    *) echo " $REPLY is Not One Of the choices"  
    ;;
esac
done
}