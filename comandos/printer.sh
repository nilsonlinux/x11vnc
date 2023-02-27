#!/bin/bash
  #####################################################################################
  #### SUPORTE REGIONAL - PE/PB/AL/RN
  #####################################################################################
a='\033[1;33m'     # Amarelo
p='\033[0;35m'     # Purple
v="\033[0;31m"     #vermelho
vr="\033[01;32m"   #Verde
br="\033[0;37m"    #Branco
v1="\033[0;32m"    #Verde escuro
v2="\033[1;32m"    #verde claro
end='\033[0m'
##############################
logo () {
  clear
echo -e "${v1} __     ___   _  ____    ______ ____  _   _ 
\ \   / / \ | |/ ___|  / / ___/ ___|| | | |
 \ \ / /|  \| | |     / /\___ \___ \| |_| |
  \ V / | |\  | |___ / /  ___) |__) |  _  |
   \_/  |_| \_|\____/_/  |____/____/|_| |_|
   ${p}By: Nilsonlinux
   ${v1}Instalação e configuração.
   VNC Server e SSH + Atalhos. Para Linux Mint ${end}"
 }
##############################
logo
echo " ------------------------------------- "
echo -e " ${c}ADICIONAR IMPRESSORA.${end}"
echo -e "DIGITE ${c}A${end} ${br}IDENTIFICAÇÃO DA IMPRESSORA. (EX: RH, FATURAMENTO) ${end}"
read -p "$NOME." $read NOME
clear
##########
  clear
logo
echo -e " ${c}ADICIONAR IMPRESSORA.${end}"
loja
echo -e "DIGITE O ${c}IP${end} ${br}QUE DA IMPRESSORA: ${end}"
read -p "$IP." $read IP
echo -e "${c}---------------------------------------------------${end}"
echo -e "${y}⌛Aguarde enquanto testamos conexão com o terminal ⌛ ${end}"
sleep 1
if ! ping -c 2 $IP >> /dev/null ; then
clear
echo -e "$v======================================= $end"
echo -e "$v       IMPRESSORA DESCONECTADA.           $end"
echo -e "$v======================================= $end"
echo -e "$v      _____ ____  ____   ___    _       $end"
echo -e "$v     | ____|  _ \|  _ \ / _ \  | |      $end"
echo -e "$v     |  _| | |_) | |_) | | | | | |      $end"
echo -e "$v     | |___|  _ <|  _ <| |_| | |_|      $end"
echo -e "$v     |_____|_| \_\_| \_\\____/  (_)     $end"
echo && echo -e "$v======================================= $end"
echo -e "$v======[ $br Status da requisição $ec $v]======= $end"
echo -e "$a IP $end-$bu $IP $end- $v Sem conexão ✗$end" 
echo -e "$v======================================= $end"
echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
echo -e "$v=======================================$end" 
else
clear
echo -e "$vr======================================== $end"
echo -e "$vr         IMPRESSORA CONECTADA.  $end "
echo -e "$vr======================================== $end"
sudo lpadmin -p ${SETOR} -E -v socket://${IP}
sudo cp $HOME/x11vnc/impressora.ppd /etc/cups/ppd/${SETOR}.ppd
rm -rf $HOME/x11vnc
echo -e "$vr=======[ $br Status da requisição $ec $vr]=======$end"
echo -e "$a IP $end - $bu $IP $end - $vr Conectado$end"
echo -e "$vr======================================== $end"
echo -e "$vr    COMANDO EXECUTADO COM SUCESSO... $end"
echo -e "$vr======================================== $end"
echo -e "${y}Retornando para o menu principal.
⌛Por favor aguarde ⌛${endc}"
echo " ------------------------------------- "
xdg-open http://localhost:631/printers/${SETOR}
