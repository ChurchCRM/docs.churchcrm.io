---
title: Pledge Dashboard
sidebar_position: 16
---

# Pledge Dashboard

The **Pledge Dashboard** (`/finance/pledge/dashboard`) shows pledge and payment progress by fund and by family for a fiscal year.

> **Note:** Finance permissions are required to access this page. See [Users](/administration/users) for details.

---

## Getting there

Go to **Finance → Pledge Dashboard**. The same page opens from **Finance → Deposit Reports**, on the **Pledge Reports** card, via **Pledge Summary**. There is no **Finance → Pledges** menu item.

---

## Fiscal-Year Selector

At the top of the page, a **Fiscal Year** drop-down lists **All Time** and every year that has pledge data. Changing the selection reloads the page and updates the tables and cards.

The current fiscal year is highlighted underneath the selector for quick reference.

---

## Overview Stat Cards

Two totals sit beside one card per fund:

| Card | Description |
|------|-------------|
| **Total Pledges** | Sum of pledged amounts for the selected year |
| **Payments** | Sum of payments, labeled as a percent of pledges |
| **One card per fund** | Amount paid, the pledged total, family count, and a progress bar |

---

## Fund Summary Table

The **Fund Summary** table breaks down pledge and payment data by donation fund.

| Column | Description |
|--------|-------------|
| **Fund** | Donation fund name — click to open the [Fund Contributor drill-down](#fund-contributor-drill-down) for that fund |
| **Pledges** | Total pledged amount for this fund |
| **Payments** | Total payments received for this fund |
| **# Pledges** | Count of pledge records |
| **# Payments** | Count of payment records |
| **Overpaid** | Amount paid above the pledged total |
| **Underpaid** | Amount still outstanding |

A **Total** footer row summarises all visible rows and updates dynamically when the table is filtered.

### Drill down into contributors

Click any **fund name** in the Fund column to open the [Fund Contributor Detail](./fund-contributors.md) page for that fund. This drill-down view shows per-family pledge and payment data, payment-status colour coding, and a link to each family's individual pledge or payment record.

### Sorting and searching

Click any column header to sort. Use the search box (top-right of the table) to filter by fund name or any column value. The footer totals recalculate to match the filtered rows.

### Exporting

The table toolbar exports **CSV** and **Print**. There is no Copy, Excel, or PDF button on these tables.

---

## Family Pledges Table

The **Family Pledges** table lists every pledge for the selected fiscal year, one row per family-fund combination.

| Column | Description |
|--------|-------------|
| **Family Name** | Linked to the family record |
| **Fund Name** | Donation fund associated with the pledge |
| **Pledge Amount** | The amount the family committed to give |
| **Payments** | Total payments made against this pledge |
| **Remaining** | Pledge amount minus payments, colour-coded by completion percentage |

Status is the percent of the pledge that has been paid:

- **complete** — 100% or more
- **on-track** — 75% or more, and under 100%
- **behind** — 50% or more, and under 75%
- **critical** — under 50%

A row with payments and no pledge amount is treated as complete.

### Sorting and searching

Click any column header to sort. The search box filters across all columns (family name, fund name, amounts).

### Exporting

The Family Pledges table also exports **CSV** and **Print**.

---

## Adding a new pledge

Click **Add New Pledge** (top-right). It opens `/finance/pledge/new?type=Pledge` with no fiscal-year id, even if a year is selected on the dashboard. See [Finances](/user-guide/finances#how-do-i-enter-a-pledge) for the editor.

---

## Fund Contributor Drill-Down

The **Fund Contributor** page (`/finance/fund/{fundId}/contributors`) shows every family that has pledged or paid to a specific donation fund within a chosen fiscal year.

### Getting there

Click a **fund name** in the [Fund Summary table](#fund-summary-table) on the Pledge Dashboard. The drill-down opens for that fund and the currently selected fiscal year. You can also reach it from the per-fund progress cards on the main **Finance Dashboard**.

### Fiscal-Year Filter

A **Fiscal Year** drop-down appears at the top of the page alongside a note identifying the current fiscal year. Changing the selection reloads the page immediately and updates all stats and the contributor table to reflect the chosen year.

### Stats Cards

Four summary cards present totals across all contributors for the selected fund and fiscal year:

| Card | Description |
|------|-------------|
| **Total Pledged** | Sum of all pledge commitments for this fund |
| **Total Paid** | Total payments received; shown as a percentage of pledges (displays "Payments only" when there are no pledge records) |
| **Remaining** | Total outstanding balance (Total Pledged − Total Paid) |
| **Contributors** | Count of families who have pledged or paid to this fund |

### Contributor Table

The contributor listing shows one row per family.

| Column | Description |
|--------|-------------|
| **Family Name** | Links to the family record |
| **Envelope** | Donation envelope number (only shown when envelope numbering is enabled in system settings) |
| **Pledged Amount** | Amount the family committed for this fund; shown as "—" when no pledge record exists |
| **Payments** | Total payments received from this family for this fund |
| **Remaining** | Outstanding balance (Pledged − Paid); colour-coded by payment status (see below) |
| **% Paid** | Percentage of the pledge that has been collected |
| **Actions** | Per-row action menu (see [Pledge / Payment Detail](#pledge--payment-detail)) |

See [Donation Envelopes](/user-guide/donation-envelopes) for configuration, assignment, and matching rules.

**Remaining / % Paid colour coding:**

| Colour | Status | Meaning |
|--------|--------|---------|
| 🟢 **Green (bold)** | complete, or payment-only | 100% or more of the pledge, or payments with no pledge |
| 🔵 **Blue** | on-track | At least 75% and under 100% |
| 🟡 **Yellow** | behind | At least 50% and under 75% |
| 🔴 **Red** | critical | Under 50% |

The table is sorted by **Family Name** by default and displays 25 rows per page. Click any column header to re-sort, or use the search box to filter by family name or amount.

> **Note:** If no pledge or payment data exists for the selected fund and fiscal year, the table is replaced by an informational alert: "No contributors found for this fund in the selected fiscal year".

### Pledge / Payment Detail

Each row's **Actions** menu contains:

- **View Pledge** — opens the pledge detail page for that family-fund record.
- **View Payment** — shown instead for families whose contributions are payments only (no pledge record). Opens the payment detail page.

### Controls

| Control | Description |
|---------|-------------|
| **← Back to Pledge Dashboard** | Returns to the Pledge Dashboard, preserving the currently selected fiscal year |
| **Manage Funds** | Opens the donation fund editor for any user who can use Finance |

---

## Related pages

- [Finances](/user-guide/finances) — entering pledges, payments, and deposits
- [Fund Contributor Detail](./fund-contributors.md) — per-family contributor breakdown for a specific fund
- [Fundraiser](/user-guide/fundraiser) — managing donation funds
- [Reports & Queries](/user-guide/reports-and-queries) — other financial reports
