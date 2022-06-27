#!/bin/sh

# mc
if [ -f /home/vagrant/.migrations/00-install-mc ]
then
    echo "mc already installed"
    exit 0
fi

sudo apt-get install mc -y

touch /home/vagrant/.migrations/02-install-xdebug
