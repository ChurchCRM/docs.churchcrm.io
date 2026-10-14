---
title: Docker
description: Install ChurchCRM using the official churchcrm/crm Docker images.
sidebar_position: 8
---

# Installing ChurchCRM with Docker

ChurchCRM publishes official multi-architecture (amd64 and arm64) Docker images on every stable release.

The recommended production path is the Apache image paired with MariaDB via the provided Compose file.

## Available images

Images are published to [Docker Hub](https://hub.docker.com/r/churchcrm/crm):

| Tag | Description |
|-----|-------------|
| `churchcrm/crm:<version>-php8-apache` | Recommended. Apache + PHP 8.4. Listens on port **8080**. |
| `churchcrm/crm:<version>-php8-fpm` | PHP-FPM only (port 9000). Requires a separate web server. |
| `latest-php8-apache` / `latest` | Tracks the current stable release (Apache). Prefer a version tag for production. |

Prefer a pinned version tag (for example `7.8.0-php8-apache`) over `latest` so upgrades are explicit.

## Quick start with Docker Compose

1. Create a directory on your server and download the production files from the [ChurchCRM repository](https://github.com/ChurchCRM/CRM/tree/master/docker/production):

   - `compose.yaml`
   - `.env.example`

2. Copy the example environment file and generate strong passwords:

```bash
cp .env.example .env
openssl rand -hex 24   # run twice — once for each password
```

Edit `.env` and replace the password placeholders.

3. Start the stack:

```bash
docker compose up -d
```

The application is available at `http://127.0.0.1:8080` by default (loopback only).

4. Complete the setup wizard in your browser. Default credentials are `admin` / `changeme`. Change the password immediately.

## Important notes

- **Port**: The Apache container listens on **8080**, not 80. Map accordingly.
- **Database**: MariaDB is only reachable on the internal Compose network. It is not published to the host.
- **Volumes**: Only person and family photo directories are persisted by default. Application code stays inside the image.
- **Config.php**: After the first setup, optionally bind-mount `Include/Config.php` as read-only so container replacements do not lose configuration. See the comments in `compose.yaml`.
- **TLS**: Always put a reverse proxy (Caddy, Traefik, nginx, etc.) with Let's Encrypt in front of the application for anything publicly reachable. Do not expose plain HTTP.
- **Security**: Containers drop all capabilities and run with `no-new-privileges`. Do not enable `read_only: true` until setup is complete.

## Upgrades

1. Back up the database and photo volumes.
2. Change the image tag in `compose.yaml` to the new version (for example `7.9.0-php8-apache`).
3. Run `docker compose pull && docker compose up -d`.

Cross-version upgrades have been verified for persistence; always test on a staging copy first.

## FPM variant

The FPM image is published but not the recommended path. ChurchCRM's rewrite rules are written for Apache. If you use FPM you must supply a matching web server configuration and serve the static assets yourself.

## Development vs production

The `docker/` directory in the main repository also contains development and CI Compose files. Those are **not** production images. Use only the published `churchcrm/crm` tags and the `docker/production/` Compose file for self-hosting.

## See also

- [System Requirements](/installation/system-requirements)
- [First Run Configuration](/getting-started/first-run)
- [Upgrade Guide](/administration/upgrade)
- [Backup & Restore](/administration/backup)
