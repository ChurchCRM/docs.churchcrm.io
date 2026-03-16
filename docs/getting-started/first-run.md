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

The Church Information page is organized into three tabs.

### Basic Information tab

This tab covers your church's identity and contact details.

| Field | Required | Notes |
|-------|----------|-------|
| **Church Name** | ✅ Yes | Appears on all reports, directories, and communications |
| **Website** | No | Full URL, e.g. `https://yourchurch.org` |
| **Phone Number** | ✅ Yes | Main contact number |
| **Email Address** | ✅ Yes | Main contact email |
| **Language** | No | Controls date formats, phone formats, and UI language |
| **Time Zone** | No | Used for scheduling events and reporting times |

### Location & Map tab

This tab covers your church's physical address.

| Field | Required | Notes |
|-------|----------|-------|
| **Street Address** | ✅ Yes | |
| **City** | ✅ Yes | |
| **State / Province** | ✅ Yes | Populated dynamically based on selected country |
| **Zip / Postal Code** | ✅ Yes | |
| **Country** | ✅ Yes | |

After saving an address, a **Leaflet map** appears showing your geocoded location. Coordinates are detected automatically — no manual entry required. The map updates on every save.

### Display Preview tab

This tab shows a live preview of how your church information will appear on reports and printed directories. It updates as you fill in the other tabs. Use it to confirm the address block looks correct before saving.

---

## Completing Your Configuration

Once the mandatory setup is done, a few additional settings are worth configuring right away.

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

---

## System Locale

If ChurchCRM does not display your chosen language correctly, the server may need the corresponding locale installed. See [Server Locale Requirements](/administration/server-locale) for how to install locales on Debian/Ubuntu and Rocky Linux/RHEL.
