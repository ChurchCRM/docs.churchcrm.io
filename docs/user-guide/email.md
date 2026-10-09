---
title: Email
sidebar_position: 18
---

# Email

ChurchCRM provides built-in tools to email individuals, families, groups, and cart selections directly from the app, plus optional Mailchimp integration for newsletters.

## Prerequisites

To send email from ChurchCRM itself, your system administrator must configure an outgoing mail server and turn on email sending under **Communication → Email → Email Settings**. See [Email Setup](/administration/email-setup) for the steps. Until then, the composer still helps you reach people through your own mail program (see [Fallbacks](#fallbacks-copy-addresses-and-open-in-email-client)).

You also need the **Email** permission on your user account. Administrators always have it. For other users, an administrator edits the user under **Admin → System Users** and, in the **User Config** table, sets **Permission** to **True** on the `bEmailMailto` row. Ask an administrator if the paper-plane button described below does not appear for you.

---

## Sending email from ChurchCRM

ChurchCRM sends email itself when email sending is enabled. You write the message in the composer, click **Send Email**, and ChurchCRM hands the church's mail server a separate message for each recipient, sent from the church's email address. Nothing is handed off to a mail program on your computer.

### Sending to one person or family

A paper-plane button appears next to each email address on:

- the **Person View** (the person's own address, and the address of each other member in the family list),
- the **Family View** (the family address and each family member),
- the **Person Listing** (**People → Person Listing**),
- the **Photo Directory**, where it is the envelope button on each person's card.

![Paper-plane button next to the email address on the Person View](/img/user-guide/email-person-view-send-button.png)

Click it to open the composer with that one recipient. The email address next to the button is still an ordinary link that opens your own mail program, for anyone who prefers that.

On the Person View, the family card (for example **Campbell Family**) also carries the button on every other family member's row, so you can email a relative without opening their record. The person's own row has none, because their address under **Contact & Personal Info** already has one.

![Paper-plane buttons on the family members' rows of the Person View](/img/user-guide/email-person-view-family-send-buttons.png)

### Sending to a list

| Where | How to reach it |
|-------|----------------|
| Everyone | **People** dashboard → **Email All** |
| Group members | Open a group → **Email** |
| Sunday School class | Open a class → **Email** (teachers, students, and parents also have their own buttons) |
| Cart | **Cart** → **Email** |
| People who missed an event | Open an event that has ended → **Did Not Attend** card → **Email All**, or the button next to one person's address (the card appears when groups are linked to the event) |

The composer opens with the list already loaded. The **recipient count** badge shows how many people will be emailed; expand the list to see who they are, grouped by role. When the list has more than one role (for example Member and Guest, or a class's teachers and parents), **Roles to include** shows a checkbox for each; untick a role to leave those people out.

**Send Email** reaches up to 500 people at a time. ChurchCRM refuses a larger send with a message saying so; narrow the list (untick roles, or use a group or the cart), or use [Mailchimp](#mailchimp-integration) for newsletters.

### Writing the message

1. Click **Compose Message** at the bottom of the composer. The form opens, and the button changes to **Cancel**, which closes the form and discards what you typed.
2. Enter a **Subject**.
3. Write the **Message**. The box starts empty so you can write your own greeting. Two lines down, the closing is already filled in for you: "Sincerely," followed by your name and the church name. Edit or delete it as you like.
4. Click **Preview** to see the message exactly as the first recipient will receive it, with the church logo and header. The preview's title names that recipient and how many others will get the message. Click **Back to editing** to return.
5. Click **Send Email**. When the message has gone, the button reads **Sent** and the form is locked, so the same message cannot be sent twice.

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
| marked do not email | The person has the property your administrator chose as **Do Not Email Property** in the email settings. |
| deceased | The person is marked as deceased. |
| inactive family | The family record is deactivated. |
| same address as another recipient | Two people share one address; the message went to that address once. |
| record not found | The person or family was deleted after the list was loaded. |

![The result banner listing a recipient who was not emailed and why](/img/user-guide/email-send-result-not-sent.png)

A skipped person is not an error: ChurchCRM checked the record and decided not to send. A person counted as sent had their message handed to the mail server without an error; ChurchCRM cannot see whether it then reached their mailbox. If nobody could be emailed, the banner is red and says so (for example *No email was sent.*), with the same **Not sent** list, and **Send Email** stays available so you can correct the records and try again. If the mail server refused a message, the banner shows that person's name with the error the server returned; ask your administrator to check the [email settings](/administration/email-setup).

### Fallbacks: Copy Addresses and Open in Email Client

The composer keeps the two older options at the bottom of the window:

- **Copy Addresses** — copies every address to your clipboard so you can paste it into any mail program.
- **Open in Email Client** — opens your default mail program with the recipients filled in. Available for lists of **50 addresses or fewer**; for larger lists use Copy Addresses instead.
- **BCC Mode** — makes **Open in Email Client** put the addresses in BCC: instead of To:. It has no effect on **Copy Addresses** or on **Send Email**, which always sends one message per person.

Use these when email sending is not set up, or when you would rather write the message in your own mail program.

:::tip The church's own address
When you email a list (cart, group, class, everyone) and an administrator has set *Copy Church Email* under **Communication → Email → Email Settings**, the composer shows **Also send to church address (…)**, ticked, so the office keeps a copy. Untick it to leave the office out. This applies to **Copy Addresses** and **Open in Email Client** only. **Send Email** mails the people in the list and nobody else: when the list holds an address with no person record behind it, such as the church's own, the compose form says it is not included.
:::

### Permissions

The paper-plane buttons and the **Compose Message** button (and with it **Send Email**) appear only for users who have the **Email** permission, and only when an administrator has enabled email sending. Everyone else still sees email addresses as ordinary links that open their own mail program.

Without the Email permission, the list buttons (**Email All** on the People dashboard, and **Email** on groups, classes, and the cart) and the **Communication** menu are hidden too. With the permission but without email sending, the list buttons still open the composer, offering **Copy Addresses** and **Open in Email Client** only.

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

## Best Practices

- Always get consent before adding someone to an email list.
- Use Mailchimp for newsletters and large announcements.
- Use the in-app composer for ad-hoc messages to a person, a family, a group, or the cart.
- Keep your [Classifications](./classifications.md) updated to target the right audiences.

---

## Migration Note (7.5.1)

The `sMailtoDelimiter` setting (previously in **Admin → System Settings**) has been removed in 7.5.1. It controlled the separator used in the old mailto: links, which are no longer generated. The 7.5.1 database migration removes this setting automatically — no manual action required.
