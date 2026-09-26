---
title: Who can do what
sidebar_position: 10
description: Administrators, ministry managers, coordinators, team leaders and volunteers, and how each is granted.
---

# Who can do what

Volunteer Management v2 has five levels. Each one is decided in a different place, and they nest: everything a team leader may do, a coordinator of that ministry may do too, and so on up.

| Level | How you get it | What it lets you do |
|---|---|---|
| **Administrator** | the Admin flag on the user | everything |
| **Manage Ministries** | the **Manage Ministries** switch in the user editor (custom permissions) | a global ministry manager: every ministry — create, deactivate, delete, grant coordinators and team leaders, and everything below |
| **Ministry coordinator** | the **Manage My Ministries** switch in the user editor **plus** a coordinator grant on the ministry page | the Ministries heading, the dashboard and the pages of the ministries they coordinate; nothing over any other ministry. May deactivate their own ministry but not delete it, and may not grant coordinators |
| **Team leader** | a team grant (the **Team leader** field of the team dialog), on a staff *or* a member login | their team — its positions, schedules, staffing needs and assignments — from the Member Portal's **My Teams** pages; with Manage My Ministries on a staff login, also the Ministry Dashboard |
| **Volunteer** | any member | their own schedule and answers, proposing a substitute for their own dates, and signing up for open dates of positions they are qualified for |

## Where each is granted

- **Manage Ministries** and **Manage My Ministries** are switches on the user editor (**Admin → System Users → edit → Permissions → Custom → Grant individual permissions**), between *Manage Fundraisers* and *Manage Events*. The user page lists both. See [User Management](../../administration/users.md).

  ![The two switches in the user editor](/img/administration/user-editor-ministry-permissions.png)

- **Coordinators** are granted on the ministry page, **Overview → Ministry Coordinators → Add coordinator** (administrators and Manage Ministries users only).
- **Team leaders** are named in the **Team leader** field of the **Add team** / **Edit team** dialog on the same tab (same audience).

Grants are given to the *person*, not to a login, so they can be made before the person has one. A person whose login is self-service only keeps seeing just their own schedule in the Member Portal until an administrator widens their account: a self-service login is never a coordinator, whatever grants it holds, but it can lead a team.

A **Manage My Ministries** user who coordinates nothing yet sees the Permission Required page at the dashboard, which names the permission. Turning the switch off removes the Ministries heading.

## What each level sees

| Where | Administrator / Manage Ministries | Coordinator | Team leader (staff login) | Volunteer |
|---|---|---|---|---|
| Sidebar **Ministries** heading | Dashboard + every ministry | Dashboard + their ministries | Dashboard only | not shown |
| [Ministry Dashboard](./ministry-dashboard.md) | whole church | their ministries | their team's dates | — |
| [Ministry page](./ministries-teams-positions.md) | every ministry | their ministries | — (their team is on the portal's My Teams) | — |
| **New ministry**, **Delete**, **Add coordinator**, Team leader picker | yes | no | no | — |
| **Deactivate** / **Reactivate** a ministry | yes | their own | no | — |
| Assign, record responses, approve substitutes | everywhere | their ministries | their team | own dates only |
| Events of a ministry (create, edit, delete) | yes | their ministries, even without Add Events | no | — |
| **Admin → Ministry Settings** | administrators only | — | — | — |

The screen is not the gate: every action is checked on the server, so a URL typed by hand for another ministry lands on Access Denied.

## Related pages

- [User Management](../../administration/users.md)
- [Ministries, teams and positions](./ministries-teams-positions.md)
- [The Ministry Dashboard](./ministry-dashboard.md)
