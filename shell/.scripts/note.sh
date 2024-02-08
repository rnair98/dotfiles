#!/usr/bin/env bash

notes_dir=~/polymathy/Writing/blogs/mind-palace/content/notes
title_name=""
for name in "$@"
do
    title_name+="_${name}"
done
title_name="${title_name:1}"
datetime=$(date +%Y%m%d%H%M%S)
filename="$datetime-${title_name}.md"

touch "$notes_dir/$filename"
echo "Hugo Markdown file created at: $notes_dir/$filename"
