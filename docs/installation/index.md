---
title: Installation Guide
description: Pick an install path for ChurchCRM. Choose Softaculous for shared hosting or Docker Compose for a VPS or managed container host.
sidebar_position: 1
---

# Installation

Use [One-Click Install (Softaculous)](/installation/softaculous) on shared hosting with Softaculous. On a VPS or managed container host, use the [official Docker image and production Compose stack](/installation/docker). If your shared host has cPanel without Softaculous, use the [cPanel guide](/installation/cpanel-shared-hosting).

## System Requirements

Before installing, confirm your server meets the minimum requirements:

- **[System Requirements](/installation/system-requirements)** — PHP version, required extensions, database version, and file permissions

## Installation Guides

Choose the path that matches your hosting setup:

| Method | Best for |
|--------|---------|
| **[One-Click Install (Softaculous)](/installation/softaculous)** | Shared hosting with cPanel, Plesk, or DirectAdmin — easiest option |
| **[Docker](/installation/docker)** | VPS or managed container hosting with Docker Compose |
| **[cPanel Shared Hosting](/installation/cpanel-shared-hosting)** | cPanel hosts without Softaculous — manual file upload |
| **[Self-Hosted on Your Own Server](/installation/self-hosted)** | Overview for VPS, cloud, or on-premise servers — start here, then pick your OS |
| **[Self-Hosted on Ubuntu / Debian](/installation/ubuntu)** | Ubuntu @@ubuntu@@ LTS VPS or dedicated server |
| **[Self-Hosted on Rocky Linux](/installation/rocky-linux)** | Rocky Linux @@rocky@@, AlmaLinux @@rocky@@, or RHEL @@rocky@@ VPS or dedicated server |
| **[Azure](/installation/azure)** | Microsoft Azure cloud |
| **[VPS & Cloud Providers](/installation/vps-cloud)** | DigitalOcean, Linode, Hetzner, Vultr, AWS Lightsail, GCE and others |
| **[Windows and XAMPP](/installation/windows)** | Not supported. You may try it. We do not help when it fails |

## After Installation

Once the application is running:

- **[First Run Configuration](/getting-started/first-run)** — Configure your church details and initial settings
- **[Upgrade Guide](/administration/upgrade)** — Keep ChurchCRM up to date
- **[FAQs](/administration/faqs)** — Frequently asked questions

## Changing the ChurchCRM code

This is only for people editing ChurchCRM itself, not for installing it at a church.

- **[Docker Development Environment](../developers/docker.md)** — the containers used to work on the source code
- **[DDEV](https://ddev.com/)** — from a clone of the repository, run `ddev start` then `ddev setup-churchcrm`. The repository `CONTRIBUTING.md` has the rest of that walkthrough.
