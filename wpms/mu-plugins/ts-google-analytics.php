<?php
/*
Plugin Name: Studio60 Tools - Google Analytics
Description: Add a Google Analytics code. Usage : add_theme_support('google-analytics', 'UA-CODE');
Version: 0.0.1
*/

add_action('after_setup_theme', function () {
    if (current_theme_supports('google-analytics')) {
        add_action('wp_head', function () {
            global $_wp_theme_features;
            $ua_code = $_wp_theme_features['google-analytics'][0];

            echo "
            <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

            ga('create', '".$ua_code."', 'auto');
            ga('send', 'pageview');
            </script>
            ";
        });
    }
}, 100);
