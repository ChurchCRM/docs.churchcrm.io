---
title: Volunteers
sidebar_position: 13
---

# Volunteers

:::info Legacy feature
This page describes **Volunteer Opportunities (V1)**, the original volunteer feature. ChurchCRM 7.8.0 adds [Volunteer Management (v2)](./ministries/index.md): ministries, teams, positions, schedules, assignments and reminder email. V1 is being retired in early 2027: it is shown only while your church still uses it, and a new installation sees V2 only. While V1 is in use, administrators see a retirement notice on the Admin Dashboard (dismissible until the next upgrade), on the Volunteer Opportunity Editor, on a person's Volunteer tab and on the Feature Toggles page. The first release after about 2027-01-10 converts any opportunities that are left and removes V1, so convert before then. Choose **Both** on **Admin → Ministry Settings** (*Volunteer experience*) to run the two side by side while you move over, with a person record showing a **Volunteer (Legacy)** tab beside the new **Volunteer** tab. To move your opportunities across, use **Admin → People Settings → Convert Volunteer Opportunities** (see [Moving to Volunteer Management (v2)](#moving-to-volunteer-management-v2)). Switching never deletes V1 data. Retiring V1 is tracked in ChurchCRM issue #9702.
:::

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
2. Open the **Volunteer** tab (**Volunteer (Legacy)** when the volunteer experience is Both)
3. Under **Assign a New Volunteer Opportunity**, choose the opportunities they're willing to help with
4. Click **Assign Opportunities**

## Moving to Volunteer Management (v2)

**Admin → People Settings → Convert Volunteer Opportunities** moves your opportunities across. The retirement notice links to the same page (**Review the conversion**). Nothing changes until you confirm.

1. Choose where they go: **A new ministry** (a name is filled in for you; change it if you like) or **An existing ministry**. Every opportunity becomes a position on that ministry's first team, and everyone linked to it becomes qualified for that position.
2. To make an opportunity a ministry of its own instead, set its **Becomes** choice to **Its own ministry**.
3. Check the preview before you run it. The **What will happen** card counts the positions, the new ministries of their own, the volunteers qualified and the links that cannot convert. In the table, a name that is already taken is renamed to keep names unique, and the note says so.
4. People who have died are listed by name under **Not converted**; people who are no longer in ChurchCRM are listed by record number. They are skipped. Converted positions start with self sign-up off.
5. Click **Convert** and confirm. The conversion sends no email. If your church is on V1, Volunteer Management switches to **Both**, so the new ministries are visible next to Volunteer Opportunities.

You can run the conversion again later. It converts only what is new: new opportunities, and people linked to an opportunity after it was converted. A qualification you removed in Ministries stays removed.

The original opportunities are left as they are until V1 is removed. Once nothing is left to convert, V1 is hidden.

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
