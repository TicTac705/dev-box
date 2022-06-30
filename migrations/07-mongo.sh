#!/bin/sh
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "${GREEN}Setup mongo${NC}"
# mc


echo "Upgrading mongo & make mongodb.so"
sudo pecl upgrade mongodb

sudo cp -f /home/vagrant/shop/devbox-shared/mongodb.conf /etc/mongodb.conf

sudo systemctl restart mongodb

sudo cp -f /home/vagrant/shop/devbox-shared/mongodb.ini /etc/php/7.4/mods-available/mongodb.ini

sudo ln -sf /etc/php/7.4/mods-available/mongodb.ini /etc/php/7.4/fpm/conf.d/30-mongodb.ini
sudo ln -sf /etc/php/7.4/mods-available/mongodb.ini /etc/php/7.4/cli/conf.d/30-mongodb.ini

sudo systemctl restart php7.4-fpm.service

touch /home/vagrant/.migrations/05-mongo
