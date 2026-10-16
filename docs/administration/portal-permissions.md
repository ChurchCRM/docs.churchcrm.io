---
title: Portal permissions
sidebar_position: 42
description: What each member can see and do in the Member Portal, where each permission comes from, the Permissions tab, and giving one person a permission.
---

# Portal permissions

One set of portal permissions decides what each member sees and can do in the [Member Portal](../user-guide/member-portal.md): the core pages, volunteering, and any pages a plugin adds. Staff permissions add nothing here: being an administrator or having Edit Records on the staff side doesn't change what you can do in your own portal.

Who may sign in at all is decided separately, by the rules on [Member sign-in](./member-sign-in.md#who-may-sign-in). This page is about what happens after that.

---

## Where permissions come from

| Source | What it is | Example |
|---|---|---|
| **Everyone** | What every member who signs in has | their own profile, their family's names and photos, the calendar |
| **A rule** | Worked out from church data on every page, so it ends by itself when the data changes. Nobody assigns it | *Adult of the Carter family*, *Leader of Sunday Greeters* |
| **Given by an administrator** | Given to one person on their page, with a reason and an optional last day | a grandparent who keeps the family's records |

The two core rules are:

- **Adult of the family**: a head of household or spouse aged 18 or over.
- **Team leader**: the person named in the **Team leader** field of a volunteer team (see [Who can do what](../user-guide/ministries/permissions.md)).

A permission is always held *on* something: everywhere, on a family, or on a team. Two permissions never add up to a third.

When a section of the portal is switched off on **Admin → Member Portal → Settings** (the calendar, or volunteering), its permissions are off for everyone, whatever their source.

---

## The permissions

| Permission | On | From | What it allows |
|---|---|---|---|
| **Edit my details** | everywhere | everyone | change their own name, contact details and photo |
| **Manage my sign-in and devices** | everywhere | everyone | see the devices and passkeys that sign them in, and sign out or remove any of them |
| **See my family** | a family | everyone | see the names and photos of the people in their family |
| **See family contact details** | a family | adult of the family | see family members' email addresses and phone numbers |
| **Change family details** | a family | adult of the family | change the family address and contact details, and add a family member for review |
| **Confirm family details** | a family | adult of the family | tell the church office whether the family details are still right |
| **See the church calendar** | everywhere | everyone, while the calendar is on | the calendars the church shares, and the subscription |
| **Volunteer** | everywhere | everyone, while volunteering is on | their schedule, signing up for open places, asking for a substitute |
| **Manage a team** | a team | team leader | run a volunteer team: positions, volunteers, schedules, staffing and headcounts |
| **Decide substitute requests** | a team | team leader | approve or decline substitute requests for a team |

**Volunteer**, **Manage a team** and **Decide substitute requests** need Volunteer Management v2. A plugin can add its own permissions; they appear in the same list with the plugin's name as their owner.

---

## The Permissions tab

**Admin → Member Portal → Permissions** lists every permission, core and plugin, with its description and key, what it is held **On**, where it comes **From**, its **Status** (*On*, or *Off* with the reason, such as a section switched off or a plugin turned off), and how many **People** hold it. People are counted among everyone the sign-in rules let in, plus staff.

![The Permissions tab: each permission with what it is held on, its sources, its status and how many people hold it](https://cdn.churchcrm.io/screenshots/en/desktop/admin-member-portal-permissions.png)

Press the **People** count to list the holders and where each one's permission comes from.

---

## Give a permission to one person

Give a permission when the rules don't fit a person, for example a grown son who helps his parents keep the family's records, or a coordinator who runs a team without being its named leader.

1. Open the person's page. In the **Portal sign-in** card, press **Give a permission** (administrators only).
2. Choose the **Permission**. Its description shows under it.
3. If it is held on something, choose the **Family** or **Team** by name.
4. Optionally set a **Last day**. The permission works through the whole of that day, in the church's time zone. Leave it empty to keep it until someone removes it.
5. Type a **Reason**. Only administrators see it.
6. Press **Give permission**.

![The Give a portal permission dialog: See family contact details on the Scott family, with a reason](https://cdn.churchcrm.io/screenshots/en/desktop/person-portal-give-permission.png)

The card lists the person's permissions grouped by source, for example *Everyone*, *Adult of the Carter family*, or each given permission with its reason. A given permission has a button to remove it. A permission whose last day has passed, or whose plugin is not installed, moves to **Given, but not in effect**.

- Giving and removing a permission are in the [audit](./member-sign-in.md#the-audit).
- A person who holds a given permission can only have their email changed by an administrator ([The sign-in email](./member-sign-in.md#the-sign-in-email)).
- A given **Manage a team** gives the person **My Teams** for that team in the portal, as being its named leader does.
- When a plugin is turned off, its permissions stop working but given ones stay stored, and work again when it is turned back on. Uninstalling the plugin deletes them.

---

## Related documentation

- [Member sign-in](./member-sign-in.md)
- [Member Portal administration](./member-portal.md)
- [Who can do what](../user-guide/ministries/permissions.md) — the volunteer levels
- [Adding Member Portal pages to a plugin](./plugins/plugin-portal-pages.md)
