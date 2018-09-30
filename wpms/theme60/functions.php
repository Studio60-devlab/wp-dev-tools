<?php
if (is_admin()) {
    require('functions/backend.php');
} else {
    /**
     * Theme constants
     *
     * define the constants used in the theme here
     */
    define('THEME_URI', get_bloginfo('template_url'));
    define('THEME_PATH', __dir__);
    define('DEFAULT_HERO_IMAGE', wp_get_attachment_image_src(get_field('default_hero_image', 'option'), 'full')[0] ?: '');
    define('GMAP_API_KEY', 'AIzaSyDSy5tTJM9s0tfi24wfE4YNrL5atm8tF_U');
    // array of acf flex-contents layouts that must spread accross the whole viewport
    define('FULL_WIDTH_LAYOUTS', []);

    require('functions/frontend.php');
}

/**
 * Include ACF fields
 */
if (function_exists('acf_add_local_field_group')) {
    $acf_files = glob(__dir__.'/functions/acf/*.php');
    foreach ($acf_files as $filename) {
        include $filename;
    }
}

require('functions/functions.php');

/**
 *  Uncomment for WooCommerce usage
 */
//require('functions/woocommerce/wc.init.php');

/**
 * Add theme configuration
 */
add_theme_support('title-tag');
add_theme_support('post-thumbnails');
add_theme_support('cleaner');

if (ENV == 'prod') {
    add_theme_support('google-analytics', 'UA-CODE');
}
