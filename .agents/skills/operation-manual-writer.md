# Operation Manual Writer

> Source: https://skills.sh/atman-33/skills/operation-manual-writer

Creates standardized documentation: manuals, procedures, SOPs, and guides with consistent structure and clear responsibility assignments.

## When to Use

- User-facing how-to guides and procedures
- Admin operation manuals (backup, upgrade, rollback, incident response)
- Step-by-step setup and configuration guides
- Any doc that needs a clear owner, scope, and structured steps

## Workflow

**Step 1: Gather Requirements**
Identify: purpose, target audience, scope, steps involved, and who is responsible.

**Step 2: Create Document**
Lead with the task and useful outcome, then concise numbered steps using exact UI labels.
Add prerequisites, version/environment limits, cautions and related links only when
needed. Use a full SOP structure for procedures that warrant it, not every page.
Read [DOCS_GUIDE.md](../DOCS_GUIDE.md) for the canonical release and media rules.

**Step 3: Format Standards**
- Hierarchical numbering for procedures
- Use direct instructions for required actions; distinguish optional steps and verified limitations.
- Tables and checklists for multi-step decisions
- Admonitions (`:::note`, `:::warning`, `:::danger`) for callouts
- Code blocks with language tags for all commands and file snippets

## ChurchCRM-Specific Conventions

- Target audience: church administrators and end users, not developers
- Assume no command-line knowledge for user-guide pages
- Admin docs may assume basic Linux/server knowledge
- Use "ChurchCRM" not "CRM" in prose
- Link to related pages using relative Docusaurus paths (e.g., `[Backup & Restore](./backup-restore)`)
- Product captures are generated in `ChurchCRM/CRM` and published by `ChurchCRM/visuals` at `https://cdn.churchcrm.io`; link the capture URL, never add local screenshots/videos. Follow DOCS_GUIDE for the shrinking legacy allowlist, SVG diagrams and text descriptions of third-party UI.

### Content that does NOT belong in user-guide or administration pages <!-- learned: 2026-08-20 -->

Never include any of the following in `docs/user-guide/` or `docs/administration/`:

| Wrong content | Where it belongs |
|---|---|
| HTTP endpoint tables (`GET /api/...`) | `docs/api/` — auto-generated from Swagger `@OA\` annotations |
| JSON request/response examples for endpoints | Same — OpenAPI spec pages |
| API authentication instructions for developers | `docs/api/private/index.md` overview |
| ChurchCRM architecture, plugin internals, contributing | GitHub Wiki |

If a feature has an API surface that 3rd-party developers might use, **link** to the Private API reference (`[Private API reference](/api/private)`) rather than duplicating endpoint docs inline. Example:

```md
## For developers

Kiosk admin endpoints are documented in the [Private API reference](/api/private).
All admin endpoints require an authenticated administrator.
```

API docs are regenerated automatically from `@OA\` annotations in the CRM PHP route files — any hand-written endpoint markdown in the docs site will drift and eventually break the build.
