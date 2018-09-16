#
#Wordpress MultiSites Lab
#
NOW=$(date +_%d_%h_%Y_%H%M%S)
LOCALHOST=$(echo '127.0.0.1:')
APACHE_PORT=$(cat /Applications/MAMP/conf/apache/httpd.conf | grep ^Listen | tr -d [A-Z][a-z][:space:] | cat)
LOCALHOST_APACHE_ADDRESS=$(echo $LOCALHOST$APACHE_PORT)
#
WPADMIN_URL=$(echo /wpms/wp-admin/)
WPLAB_URL=$(echo /wpms/wp-content/sites/)
WPLAB_DIR=$(echo /Applications/MAMP/htdocs/wpms/wp-content/sites/)

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
		npm init && npm install gulp --save-dev;
		pwd ; ls -lash
};
wp_conf () {		
		#clear;
		#DIR=$(head -n 1 wplab_tmp;)
		#cd DIR;
		sleep 1;
		echo -n "";
		echo "Démarrage de la config de Wordpress";
		echo -n "";
		sleep 2;
		clear;
		echo "Cleaning";
		echo -n "";
		sleep 2;
		clear;
		rm -Rf .DS_Store&&
		rm -Rf __MACOSX&&
		rm -Rf wp-content/themes/twentyfifteen&&
		rm -Rf wp-content/themes/twentysixteen&&
		rm -Rf wp-content/plugins/hello.php&&
		rm -Rf wp-content/plugins/akismet&&
		rm -Rf wp-config-sample.php

		clear;
		echo "Nettoyage terminé"
		sleep 1 ;
		echo "configuration de wp-config.php"
		sleep 1 ;

		curl https://raw.githubusercontent.com/theStudio60/webdev-tools/master/wpms/wp-config_SLAVE_SITE.php -o wp-config-sample.php;

		sed "s/REPLACE-ME/$CHOICE/g" wp-config-sample.php > wp-config.php;

		rm -Rf wp-config-sample.php
		
		ls
		wp config path&&
		wp config --dbname=$DB_NAME;

		

};
wp_build () {

		echo -n;
		echo "Construction de l'environnement Wordpress...";
		sleep 1;
		echo -n;
		echo "téléchargement de Wordpress";
		sleep 1;
		echo "debug";cp ~/Dev/wp.zip wp.zip 

		#curl https://wordpress.org/latest.zip -o wp.zip;
		clear;	
		echo "decompression de Wordpress";
		sleep 1;
		unzip -q wp.zip -d wp/ ; 
		rm -Rf __MACOSX ; 
		rm -Rf .DS_Store ;
		mv wp/wordpress/* $CHOICE;
		rm -Rf wp; 
		rm -Rf wp.zip; 
		WPLAB_SITE=$(echo $WPLAB_DIR$CHOICE/);
		
		echo -n;
		echo "Le nouveau site wordpress $CHOICE a été créé avec succes";
		echo "Le repertoire absolu du nouveau site est $WPLAB_SITE"
		cd $WPLAB_SITE;
		wp_conf
		# Create the database.
		#WPMS_DB_NAME=$(echo $DEST | sed -e 's/-/_/g')
		#echo "Creating database $DB_NAME..."
		#mysql -u$DB_USER -p$DB_PASS -e"CREATE DATABASE $DB_NAME"
		#echo "Creating database $DB_NAME..."
		#git clone git://github.com/WordPress/WordPress $WPLAB_DIR$CHOICE/;
		#wp core config --path=$SITE_PATH/$DEST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --extra-php 
		};
build_project() {
	sleep 1;
	clear
	mkdir $CHOICE;
	echo -n;
	echo "Création du site $CHOICE...";
	echo -n;

	sleep 1;		
};

choose_project_name() {
	if [ "$CHOICE" = "" ]; then
		CHOICE=$(echo wplab$NOW) 
		build_project && wp_build 
		#&& gulp_build
	else
		
		build_project && wp_build 
		# && gulp_build
	fi
};
do_start() {
	clear
	cd $WPLAB_DIR;
	warning
	
	if ask "Voulez vous lancer le script ?" Y; then
		read -p "Entrez le nom du nouveau projet, ne mettez aucun espace ou charactere special : " CHOICE
		
		choose_project_name

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