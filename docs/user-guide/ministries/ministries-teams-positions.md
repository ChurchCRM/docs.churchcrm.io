---
title: Ministries, teams and positions
sidebar_position: 2
description: Create a ministry, organise its teams, define the positions people serve in, and deactivate or delete a ministry you no longer run.
---

# Ministries, teams and positions

A **ministry** is the unit everything else hangs off: it owns its teams, positions, volunteer pool, schedules and a calendar of its own. Every **position** belongs to a **team**, and every ministry has at least one team.

:::note Not the same as a Group of type "Ministry"
A [Group](../groups.md) whose type is "Ministry" is just a group. A v2 ministry is created under **Ministries**, uses positions rather than group roles, and gets a pool Group of its own automatically. See [Volunteers: the pool and qualifications](./volunteers-and-qualifications.md).
:::

## Creating a ministry

Only an administrator or a user with **Manage Ministries** can create one (see [Who can do what](./permissions.md)).

1. Go to **Ministries → Dashboard**.
2. Click **New ministry**. The dialog explains: *"A ministry is created with its own calendar, volunteer pool and first team, so the only things to decide here are its name and what it does."*
3. Enter the **Ministry name** and a **Description**, then click **Create ministry**.

You land on the new ministry's page. Its first team (named after the ministry) and its pool Group already exist, and the ministry now has an entry under **Ministries** in the sidebar.

## The ministry page

**Ministries → *the ministry's name***, or `/ministries/{id}`. The header shows the name, an **Inactive** badge when the ministry is deactivated, and the lifecycle buttons described [below](#deactivating-reactivating-and-deleting). Six tabs follow:

| Tab | What it holds |
|---|---|
| **Overview** | Three counts (**Teams**, **Volunteers**, **Unfilled Positions**), the description, the **Teams** card and — for ministry managers — the **Ministry Coordinators** card. |
| **Positions** | The roles people serve in. |
| **Volunteers** | The pool and the qualification grid — see [Volunteers: the pool and qualifications](./volunteers-and-qualifications.md). |
| **Schedules** | The recurring patterns the ministry staffs — see [Schedules and occurrences](./schedules-and-occurrences.md). |
| **Occurrences** | The dated occurrences those schedules produced, with a **Filled** indicator each. |
| **Help Wanted** | A switch that puts the ministry on the Member Portal's Open Opportunities page, and the text shown there. |

![The ministry page, Overview tab](/img/user-guide/ministries/ministry-overview.png)

**Unfilled Positions** counts the open slots across every future occurrence of the ministry, so it is the quickest way to see whether the ministry is short of people.

### Help Wanted

The **Help Wanted** tab puts this ministry on the Member Portal **Open Opportunities** page, where any volunteer can see it and offer to help — they join the volunteer pool and you are emailed. Turn on **Show this ministry on the Open Opportunities page**, write what you want to say (line breaks are kept), and click **Save**.

A ministry also appears on that page when any of its active positions is marked **Recruit Volunteers** (see [Positions](#positions)), so you do not have to use this tab to advertise a specific role.

## Teams

Teams live in the **Teams** card on the **Overview** tab. Each row shows the name, description, **Team Leader**, the number of positions and an Active/Inactive status.

- **Add team** opens the team dialog: **Team name**, **Description**, **Team leader** and an **Active** switch.
- The row menu offers **Edit** and **Delete**. A team that still has positions or schedules cannot be deleted; move or delete those first.
- Turning a team's **Active** switch off keeps it, greyed, with its history.

The **Team leader** field is where a team leader is granted. Only a ministry manager sees the picker; a coordinator sees the current leader as read-only text. Clearing the field removes the leader. What a team leader can do is on [Who can do what](./permissions.md).

## Positions

A position is a role someone serves in — Espresso, Song Leader, Lead Teacher. The **Positions** tab lists them with **Order**, **Name**, **Description**, **Team**, **Recruiting**, **Self sign-up**, **Status** and an action menu.

![The Positions tab](/img/user-guide/ministries/ministry-positions.png)

**Add position** (and **Edit** in a row's menu) opens a dialog with:

| Field | Meaning |
|---|---|
| **Position name**, **Description** | The description is shown to volunteers on the Member Portal when the position is recruiting. |
| **Team** | Every position belongs to one team. |
| **Order** | Sort order on this tab and in staffing views. |
| **Active** | An inactive position is kept with its history but can no longer be staffed or advertised. Deactivate here rather than deleting a position that has been used. |
| **Recruit Volunteers** | *"Advertise this position on the Member Portal Open Opportunities page."* Off by default. |
| **Self-assignable** | On by default: qualified volunteers may sign themselves up for open dates of this position. Turn it off for positions only a team leader or coordinator should assign (the preacher is chosen, not signed up for); the Member Portal will not offer them. |

The row menu also offers:

- **Add Volunteers to Cart** — puts everyone qualified for the position into the [Cart](../cart.md), ready to email or export.
- **Delete** — removes the position outright. Prefer deactivating a position that has served on past occurrences.

A position nobody is qualified for cannot be staffed; the next step is the [Volunteers tab](./volunteers-and-qualifications.md).

## Ministry Coordinators

The **Ministry Coordinators** card on the Overview tab is shown to administrators and Manage Ministries users only. **Add coordinator** grants a person authority over this whole ministry — its teams, positions, schedules and every assignment in it. **Remove** takes it back.

Authority is given to the person, not to a login, so it can be granted before they have one. To actually open the ministry page, the coordinator's login also needs the **Manage My Ministries** permission — see [Who can do what](./permissions.md).

## Deactivating, reactivating and deleting

- **Deactivate** (on an active ministry) is offered to anyone who can open the page, including a coordinator on their own ministry. Nothing is removed: the ministry moves from the **Ministries** heading to the nested **Deactivated Ministries** group, its page shows an **Inactive** badge, and it contributes nothing to the [Ministry Dashboard](./ministry-dashboard.md).
- **Reactivate** (on a deactivated ministry) puts it back.
- **Delete** is shown on a deactivated ministry to administrators and Manage Ministries users only. The confirmation quotes how many occurrences and assignments will go with it, past service records included. Deleting removes the ministry's teams, positions, qualifications, schedules, occurrences, assignments, its pool Group and its calendar.

:::warning Delete is permanent
An active ministry cannot be deleted — deactivate it first, which is also the moment to change your mind. Once deleted, the ministry's service history is gone.
:::

## Related pages

- [Volunteers: the pool and qualifications](./volunteers-and-qualifications.md)
- [Schedules and occurrences](./schedules-and-occurrences.md)
- [Who can do what](./permissions.md)
- [Groups](../groups.md) — the ministry's pool Group
