<?php
$fields = get_query_var('fields', false);

if (!empty($fields['image_url'])) {
    ?>
    <div class="hero" style="background-image: url(<?= $fields['image_url'] ?>);background-position:<?= $fields['image_position'] ?? 'center' ?>;">
        <?php
        if (!empty($fields['title'])) {
            ?><h1 class="hero__title"><?= $fields['title'] ?></h1><?php
        }
        ?>
    </div>
    <?php
}

