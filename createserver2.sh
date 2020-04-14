yes | sudo cp -r ./php.ini /etc/php/7.2/apache2/php.ini
echo "\nPHP file replaced"
sleep 1
echo "\nStarting Apache creation"
sleep 1
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
echo "\nRemoving latest.tar.gz\n"
sleep 1
yes | sudo rm latest.tar.gz
echo "\nCopying wordpress to /var/www/html\n"
sleep 1
yes | sudo mv wordpress/* /var/www/html/
echo "\nDone\n"
sleep 1
yes | sudo rm -r /home/gecrator/CreateServer/wordpress
echo "\nwordpress folder from CreateServer/ deleted\n"
yes | sudo rm -r /var/www/html/index.html
echo "\nCopying wp-config.php file to /var/www/html/wordpress/""
sleep 2
yes | sudo cp ./wp-config.php /var/www/html/wordpress/
echo "\nDone\n"
sleep 1
echo "Deleting sample config file (wp-config-sample.php)"
yes | sudo rm -r /var/ww/html/wordpress/wp-config-sample.php
echo "Done" 
sleep 1 


