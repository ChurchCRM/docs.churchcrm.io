---
title: Email Setup
sidebar_position: 5
---

# Email Setup (Administrator)

This guide covers configuring email for ChurchCRM so the system can send notifications, password resets, and bulk emails to your congregation.

## Overview

ChurchCRM uses email for:

- **System notifications** — password resets, new user setup
- **Parent alerts** — kiosk check-in notifications to parents
- **Cart email** — opens your email client with recipients (no server config needed)
- **Mailchimp** — bulk newsletters (configured separately in Integration settings)

For outbound email (notifications, alerts), configure **Admin** → **Edit General Settings** → **Email Settings**.

---

## Step-by-step: Configuring SMTP

1. Log in to ChurchCRM as an administrator.
2. Go to **Admin** → **Edit General Settings**.
3. Select the **Email Settings** tab.
4. Enter the following:
   - **SMTP Host** — Your mail server (e.g., `smtp.gmail.com`, `mail.yourchurch.org`)
   - **SMTP Port** — Usually 465 (SSL) or 587 (TLS)
   - **SMTP Username** — Your email account username
   - **SMTP Password** — Your email account password
   - **Default "To" Email** — Address for system requests (e.g., `webmaster@yourchurch.org`)
5. Click **Save**.

![TODO-SCREENSHOT: Email Settings tab in Admin General Settings showing SMTP configuration fields](/img/placeholder.png)

---

## Common SMTP Providers

### Gmail

1. Enable [2-Step Verification](https://myaccount.google.com/security) on your Google account.
2. Create an [App Password](https://myaccount.google.com/apppasswords).
3. In ChurchCRM:
   - **SMTP Host**: `smtp.gmail.com`
   - **SMTP Port**: 587 (TLS) or 465 (SSL)
   - **SMTP Username**: Your Gmail address
   - **SMTP Password**: The App Password (not your regular password)

### Microsoft 365 / Outlook

- **SMTP Host**: `smtp.office365.com`
- **SMTP Port**: 587
- **SMTP Username**: Your full email address
- **SMTP Password**: Your account password

### Church Hosting (cPanel, Plesk, etc.)

Use your hosting provider's SMTP server — often the same as your incoming mail server:

- **SMTP Host**: `mail.yourchurch.org` or the hostname provided by your host
- **SMTP Port**: 465 (SSL) or 587 (TLS)
- **SMTP Username**: Your email address
- **SMTP Password**: Your email password

---

## Testing Email

1. After saving settings, use **Admin** → **Edit General Settings** → **Email Settings**.
2. Look for a **Send Test Email** or **Test** button if available.
3. Or trigger a password reset for a test user to verify delivery.

---

## Troubleshooting

### "Could not send email"

- **Check SMTP credentials** — Username and password must be correct.
- **Check SMTP port** — 587 (TLS) or 465 (SSL) are typical; some hosts block 25.
- **Check firewall** — Ensure outbound connections to your SMTP port are allowed.

### Gmail "Less secure app" or "App password required"

- Use an [App Password](https://myaccount.google.com/apppasswords), not your regular Gmail password.
- 2-Step Verification must be enabled to create App Passwords.

### Emails go to spam

- Configure SPF, DKIM, and DMARC for your domain.
- Use a reputable SMTP provider or your church's official mail server.

---

## Related

- [User Guide: Email](/user-guide/email) — Sending emails to members (user perspective)
- [Secret Keys](/administration/secret-keys) — 2FA and TOTP configuration
- [Kiosk Devices](/user-guide/kiosk-devices) — Parent alert notifications
