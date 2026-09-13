---
name: churchcrm-docs
description: Create or edit the ChurchCRM Docusaurus user and administrator documentation. Use for docs pages, navigation, screenshots, or generated API documentation in this repository.
---

# ChurchCRM documentation

Write for church administrators and end users in plain language. Put installation and server operations in `docs/installation/` or `docs/administration/`, product workflows in `docs/user-guide/`, and onboarding in `docs/getting-started/`.

The API reference under `docs/api/` is generated from the CRM OpenAPI specifications. Do not hand-edit generated endpoint pages. The two section overview files, `docs/api/private/index.md` and `docs/api/public/index.md`, may be edited for orientation and authentication context. Core architecture, plugin internals, contribution guidance, and ADRs belong in the CRM GitHub Wiki.

## Page changes

- Preserve existing page structure unless the task calls for a reorganization.
- New pages need `title` and `sidebar_position` frontmatter and an entry in the appropriate fixed sidebar in `sidebars.ts`.
- Use relative links for documentation pages.
- Put screenshots in `static/img/<section>/` and use descriptive alt text.
- Use Docusaurus admonitions only when a note, warning, or danger changes what the reader should do.
- Keep commands and configuration exact; verify them against the current CRM repository or published requirements rather than copying older docs.

## MDX constraint

Docusaurus MDX treats bare `{name}` outside code as a JSX expression. Escape it as `\{name\}` in headings and prose, or place it in a code span. Fenced code blocks need no escaping.

## Validation

Run `npm run build` after content, navigation, configuration, or link changes. Run `npm run typecheck` when TypeScript files change. Use `npm run regen` only when intentionally regenerating the API reference from updated OpenAPI inputs.

Do not edit the deployment workflow, theme CSS, logo, or favicon unless the task explicitly requires it. Deployments run from `main`; never edit `gh-pages` directly.
