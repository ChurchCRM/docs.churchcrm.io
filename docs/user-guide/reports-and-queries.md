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
| **Queries** | Database searches that return lists of [people](/user-guide/persons) or [families](/user-guide/families) |

> **Tip:** Many query results can be added to the [Cart](/user-guide/cart) for further processing.

---

## Query Listing

**Data/Reports** opens **Query Listing**. Only administrators see that menu item.

Seeded queries include **Birthdays**, **Membership anniversaries**, **Wedding Anniversaries**, **Birthdays & Anniversaries**, and **Pledge comparison**. Other seeded queries on a new database are **Person by Property**, **Volunteers**, **Recent friends**, **Missing pledges**, and **Missing people**.

Finance letters and giving reports are under [Deposit Reports](/user-guide/finances#deposit-reports), not on Query Listing.

---

## Mailing labels

Mailing labels for any set of people are produced from the [Cart](./cart.md#generate-mailing-labels): put the people in the Cart, then click **Labels** in the Cart Functions bar. The **Generate Labels** dialog offers one label per person or per family, bulk-mail presort, a "To the parents of" prefix, Avery and tractor-feed label types, font and size, a start row and column, and PDF or CSV output.

**Which address is printed:** the person's own address when one has been entered, otherwise the family address. Households that keep their address on the family record only — the normal case — get correct labels; a label never mixes a person's street with the family's city.

**Labels for a filtered mailing** (for example birthdays or wedding anniversaries in a date range): go to **Admin → Export → Open CSV Export**, set the filters, choose **Add Individuals to Cart**, then open the cart and click **Labels**. Query results with an **Add Results to Cart** button feed the same workflow.

---

## Predefined Query Details

### Birthdays

Returns all people whose birthday falls in the selected month. Requires a **Classification** filter (e.g., Active Members) and a **Month** parameter (1–12). Results are [Cart](./cart.md)-enabled — click **Add Results to Cart** to process the list further.

See also: [Birthdays & Anniversaries](#birthdays--anniversaries) for a combined view.

### Membership Anniversaries

Returns active members whose `MembershipDate` falls in the selected month. Enter the **Month** (1–12) when prompted. Results are [Cart](./cart.md)-enabled.

See also: [Wedding Anniversaries](#wedding-anniversaries) for marriage-date anniversaries.

### Wedding Anniversaries

Returns people whose family's **wedding date** falls in the selected month.

**Parameter:** Month (1–12, required) — the calendar month to search.

**Result columns:** Day, Date, Name.

**Important:** The query returns **one row per spouse** — both the head of household and the spouse appear as separate rows. This makes it straightforward to add both partners to the [Cart](./cart.md) at once for sending cards or emails.

:::tip Cart support
Results are Cart-enabled. Click **Add Results to Cart** to send anniversary greetings to both spouses at once.
:::

Only families with a wedding date recorded in their family record are included. Families with no wedding date are silently excluded.

See also: [Birthdays & Anniversaries](#birthdays--anniversaries) for a combined birthday and anniversary view; [Membership Anniversaries](#membership-anniversaries) for join-date anniversaries.

### Birthdays & Anniversaries

A combined query that returns **both birthdays and wedding anniversaries** for a single selected month, unified in one result set.

**Parameter:** Month (1–12, required) — the calendar month to search.

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

A [Cart](/user-guide/cart)-Enabled Query is one in which the results of the query can be entered into the cart.

## How do I use Cart-Enabled Queries?

Once a Cart-Enabled Query has been run, simply click the button entitled _"Add Results to Cart"_.
