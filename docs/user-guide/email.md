---
title: Email from ChurchCRM
sidebar_position: 18
---

# Email from ChurchCRM

ChurchCRM provides built-in tools to email individuals, families, groups, and cart selections directly from the app, plus optional Mailchimp integration for newsletters.

## Prerequisites

To send email from ChurchCRM itself, your system administrator must configure an outgoing mail server and turn on email sending under **Communication → Admin → Email Settings**. See [Email Setup](/administration/email-setup) for the steps. Until then, the composer still helps you reach people through your own mail program (see [Fallbacks](#fallbacks-copy-addresses-and-open-in-email-client)).

You also need the **Email** permission on your user account. Administrators always have it. For other users, an administrator edits the user under **Admin → System Users** and, in the **User Config** table, sets **Permission** to **True** on the `bEmailMailto` row. Ask an administrator if the paper-plane button described below does not appear for you.

---

## Sending email from ChurchCRM

ChurchCRM sends email itself when email sending is enabled. You write the message in the composer, click **Send Email**, and ChurchCRM hands the church's mail server a separate message for each recipient, sent from the church's email address. Nothing is handed off to a mail program on your computer.

### Sending to one person or family

A paper-plane button appears next to each email address on:

- the **Person View** (the person's own address, and the address of each other member in the family list),
- the **Family View** (each head of household's and spouse's own address on the **Email** card, and each family member),
- the **Person Listing** (**People → Person Listing**),
- the **Photo Directory**, where it is the envelope button on each person's card.

Click it to open the composer with that one recipient. The email address next to the button is still an ordinary link that opens your own mail program, for anyone who prefers that.

**Email \<name\> Family** on the Family View sends one message for the whole family. Families have no email address of their own, so it goes to the head of household's own email, or to the spouse's when no head of household has one. See [Families → Email](/user-guide/families#email).

On the Person View, the family card (for example **Campbell Family**) also carries the button on every other family member's row, so you can email a relative without opening their record. The person's own row has none, because their address under **Contact & Personal Info** already has one.

### Sending to a list

| Where | How to reach it |
|-------|----------------|
| Everyone | **People** dashboard → **Email All** |
| Group members | Open a group → **Email** |
| Sunday School class | Open a class → **Email** (teachers, students, and parents also have their own buttons) |
| Cart | **Cart** → **Email** |
| People who missed an event | Open an event that has ended → **Did Not Attend** card → **Email All**, or the button next to one person's address (the card appears when groups are linked to the event) |

The composer opens with the list already loaded. The **recipient count** badge shows how many people will be emailed; expand the list to see who they are, grouped by role. When the list has more than one role (for example Member and Guest, or a class's teachers and parents), **Roles to include** shows a checkbox for each; untick a role to leave those people out.

**Send Email** reaches up to 500 people at a time. ChurchCRM refuses a larger send with a message saying so; narrow the list (untick roles, or use a group or the cart), or use [Mailchimp](#mailchimp) for newsletters.

### Writing the message

Open **Compose Message** and enter a subject and message. The closing starts with "Sincerely," followed by your name and the church name; edit or remove it as needed. **Cancel** discards the draft.

Use **Preview** to check the church header and the message as the first recipient will receive it. The title identifies that recipient and how many others will receive the message. **Back to editing** returns to your draft.

**Send Email** sends the message. Once sent, the form is locked to prevent sending the same draft twice.

![Preview of the message as it will arrive](https://cdn.churchcrm.io/screenshots/en/desktop/email-composer-preview.png)

Each recipient gets a separate message addressed to them alone, so nobody sees anyone else's address. The message is sent from the church's email address.

:::note What the recipient sees
The email contains your message as you typed it, with the church logo and name above it and the church's contact block below it (name, address, phone, email, and website, exactly as shown in the **Display Preview** on **Admin → Church Information**). ChurchCRM does not add a "Dear …" line or a closing of its own, and there is no "you received this email because…" or unsubscribe text: newsletters go through [Mailchimp](#mailchimp), which adds its own.
:::

### Who was not emailed

After sending, a banner in the composer confirms how many people were emailed. If anyone was left out, the banner lists them under **Not sent** with the reason:

| Reason | Meaning |
|--------|---------|
| no email address | The person has no email address of their own. |
| no head of household or spouse has an email address | A family was emailed, and no head of household or spouse in it has their own email. |
| marked do not email | The person has the property your administrator chose as **Do Not Email Property** in the email settings. |
| deceased | The person is marked as deceased. |
| inactive family | The family record is deactivated. |
| same address as another recipient | Two people share one address; the message went to that address once. |
| record not found | The person or family was deleted after the list was loaded. |

![The result banner listing a recipient who was not emailed and why](https://cdn.churchcrm.io/screenshots/en/desktop/email-send-result-not-sent.png)

A skipped person is not an error: ChurchCRM checked the record and decided not to send. A person counted as sent had their message handed to the mail server without an error; ChurchCRM cannot see whether it then reached their mailbox. If nobody could be emailed, the banner is red and says so (for example *No email was sent.*), with the same **Not sent** list, and **Send Email** stays available so you can correct the records and try again. If the mail server refused a message, the banner shows that person's name with the error the server returned; ask your administrator to check the [email settings](/administration/email-setup).

### Fallbacks: Copy Addresses and Open in Email Client

The composer keeps the two older options at the bottom of the window:

- **Copy Addresses** — copies every address to your clipboard so you can paste it into any mail program.
- **Open in Email Client** — opens your default mail program with the recipients filled in. Available for lists of **50 addresses or fewer**; for larger lists use Copy Addresses instead.
- **BCC Mode** — makes **Open in Email Client** put the addresses in BCC: instead of To:. It has no effect on **Copy Addresses** or on **Send Email**, which always sends one message per person.

Use these when email sending is not set up, or when you would rather write the message in your own mail program.

:::tip The church's own address
When you email a list (cart, group, class, everyone) and an administrator has set *Copy Church Email* under **Communication → Admin → Email Settings**, the composer shows **Also send to church address (…)**, ticked, so the office keeps a copy. Untick it to leave the office out. This applies to **Copy Addresses** and **Open in Email Client** only. **Send Email** mails the people in the list and nobody else: when the list holds an address with no person record behind it, such as the church's own, the compose form says it is not included.
:::

### Permissions

The paper-plane buttons and the **Compose Message** button (and with it **Send Email**) appear only for users who have the **Email** permission, and only when an administrator has enabled email sending. Everyone else still sees email addresses as ordinary links that open their own mail program.

Without the Email permission, the list buttons (**Email All** on the People dashboard, and **Email** on groups, classes, and the cart) and the **Communication** menu are hidden too. With the permission but without email sending, the list buttons still open the composer, offering **Copy Addresses** and **Open in Email Client** only.

---

## The Email page

**Communication → Email** (`/people/email`) is for users with the **Email** permission. It holds **Email Tools** and, below them, the [email history](#email-history).

**Email Tools**:

- **Duplicates** — personal email addresses that more than one person uses, with the people and families who share each one (`/people/email/duplicate`, for users with **Edit Records**). When two people who may sign in to the Member Portal share an address, neither can use it to sign in, so work through this list before you turn on [member sign-in](/administration/member-sign-in). **Email needs attention** on the People Dashboard can fix shared addresses within a family for you; see [People](/user-guide/persons#email-needs-attention).
- **People Without Emails** — people with no personal or work email (`/people/email/missing`)

### Email Settings

Administrators set up sending under **Communication → Admin → Email Settings** (`/admin/email`): **Enable Email**, the **SMTP Server** fields (**SMTP Host**, **SMTP Timeout**, **Encryption**, **Auto TLS**) and **SMTP Authentication** (**SMTP Username**, **SMTP Password**). Until email is enabled, the page says **Email is Disabled**. The status reads **SMTP Configured** or **SMTP Not Configured**. Password resets, Member Portal sign-in emails and other system messages use the same setup. See [Email Setup](/administration/email-setup).

---

## Email history

ChurchCRM keeps a record of every email it sends, including messages written in the composer, birthday greetings, family verification links, account emails (new account, password reset, lock and unlock, deletion), Member Portal sign-in emails (the sign-in code and link, and notices about a changed email or a new passkey), notifications, volunteer emails, and the SMTP test. For a sign-in email it keeps the subject, date and status, never the code or link. Each person's history is shown on their Person View; see [Email History](/user-guide/persons#email-history). A message sent with **Email \<name\> Family** is recorded against the family, so it shows in the history tables below and not on a person's card.

### Searchable Email History

ChurchCRM shows the **Email History** table in two places:

- **Email Log** (`/admin/email/log`) is for administrators. It shows everyone's recorded email and includes **Delete Queue** for unsent items.
- **Email** (`/people/email`) is available to users with the **Email** permission. A user who is not an administrator sees only email they sent, with **Only the email you sent is shown.** The sender filter is hidden for them. After sending with the composer, **Follow it in the email history** opens this page.

Use the search box to find email by subject, recipient email address, or recipient name. You can filter the table by **status** (queued, sending, sent, failed, skipped), **type**, and (for administrators) **sender**, including automatic mail. Paging and filtering take place on the server. The search and filter settings remain in the URL, so a bookmark or refresh keeps the same view.

The **To** column links to the recipient's Person View or Family View, with their email address below the name. **N failed** and **N queued** badges open Email History already filtered to that status. For an administrator, a failed email displays the mail server's error directly beneath the subject; a non-admin sender sees the failure status but not the server error.

### Troubleshooting an email that was not received

- **Sent** means ChurchCRM handed the message to the configured mail server, not that it was delivered. Ask the recipient to check spam.
- **Failed** means the mail server rejected the attempt. Administrators can read the error beneath the subject and check the [email settings](/administration/email-setup).
- **Skipped** means sending was disabled or no mail server was configured at the time. Correct the [email settings](/administration/email-setup) before sending again.
- **Queued** or **Sending** means delivery is not yet complete. Check the Email History again after the queue has been processed.
- If no row matches, clear the filters and search, and check the relevant person or family history. A person excluded by the composer (for example, no usable address, Do Not Email, or a duplicate address) appears in the composer's **Not sent** list and has no sent-mail history entry.

Select a subject to open the recorded message. Composer and volunteer emails can be reopened with their saved content; other system emails retain only metadata and display a notice rather than their body (see [Opening an email](/user-guide/persons#opening-an-email)).

---

## Mailchimp

Mailchimp is a plugin, not a system-settings key. There is no **sMailChimpApiKey** field under System Settings.

1. Create a [Mailchimp account](https://mailchimp.com) and an [API key](https://mailchimp.com/help/about-api-keys/).
2. In ChurchCRM, go to **Admin → Plugins** and open the **mailchimp** plugin.
3. Save the API key in that plugin's settings.

**Email Settings** shows **Mailchimp Connected** or **Mailchimp Not Configured**, with **Plugin Settings** when you need to finish the connection.

---

## Best Practices

- Always get consent before adding someone to an email list.
- Use the Mailchimp plugin for newsletters and large announcements.
- Use the in-app composer for ad-hoc messages to a person, a family, a group, or the cart.
- Keep your [Classifications](./classifications.md) updated to target the right audiences.
