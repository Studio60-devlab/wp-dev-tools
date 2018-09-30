<?php
$fields = get_query_var('fields', false);
?>
<div class="row">
    <div class="col-sm-6">
        <?php
        if (!empty($fields['content_left'])) {
            echo $fields['content_left'];
        }
        ?>
    </div>
    <div class="col-sm-6">
        <?php
        if (!empty($fields['content_right'])) {
            echo $fields['content_right'];
        }
        ?>
    </div>
</div>
