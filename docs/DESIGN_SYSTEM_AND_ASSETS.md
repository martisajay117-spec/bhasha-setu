# PALASH MTB-MLE Bridge: Design System, Typography, Styles & Asset Specification

> **Version:** 1.0.0  
> **Target Audience:** UI/UX Designers, Frontend Developers, Mobile Engineers, Curriculum Developers  
> **Application Scope:** PALASH Mother Tongue-Based Multilingual Education (MTB-MLE) Web & Mobile Platform  
> **Context:** Department of School Education and Literacy, Government of Jharkhand / NIPUN Bharat FLN Mission  

---

## 1. Executive Summary & Brand Purpose

**PALASH MTB-MLE Bridge** is an offline-capable pedagogical tool designed to bridge the foundational language barrier for primary school children (Grades 1–3) in Jharkhand. It translates teacher verbal instructions in **Hindi** into **Santhali** rendered simultaneously in **Ol Chiki script** (the indigenous writing system created by Pandit Raghunath Murmu) and **Devanagari Phonetic script** (for teachers unfamiliar with Ol Chiki).

The visual design system is engineered around three guiding principles:
1. **High Contrast & Legibility in Rural Classrooms:** Clear visual hierarchy, bold font weights, and high-contrast color pairings readable on low-cost tablets, projectors, and mobile devices in high ambient light.
2. **Pedagogical Reassurance:** Grounded earthy teals and warm energetic ambers that evoke trust, safety, and cultural resonance with indigenous Jharkhand traditions (*Palash* flower / Sal forest motifs).
3. **Immediate Multimodal Affordance:** Clear, finger-friendly interactive targets (minimum 48×48 dp / 55 dp circular mic) for one-tap voice input, audio pronunciation playback, and instant printable A4 PDF worksheets.

---

## 2. Typography Architecture & Script Specifications

The application handles three distinct scripts simultaneously: Latin/Roman (UI & Metrics), Devanagari (Hindi Prompts & Phonetic Santhali), and Ol Chiki (Primary Santhali Script).

### 2.1 Font Families & Script Font Stack

| Script / Role | Font Family | Fallback Stack | Source / License |
| :--- | :--- | :--- | :--- |
| **System & UI Shell** | **Inter** / **Roboto** | `-apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif` | Google Fonts / Open Font License (OFL) |
| **Hindi & Devanagari Phonetics** | **Noto Sans Devanagari** | `"Mangal", "Kokila", "Utsaah", sans-serif` | Google Fonts (SIL OFL) |
| **Santhali (Ol Chiki)** | **Noto Sans Ol Chiki** | `"Guru Gomke Ol Chiki", "Ol Chiki", sans-serif` | Google Fonts (SIL OFL) |
| **Print / PDF Engine** | **PdfFont.helvetica** / TrueType fallback | Vector embedded glyphs | Open Source (Pdf/Printing package) |

```html
<!-- Web Google Fonts Embed Code -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+Devanagari:wght@400;500;600;700&family=Noto+Sans+Ol+Chiki:wght@500;700&display=swap" rel="stylesheet">
```

### 2.2 Typography Scale & Hierarchy

| Token Name | Size (sp/px) | Weight | Line Height | Tracking / Spacing | Flutter Code Reference | Visual Purpose |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `display.santhali` | **26px** | Bold (700) | 1.3 | +0.5px | `TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.teal[800])` | Primary Santhali Ol Chiki translated text |
| `title.hindi` | **20px** | Medium (500) | 1.4 | 0 | `TextStyle(fontSize: 20, fontWeight: FontWeight.w500)` | Recognized Hindi input speech string |
| `title.appBar` | **18px** | Bold (700) | 1.2 | 0 | `TextStyle(fontSize: 18, fontWeight: FontWeight.bold)` | Top navigation bar title |
| `subtitle.phonetic` | **14px** | Regular (400) Italic | 1.4 | 0 | `TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black54)` | Phonetic Devanagari transliteration guide |
| `label.micStatus` | **14px** | SemiBold (600) | 1.2 | +0.2px | `TextStyle(fontWeight: FontWeight.w600, color: _isListening ? Colors.red : Colors.grey[700])` | Push to speak instruction status |
| `button.label` | **15px** | SemiBold (600) | 1.0 | +0.4px | `TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)` | Action buttons ("Play Audio", "Export PDF") |
| `overline.header` | **12px** | Bold (700) | 1.0 | +1.2px | `TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)` | Card section markers ("HINDI INPUT") |
| `badge.chip` | **10px** | Bold (700) | 1.0 | +0.3px | `TextStyle(fontSize: 10, color: Colors.white)` | FLN pedagogical tag and DB match indicators |

### 2.3 Unicode Script Specifics

- **Ol Chiki Unicode Range:** `U+1C50` – `U+1C7F` (e.g., `ᱯ` [U+1C66], `ᱩ` [U+1C64], `ᱛ` [U+1C5D], `ᱷ` [U+1C67], `ᱤ` [U+1C5E], `ᱡ` [U+1C68], `ᱽ` [U+1C7C], `ᱢ` [U+1C6A], `ᱮ` [U+1C60])
- **Devanagari Unicode Range:** `U+0900` – `U+097F` (e.g., `क`, `ख`, `ग`, `घ`, `ङ`, `अ`, `आ`, `इ`)

---

## 3. Color Palette & Design Tokens

The color system is derived from Material Design 3 guidelines, with custom adjustments for education environments and instant state feedback.

### 3.1 Color Swatches & Tokens

| Token | Hex Value | RGB Value | CSS Variable | Flutter Token | Role / UI Application |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Primary Brand** | `#009688` | `rgb(0, 150, 136)` | `--color-primary` | `Colors.teal` | Core brand color, idle microphone button |
| **Primary Dark** | `#00796B` | `rgb(0, 121, 107)` | `--color-primary-dark` | `Colors.teal[700]` | App Bar background, primary brand header |
| **Primary Deep** | `#00695C` | `rgb(0, 105, 92)` | `--color-primary-deep` | `Colors.teal[800]` | Ol Chiki headline text, table borders |
| **Primary Deepest** | `#004D40` | `rgb(0, 77, 64)` | `--color-primary-deepest` | `Colors.teal[900]` | Status pill badges, app bar chip background |
| **Primary Light** | `#00897B` | `rgb(0, 137, 123)` | `--color-primary-light` | `Colors.teal[600]` | "Play Audio (TTS)" elevated button |
| **Primary Surface** | `#E0F2F1` | `rgb(224, 242, 241)` | `--color-primary-surface` | `PdfColors.teal50` | Worksheet table header fill, soft highlights |
| **Accent Orange** | `#E65100` | `rgb(230, 81, 0)` | `--color-accent` | `Colors.orange[800]` | "Export PDF" button, FLN Worksheet tag |
| **Scaffold Background** | `#F4F6F8` | `rgb(244, 246, 248)` | `--color-background` | `Color(0xFFF4F6F8)` | Neutral cool-slate screen background |
| **Surface White** | `#FFFFFF` | `rgb(255, 255, 255)` | `--color-surface` | `Colors.white` | Card container background, button text |
| **Mic Active (Recording)** | `#FF5252` | `rgb(255, 82, 82)` | `--color-recording` | `Colors.redAccent` | Microphone active listening ring |
| **Latency Passed (<3s)** | `#2E7D32` | `rgb(46, 125, 50)` | `--color-success` | `Colors.green[800]` | SnackBar verification indicator |
| **Latency Failed (>3s)** | `#F44336` | `rgb(244, 67, 54)` | `--color-error` | `Colors.red` | SnackBar error/warning alert |
| **Border / Divider** | `#BDBDBD` | `rgb(189, 189, 189)` | `--color-border` | `Colors.grey[400]` | Card dividers and table outlines |
| **Text Secondary** | `#757575` | `rgb(117, 117, 117)` | `--color-text-secondary` | `Colors.black54` | Transliteration phonetic text |
| **Text Muted** | `#616161` | `rgb(97, 97, 97)` | `--color-text-muted` | `Colors.grey[700]` | Input instruction labels |

### 3.2 CSS Design Tokens (`:root`)

```css
:root {
  /* Brand Primary */
  --palash-primary: #009688;
  --palash-primary-dark: #00796B;
  --palash-primary-deep: #00695C;
  --palash-primary-deepest: #004D40;
  --palash-primary-light: #00897B;
  --palash-primary-surface: #E0F2F1;

  /* Accent & Status */
  --palash-accent-orange: #E65100;
  --palash-mic-recording: #FF5252;
  --palash-status-success: #2E7D32;
  --palash-status-error: #F44336;

  /* Neutrals & Surfaces */
  --palash-bg-screen: #F4F6F8;
  --palash-bg-card: #FFFFFF;
  --palash-text-primary: #212121;
  --palash-text-secondary: #757575;
  --palash-text-muted: #9E9E9E;
  --palash-divider: #E0E0E0;

  /* Typography Stacks */
  --font-sans: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  --font-devanagari: 'Noto Sans Devanagari', sans-serif;
  --font-olchiki: 'Noto Sans Ol Chiki', sans-serif;

  /* Spacing & Radii */
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --radius-xl: 16px;
  --radius-full: 9999px;

  /* Elevation Shadows */
  --shadow-card: 0 4px 12px rgba(0, 0, 0, 0.08), 0 1px 3px rgba(0, 0, 0, 0.04);
  --shadow-button: 0 4px 8px rgba(0, 105, 92, 0.24);
  --shadow-mic: 0 8px 24px rgba(0, 150, 136, 0.35);
}
```

---

## 4. UI Components & Interaction Styling

### 4.1 Navigation Bar (`AppBar`)
- **Background Color:** `Colors.teal[700]` (`#00796B`)
- **Title Text:** White, 18sp, `FontWeight.bold`, centered.
- **Match Status Badge:**
  - Placed in top right action bar.
  - Background: `Colors.teal[900]` (`#004D40`).
  - Text: 10sp, White, uppercase.
  - States: `"Ready"`, `"Exact DB Match"`, `"Dictionary Fallback"`.

### 4.2 Push-to-Speak Microphone Controller
The interactive center of the voice interface, engineered with clear tactile visual states:
- **Geometry:** Symmetrical circular button (`CircleAvatar`), radius: `55dp` (110dp diameter).
- **Icon:** Centered Material icon, size `50dp`, color: `Colors.white`.
- **Idle State:**
  - Background: `Colors.teal` (`#009688`).
  - Icon: `Icons.mic_none`.
  - Label: `"Push to Speak (Hindi)"`, color: `Colors.grey[700]`.
- **Active / Listening State:**
  - Background: `Colors.redAccent` (`#FF5252`).
  - Icon: `Icons.mic`.
  - Label: `"Listening... (Release to Stop)"`, color: `Colors.red`, `FontWeight.w600`.
  - Interaction Gesture: `GestureDetector` binding `onTapDown` and `onTapUp` for physical push-to-talk experience.

### 4.3 Translation Result Card (`Card`)
- **Geometry:** Elevated card with `elevation: 3`, `BorderRadius.circular(16)`.
- **Padding:** `20.0 dp` internal padding.
- **Background:** Pure White (`#FFFFFF`).
- **Card Sub-sections:**
  1. **Hindi Input Header:** Overline text `"HINDI INPUT"` in grey, paired with an FLN Pedagogical Badge chip (`Literacy-L1`, `Numeracy-L1`, `Oral-L1`, `Behavior-L1`, `Reinforcement`, `General`).
  2. **Recognized Hindi Text:** 20sp, `FontWeight.w500`, soft black.
  3. **Divider:** `Divider(height: 30, thickness: 1.5)` in light grey.
  4. **Santhali Header:** Overline text `"SANTHALI TRANSLATION (OL CHIKI)"` in Teal.
  5. **Ol Chiki Text:** High-emphasis 26sp bold in `Colors.teal[800]` (`#00695C`).
  6. **Phonetic Pronunciation:** 14sp italic in `Colors.black54` (`#757575`), prefixed with `"Phonetic: "`.

### 4.4 Action Buttons Row
- **Layout:** Symmetric 2-column flex row (`Row` with `Expanded` widgets), separated by `12dp` horizontal gap.
- **Button Dimensions:** Minimum height `56dp` (16dp vertical padding), border radius `12dp`.
- **Play Audio (TTS) Button:**
  - Background: `Colors.teal[600]` (`#00897B`).
  - Icon: `Icons.volume_up`.
  - Action: Plays phonetic Hindi/Santhali audio at `speechRate: 0.85`, `pitch: 1.0`.
- **Export PDF Button:**
  - Background: `Colors.orange[800]` (`#E65100`).
  - Icon: `Icons.picture_as_pdf`.
  - Action: Invokes `PdfWorksheetService.generateAndPrintWorksheet()`.

### 4.5 Latency Benchmark HUD (`SnackBar`)
- **Verification Rule:** Sub-3s response time benchmark (< 3000ms) for low-resource classroom operation.
- **Passed (<3000ms):** Background `Colors.green[800]` (`#2E7D32`), text: `"Processing Latency: Xms (Sub-3s Verified)"`.
- **Exceeded (>3000ms):** Background `Colors.red` (`#F44336`).

---

## 5. Printable A4 PDF Worksheet Design System

The platform includes an automated A4 worksheet generator conforming to the **NIPUN Bharat FLN (Foundational Literacy and Numeracy)** standard.

```
+-------------------------------------------------------------------------------+
|  PALASH MTB-MLE PROGRAMME | JHARKHAND                     [TAG: Literacy-L1]  |
|  NIPUN Bharat FLN Worksheet                                                  |
+-------------------------------------------------------------------------------+
| Student Name: _____________________  Date: ________  Class: Primary 1-3       |
+-------------------------------------------------------------------------------+
| Classroom Task & Language Bridge                                              |
| +------------------------------------+--------------------------------------+ |
| | Hindi Prompt (Teacher)             | Santhali Equivalent (Student)        | |
| +------------------------------------+--------------------------------------+ |
| | किताब खोलो                         | ᱯᱩᱛᱷᱤ ᱡᱷᱤᱡᱽ ᱢᱮ                      | |
| |                                    | Phonetic: पुथी झिज मे                | |
| +------------------------------------+--------------------------------------+ |
|                                                                               |
| Student Writing & Counting Practice Area                                      |
| +----+  +----+  +----+  +----+  +----+  +----+  +----+  +----+                |
| | 1  |  | 2  |  | 3  |  | 4  |  | 5  |  | 6  |  | 7  |  | 8  | (Dashed Grid) |
| +----+  +----+  +----+  +----+  +----+  +----+  +----+  +----+                |
|                                                                               |
| Generated via PALASH Offline Suite          Teacher Signature: ______________ |
+-------------------------------------------------------------------------------+
```

### 5.1 Worksheet Layout Specifications
- **Page Format:** Standard ISO A4 (`210mm × 297mm`), portrait.
- **Page Margin:** `24 pt` uniform margin on all sides.
- **Header Banner:**
  - Container fill: `PdfColors.teal700` (`#00796B`).
  - Border radius: `6 pt`.
  - Organization overline: `"PALASH MTB-MLE PROGRAMME | JHARKHAND"`, White, 10pt bold.
  - Main Title: `"NIPUN Bharat FLN Worksheet"`, White, 18pt bold.
  - Category Badge: Orange 800 rounded badge with white bold text (`TAG: $flnTag`).
- **Student Metadata Row:**
  - Three-column layout: `"Student Name: _______________________"`, `"Date: ____________"`, `"Class: Primary 1-3"`, 12pt font.
- **Bridge Data Table:**
  - Border: 1pt solid line in `PdfColors.teal800`.
  - Header Row Fill: `PdfColors.teal50` (`#E0F2F1`).
  - Column 1: Hindi Prompt (16pt Bold).
  - Column 2: Santhali Ol Chiki (18pt Bold, `PdfColors.teal800`) + Devanagari Phonetic (11pt, `PdfColors.grey700`).
- **Interactive Drill Grid:**
  - 8-cell `GridView` (4 columns × 2 rows).
  - Aspect ratio: 1:1 (square practice tiles).
  - Border style: `PdfBorderStyle.dashed` in `PdfColors.grey500`.
  - Inner content: Center-aligned step numbers (1 to 8) in `PdfColors.grey400`.
- **Footer:**
  - System attribution: `"Generated via PALASH Offline Software Suite"`, 9pt grey.
  - Sign-off: `"Teacher Signature: ______________"`, 9pt grey.

---

## 6. Complete Assets & File Inventory

### 6.1 Graphic & Web Assets

| Asset File Path | Format | Dimensions | File Size | Description & Usage |
| :--- | :--- | :--- | :--- | :--- |
| `web/favicon.png` | PNG | 32×32 px (raster) | 917 B | Browser tab icon for web deployment |
| `web/icons/Icon-192.png` | PNG | 192×192 px | 5.29 KB | Standard PWA home screen icon |
| `web/icons/Icon-512.png` | PNG | 512×512 px | 8.25 KB | High-resolution PWA splash screen & app stores |
| `web/icons/Icon-maskable-192.png` | PNG | 192×192 px | 5.59 KB | Adaptive maskable icon for Android / Chrome OS |
| `web/icons/Icon-maskable-512.png` | PNG | 512×512 px | 21.0 KB | Adaptive maskable high-res icon |

### 6.2 Data Assets & Seed Corpora

| Asset File Path | Format | Records | File Size | Contents & Purpose |
| :--- | :--- | :--- | :--- | :--- |
| `assets/fln_phrases.json` | JSON | 10 Exact Phrases + 12 Lexicon entries | 2.56 KB | Embedded offline database of FLN classroom sentences with Ol Chiki, Devanagari phonetics, and FLN pedagogical tags |
| `data/fln_phrases.json` | JSON | 10 Exact Phrases + 12 Lexicon entries | 2.56 KB | Synced data copy for offline python scripting / training pipelines |
| `data/seed_dataset.csv` | CSV | Structured schema | 0 B (Prepared) | Scalable training/fine-tuning dataset for IndicTrans2 pipeline |

### 6.3 Curated Phrase Corpus Overview (from `fln_phrases.json`)

| Hindi Prompt | Santhali (Ol Chiki) | Santhali (Devanagari Phonetic) | FLN Pedagogical Tag |
| :--- | :--- | :--- | :--- |
| **किताब खोलो** | ᱯᱩᱛᱷᱤ ᱡᱷᱤᱡᱽ ᱢᱮ | पुथी झिज मे | `Literacy-L1` |
| **संख्या गिनो** | ᱞᱮᱠᱷᱟ ᱢᱮ | लेखा मे | `Numeracy-L1` |
| **तुम्हारा नाम क्या है** | ᱟᱢᱟᱜ ᱧᱩᱛᱩᱢ ᱪᱮᱫ | अमाग ञुतुम चेद | `Oral-L1` |
| **इधर आओ** | ᱦᱤᱡᱩᱜ ᱢᱮ | हिजुग मे | `Behavior-L1` |
| **बैठ जाओ** | ᱫᱩᱲᱩᱵ ᱢᱮ | दुरुप मे | `Behavior-L1` |
| **इसे पढ़ो** | ᱯᱟᱲᱦᱟᱣ ᱢᱮ | पढ़ाव मे | `Literacy-L2` |
| **लिखो** | ᱚᱞ ᱢᱮ | ओल मे | `Literacy-L2` |
| **पानी पी लो** | ᱫᱟᱜ ᱧᱩᱭ ᱢᱮ | दाग ञुय मे | `General` |
| **बहुत अच्छा** | ᱟᱹᱰᱤ ᱱᱟᱯᱟᱭ | अड़ि नापाय | `Reinforcement` |
| **बोर्ड पर देखो** | ᱵᱚᱨᱰ ᱨᱮ ᱧᱮᱞ ᱢᱮ | बोर्ड रे ञेल मे | `Literacy-L1` |

---

## 7. Web Application Manifest & PWA Configuration

The web application manifest located at `web/manifest.json` configures the progressive web app behavior:

```json
{
    "name": "bhasha_setu",
    "short_name": "bhasha_setu",
    "start_url": ".",
    "display": "standalone",
    "background_color": "#0175C2",
    "theme_color": "#0175C2",
    "description": "PALASH MTB-MLE Offline Translation and FLN Bridge.",
    "orientation": "portrait-primary",
    "prefer_related_applications": false,
    "icons": [
        {
            "src": "icons/Icon-192.png",
            "sizes": "192x192",
            "type": "image/png"
        },
        {
            "src": "icons/Icon-512.png",
            "sizes": "512x512",
            "type": "image/png"
        },
        {
            "src": "icons/Icon-maskable-192.png",
            "sizes": "192x192",
            "type": "image/png",
            "purpose": "maskable"
        },
        {
            "src": "icons/Icon-maskable-512.png",
            "sizes": "512x512",
            "type": "image/png",
            "purpose": "maskable"
        }
    ]
}
```

> **Design Polish Recommendation:** Update `"theme_color"` and `"background_color"` from the default Flutter blue (`#0175C2`) to the brand primary teal (`#00796B`) to provide seamless chrome browser toolbar tinting on mobile and desktop web.

---

## 8. Web Styling & Responsive Layout Rules

When adapting or designing new responsive pages or companion web dashboards for PALASH, adhere to these layout rules:

1. **Breakpoints:**
   - **Mobile (Default):** `< 600px` — Single-column stacked layout, full-width cards, large touch targets.
   - **Tablet / Classroom Display:** `600px – 1024px` — Two-column layout (Left: Input & Voice controller, Right: Translation card & live worksheet preview).
   - **Desktop / Smart Board:** `> 1024px` — Max content width `960px` centered with side margins to maintain ergonomic reading distances.

2. **Touch Targets & Accessibility (WCAG 2.1 AA):**
   - Minimum interactive target size: `48px × 48px` (`min-height: 48px`, `min-width: 48px`).
   - Primary voice button: `110px × 110px` circular area.
   - Color Contrast Ratio:
     - Teal 700 (`#00796B`) on White: **4.6:1** (Passes AA for normal text, AAA for large).
     - Teal 800 (`#00695C`) on White: **5.9:1** (Passes AA and AAA for text).
     - Orange 800 (`#E65100`) on White: **4.8:1** (Passes AA).

3. **Memory & Performance Constraints:**
   - Designed to run smoothly on low-spec hardware (devices with <= 2GB RAM).
   - Uses `PaintingBinding.instance.imageCache.clear()` and memory purge triggers between intensive translation queries to prevent frame drops in browser and web views.

---

## 9. Developer Quick-Reference Checklist

When creating new widgets, components, or web pages:
- [ ] Are Ol Chiki fonts specified with fallback to Unicode ranges?
- [ ] Is the primary color token `Colors.teal[700]` (`#00796B`) or `Colors.teal[800]` (`#00695C`)?
- [ ] Is the PDF export formatted for A4 portrait with `PdfColors.teal700` and `PdfColors.orange800`?
- [ ] Does every voice-interactive button provide both visual (color/icon change) and state feedback?
- [ ] Is the response latency tracked and reported under the 3000ms threshold?
- [ ] Are assets referenced from `assets/` or `data/` and registered in `pubspec.yaml`?
