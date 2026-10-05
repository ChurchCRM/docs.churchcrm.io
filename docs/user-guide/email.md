---
title: Email
sidebar_position: 18
---

# Email

ChurchCRM provides built-in tools to email individuals, groups, and cart selections directly from the app, plus optional Mailchimp integration for newsletters.

## Prerequisites

Before sending emails, ensure your system administrator has configured email settings in **Admin → System Settings → Email Settings**.

---

## In-App Email Composer

As of **7.5.0**, ChurchCRM includes an in-app email composer that replaces the old mailto: link approach. The composer works across all email entry points — people dashboard, group view, and cart — and handles unlimited recipient lists without hitting browser URL length limits.

### How to use it

1. Navigate to the page you want to email from (see entry points below).
2. Click the **Email** button (or "Email Group", "Email Cart", etc.).
3. The composer modal opens showing:
   - **Recipient count badge** — total recipients, with a collapsible list grouped by role (e.g. Head of Household, Member).
   - **BCC toggle** — switch between To: and BCC: addressing.
   - **Copy Addresses** — copies all email addresses to your clipboard so you can paste them into any email client.
   - **Open in Email Client** — opens your default mail app with recipients pre-filled. Available for lists of **50 addresses or fewer**; disabled with a tooltip for larger lists (use Copy Addresses instead).

### Entry points

| Where | How to reach it |
|-------|----------------|
| People / mailing list | **People → Email Members** on the dashboard |
| Group members | Open a group → **Email Group** button |
| Cart | **Cart → List Cart Items** → **Email Cart** |

---

## Mailchimp Integration

[Mailchimp](https://mailchimp.com) is recommended for newsletters and announcements to large audiences. Free accounts support up to 500 contacts.

### Setting Up Mailchimp

1. Create a [Mailchimp account](https://mailchimp.com).
2. [Generate an API Key](https://mailchimp.com/help/about-api-keys/) in your Mailchimp account.
3. In ChurchCRM, go to **Admin → System Settings → Integration**.
4. Enter your API key in the **sMailChimpApiKey** field and save.

### Subscribing Families to Newsletters

1. Open a [Family](./families.md) record.
2. Enable the **Newsletter** option.
3. Use Mailchimp's audience sync to import subscribers.

---

## Email history and the Email dashboard

As of **7.8.0**, ChurchCRM keeps a record of every email it sends, including messages written in the composer, birthday greetings, family verification links, account emails (new account, password reset, lock and unlock, deletion), notifications, volunteer emails, and the SMTP test. Each person's history is shown on their Person View; see [Email History](/user-guide/persons#email-history).

### Recent Sends (administrators)

Administrators also see a **Recent Sends** panel at the bottom of the Email dashboard (**Communication → Email** in the left navigation). It lists the 20 most recent emails ChurchCRM sent to anyone, newest first, with the date, type, subject, recipient address, status, and who sent it (a user, or **Automatic**). The badge next to the title is the total number of emails on record; a red **failed** badge next to it counts the emails the mail server refused.

![Recent Sends panel on the Email dashboard](/img/user-guide/email-dashboard-recent-sends.png)

This is the first place to look when somebody says "nobody got the email":

- If the message is listed as **Sent**, ChurchCRM handed it to the mail server; ask the recipient to check their spam folder.
- If it is **Failed**, hover over the badge to read the mail server's error, then check the [email settings](/administration/email-setup).
- If it is **Skipped**, email sending was turned off, or no mail server was set up, when the message was sent; fix the [email settings](/administration/email-setup) and send again.
- If it is not listed at all, ChurchCRM never tried to send it. A person the composer left out (no email address, do not email, deceased, or the same address as another recipient) was named under **Not sent** in the composer's result banner and leaves no entry in the history. The panel shows only the latest 20 emails, so for an older one open the person's history. An email sent to a family's own address is recorded against the family, not a person, so it is on no person's history: once it drops out of the latest 20, ChurchCRM no longer shows it.

Click a subject to open the email, or open a person to see their full history. Messages written in the composer and volunteer emails open as they were sent; for every other email ChurchCRM keeps only the subject, date, and status, so it shows a note instead of the message (see [Opening an email](/user-guide/persons#opening-an-email)). The panel is visible to administrators only; other users see the history of the people they can open.

---

## Best Practices

- Always get consent before adding someone to an email list.
- Use Mailchimp for newsletters and large announcements.
- Use the in-app composer for ad-hoc messages to a person, a family, a group, or the cart.
- Keep your [Classifications](./classifications.md) updated to target the right audiences.

---

## Migration Note (7.5.1)

The `sMailtoDelimiter` setting (previously in **Admin → System Settings**) has been removed in 7.5.1. It controlled the separator used in the old mailto: links, which are no longer generated. The 7.5.1 database migration removes this setting automatically — no manual action required.
