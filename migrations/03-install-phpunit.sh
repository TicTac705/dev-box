#!/bin/sh

# PHPUnit
if [ -f /home/vagrant/.migrations/03-install-phpunit ]
then
    echo "PHPUnit already installed"
    exit 0
fi

wget -O phpunit.phar https://phar.phpunit.de/phpunit-9.5.9.phar
chmod +x phpunit.phar
sudo mv phpunit.phar /usr/local/bin/phpunit

touch /home/vagrant/.migrations/03-install-phpunit
