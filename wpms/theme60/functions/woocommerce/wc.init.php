<?php
/**
 *  Make this theme supports WooCommerce
 */
add_action('after_setup_theme', function () {
    add_theme_support('woocommerce');
});

if (is_admin()) {
} else {
    require('wc.frontend.php');
}
