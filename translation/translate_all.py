import subprocess

# List of language codes supported by Amazon Translate, excluding Chinese and Russian
languages = [
    "af", "am", "ar", "az", "be", "bg", "bn", "bs", "ca", "hr", "cs", "da",
    "nl", "et", "fi", "fr", "ka", "de", "el", "gu", "he", "hi", "hu", "is",
    "id", "it", "ja", "kn", "kk", "ko", "lv", "lt", "ms", "ml", "mt", "mr",
    "mn", "no", "fa", "pl", "pt", "pa", "ro", "sr", "si", "sk", "sl", "es",
    "sw", "sv", "tl", "ta", "te", "th", "tr", "uk", "ur", "uz", "vi", "cy", "zh"
]

# Source and target file templates
source_file = "../lib/l10n/intl_en.arb"
target_file_template = "../lib/l10n/intl_{}.arb"

total_languages = len(languages)

for index, lang in enumerate(languages, start=1):
    # Format the target file name and language code
    target_file = target_file_template.format(lang)
    
    # Run the translation script
    subprocess.run(["python3", "translate_arb.py", source_file, target_file, lang])

    # Log the progress
    print(f"Translated {index}/{total_languages}: {lang}")

print("Translation process completed.")
