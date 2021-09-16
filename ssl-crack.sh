#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

banner() {
    clear
    echo -e "${BLUE}"
    echo "   //===================================================================="
    echo "  //                                                                   ||"
    echo -e " //${PURPLE}                   ##                                        ##     ${BLUE}||"
    echo -e "||${PURPLE}                    ##                                        ##     ${BLUE}||"
    echo -e "||${PURPLE}                    ##                                        ##     ${BLUE}||"
    echo -e "||${PURPLE} ## ####.  .####.## #####  ##.#### ##.   ## ##.   ## .####.## #####  ${BLUE}||"
    echo -e "||${PURPLE} ###  ###  ##'  '## ##     ###      ##. ##   ##. ##  ##'  '## ##     ${BLUE}||"
    echo -e "||${PURPLE} ##    ##  ##.  .## ##.    ##        ####     ####   ##.  .## ##.    ${BLUE}||"
    echo -e "||${PURPLE} ##    ##  '####'## '##### ##         ##       ##    '####'## '##### ${BLUE}||"
    echo -e "||${PURPLE}                                     ##                              ${BLUE}||"
    echo -e "||${PURPLE}                                    ##                              ${BLUE}//"
    echo -e "||                                     ${GREEN}https://github.com/angeling11 ${BLUE}//"
    echo "||==================================================================//"
    echo "||"
    echo -e "||${BLUE}=> ${NC}Crack SSL Private Key Encryption${BLUE}"
    echo "||  ---------------------------------"
    echo -e "${NC}"
}

exists() {
if [[ ! -f $1 ]]; then
    echo "$1: No such file"
    exit
fi
}

if [[ -z $1 || -z $2 || -z $3 ]]; then
    echo "Usage:"
    echo "    ./ssl-crack.sh key in_file wordlist [out_file]"
else
    exists $1
    exists $2
    exists $3
    
    banner
    
    echo -e "${YELLOW}Cracking:${NC}"
    
    while IFS= read -r line
    do
        echo -ne "${RED}[-]$line\033[0K\r"
        if [[ $(echo $line | openssl rsautl -decrypt -inkey $1 -in $2 -passin fd:0 2>&1 | grep -c ":error:") -eq 0 ]]; then
            echo -e "\n\n${NC}Pass: ${BLUE}$line"
            if [[ -z $4 ]]; then
                echo -e "${NC}Text:${GREEN}"
                echo $line | openssl rsautl -decrypt -inkey $1 -in $2 -passin fd:0
            else
                echo $line | openssl rsautl -decrypt -inkey $1 -in $2 -passin fd:0 > $4
                echo -e "${GREEN}Successfully exported!"
            fi
            exit 0
        fi
    done < $3
    echo -e "${RED}Password not found. Try with another wordlist."
fi
