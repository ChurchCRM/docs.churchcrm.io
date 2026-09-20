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
│   └── img/                   ← all images, grouped by section
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
| `ChurchCRM/CRM` | Shipped product behavior and product-generated screenshots |
| `ChurchCRM/docs.churchcrm.io` | Installation, user, administrator, and API documentation |

Read the approved marketing strategy before changing positioning or cross-site journeys. Verify product claims against the current CRM application and releases. The docs site should stay utilitarian and help readers install, use, administer, and integrate ChurchCRM.

### Shared brand assets

- Do not copy shared logos, favicons, app icons, manifests, or default social-preview images into this repository.
- Reference the canonical files hosted by `https://churchcrm.io/` in `docusaurus.config.ts`.
- The website repository owns those files under `static/media/brand/`, `static/media/`, and `static/images/screenshots/`.
- Update a shared asset in the website repository so every consuming site receives the same approved version.
- Reuse current product screenshots from `https://churchcrm.io/images/screenshots/` when they match the documented workflow.
- Keep a local image here only when it is documentation-specific, has no canonical website equivalent, and must remain versioned with its instructions.

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

1. Place in `static/img/<section>/filename.png`
2. Reference as: `![alt text](/img/section/filename.png)`

This applies to documentation-specific screenshots and diagrams that have no canonical website equivalent. Shared ChurchCRM brand assets and reusable product screenshots must stay in the website repository and be referenced by canonical URL.

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
