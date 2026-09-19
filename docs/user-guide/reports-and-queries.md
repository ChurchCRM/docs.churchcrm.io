---
title: Reports & Queries
sidebar_position: 19
---

# Reports and Queries

ChurchCRM provides built-in reports and database queries to help you extract and analyze your church data.

---

## Overview

| Type | Purpose |
|------|--------|
| **Reports** | Pre-formatted documents ready for printing (directories, labels, letters) |
| **Queries** | Database searches that return lists of [people](Persons) or [families](Families) |

> **Tip:** Many query results can be added to the [Cart](Cart) for further processing.

---

## Built-in Reports

### Contact & Directory Reports
- **Contact Lists** - Phone and email lists
- **People Directory** - Printable directory grouped by family
- **Letters and Mailing Labels** - For postal mailings

### Membership Reports
- **Birthdays** - Members with birthdays in a specific month
- **Membership Anniversaries** - People who joined in a specific month
- **Wedding Anniversaries** - People with wedding anniversaries in a specific month (both spouses listed individually)
- **Birthdays & Anniversaries** - Combined view of birthdays and wedding anniversaries for a specific month
- **Family Member Count** - Families with their member totals
- **Person by Age** - People within a specified age range
- **Person by Properties** - People with specific [properties](Properties) assigned
- **Person by Role and Gender** - Filter by family role and gender
- **Person Count** - Total counts by various criteria
- **Total By Gender** - Gender statistics

### Group Reports
- **Reports on Groups and Roles** - Group membership details
- **Class Students** - Students in a specific [Sunday School](Sunday-School) class
- **Class Teachers** - Teachers for a specific class
- **Registered Students** - All enrolled students

### Other Reports

- [Financial Reports](Finances): Pledges and Payments
- Pledge comparison: Compare pledges between two fiscal years

---

## Predefined Query Details

Open **Data & Reports** (the Query Listing) and click **Run** next to a query to see its form. Two filters are shared by most of the people queries.

### Filters shared by the people queries

![The Birthdays query form: Month dropdown and Classification list](/img/user-guide/query-birthdays-filters.png)

**Classification.** Every query that returns people (Person by Property, Birthdays, Membership anniversaries, both Volunteers queries, Recent friends, Missing people, Wedding Anniversaries and Birthdays & Anniversaries) has a **Classification** list:

- It is a multi-select. Hold **Ctrl** (**Cmd** on a Mac) to choose more than one classification, for example Member and Regular Attender in a single run.
- Leave it empty to include everyone, including people who have no classification set (listed as **Unassigned**). Choose **Unassigned** on its own to find the people who still need a classification.
- The list is read from **People → Classification Manager**, so classifications you add or rename appear automatically. Previously only Birthdays had a classification filter, and it was a fixed list of five names.

**Month.** Birthdays, Membership anniversaries, Wedding Anniversaries and Birthdays & Anniversaries take their month from a dropdown of month names instead of a number box. It is preselected to **next month**, which is when these lists are usually prepared (bulletins, cards and announcements at the end of the month). Pick another month to change it.

The SQL that was run, with your choices substituted, is shown beneath the results.

### Birthdays

Returns all people whose birthday falls in the selected month. Choose the **Month** (next month is preselected) and, if you want, narrow the list by **Classification**; leaving it empty returns everyone. Results are [Cart](./cart.md)-enabled — click **Add Results to Cart** to process the list further.

See also: [Birthdays & Anniversaries](#birthdays--anniversaries) for a combined view.

### Membership Anniversaries

Returns people who joined in the selected month (their membership date). Choose the **Month** and, optionally, one or more **Classifications**. The query is no longer limited to Members: leave Classification empty for everyone with a membership date in that month, or pick **Member** to get the previous behaviour. Results are [Cart](./cart.md)-enabled.

See also: [Wedding Anniversaries](#wedding-anniversaries) for marriage-date anniversaries.

### Wedding Anniversaries

Returns people whose family's **wedding date** falls in the selected month.

**Parameters:** Month (dropdown, preselected to next month) and Classification (optional; empty means everyone).

**Result columns:** Day, Date, Name.

**Important:** The query returns **one row per spouse** — both the head of household and the spouse appear as separate rows. This makes it straightforward to add both partners to the [Cart](./cart.md) at once for sending cards or emails.

:::tip Cart support
Results are Cart-enabled. Click **Add Results to Cart** to send anniversary greetings to both spouses at once.
:::

Only families with a wedding date recorded in their family record are included. Families with no wedding date are silently excluded.

See also: [Birthdays & Anniversaries](#birthdays--anniversaries) for a combined birthday and anniversary view; [Membership Anniversaries](#membership-anniversaries) for join-date anniversaries.

### Birthdays & Anniversaries

A combined query that returns **both birthdays and wedding anniversaries** for a single selected month, unified in one result set.

**Parameters:** Month (dropdown, preselected to next month) and Classification (optional; empty means everyone). The classification applies to both halves of the list.

**Result columns:** Type (`Birthday` or `Anniversary`), Day, Name.

Each row is labelled by its **Type** so you can distinguish birthday and anniversary entries at a glance. Results are sorted by day of the month.

Like [Wedding Anniversaries](#wedding-anniversaries), anniversary rows include **one entry per spouse**.

:::tip Cart support
Results are Cart-enabled. Click **Add Results to Cart** to include everyone in the list for a follow-up action.
:::

See also: [Birthdays](#birthdays) (birthday-only query); [Wedding Anniversaries](#wedding-anniversaries) (anniversary-only query); [Membership Anniversaries](#membership-anniversaries) (join-date query).

---

## What is a Free-Text Query?

A Free-Text Query allows you to run any query on the database. Since ChurchCRM is based on MySQL, anyone who has knowledge of this program can run free-text queries.

## What is a Cart-Enabled Query?

A [Cart](Cart)-Enabled Query is one in which the results of the query can be entered into the cart.

## How do I use Cart-Enabled Queries?

Once a Cart-Enabled Query has been run, simply click the button entitled _"Add Results to Cart"_.
