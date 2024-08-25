#!/bin/bash

# Read the CSV file
words_txt="/home/moatsem/scripts/Ywords.txt"
desc_txt="/home/moatsem/scripts/Ydesc.txt"
declare -a record=("empty")
while IFS=, read -r word desc; do
    record+=("$word:$desc")
done < <(paste -d, $words_txt $desc_txt)
# Print the length of the record array
echo "Length of record: ${#record[@]}"
selected_value=$(printf "%s\n" "${record[@]}" | rofi -dmenu -i -p "Select an option" -width 1000 -lines 100)
printf "%s" "$selected_value" | xclip -selection clipboard
