---
title: Persons
sidebar_position: 2
---

# Persons

A Person record represents an individual in your congregation. Person records can be grouped into [Families](/user-guide/families), belong to [Groups](/user-guide/groups), have [Properties](/user-guide/properties) assigned, and can be made [Users](/administration/users) of the application.

> **Tip:** Every person should belong to a family, even if they are a "family of one."

---

## Step-by-step: Adding a Person

1. Go to **People** → **Add New Person**.
2. Enter **First Name** and **Last Name**.
3. Select or create a **Family** (required).
4. Enter **Classification** (Member, Guest, etc.).
5. Add address, phone, email (or leave blank to inherit from family).
6. Add birth date (year required; age is calculated automatically).
7. Click **Save** or **Save and Add** to add another person.

> **Tip:** To add several people at once, use the [Family Editor](/user-guide/families) — you can add up to 10 family members in one form.

---

## How do I find a specific person?

In the left navigation, find the search box just above **Dashboard**. Enter a search string — results appear as you type, matching first or last name.

Clicking on a person's name opens their Person View, which lists all information about that person, including assigned properties, assigned groups, and notes.

This is a wildcard search: the system looks for that sequence of characters anywhere in the first or last name. For example, searching for "ian" will return records for "Ian," "Brian," and anyone else whose name contains those letters in that order.

## Active and inactive people

Person records can be made inactive without deleting their history. Use **Set Inactive** on the Person View when someone should no longer appear as an active person. Use **Set Active** to reactivate the record later.

The Person Listing shows active people by default, with options to view inactive people or all people. Making a person inactive does **not** delete the person, their family relationship, giving history, notes, groups, or other records.

You cannot deactivate the person record associated with your own signed-in account.

## Marking a person as deceased

ChurchCRM 7.7 adds a first-class deceased status so a person's history can be preserved without treating them as a living member.

1. Open the person and choose **Edit**.
2. In the Church Membership section, select **Deceased**.
3. Enter the date of death when known. The deceased status can also be recorded without a date.
4. Save the person.

The Person View displays a **Deceased** badge. On the Family View, deceased family members are visually distinguished and are not included in the living/active-member count. If the deceased person was the Head of Household, ChurchCRM prompts staff to review family leadership.

The status is reversible: edit the person and clear **Deceased** if it was selected by mistake.

ChurchCRM preserves the person's record, pledges, payments, notes, and history. Deceased people are automatically excluded from workflows intended for living members, including birthday reminders, search autocomplete, kiosk and event rosters, group contact exports, mailing labels, Mailchimp synchronization, and living-member statistics.

Administrators can control whether deceased people appear in printed directories and CSV exports with **Hide deceased members from the printed directory and CSV exports** in the People settings. Voting-member reporting always excludes deceased people.

## Timeline Filters

The **Person View** includes a **Timeline** tab that shows notes, attendance records, and activity in chronological order. Use the filter controls to narrow the timeline by:

- **Type** — Notes, Events, Emails, System, or all of them
- **Date range** — Show entries from a specific period

This makes it easier to review pastoral care history or attendance patterns for a specific member without scrolling through unrelated entries.

![Timeline filter chips: Notes, Events, Emails, System](/img/user-guide/email-history-timeline-filter.png)

The **Emails** chip shows every email ChurchCRM has sent to this person in the timeline, alongside notes and attendance. See [Email History](#email-history) below.

---

## Email History

As of **7.8.0**, ChurchCRM keeps a record of every email it sends to a person: messages written in the [email composer](/user-guide/email), birthday greetings, family verification links, account emails (new account, password reset, lock and unlock, deletion), notifications, and the SMTP test. Anyone who can open the person can see it.

### Recent Emails card

The **Recent Emails** card on the Person View lists the five latest emails to that person, newest first:

| Column | What it shows |
|--------|---------------|
| **Date** | When the email was sent |
| **Type** | What kind of email it was: Message (written in the composer), Birthday greeting, Family verification, Password reset link, New account, Notification, and so on |
| **Subject** | The subject line; click it to open the email |
| **Status** | **Sent**, **Failed** (the mail server refused it; hover over the badge for the error), or **Skipped** (email sending was disabled at the time) |
| **Sent by** | The user who wrote it, or **Automatic** for emails ChurchCRM sent on its own |

![Recent Emails card on the Person View](/img/user-guide/email-history-recent-emails-card.png)

The badge next to the title is the total number of emails on record for this person. If nothing has been sent yet, the card says so.

### Opening an email

Click a subject to see the email as it was sent, with the recipient address, date, type, status, and sender above it.

![An email opened from the history, shown as it was sent](/img/user-guide/email-history-modal.png)

The full content is kept only for messages written in the composer. Account emails contain a password or a one-time link, so ChurchCRM stores their subject and date only; opening one shows **The content of this email is not stored** instead of the message.

![An account email in the history: the content is not stored](/img/user-guide/email-history-modal-not-stored.png)

### Show all

Click **Show all** at the bottom of the card to open the person's complete email history, newest first, 25 per page. **Back to Person** returns to the Person View.

![The full Email History page for a person](/img/user-guide/email-history-show-all.png)

:::note
Email history is kept indefinitely; nothing is deleted automatically. Families have no card of their own: history is recorded per person, so open the family member you are interested in. Administrators can see every email across everyone on the [Email dashboard](/user-guide/email#email-history-and-the-email-dashboard).
:::

---

## Attendance History

The **Attendance History** tab on the Person profile page shows a complete record of every event a person has checked in to.

### How to find it

1. Open a person's profile (search by name or click from a family/group record).
2. Click the **Attendance History** tab.

The tab loads on demand — it fetches data the first time you open it.

### Summary stats

Three stat cards appear at the top of the tab:

| Stat | What it shows |
|------|--------------|
| **Total Events** | All-time count of events the person attended |
| **Attendance Streak** | Current consecutive-week streak (resets if a week is missed) |
| **Last Attendance** | Date of the most recent check-in |

### Attendance table

Below the stats, a table lists all events in reverse chronological order:

| Column | Description |
|--------|-------------|
| **Event Name** | Name of the event |
| **Type** | Event type (e.g. Sunday Service, Group Meeting) |
| **Date** | Event date |
| **Check-in / Check-out** | Times recorded at check-in |

### Filters

Use the filter controls above the table to narrow results:

- **Event Type** — filter to a specific type of event
- **Date Range** — show only events within a date window

Filters apply instantly without reloading the page.

---

## Photo Management

When a person record is deleted, any associated profile photo is automatically cleaned up from the server.

Photo uploads are processed through the **Uppy** uploader — drag-and-drop a file directly onto the photo area on the Person Editor page.

---

## Why is some information on the Person View shown in red text?

Red text indicates information inherited from the associated Family record. People assigned to the same family share common information — such as address, phone number, and email address. This information only needs to be entered once on the Family record; all members of that family will inherit it unless the individual Person record has its own value.

For example, the Smith family has four members: John, Mary, Billy, and Sally. None of the four Person records have an address, but the Smith Family record does. When Sally's Person View is displayed, the system shows the family address in red to indicate it is inherited. If Sally moves to a college dorm and her dorm address is added to her Person record, that address will appear in black, indicating it is specific to her.

This makes it easy to update shared information in one place. For a family of ten, you only need to change the address once on the Family record instead of updating ten separate Person records.

## How do I add a new person?

There are two ways to add a new person:

Go to **People** → **Add New Person**, complete the form, then click **Save** or **Save and Add**. **Save and Add** saves the record and opens a blank form for the next person.

To add a new family and several people at the same time, use the Family Editor instead.

## What is a Classification?

A classification defines a person's role within the church. Common [Classifications](/user-guide/classifications) include Member, Guest, Regular Attender, and Non-Attender.

## How do I enter a person's age?

You don't. ChurchCRM automatically calculates age from the birth date. At minimum, a birth year must be entered. If the exact year is unknown, you can enter an estimate and update it later.

## How do I delete a person?

Leaving inactive records in the database is often preferable for historical record-keeping, but if deletion is necessary:

1. Find the person and open their Person View.
2. Select _"Delete this Record"_.
   > If this link does not appear, you do not have permission to delete records.
3. Confirm the deletion.

## What are Custom Person Fields?

Custom Person Fields let you add information to person records beyond what ChurchCRM tracks by default. Examples include a mentor relationship, a confirmation date, a T-shirt size, or an emergency contact. See [Custom Fields](/user-guide/custom-fields) for instructions.

Common custom fields include:
- **Nickname / Preferred Name** - Track what members like to be called
- **Baptism or Confirmation Date** - Record important spiritual milestones
- **T-Shirt Size** - Useful for event planning
- **Emergency Contact** - Important for youth ministry and events
- **Spiritual Gifts** - Track members' gifts for ministry placement

## How do I use Custom Person Fields?

See the [Custom Fields](/user-guide/custom-fields) help topic for step-by-step instructions on creating and managing custom fields, including a detailed guide for adding a Nickname field.

## How do I put a person in the Cart?

See the [Cart](/user-guide/cart) help topic.

## How do I assign a person to a group?

See the [Groups](/user-guide/groups) help topic.

## How do I assign a property to a person?

See the [Properties](/user-guide/properties) help topic.

## How do I add a note to a person?

See the [Notes](/user-guide/notes) help topic.

## How do I track finances for a person?

See the [Finances](/user-guide/finances) help topic.
