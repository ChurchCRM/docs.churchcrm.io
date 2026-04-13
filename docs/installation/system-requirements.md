---
title: System Requirements
sidebar_position: 2
---

# ChurchCRM System Requirements

This is the **single source of truth** for all ChurchCRM system requirements. All installation and deployment documentation should reference this page.

:::tip Primary documentation
If you're reading this on the **GitHub Wiki**, the primary documentation is at **docs.churchcrm.io**. All user and administrator manuals live there.
:::

ChurchCRM has specific platform prerequisites, and a built-in mechanism to ensure that all prerequisites are met. If there are any unmet prerequisites, a message will be displayed during setup and a notification will be displayed during runtime.

Prerequisites are validated at every page load, so if the hosting environment is changed to an incomplete / unsupported model, a notification will appear.

Validation occurs in the [`getApplicationPrerequisites()` function](https://github.com/ChurchCRM/CRM/blob/3872c9a5aee37741a58e3c6f766328ecc91d8434/src/ChurchCRM/Service/AppIntegrityService.php#L153).

## Authoritative Requirements Table

| Component | Minimum Version | Recommended | Notes |
|-----------|-----------------|-------------|-------|
| **PHP** | 8.2 | 8.3 or 8.4 | Required for all core functionality |
| **Web server** | Apache 2.4 with mod_rewrite | Apache 2.4+ or FrankenPHP | FrankenPHP is officially supported via the `churchcrm-frankenphp` Docker image; nginx may work but requires per-subdirectory routing configuration |
| **MySQL** | 8.0.11 | 8.0+ | Or MariaDB 10.5+ |
| **MariaDB** | 10.5 | 10.6+ | Alternative to MySQL |
| **PHP memory_limit** | 256MB | 512MB+ | 1GB+ for larger congregations |
| **Storage** | 500MB | 1GB+ | Depends on attachments and data size |

## Detailed Prerequisites

### PHP 8.2 or Higher

**Status:** REQUIRED

ChurchCRM requires **PHP 8.2 or higher** as the absolute minimum. This requirement is enforced in the application and verified at every page load.

**Installation:**
- **Shared Hosting (cPanel):** Select PHP 8.2 or higher from your hosting control panel
- **Self-Hosted Linux:** Follow the steps at [Self-Hosted on Linux](/installation/self-hosted-linux) or [Rocky Linux](/installation/rocky-linux)

**Tested Versions:**
The application is tested and verified to work with the following PHP versions:
- PHP 8.2 (minimum supported)
- PHP 8.3
- PHP 8.4
- PHP 8.5 (safe to run)

For a complete list of tested versions and configurations, see the [GitHub Actions CI workflow](https://github.com/ChurchCRM/CRM/blob/master/.github/workflows/build-test-package.yml).

### Required PHP Extensions

The following PHP extensions must be installed and enabled. These are validated during setup and at every page load via the [`getApplicationPrerequisites()` function](https://github.com/ChurchCRM/CRM/blob/master/src/ChurchCRM/Service/AppIntegrityService.php#L213).

**Core Database & String Handling:**

#### bcmath
**Purpose:** Arbitrary precision arithmetic  
**Installation:** `php-bcmath` package

#### curl
**Purpose:** HTTP requests and external API communication  
**Installation:** `php-curl` package

#### json
**Purpose:** JSON encoding/decoding (API responses)  
**Installation:** Usually bundled with PHP

#### mbstring
**Purpose:** Multibyte string handling (UTF-8 support)  
**Installation:** `php-mbstring` package

#### mysqli
**Purpose:** MySQL/MariaDB database access  
**Installation:** `php-mysql` or `php-mysqli` package

#### xml
**Purpose:** XML parsing and processing  
**Installation:** `php-xml` package

**Image & Content Processing:**

#### gd
**Purpose:** Image manipulation (profile pictures, charts)  
**Installation:** `php-gd` package  
**Additional Requirements:** Requires FreeType library for text rendering

#### exif
**Purpose:** Read EXIF data from uploaded images  
**Installation:** `php-exif` or usually included with `php-gd`

#### finfo / fileinfo
**Purpose:** Detect file types and MIME types  
**Installation:** Usually bundled with PHP

**Internationalization & Localization:**

#### gettext
**Purpose:** Localization and translation support  
**Installation:** `php-gettext` package

#### intl
**Purpose:** Internationalization and Unicode support  
**Installation:** `php-intl` package

**Archive & Data Handling:**

#### phar
**Purpose:** PHP Archive support (installation/updates)  
**Installation:** Usually bundled with PHP

#### soap
**Purpose:** SOAP web services support  
**Installation:** `php-soap` package

#### zip
**Purpose:** ZIP file handling (imports/exports, backups)  
**Installation:** `php-zip` package

**Character Encoding & Cryptography:**

#### iconv
**Purpose:** Character set conversion for text handling  
**Installation:** Usually bundled with PHP

#### session
**Purpose:** PHP session support  
**Installation:** Usually bundled with PHP

#### sodium
**Purpose:** Modern cryptography (password hashing, encryption)  
**Installation:** `php-sodium` package

**Regular Expression Support:**

#### pcre (PCRE)
**Purpose:** Regular expression support with Unicode (UTF-8)  
**Installation:** Usually bundled with PHP  
**Requirement:** Must support UTF-8 character matching (`preg_match` with /u flag)

### Web Server

**Apache 2.4+ with mod_rewrite**

ChurchCRM currently requires Apache's `mod_rewrite` module for URL routing. While we'd like to deprecate this requirement, it still exists. If you know mod_rewrite is loaded and working on your Apache setup, it is SAFE to ignore this prerequisite during setup.

**nginx compatibility:** nginx may work but is not officially supported or tested.

### Database Server

**MySQL 8.0.11+ or MariaDB 10.5+**

ChurchCRM requires **MySQL 8.0.11 or higher** or **MariaDB 10.5 or higher** for:
- Modern schema features and compatibility
- UTF-8mb4 character set support
- Improved performance and reliability
- Support for JSON and modern SQL features

Database must support:
  - UTF-8mb4 character set
  - InnoDB storage engine
  - Foreign key constraints

### File System Permissions

These write permissions are validated during setup and at every page load via the [`getFilesystemPrerequisites()` function](https://github.com/ChurchCRM/CRM/blob/master/src/ChurchCRM/Service/AppIntegrityService.php#L248).

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

#### register_globals
Must be turned OFF (deprecated PHP feature)

#### File Uploads
Must be enabled and configured:
- `file_uploads = On`
- `upload_max_filesize` - recommend 10MB+
- `post_max_size` - should match or exceed upload_max_filesize
