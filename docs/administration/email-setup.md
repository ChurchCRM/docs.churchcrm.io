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
- **Messages from the composer** — since 7.8.0, users with the Email permission send messages to a person, a family, a group, or the cart from inside ChurchCRM (see [User Guide: Email](/user-guide/email)). Without a mail server the composer falls back to copying addresses or opening the user's own mail program.
- **Mailchimp** — bulk newsletters (configured separately in Integration settings)

For outbound email (notifications, alerts, composer messages), open **Communication** → **Email** and click **Email Settings**.

---

## Step-by-step: Configuring SMTP

1. Log in to ChurchCRM as an administrator.
2. Open **Communication** → **Email**. The **Email Dashboard** opens.
3. Click **Email Settings** at the top of the page. The settings panel opens; **Gmail (SMTP)** and **Outlook / Microsoft 365** fill in the server settings for those providers.
4. Enter the following:
   - **Enable Email** — must be on. Required for password resets, notifications, and the composer's **Send Email** button.
   - **SMTP Host** — Your mail server and its port (e.g., `smtp.gmail.com:587`, `mail.yourchurch.org:465`). Port 587 is usually used with TLS and 465 with SSL.
   - **Encryption** — The encryption your server expects, usually TLS.
   - **SMTP Authentication** — On when your server needs a username and password, which most do.
   - **SMTP Username** — Your email account username
   - **SMTP Password** — Your email account password
   - **Copy Church Email** — The church's own address (e.g., `office@yourchurch.org`). The composer offers it as a removable extra recipient when a user copies a list of addresses or opens their mail program.
5. Click **Save Settings**.

The other settings in the panel (**SMTP Timeout**, **Auto TLS**, **Do Not Email Property**, **Default Inbox Preview Text**) can usually stay as they are. **All System Settings** opens the full settings page.

:::note What turns on sending from the composer
The **Send Email** button and the paper-plane buttons next to email addresses appear only when the SMTP host is set (with a username and password if authentication is on) **and** email sending is enabled. Users additionally need the **Email** permission on their account (**Admin** → **System Users**). Until both are in place, the composer offers **Copy Addresses** and **Open in Email Client** only.
:::

Every email ChurchCRM sends ends with the church's contact block (name, address, phone, email, website) as shown in the **Display Preview** on **Admin** → **Church Information**. Keep that page current so recipients know who wrote to them.

---

## Common SMTP Providers

### Gmail

1. Enable [2-Step Verification](https://myaccount.google.com/security) on your Google account.
2. Create an [App Password](https://myaccount.google.com/apppasswords).
3. In ChurchCRM:
   - **SMTP Host**: `smtp.gmail.com:587` (TLS) or `smtp.gmail.com:465` (SSL)
   - **SMTP Username**: Your Gmail address
   - **SMTP Password**: The App Password (not your regular password)

### Microsoft 365 / Outlook

- **SMTP Host**: `smtp.office365.com:587`
- **SMTP Username**: Your full email address
- **SMTP Password**: Your account password

### Church Hosting (cPanel, Plesk, etc.)

Use your hosting provider's SMTP server — often the same as your incoming mail server:

- **SMTP Host**: `mail.yourchurch.org` or the hostname provided by your host, followed by the port: `:465` (SSL) or `:587` (TLS)
- **SMTP Username**: Your email address
- **SMTP Password**: Your email password

---

## Testing Email

1. After saving settings, click **Debug** on the **Email Dashboard** (**Communication** → **Email**). ChurchCRM sends a test message, *ChurchCRM Test Email*, to the church email address set on **Admin** → **Church Information**, and says whether the mail server accepted it.
2. Check that mailbox, including its spam folder, to confirm the message arrived.
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
