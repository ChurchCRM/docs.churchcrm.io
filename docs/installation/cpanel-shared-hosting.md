---
title: cPanel Shared Hosting
sidebar_position: 5
---

Installing ChurchCRM in Cpanel/shared hosting
1. login to your website Cpanel
2. if you want to install ChurchCRM in a subdomain e.g. `http://churchcrm.mywebsite.org`, you should create the subdomain "churchcrm" using cpanel's "Subdomains"
3. if you want to install ChurchCRM in a subdirectory e.g. `http://mywebsite.org/churchcrm`, create the subdirectory "churchcrm" in your webroot using cpanel filemanager (usually:  `/home.../myusername/public_html/churchcrm`)
4. You can also install in your webroot e.g `http://myChurchCRM.org` (usually:  `/home.../myusername/public_html/`) [NOTE:- if using the root directory, when extracting the zip file or uploading, all files in the folder "churchcrm" should go into your webroot]
5. Go to cpanel's "MySQL databases" to create a new database e.g myusername_myChurchCRM
6. Asign/Add a user  to the newly created database ("Add a User to a Database") or
7. Create a new user and set password for the created database e.g myusername_ChurchCRMAdmin ("MySQL Users, Add a New User") grant all priviledges to the user.
8. Download ChurchCRM latest release [https://github.com/ChurchCRM/CRM/releases/latest](https://github.com/ChurchCRM/CRM/releases/latest)
9. Upload ChurchCRM application files to yor website.
**Use the following steps for an FTP upload** or follow "_Using Cpanel's Filemanager_" below:
10. Extract the downloaded ChurchCRM zip file to a directory on your computer (The downloaded zip file contains a single directory called "churchcrm")
11. Use an FTP client (e.g. filezilla) to upload all the files in the directory "churchcrm" to your prefered website directory (steps 2,3,& 4 above)
12. change all ChurchCRM files to mode 644 (rw-r--r--) and directories to mode 755 (rwxr-xr-x). See "[File System Permissions](https://github.com/ChurchCRM/CRM/wiki/File-System-Permissions)" for more detail.
13. **Using Cpanel's Filemanager**
14. In Cpanel's Filemanager, upload and extract all the files in the ChurchCRM zip file you downloaded in step 8 to your preferred installation directory (steps 2,3,& 4 above) (be aware that the zip file contains a single directory "churchcrm" you need to get all the files in that directory to your prefered directory)
15. Check permissions on all files are mode 644 (rw-r--r--) and directories are mode 755 (rwxr-xr-x). See "[File System Permissions](https://github.com/ChurchCRM/CRM/wiki/File-System-Permissions)" for more detail. Depending on your hosting provider, there may be nothing needed for this.
16. You should be able to access ChurchCRM at "`http//mywebsite.org/churchcrm` (for a subdirectory and subdomain install) or "`http//churchcrm.mywebsite.org`" (for a subdomain install), or  `http//mywebsite.org` (for web root install)
17. The setup page will help you configure the app for first-time use.

The database script would have set up an initial user called "**Admin**" with a password of "**changeme**". You will be prompted to change this password upon login. Once you have created other user accounts, you may delete or rename this default account. Just make sure that you always have a user with administrative privileges.

***NOTE***

If the setup process fails, please feel free to reach out for help and review our documentation on how to gather logs and other diagnostic information [here](https://github.com/ChurchCRM/CRM/wiki/Logging-and-Diagnostics)

## Test the System Before Importing Real Data

- Test the system by importing demo data: [Importing Demo Data via Admin Pages](Importing-Demo-Data.md)