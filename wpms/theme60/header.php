<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui" />
    <link rel="icon" type="image/png" href="<?php THEME_URI ?>/images/favicon.png" />
    <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
    <header class="header">
        <div class="container">
            <div class="header__container">
                <a class="header__logo" href="<?= get_home_url() ?>">
                    <img src="<?= THEME_URI ?>/images/logo.svg" alt="<?= get_bloginfo() ?>">
                </a>
                <?php
                wp_nav_menu(array( 'theme_location' => 'header-menu', 'container_class' => 'header__menu', 'walker' => new Walker_Main_Menu()));
                
                //uncomment if WPML is needed
                //get_template_part('partials/language_switcher');
                ?>
                <div class="header__burger" data-target=".pop">
                    <i></i>
                    <i></i>
                    <i></i>
                </div>
            </div>
        </div>
    </header>
