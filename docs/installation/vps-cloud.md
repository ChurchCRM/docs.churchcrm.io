---
title: VPS & Cloud Providers
sidebar_position: 7
---

# Installing ChurchCRM on a VPS or Cloud Provider

ChurchCRM runs on any Linux server with Apache, PHP 8.2+, and MySQL/MariaDB. If you or your church has a volunteer comfortable with the command line, a VPS gives you more control, better performance, and lower cost than most shared hosting plans.

This page covers the popular cloud options and maps you to the right install guide. The underlying steps are the same across all of them — the only difference is how you spin up the VM.

---

## Which provider should I choose?

| Provider | Notes |
|----------|-------|
| **[DigitalOcean](https://www.digitalocean.com)** | Simple UI, predictable pricing ($6–$12/mo for a small church), good for first-timers. Create a "Droplet" with Ubuntu 24.04. |
| **[Linode / Akamai](https://www.linode.com)** | Similar to DigitalOcean, very reliable, slightly cheaper at entry level. |
| **[Hetzner](https://www.hetzner.com)** | Cheapest option (~€4/mo), European data centers, excellent value for money. |
| **[Vultr](https://www.vultr.com)** | Many global regions, competitive pricing, good for international churches. |
| **[AWS Lightsail](https://aws.amazon.com/lightsail/)** | Amazon's simplified VPS product — predictable cost, easy to upgrade to full AWS later. |
| **[AWS EC2](https://aws.amazon.com/ec2/)** | Full AWS power, more setup required, free tier available for 12 months (t2.micro). Follow the [Azure guide](/installation/azure) pattern and adapt for EC2. |
| **[Google Cloud (GCE)](https://cloud.google.com/compute)** | Google's VMs — free tier available (e2-micro in us-east1 is permanently free). |
| **[Microsoft Azure](https://azure.microsoft.com)** | See the dedicated [Azure installation guide](/installation/azure). |

:::tip What size do I need?
For a congregation under 500 people: **1 vCPU, 1–2 GB RAM, 20 GB disk** is fine. Under 2,000 people: 2 vCPU, 2–4 GB RAM. The database and file storage grow slowly — most churches stay under 5 GB for years.
:::

---

## Steps: Ubuntu-based providers (DigitalOcean, Linode, Hetzner, Vultr, Lightsail, GCE)

1. Create a VM running **Ubuntu 22.04 LTS** or **Ubuntu 24.04 LTS**
2. SSH in as root (or a sudo user)
3. Follow the **[Self-Hosted on Ubuntu](/installation/ubuntu)** guide from the top

That's it. The guide covers Apache, MariaDB, PHP 8.4, and deploying the release zip — all tested on Ubuntu 22.04/24.04.

---

## Steps: RHEL-based providers (any provider running Rocky Linux / AlmaLinux)

1. Create a VM running **Rocky Linux 9** or **AlmaLinux 9**
2. SSH in
3. Follow the **[Self-Hosted on Rocky Linux](/installation/rocky-linux)** guide

---

## Steps: Microsoft Azure

See the dedicated **[Azure installation guide](/installation/azure)**, which covers resource groups, VM creation, and Apache configuration specific to Azure's networking.

---

## SSL / HTTPS

On any VPS you'll want a TLS certificate. [Let's Encrypt](https://letsencrypt.org) is free and takes about 2 minutes with Certbot:

**Ubuntu:**
```bash
sudo apt install certbot python3-certbot-apache
sudo certbot --apache -d yourdomain.com
```

**Rocky Linux:**
```bash
sudo dnf install certbot python3-certbot-apache
sudo certbot --apache -d yourdomain.com
```

Certbot auto-renews certificates — no annual fee, no manual renewal. See [SSL / HTTPS](/installation/ssl-https) for more.

---

## Docker

:::caution Docker support is in progress
ChurchCRM does not yet have an **officially supported production Docker image**. A `Dockerfile` exists in the repository and is used for CI/testing, but it is not regularly published or hardened for production use.

A FrankenPHP-based image (`ghcr.io/churchcrm/churchcrm-frankenphp`) is available as a production-ready container option. It should be treated as **experimental** until the Docker support epic is completed.

If you want to run ChurchCRM in a container, using a VPS with the standard Apache + PHP setup is the safer choice today. Watch the [GitHub releases](https://github.com/ChurchCRM/CRM/releases) for when a stable Docker Compose setup is announced.
:::

---

## What about managed databases (RDS, Cloud SQL)?

You can point ChurchCRM at a managed MySQL/MariaDB instance (AWS RDS, Google Cloud SQL, Azure Database for MySQL) instead of running MariaDB on the same server. The connection details go in `Include/Config.php` — same as a local install. A managed database adds cost but removes the backup and patching burden for the database tier.

---

## See Also

- [Self-Hosted on Ubuntu](/installation/ubuntu)
- [Self-Hosted on Rocky Linux](/installation/rocky-linux)
- [Azure](/installation/azure)
- [SSL / HTTPS](/installation/ssl-https)
- [System Requirements](/installation/system-requirements)
- [Upgrade Guide](/administration/upgrade)
