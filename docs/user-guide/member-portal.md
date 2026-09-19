---
title: Member Portal
sidebar_position: 30
description: The member-facing side of ChurchCRM — where a church member signs in to see their own details, their household, the church calendar and their volunteering.
---

# Member Portal

The **Member Portal** is the part of ChurchCRM written for a church member rather than for the office. When you sign in with a member account you land in the portal, and everything you can do for yourself and your family lives there: your contact details, your household, the church calendar, and — if your church uses it — your volunteering.

This page is written for members. If you administer ChurchCRM, see [Member Portal administration](../administration/member-portal.md) for the settings behind it and [Church themes](../administration/member-portal-themes.md) for making it look like your church.

:::note
Your church decides which sections appear. A section your church has not switched on is simply not there; nothing on this page is a promise that every portal has every card.
:::

---

## Signing in

Sign in at the same address your church always gave you, with the same username and password. A member account — one that can only edit its own details — lands on the portal home page and stays in the portal: any address that belongs to the office side of ChurchCRM sends you back to the portal home.

![The Member Portal home page on a laptop](/img/user-guide/member-portal-home.png)

The navigation across the top is, in order: **Home · Calendar · Volunteering · My Teams · My Family · Profile**. Only the entries your church has switched on and that apply to you are shown; a member who does not lead a volunteer team, for example, has no **My Teams** entry.

On a phone the navigation folds behind the menu button in the header; every page fits a phone screen without sideways scrolling.

![The Member Portal home page on a phone](/img/user-guide/member-portal-home-phone.png)

The **Hello *\<your name\>*** menu in the header holds **Email History** (what the church has emailed you), **Change Password** and **Sign out**. Staff who also have an office login see **Admin Console** there as their way back.

---

## Home

The home page opens with a welcome card — your first name, your family's name, and the line *"This is your church account. Everything you can do for yourself and your family lives here."* — followed by one card for each section your church has switched on:

| Card | What it shows |
|------|---------------|
| **Church calendar** | The next three events from the calendars the church shares with members, and **See the whole calendar**. With nothing coming up it says *"Nothing is on the calendar just now."*; if the church has not shared any calendar yet it says so instead. |
| **My volunteering** | The next thing you are on for, as *date · ministry — team — position*, and how many of your assignments are still **waiting for your answer**. With nothing booked: *"Nothing on your list yet. Have a look at what needs filling."* |
| **My Family** | Your household's name, how many people are in it, and **Update your details**. A member with no family record sees *"You are not currently associated with a family"* and a link explaining how to correct this. |
| **Profile** | Your name and the contact details the church has on file, with **Update your details**. |

---

## Profile

**Profile** shows **Your photo** — the picture on file, or your initials while there is none — and **Your details**: title, first, middle and last name, suffix, email, work email, and mobile, home and work phone.

![The Profile page](/img/user-guide/member-portal-profile.png)

- **Update your details** opens an edit form. Changes are saved straight away; the page confirms with *"Your details have been saved"*. A field the church needs (your first name, for example) cannot be left blank.
- **Choose a new photo** on the edit form uploads a new picture. A square picture of your face works best.
- **Birthday** appears only when your church allows members to change it. Otherwise it is neither shown nor editable here — ask the church office.
- Your surname and your household's address belong to the family, so they are changed under [My Family](#my-family), not here.

Under **Sign-in and security** you will find **Change your password** and **Two-factor authentication**. Both open inside the portal, so you never leave it to look after your account.

---

## My Family

**My Family** shows your household as the church has it: **Where we reach you** (address, city, state, zip, country, home phone, email and wedding date) and **Family Members**, with your own row marked **You**.

![The My Family page](/img/user-guide/member-portal-family.png)

### Update your details

An adult of the household (head or spouse) can press **Update your details** to change the address and household phone and email — *"This is where the church sends post and who it calls about your household."* Other family members see *"Only an adult of your family can change these details. Please contact the church office."*

### Confirm your family details

Churches periodically ask households to check what is on file. **Confirm your family details** shows the household and asks **"Is this still right?"** with two answers:

- **Everything is correct**
- **Something needs changing** — a box appears asking **"What needs changing?"**

**Send your answer** delivers your reply to the church office; nothing on your record changes until someone there acts on it.

![Confirm your family details](/img/user-guide/member-portal-family-confirm.png)

### Add a family member

**Add a family member** opens a short form — first name, last name, role and an optional birthday — and sends it to the church office with **Send to the church office**. As the dialog says, *nobody is added to the church records until a member of staff has looked at it.* The office reviews the request in the same place it reviews online registrations.

---

## Calendar

**Calendar** shows the church calendars an administrator has chosen to share with members. The calendars are listed above the grid with their colours; **Month**, **Week** and **List** views are available, and on a phone the calendar opens in list view. Click an event to see **When**, **Where** and **Details**. The calendar is read-only: nothing here can change an event.

![The portal calendar](/img/user-guide/member-portal-calendar.png)

If your church shares its birthday or anniversary calendar, entries show a first name and last initial (*"Albert C."*) and never an age or a full surname.

The ministry calendar of a team you lead is marked **You lead this**.

### Subscribe in your own calendar app

**Subscribe** lets you follow the church calendar from your phone's or computer's own calendar app, so it updates on its own when the church calendar changes.

![The Subscribe dialog](/img/user-guide/member-portal-calendar-subscribe.png)

1. Press **Subscribe** and tick the calendars you want.
2. Press **Save**. The portal gives you one **Calendar address** covering everything you ticked.
3. **Copy** the address and add it to your calendar app as a new calendar subscription, or press **Open in calendar app** to hand it straight to the app.

:::warning The address is personal
The subscription address is a secret that identifies you. Do not share it. If you have given it out by mistake, press **Reset link**: the old address stops working straight away and you get a new one.
:::

---

## Volunteering

If your church runs its volunteer teams through ChurchCRM, **Volunteering** has two tabs.

### My schedule

Everything you have been asked to do, soonest first. Each card names the date, ministry, team and position, and carries a status badge:

| Badge | Meaning |
|-------|---------|
| **Needs an answer** | Somebody has put you on this date and is waiting to hear back. |
| **Going** | You have said yes. |
| **Declined** | You have said you cannot make it. |
| **Covered** | Somebody else has agreed to take your place. |

![My schedule](/img/user-guide/member-portal-volunteering-schedule.png)

- **I'll be there** accepts; the badge changes to **Going**.
- **I can't** declines. You can add a note for your coordinator — *"Let them know why (optional)"*.
- **Find a sub** opens **Ask someone to cover for you**: pick someone who has already agreed to take your place, add anything your coordinator should know, and press **Ask them**. Your coordinator confirms the swap.
- **Show what I have already done** includes past dates in the list.

With nothing on your list the page says *"Nothing on your list yet"* and points you to **See what needs filling**.

### Find something to do

Places you are trained for that still need someone, plus ministries that are looking for people.

![Find something to do](/img/user-guide/member-portal-volunteering-opportunities.png)

- **Ministries looking for help** lists ministries that have said they would like more people. Press **I'd like to help** and the coordinator is told; the page confirms with *"Thanks — the coordinator has been told you'd like to help."*
- **Upcoming availability** lists scheduled positions that still need someone. **Sign up** puts you on the list — *"You are on the list — thank you."* — and the date appears on **My schedule**. If you are already helping that day in another position, the card says so before you sign up.

With nothing open the page says *"Nothing open right now"* and *"We will email you when something needs filling."*

---

## My Teams

**My Teams** appears only for a member who leads a volunteer team. It lists the teams you look after — *"Open one to set up its positions, say who can serve where, and fill the weeks ahead."* — with each team's ministry, its number of positions and its next scheduled date.

![My Teams](/img/user-guide/member-portal-my-teams.png)

**Open this team** shows four tabs for that team and nothing else:

| Tab | What you can do |
|-----|-----------------|
| **Positions** | **Add position** — a job someone does on this team, such as Espresso or Song Leader — with a name, description, order, whether it is active, and **Recruit Volunteers**, which advertises it on the page where members look for something to help with. |
| **Volunteers** | A grid of your team's people against its positions. Tick who can serve where; *"Ticks save as you make them."* |
| **Schedules** | **Add schedule** — the recurring pattern the team serves, either following a calendar event type or repeating weekly on its own — with **Staffing needs** (how many people each position needs each time). **Generate occurrences** fills the weeks ahead, optionally with the default volunteers you name. |
| **Dates** | Every generated date. Open one to see its staffing, **Assign a volunteer** (whoever served least recently is listed first) and answer any requests to swap. |

![A team's Positions tab](/img/user-guide/member-portal-team-positions.png)

A team leader works on their own team only. Adding people to the ministry's pool, renaming or deleting teams, and ministry-wide settings such as **Help Wanted** belong to the ministry's coordinator in the office side of ChurchCRM. Opening a team you do not lead shows *"You cannot open this page"*.

---

## Related documentation

- [Member Portal administration](../administration/member-portal.md) — the settings, statistics and shared calendars behind the portal
- [Church themes](../administration/member-portal-themes.md) — giving the portal your church's look
- [Events](./events.md) — the church calendar the portal shows
- [Volunteers](./volunteers.md) — volunteer management from the office side
