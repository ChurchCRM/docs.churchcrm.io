---
title: Docker
description: Run ChurchCRM from the official Docker images, and back it up.
---

# Docker

ChurchCRM publishes official Docker images on Docker Hub as
[`churchcrm/crm`](https://hub.docker.com/r/churchcrm/crm). 7.8.0 is the first
release to ship them.

Every command on this page was run against `churchcrm/crm:7.8.0-php8-apache`
before publication. Where something was reasoned about rather than executed, it
says so.

## Which tag to use

| Tag | What it is |
| --- | --- |
| `7.8.0-php8-apache` | A specific release. Apache + PHP 8.4, serves HTTP on port 8080. **Use this in production.** |
| `latest-php8-apache` | Whatever the newest stable release is. Moves without warning. |
| `latest` | The same image as `latest-php8-apache`. |
| `7.8.0-php8-fpm`, `latest-php8-fpm` | PHP-FPM, FastCGI on port 9000. **Not supported** — see [PHP-FPM](#php-fpm) below. |

All tags are built for `linux/amd64` and `linux/arm64`, so Apple Silicon and
64-bit Raspberry Pi work.

**Pin a version.** `churchcrm/crm:7.8.0-php8-apache`, not `latest`. A ChurchCRM
upgrade also migrates the database, and there is no supported way back down
without restoring a backup, so you do not want an unattended `docker compose
pull` deciding when that happens.

There is no bare `7.8.0` tag. The variant suffix is always required.

:::warning If you ran `churchcrm/crm` before October 2026
The `latest` tag used to point at an unmaintained Alpine / PHP 7 image built in
2018. It is gone, and `docker pull churchcrm/crm` now fetches something
completely different: Apache on port 8080, no `MYSQL_*` environment variables,
and a setup wizard on first run. Do not pull it over an existing old container
and expect it to keep working. Export your database first, then follow the
steps below and import into the new stack.
:::

## What you need

Docker Engine with Compose v2, and about 1 GB of free disk for the image and
database. Nothing else — no PHP, Composer or Node on the host.

The image runs as `www-data` (uid 33). It does not need `--privileged`, host
networking, or any added capabilities.

## Install

Create a directory with these two files.

`compose.yaml`:

```yaml
name: churchcrm

services:
  db:
    image: mariadb:11.4.5
    restart: unless-stopped
    environment:
      MARIADB_DATABASE: ${CHURCHCRM_DB_NAME:?set CHURCHCRM_DB_NAME in .env}
      MARIADB_USER: ${CHURCHCRM_DB_USER:?set CHURCHCRM_DB_USER in .env}
      MARIADB_PASSWORD: ${CHURCHCRM_DB_PASSWORD:?set CHURCHCRM_DB_PASSWORD in .env}
      MARIADB_ROOT_PASSWORD: ${CHURCHCRM_DB_ROOT_PASSWORD:?set CHURCHCRM_DB_ROOT_PASSWORD in .env}
    volumes:
      - db-data:/var/lib/mysql
    # No `ports:` on purpose. The database is reachable on the compose
    # network only, never from the host.
    healthcheck:
      test: ["CMD", "healthcheck.sh", "--connect", "--innodb_initialized"]
      interval: 10s
      timeout: 5s
      start_period: 30s
      retries: 10
    cap_drop:
      - ALL
    cap_add:
      # MariaDB's entrypoint starts as root and drops to the mysql user.
      - CHOWN
      - SETGID
      - SETUID
      - DAC_OVERRIDE
    security_opt:
      - no-new-privileges:true

  web:
    image: churchcrm/crm:7.8.0-php8-apache
    restart: unless-stopped
    depends_on:
      db:
        condition: service_healthy
    ports:
      # Loopback only. Put a TLS reverse proxy in front of anything public.
      # Apache inside the image listens on 8080, not 80.
      - "${CHURCHCRM_HTTP_ADDR:-127.0.0.1:8080}:8080"
    volumes:
      # Only the two directories that are empty in the image. Mounting all of
      # Images/ would freeze the shipped logos and the security .htaccess;
      # mounting Include/ would shadow application code.
      - person-photos:/var/www/html/Images/Person
      - family-photos:/var/www/html/Images/Family
      #
      # Optional, see "Replacing the container" below.
      # - ./config/Config.php:/var/www/html/Include/Config.php:ro
    healthcheck:
      test: ["CMD", "curl", "-fsS", "-o", "/dev/null", "http://127.0.0.1:8080/"]
      interval: 15s
      timeout: 5s
      start_period: 30s
      retries: 5
    cap_drop:
      - ALL
    security_opt:
      - no-new-privileges:true

volumes:
  db-data:
  person-photos:
  family-photos:
```

`.env`:

```bash
CHURCHCRM_DB_NAME=churchcrm
CHURCHCRM_DB_USER=churchcrm

# Generate each with: openssl rand -hex 24
CHURCHCRM_DB_PASSWORD=
CHURCHCRM_DB_ROOT_PASSWORD=

# Loopback by default. Only widen this if you understand that it serves
# plain HTTP.
CHURCHCRM_HTTP_ADDR=127.0.0.1:8080
```

Add `.env` to `.gitignore` if the directory is version-controlled. Compose
refuses to start when either password is empty.

Start it:

```bash
docker compose up -d
docker compose ps        # wait until both services report healthy
```

Then open `http://127.0.0.1:8080/`, which redirects to the setup wizard.

| Wizard field | Value |
| --- | --- |
| Database server | `db` |
| Database port | `3306` |
| Database name, user, password | the values from your `.env` |
| Root path | leave empty |
| URL | the address people will actually use, with a trailing slash |

Get the URL right the first time — see [the URL setting](#the-url-setting).

The schema installs on the first request after the wizard, creating 59 tables.
Log in as `admin` / `changeme`; you are forced to change the password
immediately.

### Finish Church Information before anything else

Until the church name is set, **every** admin page redirects to Admin → Church
Information — including the backup page. Name, street, city, state, ZIP,
country, phone and email are all required; a partial save is rejected.

## Backing up

Two things need backing up: the database, and the photos.

### Database

The web image ships no `mariadb-dump`, so run it in the `db` container. The
dump is consistent while the app stays live, because all 59 tables are InnoDB.

```bash
set -a; . ./.env; set +a
docker compose exec -T db \
  mariadb-dump -u"$CHURCHCRM_DB_USER" -p"$CHURCHCRM_DB_PASSWORD" \
  --single-transaction --routines --events --triggers \
  "$CHURCHCRM_DB_NAME" > churchcrm-backup.sql
```

### Photos

Person and family photos live on disk, not in the database. A database backup
alone does not include them.

```bash
docker run --rm -v churchcrm_person-photos:/d -v "$PWD":/b \
  alpine tar czf /b/person-photos.tar.gz -C /d .
docker run --rm -v churchcrm_family-photos:/d -v "$PWD":/b \
  alpine tar czf /b/family-photos.tar.gz -C /d .
```

:::caution The uploaded church logo is not covered
A logo uploaded through the admin UI is written into the `Images/` root, which
this setup deliberately does not mount — a volume there would freeze the
shipped letterhead and login photo. The logo is therefore lost when the
container is replaced. Keep your original file somewhere safe and re-upload it
after an upgrade.
:::

### ChurchCRM's own backup

Admin → System → Backup works in the container and produces a downloadable
archive. Know what it is before relying on it:

- It is **not encrypted**. It contains your complete member database and every
  photo. The UI itself tells you to encrypt it with GPG or 7-Zip.
- It is written to the container's `/tmp`, which does not survive container
  replacement. Download it immediately.
- It does **not** include `Include/Config.php`.
- It is a few megabytes even on an empty install, because it bundles the
  shipped 4 MB login photo.

It is convenient for an ad-hoc copy before a change. For scheduled backups,
use `mariadb-dump` above.

### Restoring

```bash
docker compose down -v          # destroys the current database volume
docker compose up -d db         # wait for healthy
set -a; . ./.env; set +a
docker compose exec -T db \
  mariadb -u"$CHURCHCRM_DB_USER" -p"$CHURCHCRM_DB_PASSWORD" \
  "$CHURCHCRM_DB_NAME" < churchcrm-backup.sql
docker compose up -d
```

Restore photo archives by extracting them back into the same volumes.

## Upgrading

### Swap the image tag — recommended

```bash
# edit compose.yaml: churchcrm/crm:<new-version>-php8-apache
docker compose pull && docker compose up -d
```

Back up first. The application code comes from the image, so this is the path
that behaves like Docker expects: the new container is the new version, and
rolling back means putting the old tag back and restoring your backup.

Cross-version upgrades could not be tested before publication, because 7.8.0 is
the newest release and there was nothing newer to upgrade to. Treat the first
one cautiously and take a backup you have actually tried restoring.

### The in-app updater — not recommended in Docker

ChurchCRM can update itself from the admin UI, and it works in the container.
The problem is where the new code lands: `/var/www/html` is writable, so the
updater replaces the application in the container's writable layer. The next
time the container is replaced — `up -d --force-recreate`, `down` then `up`, a
host reboot — the code reverts to whatever the image tag holds, while the
database stays migrated.

ChurchCRM does detect that state and refuses to run, redirecting every route to
a database-upgrade page. That happens *before* authentication, so an
administrator cannot log in to fix it, and there is no schema downgrade path.
Recovery means restoring a backup.

If you do use the in-app updater, repin the image tag to the matching version
immediately afterwards.

## Replacing the container

The setup wizard writes `Include/Config.php` inside the container, so replacing
the container loses it and sends you back to the setup page. Your database and
photos are untouched.

**Re-running the wizard with the same database details is safe.** The wizard
only writes the config file; the schema installer is separate and skips a
database that already has tables. This was verified by fingerprinting the
database — table list, row counts, every person row, the admin password hash
and the schema version — before and after a forced container recreate and a
second wizard run. The two fingerprints were byte-identical: no data loss, no
schema change, and the admin password you set still worked.

To skip the wizard entirely, keep the config file on the host. Complete setup
once, then:

```bash
mkdir -p config
docker compose cp web:/var/www/html/Include/Config.php ./config/Config.php
chmod 600 ./config/Config.php
```

Uncomment the `Config.php` line in `compose.yaml` and run `docker compose up -d`.
The file contains your database password in cleartext, which is why it is
mounted read-only and `chmod 600`.

## Things that will catch you out

**Apache listens on 8080, not 80.** The `EXPOSE 80` in the image is inherited
from the PHP base image and nothing serves it.

**There is no environment-variable configuration.** Setting `MYSQL_*` or
`MARIADB_*` on the `web` service does nothing. Configuration comes from the
wizard and lives in `Include/Config.php`.

**`read_only: true` silently breaks the setup wizard.** The wizard answers
HTTP 200 and writes nothing, leaving you looping back to `/setup` with no error
shown. A read-only root filesystem works only after setup is complete and only
with the config file bind-mounted, and it still has rough edges — the logo
upload stops working. Leave it off unless you have a specific reason.

**Never mount a volume over all of `Images/` or over `Include/`.** `Include/`
holds application code. `Images/` holds shipped assets and a security
`.htaccess`. Mount only `Images/Person` and `Images/Family`, as above.

### The URL setting

The URL you enter in the wizard is stored as `$URL[0]` and used to build links
that leave the application: email links, the logo in emails, calendar subscribe
URLs. Navigating the site does not depend on it, so a wrong value is silent —
you will not notice until someone clicks a link in an email.

Behind a TLS reverse proxy the wizard pre-fills `http://` because that screen
does not read `X-Forwarded-Proto`. Correct it by hand to the `https://` address
people will actually use, with a trailing slash.

There is no admin screen to change it later. Fixing it means editing
`Include/Config.php` and restarting the container.

Reverse-proxy behaviour beyond this — cookie flags, scheme handling on
redirects — was not tested before publication. If you run behind a proxy,
verify it in your own setup.

## PHP-FPM

`churchcrm/crm:<version>-php8-fpm` exists and is published, but it is **not
supported**. It speaks FastCGI on port 9000 only, so it needs your own web
server in front, and ChurchCRM's routing depends on Apache's rewrite rules.
Reproducing them correctly in nginx is not a drop-in exercise.

Use the Apache image unless you are prepared to maintain that configuration
yourself. Never publish port 9000 to an untrusted network.

## Getting help

Include the exact image tag in any bug report:

```bash
docker compose exec web sh -c 'cat /var/www/html/Include/Version.php 2>/dev/null' || \
  docker inspect --format '{{.Config.Image}}' $(docker compose ps -q web)
```

Logs are `docker compose logs web` and `docker compose logs db`.
