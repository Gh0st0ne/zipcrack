#!/bin/bash
NC='\033[0m'
RED='\033[1;38;5;196m'
GREEN='\033[1;38;5;040m'
ORANGE='\033[1;38;5;202m'
BLUE='\033[1;38;5;012m'
BLUE2='\033[1;38;5;032m'
PINK='\033[1;38;5;013m'
GRAY='\033[1;38;5;004m'
NEW='\033[1;38;5;154m'
YELLOW='\033[1;38;5;214m'
CG='\033[1;38;5;087m'
CP='\033[1;38;5;221m'
CPO='\033[1;38;5;205m'
CN='\033[1;38;5;247m'
CNC='\033[1;38;5;051m'
#Coded By Machine404! Don't copy this code without giving me credit~
#https://instagram.com/invisibleclay100
#https://twitter.com/whoami4041
#https://www.youtube.com/channel/UCC_aPnmV_zGfdwktCFE9cPQ
function banner(){
echo -e ${CP}"    __________ ____        ____ ____      _    ____ _  _______ ______       #"
echo -e ${CP}"   / /__  /_ _|  _ \      / ___|  _ \    / \  / ___| |/ / ____|  _ \ \      #"
echo -e ${CP}"  | |  / / | || |_) |____| |   | |_) |  / _ \| |   | ' /|  _| | |_) | |     #"
echo -e ${CP}" < <  / /_ | ||  __/_____| |___|  _ <  / ___ \ |___| . \| |___|  _ < > >    #"
echo -e ${CP}"  | |/____|___|_|         \____|_| \_\/_/   \_\____|_|\_\_____|_| \_\ |     #"
echo -e ${CP}"   \_\                                                             /_/      #"
echo -e ${CNC}"         An Advanced Tool To Crack Any Password Protected ZIP File          #"
echo -e ${YELLOW}"                         Coded By: Machine404                               #"
echo -e ${BLUE2}"          {Exposing Other Secret Is Not A Good Idea But U Can Do It}        #"
echo -e ${CP}"          Follow Me On:  ${CPO}Instagram: invisibleclay100                        #"
echo -e ${CP}"                         ${PINK}Twitter:   whoami4041                              #"
echo -e ${CN}"                         ${CG}Facebook:  pakhack01                               #"
echo -e ${RED}"#############################################################################\n "
}

d=$(date +"%b-%d-%y %H:%M")

if [[ $EUID -ne 0 ]]; then
   echo -e ${RED}"\n[ X ] This script must be run as root :) \n" 1>&2
   echo -e ${RED}"[ ✔ ] Usage: sudo ./zcrack.sh"
   exit 1
fi
function depend(){
echo -e ${PINK}
cat /etc/issue.net


echo "Checking dependencies configuration " 
if nc -zw1 google.com 443; then
  echo -e ${GREEN} "\n[ ✔ ] Internet.............${GREEN}[ working ]"
  else
  
  echo ${RED}"No Internet Connection"
  exit 1
fi
sleep 1
which zip2john > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] zip2john.............${GREEN}[ found ]"
else
echo -e $red "[ X ] zip2john  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing zip2john "
sudo apt-get install zip2john  > /dev/null 2>&1
echo -e ${BLUE} "[ ✔ ] Done installing ...."
fi
sleep 1
which john > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] john.............${GREEN}[ found ]"
else
echo -e $red "[ X ] john  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing john "
sudo apt install john  > /dev/null 2>&1

echo -e ${BLUE} "[ ✔ ] Done installing ...."
which john > /dev/null 2>&1

fi
sleep 1
which fcrackzip > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] fcrackzip.............${GREEN}[ found ]"
else
echo -e $red "[ X ] fcrackzip  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing fcrackzip "
sudo apt-get install fcrackzip  > /dev/null 2>&1
echo -e ${BLUE} "[ ✔ ] Done installing ...."
fi
sleep 1
which hashcat > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] hashcat.............${GREEN}[ found ]"
else
echo -e $red "[ X ] hashcat  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing hashcat "
sudo apt install hashcat  > /dev/null 2>&1

echo -e ${BLUE} "[ ✔ ] Done installing ...."
which hashcat > /dev/null 2>&1
fi
sleep 1
}
function hacker(){
clear
banner
echo -n -e ${ORANGE}"\n[+] Enter path of zip file : "
read file
echo -n -e ${RED}"\n[+] Analyzing $file On: ${CPO}$d \n"
sleep 1
echo -n -e ${CP}"\n[*] Filename : $file \n"
sleep 0.5
if [[ $file != *.zip ]]; then
echo -n -e ${RED}"\n[*] Not a Zip file "
exit 1
fi
sleep 1
clear
menu
}
function dict_crack(){
clear
banner

echo -n -e ${CNC}"\n[*] Enter path of wordlist:  "
read word
sleep 0.5
echo -n -e ${BLUE2}"\n[*] Cracking Stared on ${CPO}$d:  $file \n "
sleep 2
echo -n -e ${CN}"\n[*] Grab A Coffee & Wait For Sometime :) \n "

dict=$(fcrackzip -v -u -D -p $word $file | awk '/pw ==/{print $NF}')
if [[ $dict != '' ]]; then
echo -n -e ${CP}"\n[ ✔ ] Password Found For ${CP}$file: ${RED}$dict  "
else
echo -n -e ${RED}"\n[ X ] Password Not Found "
fi

}
function hash_crack(){
clear
banner
if [[ ! -f /usr/sbin/zip2john ]]; then
echo -e -n ${RED}"\n[*] zip2john path not found.......Exiting!\n"
exit
fi
echo -e ${YELLOW}"\n[*] Choose Cracking Type: Press 1 Or 2 :"
echo -e -n ${BLUE}"\n[*] 1. Use Default Wordlist \n${CP}[*] 2. Use Ur Own Wordlist \n"
echo -n -e ${CNC}"\n[+] Select: "
read cho
if [[ $cho = 1 ]]; then
echo -n -e ${BLUE2}"\n[*] Cracking Stared on ${CPO}$d:  $file \n "
zip2john $file > h1.tmp 2>&1
sleep 2
john h1.tmp --pot=h2.tmp > h3.tmp 2>&1
check=$(cat h2.tmp | awk -F: '{ print $2 }') 2>&1
echo -n -e ${CN}"\n[*] Grab A Coffee & Wait For Sometime :) \n "
sleep 1
if [[ $check != '' ]]; then
echo -n -e ${CP}"\n[ ✔ ] Password Found For ${CP}$file: ${RED}$check "
else
echo -n -e ${RED}"\n[ X ] Password Not Found "
fi
elif [[ $cho = 2 ]]; then
echo -n -e ${CNC}"\n[*] Enter path of wordlist:  "
read wlst
sleep 1
echo -n -e ${BLUE2}"\n[*] Cracking Stared on ${CPO}$d:  $file \n "
sleep 2
zip2john $file > h4.tmp 2>&1
cat h4.tmp | awk -F: '{ print $2 }' > i.tmp 2>&1
john i.tmp --wordlist $wlst --pot=h2.tmp > h3.tmp 2>&1
check=$(cat h2.tmp | awk -F: '{ print $2 }') 2>&1
echo -n -e ${CN}"\n[*] Grab A Coffee & Wait For Sometime :) \n "
sleep 1
if [[ $check != '' ]]; then
echo -n -e ${CP}"\n[ ✔ ] Password Found For ${CP}$file: ${RED}$check "
else
echo -n -e ${RED}"\n[ X ] Password Not Found "
fi
fi
 rm *.tmp

}
#Coded By Machine404! Don't copy this code without giving me credit~
#https://instagram.com/invisibleclay100
#https://twitter.com/whoami4041
#https://www.youtube.com/channel/UCC_aPnmV_zGfdwktCFE9cPQ
function brute_crack(){
clear
banner
echo -e ${YELLOW}"\n[*] Choose Cracking Type: Press 1 Or 2 Or 3 :"
echo -e -n ${BLUE}"\n[*] 1. Use Default (1-8) Numeric Wordlist \n${CP}[*] 2. Use Default (1-8) AlphaNumeric Wordlist \n"
echo -n -e ${CNC}"\n[+] Select: "
read cho
if [[ $cho = 1 ]]; then

echo -e -n ${CPO}"\n[*] Applying Stage 1 Attack (1-8) Numeric \n"
sleep 1
echo -n -e ${BLUE2}"\n[*] Cracking Stared on ${CPO}$d:  $file \n "
sleep 2
echo -n -e ${CN}"\n[*] Grab A Coffee & Wait For Sometime :) \n "
sleep 1
br=$(fcrackzip -c 1 -m zip1 -l 1-8 -u $file | awk '/pw ==/{print $NF}')
if [[ $br != '' ]]; then
echo -n -e ${CP}"\n[ ✔ ] Password Found For ${CP}$file: ${RED}$br "
exit
else
echo -n -e ${RED}"\n[ X ] Password Not Found "
fi
elif [[ $cho = 2 ]]; then

echo -e -n ${CPO}"\n[*] Applying Stage 2 Attack (1-8) AlphaNumeric \n"
sleep 1
echo -n -e ${BLUE2}"\n[*] Cracking Stared on ${CPO}$d:  $file \n "
sleep 2
echo -n -e ${CN}"\n[*] Grab A Coffee & Wait For Sometime :) \n "
sleep 1
hel=$(fcrackzip -m zip1 -l 1-8 -u $file | awk '/pw ==/{print $NF}')
if [[ $hel != '' ]]; then
echo -n -e ${CP}"\n[ ✔ ] Password Found For ${CP}$file: ${RED}$hel "
else
echo -n -e ${RED}"\n[ X ] Password Not Found "
fi
fi

}
menu()
{
clear
banner

echo -e ${YELLOW}"[*] Choose Cracking Type: "
echo -e "  ${NC}[${CG}"1"${NC}]${CNC} Dictionary Attack"
echo -e "  ${NC}[${CG}"2"${NC}]${CNC} Hash Attack"
echo -e "  ${NC}[${CG}"3"${NC}]${CNC} BruteForce Attack"
echo -e "  ${NC}[${CG}"3"${NC}]${CNC} Exit"
echo -n -e ${YELLOW}"\n[+] Select: "
        read redi_play
                if [ $redi_play -eq 1 ]; then
                        dict_crack
                elif [ $redi_play -eq 2 ]; then
                        hash_crack
                elif [ $redi_play -eq 3 ]; then
                      brute_crack
                elif [ $redi_play -eq 4 ]; then
                      exit
                fi
}
banner
clear
depend
hacker
#Coded By Machine404! Don't copy this code without giving me credit~
#https://instagram.com/invisibleclay100
#https://twitter.com/whoami4041
#https://www.youtube.com/channel/UCC_aPnmV_zGfdwktCFE9cPQ
