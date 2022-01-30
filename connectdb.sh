#!/bin/bash
source ./desgin.sh
connect () {
    read -p "Please Enter DB Name You Need To Connect : " db_name
        if [ -d ./databases/$db_name ] && [ "$db_name" != '' ]
        then 
        clear
            echo -e "\n\n\t${YELLOW}Connecting .... ${NC}\n"
            sleep 2
            clear
            echo -e "\n\t*========= ${GREEN}Connected To $db_name${NC}  ============*\n"
            echo $db_name > "./tmp"
            ./tables_options.sh
        else 
            echo -e "\n\t${RED}No Such DataBase"
            echo -e "\tTry Again Please ${NC}\n"
            connect
        fi
}



