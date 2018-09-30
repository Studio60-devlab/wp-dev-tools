<?php
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
 * Register menus
 */
add_action('init', function () {
    register_nav_menu('header-menu', __('Header Menu'));
});

/**
 *  Add ACF options page
 */
acf_add_options_page();
