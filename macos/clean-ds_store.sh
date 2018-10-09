# theStudio60 - wp-dev-tools
# https://github.com/theStudio60/wp-dev-tools
# LOCAL LAB ONLY
# OS : macos
#
# clean .DS_Store metadata folders.
# usefull before commit 
# 
# HOW TO USE ??
# put this script in the directory of your wp site
# then in the terminal :
# cd "wp directory"
# chmod +x clean-ds_store.sh
# ./clean-ds_store.sh 
"find . -type f -name '*.DS_Store' -ls -delete"
