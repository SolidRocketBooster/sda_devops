#!/bin/bash
set -e

DOMAIN="yellow.com"
VH_FILE="/etc/nginx/sites-available/${DOMAIN}.conf"

EXAMPLE_DOMAIN="example.com"
PHP_POOL_DIR="/etc/php/7.2/fpm/pool.d/"

export DEBIAN_FRONTEND=noninteractive
echo "##### apt... #####"
apt update
apt -y upgrade
apt -y dist-upgrade
apt -y install git nginx php7.2-fpm curl wget links links2 w3m

echo "##### get conf #####"
sudo -u srb mkdir -p /home/srb/auto
if [[ -d /home/srb/auto/example/.git ]]; then
	cd /home/srb/auto/example
	sudo -u srb git pull
else
	cd /home/srb/auto
	sudo -u srb git clone https://bitbucket.org/rutkomi/example.git
fi

echo "##### nginx conf #####"
echo "##### nginx conf - cp vh file config #####"
cp /home/srb/auto/example/nginx/example.com.conf $VH_FILE
echo "##### nginx conf - sed and configure #####"
sed -i.back "s/${EXAMPLE_DOMAIN}/${DOMAIN}/g" $VH_FILE
echo "##### nginx conf - create site-enabled symlink"

if [[ ! -L /etc/nginx/sites-enabled/${DOMAIN}.conf  ]]; then
	ln -s $VH_FILE /etc/nginx/sites-enabled
fi

echo "##### ngnix conf - create dirs #####"
for dir in /www/${DOMAIN}/public/ /www/_logs/access/ /www/_logs/error/
do
	mkdir -p $dir
done

echo "##### nginx conf - cp test file #####"
cp /home/srb/auto/example/nginx/index.html /www/${DOMAIN}/public
cp /home/srb/auto/example/nginx/index.php /www/${DOMAIN}/public/test.php
cp /home/srb/auto/example/nginx/example.php /www/${DOMAIN}/public

echo "##### nginx conf - permissions #####"
chown -R www-data.www-data /www
chmod -R 755 /www

echo "##### php conf #####"
cp ${PHP_POOL_DIR}/www.conf ${PHP_POOL_DIR}/srb.conf
sed -i.back "s/\[www\]/\[srb\]/g" ${PHP_POOL_DIR}/srb.conf
sed -i.back "s/^listen\s.*$/listen = 127.0.0.1:9001/g" ${PHP_POOL_DIR}/srb.conf

echo "##### restart PHP-fpm #####"
systemctl restart php7.2-fpm.service
echo "##### restart Nginx #####"
systemctl restart nginx.service

echo "##### edit /etc/hosts #####"
HOST_E="127.0.0.1 ${DOMAIN}"
grep -q -x "${HOST_E}" /etc/hosts || echo ${HOST_E} >> /etc/hosts

echo "##### TEST #####"
links -dump yellow.com/test.php

