#! /bin/bash 
# var=$(awk -F: '{print $3}' ./databases/1/omar/omar.metadata) 
# var=$(awk -F: '{print $2}' ./databases/1/omar/omar.metadata)
# echo $var



# read -r m;

# function check_column_name_exist {
# 	isExist=$(awk -v colName="$column_name" -F: 'BEGIN{isExist=0} {if($3==colName) {isExist=1}} END{print isExist}' ./databases/1/omar/omar.metadata);
# 	if [ $isExist -eq 1 ]; then
# 		return 0;
# 	else 
# 		return 1;
#         fi
# }

# read -p "enter :  " column_name
# if check_column_name_exist; then 
#  echo yes
# else
#  echo no 
# fi


# echo “Please type your name, age, and email”

# read -a array name age email

# echo “Your name, age, and email address are: ${array[@]} name age email”
# echo “Your name and age are: ${array[@]:0:1} name age”

# echo “Your email address is: ${array[2]} email”


# echo “Please type your name, age, and email”

# read  mo;
# array[0]="$mo:"
# read  mi;
# array[2]="$mi:"
# read  me;
# array[3]="$me:"
# echo ${array[*]}
# echo ${array[*]} >> ./tmp
# read -r mo;
# array[0]=$mo
# read -r mi;
# array[2]=$mi
# echo ${array[*]} >> ./tmp





#retrive number of column data in metadata 
# retrive_number=`awk -F: '{ print $0}' ./databases/$db_name/$table_name/$table_name.metadata | grep $col_header | awk -F: '{ print $1}'`
# if [ $retrive_number ]
# then



# check_repeated_pk () {
#     echo $1
#  	isExist=$(awk -v colName="$1"  'BEGIN{isExist=0} {if ($1==colName) {isExist=1}} END{print isExist}' ./databases/1/higgy/higgy.data);
# 	if [ $isExist -eq 1 ];
#     then
# 		# return 0;
#         echo "exist"
# 	else 
# 		echo "no"
#   fi   
# }
# i=5
# check_repeated_pk $
# i=5
# x=`cut -f1 -d: ./databases/1/higgy/higgy.data | grep -w $i`
# if [[ $x == '' ]]
# then
# echo "notfind"
# else
# echo "find"
# fi
# col_header="mail"
# display_data="higgy"
# # awk -F: '{ for (i = 1; i <= NF; ++i) {  if($i == "name"){print NR  }   } }' databases/omar/mo/mo.metadata 
# # awk -F: '{ for (i = 1; i <= NF; ++i) {  if($i == "name"){print i  }   } }' databases/omar/mo/mo.metadata
# num_of_column=`awk -v col=$col_header -F: '{ for (i = 1; i <= NF; ++i) {  if($i == col){print NR  }   } }' databases/omar/mo/mo.metadata `
# # echo $num_of_column
# cat databases/omar/mo/mo.data | grep $display_data | cut  -f$num_of_column -d: 














#!/bin/bash
# #######v2
# ##############################
# 

# source ./desgin.sh
# db_name="`cat tmp`"

# read_meta_data () {
# 	columnsNumber=$( cat ./databases/$db_name/$table_name/$table_name.metadata | wc -l )  
# 	#multi value of columns name
# 	columnsName=($(awk 'BEGIN{FS=":"}{if(NR>0)print $3;}' ./databases/$db_name/$table_name/$table_name.metadata))
# 	#multi value of datatype 
# 	columnsTyps=($(awk 'BEGIN{FS=":"}{if(NR>0)print $2;}' ./databases/$db_name/$table_name/$table_name.metadata))
# }


# check_repeated_pk () {

# reapted_value=`cut -f1 -d: ./databases/$db_name/$table_name/$table_name.data | grep -w $1`

# if [[ $reapted_value == '' ]]
# then
#    return 1 ;
# else
#    return 0 ;
# fi

# }

# check_datatype () {
# 	    echo "ana hnaaaa"
		
# 		case ${columnsTyps[$1]} in
# 			number) 
# 				if [[ $data =~ ^[0-9]+[0-9]*$ ]]; then
# 					return 1;
# 				else
# 					echo -e "*== ${columnsName[i]} only support number ==*"
# 					return 0;
# 				fi
# 				;;
# 			string)

# 				if [[ $data =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]; then
# 					return 1;
# 				else
# 					echo -e "*== ${columnsName[i]} only support String ==*"
# 					return 0;
# 				fi
# 		esac

# 	}




# read_col_data () {

# 	#loop in columns number 
# 	for (( i=0; i<$columnsNumber; i++ ))	
# 	do

# 	    #by default first column is PK
# 		if (( $i==0 )); then
		       
#                 echo -e "*====Enter  ${columnsName[i]} (PK) using dataType:${columnsTyps[i]} ====*";	
#                 while [[ true ]]
#                 do
#                     read  data;

# 					#call function that return 0 = true  or 1 = false

#                     if checkk $i; then
                    
#                         if check_repeated_pk $data; then
#                             echo "*==== Sorry, this PK is used before ====*"
#                             echo "*==== Use another PK ====*"
#                         else
#                             #insert here
#                             record[$i]=$data
#                             break ;
#                         fi   
#                     fi
#                 done



# #column name          types
# # id    -->0      |    number --> 0
# # name  -->1      |    string --> 1
# # email -->2      |    string --> 2
# 		else
# 			echo -e "*====Enter  ${columnsName[i]} using dataType:${columnsTyps[i]} ====*";
# 			while [[ true ]]
# 			do
# 				read data;
# 				 if checkk $i; then
#                  	#insert here
# 					record[$i]=$data
# 					break ;				
# 				fi
# 			done		
# 		fi
# 	done


# 	echo ${record[*]} >> ./databases/$db_name/$table_name/$table_name."data"
# 	sed -i "s/ /:/g" ./databases/$db_name/$table_name/$table_name."data"
# }






# insert () {
# echo "*==== Enter Table Name ====*"
# read table_name

# if [ -d ./databases/$db_name/$table_name ] && [ "$table_name" != '' ]
# then
# 	read_meta_data
   
#                 	echo "*==== Enter the record data ====*"
#                 	read_col_data
# 					clear
# 					echo -e "\n\n\t${YELLOW}Inserting...${NC}"
# 					sleep 2
# 					clear
#                 	echo -e "\n\t*==== ${GREEN}Record inserted successfully ${NC}====*\n"
#                 	while [[ true ]]
#                 	do
#                 		echo -e "*==== Do you want insert another record! ====*"
#                 		select type in 'Yes' 'No'
#                 		do
#                 			case $REPLY in 
#                 				1) clear
#                                     read_col_data;
# 									clear
# 									echo -e "\n\n\t${YELLOW}Inserting...${NC}"
# 									sleep 2
# 									clear
#                 					echo -e "\n\t*==== ${GREEN}Record inserted successfully${NC} ====*\n"
#                 					break ;;
#                 				2) 
#                                    break 2 ;; 
#                 				*) echo "*==== Exit ====*";
#                 					sleep 1;
#                 					break 2 ;;
#                 			esac
#                 		done
#                 	done	
# else
# 	echo -e "\n\t${RED}*==== This table is not exist! ====*${NC}\n"
# 	echo -e "\t${YELLOW}press ENTER to back...${NC}"	
# 	read
# 	clear
# fi
# source ./tables_options.sh
# }
##############################################

















#####v1
######################insert 


# source ./desgin.sh
# db_name="`cat tmp`"

# read_meta_data () {
# 	columnsNumber=$( cat ./databases/$db_name/$table_name/$table_name.metadata | wc -l )  
# 	#multi value of columns name
# 	columnsName=($(awk 'BEGIN{FS=":"}{if(NR>0)print $3;}' ./databases/$db_name/$table_name/$table_name.metadata))
# 	#multi value of datatype 
# 	columnsTyps=($(awk 'BEGIN{FS=":"}{if(NR>0)print $2;}' ./databases/$db_name/$table_name/$table_name.metadata))
# }


# check_repeated_pk () {

# reapted_value=`cut -f1 -d: ./databases/$db_name/$table_name/$table_name.data | grep -w $1`

# if [[ $reapted_value == '' ]]
# then
#    return 1 ;
# else
#    return 0 ;
# fi

# }

# check_datatype () {
	
# 		case ${columnsTyps[$i]} in
# 			number) 
# 				if [[ $data =~ ^[0-9]+[0-9]*$ ]]; then
# 					return 0;
# 				else
# 					echo -e "*== ${columnsName[i]} only support number ==*"
# 					return 1;
# 				fi
# 				;;
# 			string)

# 				if [[ $data =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]; then
# 					return 0;
# 				else
# 					echo -e "*== ${columnsName[i]} only support String ==*"
# 					return 1;
# 				fi
# 		esac

# 	}









# read_col_data () {

# 	#loop in columns number 
# 	for (( i=0; i<$columnsNumber; i++ ))	
# 	do

# 	    #by default first column is PK
# 		if (( $i==0 )); then
		       
#                 echo -e "*====Enter  ${columnsName[i]} (PK) using dataType:${columnsTyps[i]} ====*";	
#                 while [[ true ]]
#                 do
#                     read  data;

# 					#call function that return 0 = true  or 1 = false

#                     if check_datatype $i; then
                    
#                         if check_repeated_pk $data; then
#                             echo "*==== Sorry, this PK is used before ====*"
#                             echo "*==== Use another PK ====*"
#                         else
#                             #insert here
#                             record[$i]=$data
#                             break ;
#                         fi   
#                     fi
#                 done



# #column name          types
# # id    -->0      |    number --> 0
# # name  -->1      |    string --> 1
# # email -->2      |    string --> 2
# 		else
# 			echo -e "*====Enter  ${columnsName[i]} using dataType:${columnsTyps[i]} ====*";
# 			while [[ true ]]
# 			do
# 				read data;
# 				 if check_datatype $i; then
#                  	#insert here
# 					record[$i]=$data
# 					break ;				
# 				fi
# 			done		
# 		fi
# 	done


# 	echo ${record[*]} >> ./databases/$db_name/$table_name/$table_name."data"
# 	sed -i "s/ /:/g" ./databases/$db_name/$table_name/$table_name."data"
# }


# insert () {
# clear
# echo "*==== Enter Table Name ====*"
# read table_name

# if [ -d ./databases/$db_name/$table_name ]
# then
# 	read_meta_data
   
#                 	echo "*==== Enter the record date ====*"
#                 	read_col_data
#                 	echo -e "*==== Record inserted successfully ====*"
#                 	while [[ true ]]
#                 	do
#                 		echo -e "*==== Do you want insert another record! ====*"
#                 		select type in 'Yes' 'No'
#                 		do
#                 			case $REPLY in 
#                 				1) clear
#                                     read_col_data;
#                 					echo -e "*==== Record inserted successfully ====*"
#                 					break ;;
#                 				2) 
#                                    break 2 ;; 
#                 				*) echo "*==== Exit ====*";
#                 					sleep 1;
#                 					break 2 ;;
#                 			esac
#                 		done
#                 	done	
# else
# 	echo -e "${RED}*==== This table is not exist! ====*${NC}"
# 	echo "For help use DISPLAY TABLES option To Know Your Tables And Come Again ✌"
# 	echo "press ENTER to back..."	
# 	read
# fi
# source ./tables_options.sh
# }





#####################################

































#############stableY
#!/bin/bash

# source ./desgin.sh
# db_name="`cat tmp`"

# read_meta_data () {
# 	columnsNumber=$( cat ./databases/$db_name/$table_name/$table_name.metadata | wc -l )  
# 	#multi value of columns name
# 	columnsName=($(awk 'BEGIN{FS=":"}{if(NR>0)print $3;}' ./databases/$db_name/$table_name/$table_name.metadata))
# 	#multi value of datatype 
# 	columnsTyps=($(awk 'BEGIN{FS=":"}{if(NR>0)print $2;}' ./databases/$db_name/$table_name/$table_name.metadata))
# }


# check_repeated_pk () {

# reapted_value=`cut -f1 -d: ./databases/$db_name/$table_name/$table_name.data | grep -w $1`

# if [[ $reapted_value == '' ]]
# then
#    return 1 ;
# else
#    return 0 ;
# fi

# }

# checkk () {
	
# 		case ${columnsTyps[$i]} in
# 			number) 
# 				if [[ $data =~ ^[0-9]+[0-9]*$ ]]; then
# 					return 0;
# 				else
# 					echo -e "*== ${columnsName[i]} only support number ==*"
# 					return 1;
# 				fi
# 				;;
# 			string)

# 				if [[ $data =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]; then
# 					return 0;
# 				else
# 					echo -e "*== ${columnsName[i]} only support String ==*"
# 					return 1;
# 				fi
# 		esac

# 	}








# read_col_data () {

# 	#loop in columns number 
# 	for (( i=0; i<$columnsNumber; i++ ))	
# 	do

# 	    #by default first column is PK
# 		if (( $i==0 )); then
		       
#                 echo -e "*====Enter  ${columnsName[i]} (PK) using dataType:${columnsTyps[i]} ====*";	
#                 while [[ true ]]
#                 do
#                     read  data;

# 					#call function that return 0 = true  or 1 = false

#                     if checkk $i; then
                    
#                         if check_repeated_pk $data; then
#                             echo "*==== Sorry, this PK is used before ====*"
#                             echo "*==== Use another PK ====*"
#                         else
#                             #insert here
#                             record[$i]=$data
#                             break ;
#                         fi   
#                     fi
#                 done



# #column name          types
# # id    -->0      |    number --> 0
# # name  -->1      |    string --> 1
# # email -->2      |    string --> 2
# 		else
# 			echo -e "*====Enter  ${columnsName[i]} using dataType:${columnsTyps[i]} ====*";
# 			while [[ true ]]
# 			do
# 				read data;
# 				 if checkk $i; then
#                  	#insert here
# 					record[$i]=$data
# 					break ;				
# 				fi
# 			done		
# 		fi
# 	done


# 	echo ${record[*]} >> ./databases/$db_name/$table_name/$table_name."data"
# 	sed -i "s/ /:/g" ./databases/$db_name/$table_name/$table_name."data"
# }


# insert () {
# clear
# echo "*==== Enter Table Name ====*"
# read table_name

# if [ -d ./databases/$db_name/$table_name ]
# then
# 	read_meta_data
   
#                 	echo "*==== Enter the record date ====*"
#                 	read_col_data
#                 	echo -e "*==== Record inserted successfully ====*"
#                 	while [[ true ]]
#                 	do
#                 		echo -e "*==== Do you want insert another record! ====*"
#                 		select type in 'Yes' 'No'
#                 		do
#                 			case $REPLY in 
#                 				1) clear
#                                     read_col_data;
#                 					echo -e "*==== Record inserted successfully ====*"
#                 					break ;;
#                 				2) 
#                                    break 2 ;; 
#                 				*) echo "*==== Exit ====*";
#                 					sleep 1;
#                 					break 2 ;;
#                 			esac
#                 		done
#                 	done	
# else
# 	echo -e "${RED}*==== This table is not exist! ====*${NC}"
# 	echo "For help use DISPLAY TABLES option To Know Your Tables And Come Again ✌"
# 	echo "press ENTER to back..."	
# 	read
# fi
# source ./tables_options.sh
# }
# all_data () {
val=3
# for col in `awk -F: '{ for (i = 1; i <= NF; ++i) { printf $ }}' ./databases/omar/omar/omar.data`
# do 
#     for n in $(seq 1 $val)
#     do
#     printf $col" "
#     done
#     echo -e "\n"
# done
# col_name=2 
# old=higgy
# new=omar   
# awk -v col=$col_name -F: '{  {  if($col == $old){ sed -i "s/"$old"/"$new"/"   }   } }' tmp
# cut -d: -f3 ./databases/omar/omar/omar.metadata | sed  's/'\n'/\t/g'
# sed -n "s/:/ \t/gp" ./databases/omar/omar/omar.data
# for col in `awk -F: '{print $3}' ./databases/omar/omar/omar.metadata`
# do
# sed -n "s/\n /\t/gp" $col
# echo -e "\t$col"
# done
echo -e "===================="
echo -e "===== table name ==="
echo -e "===================="

counter=0
for arr in `cut -d: -f3 ./databases/omar/omar/omar.metadata`
do
((counter=$counter+1))
array[$counter]=$arr
done
# echo ${array[@]}
sed -n "s/ /\t/gp" <<<${array[@]}
echo -e "===================="
sed -n "s/:/ \t/gp" ./databases/omar/omar/omar.data
