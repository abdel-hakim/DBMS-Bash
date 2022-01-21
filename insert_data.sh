#!/bin/bash
db_name="`cat tmp`"

read_meta_data () {
	columnsNumber=$( cat ./databases/$db_name/$table_name/$table_name.metadata | wc -l )  
	columnsName=($(awk 'BEGIN{FS=":"}{if(NR>0)print $3;}' ./databases/$db_name/$table_name/$table_name.metadata))
	columnsTyps=($(awk 'BEGIN{FS=":"}{if(NR>0)print $2;}' ./databases/$db_name/$table_name/$table_name.metadata))
}

check_repeated_pk () {
 	isExist=$(awk -v colName="$1"  'BEGIN{isExist=0} {if($1==colName) {isExist=1}} END{print isExist}' ./databases/$db_name/$table_name/$table_name".data");
	if [ $isExist -eq 1 ]; then
		return 0;
	else 
		return 1;
  fi   
}

check_datatype () {
   
    case ${columnsTyps[$i]} in
        number) 
            if [[ $data =~ ^[0-9]+[0-9]*$ ]]; then
                return 0;
            else
                echo -e "*== ${columnsName[i]} only support number ==*"
                return 1;
            fi
            ;;
        string)

            if [[ $data =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]; then
                return 0;
            else
                echo -e "*== ${columnsName[i]} only support String ==*"
                return 1;
            fi
    esac

}









read_col_data () {
	for (( i=0; i<$columnsNumber; i++ ))	
	do
		if (( $i==0 )); then
                echo -e "*==== ${columnsName[i]} using dataType:${columnsTyps[i]} ====*";	
                while [[ true ]]
                do
                    read -a data;
                    if check_datatype $i; then
                    
                        if check_repeated_pk $data; then
                            echo "*==== Sorry, this PK is used before ====*"
                            echo "*==== Use another PK ====*"
                        else
                            #insert here
                            record[$i]=$data
                            break ;
                        fi   
                    fi
                done
		else
			echo -e "*==== ${columnsName[i]} using dataType:${columnsTyps[i]} ====*";
			while [[ true ]]
			do
				read -a data;
				 if check_datatype $i; then
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
clear
echo "*==== Enter Table Name ====*"
read table_name

if [ -d ./databases/$db_name/$table_name ]
then
	read_meta_data
   
                	echo "*==== Enter the record date ====*"
                	read_col_data
                	echo -e "*==== Record inserted successfully ====*"
                	while [[ true ]]
                	do
                		echo -e "*==== Do you want insert another record! ====*"
                		select type in 'Yes' 'No'
                		do
                			case $REPLY in 
                				1) clear
                                    read_col_data;
                					echo -e "*==== Record inserted successfully ====*"
                					break ;;
                				2) 
                                   break 2 ;; 
                				*) echo "*==== Exit ====*";
                					sleep 1;
                					break 2 ;;
                			esac
                		done
                	done	
else
	echo -e "${RED}*==== This table is not exist! ====*${NC}"
	echo "For help use DISPLAY TABLES option To Know Your Tables And Come Again ✌"
	echo "press ENTER to back..."	
	read
fi
source ./tables_options.sh
}