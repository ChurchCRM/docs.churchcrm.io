---
title: Features Overview
sidebar_position: 2
---

## What's new in 7.1

ChurchCRM 7.1 is a major UI and UX refresh. Highlights:

* **Modern UI** — the entire application shell has been migrated from AdminLTE / Bootstrap 4 to **Tabler / Bootstrap 5**, with a responsive sidebar, mobile-friendly floating menu, and optional dark mode.
* **Maps without an API key** — interactive maps and address geocoding now use OpenStreetMap + Nominatim out of the box. No Google Cloud account or API key required. See [Maps & Geocoding](/administration/maps-and-geocoding).
* **Guided first-run setup** — a new onboarding wizard walks administrators through setting a strong password, entering church information, and completing a setup checklist.
* **Automatic database migrations** — upgrades run pending migrations automatically on the next page load. The legacy "database needs upgrade" page only appears on a genuine code-older-than-schema situation.
* **Redesigned dashboards** — new stats-based dashboards for Events, Groups, People, and Finance.
* **Modern CSV import** — drag-and-drop upload, auto-mapping of CSV columns to ChurchCRM fields, and per-row Classification and Family Role columns.
* **Consolidated user settings** — a single tabbed **User Settings** page now holds profile, password, 2FA, theme, localization, and API tokens.
* **Calendar offcanvas editor**, **native browser printing**, **unified communication system**, and many smaller admin UX cleanups.
* **FrankenPHP Docker image** and **DDEV** for local development.

---

## Core Features

* Congregation Management
    * [Families](/user-guide/families) - Store and manage household records, including shared contact information and pledge history.
    * [Persons](/user-guide/persons) - Maintain individual member profiles with contact details, roles, and church history.
    * Self Registration - Allow members to register themselves through an online form, reducing data entry for staff.
    * Online Verification - Let members review and confirm their own contact information to keep records accurate.
    * [Notes](/user-guide/notes) - Attach private or shared memos to person and family records for pastoral care and follow-up.
    * [Properties](/user-guide/properties) - Assign custom labels (such as "Homebound" or "Choir Member") to people, families, and groups.
* [Finances](/user-guide/finances)
    * Donations - Record cash, check, and electronic contributions and link them to family pledge accounts.
    * Envelope - Track giving by numbered donation envelopes for families who prefer that method.
    * Deposits - Batch incoming donations into deposit slips and generate printable bank deposit forms.
* [Events](/user-guide/events) - Create one-time or recurring church events, track attendance, and manage child check-in and check-out.
* [Groups](/user-guide/groups) - Organize members into ministry teams, committees, Bible studies, or any other grouping your church uses.
* Sunday School - Manage Sunday School classes as specialized groups with a dedicated class dashboard, roster, and attendance tracking.
* Calendar - View all scheduled events on a shared church calendar, with an offcanvas event editor for quick scheduling.
* [Fundraiser](/user-guide/fundraiser) - Manage auctions, bake sales, and other fundraising events where members buy and sell items.
* [Reports & Queries](/user-guide/reports-and-queries) - Generate printable directories, mailing labels, birthday lists, financial statements, and custom database queries.
* [Volunteers](/user-guide/volunteers) - Track which members are willing to serve in specific roles and find volunteers when needs arise.
* [Data Import](/user-guide/data-import) - Import member records from CSV files to migrate from another system or bulk-load a new membership list.
* Backup / Restore - Create and restore database backups to protect your church data.
* Localization - Display ChurchCRM in the language of your congregation, with support for multiple languages.
* [User Management](/administration/users) - Create user accounts, assign roles, and control which staff members can access each part of the system.

# External Integration

* [Email](/user-guide/email)
  * [Mailchimp](http://mailchimp.com) - Sync your congregation list with Mailchimp to send newsletters and mass emails.
* [Gravatar](http://gravatar.com) - Display member profile photos automatically using their Gravatar-linked email address.
