import json
import boto3
import sys

def translate_text(text, source_lang, target_lang, translate_client):
    """
    Translate text using AWS Translate.
    """
    response = translate_client.translate_text(
        Text=text,
        SourceLanguageCode=source_lang,
        TargetLanguageCode=target_lang
    )
    return response['TranslatedText']

def translate_arb_file(input_file, output_file, target_language_code):
    """
    Translate each entry in the ARB file to the target language.
    """
    # Initialize AWS Translate client
    translate_client = boto3.client('translate')

    # Read the input ARB file
    with open(input_file, 'r', encoding='utf-8') as file:
        arb_data = json.load(file)

    translated_data = {}

    # Iterate through each key-value pair in the ARB file
    for key, value in arb_data.items():
        if isinstance(value, str):  # Translate only string values
            # Translate the value if it's not a metadata entry
            translated_value = translate_text(value, 'en', target_language_code, translate_client)
            translated_data[key] = translated_value
        else:
            # Copy non-string entries (like objects) as-is
            translated_data[key] = value

    # Write the translated data to the output ARB file
    with open(output_file, 'w', encoding='utf-8') as file:
        json.dump(translated_data, file, ensure_ascii=False, indent=2)

    print(f"Translation completed. Translated ARB file is saved as {output_file}.")

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: python translate_arb.py <input_arb_file> <output_arb_file> <target_language_code>")
        sys.exit(1)

    input_arb_file = sys.argv[1]
    output_arb_file = sys.argv[2]
    target_language_code = sys.argv[3]

    translate_arb_file(input_arb_file, output_arb_file, target_language_code)
