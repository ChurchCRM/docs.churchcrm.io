---
title: Volunteer email and reminders
sidebar_position: 9
description: The messages volunteers and coordinators receive, what makes them go out, and how to check that they did.
---

# Volunteer email and reminders

Volunteer Management v2 sends email at each step — to the volunteer when they are scheduled or reminded, and to the coordinator when something needs a decision. This page lists the messages and, more importantly, explains what makes them leave.

## The messages

Every subject is prefixed with the church name. A message about a date names the ministry, team and position (the gap alert lists the positions still short instead), gives the date and time as your church shows it and the location when the linked event has one, and ends with one sentence saying what to do next, with a button.

| Message | Who receives it | When |
|---|---|---|
| **You have been scheduled to serve** | the volunteer | when a coordinator assigns them, when a schedule assigns them as one of its default volunteers without *Set as Accepted* (on Save, Generate, Staff them or the daily top-up), and when a [substitution](./substitutions.md) that names them is approved |
| **Reminder: you are scheduled to serve** | the volunteer | the configured number of hours before they start serving (see below); once per assignment |
| **Thank you for signing up to serve** | the volunteer | when they sign themselves up on the Member Portal |
| **Your substitute request was approved** / **was not approved** | the volunteer *and* the proposed substitute | when a coordinator decides a [substitution](./substitutions.md) |
| **A volunteer has declined an assignment** | the team leader and the ministry coordinators | when a volunteer declines from the portal, with how many the position still needs and a **Fill this gap** button. Not sent when a coordinator records the decline themselves |
| **Volunteer positions still need to be filled** | the team leader and the ministry coordinators | when a decline leaves the date short (also one a coordinator recorded), listing each position still short, with a **Fill this gap** button. At most once a day per date |
| **A volunteer has proposed a substitute** | the team leader and the ministry coordinators | naming both people, with a **Review this request** button |
| **(name) wants to help with (ministry)** | the ministry coordinators, or every administrator and Manage Ministries user when the ministry has none | when a member clicks *"I'd like to help"* on the Open Opportunities page, with a **Qualify them for a position** button |

*The team leader* is the leader of the team the date belongs to. A ministry with no team leader and no coordinator gets no decline, gap or substitute alerts.

In these alerts, **Fill this gap** opens the date's [staffing view](./staffing-an-occurrence.md) and **Review this request** opens the [Ministry Dashboard](./ministry-dashboard.md). A team leader whose login lacks **Manage My Ministries** cannot open those pages, so for them both buttons open the same date on the Member Portal's **My Teams**, where they can fill it and answer the request.

**Reply-To** is set so that replying reaches the right person: for messages to a volunteer, the team leader if the team has one, otherwise a ministry coordinator; for the decline and substitute alerts, the volunteer concerned; for an offer to help, the person offering. The gap alert has none, and none is set when that person has no email address or does not want email. **From** is always the church address.

Every volunteer email that is sent is kept, with its body, in **Email History**, on the record whose email address it went to.

## The reminder lead time

**Admin → Ministry Settings → Reminder lead time (hours)** says how many hours before an occurrence the reminder is sent. It counts back from the volunteers' start time, so a schedule whose volunteers start 45 minutes before the service sends the reminder 45 minutes earlier too. The default is **48**; set **0** to send no reminders at all. Reminders are not sent for cancelled assignments, and never twice.

## Nothing is sent until background jobs run

Clicking **Assign** does not send an email. Messages are **queued** at the moment of the action and delivered by ChurchCRM's background jobs, so a slow or unavailable mail server can never fail an assignment. That means:

- **Install the cron line.** Run the scheduled-task runner every 15 minutes: `0,15,30,45 * * * * /usr/bin/php /path/to/churchcrm/cli/timerjobs.php` (the exact line is shown on Ministry Settings). Without it, jobs only run on page loads, at most every 15 minutes, and reminders can be late.
- **Run background jobs now** on **Admin → Ministry Settings** tops up every schedule, sends what is due (up to 50 messages a run) and closes out finished occurrences immediately, without waiting for the next scheduled run.

The same background jobs run the daily schedule top-up (see [The scheduling horizon and the daily top-up](./schedules-and-occurrences.md#the-scheduling-horizon-and-the-daily-top-up)), so a missing cron line also delays new occurrences.

## Checking delivery

The **Background jobs and delivery** card on Ministry Settings shows:

- how many messages **could not be delivered after five attempts**, with the ten most recent failures (message, recipient, last attempt, error);
- how many messages are **waiting to be sent**;
- when **background jobs last ran**;
- when **schedules were last topped up**, with how many occurrences that made and how many default volunteers it assigned or skipped.

The [Ministry Dashboard](./ministry-dashboard.md) shows each coordinator the failed count for the dates in its window, with a link to Ministry Settings for administrators.

A message that could not be attempted is recorded as **skipped**, not failed, and is never retried: the person has no email address (their family's address is used when they have none of their own) or carries the do-not-email property, email is not set up (**Enable Email** is off, or no SMTP server is set, in [Email Setup](../../administration/email-setup.md)), the date or its ministry was deleted, or a reminder's date has already passed. A send that fails (the mail server refused it) is retried on later runs and counted as **failed** after the fifth attempt.

## Related pages

- [Email Setup](../../administration/email-setup.md)
- [Notifications](../../administration/notifications.md)
- [The Ministry Dashboard](./ministry-dashboard.md)
