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

## Church Directory Report

**Reports → People Reports → People Directory** opens the **Directory reports** form, which builds a printable PDF directory of your families. The **Reports** card on the People dashboard links to the same form. Choose which families to include (**Exclude Inactive Families**, classifications, group membership), which family roles count as head of household, spouse and child, and which details to print under **Information to Include**. Then pick the page layout, columns, paper size and font size, optionally add a title page and disclaimer, and click **Create Directory**.

### Who is included

- Select at least one classification under **Select classifications to include**. The form will not run with none selected. The classifications ticked **In Directory** under **People → Admin → Person Classifications** are selected when the form opens.
- People who signed up through the public registration form are left out until they are approved under **People → Self Registrations**.
- For a directory of only the people in the [Cart](/user-guide/cart), click **Directory** in the Cart Functions bar. That form has no classification or group filters: the Cart decides who is printed.

### Page Layout

![Directory Reports form: Page Layout, Columns per Page, Paper Size and Font Size](/img/user-guide/directory-report-page-layout.png)

| Layout | What you get |
|--------|--------------|
| **Single Pages** (default) | One portrait directory page per sheet. |
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

## Mailing labels

Mailing labels for any set of people are produced from the [Cart](./cart.md#generate-mailing-labels): put the people in the Cart, then click **Labels** in the Cart Functions bar. The **Generate Labels** dialog offers one label per person or per family, bulk-mail presort, a "To the parents of" prefix, Avery and tractor-feed label types, font and size, a start row and column, and PDF or CSV output.

**Labels for a filtered mailing** (for example birthdays or wedding anniversaries in a date range): go to **Admin → Export → Open CSV Export**, set the filters, choose **Add Individuals to Cart**, then open the cart and click **Labels**. Query results with an **Add Results to Cart** button feed the same workflow.

### Which address is printed

Labels and mailed letters go to the family's **mailing address**: the family's second address when it is ticked as **This is the mailing address**, and the primary address otherwise (see [Second Address and Mailing Address](./families.md#second-address-and-mailing-address)). Families with no second address, or whose second address is not ticked, get their primary address.

- **Cart labels**, and **Print Labels** on a People Report: each label uses the person's own address when one has been entered on their record, otherwise the family's mailing address. A label never mixes a person's street with the family's city.
- **Newsletter labels** and **Confirm data labels** on the **Letters and Mailing Labels** page print the mailing address. Labels are ordered by the ZIP code that is actually printed, for presorting.
- Mailed letters print the mailing address in the address block: confirmation letters, tax statements (the letter and the remittance slip), reminder letters, zero-giver letters and fundraiser statements. Confirmation letters and tax statements sent by email use the same address. The confirmation data sheet also lists **Mailing Address** when it differs from the primary address, so families can check what is on record.
- **People Directory**: under _Information to Include_, **Primary Address** (on by default) prints the physical address. Tick **Mailing Address if Different** (off by default) to print a family's flagged mailing address beneath it, under a "Mailing Address:" label, when it differs from the primary address. That option can only be ticked while **Primary Address** is ticked.

**People Directory** and **Letters & Mailing Labels** are on the **Reports** card of **People → Dashboard**. Administrators also reach them from **Reports → People Reports**. Envelopes carry no address.

People Reports print the same labels without using the Cart. See [Print Labels on People Reports](#print-labels-on-people-reports).

---

## People Reports

Open **Reports → People Reports**. Each report is admin only, the same as this page. Set the filters and click **Run Report**. An empty **Classification** filter means all classifications; the field placeholder is **All classifications**. Month reports open on next month.

The results header has three actions: **Add All to Cart**, **Print Labels**, and **Download CSV**. **Print Labels** is disabled when the report has no rows.

### Print Labels on People Reports

**Print Labels** opens the same **Generate Labels** dialog as the Cart. It prints the rows on the page, with the filters currently applied. The Cart is not used, and the people in the Cart are not changed.

The dialog says: "Mailing labels for the people in this report. A person with no address of their own is addressed at their family address." The options are the Cart's: **Label Type**, **Font**, **Font Size**, **Bulk Mail Presort**, **Quiet Presort**, **To the parents of**, **Ignore Incomplete Addresses**, **Start Row**, **Start Column**, and **PDF** or **CSV**. Click **Generate Labels**. Label type, font, size, presort, "To the parents of", and the grouping choice (on reports that offer one) are remembered the next time you open the dialog, including from the Cart. **Start Row**, **Start Column**, and **File Type** start over each time. **Ignore Incomplete Addresses** starts ticked.

**Start Row** and **Start Column** begin printing partway down the first sheet, so you can finish a partly used sheet of labels. Both start at 1, which is the top-left label.

How a report addresses its labels:

| Report | What **Print Labels** does |
|--------|----------------------------|
| **Birthdays & Anniversaries** | The dialog states: "Birthdays are addressed to the person and anniversaries to the couple." There is no grouping choice. A birthday row is one label in that person's name. An anniversary row is one label for the couple (for example "Franklin & Julie Beck"), not one label per spouse. A person who has both a birthday and an anniversary in that month gets both labels, on the same sheets. |
| **Wedding Anniversaries** | The dialog states: "One label for each couple." There is no grouping choice. |
| Every other People Report | Choose **All Individuals** (one label per person) or **Grouped by Family** (one label per family). |

The result table for **Wedding Anniversaries** and for anniversary rows on **Birthdays & Anniversaries** still lists each spouse. **Print Labels** collapses those anniversary rows to one household label. That label names both spouses even when the classification filter matched only one of them. The filter still decides which couples are in the report.

### Monthly birthday and anniversary cards

1. Open **Reports → People Reports → Birthdays & Anniversaries**.
2. Check **Month**. It defaults to next month. Leave **Classification** empty for everyone, or pick the classifications you mail.
3. Click **Run Report**.
4. Click **Print Labels**, set **Start Row** and **Start Column** if the first sheet is already partly used, and click **Generate Labels**.

Birthday cards and anniversary cards for that month come out on the same label sheets.

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

**Important:** The result table returns **one row per spouse** — both the head of household and the spouse appear as separate rows. **Print Labels** on this report still prints **one label per couple**. See [Print Labels on People Reports](#print-labels-on-people-reports). You can also click **Add All to Cart** and send cards or emails from the [Cart](./cart.md).

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

Like [Wedding Anniversaries](#wedding-anniversaries), the table lists **one anniversary entry per spouse**. **Print Labels** addresses each birthday to the person and each anniversary to the couple, including both labels when someone has both in that month. See [Monthly birthday and anniversary cards](#monthly-birthday-and-anniversary-cards).

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
