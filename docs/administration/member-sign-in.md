---
title: Member sign-in
sidebar_position: 41
description: How members sign in to the Member Portal with their own email, who may sign in, turning it on after the upgrade, the rules for sign-in email addresses, Disable sign-in, Login as User, and the staff sign-in at /admin/.
---

# Member sign-in

Members sign in to the [Member Portal](./member-portal.md) with their own email address. ChurchCRM emails them a code and a link; there is no member account and no password. On their own device a member can choose to stay signed in, and add a passkey. Staff keep their username, password and two-factor sign-in, on a separate page at `/admin/`.

This page is for administrators. What members see is on [Signing in to the Member Portal](../user-guide/member-sign-in.md). The settings themselves are on **Admin → Member Portal**, described tab by tab on [Member Portal administration](./member-portal.md).

---

## Turn on member sign-in

Member sign-in is **off** on a new installation and after the upgrade that brings it. Turn it on when you are ready:

1. **Make sure ChurchCRM can send email.** Members get their code by email, so the switch can't be turned on until email works. Set up the mail server under **Communication → Email → Email Settings** ([Email Setup](./email-setup.md)) and send yourself a test.
2. **Choose who may sign in.** Open **Admin → Member Portal → Sign-in**. Head of household and spouse are ticked under **Family Roles**, but **no classification is ticked**, so nobody may sign in until you tick at least one, for example *Member* and *Regular Attender*. Check **Minimum age** (13). See [Who may sign in](#who-may-sign-in).
3. **Fill in the office list.** Pick the people who should hear about failed sign-in attempts. Only people with their own email can be added.
4. **Check the emails.** On the **Members** tab, open **Email needs attention**: people the rules let in who have no personal email, share one with someone else, or have one that isn't confirmed yet. Fix what you can now. See [The sign-in email](#the-sign-in-email).
5. **Check the site address** if you want passkeys. They need the site address in `Include/Config.php` to be an `https` address with a host name. The Sign-in tab says why when it isn't.
6. Switch on **Let members sign in with their email** and press **Save sign-in settings**. The card footer shows how many people the saved settings let in.
7. **Tell your members.** They open the usual ChurchCRM address, type their email and use the code. [Signing in to the Member Portal](../user-guide/member-sign-in.md) is written for them.

![The Sign-in tab: member sign-in on, family roles and classifications ticked, and the codes, sessions and devices settings](https://cdn.churchcrm.io/screenshots/en/desktop/admin-member-portal-sign-in.png)

:::warning Calendar subscriptions follow the rules
A member's calendar subscription keeps working only while that person may sign in. While member sign-in is off, the rules above are not applied to subscriptions, so the ones the upgrade carried over keep working. Once you turn it on, a subscription stops for anyone the rules leave out. Tick the classifications before you switch it on.
:::

---

## Who may sign in

A person may start a portal session only when all of these hold. They are checked at sign-in and again on every portal page, so a change takes effect on the person's next click.

**Nobody signs in, staff included, who:**

- is deceased or inactive,
- is in a family that is deactivated,
- is awaiting review (from the public registration form, a kiosk walk-in, or a family member added in the portal), or
- has **Disable sign-in** on ([below](#disable-sign-in-and-sign-out-everywhere)).

**The member rule**, set on the Sign-in tab, decides who else may sign in to the portal:

| Setting | What it means | At first |
|---|---|---|
| **Family Roles** | One checkbox per family role, plus **No family role** for people without one | Head of Household and Spouse ticked |
| **Classifications** | One checkbox per classification, with the number of active people in each, plus **Unassigned**. *"This is where you decide about guests."* | Nothing ticked |
| **Minimum age** | The youngest age at which a person may sign in. **0** means no age rule. When the birth date is unknown, only a head of household or spouse qualifies | 13 |

The member rule doesn't apply to staff signing in at `/admin/`.

**The email rule.** The address typed must be the person's own **Email** (never the work email), match exactly after trimming and ignoring case, and not be unconfirmed. When two people who would otherwise qualify share an address, neither can sign in with it until you give each their own; both appear under **Email needs attention**.

In the portal, an **adult** is a head of household or spouse aged 18 or over. Only adults see other family members' email and phone, change family details, add a family member or confirm the family. A younger member who may sign in sees their own details, the family names and photos, the calendar and their volunteering. See [Portal permissions](./portal-permissions.md).

---

## How email sign-in behaves

- **One answer for every address.** The page shows *"If this address can be used to sign in, we've emailed you a code."* whether or not the address belongs to anyone, so it can't be used to find out who your members are.
- **A refused address gets no email.** The reason goes into the [audit](#the-audit), and the office list gets a notice, at most one per address per hour. An address that matches nobody also notifies the office.
- **The code and the link** are valid for **Link and code lifetime** (120 minutes). Each works once. A new request cancels the last. The code works only in the browser that asked for it, and five wrong codes cancel the request. The link opens a confirm page first, so mail scanners can't spend it.
- **Limits.** One address may ask five times an hour, one person gets five emails a day, and one IP address may ask **Sign-in emails per IP address per hour** times (20). Set the IP limit to 0 when everyone reaches ChurchCRM through one address. Requests over a limit get the same page and no email, and are audited as throttled.
- **Sessions** end after **Idle time** (30 minutes), or when the browser closes, unless the member ticked **This is my own device**.
- **Remembered devices** stay signed in for **Keep me signed in** days (30), counted from the day the member ticked the box. Setting it to **0** removes the box and stops every device that is remembered now.
- **One sign-in per browser.** A member sign-in ends a staff session in the same browser, and a staff sign-in replaces a member session.
- **Sign-in emails are not kept** in the email history. The history records that a code was sent, not the code.

---

## The sign-in email

Whoever controls a person's email can sign in as that person, so ChurchCRM treats changes to it carefully. The first time someone signs in by email, ChurchCRM records the address as proven: below, *has signed in* means that has happened.

| Who changes it | What happens |
|---|---|
| The member, in the portal (**Profile → Update your details**) | The new address gets a confirmation link, and the change happens when the link is used. The old address gets a notice. |
| Staff with **Edit Records**, in the person editor or by import or API | Allowed. If the person has signed in, all their sessions and remembered devices end, the old address gets a notice with a confirm link, and the new address can't sign in until it is confirmed. Their passkeys stay. The person editor warns about this before you save. |
| Anyone, for a person with a staff account or a portal permission given by an administrator | Administrators only. For Edit Records staff the field is read-only, with a hint saying so. |

**Before a person's first sign-in,** the address on record is accepted as theirs: receiving the code at that address is the proof. That covers addresses staff, an import, the API or the registration form gave them, and a family email moved to the only living, active member of a one-person family.

**Unconfirmed addresses** receive mail at once but can't be used to sign in. An address is unconfirmed when staff, an import or the API replace the email of someone who has signed in, or when the upgrade moved a family email to a head of household or spouse in a family of two or more (everyone who reads that family mailbox would get the code). Saving the same address again doesn't confirm it. It is confirmed when:

- the member uses the link in the notice sent to their old address;
- the member signs in with a passkey and presses **Email me a confirmation link** on **Sign-in and devices**; or
- someone who has checked who the person is, in person or by phone, presses **Confirm Email Address** on the person's **Portal sign-in** card or in the **Email needs attention** list:
  - an address moved from the family email: staff with Edit Records, or an administrator;
  - a replacement address after the first sign-in: an administrator only (Edit Records staff could have set it, so they can't vouch for it too);
  - anyone with a staff account or a given portal permission: an administrator only.

Every change and confirmation is in the audit, with the old and new address, who made it, and how.

---

## The person's Portal sign-in card

Every person's page has a **Portal sign-in** card in the left column.

![The Portal sign-in card for an administrator: may sign in, last sign-in, a remembered device and a passkey, the person's portal permissions, Give a permission, Disable sign-in and Sign out everywhere](https://cdn.churchcrm.io/screenshots/en/desktop/person-portal-sign-in-card.png)

- **Staff with Edit Records** see whether the person may sign in (or why not, in plain words such as *"Their classification may not sign in"*), their last sign-in, how many remembered devices and passkeys they have, any unconfirmed email, and **Confirm Email Address** where the rules above allow it. *"Member sign-in is off for the church."* shows while it is off.
- **Administrators** also see each device and passkey, with a button to sign out a device or remove a passkey, the person's [portal permissions](./portal-permissions.md) grouped by where they come from, **Give a permission**, **Disable sign-in** and **Sign out everywhere**.

### Disable sign-in and Sign out everywhere

- **Disable sign-in** asks for a reason (only administrators see it) and then stops the person signing in anywhere, the Member Portal and the staff side alike. Every session ends on the next click, and their remembered devices and passkeys are removed. The card shows who turned it on, when, and why. **Enable sign-in** undoes it; devices and passkeys don't come back. You can't disable your own sign-in, nor that of the only administrator who can sign in.
- **Sign out everywhere** ends every session and signs out every remembered device. Passkeys stay, so the person can still sign in with one.

Both are in the audit.

---

## Login as User

Login as User lets an administrator see the Member Portal exactly as a member sees it, to help them with a problem.

1. On **Admin → Member Portal → Sign-in**, switch on **Allow Login as User** and save. It is off by default; while it is off, the menu item doesn't appear.
2. Open the person's page and choose **Actions → Login as User**, then confirm.
3. The portal opens as that person, with an amber banner on every page: *"You are logged in as \<name\>. Changes are turned off. Staff pages stay closed until you press Stop."*
4. Press **Stop** to return to your own staff session, on the person's page.

![Login as User: the amber banner with Stop above the member's portal home page](https://cdn.churchcrm.io/screenshots/en/desktop/portal-login-as-user.png)

- **Read-only by default.** Any save is refused with a message. Switch on **Allow changes during Login as User** to allow them; each change is then recorded with your name.
- **Grayed out**, with the reason on hover, for a person who is deceased, has Disable sign-in on, or has a staff account. Login as User never opens a staff account. It does work for an inactive person or someone the member rule leaves out, so you can see what they would see.
- While it runs, staff pages send you back to the portal until you press Stop, and **Admin Console** and **Change Password** are hidden. Signing out ends your own session too.
- The person's page and your own user page have a history card listing each session and every action taken. It doesn't count as the member's sign-in in the statistics.

---

## The audit

**Admin → Member Portal → Audit** records every member sign-in, refusal and change to sign-in, newest first: email requested, signed in (with how), refused and throttled (with the reason), session ended (with why), device remembered or signed out, passkey added or removed, email changed or confirmed, sign-in disabled or enabled, permission given or removed, Login as User started and stopped, and family confirmed (with which member confirmed). Filter by person, dates and event. It never holds a code, link or passkey.

![The Audit tab: a sign-in email requested, a code sign-in, a device remembered and a passkey added](https://cdn.churchcrm.io/screenshots/en/desktop/admin-member-portal-audit.png)

**A member says no code arrived.** Filter the audit by the address's owner, or look for the address:

- *Sign-in email requested* — the email was handed to your mail server; ask them to check spam.
- *The email could not be sent* — check the [email settings](./email-setup.md).
- *Refused* — the reason says why, for example *"Their email is shared with someone else"* or *"No person has this email"*.
- *Throttled* — they asked too often; they can try again in an hour, or the next day for the daily limit.

---

## Staff sign-in at /admin/

Staff sign in at `/admin/` with their username, password and two-factor code, as before. The member sign-in page has a small **Staff sign-in** link to it.

![The staff sign-in page at /admin/](https://cdn.churchcrm.io/screenshots/en/desktop/staff-sign-in.png)

- **The web root** sends a signed-out visitor to the member sign-in page, `/portal/login`. A staff session goes to the staff dashboard, and a member session to the portal.
- **Old links keep working.** `/session/begin` redirects to `/admin/`, including a sign-in form on a church website that posts there. Update bookmarks when convenient.
- **A signed-out staff page** goes to `/admin/` and returns to that page after sign-in.
- **Signed in at `/admin/`**, an administrator gets the Admin Dashboard and other staff go to the staff dashboard. Every other `/admin/…` page stays administrator-only.
- **Switching.** In a staff session, **Member Portal** in the user menu opens your own portal, and **Admin Console** in the portal's **Hello** menu goes straight back, without signing in again. **Change Password** and two-factor show in the portal only in a staff session. In a member session (email or passkey), **Admin Console** goes to the staff sign-in page, and only a staff sign-in there opens the staff side.

---

## After the upgrade

The upgrade that brings member sign-in changes these things. Take a backup before you upgrade: it is the only way back. See the [Upgrade Guide](./upgrade.md).

- **Self-service logins are removed.** Every user account whose only permission was *Edit Self* is deleted, and the person's timeline gets a *System Upgrade* note, *"Member Portal account removed by the upgrade"*. The person records stay. Their calendar subscriptions keep working, because the subscription moves to the person.
- **Member sign-in is off** until you turn it on. When self-service logins were removed, the Admin Dashboard says *"Member sign-in is off"* with how many people used to sign in, a **Turn on member sign-in** button and **Dismiss**.
- **Admin → System Users** lists staff accounts only, and the user editor no longer offers *Self-service only*. Read-only staff accounts are not touched.
- **Family emails move to people.** See [Email belongs to people](#email-belongs-to-people).
- **Staff sign in at `/admin/`.** `/session/begin` still works through a redirect.

---

## Email belongs to people

Families no longer have an email address of their own: email belongs to people, and that is also how members sign in. The upgrade moves each family's email:

1. If someone already has that address as their own email, nothing is copied. If that person is in another family, the family gets a timeline note.
2. Otherwise it goes to the **head of household**, if the head has no email of their own,
3. or else to the **spouse**, if the spouse has none. Only living, active people count; with more than one head or spouse, the oldest goes first.
4. If nobody can take it, the family gets a *System Upgrade* note in its timeline: *"The family email … was not moved to a person"*, with the reason (both already have an email, no living active head or spouse, or another person already uses it).

A moved address can be used to sign in at once in a one-person family. In a family of two or more it is [unconfirmed](#the-sign-in-email) until staff confirm it. The **Members** tab has a one-time **Family emails not moved** list, linking each family with a note, with counts of how many went to a head, to a spouse, were already held, and were noted.

After the upgrade:

- The family editor, the family page and the portal's family form have no family email. The family page lists each adult's own email instead. See [Families](../user-guide/families.md).
- Mail for a family goes to the head of household's own email, or the spouse's when the head has none. When neither has one, nothing is sent and the screen says why. See [Email](../user-guide/email.md).
- **A person without their own email has no email.** People who were reached only through the family address, mostly children, now are not. Group and cart mailing and notifications leave them out; the **Email needs attention** list shows who they are among the people who may sign in.
- The printed directory prints each person's own email; its *Family Email* option is gone.
- CSV import puts an email on the person; CSV export, public registration and the family API use people's own email. The family API no longer returns `Email` (see the [Private API reference](/api/private)).
- The **Duplicate Emails** report now lists exactly the shared personal addresses that stop people signing in.

---

## Related documentation

- [Member Portal administration](./member-portal.md) — every tab on Admin → Member Portal
- [Portal permissions](./portal-permissions.md) — what members can do in the portal, and giving a permission
- [Signing in to the Member Portal](../user-guide/member-sign-in.md) — for members
- [Email Setup](./email-setup.md)
- [Upgrade Guide](./upgrade.md)
