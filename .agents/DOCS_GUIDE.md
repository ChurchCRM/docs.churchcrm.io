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
│   └── api/                   ← 3rd-party developer API reference (auto-generated from OpenAPI spec)
├── static/
│   └── img/                   ← documentation-specific images only
├── src/css/custom.css         ← theme overrides only
├── docusaurus.config.ts       ← site config, navbar, footer
├── sidebars.ts                ← navigation tree (update when adding pages)
└── package.json
```

---

## Repository Boundaries and Sources of Truth

| Repository | Owns |
|---|---|
| `ChurchCRM/marketing` | Marketing strategy, messaging, and asset-governance decisions |
| `ChurchCRM/ChurchCRM.io` | Public marketing site and canonical shared brand assets |
| `ChurchCRM/CRM` | Shipped product behavior and all product screenshot generation / Playwright capture automation |
| `ChurchCRM/docs.churchcrm.io` | Installation, user, administrator, and API documentation |

Read the approved marketing strategy before changing positioning or cross-site journeys. Verify product claims against the current CRM application and releases. The docs site should stay utilitarian and help readers install, use, administer, and integrate ChurchCRM.

### Shared brand assets and product screenshots

- Do not copy shared logos, favicons, app icons, manifests, or default social-preview images into this repository.
- Do not add Playwright, Cypress, browser-automation scripts, seeded screenshot fixtures, or screenshot-capture workflows to this repository.
- Product screenshot generation belongs in `ChurchCRM/CRM`, where screenshots can be captured against the product, its fixtures, and its test stack.
- Reference canonical product screenshots published by the CRM/website asset pipeline rather than committing generated product screenshots here.
- Reference shared brand files hosted by `https://churchcrm.io/` in `docusaurus.config.ts`.
- The website repository owns shared brand files under `static/media/brand/`, `static/media/`, and reusable website image assets.
- Keep a local image here only when it is documentation-specific, has no canonical CRM/website equivalent, and must remain versioned with its instructions (for example, an external-tool screenshot used in a troubleshooting guide).

See [`.agents/skills/brand-assets/SKILL.md`](skills/brand-assets/SKILL.md) before changing logos, icons, favicons, manifests, or social metadata.

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

## Adding Documentation Images / Screenshots

For product UI, reference the canonical screenshot produced by the CRM screenshot pipeline. Do not capture or generate product screenshots from this repository.

A local image under `static/img/` is appropriate only when it is documentation-specific and cannot be sourced canonically from CRM or the website.

Reference a local documentation-only image as:

```md
![alt text](/img/section/filename.png)
```

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

Four sidebars exist: `gettingStartedSidebar`, `userGuideSidebar`, `adminSidebar`, `apiSidebar`.

- `apiSidebar` contains the auto-generated 3rd-party API reference pages (produced by `npm run regen` from the OpenAPI specs). Do not manually edit files inside `docs/api/` except `docs/api/private/index.md` and `docs/api/public/index.md` (the hand-maintained overview pages).

---

## What NOT to Change

- `package.json` / `package-lock.json`
- `.github/workflows/deploy.yml`
- `src/css/custom.css` (unless specifically asked)
- Shared brand-asset URLs in `docusaurus.config.ts` unless the corresponding canonical website asset is verified first
- Product screenshot generation or browser-automation ownership — that belongs in `ChurchCRM/CRM`
