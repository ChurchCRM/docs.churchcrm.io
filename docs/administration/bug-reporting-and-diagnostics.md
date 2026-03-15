---
title: Bug Reporting & Diagnostics
sidebar_position: 15
---

# Bug Reporting & Diagnostics Guide

Thank you for helping improve ChurchCRM! This guide will help you report bugs effectively and gather diagnostic information that helps us solve your issue faster.

## 🚀 Quick Path to Help

**Choose your situation:**

1. **Need Help or Have Questions** → Post on [GitHub Discussions](https://github.com/ChurchCRM/CRM/discussions) (community support)
2. **Found a Bug** → Use [Bug Report Template](#github-bug-report-template) on GitHub Issues
3. **Problem Inside ChurchCRM App** → Use in-app bug reporting (auto-collects diagnostics)
4. **Cannot Log In / Installation Issue** → See [Collect Diagnostics](#collect-diagnostics)

### Help vs Bug Reports

**Use [GitHub Discussions](https://github.com/ChurchCRM/CRM/discussions) for:**
- How do I...? (feature questions)
- How do I configure...? (setup questions)
- Installation/setup help
- Troubleshooting specific to your setup
- General support questions

**Use [GitHub Issues](https://github.com/ChurchCRM/CRM/issues) for:**
- Something doesn't work that should
- Error messages or crashes
- Features not behaving as documented
- Reproducible bugs

---

## In-App Bug Reporting (Recommended)

**This is the fastest way to get help:**

1. Log into your ChurchCRM instance
2. In the menu, go to **Support** → **Report an Issue**
3. Describe your problem
4. **System info is automatically captured** ✓
5. Logs are automatically included ✓
6. Submit - our team will receive it immediately

**Why this is best:**
- ✅ Automatically collects your environment details
- ✅ Includes your system logs
- ✅ Includes your configuration (sanitized for privacy)
- ✅ No need to manually collect diagnostic info

---

## Collect Diagnostics

If you need to report via GitHub or can't access the in-app tool, gather this information:

### Your Setup

```
- ChurchCRM Version: [e.g., 6.0.0]
- Installation Type: [Shared Hosting / Self-Hosted Linux / Docker / Other]
- Hosting Provider: [e.g., Bluehost, AWS, etc. - if applicable]

- Operating System: [e.g., Windows / macOS / Linux]
- Web Server: [Apache / Nginx / Other]
- PHP Version: [e.g., 8.2.5]
- Database: [MySQL 8.0.11+ / MariaDB 10.5+ / Other and version]

- Browser: [e.g., Chrome, Firefox, Safari]
- Browser Version: [e.g., 120.0]
```

### Your Logs

**Three Ways to Get Logs** (in order of ease):

#### Option 1: Admin UI (Easiest - No file access needed)
1. Log in to ChurchCRM as **admin**
2. Go to **Admin** → **System Logs**
3. Filter by **ERROR** or **CRITICAL** level
4. Click **View** (eye icon) on relevant log file
5. Copy the error messages

#### Option 2: cPanel File Manager (Shared Hosting)
1. Log in to **cPanel**
2. Click **File Manager**
3. Navigate to your ChurchCRM directory (usually `public_html/churchcrm`)
4. Open the `logs/` folder
5. Download today's `-app.log` file (e.g., `2025-11-17-app.log`)
6. Open in a text editor and find **[ERROR]** entries

#### Option 3: SSH (Self-Hosted/VPS)
```bash
# SSH into your server, then:
cd /var/www/vhosts/churchcrm/logs/

# View today's errors
grep ERROR 2025-11-17-app.log

# Or view last 100 lines
tail -100 2025-11-17-app.log

# Or search specific time window
grep "2025-11-17 14:" 2025-11-17-app.log | grep ERROR
```

#### Option 4: cPanel Error Log (Apache Level)
1. Log in to **cPanel**
2. Click **Error Log** (in Main section)
3. Look for messages around the time of your issue
4. Copy relevant entries

### What to Look For in Logs

When reviewing logs, focus on:

```
[ERROR] - Error messages (usually important)
[CRITICAL] - Critical errors (almost always relevant)
[WARNING] - Warnings (sometimes helpful)

Ignore:
[DEBUG] - Debug info (unless specifically asked)
[INFO] - Info messages (usually not relevant)
[NOTICE] - Notices (usually not relevant)
```

**Example error to copy:**
```
[2025-11-17T14:35:22.123456+00:00] appLogger.ERROR: Unable to connect to database
    Error {
        "message":"Connect error",
        "database":"churchcrm",
        "user":"churchcrm_user"
    }
```

---

## GitHub Bug Report Template

**Use this format when reporting on GitHub:**

### Title
```
Bug: [Brief description]
```

### Description
Copy and fill in:

```markdown
## What happened?
[Describe the issue in clear, simple terms]

## Steps to reproduce
1. Go to '...'
2. Click on '...'
3. Observe error

## What I expected
[What should have happened instead]

## Environment
- ChurchCRM Version: [e.g., 6.0.0]
- Installation: [Shared Hosting / Self-Hosted / Docker]
- Hosting Provider: [if applicable]
- PHP Version: [e.g., 8.2]
- Database: [MySQL 8.0.11+ / MariaDB 10.5+]
- Browser: [Chrome / Firefox / Safari]

## Error Messages or Logs

### ChurchCRM Log (from Admin → System Logs)
[Paste ERROR/CRITICAL entries here, wrapped in ```code``` blocks]

### Apache/Server Error Log
[If available, paste relevant Apache error log entries]

## Screenshots
[If applicable, paste or attach screenshots showing the issue]

## Additional Info
[Anything else that might help - custom fields, plugins, recent changes, etc.]
```

---

## Privacy & Security

**Before sharing logs:**

1. **Redact sensitive information** (usernames, IP addresses, domains, etc.)
2. **Be consistent** when redacting - use `[REDACTED]` for all instances
3. **Never share** database passwords or API keys
4. **System info** (PHP version, server type) is safe to share

Example redacted log:
```
[2025-11-17T14:35:22] authLogger.INFO: User login attempt: [REDACTED]
    Connection from: [REDACTED IP]
    User-Agent: Chrome/120.0
```

---

## How to Format Logs in GitHub

**Always wrap logs in code blocks:**

````markdown
```
[2025-11-17T14:35:22] error message here
[2025-11-17T14:35:23] another error here
```
````

This makes them:
- ✅ Easy to read
- ✅ Searchable
- ✅ Copyable by developers

**Don't:**
- ❌ Screenshot logs (can't be searched or copied)
- ❌ Paste raw text without code block
- ❌ Share entire log file unformatted

---

## What Happens Next?

1. **Issue Created**: Your bug report is received
2. **Triage**: Team reviews the logs and environment
3. **Investigation**: Developers reproduce or research the issue
4. **Response**: You'll get a comment with next steps
5. **Resolution**: Either a fix is released or workaround provided

**You'll receive updates via:**
- GitHub issue comments (if reported on GitHub)
- In-app support system (if reported via ChurchCRM)

---

## Still Need Help?

- **Wiki Troubleshooting**: [Troubleshooting Guide](Troubleshooting)
- **Logging Details**: [Logging & Diagnostics](Logging-and-Diagnostics)
- **System Requirements**: [System Requirements](ChurchCRM-Application-Platform-Prerequisites)
- **Discord Chat**: [ChurchCRM Community Chat](https://discord.gg/tuWyFzj3Nj)
- **GitHub Issues**: [Browse existing issues](https://github.com/ChurchCRM/CRM/issues)

---

## Reporting Security Issues

**For security vulnerabilities, DO NOT create a public GitHub issue.**

Instead, see [Security Policy](Security.md#reporting-vulnerabilities) for responsible disclosure.

---

**Thank you for helping make ChurchCRM better!** 🙏
