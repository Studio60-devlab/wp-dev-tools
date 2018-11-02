# studio60 -
# Script pour configurer un nouveau projet hugo
# Ce script a été copié/téléchargé par l'installeur hugo-install.sh
# © 2018 - theStudio60
# Author : Fabien Dupont
#
mkdir layouts/_default
mkdir layouts/partials

echo "* téléchargement de config.toml"
echo
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/hugo/config.toml > config.toml
clear

echo "* téléchargement de archetypes_default.md"
echo
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/hugo/archetypes/default.md > archetypes/default.md
clear


echo "* téléchargement des layouts"
echo
touch layouts/404.html
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/hugo/layouts/index.html > layouts/index.html

curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/hugo/layouts/_default/list.html > layouts/_default/list.html
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/hugo/layouts/_default/single.html > layouts/_default/single.html

curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/hugo/layouts/partials/article.html > layouts/partials/article.html
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/hugo/layouts/partials/footer.html > layouts/partials/footer.html
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/hugo/layouts/partials/header.html > layouts/partials/header.html
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/hugo/layouts/partials/pagination.html > layouts/partials/pagination.html
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/hugo/layouts/partials/sidebar.html > layouts/partials/sidebar.html
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/hugo/layouts/partials/summary.html > layouts/partials/summary.html
clear

echo "* téléchargement de gulpfile.js"
echo
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/hugo/gulpfile.js > gulpfile.js
clear



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

#npm goes here



echo "build :"
echo "gulp build"
echo "hugo"
