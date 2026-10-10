---
title: Families
sidebar_position: 3
---

# Families

A Family is a group of Person records. Person records are grouped into Families for three reasons:

* To represent the social constructs of the Family within the church
* To share information common to all members of the family — address, phone, email, etc.
* To support the church financially as a single unit ("pledge unit")

Every Person should belong to a family.

![Family overview in ChurchCRM](https://churchcrm.io/images/screenshots/desktop/people-family-overview.png)

---

## Step-by-step: Adding a Family

1. Go to **People** → **Add New Family**.
2. Enter the **Family Name**.
3. Enter the shared **Address**, **City**, **State**, **ZIP**, **Country**.
4. Enter **Home Phone** and **Family Email**.
5. The form starts with four family-member rows. **Add Another Family Member** appends another row. There is no limit of 10. Enter a first name for each person you are adding; enter a last name only when it differs from the family name.
6. Set **Classification** for each person (Member, Guest, etc.).
7. Click **Save**.

> **Tip:** Family members share address, phone, and email. Enter them once on the family record — individual persons inherit them unless you override on the person record.

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

The **Filters** card has **City**, **State**, **Status** (**All**, **Active**, or **Inactive**), and **Address Status**. Open a family name to see that family. This list is separate from the family editor.

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

---

## How do I change the available Family Roles?

* If you have permission, you should find a link called _"Family Roles Manager"_ (under _"People"_).
* If you want to add a new Family Role, type it into the blank field on the bottom of the page
* If you want to change a new Family Role, type it into the field you wish to change.

> **Note:** Field changes will be lost if you do not _"Save Changes"_ before using an up, down, delete, or _"add new"_ button!

* If you want to re-arrange the order, click the "up" and "down" links to the left of the field you wish to re-order.
* If you want to delete a Family Role, click on the "delete" button to the right of the field you wish to delete.

## How do I delete a Family?

1. Filter for the desired family, and bring up the Family View.
2. Select _"Delete this Record"_

> If this link doesn't appear, then either you don't have permissions to delete records, or the Family still has Person records assigned to it. You cannot delete a Family record until all Person records have been unassigned from it.

3. Confirm the deletion

## How do I deactivate a Family?

1. Search/Filter for the desired family, and bring up the Family View.
2. Select _"Deactivate this family"_

> If this link doesn't appear, then either you don't have permissions to Edit records, or the Family is already deactivated.

3. Confirm the deactivation
4. Once the page refreshes, You will see a banner on top with message "This family is deactivated."

## How do I Activate a Deactivated Family?

1. Search for the desired family, and bring up the Family View.
2. If the family is deactivated, you will see a banner on top with message "This family is deactivated."
3. Select _"Activate this family"_

> If this link doesn't appear, then either you don't have permissions to Edit records, or the Family is already Active.

4. Confirm the Activation
5. Once the page refreshes, the banner on top with message "This family is deactivated" will disappear and the family is active now.

## How do I assign a Property to a Family?

See the [Properties](/user-guide/properties) help topic.

## How do I add a Note to a Family?

See the [Notes](/user-guide/notes) help topic.

## What is the Classification feature?

See the [Classification](/user-guide/classifications) help topic.
