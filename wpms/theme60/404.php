<?php get_header(); ?>
    <div class="container">
        <h1><?= __("Page not found"); ?></h1>
        <p><?= sprintf(__("It looks like nothing was found at this location. Maybe try visiting %s directly?"), '<a href="'.get_home_url().'">'.get_home_url().'</a>') ?></p>
    </div>
<?php get_footer(); ?>
