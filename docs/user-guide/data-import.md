---
title: Data Import
sidebar_position: 21
---

# Data Import

ChurchCRM can import member data from CSV (comma-separated value) files, making it easy to migrate from another system or import a membership list.

> **Important:** Test your import first! It's easier to fix issues in your CSV file than in ChurchCRM.

:::tip Other ways to import
ChurchCRM 7.1 also introduces a new **Admin → Export** landing page that groups all export formats (CSV, ChMeetings, database backup) together. The matching **Admin → Import** landing page links to CSV Import, ChMeetings import, and database restore.
:::

---

## Getting Started

1. Navigate to **Admin → CSV Import**
2. **Drag a CSV file onto the upload area** — or click to browse. The file is uploaded and parsed immediately.
3. The import wizard **auto-maps** your CSV columns to ChurchCRM fields based on header names. Review the suggested mapping and adjust any columns that don't line up.
4. Choose classification, family generation, and any other options.
5. Click **Import** — rows are inserted using the Propel ORM (the same path the app uses elsewhere), so validation and constraints match normal data entry.

:::tip Need a starting point?
The CSV Import page includes a **Download template CSV** button that gives you a properly-formatted file with every supported column header.
:::

---

## Supported Fields

### Personal Information
- Title, First Name, Middle Name, Last Name, Suffix
- Gender
- Birth Date, Membership Date, Wedding Date
- **Classification** — assign Member / Guest / Regular Attender / etc. on a per-row basis (new in 7.1)
- **Family Role** — Head, Spouse, Child, etc. (new in 7.1)

### Contact Information
- Address1, Address2, City, State, Zip, Country
- Home Phone, Work Phone, Mobile Phone
- Email, Work/Other Email

### Church-Specific
- Donation Envelope number
- [Custom Person Fields](/user-guide/custom-fields)
- [Custom Family Fields](/user-guide/custom-fields)

### Date Formats

Dates can be formatted as:
- `YYYY-MM-DD` (recommended)
- `MM-DD-YYYY`
- `DD-MM-YYYY`

The separator (dash, slash, etc.) doesn't matter.

---

## Tips for Successful Imports

1. **Clean your data first** - It's easier to fix issues in Excel/Sheets than in ChurchCRM
2. **Use the "Clear Data" option** - When testing, use this to start fresh between attempts
3. **Don't rush** - Take time to properly map fields before importing

After importing, you can make corrections in ChurchCRM:
- Move someone to a different family by editing their Person record
- Assign family roles (head, spouse, child) to help with address labels

---

## Automatic Family Generation

ChurchCRM can automatically create [Family](Families) records during import using one of two methods:

| Method | Best For |
|--------|----------|
| **Same Last Name + Address** | Traditional families at the same address |
| **Custom Family Field** | Pre-assigned family IDs or non-traditional families |

To enable automatic family generation:
1. Check the box next to the family generation dropdown
2. Select your preferred method
3. The system will group people into families automatically

---

## Setting Classifications During Import

You have two options:

**Option A — per-row classification column (new in 7.1).** Include a `Classification` column in your CSV, with values like `Member`, `Guest`, or `Regular Attender`. Each row is classified individually — ideal when a single export from your old system contains a mix of classifications.

**Option B — per-file classification (all versions).** If your CSV has no classification column, you can still pick a default on the import screen and it will be applied to every imported row. A common workflow:

- Import `members.csv` with default classification "Member"
- Import `visitors.csv` with default classification "Guest"
- Import `regular-attenders.csv` with default classification "Regular Attender"

Mixing the two is fine: the per-row column, when present, wins over the default.

---

## Troubleshooting

### Import Shows 0 Rows on Shared Hosting

If you're on shared hosting and the import shows 0 rows, this is likely a file permission issue. Contact your hosting provider or system administrator to ensure the temp directory is writable.
