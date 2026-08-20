---
id: index
title: Private API Overview
sidebar_label: Overview
slug: /api/private
---

# ChurchCRM Private API

The Private API covers all authenticated operations — people, families, groups, finance, calendar management, and system administration.

## Authentication

All private endpoints require an API key in the request header:

```http
x-api-key: your-api-key-here
```

### Getting your API key

**Option 1 — From the app:** Go to your user profile → **API Key** tab.

**Option 2 — Via API:**

```bash
curl -X POST https://your-server.com/api/public/user/login \
  -H "Content-Type: application/json" \
  -d '{"userName": "admin", "password": "secret"}'
```

Response:
```json
{ "apiKey": "your-api-key-here" }
```

## Role-based access

Beyond basic authentication, many endpoints require specific roles:

| Role | Description |
|---|---|
| **Finance** | Access to deposits and payments |
| **AddEvents** | Create and edit calendar events |
| **ManageGroups** | Group administration |
| **EditRecords** | Edit person and family records |
| **DeleteRecords** | Delete person and family records |
| **Admin** | System administration |

Requests to role-protected endpoints without the required role return **HTTP 403 Forbidden**.

## Base URL

```
https://your-server.com/api
```

Replace `your-server.com` with your ChurchCRM hostname.

---

## Email Endpoints (added 7.5.0)

These three endpoints power the [in-app email composer](../user-guide/email.md). All require the **EmailRole** permission.

### GET /api/people/emails

Returns the active-family mailing list grouped by classification role. Used by the "Email Members" button on the people dashboard.

```json
{
  "emails": ["alice@example.com", "bob@example.com"],
  "byRole": {
    "Head of Household": ["alice@example.com"],
    "Member": ["bob@example.com"]
  }
}
```

### GET /api/cart/emails

Returns email addresses of everyone currently in the cart. Same response shape as above.

### GET /api/groups/\{id\}/emails

Returns email addresses of all members of a group.

:::note Breaking change from 7.4.x
Prior to 7.5.0, this endpoint returned CSV strings: `{all: "a@b.com,c@d.com", roles: {name: "a@b.com"}}`. As of 7.5.0, it returns arrays: `{emails: [...], byRole: {name: [...]}}`. Update any external integration consuming the old format.
:::

```json
{
  "emails": ["eve@example.com", "frank@example.com"],
  "byRole": {
    "Leader": ["eve@example.com"],
    "Member": ["frank@example.com"]
  }
}
```
