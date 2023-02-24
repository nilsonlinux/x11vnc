 #!/bin/bash
  #####################################################################################
  #### SUPORTE REGIONAL - PE/PB/AL/RN
  #####################################################################################
  IP=$(hostname -I)
  ####################
yad --form --title="Informação!" --height=300 --width=400 \
--center --image=/home/Nilsonlinux/.icons/net.svg \
--borders=20 --button="Sair:0"  \
--text="<span font_weight='bold' font='10' color='#FFBF00'>  O IP DESTA MÁQUINA É</span>
<span font='25' color='#6DFB0E'>${IP} </span>" \
