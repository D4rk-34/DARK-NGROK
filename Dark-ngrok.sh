#!/data/data/com.termux/files/usr/bin/bash


# Code by dark-34 2023  
pathbin='//data/data/com.termux/files/usr/bin'
#Colours
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"                            
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
cyan="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

success=false

function banner {
	clear
	figlet "DARK-NGROK" | lolcat 
	echo -e "\n" 
}
function getngrok {
	banner
	echo -e "${cyan}[${yellow}+${yellow}${cyan}] instalando dependencias y ngrok\n${end}"
        apt install -y parrot wget > /dev/null 2>&1
	case `dpkg --print-architecture` in
		aarch64)
			architectureURL="arm64" ;;
		arm)
			architectureURL="arm" ;;
		armhf)
			architectureURL="arm" ;;
		amd64)
			architectureURL="amd64" ;;
		i*86)
			architectureURL="386" ;;
		x86_64)
			architectureURL="amd64" ;;
		*)
			echo "${red} arquitectura desconocida${end}"
				
	esac
	wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-${architectureURL}.zip -O ngrok.zip > /dev/null 2>&1 
	unzip ngrok.zip > /dev/null 2>&1 
	rm $HOME/ngrok > /dev/null 2>&1
	rm $pathbin/ngrok > /dev/null 2>&1
	cp ngrok $pathbin > /dev/null 2>&1
	rm ngrok > /dev/null 2>&1
	rm ngrok.zip > /dev/null 2>&1
	if [ -f $pathbin/ngrok ];then
		clear
		banner 
		echo -e "${blue}Introduce tu token de ingrok\n"
		read -p "TOKEN: " tokngrok 
		ngrok config add-authtoken ${tokngrok} > /dev/null 2&>1 
		banner 
		echo -e "${cyan} La insalación fue exitosa Use: ${yellow} termux-chroot ngrok http 8080\n Para ejecutar ngrok\n${end}" 
		echo -e "${cyan} visita mi canal de youtube: ${yellow}https://www.youtube.com/@termuxuserdark${end}" 
	else
		echo -e "${red} No se instalo  ngrok ejecuta el script nuevamente\n${end}"
		sleep 3
	fi
}

function installer {
	clear
	echo -e "${cyan}[${yellow}+${yellow}${cyan}] instalando dependencias\n${end}"
	pkg update -y > /dev/null 2>&1
	pkg upgrade -y > /dev/null 2>&1 
        apt install  -y ruby figlet  > /dev/null 2>&1
        gem install lolcat -y > /dev/null 2>&1

	while true; do
		banner
		echo -e "${green} ¿Deseas intalar ngrok en termux?[Yes/No]\n"
		read -p "Option: " opc 
		if [ "$opc" == "Yes" ];then
			getngrok
			break 
			sleep 1
		elif [ "$opc" == "No" ];then
			clear 
			echo -e "Vuelve pronto"
			break
		else
			clear
			echo -e "${red}Escribe la respuesta en máyuscula${end}"
			sleep 3
		fi
	done
}
installer
