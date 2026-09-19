---
title: Volunteer Management (v2)
sidebar_position: 1
description: Ministries, teams, positions, schedules, staffing, substitutions and volunteer email — the new way ChurchCRM organises who serves when.
---

# Volunteer Management (v2)

Volunteer Management v2 organises volunteering the way a church runs it. A **ministry** (Coffee Bar, Worship, Children's Church) has **teams**; every team has **positions** (Barista, Song Leader, Lead Teacher); people are **qualified** for positions and belong to the ministry's **volunteer pool**; a **schedule** turns a weekly service or a calendar event into dated **occurrences** with **staffing needs**; a coordinator **assigns** people, who accept, decline or propose a **substitute**; and reminders and alerts go out by email.

Members see their own side of it in the **Member Portal** — their schedule, the open dates they can sign up for, and the ministries asking for help. Those pages are described in the Member Portal guide; this section covers the coordinator's and administrator's side.

:::info Arrives in ChurchCRM 7.8.0
Volunteer Management v2 ships in ChurchCRM 7.8.0. It is **off by default**: an upgraded installation keeps the legacy [Volunteer Opportunities](../volunteers.md) feature until an administrator turns v2 on (see below).
:::

## Read this first: turning it on

Nothing described in this section exists until an administrator chooses it. Go to **Admin → Ministry Settings** and set **Volunteer experience** to one of:

| Choice | What it means |
|---|---|
| **V1 — Volunteer Opportunities (legacy)** | The default. Today's feature, unchanged: a list of opportunities under People → Admin, and a Volunteer tab on each person record. |
| **V2 — Ministries** | The new experience described in this section. The legacy Volunteer Opportunities pages are hidden (nothing is deleted). |
| **Both (transition)** | Both experiences at once. A person record shows a **Volunteer (Legacy)** tab beside the **Volunteer** tab. Use it while you move from V1 to V2. |

The same page holds the **reminder lead time**, shows email delivery health (failed and queued messages, when background jobs last ran, and the cron line to install) and has a **Run background jobs now** button. See [Volunteer email and reminders](./email-and-reminders.md) and the [Ministry Settings](../../administration/system-settings.md#ministry-settings) reference.

![Admin → Ministry Settings](/img/administration/ministry-settings.png)

Switching hides or shows pages and menu entries — it never deletes data, so you can switch back. The setting is system-wide, not per user.

## Where it lives

Once V2 or Both is chosen, a **Ministries** heading appears in the sidebar for anyone who may manage a ministry (see [Who can do what](./permissions.md)):

- **Dashboard** — the [Ministry Dashboard](./ministry-dashboard.md), "what needs your attention this week".
- **One entry per ministry** the viewer manages, opening the [ministry page](./ministries-teams-positions.md).
- **Deactivated Ministries**, nested under it, whenever any exist.

The pages in this section, in the order a coordinator meets them:

1. [Ministries, teams and positions](./ministries-teams-positions.md) — create a ministry, name its teams and the positions people serve in.
2. [Volunteers: the pool and qualifications](./volunteers-and-qualifications.md) — who serves in the ministry, and what each person can do.
3. [Schedules and occurrences](./schedules-and-occurrences.md) — the weekly pattern or calendar event, and the dated occurrences it produces.
4. [Staffing an occurrence](./staffing-an-occurrence.md) — fill the positions for one date, and record who said yes.
5. [Substitutions](./substitutions.md) — when a volunteer cannot make it and finds someone who can.
6. [The Ministry Dashboard](./ministry-dashboard.md) — gaps, unanswered assignments and substitution requests, in one place.
7. [Events and the calendar](./events-and-calendar.md) — how a ministry's schedule follows the church calendar.
8. [Volunteer email and reminders](./email-and-reminders.md) — the messages volunteers and coordinators receive, and what makes them go out.
9. [Who can do what](./permissions.md) — administrators, ministry managers, coordinators, team leaders and volunteers.

## The shortest walk-through

If you have twenty minutes:

1. **Ministries → Dashboard → New ministry.** Name it. It is created with its own calendar, volunteer pool and first team.
2. On the ministry page, **Positions → Add position** for each role (say, Barista and Host).
3. **Volunteers → Add Volunteer** a few people, then tick the positions each one can serve in.
4. **Schedules → Add schedule**, choose a weekly pattern or a calendar event type, set how many of each position are needed, and **Generate occurrences** — optionally naming who fills each position by default.
5. Back on the **Dashboard**, the dates that are still short appear under **Needs filling**. Click **Fill**, assign someone, and the gap is gone.

Everything else — responses, reminders, substitutions, the member's own pages — follows from those five steps.

:::note Legacy feature and migration
The legacy [Volunteer Opportunities](../volunteers.md) feature keeps working in V1 and Both. Its data is never touched by v2, and there is no automatic migration from opportunities to ministries yet; retiring V1 is tracked separately in ChurchCRM issue #9702.
:::
