#!/bin/sh

# MariaDB
if [ -f /home/vagrant/.migrations/01-configure-mariadb ]
then
    echo "MariaDB already configured"
    exit 0
fi

sudo mysql -e "CREATE USER IF NOT EXISTS 'shop'@'0.0.0.0' IDENTIFIED BY 'secret';"
sudo mysql -e "GRANT ALL ON *.* TO 'shop'@'0.0.0.0' IDENTIFIED BY 'secret' WITH GRANT OPTION;"
sudo mysql -e "GRANT ALL ON *.* TO 'shop'@'%' IDENTIFIED BY 'secret' WITH GRANT OPTION;"
sudo mysql -e "FLUSH PRIVILEGES;"
sudo service mysql restart

touch /home/vagrant/.migrations/01-configure-mariadb
