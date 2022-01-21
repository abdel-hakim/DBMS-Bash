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

# read -r mo;
# array[0]=$mo
# read -r mi;
# array[2]=$mi
# echo ${array}
# echo ${array[*]} >> ./tmp
# read -r mo;
# array[0]=$mo
# read -r mi;
# array[2]=$mi
# echo ${array[*]} >> ./tmp








