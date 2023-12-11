#!/bin/bash
dirs="./sources" && [[ ! -d ${dirs} ]] && mkdir ${dirs}
SCPresq="NB2HI4DTHIXS64TBO4XGO2LUNB2WE5LTMVZGG33OORSW45BOMNXW2L2DOVSXE5TPINXW63BPOZYH\nGQTPOQXW2YLJNYXXG33VOJRWK4YK"
SUB_DOM='base32 -d'
bar="\e[0;36m=====================================================\e[0m"
update () {
cd $HOME
REQUEST=$(echo -e $SCPresq|$SUB_DOM)
echo "VPSBot.sh ShellBot.sh pato.sh" >> lista-arq
if [[ -e $HOME/lista-arq ]]; then
for arqx in `cat $HOME/lista-arq`; do
wget -O $HOME/$arqx ${REQUEST}/${arqx} > /dev/null 2>&1 && echo -e "\033[0;49;93mdescargando \033[0;49;32m${arqx}\033[0m" && [[ -e $HOME/$arqx ]] && veryfy_fun $arqx
done
fi
 rm $HOME/lista-arq
 echo "cd ${dirb}" > /usr/bin/VPSBot && echo './vpsbot_conf.sh' >> /usr/bin/VPSBot && chmod +x /usr/bin/VPSBot
}
veryfy_fun () {
dirs="${dirb}/sources" && [[ ! -d ${dirs} ]] && mkdir ${dirs}
unset ARQ
case $1 in
"ShellBot.sh" | "pato.sh" ) ARQ="sources";;
"VPSBot.sh" ) ARQ="$dir";;
esac
mv -f $HOME/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}
mensaje () {
 if [[ $1 = updating ]]; then
  MENSAJE="Actualizando VPSBot..."
 elif [[ $1 = updated ]]; then
  MENSAJE="VPSBot Actualizado!"
 fi
 TOKEN="$(cat ${dirb}/token)"
 ID="$(cat ${dirb}/Admin-ID)"
 URL="https://api.telegram.org/bot$TOKEN/sendMessage"
 curl -s -X POST $URL -d chat_id=$ID -d text="$MENSAJE"
}

clear
sleep 5
if [[ $1 = start ]]; then
	mensaje updating
	update
	mensaje updated
	cd ${dirb}
	screen -dmS VPSBot ./VPSBot.sh
else
	echo -e "\033[0;49;93m==============================\n INSTALANDO VPSBot\n==============================\033[0m"
	update
	echo -e "\033[0;49;93m==============================\n VPSBot INSTALADO\n==============================\n escriba \033[5;49;32mVPSBot \033[0;49;93mpara ejecutar\n==============================\033[0m"
fi

rm $HOME/update.sh
exit

