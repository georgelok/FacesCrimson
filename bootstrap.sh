#!/usr/bin/env bash

sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password password'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password password'
sudo apt-get update
sudo apt-get -y install mysql-server-5.5 php5-mysql apache2 php5

if [ ! -f /var/log/databasesetup ];
then
    echo "CREATE USER 'user'@'localhost' IDENTIFIED BY 'pass'" | mysql -uroot -prootpass
    echo "CREATE DATABASE wordpress" | mysql -uroot -prootpass
    echo "GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost'" | mysql -uroot -prootpass
    echo "flush privileges" | mysql -uroot -prootpass

    touch /var/log/databasesetup

    if [ -f /vagrant/data/initial.sql ];
    then
        mysql -uroot -prootpass wordpress < /vagrant/data/initial.sql
    fi
fi

if ! [ -h /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant/public /var/www

  sudo a2enmod rewrite
  
  sed -i '/AllowOverride None/c AllowOverride All' /etc/apache2/sites-available/default

  sudo service apache2 restart
fi