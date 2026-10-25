---
title: Installation Guide
description: Pick an install path for ChurchCRM. Most churches start with Softaculous or cPanel. Docker, Ubuntu, and cloud hosts are here too.
sidebar_position: 1
---

# Installation

Not sure where to start? If your host has cPanel or Plesk, use [One-Click Install (Softaculous)](/installation/softaculous). If Softaculous is not there, use [cPanel](/installation/cpanel-shared-hosting). Use the server guides only when someone on your team can use a Linux terminal. Use [Docker](/installation/docker) only when you already run containers.

## System Requirements

Before installing, confirm your server meets the minimum requirements:

- **[System Requirements](/installation/system-requirements)** — PHP version, required extensions, database version, and file permissions

## Installation Guides

Choose the path that matches your hosting setup:

| Method | Best for |
|--------|---------|
| **[One-Click Install (Softaculous)](/installation/softaculous)** | Shared hosting with cPanel, Plesk, or DirectAdmin — easiest option |
| **[cPanel Shared Hosting](/installation/cpanel-shared-hosting)** | cPanel hosts without Softaculous — manual file upload |
| **[Self-Hosted on Your Own Server](/installation/self-hosted)** | Overview for VPS, cloud, or on-premise servers — start here, then pick your OS |
| **[Self-Hosted on Ubuntu / Debian](/installation/ubuntu)** | Ubuntu @@ubuntu@@ LTS VPS or dedicated server |
| **[Self-Hosted on Rocky Linux](/installation/rocky-linux)** | Rocky Linux @@rocky@@, AlmaLinux @@rocky@@, or RHEL @@rocky@@ VPS or dedicated server |
| **[Azure](/installation/azure)** | Microsoft Azure cloud |
| **[VPS & Cloud Providers](/installation/vps-cloud)** | DigitalOcean, Linode, Hetzner, Vultr, AWS Lightsail, GCE and others |
| **[Docker](/installation/docker)** | Official `churchcrm/crm` images on Docker Hub — for admins already comfortable with containers |
| **[Windows and XAMPP](/installation/windows)** | Not supported. You may try it. We do not help when it fails |

## After Installation

Once the application is running:

- **[First Run Configuration](/getting-started/first-run)** — Configure your church details and initial settings
- **[Upgrade Guide](/administration/upgrade)** — Keep ChurchCRM up to date
- **[FAQs](/administration/faqs)** — Frequently asked questions

## Changing the ChurchCRM code

This is only for people editing ChurchCRM itself, not for installing it at a church.

- **[Docker Development Environment](/administration/docker)** — the containers used to work on the source code
- **[DDEV](https://ddev.com/)** — from a clone of the repository, run `ddev start` then `ddev setup-churchcrm`. The repository `CONTRIBUTING.md` has the rest of that walkthrough.
