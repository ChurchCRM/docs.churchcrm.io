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

### Church Logo

Directly below the church name fields is the **Church Logo** card. Uploading a logo here replaces the ChurchCRM branding everywhere it appears: in the sidebar (where it also replaces the church name text), on the login page and the password-reset, two-factor, error, limited-access and change-password pages, and in emails.

![Church Logo card on the Church Information page, showing the current logo with Upload and Remove buttons](/img/getting-started/church-logo-card.png)

1. Click **Upload** and choose an image. PNG, JPG, GIF or WebP are accepted (not SVG). A wide banner of roughly 3.5:1 — for example 700×200 pixels — works best, and a transparent PNG looks best on the coloured login page.
2. The image editor opens; adjust the crop if you like and click **Save**, then click **Upload 1 file**. The preview, the sidebar and the login page update immediately; there is nothing else to save.
3. To go back to the default ChurchCRM branding, click **Remove**.

The image is scaled down to fit 1200×400 pixels and stored as `Images/church-logo.png`. It is kept across upgrades and is ignored by the file-integrity check.

| Sidebar | Login page |
|---------|------------|
| ![Sidebar showing the uploaded church logo in place of the ChurchCRM branding](/img/getting-started/church-logo-sidebar.png) | ![Login page showing the uploaded church logo above the sign-in form](/img/getting-started/church-logo-login.png) |

:::note
This step is optional and can be done at any time from **Admin → Church Information**. The letterhead printed on PDF reports is a separate image — see [How do I set up my logo or letterhead?](/administration/faqs#how-do-i-set-up-my-logo-or-letterhead).
:::

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
