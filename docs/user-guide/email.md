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

1. Open a [Family](Families) record.
2. Enable the **Newsletter** option.
3. Use Mailchimp's audience sync to import subscribers.

---

## Best Practices

- Always get consent before adding someone to an email list.
- Use Mailchimp for newsletters and large announcements.
- Use the in-app composer for ad-hoc group and cart emails.
- Keep your [Classifications](Classifications) updated to target the right audiences.

---

## Email history and the Email dashboard

As of **7.8.0**, ChurchCRM keeps a record of every email it sends: messages written in the composer, birthday greetings, family verification links, account emails (new account, password reset, lock and unlock, deletion), notifications, and the SMTP test. Each person's history is shown on their Person View; see [Email History](/user-guide/persons#email-history).

### Recent Sends (administrators)

Administrators also see a **Recent Sends** panel at the bottom of the Email dashboard (**Communication → Email** in the left navigation). It lists every email ChurchCRM has sent to anyone, newest first, with the recipient address, the status, and who sent it (a user, or **Automatic**). The badge next to the title is the total number of emails on record; a red **failed** badge next to it counts the emails the mail server refused.

![Recent Sends panel on the Email dashboard](/img/user-guide/email-dashboard-recent-sends.png)

This is the first place to look when somebody says "nobody got the email":

- If the message is listed as **Sent**, ChurchCRM handed it to the mail server; ask the recipient to check their spam folder.
- If it is **Failed**, hover over the badge to read the mail server's error, then check the [email settings](/administration/email-setup).
- If it is **Skipped**, email sending was disabled when the message was written; enable it and send again.
- If it is not listed at all, the person was not emailed. Open the composer result again, or the person's history, to see why they were left out.

Click a subject to open the email as it was sent, or open a person to see their full history. The panel is visible to administrators only; other users see the history of the people they can open.

---

## Migration Note (7.5.1)

The `sMailtoDelimiter` setting (previously in **Admin → System Settings**) has been removed in 7.5.1. It controlled the separator used in the old mailto: links, which are no longer generated. The 7.5.1 database migration removes this setting automatically — no manual action required.
