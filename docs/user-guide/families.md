---
title: Families
sidebar_position: 3
---

# Families

A Family is a group of Person records. Person records are grouped into Families for three reasons:

* To represent the social constructs of the Family within the church
* To share information common to all members of the family — address, home phone, etc.
* To support the church financially as a single unit ("pledge unit")

Every Person should belong to a family.

![Family overview in ChurchCRM](https://cdn.churchcrm.io/screenshots/en/desktop/people-family-overview.png)

---

## Step-by-step: Adding a Family

1. Go to **People** → **Add New Family**.
2. Enter the **Family Name**.
3. Enter the shared **Address**, **City**, **State**, **ZIP**, **Country**. If the family's mail goes somewhere else (a PO Box, for example), expand **Second Address (optional)** and see [Second Address and Mailing Address](#second-address-and-mailing-address).
4. Enter **Home Phone**. There is no family email: after saving, add each person's own email on their person record.
5. The form starts with four family-member rows. **Add Another Family Member** appends another row. There is no limit of 10. Enter a first name for each person you are adding; enter a last name only when it differs from the family name.
6. Set **Classification** for each person (Member, Guest, etc.), and a **Grade** for each child if you track [school grades](/user-guide/school-grades).
7. Click **Save**.

> **Tip:** Family members share address and phone. Enter them once on the family record — individual persons inherit them unless you override on the person record. Email is each person's own and is never inherited.

---

## How do I add a new Family?

1. Go to **People** → **Add New Family**.
2. Complete the form. It starts with four member rows. **Add Another Family Member** appends another row. There is no limit of 10.
3. Complete the individual lines for each person, but only enter the last name if it differs from the last name of the Family record. All people entered in this manner will create a new Person record which will be assigned to the designated Family record.
4. Press _Save_ when the form is complete.

## How do I view a family?

1. Use the header search field (**Search people, families, groups…**) and open the family from the results.
2. Or go to **People → Family Listing**.

## Family Listing

**People → Family Listing** is the list of families. The page title is **Family Listing**.

The **Filters** card has **City**, **State**, **Status** (**All**, **Active**, or **Inactive**), and **Address Status**. Open a family name to see that family. This list is separate from the family editor. The **Email** column shows the address mail for the family goes to: the head of household's own email, or the spouse's.

## Family verification

**Verify People** (under **Quick Actions** on the People dashboard) emails each family a link to review the details you hold for them. It needs the **Edit Records** permission. Printed confirmation reports are separate: they go out on paper, and the family returns them to the office.

### What the family sees

1. The email has a button, **Review Family Information**.
2. The button opens a **Family Verification** page with the family's address, phone numbers and each member's details.
3. If everything is right, the family selects **Confirm Family Info**, leaves **All information is correct** selected, and selects **Submit Verification**.
4. If something is wrong, the family selects **Confirm Family Info**, then **Please update our records with corrections**. They describe the changes in **Additional Information** and select **Submit Verification**.

The family cannot edit the details on the page. A correction is a request to the church office, so someone on your team makes the change in ChurchCRM.

Families see a **Thank You!** message when the request is received.

## Email

Families have no email address of their own. Email belongs to people: each person keeps their own, and that is also how members sign in to the [Member Portal](/user-guide/member-sign-in).

The **Email** card on the family page lists the own email of each head of household and spouse, each with buttons to write from ChurchCRM and to copy the address. When none of them has one, it says *"No head of household or spouse can receive family email."*

![The Email card on a family page: each adult's own email and Email Carter Family](https://cdn.churchcrm.io/screenshots/en/desktop/people-family-email-card.png)

- **Email \<name\> Family** sends one message for the whole family, to the head of household's own email (the oldest, when there are two), or to the spouse's when no head of household has one. Without either, the button is not shown.
- Nobody else in the family gets that message, even with an email of their own. Use the paper-plane button next to a person's email to write to them.
- The family editor, the portal's family form and the printed directory have no family email.
- If your church upgraded from a release that had a family email, the upgrade gave each one to a head of household or spouse who had no email of their own, unless someone already had that address, and left a note on the family when it could not be moved. See [Email belongs to people](/administration/member-sign-in#email-belongs-to-people).

### Who can sign in

While member sign-in is on, staff with **Edit Records** see a line for each member in the **Email** column of the family page: **Can sign in to the Member Portal**, or **Cannot sign in:** and the reason, for example *"No personal email"*. The reason links to that person's [Portal sign-in](/user-guide/persons#portal-sign-in) card.

## Second Address and Mailing Address

Every family has one **primary address**: the physical location used for the map on the family page, **Get Directions**, geocoding and **Find Neighbors**. Unless you say otherwise, it is also where the family's mail goes, so nothing changes for the families that only have one address.

A family can also record an optional **second address** with the same fields (Address 1, Address 2, City, State, Zip, Country) and one checkbox, **This is the mailing address**:

| Second address | Checkbox | What it means |
|----------------|----------|---------------|
| Not entered | — | Mail goes to the primary address. This is the case for most families. |
| Entered | Ticked | Mail goes to the second address, for example a PO Box, a care-of address or a winter address. The primary address stays the physical location used for maps and directions. |
| Entered | Not ticked | A **second home**. It is shown on the family record and included in exports for information only; mail still goes to the primary address. |

### Entering a second address

1. Open the family and click **Edit** in the toolbar above the family members.
2. Below the address fields, click **Second Address (optional)** to expand the section. It is collapsed on families that have no second address.
3. Enter the address. The family has a second address once **Address 1** or **City** is filled in.
4. Tick **This is the mailing address** if mail should go here. The checkbox is greyed out until **Address 1** or **City** has a value, and the record will not save with the box ticked on an empty second address (_"Enter a second address before marking it as the mailing address"_).
5. Click **Save**.

![Family editor: the Second Address section with "This is the mailing address" ticked](https://cdn.churchcrm.io/screenshots/en/desktop/family-mailing-address-editor.png)

To remove a second address, clear its fields and save. The mailing checkbox is cleared with it.

### How it shows on the family and person pages

When a second address exists, the family page relabels the address card **Primary Address** and shows a second card beneath it:

- **Mailing Address**, with a _Receives Mail_ badge, when the checkbox is ticked.
- **Second Home** when it is not.

The map, the geocoding badge, **Get Directions** and **Find Neighbors** stay on the primary card. When a family has no second address, the second card is not shown and the first card is simply called **Address**.

![Family view: the Primary Address card and the Mailing Address card](https://cdn.churchcrm.io/screenshots/en/desktop/family-view-mailing-address.png)

Each person's page shows their address: their own, or the one they inherit from their family. When the family has a mailing address that differs from the primary address, it is listed beneath it as **Mailing Address**, so it is clear where that person's mail goes.

### Where the mailing address is used

The family's mailing address is the flagged second address when there is one, and the primary address otherwise. It is used here:

- **Newsletter labels**, **Confirm data labels** and mailed letters such as confirmation letters, giving statements and reminder letters are addressed to it. See [Which address is printed](./reports-and-queries.md#which-address-is-printed).
- The cart's **Labels** use it for anyone who has no address of their own on their person record. See [Which address is used](./cart.md#which-address-is-used).
- The **People Directory** report can print the mailing address beneath the primary address; see [Which address is printed](./reports-and-queries.md#which-address-is-printed).
- The [CSV export](./export.md#second-address-columns) can include the second address and the mailing flag, and the [CSV import](./data-import.md#second-address-columns) can load them.

Family maps and geocoding always use the family's primary address, never the second address. A person with an address of their own is mapped and geocoded at that address.

:::note
A person's own address (someone who lives somewhere other than the rest of the family) is separate from this. The second address belongs to the whole family; it is not a per-person setting.
:::

---

## Unified Member & Family Profiles

Person and Family profiles have been consolidated. Notes that previously appeared on both the person and family timeline are deduplicated — each note shows exactly once in the correct context. Property management is faster and more consistent across both record types.

---

## Timeline

Family View uses the same timeline chips as a person: **Notes**, **Events**, and **System**, plus **Show all**. There is no date-range filter and no type list.

---

## Pledges & Payments fiscal-year filter

The finance section on a Family profile defaults to the **current fiscal year**. Use the fiscal-year pills to switch to a historical fiscal year for which that family has financial data, or select **All Time** to view the family's complete pledge and payment history.

The selected fiscal year is applied by the server, so the totals and records shown are scoped to that fiscal year rather than simply hiding rows in the browser. Your church's fiscal-year start month is configured under **Admin → System Settings → Finance**.

---

## Photo Cleanup

Profile images are automatically deleted from the server when a family or person record is removed, preventing orphaned files from accumulating.

## Photo Upload

Family photos are uploaded the same way as person photos: JPEG, PNG, or HEIC/HEIF up to 50 MB, resized in your browser to 600x600 and never enlarged. HEIC/HEIF photos are converted to JPEG in your browser. See [Photo Management](persons.md#photo-management).

---

## How do I change the available Family Roles?

* If you have permission, you should find a link called _"Family Roles Manager"_ (under _"People"_).
* If you want to add a new Family Role, type it into the blank field on the bottom of the page
* If you want to change a new Family Role, type it into the field you wish to change.

> **Note:** Field changes will be lost if you do not _"Save Changes"_ before using an up, down, delete, or _"add new"_ button!

* If you want to re-arrange the order, click the "up" and "down" links to the left of the field you wish to re-order.
* If you want to delete a Family Role, click on the "delete" button to the right of the field you wish to delete.

## How do I delete a Family?

1. Open the family.
2. Open **Actions** and choose **Delete Family**. It is there only for users who can delete records.
3. On the confirmation page, choose **Delete Family Record ONLY** or **Delete Family Record AND Family Members**.

A family with donations on record can't be deleted until its donations are moved to another family. Users with finance access can move them from the confirmation page.

## How do I deactivate or reactivate a Family?

1. Open the family.
2. Open **Actions** and choose **Set Inactive** (or **Set Active** for an inactive family). It is there for users with **Edit Records**.
3. Confirm in the dialog. Cancelling or pressing Escape changes nothing.

An inactive family shows *"This Family is Inactive"* at the top of its page. Its members can't sign in to the [Member Portal](/user-guide/member-portal) until the family is active again.

## How do I assign a Property to a Family?

See the [Properties](/user-guide/properties) help topic. Unassigning a Property from a family asks you to confirm first.

## How do I add a Note to a Family?

See the [Notes](/user-guide/notes) help topic.

## What is the Classification feature?

See the [Classification](/user-guide/classifications) help topic.
