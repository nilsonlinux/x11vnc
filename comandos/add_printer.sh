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
echo -e " ${c}ADICIONAR IMPRESSORA.${end}"
echo -e "DIGITE ${c}A${end} ${br}IDENTIFICAÇÃO DA IMPRESSORA. (EX: RH, FATURAMENTO) ${end}"
read -p "IDENTIFICAÇÃO IMPRESSORA: " $read NOME
clear
##########
logo
echo -e " ${c}ADICIONAR IMPRESSORA.${end}"
echo -e "IDENTIFICAÇÃO DA IMPRESSORA: ${NOME}${end}"
read -p "DIGITE O IP DA IMPRESSORA: " $read IP
echo -e "${c}---------------------------------------------------${end}"
echo -e "$vr======================================== $end"
echo -e "$v         DIGITE A SENHA PARA CONTINUAR.  $end "
echo -e "$vr======================================== $end"
sudo lpadmin -p ${NOME} -E -v socket://${IP};
sudo cp x11vnc/impressora.ppd /etc/cups/ppd/${NOME}.ppd
rm -rf $HOME/x11vnc


