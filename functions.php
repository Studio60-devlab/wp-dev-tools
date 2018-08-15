
<?php
if (is_admin()) {
	require('functions/back.php');
} else {
	/**
	* Theme constants
	*
	* define the constants used in the theme here
	*/
	//define('THEME_URI', get_bloginfo('template_url'));
	//define('THEME_PATH', __dir__);
    //define('DEFAULT_HERO_IMAGE', wp_get_attachment_image_src(get_field('default_hero_image', 'option'), 'full')[0] ?: '');
    //define('GMAP_API_KEY', 'AIzaSyDSy5tTJM9s0tfi24wfE4YNrL5atm8tF_U');
		
	// array of acf flex-contents layouts that must spread accross the whole viewport
    //define('FULL_WIDTH_LAYOUTS', []);
	require('functions/front.php');
}
/**
 *  Remove all widgets, saving db queries
 */
add_action('widgets_init', function () {
 
    unregister_widget('WP_Widget_Pages');
    unregister_widget('WP_Widget_Calendar');
    unregister_widget('WP_Widget_Archives');
    unregister_widget('WP_Widget_Links');
    unregister_widget('WP_Widget_Meta');
    unregister_widget('WP_Widget_Search');
    unregister_widget('WP_Widget_Text');
    unregister_widget('WP_Widget_Categories');
    unregister_widget('WP_Widget_Recent_Posts');
    unregister_widget('WP_Widget_Recent_Comments');
    unregister_widget('WP_Widget_RSS');
    unregister_widget('WP_Widget_Tag_Cloud');
    unregister_widget('WP_Nav_Menu_Widget');

}, 1);
/**
 * register Menu
*/
 	require get_template_directory() . '/inc/class-wp-bootstrap-navwalker.php';
	add_action('init', function () {
    	register_nav_menus( array('primary' => __( 'Primary Menu', 'WP_Bootstrap' ),) );
	});
/**
 * Include ACF fields
 */
if (function_exists('acf_add_local_field_group')) {
    $acf_files = glob(__dir__.'/functions/acf/*.php');
    foreach ($acf_files as $filename) {
        include $filename;
    }
}
?>