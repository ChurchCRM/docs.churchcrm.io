---
title: FAQs
sidebar_position: 12
---

# Frequently Asked Questions

> 💬 **Have a question?** Post it on [GitHub Discussions](https://github.com/ChurchCRM/CRM/discussions) to get answers from the community!

## Installation

### How do I log into a fresh install?

The installation and setup process creates an admin user that you can use to create other users:

- **Username:** `admin`
- **Password:** `changeme`

Change this password immediately after your first login.

## I get "Too Many Redirects" or errors while making API calls

Please check whether mod_rewrite is working on your server. In addition, read the comment thread at [#3153](https://github.com/ChurchCRM/CRM/issues/3153) for more steps on how to diagnose mod_rewrite.

## Apache2 VirtualHost Config

see [https://github.com/ChurchCRM/CRM/blob/master/cloud9/001-cloud9.conf](https://github.com/ChurchCRM/CRM/blob/master/cloud9/001-cloud9.conf) for the config used by our cloud9 dev system.

## Internal Server Error 500

See the [500 Error](/administration/500-error) guide. In many cases the cause is incorrect file permissions. Set permissions as described in [File System Permissions](/administration/file-system-permissions).

## Error reporting in PHP

To see more detailed errors during troubleshooting, edit your `Include/Config.php` (or the `.example` from the [ChurchCRM source](https://github.com/ChurchCRM/CRM/blob/master/src/Include/Config.php.example)) and change:

`error_reporting(E_ERROR);` to `error_reporting(E_ALL);`

See the [PHP error reporting constants](https://www.php.net/manual/en/errorfunc.constants.php) for other options.

## Debug

Explore various methods for debugging the ChurchCRM application, including turning on error reporting and enabling app logs.

Enable the logs in the System Settings, the default value is INFO but you may want to change that. The logs are created in the `/logs` dir. Please note that logs are not cleaned by the system and it is up to the admin to clean files.

## How do I set up my logo or letterhead?

Many reports and documents can include a logo or letterhead. By default, ChurchCRM looks for these files in the `Images/` directory:
```
church_letterhead.jpg
church_letterhead.png
```

It may be tempting to simply upload your own artwork and rename the files as above, **but this is not "upgrade-safe"**. System upgrades will overwrite your files with the default ones again. The **correct method** is:
1. Ensure your letterhead or logo is 500x80 pixels or an exact multiple of this ratio (eg. 1000x160 is also acceptable).
2. Your logo should be either PNG or JPEG/JPG format. Be aware only PNG supports transparency (*alpha channel*).
3. Upload your image to `/Images` using FTP/sFTP/SSH (*whatever your hosting provider supports*).
   eg. using SSH secure copy:

   ```scp my_fancy_letterhead.jpg user@hostingprovider:ChurchCRM/Images```
4. Log in to ChurchCRM with an admin account.
5. Go to **Admin** → **Edit General Settings** → **Report Settings**.
6. Set **sDirLetterHead** to `../Images/<your_file_name>` and click **Save Settings**.

   Replace `<your_file_name>` with the image you uploaded in step 3.