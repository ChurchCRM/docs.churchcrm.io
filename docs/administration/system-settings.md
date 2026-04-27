---
title: System Settings
sidebar_position: 8
---

# System Settings

ChurchCRM's system-wide configuration lives under **Admin → Settings**. This page covers every settings tab and the options within each one.

---

## General Settings

### Church Information

Found at **Admin → Church Info** (also accessible from the Admin Dashboard).

| Setting | Description |
|---------|-------------|
| Church name | Displayed in headers, emails, and PDF reports |
| Address, city, state, zip | Used for geocoding the church location on maps |
| Phone, email | Shown on contact pages and auto-emails |
| Latitude / Longitude | Override the auto-geocoded map position |
| Logo | Uploaded image used in PDF reports and email headers |

Church name is **required** — ChurchCRM will prompt you to set it on first run and will block certain features until it is configured.

---

## People Settings

| Setting | Description |
|---------|-------------|
| Default country | Pre-fills the country field on new person/family forms |
| Date format | Controls how dates display throughout the application |
| Person list columns | Choose which columns appear in the people list |
| Photo upload size limit | Maximum file size for member photo uploads |
| Self-registration | Allow members to create their own accounts (disabled by default) |

---

## Finance Settings

| Setting | Description |
|---------|-------------|
| Fiscal year start month | Used for financial period reports |
| Currency symbol | Displayed on donation and report pages |
| Tax-exempt number | Printed on tax statements |
| Default fund | Pre-selected fund for new donation entries |

---

## Email Settings

Email settings control outbound mail delivery. See [Email Setup](./email-setup.md) for the full configuration guide.

| Setting | Description |
|---------|-------------|
| SMTP host / port | Your outbound mail server |
| SMTP username / password | Authentication credentials |
| Sender name | "From" display name in outbound emails |
| Sender address | "From" email address |
| Reply-to address | Optional separate reply-to address |
| TLS/SSL | Encryption mode for the connection |

---

## Integration Settings

### Google Analytics (GA4)

Requires the **Google Analytics** plugin (Admin → Plugins → enable).

| Setting | Description |
|---------|-------------|
| GA4 Measurement ID | Your `G-XXXXXXXXXX` property ID |

Once set, login, 2FA, and password-reset page views are reported to GA4.

### Vonage SMS

Requires the **Vonage SMS** plugin.

| Setting | Description |
|---------|-------------|
| API key | Your Vonage account API key |
| API secret | Your Vonage account API secret |
| Sender number / name | The number or alphanumeric name SMS messages originate from |

### OpenLP

Requires the **OpenLP** plugin.

| Setting | Description |
|---------|-------------|
| OpenLP host | IP address or hostname of the OpenLP instance |
| OpenLP port | Default `4316` |
| Username / Password | OpenLP authentication (if enabled in OpenLP) |

---

## Locale & Language Settings

| Setting | Description |
|---------|-------------|
| Application language | Default UI language for all users (overridable per user in User Settings) |
| Date/time format | Server-side format string for dates |
| Week starts on | Sunday or Monday — affects calendar display |

:::tip Browser language auto-detection
When a visitor first loads ChurchCRM (login page), the browser's preferred language is detected and the UI is shown in that language if a translation exists. No configuration is required — this is automatic.
:::

---

## Security Settings

| Setting | Description |
|---------|-------------|
| Minimum password length | Default 8 characters |
| Password expiry | Optionally require password changes after N days |
| Two-factor authentication | Enable/require 2FA for all users or specific roles |
| Session timeout | Idle session timeout in minutes |
| HTTPS enforcement | Redirects all HTTP traffic to HTTPS (recommended) |

---

## Map Settings

ChurchCRM uses **Leaflet + Nominatim (OpenStreetMap)** — no API key is required.

| Setting | Description |
|---------|-------------|
| Map default center | Latitude/longitude used when no address is geocoded yet |
| Map default zoom | Starting zoom level on family/group maps |
| Geocoding provider | Nominatim (default, no key required) |

See [Maps & Geocoding](./maps-and-geocoding.md) for full details.

---

## Related Pages

- [Email Setup](./email-setup.md)
- [Maps & Geocoding](./maps-and-geocoding.md)
- [Localization](./localization.md)
- [Security](./security.md)
- [Plugins](./plugins/index.md)
