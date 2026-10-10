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
2. Open the user menu (your name, top right) and click **Manage Two-Factor Authentication**
3. Scan the QR code with your authenticator app
4. Enter the 6-digit code to confirm enrollment
5. **Save the recovery codes** that appear — they are the only way to regain access if you lose your device

Once enrolled, you will be prompted for a TOTP code on every login.

:::tip
Enrollment is **Manage Two-Factor Authentication** in the user menu. Password, appearance, language, and the API key are on **Change Settings** (**Account**, **Appearance**, **Localization**, **API Access**, **Permissions**). See [User Management](/administration/users).
:::

## Admin controls

Administrators can require all users to enroll in 2FA before accessing the system.

Open **Admin → System Users**, click **Settings**, and in **Quick Settings** turn on **Require all users to enroll in two-factor authentication**.

When this setting is enabled:
- Users who have not enrolled in 2FA are allowed to log in but are redirected to the enrollment page on every request until they complete setup.
- Users cannot access any other part of the system until enrollment is complete.
- Administrators can choose **Disable 2FA** on **Admin → System Users** if needed (for example, account recovery).

## Recovery codes

During enrollment, recovery codes are generated. These one-time-use codes allow a user to log in if they lose access to their authenticator app. Users should store these codes securely.
