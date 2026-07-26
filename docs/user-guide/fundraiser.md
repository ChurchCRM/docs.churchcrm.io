---
title: Fundraiser
sidebar_position: 17
---

# Fundraiser

The Fundraiser feature helps you manage events — auctions, raffles, galas, bake sales — where members buy and sell items or services to benefit the church.

**Supported types:**
- Auction / Silent Auction / Live Auction
- Raffle
- Gala
- Mixed

> **Tip:** This feature works best when most buyers and sellers are already in your ChurchCRM database.

---

## Dashboard

The Fundraiser landing page shows all active fundraisers in an enriched table with stat widgets and filters.

**Stat widgets** at the top show counts of active, planning, and closed fundraisers.

**Filters:** narrow by Type, Status, or date range using the filter bar above the table.

**Table columns:** Title, Type, Date range, Status, Items, Raised, Goal (with % progress bar), Buyers.

### Archive section

Fundraisers marked **Closed**, or whose End Date has passed, move to a collapsible **Archive** card at the bottom of the page. The archive card is hidden when a Status filter is applied, since the active/archive split doesn't apply to a filtered view.

---

## How is a fundraiser created?

Select **Fundraiser → Create New Fundraiser**. Fill in the fields and press **Save**.

### Fundraiser fields

| Field | Description |
|-------|-------------|
| **Title** | Name of the fundraiser |
| **Date** | Start date |
| **End Date** | When the event closes; used by the archive split |
| **Description** | Details shown in catalog and printed materials |
| **Type** | Auction, Silent Auction, Live Auction, Raffle, Gala, or Mixed |
| **Status** | Planning, Active, or Closed |
| **Goal Amount** | Fundraising target; displayed as a progress bar on the dashboard |
| **Associated Fund** | Links the fundraiser to a Finance fund for reporting |

---

## View page

Each fundraiser has a **read-only view page** at `/fundraiser/view/{id}` showing:
- Details card (all fields)
- Goal progress bar
- Donated items table
- At-a-Glance and Financials sidebar cards

From the view page you can also **Add Item** directly. A **View** link on the editor page takes you to the view page.

---

## How are donated items entered?

Once the fundraiser is saved, press **Add Donated Item** from either the edit or view page.

| Field | Description |
|-------|-------------|
| **Item** | Identifier used for sorting |
| **Multiple items: Sell to everyone** | Enable to allow multiple copies to be sold; buyers are charged per quantity |
| **Donor** | A [person](Persons) in the database |
| **Title** | Short description |
| **Estimated Price** | Reference value for the item |
| **Material Value** | Donation value excluding labor |
| **Minimum Price** | Lowest acceptable price, for reference |
| **Description** | Longer description for catalog and bid sheet |
| **Buyer** | Filled in once a purchase is finalized |
| **Final Price** | Price paid; applies to all _Sell to everyone_ copies |

---

## Reports — availability by fundraiser type

Some reports are only available for certain types:

| Report | When available |
|--------|---------------|
| **Bid Sheets** | Auction and Silent Auction only |
| **Catalog / Certificates** | All types except Raffle |
| **Buyer Statements** | All types |
| **Donated Items / Batch Winner Entry** | All types |

These restrictions are enforced in both the UI and at the route level — accessing a report URL directly for an ineligible type redirects away.

---

## Why and how are buyers registered?

Buyers are registered so they can purchase multiple items and pay at the end. Select **Fundraiser → View Buyers**, then **Add Buyer**. Buyer numbers increment automatically (or type them to match a bidding paddle). The buyer must be a person in the database.

---

## How is a single purchase recorded?

Select **Fundraiser → Edit Fundraiser** to see the items list. Click the item link on the left, select the buyer, enter the price, and press **Save**.

---

## Is there a way to enter lots of purchases quickly?

Select **Fundraiser → Edit Fundraiser** then press **Batch Winner Entry** (upper-right). Enter up to ten items per page — select Item and Winner, enter price, then press **Enter Winners**.

---

## How are multiple-purchase items recorded?

Select **Fundraiser → View Buyers** and click a buyer's link. Enter quantities for each _Sell to Everyone_ item on their page.

---

## How does someone check out and pay?

1. Select **Fundraiser → View Buyers** and click the buyer's link.
2. Confirm the _Sell to Everyone_ quantities.
3. Press **Generate Statement** — a PDF statement is produced showing donations and purchases, with a payment stub at the bottom.

---

## What if a donor doesn't attend? How can a statement be prepared?

After all donations and purchases are entered, select **Fundraiser → Add Donors to Buyer List**. This creates buyer records for anyone who donated but wasn't registered as a buyer. Their statements can then be generated for tax purposes.

---

## System Calendar

Fundraisers appear on the main **Calendar** page. Toggle the **Fundraisers** layer in the calendar to show or hide them. Each fundraiser appears on its start date (and end date if set).
