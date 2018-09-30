<?php
/**
 *  In order to use this file to register a new content type, follow these steps :
 *    - search and replace __POSTTYPE_MACHINE__ by the singular lowercase machine name of your custom post type
 *    - search and replace __POSTTYPE__ by the singular lowercase name of your custom post type
 *    - search and replace __POSTTYPEs__ by the plural lowercase name of your custom post type
 *    - uncomment the add_action function below
 *
 *  Then you can delete this comment block.
 */

/**
 *  Registering __POSTTYPE__ post type
 */
/*
add_action('init', function () {
    register_post_type('__POSTTYPE_MACHINE__', array(
        'label'                 => '__POSTTYPEs__',
        'labels'                => array(
            'name'                  => '__POSTTYPEs__',
            'singular_name'         => '__POSTTYPE__',
        ),
        'supports'              => array( 'title', 'editor', 'thumbnail', ),
        'taxonomies'            => array( 'category' ),
        'hierarchical'          => true,
        'public'                => true,
        'show_in_menu'          => true,
        'show_in_admin_bar'     => false,
        'has_archive'           => true,
        'capability_type'       => 'page',
        //'rewrite'               => array('slug' => '[MY_SLUG]')
    ));
});
*/

/**
 *  Registering Fields
 */
/*
add_action('wp_loaded', function () {
    acf_add_local_field_group([
        'key' => 'group_cpt-__POSTTYPE_MACHINE__',
        'title' => '__POSTTYPE__',
        'fields' => [
            // register array of ACF fields here
            // the key MUST follow this pattern : field_[posttype machine name]_[field_name]
            // the name MUST follow this partern : [posttype machine name]_[field_name]
            //
            // the key of a subfield MUST follow this pattern : field_[posttype machine name]_[parent_field_name]_[field_name]
            // the name of a subfield MUST follow this partern : [field_name]
            // here is a minimal example :
            [
                'key' => 'field_test_name',
                'name' => 'test_name',
                'label' => 'Name',
                'type' => 'text',
            ]
        ],
        'location' => [
            [
                [
                    'param' => 'post_type',
                    'operator' => '==',
                    'value' => '__POSTTYPE_MACHINE__',
                ],
            ],
        ],
        'menu_order' => 0,
        'position' => 'normal',
        'style' => 'default',
        'label_placement' => 'top',
        'instruction_placement' => 'label',
        'hide_on_screen' => '',
        'active' => 1,
        'description' => '',
    ]);
}, 100);
*/
