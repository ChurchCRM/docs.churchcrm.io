---
title: Member Portal Theme Authoring Guide
sidebar_position: 42
description: The complete reference for writing a Member Portal theme - folder layout, design tokens, template overrides, assets, Content Security Policy and the admin page.
---


The Member Portal (`/portal`) is the member-facing area of ChurchCRM: what a
congregation member lands in after signing in. A **theme** is how your church
makes it look like your church, on every portal page and also on the signed-out
pages: member sign-in, family registration and the email-confirmation page.

A theme is a folder. You do not build or install it separately. Upload the
files and activate the theme on **People → Admin → Member Portal → Themes**.
Activating it compiles its templates.

> **Themes are provided by your church, not by ChurchCRM.** Unlike community
> plugins, themes are not reviewed, signed or verified by anyone. A theme's
> files are trusted exactly as far as the administrator who uploaded them.

---

## Where a theme lives

```
src/Include/themes/<your-theme>/
```

ChurchCRM leaves your own folders under `Include/themes/` in place across an
upgrade. The system theme, `Include/themes/default/`, is replaced. `Include/`
also holds `Config.php`, which the upgrader does not overwrite, and the
orphan-file scan ignores `Include/`.

The folder name is the theme id in the configuration, spelled exactly as you
spelled it. The admin page shows the `name` from `theme.json` when that file
has one. Otherwise it shows the folder name.

> **Copy `Include/themes/default/` before editing.** It is the system theme; it ships
> with the release and is overwritten on every upgrade. Rename the copy and edit that.

---

## What a theme can contain

Every file is optional. A theme with only `theme.css` is a complete theme.

| Path | What it does |
|---|---|
| `theme.css` | Loaded after the portal's own stylesheet. Redefine the design tokens below, or restyle anything. |
| `theme.js` | Loaded last, after the translations are ready. |
| `images/`, `fonts/` | Referenced from CSS with a relative `url("images/hero.jpg")`, or from a template with `{{ theme_asset('images/hero.jpg') }}`. |
| `templates/**` | Any file with the same relative path as one in `default/templates/` replaces it. You may also add partials of your own and include them from your overrides. |
| `theme.json` | Optional `{"name": "…", "author": "…", "description": "…"}` for the admin page. Nothing functional. |

**A theme never contains PHP.** Templates can only call what the portal exposes
(see [template reference](./member-portal-template-reference.md)). That stops a
theme from running PHP on the server. `theme.js` still runs in the member's
browser, so upload a theme only when you trust it. A theme has no PHP extension
point.

### The smallest possible theme

```
src/Include/themes/uccc/
  theme.css
```

```css
:root {
  --portal-primary: #6b1d2c;
  --portal-primary-contrast: #ffffff;
  --portal-accent: #c9a227;
  --portal-surface: #ffffff;
  --portal-surface-alt: #f6f1ea;
  --portal-text: #1f1f1f;
  --portal-muted: #6b6b6b;
  --portal-font-body: "Source Sans 3", system-ui, sans-serif;
  --portal-font-heading: "Fraunces", Georgia, serif;
  --portal-radius: 12px;
  --portal-header-bg: var(--portal-primary);
  --portal-header-text: var(--portal-primary-contrast);
  --portal-hero-image: url("images/hero.jpg");
}
```

That alone recolours and refonts every portal page.

### Design tokens

| Token | Used for |
|---|---|
| `--portal-primary` | Header background, active navigation, buttons |
| `--portal-primary-contrast` | Text drawn on `--portal-primary` |
| `--portal-accent` | Badges |
| `--portal-surface` | Cards, navigation bar, footer |
| `--portal-surface-alt` | Page background |
| `--portal-text` | Body text |
| `--portal-muted` | Secondary text |
| `--portal-border` | Card and divider borders |
| `--portal-font-body` | Body font stack |
| `--portal-font-heading` | Headings and the church name |
| `--portal-radius` | Corner radius |
| `--portal-header-bg`, `--portal-header-text` | Header, when you want it different from `--portal-primary` |
| `--portal-hero-image` | The `hero` block's background image |
| `--portal-content-width` | Maximum content width |
| `--portal-gap` | The spacing rhythm |
| `--portal-success`, `--portal-success-contrast` | A "saved" notice — green by default |
| `--portal-warning`, `--portal-warning-contrast` | A "have a look at this" notice |
| `--portal-danger`, `--portal-danger-contrast` | A "that did not work" notice |
| `--portal-info`, `--portal-info-contrast` | A plain notice; follows `--portal-primary` |
| `--portal-toast-width` | How wide the notice stack is, off a phone |

**Notices.** Every message the portal shows — "Your details have been saved.",
"Nothing was saved." — is a toast in a fixed container in the top-right corner
(the whole width, with a margin, on a phone). It is always out of the document
flow, so a notice never moves the page. The four pairs of tokens above are the
whole palette; the markup is `.portal-toasts > .portal-flash.portal-flash-<type>`.

**Dark mode.** For a member the portal follows the device's light or dark
setting. Staff who open the portal from their staff sign-in get the colour mode
of their staff account. In dark mode the portal carries `data-bs-theme="dark"`
on `<html>`, so redefine whichever tokens need it:

```css
[data-bs-theme="dark"] {
  --portal-surface: #1a1d21;
  --portal-surface-alt: #22262b;
  --portal-text: #f1f3f5;
}
```

If your theme deliberately supports only one look, leave the block out — the
portal's own defaults still apply.

**Right-to-left.** Portal CSS uses logical properties only
(`margin-inline-start`, not `margin-left`), so it is correct in both directions
without a flipped second stylesheet. Write your theme the same way and Arabic and
Hebrew installs get your design for free.

---

## Overriding a template

Copy the template you want to change out of `Include/themes/default/templates/`
into your theme at the **same relative path**, and edit it:

```
src/Include/themes/uccc/templates/home.html.twig
```

Usually you do not want to rewrite the page — you want to change one part of it.
Extend the core template through the `@default` namespace and override a single
block:

```twig
{% extends "@default/home.html.twig" %}

{% block hero %}
<section class="portal-hero uccc-hero">
    <img src="{{ theme_asset('images/welcome.jpg') }}" alt="">
    <h1>{{ gettext('Welcome home') }}</h1>
</section>
{% endblock %}
```

`@default/...` always addresses the template that ships with ChurchCRM, even
from the file that replaces it — no infinite loop.

The blocks every page offers, and every variable a template can read, are
documented in [template reference](./member-portal-template-reference.md).

The signed-out pages — `login/*.html.twig`, `register/index.html.twig` and
`email-change/confirm.html.twig` — extend the same layout with an empty `nav`
block. Their header has no account menu; it offers **Sign in** or **Register
your family** instead, when those are switched on.

---

## Live editing

Templates are live: upload a changed file over FTP and reload the page. Twig
recompiles a template whose file changed, so nothing has to be cleared. The same
goes for `theme.css` and `theme.js` — their URLs carry the file's modification
time, so a changed file is a different URL and the browser fetches it.

---

## Activating a theme

**People → Admin → Member Portal → Themes** lists every folder under
`Include/themes/`, the system theme first. Open your theme's action menu and
choose **Activate**.

Activation compiles **every** template in the theme first. If any of them does
not compile, activation is refused and the page lists the file, the line and the
message. Warnings — an override at a path this version of ChurchCRM does not
render, an image a template asks for that is not in the theme — are shown but do
not block activation.

---

## When a theme is broken

A broken theme fails loudly: the portal does not fall back to the system theme, so the problem stays visible to the person who can fix it.

| What happened | An administrator sees | A member sees | Where it is recorded |
|---|---|---|---|
| Activation of a theme whose template does not compile | The admin page refuses and lists file, line and message | nothing changes | the application log |
| The active theme fails while rendering a page | The theme error page: theme, file, line, message | "The Member Portal is temporarily unavailable" and "The church office has been notified. Please try again later." | the application log (**Admin → System → Logs**) *and* the web server's error log |
| The active theme's folder is gone | The same error page, saying the folder was not found | the same page | the same two logs |

So: after uploading a change, sign in as an administrator and open the portal
from **Member Portal** in your user menu. If something is wrong, you — not your
members — will see exactly what. The signed-out pages (sign-in, registration)
are not part of your session, so a failure there shows the members' page even
to you: open them in a private window after a change, and read the detail in
the log.

---

## Assets and the rules they follow

Theme files are never served straight off disk: `Include/` is closed to the web
on purpose. They come out through the application at

```
/portal/theme/<theme>/<path>
```

which serves **only** these extensions:

```
css js png jpg jpeg gif svg webp ico woff woff2 ttf
```

Anything else — `theme.json`, a template, a stray `.php`, a path containing
`..` — is a 404. Served files carry an `ETag` and a one-year cache lifetime, and
their URLs carry the file's modification time, so a changed file is picked up at
once and an unchanged one is never re-downloaded.

### Content Security Policy

The portal runs under ChurchCRM's CSP, and your theme runs inside it:

- **Fonts and stylesheets** may come from this installation, from
  `fonts.googleapis.com` and from `fonts.gstatic.com` (fonts also as `data:`
  URIs). Nothing else. Self-hosting a font file in your theme's `fonts/` folder
  always works.
- **Scripts** must be your theme's own `theme.js`, or inline with the
  request's nonce: `<script nonce="{{ nonce() }}">`. A script from another
  origin is blocked.
- **Images** may come from this installation or be `data:` URIs. Other image
  hosts are blocked, apart from the map tiles and avatars ChurchCRM itself uses.

### Writing a safe template

- Leave member-typed values to Twig's default escaping. `|raw` turns it off, and that is how a name becomes
  a script tag, so keep it off anything a member typed.
- Call only the functions listed in
  [template reference](./member-portal-template-reference.md); templates have no PHP, filesystem,
  database or session access.
- Wrap text you add in `{{ gettext('…') }}` if your church uses more than one
  language.

---

## Distributing a theme

`Include/themes/*` is ignored by ChurchCRM's git repository (except the system
theme), so keep your theme in its own repository and deploy it with your own
script or over FTP. Nothing in ChurchCRM's release will ever overwrite it.

---

## Admin → Member Portal

The portal's administrator page is **People → Admin → Member Portal**
(`/admin/member-portal`), for administrators only. Its tabs are **Statistics**,
**Sign-in**, **Members**, **Permissions**, **Audit**, **Themes**, **Calendars**
and **Directory**; see [Member Portal administration](./member-portal.md). Two
of them matter to a theme author.

### Themes

A table of every theme folder on the server, the system theme first as
*System default*: its display name (from `theme.json` when present, otherwise
the folder name) with an **Active** badge on the one members see, the folder,
the author and description from `theme.json`, how many templates it overrides,
and its last validation result: *Valid*, *Warnings* or *Errors*. **Findings**
opens the row under a theme to list them, file, line and message.

Each row's action menu has:

- **Check** runs the validator against that theme and lists what it found,
  without changing anything. Use it after uploading a change, before making the
  theme live.
- **Activate** makes that theme the one members see, on their next request.
  Activation validates first: a theme with error-level findings is
  **refused**, the findings are listed, and the portal keeps the theme it
  already had. Warnings are shown and allowed.

> **Themes are provided by your church, not by ChurchCRM, and are not verified
> by the ChurchCRM project.** The page says so too.

**Developer mode**, under **Theme development** below the table, is for whoever
is writing the theme:

- the Twig compile cache is turned off entirely, so nothing can go stale while
  you edit (normal operation already recompiles a changed file on the next
  request — this simply removes the cache from the picture);
- every portal page starts with a comment naming the template that produced it:

  ```html
  <!-- portal template: home.html.twig -->
  ```

  which tells you exactly which file to copy into your theme to override it.

Leave Developer mode **off** in normal use: without the cache, every page
recompiles its templates on every request.

What the portal offers members is set elsewhere: the calendar appears while a
calendar is switched on under **Calendars**, the volunteering pages and birthday
editing are under **What members can use** on **Permissions**, and the member
directory is on **Directory**. A theme reads the result through `nav`,
`portal_can()` and the `portal` global, never through the settings themselves.

### Statistics

How much the portal is being used, for members and for staff who open the
portal from their staff sign-in:

| Number | What it counts |
|---|---|
| **Active now** | People who used the portal in the last 15 minutes |
| **Last 24 hours** / **Last 7 days** / **Last 30 days** | People who signed in in that time |
| **May sign in** | Everyone the sign-in rules let in today who has an email of their own that nobody else uses |
| **Never signed in** | Of those, everyone who has never signed in |
| **Ten most recent sign-ins** | Newest first, with **How** they signed in, **Last sign-in** and **Last seen in the portal** |

The last activity is recorded at most once a minute per person, so **Active
now** is honest without costing a write per page view.
