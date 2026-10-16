---
title: Member Portal
sidebar_position: 40
description: Admin → Member Portal — member sign-in, the member lists, portal permissions, the sign-in audit, usage statistics, theme, which calendars members see and the member directory; what changes elsewhere; what to expect after upgrading.
---

# Member Portal administration

The [Member Portal](../user-guide/member-portal.md) is the member-facing half of ChurchCRM. Members sign in to it with their own email address; they have no user account and no password. Everything an administrator can change about it lives on one page, **Admin → Member Portal**.

:::tip Who reaches the portal
**Members** sign in at `/portal/login` with a code ChurchCRM emails them, once you have turned member sign-in on and chosen who may use it. See [Member sign-in](./member-sign-in.md). **Staff** sign in at `/admin/` as before and open their own portal from the user menu. What each person can do in the portal is decided by [portal permissions](./portal-permissions.md), not by staff permissions.
:::

---

## Admin → Member Portal

**Admin → Member Portal** is for administrators only. It has eight tabs: **Statistics**, **Sign-in**, **Members**, **Permissions**, **Audit**, **Themes**, **Calendars** and **Directory**. The **Open the Member Portal** button at the top right opens the portal as yourself.

### Settings

![The Settings tab](/img/administration/member-portal-settings.png)

**Portal theme** lists every theme folder on the server, the system default first, each with the result of its last check (*Valid*, *Warnings* or *Errors*).

- **Check** runs the theme validator against the selected theme and lists what it found — file, line and message — without changing anything. Use it after uploading a change and before making it live.
- **Activate** makes the selected theme the one members see from their next page load. Activation validates first: a theme with errors is **refused**, the findings are listed, and members keep the theme they already had. Warnings are shown but do not block.

The **Portal settings** panel holds the switches, saved with **Save Settings**:

| Setting | What it does | Default |
|---------|--------------|---------|
| **Show the church calendar** | Whether members get the **Calendar** page and the home-page calendar card. | On |
| **Show volunteering** | Whether members get **Volunteering** and **My Teams**. Only has an effect when your church uses Volunteer Management v2. | On |
| **Let members edit birthdays** | Whether a member can see and change their own birthday on **Profile**. Off, the field is neither shown nor accepted. | Off |
| **Developer mode** | For whoever is writing a [church theme](./member-portal-themes.md): turns the template cache off and prints the name of the template behind every portal page into its HTML. Leave it **off** in normal use — every page recompiles on every request while it is on. | Off |

Switching a section off hides it: its navigation entry and home card disappear and its pages are no longer reachable. Nothing is deleted, and switching it back on brings everything back.

### Sign-in

Member sign-in on or off, and who may sign in. Every field saves together with **Save sign-in settings**; if one value is wrong, the field says why and nothing is saved.

![The Sign-in tab](https://cdn.churchcrm.io/screenshots/en/desktop/admin-member-portal-sign-in.png)

| Setting | What it does | Default |
|---------|--------------|---------|
| **Let members sign in with their email** | Members sign in at `/portal/login` with an emailed code or link. It can only be turned on while ChurchCRM can send email; until then the switch is grayed out and the tab says why, with a **Set up email** link. | Off |
| **Family Roles** | Which family roles may sign in, plus **No family role**. | Head of Household, Spouse |
| **Classifications** | Which classifications may sign in, each with its number of active people, plus **Unassigned**. *"This is where you decide about guests."* | None |
| **Minimum age** | Youngest age that may sign in. 0 means no age rule. Without a birth date, only a head of household or spouse qualifies. | 13 |
| **Link and code lifetime (minutes)** | How long a sign-in code and link stay valid. | 120 |
| **Sign-in emails per IP address per hour** | How many sign-in emails one IP address can ask for in an hour. 0 means no limit, for when everyone reaches ChurchCRM through one address. | 20 |
| **Idle time (minutes)** | How many idle minutes end a member's session. | 30 |
| **Keep me signed in (days)** | How long a device stays signed in after the member ticks **This is my own device**. 0 removes the choice and stops every remembered device. | 30 |
| **Passkeys** | Let members add passkeys and sign in with them. When the site address can't carry passkeys (not `https`, or an IP address instead of a host name), the tab says why. | On |
| **Office list** | People emailed when someone could not sign in, at most once per address per hour. Only people with their own email can be added. | Empty |
| **Allow Login as User** | Administrators may open a member's portal as that member, from the person's **Actions** menu. | Off |
| **Allow changes during Login as User** | When off, Login as User is read-only. | Off |

The **Who may sign in** card's footer counts the people the saved settings let in, before the email rule. How these rules work together, and turning member sign-in on for the first time, are on [Member sign-in](./member-sign-in.md).

### Members

Lists of the people member sign-in applies to, each paged and searchable, with a count beside its name. The lists follow the rules on the Sign-in tab.

![The Members tab](https://cdn.churchcrm.io/screenshots/en/desktop/admin-member-portal-members.png)

| List | Who is on it |
|------|--------------|
| **May sign in now** | The sign-in rules let them in, and each has their own email that nobody else who may sign in uses |
| **Signed in, last 30 days** | Members who signed in during the last 30 days |
| **Never signed in** | People who may sign in but never have |
| **Email needs attention** | People the rules let in whose email stops them: no personal email, an email shared with someone else, or an unconfirmed one. Filter by problem. **Confirm Email Address** is offered where you may confirm it ([The sign-in email](./member-sign-in.md#the-sign-in-email)) |
| **Families confirmed, last 30 days** | Families who confirmed their details, how (Member Portal or emailed verification link), the answer, and which member confirmed |
| **Family emails not moved** | Shown only after the upgrade moved family emails: each family whose email could not go to a person, with the reason, and counts of how many moved to a head of household, to a spouse, were already held by a family member, or were noted in the family timeline |

### Permissions

Every portal permission, core and plugin, with what it is held on, where it comes from, whether it is on, and how many people hold it. **People** lists the holders. See [Portal permissions](./portal-permissions.md).

### Audit

Every member sign-in, refusal and change to sign-in, newest first, filterable by person, dates and event, in plain words. It never holds a code, link or passkey. See [The audit](./member-sign-in.md#the-audit).

### Themes

A table of every theme folder found on the server: its display name and description, the **Folder** it lives in, its **Author**, how many **Overridden templates** it has, and its last **Validation** result — expand **Findings** to read the individual messages. Each row's action menu offers **Check** and **Activate**, exactly as on the Settings tab.

The tab carries the notice *"Themes are provided by your church, not by ChurchCRM, and are not verified by the ChurchCRM project."* and a link to the theme authoring guide. See [Church themes](./member-portal-themes.md).

If the folder of the active theme has been removed from the server, the page opens with a red **The active theme folder is missing** warning: members are seeing an error page until you pick a theme that exists.

### Statistics

![The Statistics tab](https://cdn.churchcrm.io/screenshots/en/desktop/admin-member-portal-statistics.png)

How much the portal is being used: *"Member Portal sign-ins and activity, for members and for staff who open the portal from their staff sign-in."* Login as User doesn't count.

| Number | Meaning |
|--------|---------|
| **Active now** | People who opened a portal page in the last 15 minutes |
| **Last 24 hours / Last 7 days / Last 30 days** | People who signed in within that period |
| **May sign in** | Everyone the sign-in rules let in |
| **Never signed in** | People who may sign in but never have |

**Ten most recent sign-ins** lists the newest sign-ins with the member's name (linked to their record), how they signed in (for example *Email code* or *Passkey*), their last sign-in and when they were last seen in the portal. Before anyone has used it the table reads *"No member has signed in to the Member Portal yet."*

### Calendars

![The Calendars tab](https://cdn.churchcrm.io/screenshots/en/desktop/admin-member-portal-calendars.png)

Which calendars members see. Every calendar on the installation is listed with its **Kind** — *Church calendar*, *Ministry calendar* (a calendar that belongs to a volunteer ministry) or *System calendar* (Birthdays, Anniversaries, Fundraisers, Unpinned Events, and any calendar a plugin adds, such as the Holidays plugin's) — its **Colour**, and a **Show in Member Portal** switch. Press **Save calendars** to apply.

The tab's own rule is the one to remember: **Members see only the calendars switched on here. Birthdays and anniversaries show first names and last initials only.** A member never sees an age or a full surname from a shared birthday or anniversary calendar — but sharing those calendars is still a decision about members' personal information, and it is yours to make.

- After an **upgrade**, no calendar is shared. Members see *"No calendar has been shared with members yet."* until you switch one on.
- On a **new installation**, the **Public Calendar** is shared from the start.
- The switches also decide what a member can put in the [calendar subscription](../user-guide/member-portal.md#subscribe-in-your-own-calendar-app) they add to their own calendar app.
- Members can [hide any shared calendar](../user-guide/member-portal.md#show-or-hide-a-calendar) from the legend of their own **Calendar** page. That changes only what their browser shows, not what you share here.

### Directory

The **Directory** tab switches the portal's member directory on and chooses who is listed, who may look, and what it shows. Changes save as you go — there is no Save button on this tab.

- **Directory on or off.** Off by default: with it off, members have no directory page at all. Turning it on is the church's decision to let members look each other up.
- **Who is listed** and **who may look** are chosen by classification, both Member by default. Only people in a listed classification appear, and only signed-in members in a viewer classification may open the directory.
- **What it shows** matches the printed directory's **Information to Include**: primary address, mailing address if different, home, personal, work and cell phone, email and work email, and photo. A detail switched off here is never read, so neither the page nor its API can return it.
- **Birthdays and anniversaries** can show with the year, without the year, or not at all. A member's own **Hide age** setting drops the year from their birthday.
- **Browse or search only.** Browse lists everyone, A–Z, with a search box. Search only answers nothing until two characters are typed, and then shows at most 20 entries, so the whole list never leaves the server.

Deceased, inactive and unreviewed people, and people in deactivated families, never appear.

The tab's own rule is the one to remember: **the directory has no per-person opt-out.** Anyone in a listed classification appears; a listed person cannot leave themselves out of the directory.

---

## What changed elsewhere

The portal adds a module; it does not alter the office side of ChurchCRM. A few things around it did move:

- **Volunteering for members lives only in the portal.** The admin sidebar has no *Volunteer* heading any more; coordinators work under **Ministries**, and members accept, decline, swap and sign up on the portal's **Volunteering** page. See [Volunteers](../user-guide/volunteers.md).
- **A team leader needs no staff account.** Naming a member in a team's **Team leader** field gives them **My Teams** in the portal — positions, volunteers, schedules and dates for their own team — and nothing at all in the admin area. See [Portal permissions](./portal-permissions.md).
- **Every ministry has its own calendar**, created with the ministry, renamed when it is renamed and deleted with it. The admin calendar page lists these under **Ministry Calendars**, and the heading that used to say *My Calendars* now reads **Church Calendars**. Ministry calendars are off in the portal until you switch them on.
- **The old limited-access page is retired.** `/external/limited-access` now redirects to the portal.
- **Staff and administrators open the portal from their user menu** (**Member Portal**), and get back through the portal's account menu (**Admin Console**), without signing in again. See [Staff sign-in at /admin/](./member-sign-in.md#staff-sign-in-at-admin).
- **Member photos** in the portal are served through the portal itself, scoped to the member and their family. Nothing for an administrator to configure.
- **A family member proposed in the portal waits on People → Self Registrations.** When an adult of a household uses **Add a family member**, the new person is saved in that family and marked for review; the household sees them on **My Family** with a **Waiting for review** badge until you approve them. The dashboard lists them as a *Family Member* row with the family's name and counts them as pending. Approve them on their own from the row menu (**Approve**), or with others using **Approve selected**.
- **The portal footer comes from Admin → Church Information**: the church's name, phone and email, a **Church website** link and the church's social media links. A website or social media address is only shown when it is a web address starting with `http://` or `https://`.

![The Member Portal entry in the user menu](/img/administration/member-portal-user-menu.png)

---

## For administrators upgrading

What you will notice after upgrading:

1. **Self-service logins are gone, and member sign-in is off.** The upgrade removes every user account whose only permission was *Edit Self*. Members sign in with their own email once you turn member sign-in on: the Admin Dashboard reminds you. This is the change worth an announcement to your members. See [Member sign-in → After the upgrade](./member-sign-in.md#after-the-upgrade).
2. **Families have no email of their own.** The upgrade moves each family email to a person. See [Email belongs to people](./member-sign-in.md#email-belongs-to-people).
3. **Staff sign in at `/admin/`.** Old `/session/begin` links redirect there. Staff and administrators have a **Member Portal** entry in their user menu.
4. **No calendar is shared until you switch one on** (when you upgrade from a release without the portal). Visit **Admin → Member Portal → Calendars** and choose. Birthdays and anniversaries stay off unless you share them.
5. **Birthday editing is off** until you switch it on.
6. **There is no feature flag.** The portal cannot be turned off as a whole; the section switches above are what you have.
7. **A church theme must survive deployment.** Themes live under `Include/themes/` on the server, the one folder ChurchCRM never overwrites. If you deploy with a script that mirrors the release over the installation and deletes what it does not know (for example `rsync --delete`), exclude that folder, or members will see *"The Member Portal is temporarily unavailable"* until you pick a theme that still exists. See [Church themes](./member-portal-themes.md).

:::warning Back up first
The release that carries the portal also adds database columns on first page load, as every upgrade does. Take a backup before upgrading — see the [Upgrade Guide](./upgrade.md).
:::

---

## Related documentation

- [Member Portal — for members](../user-guide/member-portal.md)
- [Signing in to the Member Portal](../user-guide/member-sign-in.md) — for members
- [Member sign-in](./member-sign-in.md)
- [Portal permissions](./portal-permissions.md)
- [Church themes](./member-portal-themes.md)
- [Upgrade Guide](./upgrade.md)
