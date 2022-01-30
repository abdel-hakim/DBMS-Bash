#!/bin/bash

createdb(){
    if [ ! -d ./databases/ ]
    then
    mkdir ./databases
    fi
    echo -e "=========================================="
    echo -e "#           ${BLUE}create Database${NC}              #"
    echo -e "=========================================="
while [[ true ]]
do
    read -p "Enter database name : " dbName
        if [ "$dbName" == '' ]
        then
            echo -e "*======${RED}Please Enter Valid Data${NC}======*"
        
        elif [ -d ./databases/$dbName ]
        then
            echo -e "*======${RED}Table already Exist${NC}======*"
        else
            mkdir ./databases/$dbName
            echo ""
            echo  -e "\t${GREEN}Database  $dbName succesfully created${NC}"
            echo ""
            sleep 1
            clear
            break
        fi
done
echo -e "*=========${CYAN}Do You Need To Create More DataBases${NC}==========*"

     select type in 'Yes' 'No'
     do 
        case $REPLY in
           
           1) createdb
            ;;   
            
           2) ./main.sh
            ;;
       
    esac
    done
}

