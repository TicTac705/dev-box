#!/bin/sh

# Select PHP version
#if [ -f /home/vagrant/.migrations/07-create-symlink ]
#  then
#  echo "Create Symlink already installed"
#  exit 0
#fi

#sudo ln -sf /home/vagrant/shop/shop-api/storage/app /home/vagrant/shop/www/shop-api/public/storage
#sudo ln -sf /home/vagrant/shop/www/resources/css /home/vagrant/shop/www/public/css
#sudo ln -sf /home/vagrant/shop/www/resources/js /home/vagrant/shop/www/public/js

touch /home/vagrant/.migrations/07-create-symlink

