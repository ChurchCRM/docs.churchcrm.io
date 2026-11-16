---
title: Windows and XAMPP
description: Windows and XAMPP are not supported ChurchCRM installs. You may try them. The project does not help when they fail.
sidebar_position: 11
---

# Windows and XAMPP

ChurchCRM does not support Windows. That includes XAMPP, XAMPP Lite, WAMP, and any other Windows bundle that installs Apache, PHP, and MySQL for you.

You are welcome to download the release and try it on a Windows PC. That attempt is yours. The project does not test it, and we do not help when it breaks. Questions in Discord and issues on GitHub are for the installs this manual describes.

## Why it is not supported

Each release is tested on Linux with Apache, PHP, and MySQL or MariaDB, and in the official [Docker image](/installation/docker). Windows is a different operating system. PHP on Windows does not use the same language libraries, file permissions, or scheduled-task tools. A page that opens does not mean the rest of ChurchCRM will work.

## What does not work

- **Translations.** Menus and pages that come from the server use GNU gettext. Gettext loads a language only when that locale is installed on the operating system. Windows does not provide those locales, so the site stays in English, or only part of a page changes language. See [Server Locale Requirements](/administration/server-locale).
- **Scheduled tasks.** Reminders, volunteer messages, and other background jobs run from a Linux cron line. Windows Task Scheduler is not a substitute this project tests.
- **The server steps in this manual.** They name Linux users (`www-data` or `apache`) and Linux paths. They do not apply to an XAMPP folder, and the two XAMPP layouts (classic and Lite) are not the same.

Other parts can fail too. If a task is not described on a Linux or Docker page, it was not checked on Windows.

## What to use instead

- To look around before you install anything, open the [live demo](https://churchcrm.io/demo.html?utm_source=docs_churchcrm_io&utm_medium=referral&utm_campaign=site_navigation&utm_content=windows_unsupported).
- To try ChurchCRM on your own computer, use [Docker](/installation/docker). Docker Desktop on Windows runs the Linux image. That image is a supported install. XAMPP is not.
- For the church's real data, use [Softaculous](/installation/softaculous), [cPanel](/installation/cpanel-shared-hosting), or a [Linux server](/installation/self-hosted).
