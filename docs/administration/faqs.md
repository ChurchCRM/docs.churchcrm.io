---
title: FAQs
sidebar_position: 12
---

# Frequently Asked Questions

> 💬 **Have a question?** Post it on [GitHub Discussions](https://github.com/ChurchCRM/CRM/discussions) to get answers from the community!

## Installation

### How do I log into a fresh install??

The installation and setup process creates an admin user which can then use to create other users etc:

Username: `admin`

Password: `changeme`

As the default password suggests, **you should change this as immediately after installation**.

## I get a message about "Secret Keys missing from Config.php"

Two factor authentication (2FA) requires a manual change to the `Config.php` file to clear this message. The system will still operate normally if you ignore it, but you won't be able to implement 2FA without making the required changes. See [Secret Keys](/administration/secret-keys) for more details.

## How do I set up map features?

ChurchCRM currently supports two different mapping service providers which cannot be used together; you need to choose one or the other. We currently support:
* Google Maps API
* Microsoft Bing Maps

Both require configuration external to ChurchCRM before attempting to use the mapping features in our application. Please review the [geographic features documentation](https://github.com/ChurchCRM/CRM/wiki/Geographic) for more information.

## I get "Too Many Redirects" or errors while making API calls

Please check whether mod_rewrite is working on your server. In addition, read the comment thread at [#3153](https://github.com/ChurchCRM/CRM/issues/3153) for more steps on how to diagnose mod_rewrite.

## Apache2 VirtualHost Config

see [https://github.com/ChurchCRM/CRM/blob/master/cloud9/001-cloud9.conf](https://github.com/ChurchCRM/CRM/blob/master/cloud9/001-cloud9.conf) for the config used by our cloud9 dev system.

## Internal Server Error 500

We have an [entire page dedicated to resolving 500 errors](https://github.com/ChurchCRM/CRM/wiki/500-Error), but we see in many cases the root cause being incorrect file permissions on the web server. Make sure you set the permissions as per our [documentation on setting up permissions correctly](https://github.com/ChurchCRM/CRM/wiki/File-System-Permissions) for details.

## Error reporting in PHP

Update the copy of [Include\Config.php](https://github.com/ChurchCRM/CRM/blob/master/src/Include/Config.php.example) file change line 56

`error_reporting(E_ERROR);` to `error_reporting(E_ALL);`

also, see a listing of all [PHP error reporting]( http://php.net/manual/en/errorfunc.constants.php) that can be used

## Debug

Explore various methods for debugging the ChurchCRM application, including turning on error reporting and enabling app logs.

Enable the logs in the System Settings, the default value is INFO but you may want to change that. The logs are created in the `/logs` dir. Please note that logs are not cleaned by the system and it is up to the admin to clean files.

## What if my host doesn't have register_globals turned OFF?

There is a simple workaround if your server does not have register_globals
turned off. Create a file called ".htaccess" with a simple text editor and
insert the following line into that new file:
	php_flag register_globals off
Save this file and upload this file into the main ChurchCRM directory.

## How do I setup my Logo or Letter Head?

Many of the reports and documents you can generate from Church CRM allow the inclusion of a logo or letter head. By default, this will be the following files in the `/Images` directory:
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
4. Log into your Church CRM with admin privileges.
5. Go to Admin -> Edit General Settings -> Report Settings
6. Change the value of `sDirLetterHead` to `../Images/<your_file_name>` and hit "Save Settings".

   *Where ``<your_file_name>`` is the name of the image you uploaded in step #3*