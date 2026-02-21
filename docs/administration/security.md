---
title: Security
sidebar_position: 3
---

# Security

> ChurchCRM should only run on HTTPS connections.
>
> If you don't have an SSL certificate for your domain, Lets Encrypt provides free SSL certificates that may fit your needs.

## User Accounts

Any "Person" in ChurchCRM may be promoted to a "User."  By default, a "Person" in ChurchCRM is not allowed to log into the system until an administrator provisions them with a user account.

## Role Based Access Control

ChurchCRM contains many roles to control access to your church's sensitive data:

* Add Records
* Edit Records
* Delete Records
* Manage Properties and Classifications
* Manage Groups and Roles
* Manage Donations and Finance
* View, Add, and Edit Notes
* Edit Self
* Admin

## Granular Permissions

In addition to the above roles, the following actions are controlled granularity "Per-User":

* `bEmailMailto`
* `sMailtoDelimiter`
* `bCreateDirectory`
* `bExportCSV`
* `bUSAddressVerification`
* `bAddEvent`

## Developer Notes

Security is currently handled by `$_SESSION` variables. If a user has been assigned a given role, the name of that role will be present as a key in the `$_SESSION` array.

```php
if($_SESSION['bAdmin'])
{
  #This user has been assigned the Admin role
}
```

## Developer Security

For developers contributing to ChurchCRM, see the [Developer Security Guide](Developer-Security) which covers security best practices including Content Security Policy (CSP) compliance.
