#Avant d'utiliser ce script comme un barbare


#il faut le mettre dans /var/www/html/WP/
#
#
TIME=$(date +%d%h%Y%H%M%S)
LOCALHOST=$(echo '127.0.0.1:')
APACHE_PORT=$(cat /etc/apache2/ports.conf | grep ^Listen | tr -d [A-Z][a-z][:space:] | cat)
LOCALHOST_APACHE_ADDRESS=$(echo $LOCALHOST$APACHE_PORT)
DEST=${PWD##*/}
SAFE_DEST=$(echo $DEST | sed -e 's/-/_/g')
WP_LAB_PROJECTS_DIR=$(echo /var/www/html/WP/PROJECTS)

# General-purpose Yes/No prompt function
ask() {
	while true; do
		if [ "${2:-}" = "Y" ]; then
			prompt="Y/n"
			default=Y
		elif [ "${2:-}" = "N" ]; then
			prompt="y/N"
			default=N
		else
			prompt="y/n"
			default=
		fi
		# Ask the question
		echo
		read -p "$1 [$prompt] > " REPLY
		# Default?
		if [ -z "$REPLY" ]; then
			REPLY=$default
		fi
		# Check if the reply is valid
		case "$REPLY" in
			Y*|y*) return 0 ;;
			N*|n*) return 1 ;;
		esac
	done
};
wp_136pro_dl() {
	curl --silent https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wordpress/PLUGINS/136PRO.zip -o acf-pro.zip -C - &&
	extract acf-pro.zip &&
	rm -Rf acf-pro.zip
}
wp_theme_dl() {
	curl --silent https://codeload.github.com/html5blank/html5blank/zip/stable -o studio60-theme.zip -C - && 
	extract studio60-theme.zip && rm -Rf studio60-theme.zip &&
	mv html5blank-stable studio60-theme
}
wp_conf () {
	PROJECT_DIR=$(echo $WP_LAB_PROJECTS_DIR/$PROJECT);			
	BASE_URL="http://localhost/WP/PROJECTS/$PROJECT"
	
	wpcli core download --path=$PROJECT_DIR --locale=en_GB
	wpcli core config --path=$PROJECT_DIR --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS 
	wpcli core install --path=$PROJECT_DIR --url=$BASE_URL --title=$PROJECT --admin_user=test --admin_password=test --admin_email=mail@monentreprise.com

	echo
	echo "* Download and activate french"
	wpcli core language install fr_FR --activate --path=$PROJECT_DIR

	echo
	echo "* Delete unused plugins"
	wpcli plugin delete hello akismet --path=$PROJECT_DIR

	echo
	echo "* Activate ACFPRO"
	#download acf
	wp_136pro_dl && mv advanced-custom-fields-pro $PROJECT_DIR/wp-content/plugins &&
	wpcli plugin activate advanced-custom-fields-pro --path=$PROJECT_DIR
	
	echo
	echo "* Delete initial content"
	wpcli post delete 1 2 --force --path=$PROJECT_DIR

	echo
	echo " - ask robots to not index this website"
	wpcli option update blog_public false --path=$PROJECT_DIR

	echo
	echo " - set default media link type to file"
	wpcli option update image_default_link_type file --path=$PROJECT_DIR

	echo
	echo " - disable year/month folders for uploads"
	wpcli option update uploads_use_yearmonth_folders false --path=$PROJECT_DIR
	
	echo
	echo " - set GMT offset to 1"
	wpcli option update gmt_offset 1 --path=$PROJECT_DIR

	echo
	echo " - disable smilies"
	wpcli option update use_smilies false --path=$PROJECT_DIR
	
	echo
	echo " - disable pings"
	wpcli option update default_ping_status false --path=$PROJECT_DIR
	wpcli option update default_pingback_flag false --path=$PROJECT_DIR

	echo	
	echo " - empty ping sites"
	wpcli option update ping_sites '' --path=$PROJECT_DIR

	echo
	echo " - disable comments"
	wpcli option update default_comment_status false --path=$PROJECT_DIR

	echo
	echo " - empty slogan"
	wpcli option update blogdescription '' --path=$PROJECT_DIR

	echo	
	echo " - set medium image size to 768px max"
	wpcli option update medium_size_w 768 --path=$PROJECT_DIR
	wpcli option update medium_size_h 768 --path=$PROJECT_DIR

	echo
	echo "* Configure folders rights"
	chmod 777 -R $PROJECT_DIR/wp-content/uploads

	echo
	echo "* Activate the theme and delete base themes"
		
	#download the theme
	wp_theme_dl&&
	mv studio60-theme $PROJECT_DIR/wp-content/themes
	wpcli theme activate studio60-theme --path=$PROJECT_DIR
	wpcli theme delete twentyfifteen twentysixteen twentyseventeen --path=$PROJECT_DIR
	echo
	echo "***"

#echo "* Install is now done. Run 'yarn start' to start the dev server."
echo "* You can log into the website with the following user :"
echo "* User : test"
echo "* Pass : test"
echo "***"
}
db_build() {
	# Database information
	DB_USER="root"
	DB_PASS="root"
	DB_HOST="localhost"
	DB_NAME=$(echo $PROJECT | sed -e 's/-/_/g')
	echo;
	echo "Création de la base de données $DB_NAME ...";
	echo;
	echo "Entrez le mot de passe (generalement root)";
	echo;
	mysql -u $DB_USER -p -e"CREATE DATABASE $DB_NAME" ; 
	echo
};
build_project() {
	echo -n;
	echo "Création du projet $PROJECT...";
	sleep 2;clear
	mkdir $WP_LAB_PROJECTS_DIR/$PROJECT;
	};
extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.zip)       unzip $1       ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
}
do_start() {
	clear
	#cd $WP_LAB_PROJECTS_DIR;
	if ask "Voulez vous lancer le script ?" Y; then
		read -p "Entrez le nom du nouveau projet, ne mettez aucun espace ou charactere special : " PROJECT
		if [ "$PROJECT" = "" ]; then
			PROJECT=$(echo PROJET_$TIME) 
			build_project 
			db_build
			wp_conf
			#npm_build
		else
			build_project
			db_build
			wp_conf
			#npm_build
		fi
	else
		echo 'bye'
	fi
};
case "$1" in
	start)
		do_start
	;;
	*)
		echo "Usage: $0 {start}" >&2
		exit 3
	;;
esac
exit 0