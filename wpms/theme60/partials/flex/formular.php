<?php
$fields = get_query_var('fields', false);

if (!empty($fields['formular_title'])) {
    ?><h3><?=$fields['formular_title'] ?></h3><?php
}

// output gravity form
if (!empty($fields['formular_form_id'])) {
    gravity_form($fields['formular_form_id'], false, false, false, '', false, 12);
}
