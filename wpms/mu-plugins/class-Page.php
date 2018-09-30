<?php

namespace S60;

/**
 *  Page helper class
 */
class Page
{
    private static $imageWidth;
    private static $imageHeight;

    public static function idByTemplate($template)
    {
        $page = get_posts(array(
            'fields' => 'ids',
            'post_type' => 'page',
            'posts_per_pages' => 1,
            'suppress_filters' => true,
            'meta_key' => '_wp_page_template',
            'meta_value' => $template
        ));
        if ($page) {
            return array_pop($page);
        } else {
            return false;
        }
    }

    public static function getAttachmentImage($format, $id = null)
    {
        if ($image = wp_get_attachment_image_src(get_post_thumbnail_id($id), $format)) {
            self::$imageWidth = $image[1];
            self::$imageHeight = $image[2];
            return $image[0];
        }

        return false;
    }

    public static function getImage($id, $format)
    {
        if ($image = wp_get_attachment_image_src($id, $format)) {
            self::$imageWidth = $image[1];
            self::$imageHeight = $image[2];
            return $image[0];
        }

        return false;
    }

    public static function getImageSize()
    {
        return array('width' => self::$imageWidth, 'height' => self::$imageHeight);
    }
}
