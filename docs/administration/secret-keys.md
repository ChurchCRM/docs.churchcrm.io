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
2. Click your name in the top-right navigation bar
3. Select **Manage Two-Factor Authentication**
4. Scan the QR code with your authenticator app
5. Enter the 6-digit code to confirm enrollment

Once enrolled, you will be prompted for a TOTP code on every login.

## Admin controls

Administrators can require all users to enroll in 2FA before accessing the system.

Go to **Admin** → **System Settings** → **Security** and enable **Require 2FA for all users**.

When this setting is on:
- Users who have not enrolled are allowed to log in but are redirected to the enrollment page on every request until they complete setup.
- Users cannot access any other part of the system until enrollment is complete.

## Recovery codes

During enrollment, recovery codes are generated. These one-time-use codes allow a user to log in if they lose access to their authenticator app. Users should store these codes securely.
