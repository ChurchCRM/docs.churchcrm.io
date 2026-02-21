---
title: Email Setup
sidebar_position: 18
---

# Email

ChurchCRM provides multiple ways to communicate with your congregation via email.

## Prerequisites

Before sending emails, ensure your system administrator has configured email settings in **Admin → System Settings → Email Settings**.

---

## Method 1: Using Your Email Client

This method opens emails in your default email program (Outlook, Gmail, etc.):

1. Add the desired [people](Persons) to your [Cart](Cart)
2. Navigate to **Cart → List Cart Items**
3. Scroll to the bottom and click **Email Cart**
4. Your email client will open with all recipients in the BCC field

> **Tip:** This method is best for small groups and personal messages.

---

## Method 2: Mailchimp Integration

[Mailchimp](https://mailchimp.com) is an email marketing service recommended for mass emails. It offers free accounts for up to 500 contacts.

### Setting Up Mailchimp

1. Create a [Mailchimp account](https://mailchimp.com)
2. [Generate an API Key](https://mailchimp.com/help/about-api-keys/) in your Mailchimp account
3. In ChurchCRM, go to **Admin → System Settings → Integration**
4. Enter your API key in the **sMailChimpApiKey** field
5. Save settings

### Subscribing Families to Newsletters

1. Open a [Family](Families) record
2. Look for the **Newsletter** option
3. Enable it for families who want to receive newsletters
4. Use Mailchimp's audience sync to import subscribers

---

## Best Practices

- Always get consent before adding someone to email lists
- Use Mailchimp for newsletters and announcements to large groups
- Use the Cart email feature for personal or small group communications
- Keep your [Classifications](Classifications) updated to target the right audiences
