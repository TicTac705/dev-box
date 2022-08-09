#!/bin/sh

# Select PHP version
if [ -f /home/vagrant/.migrations/06-select-php-version ]
then
    echo "Select PHP version already installed"
    exit 0
fi

sudo update-alternatives --set php /usr/bin/php7.4
sudo update-alternatives --set php-config /usr/bin/php-config7.4
sudo update-alternatives --set phpize /usr/bin/phpize7.4

sudo service php7.4-fpm restart

touch /home/vagrant/.migrations/06-select-php-version
