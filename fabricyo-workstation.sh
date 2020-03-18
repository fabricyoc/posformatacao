#!/bin/bash

## FUNÇÕES ##
function InstalaVersaoRecente()
{
    # Verifica a versão mais recente disponível
    VERSAO_RECENTE=`apt-cache search $1 | grep -i $1 | tail -1 | cut -d" " -f1`
    apt install $VERSAO_RECENTE
}


## VARIÁVEIS ##
USUARIO=`whoami`

if [ $USUARIO != 'root' ] 
then
    echo "Necessário logar como root!"
else

    ## Removendo travas eventuais do apt ##

    ## Atualizando o repositório ##
    apt update -y; apt upgrade -y;

    ## Download de programas externos ##
    mkdir /root/program
    cd /root/program

    # Google Chrome
    wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    # VS Code
    wget -c https://code.visualstudio.com/docs/?dv=linux64_deb
    # TeamViewer
    wget -c https://download.teamviewer.com/download/linux/teamviewer_amd64.deb

    dpkg -i *.deb

    ## Instalando programas dos repositórios ##
    apt install pcsxr -y
    apt install higan -y
    apt install kazam -y
    apt install kolourpaint4 -y
    apt install vym -y
    apt install qbittorrent -y
    apt install htop -y
    apt install gettext -y
    
    # Pacotes de programas forenses
    # apt install forensics-extra
    apt install aircrack-ng -y
    apt install wireshark -y
    apt install libimage-exiftool-perl -y
    apt install steghide -y
    apt install nmap -y
    apt install foremost -y
    apt install testdisk -y
    apt install dnsutils -y #nslookup
    # apt install zbar-tools #qrcode
    apt install binutils -y #strings
    apt install poppler-utils -y #pdftotext
    # apt install dcfldd
    InstalaVersaoRecente 'virtualbox'

    echo "Chegamos ao final!!"
fi
