---
title: One-Click Install (Softaculous)
sidebar_position: 3
---

# One-Click Install via Softaculous

Softaculous is a one-click installer built into most shared hosting control panels (cPanel, Plesk, DirectAdmin, etc.). It installs ChurchCRM in about 90 seconds with no manual file uploads, database creation, or configuration required.

:::tip Easiest option for most churches
If your hosting provider offers cPanel or Plesk, check for Softaculous first — it's the fastest path from "nothing" to a working ChurchCRM.
:::

---

## Does my host support Softaculous?

Log in to your hosting control panel and look for:

- A **Softaculous Apps Installer** icon (usually in the "Software" section)
- An **Auto Installers** section listing WordPress, Joomla, and other apps

If you see ChurchCRM listed, you're set. If Softaculous is present but ChurchCRM isn't listed, contact your host — they may need to enable it.

---

## Step-by-step: Installing via Softaculous

1. **Open Softaculous** from your hosting control panel.
2. Search for **ChurchCRM** and click it.
3. Click **Install Now**.
4. Fill in the installation form:

   | Field | What to enter |
   |-------|--------------|
   | **Protocol** | `https://` (if SSL is set up) or `http://` |
   | **Domain** | Your domain or subdomain |
   | **In Directory** | Leave blank to install at the root, or enter `churchcrm` to install at `yourdomain.com/churchcrm` |
   | **Database Name** | Softaculous fills this in — leave as-is unless you have a preference |
   | **Admin Username** | Choose a username for the admin account |
   | **Admin Password** | Choose a strong password |
   | **Admin Email** | Your email address |
   | **Church Name** | Your church's name (can be changed later) |

5. Click **Install**. Softaculous creates the database, uploads the files, and configures the application.
6. When complete, Softaculous shows you two links:
   - **Site URL** — your ChurchCRM login page
   - **Admin URL** — same as site URL for ChurchCRM

---

## First login

Navigate to your ChurchCRM URL. You'll be prompted to:

1. Change the admin password (required on first login)
2. Complete the **Church Information** setup (name, address, timezone)

See [First Run Configuration](/getting-started/first-run) for a walkthrough of what comes next.

---

## Upgrading a Softaculous install

Softaculous can also handle upgrades:

1. Open Softaculous in your control panel
2. Go to **Installations** → find ChurchCRM
3. Click the **upgrade icon** (arrow) if a new version is shown
4. Softaculous backs up your files and database, then applies the new version

Alternatively, use ChurchCRM's built-in upgrade wizard (**Admin → System → Upgrade**) — it works the same way regardless of how ChurchCRM was originally installed. See [Upgrade Guide](/administration/upgrade).

---

## Softaculous not available?

| Your situation | Recommended path |
|---------------|-----------------|
| cPanel but no Softaculous | [cPanel Shared Hosting](/installation/cpanel-shared-hosting) — manual upload method |
| VPS or dedicated server (Ubuntu) | [Self-Hosted on Ubuntu](/installation/ubuntu) |
| VPS or dedicated server (Rocky Linux / RHEL) | [Self-Hosted on Rocky Linux](/installation/rocky-linux) |
| Microsoft Azure | [Azure](/installation/azure) |
| Docker | [Installation Overview](/installation) — FrankenPHP image |

---

## See Also

- [First Run Configuration](/getting-started/first-run)
- [Upgrade Guide](/administration/upgrade)
- [System Requirements](/installation/system-requirements)
