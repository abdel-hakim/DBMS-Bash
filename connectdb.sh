#!/bin/bash

connect () {
    read -p "Please Enter DB Name You Need To Connect : " db_name
        if [ -d ./databases/$db_name ]
        then 
            echo "Connected To $db_name "
            echo $db_name > "./tmp"
            ./tables_options.sh
        else 
            echo "No Such DataBase"
            echo "Try Again Please "
            connect
        fi
}



