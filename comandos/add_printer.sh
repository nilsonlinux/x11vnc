#!/bin/bash
  #####################################################################################
  #### SUPORTE REGIONA
  #### Nilsonlinux
  #####################################################################################
# #####################################################################################
  NOME_PROG="ADICIONAR IMPRESSORA"
  THEME="Mint-Y-Dark-Blue"
  #/usr/share/themes/Mint-Y-Dark-Blue
  #####################################################################################
  #############################   VERIFICAÇÃO DE CONEXÃO   ############################
  #####################################################################################
    while true
    do
    SETOR=
    IP=
    ###############################################################################################
      FORMULARY=$(GTK_THEME="$THEME" yad --form --borders=10 --center --width=550                 \
          --window-icon="gtk-execute"  --image="printer-printing" --item-separator=","            \
          --title "$NOME_PROG"                                                                    \
          --form                                                                                  \
          --field="S E T O R" ${SETOR} ""                                                            \
          --field="I P" ${IP} ""                                                                    \
          --button="CANCELAR":1 --button="INSTALAR":0)
      [ $? != 0 ] && exit
      SETOR=$(echo $FORMULARY  | awk -F '|' '{ print $1 }')
      IP=$(echo $FORMULARY     | awk -F '|' '{ print $2 }')
      break
      done
#########################################################################
sudo lpadmin -p ${SETOR} -E -v socket://${IP}
sudo cp $HOME/x11vnc/x11vnc/impressora.ppd /etc/cups/&{SETOR}.ppd
#rm -rf $HOME/x11vnc
##########################################################################
xdg-open http://localhost:631/printers/${SETOR}
