# Script pour préparer gulp dans le theme Wordpress
# Constant url (raw) : https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/theme_setup.sh
#
# Ce script est normalement installé dans ~/htdocs/STUDIO60/WP/PROJECTS/projet/wp-content/themes/studio60-theme/
# Il est appelé par l'installateur de wordpress
# © 2018 - theStudio60
# Author : Fabien Dupont
clear;
cat designer.info
sleep 5 ;

mkdir trash/
  mv LICENSE trash/
  mv README.md trash/
  mv readme.txt trash/

clear;

echo
echo "* Maintenant Node entre en scene..."
echo
#  git init -q
  npm init -y

  echo
  echo "* Téléchargement du gulpfile.js"
  echo
  curl https://raw.githubusercontent.com/theStudio60/webdev-tools/master/gulp/gulpfile.js > gulpfile.js
#  npm install gulp gulp-sass gulp-autoprefixer gulp-newer gulp-imagemin browser-sync gulp-concat gulp-uglify gulp-sourcemaps gulp-watch --save-dev
