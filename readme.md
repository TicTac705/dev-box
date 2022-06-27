
# Shop development environment

## Setup project environment

There are 3 repositories in project.

**devbox** - development environment
**shop-www** - back-end
**shop-client** - front-end (absent now)
### Setup steps:
1. Clone the repositories like described below:
```
shop/devbox 
shop/www/shop-api
shop/www/shop-client (absent now)
```
2. Install [Virtual box](https://www.virtualbox.org/)
3. Install [Vagrant](https://www.vagrantup.com/downloads.html)
4. Ensure Php 7.4 installed
5. Ensure php7.2-gd, php7.2-intl, php7.2-xsl installed on server
6. Install [Composer](https://getcomposer.org/download/)
7. Create the following aliases in `c:\Windows\System32\drivers\etc\hosts`:
```
192.168.50.38 shop.local
```
8. In `devbox/Homestead.yaml` change the folder mapping to your real path (under the folders section):
This is my example:
```
folders:
    - map: "e:/work/shop/devbox"
      to: "/home/vagrant/shop/devbox"
    - map: "e:/work/shop/www"
      to: "/home/vagrant/shop/www" 
```
9. In `shop/devbox` run `composer install`
10. In `shop/devbox` run `vagrant up`
11. In `php.ini` file (located at you php installed directory), uncomment this line `extension=pdo_mysql` and add lines `extension=php_gd2.dll` & extension=php_fileinfo.dll
12. In `shop/www/shop-api` run `composer install` (may be need use it inside vagrent - `vagrant ssh`)
13. Make environment file. Copy file `shop\www\shop-api\.env.local.example` to `shop\www\shop-api\.env`

// 14. in `shop/www/shop-api` run `php artisan migrate` or `php artisan migrate:refresh --seed`
// 15. Install client packages (in `shop/www/shop-client`) run `npm install`
// 16. To start client devserver `npm run start`
// 17. To generate test data (in `shop/www/shop-api`) run `php artisan generate`, this will create the admin and some test data. 


## Some commands 

Used to make symlink for upload folder
//  ln -s /home/vagrant/shop/www//storage/app /home/vagrant/shop/www/shop-api/public/storage
 
 Run vagrant migrations:
 vagrant up --provision
