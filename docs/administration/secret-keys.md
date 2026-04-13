---
title: Two-Factor Authentication (2FA)
sidebar_position: 4
---

# Two-Factor Authentication (2FA)

ChurchCRM supports Two-Factor Authentication (2FA) using Timed One-Time Passwords (TOTP), compatible with apps like Google Authenticator, Microsoft Authenticator, and Authy.

## How it works

Each user's TOTP secret is randomly generated during enrollment and stored encrypted in the ChurchCRM database. An encryption key is automatically generated and managed by the system — no manual configuration is required.

## User enrollment

Any user can self-enroll in 2FA at any time:

1. Log in to ChurchCRM
2. Click your name in the top-right navigation bar and choose **User Settings**
3. Open the **Two-Factor Authentication** tab
4. Scan the QR code with your authenticator app
5. Enter the 6-digit code to confirm enrollment
6. **Save the recovery codes** that appear — they are the only way to regain access if you lose your device

Once enrolled, you will be prompted for a TOTP code on every login.

:::tip Consolidated in User Settings
As of ChurchCRM 7.1, 2FA enrollment, recovery codes, and disabling 2FA all live on the same **User Settings** page as password, theme, and API token management. The older standalone "Manage Two-Factor Authentication" page has been removed. See [User Management](/administration/users) for the full list of User Settings tabs.
:::

## Admin controls

Administrators can require all users to enroll in 2FA before accessing the system.

Go to **Admin** → **System Settings** → **Security** and enable **Require all users to use 2FA**.

When this setting is enabled:
- Users who have not enrolled in 2FA are allowed to log in but are redirected to the enrollment page on every request until they complete setup.
- Users cannot access any other part of the system until enrollment is complete.
- Administrators can disable 2FA for a specific user from the **Users** management page if needed (e.g., account recovery).

## Recovery codes

During enrollment, recovery codes are generated. These one-time-use codes allow a user to log in if they lose access to their authenticator app. Users should store these codes securely.
