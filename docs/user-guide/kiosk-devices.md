---
title: Kiosk Devices
sidebar_position: 14
---

# Kiosk Manager — Complete Guide

ChurchCRM's **Kiosk Manager** lets you run self-service check-in on tablets or kiosks for **any event with a linked group** — Sunday School, small groups, youth groups, Bible studies, and more. This guide covers setup, daily use, notifications, and troubleshooting.

:::tip All group types supported
Kiosk check-in is no longer limited to Sunday School classes. Any group can be used as a kiosk roster. The kiosk polls the server at an optimized rate for responsive reload and identify commands.
:::

---

## Table of contents

- [At a glance](#at-a-glance)
- [Quick start (4 steps)](#quick-start-4-steps)
- [How it works](#how-it-works)
- [Features overview](#features-overview)
- [Prerequisites](#prerequisites)
- [Registering and assigning a kiosk](#registering-and-assigning-a-kiosk)
- [Sunday School check-in view](#sunday-school-check-in-view)
- [Walk-in guests](#walk-in-guests)
- [Parent alerts (notifications)](#parent-alerts-notifications)
- [Managing kiosks](#managing-kiosks)
- [Device setup and best practices](#device-setup-and-best-practices)
- [Troubleshooting](#troubleshooting)
- [Related docs](#related-documentation)

---

## At a glance

| What | Details |
|------|---------|
| **URL (device)** | `https://your-churchcrm-url/kiosk/` |
| **URL (admin)** | **Groups → Admin → Kiosk Manager** |
| **Registration window** | 2 minutes. The switch is **Enable new kiosk registration**. |
| **Who can manage** | Administrators only |
| **Assignment** | One event per kiosk; event must have a **group** linked (any group type) |
| **Heartbeat** | Device polls server at an optimized rate for faster reload/identify response |
| **Supported groups** | All group types — Sunday School, small groups, youth groups, Bible studies, etc. |

---

## Quick start (4 steps)

1. **Create an event with a group**  
   **Events** → **Add Church Event** → set **Group** to the class/roster. Save.  
   (Only **future** events appear for kiosk assignment.)

2. **Enable registration**  
   **Groups → Admin → Kiosk Manager** → turn on **Enable new kiosk registration**. The window is 2 minutes. The heading on that row is **Register New Device**.

3. **Register the device**  
   On the tablet/kiosk, open a browser and go to `https://your-churchcrm-url/kiosk/`. The device registers and shows "Awaiting Acceptance."

4. **Accept and assign**  
   In Kiosk Manager, find the new kiosk, click **Accept**, then in **Assignment** choose your event. The kiosk will show the check-in screen for that event’s group.

---

## How it works

1. **Registration** — A device visits the kiosk URL while registration is enabled and gets a unique **Kiosk Name** and a cookie. No login is required on the device.
2. **Acceptance** — An admin accepts the device in Kiosk Manager so it can receive an assignment.
3. **Assignment** — The admin assigns the kiosk to one **event**. The event must have a **group**; the kiosk shows that group’s members for check-in.
4. **Check-in** — On the kiosk, teachers (or volunteers) tap to check in/out students. Attendance is stored for the event.
5. **Parent alerts** — For checked-in students, teachers can trigger a notification (email, SMS, or OpenLP) to parents.

---

## Features overview

| Feature | Description |
|--------|-------------|
| **Two-column layout** | "Waiting to Check In" (left) and "Checked In" (right); tablet-optimized. |
| **Alphabetical order** | Both columns list members sorted by last name, then first name. |
| **Student cards** | Photo (or gender icon), name, age, check-in button; optional birthday icon. |
| **Birthday recognition** | Highlights today’s birthdays, upcoming (14 days), and recent (14 days). |
| **Parent Alert** | One-tap notification to parents (email, SMS, and/or OpenLP) for pickup/alert. |
| **Check-in By** | Optional toggle in the kiosk header; when enabled, prompts for the authorized adult on each check-in and check-out. |
| **Checkout all students** | Floating button (tooltip **Checkout all students**) that checks out everyone still checked in. It is not a header button. |
| **Register Walk-In Guest** | Person-plus button on the check-in screen. Staff register someone who is not on the group roster and check them in to the current event. New in 7.8.0. |
| **No login on device** | Kiosk uses a cookie; no ChurchCRM user login on the tablet. |
| **Reload / Identify** | Admin can force reload or show an ID message on the kiosk screen. |
| **Heartbeat** | Device polls the server so it can receive reload/identify commands. |

---

## Prerequisites

Before setting up kiosks:

1. **Administrator access** to ChurchCRM.
2. **At least one future event** (start date ≥ today).
3. **A group linked to that event** — the kiosk roster is the event’s group. Without a group, the kiosk shows "No Group Members Found."

### Creating an event for kiosk check-in

1. **Events** → **Add Church Event** (or **List Event Types** first if you need a type).
2. Set **Title**, **Start/End date and time** (must be in the future for assignment).
3. In **Group**, select the group that is the class roster (e.g. "3rd Grade Sunday School").
4. Save.

:::important Group is required
The kiosk displays **group members** as the check-in list. If the event has no group, the kiosk cannot show anyone to check in.
:::

:::note Future events only
Only events with a **future** start date appear in the Kiosk Manager assignment dropdown. Past events are hidden.
:::

---

## Registering and assigning a kiosk

### Step 1: Enable registration

1. Go to **Groups → Admin → Kiosk Manager**.
2. Turn on **Enable new kiosk registration**.
3. A 2-minute window opens. The device must open the kiosk URL during that window.

### Step 2: Open the kiosk URL on the device

On the tablet or kiosk:

1. Open a browser (Chrome, Firefox, Safari).
2. Go to: `https://your-churchcrm-url/kiosk/`.
3. The device registers and gets a unique name (e.g. `ipheec`).
4. The screen shows **"Awaiting Acceptance"** and instructions for the admin.

### Step 3: Accept the kiosk

1. In **Kiosk Manager**, find the new row (match **Kiosk Name** to the device).
2. Click **Accept** (green checkmark).
3. The kiosk screen updates and the **Assignment** dropdown becomes available.

### Step 4: Assign to an event

1. In the **Assignment** column, open the dropdown.
2. Choose the event (and group) for this kiosk.
3. The kiosk loads that event’s group and shows the check-in interface.

If the dropdown is empty, create a **future** event with a **group** and refresh Kiosk Manager.

---

## Sunday School check-in view

### Layout

- **Header** — Event title, group name, start/end time, and counts (Here / Expected). Checkout-all is not a header button. It is the floating button whose tooltip is **Checkout all students**.
- **Birthday banner** — Optional; shows students with birthdays in the next or past 14 days.
- **Left column** — "Waiting to Check In" (yellow); members listed alphabetically by last name, then first name. Tap to check in.
- **Right column** — "Checked In" (green); also sorted alphabetically. Tap **Parent Alert**, or use the floating button whose tooltip is **Checkout all students**.

### Student cards

Each person has:

- **Photo** (if set) or **gender icon**.
- **Name**; optional birthday cake icon.
- **Age** (if birth year is set).
- **Check-in** (green arrow) when waiting; **Parent Alert** (bell) when checked in.

### Birthday states

| State | Appearance |
|-------|------------|
| **Today** | Gold card, "Today!" badge. |
| **Upcoming** | Green card, "Turning [age]" (next 14 days). |
| **Recent** | Gray card (past 14 days). |

### Checkout all students

The floating button tooltip is **Checkout all students**. It is not a header button labeled Checkout All. Use it at the end of class to check out everyone who is still checked in.

### Recording who checks a child in/out (Check-in By)

The **Check-in By** feature is controlled by a toggle labeled **Check-in By** in the kiosk header (the switch in the top-right area of the kiosk header, below the Here/Expected counts). The toggle is **off by default** and its state is saved per browser, so each device can be configured independently.

When the toggle is **on**, tapping to check a child **in** or **out** shows a prompt:

- **Check in:** *"Who is bringing in [name]?"*
- **Check out:** *"Who is picking up [name]?"*

The prompt lists the **adult family members** of that child as selectable buttons — each shows a photo if one is on record, or a person icon otherwise. Tap a name to record who is responsible for that transaction. Tap **Skip** to check in/out without recording a responsible adult. Closing the prompt with the X, pressing Escape, or tapping outside it **cancels** the check-in/out entirely — the child’s attendance status does not change.

The name selected is stored on the attendance record as the authorized adult for that transaction.

**Who appears in the picker?**

| Condition | Result |
|-----------|--------|
| Family member has a complete, valid birth date on record | Shown if age ≥ 18 |
| Family member has no birth date on record | Shown if their family role is Head or Spouse (roles are set under **People → Admin → Family Roles**) |
| The child being checked in | Always excluded |

The list is sorted alphabetically by last name, then first name.

:::note
If no eligible adults are found for the child’s family, the prompt closes automatically and the check-in/out proceeds without recording a responsible adult. See [**"Check-in By" picker shows no one or the wrong people**](#check-in-by-picker-shows-no-one-or-the-wrong-people) in Troubleshooting if the picker is unexpectedly empty.
:::

---

## Walk-in guests

:::note New in 7.8.0
Registering a walk-in guest from the kiosk ships in ChurchCRM **7.8.0**. It is not in ChurchCRM 7.7.1.
:::

Use this when someone arrives who is not a member of the event’s group. Staff stay on the kiosk: the guest is created and checked in to the current event in one step. This does not add a Members / Visitors / Total head count on the event, and it does not print a name tag.

The person-plus button (tooltip **Register walk-in guest**) is one of the floating buttons on the check-in screen. It is shown only when the event has a linked group and check-in is open — from one hour before the event starts until the event ends. Outside that window, or when the event has no group, the button is hidden. The server refuses the same cases.

### Register Walk-In Guest

Tap the button. The dialog title is **Register Walk-In Guest**. It says **A phone number or email address is required.**

| Field | Required | Rules |
|-------|----------|--------|
| **First Name** | Yes | 2–50 characters |
| **Last Name** | Yes | 2–50 characters |
| **Birth Year** | No | 1900 through the current year |
| **Birth Month** | No | January–December |
| **Birth Day** | No | 1–31; an impossible date is rejected |
| **Phone** | One of phone or email | Either field may be filled; both may be filled |
| **Email** | One of phone or email | Must be a valid email address when it is filled in |

**Cancel** closes the dialog without creating a person. **Register & Check In** submits the form. While the request is in progress the button shows **Registering...** and ignores a second tap or the Enter key. On success the dialog closes and a notice says the person was registered and checked in. If the group roster was empty, the kiosk reloads so the new guest appears.

If both contact fields are empty, the form shows **A phone number or email address is required**. A name shorter than 2 characters, a name longer than 50 characters, an invalid email, or an invalid birth date is rejected and no person is saved.

### How a guest appears

- **Checked In column** — amber border and a **Guest** badge. The row stays after a refresh. Check the guest out and back in the same way as anyone else on the list.
- **People → Self Registrations** — the guest is saved as a pending self-registration and shows a **Pending review** badge until a staff member approves the record. Approving clears that badge. The guest stays checked in.
- **Person timeline** — **Registered as a walk-in guest at the kiosk during event:** followed by the event title, then **Checked in to event:** followed by the event title.
- **Event attendance** — the guest is on the event’s checked-in list even though they are not a member of the linked group.

The guest is not added to the group.

### Guest Classification

On **Admin → Kiosk Manager**, administrators see a **Kiosk Settings** card with **Guest Classification**. It defaults to **Guest**. Any person classification can be selected. Users who can open Kiosk Manager but are not administrators do not see this card.

New walk-in guests receive that classification. If the selected classification is later removed, later guests are saved with no classification.

---

## Parent alerts (notifications)

The **Parent Alert** button (bell) sends a message to parents that the teacher has requested attention (e.g. pickup, illness, behavior).

### Requirements

- The student must be **checked in** (button only shows for checked-in students).
- At least one notification method must be configured: **Email**, **SMS (Vonage)**, or **OpenLP**.

### What parents receive

- **Email/SMS**: Message that a notification was triggered by the classroom teacher.
- **OpenLP**: Alert can be shown on a projector/screen if OpenLP is configured.

### Configuring notification methods

| Method | Where | What to set |
|--------|--------|-------------|
| **Email** | **Communication → Email** | See [Email Setup](/administration/email-setup). |
| **SMS** | **Admin → Plugins** | Turn on the Vonage plugin and enter the Vonage API key, secret, and from number. This is not under System Settings → Integration, and the plugin is not named Nexmo. |
| **OpenLP** | **Admin → System Settings → Integration** | OpenLP URL, username, and password, if you use OpenLP. |

When a teacher taps Parent Alert, all configured channels are used at once.

---

## Managing kiosks

### Kiosk Manager table

| Column | Meaning |
|--------|--------|
| **Status** | **Pending**, **Online**, or **Offline**. |
| **Kiosk Name** | The device name, with **Last seen** under it. |
| **Assignment** | The event assigned to this kiosk. |
| **Actions** | **Accept**, **Rename**, **Reload**, **Identify**, and **Delete**. |

Administrators also see **Kiosk Settings** above the device table. **Guest Classification** there is the classification applied to [walk-in guests](#walk-in-guests).

### Actions

| Action | Use |
|--------|-----|
| **Reload** | Force the kiosk to refresh (e.g. after changing assignment). Takes effect on next heartbeat. |
| **Identify** | Show an on-screen message on that kiosk so you can match it to the row. |
| **Accept** | Allow a newly registered kiosk (only for unaccepted devices). |
| **Delete** | Remove the kiosk. The device must be re-registered to use again. |

---

## Device setup and best practices

### Recommended browser settings

- **Full screen** (e.g. F11).
- **Kiosk URL as homepage** so the device opens the right page.
- **Disable browser notifications** to avoid popups.
- **Auto-start browser** on boot if the device is dedicated to the kiosk.

### Chrome kiosk mode (optional)

```bash
chrome --kiosk https://your-churchcrm-url/kiosk/
```

### Device and placement

- **Tablet in landscape** gives the best two-column layout.
- Place the device where teachers can reach it without leaving the room.
- Use a **stand or wall mount** so the screen is stable and visible.
- For **shared tablets**, consider a short timeout or lock so the browser doesn’t get closed.

### Network and power

- Use **stable Wi‑Fi** (same network as the ChurchCRM server).
- **Power** the device so it doesn’t sleep during service (or disable sleep when the browser is open).

### Security

- Put kiosks in **supervised** areas.
- Use a **dedicated device account** with limited OS permissions.
- **Lock down** the browser (e.g. no address bar, no settings) if possible.
- For expensive hardware, consider a **locked enclosure**.

---

## Troubleshooting

### "This kiosk has not been accepted"

- In **Kiosk Manager**, find the kiosk and click **Accept**.

### Kiosk won’t register

- Ensure **Enable New Kiosk Registration** is **On** and you’re within the 30-second window.
- Open the kiosk URL **on the device** during that window.
- Clear **cookies** for the site on the device and try again.
- Confirm the device can reach `https://your-churchcrm-url`.

### "401 Unauthorized" on the device

- Registration has expired. Turn **Enable New Kiosk Registration** **On** again and reload the kiosk page quickly.

### No events in the Assignment dropdown

- Create an event with a **future** start date and a **group**.
- Refresh Kiosk Manager; new events should appear.

### "No Group Members Found" on the kiosk

- Edit the **event** and set **Group** to the correct class/roster.
- Ensure the group has **members**, or use **Register Walk-In Guest** when check-in is open.
- Reload the kiosk (Reload button in Kiosk Manager).

### Register walk-in guest button is missing

- The event needs a **linked group**. Without one, the button stays hidden and the server will not create a guest.
- Check-in opens **one hour before** the event start and closes when the event ends. Before that window the kiosk shows a countdown; after it, the event has ended. The button is hidden in both cases.
- Refresh the kiosk after assigning the event in Kiosk Manager.

### Student ages not showing

- Edit the **person** and set **Birth Year** (required for age). Month/day are optional.

### Parent Alert button not visible

- Student must be **checked in** (not just in "Waiting to Check In").
- At least one of **Email**, **SMS**, or **OpenLP** must be configured under **Admin** → **System Settings** → **Integration**.

### Kiosk not responding to Reload/Identify

- Check **Last Heartbeat**. If it’s old or "Never", the device may be off or offline.
- Confirm Wi‑Fi and that the kiosk tab is open and not sleeping.
- Manually refresh the browser on the device.

### "Check-in By" picker shows no one or the wrong people

The picker only lists adult members of the child’s family. If it appears empty or is missing someone, check:

- **Birth date not set** — A family member with no birth date on record falls back to their family role. If their role is not Head or Spouse (roles are under **People → Admin → Family Roles**), they are excluded. Either add a birth date that shows they are 18 or older, or update their role to Head or Spouse.
- **Under 18** — A family member with a birth date on record is only shown if they are 18 or older. Verify the birth year is correct on the family member’s person record.
- **Wrong family** — Confirm the child is linked to the correct family (**People** → open the person → **Family** tab).
- **No family record** — If the child has no family in ChurchCRM, the picker has no one to show. Link the child to a family to enable the Check-in By feature.

---

## For developers

Kiosk admin endpoints (listing devices, accepting, assigning, reloading) are documented in the [Private API reference](/api/private). All admin endpoints require an authenticated administrator.

---

## Related documentation

- [Events](/user-guide/events) — Creating events and taking attendance
- [Groups](/user-guide/groups) — Creating groups and adding members
- [Email Setup](/administration/email-setup) — SMTP for parent alert email
- [Your First Week](/getting-started/first-week) — Day 6 covers email and reports
