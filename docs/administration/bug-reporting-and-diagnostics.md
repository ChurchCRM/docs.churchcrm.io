---
title: Bug Reporting & Diagnostics
sidebar_position: 15
---

# Bug Reporting & Diagnostics Guide

Thank you for helping improve ChurchCRM! This guide will help you report bugs effectively and gather diagnostic information that helps us solve your issue faster.

## 🚀 Quick Path to Help

**Choose your situation:**

1. **Need Help or Have Questions** → Ask in [Discord](https://discord.gg/tuWyFzj3Nj)
2. **Found a Bug** → Use [Bug Report Template](#github-bug-report-template) on GitHub Issues
3. **Problem Inside ChurchCRM App** → Use in-app bug reporting (auto-collects diagnostics)
4. **Cannot Log In / Installation Issue** → See [Collect Diagnostics](#collect-diagnostics)

### Help vs Bug Reports

**Use [Discord](https://discord.gg/tuWyFzj3Nj) for:**
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

### Quick Reference

| Goal | Best Option |
|------|-------------|
| Report a bug | [In-app Support → Report Issue](#in-app-bug-reporting-recommended) |
| Request a feature | [GitHub Feature Request](https://github.com/ChurchCRM/CRM/issues/new?template=feature_request.yml) |
| Ask a question | [Discord](https://discord.gg/tuWyFzj3Nj) |
| Report a login issue | [GitHub Bug Report](https://github.com/ChurchCRM/CRM/issues/new?template=bug_report.yml) |
| Report a documentation problem | [Docs repository issue](https://github.com/ChurchCRM/docs.churchcrm.io/issues/new) |

---

## Before You Report

1. **Search existing issues** — your problem may already be reported.
2. **Check the documentation** — the answer may already be available.
3. **Try a different browser** — to rule out browser-specific issues.
4. **Clear your browser cache** — stale cached files can cause unexpected behavior.

---

## In-App Bug Reporting (Recommended)

**This is the fastest way to get help:**

1. Log into your ChurchCRM instance
2. In the menu, go to **Support** → **Report an Issue**
3. Describe your problem
4. **System info is automatically captured** ✓
5. Submit - our team will receive it immediately

**Why this is best:**
- ✅ Automatically collects your environment details
- ✅ Includes your locale, country, and time zone settings
- ✅ No need to manually collect diagnostic info

**What gets captured automatically:**

- ChurchCRM version
- Current page name
- Browser information (user agent, screen size, window size, page size, browser locale and time zone)
- System and user locales, church country, and system time zone
- Administrators only: server environment (platform, web server, PHP and SQL versions, installation ID, prerequisite status)

This information is essential for diagnosis and significantly speeds up issue resolution.

---

## When to Use GitHub Instead

Use GitHub issues if you cannot access ChurchCRM directly, or for cases the in-app tool does not cover:

- You want to request a new feature (use the Feature Request template below)
- You cannot log in (authentication issues)
- ChurchCRM is not yet installed
- The server is completely unreachable
- You are reporting a documentation problem — file it in the [documentation repository](https://github.com/ChurchCRM/docs.churchcrm.io/issues/new)
- You are reporting a development environment issue

---

## Collect Diagnostics

If you need to report via GitHub or can't access the in-app tool, gather this information:

### Your Setup

```
- ChurchCRM Version: [e.g., 7.7.1]
- Installation Type: [Shared Hosting / Self-Hosted Linux / Docker / Other]
- Hosting Provider: [e.g., Bluehost, AWS, etc. - if applicable]

- Operating System: [e.g., Windows / macOS / Linux]
- Web Server: [Apache / Nginx / Other]
- PHP Version: [e.g., 8.4.1]
- Database: [MySQL @@mysql@@+ / MariaDB @@mariadb@@+ / Other and version]

- Browser: [e.g., Chrome, Firefox, Safari]
- Browser Version: [e.g., 120.0]
```

### Your Logs

**Three Ways to Get Logs** (in order of ease):

#### Option 1: Admin UI (Easiest - No file access needed)
1. Log in to ChurchCRM as **admin**
2. Go to **Admin** → **System Logs**
3. Open a log and filter by **ERROR** or **WARNING**
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
[WARNING] - Warnings (sometimes helpful)

Ignore, unless someone asks for them:
[DEBUG] - Debug info
[INFO] - Info messages

The log level choices are only **DEBUG**, **INFO**, **WARNING**, and **ERROR**. Change that under **Admin → System Logs → Settings**.
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

Start from a template:

- [Bug Report](https://github.com/ChurchCRM/CRM/issues/new?template=bug_report.yml) — For software defects
- [Feature Request](https://github.com/ChurchCRM/CRM/issues/new?template=feature_request.yml) — For new functionality
- [Question](https://discord.gg/tuWyFzj3Nj) — For support questions, ask in Discord first; if it turns out to be a bug, it can move to GitHub
- [Documentation Problem](https://github.com/ChurchCRM/docs.churchcrm.io/issues/new) — For errors or gaps in these docs; documentation issues live in the docs repository, not the ChurchCRM repository

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
- ChurchCRM Version: [e.g., 7.7.1]
- Installation: [Shared Hosting / Self-Hosted / Docker]
- Hosting Provider: [if applicable]
- PHP Version: [e.g., 8.4]
- Database: [MySQL @@mysql@@+ / MariaDB @@mariadb@@+]
- Browser: [Chrome / Firefox / Safari]

## Error Messages or Logs

### ChurchCRM Log (from Admin → System Logs)
[Paste ERROR or WARNING entries here, wrapped in ```code``` blocks]

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

- **Troubleshooting**: [Troubleshooting Guide](/administration/troubleshooting)
- **Logging Details**: [Logging & Diagnostics](/administration/logging-and-diagnostics)
- **System Requirements**: [System Requirements](/installation/system-requirements)
- **Discord Chat**: [ChurchCRM Community Chat](https://discord.gg/tuWyFzj3Nj)
- **GitHub Issues**: [Browse existing issues](https://github.com/ChurchCRM/CRM/issues)

---

## Reporting Security Issues

**For security vulnerabilities, DO NOT create a public GitHub issue.**

Instead, see [Security Policy](./security.md) for responsible disclosure.

---

**Thank you for helping make ChurchCRM better!** 🙏
