#!/bin/sh

# Select PHP version
if [ -f /home/vagrant/.migrations/06-select-php-version ]
then
    echo "Select PHP version already installed"
    exit 0
fi

sudo update-alternatives --set php /usr/bin/php8.0

touch /home/vagrant/.migrations/06-select-php-version
