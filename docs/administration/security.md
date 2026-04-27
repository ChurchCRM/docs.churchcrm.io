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

## Granular Permissions

In addition to the roles above, the following permissions are controlled on a per-user basis:

- Email via mailto links
- Mailto delimiter
- Create directory
- Export CSV
- US address verification
- Add event

## Security Improvements in 7.x

**7.2.2** — CSRF tokens added to all remaining delete pages (CVE: GHSA-3xq9-c86x-cwpp).

**7.2.1** — Essential security features (password change, 2FA) are now accessible regardless of permission level. A redirect loop on forced password change is fixed. Browser autofill blocked on the 2FA code field.

**7.1.1** — Stored XSS in ListOption name rendering patched (GHSA-j9gv-26c7-3qrh). CSP nonce added to inline scripts.

**7.1.0** — Session regenerated on login; cookies set `HttpOnly`, `SameSite=Lax`, `Secure`; minimum password length enforced at 8 characters; CSRF token on password-change endpoint.

## Two-Factor Authentication (2FA)

Users can self-enroll 2FA from **My Settings → Security** (added in 7.0.5). Admins can reset 2FA for any user from the Users panel.

Supported method: **TOTP** (compatible with Google Authenticator, Authy, 1Password, and any RFC 6238 app). Recovery codes are generated at enrollment — advise users to store them safely.
