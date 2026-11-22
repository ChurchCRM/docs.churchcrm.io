---
title: Localization & Formats
sidebar_position: 5
---

# Localization & Formats

Language, time zone, and date, number, and phone formats are on **Admin → Localization & Formats**.

---

## Language & Region

ChurchCRM supports **49 languages**.

## Features

### Browser language auto-detection

When an unauthenticated user visits ChurchCRM (e.g., the login page), the application detects the browser's preferred language and displays the UI in that language automatically — if a translation exists. No configuration is required. Once a user logs in, their saved locale preference takes effect.

### Per-user locale override

Each person can set their own language under the user menu, **Change Settings → Localization**. That choice overrides the church-wide language.

---

## Date & Time Formats

| Setting | Description |
|---------|-------------|
| Long date format | Used in reports, event details, and member records (e.g. `%B %d, %Y` → June 23, 2026) |
| Short date format | Used in tables and compact displays (e.g. `%m/%d/%Y` → 06/23/2026) |
| Time format | 12-hour (`%I:%M %p`) or 24-hour (`%H:%M`) |
| Week starts on | Sunday or Monday — affects calendar display |

### Live preview

As you type or select a format string, a **live preview** updates instantly showing how today's date renders with that format. Three quick-select presets are available:

| Preset | Example |
|--------|---------|
| US | June 23, 2026 / 06/23/2026 |
| EU | 23 June 2026 / 23/06/2026 |
| ISO | 2026-06-23 |

---

## Phone Number Formats

Configure how phone numbers are displayed and masked in input fields. International presets (North America, EU, UK, and others) are available for quick setup.

---

## How to translate ChurchCRM

If you'd like to contribute translations or add a new language, follow this short workflow:

1. Extract terms:

```bash
npm run locale:build
# produces: locale/messages.po
```

2. Translate:
   - Translations live in the ChurchCRM repository — POEditor is no longer used.
   - Edit the `.po` file locally with Poedit or similar, or translate the missing terms in the repository directly.
   - If you fill the missing-term batch files under `locale/terms/missing/`, run `npm run locale:apply` before you build. The command moves the filled terms into the locale files and removes them from the batch files.

3. Build translated assets:

```bash
npm run deploy   # or npm run build
```

4. Restart webserver / containers so PHP picks up installed `.mo` files.

5. Verify:
   - Use **Admin → System → Debug** and open the **Locale Support** card to confirm the OS locale is installed and translations are available.
   - Browse the UI to confirm translated strings render correctly.

6. Commit & publish:
   - Commit the changed `src/locale/i18n/*.json` files (and `locale/messages.po` if `npm run locale:build` changed it) and open a PR in the ChurchCRM repository.
