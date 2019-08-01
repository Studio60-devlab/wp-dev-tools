# Script pour préparer gulp dans le theme Wordpress
# Constant url (raw) : https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/theme_setup.sh
#
# Ce script est normalement installé dans ~/htdocs/STUDIO60/WP/PROJECTS/projet/wp-content/themes/studio60-theme/
# Il est appelé par l'installateur de wordpress
# © 2018 - theStudio60
# Author : Fabien Dupont
sleep 5 ;

clear;

mkdir assets/
mkdir assets/images/
mkdir assets/images/original/

mkdir assets/js/
mkdir assets/js/dev/
mkdir assets/js/dist/

mkdir assets/sass/



curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/bootstrap_reset/main.scss > assets/sass/style.scss
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/bootstrap_reset/color_system.scss > assets/sass/color_system.scss
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/bootstrap_reset/custom_variables.scss > assets/sass/custom_variables.scss
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/bootstrap_reset/geometry_system.scss > assets/sass/geometry_system.scss
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/bootstrap_reset/typography_system.scss > assets/sass/typography_system.scss


mkdir trash/
  mv LICENSE trash/
  mv README.md trash/
  mv readme.txt trash/
  mv sass/ trash/
  mv layouts/ trash/
  mv js/ trash/
  mv woocommerce.css trash/

git init -q
touch .gitignore
echo "designer.info" >> .gitignore
echo >> .gitignore

echo "node_modules" >> .gitignore
echo >> .gitignore

echo
echo "* Maintenant Node entre en scene..."
echo
npm init -y
npm install gulp gulp-sass gulp-autoprefixer gulp-newer gulp-imagemin browser-sync gulp-concat gulp-uglify gulp-sourcemaps gulp-watch bootstrap-sass magnific-popup --save-dev
echo
echo "* Taper gulp pour lancer le serveur dev"
echo
