<?php
add_shortcode('btn', function ($atts, $content = null) {
    // if there are some missing things, alert the user if connected and stop the execution
    if (empty($content) || empty($atts['url'])) {
        if (is_user_logged_in()) {
            return '<p style="color:red">Btn shortcode error : Wrong shortcode usage. Try with this syntax: [btn url="https://domain.ch"]Inscription[/btn]<p>';
        }
        return false;
    }
    
    // check if the url is valid
    if (filter_var($atts['url'], FILTER_VALIDATE_URL) === false) {
        if (is_user_logged_in()) {
            return '<p style="color:red">Btn shortcode error : invalidnurl "'.$atts['url'].'".<p>';
        }
        return false;
    }

    // check if url is external
    $urlInfos = parse_url($atts['url']);
    $baseurlInfos = parse_url(get_home_url());
    $target = '';
    if (!empty($urlInfos['host']) && strcasecmp($urlInfos['host'], $baseurlInfos['host'])) {
        $target = 'target="_blank" rel="noopener noreferrer" ';
    }

    return '<a '.$target.' href="'.$atts['url'].'" class="btn">'.$content.'</a>';
});
