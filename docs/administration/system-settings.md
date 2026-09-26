---
title: System Settings & Configuration
sidebar_position: 8
---

# System Settings & Configuration

ChurchCRM's settings are spread across multiple locations for intuitive access. This page is your comprehensive guide to finding and configuring every system setting.

:::tip Quick Navigation
Use this guide to find where any setting is configured:
- **Church Information** — Admin → Church Info
- **People Settings** — People → Dashboard → People Settings button
- **Map Settings** — People → Map → Map Settings button
- **Localization & Formats** — Admin → Localization & Formats
- **Email Configuration** — Admin → System Settings → Email tab
- **Security** — Admin → Security & Permissions
- **Advanced Settings** — Admin → System Settings
:::

---

## Church Information

**Location:** Admin → Church Info

Configure basic church details that appear throughout ChurchCRM.

| Setting | Description | Required |
|---------|-------------|----------|
| **Church name** | Displayed in headers, emails, PDF reports | ✅ Yes |
| **Address** | Street address for geocoding and mail |  |
| **City, State, ZIP** | Used for church location on maps |  |
| **Country** | Church location country |  |
| **Phone** | Shown on contact pages and auto-emails |  |
| **Email** | Primary contact email |  |
| **Website** | Church website URL |  |
| **Logo URL** | HTTPS URL for logo in emails (3.5:1 aspect ratio recommended) |  |

:::note
Church name is **required** and will be requested on first setup. Many features require this to be configured.
:::

---

## People Settings

**Location:** People → Dashboard → Click **"People Settings"** button (admin-only)

Settings that control how people and family information is displayed and managed.

| Setting | Description | Default |
|---------|-------------|---------|
| **Self-registration** | Allow visitors to self-register as new families. When enabled, a link appears on the login page. | Off |
| **Hide deceased from directory** | Exclude deceased members from printed directories and CSV exports | On |

---

## People & Family Configuration

**Location:** Admin → System Settings → People tab

Detailed settings for people management and directory display.

| Setting | Description | Default |
|---------|-------------|---------|
| **Default country** | Pre-fills country field on new person/family forms |  |
| **Default city** | Pre-fills city field on new forms |  |
| **Default state** | Pre-fills state field on new forms |  |
| **Default ZIP code** | Pre-fills ZIP on new forms |  |
| **Person name format** | How names display (FirstName LastName, LastName FirstName, etc.) | FirstName LastName |
| **Person initials style** | Avatar initials (FirstName + LastName, or FirstName only) | First + Last |
| **Hide person address** | Hide address fields for people not assigned to a family | On |
| **Hide friend date** | Disable the "Friend Date" field in Person Editor | Off |
| **Hide wedding date** | Disable the "Wedding Date" field in Family Editor | Off |
| **Hide latitude/longitude** | Hide manual geocoding fields (background geocoding still runs) | Off |
| **Inactive classifications** | Classifications to mark as inactive (comma-separated IDs) |  |
| **Family roles — Head of House** | Person role type for head of household |  |
| **Family roles — Spouse** | Person role type for spouse |  |
| **Family roles — Child** | Person role type for children |  |
| **Force UPPERCASE ZIP codes** | Auto-uppercase all ZIP/postal codes entered | Off |
| **Hide family newsletter** | Disable newsletter subscription management in Family Editor | Off |

---

## Map Settings

**Location:** People → Map → Click **"Map Settings"** button (admin-only)

ChurchCRM uses **Leaflet + Nominatim (OpenStreetMap)** — no API key required.

| Setting | Description | Default |
|---------|-------------|---------|
| **Map default zoom level** | Starting zoom when opening maps (Continent → Street) | City (10) |

For full mapping configuration, see [Maps & Geocoding](./maps-and-geocoding.md).

---

## Localization & Formats

**Location:** Admin → Localization & Formats

:::info
See the dedicated [Localization & Formats](./localization.md) guide for complete details.
:::

| Setting | Description |
|---------|-------------|
| **Language / I18n** | Application language (English, Spanish, French, German, etc.) |
| **Time zone** | Church time zone for events and scheduling |
| **Date format** | How dates display (MM/DD/YYYY, DD/MM/YYYY, etc.) |
| **Date picker format** | Date format in picker widgets |
| **Currency symbol** | $ € £ etc. |
| **Currency position** | Symbol before or after amount |
| **Thousands separator** | , or . |
| **Decimal separator** | . or , |
| **Phone number format** | (999) 999-9999 or other format |

---

## Email Configuration

**Location:** Admin → System Settings → Email tab

See [Email Setup](./email-setup.md) for detailed configuration instructions.

| Setting | Description |
|---------|-------------|
| **Enable/disable email** | Turn email sending on or off |
| **SMTP host** | Your outbound mail server (mail.example.com:25) |
| **SMTP port** | Default 25, 465 (SSL), or 587 (TLS) |
| **SMTP authentication** | Enable if server requires username/password |
| **SMTP username** | Login for authenticated SMTP |
| **SMTP password** | Password for authenticated SMTP |
| **Sender name** | "From:" display name in outbound emails |
| **Sender address** | "From:" email address |
| **Reply-to address** | Optional separate reply-to address |
| **TLS/SSL encryption** | Connection encryption mode |
| **Church email address** | Auto-added as removable recipient in Email Composer |
| **Email preheader** | Short text shown in email previews (optional) |

---

## Finance & Donations

**Location:** Admin → System Settings → Finance tab

| Setting | Description | Default |
|---------|-------------|---------|
| **Enable Finance module** | Show/hide Finance in sidebar | On |
| **Enable Fundraiser module** | Show/hide Fundraiser in sidebar | On |
| **Fiscal year start month** | Month your financial year begins (Jan-Dec) | January |
| **Currency symbol** | $ € £ CHF etc. | $ |
| **Currency position** | Before or after amount | Before |
| **Use donation envelopes** | Track contributions via numbered envelopes | Off |
| **Checks per deposit slip** | How many check line items per deposit form | 14 |
| **Scanned check images** | Allow attaching scanned check images | Off |
| **Non-deductible donations** | Allow recording non-tax-deductible gifts | Off |

---

## Security Settings

**Location:** Admin → Security & Permissions

For comprehensive security guidance, see [Security](./security.md).

| Setting | Description | Default |
|---------|-------------|---------|
| **Minimum password length** | Characters required in user passwords | 8 |
| **Password change difference** | # of characters that must change | 4 |
| **Disallowed passwords** | Passwords that can never be used | password, god, jesus, church, christian |
| **Max failed logins** | Attempts before account locks | 5 |
| **Session timeout** | Minutes before idle logout | 60 |
| **Require 2FA** | Mandate two-factor authentication | Off |
| **2FA grace period** | Days to enroll before 2FA enforcement | 7 days |
| **2FA app name** | Name shown in authenticator apps | ChurchCRM |
| **Enforce CSP** | Content Security Policy (XSS protection) | Report only |

---

## Search & Discovery

**Location:** Admin → System Settings → Search tab

Control what appears in the global search.

| Setting | Description | Default |
|---------|-------------|---------|
| **Search people** | Include people in search results | On |
| **Search families** | Include families in search | On |
| **Search family head of house names** | Show family HOH names | On |
| **Search groups** | Include groups | On |
| **Search deposits** | Include financial deposits | On |
| **Search payments** | Include donation payments | On |
| **Search addresses** | Include address records | On |
| **Search calendar events** | Include events | On |
| **Max results per category** | Limit search results (15, 5, etc.) | Varies by type |

---

## Notifications & Automation

**Location:** Admin → System Settings

| Setting | Description | Default |
|---------|-------------|---------|
| **New member notification** | Send email when family/person added | Off |
| **Notification recipients** | Person IDs to notify (comma-separated) |  |
| **Include data in notifications** | Add contact details to notification email | Off |
| **Birthday emails** | Auto-send birthday greeting emails | Off |
| **Background jobs warning** | Alert admin if scheduled tasks haven't run (hours) | 26 |
| **Background jobs interval** | Minimum minutes between timer job runs | 15 |

---

## Advanced & Expert Settings

**Location:** Admin → System Settings → Advanced tab

These settings are for advanced users and developers.

| Setting | Description | Default |
|---------|-------------|---------|
| **Log severity level** | App log level (DEBUG, INFO, WARNING, ERROR) | INFO |
| **PDF output type** | Save dialog vs open in browser | Save dialog |
| **Event log queries** | Query IDs requiring finance permissions |  |
| **Telemetry level** | Anonymous diagnostic data sharing | None |
| **Enforce CSP** | Enforce Content Security Policy headers | Report-only |
| **Enable external calendar API** | Allow public calendar embedding | Off |
| **Calendar embed origins** | Origins allowed to embed calendar (CSP) | * (any) |
| **Allow pre-release upgrades** | Update to pre-release versions | Off |
| **Display distance in** | Miles or kilometers | Miles |

---

## Ministry Settings

The Volunteer Management settings live on their own page, **Admin → Ministry Settings**, not under System Settings.

![Admin → Ministry Settings](/img/administration/ministry-settings.png)

| Setting | Description |
|---------|-------------|
| Volunteer experience | **V1 — Volunteer Opportunities (legacy)** (the default, today's feature), **V2 — Ministries** (the new [Volunteer Management (v2)](/user-guide/ministries)), or **Both (transition)** for running the two side by side. System-wide. Switching shows or hides pages and menu entries and never deletes data. |
| Reminder lead time (hours) | How many hours before an occurrence the volunteer reminder email is sent. Default 48; 0 sends no reminders. |

The page also explains the three choices, and its **Notification delivery** card shows the failed and queued volunteer messages, when background jobs last ran, the cron line to install, and a **Run background jobs now** button. See [Volunteer email and reminders](/user-guide/ministries/email-and-reminders).

---

## Related Pages

- [Localization & Formats](./localization.md) — Language, timezone, date/number formats
- [Email Setup](./email-setup.md) — Complete email configuration guide
- [Maps & Geocoding](./maps-and-geocoding.md) — Church location and mapping
- [Security](./security.md) — Security policies and user permissions
- [Users](./users.md) — User account management
- [Plugins](./plugins/index.md) — Community plugins and integrations
