---
title: Finances
sidebar_position: 15
---

# Finances

ChurchCRM includes comprehensive financial tracking for tithes, pledges, and gifts.

> **Note:** Only users with Finance permissions can access financial features. See [Users](/administration/users) for permission details.

![Deposit entry in ChurchCRM](https://cdn.churchcrm.io/screenshots/en/desktop/finance-deposit-entry.png)

---

## Fiscal years

Finance views use the church's fiscal year, which may not match the calendar year. Set it under **Admin → System Settings → Financial Settings**. The setting is **iFYMonth**: the month that starts your organization's fiscal year.

The same year shows up in a few places:

- **Finance → Dashboard** scopes **Recent Deposits** with a **Fiscal Year** list that includes **All Time**.
- The **Deposits** listing has a fiscal-year filter with its other search filters.
- A family profile's pledges and payments default to the current fiscal year, and you can pick another year or **All Time**.
- Fundraiser totals labeled **This Fiscal Year** follow that start month.
- The **Pledge Dashboard** and fund-contributor pages can switch years, including **All Time**.

---

## Step-by-step: Managing Donations

### Recording a Donation (Cash/Check)

1. Open the [Family](/user-guide/families) record for the donor.
2. On the family toolbar, open **Finance** and choose **Add Payment**.
3. Enter the date, amount, fund, and method (Cash, Check, Credit Card, or Bank Draft), and the family if it is not already filled in. A check payment also needs a **Check #** unless the check-number requirement has been turned off.
4. Click **Save**. Use **Save and Add Another** when you have more payments to enter. On a new payment, **Ctrl+Enter** (**⌘+Enter** on Mac) does the same as **Save and Add Another**.

### Creating a Deposit Slip

1. Go to **Finance** → **View All Deposits**, then click **New Deposit** (top-right of the results card).
2. Fill in the deposit **Comment**, **Type** (Bank, Credit Card, or Bank Draft), and **Date** in the modal, then click **Add New Deposit**.
3. The page redirects to the **Deposit Slip Editor** (breadcrumb: Finance → Deposits → Edit Deposit).
4. Click **Add Payment** to add each donation — the new payment form opens pre-linked to this deposit. Fill in Method, Fund, Amount, and a Family record, then save. Repeat for every payment in the batch.
5. The payments table lists **Family**, **Check Number**, **Fund**, **Amount**, and **Method**.
6. Click **Generate Report** to download a PDF bank deposit form.
7. When the deposit is ready to be finalised, toggle **Closed** and click **Save**.

See [Key Concepts](#key-concepts) below for pledge, payment, and deposit terms.

---

## Key Concepts

| Term | Description |
|------|-------------|
| **Pledge** | A promise of support for a fund and fiscal year, entered as a total commitment or as recurring installments |
| **Payment** | An actual donation by cash, check, credit card, or bank draft |
| **Deposit Slip** | A batch of donations printed on a standard bank deposit form |
| **Reminder Statement** | Letters reminding families of their pledge and payment progress |
| **Giving Statement** | Year-end letters acknowledging donations for tax purposes. See [Giving Statements](#giving-statements) |

## How do I enter a pledge?

A pledge records a family's commitment. Record gifts separately as [payments](#how-do-i-enter-a-payment); saving a pledge does not create a payment or deposit.

### Record a recurring commitment

1. On a [family profile](./families.md), open **Finance → Add Pledge**, or open **Finance → Pledge Dashboard** and choose **New Pledge**.
2. Check **Family** and **Fiscal Year** in the editor. Choose **Weekly**, **Monthly** or **Quarterly** under **Pledge Schedule**.
3. Set **Amounts represent** to **Each installment**. Enter the **First installment date** and **Last installment on or before**. Both dates must be within the selected fiscal year. Enter a separate pledge for the next fiscal year.
4. Under **Fund Allocation**, choose the fund and enter the amount of each installment. Use **Add Fund** to split each installment between funds; the amounts you enter apply to every installment.
5. Review the preview's installment count and **Total commitment** before saving. Correct any date or amount errors until the preview matches the family's promise.
6. Click **Save**, then check the saved commitment on **Finance → Pledge Dashboard** with the same fiscal year selected.

Installments repeat from the first date through the last boundary, including dates that fall on that boundary. Monthly dates use the last day of a shorter month when needed. Quarterly installments repeat every three months from the first date. For a church whose fiscal year runs July–June, keep both dates within that July–June period; see [Fiscal years](#fiscal-years).

### Enter a total instead

Choose **Total commitment** under **Amounts represent** when you already know the full amount promised. Enter that full amount in the fund allocation. A Monthly schedule alone does not multiply a total commitment. **Once** and **Other** schedules use total commitments.

:::caution Existing pledges
Existing pledges keep their recorded totals, including those with a Monthly schedule. Opening and saving one does not multiply its amount. To correct a pledge that was entered as a single installment, explicitly choose **Each installment**, check the installment amount and dates, and review the new full commitment before saving.
:::

When you reopen a pledge entered as installments, the editor retains its installment amount and period. Check the preview again after changing either.

### Compare the commitment with giving

1. Record received gifts through the normal [payment and deposit workflow](#step-by-step-managing-donations), using the same family, fund and fiscal year as the pledge.
2. Open **Finance → Pledge Dashboard** and select that fiscal year. The **Family Pledges** table compares each family's full commitment with giving for each fund.
3. Click a fund name in **Fund Summary** to compare families within that fund on [Fund Contributor Detail](./fund-contributors.md).
4. For a printable comparison, open **Finance → Deposit Reports → Pledge Family Summary**. Set the same **Fiscal Year**, **Filter by Family** and **Filter by Fund**, then choose **Create Report**.

For example, with a January–December fiscal year and no other pledges or payments for that family and fund:

| Entry or result | Amount |
| --- | --- |
| Monthly installment, January 1 through December 31 | $100 |
| Preview: 12 installments, full commitment | $1,200 |
| Giving recorded for the same family, fund and fiscal year | $200 |
| Remaining in the family summary and reminder letter | $1,000 |

Starting July 1 and ending December 31 instead gives six monthly installments and a $600 commitment.

**Remaining** is the full commitment minus recorded giving for the selected family, fund and fiscal year. It includes future installments. It does not calculate how much is overdue or how much should have been paid by today. The dashboard's status colours also reflect the percentage of the full commitment paid, rather than whether installments are late.

### Batch Entry

Use **Save and Add Another** for the next pledge. Select the next family and check the fiscal year, amount basis, schedule, dates and fund amounts for each entry; review its preview before saving.

## Pledge reminder letters

1. Open **Finance → Deposit Reports → Pledge Reminders**.
2. Choose the **Fiscal Year** used for the pledge and giving comparison. Use **Filter by Family** and **Filter by Fund** to match the comparison you reviewed.
3. For pledge follow-up, keep **Include → Only Payments with Pledges** and **Generate → Only Families with unpaid pledges** selected.
4. Choose **Create Report** to download the PDF letters. Review the family, funds, pledged amounts, giving and remaining balances before printing or mailing them.

Letters use the same full-period commitment and giving as the family summary. In the example above, the letter shows $1,200 pledged, $200 paid and $1,000 remaining. Selecting families with unpaid pledges does not establish that an installment is overdue; review the family's agreed schedule before following up.

## How do I delete a pledge or payment?

1. Open the pledge or payment and click **Delete**.
2. A dialog asks whether to permanently delete the record. Choose **Yes** to delete it. **No**, **Escape**, or closing the dialog keeps the record.

A short message confirms **Deleted successfully**, or explains why the delete failed. Saving a pledge or payment shows the same kind of message.

## How do I deposit donations?

When a batch of cash and check donations is received, create a deposit slip in ChurchCRM so the donating families receive credit against their pledges and for tax purposes.

### Cash / Check deposits (Bank type)

1. **Create the deposit slip:** Go to **Finance** → **View All Deposits**, then click **New Deposit** (top-right of the results card). Choose type **Bank**, enter a comment and date, then click **Add New Deposit**.
2. **Add payments:** On the Deposit Slip Editor, click **Add Payment** for each donation. Fill in the payment method (Cash, Check, etc.), fund, amount, and donor family, then save. Repeat until all donations are recorded.
3. **Review the payments:** Each row shows **Family**, **Check Number**, **Fund**, **Amount**, and **Method**.
4. **Print the deposit form:** Click **Generate Report** to download a PDF that can be printed on a standard bank deposit form.
5. **Finalise the deposit:** Toggle **Closed** and click **Save** once the batch is packaged for the bank.

> **Tip:** See [Deposits](./deposit-search.md) for searching deposits and for the **CSV** and **OFX** buttons on the search page.

## How do I enter a payment?

Payments use the same editor as pledges.

* **From the family:** Open **Finance** on the family toolbar and choose **Add Payment**. Enter the payment and click **Save**.
* **Batch entry:** Click **Save and Add Another** to save this payment and clear the form for the next family.

### Keyboard shortcut on the payment and pledge editor

On a new payment or pledge, **Ctrl+Enter** (**⌘+Enter** on Mac) runs **Save and Add Another**. When you are editing an existing record, the same keys run **Save**. Pressing Enter by itself does not save.

After each save the **Family** field is focused, so a deposit can be entered from the keyboard. A short hint sits next to the buttons on a computer with a mouse or trackpad. Phones and tablets do not show that hint. The buttons stay disabled while a save is in progress, so holding the keys does not post the same payment twice.

### Check numbers

A check payment requires a check number by default. Turning the requirement off also turns off duplicate check-number detection, so the same check can be entered more than once.

## How do I edit the QuickBooks Deposit Ticket Layout?

The layout for most QuickBooks deposit tickets should be nearly identical; however, differences in printers and deposit ticket providers may require you to adjust the position of various elements of the report.

1. Go to **Admin → System Settings**.
2. Open **Report Settings**.
3. Edit **QuickBooks Deposit Ticket Settings** (`sQBDTSettings`).
4. Adjust the values for your deposit ticket and printer.

## Finding and managing deposits

The **Deposits** page (`/finance/deposit/search`) lets you search, filter, and manage all deposit slip records in one place. It replaces the legacy `FindDepositSlip.php` URL — existing bookmarks redirect automatically.

Key capabilities:
- Filter deposits by fiscal year, date range, amount, fund, status, teller, or deposit ID
- Select multiple deposits and export: bulk CSV (single file), or per-deposit OFX/PDF
- Delete selected deposits in bulk
- Add a new deposit directly from the page

See [Deposits](./deposit-search.md) for full details.

---

## Finance Dashboard

**Finance → Dashboard** is the finance home page.

**Current Deposit** shows the open deposit you are working in: deposit number, date, type, **Total Amount**, and **Edit Deposit**. If nothing is open, the card is **No Active Deposit** and offers **Create Deposit**.

**Recent Deposits** lists deposits for the **Fiscal Year** you pick (or **All Time**). Columns are ID, Date, Type, Comment, Total, and Status (**Open** or **Closed**). **View All** opens the deposits search.

**Deposit Statistics** shows **Total Deposits**, **Open Deposits**, and **Closed Deposits** for that same year.

## Deposit Reports

**Finance → Deposit Reports** (`/finance/reports`) is the report list. There is no **Finance → Pledges** menu item. The **Pledges** button on the finance dashboard is only a shortcut to the pledge dashboard.

The page groups these links:

- **Tax & Giving Reports** — **Giving Statements** (see below) and **Zero Givers**
- **Pledge Reports** — **Pledge Summary** (opens `/finance/pledge/dashboard`), **Pledge Family Summary**, and **Pledge Reminders**
- **Deposit Reports** — **Individual Deposit Report** and **Advanced Deposit Report**
- **Membership Reports** — **Voting Members**, which opens only for users with the Finance permission

The **Finance** menu also lists **Financial Reports** and **Giving Statements**, so you can reach either one without going through the dashboard.

## Giving Statements

Giving statements are the year-end letters that thank each family and list what they gave, for their tax records. Open **Finance → Giving Statements**, or choose **Generate** in the checklist on the **Finance Dashboard**.

### Make the statements

1. Set **Report Start Date** and **Report End Date**. The page opens on your previous fiscal year. See [Fiscal years](#fiscal-years) for how your church's fiscal year is set.
2. Choose **Apply Report Dates To**: **Payment Date** counts gifts by the day they were given, **Deposit Date** counts them by the day they were deposited.
3. Narrow the list if you need to. Each picker has **Add All** and **Clear All** buttons:
   - **Classification**, **Filter by Family** and **Filter by Fund** limit who and what is included.
   - **Filter by Deposit** uses one deposit. When you choose a deposit, the dates are ignored.
   - **Minimum Total Amount** leaves out families whose total for the period is below the amount. It compares each family's total, not single gifts.
4. Choose **Remittance Slip** **Yes** to add a detachable slip addressed to the family below each letter.
5. Select **Preview**. A window shows how many **Families** and **Payments** are included and the **Total**. If nothing matches it says **No Data Found**, so change the filters and preview again.
6. In the preview window, choose **Download PDF** (the letters open in a new tab) or **Download CSV** (one row per payment, for a spreadsheet).

The PDF is named `GivingStatements-<year>.pdf`, or `GivingStatement-<year>-<family>.pdf` when the statement is for one family. The letters are written in the language you use ChurchCRM in.

### What the letter says and looks like

- The opening line, closing line, questions line and signer come from **Finance → Admin → Statement Settings**, which also holds the church tax ID (EIN) and **PDF Handling**. These settings are not on System Settings.
- The top of the page uses your church letterhead image when one is set there (**Church Letterhead**). Without one, it shows your church name and address. See [How do I set up my logo or letterhead?](/administration/faqs#how-do-i-set-up-my-logo-or-letterhead) for the image size.
- Each letter is addressed to the family's [mailing address](./reports-and-queries.md#which-address-is-printed).

### One family

On a [family profile](./families.md), open **Finance** on the toolbar. Under **Giving Statements**, choose **Print** or **Email** for a year. Years that the family has payments are listed. **Email** sends the PDF to the family's email addresses and returns you to the profile.

## Pledge Dashboard

Open pledges at **Finance → Pledge Dashboard**. **Pledge Summary** under **Deposit Reports** opens the same page.

The year list includes **All Time**. Choose **New Pledge** to enter a commitment, and check **Fiscal Year** in the editor before saving. See [How do I enter a pledge?](#how-do-i-enter-a-pledge) for installment entry, comparisons and reminder letters.

See [Pledge Dashboard](/user-guide/pledge-dashboard) for the tables and status colours.

---

## Where are the giving statement settings?

Go to **Finance** → **Admin** → **Statement Settings**. The page sets the statement wording, the church tax ID and how the PDF is handled. **Report Settings**, for the letterhead and the letter greeting and signature, stays under **Reports** → **Admin**.

---

## How do I add a new Donation Fund?

1. Go to **Finance** → **Admin** → **Donation Funds**.
2. Use the on-screen editor to add, rename, or remove donation funds.

---

## Related pages

- [Deposits](./deposit-search.md) — search, filter, and bulk-export deposit slips
- [Pledge Dashboard](./pledge-dashboard.md) — pledge and payment tracking by fund and fiscal year
- [Envelope Manager](./envelope-manager.md) — family envelope numbers
- [Fundraiser](./fundraiser.md) — managing fundraisers
- [Reports & Queries](./reports-and-queries.md) — other financial reports
