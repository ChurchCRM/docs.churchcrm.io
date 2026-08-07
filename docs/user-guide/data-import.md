---
title: Data Import
sidebar_position: 21
---

# Import from a Spreadsheet

ChurchCRM can import member data from CSV (comma-separated value) files, making it easy to migrate from another system or bulk-load a membership list.

:::tip Other ways to import
**Admin → Import** links to CSV Import, ChMeetings import, and database restore. **Admin → Export** gives you CSV, ChMeetings export, and database backup.
:::

---

## Quick Start

1. Navigate to **Admin → Import → Import from Spreadsheet** (`/admin/import/csv`).
2. Click **Download CSV Template** to get a pre-formatted file with every supported column header and five sample rows.
3. Fill in your data — each row is one person. People in the same family share a `FamilyID`.
4. **Drag the file onto the upload area** (or click to browse) and click **Upload CSV**.
5. Review the column-mapping table. Green **Auto-mapped** badges mean ChurchCRM matched the column automatically. Yellow **Unmapped** badges need a manual selection or can be left as *Ignore*.
6. Click **Import Data**.
7. A summary card shows the counts of **People**, **Families**, and **Skipped** rows.

---

## Required Columns

Only two columns are required in every row:

| Column | Notes |
|--------|-------|
| `FirstName` | Cannot be blank — rows without a first name are skipped |
| `LastName` | Cannot be blank — rows without a last name are skipped |

Every other column is optional and can be omitted entirely or left blank.

---

## Column Reference

### Family Grouping

| Column | Description |
|--------|-------------|
| `FamilyID` | A token you assign to group people into a family. All rows sharing the same `FamilyID` are placed in one Family record. The first row with a given `FamilyID` creates the family and sets its name, address, phone, email, and wedding date from that row's values. Rows with an empty `FamilyID` are created as individuals with no family. |

### Personal Information

| Column | Description |
|--------|-------------|
| `Title` | Salutation prefix (Mr, Mrs, Dr, etc.) |
| `FirstName` | **Required** |
| `MiddleName` | |
| `LastName` | **Required** |
| `Suffix` | Jr, Sr, III, etc. |
| `Gender` | See [Gender values](#gender-values) |
| `BirthDate` | See [Date formats](#date-formats) |
| `MembershipDate` | See [Date formats](#date-formats) |
| `WeddingDate` | Stored on the Family record (only used when a `FamilyID` is present); see [Date formats](#date-formats) |
| `Classification` | Must match an existing Classification name (case-insensitive), e.g. `Member`, `Guest`, `Regular Attender`. Unrecognised values are silently ignored — see [Troubleshooting](#troubleshooting). |
| `FamilyRole` | Must match an existing Family Role name (case-insensitive), e.g. `Head of Household`, `Spouse`, `Child`. Only applied when a `FamilyID` is present. Unrecognised values are silently ignored. |
| `Envelope` | Giving-envelope number (integer) |

### Contact Information

| Column | Description |
|--------|-------------|
| `Address1` | Street address line 1 |
| `Address2` | Street address line 2 |
| `City` | |
| `State` | State or province |
| `Zip` | Postal / ZIP code |
| `Country` | Defaults to the system's configured default country when omitted |
| `HomePhone` | |
| `WorkPhone` | |
| `MobilePhone` | Cell / mobile number |
| `Email` | Personal email address |
| `WorkEmail` | Work / business email address |

---

## Date Formats

The following formats are accepted for `BirthDate`, `WeddingDate`, and `MembershipDate`:

| Format | Example | Notes |
|--------|---------|-------|
| `YYYY-MM-DD` | `1980-05-12` | Recommended |
| `0000-MM-DD` | `0000-05-12` | Year unknown; stores month and day only |
| `M/D/YYYY` | `5/12/1980` | |
| `M-D-YYYY` | `5-12-1980` | |
| `M/D/YY` | `5/12/80` | 2-digit year: 00–69 → 2000–2069, 70–99 → 1970–1999 |
| `M/D` | `5/12` | No year; stores month and day only |
| Natural language | `May 12, 1980` | Anything PHP's `strtotime()` can parse |

`BirthDate` stores the month and day separately from the year, so a birthday of `0000-05-12` (or `5/12`) is perfectly valid — ChurchCRM will display it as "May 12" with no year.

---

## Gender Values

The `Gender` column accepts the following values (case-insensitive):

| Input | Stored as |
|-------|-----------|
| `male`, `m`, `man`, `boy` | Male |
| `female`, `f`, `woman`, `girl` | Female |
| Anything else / blank | Unknown |

---

## Auto-Mapping

When you upload a CSV, ChurchCRM compares each column header against a list of known aliases. Matching is case-insensitive. Common aliases include:

| ChurchCRM field | Recognised aliases (sample) |
|-----------------|-----------------------------|
| `FirstName` | `first_name`, `fname`, `first`, `given_name` |
| `LastName` | `last_name`, `lname`, `last`, `surname`, `family_name` |
| `BirthDate` | `birth_date`, `birthday`, `dob`, `date_of_birth` |
| `MobilePhone` | `mobile_phone`, `cell`, `cell_phone`, `cellphone` |
| `Classification` | `class`, `member_type`, `membership_type` |
| `FamilyRole` | `family_role`, `role`, `household_role` |
| `FamilyID` | `family_id`, `fid` |

If a column header does not match any alias, it appears with an **Unmapped** badge. Select the target field from the dropdown, or leave it as *Ignore* to skip the column.

---

## Custom Fields and Properties

Custom Person fields, Custom Family fields, Person Properties, and Family Properties all appear as their own sections in the mapping dropdown (e.g. *Person Custom*, *Family Property*).

**Auto-mapping for custom fields:** if your CSV column header matches the display name of a custom field or property exactly (case-insensitive), it is auto-mapped automatically — no manual selection needed.

The downloaded CSV template already includes a column for every custom field and property you have configured. If you create the CSV manually, use the exact display name as the column header:

```
FirstName,LastName,Highest Degree Received (Person Custom),Notes (Family Property)
John,Smith,Bachelor's,Member since 2010
```

The `(Person Custom)` / `(Family Property)` suffix is added by the template to keep columns unique when two fields share the same name across different categories. The importer strips the suffix during auto-mapping.

### Custom field value formats

| Field type | Accepted values |
|------------|-----------------|
| Boolean | `yes` / `no` / `true` / `false` / `1` / `0` |
| Date | Same formats as `BirthDate` (full year required; partial dates are not stored in custom date fields) |
| Year | 4-digit year only |
| Season | `winter` / `spring` / `summer` / `fall` |
| Integer / Number | Digits only; monetary values accept `$` and `,` |
| Text / Phone | Any text |
| Custom list | Integer ID of the list option |

**Promptless Properties** (no prompt text defined) are boolean: `yes`/`true`/`1` assigns the property; any other value or blank skips it. **Prompted Properties** accept any non-empty text as the property value.

---

## Timeline Notes

Every imported person and family receives a *Created* timeline note with the text **"Imported from CSV"** so you can easily identify records that came from an import.

---

## Sample CSV

A minimal two-family, five-person file:

```csv
FamilyID,FirstName,LastName,Gender,BirthDate,Classification,FamilyRole,Email
1001,John,Smith,Male,1980-05-12,Member,Head of Household,john.smith@example.com
1001,Jane,Smith,Female,1982-08-20,Member,Spouse,jane.smith@example.com
1001,Emily,Smith,Female,2010-03-05,Member,Child,
1002,Peter,Johnson,Male,1975-11-03,Member,Head of Household,peter.johnson@example.com
,Alice,Walker,Female,1990-02-02,Guest,,alice.walker@example.com
```

- Rows 1–3 share `FamilyID` `1001` → placed in one Family named "Smith".
- Row 4 uses a different `FamilyID` → a separate Family named "Johnson".
- Row 5 has no `FamilyID` → Alice is created as an individual with no family.

---

## Troubleshooting

### Row was skipped

A row is silently skipped when either `FirstName` or `LastName` is blank. The summary card's **Skipped** count shows how many rows were skipped. Check your CSV for blank name cells or header-only rows.

### Classification / FamilyRole not applied

`Classification` and `FamilyRole` values must match an existing entry in ChurchCRM's lookup lists (case-insensitive). To see the valid values:

- **Classifications**: Admin → Lists → Classifications
- **Family Roles**: Admin → Lists → Family Roles

If the value in your CSV does not match any entry exactly, it is silently ignored and the field is left blank.

### Duplicate column names

If your CSV has two columns with the same header name, the importer returns an error asking you to rename the duplicate before uploading again.

### No data visible after import

Check that the CSV file has a header row as its first row and that it uses a `.csv` extension. Files saved as `.xls` or `.xlsx` must be exported to CSV first.

### Custom field values not saved

- Verify the column header in your CSV matches the custom field's display name exactly (case-insensitive), or manually map the column in the mapping step.
- Ensure the value format matches the field type (e.g. dates need a full year for custom date fields; boolean fields accept `yes`/`no`/`true`/`false`/`1`/`0`).
- Custom fields that do not exist in ChurchCRM's configuration are ignored; no new fields are created on the fly.

---

## Related Pages

- [Custom Fields](/user-guide/custom-fields)
- [Properties](/user-guide/properties)
- [Classifications](/user-guide/classifications)
- [Export & Data](/user-guide/export)
