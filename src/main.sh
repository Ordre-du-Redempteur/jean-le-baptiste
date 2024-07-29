#!/bin/bash

BIBLE_JSON=/usr/local/bin/bible_fr_courrant.json

main()
{
  local day_of_year=$(get_day_of_year)
  local verses=$(extract_verses)
  local num_verses=$(count_verses "$verses")
  local verse_index=$(calculate_verse_index "$day_of_year" "$num_verses")
  local passage=$(extract_passage "$verses" "$verse_index")

  display_left_sided_bible
  echo "Voici le passage quotidien de la Sainte Ecriture : "
  echo " "
  echo "$passage"
  echo " "
}

main
