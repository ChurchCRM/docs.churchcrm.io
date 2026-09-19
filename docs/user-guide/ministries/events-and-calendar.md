---
title: Events and the calendar
sidebar_position: 8
description: How a ministry's schedule follows the church calendar, and what a coordinator may do with events.
---

# Events and the calendar

A ministry can staff the events already on the church [calendar](../events.md). Nothing about existing events changes when Volunteer Management v2 is switched on; the pieces below appear only while it is on.

## The Volunteer Ministry field on an event

In the event editor (and in the calendar's offcanvas editor), under **Show more options**, a **Volunteer Ministry** dropdown sits directly beneath **Linked Group**. It lists the ministries the editor may manage, with **No ministry** first. Picking a ministry links the event to it.

A schedule of that ministry that follows *"an existing calendar event type"* then produces one occurrence per date of the event — see [Schedules and occurrences](./schedules-and-occurrences.md). The event stays in charge of the date and time: move or re-time the event and the occurrence follows. ChurchCRM never creates or edits calendar events on the ministry's behalf.

Each ministry also has a calendar of its own, listed under **Ministry Calendars** on the Calendar page's calendar picker.

## The Volunteers card on the event view

An event with volunteer occurrences shows a **Volunteers** card on its detail page: the ministry, the schedule, *"N of M filled"* and a badge — *"N still needed"*, **Fully staffed**, or **No staffing needs set** — with a **Manage staffing** link to the [staffing view](./staffing-an-occurrence.md). An event with no volunteer schedule shows no card at all.

## Coordinators and events

Normally only users with **Add Events** may create and edit events. A ministry coordinator (or a Manage Ministries user) without that permission may nevertheless create and edit events **of their ministry**: the **Add Church Event** entry appears for them, the Volunteer Ministry field lists only their ministries and must be set, and they can edit, re-time, deactivate and delete those events — and no other. An event with no ministry, or another ministry's event, is refused.

## Deleting an event

Deleting a calendar event does not delete the volunteer occurrence that followed it. The occurrence keeps its date, its people and its history; only the *"Times come from this event"* link disappears.

## Related pages

- [Events](../events.md)
- [Schedules and occurrences](./schedules-and-occurrences.md)
- [Who can do what](./permissions.md)
