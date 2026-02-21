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

## Granular Permissions

In addition to the roles above, the following permissions are controlled on a per-user basis:

- Email via mailto links
- Mailto delimiter
- Create directory
- Export CSV
- US address verification
- Add event
