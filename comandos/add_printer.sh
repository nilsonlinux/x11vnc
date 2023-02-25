#!/bin/bash
  #####################################################################################
  #### SUPORTE REGIONAL - SANTA INÊS - MA
  #### Nilsonlinux
  #####################################################################################
# #####################################################################################
  NOME_PROG="ADICIONAR IMPRESSORA"
  #####################################################################################
  #############################   VERIFICAÇÃO DE CONEXÃO   ############################
  #####################################################################################
    while true
    do
    NOME=
    IP=
    ###############################################################################################
      FORMULARY=$(GTK_THEME="$THEME" yad --form --borders=10 --center --width=550      \
          --window-icon="gtk-execute"  --image="$DIR/img/ncode.png" --item-separator=","          \
          --title "$NOME_PROG - VERSÃO $ver"                                                      \
          --form                                                                                  \
          --field="N O M E  S E T O R" $NOME ""                                                   \
          --field="I P  D A  I M P R E S O R A" $IP ""                                            \
          --button="IMPRESSORAS":$DIR/printer.sh --button="CANCELAR":1 --button="INSTALAR":0)
      [ $? != 0 ] && exit
      NOME=$(echo $FORMULARY      | awk -F '|' '{ print $1 }')
      IP=$(echo $FORMULARY     | awk -F '|' '{ print $2 }')
      break
      done
#########################################################################
sudo lpadmin -p ${NOME} -E -v socket://${IP}
# Verificando se o usuario digitou pelo menos o nome
if [ -z $NOME ]
then
# Notificação de erro para gerar codigo
 yad --title="Aviso !"  \
    --center                                      \
    --width=400                                   \
    --height=100                                  \
    --image="$DIR/img/erro.svg"                   \
    --fixed                                       \
    --text="Você não digitou o nome
no campo solicitado!"                             \
    --text-align=center                           \
    --button=Fechar
else
##########################################################################
  # Notificação de sucesso para gerar codigo
  yad --title="Parabéns, Código Gerado !"    \
      --center                                       \
      --width=350                                    \
      --height=110                                   \
      --image="$DIR/img/ok.svg"                      \
      --progress-text="Concluido 100%  !"            \
      --percentage=99                                \
      --progress --auto-kill                         \
      --fixed                                        \
      --text-align=center                            \
      --button=Fechar                                \
      --text="Código do(a) $NOME gerado com sucesso.
      Desenvolvedor: Nilsonlinux"
################################################
