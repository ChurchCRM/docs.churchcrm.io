---
title: Importing Demo Data
sidebar_position: 9
---

# Importing Demo Data

Demo data is a set of fictional families, people, groups, and notes you can load so you can click through ChurchCRM before you enter your congregation. Use it on a new installation, or on a copy you are willing to throw away. Do not load it on the database that already holds your real membership.

The names, addresses, phone numbers, and emails in the sample are made up. The import also writes sample church settings, including the church name **Main St. Cathedral** (Kansas City, MO), the church address, phone, and email, the default city and state, and the names used as signers on statements. If you already saved your own church information, open **Admin → Church Information** afterward and put your details back, or [reset the database](#removing-demo-data) and start over.

## When the import is safe

ChurchCRM treats an installation as fresh when there is exactly one person (the admin created at setup) and no families.

- On a fresh installation, **Import Demo Data** adds the sample and does not ask you to override anything.
- If there is already more than one person, or any family, the dialog warns **Your database already contains data**. The confirm button changes to **Import demo data anyway**. That adds the sample next to what you already have and can create duplicates. Do not use it on a live church database.

## Load the sample

1. Log in as an administrator.
2. Open **Admin → Get Started**. The page title is **Get Your Data Into ChurchCRM**. You can also open **Admin → Admin Dashboard** and, under the quick-start cards, choose **Add Your Data**.
3. On **Explore with Demo Data**, click **Load demo data**.
4. In the **Import Demo Data** dialog, choose what else to include. All three boxes start checked. Clear any you do not want:
   - **Include financial data (donation funds, pledges)** — funds, pledges, payments, and deposits, and turns the Finance feature on. Leave this off unless you are practicing finance.
   - **Include events and calendars** — sample events and attendance.
   - **Include Sunday School classes and enrollments** — Sunday School groups and enrollments, and turns Sunday School on. If you clear it, those classes are skipped. Other groups are still imported.
5. Click **Import Demo Data**. Click **Cancel** to close the dialog without changing the database.
6. Wait on the screen that says **Importing demo data...** and **Please do not refresh or navigate away**.
7. When it finishes, a notice says **Demo data imported successfully**.

Families, people, groups, and notes are always included. Financial records, events, and Sunday School classes are included only when those boxes stay checked.

## If the import fails

The dialog shows **Import failed** and the confirm button becomes **Force Import**. The note under that button says a force import may create duplicate data. Do not use **Force Import** on a database you need to keep. Take a backup, then either try again on a fresh installation or reset the database first.

Details are written to the application log. On the Admin Dashboard, under **Advanced Operations**, open **System Logs** and click **View Logs**. See [Logging and Diagnostics](/administration/logging-and-diagnostics).

## Removing demo data

The import dialog points you at **Reset Database**. That reset erases the sample and everything else in the database, including system settings and custom fields. It is not a way to delete only the fictional records.

1. Take a backup if anything in the database must be kept. See [Backup & Restore](/administration/backup-restore).
2. Open **Admin → Admin Dashboard**.
3. Under **Advanced Operations**, find **Reset Database** and click **Reset**.
4. On the reset page, read the **Destructive Operation** warning. Step 1 can download a backup (**Generate & Download Backup**). Step 2 lists what will be deleted: people and families, groups, financial data, events and attendance, uploaded photos and documents, and system settings and custom fields.
5. Type `RESET` and click **Reset Database**.

After a reset, sign in again, set the church information, and only then load demo data if you still want the sample.

To return to a copy from before the import, restore that backup instead of resetting. See [Backup & Restore](/administration/backup-restore).
