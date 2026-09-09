import json
import os

def load_fln_phrases():
    # Direct absolute path to the project data file
    file_path = "/Users/ajaymartis/bhasha-setu/assets/fln_phrases.json"
    
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            data = json.load(f)
            phrases = data.get("exact_phrases", [])
            print(f"Successfully loaded {len(phrases)} phrases.")
            return phrases
    except FileNotFoundError:
        print(f"Error: Could not find file at {file_path}")
        return []
    except json.JSONDecodeError:
        print("Error: Failed to decode JSON. Check syntax formatting.")
        return []

if __name__ == "__main__":
    phrases = load_fln_phrases()
    for p in phrases:
        print(p)
