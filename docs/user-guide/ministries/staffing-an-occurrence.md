---
title: Staffing an occurrence
sidebar_position: 5
description: Fill the positions for one date, record who said yes or no, and adjust this week's staffing needs.
---

# Staffing an occurrence

The staffing view answers *who is needed, who is on, and what is still short* for a single date. Reach it from the **Fill** button on the [Ministry Dashboard](./ministry-dashboard.md), from the date link on the ministry's **Occurrences** tab, from the **Manage staffing** link on an event, or by URL at `/ministries/occurrences/{id}`.

![The staffing view](/img/user-guide/ministries/occurrence-staffing.png)

## The header

The schedule name, the date and time, the ministry and team, and a **Scheduled** or **Cancelled** badge. For an occurrence linked to a calendar event the header names the event with *"Times come from this event"* and its location: change the event's time in the calendar and the occurrence follows.

## One card per position

Each card shows **filled / needed** and the people assigned, each with a status badge and a row menu. A position that is short carries a *"N still needed"* banner; one with nobody on it shows *Nobody assigned yet*.

| Status | Meaning |
|---|---|
| **Pending** | Assigned and asked to respond. Counts as filled. |
| **Accepted** | They said yes. |
| **Declined** | They said no; the slot is open again. |
| **Cancelled** | The coordinator took them off. The row stays, because it has history. |
| **Substituted** | Someone else took their place — see [Substitutions](./substitutions.md). |
| **Completed** | The occurrence has passed. |

### Assign a volunteer

Click **Assign** on a card. The **Assign a volunteer** dialog lists only people qualified for that position, *"whoever served least recently is listed first"* — that ordering is the rotation, with nothing to configure. People **In the volunteer pool** come first; anyone qualified but **Not in the pool** is listed under its own heading, with a note that assigning them adds them to this occurrence only.

![The Assign a volunteer picker](/img/user-guide/ministries/occurrence-assign.png)

Choosing someone who already holds another position on this occurrence shows a caution — *"… is already serving as Barista on this occurrence. You can still assign them."* — and nothing more: two positions in one service is a supported arrangement, and the warning exists so it is never an accident.

Click **Assign**. The card updates, the person is emailed (once background jobs run — see [Volunteer email and reminders](./email-and-reminders.md)), and their row shows **Pending** until they answer.

### Row menu

- **Record: they accepted** / **Record: they declined** — for a reply that came by phone or in the corridor. The confirmation says the response *"is saved as coming from you, not from them"*, and that is how it is kept in the history.
- **Send the assignment message again** — re-queues the assignment email.
- **Cancel assignment** — takes the person off; they are told and the slot reopens. The row stays visible.
- **View person** — opens their record.

## Edit staffing needs

**Edit staffing needs** in the card header changes how many of each position *this occurrence* needs — *"this week we need four"*. The dialog shows the same Min/Max rows as the schedule with the note *"These needs come from the schedule. Saving here changes this occurrence only."* Once saved, the occurrence *"has its own staffing needs, set apart from its schedule"*; **Use the schedule's needs** drops them and the occurrence follows its schedule again.

An occurrence whose schedule has no staffing needs shows *No staffing needs set* with a **Set staffing needs** button instead of position cards.

## Assigned outside the current plan

If a position is removed from the staffing plan after people were assigned to it, they are listed in a separate **Assigned outside the current plan** card so they are not lost. Cancel them or add the position back.

## Substitution requests

The **Substitution requests** card at the bottom lists proposals from volunteers on this occurrence, with **Approve** and **Reject** in the row menu. How that works is on [Substitutions](./substitutions.md).

## Cancelling an occurrence

An occurrence that will not happen can be cancelled (its status badge turns **Cancelled**); it stays in the list with its history and its **Assign** buttons are disabled. To remove dates entirely, tick them on the ministry's **Occurrences** tab and click **Delete**.

## Related pages

- [Schedules and occurrences](./schedules-and-occurrences.md)
- [Substitutions](./substitutions.md)
- [The Ministry Dashboard](./ministry-dashboard.md)
