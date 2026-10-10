---
title: Export & Data
sidebar_position: 22
---

# Export & Data

**Admin → Export** is where membership CSV, a ChMeetings file, and a database backup start. There is no separate **Admin → Backup** menu.

---

## The Export Hub

| Card | Button |
|------|--------|
| **CSV Export** | **Open CSV Export** — choose fields, then **Create File** |
| **ChMeetings Export** | **Export to ChMeetings CSV** |
| **Database Backup** | **Go to Database Backup** |

---

## CSV Export

1. Go to **Admin → Export**.
2. Click **Open CSV Export**.
3. Tick the fields you want under **Field Selection**. **Last Name** is always included. There is no marital-status field and no last-login field. **Second Address** is off by default; see [Second address columns](#second-address-columns).
4. Under **Output Method**, pick a **Format**: **CSV Individual Records**, **CSV Combine Families**, or **Add Individuals to Cart**.
5. Click **Create File**.

**Add Individuals to Cart** does not download a file. It puts the matching people in the [cart](./cart.md).

### Second address columns

A family can record an optional second address with a **This is the mailing address** checkbox (see [Families](./families.md#second-address-and-mailing-address)). These columns are left out unless you tick **Second Address** under **Field Selection**. When it is ticked, each row gains seven columns taken from the family record:

| Column | Content |
|--------|---------|
| `Second Address 1`, `Second Address 2`, `Second City`, `Second State`, `Second Zip`, `Second Country` | The family's second address; blank when the family has none |
| `Mailing Address` | `Yes` when the second address is the family's mailing address, otherwise `No` |

Every member of a family gets the same values, since the second address belongs to the family. The [CSV import](./data-import.md#second-address-columns) recognises the same column headers.

---

## ChMeetings Export

If you are migrating to or integrating with [ChMeetings](https://www.chmeetings.com/), ChurchCRM can export your data in the format ChMeetings expects.

1. Go to **Admin → Export**.
2. Click **Export to ChMeetings CSV**.
3. Use the downloaded file in the ChMeetings import wizard.

---

## Database Backup

A database backup is a complete SQL dump of all ChurchCRM data — the safest way to make a full copy before upgrades or migrations.

:::warning Keep backups offsite
Store backup files outside your web server (e.g., a local drive, cloud storage). A backup on the same server as ChurchCRM is not protected if the server is lost or compromised.
:::

### Steps

1. Go to **Admin → Export** and click **Go to Database Backup**.
2. Choose **Database Only** (`.sql`) or **Full Backup** (`.tar.gz`, database plus photos).
3. Click **Generate & Download Backup**.

The full backup is a `.tar.gz` file, not a `.sql.gz` file.

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
