---
title: Security
sidebar_position: 3
---

# Security

> ChurchCRM should only run over HTTPS connections.
>
> If you do not have an SSL certificate for your domain, Let's Encrypt provides free SSL certificates that may meet your needs.

## User Accounts

Any person record in ChurchCRM can be promoted to a user account. By default, a person is not permitted to log in until an administrator provisions them with a user account.

## Role-Based Access Control

ChurchCRM uses roles to control access to sensitive data. The available roles are:

- Add Records
- Edit Records
- Delete Records
- Manage Properties and Classifications
- Manage Groups and Roles
- Manage Donations and Finance
- View, Add, and Edit Notes
- Edit Self
- Admin

## Permissions Matrix

| Permission | Add Records | Edit Records | Delete Records | Manage Props | Manage Groups | Finance | Notes | Edit Self | Admin |
|------------|:-----------:|:------------:|:--------------:|:------------:|:-------------:|:-------:|:-----:|:---------:|:-----:|
| View people & families | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Add people/families | ✓ | | | | | | | | ✓ |
| Edit existing records | | ✓ | | | | | | ✓* | ✓ |
| Delete records | | | ✓ | | | | | | ✓ |
| Custom fields & classifications | | | | ✓ | | | | | ✓ |
| Groups, roles, group types | | | | | ✓ | | | | ✓ |
| Donations & finance | | | | | | ✓ | | | ✓ |
| Add/edit/view notes | | | | | | | ✓ | | ✓ |
| Edit own profile only | | | | | | | | ✓ | ✓ |
| All admin functions | | | | | | | | | ✓ |

*Edit Self allows a user to update their own person record only.

## Granular Permissions (Permission Group Level)

The following permissions are controlled at the **permission group level** (Admin → Permission Groups), not on a per-user basis:

- Email via mailto links
- Mailto delimiter
- Create Directory
- Export CSV
- US address verification
- Add event

:::note Changed in 7.4.3
Prior to 7.4.3, "Create Directory" and "Export CSV" appeared as checkboxes on each individual user's settings page. As of 7.4.3 these settings are **permission-group level only** and no longer appear in individual user settings. If you previously configured these per-user, you will need to set them at the permission group level instead (Admin → Permission Groups).
:::

## Media Privacy

### Member Photo Folder Protection (Added in 7.4.3)

As of ChurchCRM 7.4.3, the member and family photo directories are protected from unauthenticated access. Web requests to photo folder paths that do not have a valid logged-in ChurchCRM session are blocked (HTTP 403).

This applies to:
- Member/person photo uploads
- Family photo uploads

**What this means in practice:**
- Member photos can no longer be accessed by guessing or scraping directory URLs without being logged in.
- Any external integrations or kiosk displays that embedded direct photo URLs (without a valid ChurchCRM session) will need to be updated to authenticate first.
- The ChurchCRM directory listing feature is unaffected — it continues to display photos to logged-in users normally.

## Security Improvements in 7.x

**7.4.3** — Member and family photo folders are now protected: unauthenticated requests are blocked (HTTP 403). "Create Directory" and "Export CSV" permissions moved from per-user settings to permission groups only.

**7.2.2** — CSRF tokens added to all remaining delete pages (CVE: GHSA-3xq9-c86x-cwpp).

**7.2.1** — Essential security features (password change, 2FA) are now accessible regardless of permission level. A redirect loop on forced password change is fixed. Browser autofill blocked on the 2FA code field.

**7.1.1** — Stored XSS in ListOption name rendering patched (GHSA-j9gv-26c7-3qrh). CSP nonce added to inline scripts.

**7.1.0** — Session regenerated on login; cookies set `HttpOnly`, `SameSite=Lax`, `Secure`; minimum password length enforced at 8 characters; CSRF token on password-change endpoint.

## Two-Factor Authentication (2FA)

Users can self-enroll 2FA from **My Settings → Security** (added in 7.0.5). Admins can reset 2FA for any user from the Users panel.

Supported method: **TOTP** (compatible with Google Authenticator, Authy, 1Password, and any RFC 6238 app). Recovery codes are generated at enrollment — advise users to store them safely.
