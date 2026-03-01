---
id: index
title: Public API Overview
sidebar_label: Overview
slug: /api/public
---

# ChurchCRM Public API

The Public API provides endpoints that require **no authentication**. These are used for:

- **Self-registration** — new families and individuals can register themselves
- **Public calendar access** — share calendar events via a secure token
- **Login** — exchange username/password for an API key
- **Reference data** — country and state/province lookups

## Base URL

```
https://your-server.com/api
```

## No authentication required

All endpoints under `/public/*` are accessible without an API key. This is intentional — they power public-facing features like registration forms and embedded calendars.

## Getting an API key

Use `POST /public/user/login` with your ChurchCRM credentials to receive an `apiKey`. Use this key in the `x-api-key` header for all [Private API](/api/private) calls.

## Self-registration

Registration endpoints are only active when **public registration is enabled** in ChurchCRM's system settings (Administration → Settings → Public Registration).
