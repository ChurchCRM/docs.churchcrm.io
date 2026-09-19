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

## Church Directory Report

**Data & Reports → Directory Reports** builds a printable PDF directory of your families. Choose which families to include (active only, by classification, by group membership), which family roles count as head of household, spouse and child, and which details to print under **Information to Include**. Then pick the page layout, columns, paper size and font size, optionally add a title page and disclaimer, and click **Create Directory**.

### Page Layout

![Directory Reports form: Page Layout, Columns per Page, Paper Size and Font Size](/img/user-guide/directory-report-page-layout.png)

| Layout | What you get |
|--------|--------------|
| **Single Pages** (default) | One portrait directory page per sheet, as before. |
| **Folded Booklet** | Two half-size pages side by side on each landscape sheet, arranged in booklet order and padded to a multiple of four pages, so the printed stack folds into a booklet. Letter paper gives 5.5 × 8.5 in pages, A4 gives A5 pages, Legal gives 7 × 8.5 in pages. |

**Columns per Page** (previously _Number of Columns_) is counted per directory page. In the booklet layout a page is one half of the sheet, so **2 cols** shows four columns across an open booklet. For a small booklet, **1 col** is often the easiest to read.

### Printing a folded booklet

1. Choose **Folded Booklet**, set **Paper Size** to the paper in your printer, and click **Create Directory**.
2. Print the PDF on both sides of the paper. In the printer's two-sided (duplex) options choose **flip on short edge** (some drivers call it _short-edge binding_). Most drivers default to _long edge_, which prints the backs upside down.
3. Fold the stack of sheets in half down the middle and staple on the fold.

If **Use Title Page** is ticked, the title page becomes the front cover of the booklet.

:::tip
Print the first two sheets as a test before running the whole directory. With the short-edge setting right, the pages on the back of each sheet are the right way up once the sheet is folded.
:::

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

A [Cart](Cart)-Enabled Query is one in which the results of the query can be entered into the cart.

## How do I use Cart-Enabled Queries?

Once a Cart-Enabled Query has been run, simply click the button entitled _"Add Results to Cart"_.
