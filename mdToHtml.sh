#! /bin/sh

# This script converts all markdown files in the current directory to html files using mdown
# See https://medium.com/craftycode/how-to-create-a-simple-web-page-using-markdown-95e462e43e01
# For every md file in dirs "labos" and "tes"
for file in labos/*.md tes/*.md
do
    # Skip if no files found (globbing returns pattern if no match)
    [ -e "$file" ] || continue

    echo "Converting $file to html..."

    # Get filename without extension
    filename=$(basename -- "$file")
    dir=$(dirname -- "$file")
    dst="$dir/${filename%.*}.html"

    pandoc --toc "$file" -f markdown -t html -s -o "$dst" --template "$dir/pandoc-template.html" --highlight-style zenburn

done
