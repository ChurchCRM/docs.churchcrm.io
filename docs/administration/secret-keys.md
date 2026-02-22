---
title: Secret Keys in Config.php
sidebar_position: 4
---

# Secret Keys in Config.php

ChurchCRM supports 2 Factor Authentication (2FA) using Timed One-Time Passwords (TOTP).

These TOTP codes are generated using an app like Google Authenticator / Microsoft Authenticator, or similar.

In order for an authenticator app to generate valid codes for use with ChurchCRM, the app must be enrolled in your specific instance of ChurchCRM (using a QC code) to obtain a "secret value" used for generating the TOTP codes.

The secret value used for TOTP code generation is randomly generated and is unique for each user in your database, and it is stored in an encrypted form within your ChurchCRM database. This value must be retrieved by the application every time a user wishes to validate a TOTP code, so the secret cannot be stored in a hashed form.

The encryption key used to store this this random, per-user TOTP generation secret is generated using the value you supply here for `$TwoFASecretKey` in your installation's `/path/to/ChurchCRM/Include/Config.php.`

This `TwoFASecretKey` is stored separately from the database in order to protect the TOTP generation secrets from compromise in the event a malicious actor acquires a dump of only your ChurchCRM database (but not your application configuration files).

Having both a database dump, *and* this `Config.php` file, TOTP secrets may be necessarily recovered.

For example:

```php
$sSERVERNAME = 'localhost';
$dbPort = '3306';
$sUSER = 'churchcrm';
$sPASSWORD = 'churchcrm';
$sDATABASE = 'churchcrm';
$TwoFASecretKey = 'YourSuperSecretRandomStringGoesHere_BetweenTheSingleQuotes';
```

**Do NOT use the secret in the configuration above!!**

Some good sources of random strings (*30-60 characters should be plenty*):

* Most password management systems have a password generation tool (*1Password, LastPass, Dashlane, etc*)
* [https://passwordsgenerator.net](https://passwordsgenerator.net)
* command line tool `pwgen` - e.g., `pwgen -nsB1 30 5` will generate 5 different 30-character secrets to choose from. Pick one that looks appealing.
* `/dev/urandom` can be used for one-shot string generation too. eg, `head /dev/urandom | LC_CTYPE=C tr -dc "[:alnum:]" | head -c 30 ; echo ''` will generate a single 30-character string. Note, the "odd" invocation of `tr` is to work around nuances in MacOS/BSD-based operating systems.

Once you update your `Config.php` with your random string, the error should go away and you can now use 2FA with ChurchCRM.
