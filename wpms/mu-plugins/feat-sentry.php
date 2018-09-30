<?php
/*
Plugin Name: Sentry
Description: Sends php error reports to Sentry
Version: 0.1
*/

if (getenv('RAVEN_CLIENT') !== false) {
    require_once 'Raven/Autoloader.php';
    Raven_Autoloader::register();

    // get the config string in the Sentry dashboard.
    // it should look something like this :
    $client = new Raven_Client(getenv('RAVEN_CLIENT'));

    // Enable automatic error reporing
    $error_handler = new Raven_ErrorHandler($client);
    $error_handler->registerExceptionHandler();
    $error_handler->registerErrorHandler();
    $error_handler->registerShutdownFunction();
}
