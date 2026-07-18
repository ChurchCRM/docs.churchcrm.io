---
title: Localization & Formats
sidebar_position: 5
---

# Localization & Formats

:::info Available since 7.4.1
The dedicated **Localization & Formats** page was introduced in ChurchCRM 7.4.1. In earlier versions, these settings were split between Church Info and System Settings.
:::

All locale and format settings live in one place: **Admin → Localization & Formats** (path: `admin/system/localization`).

---

## Language & Region

ChurchCRM supports **42 languages**.

:::note Updated in 7.4.3
All 42 supported languages were reviewed and updated in ChurchCRM 7.4.3 to cover new menu options and alert messages added in this release. If you use a non-English locale, update to 7.4.3 to get the latest translations for your language.
:::

| Setting | Description |
|---------|-------------|
| Application language | Default UI language for all users. Overridable per user in User Settings. |
| Time zone | Server time zone used for all date/time calculations and displays. |
| Distance unit | Miles or kilometers — used in mapping and address features. |

The language picker shows each locale's **native name**, **translation completeness %**, and whether the GNU locale is installed on your server.

### Browser language auto-detection

When an unauthenticated user visits ChurchCRM (e.g., the login page), the application detects the browser's preferred language and displays the UI in that language automatically — if a translation exists. No configuration is required. Once a user logs in, their saved locale preference takes effect.

### Per-user locale override

Each user can set their own preferred language in **My Settings → Localization**, overriding the system-wide default. This allows multilingual teams to work in their own language on the same installation.

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
# produces: locale/terms/messages.po
```

2. Translate:
   - Recommended: Upload `locale/terms/messages.po` to POEditor (project-managed translations) and translate there.
   - Alternative: Edit the `.po` file locally with Poedit or similar.

3. Download & build translated assets:

```bash
npm run locale:download
npm run deploy   # or npm run build
```

4. Restart webserver / containers so PHP picks up installed `.mo` files.

5. Verify:
   - Use **Admin → System → Debug** and open the **Locale Support** card to confirm the OS locale is installed and translations are available.
   - Browse the UI to confirm translated strings render correctly.

6. Commit & publish:
   - Commit `locale/terms/messages.po` (and generated frontend JSON if your workflow requires it) and open a PR, or sync via POEditor integration.

For a complete developer-oriented guide (commands, POEditor API examples, and troubleshooting), see the [Localization management guide](https://github.com/ChurchCRM/CRM/wiki/Localization).
