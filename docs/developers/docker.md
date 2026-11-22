---
title: Docker Development Environment
sidebar_position: 15
---

# Docker Development Environment

ChurchCRM provides a complete Docker-based development environment that includes all necessary services and tools for developing and testing ChurchCRM.

> **Running ChurchCRM in production with Docker instead?** This page is the *development* environment, for contributors. Churches running the published images should follow the [Docker installation guide](../installation/docker.md).

## Quick Start

### Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (includes Docker Compose)
- [Git](https://git-scm.com/)
- [Node.js 24+](https://nodejs.org/)
- **PHP 8.4+** with extensions: `bcmath`, `curl`, `fileinfo`, `filter`, `gd`, `gettext`, `iconv`, `mbstring`, `mysqli`, `PDO`, `pdo_mysql`, `session`, `sodium`, `zip`, `zlib`
  - Ubuntu/Debian example: `sudo apt-get install php php-bcmath php-curl php-gd php-gettext php-mbstring php-mysql php-sodium php-zip`
  - Note: package names may vary slightly by distribution/repository.
- [Composer](https://getcomposer.org/) (PHP dependency manager)

> **Note:** PHP and Composer are required on the **build host** because `npm run build` compiles PHP dependencies via Composer locally before mounting them into Docker. The Quick Start options (Codespaces, Dev Containers) handle PHP inside Docker automatically.

### Development Setup

1. **Clone the Repository**
```bash
git clone https://github.com/ChurchCRM/CRM.git
cd CRM
```

2. **Install Dependencies**
```bash
npm ci
npm run build
```

3. **Start Docker Environment**
```bash
npm run docker:dev:start
```

4. **Access ChurchCRM**
- **Application**: http://localhost/
- **Default Login**: `admin` / `changeme`
- **Database**: localhost:3306 (connect with your preferred MySQL client)
- **Mail Server**: http://localhost:8025/ (test emails)

## Overview

The Docker setup includes:
- **webserver**: Apache with PHP (see [System Requirements](../installation/system-requirements.md)) with all ChurchCRM code
- **database**: MariaDB server with sample data
- **mailserver**: SMTP testing server for email functionality

### Available npm Scripts

```bash
# Development containers
npm run docker:dev:start     # Start development environment
npm run docker:dev:stop      # Stop development environment  
npm run docker:dev:logs      # View container logs
npm run docker:dev:login:web # Login to web container

# Testing containers  
npm run docker:test:start    # Start testing environment
npm run docker:test:stop     # Stop testing environment
npm run test                 # Run Cypress tests
```

## Container Services

### webserver
- **Purpose**: Apache web server with PHP and ChurchCRM code
- **Port**: 80 (configurable via `WEBSERVER_PORT` in `docker/.env`)
- **Access**: http://localhost/

### database  
- **Purpose**: MariaDB server with ChurchCRM database
- **Port**: 3306 (configurable via `DATABASE_PORT` in `docker/.env`)
- **Credentials**: 
  - Username: `churchcrm`
  - Password: `changeme`
  - Database: `churchcrm`
  - Root password: `changeme`

### mailserver
- **Purpose**: SMTP testing server (catches outgoing emails)
- **SMTP Port**: 1025 (configurable via `MAILSERVER_PORT`)
- **Web UI Port**: 8025 (configurable via `MAILSERVER_GUI_PORT`)
- **Access**: http://localhost:8025/

## Development Workflow

1. **Make Code Changes**: Edit files in your local repository
2. **Build Assets**: Run `npm run build` to rebuild CSS/JS
3. **Test Changes**: Access http://localhost/ to see your changes
4. **View Logs**: Use `npm run docker:dev:logs` to debug issues, or access **Admin** → **System Logs** in the UI
5. **Database Access**: Connect to the database at localhost:3306 with your preferred MySQL client

## Configuration

Customize ports and settings by editing the existing `docker/.env` file. The repository ships this file with the database credentials the containers need — keep the `MYSQL_*` settings and change only the values you need:

```bash
WEBSERVER_PORT=80
DATABASE_PORT=3306
MAILSERVER_PORT=1025
MAILSERVER_GUI_PORT=8025
```

## Testing

For automated testing:

```bash
npm run docker:test:start  # Start testing containers
npm run test              # Run Cypress end-to-end tests
npm run docker:test:stop  # Clean up
```

## Troubleshooting

### Container Issues
```bash
# Rebuild containers
npm run docker:dev:rebuild

# View logs
npm run docker:dev:logs
```

### Permission Issues
```bash
# Fix log permissions (run inside container)
npm run docker:dev:login:web
chmod a+rwx /var/www/html/logs
```

### Database Issues
- Connect to the database at localhost:3306 with your preferred MySQL client
- Use credentials listed above
- Database is automatically populated with sample data

## Production Note

This page is for editing the ChurchCRM source code. A church install uses the published image on [Docker](../installation/docker.md): `churchcrm/crm:latest-php8-apache`.
