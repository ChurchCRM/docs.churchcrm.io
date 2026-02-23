---
title: Search
sidebar_position: 9
---

# Search

ChurchCRM offers a powerful search capability to quickly locate data within your application.

## Quick Start

The search bar is located in the **top-left corner** of the application. Simply start typing to search!

> **Keyboard Shortcut:** Press `?` anywhere in the app to open the search box.

![TODO-SCREENSHOT: Search bar with dropdown results showing People, Families, and Groups matches](/img/placeholder.png)

---

## What You Can Search

| Category | What's Searched | Notes |
|----------|-----------------|-------|
| **People** | First and last names | Partial matches work |
| **Families** | Family names, custom properties | Partial matches work |
| **Groups** | Group names | Partial matches work |
| **Addresses** | Street addresses | Searches family addresses |
| **Calendar Events** | Title, description, event text | |
| **Payments/Pledges** | Check numbers, amount ranges | Finance permission required |
| **Deposits** | Deposit comments | Finance permission required |

### Searching by Amount Range

To find payments within a specific range, format your search as `min-max`:
- `100-500` finds payments between $100 and $500
- `1000-5000` finds payments between $1,000 and $5,000

> **Note:** Financial search results only appear for users with finance permissions.

---

## Configuring Search

Administrators can customize search behavior:

1. Navigate to **Admin → System Settings → Quick Search**
2. For each result type, you can:
   - Enable/disable whether results of that type appear
   - Set a maximum number of results to display

This helps keep search results focused and relevant for your church's needs.
