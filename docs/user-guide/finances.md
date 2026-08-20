---
title: Finances
sidebar_position: 15
---

# Finances

ChurchCRM includes comprehensive financial tracking for tithes, pledges, and gifts.

> **Note:** Only users with Finance permissions can access financial features. See [Users](/administration/users) for permission details.

---

## Step-by-step: Managing Donations

### Recording a Donation (Cash/Check)

1. Open the [Family](/user-guide/families) record for the donor.
2. Scroll to the bottom and click **Add a new payment**.
3. Enter **Date**, **Amount**, **Fund**, and **Method** (Cash, Check, etc.).
4. Click **Save**.

### Creating a Deposit Slip

1. Go to **Finance** → **View All Deposits**, then click **New Deposit** (top-right of the results card).
2. Fill in the deposit **Comment**, **Type** (Bank, Credit Card, or Bank Draft), and **Date** in the modal, then click **Add New Deposit**.
3. The page redirects to the **Deposit Slip Editor** (breadcrumb: Finance → Deposits → Edit Deposit).
4. Click **Add Payment** to add each donation — the new payment form opens pre-linked to this deposit. Fill in Method, Fund, Amount, and a Family record, then save. Repeat for every payment in the batch.
5. Click **Generate Report** to download a PDF bank deposit form.
6. When the deposit is ready to be finalised, toggle the **Closed** status switch and click **Save**.

See [Key Concepts](#key-concepts) below for pledge, payment, and deposit terms.

---

## Key Concepts

| Term | Description |
|------|-------------|
| **Pledge** | A promise of support - a planned donation of a specific total amount |
| **Payment** | An actual donation by cash, check, credit card, or bank draft |
| **Deposit Slip** | A batch of donations printed on a standard bank deposit form |
| **Reminder Statement** | Letters reminding families of their pledge and payment progress |
| **Tax Statement** | Year-end letters acknowledging donations for tax purposes |

## How do I enter a pledge?

There are two ways in which pledges can be added:

### From the Family View

1. When viewing a [family](Families), a link for _"Add a new pledge"_ will be near the bottom of the screen.

2. Enter the information

3. click _"Save"_.

### Batch Entry

1. If you click _"Save and Add"_ rather than _"Save"_, the Pledge Editor will clear and prepare for another pledge entry.

2. Select the next family making a pledge from the list, and fill in the rest of the pledge information. Continue to click...

3. _"Save and Add"_ until all the pledges have been entered.

## How do I deposit donations?

When a batch of cash and check donations is received, create a deposit slip in ChurchCRM so the donating families receive credit against their pledges and for tax purposes.

### Cash / Check deposits (Bank type)

1. **Create the deposit slip:** Go to **Finance** → **View All Deposits**, then click **New Deposit** (top-right of the results card). Choose type **Bank**, enter a comment and date, then click **Add New Deposit**.
2. **Add payments:** On the Deposit Slip Editor, click **Add Payment** for each donation. Fill in the payment method (Cash, Check, etc.), fund, amount, and donor family, then save. Repeat until all donations are recorded.
3. **Print the deposit form:** Click **Generate Report** to download a PDF that can be printed on a standard bank deposit form.
4. **Finalise the deposit:** Toggle the **Closed** status switch and click **Save** once the batch is packaged for the bank.

### Credit Card / Bank Draft deposits

For **Credit Card** or **Bank Draft** deposit types, the Deposit Slip Editor provides two additional buttons:

- **Load Authorized** — creates payment records for all automatic transactions authorised as of today. Only transactions matching the deposit type (Credit Card or Bank Draft) are loaded; next payment dates are advanced automatically.
- **Run Transactions** — submits the loaded payments for processing. Check the _Cleared_ column on refresh; use the payment record to investigate any that failed.

After processing, click **Generate Report** for the PDF and toggle **Closed** to finalise.

> **Tip:** See [Deposits](./deposit-search.md) for bulk export, searching, and managing all deposit slips.

## How do I enter a payment?

Payments are very similar to pledges. There are two ways in which payments can be added:

* **From the Family View:** When viewing a Family, a link for _"Add a new payment"_ will be near the bottom of the screen. Enter the information and click _"Save"_.

* **Batch Entry:**
  1. If you click _"Save and Add"_ rather than _"Save"_, the Payment Editor will clear and prepare for another pledge entry.

  2. Select the next family making a payment from the list, and fill in the rest of the payment information.

  3. Continue to click _"Save and Add"_ until all the payments have been entered.

## How do I edit the QuickBooks Deposit Ticket Layout?

  The layout for most QuickBooks deposit tickets should nearly identical; however, differences in printers and deposit ticket providers may require you to adjust the position of various elements of the report.

  1. Go to **Admin** → **Edit General Settings**

      ![Admin (gear) menu](/img/Setup/admin-gen-settings-1.png)

  2. Select the 'Report Settings' tab.
  3. Find the sQBDTSettings setting, and choose 'Edit Settings'
  4. Adjust the values for each setting according to our needs.

## Finding and managing deposits

The **Deposits** page (`/finance/deposit/search`) lets you search, filter, and manage all deposit slip records in one place. It replaces the legacy `FindDepositSlip.php` URL — existing bookmarks redirect automatically.

Key capabilities:
- Filter deposits by date range, amount, fund, status, teller, or deposit ID
- Select multiple deposits and export: bulk CSV (single file), or per-deposit OFX/PDF
- Delete selected deposits in bulk
- Add a new deposit directly from the page

See [Deposits](./deposit-search.md) for full details.

---

## Pledge Dashboard

The **Pledge Dashboard** provides an interactive summary of pledges and payments by fund and by family for any fiscal year. It replaces the former Pledge Summary PDF report.

Go to **Finance** → **Pledge Dashboard** to open it.

Key features:
- **Fund Summary table** — sortable/searchable breakdown of pledges, payments, overpaid, and underpaid per fund, with CSV/PDF/print export.
- **Family Pledges table** — per-family, per-fund pledge vs. payment detail, colour-coded by completion.
- **Fiscal-year selector** — view data for any past or current year.

See [Pledge Dashboard](/user-guide/pledge-dashboard) for full details.

---

## How do I add a new Donation Fund?

1. Go to **Finance** → **Admin** → **Donation Funds**.
2. Use the on-screen editor to add, rename, or remove donation funds.

---

## Related pages

- [Deposits](./deposit-search.md) — search, filter, and bulk-export deposit slips
- [Pledge Dashboard](./pledge-dashboard.md) — pledge and payment tracking by fund and fiscal year
- [Fundraiser](./fundraiser.md) — managing donation funds and campaigns
- [Reports & Queries](./reports-and-queries.md) — other financial reports
