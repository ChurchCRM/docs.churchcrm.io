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

## Timeline Filters

The **Person View** includes a **Timeline** tab that shows notes, attendance records, and activity in chronological order. Use the filter controls to narrow the timeline by:

- **Type** — Notes only, Attendance only, or All
- **Date range** — Show entries from a specific period

This makes it easier to review pastoral care history or attendance patterns for a specific member without scrolling through unrelated entries.

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
