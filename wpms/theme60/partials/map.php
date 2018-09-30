<?php
$params = [
    'lat' => get_query_var('lat', 0),
    'lng' => get_query_var('lng', 0),
    'zoom' => get_query_var('zoom', 14),
    'title' => get_query_var('title', '')
];

$mapid = 'gmap_'.uniqid();

add_action('wp_footer', function () use ($params, $mapid) {
    ?>
    <script>
    function init<?= $mapid ?>() {
        var myLatLng = {lat: <?= $params['lat'] ?>, lng: <?= $params['lng'] ?>};
        var map = new google.maps.Map(document.getElementById("<?= $mapid ?>"), {center: myLatLng,scrollwheel: false, zoom: <?= $params['zoom'] ?>});
        var marker = new google.maps.Marker({map: map, position: myLatLng, title: "<?= $params['title'] ?>" });
    }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=<?= GMAP_API_KEY ?>&amp;callback=init<?= $mapid ?>"></script>
    <?php
});

echo '<div id="'.$mapid.'" class="map"></div>';
