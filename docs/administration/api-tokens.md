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

Pass the token in the `Authorization` header on every API request:

```http
GET /api/people HTTP/1.1
Host: your-church.example.com
Authorization: Bearer YOUR_TOKEN_HERE
```

Or with curl:

```bash
curl -H "Authorization: Bearer YOUR_TOKEN_HERE" \
     https://your-church.example.com/api/people
```

---

## Token Scopes

Tokens inherit the permissions of the user account that created them. A token created by an Admin account has Admin-level access; a token from a view-only account has view-only access.

There is currently no way to create a token with reduced permissions relative to your account.

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

- [Public API](../api/public/index.md) — Endpoints accessible to all authenticated users
- [Private API](../api/private/index.md) — Admin-only endpoints (requires Admin role)
