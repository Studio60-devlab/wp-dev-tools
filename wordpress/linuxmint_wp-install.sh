#
#Wordpress MultiSites Lab
#
NOW=$(date +.%d_%h_%Y-%H%M%S)
LOCALHOST=$(echo '127.0.0.1:')
APACHE_PORT=$(cat /etc/apache2/ports.conf | grep ^Listen | tr -d [A-Z][a-z][:space:] | cat)
LOCALHOST_APACHE_ADDRESS=$(echo $LOCALHOST$APACHE_PORT)

#WPADMIN_URL=$(echo /wpms/wp-admin/)
#WPLAB_URL=$(echo /wpms/wp-content/sites/)
#WP_LAB_DIR=$(echo PROJECTS)
WP_LAB_PROJECTS_DIR=$(echo ~/STUDIO60/WP/PROJECTS)
# Database information
DB_USER=$(echo 'admin')
DB_PASS=$(echo 'admin')
DB_HOST=$LOCALHOST
DB_NAME=$(echo 'wpmsdb')
#
# General-purpose Yes/No prompt function
warning(){
	echo "TheStudio60 wplab_new"
	echo -n
	echo "Ce script installe un nouveau site wordpress starter kit"
	echo -n
	echo -n
	sleep 1;
};
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
npm_build () {
cd $WP_LAB_PROJECTS_DIR/$PROJECT ; 
clear ; ls -lash ; sleep 3 ;
#mkdir wp-content/themes/$PROJECT;
#cd wp-content/themes/$PROJECT;
npm  init -y ;
#touch index.php style.css
#mkdir app
npm install --save-dev browser-sync css-mqpacker cssnano gulp gulp-autoprefixer gulp-csso gulp-concat gulp-deporder gulp-imagemin gulp-newer gulp-postcss gulp-sass gulp-strip-debug gulp-uglify gulp-util postcss-assets
##create gulpfile.js
curl https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wpms/gulpfile.js  -o gulpfile.js; 
gulp


#cat gulpfile.js
#ls -lash

};
wp_conf () {
		PROJECT_DIR=$(echo $WP_LAB_PROJECTS_DIR$PROJECT);		
		cd $PROJECT_DIR;
		pwd; sleep 3 ;
		echo -n "";
		echo "Démarrage de la config de Wordpress";
		echo -n "";
		sleep 2;
		clear;

		rm -Rf .DS_Store&&
		#rm -Rf __MACOSX&&
		rm -Rf wp-content/themes/twentyfifteen&&
		rm -Rf wp-content/themes/twentysixteen&&
		#rm -Rf wp-content/themes/twentyseventeen&&		
		rm -Rf wp-content/plugins/hello.php&&
		rm -Rf wp-content/plugins/akismet&&
		rm -Rf wp-config-sample.php

#		curl https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wpms/wp-config_SLAVE_SITE.php -o wp-config-sample.php;
#		sed "s/REPLACE-ME/$PROJECT/g" wp-config-sample.php > wp-config.php;
		rm -Rf wp-config-sample.php

	
#		curl --data "underscoresme_generate=1&underscoresme_name=$PROJECT&underscoresme_slug=S60&underscoresme_author=Studio60&underscoresme_author_uri=http%3A%2F%2F&underscoresme_description=A+custom+theme+for+$PROJECT." http://underscores.me >> theme60.zip;
# curl --data "underscoresme_generate=1&underscoresme_name=S60&underscoresme_slug=S60&underscoresme_author=Studio60&underscoresme_author_uri=http%3A%2F%2F&underscoresme_description=A+custom+theme." http://underscores.me >> theme60.zip

#		unzip theme60.zip; rm theme60.zip ;
#		mv s60 wp-content/themes ;
#		cd wp-content/themes/S60 ;

		rm -Rf .DS_Store ;
		rm -Rf __MACOSX ;
		rm -Rf  readme.txt ;
		rm -Rf LICENSE ;
		rm -Rf README.md;


};
wp_build () {
		echo -n;
		echo "Construction de l'environnement Wordpress...";
		curl https://wordpress.org/latest.zip -o wp.zip;
		unzip -q wp.zip -d wp/ ; 
		#rm -Rf __MACOSX ; 
		rm -Rf .DS_Store ;
		mv wp/wordpress/* $PROJECT ;
		rm -Rf wp; 
		rm -Rf wp.zip; 

		
		echo -n;
		echo "Le nouveau site wordpress $PROJECT a été créé avec succes";
		echo "Le repertoire absolu du nouveau site est $PROJECT_DIR"
		sleep 3 ;
		#### Create the database.
		#WPMS_DB_NAME=$(echo $DEST | sed -e 's/-/_/g')
		#echo "Creating database $DB_NAME..."
		#mysql -u$DB_USER -p$DB_PASS -e"CREATE DATABASE $DB_NAME"
		#echo "Creating database $DB_NAME..."
		#git clone git://github.com/WordPress/WordPress $WP_LAB_PROJECTS_DIR$PROJECT/;
		#wp core config --path=$SITE_PATH/$DEST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --extra-php 
		};
build_project() {
	sleep 1;
	clear
	mkdir $PROJECT;
	echo -n;
	echo "Création du projet $PROJECT...";
	echo -n;

	sleep 1;		
};

run() {
	if [ "$PROJECT" = "" ]; then
		PROJECT=$(echo wplab$NOW) 
		build_project 
		wp_build
		wp_conf
		#npm_build
	else
		build_project
		wp_build
		wp_conf
		#npm_build
	fi
};
do_start() {
	clear
	cd $WP_LAB_PROJECTS_DIR;
	warning
	
	if ask "Voulez vous lancer le script ?" Y; then
		read -p "Entrez le nom du nouveau projet, ne mettez aucun espace ou charactere special : " PROJECT
		
		run

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