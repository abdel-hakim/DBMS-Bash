#!/bin/bash
source ./desgin.sh
db_name=`cat tmp`




select_column () {
   
    #  while [[ true ]]
    #  do
            # read column name
            
            read -p "Enter column Name you want to select  : " col_header
          
            
            if [ $col_header ]
            then
                   check_col_header=`grep -wi $col_header   ./databases/$db_name/$table_name/$table_name.metadata`
                   if [ $check_col_header ]
                   then
                    # retrive number of column data in metadata 
                        retrive_number=`awk -F: '{ print $0}' ./databases/$db_name/$table_name/$table_name.metadata | grep $col_header | awk -F: '{ print $1}'`
                        if [ $retrive_number ]
                        then
                        echo "Enter one value of any of this columns to display data"
                                while [[ true ]]
                                do
                                    read display_data
                                    if [ $display_data ]
                                    then
                                        ##check cat if not find data 
                                        num_of_column=`awk -v col=$col_header -F: '{ for (i = 1; i <= NF; ++i) {  if($i == col){print NR; break}   } }' ./databases/$db_name/$table_name/$table_name.metadata `
                                        clear
                                        echo -e "======================"
                                        echo -e "=\t${CYAN}$col_header ${NC}      ="
                                        echo -e "======================"
                                        cat -e ./databases/$db_name/$table_name/$table_name.data | grep -wi $display_data | cut  -f$num_of_column -d:
                                        echo -e "======================"
                                        echo -e "*==== ${CYAN}Do you want Select another record!${NC} ====*"
                                        select type in 'Yes' 'No'
                                            do
                                                case $REPLY in 
                                                    1) clear 
                                                    select_data
                                                    ;;
                                                    2)clear
                                                    ./tables_options.sh 
                                                    ;; 
                                                    *) echo "$REPLY is not one of the choices";
                                                    ;;
                                                esac
                                            done 
                                    else
                                    echo -e "\n\t${YELLOW}Please enter Valid data${NC} \n"
                                    fi
                                done
                        else
                        echo "*======${YELLOW}please enter Valid Data${NC}=====*"
                        select_column
                        fi

                    else
                         echo -e "*===========${RED} column name not found enter valid data ${NC}===========*\n"
                         select_column
                    fi 
            else
            echo -e "\n*=========${RED}column name not found enter valid data${NC} =========*\n"
            select_column
            fi
    # done

}



#select data function 
select_data () {

read -p "Enter table name to select  : " table_name

#validate table name if exist 
if [  -d ./databases/$db_name/$table_name ]  && [ "$table_name" != '' ]
then    

        ##show all metadata
        ##choic if want  select all data 
     select type in 'Select all table ' 'Select specfic Data'
     do 
        case $REPLY in
           
           1)
            echo -e "===================="
            echo -e "===== Table: ${BLUE}$table_name${NC}\t ==="
            echo -e "===================="
            counter=0
            for arr in `cut -d: -f3 ./databases/$db_name/$table_name/$table_name.metadata`
            do
            ((counter=$counter+1))
            array[$counter]=$arr
            done
            # echo ${array[@]}
            sed -n "s/ /\t/gp" <<<${array[@]}
            echo -e "===================="
            sed -n "s/:/ \t/gp" ./databases/$db_name/$table_name/$table_name.data
            echo -e "==================\n"
            echo "Enter any key to back"
            read xyz
            clear
            break
            ;;   
           2)  select_column
            break 
            ;;
       
    esac
    done


else 
echo -e "*===== ${RED}No Such Table${NC}========* "
echo -e "*=====${RED}Please Try again${NC}======* "
select_data
fi

source ./tables_options.sh
}




# | awk -F: '{print NF}'

# check_exist_column () {
#  	isExist=$(awk -v colName="$1"  'BEGIN{isExist=0} {if($3==colName) {isExist=1}} END{print isExist}' ./databases/$db_name/$table_name/$table_name".metadata");
# 	if [ $isExist -eq 1 ]; then
# 		return 1;
# 	else 
# 		return 0;
#   fi   
# }


# echo "you want to complete"
#  select type in 'Yes' 'No'
#     do
#         
#             1)
#                 update_data
#                 break ;;
#             2)   
#                 break ;; 
#             *) echo "*==== please enter right choice  ====*";
            
#         esac
#     done