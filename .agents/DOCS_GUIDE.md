# ChurchCRM Docs — Agent Guide

This file tells AI agents (Claude, Copilot, etc.) everything they need to know to update, create, and reorganize documentation in this repo correctly.

## Release truth is the merge gate

`docs.churchcrm.io` documents **released ChurchCRM software**, not `master` and not feature branches.

- A product-feature documentation PR may be opened before the feature ships, but it must **not merge** until the ChurchCRM release containing that feature is published.
- Every product-feature documentation PR must have a docs-repo milestone matching the CRM release milestone that owns the implementation, for example `7.7.1` or `7.8.0`.
- A merged CRM PR is **not sufficient**. If the corresponding ChurchCRM release/tag is not published yet, keep the docs PR open.
- If one docs PR covers implementation split across multiple CRM releases, split the docs PR by release. Do not publish future behavior early.
- Documentation-only corrections to behavior already present in the latest published release use the next docs-maintenance milestone for that released line.
- Repository/tooling-only changes that do not describe product behavior (CI, authoring guidance, dependency maintenance) are not release-gated.
- Before merging product docs, verify the implementation PR is merged, identify its CRM milestone, and verify that matching GitHub Release exists in `ChurchCRM/CRM`.

This policy exists because the docs site deploys from `main`: merging documentation publishes it immediately.

## Repo Structure

```
docs.churchcrm.io/
├── .agents/DOCS_GUIDE.md
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

## Repository Boundaries and Sources of Truth

| Repository | Owns |
|---|---|
| `ChurchCRM/marketing` | Marketing strategy, messaging, and asset-governance decisions |
| `ChurchCRM/ChurchCRM.io` | Public marketing site and canonical shared brand assets |
| `ChurchCRM/CRM` | Shipped product behavior, release milestones, releases, and product screenshot generation |
| `ChurchCRM/docs.churchcrm.io` | Documentation for released software |

Verify product claims against the **published CRM release**, not merely current `master`.

### Shared brand assets and product screenshots

- Do not copy shared logos, favicons, app icons, manifests, or default social-preview images into this repository.
- Do not add Playwright, Cypress, browser-automation scripts, seeded screenshot fixtures, or screenshot-capture workflows to this repository.
- Product screenshot generation belongs in `ChurchCRM/CRM`.
- Reference canonical product screenshots published by the CRM/website asset pipeline rather than committing generated product screenshots here.
- Keep a local image only when it is documentation-specific, has no canonical CRM/website equivalent, and must remain versioned with its instructions.

## Editing and adding pages

1. Edit or create `docs/<section>/<page>.md`.
2. New pages need `title` and `sidebar_position` front matter.
3. Add new pages to the appropriate sidebar in `sidebars.ts`.
4. Open a PR. Do not push product documentation directly to `main`.
5. For product docs, assign the matching release milestone and wait until that CRM release is published.
6. CI must pass before merge.

## Adding Documentation Images / Screenshots

For product UI, reference the canonical screenshot produced by the CRM screenshot pipeline. Do not capture or generate product screenshots from this repository.

A local image under `static/img/` is appropriate only when it is documentation-specific and cannot be sourced canonically from CRM or the website.

```md
![alt text](/img/section/filename.png)
```

## Internal Links

Use relative paths:

```md
[Persons](./persons.md)
[Upgrade Guide](../administration/upgrade.md)
```

## Callout Boxes

Use Docusaurus `tip`, `warning`, and `danger` admonitions when they change what the reader should do.

## Sidebar Doc IDs

The doc ID is the file path relative to `docs/`, without `.md`. Four sidebars exist: `gettingStartedSidebar`, `userGuideSidebar`, `adminSidebar`, and `apiSidebar`.

`apiSidebar` contains generated API reference pages from CRM OpenAPI specs. Do not manually edit generated endpoint pages.

## What NOT to Change casually

- `package.json` / `package-lock.json`
- `.github/workflows/deploy.yml`
- `src/css/custom.css`
- Shared brand-asset URLs without verifying the canonical website asset
- Product screenshot generation/browser automation ownership
