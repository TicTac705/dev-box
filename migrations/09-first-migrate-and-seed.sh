#!/bin/sh

if [ -f /home/vagrant/.migrations/09-first-migrate-and-seed ]
  then
  echo "First migrate and seed already runned"
  exit 0
fi

cd /home/vagrant/shop/www
php artisan migrate --seed

touch /home/vagrant/.migrations/09-first-migrate-and-seed