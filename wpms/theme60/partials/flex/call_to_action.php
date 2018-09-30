<?php
$fields = get_query_var('fields', false);
?>
<div class="cta">
    <?php
    if (!empty($fields['text'])) {
        ?><div class="cta__title"><?= $fields['text'] ?></div><?php
    }
    ?>
    <?php
    if (!empty($fields['btn_url'])) {
        ?>
        <div class="cta__btn">
            <a class="btn btn--inverse" href="<?= $fields['btn_url'] ?>"><?= $fields['btn_label'] ?: __('Plus d\'informations', 'golf') ?></a>
        </div>
        <?php
    }
    ?>
</div>
