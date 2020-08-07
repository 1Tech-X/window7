#!/data/data/com.termux/files/usr/bin/bash
# Copyright ©2020 by Tech-x.All right reserved

# Website https://www.mrtechx.com

# colors
green='\033[1;92m'
red='\033[1;31m'
yellow='\033[1;33m'
blue='\033[1;34m'
reset='\033[0m'
orange='\33[38;5;208m'

# Window Dir path

WINDOW_D=$PREFIX/share/window

# Window file path

WINDOW_F=${PREFIX}/share/window/Win7.qcow2
banner () {
	
clear
printf "${blue}"
printf "██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗ ███████╗\n"
printf "██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║ ╚════██║\n"
printf "██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║    ██╔╝ \n"
printf "██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║   ██╔╝  \n"
printf "╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝   ██║   \n"
printf " ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝    ╚═╝   \n"

printf "${red}                  Created by Tech-X${reset}\n"
printf "${reset}"
}

# Checking for required packages 

inst_pkg () {
	printf "${blue}"
	echo ""
for i in wget qemu-system-i386-headless; do
	printf "${red}[*]${blue}Checking for all required packages..."
	echo ""

	if [ -e $PREFIX/bin/$i ]; then
		echo ""
		printf "${green} $i is installed\n"
	else
		echo ""
		echo "Installing packages..."
		apt install -y $i || {
			printf "$red"
			echo ""
                        echo " ERROR: check your internet connection or apt\n Exiting..."
			printf "$reset"
		
			exit

		}
	fi
done

			if [ -e $PREFIX/bin/7z ]; then
			echo ""	
			printf "${green} 7z is installed${reset}\n"
		else
			echo ""
			echo "Installing 7z...\n"
			apt install -y p7zip || {
				printf "$red"
			        echo ""
				echo " ERROR: check your internet connection or apt\n Exiting..."
				printf "$reset"
				exit
			}
		fi
}

win_dir () {
	
echo ""
printf "${red}[*] ${blue}Checking for window Directory${reset}\n"
sleep 1
if [ -d $WINDOW_D ]; then
	echo ""
	sleep 1
	echo ""
	printf "${green}Directory is already  created${reset}\n"

else
	echo ""
	printf "${green}[+]${blue}Creating Window Directory.....${reset}\n"
	echo ""
	mkdir $PREFIX/share/window
	printf "${blue}Directory created${reset}\n"
	echo ""
fi
}

win_f () {
	
        echo ""
	printf "${red}[*]${blue}Checking For window 7 file${reset}\n"
	sleep 1
	if [ -f ${WINDOW_F} ]; then
		echo ""
		printf "${green}Window is already exist${reset}\n"
	else
		echo ""
		printf "${green}[+]${blue}Downloading Window 7 zip file${reset}\n"
		sleep 1
		cd $PREFIX/share/window && wget https://archive.org/download/win-7.7z/Win7.7z
	fi	


}
extract () {

	choice=""

	echo ""
if [ ! -f $PREFIX/share/window/Win7.qcow2 ]; then
	printf "${red}[€]${green}Extracting Window 7 zip file....${reset}\n"
	sleep 1
	cd $PREFIX/share/window
	7z e Win7.7z
	printf "${green}Extracted successfull${reset}\n"
else 
	printf "${green}window 7 zip file already extracted:${reset}\n"
fi

if [ -f $PREFIX/share/window/Win7.7z ]; then
	echo ""
	printf "${blue}Do you want delete window 7 zip file ${green}[y/n]${reset}\n"

	printf "${blue}Enter${red}:~${green}"
	read choice 
	if [ "${choice}" = "y" ]; then
		echo ""
		printf "${red}[*]${green}Removing window 7 zip file${reset}\n"
		rm $PREFIX/share/window/Win7.7z
		echo ""
		printf "${green}Window 7 zip File removed${reset}\n"
	elif [ "${choice}" = "n" ]; then
		echo ""
		printf "${green}Ok window 7 zip file not remove${reset}\n"
	else 
		printf "${red}[!]Wrong Input${reset}\n"

	fi
else
	echo ""
	printf "${red}Window 7 zip file not found${reset}"

fi

}

win_start () {

	printf "${blue}Downloading Window 7 start up file${reset}\n"
	sleep 1
	cd $PREFIX/bin && curl -LO https://raw.githubusercontent.com/1Tech-X/window7/master/win/window && chmod +x window
	echo ""
	banner
	progress
	echo ""
	printf "${yellow}Now you can start window by executing command${reset}"
	printf "${green} window${reset}\n"



}
progress () {
printf "${red}"

echo -ne "■■"
sleep 0.5
echo -ne "■■■■■"
sleep 1
echo -ne "■■■■■■■■■■"
sleep 1
echo -ne "■■■■■■■■■■■■■■■■■"
sleep 1
echo -ne "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"
printf "${reset}"
echo ""
}

banner
echo ""
progress
inst_pkg
win_dir
win_f
extract
win_start
echo ""
echo ""
printf "\033[30;48;5;208mSubscribe my youtube channel TECH-X ${reset}\n"
echo ""
printf "\033[30;48;5;15mFollow me ${blue}on \033[30;48;5;15minstagram t_e_c_h_x    ${reset}\n"
echo ""
printf "\033[30;48;5;28mVisit my website www.mrtechx.com    ${reset}\n"
echo ""
