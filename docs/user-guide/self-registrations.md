---
title: Self Registrations
sidebar_position: 4
---

# Self Registrations

ChurchCRM 7.8 adds a **Self Registrations** review page so staff can see who signed up on the public form and approve them before they are treated as reviewed members.

Open it from **People → Self Registrations**. The menu item is always listed. A count badge appears when registrations are waiting. The page subtitle is **Review new families and individuals who signed up on your public registration form**.

---

## Turn self-registration on

Self-registration is off until an administrator enables it.

1. Go to **People → Dashboard**.
2. Open **People Settings**.
3. Turn **Self Registration** on and save.

When it is on, a registration link appears on the login page. The public registration API is active only while that setting is on. See [Public API — Self-registration](/api/public#self-registration).

The review page itself stays available when the form is off, so existing sign-ups can still be reviewed.

---

## What the dashboard shows

A status banner at the top says either **Self-registration is enabled** or **Self-registration is disabled**.

- Enabled: **Visitors can sign up on your public registration form.**
- Disabled: **The public registration form is turned off. Existing registrations are listed below.**

Administrators get a **Change in People Settings** button on that banner. Other users see the status without the settings link.

Three counters sit under the banner and refresh after each approval:

| Counter | Meaning |
|---------|---------|
| **Pending review** | Families and individuals still flagged for review |
| **Approved** | Self-registrations that are no longer waiting for review, including people you approved here and registrations already reviewed before this dashboard existed |
| **Total registrations** | Pending plus approved |

Members of a self-registered family are counted with that family, not as extra pending families.

---

## Pending list

**Pending Registrations** lists only entries that still need review. Rows are grouped by the month they were entered (for example, **October 2026**), newest month first.

Each row shows:

- **Type** — **Family**, **Individual**, or **Family Member** (someone proposed for an existing family, such as from the member portal)
- **Name** — links to the family or person. A family row also lists its members and address
- **Contact** — every email and phone on the record. **No contact info** is shown when both are missing
- **Registered** — the date, plus **Today**, **Yesterday**, or a **days ago** count
- **Actions** — the usual person or family action menu, including **Approve** when you are allowed to review

---

## Approve one registration or several

Approving requires the **Edit Records** permission. See [User permissions](/administration/users). Users without that permission can open the page and read the list, but they do not see selection checkboxes, **Approve selected**, or **Approve** on a row.

**One row:** open the row **Actions** menu and choose **Approve**.

**Several rows:** tick the rows, a whole month, or **Select all**, then click **Approve selected**. The button stays disabled until at least one row is selected and shows how many are selected.

Approving a family also approves its members. The pending, approved, and total counters update after a successful approval. ChurchCRM only approves records that are still pending self-registrations.

---

## Where else pending people appear

While a person or family is still waiting:

- The home dashboard shows **self-registrations are waiting for review** and a **Review now** button for users who have **Edit Records**. The alert is hidden when nothing is pending.
- Person and family lists and views show a **Pending review** badge. A family view can link to **Review self registrations**.

People who are still awaiting review are left out of the printed **People Directory**. Approving them is what makes them eligible for that directory. Other reports are unchanged by this rule. See [Reports & Queries](/user-guide/reports-and-queries).

---

## After an upgrade to 7.8

Existing self-registrations are flagged as pending review, unless staff had already edited them before the upgrade. Review those rows on **People → Self Registrations** and approve the ones that should stay in the directory.
