---
title: Your First Week with ChurchCRM
sidebar_position: 3
---

# Your First Week with ChurchCRM

This guide walks you through a typical first week as you get your church set up in ChurchCRM. Follow along day by day, or adapt the pace to your needs.

---

## Day 1: Initial Setup and First Families

### Configure Church Details

1. Log in as **admin** (change the default password immediately).
2. Go to **Admin** → **Edit General Settings**.
3. Under **Church Information**, enter your church name, address, phone, and email.
4. Under **Report Settings**, fill in the same details — these appear on financial statements and letters.
5. Under **Member Setup**, set your default city, state, and country for new records.

### Add Your First Families

Start with a few families to learn the workflow:

1. Go to **People** → **Add New Family**.
2. Enter the family name and address.
3. Add family members (up to 10) in the form — use the first name field for each; last name only if different from the family.
4. Click **Save**.

Repeat for 3–5 families. See [Families](/user-guide/families) for more detail.

---

## Day 2: Classifications and More People

### Set Up Classifications

Classifications define roles (Member, Guest, Regular Attender, etc.):

1. Go to **People** → **Classifications**.
2. Review the default classifications and add or rename as needed for your church.
3. Assign classifications to the people you added yesterday.

### Add More People

1. Use **People** → **Add New Person** for individuals (e.g., single adults).
2. Or add more family members by editing existing families.
3. Assign each person a [Classification](/user-guide/classifications).

See [Persons](/user-guide/persons) for step-by-step instructions.

---

## Day 3: Groups and Structure

### Create Groups

Groups help you organize people — Bible studies, ministry teams, committees:

1. Go to **Groups** → **Add New Group**.
2. Enter a name (e.g., "Sunday School – 3rd Grade").
3. Choose a group type (e.g., Sunday School, Small Group).
4. Add roles if needed (Leader, Member, etc.).
5. Click **Save**.

### Add Members to Groups

1. Use [Search](/user-guide/search) or **View All Persons** to find people.
2. Add them to your [Cart](/user-guide/cart).
3. Go to **Cart** → **Empty Cart to Group**.
4. Select the group and click **Add to Group**.

See [Groups](/user-guide/groups) for full details.

---

## Day 4: Events and Attendance

### Create an Event Type

1. Go to **Events** → **List Event Types**.
2. Click **Add Event Type**.
3. Set name, recurrence (weekly, monthly, etc.), and default start time.
4. Add attendance count fields (e.g., Members, Visitors, Children).
5. Save.

### Create an Event and Record Attendance

1. Go to **Events** → **Add Church Event**.
2. Choose the event type, set date/time, and save.
3. To take attendance: add people to the Cart, then **Empty Cart to Event**.
4. Select the event and add them.

See [Events](/user-guide/events) for step-by-step attendance workflows.

---

## Day 5: Finances

### Set Up Funds

1. Go to **Fundraiser** → **Edit Fundraiser** (or via Admin).
2. Add donation funds (e.g., General Fund, Building Fund, Missions).

### Enter Pledges and Donations

1. Open a [Family](/user-guide/families) record.
2. Click **Add a new pledge** — enter amount and fiscal year.
3. Click **Add a new payment** — enter date, amount, fund, and method.
4. Create a **Deposit Slip** to batch donations for the bank.

See [Finances](/user-guide/finances) for pledges, payments, deposits, and tax statements.

---

## Day 6: Email and Reports

### Configure Email (Admin)

1. Go to **Admin** → **Edit General Settings** → **Email Settings**.
2. Enter SMTP host, username, and password.
3. Test by sending a test email.

### Send Your First Group Email

1. Add recipients to the Cart.
2. Go to **Cart** → **List Cart Items**.
3. Click **Email Cart** to open your email client with recipients in BCC.

See [Email](/user-guide/email) for more options, including Mailchimp.

### Run Reports

1. Go to **Data/Reports** → **Reports Menu**.
2. Try **Family Directory**, **Attendance Reports**, or **Pledge Summary**.

---

## Day 7: Review and Plan

### Back Up Your Data

1. Go to **Admin** → **Backup Database**.
2. Download the backup and store it safely.

See [Backup & Restore](/administration/backup-restore).

### Plan Your Next Steps

- **Custom Fields** — Add fields for confirmation date, t-shirt size, etc. ([Custom Fields](/user-guide/custom-fields))
- **Data Import** — Import existing members from a CSV ([Data Import](/user-guide/data-import))
- **Kiosk Devices** — Set up self-service check-in for events ([Kiosk Devices](/user-guide/kiosk-devices))
- **Users** — Create accounts for staff with appropriate [permissions](/administration/users)

---

## Quick Reference

| Task | Location |
|------|----------|
| Add family | People → Add New Family |
| Add person | People → Add New Person |
| Create group | Groups → Add New Group |
| Add to group | Cart → Empty Cart to Group |
| Create event | Events → Add Church Event |
| Record attendance | Cart → Empty Cart to Event |
| Enter donation | Family View → Add a new payment |
| Search | Press `?` or use search box |
| Backup | Admin → Backup Database |

---

## Need Help?

- [FAQs](/administration/faqs)
- [Troubleshooting](/administration/troubleshooting)
- [GitHub Discussions](https://github.com/ChurchCRM/CRM/discussions)
