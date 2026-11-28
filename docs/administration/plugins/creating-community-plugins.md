---
title: Creating Community Plugins
sidebar_position: 2
---

# Creating Community Plugins

This guide walks you through creating a community plugin for ChurchCRM. Plugins allow you to extend ChurchCRM's functionality without modifying core code.

## Table of Contents

- [Overview](#overview)
- [Plugin Structure](#plugin-structure)
- [Step-by-Step Guide](#step-by-step-guide)
- [Plugin Manifest (plugin.json)](#plugin-manifest-pluginjson)
- [Main Plugin Class](#main-plugin-class)
- [Adding Routes](#adding-routes)
- [Adding Views](#adding-views)
- [Configuration & Settings](#configuration--settings)
- [Using Hooks](#using-hooks)
- [Client-Side JavaScript](#client-side-javascript)
- [Best Practices](#best-practices)
- [Testing Your Plugin](#testing-your-plugin)
- [Publishing Your Plugin](#publishing-your-plugin)

---

## Overview

> **Why plugins, not core edits?**
> Any modification you make directly to ChurchCRM's source files (`src/`, `public/`, `locale/`, etc.) will be **overwritten** when you upgrade to a new release. The upgrade process replaces application files — there is no merge step. A community plugin lives outside the upgrade path and survives every release. If you want your customization to last, build it as a plugin.


ChurchCRM uses a WordPress-style plugin architecture. Plugins can:

- Add new pages and dashboards
- Integrate with external services (APIs, email providers, etc.)
- Add tabs to Person/Family views
- Hook into events (person created, donation received, etc.)
- Add menu items to the navigation
- Inject JavaScript/CSS into pages

### Plugin Types

| Type | Location | Description |
|------|----------|-------------|
| **Core** | `src/plugins/core/` | Shipped with ChurchCRM (maintained by core team) |
| **Community** | `src/plugins/community/` | Third-party plugins (that's you!) |

---

## Plugin Structure

Every plugin follows this structure:

```
src/plugins/community/my-awesome-plugin/
├── plugin.json                    # Required: Plugin manifest
├── src/
│   └── MyAwesomePluginPlugin.php  # Required: Main plugin class
├── routes/
│   └── routes.php                 # Optional: MVC and API routes
├── views/
│   └── dashboard.php              # Optional: View templates
├── assets/
│   ├── css/
│   │   └── style.css              # Optional: Plugin styles
│   └── js/
│       └── plugin.js              # Optional: Plugin JavaScript
├── help.json                      # Optional: Help documentation
└── README.md                      # Optional: Developer documentation
```

---

## Step-by-Step Guide

### Step 1: Create the Plugin Directory

```bash
mkdir -p src/plugins/community/my-awesome-plugin/src
mkdir -p src/plugins/community/my-awesome-plugin/routes
mkdir -p src/plugins/community/my-awesome-plugin/views
```

### Step 2: Create the Manifest (plugin.json)

Create `src/plugins/community/my-awesome-plugin/plugin.json`:

```json
{
    "id": "my-awesome-plugin",
    "name": "My Awesome Plugin",
    "description": "A brief description of what your plugin does",
    "version": "1.0.0",
    "author": "Your Name",
    "authorUrl": "https://your-website.com",
    "type": "community",
    "minimumCRMVersion": "7.0.0",
    "mainClass": "ChurchCRM\\Plugins\\MyAwesomePlugin\\MyAwesomePluginPlugin",
    "dependencies": [],
    "settingsUrl": null,
    "routesFile": "routes/routes.php",
    "settings": [],
    "menuItems": [],
    "hooks": []
}
```

### Step 3: Create the Main Plugin Class

Create `src/plugins/community/my-awesome-plugin/src/MyAwesomePluginPlugin.php`:

```php
<?php

namespace ChurchCRM\Plugins\MyAwesomePlugin;

use ChurchCRM\Plugin\AbstractPlugin;

class MyAwesomePluginPlugin extends AbstractPlugin
{
    private static ?MyAwesomePluginPlugin $instance = null;

    public function __construct(string $basePath = '')
    {
        parent::__construct($basePath);
        self::$instance = $this;
    }

    public static function getInstance(): ?MyAwesomePluginPlugin
    {
        return self::$instance;
    }

    public function getId(): string
    {
        return 'my-awesome-plugin';
    }

    public function getName(): string
    {
        return 'My Awesome Plugin';
    }

    public function getDescription(): string
    {
        return 'A brief description of what your plugin does';
    }

    public function boot(): void
    {
        // Called every request when plugin is active
        // Initialize services, register hooks here
    }

    public function activate(): void
    {
        // Called when plugin is enabled
        // Run setup tasks, create database tables, etc.
    }

    public function deactivate(): void
    {
        // Called when plugin is disabled
        // Clean up temporary data
    }

    public function uninstall(): void
    {
        // Called when plugin is removed
        // Delete all plugin data, drop tables, etc.
    }
}
```

### Step 4: Enable Your Plugin

1. Go to **Admin → Plugin Management** (`/plugins/management`)
2. Find your plugin in the list
3. Click **Enable**

---

## Plugin Manifest (plugin.json)

The manifest defines your plugin's metadata and capabilities.

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique identifier (lowercase, hyphens only) |
| `name` | string | Human-readable name |
| `description` | string | Brief description |
| `version` | string | Semantic version (e.g., "1.0.0") |
| `author` | string | Author name |
| `type` | string | Always `"community"` for third-party plugins |
| `minimumCRMVersion` | string | Minimum ChurchCRM version required |
| `mainClass` | string | Fully-qualified class name |

### Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `authorUrl` | string | Author's website |
| `dependencies` | array | Other plugin IDs this plugin requires |
| `settingsUrl` | string | Custom settings page URL (or null for inline) |
| `routesFile` | string | Path to routes file (relative to plugin root) |
| `settings` | array | Settings schema for admin UI |
| `menuItems` | array | Menu items to add to navigation |
| `hooks` | array | Hooks this plugin listens to |
| `cspCompatible` | boolean | Set `true` only when every plugin page runs under an enforced Content Security Policy with no violations (see below) |

### Content Security Policy (`cspCompatible`)

ChurchCRM enforces its Content Security Policy by default. While enforcement is on, Plugin Management marks a community plugin that does not declare `"cspCompatible": true` in `plugin.json` as **Not CSP-ready**. Set it only after every plugin page runs with no CSP violations in the browser console: every inline `<script>` carries the CSP nonce, there are no `onclick=`-style attributes or `javascript:` URLs, and third-party scripts ship inside the plugin (no CDN origins are allowed).

### Settings Schema

Define settings that appear in the Plugin Management UI:

```json
{
    "settings": [
        {
            "key": "apiKey",
            "label": "API Key",
            "type": "password",
            "required": true,
            "help": "Enter your API key from the service dashboard"
        },
        {
            "key": "enableFeatureX",
            "label": "Enable Feature X",
            "type": "boolean",
            "required": false,
            "help": "Turn on advanced features"
        },
        {
            "key": "webhookUrl",
            "label": "Webhook URL",
            "type": "text",
            "required": false,
            "help": "URL to receive notifications"
        }
    ]
}
```

**Setting Types**: `text`, `password`, `boolean`, `number`, `select`

### Menu Items

Add items to ChurchCRM's navigation:

```json
{
    "menuItems": [
        {
            "parent": "admin",
            "label": "My Plugin Dashboard",
            "url": "/plugins/my-awesome-plugin/dashboard",
            "icon": "fa-solid fa-plug",
            "permission": "bAdmin"
        }
    ]
}
```

**Parent Options**: `calendar`, `people`, `groups`, `sundayschool`, `email`, `events`, `deposits`, `fundraiser`, `reports`, `admin`, `custom`

---

## Main Plugin Class

Your plugin class must extend `AbstractPlugin` and implement required methods.

### Required Methods

```php
public function getId(): string;        // Return plugin ID
public function getName(): string;      // Return display name
public function getDescription(): string; // Return description
```

### Lifecycle Methods

```php
public function boot(): void
{
    // Called on every request when plugin is active
    // - Initialize services
    // - Register hooks
    // - Set up autoloaders
}

public function activate(): void
{
    // Called when admin enables the plugin
    // - Create database tables
    // - Initialize default settings
    // - Run migrations
}

public function deactivate(): void
{
    // Called when admin disables the plugin
    // - Clean up temporary files
    // - Cancel scheduled tasks
    // Note: Don't delete user data here!
}

public function uninstall(): void
{
    // Called when plugin is completely removed
    // - Drop database tables
    // - Delete all plugin data
    // - Remove config entries
}
```

### Configuration Methods

```php
public function isConfigured(): bool
{
    // Return true if plugin has all required settings
    return !empty($this->getConfigValue('apiKey'));
}

public function getConfigurationError(): ?string
{
    // Return error message if misconfigured, null if OK
    if (empty($this->getConfigValue('apiKey'))) {
        return gettext('API Key is required');
    }
    return null;
}

public function getSettingsSchema(): array
{
    // The admin UI renders the "settings" array from plugin.json (see
    // "Plugin Manifest (plugin.json)" above). This PHP schema is the copy
    // isConfigured() checks for required values — keep the two in sync.
    return [
        [
            'key' => 'apiKey',
            'label' => gettext('API Key'),
            'type' => 'password',
            'required' => true,
            'help' => gettext('Get this from your account settings'),
        ],
    ];
}
```

### Menu & UI Methods

```php
public function getMenuItems(): array
{
    return [
        [
            'parent' => 'admin',
            'label' => gettext('My Plugin'),
            'url' => 'plugins/my-awesome-plugin/dashboard',
            'icon' => 'fa-solid fa-plug',
        ],
    ];
}

public function getHeadContent(): string
{
    // Return HTML/JS to inject into <head>
    return '<link rel="stylesheet" href="' . $this->getAssetUrl('css/style.css') . '">';
}

public function getFooterContent(): string
{
    // Return HTML/JS to inject before </body>
    return '<script src="' . $this->getAssetUrl('js/plugin.js') . '"></script>';
}

private function getAssetUrl(string $path): string
{
    // AbstractPlugin provides no asset helper, so build the URL from the
    // plugin's web-served assets/ directory.
    return \ChurchCRM\dto\SystemURLs::getRootPath()
        . '/plugins/community/my-awesome-plugin/assets/' . $path;
}

public function getClientConfig(): array
{
    // Data exposed to JavaScript as window.CRM.plugins.{pluginId}
    return [
        'apiEndpoint' => '/plugins/my-awesome-plugin/api',
        'maxItems' => 100,
    ];
}
```

### Singleton Pattern

Always implement the singleton pattern for route access:

```php
private static ?MyAwesomePluginPlugin $instance = null;

public function __construct(string $basePath = '')
{
    parent::__construct($basePath);
    self::$instance = $this;
}

public static function getInstance(): ?MyAwesomePluginPlugin
{
    return self::$instance;
}
```

---

## Adding Routes

Create `routes/routes.php` to add pages and API endpoints.

### Basic Structure

```php
<?php

use ChurchCRM\dto\SystemURLs;
use ChurchCRM\Plugins\MyAwesomePlugin\MyAwesomePluginPlugin;
use ChurchCRM\Slim\SlimUtils;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Routing\RouteCollectorProxy;
use Slim\Views\PhpRenderer;

// Get plugin instance
$plugin = MyAwesomePluginPlugin::getInstance();
if ($plugin === null) {
    return; // Safety check - don't register routes if plugin not loaded
}

// MVC Routes (HTML pages)
$app->get('/my-awesome-plugin/dashboard', function (Request $request, Response $response) use ($plugin): Response {
    $renderer = new PhpRenderer(__DIR__ . '/../views/');
    
    return $renderer->render($response, 'dashboard.php', [
        'sRootPath' => SystemURLs::getRootPath(),
        'sPageTitle' => gettext('My Plugin Dashboard'),
        'pluginData' => $plugin->getData(),
    ]);
});

// API Routes (JSON endpoints)
$app->group('/my-awesome-plugin/api', function (RouteCollectorProxy $group) use ($plugin): void {
    
    // GET /plugins/my-awesome-plugin/api/items
    $group->get('/items', function (Request $request, Response $response) use ($plugin): Response {
        $items = $plugin->getItems();
        return SlimUtils::renderJSON($response, ['success' => true, 'data' => $items]);
    });
    
    // POST /plugins/my-awesome-plugin/api/items
    $group->post('/items', function (Request $request, Response $response) use ($plugin): Response {
        $body = $request->getParsedBody();
        
        try {
            $item = $plugin->createItem($body);
            return SlimUtils::renderJSON($response, ['success' => true, 'data' => $item]);
        } catch (\Exception $e) {
            return SlimUtils::renderErrorJSON($response, $e->getMessage(), [], 400, $e, $request);
        }
    });
    
    // DELETE /plugins/my-awesome-plugin/api/items/{id}
    $group->delete('/items/{id}', function (Request $request, Response $response, array $args) use ($plugin): Response {
        $plugin->deleteItem((int) $args['id']);
        return SlimUtils::renderJSON($response, ['success' => true]);
    });
});
```

### Route Security

Routes are only loaded when the plugin is active. For additional security:

```php
use ChurchCRM\Authentication\AuthenticationManager;
use ChurchCRM\Slim\Middleware\Request\Auth\AdminRoleAuthMiddleware;

// Admin-only routes
$app->group('/my-awesome-plugin/admin', function (RouteCollectorProxy $group) use ($plugin): void {
    $group->get('/settings', function ($request, $response) use ($plugin): Response {
        // Admin settings page
    });
})->add(AdminRoleAuthMiddleware::class);

// Check permissions in route handler
$app->post('/my-awesome-plugin/action', function (Request $request, Response $response) use ($plugin): Response {
    $user = AuthenticationManager::getCurrentUser();
    if (!$user->isAdmin()) {
        return SlimUtils::renderErrorJSON($response, gettext('Admin access required'), [], 403);
    }
    // ... handle action
});
```

---

## Adding Views

Create PHP view templates in the `views/` directory.

### Basic View Template

Create `views/dashboard.php`:

```php
<?php

use ChurchCRM\dto\SystemURLs;

// Include ChurchCRM header (navigation, CSS, etc.)
require SystemURLs::getDocumentRoot() . '/Include/Header.php';
?>

<!-- Breadcrumb Navigation -->
<div class="row mb-3">
    <div class="col-12">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0 bg-light">
                <li class="breadcrumb-item">
                    <a href="<?= SystemURLs::getRootPath() ?>/v2/dashboard">
                        <i class="fa-solid fa-home"></i>
                    </a>
                </li>
                <li class="breadcrumb-item">
                    <a href="<?= SystemURLs::getRootPath() ?>/plugins"><?= gettext('Plugins') ?></a>
                </li>
                <li class="breadcrumb-item active"><?= gettext('My Plugin') ?></li>
            </ol>
        </nav>
    </div>
</div>

<!-- Main Content -->
<div class="row">
    <div class="col-lg-8">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fa-solid fa-plug mr-2"></i><?= gettext('Dashboard') ?>
                </h3>
            </div>
            <div class="card-body">
                <p><?= gettext('Welcome to My Awesome Plugin!') ?></p>
                
                <!-- Data Table -->
                <table id="itemsTable" class="table table-striped">
                    <thead>
                        <tr>
                            <th><?= gettext('Name') ?></th>
                            <th><?= gettext('Status') ?></th>
                            <th><?= gettext('Actions') ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Populated via JavaScript -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4">
        <div class="card card-outline card-info">
            <div class="card-header">
                <h3 class="card-title"><?= gettext('Quick Stats') ?></h3>
            </div>
            <div class="card-body">
                <ul class="list-unstyled">
                    <li><strong><?= gettext('Total Items') ?>:</strong> <span id="totalItems">0</span></li>
                    <li><strong><?= gettext('Active') ?>:</strong> <span id="activeItems">0</span></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script nonce="<?= SystemURLs::getCSPNonce() ?>">
$(document).ready(function() {
    // Load data via AJAX
    $.ajax({
        url: window.CRM.root + '/plugins/my-awesome-plugin/api/items',
        method: 'GET',
        success: function(response) {
            if (response.success) {
                renderItems(response.data);
            }
        },
        error: function() {
            window.CRM.notify(i18next.t('Failed to load data'), { type: 'error' });
        }
    });
    
    function renderItems(items) {
        var tbody = $('#itemsTable tbody');
        tbody.empty();
        
        items.forEach(function(item) {
            // Build the cells with .text()/.attr() so stored values such as
            // item.name are shown as text, not parsed as HTML markup.
            var row = $('<tr>');
            row.append($('<td>').text(item.name));
            var badge = $('<span>')
                .addClass('badge badge-' + (item.active ? 'success' : 'secondary'))
                .text(item.active ? i18next.t('Active') : i18next.t('Inactive'));
            row.append($('<td>').append(badge));
            var deleteBtn = $('<button>')
                .addClass('btn btn-sm btn-danger delete-btn')
                .attr('data-id', item.id)
                .append('<i class="fa-solid fa-trash"></i>');
            row.append($('<td>').append(deleteBtn));
            tbody.append(row);
        });
        
        $('#totalItems').text(items.length);
        $('#activeItems').text(items.filter(i => i.active).length);
    }
    
    // Delete handler
    $(document).on('click', '.delete-btn', function() {
        var id = $(this).data('id');
        if (confirm(i18next.t('Are you sure?'))) {
            $.ajax({
                url: window.CRM.root + '/plugins/my-awesome-plugin/api/items/' + id,
                method: 'DELETE',
                success: function() {
                    window.CRM.notify(i18next.t('Item deleted'), { type: 'success' });
                    location.reload();
                }
            });
        }
    });
});
</script>

<?php
// Include ChurchCRM footer
require SystemURLs::getDocumentRoot() . '/Include/Footer.php';
```

### UI Guidelines

- Use **Bootstrap 5 and Tabler** components (see [Tabler UI Components](https://github.com/ChurchCRM/CRM/wiki/Tabler-UI-Components) for reference)
- Use Tabler card components for consistent styling
- Use `window.CRM.notify()` for notifications (not `alert()`)
- Use `i18next.t()` for JavaScript translations
- Use `gettext()` for PHP translations
- Include CSP nonce on script tags: `nonce="<?= SystemURLs::getCSPNonce() ?>"`

---

## Configuration & Settings

### Accessing Config Values

Plugins can only access their own config (sandboxed to `plugin.{id}.*`):

```php
// In your plugin class

// Get a string value
$apiKey = $this->getConfigValue('apiKey');

// Get a boolean value
$enabled = $this->getBooleanConfigValue('enableFeatureX');

// Set a value
$this->setConfigValue('lastSyncTime', date('c'));
```

### Config Storage

Settings are stored in the `config_cfg` table with keys like:
- `plugin.my-awesome-plugin.apiKey`
- `plugin.my-awesome-plugin.enableFeatureX`
- `plugin.my-awesome-plugin.enabled` (plugin active state)

---

## Using Hooks

Hooks let you respond to events in ChurchCRM. When an event occurs (a person is created, the menu is being built, etc.), ChurchCRM fires a hook and passes relevant data to all registered listeners.

### How Hooks Dispatch

When a hook fires, ChurchCRM calls `HookManager::doAction()` (for actions) or `HookManager::applyFilters()` (for filters) with the event name and parameters. All plugins that have registered listeners for that hook are notified. For example:

**Person Creation Hook Dispatch** (when any person is saved via ORM):
```php
// In Person::postInsert() (fires on INSERT)
HookManager::doAction(Hooks::PERSON_CREATED, $this);

// Your plugin receives it:
public function onPersonCreated($person): void
{
    // $person is the Person ORM object
    echo "Person created: " . $person->getFullName();
}
```

**Menu Building Hook Dispatch** (when the navigation menu is rendered):
```php
// In Menu::build()
$menus = HookManager::applyFilters(Hooks::MENU_BUILDING, $menus);

// Your plugin modifies it:
public function onMenuBuilding(array $menus): array
{
    $menus[] = [
        'label' => 'My Plugin',
        'url' => '/plugins/my-plugin/dashboard',
    ];
    return $menus;
}
```

### Registering Hooks

In your `boot()` method:

```php
use ChurchCRM\Plugin\Hook\HookManager;
use ChurchCRM\Plugin\Hooks;

public function boot(): void
{
    // Register action hooks
    HookManager::addAction(Hooks::PERSON_CREATED, [$this, 'onPersonCreated']);
    HookManager::addAction(Hooks::PERSON_UPDATED, [$this, 'onPersonUpdated']);
    HookManager::addAction(Hooks::DONATION_RECEIVED, [$this, 'onDonationReceived']);
}
```

### Hook Handlers

Here are example handlers for the implemented hooks:

```php
/**
 * Called when a person record is created
 */
public function onPersonCreated(\ChurchCRM\model\ChurchCRM\Person $person): void
{
    // $person is the Person ORM object with full data
    $logger = \ChurchCRM\Utils\LoggerUtils::getAppLogger();
    $logger->info('Person created: ' . $person->getFullName(), [
        'personId' => $person->getId(),
    ]);
    
    // Sync to external service
    $this->syncToExternalService($person);
}

/**
 * Called when a person record is updated (after initial creation)
 */
public function onPersonUpdated(\ChurchCRM\model\ChurchCRM\Person $person, array $oldData): void
{
    // $oldData contains the previous column values as an associative array
    // Use the oldData to detect what changed
    if ($oldData['Email'] !== $person->getEmail()) {
        $this->updateEmailInExternalService($person);
    }
}

/**
 * Called when a family record is created
 */
public function onFamilyCreated(\ChurchCRM\model\ChurchCRM\Family $family): void
{
    $this->registerFamilyWithService($family);
}

/**
 * Called when a family record is updated (after initial creation)
 */
public function onFamilyUpdated(\ChurchCRM\model\ChurchCRM\Family $family, array $oldData): void
{
    if ($oldData['Name'] !== $family->getName()) {
        $this->updateFamilyNameInService($family);
    }
}

/**
 * Called during background timer jobs
 * Register this hook in boot() to run periodic tasks
 */
public function onCronRun(): void
{
    // Run background work here (sync, cleanup, etc.)
    $this->syncPendingRecords();
    $this->cleanupExpiredData();
}

/**
 * Called when the admin menu is being built
 * This is a FILTER hook — you receive items and return modified items
 */
public function onMenuBuilding(array $menuItems): array
{
    $menuItems[] = [
        'label' => gettext('My Plugin Dashboard'),
        'url' => '/plugins/my-plugin/dashboard',
        'icon' => 'fa-solid fa-plug',
        'parent' => 'admin',
    ];
    return $menuItems;
}
```

### Available Hooks

Hooks fire at specific events in ChurchCRM. Register them in your `boot()` method using `HookManager::addAction()` for actions or `HookManager::addFilter()` for filters.

#### Implemented Hooks (currently active)

| Hook Constant | Parameters | Description |
|---------------|------------|-------------|
| `PERSON_CREATED` | `Person $person` | Fires after a person record is created via ORM |
| `PERSON_UPDATED` | `Person $person, array $oldData` | Fires after a person is updated (excludes creation) |
| `FAMILY_CREATED` | `Family $family` | Fires after a family record is created via ORM |
| `FAMILY_UPDATED` | `Family $family, array $oldData` | Fires after a family is updated (excludes creation) |
| `PERSON_DELETED` | `int $personId, array $personData` | Fires after a person record is deleted; $personData is a snapshot of the deleted row |
| `FAMILY_DELETED` | `int $familyId, array $familyData` | Fires after a family record is deleted; $familyData is a snapshot of the deleted row |
| `MENU_BUILDING` | `array $menuItems` (filter) | Allows plugins to register menu items dynamically |
| `SYSTEM_CALENDARS_REGISTER` | `SystemCalendar[] $calendars` (filter) | Allows plugins to contribute custom calendars |
| `CRON_RUN` | (none) | Fires during background timer jobs |

#### Defined but Not Yet Implemented

These hooks are available in `Hooks.php` but do not yet fire in the codebase. You may register listeners, but they won't be triggered until they're implemented:

- `EVENT_CREATED` — planned for event monitoring
- `EVENT_CHECKIN` — planned for check-in tracking
- `EVENT_CHECKOUT` — planned for check-out tracking
- `DONATION_RECEIVED` — planned for donation monitoring
- `DEPOSIT_CLOSED` — planned for deposit monitoring
- `GROUP_MEMBER_ADDED` — planned for group membership events
- `GROUP_MEMBER_REMOVED` — planned for group membership events

---

## Client-Side JavaScript

### Accessing Plugin Config

Data from `getClientConfig()` is available in JavaScript:

```javascript
// Access your plugin's client config
var config = window.CRM.plugins['my-awesome-plugin'];
console.log(config.apiEndpoint); // '/plugins/my-awesome-plugin/api'
```

### Making API Calls

```javascript
// Using jQuery (available globally)
$.ajax({
    url: window.CRM.root + '/plugins/my-awesome-plugin/api/items',
    method: 'POST',
    contentType: 'application/json',
    data: JSON.stringify({ name: 'New Item' }),
    success: function(response) {
        if (response.success) {
            window.CRM.notify(i18next.t('Item created!'), { type: 'success' });
        }
    },
    error: function(xhr) {
        var error = xhr.responseJSON?.message || i18next.t('An error occurred');
        window.CRM.notify(error, { type: 'error' });
    }
});
```

### Notifications

Always use `window.CRM.notify()` instead of `alert()`:

```javascript
// Success
window.CRM.notify(i18next.t('Operation completed'), { type: 'success' });

// Error
window.CRM.notify(i18next.t('Something went wrong'), { type: 'error' });

// Warning
window.CRM.notify(i18next.t('Please check your input'), { type: 'warning' });

// Info
window.CRM.notify(i18next.t('Did you know...'), { type: 'info' });
```

---

## Best Practices

### Do's ✅

- **Use namespaces**: `ChurchCRM\Plugins\YourPlugin\`
- **Use Propel ORM** for database access
- **Use gettext()** for all user-facing strings
- **Use i18next.t()** for JavaScript strings
- **Validate all input** before processing
- **Handle errors gracefully** with try/catch
- **Log important events** using `LoggerUtils::getAppLogger()`
- **Follow PSR-12** coding standards
- **Test thoroughly** before releasing

### Don'ts ❌

- **Don't use raw SQL** - use Propel Query classes
- **Don't modify core files** - use hooks instead
- **Don't hardcode paths** - use `SystemURLs::getRootPath()`
- **Don't use alert()** - use `window.CRM.notify()`
- **Don't store sensitive data** in client config
- **Don't skip security checks** for sensitive operations

### Security Guidelines

1. **Validate all input** - never trust user data
2. **Escape output** - prevent XSS attacks
3. **Check permissions** - verify user has access
4. **Use prepared statements** - Propel handles this
5. **Sanitize file uploads** - check types and sizes

---

## Testing Your Plugin

### Manual Testing

1. Enable your plugin in Admin → Plugin Management
2. Check that menu items appear
3. Navigate to your plugin's pages
4. Test all CRUD operations
5. Test with different user roles
6. Check browser console for JavaScript errors
7. Check `src/logs/` for PHP errors

### Debugging Tips

```php
// Log debug info
use ChurchCRM\Utils\LoggerUtils;

$logger = LoggerUtils::getAppLogger();
$logger->debug('My plugin action', ['data' => $someData]);
$logger->info('Important event happened');
$logger->error('Something went wrong', ['error' => $e->getMessage()]);
```

Check logs at: `src/logs/YYYY-MM-DD-app.log`

---

## Publishing Your Plugin

### Before Publishing

- [ ] Test on a fresh ChurchCRM install
- [ ] Test with minimum supported CRM version
- [ ] Remove debug/test code
- [ ] Update version number in plugin.json
- [ ] Write clear documentation (README.md)
- [ ] Add help.json for in-app documentation

### Distribution

Community plugins can be distributed via:

1. **GitHub Repository** - Users clone/download to `src/plugins/community/`
2. **ZIP File** - Users extract to `src/plugins/community/`

### Plugin Directory Structure for Distribution

```
my-awesome-plugin-v1.0.0.zip
└── my-awesome-plugin/
    ├── plugin.json
    ├── src/
    │   └── MyAwesomePluginPlugin.php
    ├── routes/
    │   └── routes.php
    ├── views/
    │   └── dashboard.php
    ├── help.json
    └── README.md
```

### Installation Instructions for Users

```
1. Download my-awesome-plugin-v1.0.0.zip
2. Extract to src/plugins/community/
3. Go to Admin → Plugin Management
4. Find "My Awesome Plugin" and click Enable
5. Configure settings as needed
```

---

## Example Plugins

Study these core plugins for reference:

| Plugin | Complexity | Features |
|--------|------------|----------|
| `gravatar` | Simple | Config-only, no routes |
| `google-analytics` | Simple | Head content injection |
| `mailchimp` | Complex | Routes, views, API integration, hooks |

Browse the source at: `src/plugins/core/`

---

## Getting Help

- **Questions & help**: [Ask on Discord](https://discord.gg/tuWyFzj3Nj)
- **Issues**: [Open a GitHub issue](https://github.com/ChurchCRM/CRM/issues/new/choose)

---

*Last updated: February 2026 | ChurchCRM 7.x*
