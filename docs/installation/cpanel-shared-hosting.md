---
title: cPanel Shared Hosting
sidebar_position: 5
---

# Installing ChurchCRM on cPanel / Shared Hosting

1. Log in to your hosting **cPanel**.
2. **Subdomain:** To use e.g. `http://churchcrm.mywebsite.org`, create the subdomain "churchcrm" in cPanel → **Subdomains**.
3. **Subdirectory:** To use e.g. `http://mywebsite.org/churchcrm`, create the folder "churchcrm" in your web root (often `public_html/churchcrm`) using **File Manager**.
4. **Web root:** To use e.g. `http://myChurchCRM.org`, install in web root (`public_html/`). When extracting the zip, place the *contents* of the "churchcrm" folder into web root.
5. In cPanel → **MySQL Databases**, create a new database (e.g. `myusername_churchcrm`).
6. **Add a user to the database** (or create a new MySQL user) and grant **All Privileges** to that database.
7. Download the latest release from [GitHub Releases](https://github.com/ChurchCRM/CRM/releases/latest).
8. Upload the ChurchCRM files to your site.

**FTP upload:**
9. Extract the zip on your computer (it contains a single folder "churchcrm").
10. Use an FTP client (e.g. FileZilla) to upload the *contents* of the "churchcrm" folder to your chosen directory (subdomain, subdirectory, or web root).
11. Set file permissions: files 644, directories 755. See [File System Permissions](/administration/file-system-permissions).

**Or using cPanel File Manager:**
9. In **File Manager**, upload the ChurchCRM zip, then extract it. Move the contents of the "churchcrm" folder into your target directory.
10. Set permissions: files 644, directories 755. See [File System Permissions](/administration/file-system-permissions). Some hosts set these automatically.

Open your site in a browser (e.g. `https://mywebsite.org/churchcrm` or `https://churchcrm.mywebsite.org`). The setup wizard will guide you through first-time configuration.

After setup, log in as **admin** with password **changeme** and change the password when prompted. Keep at least one user with administrative privileges.

If setup fails, see [Logging & Diagnostics](/administration/logging-and-diagnostics) for how to gather logs and [Troubleshooting](/administration/troubleshooting) for common fixes. You can also ask for help on [GitHub Discussions](https://github.com/ChurchCRM/CRM/discussions).

## Test before importing real data

Use the built-in demo data import from **Admin** (if available) or import a small CSV to verify the system. See [Data Import](/user-guide/data-import).