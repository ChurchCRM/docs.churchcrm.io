---
title: Installation Guide
sidebar_position: 1
---

# Installation

## Where to Start

The official ChurchCRM website provides a complete, step-by-step installation guide covering the most common hosting scenarios:

**[Official Installation Guide](https://churchcrm.io/install.html)** — Covers Softaculous (one-click), cPanel manual, and direct download methods.

A video walkthrough is also available: [Installation Tutorial](https://www.youtube.com/watch?v=SMjZpo3aO5Q)

## System Requirements

Before installing, confirm your server meets the minimum requirements:

- **[System Requirements](/installation/system-requirements)** — PHP version, required extensions, database version, and file permissions

## Installation Guides

Detailed guides for specific hosting environments:

- **[Self-Hosted on Rocky Linux](/installation/rocky-linux)** — Linux VPS setup with Apache, MariaDB, and PHP-FPM
- **[cPanel Shared Hosting](/installation/cpanel-shared-hosting)** — Shared hosting using cPanel tools
- **[Azure](/installation/azure)** — Microsoft Azure cloud setup with Ubuntu and Apache
- **Docker (Apache)** — `ghcr.io/churchcrm/churchcrm` — classic PHP-FPM + Apache image
- **Docker (FrankenPHP)** — `ghcr.io/churchcrm/churchcrm-frankenphp` — single-binary image with an embedded web server (Caddy) and per-subdirectory routing pre-wired. Ideal for simpler deployments where you don't want to manage Apache/nginx separately. *(new in 7.1)*

## Contributing / Local development

If you want to run ChurchCRM locally for development or to contribute code:

- **[DDEV](https://ddev.com/)** — ChurchCRM ships with a ready-to-go DDEV configuration. From a clone of the repo, run `ddev start` followed by `ddev setup-churchcrm` and you have a working PHP/MySQL stack with ChurchCRM installed, seeded, and reachable on a local HTTPS URL. See `CONTRIBUTING.md` in the repo for the full walkthrough.

## After Installation

Once the application is running:

- **[First Run Configuration](/getting-started/first-run)** — Configure your church details and initial settings
- **[FAQs](/administration/faqs)** — Frequently asked questions
