#!/bin/bash
cache_src () {
echo 2 > /proc/sys/vm/drop_caches
sleep 2
ram1=$(free -h | grep -i mem | awk {'print $2'}) && ram2=$(free -h | grep -i mem | awk {'print $4'}) && ram3=$(free -h | grep -i mem | awk {'print $3'})
	  bot_retorno="=============\n"
	  bot_retorno+="Ram: $ram1\n"
	  bot_retorno+="USADA: $ram3\n"
	  bot_retorno+="LIBRE: $ram2\n"
	  bot_retorno+="USO DE RAM: $_usor\n"
	  bot_retorno+="=============\n"
msj_fun
}
myid_src () { bot_retorno="$linea\n" && bot_retorno+="⠀⠀⠀⠀👤●⸺ [ ${message_from_first_name} ]\n⠀⠀⠀⠀🆔 ●⸺ [<code>${message_from_id}</code>]\n$linea\n" && msj_fun ; }
menu_src () {
bot_retorno="=========COMANDOS=========\n"
	 if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
		 bot_retorno+="/ID (muestra sus ID)\n"
		 bot_retorno+="/menu (muestra este menu)\n"
		 bot_retorno+="/ayuda (muestra ayuda de los comandos)\n"
		 bot_retorno+="$LINE\n"
	 else		 
		 bot_retorno+="/infosys (informacion del sistema)\n"
		 bot_retorno+="/ID (muestra sus ID)\n"
		 bot_retorno+="/menu (muestra este menu)\n"
		 bot_retorno+="/ayuda (muestra ayuda de los comandos)\n"
		 bot_retorno+="/cache (Limpiar cache Ram)\n"
		 bot_retorno+="/update (actualiza el BotGen)\n"
		 bot_retorno+="/reboot (Reinicia el servidor vps)\n"
		 bot_retorno+="$LINE\n"
	 fi	
msj_fun
}
infosys_src () {
_hora=$(printf '%(%H:%M:%S)T') && _fecha=$(printf '%(%D)T')
_core=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)") && _usop=$(printf '%-1s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
ram1=$(free -h | grep -i mem | awk {'print $2'}) && ram2=$(free -h | grep -i mem | awk {'print $4'}) && ram3=$(free -h | grep -i mem | awk {'print $3'})
_ram=$(printf ' %-9s' "$(free -h | grep -i mem | awk {'print $2'})") && _usor=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
os_sys=$(echo $(cat -n /etc/issue |grep 1 |cut -d' ' -f6,7,8 |sed 's/1//' |sed 's/      //')) && echo $system|awk '{print $1, $2}'

bot_retorno="$LINE\n"
          bot_retorno+="S.O: $os_sys\n"
	  bot_retorno+="Su IP es: $(meu_ip)\n"
	  bot_retorno+="$LINE\n"
	  bot_retorno+="Ram: $ram1\n"
	  bot_retorno+="USADA: $ram3\n"
	  bot_retorno+="LIBRE: $ram2\n"
	  bot_retorno+="USO DE RAM: $_usor\n"
	  bot_retorno+="$LINE\n"
	  bot_retorno+="CPU: $_core\n"
	  bot_retorno+="USO DE CPU: $_usop\n"
	  bot_retorno+="$LINE\n"
	  bot_retorno+="FECHA: $_fecha\n"
	  bot_retorno+="HORA: $_hora\n"
          bot_retorno+="$LINE\n"
msj_fun
}
cmd_fun () {
#comand="$@"
#var="$("${comand[0]}" "${comand[1]}")"
#lscmd=$(cat -n "${var}")
bot_retorno+="$($1)"
msj_fun
}
invalido_src () {
bot_retorno="$LINE\n"
         bot_retorno+="Comando invalido!\n"
         bot_retorno+="$LINE\n"
}
meu_ip_fun () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}
meu_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && echo "$MIP2" || echo "$MIP"
}
update () {
[[ ! -e "$HOME/update.sh" ]] && wget -O $HOME/update.sh https://raw.githubusercontent.com/rudi9999/VPSBot/main/update.sh &> /dev/null
chmod +x $HOME/update.sh
screen -dmS updateBotGen $HOME/update.sh start
sleep 1
killall VPSBot.sh
}
ayuda_src () {
bot_retorno="===========AYUDA===========\n"
	 if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
		 bot_retorno+="/ID\n muestra sus ID de telegram\n para tener acceso al /keygen\n deve enviar su ID al admin\n"
		 bot_retorno+="$LINE\n"
		 bot_retorno+="/menu\n muestra el menu\n de comandos disponibles\n"
		 bot_retorno+="$LINE\n"
		 bot_retorno+="/ayuda\n muestra este menu de ayuda\n"
		 bot_retorno+="$LINE\n"
	 else
		 bot_retorno+="/infosys\n muestra informacion del sistema\n Ram, Cpu, Fecha y Hora\n"
		 bot_retorno+="$LINE\n"
		 bot_retorno+="/ID\n muestra sus ID de telegram\n para tener acceso al /keygen\n deve enviar su ID al admin\n"
		 bot_retorno+="$LINE\n"
		 bot_retorno+="/menu\n muestra el menu\n de comandos disponibles\n"
		 bot_retorno+="$LINE\n"
		 bot_retorno+="/ayuda\n muestra este menu de ayuda\n"
		 bot_retorno+="$LINE\n"
		 bot_retorno+="/cache\n limpia el cache contenido en la ram\n"
		 bot_retorno+="$LINE\n"
		 bot_retorno+="/update\n actualiza el VPSBot\n"
		 bot_retorno+="$LINE\n"
		 bot_retorno+="/reboot\n Reinicia el servidor vps\n"
		 bot_retorno+="$LINE\n"
	 fi
msj_fun
}
comand () {
	    if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
		 case ${comando[0]} in
			 /[Ii]d|/[Ii]D)myid_src &;;
			 /[Mm]enu|[Mm]enu|/[Ss]tart|[Ss]tart|[Cc]omensar|/[Cc]omensar)menu_src &;;
			 /[Aa]yuda|[Aa]yuda|[Hh]elp|/[Hh]elp)ayuda_src &;;
			 *)invalido &;;
		 esac
	    else
		 case ${comando[0]} in
			 /[Mm]enu|[Mm]enu|/[Ss]tart|[Ss]tart|[Cc]omensar|/[Cc]omensar)menu_src &;;
			 /[Aa]yuda|[Aa]yuda|[Hh]elp|/[Hh]elp)ayuda_src &;;
			 /[Ii]d|/[Ii]D)myid_src &;;
			 /[Ii]nfosys)infosys_src &;;
			 /[Rr]eboot)reboot_src &;;
			 /[Cc]ache)cache_src &;;
			 /[Uu]pdate|/[Aa]ctualizar)update &;;
			 /*)invalido_fun &;;
		 esac
	    fi
}
