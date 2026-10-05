---
title: First Run Configuration
sidebar_position: 1
---

## First-Run Setup Flow

After the setup wizard completes and you log in for the first time, ChurchCRM walks you through two mandatory steps before you can access the application.

### Step 1: Change Your Password

The default admin account uses the temporary password `changeme`. On first login you are immediately redirected to the **Change Password** page. Choose a strong password — you cannot skip this step.

### Step 2: Church Information

After your password is set, you are automatically redirected to **Admin → Church Information**. The system enforces this: until a church name is saved, every page you visit redirects back here. Fill in the required fields and click **Save Church Information** to proceed.

---

## Church Information Page

The Church Information page is one form made of several cards, one below the other. Fill them in and click **Save Church Information** at the bottom of the page to save them all at once.

### Church Identity and Contact Information

The **Church Identity** card holds the church name and website; the **Contact Information** card holds the phone number and email address.

| Field | Required | Notes |
|-------|----------|-------|
| **Church Name** | ✅ Yes | Appears on all reports, directories, and communications |
| **Website** | No | Full URL, e.g. `https://yourchurch.org` |
| **Phone Number** | ✅ Yes | Main contact number |
| **Email Address** | ✅ Yes | Main contact email |

Language and time zone are not on this page; they are under **Admin → Localization & Formats** (see [Localization & Formats](../administration/localization.md)).

### Location

This card covers your church's physical address.

| Field | Required | Notes |
|-------|----------|-------|
| **Street Address** | ✅ Yes | |
| **City** | ✅ Yes | |
| **State** | ✅ Yes | Populated dynamically based on selected country |
| **Zip Code** | ✅ Yes | |
| **Country** | ✅ Yes | |

Under **Map Coordinates**, click **Generate Coordinates** to look up the latitude and longitude from the address, or type them in yourself. If both are blank when you save, ChurchCRM looks them up from the address. Once coordinates are saved, a map shows the church's location. Saving does not look up the address again while coordinates are filled in: if you change the address, the card warns that it has changed since the coordinates were set, so click **Generate Coordinates** before you save.

### Social Media

Optional links to the church's own accounts on **X**, **YouTube**, **Facebook** and **Instagram**. Leave a field blank to hide that network.

![Social Media card on the Church Information page, with the four links filled in](/img/getting-started/church-info-social-media.png)

| Field | Required | Notes |
|-------|----------|-------|
| **X** | No | Full address, e.g. `https://x.com/yourchurch` |
| **YouTube** | No | Full address, e.g. `https://youtube.com/@yourchurch` |
| **Facebook** | No | Full address, e.g. `https://facebook.com/yourchurch` |
| **Instagram** | No | Full address, e.g. `https://instagram.com/yourchurch` |

Each value must be a full `https://` web address. A plain `http://` link, a bare handle such as `@yourchurch`, or anything that is not a web address is rejected with a message naming the network, for example "X must be a full https:// web address". Nothing on the page is saved until you fix it, and what you typed stays on the form so you can correct it.

:::note
These links are stored with the other church identity settings and are edited only here; they do not appear on the **System Settings** page. The card says they are shown to members on pages such as the portal footer; at present the only place ChurchCRM shows them is the Display Preview below.
:::

### Display Preview

This card shows how your church information will appear on reports and printed directories. The name, address and contact lines update as you type. Use it to confirm the address block looks correct before saving. Below them, each saved social media link appears as a clickable brand icon, in the order X, YouTube, Facebook, Instagram; the icons change when you save, not as you type. When no social media link is saved, the row of icons is hidden.

---

## Get Started checklist

After the mandatory church-information step, ChurchCRM takes you to a **Get Started** page (also reachable any time from **Admin → Get Started**). This is a setup checklist that walks you through the remaining configuration tasks — email settings, user accounts, classifications, and import of existing data — and ticks each item off as you complete it. You can come back to it whenever you want; it's safe to ignore if you prefer to configure things directly.

---

## Completing Your Configuration

Once the mandatory setup is done, a few additional settings are worth configuring right away.

### Member Defaults

Open **Admin** → **System Settings** → **Families** tab.

- **Default City** — pre-fills the city field for new member records.
- **Default State** — pre-fills the state (two-letter abbreviation).
- **Default Country** — required for some locale-specific formatting.

### Email Settings

Open **Communication** → **Email**, then click the **Email Settings** button.

- **Default "To" Email Address** — address that receives system requests (e.g. `webmaster@domain.com`).
- **SMTP Host**, **SMTP Username**, **SMTP Password** — credentials for your outbound email relay.

### Security Considerations

If you use the database backup utility, make sure the `churchcrm/SQL` directory is not publicly accessible. Consult your web server's documentation for how to restrict directory access.

---

## System Locale

If ChurchCRM does not display your chosen language correctly, the server may need the corresponding locale installed. See [Server Locale Requirements](/administration/server-locale) for how to install locales on Debian/Ubuntu and Rocky Linux/RHEL.
