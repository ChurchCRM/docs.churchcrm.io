---
title: File System Permissions
sidebar_position: 10
---

# Background
The development team here at ChurchCRM do our best to make the installation process as simple as possible. However, with so many variations in hosting providers, self-hosting, containers, etc, it's impossible to cover all scenarios in a single installer and/or document. Having said that, one of the most common problems we receive support requests about stem from file system permissions. If these are not configured appropriately, depending on your web server setup, this can lead to any of the following:
* Application failure - ie, 500 errors (internal server error)
* Processes within the application not being able to read/write files to/from disk which generally causes an error to the user (often a "403" forbidden or access denied error).
* Backups failing to run, again with 403 errors.
* Some web servers simply refusing to even read your files
* Other randomness depending on your configuration.

***

### [Just show me the solution](#the-tldr-version)

**You:** *Yeh, yeh, yeh...just show me the magic sauce!*

**Us:**  It’s actually very useful to understand why...

**You:** *2 words...Magic. Sauce.*

**Us:**  \**sigh*\*...scroll to the bottom of the page, there’s a **TL;DR**

# Purpose
This document endeavours to outline the process of:
1. Determining the user and group your web server is running as
2. Setting the correct user and group ownership on the ChurchCRM application files
3. Setting the correct permissions on the ChurchCRM application files

# Assumed
* You have shell access to your web server.
* You have a basic understanding of the Unix/Linux command line environment

# 1. Web Server Runtime User/Group

**NOTE: If you are using a shared hosting provider, skip section 1 and 2! [Go straight to part 3](#3-setting-correct-permissions).**

All processes on a modern operating systems run as a particular user. This allows administrators to limit the access a process has based on the user and associated groups the process runs as. This is particularly important for exposed services like web servers.

## 1.1 Determining the process user
On Debian (and derivatives, eg, Ubuntu) the Apache web server process typically runs as user `www-data`. On RedHat (and derivatives, eg CentOS) the Apache web server process typically runs as user `httpd`.

You can check for yourself (this is a Debian system):
```
$ ps -ef -q $(pidof apache2|tr \  ,)
UID        PID  PPID  C STIME TTY          TIME CMD
www-data  3376   416  0 00:00 ?        00:00:00 /usr/sbin/apache2 -k start
www-data  3375   416  0 00:00 ?        00:00:00 /usr/sbin/apache2 -k start
www-data  3374   416  0 00:00 ?        00:00:00 /usr/sbin/apache2 -k start
root       416     1  0 Feb11 ?        00:00:06 /usr/sbin/apache2 -k start
```
Notice, the processes with the same parent process ID (PPID) are all running as `www-data`. This is a fairly normal convention in Unix/Linux, where the `root` user starts the process (*416 above*) but then immediately drops privileges to a restricted user for the processes (*3374, 3375, 3376 above*) that will actually handle the requests.

## 1.2 Determining the process groups
Group memberships are a good way to associate users with similar task to a shared permission. To avoid having to elevate your own user privileges when you may want to edit a file that someone else owns, you put yourself and the other user in the same group, then assign that group to the file you want to edit etc.

For our purposes, we simply need to know if the Apache web server user is a member of any groups as well, so we can set that group to the ChurchCRM files. To accomplish this, we use a simple Unix/Linux tool called `groups`.
```
$ groups www-data
www-data : www-data
```
The usage is pretty simple `groups username` which will output a line `username : group1 group2 etc...`. Seeing as we know the username (from 1.1) we can see (above) the `www-data` user is only a member of a single group `www-data`, which is the usual case on most systems.

# 2. Setting the Correct Ownership and Group

**NOTE: If you are using a shared hosting provider, skip section 1 and 2! [Go straight to part 3](#3-setting-correct-permissions).**

Using the details from 1.1 and 1.2, we now have the information we need to set up the file system for ChurchCRM.

Because ChurchCRM is distributed in a zip file, the permissions of the files/directories are not retained when you decompress it on your web server. Typically, the files will inherit the permissions of the user who uncompressed the zip file. Usually this is **not** what you need to run ChurchCRM.

For the purpose of this document, let's assume you have extracted the zip file in `/var/www/html/churchcrm`.

To set the ownership and group (see 1.1 and 1.2) is very simple:
```
cd /var/www/html/churchcrm
find . -exec chown www-data:www-data "{}" \;
```

The above `chown` uses a shorthand to set the file/directory owner **and** group at once with `chown owner:group`. Secondly, we've wrapped the `chown` in the `find` command as the `find` command will also pick up the "*hidden*" files (especially `.htaccess`) that simple shell globbing won't. Also, it's portable across most shells.

If the `find` command throws an error like `chown: changing ownership of '<FILE>': Operation not permitted` re-run the command with `sudo` (ie, `sudo find . -exec ..etc..`). I'll leave it up to the reader to get a grip on `sudo` as there are many online resources available explaining it's use specific to YOUR operating system, or Linux distribution.

# 3. Setting Correct Permissions
Now that we have the user and group assignments we need to set the permissions. Files and directories need to be handled separately because the execute bit has different meanings on each. Assigning the execute bit on PHP files can cause application errors on systems using Apaches security system called `mod_security`. However, leaving the execution bit *unset on directories* makes it impossible to open the directory; you would have to explicitly know what was inside the directory to access anything!

Our target file permissions are:
* User = read+write
* Group = read-only
* Others = read-only

Or mode 644

Our target directory permissions are:
* User = read+write+execute
* Group = read+execute
* Others = read+execute

Or mode 755

Executing the following will achieve the required permissions for both files and directories:
```
cd /var/www/html/churchcrm
find . -type f -exec chmod 644 "{}" \;
find . -type d -exec chmod 755 "{}" \;
```

Again, we've wrapped the commands in `find` to pick up the any hidden files or folders. Also, if you see an error like `chmod: changing permissions of '<FILE|DIR>': Operation not permitted`, prefix the `find` commands with `sudo`.

# The TL;DR Version
Only do this if you know what you're doing:
```
cd <directory where you unzipped ChurchCRM>
find . -exec chown user:group "{}" \;   # Usually not required on shared hosting environments (see above)
find . -type f -exec chmod 644 "{}" \;
find . -type d -exec chmod 755 "{}" \;
```

Where:
1. `user` = the user the web server process runs as (*see 1.1 above*)
2. `group` = an appropriate group the `user` is a member of (*see 1.2 above*)
