#!/bin/sh

# Increase connections limit
if [ -f /home/vagrant/.migrations/04-increase-connections-limit ]
then
    echo "Increase connections limit already applied"
    exit 0
fi

sudo sed -i 's/^pm\.max_children = 5$/pm.max_children = 50/g' /etc/php/7.4/fpm/pool.d/*.conf
sudo sed -i 's/^pm\.start_servers = 2$/pm.start_servers = 20/g' /etc/php/7.4/fpm/pool.d/*.conf
sudo sed -i 's/^pm\.min_spare_servers = 1$/pm.min_spare_servers = 5/g' /etc/php/7.4/fpm/pool.d/*.conf
sudo sed -i 's/^pm\.max_spare_servers = 3$/pm.max_spare_servers = 50/g' /etc/php/7.4/fpm/pool.d/*.conf

sudo service php7.4-fpm restart
sudo service nginx restart

touch /home/vagrant/.migrations/04-increase-connections-limit
