---
title: Localization
sidebar_position: 5
---

# Localization

ChurchCRM supports more than 45 languages. The application language is configured in **Admin** → **General Settings** → **Localization**.

Select the appropriate language from the dropdown and save the settings. The interface will switch to the selected language immediately.

> **Note:** Translations are community-contributed and may be incomplete for some languages. If you encounter untranslated strings, the text will fall back to English.

## How to translate ChurchCRM (brief)

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
- Use **Admin** → **System** → **Debug** and open the **Locale Support** card to confirm the OS locale is installed and translations are available.
- Browse the UI to confirm translated strings render correctly.

6. Commit & publish:
- Commit `locale/terms/messages.po` (and generated frontend JSON if your workflow requires it) and open a PR, or sync via POEditor integration.

For a complete developer-oriented guide (commands, POEditor API examples, and troubleshooting), see the Localization management guide: https://github.com/ChurchCRM/CRM/blob/master/wiki/Localization-Management.md
