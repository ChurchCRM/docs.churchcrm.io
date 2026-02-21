# ChurchCRM Docs — Agent Guide

This file tells AI agents (Claude, Copilot, etc.) everything they need to know to
update, create, and reorganize documentation in this repo correctly.

---

## Repo Structure

```
docs.churchcrm.io/
├── .agents/
│   └── DOCS_GUIDE.md          ← you are here
├── .github/
│   └── workflows/
│       └── deploy.yml         ← auto-deploys on every push to main
├── docs/
│   ├── index.md               ← site home / welcome page
│   ├── installation/          ← install guides
│   ├── getting-started/       ← first run, features overview
│   ├── user-guide/            ← how-to pages for end users
│   ├── administration/        ← sysadmin, troubleshooting
│   └── developers/            ← dev setup, contributing, reference
├── static/
│   └── img/                   ← all images, grouped by section
├── src/css/custom.css         ← theme overrides only
├── docusaurus.config.ts       ← site config, navbar, footer
├── sidebars.ts                ← navigation tree (update when adding pages)
└── package.json
```

---

## How to Edit an Existing Page

1. Open `docs/<section>/<page>.md`
2. Make your changes
3. Commit and push to `main`
4. GitHub Actions builds and deploys automatically (~90 seconds)

---

## How to Add a New Page

1. Create `docs/<section>/your-new-page.md`
2. Add front matter at the top (see below)
3. Open `sidebars.ts` and add the page ID under the correct category
4. Commit and push

---

## Required Front Matter

```md
---
title: Human Readable Title
sidebar_position: 3
---
```

Optional but encouraged:

```md
---
title: Human Readable Title
sidebar_position: 3
description: One sentence summary shown in search results and social previews.
---
```

---

## Adding Images / Screenshots

1. Place in `static/img/<section>/filename.png`
2. Reference as: `![alt text](/img/section/filename.png)`

---

## Internal Links

Use relative paths:

```md
[Persons](./persons.md)
[Upgrade Guide](../administration/upgrade.md)
```

---

## Callout Boxes

```md
:::tip
A helpful suggestion.
:::

:::warning
Something to be careful about.
:::

:::danger
Could cause data loss or security issues.
:::
```

---

## Sidebar Doc IDs

The doc ID is the file path relative to `docs/`, without `.md`:

```
docs/user-guide/new-feature.md  →  ID: user-guide/new-feature
```

Four sidebars exist: `gettingStartedSidebar`, `userGuideSidebar`, `adminSidebar`, `devSidebar`.

---

## What NOT to Change

- `package.json` / `package-lock.json`
- `.github/workflows/deploy.yml`
- `src/css/custom.css` (unless specifically asked)
- `static/img/logo.png` / `favicon.ico`
