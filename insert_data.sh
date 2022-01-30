#!/bin/bash
#######v2
##############################


source ./desgin.sh
db_name="`cat tmp`"

read_meta_data () {
	columnsNumber=$( cat ./databases/$db_name/$table_name/$table_name.metadata | wc -l )  
	#multi value of columns name
	columnsName=($(awk 'BEGIN{FS=":"}{if(NR>0)print $3;}' ./databases/$db_name/$table_name/$table_name.metadata))
	#multi value of datatype 
	columnsTyps=($(awk 'BEGIN{FS=":"}{if(NR>0)print $2;}' ./databases/$db_name/$table_name/$table_name.metadata))
}


check_repeated_pk () {

reapted_value=`cut -f1 -d: ./databases/$db_name/$table_name/$table_name.data | grep -w $1`

if [[ $reapted_value == '' ]]
then
   return 1 ;
else
   return 0 ;
fi

}

checkk () {
	  
		
		case ${columnsTyps[$1]} in
			number) 
				if [[ $data =~ ^[0-9]+[0-9]*$ ]]; then
					return 0;
				else
					echo -e "${YELLOW}*== ${columnsName[i]} only support number ==*${NC}"
					return 1;
				fi
				;;
			string)

				if [[ $data =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]; then
					return 0;
				else
					echo -e "${YELLOW}*== ${columnsName[i]} only support String ==*${NC}"
					return 1;
				fi
		esac

	}

#column name          types
# id    -->0      |    number --> 0
# name  -->1      |    string --> 1
# email -->2      |    string --> 2


read_col_data () {

	#loop in columns number 
	for (( i=0; i<$columnsNumber; i++ ))	
	do

	    #by default first column is PK
		if (( $i==0 )); then
		       
                echo -e "*====Enter  ${columnsName[i]} (PK) using dataType:${columnsTyps[i]} ====*";	
                while [[ true ]]
                do
                    read  data;

					#call function that return 0 = true  or 1 = false

                    if checkk $i; then
                    
                        if check_repeated_pk $data; then
                            echo -e "*==== ${RED}Sorry, this PK is used before ${NC}====*"
                            echo -e "*====${RED} Use another PK ${NC}====*"
                        else
                            #insert here
                            record[$i]=$data
                            break ;
                        fi   
                    fi
                done



#column name          types
# id    -->0      |    number --> 0
# name  -->1      |    string --> 1
# email -->2      |    string --> 2
		else
			echo -e "*====Enter  ${columnsName[i]} using dataType:${columnsTyps[i]} ====*";
			while [[ true ]]
			do
				read data;
				 if checkk $i; then
                 	#insert here
					record[$i]=$data
					break ;				
				fi
			done		
		fi
	done


	echo ${record[*]} >> ./databases/$db_name/$table_name/$table_name."data"
	sed -i "s/ /:/g" ./databases/$db_name/$table_name/$table_name."data"
}






insert () {
echo "*==== Enter Table Name ====*"
read table_name

if [ -d ./databases/$db_name/$table_name ] && [ "$table_name" != '' ]
then
	read_meta_data
   
                	echo "*==== Enter the record data ====*"
                	read_col_data
					clear
					echo -e "\n\n\t${YELLOW}Inserting...${NC}"
					sleep 2
					clear
                	echo -e "\n\t*==== ${GREEN}Record inserted successfully ${NC}====*\n"
                	while [[ true ]]
                	do
                		echo -e "*==== ${CYAN}Do you want insert another record!${NC} ====*"
                		select type in 'Yes' 'No'
                		do
                			case $REPLY in 
                				1) clear
                                    read_col_data;
									clear
									echo -e "\n\n\t${YELLOW}Inserting...${NC}"
									sleep 2
									clear
                					echo -e "\n\t*==== ${GREEN}Record inserted successfully${NC} ====*\n"
                					break ;;
                				2) clear
                                   break 2 ;; 
                				*) echo "*==== Exit ====*";
                					sleep 1;
                					break 2 ;;
                			esac
                		done
                	done	
else
	echo -e "\n\t${RED}*==== This table is not exist! ====*${NC}\n"
	echo -e "\t${YELLOW}press ENTER to back...${NC}"	
	read xyz
	clear
fi
source ./tables_options.sh
}
