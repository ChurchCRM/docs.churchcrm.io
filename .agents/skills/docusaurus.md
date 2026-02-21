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
- **Sidebars**: Three fixed sidebars (`gettingStartedSidebar`, `userGuideSidebar`, `adminSidebar`). Always update `sidebars.ts` when adding pages.
- **Styling**: Do not edit `src/css/custom.css` unless specifically asked.
- **Images**: All screenshots go in `static/img/<section>/`. No images in `docs/`.
- **Front matter**: `title` and `sidebar_position` are required on every page.
- **MDX**: `.md` extension is standard. Use `.mdx` only if you need React components inline.
- **Versioning**: Not in use. Do not add versioned docs without explicit instruction.
- **Search**: Not yet configured. Check DOCS_GUIDE.md for current status before adding.
- **Audience**: End-user manual only — no developer docs. Developer content stays on the GitHub wiki.
