        <?php
        /**
         * Example of Google Maps integration
         */
        set_query_var('lat', 46.5231307);
        set_query_var('lng', 6.5294903);
        get_template_part('partials/map');
        ?>
        <footer class="footer"></footer>
        <?php
        // mobile menu
        wp_nav_menu(array('theme_location' => 'header-menu', 'container_class' => 'pop popmenu', 'walker' => new Walker_Main_Menu()));
        ?>
        <?php wp_footer(); ?>
    </body>
</html>
