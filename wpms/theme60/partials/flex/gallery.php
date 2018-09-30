<?php
$fields = get_query_var('fields', false);

if (!empty($fields['gallery'])) {
    ?>
    <div class="gallery">
        <?php
        foreach ($fields['gallery'] as $image) {
            ?>
            <a class="gallery__item js-popup" href="<?= $image['url'] ?>">
                <div class="gallery__image" style="background-image: url(<?= $image['sizes']['medium'] ?>)"></div>
            </a>
            <?php
        }
        ?>
    </div>
    <?php
}
