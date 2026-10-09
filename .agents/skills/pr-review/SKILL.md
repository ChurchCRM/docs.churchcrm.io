---
name: pr-review
description: Review a ChurchCRM docs pull request for release workflow and reader voice. Use when reviewing, editing, or opening a pull request in docs.churchcrm.io.
---

# Docs pull request review

Read `.agents/DOCS_GUIDE.md` for the release gate. This skill is the review checklist.

## Which system is this?

Do not mix them in one pull request.

| The code | The docs pull request |
|---|---|
| Merged and in a published ChurchCRM release | Milestone is that version. It may merge when CI is green. |
| Merged, but the release is not published yet | Milestone is that unreleased version. Leave it open. |
| Not merged | Do not document it. |

A `ci`, `repo-maintenance`, `infrastructure`, or `dependencies` label is only for work that does not describe product behavior. Those pull requests have no milestone.

## Voice

The reader is a church administrator or the person who runs the server. Match the ChurchCRM marketing site: warm, practical, and plain. Speak like someone helping a church, not selling software.

Write the current screen and the current task. Name the menu and the button.

Do not write:

- A pitch: world-class, empower, seamlessly, unlock, vendor lock-in, "God's people deserve"
- "If you are reading this on the GitHub Wiki" or any line that explains where the manual moved
- "Whether you are a small church or…" and other filler that could describe any product
- "As of 7.8.0" or "New in 7.8.0" on a page that is the manual for that version. Say what the screen does now
- Developer material: endpoint tables, plugin internals, release process

Say the limit when there is one. Use "you" for their church. Use "we" only for the ChurchCRM project.

## Before approving

- The steps match the merged code, not a proposal
- Links point at docs pages, not the CRM wiki, for user and admin tasks
- A product pull request has the right milestone and no maintenance label
- CI is green. CodeRabbit approval is required by the review rule, and an admin may still merge without waiting
