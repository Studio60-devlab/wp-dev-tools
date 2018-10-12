#Script d'installation d'environnement
#dev web sur ubuntu et mint
#theStudio60 - fdlab
#
cd ~/;
clear;
echo 'theStudio60 - DevLab setup';sleep 3; 
clear;
curl https://raw.githubusercontent.com/theStudio60/webdev-tools/master/linuxmint/bashrc.txt > .bashrc && 
source ~/.bashrc
mkdir STUDIO60/PREPROD
mkdir STUDIO60/HUGO
mkdir STUDIO60/RESOURCES
mkdir STUDIO60/VECTORS
