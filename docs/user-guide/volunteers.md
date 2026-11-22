---
title: Volunteers
sidebar_position: 13
---

# Volunteers

:::info Removed in ChurchCRM 7.8.6
This page describes **Volunteer Opportunities (V1)**, the original volunteer feature, as it worked before ChurchCRM 7.8.6. ChurchCRM 7.8.0 added [Volunteer Management (v2)](./ministries/index.md) — ministries, teams, positions, schedules, assignments and reminder email — and in 7.8.6 V1 was removed: the upgrade converted every remaining opportunity into a v2 position and every person linked to it into a qualification for that position, then dropped the V1 pages, tables and settings. A person record now shows only the **Volunteer** tab — there is no **Volunteer (Legacy)** tab, and no **Volunteer experience** setting to choose. Retiring V1 was tracked in ChurchCRM issue #9702.
:::

The procedures below describe the feature as it worked on those earlier versions.

The Volunteers feature helps you track member talents and willingness to serve in specific roles. This makes it easy to find the right people when needs arise.

## Common Volunteer Opportunities
- Baking / Meal preparation
- Childcare / Babysitting
- Grounds maintenance
- Music ministry
- Ushering / Greeting
- Technical support
- Teaching / Tutoring

## Setting Up Volunteer Opportunities

1. Go to **People → Admin → Volunteer Opportunities** (administrators; shown only while Volunteer Opportunities is in use).
2. The page title is **Volunteer Opportunity Editor**.
3. Click **Add New Opportunity** and enter the name and description your church uses.

## Assigning Volunteers to Opportunities

1. Open a [Person's](/user-guide/persons) record
2. Open the **Volunteer** tab (labelled **Volunteer (Legacy)** on a church running **Both**, where it sits beside the v2 **Volunteer** tab)
3. Under **Assign a New Volunteer Opportunity**, choose the opportunities they're willing to help with
4. Click **Assign Opportunities**

## Moving to Volunteer Management (v2)

On ChurchCRM 7.8.6 there is nothing to run: the upgrade converts any opportunities that were left, as described above. On ChurchCRM 7.8.0 to 7.8.5, convert by hand:

1. Go to **Admin → People Settings → Convert Volunteer Opportunities**.
2. The preview shows each opportunity, the ministry and position it becomes, and who comes with it. Each living person linked to an opportunity gets a qualification for that position; people who have died or can no longer be found are listed and skipped.
3. Click **Convert** to move them across. Converted positions start with self sign-up off. You can run it again later — it converts only what is new since the last run.
4. The original opportunities are left as they are. Once nothing is left to convert, V1 is hidden.

On ChurchCRM 7.7 or earlier there is no conversion to run — Volunteer Management (v2) first shipped in 7.8.0, so there is nothing to convert into. Upgrade to 7.8.6 instead; the upgrade converts any opportunities that are left.

## Finding Volunteers

When you need volunteers for a specific task:

1. Go to **Reports → People Reports**.
2. Click **Run** beside **Volunteers** (or **Volunteers for Two Opportunities** to find people who match two)
3. Choose the **Volunteer Opportunity**, and classifications if you like, and click **Run Report**
4. The report lists all [people](/user-guide/persons) who volunteered for that task
5. Click **Add All to Cart** to put them in the [Cart](/user-guide/cart) for further actions:
   - Create a contact directory
   - Print address labels
   - Send emails
