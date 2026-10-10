# ChurchCRM Docs — Agent Guide

This file tells AI agents (Claude, Copilot, etc.) everything they need to know to update, create, and reorganize documentation in this repo correctly.

---

## Workflow

The public site documents **released** ChurchCRM. A merged CRM pull request is not a release. Humans and agents follow the same rules. The short version for readers of the site is [Docs workflow](/workflow).

### Decide what kind of change this is

| Change | Milestone | Label | When it may merge |
|---|---|---|---|
| Product behavior: install, admin, user guide, screenshots of the app | The CRM version that will ship it, for example `7.8.0` | none | Into `release-docs/<version>` when approved. That branch reaches `main` as one pull request after the version is a published stable GitHub Release, and the API pin pull request follows it |
| Correction to docs for software that is already released | That published version, for example `7.7.1` | none | Immediately, because the release already exists |
| CI, dependencies, agent instructions, site infrastructure, typos that do not describe new product behavior | **none** | `ci`, `repo-maintenance`, `infrastructure`, or `dependencies` | When CI is green |

Do not put infrastructure on the latest product milestone. A version milestone means "this pull request documents that release." The latest published milestone is already released, so the gate would pass and unreleased behavior could reach the site.

`release-gate.yml` is the check that blocks a merge. It fails when a pull request has no milestone and none of those labels. It also fails when the milestone is not a published stable `x.y.z` release of `ChurchCRM/CRM`.

### Product docs before the release

1. Confirm the behavior in the CRM pull request and the milestone that pull request targets.
2. Open the docs pull request against `release-docs/<version>`, for example `release-docs/7.8.0`, not `main`. Ask a maintainer to create the branch if it does not exist. Set the **same** milestone. Do not add a maintenance label.
3. Name the CRM docs tracking issue in the description as `Closes ChurchCRM/CRM#N`. When the pull request merges into the release branch, that issue is closed. Merge each pull request into the release branch as soon as it is approved. The site build runs on it. The release gate guards `main`, so it does not run here.
4. When ChurchCRM publishes that version, `release-publish.yml` or `release-bookkeeping.yml` dispatches `crm-released`. The docs workflow creates the milestone, opens `release-docs/<version>` as one pull request into `main`, and merges it when the site build and the released-software gate are successful. It then opens and merges the API pin pull request. A daily run does the same if the dispatch did not arrive.
5. Do not merge the release pull request by hand unless the automation reports that it could not.

Two steps are manual for now. A maintainer does them when the CRM release is published:

1. **Pin the version on the release branch.** Before the release pull request merges, set `crm-release.json` on `release-docs/<version>` to `<version>` and push. The navbar, footer and API reference then match the pages in the same merge. The release tag must exist, because CI downloads the API specs from it. The API pin pull request that follows is then empty and can be closed.
2. **Start the next release branch.** After the release pull request merges, create `release-docs/<next version>` from `main`:
   ```bash
   gh api repos/ChurchCRM/docs.churchcrm.io/git/refs \
     -f ref=refs/heads/release-docs/<next version> \
     -f sha=$(gh api repos/ChurchCRM/docs.churchcrm.io/git/ref/heads/main --jq .object.sha)
   ```
   Until it exists, docs for the next version have nowhere to go.

The site shows the release it describes in the navbar and the footer. It comes from `crm-release.json`, which the API pin pull request moves. Pages therefore do not say "since" or "new in" a version.

`Sync docs release milestones` creates the docs milestone for the version in CRM `package.json` and for the latest stable release when either is missing. If the milestone you need does not exist yet, run that workflow with the version, or create the `x.y.z` milestone by hand. Do not invent a non-version milestone.

### API reference, tags, and deploy

`crm-release.json` is the ChurchCRM version the API reference documents. CI and GitHub Pages download `docs/openapi/generated/*.yaml` from that tag. They do not read `master`.

A push to `main` runs `deploy.yml` and publishes the site. Do not push `gh-pages`. There is no daily rebuild from `master`.

When `crm-release.json` changes on `main`, `tag-docs-release.yml` creates annotated tag `v<version>` and points branch `release/<version>` at that commit. Use the tag to see the docs as published for that release. Do not commit onto `release/*`.

Shell that the workflows call lives in `scripts/` and `scripts/ci/`. Run those scripts locally with the same environment variables. Do not put new multi-line shell back into the workflow files.

### Voice

The reader is a church administrator or the person who runs the server. Write the way the marketing site does: warm, practical, and plain. Name the menu, the button, and the task. Do not pitch the product, do not mention the GitHub Wiki, and do not label a step "New in 7.8.0" when the page itself is the manual for that version.

Reviewers use `.agents/skills/pr-review/SKILL.md`. A docs pull request is not ready while it mixes a change that can merge today with one that must wait for a release.

### Support path in the docs

Readers who cannot find an answer are sent to [Discord](https://discord.gg/tuWyFzj3Nj), then to a new issue on `ChurchCRM/CRM`. Do not send them to GitHub Discussions, and do not add a floating button to the marketing site. The line is the doc-page footer and the site footer. Keep new pages consistent with that.

---

## Repo Structure

```
docs.churchcrm.io/
├── .agents/
│   ├── DOCS_GUIDE.md
│   └── skills/pr-review/SKILL.md
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
- Link product screenshots from `https://cdn.churchcrm.io`, published by `ChurchCRM/visuals`. Never commit one here. `scripts/check-visuals.mjs` fails CI on an image or video file that is not in `scripts/legacy-screenshots.txt`.
- A diagram is an SVG. There are no other exceptions: a screenshot of a third-party tool (phpMyAdmin, a hosting panel) is described in text.

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

Screenshots are captures, not files. `ChurchCRM/CRM` captures every workflow in 8 languages and 3 sizes, and `ChurchCRM/visuals` publishes the set for the current release at `https://cdn.churchcrm.io`. Its `manifest.json` lists each capture with its `name`, `title`, `category` and `purpose`.

Link one like this:

```md
![Where to click on the Church Information page](https://cdn.churchcrm.io/screenshots/en/desktop/admin-church-logo.png)
```

- Use `en`. The size is `desktop`, `tablet` or `mobile`. A dark variant ends in `-dark`.
- The alt text says what to look at, not "screenshot of".
- `scripts/legacy-screenshots.txt` lists the images still stored in `static/img/`. The list only shrinks: when a page switches to a capture, delete the file and its line. Never add a line.

**Planning a docs PR that needs a screenshot:**

1. Search `manifest.json` for the screen. If a capture exists, link it. You are done.
2. If not, the screen needs a capture in `ChurchCRM/CRM`: a spec in `playwright/workflows/` whose `captureScreen()` name becomes the file name. For a new feature, the feature PR carries it. For a feature that already shipped without one, add it to the CRM capture issue.
3. Write the docs PR against `release-docs/<version>`, linking the name the capture will have. The CDN has it only after the release is published, so the link is not live while the PR is open. CI warns about it on a `release-docs/*` PR and fails on `main`. By the time the release PR reaches `main` it is live.
4. Do not attach a PNG "for now". If the page reads fine without the picture until the capture exists, leave the picture out.

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
