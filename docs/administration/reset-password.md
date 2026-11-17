---
title: Reset Password
sidebar_position: 6
---

# Reset Password

## MySQL Client direct DB intervention

This section uses SQL statements that need to be executed in a tool such as phpMyAdmin in the same database configured for ChurchCRM. Alternatively, if you have command line access to your database, log into the ChurchCRM database using the `mysql` command line tool, e.g.:

`mysql --user=ccrmDBusername --password=ccrmDBpassword ccrmDB`

Use this only when you cannot sign in and no other administrator can open **System Users** and choose **Change Password** or **Reset Password via Email**.

New passwords are stored with PHP's bcrypt hash. MySQL cannot write that hash. The statements below write the older SHA-256 form ChurchCRM still accepts. The next successful sign-in replaces it with bcrypt. MySQL has no `SHA256()` function. Use `SHA2(..., 256)`. The value is the password followed by that account's person id, with nothing between them.

Replace `SECRET_PASSWORD` with the password you want, and replace both `1` values with the person id of the account you are resetting. The username must be the one on **System Users**. A new installation's administrator is `admin`, person id `1`.

### Option 1. Set a password and sign in with it

```SQL
UPDATE `user_usr` SET
    `usr_Password` = SHA2(CONCAT('SECRET_PASSWORD', usr_per_ID), 256),
    `usr_NeedPasswordChange` = 0,
    `usr_FailedLogins` = 0
WHERE usr_per_ID = 1
  AND usr_UserName = 'admin';
```

Sign in with the password you put in place of `SECRET_PASSWORD`. This account is not asked to change it.

### Option 2. Reset the `admin` user to the installation default

This works only when that account's person id is `1`. The hash below is `changeme` followed by `1`. See [FAQs](/administration/faqs#how-do-i-log-into-a-fresh-install). Nothing else in the database changes.

```SQL
UPDATE `user_usr` SET
    `usr_Password` = '4bdf3fba58c956fc3991a1fde84929223f968e2853de596e49ae80a91499609b',
    `usr_NeedPasswordChange` = 1,
    `usr_FailedLogins` = 0
WHERE usr_per_ID = 1
  AND usr_UserName = 'admin';
```

Sign in as `admin` with password `changeme`. ChurchCRM asks for a new password at that sign-in.
