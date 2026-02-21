---
title: First Run Configuration
sidebar_position: 1
---

## Configuring ChurchCRM

### General Settings
At the top right of the page select the "Admin" left-nav menu, and choose "Edit General Settings"

![Edit General Settings](/img/Setup/admin-gen-settings-1.png)

* You might want to change the `sDefaultPass` to something that pertains to your organization. This is the default password that all new accounts are assigned until they log in and set their own.
* Set `sLanguage` in the Localization tab, to change the language of system.
* Set `sChurchCity` in Church Information tab, to set the location of church.
* Set `sDefaultCity` in Member Setup tab, to set default location of your organization's members.
* Set `sDefaultState` in Member Setup tab. This must be a two letter abbreviation.
* Set `sDefaultCountry` in Member Setup tab. This is needed for some translations.

##### Email Settings

* Set `sToEmailAddress` to the default email address you want requests to come to (ie. `webmaster@domain.com`)
* Set `sSMTPHost` as the email relay server.
* Set `sSMTPUser` and `SMTPPass` to the credentials for the email account.

##### Other Settings

* Set `sChurchLatitude` (You can find this information at http://www.latlong.net/)
* Set `sChurchLongitude` (You can find this information at http://www.latlong.net/)
* Set `sHeader`. You can add a custom header to ChurchCRM by entering the HTML for the custom header.
    Example: If you enter ``<H2>My Church</H2>``, ChurchCRM will display "My Church" in large,
    bold letters at the top of each page.
* Set `sMailChimpApiKey`. MailChimp is a web service that makes it easy to send and track bulk emails. If you do not have an account, create a free one here: http://mailchimp.com/signup. Once you have an account, create an API Key at http://kb.mailchimp.com/accounts/management/about-api-keys and enter that value into this setting.

### Report Settings
At the top right of the page, select the "Admin" left-nav menu, and choose "Edit General Settings" then select the "Report Settings" tab at the top.
The settings in this section define various reports, such as giving statements.

##### Church Information

* Set `sChurchName`
* Set `sChurchAddress`
* Set `sChurchCity`
* Set `sChurchState`
* Set `sChurchZip`
* Set `sChurchPhone`
* Set `sChurchEmail`
* Set `sHomeAreaCode`

##### Signature Information

These are the different signatures used on your financial reports.

* Set `sTaxSigner`
* Set `sReminderSigner`
* Set `sConfirmSigner`

##### Letter Head Graphic

* Set `bDirLetterHead`

### Register your copy
At the top right of the page select the "Tasks" icon (_see screen shot below_) and then select >>Update Registration.
This information is used to inform you of updates to the system.
![Task Menu Icon](/img/Setup/admin-task-menu-1.png)

Security Considerations:
---------------------
- If you are using the database backup utility, make sure the churchcrm/SQL directory is not accessible to your users!
Otherwise, with the right timing, anybody can download and read the temporary
files used in creating database backups. Different web servers have various means of access
control. For example, in Apache you might add this to your httpd.conf:

```
<Directory /home/httpd/html/churchcrm/SQL>
 Order deny,allow
 Deny from all
</Directory>
```

Please see your web server's documentation if you need further help.

## System locale

1. Ensure System has correct locals ```sudo locale-gen es_ES```

   The hosting system must have the correct locale as `gettext` depends on system libs for localization
   - see [HowTo : Change Locale (Language and Character Set) in Linux](http://www.shellhacks.com/en/HowTo-Change-Locale-Language-and-Character-Set-in-Linux)

2. Click the "Admin" left-nav menu, and choose "Edit General Settings"
3. Select ```Localization``` tab
4. Change ```sLanguage``` to one of the available languages in the drop down.
