---
title: Export & Data
sidebar_position: 22
---

# Export & Data

ChurchCRM 7.1 introduced a dedicated **Export Hub** at **Admin → Export** that consolidates all data export formats into one place. Whether you need a CSV of your membership, a ChMeetings migration file, or a full database backup, start here.

---

## The Export Hub

Navigate to **Admin → Export** to see all available export options grouped by type:

| Export type | Description |
|-------------|-------------|
| **Member CSV** | Exports all people and family data as a downloadable CSV file |
| **ChMeetings** | Exports data in ChMeetings-compatible format for migration |
| **Database Backup** | Creates a full SQL dump of your ChurchCRM database |

---

## Member CSV Export

The CSV export produces a flat file with one row per person, suitable for spreadsheet analysis, mail merges, or importing into another system.

### Steps

1. Go to **Admin → Export**
2. Click **Export Members (CSV)**
3. The file downloads immediately — no configuration required

### What's included

The exported CSV includes the following fields:

- First name, last name, middle name
- Family name and family ID
- Email addresses (primary, home, work)
- Phone numbers (mobile, home, work)
- Address (street, city, state, zip, country)
- Date of birth, gender, marital status
- Classification, family role
- Custom fields (if configured)
- Membership date, last login date

:::tip Controlling what's exported
Use **Reports → Custom Queries** to export a filtered subset of members (e.g., only a specific classification or group).
:::

---

## ChMeetings Export

If you are migrating to or integrating with [ChMeetings](https://www.chmeetings.com/), ChurchCRM can export your data in the format ChMeetings expects.

1. Go to **Admin → Export**
2. Click **Export for ChMeetings**
3. Download the generated file and use it in the ChMeetings import wizard

---

## Database Backup

A database backup is a complete SQL dump of all ChurchCRM data — the safest way to make a full copy before upgrades or migrations.

:::warning Keep backups offsite
Store backup files outside your web server (e.g., a local drive, cloud storage). A backup on the same server as ChurchCRM is not protected if the server is lost or compromised.
:::

### Steps

1. Go to **Admin → Export** (or **Admin → Backup**)
2. Click **Download Database Backup**
3. A `.sql` or `.sql.gz` file downloads to your browser

### Restoring from backup

To restore a database backup, see [Backup & Restore](../administration/backup-restore.md).

---

## Scheduling Regular Exports

ChurchCRM does not have a built-in scheduler for automatic exports. For automated backups, use one of these approaches:

- **Server cron job** — Run `mysqldump` on a schedule and store the output offsite (recommended for self-hosted installs)
- **Hosting panel** — Many cPanel or Plesk hosting plans include scheduled database backup options
- **Plugins** — The External Backup plugin (bundled with ChurchCRM) can connect to a remote storage provider

---

## Related Pages

- [Data Import](./data-import.md) — Import members from a CSV file
- [Backup & Restore](../administration/backup-restore.md) — Restore from a database backup
- [Plugins](../administration/plugins/index.md) — External Backup plugin for automated offsite backups
