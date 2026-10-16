---
title: cPanel Shared Hosting
sidebar_position: 5
---

# Installing ChurchCRM on cPanel / Shared Hosting

Use this when your host has cPanel and does not list ChurchCRM in Softaculous. If Softaculous is there, [the one-click install](/installation/softaculous) is shorter.

ChurchCRM needs **PHP 8.4 or newer**. In cPanel open **MultiPHP Manager** (some hosts call it **Select PHP Version**) and set the domain to PHP 8.4 or 8.5 before you upload files. If 8.4 is not in the list, ask the host to enable it. Older PHP will stop setup.

## 1. Pick the web address

Log in to cPanel, then pick one:

- **Its own name**, such as `https://churchcrm.mywebsite.org`. In cPanel open **Domains** (older panels say **Subdomains**) and create `churchcrm`.
- **A folder on your current site**, such as `https://mywebsite.org/churchcrm`. In **File Manager**, inside `public_html`, create a folder named `churchcrm`.
- **The whole domain**, such as `https://myChurchCRM.org`. You will put the files directly in `public_html`. Leave the other files in that folder alone if the domain already has a website.

## 2. Create the database

1. Open **MySQL Databases**.
2. Create a database. The panel will prefix it, so a name you type as `churchcrm` becomes something like `myusername_churchcrm`.
3. Create a MySQL user and a password. The panel prefixes the user the same way, so a name you type as `crm` is shown as something like `myusername_crm`. Save the full name from **Current Users**, the password, and the full database name.
4. **Add User To Database** and grant **All Privileges**.

## 3. Upload the current release

Download the zip from [GitHub Releases](https://github.com/ChurchCRM/CRM/releases/latest). Inside the zip is one folder, `churchcrm`. Upload the **files inside that folder**, not the folder itself, so `index.php` sits in the directory you picked in step 1.

**File Manager:** upload the zip, click **Extract**, then move everything that was inside `churchcrm` into the target directory.

**FTP (FileZilla or similar):** extract the zip on your computer, then upload the contents of `churchcrm`.

Files should be mode `644` and folders mode `755`. Many hosts set that when you extract. If setup says a folder is not writable, follow [File System Permissions](/administration/file-system-permissions).

## 4. Finish in the browser

Open the address you chose, for example `https://mywebsite.org/churchcrm`. The setup wizard asks for the full database name, the full database user, and the password from step 2. Use the names cPanel shows, including the prefix.

When setup finishes, sign in as **admin** with password **changeme**. ChurchCRM asks you to change that password. Keep at least one person with administrator access.

If setup stops, use [Logging & Diagnostics](/administration/logging-and-diagnostics) and [Troubleshooting](/administration/troubleshooting). Questions can go to [Discord](https://discord.gg/tuWyFzj3Nj).

## Try it before you enter real people

On a new install, load the sample congregation from **Admin → Get Started → Explore with Demo Data**. See [Demo Data](/administration/demo-data). Do this before you type in your members, and skip it if the database already has real people. The sample replaces the church name and contact details, so afterward open **Admin → Church Information** and put your own details back.