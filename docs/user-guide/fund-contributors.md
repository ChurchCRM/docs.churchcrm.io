---
title: Fund Contributor Detail
sidebar_position: 16
description: View per-family pledge and payment details for a specific donation fund.
---

# Fund Contributor Detail

The **Fund Contributor Detail** page (`/finance/fund/{id}/contributors`) lists every family that pledged or made payments to a specific donation fund in a given fiscal year. It is the drill-down view from the [Pledge Dashboard](./pledge-dashboard.md).

:::note
Finance permissions are required to access this page. See [Users](../administration/users.md) for details.
:::

---

## Getting there

1. Go to **Finance** → **Pledge Dashboard** (or navigate to `/finance/pledge/dashboard`).
2. In the **Fund Summary** table, click the **name of any fund** in the **Fund** column.

ChurchCRM opens the Fund Contributor Detail page for that fund, pre-filtered to the same fiscal year that was active on the dashboard.

---

## Fiscal Year Filter

At the top of the page, a **Fiscal Year** drop-down lists every year that has pledge or payment data. Select a year to reload the page and update all stats and the contributor table.

The **current fiscal year** is shown below the selector for quick reference.

Two buttons appear in the top-right corner:

- **Back to Pledge Dashboard** — returns to the dashboard, preserving the selected fiscal year.
- **Manage Funds** — opens the Donation Fund editor *(visible to administrators only)*.

---

## Stats Cards

Four summary cards appear beneath the fiscal year selector:

| Card | Description |
|------|-------------|
| **Total Pledged** | Sum of all pledged amounts across all contributors for this fund and fiscal year |
| **Total Paid** | Sum of all payments received; shown with a percentage of the total pledged (or "Payments only" when no pledge exists) |
| **Remaining** | Total Pledged minus Total Paid |
| **Contributors** | Count of families with at least one pledge or payment for this fund |

---

## Contributor Table

The **Contributors** table lists one row per family. It supports sorting, searching, and pagination.

| Column | Description |
|--------|-------------|
| **Family Name** | Linked to the family record; click to open the family page |
| **Envelope** | Giving-envelope number (visible only when donation envelopes are enabled in system settings) |
| **Pledged Amount** | The amount the family committed to give; shown as a dash (—) for payment-only rows |
| **Payments** | Total payments received from this family for this fund and fiscal year |
| **Remaining** | Pledged Amount minus Payments; shown as a dash (—) for payment-only rows; colour-coded by payment status (see below) |
| **% Paid** | Payments as a percentage of the pledged amount; colour-coded by payment status |
| **Actions** | Opens the pledge or payment detail record (see [Viewing pledge details](#viewing-pledge-or-payment-details) below) |

### Payment status colours

The **Remaining** and **% Paid** columns are colour-coded to highlight each family's payment progress:

| Colour | Meaning |
|--------|---------|
| 🟢 **Green** | Pledge fully met (100 % paid) or payment-only record |
| 🔵 **Blue** | On track (75–99 % paid) |
| 🟡 **Yellow** | Behind (50–74 % paid) |
| 🔴 **Red** | Critical (less than 50 % paid) |

### Sorting and searching

Click any column header to sort the table. Use the search box (top-right of the table) to filter by family name, amounts, or any other column value.

### Exporting

The table toolbar includes **CSV** and **Print** buttons for offline analysis or inclusion in reports.

---

## Viewing pledge or payment details

Each row's **Actions** column contains a menu button (⋮). Click it and choose:

- **View Pledge** — opens the full pledge detail page for this family and fund
- **View Payment** — opens the payment detail page (shown instead of "View Pledge" for payment-only rows)

The detail page shows all individual pledge or payment line items and links to the family record.

If no pledge or payment record exists for a row, the Actions column shows **N/A**.

---

## Related pages

- [Pledge Dashboard](./pledge-dashboard.md) — fund summary and family pledge overview
- [Finances](./finances.md) — entering pledges, payments, and deposits
- [Fundraiser](./fundraiser.md) — managing donation funds
