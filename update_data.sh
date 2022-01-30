#!/bin/bash
db_name=`cat tmp`
source ./desgin.sh


read_meta_data () {
	columnsNumber=$( cat ./databases/$db_name/$table_name/$table_name.metadata | wc -l )  
	#multi value of columns name
	columnsName=($(awk 'BEGIN{FS=":"}{if(NR>0)print $3;}' ./databases/$db_name/$table_name/$table_name.metadata))
	#multi value of datatype 
	columnsTyps=($(awk 'BEGIN{FS=":"}{if(NR>0)print $2;}' ./databases/$db_name/$table_name/$table_name.metadata))
}




check_datatype () {
   
    case $2 in
        number) 
            if [[ $1 =~ ^[0-9]+[0-9]*$ ]]; then
                return 0;
            else
                echo -e "*==  ${RED}only support number${NC} ==*"
                return 1;
            fi
            ;;
        string)

            if [[ $1 =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]; then
                return 0;
            else
                echo -e "*== ${RED}only support String${NC} ==*"
                return 1;
            fi
    esac

}
	


update_data () {
read -p "Enter table name you want to update : " table_name

if [  -d ./databases/$db_name/$table_name ] && [ "$table_name" != '' ]
then
col=`awk  -F: '{if ($4 == "pk") print $3}' ./databases/$db_name/$table_name/$table_name.metadata `
    echo -e "\n\t${YELLOW}the Update based on PK only${NC}\n "
    read -p "Enter Record To Update Using Your Pk $col : " update #pk number 
    # echo $record > tmp

if [ $update ]
then 
        if [ `awk -F: '{ print $1 }' ./databases/$db_name/$table_name/$table_name".data" | grep -w $update` ]
        then
                record=`grep -w $update ./databases/$db_name/$table_name/$table_name.data` #grep line that contain id 
                echo $record > tmp
                while [[ true ]] 
                do
                
            read -p "enter column name you want update  : " col_name
            
        if [ $col_name ]
        then    
         
           if [ `grep -w $col_name ./databases/$db_name/$table_name/$table_name.metadata` ]
           then
       
           
                if [ "$col_name" != "$col" ] 
                then
                    col_name_type=`grep -wi $col_name  ./databases/$db_name/$table_name/$table_name.metadata | cut -f2 -d:`
                    
                    while [[ true ]]
                    do
                    num_of_column=`awk -v col=$col_name -F: '{ for (i = 1; i <= NF; ++i) {  if($i == col){print NR; break}   } }' ./databases/$db_name/$table_name/$table_name.metadata `
                    old=`cut  -f$num_of_column -d: tmp`
                    
                    # read -p "Enter Your Old Value : " old 
                    #     if [ `cat tmp | grep -w $old` ] && [ "$old" != '' ]
                    #     then  
                            read -p "Enter Your New Value : " new

                      if [ $new ]
                      then      
                            #enhance not take the old value 
                            if check_datatype $new $col_name_type; then 
                                    sed -i "s/"$old"/"$new"/" tmp
                                    newrecord=`cat tmp`
                                    sed -i "s/"$record"/"$newrecord"/" $PWD/databases/$db_name/$table_name/$table_name.data
                                    clear
                                    echo -e "\n\n\t${YELLOW} Updating...${NC}"
                                    sleep 2
                                    clear
                                    echo -e "\n\t*===== ${GREEN}Record Updated successfully${NC} =======*\n"
                                    echo -e "*======${CYAN} Do you want to do another update ${NC}=========*"
                                    select type in 'Yes' 'No'
                                        do
                                            case $REPLY in 
                                                1)
                                                    update_data
                                                    break 2 ;;
                                                2) 
                                                    break 3 ;; 
                                                *) echo "*==== please enter right choice  ====*";
                                                
                                            esac
                                        done
                                else
                                continue
                                fi
                        else 
                        echo -e "\n\t${YELLOW}enter valid data${NC}\n" 
                        fi
                    done    
                else 
                echo -e "\n\t${RED}$col cannot be change bacause it is a PK${NC}\n"
                fi 
        else 
         echo -e "\n\t${RED}column name not found${NC}\n"
         break
        fi
        else 
         echo -e "\n\t${RED}column name not found${NC}"
         break
        fi
    done
    
else
echo -e "\n\t${RED}Not found PK${NC}\n"

fi
else
echo -e "\n\t${RED}Not found PK${NC}\n"
fi
else 
    echo -e "\n\t${RED}No Such Table "
    echo -e "\tPlease Try again\n${NC}"
    echo -e "*======${CYAN} Do you want to do another update ${NC}=========*"
    select type in 'Yes' 'No'
    do
        case $REPLY in 
            1)
                update_data
                break ;;
            2)   
                break ;; 
            *) echo "*==== please enter right choice  ====*";
            
        esac
    done
fi
echo -e "*==== ${CYAN}Do you want update another record!${NC} ====*"
select type in 'Yes' 'No'
do
    case $REPLY in 
        1) clear 
        update_data
        ;;
        2) 
            break ;; 
        *) echo "$REPLY is not one of the choices";
        ;;
    esac
done
clear
echo $db_name > "tmp"
./tables_options.sh
}