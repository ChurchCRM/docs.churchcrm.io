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

## Migration Note (7.5.1)

The `sMailtoDelimiter` setting (previously in **Admin → System Settings**) has been removed in 7.5.1. It controlled the separator used in the old mailto: links, which are no longer generated. The 7.5.1 database migration removes this setting automatically — no manual action required.
