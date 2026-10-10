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

## Email history and the Email dashboard

ChurchCRM keeps a record of every email it sends, including messages written in the composer, birthday greetings, family verification links, account emails (new account, password reset, lock and unlock, deletion), notifications, volunteer emails, and the SMTP test. Each person's history is shown on their Person View; see [Email History](/user-guide/persons#email-history).

### Recent Sends (administrators)

Administrators also see a **Recent Sends** panel at the bottom of the Email dashboard (**Communication → Email** in the left navigation). It lists the 20 most recent emails ChurchCRM sent to anyone, newest first, with the date, type, subject, recipient address, status, and who sent it (a user, or **Automatic**). The badge next to the title is the total number of emails on record; a red **failed** badge next to it counts the emails the mail server refused.

![Recent Sends panel on the Email dashboard](/img/user-guide/email-dashboard-recent-sends.png)

This is the first place to look when somebody says "nobody got the email":

- If the message is listed as **Sent**, ChurchCRM handed it to the mail server; ask the recipient to check their spam folder.
- If it is **Failed**, hover over the badge to read the mail server's error, then check the [email settings](/administration/email-setup).
- If it is **Skipped**, email sending was turned off, or no mail server was set up, when the message was sent; fix the [email settings](/administration/email-setup) and send again.
- If it is not in the panel, it may be older than the latest 20 the panel shows: open the person's history. An email sent to a family's own address is recorded against the family, not a person, so it is on no person's history, and once it drops out of the latest 20, ChurchCRM no longer shows it.
- If an email to a person is in neither the panel nor their history, ChurchCRM never tried to send it. A person the composer left out (no email address, do not email, deceased, or the same address as another recipient) was named under **Not sent** in the composer's result banner and leaves no entry in the history.

Click a subject to open the email, or open a person to see their full history. Messages written in the composer and volunteer emails open as they were sent; for every other email ChurchCRM keeps only the subject, date, and status, so it shows a note instead of the message (see [Opening an email](/user-guide/persons#opening-an-email)). The panel is visible to administrators only; other users see the history of the people they can open.

---

## Mailchimp

Mailchimp is a plugin, not a system-settings key. There is no **sMailChimpApiKey** field under System Settings.

1. Create a [Mailchimp account](https://mailchimp.com) and an [API key](https://mailchimp.com/help/about-api-keys/).
2. In ChurchCRM, go to **Admin → Plugins** and open the **mailchimp** plugin.
3. Save the API key in that plugin's settings.

The Email dashboard shows **Mailchimp Connected** or **Mailchimp Not Configured**, with **Plugin Settings** when you need to finish the connection.
