import json
import re

def add_quotes_to_keys(json_data):
    # Add quotes around the keys "Text" and "ID"
    json_data = re.sub(r'(?<!")(\bText\b)(?!")', r'"\1"', json_data)
    json_data = re.sub(r'(?<!")(\bID\b)(?!")', r'"\1"', json_data)
    json_data = re.sub(r'(?<!")(\bVerses\b)(?!")', r'"\1"', json_data)
    json_data = re.sub(r'(?<!")(\bChapters\b)(?!")', r'"\1"', json_data)
    return json_data

def main():
    input_file = 'bible_fr.json'
    output_file = 'bible_fixed.json'

    with open(input_file, 'r', encoding='utf-8') as file:
        json_data = file.read()

    corrected_json_data = add_quotes_to_keys(json_data)

    with open(output_file, 'w', encoding='utf-8') as file:
        file.write(corrected_json_data)

    print(f"Corrected JSON data has been written to {output_file}")

if __name__ == '__main__':
    main()
