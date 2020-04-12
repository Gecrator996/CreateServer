#!/bin/bash
# A simple script
echo "\nUpdating System\n"
yes | sudo apt update
echo "\nUpgrading System\n"
sleep 5
echo "\nStarted\n\n"
sudo apt upgrade
sleep 5
sudo fallocate -l 1G /swapfile
echo "\nUsing dd to reserve space for SWAP"
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576
echo "\nFinished dd\n"
sleep 3
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo "\nReplacing fstab file\n"
sleep 3
sudo rm -r /etc/fstab
sudo cp ./fstab /etc/
echo "\nFinished\n"
sleep 3
echo "\nStarting Taskel installation\n"
sleep 1
yes | sudo apt install tasksel
echo "\nDone\n"
echo "\nInstalling LAMP-SERVER\n"
sleep 1
sudo tasksel install lamp-server
echo "\nDone\n"
sleep 1 
echo "\nInstalling Dependencies\n"
yes | sudo apt install php-curl php-gd php-mbstring php-xml php-xmlrpc
echo  "\nCopying config file from /var/www/000-default.conf to new one\n"
sleep 1
sudo cp ./gecrator.conf /etc/apache2/sites-avialable
echo "\nDone\n"
sleep 1
echo "\nPutting down previos server\n"
sudo a2dissite 000-default.conf
sleep 1
echo "\nDone\n"
echo "\n Putting up - new server\n"
sudo a2ensite gecrator.conf
sleep 1
echo "\nDone\n"
sleep 1 
echo "\nRebooting Apache server\n"
sudo systemctl reload apache2
echo "\nCreating DataBase"
echo "5"
sleep 1
echo "4"
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1 
echo "input \nCREATE DATABASE wordpress;\nGRANT ALL ON wordpress.* TO 'wordpressuser' IDENTIFIED BY 'Secure1234!';\nquit\nmysql_secure_installation"
sudo mysql -u root


