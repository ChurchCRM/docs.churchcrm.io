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
- [Parent alerts (notifications)](#parent-alerts-notifications)
- [Managing kiosks](#managing-kiosks)
- [Device setup and best practices](#device-setup-and-best-practices)
- [Troubleshooting](#troubleshooting)
- [API reference](#api-reference)
- [Related docs](#related-documentation)

---

## At a glance

| What | Details |
|------|---------|
| **URL (device)** | `https://your-churchcrm-url/kiosk/` |
| **URL (admin)** | **Admin** → **Kiosk Manager** or `https://your-churchcrm-url/kiosk/admin` |
| **Registration window** | 30 seconds (enable in Kiosk Manager) |
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
   **Admin** → **Kiosk Manager** → turn **Enable New Kiosk Registration** **On**. You have 30 seconds.

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
| **Student cards** | Photo (or gender icon), name, age, check-in button; optional birthday icon. |
| **Birthday recognition** | Highlights today’s birthdays, upcoming (14 days), and recent (14 days). |
| **Parent Alert** | One-tap notification to parents (email, SMS, and/or OpenLP) for pickup/alert. |
| **Checkout All** | One tap to check out everyone in the class. |
| **No login on device** | Kiosk uses a cookie; no ChurchCRM user login on the tablet. |
| **Reload / Identify** | Admin can force reload or show an ID message on the kiosk screen. |
| **Heartbeat** | Device polls the server so it can receive reload/identify commands. |

---

## Prerequisites

Before setting up kiosks:

1. **Administrator access** to ChurchCRM.
2. **At least one future event** (start date ≥ today).
3. **A group linked to that event** — the kiosk roster is the event’s group. Without a group, the kiosk shows "No class members found."

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

1. Go to **Admin** → **Kiosk Manager**.
2. Turn **Enable New Kiosk Registration** **On**.
3. A **30-second** countdown starts. New devices must open the kiosk URL in this window to register.

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

- **Header** — Event title, group name, start/end time, counts (Here / Expected), **Checkout All** button.
- **Birthday banner** — Optional; shows students with birthdays in the next or past 14 days.
- **Left column** — "Waiting to Check In" (yellow); tap to check in.
- **Right column** — "Checked In" (green); tap **Parent Alert** or use **Checkout All**.

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

### Checkout All

- In the header, **Checkout All** moves every checked-in person back to "Waiting to Check In" and updates attendance with checkout time.
- Use it at the end of class.

---

## Parent alerts (notifications)

The **Parent Alert** button (bell) sends a message to parents that the teacher has requested attention (e.g. pickup, illness, behavior).

### Requirements

- The student must be **checked in** (button only shows for checked-in students).
- At least one notification method must be configured: **Email**, **SMS (Nexmo/Vonage)**, or **OpenLP**.

### What parents receive

- **Email/SMS**: Message that a notification was triggered by the classroom teacher.
- **OpenLP**: Alert can be shown on a projector/screen if OpenLP is configured.

### Configuring notification methods

| Method | Where | What to set |
|--------|--------|-------------|
| **Email** | **Admin** → **Edit General Settings** → **Email Settings** | SMTP host, port, user, password. See [Email Setup](/administration/email-setup). |
| **SMS** | **Admin** → **System Settings** → **Integration** | Nexmo API Key, API Secret, From Number. |
| **OpenLP** | **Admin** → **System Settings** → **Integration** | OpenLP URL, username, password (if used). |

When a teacher taps Parent Alert, all configured channels are used at once.

---

## Managing kiosks

### Kiosk Manager table

| Column | Meaning |
|--------|--------|
| **Id** | Internal kiosk ID. |
| **Kiosk Name** | Auto-generated name (e.g. `ipheec`); use it to match device to row. |
| **Assignment** | Current event (and group). Change via dropdown. |
| **Last Heartbeat** | Last time the device contacted the server. |
| **Accepted** | Whether the kiosk has been accepted. |
| **Actions** | Reload, Identify, Accept, Delete. |

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

### "No class members found" on the kiosk

- Edit the **event** and set **Group** to the correct class/roster.
- Ensure the group has **members**.
- Reload the kiosk (Reload button in Kiosk Manager).

### Student ages not showing

- Edit the **person** and set **Birth Year** (required for age). Month/day are optional.

### Parent Alert button not visible

- Student must be **checked in** (not just in "Waiting to Check In").
- At least one of **Email**, **SMS**, or **OpenLP** must be configured under **Admin** → **System Settings** → **Integration**.

### Kiosk not responding to Reload/Identify

- Check **Last Heartbeat**. If it’s old or "Never", the device may be off or offline.
- Confirm Wi‑Fi and that the kiosk tab is open and not sleeping.
- Manually refresh the browser on the device.

---

## API reference

For integrations and automation. All admin endpoints require an authenticated **administrator**.

### Admin API

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/kiosk/api/devices` | List all kiosk devices. |
| POST | `/kiosk/api/allowRegistration` | Open the 30-second registration window. |
| POST | `/kiosk/api/devices/{id}/reload` | Send reload command. |
| POST | `/kiosk/api/devices/{id}/identify` | Send identify command. |
| POST | `/kiosk/api/devices/{id}/accept` | Accept the kiosk. |
| POST | `/kiosk/api/devices/{id}/assignment` | Set assignment (body: `assignmentType`, `eventId`). |
| DELETE | `/kiosk/api/devices/{id}` | Delete the kiosk. |

### Device API (used by the kiosk browser)

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/kiosk/device/` | Main kiosk page. |
| GET | `/kiosk/device/heartbeat` | Heartbeat; returns pending commands. |
| GET | `/kiosk/device/activeClassMembers` | List of group members and check-in status. |
| GET | `/kiosk/device/activeClassMember/{id}/photo` | Member photo. |
| POST | `/kiosk/device/checkin` | Check in (body: `PersonId`). |
| POST | `/kiosk/device/checkout` | Check out (body: `PersonId`). |
| POST | `/kiosk/device/checkoutAll` | Check out all. |
| POST | `/kiosk/device/triggerNotification` | Parent alert (body: `PersonId`). |

### Example: activeClassMembers response

```json
{
  "People": [
    {
      "Id": 123,
      "FirstName": "John",
      "LastName": "Smith",
      "Gender": 1,
      "age": 8,
      "birthdayThisMonth": true,
      "birthdayUpcoming": true,
      "birthdayRecent": false,
      "birthdayToday": false,
      "birthDay": 15,
      "birthMonth": 2,
      "hasPhoto": true,
      "RoleName": "Student",
      "status": 0
    }
  ],
  "GroupName": "3rd Grade Sunday School",
  "notificationsEnabled": true
}
```

- **status**: `0` = not checked in, `1` = checked in.
- **age**: From birth year; can be null.
- **birthdayUpcoming** / **birthdayRecent** / **birthdayToday**: Used for birthday UI.
- **notificationsEnabled**: Whether any parent-alert channel is configured.

---

## Related documentation

- [Events](/user-guide/events) — Creating events and taking attendance
- [Groups](/user-guide/groups) — Creating groups and adding members
- [Email Setup](/administration/email-setup) — SMTP for parent alert email
- [Your First Week](/getting-started/first-week) — Day 6 covers email and reports
