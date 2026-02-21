---
title: Self-Hosted on Linux
sidebar_position: 3
---

# Self-Hosted on Linux

Quick reference for Linux-based ChurchCRM installations.

## Installation Guides

- **[Rocky Linux](/installation/rocky-linux)** — Recommended for new Linux installations

## System Configuration

### PHP Max Execution Time

While most ChurchCRM functionality works fine with the default `max_execution_time`, some operations require higher values:

- **Backup/Restore:** May require 120+ seconds
- **Large data operations:** Depends on database size, photos, and server speed

**To increase:**

```bash
# Edit php.ini
sudo nano /etc/php.ini
# Change or add: max_execution_time = 300
# Restart Apache: sudo systemctl restart httpd
```

**Reference:** [PHP: max_execution_time](https://www.simplified.guide/php/increase-max-execution-time)

### System Locale (Localization)

To set the system locale for ChurchCRM translations:

1. **Set the system locale** (example: Spanish)
   ```bash
   sudo locale-gen es_ES
   ```

2. **In ChurchCRM Admin:**
   - Click **Admin** > **Edit General Settings**
   - Select the **Settings** tab
   - Click **System Settings**
   - Select the **Localization** tab
   - Change `sLanguage` to your desired language

### SSL / HTTPS

ChurchCRM strongly recommends running with SSL configured:

- ChurchCRM will display an admin task notification if SSL is not detected
- HSTS support is available to ensure browsers always connect over HTTPS

**To enable HSTS:**

- Click **Admin** > **Edit General Settings**
- Select the **System Settings** tab
- Scroll to `bHSTSEnable` and set it to `TRUE`

---

## External Resources

- [Installing on Ubuntu 18.04+](https://websiteforstudents.com/install-churchcrm-on-ubuntu-18-04-16-04-with-apache2/) — Community guide for Ubuntu/Debian-based systems

> **Note:** External guides may reference older PHP versions. Check the [System Requirements](/installation/system-requirements) page for the current PHP version requirement.

## See Also

- [Installation Overview](/installation) — All installation methods
- [System Requirements](/installation/system-requirements) — PHP, database, and server requirements
- [Troubleshooting](/administration/troubleshooting) — Common issues and solutions
