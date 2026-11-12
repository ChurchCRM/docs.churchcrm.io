---
title: People
sidebar_position: 2
---

# People

A Person record represents an individual in your congregation. Person records can be grouped into [Families](/user-guide/families), belong to [Groups](/user-guide/groups), have [Properties](/user-guide/properties) assigned, and can be made [Users](/administration/users) of the application.

> **Tip:** Every person should belong to a family, even if they are a "family of one."

---

## Step-by-step: Adding a Person

1. Go to **People** → **Add New Person**.
2. Enter a **Last Name**. That is the only required field. First name can be left blank.
3. Choose a **Family** if this person belongs to one. Family is optional. You can also create a new family from the same form.
4. Enter **Classification** (Member, Guest, and so on) if you use classifications.
5. For a child, choose a **Grade** if you track [school grades](/user-guide/school-grades).
6. Add address and phone, or leave them blank to inherit them from the family. Enter the person's own **Email**: email is never inherited from the family. Use plain ASCII characters before the `@`; an accented spelling such as `josé@example.org` is refused. See [Which email addresses are accepted](../administration/member-sign-in.md#which-email-addresses-are-accepted).
7. Enter a birth date only when you have the month and the day. A birth year by itself is rejected with **Invalid Birth Date: Missing birth month and day.** Age is calculated from a complete birth date.
8. Click **Save** or **Save and Add** to add another person.

> **Tip:** To add several people at once, use the [Family Editor](/user-guide/families). A new family starts with four member rows. **Add Another Family Member** appends another row. There is no limit of 10.

---

## Membership Date: what it means

**Membership Date** records the date your church considers a person to have joined. It is optional: leaving it blank does not stop you from saving a person. Your church decides which date to record according to its own membership records and rules.

To set or correct it, open a person's record, choose **Edit**, then find **Membership Date** in the **Church Membership** card. Save the person. When a date is present, the Person View displays **Since** followed by that date. Clearing the field and saving removes the stored date.

### What the date does—and does not do

- **Membership Date and Classification are separate fields.** Selecting a [person classification](/user-guide/classifications) such as Member does not fill in a Membership Date, and entering a date does not change the classification. A person can have either field without the other.
- **Membership Anniversaries**, under [Reports → People Reports](/user-guide/reports-and-queries#people-report-details), uses the date's month. It can also be filtered by classification; the report is not restricted to people classified as Members.
- Administrators can [import](/user-guide/data-import) the `MembershipDate` CSV column and can [export](/user-guide/export) person records, optionally including Membership Date and filtering by a date range.
- The date **does not grant application permissions** or make someone eligible to vote. Membership of a group named *Board* or *Voting Members* also does not automatically grant voting rights or [software user access](/administration/users). The church determines membership and voting eligibility under its own bylaws. ChurchCRM does not record who is eligible to vote.

:::caution Who can change the date?
Anyone with **Edit Records** can open the Person Editor. The Membership Date field has no additional field-level permission check there. It must not be treated as protected proof of voting eligibility or as an authorization control.
:::

---

## How do I find a specific person?

Use the search field in the page header. Its placeholder is **Search people, families, groups…**. Results appear as you type. People matches look at first name, middle name, last name, email, work email, and home, cell, and work phone, and only living people are included.

Clicking a person's name opens their Person View, which lists the information on that person, including properties, groups, and notes.

This is a wildcard search. Searching for "ian" can return "Ian" or "Brian" when those letters appear in a name, email, or phone that is searched. See [Find people and families](/user-guide/search) for the other result types.

## Active and inactive people

Person records can be made inactive without deleting their history. Use **Set Inactive** on the Person View when someone should no longer appear as an active person. Use **Set Active** to reactivate the record later.

The Person Listing shows active people by default, with options to view inactive people or all people. Making a person inactive does **not** delete the person, their family relationship, giving history, notes, groups, or other records. An inactive person cannot sign in, to the [Member Portal](/user-guide/member-portal) or with a staff account, until they are set active again.

You cannot deactivate the person record associated with your own signed-in account.

## Pending self-registrations

A person who signed up on the public registration form, and has not been approved yet, shows a **Pending review** badge on the person list and the Person View. The same badge appears on the family. Those people are omitted from the printed directory until someone with **Edit Records** approves them on [Self Registrations](/user-guide/self-registrations).

## Marking a person as deceased

Deceased is not a classification and not a choice in a list named Deceased.

1. Open the person and choose **Edit**.
2. In **Church Membership**, check **This person is deceased**.
3. Enter the date of death when you know it. The date field can be left blank. If you save with the box checked and no date, ChurchCRM stores today's date.
4. Save the person.

Clear the checkbox to undo the mark.

The person record, pledges, payments, notes, and history stay in place. Header search only returns living people. Voting-member reporting excludes deceased people.

Administrators hide deceased people from the printed directory and from CSV exports with **People → Admin → People Settings → People → Hide Deceased from Directory**. The setting text is **Hide deceased members from the printed directory and CSV exports.**

## Timeline

The Person View timeline shows notes, attendance, emails, and system activity, newest first and grouped by year. Filter chips are **Notes**, **Events**, **Emails**, and **System**. Each chip shows how many entries it holds, and several can be on at once. **Notes** is on when the page opens. **Show all** turns every chip back on. There is no date-range filter and no **Type** list of "Notes only" or "Attendance only."

Long notes show a short preview. **Read more** opens the full note.

![Timeline filter chips: Notes, Events, Emails, System](/img/user-guide/email-history-timeline-filter.png)

The **Emails** chip, which appears once ChurchCRM has emailed the person, shows those emails in the timeline alongside notes and attendance. See [Email History](#email-history) below.

---

## Email History

ChurchCRM keeps a record of every email it sends. A person's history holds the emails addressed to them: messages written in the [email composer](/user-guide/email), birthday greetings, family verification links, account emails (new account, password reset, lock and unlock, deletion), Member Portal sign-in emails, notifications, and volunteer emails from Volunteer Management v2. Anyone who can open the person can see it.

### Recent Emails card

The **Recent Emails** card on the Person View lists the five latest emails to that person, newest first:

| Column | What it shows |
|--------|---------------|
| **Date** | When the email was sent |
| **Type** | What kind of email it was: Message (written in the composer), Birthday greeting, Family verification, Password reset link, New account, Notification, and so on. Volunteer emails show Volunteer assignment, Volunteer reminder, Volunteer declined, Volunteers needed, Volunteer sign-up, Substitute proposed, Substitute decision, or Offer to help. Member Portal sign-in emails show Member Portal sign-in code, Email address changed, Confirm email address, or Passkey added. An email of a kind ChurchCRM does not know shows Email |
| **Subject** | The subject line; click it to open the email |
| **Status** | **Sent**, **Failed** (the mail server refused it; hover over the badge for the error), or **Skipped** (email sending was turned off, or no mail server was set up, at the time) |
| **Sent by** | The user who wrote it, or **Automatic** for emails ChurchCRM sent on its own |

![Recent Emails card on the Person View](/img/user-guide/email-history-recent-emails-card.png)

The badge next to the title is the total number of emails on record for this person. If nothing has been sent yet, the card says so.

### Opening an email

Click a subject to see the email as it was sent, with the recipient address, date, type, status, and sender above it.

![An email opened from the history, shown as it was sent](/img/user-guide/email-history-modal.png)

ChurchCRM keeps the full content of messages written in the composer and of volunteer emails. For every other email, sign-in codes and links included, it stores the subject, date, and status only. Opening one shows a note instead of the message: **The content of this email is not stored. ChurchCRM keeps the text of messages written in the email composer and of volunteer emails only.**

![An account email in the history: the content is not stored](/img/user-guide/email-history-modal-not-stored.png)

### Show all

Click **Show all** at the bottom of the card to open the person's complete email history, newest first, 25 per page. **Back to Person** returns to the Person View.

![The full Email History page for a person](/img/user-guide/email-history-show-all.png)

:::note
Email history is kept indefinitely; nothing is deleted automatically. Families have no card of their own: history is recorded per person, so open the family member you are interested in. An email sent to a whole family (**Email \<name\> Family** on the Family View) goes to the head of household's own address, or the spouse's, and is recorded against the family, not a person, so it appears on nobody's card. Administrators find it, with everyone else's email, in the **Email Log**; see [Email history](/user-guide/email#email-history).
:::

---

## Portal sign-in

Staff with **Edit Records** see a **Portal sign-in** card in the left column of the Person View. It says **May sign in** when this person can sign in to the [Member Portal](/user-guide/member-portal), or **Cannot sign in** with the reason in plain words (for example *"Their classification may not sign in"*). It also shows their **Last sign-in** and how many remembered devices and passkeys they have. While member sign-in is off, the card says so.

![The Portal sign-in card on the Person View, as an administrator sees it](https://cdn.churchcrm.io/screenshots/en/desktop/person-portal-sign-in-card.png)

- **Unconfirmed email** is an address that can't be used to sign in yet: one the upgrade moved from the family email of a family with several members, or a new address saved after the person had signed in. Check with the person, in person or by phone, that the address is theirs, then click **Confirm Email Address**. Staff with **Edit Records** can confirm an address moved from the family email; any other needs an administrator, and so does anyone with a staff account or a portal permission given to them. When you can't confirm it, the card says why. See [The sign-in email](/administration/member-sign-in#the-sign-in-email).
- **Administrators** also see:
  - each remembered device and passkey, with a button to sign the device out or remove the passkey;
  - **View Permissions**, the person's portal permissions grouped by where they come from (for example **Given to Everyone**), with a button to remove one that was given;
  - **Give a permission**, which opens **Give a portal permission**: choose the **Permission**, what it is for when it needs one (a family or a team, for example), a **Last day** and a **Reason**. Only administrators see the reason. See [Portal permissions](/administration/portal-permissions#give-a-permission-to-one-person).
  - **Disable sign-in**: with a **Reason**, the person can no longer sign in anywhere, to the Member Portal or as staff. Every session ends, and their remembered devices and passkeys are removed. **Enable sign-in** lets them sign in again. You can't disable your own sign-in.
  - **Sign out everywhere**: ends every session and signs out every remembered device. Passkeys stay.

See [Who may sign in](/administration/member-sign-in#who-may-sign-in) for the rules.

### Changing a person's email

A person's own email is how they sign in to the Member Portal, so the Person Editor guards it:

- For a person who has signed in to the portal, the editor warns: *"This person has signed in to the Member Portal. Changing this email signs them out everywhere, and the new address cannot be used to sign in until it is confirmed."* After you save, the address they signed in with gets a notice with a link that confirms the new one.
- Only an administrator can change the email of a person who has a staff account or a portal permission given to them. Other staff see the field read-only, with *"Only an administrator can change the email of a person who has a staff account or portal permissions."*

### Login as Person

When an administrator has turned on **Allow Login as Person** (**People → Admin → Member Portal**, **Sign-in** tab), administrators find **Login as** and the person's first name (for example **Login as Pat**) in the person's **Actions** menu. After you confirm, the Member Portal opens as this person sees it. A banner on every portal page says whose portal you are in and whether changes are allowed: it is read-only unless **Allow changes during Login as Person** is also on. Staff pages stay closed until you click **Stop** in the banner, which brings you back to the person's page.

![An administrator in a member's portal with Login as Person: the banner with Stop](https://cdn.churchcrm.io/screenshots/en/desktop/portal-login-as-person.png)

The item is grayed out, with the reason when you point at it, while member sign-in is off and for a person who is deceased, has Disable sign-in on, or has a staff account. It still works for someone who can't sign in themselves, for example an inactive person or someone with no email, so you can see what they would see.

The **Login as Person history** card at the bottom of the left column lists each session: who used it, when it started and ended, and every change made during it. The administrator's own user page lists the sessions they ran. See [Login as Person](/administration/member-sign-in#login-as-person).

---

## Attendance

Open the person and click the **Attendance** tab. It loads the first time you open it.

Three cards sit at the top:

| Card | What it shows |
|------|----------------|
| **Total Events** | Events this person has checked in to |
| **Last Attendance** | Date of the most recent check-in, or **Never** |
| **Best Streak** | Longest run for one event type (the type name is the tooltip). The count is shown as a number of events. |

The table columns are **Event**, **Type**, **Date**, **Check-in**, and **Check-out**.

Filters above the table are **Event Type**, **From**, and **To**. **Clear** resets them. There is no **Apply Filter** button.

---

## Volunteer tab

With [Volunteer Management (v2)](./ministries/index.md) switched on, the Person View has a **Volunteer** tab in two columns: **Qualified for** (each position, with a link to its ministry) and **Serving next** (each upcoming date with an **Accepted** or **Awaiting reply** badge, linking to the occurrence's staffing view). A person with no qualification and no upcoming date shows *"Not volunteering yet"*. The tab is read-only; qualifications are ticked on the ministry's [Volunteers tab](./ministries/volunteers-and-qualifications.md) and assignments are made on the [staffing view](./ministries/staffing-an-occurrence.md).

![The Volunteer tab on a person record](/img/user-guide/ministries/person-volunteer-tab.png)

When the volunteer experience is **Both**, the legacy opportunities list appears on its own tab, **Volunteer (Legacy)**, just before the **Volunteer** tab, so it is always obvious which one you are looking at.

---

## Photo Management

When a person record is deleted, any associated profile photo is automatically cleaned up from the server.

Upload a photo from the person view, not the Person Editor. Click the photo (the tooltip is **Click to upload photo**) and choose the file. You need permission to edit records.

## Photo Directory

**People** → **Photo Directory** shows a grid of active people so you can match a face to a name. People in inactive classifications are not listed.

Each card shows the photo, or initials when there is no photo, plus the classification. **Not Classified** means no classification is set. Click the photo or the name to open the person record.

The three buttons under the name are:

- **Call** — dials the cell number, or the home number if there is no cell number. It is disabled with **No phone number on file** when neither is set.
- **Send text message** — opens a text to the cell number. It is disabled with **No cell phone on file** when there is no cell number.
- **Email** — opens a mail message to the address on the person. It is disabled with **No email address on file** when there is no address.

Filter the grid with **All Classifications**, a single classification, or **Unassigned**. Turn on **Photos only** to hide people who have no photo. Choose how many cards appear with the **page** list, or **All**. **Reset** clears the filters. If nothing matches, the page says **No people found** and offers **Reset Filters**.

### Upload size and resizing

- Pick any JPEG or PNG up to 50 MB, including a full-size phone photo. Your browser shrinks it to the stored size (600x600) and never enlarges it.
- The webcam option is available for person and family photos.
- HEIC/HEIF photos from an iPhone are converted to JPEG in your browser when you pick them. If the conversion fails, export the photo as JPEG and try again.
- API callers that skip the browser are limited to 16 megapixels of source image.

---

## Why is some information on the Person View shown in red text?

Red text indicates information inherited from the associated Family record. People assigned to the same family share common information — such as address and phone number. This information only needs to be entered once on the Family record; all members of that family will inherit it unless the individual Person record has its own value.

Email is not shared this way. Families have no email address of their own, and each person keeps their own: a person without one has no email. See [Families](/user-guide/families#email).

For example, the Smith family has four members: John, Mary, Billy, and Sally. None of the four Person records have an address, but the Smith Family record does. When Sally's Person View is displayed, the system shows the family address in red to indicate it is inherited. If Sally moves to a college dorm and her dorm address is added to her Person record, that address will appear in black, indicating it is specific to her.

This makes it easy to update shared information in one place. For a family of ten, you only need to change the address once on the Family record instead of updating ten separate Person records.

## How do I add a new person?

There are two ways to add a new person:

Go to **People** → **Add New Person**, complete the form, then click **Save** or **Save and Add**. **Save and Add** saves the record and opens a blank form for the next person.

To add a new family and several people at the same time, use the Family Editor instead.

## What is a Classification?

A classification defines a person's role within the church. Common [Classifications](/user-guide/classifications) include Member, Guest, Regular Attender, and Non-Attender.

## How do I enter a person's age?

You don't enter an age. ChurchCRM calculates it from the birth date. A year by itself is not enough: saving a birth year without a month and a day shows **Invalid Birth Date: Missing birth month and day.** Enter the month and the day as well. If only the month or only the day is filled in, the message is **Invalid Birth Date: Missing birth month or day.**

## People Dashboard

**People → Dashboard** opens the People Dashboard.

Count cards link to families, people, Sunday School (when that menu is on), and groups. **People by Classification** lists each classification with its share and count. The same page also shows **Family Roles**, **Gender Demographics**, **Age Distribution**, and report links for **People Directory** and **Letters & Mailing Labels**.

**Quick Actions** has **Verify People** for users with **Edit Records**, and **Email All** for users with the **Email** permission. Once your church has chosen who may sign in to the Member Portal, users with **Edit Records** also see **Email needs attention**.

### Verify People

**Verify People** (users with **Edit Records**) is the printed verification report and the email that asks a family to check what the church has on file.

The email's **Review Family Information** button signs the family in to the Member Portal and opens the **My Family** page, where they review their details, confirm that everything is correct, or update them. There is no separate verification page and no PDF attached to the email. Only living, active, approved members of an approved, active family receive it.

On the family page, the **Verification** card shows when the family was last verified — by the family in the portal or in person by staff — when it was last invited, and its last portal sign-in. A family that self-registered and is waiting for review can be approved from the banner on its family page; approval sends it the portal invitation.

That email is not a printed confirmation report. Confirmation letters, the confirmation data sheet, and **Confirm data labels** still use the wording your church set for those reports. See [Which address is printed](./reports-and-queries.md#which-address-is-printed).

Administrators find **People Settings** under **People → Admin → People Settings**, including:

- **Self-Registration** — *Allow visitors to create their own family record via the self-registration page*
- **Hide Deceased from Directory** — *Hide deceased members from the printed directory and CSV exports.*

### Email needs attention

**Email needs attention** (`/people/sign-in-email`) lists the people the [sign-in rules](/administration/member-sign-in) let in whose email stops them: they have none, they share it with someone else who may sign in, or it is not confirmed yet. Each row says what to do and links to the person.

- **Fix shared emails** shows, for each address shared within one family, who **Keeps it** (the head of household, else the spouse) and who **Loses it**. Tick the rows to apply. Addresses shared across families, or by nobody who is a head of household or spouse, are listed to fix by hand.
- **Confirm selected** confirms the unconfirmed addresses you ticked. Only confirm an address you know belongs to that person.

Rows that involve someone with a staff account or a portal permission given to them need an administrator.

## How do I delete a person?

Leaving inactive records in the database is often preferable for historical record-keeping, but if deletion is necessary:

1. Find the person and open their Person View.
2. Open **Actions** and choose **Delete Person**.
   > If it is not there, you do not have permission to delete records.
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
