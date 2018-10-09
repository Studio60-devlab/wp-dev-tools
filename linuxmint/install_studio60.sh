#Script d'installation d'environnement
#developpeur web sur linux mint
#theStudio60 - fdlab
#

cd ~/; 
mkdir STUDIO60/PREPROD
mkdir STUDIO60/HUGO
mkdir STUDIO60/WP/DEV
mkdir STUDIO60/WP/STAGE
mkdir STUDIO60/RESOURCES
mkdir STUDIO60/VECTORS


clear;
echo 'theStudio60 - linux mint setup';sleep 3; 
clear

echo
sudo apt-get update &&
clear ;
echo ' Install Tools ';sleep 3;
sudo apt-get install -y build-essential terminator bleachbit htop vim git git-hub &&
clear ;
echo ' Install google chrome';sleep 3; 
curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o gc.deb -C - && sudo gdebi gc.deb && rm -Rf gc.deb ;
clear ;
echo ' setup Visual studio code';sleep 3; 
curl https://az764295.vo.msecnd.net/stable/f46c4c469d6e6d8c46f268d1553c5dc4b475840f/code_1.27.2-1536736588_amd64.deb -o VSCODE.deb -C - && sudo gdebi VSCODE.deb && rm -Rf VSCODE.deb ;
clear ;
echo 'install hugo';sleep 3; 
sudo apt-get install -y hugo
clear ;
echo 'setup nodejs';sleep 3; 
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
clear; 
echo 'setup gulp';sleep 3; 
sudo npm install -g gulp gulp-cli && 
clear; 
echo 'setup yarn';sleep 3; 
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

clear;
echo '1ere phase terminée';sleep 3; 
clear;
echo 'installation environnement apache php mariadb';sleep 3; 
clear; 


echo 'setup APACHE';sleep 3; 
sudo apt-get install -y apache2 && 
sudo service apache2 restart &&
clear;
echo 'apache est installé ';
echo 'CHECK : firefox http://localhost';sleep 3; 

clear;
echo 'setup MARIADB - attention au password';sleep 3; 
sudo apt-get install -y mariadb-server mariadb-client &&
sudo mysql_secure_installation &&
clear &&
echo 'mariadb est installé ';sleep 3; 

clear;
echo 'setup PHP';sleep 3; 
sudo apt-get install -y php libapache2-mod-php7.0  &&
clear &&
echo 'PHP est installé ';sleep 3; 

clear;
echo 'setup privileges';sleep 3; 

chmod 777 /var/www/html -R ; 
touch /var/www/html/phpinfo.php ;
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php ;
service apache2 restart ;

clear;
echo 'CHECK : firefox http://localhost/phpinfo.php ';sleep 3; 

clear;
echo 'phpmyadmin';sleep 3; 
sudo apt-get install -y phpmyadmin
echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf ;
service apache2 restart ; 
echo 'CHECK : firefox http://localhost/phpmyadmin'
clear; 

echo 'setup wpcli';sleep 3; 
curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output wpcli ;
chmod 755 wpcli && mv wpcli /usr/bin/ ;
echo "use it : su - username && wpcli core download" ; sleep 4 ;clear
rm -Rf wpcli;
service apache2 restart ;

clear; 

echo 'presque fini';sleep 3;

