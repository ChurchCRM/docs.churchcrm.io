---
title: Server Locale Requirements
sidebar_position: 7
---

# Server Locale Requirements

ChurchCRM uses **GNU gettext** for internationalization and translation support. For translations to work, the **server operating system must have the required locales installed**. This is a system-level requirement configured outside ChurchCRM.

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
