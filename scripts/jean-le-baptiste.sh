#!/bin/bash

BIBLE_JSON=/usr/local/bin/bible_fr_courrant.json

DAY_OF_YEAR=$(date +%j)

VERSES=$(jq -r '.Testaments[].Books[].Chapters[].Verses[] | "\(.ID // "0") - \(.Text)"' $BIBLE_JSON)

NUM_VERSES=$(echo "$VERSES" | wc -l)
VERSE_INDEX=$(( (DAY_OF_YEAR % NUM_VERSES) + 1 ))
PASSAGE=$(echo "$VERSES" | sed -n "${VERSE_INDEX}p")

echo -e "\e[93m"
cat << "EOF"
      |V|
   .::| |::.
  ::__| |__::
 >____   ____<
  ::  | |  ::
   '::| |::'
      | |
      | |
      |A|


EOF
echo -e "\e[0m"

echo "Voici le passage quotidien de la Sainte Ecriture : "
echo "$PASSAGE"
echo " "

echo "Appuyez sur une touche pour continuer..."
read -n 1 -s
