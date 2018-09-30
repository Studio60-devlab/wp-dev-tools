<?php
$fields = get_query_var('fields', false);
$video_id = uniqid();
?>
<div class="video">
    <div class="embed-responsive embed-responsive-16by9">
        <div class="video__poster embed-responsive-item" data-target="<?= $video_id ?>" style="background-image: url(<?= $fields['video_poster']['sizes']['large'] ?>)"></div>
        <div class="js-video video__player embed-responsive-item" id="<?= $video_id ?>" data-videoId="<?= $fields['video_youtube_id'] ?>"></div>
    </div>
</div>
