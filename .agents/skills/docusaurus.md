# Docusaurus Expert

> Source: https://skills.sh/anton-abyzov/specweave/docusaurus

Expert in Docusaurus 3.x documentation framework — the modern static site generator for technical documentation, blogs, and landing pages.

## Competency Areas

**1. Site Setup & Configuration**
- Installation with templates
- `docusaurus.config.ts` best practices
- Plugins for content, search, analytics, sitemap
- Theme options: Classic, Material, custom themes
- Deployment to GitHub Pages, Netlify, Vercel, AWS

**2. Content Authoring**
- Standard Markdown with Docusaurus extensions
- MDX for React components in Markdown
- Syntax highlighting and live code editors
- Admonitions (notes, tips, warnings, danger alerts)
- Tabs for multi-language and platform-specific content

**3. Advanced Features**
- Multi-version documentation management
- Internationalization and localization (i18n)
- Algolia DocSearch and local search plugins
- Mermaid diagram support via @docusaurus/theme-mermaid
- OpenAPI documentation with docusaurus-plugin-openapi-docs

**4. Customization**
- Custom React components for documentation
- CSS modules and Tailwind CSS integration
- Theme component swizzling
- Custom plugin development

## ChurchCRM-Specific Overrides

- **Deployment**: GitHub Pages via `.github/workflows/deploy.yml` — push to `main`, live in ~90 seconds. Do not modify the workflow.
- **Sidebars**: Four fixed sidebars (`gettingStartedSidebar`, `userGuideSidebar`, `adminSidebar`, `apiSidebar`). Always update `sidebars.ts` when adding pages.
- **Deployment**: Site is live at https://docs.churchcrm.io — push to `main` and the GitHub Action deploys to `gh-pages` branch automatically.
- **Styling**: Do not edit `src/css/custom.css` unless specifically asked.
- **Images**: All screenshots go in `static/img/<section>/`. No images in `docs/`.
- **Front matter**: `title` and `sidebar_position` are required on every page.
- **MDX**: `.md` extension is standard. Use `.mdx` only if you need React components inline.
- **Versioning**: Not in use. Do not add versioned docs without explicit instruction.
- **Search**: Not yet configured. Check DOCS_GUIDE.md for current status before adding.
- **Audience — three tiers, three homes** (see content-architecture skill):
  - **End users** → `docs/user-guide/` and `docs/administration/` — plain language, no HTTP endpoints, no code.
  - **3rd-party app developers** (API consumers) → `docs/api/` — driven by the OpenAPI spec via `docusaurus-plugin-openapi-docs`; hand-written overview pages (`index.md`) are allowed for auth context and role tables, but individual endpoint docs must come from the spec.
  - **ChurchCRM core developers** → GitHub Wiki only — architecture, plugin internals, contributing guidelines, ADRs.
  - Never mix tiers: no raw API endpoints in user-guide pages, no contributor/architecture content in the docs site.

---

## Known Gotchas <!-- learned: 2026-08-20 -->

### Curly braces in MDX headings cause `ReferenceError` at build time

MDX 3 (used by Docusaurus 3.x) treats bare `{...}` as JSX expressions **everywhere** — including headings. Writing:

```md
### GET /api/groups/{id}/emails
```

produces `ReferenceError: id is not defined` during SSG and breaks the CI build.

**Fix:** escape with backslash inside headings and plain prose:

```md
### GET /api/groups/\{id\}/emails
```

This renders as literal `{id}` in the browser. No escaping is needed inside backtick code spans (`` `/api/groups/{id}/emails` ``), fenced code blocks, or JSON examples — the MDX parser does not evaluate those.

**Rule of thumb:** Any `{variable}` outside a code span or code block in a `.md`/`.mdx` file must be `\{variable\}` or wrapped in backticks.

### API reference section in `kiosk-devices.md` (and similar user-guide pages)

Raw HTTP endpoint tables with request/response JSON belong in `docs/api/`, not `docs/user-guide/`. User-guide pages should describe *what the feature does for the user* and link to the API reference for integrators. See the content-architecture audience tiers above.
