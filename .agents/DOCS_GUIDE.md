# ChurchCRM Docs — Agent Guide

This file tells AI agents (Claude, Copilot, etc.) everything they need to know to update, create, and reorganize documentation in this repo correctly.

---

## Workflow

The public site documents **released** ChurchCRM. A merged CRM pull request is not a release. Humans and agents follow the same rules. The short version for readers of the site is [Docs workflow](/workflow).

### Decide what kind of change this is

| Change | Milestone | Label | When it may merge |
|---|---|---|---|
| Product behavior: install, admin, user guide, screenshots of the app | The CRM version that will ship it, for example `7.8.0` | none | After that version is a published stable GitHub Release, and after the API pin pull request for that version if one is open |
| Correction to docs for software that is already released | That published version, for example `7.7.1` | none | Immediately, because the release already exists |
| CI, dependencies, agent instructions, site infrastructure, typos that do not describe new product behavior | **none** | `ci`, `repo-maintenance`, `infrastructure`, or `dependencies` | When CI is green |

Do not put infrastructure on the latest product milestone. A version milestone means "this pull request documents that release." The latest published milestone is already released, so the gate would pass and unreleased behavior could reach the site.

`release-gate.yml` is the check that blocks a merge. It fails when a pull request has no milestone and none of those labels. It also fails when the milestone is not a published stable `x.y.z` release of `ChurchCRM/CRM`.

### Product docs before the release

1. Confirm the behavior in the CRM pull request and the milestone that pull request targets.
2. Open the docs pull request against `main`. Set the **same** milestone. Do not add a maintenance label.
3. Leave it open. The failing release gate is the staging area. Do not merge it to "get it ready."
4. When ChurchCRM publishes that version, `release-publish.yml` or `release-bookkeeping.yml` dispatches `crm-released`. The docs workflow creates the milestone and opens the API pin pull request. It merges that pin, and any other open pull request on the milestone, only when every CI check is successful and the latest CodeRabbit review is approved. A pull request that fails either wait stays open. A daily run does the same if the dispatch did not arrive.
5. Do not merge those pull requests by hand unless the automation reports that it could not.

`Sync docs release milestones` creates the docs milestone for the version in CRM `package.json` and for the latest stable release when either is missing. If the milestone you need does not exist yet, run that workflow with the version, or create the `x.y.z` milestone by hand. Do not invent a non-version milestone.

### API reference, tags, and deploy

`crm-release.json` is the ChurchCRM version the API reference documents. CI and GitHub Pages download `docs/openapi/generated/*.yaml` from that tag. They do not read `master`.

A push to `main` runs `deploy.yml` and publishes the site. Do not push `gh-pages`. There is no daily rebuild from `master`.

When `crm-release.json` changes on `main`, `tag-docs-release.yml` creates annotated tag `v<version>` and points branch `release/<version>` at that commit. Use the tag to see the docs as published for that release. Do not commit onto `release/*`.

Shell that the workflows call lives in `scripts/` and `scripts/ci/`. Run those scripts locally with the same environment variables. Do not put new multi-line shell back into the workflow files.

### Support path in the docs

Readers who cannot find an answer are sent to [Discord](https://discord.gg/tuWyFzj3Nj), then to a new issue on `ChurchCRM/CRM`. Do not send them to GitHub Discussions, and do not add a floating button to the marketing site. The line is the doc-page footer and the site footer. Keep new pages consistent with that.

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
4. Open a pull request against `main`. Do not push product documentation directly to `main`.
5. Set the milestone or maintenance label from the workflow table above.
6. CI, including the release gate, must pass before merge.

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
- Product-doc pull requests with no release milestone, or with a maintenance label
- Infrastructure pull requests placed on a product milestone
- `package.json` / `package-lock.json` unless specifically required
- `src/css/custom.css` unless specifically asked
- Product screenshot generation or browser-automation ownership — that belongs in `ChurchCRM/CRM`
