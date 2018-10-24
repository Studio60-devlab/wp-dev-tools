# Script pour préparer gulp dans le theme Wordpress
# Constant url (raw) : https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/theme_setup.sh
#
# Ce script est normalement installé dans ~/htdocs/STUDIO60/WP/PROJECTS/projet/wp-content/themes/studio60-theme/
# Il est appelé par l'installateur de wordpress
# © 2018 - theStudio60
# Author : Fabien Dupont
echo "Avant de commencer"
echo "régler proxy_url du gulpfile"
cat proxy_url.info

cat designer.info

sleep 5 ;

clear;

mkdir assets/

mkdir assets/images/
mkdir assets/images/original/

mkdir assets/js/
mkdir assets/js/dev/
mkdir assets/js/dist/

mkdir assets/sass/
mkdir assets/sass/_partials/

touch assets/sass/style.scss


mkdir trash/
  mv LICENSE trash/
  mv README.md trash/
  mv readme.txt trash/

  mv sass/ trash/
  mv layouts/ trash/
  mv js/ trash/

git init -q
touch .gitignore
echo "designer.info" >> .gitignore
echo >> .gitignore

echo "proxy_url.info" >> .gitignore
echo >> .gitignore

echo "node_modules" >> .gitignore
echo >> .gitignore

echo
echo "* Maintenant Node entre en scene..."
echo
npm init -y
npm install gulp gulp-sass gulp-autoprefixer gulp-newer gulp-imagemin browser-sync gulp-concat gulp-uglify gulp-sourcemaps gulp-watch --save-dev

gulp
