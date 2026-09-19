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

---

## Step-by-step: Adding a Family

1. Go to **People** → **Add New Family**.
2. Enter the **Family Name**.
3. Enter the shared **Address**, **City**, **State**, **ZIP**, **Country**. If the family's mail goes somewhere else (a PO Box, for example), expand **Second Address** and see [Second Address and Mailing Address](#second-address-and-mailing-address).
4. Enter **Home Phone** and **Family Email**.
5. Add family members (up to 10): enter first name for each; last name only if different from family.
6. Set **Classification** for each person (Member, Guest, etc.).
7. Click **Save**.

> **Tip:** Family members share address, phone, and email. Enter them once on the family record — individual persons inherit them unless you override on the person record.

---

## How do I add a new Family?

1. Go to **People** → **Add New Family**.
2. Complete the form. Note that you can insert up to ten family members from directly from this form.
3. Complete the individual lines for each person, but only enter the last name if it differs from the last name of the Family record. All people entered in this manner will create a new Person record which will be assigned to the designated Family record.
4. Press _Save_ when the form is complete.

## How do I view a family?

There are two ways to view a family:

1. Enter a name to look for in the search field at the top of the page, click the button beside _"Family"_ and press enter.
2. Click on _"View All Families"_ (under _"People"_).

## Second Address and Mailing Address

Every family has one **primary address**: the physical location used for the map on the family page, **Get Directions**, geocoding and **Find Neighbors**. Unless you say otherwise, it is also where the family's mail goes, so nothing changes for the families that only have one address.

A family can also record an optional **second address** with the same fields (Address 1, Address 2, City, State, Zip, Country) and one checkbox, **This is the mailing address**:

| Second address | Checkbox | What it means |
|----------------|----------|---------------|
| Not entered | — | Mail goes to the primary address. This is the case for most families. |
| Entered | Ticked | Mail goes to the second address, for example a PO Box, a care-of address or a winter address. The primary address stays the physical location used for maps and directions. |
| Entered | Not ticked | A **second home**. It is shown on the family record and included in exports for information only; mail still goes to the primary address. |

### Entering a second address

1. Open the family and click **Edit Family**.
2. Below the address fields, click **Second Address (optional)** to expand the section. It is collapsed on families that have no second address.
3. Enter the address.
4. Tick **This is the mailing address** if mail should go here. The checkbox is greyed out until you have entered at least an address line or a city, and the record will not save with the box ticked on an empty second address (_"Enter a second address before marking it as the mailing address"_).
5. Click **Save**.

![Family editor: the Second Address section with "This is the mailing address" ticked](/img/user-guide/family-editor-second-address.png)

To remove a second address, clear its fields and save. The mailing checkbox is cleared with it.

### How it shows on the family and person pages

When a second address exists, the family page relabels the address card **Primary Address** and shows a second card beneath it:

- **Mailing Address**, with a _Receives Mail_ badge, when the checkbox is ticked.
- **Second Home** when it is not.

The map, the geocoding badge, **Get Directions** and **Find Neighbors** stay on the primary card. When a family has no second address, the second card is not shown and the first card is simply called **Address**, as before.

![Family view: the Primary Address card and the Mailing Address card](/img/user-guide/family-view-mailing-address.png)

Each person's page shows the address they inherit from their family. When the family has a mailing address that differs from the primary address, it is listed beneath it as **Mailing Address**, so it is clear where that person's mail goes.

### Where the mailing address is used

Anything that is put in the post is addressed to the family's mailing address, which is the flagged second address when there is one and the primary address otherwise:

- **Newsletter labels**, **Confirm data labels** and mailed letters such as confirmation letters, tax statements and reminder letters. See [Which address is printed](./reports-and-queries.md#which-address-is-printed).
- The **Church Directory** report can print the mailing address beneath the primary address; see the same section.
- The [CSV export](./export.md#second-address-columns) can include the second address and the mailing flag, and the [CSV import](./data-import.md#contact-information) can load them.

The [Cart](./cart.md)'s **Generate Labels** is not affected: it prints each person's own address, as it always has. Maps and geocoding always use the primary address.

:::note
A person's own address override (someone who lives somewhere other than the rest of the family) works exactly as before. The second address belongs to the whole family; it is not a per-person setting.
:::

---

## Unified Member & Family Profiles

Person and Family profiles have been consolidated. Notes that previously appeared on both the person and family timeline are deduplicated — each note shows exactly once in the correct context. Property management is faster and more consistent across both record types.

---

## Timeline Filters

Family View includes a **Timeline** tab with type and date filters, making it easy to review family history, pastoral notes, and attendance in one place.

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

See the [Properties](Properties) help topic.

## How do I add a Note to a Family?

See the [Notes](Notes) help topic.

## What is the Classification feature?

See the [Classification](Classifications) help topic.
