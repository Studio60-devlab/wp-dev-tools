<?php
acf_add_local_field_group([
    'key' => 'group_58889e644ac1f',
    'title' => 'Options',
    'fields' => [
        [
            'key' => 'field_5891b98c25170',
            'label' => 'Images par défaut',
            'name' => '',
            'type' => 'tab',
        ],
        [
            'return_format' => 'id',
            'library' => 'all',
            'key' => 'field_58889e6e0ccad',
            'label' => 'Image d\'entête par défaut',
            'name' => 'default_hero_image',
            'type' => 'image',
        ],
    ],
    'location' => [
        [
            [
                    'param' => 'options_page',
                    'operator' => '==',
                    'value' => 'acf-options',
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
