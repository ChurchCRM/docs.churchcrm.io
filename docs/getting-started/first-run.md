---
title: First Run Configuration
sidebar_position: 1
---

## Configuring ChurchCRM

### General Settings

In the top navigation, open the **Admin** menu and choose **Edit General Settings**.

![Edit General Settings](/img/Setup/admin-gen-settings-1.png)

* You may want to change the **Default Password** to something specific to your organization. This is the password assigned to all new accounts until the user logs in and sets their own.
* Under the **Localization** tab, set **Language** to change the display language of the system.
* Under the **Church Information** tab, set **Church City** to the location of your church.
* Under the **Member Setup** tab, set **Default City** to the default city for your organization's members.
* Under the **Member Setup** tab, set **Default State**. This must be a two-letter abbreviation.
* Under the **Member Setup** tab, set **Default Country**. This is required for some translations.

##### Email Settings

* Set **Default "To" Email Address** to the address you want to receive system requests (e.g., `webmaster@domain.com`).
* Set **SMTP Host** to your email relay server.
* Set **SMTP Username** and **SMTP Password** to the credentials for your email account.

##### Other Settings

* Set **Church Latitude** and **Church Longitude** to your church's geographic coordinates. You can look these up at [latlong.net](http://www.latlong.net/).
* Set **Custom Header** to add a custom header to ChurchCRM pages. For example, entering `<H2>My Church</H2>` will display "My Church" in large, bold letters at the top of each page.
* Set **Mailchimp API Key** if you use Mailchimp for bulk email. Create a free account at [mailchimp.com/signup](http://mailchimp.com/signup) and generate an API key in your account settings.

### Report Settings

In the top navigation, open the **Admin** menu, choose **Edit General Settings**, then select the **Report Settings** tab. The settings in this section control how various reports — such as giving statements — are generated.

##### Church Information

Fill in your church's name, address, city, state, zip code, phone number, email address, and local area code.

##### Signature Information

These names appear on your financial reports as signatories.

* **Tax Signer** — Signs year-end tax statements.
* **Reminder Signer** — Signs pledge reminder letters.
* **Confirmation Signer** — Signs pledge confirmation letters.

##### Letter Head Graphic

Set **Directory Letter Head** to control whether a letterhead graphic appears on printed directories.

### Register Your Copy

In the top navigation, select the **Tasks** icon (see screenshot below), then choose **Update Registration**. This information is used to notify you of system updates.

![Task Menu Icon](/img/Setup/admin-task-menu-1.png)

### Security Considerations

If you use the database backup utility, make sure the `churchcrm/SQL` directory is not accessible to the public. The temporary files created during backup could otherwise be downloaded by anyone with the right timing. Consult your web server's documentation for how to restrict access to that directory.

## System Locale

If ChurchCRM is not displaying your chosen language correctly, the server may need the corresponding locale installed.

1. On the server, run: `sudo locale-gen es_ES` (replace `es_ES` with your locale code).

   The server must have the correct locale installed, as ChurchCRM uses system libraries (`gettext`) for translations. See [HowTo: Change Locale in Linux](http://www.shellhacks.com/en/HowTo-Change-Locale-Language-and-Character-Set-in-Linux) for guidance.

2. In ChurchCRM, open the **Admin** menu and choose **Edit General Settings**.
3. Select the **Localization** tab.
4. Change **Language** to one of the available languages in the dropdown.
