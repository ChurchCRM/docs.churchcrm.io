---
title: Notifications
sidebar_position: 7
---

# Notifications

ChurchCRM sends several types of notifications — to administrators, to members, and to parents at kiosk check-in. This page explains each notification type and how to configure it.

---

## System Notifications (Banners)

ChurchCRM periodically checks for important system announcements (e.g., security advisories, new release notices) and displays them as a **dismissible banner** at the top of every admin page.

- Banners appear once per session after a new notice is fetched
- Each notice can be dismissed per user — it won't reappear for that user after dismissal
- Version matching supports wildcards (`7.1.*`, `7.*`) so notices apply to a range of versions
- Notices are fetched from a public feed; no account or API key is required

No configuration is needed. To suppress a notice, click **Dismiss** in the banner.

---

## Email Notifications

ChurchCRM sends transactional email for specific events. Email delivery requires a working [Email Setup](./email-setup.md) configuration.

| Trigger | Recipients | Notes |
|---------|-----------|-------|
| New user account created | The new user | Includes temporary password if set |
| Password reset requested | The user | Contains a reset link |
| Kiosk parent alert | Parent email on record | Sent when a child is checked out (if configured) |
| Event reminder | Event attendees | Must be triggered manually from the Events page |

### Configuring email

Go to **Admin → Email Settings** to configure your SMTP server, sender name, and sender address. See [Email Setup](./email-setup.md) for full details.

---

## Kiosk Parent Alerts

When a child is **checked out** at a kiosk station, ChurchCRM can send an email or SMS to the parent or guardian on record.

### Email alerts

Email alerts are sent automatically if:
1. The child's parent has an email address on record
2. The kiosk is configured to send checkout notifications (in kiosk settings)

### SMS alerts (Vonage plugin)

SMS checkout alerts require the **Vonage SMS** plugin:

1. Go to **Admin → Plugins** and enable the **Vonage SMS** plugin
2. Enter your Vonage API key and API secret in the plugin settings
3. In kiosk settings, set **Checkout notification method** to **SMS**

Once configured, parents receive an SMS when their child is checked out.

---

## OpenLP Integration (Notifications → Worship)

The **OpenLP** plugin allows ChurchCRM to push data (member names for announcements, attendance counts) to an OpenLP worship software instance running on the same network.

1. Go to **Admin → Plugins** and enable the **OpenLP** plugin
2. Enter the OpenLP host, port, and authentication credentials
3. Use the **Send to OpenLP** button on any list or attendance page to push the data

---

## Google Analytics (GA4)

ChurchCRM includes GA4 event tracking on authentication pages (login, 2FA, password reset). No notification is sent to users — this is server-side analytics reporting to your GA4 property.

To configure:

1. Enable the **Google Analytics** plugin under **Admin → Plugins**
2. Enter your GA4 Measurement ID in the plugin settings

---

## Related Pages

- [Email Setup](./email-setup.md) — SMTP configuration
- [Kiosk Devices](../user-guide/kiosk-devices.md) — Kiosk check-in and parent alerts
- [Plugins](./plugins/index.md) — Vonage SMS, OpenLP, Google Analytics plugins
