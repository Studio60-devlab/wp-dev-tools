<?php
$languages = icl_get_languages('skip_missing=0&orderby=code');
if (!empty($languages) && count($languages > 1)) {
    ?>
    <div class="header__lang">
        <ul class="menu">
            <li class="header__current-lang">
                <?php
                if (!empty($languages[ICL_LANGUAGE_CODE])) {
                    unset($languages[ICL_LANGUAGE_CODE]);
                    ?>
                    <a href="javascript:void(0)"><?= ICL_LANGUAGE_CODE ?> <svg class="header__arrowdown" viewBox="0 0 16.988001 9.9200001"><path d="M15.572 0l1.416 1.417L8.485 9.92 0 1.434 1.412.02l7.072 7.07L15.574 0z"/></svg></a>
                    <?php
                }
                ?>
                <ul class="header__submenu">
                    <?php
                    foreach ($languages as $l) {
                        ?>
                        <li><a href="<?= $l['url'] ?>"><?= $l['code'] ?></a></li>
                        <?php
                    }
                    ?>
                </ul>
            </li>
        </ul>
    </div>
    <?php
}
