echo "" > reciept.txt
printf "Type         Quantity        Unit Price    Sub Totoal    "
echo  "---------------------------------------------------"

orderFile=$(cat OrderFileContents.txt)

temp=0
counter=0
f1=""
f2=0
sum=0
for i in $orderFile
do
counter=$((counter+1))


if [ $counter -eq 1 ]
then
f1=$i
price=$( grep "$f1" MenuFileContents.txt | tr -s ' ' ' ' | cut -d' ' -f2)
printf "$i         "

elif [ $counter -eq 2 ]
then
f2=$i
printf "$i               "
printf "$price        "
printf "$(($f2 * $price))       "
printf "\n"
counter=0
sum=$((sum + $(($f2 * $price)) ))


fi





done
echo  "---------------------------------------------------"

printf "total price : $sum"

