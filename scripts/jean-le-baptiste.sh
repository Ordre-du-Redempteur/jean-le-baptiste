#!/bin/bash

BIBLE_JSON=/usr/local/bin/bible_fr_courrant.json

DAY_OF_YEAR=$(date +%j)

VERSES=$(jq -r '.Testaments[].Books[].Chapters[].Verses[] | "\(.ID // "0") - \(.Text)"' $BIBLE_JSON)

NUM_VERSES=$(echo "$VERSES" | wc -l)
VERSE_INDEX=$(( (DAY_OF_YEAR % NUM_VERSES) + 1 ))
PASSAGE=$(echo "$VERSES" | sed -n "${VERSE_INDEX}p")

# Afficher le passage
echo "Voici le passage quotidien de la Sainte Ecriture : "
echo "$PASSAGE"
