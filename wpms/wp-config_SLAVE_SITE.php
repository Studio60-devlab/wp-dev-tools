<?php
/**
 * wp-config.php of website of studio60 local wp multi-site environment 
 * SETUP : uncomment line $table_prefix & replace REPLACE-ME with the name of your site.
 * Ex: $table_prefix  = 'wp_mysuperwebsite_';
 * Then, of course, rename this file to wp-config.php
 * 
 */
define('DB_NAME', 'wpmsdb');
define('DB_USER', 'admin');
define('DB_PASSWORD', 'admin');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
define('AUTH_KEY',         'put your unique phrase here');
define('SECURE_AUTH_KEY',  'put your unique phrase here');
define('LOGGED_IN_KEY',    'put your unique phrase here');
define('NONCE_KEY',        'put your unique phrase here');
define('AUTH_SALT',        'put your unique phrase here');
define('SECURE_AUTH_SALT', 'put your unique phrase here');
define('LOGGED_IN_SALT',   'put your unique phrase here');
define('NONCE_SALT',       'put your unique phrase here');
//$table_prefix  = 'wp_REPLACE-ME_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');
