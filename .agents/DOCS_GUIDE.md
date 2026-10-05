# ChurchCRM Docs — Agent Guide

This file tells AI agents (Claude, Copilot, etc.) everything they need to know to update, create, and reorganize documentation in this repo correctly.

---

## Release Gate — Product Documentation Must Match Released Software

**The public docs site documents released ChurchCRM software, not `master`.**

For any PR that documents product behavior:

1. Identify the CRM issue/PR that implements the behavior.
2. Identify the CRM release milestone containing that implementation.
3. Assign the docs PR to the **same release milestone** (for example `7.7.1` or `7.8.0`).
4. Keep the docs PR open until that exact CRM version has been published as a production GitHub Release.
5. Only after the CRM release exists may the product-doc PR be merged into `main`.

A merged CRM PR is **not** enough. Until the software is released, its documentation must not appear on the public docs site.

Exceptions are repository-only changes that do not describe unreleased product behavior, such as CI, dependency maintenance, agent/skill instructions, site infrastructure, typo fixes, or corrections to documentation for software that is already released.

### Milestone lifecycle

- CRM is the source of truth for release versions.
- Product documentation uses the matching release milestone in `ChurchCRM/docs.churchcrm.io`.
- When CRM publishes a production release, release automation should create/synchronize the next release milestone in both CRM and docs.
- Open docs PRs remain attached to their target release; they are not automatically treated as released just because implementation merged.
- Do not merge a product-doc PR with no release milestone.

---

## Repo Structure

```
docs.churchcrm.io/
├── .agents/
│   └── DOCS_GUIDE.md
├── .github/workflows/
├── docs/
│   ├── index.md
│   ├── installation/
│   ├── getting-started/
│   ├── user-guide/
│   ├── administration/
│   └── api/
├── static/img/
├── src/css/custom.css
├── docusaurus.config.ts
├── sidebars.ts
└── package.json
```

---

## Repository Boundaries and Sources of Truth

| Repository | Owns |
|---|---|
| `ChurchCRM/marketing` | Marketing strategy, messaging, and asset-governance decisions |
| `ChurchCRM/ChurchCRM.io` | Public marketing site and canonical shared brand assets |
| `ChurchCRM/CRM` | Released product behavior and all product screenshot generation / Playwright capture automation |
| `ChurchCRM/docs.churchcrm.io` | Documentation for released installation, user, administrator, and API behavior |

Verify product claims against a **published CRM release**, not merely the current CRM `master` branch.

### Shared brand assets and product screenshots

- Do not copy shared logos, favicons, app icons, manifests, or default social-preview images into this repository.
- Do not add Playwright, Cypress, browser-automation scripts, seeded screenshot fixtures, or screenshot-capture workflows to this repository.
- Product screenshot generation belongs in `ChurchCRM/CRM`.
- Reference canonical product screenshots published by the CRM/website asset pipeline rather than committing generated product screenshots here.
- Keep a local image here only when it is documentation-specific, has no canonical CRM/website equivalent, and must remain versioned with its instructions.

See [`.agents/skills/brand-assets/SKILL.md`](skills/brand-assets/SKILL.md) before changing logos, icons, favicons, manifests, or social metadata.

---

## Editing or Adding Pages

1. Verify the documented behavior exists in a published CRM release.
2. Create/update `docs/<section>/<page>.md`.
3. Add/update `sidebars.ts` when adding pages.
4. Open a PR; do not push product documentation directly to `main`.
5. Assign the matching release milestone for product behavior.
6. CI must pass before merge.

Required front matter:

```md
---
title: Human Readable Title
sidebar_position: 3
---
```

---

## Adding Documentation Images / Screenshots

For product UI, reference the canonical screenshot produced by the CRM screenshot pipeline. Do not capture or generate product screenshots from this repository.

A local image under `static/img/` is appropriate only when it is documentation-specific and cannot be sourced canonically from CRM or the website.

---

## Internal Links

Use relative paths, for example `[Persons](./persons.md)`.

---

## Sidebar Doc IDs

The doc ID is the file path relative to `docs/`, without `.md`.

Four sidebars exist: `gettingStartedSidebar`, `userGuideSidebar`, `adminSidebar`, `apiSidebar`.

`apiSidebar` contains auto-generated API reference pages produced by `npm run regen`. Do not manually edit generated files inside `docs/api/` except the hand-maintained overview pages.

---

## What NOT to Change

- Product behavior docs for software that has not been released
- Product-doc PRs without a matching release milestone
- `package.json` / `package-lock.json` unless specifically required
- `src/css/custom.css` unless specifically asked
- Product screenshot generation or browser-automation ownership — that belongs in `ChurchCRM/CRM`
