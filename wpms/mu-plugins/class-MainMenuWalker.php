<?php
// @codingStandardsIgnoreStart
class Walker_Main_Menu extends Walker_Nav_Menu
{

    public function start_lvl(&$output, $depth = 0, $args = array())
    {
        $indent = str_repeat("\t", $depth);
        $output .= "\n$indent<div class='header__submenu'><ul class=\"submenu\">\n";
    }

    public function end_lvl(&$output, $depth = 0, $args = array())
    {
        $indent = str_repeat("\t", $depth);
        $output .= "$indent</ul></div>\n";
    }

    public function start_el(&$output, $item, $depth = 0, $args = array(), $id = 0)
    {
        $indent = ($depth) ? str_repeat("\t", $depth) : '';

        $classes = empty($item->classes) ? array() : (array) $item->classes;
        $classes[] = 'menu-item-' . $item->ID;

        // links containing hashtags can't be active
        if (strpos($item->url, '#') !== false) {
            foreach ($classes as $k => $class) {
                if (in_array($class, ['current-menu-item', 'current_page_item'])) {
                    unset($classes[$k]);
                }
            }
        }

        /**
        * Filters the arguments for a single nav menu item.
        */
        $args = apply_filters('nav_menu_item_args', $args, $item, $depth);

        /**
        * Filters the CSS class(es) applied to a menu item's list item element.
        */
        $class_names = join(' ', apply_filters('nav_menu_css_class', array_filter($classes), $item, $args, $depth));
        $class_names = $class_names ? ' class="' . esc_attr($class_names) . '"' : '';

        /**
        * Filters the ID applied to a menu item's list item element.
        */
        $id = apply_filters('nav_menu_item_id', 'menu-item-'. $item->ID, $item, $args, $depth);
        $id = $id ? ' id="' . esc_attr($id) . '"' : '';

        $output .= $indent . '<li' . $id . $class_names .'>';

        $atts = array();
        $atts['title']  = !empty($item->attr_title) ? $item->attr_title : '';
        $atts['target'] = !empty($item->target)     ? $item->target     : '';
        $atts['rel']    = !empty($item->xfn)        ? $item->xfn        : '';
        $atts['href']   = !empty($item->url)        ? $item->url        : '';

        /**
        * Filters the HTML attributes applied to a menu item's anchor element.
        */
        $atts = apply_filters('nav_menu_link_attributes', $atts, $item, $args, $depth);

        $attributes = '';
        foreach ($atts as $attr => $value) {
            if (!empty($value)) {
                $value = ('href' === $attr) ? esc_url($value) : esc_attr($value);
                if ('href' === $attr && $value == '#') {
                    $value = 'javascript:void(0)';
                }

                $attributes .= ' ' . $attr . '="' . $value . '"';
            }
        }



        /** This filter is documented in wp-includes/post-template.php */
        $title = apply_filters('the_title', $item->title, $item->ID);

        /**
        * Filters a menu item's title.
        */
        $title = apply_filters('nav_menu_item_title', $title, $item, $args, $depth);
        if ($args->walker->has_children == 1 && $depth == 0) {
            $title .= ' <svg class="header__arrowdown" viewBox="0 0 16.988001 9.9200001"><path d="M15.572 0l1.416 1.417L8.485 9.92 0 1.434 1.412.02l7.072 7.07L15.574 0z"/></svg>';
        }

        $item_output = $args->before;
        $item_output .= '<a'. $attributes .'>';
        $item_output .= $args->link_before . $title . $args->link_after;
        $item_output .= '</a>';
        $item_output .= $args->after;

        /**
        * Filters a menu item's starting output.
        */
        $output .= apply_filters('walker_nav_menu_start_el', $item_output, $item, $depth, $args);
    }
} 
// @codingStandardsIgnoreEnd
