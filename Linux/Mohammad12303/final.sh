printf "Type         Quantity        Unit Price    Sub Totoal    \n"
echo  "---------------------------------------------------"


unitPrice(){

f1=$1
echo $( grep "$f1" MenuFileContents.txt | tr -s ' ' ' ' | cut -d' ' -f2)



}


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
printf "$i   " #printing names
price=$(unitPrice $i)
elif [ $counter -eq 2 ]
then
f2=$i
printf "$i\t\t" #printing quantity
printf "\t$price\t" #printing unit price
printf "\t$(($f2 * $price))        " #print total
printf "\n"
counter=0 # counter shoud be 1 or 2 only
sum=$((sum + $(($f2 * $price)) ))


fi





done
echo  "---------------------------------------------------"

printf "total price : $sum"

