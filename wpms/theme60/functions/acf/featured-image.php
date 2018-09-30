<?php
acf_add_local_field_group([
    'key' => 'group_58aefb1b970d6',
    'title' => 'Positionnement de l\'image à la Une',
    'fields' => [
        [
            'key' => 'field_58aefb31ef303',
            'label' => 'Positionnement horizontal',
            'name' => 'h_pos',
            'type' => 'radio',
            'choices' => [
                'top' => 'Haut',
                'center' => 'Centre',
                'bottom' => 'Bas',
            ],
            'default_value' => 'center',
        ],
        [
            'key' => 'field_58aefb84ef304',
            'label' => 'Positionnement vertical',
            'name' => 'v_pos',
            'type' => 'radio',
            'choices' => [
                'left' => 'Gauche',
                'center' => 'Centre',
                'right' => 'Droit',
            ],
            'default_value' => 'center',
        ],
    ],
    'location' => [
        [
            [
                'param' => 'post_type',
                'operator' => '==',
                'value' => 'post',
            ],
        ],
        [
            [
                'param' => 'post_type',
                'operator' => '==',
                'value' => 'page',
            ],
        ],
    ],
    'menu_order' => 0,
    'position' => 'side',
    'style' => 'default',
    'label_placement' => 'top',
    'instruction_placement' => 'label',
    'hide_on_screen' => '',
    'active' => 1,
    'description' => '',
]);
