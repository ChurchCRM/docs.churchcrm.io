---
title: Data Import
sidebar_position: 21
---

# Data Import

ChurchCRM can import member data from CSV (comma-separated value) files, making it easy to migrate from another system or import a membership list.

> **Important:** Test your import first! It's easier to fix issues in your CSV file than in ChurchCRM.

---

## Getting Started

1. Navigate to **Admin → CSV Import**
2. Upload your CSV file
3. Map your CSV columns to ChurchCRM fields
4. Review and import

![TODO-SCREENSHOT: CSV Import screen showing the file upload area and column mapping interface](/img/placeholder.png)

---

## Supported Fields

### Personal Information
- Title, First Name, Middle Name, Last Name, Suffix
- Gender
- Birth Date, Membership Date, Wedding Date

### Contact Information  
- Address1, Address2, City, State, Zip, Country
- Home Phone, Work Phone, Mobile Phone
- Email, Work/Other Email

### Church-Specific
- Donation Envelope number
- [Custom Person Fields](Custom-Fields)
- [Custom Family Fields](Custom-Fields)

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

To assign [classifications](Classifications) efficiently:

1. **Separate your data** into multiple files by classification type
2. **Import each file separately**, selecting the appropriate classification
3. Example workflow:
   - Import `members.csv` with classification "Member"
   - Import `visitors.csv` with classification "Guest"
   - Import `regular-attenders.csv` with classification "Regular Attender"

This is much faster than manually classifying each person after import.

---

## Troubleshooting

### Import Shows 0 Rows on Shared Hosting

If you're on shared hosting and the import shows 0 rows, this is likely a file permission issue. Contact your hosting provider or system administrator to ensure the temp directory is writable.
