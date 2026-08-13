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
- US address verification
- Add event

> **Note:** Directory listing and CSV export are available to all authenticated users and do not require a per-user or per-group permission flag.

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

Users can self-enroll 2FA from **My Settings → Security**. Admins can reset 2FA for any user from the Users panel.

Supported method: **TOTP** (compatible with Google Authenticator, Authy, 1Password, and any RFC 6238 app). Recovery codes are generated at enrollment — advise users to store them safely.

### Mandatory 2FA

Administrators can require every user to enroll in 2FA by enabling **Require all users to enroll in two-factor authentication** (`bRequire2FA`) under **Admin → Settings → Security**.

When the mandate is turned on, two additional settings control what happens to users who have not yet enrolled:

| Setting | Key | Default | Description |
|---------|-----|---------|-------------|
| Require 2FA | `bRequire2FA` | Off | Mandate 2FA enrollment for all users. |
| Grace period (days) | `i2FAGracePeriodDays` | 7 | Days a user may continue using the system before enrollment is enforced. Set to `0` to block access immediately (legacy behavior). |

Both settings are found at **Admin → Settings → Security**.

### Grace Period Behavior

When `bRequire2FA` is enabled and `i2FAGracePeriodDays` is greater than zero, users who have not enrolled get a grace window:

1. **Grace period starts** — the first time the user logs in after the mandate is enabled, ChurchCRM records the start date. The user can continue using the system normally during this window.
2. **Warning banner** — a dismissible alert appears on every page while the grace period is active:
   - **Yellow** when more than one day remains: *"Two-factor authentication is required. You have N days to enroll."*
   - **Red** when one day or fewer remains.
   - A **Set up now** link takes the user directly to the enrollment page (`My Settings → Security → Two-Factor Authentication`).
3. **Enrollment** — the user visits the enrollment page, scans the QR code with their authenticator app (Google Authenticator, Authy, 1Password, or any RFC 6238-compatible app), enters the verification code, and saves. Enrollment clears the grace period timestamp and removes the banner.
4. **Grace period expires** — once the deadline passes the user is **blocked from all pages** on their next request and redirected to the 2FA enrollment page. They cannot access any other part of the system until they complete enrollment.

:::warning One-way ratchet
The grace period clock is a one-way ratchet. Once it has started, it cannot be reset by logging out, changing passwords, or any other action short of completing 2FA enrollment. Shortening `i2FAGracePeriodDays` after a grace window has already begun may cause some users' deadlines to pass immediately.
:::

### Grace Period — Admin Tips

- **Announce in advance.** Because the grace period starts on first login after the mandate is enabled, users who do not log in during the grace window will encounter the hard block the first time they do log in after the deadline. Send a notification before enabling the mandate so users can enroll proactively.
- **Setting `i2FAGracePeriodDays` to 0** replicates the original behavior: any user without 2FA is blocked immediately after the mandate is enabled, with no grace window.
- **Disabling 2FA under an active mandate.** If a user disables their 2FA enrollment while the mandate is on, ChurchCRM stamps a new grace-period start date, giving them a fresh window to re-enroll rather than locking them out instantly.
- **Turning the mandate off.** Disabling `bRequire2FA` stops enforcement and hides the banner for all users. The grace-period start timestamp is preserved in the database so it resumes if the mandate is re-enabled, without resetting the clock.
- **Admin reset.** Administrators can reset (delete) a user's 2FA enrollment from **Admin → Users → [user] → Reset 2FA**. After a reset, the user's grace-period clock is re-stamped on next login.
