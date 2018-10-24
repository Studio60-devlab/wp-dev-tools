# Script pour préparer gulp dans le theme Wordpress
# Constant url (raw) : https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/theme_setup.sh
# Ce script est normalement installé dans ~/htdocs/STUDIO60/WP/PROJECTS/projet/wp-content/themes/studio60-theme/
# © 2018 - theStudio60
# Author : Fabien Dupont
#

CURRUSER=$(echo $USER)

rm -Rf CHANGELOG.md
git init
