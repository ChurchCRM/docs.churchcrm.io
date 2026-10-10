---
title: Find people and families
sidebar_position: 9
---

# Find people and families

The search field is in the page header. The placeholder is **Search people, families, groups…**. Start typing. Results appear as you type. It is not a box in the left sidebar.

## What you can search

| Category | What is searched | Notes |
|----------|------------------|-------|
| **People** | First name, middle name, last name, email, work email, and home, cell, and work phone | Living people only |
| **Families** | Family name | Family custom properties are included only when **Include family custom properties in global search** is on. That switch is off by default. |
| **Groups** | Group names | Partial matches work |
| **Addresses** | Street addresses | Family addresses |
| **Calendar events** | Title, description, and event text | |
| **Payments** | Check numbers and amount ranges | Finance permission required |
| **Deposits** | Deposit id and comments | Finance permission required |

### Searching by Amount Range

To find payments within a specific range, format your search as `min-max`:
- `100-500` finds payments between $100 and $500
- `1000-5000` finds payments between $1,000 and $5,000

> **Note:** Financial search results only appear for users with finance permissions.

---

## Configuring Search

Administrators can customize search behavior:

1. Go to **Admin → System Settings → Quick Search**.
2. For each result type you can turn that type on or off and set how many results to show.
3. **Include family custom properties in global search** is off unless you turn it on. When it is off, family custom property values are not part of header search.
