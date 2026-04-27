---
title: Features Overview
sidebar_position: 2
---

# Features Overview

## What's new in 7.3

ChurchCRM 7.3 expands the platform with a community plugin ecosystem and improves group check-in, navigation, and timezone precision:

* **Community Plugin System** — browse and install plugins from approved registries directly from **Admin → Plugins**. Community plugins are audited for security and localization compliance. The Holiday Calendar is the first community plugin available.
* **Kiosk expanded to all group types** — the self-service check-in kiosk now supports any group, not just Sunday School. Any event with a linked group can use kiosk check-in.
* **"Wall-clock" timezone precision** — events are saved in the local wall-clock time of the church, eliminating daylight-saving edge cases.
* **Timeline filters** — filter notes and attendance entries on member and family profile pages by type or date range.
* **Breadcrumb navigation** — added throughout the admin UI for easier wayfinding.
* **Events Dashboard improvements** — correctly sorts by date and auto-scrolls to the current month on load.
* **Regional locale grouping** — language chooser now groups locales by world region, with native-language names shown.
* **Event roster enhancements** — member photos now appear on event rosters; attendance badge contrast improved.

---

## What's new in 7.2

* **Event MVC epic** — all event-related pages migrated to the modern Slim 4 MVC architecture, removing 2,000+ lines of legacy code. Events are faster, more consistent, and fully mobile-responsive.
* **Unified event editor** — the pop-up and full-page event editors are now identical, with timezone-aware time saving.
* **Mobile-first UX** — 44 px touch targets, safe-area insets, iOS zoom prevention, and responsive stat cards across all pages.
* **Church Info latitude/longitude** — expose and override your church's map coordinates directly in Church Info settings.
* **Permission consolidation** — essential security features (password change, 2FA) remain accessible even with limited permissions.
* **CSRF hardening** — anti-forgery protection added to all remaining delete pages (GHSA-3xq9-c86x-cwpp).
* **27-locale translation campaign** — Hindi, Arabic, German, Indonesian, Japanese, Korean, Russian, Vietnamese, Spanish, Portuguese, French, Chinese variants, Turkish, and more fully updated.

---

## What's new in 7.1

ChurchCRM 7.1 is the largest UI overhaul in the project's history:

* **Modern UI** — the entire application shell migrated from AdminLTE / Bootstrap 4 to **Tabler / Bootstrap 5**, with a responsive sidebar, mobile-friendly layout, RTL support, and optional dark mode.
* **Maps without an API key** — interactive maps and geocoding use OpenStreetMap + Nominatim. No Google Cloud account or API key required. See [Maps & Geocoding](/administration/maps-and-geocoding).
* **Guided first-run setup** — onboarding wizard walks administrators through password, church info, and setup checklist.
* **Automatic database migrations** — upgrades apply pending migrations automatically on the next page load.
* **Redesigned dashboards** — stats-based dashboards for Events, Groups, People, and Finance.
* **Modern CSV import** — drag-and-drop upload, auto-mapping, and per-row Classification and Family Role columns.
* **User Settings redesign** — single tabbed page for profile, password, 2FA, dark mode & accent color, localization, and API tokens (`/v2/user/{id}`).
* **Export Hub** — new **Admin → Export** page groups all export formats (CSV, ChMeetings, database backup) in one place.
* **Notification system** — dismissible banners with wildcard version matching and per-user dismiss state.
* **46 languages** — including new Filipino (Tagalog) and Malayalam locales.
* **FrankenPHP Docker image** and **DDEV** for local development.

---

## What's new in 7.0

* **Plugin system** — MailChimp, Vonage SMS, OpenLP, Gravatar, Google Analytics, External Backup, and Custom Menu Links moved to optional plugins. Install only what your church needs.
* **Leaflet maps** — replaced Google Maps and Bing Maps. Private by default, no API key required.
* **PHP 8.4 required** — take advantage of the latest performance and type-safety improvements.
* **44 languages** — with browser locale auto-detection on first visit.
* **Church Info Center** — new `admin/system/church-info` admin page for church configuration.
* **Auto-upgrade on boot** — database migrations run automatically; a new smart version check prevents running old code on a newer schema.
* **Self-service 2FA** — users can enroll and manage two-factor authentication from their own settings page.

---

## Core Features

* **Congregation Management**
    * [Families](/user-guide/families) — Household records with shared contact info, pledge history, and unified family/member profiles.
    * [Persons](/user-guide/persons) — Individual member profiles with contact details, roles, church history, notes, and timeline filters.
    * Self Registration — Members can register themselves through an online form.
    * Online Verification — Members can review and confirm their own contact information.
    * [Notes](/user-guide/notes) — Private or shared memos on person and family records, with timeline filtering.
    * [Properties](/user-guide/properties) — Custom labels (e.g. "Homebound", "Choir Member") for people, families, and groups.
* **[Finances](/user-guide/finances)**
    * Donations — Record contributions and link to family pledge accounts.
    * Envelope — Track giving by numbered donation envelopes.
    * Deposits — Batch donations into deposit slips with printable bank forms.
    * Pledges — Track multi-year giving commitments with a dedicated Pledge Dashboard.
* **[Events](/user-guide/events)** — Create one-time or recurring events, track attendance, manage child check-in/out, and use the unified event editor.
* **[Groups](/user-guide/groups)** — Ministry teams, committees, Bible studies, small groups, or any other grouping. Includes kiosk check-in support.
* **Sunday School** — Specialized group dashboard with roster and attendance tracking.
* **[Kiosk Check-in](/user-guide/kiosk-devices)** — Self-service check-in tablets for any event with a linked group. Parent alerts via email or SMS.
* **Calendar** — Shared church calendar with offcanvas event editor and timezone-aware event times.
* **[Fundraiser](/user-guide/fundraiser)** — Manage auctions and fundraising events where members buy and sell items.
* **[Reports & Queries](/user-guide/reports-and-queries)** — Directories, mailing labels, birthday lists, financial statements, and custom queries.
* **[Volunteers](/user-guide/volunteers)** — Track member availability for specific roles and find volunteers for upcoming needs.
* **[Data Import](/user-guide/data-import)** — Import member records from CSV, including Classification and Family Role columns.
* **[Export & Data](/user-guide/export)** — Export Hub with CSV, ChMeetings format, and database backup — all in one place.
* **Backup / Restore** — Full database backups with one-click restore.
* **Localization** — 46 languages, regional grouping, and browser auto-detection.
* **[User Management](/administration/users)** — User accounts, role-based access, granular permissions, and 2FA.
* **[Plugins](/administration/plugins/index)** — Extend ChurchCRM with community and built-in plugins. Install from approved registries.

---

## External Integrations (via Plugins)

| Plugin | Purpose |
|--------|---------|
| **MailChimp** | Sync congregation list for newsletters and mass email |
| **Vonage SMS** | Send SMS parent alerts from kiosk check-out |
| **OpenLP** | Push member names and attendance counts to worship software |
| **Gravatar** | Display member photos from Gravatar-linked email addresses |
| **Google Analytics** | GA4 tracking on authentication pages |
| **External Backup** | Automated offsite database backup |
| **Custom Menu Links** | Add custom navigation links to the admin sidebar |
| **Holiday Calendar** | Optional community plugin adding a holiday event calendar |

All integrations are optional. Enable only the plugins your church needs under **Admin → Plugins**.
