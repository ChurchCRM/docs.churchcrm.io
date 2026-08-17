---
title: Deposits
sidebar_position: 16
description: Search, filter, export, and manage deposit slips from the Deposits page at /finance/deposit/search.
---

# Deposits

The **Deposits** page (`/finance/deposit/search`) is the central place to search, filter, and manage all deposit slip records. It replaces the legacy `FindDepositSlip.php` page, which now redirects automatically to the new URL.

> **Note:** Finance permissions are required to access this page. See [Users](../administration/users.md) for permission details.

---

## Getting there

Go to **Finance** → **View All Deposits**, or navigate directly to `/finance/deposit/search`.

If you have an old bookmark pointing to `FindDepositSlip.php`, it will redirect automatically — no action needed.

---

## Searching and filtering

At the top of the page, a collapsible **Search Deposits** form lets you narrow the list by any combination of criteria:

| Filter | Description |
|--------|-------------|
| **From Date** | Earliest deposit date (inclusive) |
| **To Date** | Latest deposit date (inclusive) |
| **Deposit ID** | Exact deposit slip number |
| **Amount Min** | Minimum total deposit amount |
| **Amount Max** | Maximum total deposit amount |
| **Fund** | Filter by a specific donation fund |
| **Status** | All · Open · Closed |
| **Teller** | Filter by the person who entered the deposit |

Click **Search** to apply filters. Click **Clear** (or navigate back to `/finance/deposit/search` with no query string) to reset all filters.

The active filters are reflected in the page URL, so a filtered view can be bookmarked or shared.

---

## Results table

Matching deposits appear in a sortable, searchable DataTable with the following columns:

| Column | Description |
|--------|-------------|
| ☐ | Row-select checkbox — check to include in bulk actions |
| **ID** | Deposit slip number |
| **Date** | Date the deposit was created |
| **Type** | `Bank` · `CreditCard` · `BankDraft` (raw stored value; the Add New Deposit modal uses human-readable labels) |
| **Comment** | Optional free-text description |
| **Total** | Sum of all payments on the slip (shows fund-only total when a fund filter is active) |
| **Status** | Open (green) or Closed (grey) badge |
| **Teller** | Name of the person who entered the deposit |
| **Actions** | Per-row dropdown: **View** (opens the deposit editor) · **Add Payment** |

Click any column header to sort. Use the DataTable search box to filter across all visible columns.

---

## Bulk actions

Select one or more rows using the checkboxes. Once at least one row is selected, the toolbar buttons in the card header become active:

| Button | Behaviour |
|--------|-----------|
| **Select All** | Checks every row currently visible in the table |
| **Delete** | Prompts for confirmation, then permanently deletes the selected deposits |
| **CSV** | Downloads a single RFC 4180-compliant CSV file containing all payments across the selected deposits |
| **OFX** | Triggers one OFX (Open Financial Exchange) download per selected deposit |
| **PDF** | Triggers one PDF deposit report download per selected deposit (deposits with no payments are skipped) |

:::warning
**Delete is permanent.** Deleted deposits and their associated payment records cannot be recovered. Use the **Closed** status to archive deposits you no longer need to edit but want to keep for records.
:::

---

## Adding a new deposit

Click the **New Deposit** button (top-right of the results card) to open the **Add New Deposit** modal.

Fill in:

| Field | Description |
|-------|-------------|
| **Deposit Comment** | Optional label for this batch (e.g. "Sunday offering 2025-01-05") |
| **Deposit Type** | Bank · Credit Card · Bank Draft |
| **Deposit Date** | Date of the deposit |

Click **Add New Deposit** to save. The page redirects to the deposit slip editor so you can add individual payments immediately.

---

## Exporting deposits

### Bulk CSV export

Select rows and click **CSV** to download a single file containing all payments across the selected deposit slips. The file is RFC 4180-compliant — fields containing commas or quotes are properly enclosed, fixing the naive comma-stripping behaviour of the legacy export.

CSV columns (one row per payment, not per deposit):

| Column | Description |
|--------|-------------|
| Deposit ID | The deposit slip number |
| Pledge ID | The individual pledge/payment record ID |
| Family Name | Donor family name |
| Date | Payment date |
| Amount | Payment amount |
| Fund | Donation fund name |
| Method | Payment method (Cash, Check, etc.) |
| Check No | Check or reference number (if recorded) |
| Comment | Payment-level comment |
| Fiscal Year | Fiscal year label the payment is assigned to |

### Single-deposit OFX / PDF / CSV

To export a single deposit, open it from the **Actions** → **View** dropdown. From the deposit editor page you can download OFX, PDF, or CSV for that deposit individually.

---

## Deposit status

A deposit can be **Open** or **Closed**:

- **Open** — still being edited; payments can be added or removed.
- **Closed** — finalised; the Close Deposit action is performed from the deposit editor page.

The Deposits search page lets you filter by status so you can quickly find open deposits that still need to be processed, or closed ones for historical lookups.

---

## Related pages

- [Finances](./finances.md) — entering pledges, payments, and deposit slips
- [Pledge Dashboard](./pledge-dashboard.md) — pledge and payment tracking by fund and fiscal year
- [Fundraiser](./fundraiser.md) — managing donation funds
