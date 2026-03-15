---
title: First Run Configuration
sidebar_position: 1
---

## First-Run Setup Flow

After the setup wizard completes and you log in for the first time, ChurchCRM walks you through two mandatory steps before you can access the application.

### Step 1: Change Your Password

The default admin account uses the temporary password `changeme`. On first login you are immediately redirected to the **Change Password** page. Choose a strong password — you cannot skip this step.

### Step 2: Church Information

After your password is set, you are automatically redirected to **Admin → Church Information**. The system enforces this: until a church name is saved, every page you visit redirects back here.

The following fields are required before you can proceed:

- **Church Name**
- **Phone Number**
- **Email Address**
- **Street Address**, **City**, **State/Province**, **Zip Code**, **Country**

Fill in all required fields, then click **Save**. You will be taken to the dashboard and can use the full application normally.

:::tip Location tab
Switch to the **Location** tab to enter your address. The map is populated automatically from the address on every save — no coordinates needed.
:::

## Completing Your Configuration

Once the mandatory setup is done, a few additional settings are worth configuring right away.

### Language and Time Zone

On the same **Church Information** page, set **Language** and **Time Zone** to control date formats, phone formats, and scheduled event times.

### Member Defaults

Open **Admin** → **Edit General Settings** → **Member Setup** tab.

- **Default City** — pre-fills the city field for new member records.
- **Default State** — pre-fills the state (two-letter abbreviation).
- **Default Country** — required for some locale-specific formatting.

### Email Settings

Open **Admin** → **Edit General Settings** → **Email** tab.

- **Default "To" Email Address** — address that receives system requests (e.g. `webmaster@domain.com`).
- **SMTP Host**, **SMTP Username**, **SMTP Password** — credentials for your outbound email relay.

### Security Considerations

If you use the database backup utility, make sure the `churchcrm/SQL` directory is not publicly accessible. Consult your web server's documentation for how to restrict directory access.

## System Locale

If ChurchCRM does not display your chosen language correctly, the server may need the corresponding locale installed. See [Server Locale Requirements](/administration/server-locale) for how to install locales on Debian/Ubuntu and Rocky Linux/RHEL.
