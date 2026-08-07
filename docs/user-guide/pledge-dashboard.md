---
title: Pledge Dashboard
sidebar_position: 16
---

# Pledge Dashboard

The **Pledge Dashboard** (`/finance/pledge/dashboard`) is the central view for tracking pledge and payment progress by fund and by family for a given fiscal year. It replaces the former **Pledge Summary** PDF report.

> **Note:** Finance permissions are required to access this page. See [Users](/administration/users) for details.

---

## Getting there

Go to **Finance** → **Reports** → **Pledge Reports** → **Pledge Summary**, or navigate directly to **Finance** → **Pledges** in the top menu. Both links open the Pledge Dashboard.

---

## Fiscal-Year Selector

At the top of the page, a **Fiscal Year** drop-down lists every year for which pledge data exists. Changing the selection reloads the page and updates all tables and stat cards to reflect the chosen year.

The current fiscal year is highlighted underneath the selector for quick reference.

---

## Overview Stat Cards

Four summary cards appear at the top:

| Card | Description |
|------|-------------|
| **Total Pledges** | Sum of all pledged amounts for the selected fiscal year |
| **Total Payments** | Sum of all payments received, shown as a percentage of pledges |
| **Per-fund cards** | One card per active fund showing amount paid vs. pledged and a progress bar |

---

## Fund Summary Table

The **Fund Summary** table breaks down pledge and payment data by donation fund.

| Column | Description |
|--------|-------------|
| **Fund** | Donation fund name |
| **Pledges** | Total pledged amount for this fund |
| **Payments** | Total payments received for this fund |
| **# Pledges** | Count of pledge records |
| **# Payments** | Count of payment records |
| **Overpaid** | Amount paid above the pledged total |
| **Underpaid** | Amount still outstanding |

A **Total** footer row summarises all visible rows and updates dynamically when the table is filtered.

### Sorting and searching

Click any column header to sort. Use the search box (top-right of the table) to filter by fund name or any column value. The footer totals recalculate to match the filtered rows.

### Exporting

The table toolbar includes **Copy**, **CSV**, **Excel**, **PDF**, and **Print** buttons (standard DataTable export buttons). Use these to export the Fund Summary for offline analysis or inclusion in reports.

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

The **Remaining** column is colour-coded:
- 🟢 **Green** — 100 % or more paid (fully met or overpaid)
- 🔵 **Blue** — 75–99 % paid
- 🟡 **Yellow** — 50–74 % paid
- 🔴 **Red** — less than 50 % paid

### Sorting and searching

Click any column header to sort. The search box filters across all columns (family name, fund name, amounts).

### Exporting

The Family Pledges table also provides **Copy**, **CSV**, **Excel**, **PDF**, and **Print** buttons.

---

## Adding a new pledge

Click the **Add New Pledge** button (top-right) to open the pledge editor for the selected fiscal year. See [Finances](/user-guide/finances#how-do-i-enter-a-pledge) for full pledge entry instructions.

---

## Related pages

- [Finances](/user-guide/finances) — entering pledges, payments, and deposits
- [Fundraiser](/user-guide/fundraiser) — managing donation funds
- [Reports & Queries](/user-guide/reports-and-queries) — other financial reports
