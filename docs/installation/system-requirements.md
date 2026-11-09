---
title: System Requirements
sidebar_position: 2
description: "What ChurchCRM needs to run: PHP, a supported MySQL or MariaDB database, and a web server that can rewrite URLs."
---

# ChurchCRM System Requirements

ChurchCRM needs three things: **PHP 8.4 or 8.5**, **MySQL @@mysql@@ or MariaDB @@mariadb@@** (or newer), and a web server that can rewrite URLs. Apache is the tested server. The [Docker image](/installation/docker) already includes the right PHP.

Windows, including XAMPP, is not a supported system. You may try it. See [Windows and XAMPP](/installation/windows) for what does not work and why we do not help with it.

If something is missing, setup shows a message, and the same check runs again each time a page loads.

Prerequisites are validated at every page load, so if the hosting environment is changed to an incomplete / unsupported model, a notification will appear.

Validation occurs in the [`getApplicationPrerequisites()` function](https://github.com/ChurchCRM/CRM/blob/master/src/ChurchCRM/Service/AppIntegrityService.php#L184).

## Authoritative Requirements Table

| Component | Minimum Version | Recommended | Notes |
|-----------|-----------------|-------------|-------|
| **PHP** | 8.4 | 8.4 or 8.5 | Required for all core functionality |
| **Web server** | Apache 2.4 with mod_rewrite | Apache 2.4+ | The official [Docker images](/installation/docker) bundle Apache 2.4 + PHP 8.4. nginx is not tested. FrankenPHP exists only as an unsupported example in [`docker/`](https://github.com/ChurchCRM/CRM/tree/master/docker) — no image is published and CI does not build it |
| **MySQL** | @@mysql@@ | @@mysql@@+ | Or MariaDB @@mariadb@@+. The long-term-support (LTS) release |
| **MariaDB** | @@mariadb@@ | @@mariadb@@+ | Alternative to MySQL. The long-term-support (LTS) release |
| **PHP memory_limit** | 256MB | 512MB+ | 1GB+ for larger congregations |
| **Storage** | 500MB | 1GB+ | Depends on attachments and data size |

## Detailed Prerequisites

### PHP 8.4 or Higher

**Status:** REQUIRED

ChurchCRM requires **PHP 8.4 or higher** as the absolute minimum. This requirement is enforced in the application and verified at every page load.

**Installation:**
- **Shared Hosting (cPanel):** Select PHP 8.4 or higher from your hosting control panel
- **Self-Hosted Linux:** Follow the steps at [Self-Hosted on Rocky Linux](/installation/rocky-linux)

**Tested Versions:**
The application is tested and verified to work with the following PHP versions:
- PHP 8.4 (minimum supported)
- PHP 8.5 (safe to run)

For a complete list of tested versions and configurations, see the [GitHub Actions CI workflow](https://github.com/ChurchCRM/CRM/blob/master/.github/workflows/build-test-package.yml).

### Required PHP Extensions

Setup checks these on every page load via [`getApplicationPrerequisites()`](https://github.com/ChurchCRM/CRM/blob/master/src/ChurchCRM/Service/AppIntegrityService.php#L184):

- **PHP 8.4+**
- **PCRE with UTF-8** (`preg_match` with the `/u` flag)
- **mbstring**
- **Phar**
- **session**
- **XML**
- **iconv**
- **URL rewriting** (Apache `mod_rewrite`, nginx, or LiteSpeed)
- **GD** (image create, resample, and PNG)
- **fileinfo**
- **cURL**
- **gettext**
- **ZipArchive** (`php-zip`)
- **mysqli**

Composer also requires these PHP extensions: **bcmath**, **PDO**, **filter**, and **zlib**.

exif, soap, sodium, and intl are not required.

### Web Server

**Apache 2.4+ with mod_rewrite**

ChurchCRM currently requires Apache's `mod_rewrite` module for URL routing. While we'd like to deprecate this requirement, it still exists. If you know mod_rewrite is loaded and working on your Apache setup, it is SAFE to ignore this prerequisite during setup.

**nginx:** not tested, and not a substitute for the Apache rules. ChurchCRM does not read `.htaccess` on nginx. Each Slim app has its own `index.php`, and a request for that directory has to reach that file. One `location /` that sends everything to the root `index.php` drops `/session/begin` and the other module URLs.

These directories are separate apps: `setup`, `session`, `api`, `v2`, `admin`, `finance`, `kiosk`, `plugins`, `external`, `people`, `groups`, `event`, `fundraiser`, `ministries`, and `portal`. `Include/`, `cli/`, `logs/`, and `tmp_attach/` must not be served. Person and family photos under `Images/` must not be served as files.

An unsupported example that encodes those rules is [`docker/examples/nginx/default.conf`](https://github.com/ChurchCRM/CRM/blob/master/docker/examples/nginx/default.conf). When a new directory with its own `index.php` is added, that file has to gain a matching `location`. Use Apache, or the official Docker image, unless you can maintain this yourself. A bare directory URL such as `/setup` has to redirect to `/setup/`. Without the slash, setup returns a JSON 404.

### Database Server

**MySQL @@mysql@@+ or MariaDB @@mariadb@@+**

ChurchCRM supports **MySQL @@mysql@@ or higher** and **MariaDB @@mariadb@@ or higher**: the long-term-support releases that still receive security fixes. Older versions are end of life and are not tested. These versions give you:
- Modern schema features and compatibility
- UTF-8mb4 character set support
- Improved performance and reliability
- Support for JSON and modern SQL features

Database must support:
  - UTF-8mb4 character set
  - InnoDB storage engine
  - Foreign key constraints

### File System Permissions

These write permissions are validated during setup and at every page load via the [`getFilesystemPrerequisites()` function](https://github.com/ChurchCRM/CRM/blob/master/src/ChurchCRM/Service/AppIntegrityService.php#L216).

#### Include/Config Directory
**Path:** `Include/` directory (contains `Config.php`)  
**Permission Required:** Writable  
**Purpose:** Store application configuration during setup  
**Typical Permission:** 755 or 775  
**User:** Must be writable by PHP process owner (www-data, apache, or similar)

#### Images Directory
**Path:** `Images/` directory  
**Permission Required:** Writable (recursively)  
**Purpose:** Store user uploads and generated images  
**Typical Permission:** 755 or 775  
**User:** Must be writable by PHP process owner  
**Subdirectories That Must Be Writable:**
- `Images/Family/` - Family profile pictures and documents
- `Images/Person/` - Person profile pictures and photos

#### Temporary Directory
**Path:** System temporary directory (usually `/tmp` on Linux)  
**Permission Required:** Writable  
**Purpose:** PHP session storage, file uploads, temporary operations  
**Configuration:** Controlled by `php.ini` session settings  
**Note:** Ensure PHP's temporary directory is not mounted as `noexec`

### Character Set and Localization

#### PCRE with UTF-8 Support
Regular expression support with Unicode handling (usually built-in to modern PHP)

#### UTF-8 Locale Support
System should support UTF-8 locales for proper text handling

### Memory and Performance

#### PHP Memory Limit
- **Minimum:** 256MB
- **Recommended:** 512MB or higher
- Larger congregations may need 1GB+

**Configuration:** `memory_limit` in php.ini

#### PHP Max Execution Time
- **Minimum:** 30 seconds
- **Recommended:** 60+ seconds for data imports
- Large reports may need higher values

**Configuration:** `max_execution_time` in `php.ini`

### Hosting Environment Considerations

#### File Uploads
Must be enabled and configured:
- `file_uploads = On`
- `upload_max_filesize` - recommend 10MB+
- `post_max_size` - should match or exceed upload_max_filesize
