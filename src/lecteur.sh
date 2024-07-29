#!/bin/bash

get_day_of_year()
{
    date +%j
}

extract_verses()
{
    jq -r '.Testaments[].Books[].Chapters[].Verses[] | "\(.ID) - \(.Text)"' "$BIBLE_JSON"
}

count_verses()
{
    echo "$1" | wc -l
}

calculate_verse_index()
{
    local day_of_year=$1
    local num_verses=$2
    echo $(( (day_of_year % num_verses) + 1 ))
}

extract_passage()
{
    local verses=$1
    local verse_index=$2
    echo "$verses" | sed -n "${verse_index},$((verse_index + 10))p"
}
