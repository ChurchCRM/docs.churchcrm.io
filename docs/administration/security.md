---
title: Account security
sidebar_position: 3
---

# Account security

> ChurchCRM should only run over HTTPS connections.
>
> If you do not have an SSL certificate for your domain, Let's Encrypt provides free SSL certificates that may meet your needs.

## User Accounts

Any person record in ChurchCRM can be promoted to a staff user account, which signs in at `/admin/`. Nobody signs in as staff until an administrator gives them a user account.

Members sign in to the Member Portal with their own email address and have no user account. Whether they may, and what they can do there, is set on [Member sign-in](./member-sign-in.md) and [Portal permissions](./portal-permissions.md). **Disable sign-in** on a person's page stops both kinds of sign-in.

## Role-Based Access Control

ChurchCRM uses roles to control access to sensitive data. The available roles are:

- Add Records
- Edit Records
- Delete Records (people and families)
- Manage Groups and Roles
- Manage Donations and Finance
- View, Add, and Edit Notes
- Admin

## Permissions Matrix

| Permission | Add Records | Edit Records | Delete Records | Manage Groups | Finance | Notes | Admin |
|------------|:-----------:|:------------:|:--------------:|:-------------:|:-------:|:-----:|:-----:|
| View people & families | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Run reports, print letters & labels | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Add people/families | ✓ | | | | | | ✓ |
| Edit existing records | | ✓ | | | | | ✓ |
| Assign properties to people & families | | ✓ | | | | | ✓ |
| Why Came, Verify People report & email | | ✓ | | | | | ✓ |
| Delete people & families | | | ✓ | | | | ✓ |
| Groups, roles, group types | | | | ✓ | | | ✓ |
| Assign properties to groups | | | | ✓ | | | ✓ |
| Donations & finance | | | | | ✓ | | ✓ |
| Add/edit/view notes | | | | | | ✓ | ✓ |
| Define properties, property types, classifications & custom fields | | | | | | | ✓ |
| All admin functions | | | | | | | ✓ |

A member who only needs to keep their own details up to date uses the [Member Portal](../user-guide/member-portal.md) and needs no user account.

## Other access switches

There is no Permission Groups screen and no Security & Permissions menu.

- **Mailto links** are the per-user **User Config** value **bEmailMailto** on **Edit User**. There is no `sMailtoDelimiter`.
- **Manage Events** is a permission on **Edit User** when events are enabled. It is not a separate menu.

## Media Privacy

### Member Photo Folder Protection

Member and family photo directories are protected from unauthenticated access. Web requests to photo folder paths without a valid logged-in ChurchCRM session are blocked (HTTP 403).

This applies to:
- Member/person photo uploads
- Family photo uploads

**What this means in practice:**
- Member photos can no longer be accessed by guessing or scraping directory URLs without being logged in.
- Any external integrations or kiosk displays that embedded direct photo URLs (without a valid ChurchCRM session) will need to be updated to authenticate first.
- The ChurchCRM directory listing feature is unaffected — it continues to display photos to logged-in users normally.

## Two-Factor Authentication (2FA)

Users enroll from the user menu item **Manage Two-Factor Authentication**. An administrator clears 2FA with **Disable 2FA** on **Admin → System Users**.

Supported method: **TOTP** (compatible with Google Authenticator, Authy, 1Password, and any RFC 6238 app). Recovery codes are generated at enrollment — advise users to store them safely.

### Requiring 2FA

Administrators require 2FA from **Admin → System Users → Settings → Quick Settings** (**Require all users to enroll in two-factor authentication**). The same panel has minimum password length and the failed-login lockout. **2FA Grace Period Days** on that panel controls how long a user has to finish enrollment. The default is **7 days**; set the grace period to **0** for immediate enforcement.

During the grace period, users can continue signing in and see a warning reminding them to enroll. The warning becomes more urgent when one day or less remains. Once the grace period expires, the user must complete 2FA enrollment before continuing to use ChurchCRM.

If a user disables their own 2FA while mandatory 2FA is active, a new grace window begins for that user. Disabling the system-wide mandate does not erase the stored grace-start timestamp.
