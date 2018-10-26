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
mkdir assets/sass/flex/
mkdir assets/sass/layout/
mkdir assets/sass/partials/

curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/gulp/assets/sass/style.scss > assets/sass/style.scss
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/gulp/assets/sass/_variables.scss > assets/sass/_variables.scss
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/gulp/assets/sass/_styles.scss > assets/sass/_styles.scss
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/gulp/assets/sass/_base.scss > assets/sass/_base.scss

curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/gulp/assets/sass/flex/_content.scss > assets/sass/flex/_content.scss
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/gulp/assets/sass/flex/_cta.scss > assets/sass/flex/_cta.scss
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/gulp/assets/sass/flex/_gallery.scss > assets/sass/flex/_gallery.scss
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/gulp/assets/sass/flex/_video.scss > assets/sass/flex/_video.scss

curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/gulp/assets/sass/layout/_footer.scss > assets/sass/layout/_footer.scss
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/gulp/assets/sass/layout/_header.scss > assets/sass/layout/_header.scss
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/gulp/assets/sass/layout/_menu.scss > assets/sass/layout/_menu.scss

curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/gulp/assets/sass/partials/_btn.scss > assets/sass/partials/_btn.scss
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/gulp/assets/sass/partials/_hero.scss > assets/sass/partials/_hero.scss
curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/gulp/assets/sass/partials/_tile.scss > assets/sass/partials/_tile.scss


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

echo "node_modules" >> .gitignore
echo >> .gitignore

echo
echo "* Maintenant Node entre en scene..."
echo
npm init -y
npm install gulp gulp-sass gulp-autoprefixer gulp-newer gulp-imagemin browser-sync gulp-concat gulp-uglify gulp-sourcemaps gulp-watch --save-dev
echo
echo "* Taper gulp pour lancer le serveur dev"
echo
