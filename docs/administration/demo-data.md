---
title: Importing Demo Data
sidebar_position: 9
---

# Importing Demo Data

Demo data is a set of fictional families, people, groups, and notes you can load so you can click through ChurchCRM before you enter your congregation. Use it on a new installation, or on a copy you are willing to throw away. Do not load it on the database that already holds your real membership.

The names, addresses, phone numbers, and emails in the sample are made up. The import also writes sample church settings, including the church name **Main St. Cathedral** (Kansas City, MO), the church address, phone, and email, the default city and state, and the names used as signers on statements. If you already saved your own church information, open **Admin → Church Information** afterward and put your details back, or [start fresh](#start-fresh).

## When the import is safe

ChurchCRM treats an installation as fresh when there is exactly one person (the admin created at setup) and no families.

- On a fresh installation, **Import Demo Data** adds the sample and does not ask you to override anything.
- If there is already more than one person, or any family, the dialog warns **Your database already contains data**. The confirm button changes to **Import demo data anyway**. That adds the sample next to what you already have and can create duplicates. Do not use it on a live church database.

## Load the sample

1. Sign in as an administrator. On a new installation you land on the **Setup Dashboard**. Otherwise open **Admin → Get Started**.
2. On **Explore with Demo Data**, click **Load demo data**.
3. The **Import Demo Data** dialog lists what the sample includes: families, people and groups; events and calendars; Sunday School classes; volunteer ministries; and donation funds, pledges and giving records. Click **Import Demo Data**, or **Cancel** to change nothing.
4. Wait on the screen that says **Importing demo data...** and **Please do not refresh or navigate away**.
5. From the Setup Dashboard, ChurchCRM then opens the People dashboard with the sample in place. From **Get Started**, a notice says **Demo data imported successfully**.

The import turns on every module the sample uses: Finance, Fundraiser, Events, Sunday School, and the Member Portal's calendar, volunteering pages and member directory. It turns on member sign-in and **Login as Person**, so you can open any sample member's portal from the person's **Actions** menu without email. It turns off sending email, because a new installation has no mail server yet.

Demo mode also turns on anonymous usage statistics (PostHog) and Google Analytics, so the ChurchCRM team can see how people explore the product. The import dialog says so. Start Fresh turns both off with every other setting.

## Demo mode

While the sample is loaded, the notification center in the top bar shows a notice: **You're exploring ChurchCRM with demo data.** It stays until you start fresh, so nobody mistakes the sample for your church. The Setup Dashboard shows **You're exploring demo data** with **Keep exploring** and **Start Fresh**.

## If the import fails

The dialog shows **Import failed** and the confirm button becomes **Force Import**. The note under that button says a force import may create duplicate data. Do not use **Force Import** on a database you need to keep. Take a backup, then either try again on a fresh installation or reset the database first.

Details are written to the application log. On the Admin Dashboard, under **Advanced Operations**, open **System Logs** and click **View Logs**. See [Logging and Diagnostics](/administration/logging-and-diagnostics).

## Start fresh

When you have seen enough, click **Start Fresh** in the notification center or on the Setup Dashboard. Administrators see the button during the [setup period](/getting-started/first-run#the-setup-dashboard).

Start fresh is a full [database reset](#reset-the-database): it erases the sample **and every setting**, and returns ChurchCRM to a new installation. Do not use it once you have entered real data.

1. Click **Start Fresh** and confirm.
2. ChurchCRM shows the default administrator account (`admin` / `changeme`). Click **OK** to go to the sign-in page.
3. Sign in, choose a new password, and enter your church information, the same as the [first run](/getting-started/first-run).
4. You land on the Setup Dashboard again, ready to set up your church.

## Reset the database

After the setup period, remove the sample with **Reset Database**. It erases the sample and everything else in the database, including system settings and custom fields. It is not a way to delete only the fictional records.

1. Take a backup if anything in the database must be kept. See [Backup & Restore](/administration/backup-restore).
2. Open **Admin → Admin Dashboard**.
3. Under **Advanced Operations**, find **Reset Database** and click **Reset**.
4. On the reset page, read the **Destructive Operation** warning. Step 1 can download a backup (**Generate & Download Backup**). Step 2 lists what will be deleted: people and families, groups, financial data, events and attendance, uploaded photos and documents, and system settings and custom fields.
5. Type `RESET` and click **Reset Database**.

To return to a copy from before the import, restore that backup instead of resetting. See [Backup & Restore](/administration/backup-restore).
