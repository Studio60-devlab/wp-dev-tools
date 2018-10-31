# studio60 -
# Script pour configurer un nouveau projet hugo
# Ce script a été copié/téléchargé par l'installeur hugo-install.sh 
# © 2018 - theStudio60
# Author : Fabien Dupont
#
ls

git init -q
touch .gitignore
echo "designer.info" >> .gitignore
echo >> .gitignore

echo "node_modules" >> .gitignore
echo >> .gitignore

echo "public" >> .gitignore
echo >> .gitignore


touch archetypes/articles.md

echo "+++" >> archetypes/articles.md
echo "" >>  archetypes/articles.md
echo "Author = \"Studio60\"" >> archetypes/articles.md
echo "Description = \"\"" >> archetypes/articles.md
echo "resources = []" >> archetypes/articles.md
echo "slug = \"\"" >> archetypes/articles.md
echo "" >>  archetypes/articles.md
echo "+++" >> archetypes/articles.md

touch layouts/articles/single.html

echo "<!DOCTYPE html> " >> layouts/articles/single.html 
echo "<html>" >> layouts/articles/single.html 
echo "<title>{{ .Title }}</title>" >> layouts/articles/single.html 
echo "<meta charset=\"UTF-8\">" >> layouts/articles/single.html 
echo "<meta name=\"description\" content=\"{{ .Description }}\">" >> layouts/articles/single.html 
echo "</head>" >> layouts/articles/single.html 
echo "<body>" >> layouts/articles/single.html 
echo "<main>" >> layouts/articles/single.html 
echo "<article>" >> layouts/articles/single.html 
echo "<h1>" >> layouts/articles/single.html 
echo "{{ .Title }}" >> layouts/articles/single.html 
echo "</h1>" >> layouts/articles/single.html 
echo "{{ .Content }}" >> layouts/articles/single.html 
echo "</article>" >> layouts/articles/single.html 
echo "</main>" >> layouts/articles/single.html 
echo "</body>" >> layouts/articles/single.html 
echo "</html>" >> layouts/articles/single.html 

hugo -vw