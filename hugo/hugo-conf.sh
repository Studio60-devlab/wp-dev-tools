# studio60 -
# Script pour configurer un nouveau projet hugo
# Ce script a été copié/téléchargé par l'installeur hugo-install.sh
# © 2018 - theStudio60
# Author : Fabien Dupont
#
ls

curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/hugo/config.toml > config.toml

touch archetypes/default.md

#mkdir layouts/_default
#touch layouts/index.html
#touch layouts/404.html


git init -q
touch .gitignore
echo "designer.info" >> .gitignore
echo >> .gitignore
echo "hugo-conf.sh" >> .gitignore
echo >> .gitignore
echo "gulpfile.js" >> .gitignore
echo >> .gitignore
echo "node_modules" >> .gitignore
echo >> .gitignore
echo "public/" >> .gitignore
echo >> .gitignore
echo "static/" >> .gitignore
echo >> .gitignore



#build :
# gulp build
# hugo
