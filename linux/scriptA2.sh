#!/bin/bash

echo 'Atualizando servidor'

apt-get update
apt-get upgrade -y

echo 'Instalando Apache 2'

apt-get install apache2 -y

echo 'instalando unzip'

apt-get install unzip -y

echo 'Baixando App no diretorio /tmp'

cd /tmp

wget ttps://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip

cd linux-site-dio-main

cp -R * /var/www/html/

