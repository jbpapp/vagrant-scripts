#!/usr/bin/env bash

echo ">>> Setting up PHPMyAdmin"

# Install PHPMyAdmin
sudo apt-get install phpmyadmin -q -y

# Configuring PHPMyAdmin
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean false' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections

# Enable PHPMyAdmin
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-enabled

# Restart Apache
sudo service apache2 restart