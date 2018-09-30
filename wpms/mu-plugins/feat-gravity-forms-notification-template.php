<?php
/**
 * GravityForms mail template
 */
add_filter('gform_notification', function ($notification, $form, $entry) {
    $email = new S60\HTMLMail();
    
    $notification['message'] = $email->set('message', $notification['message'])
        ->set('footer', 'Site name, maybe an address ?')
        ->getTemplate();

    return $notification;
}, 99, 3);
