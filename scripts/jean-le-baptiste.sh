#!/bin/bash

display_celtic_cross()
{
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
}

display_left_sided_cross()
{
      echo -e "\e[93m"
      cat << "EOF"
     __
    /_/\/\
    \_\  /
    /_/  \
    \_\/\ \
       \_\/

EOF
      echo -e "\e[0m"
}

display_left_sided_bible()
{
      echo -e "\e[93m"
      cat << "EOF"
   __________________________
  /\                         \
 /  \            ____         \
/ \/ \          /\   \         \
\ /\  \         \ \   \         \
 \  \  \     ____\_\   \______   \
  \   /\\   /\                \   \
   \ /\/ \  \ \_______    _____\   \
    \\/ / \  \/______/\   \____/    \
     \ / /\\         \ \   \         \
      \ /\/ \         \ \   \         \
       \\/ / \         \ \   \         \
        \ /   \         \ \   \         \
         \\  /\\         \ \   \         \
          \ /\  \         \ \___\         \
           \\    \         \/___/          \
            \  \/ \                         \
             \ /\  \_________________________\
              \  \ / ______________________  /
               \  / ______________________  /
                \/_________________________/

EOF
      echo -e "\e[0m"
}
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
