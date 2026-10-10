---
title: Settings Quick Reference
sidebar_position: 9
---

# Settings Quick Reference — Where to Find Everything

Use this page to find the menu for a setting. System Settings tabs are **Financial Settings**, **Quick Search**, **Confession**, **Scheduled Tasks**, and **Report Settings**. There is no Edit General Settings page, and no Advanced, Finance, Search, Security, or Integration tab.

## 👥 People & Registration

| I want to... | Location | Setting |
|---|---|---|
| Enable visitor self-registration | People → Admin → People Settings → New Members & Greeting | Self-Registration. Review sign-ups on [Self Registrations](/user-guide/self-registrations) |
| Choose who is emailed about new people and families | People → Admin → People Settings → New Members & Greeting | Notification Recipients |
| Add a greeting to the new-member email | People → Admin → People Settings → New Members & Greeting | Greeter Message 1 / 2 |
| Hide deceased people from exports | People → Admin → People Settings → People | Hide Deceased from Directory |
| Change how names display (format) | People → Admin → People Settings → People | Person name display style |
| Change person avatar initials | People → Admin → People Settings → People | Person initials style |
| Set default country, state, city, or ZIP for new records | People → Admin → People Settings → New Members & Greeting → New Record Defaults | Default Country, Default State, Default City, Default Zip. Also under Address Defaults on Admin → Church Information |
| Disable "Friend Date" field | People → Admin → People Settings → People | Hide Friend Date |
| Disable "Wedding Date" field | People → Admin → People Settings → Families | Hide Wedding Date |
| Auto-uppercase ZIP codes | People → Admin → People Settings → Families | Uppercase Zip/Postcodes |
| Hide a person's address when they have no family | People → Admin → People Settings → People | Hide Address Without Family |
| Choose which family roles are head, spouse and child | People → Admin → People Settings → Families | Head of House / Spouse / Child Role |
| Mark a classification as inactive | People → Admin → Person Classifications | Inactive column |
| Choose which classifications start ticked on the Directory report | People → Admin → Person Classifications | In Directory column |

## 🏛️ Church Information

| I want to... | Location | Setting |
|---|---|---|
| Set church name | Admin → Church Information | Church name |
| Add church address | Admin → Church Information | Address, City, State, ZIP |
| Set church phone/email | Admin → Church Information | Phone, Email |
| Add church website | Admin → Church Information | Website |
| Upload church logo for emails | Admin → Church Information | Logo URL |

## 🗺️ Maps & Location

| I want to... | Location | Setting |
|---|---|---|
| Set initial map zoom | People → Admin → People Settings → Map Settings | Default Map View |
| Set the map center | Admin → Church Information | Latitude and longitude |
| Hide lat/lon fields | People → Admin → People Settings → Map Settings | Hide Latitude/Longitude |
| Choose geocoding services (add US Census) | People → Admin → People Settings → Map Settings | Geocoding services |

## 💰 Finance & Donations

| I want to... | Location | Setting |
|---|---|---|
| Enable or disable Finance | Admin → System Settings → Financial Settings | Enable Finance menu |
| Enable or disable Fundraiser | Admin → System Settings → Financial Settings | Enable Fundraiser menu |
| Set the fiscal year start month | Admin → System Settings → Financial Settings | Fiscal year start month |
| Set the currency symbol | Admin → Localization & Formats (also on Financial Settings) | Currency symbol |
| Put the symbol before or after the amount | Admin → Localization & Formats | Currency position |
| Use numbered donation envelopes | Admin → System Settings → Financial Settings | Use donation envelopes |
| Track scanned check images | Admin → System Settings → Financial Settings | Scanned check images |
| Allow non-deductible donations | Admin → System Settings → Financial Settings | Non-deductible payments |

See the [Donation Envelopes guide](/user-guide/donation-envelopes) for activation and assignment.

## 🌍 Language & Localization

| I want to... | Location | Setting |
|---|---|---|
| Change the church language | Admin → Localization & Formats | Language |
| Change your own language | User menu → Change Settings → Localization | Localization |
| Set the church time zone | Admin → Localization & Formats | Time zone |
| Change date display | Admin → Localization & Formats | Date formats |
| Set decimal and thousands separators | Admin → Localization & Formats | Decimal separator, thousands separator |
| Set the phone number format | Admin → Localization & Formats | Phone number format |

## 📧 Email Setup

| I want to... | Location | Setting |
|---|---|---|
| Turn email sending on or off | Communication → Email → Email Settings | Enable Email |
| Set the SMTP server | Communication → Email → Email Settings | SMTP Host (include the port) |
| Set the SMTP username and password | Communication → Email → Email Settings | SMTP Username, SMTP Password |
| Choose TLS or SSL | Communication → Email → Email Settings | Encryption |
| Add the church as a recipient when composing mail | Communication → Email → Email Settings | Copy Church Email |

The From address is the email on **Admin → Church Information**. The From name is the church name.

## 🔐 Passwords, lockout, and 2FA

These are on **Admin → System Users → Settings → Quick Settings**, not a Security menu.

| I want to... | Setting |
|---|---|
| Set the minimum password length | Minimum password length |
| Require a new password to differ from the old one | Minimum password change |
| Block common passwords | Disallowed passwords |
| Lock an account after failed sign-ins | Max failed logins |
| Set how long a session stays open | Session timeout (seconds) |
| Require two-factor authentication | Require 2FA |
| Set how long people have to enroll | 2FA grace period |

Content Security Policy (`bEnforceCSP`) is not on a settings tab. There is no switch for it in the UI.

## 🔔 Notifications

| I want to... | Location | Setting |
|---|---|---|
| Choose who is told when a person is added | People → Admin → People Settings → New Members & Greeting | Notification Recipients |
| Include contact details in that email | People → Admin → People Settings → New Members & Greeting | Include Details in Notifications |
| Send birthday emails | Admin → Feature Toggles | Birthday emails |
| Warn when background jobs have not run | Admin → System Settings → Scheduled Tasks | Background jobs warning |

## 🔍 Search

| I want to... | Location | Setting |
|---|---|---|
| Show or hide people, families, groups, addresses, deposits, payments, or calendar events | Admin → System Settings → Quick Search | The matching Search switch |
| Limit how many results appear | Admin → System Settings → Quick Search | Maximum for that kind of record |

## 🎨 Menus

| I want to... | Location | Setting |
|---|---|---|
| Show Sunday School | Groups → Dashboard → Group Settings | Sunday School Module |
| Show Events | Calendar → Calendar Settings | Enable Events Menu |
| Let other sites read the calendar | Calendar → Calendar Settings | Enable External Calendar API |
| Limit which sites may embed the calendar | Calendar → Calendar Settings | Calendar Embed Origins |
| Hide the family newsletter field | People → Admin → People Settings → Families | Hide Newsletter Subscriptions |

## 📊 Reports

| I want to... | Location | Setting |
|---|---|---|
| Leave deceased people out of the printed directory | People → Admin → People Settings → People | Hide Deceased from Directory |
| Set the letterhead image | Admin → System Settings → Report Settings | Church letterhead (`bDirLetterHead`) |
| Save a PDF or open it in the browser | Admin → System Settings → Report Settings | PDF output type |
| Change report margins | Admin → System Settings → Report Settings | Left margin, line thickness |

## 🛠️ Logs, upgrades, and telemetry

| I want to... | Location | Setting |
|---|---|---|
| Change the log level | Admin → System Logs → Settings | DEBUG, INFO, WARNING, or ERROR |
| Allow a pre-release upgrade | Admin Dashboard → Upgrade, then System Upgrade → Settings | Upgrade Settings |
| Choose what anonymous diagnostics to share | Admin Dashboard prompt | Enable (full), Errors only, or No thanks |

Open the upgrade page from **Admin → Admin Dashboard → Upgrade**.

---

## Settings by location

| Location | Contains |
|----------|----------|
| **Admin → Church Information** | Church name, address, contact email, logo, and Address Defaults |
| **Admin → Localization & Formats** | Language, time zone, dates, currency display, phone formats |
| **Admin → System Users → Settings → Quick Settings** | Password rules, lockout, session timeout, 2FA |
| **Communication → Email → Email Settings** | SMTP and sending |
| **People → Admin → People Settings** | Name and initials style, hidden fields, family roles, self-registration, new-member notifications and greeter messages, new-record defaults, map zoom and geocoding |
| **People → Admin → Person Classifications** | Classification names and order, Inactive and In Directory flags |
| **Admin → System Settings → Financial Settings** | Finance and fundraiser menus, fiscal year, envelopes |
| **Admin → System Settings → Quick Search** | What search includes, and how many results |
| **Admin → System Settings → Report Settings** | Letterhead (`bDirLetterHead`), PDF handling, report wording |
| **Groups → Dashboard → Group Settings** | Sunday School module |
| **Calendar → Calendar Settings** | Events menu, external calendar API, embed origins |
| **Admin → System Logs → Settings** | Log level |
| **System Upgrade → Upgrade Settings** | Pre-release upgrades |

---

## See Also

- **[System Settings & Configuration](./system-settings.md)** — What each setting does
- **[Email Setup](./email-setup.md)** — Sending mail
- **[Localization & Formats](./localization.md)** — Language and formats
- **[Security](./security.md)** — Account security
