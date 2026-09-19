---
title: Church Themes
sidebar_position: 41
description: Give the Member Portal your church's own look with a theme folder — colours, fonts and page templates — and know what happens when a theme breaks.
---

# Church themes for the Member Portal

Out of the box the [Member Portal](../user-guide/member-portal.md) wears ChurchCRM's system theme. A **theme** is how your church makes it look like your church: your colours, your fonts, your welcome band. A theme is a folder your church uploads to the server and picks on **Admin → Member Portal**. Nothing is installed, registered or compiled.

This page is the overview. The complete authoring reference — every design token, every template block and variable — is the [theme authoring guide](https://github.com/ChurchCRM/CRM/blob/master/docs/portal-themes.md) in the ChurchCRM repository, which **Admin → Member Portal → Themes** links to as **Read the theme authoring guide**.

:::warning Themes are your church's responsibility
Themes are provided by your church, not by ChurchCRM, and are not reviewed, signed or verified by the ChurchCRM project. A theme's files are trusted exactly as far as the administrator who uploaded them. The admin page says so too.
:::

---

## Where a theme lives

```
Include/themes/<your-theme>/
```

`Include/` is the one directory ChurchCRM promises to leave alone: the upgrader never overwrites it and the file-integrity scan ignores it. Your theme survives every ChurchCRM upgrade.

The **folder name is the theme**: it is the id ChurchCRM stores and the name shown on the admin page, spelled exactly as you spelled it. An optional `theme.json` can give it a friendlier display name, an author and a description for the admin page — nothing more.

:::danger Never edit the system theme
`Include/themes/default/` ships with ChurchCRM and is overwritten on every upgrade. Copy it, rename the copy, and edit that.
:::

## What a theme can contain

Every file is optional. A theme with only `theme.css` is a complete theme.

| File | What it does |
|------|--------------|
| `theme.css` | Loaded after the portal's own stylesheet. Redefine the design tokens — `--portal-primary`, `--portal-accent`, `--portal-font-body`, `--portal-font-heading`, `--portal-hero-image` and the rest — and every portal page is recoloured and refonted. Dark mode has its own block. |
| `theme.js` | Loaded last, after translations are ready. |
| `images/`, `fonts/` | Pictures and self-hosted fonts, referenced from your CSS or templates. |
| `templates/<path>.html.twig` | Replaces the portal template at the same path. Usually you extend the original and override one block (the home page's hero band, the footer) rather than rewriting a page. |
| `theme.json` | Optional name, author and description for the admin page. |

A theme never contains PHP. Templates can only use what the portal exposes, which is what makes an uploaded theme safe to render.

## Editing is live

Upload a changed file and reload the page. Templates recompile when their file changes, and `theme.css` and `theme.js` are fetched afresh when they change; there is no cache to clear. For heavier work, **Developer mode** on **Admin → Member Portal → Settings** turns the template cache off entirely and prints the name of the template behind each page into its HTML, so you know which file to copy.

## Checking and activating

On **Admin → Member Portal**:

1. **Check** compiles every template in the theme and lists any problem with its file, line and message, without changing anything.
2. **Activate** does the same check first. A theme with errors is refused and the portal keeps the theme it had; warnings (an override at a path this version no longer renders, an image a template asks for that is not in the theme) are shown and allowed.

Run **Check** again after each ChurchCRM upgrade: it is how a theme finds out that a template it overrode has moved.

## When a theme is broken

A theme fails loudly. There is no silent fall-back to the system theme, because that would hide the problem from the person who can fix it.

| What happened | An administrator sees | A member sees |
|---------------|-----------------------|---------------|
| Activation of a theme that does not compile | The admin page refuses and lists the findings | Nothing changes |
| The active theme fails while rendering a page | **The Member Portal theme could not be rendered**, with theme, file, line and message | **The Member Portal is temporarily unavailable** — *"The church office has been notified. Please try again later."* |
| The active theme's folder is gone | The same error page, and **The active theme folder is missing** on the admin page | The same page |

Every failure is also written to the application log (**Admin → System → Logs**). So after uploading a change, open a portal page yourself while signed in as an administrator: if something is wrong, you — not your members — will see exactly what.

## Deploying and keeping a theme

- Keep the theme in its own repository or folder and upload it over SFTP or with your own script. ChurchCRM's releases never touch it.
- If your deployment mirrors the release over the installation and **deletes unknown files**, exclude `Include/themes/` — or the deploy removes the theme and members see the *temporarily unavailable* page until you pick a theme that exists.
- Theme files are read by the web server, never written. A theme uploaded as a different user than the web server runs as, with permissions the server cannot read, validates as broken. See [File System Permissions](./file-system-permissions.md).
- Theme assets are served through the application, restricted to stylesheet, script, image and font files, so a theme folder cannot be used to serve anything else. No web-server configuration is needed or should be changed.

---

## Related documentation

- [Member Portal administration](./member-portal.md)
- [Member Portal — for members](../user-guide/member-portal.md)
- [Theme authoring guide](https://github.com/ChurchCRM/CRM/blob/master/docs/portal-themes.md) and [template reference](https://github.com/ChurchCRM/CRM/blob/master/docs/portal-templates.md) in the ChurchCRM repository
