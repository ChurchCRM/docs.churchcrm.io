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

**Remaining / % Paid colour coding:**

| Colour | Status | Meaning |
|--------|--------|---------|
| 🟢 **Green (bold)** | Complete / Payment-only | Pledge fully met, or payments recorded with no associated pledge |
| 🔵 **Blue** | On-track | Payments on track relative to the pledge schedule |
| 🟡 **Yellow** | Behind | Payments lagging behind the expected schedule |
| 🔴 **Red** | Critical | Payments significantly behind or not started |

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
| **Manage Funds** | Opens the donation fund editor (admin users only) |

---

## Related pages

- [Finances](/user-guide/finances) — entering pledges, payments, and deposits
- [Fund Contributor Detail](./fund-contributors.md) — per-family contributor breakdown for a specific fund
- [Fundraiser](/user-guide/fundraiser) — managing donation funds
- [Reports & Queries](/user-guide/reports-and-queries) — other financial reports
