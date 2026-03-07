---
title: Server Locale Requirements
sidebar_position: 7
---

# Server Locale Requirements

ChurchCRM uses **GNU gettext** for internationalization and translation support. For translations to work, the **server operating system must have the required locales installed**. This is a system-level requirement configured outside ChurchCRM.

## System vs User Localization

- **System-wide (server) locale:** The server default locale is used for unauthenticated users, background jobs, and when PHP calls `setlocale()` during page rendering. This is the locale that GNU `gettext` relies on to load `.mo` files for server-rendered strings.
- **User locale override:** Logged-in users can set a preferred language in their profile. When present, the user preference overrides the system default for that user session and UI rendering.
- **Client-side (JS) vs server-side (PHP):** ChurchCRM uses two localization systems: PHP/Gettext for server-rendered strings and JavaScript/i18next (or compiled JSON files) for client-side UI. Both must be present and kept in sync to avoid partially translated pages.

Precedence: User preference → System default → Browser/Accept-Language → Super-base (English).

## Why Server Locales Are Required

The PHP `gettext` extension uses the operating system's locale libraries. When you select a language in ChurchCRM:

1. ChurchCRM calls PHP's `setlocale()` with the selected language code
2. PHP gettext looks for that locale on the system
3. If the locale is **not installed**, gettext silently falls back to English
4. Translation files (`.mo`) are only loaded if the system locale exists

:::important Not enough to have .po/.mo files
Translation files in ChurchCRM are not sufficient. The system must have the locale installed.
:::

---

## Check Installed Locales

### Debian/Ubuntu

```bash
locale -a
locale -a | grep es_ES
```

### Rocky Linux / RHEL / CentOS

```bash
localectl list-locales
localectl list-locales | grep es_ES
```

---

## Install Locales

### Debian/Ubuntu

```bash
# Install specific locale (e.g., Spanish)
sudo locale-gen es_ES.UTF-8

# Multiple locales
sudo locale-gen es_ES.UTF-8 fr_FR.UTF-8 de_DE.UTF-8
sudo update-locale
```

**Alternative** — edit `/etc/locale.gen`, uncomment the locales you need, then run `sudo locale-gen`.

### Rocky Linux / RHEL / CentOS

```bash
# Install language pack (e.g., Spanish)
sudo dnf install glibc-langpack-es

# Multiple packs
sudo dnf install glibc-langpack-es glibc-langpack-fr glibc-langpack-de
```

### Common Language Packs

| Language | Debian/Ubuntu | Rocky/RHEL |
|----------|---------------|------------|
| Spanish | `locale-gen es_ES.UTF-8` | `dnf install glibc-langpack-es` |
| French | `locale-gen fr_FR.UTF-8` | `dnf install glibc-langpack-fr` |
| German | `locale-gen de_DE.UTF-8` | `dnf install glibc-langpack-de` |
| Portuguese (Brazil) | `locale-gen pt_BR.UTF-8` | `dnf install glibc-langpack-pt` |
| Chinese | `locale-gen zh_CN.UTF-8` | `dnf install glibc-langpack-zh` |
| Japanese | `locale-gen ja_JP.UTF-8` | `dnf install glibc-langpack-ja` |

---

## Enable in ChurchCRM

After installing system locales:

1. Log in as administrator
2. Go to **Admin** → **Edit General Settings**
3. Open the **Localization** (or **System Settings** → **Localization**) tab
4. Set **Language** to the desired locale
5. Save

---

## Troubleshooting

### Translations not appearing

1. Verify the locale is installed: `locale -a | grep <locale>`
2. Install the missing locale (see above)
3. Restart the web server:
   ```bash
   sudo systemctl restart apache2   # or httpd
   # or for PHP-FPM + nginx:
   sudo systemctl restart php-fpm nginx
   ```
4. Clear browser cache and reload ChurchCRM

### Debugging partial localization (PHP vs JS)

If some parts of the UI are translated and others are not, check both systems:

1. PHP / Gettext
   - Confirm `.mo` files exist under `locale/LC_MESSAGES/messages.mo` (or your configured textdomain path).
   - Verify the active locale via a small PHP test page that calls `setlocale(LC_ALL, 0)` and prints the result.
   - Ensure PHP's `gettext` extension is installed (`php -m | grep gettext`) and that the server has the matching system locale installed.

2. JavaScript / i18next (client)
   - Ensure the compiled JSON files exist in `src/locale/i18n/` (or `src/locale/textdomain` depending on your build).
   - Open the browser devtools Network tab and confirm the i18n JSON file for the chosen locale is being fetched (200 OK). If missing, your build step may not have produced the file.
   - Check the console for i18next errors or missing-key fallbacks.

3. Synchronization
   - Run the localization build and download pipeline locally: `npm run locale:build` → upload `.po` files to POEditor → `npm run locale:download` to fetch both approved translations and missing-term batches.
   - If server pages (PHP) remain English while client UI is translated, the server locale is likely missing; install the OS locale and restart the webserver / PHP-FPM.

4. Quick checks
   - Confirm user locale setting in Admin → Edit General Settings (and user profile preference).
   - Verify `src/locale/i18n/<locale>.json` exists and contains translated keys.
   - Check file permissions on `src/locale/i18n` and `locale/terms` so the web user can read them.


### Verify PHP gettext extension

```bash
php -m | grep gettext
# Install if missing: apt install php-gettext  or  dnf install php-gettext
```

### Shared hosting

If you're on shared hosting (cPanel, etc.):

- Contact your provider to request locale installation
- Many providers pre-install common locales (es_ES, fr_FR, de_DE)
- If locales can't be installed, consider hosting that supports your required languages

---

## Related

- [Localization](/administration/localization) — ChurchCRM localization overview
- [First Run Configuration](/getting-started/first-run) — System Locale section

## Requesting locale installation from your hosting provider

If you use shared hosting or a managed platform and cannot install locales yourself, share this message with your hosting provider. It explains what to install and why:

---

Subject: Request to install system locales and PHP i18n support for ChurchCRM

Hello,

We are running ChurchCRM (a PHP application) and need the following server-side localization support so translations work correctly for our users:

- Install the requested system locales (UTF-8 variants). Example locales we need: `en_US.UTF-8`, `en_GB.UTF-8`, `es_ES.UTF-8`, `fr_FR.UTF-8`, `de_DE.UTF-8`, `pt_BR.UTF-8`, `zh_CN.UTF-8`, `zh_TW.UTF-8`. Please install the relevant locales for our target audience.
- On Debian/Ubuntu: run `locale-gen <locale>` and `update-locale` or uncomment and run `sudo locale-gen` for required entries.
- On RHEL/CentOS/Rocky: install language packs, e.g. `sudo dnf install glibc-langpack-es glibc-langpack-fr`.
- Ensure UTF-8 variants are available (e.g., `es_ES.UTF-8`) rather than legacy encodings.
- Restart the webserver and PHP-FPM after installation.
- Please confirm PHP has the `gettext` extension enabled (and `intl` if available). You can check with `php -m | grep gettext` and `php -m | grep intl` and enable packages if missing.

Why this is needed: PHP's `gettext` reads system locale data to load translation files (`.mo`). Without the system locales installed, ChurchCRM will silently fall back to English even if translation files are present.

Thank you — please respond with confirmation and the list of locales you installed.

---

You can paste or email that directly to your hosting support team.
