---
title: Self-Hosted on Your Own Server
sidebar_position: 3
---

# Self-Hosted on Your Own Server

Running ChurchCRM on a server you control — a VPS, a cloud instance, or hardware in your building — gives you full control over configuration, updates, backups, and data. It usually costs less than shared hosting and performs better, but it assumes someone on your team is comfortable with the Linux command line.

If your host offers cPanel, the [one-click Softaculous install](/installation/softaculous) or the [manual cPanel install](/installation/cpanel-shared-hosting) are simpler starting points.

---

## Before you start

- Confirm your server meets the **[system requirements](/installation/system-requirements)** — PHP 8.4+, MySQL 8.0+ / MariaDB 10.5+, Apache or nginx with URL rewriting, and about 500 MB of disk to start.
- Have a domain or subdomain pointed at the server's IP address.
- Plan for [HTTPS](/installation/ssl-https) — ChurchCRM handles member and giving data and should never run over plain HTTP in production.

## Choose your guide

| Your server | Guide |
|-------------|-------|
| Ubuntu 22.04 / 24.04 LTS, or Debian | **[Self-Hosted on Ubuntu / Debian](/installation/ubuntu)** |
| Rocky Linux, AlmaLinux, RHEL | **[Self-Hosted on Rocky Linux](/installation/rocky-linux)** |
| DigitalOcean, Linode, Hetzner, Vultr, AWS Lightsail, Google Cloud | **[VPS & Cloud Providers](/installation/vps-cloud)** — how to size and create the VM, then follow the Ubuntu guide |
| Microsoft Azure | **[Azure Cloud Setup](/installation/azure)** |

The underlying steps are the same everywhere: install Apache/PHP/MariaDB, create a database, deploy the release from [GitHub](https://github.com/ChurchCRM/CRM/releases/latest), then open your site and complete the setup wizard.

## Docker

ChurchCRM is built and developed with Docker, but there is no officially maintained production Docker image — see [Docker](/installation/vps-cloud#docker) for why and what's available.

---

## After installation

- **[First Run Configuration](/getting-started/first-run)** — church details and initial settings
- **[Set up HTTPS](/installation/ssl-https)** — Let's Encrypt / certbot
- **[Upgrade Guide](/administration/upgrade)** — keeping ChurchCRM up to date
