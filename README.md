# PALASH MTB-MLE Bridge (bhasha-setu)

> **Mother Tongue-Based Multilingual Education (MTB-MLE) Offline Bridge**  
> Supporting Foundational Literacy and Numeracy (FLN) for primary school children across Jharkhand under the NIPUN Bharat Mission.

---

## 📖 Overview

**PALASH MTB-MLE Bridge** bridges the linguistic divide in primary schools by translating teacher instructions from **Hindi** into **Santhali** (rendered in both indigenous **Ol Chiki script** and **Devanagari phonetics**). It offers real-time voice recognition, text-to-speech pronunciation, low-latency offline operation, and instant printable A4 FLN worksheets.

---

## 🎨 Design System, Styles & Assets

For the comprehensive design specification—including font stacks, typography scales, color palettes, CSS design tokens, component styles, printable worksheet geometry, and asset catalogs—refer to:

👉 **[Design System & Asset Specification](docs/DESIGN_SYSTEM_AND_ASSETS.md)**

### Quick Reference
- **Primary Color:** Teal (`#009688` / `#00796B` / `#00695C`)
- **Accent Color:** Orange (`#E65100`)
- **Supported Scripts:**
  - **Hindi:** Devanagari (`Noto Sans Devanagari`)
  - **Santhali:** Ol Chiki (`Noto Sans Ol Chiki` / `U+1C50–U+1C7F`) & Phonetic Devanagari
  - **UI Shell:** Inter / Roboto
- **Graphic Assets:** Located in `web/` and `web/icons/`
- **Data Assets:** `assets/fln_phrases.json` and `data/fln_phrases.json`

---

## 🚀 Running the Web App

To run the application on Google Chrome:

```bash
flutter run -d chrome
```

For release web build:

```bash
flutter build web
```
