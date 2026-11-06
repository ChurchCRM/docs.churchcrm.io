---
title: Member Portal
sidebar_position: 40
description: People → Admin → Member Portal — usage statistics, member sign-in, the member lists, portal permissions, the sign-in audit, themes, which calendars members see and the member directory; what to expect after upgrading.
---

# Member Portal administration

The [Member Portal](../user-guide/member-portal.md) is the member-facing half of ChurchCRM. Members sign in to it with their own email address; they have no user account and no password. Everything an administrator can change about it lives on one page, **People → Admin → Member Portal**.

:::tip Who reaches the portal
**Members** sign in at `/portal/login` with a code ChurchCRM emails them, once you have turned member sign-in on and chosen who may use it. See [Member sign-in](./member-sign-in.md). **Staff** sign in at `/admin/` as before and open their own portal from the user menu. What each person can do in the portal is decided by [portal permissions](./portal-permissions.md), not by staff permissions.
:::

---

## People → Admin → Member Portal

The page is for administrators only. It has eight tabs: **Statistics**, **Sign-in**, **Members**, **Permissions**, **Audit**, **Themes**, **Calendars** and **Directory**. **Open the Member Portal** at the top right opens the portal as yourself. Every setting on the page saves as soon as you change it; there is no Save button.

### Statistics

The page opens on this tab.

![The Statistics tab](https://cdn.churchcrm.io/screenshots/en/desktop/admin-member-portal-statistics.png)

How much the portal is being used: *"Member Portal sign-ins and activity, for members and for staff who open the portal from their staff sign-in."* Login as Person doesn't count.

| Number | Meaning |
|--------|---------|
| **Active now** | People who opened a portal page in the last 15 minutes |
| **Last 24 hours / Last 7 days / Last 30 days** | People who signed in within that period |
| **May sign in** | Everyone on the **May sign in now** list of the Members tab |
| **Never signed in** | People who may sign in but never have |

**Ten most recent sign-ins** lists the newest sign-ins with the member's name (linked to their record), **How** they signed in (for example *Email code* or *Passkey*), their **Last sign-in** and when they were **Last seen in the portal**. Before anyone has used it the table reads *"No member has signed in to the Member Portal yet."*

### Sign-in

Member sign-in on or off, who may sign in, and how long codes, sessions and devices last. If a value is refused, the field goes back to the saved value and a message says why.

![The Sign-in tab](https://cdn.churchcrm.io/screenshots/en/desktop/admin-member-portal-sign-in.png)

| Setting | What it does | Default |
|---------|--------------|---------|
| **Let members sign in with their email** | Members sign in at `/portal/login` with an emailed code or link. It can only be turned on while ChurchCRM can send email; until then the switch is grayed out and the tab says why, with a **Set up email** link. Turning it on or off asks first. | Off |
| **Family Roles** | Which family roles may sign in, plus **No family role**. | Head of Household, Spouse |
| **Classifications** | Which classifications may sign in, each with its number of active people, plus **Unassigned**. *"This is where you decide about guests."* | None |
| **Minimum age** | Youngest age that may sign in. 0 means no age rule. Without a birth date, only a head of household or spouse qualifies. | 13 |
| **Link and code lifetime (minutes)** | How long a sign-in code and link stay valid. | 120 |
| **Sign-in emails per IP address per hour** | How many sign-in emails one IP address can ask for in an hour. 0 means no limit, for when everyone reaches ChurchCRM through one address. | 20 |
| **Idle time (minutes)** | How many idle minutes end a member's session. | 30 |
| **Keep me signed in (days)** | How long a device stays signed in after the member ticks *This is my own device*. 0 removes the choice and stops every remembered device. | 14 |
| **Passkeys** | Let members add passkeys and sign in with them. When the site address can't carry passkeys (not `https`, or an IP address instead of a host name), the tab says why. | On |
| **Office list** | *People to email when someone could not sign in to the Member Portal*, at most once per address per hour. Only people with their own email can be added. | Empty |
| **Allow Login as Person** | Administrators may open a person's portal as that person, from the person's **Actions** menu, while member sign-in is on. | Off |
| **Allow changes during Login as Person** | When off, Login as Person is read-only. | Off |

The **Who may sign in** card's footer counts the people the saved settings let in; each of them also needs their own email that nobody else uses. While member sign-in is on, a warning shows when the rules let nobody in, and another counts the **Shared emails that stop people from signing in**, with a **Fix shared emails** link. How these rules work together, and turning member sign-in on for the first time, are on [Member sign-in](./member-sign-in.md).

### Members

Lists of the people member sign-in applies to, each paged and searchable, with a count beside its name. The lists follow the rules on the Sign-in tab.

![The Members tab](https://cdn.churchcrm.io/screenshots/en/desktop/admin-member-portal-members.png)

| List | Who is on it |
|------|--------------|
| **Look up anyone** | Everyone on file. **Can sign in?** says Yes or No, and **Why not** gives the reason. The tab opens on this list |
| **May sign in now** | The sign-in rules let them in, and each has their own email that nobody else who may sign in uses |
| **Signed in, last 30 days** | Everyone who signed in during the last 30 days, newest first, with how and when they were last seen |
| **Never signed in** | People who may sign in but never have |
| **Email needs attention** | People the rules let in whose email stops them: no personal email, an email shared with someone else, or an unconfirmed one. Filter by problem, and unconfirmed ones by kind (*Moved from the family email* or *Replaced after a sign-in*). **Fix shared emails**, **Confirm Email Address** and **Confirm selected** work here ([The sign-in email](./member-sign-in.md#the-sign-in-email)) |
| **Families confirmed, last 30 days** | Families a member confirmed, from the Member Portal or the emailed verification link, with who confirmed and the result |
| **Family emails not moved** | Shown only while the upgrade left family emails it could not move: each family, its old email and why, with counts of how many moved to a head of household, to a spouse, were already held by a family member, or were noted in the family timeline |

### Permissions

Every portal permission, core and plugin, with what it **Applies to**, who it is **Given to**, its **Status**, and how many **People** hold it. The **What members can use** panel at the top holds two switches:

| Setting | What it does | Default |
|---------|--------------|---------|
| **Let members edit birthdays** | Members can see and change their own birthday on **Profile**. Off, the field is neither shown nor accepted. | Off |
| **Show volunteering** | Members get **Volunteering** and team leaders **My Teams**. Only has an effect when your church uses Volunteer Management v2. | On |

See [Portal permissions](./portal-permissions.md).

### Audit

Every member sign-in, refusal and change to sign-in, newest first, filterable by person, dates and event, in plain words. It never holds a code, link or passkey. See [The audit](./member-sign-in.md#the-audit).

### Themes

*"A theme is a folder your church uploads to Include/themes/ on the server. The system default ships with ChurchCRM."* The table lists every theme folder: its name and description, the **Folder** it lives in, its **Author**, how many **Overridden templates** it has, and its last **Validation** result (*Valid*, *Warnings* or *Errors*). Expand **Findings** to read the messages, with file and line.

Each row's menu offers:

- **Check** runs the theme validator and lists what it found, without changing anything. Use it after uploading a change and before making it live.
- **Activate** makes the theme the one members see from their next page load. Activation checks first: a theme with errors is refused, the findings are listed, and members keep the theme they had. Warnings are shown but do not block.

The tab carries the notice *"Themes are provided by your church, not by ChurchCRM, and are not verified by the ChurchCRM project."* and a link to the theme authoring guide. See [Church themes](./member-portal-themes.md).

The **Theme development** panel below holds **Developer mode** (off): for whoever is writing a theme, it turns the template cache off and prints the name of each template in the page's HTML. Leave it off in normal use.

If the folder of the active theme has been removed from the server, the page opens with a red **The active theme folder is missing** warning: members are seeing an error page until you pick a theme that exists.

### Calendars

![The Calendars tab](https://cdn.churchcrm.io/screenshots/en/desktop/admin-member-portal-calendars.png)

Which calendars members see. Every calendar on the installation is listed with its **Kind** — *Church calendar*, *Ministry calendar* (a calendar that belongs to a volunteer ministry) or *System calendar* (Birthdays, Anniversaries, Fundraisers, Unpinned Events, and any calendar a plugin adds, such as the Holidays plugin's) — its **Colour**, and a **Show in Member Portal** switch.

The tab's own rule is the one to remember: **Members see only the calendars switched on here. Birthdays and anniversaries show first names and last initials only.** A member never sees an age or a full surname from a shared birthday or anniversary calendar, but sharing those calendars is still a decision about members' personal information, and it is yours to make.

- Members have a **Calendar** page only while at least one calendar is switched on. The line above the table says which is the case now.
- On a **new installation**, the **Public Calendar** is shared from the start.
- The switches also decide what a member can put in the [calendar subscription](../user-guide/member-portal.md#subscribe-in-your-own-calendar-app) they add to their own calendar app.
- Members can [hide any shared calendar](../user-guide/member-portal.md#show-or-hide-a-calendar) from the legend of their own **Calendar** page. That changes only what their browser shows, not what you share here.

### Directory

The **Directory** tab switches the portal's member directory on and chooses who is listed, who may look, and what it shows.

- **Show the member directory**, in the **Directory section** panel, is off by default: with it off, members have no directory page at all. Turning it on is the church's decision to let members look each other up.
- **Who is listed** and **Who can see it** are chosen by classification, both *Member* at first. Only people in a listed classification appear, and only signed-in members in a ticked **Who can see it** classification find **Directory** in the portal menu. An administrator can also [give one person](./portal-permissions.md#give-a-permission-to-one-person) **See the member directory**.
- **Search method.** **Browse the full directory** lists everyone, A to Z, with a search box (the default). **Search only** answers nothing until two letters of a name are typed, then shows up to 20 matches, so the full list is never shown.
- **Information to Include** matches the printed directory's choices: **Primary Address**, **Mailing Address if Different**, **Family Home Phone**, **Personal Home Phone**, **Personal Work Phone**, **Personal Cell Phone**, **Personal Email**, **Personal Work/Other Email** and **Photos**. All are on at first except **Mailing Address if Different**. A detail switched off here is never read, so neither the page nor its API can return it.
- **Birthday** and **Wedding Anniversary** can be **Show with year**, **Show without year** (the default) or **Do not show**. A person whose record has **Hide Age** ticked never shows a birth year.

Deceased, inactive and unreviewed people, and people in deactivated families, never appear. There is no way for one person to leave themselves out: everyone in a listed classification appears.

---

## Around the portal

- **Volunteering for members lives in the portal.** Coordinators work under **Ministries**, and members accept, decline, swap and sign up on the portal's **Volunteering** page. See [Volunteers](../user-guide/volunteers.md).
- **A team leader needs no staff account.** Naming a member in a team's **Team leader** field gives them **My Teams** in the portal (positions, volunteers, schedules and dates for their own team) and nothing at all in the staff area. See [Portal permissions](./portal-permissions.md).
- **Every ministry has its own calendar**, created with the ministry, renamed when it is renamed and deleted with it. The staff calendar page lists these under **Ministry Calendars**, beside **Church Calendars**. Ministry calendars are off in the portal until you switch them on.
- **Staff and administrators open the portal from their user menu** (**Member Portal**), and get back through the portal's **Hello** menu (**Admin Console**), without signing in again. See [Staff sign-in at /admin/](./member-sign-in.md#staff-sign-in-at-admin).
- **A family member proposed in the portal waits on People → Self Registrations.** When an adult of a household uses **Add a family member**, the new person is saved in that family and marked for review; the household sees them on **My Family** with a **Waiting for review** badge until you approve them. See [Self Registrations](../user-guide/self-registrations.md).
- **The portal footer comes from Admin → Church Information**: the church's name, phone and email, a **Church website** link and the church's social media links. A website or social media address is only shown when it is a web address starting with `http://` or `https://`.

![The Member Portal entry in the user menu](/img/administration/member-portal-user-menu.png)

---

## For administrators upgrading

What you will notice after upgrading:

1. **Self-service logins are gone, and member sign-in is off.** The upgrade removes every user account with *Edit Self* that is not an administrator. Members sign in with their own email once you turn member sign-in on: the Admin Dashboard reminds you. This is the change worth an announcement to your members. See [Member sign-in → After the upgrade](./member-sign-in.md#after-the-upgrade).
2. **Families have no email of their own.** The upgrade moves each family email to a person. See [Email belongs to people](./member-sign-in.md#email-belongs-to-people).
3. **Staff sign in at `/admin/`.** Old `/session/begin` links show the same form. Staff and administrators have a **Member Portal** entry in their user menu.
4. **The calendar follows the Calendars tab.** There is no separate switch for the portal calendar: members have a Calendar page while at least one calendar is shared. If your portal calendar was switched off before, the upgrade shares none. When you upgrade from a release without the portal, no calendar is shared either. Visit the **Calendars** tab and choose; birthdays and anniversaries stay off unless you share them.
5. **Birthday editing is off** until you switch it on on the **Permissions** tab.
6. **The portal has no on/off switch of its own.** Members reach it only while member sign-in is on; staff can always open their own. The section switches above are what you have.
7. **A church theme must survive deployment.** Themes live under `Include/themes/` on the server, the one folder ChurchCRM never overwrites. If you deploy with a script that mirrors the release over the installation and deletes what it does not know (for example `rsync --delete`), exclude that folder, or members will see *"The Member Portal is temporarily unavailable"* until you pick a theme that still exists. See [Church themes](./member-portal-themes.md).

:::warning Back up first
The release that carries the portal also changes the database on first page load, as every upgrade does. Take a backup before upgrading — see the [Upgrade Guide](./upgrade.md).
:::

---

## Related documentation

- [Member Portal — for members](../user-guide/member-portal.md)
- [Signing in to the Member Portal](../user-guide/member-sign-in.md) — for members
- [Member sign-in](./member-sign-in.md)
- [Portal permissions](./portal-permissions.md)
- [Church themes](./member-portal-themes.md)
- [Upgrade Guide](./upgrade.md)
