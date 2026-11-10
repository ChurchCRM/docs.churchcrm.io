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

Members sign in to the Member Portal with their own email address and have no user account. Whether they may, and what they can do there, is set on [Member sign-in](./member-sign-in.md) and [Portal permissions](./portal-permissions.md). **Disable sign-in** on a person's page stops both kinds of sign-in, and so does the person being deceased or inactive.

With **Allow Login as Person** on (**Admin → Member Portal → Sign-in**, off at first), an administrator can open a person's Member Portal as that person from the person's **Actions** menu while member sign-in is on. It is read-only unless **Allow changes during Login as Person** is also on, it never opens a person who has a staff account, and every session is recorded. See [Login as Person](./member-sign-in.md#login-as-person).

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

## Sign-in limits

These protect the staff sign-in at `/admin/`. The settings are on **Admin → System Users → Settings → Quick Settings**, where 0 turns the account lock or the IP limit off.

- **An account locks** after 5 wrong passwords or two-factor codes in a row (*Maximum number of failed logins to allow before a user account is locked*). It unlocks by itself after the *Lockout period in minutes* (15), or at once with **Reset Failed Logins** on **Admin → System Users**. If email is set up, the user is emailed when it locks and when you unlock it.
- **An IP address is refused** after 20 failed sign-ins and password reset requests within the lockout period (*Maximum number of failed logins from one IP address*). **Reset Failed Logins** doesn't lift this; it ends with the period.
- **An account gets at most three password reset emails an hour.**
- **Every refusal looks the same.** A locked, throttled or blocked account sees *Invalid login or password*, just like a wrong password, so the page never shows which usernames exist. The **Failed Logins** and **Status** columns on **System Users**, and the auth log, show what happened.

:::note Behind a proxy or a shared connection
The IP limits count the address the web server reports for each visitor. Behind a reverse proxy, or when a whole office shares one connection, many people can share one address and reach the limit together. `CHURCHCRM_TRUSTED_PROXIES` doesn't change this; it only decides whether a proxied connection counts as HTTPS. If your web server can't pass on each visitor's own address, set the per-IP limits to 0.
:::

Member sign-in has its own limits per email address, per person and per IP address (**Sign-in emails per IP address per hour** on **Admin → Member Portal → Sign-in**). See [Member sign-in](./member-sign-in.md#how-email-sign-in-behaves).

## Other access switches

There is no Permission Groups screen and no Security & Permissions menu.

- **Mailto links** are the per-user **User Config** value **bEmailMailto** on **Edit User**. There is no `sMailtoDelimiter`.
- **Manage Events** is a permission on **Edit User** when events are enabled. It is not a separate menu.

## Media Privacy

### Member Photo Folder Protection

The person and family photo folders can't be opened directly from the web: a request for a file in them is refused (HTTP 403), signed in or not. ChurchCRM shows photos only on its own pages, to people who are signed in.

- Photos can't be found by guessing or scraping folder addresses.
- An outside display or integration that linked straight to a photo file has to fetch it through ChurchCRM's API instead.

## Two-Factor Authentication (2FA)

Staff can add an authenticator code to their username and password. See [Two-Factor Authentication](./secret-keys.md) for setup, signing in, recovery codes, and replacing a phone.

### Requiring 2FA

Administrators set the requirement and enrollment grace period under **Admin → System Users → Settings → Quick Settings**. See [Require 2FA for staff](./secret-keys.md#require-2fa-for-staff) for deadlines and [Help someone who lost access](./secret-keys.md#help-someone-who-lost-access) to reset one person's authenticator.
