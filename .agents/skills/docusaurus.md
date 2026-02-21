# Docusaurus (upstream skill)

> Upstream: https://skills.sh/anton-abyzov/specweave/docusaurus
> Repo overrides: See DOCS_GUIDE.md for ChurchCRM-specific conventions

Use the upstream skill for general Docusaurus guidance (setup, MDX, search, versioning, deployment).

## ChurchCRM-Specific Overrides

- **Deployment**: GitHub Pages via `.github/workflows/deploy.yml` — push to `main`, live in ~90 seconds. Do not modify the workflow.
- **Sidebars**: Four fixed sidebars (`gettingStartedSidebar`, `userGuideSidebar`, `adminSidebar`, `devSidebar`). Always update `sidebars.ts` when adding pages.
- **Styling**: Do not edit `src/css/custom.css` unless specifically asked.
- **Images**: All screenshots go in `static/img/<section>/`. No images in `docs/`.
- **Front matter**: `title` and `sidebar_position` are required on every page.
- **MDX**: `.md` extension is standard here. Use `.mdx` only if you need React components inline.
- **Versioning**: Not currently in use. Do not add versioned docs without explicit instruction.
- **Search**: Not yet configured. Check DOCS_GUIDE for current status before adding.
