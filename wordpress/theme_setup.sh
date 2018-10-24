# Script pour préparer gulp dans le theme Wordpress
# Constant url (raw) : https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/theme_setup.sh
#
# Ce script est normalement installé dans ~/htdocs/STUDIO60/WP/PROJECTS/projet/wp-content/themes/studio60-theme/
# Il est appelé par l'installateur de wordpress
# © 2018 - theStudio60
# Author : Fabien Dupont
THEME_DIR=$(pwd)
echo 'theme directory is $THEME_DIR';


trash(){
  mv LICENSE trash/
  mv README.md trash/
  mv readme.txt trash/
};
node_init(){
#  git init -q
  npm init -y
};
gulp_dl(){
  curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/gulp/gulpfile.js > Gulpfile.js
  npm install gulp gulp-sass gulp-autoprefixer gulp-newer gulp-imagemin browser-sync gulp-concat gulp-uglify gulp-sourcemaps gulp-watch --save-dev

};

mkdir trash/
trash &&
node_init &&
gulp_dl
