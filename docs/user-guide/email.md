---
title: Email
sidebar_position: 18
---

# Email

ChurchCRM provides built-in tools to email individuals, families, groups, and cart selections directly from the app, plus optional Mailchimp integration for newsletters.

## Prerequisites

To send email from ChurchCRM itself, your system administrator must configure an outgoing mail server and turn on email sending in **Admin → System Settings → Email**. See [Email Setup](/administration/email-setup) for the steps. Until then, the composer still helps you reach people through your own mail program (see [Fallbacks](#fallbacks-copy-addresses-and-open-in-email-client)).

You also need the **Email** permission on your user account (an administrator grants it under **Admin → System Users**). Ask an administrator if the paper-plane button described below does not appear for you.

---

## Sending email from ChurchCRM

As of **7.8.0**, ChurchCRM sends email itself when email sending is enabled. You write the message in the composer, click **Send Email**, and every recipient receives their own message from the church's email address. Nothing is handed off to a mail program on your computer.

### Sending to one person or family

A paper-plane button appears next to each email address on:

- the **Person View** (the person's own address),
- the **Family View** (the family address and each family member),
- the **People** list,
- the **Photo Directory**.

![Paper-plane button next to the email address on the Person View](/img/user-guide/email-person-view-send-button.png)

Click it to open the composer with that one recipient. The email address next to the button is still an ordinary link that opens your own mail program, for anyone who prefers that.

### Sending to a list

| Where | How to reach it |
|-------|----------------|
| Everyone | **People** dashboard → **Email All** |
| Group members | Open a group → **Email** |
| Sunday School class | Open a class → **Email** (teachers, students, and parents also have their own buttons) |
| Cart | **Cart** → **Email** |
| Event attendees | Open an event → the button on each row, or **Email All** for the people who have not attended |

The composer opens with the list already loaded. The **recipient count** badge shows how many people will be emailed; expand the list to see who they are, grouped by role.

### Writing the message

1. Click **Compose Message** at the bottom of the composer.
2. Enter a **Subject**.
3. Write the **Message**. The box starts empty so you can write your own greeting. Two lines down, the closing is already filled in for you: "Sincerely," followed by your name and the church name. Edit or delete it as you like.
4. Click **Preview** to see the message exactly as the first recipient will receive it, with the church logo and header. Click **Back to editing** to return.
5. Click **Send Email**.

![The composer with a subject, the message, and the pre-filled closing](/img/user-guide/email-composer-form.png)

![Preview of the message as it will arrive](/img/user-guide/email-composer-preview.png)

Each recipient gets a separate message addressed to them alone, so nobody sees anyone else's address. The message is sent from the church's email address.

:::note What the recipient sees
The email contains your message as you typed it, with the church logo and name above it and the church's contact block below it (name, address, phone, email, and website, exactly as shown in the **Display Preview** on **Admin → Church Information**). ChurchCRM does not add a "Dear …" line or a closing of its own, and there is no "you received this email because…" or unsubscribe text: newsletters go through [Mailchimp](#mailchimp-integration), which adds its own.
:::

### Who was not emailed

After sending, a banner in the composer confirms how many people were emailed. If anyone was left out, the banner lists them under **Not sent** with the reason:

| Reason | Meaning |
|--------|---------|
| no email address | Neither the person nor their family has an email address on record. |
| marked do not email | The person has the "do not email" property. |
| deceased | The person has a date of death recorded. |
| inactive family | The family record is deactivated. |
| same address as another recipient | Two people share one address; the message went to that address once. |
| record not found | The person or family was deleted after the list was loaded. |

![The result banner listing a recipient who was not emailed and why](/img/user-guide/email-send-result-not-sent.png)

A skipped person is not an error: ChurchCRM checked the record and decided not to send. Everyone counted as sent did receive the message. If the mail server refused a message, the banner shows that person's name with the error the server returned; ask your administrator to check the [email settings](/administration/email-setup).

### Fallbacks: Copy Addresses and Open in Email Client

The composer keeps the two older options at the bottom of the window:

- **Copy Addresses** — copies every address to your clipboard so you can paste it into any mail program.
- **Open in Email Client** — opens your default mail program with the recipients filled in. Available for lists of **50 addresses or fewer**; for larger lists use Copy Addresses instead.
- **BCC Mode** — switches those two options between To: and BCC: addressing. It has no effect on **Send Email**, which always sends one message per person.

Use these when email sending is not set up, or when you would rather write the message in your own mail program.

:::tip The church's own address
When you email a list (cart, group, class, everyone), the composer can add the church's default address (*Default "To" email* in **Admin → System Settings → Email**) as a removable recipient, so the office keeps a copy. This applies to **Copy Addresses** and **Open in Email Client** only. **Send Email** mails the people in the list and nobody else.
:::

### Permissions

The paper-plane buttons and the **Send Email** button appear only for users who have the **Email** permission, and only when an administrator has enabled email sending. Everyone else still sees email addresses as ordinary links that open their own mail program.

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
- Use the in-app composer for ad-hoc messages to a person, a family, a group, or the cart.
- Keep your [Classifications](Classifications) updated to target the right audiences.

---

## Migration Note (7.5.1)

The `sMailtoDelimiter` setting (previously in **Admin → System Settings**) has been removed in 7.5.1. It controlled the separator used in the old mailto: links, which are no longer generated. The 7.5.1 database migration removes this setting automatically — no manual action required.
