# studio60 -
# Script pour configurer un nouveau projet hugo
# Ce script a été copié/téléchargé par l'installeur hugo-install.sh
# © 2018 - theStudio60
# Author : Fabien Dupont
#
ls

touch archetypes/default.md

echo "---" >> archetypes/default.md
echo "" >>  archetypes/default.md
echo "Author = \"Studio60\"" >> archetypes/default.md
echo "Description = \"\"" >> archetypes/default.md
echo "resources = []" >> archetypes/default.md
echo "slug = \"\"" >> archetypes/default.md
echo "" >>  archetypes/default.md
echo "---" >> archetypes/default.md

mkdir layouts/_default
touch layouts/index.html
touch layouts/404.html

echo "<!DOCTYPE html> " >> layouts/index.html
echo "<html>" >> layouts/index.html
echo "<title>{{ .Title }}</title>" >> layouts/index.html
echo "<meta charset=\"UTF-8\">" >> layouts/index.html
echo "<meta name=\"description\" content=\"{{ .Description }}\">" >> layouts/index.html
echo "</head>" >> layouts/index.html
echo "<body>" >> layouts/index.html
echo "<main>" >> layouts/index.html
echo "<article>" >> layouts/index.html
echo "<h1>" >> layouts/index.html
echo "{{ .Title }}" >> layouts/index.html
echo "</h1>" >> layouts/index.html
echo "{{ .Content }}" >> layouts/index.html
echo "</article>" >> layouts/index.html
echo "</main>" >> layouts/index.html
echo "</body>" >> layouts/index.html
echo "</html>" >> layouts/index.html

git init -q
touch .gitignore
echo "designer.info" >> .gitignore
echo >> .gitignore
echo "hugo-conf.sh" >> .gitignore
echo >> .gitignore
echo "gulpfile.js" >> .gitignore
echo >> .gitignore
echo "node_modules" >> .gitignore
echo >> .gitignore
echo "public/" >> .gitignore
echo >> .gitignore
echo "static/" >> .gitignore
echo >> .gitignore
#build :
# gulp build
# hugo
