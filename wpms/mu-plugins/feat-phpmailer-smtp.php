<?php
/*
Plugin Name: PhpMailer SMTP configuration
Description: Allows WordPress to send emails via an SMTP account
Version: 0.0.1
*/
/*
Please, provide these constants in your wp-config.php file :

//PhpMailer configuration
define('PHPMAILER_HOST', '');
define('PHPMAILER_PORT', 25);
define('PHPMAILER_USERNAME', '');
define('PHPMAILER_PASSWORD', '');
*/

add_action('phpmailer_init', function ($phpmailer) {
    $phpmailer->isSMTP();
    $phpmailer->isHTML(true);
    $phpmailer->SMTPAuth = true; // Force it to use Username and Password to authenticate
    $phpmailer->SMTPSecure = "starttls";
    $phpmailer->Host = PHPMAILER_HOST;
    $phpmailer->Port = PHPMAILER_PORT;
    $phpmailer->Username = PHPMAILER_USERNAME;
    $phpmailer->Password = PHPMAILER_PASSWORD;
    $phpmailer->FromName = 'From name';
    $phpmailer->From = "bureauwebstudio@gmail.com";
    $phpmailer->SMTPOptions = array(
        'ssl' => array(
            'verify_peer' => false,
            'verify_peer_name' => false,
            'allow_self_signed' => true
        )
    );
});
