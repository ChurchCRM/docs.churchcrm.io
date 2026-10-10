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

For outbound email (notifications, alerts), open **Communication → Email** and click **Email Settings**.

---

## Step-by-step: Configuring SMTP

1. Log in to ChurchCRM as an administrator.
2. Go to **Communication → Email**.
3. Click **Email Settings**.
4. Enter the following:
   - **Enable Email**
   - **SMTP Host** — one field for the server, with the port in the same value when your provider needs it (for example `smtp.gmail.com:587` or `mail.yourchurch.org:465`)
   - **Encryption** — **None**, **TLS**, or **SSL**
   - **SMTP Username** and **SMTP Password** when **SMTP Authentication** is on
   - **Copy Church Email** — address that receives a copy of mail ChurchCRM sends
5. Save the settings panel.

There is no separate SMTP port, sender name, or reply-to field.

---

## Common SMTP Providers

### Gmail

1. Enable [2-Step Verification](https://myaccount.google.com/security) on your Google account.
2. Create an [App Password](https://myaccount.google.com/apppasswords).
3. In ChurchCRM:
   - **SMTP Host**: `smtp.gmail.com:587`
   - **Encryption**: **TLS** (use `smtp.gmail.com:465` with **SSL** if your host requires it)
   - **SMTP Username**: Your Gmail address
   - **SMTP Password**: The App Password (not your regular password)

### Microsoft 365 / Outlook

- **SMTP Host**: `smtp.office365.com:587`
- **Encryption**: **TLS**
- **SMTP Username**: Your full email address
- **SMTP Password**: Your account password

### Church Hosting (cPanel, Plesk, etc.)

Use your hosting provider's SMTP server — often the same as your incoming mail server:

- **SMTP Host**: `mail.yourchurch.org:587` or the hostname and port your host gives you
- **Encryption**: **TLS** or **SSL**, matching that port
- **SMTP Username**: Your email address
- **SMTP Password**: Your email password

---

## Testing Email

1. After saving settings, stay on **Communication → Email**.
2. Click **Debug**. ChurchCRM tries to send a message with the subject **ChurchCRM Test Email**.
3. Or trigger a password reset for a test user to verify delivery.

---

## Troubleshooting

### "Could not send email"

- **Check SMTP credentials** — Username and password must be correct.
- **Check the port on SMTP Host** — `:587` with **TLS** or `:465` with **SSL** is typical; some hosts block port 25.
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
