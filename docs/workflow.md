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

The release gate stays red on a product pull request until that exact version is a published stable release. Leave the pull request open. That is how unpublished work is staged.

## When a ChurchCRM version ships

1. A daily job opens a pull request that points the API reference at the new release tag.
2. Merge that pin pull request first. The site then documents that version's API, and the docs repo is tagged `v<version>`.
3. Re-run the checks on the product pull requests for that milestone. Merge a pull request when the site build and the release gate are green.

The API reference does not track the CRM `master` branch. `crm-release.json` is the version the site builds.

## Where to get help

If these docs do not answer the question, ask in [Discord](https://discord.gg/tuWyFzj3Nj). For a bug, or a gap in the product, [open an issue](https://github.com/ChurchCRM/CRM/issues/new/choose) on the ChurchCRM repository.
