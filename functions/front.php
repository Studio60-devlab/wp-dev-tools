<?php
/**
 *  Enqueue files
 *  Your CSS and JS files goes here
 */
add_action('wp_enqueue_scripts', function () {
    wp_register_style('styles', THEME_URI.'/style.css', false, 1);
    wp_enqueue_style('styles');

//    wp_deregister_script('wp-embed');

});

///JS
function theme_js() {
//		global $wp_scripts;
		wp_enqueue_script('jquery', get_template_directory_uri() . '/assets/js/vendor/jquery-slim.min.js' );
		wp_enqueue_script( 'bootstrap_js', get_template_directory_uri() . '/assets/js/bootstrap.js' );
		wp_enqueue_script( 'popper_js', get_template_directory_uri() . '/assets/js/vendor/popper.min.js');
		wp_enqueue_script( 'anchor_js', get_template_directory_uri() . '/assets/js/vendor/anchor.min.js');
		wp_enqueue_script( 'clipboard_js', get_template_directory_uri() . '/assets/js/vendor/clipboard.min.js');
		wp_enqueue_script( 'holder_js', get_template_directory_uri() . '/assets/js/vendor/holder.min.js');
		wp_enqueue_script( 'pay_js', get_template_directory_uri() . '/assets/js/vendor/pay.js');
        
        //wp_enqueue_script( 'my_custom_js', get_template_directory_uri() . '/assets/js/scripts.js');
	}
	add_action( 'wp_enqueue_scripts', 'theme_js');
?>
<?php 
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
?>
