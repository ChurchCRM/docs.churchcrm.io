---
title: Reset Password
sidebar_position: 6
---

# Reset Password

## MySQL Client direct DB intervention

This section uses SQL statements that need to be executed in a tool such as phpMyAdmin in the same database configured for ChurchCRM. Alternatively, if you have command line access to your database, log into the ChurchCRM database using the `mysql` command line tool, e.g.:

`mysql --user=ccrmDBusername --password=ccrmDBpassword ccrmDB`

### Option 1. Change password for a user and set arbitrary password

ChurchCRM currently uses SHA256 hash of the plain text password salted with the ID of the user record. Securing the method of password hashing is discussed in [issue #2342](https://github.com/ChurchCRM/CRM/issues/2342)

```SQL
UPDATE `user_usr` SET
    `usr_Password` = SHA256(CONCAT("SECRET_PASSWORD", usr_per_ID)),
    `usr_NeedPasswordChange` = 0,
    `usr_FailedLogins` = 0
WHERE usr_per_ID = 1
  AND usr_UserName = 'Admin';
```

You can now log into the ChurchCRM web interface with whatever password you used where "`SECRET_PASSWORD`" is displayed above. The `admin` user will **not** be prompted to change their password.

### Option 2. Reset the `admin` user to installation default

The following SQL resets the `admin` user to the installation default (username `admin`, password `changeme`). See [FAQs](/administration/faqs#how-do-i-log-into-a-fresh-install) for default login details. As above, it needs to be executed in phpMyAdmin/`mysql` against the ChurchCRM database. This process resets the `admin` user login behavior to the same as a new installation without changing *anything else* in the database.

```SQL
UPDATE `user_usr` SET
    `usr_Password` = '4bdf3fba58c956fc3991a1fde84929223f968e2853de596e49ae80a91499609b',
    `usr_NeedPasswordChange` = 1,
    `usr_FailedLogins` = 0
WHERE usr_per_ID = 1
  AND usr_UserName = 'Admin';
```

You can then log in as `admin` with password `changeme`; you will be prompted to change it on first login.
