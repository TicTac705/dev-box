#!/bin/sh

# Select PHP version
if [ -f /home/vagrant/.migrations/08-install-artisan-cron-task ]
then
    echo "Artisan cron task already installed"
    exit 0
fi

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "* * * * * cd /home/vagrant/shop/www && php artisan schedule:run >> /dev/null 2>&1" >> mycron
#install new cron file
crontab mycron
rm mycron

touch /home/vagrant/.migrations/08-install-artisan-cron-task