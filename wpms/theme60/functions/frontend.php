<?php
/**
 *  Enqueue files
 *  Your CSS and JS files goes here
 */
add_action('wp_enqueue_scripts', function () {
    wp_register_style('styles', THEME_URI.'/style.css', false, 1);
    wp_enqueue_style('styles');

    wp_deregister_script('wp-embed');

    wp_register_script('libs', THEME_URI.'/main-libs.js', ['jquery'], null, true);
    wp_enqueue_script('libs');

    if (ENV == 'prod' || ENV == 'stage') {
        wp_register_script('raven', THEME_URI.'/raven.js', null, null, true);
        wp_enqueue_script('raven');
    }

    wp_register_script('scripts', THEME_URI.'/main.js', null, null, true);
    wp_enqueue_script('scripts');
    wp_localize_script('scripts', 'Config', [
        'admin_ajax_url' => admin_url('admin-ajax.php'),
    ]);
});

/**
 *  Removing the admin bar
 */
add_filter('show_admin_bar', '__return_false');

/**
 *  Remove login logo
 */
add_action('login_enqueue_scripts', function () {
    echo '
    <style type="text/css">
        #login h1 a {
            background-image: none;
            width:100%;
            padding-bottom: 30px;
        }
    </style>';
});

add_filter('login_headerurl', 'get_home_url');
add_filter('login_headertitle', '__return_empty_string');

/**
 * Display flex contents
 */
add_action('display_flex_content', function ($flex_contents) {
    if (empty($flex_contents)) {
        return false;
    }

    foreach ($flex_contents as $flex) {
        if (in_array($flex['acf_fc_layout'], FULL_WIDTH_LAYOUTS)) {
            echo '</div>';
        }

        set_query_var('fields', $flex);
        get_template_part('partials/flex/'.$flex['acf_fc_layout']);

        if (in_array($flex['acf_fc_layout'], FULL_WIDTH_LAYOUTS)) {
            echo '<div class="container">';
        }
    }
});
