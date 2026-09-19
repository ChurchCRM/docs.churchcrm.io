---
title: Volunteer email and reminders
sidebar_position: 9
description: The messages volunteers and coordinators receive, what makes them go out, and how to check that they did.
---

# Volunteer email and reminders

Volunteer Management v2 sends email at each step — to the volunteer when they are scheduled or reminded, and to the coordinator when something needs a decision. This page lists the messages and, more importantly, explains what makes them leave.

## The messages

Every subject is prefixed with the church name. Every body names the ministry, team and position, gives the date and time as your church shows it, the location when the linked event has one, and one sentence saying what to do next, with a button.

| Message | Who receives it | When |
|---|---|---|
| **You have been scheduled to serve** | the volunteer | when a coordinator assigns them, or a schedule's default fills them without *Set as Accepted* |
| **Reminder: you are scheduled to serve** | the volunteer | the configured number of hours before the occurrence (see below); once per assignment |
| **Thank you for signing up to serve** | the volunteer | when they sign themselves up on the Member Portal |
| **Your substitute request was approved** / **was not approved** | the volunteer *and* the proposed substitute | when a coordinator decides a [substitution](./substitutions.md) |
| **A volunteer has declined an assignment** | the coordinators | when a volunteer declines from the portal, with how many the position still needs and a **Fill this gap** button. Not sent when a coordinator records the decline themselves |
| **Volunteer positions still need to be filled** | the coordinators | when an upcoming occurrence is short, listing each position and count |
| **A volunteer has proposed a substitute** | the coordinators | naming both people, with a **Review this request** button |
| Someone offered to help | the coordinators | when a member clicks *"I'd like to help"* on the Open Opportunities page, with a **Qualify them for a position** button |

**Reply-To** is set so that replying reaches the right person: for messages to a volunteer, the team leader if the team has one, otherwise a ministry coordinator; for the decline and substitute alerts, the volunteer concerned. **From** is always the church address.

Every volunteer email is kept, with its body, in the person's **Email History** on their record.

## The reminder lead time

**Admin → Ministry Settings → Reminder lead time (hours)** says how many hours before an occurrence the reminder is sent. The default is **48**; set **0** to send no reminders at all. Reminders are not sent for cancelled assignments, and never twice.

## Nothing is sent until background jobs run

Clicking **Assign** does not send an email. Messages are **queued** at the moment of the action and delivered by ChurchCRM's background jobs, so a slow or unavailable mail server can never fail an assignment. That means:

- **Install the cron line.** Run the scheduled-task runner every 15 minutes: `0,15,30,45 * * * * /usr/bin/php /path/to/churchcrm/cli/timerjobs.php` (the exact line is shown on Ministry Settings). Without it, jobs only run on page loads, at most every 15 minutes, and reminders can be late.
- **Run background jobs now** on **Admin → Ministry Settings** sends whatever is queued and closes out finished occurrences immediately, without waiting for the next scheduled run.

## Checking delivery

The **Notification delivery** card on Ministry Settings shows:

- how many messages **could not be delivered after five attempts**, with the ten most recent failures (message, recipient, last attempt, error);
- how many messages are **waiting to be sent**;
- when **background jobs last ran**.

The [Ministry Dashboard](./ministry-dashboard.md) repeats the failed count for every coordinator, with a link to Ministry Settings for administrators.

A message that could not be attempted — the person has no email address (their family's address is used when they have none of their own), carries the do-not-email property, or **Enable email sending** is off in [Email Setup](../../administration/email-setup.md) — is recorded as **skipped**, not failed, and is never retried. A send that fails (the mail server refused it) is retried on later runs and counted as **failed** after the fifth attempt.

## Related pages

- [Email Setup](../../administration/email-setup.md)
- [Notifications](../../administration/notifications.md)
- [The Ministry Dashboard](./ministry-dashboard.md)
