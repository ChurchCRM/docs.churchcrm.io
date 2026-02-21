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
