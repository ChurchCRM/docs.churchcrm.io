---
title: Installation Guide
sidebar_position: 1
---

# Installation

## System Requirements

Before installing, confirm your server meets the minimum requirements:

- **[System Requirements](/installation/system-requirements)** — PHP version, required extensions, database version, and file permissions

## Installation Guides

Choose the path that matches your hosting setup:

| Method | Best for |
|--------|---------|
| **[One-Click Install (Softaculous)](/installation/softaculous)** | Shared hosting with cPanel, Plesk, or DirectAdmin — easiest option |
| **[cPanel Shared Hosting](/installation/cpanel-shared-hosting)** | cPanel hosts without Softaculous — manual file upload |
| **[Self-Hosted on Ubuntu / Debian](/installation/ubuntu)** | Ubuntu 22.04/24.04 LTS VPS or dedicated server |
| **[Self-Hosted on Rocky Linux](/installation/rocky-linux)** | RHEL, Rocky Linux, AlmaLinux VPS or dedicated server |
| **[Azure](/installation/azure)** | Microsoft Azure cloud |
| **[VPS & Cloud Providers](/installation/vps-cloud)** | DigitalOcean, Linode, Hetzner, Vultr, AWS Lightsail, GCE and others |
| **Docker** | Experimental — see [VPS & Cloud Providers](/installation/vps-cloud#docker) for status |

## After Installation

Once the application is running:

- **[First Run Configuration](/getting-started/first-run)** — Configure your church details and initial settings
- **[Upgrade Guide](/administration/upgrade)** — Keep ChurchCRM up to date
- **[FAQs](/administration/faqs)** — Frequently asked questions

## Contributing / Local development

- **[DDEV](https://ddev.com/)** — ChurchCRM ships with a ready-to-go DDEV configuration. From a clone of the repo, run `ddev start` then `ddev setup-churchcrm`. See `CONTRIBUTING.md` in the repo for the full walkthrough.
