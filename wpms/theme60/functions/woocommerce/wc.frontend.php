<?php
/**
 *  Don't load WooCommerce CSS
 */
add_filter('woocommerce_enqueue_styles', '__return_false');

/**
 *  Enqueuing files
 */
add_action('wp_enqueue_scripts', function () {
    wp_register_style('styles', get_bloginfo('template_url') . '/style.css', false, 1);
    wp_enqueue_style('styles');

    /**
     *  We need to ensure that jQuery is registered
     */
    if (! wp_script_is('jquery', 'enqueued')) {
        wp_register_script('jquery');
        wp_enqueue_script('jquery');
    }
});
