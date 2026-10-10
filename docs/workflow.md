---
title: Docs workflow
sidebar_label: Docs workflow
sidebar_position: 20
---

# How this documentation is published

docs.churchcrm.io describes ChurchCRM that has been released. A change in the CRM repository does not show up here until that version is a stable GitHub Release and the matching docs pull request is merged.

Agents follow the same rules in [`.agents/DOCS_GUIDE.md`](https://github.com/ChurchCRM/docs.churchcrm.io/blob/main/.agents/DOCS_GUIDE.md).

## What to set on the pull request

| You are changing | Milestone | Label |
|---|---|---|
| How the released or upcoming app behaves | The ChurchCRM version, such as `7.8.0` | none |
| A fix to docs for a version that is already out | That version, such as `7.7.1` | none |
| CI, dependencies, or the docs site itself | none | `ci`, `repo-maintenance`, `infrastructure`, or `dependencies` |

Do not use the latest product milestone for site or CI work. That milestone means the pull request documents that release, and the release gate would allow it to merge.

## Docs for a release that is not published yet

Open the pull request against `release-docs/<version>`, for example `release-docs/7.8.0`, not `main`. Ask a maintainer to create the branch if it does not exist yet.

1. The site build runs on the pull request. The release gate does not, because it guards `main`.
2. When the pull request is approved, merge it into the release branch. Merge each one as it is ready; they do not need to wait for each other or for the release.
3. Name the ChurchCRM tracking issue in the description, for example `Closes ChurchCRM/CRM#9922`. It is closed when the pull request merges into the release branch. GitHub would otherwise close it only after a merge into `main`.

Nothing reaches the public site from `release-docs/<version>`. Leave the milestone set to the version.

## When a ChurchCRM version ships

1. `release-docs/<version>` is merged into `main` as one pull request, after the site build and the release gate are green. The gate is re-run once the version is published.
2. A pull request then points the API reference at the new release tag. It is merged second, so it starts from the `main` that holds the release docs. The site then documents that version's API, and the docs repo is tagged `v<version>`.
3. A maintainer creates `release-docs/<next version>` from `main`, so the next docs pull requests have a place to land. For now this, and setting `crm-release.json` to the new version before step 1, are done by hand. They are listed in `DOCS_GUIDE.md`.

A pull request opened against `main` for an unpublished version still works the old way. The release gate stays red until the version is published, and it merges after that. Prefer the release branch.

The API reference does not track the CRM `master` branch. `crm-release.json` is the version the site builds.

## Where to get help

If these docs do not answer the question, ask in [Discord](https://discord.gg/tuWyFzj3Nj). For a bug, or a gap in the product, [open an issue](https://github.com/ChurchCRM/CRM/issues/new/choose) on the ChurchCRM repository.
