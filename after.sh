#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.


# Common
#if ! grep -Fq "c4.local" /etc/hosts
#then
    #echo '127.0.0.1 api.c4.local' | sudo tee --append /etc/hosts
    #echo '127.0.0.1 public.c4.local' | sudo tee --append /etc/hosts
#fi
sudo apt install elinks -y

if [ ! -d /home/vagrant/.migrations ]
then
    mkdir '/home/vagrant/.migrations'
fi

for migration in /home/vagrant/shop/devbox/migrations/*.sh; do
    sh "$migration"
done


# the following need to be run after each provision

# Apply CORS to API
#sudo sed -i -- 's/    access_log off;/    location ~\* \\\.\(jpg\|jpeg\|png\)\$ \{ add_header Access-Control-Allow-Origin \*; }\n\n    #access_log off;/' /etc/nginx/sites-available/api.c4.local
#sudo service nginx restart
