---
title: Member Portal Pages in a Plugin
sidebar_position: 5
---

# Member Portal pages in a plugin

This page is for **plugin developers** who want their plugin to show something to members in the [Member Portal](../../user-guide/member-portal.md). It is not for site administrators.

A plugin can add pages, an API and navigation entries to the portal. Each one names a **portal capability** that the plugin declares, and only members who hold that capability see it. ChurchCRM decides who holds a capability the same way for core and plugins; see [Portal permissions](../portal-permissions.md) for how administrators see and give them. A plugin that doesn't use any of this is unaffected.

---

## The pieces

| Piece | Where | What it does |
|---|---|---|
| Capabilities | `plugin.json` → `portal.capabilities` | What members may see or do. Each has a `key`, `label`, `description` and `scopeType` |
| Rules | `getPortalRules()` in the plugin class | Who holds a capability, worked out from church data on every request |
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

- Keys start with `plugin.<your plugin id>.`. A key that isn't declared can't be checked: every check for it says no.
- `scopeType` says what the capability is held *on*: `none` (everywhere), `family`, `team`, `ministry`, `group`, or a word of your own.
- The label and description are what administrators read on **Admin → Member Portal → Permissions** and in **Give a permission**.

---

## Say who holds them

A member holds a capability when a rule gives it to them, or when an administrator gives it on the person's page. Return your rules from `getPortalRules()`. `CallbackPortalRule` wraps a function that receives the person and returns their grants:

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

The third argument of `PortalRuleGrant` is the source administrators see, for example *"Member of Choir"*. Rules run on every request, so a grant ends by itself when the data changes. Keep them quick.

---

## Add pages and an API

ChurchCRM includes your `portalRoutesFile` twice, with `$group` and `$portalArea` set: `'pages'` under `/portal/plugins/<id>`, and `'api'` under `/api/portal/plugins/<id>`. Both sit behind the portal session, so only a signed-in member reaches them. Guard every route with `RequirePortalCapability`:

```php
use ChurchCRM\Portal\Permissions\RequirePortalCapability;
use ChurchCRM\Portal\PortalTwig;

if ($portalArea === 'pages') {
    $group->get('/notices', function ($request, $response) {
        return PortalTwig::renderPluginPage($response, 'my-plugin', 'notices.html.twig', ['pageTitle' => 'Notice board']);
    })->add(RequirePortalCapability::any('plugin.my-plugin.notices'));

    $group->get('/rosters/{groupId:[0-9]+}', function ($request, $response, array $args) {
        // …
    })->add(RequirePortalCapability::onRouteArgument('plugin.my-plugin.roster.view', 'groupId'));
}
```

- `RequirePortalCapability::any($key)` lets in anyone who holds the capability on anything.
- `RequirePortalCapability::onRouteArgument($key, 'groupId')` checks that the member holds it on the group in the address. Someone else's group answers *not found*, so ids can't be probed.
- `PortalAuthorizationService::scopeIdsForPerson($personId, $key)` lists the ids a member holds a capability on, for example to list only their groups.

---

## Templates

`PortalTwig::renderPluginPage()` renders a template from your `portal/templates/` folder in the church's portal theme. Extend the layout, and use `portal_can()` to show a section only to members who hold a capability:

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

The variables a portal template can use are described in the theme authoring guide ([Church themes](../member-portal-themes.md)).

---

## Navigation

```php
public function getPortalNavItems(): array
{
    return [
        ['label' => 'Notice board', 'url' => '/portal/plugins/my-plugin/notices',
         'icon' => 'fa-solid fa-thumbtack', 'capability' => 'plugin.my-plugin.notices'],
    ];
}
```

An entry shows only to members who hold its capability on something. Plugin entries appear before **My Family**.

---

## When the plugin is turned off

Its capabilities, rules, pages and navigation entries disappear, and every check for its capabilities says no. Permissions an administrator gave stay stored and work again when the plugin is turned back on; uninstalling the plugin deletes them.

A plugin is trusted code running inside ChurchCRM. Portal capabilities give it one consistent way to decide what members see; they are not a sandbox. The [plugin security checklist](./plugin-security-and-compliance.md) still applies.

A complete working example is the `portal-example` plugin in the ChurchCRM repository, under `cypress/fixtures/plugins/portal-example/`.
