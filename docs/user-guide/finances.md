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
2. Fill in the deposit comment, type, and date in the modal.
3. Add each donation to the deposit.
4. Click **Generate PDF** to print a bank deposit form.
5. When ready for the bank, click **Close deposit slip**.

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

When a batch of cash and check donations is received they are entered into ChurchCRM so the donating families receive credit against their pledges and also for tax purposes.

*   **Make a new deposit slip:** Select "New Deposit Slip (checks and cash)"  from the "Deposit" menu.

*   **Enter the deposits:** See below.

*   **Print the deposit slip:**
  1. Select _"Edit Deposit Slip"_ from the _"Deposit"_ menu.

  2. Click on _"Generate PDF"_.

  3. This PDF document will print on a standard bank deposit form.

* **Close the deposit:**
Select _"Close deposit slip"_ to close the deposit slip once the deposit has been packaged for the bank.

Automatic credit card and bank draft deposits are supported for churches and other organizations with an ECHO account.

* **Configure the automatic payments** For each family participating in the automatic payment program, in the Family view, click _"Add a new automatic payment"_.

* **Fill in the automatic payment information** Fill in all of the fields
in this form, except for the last six fields. Of the last six fields, the first three must be filled for credit card transactions, and the last three must be filled for bank draft transactions. Many of these fields start with default values taken from the Family record, but these values may be edited if appropriate. Note that the date specified here is the first date that the payment is authorized, and the payment interval specifies the period of time in months until another payment is authorized.

* **Make a new deposit slip:** Select _"New Deposit Slip (credit card)"_ or _"New Deposit Slip (bank draft)"_ from the _"Deposit"_ menu.

* **Load the authorized payments** Press _"Load Authorized Transactions"_ to create payment records for all of the automatic transactions that have been authorized as of today. Note that only credit card transactions or bank draft transactions will be loaded, depending on the nature of this deposit slip. When the transactions are loaded the next payment date for each automatic payment is pushed forward by the specified interval in months.

* **Process payments** Press _"Run Transactions"_ to execute all of the transactions using the ECHO transaction server. This may take some time, depending on the number of transactions and the speed of the network connection. When the page refreshes note the status of each transaction in the _Cleared_ column.

* **Fix problems with payments that did not clear** Press _"Details"_ for any transactions that do not clear to see why the transaction failed. Edit the automatic transaction record using the Family view to correct any errors. After making corrections, repeat the _"Process payments"_ step to re-submit the failed transactions. Successful transactions will not be submitted again.

* **Close the deposit slip** Enable _"Close deposit slip"_ when finished with this deposit slip, and press _"Save"_.

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

Go to **Finance** → **Pledges** (or **Finance** → **Reports** → **Pledge Summary**) to open the dashboard.

Key features:
- **Fund Summary table** — sortable/searchable breakdown of pledges, payments, overpaid, and underpaid per fund, with CSV/PDF/print export.
- **Family Pledges table** — per-family, per-fund pledge vs. payment detail, colour-coded by completion.
- **Fiscal-year selector** — view data for any past or current year.

See [Pledge Dashboard](/user-guide/pledge-dashboard) for full details.

---

## How do I Add a new Deposit Fund?

1. Go to **Fundraiser** → **Edit Fundraiser**.
    ![Fundraiser Admin](/img/Finances/fund-raiser-admin-1.png)
2. Use the on-screen editor to add / remove donation funds.

---

## Related pages

- [Deposits](./deposit-search.md) — search, filter, and bulk-export deposit slips
- [Pledge Dashboard](./pledge-dashboard.md) — pledge and payment tracking by fund and fiscal year
- [Fundraiser](./fundraiser.md) — managing donation funds and campaigns
- [Reports & Queries](./reports-and-queries.md) — other financial reports
