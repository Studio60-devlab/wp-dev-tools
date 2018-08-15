<?php
// Hide menu items & metaboxes
/*
add_action('admin_menu', function () {
    
    // Remove menus items
    
    remove_menu_page('link-manager.php');
    remove_menu_page('edit-comments.php');
    remove_menu_page('tools.php');

    // Remove submenus items
    
    remove_submenu_page('edit.php', 'edit-tags.php?taxonomy=post_tag');
    remove_submenu_page('plugins.php', 'plugin-editor.php');
    remove_submenu_page('themes.php', 'customize.php');
    remove_submenu_page('themes.php', 'theme-editor.php');
    remove_submenu_page('themes.php', 'widgets.php');

    // Remove widgets from dashboard
    
    remove_action('welcome_panel', 'wp_welcome_panel');
    remove_meta_box('dashboard_activity', 'dashboard', 'side');
    remove_meta_box('dashboard_incoming_links', 'dashboard', 'normal');
    remove_meta_box('dashboard_incoming_links', 'dashboard', 'side');
    remove_meta_box('dashboard_plugins', 'dashboard', 'side');
    remove_meta_box('dashboard_primary', 'dashboard', 'side');
    remove_meta_box('dashboard_quick_press', 'dashboard', 'side');
    remove_meta_box('dashboard_recent_comments', 'dashboard', 'normal');
    remove_meta_box('dashboard_recent_drafts', 'dashboard', 'side');
    remove_meta_box('dashboard_right_now', 'dashboard', 'side');
    remove_meta_box('dashboard_secondary', 'dashboard', 'side');
    remove_meta_box('icl_dashboard_widget', 'dashboard', 'side');

    // Remove widgets from post
    
    remove_meta_box('commentsdiv', 'post', 'side');
    remove_meta_box('cryptx', 'post', 'side');
    remove_meta_box('icl_div_config', 'post', 'side');
    remove_meta_box('revisionsdiv', 'post', 'side');
    remove_meta_box('tagsdiv-post_tag', 'post', 'normal');

    // Remove widgets from pages

    remove_meta_box('icl_div_config', 'page', 'normal');
}, 999);

// Remove elements in the admin bar

add_action('wp_before_admin_bar_render', function () {
    global $wp_admin_bar;
    $wp_admin_bar->remove_menu('comments');
    $wp_admin_bar->remove_menu('updates');
    $wp_admin_bar->remove_menu('wp-logo');
});

// Sanitize file name, remove accents

add_filter('sanitize_file_name', 'remove_accents');

// Callback : Remove unneeded columns

function wp_remove_wp_columns($columns)
{
    unset($columns['comments']);
    unset($columns['tags']);
    return $columns;
}

add_action('admin_init', function () {
    // Remove unneeded columns
    
    add_filter('manage_posts_columns', 'wp_remove_wp_columns');
    add_filter('manage_pages_columns', 'wp_remove_wp_columns');
});

add_action('admin_head', function () {
    //Remove Help tab - !!!!! Should stay in first position in this function
     
    $screen = get_current_screen();
    $screen->remove_help_tabs();

    // Hide updates messages
    
    remove_action('admin_notices', 'update_nag', 3);
});
*/
?>