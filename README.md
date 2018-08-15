# wp-dev-tools
TheStudio60 webdev laboratory

Some pieces of code we use for wordpress development

In the process of web design itself, we need to develop the style first, and then integrate in WP.

We use bootstrap.magic to build the less variables coming with the css.
We name these output files "custom.css" and "custom.scss". 

We create a specific directory for those, in our theme, called assets.
those files are registered in front.php (frontend)

Diagram :

THEMEDIR/
|_ index.php
|_ style.css
|_ functions/
|   |_ back.php
|   |_ front.php
|   |_ functions.php
|   
|_ assets/
|   |_ css/
|   |   |_ custom.css
|   |   |_ custom.scss
|   |
|   |_ images
|   |   |_ glyphicons-halflings-white.png
|   |   |_ glyphicons-halflings.png
|   |
|   |_ js 
|       |_ bootstrap.js
|       |_ bootstrap.min.js
|       |_ vendor/
|           |_ anchor.min.js
|           |_ clipboard.min.js
|           |_ holder.min.js
|           |_ jquery-slim.min.js
|           |_ popper.min.js
| 
|
