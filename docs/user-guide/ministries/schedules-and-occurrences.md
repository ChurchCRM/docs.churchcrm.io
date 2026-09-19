---
title: Schedules and occurrences
sidebar_position: 4
description: Turn a weekly pattern or a calendar event into dated occurrences with staffing needs, and fill them by default in one step.
---

# Schedules and occurrences

A **schedule** is the recurring pattern a ministry staffs — a weekly service, a Wednesday class. Its **occurrences** are the individual dates. Everything downstream (assignments, reminders, the dashboard's gaps) hangs off occurrences, so this is the step that makes the ministry real.

## Adding a schedule

On the ministry page, open the **Schedules** tab and click **Add schedule**.

![The Schedules tab](/img/user-guide/ministries/ministry-schedules.png)

| Field | Meaning |
|---|---|
| **Schedule name** | Shown on occurrences, the dashboard and in email. |
| **Team** | Every schedule belongs to one of the ministry's teams; its positions are what the schedule can ask for. |
| **Where the dates come from** | **An existing calendar event type** or **A weekly pattern of its own** — see below. |
| **Event type** and **Event** | For a calendar-linked schedule. The **Event** list offers each event series of the type (for example *"Sunday Gathering (5 upcoming)"*) with **Any event of this type** first. |
| **Day of the week**, **Starts**, **Ends** | For a weekly pattern of its own. |
| **First date**, **Last date** | The window the schedule covers. Leave **Last date** empty for an open-ended schedule. |
| **Active** | An inactive schedule generates nothing. |
| **Staffing needs** | One row per position of the team, each with **Min** and **Max**. Uncheck a position the schedule never uses. |

**Staffing needs** are what makes an occurrence have gaps: a schedule with none produces occurrences that need nobody. Raising **Min** above **Max** pulls Max up with it; setting Max below Min is refused.

### Calendar event type or weekly pattern?

- **An existing calendar event type** ties the schedule to the church [calendar](../events.md). One occurrence is made for each date of the chosen event; *"Any event of this type"* follows every event of the type, which can be several on the same day. The event stays authoritative for date and time: move the event, and the occurrence moves with it. See [Events and the calendar](./events-and-calendar.md).
- **A weekly pattern of its own** carries its own day and times and needs no calendar event.

Whichever you choose, ChurchCRM never creates calendar events for you.

## Generating occurrences

A schedule produces nothing until you generate. In the row's action menu choose **Generate occurrences**.

![The Generate occurrences dialog](/img/user-guide/ministries/generate-occurrences.png)

The dialog lists each position in the schedule's staffing plan with **Fill by default with** — qualified people only, least recently served first, grouped *In the volunteer pool* / *Not in the pool*. Choose someone, and they are assigned on every occurrence this run creates and asked to respond; tick **Set as Accepted** to record their acceptance as well, so they are not asked (reminders still go). **Leave open** to assign a position week by week. A position nobody is qualified for says so and stays open.

Click **Generate**. The notification reports the result, for example *"8 occurrences created, 0 were already there"* and *"16 volunteers assigned"*.

Generation is **idempotent**: running it again over the same window reports *"0 occurrences created, 8 were already there"* and assigns nobody new. Defaults are applied only to the occurrences the run creates, so re-running never touches dates that already exist. The window is the schedule's **generate ahead** span (56 days by default) from today, and a single run is capped at 366 occurrences.

## The Occurrences tab

The **Occurrences** tab of the ministry page lists the dates every schedule produced.

![The Occurrences tab](/img/user-guide/ministries/ministry-occurrences.png)

- **Team**, **Event**, **From** and **To** above the table narrow the list as you type or pick. *From* defaults to today; leave *To* empty to see everything ahead, or move *From* back to see the past.
- Columns: a tick box, **When**, **Team**, **Schedule** and **Filled**. Click the date to open [the staffing view](./staffing-an-occurrence.md).
- The **Filled** icon summarises the date at a glance; the words are in its tooltip:

| Icon | Meaning |
|---|---|
| Green check | Every position is filled and confirmed. |
| Amber hourglass | Every position is assigned, but someone has not answered yet. |
| Red triangle | At least one position is still unassigned — the tooltip names what is short. |
| Grey question mark | No staffing needs set, so there is nothing to fill. |

- Tick one or more rows and click **Delete** (it reads *Delete (N)*) to remove them. Assignments on those dates go with them.
- **Add occurrence** creates a one-off date *"for a date that follows no calendar event and no schedule"*: name, team, date, start and end times, and its own staffing needs. It is listed with a **one-off** badge; it does not appear on the Schedules tab, and deleting it leaves nothing behind.

## Editing and deleting a schedule

**Edit** in the row menu changes the pattern, the window and the staffing needs. Changing the staffing needs applies to every occurrence that follows the schedule, past and future, unless an occurrence has its own overrides (see [Edit staffing needs](./staffing-an-occurrence.md#edit-staffing-needs)).

**Delete** removes the schedule and its occurrences. A schedule whose occurrences carry assignments cannot be deleted; delete or cancel those occurrences first.

## Related pages

- [Staffing an occurrence](./staffing-an-occurrence.md)
- [Events and the calendar](./events-and-calendar.md)
- [The Ministry Dashboard](./ministry-dashboard.md)
