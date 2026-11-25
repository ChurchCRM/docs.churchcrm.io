---
title: Database Setup Troubleshooting
description: "Fix ChurchCRM database connection problems: every setup wizard and error page message, what it means, and the fix for shared hosting, Docker, Softaculous and self-hosted servers."
---

# Database Setup Troubleshooting

ChurchCRM stores everything — people, families, giving, events — in a MySQL or MariaDB database. When ChurchCRM cannot reach or use that database, setup stops, or a running site shows a database error page. This page covers every one of those messages: what it means, why it happens, and how to fix it on each kind of hosting.

## The four settings every install needs

Every database connection uses the same four values. Most connection problems are one of these four being wrong for the environment the site runs in.

| Setting | In the setup wizard | In `Include/Config.php` |
| --- | --- | --- |
| Database host | Database Host | `$sSERVERNAME` |
| Database name | Database Name | `$sDATABASE` |
| Database user | Database User | `$sUSER` |
| Database password | Database Password | `$sPASSWORD` |

What those values usually are depends on the hosting:

| Hosting | Host | Name and user | Password |
| --- | --- | --- | --- |
| Shared hosting (cPanel) | Often `localhost`, but not always — your host's database page has the real value | Usually prefixed with your account name, like `mychurch_churchcrm`. The user must also be **assigned** to the database in the hosting panel | The password you set when you created the database user |
| Docker (official compose file) | `db` — the database service name. Never `localhost` or `127.0.0.1` | The `CHURCHCRM_DB_NAME` and `CHURCHCRM_DB_USER` values from your `.env` file | The `CHURCHCRM_DB_PASSWORD` value from your `.env` file |
| Softaculous | Set by Softaculous at install time | Chosen on the Softaculous install screen | Chosen on the Softaculous install screen |
| VPS / self-hosted | `localhost` or `127.0.0.1` | The database and user you created on the server | The password you set when you created the user |

## Find your message

| What you see | Go to |
| --- | --- |
| "cannot reach a database" or "could not connect to MySQL" during setup | [The database host cannot be reached](#the-database-host-cannot-be-reached) |
| "The database server rejected that username or password" | [The username or password was rejected](#the-username-or-password-was-rejected) |
| "there is no database with that name" | [The database does not exist](#the-database-does-not-exist) |
| "could not connect to the database with these settings" | [The generic connection failure](#the-generic-connection-failure) |
| "The configuration file could not be saved" | [The configuration file could not be saved](#the-configuration-file-could-not-be-saved) |
| A running site shows **Database Connection Failed** | [A running site cannot connect](#a-running-site-cannot-connect) |
| A running site shows **Database Access Failed** | [A running site cannot use its database](#a-running-site-cannot-use-its-database) |
| A running site shows **Configuration Error** | [Configuration Error](#configuration-error) |
| "Database out of support" banner after signing in | [Database out of support](#database-out-of-support) |
| An upgrade or install step fails with a database permission error | [Permissions the database user needs](#permissions-the-database-user-needs) |

## The database host cannot be reached

The setup wizard says a variation of:

> ChurchCRM cannot reach the database server at that address and port. Check the host name and the port. On shared hosting the host is often not localhost. In Docker, the host is the database service name in your compose file — db in the official compose file.

or, when the host you entered is `localhost`:

> ChurchCRM cannot reach a database at localhost. Try 127.0.0.1 instead, or ask your web host for the database host name. In Docker, the host is the database service name in your compose file — db in the official compose file.

This means the web server could not open a network connection to the database server at all. The name, user and password were never even checked. Work through the causes for your hosting:

**Shared hosting**

- The database host is not always `localhost`. Some hosts run the database on a separate server with its own host name. Your hosting panel's database page (in cPanel, **MySQL Databases** or **Remote MySQL**) shows the host your plan uses — or ask your host directly: "What database host should a PHP application on my account use?"
- The database server may be down for maintenance. Wait a few minutes and try again; if other sites on the same host work, this is less likely.

**Docker**

- Inside the ChurchCRM container, `localhost` and `127.0.0.1` are the ChurchCRM container itself — there is no database there. The host is the database **service name** from your compose file: `db` in the [official compose file](/installation/docker).
- Check the database container is running and healthy: `docker compose ps`. The official compose file starts ChurchCRM only after the database passes its health check, so a database container that keeps restarting points at the database itself — read its log with `docker compose logs db`.

**VPS / self-hosted**

- Check the database service is running: `systemctl status mariadb` (or `mysql`).
- `localhost` connects over a Unix socket; `127.0.0.1` connects over TCP. If one fails, try the other — a socket problem and a network problem look identical from the wizard.
- If the database is on a different server, check that server accepts connections from the web server (its `bind-address` setting and any firewall), and use that server's host name or address.

## The username or password was rejected

> The database server rejected that username or password. Check for typos. On shared hosting, the user name often needs your account prefix, and the user must be assigned to the database in your hosting panel. In Docker, the user and password are the ones in your compose file.

The database server answered, but it does not accept that user and password **for a connection from this web server**. Causes, in order:

1. **A typo.** Retype the password rather than pasting it — a pasted password can pick up a leading or trailing space.
2. **The user name needs its full prefixed form.** On cPanel-style hosting the real user name is `account_user`, not just `user`. The hosting panel's database page lists the full name.
3. **The user is not assigned to the database.** Creating a user is not enough: in cPanel, go to **MySQL Databases → Add User To Database**, pick the user and the database, and grant **ALL PRIVILEGES**. An unassigned user is rejected even with the correct password. This is the most common cause on shared hosting.
4. **Docker: the values in `.env` changed after the first start.** The database container creates the user from `CHURCHCRM_DB_USER` / `CHURCHCRM_DB_PASSWORD` only when its data volume is first initialized. Editing `.env` later does not change the password inside the existing database. Either set the wizard values back to what the database was initialized with, change the password inside the database (sign in as root with `MARIADB_ROOT_PASSWORD`), or remove the `db-data` volume and start over — that deletes the database.
5. **The password was changed somewhere else.** Changing the database user's password in your hosting panel changes it for ChurchCRM too — update the wizard value, or `$sPASSWORD` in `Include/Config.php` on a running site.

Database users are also scoped to where they may connect from (a user is really `name`@`host`). A user created for `localhost` connections only will be rejected when the application connects from another container or server. Hosting panels handle this for you; if you created the user by hand, see [Creating the database and user](#creating-the-database-and-user).

## The database does not exist

> The database server accepted the login, but there is no database with that name. ChurchCRM cannot create the database for you — create it first, and check the name. On shared hosting, the name often needs your account prefix.

- **Create the database first.** ChurchCRM creates its tables, but not the database itself. On shared hosting, create it in the panel (cPanel: **MySQL Databases → Create New Database**), then make sure the user is [assigned to it](#the-username-or-password-was-rejected).
- **Check the prefix.** On shared hosting the real name is usually `account_databasename`. The panel lists the full name.
- **Docker:** the database is created from `CHURCHCRM_DB_NAME` when the database container's volume is first initialized. If you changed the name in `.env` after the first start, the database inside the existing volume still has the old name — use the old name, rename the database inside the container, or start over with a fresh volume (which deletes its data).

## The generic connection failure

> ChurchCRM could not connect to the database with these settings.

This is the fallback message when the failure does not match one of the specific causes above — for example the database server accepting the connection and then dropping it, or a restriction on the hosting account. Work through the four settings once more against [the table for your hosting](#the-four-settings-every-install-needs), then check your [ChurchCRM log](/administration/logging-and-diagnostics): the log records the server's exact error, which names the real cause. The [error code table](#test-the-connection-yourself) below translates the common server errors.

## The configuration file could not be saved

> ChurchCRM connected to the database, but the configuration file could not be saved. Check that the web server can write to the Include folder, then try again.

The connection worked — this failure is file permissions. The wizard writes `Include/Config.php`, and the web server needs write permission on the `Include` folder. On shared hosting, set the `Include` folder's permissions so the web server can write (755 on the folder is typical; your host can confirm), then click Install again. On Docker with the official setup this does not normally happen unless the container was started read-only before setup finished.

If you cannot change permissions, create the file by hand: copy `src/Include/Config.php.example` (in the release zip it is `Include/Config.php.example`) to `Include/Config.php` and fill in the four database values.

## A running site cannot connect

A site that was working and now shows **Database Connection Failed** — "Could not connect to MySQL on *host* on port *port* as *user*. Please check the settings in Include/Config.php." — has the same causes as [the host cannot be reached](#the-database-host-cannot-be-reached), plus the things that change under a running site:

- **The host migrated your site** to a new server, and the database host name changed. Ask the host for the new value and update `$sSERVERNAME` in `Include/Config.php`.
- **The database server is down or being upgraded.** Check your host's status page; wait and reload.
- **Someone edited `Include/Config.php`** and a value no longer matches. Compare it against your hosting panel's database page.
- **Docker:** the database container is stopped or its volume was removed. `docker compose ps` and `docker compose logs db` show which.

The page shows the host, port and user ChurchCRM is trying, so you can check those exact values against your panel before changing anything.

## A running site cannot use its database

**Database Access Failed** — "Could not access (or select) the MySQL database *name*" — means ChurchCRM connected and signed in, but cannot use that database:

- The database was **deleted or renamed** in the hosting panel. Restore it or update `$sDATABASE`.
- The user's **privileges were revoked** or the user was unassigned from the database. Re-assign it with ALL PRIVILEGES (see [the rejection causes](#the-username-or-password-was-rejected)).
- The account hit a hosting limit (some hosts suspend databases on resource or size limits) — your host can confirm.

## Configuration Error

The **Configuration Error** page means `Include/Config.php` itself could not be read: the file is missing, or it has a PHP syntax error from a hand edit. Restore the file from a backup, or fix the edit — the page shows the underlying error. If the file is gone entirely, run the [setup wizard](/getting-started/first-run) again by visiting `/setup`; it recreates the file and reconnects to your existing database without deleting its data. The [database settings](#the-four-settings-every-install-needs) in the file are `$sSERVERNAME`, `$sDATABASE`, `$sUSER` and `$sPASSWORD`.

## Database out of support

After signing in, administrators may see a red banner: "Database out of support — Your database (MySQL 8.0.46) is out of support and might be unsafe."

- ChurchCRM supports **MySQL @@mysql@@ or later** and **MariaDB @@mariadb@@ or later**. It still runs on MySQL 8.0+ and MariaDB 10.6+ — below the supported versions the database vendor no longer ships security fixes, so the banner is a security warning, not a block. Nothing stops working.
- Some shared hosts still run MySQL 8.0 on every plan, so the banner cannot be fixed from inside ChurchCRM on those hosts — it clears when the database reaches a supported version (a host upgrade, a plan change, or moving hosts).
- You can dismiss the banner: it collapses to a red warning icon in the top navigation that only administrators see, and clicking the icon shows the warning again. Dismissing is per administrator — it does not hide the warning from other administrators, and it reappears in full if the database version changes.
- To check your database version: the banner names it; phpMyAdmin shows it on its home page; or run `SELECT VERSION();` in any SQL tool.

## Permissions the database user needs

The database user needs **ALL PRIVILEGES on the ChurchCRM database** — and only on that database. It does not need global (server-wide) rights, and it should not have them.

Why all of them: setup creates the full table set, and every ChurchCRM upgrade changes tables — adding columns, indexes and tables, and occasionally dropping them. A user with only day-to-day rights (SELECT, INSERT, UPDATE, DELETE) can look fine on a running site and then fail an upgrade partway through with an error like "ALTER command denied to user". If your host makes you pick privileges one by one instead of offering ALL PRIVILEGES, the user needs, on the ChurchCRM database: SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, DROP, INDEX, CREATE TEMPORARY TABLES, LOCK TABLES, REFERENCES, CREATE VIEW, SHOW VIEW and TRIGGER.

- **cPanel:** privileges are granted in the same step that assigns the user to the database — **MySQL Databases → Add User To Database** → check **ALL PRIVILEGES**. See [Creating the database and user](#creating-the-database-and-user).
- **Check what a user actually has:** run `SHOW GRANTS FOR CURRENT_USER();` in phpMyAdmin's SQL tab or the MySQL command line, signed in as that user. The grant must name the ChurchCRM database (or `*.*`, which is broader than needed).
- **The user's host scope is a permission too.** A grant for `'churchcrm'@'localhost'` does not cover connections arriving from a Docker container or another server — that mismatch is rejected as a bad login, see [the username or password was rejected](#the-username-or-password-was-rejected).
- **Split hosting:** if the web server and the database are on different machines, some hosts also make you allowlist the web server's address in a **Remote MySQL** panel before any connection is accepted.

File permissions matter at one point: during setup the web server must be able to **write `Include/Config.php`** (see [the configuration file could not be saved](#the-configuration-file-could-not-be-saved)). After setup, protect that file — it contains the database password. It should not be readable by other accounts on the server; the Docker procedure below sets it to `chmod 600`.

## Creating the database and user

**cPanel (shared hosting)**

1. Open **MySQL Databases**.
2. Under **Create New Database**, enter a name and create it. Note the full name — cPanel prefixes it with your account name.
3. Under **MySQL Users**, create a user with a strong password. Note the full prefixed user name.
4. Under **Add User To Database**, select the user and the database, and grant **ALL PRIVILEGES**. Skipping this step is the most common cause of [rejected logins](#the-username-or-password-was-rejected).
5. Enter the four values in the setup wizard exactly as the panel shows them.

**Docker (official compose file)**

You do not create anything by hand. Put `CHURCHCRM_DB_NAME`, `CHURCHCRM_DB_USER` and `CHURCHCRM_DB_PASSWORD` in the `.env` file next to the compose file; the database container creates the database and user on its first start. In the wizard, the host is `db`. See the [Docker guide](/installation/docker).

**Docker lessons from the official compose setup**

- **Config.php does not survive replacing the web container unless you persist it.** The database lives in its own volume and is safe, but a fresh web container has no `Include/Config.php` and sends you back to `/setup`. Re-running setup reconnects to the existing database without deleting it — or persist the file the way the compose file's comments describe: finish setup once, copy the file out with `docker compose cp web:/var/www/html/Include/Config.php ./config/Config.php`, run `chmod 600 ./config/Config.php` (it contains the database password), then enable the bind-mount line in the compose file and recreate the container.
- **Do not start the web container read-only before setup is finished.** With `read_only: true` the wizard cannot write Config.php and fails silently — it answers as if it worked and writes nothing. Enable read-only only after setup, with the Config.php bind-mount in place.
- **The database publishes no port.** In the official compose file the database is reachable only inside the compose network, so you cannot connect to it from the host machine with a desktop MySQL client. Test from inside instead: `docker compose exec db mariadb -u <user> -p <database>`.
- **The official database is a supported version.** The compose file runs MariaDB 11.4, above the supported floor — the [out-of-support banner](#database-out-of-support) never appears on the official stack. If you see it, the compose file was changed to an older database image.

**VPS / self-hosted (command line)**

```sql
CREATE DATABASE churchcrm;
CREATE USER 'churchcrm'@'localhost' IDENTIFIED BY 'a-strong-password';
GRANT ALL PRIVILEGES ON churchcrm.* TO 'churchcrm'@'localhost';
```

If ChurchCRM runs on a different server or in a container, replace `'localhost'` with `'%'` (any host) or the specific host the connection comes from — and understand that the user name, its host part and its password are one credential: all three must match what the wizard sends.

## Test the connection yourself

If you have phpMyAdmin, try signing in there with the same user and password and opening the database — it separates "the credentials are wrong" from "ChurchCRM is misconfigured". On a server you control, the command line does the same:

```bash
mysql -h <host> -u <user> -p <database>
```

The server's error names the cause. The common ones, and the wizard message each produces:

| Server error | Meaning | Wizard message |
| --- | --- | --- |
| 1045 Access denied for user | User/password wrong, user not assigned, or the user's host scope does not cover this connection | "rejected that username or password" |
| 1049 Unknown database | The database does not exist (or the name's prefix is wrong) | "no database with that name" |
| 1044 Access denied to database | The user exists but has no rights on that database | "no database with that name" family — assign the user to the database |
| 2002 / 2003 Can't connect | Host unreachable: wrong host name, server down, or (Docker) using `localhost` instead of the service name | "cannot reach a database" |
| 2005 Unknown MySQL server host | The host name does not resolve at all — a typo, or a private Docker service name used outside Docker | "cannot reach a database" |
| 2006 / 2013 Server has gone away / lost connection | The server dropped the connection — server overload or restart | the generic failure |

## Still stuck

Gather these before asking — they are what anyone helping you will ask for first:

- The exact message, and whether it appeared during setup or on a running site.
- Your hosting kind (shared/cPanel, Docker, Softaculous, VPS) and your database type and version.
- The matching lines from the ChurchCRM log — see [Logging & Diagnostics](/administration/logging-and-diagnostics) for where the log is and what to copy. Remove server names, addresses and people's details before posting log lines publicly.

Ask in the [ChurchCRM Discord](https://discord.gg/tuWyFzj3Nj) or search [existing database issues](https://github.com/ChurchCRM/CRM/issues?q=label%3A%22Platform%3A+Database%22) on GitHub.
