---
title: System Settings & Configuration
sidebar_position: 8
---

# System Settings & Configuration

ChurchCRM's settings are spread across several pages. This page is where to look for each one.

:::tip Quick Navigation
- **Church Information** — Admin → Church Information
- **People Settings** — People → Dashboard → People Settings
- **Map Settings** — People → Family Map → Map Settings
- **Localization & Formats** — Admin → Localization & Formats (time zone is here)
- **Email** — Communication → Email → Email Settings
- **Passwords, lockout, session, and 2FA** — Admin → System Users → Settings → Quick Settings
- **System Settings tabs** — New Members & Greeting, People, Families, Financial Settings, Quick Search, Confession, Scheduled Tasks, Report Settings
:::

There is no **Edit General Settings** page, and System Settings has no Advanced, Finance, Search, Security, or Integration tab.

---

## Church Information

**Location:** Admin → Church Information

| Setting | Description | Required |
|---------|-------------|----------|
| **Church name** | Shown in headers, emails, and PDF reports | Yes |
| **Address** | Street address for mail and the map |  |
| **City, State, ZIP** | Church location |  |
| **Country** | Church country |  |
| **Phone** | Shown on contact pages |  |
| **Email** | Church contact email. Outbound mail uses this address as the From address, with the church name |  |
| **Website** | Church website |  |
| **Logo URL** | HTTPS address of the logo used in emails |  |
| **Social media links** | Optional https:// links to the church's X, YouTube, Facebook, and Instagram accounts, shown in the Member Portal footer. See [Social Media](../getting-started/first-run.md#social-media) |  |

**Address Defaults** on the same page sets the city, state, ZIP, and country filled in for a new family. The same four defaults are also on **Admin → System Settings → Families**.

Church name is required. First-time setup sends you here to fill it in.

---

## People Settings

**Location:** People → Dashboard → **People Settings** (administrators only)

| Setting | Description | Default |
|---------|-------------|---------|
| **Self-registration** | Let a visitor create a family from the login page. Staff review sign-ups on [Self Registrations](/user-guide/self-registrations). | Off |
| **Hide deceased from directory** | Leave deceased people out of the printed directory and CSV exports | On |

---

## System Settings → People

**Location:** Admin → System Settings → **People**

| Setting | Description | Default |
|---------|-------------|---------|
| **Person name format** | How names are shown |  |
| **Person initials style** | Letters used for the avatar |  |
| **Hide person address** | Hide the address for a person who is not in a family | On |
| **Hide friend date** | Remove Friend Date from the Person Editor | Off |
| **Hide wedding date** | Remove Wedding Date from the Family Editor | Off |
| **Force UPPERCASE ZIP codes** | Save postal codes in uppercase | Off |
| **Inactive classifications** | Comma-separated classification IDs treated as inactive |  |
| **Directory classifications** | Classifications included in the directory |  |

---

## System Settings → Families

**Location:** Admin → System Settings → **Families**

| Setting | Description | Default |
|---------|-------------|---------|
| **Default city** | Pre-filled on a new family. Also under Address Defaults on Church Information |  |
| **Default state** | Two-letter state abbreviation. Also under Address Defaults |  |
| **Default ZIP** | Pre-filled postal code. Also under Address Defaults |  |
| **Default country** | Pre-filled country. Also under Address Defaults |  |
| **Head of house / spouse / child roles** | Family role numbers used for those relationships |  |
| **Hide family newsletter** | Remove newsletter subscription from the Family Editor | Off |

---

## Map Settings

**Location:** People → Family Map → **Map Settings** (administrators only)

ChurchCRM uses Leaflet and OpenStreetMap. No map API key is required.

| Setting | Description | Default |
|---------|-------------|---------|
| **Default map view** | Starting zoom, from continent down to street | City |
| **Hide latitude/longitude** | Hide the latitude and longitude fields in the Family Editor. Geocoding still runs | Off |
| **Hide person address** | Same switch as on System Settings → People | On |

The map is centered on the latitude and longitude saved with **Church Information**.

For the rest of the map, see [Maps & Geocoding](./maps-and-geocoding.md).

---

## Ministry Settings

The Volunteer Management settings live on their own page, **Admin → Ministry Settings**, not under System Settings.

![Admin → Ministry Settings](/img/administration/ministry-settings.png)

| Setting | Description |
|---------|-------------|
| Volunteer experience | **V1 — Volunteer Opportunities (legacy)** (the default, today's feature), **V2 — Ministries** (the new [Volunteer Management (v2)](/user-guide/ministries)), or **Both (transition)** for running the two side by side. System-wide. Switching shows or hides pages and menu entries and never deletes data. |
| Reminder lead time (hours) | How many hours before an occurrence the volunteer reminder email is sent. Default 48, from 0 to 720; 0 sends no reminders. |
| Scheduling horizon (weeks) | How far ahead schedules make occurrences for the events they follow, for every schedule in the church. Default 8, from 1 to 52. A daily background job keeps every active schedule filled up to this point. See [Schedules and occurrences](/user-guide/ministries/schedules-and-occurrences#the-scheduling-horizon-and-the-daily-top-up). |
| Default event type for ministry events | The event type a new event on a ministry's Calendar tab starts with; it can still be changed for each event. **Not set** uses the type named "Other", which ChurchCRM 7.8.0 adds when it does not exist. If there is no active type named "Other", the empty choice reads **None** and the type is chosen for each event. |

The page also explains the three choices. Its **Background jobs and delivery** card shows the failed and queued volunteer messages, when background jobs last ran, when schedules were last topped up and what that made, the cron line to install, and a **Run background jobs now** button that also tops up the schedules. See [Volunteer email and reminders](/user-guide/ministries/email-and-reminders).

---

## Localization & Formats

**Location:** Admin → Localization & Formats

See [Localization & Formats](./localization.md).

| Setting | Description |
|---------|-------------|
| **Language** | Church-wide language. A person can override it under **Change Settings → Localization** |
| **Time zone** | Church time zone for events and scheduling |
| **Date formats** | Long date, short date, date and time, file names, and the date picker |
| **Currency symbol and position** | Also listed on System Settings → Financial Settings |
| **Thousands and decimal separators** | Also listed on Financial Settings |
| **Phone number format** | Home, cell, and extension masks |
| **Distance** | Miles or kilometers |

---

## Email

**Location:** Communication → Email → **Email Settings**

Email is not a System Settings tab. See [Email Setup](./email-setup.md).

| Setting | Description |
|---------|-------------|
| **Enable Email** | Turn sending on or off |
| **SMTP Host** | Mail server, including the port, such as `mail.example.com:587` |
| **SMTP Timeout** | Seconds to wait for the server |
| **Encryption** | None, TLS, or SSL |
| **Auto TLS** | Use encryption when the server offers it |
| **SMTP Authentication** | On when the server requires a username and password |
| **SMTP Username / Password** | Login for that server |
| **Copy Church Email** | Address added as a removable recipient when someone composes mail |
| **Do Not Email Property** | Person property that keeps someone off email lists |
| **Default Inbox Preview Text** | Fallback preview line beside the subject |

The From name is the church name, and the From address is the email on Church Information.

---

## System Settings → Financial Settings

**Location:** Admin → System Settings → **Financial Settings**

| Setting | Description | Default |
|---------|-------------|---------|
| **Enable Finance menu** | Show or hide Finance | On |
| **Enable Fundraiser menu** | Show or hide Fundraiser | On |
| **Fiscal year start month** | Month the financial year begins | January |
| **Use donation envelopes** | Track gifts with numbered envelopes | Off |
| **Checks per deposit slip** | Check lines on one deposit form | 14 |
| **Scanned check images** | Attach a scan to a deposit | Off |
| **Non-deductible payments** | Record gifts that are not tax-deductible | Off |
| **Currency symbol, position, separators** | Same values as Localization & Formats | $ before the amount |

See the [Donation Envelopes guide](/user-guide/donation-envelopes) for activation and assignment.

---

## System Settings → Quick Search

**Location:** Admin → System Settings → **Quick Search**

Turn each kind of record on or off, and set how many results of that kind to show.

| Setting | Default on | Default maximum |
|---------|------------|-----------------|
| People | Yes | 15 |
| Addresses | Yes | 15 |
| Families | Yes | 15 |
| Family head-of-house names | Yes | 15 |
| Groups | Yes | 15 |
| Deposits | Yes | 5 |
| Payments | Yes | 5 |
| Calendar events | Yes | 15 |
| Family custom properties | No |  |

---

## Passwords, lockout, session, and 2FA

**Location:** Admin → System Users → **Settings** → **Quick Settings**

This is not a Security menu.

| Setting | Description | Default |
|---------|-------------|---------|
| **Minimum password length** | Shortest password a person may choose | 8 |
| **Minimum password change** | How many characters must differ from the old password. 0 turns this off | 4 |
| **Disallowed passwords** | Comma-separated list that cannot be used | password, god, jesus, church, christian |
| **Max failed logins** | Failures before the account locks. An administrator unlocks it. 0 turns this off | 5 |
| **Session timeout** | Idle time in seconds. 0 turns the timeout off | 3600 |
| **Lost password link** | Show or hide the link on the sign-in page | On |
| **Require 2FA** | Require every user to enroll | Off |
| **2FA grace period** | Days to enroll after 2FA is required. 0 enforces it immediately | 7 |
| **2FA application name** | Name shown in the authenticator app | ChurchCRM |
| **Email when a user is deleted** | Tell the person their account was removed | Off |

Content Security Policy (`bEnforceCSP`) is not on a settings tab. Do not look for a switch for it in the menus.

---

## System Settings → New Members & Greeting

**Location:** Admin → System Settings → **New Members & Greeting**

| Setting | Description | Default |
|---------|-------------|---------|
| **New member notification recipients** | People notified when a person is added |  |
| **Include data in notifications** | Put contact details in that email | Off |
| **Greeter messages** | Two custom lines for greeter email |  |
| **Birthday emails** | Send a greeting on a person's birthday | Off |

---

## System Settings → Scheduled Tasks

**Location:** Admin → System Settings → **Scheduled Tasks**

| Setting | Description | Default |
|---------|-------------|---------|
| **Background jobs warning** | Hours without a timer-job run before the Admin Dashboard warns you. 0 hides the warning | 26 |
| **Minimum interval** | Minutes between timer jobs started by a page view. 0 runs them on every page view. The command-line runner ignores this | 15 |

---

## System Settings → Confession

**Location:** Admin → System Settings → **Confession**

Choose the person custom field that stores the father of confession, and the date field that stores the last confession.

---

## System Settings → Report Settings

**Location:** Admin → System Settings → **Report Settings**

| Setting | Description | Default |
|---------|-------------|---------|
| **Letterhead** | Path to the letterhead image. The setting name is `bDirLetterHead` | `../Images/church_letterhead.jpg` |
| **PDF output type** | 1 opens a save dialog. 2 opens the PDF in the browser | 1 |
| **Left margin and line thickness** | Report layout, in hundredths of an inch | 20 and 4 |
| **Tax, pledge, confirmation, and directory text** | Sentences printed on those reports, plus the signer lines |  |

---

## Other pages

| What you want | Where |
|---------------|--------|
| Sunday School in the menu | Groups → Dashboard → **Group Settings** → **Sunday School Module** |
| Events menu, external calendar API, and embed origins | Calendar → **Calendar Settings** |
| Log level (DEBUG, INFO, WARNING, or ERROR only) | Admin → System Logs → **Settings** |
| Pre-release upgrades | Admin Dashboard → **Upgrade**, then System Upgrade → **Settings** (**Upgrade Settings**) |
| Telemetry | The prompt on the Admin Dashboard: **Enable (full)**, **Errors only**, or **No thanks** |

---

## Related Pages

- [Localization & Formats](./localization.md) — Language, time zone, and date and number formats
- [Email Setup](./email-setup.md) — Sending mail
- [Maps & Geocoding](./maps-and-geocoding.md) — Church location and the map
- [Security](./security.md) — Account security
- [Users](./users.md) — User accounts
- [Plugins](./plugins/index.md) — Plugins
