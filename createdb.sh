#!/bin/bash

createdb(){
    if [ ! -d ./databases/ ]
    then
    mkdir ./databases
    fi
    RED='\033[0;31m'
    NC='\033[0m'
    echo -e "=========================================="
    echo -e "#           ${RED}create Database${NC}              #"
    echo -e "=========================================="
    read -p "Enter database name : " dbName

    if [ -d ./databases/$dbName ]
    then
        echo -e " ${RED}XXXXX--${NC}  database already exist ${RED}--XXXXX${NC}"
    else
        mkdir ./databases/$dbName
        echo  -e "Database  $dbName succesfully created"
    fi

source ./main.sh
}

