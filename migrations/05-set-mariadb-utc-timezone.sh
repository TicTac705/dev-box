#!/bin/sh

# Set MariaDB UTC Timezone
#if [ -f /home/vagrant/.migrations/05-set-mariadb-utc-timezone ] || grep -q "default_time_zone='+00:00'" /etc/mysql/my.cnf
#then
#    echo "Set MariaDB UTC Timezone already applied"
#    exit 0
#fi

#sudo sed -i "s/^\[mysqld\]$/[mysqld]\ndefault_time_zone='+00:00'/" /etc/mysql/my.cnf

#sudo service mysql restart

touch /home/vagrant/.migrations/05-set-mariadb-utc-timezone
