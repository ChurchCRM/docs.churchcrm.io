---
title: Email from ChurchCRM
sidebar_position: 18
---

# Email from ChurchCRM

Use **Email** on a group or the cart, or **Email All** on the people dashboard, to open your own email program with those addresses. Newsletters can go through the Mailchimp plugin.

## Email dashboard

**Communication → Email** opens the Email dashboard at `/v2/email/dashboard`. SMTP and the switch that turns email on live here, not under **System Settings → Email Settings**.

Admins use **Email Settings** on that page:

- **Enable Email**
- SMTP fields: **SMTP Host**, **SMTP Timeout**, **Encryption**, **Auto TLS**, **SMTP Authentication**, **SMTP Username**, and **SMTP Password**

Until email is enabled, the page says **Email is Disabled** and tells you to enable it, then configure SMTP. The status line is **SMTP Configured** or **SMTP Not Configured**.

**Email Tools** on the same page:

- **Duplicates** — addresses that are used more than once (`/v2/email/duplicate`)
- **People Without Emails** — people with no personal or work email (`/v2/email/missing`)

Password resets and similar system messages use that SMTP setup. The buttons below do not send the message from inside ChurchCRM. They hand the addresses to your email program.

## Opening addresses in your email program

1. Go to the people dashboard, a group, or the cart.
2. Click **Email All** on the people dashboard, or **Email** on a group or on the cart.
3. The dialog lists the addresses and offers:
   - **BCC Mode** — put the addresses on the BCC line instead of To.
   - **Copy Addresses** — copy the list so you can paste it into any mail program. This works for any size list.
   - **Open in Email Client** — open a `mailto:` link. This stays disabled when there are more than 50 addresses. Copy the addresses instead.

---

## Mailchimp

Mailchimp is a plugin, not a system-settings key. There is no **sMailChimpApiKey** field under System Settings.

1. Create a [Mailchimp account](https://mailchimp.com) and an [API key](https://mailchimp.com/help/about-api-keys/).
2. In ChurchCRM, go to **Admin → Plugins** and open the **mailchimp** plugin.
3. Save the API key in that plugin's settings.

The Email dashboard shows **Mailchimp Connected** or **Mailchimp Not Configured**, with **Plugin Settings** when you need to finish the connection.
