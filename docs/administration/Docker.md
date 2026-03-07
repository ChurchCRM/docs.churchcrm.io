```markdown
---
title: Docker Development Environment
sidebar_position: 15
---

# Docker Development Environment

ChurchCRM provides a complete Docker-based development environment that includes all necessary services and tools for developing and testing ChurchCRM.

## Quick Start

### Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (includes Docker Compose)
- [Git](https://git-scm.com/)
- [Node.js 20+](https://nodejs.org/)
- **PHP 8.4+** with extensions: `bcmath`, `curl`, `fileinfo`, `filter`, `gd`, `gettext`, `iconv`, `mbstring`, `mysqli`, `PDO`, `pdo_mysql`, `session`, `sodium`, `zip`, `zlib`
  - Ubuntu/Debian example: `sudo apt-get install php php-bcmath php-curl php-gd php-gettext php-mbstring php-mysql php-sodium php-zip`
  - Note: package names may vary slightly by distribution/repository.
- [Composer](https://getcomposer.org/) (PHP dependency manager)

> **Note:** PHP and Composer are required on the **build host** because `npm run deploy` compiles PHP dependencies via Composer locally before mounting them into Docker. The Quick Start options (Codespaces, Dev Containers) handle PHP inside Docker automatically.

### Development Setup

1. **Clone the Repository**
```bash
git clone https://github.com/ChurchCRM/CRM.git
cd CRM
```

2. **Install Dependencies**
```bash
npm ci
npm run deploy
```

3. **Start Docker Environment**
```bash
npm run docker:dev:start
```

4. **Access ChurchCRM**
- **Application**: http://localhost/
- **Default Login**: `admin` / `changeme`
- **Database Admin**: http://localhost:8088/ (adminer)
- **Mail Server**: http://localhost:8025/ (test emails)

## Overview

The Docker setup includes:
- **webserver**: Apache with PHP (see [System Requirements](/docs/churchcrm-application-platform-prerequisites)) with all ChurchCRM code
- **database**: MariaDB server with sample data
- **adminer**: Web-based database management interface  
- **mailserver**: SMTP testing server for email functionality

### Available npm Scripts

```bash
# Development containers
npm run docker:dev:start     # Start development environment
npm run docker:dev:stop      # Stop development environment  
npm run docker:dev:logs      # View container logs
npm run docker:dev:login-web # Login to web container

# Testing containers  
npm run docker:test:start    # Start testing environment
npm run docker:test:stop     # Stop testing environment
npm run test                 # Run Cypress tests
```

## Container Services

### webserver
- **Purpose**: Apache web server with PHP and ChurchCRM code
- **Port**: 80 (configurable via `DEV_WEBSERVER_PORT` in `docker/.env`)
- **Access**: http://localhost/

### database  
- **Purpose**: MariaDB server with ChurchCRM database
- **Port**: 3306 (configurable via `DEV_DATABASE_PORT` in `docker/.env`)
- **Credentials**: 
  - Username: `churchcrm`
  - Password: `changeme`
  - Database: `churchcrm`
  - Root password: `changeme`

### adminer
- **Purpose**: Web-based database administration
- **Port**: 8088 (configurable via `DEV_ADMINER_PORT` in `docker/.env`)
- **Access**: http://localhost:8088/

### mailserver
- **Purpose**: SMTP testing server (catches outgoing emails)
- **SMTP Port**: 1025 (configurable via `DEV_MAILSERVER_PORT`)
- **Web UI Port**: 8025 (configurable via `DEV_MAILSERVER_GUI_PORT`)
- **Access**: http://localhost:8025/

## Development Workflow

1. **Make Code Changes**: Edit files in your local repository
2. **Build Assets**: Run `npm run deploy` to rebuild CSS/JS
3. **Test Changes**: Access http://localhost/ to see your changes
4. **View Logs**: Use `npm run docker:dev:logs` to debug issues, or access **Admin** → **System Logs** in the UI
5. **Database Access**: Use adminer at http://localhost:8088/

## Configuration

Customize ports and settings by creating `docker/.env`:

```bash
DEV_WEBSERVER_PORT=80
DEV_DATABASE_PORT=3306  
DEV_ADMINER_PORT=8088
DEV_MAILSERVER_PORT=1025
DEV_MAILSERVER_GUI_PORT=8025
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
docker compose -f "docker/docker-compose.test-php8-apache.yaml" down
docker compose -f "docker/docker-compose.test-php8-apache.yaml" up -d --build

# View logs
npm run docker:dev:logs
```

### Permission Issues
```bash
# Fix log permissions (run inside container)
npm run docker:dev:login-web
chmod a+rwx src/logs
```

### Database Issues
- Access adminer at http://localhost:8088/
- Use credentials listed above
- Database is automatically populated with sample data

## Production Note

⚠️ **This Docker setup is for development and testing only.** Do not use in production environments. For production deployment, see the [Installation](/administration/upgrade) guides.

```markdown
