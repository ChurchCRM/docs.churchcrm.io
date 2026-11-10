---
title: Two-Factor Authentication (2FA)
sidebar_position: 4
description: Set up an authenticator app, save recovery codes, replace a phone, and require two-factor authentication for staff accounts.
---

# Two-Factor Authentication (2FA)

Two-factor authentication adds a code from an authenticator app to your staff username and password. Use a TOTP app such as Google Authenticator, Microsoft Authenticator, Authy, or 1Password.

These instructions are for [staff accounts](./users.md). Members use [member sign-in](./member-sign-in.md).

## Set up your authenticator

1. Sign in to ChurchCRM and open the user menu (your name, top right).
2. Choose **Manage Two-Factor Authentication**, then **Get Started**.
3. Open your authenticator app, add an account, and scan the QR code.
4. Enter the six-digit code from the app in ChurchCRM. **Setup Complete** appears when the code is accepted.
5. Use **Print**, **Copy**, or **Download** to save the recovery codes somewhere you can reach without your phone, then choose **Done**.

The account added to your authenticator uses the church name followed by **(ChurchCRM)**, alongside your username. For example, **Grace Church (ChurchCRM)** helps you choose the right entry if you work with more than one church. The name comes from **Admin → Church Information**; there is no separate 2FA application-name setting.

If you choose **Generate new code** during setup, scan the replacement QR code before entering a code from your app.

## Sign in with 2FA

1. Sign in at `/admin/` with your username and password.
2. Enter the current six-digit code from your church's entry in the authenticator app.
3. Choose **Verify & Sign In**.

If a code is rejected, check that you selected the right church and account, wait for a fresh code, and try again. Check that your phone's date and time are set automatically. Repeated incorrect codes count toward the [sign-in lockout](./security.md#sign-in-limits).

## Use a recovery code

Each recovery code works once and replaces the authenticator code for that sign-in. You still need your username and password.

1. Sign in with your username and password.
2. On the code screen, choose **Use a recovery code instead**.
3. Enter one unused recovery code and choose **Verify & Sign In**.

Mark that code as used in your saved copy. Using a recovery code does not turn off 2FA.

If you cannot use your authenticator and have no recovery codes left, ask a church administrator to [reset your 2FA](#help-someone-who-lost-access).

## Replace a phone or lost recovery codes

If you still have your old authenticator or an unused recovery code:

1. Sign in, then open **Manage Two-Factor Authentication** from the user menu.
2. Choose **Disable Two-Factor Authentication** and confirm.
3. Choose **Get Started** and enroll your replacement authenticator.
4. Save the new recovery codes and discard the old ones. The old authenticator entry and recovery codes no longer work after you enroll again.

Newly scanned QR codes use the church name saved at enrollment. Changing the church name does not rename entries already saved in an authenticator app.

## Turn off your own 2FA

Open **Manage Two-Factor Authentication**, choose **Disable Two-Factor Authentication**, and confirm. If your church requires 2FA, you must enroll again within the allowed grace period; with a zero-day grace period, you must enroll immediately.

## Require 2FA for staff

Administrators manage the requirement under **Admin → System Users → Settings → Quick Settings**.

1. Set **Number of days users have to enroll in 2FA after it is mandated**. The default is **7 days**; **0** requires enrollment immediately.
2. Turn on **Require all users to enroll in two-factor authentication**.

During the grace period, staff can continue working and see an enrollment reminder. Each person's grace period starts when they first encounter the requirement. After it expires, ChurchCRM sends them to enrollment before they can continue. Staff who already have 2FA keep their existing setup.

Shortening the grace period can require people to enroll immediately if their deadline has already passed. Turning the requirement off does not disable anyone's existing 2FA or clear their recorded grace-period start.

## Help someone who lost access

An administrator can clear 2FA when a staff member has lost both their authenticator and recovery codes:

1. Open **Admin → System Users**.
2. Open the person's row menu and choose **Disable 2FA**.
3. Confirm, then ask the person to sign in and set up their authenticator again.

This clears the old authenticator and recovery codes. If 2FA is required, the person receives a fresh grace period; a zero-day grace period requires immediate enrollment.
