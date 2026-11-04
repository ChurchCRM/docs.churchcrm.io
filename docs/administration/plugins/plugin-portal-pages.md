---
title: Member Portal Pages in a Plugin
sidebar_position: 5
---

# Member Portal pages in a plugin

This page is for **plugin developers** who want their plugin to show something to members in the [Member Portal](../../user-guide/member-portal.md). It is not for site administrators.

A plugin can add pages, an API and navigation entries to the portal. Each one names a **portal capability** that the plugin declares, and only members who hold that capability reach it. ChurchCRM decides who holds a capability the same way for core and plugins; see [Portal permissions](../portal-permissions.md) for how administrators see and give them. A plugin that doesn't use any of this is unaffected.

---

## The pieces

| Piece | Where | What it does |
|---|---|---|
| Capabilities | `plugin.json` → `portal.capabilities` | What members may see or do. Each has a `key`, `label`, `description` and `scopeType` |
| Rules | `getPortalRules()` in the plugin class | Who holds a capability, worked out from church data |
| Pages and API | `plugin.json` → `portalRoutesFile` | Routes under `/portal/plugins/<id>/…` and `/api/portal/plugins/<id>/…` |
| Templates | `portal/templates/*.html.twig` | Pages in the church's portal theme |
| Navigation | `getPortalNavItems()` in the plugin class | Entries in the portal navigation, each tied to a capability |

```
plugins/community/my-plugin/
├── plugin.json
├── src/MyPluginPlugin.php
└── portal/
    ├── routes.php
    └── templates/
        └── notices.html.twig
```

---

## Declare capabilities

```json
"portalRoutesFile": "portal/routes.php",
"portal": {
    "capabilities": [
        {
            "key": "plugin.my-plugin.roster.view",
            "label": "See a group's roster",
            "description": "See who is in a group they belong to.",
            "scopeType": "group"
        },
        {
            "key": "plugin.my-plugin.notices",
            "label": "Read the notice board",
            "description": "Read the church notice board.",
            "scopeType": "none"
        }
    ]
}
```

- Keys are lower case and start with `plugin.<your plugin id>.`. A declaration with any other key is ignored, with a warning in the app log. A key that isn't declared can't be checked: every check for it says no.
- `scopeType` says what the capability is held *on*: `none` (everywhere, the default), `family`, `team`, `ministry`, `group`, or a lower-case word of your own. Administrators can give a capability by hand only when its scope type is one of the five built-in ones; one with your own scope type comes from your rules alone.
- The label and description are what administrators read on the **Permissions** tab of **People → Admin → Member Portal** and in **Give a portal permission** on a person's page.

---

## Say who holds them

A member holds a capability when a rule gives it to them, or when an administrator gives it on the person's page. Return your rules from `getPortalRules()`. `CallbackPortalRule` takes a key for the rule and a function that receives the person and returns their grants:

```php
use ChurchCRM\model\ChurchCRM\Person;
use ChurchCRM\model\ChurchCRM\Person2group2roleP2g2rQuery;
use ChurchCRM\Portal\Permissions\CallbackPortalRule;
use ChurchCRM\Portal\Permissions\PortalRuleGrant;
use ChurchCRM\Portal\Permissions\PortalScope;

public function getPortalRules(): array
{
    return [
        new CallbackPortalRule('plugin.my-plugin.group-members', static function (Person $person): array {
            $grants = [];
            foreach (Person2group2roleP2g2rQuery::create()->filterByPersonId((int) $person->getId())->find() as $membership) {
                $grants[] = new PortalRuleGrant(
                    'plugin.my-plugin.roster.view',
                    PortalScope::group((int) $membership->getGroupId()),
                    sprintf('Member of %s', $membership->getGroup()?->getName())
                );
            }

            return $grants;
        }),
    ];
}
```

- The third argument of `PortalRuleGrant` is the source administrators see, for example *"Member of Choir"*.
- `PortalScope` has `none()`, `family()`, `team()`, `ministry()` and `group()`; for a scope type of your own, use `new PortalScope('your-type', $id)`. A grant whose scope doesn't match the capability's `scopeType` counts for nothing.
- A plugin's rules can give only that plugin's own capabilities.
- Rules are worked out again on every request, so a grant ends by itself when the data changes. Keep them quick. A rule that throws gives nothing for that request, and the error goes to the app log.

---

## Add pages and an API

ChurchCRM includes your `portalRoutesFile` twice, with `$portalArea` set to `'pages'` for routes under `/portal/plugins/<id>` and to `'api'` for routes under `/api/portal/plugins/<id>`. Both sit behind the portal session, so only someone signed in to the portal reaches them. The file gets `$routes` (a `PortalPluginRoutes`), `$portalArea` and `$plugin`, not the Slim group. `$routes` has `get`, `post`, `put`, `patch` and `delete`, and each takes the route's capability as its third argument, so a route without one can't be added:

```php
use ChurchCRM\Portal\Permissions\RequirePortalCapability;
use ChurchCRM\Portal\PortalTwig;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

if ($portalArea === 'pages') {
    $routes->get('/notices', function (Request $request, Response $response): Response {
        return PortalTwig::renderPluginPage($response, 'my-plugin', 'notices.html.twig', ['pageTitle' => 'Notice board'], 'my-plugin-notices');
    }, 'plugin.my-plugin.notices');

    $routes->get('/rosters/{groupId:[0-9]+}', function (Request $request, Response $response, array $args): Response {
        // …
    }, RequirePortalCapability::onRouteArgument('plugin.my-plugin.roster.view', 'groupId'));
}
```

- A capability key as the third argument lets in anyone who holds it on anything. It is the same as `RequirePortalCapability::any($key)`.
- `RequirePortalCapability::onRouteArgument($key, 'groupId')` checks that the member holds it on the group in the address. Someone else's group answers *not found*, whether or not it exists, so ids can't be probed.
- `RequirePortalCapability::onOwnFamily($key)` checks it on the member's own family.
- A capability that isn't declared, or whose plugin is off, answers *not found*. One the member doesn't hold answers *forbidden*.
- `(new PortalAuthorizationService())->scopeIdsForPerson($personId, $key)` lists the ids a member holds a capability on, for example to list only their groups. `PortalContext::principal()?->personId` is the member signed in.

### Reads and writes

A `get` route only reads; change data in `post`, `put`, `patch` or `delete`. ChurchCRM tells reads from writes by the method: while an administrator uses Login as Person read-only, GET and HEAD go through and every other method is refused. Every write also needs the CSRF token: put `{{ csrf_field() }}` in your forms. A write without it is refused.

---

## Templates

`PortalTwig::renderPluginPage($response, $pluginId, $template, $model, $activeNavId)` renders a template from your `portal/templates/` folder in the church's portal theme. Inside that folder, refer to your other templates as `@plugin/…`. Pass the `id` of your navigation entry as `$activeNavId` so it is highlighted. Extend the theme's layout, and use `portal_can()` to show a section only to members who hold a capability:

```twig
{% extends "layout.html.twig" %}

{% block content %}
<section class="portal-card">
    <h1 class="portal-page-title">{{ pageTitle }}</h1>
    {% if portal_can('plugin.my-plugin.notices') %}
    <p>The picnic is on Saturday.</p>
    {% endif %}
</section>
{% endblock %}
```

`portal_can(capability, scope)` takes an optional scope: the record or its id. Hiding a section is never the only guard; the route checks again. The blocks, functions and globals a portal template can use are in the [Member Portal template reference](../member-portal-template-reference.md).

---

## Navigation

```php
public function getPortalNavItems(): array
{
    return [
        ['id' => 'my-plugin-notices', 'label' => 'Notice board', 'url' => '/portal/plugins/my-plugin/notices',
         'icon' => 'fa-solid fa-thumbtack', 'capability' => 'plugin.my-plugin.notices'],
    ];
}
```

- An entry shows only to members who hold its capability on something. Plugin entries appear before **My Family**.
- `label`, `url` and `capability` are required, and `url` must start with `/portal/`; an entry without them is left out. `icon` defaults to a puzzle piece, and `id` to `plugin.<id>.<position>`.

---

## When the plugin is turned off

Its pages, API and navigation entries disappear, its rules stop, and every check for its capabilities says no. Permissions an administrator gave stay stored and work again when the plugin is turned back on; uninstalling the plugin deletes them.

A plugin is trusted code running inside ChurchCRM. Portal capabilities give it one consistent way to decide what members see, and make a forgotten check hard to write; they are not a sandbox. The [plugin security checklist](./plugin-security-and-compliance.md) still applies.

A complete working example is the `portal-example` plugin in the ChurchCRM repository, under `cypress/fixtures/plugins/portal-example/`.
