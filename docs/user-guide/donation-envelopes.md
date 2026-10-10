---
title: Donation Envelopes
sidebar_position: 18
---

# Donation envelopes

Envelope numbers let finance volunteers look up a donating **family** by the
number printed on a contribution envelope. This is optional; it is off for new
ChurchCRM installations.

## Turn on envelope numbering

1. An administrator opens **Admin → System Settings → Financial Settings**.
2. Enable **Use donation envelopes** (the `bUseDonationEnvelopes` setting).
3. Save the system settings.

Once enabled, the envelope manager and envelope-related finance fields appear
where your account has access. The feature is available to users with
**Finance** permission; an administrator controls the system-wide setting.

## Assign a number to one family

1. Find the family record and open the family editor.
2. In **Envelope Info**, enter its **Envelope Number** as an integer.
3. Save the family.

A number of **0** means *no envelope assigned*. Numbers are not automatically
checked for uniqueness: two families can have the same number.

## Assign numbers to many families

Open **Finance → Admin → [Envelope Manager](./envelope-manager.md)**.

1. Use **Family Select** to choose a classification or show all families.
2. Choose whether to sort by **Last Name** or **Envelope Number**.
3. Set or edit numbers beside the families. **Assign starting at #** can fill
   a sequence; **Zero** clears the displayed families' envelope numbers.
4. Click **Update Family Records** and confirm. Editing numbers on the screen
   alone does **not** save them.
5. Use the print control beside **Update Family Records** for the Envelope Report.

Duplicate numbers are highlighted in the manager. Review these before saving.

## Find the right family when entering a payment

Users with **Finance** permission can type an envelope number in the family
picker on the payment editor. Matching families show an **(Envelope #N)**
label. If more than one family shares a number, several results may appear;
**verify the family name** before recording the donation.

This lookup is introduced with the payment-editor changes in #10383. On an
older ChurchCRM installation without those changes, select the family by
name instead.

## Where else envelope numbers appear

- **Envelope Report:** print a list of assigned envelope numbers.
- **Tax reports:** identify the relevant family by its envelope number.
- **[Fund Contributors](./fund-contributors.md):** the **Envelope** column
  appears when the feature is enabled.
- **[Pledge Dashboard](./pledge-dashboard.md):** the **Envelope** column
  appears when the feature is enabled.

Envelopes are **plain integer family identifiers**, not a record of physical
cash or a unique account number. A blank or zero envelope number means no
assignment, and duplicate numbers require human confirmation.

For entering donations, see the [Finances guide](./finances.md).
