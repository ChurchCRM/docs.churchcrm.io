---
title: Self-Hosted on Linux
sidebar_position: 3
---

# Self-hosting on Linux

Quick reference for Linux-based ChurchCRM installations.

## Installation Guides

* **[Rocky Linux 8](Self‐Hosted-on-RockyLinux)** - Recommended for new Linux installations
* **[Development Setup](Development)** - Set up local development environment with Docker

## System Configuration

### PHP Max Execution Time
While most ChurchCRM functionality works fine with low `max_execution_time`, some operations need higher values:
- **Backup/Restore**: May require 120+ seconds
- **Large data operations**: Depends on database size, photos, server speed

**To increase:**
```bash
# Edit php.ini
sudo nano /etc/php.ini
# Change or add: max_execution_time = 300
# Restart Apache: sudo systemctl restart httpd
```

**More details:** [PHP Max Execution Time Guide](https://www.simplified.guide/php/increase-max-execution-time)

### Rocky Linux Repositories
To add the Remi repository for useful PHP packages:

```bash
# Enable extras repository
sudo dnf config-manager --set-enabled extras

# Install EPEL (Extra Packages for Enterprise Linux)
sudo dnf install epel-release

# Install Remi repositories
sudo dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm

# Verify Remi-modular is enabled
dnf repolist
```

### System Locale (Localization)
To set the system locale for ChurchCRM translations:

1. **Set system locale** (example: Spanish)
   ```bash
   sudo locale-gen es_ES
   ```

2. **In ChurchCRM Admin:**
   - Click **Admin** → **Edit General Settings**
   - Select **Settings** tab
   - Click **System Settings**
   - Select **Localization** tab
   - Change `sLanguage` to your desired language

### SSL/HTTPS Security
ChurchCRM highly recommends running with SSL configured:

- **ChurchCRM indicator:** Will show admin task if SSL not detected
- **HSTS support:** Can issue HTTP Strict Transport Security header

**To enable HSTS:**
- Click **Admin** → **Edit General Settings**
- Select **System Settings** tab
- Scroll to `bHSTSEnable`
- Set to TRUE

---

## External Resources

* [Installing on Ubuntu 18.04+](https://websiteforstudents.com/install-churchcrm-on-ubuntu-18-04-16-04-with-apache2/) - Community guide for Ubuntu/Debian-based systems

> **Note**: External guides may reference older PHP versions. Verify [System Requirements](ChurchCRM-Application-Platform-Prerequisites) for current PHP version needed.

## See Also

* **[Installation Hub](Installation)** - All installation methods
* **[System Requirements](ChurchCRM-Application-Platform-Prerequisites)** - PHP, database, and server requirements
* **[Troubleshooting](Troubleshooting)** - Fix common issues
