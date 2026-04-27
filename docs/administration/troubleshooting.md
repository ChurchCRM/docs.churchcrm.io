---
title: Troubleshooting
sidebar_position: 11
---

# Troubleshooting

## 🔍 Step 1: Check Your Logs (Fastest Solution!)

**Most problems can be self-diagnosed by examining logs!** Start here:

### For ChurchCRM Administrators (Easiest)
**Built-in Log Viewer** - No file access needed:
1. Log in to ChurchCRM as an **admin user**
2. Go to **Admin** → **System Logs**
3. View logs directly in the web interface
4. Filter by log level (DEBUG shows the most details)
5. Look for **ERROR** or **CRITICAL** entries

### For Shared Hosting (cPanel)
**Access via cPanel File Manager or FTP:**
1. Log in to your **cPanel** control panel
2. Navigate to **File Manager** or use **FTP/SFTP**
3. Find your ChurchCRM directory (usually `public_html/churchcrm`)
4. Navigate to the `logs/` subdirectory
5. Download today's `-app.log` file (named like `2025-11-17-app.log`)
6. Open in a text editor and look for **[ERROR]** or **[CRITICAL]** lines

### For Self-Hosted/VPS (SSH Access)
**Access via SSH:**
```bash
# Navigate to ChurchCRM logs
cd /var/www/vhosts/churchcrm/logs/
# View today's log (replace date)
tail -100 2025-11-17-app.log
# or search for errors
grep ERROR 2025-11-17-app.log
```

### Apache Error Logs
If ChurchCRM logs don't show the issue:
- **Shared Hosting (cPanel)**: Check **cPanel** → **Error Log** (usually in Main section)
- **Self-Hosted/VPS**: `grep ERROR /var/log/apache2/error_log` (or `/var/log/httpd/error_log`)

**See [Logging and Diagnostics](Logging-and-Diagnostics) guide for detailed log information.**

---

## Common errors

### 500 Internal Server Error

A 500 error immediately after install is almost always a **file permissions** problem. Your web server user needs to read the files, but PHP scripts must not be world-writable or have the execute bit set.

| Platform | Fix |
|----------|-----|
| **Shared hosting (cPanel)** | In cPanel File Manager: select all files → Permissions → set files to `644`, directories to `755`. Do **not** use `755` on files — PHP scripts with the execute bit cause 500s on many shared hosts. |
| **Ubuntu / Debian** | `sudo chown -R www-data:www-data /var/www/html/churchcrm` |
| **Rocky Linux / RHEL** | `sudo chown -R apache:apache /var/www/html/churchcrm` |

If permissions look correct, check logs (Step 1 above). Other causes:
- A missing PHP extension — see [System Requirements](/installation/system-requirements)
- `mod_rewrite` not enabled — see the install guide for your platform
- PHP below the minimum — requires PHP 8.2 or higher

See [File System Permissions](/administration/file-system-permissions) for full details.

---

## Step 2: Still Having Issues?

**Get help from the community on GitHub Discussions:**
- **[Troubleshooting Discussions](https://github.com/ChurchCRM/CRM/discussions/categories/troubleshooting)** - Share your issue and get community help
- **[General Questions](https://github.com/ChurchCRM/CRM/discussions/categories/general-questions)** - General questions about features
- **[Administrator Questions](https://github.com/ChurchCRM/CRM/discussions/categories/administrator-questions)** - System administration help

If you've identified a bug, check GitHub issues:

* [Installation / Upgrade](https://github.com/ChurchCRM/CRM/issues?utf8=%E2%9C%93&q=is%3Aissue%20label%3A%22Installation%20%2F%20Upgrade%22%20)
* [Platform: Self Hosted](https://github.com/ChurchCRM/CRM/issues?q=is%3Aissue+setup+label%3A%22Platform%3A+Self-Hosted%22)
* [Platform: Shared Hosting](https://github.com/ChurchCRM/CRM/issues?utf8=%E2%9C%93&q=label%3A%22Platform%3A%20Shared%20Hosting%20%22%20)
* [Platform: Database](https://github.com/ChurchCRM/CRM/issues?q=label%3A%22Platform%3A+Database%22)

**When you open an issue on GitHub:**
- An auto-comment will appear with diagnostic collection tips
- Follow the guidance in that comment to help us help you faster

---

## User Language Preference Not Switching

### Symptom
You change your language preference in **My Settings → Localization** or **Admin → General Settings**, but the interface remains in the original language (often the system default). The preference appears to save, but translations don't switch.

### Prerequisites
- **First, verify system locales are installed** — See [Server Locale Requirements](/administration/server-locale). If you haven't installed the required system locale on your server, translations will not work. This is the most common cause.

### Root Cause (LAMP Environments Only)
After verifying locales are installed, if the language still doesn't switch, the issue is in the PHP gettext initialization. This is a **known limitation in PHP/gettext on LAMP stacks**:

1. **System-level constraint:** PHP's `gettext` extension is tightly coupled to the operating system's locale library. Once a locale catalog is loaded in a PHP process, it can be difficult to reload it without restarting the process.

2. **Process reuse:** PHP running under Apache (mod_php) or traditional LAMP setups may reuse PHP processes for multiple requests. If a previous request loaded `gettext` in locale A, switching to locale B on the next request may not fully reload the translation catalog.

3. **Supported environment:** ChurchCRM's localization is fully tested and supported on **LAMP stacks** (Linux + Apache + MySQL + PHP with mod_php). Other environments (Docker, Kubernetes, FPM, serverless) may have different behavior due to process lifecycle differences.

### Diagnostic Steps

1. **Confirm system locales are installed:**
   ```bash
   locale -a | grep <your_language>
   # Example: locale -a | grep fr_FR
   ```
   If the locale is not listed, see [Server Locale Requirements](/administration/server-locale) to install it.

2. **Verify the language preference is saved:**
   - Go to **Admin** → **System** → **Debug** and check the **Locale Support** card
   - Confirm the system shows your chosen locale (not the server default)

3. **Check webserver logs for errors:**
   - See Step 1 above for log locations
   - Look for `gettext`, `locale`, or `setlocale` errors

### Workarounds

#### For Self-Hosted / VPS (Recommended)
**Restart Apache** to clear PHP process state:
```bash
sudo systemctl restart apache2   # Debian/Ubuntu
# or
sudo systemctl restart httpd     # Rocky/RHEL/CentOS
```

This forces Apache to spawn fresh PHP processes that will properly reload translation catalogs.

#### For Shared Hosting
- Restart is not available on shared hosting
- Contact your hosting provider to request a PHP process restart or environment reset
- Some providers allow you to restart via cPanel → "Restart Services"

#### For Docker / Alternative Environments
If you're running ChurchCRM in Docker or another non-traditional setup, localization support is not fully tested:
- Consider using `docker-compose up --force-recreate` or restarting the container to clear PHP state
- Alternatively, use a LAMP stack on a VPS for full localization support

### Reporting the Issue
If restarting does not resolve the problem:
1. Confirm system locales are installed and visible in `locale -a`
2. Restart your webserver (see above)
3. Still not working? Post on [GitHub Discussions — Troubleshooting](https://github.com/ChurchCRM/CRM/discussions/categories/troubleshooting) with:
   - Your hosting environment (shared hosting, VPS, Docker, etc.)
   - Output of `locale -a | grep <your_language>`
   - Your webserver type and PHP version (`php -v`)

---

## Related Documentation
- [Localization](/administration/localization) — Language configuration overview
- [Server Locale Requirements](/administration/server-locale) — Installing system locales
