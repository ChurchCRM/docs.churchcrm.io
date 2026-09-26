---
title: API Tokens
sidebar_position: 9
---

# API Tokens

Personal API tokens let you (or your scripts and integrations) authenticate to the ChurchCRM API without using your password. Each token acts as a long-lived credential scoped to your user account.

---

## Generating a Token

1. Log in and click your avatar (top-right corner) → **My Settings**, or navigate directly to **Admin → Users → [your name] → Edit**
2. Open the **API Access** tab
3. Click **Generate New Token**
4. Copy the token immediately — it is shown **only once**. Store it somewhere safe (e.g., a password manager)

:::warning Treat tokens like passwords
Anyone with your token can authenticate to the API as you. Do not commit tokens to source control or paste them in chat messages.
:::

---

## Using a Token

Pass the token in the `x-api-key` header on every API request:

```http
GET /api/persons/latest HTTP/1.1
Host: your-church.example.com
x-api-key: YOUR_TOKEN_HERE
```

Or with curl:

```bash
curl -H "x-api-key: YOUR_TOKEN_HERE" \
     https://your-church.example.com/api/persons/latest
```

:::caution Use `x-api-key`, not `Authorization: Bearer`
ChurchCRM reads the token from the `x-api-key` header only. An `Authorization: Bearer …`
header is ignored, and the request fails with `401 {"error":"No logged in user"}`.
:::

Tokens are stateless — each request is authenticated independently. There is no session to
refresh and no token-expiry handshake.

### Base URL

ChurchCRM is self-hosted, and the API lives under the install root. If ChurchCRM is
installed in a subdirectory, include it:

```bash
https://your-church.example.com/api/persons/latest        # root install
https://your-church.example.com/crm/api/persons/latest    # installed in /crm
```

To confirm you have the right base URL before authenticating, call the unauthenticated
health check — it needs no token:

```bash
curl https://your-church.example.com/api/public/echo
# {"message":"echo"}
```

### Getting a token programmatically

Instead of generating a token in the UI, you can exchange a username and password for one:

```bash
curl -X POST https://your-church.example.com/api/public/user/login \
     -H "Content-Type: application/json" \
     -d '{"userName":"admin","password":"secret"}'
# {"apiKey":"YOUR_TOKEN_HERE"}
```

If the account has two-factor authentication enabled, this returns
`202 {"requiresOTP":true}` instead. Repeat the request with an `otp` field containing a
TOTP code or a recovery code:

```bash
     -d '{"userName":"admin","password":"secret","otp":"123456"}'
```

---

## Token Scopes

Tokens inherit the permissions of the user account that created them. A token created by an Admin account has Admin-level access; a token from a view-only account has view-only access.

There is currently no way to create a token with reduced permissions relative to your account.

Individual endpoints are gated by role (Finance, Admin, EditRecords, DeleteRecords,
ManageGroups, AddEvents, MenuOptions). Calling one your account lacks returns `403`, so a
client should treat a `403` as "this feature is unavailable to this user" rather than an
error. Retrying will not help — tokens are static.

---

## Revoking a Token

1. Go to **My Settings → API Access**
2. Find the token in the list
3. Click **Revoke** — the token is invalidated immediately

Revoked tokens cannot be restored. Generate a new token if you need access again.

---

## Rotating Tokens

As a security best practice, rotate tokens periodically:

1. Generate a new token
2. Update any scripts or integrations to use the new token
3. Revoke the old token

---

## API Reference

- [Public API](../api/public/index.md) — Requires **no authentication**: login, password reset, self-registration, public calendar feeds, and country/state lookups
- [Private API](../api/private/index.md) — Requires a token via `x-api-key`. Available to **any** authenticated user; individual endpoints are further restricted by role
