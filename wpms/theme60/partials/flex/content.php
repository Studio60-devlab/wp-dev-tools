<?php
$fields = get_query_var('fields', false);

$classes = '';
$classes .= $fields['orientation'] == 'text_on_left' ? ' content--inverse' : '';
$classes .= $fields['orientation'] == 'fullpage' ? ' content--fullpage' : '';
?>
<div class="content<?= $classes ?>">
    <div class="content__image">
        <?php
        if (!empty($fields['image'])) {
            ?>
            <img class="img-responsive" src="<?= $fields['image']['sizes']['large'] ?>" alt="<?= $fields['image']['alt'] ?>">
            <?php
        }
        ?>
    </div>
    <div class="content__text">
        <?php
        if (!empty($fields['text'])) {
            echo $fields['text'];
        }
        ?>
    </div>
</div>
